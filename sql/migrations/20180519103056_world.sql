DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180519103056');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180519103056');
-- Add your query below.


-- Set faction of Captured Arko'narin to Friendly so nearby mobs don't kill him before the escort begins.
UPDATE `creature_template` SET `faction_A`=35, `faction_H`=35 WHERE `entry`=11016;

-- Add skinning loot of Mottled Drywallow Crocolisk into a group.
DELETE FROM `skinning_loot_template` WHERE `entry`=4344;
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (4344, 4234, 78, 1, 1, 1, 0, 0, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (4344, 4235, 2, 1, 1, 1, 0, 0, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (4344, 4304, 20, 1, 1, 1, 0, 0, 10);

-- Add skinning loot of Noxious Shredder into a group.
DELETE FROM `skinning_loot_template` WHERE `entry`=4348;
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (4348, 4234, 78, 1, 1, 1, 0, 0, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (4348, 4235, 2, 1, 1, 1, 0, 0, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (4348, 4304, 20, 1, 1, 1, 0, 0, 10);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
