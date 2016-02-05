
DROP TABLE IF EXISTS history;
CREATE TABLE history (
  id int(11) NOT NULL auto_increment,
  who varchar(25)  NOT NULL,
  `when` timestamp  NOT NULL default CURRENT_TIMESTAMP,
  description text  NOT NULL,
  ip_address varchar(15)  NOT NULL,
  PRIMARY KEY  (id)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

ALTER TABLE users ADD COLUMN `salt` VARCHAR( 16 ) DEFAULT '' NOT NULL AFTER `password`;

ALTER TABLE `users` CHANGE `password` `password` VARCHAR( 40 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL;
