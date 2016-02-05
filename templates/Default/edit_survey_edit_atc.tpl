      <div class="whitebox">
        Choose Answer Type
      </div>

      {* DELETE MESSAGE *}
        {section name="del" loop=1 show=$show.del_message}
          <div class="message" style="width:100%">Answer successfully deleted.</div>
        {/section}
      {* / DELETE MESSAGE *}

      <form method="GET" action="{$conf.html}/edit_answer.php">
        <input type="hidden" name="sid" value="{$answer.sid}">
        <select name="aid" size="1">
          {section name=a loop=$answer.aid}
            <option value="{$answer.aid[a]}">{$answer.name[a]}</option>
          {/section}
        </select>
        <input type="submit" value="Edit Answer Type">
        &nbsp;&nbsp;
        <a href="#show_answers" onclick="window.open('{$conf.html}/display_answers.php?sid={$answer.sid}','mywindow','toolbar=no,location=no,directories=no,status=yes,menubar=yes,scrollbars=yes,resizable=yes,width=640,height=480,left=30,top=30');">
          [ View Answer Types ]
        </a>

      </form>