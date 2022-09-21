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

-- Update Objects Used For Quest 2933
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(443, 142708, 0, -15.0868, -2789.53, 123.974, 0.916285, 0.705321, 0.172728, -0.672002, 0.145263, 7200, 7200, 100, 1, 0, 0, 0, 10),
(444, 142710, 0, -14.1372, -2789.71, 123.862, 3.14159, 0, 0, -1, 0, 7200, 7200, 100, 1, 0, 0, 0, 10),
(445, 142711, 0, -15.0243, -2789.39, 123.862, 3.14159, 0, 0, -1, 0, 7200, 7200, 100, 1, 0, 0, 0, 10);

UPDATE `gameobject` SET `spawntimesecsmin` = 1800, `spawntimesecsmax` = 3600 WHERE `id` IN (142702, 142703, 142704, 142705, 142706, 142707, 142708, 142710, 142711, 142712, 142713, 142714);

INSERT INTO `gameobject_questrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES
(142703, 2933, 0, 10),
(142704, 2933, 0, 10),
(142705, 2933, 0, 10),
(142706, 2933, 0, 10),
(142707, 2933, 0, 10),
(142708, 2933, 0, 10),
(142710, 2933, 0, 10),
(142711, 2933, 0, 10),
(142712, 2933, 0, 10),
(142713, 2933, 0, 10),
(142714, 2933, 0, 10);

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Add Missing Greetings
INSERT INTO `quest_greeting` (`entry`, `type`, `emote_id`, `emote_delay`, `content_default`) VALUES
(661, 0, 0, 0, 'Greetings. What business have you with the Carevin family? Do you seek to assist the Carevins in their battle against the undead?'),
(1377, 0, 0, 0, 'Driving a Steam Tank isn\'t for everyone.  It takes an iron grip and nerves of steel...lucky I have both!  How about you?  How\'s your mettle?  Want to prove it to me?'),
(1738, 1, 0, 0, 'This collection of scrolls contains various logistic and strategic information, as well as coded correspondences.'),
(2487, 0, 0, 0, 'Ah, smell the fine salt air!  \'Tis always nice to return to our home port of Booty Bay.'),
(3050, 0, 0, 0, 'The tauren are sons and daughters of the Earthmother, and we show respect to all her children.  Even the beasts we slay are cherished, as their bodies give nourishment and their skins provide warmth.'),
(4047, 0, 0, 0, 'The spirits of nature are powers to respect.  They offer great aid to the worthy, and mete out swift death to the foolish.'),
(5393, 0, 1, 0, 'Nethergarde keep always needs more supplies - supplies to help our mages in their research, and supplies to keep our defenders in top fighting shape.'),
(5637, 0, 2, 0, 'Pleased to meetcha, $c. Me name\'s Roetten. I lead Reclaimers Incorporated.$B$BMe guild and I specialize in aquiring lost goods. We usually hire brave adventurers and send them off to finish tasks for those who aren\'t able, or don\'t have the time.'),
(6868, 0, 6, 0, 'Whatcha need, $c?  I trust that you\'ve come out to this wasteland for a reason other than idle chit chat.'),
(7740, 0, 0, 0, ''),
(7825, 0, 0, 0, ''),
(7884, 0, 0, 0, ''),
(8256, 0, 1, 0, 'Greetings, $N.'),
(8379, 0, 0, 0, 'If you are here to beg for the privilege of working for me, then your company is quite welcome. Otherwise, there is little chance you are of any use to me.'),
(8582, 0, 0, 0, ''),
(10306, 0, 0, 0, ''),
(10428, 0, 1, 0, 'Whitereach Post started off as a small hunting camp... Now, everyone wants to set up shop and call this home.$B$B<Motega shrugs his shoulder>'),
(11857, 0, 0, 0, ''),
(11862, 0, 0, 0, ''),
(11864, 0, 0, 0, ''),
(12126, 0, 0, 0, ''),
(138492, 1, 0, 0, 'These shards glint with an unnatural sheen.  It is clear that they hide a deep power within.'),
(150075, 1, 0, 0, ''),
(179827, 1, 0, 0, '');

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- CMANGOS DATA (NEED TO SEE WHAT DATA IS RELEVANT)

DELETE FROM `questgiver_greeting` WHERE `Entry` in (1217, 1284, 1377, 3936, 4048, 4080, 5393, 5637, 5694, 5892, 5906, 6019, 7877, 11036, 15297, 16281, 16494, 27337);
DELETE FROM `questgiver_greeting` WHERE `Entry` in (1740,1938,1952,2055,2229,2277,2500,2934,3050,3428,4454,4630,5598,5636,5675,5878,6868,7802,10428,11259,11596,14567,19936);

-- Glorin Steelbrow
INSERT INTO `questgiver_greeting` VALUES (1217, 0, 'Harumph!  As if I don''t have enough to do out here in the muck, without all these distractions!', 0, 0);

-- Archbishop Benedictus
INSERT INTO `questgiver_greeting` VALUES (1284, 0, 'My blessings go to you, $c, and I pray they may guide and protect you during these times of trouble.  Be vigilant, but remain hopeful for peace, for hope is our greatest weapon against the darkness.', 0, 0);

-- Pilot Stonegear
INSERT INTO `questgiver_greeting` VALUES (1377, 0, 'Driving a Steam Tank isn''t for everyone.  It takes an iron grip and nerves of steel...lucky I have both!  How about you?  How''s your mettle?  Want to prove it to me?', 0, 0);

-- Shandris Feathermoon
INSERT INTO `questgiver_greeting` VALUES (3936, 0, 'In the name of Elune, the Sentinels keep vigilant watch over all our lands, from the cobbled streets of Darnassus to the edge of Ashenvale Forest.', 2, 0);

-- Falfindel Waywarder
INSERT INTO `questgiver_greeting` VALUES (4048, 0, 'You look as though you have traveled from afar, $r.', 2, 0);

-- Kaela Shadowspear
INSERT INTO `questgiver_greeting` VALUES (4080, 0, 'Gaxim is so focused on trying to convince the night elves that his methods are superior that I had no choice but to focus his energies on something--so I unleashed him on the Venture Co.$B$BI remain focused on helping the Charred Vale to the northwest.', 0, 0);

-- Quartermaster Lungertz
INSERT INTO `questgiver_greeting` VALUES (5393, 0, 'Nethergarde keep always needs more supplies - supplies to help our mages in their research, and supplies to keep our defenders in top fighting shape.', 1, 0);

-- Roetten Stonehammer
INSERT INTO `questgiver_greeting` VALUES (5637, 0, 'Pleased to meetcha, $c. Me name''s Roetten. I lead Reclaimers Incorporated.$B$BMe guild and I specialize in aquiring lost goods. We usually hire brave adventurers and send them off to finish tasks for those who aren''t able, or don''t have the time.', 2, 0);

-- High Sorcerer Andromath
INSERT INTO `questgiver_greeting` VALUES (5694, 0, ' ', 0, 0);

-- Searn Firewarder
INSERT INTO `questgiver_greeting` VALUES (5892, 0, ' ', 0, 0);

-- Xanis Flameweaver
INSERT INTO `questgiver_greeting` VALUES (5906, 0, 'Hello, shaman. It is good to see one of my $gbrothers:sisters; here. May I aid you somehow?', 1, 0);

-- Hornizz Brimbuzzle
INSERT INTO `questgiver_greeting` VALUES (6019, 0, ' ', 0, 0);

-- Latronicus Moonspear
INSERT INTO `questgiver_greeting` VALUES (7877, 0, ' ', 0, 0);

-- Rok Orhan
UPDATE `questgiver_greeting` SET `Text` = 'The Gordunni Ogres encroach upon our lands.  We send as many as are willing to face them in the desecrated ruins of Feralas. ' WHERE `Entry` = 7777 AND `Type` = 0;

-- Syndicate Documents
INSERT INTO `questgiver_greeting` VALUES (1740, 1, 'This collection of scrolls contains various logistic and strategic information, as well as coded correspondences.', 0, 0);

-- Dalar Dawnweaver
INSERT INTO `questgiver_greeting` VALUES (1938, 0, 'The Kirin Tor did not heed my warnings!  The Alliance is a sham.  Arugal is a wreckless fool.', 0, 0);

-- High Executor Hadrec
INSERT INTO `questgiver_greeting` VALUES (1952, 0, 'Hello, $c.  If you''re here, then you must know that Silverpine is saturated with our enemies.  To survive, the Forsaken must drive them back!', 0, 0);

-- Master Apothecary Faranell
INSERT INTO `questgiver_greeting` VALUES (2055, 0, 'The Royal Apothecary Society shall heed The Dark Lady''s call to uncover the New Plague and drive Arthas and his heathen Scourge Army from the world once and for all.', 0, 0);

-- Krusk
INSERT INTO `questgiver_greeting` VALUES (2229, 0, 'To think, the place the Warchief was born and raised lies so close.', 0, 0);

-- Loremaster Dibbs
INSERT INTO `questgiver_greeting` VALUES (2277, 0, 'I have a great deal of work to do.  Are you here to aid me with my research?', 0, 0);

-- Captain Hecklebury Smotts
INSERT INTO `questgiver_greeting` VALUES (2500, 0, 'They''re out there!  I can hear them at night, laughing.  Oh, they''ll pay!  They...will...pay!!', 0, 0);

-- Keeper Bel'dugur
INSERT INTO `questgiver_greeting` VALUES (2934, 0, 'Knowledge is both tool and weapon to those with the will to use it.', 0, 0);

-- Veren Tallstrider
INSERT INTO `questgiver_greeting` VALUES (3050, 0, 'The tauren are sons and daughters of the Earthmother, and we show respect to all her children.  Even the beasts we slay are cherished, as their bodies give nourishment and their skins provide warmth.', 0, 0);

-- Korran
INSERT INTO `questgiver_greeting` VALUES (3428, 0, 'The dust of the Barrens parches my throat more and more every day, $N. But it is worth the sacrifice to remain here if it helps the Horde and the warchief.', 0, 0);

-- Fizzle Brassbolts
INSERT INTO `questgiver_greeting` VALUES (4454, 0, 'Aha!  Did you see that!  I think this new auto-spanner is going to do just the trick for my new influx manifold design.', 0, 0);

-- Pozzik
INSERT INTO `questgiver_greeting` VALUES (4630, 0, 'What a great day for racing! Oh, who am I kidding? Every day''s a great day for racing!', 0, 0);

-- Atal'ai Exile
INSERT INTO `questgiver_greeting` VALUES (5598, 0, 'What do you ask of me?', 0, 0);

-- Gryphon Master Talonaxe
INSERT INTO `questgiver_greeting` VALUES (5636, 0, 'What do you want? I''d be a whole lot happier up in the skies than grounded and yapping with a $r right now.$b$bGuess we can''t all get what we want.', 0, 0);

-- Carendin Halgar
INSERT INTO `questgiver_greeting` VALUES (5675, 0, 'The summoning of beings from the chaos that lies beyond our world is essential to the mastery of the warlock arts, $N. I am glad to see the progress you have made.', 0, 0);

-- Thun'grim Firegaze
INSERT INTO `questgiver_greeting` VALUES (5878, 0, 'My vision has darkened, but there are many kinds of sight...', 0, 0);

-- Jarkal Mossmeld
INSERT INTO `questgiver_greeting` VALUES (6868, 0, 'Whatcha need, $c?  I trust that you''ve come out to this wasteland for a reason other than idle chit chat.', 0, 0);

-- Galvan the Ancient
INSERT INTO `questgiver_greeting` VALUES (7802, 0, 'So few make it this far, even fewer make it past. Do not become a statistic, $N.', 0, 0);

-- Motega Firemane
INSERT INTO `questgiver_greeting` VALUES (10428, 0, 'Whitereach Post started off as a small hunting camp... Now, everyone wants to set up shop and call this home.$b$b<Motega shrugs his shoulder>', 0, 0);

-- Nataka Longhorn
INSERT INTO `questgiver_greeting` VALUES (11259, 0, 'Desolace is not such a bad place, if you don''t mind the constant harassments from the centaurs.', 0, 0);

-- Smeed Scrabblescrew
INSERT INTO `questgiver_greeting` VALUES (11596, 0, 'My business plan never accounted for housing giant kodos... maybe I should have gone into the underwater basket weaving business instead.', 0, 0);

-- Derotain Mudsipper
INSERT INTO `questgiver_greeting` VALUES (14567, 0, 'These Mithril Order guys are sissies.', 0, 0);

-- Arazmodu
INSERT INTO `questgiver_greeting` VALUES (19936, 0, ' ', 0, 0);

UPDATE `questgiver_greeting` SET `Text` = ' ' WHERE `Text` = '';


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
