DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20241117085946');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20241117085946');
-- Add your query below.


-- Negolash
-- Old: Monster
-- New: Giant
UPDATE `creature_template` SET `faction`=778 WHERE `entry`=1494 && `faction`=14;

-- Darkmist Widow
-- Old: Beast - Spider
-- New: Beast - Spider
UPDATE `creature_template` SET `faction`=312 WHERE `entry`=4380 && `faction`=22;

-- Shade of Hakkar
-- Old: Monster
-- New: Friendly
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=8440 && `faction`=16;

-- Second Mate Shandril
-- Old: Beast - Wolf
-- New: Friendly
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=8478 && `faction`=32;

-- Magus Rimtori
-- Old: Monster
-- New: Naga
UPDATE `creature_template` SET `faction`=74 WHERE `entry`=8578 && `faction`=14;

-- Grum Redbeard
-- Old: Ironforge
-- New: Ironforge
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=11808 && `faction`=57;

-- Hive'Zora Egg
-- Old: Monster
-- New: Scorpid
UPDATE `creature_template` SET `faction`=413 WHERE `entry`=12276 && `faction`=14;

-- Accursed Slitherblade
-- Old: Monster
-- New: Naga
UPDATE `creature_template` SET `faction`=74 WHERE `entry`=14229 && `faction`=14;

-- Marzon the Silent Blade
-- Old: Alliance Generic
-- New: Stormwind
UPDATE `creature_template` SET `faction`=12 WHERE `entry`=1755 && `faction`=84;

-- Ransin Donner
-- Old: Ironforge
-- New: Ironforge
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=2943 && `faction`=57;

-- Deathstalker Erland
-- Old: Undercity
-- New: Undercity
UPDATE `creature_template` SET `faction`=98 WHERE `entry`=1978 && `faction`=71;

-- Gazban
-- Old: Creature
-- New: Monster
UPDATE `creature_template` SET `faction`=14 WHERE `entry`=2624 && `faction`=7;

-- Prospector Remtravel
-- Old: Ironforge
-- New: Ironforge
UPDATE `creature_template` SET `faction`=55 WHERE `entry`=2917 && `faction`=57;

-- Therylune
-- Old: Darnassus
-- New: Darnassus
UPDATE `creature_template` SET `faction`=124 WHERE `entry`=3584 && `faction`=80;

-- Shay Leafrunner
-- Old: Darnassus
-- New: Darnassus
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=7774 && `faction`=79;

-- Kerlonian Evershade
-- Old: Darnassus
-- New: Darnassus
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=11218 && `faction`=79;

-- Magrami Spectre
-- Old: Monster
-- New: Creature
UPDATE `creature_template` SET `faction`=7 WHERE `entry`=11560 && `faction`=634;

-- Onyxia's Elite Guard
-- Old: Monster
-- New: Orc, Blackrock
UPDATE `creature_template` SET `faction`=40 WHERE `entry`=12739 && `faction`=14;

-- Eranikus, Tyrant of the Dream
-- Old: Monster
-- New: Monster
UPDATE `creature_template` SET `faction`=16 WHERE `entry`=15491 && `faction`=14;

-- Cenarion Hold Reservist
-- Old: Friendly
-- New: Cenarion Circle
UPDATE `creature_template` SET `faction`=1254 WHERE `entry`=16139 && `faction`=35;

-- Arei
-- Old: Darnassus
-- New: Darnassus
UPDATE `creature_template` SET `faction`=124 WHERE `entry`=9598 && `faction`=79;

-- William Kielar
UPDATE `creature_template` SET `auras`='' WHERE `entry`=17209;

-- The Binding (Undercity)
DELETE FROM `event_scripts` WHERE `id`=1786;
INSERT INTO `event_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1786, 0, 0, 10, 5677, 60000, 0, 0, 0, 0, 0, 4, 0, 5677, -1, 1, 1704.67, 41.2161, -63.7599, 0.950282, 0, 'The Binding (Undercity): Summon Creature Summoned Succubus');

-- The Binding (Orgrimmar)
DELETE FROM `event_scripts` WHERE `id`=1788;
INSERT INTO `event_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1788, 0, 0, 10, 5677, 60000, 0, 0, 0, 0, 0, 4, 0, 5677, -1, 1, 1805.72, -4373.8, -17.4111, 4.34597, 0, 'The Binding (Orgrimmar): Summon Creature Summoned Succubus');

-- The Binding (Stormwind)
DELETE FROM `event_scripts` WHERE `id`=1134;
INSERT INTO `event_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1134, 0, 0, 10, 5677, 60000, 0, 0, 0, 0, 0, 4, 0, 5677, -1, 1, -8972.79, 1043.28, 52.9456, 4.07911, 0, 'The Binding (Stormwind): Summon Creature Summoned Succubus');

-- Summon script for Summoned Succubus.
DELETE FROM `generic_scripts` WHERE `id`=5677;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(5677, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1991, 0, 0, 0, 0, 0, 0, 0, 0, 'The Binding: Summoned Succubus - Say Text'),
(5677, 4, 0, 22, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Binding: Summoned Succubus - Set Faction to Monster'),
(5677, 4, 1, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Binding: Summoned Succubus - Attack Start');
UPDATE `creature_template` SET `faction`=35, `spawn_spell_id`=7741, `movement_type`=0 WHERE `entry`=5677;

-- Thunderaan the Windseeker
DELETE FROM `quest_end_scripts` WHERE `id`=7786;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(7786, 0, 0, 10, 14435, 1800000, 0, 0, 0, 0, 0, 0, 0, 14435, -1, 1, -6242.95, 1715.08, 4.33599, 0.593412, 0, 'Thunderaan the Windseeker: Summon Creature Prince Thunderaan');
-- Summon script for Prince Thunderaan.
DELETE FROM `generic_scripts` WHERE `id`=14435;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(14435, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9570, 0, 0, 0, 0, 0, 0, 0, 0, 'Thunderaan the Windseeker: Prince Thunderaan - Say Text'),
(14435, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9571, 0, 0, 0, 0, 0, 0, 0, 0, 'Thunderaan the Windseeker: Prince Thunderaan - Say Text'),
(14435, 9, 1, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Thunderaan the Windseeker: Prince Thunderaan - Set Facing'),
(14435, 12, 0, 22, 834, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Thunderaan the Windseeker: Prince Thunderaan - Set Faction to Elemental'),
(14435, 12, 1, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Thunderaan the Windseeker: Prince Thunderaan - Start Attack'),
(14435, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9572, 0, 0, 0, 0, 0, 0, 0, 0, 'Thunderaan the Windseeker: Prince Thunderaan - Say Text');
UPDATE `broadcast_text` SET `emote_id1`=1 WHERE `entry` IN (9570, 9571);

-- Events list for Prince Thunderaan
DELETE FROM `creature_ai_events` WHERE `creature_id`=14435;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(1443501, 14435, 0, 36, 0, 100, 1, 23009, -1, 0, 0, 1443501, 0, 0, 'Prince Thunderan - Reset Threat on Tendrils of Air Hitting Target');
DELETE FROM `creature_ai_scripts` WHERE `id`=1443501;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1443501, 0, 0, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0, 0, 0, 'Prince Thunderan - Reset Threat');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (144350, 'Silithus - Prince Thunderaan', 23009, 100, 1, 0, 0, 0, 12, 12, 12, 20, 0, 23011, 100, 1, 0, 0, 0, 17, 17, 8, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `faction`=35, `spell_list_id`=144350, `ai_name`='EventAI', `script_name`='' WHERE `entry`=14435;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
