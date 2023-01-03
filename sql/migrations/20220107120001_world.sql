DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220107120001');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220107120001');
-- Add your query below.


SET @PYREWOOD_EVENT = 49;
SET @PYREWOOD_VILLAGE_CGUID = 57441;

-- New Event for Pyrewood starts 21:00, ends 05:30 (confirmed by ptr).
INSERT INTO `game_event` (`entry`, `start_time`, `end_time`, `occurence`, `length`, `holiday`, `description`, `hardcoded`, `disabled`, `patch_min`, `patch_max`) VALUES 
(@PYREWOOD_EVENT, '2020-01-02 21:00:00', '2030-12-31 05:30:00', 1440, 480, 0, 'Pyrewood Village Night', 0, 0, 0, 10);

UPDATE `creature_template` SET `script_name`='' WHERE `entry` IN (1891, 1894, 1895, 3528, 3532, 3530);

-- Remove old Waypoints.
DELETE FROM `creature_movement` WHERE `id` IN (18408, 19220, 18235, 18405);

-- Pyrewood Spawns.
DELETE FROM `creature` WHERE `id` IN (1891, 1894, 1895, 3528, 3532, 2106, 3530);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@PYREWOOD_VILLAGE_CGUID+1, 1891, 0, 0, 0, 0, -405.033, 1458.8, 27.0968, 0.15708, 300, 500, 0, 100, 100, 0, 0, 0, 0, 10),
(@PYREWOOD_VILLAGE_CGUID+2, 1891, 0, 0, 0, 0, -377.63, 1491.95, 18.4887, 5.32325, 300, 500, 0, 100, 100, 0, 0, 0, 0, 10),
(@PYREWOOD_VILLAGE_CGUID+3, 1891, 0, 0, 0, 0, -354.378, 1421.62, 28.2597, 5.14872, 300, 500, 0, 100, 100, 0, 0, 0, 0, 10),
(@PYREWOOD_VILLAGE_CGUID+4, 1891, 0, 0, 0, 0, -350.427, 1448.5, 24.4337, 4.72984, 300, 500, 0, 100, 100, 0, 0, 0, 0, 10),
(@PYREWOOD_VILLAGE_CGUID+5, 1894, 0, 0, 0, 0, -411.642, 1509.01, 19.8575, 1.55334, 300, 500, 0, 100, 100, 0, 0, 0, 0, 10),
(@PYREWOOD_VILLAGE_CGUID+6, 1894, 0, 0, 0, 0, -404.028, 1460.9, 31.7653, 5.84685, 300, 500, 0, 100, 100, 0, 0, 0, 0, 10),
(@PYREWOOD_VILLAGE_CGUID+7, 1894, 0, 0, 0, 0, -384.993, 1619, 24.3721, 5.70723, 300, 500, 0, 100, 100, 0, 0, 0, 0, 10),
(@PYREWOOD_VILLAGE_CGUID+8, 1894, 0, 0, 0, 0, -380.605, 1435.24, 25.8672, 5.98648, 300, 500, 0, 100, 100, 0, 0, 0, 0, 10),
(@PYREWOOD_VILLAGE_CGUID+9, 1894, 0, 0, 0, 0, -372.427, 1611.08, 24.3721, 1.32645, 300, 500, 0, 100, 100, 0, 0, 0, 0, 10),
(@PYREWOOD_VILLAGE_CGUID+10, 1894, 0, 0, 0, 0, -341.711, 1553.34, 24.5273, 3.26377, 300, 500, 0, 100, 100, 0, 0, 0, 0, 10),
(@PYREWOOD_VILLAGE_CGUID+11, 1895, 0, 0, 0, 0, -414.124, 1581.03, 19.7275, 6.10865, 300, 500, 0, 100, 100, 0, 0, 0, 0, 10),
(@PYREWOOD_VILLAGE_CGUID+12, 1895, 0, 0, 0, 0, -407.955, 1451.33, 27.0859, 0.767945, 300, 500, 0, 100, 100, 0, 0, 0, 0, 10),
(@PYREWOOD_VILLAGE_CGUID+13, 1895, 0, 0, 0, 0, -391.907, 1432.23, 27.0313, 6.07375, 300, 500, 0, 100, 100, 0, 0, 0, 0, 10),
(@PYREWOOD_VILLAGE_CGUID+14, 3528, 0, 0, 0, 0, -345.967, 1501.4, 18.9875, 0.942478, 300, 500, 0, 100, 100, 0, 0, 0, 0, 10),
(@PYREWOOD_VILLAGE_CGUID+15, 3532, 0, 0, 0, 0, -408.091, 1604.03, 18.2868, 5.5676, 300, 500, 0, 100, 100, 0, 0, 0, 0, 10),
(@PYREWOOD_VILLAGE_CGUID+16, 1891, 0, 0, 0, 0, -437.024, 1518.34, 19.7294, 2.33874, 300, 500, 5, 100, 100, 1, 0, 0, 0, 10),
(@PYREWOOD_VILLAGE_CGUID+17, 1891, 0, 0, 0, 0, -433.638, 1561.48, 19.8977, 1.90976, 300, 500, 5, 100, 100, 1, 0, 0, 0, 10),
(@PYREWOOD_VILLAGE_CGUID+18, 1891, 0, 0, 0, 0, -431.538, 1532.87, 18.8873, 2.88798, 300, 500, 5, 100, 100, 1, 0, 0, 0, 10),
(@PYREWOOD_VILLAGE_CGUID+19, 1891, 0, 0, 0, 0, -415.366, 1577.38, 19.7275, 0.394142, 300, 500, 5, 100, 100, 1, 0, 0, 0, 10),
(@PYREWOOD_VILLAGE_CGUID+20, 1891, 0, 0, 0, 0, -381.301, 1653.14, 17.7911, 4.4855, 300, 500, 5, 100, 100, 1, 0, 0, 0, 10),
(@PYREWOOD_VILLAGE_CGUID+21, 1891, 0, 0, 0, 0, -361.425, 1545.7, 24.6417, 4.93474, 300, 500, 5, 100, 100, 1, 0, 0, 0, 10),
(@PYREWOOD_VILLAGE_CGUID+22, 1891, 0, 0, 0, 0, -358.181, 1526.49, 25.0173, 1.7417, 300, 500, 5, 100, 100, 1, 0, 0, 0, 10),
(@PYREWOOD_VILLAGE_CGUID+23, 1891, 0, 0, 0, 0, -348.812, 1609.69, 17.1646, 4.9669, 300, 500, 5, 100, 100, 1, 0, 0, 0, 10),
(@PYREWOOD_VILLAGE_CGUID+24, 1891, 0, 0, 0, 0, -344.731, 1601.18, 17.1646, 3.62542, 300, 500, 5, 100, 100, 1, 0, 0, 0, 10),
(@PYREWOOD_VILLAGE_CGUID+25, 1894, 0, 0, 0, 0, -442.455, 1540.19, 19.8201, 0.0755034, 300, 500, 5, 100, 100, 1, 0, 0, 0, 10),
(@PYREWOOD_VILLAGE_CGUID+26, 1894, 0, 0, 0, 0, -411.187, 1452.8, 31.8624, 3.32118, 300, 500, 5, 100, 100, 1, 0, 0, 0, 10),
(@PYREWOOD_VILLAGE_CGUID+27, 1894, 0, 0, 0, 0, -391.615, 1601.72, 17.1706, 4.86947, 300, 500, 0, 100, 100, 0, 0, 0, 0, 10),
(@PYREWOOD_VILLAGE_CGUID+28, 1894, 0, 0, 0, 0, -385.389, 1633.27, 24.3721, 3.90805, 300, 500, 5, 100, 100, 1, 0, 0, 0, 10),
(@PYREWOOD_VILLAGE_CGUID+29, 1894, 0, 0, 0, 0, -378.287, 1655.98, 10.346, 2.89725, 300, 500, 5, 100, 100, 1, 0, 0, 0, 10),
(@PYREWOOD_VILLAGE_CGUID+30, 1894, 0, 0, 0, 0, -357.722, 1579.81, 18.2309, 2.46913, 300, 500, 5, 100, 100, 1, 0, 0, 0, 10),
(@PYREWOOD_VILLAGE_CGUID+31, 1894, 0, 0, 0, 0, -338.921, 1548.58, 30.2342, 4.5815, 300, 500, 5, 100, 100, 1, 0, 0, 0, 10),
(@PYREWOOD_VILLAGE_CGUID+32, 1894, 0, 0, 0, 0, -332.725, 1549.87, 25.4698, 0.279574, 300, 500, 5, 100, 100, 1, 0, 0, 0, 10),
(@PYREWOOD_VILLAGE_CGUID+33, 1895, 0, 0, 0, 0, -424.202, 1543.84, 18.672, 6.17847, 300, 500, 5, 100, 100, 1, 0, 0, 0, 10),
(@PYREWOOD_VILLAGE_CGUID+34, 1895, 0, 0, 0, 0, -419.38, 1579.96, 24.4925, 2.7679, 300, 500, 5, 100, 100, 1, 0, 0, 0, 10),
(@PYREWOOD_VILLAGE_CGUID+35, 1895, 0, 0, 0, 0, -410.145, 1580.45, 24.4956, 1.94441, 300, 500, 5, 100, 100, 1, 0, 0, 0, 10),
(@PYREWOOD_VILLAGE_CGUID+36, 1895, 0, 0, 0, 0, -379.518, 1624.61, 17.0644, 2.95271, 300, 500, 5, 100, 100, 1, 0, 0, 0, 10),
(@PYREWOOD_VILLAGE_CGUID+37, 1895, 0, 0, 0, 0, -344.082, 1504.01, 18.9795, 4.18879, 300, 500, 5, 100, 100, 1, 0, 0, 0, 10),
(@PYREWOOD_VILLAGE_CGUID+38, 1895, 0, 0, 0, 0, -324.423, 1550.48, 25.4598, 4.91264, 300, 500, 5, 100, 100, 1, 0, 0, 0, 10),
(@PYREWOOD_VILLAGE_CGUID+39, 2106, 0, 0, 0, 0, -387.331, 1648.79, 24.3721, 1.03501, 300, 500, 5, 100, 100, 1, 0, 0, 0, 10),
(@PYREWOOD_VILLAGE_CGUID+40, 1891, 0, 0, 0, 0, -385.642, 1573.14, 17.1813, 5.10274, 300, 500, 5, 100, 100, 2, 0, 0, 0, 10),
(@PYREWOOD_VILLAGE_CGUID+41, 1891, 0, 0, 0, 0, -343.315, 1553.08, 24.5102, 3.56684, 300, 500, 5, 100, 100, 2, 0, 0, 0, 10),
(@PYREWOOD_VILLAGE_CGUID+42, 1894, 0, 0, 0, 0, -398.426, 1568.85, 18.2377, 1.09189, 300, 500, 5, 100, 100, 2, 0, 0, 0, 10),
(@PYREWOOD_VILLAGE_CGUID+43, 1894, 0, 0, 0, 0, -390.535, 1466.63, 26.2123, 5.34071, 300, 500, 5, 100, 100, 2, 0, 0, 0, 10),
(@PYREWOOD_VILLAGE_CGUID+44, 1894, 0, 0, 0, 0, -384.632, 1633.15, 17.5142, 2.82134, 300, 500, 5, 100, 100, 2, 0, 0, 0, 10),
(@PYREWOOD_VILLAGE_CGUID+45, 1894, 0, 0, 0, 0, -383.289, 1572.77, 17.2272, 0.174533, 300, 500, 5, 100, 100, 2, 0, 0, 0, 10),
(@PYREWOOD_VILLAGE_CGUID+46, 1895, 0, 0, 0, 0, -411.947, 1517.76, 19.8526, 1.55015, 300, 500, 5, 100, 100, 2, 0, 0, 0, 10),
(@PYREWOOD_VILLAGE_CGUID+47, 1895, 0, 0, 0, 0, -356.325, 1532.82, 25.1199, 1.67968, 300, 500, 5, 100, 100, 2, 0, 0, 0, 10),
(@PYREWOOD_VILLAGE_CGUID+48, 3530, 0, 0, 0, 0, -328.988, 1531.25, 18.1693, 0.541183, 300, 500, 5, 100, 100, 2, 0, 0, 0, 10),
(@PYREWOOD_VILLAGE_CGUID+49, 1895, 0, 0, 0, 0, -329.456, 1545.74, 30.1367, 2.26893, 300, 500, 0, 100, 100, 0, 0, 0, 0, 10);

