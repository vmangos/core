DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180406182241');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180406182241');
-- Add your query below.


-- Ooze covered mithril
-- https://github.com/LightsHope/issues/issues/111
UPDATE `gameobject_template` SET `data9`='0' WHERE `entry` in (123310,123309,2653,180215,1610,1667,19903,73941,177388,73940,123848);

-- Not Skarr the Broken
UPDATE `creature_template` SET `name`='Skarr the Unbreakable' WHERE `entry`=11498;

-- Milly Osworth requirements
-- https://github.com/LightsHope/issues/issues/117
UPDATE `quest_template` SET `NextQuestId`='3903', `ExclusiveGroup`='-18', `NextQuestInChain`='0' WHERE `entry`=18;
UPDATE `quest_template` SET `NextQuestId`='3903', `ExclusiveGroup`='-18', `NextQuestInChain`='0' WHERE `entry`=33;
UPDATE `quest_template` SET `PrevQuestId`='0' WHERE `entry`=3903;

-- Apprentice Angler reward
-- https://github.com/LightsHope/issues/issues/140
UPDATE `quest_template` SET `RewOrReqMoney`='2300' WHERE `entry`=8194;

-- Demonfork coefficient
-- https://github.com/LightsHope/issues/issues/137
REPLACE INTO `spell_bonus_data` VALUES (16603, 0, 0.2, 0, 0, 'Demonfork - Drain Life');

-- AQ20 faction specific loot
UPDATE `reference_loot_template` SET `condition_id`='3' WHERE `entry`=30435 AND `item`=21481;
UPDATE `reference_loot_template` SET `condition_id`='2' WHERE `entry`=30435 AND `item`=21482;
UPDATE `reference_loot_template` SET `condition_id`='3' WHERE `entry`=30429 AND `item`=21475;
UPDATE `reference_loot_template` SET `condition_id`='2' WHERE `entry`=30429 AND `item`=21476;
UPDATE `reference_loot_template` SET `condition_id`='3' WHERE `entry`=30436 AND `item`=21486;
UPDATE `reference_loot_template` SET `condition_id`='2' WHERE `entry`=30436 AND `item`=21487;

-- https://github.com/LightsHope/issues/issues/205 Darnassus banker faction
UPDATE `creature_template` SET `faction_A`='79', `faction_H`='79' WHERE `entry`=4155;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
