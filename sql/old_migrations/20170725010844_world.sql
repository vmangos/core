INSERT INTO `migrations` VALUES ('20170725010844');

-- http://web.archive.org/web/20071030230401/http://wow.allakhazam.com:80/db/quest.html?wquest=8388
-- For Great Honor (8388): Category is Orgrimmar! The Battlegrounds category was
-- added with TBC
UPDATE `quest_template` SET `ZoneOrSort` = 1637 WHERE `entry` = 8388;
