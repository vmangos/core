DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200706205532');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200706205532');
-- Add your query below.


-- grom gol base camp
-- add missing grom gol grunt
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `display_id`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(94748, 1064, 0, 0, 0, 0, 0, 0, -12384.4, 173.336, 3.24808, 1.01615, 300, 300, 0, 100, 0, 2, 0, 0, 0, 10);

-- add grom gol grunt waypoints
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(94748, 1, -12369, 154.027, 2.97559, 100, 50000, 0, 0),
(94748, 2, -12371.6, 155.394, 2.81416, 100, 0, 0, 0),
(94748, 3, -12374.4, 156.719, 2.84573, 100, 0, 0, 0),
(94748, 4, -12380.2, 158.36, 2.84261, 100, 0, 0, 0),
(94748, 5, -12388.9, 157.468, 2.67425, 100, 0, 0, 0),
(94748, 6, -12393.7, 153.945, 2.73388, 100, 0, 0, 0),
(94748, 7, -12396.6, 148.972, 2.8709, 100, 0, 0, 0),
(94748, 8, -12396.6, 138.978, 3.66229, 100, 13000, 0, 0),
(94748, 9, -12397.1, 140.612, 3.55516, 100, 0, 0, 0),
(94748, 10, -12397.2, 146.16, 3.04669, 100, 0, 0, 0),
(94748, 11, -12396.1, 152.329, 2.80381, 100, 0, 0, 0),
(94748, 12, -12390.6, 163.016, 2.46791, 100, 0, 0, 0),
(94748, 13, -12384.4, 173.336, 3.14583, 100, 13000, 0, 0);

-- add missing grom gol grunt
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `display_id`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(94749, 1064, 0, 0, 0, 0, 0, 0, -12372.8, 179.325, 3.28885, 2.89725, 300, 300, 0, 100, 0, 0, 0, 0, 0, 10);

-- add missing grom gol grunt
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `display_id`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(94750, 1064, 0, 0, 0, 0, 0, 0, -12374, 184.474, 3.24808, 3.34054, 300, 300, 0, 100, 0, 0, 0, 0, 0, 10);

-- add correct waypoints to grom gol grunt
DELETE FROM `creature_movement` WHERE `id` = 610;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(610, 1, -12383.7, 227.084, 2.67865, 100, 13000, 0, 0),
(610, 2, -12384.2, 224.195, 2.64434, 100, 0, 0, 0),
(610, 3, -12383.3, 215.205, 2.3636, 100, 0, 0, 0),
(610, 4, -12383.4, 206.133, 2.02113, 100, 0, 0, 0),
(610, 5, -12383.7, 203.173, 1.99872, 100, 0, 0, 0),
(610, 6, -12385, 200.433, 2.13383, 100, 0, 0, 0),
(610, 7, -12386.6, 197.907, 2.20216, 100, 0, 0, 0),
(610, 8, -12391.9, 195.553, 1.84427, 3.03687, 78000, 0, 0),
(610, 9, -12386.6, 197.907, 2.20216, 100, 0, 0, 0),
(610, 10, -12385, 200.433, 2.13383, 100, 0, 0, 0),
(610, 11, -12383.7, 203.173, 1.99872, 100, 0, 0, 0),
(610, 12, -12383.4, 206.133, 2.02113, 100, 0, 0, 0),
(610, 13, -12383.3, 215.205, 2.3636, 100, 0, 0, 0),
(610, 14, -12384.2, 224.195, 2.64434, 100, 0, 0, 0);

-- commander aggro gosh should roam
UPDATE `creature` SET `movement_type` = 1, `wander_distance` = 3 WHERE `guid` = 721;


