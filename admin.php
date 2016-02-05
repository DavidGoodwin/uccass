<?php

include('classes/main.class.php');
include('classes/surveyadmin.class.php');

$survey = new UCCASS_SurveyAdmin;

$output = $survey->com_header();

$output .= $survey->admin();

$output .= $survey->com_footer();

echo $output;

?>