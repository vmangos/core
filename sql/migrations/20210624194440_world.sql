DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210624194440');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210624194440');
-- Add your query below.


-- Fix Creatures
UPDATE `creature` SET `position_z` = 79.5248, `movement_type` = 1, `wander_distance` = 10 WHERE `guid` = 15226;
UPDATE `creature` SET `position_x` = -4268.95, `position_y` = 36.598, `position_z` = 55.1443, `movement_type` = 1, `wander_distance` = 10 WHERE `guid` = 50875;
UPDATE `creature` SET `position_x` = -6695.45, `position_y` = -3014.05, `position_z` = 261.037, `movement_type` = 1, `wander_distance` = 4 WHERE `guid` = 6910;
UPDATE `creature` SET `position_x` = -269.935, `position_y` = -1409.396, `position_z` = 91.607, `orientation` = 1.929 WHERE `guid`= 14851;
DELETE FROM `creature` WHERE `guid` IN  (92880, 51693, 51699, 51704, 3901);
UPDATE `creature` SET `position_x` = -1813.75, `position_y` = 2889.85, `position_z` = 50.971, `movement_type` = 1, `wander_distance` = 5 WHERE `guid` = 28907;
UPDATE `creature` SET `movement_type` = 1, `wander_distance` = 10 WHERE `guid` = 10105;
UPDATE `creature` SET `position_x` = 52.892, `position_y` = 1563.021, `position_z` = 124.512, `orientation` = 3.459 WHERE `guid`= 27980;
UPDATE `creature` SET `position_z` = 16.25, `movement_type` = 1, `wander_distance` = 25 where `id` = 5420 AND `guid` = 21996;
UPDATE `creature` SET `movement_type` = 1, `wander_distance` = 15 WHERE `guid` = 42304;
UPDATE `creature` SET `movement_type` = 1, `wander_distance` = 15 WHERE `guid` = 2634;
UPDATE `creature` SET `movement_type` = 1, `wander_distance` = 2 WHERE `guid` IN (373 ,612, 756, 981, 1062);
UPDATE `creature` SET `position_x` = -5231.283, `position_y` = 1287.122, `position_z` = 55.708 WHERE `guid` = 51210;
UPDATE `creature` SET `movement_type` = 1, `wander_distance` = 3 WHERE `id` = 3695;
UPDATE `creature` SET `position_x` = 1591.68, `position_y` = -2539.28, `position_z` = 101.81  WHERE `guid` = 34832;
UPDATE `creature` SET `wander_distance` = 0, `movement_type` = 0 WHERE `guid` = 81122;

-- Correct faction for creatures (credit cmangos)
UPDATE `creature_template` SET `faction` = 103 WHERE `entry`=10202;
UPDATE `creature_template` SET `faction`= 14 WHERE `entry`=8212;

-- Shellfish Trap Summons Drysnap Crawler
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (32555, 0, 39, 176582, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 'Shellfish Trap - Start Script');
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (32554, 0, 39, 176582, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 'Shellfish Trap - Start Script');
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (32553, 0, 39, 176582, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 'Shellfish Trap - Start Script');
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (32551, 0, 39, 176582, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 'Shellfish Trap - Start Script');
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (32550, 0, 39, 176582, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 'Shellfish Trap - Start Script');
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (32549, 0, 39, 176582, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 'Shellfish Trap - Start Script');
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (32547, 0, 39, 176582, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 'Shellfish Trap - Start Script');
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (32546, 0, 39, 176582, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 'Shellfish Trap - Start Script');
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (32545, 0, 39, 176582, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 'Shellfish Trap - Start Script');
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (32544, 0, 39, 176582, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 'Shellfish Trap - Start Script');
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (32543, 0, 39, 176582, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 'Shellfish Trap - Start Script');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (176582, 0, 10, 11562, 180000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 'Shellfish Trap - Summon Creature');

-- Fallen Hero Talk on Aggro
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1099605, 10996, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1099605, 0, 0, 'Fallen Hero - Talk on Aggro');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1099605, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6375, 6374, 0, 0, 0, 0, 0, 0, 0, 'Fallen Hero - Talk');

-- Sahrhee Gossip Menu
UPDATE `creature_template` SET `gossip_menu_id` = 1483 WHERE `entry` = 8767;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(1483, 2155);

