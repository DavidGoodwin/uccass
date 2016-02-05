<form method="GET" action="{$conf.html}/new_survey.php">

<table width="70%" align="center" cellpadding="0" cellspacing="0">
  <tr class="grayboxheader">
    <td width="14"><img src="{$conf.images_html}/box_left.gif" border="0" width="14"></td>
    <td background="{$conf.images_html}/box_bg.gif">Create New Survey</td>
    <td width="14"><img src="{$conf.images_html}/box_right.gif" border="0" width="14"></td>
  </tr>
</table>
<table width="70%" align="center" class="bordered_table">

{* ERROR MESSAGE *}
  {section name="error" loop=1 show=$error}
  <tr>
    <td class="error">Error: {$error}</td>
  </tr>
  {/section}
{* / ERROR MESSAGE *}

{* STEP 1: SURVEY NAME FORM *}
{section name="name_survey" loop=1 show=$show.survey_name}
  <tr>
    <td class="whitebox">Survey Name</td>
  </tr>
  <tr>
    <td>
      <div class="indented_cell">
        Enter name of survey. This is the name that people will see when they are
        presented a list of active surveys on the server. This name should be unique
        from all other surveys so they can be told apart. Use a descriptive name such
        as "C447 Oct-2002 Command Climate Assessment" instead of "charlie survey."
        <br />
        <input type="text" name="survey_name" size="40" maxlength="255" value="{$survey_name}">
      </div>
    </td>
  </tr>
  <tr>
    <td class="whitebox">Default Username and Password</td>
  </tr>
  <tr>
    <td>
      <div class="indented_cell">
        You must create a default user that will have permissions to edit the survey you're creating. You
        can later edit this user or add others from the Access Control portion of the Edit Survey pages.
        <p>Username: <input type="text" name="username" value="{$value.username}"></p>
        <p>Password: <input type="password" name="password" value="{$value.password}"><p>
      </div>
    </td>
  </tr>
  <tr>
    <td class="whitebox">Copy Survey</td>
  </tr>
  <tr>
    <td>
      <div class="indented_cell">
        To copy an already existing survey, choose it from the list below. Only public surveys
        can be copied. If you choose to copy a survey, all messages, demographics, and questions
        will be loaded from the existing survey and then you can go through and edit it to your
        liking.
        <br />
        <select name="copy_survey" size="1">
          {section name="cs" loop=$public_surveys.sid show=1}
            <option value="{$public_surveys.sid[cs]}">{$public_surveys.name[cs]}</option>
          {/section}
        </select>
      </div>
    </td>
  </tr>
{/section}
{* SURVEY NAME FORM *}

  <tr>
    <td align="center">
    <br />
{* START OVER BUTTON *}
{section name="start_over_button" loop=1 show=$show.start_over_button}
<input type="submit" value="{$button.start_over|default:"Start Over / Clear All"}" name="clear">
{/section}

{* NEXT BUTTON *}
{section name="next_button" loop=1 show=$show.next_button}
&nbsp;
<input type="submit" name="next" value="{$button.next|default:"Next Step"}">
{/section}
    </td>
  </tr>

  <tr>
    <td style="text-align:center;">
      [ <a href="{$conf.html}">Main</a> ]
    </td>
  </tr>
</table>
</form>