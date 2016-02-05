<?php

include('classes/main.class.php');
include('classes/survey.class.php');

$survey = new UCCASS_Survey;

$body = $survey->take_survey($_REQUEST['sid']);

$header = $survey->com_header("Survey #{$_REQUEST['sid']}: {$survey->survey_name}");

echo $header;
echo $body;
echo $survey->com_footer();

?>
