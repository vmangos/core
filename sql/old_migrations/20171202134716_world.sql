DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171202134716');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171202134716');
-- Add your query below.

-- Assign ZoneOrSort to quests that are missing it.
UPDATE `quest_template` SET `ZoneOrSort`=10 WHERE `entry`=236;
UPDATE `quest_template` SET `ZoneOrSort`=1377 WHERE `entry`=1156;
UPDATE `quest_template` SET `ZoneOrSort`=440 WHERE `entry`=1157;
UPDATE `quest_template` SET `ZoneOrSort`=440 WHERE `entry`=1158;
UPDATE `quest_template` SET `ZoneOrSort`=-81 WHERE `entry`=1782;
UPDATE `quest_template` SET `ZoneOrSort`=1638 WHERE `entry`=3581;
UPDATE `quest_template` SET `ZoneOrSort`=28 WHERE `entry`=5504;
UPDATE `quest_template` SET `ZoneOrSort`=28 WHERE `entry`=5524;
UPDATE `quest_template` SET `ZoneOrSort`=-61 WHERE `entry`=6000;
UPDATE `quest_template` SET `ZoneOrSort`=28 WHERE `entry`=6165;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
