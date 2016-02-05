        <table border="1" width="95%" cellspacing="0" cellpadding="0" align="center">
          <tr class="whitebox" style="text-align:center">
            <td width="5%" rowspan="2">Question Number</td>
            <td width="5%" rowspan="2">QID</td>
            <td width="50%" rowspan="2">Question Text</td>
            <td colspan="3">
              Options
              <br>
              <span class="example">(Check box and press button to delete)</span>
            </td>
          </tr>
          <tr class="whitebox" style="text-align:center;">
            <td width="15%">Delete</td>
            <td width="10%">Edit</td>
            <td width="15%">Move</td>
          </tr>

          {section name="p" loop=$data.qid}
            <form method="GET" action="{$conf.html}/edit_survey.php">
            <input type="hidden" name="mode" value="{$data.mode_edit_question}">
            <input type="hidden" name="sid" value="{$data.sid}">
            <tr bgcolor="{cycle values="#F9F9F9,#FFFFFF"}">
              <td style="text-align:center;">
                {$data.qnum[p]}
                <input type="hidden" name="qid" value="{$data.qid[p]}">
              </td>
              <td style="text-align:center">{$data.qid[p]}</td>
              <td>
                <div class="indented_cell">
                  {$data.question[p]}
                </div>

                {section name="show_edep" loop=1 show=$data.show_edep[p]}
                  <br />
                  <div class="indented_cell"><strong>Dependencies:</strong></div>
                  {section name="dep" loop=$data.edep_option[p] show=$data.edep_option[p]}
                    <div style="margin-left:5%;">
                      &bull; {$data.edep_option[p][dep]} if question {$data.edep_qnum[p][dep]}
                      is: {$data.edep_value[p][dep]}
                    </div>
                  {/section}
                {/section}
              </td>
                {section name="options" loop=1 show=$data.page_break[p]}
                  <td style="text-align:center;" colspan="3">
                    <input type="hidden" name="page_break" value="1">
                    <input type="submit" name="delete_question" value="Delete">
                  </td>
                {sectionelse}
                  <td style="text-align:center;" width="15%">
                    <input type="checkbox" name="del_qid" value="{$data.qid[p]}">
                    <input type="submit" name="delete_question" value="Delete">
                  </td>
                  <td style="text-align:center;" width="10%">
                    <input type="submit" name="edit_question" value="Edit">
                  </td>
                  <td style="text-align:center;" width="15%">
                    <input type="submit" name="move_up" value="&nbsp;&uarr;&nbsp;">
                    <input type="submit" name="move_down" value="&nbsp;&darr;&nbsp;">
                  </td>
                {/section}
            </tr>
            </form>
          {sectionelse}
            <tr>
              <td colspan="5">No questions</td>
            </tr>
          {/section}
        </table>

        <br>
        <form method="POST" action="{$conf.html}/edit_survey.php" name="qform">
        <input type="hidden" name="mode" value="{$data.mode_new_question}">
        <input type="hidden" name="sid" value="{$data.sid}">

        <div class="whitebox">
          Add A New Question  <a href="{$conf.html}/docs/index.html#new_question">[?]</a>
        </div>

        <script language="javascript">
        function page_break()
        {ldelim} document.qform.question.value = '{$conf.page_break}'; {rdelim}
        </script>

        <div class="indented_cell">
          Enter Text of Question. Enter <a href="javascript:page_break();">{$conf.page_break}</a> as the text of the question
          in order to create a page break in your survey (answer type will be ignored).
          <br />
          <textarea name="question" wrap="physical" cols="50" rows="6">{$question}</textarea>
        </div>

        <div class="whitebox">
          Answer Type
        </div>

        <div class="indented_cell">
          <select name="answer" size="1">
            {section name="answer" loop=$data.answer show=TRUE}
              <option value="{$data.answer[answer].aid}"{$data.answer[answer].selected}>{$data.answer[answer].name}</option>
            {/section}
          </select>
          &nbsp;
          [ <a href="#show_answers" onclick="window.open('display_answers.php?sid={$data.sid}','mywindow','toolbar=no,location=no,directories=no,status=yes,menubar=yes,scrollbars=yes,resizable=yes,width=640,height=480,left=30,top=30');">Values</a> ]
        </div>

        <div class="whitebox">
          Number of Answer Blocks
        </div>

        <div class="indented_cell">
          <select name="num_answers" size="1">
            {section name="num_answers" loop=$data.num_answers show=TRUE}
              <option value="{$data.num_answers[num_answers]}"{$data.num_answers_selected[num_answers]}>{$data.num_answers[num_answers]}</option>
            {/section}
          </select>
        </div>

        <div class="whitebox">
          Required Answers
        </div>

        <div class="indented_cell">
          <select name="num_required" size="1">
            {section name="num_required" loop=$data.num_required show=TRUE}
              <option value="{$data.num_required[num_required]}"{$data.num_required_selected[num_required]}>{$data.num_required[num_required]}</option>
            {/section}
          </select>
        </div>

        <div class="whitebox">
          Insert After Number
        </div>

        <div class="indented_cell">
          <select name="insert_after" size="1">
            <option value="0-0">First</option>
            {section name="qnum" loop=$data.qnum2 show=TRUE}
              <option value="{$data.page_oid[qnum]}"{$data.qnum2_selected[qnum]}>{$data.qnum2[qnum]}</option>
            {/section}
          </select>
        </div>

        <div class="whitebox">
          Orientation
        </div>

        <div class="indented_cell">
          <select name="orientation" size="1">
            {section name="orient" loop=$conf.orientation show=TRUE}
              <option value="{$conf.orientation[orient]}"{$data.orientation.selected[orient]}>{$conf.orientation[orient]}</option>
            {/section}
          </select>
        </div>

        {section name="dependencies" loop=1 show=$data.show.dep}

          <div class="whitebox">
           Dependencies <a href="{$conf.html}/docs/index.html#dependencies">[?]</a>
          </div>

          <div class="indented_cell">
            <span class="example">
              Dependencies are optional. If no dependencies are chosen, the question will be displayed to everyone
              who takes the survey and be requried based upon the choices above. You can optionally choose to <strong>Hide</strong> or
              <strong>Require</strong> a question based upon answers to previous questions. You can add up to three dependencies
              per question. Dependencies can only be based upon questions that are asked <strong>before</strong> the question that is
              currently being added. You can select multiple answers to base the dependency on by holding down the control key while
              selecting answer values. Additional dependencies can be added or existing dependencies deleted by clicking on the Edit
              button above after the question has been added to the survey.
            </span>
            <br />

            {section name="dep" loop=3 show=TRUE}
              ({$smarty.section.dep.iteration})
              &nbsp;&nbsp;&nbsp;
              <select name="option[{$smarty.section.dep.iteration}]" size="1">
                <option value=""></option>
                {section name="dep_mode" loop=$conf.dependency_modes show=TRUE}
                  <option value="{$conf.dependency_modes[dep_mode]}">{$conf.dependency_modes[dep_mode]}</option>
                {/section}
              </select>
              if question
              <select name="dep_qid[{$smarty.section.dep.iteration}]" onchange="populate({$smarty.section.dep.iteration});">
                <option value=""></option>
                {section name="dep_qid" loop=$data.dep_qid show=TRUE}
                  <option value="{$data.dep_qid[dep_qid]}">{$data.dep_qnum[dep_qid]}</option>
                {/section}
              </select>
              is answered with
              <select name="dep_aid[{$smarty.section.dep.iteration}][]" size="5" MULTIPLE>
                <option value="">>>Choose question number to view answers<<</option>
              </select>
              <br />
            {/section}
          </div>
        {/section}

        <script language="javascript">

        Answers = new Array;
        Values = new Array;
        Num_Answers = new Array;
        var Original_Length = 1;

        //Javascript from survey.class.php
        {$data.js}

        var num = 0;

        function populate(num)
        {ldelim}
            for(x=0;x<Original_Length;x++)
            {ldelim} document.qform['dep_aid['+num+'][]'].options[0] = null; {rdelim}

            qid = document.qform['dep_qid['+num+']'].value;

            for(x=0;x<Num_Answers[qid];x++)
            {ldelim} document.qform['dep_aid['+num+'][]'].options[x] = new Option(Values[qid+','+x],Answers[qid+','+x]); {rdelim}

            Original_Length = Num_Answers[qid];
        {rdelim}

      </script>


        <br />

        <div style="text-align:center">
          <input type="submit" name="add_new_question" value="Add New Question">
        </div>

      </form>