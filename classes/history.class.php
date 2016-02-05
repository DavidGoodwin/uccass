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

class UCCASS_History extends UCCASS_Main
{
    var $resultsPerPage = 10;
    
    function UCCASS_History()
    {
        $this->load_configuration();
    }

    /**
     * Checks the user has the correct privileges and runs the requested action.
     */
    function history()
    {
        $data = array();
        $template = 'history.tpl';
        
        // Check they can access this page.
        $admin_priv = $this->_CheckLogin(0, ADMIN_PRIV, 'history.php');
        if(!$admin_priv)
        {
            $this->setMessage('Error', 'You must be logged in to view this page', MSGTYPE_ERROR);
            header("Location: {$this->CONF['html']}/admin.php");
            exit();
        }
        
        // Perform the user's chosen action.
        $action = 'view';
        if(isset($_REQUEST['action']))
        {
            $action = $_REQUEST['action'];
        }
         
        switch($action)
        {
            case 'export':
                $export_format = 'csv';
                if(!empty($_REQUEST['export_format']))
                {
                    $export_format = $_REQUEST['export_format'];
                }
                
                return $this->export($export_format);
                break;
            
            case 'view':
            default:
                return $this->viewHistory();
                break;
        }
    }
    
    /**
     * Shows the histroy records list.
     */
    function viewHistory()
    {
        $data = array();
        $rs = $this->getResults(true);
        while($r = $rs->FetchRow())
        {
            $history_id = $this->SfStr->getSafeString($r['id'], SAFE_STRING_TEXT);
            $data[$history_id]['username'] = $this->SfStr->getSafeString($r['who'], SAFE_STRING_TEXT);
            $data[$history_id]['when'] = $this->SfStr->getSafeString($r['when'], SAFE_STRING_TEXT);
            $data[$history_id]['description'] = $this->SfStr->getSafeString($r['description'], SAFE_STRING_TEXT);
            $data[$history_id]['ip_address'] = $this->SfStr->getSafeString($r['ip_address'], SAFE_STRING_TEXT);
        }
        $this->smarty->assign_by_ref('data', $data);
        
        // Find a list of all users.
        $query = "SELECT DISTINCT username FROM users ORDER BY username ASC";
        $rs = $this->db->Execute($query);
        if($rs === FALSE)
        {
            $this->error("Error retrieving list of users: {$this->db->ErrorMsg()}");
        }
        
        $users = array();
        while($r = $rs->FetchRow())
        {
            $users[] = $this->SfStr->getSafeString($r['username'], SAFE_STRING_TEXT);
        }
        $this->smarty->assign_by_ref('users', $users);
        
        return $this->smarty->Fetch($this->template . '/history.tpl');
    }
    
    function getResults($apply_paging = true)
    {
        // Find the history records.
        $filter = $this->filter();
        $query = "SELECT history.id, history.who, history.when, history.description, history.ip_address FROM history $filter ORDER BY history.id DESC";
        if($apply_paging)
        {
            $query = $this->doPaging($query);
        }
        
        $rs = $this->db->Execute($query);
        if($rs === FALSE)
        {
            $this->error("Error retrieving history data: {$this->db->ErrorMsg()}");
        }
        
        return $rs;
    }
    
    /**
     * Handles the paging of history results.
     * 
     * @param String $query SQL string to be modified.
     * @return String SQL query passed in with the "LIMIT" set.
     */
    function doPaging($query)
    {
        $page = 0;
        if(!empty($_REQUEST['page']))
        {
            $page = (int) $_REQUEST['page'];
        }
        
        $total_results = $this->findResultCount($query);
        $total_pages = ceil($total_results / $this->resultsPerPage) - 1;
        
        // Sort out the links for the browse page.
        $controls = array();
        if($page > 0)
        {
            $prev = $page - 1;
            $controls['first'] = '0';
            $controls['previous'] = "$prev";
        }
        if($page < $total_pages)
        {
            $controls['next'] = $page + 1;
            $controls['last'] = $total_pages;
        }
        
        $results_start = ceil($page * $this->resultsPerPage);
        $this->smarty->assign_by_ref('controls', $controls);
        return $query . " LIMIT $results_start,{$this->resultsPerPage}";
    }
    
    /**
     * Finds and returns the total number of records for the given query.
     * 
     * @param String $query SQL query to use.
     * @return Mixed Returns an integer of the total records, or boolean false.
     */
    function findResultCount($query)
    {
        $start = strpos($query, 'FROM');
        if($start === false)
        {
            return false;
        }
        $query = substr($query, $start);
        $query = "SELECT COUNT(*) AS total $query";
        
        $rs = $this->db->Execute($query);
        if($rs === false)
        {
            return false;
        }
        if($r = $rs->FetchRow())
        {
            return $r['total'];
        }
        return false;
    }
    
