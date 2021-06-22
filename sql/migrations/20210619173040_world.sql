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

-- Elwynn Flick Waypoints and Scripts
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 14860;
UPDATE `creature` SET `position_x` = -9582.77, `position_y` = 37.0359, `position_z` = 60.3921 WHERE `guid` IN (56625, 56624);
DELETE FROM `creature_movement` WHERE `id` = 56625;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `script_id`) VALUES
(56625, 1, -9582.77, 37.0359, 60.3921, 100, 3180901),
(56625, 2, -9575.36, 46.4425, 60.2917, 100, 0),
(56625, 3, -9574.4, 57.7072, 60.9694, 100, 0),
(56625, 4, -9581.27, 61.9526, 61.5924, 100, 0),
(56625, 5, -9582.19, 57.5235, 61.5598, 100, 0),
(56625, 6, -9573.22, 55.109, 60.7786, 100, 0),
(56625, 7, -9562.44, 58.7552, 60.237, 100, 0),
(56625, 8, -9554.86, 68.119, 59.1309, 100, 0),
(56625, 9, -9553.75, 79.372, 59.0324, 100, 0),
(56625, 10, -9557.24, 88.6613, 59.0065, 100, 0),
(56625, 11, -9549.26, 93.6267, 59.0065, 100, 0),
(56625, 12, -9538.74, 89.6264, 59.0065, 100, 0),
(56625, 13, -9526.86, 85.964, 58.9329, 100, 0),
(56625, 14, -9515.2, 81.7789, 59.6269, 100, 0),
(56625, 15, -9504.11, 77.2859, 57.8536, 100, 0),
(56625, 16, -9492.49, 72.1215, 56.098, 100, 0),
(56625, 17, -9480.97, 65.3954, 56.31, 100, 0),
(56625, 18, -9469.44, 58.7708, 56.4992, 100, 0),
(56625, 19, -9458.37, 55.9505, 56.3491, 100, 0),
(56625, 20, -9453.54, 61.264, 55.9207, 100, 0),
(56625, 21, -9460.56, 66.5982, 56.2413, 100, 0),
(56625, 22, -9472.02, 68.2707, 56.3907, 100, 0),
(56625, 23, -9483.02, 73.8962, 56.3455, 100, 0),
(56625, 24, -9495.46, 74.8723, 56.4481, 100, 0),
(56625, 25, -9506.86, 78.1109, 58.6032, 100, 0),
(56625, 26, -9517.98, 84.3942, 59.3436, 100, 0),
(56625, 27, -9529.59, 88.1913, 58.9516, 100, 0),
(56625, 28, -9539.61, 95.543, 58.9866, 100, 0),
(56625, 29, -9545.48, 106.784, 59.071, 100, 0),
(56625, 30, -9548.48, 118.797, 59.2565, 100, 0),
(56625, 31, -9548.38, 131.102, 58.9597, 100, 0),
(56625, 32, -9543.12, 126.014, 59.2042, 100, 0),
(56625, 33, -9541.34, 114.956, 59.0332, 100, 0),
(56625, 34, -9540.89, 102.602, 59.1528, 100, 0),
(56625, 35, -9538.99, 89.9361, 59.0989, 100, 0),
(56625, 36, -9541.2, 77.9545, 59.0065, 100, 0),
(56625, 37, -9550.35, 70.3581, 59.2352, 100, 0),
(56625, 38, -9559.09, 61.4263, 60.006, 100, 0),
(56625, 39, -9568.32, 53.1292, 60.3528, 100, 0),
(56625, 40, -9568.45, 42.5114, 60.0803, 100, 0),
(56625, 41, -9561.53, 32.2363, 60.9041, 100, 0),
(56625, 42, -9566.65, 22.282, 61.4776, 100, 0),
(56625, 43, -9575.63, 16.3312, 60.4544, 100, 0),
(56625, 44, -9585.13, 21.0085, 60.3996, 100, 0),
(56625, 45, -9588.79, 29.5242, 60.2019, 100, 0);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES
(56625, 56625, 2, 6.25244, 11),
(56625, 56624, 2, 0, 11);
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1486001, 14860, 0, 1, 0, 100, 1, 30000, 45000, 30000, 45000, 1486001, 0, 0, 'Flik - Talk - OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1486001, 0, 39, 1486001, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Flik - Start Script');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1486001, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10148, 10147, 10145, 10146, 0, 0, 0, 0, 0, 'Flik - Talk');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1486001, 1, 16, 8353, 2, 0, 0, 14866, 10, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fliks Frog - Play Sound');

-- Elwynn Darkmoon Zoo Sounds
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 14829;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1482901, 14829, 0, 1, 0, 100, 1, 3000, 40000, 3000, 40000, 1482901, 0, 0, 'Yebb Neblegear - Play Sounds - OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1482901, 0, 39, 1482901, 1482902, 1482903, 1482904, 0, 0, 0, 0, 25, 25, 25, 25, 0, 0, 0, 0, 0, 'Yebb Neblegear - Start Script');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1482901, 0, 16, 8354, 2, 0, 0, 56612, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Khaz Modan Ram - Play Sound');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1482901, 0, 16, 8354, 2, 0, 0, 57168, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Khaz Modan Ram - Play Sound');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1482902, 0, 16, 8352, 2, 0, 0, 57163, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pygmy Cockatrice - Play Sound');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1482903, 0, 16, 8356, 2, 0, 0, 57441, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Felinni - Play Sound');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1482904, 0, 16, 8355, 2, 0, 0, 56323, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hornsley - Play Sound');

