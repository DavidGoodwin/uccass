-- MySQL dump 9.11
--
-- Host: localhost    Database: UCCASS
-- ------------------------------------------------------
-- Server version	4.0.20a-nt

--
-- Table structure for table `answer_types`
--

DROP TABLE IF EXISTS answer_types;
CREATE TABLE answer_types (
  aid int(11) NOT NULL default '0',
  name varchar(50) NOT NULL default '',
  type varchar(5) NOT NULL default 'T',
  label varchar(255) NOT NULL default '',
  sid int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (aid)
) CHARACTER SET latin1
TYPE=MyISAM;

--
-- Dumping data for table `answer_types`
--

INSERT INTO answer_types VALUES (1,'Textbox (Large)','T','',2);
INSERT INTO answer_types VALUES (2,'Sentence (255 characters)','S','',2);
INSERT INTO answer_types VALUES (3,'Yes / No','MS','',2);
INSERT INTO answer_types VALUES (4,'True / False','MS','',2);
INSERT INTO answer_types VALUES (5,'Agree / Disagree (5 options)','MS','',2);
INSERT INTO answer_types VALUES (6,'Yes / No / Don\'t Know - Frequency','MS','',2);
INSERT INTO answer_types VALUES (9,'Discrimination Types','MM','Check all that apply',2);
INSERT INTO answer_types VALUES (10,'Apply to Extent','MS','',2);
INSERT INTO answer_types VALUES (11,'High / Moderate / Low','MS','',2);
INSERT INTO answer_types VALUES (12,'Yes / No - Affected By','MS','',2);
INSERT INTO answer_types VALUES (13,'Well / Borderline / Never','MS','',2);
INSERT INTO answer_types VALUES (14,'Like / Borderline / Dislike','MS','',2);
INSERT INTO answer_types VALUES (15,'Yes / Maybe / Not','MS','',2);
INSERT INTO answer_types VALUES (16,'Agree / Disagree / Don\'t Use Them','MS','',2);
INSERT INTO answer_types VALUES (103,'Time in Current Position','MS','',2);
INSERT INTO answer_types VALUES (107,'Gender','MS','',2);
INSERT INTO answer_types VALUES (108,'Race','MS','',2);
INSERT INTO answer_types VALUES (24,'None','N','',2);
INSERT INTO answer_types VALUES (312,'Discrimination Types','MM','Check all that apply',0);
INSERT INTO answer_types VALUES (26,'Yes / No / NA','MS','',2);
INSERT INTO answer_types VALUES (30,'None to Extremely High with Slight','MS','',2);
INSERT INTO answer_types VALUES (311,'Apply to Extent','MS','',0);
INSERT INTO answer_types VALUES (39,'Good / Okay / Bad','MS','',2);
INSERT INTO answer_types VALUES (310,'High / Moderate / Low','MS','',0);
INSERT INTO answer_types VALUES (110,'Agree / Disagree (3 options)','MS','',2);
INSERT INTO answer_types VALUES (111,'Great Extent / Moderate / None','MS','',2);
INSERT INTO answer_types VALUES (112,'None / Moderate / High','MS','',2);
INSERT INTO answer_types VALUES (113,'Low / Moderate / High','MS','',2);
INSERT INTO answer_types VALUES (116,'Amount (1 to 10, more than 10)','MS','',2);
INSERT INTO answer_types VALUES (117,'Amount (0 - 10, more than 10)','MS','',2);
INSERT INTO answer_types VALUES (169,'None (Blank)','N','',5);
INSERT INTO answer_types VALUES (168,'Text','T','',5);
INSERT INTO answer_types VALUES (167,'Sentence','S','',5);
INSERT INTO answer_types VALUES (166,'Race','MS','',5);
INSERT INTO answer_types VALUES (165,'Gender','MS','',5);
INSERT INTO answer_types VALUES (164,'Yes / No','MS','',5);
INSERT INTO answer_types VALUES (163,'Discrimination Options','MM','',5);
INSERT INTO answer_types VALUES (162,'Yes / No (bother me)','MS','',5);
INSERT INTO answer_types VALUES (161,'High / Moderate / Low','MS','',5);
INSERT INTO answer_types VALUES (160,'Prepared / Not Prepared','MS','',5);
INSERT INTO answer_types VALUES (159,'Great Extent / Slight Extent / Not at all','MS','',5);
INSERT INTO answer_types VALUES (158,'Helpful / Not Helpful','MS','',5);
INSERT INTO answer_types VALUES (157,'14+ days / 1-3 days','MS','',5);
INSERT INTO answer_types VALUES (156,'None / Slight / High','MS','',5);
INSERT INTO answer_types VALUES (155,'No / Yes - Frequently','MS','',5);
INSERT INTO answer_types VALUES (154,'Agree / Disagree','MS','',5);
INSERT INTO answer_types VALUES (309,'Yes / No - Affected By','MS','',0);
INSERT INTO answer_types VALUES (308,'Well / Borderline / Never','MS','',0);
INSERT INTO answer_types VALUES (307,'Like / Borderline / Dislike','MS','',0);
INSERT INTO answer_types VALUES (306,'Yes / Maybe / Not','MS','',0);
INSERT INTO answer_types VALUES (304,'Time in Current Position','MS','',0);
INSERT INTO answer_types VALUES (305,'Agree / Disagree / Don\'t Use Them','MS','',0);
INSERT INTO answer_types VALUES (303,'Gender','MS','',0);
INSERT INTO answer_types VALUES (302,'Race','MS','',0);
INSERT INTO answer_types VALUES (301,'Yes / No / NA','MS','',0);
INSERT INTO answer_types VALUES (300,'None to Extremely High with Slight','MS','',0);
INSERT INTO answer_types VALUES (299,'Good / Okay / Bad','MS','',0);
INSERT INTO answer_types VALUES (298,'Agree / Disagree (3 options)','MS','',0);
INSERT INTO answer_types VALUES (297,'Great Extent / Moderate / None','MS','',0);
INSERT INTO answer_types VALUES (296,'None / Moderate / High','MS','',0);
INSERT INTO answer_types VALUES (295,'Low / Moderate / High','MS','',0);
INSERT INTO answer_types VALUES (294,'Amount (1 to 10, more than 10)','MS','',0);
INSERT INTO answer_types VALUES (293,'Amount (0 - 10, more than 10)','MS','',0);
INSERT INTO answer_types VALUES (292,'Textbox (Large)','T','',0);
INSERT INTO answer_types VALUES (291,'Sentence (255 characters)','S','',0);
INSERT INTO answer_types VALUES (290,'None','N','',0);
INSERT INTO answer_types VALUES (313,'Yes / No / Don\'t Know - Frequency','MS','',0);
INSERT INTO answer_types VALUES (314,'Agree / Disagree (5 options)','MS','',0);
INSERT INTO answer_types VALUES (315,'True / False','MS','',0);
INSERT INTO answer_types VALUES (316,'Yes / No','MS','',0);

--
-- Table structure for table `answer_types_sequence`
--

DROP TABLE IF EXISTS answer_types_sequence;
CREATE TABLE answer_types_sequence (
  id int(11) NOT NULL default '0',
  PRIMARY KEY  (id)
) TYPE=MyISAM;

--
-- Dumping data for table `answer_types_sequence`
--

INSERT INTO answer_types_sequence VALUES (876);

--
-- Table structure for table `answer_values`
--

DROP TABLE IF EXISTS answer_values;
CREATE TABLE answer_values (
  avid int(11) NOT NULL default '0',
  aid int(10) unsigned NOT NULL default '0',
  value varchar(255) NOT NULL default '',
  numeric_value int(11) NOT NULL default '0',
  image varchar(255) NOT NULL default '',
  PRIMARY KEY  (avid),
  KEY aid (aid)
) CHARACTER SET latin1
TYPE=MyISAM;

--
-- Dumping data for table `answer_values`
--

