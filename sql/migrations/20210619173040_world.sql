DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210619173040');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210619173040');
-- Add your query below.


-- Despawn Creatures In Faire Area
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES
(80369, -4),
(80367, -4),
(80360, -4),
(80363, -4),
(80362, -4),
(80365, -4),
(80366, -4),
(80695, -4),
(80699, -4),
(80369, -23),
(80367, -23),
(80360, -23),
(80363, -23),
(80362, -23),
(80365, -23),
(80366, -23),
(80695, -23),
(80699, -23);

-- Correct Gossip For Kruban Darkblade
-- Assign Kruban Darkblade to Darkmoon Events
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES
(54395, 4),
(54395, 23),
(54395, 24);

-- Add Missing Gossip Menus
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6214, 7374, 946),
(6221, 7378, 953),
(6222, 7377, 945);

-- Add Missing Gossip Menu Options
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES
(6214, 1, 0, 'The Darkmoon Faire has already arrived, you say?  Where is it located?', 0, 1, 1, 6222, 0, 0, 0, 0, \N, 0, 946);

-- Add Conditions
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (953, 12, 23, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (954, 12, 24, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (955, -2, 953, 954, 0, 0, 0);

-- Update Existing Gossip Menus
UPDATE `gossip_menu` SET `condition_id` = 955 WHERE `entry` = 6214 AND `text_id` = 7366;
UPDATE `gossip_menu_option` SET `condition_id` = 955 WHERE `menu_id` = 6214 AND `id` = 0;
UPDATE `gossip_menu` SET `condition_id` = 954 WHERE `entry` = 6221 AND `text_id` = 7376;

-- Add OOC Text to Kruban Darkblade For Event Building Darkmoon Faire
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 14843;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1484301, 14843, 955, 1, 0, 100, 1, 45000, 120000, 45000, 120000, 1484301, 0, 0, 'Kruban Darkblade - Talk - OOC - Event 23 and 24');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1484301, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10093, 10094, 10095, 10096, 0, 0, 0, 0, 0, 'Kruban Darkblade - Talk');

-- Add OOC Text to Kruban Darkblade For Event Darkmoon Faire
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1484302, 14843, 946, 1, 0, 100, 1, 45000, 120000, 45000, 0, 1484302, 0, 0, 'Kruban Darkblade - Talk - OOC - Event 4 and 5');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1484302, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10106, 10107, 10108, 10105, 0, 0, 0, 0, 0, 'Kruban Darkblade - Talk');

-- Correct Gossip For Melnan Darkstone
-- Assign Melnan Darkstone to Darkmoon Events
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES
(144028, 5),
(144028, 23),
(144028, 24);

-- Correct Gossip Menus
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6213, 7366, 955);

-- Add Missing Gossip Menu Options
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES
(6213, 1, 0, 'When the Darkmoon Faire arrives, where will it be located?', 0, 1, 1, 6221, 0, 0, 0, 0, \N, 0, 955);

-- Update Existing Gossip Menus
UPDATE `gossip_menu` SET `condition_id` = 946 WHERE `entry` = 6213 AND `text_id` = 7375;
UPDATE `gossip_menu_option` SET `condition_id` = 946 WHERE `menu_id` = 6213 AND `id` = 0;

-- Add OOC Text to Melnan Darkstone For Event Building Darkmoon Faire
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 14842;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1484201, 14842, 955, 1, 0, 100, 1, 45000, 120000, 45000, 120000, 1484201, 0, 0, 'Melnan Darkstone - Talk - OOC - Event 23 and 24');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1484201, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10097, 10098, 10099, 10100, 0, 0, 0, 0, 0, 'Melnan Darkstone - Talk');

-- Add OOC Text to Melnan Darkstone For Event Darkmoon Faire
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1484202, 14842, 946, 1, 0, 100, 1, 45000, 120000, 45000, 120000, 1484202, 0, 0, 'Melnan Darkstone - Talk - OOC - Event 4 and 5');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1484202, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10101, 10102, 10103, 10104, 0, 0, 0, 0, 0, 'Melnan Darkstone - Talk');

