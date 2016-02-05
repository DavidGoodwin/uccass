<?php

include('classes/main.class.php');
include('classes/results.class.php');

$survey = new UCCASS_Results;

echo $survey->com_header("Filter Survey Results");

echo $survey->filter($_REQUEST['sid']);

echo $survey->com_footer();

?>
