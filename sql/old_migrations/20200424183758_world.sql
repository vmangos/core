DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200424183758');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200424183758');
-- Add your query below.


-- Update drop chance of Righteous Orb based on Wowhead.
-- https://classic.wowhead.com/item=12811/righteous-orb#dropped-by
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=18 WHERE `entry`=10811 && `item`=12811; -- Archivist Galford
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=7 WHERE `entry`=10425 && `item`=12811; -- Crimson Battle Mage
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=7 WHERE `entry`=10419 && `item`=12811; -- Crimson Conjuror
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=8 WHERE `entry`=10421 && `item`=12811; -- Crimson Defender
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=1.6 WHERE `entry`=12128 && `item`=12811; -- Crimson Elite
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=8 WHERE `entry`=10424 && `item`=12811; -- Crimson Gallant
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=9 WHERE `entry`=10418 && `item`=12811; -- Crimson Guardsman
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=8 WHERE `entry`=10420 && `item`=12811; -- Crimson Initiate
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=7 WHERE `entry`=10426 && `item`=12811; -- Crimson Inquisitor
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=8 WHERE `entry`=11043 && `item`=12811; -- Crimson Monk
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=7 WHERE `entry`=10423 && `item`=12811; -- Crimson Priest
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=7 WHERE `entry`=10422 && `item`=12811; -- Crimson Sorcerer
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=1.8 WHERE `entry`=12339 && `item`=12811; -- Demetria

-- Update loot from Crimson Hammersmith based on Wowhead.
-- https://classic.wowhead.com/npc=11120/crimson-hammersmith
DELETE FROM `creature_loot_template` WHERE `entry`=11120;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (11120, 13351, -100, 0, 1, 1, 0, 0, 10);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (11120, 14047, 26, 0, 2, 4, 0, 0, 10);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (11120, 18781, 40, 0, 1, 1, 0, 0, 10);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (11120, 12811, 4, 0, 1, 1, 0, 0, 10);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (11120, 8932, 4, 0, 1, 1, 0, 0, 10);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (11120, 8766, 1.8, 0, 1, 1, 0, 0, 10);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (11120, 13446, 1.4, 0, 1, 1, 0, 0, 10);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (11120, 5759, 0.8, 0, 1, 1, 0, 0, 10);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (11120, 7910, 0.5, 0, 1, 1, 0, 0, 10);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (11120, 7909, 0.4, 0, 1, 1, 0, 0, 10);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (11120, 2073, 2, 0, -2073, 1, 0, 0, 10);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (11120, 24024, 3, 0, -24024, 1, 0, 0, 10);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
