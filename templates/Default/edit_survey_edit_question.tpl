  <form method="POST" action="{$conf.html}/edit_survey.php" name="qform">
    <input type="hidden" name="mode" value="{$data.mode}">
    <input type="hidden" name="sid" value="{$data.sid}">
    <input type="hidden" name="qid" value="{$data.qid}">

    <div class="whitebox">
      Question Text
    </div>

    <div class="indented_cell">
      Enter Text of Question. Use the new question form to add page breaks into your form.
      Questions can not be edited into a page break.
      <br />
      <textarea name="question" wrap="physical" cols="50" rows="6">{$data.question_data.question}</textarea>
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
      [ <a href="#show_answers" onclick="window.open('display_answers.php?sid={$data.sid}','mywindow','toolbar=no,location=no,directories=no,status=yes,menubar=yes,scrollbars=yes,resizable=yes,width=640,height=480,left=30,top=30');"> Values </a> ]
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
      Orientation
    </div>

    <div class="indented_cell">
      <select name="orientation" size="1">
        {section name="orient" loop=$conf.orientation show=TRUE}
          <option value="{$conf.orientation[orient]}"{$data.orientation.selected[orient]}>{$conf.orientation[orient]}</option>
        {/section}
      </select>
    </div>

    {section name="show_edep" loop=1 show=$data.edep.dep_id}
      <div class="whitebox">
        Existing Dependencies:
      </div>

      <div class="indented_text">
        Check the box by the dependency to delete it when
        "Save Changes" is pressed below.

        <br />

        {section name="edep" loop=$data.edep.dep_id show=TRUE}
          <input type="checkbox" name="edep_id[]" value="{$data.edep.dep_id[edep]}">
          {$data.edep.option[edep]} if question {$data.edep.qnum[edep]} is {$data.edep.value[edep]}
          <br />
        {/section}
      </div>
    {/section}

    {section name="dep" loop=1 show=$data.qnum}
      <div class="whitebox">
        New Dependency
      </div>

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
    {/section}

    <div style="text-align:center">
      <br />
      <input type="submit" name="edit_question_submit" value="Save Changes">
      &nbsp;&nbsp;
      <input type="submit" name="edit_cancel" value="Cancel">
    </div>
  </form>