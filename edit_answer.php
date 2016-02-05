<?php

include('classes/main.class.php');
include('classes/answertypes.class.php');

$survey = new UCCASS_AnswerTypes;

echo $survey->com_header();

echo $survey->edit_answer(@$_REQUEST['sid'],@$_REQUEST['aid']);

echo $survey->com_footer();

?>