<?php

include('classes/main.class.php');
include('classes/editsurvey.class.php');

$editSurvey = new UCCASS_EditSurvey;

$body = $editSurvey->show(@$_REQUEST['sid']);

echo $editSurvey->com_header();
echo $body;
echo $editSurvey->com_footer();

?>