-- rebel camp
-- add rebel watchman waypoints
UPDATE `creature` SET `movement_type` = 2 WHERE `id` = 754;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(754, 1, -11324, -213.783, 76.5032, 2.25148, 87000, 0, 0),
(754, 2, -11327.2, -212.021, 75.9563, 100, 0, 0, 0),
(754, 3, -11334.8, -209.889, 75.2551, 100, 0, 0, 0),
(754, 4, -11342.8, -210.905, 75.2215, 100, 0, 0, 0),
(754, 5, -11346.8, -210.962, 75.2223, 100, 0, 0, 0),
(754, 6, -11354.8, -210.423, 75.2585, 100, 0, 0, 0),
(754, 7, -11366.8, -212.733, 75.2209, 100, 0, 0, 0),
(754, 8, -11370.6, -213.99, 75.2973, 100, 0, 0, 0),
(754, 9, -11376.5, -219.242, 75.0468, 100, 0, 0, 0),
(754, 10, -11379.7, -226.428, 73.4426, 100, 0, 0, 0),
(754, 11, -11381.6, -237.335, 68.7688, 100, 0, 0, 0),
(754, 12, -11382.6, -248.607, 65.2183, 100, 25000, 0, 0),
(754, 13, -11381.9, -240.936, 67.6475, 100, 0, 0, 0),
(754, 14, -11379.7, -229.946, 72.1583, 100, 0, 0, 0),
(754, 15, -11378.7, -226.508, 73.5829, 100, 0, 0, 0),
(754, 16, -11375.4, -219.386, 75.0807, 100, 0, 0, 0),
(754, 17, -11373, -216.171, 75.2465, 100, 0, 0, 0),
(754, 18, -11365.7, -212.828, 75.2215, 100, 0, 0, 0),
(754, 19, -11353.7, -211.491, 75.2339, 100, 0, 0, 0),
(754, 20, -11345.6, -211.416, 75.2236, 100, 0, 0, 0),
(754, 21, -11337.5, -210.781, 75.2219, 100, 0, 0, 0),
(754, 22, -11333.4, -210.355, 75.283, 100, 0, 0, 0);

-- add private merle waypoints
UPDATE `creature` SET `movement_type` = 2 WHERE `id` = 1421;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(1421, 1, -11330.7, -248.137, 73.1889, 100, 20000, 0, 0),
(1421, 2, -11329.2, -244.447, 73.9503, 100, 0, 0, 0),
(1421, 3, -11328.6, -240.528, 74.545, 100, 0, 0, 0),
(1421, 4, -11327.2, -232.493, 75.1051, 100, 0, 0, 0),
(1421, 5, -11328, -229.059, 75.277, 100, 0, 0, 0),
(1421, 6, -11330.1, -225.739, 75.1965, 100, 0, 0, 0),
(1421, 7, -11329.8, -221.863, 75.2206, 100, 0, 0, 0),
(1421, 8, -11328.1, -218.944, 75.881, 100, 0, 0, 0),
(1421, 9, -11329.4, -211.039, 75.7732, 100, 0, 0, 0),
(1421, 10, -11330.4, -207.144, 75.4199, 100, 0, 0, 0),
(1421, 11, -11330.1, -201.702, 75.3271, 100, 20000, 0, 0),
(1421, 12, -11334.5, -208.484, 75.3069, 100, 0, 0, 0),
(1421, 13, -11336.9, -211.741, 75.2205, 100, 0, 0, 0),
(1421, 14, -11338.2, -215.378, 75.2206, 100, 0, 0, 0),
(1421, 15, -11337.6, -219.402, 75.2172, 100, 0, 0, 0),
(1421, 16, -11337.8, -227.284, 74.5209, 100, 10000, 0, 0),
(1421, 17, -11334.1, -225.796, 75.0422, 100, 0, 0, 0),
(1421, 18, -11331.2, -228.612, 74.9793, 100, 0, 0, 0),
(1421, 19, -11329.7, -232.287, 74.9004, 100, 0, 0, 0),
(1421, 20, -11329.3, -236.289, 74.723, 100, 0, 0, 0),
(1421, 21, -11330.2, -240.199, 74.323, 100, 0, 0, 0);












