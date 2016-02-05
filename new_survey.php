<?php

include('classes/main.class.php');
include('classes/newsurvey.class.php');

$survey = new UCCASS_NewSurvey;

$output = $survey->com_header();

$output .= $survey->new_survey();

$output .= $survey->com_footer();

echo $output;

?>
