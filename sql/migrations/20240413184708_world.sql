DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240413184708');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240413184708');
-- Add your query below.


/*
 World of Warcraft Client Patch 1.7.0 (2005-09-13)
 - Araj the Summoner no longer drops a Corruptor's Scourgestone 100% of
   the time when killed.
*/
-- https://www.wowhead.com/classic/npc=1852/araj-the-summoner
-- wowhead says 50% chance in final patch
DELETE FROM `creature_loot_template` WHERE `entry`=1852 && `item`=12843;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (1852, 12843, 100, 0, 1, 1, 17, 0, 4);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (1852, 12843, 50, 0, 1, 1, 17, 5, 10);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