INSERT INTO `game_event_creature_data` (`guid`, `patch`, `entry_id`, `display_id`, `equipment_id`, `spell_start`, `spell_end`, `event`) VALUES
(@PYREWOOD_VILLAGE_CGUID+1, 0, 1892, 0, 0, 0, 0, 49),
(@PYREWOOD_VILLAGE_CGUID+2, 0, 1892, 0, 0, 0, 0, 49),
(@PYREWOOD_VILLAGE_CGUID+3, 0, 1892, 0, 0, 0, 0, 49),
(@PYREWOOD_VILLAGE_CGUID+4, 0, 1892, 0, 0, 0, 0, 49),
(@PYREWOOD_VILLAGE_CGUID+5, 0, 1893, 0, 0, 0, 0, 49),
(@PYREWOOD_VILLAGE_CGUID+6, 0, 1893, 0, 0, 0, 0, 49),
(@PYREWOOD_VILLAGE_CGUID+7, 0, 1893, 0, 0, 0, 0, 49),
(@PYREWOOD_VILLAGE_CGUID+8, 0, 1893, 0, 0, 0, 0, 49),
(@PYREWOOD_VILLAGE_CGUID+9, 0, 1893, 0, 0, 0, 0, 49),
(@PYREWOOD_VILLAGE_CGUID+10, 0, 1893, 0, 0, 0, 0, 49),
(@PYREWOOD_VILLAGE_CGUID+11, 0, 1896, 0, 0, 0, 0, 49),
(@PYREWOOD_VILLAGE_CGUID+12, 0, 1896, 0, 0, 0, 0, 49),
(@PYREWOOD_VILLAGE_CGUID+13, 0, 1896, 0, 0, 0, 0, 49),
(@PYREWOOD_VILLAGE_CGUID+14, 0, 3529, 0, 0, 0, 0, 49),
(@PYREWOOD_VILLAGE_CGUID+15, 0, 3533, 0, 0, 0, 0, 49),
(@PYREWOOD_VILLAGE_CGUID+16, 0, 1892, 0, 0, 0, 0, 49),
(@PYREWOOD_VILLAGE_CGUID+17, 0, 1892, 0, 0, 0, 0, 49),
(@PYREWOOD_VILLAGE_CGUID+18, 0, 1892, 0, 0, 0, 0, 49),
(@PYREWOOD_VILLAGE_CGUID+19, 0, 1892, 0, 0, 0, 0, 49),
(@PYREWOOD_VILLAGE_CGUID+20, 0, 1892, 0, 0, 0, 0, 49),
(@PYREWOOD_VILLAGE_CGUID+21, 0, 1892, 0, 0, 0, 0, 49),
(@PYREWOOD_VILLAGE_CGUID+22, 0, 1892, 0, 0, 0, 0, 49),
(@PYREWOOD_VILLAGE_CGUID+23, 0, 1892, 0, 0, 0, 0, 49),
(@PYREWOOD_VILLAGE_CGUID+24, 0, 1892, 0, 0, 0, 0, 49),
(@PYREWOOD_VILLAGE_CGUID+25, 0, 1893, 0, 0, 0, 0, 49),
(@PYREWOOD_VILLAGE_CGUID+26, 0, 1893, 0, 0, 0, 0, 49),
(@PYREWOOD_VILLAGE_CGUID+27, 0, 1893, 0, 0, 0, 0, 49),
(@PYREWOOD_VILLAGE_CGUID+28, 0, 1893, 0, 0, 0, 0, 49),
(@PYREWOOD_VILLAGE_CGUID+29, 0, 1893, 0, 0, 0, 0, 49),
(@PYREWOOD_VILLAGE_CGUID+30, 0, 1893, 0, 0, 0, 0, 49),
(@PYREWOOD_VILLAGE_CGUID+31, 0, 1893, 0, 0, 0, 0, 49),
(@PYREWOOD_VILLAGE_CGUID+32, 0, 1893, 0, 0, 0, 0, 49),
(@PYREWOOD_VILLAGE_CGUID+33, 0, 1896, 0, 0, 0, 0, 49),
(@PYREWOOD_VILLAGE_CGUID+34, 0, 1896, 0, 0, 0, 0, 49),
(@PYREWOOD_VILLAGE_CGUID+35, 0, 1896, 0, 0, 0, 0, 49),
(@PYREWOOD_VILLAGE_CGUID+36, 0, 1896, 0, 0, 0, 0, 49),
(@PYREWOOD_VILLAGE_CGUID+37, 0, 1896, 0, 0, 0, 0, 49),
(@PYREWOOD_VILLAGE_CGUID+38, 0, 1896, 0, 0, 0, 0, 49),
(@PYREWOOD_VILLAGE_CGUID+39, 0, 2106, 0, 0, 0, 0, 49),
(@PYREWOOD_VILLAGE_CGUID+40, 0, 1892, 0, 0, 0, 0, 49),
(@PYREWOOD_VILLAGE_CGUID+41, 0, 1892, 0, 0, 0, 0, 49),
(@PYREWOOD_VILLAGE_CGUID+42, 0, 1893, 0, 0, 0, 0, 49),
(@PYREWOOD_VILLAGE_CGUID+43, 0, 1893, 0, 0, 0, 0, 49),
(@PYREWOOD_VILLAGE_CGUID+44, 0, 1893, 0, 0, 0, 0, 49),
(@PYREWOOD_VILLAGE_CGUID+45, 0, 1893, 0, 0, 0, 0, 49),
(@PYREWOOD_VILLAGE_CGUID+46, 0, 1896, 0, 0, 0, 0, 49),
(@PYREWOOD_VILLAGE_CGUID+47, 0, 1896, 0, 0, 0, 0, 49),
(@PYREWOOD_VILLAGE_CGUID+48, 0, 3531, 0, 0, 0, 0, 49),
(@PYREWOOD_VILLAGE_CGUID+49, 0, 1896, 0, 0, 0, 0, 49);