-- Fix Lunar Festival Questgivers
DELETE FROM `conditions` WHERE `condition_entry` IN (8870, 8871, 8872, 8873, 8874, 8875);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (199, 4, 1537, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (200, 4, 1657, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (201, 4, 1519, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (202, 4, 1638, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (204, 4, 1637, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (207, 4, 1497, 0, 0, 0, 0);
UPDATE `quest_template` SET `RequiredCondition` = 199 WHERE `entry` = 8870;
UPDATE `quest_template` SET `RequiredCondition` = 201 WHERE `entry` = 8871;
UPDATE `quest_template` SET `RequiredCondition` = 200 WHERE `entry` = 8872;
UPDATE `quest_template` SET `RequiredCondition` = 204 WHERE `entry` = 8873;
UPDATE `quest_template` SET `RequiredCondition` = 207 WHERE `entry` = 8874;
UPDATE `quest_template` SET `RequiredCondition` = 202 WHERE `entry` = 8875;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 15892;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1589201, 15892, 262, 1, 0, 100, 0, 0, 0, 0, 0, 1589201, 0, 0, 'Lunar Festival Emissary - Modify Flags on Spawn');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1589201, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lunar Festival Emissary - Modify Flags');
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (260, 52, 91629, 91688, 91599, 91595, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (261, 52, 91605, 91623, 0, 0, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (262, -1, 260, 261, 0, 0, 0);

-- Updates to Durotar Raiders
DELETE FROM `creature_movement` WHERE `id` = 3256;
UPDATE `creature` SET `movement_type` = 0 WHERE `guid` = 3256;
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES
(3254, 3254, 4, 6.25244, 11),
(3254, 3256, 4, 4.71, 11);
UPDATE `creature_movement` SET `script_id` = 11 WHERE `id` = 3254 AND `point` IN (5,69); -- Run from here
UPDATE `creature_movement` SET `script_id` = 13 WHERE `id` = 3254 AND `point` IN (32,93); -- Walk from here

-- Add Missing Spawns to Gnomer
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(1070, 6221, 0, 0, 0, 0, -5166.34, 700.808, 247.369, 3.24715, 300, 300, 2, 100, 100, 1, 0, 0, 0, 10),
(1115, 6221, 0, 0, 0, 0, -5163.22, 686.593, 247.369, 4.71333, 300, 300, 2, 100, 100, 1, 0, 0, 0, 10),
(1158, 6221, 0, 0, 0, 0, -5157.94, 679.544, 247.369, 4.71333, 300, 300, 2, 100, 100, 1, 0, 0, 0, 10),
(1162, 6221, 0, 0, 0, 0, -5159.34, 708.808, 247.369, 3.24715, 300, 300, 2, 100, 100, 1, 0, 0, 0, 10),
(1215, 6221, 0, 0, 0, 0, -5152.34, 695.808, 247.369, 3.24715, 300, 300, 2, 100, 100, 1, 0, 0, 0, 10),
(1237, 6221, 0, 0, 0, 0, -5164.34, 730.808, 247.369, 3.24715, 300, 300, 2, 100, 100, 1, 0, 0, 0, 10),
(1312, 6221, 0, 0, 0, 0, -5143.34, 724.808, 247.369, 3.24715, 300, 300, 2, 100, 100, 1, 0, 0, 0, 10),
(1317, 6221, 0, 0, 0, 0, -5154.34, 726.808, 247.369, 3.24715, 300, 300, 2, 100, 100, 1, 0, 0, 0, 10);

UPDATE `gameobject_template` SET `data2` = 2 WHERE `entry` = 180055;

-- Shyria is not a Vendor
DELETE FROM `npc_vendor` WHERE `entry` = 7736;
UPDATE `creature_template` SET `npc_flags` = 131, `vendor_id` = 0 WHERE `entry` = 7736;

-- Add missing Scripts to Main City Elite Guards
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` IN (14441, 14442, 14376, 14402, 14403, 14404);
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1444101, 14441, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1444101, 0, 0, 'Hunter Ragetotem - Set Phase 1 on Aggro');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1444101, 0, 44, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hunter Ragetotem - Increment Phase');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1444102, 14441, 0, 9, 5, 100, 1, 0, 5, 5000, 9000, 1444102, 0, 0, 'Hunter Ragetotem - Cast Sunder Armor (Phase 1)');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1444102, 0, 15, 15572, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hunter Ragetotem - Cast Spell Sunder Armor');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1444103, 14441, 0, 24, 5, 100, 1, 21081, 5, 5000, 5000, 1444103, 0, 0, 'Hunter Ragetotem - Set Phase 2 on Target Max Sunder Armor Aura Stack (Phase 1)');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1444103, 0, 44, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hunter Ragetotem - Increment Phase');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1444104, 14441, 0, 28, 3, 100, 1, 21081, 1, 5000, 5000, 1444104, 0, 0, 'Hunter Ragetotem - Set Phase 1 on Target Missing Sunder Armor Aura Stack (Phase 2)');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1444104, 0, 44, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hunter Ragetotem - Decrement Phase');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1444105, 14441, 0, 9, 0, 100, 1, 0, 30, 7000, 12000, 1444105, 0, 0, 'Hunter Ragetotem - Cast Hooked Net');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1444105, 0, 15, 14030, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hunter Ragetotem - Cast Spell Hooked Net');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1444106, 14441, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1444106, 0, 0, 'Hunter Ragetotem - Set Phase to 0 on Evade');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1444106, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hunter Ragetotem - Set Phase to 0');

INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1444201, 14442, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1444201, 0, 0, 'Hunter Thunderhorn - Set Phase 1 on Aggro');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1444201, 0, 44, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hunter Thunderhorn - Increment Phase');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1444202, 14442, 0, 9, 5, 100, 1, 0, 5, 5000, 9000, 1444202, 0, 0, 'Hunter Thunderhorn - Cast Sunder Armor (Phase 1)');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1444202, 0, 15, 15572, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hunter Thunderhorn - Cast Spell Sunder Armor');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1444203, 14442, 0, 24, 5, 100, 1, 21081, 5, 5000, 5000, 1444203, 0, 0, 'Hunter Thunderhorn - Set Phase 2 on Target Max Sunder Armor Aura Stack (Phase 1)');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1444203, 0, 44, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hunter Thunderhorn - Increment Phase');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1444204, 14442, 0, 28, 3, 100, 1, 21081, 1, 5000, 5000, 1444204, 0, 0, 'Hunter Thunderhorn - Set Phase 1 on Target Missing Sunder Armor Aura Stack (Phase 2)');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1444204, 0, 44, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hunter Thunderhorn - Decrement Phase');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1444205, 14442, 0, 9, 0, 100, 1, 0, 30, 7000, 12000, 1444205, 0, 0, 'Hunter Thunderhorn - Cast Hooked Net');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1444205, 0, 15, 14030, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hunter Thunderhorn - Cast Spell Hooked Net');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1444206, 14442, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1444206, 0, 0, 'Hunter Thunderhorn - Set Phase to 0 on Evade');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1444206, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hunter Thunderhorn - Set Phase to 0');

INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1437601, 14376, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1437601, 0, 0, 'Scout Manslayer - Set Phase 1 on Aggro');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1437601, 0, 44, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scout Manslayer - Increment Phase');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1437602, 14376, 0, 9, 5, 100, 1, 0, 5, 5000, 9000, 1437602, 0, 0, 'Scout Manslayer - Cast Sunder Armor (Phase 1)');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1437602, 0, 15, 15572, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scout Manslayer - Cast Spell Sunder Armor');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1437603, 14376, 0, 24, 5, 100, 1, 21081, 5, 5000, 5000, 1437603, 0, 0, 'Scout Manslayer - Set Phase 2 on Target Max Sunder Armor Aura Stack (Phase 1)');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1437603, 0, 44, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scout Manslayer - Increment Phase');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1437604, 14376, 0, 28, 3, 100, 1, 21081, 1, 5000, 5000, 1437604, 0, 0, 'Scout Manslayer - Set Phase 1 on Target Missing Sunder Armor Aura Stack (Phase 2)');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1437604, 0, 44, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scout Manslayer - Decrement Phase');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1437605, 14376, 0, 9, 0, 100, 1, 0, 30, 7000, 12000, 1437605, 0, 0, 'Scout Manslayer - Cast Hooked Net');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1437605, 0, 15, 14030, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scout Manslayer - Cast Spell Hooked Net');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1437606, 14376, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1437606, 0, 0, 'Scout Manslayer - Set Phase to 0 on Evade');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1437606, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scout Manslayer - Set Phase to 0');

INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1440201, 14402, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1440201, 0, 0, 'Seeker Cromwell - Set Phase 1 on Aggro');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1440201, 0, 44, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Seeker Cromwell - Increment Phase');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1440202, 14402, 0, 9, 5, 100, 1, 0, 5, 5000, 9000, 1440202, 0, 0, 'Seeker Cromwell - Cast Sunder Armor (Phase 1)');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1440202, 0, 15, 15572, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Seeker Cromwell - Cast Spell Sunder Armor');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1440203, 14402, 0, 24, 5, 100, 1, 21081, 5, 5000, 5000, 1440203, 0, 0, 'Seeker Cromwell - Set Phase 2 on Target Max Sunder Armor Aura Stack (Phase 1)');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1440203, 0, 44, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Seeker Cromwell - Increment Phase');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1440204, 14402, 0, 28, 3, 100, 1, 21081, 1, 5000, 5000, 1440204, 0, 0, 'Seeker Cromwell - Set Phase 1 on Target Missing Sunder Armor Aura Stack (Phase 2)');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1440204, 0, 44, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Seeker Cromwell - Decrement Phase');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1440205, 14402, 0, 9, 0, 100, 1, 0, 30, 7000, 12000, 1440205, 0, 0, 'Seeker Cromwell - Cast Hooked Net');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1440205, 0, 15, 14030, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Seeker Cromwell - Cast Spell Hooked Net');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1440206, 14402, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1440206, 0, 0, 'Seeker Cromwell - Set Phase to 0 on Evade');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1440206, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Seeker Cromwell - Set Phase to 0');

INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1440301, 14403, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1440301, 0, 0, 'Seeker Nahr - Set Phase 1 on Aggro');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1440301, 0, 44, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Seeker Nahr - Increment Phase');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1440302, 14403, 0, 9, 5, 100, 1, 0, 5, 5000, 9000, 1440302, 0, 0, 'Seeker Nahr - Cast Sunder Armor (Phase 1)');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1440302, 0, 15, 15572, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Seeker Nahr - Cast Spell Sunder Armor');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1440303, 14403, 0, 24, 5, 100, 1, 21081, 5, 5000, 5000, 1440303, 0, 0, 'Seeker Nahr - Set Phase 2 on Target Max Sunder Armor Aura Stack (Phase 1)');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1440303, 0, 44, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Seeker Nahr - Increment Phase');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1440304, 14403, 0, 28, 3, 100, 1, 21081, 1, 5000, 5000, 1440304, 0, 0, 'Seeker Nahr - Set Phase 1 on Target Missing Sunder Armor Aura Stack (Phase 2)');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1440304, 0, 44, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Seeker Nahr - Decrement Phase');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1440305, 14403, 0, 9, 0, 100, 1, 0, 30, 7000, 12000, 1440305, 0, 0, 'Seeker Nahr - Cast Hooked Net');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1440305, 0, 15, 14030, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Seeker Nahr - Cast Spell Hooked Net');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1440306, 14403, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1440306, 0, 0, 'Seeker Nahr - Set Phase to 0 on Evade');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1440306, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Seeker Nahr - Set Phase to 0');

INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1440401, 14404, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1440401, 0, 0, 'Seeker Thompson - Set Phase 1 on Aggro');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1440401, 0, 44, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Seeker Thompson - Increment Phase');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1440402, 14404, 0, 9, 5, 100, 1, 0, 5, 5000, 9000, 1440402, 0, 0, 'Seeker Thompson - Cast Sunder Armor (Phase 1)');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1440402, 0, 15, 15572, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Seeker Thompson - Cast Spell Sunder Armor');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1440403, 14404, 0, 24, 5, 100, 1, 21081, 5, 5000, 5000, 1440403, 0, 0, 'Seeker Thompson - Set Phase 2 on Target Max Sunder Armor Aura Stack (Phase 1)');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1440403, 0, 44, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Seeker Thompson - Increment Phase');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1440404, 14404, 0, 28, 3, 100, 1, 21081, 1, 5000, 5000, 1440404, 0, 0, 'Seeker Thompson - Set Phase 1 on Target Missing Sunder Armor Aura Stack (Phase 2)');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1440404, 0, 44, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Seeker Thompson - Decrement Phase');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1440405, 14404, 0, 9, 0, 100, 1, 0, 30, 7000, 12000, 1440405, 0, 0, 'Seeker Thompson - Cast Hooked Net');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1440405, 0, 15, 14030, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Seeker Thompson - Cast Spell Hooked Net');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1440406, 14404, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1440406, 0, 0, 'Seeker Thompson - Set Phase to 0 on Evade');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1440406, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Seeker Thompson - Set Phase to 0');

-- Remove Incorrect Gossip Menu Option
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6059 AND `id` = 2;

-- Add Quest Complete Script to The Divination
UPDATE `creature_template` SET `script_name` = '' WHERE `entry` = 8022;
UPDATE `quest_template` SET `StartScript` = 2992 WHERE `entry` = 2992;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(10080, 144069, 0, -10999, -3484.47, 103.122, 2.52228, 0, 0, 0, 0, -120, -120, 100, 1, 0, 0, 0, 10);
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2992, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Divination: Thadius Grimshade - Modify Flags');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2992, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4126, 0, 0, 0, 0, 0, 0, 0, 0, 'The Divination: Thadius Grimshade - Talk');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2992, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4127, 0, 0, 0, 0, 0, 0, 0, 0, 'The Divination: Thadius Grimshade - Modify Talk');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2992, 5, 9, 10080, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Divination: Thadius Grimshade - Respawn GameObject');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2992, 6, 1, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Divination: Thadius Grimshade - Emote');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2992, 11, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Divination: Thadius Grimshade - Emote');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2992, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4128, 0, 0, 0, 0, 0, 0, 0, 0, 'The Divination: Thadius Grimshade - Talk');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2992, 14, 7, 2992, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Divination: Thadius Grimshade - Complete Quest');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2992, 15, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Divination: Thadius Grimshade - Modify Flags');

-- Quest 1420 Requires 1418
UPDATE `quest_template` SET `NextQuestInChain` = 0, `NextQuestId` = 1420 WHERE `entry` = 1418;

-- Correct Scripts For Servants (credit cmangos)
-- Events list for Servant of Razelikh
DELETE FROM `creature_ai_events` WHERE `creature_id`=7668;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (766801, 7668, 0, 11, 0, 100, 0, 0, 0, 0, 0, 766801, 0, 0, 'Servant of Razelikh - Set Invincible at 1% HP on Spawn');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (766802, 7668, 600, 8, 0, 100, 0, 12938, -1, 0, 0, 766802, 0, 0, 'Servant of Razelikh - Remove Invincible on Fel Curse Spellhit');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (766803, 7668, 0, 7, 0, 100, 0, 0, 0, 0, 0, 766803, 0, 0, 'Servant of Razelikh - Set Invincible at 1% HP on Evade');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (766804, 7668, 0, 2, 0, 100, 0, 5, 0, 1, 1, 766804, 0, 0, 'Servant of Razelikh - Cast Spirit Shock at 5% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (766805, 7668, 0, 6, 0, 100, 0, 0, 0, 0, 0, 766805, 0, 0, 'Servant of Razelikh - Talk on Death');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (766804, 0, 1, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Servant of Razelikh - Emote');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (766804, 0, 15, 10794, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Servant of Razelikh - Cast Spell Spirit Shock');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (766805, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3685, 3681, 3641, 3683, 0, 0, 0, 0, 0, 'Servant of Razelikh - Talk');
-- Events list for Servant of Servant of Grol
DELETE FROM `creature_ai_events` WHERE `creature_id`=7669;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (766901, 7669, 0, 11, 0, 100, 0, 0, 0, 0, 0, 766901, 0, 0, 'Servant of Servant of Grol - Set Invincible at 1% HP on Spawn');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (766902, 7669, 600, 8, 0, 100, 0, 12938, -1, 0, 0, 766902, 0, 0, 'Servant of Servant of Grol - Remove Invincible on Fel Curse Spellhit');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (766903, 7669, 0, 7, 0, 100, 0, 0, 0, 0, 0, 766903, 0, 0, 'Servant of Servant of Grol - Set Invincible at 1% HP on Evade');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (766904, 7669, 0, 2, 0, 100, 0, 5, 0, 1, 1, 766904, 0, 0, 'Servant of Servant of Grol - Cast Spirit Shock at 5% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (766905, 7669, 0, 6, 0, 100, 0, 0, 0, 0, 0, 766905, 0, 0, 'Servant of Servant of Grol - Talk on Death');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (766904, 0, 1, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Servant of Servant of Grol - Emote');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (766904, 0, 15, 10794, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Servant of Servant of Grol - Cast Spell Spirit Shock');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (766905, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3685, 3681, 3641, 3683, 0, 0, 0, 0, 0, 'Servant of Servant of Grol - Talk');
-- Events list for Servant of Allistarj
DELETE FROM `creature_ai_events` WHERE `creature_id`=7670;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (767001, 7670, 0, 11, 0, 100, 0, 0, 0, 0, 0, 767001, 0, 0, 'Servant of Allistarj - Set Invincible at 1% HP on Spawn');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (767002, 7670, 600, 8, 0, 100, 0, 12938, -1, 0, 0, 767002, 0, 0, 'Servant of Allistarj - Remove Invincible on Fel Curse Spellhit');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (767003, 7670, 0, 7, 0, 100, 0, 0, 0, 0, 0, 767003, 0, 0, 'Servant of Allistarj - Set Invincible at 1% HP on Evade');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (767004, 7670, 0, 2, 0, 100, 0, 5, 0, 1, 1, 767004, 0, 0, 'Servant of Allistarj - Cast Spirit Shock at 5% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (767005, 7670, 0, 6, 0, 100, 0, 0, 0, 0, 0, 767005, 0, 0, 'Servant of Allistarj - Talk on Death');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (767004, 0, 1, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Servant of Allistarj - Emote');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (767004, 0, 15, 10794, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Servant of Allistarj - Cast Spell Spirit Shock');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (767005, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3685, 3681, 3641, 3683, 0, 0, 0, 0, 0, 'Servant of Allistarj - Talk');
-- Events list for Servant of Sevine
DELETE FROM `creature_ai_events` WHERE `creature_id`=7671;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (767101, 7671, 0, 11, 0, 100, 0, 0, 0, 0, 0, 767101, 0, 0, 'Servant of Sevine - Set Invincible at 1% HP on Spawn');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (767102, 7671, 600, 8, 0, 100, 0, 12938, -1, 0, 0, 767102, 0, 0, 'Servant of Sevine - Remove Invincible on Fel Curse Spellhit');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (767103, 7671, 0, 7, 0, 100, 0, 0, 0, 0, 0, 767103, 0, 0, 'Servant of Sevine - Set Invincible at 1% HP on Evade');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (767104, 7671, 0, 2, 0, 100, 0, 5, 0, 1, 1, 767104, 0, 0, 'Servant of Sevine - Cast Spirit Shock at 5% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (767105, 7671, 0, 6, 0, 100, 0, 0, 0, 0, 0, 767105, 0, 0, 'Servant of Sevine - Talk on Death');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (767104, 0, 1, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Servant of Sevine - Emote');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (767104, 0, 15, 10794, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Servant of Sevine - Cast Spell Spirit Shock');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (767105, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3685, 3681, 3641, 3683, 0, 0, 0, 0, 0, 'Servant of Sevine - Talk');
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (600, 1, 10794, 0, 0, 0, 0);

-- Add Missing Quest and Add Correct Requirements
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES
(11555, 8484, 7, 10);
UPDATE `quest_template` SET `PrevQuestId` = 8481 WHERE `entry` = 8484;
UPDATE `quest_template` SET `PrevQuestId` = 8481 WHERE `entry` = 8485;

-- Remove Some Low Level Loot From Tanaris Mobs
DELETE FROM `creature_loot_template` WHERE `entry` = 5426 AND `item` = 30019;
DELETE FROM `creature_loot_template` WHERE `entry` = 5429 AND `item` IN (30017, 30019);

-- Remove Duplicate Noblegarden Event
UPDATE `game_event_gameobject` SET `event` = 28 WHERE `guid` IN (3996165, 3996166, 3996167, 3996168, 3996169) AND `event` = 9;
DELETE FROM `game_event` WHERE  `entry` = 9;

-- Reduce Wander Distance of Honored Hero
UPDATE `creature` SET `wander_distance` = 2 WHERE `id` IN (15115, 15113);

-- Add Missing Harvest Festival Gameobjects
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(9131, 180206, 1, 1636.83, -3080.19, 87.6522, 2.1332, 0, 0, 0.875563, 0.483105, 120, 120, 1, 100, 0, 10),
(9134, 180207, 1, 1635.98, -3080.05, 87.5749, 2.05932, 0, 0, 0.857123, 0.515111, 120, 120, 1, 100, 0, 10),
(9144, 180208, 1, 1635.09, -3081.46, 87.7099, 2.45359, 0, 0, 0.941412, 0.337259, 120, 120, 1, 100, 0, 10),
(8902, 180209, 1, 1633.73, -3081.53, 87.5771, 1.69648, 0, 0, 0.750118, 0.661304, 120, 120, 1, 100, 0, 10),
(8906, 180209, 1, 1636.57, -3079.71, 87.7028, 2.15807, 0, 0, 0.881503, 0.472178, 120, 120, 1, 100, 0, 10),
(8911, 180209, 1, 1638.55, -3082.55, 87.8683, 2.31588, 0, 0, 0.915979, 0.401225, 120, 120, 1, 100, 0, 10),
(8912, 181173, 0, 1614.42, -3051.32, 77.6001, 5.42798, 0, 0, -0.414693, 0.909962, 120, 120, 1, 100, 0, 10),
(8950, 181191, 0, 1611.98, -3065.57, 78.606, 0.453785, 0, 0, 0.224951, 0.97437, 120, 120, 1, 100, 0, 10),
(8951, 181191, 0, 1613.93, -3065.54, 78.6501, 3.05433, 0, 0, 0.999048, 0.0436193, 120, 120, 1, 100, 0, 10),
(8964, 181191, 0, 1622.07, -3046.96, 79.0298, 3.64774, 0, 0, -0.968147, 0.250381, 120, 120, 1, 100, 0, 10),
(8990, 180210, 0, 972.153, -1825.19, 81.9915, 3.46263, 0, 0, -0.987144, 0.15983, 120, 120, 1, 100, 0, 10),
(8997, 180210, 0, 972.246, -1824.78, 81.9914, 3.54137, 0, 0, -0.980088, 0.198562, 120, 120, 1, 100, 0, 10),
(9007, 180210, 0, 972.521, -1825.12, 81.9913, 3.45139, 0, 0, -0.988028, 0.154277, 120, 120, 1, 100, 0, 10),
(9017, 180210, 0, 975.632, -1823.89, 81.0848, 3.47179, 0, 0, -0.986403, 0.164347, 120, 120, 1, 100, 0, 10),
(9019, 180210, 0, 979.975, -1823.11, 80.5226, 3.59301, 0, 0, -0.974636, 0.223796, 120, 120, 1, 100, 0, 10),
(9023, 180211, 0, 973.106, -1824.75, 81.6914, 3.41884, 0, 0, -0.990407, 0.138181, 120, 120, 1, 100, 0, 10),
(9029, 180211, 0, 974.448, -1824.23, 81.3469, 3.51203, 0, 0, -0.982896, 0.184162, 120, 120, 1, 100, 0, 10),
(9042, 180211, 0, 974.493, -1826.16, 81.3903, 3.37831, 0, 0, -0.993004, 0.118082, 120, 120, 1, 100, 0, 10),
(9049, 180211, 0, 976.11, -1825.66, 81.0847, 3.20409, 0, 0, -0.999512, 0.0312462, 120, 120, 1, 100, 0, 10),
(9052, 180211, 0, 977.114, -1822.72, 80.7849, 3.4207, 0, 0, -0.990278, 0.139101, 120, 120, 1, 100, 0, 10),
(9064, 180213, 0, 976.092, -1824.71, 80.9787, 3.40629, 0, 0, -0.991255, 0.131962, 120, 120, 1, 100, 0, 10),
(9074, 180213, 0, 978.935, -1822.32, 81.499, 3.45048, 0, 0, -0.988097, 0.153831, 120, 120, 1, 100, 0, 10),
(9081, 180214, 0, 972.084, -1825.01, 81.9913, 3.39875, 0, 0, -0.991745, 0.128226, 120, 120, 1, 100, 0, 10),
(9124, 180214, 0, 972.37, -1822.14, 81.3906, 4.83089, 0, 0, -0.663993, 0.747739, 120, 120, 1, 100, 0, 10),
(9126, 180214, 0, 973.393, -1824.52, 81.6114, 3.48035, 0, 0, -0.98569, 0.168567, 120, 120, 1, 100, 0, 10),
(9128, 180214, 0, 975.173, -1824.7, 81.0833, 3.52148, 0, 0, -0.982015, 0.188805, 120, 120, 1, 100, 0, 10);

INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES
(9131, 11),
(9134, 11),
(9144, 11),
(8902, 11),
(8906, 11),
(8911, 11),
(8912, 11),
(8950, 11),
(8951, 11),
(8964, 11),
(8990, 11),
(8997, 11),
(9007, 11),
(9017, 11),
(9019, 11),
(9023, 11),
(9029, 11),
(9042, 11),
(9049, 11),
(9052, 11),
(9064, 11),
(9074, 11),
(9081, 11),
(9124, 11),
(9126, 11),
(9128, 11);

-- Update Spawn Locations For New Year's Eve Creatures
UPDATE `creature` SET `position_x` = 1426.79, `position_y` = -4402.28, `position_z` = 25.3187, `orientation` = 0.056569 WHERE `guid` = 212459;
UPDATE `creature` SET `position_x` = -9071.54, `position_y` = 500.753, `position_z` = 75.906, `orientation` = 2.087082 WHERE `guid` = 206411;
UPDATE `creature` SET `position_x` = -9021.04, `position_y` = 477.321, `position_z` = 96.1096, `orientation` = 5.087082 WHERE `guid` = 206209;
UPDATE `creature` SET `position_x` = -8991.48, `position_y` = 395.316, `position_z` = 72.8041, `orientation` = 4.087082 WHERE `guid` = 206458;
UPDATE `creature` SET `position_x` = -9019.42, `position_y` = 477.873, `position_z` = 96.3053, `orientation` = 5.70223 WHERE `guid` = 206212;
UPDATE `creature` SET `position_x` = -1279.88, `position_y` = 107.271, `position_z` = 130.178, `orientation` = 0.70223 WHERE `guid` = 217036;
UPDATE `creature` SET `position_x` = -1278.62, `position_y` = 108.554, `position_z` = 130.052, `orientation` = 5.70223, `movement_type` = 0, `wander_distance` = 0 WHERE `guid` = 208688;
UPDATE `creature` SET `position_x` = -1200.63, `position_y` = -95.5286, `position_z` = 162.652, `orientation` = 6.70223, `movement_type` = 0, `wander_distance` = 0 WHERE `guid` = 216589;
UPDATE `creature` SET `position_x` = 1819.71, `position_y` = 196.531, `position_z` = 70.483, `orientation` = 4.087082 WHERE `guid` = 202847;
UPDATE `creature` SET `position_x` = -5028.83, `position_y` = -814.463, `position_z` = 495.248, `orientation` = 4.087082 WHERE `guid` = 208350;
UPDATE `creature` SET `position_x` = 8597.74, `position_y` = 1008.65, `position_z` = 5.78136, `orientation` = 4.087082 WHERE `guid` = 208900;

-- Delete Arathi PVP supplies from Warpwood Stomper, Desert Rumbler, Vekniss Soldier
DELETE FROM `creature_loot_template` WHERE `entry` IN (11465, 11746, 15229) AND `item` IN (20062, 20066);

-- Delete loot table for Field Marshal Oslight 
UPDATE `creature_template` SET `loot_id` = 0 WHERE `entry` = 14983;
DELETE FROM `creature_loot_template` WHERE `entry` = 14983;

-- Correct Some Quest Texts
UPDATE `quest_template` SET `OfferRewardText` = 'Hm... $N. You are still new to your path, but I sense the possibility for greatness in you.$B$BYou were born with gifts, $N. See that they do not go to waste.' WHERE `entry` = 1507;
UPDATE `quest_template` SET `OfferRewardText` = 'Incredible! Improbable! Simply amazing! You\'ve got talent, $N. Either that or you\'re the luckiest $gman:woman; alive!$b$bHere\'s your cut of the action. I\'m sure you would make better use of this stuff than I could.$b$b' WHERE `entry`=2381;
UPDATE `quest_template` SET `RequestItemsText` = 'This is going to be a tough battle...' WHERE `entry` = 3382;

-- Update script for The Test of Righteousness
INSERT INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES (8912, 0, -5095.6, -785.673, 496.287, 3.1526);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (22030, 102413, 0, -5095.61, -785.424, 496.288, 1.37889, 0, 0, 0.636107, 0.771601, -10, -10, 255, 1);
DELETE FROM `quest_start_scripts` WHERE `id`=1806;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1806, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Test of Righteousness: Jordan Stilwell - Modify Flags');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1806, 1, 3, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, -5094.52, -785.855, 495.21, 2.79125, 0, 'The Test of Righteousness: Jordan Stilwell - Move');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1806, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2501, 0, 0, 0, 0, 0, 0, 0, 0, 'The Test of Righteousness: Jordan Stilwell - Talk');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1806, 7, 15, 8912, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Test of Righteousness: Jordan Stilwell - Cast Spell');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1806, 9, 15, 8912, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Test of Righteousness: Jordan Stilwell - Cast Spell');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1806, 11, 15, 8912, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Test of Righteousness: Jordan Stilwell - Cast Spell');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1806, 12, 9, 22030, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Test of Righteousness: Jordan Stilwell - Respawn Gameobject');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1806, 13, 15, 8912, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Test of Righteousness: Jordan Stilwell - Cast Spell');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1806, 15, 15, 8912, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Test of Righteousness: Jordan Stilwell - Cast Spell');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1806, 17, 15, 8912, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Test of Righteousness: Jordan Stilwell - Cast Spell');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1806, 18, 28, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Test of Righteousness: Jordan Stilwell - Set Stand State');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1806, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2521, 0, 0, 0, 0, 0, 0, 0, 0, 'The Test of Righteousness: Jordan Stilwell - Talk');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1806, 21, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Test of Righteousness: Jordan Stilwell - Set Stand State');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1806, 24, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -5089.28, -782.95, 495.279, 5.77704, 0, 'The Test of Righteousness: Jordan Stilwell - Move');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1806, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2504, 0, 0, 0, 0, 0, 0, 0, 0, 'The Test of Righteousness: Jordan Stilwell - Talk');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1806, 28, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Test of Righteousness: Jordan Stilwell - Modify Flags');

-- Mudrock Tortoise skinning Template
UPDATE `creature_template` SET `skinning_loot_id`= 4397 WHERE `entry` = 4396;

-- Mudrock Snapjaw Skinning Template
UPDATE `creature_template` SET `skinning_loot_id`= 4400 WHERE `entry` = 4400;
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
(4400, 4234, 44.643, 0, 1, 1, 0, 0, 10),
(4400, 4235, 2.613, 0, 1, 1, 0, 0, 10),
(4400, 4304, 49.735, 0, 1, 1, 0, 0, 10),
(4400, 8169, 4.735, 0, 1, 1, 0, 0, 10),
(4400, 8167, 51.478, 0, 1, 1, 0, 0, 10);

-- Stormwind Moonwell Gobjects Should be Invis
UPDATE `gameobject` SET `position_z` = 91.219 WHERE `guid` IN (42907, 42910, 42908, 42909);

-- Fix The Perfect Stout Quest Chain 
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestInChain` = 413 WHERE `entry` = 315;
UPDATE `quest_template` SET `PrevQuestId` = 315 WHERE `entry` = 415;
UPDATE `quest_template` SET `PrevQuestId`= 315 WHERE `entry` = 413;

-- Creatures Should Remove Buff For Priest Garment Quests
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1242904, 12429, 0, 8, 0, 100, 1, 1243, -1, 0, 0, 1242904, 0, 0, 'Sentinel Shaya - Remove Buff on Buffed');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1242904, 0, 14, 1243, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sentinel Shaya - Remove Aura');

INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1242704, 12427, 0, 8, 0, 100, 1, 1243, -1, 0, 0, 1242704, 0, 0, 'Mountaineer Dolf - Remove Buff on Buffed');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1242704, 0, 14, 1243, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mountaineer Dolf - Remove Aura');

INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1242304, 12423, 0, 8, 0, 100, 1, 1243, -1, 0, 0, 1242304, 0, 0, 'Guard Roberts - Remove Buff on Buffed');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1242304, 0, 14, 1243, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Roberts - Remove Aura');

INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1243004, 12430, 0, 8, 0, 100, 1, 1243, -1, 0, 0, 1243004, 0, 0, 'Grunt Kor\'ja - Remove Buff on Buffed');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1243004, 0, 14, 1243, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grunt Kor\'ja - Remove Aura');

INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1242804, 12428, 0, 8, 0, 100, 1, 1243, -1, 0, 0, 1242804, 0, 0, 'Deathguard Kel - Remove Buff on Buffed');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1242804, 0, 14, 1243, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deathguard Kel - Remove Aura');

-- Rename Darkmoon Faire Events
UPDATE `game_event` SET `description`='Darkmoon Faire Building (Elwynn)' WHERE  `entry`=23;
UPDATE `game_event` SET `description`='Darkmoon Faire Building (Mulgore)' WHERE  `entry`=24;

-- Correct Items Shadi Mistrunner
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES
(8363, 2605);
DELETE FROM `npc_vendor` WHERE `entry` = 8363 AND `item` = 785;

-- Reduce Schematic: Ice Deflector Restock Time
UPDATE `npc_vendor` SET `incrtime` = 7200 WHERE `entry` = 2684 AND `item` = 13308;

-- Increase Dropchance for Lake Skulker Moss
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`= -50 WHERE `entry` IN (1953, 1954) AND `item` = 3256;

-- Quest 109 Should be Started by Multiple NPCs
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES
(233, 109, 0, 10),
(237, 109, 0, 10),
(240, 109, 0, 10),
(294, 109, 0, 10),
(963, 109, 0, 10);

-- Remove Duplicate Spawns From Cave
DELETE FROM `creature` WHERE `guid` IN (
21011,
13097,
21759,
13096,
13083,
21766,
13094,
13085,
21765,
21029
);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;

