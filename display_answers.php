<?php

include('classes/main.class.php');
//include('classes/survey.class.php');

$survey = new UCCASS_Main;

echo $survey->display_answers($_REQUEST['sid']);

?>