INSERT INTO answer_values VALUES (1,3,'Yes',1,'bar.gif');
INSERT INTO answer_values VALUES (2,3,'No',2,'bar.gif');
INSERT INTO answer_values VALUES (3,4,'True',1,'bar.gif');
INSERT INTO answer_values VALUES (4,4,'False',2,'bar.gif');
INSERT INTO answer_values VALUES (5,5,'Strongly Agree',1,'bar.gif');
INSERT INTO answer_values VALUES (6,5,'Agree',2,'bar.gif');
INSERT INTO answer_values VALUES (7,5,'Neither agree nor disagree',3,'bar.gif');
INSERT INTO answer_values VALUES (8,5,'Disagree',4,'bar.gif');
INSERT INTO answer_values VALUES (9,5,'Strongly Disagree',5,'bar.gif');
INSERT INTO answer_values VALUES (10,6,'No',1,'bar.gif');
INSERT INTO answer_values VALUES (11,6,'Yes - Once in a while',2,'bar.gif');
INSERT INTO answer_values VALUES (12,6,'Yes - Frequently',3,'bar.gif');
INSERT INTO answer_values VALUES (13,6,'Yes - Very frequently',4,'bar.gif');
INSERT INTO answer_values VALUES (14,6,'Don\'t know',5,'bar.gif');
INSERT INTO answer_values VALUES (25,9,'No',1,'bar.gif');
INSERT INTO answer_values VALUES (26,9,'Yes - National Orgin',2,'bar.gif');
INSERT INTO answer_values VALUES (27,9,'Yes - Religious',3,'bar.gif');
INSERT INTO answer_values VALUES (28,9,'Yes - Gender',4,'bar.gif');
INSERT INTO answer_values VALUES (29,9,'Yes - Racial',5,'bar.gif');
INSERT INTO answer_values VALUES (30,10,'Very great extent',1,'bar.gif');
INSERT INTO answer_values VALUES (31,10,'Great extent',2,'bar.gif');
INSERT INTO answer_values VALUES (32,10,'Moderate extent',3,'bar.gif');
INSERT INTO answer_values VALUES (33,10,'Slight Extent',4,'bar.gif');
INSERT INTO answer_values VALUES (34,10,'Not at all',5,'bar.gif');
INSERT INTO answer_values VALUES (35,11,'Very high',1,'bar.gif');
INSERT INTO answer_values VALUES (36,11,'High',2,'bar.gif');
INSERT INTO answer_values VALUES (37,11,'Moderate',3,'bar.gif');
INSERT INTO answer_values VALUES (38,11,'Low',4,'bar.gif');
INSERT INTO answer_values VALUES (39,11,'Very Low',5,'bar.gif');
INSERT INTO answer_values VALUES (40,12,'No',1,'bar.gif');
INSERT INTO answer_values VALUES (41,12,'Yes - Did not affect me',2,'bar.gif');
INSERT INTO answer_values VALUES (42,12,'Yes - Affected me',3,'bar.gif');
INSERT INTO answer_values VALUES (43,13,'Very well',1,'bar.gif');
INSERT INTO answer_values VALUES (44,13,'Well',2,'bar.gif');
INSERT INTO answer_values VALUES (45,13,'Borderline',3,'bar.gif');
INSERT INTO answer_values VALUES (46,13,'Poorly',4,'bar.gif');
INSERT INTO answer_values VALUES (47,13,'Never',5,'bar.gif');
INSERT INTO answer_values VALUES (48,14,'Like a lot',1,'bar.gif');
INSERT INTO answer_values VALUES (49,14,'Borderline',2,'bar.gif');
INSERT INTO answer_values VALUES (50,14,'Dislike',3,'bar.gif');
INSERT INTO answer_values VALUES (51,15,'Definitely Yes',1,'bar.gif');
INSERT INTO answer_values VALUES (52,15,'Cautiously Yes',2,'bar.gif');
INSERT INTO answer_values VALUES (53,15,'Maybe',3,'bar.gif');
INSERT INTO answer_values VALUES (54,15,'Probably Not',4,'bar.gif');
INSERT INTO answer_values VALUES (55,15,'Definitely Not',5,'bar.gif');
INSERT INTO answer_values VALUES (56,16,'Agree',1,'bar.gif');
INSERT INTO answer_values VALUES (57,16,'Disagree',2,'bar.gif');
INSERT INTO answer_values VALUES (58,16,'Don\'t use them',3,'bar.gif');
INSERT INTO answer_values VALUES (79,103,'Less than 1 month',1,'bar.gif');
INSERT INTO answer_values VALUES (80,103,'1 - 6 months',2,'bar.gif');
INSERT INTO answer_values VALUES (81,103,'6 - 12 months',3,'bar.gif');
INSERT INTO answer_values VALUES (82,103,'1 - 2 years',4,'bar.gif');
INSERT INTO answer_values VALUES (83,103,'2 - 3 years',5,'bar.gif');
INSERT INTO answer_values VALUES (84,103,'3 - 4 years',6,'bar.gif');
INSERT INTO answer_values VALUES (85,103,'4 - 5 years',7,'bar.gif');
INSERT INTO answer_values VALUES (86,103,'5 - 10 years',8,'bar.gif');
INSERT INTO answer_values VALUES (87,103,'10 - 15 years',9,'bar.gif');
INSERT INTO answer_values VALUES (88,103,'15 - 20 years',10,'bar.gif');
INSERT INTO answer_values VALUES (89,103,'20+ years',11,'bar.gif');
INSERT INTO answer_values VALUES (90,107,'Male',1,'bar.gif');
INSERT INTO answer_values VALUES (91,107,'Female',2,'bar.gif');
INSERT INTO answer_values VALUES (92,108,'Asian',1,'bar.gif');
INSERT INTO answer_values VALUES (93,108,'Black',2,'bar.gif');
INSERT INTO answer_values VALUES (94,108,'Hispanic',3,'bar.gif');
INSERT INTO answer_values VALUES (95,108,'Other',4,'bar.gif');
INSERT INTO answer_values VALUES (96,108,'White',5,'bar.gif');
INSERT INTO answer_values VALUES (119,26,'Yes',1,'bar.gif');
INSERT INTO answer_values VALUES (120,26,'No',2,'bar.gif');
INSERT INTO answer_values VALUES (121,26,'Not Applicable',3,'bar.gif');
INSERT INTO answer_values VALUES (134,30,'None',1,'bar.gif');
INSERT INTO answer_values VALUES (135,30,'Slight',2,'bar.gif');
INSERT INTO answer_values VALUES (136,30,'Moderate',3,'bar.gif');
INSERT INTO answer_values VALUES (137,30,'High',4,'bar.gif');
INSERT INTO answer_values VALUES (138,30,'Very High',5,'bar.gif');
INSERT INTO answer_values VALUES (139,30,'Extremely High',6,'bar.gif');
INSERT INTO answer_values VALUES (1162,314,'Neither agree nor disagree',3,'bar.gif');
INSERT INTO answer_values VALUES (1161,314,'Disagree',4,'bar.gif');
INSERT INTO answer_values VALUES (1160,314,'Strongly Disagree',5,'bar.gif');
INSERT INTO answer_values VALUES (1159,313,'No',1,'bar.gif');
INSERT INTO answer_values VALUES (1158,313,'Yes - Once in a while',2,'bar.gif');
INSERT INTO answer_values VALUES (177,39,'Good',1,'bar.gif');
INSERT INTO answer_values VALUES (178,39,'Okay',2,'bar.gif');
INSERT INTO answer_values VALUES (179,39,'Bad',3,'bar.gif');
INSERT INTO answer_values VALUES (1157,313,'Yes - Frequently',3,'bar.gif');
INSERT INTO answer_values VALUES (1156,313,'Yes - Very frequently',4,'bar.gif');
INSERT INTO answer_values VALUES (1154,312,'No',1,'bar.gif');
INSERT INTO answer_values VALUES (1155,313,'Don\'t know',5,'bar.gif');
INSERT INTO answer_values VALUES (1153,312,'Yes - National Orgin',2,'bar.gif');
INSERT INTO answer_values VALUES (1152,312,'Yes - Religious',3,'bar.gif');
INSERT INTO answer_values VALUES (1151,312,'Yes - Gender',4,'bar.gif');
INSERT INTO answer_values VALUES (1150,312,'Yes - Racial',5,'bar.gif');
INSERT INTO answer_values VALUES (1149,311,'Very great extent',1,'bar.gif');
INSERT INTO answer_values VALUES (1148,311,'Great extent',2,'bar.gif');
INSERT INTO answer_values VALUES (1147,311,'Moderate extent',3,'bar.gif');
INSERT INTO answer_values VALUES (1146,311,'Slight Extent',4,'bar.gif');
INSERT INTO answer_values VALUES (1145,311,'Not at all',5,'bar.gif');
INSERT INTO answer_values VALUES (1144,310,'Very high',1,'bar.gif');
INSERT INTO answer_values VALUES (1143,310,'High',2,'bar.gif');
INSERT INTO answer_values VALUES (1142,310,'Moderate',3,'bar.gif');
INSERT INTO answer_values VALUES (1140,310,'Very Low',5,'bar.gif');
INSERT INTO answer_values VALUES (217,110,'Agree',1,'bar.gif');
INSERT INTO answer_values VALUES (218,110,'Neither agree nor disagree',2,'bar.gif');
INSERT INTO answer_values VALUES (219,110,'Disagree',3,'bar.gif');
INSERT INTO answer_values VALUES (220,111,'Great extent',1,'bar.gif');
INSERT INTO answer_values VALUES (221,111,'Moderate extent',2,'bar.gif');
INSERT INTO answer_values VALUES (222,111,'Not at all',3,'bar.gif');
INSERT INTO answer_values VALUES (223,112,'None',1,'bar.gif');
INSERT INTO answer_values VALUES (224,112,'Moderate',2,'bar.gif');
INSERT INTO answer_values VALUES (225,112,'High',3,'bar.gif');
INSERT INTO answer_values VALUES (226,113,'Low',1,'bar.gif');
INSERT INTO answer_values VALUES (227,113,'Moderate',2,'bar.gif');
INSERT INTO answer_values VALUES (228,113,'High',3,'bar.gif');
INSERT INTO answer_values VALUES (1141,310,'Low',4,'bar.gif');
INSERT INTO answer_values VALUES (1139,309,'No',1,'bar.gif');
INSERT INTO answer_values VALUES (1138,309,'Yes - Did not affect me',2,'bar.gif');
INSERT INTO answer_values VALUES (1137,309,'Yes - Affected me',3,'bar.gif');
INSERT INTO answer_values VALUES (1136,308,'Very well',1,'bar.gif');
INSERT INTO answer_values VALUES (239,116,'1',1,'bar.gif');
INSERT INTO answer_values VALUES (240,116,'2',2,'bar.gif');
INSERT INTO answer_values VALUES (241,116,'3',3,'bar.gif');
INSERT INTO answer_values VALUES (242,116,'4',4,'bar.gif');
INSERT INTO answer_values VALUES (243,116,'5',5,'bar.gif');
INSERT INTO answer_values VALUES (244,116,'6',6,'bar.gif');
INSERT INTO answer_values VALUES (245,116,'7',7,'bar.gif');
INSERT INTO answer_values VALUES (246,116,'8',8,'bar.gif');
INSERT INTO answer_values VALUES (247,116,'9',9,'bar.gif');
INSERT INTO answer_values VALUES (248,116,'10',10,'bar.gif');
INSERT INTO answer_values VALUES (249,116,'more than 10',11,'bar.gif');
INSERT INTO answer_values VALUES (1135,308,'Well',2,'bar.gif');
INSERT INTO answer_values VALUES (715,117,'more than 10',12,'bar.gif');
INSERT INTO answer_values VALUES (714,117,'10',11,'bar.gif');
INSERT INTO answer_values VALUES (713,117,'9',10,'bar.gif');
INSERT INTO answer_values VALUES (712,117,'8',9,'bar.gif');
INSERT INTO answer_values VALUES (711,117,'7',8,'bar.gif');
INSERT INTO answer_values VALUES (704,117,'0',1,'bar.gif');
INSERT INTO answer_values VALUES (705,117,'1',2,'bar.gif');
INSERT INTO answer_values VALUES (706,117,'2',3,'bar.gif');
INSERT INTO answer_values VALUES (707,117,'3',4,'bar.gif');
INSERT INTO answer_values VALUES (708,117,'4',5,'bar.gif');
INSERT INTO answer_values VALUES (709,117,'5',6,'bar.gif');
INSERT INTO answer_values VALUES (710,117,'6',7,'bar.gif');
INSERT INTO answer_values VALUES (515,166,'Other (Hispanic, Asian or Pacific Islander, Native American, Eskimo or Aleut)',3,'bar.gif');
INSERT INTO answer_values VALUES (514,166,'White',2,'bar.gif');
INSERT INTO answer_values VALUES (513,166,'Black',1,'bar.gif');
INSERT INTO answer_values VALUES (512,165,'Female',2,'bar.gif');
INSERT INTO answer_values VALUES (511,165,'Male',1,'bar.gif');
INSERT INTO answer_values VALUES (510,164,'Yes',2,'bar.gif');
INSERT INTO answer_values VALUES (509,164,'No',1,'bar.gif');
INSERT INTO answer_values VALUES (508,163,'Yes, national orgin',5,'bar.gif');
INSERT INTO answer_values VALUES (507,163,'Yes, gender (sex)',4,'bar.gif');
INSERT INTO answer_values VALUES (506,163,'Yes, religious',3,'bar.gif');
INSERT INTO answer_values VALUES (505,163,'Yes, racial',2,'bar.gif');
INSERT INTO answer_values VALUES (504,163,'No',1,'bar.gif');
INSERT INTO answer_values VALUES (503,162,'Yes, and it did affect / bother me',3,'bar.gif');
INSERT INTO answer_values VALUES (502,162,'Yes, but it really didn\'t affect / bother me',2,'bar.gif');
INSERT INTO answer_values VALUES (501,162,'No',1,'bar.gif');
INSERT INTO answer_values VALUES (500,161,'Very Low',5,'bar.gif');
INSERT INTO answer_values VALUES (499,161,'Low',4,'bar.gif');
INSERT INTO answer_values VALUES (498,161,'Moderate',3,'bar.gif');
INSERT INTO answer_values VALUES (497,161,'High',2,'bar.gif');
INSERT INTO answer_values VALUES (496,161,'Very high',1,'bar.gif');
INSERT INTO answer_values VALUES (495,160,'Not at all prepared',5,'bar.gif');
INSERT INTO answer_values VALUES (494,160,'Not well prepared',4,'bar.gif');
INSERT INTO answer_values VALUES (493,160,'Moderately prepared',3,'bar.gif');
INSERT INTO answer_values VALUES (492,160,'Well prepared',2,'bar.gif');
INSERT INTO answer_values VALUES (491,160,'Very well prepared',1,'bar.gif');
INSERT INTO answer_values VALUES (490,159,'Not at all',5,'bar.gif');
INSERT INTO answer_values VALUES (489,159,'Slight Extent',4,'bar.gif');
INSERT INTO answer_values VALUES (488,159,'Moderate Extent',3,'bar.gif');
INSERT INTO answer_values VALUES (487,159,'Great Extent',2,'bar.gif');
INSERT INTO answer_values VALUES (486,159,'Very Great Extent',1,'bar.gif');
INSERT INTO answer_values VALUES (485,158,'Not at all helpful',5,'bar.gif');
INSERT INTO answer_values VALUES (484,158,'Slightly helpful',4,'bar.gif');
INSERT INTO answer_values VALUES (483,158,'Moderately helpful',3,'bar.gif');
INSERT INTO answer_values VALUES (482,158,'Very helpful',2,'bar.gif');
INSERT INTO answer_values VALUES (481,158,'Extremely helpful',1,'bar.gif');
INSERT INTO answer_values VALUES (480,157,'1 - 3 days',5,'bar.gif');
INSERT INTO answer_values VALUES (479,157,'4 - 7 days',4,'bar.gif');
INSERT INTO answer_values VALUES (478,157,'8 - 10 days',3,'bar.gif');
INSERT INTO answer_values VALUES (477,157,'11 - 13 days',2,'bar.gif');
INSERT INTO answer_values VALUES (476,157,'14 or more days',1,'bar.gif');
INSERT INTO answer_values VALUES (475,156,'Extremely High',6,'bar.gif');
INSERT INTO answer_values VALUES (474,156,'Very High',5,'bar.gif');
INSERT INTO answer_values VALUES (473,156,'High',4,'bar.gif');
INSERT INTO answer_values VALUES (472,156,'Moderate',3,'bar.gif');
INSERT INTO answer_values VALUES (471,156,'Slight',2,'bar.gif');
INSERT INTO answer_values VALUES (470,156,'None',1,'bar.gif');
INSERT INTO answer_values VALUES (469,155,'Yes, very frequently',4,'bar.gif');
INSERT INTO answer_values VALUES (468,155,'Yes, frequently',3,'bar.gif');
INSERT INTO answer_values VALUES (467,155,'Yes, once in a while',2,'bar.gif');
INSERT INTO answer_values VALUES (466,155,'No',1,'bar.gif');
INSERT INTO answer_values VALUES (465,154,'Strongly Disagree',5,'bar.gif');
INSERT INTO answer_values VALUES (464,154,'Disagree',4,'bar.gif');
INSERT INTO answer_values VALUES (463,154,'Neither Agree nor Disagree',3,'bar.gif');
INSERT INTO answer_values VALUES (462,154,'Agree',2,'bar.gif');
INSERT INTO answer_values VALUES (461,154,'Strongly Agree',1,'bar.gif');
INSERT INTO answer_values VALUES (1134,308,'Borderline',3,'bar.gif');
INSERT INTO answer_values VALUES (1133,308,'Poorly',4,'bar.gif');
INSERT INTO answer_values VALUES (1132,308,'Never',5,'bar.gif');
INSERT INTO answer_values VALUES (1131,307,'Like a lot',1,'bar.gif');
INSERT INTO answer_values VALUES (1130,307,'Borderline',2,'bar.gif');
INSERT INTO answer_values VALUES (1129,307,'Dislike',3,'bar.gif');
INSERT INTO answer_values VALUES (1128,306,'Definitely Yes',1,'bar.gif');
INSERT INTO answer_values VALUES (1127,306,'Cautiously Yes',2,'bar.gif');
INSERT INTO answer_values VALUES (1126,306,'Maybe',3,'bar.gif');
INSERT INTO answer_values VALUES (1125,306,'Probably Not',4,'bar.gif');
INSERT INTO answer_values VALUES (1124,306,'Definitely Not',5,'bar.gif');
INSERT INTO answer_values VALUES (1123,305,'Agree',1,'bar.gif');
INSERT INTO answer_values VALUES (1122,305,'Disagree',2,'bar.gif');
INSERT INTO answer_values VALUES (1121,305,'Don\'t use them',3,'bar.gif');
INSERT INTO answer_values VALUES (1120,304,'Less than 1 month',1,'bar.gif');
INSERT INTO answer_values VALUES (1119,304,'1 - 6 months',2,'bar.gif');
INSERT INTO answer_values VALUES (1118,304,'6 - 12 months',3,'bar.gif');
INSERT INTO answer_values VALUES (1117,304,'1 - 2 years',4,'bar.gif');
INSERT INTO answer_values VALUES (1116,304,'2 - 3 years',5,'bar.gif');
INSERT INTO answer_values VALUES (1115,304,'3 - 4 years',6,'bar.gif');
INSERT INTO answer_values VALUES (1114,304,'4 - 5 years',7,'bar.gif');
INSERT INTO answer_values VALUES (1113,304,'5 - 10 years',8,'bar.gif');
INSERT INTO answer_values VALUES (1112,304,'10 - 15 years',9,'bar.gif');
INSERT INTO answer_values VALUES (1111,304,'15 - 20 years',10,'bar.gif');
INSERT INTO answer_values VALUES (1110,304,'20+ years',11,'bar.gif');
INSERT INTO answer_values VALUES (1109,303,'Male',1,'bar.gif');
INSERT INTO answer_values VALUES (1108,303,'Female',2,'bar.gif');
INSERT INTO answer_values VALUES (1107,302,'Asian',1,'bar.gif');
INSERT INTO answer_values VALUES (1106,302,'Black',2,'bar.gif');
INSERT INTO answer_values VALUES (1105,302,'Hispanic',3,'bar.gif');
INSERT INTO answer_values VALUES (1104,302,'Other',4,'bar.gif');
INSERT INTO answer_values VALUES (1103,302,'White',5,'bar.gif');
INSERT INTO answer_values VALUES (1102,301,'Yes',1,'bar.gif');
INSERT INTO answer_values VALUES (1101,301,'No',2,'bar.gif');
INSERT INTO answer_values VALUES (1100,301,'Not Applicable',3,'bar.gif');
INSERT INTO answer_values VALUES (1099,300,'None',1,'bar.gif');
INSERT INTO answer_values VALUES (1098,300,'Slight',2,'bar.gif');
INSERT INTO answer_values VALUES (1097,300,'Moderate',3,'bar.gif');
INSERT INTO answer_values VALUES (1096,300,'High',4,'bar.gif');
INSERT INTO answer_values VALUES (1095,300,'Very High',5,'bar.gif');
INSERT INTO answer_values VALUES (1094,300,'Extremely High',6,'bar.gif');
INSERT INTO answer_values VALUES (1093,299,'Good',1,'bar.gif');
INSERT INTO answer_values VALUES (1092,299,'Okay',2,'bar.gif');
INSERT INTO answer_values VALUES (1091,299,'Bad',3,'bar.gif');
INSERT INTO answer_values VALUES (1090,298,'Agree',1,'bar.gif');
INSERT INTO answer_values VALUES (1089,298,'Neither agree nor disagree',2,'bar.gif');
INSERT INTO answer_values VALUES (1088,298,'Disagree',3,'bar.gif');
INSERT INTO answer_values VALUES (1087,297,'Great extent',1,'bar.gif');
INSERT INTO answer_values VALUES (1086,297,'Moderate extent',2,'bar.gif');
INSERT INTO answer_values VALUES (1085,297,'Not at all',3,'bar.gif');
INSERT INTO answer_values VALUES (1084,296,'None',1,'bar.gif');
INSERT INTO answer_values VALUES (1083,296,'Moderate',2,'bar.gif');
INSERT INTO answer_values VALUES (1081,295,'Low',1,'bar.gif');
INSERT INTO answer_values VALUES (1082,296,'High',3,'bar.gif');
INSERT INTO answer_values VALUES (1080,295,'Moderate',2,'bar.gif');
INSERT INTO answer_values VALUES (1079,295,'High',3,'bar.gif');
INSERT INTO answer_values VALUES (1078,294,'1',1,'bar.gif');
INSERT INTO answer_values VALUES (1076,294,'3',3,'bar.gif');
INSERT INTO answer_values VALUES (1077,294,'2',2,'bar.gif');
INSERT INTO answer_values VALUES (1075,294,'4',4,'bar.gif');
INSERT INTO answer_values VALUES (1074,294,'5',5,'bar.gif');
INSERT INTO answer_values VALUES (1073,294,'6',6,'bar.gif');
INSERT INTO answer_values VALUES (1072,294,'7',7,'bar.gif');
INSERT INTO answer_values VALUES (1071,294,'8',8,'bar.gif');
INSERT INTO answer_values VALUES (1070,294,'9',9,'bar.gif');
INSERT INTO answer_values VALUES (1069,294,'10',10,'bar.gif');
INSERT INTO answer_values VALUES (1068,294,'more than 10',11,'bar.gif');
INSERT INTO answer_values VALUES (1067,293,'0',1,'bar.gif');
INSERT INTO answer_values VALUES (1066,293,'1',2,'bar.gif');
INSERT INTO answer_values VALUES (1065,293,'2',3,'bar.gif');
INSERT INTO answer_values VALUES (1064,293,'3',4,'bar.gif');
INSERT INTO answer_values VALUES (1063,293,'4',5,'bar.gif');
INSERT INTO answer_values VALUES (1062,293,'5',6,'bar.gif');
INSERT INTO answer_values VALUES (1061,293,'6',7,'bar.gif');
INSERT INTO answer_values VALUES (1060,293,'7',8,'bar.gif');
INSERT INTO answer_values VALUES (1059,293,'8',9,'bar.gif');
INSERT INTO answer_values VALUES (1058,293,'9',10,'bar.gif');
INSERT INTO answer_values VALUES (1057,293,'10',11,'bar.gif');
INSERT INTO answer_values VALUES (1056,293,'more than 10',12,'bar.gif');
INSERT INTO answer_values VALUES (1163,314,'Agree',2,'bar.gif');
INSERT INTO answer_values VALUES (1164,314,'Strongly Agree',1,'bar.gif');
INSERT INTO answer_values VALUES (1165,315,'False',2,'bar.gif');
INSERT INTO answer_values VALUES (1166,315,'True',1,'bar.gif');
INSERT INTO answer_values VALUES (1167,316,'No',2,'bar.gif');
INSERT INTO answer_values VALUES (1168,316,'Yes',1,'bar.gif');

