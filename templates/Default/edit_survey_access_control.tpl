    <form method="POST" action="{$conf.html}/edit_survey.php">
      <input type="hidden" name="mode" value="{$data.mode}">
      <input type="hidden" name="sid" value="{$data.sid}">

      <div class="whitebox">Survey Access Control <a href="{$conf.html}/docs/index.html#ac_type">[?]</a></div>

      <div class="indented_cell">
        <select name="access_control" size="1">
          <option value="0"{$data.acs.none}>None - Public Survey</option>
          <option value="1"{$data.acs.cookie}>Cookies</option>
          <option value="2"{$data.acs.ip}>IP Address</option>
          <option value="3"{$data.acs.usernamepassword}>Username and Password</option>
          <option value="4"{$data.acs.invitation}>Invitation Only (Email)</option>
        </select>
      </div>

      <div class="whitebox">Hide Survey <a href="{$conf.html}/docs/index.html#ac_hidden">[?]</a></div>

      <div class="indented_cell">
        <input type="checkbox" name="hidden" value="1"{$data.hidden_checked}>
        Survey will not be shown anywhere on main page and will need to be directly linked
        to using the following links. <br />
        [ <a href="{$conf.html}/survey.php?sid={$data.sid}">Take Survey</a>
          &nbsp;|&nbsp;
          <a href="{$conf.html}/results.php?sid={$data.sid}">Survey Results</a>
          &nbsp;|&nbsp;
          <a href="{$conf.html}/edit_survey.php?sid={$data.sid}">Edit Survey</a> ]
      </div>

      <div class="whitebox">Public Survey Results <a href="{$conf.html}/docs/index.html#ac_public_results">[?]</a></div>

      <div class="indented_cell">
        <input type="checkbox" name="public_results" value="1"{$data.public_results_checked}> Check this box to make the results of the survey
        public. If this box is not checked, access to the results will be controlled by the permissions
        you set below.
      </div>

      {section name="survey_limit" loop=1 show=$data.show.survey_limit}
        <div class="whitebox">Survey Limit <a href="{$conf.html}/docs/index.html#ac_survey_limit">[?]</a></div>

        <div class="indented_cell">
          Allow users to take survey <input type="text" name="survey_limit_times" size="3" value="{$data.survey_limit_times}">
          time(s) every <input type="text" name="survey_limit_number" size="5" value="{$data.survey_limit_number}">
          <select name="survey_limit_unit" size="1">
            <option value="0"{$data.survey_limit_unit[0]}>minute(s)</option>
            <option value="1"{$data.survey_limit_unit[1]}>hour(s)</option>
            <option value="2"{$data.survey_limit_unit[2]}>day(s)</option>
            <option value="3"{$data.survey_limit_unit[3]}>ever</option>
          </select>
          <p class="example" style="margin:1px">Sets a limit for how many times users can complete a survey over
          a given time span, such as &quot;Allow users to take survey <strong>1</strong> time every <strong>7</strong>
          <strong>days</strong>&quot; or &quot;Allow users to take survey <strong>2</strong> times <strong>ever</strong>&quot; (second number is ignored in
          this case). Leave set at zero for no limit.</p>
        </div>
      {/section}

      {section name="clear_completed" loop=1 show=$data.show.clear_completed}
        <div class="whitebox">Reset Completed Surveys <a href="{$conf.html}/docs/index.html#ac_clear_completed">[?]</a></div>

        <div class="indented_cell">
          <input type="checkbox" name="clear_completed" value="1">Check this box to reset the completed surveys number for all users. This will not
          remove the actual answers the users gave, but simply reset to zero the number of times the system thinks they have completed the survey.
        </div>
      {/section}

      <div class="indented_cell">
        <input type="submit" name="update_access_control" value="Update Access Control">
      </div>

      <hr>

      <div class="whitebox">Users <a href="{$conf.html}/docs/index.html#ac_user_list">[?]</a></div>

      <div class="indented_cell">
        <strong>Be sure to click the &quot;Update Access Control&quot; button if any changes were made above before you
        edit the users below.</strong>
        <table border="1" cellspacing="0" cellpadding="3">
          <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Username</th>
            <th>Password</th>
            {section name="take_survey" loop=1 show=$data.show.take_priv}
              <th>Sent Login</th>
              <th>Completed</th>
              <th>Take Survey</th>
            {/section}
            {section name="view_results" loop=1 show=$data.show.results_priv}
              <th>View Results</th>
            {/section}
            <th>Edit Survey</th>
            <th bgcolor="#DDDDDD">Action</th>
          </tr>
          {section name="u" loop=$data.users show=TRUE}
            <tr{section name="erruid" loop=1 show=$data.users[u].erruid} style="background-color:red"{/section}>
              <td><input type="text" name="name[{$data.users[u].uid}]" size="20" maxlength="50" value="{$data.users[u].name}"></td>
              <td><input type="text" name="email[{$data.users[u].uid}]" size="20" maxlength="100" value="{$data.users[u].email}"></td>
              <td><input type="text" name="username[{$data.users[u].uid}]" size="10" maxlength="50" value="{$data.users[u].username}"></td>
              <td><input type="text" name="password[{$data.users[u].uid}]" size="10" maxlength="50" value="{$data.users[u].password}"></td>
              {section name="take_survey" loop=1 show=$data.show.take_priv}
                <td align="center">{$data.users[u].status_date}</td>
                <td align="center">{$data.users[u].completed} ({$data.users[u].num_completed})</td>
                <td align="center"><input type="checkbox" name="take_priv[{$data.users[u].uid}]" value="1"{$data.users[u].take_priv}></td>
              {/section}
              {section name="view_results" loop=1 show=$data.show.results_priv}
                <td align="center"><input type="checkbox" name="results_priv[{$data.users[u].uid}]" value="1"{$data.users[u].results_priv}></td>
              {/section}
              <td align="center"><input type="checkbox" name="edit_priv[{$data.users[u].uid}]" value="1"{$data.users[u].edit_priv}></td>
              <td align="center" bgcolor="#DDDDDD"><input type="checkbox" name="users_checkbox[{$data.users[u].uid}]" value="1"></td>
            </tr>
          {/section}
          <tr>
            <td colspan="2">(Be sure to save users before sending login information)</td>
            <td colspan="{$data.actioncolspan}" align="right" bgcolor="#DDDDDD">
              Action:
              <select name="users_selection" size="1">
                <option value="saveall">Save All Users</option>
                <option value="delete">Delete Selected</option>
                <option value="remind">Send Login Info to Selected</option>
                {section name="invite" loop=1 show=$data.show.invite}
                  <option value="movetoinvite">Move Selected to Invitee List</option>
                {/section}
              </select>
              <input type="submit" name="users_go" value="Go">
            </td>
          </tr>
        </table>
      </div>

      {section name="invite" loop=1 show=$data.show.invite}
        <div class="whitebox" style="margin-top:10px">Invitation Code Type <a href="{$conf.html}/docs/index.html#ac_invite_code">[?]</a></div>
        <div class="indented_cell">
          <p style="margin-top:1px; margin-bottom:1px">
            <input type="radio" id="alphanumeric" name="invite_code_type" value="alphanumeric"{$data.invite_code_type.alphanumeric}>
            <label for="alphanumeric">Alphanumeric</label>
            <input type="text" name="invite_code_length" value="{$data.invite_code_length}" size="3" maxlength="2"> characters
            <em>(i.e &quot;5ta2ST7aE2&quot; or &quot;2jiW72sut97Y&quot;, max {$data.alphanumeric.maxlength} characters, default {$data.alphanumeric.defaultlength} characters)</em>
          </p>
          <p style="margin-top:1px; margin-bottom:1px">
            <input type="radio" id="words" name="invite_code_type" value="words"{$data.invite_code_type.words}>
            <label for="words">Words</label> <em>(i.e &quot;buffalo-candy&quot; or &quot;interesting-something&quot;)</em>
          </p>
        </div>
        <div class="whitebox">Invitees <a href="{$conf.html}/docs/index.html#ac_invitee_list">[?]</a></div>
        <div class="indented_cell">
          <table border="1" cellspacing="0" cellpadding="3">
            <tr>
              <th>Name</th>
              <th>Email</th>
              <th>Invited</th>
              <th>Invite Code</th>
              <th>Completed</th>
              {section name="view_results" loop=1 show=$data.show.results_priv}
                <th>View Results</th>
              {/section}
              <th bgcolor="#DDDDDD">Action</th>
            </tr>
            {section name="i" loop=$data.invite show=TRUE}
              <tr{section name="erruid" loop=1 show=$data.invite[i].erruid} style="background-color:red"{/section}>
                <td><input type="text" name="invite_name[{$data.invite[i].uid}]" size="20" maxlength="50" value="{$data.invite[i].name}"></td>
                <td><input type="text" name="invite_email[{$data.invite[i].uid}]" size="20" maxlength="100" value="{$data.invite[i].email}"></td>
                <td align="center">{$data.invite[i].status_date}</td>
                <td align="center">{$data.invite[i].invite_code}</td>
                <td align="center">{$data.invite[i].completed} ({$data.invite[i].num_completed})</td>
                {section name="view_results" loop=1 show=$data.show.results_priv}
                  <td align="center"><input type="checkbox" name="invite_results_priv[{$data.invite[i].uid}]" value="1"{$data.invite[i].results_priv}></td>
                {/section}
                <td align="center" bgcolor="#DDDDDD"><input type="checkbox" name="invite_checkbox[{$data.invite[i].uid}]" value="1"></td>
              </tr>
            {/section}
            <tr>
              <td colspan="2">(Be sure to save invitees before sending invite codes.)</td>
              <td colspan="{$data.inviteactioncolspan}" align="right" bgcolor="#DDDDDD">
                Action:
                <select name="invite_selection" size="1">
                  <option value="saveall">Save All Invitees</option>
                  <option value="delete">Delete Selected Invitees</option>
                  <option value="invite">Send Invitation Code to Selected</option>
                  <option value="movetousers">Move Selected to Users List</option>
                </select>
                <input type="submit" name="invite_go" value="Go">
              </td>
            </tr>
          </table>
        </div>
      {/section}
    </form>