-- Group.
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES
(@PYREWOOD_VILLAGE_CGUID+45, @PYREWOOD_VILLAGE_CGUID+40, 2.382527, 6.127218, 1);

-- Waypoints.
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(@PYREWOOD_VILLAGE_CGUID+46, 1, -411.819, 1523.96, 19.8225, 4.86947, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+46, 2, -411.719, 1535.1, 17.3187, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+46, 3, -420.721, 1545.81, 18.3678, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+46, 4, -429.364, 1553.12, 18.4437, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+46, 5, -431.801, 1556.67, 19.8225, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+46, 6, -434.7, 1555.73, 19.8225, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+46, 7, -429.338, 1552.89, 18.4437, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+46, 8, -418.059, 1543.01, 17.9437, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+46, 9, -403.781, 1543.78, 17.003, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+46, 10, -390.309, 1536.93, 16.7777, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+46, 11, -371.048, 1508.37, 17.3109, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+46, 12, -366.061, 1489.97, 17.3417, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+46, 13, -359.723, 1465.68, 21.2491, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+46, 14, -355.303, 1441.34, 25.5935, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+46, 15, -366.647, 1436.59, 25.8665, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+46, 16, -382.898, 1452.98, 26.1119, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+46, 17, -389.263, 1465.32, 25.8879, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+46, 18, -382.538, 1451.44, 26.1119, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+46, 19, -369.553, 1437.51, 25.7369, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+46, 20, -358.918, 1440.83, 25.5291, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+46, 21, -357.762, 1454.69, 23.2408, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+46, 22, -364.527, 1483.16, 18.0603, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+46, 23, -369.111, 1491.37, 17.3497, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+46, 24, -375.62, 1493.14, 17.9982, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+46, 25, -369.421, 1503.61, 16.9976, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+46, 26, -374.348, 1513.7, 17.1274, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+46, 27, -384.967, 1529.72, 17.0024, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+46, 28, -394.326, 1542.63, 17.0528, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+46, 29, -406.777, 1543.6, 17.0246, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+46, 30, -412.117, 1536.47, 17.3187, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+46, 31, -411.071, 1525.1, 19.8203, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+46, 32, -411.808, 1519.24, 19.8225, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+46, 33, -411.947, 1517.76, 19.8225, 0, 13000, 0, 0);

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(@PYREWOOD_VILLAGE_CGUID+42, 1, -395.126, 1590.43, 17.1989, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+42, 2, -384.228, 1601.31, 16.9645, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+42, 3, -363.043, 1597.69, 16.8965, 0, 8000, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+42, 4, -370.623, 1583.07, 16.8849, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+42, 5, -367.543, 1582.24, 17.066, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+42, 6, -374.827, 1569.13, 18.2269, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+42, 7, -377.802, 1557.52, 17.0462, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+42, 8, -389.676, 1563.75, 17.2091, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+42, 9, -393.622, 1574.01, 17.6262, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+42, 10, -398.312, 1568.82, 18.1349, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+42, 11, -393.884, 1577.59, 17.9633, 0, 0, 0, 0);

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(@PYREWOOD_VILLAGE_CGUID+43, 1, -384.977, 1458.48, 26.1119, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+43, 2, -380.628, 1448.03, 26.1119, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+43, 3, -374.616, 1442.83, 25.9391, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+43, 4, -368.093, 1437.53, 25.7369, 0, 10000, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+43, 5, -377.536, 1445.67, 26.0295, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+43, 6, -383.913, 1455.34, 26.1119, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+43, 7, -387, 1462.04, 26.1119, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+43, 8, -390.535, 1466.63, 26.0453, 5.34071, 10000, 0, 0);

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(@PYREWOOD_VILLAGE_CGUID+44, 1, -380.906, 1635.19, 17.6107, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+44, 2, -380.128, 1641.55, 17.6107, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+44, 3, -382.757, 1644.46, 17.6107, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+44, 4, -386.66, 1643.29, 17.6107, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+44, 5, -390.024, 1644.77, 17.6107, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+44, 6, -390.074, 1658.63, 10.8107, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+44, 7, -390.024, 1644.77, 17.6107, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+44, 8, -386.66, 1643.29, 17.6107, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+44, 9, -382.757, 1644.46, 17.6107, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+44, 10, -380.128, 1641.55, 17.6107, 0, 0, 0, 0);

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(@PYREWOOD_VILLAGE_CGUID+45, 1, -389.12, 1537.33, 16.872, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+45, 2, -378.897, 1520.66, 17.0024, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+45, 3, -370.057, 1509.29, 17.2524, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+45, 4, -365.641, 1494.58, 17.3519, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+45, 5, -362.643, 1474.81, 19.3973, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+45, 6, -355.429, 1448.38, 24.5057, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+45, 7, -360.087, 1465.52, 21.2439, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+45, 8, -365.541, 1488.52, 17.4044, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+45, 9, -369.315, 1507.92, 17.2647, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+45, 10, -379.307, 1523.16, 17.0024, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+45, 11, -393.872, 1543.12, 16.9984, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+45, 12, -406.369, 1545.71, 16.7716, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+45, 13, -418.962, 1543.91, 18.1136, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+45, 14, -400.713, 1546.56, 16.8187, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+45, 15, -393.248, 1548.43, 16.9212, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+45, 16, -389.204, 1557.71, 17.0505, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+45, 17, -386.261, 1564.47, 17.2962, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+45, 18, -384.791, 1568.91, 17.1349, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+45, 19, -383.289, 1572.77, 17.0099, 0.174533, 14000, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+45, 20, -389.978, 1554.07, 17.0311, 0, 0, 0, 0);

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(@PYREWOOD_VILLAGE_CGUID+47, 1, -363.422, 1560.73, 21.3816, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+47, 2, -374.487, 1573.65, 16.9579, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+47, 3, -384.707, 1563.58, 17.2962, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+47, 4, -391.864, 1543.59, 16.9212, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+47, 5, -386.164, 1527.33, 16.9108, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+47, 6, -373.699, 1512.52, 17.1274, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+47, 7, -367.587, 1502.63, 16.9545, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+47, 8, -363.977, 1493.82, 17.3519, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+47, 9, -349.678, 1500.26, 18.8225, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+47, 10, -360.036, 1494.99, 17.2269, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+47, 11, -366.26, 1498.18, 17.3519, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+47, 12, -376.235, 1517.35, 17.108, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+47, 13, -385.731, 1530.7, 17.0024, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+47, 14, -387.993, 1539.89, 16.9212, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+47, 15, -393.007, 1543.18, 16.9212, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+47, 16, -397.475, 1543.61, 17.1807, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+47, 17, -391.477, 1552.53, 17.2025, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+47, 18, -382.648, 1569.47, 17.1349, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+47, 19, -371.867, 1576.16, 16.8849, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+47, 20, -362.639, 1565.75, 20.2008, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+47, 21, -360.823, 1550.49, 23.895, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+47, 22, -357.116, 1540.17, 24.4813, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+47, 23, -356.325, 1532.82, 25.0225, 4.13643, 11000, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+47, 24, -358.003, 1549.25, 24.3563, 0, 0, 0, 0);

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(@PYREWOOD_VILLAGE_CGUID+41, 1, -361.687, 1557.32, 22.0089, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+41, 2, -367.663, 1568.8, 19.1234, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+41, 3, -372.659, 1580.14, 16.8849, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+41, 4, -376.327, 1586.39, 17.3849, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+41, 5, -385.428, 1592.26, 16.7599, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+41, 6, -394.403, 1592.05, 17.1508, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+41, 7, -398.401, 1594.79, 17.0724, 0, 5000, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+41, 8, -401.127, 1597.37, 18.2225, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+41, 9, -402.025, 1599.98, 18.2225, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+41, 10, -398.743, 1601.67, 18.2107, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+41, 11, -397.548, 1593.1, 17.1504, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+41, 12, -393.007, 1582.27, 17.7062, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+41, 13, -390.527, 1573.62, 17.2599, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+41, 14, -379.91, 1572.04, 16.8849, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+41, 15, -373.062, 1571.89, 17.7216, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+41, 16, -364.98, 1565, 20.2843, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+41, 17, -363.438, 1560.17, 21.4482, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+41, 18, -358.623, 1548.77, 24.4535, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+41, 19, -349.908, 1552.29, 24.3563, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+41, 20, -344.585, 1552.67, 24.3563, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+41, 21, -343.315, 1553.08, 24.3563, 5.8294, 10000, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+41, 22, -359.199, 1548.64, 24.5228, 0, 0, 0, 0);

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(@PYREWOOD_VILLAGE_CGUID+48, 1, -332.896, 1517.44, 17.186, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+48, 2, -330.501, 1512.35, 17.061, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+48, 3, -338.456, 1509.15, 18.8225, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+48, 4, -345.957, 1504.3, 18.8225, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+48, 5, -354.388, 1498.4, 18.8225, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+48, 6, -360.814, 1495.02, 17.2269, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+48, 7, -353.515, 1497.8, 18.8225, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+48, 8, -349.585, 1500.53, 18.8225, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+48, 9, -338.319, 1509.11, 18.8225, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+48, 10, -331.599, 1512.65, 17.061, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+48, 11, -333.111, 1519.72, 17.186, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+48, 12, -334.045, 1527.42, 18.0225, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+48, 13, -331.838, 1531.58, 18.0252, 0, 0, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+48, 14, -328.988, 1531.25, 18.0225, 4.03171, 10000, 0, 0),
(@PYREWOOD_VILLAGE_CGUID+48, 15, -333.592, 1524.62, 18.0225, 0, 0, 0, 0);

