ALTER TABLE surveys ADD COLUMN redirect_page VARCHAR(255) NOT NULL DEFAULT 'index';
ALTER TABLE surveys ADD COLUMN survey_text_mode INT(11) NOT NULL DEFAULT 0;
ALTER TABLE surveys ADD COLUMN user_text_mode INT(11) NOT NULL DEFAULT 0;
ALTER TABLE surveys CHANGE COLUMN start start_date INT(11) NOT NULL DEFAULT 0;
ALTER TABLE surveys CHANGE COLUMN end end_date INT(11) NOT NULL DEFAULT 0;
ALTER TABLE surveys ADD COLUMN date_format VARCHAR(50) NOT NULL DEFAULT '';
ALTER TABLE surveys ADD COLUMN created INT(11) NOT NULL DEFAULT 0;
ALTER TABLE surveys ADD COLUMN time_limit INT(11) NOT NULL DEFAULT 0;
UPDATE surveys SET date_format = 'Y-m-d H:i:s', created = UNIX_TIMESTAMP(NOW());

ALTER TABLE answer_types CHANGE COLUMN type type VARCHAR(5) NOT NULL DEFAULT 'T';

ALTER TABLE dependencies DROP INDEX sid;
ALTER TABLE dependencies ADD INDEX sid(sid);
ALTER TABLE dependencies ADD INDEX qid(qid);
ALTER TABLE dependencies ADD INDEX dep_qid(dep_qid);
ALTER TABLE dependencies ADD INDEX dep_aid(dep_aid);

ALTER TABLE answer_types CHANGE COLUMN aid aid INT NOT NULL;
CREATE TABLE answer_types_sequence (id INT NOT NULL);
INSERT INTO answer_types_sequence SELECT MAX(aid) FROM answer_types;

ALTER TABLE answer_values CHANGE COLUMN avid avid INT NOT NULL;
CREATE TABLE answer_values_sequence (id INT NOT NULL);
INSERT INTO answer_values_sequence SELECT MAX(avid) FROM answer_values;

ALTER TABLE dependencies CHANGE COLUMN dep_id dep_id INT NOT NULL;
CREATE TABLE dependencies_sequence (id INT NOT NULL);
INSERT INTO dependencies_sequence SELECT MAX(dep_id) FROM dependencies;

ALTER TABLE questions CHANGE COLUMN qid qid INT NOT NULL;
CREATE TABLE questions_sequence (id INT NOT NULL);
INSERT INTO questions_sequence SELECT MAX(qid) FROM questions;

ALTER TABLE results CHANGE COLUMN rid rid INT NOT NULL;
CREATE TABLE results_sequence (id INT NOT NULL);
INSERT INTO results_sequence SELECT MAX(rid) FROM results;

ALTER TABLE results_text CHANGE COLUMN rid rid INT NOT NULL;
CREATE TABLE results_text_sequence (id INT NOT NULL);
INSERT INTO results_text_sequence SELECT MAX(rid) FROM results_text;

ALTER TABLE sequence CHANGE COLUMN sequence id INT NOT NULL;
CREATE TEMPORARY TABLE sequence_temp SELECT MAX(id) AS id FROM sequence;
DELETE FROM sequence;
INSERT INTO sequence SELECT id FROM sequence_temp;

ALTER TABLE surveys CHANGE COLUMN sid sid INT NOT NULL;
CREATE TABLE surveys_sequence (id INT NOT NULL PRIMARY KEY);
INSERT INTO surveys_sequence SELECT MAX(sid) FROM surveys;

ALTER TABLE results ADD COLUMN entered2 INT NOT NULL DEFAULT 0;
UPDATE results SET entered2 = UNIX_TIMESTAMP(entered);
ALTER TABLE results DROP COLUMN entered;
ALTER TABLE results CHANGE COLUMN entered2 entered INT NOT NULL DEFAULT 0;

ALTER TABLE results_text ADD COLUMN entered2 INT NOT NULL DEFAULT 0;
UPDATE results_text SET entered2 = UNIX_TIMESTAMP(entered);
ALTER TABLE results_text DROP COLUMN entered;
ALTER TABLE results_text CHANGE COLUMN entered2 entered INT NOT NULL DEFAULT 0;

