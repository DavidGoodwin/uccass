      {* SUCCESS MESSAGE *}
        {section name="success" loop=1 show=$success}
          <div class="message">New answer type successfully added.</div>
        {/section}
      {* / SUCCESS MESSAGE *}

      {section name="error" loop=1 show=$show.error}
        <div class="error">{$show.error}</div>
      {/section}

      <form method="POST" action="{$conf.html}/new_answer_type.php">

        <input type="hidden" name="sid" value="{$input.sid}">

        <div class="whitebox">
           <a href="{$conf.html}/docs/index.html#new_answer_type">[Help]</a>
        </div>

        <div class="whitebox">
          Answer Name
        </div>

        <div class="indented_cell">
          <input type="text" name="name" size="40" value="{$input.name}">
          <br />
          The Answer Name will appear in the drop
          downs used to select the type of answer you want. It should be short
          and describe the possible answers for this type. The Label
          field is a longer text area where you can give a description of this question
          and possibly explain how to answer (i.e. <em>Check all that apply</em>) The
          Label will be visible to users when they take the survey. Use it
          to explain the question or answers, otherwise leave it blank.
        </div>

        <div class="whitebox">
          Label
        </div>

        <div class="indented_cell">
          <input type="text" name="label" size="60" value="{$input.label}">
        </div>

        <div class="whitebox">
          Answer Type
        </div>

        <div class="indented_cell">
          <select name="type" size="1">
            <option value="MS" {$selected.MS}>MS - Multiple Choice, Single Answer</option>
            <option value="MM" {$selected.MM}>MM - Multiple Choice, Multiple Answers</option>
            <option value="T" {$selected.T}>T - Textbox, large</option>
            <option value="S" {$selected.S}>S - Textbox, small</option>
            <!-- <option value="NUM" {$selected.NUM}>NUM - Numeric Answer</option>
            <option value="DATE" {$selected.DATE}>DATE - Date/Time Answer</option> -->
            <option value="N" {$selected.N}>N - No Answer Values</option>
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
          <input type="submit" name="submit" value="Add Answer">
        </div>

        <div class="whitebox">
          Answer Values (MS and MM Answer Types Only)
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

        <table border="0" width="100%" cellspacing="0">
          <tr class="whitebox" style="text-align:center">
            <td>Num</td>
            <td>Answer Value (Displayed)</td>
            <td>Numeric Value</td>
            <td>Bar Graph Image</td>
          </tr>
          {section name="i" loop=$input.num_answers show=TRUE}
            <tr style="background-color:{cycle values="#F9F9F9,#FFFFFF"};text-align:center">
              <td>{$smarty.section.i.iteration}.</td>
              <td><input type="text" name="value[]" value="{$input.value[i]}" size="40" maxlength="255"></td>
              <td><input type="text" name="numeric_value[]" value="{$input.numeric_value[i]}" size="4"></td>
              <td>
                <select name="image[]" size="1">
                  {section name="image" loop=$input.allowable_images show=TRUE}
                    <option value="{$input.allowable_images[image]}"{$selected.image[i][image]}>{$input.allowable_images[image]}</option>
                  {/section}
                </select>
              </td>
            </tr>
          {/section}
        </table>

        <div style="margin-bottom:10px">
          {section name="add_answer" loop=1 show=$input.show_add_answers}
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
            <input type="hidden" name="num_answers" value="{$input.num_answers}">
          {/section}
        </div>
        <div style="text-align:center;margin-top:20px">
          <input type="submit" name="submit" value="Add Answer">
        </div>

      </form>