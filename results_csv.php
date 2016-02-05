<?php

include('classes/main.class.php');
include('classes/special_results.class.php');

$survey = new UCCASS_Special_Results;

echo $survey->results_csv(@$_REQUEST['sid'],$_REQUEST['export_type']);

?>