CREATE TABLE time_limit (
  sequence int(11) NOT NULL default '0',
  sid int(11) NOT NULL default '0',
  elapsed_time int(11) NOT NULL default '0',
  quitflag int(11) NOT NULL default '0',
  PRIMARY KEY  (sequence),
  KEY sid (sid)
);

INSERT INTO answer_types VALUES (%answer_types_sequence%,'Amount (0 - 10, more than 10)','MS','',0);
INSERT INTO answer_values VALUES
 (%answer_values_sequence%,%answer_types_lastgenid%,'0',1,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'1',2,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'2',3,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'3',4,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'4',5,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'5',6,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'6',7,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'7',8,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'8',9,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'9',10,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'10',11,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'more than 10',12,'bar.gif');

INSERT INTO answer_types VALUES (%answer_types_sequence%,'Amount (1 to 10, more than 10)','MS','',0);
INSERT INTO answer_values VALUES
 (%answer_values_sequence%,%answer_types_lastgenid%,'1',1,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'2',2,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'3',3,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'4',4,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'5',5,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'6',6,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'7',7,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'8',8,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'9',9,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'10',10,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'more than 10',11,'bar.gif');

INSERT INTO answer_types VALUES (%answer_types_sequence%,'Low / Moderate / High','MS','',0);
INSERT INTO answer_values VALUES
 (%answer_values_sequence%,%answer_types_lastgenid%,'Low',1,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Moderate',2,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'High',3,'bar.gif');

INSERT INTO answer_types VALUES (%answer_types_sequence%,'None / Moderate / High','MS','',0);
INSERT INTO answer_values VALUES
 (%answer_values_sequence%,%answer_types_lastgenid%,'None',1,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Moderate',2,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'High',3,'bar.gif');

INSERT INTO answer_types VALUES (%answer_types_sequence%,'Great Extent / Moderate / None','MS','',0);
INSERT INTO answer_values VALUES
 (%answer_values_sequence%,%answer_types_lastgenid%,'Great extent',1,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Moderate extent',2,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Not at all',3,'bar.gif');

INSERT INTO answer_types VALUES (%answer_types_sequence%,'Agree / Disagree (3 options)','MS','',0);
INSERT INTO answer_values VALUES
 (%answer_values_sequence%,%answer_types_lastgenid%,'Agree',1,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Neither agree nor disagree',2,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Disagree',3,'bar.gif');

INSERT INTO answer_types VALUES (%answer_types_sequence%,'Good / Okay / Bad','MS','',0);
INSERT INTO answer_values VALUES
 (%answer_values_sequence%,%answer_types_lastgenid%,'Good',1,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Okay',2,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Bad',3,'bar.gif');

INSERT INTO answer_types VALUES (%answer_types_sequence%,'None to Extremely High with Slight','MS','',0);
INSERT INTO answer_values VALUES
 (%answer_values_sequence%,%answer_types_lastgenid%,'None',1,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Slight',2,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Moderate',3,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'High',4,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Very High',5,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Extremely High',6,'bar.gif');

INSERT INTO answer_types VALUES (%answer_types_sequence%,'Yes / No / NA','MS','',0);
INSERT INTO answer_values VALUES
 (%answer_values_sequence%,%answer_types_lastgenid%,'Yes',1,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'No',2,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Not Applicable',3,'bar.gif');

INSERT INTO answer_types VALUES (%answer_types_sequence%,'None','N','',0);

INSERT INTO answer_types VALUES (%answer_types_sequence%,'Race','MS','',0);
INSERT INTO answer_values VALUES
 (%answer_values_sequence%,%answer_types_lastgenid%,'Asian',1,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Black',2,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Hispanic',3,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Other',4,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'White',5,'bar.gif');

INSERT INTO answer_types VALUES (%answer_types_sequence%,'Gender','MS','',0);
INSERT INTO answer_values VALUES
 (%answer_values_sequence%,%answer_types_lastgenid%,'Male',1,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Female',2,'bar.gif');

INSERT INTO answer_types VALUES (%answer_types_sequence%,'Time in Current Position','MS','',0);
INSERT INTO answer_values VALUES
 (%answer_values_sequence%,%answer_types_lastgenid%,'Less than 1 month',1,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'1 - 6 months',2,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'6 - 12 months',3,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'1 - 2 years',4,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'2 - 3 years',5,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'3 - 4 years',6,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'4 - 5 years',7,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'5 - 10 years',8,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'10 - 15 years',9,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'15 - 20 years',10,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'20+ years',11,'bar.gif');

INSERT INTO answer_types VALUES (%answer_types_sequence%,'Agree / Disagree / Don\'t Use Them','MS','',0);
INSERT INTO answer_values VALUES
 (%answer_values_sequence%,%answer_types_lastgenid%,'Agree',1,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Disagree',2,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Don\'t use them',3,'bar.gif');

INSERT INTO answer_types VALUES (%answer_types_sequence%,'Yes / Maybe / Not','MS','',0);
INSERT INTO answer_values VALUES
 (%answer_values_sequence%,%answer_types_lastgenid%,'Definitely Yes',1,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Cautiously Yes',2,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Maybe',3,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Probably Not',4,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Definitely Not',5,'bar.gif');

INSERT INTO answer_types VALUES (%answer_types_sequence%,'Like / Borderline / Dislike','MS','',0);
INSERT INTO answer_values VALUES
 (%answer_values_sequence%,%answer_types_lastgenid%,'Like a lot',1,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Borderline',2,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Dislike',3,'bar.gif');

INSERT INTO answer_types VALUES (%answer_types_sequence%,'Well / Borderline / Never','MS','',0);
INSERT INTO answer_values VALUES
 (%answer_values_sequence%,%answer_types_lastgenid%,'Very well',1,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Well',2,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Borderline',3,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Poorly',4,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Never',5,'bar.gif');


INSERT INTO answer_types VALUES (%answer_types_sequence%,'Yes / No - Affected By','MS','',0);
INSERT INTO answer_values VALUES
 (%answer_values_sequence%,%answer_types_lastgenid%,'No',1,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Yes - Did not affect me',2,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Yes - Affected me',3,'bar.gif');

INSERT INTO answer_types VALUES (%answer_types_sequence%,'High / Moderate / Low','MS','',0);
INSERT INTO answer_values VALUES
 (%answer_values_sequence%,%answer_types_lastgenid%,'Very high',1,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'High',2,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Moderate',3,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Low',4,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Very Low',5,'bar.gif');

INSERT INTO answer_types VALUES (%answer_types_sequence%,'Apply to Extent','MS','',0);
INSERT INTO answer_values VALUES
 (%answer_values_sequence%,%answer_types_lastgenid%,'Very great extent',1,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Great extent',2,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Moderate extent',3,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Slight Extent',4,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Not at all',5,'bar.gif');

INSERT INTO answer_types VALUES (%answer_types_sequence%,'Discrimination Types','MM','Check all that apply',0);
INSERT INTO answer_values VALUES
 (%answer_values_sequence%,%answer_types_lastgenid%,'No',1,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Yes - National Orgin',2,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Yes - Religious',3,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Yes - Gender',4,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Yes - Racial',5,'bar.gif');

INSERT INTO answer_types VALUES (%answer_types_sequence%,'Yes / No / Don\'t Know - Frequency','MS','',0);
INSERT INTO answer_values VALUES
 (%answer_values_sequence%,%answer_types_lastgenid%,'No',1,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Yes - Once in a while',2,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Yes - Frequently',3,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Yes - Very frequently',4,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Don\'t know',5,'bar.gif');

INSERT INTO answer_types VALUES (%answer_types_sequence%,'Agree / Disagree (5 options)','MS','',0);
INSERT INTO answer_values VALUES
 (%answer_values_sequence%,%answer_types_lastgenid%,'Strongly Agree',1,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Agree',2,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Neither agree nor disagree',3,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Disagree',4,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'Strongly Disagree',5,'bar.gif');

INSERT INTO answer_types VALUES (%answer_types_sequence%,'True / False','MS','',0);
INSERT INTO answer_values VALUES
 (%answer_values_sequence%,%answer_types_lastgenid%,'True',1,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'False',2,'bar.gif');

INSERT INTO answer_types VALUES (%answer_types_sequence%,'Yes / No','MS','',0);
INSERT INTO answer_values VALUES
 (%answer_values_sequence%,%answer_types_lastgenid%,'Yes',1,'bar.gif'),
 (%answer_values_sequence%,%answer_types_lastgenid%,'No',2,'bar.gif');

INSERT INTO answer_types VALUES (%answer_types_sequence%,'Sentence (255 characters)','S','',0);

INSERT INTO answer_types VALUES (%answer_types_sequence%,'Textbox (Large)','T','',0);