DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230629193625');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230629193625');
-- Add your query below.


-- Correct position of Giant Clam in Wetlands (position is off by 0.0098882 yards).
UPDATE `gameobject` SET `position_x`=-2646.41, `position_y`=-1246.57, `position_z`=-14.4196, `orientation`=0.0698117, `rotation0`=0, `rotation1`=0, `rotation2`=0.0348988, `rotation3`=0.999391 WHERE `guid`=48045;

-- Correct position of Giant Clam in Wetlands (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-3276.94, `position_y`=-618.367, `position_z`=-19.3886, `orientation`=2.63544, `rotation0`=0, `rotation1`=0, `rotation2`=0.968147, `rotation3`=0.250381 WHERE `guid`=48027;

-- Correct position of Giant Clam in Wetlands (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-2561.04, `position_y`=-1548.83, `position_z`=-13.6165, `orientation`=2.67035, `rotation0`=0, `rotation1`=0, `rotation2`=0.972369, `rotation3`=0.233448 WHERE `guid`=48029;

-- Missing Giant Clam spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(48090, 19018, 0, -3154.08, -878.175, -10.8228, 0.767944, 0, 0, 0.374606, 0.927184, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48028 at 102.037331 yards.
(48091, 19018, 0, -3229.4, -774.949, -17.9715, 2.42601, 0, 0, 0.936672, 0.350207, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48030 at 82.083229 yards.
(48092, 19018, 0, -2526.52, -1371.19, -40.446, 0.261798, 0, 0, 0.130526, 0.991445, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48042 at 64.627235 yards.
(48093, 19018, 0, -2973.35, -804.22, -12.3123, 0.226892, 0, 0, 0.113203, 0.993572, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48028 at 97.349396 yards.
(48094, 19018, 0, -2787.67, -1068.84, -11.7275, 6.21337, 0, 0, -0.0348988, 0.999391, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48025 at 110.302834 yards.
(48095, 19018, 0, -3431.91, -719.763, -10.6347, 1.90241, 0, 0, 0.814116, 0.580703, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48023 at 122.618011 yards.
(48096, 19018, 0, -2879.62, -975.779, -13.6782, 1.18682, 0, 0, 0.559193, 0.829038, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48020 at 92.997696 yards.
(48097, 19018, 0, -4132.01, -667.777, -13.1537, 2.72271, 0, 0, 0.978148, 0.207912, 7200, 7200, 1, 100, 0, 10); -- Closest existing guid is 48022 at 226.133957 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(48090, 1340, 0, 'Giant Clam', 0, 10), -- Wetlands - Giant Clam
(48091, 1340, 0, 'Giant Clam', 0, 10), -- Wetlands - Giant Clam
(48092, 1340, 0, 'Giant Clam', 0, 10), -- Wetlands - Giant Clam
(48093, 1340, 0, 'Giant Clam', 0, 10), -- Wetlands - Giant Clam
(48094, 1340, 0, 'Giant Clam', 0, 10), -- Wetlands - Giant Clam
(48095, 1340, 0, 'Giant Clam', 0, 10), -- Wetlands - Giant Clam
(48096, 1340, 0, 'Giant Clam', 0, 10), -- Wetlands - Giant Clam
(48097, 1340, 0, 'Giant Clam', 0, 10); -- Wetlands - Giant Clam

UPDATE `pool_template` SET `max_limit`=12 WHERE  `entry`=1340;

-- Correct position of Giant Clam in Stranglethorn Vale (position is off by 0.0996094 yards).
UPDATE `gameobject` SET `position_x`=-12357.3, `position_y`=576.18, `position_z`=-71.4579, `orientation`=5.23599, `rotation0`=0, `rotation1`=0, `rotation2`=-0.5, `rotation3`=0.866025 WHERE `guid`=32142;

-- Correct position of Giant Clam in Stranglethorn Vale (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-12410.5, `position_y`=455.937, `position_z`=-63.8844, `orientation`=6.02139, `rotation0`=0, `rotation1`=0, `rotation2`=-0.130526, `rotation3`=0.991445 WHERE `guid`=32147;

-- Correct position of Giant Clam in Stranglethorn Vale (position is off by 0.0996094 yards).
UPDATE `gameobject` SET `position_x`=-12390.3, `position_y`=608.607, `position_z`=-106.115, `orientation`=5.2709, `rotation0`=0, `rotation1`=0, `rotation2`=-0.484809, `rotation3`=0.87462 WHERE `guid`=32140;

-- Correct position of Giant Clam in Stranglethorn Vale (position is off by 0.0996148 yards).
UPDATE `gameobject` SET `position_x`=-12472.3, `position_y`=554.97, `position_z`=-60.85, `orientation`=0.0698117, `rotation0`=0, `rotation1`=0, `rotation2`=0.0348988, `rotation3`=0.999391 WHERE `guid`=32137;

-- Correct position of Giant Clam in Stranglethorn Vale (position is off by 0.0996094 yards).
UPDATE `gameobject` SET `position_x`=-12387.9, `position_y`=685.329, `position_z`=-53.2183, `orientation`=0.0174525, `rotation0`=0, `rotation1`=0, `rotation2`=0.00872612, `rotation3`=0.999962 WHERE `guid`=32180;

-- Correct position of Giant Clam in Stranglethorn Vale (position is off by 0.0010376 yards).
UPDATE `gameobject` SET `position_x`=-12244.3, `position_y`=581.704, `position_z`=-74.9789, `orientation`=6.10865, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0871553, `rotation3`=0.996195 WHERE `guid`=32167;

-- Correct position of Giant Clam in Stranglethorn Vale (position is off by 0.0996094 yards).
UPDATE `gameobject` SET `position_x`=-12328.4, `position_y`=572.81, `position_z`=-65.9415, `orientation`=3.87463, `rotation0`=0, `rotation1`=0, `rotation2`=-0.93358, `rotation3`=0.358368 WHERE `guid`=32276;

-- Correct position of Giant Clam in Stranglethorn Vale (position is off by 0.100586 yards).
UPDATE `gameobject` SET `position_x`=-12409.4, `position_y`=503.58, `position_z`=-75.63, `orientation`=3.38594, `rotation0`=0, `rotation1`=0, `rotation2`=-0.992546, `rotation3`=0.12187 WHERE `guid`=32108;

-- Missing Giant Clam spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(32285, 2744, 0, -12249.8, 607.121, -101.612, 1.5708, 0, 0, 0.707107, 0.707107, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 32281 at 31.506830 yards.
(32279, 2744, 0, -12313.8, 601.927, -59.0802, 1.53589, 0, 0, 0.694658, 0.71934, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 32278 at 21.587067 yards.
(32132, 2744, 0, -12432, 487.499, -69.9343, 1.97222, 0, 0, 0.833885, 0.551938, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 32108 at 28.396093 yards.
(32161, 2744, 0, -12406.4, 706.82, -33.0999, 1.29154, 0, 0, 0.601814, 0.798636, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 32151 at 33.818466 yards.
(32175, 2744, 0, -12453.3, 688.567, -67.7992, 2.02458, 0, 0, 0.848047, 0.529921, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 32151 at 32.617836 yards.
(32148, 2744, 0, -12355.4, 544.91, -84.1713, 2.77507, 0, 0, 0.983254, 0.182238, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 32142 at 33.803612 yards.
(32181, 2744, 0, -12166.4, 715.301, -49.3524, 0.820303, 0, 0, 0.398748, 0.91706, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 32172 at 44.607346 yards.
(32101, 2744, 0, -12247.7, 688.154, -71.0501, 2.58308, 0, 0, 0.961261, 0.27564, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 32097 at 36.440540 yards.
(32191, 2744, 0, -12252.9, 483.681, -72.6024, 5.60251, 0, 0, -0.333807, 0.942641, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 32109 at 37.752686 yards.
(32207, 2744, 0, -12328.4, 709.544, -45.4184, 4.50295, 0, 0, -0.777145, 0.629321, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 32121 at 37.356556 yards.
(32294, 2744, 0, -12329.6, 650.565, -42.0247, 1.18682, 0, 0, 0.559193, 0.829038, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 32277 at 33.683971 yards.
(11145, 2744, 0, -12120, 499.054, -55.3, 1.76278, 0, 0, 0.771625, 0.636078, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 11030 at 28.506937 yards.
(32295, 2744, 0, -12133, 598.654, -35.3211, 3.28124, 0, 0, -0.997563, 0.0697661, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 32170 at 21.318832 yards.
(32302, 2744, 0, -12208.9, 571.424, -36.9531, 3.75246, 0, 0, -0.953716, 0.300708, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 32119 at 32.601215 yards.
(32305, 2744, 0, -12234.6, 604.072, -65.1342, 6.24828, 0, 0, -0.0174522, 0.999848, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 32167 at 26.292484 yards.
(32306, 2744, 0, -12248.4, 443.024, -32.4327, 4.71239, 0, 0, -0.707107, 0.707107, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 32163 at 20.724970 yards.
(11146, 2744, 0, -12223.9, 441.447, -88.088, 5.8294, 0, 0, -0.224951, 0.97437, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 11029 at 21.194731 yards.
(32307, 2744, 0, -12293, 607.82, -79.2216, 4.36332, 0, 0, -0.819152, 0.573577, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 32281 at 27.970482 yards.
(32316, 2744, 0, -12261.4, 650.359, -91.6953, 4.25861, 0, 0, -0.848047, 0.529921, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 32120 at 33.871021 yards.
(32317, 2744, 0, -12277, 694.413, -98.2944, 4.20625, 0, 0, -0.861629, 0.507539, 900, 900, 1, 100, 0, 10); -- Closest existing guid is 32120 at 49.306431 yards.

UPDATE `pool_template` SET `max_limit`=20 WHERE  `entry`=1342;

UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `id` = 2744;

-- Correct position of Giant Clam in The Barrens (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-967.786, `position_y`=-3883.59, `position_z`=-65.0734, `orientation`=2.37364, `rotation0`=0, `rotation1`=0, `rotation2`=0.927183, `rotation3`=0.374608 WHERE `guid`=48884;

-- Correct position of Giant Clam in The Barrens (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-1480.74, `position_y`=-4023.45, `position_z`=-11.2201, `orientation`=2.89725, `rotation0`=0, `rotation1`=0, `rotation2`=0.992546, `rotation3`=0.12187 WHERE `guid`=48887;

-- Correct position of Giant Clam in Ashenvale (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=3521.09, `position_y`=1214.8, `position_z`=-36.0347, `orientation`=4.66003, `rotation0`=0, `rotation1`=0, `rotation2`=-0.725374, `rotation3`=0.688355 WHERE `guid`=48941;

-- Correct position of Giant Clam in Darkshore (position is off by 0.000100136 yards).
UPDATE `gameobject` SET `position_x`=6933.87, `position_y`=554.736, `position_z`=-13.9661, `orientation`=5.25344, `rotation0`=0, `rotation1`=0, `rotation2`=-0.492423, `rotation3`=0.870356 WHERE `guid`=48889;

-- Correct position of Giant Clam in Ashenvale (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=4004.71, `position_y`=1252.38, `position_z`=-35.3004, `orientation`=3.24635, `rotation0`=0, `rotation1`=0, `rotation2`=-0.998629, `rotation3`=0.0523532 WHERE `guid`=48940;

-- Correct position of Giant Clam in Darkshore (position is off by 0.0010376 yards).
UPDATE `gameobject` SET `position_x`=6194.85, `position_y`=755.306, `position_z`=-10.3836, `orientation`=0.453785, `rotation0`=0, `rotation1`=0, `rotation2`=0.224951, `rotation3`=0.97437 WHERE `guid`=48911;

-- Correct position of Giant Clam in The Barrens (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-1612.91, `position_y`=-4012.49, `position_z`=-2.79534, `orientation`=6.12611, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0784588, `rotation3`=0.996917 WHERE `guid`=48886;

-- Missing Giant Clam spawns in Westfall.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(42753, 19017, 0, -9520.8, 1787.71, -25.2666, 4.29351, 0, 0, -0.83867, 0.54464, 3600, 3600, 1, 100, 0, 10); -- Closest existing guid is 42751 at 1977.849731 yards.

-- Missing Giant Clam spawns in Darkshore.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(48901, 19017, 1, 5923.81, 801.439, -10.6119, 2.40855, 0, 0, 0.93358, 0.358368, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 48898 at 111.344826 yards.
(48770, 19017, 1, 7665.99, -599.783, -4.42674, 6.03884, 0, 0, -0.121869, 0.992546, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 48769 at 201.646149 yards.
(48930, 19017, 1, 4988.46, 942.989, -29.1446, 4.72984, 0, 0, -0.700909, 0.713251, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 48927 at 98.395699 yards.
(48771, 19017, 1, 7882.73, -799.367, -16.621, 2.70526, 0, 0, 0.976295, 0.216442, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 48769 at 100.429901 yards.
(48931, 19017, 1, 5820.37, 815.294, -31.9575, 2.40855, 0, 0, 0.93358, 0.358368, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 48920 at 93.569145 yards.
(48950, 19017, 1, 4644.36, 764.898, -2.83767, 2.40855, 0, 0, 0.93358, 0.358368, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 48937 at 116.243607 yards.
(48909, 19017, 1, 7847.24, -476.462, -34.017, 2.86234, 0, 0, 0.990268, 0.139175, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 48897 at 183.379822 yards.
(48917, 19017, 1, 4575.14, 1033.33, -18.1061, 2.18166, 0, 0, 0.887011, 0.461749, 3600, 3600, 1, 100, 0, 10); -- Closest existing guid is 48913 at 140.015320 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(48901, 1344, 0, 'Giant Clam', 0, 10), -- Darkshore - Giant Clam
(48770, 1344, 0, 'Giant Clam', 0, 10), -- Darkshore - Giant Clam
(48930, 1344, 0, 'Giant Clam', 0, 10), -- Darkshore - Giant Clam
(48771, 1344, 0, 'Giant Clam', 0, 10), -- Darkshore - Giant Clam
(48931, 1344, 0, 'Giant Clam', 0, 10), -- Darkshore - Giant Clam
(48950, 1344, 0, 'Giant Clam', 0, 10), -- Darkshore - Giant Clam
(48909, 1344, 0, 'Giant Clam', 0, 10), -- Darkshore - Giant Clam
(48917, 1344, 0, 'Giant Clam', 0, 10); -- Darkshore - Giant Clam

-- Missing Giant Clam spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(48949, 19017, 1, 3691.17, 1009.16, -3.05448, 0.541051, 0, 0, 0.267238, 0.963631, 3600, 3600, 1, 100, 0, 10); -- Closest existing guid is 48941 at 268.891571 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(48949, 1345, 0, 'Giant Clam', 0, 10); -- Ashenvale - Giant Clam

UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `id` = 19017;

-- Correct position of Giant Softshell Clam in Desolace (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-673.472, `position_y`=2976.09, `position_z`=-22.2912, `orientation`=2.3911, `rotation0`=0, `rotation1`=0, `rotation2`=0.930417, `rotation3`=0.366502 WHERE `guid`=8981;

-- Missing Giant Softshell Clam spawns in Desolace.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(31980, 177784, 1, -505.958, 2860.44, -65.4643, 4.10153, 0, 0, -0.887011, 0.461749, 120, 120, 1, 100, 0, 10), -- Closest existing guid is 31979 at 73.707977 yards.
(31990, 177784, 1, -329.93, 2886.15, -47.7774, 4.08407, 0, 0, -0.891006, 0.453991, 120, 120, 1, 100, 0, 10), -- Closest existing guid is 31988 at 73.188118 yards.
(31991, 177784, 1, -367.808, 2851.08, -20.9613, 3.75246, 0, 0, -0.953716, 0.300708, 120, 120, 1, 100, 0, 10), -- Closest existing guid is 31988 at 90.703789 yards.
(31986, 177784, 1, -421.403, 2883.82, -26.2859, 4.81711, 0, 0, -0.66913, 0.743145, 120, 120, 1, 100, 0, 10); -- Closest existing guid is 31982 at 96.392052 yards.

UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `id` = 177784;

UPDATE `pool_template` SET `max_limit`=6 WHERE  `entry`=1343;
UPDATE `pool_template` SET `max_limit`=18 WHERE  `entry`=1344;
UPDATE `pool_template` SET `max_limit`=2 WHERE  `entry`=1345;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