-- Elwynn Silas Darkmoon Waypoints and Scripts
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(56600, 1, -9530.5, 80.2025, 58.8821, 0.20944, 5000, 0, 1482301),
(56600, 2, -9527.15, 82.1972, 58.8825, 100, 0, 0, 0),
(56600, 3, -9530.15, 87.5633, 58.8818, 100, 0, 0, 0),
(56600, 4, -9534.1, 88.4057, 58.882, 100, 0, 0, 0),
(56600, 5, -9537.35, 90.3927, 58.887, 100, 0, 0, 0),
(56600, 6, -9541.47, 97.2985, 58.9402, 100, 0, 0, 0),
(56600, 7, -9543.33, 100.868, 59.2083, 100, 0, 0, 0),
(56600, 8, -9544.26, 104.777, 59.3098, 100, 0, 0, 0),
(56600, 9, -9544.69, 108.763, 58.9851, 100, 0, 0, 0),
(56600, 10, -9544.88, 112.797, 58.9596, 100, 0, 0, 0),
(56600, 11, -9545.73, 122.049, 59.3392, 100, 50000, 0, 1482302),
(56600, 12, -9548.98, 122.923, 59.1685, 100, 0, 0, 0),
(56600, 13, -9549.59, 119.046, 59.1185, 100, 0, 0, 0),
(56600, 14, -9548.9, 115.057, 59.0088, 100, 0, 0, 0),
(56600, 15, -9547.82, 111.168, 58.8986, 100, 0, 0, 0),
(56600, 16, -9546.38, 107.413, 59.0617, 100, 0, 0, 0),
(56600, 17, -9546.63, 103.384, 59.2445, 100, 0, 0, 0),
(56600, 18, -9547.97, 99.6789, 58.9806, 100, 0, 0, 0),
(56600, 19, -9550.97, 97.2432, 58.8818, 100, 0, 0, 0),
(56600, 20, -9554.95, 97.1711, 58.8825, 100, 0, 0, 0),
(56600, 21, -9558.96, 97.0413, 58.8833, 100, 0, 0, 0),
(56600, 22, -9562.8, 95.7671, 58.8815, 100, 0, 0, 0),
(56600, 23, -9566.04, 93.462, 58.8825, 100, 0, 0, 0),
(56600, 24, -9568.07, 89.9848, 58.8823, 100, 0, 0, 0),
(56600, 25, -9568.67, 86.0765, 58.8821, 100, 0, 0, 0),
(56600, 26, -9567.67, 82.2198, 58.8819, 100, 0, 0, 0),
(56600, 27, -9564.81, 79.4411, 58.8819, 100, 0, 0, 0),
(56600, 28, -9561.18, 77.7701, 58.8822, 100, 0, 0, 0),
(56600, 29, -9557.39, 78.4318, 58.8827, 100, 0, 0, 0),
(56600, 30, -9554.66, 81.3076, 58.8819, 100, 0, 0, 0),
(56600, 31, -9551.66, 83.6935, 59.1167, 100, 0, 0, 0),
(56600, 32, -9543.25, 83.1796, 59.357, 100, 60000, 0, 1482303),
(56600, 33, -9547.21, 83.4137, 59.4403, 100, 0, 0, 0),
(56600, 34, -9551.38, 83.3604, 59.0668, 100, 0, 0, 0),
(56600, 35, -9554.29, 81.6836, 58.8818, 100, 0, 0, 0),
(56600, 36, -9555.42, 78.1126, 58.8827, 100, 0, 0, 0),
(56600, 37, -9554, 74.4676, 58.8833, 100, 0, 0, 0),
(56600, 38, -9550.76, 72.4111, 58.9634, 100, 0, 0, 0),
(56600, 39, -9546.81, 73.0513, 58.8997, 100, 0, 0, 0),
(56600, 40, -9543.22, 74.8442, 58.8855, 100, 0, 0, 0),
(56600, 41, -9540.01, 77.279, 58.899, 100, 0, 0, 0),
(56600, 42, -9536.56, 79.3169, 58.882, 100, 0, 0, 0),
(56600, 43, -9530.92, 80.2141, 58.8823, 100, 0, 0, 0),
(56600, 44, -9530.5, 80.2025, 58.8821, 0.20944, 72000, 0, 0);
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1482301, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10154, 10155, 10156, 10157, 0, 0, 0, 0, 0, 'Silas Darkmoon - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1482302, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10153, 0, 0, 0, 0, 0, 0, 0, 0, 'Silas Darkmoon - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1482303, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10158, 10160, 10157, 10156, 0, 0, 0, 0, 0, 'Silas Darkmoon - Talk');
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES
(56600, 56600, 6, 6.25244, 11),
(56600, 56611, 6, 3.14, 11);
UPDATE `creature` SET `position_x` = -9530.5, `position_y` = 80.2025, `position_z` = 58.8821, `orientation` = 0.20944, `movement_type` = 2, `ai_name` = '' WHERE `guid` = 56600;
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1482321, 1482322);
DELETE FROM `creature_ai_events` WHERE `creature_id`=14823;

-- Elwynn Darkmoon Carnie Talk OOC
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 14849;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1484901, 14849, 510, 1, 0, 100, 1, 45000, 72000, 45000, 72000, 1484901, 0, 0, 'Darkmoon Faire Carnie - Talk - OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1484901, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10101, 10102, 10103, 10104, 0, 0, 0, 0, 0, 'Darkmoon Faire Carnie - Talk');
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (510, 52, 56680, 56613, 0, 0, 0);

-- Morja Talk OOC
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1487102, 14871, 0, 1, 0, 100, 1, 30000, 72000, 30000, 72000, 1487102, 0, 0, 'Morja - Talk - OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1487102, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10171, 0, 0, 0, 0, 0, 0, 0, 0, 'Morja - Talk');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