--
-- Table structure for table `answer_values_sequence`
--

DROP TABLE IF EXISTS answer_values_sequence;
CREATE TABLE answer_values_sequence (
  id int(11) NOT NULL default '0',
  PRIMARY KEY  (id)
) TYPE=MyISAM;

--
-- Dumping data for table `answer_values_sequence`
--

INSERT INTO answer_values_sequence VALUES (3506);

--
-- Table structure for table `completed_surveys`
--

DROP TABLE IF EXISTS completed_surveys;
CREATE TABLE completed_surveys (
  uid int(11) NOT NULL default '0',
  sid int(11) NOT NULL default '0',
  completed int(11) NOT NULL default '0',
  KEY uid (uid)
) TYPE=MyISAM;

--
-- Dumping data for table `completed_surveys`
--

INSERT INTO completed_surveys VALUES (1,2,1098405480);
INSERT INTO completed_surveys VALUES (1,2,1098406092);

--
-- Table structure for table `dependencies`
--

DROP TABLE IF EXISTS dependencies;
CREATE TABLE dependencies (
  dep_id int(11) NOT NULL default '0',
  sid int(10) unsigned NOT NULL default '0',
  qid int(10) unsigned NOT NULL default '0',
  dep_qid int(10) unsigned NOT NULL default '0',
  dep_aid int(10) unsigned NOT NULL default '0',
  dep_option varchar(10) NOT NULL default '',
  PRIMARY KEY  (dep_id),
  UNIQUE KEY sid (sid,qid,dep_qid,dep_aid)
) CHARACTER SET latin1
TYPE=MyISAM;

--
-- Dumping data for table `dependencies`
--

INSERT INTO dependencies VALUES (1,2,37,34,177,'Hide');
INSERT INTO dependencies VALUES (12,2,35,32,179,'Require');
INSERT INTO dependencies VALUES (3,2,36,33,178,'Hide');
INSERT INTO dependencies VALUES (4,2,36,33,177,'Hide');
INSERT INTO dependencies VALUES (13,2,36,33,179,'Require');
INSERT INTO dependencies VALUES (6,2,35,32,178,'Hide');
INSERT INTO dependencies VALUES (7,2,35,32,177,'Hide');
INSERT INTO dependencies VALUES (14,2,37,34,179,'Require');
INSERT INTO dependencies VALUES (9,2,29,26,90,'Hide');
INSERT INTO dependencies VALUES (10,2,28,26,91,'Hide');
INSERT INTO dependencies VALUES (11,2,37,34,178,'Hide');

--
-- Table structure for table `dependencies_sequence`
--

DROP TABLE IF EXISTS dependencies_sequence;
CREATE TABLE dependencies_sequence (
  id int(11) NOT NULL default '0',
  PRIMARY KEY  (id)
) TYPE=MyISAM;

--
-- Dumping data for table `dependencies_sequence`
--

INSERT INTO dependencies_sequence VALUES (155);

--
-- Table structure for table `ip_track`
--

DROP TABLE IF EXISTS ip_track;
CREATE TABLE ip_track (
  ip varchar(15) default NULL,
  sid int(10) unsigned default NULL,
  completed int(11) NOT NULL default '0',
  KEY sid (sid)
) CHARACTER SET latin1
TYPE=MyISAM;

--
-- Dumping data for table `ip_track`
--


--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS questions;
CREATE TABLE questions (
  qid int(11) NOT NULL default '0',
  question text NOT NULL,
  aid int(11) NOT NULL default '0',
  sid int(11) NOT NULL default '0',
  page int(11) NOT NULL default '0',
  num_answers int(11) NOT NULL default '0',
  num_required int(11) NOT NULL default '0',
  oid int(10) unsigned NOT NULL default '0',
  orientation varchar(15) NOT NULL default '',
  PRIMARY KEY  (qid),
  KEY aid (aid),
  KEY sid (sid)
) CHARACTER SET latin1
TYPE=MyISAM;

--
-- Dumping data for table `questions`
--

