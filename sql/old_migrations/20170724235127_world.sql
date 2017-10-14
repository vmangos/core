INSERT INTO `migrations` VALUES ('20170724235127');

-- Removes trailing whitespace in title
UPDATE `quest_template` SET `Title` = 'Other Fish to Fry' WHERE `entry` = 6143;
