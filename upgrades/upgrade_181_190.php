<?php
//Upgrading from 1.81 to 1.9 
// - Added hashing of passwords
// - Added unique constraint on usernames
// - Added history log table (see .sql file)

$upgrade_104_105 = FALSE;

$user_result = $survey->db->Execute("SELECT username, password, salt, uid FROM {$survey->CONF['db_tbl_prefix']}users WHERE CHAR_LENGTH(password) < 40");
if($user_result !== FALSE)
{
    while($user_data = $user_result->FetchRow($user_result))
    {
        list($password, $salt) = $survey->generateSaltedPassword($user_data['password']);
        $salt = $survey->SfStr->getSafeString($salt, SAFE_STRING_DB);
        $password = $survey->SfStr->getSafeString($password, SAFE_STRING_DB);
        $query = "UPDATE {$survey->CONF['db_tbl_prefix']}users SET password = $password, salt = $salt WHERE uid = {$user_data['uid']}";
        $result = $survey->db->Execute($query);
        if($result === FALSE) {
            echo "Could not hash password for user '{$user_date['username']}'." . $survey->db->ErrorMsg();
        }
    }
}

// Build an array of all users.
$users = array();
$query = "SELECT uid, username FROM {$survey->CONF['db_tbl_prefix']}users";
$rs = $survey->db->Execute($query);
if($rs !== false)
{
    while($r = $rs->FetchRow($rs))
    {
        $uid = $survey->SfStr->getSafeString($r['uid'], SAFE_STRING_TEXT);
        $username = $survey->SfStr->getSafeString($r['username'], SAFE_STRING_TEXT);
        $users[$uid] = $username;
    }
}
asort($users);

// Check for duplicate usernames.
$counter = 1;
$previous_username = '';
foreach($users as $uid => $username)
{
    if($username == $previous_username)
    {
        $new_username = $username . str_pad($counter, 2, '0', STR_PAD_LEFT);
        $query = "UPDATE {$survey->CONF['db_tbl_prefix']}users SET username = {$survey->SfStr->getSafeString($new_username, SAFE_STRING_DB)} WHERE uid = {$survey->SfStr->getSafeString($uid, SAFE_STRING_DB)}";
        $result = $survey->db->Execute($query);
        $counter++;
    }
    else
    {
        $counter = 1;
    }
    $previous_username = $username;
}

?>