INSERT INTO questions VALUES (31,'For the following questions, please rate the food at the restaurants listed.',24,2,4,1,0,8,'Vertical');
INSERT INTO questions VALUES (30,'What is your favorite hobby?',2,2,3,1,0,7,'Vertical');
INSERT INTO questions VALUES (29,'Do you like to shop?',3,2,3,1,0,3,'Vertical');
INSERT INTO questions VALUES (28,'Do you like to fish?',3,2,3,1,0,2,'Dropdown');
INSERT INTO questions VALUES (26,'Please choose your gender:',107,2,2,1,1,3,'Vertical');
INSERT INTO questions VALUES (32,'McDonalds',39,2,4,1,0,9,'Matrix');
INSERT INTO questions VALUES (33,'Burger King',39,2,4,1,0,11,'Matrix');
INSERT INTO questions VALUES (34,'KFC',39,2,4,1,0,12,'Matrix');
INSERT INTO questions VALUES (35,'Why do you think food is bad at McDonalds?',2,2,5,1,0,12,'Vertical');
INSERT INTO questions VALUES (36,'Why do you think food is bad at Burger King?',2,2,5,1,0,13,'Vertical');
INSERT INTO questions VALUES (37,'Why do you think food is bad at KFC?',2,2,5,1,0,14,'Vertical');
INSERT INTO questions VALUES (38,'Any other comments?',1,2,6,1,0,16,'Vertical');
INSERT INTO questions VALUES (57,'Members in my unit work well together as a team.',154,5,3,1,0,11,'Matrix');
INSERT INTO questions VALUES (56,'It is easy for Soldiers in this unit to see the 1SG about a problem.',154,5,3,1,0,10,'Matrix');
INSERT INTO questions VALUES (55,'It is easy for Soldiers in this unit to see the CO about a problem.',154,5,3,1,0,9,'Matrix');
INSERT INTO questions VALUES (54,'Junior enlisted members in this unit care about what happens to each other.',154,5,3,1,0,8,'Matrix');
INSERT INTO questions VALUES (53,'NCOs in this unit care about what happens to their soldiers.',154,5,2,1,0,4,'Matrix');
INSERT INTO questions VALUES (52,'Officers in this unit care about what happens to their soldiers.',154,5,1,1,0,3,'Matrix');
INSERT INTO questions VALUES (51,'Do you agree or disagree with the following statements about you and your unit?',169,5,3,1,0,7,'Vertical');
INSERT INTO questions VALUES (58,'In terms of work habits and on-the-job behavior, my immediate supervisor sets the right example by his/her actions.',154,5,3,1,0,12,'Matrix');
INSERT INTO questions VALUES (59,'I receive the counseling and coaching needed to advance in my career.',154,5,3,1,0,13,'Matrix');
INSERT INTO questions VALUES (60,'I receive the training needed to perform my job well.',154,5,3,1,0,14,'Matrix');
INSERT INTO questions VALUES (61,'Are racist material(s) displayed by members of this unit?',155,5,3,1,0,15,'Vertical');
INSERT INTO questions VALUES (62,'Are sexually offensive material(s) displayed by members of this unit?',155,5,3,1,0,16,'Vertical');
INSERT INTO questions VALUES (63,'What level of conflict / stress are you experiencing in this unit?',156,5,3,1,0,17,'Vertical');
INSERT INTO questions VALUES (64,'Usually, how far in advance do you know the unit training schedule; that is, where you will be and what you will be doing?',157,5,3,1,0,18,'Vertical');
INSERT INTO questions VALUES (65,'During your last permanent change of station (PCS) move (to this unit), how helpful was this unit?',158,5,3,1,0,19,'Vertical');
INSERT INTO questions VALUES (66,'To what extent do the persons in your chain of command treat you with respect?',159,5,3,1,0,20,'Vertical');
INSERT INTO questions VALUES (67,'To what extent do the following apply to the leaders at your unit or place of duty?\r\n\r\nThe leaders in my unit / place of duty ...',169,5,3,1,0,21,'Vertical');
INSERT INTO questions VALUES (68,'show a real interest in the welfare of families.',159,5,3,1,0,22,'Matrix');
INSERT INTO questions VALUES (69,'show a real interest in the welfare of single Soldiers.',159,5,3,1,0,23,'Matrix');
INSERT INTO questions VALUES (70,'Describe how well prepared this unit is to perform its wartime duties / mission.',160,5,3,1,0,24,'Vertical');
INSERT INTO questions VALUES (71,'How would you rate your current level of morale?',161,5,3,1,0,25,'Vertical');
INSERT INTO questions VALUES (72,'Sexual harassment is a form of gender discrimination that involves deliberate or repeated unwelcome sexual advances, requests for sexual favors, and verbal or physical conduct of a sexual nature (AR 600-20).',169,5,3,1,0,26,'Vertical');
INSERT INTO questions VALUES (73,'During the last 12 months, have YOU been sexually harassed by someone in this unit?',162,5,3,1,0,27,'Vertical');
INSERT INTO questions VALUES (74,'Equal Opportunity refers to the fair, just, and equitable treatment of all soldiers and family members, regardless of race, color, religion, gender (sex), or national origin \r\n(AR 600-20).',169,5,3,1,0,28,'Vertical');
INSERT INTO questions VALUES (75,'During the last 12 months, have YOU been subjected to discrimination in this unit?\r\n(Check all that apply.)',163,5,3,1,0,29,'Vertical');
INSERT INTO questions VALUES (76,'I would report an incident of sexual harassment or discrimination to my chain of command.',164,5,3,1,0,30,'Vertical');
INSERT INTO questions VALUES (77,'Are you male or female?',165,5,3,1,1,31,'Vertical');
INSERT INTO questions VALUES (78,'What is your racial / ethnic background?',166,5,3,1,1,32,'Vertical');
INSERT INTO questions VALUES (79,'Please list three things that are going very well in this unit.',167,5,3,3,0,33,'Vertical');
INSERT INTO questions VALUES (80,'Please list three things that most need improvement in this unit?',167,5,3,3,0,34,'Vertical');
INSERT INTO questions VALUES (94,'Thank you for taking the survey.',24,2,7,1,0,17,'Vertical');
INSERT INTO questions VALUES (95,'Welcome to the example survey. Please click \"Next Page\" below to begin.',24,2,1,1,0,2,'Vertical');
INSERT INTO questions VALUES (96,'YOUR OPEN, HONEST RESPONSES ARE NEEDED\r\nTO PROVIDE INFORMATION FOR DECISIONS\r\nAFFECTING YOUR UNIT.\r\n\r\n       • The survey is anonymous.\r\n       • Only group statistics will be reported.\r\n\r\nTHANK YOU FOR YOUR TIME AND COOPERATION!',169,5,1,1,0,1,'Vertical');
INSERT INTO questions VALUES (97,'THANK YOU FOR COMPLETING THIS SURVEY.\r\n\r\nPlease click on \"Finish\" below to save your answers.',169,5,3,1,0,68,'Vertical');

--
-- Table structure for table `questions_sequence`
--

DROP TABLE IF EXISTS questions_sequence;
CREATE TABLE questions_sequence (
  id int(11) NOT NULL default '0',
  PRIMARY KEY  (id)
) TYPE=MyISAM;

--
-- Dumping data for table `questions_sequence`
--

INSERT INTO questions_sequence VALUES (219);

--
-- Table structure for table `results`
--

DROP TABLE IF EXISTS results;
CREATE TABLE results (
  rid int(11) NOT NULL default '0',
  sid int(11) NOT NULL default '0',
  qid int(11) NOT NULL default '0',
  avid int(11) NOT NULL default '0',
  entered int(11) NOT NULL default '0',
  sequence int(11) NOT NULL default '0',
  PRIMARY KEY  (rid),
  KEY sid (sid),
  KEY qid (qid),
  KEY sequence (sequence),
  KEY avid (avid)
) TYPE=MyISAM;

--
-- Dumping data for table `results`
--

