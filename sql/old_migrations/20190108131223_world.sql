DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190108131223');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190108131223');
-- Add your query below.


-- Assign script to quest.
UPDATE `quest_template` SET `StartScript`=2767 WHERE `entry`=2767;

-- Waypoints
DELETE FROM `script_waypoint` WHERE `entry`=7807;
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES 
(7807, 1, -4943.74, 1715.74, 62.74, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7807, 2, -4944.93, 1706.66, 63.16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7807, 3, -4942.82, 1690.22, 64.25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7807, 4, -4946.47, 1669.62, 63.84, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7807, 5, -4955.93, 1651.88, 63, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7807, 6, -4967.58, 1643.86, 64.31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7807, 7, -4978.12, 1607.9, 64.3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7807, 8, -4975.38, 1596.16, 64.7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7807, 9, -4972.82, 1581.89, 61.75, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7807, 10, -4958.65, 1581.05, 61.81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7807, 11, -4936.72, 1594.89, 65.96, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7807, 12, -4885.69, 1598.1, 67.45, 4000, 780712, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(7807, 13, -4874.2, 1601.73, 68.54, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7807, 14, -4816.64, 1594.47, 78.2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7807, 15, -4802.2, 1571.92, 87.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7807, 16, -4746.4, 1576.11, 84.59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7807, 17, -4739.72, 1707.16, 94.04, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7807, 18, -4674.03, 1840.44, 89.17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7807, 19, -4667.94, 1864.11, 85.18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7807, 20, -4668.08, 1886.39, 81.14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7807, 21, -4679.43, 1932.32, 73.76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7807, 22, -4674.17, 1946.66, 70.83, 5000, 780722, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(7807, 23, -4643.94, 1967.45, 65.27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7807, 24, -4595.6, 2010.75, 52.1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7807, 25, -4562.65, 2029.28, 45.41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7807, 26, -4538.56, 2032.65, 45.28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7807, 27, -4531.96, 2034.15, 48.34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7807, 28, -4507.75, 2039.32, 51.57, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7807, 29, -4482.74, 2045.67, 48.15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7807, 30, -4460.87, 2051.54, 45.55, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7807, 31, -4449.97, 2060.03, 45.51, 10000, 780731, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(7807, 32, -4448.99, 2079.05, 44.64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7807, 33, -4436.64, 2134.48, 28.83, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7807, 34, -4429.25, 2170.2, 15.44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7807, 35, -4424.83, 2186.11, 11.48, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7807, 36, -4416.71, 2209.76, 7.36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7807, 37, -4405.25, 2231.77, 5.94, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7807, 38, -4377.61, 2265.45, 6.71, 15000, 780738, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0);

-- Waypoint Scripts
DELETE FROM `creature_movement_scripts` WHERE `id`=780712;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (780712, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3822, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-22/FE!: Homing Robot OOX-22/FE - Say Text');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (780712, 1, 10, 7848, 30000, 0, 0, 0, 0, 0, 0, 0, 276703, 6, 1, -4841.01, 1593.91, 73.42, 3.98, 0, 'Rescue OOX-22/FE!: Summon Lurking Feral Scar 1');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (780712, 1, 10, 7848, 30000, 0, 0, 0, 0, 0, 0, 0, 276703, 6, 1, -4837.61, 1568.58, 78.21, 3.13, 0, 'Rescue OOX-22/FE!: Summon Lurking Feral Scar 2');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (780712, 1, 10, 7848, 30000, 0, 0, 0, 0, 0, 0, 0, 276703, 6, 1, -4841.89, 1569.95, 76.53, 0.68, 0, 'Rescue OOX-22/FE!: Summon Lurking Feral Scar 3');
DELETE FROM `creature_movement_scripts` WHERE `id`=780722;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (780722, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3822, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-22/FE!: Homing Robot OOX-22/FE - Say Text');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (780722, 2, 10, 5260, 30000, 0, 0, 0, 0, 0, 0, 0, 276703, 6, 1, -4595.81, 2005.99, 53.08, 3.74, 0, 'Rescue OOX-22/FE!: Summon Groddoc Ape 1');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (780722, 2, 10, 5260, 30000, 0, 0, 0, 0, 0, 0, 0, 276703, 6, 1, -4597.53, 2008.31, 52.70, 3.78, 0, 'Rescue OOX-22/FE!: Summon Groddoc Ape 2');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (780722, 2, 10, 5260, 30000, 0, 0, 0, 0, 0, 0, 0, 276703, 6, 1, -4599.37, 2010.59, 52.77, 3.84, 0, 'Rescue OOX-22/FE!: Summon Groddoc Ape 3');
DELETE FROM `creature_movement_scripts` WHERE `id`=780731;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (780731, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3822, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-22/FE!: Homing Robot OOX-22/FE - Say Text');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (780731, 3, 10, 5255, 30000, 0, 0, 0, 0, 0, 0, 0, 276703, 6, 1, -4425.14, 2075.87, 47.77, 3.77, 0, 'Rescue OOX-22/FE!: Summon Woodpaw Reaver');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (780731, 3, 10, 5253, 30000, 0, 0, 0, 0, 0, 0, 0, 276703, 6, 1, -4426.68, 2077.98, 47.57, 3.77, 0, 'Rescue OOX-22/FE!: Summon Woodpaw Brute');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (780731, 3, 10, 5254, 30000, 0, 0, 0, 0, 0, 0, 0, 276703, 6, 1, -4428.33, 2080.24, 47.43, 3.87, 0, 'Rescue OOX-22/FE!: Summon Woodpaw Mystic');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (780731, 3, 10, 5258, 30000, 0, 0, 0, 0, 0, 0, 0, 276703, 6, 1, -4430.04, 2075.54, 46.83, 3.81, 0, 'Rescue OOX-22/FE!: Summon Woodpaw Alpha');
DELETE FROM `creature_movement_scripts` WHERE `id`=780738;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (780738, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-22/FE!: Homing Robot OOX-22/FE - Move Idle');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (780738, 0, 62, 2767, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-22/FE!: End Scripted Map Event');
DELETE FROM `event_scripts` WHERE `id`=276703;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (276703, 0, 26, 0, 0, 0, 0, 2767, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-22/FE!: Lurking Feral Scar - Attack Homing Robot OOX-22/FE');

-- Events list for Homing Robot OOX-22/FE
DELETE FROM `creature_ai_events` WHERE `creature_id`=7807;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (780701, 7807, 0, 4, 0, 20, 0, 0, 0, 0, 0, 780701, 0, 0, 'Homing Robot OOX-22/FE - Say Text on Aggro');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (780702, 7807, 0, 21, 0, 100, 0, 0, 0, 0, 0, 780702, 0, 0, 'Homing Robot OOX-22/FE - Stand Up on Reached Home');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (780703, 7807, 0, 1, 1, 100, 1, 3000, 3000, 3000, 3000, 780703, 0, 0, 'Homing Robot OOX-22/FE - Assist Escorting Player (Phase 1)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (780704, 7807, 0, 0, 1, 100, 1, 3000, 3000, 3000, 3000, 780703, 0, 0, 'Homing Robot OOX-22/FE - Assist Escorting Player (Phase 1)');
DELETE FROM `creature_ai_scripts` WHERE `id`=780701;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (780701, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3795, 3796, 0, 0, 0, 0, 0, 0, 0, 'Homing Robot OOX-22/FE - Say Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=780702;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (780702, 0, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Homing Robot OOX-22/FE - Stand Up');
DELETE FROM `creature_ai_scripts` WHERE `id`=780703;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (780703, 0, 72, 0, 0, 0, 0, 2767, 0, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Homing Robot OOX-22/FE - Assist Player');

-- Script when the quest is accepted.
DELETE FROM `quest_start_scripts` WHERE `id`=2767;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2767, 0, 61, 2767, 1800, 0, 0, 0, 0, 0, 8, 0, 276702, 1014, 276701, 0, 0, 0, 0, 0, 'Rescue OOX-22/FE!: Start Scripted Map Event');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2767, 1, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-22/FE!: Homing Robot OOX-22/FE - Stand Up');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2767, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3819, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-22/FE!: Homing Robot OOX-22/FE - Say Text');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2767, 1, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-22/FE!: Homing Robot OOX-22/FE - Remove Quest Giver Flag');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2767, 3, 22, 113, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-22/FE!: Homing Robot OOX-22/FE - Set Faction');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2767, 3, 60, 3, 0, 0, 1, 0, 0, 0, 0, 0, 7807, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-22/FE!: Homing Robot OOX-22/FE - Start Waypoints');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2767, 3, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-22/FE!: Homing Robot OOX-22/FE - Set Phase to 1');

-- Script when the quest fails.
DELETE FROM `event_scripts` WHERE `id`=276701;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (276701, 0, 70, 2767, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-22/FE!: Fail Quest');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (276701, 0, 34, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-22/FE!: Homing Robot OOX-22/FE - Reset Home Position');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (276701, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-22/FE!: Homing Robot OOX-22/FE - Set Phase to 0');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (276701, 3, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-22/FE!: Homing Robot OOX-22/FE - Despawn');

-- Script when the quest is completed.
DELETE FROM `event_scripts` WHERE `id`=276702;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (276702, 0, 7, 2767, 80, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-22/FE!: Complete Quest');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (276702, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3823, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-22/FE!: Homing Robot OOX-22/FE - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (276702, 0, 34, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-22/FE!: Homing Robot OOX-22/FE - Reset Home Position');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (276702, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-22/FE!: Homing Robot OOX-22/FE - Set Phase to 0');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (276702, 3, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-22/FE!: Homing Robot OOX-22/FE - Despawn');

-- Assign script to Homing Robot OOX-22/FE.
UPDATE `creature_template` SET `AIName`='EventAI', `ScriptName`='' WHERE `entry`=7807;

-- Make Homing Robot OOX-22/FE an Active Object so that it can respawn correctly.
UPDATE `creature` SET `spawnFlags`=1 WHERE `id`=7807;

-- Remove no longer needed texts.
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1000292 AND -1000287;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
