<?php

include('classes/main.class.php');
include('classes/history.class.php');

$survey = new UCCASS_History;

$output = $survey->com_header();

$output .= $survey->history();

$output .= $survey->com_footer();

echo $output;

?>
