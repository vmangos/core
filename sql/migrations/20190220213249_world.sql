DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190220213249');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190220213249');
-- Add your query below.


-- Kirtonos combat spells.
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (105060, 'Scholomance - Kirtonos the Herald', 18144, 100, 0, 0, 0, 0, 8, 8, 15, 15, 0, 12882, 100, 0, 0, 0, 0, 15, 15, 13, 13, 0, 6016, 100, 1, 0, 0, 0, 18, 18, 12, 12, 0, 8379, 100, 1, 0, 0, 0, 22, 22, 11, 11, 0, 17228, 100, 1, 0, 0, 0, 42, 42, 42, 42, 0, 12889, 100, 1, 0, 0, 0, 53, 53, 35, 35, 0, 14515, 100, 1, 0, 0, 0, 34, 48, 44, 48, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `scale`=1.35, `spell_list_id`=105060 WHERE `entry`=10579;
UPDATE `creature_template` SET `spell_list_id`=105060 WHERE `entry`=10506;

-- Kirtonos Intro Waypoints
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES 
(10506, 1, 316.709, 71.2683, 104.584, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10506, 2, 321.16, 72.8097, 104.668, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10506, 3, 332.371, 77.9899, 105.862, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10506, 4, 333.325, 86.6016, 106.64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10506, 5, 334.126, 101.684, 106.834, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10506, 6, 331.046, 114.593, 106.362, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10506, 7, 329.544, 126.702, 106.14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10506, 8, 335.247, 136.546, 105.723, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10506, 9, 343.21, 139.946, 107.64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10506, 10, 364.329, 140.901, 109.945, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10506, 11, 362.676, 115.638, 110.307, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10506, 12, 341.79, 91.9439, 105.168, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10506, 13, 313.495, 93.4594, 104.057, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10506, 14, 306.384, 93.6168, 104.057, 1500, 0, 0, 0, 0, 0, 0, 0, 0, 3.1, 0, 0),
(10506, 15, 299.488, 92.7614, 105.633, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 3.1, 0, 0),
(10506, 16, 299.488, 92.7614, 105.633, 3000, 0, 0, 0, 0, 0, 0, 0, 0, 0.0174533, 0, 0),
(10506, 17, 299.488, 92.7614, 105.633, 1000, 1050617, 0, 0, 0, 0, 0, 0, 0, 0.0174533, 0, 0),
(10506, 18, 299.488, 92.7614, 105.633, 5000, 1050618, 0, 0, 0, 0, 0, 0, 0, 0.0174533, 0, 0),
(10506, 19, 314.867, 90.3021, 101.646, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Intro Waypoint Scripts
DELETE FROM `creature_movement_scripts` WHERE `id`=1050617;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1050617, 0, 77, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kirtonos the Herald - Disable Flying');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1050617, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kirtonos the Herald - Set Walk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1050617, 0, 15, 16467, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kirtonos the Herald - Cast Spell Kirtonos Transform');
DELETE FROM `creature_movement_scripts` WHERE `id`=1050618;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1050618, 0, 1, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kirtonos the Herald - Emote Roar');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1050618, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0, 11365, 0, 0, 0, 0, 0, 0, 0, 0, 'Kirtonos the Herald - Set Equipment');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1050618, 0, 4, 46, 33554434, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kirtonos the Herald - Remove Unattackable Flag');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1050618, 0, 59, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kirtonos the Herald - Set React State to Aggressive');

-- Removing unused script actions.
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1050605, 1050606, 1050607, 1050608, 1050609, 1050610, 1050611, 1050612, 1050613);

-- Events list for Kirtonos the Herald
DELETE FROM `creature_ai_events` WHERE `creature_id`=10506;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1050601, 10506, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1050601, 0, 0, 'Kirtonos the Herald - Start Intro on Spawn');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1050602, 10506, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1050602, 0, 0, 'Kirtonos the Herald - Set Data on Evade');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1050603, 10506, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1050603, 0, 0, 'Kirtonos the Herald - Combat Pulse on Aggro');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1050604, 10506, 0, 0, 0, 100, 1, 16000, 18000, 22000, 22000, 1050604, 0, 0, 'Kirtonos the Herald - Transform in Combat');

DELETE FROM `creature_ai_scripts` WHERE `id`=1050601;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1050601, 0, 4, 46, 33554434, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kirtonos the Herald - Add Unattackable Flag');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1050601, 0, 59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kirtonos the Herald - Set React State to Passive');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1050601, 0, 77, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kirtonos the Herald - Enable Flying');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1050601, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kirtonos the Herald - Set Run');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1050601, 0, 60, 3, 0, 500, 0, 0, 0, 0, 0, 0, 10506, 0, 0, 0, 0, 0, 0, 0, 'Kirtonos the Herald - Start Waypoints');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1050601, 0, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 314.867, 90.3021, 101.646, 0, 0, 'Kirtonos the Herald - Set Home Position');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1050601, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5788, 0, 0, 0, 0, 0, 0, 0, 0, 'Kirtonos the Herald - Say Emoted Text');

DELETE FROM `creature_ai_scripts` WHERE `id`=1050602;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1050602, 0, 37, 7, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kirtonos the Herald - Set Data to Fail');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1050602, 0, 18, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kirtonos the Herald - Unsummon');

DELETE FROM `creature_ai_scripts` WHERE `id`=1050603;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1050603, 0, 49, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kirtonos the Herald - Combat Pulse');

INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1970, 1, 16467, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1971, 1, 16467, 0, 0, 0, 1);
DELETE FROM `creature_ai_scripts` WHERE `id`=1050604;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1050604, 0, 39, 1050604, 0, 0, 0, 0, 0, 0, 4, 100, 0, 0, 0, 0, 0, 0, 0, 1971, 'Kirtonos the Herald - Transform if not transformed');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1050604, 0, 39, 1050605, 0, 0, 0, 0, 0, 0, 4, 100, 0, 0, 0, 0, 0, 0, 0, 1970, 'Kirtonos the Herald - Remove transform if transformed');

DELETE FROM `event_scripts` WHERE `id`=1050604;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1050604, 0, 15, 16467, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kirtonos the Herald - Cast Kirtonos Transform');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1050604, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0, 11365, 0, 0, 0, 0, 0, 0, 0, 0, 'Kirtonos the Herald - Set Equipment');
DELETE FROM `event_scripts` WHERE `id`=1050605;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1050605, 0, 14, 16467, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kirtonos the Herald - Remove Aura Kirtonos Transform');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1050605, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kirtonos the Herald - Remove Equipment');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
