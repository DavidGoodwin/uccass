<table width="70%" align="center" cellpadding="0" cellspacing="0">
  <tr class="grayboxheader">
    <td width="14"><img src="{$conf.images_html}/box_left.gif" border="0" width="14"></td>
    <td background="{$conf.images_html}/box_bg.gif">Administration System</td>
    <td width="14"><img src="{$conf.images_html}/box_right.gif" border="0" width="14"></td>
  </tr>
</table>

<table width="70%" align="center" class="bordered_table">
  {section name="message" loop=1 show=$data.message}
    <tr>
      <td class="message">{$data.message}</td>
    </tr>
  {/section}

  <tr>
    <td class="whitebox">Edit Survey</td>
  </tr>
  <tr>
    <td>
      <form method="GET" action="{$conf.html}/edit_survey.php" class="indented_cell">
        <select name="sid">
          {section name=s loop=$data.survey.sid}
            <option value="{$data.survey.sid[s]}">{$data.survey.name[s]}</option>
          {/section}
        </select>
        <input type="submit" value="Edit Survey">
        [ <a href="{$conf.html}/new_survey.php">Create New Survey</a> ]
      </form>
    </td>
  </tr>
  <tr>
    <td class="whitebox">Users</td>
  </tr>
  <tr>
    <td>
      <form method="post" action="{$conf.html}/admin.php">
        <table border="1" cellspacing="0" cellpadding="2" align="center" width="80%">
          <tr>
            <th>Name</th>
            <th>Email<//th>
            <th>Username</th>
            <th>Password</th>
            <th>Administrator</th>
            {section name="create" loop=1 show=$conf.create_access}
              <th>Create Surveys</th>
            {/section}
            <th>Delete</th>
          </tr>
          {section name="u" loop=$data.users}
            <tr{section name="err" loop=1 show=$data.users[u].erruid} style="background-color:red"{/section}>
              <td><input type="text" name="name[{$data.users[u].uid}]" size="15" value="{$data.users[u].name}" maxlength="50"></td>
              <td><input type="text" name="email[{$data.users[u].uid}]" size="25" value="{$data.users[u].email}" maxlength="100"></td>
              <td><input type="text" name="username[{$data.users[u].uid}]" size="15" value="{$data.users[u].username}" maxlength="20"></td>
              <td><input type="text" name="password[{$data.users[u].uid}]" size="15" value="{$data.users[u].password}" maxlength="20"></td>
              <td align="center"><input type="checkbox" name="admin_priv[{$data.users[u].uid}]" value="1"{$data.users[u].admin_selected}></td>
              {section name="create2" loop=1 show=$conf.create_access}
                <td align="center"><input type="checkbox" name="create_priv[{$data.users[u].uid}]" value="1"{$data.users[u].create_selected}></td>
              {/section}
              <td align="center"><input type="checkbox" name="delete[{$data.users[u].uid}]" value="1"{$data.users[u].delete_selected}></td>
            </tr>
          {/section}
          <tr>
            <td colspan="7" align="right">
              <input type="submit" name="update_admin_users" value="Update Users">
            </td>
          </tr>
        </table>
      </form>
    </td>
  </tr>
  <tr>
    <td align="center">
      <br />
      [ <a href="{$conf.html}/index.php">Return to Main</a> ]
    </td>
  </tr>
</table>