INSERT INTO results VALUES (169,2,34,178,1071603187,45);
INSERT INTO results VALUES (168,2,33,178,1071603187,45);
INSERT INTO results VALUES (167,2,32,178,1071603187,45);
INSERT INTO results VALUES (166,2,26,91,1071603187,45);
INSERT INTO results VALUES (165,2,29,1,1071603187,45);
INSERT INTO results VALUES (164,2,26,91,1071603054,44);
INSERT INTO results VALUES (163,2,29,1,1071603054,44);
INSERT INTO results VALUES (162,2,26,90,1071602685,43);
INSERT INTO results VALUES (161,2,28,1,1071602685,43);
INSERT INTO results VALUES (160,2,26,90,1071602619,42);
INSERT INTO results VALUES (159,2,28,1,1071602619,42);
INSERT INTO results VALUES (158,2,26,91,1071602167,41);
INSERT INTO results VALUES (157,2,29,2,1071602167,41);
INSERT INTO results VALUES (156,2,26,91,1071602148,40);
INSERT INTO results VALUES (155,2,29,1,1071602148,40);
INSERT INTO results VALUES (154,2,26,90,1071602138,39);
INSERT INTO results VALUES (153,2,28,1,1071602138,39);
INSERT INTO results VALUES (170,2,29,1,1071952537,46);
INSERT INTO results VALUES (171,2,26,91,1071952537,46);
INSERT INTO results VALUES (172,2,28,1,1071952554,47);
INSERT INTO results VALUES (173,2,26,90,1071952554,47);
INSERT INTO results VALUES (174,2,28,1,1072843896,48);
INSERT INTO results VALUES (175,2,26,90,1072843896,48);
INSERT INTO results VALUES (176,2,28,1,1073502533,50);
INSERT INTO results VALUES (177,2,26,90,1073502533,50);
INSERT INTO results VALUES (178,2,32,177,1073502533,50);
INSERT INTO results VALUES (179,2,33,177,1073502533,50);
INSERT INTO results VALUES (180,2,34,177,1073502533,50);
INSERT INTO results VALUES (181,2,28,1,1073502570,51);
INSERT INTO results VALUES (182,2,26,90,1073502570,51);
INSERT INTO results VALUES (183,2,32,177,1073502570,51);
INSERT INTO results VALUES (184,2,33,177,1073502570,51);
INSERT INTO results VALUES (185,2,34,177,1073502570,51);
INSERT INTO results VALUES (186,2,29,2,1073503790,52);
INSERT INTO results VALUES (187,2,26,91,1073503790,52);
INSERT INTO results VALUES (188,2,32,178,1073503790,52);
INSERT INTO results VALUES (189,2,33,178,1073503790,52);
INSERT INTO results VALUES (190,2,34,178,1073503790,52);
INSERT INTO results VALUES (191,2,29,1,1073503860,53);
INSERT INTO results VALUES (192,2,26,91,1073503860,53);
INSERT INTO results VALUES (193,2,32,177,1073503860,53);
INSERT INTO results VALUES (194,2,33,178,1073503860,53);
INSERT INTO results VALUES (195,2,34,179,1073503860,53);
INSERT INTO results VALUES (196,2,28,2,1081515280,59);
INSERT INTO results VALUES (197,2,26,90,1081515280,59);
INSERT INTO results VALUES (198,2,32,178,1081515280,59);
INSERT INTO results VALUES (199,2,33,178,1081515280,59);
INSERT INTO results VALUES (200,2,34,178,1081515280,59);
INSERT INTO results VALUES (778,5,63,470,1084800000,91);
INSERT INTO results VALUES (777,5,62,466,1084800000,91);
INSERT INTO results VALUES (776,5,61,466,1084800000,91);
INSERT INTO results VALUES (775,5,60,462,1084800000,91);
INSERT INTO results VALUES (774,5,59,461,1084800000,91);
INSERT INTO results VALUES (773,5,58,461,1084800000,91);
INSERT INTO results VALUES (772,5,52,462,1084800000,91);
INSERT INTO results VALUES (771,5,53,461,1084800000,91);
INSERT INTO results VALUES (770,5,54,461,1084800000,91);
INSERT INTO results VALUES (769,5,55,463,1084800000,91);
INSERT INTO results VALUES (768,5,56,464,1084800000,91);
INSERT INTO results VALUES (767,5,57,461,1084800000,91);
INSERT INTO results VALUES (766,5,78,515,1084798782,90);
INSERT INTO results VALUES (765,5,77,511,1084798782,90);
INSERT INTO results VALUES (764,5,76,509,1084798782,90);
INSERT INTO results VALUES (763,5,75,507,1084798782,90);
INSERT INTO results VALUES (762,5,73,501,1084798782,90);
INSERT INTO results VALUES (761,5,71,498,1084798782,90);
INSERT INTO results VALUES (760,5,70,493,1084798782,90);
INSERT INTO results VALUES (759,5,69,489,1084798782,90);
INSERT INTO results VALUES (758,5,68,489,1084798782,90);
INSERT INTO results VALUES (757,5,66,488,1084798782,90);
INSERT INTO results VALUES (756,5,65,485,1084798782,90);
INSERT INTO results VALUES (755,5,64,480,1084798782,90);
INSERT INTO results VALUES (754,5,63,471,1084798782,90);
INSERT INTO results VALUES (753,5,62,466,1084798782,90);
INSERT INTO results VALUES (752,5,61,466,1084798782,90);
INSERT INTO results VALUES (751,5,60,462,1084798782,90);
INSERT INTO results VALUES (750,5,59,463,1084798782,90);
INSERT INTO results VALUES (749,5,58,462,1084798782,90);
INSERT INTO results VALUES (748,5,52,462,1084798782,90);
INSERT INTO results VALUES (747,5,53,462,1084798782,90);
INSERT INTO results VALUES (746,5,54,463,1084798782,90);
INSERT INTO results VALUES (745,5,55,463,1084798782,90);
INSERT INTO results VALUES (744,5,56,464,1084798782,90);
INSERT INTO results VALUES (743,5,57,463,1084798782,90);
INSERT INTO results VALUES (742,5,78,513,1084797739,89);
INSERT INTO results VALUES (741,5,77,511,1084797739,89);
INSERT INTO results VALUES (740,5,76,510,1084797739,89);
INSERT INTO results VALUES (739,5,75,504,1084797739,89);
INSERT INTO results VALUES (738,5,73,501,1084797739,89);
INSERT INTO results VALUES (737,5,71,498,1084797739,89);
INSERT INTO results VALUES (736,5,70,494,1084797739,89);
INSERT INTO results VALUES (735,5,69,487,1084797739,89);
INSERT INTO results VALUES (734,5,68,487,1084797739,89);
INSERT INTO results VALUES (733,5,66,487,1084797739,89);
INSERT INTO results VALUES (732,5,65,482,1084797739,89);
INSERT INTO results VALUES (731,5,64,480,1084797739,89);
INSERT INTO results VALUES (730,5,63,470,1084797739,89);
INSERT INTO results VALUES (729,5,62,466,1084797739,89);
INSERT INTO results VALUES (728,5,61,466,1084797739,89);
INSERT INTO results VALUES (727,5,60,462,1084797739,89);
INSERT INTO results VALUES (726,5,59,462,1084797739,89);
INSERT INTO results VALUES (725,5,58,462,1084797739,89);
INSERT INTO results VALUES (724,5,52,462,1084797739,89);
INSERT INTO results VALUES (723,5,53,462,1084797739,89);
INSERT INTO results VALUES (722,5,54,462,1084797739,89);
INSERT INTO results VALUES (721,5,55,463,1084797739,89);
INSERT INTO results VALUES (720,5,56,463,1084797739,89);
INSERT INTO results VALUES (719,5,57,463,1084797739,89);
INSERT INTO results VALUES (718,5,78,514,1084795455,88);
INSERT INTO results VALUES (717,5,77,511,1084795455,88);
INSERT INTO results VALUES (716,5,76,510,1084795455,88);
INSERT INTO results VALUES (715,5,75,504,1084795455,88);
INSERT INTO results VALUES (714,5,73,501,1084795455,88);
INSERT INTO results VALUES (713,5,71,499,1084795455,88);
INSERT INTO results VALUES (712,5,70,494,1084795455,88);
INSERT INTO results VALUES (711,5,69,488,1084795455,88);
INSERT INTO results VALUES (710,5,68,487,1084795455,88);
INSERT INTO results VALUES (709,5,66,488,1084795455,88);
INSERT INTO results VALUES (708,5,65,485,1084795455,88);
INSERT INTO results VALUES (707,5,64,479,1084795455,88);
INSERT INTO results VALUES (706,5,63,471,1084795455,88);
INSERT INTO results VALUES (705,5,62,466,1084795455,88);
INSERT INTO results VALUES (704,5,61,466,1084795455,88);
INSERT INTO results VALUES (703,5,60,463,1084795455,88);
INSERT INTO results VALUES (702,5,59,463,1084795455,88);
INSERT INTO results VALUES (701,5,58,462,1084795455,88);
INSERT INTO results VALUES (700,5,52,462,1084795455,88);
INSERT INTO results VALUES (699,5,53,462,1084795455,88);
INSERT INTO results VALUES (698,5,54,463,1084795455,88);
INSERT INTO results VALUES (697,5,55,462,1084795455,88);
INSERT INTO results VALUES (696,5,56,462,1084795455,88);
INSERT INTO results VALUES (695,5,57,462,1084795455,88);
INSERT INTO results VALUES (694,5,78,513,1084769624,87);
INSERT INTO results VALUES (693,5,77,511,1084769624,87);
INSERT INTO results VALUES (692,5,76,510,1084769624,87);
INSERT INTO results VALUES (691,5,75,504,1084769624,87);
INSERT INTO results VALUES (690,5,73,501,1084769624,87);
INSERT INTO results VALUES (689,5,71,497,1084769624,87);
INSERT INTO results VALUES (688,5,70,492,1084769624,87);
INSERT INTO results VALUES (687,5,69,486,1084769624,87);
INSERT INTO results VALUES (686,5,68,486,1084769624,87);
INSERT INTO results VALUES (685,5,66,487,1084769624,87);
INSERT INTO results VALUES (684,5,65,482,1084769624,87);
INSERT INTO results VALUES (683,5,64,476,1084769624,87);
INSERT INTO results VALUES (682,5,63,470,1084769624,87);
INSERT INTO results VALUES (681,5,62,466,1084769624,87);
INSERT INTO results VALUES (680,5,61,466,1084769624,87);
INSERT INTO results VALUES (679,5,60,461,1084769624,87);
INSERT INTO results VALUES (678,5,59,461,1084769624,87);
INSERT INTO results VALUES (677,5,58,461,1084769624,87);
INSERT INTO results VALUES (676,5,52,461,1084769624,87);
INSERT INTO results VALUES (675,5,53,461,1084769624,87);
INSERT INTO results VALUES (674,5,54,462,1084769624,87);
INSERT INTO results VALUES (673,5,55,461,1084769624,87);
INSERT INTO results VALUES (672,5,56,461,1084769624,87);
INSERT INTO results VALUES (671,5,57,461,1084769624,87);
INSERT INTO results VALUES (670,2,34,178,1084582769,86);
INSERT INTO results VALUES (669,2,33,178,1084582769,86);
INSERT INTO results VALUES (668,2,32,178,1084582769,86);
INSERT INTO results VALUES (667,2,26,90,1084582769,86);
INSERT INTO results VALUES (666,2,28,1,1084582769,86);
INSERT INTO results VALUES (665,5,78,515,1084582720,85);
INSERT INTO results VALUES (664,5,77,511,1084582720,85);
INSERT INTO results VALUES (663,5,76,510,1084582720,85);
INSERT INTO results VALUES (662,5,75,504,1084582720,85);
INSERT INTO results VALUES (661,5,73,501,1084582720,85);
INSERT INTO results VALUES (660,5,71,498,1084582720,85);
INSERT INTO results VALUES (659,5,70,493,1084582720,85);
INSERT INTO results VALUES (658,5,69,488,1084582720,85);
INSERT INTO results VALUES (657,5,68,488,1084582720,85);
INSERT INTO results VALUES (656,5,66,488,1084582720,85);
INSERT INTO results VALUES (655,5,65,484,1084582720,85);
INSERT INTO results VALUES (654,5,64,478,1084582720,85);
INSERT INTO results VALUES (653,5,63,470,1084582720,85);
INSERT INTO results VALUES (652,5,62,466,1084582720,85);
INSERT INTO results VALUES (651,5,61,466,1084582720,85);
INSERT INTO results VALUES (650,5,60,462,1084582720,85);
INSERT INTO results VALUES (649,5,59,462,1084582720,85);
INSERT INTO results VALUES (648,5,58,462,1084582720,85);
INSERT INTO results VALUES (647,5,52,462,1084582720,85);
INSERT INTO results VALUES (646,5,53,462,1084582720,85);
INSERT INTO results VALUES (645,5,54,462,1084582720,85);
INSERT INTO results VALUES (644,5,55,462,1084582720,85);
INSERT INTO results VALUES (643,5,56,462,1084582720,85);
INSERT INTO results VALUES (642,5,57,462,1084582720,85);
INSERT INTO results VALUES (641,5,78,514,1084569384,84);
INSERT INTO results VALUES (640,5,77,511,1084569384,84);
INSERT INTO results VALUES (639,5,76,510,1084569384,84);
INSERT INTO results VALUES (638,5,75,504,1084569384,84);
INSERT INTO results VALUES (637,5,73,501,1084569384,84);
INSERT INTO results VALUES (636,5,71,498,1084569384,84);
INSERT INTO results VALUES (635,5,70,494,1084569384,84);
INSERT INTO results VALUES (634,5,69,488,1084569384,84);
INSERT INTO results VALUES (633,5,68,488,1084569384,84);
INSERT INTO results VALUES (632,5,66,489,1084569384,84);
INSERT INTO results VALUES (631,5,65,485,1084569384,84);
INSERT INTO results VALUES (630,5,64,480,1084569384,84);
INSERT INTO results VALUES (629,5,63,472,1084569384,84);
INSERT INTO results VALUES (628,5,62,466,1084569384,84);
INSERT INTO results VALUES (627,5,61,466,1084569384,84);
INSERT INTO results VALUES (626,5,60,463,1084569384,84);
INSERT INTO results VALUES (625,5,59,463,1084569384,84);
INSERT INTO results VALUES (624,5,58,462,1084569384,84);
INSERT INTO results VALUES (623,5,52,463,1084569384,84);
INSERT INTO results VALUES (622,5,53,463,1084569384,84);
INSERT INTO results VALUES (621,5,54,461,1084569384,84);
INSERT INTO results VALUES (620,5,55,463,1084569384,84);
INSERT INTO results VALUES (619,5,56,463,1084569384,84);
INSERT INTO results VALUES (618,5,57,463,1084569384,84);
INSERT INTO results VALUES (617,5,78,515,1084566499,83);
INSERT INTO results VALUES (616,5,77,512,1084566499,83);
INSERT INTO results VALUES (615,5,76,510,1084566499,83);
INSERT INTO results VALUES (614,5,75,504,1084566499,83);
INSERT INTO results VALUES (613,5,73,501,1084566499,83);
INSERT INTO results VALUES (612,5,71,498,1084566499,83);
INSERT INTO results VALUES (611,5,70,492,1084566499,83);
INSERT INTO results VALUES (610,5,69,487,1084566499,83);
INSERT INTO results VALUES (609,5,68,487,1084566499,83);
INSERT INTO results VALUES (608,5,66,487,1084566499,83);
INSERT INTO results VALUES (607,5,65,484,1084566499,83);
INSERT INTO results VALUES (606,5,64,477,1084566499,83);
INSERT INTO results VALUES (605,5,63,472,1084566499,83);
INSERT INTO results VALUES (604,5,62,466,1084566499,83);
INSERT INTO results VALUES (603,5,61,466,1084566499,83);
INSERT INTO results VALUES (602,5,60,462,1084566499,83);
INSERT INTO results VALUES (601,5,59,464,1084566499,83);
INSERT INTO results VALUES (600,5,58,464,1084566499,83);
INSERT INTO results VALUES (599,5,52,462,1084566499,83);
INSERT INTO results VALUES (598,5,53,462,1084566499,83);
INSERT INTO results VALUES (597,5,54,462,1084566499,83);
INSERT INTO results VALUES (596,5,55,462,1084566499,83);
INSERT INTO results VALUES (595,5,56,462,1084566499,83);
INSERT INTO results VALUES (594,5,57,461,1084566499,83);
INSERT INTO results VALUES (593,5,78,513,1084565207,82);
INSERT INTO results VALUES (592,5,77,511,1084565207,82);
INSERT INTO results VALUES (591,2,34,179,1084564076,81);
INSERT INTO results VALUES (590,2,33,178,1084564076,81);
INSERT INTO results VALUES (589,2,32,177,1084564076,81);
INSERT INTO results VALUES (588,2,26,90,1084564076,81);
INSERT INTO results VALUES (587,2,28,1,1084564076,81);
INSERT INTO results VALUES (586,5,78,514,1084563741,80);
INSERT INTO results VALUES (585,5,77,511,1084563741,80);
INSERT INTO results VALUES (584,5,76,510,1084563741,80);
INSERT INTO results VALUES (583,5,75,504,1084563741,80);
INSERT INTO results VALUES (582,5,73,501,1084563741,80);
INSERT INTO results VALUES (581,5,71,497,1084563741,80);
INSERT INTO results VALUES (580,5,70,494,1084563741,80);
INSERT INTO results VALUES (579,5,69,488,1084563741,80);
INSERT INTO results VALUES (578,5,68,488,1084563741,80);
INSERT INTO results VALUES (577,5,66,487,1084563741,80);
INSERT INTO results VALUES (576,5,65,483,1084563741,80);
INSERT INTO results VALUES (575,5,64,479,1084563741,80);
INSERT INTO results VALUES (574,5,63,471,1084563741,80);
INSERT INTO results VALUES (573,5,62,466,1084563741,80);
INSERT INTO results VALUES (572,5,61,466,1084563741,80);
INSERT INTO results VALUES (571,5,60,462,1084563741,80);
INSERT INTO results VALUES (570,5,59,463,1084563741,80);
INSERT INTO results VALUES (569,5,58,462,1084563741,80);
INSERT INTO results VALUES (568,5,52,462,1084563741,80);
INSERT INTO results VALUES (567,5,53,461,1084563741,80);
INSERT INTO results VALUES (566,5,54,462,1084563741,80);
INSERT INTO results VALUES (565,5,55,464,1084563741,80);
INSERT INTO results VALUES (564,5,56,462,1084563741,80);
INSERT INTO results VALUES (563,5,57,462,1084563741,80);
INSERT INTO results VALUES (562,5,78,514,1084563627,79);
INSERT INTO results VALUES (561,5,77,511,1084563627,79);
INSERT INTO results VALUES (560,5,76,510,1084563627,79);
INSERT INTO results VALUES (559,5,75,504,1084563627,79);
INSERT INTO results VALUES (558,5,73,501,1084563627,79);
INSERT INTO results VALUES (557,5,71,497,1084563627,79);
INSERT INTO results VALUES (556,5,70,492,1084563627,79);
INSERT INTO results VALUES (555,5,69,487,1084563627,79);
INSERT INTO results VALUES (554,5,68,487,1084563627,79);
INSERT INTO results VALUES (553,5,66,487,1084563627,79);
INSERT INTO results VALUES (552,5,65,482,1084563627,79);
INSERT INTO results VALUES (551,5,64,476,1084563627,79);
INSERT INTO results VALUES (550,5,63,471,1084563627,79);
INSERT INTO results VALUES (549,5,62,466,1084563627,79);
INSERT INTO results VALUES (548,5,61,466,1084563627,79);
INSERT INTO results VALUES (547,5,60,462,1084563627,79);
INSERT INTO results VALUES (546,5,59,462,1084563627,79);
INSERT INTO results VALUES (545,5,58,462,1084563627,79);
INSERT INTO results VALUES (544,5,52,462,1084563627,79);
INSERT INTO results VALUES (543,5,53,462,1084563627,79);
INSERT INTO results VALUES (542,5,54,462,1084563627,79);
INSERT INTO results VALUES (541,5,55,462,1084563627,79);
INSERT INTO results VALUES (540,5,56,462,1084563627,79);
INSERT INTO results VALUES (539,5,57,462,1084563627,79);
INSERT INTO results VALUES (779,5,64,479,1084800000,91);
INSERT INTO results VALUES (780,5,65,484,1084800000,91);
INSERT INTO results VALUES (781,5,66,487,1084800000,91);
INSERT INTO results VALUES (782,5,68,487,1084800000,91);
INSERT INTO results VALUES (783,5,69,487,1084800000,91);
INSERT INTO results VALUES (784,5,70,492,1084800000,91);
INSERT INTO results VALUES (785,5,71,497,1084800000,91);
INSERT INTO results VALUES (786,5,73,501,1084800000,91);
INSERT INTO results VALUES (787,5,75,504,1084800000,91);
INSERT INTO results VALUES (788,5,76,510,1084800000,91);
INSERT INTO results VALUES (789,5,77,511,1084800000,91);
INSERT INTO results VALUES (790,5,78,514,1084800000,91);
INSERT INTO results VALUES (791,5,57,462,1084800536,92);
INSERT INTO results VALUES (792,5,56,465,1084800536,92);
INSERT INTO results VALUES (793,5,55,465,1084800536,92);
INSERT INTO results VALUES (794,5,54,462,1084800536,92);
INSERT INTO results VALUES (795,5,53,464,1084800536,92);
INSERT INTO results VALUES (796,5,52,464,1084800536,92);
INSERT INTO results VALUES (797,5,58,463,1084800536,92);
INSERT INTO results VALUES (798,5,59,462,1084800536,92);
INSERT INTO results VALUES (799,5,60,463,1084800536,92);
INSERT INTO results VALUES (800,5,61,466,1084800536,92);
INSERT INTO results VALUES (801,5,62,466,1084800536,92);
INSERT INTO results VALUES (802,5,63,473,1084800536,92);
INSERT INTO results VALUES (803,5,64,480,1084800536,92);
INSERT INTO results VALUES (804,5,65,483,1084800536,92);
INSERT INTO results VALUES (805,5,66,489,1084800536,92);
INSERT INTO results VALUES (806,5,68,488,1084800536,92);
INSERT INTO results VALUES (807,5,69,489,1084800536,92);
INSERT INTO results VALUES (808,5,70,493,1084800536,92);
INSERT INTO results VALUES (809,5,71,499,1084800536,92);
INSERT INTO results VALUES (810,5,73,501,1084800536,92);
INSERT INTO results VALUES (811,5,75,504,1084800536,92);
INSERT INTO results VALUES (812,5,76,510,1084800536,92);
INSERT INTO results VALUES (813,5,77,511,1084800536,92);
INSERT INTO results VALUES (814,5,78,515,1084800536,92);
INSERT INTO results VALUES (815,5,57,462,1084802830,93);
INSERT INTO results VALUES (816,5,56,462,1084802830,93);
INSERT INTO results VALUES (817,5,55,462,1084802830,93);
INSERT INTO results VALUES (818,5,54,463,1084802830,93);
INSERT INTO results VALUES (819,5,53,462,1084802830,93);
INSERT INTO results VALUES (820,5,52,462,1084802830,93);
INSERT INTO results VALUES (821,5,58,462,1084802830,93);
INSERT INTO results VALUES (822,5,59,463,1084802830,93);
INSERT INTO results VALUES (823,5,60,463,1084802830,93);
INSERT INTO results VALUES (824,5,61,466,1084802830,93);
INSERT INTO results VALUES (825,5,62,466,1084802830,93);
INSERT INTO results VALUES (826,5,63,471,1084802830,93);
INSERT INTO results VALUES (827,5,64,480,1084802830,93);
INSERT INTO results VALUES (828,5,65,484,1084802830,93);
INSERT INTO results VALUES (829,5,66,487,1084802830,93);
INSERT INTO results VALUES (830,5,68,487,1084802830,93);
INSERT INTO results VALUES (831,5,69,487,1084802830,93);
INSERT INTO results VALUES (832,5,70,492,1084802830,93);
INSERT INTO results VALUES (833,5,71,498,1084802830,93);
INSERT INTO results VALUES (834,5,73,501,1084802830,93);
INSERT INTO results VALUES (835,5,75,504,1084802830,93);
INSERT INTO results VALUES (836,5,76,510,1084802830,93);
INSERT INTO results VALUES (837,5,77,511,1084802830,93);
INSERT INTO results VALUES (838,5,78,514,1084802830,93);
INSERT INTO results VALUES (839,2,28,1,1084805986,94);
INSERT INTO results VALUES (840,2,26,90,1084805986,94);
INSERT INTO results VALUES (841,2,32,178,1084805986,94);
INSERT INTO results VALUES (842,2,33,178,1084805986,94);
INSERT INTO results VALUES (843,2,34,178,1084805986,94);
INSERT INTO results VALUES (844,2,28,1,1084806018,95);
INSERT INTO results VALUES (845,2,26,90,1084806018,95);
INSERT INTO results VALUES (846,5,77,511,1084806030,96);
INSERT INTO results VALUES (847,5,78,514,1084806030,96);
INSERT INTO results VALUES (848,5,57,462,1084806439,97);
INSERT INTO results VALUES (849,5,56,461,1084806439,97);
INSERT INTO results VALUES (850,5,55,461,1084806439,97);
INSERT INTO results VALUES (851,5,54,463,1084806439,97);
INSERT INTO results VALUES (852,5,53,462,1084806439,97);
INSERT INTO results VALUES (853,5,52,462,1084806439,97);
INSERT INTO results VALUES (854,5,58,461,1084806439,97);
INSERT INTO results VALUES (855,5,59,461,1084806439,97);
INSERT INTO results VALUES (856,5,60,463,1084806439,97);
INSERT INTO results VALUES (857,5,61,466,1084806439,97);
INSERT INTO results VALUES (858,5,62,466,1084806439,97);
INSERT INTO results VALUES (859,5,63,472,1084806439,97);
INSERT INTO results VALUES (860,5,64,476,1084806439,97);
INSERT INTO results VALUES (861,5,65,483,1084806439,97);
INSERT INTO results VALUES (862,5,66,487,1084806439,97);
INSERT INTO results VALUES (863,5,68,487,1084806439,97);
INSERT INTO results VALUES (864,5,69,488,1084806439,97);
INSERT INTO results VALUES (865,5,70,493,1084806439,97);
INSERT INTO results VALUES (866,5,71,497,1084806439,97);
INSERT INTO results VALUES (867,5,73,501,1084806439,97);
INSERT INTO results VALUES (868,5,75,504,1084806439,97);
INSERT INTO results VALUES (869,5,76,510,1084806439,97);
INSERT INTO results VALUES (870,5,77,511,1084806439,97);
INSERT INTO results VALUES (871,5,78,514,1084806439,97);
INSERT INTO results VALUES (872,5,57,462,1084806608,98);
INSERT INTO results VALUES (873,5,56,462,1084806608,98);
INSERT INTO results VALUES (874,5,55,462,1084806608,98);
INSERT INTO results VALUES (875,5,54,463,1084806608,98);
INSERT INTO results VALUES (876,5,53,462,1084806608,98);
INSERT INTO results VALUES (877,5,52,462,1084806608,98);
INSERT INTO results VALUES (878,5,58,462,1084806608,98);
INSERT INTO results VALUES (879,5,59,462,1084806608,98);
INSERT INTO results VALUES (880,5,60,462,1084806608,98);
INSERT INTO results VALUES (881,5,61,466,1084806608,98);
INSERT INTO results VALUES (882,5,62,466,1084806608,98);
INSERT INTO results VALUES (883,5,63,472,1084806608,98);
INSERT INTO results VALUES (884,5,64,478,1084806608,98);
INSERT INTO results VALUES (885,5,65,483,1084806608,98);
INSERT INTO results VALUES (886,5,66,487,1084806608,98);
INSERT INTO results VALUES (887,5,68,487,1084806608,98);
INSERT INTO results VALUES (888,5,69,488,1084806608,98);
INSERT INTO results VALUES (889,5,70,493,1084806608,98);
INSERT INTO results VALUES (890,5,71,497,1084806608,98);
INSERT INTO results VALUES (891,5,73,501,1084806608,98);
INSERT INTO results VALUES (892,5,75,504,1084806608,98);
INSERT INTO results VALUES (893,5,76,510,1084806608,98);
INSERT INTO results VALUES (894,5,77,511,1084806608,98);
INSERT INTO results VALUES (895,5,78,515,1084806608,98);
INSERT INTO results VALUES (896,5,57,462,1084807985,99);
INSERT INTO results VALUES (897,5,56,462,1084807985,99);
INSERT INTO results VALUES (898,5,55,462,1084807985,99);
INSERT INTO results VALUES (899,5,54,463,1084807985,99);
INSERT INTO results VALUES (900,5,53,463,1084807985,99);
INSERT INTO results VALUES (901,5,52,462,1084807985,99);
INSERT INTO results VALUES (902,5,58,462,1084807985,99);
INSERT INTO results VALUES (903,5,59,462,1084807985,99);
INSERT INTO results VALUES (904,5,60,462,1084807985,99);
INSERT INTO results VALUES (905,5,61,466,1084807985,99);
INSERT INTO results VALUES (906,5,62,466,1084807985,99);
INSERT INTO results VALUES (907,5,63,470,1084807985,99);
INSERT INTO results VALUES (908,5,64,479,1084807985,99);
INSERT INTO results VALUES (909,5,65,483,1084807985,99);
INSERT INTO results VALUES (910,5,66,488,1084807985,99);
INSERT INTO results VALUES (911,5,68,488,1084807985,99);
INSERT INTO results VALUES (912,5,69,488,1084807985,99);
INSERT INTO results VALUES (913,5,70,493,1084807985,99);
INSERT INTO results VALUES (914,5,71,498,1084807985,99);
INSERT INTO results VALUES (915,5,73,501,1084807985,99);
INSERT INTO results VALUES (916,5,75,504,1084807985,99);
INSERT INTO results VALUES (917,5,76,510,1084807985,99);
INSERT INTO results VALUES (918,5,77,511,1084807985,99);
INSERT INTO results VALUES (919,5,78,514,1084807985,99);
INSERT INTO results VALUES (920,2,28,1,1084809387,100);
INSERT INTO results VALUES (921,2,26,90,1084809387,100);
INSERT INTO results VALUES (922,2,32,178,1084809387,100);
INSERT INTO results VALUES (923,2,33,178,1084809387,100);
INSERT INTO results VALUES (924,2,34,178,1084809387,100);
INSERT INTO results VALUES (925,2,26,90,1084809450,101);
INSERT INTO results VALUES (926,2,26,90,1084809566,102);
INSERT INTO results VALUES (943,5,77,512,1084813860,111);
INSERT INTO results VALUES (944,5,78,515,1084813860,111);
INSERT INTO results VALUES (945,2,28,1,1084818100,112);
INSERT INTO results VALUES (946,2,26,90,1084818100,112);
INSERT INTO results VALUES (947,2,32,177,1084818100,112);
INSERT INTO results VALUES (948,2,33,177,1084818100,112);
INSERT INTO results VALUES (949,2,34,177,1084818100,112);
INSERT INTO results VALUES (983,2,34,178,1085332570,114);
INSERT INTO results VALUES (982,2,33,178,1085332570,114);
INSERT INTO results VALUES (981,2,32,178,1085332570,114);
INSERT INTO results VALUES (980,2,26,90,1085332570,114);
INSERT INTO results VALUES (979,2,28,1,1085332570,114);
INSERT INTO results VALUES (1012,2,29,1,1089085864,131);
INSERT INTO results VALUES (1013,2,26,91,1089085864,131);
INSERT INTO results VALUES (1014,2,32,178,1089085864,131);
INSERT INTO results VALUES (1015,2,33,178,1089085864,131);
INSERT INTO results VALUES (1016,2,34,178,1089085864,131);
INSERT INTO results VALUES (1033,2,28,1,1089180655,142);
INSERT INTO results VALUES (1032,2,34,177,1089179757,137);
INSERT INTO results VALUES (1031,2,33,177,1089179757,137);
INSERT INTO results VALUES (1030,2,32,177,1089179757,137);
INSERT INTO results VALUES (1029,2,26,90,1089179757,137);
INSERT INTO results VALUES (1028,2,28,1,1089179757,137);
INSERT INTO results VALUES (1034,2,26,90,1089180655,142);
INSERT INTO results VALUES (1035,2,32,179,1089180655,142);
INSERT INTO results VALUES (1036,2,33,178,1089180655,142);
INSERT INTO results VALUES (1037,2,34,177,1089180655,142);
INSERT INTO results VALUES (1047,2,26,91,1089182429,147);
INSERT INTO results VALUES (1116,5,77,511,1093145082,236);
INSERT INTO results VALUES (1117,5,78,514,1093145082,236);
INSERT INTO results VALUES (1118,5,57,461,1093145119,237);
INSERT INTO results VALUES (1119,5,56,461,1093145119,237);
INSERT INTO results VALUES (1120,5,55,461,1093145119,237);
INSERT INTO results VALUES (1121,5,54,461,1093145119,237);
INSERT INTO results VALUES (1122,5,53,461,1093145119,237);
INSERT INTO results VALUES (1123,5,52,461,1093145119,237);
INSERT INTO results VALUES (1124,5,58,461,1093145119,237);
INSERT INTO results VALUES (1125,5,59,461,1093145119,237);
INSERT INTO results VALUES (1126,5,60,461,1093145119,237);
INSERT INTO results VALUES (1127,5,61,466,1093145119,237);
INSERT INTO results VALUES (1128,5,77,511,1093145119,237);
INSERT INTO results VALUES (1129,5,78,514,1093145119,237);
INSERT INTO results VALUES (1130,5,53,461,1093145191,238);
INSERT INTO results VALUES (1131,5,52,461,1093145191,238);
INSERT INTO results VALUES (1132,5,77,511,1093145191,238);
INSERT INTO results VALUES (1133,5,78,514,1093145191,238);
INSERT INTO results VALUES (1134,2,28,2,1093148145,241);
INSERT INTO results VALUES (1135,2,26,90,1093148145,241);
INSERT INTO results VALUES (1136,2,32,178,1093148145,241);
INSERT INTO results VALUES (1137,2,33,178,1093148145,241);
INSERT INTO results VALUES (1138,2,34,178,1093148145,241);
INSERT INTO results VALUES (1139,2,26,90,1093148273,243);
INSERT INTO results VALUES (1140,2,28,1,1093151534,244);
INSERT INTO results VALUES (1141,2,26,90,1093151534,244);
INSERT INTO results VALUES (1142,2,26,91,1093151545,245);
INSERT INTO results VALUES (1143,2,26,91,1093151558,246);
INSERT INTO results VALUES (1144,2,26,91,1093151631,247);
INSERT INTO results VALUES (1145,2,26,91,1093151642,248);
INSERT INTO results VALUES (1146,2,26,91,1093151668,249);
INSERT INTO results VALUES (1147,2,26,91,1093151818,251);
INSERT INTO results VALUES (1148,2,26,91,1093151890,252);
INSERT INTO results VALUES (1149,2,26,91,1093151904,253);
INSERT INTO results VALUES (1150,2,34,178,1093151904,253);
INSERT INTO results VALUES (1151,2,26,91,1093151981,256);
INSERT INTO results VALUES (1152,2,26,91,1093151993,257);
INSERT INTO results VALUES (1153,2,26,91,1093152068,258);
INSERT INTO results VALUES (1154,2,26,91,1093152084,260);
INSERT INTO results VALUES (1155,2,26,91,1093152173,261);
INSERT INTO results VALUES (1156,2,26,91,1093152201,262);
INSERT INTO results VALUES (1157,2,26,90,1093152243,263);
INSERT INTO results VALUES (1173,5,77,511,1093204025,299);
INSERT INTO results VALUES (1174,5,78,513,1093204025,299);
INSERT INTO results VALUES (1175,5,77,511,1093204037,300);
INSERT INTO results VALUES (1176,5,78,513,1093204037,300);
INSERT INTO results VALUES (1177,5,77,512,1093204047,301);
INSERT INTO results VALUES (1178,5,78,514,1093204047,301);
INSERT INTO results VALUES (1179,5,77,511,1093204058,302);
INSERT INTO results VALUES (1180,5,78,513,1093204058,302);
INSERT INTO results VALUES (1181,5,77,512,1093204196,304);
INSERT INTO results VALUES (1182,5,78,513,1093204196,304);
INSERT INTO results VALUES (1183,5,77,512,1093204230,305);
INSERT INTO results VALUES (1184,5,78,513,1093204230,305);
INSERT INTO results VALUES (1185,5,77,511,1093204516,307);
INSERT INTO results VALUES (1186,5,78,513,1093204516,307);
INSERT INTO results VALUES (1187,5,77,511,1093204587,308);
INSERT INTO results VALUES (1188,5,78,513,1093204587,308);
INSERT INTO results VALUES (1189,5,77,511,1093204681,309);
INSERT INTO results VALUES (1190,5,78,514,1093204681,309);
INSERT INTO results VALUES (1191,5,77,511,1093204701,310);
INSERT INTO results VALUES (1192,5,78,513,1093204701,310);
INSERT INTO results VALUES (1193,5,77,512,1093204801,312);
INSERT INTO results VALUES (1194,5,78,515,1093204801,312);
INSERT INTO results VALUES (1195,5,77,511,1093204831,313);
INSERT INTO results VALUES (1196,5,78,513,1093204831,313);
INSERT INTO results VALUES (1197,5,77,512,1093204942,314);
INSERT INTO results VALUES (1198,5,78,515,1093204942,314);
INSERT INTO results VALUES (1199,5,77,512,1093204952,315);
INSERT INTO results VALUES (1200,5,78,515,1093204952,315);
INSERT INTO results VALUES (1208,5,77,512,1093216663,326);
INSERT INTO results VALUES (1209,5,78,513,1093216663,326);
INSERT INTO results VALUES (1210,5,77,511,1093216673,327);
INSERT INTO results VALUES (1211,5,78,513,1093216673,327);
INSERT INTO results VALUES (1212,5,77,512,1093216684,328);
INSERT INTO results VALUES (1213,5,78,514,1093216684,328);
INSERT INTO results VALUES (1215,5,77,511,1093217047,331);
INSERT INTO results VALUES (1216,5,78,513,1093217047,331);
INSERT INTO results VALUES (1217,2,26,91,1093217058,332);
INSERT INTO results VALUES (1222,5,77,512,1093217092,336);
INSERT INTO results VALUES (1223,5,78,513,1093217092,336);
INSERT INTO results VALUES (1224,2,26,91,1093217104,337);
INSERT INTO results VALUES (1238,5,78,513,1093223022,346);
INSERT INTO results VALUES (1237,5,77,512,1093223022,346);
INSERT INTO results VALUES (1236,2,26,90,1093223011,345);
INSERT INTO results VALUES (1251,2,28,1,1098405480,363);
INSERT INTO results VALUES (1252,2,26,90,1098405480,363);
INSERT INTO results VALUES (1253,2,32,178,1098405480,363);
INSERT INTO results VALUES (1254,2,33,177,1098405480,363);
INSERT INTO results VALUES (1255,2,34,177,1098405480,363);
INSERT INTO results VALUES (1256,2,28,1,1098406092,366);
INSERT INTO results VALUES (1257,2,26,90,1098406092,366);
INSERT INTO results VALUES (1258,2,32,177,1098406092,366);
INSERT INTO results VALUES (1259,2,33,178,1098406092,366);
INSERT INTO results VALUES (1260,2,34,179,1098406092,366);

