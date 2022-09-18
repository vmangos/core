DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220917141705');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220917141705');
-- Add your query below.


-- The Blue Scepter Shard Questline Updates (credit cmangos)
DELETE FROM `creature_questrelation` WHERE `quest` = 8578 AND `id` = 11811;
UPDATE `quest_template` SET `RewMailTemplateId` = 123, `RewMailDelaySecs` = 86400, `RewMailMoney` = 1000000 WHERE `entry` = 8729;

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Update Quest End Script (credit cmangos)
DELETE FROM `quest_start_scripts` WHERE `id`=2765;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(2765, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3828, 0, 0, 0, 0, 0, 0, 0, 0, 'Expert Blacksmith!: Galvan the Ancient - Talk'),
(2765, 0, 0, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Expert Blacksmith!: Galvan the Ancient - Modify Flags'),
(2765, 2, 0, 3, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, -12030.27, -999.409, 49.77913, 0, 0, 'Expert Blacksmith!: Galvan the Ancient - Move'),
(2765, 9, 0, 28, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Expert Blacksmith!: Galvan the Ancient - Kneel'),
(2765, 13, 0, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Expert Blacksmith!: Galvan the Ancient - Stand'),
(2765, 15, 0, 3, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, -12036.58, -1002.73, 49.6633, 0, 0, 'Expert Blacksmith!: Galvan the Ancient - Move'),
(2765, 18, 0, 1, 133, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Expert Blacksmith!: Galvan the Ancient - Emote'),
(2765, 22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Expert Blacksmith!: Galvan the Ancient - Emote'),
(2765, 24, 0, 3, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, -12039.43, -1006.109, 49.6331, 2.78613, 0, 'Expert Blacksmith!: Galvan the Ancient - Move'),
(2765, 25, 0, 1, 133, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Expert Blacksmith!: Galvan the Ancient - Emote'),
(2765, 29, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Expert Blacksmith!: Galvan the Ancient - Emote'),
(2765, 31, 0, 3, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, -12039.9, -1009.15, 49.5048, 3.56047, 0, 'Expert Blacksmith!: Galvan the Ancient - Move'),
(2765, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3825, 0, 0, 0, 0, 0, 0, 0, 0, 'Expert Blacksmith!: Galvan the Ancient - Talk'),
(2765, 35, 0, 1, 233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Expert Blacksmith!: Galvan the Ancient - Emote'),
(2765, 39, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Expert Blacksmith!: Galvan the Ancient - Emote'),
(2765, 41, 0, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Expert Blacksmith!: Galvan the Ancient - Modify Flags'),
(2765, 41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3826, 0, 0, 0, 0, 0, 0, 0, 0, 'Expert Blacksmith!: Galvan the Ancient - Talk'),
(2765, 41, 0, 7, 2765, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Expert Blacksmith!: Galvan the Ancient - Complete QUest');

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Correct Object Size (credit cmangos)
UPDATE `gameobject_template` SET `size` = 1 WHERE `entry` = 1610;
UPDATE `gameobject_template` SET `size` = 1 WHERE `entry` = 1667;

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Update Kroshius Encounter (credit cmangos https://github.com/cmangos/tbc-db/pull/1110/files)
-- Kroshius Spell Target
UPDATE `gameobject` SET `position_x` = 5780.3354, `position_y` = -964.8442, `position_z` = 412.69403, `orientation` = 3.5081117 WHERE `guid` IN (3996170, 99894);

-- Fel Fire spawn
UPDATE `gameobject_template` SET `size` = 2 WHERE `entry` = 179676;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(157008, 179676, 1, 5780.3354, -964.8442, 412.69403, 3.5081117, 0, 0, 0, 0, -6, -6, 100, 1, 0, 0, 0, 10);

-- Kroshius 
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(39715, 14467, 0, 0, 0, 1, 5780.3354, -964.8442, 412.69403, 3.5081117, 180, 180, 0, 100, 0, 0, 0, 0, 0, 10);
UPDATE `creature_template` SET `faction` = 1194, `flags_extra` = 0 WHERE `entry` = 14467;


-- Events list for Kroshius
DELETE FROM `creature_ai_events` WHERE `creature_id`=14467;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(1446701, 14467, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1446701, 0, 0, 'Kroshius - Set Stand State - Just Spawned');
DELETE FROM `creature_ai_scripts` WHERE `id`=1446701;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1446701, 0, 0, 28, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kroshius - Set Stand State');

DELETE FROM `event_scripts` WHERE `id`=8328;
INSERT INTO `event_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(8328, 0, 0, 9, 157008, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kroshius - Respawn Gameobject'),
(8328, 3, 0, 28, 0, 0, 0, 0, 39715, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kroshius - Set Stand State'),
(8328, 5, 0, 0, 0, 0, 0, 0, 39715, 0, 9, 2, 9633, 0, 0, 0, 0, 0, 0, 0, 0, 'Kroshius - Talk'),
(8328, 5, 0, 35, 0, 0, 0, 0, 39715, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kroshius - Orientation'),
(8328, 5, 0, 1, 15, 0, 0, 0, 39715, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kroshius - Emote'),
(8328, 10, 0, 22, 14, 1, 0, 0, 39715, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kroshius - Set Faction'),
(8328, 10, 0, 4, 46, 768, 2, 0, 39715, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kroshius - Remove Unit Flag'),
(8328, 1200, 0, 18, 0, 0, 0, 0, 39715, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kroshius - Despawn');

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Add Spells to Doomguard Minion (credit cmangos)
UPDATE `creature_template` SET `spell_list_id` = 14385 WHERE `entry` = 14385;
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES
(14385, 'Dire Maul - Doomguard Minion', 16005, 100, 4, 0, 0, 0, 5, 8, 18, 24, 0, 16727, 100, 0, 0, 0, 0, 12, 15, 20, 25, 0, 89, 100, 1, 0, 0, 32, 0, 0, 30, 30, 0, 15090, 100, 1, 0, 0, 0, 7, 14, 17, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Add Script For Disharmony of Flame (credit cmangos)
UPDATE `quest_template` SET `CompleteScript` = 3906 WHERE `entry` = 3906;
UPDATE `broadcast_text` SET `chat_type` = 4 WHERE `entry` IN (4717, 4718);

DELETE FROM `quest_end_scripts` WHERE `id`=3906;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(3906, 1, 0, 0, 0, 0, 0, 0, 6884, 0, 9, 2, 4717, 0, 0, 0, 0, 0, 0, 0, 0, 'Disharmony of Flame: Shadowmage Vivian Lagrave - Talk'),
(3906, 4, 0, 0, 0, 0, 0, 0, 6879, 0, 9, 2, 4718, 0, 0, 0, 0, 0, 0, 0, 0, 'Disharmony of Flame: Galamav the Marksman - Talk');

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Set Some War Effort Broadcast Texts (credit cmangos)
UPDATE `broadcast_text` SET `chat_type` = 6 WHERE `entry` IN (11427, 11432, 11425, 11426, 11424);
UPDATE `broadcast_text` SET `chat_type` = 6 WHERE `entry` IN (11429);

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Add Missing Text to Nathanos Blightcaller (credit cmangos)
DELETE FROM `creature_ai_events` WHERE `creature_id`=11878;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1187801, 11878, 269, 1, 0, 100, 1, 60000, 60000, 120000, 240000, 1187801, 0, 0, 'Nathanos Blightcaller - Start Dog Fetch Event');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1187802, 11878, 0, 0, 0, 100, 1, 30000, 30000, 30000, 30000, 1187802, 0, 0, 'Nathanos Blightcaller - Cast Spell Blighthound Call');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1187803, 11878, 0, 4, 0, 100, 2, 0, 0, 0, 0, 1187803, 1187805, 0, 'Nathanos Blightcaller - Say Text on Aggro');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1187804, 11878, 0, 7, 0, 100, 2, 0, 0, 0, 0, 1187804, 1187806, 0, 'Nathanos Blightcaller - Say Text on Evade');

DELETE FROM `creature_ai_scripts` WHERE `id`=1187803;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1187803, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7229, 7230, 7231, 7232, 0, 0, 0, 0, 0, 'Nathanos Blightcaller - Say Random Text');

DELETE FROM `creature_ai_scripts` WHERE `id`=1187805;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1187805, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7233, 0, 0, 0, 0, 0, 0, 0, 0, 'Nathanos Blightcaller - Say Random Text');

DELETE FROM `creature_ai_scripts` WHERE `id`=1187804;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1187804, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7234, 7235, 7236, 7237, 0, 0, 0, 0, 0, 'Nathanos Blightcaller - Say Random Text'),
(1187804, 0, 0, 56, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nathanos Blightcaller - Despawn Guardians');


DELETE FROM `creature_ai_scripts` WHERE `id`=1187806;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1187806, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7238, 7239, 0, 0, 0, 0, 0, 0, 0, 'Nathanos Blightcaller - Say Random Text');

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Improve Timers for Zevrim Thornhoof 11490 (credit cmangos)
DELETE FROM `creature_ai_events` WHERE `creature_id`=11490;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(1149001, 11490, 0, 0, 0, 100, 1, 1000, 5000, 12000, 18000, 1149001, 0, 0, 'Zevrim Thornhoof - Cast Intense Pain');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(1149002, 11490, 0, 0, 0, 100, 1, 8000, 10000, 16000, 24000, 1149002, 0, 0, 'Zevrim Thornhoof - Cast Sacrifice');

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Update Some Breadcrumb Quests (credit cmangos)
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 364;
UPDATE `quest_template` SET `BreadcrumbForQuestId` = 691 WHERE `entry` = 690; -- Malin's Request -> Worth Its Weight in Gold
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 691;
UPDATE `quest_template` SET `BreadcrumbForQuestId` = 1524, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `entry` = 1522; -- Call of Fire -> Call of Fire
UPDATE `quest_template` SET `BreadcrumbForQuestId` = 1524, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `entry` = 1523; -- Call of Fire -> Call of Fire
UPDATE `quest_template` SET `BreadcrumbForQuestId` = 1524, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `entry` = 2983; -- Call of Fire -> Call of Fire
UPDATE `quest_template` SET `BreadcrumbForQuestId` = 1524, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `entry` = 2984; -- Call of Fire -> Call of Fire
UPDATE `quest_template` SET `BreadcrumbForQuestId` = 1530, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `entry` = 1528; -- Call of Water -> Call of Water
UPDATE `quest_template` SET `BreadcrumbForQuestId` = 1530, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `entry` = 1529; -- Call of Water -> Call of Water
UPDATE `quest_template` SET `BreadcrumbForQuestId` = 1530, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `entry` = 2985; -- Call of Water -> Call of Water
UPDATE `quest_template` SET `BreadcrumbForQuestId` = 1530, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `entry` = 2986; -- Call of Water -> Call of Water
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 1699;
UPDATE `quest_template` SET `BreadcrumbForQuestId` = 1705 WHERE `entry` = 1700; -- Grimand Elmore -> Burning Blood
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 1705;
UPDATE `quest_template` SET `BreadcrumbForQuestId` = 1710 WHERE `entry` = 1703; -- Mathiel -> Sunscorched Shells
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 1710;
UPDATE `quest_template` SET `BreadcrumbForQuestId` = 1708 WHERE `entry` = 1704; -- Klockmort Spannerspan -> Iron Coral
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 1708;
UPDATE `quest_template` SET `BreadcrumbForQuestId` = 1842 WHERE `entry` = 1839; -- Ula'elek and the Brutal Gauntlets -> Satyr Hooves
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 1842;
UPDATE `quest_template` SET `BreadcrumbForQuestId` = 1844 WHERE `entry` = 1840; -- Orm Stonehoof and the Brutal Helm -> Chimaeric Horn
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 1844;
UPDATE `quest_template` SET `BreadcrumbForQuestId` = 1846 WHERE `entry` = 1841; -- Velora Nitely and the Brutal Legguards -> Dragonmaw Shinbones
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 1846;
UPDATE `quest_template` SET `BreadcrumbForQuestId` = 4734 WHERE `entry` = 4907; -- Tinkee Steamboil -> Egg Freezing
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 4734;
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 1699;

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Modify elementals dmgschool to deal elemental damage on melee attacks (credit azerothcore)
UPDATE `creature_template` SET `damage_school` = 3 WHERE `entry` = 13696;
UPDATE `creature_template` SET `damage_school` = 2 WHERE `entry` IN (10756, 10757, 11673);
UPDATE `creature_template` SET `damage_school` = 5 WHERE `entry` IN (521, 3470, 8538, 10389, 11284, 14389, 14686, 14986, 15146);

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Gurubashi Bat Rider and Bloodshot Are Not Skinnable
UPDATE `creature_template` SET `skinning_loot_id`= 0 WHERE `entry` IN  (14750, 11614);
DELETE FROM `skinning_loot_template` WHERE `entry` IN (10151, 14750);

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Objects Used in Quest Bingles' Missing Supplies Should Respawn Faster (credit cmangos)
UPDATE `gameobject` SET `spawntimesecsmin` = 5, `spawntimesecsmax` = 5 WHERE `guid` IN (12871, 12863, 12872, 12864);

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Keeper Remulos 11832
UPDATE `creature` SET `spawntimesecsmin` = 180, `spawntimesecsmax` = 180 WHERE `id` = 11832;

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Correct Orientation
UPDATE `creature` SET `orientation` = 4.79274 WHERE `guid` = 26902;

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Correctly Pool Objects Used In Quest Uncovering the Past
DELETE FROM `gameobject` WHERE `id` IN (331, 333, 334, 35252);
DELETE FROM `pool_template` WHERE `entry` IN (152, 162, 1599, 1598);
DELETE FROM `pool_gameobject_template` WHERE `id` IN (331, 333, 334, 35252);

SET @OGUID = ;
SET @PTEMPLATE = ;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 331, 0, -3563.83, -1767.35, 79.1001, 4.26498, 0, 0, 0.846354, -0.53262, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 331, 0, -3485.88, -1727.12, 34.5372, 0.0349063, 0, 0, 0.0174522, 0.999848, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 331, 0, -3308.06, -1899.06, 31.7356, -2.11185, 0, 0, 0.870356, -0.492423, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 331, 0, -3425.58, -1758.09, 28.0262, -2.11185, 0, 0, -0.870356, 0.492424, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 331, 0, -3420.89, -1856.84, 16.9872, 2.51327, 0, 0, 0.951056, 0.309017, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 331, 0, -3371.96, -1846.54, 16.5207, -1.8326, 0, 0, 0.793353, -0.608761, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 331, 0, -3568.4, -1845.56, 24.3617, -2.96704, 0, 0, -0.996194, 0.087165, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 331, 0, -3373.47, -1810.15, 16.2407, 2.67035, 0, 0, 0.97237, 0.233445, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 331, 0, -3408.6, -1807.26, 17.8659, -1.39626, 0, 0, -0.642787, 0.766045, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 331, 0, -3461.63, -1803.47, 25.7061, 4.45059, 0, 0, -0.793353, 0.608762, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 331, 0, -3444.59, -1833.84, 24.9106, -1.39626, 0, 0, 0.642788, -0.766044, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 331, 0, -3469.87, -1836.43, 17.2882, 0, 0, 0, 0, 1, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 331, 0, -3522.12, -1799.96, 23.9379, -1.81514, 0, 0, -0.788011, 0.615662, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 331, 0, -3525.93, -1884.6, 24.2428, -0.575957, 0, 0, -0.284015, 0.95882, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 331, 0, -3549.77, -1723.89, 81.994, 2.75761, 0, 0, 0.981627, 0.190812, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 331, 0, -3391.45, -1783.01, 25.2344, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 331, 0, -3537.32, -1830.63, 16.2407, 2.75761, 0, 0, 0.981627, 0.190812, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 331, 0, -3500.26, -1766.83, 16.417, 2.67035, 0, 0, 0.972369, 0.233448, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 331, 0, -3470.78, -1863.77, 24.0417, 5.49779, 0, 0, -0.382683, 0.92388, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 331, 0, -3432.51, -1790.23, 16.3942, 4.15388, 0, 0, -0.874619, 0.48481, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 331, 0, -3556.36, -1744.41, 78.9947, 6.21337, 0, 0, -0.0348988, 0.999391, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 331, 0, -3550.56, -1805.25, 27.3557, 5.93412, 0, 0, -0.173648, 0.984808, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 331, 0, -3498.22, -1844.42, 16.4291, 0, 0, 0, 0, 1, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 331, 0, -3494.47, -1883.25, 16.2407, 5.18363, 0, 0, -0.522498, 0.85264, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 331, 0, -3490.14, -1787.05, 17.0477, 1.0821, 0, 0, 0.515038, 0.857168, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 331, 0, -3457.06, -1770.1, 16.3745, 5.70723, 0, 0, -0.284015, 0.95882, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 331, 0, -3393.8, -1825.06, 24.913, 1.09956, 0, 0, 0.522498, 0.85264, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 331, 0, -3392.07, -1857.27, 25.8701, 0.331611, 0, 0, 0.165047, 0.986286, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+29, 333, 0, -3563.83, -1767.35, 79.1001, 4.26498, 0, 0, 0.846354, -0.53262, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+30, 333, 0, -3485.88, -1727.12, 34.5372, 0.0349063, 0, 0, 0.0174522, 0.999848, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+31, 333, 0, -3308.06, -1899.06, 31.7356, -2.11185, 0, 0, 0.870356, -0.492423, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+32, 333, 0, -3425.58, -1758.09, 28.0262, -2.11185, 0, 0, -0.870356, 0.492424, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+33, 333, 0, -3420.89, -1856.84, 16.9872, 2.51327, 0, 0, 0.951056, 0.309017, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+34, 333, 0, -3371.96, -1846.54, 16.5207, -1.8326, 0, 0, 0.793353, -0.608761, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+35, 333, 0, -3568.4, -1845.56, 24.3617, -2.96704, 0, 0, -0.996194, 0.087165, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+36, 333, 0, -3373.47, -1810.15, 16.2407, 2.67035, 0, 0, 0.97237, 0.233445, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+37, 333, 0, -3408.6, -1807.26, 17.8659, -1.39626, 0, 0, -0.642787, 0.766045, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+38, 333, 0, -3461.63, -1803.47, 25.7061, 4.45059, 0, 0, -0.793353, 0.608762, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+39, 333, 0, -3444.59, -1833.84, 24.9106, -1.39626, 0, 0, 0.642788, -0.766044, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+40, 333, 0, -3469.87, -1836.43, 17.2882, 0, 0, 0, 0, 1, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+41, 333, 0, -3522.12, -1799.96, 23.9379, -1.81514, 0, 0, -0.788011, 0.615662, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+42, 333, 0, -3525.93, -1884.6, 24.2428, -0.575957, 0, 0, -0.284015, 0.95882, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+43, 333, 0, -3549.77, -1723.89, 81.994, 2.75761, 0, 0, 0.981627, 0.190812, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+44, 333, 0, -3391.45, -1783.01, 25.2344, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+45, 333, 0, -3537.32, -1830.63, 16.2407, 2.75761, 0, 0, 0.981627, 0.190812, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+46, 333, 0, -3500.26, -1766.83, 16.417, 2.67035, 0, 0, 0.972369, 0.233448, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+47, 333, 0, -3470.78, -1863.77, 24.0417, 5.49779, 0, 0, -0.382683, 0.92388, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+48, 333, 0, -3432.51, -1790.23, 16.3942, 4.15388, 0, 0, -0.874619, 0.48481, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+49, 333, 0, -3556.36, -1744.41, 78.9947, 6.21337, 0, 0, -0.0348988, 0.999391, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+50, 333, 0, -3550.56, -1805.25, 27.3557, 5.93412, 0, 0, -0.173648, 0.984808, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+51, 333, 0, -3498.22, -1844.42, 16.4291, 0, 0, 0, 0, 1, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+52, 333, 0, -3494.47, -1883.25, 16.2407, 5.18363, 0, 0, -0.522498, 0.85264, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+53, 333, 0, -3490.14, -1787.05, 17.0477, 1.0821, 0, 0, 0.515038, 0.857168, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+54, 333, 0, -3457.06, -1770.1, 16.3745, 5.70723, 0, 0, -0.284015, 0.95882, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+55, 333, 0, -3393.8, -1825.06, 24.913, 1.09956, 0, 0, 0.522498, 0.85264, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+56, 333, 0, -3392.07, -1857.27, 25.8701, 0.331611, 0, 0, 0.165047, 0.986286, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+57, 334, 0, -3563.83, -1767.35, 79.1001, 4.26498, 0, 0, 0.846354, -0.53262, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+58, 334, 0, -3485.88, -1727.12, 34.5372, 0.0349063, 0, 0, 0.0174522, 0.999848, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+59, 334, 0, -3308.06, -1899.06, 31.7356, -2.11185, 0, 0, 0.870356, -0.492423, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+60, 334, 0, -3425.58, -1758.09, 28.0262, -2.11185, 0, 0, -0.870356, 0.492424, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+61, 334, 0, -3420.89, -1856.84, 16.9872, 2.51327, 0, 0, 0.951056, 0.309017, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+62, 334, 0, -3371.96, -1846.54, 16.5207, -1.8326, 0, 0, 0.793353, -0.608761, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+63, 334, 0, -3568.4, -1845.56, 24.3617, -2.96704, 0, 0, -0.996194, 0.087165, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+64, 334, 0, -3373.47, -1810.15, 16.2407, 2.67035, 0, 0, 0.97237, 0.233445, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+65, 334, 0, -3408.6, -1807.26, 17.8659, -1.39626, 0, 0, -0.642787, 0.766045, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+66, 334, 0, -3461.63, -1803.47, 25.7061, 4.45059, 0, 0, -0.793353, 0.608762, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+67, 334, 0, -3444.59, -1833.84, 24.9106, -1.39626, 0, 0, 0.642788, -0.766044, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+68, 334, 0, -3469.87, -1836.43, 17.2882, 0, 0, 0, 0, 1, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+69, 334, 0, -3522.12, -1799.96, 23.9379, -1.81514, 0, 0, -0.788011, 0.615662, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+70, 334, 0, -3525.93, -1884.6, 24.2428, -0.575957, 0, 0, -0.284015, 0.95882, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+71, 334, 0, -3549.77, -1723.89, 81.994, 2.75761, 0, 0, 0.981627, 0.190812, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+72, 334, 0, -3391.45, -1783.01, 25.2344, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+73, 334, 0, -3537.32, -1830.63, 16.2407, 2.75761, 0, 0, 0.981627, 0.190812, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+74, 334, 0, -3500.26, -1766.83, 16.417, 2.67035, 0, 0, 0.972369, 0.233448, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+75, 334, 0, -3470.78, -1863.77, 24.0417, 5.49779, 0, 0, -0.382683, 0.92388, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+76, 334, 0, -3432.51, -1790.23, 16.3942, 4.15388, 0, 0, -0.874619, 0.48481, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+77, 334, 0, -3556.36, -1744.41, 78.9947, 6.21337, 0, 0, -0.0348988, 0.999391, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+78, 334, 0, -3550.56, -1805.25, 27.3557, 5.93412, 0, 0, -0.173648, 0.984808, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+79, 334, 0, -3498.22, -1844.42, 16.4291, 0, 0, 0, 0, 1, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+80, 334, 0, -3494.47, -1883.25, 16.2407, 5.18363, 0, 0, -0.522498, 0.85264, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+81, 334, 0, -3490.14, -1787.05, 17.0477, 1.0821, 0, 0, 0.515038, 0.857168, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+82, 334, 0, -3457.06, -1770.1, 16.3745, 5.70723, 0, 0, -0.284015, 0.95882, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+83, 334, 0, -3393.8, -1825.06, 24.913, 1.09956, 0, 0, 0.522498, 0.85264, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+84, 334, 0, -3392.07, -1857.27, 25.8701, 0.331611, 0, 0, 0.165047, 0.986286, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+85, 35252, 0, -3563.83, -1767.35, 79.1001, 4.26498, 0, 0, 0.846354, -0.53262, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+86, 35252, 0, -3485.88, -1727.12, 34.5372, 0.0349063, 0, 0, 0.0174522, 0.999848, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+87, 35252, 0, -3308.06, -1899.06, 31.7356, -2.11185, 0, 0, 0.870356, -0.492423, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+88, 35252, 0, -3425.58, -1758.09, 28.0262, -2.11185, 0, 0, -0.870356, 0.492424, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+89, 35252, 0, -3420.89, -1856.84, 16.9872, 2.51327, 0, 0, 0.951056, 0.309017, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+90, 35252, 0, -3371.96, -1846.54, 16.5207, -1.8326, 0, 0, 0.793353, -0.608761, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+91, 35252, 0, -3568.4, -1845.56, 24.3617, -2.96704, 0, 0, -0.996194, 0.087165, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+92, 35252, 0, -3373.47, -1810.15, 16.2407, 2.67035, 0, 0, 0.97237, 0.233445, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+93, 35252, 0, -3408.6, -1807.26, 17.8659, -1.39626, 0, 0, -0.642787, 0.766045, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+94, 35252, 0, -3461.63, -1803.47, 25.7061, 4.45059, 0, 0, -0.793353, 0.608762, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+95, 35252, 0, -3444.59, -1833.84, 24.9106, -1.39626, 0, 0, 0.642788, -0.766044, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+96, 35252, 0, -3469.87, -1836.43, 17.2882, 0, 0, 0, 0, 1, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+97, 35252, 0, -3522.12, -1799.96, 23.9379, -1.81514, 0, 0, -0.788011, 0.615662, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+98, 35252, 0, -3525.93, -1884.6, 24.2428, -0.575957, 0, 0, -0.284015, 0.95882, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+99, 35252, 0, -3549.77, -1723.89, 81.994, 2.75761, 0, 0, 0.981627, 0.190812, 30, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+100, 35252, 0, -3391.45, -1783.01, 25.2344, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+101, 35252, 0, -3537.32, -1830.63, 16.2407, 2.75761, 0, 0, 0.981627, 0.190812, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+102, 35252, 0, -3500.26, -1766.83, 16.417, 2.67035, 0, 0, 0.972369, 0.233448, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+103, 35252, 0, -3470.78, -1863.77, 24.0417, 5.49779, 0, 0, -0.382683, 0.92388, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+104, 35252, 0, -3432.51, -1790.23, 16.3942, 4.15388, 0, 0, -0.874619, 0.48481, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+105, 35252, 0, -3556.36, -1744.41, 78.9947, 6.21337, 0, 0, -0.0348988, 0.999391, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+106, 35252, 0, -3550.56, -1805.25, 27.3557, 5.93412, 0, 0, -0.173648, 0.984808, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+107, 35252, 0, -3498.22, -1844.42, 16.4291, 0, 0, 0, 0, 1, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+108, 35252, 0, -3494.47, -1883.25, 16.2407, 5.18363, 0, 0, -0.522498, 0.85264, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+109, 35252, 0, -3490.14, -1787.05, 17.0477, 1.0821, 0, 0, 0.515038, 0.857168, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+110, 35252, 0, -3457.06, -1770.1, 16.3745, 5.70723, 0, 0, -0.284015, 0.95882, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+111, 35252, 0, -3393.8, -1825.06, 24.913, 1.09956, 0, 0, 0.522498, 0.85264, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+112, 35252, 0, -3392.07, -1857.27, 25.8701, 0.331611, 0, 0, 0.165047, 0.986286, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@PTEMPLATE+2, 1, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@PTEMPLATE+3, 1, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@PTEMPLATE+4, 1, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@PTEMPLATE+5, 1, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@PTEMPLATE+6, 1, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@PTEMPLATE+7, 1, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@PTEMPLATE+8, 1, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@PTEMPLATE+9, 1, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@PTEMPLATE+10, 1, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@PTEMPLATE+11, 1, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@PTEMPLATE+12, 1, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@PTEMPLATE+13, 1, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@PTEMPLATE+14, 1, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@PTEMPLATE+15, 1, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@PTEMPLATE+16, 1, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@PTEMPLATE+17, 1, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@PTEMPLATE+18, 1, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@PTEMPLATE+19, 1, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@PTEMPLATE+20, 1, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@PTEMPLATE+21, 1, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@PTEMPLATE+22, 1, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@PTEMPLATE+23, 1, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@PTEMPLATE+24, 1, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@PTEMPLATE+25, 1, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@PTEMPLATE+26, 1, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@PTEMPLATE+27, 1, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@PTEMPLATE+28, 1, 'Wetlands - Ancient Relics / Loose Soil', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+2, @PTEMPLATE+2, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+3, @PTEMPLATE+3, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+4, @PTEMPLATE+4, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+5, @PTEMPLATE+5, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+6, @PTEMPLATE+6, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+7, @PTEMPLATE+7, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+8, @PTEMPLATE+8, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+9, @PTEMPLATE+9, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+10, @PTEMPLATE+10, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+11, @PTEMPLATE+11, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+12, @PTEMPLATE+12, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+13, @PTEMPLATE+13, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+14, @PTEMPLATE+14, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+15, @PTEMPLATE+15, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+16, @PTEMPLATE+16, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+17, @PTEMPLATE+17, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+18, @PTEMPLATE+18, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+19, @PTEMPLATE+19, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+20, @PTEMPLATE+20, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+21, @PTEMPLATE+21, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+22, @PTEMPLATE+22, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+23, @PTEMPLATE+23, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+24, @PTEMPLATE+24, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+25, @PTEMPLATE+25, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+26, @PTEMPLATE+26, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+27, @PTEMPLATE+27, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+28, @PTEMPLATE+28, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+29, @PTEMPLATE+1, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+30, @PTEMPLATE+2, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+31, @PTEMPLATE+3, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+32, @PTEMPLATE+4, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+33, @PTEMPLATE+5, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+34, @PTEMPLATE+6, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+35, @PTEMPLATE+7, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+36, @PTEMPLATE+8, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+37, @PTEMPLATE+9, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+38, @PTEMPLATE+10, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+39, @PTEMPLATE+11, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+40, @PTEMPLATE+12, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+41, @PTEMPLATE+13, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+42, @PTEMPLATE+14, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+43, @PTEMPLATE+15, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+44, @PTEMPLATE+16, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+45, @PTEMPLATE+17, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+46, @PTEMPLATE+18, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+47, @PTEMPLATE+19, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+48, @PTEMPLATE+20, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+49, @PTEMPLATE+21, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+50, @PTEMPLATE+22, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+51, @PTEMPLATE+23, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+52, @PTEMPLATE+24, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+53, @PTEMPLATE+25, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+54, @PTEMPLATE+26, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+55, @PTEMPLATE+27, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+56, @PTEMPLATE+28, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+57, @PTEMPLATE+1, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+58, @PTEMPLATE+2, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+59, @PTEMPLATE+3, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+60, @PTEMPLATE+4, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+61, @PTEMPLATE+5, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+62, @PTEMPLATE+6, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+63, @PTEMPLATE+7, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+64, @PTEMPLATE+8, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+65, @PTEMPLATE+9, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+66, @PTEMPLATE+10, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+67, @PTEMPLATE+11, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+68, @PTEMPLATE+12, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+69, @PTEMPLATE+13, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+70, @PTEMPLATE+14, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+71, @PTEMPLATE+15, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+72, @PTEMPLATE+16, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+73, @PTEMPLATE+17, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+74, @PTEMPLATE+18, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+75, @PTEMPLATE+19, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+76, @PTEMPLATE+20, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+77, @PTEMPLATE+21, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+78, @PTEMPLATE+22, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+79, @PTEMPLATE+23, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+80, @PTEMPLATE+24, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+81, @PTEMPLATE+25, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+82, @PTEMPLATE+26, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+83, @PTEMPLATE+27, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+84, @PTEMPLATE+28, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+85, @PTEMPLATE+1, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+86, @PTEMPLATE+2, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+87, @PTEMPLATE+3, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+88, @PTEMPLATE+4, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+89, @PTEMPLATE+5, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+90, @PTEMPLATE+6, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+91, @PTEMPLATE+7, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+92, @PTEMPLATE+8, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+93, @PTEMPLATE+9, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+94, @PTEMPLATE+10, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+95, @PTEMPLATE+11, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+96, @PTEMPLATE+12, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+97, @PTEMPLATE+13, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+98, @PTEMPLATE+14, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+99, @PTEMPLATE+15, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+100, @PTEMPLATE+16, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+101, @PTEMPLATE+17, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+102, @PTEMPLATE+18, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+103, @PTEMPLATE+19, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+104, @PTEMPLATE+20, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+105, @PTEMPLATE+21, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+106, @PTEMPLATE+22, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+107, @PTEMPLATE+23, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+108, @PTEMPLATE+24, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+109, @PTEMPLATE+25, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+110, @PTEMPLATE+26, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+111, @PTEMPLATE+27, 'Wetlands - Ancient Relics / Loose Soil', 10),
(@OGUID+112, @PTEMPLATE+28, 'Wetlands - Ancient Relics / Loose Soil', 10);

UPDATE `gameobject` SET `spawntimesecsmin` = 30, `spawntimesecsmax` = 60 WHERE `id` IN (331, 333, 334, 35252);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
