<?php

include('classes/main.class.php');
include('classes/answertypes.class.php');

$survey = new UCCASS_AnswerTypes;

echo $survey->com_header("New Answer Type");
echo $survey->new_answer_type(@$_REQUEST['sid']);
echo $survey->com_footer();

?>