--
-- Table structure for table `results_sequence`
--

DROP TABLE IF EXISTS results_sequence;
CREATE TABLE results_sequence (
  id int(11) NOT NULL default '0',
  PRIMARY KEY  (id)
) TYPE=MyISAM;

--
-- Dumping data for table `results_sequence`
--

INSERT INTO results_sequence VALUES (1284);

--
-- Table structure for table `results_text`
--

DROP TABLE IF EXISTS results_text;
CREATE TABLE results_text (
  rid int(11) NOT NULL default '0',
  sid int(11) NOT NULL default '0',
  qid int(11) NOT NULL default '0',
  answer text NOT NULL,
  entered int(11) NOT NULL default '0',
  sequence int(11) NOT NULL default '0',
  PRIMARY KEY  (rid),
  KEY sid (sid),
  KEY qid (qid),
  KEY sequence (sequence),
  FULLTEXT KEY answer (answer)
) CHARACTER SET latin1
TYPE=MyISAM;

--
-- Dumping data for table `results_text`
--

INSERT INTO results_text VALUES (1,2,30,'Computers',1073502533,50);
INSERT INTO results_text VALUES (2,2,38,'Yes, I have a few about fish and other crap like that. :)',1073502533,50);
INSERT INTO results_text VALUES (3,2,30,'Computers',1073502570,51);
INSERT INTO results_text VALUES (4,2,38,'Yes, I have a few comments about the cost of fresh seafood and peanut butter. It\'s high, you know??? :)',1073502570,51);
INSERT INTO results_text VALUES (5,2,30,'Shopping',1073503790,52);
INSERT INTO results_text VALUES (6,2,38,'Just testing <img> and <strong> type stuff. :)',1073503790,52);
INSERT INTO results_text VALUES (7,2,30,'Something',1073503860,53);
INSERT INTO results_text VALUES (8,2,37,'Fatty',1073503860,53);
INSERT INTO results_text VALUES (9,2,38,'Just one more thing... if I can think of it. ',1073503860,53);
INSERT INTO results_text VALUES (10,2,30,'Writing',1081515280,59);
INSERT INTO results_text VALUES (11,2,38,'None right now. ',1081515280,59);
INSERT INTO results_text VALUES (63,5,80,'consideration for shift workers--no respect for us having to come in during time off--days soldiers never come in in the evening or the middle of the nite to do stuff, yet swings and mids personnell come in during our off time all the time..',1084569384,84);
INSERT INTO results_text VALUES (61,5,80,'Stop using e-mail for information flow, not everyone has access from home for information that gets put out after 5pm.',1084566499,83);
INSERT INTO results_text VALUES (62,5,80,'last minute notification on training/meetings',1084569384,84);
INSERT INTO results_text VALUES (60,5,80,'Mail hours are too short, and difficult to get to because of the hours.',1084566499,83);
INSERT INTO results_text VALUES (59,5,80,'more help for NCOs working in operations for IET companies',1084566499,83);
INSERT INTO results_text VALUES (58,5,79,'Commanders and Drills Sgts and Bn Co. work together',1084566499,83);
INSERT INTO results_text VALUES (57,5,79,'Very Involved Battalion Chaplain',1084566499,83);
INSERT INTO results_text VALUES (55,2,38,'Just one...',1084564076,81);
INSERT INTO results_text VALUES (56,5,79,'Very Involved Battalion Commander',1084566499,83);
INSERT INTO results_text VALUES (54,2,37,'Don\'t like chicken!',1084564076,81);
INSERT INTO results_text VALUES (52,5,80,'Late changes to training, taskings',1084563741,80);
INSERT INTO results_text VALUES (53,2,30,'Camping',1084564076,81);
INSERT INTO results_text VALUES (51,5,79,'PT program',1084563741,80);
INSERT INTO results_text VALUES (50,5,79,'Civilian Instructors',1084563741,80);
INSERT INTO results_text VALUES (49,5,80,'everyone needs to start using alert roster instead of relying on email when something gets put out after work hours',1084563627,79);
INSERT INTO results_text VALUES (47,5,79,'i believe morale is ok',1084563627,79);
INSERT INTO results_text VALUES (48,5,79,'soldiers work well together',1084563627,79);
INSERT INTO results_text VALUES (64,5,80,'DUTY ROSTERS--they never work right....i see the same soldiers come down on the roster over and over again,,,and others rarely.....also, soldiers that all work in a certain section all having duty one right after another--that is impossible if the roster is done right...also, when a change is made to correct one individual who cannot perform a duty, everyone is shifted up to a new date....this creates problems when individuals have already made arrangements for daycare for a cetain day to accomodate duty, and then two days before the duty have to change those plans,,,and then change again....i feel the easiest way would be to take whoever is at the bottom of the list, and put them in the opening, that way only one person has to jump thru hoops instead of everyone on the roster....but that would be using common sense...and that doesnt seem to prevail....',1084569384,84);
INSERT INTO results_text VALUES (65,5,79,'MOS training',1084795455,88);
INSERT INTO results_text VALUES (66,5,79,'PT program',1084795455,88);
INSERT INTO results_text VALUES (67,5,79,'comp time',1084795455,88);
INSERT INTO results_text VALUES (68,5,80,'duty rosters',1084795455,88);
INSERT INTO results_text VALUES (69,5,80,'morale',1084795455,88);
INSERT INTO results_text VALUES (70,5,80,'attitudes',1084795455,88);
INSERT INTO results_text VALUES (71,5,80,'Soldier Training first priority',1084797739,89);
INSERT INTO results_text VALUES (72,5,80,'Staff Instructor slots',1084797739,89);
INSERT INTO results_text VALUES (73,5,80,'Adhere to physical training standards ',1084797739,89);
INSERT INTO results_text VALUES (74,5,79,'Promotion',1084798782,90);
INSERT INTO results_text VALUES (75,5,79,'Recreation',1084798782,90);
INSERT INTO results_text VALUES (76,5,79,'Work Hours',1084798782,90);
INSERT INTO results_text VALUES (77,5,80,'Less, last minute Details/Classes/Duties',1084798782,90);
INSERT INTO results_text VALUES (78,5,80,'Clearer detailed information disseminated regarding everything ',1084798782,90);
INSERT INTO results_text VALUES (79,5,80,'\"Too many chefs Spoil the soup\" ',1084798782,90);
INSERT INTO results_text VALUES (80,5,79,'career advancement (soldiers are allowed to go to school)and my office tries to work a schedule around it.',1084800000,91);
INSERT INTO results_text VALUES (81,5,79,'In my 11yrs in the army this is one of the sections I have ever worked in',1084800000,91);
INSERT INTO results_text VALUES (82,5,79,'soldiers are encouraged and have the opportunity to go to Drill Sgt (thank you SGM Fields)',1084800000,91);
INSERT INTO results_text VALUES (83,5,80,'There is not enough Tactical training and (no FTX\'s)',1084800000,91);
INSERT INTO results_text VALUES (84,5,80,'Lesson plans for training are suppose to written and validated by Training Development.  New equipment should be supported by the manufacturer as far as training and not left up to Instructor to write.',1084800000,91);
INSERT INTO results_text VALUES (85,5,80,'Money problems concerning procurment of new equipment which should already have been bought ',1084800000,91);
INSERT INTO results_text VALUES (86,5,80,'Leadership in this unit needs to focus more on mission and less on making themselves look good.',1084800536,92);
INSERT INTO results_text VALUES (87,5,80,'First Sergeant and CO need to produce a training schedule and then stick to it.',1084800536,92);
INSERT INTO results_text VALUES (88,5,79,'PT',1084807985,99);
INSERT INTO results_text VALUES (89,5,80,'Duty Rosters need to be tightened up',1084807985,99);
INSERT INTO results_text VALUES (97,2,38,'nope.',1085332570,114);
INSERT INTO results_text VALUES (96,2,30,'watching tv',1085332570,114);
INSERT INTO results_text VALUES (98,2,30,'Shopping',1089085864,131);
INSERT INTO results_text VALUES (99,2,38,'No comments at this time. Thanks.',1089085864,131);
INSERT INTO results_text VALUES (107,2,35,'Carbs!!',1089180655,142);
INSERT INTO results_text VALUES (106,2,30,'Running',1089180655,142);
INSERT INTO results_text VALUES (105,2,30,'Something else.',1089179757,137);
INSERT INTO results_text VALUES (108,2,38,'No, not really. :)',1089180655,142);
INSERT INTO results_text VALUES (153,2,30,'dfgh',1093148145,241);
INSERT INTO results_text VALUES (154,2,38,'dfghdfgh',1093148145,241);
INSERT INTO results_text VALUES (166,2,30,'asdfasdf',1093217104,337);
INSERT INTO results_text VALUES (171,2,38,'asfd',1098405480,363);
INSERT INTO results_text VALUES (172,2,30,'asdfasdfasdf',1098406092,366);
INSERT INTO results_text VALUES (173,2,37,'fat <img> fat',1098406092,366);
INSERT INTO results_text VALUES (174,2,38,'no, no other comments at this time. ',1098406092,366);

