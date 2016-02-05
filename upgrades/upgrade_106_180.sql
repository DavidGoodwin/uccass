CREATE TABLE `completed_surveys` (
  `uid` int(11) NOT NULL default '0',
  `sid` int(11) NOT NULL default '0',
  `completed` int(11) NOT NULL default '0',
  KEY `uid` (`uid`)
);

CREATE TABLE `users` (
  `uid` int(11) NOT NULL default '0',
  `sid` int(11) NOT NULL default '0',
  `name` varchar(50) NOT NULL default '',
  `email` varchar(100) NOT NULL default '',
  `username` varchar(25) NOT NULL default '',
  `password` varchar(25) NOT NULL default '',
  `admin_priv` int(11) NOT NULL default '0',
  `create_priv` int(11) NOT NULL default '0',
  `take_priv` int(11) NOT NULL default '0',
  `results_priv` int(11) NOT NULL default '0',
  `edit_priv` int(11) NOT NULL default '0',
  `status` int(11) NOT NULL default '0',
  `status_date` int(11) NOT NULL default '0',
  `invite_code` varchar(32) default NULL,
  PRIMARY KEY  (`uid`,`sid`)
);

CREATE TABLE `users_sequence` (
  `id` int(11) NOT NULL default '0'
);

ALTER TABLE ip_track ADD COLUMN completed INT NOT NULL DEFAULT 0;
ALTER TABLE surveys ADD COLUMN hidden INT NOT NULL DEFAULT 0;
ALTER TABLE surveys ADD COLUMN public_results INT NOT NULL DEFAULT 0;
ALTER TABLE surveys ADD COLUMN access_control INT NOT NULL DEFAULT 0;
ALTER TABLE surveys ADD COLUMN survey_limit_times INT NOT NULL DEFAULT 0;
ALTER TABLE surveys ADD COLUMN survey_limit_number INT NOT NULL DEFAULT 0;
ALTER TABLE surveys ADD COLUMN survey_limit_unit INT NOT NULL DEFAULT 0;
ALTER TABLE surveys ADD COLUMN survey_limit_seconds INT NOT NULL DEFAULT 0;

INSERT INTO users_sequence (id) VALUES (1);
INSERT INTO users (uid, sid, username, password, admin_priv, create_priv) VALUES (1,0,'admin','password',1,1);

ALTER TABLE surveys DROP COLUMN survey_access;
ALTER TABLE surveys DROP COLUMN survey_password;
ALTER TABLE surveys DROP COLUMN results_password;
ALTER TABLE surveys DROP COLUMN results_access;
ALTER TABLE surveys DROP COLUMN edit_password;

ALTER TABLE answer_values CHANGE COLUMN group_id numeric_value INT NOT NULL DEFAULT 0;