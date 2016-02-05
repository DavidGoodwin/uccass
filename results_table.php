<?php

include('classes/main.class.php');
include('classes/special_results.class.php');

$survey = new UCCASS_Special_Results;

$output = $survey->com_header("Survey Results");

$output .= $survey->results_table(@$_REQUEST['sid']);

echo $output . $survey->com_footer();

?>