INSERT INTO `migrations` VALUES ('20170724235429');

-- Removes `(part 2)' suffix
UPDATE `quest_template` SET `Title` = 'A Plague Upon Thee' WHERE `entry` = 5902;

-- Removes `(part 3)' suffix
UPDATE `quest_template` SET `Title` = 'A Plague Upon Thee' WHERE `entry` = 6390;