-- add private thorsen waypoints and scripts ** delete old creature movement scripts
UPDATE `creature` SET `position_x` = -11313.9, `position_y` = -202.766, `position_z` = 75.395 WHERE `id` = 738;
UPDATE `creature_template` SET `npc_flags` = 1 WHERE `entry` = 738;
DELETE FROM `creature_movement` WHERE `id` = 2243;INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(738, 1, -11313.9, -202.766, 75.395, 100, 0, 0, 73801),
(738, 2, -11316.8, -203.916, 75.316, 100, 0, 0, 0),
(738, 3, -11324.6, -212.077, 76.2363, 100, 0, 0, 0),
(738, 4, -11328.2, -218.913, 75.8114, 100, 0, 0, 0),
(738, 5, -11333.7, -223.069, 75.2037, 100, 0, 0, 0),
(738, 6, -11347.6, -215.984, 75.2442, 100, 0, 0, 0),
(738, 7, -11358.6, -212.341, 75.2207, 100, 0, 0, 0),
(738, 8, -11370, -215.514, 75.2442, 100, 0, 0, 0),
(738, 9, -11377.6, -223.995, 74.3537, 100, 0, 0, 0),
(738, 10, -11379.3, -234.53, 70.0932, 100, 0, 0, 0),
(738, 11, -11381.5, -249.342, 65.1676, 100, 0, 0, 0),
(738, 12, -11384.3, -264.911, 61.4105, 100, 0, 0, 0),
(738, 13, -11389.4, -273.725, 59.6832, 100, 1000, 0, 73802),
(738, 14, -11396.6, -284.985, 58.3481, 100, 0, 0, 0),
(738, 15, -11415.7, -287.402, 53.9826, 100, 0, 0, 0),
(738, 16, -11426.8, -287.418, 50.4211, 100, 0, 0, 0),
(738, 17, -11448.8, -287.209, 43.3921, 100, 0, 0, 0),
(738, 18, -11480.8, -294.045, 36.0647, 100, 0, 0, 0),
(738, 19, -11506.7, -313.858, 35.807, 100, 0, 0, 0),
(738, 20, -11516.2, -320.712, 35.7982, 100, 0, 0, 0),
(738, 21, -11524.1, -328.567, 35.7574, 100, 0, 0, 0),
(738, 22, -11527.6, -353.22, 37.7469, 100, 30000, 0, 73803),
(738, 23, -11527.6, -353.22, 37.7469, 100, 1000, 0, 73804),
(738, 24, -11523.1, -344.517, 37.5403, 100, 0, 0, 0),
(738, 25, -11508.1, -315.891, 35.7581, 100, 0, 0, 0),
(738, 26, -11480.8, -294.045, 36.0666, 100, 0, 0, 0),
(738, 27, -11459.6, -288.214, 40.3782, 100, 0, 0, 0),
(738, 28, -11426.2, -287.765, 50.558, 100, 0, 0, 0),
(738, 29, -11403.8, -286.564, 56.93, 100, 0, 0, 0),
(738, 30, -11396.6, -284.985, 58.3481, 100, 0, 0, 0),
(738, 31, -11384.7, -257.563, 62.7445, 100, 1000, 0, 73805),
(738, 32, -11383.4, -249.876, 64.8444, 100, 0, 0, 0),
(738, 33, -11382.6, -242.23, 67.2165, 100, 0, 0, 0),
(738, 34, -11382.2, -234.665, 69.8806, 100, 0, 0, 0),
(738, 35, -11380.8, -227.514, 73.12, 100, 0, 0, 0),
(738, 36, -11379.2, -224.26, 74.126, 100, 0, 0, 0),
(738, 37, -11374.4, -217.811, 75.21, 100, 0, 0, 0),
(738, 38, -11368.3, -212.911, 75.2508, 100, 0, 0, 0),
(738, 39, -11360.5, -210.667, 75.2206, 100, 0, 0, 0),
(738, 40, -11356.5, -210.498, 75.2252, 100, 0, 0, 0),
(738, 41, -11348.4, -210.834, 75.2222, 100, 0, 0, 0),
(738, 42, -11344.3, -210.761, 75.2211, 100, 0, 0, 0),
(738, 43, -11336.4, -209.551, 75.2204, 100, 0, 0, 0),
(738, 44, -11328.8, -206.55, 75.391, 100, 0, 0, 0),
(738, 45, -11318.5, -202.401, 75.6196, 100, 0, 0, 0),
(738, 46, -11313.9, -202.766, 75.395, 100, 30000, 0, 73806);


INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (73801, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 102, 0, 0, 0, 0, 0, 0, 0, 0, 'Private Thorsen - Speak');

INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (73802, 0, 25, 1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Private Thorsen - Run');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (73802, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 103, 0, 0, 0, 0, 0, 0, 0, 0, 'Private Thorsen - Speak');

INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (73803, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 'Private Thorsen - Speak');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (73803, 1, 10, 775, 198000, 0, 0, 0, 0, 0, 0, 1, 77501, 6, 7, -11516.7, -434.378, 40.5358, 0, 0, 'Private Thorsen - Summon Kurzens Agent');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (73803, 2, 10, 775, 198000, 0, 0, 0, 0, 0, 0, 1, 77502, 6, 7, -11516.7, -434.378, 40.5358, 0, 0, 'Private Thorsen - Summon Kurzens Agent 2');

INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (73804, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 105, 0, 0, 0, 0, 0, 0, 0, 0, 'Private Thorsen - Speak');

INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (73805, 0, 25, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Private Thorsen - Walk');

INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (73806, 0, 35, 0, 0, 0, 0, 1398, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Private Thorsen - Orientation');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (73806, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 106, 0, 0, 0, 0, 0, 0, 0, 0, 'Private Thorsen - Speak');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (73806, 7, 39, 73301, 0, 0, 0, 1398, 0, 9, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Private Thorsen - Start Script Sergeant Yohwa 73301');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (73301, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 108, 0, 0, 0, 0, 0, 0, 0, 0, 'Sergeant Yohwa - Speak');


















-- add kurzens agent 1 waypoints and scripts
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (77501, 0, 60, 3, 0, 0, 0, 0, 0, 0, 0, 0, 77501, 0, 0, 0, 0, 0, 0, 0, 'Kurzens Agent - Start Waypoints');

INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(77501, 1, -11516.7, -434.378, 40.5358, 100, 0, 0, 77501),
(77501, 2, -11516, -424.896, 38.3987, 100, 0, 0, 0),
(77501, 3, -11517.3, -405.868, 37.0146, 100, 0, 0, 0),
(77501, 4, -11519, -397.098, 37.9161, 100, 2000, 0, 77502),
(77501, 5, -11519.3, -389.269, 39.008, 100, 0, 0, 0),
(77501, 6, -11517.6, -380.275, 39.3757, 100, 0, 0, 0),
(77501, 7, -11515.9, -371.952, 38.6723, 100, 0, 0, 0),
(77501, 8, -11517.8, -363.71, 38.0627, 100, 0, 0, 0),
(77501, 9, -11518.9, -358.243, 37.6753, 100, 30000, 0, 77503),
(77501, 10, -11518.3, -361.352, 37.8621, 100, 0, 0, 0),
(77501, 11, -11517.1, -377.9, 39.1602, 100, 0, 0, 0),
(77501, 12, -11518.4, -384.31, 39.5131, 100, 0, 0, 0),
(77501, 13, -11519.5, -393.299, 38.4269, 100, 0, 0, 0),
(77501, 14, -11518.4, -400.074, 37.6105, 100, 0, 0, 0),
(77501, 15, -11515.5, -415.856, 37.4521, 100, 0, 0, 0),
(77501, 16, -11516.7, -434.378, 40.5358, 100, 0, 0, 77505);

INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (77501, 0, 22, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurzens Agent - Set Faction');

INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (77502, 0, 25, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurzens Agent - Walk');

INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (77503, 0, 22, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurzens Agent - Set Faction');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (77503, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 24, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurzens Agent - Speak');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (77503, 1, 26, 0, 0, 0, 0, 738, 20, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurzens Agent - Attack');

INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (77505, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurzens Agent - Despawn');




-- add kurzens agent 2 waypoints and scripts
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (77502, 0, 60, 3, 0, 0, 0, 0, 0, 0, 0, 0, 77502, 0, 0, 0, 0, 0, 0, 0, 'Kurzens Agent 2 - Start Waypoints');

INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(77502, 1, -11516.7, -434.378, 40.5358, 100, 0, 0, 77501),
(77502, 2, -11516, -424.896, 38.3987, 100, 0, 0, 0),
(77502, 3, -11517.3, -405.868, 37.0146, 100, 0, 0, 0),
(77502, 4, -11518.4, -400.074, 37.6105, 100, 2000, 0, 77502),
(77502, 5, -11519, -397.098, 37.9161, 100, 0, 0, 0),
(77502, 6, -11519.3, -389.269, 39.008, 100, 0, 0, 0),
(77502, 7, -11517.6, -380.275, 39.3757, 100, 0, 0, 0),
(77502, 8, -11515.9, -371.952, 38.6723, 100, 0, 0, 0),
(77502, 9, -11517.8, -363.71, 38.0627, 100, 0, 0, 0),
(77502, 10, -11518.3, -361.352, 37.8621, 100, 30000, 0, 77504),
(77502, 11, -11517.1, -377.9, 39.1602, 100, 0, 0, 0),
(77502, 12, -11518.4, -384.31, 39.5131, 100, 0, 0, 0),
(77502, 13, -11519.5, -393.299, 38.4269, 100, 0, 0, 0),
(77502, 14, -11518.4, -400.074, 37.6105, 100, 0, 0, 0),
(77502, 15, -11515.5, -415.856, 37.4521, 100, 0, 0, 0),
(77502, 16, -11516.7, -434.378, 40.5358, 100, 0, 0, 77505);


INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (77504, 0, 22, 39, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurzens Agent - Set Faction');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (77504, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 101, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurzens Agent - Speak');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (77504, 1, 26, 0, 0, 0, 0, 738, 20, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurzens Agent - Attack');






























-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
