<?php

//======================================================
// Copyright (C) 2004 John W. Holmes, All Rights Reserved
//
// This file is part of the Unit Command Climate
// Assessment and Survey System (UCCASS)
//
// UCCASS is free software; you can redistribute it and/or
// modify it under the terms of the Affero General Public License as
// published by Affero, Inc.; either version 1 of the License, or
// (at your option) any later version.
//
// http://www.affero.org/oagpl.html
//
// UCCASS is distributed in the hope that it will be
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty
// of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// Affero General Public License for more details.
//======================================================

class UCCASS_SurveyAdmin extends UCCASS_Main {

    function __construct() {
        $this->load_configuration();
    }

    /*
     * ADMIN PAGE 
     */

    function admin() {
        $data = array();
        $template = 'admin.tpl';

        $admin_priv = $this->_CheckLogin(0, ADMIN_PRIV, 'admin.php');

        if (!$admin_priv) {
            $template = 'login.tpl';
            if (isset($_REQUEST['password'])) {
                $data['message'] = 'Incorrect Username and/or Password';
                $data['username'] = $this->SfStr->getSafeString($_REQUEST['username'], SAFE_STRING_TEXT, 1);
            }
            $data['page'] = 'admin.php';
        } elseif (isset($_REQUEST['action']) && $_REQUEST['action'] == 'change_password') {
            // Allow user to change password.
            $this->change_password();
            $data = null;
            $template = 'admin_change_password.tpl';
        } else {
            //Process list of users upon submit
            //Return value is list of bad uids
            if (isset($_REQUEST['update_admin_users'])) {
                $this->update_admin_users();
            }

            if (isset($_SESSION['update_admin_users']['erruid'])) {
                $erruid = $_SESSION['update_admin_users']['erruid'];
                unset($_SESSION['update_admin_users']['erruid']);
            }

            $survey = array();

            $query = "SELECT sid, name FROM {$this->CONF['db_tbl_prefix']}surveys ORDER BY name ASC";
            $rs = $this->db->Execute($query);
            if ($rs === FALSE) {
                $this->error("Error selecting surveys: " . $this->db->ErrorMsg());
            }
            while ($r = $rs->FetchRow()) {
                $data['survey']['sid'][] = $r['sid'];
                $data['survey']['name'][] = $this->SfStr->getSafeString($r['name'], SAFE_STRING_TEXT);
            }

            //Select users with Admin and Create privileges
            $query = "SELECT uid, name, email, username, password, admin_priv, create_priv FROM
                      {$this->CONF['db_tbl_prefix']}users WHERE sid=0 ORDER BY username ASC";
            $rs = $this->db->Execute($query);
            if ($rs === FALSE) {
                $this->error('Unable to get user permissions: ' . $this->db->ErrorMsg());
                return;
            }
            $x = 0;
            while ($r = $rs->FetchRow($rs)) {
                $data['users'][$x]['uid'] = $r['uid'];
                $data['users'][$x]['name'] = $this->SfStr->getSafeString($r['name'], SAFE_STRING_TEXT);
                $data['users'][$x]['email'] = $this->SfStr->getSafeString($r['email'], SAFE_STRING_TEXT);
                $data['users'][$x]['username'] = $this->SfStr->getSafeString($r['username'], SAFE_STRING_TEXT);
                $data['users'][$x]['password'] = $this->SfStr->getSafeString($r['password'], SAFE_STRING_TEXT);
                if ($r['admin_priv']) {
                    $data['users'][$x]['admin_selected'] = ' checked';
                }
                if ($r['create_priv']) {
                    $data['users'][$x]['create_selected'] = ' checked';
                }
                if (isset($erruid[$r['uid']])) {
                    $data['users'][$x]['erruid'] = 1;
                }

                $x++;
            }

            for ($y = 0; $y < 5; $y++) {
                $data['users'][$x++]['uid'] = 'x' . $y;
            }
        }

        $this->smarty->assign_by_ref('data', $data);
        $retval = $this->smarty->Fetch($this->template . '/' . $template);

        return $retval;
    }