    /**
     * Filter the results based on the inputted parameters.
     */
    function filter()
    {
        // Reset the filters, if the user wants that.
        if(!empty($_REQUEST['filter_reset']))
        {
            unset($_REQUEST['filter_from']);
            unset($_REQUEST['filter_to']);
            unset($_REQUEST['filter_user']);
            unset($_SESSION['filter_from']);
            unset($_SESSION['filter_to']);
            unset($_SESSION['filter_user']);
        }
        
        $query = '';
        
        // Show results from "from" onwards.
        if(!empty($_REQUEST['filter_from']) || !empty($_SESSION['filter_from']))
        {
            if(!empty($_REQUEST['filter_from']))
            {
                $from = $_REQUEST['filter_from'];
                $_SESSION['filter_from'] = $from;
            }
            else
            {
                $from = $_SESSION['filter_from'];
            }
            
            $from_time = "$from 00:00:00";
            if(empty($query))
            {
                $query = 'WHERE ';
            }
            else
            {
                $query .= ' AND ';
            }
            $query .= "history.when >= {$this->SfStr->getSafeString($from_time, SAFE_STRING_DB)}";
            $this->smarty->assign_by_ref('filter_from', $from);
        }
        
        // Show results from before "to".
        if(!empty($_REQUEST['filter_to']) || !empty($_SESSION['filter_to']))
        {
            if(!empty($_REQUEST['filter_to']))
            {
                $to = $_REQUEST['filter_to'];
                $_SESSION['filter_to'] = $to;
            }
            else
            {
                $to = $_SESSION['filter_to'];
            }
            
            $to_time = "$to 23:59:59";
            if(empty($query))
            {
                $query = 'WHERE ';
            }
            else
            {
                $query .= ' AND ';
            }
            $query .= "history.when <= {$this->SfStr->getSafeString($to_time, SAFE_STRING_DB)}";
            $this->smarty->assign_by_ref('filter_to', $to);
        }
        
        // Show results for user "username".
        if(!empty($_REQUEST['filter_user']) || !empty($_SESSION['filter_user']))
        {
            if(!empty($_REQUEST['filter_user']))
            {
                $username = $_REQUEST['filter_user'];
                $_SESSION['filter_user'] = $username;
            }
            else
            {
                $username = $_SESSION['filter_user'];
            }
            
            if($username != '__ALL__')
            {
                if(empty($query))
                {
                    $query = 'WHERE ';
                }
                else
                {
                    $query .= ' AND ';
                }
                $query .= "history.who = {$this->SfStr->getSafeString($username, SAFE_STRING_DB)}";
                $this->smarty->assign_by_ref('filter_user', $username);
            }
        }
        
        return $query;
    }
    
    /**
     * Finds the data to export, then passes it to the appropriate function.
     */
    function export($format = 'csv')
    {
        $filename = 'history_export-' . date('Ymd') . '.' . $format;
        $filename_temp = tempnam('/tmp', 'csvexport');
        $file = fopen($filename_temp, 'r+');
        $results = $this->getResults(false);
        
        switch($format)
        {
            case 'csv':
            default:
                $returned = $this->exportToCSV($results, $file);
                break;
        }
        if(!$returned)
        {
            $this->error("Error exporting data to CSV");
            return false;
        }
        fclose($file);
        
        // Set the appropriate headers.
        $headers = array();
        $headers[] = 'Pragma: public';
        $headers[] = 'Expires: 0';
        $headers[] = 'Cache-Control: must-revalidate, post-check=0, pre-check=0';
        $headers[] = 'Cache-Control: public';
        $headers[] = 'Content-Type: text/csv';
        $headers[] = 'Content-Disposition: attachment; filename="' . $filename . '";';
        $headers[] = 'Content-Transfer-Encoding: binary';
        $headers[] = 'Content-Length: ' . filesize($filename_temp);
        foreach($headers as $head) {
            header($head);
        }
        
        // Send the file to the user.
        readfile($filename_temp);
        exit(0);
    }
    
    /**
     * Exports the data to a CSV file.
     */
    function exportToCSV($results, $file)
    {
        // Put the column headers into the file.
        $headers = array('User', 'Date/Time', 'Description', 'IP Address');
        if(fputcsv($file, $headers) === false)
        {
            return false;
        }
        
        // Add int he rest of the data.
        while($r = $results->FetchRow())
        {
            $username = 'Unknown';
            if(!empty($r['who']))
            {
                $username = $r['who'];
            }
            $data = array($username, $r['when'], $r['description'], $r['ip_address']);
            if(fputcsv($file, $data) === false)
            {
                return false;
            }
        }
        
        return true;
    }
}