--
-- Table structure for table `results_text_sequence`
--

DROP TABLE IF EXISTS results_text_sequence;
CREATE TABLE results_text_sequence (
  id int(11) NOT NULL default '0',
  PRIMARY KEY  (id)
) TYPE=MyISAM;

--
-- Dumping data for table `results_text_sequence`
--

INSERT INTO results_text_sequence VALUES (177);

--
-- Table structure for table `sequence`
--

DROP TABLE IF EXISTS sequence;
CREATE TABLE sequence (
  id int(11) NOT NULL default '0',
  PRIMARY KEY  (id)
) TYPE=MyISAM;

--
-- Dumping data for table `sequence`
--

INSERT INTO sequence VALUES (400);

--
-- Table structure for table `surveys`
--

DROP TABLE IF EXISTS surveys;
CREATE TABLE surveys (
  sid int(11) NOT NULL default '0',
  name varchar(255) NOT NULL default '',
  start_date int(11) NOT NULL default '0',
  end_date int(11) NOT NULL default '0',
  active int(11) NOT NULL default '0',
  template varchar(25) default NULL,
  redirect_page varchar(255) NOT NULL default '',
  survey_text_mode int(11) NOT NULL default '0',
  user_text_mode int(11) NOT NULL default '0',
  date_format varchar(50) NOT NULL default '',
  created int(11) NOT NULL default '0',
  time_limit int(11) NOT NULL default '0',
  hidden int(11) NOT NULL default '0',
  public_results int(11) NOT NULL default '0',
  access_control int(11) NOT NULL default '0',
  survey_limit_times int(11) NOT NULL default '0',
  survey_limit_number int(11) NOT NULL default '0',
  survey_limit_unit int(11) NOT NULL default '0',
  survey_limit_seconds int(11) NOT NULL default '0',
  PRIMARY KEY  (sid)
) CHARACTER SET latin1
TYPE=MyISAM;