    /*
     * UPDATE ADMIN USERS *
     */
    function update_admin_users() {
        $retval = FALSE;
        $errmsg = array();
        $erruid = array();

        $this_username = $this->findCurrentUsersUsername();
        $uber_admin = $this->can_we_change_passwords($this_username);

        if (!isset($_REQUEST['admin_priv'])) {
            $this->error('Must have at least one administrator.');
            return;
        } elseif (isset($_REQUEST['delete'])) {
            $numadmins = array_diff(array_keys($_REQUEST['admin_priv']), array_keys($_REQUEST['delete']));
            if (is_array($numadmins) && count($numadmins) == 0) {
                $this->error('Cannot delete all admin users');
                return;
            }

            foreach ($_REQUEST['delete'] as $uid => $val) {
                if ($uid{0} != 'x') {
                    if ($uber_admin || !$this->is_user_admin($uid)) {
                        $rs = $this->delete_user($uid);
                        if ($rs === FALSE) {
                            $username = $this->SfStr->getSafeString($_REQUEST['username'][$uid], SAFE_STRING_TEXT);
                            $errmsg[0] = "Cannot delete $username: " . $this->db->ErrorMsg();
                            $erruid[] = $uid;
                        } else {
                            $this->log("Removed User : " . $_REQUEST['username'][$uid]);
                        }
                    }
                } else {
                    unset($_REQUEST['name'][$uid]);
                }
            }
        }

        $fieldnames = array("name", "username", "email", "password", "salt", "admin_priv", "create_priv");

        foreach ($_REQUEST['name'] as $uid => $name) {
            if (empty($name) && empty($_REQUEST['email'][$uid]) && empty($_REQUEST['username'][$uid]) && empty($_REQUEST['password'][$uid])) {
                if ($uid{0} != 'x') {
                    $rs = $this->delete_user($uid);
                    if ($rs === FALSE) {
                        $errmsg[0] = "Cannot delete user with uid: $uid. Reason: " . $this->db->ErrorMsg();
                        $erruid[$uid] = 1;
                    }
                }
            } else {
                $input = array();

                $input['uid'] = (int) $uid;
                $input['name'] = $this->SfStr->getSafeString($name, SAFE_STRING_DB);
                $input['email'] = $this->SfStr->getSafeString($_REQUEST['email'][$uid], SAFE_STRING_DB);

                if (!empty($_REQUEST['username'][$uid])) {
                    $chkuid = $this->check_username_no_sid($_REQUEST['username'][$uid]);
                    if ($chkuid && $chkuid != $input['uid']) {
                        $errmsg[1] = "Username '{$this->SfStr->getSafeString($_REQUEST['username'][$uid], SAFE_STRING_TEXT)}' already in use.";
                        $erruid[$uid] = 1;
                    } else {
                        $input['username'] = $this->SfStr->getSafeString($_REQUEST['username'][$uid], SAFE_STRING_DB);
                    }
                } else {
                    $errmsg[1] = 'Username cannot be blank.';
                    $erruid[$uid] = 1;
                }

                // Make sure users cannot have blank passwords.
                $query = "SELECT password FROM {$this->CONF['db_tbl_prefix']}users WHERE uid=$uid";
                $rs = $this->db->Execute($query);
                if ($rs !== FALSE) {
                    $user_data = $rs->FetchRow($rs);

                    if (empty($user_data['password']) && empty($_REQUEST['password'][$uid]) && empty($_REQUEST['delete'][$uid])) {
                        $errmsg[2] = 'Password cannot be blank.';
                        $erruid[$uid] = 1;
                    }
                } elseif (!is_numeric($uid) && empty($_REQUEST['password'][$uid])) {
                    $errmsg[2] = 'Password cannot be blank.';
                    $erruid[$uid] = 1;
                }


                if (!empty($_REQUEST['password'][$uid])) {
                    $password = $_REQUEST['password'][$uid];
                    list($password, $salt) = $this->generateSaltedPassword($password);
                    $input['password'] = $this->SfStr->getSafeString($password, SAFE_STRING_DB);
                    $input['salt'] = $this->SfStr->getSafeString($salt, SAFE_STRING_DB);
                }

                if ($uber_admin) {
                    $input['admin_col'] = 'admin_priv,';
                    if (isset($_REQUEST['admin_priv'][$uid])) {
                        $input['admin_priv'] = '1,';
                        $input['admin_update'] = 'admin_priv=1,';
                    } else {
                        $input['admin_priv'] = '0,';
                        $input['admin_update'] = 'admin_priv=0,';
                    }
                } else {
                    $input['admin_col'] = '';
                    $input['admin_update'] = '';
                }

                if ($uber_admin) {
                    $input['create_col'] = 'create_priv,';
                    if (isset($_REQUEST['create_priv'][$uid])) {
                        $input['create_priv'] = '1,';
                        $input['create_update'] = 'create_priv=1,';
                    } else {
                        $input['create_priv'] = '0,';
                        $input['create_update'] = 'create_priv=0,';
                    }
                } else {
                    $input['create_col'] = '';
                    $input['create_update'] = '';
                }

                if (!isset($erruid[$uid])) {
                    $add = 0;

                    if ($uid{0} == 'x') {
                        $uid = $this->db->GenID($this->CONF['db_tbl_prefix'] . 'users_sequence');
                        $query = "INSERT INTO {$this->CONF['db_tbl_prefix']}users
                                  ({$input['create_col']} {$input['admin_col']} uid, sid, name, email, username, password, salt)
                                  VALUES ({$input['create_priv']} {$input['admin_priv']} $uid, 0, {$input['name']},
                                  {$input['email']},{$input['username']},{$input['password']},{$input['salt']})";

                        $add = 1;
                    } else {
                        $query = "UPDATE {$this->CONF['db_tbl_prefix']}users SET {$input['create_update']} {$input['admin_update']} name = {$input['name']}, email = {$input['email']}, username = {$input['username']} WHERE uid = {$input['uid']} AND sid=0";
                    }


                    $oldquery = "SELECT username, email, name, password, admin_priv, create_priv, uid, salt FROM {$this->CONF['db_tbl_prefix']}users WHERE uid={$input['uid']}";
                    $oldrs = $this->db->Execute($oldquery);

                    $rs = $this->db->Execute($query);

                    if ($rs === FALSE) {
                        $errmsg[$uid] = 'Error updating/inserting user data: ' . $this->db->ErrorMsg() . $query;
                    } else {
                        //LOG addition of new user, setting of their properties or modifying existing users properties
                        if ($add) {
                            $this->log("Added user : " . $input["username"]);
                        }
                        if ($oldrs !== FALSE) {
                            $user = $oldrs->FetchRow($oldrs);

                            foreach ($fieldnames as $fn) {
                                if (($fn == "password" && empty($input[$fn])) || ($fn == "salt" && empty($input[$fn]))) {
                                    continue;
                                }

                                if ($fn == "create_priv" || $fn == "admin_priv") {
                                    $input[$fn] = (int) $input[$fn];
                                    $user[$fn] = $this->SfStr->getSafeString($user[$fn], SAFE_STRING_TEXT);
                                } else {
                                    $user[$fn] = $this->SfStr->getSafeString($user[$fn], SAFE_STRING_DB);
                                }

                                $tmpuser = "";

                                if (empty($_REQUEST["username"][$uid])) {
                                    $tmpuser = $input["username"];
                                } else {
                                    $tmpuser = $_REQUEST["username"][$uid];
                                }

                                if ($input[$fn] != $user[$fn]) {
                                    $this->log("Changed '" . $tmpuser . "' '$fn'" . " from " . $user[$fn] . " to " . $input[$fn]);
                                }
                            }
                        }
                    }
                }
            }
        }

        if (!empty($errmsg)) {
            $this->setMessage('Error', implode('<br />', $errmsg), MSGTYPE_ERROR);
            $_SESSION['update_admin_users']['erruid'] = $erruid;
        }

        header("Location: {$this->CONF['html']}/admin.php");
        exit();

        //return $erruid;
    }