UPDATE `creature_template` SET `display_scale1`=0, `unit_flags`=64, `armor`=566, `dmg_min`=34.8489, `dmg_max`=46.4448, `attack_power`=48, `ranged_dmg_min`=19.3565, `ranged_dmg_max`=26.1776, `spell_id1`=2053, `ai_name`='EventAI' WHERE `entry`=1895;
UPDATE `creature_template` SET `unit_flags`=64, `dmg_min`=34.5471, `dmg_max`=45.7493, `attack_power`=54, `armor`=685, `ranged_dmg_min`=17.4565, `ranged_dmg_max`=23.6133, `spell_id1`=7164, `spell_id2`=12169, `spell_id3`=11972 WHERE `entry`=1894;
UPDATE `creature_template` SET `unit_flags`=64, `dmg_min`=31.3535, `dmg_max`=45.7493, `attack_power`=50, `armor`=650, `ranged_dmg_min`=19.179, `ranged_dmg_max`=25.7685, `spell_id1`=6660, `spell_list_id`=18910 WHERE `entry`=1891;
UPDATE `creature_template` SET `unit_flags`=64, `npc_flags`=4, `armor`=959, `dmg_min`=34.5471, `dmg_max`=45.7493, `attack_power`=50, `ranged_dmg_min`=19.179, `ranged_dmg_max`=25.7685 WHERE `entry`=3528;
UPDATE `creature_template` SET `unit_flags`=64, `npc_flags`=4, `armor`=685, `dmg_min`=37.5879, `dmg_max`=49.8247, `attack_power`=54, `ranged_dmg_min`=20.682, `ranged_dmg_max`=27.8801, `spell_id2`=15657, `spell_id1`=6713, `ai_name`='' WHERE `entry`=3530;
UPDATE `creature_template` SET `unit_flags`=64, `npc_flags`=4, `speed_walk`=1, `base_attack_time`=2000, `armor`=959, `dmg_min`=34.5471, `dmg_max`=45.7493, `faction`=123, `attack_power`=50, `ranged_dmg_min`=19.179, `ranged_dmg_max`=25.7685 WHERE `entry`=3532;
UPDATE `creature_template` SET `speed_walk`=1, `base_attack_time`=2000,  `armor`=721, `dmg_min`=39.6769, `dmg_max`=52.7154, `attack_power`=56, `ranged_dmg_min`=21.9108, `ranged_dmg_max`=29.5805 WHERE `entry`=2106;
UPDATE `creature_template` SET `unit_flags`=64, `speed_walk`=1, `base_attack_time`=2000, `ranged_attack_time`=2000 WHERE `entry`=3533;
UPDATE `creature_template` SET `unit_flags`=64, `npc_flags`=0 WHERE `entry`=3531;
UPDATE `creature_template` SET `unit_flags`=64 WHERE `entry`=3529;
UPDATE `creature_template` SET `unit_flags`=64, `base_attack_time`=2000, `ranged_attack_time`=2000, `ai_name`='' WHERE `entry`=1892;
UPDATE `creature_template` SET `unit_flags`=64, `spell_id1`=13730, `spell_id2`=6507, `spell_id3`=0 WHERE `entry`=1893;
UPDATE `creature_template` SET `unit_flags`=64, `spell_id1`=594, `equipment_id`=0 WHERE `entry`=1896;