--
-- Dumping data for table `surveys`
--

INSERT INTO surveys VALUES (2,'Example Survey',0,0,1,'Default','index',0,0,'Y-m-d H:i',1089173049,0,0,1,0,2,1,3,0);
INSERT INTO surveys VALUES (5,'Example Command Climate Assessment',0,0,1,'Default','index',0,0,'Y-m-d H:i:s',1089173049,0,0,1,0,2,1,3,0);

--
-- Table structure for table `surveys_sequence`
--

DROP TABLE IF EXISTS surveys_sequence;
CREATE TABLE surveys_sequence (
  id int(11) NOT NULL default '0',
  PRIMARY KEY  (id)
) TYPE=MyISAM;

--
-- Dumping data for table `surveys_sequence`
--

INSERT INTO surveys_sequence VALUES (27);

--
-- Table structure for table `time_limit`
--

DROP TABLE IF EXISTS time_limit;
CREATE TABLE time_limit (
  sequence int(11) NOT NULL default '0',
  sid int(11) NOT NULL default '0',
  elapsed_time int(11) NOT NULL default '0',
  quitflag int(11) NOT NULL default '0',
  PRIMARY KEY  (sequence),
  KEY sid (sid)
) TYPE=MyISAM;

--
-- Dumping data for table `time_limit`
--

INSERT INTO time_limit VALUES (159,5,17,1);
INSERT INTO time_limit VALUES (174,5,2,1);
INSERT INTO time_limit VALUES (175,2,53,1);
INSERT INTO time_limit VALUES (176,2,4,1);
INSERT INTO time_limit VALUES (177,5,1,1);
INSERT INTO time_limit VALUES (230,5,2,1);
INSERT INTO time_limit VALUES (231,2,1,1);
INSERT INTO time_limit VALUES (236,5,17,0);
INSERT INTO time_limit VALUES (237,5,17,0);
INSERT INTO time_limit VALUES (238,5,11,0);
INSERT INTO time_limit VALUES (239,2,1,1);
INSERT INTO time_limit VALUES (240,2,1,1);
INSERT INTO time_limit VALUES (241,2,16,0);
INSERT INTO time_limit VALUES (242,2,3,1);
INSERT INTO time_limit VALUES (243,2,8,0);
INSERT INTO time_limit VALUES (244,2,11,0);
INSERT INTO time_limit VALUES (245,2,9,0);
INSERT INTO time_limit VALUES (246,2,11,0);
INSERT INTO time_limit VALUES (247,2,71,0);
INSERT INTO time_limit VALUES (248,2,9,0);
INSERT INTO time_limit VALUES (249,2,10,0);
INSERT INTO time_limit VALUES (250,2,2,1);
INSERT INTO time_limit VALUES (251,2,7,0);
INSERT INTO time_limit VALUES (252,2,10,0);
INSERT INTO time_limit VALUES (253,2,12,0);
INSERT INTO time_limit VALUES (254,2,2,1);
INSERT INTO time_limit VALUES (255,2,3,1);
INSERT INTO time_limit VALUES (256,2,7,0);
INSERT INTO time_limit VALUES (257,2,10,0);
INSERT INTO time_limit VALUES (258,2,8,0);
INSERT INTO time_limit VALUES (259,2,3,1);
INSERT INTO time_limit VALUES (260,2,9,0);
INSERT INTO time_limit VALUES (261,2,35,0);
INSERT INTO time_limit VALUES (262,2,13,0);
INSERT INTO time_limit VALUES (263,2,9,0);
INSERT INTO time_limit VALUES (299,5,21,0);
INSERT INTO time_limit VALUES (300,5,9,0);
INSERT INTO time_limit VALUES (301,5,8,0);
INSERT INTO time_limit VALUES (302,5,9,0);
INSERT INTO time_limit VALUES (303,5,113,1);
INSERT INTO time_limit VALUES (304,5,15,0);
INSERT INTO time_limit VALUES (305,5,9,0);
INSERT INTO time_limit VALUES (306,5,246,1);
INSERT INTO time_limit VALUES (307,5,12,0);
INSERT INTO time_limit VALUES (308,5,9,0);
INSERT INTO time_limit VALUES (309,5,18,0);
INSERT INTO time_limit VALUES (310,5,16,0);
INSERT INTO time_limit VALUES (311,5,4,1);
INSERT INTO time_limit VALUES (312,5,14,0);
INSERT INTO time_limit VALUES (313,5,27,0);
INSERT INTO time_limit VALUES (314,5,79,0);
INSERT INTO time_limit VALUES (315,5,8,0);
INSERT INTO time_limit VALUES (326,5,10,0);
INSERT INTO time_limit VALUES (327,5,9,0);
INSERT INTO time_limit VALUES (328,5,9,0);
INSERT INTO time_limit VALUES (331,5,8,0);
INSERT INTO time_limit VALUES (332,2,9,0);
INSERT INTO time_limit VALUES (346,5,9,0);
INSERT INTO time_limit VALUES (336,5,7,0);
INSERT INTO time_limit VALUES (337,2,10,0);
INSERT INTO time_limit VALUES (345,2,9,0);
INSERT INTO time_limit VALUES (356,5,9,1);
INSERT INTO time_limit VALUES (357,5,8,1);
INSERT INTO time_limit VALUES (363,2,81,0);
INSERT INTO time_limit VALUES (364,2,4,1);
INSERT INTO time_limit VALUES (365,2,44,1);
INSERT INTO time_limit VALUES (366,2,80,0);

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  uid int(11) NOT NULL default '0',
  sid int(11) NOT NULL default '0',
  name varchar(50) NOT NULL default '',
  email varchar(100) NOT NULL default '',
  username varchar(25) NOT NULL default '',
  password varchar(25) NOT NULL default '',
  admin_priv int(11) NOT NULL default '0',
  create_priv int(11) NOT NULL default '0',
  take_priv int(11) NOT NULL default '0',
  results_priv int(11) NOT NULL default '0',
  edit_priv int(11) NOT NULL default '0',
  status int(11) NOT NULL default '0',
  status_date int(11) NOT NULL default '0',
  invite_code varchar(32) default NULL,
  PRIMARY KEY  (uid,sid)
) CHARACTER SET latin1
TYPE=MyISAM;


--
-- Dumping data for table `users`
--

INSERT INTO users VALUES (1,0,'','','admin','password',1,1,0,0,0,0,0,NULL);
INSERT INTO users VALUES (29,5,'','','user','password',0,0,0,0,1,0,0,NULL);
INSERT INTO users VALUES (25,2,'','','user','password',0,0,1,0,1,3,1095135716,NULL);

--
-- Table structure for table `users_sequence`
--

DROP TABLE IF EXISTS users_sequence;
CREATE TABLE users_sequence (
  id int(11) NOT NULL default '0'
) TYPE=MyISAM;

--
-- Dumping data for table `users_sequence`
--

INSERT INTO users_sequence VALUES (29);

