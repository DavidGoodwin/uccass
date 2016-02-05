<?php
$query = '';
$error = FALSE;

include('classes/main.class.php');
include('classes/config.class.php');

$ini_file = 'survey.ini.php';

$c = new UCCASS_Config($ini_file);

if(count($_POST) > 0)
{
    if($c->process_config($ini_file))
    {
        include('classes/survey.class.php');

        $survey = new UCCASS_Main();

        if(!isset($survey->error_occurred))
        {
            $error = FALSE;

            switch($_REQUEST['installation_type'])
            {
                case 'upgrade_104': //upgrade from 1.04 to 1.05
                    $sql_error1 = $c->load_sql_file('upgrades/upgrade_104_105-1.sql',TRUE);
                    include('upgrades/upgrade_104_105.php');
                    $sql_error2 = $c->load_sql_file('upgrades/upgrade_104_105-2.sql',TRUE);
                    $error = !$upgrade_104_105 | $sql_error1 | $sql_error2;
                    if(!$error)
                    { echo '<p><strong>Upgrade from v1.04 to v1.05 successful.</strong></p>'; }
                    else
                    { echo '<p><strong>There were errors while upgrading from v1.04 to v1.05.</strong></p>'; }

                case 'upgrade_105': // upgrade from 1.05 to 1.06
                    echo '<p><strong>Upgrade from v1.05 to v1.06 successful.</strong></p>';

                case 'upgrade_106': //upgrade from 1.06 to 1.8.0
                    $sql_error = $c->load_sql_file('upgrades/upgrade_106_180.sql',TRUE);
                    $error = $error | $sql_error;
                    if(!$error)
                    {
                        echo '<p><strong>Upgrade from v1.06 to v1.8 successful.</strong></p>';
                        echo '<strong>v1.8 Notice</strong>: A default administrator user was created with a username of &quot;admin&quot; and a password of &quot;password&quot;. Because
                              of the changes in the access controls for v1.8, you will need to use the default Admin user to reset the access controls on
                              all of your surveys. v1.8 no longer uses edit, take or results passwords, but instead allows you to create users for each survey
                              and control what each user has access to. Any existing surveys have been changed to no access control (anyone can take them) and
                              private results (only admin can see them). If you had private surveys or public results, use the default Admin user to recreate
                              those access controls with the new system.<br /><br />';
                    }
                    else
                    { echo '<p><strong>There were errors while upgrading from 1.06 to 1.8</strong></p>'; }

                case 'upgrade_180': //upgrade from 1.8.0 to 1.8.1
                    $sql_error = $c->load_sql_file('upgrades/upgrade_180_181.sql',TRUE);
                    $error = $error | $sql_error;
                    if(!$error)
                    {
                        echo '<p><strong>Upgrade from v1.8.0 to v1.8.1 successful.</strong></p>';
                    }
                break;

                case 'newinstallation':
                    $sql_file = 'survey.sql';
                    $error = $c->load_sql_file($sql_file) | $error;
                    if(!$error)
                    { echo '<p><strong>New installation of v1.8.1 completed successfully.</strong></p>'; }
                    else
                    { echo '<p><strong>There were errors while performing a new installation of v1.8.1</strong></p>'; }
                break;

                case 'updateconfigonly':
                    echo '<p><strong>Configuration updated successfully.</strong></p>';
                break;

                default:
                    $error = TRUE;
                    echo '<p>You did not choose an installation type. Please go back to the installation page and choose an installation type at the top of the page.</p>';
            }

            if($error)
            { echo '<p>Installation was not successful due to the above errors.</p>'; }
            else
            {
                echo "<p>Installation sucessful. To complete the installation, the <strong>install.php</strong> file must
                      be deleted or removed from the web root. Doing so will prevent anyone from re-running
                      your installation and aquiring your database information or changing your site's information.</p>

                      <p>A default administrative user has been created with the following username and password. It's recommended
                      that you change this at once.</p>
                      <blockquote>
                        <p>Username: <strong>admin</strong></p>
                        <p>Password: <strong>password</strong></p>
                      </blockquote>

                      <p>Once complete, you may click <a href=\"{$survey->CONF['html']}/index.php\">here</a> to
                      begin using your Survey System.</p>";
            }
        }
    }
}
else
{
    $form = $c->show_form();

    //Have PHP detect file and html paths and provide them
    //if the values are empty in ini file.
    include('classes/pathdetect.class.php');
    $pd = new UCCASS_PathDetect;

    $form = str_replace('name="path" value=""','name="path" value="' . $pd->path() . '"',$form);
    $form = str_replace('name="html" value=""','name="html" value="' . $pd->html() . '"',$form);

    echo $form;
}

?>