  <tr>
    <td align="center">
      [ <a href="{$conf.html}/edit_survey.php?sid={$data.sid}&mode=properties">Edit Survey Properties</a>
      &nbsp;|&nbsp;
      <a href="{$conf.html}/edit_survey.php?sid={$data.sid}&mode=questions">Edit Questions</a>
      &nbsp;|&nbsp;
      <a href="{$conf.html}/new_answer_type.php?sid={$data.sid}">New Answer Type</a>
      &nbsp;|&nbsp;
      <a href="{$conf.html}/edit_answer.php?sid={$data.sid}">Edit Answer Type</a>
      &nbsp;|&nbsp;
      <a href="{$conf.html}/edit_survey.php?sid={$data.sid}&mode=access_control">Access Control</a>
      &nbsp;|&nbsp;
      <a href="{$conf.html}/survey.php?sid={$data.sid}&preview_survey=1" target="_blank">Preview Survey</a>
      &nbsp;|&nbsp;
      <a href="{$conf.html}/index.php">Return to Main</a>
      {section name="admin_link" show=$$conf.show_admin_link}
        &nbsp;|&nbsp;<a href="{$conf.html}/admin.php">Admin</a>
      {/section} ]
    </td>
  </tr>