-- Add Flick Waypoints and Scripts
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 14860;
UPDATE `creature` SET `position_x` = -9582.77, `position_y` = 37.0359, `position_z` = 60.3921 WHERE `guid` IN (56625, 56624);
DELETE FROM `creature_movement` WHERE `id` = 56625;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `script_id`) VALUES
(14860, 1, -9582.77, 37.0359, 60.3921, 100, 3180901),
(14860, 2, -9575.36, 46.4425, 60.2917, 100, 0),
(14860, 3, -9574.4, 57.7072, 60.9694, 100, 0),
(14860, 4, -9581.27, 61.9526, 61.5924, 100, 0),
(14860, 5, -9582.19, 57.5235, 61.5598, 100, 0),
(14860, 6, -9573.22, 55.109, 60.7786, 100, 0),
(14860, 7, -9562.44, 58.7552, 60.237, 100, 0),
(14860, 8, -9554.86, 68.119, 59.1309, 100, 0),
(14860, 9, -9553.75, 79.372, 59.0324, 100, 0),
(14860, 10, -9557.24, 88.6613, 59.0065, 100, 0),
(14860, 11, -9549.26, 93.6267, 59.0065, 100, 0),
(14860, 12, -9538.74, 89.6264, 59.0065, 100, 0),
(14860, 13, -9526.86, 85.964, 58.9329, 100, 0),
(14860, 14, -9515.2, 81.7789, 59.6269, 100, 0),
(14860, 15, -9504.11, 77.2859, 57.8536, 100, 0),
(14860, 16, -9492.49, 72.1215, 56.098, 100, 0),
(14860, 17, -9480.97, 65.3954, 56.31, 100, 0),
(14860, 18, -9469.44, 58.7708, 56.4992, 100, 0),
(14860, 19, -9458.37, 55.9505, 56.3491, 100, 0),
(14860, 20, -9453.54, 61.264, 55.9207, 100, 0),
(14860, 21, -9460.56, 66.5982, 56.2413, 100, 0),
(14860, 22, -9472.02, 68.2707, 56.3907, 100, 0),
(14860, 23, -9483.02, 73.8962, 56.3455, 100, 0),
(14860, 24, -9495.46, 74.8723, 56.4481, 100, 0),
(14860, 25, -9506.86, 78.1109, 58.6032, 100, 0),
(14860, 26, -9517.98, 84.3942, 59.3436, 100, 0),
(14860, 27, -9529.59, 88.1913, 58.9516, 100, 0),
(14860, 28, -9539.61, 95.543, 58.9866, 100, 0),
(14860, 29, -9545.48, 106.784, 59.071, 100, 0),
(14860, 30, -9548.48, 118.797, 59.2565, 100, 0),
(14860, 31, -9548.38, 131.102, 58.9597, 100, 0),
(14860, 32, -9543.12, 126.014, 59.2042, 100, 0),
(14860, 33, -9541.34, 114.956, 59.0332, 100, 0),
(14860, 34, -9540.89, 102.602, 59.1528, 100, 0),
(14860, 35, -9538.99, 89.9361, 59.0989, 100, 0),
(14860, 36, -9541.2, 77.9545, 59.0065, 100, 0),
(14860, 37, -9550.35, 70.3581, 59.2352, 100, 0),
(14860, 38, -9559.09, 61.4263, 60.006, 100, 0),
(14860, 39, -9568.32, 53.1292, 60.3528, 100, 0),
(14860, 40, -9568.45, 42.5114, 60.0803, 100, 0),
(14860, 41, -9561.53, 32.2363, 60.9041, 100, 0),
(14860, 42, -9566.65, 22.282, 61.4776, 100, 0),
(14860, 43, -9575.63, 16.3312, 60.4544, 100, 0),
(14860, 44, -9585.13, 21.0085, 60.3996, 100, 0),
(14860, 45, -9588.79, 29.5242, 60.2019, 100, 0);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES
(56625, 56625, 2, 6.25244, 11),
(56625, 56624, 2, 0, 11);
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1486001, 14860, 0, 1, 0, 100, 1, 30000, 45000, 30000, 45000, 1486001, 0, 0, 'Flik - Talk - OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1486001, 0, 39, 1486001, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Flik - Start Script');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1486001, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10148, 10147, 10145, 10146, 0, 0, 0, 0, 0, 'Flik - Talk');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1486001, 1, 16, 8353, 2, 0, 0, 14866, 10, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fliks Frog - Play Sound');

-- Add Darkmoon Zoo Sounds
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 14829;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1482901, 14829, 0, 1, 0, 100, 1, 3000, 40000, 3000, 40000, 1482901, 0, 0, 'Yebb Neblegear - Play Sounds - OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1482901, 0, 39, 1482901, 1482902, 1482903, 1482904, 0, 0, 0, 0, 25, 25, 25, 25, 0, 0, 0, 0, 0, 'Yebb Neblegear - Start Script');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1482901, 0, 16, 8354, 2, 0, 0, 56612, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Khaz Modan Ram - Play Sound');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1482901, 0, 16, 8354, 2, 0, 0, 57168, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Khaz Modan Ram - Play Sound');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1482902, 0, 16, 8352, 2, 0, 0, 57163, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pygmy Cockatrice - Play Sound');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1482903, 0, 16, 8356, 2, 0, 0, 57441, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Felinni - Play Sound');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1482904, 0, 16, 8355, 2, 0, 0, 56323, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hornsley - Play Sound');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
