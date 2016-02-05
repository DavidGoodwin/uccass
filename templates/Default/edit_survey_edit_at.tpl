      <form method="POST" action="{$conf.html}/edit_answer.php">
        <input type="hidden" name="aid" value="{$answer.aid}">
        <input type="hidden" name="sid" value="{$answer.sid}">

        {* SUCCESS MESSAGE *}
          {section name="success" loop=1 show=$show.success}
            <div class="message">
              Answer successfully edited.
            </div>
          {/section}
        {* / SUCCESS MESSAGE *}

        {section name="error" loop=1 show=$show.error}
          <div class="error">{$show.error}</div>
        {/section}


        {* WARNING MESSAGE *}
          {section name="warning" loop=1 show=$show.warning}
            <div class="error">
              WARNING: This answer type is being used for {$num_usedanswers} question{$usedanswers_plural} in this survey. Changing
              the values will affect all questions using this answer type. Changing the answer type will
              DELETE all existing results for the old type! Deleting an answer value from the list
              below will DELETE all results using that value! Use extreme caution when editing answer types that are in use to prevent
              data loss.
            </div>
          {/section}
        {* / WARNING MESSAGE *}

        {section name="delete" loop=1 show=$show.delete}
          <div class="whitebox">
            Delete Answer
          </div>

          <div class="indented_cell">
            Check box and press button to delete answer.
            <br />
            <input type="checkbox" name="delete" value="1">
            &nbsp;&nbsp;
            <input type="submit" name="delete_submit" value="Delete Answer">
          </div>
        {/section}

        <div class="whitebox">
          Answer Name
        </div>

        <div class="indented_cell">
          The Answer Name will appear in the drop
          downs used to select the type of answer you want. It should be short
          and describe the possible answers for this type. The Label
          field is a longer text area where you can give a description of this question
          and possibly explain how to answer (i.e. <em>Check all that apply</em>) The
          Label will be visible to users when they take the survey. Use it
          to explain the question or answers, otherwise leave it blank.

          <br />

          <input type="text" name="name" size="40" value="{$answer.name}">
        </div>

        <div class="whitebox">
          Label
        </div>

        <div class="indented_cell">
          <input type="text" name="label" size="60" value="{$answer.label}">
        </div>

        <div class="whitebox">
          Answer Type
        </div>

        <div class="indented_cell">
          <select name="type" size="1">
            <option value="MS" {$answer.selected.MS}>MS - Multiple Choice, Single Answer</option>
            <option value="MM" {$answer.selected.MM}>MM - Multiple Choice, Multiple Answers</option>
            <option value="T" {$answer.selected.T}>T - Textbox, large</option>
            <option value="S" {$answer.selected.S}>S - Textbox, small</option>
            <!-- <option value="NUM" {$answer.selected.NUM}>NUM - Numeric Answer</option>
            <option value="DATE" {$answer.selected.DATE}>DATE - Date/Time Answer</option> -->
            <option value="N" {$answer.selected.N}>N - No Answer Values</option>
          </select>

          <ul>
            <li>MS = Multiple choice, one possible answer can be chosen.</li>
            <li>MM = Multiple choice, more than one possible answer can be chosen.</li>
            <li>T = Large text area, unlimited answer size.</li>
            <li>S = Sentence text box, 255 characters max.</li>
            <!-- <li>NUM = Numeric answer only. Use the Label above to tell users about any range that may be required.</li>
            <li>DATE = Date and/or Time answer only. Use the Label above to tell the users about any range that may be required and the format of the date and/or time that's required.</li> -->
            <li>N = No answer choices. Instead of a question, this will be more of a label with no choices below it. Useful
                for setting up a sequence of questions, for example: "<em>For the following 5 questions, choose the most likely answer:</em>"</li>
          </ul>
        </div>

        <div style="text-align:center">
          <input type="submit" name="submit" value="Edit Answer">
        </div>

        <div class="whitebox">
          Answer Values (MS and MM Answer Types only)
        </div>

        <div class="indented_cell">
          <ul>
            <li>You must supply a list of possible answers if you selected MS or MM for an Answer Type.</li>
            <li>List one answer per text box in the boxes below. Use the button at the bottom of the boxes to add more
              boxes for more answers. The order you list the answers here is the order they will be presented in the
              surveys.
            <li>You can optionally assign a numeric value to each answer value that you provide, also. This numeric value can then
              be used when exporting the results to a CSV file for processing by other analysis programs.</li>
          </ul>
        </div>


        <table border="0" cellspacing="0" width="100%">
          <tr class="whitebox" style="text-align:center">
            <td>Num</td>
            <td>Answer Value (Displayed)</td>
            <td>Numeric Value</td>
            <td>Bar Graph Image</td>
          </tr>
          {section name="i" loop=$answer.num_answers show=TRUE}
            <tr style="background-color:{cycle values="#F9F9F9,#FFFFFF"};text-align:center">
              <td>{$smarty.section.i.iteration}.</td>
              <td><input type="text" name="value[{$answer.avid[i]}]" value="{$answer.value[i]}" size="40" maxlength="255"></td>
              <td><input type="text" name="numeric_value[{$answer.avid[i]}]" value="{$answer.numeric_value[i]}" size="4"></td>
              <td>
                <select name="image[{$answer.avid[i]}]" size="1">
                  {section name="img" loop=$answer.allowable_images show=TRUE}
                    <option value="{$answer.allowable_images[img]}"{$answer.image_selected[i][img]}>{$answer.allowable_images[img]}</option>
                  {/section}
                </select>
              </td>
            </tr>
          {/section}
        </table>

        <div>
          {section name="add_answer" loop=1 show=$answer.show_add_answers}
            Add
            <select name="add_answer_num" size="1">
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
              <option value="5">5</option>
              <option value="10">10</option>
              <option value="20">20</option>
            </select>
            more display and numeric value boxes.
            <input type="submit" name="add_answers_submit" value="Add">
            <input type="hidden" name="num_answers" value="{$answer.num_answers}">
          {/section}
          <br />
        </div>

        <br />

        <div style="text-align:center">
          <input type="submit" name="submit" value="Edit Answer">
        </div>
      </form>