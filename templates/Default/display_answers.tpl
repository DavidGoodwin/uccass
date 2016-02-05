<html>
  <head>
    <title>Answer Types and Values</title>
  </head>
  <body>

  <table width="95%" align="center" cellpadding="0" cellspacing="0">
    <tr class="grayboxheader">
      <td width="14"><img src="{$conf.images_html}/box_left.gif" border="0" width="14"></td>
      <td background="{$conf.images_html}/box_bg.gif">Survey #{$survey.sid}: {$survey.name}</td>
      <td width="14"><img src="{$conf.images_html}/box_right.gif" border="0" width="14"></td>
    </tr>
  </table>

  <table width="95%" align="center" border="1" cellspacing="0" style="border-color:#F9F9F9">
    <tr>
      <td colspan="5" style="text-align:center">
        [ <a href="#close_window" onclick="window.close();">Close Window</a> ]
      </td>
    </tr>
    <tr class="whitebox">
      <td>Answer Name</td>
      <td>Type*</td>
      <td>Values</td>
      <td>Label</td>
    </tr>

    {section name="answers" loop=$answers show=TRUE}
      <tr style="background-color:{cycle values="#F9F9F9,#FFFFFF"}">
        <td>{$answers[answers].name}</td>
        <td>{$answers[answers].type}</td>
        <td>
          {section name="values" loop=$answers[answers].value show=TRUE}
            {$answers[answers].value[values]}<br />
          {/section}
        </td>
        <td>{$answers[answers].label}</td>
      </tr>
    {/section}

    <tr>
      <td colspan="5">
        *Answer Types:
        <ul>
          <li>T: Text Area (no max characters)</li>
          <li>S: Sentence (255 characters max)</li>
          <li>MM: Multiple Choice (more than one answer allowed)</li>
          <li>MS: Multiple Choice (only one answer allowed)</li>
          <li>N: No answer (label)</li>
        </ul>
      </td>
    </tr>

    <tr>
      <td colspan="5" style="text-align:center">
        [ <a href="#close_window" onclick="window.close();">Close Window</a> ]
      </td>
    </tr>
  </table>
</body>
</html>