    // Changes a user's password.
    function change_password() {
        // Check that a User ID (uid) has been given.
        if (empty($_REQUEST['uid'])) {
            $this->setMessage('Error', 'No user ID given. Please try again', MSGTYPE_ERROR);
            header("Location: {$this->CONF['html']}/admin.php");
            exit();
        }
        $uid = $_REQUEST['uid'];

        // Find the user's details.
        $query = "SELECT username, password, salt FROM {$this->CONF['db_tbl_prefix']}users WHERE uid = {$this->SfStr->getSafeString($uid, SAFE_STRING_DB)}";
        $user_result = $this->db->Execute($query);
        if ($user_result !== FALSE) {
            if ($user_data = $user_result->FetchRow($user_result)) {
                $current_password = $user_data['password'];
                $username = $user_data['username'];
                $salt = $user_data['salt'];
            }
        } else {
            $this->setMessage('Error', 'Could not find user. Please try again.', MSGTYPE_ERROR);
            header("Location: {$this->CONF['html']}/admin.php");
            exit();
        }

        // Check they have permission to change this user's password.
        $this_username = $this->findCurrentUsersUsername();
        if ($this_username === false || ($this_username != $username && !$this->can_we_change_passwords($this_username))) {
            $this->setMessage('Error', 'You do not have permission to change this user\'s password.', MSGTYPE_ERROR);
            header("Location: {$this->CONF['html']}/admin.php");
            exit();
        }

        // If they've not clicked "Update Password", show them the page allowing them to update the password.
        if (!isset($_REQUEST['update_password'])) {
            $this->smarty->assign_by_ref('uid', $uid);
            $this->smarty->assign_by_ref('username', $this->SfStr->getSafeString($username, SAFE_STRING_TEXT));
            return;
        } else {
            // They've entered a new password. Check it.
            if (empty($_REQUEST['new_password']) || $_REQUEST['new_password'] != $_REQUEST['confirm_password']) {
                $this->setMessage('Error', 'New passwords were blank or did not match', MSGTYPE_ERROR);
                header("Location: {$this->CONF['html']}/admin.php?action=change_password&uid=$uid");
                exit();
            }
            $new_password = $_REQUEST['new_password'];

            // Check they entered the correct current password.
            if (empty($_REQUEST['current_password']) || sha1($salt . $_REQUEST['current_password']) != $current_password) {
                $this->setMessage('Error', 'Current password was incorrect', MSGTYPE_ERROR);
                header("Location: {$this->CONF['html']}/admin.php?action=change_password&uid=$uid");
                exit();
            }

            // Generate a new salt and hash their new password, then save it in the database.
            list($hashed_password, $salt) = $this->generateSaltedPassword($new_password);
            $query = "UPDATE {$this->CONF['db_tbl_prefix']}users SET password = {$this->SfStr->getSafeString($hashed_password, SAFE_STRING_DB)}, salt = {$this->SfStr->getSafeString($salt, SAFE_STRING_DB)} WHERE uid = {$this->SfStr->getSafeString($uid, SAFE_STRING_DB)} AND password = {$this->SfStr->getSafeString($current_password, SAFE_STRING_DB)}";
            $rs = $this->db->Execute($query);
            if ($rs === FALSE) {
                $errmsg[$uid] = "Error updating password: {$this->db->ErrorMsg()}";
            }
        }

        header("Location: {$this->CONF['html']}/admin.php");
        exit();
    }

    // Checks the username of the current use against the list of users who are allowed to change other users'
    // passwords. This list is set with the "password_changers" in the "survey.ini.php" file.
    function can_we_change_passwords($username) {
        $users = explode(',', $this->CONF['password_changers']);
        return in_array($username, $users);
    }

    function is_user_admin($uid) {
        $uid = (int) $uid;
        $query = "SELECT admin_priv FROM {$this->CONF['db_tbl_prefix']}users WHERE uid = $uid AND sid = 0";
        $rs = $this->db->Execute($query);
        if ($rs === false) {
            return false;
        }

        $result = $rs->FetchRow($rs);
        if ($result['admin_priv'] == 1) {
            return true;
        }
        return false;
    }

    //Delete user matching $uid from
    //"users" table and return result
    function delete_user($uid) {
        $uid = (int) $uid;
        $query = "DELETE FROM {$this->CONF['db_tbl_prefix']}users WHERE uid = $uid AND sid = 0";
        $rs = $this->db->Execute($query);
        return $rs;
    }

}

?>