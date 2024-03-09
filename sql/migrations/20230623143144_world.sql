DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230623143144');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230623143144');
-- Add your query below.


-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Correct Quest Progression For Donation of wool/silk/mageweave/runecloth For Patch 3
-- Wool 
UPDATE `quest_template` SET `ExclusiveGroup`=-7791 WHERE  `entry`=7791 AND `patch`=3;
UPDATE `quest_template` SET `ExclusiveGroup`=-7792 WHERE  `entry`=7792 AND `patch`=3;
UPDATE `quest_template` SET `ExclusiveGroup`=-7802 WHERE  `entry`=7802 AND `patch`=3;
UPDATE `quest_template` SET `ExclusiveGroup`=-7807 WHERE  `entry`=7807 AND `patch`=3;
UPDATE `quest_template` SET `ExclusiveGroup`=-7813 WHERE  `entry`=7813 AND `patch`=3;
UPDATE `quest_template` SET `ExclusiveGroup`=-7820 WHERE  `entry`=7820 AND `patch`=3;
UPDATE `quest_template` SET `ExclusiveGroup`=-7826 WHERE  `entry`=7826 AND `patch`=3;
UPDATE `quest_template` SET `ExclusiveGroup`=-7833 WHERE  `entry`=7833 AND `patch`=3;

-- Silk
UPDATE `quest_template` SET `ExclusiveGroup`=-7791 WHERE  `entry`=7793 AND `patch`=3;
UPDATE `quest_template` SET `ExclusiveGroup`=-7792 WHERE  `entry`=7798 AND `patch`=3;
UPDATE `quest_template` SET `ExclusiveGroup`=-7802 WHERE  `entry`=7803 AND `patch`=3;
UPDATE `quest_template` SET `ExclusiveGroup`=-7807 WHERE  `entry`=7808 AND `patch`=3;
UPDATE `quest_template` SET `ExclusiveGroup`=-7813 WHERE  `entry`=7814 AND `patch`=3;
UPDATE `quest_template` SET `ExclusiveGroup`=-7820 WHERE  `entry`=7821 AND `patch`=3;
UPDATE `quest_template` SET `ExclusiveGroup`=-7826 WHERE  `entry`=7827 AND `patch`=3;
UPDATE `quest_template` SET `ExclusiveGroup`=-7833 WHERE  `entry`=7834 AND `patch`=3;

-- Mageweave
UPDATE `quest_template` SET `ExclusiveGroup`=-7791 WHERE  `entry`=7794 AND `patch`=3;
UPDATE `quest_template` SET `ExclusiveGroup`=-7792 WHERE  `entry`=7799 AND `patch`=3;
UPDATE `quest_template` SET `ExclusiveGroup`=-7802 WHERE  `entry`=7804 AND `patch`=3;
UPDATE `quest_template` SET `ExclusiveGroup`=-7807 WHERE  `entry`=7809 AND `patch`=3;
UPDATE `quest_template` SET `ExclusiveGroup`=-7813 WHERE  `entry`=7817 AND `patch`=3;
UPDATE `quest_template` SET `ExclusiveGroup`=-7820 WHERE  `entry`=7822 AND `patch`=3;
UPDATE `quest_template` SET `ExclusiveGroup`=-7826 WHERE  `entry`=7831 AND `patch`=3;
UPDATE `quest_template` SET `ExclusiveGroup`=-7833 WHERE  `entry`=7835 AND `patch`=3;

-- Misc Wool
UPDATE `quest_template` SET `NextQuestId`=7795 WHERE  `entry`=7791 AND `patch`=3;
UPDATE `quest_template` SET `NextQuestId`=7800 WHERE  `entry`=7792 AND `patch`=3;
UPDATE `quest_template` SET `NextQuestId`=7805 WHERE  `entry`=7802 AND `patch`=3;
UPDATE `quest_template` SET `NextQuestId`=7811 WHERE  `entry`=7807 AND `patch`=3;
UPDATE `quest_template` SET `NextQuestId`=7818 WHERE  `entry`=7813 AND `patch`=3;
UPDATE `quest_template` SET `NextQuestId`=7823 WHERE  `entry`=7820 AND `patch`=3;
UPDATE `quest_template` SET `NextQuestId`=7824 WHERE  `entry`=7826 AND `patch`=3;
UPDATE `quest_template` SET `NextQuestId`=7836 WHERE  `entry`=7833 AND `patch`=3;

-- Misc Silk
UPDATE `quest_template` SET `NextQuestId`=7795 WHERE  `entry`=7793 AND `patch`=3;
UPDATE `quest_template` SET `NextQuestId`=7800 WHERE  `entry`=7798 AND `patch`=3;
UPDATE `quest_template` SET `NextQuestId`=7805 WHERE  `entry`=7803 AND `patch`=3;
UPDATE `quest_template` SET `NextQuestId`=7811 WHERE  `entry`=7808 AND `patch`=3;
UPDATE `quest_template` SET `NextQuestId`=7818 WHERE  `entry`=7814 AND `patch`=3;
UPDATE `quest_template` SET `NextQuestId`=7823 WHERE  `entry`=7821 AND `patch`=3;
UPDATE `quest_template` SET `NextQuestId`=7824 WHERE  `entry`=7827 AND `patch`=3;
UPDATE `quest_template` SET `NextQuestId`=7836 WHERE  `entry`=7834 AND `patch`=3;
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE  `entry`=7793 AND `patch`=3;
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE  `entry`=7798 AND `patch`=3;
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE  `entry`=7808 AND `patch`=3;
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE  `entry`=7803 AND `patch`=3;
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE  `entry`=7814 AND `patch`=3;
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE  `entry`=7821 AND `patch`=3;
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE  `entry`=7827 AND `patch`=3;
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE  `entry`=7834 AND `patch`=3;

