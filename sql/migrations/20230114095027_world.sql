DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230114095027');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230114095027');
-- Add your query below.

UPDATE `quest_template` SET `entry`=7124, `RewRepFaction1`=729, `RewRepFaction2`=76, `RewRepValue1`=100, `RewRepValue2`=100 WHERE `entry`=7124 AND `patch`=3;
UPDATE `quest_template` SET `entry`=7082, `RewRepFaction1`=729, `RewRepFaction2`=76, `RewRepValue1`=100, `RewRepValue2`=100 WHERE `entry`=7082 AND `patch`=3;
UPDATE `quest_template` SET `entry`=7101, `RewRepFaction1`=729, `RewRepFaction2`=76, `RewRepValue1`=100, `RewRepValue2`=100 WHERE `entry`=7101 AND `patch`=3;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
