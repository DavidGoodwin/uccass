<?php

include('classes/main.class.php');
include('classes/survey.class.php');

$survey = new UCCASS_Survey;

// Log the user out
if(isset($_SESSION['priv']))
 unset($_SESSION['priv']);

?>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
    <title>UCCASS Survey</title>
    <link rel="stylesheet" type="text/css" href="templates/Default/style.css">
  </head>
  <body>

<!-- MAIN CONTENT AREA -->

<P>&nbsp;</P>

<table width="70%" align="center" cellpadding="0" cellspacing="0">
  <tr class="grayboxheader">
    <td width="14"><img src="templates/Default/images/box_left.gif" border="0" width="14"></td>
    <td background="templates/Default/images/box_bg.gif">&nbsp;</td>
    <td width="14"><img src="templates/Default/images/box_right.gif" border="0" width="14"></td>
  </tr>
</table>

<table width="70%" align="center" class="white_bordered_table">
  <tr>
   <td rowspan="2" width="10">&nbsp;</td>
   <td colspan="2" height="10">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top">
     <div class="bodytext">
       <H2 style="text-align:center">Thank you</H2>
       <p>
       Thank you for completing this survey.
       </p>
     </div>
    </td>
    <td align="right" width="105" valign="top">
    </td>
  </tr>
</table>

<!-- END MAIN CONTENT AREA -->
    <div class="copyright">
      <br><br><br><br>
      Powered by <a href="http://www.bigredspark.com/survey.html" class="copyright">UCCASS v1.9.0</a>. Copyright &copy; 2004 <a href="http://www.bigredspark.com/" class="copyright">John W. Holmes</a>, All Rights Reserved
      <!-- YOU MAY NOT REMOVE THIS COPYRIGHT NOTICE WITHOUT PERMISSION FROM THE UCCASS AUTHOR -->
    </div>
  </body>
</html>