-- Misc Mageweave
UPDATE `quest_template` SET `NextQuestId`=7824 WHERE  `entry`=7831 AND `patch`=3;
UPDATE `quest_template` SET `NextQuestId`=7836 WHERE  `entry`=7835 AND `patch`=3;
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE  `entry`=7794 AND `patch`=3;
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE  `entry`=7804 AND `patch`=3;
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE  `entry`=7809 AND `patch`=3;
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE  `entry`=7817 AND `patch`=3;
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE  `entry`=7822 AND `patch`=3;
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE  `entry`=7831 AND `patch`=3;
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE  `entry`=7835 AND `patch`=3;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Corrections to Rogue Class Quests
UPDATE `quest_template` SET `BreadcrumbForQuestId` = 1886, `NextQuestInChain` = 0, `ExclusiveGroup` = 0 WHERE `entry` = 1885;
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 1886;

UPDATE `quest_template` SET `BreadcrumbForQuestId` = 1963, `NextQuestInChain` = 0, `ExclusiveGroup` = 0 WHERE `entry` = 1859;
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 1963;
UPDATE `quest_template` SET `RequiredRaces` = 130 WHERE `entry` = 1859;

UPDATE `quest_template` SET `NextQuestId`= 0, `BreadcrumbForQuestId` = 2238, `NextQuestInChain` = 0, `QuestFlags` = 0, `ExclusiveGroup` = 0 WHERE `entry` = 2218;
UPDATE `quest_template` SET `PrevQuestId`= 0 WHERE `entry` = 2238;

UPDATE `quest_template` SET `NextQuestId` = 0, `BreadcrumbForQuestId` = 2206, `ExclusiveGroup` = 0 WHERE `entry` = 2205;
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 2206;

UPDATE `quest_template` SET `NextQuestId` = 0, `BreadcrumbForQuestId` = 2242, `ExclusiveGroup` = 0 WHERE `entry` = 2241;
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 2242;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Quests 2977 and 2967 are Alliance / Horde Only
UPDATE `quest_template` SET `RequiredRaces` = 77 WHERE `entry` = 2977;
UPDATE `quest_template` SET `RequiredRaces` = 178 WHERE `entry` = 2967;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Correct Respawn Times for Some Objects
-- Abercrombies Crate
UPDATE `gameobject` SET `spawntimesecsmin` = 0, `spawntimesecsmax` = 0 WHERE `guid` = 14137;

-- Cozzle's Footlocker
UPDATE `gameobject` SET `spawntimesecsmin` = 0, `spawntimesecsmax` = 0 WHERE `guid` = 11013;

-- Clara's Fresh Apples
UPDATE `gameobject` SET `spawntimesecsmin` = 20, `spawntimesecsmax` = 20 WHERE `guid` = 26772;

-- Waterlogged Letter
UPDATE `gameobject` SET `spawntimesecsmin` = 20, `spawntimesecsmax` = 20 WHERE `guid` = 14656;

-- Shadowforge Cache
UPDATE `gameobject` SET `spawntimesecsmin` = 0, `spawntimesecsmax` = 0 WHERE `guid` = 40694;

-- Conspicuous Urn
UPDATE `gameobject` SET `spawntimesecsmin` = 0, `spawntimesecsmax` = 0 WHERE `guid` = 40695;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Quests are Alliance / Horde Only
UPDATE `quest_template` SET `RequiredRaces` = 77 WHERE `entry` IN (8951, 8952, 8953, 8954, 8955, 8956, 8958, 8959);
UPDATE `quest_template` SET `RequiredRaces` = 178 WHERE `entry` IN (8957, 9016, 9017, 9018, 9019, 9020, 9021, 9022);

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Correct Position of Altar of the Defiler
UPDATE `gameobject` SET `position_x` = -11247.5, `position_y` = -2831.07, `position_z` = 159.971, `orientation` = 5.79449, `rotation2` = -0.241921, `rotation3` = 0.970296 WHERE  `guid`=16739;

-- Add Missing Spawn Yell For Razelikh the Defiler
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(766409, 7664, 0, 11, 0, 100, 0, 0, 0, 0, 0, 766409, 0, 0, 'Razelikh the Defiler - Yell on Spawn');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(766409, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4549, 0, 0, 0, 0, 0, 0, 0, 0, 'Razelikh the Defiler - Yell on Spawn');

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Remove Incorrect Loot Template
UPDATE `creature_template` SET `loot_id` = 0 WHERE `entry` = 235;
DELETE FROM `creature_loot_template`  WHERE `entry` = 235;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Remove Incorrect Creature
DELETE FROM `creature` WHERE `guid` = 21706;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Ran Bloodtooth's Skull Should Always Drop
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 100 WHERE `item` = 5388;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Correct Scale For Mechanical Greench
UPDATE `creature_template` SET `display_scale1` = 0 WHERE `entry` = 15721;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Add Item Root Sample To Correct Objects
DELETE FROM `gameobject_loot_template` WHERE `item` = 5056;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
(2511, 5056, -40, 0, 1, 1, 0, 0, 10),
(2512, 5056, -40, 0, 1, 1, 0, 0, 10),
(2513, 5056, -40, 0, 1, 1, 0, 0, 10),
(2515, 5056, -40, 0, 1, 1, 0, 0, 10),
(2514, 5056, -40, 0, 1, 1, 0, 0, 10),
(2516, 5056, -40, 0, 1, 1, 0, 0, 10);

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Correct Position of Argent Sentry
UPDATE `creature` SET `position_x` = 2281.64, `position_y` = -5323.76, `position_z` = 89.2311, `orientation` = 2.21657 WHERE `guid` = 69677;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