-- Worgen do not have any weapons on respawn.
DELETE FROM `creature_equip_template` WHERE `entry`=1896;

-- 3528: Pyrewood Armorer - no spells
-- 3532: Pyrewood Leatherworker - no spells

-- Removing unused script actions.
DELETE FROM `creature_ai_scripts` WHERE `id` IN (353001);

-- Events list for Pyrewood Tailor
DELETE FROM `creature_ai_events` WHERE `creature_id`=3530;

-- Removing unused script actions.
DELETE FROM `creature_ai_scripts` WHERE `id` IN (189101, 189102, 189103, 189104, 189105, 189106);

-- Events list for Pyrewood Watcher
DELETE FROM `creature_ai_events` WHERE `creature_id`=1891;

REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES
(35300, 'Silverpine Forest - Pyrewood Tailor', 15657, 100, 1, 0, 0, 0, 16, 16, 6, 82, 0, 6713, 100, 1, 0, 0, 32, 10, 15, 8, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18940, 'Silverpine Forest - Pyrewood Sentry', 7164, 100, 0, 0, 0, 0, 1, 20, 180, 190, 0, 12169, 100, 0, 0, 0, 0, 2, 20, 12, 30, 0, 11972, 100, 1, 0, 0, 256, 4, 35, 20, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18910, 'Silverpine Forest - Pyrewood Watcher', 6660, 100, 1, 0, 0, 8, 0, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18960, 'Silverpine Forest - Moonrage Elder', 594, 100, 1, 0, 0, 32, 2, 6, 1, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18930, 'Silverpine Forest - Moonrage Sentry', 6507, 100, 0, 0, 0, 0, 1, 6, 12, 25, 0, 13730, 100, 1, 0, 0, 0, 2, 20, 33, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(35310, 'Silverpine Forest - Moonrage Tailor', 7140, 100, 1, 0, 0, 0, 1, 12, 24, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18950, 'Silverpine Forest - Pyrewood Elder', 2053, 100, 15, 0, 0, 0, 3, 15, 10, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Events list for Moonrage Elder
DELETE FROM `creature_ai_events` WHERE `creature_id`=1896;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (189601, 1896, 0, 2, 0, 100, 0, 15, 0, 0, 0, 189601, 0, 0, 'Moonrage Elder - Flee at 15% HP');
DELETE FROM `creature_ai_scripts` WHERE `id`=189601;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(189601, 0, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Moonrage Elder - Flee');

-- Events list for Pyrewood Elder
DELETE FROM `creature_ai_events` WHERE `creature_id`=1895;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (189501, 1895, 0, 2, 0, 100, 0, 15, 0, 0, 0, 189501, 0, 0, 'Pyrewood Elder - Flee at 15% HP');
DELETE FROM `creature_ai_scripts` WHERE `id`=189501;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(189501, 0, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyrewood Elder - Flee');

-- Events list for Pyrewood Watcher
DELETE FROM `creature_ai_events` WHERE `creature_id`=1891;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (189101, 1891, 0, 2, 0, 100, 0, 15, 0, 0, 0, 189101, 0, 0, 'Pyrewood Watcher - Flee at 15% HP');
DELETE FROM `creature_ai_scripts` WHERE `id`=189101;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(189101, 0, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyrewood Watcher - Flee');

-- Events list for Moonrage Sentry
DELETE FROM `creature_ai_events` WHERE `creature_id`=1893;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (189301, 1893, 0, 2, 0, 100, 0, 15, 0, 0, 0, 189301, 0, 0, 'Moonrage Sentry - Flee at 15% HP');
DELETE FROM `creature_ai_scripts` WHERE `id`=189301;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(189301, 0, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Moonrage Sentry - Flee');

-- Pyrewood Ambush
UPDATE `creature_template` SET `armor`=685, `dmg_min`=37.5879, `dmg_max`=49.8247, `attack_power`=54, `base_attack_time`=2000, `ranged_attack_time`=2000, `unit_flags`=64, `ranged_dmg_max`=27.8801, `ranged_attack_power`=44 WHERE `entry`=2068;
UPDATE `creature_template` SET `armor`=615, `dmg_min`=31.3535, `dmg_max`=41.4931, `attack_power`=48, `base_attack_time`=2000, `ranged_attack_time`=2000, `ranged_dmg_min`=17.3575, `ranged_dmg_max`=23.322, `ranged_attack_power`=40 WHERE `entry` IN (2060, 2061, 2062, 2063, 2064, 2065, 2066, 2067);
UPDATE `creature_template` SET `speed_walk`=1, `dmg_min`=26.2333, `dmg_max`=34.7785, `attack_power`=64, `ranged_dmg_min`=24.519, `ranged_dmg_max`=33.0643, `ranged_attack_power`=52, `armor`=791, `spell_id1`=2589, `spell_list_id`=20580, `faction`=68, `unit_flags`=32768, `script_name`='', `ai_name`='EventAI' WHERE `entry`=2058;
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name`='' WHERE `entry` IN (2060, 2061, 2062, 2063, 2064, 2065, 2066, 2067, 2068);

REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES
(20580, 'Deathstalker Faerleia', 2589, 100, 1, 0, 0, 0, 6, 20, 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Events list for Deathstalker Faerleia
DELETE FROM `creature_ai_events` WHERE `creature_id`=2058;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(205802, 2058, 0, 30, 0, 100, 0, 0, 0, 0, 0, 205802, 0, 0, 'Deathstalker Faerleia - Drink Potion on Leaving Combat');

DELETE FROM `creature_ai_scripts` WHERE `id`=205802;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(205802, 0, 0, 15, 3359, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deathstalker Faerleia: Cast Spell - Drink Potion (3359)');

UPDATE `quest_template` SET `StartScript`=452 WHERE `entry`=452;

-- 45201: Scripted Map Event 452 Is Active
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (45201, 36, 452, 0, 0, 0, 0);

-- 45202: Extra Targets Of Scripted Map Event 452 Satisfy Condition (121:  Not (Target Is Alive))
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (45202, 47, 452, 121, 0, 0, 0);

-- 45203: (Scripted Map Event 452 Is Active) And (Extra Targets Of Scripted Map Event 452 Satisfy Condition (121:  Not (Target Is Alive)))
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (45203, -1, 45201, 45202, 0, 0, 0);

-- 1. wave
DELETE FROM `quest_start_scripts` WHERE `id`=452;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(452, 0, 0, 61, 452, 2400, 0, 0, 0, 0, 0, 8, 0, 0, 1014, 45207, 0, 0, 0, 0, 0, 'Pyrewood Ambush: Deathstalker Faerleia - Start Map Event'),
(452, 0, 1, 22, 232, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyrewood Ambush: Deathstalker Faerleia - Set Faction Escortee'),
(452, 0, 2, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyrewood Ambush: Deathstalker Faerleia - Remove NPC flags'),
(452, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 542, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyrewood Ambush: Deathstalker Faerleia - SayText'),
(452, 9, 4, 10, 2060, 240000, 0, 0, 0, 0, 0, 0, 0, 45205, -1, 1, -397.503, 1511, 18.952, 4.7473, 0, 'Pyrewood Ambush: Deathstalker Faerleia - Summon Councilman Smithers');

-- Add Councilman to Map Event Target
DELETE FROM `generic_scripts` WHERE `id`=45205;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(45205, 0, 0, 63, 452, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyrewood Ambush: Add Councilman to Map Event Target');

-- 2. wave
DELETE FROM `generic_scripts` WHERE `id`=45201;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(45201, 5, 0, 10, 2061, 240000, 0, 0, 0, 0, 0, 8, 0, 45205, -1, 1, -398.219, 1511.08, 18.952, 4.86947, 0, 'Pyrewood Ambush: Councilman Smithers - Summon Councilman Thatcher');

-- Events list for Councilman Smithers
DELETE FROM `creature_ai_events` WHERE `creature_id`=2060;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(206001, 2060, 0, 6, 0, 100, 0, 0, 0, 0, 0, 206001, 0, 0, 'Pyrewood Ambush: Councilman Smithers - Summon Councilman Thatcher on Death'),
(206002, 2060, 45201, 11, 0, 100, 0, 0, 0, 0, 0, 206002, 0, 0, 'Pyrewood Ambush: Councilman Thatcher - Start Waypoints on Spawn'),
(206003, 2060, 0, 2, 0, 100, 0, 15, 0, 0, 0, 206003, 0, 0, 'Pyrewood Ambush: Councilman Smithers - Flee at 15% Health');

DELETE FROM `creature_ai_scripts` WHERE `id`=206001;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(206001, 0, 0, 39, 45201, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 45201, 'Pyrewood Ambush: Councilman Smithers - Start Script on Death');

DELETE FROM `creature_ai_scripts` WHERE `id`=206002;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(206002, 0, 0, 60, 3, 0, 0, 0, 0, 0, 0, 0, 0, 206001, 0, 0, 0, 0, 0, 0, 0, 'Pyrewood Ambush: Councilman Thatcher - Start Waypoints');

DELETE FROM `creature_ai_scripts` WHERE `id`=206003;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(206003, 0, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyrewood Ambush: Councilman Smithers - Flee');

-- 3. wave
DELETE FROM `generic_scripts` WHERE `id`=45202;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(45202, 5, 0, 10, 2064, 240000, 0, 0, 0, 0, 0, 8, 0, 45205, -1, 1, -397.428, 1511.84, 18.952, 4.69494, 0, 'Pyrewood Ambush: Summon Councilman Hartin');

-- Events list for Councilman Thatcher
DELETE FROM `creature_ai_events` WHERE `creature_id`=2061;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(206101, 2061, 0, 6, 0, 100, 0, 0, 0, 0, 0, 206101, 0, 0, 'Pyrewood Ambush: Councilman Thatcher - Summon Councilman Hartin on Death'),
(206102, 2061, 45201, 11, 0, 100, 0, 0, 0, 0, 0, 206102, 0, 0, 'Pyrewood Ambush: Councilman Thatcher - Summon Councilman Hendricks and Start Waypoints on Spawn'),
(206103, 2061, 0, 2, 0, 100, 0, 15, 0, 0, 0, 206103, 0, 0, 'Pyrewood Ambush: Councilman Thatcher - Flee at 15% Health'),
(206104, 2061, 0, 17, 0, 100, 0, 2062, 0, 0, 0, 206104, 0, 0, 'Pyrewood Ambush: Councilman Thatcher - Join Creature Group on Summon Councilman Hendricks');

DELETE FROM `creature_ai_scripts` WHERE `id`=206101;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(206101, 0, 0, 39, 45202, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 45203, 'Pyrewood Ambush: Councilman Thatcher - Start Script on Death');

DELETE FROM `creature_ai_scripts` WHERE `id`=206102;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(206102, 0, 0, 10, 2062, 240000, 0, 0, 0, 0, 0, 8, 0, 45205, -1, 1, -396.638, 1511.03, 18.952, 4.66003, 0, 'Pyrewood Ambush: Councilman Thatcher - Summon Councilman Hendricks'),
(206102, 0, 1, 60, 3, 0, 0, 0, 0, 0, 0, 0, 0, 206101, 0, 0, 0, 0, 0, 0, 0, 'Pyrewood Ambush: Councilman Thatcher - Start Waypoints');

DELETE FROM `creature_ai_scripts` WHERE `id`=206103;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(206103, 0, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyrewood Ambush: Councilman Thatcher - Flee');

DELETE FROM `creature_ai_scripts` WHERE `id`=206104;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(206104, 0, 0, 78, 3, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1.583971, 0, 0, 6.251616, 0, 'Pyrewood Ambush: Councilman Hendricks - Join Creature Group');

-- Events list for Councilman Hendricks
DELETE FROM `creature_ai_events` WHERE `creature_id`=2062;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(206201, 2062, 0, 6, 0, 100, 0, 0, 0, 0, 0, 206201, 0, 0, 'Pyrewood Ambush: Councilman Hendricks - Summon  Councilman Hartin on Death'),
(206202, 2062, 0, 2, 0, 100, 0, 15, 0, 0, 0, 206202, 0, 0, 'Pyrewood Ambush: Councilman Hendricks - Flee at 15% Health');

DELETE FROM `creature_ai_scripts` WHERE `id`=206201;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(206201, 0, 0, 39, 45202, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 45203, 'Pyrewood Ambush: Councilman Hendricks - Start Script on Death');

DELETE FROM `creature_ai_scripts` WHERE `id`=206202;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(206202, 0, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyrewood Ambush: Councilman Hendricks - Flee');

-- 4. wave
DELETE FROM `generic_scripts` WHERE `id`=45203;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(45203, 5, 0, 10, 2068, 240000, 0, 0, 0, 0, 0, 8, 0, 45205, -1, 1, -397.366, 1512.61, 18.952, 4.7473, 0, 'Pyrewood Ambush: Summon Lord Mayor Morrison');

-- Events list for Councilman Hartin
DELETE FROM `creature_ai_events` WHERE `creature_id`=2064;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(206401, 2064, 0, 6, 0, 100, 0, 0, 0, 0, 0, 206401, 0, 0, 'Pyrewood Ambush: Councilman Hartin - Summon Lord Mayor Morrison on Death'),
(206402, 2064, 45201, 11, 0, 100, 0, 0, 0, 0, 0, 206402, 0, 0, 'Pyrewood Ambush: Councilman Hartin - Summon Councilman Higarth and Wilhelm and Start Waypoints on Spawn'),
(206403, 2064, 0, 2, 0, 100, 0, 15, 0, 0, 0, 206403, 0, 0, 'Pyrewood Ambush: Councilman Hartin - Flee at 15% Health'),
(206404, 2064, 0, 17, 0, 100, 0, 2066, 0, 0, 0, 206404, 0, 0, 'Pyrewood Ambush: Councilman Hartin - Join Creature Group on Summon Councilman Higarth'),
(206405, 2064, 0, 17, 0, 100, 0, 2063, 0, 0, 0, 206405, 0, 0, 'Pyrewood Ambush: Councilman Hartin - Join Creature Group on Summon Councilman Wilhelm');

DELETE FROM `creature_ai_scripts` WHERE `id`=206401;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(206401, 0, 0, 39, 45203, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 45203, 'Pyrewood Ambush: Councilman Hartin - Start Script on Death');

DELETE FROM `creature_ai_scripts` WHERE `id`=206402;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(206402, 0, 0, 10, 2066, 240000, 0, 0, 0, 0, 0, 8, 0, 45205, -1, 1, -398.346, 1511.81, 18.952, 4.7822, 0, 'Pyrewood Ambush: Councilman Hartin - Summon Councilman Higarth'),
(206402, 0, 1, 10, 2063, 240000, 0, 0, 0, 0, 0, 8, 0, 45205, -1, 1, -396.381, 1511.8, 18.952, 4.66003, 0, 'Pyrewood Ambush: Councilman Hartin - Summon Councilman Wilhelm'),
(206402, 0, 2, 60, 3, 0, 0, 0, 0, 0, 0, 0, 0, 206401, 0, 0, 0, 0, 0, 0, 0, 'Pyrewood Ambush: Councilman Hartin - Start Waypoints');

DELETE FROM `creature_ai_scripts` WHERE `id`=206403;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(206403, 0, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyrewood Ambush: Councilman Hartin - Flee');

DELETE FROM `creature_ai_scripts` WHERE `id`=206404;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(206404, 0, 0, 78, 3, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0.922254, 0, 0, 3.174160, 0, 'Pyrewood Ambush: Councilman Higarth - Join Creature Group');

DELETE FROM `creature_ai_scripts` WHERE `id`=206405;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(206405, 0, 0, 78, 3, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1.051062, 0, 0, 6.245079, 0, 'Pyrewood Ambush: Councilman Wilhelm - Join Creature Group');

-- Events list for Councilman Wilhelm
DELETE FROM `creature_ai_events` WHERE `creature_id`=2063;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(206301, 2063, 0, 6, 0, 100, 0, 0, 0, 0, 0, 206301, 0, 0, 'Pyrewood Ambush: Councilman Wilhelm - Summon Lord Mayor Morrison on Death'),
(206302, 2063, 0, 2, 0, 100, 0, 15, 0, 0, 0, 206302, 0, 0, 'Pyrewood Ambush: Councilman Wilhelm - Flee at 15% Health');

DELETE FROM `creature_ai_scripts` WHERE `id`=206301;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(206301, 0, 0, 39, 45203, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 45203, 'Pyrewood Ambush: Councilman Wilhelm - Start Script on Death');

DELETE FROM `creature_ai_scripts` WHERE `id`=206302;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(206302, 0, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyrewood Ambush: Councilman Wilhelm - Flee');

-- Events list for Councilman Higarth
DELETE FROM `creature_ai_events` WHERE `creature_id`=2066;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(206601, 2066, 0, 6, 0, 100, 0, 0, 0, 0, 0, 206601, 0, 0, 'Pyrewood Ambush: Councilman Higarth - Summon Lord Mayor Morrison on Death'),
(206602, 2066, 0, 2, 0, 100, 0, 15, 0, 0, 0, 206602, 0, 0, 'Pyrewood Ambush: Councilman Higarth - Flee at 15% Health');

DELETE FROM `creature_ai_scripts` WHERE `id`=206601;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(206601, 0, 0, 39, 45203, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 45203, 'Pyrewood Ambush: Councilman Higarth - Start Script on Death');

DELETE FROM `creature_ai_scripts` WHERE `id`=206602;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(206602, 0, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyrewood Ambush: Councilman Higarth - Flee');

-- Events list for Councilman Brunswick
DELETE FROM `creature_ai_events` WHERE `creature_id`=2067;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(206701, 2067, 0, 6, 0, 100, 0, 0, 0, 0, 0, 206701, 0, 0, 'Pyrewood Ambush: Councilman Brunswick - Complete Quest Pyrewood Ambush on Death'),
(206702, 2067, 0, 2, 0, 100, 0, 15, 0, 0, 0, 206702, 0, 0, 'Pyrewood Ambush: Councilman Brunswick - Flee at 15% Health');

DELETE FROM `creature_ai_scripts` WHERE `id`=206701;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(206701, 0, 0, 39, 45204, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 45203, 'Pyrewood Ambush: Councilman Brunswick - Start Script on Death');

DELETE FROM `creature_ai_scripts` WHERE `id`=206702;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(206702, 0, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyrewood Ambush: Councilman Brunswick - Flee');

-- Events list for Councilman Cooper
DELETE FROM `creature_ai_events` WHERE `creature_id`=2065;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(206501, 2065, 0, 6, 0, 100, 0, 0, 0, 0, 0, 206501, 0, 0, 'Pyrewood Ambush: Councilman Cooper - Complete Quest Pyrewood Ambush on Death'),
(206502, 2065, 0, 2, 0, 100, 0, 15, 0, 0, 0, 206502, 0, 0, 'Pyrewood Ambush: Councilman Cooper - Flee at 15% Health');

DELETE FROM `creature_ai_scripts` WHERE `id`=206501;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(206501, 0, 0, 39, 45204, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 45203, 'Pyrewood Ambush: Councilman Cooper - Start Script on Death');

DELETE FROM `creature_ai_scripts` WHERE `id`=206502;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(206502, 0, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyrewood Ambush: Councilman Cooper - Flee');

-- Events list for Lord Mayor Morrison
DELETE FROM `creature_ai_events` WHERE `creature_id`=2068;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(206801, 2068, 0, 6, 0, 100, 0, 0, 0, 0, 0, 206801, 0, 0, 'Pyrewood Ambush: Lord Mayor Morrison - Complete Quest Pyrewood Ambush on Death'),
(206802, 2068, 45201, 11, 0, 100, 0, 0, 0, 0, 0, 206802, 0, 0, 'Pyrewood Ambush: Lord Mayor Morrison - Summon Councilman Brunswick and Cooper and Start Waypoints on Spawn'),
(206803, 2068, 0, 2, 0, 100, 0, 15, 0, 0, 0, 206803, 0, 0, 'Pyrewood Ambush: Lord Mayor Morrison - Flee at 15% Health'),
(206804, 2068, 0, 17, 0, 100, 0, 2065, 0, 0, 0, 206804, 0, 0, 'Pyrewood Ambush: Lord Mayor Morrison - Join Creature Group on Summoned Councilman Cooper'),
(206805, 2068, 0, 17, 0, 100, 0, 2067, 0, 0, 0, 206805, 0, 0, 'Pyrewood Ambush: Lord Mayor Morrison - Join Creature Group on Summoned Councilman Brunswick');

DELETE FROM `creature_ai_scripts` WHERE `id`=206801;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(206801, 0, 0, 39, 45204, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 45203, 'Pyrewood Ambush: Lord Mayor Morrison - Start Script on Death');

DELETE FROM `creature_ai_scripts` WHERE `id`=206802;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(206802, 0, 0, 10, 2067, 240000, 0, 0, 0, 0, 0, 8, 0, 45205, -1, 1, -398.522, 1512.69, 18.952, 4.79966, 0, 'Pyrewood Ambush: Lord Mayor Morrison - Summon Councilman Brunswick'),
(206802, 0, 1, 10, 2065, 240000, 0, 0, 0, 0, 0, 8, 0, 45205, -1, 1, -396.286, 1512.55, 18.952, 4.69494, 0, 'Pyrewood Ambush: Lord Mayor Morrison - Summon Councilman Cooper'),
(206802, 0, 2, 60, 3, 0, 0, 0, 0, 0, 0, 0, 0, 206801, 0, 0, 0, 0, 0, 0, 0, 'Pyrewood Ambush: Lord Mayor Morrison - Start Waypoints');

DELETE FROM `creature_ai_scripts` WHERE `id`=206803;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(206803, 0, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyrewood Ambush: Lord Mayor Morrison - Flee');

DELETE FROM `creature_ai_scripts` WHERE `id`=206804;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(206804, 0, 0, 78, 3, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1.08484, 0, 0, 6.22775, 0, 'Pyrewood Ambush: Councilman Cooper - Join Creature Group');

DELETE FROM `creature_ai_scripts` WHERE `id`=206805;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(206805, 0, 0, 78, 3, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1.16175, 0, 0, 3.07254, 0, 'Pyrewood Ambush: Councilman Brunswick - Join Creature Group');

DELETE FROM `generic_scripts` WHERE `id`=45204;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(45204, 0, 0, 22, 68, 0, 0, 0, 18352, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyrewood Ambush: Deathstalker Faerleia - Set Faction to Undercity'),
(45204, 2, 0, 4, 147, 2, 1, 0, 18352, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyrewood Ambush: Deathstalker Faerleia - Add QuestGiver Flag'),
(45204, 2, 0, 7, 452, 60, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyrewood Ambush: Complete Quest'),
(45204, 2, 0, 0, 0, 0, 0, 0, 18352, 0, 9, 2, 545, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyrewood Ambush: Deathstalker Faerleia - Say Text'),
(45204, 3, 0, 62, 452, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyrewood Ambush: Deathstalker Faerleia - End Map Event');

DELETE FROM `generic_scripts` WHERE `id`=45207;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(45207, 0, 0, 70, 452, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyrewood Ambush: Fail Quest');

-- Waypoints for Councilman Smithers
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(206001, 1, -397.547, 1501.18, 19.8225, 100, 0, 0, 0),
(206001, 2, -404.497, 1499.91, 19.8225, 100, 0, 0, 0);

-- Waypoints for Councilman Thatcher
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(206101, 1, -397.033, 1505, 19.8225, 100, 0, 0, 0),
(206101, 2, -397.884, 1499.37, 19.8225, 100, 0, 0, 0),
(206101, 3, -406.004, 1496.91, 19.8225, 100, 0, 0, 0);

-- Waypoints for Councilman Hartin
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(206401, 1, -397.051, 1505.05, 19.8225, 100, 0, 0, 0),
(206401, 2, -400, 1498.98, 19.8225, 100, 0, 0, 0),
(206401, 3, -405.759, 1497, 19.8225, 100, 0, 0, 0);

-- Waypoints for Lord Mayor Morrison
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(206801, 1, -397.155, 1505.2, 19.8225, 100, 0, 0, 0),
(206801, 2, -400.12, 1499.09, 19.8225, 100, 0, 0, 0),
(206801, 3, -405.49, 1497.04, 19.8225, 100, 0, 0, 0);

-- These npcs are not trainers.
DELETE FROM `npc_trainer` WHERE `entry` IN (3531, 3530);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
