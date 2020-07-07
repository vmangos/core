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


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
