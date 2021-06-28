DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210624194440');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210624194440');
-- Add your query below.


-- Correct Barbs Aura Passive for Mudrock Spikeshell 4397 (credit cmangos)
UPDATE `creature_template` SET `auras` = '9464' WHERE `entry` = 4397;

-- Fix Creature Stuck Underground
UPDATE `creature` SET `position_z` = 79.5248, `movement_type` = 1, `wander_distance` = 10 WHERE `guid` = 15226;
UPDATE `creature` SET `position_x` = -4268.95, `position_y` = 36.598, `position_z` = 55.1443, `movement_type` = 1, `wander_distance` = 10 WHERE `guid` = 50875;
UPDATE `creature` SET `position_x` = -6695.45, `position_y` = -3014.05, `position_z` = 261.037, `movement_type` = 1, `wander_distance` = 4 WHERE `guid` = 6910;
UPDATE `creature` SET `position_x` = -269.935, `position_y` = -1409.396, `position_z` = 91.607, `orientation` = 1.929 WHERE `guid`= 14851;
DELETE FROM `creature` WHERE `guid` IN  (92880, 51693, 51699, 51704);
UPDATE `creature` SET `position_x` = -1813.75, `position_y` = 2889.85, `position_z` = 50.971, `movement_type` = 1, `wander_distance` = 5 WHERE `guid` = 28907;

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
UPDATE `quest_template` SET `RequiredCondition` = 0 WHERE `entry` IN (8870, 8871, 8872, 8873, 8874, 8875);
DELETE FROM `conditions` WHERE `condition_entry` IN (8870, 8871, 8872, 8873, 8874, 8875);
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 15892;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1589201, 15892, 192, 1, 0, 100, 0, 0, 0, 0, 0, 1589201, 0, 0, 'Lunar Festival Emissary - Modify Flags - On Spawn');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1589201, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lunar Festival Emissary - Modify Flags');
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (187, 52, 91629, 91688, 91599, 91595, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (191, 52, 91605, 91623, 0, 0, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (192, -1, 187, 191, 0, 0, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
