DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220502174249');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220502174249');
-- Add your query below.


-- Correct position of Arthas' Tears in Western Plaguelands (position is off by 2.82765 yards).
UPDATE `gameobject` SET `position_x`=1434.88, `position_y`=-1542.22, `position_z`=55.5123, `orientation`=1.25664, `rotation0`=0, `rotation1`=0, `rotation2`=0.587785, `rotation3`=0.809017 WHERE `guid`=16022;

-- Correct position of Arthas' Tears in Western Plaguelands (position is off by 0.969753 yards).
UPDATE `gameobject` SET `position_x`=1382.68, `position_y`=-1814.81, `position_z`=61.294, `orientation`=0.296705, `rotation0`=0, `rotation1`=0, `rotation2`=0.147809, `rotation3`=0.989016 WHERE `guid`=16003;

-- Correct position of Arthas' Tears in Western Plaguelands (position is off by 0.506465 yards).
UPDATE `gameobject` SET `position_x`=1842.55, `position_y`=-2206.58, `position_z`=62.1356, `orientation`=3.76991, `rotation0`=0, `rotation1`=0, `rotation2`=-0.951056, `rotation3`=0.309017 WHERE `guid`=16015;

-- Correct position of Arthas' Tears in Western Plaguelands (position is off by 0.965545 yards).
UPDATE `gameobject` SET `position_x`=1558.22, `position_y`=-995.456, `position_z`=67.24, `orientation`=4.59022, `rotation0`=0, `rotation1`=0, `rotation2`=-0.748956, `rotation3`=0.66262 WHERE `guid`=15966;

-- Correct position of Arthas' Tears in Western Plaguelands (position is off by 1.01018 yards).
UPDATE `gameobject` SET `position_x`=1852.22, `position_y`=-1382.49, `position_z`=59.8972, `orientation`=4.36332, `rotation0`=0, `rotation1`=0, `rotation2`=-0.819152, `rotation3`=0.573577 WHERE `guid`=16011;

-- Correct position of Arthas' Tears in Western Plaguelands (position is off by 0.791767 yards).
UPDATE `gameobject` SET `position_x`=2159.69, `position_y`=-1574.27, `position_z`=68.0867, `orientation`=4.76475, `rotation0`=0, `rotation1`=0, `rotation2`=-0.688354, `rotation3`=0.725374 WHERE `guid`=15992;

-- Correct position of Arthas' Tears in Eastern Plaguelands (position is off by 0.291844 yards).
UPDATE `gameobject` SET `position_x`=2309.34, `position_y`=-5247.21, `position_z`=84.3962, `orientation`=5.91667, `rotation0`=0, `rotation1`=0, `rotation2`=-0.182235, `rotation3`=0.983255 WHERE `guid`=15991;

-- Correct position of Arthas' Tears in Western Plaguelands (position is off by 0.377129 yards).
UPDATE `gameobject` SET `position_x`=1482.34, `position_y`=-1217.8, `position_z`=62.6274, `orientation`=1.23918, `rotation0`=0, `rotation1`=0, `rotation2`=0.580703, `rotation3`=0.814116 WHERE `guid`=15967;

-- Correct position of Arthas' Tears in Eastern Plaguelands (position is off by 0.733335 yards).
UPDATE `gameobject` SET `position_x`=2861.6, `position_y`=-4063.8, `position_z`=99.4177, `orientation`=0.0523589, `rotation0`=0, `rotation1`=0, `rotation2`=0.0261765, `rotation3`=0.999657 WHERE `guid`=15974;

-- Missing Arthas' Tears spawns in Western Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(16682, 142141, 0, 1075.39, -1688.27, 62.45, 3.73501, 0, 0, -0.956305, 0.292372, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15982 at 8.731653 yards.
(16683, 142141, 0, 1728.19, -2407.51, 60.5032, 5.39307, 0, 0, -0.430511, 0.902586, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16008 at 213.475937 yards.
(45628, 142141, 0, 2888.72, -1406.39, 148.374, 1.69297, 0, 0, 0.748956, 0.66262, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45555 at 569.313110 yards.
(16687, 142141, 0, 1552.86, -1768.98, 61.8234, 4.32842, 0, 0, -0.829037, 0.559194, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15892 at 121.695641 yards.
(16688, 142141, 0, 1821.96, -2044.74, 75.4277, 0.715585, 0, 0, 0.350207, 0.936672, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16021 at 132.788040 yards.
(16690, 142141, 0, 2009.31, -1584.37, 59.8575, 3.59538, 0, 0, -0.97437, 0.224951, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15990 at 54.698650 yards.
(16691, 142141, 0, 1955.09, -2288.2, 60.9163, 4.08407, 0, 0, -0.891006, 0.453991, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16015 at 138.561447 yards.
(16694, 142141, 0, 1450, -1347.86, 61.3475, 1.76278, 0, 0, 0.771625, 0.636078, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16007 at 9.585460 yards.
(16695, 142141, 0, 1922.05, -1480.68, 61.1334, 3.90954, 0, 0, -0.927183, 0.374608, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16011 at 119.575386 yards.
(16696, 142141, 0, 1998.11, -1775.55, 64.2751, 1.18682, 0, 0, 0.559193, 0.829038, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15987 at 206.613312 yards.
(45629, 142141, 0, 1607.96, -2178.57, 55.0344, 1.0821, 0, 0, 0.515038, 0.857168, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45541 at 178.819229 yards.
(45630, 142141, 0, 2999.7, -1564.12, 147.003, 4.90438, 0, 0, -0.636078, 0.771625, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 45555 at 672.044678 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(16682, 1259, 0, 'Arthas Tears', 0, 10), -- Arthas Tears in Western Plaguelands 46 objects total
(16683, 1259, 0, 'Arthas Tears', 0, 10), -- Arthas Tears in Western Plaguelands 46 objects total
(45628, 1259, 0, 'Arthas Tears', 0, 10), -- Arthas Tears in Western Plaguelands 46 objects total
(16687, 1259, 0, 'Arthas Tears', 0, 10), -- Arthas Tears in Western Plaguelands 46 objects total
(16688, 1259, 0, 'Arthas Tears', 0, 10), -- Arthas Tears in Western Plaguelands 46 objects total
(16690, 1259, 0, 'Arthas Tears', 0, 10), -- Arthas Tears in Western Plaguelands 46 objects total
(16691, 1259, 0, 'Arthas Tears', 0, 10), -- Arthas Tears in Western Plaguelands 46 objects total
(16694, 1259, 0, 'Arthas Tears', 0, 10), -- Arthas Tears in Western Plaguelands 46 objects total
(16695, 1259, 0, 'Arthas Tears', 0, 10), -- Arthas Tears in Western Plaguelands 46 objects total
(16696, 1259, 0, 'Arthas Tears', 0, 10), -- Arthas Tears in Western Plaguelands 46 objects total
(45629, 1259, 0, 'Arthas Tears', 0, 10), -- Arthas Tears in Western Plaguelands 46 objects total
(45630, 1259, 0, 'Arthas Tears', 0, 10); -- Arthas Tears in Western Plaguelands 46 objects total

-- Missing Arthas' Tears spawns in Eastern Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(45832, 142141, 0, 2929.91, -4735.68, 91.4919, 4.46804, 0, 0, -0.788011, 0.615662, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45824 at 326.377747 yards.
(16684, 142141, 0, 1949.96, -3962.64, 133.924, 1.58825, 0, 0, 0.71325, 0.70091, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16012 at 126.404938 yards.
(45951, 142141, 0, 3192.78, -3243.9, 153.666, 5.16618, 0, 0, -0.529919, 0.848048, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45912 at 230.550385 yards.
(16685, 142141, 0, 1499.3, -3183.54, 111.201, 0.453785, 0, 0, 0.224951, 0.97437, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15989 at 284.229950 yards.
(33340, 142141, 0, 1986, -4740.94, 97.6036, 4.24115, 0, 0, -0.85264, 0.522499, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 33307 at 291.979919 yards.
(16686, 142141, 0, 2913.5, -4492.8, 91.647, 2.56563, 0, 0, 0.958819, 0.284016, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15974 at 431.914032 yards.
(45952, 142141, 0, 3305.3, -3724.89, 156.091, 2.21657, 0, 0, 0.894934, 0.446199, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45912 at 449.932983 yards.
(16689, 142141, 0, 1742.24, -3982.27, 129.338, 6.23083, 0, 0, -0.0261765, 0.999657, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16017 at 128.782639 yards.
(16692, 142141, 0, 2011.19, -3766.6, 128.541, 6.26573, 0, 0, -0.00872612, 0.999962, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15985 at 71.467079 yards.
(16693, 142141, 0, 2059.79, -5247.57, 86.0375, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15991 at 249.355698 yards.
(45953, 142141, 0, 3196.24, -3516.36, 149.184, 5.00909, 0, 0, -0.594823, 0.803857, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45912 at 227.420944 yards.
(45863, 142141, 0, 2887.04, -3766.36, 112.598, 3.50812, 0, 0, -0.983254, 0.182238, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45860 at 192.357056 yards.
(33345, 142141, 0, 1924.72, -4990.11, 75.2966, 1.81514, 0, 0, 0.788011, 0.615662, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 33307 at 434.472839 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(45832, 1266, 0, 'Arthas Tears', 0, 10), -- Arthas Tears in Eastern Plaguelands 144 objects total
(16684, 1266, 0, 'Arthas Tears', 0, 10), -- Arthas Tears in Eastern Plaguelands 144 objects total
(45951, 1266, 0, 'Arthas Tears', 0, 10), -- Arthas Tears in Eastern Plaguelands 144 objects total
(16685, 1266, 0, 'Arthas Tears', 0, 10), -- Arthas Tears in Eastern Plaguelands 144 objects total
(33340, 1266, 0, 'Arthas Tears', 0, 10), -- Arthas Tears in Eastern Plaguelands 144 objects total
(16686, 1266, 0, 'Arthas Tears', 0, 10), -- Arthas Tears in Eastern Plaguelands 144 objects total
(45952, 1266, 0, 'Arthas Tears', 0, 10), -- Arthas Tears in Eastern Plaguelands 144 objects total
(16689, 1266, 0, 'Arthas Tears', 0, 10), -- Arthas Tears in Eastern Plaguelands 144 objects total
(16692, 1266, 0, 'Arthas Tears', 0, 10), -- Arthas Tears in Eastern Plaguelands 144 objects total
(16693, 1266, 0, 'Arthas Tears', 0, 10), -- Arthas Tears in Eastern Plaguelands 144 objects total
(45953, 1266, 0, 'Arthas Tears', 0, 10), -- Arthas Tears in Eastern Plaguelands 144 objects total
(45863, 1266, 0, 'Arthas Tears', 0, 10), -- Arthas Tears in Eastern Plaguelands 144 objects total
(33345, 1266, 0, 'Arthas Tears', 0, 10); -- Arthas Tears in Eastern Plaguelands 144 objects total

-- Missing Arthas' Tears spawns in Felwood.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(48932, 176642, 1, 6526.05, -1016.26, 433.901, 5.58505, 0, 0, -0.34202, 0.939693, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 48926 at 194.213211 yards.
(48933, 176642, 1, 6264.92, -1559.39, 451.637, 3.63029, 0, 0, -0.970295, 0.241925, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 48926 at 791.530823 yards.
(48962, 176642, 1, 4349.79, -513.339, 299.717, 0.087266, 0, 0, 0.0436192, 0.999048, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 48961 at 378.600006 yards.
(48949, 176642, 1, 4545.12, -940.496, 321.687, 6.16101, 0, 0, -0.0610485, 0.998135, 2700, 2700, 1, 100, 0, 10); -- Closest existing guid is 48946 at 390.299591 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(48932, 1226, 0, 'Arthas Tears', 0, 10), -- Arthas Tears in Felwood 23 objects total
(48933, 1226, 0, 'Arthas Tears', 0, 10), -- Arthas Tears in Felwood 23 objects total
(48962, 1226, 0, 'Arthas Tears', 0, 10), -- Arthas Tears in Felwood 23 objects total
(48949, 1226, 0, 'Arthas Tears', 0, 10); -- Arthas Tears in Felwood 23 objects total-- Correct position of Black Lotus in Burning Steppes (position is off by 2.37545 yards).
UPDATE `gameobject` SET `position_x`=-7955.56, `position_y`=-2506.87, `position_z`=133.805, `orientation`=3.42085, `rotation0`=0, `rotation1`=0, `rotation2`=-0.990268, `rotation3`=0.139175 WHERE `guid`=3998253;

-- Correct position of Black Lotus in Eastern Plaguelands (position is off by 4.41136 yards).
UPDATE `gameobject` SET `position_x`=3008.31, `position_y`=-4925.18, `position_z`=102.372, `orientation`=0.418879, `rotation0`=0, `rotation1`=0, `rotation2`=0.207911, `rotation3`=0.978148 WHERE `guid`=3998144;

-- Correct position of Black Lotus in Burning Steppes (position is off by 2.94366 yards).
UPDATE `gameobject` SET `position_x`=-7776.3, `position_y`=-2699.34, `position_z`=173.787, `orientation`=4.5204, `rotation0`=0, `rotation1`=0, `rotation2`=-0.771625, `rotation3`=0.636078 WHERE `guid`=3998254;

-- Correct position of Blindweed in Swamp of Sorrows (position is off by 0.317918 yards).
UPDATE `gameobject` SET `position_x`=-10491.7, `position_y`=-2594.1, `position_z`=21.2712, `orientation`=3.21142, `rotation0`=0, `rotation1`=0, `rotation2`=-0.999391, `rotation3`=0.0349061 WHERE `guid`=16361;

-- Correct position of Blindweed in Swamp of Sorrows (position is off by 0.244234 yards).
UPDATE `gameobject` SET `position_x`=-10408.2, `position_y`=-2826.86, `position_z`=20.2505, `orientation`=1.69297, `rotation0`=0, `rotation1`=0, `rotation2`=0.748956, `rotation3`=0.66262 WHERE `guid`=16372;

-- Correct position of Blindweed in Swamp of Sorrows (position is off by 0.100586 yards).
UPDATE `gameobject` SET `position_x`=-10136.6, `position_y`=-3063.92, `position_z`=21.7756, `orientation`=0.802851, `rotation0`=0, `rotation1`=0, `rotation2`=0.390731, `rotation3`=0.920505 WHERE `guid`=14016;

-- Correct position of Blindweed in Un'Goro Crater (position is off by 0.650948 yards).
UPDATE `gameobject` SET `position_x`=-6572.63, `position_y`=-1480.4, `position_z`=-273.356, `orientation`=4.67748, `rotation0`=0, `rotation1`=0, `rotation2`=-0.719339, `rotation3`=0.694659 WHERE `guid`=16303;

-- Correct position of Blindweed in Un'Goro Crater (position is off by 1.19911 yards).
UPDATE `gameobject` SET `position_x`=-6541.31, `position_y`=-1263.1, `position_z`=-271.363, `orientation`=6.10865, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0871553, `rotation3`=0.996195 WHERE `guid`=16392;

-- Correct position of Blindweed in Un'Goro Crater (position is off by 1.39228 yards).
UPDATE `gameobject` SET `position_x`=-6442.17, `position_y`=-1417.75, `position_z`=-275.085, `orientation`=2.60054, `rotation0`=0, `rotation1`=0, `rotation2`=0.96363, `rotation3`=0.267241 WHERE `guid`=16329;

-- Correct position of Blindweed in Un'Goro Crater (position is off by 0.575382 yards).
UPDATE `gameobject` SET `position_x`=-6427.67, `position_y`=-1246.87, `position_z`=-272.547, `orientation`=2.58308, `rotation0`=0, `rotation1`=0, `rotation2`=0.961261, `rotation3`=0.27564 WHERE `guid`=16323;

-- Correct position of Blindweed in Un'Goro Crater (position is off by 1.04749 yards).
UPDATE `gameobject` SET `position_x`=-6712.71, `position_y`=-1690.77, `position_z`=-271.984, `orientation`=0.349065, `rotation0`=0, `rotation1`=0, `rotation2`=0.173648, `rotation3`=0.984808 WHERE `guid`=16378;

-- Correct position of Blindweed in Swamp of Sorrows (position is off by 4.16058 yards).
UPDATE `gameobject` SET `position_x`=-10242.2, `position_y`=-3376.07, `position_z`=20.5494, `orientation`=1.3439, `rotation0`=0, `rotation1`=0, `rotation2`=0.622514, `rotation3`=0.782609 WHERE `guid`=16379;

-- Correct position of Blindweed in Un'Goro Crater (position is off by 0.739797 yards).
UPDATE `gameobject` SET `position_x`=-6426.58, `position_y`=-1055.22, `position_z`=-272.403, `orientation`=1.23918, `rotation0`=0, `rotation1`=0, `rotation2`=0.580703, `rotation3`=0.814116 WHERE `guid`=16396;

-- Correct position of Blindweed in Swamp of Sorrows (position is off by 0.554703 yards).
UPDATE `gameobject` SET `position_x`=-10503.5, `position_y`=-2528.76, `position_z`=20.897, `orientation`=1.36136, `rotation0`=0, `rotation1`=0, `rotation2`=0.62932, `rotation3`=0.777146 WHERE `guid`=16375;

-- Correct position of Blindweed in Swamp of Sorrows (position is off by 1.20179 yards).
UPDATE `gameobject` SET `position_x`=-10372.5, `position_y`=-3527.04, `position_z`=19.7394, `orientation`=3.31614, `rotation0`=0, `rotation1`=0, `rotation2`=-0.996194, `rotation3`=0.087165 WHERE `guid`=16299;

-- Missing Blindweed spawns in Swamp of Sorrows.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(16697, 142143, 0, -10222.2, -3035.99, 20.7879, 3.10665, 0, 0, 0.999847, 0.0174693, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16320 at 16.013880 yards.
(16698, 142143, 0, -10171, -3299.99, 19.4875, 3.68265, 0, 0, -0.96363, 0.267241, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16308 at 12.058966 yards.
(16699, 142143, 0, -10458.4, -2887.71, 20.1373, 4.76475, 0, 0, -0.688354, 0.725374, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16411 at 22.300915 yards.
(16700, 142143, 0, -10235.4, -2803.57, 20.9111, 1.76278, 0, 0, 0.771625, 0.636078, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16410 at 10.633319 yards.
(16701, 142143, 0, -10357, -3025.39, 20.6107, 2.77507, 0, 0, 0.983254, 0.182238, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16348 at 21.998701 yards.
(16702, 142143, 0, -10313.8, -3033.26, 19.5618, 0.767944, 0, 0, 0.374606, 0.927184, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16359 at 47.193073 yards.
(16703, 142143, 0, -10321.2, -2995.54, 20.3654, 4.79966, 0, 0, -0.67559, 0.737278, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16359 at 8.763729 yards.
(16704, 142143, 0, -10461.1, -2672.9, 22.8257, 4.46804, 0, 0, -0.788011, 0.615662, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16412 at 39.076004 yards.
(16706, 142143, 0, -10641.8, -2588.92, 22.8873, 0.279252, 0, 0, 0.139173, 0.990268, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16341 at 13.873391 yards.
(30620, 142143, 0, -10580.5, -2562.1, 21.5194, 2.21657, 0, 0, 0.894934, 0.446199, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 30615 at 57.158424 yards.
(16707, 142143, 0, -10122.4, -3323.38, 20.8346, 0.279252, 0, 0, 0.139173, 0.990268, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16308 at 49.914848 yards.
(30961, 142143, 0, -10138.9, -3363.5, 20.8903, 0.104719, 0, 0, 0.0523357, 0.99863, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 30946 at 46.161102 yards.
(16708, 142143, 0, -10114.9, -2981.81, 19.8928, 2.54818, 0, 0, 0.956305, 0.292372, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16319 at 19.518196 yards.
(16709, 142143, 0, -10253, -3478.13, 20.0721, 0.139624, 0, 0, 0.0697556, 0.997564, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16407 at 17.204317 yards.
(16723, 142143, 0, -10441.7, -2949.74, 20.4125, 3.90954, 0, 0, -0.927183, 0.374608, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16370 at 28.791533 yards.
(16725, 142143, 0, -10232.6, -3237.06, 20.4871, 0.680677, 0, 0, 0.333806, 0.942642, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16349 at 7.809808 yards.
(16726, 142143, 0, -10657.7, -4079.63, 19.5799, 2.16421, 0, 0, 0.882947, 0.469473, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16314 at 25.577696 yards.
(16727, 142143, 0, -10156.6, -3020.3, 19.5942, 6.19592, 0, 0, -0.0436192, 0.999048, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16307 at 5.841731 yards.
(16728, 142143, 0, -10154.7, -3157.6, 20.0131, 2.80998, 0, 0, 0.986285, 0.16505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16365 at 8.799077 yards.
(16729, 142143, 0, -10117.8, -3817.3, 19.4778, 1.16937, 0, 0, 0.551936, 0.833886, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16344 at 15.059281 yards.
(16730, 142143, 0, -9852.09, -3917.35, 19.15, 4.66003, 0, 0, -0.725374, 0.688355, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16322 at 14.065643 yards.
(16731, 142143, 0, -10645.7, -4035.19, 20.4782, 3.7001, 0, 0, -0.961261, 0.27564, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16354 at 17.255957 yards.
(16732, 142143, 0, -10480.5, -3459.36, 20.3456, 1.13446, 0, 0, 0.537299, 0.843392, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16327 at 14.710502 yards.
(16770, 142143, 0, -10172.4, -2481.55, 26.186, 4.29351, 0, 0, -0.83867, 0.54464, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16360 at 10.493665 yards.
(16771, 142143, 0, -10176.8, -3466.55, 20.1173, 0.855211, 0, 0, 0.414693, 0.909961, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16335 at 35.284901 yards.
(30621, 142143, 0, -10121.9, -2446.31, 29.0265, 4.34587, 0, 0, -0.824126, 0.566406, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 30616 at 57.641037 yards.
(16772, 142143, 0, -10357.6, -2897.18, 19.517, 1.22173, 0, 0, 0.573576, 0.819152, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16357 at 51.292625 yards.
(16774, 142143, 0, -10334.2, -3147.92, 18.8815, 5.96903, 0, 0, -0.156434, 0.987688, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16289 at 19.500536 yards.
(16776, 142143, 0, -10161, -4045.61, 19.7449, 2.70526, 0, 0, 0.976295, 0.216442, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16353 at 14.416262 yards.
(16817, 142143, 0, -10744.6, -3949.81, 19.419, 5.09636, 0, 0, -0.559193, 0.829038, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16389 at 98.901527 yards.
(16818, 142143, 0, -10154.1, -3612.59, 20.8298, 4.60767, 0, 0, -0.743144, 0.669131, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16350 at 45.676254 yards.
(14190, 142143, 0, -10384.2, -3003.25, 19.8948, 3.94445, 0, 0, -0.920505, 0.390732, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 13969 at 20.419300 yards.
(16819, 142143, 0, -10514.7, -4232.38, 20.9734, 2.25147, 0, 0, 0.902585, 0.430512, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16356 at 24.835833 yards.
(16820, 142143, 0, -10242.6, -4160.91, 19.8102, 1.15192, 0, 0, 0.544639, 0.838671, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16395 at 14.903564 yards.
(16821, 142143, 0, -10095.6, -3478.14, 19.7837, 5.98648, 0, 0, -0.147809, 0.989016, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16295 at 8.870229 yards.
(16822, 142143, 0, -9916.34, -3755.5, 19.711, 4.43314, 0, 0, -0.798635, 0.601815, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16331 at 8.965070 yards.
(16823, 142143, 0, -10288, -2913.33, 19.7969, 5.20108, 0, 0, -0.515038, 0.857168, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16366 at 5.774481 yards.
(16824, 142143, 0, -10189.2, -2615.33, 28.1262, 5.46288, 0, 0, -0.398748, 0.91706, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16313 at 66.852020 yards.
(16825, 142143, 0, -10124.2, -3547.14, 21.207, 3.35105, 0, 0, -0.994521, 0.104536, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16350 at 27.784519 yards.
(16826, 142143, 0, -10090.8, -3892.05, 20.1091, 5.63741, 0, 0, -0.317305, 0.948324, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16402 at 13.216190 yards.
(16827, 142143, 0, -10199.6, -3054.29, 21.0531, 2.40855, 0, 0, 0.93358, 0.358368, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16320 at 15.214132 yards.
(16828, 142143, 0, -10291, -3540.71, 20.7133, 5.49779, 0, 0, -0.382683, 0.92388, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 16407 at 74.049072 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(16697, 1312, 0, 'Blindweed', 0, 10), -- Blindweed in Swamp of Sorrows (2) 64 objects total
(16698, 1312, 0, 'Blindweed', 0, 10), -- Blindweed in Swamp of Sorrows (2) 64 objects total
(16699, 1312, 0, 'Blindweed', 0, 10), -- Blindweed in Swamp of Sorrows (2) 64 objects total
(16700, 1312, 0, 'Blindweed', 0, 10), -- Blindweed in Swamp of Sorrows (2) 64 objects total
(16701, 1312, 0, 'Blindweed', 0, 10), -- Blindweed in Swamp of Sorrows (2) 64 objects total
(16702, 1312, 0, 'Blindweed', 0, 10), -- Blindweed in Swamp of Sorrows (2) 64 objects total
(16703, 1312, 0, 'Blindweed', 0, 10), -- Blindweed in Swamp of Sorrows (2) 64 objects total
(16704, 1312, 0, 'Blindweed', 0, 10), -- Blindweed in Swamp of Sorrows (2) 64 objects total
(16706, 1312, 0, 'Blindweed', 0, 10), -- Blindweed in Swamp of Sorrows (2) 64 objects total
(30620, 1312, 0, 'Blindweed', 0, 10), -- Blindweed in Swamp of Sorrows (2) 64 objects total
(16707, 1312, 0, 'Blindweed', 0, 10), -- Blindweed in Swamp of Sorrows (2) 64 objects total
(30961, 1312, 0, 'Blindweed', 0, 10), -- Blindweed in Swamp of Sorrows (2) 64 objects total
(16708, 1312, 0, 'Blindweed', 0, 10), -- Blindweed in Swamp of Sorrows (2) 64 objects total
(16709, 1312, 0, 'Blindweed', 0, 10), -- Blindweed in Swamp of Sorrows (2) 64 objects total
(16723, 1312, 0, 'Blindweed', 0, 10), -- Blindweed in Swamp of Sorrows (2) 64 objects total
(16725, 1312, 0, 'Blindweed', 0, 10), -- Blindweed in Swamp of Sorrows (2) 64 objects total
(16726, 1307, 0, 'Blindweed', 0, 10), -- Blindweed in Swamp of Sorrows (1) 61 objects total
(16727, 1312, 0, 'Blindweed', 0, 10), -- Blindweed in Swamp of Sorrows (2) 64 objects total
(16728, 1312, 0, 'Blindweed', 0, 10), -- Blindweed in Swamp of Sorrows (2) 64 objects total
(16729, 1307, 0, 'Blindweed', 0, 10), -- Blindweed in Swamp of Sorrows (1) 61 objects total
(16730, 1307, 0, 'Blindweed', 0, 10), -- Blindweed in Swamp of Sorrows (1) 61 objects total
(16731, 1307, 0, 'Blindweed', 0, 10), -- Blindweed in Swamp of Sorrows (1) 61 objects total
(16732, 1312, 0, 'Blindweed', 0, 10), -- Blindweed in Swamp of Sorrows (2) 64 objects total
(16770, 1312, 0, 'Blindweed', 0, 10), -- Blindweed in Swamp of Sorrows (2) 64 objects total
(16771, 1312, 0, 'Blindweed', 0, 10), -- Blindweed in Swamp of Sorrows (2) 64 objects total
(30621, 1312, 0, 'Blindweed', 0, 10), -- Blindweed in Swamp of Sorrows (2) 64 objects total
(16772, 1312, 0, 'Blindweed', 0, 10), -- Blindweed in Swamp of Sorrows (2) 64 objects total
(16774, 1312, 0, 'Blindweed', 0, 10), -- Blindweed in Swamp of Sorrows (2) 64 objects total
(16776, 1307, 0, 'Blindweed', 0, 10), -- Blindweed in Swamp of Sorrows (1) 61 objects total
(16817, 1307, 0, 'Blindweed', 0, 10), -- Blindweed in Swamp of Sorrows (1) 61 objects total
(16818, 1307, 0, 'Blindweed', 0, 10), -- Blindweed in Swamp of Sorrows (1) 61 objects total
(14190, 1312, 0, 'Blindweed', 0, 10), -- Blindweed in Swamp of Sorrows (2) 64 objects total
(16819, 1307, 0, 'Blindweed', 0, 10), -- Blindweed in Swamp of Sorrows (1) 61 objects total
(16820, 1307, 0, 'Blindweed', 0, 10), -- Blindweed in Swamp of Sorrows (1) 61 objects total
(16821, 1312, 0, 'Blindweed', 0, 10), -- Blindweed in Swamp of Sorrows (2) 64 objects total
(16822, 1307, 0, 'Blindweed', 0, 10), -- Blindweed in Swamp of Sorrows (1) 61 objects total
(16823, 1312, 0, 'Blindweed', 0, 10), -- Blindweed in Swamp of Sorrows (2) 64 objects total
(16824, 1312, 0, 'Blindweed', 0, 10), -- Blindweed in Swamp of Sorrows (2) 64 objects total
(16825, 1307, 0, 'Blindweed', 0, 10), -- Blindweed in Swamp of Sorrows (1) 61 objects total
(16826, 1307, 0, 'Blindweed', 0, 10), -- Blindweed in Swamp of Sorrows (1) 61 objects total
(16827, 1312, 0, 'Blindweed', 0, 10), -- Blindweed in Swamp of Sorrows (2) 64 objects total
(16828, 1312, 0, 'Blindweed', 0, 10); -- Blindweed in Swamp of Sorrows (2) 64 objects total

-- Missing Blindweed spawns in Un'Goro Crater.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(16724, 142143, 1, -6785.18, -1242.31, -270.824, 5.53269, 0, 0, -0.366501, 0.930418, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 16333 at 17.745653 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(16724, 1216, 0, 'Blindweed', 0, 10); -- Blindweed in Ungoro 16 objects total

-- Correct position of Briarthorn in Duskwood (position is off by 1.09988 yards).
UPDATE `gameobject` SET `position_x`=-10743.1, `position_y`=-646.991, `position_z`=41.3031, `orientation`=3.59538, `rotation0`=0, `rotation1`=0, `rotation2`=-0.97437, `rotation3`=0.224951 WHERE `guid`=2726;

-- Correct position of Briarthorn in Duskwood (position is off by 1.41217 yards).
UPDATE `gameobject` SET `position_x`=-10705.2, `position_y`=-942.698, `position_z`=76.341, `orientation`=4.17134, `rotation0`=0, `rotation1`=0, `rotation2`=-0.870356, `rotation3`=0.492424 WHERE `guid`=2688;

-- Correct position of Briarthorn in Duskwood (position is off by 0.400487 yards).
UPDATE `gameobject` SET `position_x`=-10871.4, `position_y`=-1205, `position_z`=40.8238, `orientation`=0.0349062, `rotation0`=0, `rotation1`=0, `rotation2`=0.0174522, `rotation3`=0.999848 WHERE `guid`=2757;

-- Correct position of Briarthorn in Silverpine Forest (position is off by 0.973648 yards).
UPDATE `gameobject` SET `position_x`=429.245, `position_y`=1182.35, `position_z`=87.968, `orientation`=0.296705, `rotation0`=0, `rotation1`=0, `rotation2`=0.147809, `rotation3`=0.989016 WHERE `guid`=2733;

-- Correct position of Briarthorn in Hillsbrad Foothills (position is off by 0.318784 yards).
UPDATE `gameobject` SET `position_x`=1.00076, `position_y`=-1015.31, `position_z`=57.7936, `orientation`=1.95477, `rotation0`=0, `rotation1`=0, `rotation2`=0.829038, `rotation3`=0.559193 WHERE `guid`=2873;

-- Correct position of Briarthorn in Wetlands (position is off by 0.914336 yards).
UPDATE `gameobject` SET `position_x`=-3183.31, `position_y`=-1111.6, `position_z`=9.17652, `orientation`=5.91667, `rotation0`=0, `rotation1`=0, `rotation2`=-0.182235, `rotation3`=0.983255 WHERE `guid`=2623;

-- Correct position of Briarthorn in Duskwood (position is off by 1.51551 yards).
UPDATE `gameobject` SET `position_x`=-10548.4, `position_y`=-1001.86, `position_z`=56.3435, `orientation`=5.55015, `rotation0`=0, `rotation1`=0, `rotation2`=-0.358368, `rotation3`=0.93358 WHERE `guid`=2570;

-- Correct position of Briarthorn in Duskwood (position is off by 0.145931 yards).
UPDATE `gameobject` SET `position_x`=-11018.9, `position_y`=-436.104, `position_z`=30.6316, `orientation`=3.94445, `rotation0`=0, `rotation1`=0, `rotation2`=-0.920505, `rotation3`=0.390732 WHERE `guid`=2777;

-- Correct position of Briarthorn in Westfall (position is off by 0.97794 yards).
UPDATE `gameobject` SET `position_x`=-10362.4, `position_y`=784.97, `position_z`=30.9238, `orientation`=4.7822, `rotation0`=0, `rotation1`=0, `rotation2`=-0.681998, `rotation3`=0.731354 WHERE `guid`=2828;

-- Correct position of Briarthorn in Hillsbrad Foothills (position is off by 0.429662 yards).
UPDATE `gameobject` SET `position_x`=-870.224, `position_y`=-1329.36, `position_z`=61.0104, `orientation`=2.37364, `rotation0`=0, `rotation1`=0, `rotation2`=0.927183, `rotation3`=0.374608 WHERE `guid`=2657;

-- Correct position of Briarthorn in Ashenvale (position is off by 1.16847 yards).
UPDATE `gameobject` SET `position_x`=3456.74, `position_y`=-1559.22, `position_z`=167.591, `orientation`=5.49779, `rotation0`=0, `rotation1`=0, `rotation2`=-0.382683, `rotation3`=0.92388 WHERE `guid`=2616;

-- Correct position of Briarthorn in Redridge Mountains (position is off by 0.373018 yards).
UPDATE `gameobject` SET `position_x`=-9457.76, `position_y`=-1995.27, `position_z`=96.1887, `orientation`=0.855211, `rotation0`=0, `rotation1`=0, `rotation2`=0.414693, `rotation3`=0.909961 WHERE `guid`=2697;

-- Correct position of Briarthorn in Duskwood (position is off by 0.627573 yards).
UPDATE `gameobject` SET `position_x`=-10179.5, `position_y`=-918.365, `position_z`=36.9741, `orientation`=5.89921, `rotation0`=0, `rotation1`=0, `rotation2`=-0.190808, `rotation3`=0.981627 WHERE `guid`=2606;

-- Correct position of Briarthorn in Duskwood (position is off by 0.489185 yards).
UPDATE `gameobject` SET `position_x`=-10372.8, `position_y`=-1319.4, `position_z`=52.773, `orientation`=5.70723, `rotation0`=0, `rotation1`=0, `rotation2`=-0.284015, `rotation3`=0.95882 WHERE `guid`=2608;

-- Correct position of Briarthorn in Hillsbrad Foothills (position is off by 1.3532 yards).
UPDATE `gameobject` SET `position_x`=5.47222, `position_y`=-690.028, `position_z`=75.114, `orientation`=3.3685, `rotation0`=0, `rotation1`=0, `rotation2`=-0.993571, `rotation3`=0.113208 WHERE `guid`=2831;

-- Correct position of Briarthorn in Hillsbrad Foothills (position is off by 1.0928 yards).
UPDATE `gameobject` SET `position_x`=-566.923, `position_y`=-446.173, `position_z`=40.7825, `orientation`=5.77704, `rotation0`=0, `rotation1`=0, `rotation2`=-0.25038, `rotation3`=0.968148 WHERE `guid`=2779;

-- Correct position of Briarthorn in Darkshore (position is off by 0.000101089 yards).
UPDATE `gameobject` SET `position_x`=5261.76, `position_y`=457.867, `position_z`=22.3791, `orientation`=1.06465, `rotation0`=0, `rotation1`=0, `rotation2`=0.507538, `rotation3`=0.861629 WHERE `guid`=2876;

-- Correct position of Briarthorn in Wetlands (position is off by 0.219971 yards).
UPDATE `gameobject` SET `position_x`=-2841, `position_y`=-2588.22, `position_z`=50.771, `orientation`=2.23402, `rotation0`=0, `rotation1`=0, `rotation2`=0.898793, `rotation3`=0.438373 WHERE `guid`=2821;

-- Correct position of Briarthorn in Silverpine Forest (position is off by 0.603582 yards).
UPDATE `gameobject` SET `position_x`=650.147, `position_y`=1382.63, `position_z`=82.9212, `orientation`=0.0174525, `rotation0`=0, `rotation1`=0, `rotation2`=0.00872612, `rotation3`=0.999962 WHERE `guid`=2687;

-- Correct position of Briarthorn in Hillsbrad Foothills (position is off by 0.523939 yards).
UPDATE `gameobject` SET `position_x`=-318.421, `position_y`=120.038, `position_z`=74.9717, `orientation`=5.65487, `rotation0`=0, `rotation1`=0, `rotation2`=-0.309016, `rotation3`=0.951057 WHERE `guid`=2631;

-- Correct position of Briarthorn in Wetlands (position is off by 0.34132 yards).
UPDATE `gameobject` SET `position_x`=-2892.18, `position_y`=-2564.71, `position_z`=33.8779, `orientation`=1.18682, `rotation0`=0, `rotation1`=0, `rotation2`=0.559193, `rotation3`=0.829038 WHERE `guid`=2872;

-- Correct position of Briarthorn in Ashenvale (position is off by 0.445962 yards).
UPDATE `gameobject` SET `position_x`=2048.55, `position_y`=-2083.42, `position_z`=126.551, `orientation`=4.72984, `rotation0`=0, `rotation1`=0, `rotation2`=-0.700909, `rotation3`=0.713251 WHERE `guid`=2798;

-- Correct position of Briarthorn in Wetlands (position is off by 0.0100103 yards).
UPDATE `gameobject` SET `position_x`=-3402.69, `position_y`=-3235.18, `position_z`=23.3301, `orientation`=4.10153, `rotation0`=0, `rotation1`=0, `rotation2`=-0.887011, `rotation3`=0.461749 WHERE `guid`=30009;

-- Correct position of Briarthorn in Duskwood (position is off by 0.819507 yards).
UPDATE `gameobject` SET `position_x`=-10656.5, `position_y`=-858.591, `position_z`=54.3311, `orientation`=5.044, `rotation0`=0, `rotation1`=0, `rotation2`=-0.580703, `rotation3`=0.814116 WHERE `guid`=2601;

-- Correct position of Briarthorn in Redridge Mountains (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-9100.39, `position_y`=-2601.52, `position_z`=117.783, `orientation`=2.30383, `rotation0`=0, `rotation1`=0, `rotation2`=0.913545, `rotation3`=0.406738 WHERE `guid`=2692;

-- Correct position of Briarthorn in Hillsbrad Foothills (position is off by 0.471399 yards).
UPDATE `gameobject` SET `position_x`=102.749, `position_y`=-799.808, `position_z`=79.4666, `orientation`=2.02458, `rotation0`=0, `rotation1`=0, `rotation2`=0.848047, `rotation3`=0.529921 WHERE `guid`=2707;

-- Correct position of Briarthorn in Westfall (position is off by 0.886146 yards).
UPDATE `gameobject` SET `position_x`=-10254.1, `position_y`=1136.24, `position_z`=37.0174, `orientation`=4.43314, `rotation0`=0, `rotation1`=0, `rotation2`=-0.798635, `rotation3`=0.601815 WHERE `guid`=2797;

-- Correct position of Briarthorn in Stonetalon Mountains (position is off by 0.774465 yards).
UPDATE `gameobject` SET `position_x`=1449.75, `position_y`=1006.43, `position_z`=148.514, `orientation`=3.82227, `rotation0`=0, `rotation1`=0, `rotation2`=-0.942641, `rotation3`=0.333808 WHERE `guid`=2605;

-- Correct position of Briarthorn in Silverpine Forest (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-517.273, `position_y`=1045.46, `position_z`=91.7687, `orientation`=5.20108, `rotation0`=0, `rotation1`=0, `rotation2`=-0.515038, `rotation3`=0.857168 WHERE `guid`=2795;

-- Correct position of Briarthorn in Stonetalon Mountains (position is off by 0.815681 yards).
UPDATE `gameobject` SET `position_x`=1075.61, `position_y`=644.469, `position_z`=131.669, `orientation`=4.92183, `rotation0`=0, `rotation1`=0, `rotation2`=-0.62932, `rotation3`=0.777146 WHERE `guid`=2738;

-- Correct position of Briarthorn in Stonetalon Mountains (position is off by 0.879691 yards).
UPDATE `gameobject` SET `position_x`=907.072, `position_y`=1553.71, `position_z`=-15.2808, `orientation`=2.44346, `rotation0`=0, `rotation1`=0, `rotation2`=0.939692, `rotation3`=0.34202 WHERE `guid`=2860;

-- Correct position of Briarthorn in Duskwood (position is off by 1.11485 yards).
UPDATE `gameobject` SET `position_x`=-10894, `position_y`=-1028.04, `position_z`=75.3045, `orientation`=3.10665, `rotation0`=0, `rotation1`=0, `rotation2`=0.999847, `rotation3`=0.0174693 WHERE `guid`=2647;

-- Correct position of Briarthorn in Ashenvale (position is off by 0.778387 yards).
UPDATE `gameobject` SET `position_x`=2909.53, `position_y`=-1758.76, `position_z`=203.044, `orientation`=0.209439, `rotation0`=0, `rotation1`=0, `rotation2`=0.104528, `rotation3`=0.994522 WHERE `guid`=2890;

-- Correct position of Briarthorn in Duskwood (position is off by 0.30698 yards).
UPDATE `gameobject` SET `position_x`=-10782.7, `position_y`=-197.056, `position_z`=44.2139, `orientation`=1.09956, `rotation0`=0, `rotation1`=0, `rotation2`=0.522498, `rotation3`=0.85264 WHERE `guid`=2854;

-- Correct position of Briarthorn in Darkshore (position is off by 0.999352 yards).
UPDATE `gameobject` SET `position_x`=6906.65, `position_y`=-17.683, `position_z`=23.9168, `orientation`=3.56047, `rotation0`=0, `rotation1`=0, `rotation2`=-0.978148, `rotation3`=0.207912 WHERE `guid`=2624;

-- Correct position of Briarthorn in Darkshore (position is off by 0.745806 yards).
UPDATE `gameobject` SET `position_x`=7287.13, `position_y`=-139.673, `position_z`=14.4423, `orientation`=0.418879, `rotation0`=0, `rotation1`=0, `rotation2`=0.207911, `rotation3`=0.978148 WHERE `guid`=2552;

-- Correct position of Briarthorn in Hillsbrad Foothills (position is off by 0.621596 yards).
UPDATE `gameobject` SET `position_x`=-471.567, `position_y`=-380.558, `position_z`=50.8234, `orientation`=5.86431, `rotation0`=0, `rotation1`=0, `rotation2`=-0.207911, `rotation3`=0.978148 WHERE `guid`=2544;

-- Correct position of Briarthorn in Silverpine Forest (position is off by 0.958411 yards).
UPDATE `gameobject` SET `position_x`=726.712, `position_y`=1387.03, `position_z`=72.8429, `orientation`=2.11185, `rotation0`=0, `rotation1`=0, `rotation2`=0.870356, `rotation3`=0.492424 WHERE `guid`=2546;

-- Correct position of Briarthorn in Duskwood (position is off by 1.03854 yards).
UPDATE `gameobject` SET `position_x`=-10878, `position_y`=-1103.28, `position_z`=44.7157, `orientation`=0.331611, `rotation0`=0, `rotation1`=0, `rotation2`=0.165047, `rotation3`=0.986286 WHERE `guid`=2589;

-- Correct position of Briarthorn in Westfall (position is off by 0.000200272 yards).
UPDATE `gameobject` SET `position_x`=-11166, `position_y`=503.716, `position_z`=28.6882, `orientation`=1.22173, `rotation0`=0, `rotation1`=0, `rotation2`=0.573576, `rotation3`=0.819152 WHERE `guid`=2889;

-- Correct position of Briarthorn in Redridge Mountains (position is off by 0.886509 yards).
UPDATE `gameobject` SET `position_x`=-9384.84, `position_y`=-2966.28, `position_z`=81.6427, `orientation`=1.3439, `rotation0`=0, `rotation1`=0, `rotation2`=0.622514, `rotation3`=0.782609 WHERE `guid`=2753;

-- Correct position of Briarthorn in Darkshore (position is off by 1.18454 yards).
UPDATE `gameobject` SET `position_x`=6254, `position_y`=226.941, `position_z`=39.0118, `orientation`=2.79252, `rotation0`=0, `rotation1`=0, `rotation2`=0.984807, `rotation3`=0.173652 WHERE `guid`=2899;

-- Correct position of Briarthorn in Duskwood (position is off by 0.984511 yards).
UPDATE `gameobject` SET `position_x`=-10890.9, `position_y`=-1304.39, `position_z`=51.9561, `orientation`=5.49779, `rotation0`=0, `rotation1`=0, `rotation2`=-0.382683, `rotation3`=0.92388 WHERE `guid`=2702;

-- Correct position of Briarthorn in Duskwood (position is off by 1.52466 yards).
UPDATE `gameobject` SET `position_x`=-10728.5, `position_y`=-113.812, `position_z`=36.1879, `orientation`=3.6652, `rotation0`=0, `rotation1`=0, `rotation2`=-0.965925, `rotation3`=0.258821 WHERE `guid`=2669;

-- Correct position of Briarthorn in Duskwood (position is off by 1.24467 yards).
UPDATE `gameobject` SET `position_x`=-10623.8, `position_y`=34.726, `position_z`=38.2104, `orientation`=0.977383, `rotation0`=0, `rotation1`=0, `rotation2`=0.469471, `rotation3`=0.882948 WHERE `guid`=2604;

-- Correct position of Briarthorn in Redridge Mountains (position is off by 0.167499 yards).
UPDATE `gameobject` SET `position_x`=-9625.95, `position_y`=-2543.16, `position_z`=59.2279, `orientation`=1.67551, `rotation0`=0, `rotation1`=0, `rotation2`=0.743144, `rotation3`=0.669131 WHERE `guid`=2847;

-- Correct position of Briarthorn in Silverpine Forest (position is off by 0.382767 yards).
UPDATE `gameobject` SET `position_x`=-550.962, `position_y`=798.357, `position_z`=88.7893, `orientation`=3.90954, `rotation0`=0, `rotation1`=0, `rotation2`=-0.927183, `rotation3`=0.374608 WHERE `guid`=2811;

-- Correct position of Briarthorn in Silverpine Forest (position is off by 0.302408 yards).
UPDATE `gameobject` SET `position_x`=-406.846, `position_y`=1350.45, `position_z`=37.2905, `orientation`=3.64774, `rotation0`=0, `rotation1`=0, `rotation2`=-0.968147, `rotation3`=0.250381 WHERE `guid`=2903;

-- Correct position of Briarthorn in Westfall (position is off by 0.681363 yards).
UPDATE `gameobject` SET `position_x`=-11104.1, `position_y`=733.351, `position_z`=36.4119, `orientation`=2.9845, `rotation0`=0, `rotation1`=0, `rotation2`=0.996917, `rotation3`=0.0784664 WHERE `guid`=2581;

-- Correct position of Briarthorn in Westfall (position is off by 1.18195 yards).
UPDATE `gameobject` SET `position_x`=-11073, `position_y`=1547.72, `position_z`=44.5846, `orientation`=0.733038, `rotation0`=0, `rotation1`=0, `rotation2`=0.358368, `rotation3`=0.93358 WHERE `guid`=40001;

-- Missing Briarthorn spawns in Duskwood.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(14240, 1621, 0, -10617.7, -913.665, 55.1904, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2855 at 55.175766 yards.
(14241, 1621, 0, -10287.7, -1316.91, 49.2902, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2740 at 33.668335 yards.
(14247, 1621, 0, -10724.6, 431.879, 39.0428, 0.977383, 0, 0, 0.469471, 0.882948, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2810 at 44.883308 yards.
(14288, 1621, 0, -11081.1, 327.136, 31.15, 1.48353, 0, 0, 0.67559, 0.737278, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2866 at 74.891937 yards.
(14289, 1621, 0, -10435.6, 42.7232, 44.7757, 5.2709, 0, 0, -0.484809, 0.87462, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2571 at 12.443769 yards.
(14295, 1621, 0, -10887.5, 196.304, 39.2335, 0.226892, 0, 0, 0.113203, 0.993572, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2787 at 28.548155 yards.
(14518, 1621, 0, -10953, 150.254, 40.549, 3.03684, 0, 0, 0.998629, 0.0523532, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2578 at 39.814167 yards.
(14521, 1621, 0, -11056.3, -138.435, 23.7818, 2.96704, 0, 0, 0.996194, 0.087165, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2577 at 45.423473 yards.
(14522, 1621, 0, -10213.5, 441.273, 37.4833, 1.78023, 0, 0, 0.777145, 0.629321, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2746 at 58.793011 yards.
(14523, 1621, 0, -10282.3, -948.749, 43.6457, 4.88692, 0, 0, -0.642787, 0.766045, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2639 at 11.721915 yards.
(14528, 1621, 0, -10265.8, 266.94, 39.2517, 0.785397, 0, 0, 0.382683, 0.92388, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 2711 at 12.731534 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(14240, 1113, 0, 'Briarthorn', 0, 10), -- Briarthorn in Duskwood 98 objects total
(14241, 1113, 0, 'Briarthorn', 0, 10), -- Briarthorn in Duskwood 98 objects total
(14247, 1113, 0, 'Briarthorn', 0, 10), -- Briarthorn in Duskwood 98 objects total
(14288, 1113, 0, 'Briarthorn', 0, 10), -- Briarthorn in Duskwood 98 objects total
(14289, 1113, 0, 'Briarthorn', 0, 10), -- Briarthorn in Duskwood 98 objects total
(14295, 1113, 0, 'Briarthorn', 0, 10), -- Briarthorn in Duskwood 98 objects total
(14518, 1113, 0, 'Briarthorn', 0, 10), -- Briarthorn in Duskwood 98 objects total
(14521, 1113, 0, 'Briarthorn', 0, 10), -- Briarthorn in Duskwood 98 objects total
(14522, 1113, 0, 'Briarthorn', 0, 10), -- Briarthorn in Duskwood 98 objects total
(14523, 1113, 0, 'Briarthorn', 0, 10), -- Briarthorn in Duskwood 98 objects total
(14528, 1113, 0, 'Briarthorn', 0, 10); -- Briarthorn in Duskwood 98 objects total

-- Missing Briarthorn spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(14924, 1621, 0, -2833.1, -1328.37, 8.95405, 5.86431, 0, 0, -0.207911, 0.978148, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 14869 at 56.276890 yards.
(34148, 1621, 0, -3172.37, -3059.96, 22.3382, 2.65289, 0, 0, 0.970295, 0.241925, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34141 at 118.730370 yards.
(30147, 1621, 0, -3494.52, -1487.17, 9.14602, 1.32645, 0, 0, 0.615661, 0.788011, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 30129 at 158.427521 yards.
(30148, 1621, 0, -3311.3, -2263.17, 51.8986, 4.99164, 0, 0, -0.601814, 0.798636, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 30124 at 124.205078 yards.
(30160, 1621, 0, -4154.25, -2961.75, 12.0112, 4.17134, 0, 0, -0.870356, 0.492424, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 30109 at 129.473999 yards.
(14925, 1621, 0, -3482.48, -2876.22, 9.41632, 6.03884, 0, 0, -0.121869, 0.992546, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 14889 at 220.282242 yards.
(33420, 1621, 0, -3067.73, -2692.13, 16.6828, 5.49779, 0, 0, -0.382683, 0.92388, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 33394 at 93.851852 yards.
(14929, 1621, 0, -3091.94, -2270.36, 9.32856, 1.8675, 0, 0, 0.803857, 0.594823, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 14884 at 61.263660 yards.
(14933, 1621, 0, -3108, -2187.96, 9.23061, 4.04917, 0, 0, -0.898793, 0.438373, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 14884 at 93.754288 yards.
(15187, 1621, 0, -3087.76, -2009.68, 9.41214, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 15134 at 166.956299 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(14924, 1151, 0, 'Briarthorn', 0, 10), -- Briarthorn in Wetlands 27 objects total
(34148, 1151, 0, 'Briarthorn', 0, 10), -- Briarthorn in Wetlands 27 objects total
(30147, 1151, 0, 'Briarthorn', 0, 10), -- Briarthorn in Wetlands 27 objects total
(30148, 1151, 0, 'Briarthorn', 0, 10), -- Briarthorn in Wetlands 27 objects total
(30160, 1151, 0, 'Briarthorn', 0, 10), -- Briarthorn in Wetlands 27 objects total
(14925, 1151, 0, 'Briarthorn', 0, 10), -- Briarthorn in Wetlands 27 objects total
(33420, 1151, 0, 'Briarthorn', 0, 10), -- Briarthorn in Wetlands 27 objects total
(14929, 1151, 0, 'Briarthorn', 0, 10), -- Briarthorn in Wetlands 27 objects total
(14933, 1151, 0, 'Briarthorn', 0, 10), -- Briarthorn in Wetlands 27 objects total
(15187, 1151, 0, 'Briarthorn', 0, 10); -- Briarthorn in Wetlands 27 objects total

-- Missing Briarthorn spawns in Loch Modan.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(14226, 1621, 0, -4966.77, -3511.53, 303.927, 3.28124, 0, 0, -0.997563, 0.0697661, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2658 at 165.658051 yards.
(14227, 1621, 0, -5798.29, -3770.72, 328.856, 0.872664, 0, 0, 0.422618, 0.906308, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2656 at 109.262466 yards.
(14286, 1621, 0, -5465.13, -3792.92, 316.026, 5.44543, 0, 0, -0.406736, 0.913546, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 13127 at 257.365509 yards.
(14287, 1621, 0, -5155.06, -3708.79, 311.856, 1.16937, 0, 0, 0.551936, 0.833886, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 13127 at 69.396957 yards.
(30205, 1621, 0, -4894.84, -3964.74, 297.991, 1.64061, 0, 0, 0.731353, 0.681999, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 30013 at 82.661865 yards.
(14298, 1621, 0, -5429.04, -3918.93, 341.433, 3.47321, 0, 0, -0.986285, 0.16505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 13113 at 154.892136 yards.
(14301, 1621, 0, -5714.1, -4068.01, 367.053, 0.226892, 0, 0, 0.113203, 0.993572, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12760 at 62.617397 yards.
(14463, 1621, 0, -5080.49, -3663.3, 308.979, 2.16421, 0, 0, 0.882947, 0.469473, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 13127 at 148.994019 yards.
(14479, 1621, 0, -5541.32, -3704.88, 308.421, 5.11382, 0, 0, -0.551936, 0.833886, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12816 at 207.235870 yards.
(14480, 1621, 0, -5464.19, -3965.31, 347.369, 2.07694, 0, 0, 0.861629, 0.507539, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 13113 at 148.901382 yards.
(29982, 1621, 0, -5183.13, -3836.33, 329.868, 4.10153, 0, 0, -0.887011, 0.461749, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 29981 at 116.477432 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(14226, 1165, 0, 'Briarthorn', 0, 10), -- Briarthorn in Loch Modan 17 objects total
(14227, 1165, 0, 'Briarthorn', 0, 10), -- Briarthorn in Loch Modan 17 objects total
(14286, 1165, 0, 'Briarthorn', 0, 10), -- Briarthorn in Loch Modan 17 objects total
(14287, 1165, 0, 'Briarthorn', 0, 10), -- Briarthorn in Loch Modan 17 objects total
(30205, 1165, 0, 'Briarthorn', 0, 10), -- Briarthorn in Loch Modan 17 objects total
(14298, 1165, 0, 'Briarthorn', 0, 10), -- Briarthorn in Loch Modan 17 objects total
(14301, 1165, 0, 'Briarthorn', 0, 10), -- Briarthorn in Loch Modan 17 objects total
(14463, 1165, 0, 'Briarthorn', 0, 10), -- Briarthorn in Loch Modan 17 objects total
(14479, 1165, 0, 'Briarthorn', 0, 10), -- Briarthorn in Loch Modan 17 objects total
(14480, 1165, 0, 'Briarthorn', 0, 10), -- Briarthorn in Loch Modan 17 objects total
(29982, 1165, 0, 'Briarthorn', 0, 10); -- Briarthorn in Loch Modan 17 objects total

-- Missing Briarthorn spawns in Westfall.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(14235, 1621, 0, -9926.93, 814.123, 30.1192, 3.76991, 0, 0, -0.951056, 0.309017, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2622 at 347.796265 yards.
(14466, 1621, 0, -11408.4, 1939.08, 10.2287, 3.45576, 0, 0, -0.987688, 0.156436, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2755 at 325.907288 yards.
(40025, 1621, 0, -11052.6, 1197.83, 44.0466, 2.86234, 0, 0, 0.990268, 0.139175, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 40002 at 83.576065 yards.
(14483, 1621, 0, -11382.5, 1712.27, 34.3837, 3.68265, 0, 0, -0.96363, 0.267241, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2755 at 206.586700 yards.
(31145, 1621, 0, -10709.5, 1962.58, 35.4621, 2.11185, 0, 0, 0.870356, 0.492424, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 31062 at 133.377502 yards.
(31028, 1621, 0, -10549, 1976.87, 33.9606, 2.28638, 0, 0, 0.909961, 0.414694, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 31001 at 161.179657 yards.
(14526, 1621, 0, -10092.6, 1601.71, 41.0102, 0.104719, 0, 0, 0.0523357, 0.99863, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2786 at 65.886940 yards.
(30646, 1621, 0, -10982.5, 1119.15, 40.2986, 2.30383, 0, 0, 0.913545, 0.406738, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 30644 at 117.308136 yards.
(14527, 1621, 0, -10475.8, 1712.75, 36.2335, 6.03884, 0, 0, -0.121869, 0.992546, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 2800 at 176.704025 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(14235, 1109, 0, 'Briarthorn', 0, 10), -- Briarthorn in Westfall 37 objects total
(14466, 1109, 0, 'Briarthorn', 0, 10), -- Briarthorn in Westfall 37 objects total
(40025, 1109, 0, 'Briarthorn', 0, 10), -- Briarthorn in Westfall 37 objects total
(14483, 1109, 0, 'Briarthorn', 0, 10), -- Briarthorn in Westfall 37 objects total
(31145, 1109, 0, 'Briarthorn', 0, 10), -- Briarthorn in Westfall 37 objects total
(31028, 1109, 0, 'Briarthorn', 0, 10), -- Briarthorn in Westfall 37 objects total
(14526, 1109, 0, 'Briarthorn', 0, 10), -- Briarthorn in Westfall 37 objects total
(30646, 1109, 0, 'Briarthorn', 0, 10), -- Briarthorn in Westfall 37 objects total
(14527, 1109, 0, 'Briarthorn', 0, 10); -- Briarthorn in Westfall 37 objects total

-- Missing Briarthorn spawns in Redridge Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(14196, 1621, 0, -9904.38, -1880.45, 37.9255, 3.80482, 0, 0, -0.945518, 0.325568, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2904 at 192.931198 yards.
(14204, 1621, 0, -9608.79, -2429.04, 59.8932, 5.65487, 0, 0, -0.309016, 0.951057, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2769 at 84.312622 yards.
(14467, 1621, 0, -9415.24, -2111.12, 67.0888, 5.86431, 0, 0, -0.207911, 0.978148, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2846 at 86.176476 yards.
(18809, 1621, 0, -9635.92, -3055.3, 56.31, 4.27606, 0, 0, -0.843391, 0.5373, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 18673 at 150.359375 yards.
(14468, 1621, 0, -9333.84, -3308.43, 89.7115, 0.401425, 0, 0, 0.199368, 0.979925, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2785 at 125.101921 yards.
(14482, 1621, 0, -9658.02, -2111.7, 60.2108, 0.925024, 0, 0, 0.446198, 0.894935, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2693 at 93.437836 yards.
(14524, 1621, 0, -9759.97, -2152.08, 58.6628, 3.26377, 0, 0, -0.998135, 0.0610518, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2819 at 185.665970 yards.
(18874, 1621, 0, -9496.37, -3203.11, 62.4749, 2.11185, 0, 0, 0.870356, 0.492424, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 18673 at 124.884850 yards.
(18876, 1621, 0, -9656.25, -3478.21, 121.956, 3.73501, 0, 0, -0.956305, 0.292372, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 18673 at 285.101929 yards.
(14525, 1621, 0, -9156.48, -3188.13, 106.772, 3.45576, 0, 0, -0.987688, 0.156436, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2596 at 82.634361 yards.
(31144, 1621, 0, -9372.92, -2026.42, 57.8357, 0.279252, 0, 0, 0.139173, 0.990268, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 31114 at 82.037552 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(14196, 1127, 0, 'Briarthorn', 0, 10), -- Briarthorn in Redridge 28 objects total
(14204, 1127, 0, 'Briarthorn', 0, 10), -- Briarthorn in Redridge 28 objects total
(14467, 1127, 0, 'Briarthorn', 0, 10), -- Briarthorn in Redridge 28 objects total
(18809, 1127, 0, 'Briarthorn', 0, 10), -- Briarthorn in Redridge 28 objects total
(14468, 1127, 0, 'Briarthorn', 0, 10), -- Briarthorn in Redridge 28 objects total
(14482, 1127, 0, 'Briarthorn', 0, 10), -- Briarthorn in Redridge 28 objects total
(14524, 1127, 0, 'Briarthorn', 0, 10), -- Briarthorn in Redridge 28 objects total
(18874, 1127, 0, 'Briarthorn', 0, 10), -- Briarthorn in Redridge 28 objects total
(18876, 1127, 0, 'Briarthorn', 0, 10), -- Briarthorn in Redridge 28 objects total
(14525, 1127, 0, 'Briarthorn', 0, 10), -- Briarthorn in Redridge 28 objects total
(31144, 1127, 0, 'Briarthorn', 0, 10); -- Briarthorn in Redridge 28 objects total

-- Missing Briarthorn spawns in Silverpine Forest.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(14193, 1621, 0, 752.246, 1176.41, 54.1389, 5.20108, 0, 0, -0.515038, 0.857168, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2704 at 127.654030 yards.
(14221, 1621, 0, 363.656, 1202.77, 76.7807, 3.194, 0, 0, -0.999657, 0.0262016, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2733 at 70.149551 yards.
(14222, 1621, 0, 189.594, 1220.34, 68.9187, 0.087266, 0, 0, 0.0436192, 0.999048, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2560 at 113.614159 yards.
(35619, 1621, 0, -32.0891, 1265.96, 61.1706, 5.61996, 0, 0, -0.325567, 0.945519, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 35509 at 112.894821 yards.
(14223, 1621, 0, -395.193, 1127.8, 84.6086, 1.50098, 0, 0, 0.681998, 0.731354, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2788 at 78.376892 yards.
(42969, 1621, 0, -38.9839, 1064.54, 63.8401, 3.52557, 0, 0, -0.981627, 0.190812, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 42968 at 53.127445 yards.
(14224, 1621, 0, 295.11, 1275.38, 77.5284, 1.46608, 0, 0, 0.66913, 0.743145, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2733 at 164.315506 yards.
(35624, 1621, 0, 556.695, 1337.89, 86.6567, 3.35105, 0, 0, -0.994521, 0.104536, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 35503 at 25.555296 yards.
(14242, 1621, 0, 476.653, 1156.71, 94.5741, 3.83973, 0, 0, -0.939692, 0.34202, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2733 at 53.623692 yards.
(42983, 1621, 0, -542.837, 904.022, 89.8296, 4.20625, 0, 0, -0.861629, 0.507539, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 42975 at 69.650887 yards.
(42971, 1621, 0, -79.9488, 1113.74, 67.3336, 1.79769, 0, 0, 0.782608, 0.622515, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 42968 at 93.185013 yards.
(14245, 1621, 0, -639.503, 1494.97, 9.6857, 3.54302, 0, 0, -0.979924, 0.19937, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2764 at 137.804489 yards.
(14246, 1621, 0, 67.2836, 1266.24, 65.0148, 0.349065, 0, 0, 0.173648, 0.984808, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2560 at 21.973518 yards.
(42986, 1621, 0, -473.183, 865.694, 96.5802, 2.07694, 0, 0, 0.861629, 0.507539, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 42975 at 46.176853 yards.
(42987, 1621, 0, -446.982, 847.415, 96.9973, 0.314158, 0, 0, 0.156434, 0.987688, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 42975 at 69.778847 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(14193, 1046, 0, 'Briarthorn', 0, 10), -- Briarthorn in Silverpine Forest 28 objects total
(14221, 1046, 0, 'Briarthorn', 0, 10), -- Briarthorn in Silverpine Forest 28 objects total
(14222, 1046, 0, 'Briarthorn', 0, 10), -- Briarthorn in Silverpine Forest 28 objects total
(35619, 1046, 0, 'Briarthorn', 0, 10), -- Briarthorn in Silverpine Forest 28 objects total
(14223, 1046, 0, 'Briarthorn', 0, 10), -- Briarthorn in Silverpine Forest 28 objects total
(42969, 1046, 0, 'Briarthorn', 0, 10), -- Briarthorn in Silverpine Forest 28 objects total
(14224, 1046, 0, 'Briarthorn', 0, 10), -- Briarthorn in Silverpine Forest 28 objects total
(35624, 1046, 0, 'Briarthorn', 0, 10), -- Briarthorn in Silverpine Forest 28 objects total
(14242, 1046, 0, 'Briarthorn', 0, 10), -- Briarthorn in Silverpine Forest 28 objects total
(42983, 1046, 0, 'Briarthorn', 0, 10), -- Briarthorn in Silverpine Forest 28 objects total
(42971, 1046, 0, 'Briarthorn', 0, 10), -- Briarthorn in Silverpine Forest 28 objects total
(14245, 1046, 0, 'Briarthorn', 0, 10), -- Briarthorn in Silverpine Forest 28 objects total
(14246, 1046, 0, 'Briarthorn', 0, 10), -- Briarthorn in Silverpine Forest 28 objects total
(42986, 1046, 0, 'Briarthorn', 0, 10), -- Briarthorn in Silverpine Forest 28 objects total
(42987, 1046, 0, 'Briarthorn', 0, 10); -- Briarthorn in Silverpine Forest 28 objects total

-- Missing Briarthorn spawns in Darkshore.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(14236, 1621, 1, 7457.85, -1146.68, 44.8022, 0.244346, 0, 0, 0.121869, 0.992546, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2834 at 220.011490 yards.
(14244, 1621, 1, 6081.99, 407.804, 25.7207, 3.59538, 0, 0, -0.97437, 0.224951, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2627 at 66.835335 yards.
(14446, 1621, 1, 5603.32, 241.437, 31.5457, 4.59022, 0, 0, -0.748956, 0.66262, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2654 at 76.166534 yards.
(14450, 1621, 1, 4760.79, 137.93, 54.6364, 4.04917, 0, 0, -0.898793, 0.438373, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2805 at 100.388474 yards.
(14451, 1621, 1, 4823.35, 275.858, 52.1601, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2684 at 62.668560 yards.
(14452, 1621, 1, 4523.03, 34.3448, 83.7612, 5.18363, 0, 0, -0.522498, 0.85264, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2805 at 237.038681 yards.
(14453, 1621, 1, 6977.94, -206.324, 40.4996, 2.33874, 0, 0, 0.920505, 0.390732, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2618 at 12.739424 yards.
(14454, 1621, 1, 4423.4, 333.811, 58.392, 2.91469, 0, 0, 0.993571, 0.113208, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2793 at 34.311951 yards.
(14455, 1621, 1, 5093.71, 400.35, 32.8642, 1.01229, 0, 0, 0.484809, 0.87462, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2594 at 64.247429 yards.
(14456, 1621, 1, 7048.82, -46.8621, 18.3249, 1.25664, 0, 0, 0.587785, 0.809017, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2776 at 39.725349 yards.
(14485, 1621, 1, 7768.93, -1089.04, 39.2549, 4.41568, 0, 0, -0.803857, 0.594823, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2600 at 83.424408 yards.
(14486, 1621, 1, 6834.12, 348.531, 20.9587, 3.63029, 0, 0, -0.970295, 0.241925, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2713 at 98.645653 yards.
(14487, 1621, 1, 6711.49, 350.309, 26.0895, 3.57793, 0, 0, -0.976295, 0.216442, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2649 at 111.270813 yards.
(14488, 1621, 1, 4737.5, 391.683, 38.826, 5.28835, 0, 0, -0.477159, 0.878817, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 2607 at 64.023621 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(14236, 1100, 0, 'Briarthorn', 0, 10), -- Briarthorn in Darkshore 50 objects total
(14244, 1100, 0, 'Briarthorn', 0, 10), -- Briarthorn in Darkshore 50 objects total
(14446, 1100, 0, 'Briarthorn', 0, 10), -- Briarthorn in Darkshore 50 objects total
(14450, 1100, 0, 'Briarthorn', 0, 10), -- Briarthorn in Darkshore 50 objects total
(14451, 1100, 0, 'Briarthorn', 0, 10), -- Briarthorn in Darkshore 50 objects total
(14452, 1100, 0, 'Briarthorn', 0, 10), -- Briarthorn in Darkshore 50 objects total
(14453, 1100, 0, 'Briarthorn', 0, 10), -- Briarthorn in Darkshore 50 objects total
(14454, 1100, 0, 'Briarthorn', 0, 10), -- Briarthorn in Darkshore 50 objects total
(14455, 1100, 0, 'Briarthorn', 0, 10), -- Briarthorn in Darkshore 50 objects total
(14456, 1100, 0, 'Briarthorn', 0, 10), -- Briarthorn in Darkshore 50 objects total
(14485, 1100, 0, 'Briarthorn', 0, 10), -- Briarthorn in Darkshore 50 objects total
(14486, 1100, 0, 'Briarthorn', 0, 10), -- Briarthorn in Darkshore 50 objects total
(14487, 1100, 0, 'Briarthorn', 0, 10), -- Briarthorn in Darkshore 50 objects total
(14488, 1100, 0, 'Briarthorn', 0, 10); -- Briarthorn in Darkshore 50 objects total

-- Missing Briarthorn spawns in Hillsbrad Foothills.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(14192, 1621, 0, -502.171, -1678.16, 80.8453, 3.59538, 0, 0, -0.97437, 0.224951, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2869 at 173.006210 yards.
(14211, 1621, 0, -724.908, -1357.02, 67.9433, 4.50295, 0, 0, -0.777145, 0.629321, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2657 at 147.932114 yards.
(14225, 1621, 0, -300.626, -832.994, 58.0299, 0.59341, 0, 0, 0.292371, 0.956305, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2547 at 214.947037 yards.
(14233, 1621, 0, -384.97, -1681.25, 88.737, 6.16101, 0, 0, -0.0610485, 0.998135, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2869 at 274.680634 yards.
(21280, 1621, 0, -976.12, -827.472, 14.1518, 2.25147, 0, 0, 0.902585, 0.430512, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 21272 at 110.977791 yards.
(26265, 1621, 0, -463.174, -1223.14, 56.5361, 3.4034, 0, 0, -0.991445, 0.130528, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 26224 at 116.015770 yards.
(26267, 1621, 0, -622.071, -1169.44, 61.4729, 5.77704, 0, 0, -0.25038, 0.968148, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 26224 at 243.320816 yards.
(14460, 1621, 0, -1053.8, -1368.43, 56.3424, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2657 at 188.041565 yards.
(14462, 1621, 0, -445.137, -277.211, 54.5082, 3.89209, 0, 0, -0.930417, 0.366502, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2544 at 107.274406 yards.
(21281, 1621, 0, -330.845, -1500.32, 66.9755, 5.49779, 0, 0, -0.382683, 0.92388, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 21263 at 183.520432 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(14192, 1050, 0, 'Briarthorn', 0, 10), -- Briarthorn in Hillsbrad 29 objects total
(14211, 1050, 0, 'Briarthorn', 0, 10), -- Briarthorn in Hillsbrad 29 objects total
(14225, 1050, 0, 'Briarthorn', 0, 10), -- Briarthorn in Hillsbrad 29 objects total
(14233, 1050, 0, 'Briarthorn', 0, 10), -- Briarthorn in Hillsbrad 29 objects total
(21280, 1050, 0, 'Briarthorn', 0, 10), -- Briarthorn in Hillsbrad 29 objects total
(26265, 1050, 0, 'Briarthorn', 0, 10), -- Briarthorn in Hillsbrad 29 objects total
(26267, 1050, 0, 'Briarthorn', 0, 10), -- Briarthorn in Hillsbrad 29 objects total
(14460, 1050, 0, 'Briarthorn', 0, 10), -- Briarthorn in Hillsbrad 29 objects total
(14462, 1050, 0, 'Briarthorn', 0, 10), -- Briarthorn in Hillsbrad 29 objects total
(21281, 1050, 0, 'Briarthorn', 0, 10); -- Briarthorn in Hillsbrad 29 objects total

-- Missing Briarthorn spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(14191, 1621, 1, 2084.18, -3418.2, 92.7692, 5.88176, 0, 0, -0.199368, 0.979925, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2682 at 106.484001 yards.
(14243, 1621, 1, 2841.6, -3415.37, 120.457, 0.575957, 0, 0, 0.284015, 0.95882, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2782 at 91.707977 yards.
(14284, 1621, 1, 3302.76, -1428.81, 175.2, 3.49067, 0, 0, -0.984807, 0.173652, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2616 at 201.770142 yards.
(14302, 1621, 1, 2163.18, -3106.93, 110.897, 0.104719, 0, 0, 0.0523357, 0.99863, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2849 at 96.818016 yards.
(14458, 1621, 1, 2118.77, -513.479, 110.082, 0.663223, 0, 0, 0.325567, 0.945519, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2572 at 163.719650 yards.
(14464, 1621, 1, 1942.23, -588.895, 112.46, 2.42601, 0, 0, 0.936672, 0.350207, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2750 at 79.286201 yards.
(14481, 1621, 1, 1478.53, -2418.84, 105.17, 1.39626, 0, 0, 0.642787, 0.766045, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2592 at 134.849136 yards.
(14489, 1621, 1, 2072.23, -909.099, 106.51, 0.785397, 0, 0, 0.382683, 0.92388, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 2557 at 30.162693 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(14191, 1073, 0, 'Briarthorn', 0, 10), -- Briarthorn in Ashenvale 62 objects total
(14243, 1073, 0, 'Briarthorn', 0, 10), -- Briarthorn in Ashenvale 62 objects total
(14284, 1073, 0, 'Briarthorn', 0, 10), -- Briarthorn in Ashenvale 62 objects total
(14302, 1073, 0, 'Briarthorn', 0, 10), -- Briarthorn in Ashenvale 62 objects total
(14458, 1073, 0, 'Briarthorn', 0, 10), -- Briarthorn in Ashenvale 62 objects total
(14464, 1073, 0, 'Briarthorn', 0, 10), -- Briarthorn in Ashenvale 62 objects total
(14481, 1073, 0, 'Briarthorn', 0, 10), -- Briarthorn in Ashenvale 62 objects total
(14489, 1073, 0, 'Briarthorn', 0, 10); -- Briarthorn in Ashenvale 62 objects total

-- Missing Briarthorn spawns in Stonetalon Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(14219, 1621, 1, 206.765, 90.7655, 51.4756, 4.45059, 0, 0, -0.793353, 0.608762, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2823 at 167.667694 yards.
(14220, 1621, 1, -102.477, -631.154, -2.75868, 3.38594, 0, 0, -0.992546, 0.12187, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2815 at 163.496582 yards.
(44659, 1621, 1, 2756.62, 1528.18, 238.096, 5.2709, 0, 0, -0.484809, 0.87462, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 44658 at 197.199371 yards.
(14285, 1621, 1, 381.768, 388.748, 53.0068, 1.67551, 0, 0, 0.743144, 0.669131, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2823 at 179.864471 yards.
(14290, 1621, 1, 830.578, 578.432, 88.3972, 1.41372, 0, 0, 0.649447, 0.760406, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2738 at 256.974976 yards.
(44649, 1621, 1, 1516.68, -477.189, 47.9995, 5.95157, 0, 0, -0.165047, 0.986286, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 44647 at 149.669434 yards.
(44665, 1621, 1, 2128.42, 1074.31, 238.538, 1.41372, 0, 0, 0.649447, 0.760406, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 44660 at 90.695419 yards.
(44650, 1621, 1, 1258.05, -447.374, 22.0382, 1.36136, 0, 0, 0.62932, 0.777146, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 44647 at 112.240799 yards.
(14291, 1621, 1, 574.272, 266.641, 56.5523, 2.47837, 0, 0, 0.945518, 0.325568, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2804 at 92.208504 yards.
(14297, 1621, 1, 680.358, 1435.64, -7.3887, 0.750491, 0, 0, 0.366501, 0.930418, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2860 at 255.600677 yards.
(14465, 1621, 1, 862.329, 691.778, 96.6315, 4.64258, 0, 0, -0.731354, 0.681998, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2738 at 220.538193 yards.
(14484, 1621, 1, 1008.45, 709.643, 121.174, 2.61799, 0, 0, 0.965925, 0.258821, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 2738 at 93.357231 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(14219, 1087, 0, 'Briarthorn', 0, 10), -- Briarthorn in Stonetalon 31 objects total
(14220, 1087, 0, 'Briarthorn', 0, 10), -- Briarthorn in Stonetalon 31 objects total
(44659, 1087, 0, 'Briarthorn', 0, 10), -- Briarthorn in Stonetalon 31 objects total
(14285, 1087, 0, 'Briarthorn', 0, 10), -- Briarthorn in Stonetalon 31 objects total
(14290, 1087, 0, 'Briarthorn', 0, 10), -- Briarthorn in Stonetalon 31 objects total
(44649, 1087, 0, 'Briarthorn', 0, 10), -- Briarthorn in Stonetalon 31 objects total
(44665, 1087, 0, 'Briarthorn', 0, 10), -- Briarthorn in Stonetalon 31 objects total
(44650, 1087, 0, 'Briarthorn', 0, 10), -- Briarthorn in Stonetalon 31 objects total
(14291, 1087, 0, 'Briarthorn', 0, 10), -- Briarthorn in Stonetalon 31 objects total
(14297, 1087, 0, 'Briarthorn', 0, 10), -- Briarthorn in Stonetalon 31 objects total
(14465, 1087, 0, 'Briarthorn', 0, 10), -- Briarthorn in Stonetalon 31 objects total
(14484, 1087, 0, 'Briarthorn', 0, 10); -- Briarthorn in Stonetalon 31 objects total

-- Missing Briarthorn spawns in The Barrens.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(55893, 3729, 1, -2245.8, -2388.75, 91.6667, 0.209439, 0, 0, 0.104528, 0.994522, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 2190.024658 yards.
(55894, 3729, 1, -1152.72, -3598.91, 93.3751, 3.22886, 0, 0, -0.999048, 0.0436193, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 586.506287 yards.
(55895, 3729, 1, -1593.21, -3592.77, 91.8447, 2.58308, 0, 0, 0.961261, 0.27564, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 996.278992 yards.
(55896, 3729, 1, -1871.09, -3372.66, 64.7106, 1.0821, 0, 0, 0.515038, 0.857168, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 1330.486938 yards.
(55897, 3729, 1, -1751.36, -1899.05, 92.7159, 0.925024, 0, 0, 0.446198, 0.894935, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 2269.534424 yards.
(55899, 3729, 1, 1058.32, -3678.57, 36.0646, 4.34587, 0, 0, -0.824126, 0.566406, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 1710.351318 yards.
(55900, 3729, 1, 1042.02, -2987.69, 91.6673, 1.36136, 0, 0, 0.62932, 0.777146, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 1904.129883 yards.
(55901, 3729, 1, 1135.63, -3464.41, 87.0588, 5.89921, 0, 0, -0.190808, 0.981627, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 1824.334717 yards.
(55902, 3729, 1, -199.519, -1160.88, 57.8559, 3.10665, 0, 0, 0.999847, 0.0174693, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 2751.903564 yards.
(55903, 3729, 1, 925.201, -3498.32, 91.6667, 4.66003, 0, 0, -0.725374, 0.688355, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 1612.054810 yards.
(55904, 3729, 1, 570.178, -3134.26, 91.6667, 3.50812, 0, 0, -0.983254, 0.182238, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 1421.755493 yards.
(55905, 3729, 1, -659.269, -3381.17, 91.7126, 6.24828, 0, 0, -0.0174522, 0.999848, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 500.261139 yards.
(55906, 3729, 1, -470.076, -1971.71, 91.7485, 3.50812, 0, 0, -0.983254, 0.182238, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 1914.006836 yards.
(55907, 3729, 1, -2849.12, -1953.97, 91.6667, 4.57276, 0, 0, -0.754709, 0.656059, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 2929.247559 yards.
(55908, 3729, 1, -1875.3, -1980.27, 92.2575, 6.26573, 0, 0, -0.00872612, 0.999962, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 2264.232178 yards.
(55909, 3729, 1, -680.054, -3098.36, 91.8174, 5.42797, 0, 0, -0.414693, 0.909961, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 782.279175 yards.
(55910, 3729, 1, -47.0494, -1589.17, 91.6667, 1.3439, 0, 0, 0.622514, 0.782609, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 2364.445557 yards.
(55912, 3729, 1, -1521.09, -3888.51, 15.6641, 5.53269, 0, 0, -0.366501, 0.930418, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 880.801453 yards.
(55914, 3729, 1, 1063.69, -3301.54, 91.6667, 3.14159, 0, 0, -1, 0, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 1799.815674 yards.
(55915, 3729, 1, 954.127, -3134.67, 92.5242, 3.9619, 0, 0, -0.91706, 0.39875, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 1760.099243 yards.
(55920, 3729, 1, 180.086, -1713.24, 93.3485, 4.7822, 0, 0, -0.681998, 0.731354, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 2315.091797 yards.
(55921, 3729, 1, -431.804, -1316.55, 97.6229, 1.48353, 0, 0, 0.67559, 0.737278, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 2569.936035 yards.
(55922, 3729, 1, -1412.43, -3639.26, 92.1808, 0.575957, 0, 0, 0.284015, 0.95882, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 810.275146 yards.
(55923, 3729, 1, -1789.54, -3205.13, 89.6333, 5.46288, 0, 0, -0.398748, 0.91706, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 1332.526733 yards.
(55924, 3729, 1, -4031.71, -1957.76, 92.6257, 2.28638, 0, 0, 0.909961, 0.414694, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 3897.236816 yards.
(55925, 3729, 1, -2239.95, -1597.31, 92.7891, 0.680677, 0, 0, 0.333806, 0.942642, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 2785.643555 yards.
(55926, 3729, 1, -3637.74, -2216.63, 92.2857, 3.927, 0, 0, -0.923879, 0.382686, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 3427.072998 yards.
(55927, 3729, 1, -2124.93, -1894.04, 91.677, 5.00909, 0, 0, -0.594823, 0.803857, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 2477.913330 yards.
(55928, 3729, 1, -1767.89, -2967.73, 91.6667, 5.61996, 0, 0, -0.325567, 0.945519, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 1449.823853 yards.
(55929, 3729, 1, -3375.92, -2271.41, 91.6667, 5.88176, 0, 0, -0.199368, 0.979925, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 3172.520508 yards.
(55930, 3729, 1, -1796.18, -3534.25, 92.5034, 1.46608, 0, 0, 0.66913, 0.743145, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 1207.192017 yards.
(55935, 3729, 1, -233.344, -3726.62, 29.8465, 5.41052, 0, 0, -0.422618, 0.906308, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 434.025177 yards.
(55936, 3729, 1, -1497.01, -1960.63, 91.6177, 0.0174525, 0, 0, 0.00872612, 0.999962, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 2100.096191 yards.
(55937, 3729, 1, -2033.97, -3719.65, 22.6121, 2.74016, 0, 0, 0.979924, 0.19937, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 1402.388794 yards.
(55941, 3729, 1, 941.36, -2829.5, 91.6667, 0.314158, 0, 0, 0.156434, 0.987688, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 1898.297241 yards.
(55942, 3729, 1, 770.962, -3689.78, 28.5849, 0.925024, 0, 0, 0.446198, 0.894935, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 1423.791016 yards.
(55944, 3729, 1, -3638.69, -1853.55, 91.6667, 3.9619, 0, 0, -0.91706, 0.39875, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 3617.736816 yards.
(55945, 3729, 1, -2628.69, -2381.59, 91.6667, 3.14159, 0, 0, -1, 0, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 2488.677246 yards.
(55951, 3729, 1, -2430.22, -1817.29, 91.6667, 5.44543, 0, 0, -0.406736, 0.913546, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 2729.456055 yards.
(55961, 3729, 1, -1983.27, -2223.51, 95.7973, 4.66003, 0, 0, -0.725374, 0.688355, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 2131.180420 yards.
(55972, 3729, 1, -3199.2, -2127.84, 91.6781, 0.977383, 0, 0, 0.469471, 0.882948, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 3100.154297 yards.
(55973, 3729, 1, -68.3451, -1933.42, 99.3613, 1.78023, 0, 0, 0.777145, 0.629321, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 2027.338867 yards.
(55974, 3729, 1, 1218.51, -3132.41, 91.6667, 1.78023, 0, 0, 0.777145, 0.629321, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 2003.562256 yards.
(55975, 3729, 1, 848.745, -3571.26, 90.2722, 1.51844, 0, 0, 0.688354, 0.725374, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 1521.529663 yards.
(55976, 3729, 1, -115.071, -1829.2, 92.6345, 1.09956, 0, 0, 0.522498, 0.85264, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 2115.161865 yards.
(55977, 3729, 1, 303.344, -1447.87, 91.6667, 0.872664, 0, 0, 0.422618, 0.906308, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 2606.867676 yards.
(55978, 3729, 1, 327.766, -1433.71, 91.6667, 3.31614, 0, 0, -0.996194, 0.087165, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 2628.963379 yards.
(55979, 3729, 1, 436.373, -1285.99, 92.0469, 5.044, 0, 0, -0.580703, 0.814116, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 2806.651367 yards.
(55980, 3729, 1, -560.95, -1482.42, 92.3816, 3.26377, 0, 0, -0.998135, 0.0610518, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 2396.819824 yards.
(55981, 3729, 1, -3808.39, -2006.87, 91.6766, 2.25147, 0, 0, 0.902585, 0.430512, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 3679.325195 yards.
(55982, 3729, 1, -4187.31, -2018.41, 93.5895, 4.45059, 0, 0, -0.793353, 0.608762, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 4004.873779 yards.
(55983, 3729, 1, -3557.26, -1799.18, 91.7641, 1.97222, 0, 0, 0.833885, 0.551938, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 3581.810303 yards.
(55984, 3729, 1, -3003.18, -1978.37, 91.7103, 2.30383, 0, 0, 0.913545, 0.406738, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 3031.750732 yards.
(55985, 3729, 1, -751.061, -3900.37, 20.7891, 4.55531, 0, 0, -0.760406, 0.649449, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 113.297249 yards.
(55986, 3729, 1, -344.788, -1648.26, 95.7937, 0.0349062, 0, 0, 0.0174522, 0.999848, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 2249.341553 yards.
(55987, 3729, 1, -1724.61, -3735.52, 15.7342, 3.83973, 0, 0, -0.939692, 0.34202, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 1093.429688 yards.
(55988, 3729, 1, -1346.85, -2921.93, 94.3847, 2.19911, 0, 0, 0.891006, 0.453991, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 1189.797852 yards.
(55989, 3729, 1, -4264.32, -2317.58, 92.0119, 0.628317, 0, 0, 0.309016, 0.951057, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 3945.683594 yards.
(55990, 3729, 1, -2090.82, -2130.27, 93.2031, 1.78023, 0, 0, 0.777145, 0.629321, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 2271.353027 yards.
(55991, 3729, 1, 482.941, -1898.07, 91.6667, 5.20108, 0, 0, -0.515038, 0.857168, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 2276.499268 yards.
(55995, 3729, 1, 1241.84, -3668.01, 91.889, 1.15192, 0, 0, 0.544639, 0.838671, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 1894.930176 yards.
(55996, 3729, 1, -3443.87, -2107.17, 93.4592, 4.39823, 0, 0, -0.809016, 0.587786, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 3316.004639 yards.
(55997, 3729, 1, -2554.9, -2101.11, 91.6667, 5.89921, 0, 0, -0.190808, 0.981627, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 2612.108154 yards.
(55998, 3729, 1, -2338.52, -2105.42, 96.2528, 1.41372, 0, 0, 0.649447, 0.760406, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 2454.943359 yards.
(55999, 3729, 1, -1422.33, -2892.46, 93.5401, 0.750491, 0, 0, 0.366501, 0.930418, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 1258.970703 yards.
(56000, 3729, 1, -2576.26, -1783.47, 93.4692, 3.31614, 0, 0, -0.996194, 0.087165, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 2852.141357 yards.
(56003, 3729, 1, -3780.05, -1527.83, 91.8886, 5.06146, 0, 0, -0.573576, 0.819152, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 3921.732666 yards.
(56004, 3729, 1, -3886.34, -1899.29, 92.1091, 5.74214, 0, 0, -0.267238, 0.963631, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 3801.501221 yards.
(56006, 3729, 1, -1696.34, -2225.82, 92.0846, 5.20108, 0, 0, -0.515038, 0.857168, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 1961.008179 yards.
(56009, 3729, 1, -1961.08, -3201.08, 95.5765, 3.12412, 0, 0, 0.999962, 0.00873464, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 1485.093018 yards.
(56010, 3729, 1, -442.708, -3739.55, 27.1674, 6.05629, 0, 0, -0.113203, 0.993572, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 240.869888 yards.
(56011, 3729, 1, -974.216, -3396.33, 84.2072, 5.91667, 0, 0, -0.182235, 0.983255, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 587.881348 yards.
(56018, 3729, 1, -36.364, -2771.9, 94.4797, 5.98648, 0, 0, -0.147809, 0.989016, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 1261.220459 yards.
(56020, 3729, 1, -2473.4, -1639.67, 91.6667, 4.46804, 0, 0, -0.788011, 0.615662, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 2893.030029 yards.
(56022, 3729, 1, -2484.14, -2377.11, 91.6667, 4.81711, 0, 0, -0.66913, 0.743145, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 2377.610352 yards.
(56023, 3729, 1, 682.516, -2827.2, 91.7032, 5.77704, 0, 0, -0.25038, 0.968148, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 1690.110596 yards.
(56033, 3729, 1, -3800.5, -2464.54, 91.6667, 4.83456, 0, 0, -0.66262, 0.748956, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 3461.949951 yards.
(56034, 3729, 1, -1797.42, -2472.61, 91.6667, 6.00393, 0, 0, -0.139173, 0.990268, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 1820.729492 yards.
(56035, 3729, 1, -1973.63, -2472.01, 91.7792, 3.63029, 0, 0, -0.970295, 0.241925, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 1937.922363 yards.
(56036, 3729, 1, -1300.53, -2804.44, 93.4994, 4.97419, 0, 0, -0.608761, 0.793354, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 1261.130859 yards.
(56037, 3729, 1, -3903.93, -2290.84, 91.6683, 4.67748, 0, 0, -0.719339, 0.694659, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 3629.099854 yards.
(56038, 3729, 1, -2093.66, -2420.5, 93.0188, 1.01229, 0, 0, 0.484809, 0.87462, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 2058.531494 yards.
(56039, 3729, 1, -1965.99, -2609.64, 91.9455, 5.81195, 0, 0, -0.233445, 0.97237, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 1835.057739 yards.
(56040, 3729, 1, -1335.2, -3781.48, 20.2302, 6.07375, 0, 0, -0.104528, 0.994522, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 701.337585 yards.
(56041, 3729, 1, -1746.7, -3343.69, 93.3697, 1.0821, 0, 0, 0.515038, 0.857168, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 1229.825317 yards.
(56042, 3729, 1, -2666.17, -2219.72, 92.0802, 4.59022, 0, 0, -0.748956, 0.66262, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 2618.083008 yards.
(56043, 3729, 1, 21.0643, -3032.41, 92.1659, 6.24828, 0, 0, -0.0174522, 0.999848, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 1074.760010 yards.
(56044, 3729, 1, -4046.88, -1782.21, 95.1955, 4.13643, 0, 0, -0.878817, 0.47716, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 3999.574951 yards.
(56045, 3729, 1, -883.319, -3361.04, 91.7687, 6.14356, 0, 0, -0.0697556, 0.997564, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 573.817383 yards.
(56047, 3729, 1, -3571.04, -1994.76, 91.6667, 3.99681, 0, 0, -0.909961, 0.414694, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 3483.589111 yards.
(56050, 3729, 1, -198.694, -2865.74, 91.6667, 1.72787, 0, 0, 0.760406, 0.649449, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 1105.408325 yards.
(56052, 3729, 1, -1496.22, -2353.18, 93.0797, 4.7473, 0, 0, -0.694658, 0.71934, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 1748.924438 yards.
(56053, 3729, 1, 44.2498, -1864.93, 95.1252, 2.11185, 0, 0, 0.870356, 0.492424, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 2126.490967 yards.
(56054, 3729, 1, 157.615, -1984.88, 94.3733, 4.03171, 0, 0, -0.902585, 0.430512, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 2054.661865 yards.
(56055, 3729, 1, -663.961, -1738.02, 91.6667, 4.76475, 0, 0, -0.688354, 0.725374, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 2140.110352 yards.
(56056, 3729, 1, 661.844, -1702.1, 91.6667, 1.55334, 0, 0, 0.700909, 0.713251, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 2535.836670 yards.
(56064, 3729, 1, 731.406, -1254.06, 91.6667, 5.23599, 0, 0, -0.5, 0.866025, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 2960.772705 yards.
(56065, 3729, 1, 635.075, -1765.24, 91.6181, 0.645772, 0, 0, 0.317305, 0.948324, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 2467.951904 yards.
(56066, 3729, 1, 530.586, -1449.89, 91.6667, 0, 0, 0, 0, 1, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 2695.650146 yards.
(56067, 3729, 1, -1852.19, -3679.78, 11.3543, 4.57276, 0, 0, -0.754709, 0.656059, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 1227.809204 yards.
(56068, 3729, 1, 123.842, -1514.49, 91.6667, 4.67748, 0, 0, -0.719339, 0.694659, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 2483.932861 yards.
(56069, 3729, 1, -232.726, -1805.17, 91.9605, 3.68265, 0, 0, -0.96363, 0.267241, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 2112.589600 yards.
(56070, 3729, 1, 951.368, -2331.42, 91.7039, 0.418879, 0, 0, 0.207911, 0.978148, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 2219.668945 yards.
(56071, 3729, 1, -832.846, -2075.74, 91.6667, 2.93214, 0, 0, 0.994521, 0.104536, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 1812.674316 yards.
(56072, 3729, 1, -3670.22, -1603.73, 110.314, 3.63029, 0, 0, -0.970295, 0.241925, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55891 at 3788.696777 yards.
(56073, 3729, 1, -1584.55, -2673.22, 92.8385, 5.23599, 0, 0, -0.5, 0.866025, 900, 900, 1, 100, 0, 10); -- Closest existing guid is 55891 at 1531.241455 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(55893, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55894, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55895, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55896, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55897, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55899, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55900, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55901, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55902, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55903, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55904, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55905, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55906, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55907, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55908, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55909, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55910, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55912, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55914, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55915, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55920, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55921, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55922, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55923, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55924, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55925, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55926, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55927, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55928, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55929, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55930, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55935, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55936, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55937, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55941, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55942, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55944, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55945, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55951, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55961, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55972, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55973, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55974, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55975, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55976, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55977, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55978, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55979, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55980, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55981, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55982, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55983, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55984, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55985, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55986, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55987, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55988, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55989, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55990, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55991, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55995, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55996, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55997, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55998, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(55999, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(56000, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(56003, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(56004, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(56006, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(56009, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(56010, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(56011, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(56018, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(56020, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(56022, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(56023, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(56033, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(56034, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(56035, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(56036, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(56037, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(56038, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(56039, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(56040, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(56041, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(56042, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(56043, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(56044, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(56045, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(56047, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(56050, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(56052, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(56053, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(56054, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(56055, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(56056, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(56064, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(56065, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(56066, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(56067, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(56068, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(56069, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(56070, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(56071, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(56072, 1037, 0, 'Briarthorn', 0, 10), -- Briarthorn in Barrens 77 objects total
(56073, 1037, 0, 'Briarthorn', 0, 10); -- Briarthorn in Barrens 77 objects total


-- Correct position of Bruiseweed in Wailing Caverns (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-735.582, `position_y`=-2128.8, `position_z`=66.6035, `orientation`=3.45576, `rotation0`=0, `rotation1`=0, `rotation2`=-0.987688, `rotation3`=0.156436 WHERE `guid`=3035;

-- Correct position of Bruiseweed in Desolace (position is off by 0.180054 yards).
UPDATE `gameobject` SET `position_x`=-1748.82, `position_y`=1969.21, `position_z`=61.7136, `orientation`=5.96903, `rotation0`=0, `rotation1`=0, `rotation2`=-0.156434, `rotation3`=0.987688 WHERE `guid`=3790;

-- Correct position of Bruiseweed in Redridge Mountains (position is off by 1.82721 yards).
UPDATE `gameobject` SET `position_x`=-9503.31, `position_y`=-2082.8, `position_z`=100.905, `orientation`=1.25664, `rotation0`=0, `rotation1`=0, `rotation2`=0.587785, `rotation3`=0.809017 WHERE `guid`=3804;

-- Correct position of Bruiseweed in Thousand Needles (position is off by 1.26058 yards).
UPDATE `gameobject` SET `position_x`=-6499.25, `position_y`=-3468.21, `position_z`=-58.7499, `orientation`=0.191985, `rotation0`=0, `rotation1`=0, `rotation2`=0.0958452, `rotation3`=0.995396 WHERE `guid`=3648;

-- Correct position of Bruiseweed in Silverpine Forest (position is off by 1.34659 yards).
UPDATE `gameobject` SET `position_x`=-238.815, `position_y`=1524.45, `position_z`=76.3908, `orientation`=5.67232, `rotation0`=0, `rotation1`=0, `rotation2`=-0.300705, `rotation3`=0.953717 WHERE `guid`=3405;

-- Correct position of Bruiseweed in Hillsbrad Foothills (position is off by 1.09764 yards).
UPDATE `gameobject` SET `position_x`=-718.037, `position_y`=-779.204, `position_z`=32.4724, `orientation`=3.3685, `rotation0`=0, `rotation1`=0, `rotation2`=-0.993571, `rotation3`=0.113208 WHERE `guid`=3881;

-- Correct position of Bruiseweed in Redridge Mountains (position is off by 0.56369 yards).
UPDATE `gameobject` SET `position_x`=-9608.53, `position_y`=-2269.69, `position_z`=85.5731, `orientation`=4.04917, `rotation0`=0, `rotation1`=0, `rotation2`=-0.898793, `rotation3`=0.438373 WHERE `guid`=3788;

-- Correct position of Bruiseweed in Duskwood (position is off by 1.36744 yards).
UPDATE `gameobject` SET `position_x`=-10680.6, `position_y`=-715.178, `position_z`=50.4884, `orientation`=3.61284, `rotation0`=0, `rotation1`=0, `rotation2`=-0.972369, `rotation3`=0.233448 WHERE `guid`=3291;

-- Correct position of Bruiseweed in Wetlands (position is off by 3.65453 yards).
UPDATE `gameobject` SET `position_x`=-2859.65, `position_y`=-1473.97, `position_z`=10.1537, `orientation`=3.4383, `rotation0`=0, `rotation1`=0, `rotation2`=-0.989016, `rotation3`=0.147811 WHERE `guid`=3144;

-- Correct position of Bruiseweed in Hillsbrad Foothills (position is off by 3.36709 yards).
UPDATE `gameobject` SET `position_x`=-574.227, `position_y`=-1478.04, `position_z`=52.4409, `orientation`=0.994837, `rotation0`=0, `rotation1`=0, `rotation2`=0.477159, `rotation3`=0.878817 WHERE `guid`=3877;

-- Correct position of Bruiseweed in Darkshore (position is off by 0.206834 yards).
UPDATE `gameobject` SET `position_x`=7437.04, `position_y`=-1097.8, `position_z`=39.3206, `orientation`=5.88176, `rotation0`=0, `rotation1`=0, `rotation2`=-0.199368, `rotation3`=0.979925 WHERE `guid`=3137;

-- Correct position of Bruiseweed in Redridge Mountains (position is off by 0.284599 yards).
UPDATE `gameobject` SET `position_x`=-8910.15, `position_y`=-2643.76, `position_z`=136.301, `orientation`=5.67232, `rotation0`=0, `rotation1`=0, `rotation2`=-0.300705, `rotation3`=0.953717 WHERE `guid`=3797;

-- Correct position of Bruiseweed in Stonetalon Mountains (position is off by 1.62336 yards).
UPDATE `gameobject` SET `position_x`=531.04, `position_y`=393.078, `position_z`=78.7715, `orientation`=0.436332, `rotation0`=0, `rotation1`=0, `rotation2`=0.216439, `rotation3`=0.976296 WHERE `guid`=3536;

-- Correct position of Bruiseweed in Hillsbrad Foothills (position is off by 0.596012 yards).
UPDATE `gameobject` SET `position_x`=-1038.16, `position_y`=-191.426, `position_z`=16.0369, `orientation`=1.02974, `rotation0`=0, `rotation1`=0, `rotation2`=0.492423, `rotation3`=0.870356 WHERE `guid`=3865;

-- Correct position of Bruiseweed in Hillsbrad Foothills (position is off by 0.477867 yards).
UPDATE `gameobject` SET `position_x`=-265.137, `position_y`=211.242, `position_z`=99.8042, `orientation`=1.27409, `rotation0`=0, `rotation1`=0, `rotation2`=0.594822, `rotation3`=0.803857 WHERE `guid`=3273;

-- Correct position of Bruiseweed in Hillsbrad Foothills (position is off by 0.00100708 yards).
UPDATE `gameobject` SET `position_x`=-1032.7, `position_y`=-258.555, `position_z`=24.9987, `orientation`=4.27606, `rotation0`=0, `rotation1`=0, `rotation2`=-0.843391, `rotation3`=0.5373 WHERE `guid`=2969;

-- Correct position of Bruiseweed in Wetlands (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-3872.19, `position_y`=-2602.69, `position_z`=52.5481, `orientation`=2.14675, `rotation0`=0, `rotation1`=0, `rotation2`=0.878817, `rotation3`=0.47716 WHERE `guid`=3581;

-- Correct position of Bruiseweed in Wetlands (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-4212.26, `position_y`=-2354.89, `position_z`=204.552, `orientation`=4.32842, `rotation0`=0, `rotation1`=0, `rotation2`=-0.829037, `rotation3`=0.559194 WHERE `guid`=3043;

-- Correct position of Bruiseweed in Thousand Needles (position is off by 0.0098877 yards).
UPDATE `gameobject` SET `position_x`=-4755.94, `position_y`=-1052.57, `position_z`=-55.8106, `orientation`=2.56563, `rotation0`=0, `rotation1`=0, `rotation2`=0.958819, `rotation3`=0.284016 WHERE `guid`=2988;

-- Correct position of Bruiseweed in Wetlands (position is off by 4.0312 yards).
UPDATE `gameobject` SET `position_x`=-4005.84, `position_y`=-3157.24, `position_z`=25.2231, `orientation`=2.60054, `rotation0`=0, `rotation1`=0, `rotation2`=0.96363, `rotation3`=0.267241 WHERE `guid`=3518;

-- Correct position of Bruiseweed in Westfall (position is off by 2.22193 yards).
UPDATE `gameobject` SET `position_x`=-10524.1, `position_y`=1007.91, `position_z`=56.1392, `orientation`=5.74214, `rotation0`=0, `rotation1`=0, `rotation2`=-0.267238, `rotation3`=0.963631 WHERE `guid`=3377;

-- Correct position of Bruiseweed in Stonetalon Mountains (position is off by 0.916435 yards).
UPDATE `gameobject` SET `position_x`=891.422, `position_y`=1510.84, `position_z`=-3.89756, `orientation`=1.32645, `rotation0`=0, `rotation1`=0, `rotation2`=0.615661, `rotation3`=0.788011 WHERE `guid`=3212;

-- Correct position of Bruiseweed in Wailing Caverns (position is off by 0.240358 yards).
UPDATE `gameobject` SET `position_x`=-689.763, `position_y`=-2102.04, `position_z`=65.5142, `orientation`=4.90438, `rotation0`=0, `rotation1`=0, `rotation2`=-0.636078, `rotation3`=0.771625 WHERE `guid`=3662;

-- Correct position of Bruiseweed in Redridge Mountains (position is off by 1.71844 yards).
UPDATE `gameobject` SET `position_x`=-9217.82, `position_y`=-2686.49, `position_z`=88.8065, `orientation`=1.88495, `rotation0`=0, `rotation1`=0, `rotation2`=0.809016, `rotation3`=0.587786 WHERE `guid`=3633;

-- Correct position of Bruiseweed in Redridge Mountains (position is off by 0.119234 yards).
UPDATE `gameobject` SET `position_x`=-9603.1, `position_y`=-2377.98, `position_z`=61.0354, `orientation`=3.90954, `rotation0`=0, `rotation1`=0, `rotation2`=-0.927183, `rotation3`=0.374608 WHERE `guid`=3244;

-- Correct position of Bruiseweed in Westfall (position is off by 0.172069 yards).
UPDATE `gameobject` SET `position_x`=-9932.17, `position_y`=903.963, `position_z`=46.0921, `orientation`=3.7001, `rotation0`=0, `rotation1`=0, `rotation2`=-0.961261, `rotation3`=0.27564 WHERE `guid`=3026;

-- Correct position of Bruiseweed in Duskwood (position is off by 0.91627 yards).
UPDATE `gameobject` SET `position_x`=-10765.3, `position_y`=-1252.41, `position_z`=31.1958, `orientation`=1.0821, `rotation0`=0, `rotation1`=0, `rotation2`=0.515038, `rotation3`=0.857168 WHERE `guid`=3777;

-- Correct position of Bruiseweed in Stonetalon Mountains (position is off by 0.131644 yards).
UPDATE `gameobject` SET `position_x`=1285.63, `position_y`=1439.63, `position_z`=96.9013, `orientation`=1.46608, `rotation0`=0, `rotation1`=0, `rotation2`=0.66913, `rotation3`=0.743145 WHERE `guid`=3077;

-- Correct position of Bruiseweed in Thousand Needles (position is off by 1.00749 yards).
UPDATE `gameobject` SET `position_x`=-5820.09, `position_y`=-3397.28, `position_z`=-48.301, `orientation`=0.558504, `rotation0`=0, `rotation1`=0, `rotation2`=0.275637, `rotation3`=0.961262 WHERE `guid`=3738;

-- Correct position of Bruiseweed in Westfall (position is off by 0.271163 yards).
UPDATE `gameobject` SET `position_x`=-10407.1, `position_y`=950.457, `position_z`=38.3258, `orientation`=5.14872, `rotation0`=0, `rotation1`=0, `rotation2`=-0.537299, `rotation3`=0.843392 WHERE `guid`=3215;

-- Correct position of Bruiseweed in Thousand Needles (position is off by 0.780081 yards).
UPDATE `gameobject` SET `position_x`=-5548.45, `position_y`=-1953.49, `position_z`=-58.7428, `orientation`=3.99681, `rotation0`=0, `rotation1`=0, `rotation2`=-0.909961, `rotation3`=0.414694 WHERE `guid`=3173;

-- Correct position of Bruiseweed in Hillsbrad Foothills (position is off by 3.53281 yards).
UPDATE `gameobject` SET `position_x`=-770.418, `position_y`=188.185, `position_z`=60.4781, `orientation`=5.86431, `rotation0`=0, `rotation1`=0, `rotation2`=-0.207911, `rotation3`=0.978148 WHERE `guid`=3583;

-- Correct position of Bruiseweed in Loch Modan (position is off by 4.28352 yards).
UPDATE `gameobject` SET `position_x`=-5896.7, `position_y`=-4190.73, `position_z`=404.729, `orientation`=1.95477, `rotation0`=0, `rotation1`=0, `rotation2`=0.829038, `rotation3`=0.559193 WHERE `guid`=3758;

-- Correct position of Bruiseweed in Darkshore (position is off by 0.549413 yards).
UPDATE `gameobject` SET `position_x`=6715.5, `position_y`=-88.9202, `position_z`=42.954, `orientation`=0.994837, `rotation0`=0, `rotation1`=0, `rotation2`=0.477159, `rotation3`=0.878817 WHERE `guid`=3454;

-- Correct position of Bruiseweed in Darkshore (position is off by 0.562193 yards).
UPDATE `gameobject` SET `position_x`=4530.77, `position_y`=414.507, `position_z`=33.7425, `orientation`=4.99164, `rotation0`=0, `rotation1`=0, `rotation2`=-0.601814, `rotation3`=0.798636 WHERE `guid`=3874;

-- Correct position of Bruiseweed in Ashenvale (position is off by 1.02571 yards).
UPDATE `gameobject` SET `position_x`=2951.11, `position_y`=-49.1315, `position_z`=102.306, `orientation`=4.08407, `rotation0`=0, `rotation1`=0, `rotation2`=-0.891006, `rotation3`=0.453991 WHERE `guid`=3340;

-- Correct position of Bruiseweed in Ashenvale (position is off by 0.907507 yards).
UPDATE `gameobject` SET `position_x`=2302.93, `position_y`=-1491.48, `position_z`=97.8416, `orientation`=4.66003, `rotation0`=0, `rotation1`=0, `rotation2`=-0.725374, `rotation3`=0.688355 WHERE `guid`=3704;

-- Correct position of Bruiseweed in Westfall (position is off by 1.09584 yards).
UPDATE `gameobject` SET `position_x`=-11203.7, `position_y`=712.282, `position_z`=42.1853, `orientation`=4.45059, `rotation0`=0, `rotation1`=0, `rotation2`=-0.793353, `rotation3`=0.608762 WHERE `guid`=3166;

-- Correct position of Bruiseweed in Redridge Mountains (position is off by 1.67805 yards).
UPDATE `gameobject` SET `position_x`=-9582.61, `position_y`=-2939.32, `position_z`=68.4579, `orientation`=2.74016, `rotation0`=0, `rotation1`=0, `rotation2`=0.979924, `rotation3`=0.19937 WHERE `guid`=3008;

-- Correct position of Bruiseweed in Redridge Mountains (position is off by 1.1948 yards).
UPDATE `gameobject` SET `position_x`=-9394.88, `position_y`=-3335.6, `position_z`=88.1509, `orientation`=4.24115, `rotation0`=0, `rotation1`=0, `rotation2`=-0.85264, `rotation3`=0.522499 WHERE `guid`=3216;

-- Correct position of Bruiseweed in Stonetalon Mountains (position is off by 0.943886 yards).
UPDATE `gameobject` SET `position_x`=6.4821, `position_y`=-471.414, `position_z`=-33.6255, `orientation`=5.37562, `rotation0`=0, `rotation1`=0, `rotation2`=-0.438371, `rotation3`=0.898794 WHERE `guid`=3425;

-- Correct position of Bruiseweed in Darkshore (position is off by 0.949185 yards).
UPDATE `gameobject` SET `position_x`=6713.45, `position_y`=-193.626, `position_z`=35.174, `orientation`=1.0472, `rotation0`=0, `rotation1`=0, `rotation2`=0.5, `rotation3`=0.866025 WHERE `guid`=3192;

-- Correct position of Bruiseweed in Westfall (position is off by 0.29982 yards).
UPDATE `gameobject` SET `position_x`=-10043.7, `position_y`=1089.09, `position_z`=39.466, `orientation`=3.73501, `rotation0`=0, `rotation1`=0, `rotation2`=-0.956305, `rotation3`=0.292372 WHERE `guid`=3598;

-- Missing Bruiseweed spawns in Duskwood.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(14610, 1622, 0, -11045.7, 206.046, 27.283, 4.86947, 0, 0, -0.649447, 0.760406, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3346 at 14.872674 yards.
(14616, 1622, 0, -10776.6, -1383.1, 39.0658, 6.02139, 0, 0, -0.130526, 0.991445, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3600 at 11.044353 yards.
(14848, 1622, 0, -10831, -564.47, 36.8656, 0.0349062, 0, 0, 0.0174522, 0.999848, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3183 at 55.021217 yards.
(14984, 1622, 0, -10974.2, -944.671, 70.3839, 5.96903, 0, 0, -0.156434, 0.987688, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3313 at 19.581762 yards.
(15019, 1622, 0, -11073.5, -233.118, 18.9209, 2.30383, 0, 0, 0.913545, 0.406738, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2926 at 13.681268 yards.
(15020, 1622, 0, -11001, -1369.58, 51.7539, 4.01426, 0, 0, -0.906307, 0.422619, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 3755 at 34.232231 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(14610, 1115, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Duskwood 85 objects total
(14616, 1115, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Duskwood 85 objects total
(14848, 1115, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Duskwood 85 objects total
(14984, 1115, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Duskwood 85 objects total
(15019, 1115, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Duskwood 85 objects total
(15020, 1115, 0, 'Bruiseweed', 0, 10); -- Bruiseweed in Duskwood 85 objects total

-- Missing Bruiseweed spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(14682, 1622, 0, -3831.92, -1310.2, 34.3048, 5.20108, 0, 0, -0.515038, 0.857168, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3660 at 7.655787 yards.
(14692, 1622, 0, -3886.87, -1078.15, 24.5511, 2.09439, 0, 0, 0.866025, 0.500001, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3525 at 152.286880 yards.
(14723, 1622, 0, -3920.28, -1053.16, 28.3773, 2.70526, 0, 0, 0.976295, 0.216442, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3525 at 118.570648 yards.
(14847, 1622, 0, -3369.54, -2349.1, 64.4333, 6.0912, 0, 0, -0.0958452, 0.995396, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3847 at 17.975241 yards.
(14960, 1622, 0, -2955.6, -2622.49, 24.2999, 0.383971, 0, 0, 0.190808, 0.981627, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 2956 at 15.143620 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(14682, 1150, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Wetlands 97 objects total
(14692, 1150, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Wetlands 97 objects total
(14723, 1150, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Wetlands 97 objects total
(14847, 1150, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Wetlands 97 objects total
(14960, 1150, 0, 'Bruiseweed', 0, 10); -- Bruiseweed in Wetlands 97 objects total

-- Missing Bruiseweed spawns in Alterac Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(14609, 1622, 0, 524.242, -222.035, 150.747, 0.488691, 0, 0, 0.241921, 0.970296, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3111 at 26.181211 yards.
(14668, 1622, 0, -56.5404, 293.34, 53.3134, 1.09956, 0, 0, 0.522498, 0.85264, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3034 at 51.175480 yards.
(14736, 1622, 0, 713.813, -316.486, 140.027, 3.49067, 0, 0, -0.984807, 0.173652, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 3112 at 11.645860 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(14609, 1056, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Alterac 25 objects total
(14668, 1056, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Alterac 25 objects total
(14736, 1056, 0, 'Bruiseweed', 0, 10); -- Bruiseweed in Alterac 25 objects total

-- Missing Bruiseweed spawns in Loch Modan.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(14981, 1622, 0, -4989.58, -3872.57, 317.634, 1.91986, 0, 0, 0.819152, 0.573577, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3730 at 23.564209 yards.
(14993, 1622, 0, -5476.34, -3939.22, 354.36, 2.33874, 0, 0, 0.920505, 0.390732, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2987 at 36.343937 yards.
(15009, 1622, 0, -4774.1, -3937.35, 347.532, 0.767944, 0, 0, 0.374606, 0.927184, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12789 at 60.308205 yards.
(15010, 1622, 0, -5316.59, -3923.52, 340.157, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 3807 at 7.011124 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(14981, 1164, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Loch Modan 61 objects total
(14993, 1164, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Loch Modan 61 objects total
(15009, 1164, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Loch Modan 61 objects total
(15010, 1164, 0, 'Bruiseweed', 0, 10); -- Bruiseweed in Loch Modan 61 objects total

-- Missing Bruiseweed spawns in Westfall.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(15002, 1622, 0, -9793.57, 1498.49, 42.9337, 4.4855, 0, 0, -0.782608, 0.622515, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3419 at 12.498158 yards.
(15070, 1622, 0, -10447, 1912.6, 9.39542, 1.78023, 0, 0, 0.777145, 0.629321, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 3331 at 26.846590 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(15002, 1110, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Westfall 76 objects total
(15070, 1110, 0, 'Bruiseweed', 0, 10); -- Bruiseweed in Westfall 76 objects total

-- Missing Bruiseweed spawns in Redridge Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(15004, 1622, 0, -9462.51, -3026.77, 136.647, 1.02974, 0, 0, 0.492423, 0.870356, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3715 at 53.466412 yards.
(15005, 1622, 0, -9098.85, -3333.52, 100.367, 1.44862, 0, 0, 0.66262, 0.748956, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3557 at 34.581383 yards.
(15021, 1622, 0, -9677.12, -2839.97, 51.9216, 4.03171, 0, 0, -0.902585, 0.430512, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3354 at 12.262121 yards.
(15044, 1622, 0, -9620.35, -2869.21, 61.6724, 6.0912, 0, 0, -0.0958452, 0.995396, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3288 at 10.377670 yards.
(15045, 1622, 0, -9602.98, -3096.85, 57.9598, 3.26377, 0, 0, -0.998135, 0.0610518, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3282 at 22.315813 yards.
(15047, 1622, 0, -9628.97, -3168.42, 49.4796, 4.62512, 0, 0, -0.737277, 0.675591, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3055 at 30.076723 yards.
(15063, 1622, 0, -9288.58, -3325.65, 112.675, 0.383971, 0, 0, 0.190808, 0.981627, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3801 at 24.382053 yards.
(15068, 1622, 0, -8703.74, -2310.06, 161.109, 6.24828, 0, 0, -0.0174522, 0.999848, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 3817 at 25.198217 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(15004, 1126, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Redridge 98 objects total
(15005, 1126, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Redridge 98 objects total
(15021, 1126, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Redridge 98 objects total
(15044, 1126, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Redridge 98 objects total
(15045, 1126, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Redridge 98 objects total
(15047, 1126, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Redridge 98 objects total
(15063, 1126, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Redridge 98 objects total
(15068, 1126, 0, 'Bruiseweed', 0, 10); -- Bruiseweed in Redridge 98 objects total

-- Missing Bruiseweed spawns in Arathi Highlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(14669, 1622, 0, -776.789, -1982.12, 34.4857, 1.22173, 0, 0, 0.573576, 0.819152, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3079 at 97.253456 yards.
(14693, 1622, 0, -1759.68, -1525.38, 60.9828, 2.05949, 0, 0, 0.857167, 0.515038, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3079 at 1014.942261 yards.
(14738, 1622, 0, -1566.26, -1655.15, 68.1308, 5.93412, 0, 0, -0.173648, 0.984808, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3079 at 783.645874 yards.
(14851, 1622, 0, -1723.8, -1832.74, 81.1296, 3.94445, 0, 0, -0.920505, 0.390732, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3079 at 874.278442 yards.
(14994, 1622, 0, -1664.37, -1769.13, 81.2792, 3.07177, 0, 0, 0.999391, 0.0349061, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 3079 at 832.581970 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(14669, 1052, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Arathi Highlands
(14693, 1052, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Arathi Highlands
(14738, 1052, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Arathi Highlands
(14851, 1052, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Arathi Highlands
(14994, 1052, 0, 'Bruiseweed', 0, 10); -- Bruiseweed in Arathi Highlands

-- Missing Bruiseweed spawns in Silverpine Forest.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(14622, 1622, 0, 114.162, 1327.6, 103.393, 2.51327, 0, 0, 0.951056, 0.309017, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3822 at 49.397743 yards.
(14623, 1622, 0, -212.187, 961.788, 72.1722, 4.10153, 0, 0, -0.887011, 0.461749, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2970 at 19.356089 yards.
(14624, 1622, 0, -82.8668, 872.231, 65.2026, 1.72787, 0, 0, 0.760406, 0.649449, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2944 at 14.875857 yards.
(14934, 1622, 0, 227.415, 1478.35, 142.382, 2.72271, 0, 0, 0.978148, 0.207912, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3684 at 31.687201 yards.
(14971, 1622, 0, 68.9466, 762.575, 63.6638, 4.25861, 0, 0, -0.848047, 0.529921, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 3670 at 6.312289 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(14622, 1047, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Silverpine Forest 76 objects total
(14623, 1047, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Silverpine Forest 76 objects total
(14624, 1047, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Silverpine Forest 76 objects total
(14934, 1047, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Silverpine Forest 76 objects total
(14971, 1047, 0, 'Bruiseweed', 0, 10); -- Bruiseweed in Silverpine Forest 76 objects total

-- Missing Bruiseweed spawns in Darkshore.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(14780, 1622, 1, 7371.6, -964.426, 32.2543, 5.63741, 0, 0, -0.317305, 0.948324, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3090 at 73.213814 yards.
(14987, 1622, 1, 4609.48, 563.931, 1.2706, 2.63544, 0, 0, 0.968147, 0.250381, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3479 at 17.164177 yards.
(14988, 1622, 1, 7370.56, -776.133, 8.09829, 4.03171, 0, 0, -0.902585, 0.430512, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 2968 at 41.817055 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(14780, 1101, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Darkshore 39 objects total
(14987, 1101, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Darkshore 39 objects total
(14988, 1101, 0, 'Bruiseweed', 0, 10); -- Bruiseweed in Darkshore 39 objects total

-- Missing Bruiseweed spawns in Hillsbrad Foothills.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(14614, 1622, 0, -772.051, -1217.61, 61.4927, 6.03884, 0, 0, -0.121869, 0.992546, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3075 at 6.468458 yards.
(14615, 1622, 0, -983.237, -1207.32, 67.0874, 1.83259, 0, 0, 0.793353, 0.608762, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2981 at 5.806823 yards.
(14641, 1622, 0, -326.226, -354.014, 80.6472, 2.67035, 0, 0, 0.972369, 0.233448, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3650 at 102.907562 yards.
(14672, 1622, 0, 87.021, -1039.61, 87.1876, 0.767944, 0, 0, 0.374606, 0.927184, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3264 at 64.939079 yards.
(14690, 1622, 0, 182.338, -1051.84, 83.7362, 4.83456, 0, 0, -0.66262, 0.748956, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3227 at 45.351620 yards.
(14694, 1622, 0, -796.592, -1170.49, 68.9588, 5.49779, 0, 0, -0.382683, 0.92388, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3235 at 17.073061 yards.
(14732, 1622, 0, 160.866, -1025.17, 95.9587, 2.47837, 0, 0, 0.945518, 0.325568, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3227 at 39.328514 yards.
(14739, 1622, 0, -214.537, -1207.99, 119.931, 1.88495, 0, 0, 0.809016, 0.587786, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3570 at 11.852864 yards.
(14829, 1622, 0, -253.693, -1540.89, 109.527, 6.16101, 0, 0, -0.0610485, 0.998135, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3129 at 18.857946 yards.
(15069, 1622, 0, -463.715, 76.9327, 56.6125, 5.02655, 0, 0, -0.587785, 0.809017, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 3208 at 6.415973 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(14614, 1048, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Hillsbrad 102 objects total
(14615, 1048, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Hillsbrad 102 objects total
(14641, 1048, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Hillsbrad 102 objects total
(14672, 1048, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Hillsbrad 102 objects total
(14690, 1048, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Hillsbrad 102 objects total
(14694, 1048, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Hillsbrad 102 objects total
(14732, 1048, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Hillsbrad 102 objects total
(14739, 1048, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Hillsbrad 102 objects total
(14829, 1048, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Hillsbrad 102 objects total
(15069, 1048, 0, 'Bruiseweed', 0, 10); -- Bruiseweed in Hillsbrad 102 objects total

-- Missing Bruiseweed spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(14969, 1622, 1, 2922.28, -3496.77, 116.395, 1.309, 0, 0, 0.608761, 0.793354, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3365 at 72.435646 yards.
(14980, 1622, 1, 2038.86, -2776.85, 125.449, 4.34587, 0, 0, -0.824126, 0.566406, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3298 at 108.489700 yards.
(14989, 1622, 1, 3459.65, 826.669, 6.31089, 0.122173, 0, 0, 0.0610485, 0.998135, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3643 at 18.258480 yards.
(14990, 1622, 1, 3714.13, 901.109, 0.967006, 0.575957, 0, 0, 0.284015, 0.95882, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3640 at 29.119507 yards.
(14992, 1622, 1, 1947.19, -1507.37, 76.0937, 1.29154, 0, 0, 0.601814, 0.798636, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3529 at 12.614513 yards.
(14996, 1622, 1, 3635.83, 935.257, 3.26611, 5.51524, 0, 0, -0.374606, 0.927184, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3642 at 10.780035 yards.
(14997, 1622, 1, 2536.5, -2189.83, 198.977, 1.29154, 0, 0, 0.601814, 0.798636, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3618 at 8.972680 yards.
(14998, 1622, 1, 1603.09, -3015.52, 102.267, 1.44862, 0, 0, 0.66262, 0.748956, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2963 at 45.666969 yards.
(15018, 1622, 1, 2231.59, -1551.59, 93.0479, 0.645772, 0, 0, 0.317305, 0.948324, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 3535 at 13.736752 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(14969, 1072, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Ashenvale 137 objects total
(14980, 1072, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Ashenvale 137 objects total
(14989, 1072, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Ashenvale 137 objects total
(14990, 1072, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Ashenvale 137 objects total
(14992, 1072, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Ashenvale 137 objects total
(14996, 1072, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Ashenvale 137 objects total
(14997, 1072, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Ashenvale 137 objects total
(14998, 1072, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Ashenvale 137 objects total
(15018, 1072, 0, 'Bruiseweed', 0, 10); -- Bruiseweed in Ashenvale 137 objects total

-- Missing Bruiseweed spawns in Thousand Needles.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(14540, 1622, 1, -6381.36, -3356.16, -55.2018, 2.84488, 0, 0, 0.989016, 0.147811, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3507 at 27.943148 yards.
(14541, 1622, 1, -5455.87, -3290, -33.4933, 4.18879, 0, 0, -0.866025, 0.500001, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3768 at 31.949848 yards.
(14674, 1622, 1, -6669.87, -3806.92, -52.5477, 2.74016, 0, 0, 0.979924, 0.19937, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3486 at 225.484985 yards.
(14731, 1622, 1, -5536.36, -3036.44, -44.4939, 1.48353, 0, 0, 0.67559, 0.737278, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3348 at 23.753332 yards.
(14811, 1622, 1, -5186.26, -2464.78, -50.7728, 4.2237, 0, 0, -0.857167, 0.515038, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3539 at 45.151485 yards.
(14812, 1622, 1, -6433.54, -3439.05, -58.7499, 3.03684, 0, 0, 0.998629, 0.0523532, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3884 at 37.922588 yards.
(14818, 1622, 1, -6189.25, -3501.39, -54.5429, 3.87463, 0, 0, -0.93358, 0.358368, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3798 at 21.360666 yards.
(14966, 1622, 1, -4679.05, -1474.73, -48.2578, 5.61996, 0, 0, -0.325567, 0.945519, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3521 at 33.399662 yards.
(14967, 1622, 1, -4652.41, -942.781, -45.128, 4.67748, 0, 0, -0.719339, 0.694659, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3085 at 111.244537 yards.
(14970, 1622, 1, -4503.07, -1151, -56.5955, 5.34071, 0, 0, -0.45399, 0.891007, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3623 at 62.297657 yards.
(14982, 1622, 1, -4872.65, -1103.77, -56.2533, 0.698131, 0, 0, 0.34202, 0.939693, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3520 at 28.197088 yards.
(14985, 1622, 1, -5220.05, -2716.26, -48.2689, 3.47321, 0, 0, -0.986285, 0.16505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3307 at 45.763714 yards.
(14986, 1622, 1, -5130.82, -2040.2, -47.5401, 4.24115, 0, 0, -0.85264, 0.522499, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 3587 at 10.564413 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(14540, 1133, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Thousand Needles 59 objects total
(14541, 1133, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Thousand Needles 59 objects total
(14674, 1133, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Thousand Needles 59 objects total
(14731, 1133, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Thousand Needles 59 objects total
(14811, 1133, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Thousand Needles 59 objects total
(14812, 1133, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Thousand Needles 59 objects total
(14818, 1133, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Thousand Needles 59 objects total
(14966, 1133, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Thousand Needles 59 objects total
(14967, 1133, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Thousand Needles 59 objects total
(14970, 1133, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Thousand Needles 59 objects total
(14982, 1133, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Thousand Needles 59 objects total
(14985, 1133, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Thousand Needles 59 objects total
(14986, 1133, 0, 'Bruiseweed', 0, 10); -- Bruiseweed in Thousand Needles 59 objects total

-- Missing Bruiseweed spawns in Desolace.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(14620, 1622, 1, -210.988, 695.236, 91.0378, 2.35619, 0, 0, 0.92388, 0.382683, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3363 at 50.140778 yards.
(14621, 1622, 1, -432.996, 1840.38, 126.799, 5.2709, 0, 0, -0.484809, 0.87462, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3078 at 67.187889 yards.
(14673, 1622, 1, -1868.14, 1964.29, 62.4533, 3.85718, 0, 0, -0.936671, 0.35021, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2953 at 45.699425 yards.
(14680, 1622, 1, -1732.9, 1875.7, 62.3673, 4.64258, 0, 0, -0.731354, 0.681998, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2920 at 83.783432 yards.
(34200, 1622, 1, -391.862, 1841.03, 126.799, 2.70526, 0, 0, 0.976295, 0.216442, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34165 at 55.915646 yards.
(14695, 1622, 1, -113.552, 998.368, 90.3626, 0.663223, 0, 0, 0.325567, 0.945519, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3320 at 70.063538 yards.
(14734, 1622, 1, -1662.41, 1919.26, 60.9899, 1.0472, 0, 0, 0.5, 0.866025, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3156 at 22.095015 yards.
(14735, 1622, 1, -1146.25, 2904.26, 199.923, 5.79449, 0, 0, -0.241921, 0.970296, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3221 at 60.589764 yards.
(14777, 1622, 1, -1082.9, 1342.79, 73.2827, 4.24115, 0, 0, -0.85264, 0.522499, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3126 at 91.267464 yards.
(14849, 1622, 1, -1455.16, 1437.82, 69.9978, 0.610863, 0, 0, 0.300705, 0.953717, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 3773 at 69.564362 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(14620, 1137, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Desolace 50 objects total
(14621, 1137, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Desolace 50 objects total
(14673, 1137, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Desolace 50 objects total
(14680, 1137, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Desolace 50 objects total
(34200, 1137, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Desolace 50 objects total
(14695, 1137, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Desolace 50 objects total
(14734, 1137, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Desolace 50 objects total
(14735, 1137, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Desolace 50 objects total
(14777, 1137, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Desolace 50 objects total
(14849, 1137, 0, 'Bruiseweed', 0, 10); -- Bruiseweed in Desolace 50 objects total

-- Missing Bruiseweed spawns in Stonetalon Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(14603, 1622, 1, 2207.85, 1457.16, 298.49, 3.28124, 0, 0, -0.997563, 0.0697661, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3086 at 78.016342 yards.
(14605, 1622, 1, 110.031, 121.699, 58.117, 3.99681, 0, 0, -0.909961, 0.414694, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3040 at 80.356071 yards.
(14606, 1622, 1, -137.271, -444.173, -11.8297, 4.34587, 0, 0, -0.824126, 0.566406, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3830 at 19.670895 yards.
(14617, 1622, 1, -13.3543, -539.787, -38.692, 0.506145, 0, 0, 0.25038, 0.968148, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3425 at 71.536919 yards.
(14696, 1622, 1, 2686.99, 1573.27, 261.167, 1.37881, 0, 0, 0.636078, 0.771625, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3429 at 47.887459 yards.
(14740, 1622, 1, 2513.21, 1658.03, 300.209, 5.5676, 0, 0, -0.350207, 0.936672, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3845 at 20.635815 yards.
(14776, 1622, 1, 748.818, 1542.47, -16.4499, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3491 at 33.981422 yards.
(14779, 1622, 1, 2517.74, 1685.1, 302.962, 2.77507, 0, 0, 0.983254, 0.182238, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3845 at 29.071192 yards.
(14817, 1622, 1, 182.025, -790.818, 10.764, 4.15388, 0, 0, -0.874619, 0.48481, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3701 at 56.144207 yards.
(14850, 1622, 1, 2667.05, 1450.21, 227.443, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3716 at 41.407196 yards.
(14935, 1622, 1, -150.817, -588.083, 0.593653, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3747 at 29.584057 yards.
(14936, 1622, 1, 1474.58, -507.138, 44.3524, 1.37881, 0, 0, 0.636078, 0.771625, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3177 at 127.326393 yards.
(14937, 1622, 1, 1024.82, -335.812, 5.84693, 0.59341, 0, 0, 0.292371, 0.956305, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3679 at 13.166197 yards.
(14938, 1622, 1, 1238.75, -2.22407, -6.00124, 4.66003, 0, 0, -0.725374, 0.688355, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2947 at 48.992046 yards.
(14939, 1622, 1, 2428.22, 1794.94, 394.01, 2.3911, 0, 0, 0.930417, 0.366502, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2962 at 36.045570 yards.
(14940, 1622, 1, 1390.03, 1016.71, 163.304, 4.18879, 0, 0, -0.866025, 0.500001, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3857 at 73.667610 yards.
(14941, 1622, 1, 1494.71, 1292.89, 181.399, 2.63544, 0, 0, 0.968147, 0.250381, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2967 at 63.495457 yards.
(14942, 1622, 1, 574.627, 1869.33, 0.097795, 4.10153, 0, 0, -0.887011, 0.461749, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3864 at 17.840078 yards.
(14944, 1622, 1, 980.301, 1755.52, 2.21413, 5.8294, 0, 0, -0.224951, 0.97437, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3081 at 6.777369 yards.
(14957, 1622, 1, 1757.32, 846.001, 148.717, 2.25147, 0, 0, 0.902585, 0.430512, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3831 at 22.155947 yards.
(14958, 1622, 1, 859.194, 149.806, 36.5573, 0.575957, 0, 0, 0.284015, 0.95882, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3737 at 22.360413 yards.
(14991, 1622, 1, 1198.88, -377.383, 16.838, 3.75246, 0, 0, -0.953716, 0.300708, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3630 at 32.333603 yards.
(14995, 1622, 1, 991.179, -367.07, 10.4241, 3.24635, 0, 0, -0.998629, 0.0523532, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3033 at 42.078506 yards.
(15011, 1622, 1, -7.82878, -371.534, 1.38996, 3.26377, 0, 0, -0.998135, 0.0610518, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3695 at 52.552742 yards.
(15014, 1622, 1, 1332.29, 52.235, 13.952, 2.96704, 0, 0, 0.996194, 0.087165, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 3136 at 63.838856 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(14603, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(14605, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(14606, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(14617, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(14696, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(14740, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(14776, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(14779, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(14817, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(14850, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(14935, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(14936, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(14937, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(14938, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(14939, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(14940, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(14941, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(14942, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(14944, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(14957, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(14958, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(14991, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(14995, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(15011, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(15014, 1086, 0, 'Bruiseweed', 0, 10); -- Bruiseweed in Stonetalon 169 objects total

-- Missing Bruiseweed spawns in Wailing Caverns.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(15016, 1622, 1, -732.775, -2066.87, 72.771, 4.7822, 0, 0, -0.681998, 0.731354, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3662 at 55.825401 yards.
(15017, 1622, 1, -606.03, -2135.14, 52.8572, 2.37364, 0, 0, 0.927183, 0.374608, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 3662 at 91.155930 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(15016, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Barrens 95 objects total
(15017, 1036, 0, 'Bruiseweed', 0, 10); -- Bruiseweed in Barrens 95 objects total

-- Missing Bruiseweed spawns in The Barrens.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(999333, 3730, 1, 836.7, -3294.61, 208.639, 3.03684, 0, 0, 0.998629, 0.0523532, 300, 300, 1, 100, 0, 10),
(999334, 3730, 1, -1462.52, -3666.71, 92.5161, 1.22173, 0, 0, 0.573576, 0.819152, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 999333 at 2332.028076 yards.
(999335, 3730, 1, -3992.33, -1976.66, 95.7966, 5.75959, 0, 0, -0.258819, 0.965926, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 999333 at 5006.921387 yards.
(999336, 3730, 1, -3138.19, -1828.97, 104.068, 3.47321, 0, 0, -0.986285, 0.16505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 999333 at 4237.781250 yards.
(999337, 3730, 1, -3020.08, -1820.19, 114.323, 3.07177, 0, 0, 0.999391, 0.0349061, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 999333 at 4130.080078 yards.
(999338, 3730, 1, -3151.24, -1943.86, 99.891, 1.18682, 0, 0, 0.559193, 0.829038, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 999333 at 4211.889648 yards.
(999339, 3730, 1, 766.801, -3167.56, 208.865, 3.29869, 0, 0, -0.996917, 0.0784664, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 999333 at 145.009079 yards.
(999340, 3730, 1, 1362.08, -3548.99, 94.1139, 0.977383, 0, 0, 0.469471, 0.882948, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 999333 at 594.852295 yards.
(999341, 3730, 1, -1936.38, -2890.16, 100.831, 0.349065, 0, 0, 0.173648, 0.984808, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 999333 at 2804.491943 yards.
(999342, 3730, 1, -3047.77, -1973.38, 99.2705, 3.76991, 0, 0, -0.951056, 0.309017, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 999333 at 4104.475586 yards.
(999343, 3730, 1, 725.236, -3259.67, 237.531, 0.90757, 0, 0, 0.438371, 0.898794, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 999333 at 120.331978 yards.
(999344, 3730, 1, 1260.38, -3611.9, 89.6523, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 999333 at 542.526855 yards.
(999345, 3730, 1, -3037.77, -1890.05, 92.5043, 3.15906, 0, 0, -0.999962, 0.00873464, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 999333 at 4122.838379 yards.
(999346, 3730, 1, 788.142, -3367.38, 208.85, 1.62316, 0, 0, 0.725374, 0.688355, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 999333 at 87.483498 yards.
(999347, 3730, 1, 662.912, -1226.24, 116.405, 5.70723, 0, 0, -0.284015, 0.95882, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 999333 at 2077.706543 yards.
(999348, 3730, 1, -3327.7, -1823.19, 101.588, 2.63544, 0, 0, 0.968147, 0.250381, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 999333 at 4418.004395 yards.
(999349, 3730, 1, -3069.06, -2175.8, 109.849, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 999333 at 4064.044189 yards.
(999350, 3730, 1, -593.159, -2232.84, 222.446, 4.31097, 0, 0, -0.833885, 0.551938, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 999333 at 1781.023071 yards.
(999351, 3730, 1, -4217.95, -1984.49, 100.462, 0.401425, 0, 0, 0.199368, 0.979925, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 999333 at 5222.796875 yards.
(999352, 3730, 1, -4195.54, -2300.27, 87.197, 0.261798, 0, 0, 0.130526, 0.991445, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 999333 at 5130.974609 yards.
(999353, 3730, 1, -3227.17, -2259.22, 103.7, 6.03884, 0, 0, -0.121869, 0.992546, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 999333 at 4195.006836 yards.
(999354, 3730, 1, -595.274, -2358.61, 156.3, 1.11701, 0, 0, 0.529919, 0.848048, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 999333 at 1711.544556 yards.
(999355, 3730, 1, -1597.58, -1623.89, 116.987, 4.85202, 0, 0, -0.656058, 0.75471, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 999333 at 2953.883057 yards.
(999356, 3730, 1, -3048.72, -1750.75, 107.992, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 999333 at 4182.119141 yards.
(999357, 3730, 1, -3283.72, -1768.19, 103.057, 6.12611, 0, 0, -0.0784588, 0.996917, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 999333 at 4395.334473 yards.
(999358, 3730, 1, -4094.49, -1790.92, 118.49, 1.88495, 0, 0, 0.809016, 0.587786, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 999333 at 5156.145996 yards.
(999359, 3730, 1, -3201.34, -2307.78, 109.676, 3.99681, 0, 0, -0.909961, 0.414694, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 999333 at 4158.051758 yards.
(999360, 3730, 1, -3068.82, -2245.11, 93.3119, 4.17134, 0, 0, -0.870356, 0.492424, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 999333 at 4045.718262 yards.
(999361, 3730, 1, -2067.82, -3178.61, 122.367, 5.2709, 0, 0, -0.484809, 0.87462, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 999333 at 2908.115479 yards.
(999362, 3730, 1, 668.432, -3163.95, 189.868, 1.3439, 0, 0, 0.622514, 0.782609, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 999333 at 213.865723 yards.
(999363, 3730, 1, 260.302, -2386.83, 186.325, 5.84685, 0, 0, -0.216439, 0.976296, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 999333 at 1075.545044 yards.
(999364, 3730, 1, -2346.53, -2219.04, 92.2233, 0.890117, 0, 0, 0.430511, 0.902586, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 999333 at 3362.046631 yards.
(999365, 3730, 1, -3905.45, -1915.39, 99.6396, 1.36136, 0, 0, 0.62932, 0.777146, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 999333 at 4939.849609 yards.
(999366, 3730, 1, -661.164, -2159.27, 200.95, 2.30383, 0, 0, 0.913545, 0.406738, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 999333 at 1879.535156 yards.
(999367, 3730, 1, -3972.73, -1639.11, 97.5111, 1.27409, 0, 0, 0.594822, 0.803857, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 999333 at 5087.597656 yards.
(999368, 3730, 1, -3043.2, -1683.72, 107.098, 2.87979, 0, 0, 0.991445, 0.130528, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 999333 at 4202.249512 yards.
(999369, 3730, 1, -3241.27, -1656.94, 92.4505, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 999333 at 4396.055176 yards.
(999370, 3730, 1, -4022.79, -1906.58, 98.1126, 2.23402, 0, 0, 0.898793, 0.438373, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 999333 at 5055.045898 yards.
(999371, 3730, 1, -4202.47, -2087.11, 100.523, 1.46608, 0, 0, 0.66913, 0.743145, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 999333 at 5182.951172 yards.
(999372, 3730, 1, 810.242, -1256.33, 112.431, 4.38078, 0, 0, -0.814116, 0.580703, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 999333 at 2040.720947 yards.
(999373, 3730, 1, -2082.59, -3663.98, 61.1472, 2.54818, 0, 0, 0.956305, 0.292372, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 999333 at 2946.259033 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(999333, 1036, 0, 'Bruiseweed', 0, 10),
(999334, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(999335, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(999336, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(999337, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(999338, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(999339, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(999340, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(999341, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(999342, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(999343, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(999344, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(999345, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(999346, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(999347, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(999348, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(999349, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(999350, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(999351, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(999352, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(999353, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(999354, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(999355, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(999356, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(999357, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(999358, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(999359, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(999360, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(999361, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(999362, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(999363, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(999364, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(999365, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(999366, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(999367, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(999368, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(999369, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(999370, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(999371, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(999372, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(999373, 1036, 0, 'Bruiseweed', 0, 10); -- Bruiseweeds in The Barrens

-- Create new pool to hold Doom Weed spawns in Tirisfal Glades.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(415, 40, 'Doom Weeds in Tirisfal Glades', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(45031, 409, 0, 'Doom Weed', 0, 10),
(45032, 409, 0, 'Doom Weed', 0, 10),
(45070, 409, 0, 'Doom Weed', 0, 10),
(45071, 409, 0, 'Doom Weed', 0, 10),
(45072, 409, 0, 'Doom Weed', 0, 10),
(45112, 409, 0, 'Doom Weed', 0, 10),
(45169, 409, 0, 'Doom Weed', 0, 10),
(45178, 409, 0, 'Doom Weed', 0, 10),
(45179, 409, 0, 'Doom Weed', 0, 10),
(45181, 409, 0, 'Doom Weed', 0, 10),
(45182, 409, 0, 'Doom Weed', 0, 10),
(45183, 409, 0, 'Doom Weed', 0, 10),
(45184, 409, 0, 'Doom Weed', 0, 10),
(45185, 409, 0, 'Doom Weed', 0, 10),
(45186, 409, 0, 'Doom Weed', 0, 10),
(45187, 409, 0, 'Doom Weed', 0, 10),
(45188, 409, 0, 'Doom Weed', 0, 10),
(45210, 409, 0, 'Doom Weed', 0, 10),
(45211, 409, 0, 'Doom Weed', 0, 10),
(45212, 409, 0, 'Doom Weed', 0, 10),
(45214, 409, 0, 'Doom Weed', 0, 10),
(45215, 409, 0, 'Doom Weed', 0, 10),
(45216, 409, 0, 'Doom Weed', 0, 10),
(45217, 409, 0, 'Doom Weed', 0, 10),
(45218, 409, 0, 'Doom Weed', 0, 10),
(45286, 409, 0, 'Doom Weed', 0, 10),
(45291, 409, 0, 'Doom Weed', 0, 10);

-- Missing Doom Weed spawns in Tirisfal Glades.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(45224, 176753, 0, 2574.08, 398.103, 33.1812, 3.12412, 0, 0, 0.999962, 0.00873464, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45211 at 22.711180 yards.
(45282, 176753, 0, 2596.32, 396.81, 35.748, 2.91469, 0, 0, 0.993571, 0.113208, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45211 at 12.224313 yards.
(45285, 176753, 0, 2584.16, 406.246, 34.2144, 5.41052, 0, 0, -0.422618, 0.906308, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45211 at 22.735905 yards.
(45292, 176753, 0, 2606.75, 485.595, 22.2602, 5.88176, 0, 0, -0.199368, 0.979925, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45212 at 21.387922 yards.
(45196, 176753, 0, 2579.67, 417.986, 32.7585, 0.942477, 0, 0, 0.45399, 0.891007, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45187 at 31.852596 yards.
(45476, 176753, 0, 2591.56, 508.857, 21.1091, 0.680677, 0, 0, 0.333806, 0.942642, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45185 at 37.824726 yards.
(45631, 176753, 0, 2669.85, 500.801, 14.9761, 0.0174525, 0, 0, 0.00872612, 0.999962, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45183 at 43.925026 yards.
(45737, 176753, 0, 2549.78, 523.822, 15.3514, 3.7001, 0, 0, -0.961261, 0.27564, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45291 at 12.030589 yards.
(45752, 176753, 0, 2566.46, 539.654, 15.6006, 5.68977, 0, 0, -0.292372, 0.956305, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45291 at 16.780058 yards.
(45783, 176753, 0, 2661.83, 553.988, 15.7135, 4.85202, 0, 0, -0.656058, 0.75471, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 45188 at 6.289917 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(45224, 409, 0, 'Doom Weed', 0, 10), -- Doom Weeds in Tirisfal Glades
(45282, 409, 0, 'Doom Weed', 0, 10), -- Doom Weeds in Tirisfal Glades
(45285, 409, 0, 'Doom Weed', 0, 10), -- Doom Weeds in Tirisfal Glades
(45292, 409, 0, 'Doom Weed', 0, 10), -- Doom Weeds in Tirisfal Glades
(45196, 409, 0, 'Doom Weed', 0, 10), -- Doom Weeds in Tirisfal Glades
(45476, 409, 0, 'Doom Weed', 0, 10), -- Doom Weeds in Tirisfal Glades
(45631, 409, 0, 'Doom Weed', 0, 10), -- Doom Weeds in Tirisfal Glades
(45737, 409, 0, 'Doom Weed', 0, 10), -- Doom Weeds in Tirisfal Glades
(45752, 409, 0, 'Doom Weed', 0, 10), -- Doom Weeds in Tirisfal Glades
(45783, 409, 0, 'Doom Weed', 0, 10); -- Doom Weeds in Tirisfal Glades

-- Correct position of Dreamfoil in Un'Goro Crater (position is off by 1.17064 yards).
UPDATE `gameobject` SET `position_x`=-6751.08, `position_y`=-2048.45, `position_z`=-271.963, `orientation`=4.64258, `rotation0`=0, `rotation1`=0, `rotation2`=-0.731354, `rotation3`=0.681998 WHERE `guid`=19269;

-- Correct position of Dreamfoil in Un'Goro Crater (position is off by 0.7812 yards).
UPDATE `gameobject` SET `position_x`=-6811.88, `position_y`=-1785.77, `position_z`=-270.054, `orientation`=6.02139, `rotation0`=0, `rotation1`=0, `rotation2`=-0.130526, `rotation3`=0.991445 WHERE `guid`=19619;

-- Correct position of Dreamfoil in Azshara (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=3320.06, `position_y`=-4643.19, `position_z`=97.123, `orientation`=4.62512, `rotation0`=0, `rotation1`=0, `rotation2`=-0.737277, `rotation3`=0.675591 WHERE `guid`=16406;

-- Correct position of Dreamfoil in Un'Goro Crater (position is off by 0.44553 yards).
UPDATE `gameobject` SET `position_x`=-6449.25, `position_y`=-1354.78, `position_z`=-270.704, `orientation`=6.07375, `rotation0`=0, `rotation1`=0, `rotation2`=-0.104528, `rotation3`=0.994522 WHERE `guid`=19650;

-- Correct position of Dreamfoil in Burning Steppes (position is off by 0.97947 yards).
UPDATE `gameobject` SET `position_x`=-7929.01, `position_y`=-2260.38, `position_z`=127.713, `orientation`=3.6652, `rotation0`=0, `rotation1`=0, `rotation2`=-0.965925, `rotation3`=0.258821 WHERE `guid`=39953;

-- Correct position of Dreamfoil in Burning Steppes (position is off by 1.18334 yards).
UPDATE `gameobject` SET `position_x`=-8156.59, `position_y`=-1824.11, `position_z`=133.54, `orientation`=3.97935, `rotation0`=0, `rotation1`=0, `rotation2`=-0.913545, `rotation3`=0.406738 WHERE `guid`=19510;

-- Correct position of Dreamfoil in Un'Goro Crater (position is off by 0.945357 yards).
UPDATE `gameobject` SET `position_x`=-7186.21, `position_y`=-1883.08, `position_z`=-271.056, `orientation`=1.37881, `rotation0`=0, `rotation1`=0, `rotation2`=0.636078, `rotation3`=0.771625 WHERE `guid`=19427;

-- Correct position of Dreamfoil in Un'Goro Crater (position is off by 0.407098 yards).
UPDATE `gameobject` SET `position_x`=-7646.25, `position_y`=-2153.68, `position_z`=-271.028, `orientation`=1.50098, `rotation0`=0, `rotation1`=0, `rotation2`=0.681998, `rotation3`=0.731354 WHERE `guid`=19293;

-- Correct position of Dreamfoil in Un'Goro Crater (position is off by 0.51732 yards).
UPDATE `gameobject` SET `position_x`=-7862.32, `position_y`=-1462.65, `position_z`=-267.793, `orientation`=4.11898, `rotation0`=0, `rotation1`=0, `rotation2`=-0.882947, `rotation3`=0.469473 WHERE `guid`=19334;

-- Correct position of Dreamfoil in Western Plaguelands (position is off by 0.960267 yards).
UPDATE `gameobject` SET `position_x`=1652.2, `position_y`=-1479.44, `position_z`=59.5693, `orientation`=1.3439, `rotation0`=0, `rotation1`=0, `rotation2`=0.622514, `rotation3`=0.782609 WHERE `guid`=19261;

-- Correct position of Dreamfoil in Silithus (position is off by 0.0102539 yards).
UPDATE `gameobject` SET `position_x`=-6449.84, `position_y`=1330.59, `position_z`=1.34675, `orientation`=4.66003, `rotation0`=0, `rotation1`=0, `rotation2`=-0.725374, `rotation3`=0.688355 WHERE `guid`=16381;

-- Correct position of Dreamfoil in Eastern Plaguelands (position is off by 0.257833 yards).
UPDATE `gameobject` SET `position_x`=2345.27, `position_y`=-4688.18, `position_z`=75.9803, `orientation`=3.35105, `rotation0`=0, `rotation1`=0, `rotation2`=-0.994521, `rotation3`=0.104536 WHERE `guid`=19295;

-- Correct position of Dreamfoil in Un'Goro Crater (position is off by 0.92451 yards).
UPDATE `gameobject` SET `position_x`=-7618.17, `position_y`=-619.163, `position_z`=-255.354, `orientation`=3.194, `rotation0`=0, `rotation1`=0, `rotation2`=-0.999657, `rotation3`=0.0262016 WHERE `guid`=19565;

-- Correct position of Dreamfoil in Western Plaguelands (position is off by 0.821355 yards).
UPDATE `gameobject` SET `position_x`=2389.99, `position_y`=-1504.44, `position_z`=101.539, `orientation`=2.74016, `rotation0`=0, `rotation1`=0, `rotation2`=0.979924, `rotation3`=0.19937 WHERE `guid`=19311;

-- Correct position of Dreamfoil in Western Plaguelands (position is off by 0.598188 yards).
UPDATE `gameobject` SET `position_x`=1810.1, `position_y`=-2387.21, `position_z`=59.6299, `orientation`=6.19592, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0436192, `rotation3`=0.999048 WHERE `guid`=19294;

-- Correct position of Dreamfoil in Western Plaguelands (position is off by 0.343708 yards).
UPDATE `gameobject` SET `position_x`=1779.88, `position_y`=-1348.05, `position_z`=60.0857, `orientation`=1.67551, `rotation0`=0, `rotation1`=0, `rotation2`=0.743144, `rotation3`=0.669131 WHERE `guid`=19327;

-- Correct position of Dreamfoil in Un'Goro Crater (position is off by 0.377711 yards).
UPDATE `gameobject` SET `position_x`=-6164.92, `position_y`=-1572.7, `position_z`=-208.785, `orientation`=1.93731, `rotation0`=0, `rotation1`=0, `rotation2`=0.824125, `rotation3`=0.566408 WHERE `guid`=19616;

-- Missing Dreamfoil spawns in Azshara.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(19375, 176584, 1, 4350.75, -6867.52, 95.177, 3.01941, 0, 0, 0.998135, 0.0610518, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19374 at 84.135666 yards.
(19404, 176584, 1, 3797.72, -4948.68, 145.915, 3.97935, 0, 0, -0.913545, 0.406738, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19397 at 43.292957 yards.
(19328, 176584, 1, 3525.2, -4661.24, 101.48, 3.4034, 0, 0, -0.991445, 0.130528, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19283 at 44.636848 yards.
(19409, 176584, 1, 2782.8, -5948.4, 102.623, 3.54302, 0, 0, -0.979924, 0.19937, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19401 at 37.336864 yards.
(19352, 176584, 1, 3373.61, -4798.87, 110.855, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19336 at 47.193813 yards.
(19827, 176584, 1, 4417.09, -5555.2, 112.553, 4.7822, 0, 0, -0.681998, 0.731354, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19590 at 33.608570 yards.
(19550, 176584, 1, 2608.8, -6279.1, 100.791, 4.38078, 0, 0, -0.814116, 0.580703, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19548 at 79.950523 yards.
(19541, 176584, 1, 3395.1, -4277.85, 101.321, 4.41568, 0, 0, -0.803857, 0.594823, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 19498 at 105.272194 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(19375, 1242, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Azshara 122 objects total
(19404, 1242, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Azshara 122 objects total
(19328, 1242, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Azshara 122 objects total
(19409, 1242, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Azshara 122 objects total
(19352, 1242, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Azshara 122 objects total
(19827, 1242, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Azshara 122 objects total
(19550, 1242, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Azshara 122 objects total
(19541, 1242, 0, 'Dreamfoil', 0, 10); -- Dreamfoil in Azshara 122 objects total

-- Missing Dreamfoil spawns in Western Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(19362, 176584, 0, 1515.73, -1079.51, 74.4867, 3.42085, 0, 0, -0.990268, 0.139175, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19359 at 186.467636 yards.
(19615, 176584, 0, 2078, -1642.67, 63.1557, 1.27409, 0, 0, 0.594822, 0.803857, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19612 at 113.279228 yards.
(19642, 176584, 0, 2017.62, -1572.94, 60.9312, 4.76475, 0, 0, -0.688354, 0.725374, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19612 at 24.729517 yards.
(19686, 176584, 0, 1633.13, -2103.97, 58.8374, 5.77704, 0, 0, -0.25038, 0.968148, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19649 at 33.915348 yards.
(19687, 176584, 0, 1985.93, -1858.12, 69.8165, 3.12412, 0, 0, 0.999962, 0.00873464, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19632 at 262.850403 yards.
(19702, 176584, 0, 1916.66, -1954.35, 78.9259, 0.663223, 0, 0, 0.325567, 0.945519, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19632 at 157.882889 yards.
(19367, 176584, 0, 1718.48, -1012.31, 71.3803, 2.93214, 0, 0, 0.994521, 0.104536, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19359 at 63.843861 yards.
(19584, 176584, 0, 2080.25, -2486.74, 59.6818, 0.925024, 0, 0, 0.446198, 0.894935, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19581 at 69.388725 yards.
(19419, 176584, 0, 1974.43, -2421.16, 60.5007, 1.37881, 0, 0, 0.636078, 0.771625, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19418 at 44.274563 yards.
(45837, 176584, 0, 2858.97, -1490.24, 146.253, 2.51327, 0, 0, 0.951056, 0.309017, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 45477 at 162.444473 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(19362, 1260, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Western Plaguelands 33 objects total
(19615, 1260, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Western Plaguelands 33 objects total
(19642, 1260, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Western Plaguelands 33 objects total
(19686, 1260, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Western Plaguelands 33 objects total
(19687, 1260, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Western Plaguelands 33 objects total
(19702, 1260, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Western Plaguelands 33 objects total
(19367, 1260, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Western Plaguelands 33 objects total
(19584, 1260, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Western Plaguelands 33 objects total
(19419, 1260, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Western Plaguelands 33 objects total
(45837, 1260, 0, 'Dreamfoil', 0, 10); -- Dreamfoil in Western Plaguelands 33 objects total

-- Missing Dreamfoil spawns in Burning Steppes.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(19297, 176584, 0, -7887.27, -1978.09, 134.917, 3.78737, 0, 0, -0.948323, 0.317306, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19286 at 63.994720 yards.
(19326, 176584, 0, -7940.46, -2839.89, 133.573, 5.3058, 0, 0, -0.469471, 0.882948, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19324 at 58.066113 yards.
(19582, 176584, 0, -7986.98, -2422.14, 128.268, 3.17653, 0, 0, -0.999847, 0.0174693, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 19577 at 98.220741 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(19297, 1301, 0, 'Dreamfoil', 0, 10), -- Dream Foil in Burning Steppes 57 objects total
(19326, 1301, 0, 'Dreamfoil', 0, 10), -- Dream Foil in Burning Steppes 57 objects total
(19582, 1301, 0, 'Dreamfoil', 0, 10); -- Dream Foil in Burning Steppes 57 objects total

-- Missing Dreamfoil spawns in Eastern Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(19575, 176584, 0, 1773.09, -4107.52, 99.4197, 1.6057, 0, 0, 0.719339, 0.694659, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19568 at 314.992340 yards.
(19627, 176584, 0, 2390.77, -5082.78, 79.6235, 3.49067, 0, 0, -0.984807, 0.173652, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19621 at 37.657555 yards.
(19340, 176584, 0, 1675.74, -4981.45, 79.0261, 3.28124, 0, 0, -0.997563, 0.0697661, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19284 at 217.904160 yards.
(19366, 176584, 0, 1950.77, -3732.88, 127.524, 5.18363, 0, 0, -0.522498, 0.85264, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19363 at 123.710754 yards.
(19601, 176584, 0, 2839.3, -3883, 106.737, 1.3439, 0, 0, 0.622514, 0.782609, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19593 at 19.870981 yards.
(19534, 176584, 0, 1886.58, -3537.26, 110.21, 3.35105, 0, 0, -0.994521, 0.104536, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19526 at 75.781273 yards.
(19628, 176584, 0, 2066.79, -3799.68, 133.023, 0.733038, 0, 0, 0.358368, 0.93358, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19618 at 75.260178 yards.
(19266, 176584, 0, 2089.32, -4781.44, 74.7134, 3.57793, 0, 0, -0.976295, 0.216442, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19263 at 143.295929 yards.
(19631, 176584, 0, 2282.73, -4875.34, 101.072, 0.95993, 0, 0, 0.461748, 0.887011, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19622 at 79.866730 yards.
(19282, 176584, 0, 1648.37, -3419.78, 133.083, 0.453785, 0, 0, 0.224951, 0.97437, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19262 at 68.392944 yards.
(19349, 176584, 0, 2006.54, -5191.45, 81.064, 3.50812, 0, 0, -0.983254, 0.182238, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19270 at 121.722702 yards.
(19644, 176584, 0, 2386.19, -5174.74, 74.0617, 0.349065, 0, 0, 0.173648, 0.984808, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19620 at 51.002758 yards.
(19739, 176584, 0, 1850, -4281.62, 86.9686, 3.4034, 0, 0, -0.991445, 0.130528, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19588 at 204.616409 yards.
(19536, 176584, 0, 2789.93, -4104.28, 99.2775, 1.3439, 0, 0, 0.622514, 0.782609, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19532 at 118.496758 yards.
(19838, 176584, 0, 1878.28, -4879.28, 98.8299, 2.9845, 0, 0, 0.996917, 0.0784664, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 19606 at 136.237625 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(19575, 1267, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Eastern Plaguelands 71 objects total
(19627, 1267, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Eastern Plaguelands 71 objects total
(19340, 1267, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Eastern Plaguelands 71 objects total
(19366, 1267, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Eastern Plaguelands 71 objects total
(19601, 1267, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Eastern Plaguelands 71 objects total
(19534, 1267, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Eastern Plaguelands 71 objects total
(19628, 1267, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Eastern Plaguelands 71 objects total
(19266, 1267, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Eastern Plaguelands 71 objects total
(19631, 1267, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Eastern Plaguelands 71 objects total
(19282, 1267, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Eastern Plaguelands 71 objects total
(19349, 1267, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Eastern Plaguelands 71 objects total
(19644, 1267, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Eastern Plaguelands 71 objects total
(19739, 1267, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Eastern Plaguelands 71 objects total
(19536, 1267, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Eastern Plaguelands 71 objects total
(19838, 1267, 0, 'Dreamfoil', 0, 10); -- Dreamfoil in Eastern Plaguelands 71 objects total

-- Missing Dreamfoil spawns in Un'Goro Crater.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(19356, 176584, 1, -7633.23, -1917.64, -268.372, 3.73501, 0, 0, -0.956305, 0.292372, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19354 at 96.550224 yards.
(19530, 176584, 1, -7412.39, -1424.75, -271.369, 4.71239, 0, 0, -0.707107, 0.707107, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19523 at 88.975967 yards.
(19337, 176584, 1, -7794.81, -1975.55, -270.681, 2.87979, 0, 0, 0.991445, 0.130528, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19313 at 71.855263 yards.
(19434, 176584, 1, -7901.05, -1131.63, -272.205, 4.53786, 0, 0, -0.766044, 0.642789, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19431 at 58.966366 yards.
(19515, 176584, 1, -7515.11, -723.628, -254.456, 2.19911, 0, 0, 0.891006, 0.453991, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19501 at 80.443787 yards.
(19338, 176584, 1, -7289.47, -420.506, -269.51, 2.91469, 0, 0, 0.993571, 0.113208, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19289 at 141.282654 yards.
(19652, 176584, 1, -7076.98, -650.943, -269.642, 6.23083, 0, 0, -0.0261765, 0.999657, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19647 at 150.212524 yards.
(19350, 176584, 1, -6695.48, -772.953, -271.134, 2.21657, 0, 0, 0.894934, 0.446199, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19330 at 22.451742 yards.
(19734, 176584, 1, -6483.88, -1379.81, -272.495, 4.2237, 0, 0, -0.857167, 0.515038, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19650 at 42.829666 yards.
(19372, 176584, 1, -7199.46, -246.709, -217.839, 5.98648, 0, 0, -0.147809, 0.989016, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19289 at 166.882813 yards.
(19585, 176584, 1, -7544.54, -1114.93, -269.081, 4.46804, 0, 0, -0.788011, 0.615662, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 19578 at 140.474304 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(19356, 1212, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Ungoro 83 objects total
(19530, 1212, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Ungoro 83 objects total
(19337, 1212, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Ungoro 83 objects total
(19434, 1212, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Ungoro 83 objects total
(19515, 1212, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Ungoro 83 objects total
(19338, 1212, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Ungoro 83 objects total
(19652, 1212, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Ungoro 83 objects total
(19350, 1212, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Ungoro 83 objects total
(19734, 1212, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Ungoro 83 objects total
(19372, 1212, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Ungoro 83 objects total
(19585, 1212, 0, 'Dreamfoil', 0, 10); -- Dreamfoil in Ungoro 83 objects total

-- Missing Dreamfoil spawns in Silithus.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(49412, 176584, 1, -6988.66, 571.305, 8.68417, 0.767944, 0, 0, 0.374606, 0.927184, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49403 at 337.800659 yards.
(19454, 176584, 1, -6759.77, 1476.92, 4.77277, 6.02139, 0, 0, -0.130526, 0.991445, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19453 at 311.830231 yards.
(19380, 176584, 1, -7526.1, 940.236, 4.11149, 3.35105, 0, 0, -0.994521, 0.104536, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19371 at 67.163147 yards.
(19839, 176584, 1, -7716.8, 1188.04, -0.216536, 5.44543, 0, 0, -0.406736, 0.913546, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19608 at 330.927002 yards.
(19840, 176584, 1, -7987.46, 1282.15, -3.45968, 3.29869, 0, 0, -0.996917, 0.0784664, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19608 at 423.809937 yards.
(19841, 176584, 1, -7882.29, 870.72, -1.37092, 5.00909, 0, 0, -0.594823, 0.803857, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 19608 at 39.534729 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(49412, 1221, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Silithus 22 objects total
(19454, 1221, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Silithus 22 objects total
(19380, 1221, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Silithus 22 objects total
(19839, 1221, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Silithus 22 objects total
(19840, 1221, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Silithus 22 objects total
(19841, 1221, 0, 'Dreamfoil', 0, 10); -- Dreamfoil in Silithus 22 objects total

-- Create new pool to hold Dreamfoil spawns in Felwood.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(416, 6, 'Dreamfoils in Felwood', 0, 10);

-- Missing Dreamfoil spawns in Felwood.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(109, 176639, 1, 6644.92, -1244.1, 455.831, 2.46091, 0, 0, 0.942641, 0.333808, 1800, 1800, 1, 100, 0, 10),
(15071, 176639, 1, 6521.35, -1473.55, 439.164, 5.67232, 0, 0, -0.300705, 0.953717, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 109 at 261.140991 yards.
(15072, 176639, 1, 4953.82, -647.138, 295.787, 3.54302, 0, 0, -0.979924, 0.19937, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 109 at 1800.499146 yards.
(15074, 176639, 1, 6440.84, -1691.32, 502.469, 0.837757, 0, 0, 0.406736, 0.913546, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 109 at 493.790924 yards.
(15075, 176639, 1, 5820.31, -727.122, 381.453, 0.279252, 0, 0, 0.139173, 0.990268, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 109 at 976.104370 yards.
(15076, 176639, 1, 6338.19, -1171.82, 375.17, 5.75959, 0, 0, -0.258819, 0.965926, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 109 at 325.290466 yards.
(15077, 176639, 1, 5188.97, -596.913, 326.327, 4.99164, 0, 0, -0.601814, 0.798636, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 109 at 1598.565552 yards.
(15079, 176639, 1, 4521.6, -661.612, 259.686, 4.41568, 0, 0, -0.803857, 0.594823, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 109 at 2210.486816 yards.
(15082, 176639, 1, 3775.38, -1104.45, 228.32, 1.93731, 0, 0, 0.824125, 0.566408, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 109 at 2881.930420 yards.
(15083, 176639, 1, 6210.37, -1035.32, 386.014, 1.72787, 0, 0, 0.760406, 0.649449, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 109 at 487.131439 yards.
(15085, 176639, 1, 3881.28, -988.969, 246.243, 1.39626, 0, 0, 0.642787, 0.766045, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 109 at 2783.293701 yards.
(15086, 176639, 1, 4714.74, -816.447, 309.083, 3.12412, 0, 0, 0.999962, 0.00873464, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 109 at 1982.426758 yards.
(15089, 176639, 1, 4253, -998.988, 298.48, 0.191985, 0, 0, 0.0958452, 0.995396, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 109 at 2409.589355 yards.
(15091, 176639, 1, 6528.6, -1323.92, 439.695, 0.855211, 0, 0, 0.414693, 0.909961, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 109 at 141.992661 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(15071, 416, 0, 'Dreamfoil', 0, 10), -- Dreamfoils in Felwood
(15072, 416, 0, 'Dreamfoil', 0, 10), -- Dreamfoils in Felwood
(15074, 416, 0, 'Dreamfoil', 0, 10), -- Dreamfoils in Felwood
(15075, 416, 0, 'Dreamfoil', 0, 10), -- Dreamfoils in Felwood
(15076, 416, 0, 'Dreamfoil', 0, 10), -- Dreamfoils in Felwood
(15077, 416, 0, 'Dreamfoil', 0, 10), -- Dreamfoils in Felwood
(15079, 416, 0, 'Dreamfoil', 0, 10), -- Dreamfoils in Felwood
(15082, 416, 0, 'Dreamfoil', 0, 10), -- Dreamfoils in Felwood
(15083, 416, 0, 'Dreamfoil', 0, 10), -- Dreamfoils in Felwood
(15085, 416, 0, 'Dreamfoil', 0, 10), -- Dreamfoils in Felwood
(15086, 416, 0, 'Dreamfoil', 0, 10), -- Dreamfoils in Felwood
(15089, 416, 0, 'Dreamfoil', 0, 10), -- Dreamfoils in Felwood
(15091, 416, 0, 'Dreamfoil', 0, 10), -- Dreamfoils in Felwood
(109, 416, 0, 'Dreamfoil', 0, 10);
-- Correct position of Earthroot in Silverpine Forest (position is off by 0.0683693 yards).
UPDATE `gameobject` SET `position_x`=827.721, `position_y`=1257.76, `position_z`=55.3613, `orientation`=5.95157, `rotation0`=0, `rotation1`=0, `rotation2`=-0.165047, `rotation3`=0.986286 WHERE `guid`=1760;

-- Correct position of Earthroot in Durotar (position is off by 0.934254 yards).
UPDATE `gameobject` SET `position_x`=1118.32, `position_y`=-4499.9, `position_z`=20.3045, `orientation`=1.85005, `rotation0`=0, `rotation1`=0, `rotation2`=0.798635, `rotation3`=0.601815 WHERE `guid`=1847;

-- Correct position of Earthroot in Durotar (position is off by 1.35434 yards).
UPDATE `gameobject` SET `position_x`=399.175, `position_y`=-4201.98, `position_z`=26.7304, `orientation`=5.42797, `rotation0`=0, `rotation1`=0, `rotation2`=-0.414693, `rotation3`=0.909961 WHERE `guid`=1982;

-- Correct position of Earthroot in Mulgore (position is off by 0.422221 yards).
UPDATE `gameobject` SET `position_x`=-2234.58, `position_y`=276.564, `position_z`=109.757, `orientation`=1.58825, `rotation0`=0, `rotation1`=0, `rotation2`=0.71325, `rotation3`=0.70091 WHERE `guid`=1974;

-- Correct position of Earthroot in Loch Modan (position is off by 0.214844 yards).
UPDATE `gameobject` SET `position_x`=-5598.14, `position_y`=-2744.07, `position_z`=375.994, `orientation`=3.76991, `rotation0`=0, `rotation1`=0, `rotation2`=-0.951056, `rotation3`=0.309017 WHERE `guid`=1824;

-- Correct position of Earthroot in Mulgore (position is off by 0.248241 yards).
UPDATE `gameobject` SET `position_x`=-2818.18, `position_y`=-732.171, `position_z`=38.7207, `orientation`=6.03884, `rotation0`=0, `rotation1`=0, `rotation2`=-0.121869, `rotation3`=0.992546 WHERE `guid`=2070;

-- Correct position of Earthroot in Durotar (position is off by 0.755249 yards).
UPDATE `gameobject` SET `position_x`=958.55, `position_y`=-4054.57, `position_z`=-11.1736, `orientation`=3.9619, `rotation0`=0, `rotation1`=0, `rotation2`=-0.91706, `rotation3`=0.39875 WHERE `guid`=1811;

-- Correct position of Earthroot in Durotar (position is off by 0.330163 yards).
UPDATE `gameobject` SET `position_x`=515.16, `position_y`=-3927.33, `position_z`=22.4875, `orientation`=1.55334, `rotation0`=0, `rotation1`=0, `rotation2`=0.700909, `rotation3`=0.713251 WHERE `guid`=1825;

-- Correct position of Earthroot in Mulgore (position is off by 0.819468 yards).
UPDATE `gameobject` SET `position_x`=-2142.64, `position_y`=257.611, `position_z`=96.4347, `orientation`=1.5708, `rotation0`=0, `rotation1`=0, `rotation2`=0.707107, `rotation3`=0.707107 WHERE `guid`=1867;

-- Correct position of Earthroot in Silverpine Forest (position is off by 0.0371716 yards).
UPDATE `gameobject` SET `position_x`=-593.015, `position_y`=748.071, `position_z`=116.325, `orientation`=2.67035, `rotation0`=0, `rotation1`=0, `rotation2`=0.972369, `rotation3`=0.233448 WHERE `guid`=1777;

-- Correct position of Earthroot in Durotar (position is off by 0.348007 yards).
UPDATE `gameobject` SET `position_x`=341.039, `position_y`=-5138.88, `position_z`=6.93038, `orientation`=4.93928, `rotation0`=0, `rotation1`=0, `rotation2`=-0.622514, `rotation3`=0.782609 WHERE `guid`=1955;

-- Correct position of Earthroot in Durotar (position is off by 1.02079 yards).
UPDATE `gameobject` SET `position_x`=659.611, `position_y`=-4089.32, `position_z`=16.2252, `orientation`=1.78023, `rotation0`=0, `rotation1`=0, `rotation2`=0.777145, `rotation3`=0.629321 WHERE `guid`=2075;

-- Correct position of Earthroot in Durotar (position is off by 0.115636 yards).
UPDATE `gameobject` SET `position_x`=749.328, `position_y`=-4482.91, `position_z`=22.0128, `orientation`=6.23083, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0261765, `rotation3`=0.999657 WHERE `guid`=1947;

-- Correct position of Earthroot in Durotar (position is off by 0.500003 yards).
UPDATE `gameobject` SET `position_x`=223.02, `position_y`=-5020.5, `position_z`=15.0214, `orientation`=1.81514, `rotation0`=0, `rotation1`=0, `rotation2`=0.788011, `rotation3`=0.615662 WHERE `guid`=2012;

-- Correct position of Earthroot in Durotar (position is off by 0.84075 yards).
UPDATE `gameobject` SET `position_x`=-116.039, `position_y`=-4694.84, `position_z`=29.5269, `orientation`=5.32326, `rotation0`=0, `rotation1`=0, `rotation2`=-0.461748, `rotation3`=0.887011 WHERE `guid`=1790;

-- Correct position of Earthroot in Tirisfal Glades (position is off by 0.507438 yards).
UPDATE `gameobject` SET `position_x`=2469.43, `position_y`=329.287, `position_z`=32.3891, `orientation`=4.25861, `rotation0`=0, `rotation1`=0, `rotation2`=-0.848047, `rotation3`=0.529921 WHERE `guid`=1863;

-- Correct position of Earthroot in Silverpine Forest (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=889.81, `position_y`=1172.7, `position_z`=49.8807, `orientation`=3.61284, `rotation0`=0, `rotation1`=0, `rotation2`=-0.972369, `rotation3`=0.233448 WHERE `guid`=1653;

-- Correct position of Earthroot in Durotar (position is off by 0.410294 yards).
UPDATE `gameobject` SET `position_x`=1101.2, `position_y`=-4333.65, `position_z`=25.7644, `orientation`=4.32842, `rotation0`=0, `rotation1`=0, `rotation2`=-0.829037, `rotation3`=0.559194 WHERE `guid`=2081;

-- Correct position of Earthroot in Tirisfal Glades (position is off by 0.955321 yards).
UPDATE `gameobject` SET `position_x`=2592.51, `position_y`=-531.343, `position_z`=88.9996, `orientation`=3.78737, `rotation0`=0, `rotation1`=0, `rotation2`=-0.948323, `rotation3`=0.317306 WHERE `guid`=2053;

-- Correct position of Earthroot in Elwynn Forest (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-9819.25, `position_y`=-1392.68, `position_z`=53.7644, `orientation`=3.08918, `rotation0`=0, `rotation1`=0, `rotation2`=0.999657, `rotation3`=0.0262016 WHERE `guid`=1838;

-- Correct position of Earthroot in Silverpine Forest (position is off by 0.148461 yards).
UPDATE `gameobject` SET `position_x`=98.4341, `position_y`=786.782, `position_z`=73.8086, `orientation`=0.90757, `rotation0`=0, `rotation1`=0, `rotation2`=0.438371, `rotation3`=0.898794 WHERE `guid`=1749;

-- Correct position of Earthroot in Tirisfal Glades (position is off by 0.784714 yards).
UPDATE `gameobject` SET `position_x`=2330.92, `position_y`=211.52, `position_z`=36.8418, `orientation`=5.00909, `rotation0`=0, `rotation1`=0, `rotation2`=-0.594823, `rotation3`=0.803857 WHERE `guid`=1758;

-- Correct position of Earthroot in Darkshore (position is off by 0.40822 yards).
UPDATE `gameobject` SET `position_x`=6784.64, `position_y`=221.253, `position_z`=32.7102, `orientation`=3.85718, `rotation0`=0, `rotation1`=0, `rotation2`=-0.936671, `rotation3`=0.35021 WHERE `guid`=2000;

-- Correct position of Earthroot in Darkshore (position is off by 1.41332 yards).
UPDATE `gameobject` SET `position_x`=6608.91, `position_y`=229.521, `position_z`=44.5898, `orientation`=4.64258, `rotation0`=0, `rotation1`=0, `rotation2`=-0.731354, `rotation3`=0.681998 WHERE `guid`=1850;

-- Correct position of Earthroot in Darkshore (position is off by 0.53745 yards).
UPDATE `gameobject` SET `position_x`=4482.25, `position_y`=31.208, `position_z`=88.504, `orientation`=0.279252, `rotation0`=0, `rotation1`=0, `rotation2`=0.139173, `rotation3`=0.990268 WHERE `guid`=1751;

-- Correct position of Earthroot in Darkshore (position is off by 1.38802 yards).
UPDATE `gameobject` SET `position_x`=4451.71, `position_y`=424.274, `position_z`=70.5483, `orientation`=1.93731, `rotation0`=0, `rotation1`=0, `rotation2`=0.824125, `rotation3`=0.566408 WHERE `guid`=1817;

-- Correct position of Earthroot in Darkshore (position is off by 0.718316 yards).
UPDATE `gameobject` SET `position_x`=5192.54, `position_y`=151.976, `position_z`=58.6893, `orientation`=4.24115, `rotation0`=0, `rotation1`=0, `rotation2`=-0.85264, `rotation3`=0.522499 WHERE `guid`=1940;

-- Correct position of Earthroot in Westfall (position is off by 0.283507 yards).
UPDATE `gameobject` SET `position_x`=-9692.28, `position_y`=1155.58, `position_z`=18.8213, `orientation`=1.74533, `rotation0`=0, `rotation1`=0, `rotation2`=0.766044, `rotation3`=0.642789 WHERE `guid`=1985;

-- Correct position of Earthroot in Redridge Mountains (position is off by 0.780049 yards).
UPDATE `gameobject` SET `position_x`=-9097.28, `position_y`=-3184.7, `position_z`=109.689, `orientation`=3.9619, `rotation0`=0, `rotation1`=0, `rotation2`=-0.91706, `rotation3`=0.39875 WHERE `guid`=1836;

-- Correct position of Earthroot in Mulgore (position is off by 1.67353 yards).
UPDATE `gameobject` SET `position_x`=-1798.62, `position_y`=-1006.45, `position_z`=79.0837, `orientation`=4.29351, `rotation0`=0, `rotation1`=0, `rotation2`=-0.83867, `rotation3`=0.54464 WHERE `guid`=2027;

-- Correct position of Earthroot in Mulgore (position is off by 0.923864 yards).
UPDATE `gameobject` SET `position_x`=-837.577, `position_y`=-788.3, `position_z`=-0.570349, `orientation`=4.39823, `rotation0`=0, `rotation1`=0, `rotation2`=-0.809016, `rotation3`=0.587786 WHERE `guid`=2042;

-- Correct position of Earthroot in Darkshore (position is off by 1.16147 yards).
UPDATE `gameobject` SET `position_x`=6305.24, `position_y`=145.662, `position_z`=36.1323, `orientation`=1.36136, `rotation0`=0, `rotation1`=0, `rotation2`=0.62932, `rotation3`=0.777146 WHERE `guid`=1937;

-- Correct position of Earthroot in Redridge Mountains (position is off by 0.23965 yards).
UPDATE `gameobject` SET `position_x`=-9473.79, `position_y`=-3441.89, `position_z`=122.867, `orientation`=1.78023, `rotation0`=0, `rotation1`=0, `rotation2`=0.777145, `rotation3`=0.629321 WHERE `guid`=1832;

-- Correct position of Earthroot in Redridge Mountains (position is off by 0.637784 yards).
UPDATE `gameobject` SET `position_x`=-9346.42, `position_y`=-1887.48, `position_z`=72.7737, `orientation`=5.74214, `rotation0`=0, `rotation1`=0, `rotation2`=-0.267238, `rotation3`=0.963631 WHERE `guid`=1831;

-- Missing Earthroot spawns in Dun Morogh.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(15093, 1619, 0, -5733.56, -1774.67, 401.658, 4.97419, 0, 0, -0.608761, 0.793354, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 10851 at 88.600281 yards.
(15095, 1619, 0, -5719.87, -1606.49, 384.292, 4.90438, 0, 0, -0.636078, 0.771625, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 10844 at 75.284462 yards.
(15096, 1619, 0, -5745.33, -1616.57, 363.214, 6.0912, 0, 0, -0.0958452, 0.995396, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 10846 at 64.137840 yards.
(29368, 1619, 0, -5521.32, -1671.8, 399.031, 2.3911, 0, 0, 0.930417, 0.366502, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 29347 at 152.927475 yards.
(15101, 1619, 0, -5656.49, -1614.88, 384.717, 4.08407, 0, 0, -0.891006, 0.453991, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 10844 at 59.388744 yards.
(29369, 1619, 0, -5678.3, -1469.82, 405.582, 2.58308, 0, 0, 0.961261, 0.27564, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 29342 at 58.039974 yards.
(29624, 1619, 0, -5630.62, -1352.33, 400.876, 5.39307, 0, 0, -0.430511, 0.902586, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 29617 at 61.713554 yards.
(15102, 1619, 0, -5531.93, -1579.99, 403.146, 2.96704, 0, 0, 0.996194, 0.087165, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 10839 at 80.052055 yards.
(15189, 1619, 0, -5854.08, -933.5, 409.683, 2.58308, 0, 0, 0.961261, 0.27564, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 10755 at 127.134201 yards.
(15192, 1619, 0, -5731.78, -1090.68, 389.659, 3.21142, 0, 0, -0.999391, 0.0349061, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 10754 at 51.192543 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(15093, 1016, 0, 'Earthroot', 0, 10), -- Earthroots in Dun Morogh 31 objects total
(15095, 1016, 0, 'Earthroot', 0, 10), -- Earthroots in Dun Morogh 31 objects total
(15096, 1016, 0, 'Earthroot', 0, 10), -- Earthroots in Dun Morogh 31 objects total
(29368, 1016, 0, 'Earthroot', 0, 10), -- Earthroots in Dun Morogh 31 objects total
(15101, 1016, 0, 'Earthroot', 0, 10), -- Earthroots in Dun Morogh 31 objects total
(29369, 1016, 0, 'Earthroot', 0, 10), -- Earthroots in Dun Morogh 31 objects total
(29624, 1016, 0, 'Earthroot', 0, 10), -- Earthroots in Dun Morogh 31 objects total
(15102, 1016, 0, 'Earthroot', 0, 10), -- Earthroots in Dun Morogh 31 objects total
(15189, 1016, 0, 'Earthroot', 0, 10), -- Earthroots in Dun Morogh 31 objects total
(15192, 1016, 0, 'Earthroot', 0, 10); -- Earthroots in Dun Morogh 31 objects total

-- Missing Earthroot spawns in Elwynn Forest.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(27174, 1619, 0, -9764.79, -505.546, 38.3915, 0.383971, 0, 0, 0.190808, 0.981627, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 26900 at 259.133118 yards.
(15116, 1619, 0, -9125.45, -647.984, 83.9311, 1.37881, 0, 0, 0.636078, 0.771625, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1753 at 188.231277 yards.
(15201, 1619, 0, -9287.4, 530.653, 87.7495, 5.68977, 0, 0, -0.292372, 0.956305, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 14024 at 89.195030 yards.
(27175, 1619, 0, -8778.77, -729.493, 105.662, 0.383971, 0, 0, 0.190808, 0.981627, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 27038 at 455.803711 yards.
(15211, 1619, 0, -8964.49, -682.498, 87.1403, 3.52557, 0, 0, -0.981627, 0.190812, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1753 at 332.152191 yards.
(15225, 1619, 0, -9011.51, -693.176, 96.236, 0.977383, 0, 0, 0.469471, 0.882948, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1753 at 301.302124 yards.
(15416, 1619, 0, -9679.7, -1220.33, 46.5051, 4.46804, 0, 0, -0.788011, 0.615662, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1842 at 160.601654 yards.
(27176, 1619, 0, -8737.64, -856.766, 105.149, 3.14159, 0, 0, -1, 0, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 27038 at 339.022919 yards.
(27177, 1619, 0, -9044.25, -761.559, 100.335, 1.44862, 0, 0, 0.66262, 0.748956, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 27001 at 304.056519 yards.
(26878, 1619, 0, -9436.08, 556.346, 70.3439, 2.63544, 0, 0, 0.968147, 0.250381, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 26826 at 117.703606 yards.
(27178, 1619, 0, -9889.92, -225.995, 41.3389, 3.35105, 0, 0, -0.994521, 0.104536, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 26900 at 75.969032 yards.
(27179, 1619, 0, -8777.18, -1119.31, 85.4837, 5.77704, 0, 0, -0.25038, 0.968148, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 27038 at 83.941551 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(27174, 1011, 0, 'Earthroot', 0, 10), -- Earthroots in Elwynn Forest 17 objects total
(15116, 1011, 0, 'Earthroot', 0, 10), -- Earthroots in Elwynn Forest 17 objects total
(15201, 1011, 0, 'Earthroot', 0, 10), -- Earthroots in Elwynn Forest 17 objects total
(27175, 1011, 0, 'Earthroot', 0, 10), -- Earthroots in Elwynn Forest 17 objects total
(15211, 1011, 0, 'Earthroot', 0, 10), -- Earthroots in Elwynn Forest 17 objects total
(15225, 1011, 0, 'Earthroot', 0, 10), -- Earthroots in Elwynn Forest 17 objects total
(15416, 1011, 0, 'Earthroot', 0, 10), -- Earthroots in Elwynn Forest 17 objects total
(27176, 1011, 0, 'Earthroot', 0, 10), -- Earthroots in Elwynn Forest 17 objects total
(27177, 1011, 0, 'Earthroot', 0, 10), -- Earthroots in Elwynn Forest 17 objects total
(26878, 1011, 0, 'Earthroot', 0, 10), -- Earthroots in Elwynn Forest 17 objects total
(27178, 1011, 0, 'Earthroot', 0, 10), -- Earthroots in Elwynn Forest 17 objects total
(27179, 1011, 0, 'Earthroot', 0, 10); -- Earthroots in Elwynn Forest 17 objects total

-- Missing Earthroot spawns in Durotar.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(15103, 1619, 1, 944.289, -4952.16, 10.0468, 3.87463, 0, 0, -0.93358, 0.358368, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1996 at 200.857452 yards.
(15104, 1619, 1, -861.296, -4725.5, 28.7156, 2.32129, 0, 0, 0.91706, 0.39875, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12358 at 115.249352 yards.
(15108, 1619, 1, 159.863, -3927.96, 45.6035, 1.43117, 0, 0, 0.656058, 0.75471, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12357 at 135.179611 yards.
(15115, 1619, 1, -734.752, -4977.03, 22.2292, 6.07375, 0, 0, -0.104528, 0.994522, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12359 at 164.928131 yards.
(15190, 1619, 1, 944.376, -4231.94, -6.23417, 1.36136, 0, 0, 0.62932, 0.777146, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12582 at 167.129639 yards.
(15191, 1619, 1, 574.81, -4254.14, 14.1797, 0.610863, 0, 0, 0.300705, 0.953717, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1982 at 182.503525 yards.
(15209, 1619, 1, -460.157, -4712.15, 37.342, 5.67232, 0, 0, -0.300705, 0.953717, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12475 at 203.095123 yards.
(15210, 1619, 1, -114.458, -3897.58, 44.0153, 0.785397, 0, 0, 0.382683, 0.92388, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12357 at 174.782745 yards.
(15226, 1619, 1, 191.52, -4436.94, 33.9087, 1.02974, 0, 0, 0.492423, 0.870356, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12585 at 159.300278 yards.
(15227, 1619, 1, 225.312, -4230.02, 41.828, 4.53786, 0, 0, -0.766044, 0.642789, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1982 at 177.477097 yards.
(15422, 1619, 1, 34.8251, -4923.91, 13.5517, 0, 0, 0, 0, 1, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12474 at 164.740173 yards.
(15430, 1619, 1, 934.805, -3918.83, 19.6192, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 1874 at 121.143257 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(15103, 1021, 0, 'Earthroot', 0, 10), -- Earthroots in Durotar 33 objects total
(15104, 1021, 0, 'Earthroot', 0, 10), -- Earthroots in Durotar 33 objects total
(15108, 1021, 0, 'Earthroot', 0, 10), -- Earthroots in Durotar 33 objects total
(15115, 1021, 0, 'Earthroot', 0, 10), -- Earthroots in Durotar 33 objects total
(15190, 1021, 0, 'Earthroot', 0, 10), -- Earthroots in Durotar 33 objects total
(15191, 1021, 0, 'Earthroot', 0, 10), -- Earthroots in Durotar 33 objects total
(15209, 1021, 0, 'Earthroot', 0, 10), -- Earthroots in Durotar 33 objects total
(15210, 1021, 0, 'Earthroot', 0, 10), -- Earthroots in Durotar 33 objects total
(15226, 1021, 0, 'Earthroot', 0, 10), -- Earthroots in Durotar 33 objects total
(15227, 1021, 0, 'Earthroot', 0, 10), -- Earthroots in Durotar 33 objects total
(15422, 1021, 0, 'Earthroot', 0, 10), -- Earthroots in Durotar 33 objects total
(15430, 1021, 0, 'Earthroot', 0, 10); -- Earthroots in Durotar 33 objects total

-- Missing Earthroot spawns in Loch Modan.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(15097, 1619, 0, -5469.14, -2707.13, 373.47, 5.41052, 0, 0, -0.422618, 0.906308, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12842 at 91.748886 yards.
(30215, 1619, 0, -5995.92, -2776.57, 410.39, 2.51327, 0, 0, 0.951056, 0.309017, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 30097 at 235.751434 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(15097, 1160, 0, 'Earthroot', 0, 10), -- Earthroots in Loch Modan 9 objects total
(30215, 1160, 0, 'Earthroot', 0, 10); -- Earthroots in Loch Modan 9 objects total

-- Missing Earthroot spawns in Westfall.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(31039, 1619, 0, -10666.7, 1987.77, 34.5242, 3.57793, 0, 0, -0.976295, 0.216442, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 31037 at 173.486343 yards.
(15228, 1619, 0, -10529.2, 2043.47, 36.7139, 5.48033, 0, 0, -0.390731, 0.920505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1763 at 111.081100 yards.
(15415, 1619, 0, -9699.69, 1070.95, 24.5274, 3.54302, 0, 0, -0.979924, 0.19937, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1985 at 85.167213 yards.
(31040, 1619, 0, -11292.6, 1869.2, 37.1779, 5.93412, 0, 0, -0.173648, 0.984808, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 31037 at 499.834198 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(31039, 1105, 0, 'Earthroot', 0, 10), -- Earthroots in Westfall 25 objects total
(15228, 1105, 0, 'Earthroot', 0, 10), -- Earthroots in Westfall 25 objects total
(15415, 1105, 0, 'Earthroot', 0, 10), -- Earthroots in Westfall 25 objects total
(31040, 1105, 0, 'Earthroot', 0, 10); -- Earthroots in Westfall 25 objects total

-- Missing Earthroot spawns in Redridge Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(15129, 1619, 0, -8993.99, -2544.28, 142.519, 4.45059, 0, 0, -0.793353, 0.608762, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1971 at 144.198090 yards.
(20505, 1619, 0, -8746.71, -2382.45, 158.531, 4.71239, 0, 0, -0.707107, 0.707107, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20502 at 63.214275 yards.
(15417, 1619, 0, -9339.2, -3063.91, 136.63, 1.97222, 0, 0, 0.833885, 0.551938, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2058 at 7.408942 yards.
(18919, 1619, 0, -9736.36, -3215.23, 58.7968, 3.59538, 0, 0, -0.97437, 0.224951, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 18918 at 196.210480 yards.
(15418, 1619, 0, -9311.69, -3428.08, 104.76, 1.46608, 0, 0, 0.66913, 0.743145, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1832 at 163.904724 yards.
(15419, 1619, 0, -9125.74, -3186.11, 113.986, 2.3911, 0, 0, 0.930417, 0.366502, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1836 at 28.089806 yards.
(15461, 1619, 0, -9803.82, -2286.89, 63.6404, 0.890117, 0, 0, 0.430511, 0.902586, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1970 at 181.814804 yards.
(20352, 1619, 0, -9643.69, -2959.21, 59.7454, 2.26893, 0, 0, 0.906307, 0.422619, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20315 at 108.440239 yards.
(20353, 1619, 0, -9784.99, -2981.42, 94.4874, 4.4855, 0, 0, -0.782608, 0.622515, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20315 at 113.707771 yards.
(31314, 1619, 0, -8784.66, -2475.44, 136.705, 6.17847, 0, 0, -0.0523357, 0.99863, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 31310 at 141.904358 yards.
(31146, 1619, 0, -8878.36, -2197.7, 143.024, 3.4383, 0, 0, -0.989016, 0.147811, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 31126 at 189.214035 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(15129, 1124, 0, 'Earthroot', 0, 10), -- Earthroots in Redridge 24 objects total
(20505, 1124, 0, 'Earthroot', 0, 10), -- Earthroots in Redridge 24 objects total
(15417, 1124, 0, 'Earthroot', 0, 10), -- Earthroots in Redridge 24 objects total
(18919, 1124, 0, 'Earthroot', 0, 10), -- Earthroots in Redridge 24 objects total
(15418, 1124, 0, 'Earthroot', 0, 10), -- Earthroots in Redridge 24 objects total
(15419, 1124, 0, 'Earthroot', 0, 10), -- Earthroots in Redridge 24 objects total
(15461, 1124, 0, 'Earthroot', 0, 10), -- Earthroots in Redridge 24 objects total
(20352, 1124, 0, 'Earthroot', 0, 10), -- Earthroots in Redridge 24 objects total
(20353, 1124, 0, 'Earthroot', 0, 10), -- Earthroots in Redridge 24 objects total
(31314, 1124, 0, 'Earthroot', 0, 10), -- Earthroots in Redridge 24 objects total
(31146, 1124, 0, 'Earthroot', 0, 10); -- Earthroots in Redridge 24 objects total

-- Missing Earthroot spawns in Tirisfal Glades.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(45843, 1619, 0, 2585.16, 1369.27, 7.36252, 3.90954, 0, 0, -0.927183, 0.374608, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45159 at 77.623360 yards.
(45846, 1619, 0, 2444.71, 1443.39, 36.0942, 0.977383, 0, 0, 0.469471, 0.882948, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45159 at 232.281204 yards.
(15114, 1619, 0, 1572.23, -683.486, 54.7838, 2.9496, 0, 0, 0.995396, 0.0958512, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1766 at 197.334137 yards.
(15188, 1619, 0, 2667.74, -578.889, 106.293, 5.34071, 0, 0, -0.45399, 0.891007, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 2053 at 91.568214 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(45843, 1005, 0, 'Earthroot', 0, 10), -- Earthroots in Tirisfal 32 objects total
(45846, 1005, 0, 'Earthroot', 0, 10), -- Earthroots in Tirisfal 32 objects total
(15114, 1005, 0, 'Earthroot', 0, 10), -- Earthroots in Tirisfal 32 objects total
(15188, 1005, 0, 'Earthroot', 0, 10); -- Earthroots in Tirisfal 32 objects total

-- Missing Earthroot spawns in Silverpine Forest.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(15107, 1619, 0, -25.7078, 836.054, 78.0244, 4.71239, 0, 0, -0.707107, 0.707107, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1749 at 133.776260 yards.
(35625, 1619, 0, 67.4183, 640.243, 78.5119, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 35459 at 146.137604 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(15107, 1040, 0, 'Earthroot', 0, 10), -- Earthroots in Silverpine Forest 13 objects total
(35625, 1040, 0, 'Earthroot', 0, 10); -- Earthroots in Silverpine Forest 13 objects total

-- Missing Earthroot spawns in Teldrassil.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(15193, 1619, 1, 10000.7, 1646.47, 1334.52, 3.45576, 0, 0, -0.987688, 0.156436, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 11205 at 110.509392 yards.
(49673, 1619, 1, 9675.78, 1158.03, 1279.33, 4.7822, 0, 0, -0.681998, 0.731354, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49668 at 133.163910 yards.
(15195, 1619, 1, 10479.9, 2025.14, 1343.85, 3.38594, 0, 0, -0.992546, 0.12187, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 10983 at 104.169647 yards.
(49681, 1619, 1, 10245.8, 1532.83, 1332.78, 3.21142, 0, 0, -0.999391, 0.0349061, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49676 at 69.743744 yards.
(15196, 1619, 1, 9355.75, 1552.31, 1281.67, 2.49582, 0, 0, 0.948323, 0.317306, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 11159 at 81.846008 yards.
(15197, 1619, 1, 9300.17, 1681.18, 1320.12, 0.872664, 0, 0, 0.422618, 0.906308, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 11159 at 155.130112 yards.
(15198, 1619, 1, 9388.27, 710.325, 1295.32, 4.5204, 0, 0, -0.771625, 0.636078, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 11628 at 136.481796 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(15193, 1001, 0, 'Earthroot', 0, 10), -- Earthroots in Teldrassil 26 objects total
(49673, 1001, 0, 'Earthroot', 0, 10), -- Earthroots in Teldrassil 26 objects total
(15195, 1001, 0, 'Earthroot', 0, 10), -- Earthroots in Teldrassil 26 objects total
(49681, 1001, 0, 'Earthroot', 0, 10), -- Earthroots in Teldrassil 26 objects total
(15196, 1001, 0, 'Earthroot', 0, 10), -- Earthroots in Teldrassil 26 objects total
(15197, 1001, 0, 'Earthroot', 0, 10), -- Earthroots in Teldrassil 26 objects total
(15198, 1001, 0, 'Earthroot', 0, 10); -- Earthroots in Teldrassil 26 objects total

-- Missing Earthroot spawns in Darkshore.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(48934, 1619, 1, 6977.43, -652.401, 69.4153, 3.29869, 0, 0, -0.996917, 0.0784664, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 48747 at 352.286682 yards.
(15208, 1619, 1, 5189.79, 343.254, 41.3473, 1.79769, 0, 0, 0.782608, 0.622515, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1754 at 20.367342 yards.
(15460, 1619, 1, 7689.64, -988.655, 38.2943, 0.558504, 0, 0, 0.275637, 0.961262, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 1924 at 300.935333 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(48934, 1094, 0, 'Earthroot', 0, 10), -- Earthroots in Darkshore 20 objects total
(15208, 1094, 0, 'Earthroot', 0, 10), -- Earthroots in Darkshore 20 objects total
(15460, 1094, 0, 'Earthroot', 0, 10); -- Earthroots in Darkshore 20 objects total

-- Missing Earthroot spawns in Mulgore.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(18669, 1619, 1, -2490.61, -1493.57, 61.8547, 3.78737, 0, 0, -0.948323, 0.317306, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 18571 at 150.003235 yards.
(18670, 1619, 1, -946.452, -1151.27, 93.0153, 2.61799, 0, 0, 0.965925, 0.258821, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 18596 at 110.247742 yards.
(18671, 1619, 1, -960.953, -1117.19, 60.7869, 5.53269, 0, 0, -0.366501, 0.930418, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 18596 at 65.205551 yards.
(15092, 1619, 1, -1759.17, -910.335, 79.1745, 2.04204, 0, 0, 0.85264, 0.522499, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1835 at 5.977466 yards.
(15131, 1619, 1, -2037.5, 298.458, 126.762, 2.3911, 0, 0, 0.930417, 0.366502, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1867 at 117.432587 yards.
(18672, 1619, 1, -1281.1, -1042.77, 48.7105, 2.14675, 0, 0, 0.878817, 0.47716, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 18603 at 156.562637 yards.
(15459, 1619, 1, -1664.08, 368.102, 111.681, 4.88692, 0, 0, -0.642787, 0.766045, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1951 at 206.932434 yards.
(15463, 1619, 1, -2735.74, -321.652, 13.0835, 1.27409, 0, 0, 0.594822, 0.803857, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 1954 at 300.506104 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(18669, 1025, 0, 'Earthroot', 0, 10), -- Earthroots in Mulgore 31 objects total
(18670, 1025, 0, 'Earthroot', 0, 10), -- Earthroots in Mulgore 31 objects total
(18671, 1025, 0, 'Earthroot', 0, 10), -- Earthroots in Mulgore 31 objects total
(15092, 1025, 0, 'Earthroot', 0, 10), -- Earthroots in Mulgore 31 objects total
(15131, 1025, 0, 'Earthroot', 0, 10), -- Earthroots in Mulgore 31 objects total
(18672, 1025, 0, 'Earthroot', 0, 10), -- Earthroots in Mulgore 31 objects total
(15459, 1025, 0, 'Earthroot', 0, 10), -- Earthroots in Mulgore 31 objects total
(15463, 1025, 0, 'Earthroot', 0, 10); -- Earthroots in Mulgore 31 objects total

-- Correct position of Earthroot in The Barrens (position is off by 0.747622 yards).
UPDATE `gameobject` SET `position_x`=-1546.28, `position_y`=-3958.2, `position_z`=20.1385, `orientation`=0.645772, `rotation0`=0, `rotation1`=0, `rotation2`=0.317305, `rotation3`=0.948324 WHERE `guid`=1798;

-- Missing Earthroot spawns in The Barrens.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(15464, 3726, 1, -3948.84, -2014.57, 99.8912, 0.471238, 0, 0, 0.233445, 0.97237, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 1798 at 3090.649170 yards.
(56076, 3726, 1, -327.506, -1385.88, 112.398, 0.942477, 0, 0, 0.45399, 0.891007, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55892 at 2522.083984 yards.
(56077, 3726, 1, -153.105, -1482.47, 107.757, 3.927, 0, 0, -0.923879, 0.382686, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55892 at 2458.248047 yards.
(56078, 3726, 1, -44.65, -1347.71, 103.885, 5.21854, 0, 0, -0.507538, 0.861629, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55892 at 2614.295898 yards.
(56079, 3726, 1, 384.268, -3543.53, 46.8668, 0.855211, 0, 0, 0.414693, 0.909961, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55892 at 1122.324097 yards.
(56080, 3726, 1, -226.043, -1245.33, 93.0938, 0.122173, 0, 0, 0.0610485, 0.998135, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55892 at 2676.343750 yards.
(56081, 3726, 1, -554.613, -3789.55, 43.7731, 0.383971, 0, 0, 0.190808, 0.981627, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55892 at 160.291214 yards.
(15465, 3726, 1, -2173.47, -1688.16, 122.478, 5.42797, 0, 0, -0.414693, 0.909961, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 1798 at 2356.927246 yards.
(56082, 3726, 1, -284.883, -3613.54, 52.1593, 5.13127, 0, 0, -0.544639, 0.838671, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55892 at 482.416138 yards.
(56083, 3726, 1, 826.997, -3665.93, 37.5249, 4.43314, 0, 0, -0.798635, 0.601815, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55892 at 1528.255005 yards.
(56084, 3726, 1, 962.542, -3658.51, 52.2945, 4.76475, 0, 0, -0.688354, 0.725374, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55892 at 1663.563843 yards.
(56085, 3726, 1, 141.038, -2473.28, 140.871, 3.76991, 0, 0, -0.951056, 0.309017, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55892 at 1636.005005 yards.
(56086, 3726, 1, -450.492, -3692.4, 48.0801, 5.02655, 0, 0, -0.587785, 0.809017, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55892 at 302.003845 yards.
(56087, 3726, 1, -463.693, -1340.92, 110.516, 4.97419, 0, 0, -0.608761, 0.793354, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55892 at 2551.070801 yards.
(56088, 3726, 1, -396.659, -1586.49, 103.695, 0.244346, 0, 0, 0.121869, 0.992546, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55892 at 2313.863281 yards.
(15466, 3726, 1, -2475.08, -1594.51, 111.186, 3.52557, 0, 0, -0.981627, 0.190812, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 1798 at 2540.807373 yards.
(15467, 3726, 1, -1367.89, -3949.43, 42.8773, 2.07694, 0, 0, 0.861629, 0.507539, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 1798 at 180.747818 yards.
(15468, 3726, 1, -4152.02, -2279.53, 95.8744, 5.02655, 0, 0, -0.587785, 0.809017, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 1798 at 3099.858643 yards.
(15469, 3726, 1, -1815.75, -1971.06, 104.918, 4.59022, 0, 0, -0.748956, 0.66262, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 1798 at 2006.823364 yards.
(15471, 3726, 1, -1721.55, -3900.48, 16.4119, 0.104719, 0, 0, 0.0523357, 0.99863, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 1798 at 183.821503 yards.
(56089, 3726, 1, 538.108, -3613.34, 59.7735, 2.37364, 0, 0, 0.927183, 0.374608, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55892 at 1253.231079 yards.
(15472, 3726, 1, -1351.95, -3756.06, 58.8003, 3.52557, 0, 0, -0.981627, 0.190812, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 1798 at 283.402740 yards.
(15473, 3726, 1, -1568.26, -3783.89, 43.2512, 2.02458, 0, 0, 0.848047, 0.529921, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 1798 at 176.916321 yards.
(56090, 3726, 1, 659.889, -3663.35, 42.7321, 0.349065, 0, 0, 0.173648, 0.984808, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55892 at 1363.424683 yards.
(56091, 3726, 1, 398.654, -2009.49, 121.304, 6.12611, 0, 0, -0.0784588, 0.996917, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55892 at 2164.875488 yards.
(56092, 3726, 1, 416.685, -1331.55, 105.313, 1.15192, 0, 0, 0.544639, 0.838671, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55892 at 2778.749756 yards.
(56093, 3726, 1, 451.32, -1225.72, 120.871, 2.28638, 0, 0, 0.909961, 0.414694, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55892 at 2890.008545 yards.
(56094, 3726, 1, 307.877, -1675.3, 109.163, 3.83973, 0, 0, -0.939692, 0.34202, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55892 at 2420.539307 yards.
(56095, 3726, 1, 58.7128, -2242.22, 114.009, 2.70526, 0, 0, 0.976295, 0.216442, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55892 at 1801.829468 yards.
(56096, 3726, 1, -386.79, -1516.62, 106.923, 2.21657, 0, 0, 0.894934, 0.446199, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55892 at 2384.480469 yards.
(56097, 3726, 1, -183.78, -3576.83, 47.203, 0.541051, 0, 0, 0.267238, 0.963631, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55892 at 587.353027 yards.
(56098, 3726, 1, -1253.92, -1713.56, 115.503, 5.09636, 0, 0, -0.559193, 0.829038, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55892 at 2242.169922 yards.
(16829, 3726, 1, -3670.86, -1756.42, 92.5359, 0.820303, 0, 0, 0.398748, 0.91706, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 1798 at 3059.897949 yards.
(16830, 3726, 1, -1753.09, -3690.84, 34.6685, 1.32645, 0, 0, 0.615661, 0.788011, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 1798 at 337.724609 yards.
(56099, 3726, 1, 40.5391, -1749.56, 111.579, 3.87463, 0, 0, -0.93358, 0.358368, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55892 at 2253.283691 yards.
(16831, 3726, 1, -2552.32, -1730.75, 109.963, 2.74016, 0, 0, 0.979924, 0.19937, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 1798 at 2445.276123 yards.
(56120, 3726, 1, 441.502, -2441.14, 141.281, 4.46804, 0, 0, -0.788011, 0.615662, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55892 at 1831.776245 yards.
(56121, 3726, 1, -1159.54, -1705.57, 92.367, 5.28835, 0, 0, -0.477159, 0.878817, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55892 at 2227.296631 yards.
(56122, 3726, 1, 308.67, -3438.26, 56.0001, 6.03884, 0, 0, -0.121869, 0.992546, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55892 at 1088.988037 yards.
(56123, 3726, 1, 207.534, -1912.12, 101.752, 4.17134, 0, 0, -0.870356, 0.492424, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55892 at 2163.304443 yards.
(56124, 3726, 1, -610.527, -1526.39, 108.306, 0.244346, 0, 0, 0.121869, 0.992546, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55892 at 2357.114990 yards.
(56125, 3726, 1, 652.265, -1394.01, 107.489, 4.01426, 0, 0, -0.906307, 0.422619, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55892 at 2825.269775 yards.
(56126, 3726, 1, 775.852, -1414.33, 120.828, 4.57276, 0, 0, -0.754709, 0.656059, 900, 900, 1, 100, 0, 10); -- Closest existing guid is 55892 at 2868.705322 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(15464, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(56076, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(56077, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(56078, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(56079, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(56080, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(56081, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(15465, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(56082, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(56083, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(56084, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(56085, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(56086, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(56087, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(56088, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(15466, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(15467, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(15468, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(15469, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(15471, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(56089, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(15472, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(15473, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(56090, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(56091, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(56092, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(56093, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(56094, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(56095, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(56096, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(56097, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(56098, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(16829, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(16830, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(56099, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(16831, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(56120, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(56121, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(56122, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(56123, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(56124, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(56125, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(56126, 1029, 0, 'Earthroot', 0, 10); -- Earthroots in Barrens 127 objects total
-- Correct position of Fadeleaf in Arathi Highlands (position is off by 1.10262 yards).
UPDATE `gameobject` SET `position_x`=-962.771, `position_y`=-3266.38, `position_z`=66.1804, `orientation`=5.70723, `rotation0`=0, `rotation1`=0, `rotation2`=-0.284015, `rotation3`=0.95882 WHERE `guid`=7587;

-- Correct position of Fadeleaf in Stranglethorn Vale (position is off by 1.05614 yards).
UPDATE `gameobject` SET `position_x`=-11713.7, `position_y`=-432.975, `position_z`=19.4633, `orientation`=0.383971, `rotation0`=0, `rotation1`=0, `rotation2`=0.190808, `rotation3`=0.981627 WHERE `guid`=7599;

-- Correct position of Fadeleaf in Swamp of Sorrows (position is off by 0.190587 yards).
UPDATE `gameobject` SET `position_x`=-10518.9, `position_y`=-2573.61, `position_z`=21.8643, `orientation`=5.41052, `rotation0`=0, `rotation1`=0, `rotation2`=-0.422618, `rotation3`=0.906308 WHERE `guid`=7802;

-- Correct position of Fadeleaf in Arathi Highlands (position is off by 0.550355 yards).
UPDATE `gameobject` SET `position_x`=-1133.5, `position_y`=-1909.23, `position_z`=78.3627, `orientation`=1.69297, `rotation0`=0, `rotation1`=0, `rotation2`=0.748956, `rotation3`=0.66262 WHERE `guid`=7648;

-- Correct position of Fadeleaf in Arathi Highlands (position is off by 2.87648 yards).
UPDATE `gameobject` SET `position_x`=-1735.1, `position_y`=-2164.65, `position_z`=47.8397, `orientation`=2.3911, `rotation0`=0, `rotation1`=0, `rotation2`=0.930417, `rotation3`=0.366502 WHERE `guid`=7612;

-- Correct position of Fadeleaf in Badlands (position is off by 0.921125 yards).
UPDATE `gameobject` SET `position_x`=-6618.82, `position_y`=-3690.58, `position_z`=265.84, `orientation`=1.50098, `rotation0`=0, `rotation1`=0, `rotation2`=0.681998, `rotation3`=0.731354 WHERE `guid`=7711;

-- Correct position of Fadeleaf in Badlands (position is off by 1.78344 yards).
UPDATE `gameobject` SET `position_x`=-6881.77, `position_y`=-3426.21, `position_z`=243.933, `orientation`=1.79769, `rotation0`=0, `rotation1`=0, `rotation2`=0.782608, `rotation3`=0.622515 WHERE `guid`=7626;

-- Correct position of Fadeleaf in Badlands (position is off by 1.29097 yards).
UPDATE `gameobject` SET `position_x`=-6528.05, `position_y`=-2963.68, `position_z`=268.539, `orientation`=4.88692, `rotation0`=0, `rotation1`=0, `rotation2`=-0.642787, `rotation3`=0.766045 WHERE `guid`=7638;

-- Correct position of Fadeleaf in Swamp of Sorrows (position is off by 2.87195 yards).
UPDATE `gameobject` SET `position_x`=-10519.8, `position_y`=-2715.92, `position_z`=27.669, `orientation`=5.75959, `rotation0`=0, `rotation1`=0, `rotation2`=-0.258819, `rotation3`=0.965926 WHERE `guid`=7816;

-- Correct position of Fadeleaf in Stranglethorn Vale (position is off by 0.566124 yards).
UPDATE `gameobject` SET `position_x`=-12210.5, `position_y`=258.976, `position_z`=2.65565, `orientation`=5.2709, `rotation0`=0, `rotation1`=0, `rotation2`=-0.484809, `rotation3`=0.87462 WHERE `guid`=7729;

-- Correct position of Fadeleaf in Dustwallow Marsh (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-3857.14, `position_y`=-3771.82, `position_z`=40.9882, `orientation`=4.43314, `rotation0`=0, `rotation1`=0, `rotation2`=-0.798635, `rotation3`=0.601815 WHERE `guid`=56012;

-- Correct position of Fadeleaf in Badlands (position is off by 1.37533 yards).
UPDATE `gameobject` SET `position_x`=-6980.8, `position_y`=-3664.64, `position_z`=244.664, `orientation`=1.8675, `rotation0`=0, `rotation1`=0, `rotation2`=0.803857, `rotation3`=0.594823 WHERE `guid`=7666;

-- Correct position of Fadeleaf in Swamp of Sorrows (position is off by 1.09724 yards).
UPDATE `gameobject` SET `position_x`=-10360.5, `position_y`=-3081.84, `position_z`=22.9691, `orientation`=2.9845, `rotation0`=0, `rotation1`=0, `rotation2`=0.996917, `rotation3`=0.0784664 WHERE `guid`=7586;

-- Correct position of Fadeleaf in Badlands (position is off by 0.198024 yards).
UPDATE `gameobject` SET `position_x`=-6731.13, `position_y`=-2966.87, `position_z`=242.798, `orientation`=3.99681, `rotation0`=0, `rotation1`=0, `rotation2`=-0.909961, `rotation3`=0.414694 WHERE `guid`=7553;

-- Correct position of Fadeleaf in Arathi Highlands (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-1044.91, `position_y`=-3256.63, `position_z`=39.844, `orientation`=3.10665, `rotation0`=0, `rotation1`=0, `rotation2`=0.999847, `rotation3`=0.0174693 WHERE `guid`=7793;

-- Correct position of Fadeleaf in Badlands (position is off by 1.77033 yards).
UPDATE `gameobject` SET `position_x`=-7059.57, `position_y`=-3684.33, `position_z`=244.418, `orientation`=1.41372, `rotation0`=0, `rotation1`=0, `rotation2`=0.649447, `rotation3`=0.760406 WHERE `guid`=7565;

-- Correct position of Fadeleaf in Stranglethorn Vale (position is off by 0.856531 yards).
UPDATE `gameobject` SET `position_x`=-11847.3, `position_y`=-219.508, `position_z`=16.5659, `orientation`=0.645772, `rotation0`=0, `rotation1`=0, `rotation2`=0.317305, `rotation3`=0.948324 WHERE `guid`=7784;

-- Correct position of Fadeleaf in Badlands (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-6722.4, `position_y`=-3084.46, `position_z`=282.649, `orientation`=1.3439, `rotation0`=0, `rotation1`=0, `rotation2`=0.622514, `rotation3`=0.782609 WHERE `guid`=7745;

-- Correct position of Fadeleaf in Arathi Highlands (position is off by 0.595912 yards).
UPDATE `gameobject` SET `position_x`=-1288.56, `position_y`=-2720.4, `position_z`=49.7565, `orientation`=0.226892, `rotation0`=0, `rotation1`=0, `rotation2`=0.113203, `rotation3`=0.993572 WHERE `guid`=7669;

-- Correct position of Fadeleaf in Swamp of Sorrows (position is off by 1.04005 yards).
UPDATE `gameobject` SET `position_x`=-10575.1, `position_y`=-2717.64, `position_z`=26.3707, `orientation`=0.59341, `rotation0`=0, `rotation1`=0, `rotation2`=0.292371, `rotation3`=0.956305 WHERE `guid`=7643;

-- Correct position of Fadeleaf in Stranglethorn Vale (position is off by 1.17982 yards).
UPDATE `gameobject` SET `position_x`=-11734.6, `position_y`=533.32, `position_z`=52.3443, `orientation`=0.733038, `rotation0`=0, `rotation1`=0, `rotation2`=0.358368, `rotation3`=0.93358 WHERE `guid`=7807;

-- Correct position of Fadeleaf in Stranglethorn Vale (position is off by 1.07105 yards).
UPDATE `gameobject` SET `position_x`=-12041.2, `position_y`=-728.706, `position_z`=12.7299, `orientation`=1.5708, `rotation0`=0, `rotation1`=0, `rotation2`=0.707107, `rotation3`=0.707107 WHERE `guid`=7695;

-- Correct position of Fadeleaf in Swamp of Sorrows (position is off by 1.92333 yards).
UPDATE `gameobject` SET `position_x`=-10090.8, `position_y`=-2489.23, `position_z`=28.7696, `orientation`=2.16421, `rotation0`=0, `rotation1`=0, `rotation2`=0.882947, `rotation3`=0.469473 WHERE `guid`=7673;

-- Correct position of Fadeleaf in Swamp of Sorrows (position is off by 0.731097 yards).
UPDATE `gameobject` SET `position_x`=-10226.4, `position_y`=-2623.05, `position_z`=27.6343, `orientation`=2.84488, `rotation0`=0, `rotation1`=0, `rotation2`=0.989016, `rotation3`=0.147811 WHERE `guid`=7803;

-- Correct position of Fadeleaf in Swamp of Sorrows (position is off by 0.453782 yards).
UPDATE `gameobject` SET `position_x`=-10258.4, `position_y`=-3230.2, `position_z`=23.499, `orientation`=1.0472, `rotation0`=0, `rotation1`=0, `rotation2`=0.5, `rotation3`=0.866025 WHERE `guid`=7754;

-- Correct position of Fadeleaf in Badlands (position is off by 2.07676 yards).
UPDATE `gameobject` SET `position_x`=-6683.26, `position_y`=-3350.68, `position_z`=242.174, `orientation`=5.49779, `rotation0`=0, `rotation1`=0, `rotation2`=-0.382683, `rotation3`=0.92388 WHERE `guid`=7821;

-- Correct position of Fadeleaf in Swamp of Sorrows (position is off by 0.14408 yards).
UPDATE `gameobject` SET `position_x`=-10388.1, `position_y`=-2976.57, `position_z`=22.862, `orientation`=1.81514, `rotation0`=0, `rotation1`=0, `rotation2`=0.788011, `rotation3`=0.615662 WHERE `guid`=7735;

-- Correct position of Fadeleaf in Swamp of Sorrows (position is off by 1.14637 yards).
UPDATE `gameobject` SET `position_x`=-10195.3, `position_y`=-3118.81, `position_z`=21.7411, `orientation`=0.104719, `rotation0`=0, `rotation1`=0, `rotation2`=0.0523357, `rotation3`=0.99863 WHERE `guid`=7737;

-- Correct position of Fadeleaf in Stranglethorn Vale (position is off by 0.243724 yards).
UPDATE `gameobject` SET `position_x`=-12153.8, `position_y`=-133.861, `position_z`=25.7315, `orientation`=2.40855, `rotation0`=0, `rotation1`=0, `rotation2`=0.93358, `rotation3`=0.358368 WHERE `guid`=7713;

-- Correct position of Fadeleaf in Stranglethorn Vale (position is off by 3.61731 yards).
UPDATE `gameobject` SET `position_x`=-12274.3, `position_y`=19.2027, `position_z`=21.7572, `orientation`=4.46804, `rotation0`=0, `rotation1`=0, `rotation2`=-0.788011, `rotation3`=0.615662 WHERE `guid`=40016;

-- Correct position of Fadeleaf in Stranglethorn Vale (position is off by 3.39585 yards).
UPDATE `gameobject` SET `position_x`=-11991.6, `position_y`=-73.0549, `position_z`=14.1161, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=7743;

-- Missing Fadeleaf spawns in Dustwallow Marsh.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(16838, 2042, 1, -2481.14, -3219.62, 35.9511, 2.84488, 0, 0, 0.989016, 0.147811, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12894 at 113.932671 yards.
(16839, 2042, 1, -2591.81, -3483.11, 33.8229, 4.55531, 0, 0, -0.760406, 0.649449, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6824 at 304.802094 yards.
(16840, 2042, 1, -2987.04, -3287.98, 37.2054, 0.750491, 0, 0, 0.366501, 0.930418, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6824 at 305.790680 yards.
(40744, 2042, 1, -3835.82, -2891.23, 36.5356, 3.80482, 0, 0, -0.945518, 0.325568, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 40740 at 311.704895 yards.
(56127, 2042, 1, -3987.46, -3743.76, 39.7388, 1.06465, 0, 0, 0.507538, 0.861629, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 56012 at 133.302811 yards.
(16843, 2042, 1, -2870.47, -3264.87, 39.1876, 4.88692, 0, 0, -0.642787, 0.766045, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6824 at 188.163849 yards.
(16847, 2042, 1, -2754.31, -4006.38, 34.812, 3.4034, 0, 0, -0.991445, 0.130528, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 14927 at 215.738571 yards.
(16849, 2042, 1, -3109.08, -3700.12, 39.3471, 3.56047, 0, 0, -0.978148, 0.207912, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 14927 at 407.000031 yards.
(16850, 2042, 1, -4382.1, -3647.11, 37.934, 1.46608, 0, 0, 0.66913, 0.743145, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 12899 at 210.117691 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(16838, 1328, 0, 'Fadeleaf', 0, 10), -- Fadeleaf in Dustwallow Marsh 7 objects total
(16839, 1328, 0, 'Fadeleaf', 0, 10), -- Fadeleaf in Dustwallow Marsh 7 objects total
(16840, 1328, 0, 'Fadeleaf', 0, 10), -- Fadeleaf in Dustwallow Marsh 7 objects total
(40744, 1328, 0, 'Fadeleaf', 0, 10), -- Fadeleaf in Dustwallow Marsh 7 objects total
(56127, 1328, 0, 'Fadeleaf', 0, 10), -- Fadeleaf in Dustwallow Marsh 7 objects total
(16843, 1328, 0, 'Fadeleaf', 0, 10), -- Fadeleaf in Dustwallow Marsh 7 objects total
(16847, 1328, 0, 'Fadeleaf', 0, 10), -- Fadeleaf in Dustwallow Marsh 7 objects total
(16849, 1328, 0, 'Fadeleaf', 0, 10), -- Fadeleaf in Dustwallow Marsh 7 objects total
(16850, 1328, 0, 'Fadeleaf', 0, 10); -- Fadeleaf in Dustwallow Marsh 7 objects total

-- Missing Fadeleaf spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(16833, 2042, 0, -11924.6, -177.015, 17.2601, 2.96704, 0, 0, 0.996194, 0.087165, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7784 at 87.838737 yards.
(40026, 2042, 0, -12317.7, -116.954, 21.0686, 1.29154, 0, 0, 0.601814, 0.798636, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 40016 at 145.729523 yards.
(16852, 2042, 0, -11555.8, -652.515, 31.7594, 5.65487, 0, 0, -0.309016, 0.951057, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7726 at 235.916824 yards.
(16853, 2042, 0, -11669.9, 776.653, 50.7218, 0.95993, 0, 0, 0.461748, 0.887011, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 7807 at 252.818085 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(16833, 1172, 0, 'Fadeleaf', 0, 10), -- Fadeleaf in Stranglethorn 34 objects total
(40026, 1172, 0, 'Fadeleaf', 0, 10), -- Fadeleaf in Stranglethorn 34 objects total
(16852, 1172, 0, 'Fadeleaf', 0, 10), -- Fadeleaf in Stranglethorn 34 objects total
(16853, 1172, 0, 'Fadeleaf', 0, 10); -- Fadeleaf in Stranglethorn 34 objects total

-- Missing Fadeleaf spawns in Alterac Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(16832, 2042, 0, 295.734, -670.961, 134.586, 6.21337, 0, 0, -0.0348988, 0.999391, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7646 at 7.135618 yards.
(16834, 2042, 0, 411.041, 121.515, 42.3566, 4.99164, 0, 0, -0.601814, 0.798636, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7665 at 14.801752 yards.
(16835, 2042, 0, 6.72537, -35.8818, 95.798, 3.50812, 0, 0, -0.983254, 0.182238, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7697 at 164.439178 yards.
(16836, 2042, 0, 171.56, -30.6048, 71.7803, 2.58308, 0, 0, 0.961261, 0.27564, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7697 at 6.650249 yards.
(16837, 2042, 0, 11.9988, 179.588, 45.3398, 3.38594, 0, 0, -0.992546, 0.12187, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6817 at 199.724442 yards.
(33293, 2042, 0, 692.225, -1384.84, 99.6657, 1.09956, 0, 0, 0.522498, 0.85264, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 33201 at 176.238937 yards.
(16842, 2042, 0, 1106.82, -353.518, 43.0181, 4.32842, 0, 0, -0.829037, 0.559194, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 7774 at 7.605820 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(16832, 1071, 0, 'Fadeleaf', 0, 10), -- Fadeleafs in Alterac 33 objects total
(16834, 1071, 0, 'Fadeleaf', 0, 10), -- Fadeleafs in Alterac 33 objects total
(16835, 1071, 0, 'Fadeleaf', 0, 10), -- Fadeleafs in Alterac 33 objects total
(16836, 1071, 0, 'Fadeleaf', 0, 10), -- Fadeleafs in Alterac 33 objects total
(16837, 1071, 0, 'Fadeleaf', 0, 10), -- Fadeleafs in Alterac 33 objects total
(33293, 1071, 0, 'Fadeleaf', 0, 10), -- Fadeleafs in Alterac 33 objects total
(16842, 1071, 0, 'Fadeleaf', 0, 10); -- Fadeleafs in Alterac 33 objects total

-- Missing Fadeleaf spawns in Arathi Highlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(16844, 2042, 0, -914.123, -3341.35, 75.6305, 2.35619, 0, 0, 0.92388, 0.382683, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 7582 at 39.196598 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(16844, 1183, 0, 'Fadeleaf', 0, 10); -- Fadeleafs in Arathi 55 objects total

-- Missing Fadeleaf spawns in The Hinterlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(16841, 2042, 0, 103.044, -2881.95, 113.757, 3.61284, 0, 0, -0.972369, 0.233448, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7799 at 27.377180 yards.
(16845, 2042, 0, 73.3306, -2575.64, 110.622, 3.10665, 0, 0, 0.999847, 0.0174693, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7748 at 17.870535 yards.
(16846, 2042, 0, 29.2546, -3312.49, 116.929, 0.715585, 0, 0, 0.350207, 0.936672, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7769 at 24.377642 yards.
(16848, 2042, 0, 130.193, -3739.45, 125.82, 5.75959, 0, 0, -0.258819, 0.965926, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7579 at 20.180622 yards.
(16851, 2042, 0, 121.778, -3088.08, 129.892, 2.70526, 0, 0, 0.976295, 0.216442, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 7718 at 31.177647 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(16841, 1252, 0, 'Fadeleaf', 0, 10), -- Fadeleafs in Hinterlands 29 objects total
(16845, 1252, 0, 'Fadeleaf', 0, 10), -- Fadeleafs in Hinterlands 29 objects total
(16846, 1252, 0, 'Fadeleaf', 0, 10), -- Fadeleafs in Hinterlands 29 objects total
(16848, 1252, 0, 'Fadeleaf', 0, 10), -- Fadeleafs in Hinterlands 29 objects total
(16851, 1252, 0, 'Fadeleaf', 0, 10); -- Fadeleafs in Hinterlands 29 objects total

-- Correct position of Firebloom in Searing Gorge (position is off by 0.821053 yards).
UPDATE `gameobject` SET `position_x`=-6538.63, `position_y`=-1680.26, `position_z`=295.718, `orientation`=2.75761, `rotation0`=0, `rotation1`=0, `rotation2`=0.981627, `rotation3`=0.190812 WHERE `guid`=13239;

-- Correct position of Firebloom in Badlands (position is off by 1.36864 yards).
UPDATE `gameobject` SET `position_x`=-6485.51, `position_y`=-3653.27, `position_z`=244.496, `orientation`=5.81195, `rotation0`=0, `rotation1`=0, `rotation2`=-0.233445, `rotation3`=0.97237 WHERE `guid`=12328;

-- Correct position of Firebloom in Badlands (position is off by 0.304908 yards).
UPDATE `gameobject` SET `position_x`=-6946.8, `position_y`=-2451.77, `position_z`=240.744, `orientation`=5.21854, `rotation0`=0, `rotation1`=0, `rotation2`=-0.507538, `rotation3`=0.861629 WHERE `guid`=12253;

-- Correct position of Firebloom in Searing Gorge (position is off by 0.957616 yards).
UPDATE `gameobject` SET `position_x`=-7006.21, `position_y`=-1482.54, `position_z`=240.573, `orientation`=4.97419, `rotation0`=0, `rotation1`=0, `rotation2`=-0.608761, `rotation3`=0.793354 WHERE `guid`=12222;

-- Correct position of Firebloom in Searing Gorge (position is off by 1.3737 yards).
UPDATE `gameobject` SET `position_x`=-6907.64, `position_y`=-893.32, `position_z`=245.551, `orientation`=0.59341, `rotation0`=0, `rotation1`=0, `rotation2`=0.292371, `rotation3`=0.956305 WHERE `guid`=12318;

-- Correct position of Firebloom in Tanaris (position is off by 1.23243 yards).
UPDATE `gameobject` SET `position_x`=-7120.09, `position_y`=-3449.43, `position_z`=9.61033, `orientation`=0.802851, `rotation0`=0, `rotation1`=0, `rotation2`=0.390731, `rotation3`=0.920505 WHERE `guid`=12269;

-- Correct position of Firebloom in Tanaris (position is off by 0.674824 yards).
UPDATE `gameobject` SET `position_x`=-7078.64, `position_y`=-3081.89, `position_z`=10.804, `orientation`=5.13127, `rotation0`=0, `rotation1`=0, `rotation2`=-0.544639, `rotation3`=0.838671 WHERE `guid`=12226;

-- Correct position of Firebloom in Tanaris (position is off by 0.104435 yards).
UPDATE `gameobject` SET `position_x`=-7378.97, `position_y`=-4117.9, `position_z`=8.87722, `orientation`=2.72271, `rotation0`=0, `rotation1`=0, `rotation2`=0.978148, `rotation3`=0.207912 WHERE `guid`=12289;

-- Correct position of Firebloom in Tanaris (position is off by 0.911042 yards).
UPDATE `gameobject` SET `position_x`=-7461.91, `position_y`=-4757.04, `position_z`=8.90017, `orientation`=2.67035, `rotation0`=0, `rotation1`=0, `rotation2`=0.972369, `rotation3`=0.233448 WHERE `guid`=12228;

-- Correct position of Firebloom in Tanaris (position is off by 1.36002 yards).
UPDATE `gameobject` SET `position_x`=-7016.36, `position_y`=-2879.98, `position_z`=9.01529, `orientation`=1.44862, `rotation0`=0, `rotation1`=0, `rotation2`=0.66262, `rotation3`=0.748956 WHERE `guid`=12258;

-- Correct position of Firebloom in Searing Gorge (position is off by 1.11062 yards).
UPDATE `gameobject` SET `position_x`=-7117, `position_y`=-976.476, `position_z`=253.64, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=12267;

-- Correct position of Firebloom in Searing Gorge (position is off by 2.33125 yards).
UPDATE `gameobject` SET `position_x`=-6788.77, `position_y`=-1450.17, `position_z`=171.192, `orientation`=5.044, `rotation0`=0, `rotation1`=0, `rotation2`=-0.580703, `rotation3`=0.814116 WHERE `guid`=39970;

-- Correct position of Firebloom in Searing Gorge (position is off by 1.17213 yards).
UPDATE `gameobject` SET `position_x`=-6712.59, `position_y`=-840.098, `position_z`=244.144, `orientation`=0.820303, `rotation0`=0, `rotation1`=0, `rotation2`=0.398748, `rotation3`=0.91706 WHERE `guid`=12323;

-- Correct position of Firebloom in Tanaris (position is off by 1.27839 yards).
UPDATE `gameobject` SET `position_x`=-6981.83, `position_y`=-4478.49, `position_z`=11.1205, `orientation`=1.93731, `rotation0`=0, `rotation1`=0, `rotation2`=0.824125, `rotation3`=0.566408 WHERE `guid`=12288;

-- Correct position of Firebloom in Badlands (position is off by 1.08036 yards).
UPDATE `gameobject` SET `position_x`=-6713.47, `position_y`=-3580.06, `position_z`=242.403, `orientation`=1.91986, `rotation0`=0, `rotation1`=0, `rotation2`=0.819152, `rotation3`=0.573577 WHERE `guid`=12229;

-- Correct position of Firebloom in Badlands (position is off by 1.12757 yards).
UPDATE `gameobject` SET `position_x`=-7082.95, `position_y`=-2750.59, `position_z`=243.051, `orientation`=4.60767, `rotation0`=0, `rotation1`=0, `rotation2`=-0.743144, `rotation3`=0.669131 WHERE `guid`=12256;

-- Correct position of Firebloom in Searing Gorge (position is off by 1.11284 yards).
UPDATE `gameobject` SET `position_x`=-6885.27, `position_y`=-1576.84, `position_z`=245.108, `orientation`=0.750491, `rotation0`=0, `rotation1`=0, `rotation2`=0.366501, `rotation3`=0.930418 WHERE `guid`=12277;

-- Correct position of Firebloom in Badlands (position is off by 1.34817 yards).
UPDATE `gameobject` SET `position_x`=-7113.97, `position_y`=-3217.87, `position_z`=241.667, `orientation`=4.29351, `rotation0`=0, `rotation1`=0, `rotation2`=-0.83867, `rotation3`=0.54464 WHERE `guid`=12272;

-- Correct position of Firebloom in Searing Gorge (position is off by 0.266604 yards).
UPDATE `gameobject` SET `position_x`=-7010.74, `position_y`=-970.94, `position_z`=255.945, `orientation`=4.93928, `rotation0`=0, `rotation1`=0, `rotation2`=-0.622514, `rotation3`=0.782609 WHERE `guid`=12311;

-- Correct position of Firebloom in Searing Gorge (position is off by 3.66397 yards).
UPDATE `gameobject` SET `position_x`=-6730.7, `position_y`=-1038.35, `position_z`=240.145, `orientation`=0.925024, `rotation0`=0, `rotation1`=0, `rotation2`=0.446198, `rotation3`=0.894935 WHERE `guid`=12239;

-- Correct position of Firebloom in Searing Gorge (position is off by 0.368691 yards).
UPDATE `gameobject` SET `position_x`=-6790.12, `position_y`=-1645.66, `position_z`=191.864, `orientation`=1.43117, `rotation0`=0, `rotation1`=0, `rotation2`=0.656058, `rotation3`=0.75471 WHERE `guid`=12265;

-- Correct position of Firebloom in Badlands (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-6551.81, `position_y`=-3283.03, `position_z`=241.864, `orientation`=2.11185, `rotation0`=0, `rotation1`=0, `rotation2`=0.870356, `rotation3`=0.492424 WHERE `guid`=12306;

-- Correct position of Firebloom in Tanaris (position is off by 0.388241 yards).
UPDATE `gameobject` SET `position_x`=-7362.92, `position_y`=-3479.38, `position_z`=13.4628, `orientation`=0.488691, `rotation0`=0, `rotation1`=0, `rotation2`=0.241921, `rotation3`=0.970296 WHERE `guid`=12324;

-- Correct position of Firebloom in Badlands (position is off by 0.956059 yards).
UPDATE `gameobject` SET `position_x`=-6848.68, `position_y`=-4146.1, `position_z`=266.608, `orientation`=2.86234, `rotation0`=0, `rotation1`=0, `rotation2`=0.990268, `rotation3`=0.139175 WHERE `guid`=12245;

-- Correct position of Firebloom in Searing Gorge (position is off by 2.94558 yards).
UPDATE `gameobject` SET `position_x`=-6598.16, `position_y`=-1173.59, `position_z`=272.773, `orientation`=4.10153, `rotation0`=0, `rotation1`=0, `rotation2`=-0.887011, `rotation3`=0.461749 WHERE `guid`=13238;

-- Correct position of Firebloom in Searing Gorge (position is off by 2.33083 yards).
UPDATE `gameobject` SET `position_x`=-7081.08, `position_y`=-1059.23, `position_z`=240.712, `orientation`=1.32645, `rotation0`=0, `rotation1`=0, `rotation2`=0.615661, `rotation3`=0.788011 WHERE `guid`=39971;

-- Correct position of Firebloom in Tanaris (position is off by 0.325622 yards).
UPDATE `gameobject` SET `position_x`=-7418.7, `position_y`=-3652.11, `position_z`=9.95243, `orientation`=6.07375, `rotation0`=0, `rotation1`=0, `rotation2`=-0.104528, `rotation3`=0.994522 WHERE `guid`=12264;

-- Correct position of Firebloom in Searing Gorge (position is off by 1.12051 yards).
UPDATE `gameobject` SET `position_x`=-6946.54, `position_y`=-1624.95, `position_z`=243.231, `orientation`=3.78737, `rotation0`=0, `rotation1`=0, `rotation2`=-0.948323, `rotation3`=0.317306 WHERE `guid`=12218;

-- Correct position of Firebloom in Tanaris (position is off by 0.387949 yards).
UPDATE `gameobject` SET `position_x`=-7747.11, `position_y`=-3984.63, `position_z`=9.69405, `orientation`=5.2709, `rotation0`=0, `rotation1`=0, `rotation2`=-0.484809, `rotation3`=0.87462 WHERE `guid`=12302;

-- Correct position of Firebloom in Tanaris (position is off by 0.713869 yards).
UPDATE `gameobject` SET `position_x`=-7586.8, `position_y`=-3573.33, `position_z`=15.151, `orientation`=3.4383, `rotation0`=0, `rotation1`=0, `rotation2`=-0.989016, `rotation3`=0.147811 WHERE `guid`=12244;

-- Correct position of Firebloom in Tanaris (position is off by 0.912251 yards).
UPDATE `gameobject` SET `position_x`=-8446.79, `position_y`=-2719.88, `position_z`=25.594, `orientation`=0.296705, `rotation0`=0, `rotation1`=0, `rotation2`=0.147809, `rotation3`=0.989016 WHERE `guid`=12216;

-- Correct position of Firebloom in Tanaris (position is off by 1.17045 yards).
UPDATE `gameobject` SET `position_x`=-7252.11, `position_y`=-3313.24, `position_z`=9.7893, `orientation`=2.09439, `rotation0`=0, `rotation1`=0, `rotation2`=0.866025, `rotation3`=0.500001 WHERE `guid`=12284;

-- Correct position of Firebloom in Tanaris (position is off by 0.271277 yards).
UPDATE `gameobject` SET `position_x`=-8848.02, `position_y`=-2653.73, `position_z`=22.6227, `orientation`=1.44862, `rotation0`=0, `rotation1`=0, `rotation2`=0.66262, `rotation3`=0.748956 WHERE `guid`=12232;

-- Correct position of Firebloom in Searing Gorge (position is off by 1.01682 yards).
UPDATE `gameobject` SET `position_x`=-6843.69, `position_y`=-1887.06, `position_z`=267.471, `orientation`=3.00195, `rotation0`=0, `rotation1`=0, `rotation2`=0.997563, `rotation3`=0.0697661 WHERE `guid`=12230;

-- Correct position of Firebloom in Blasted Lands (position is off by 0.728221 yards).
UPDATE `gameobject` SET `position_x`=-10926.7, `position_y`=-2856.18, `position_z`=11.5525, `orientation`=2.75761, `rotation0`=0, `rotation1`=0, `rotation2`=0.981627, `rotation3`=0.190812 WHERE `guid`=12316;

-- Correct position of Firebloom in Tanaris (position is off by 1.07826 yards).
UPDATE `gameobject` SET `position_x`=-8057.34, `position_y`=-5162.02, `position_z`=9.68309, `orientation`=2.11185, `rotation0`=0, `rotation1`=0, `rotation2`=0.870356, `rotation3`=0.492424 WHERE `guid`=12270;

-- Correct position of Firebloom in Tanaris (position is off by 0.585826 yards).
UPDATE `gameobject` SET `position_x`=-7535.15, `position_y`=-3468.44, `position_z`=24.738, `orientation`=1.18682, `rotation0`=0, `rotation1`=0, `rotation2`=0.559193, `rotation3`=0.829038 WHERE `guid`=12307;

-- Correct position of Firebloom in Tanaris (position is off by 0.69486 yards).
UPDATE `gameobject` SET `position_x`=-7681.49, `position_y`=-2977.51, `position_z`=21.2711, `orientation`=4.85202, `rotation0`=0, `rotation1`=0, `rotation2`=-0.656058, `rotation3`=0.75471 WHERE `guid`=12327;

-- Correct position of Firebloom in Tanaris (position is off by 0.363811 yards).
UPDATE `gameobject` SET `position_x`=-8320.64, `position_y`=-3049.05, `position_z`=8.64034, `orientation`=4.50295, `rotation0`=0, `rotation1`=0, `rotation2`=-0.777145, `rotation3`=0.629321 WHERE `guid`=12225;

-- Correct position of Firebloom in Badlands (position is off by 0.934887 yards).
UPDATE `gameobject` SET `position_x`=-6849.17, `position_y`=-2749.58, `position_z`=242.047, `orientation`=4.06662, `rotation0`=0, `rotation1`=0, `rotation2`=-0.894934, `rotation3`=0.446199 WHERE `guid`=12295;

-- Missing Firebloom spawns in Badlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(16871, 2866, 0, -7291.14, -3161.81, 303.624, 3.12412, 0, 0, 0.999962, 0.00873464, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 12272 at 194.704758 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(16871, 1281, 0, 'Firebloom', 0, 10); -- Fireblooms in Badlands 22 objects total

-- Missing Firebloom spawns in Blasted Lands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(17265, 2866, 0, -11760.6, -2946.83, 7.51192, 3.3685, 0, 0, -0.993571, 0.113208, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12336 at 29.488443 yards.
(17459, 2866, 0, -11054.8, -2848.66, 10.7956, 4.2237, 0, 0, -0.857167, 0.515038, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12316 at 129.011551 yards.
(32361, 2866, 0, -11317.1, -3146.82, 5.7421, 1.93731, 0, 0, 0.824125, 0.566408, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 32360 at 131.342865 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(17265, 1276, 0, 'Firebloom', 0, 10), -- Fireblooms in Blasted Lands 44 objects total
(17459, 1276, 0, 'Firebloom', 0, 10), -- Fireblooms in Blasted Lands 44 objects total
(32361, 1276, 0, 'Firebloom', 0, 10); -- Fireblooms in Blasted Lands 44 objects total

-- Missing Firebloom spawns in Searing Gorge.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(31325, 2866, 0, -7323.66, -1669.21, 286.824, 2.16421, 0, 0, 0.882947, 0.469473, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 31322 at 149.393753 yards.
(33432, 2866, 0, -7086.12, -1705.49, 241.405, 3.07177, 0, 0, 0.999391, 0.0349061, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 33411 at 83.948097 yards.
(16854, 2866, 0, -6745.17, -1379.43, 240.013, 4.72984, 0, 0, -0.700909, 0.713251, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12333 at 103.006653 yards.
(31336, 2866, 0, -7316.47, -1566.92, 316.095, 1.25664, 0, 0, 0.587785, 0.809017, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 31322 at 113.381401 yards.
(16855, 2866, 0, -6991.08, -1151.45, 241.569, 0.383971, 0, 0, 0.190808, 0.981627, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9916 at 98.423210 yards.
(16880, 2866, 0, -6807.83, -1768.91, 261.281, 2.09439, 0, 0, 0.866025, 0.500001, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9980 at 101.069260 yards.
(31341, 2866, 0, -7182.48, -1527.93, 241.124, 4.66003, 0, 0, -0.725374, 0.688355, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 31322 at 55.524078 yards.
(16980, 2866, 0, -6937.42, -1396.06, 169.355, 6.02139, 0, 0, -0.130526, 0.991445, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9918 at 120.669632 yards.
(29593, 2866, 0, -6587.79, -991.392, 245.393, 3.6652, 0, 0, -0.965925, 0.258821, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 29588 at 97.650093 yards.
(16982, 2866, 0, -7275.81, -866.391, 294.072, 0.087266, 0, 0, 0.0436192, 0.999048, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12243 at 18.958660 yards.
(17258, 2866, 0, -7095.3, -1517.7, 242.911, 3.29869, 0, 0, -0.996917, 0.0784664, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12222 at 95.273148 yards.
(39977, 2866, 0, -7091.08, -1143.13, 270.494, 3.35105, 0, 0, -0.994521, 0.104536, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 39971 at 87.333450 yards.
(17260, 2866, 0, -7202.09, -1006.23, 244.447, 3.15906, 0, 0, -0.999962, 0.00873464, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12267 at 89.838730 yards.
(17266, 2866, 0, -7184.66, -1400.82, 241.753, 4.62512, 0, 0, -0.737277, 0.675591, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12248 at 125.677834 yards.
(33435, 2866, 0, -7032.25, -1742.44, 246.392, 5.32326, 0, 0, -0.461748, 0.887011, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 33411 at 119.496223 yards.
(31345, 2866, 0, -7165.78, -1647.65, 241.613, 4.53786, 0, 0, -0.766044, 0.642789, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 31322 at 100.094704 yards.
(33439, 2866, 0, -7176.88, -1728.41, 244.447, 2.51327, 0, 0, 0.951056, 0.309017, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 33411 at 155.308929 yards.
(17267, 2866, 0, -6495.32, -2012.69, 259.487, 6.23083, 0, 0, -0.0261765, 0.999657, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7051 at 118.056938 yards.
(17458, 2866, 0, -6865.87, -1192.69, 240.331, 0.139624, 0, 0, 0.0697556, 0.997564, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12215 at 6.519401 yards.
(17495, 2866, 0, -6814.45, -1554.32, 193.158, 6.02139, 0, 0, -0.130526, 0.991445, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12277 at 91.039558 yards.
(17496, 2866, 0, -6701.04, -1699.27, 214.545, 1.79769, 0, 0, 0.782608, 0.622515, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12265 at 106.124977 yards.
(17498, 2866, 0, -7245.29, -1302.97, 273.505, 5.39307, 0, 0, -0.430511, 0.902586, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12248 at 53.920971 yards.
(17506, 2866, 0, -6846.84, -1140.55, 240.004, 3.47321, 0, 0, -0.986285, 0.16505, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 12215 at 58.204124 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(31325, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(33432, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(16854, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(31336, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(16855, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(16880, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(31341, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(16980, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(29593, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(16982, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(17258, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(39977, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(17260, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(17266, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(33435, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(31345, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(33439, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(17267, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(17458, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(17495, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(17496, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(17498, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(17506, 1291, 0, 'Firebloom', 0, 10); -- Fireblooms in Searing Gorge 49 objects total

-- Missing Firebloom spawns in Tanaris.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(17360, 2866, 1, -7247.31, -4475.61, 9.24286, 2.18166, 0, 0, 0.887011, 0.461749, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 17286 at 206.961014 yards.
(16856, 2866, 1, -7741.32, -3611.67, 44.6915, 5.74214, 0, 0, -0.267238, 0.963631, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12332 at 129.069824 yards.
(16857, 2866, 1, -8781.79, -2849.3, 27.8091, 0.506145, 0, 0, 0.25038, 0.968148, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12291 at 168.775558 yards.
(16858, 2866, 1, -8907.6, -2784.74, 37.3759, 4.34587, 0, 0, -0.824126, 0.566406, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12300 at 140.296982 yards.
(16859, 2866, 1, -8415.25, -2251.24, 21.4984, 3.26377, 0, 0, -0.998135, 0.0610518, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12224 at 193.756699 yards.
(16870, 2866, 1, -7615.36, -3785.46, 12.4705, 2.93214, 0, 0, 0.994521, 0.104536, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12244 at 213.371918 yards.
(17426, 2866, 1, -8387, -4116.63, 11.163, 1.74533, 0, 0, 0.766044, 0.642789, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 17291 at 197.573334 yards.
(17262, 2866, 1, -8219.37, -4343.52, 13.023, 5.60251, 0, 0, -0.333807, 0.942641, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12241 at 5.975109 yards.
(30240, 2866, 1, -7713.99, -4318.98, 11.0923, 4.97419, 0, 0, -0.608761, 0.793354, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 30229 at 172.912827 yards.
(17456, 2866, 1, -7850.97, -3115.6, 72.6794, 6.0912, 0, 0, -0.0958452, 0.995396, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 17290 at 200.594589 yards.
(17264, 2866, 1, -7462.25, -3253.01, 12.2622, 2.14675, 0, 0, 0.878817, 0.47716, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12284 at 217.971237 yards.
(17457, 2866, 1, -9174.92, -2619.26, 16.0227, 2.79252, 0, 0, 0.984807, 0.173652, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 17295 at 185.668472 yards.
(17499, 2866, 1, -8157.5, -5246.43, 3.54654, 1.58825, 0, 0, 0.71325, 0.70091, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 17297 at 96.944397 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(17360, 1208, 0, 'Firebloom', 0, 10), -- Fireblooms in Tanaris 62 objects total
(16856, 1208, 0, 'Firebloom', 0, 10), -- Fireblooms in Tanaris 62 objects total
(16857, 1208, 0, 'Firebloom', 0, 10), -- Fireblooms in Tanaris 62 objects total
(16858, 1208, 0, 'Firebloom', 0, 10), -- Fireblooms in Tanaris 62 objects total
(16859, 1208, 0, 'Firebloom', 0, 10), -- Fireblooms in Tanaris 62 objects total
(16870, 1208, 0, 'Firebloom', 0, 10), -- Fireblooms in Tanaris 62 objects total
(17426, 1208, 0, 'Firebloom', 0, 10), -- Fireblooms in Tanaris 62 objects total
(17262, 1208, 0, 'Firebloom', 0, 10), -- Fireblooms in Tanaris 62 objects total
(30240, 1208, 0, 'Firebloom', 0, 10), -- Fireblooms in Tanaris 62 objects total
(17456, 1208, 0, 'Firebloom', 0, 10), -- Fireblooms in Tanaris 62 objects total
(17264, 1208, 0, 'Firebloom', 0, 10), -- Fireblooms in Tanaris 62 objects total
(17457, 1208, 0, 'Firebloom', 0, 10), -- Fireblooms in Tanaris 62 objects total
(17499, 1208, 0, 'Firebloom', 0, 10); -- Fireblooms in Tanaris 62 objects total

-- Create new pool to hold Gloom Weed spawns in Tirisfal Glades.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(417, 40, 'Gloom Weeds in Tirisfal Glades', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(25508, 417, 0, 'Gloom Weed', 0, 10),
(25513, 417, 0, 'Gloom Weed', 0, 10),
(25518, 417, 0, 'Gloom Weed', 0, 10),
(25531, 417, 0, 'Gloom Weed', 0, 10),
(25549, 417, 0, 'Gloom Weed', 0, 10),
(25550, 417, 0, 'Gloom Weed', 0, 10),
(25552, 417, 0, 'Gloom Weed', 0, 10),
(25556, 417, 0, 'Gloom Weed', 0, 10),
(25558, 417, 0, 'Gloom Weed', 0, 10),
(25560, 417, 0, 'Gloom Weed', 0, 10),
(25562, 417, 0, 'Gloom Weed', 0, 10),
(25565, 417, 0, 'Gloom Weed', 0, 10),
(25569, 417, 0, 'Gloom Weed', 0, 10),
(45063, 417, 0, 'Gloom Weed', 0, 10),
(45064, 417, 0, 'Gloom Weed', 0, 10),
(45111, 417, 0, 'Gloom Weed', 0, 10),
(45131, 417, 0, 'Gloom Weed', 0, 10),
(45145, 417, 0, 'Gloom Weed', 0, 10),
(45146, 417, 0, 'Gloom Weed', 0, 10),
(45147, 417, 0, 'Gloom Weed', 0, 10),
(45148, 417, 0, 'Gloom Weed', 0, 10),
(45149, 417, 0, 'Gloom Weed', 0, 10),
(45150, 417, 0, 'Gloom Weed', 0, 10),
(45151, 417, 0, 'Gloom Weed', 0, 10),
(45152, 417, 0, 'Gloom Weed', 0, 10),
(45153, 417, 0, 'Gloom Weed', 0, 10),
(45154, 417, 0, 'Gloom Weed', 0, 10),
(45155, 417, 0, 'Gloom Weed', 0, 10),
(45156, 417, 0, 'Gloom Weed', 0, 10),
(45173, 417, 0, 'Gloom Weed', 0, 10),
(45174, 417, 0, 'Gloom Weed', 0, 10),
(45189, 417, 0, 'Gloom Weed', 0, 10),
(45190, 417, 0, 'Gloom Weed', 0, 10),
(45191, 417, 0, 'Gloom Weed', 0, 10),
(45192, 417, 0, 'Gloom Weed', 0, 10),
(45193, 417, 0, 'Gloom Weed', 0, 10),
(45199, 417, 0, 'Gloom Weed', 0, 10),
(45206, 417, 0, 'Gloom Weed', 0, 10),
(45207, 417, 0, 'Gloom Weed', 0, 10),
(45226, 417, 0, 'Gloom Weed', 0, 10),
(45235, 417, 0, 'Gloom Weed', 0, 10),
(45236, 417, 0, 'Gloom Weed', 0, 10),
(45237, 417, 0, 'Gloom Weed', 0, 10),
(45241, 417, 0, 'Gloom Weed', 0, 10),
(45243, 417, 0, 'Gloom Weed', 0, 10),
(45247, 417, 0, 'Gloom Weed', 0, 10),
(45248, 417, 0, 'Gloom Weed', 0, 10),
(45249, 417, 0, 'Gloom Weed', 0, 10),
(45250, 417, 0, 'Gloom Weed', 0, 10),
(45252, 417, 0, 'Gloom Weed', 0, 10),
(45253, 417, 0, 'Gloom Weed', 0, 10),
(45255, 417, 0, 'Gloom Weed', 0, 10),
(45258, 417, 0, 'Gloom Weed', 0, 10),
(45262, 417, 0, 'Gloom Weed', 0, 10),
(45263, 417, 0, 'Gloom Weed', 0, 10),
(45264, 417, 0, 'Gloom Weed', 0, 10),
(45265, 417, 0, 'Gloom Weed', 0, 10),
(45266, 417, 0, 'Gloom Weed', 0, 10),
(45268, 417, 0, 'Gloom Weed', 0, 10),
(45269, 417, 0, 'Gloom Weed', 0, 10),
(45270, 417, 0, 'Gloom Weed', 0, 10),
(45273, 417, 0, 'Gloom Weed', 0, 10),
(45274, 417, 0, 'Gloom Weed', 0, 10),
(45275, 417, 0, 'Gloom Weed', 0, 10),
(45277, 417, 0, 'Gloom Weed', 0, 10),
(45279, 417, 0, 'Gloom Weed', 0, 10),
(45280, 417, 0, 'Gloom Weed', 0, 10),
(45281, 417, 0, 'Gloom Weed', 0, 10),
(45283, 417, 0, 'Gloom Weed', 0, 10),
(45284, 417, 0, 'Gloom Weed', 0, 10),
(45287, 417, 0, 'Gloom Weed', 0, 10),
(45289, 417, 0, 'Gloom Weed', 0, 10),
(45290, 417, 0, 'Gloom Weed', 0, 10),
(45293, 417, 0, 'Gloom Weed', 0, 10),
(45294, 417, 0, 'Gloom Weed', 0, 10);

-- Correct position of Gloom Weed in Tirisfal Glades (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=2204.13, `position_y`=1120.06, `position_z`=34.8163, `orientation`=4.01426, `rotation0`=0, `rotation1`=0, `rotation2`=-0.906307, `rotation3`=0.422619 WHERE `guid`=25562;

-- Missing Gloom Weed spawns in Tirisfal Glades.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(45864, 175566, 0, 2345, 1134.46, 40.815, 2.21657, 0, 0, 0.894934, 0.446199, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45151 at 27.154045 yards.
(25563, 175566, 0, 2236.18, 1132.24, 35.7463, 3.42085, 0, 0, -0.990268, 0.139175, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 25562 at 34.289642 yards.
(45882, 175566, 0, 2262.6, 1097.4, 33.4581, 0.925024, 0, 0, 0.446198, 0.894935, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45206 at 23.813292 yards.
(45883, 175566, 0, 2147.61, 1179.32, 43.0177, 0.90757, 0, 0, 0.438371, 0.898794, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45249 at 39.174145 yards.
(45884, 175566, 0, 2110.01, 1025.17, 32.7202, 2.51327, 0, 0, 0.951056, 0.309017, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45247 at 45.436459 yards.
(45885, 175566, 0, 2089.86, 930.135, 37.6736, 3.29869, 0, 0, -0.996917, 0.0784664, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45289 at 39.898357 yards.
(25564, 175566, 0, 2222.67, 1082.27, 31.9708, 5.84685, 0, 0, -0.216439, 0.976296, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 25562 at 42.184666 yards.
(46200, 175566, 0, 2156.37, 1114.61, 35.3472, 2.60054, 0, 0, 0.96363, 0.267241, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45249 at 44.080013 yards.
(25566, 175566, 0, 2194.7, 1155.29, 33.7973, 1.18682, 0, 0, 0.559193, 0.829038, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 25565 at 27.818230 yards.
(46201, 175566, 0, 2025.03, 881.479, 34.3452, 3.42085, 0, 0, -0.990268, 0.139175, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45289 at 41.449284 yards.
(25551, 175566, 0, 2145.43, 985.034, 30.369, 3.68265, 0, 0, -0.96363, 0.267241, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 25549 at 39.686237 yards.
(46205, 175566, 0, 2068.2, 778.964, 37.0121, 3.05433, 0, 0, 0.999048, 0.0436193, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45273 at 48.561001 yards.
(46244, 175566, 0, 2061.49, 737.939, 37.4144, 5.39307, 0, 0, -0.430511, 0.902586, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45207 at 57.711746 yards.
(46247, 175566, 0, 2056.82, 702.233, 40.8026, 3.61284, 0, 0, -0.972369, 0.233448, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45235 at 65.627213 yards.
(46252, 175566, 0, 2215.82, 763.169, 35.9284, 2.11185, 0, 0, 0.870356, 0.492424, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45293 at 24.975376 yards.
(25570, 175566, 0, 2216.82, 699.65, 35.4347, 1.06465, 0, 0, 0.507538, 0.861629, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 25569 at 39.158745 yards.
(46257, 175566, 0, 2108.76, 613.144, 35.0265, 4.88692, 0, 0, -0.642787, 0.766045, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45173 at 84.692368 yards.
(46267, 175566, 0, 2242.29, 676.938, 37.7281, 0.994837, 0, 0, 0.477159, 0.878817, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45277 at 41.238186 yards.
(46276, 175566, 0, 2174.56, 589.332, 43.559, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45283 at 41.075333 yards.
(46278, 175566, 0, 2296.36, 575.073, 33.1947, 5.58505, 0, 0, -0.34202, 0.939693, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45262 at 50.826672 yards.
(46279, 175566, 0, 2323.93, 607.756, 33.0141, 4.86947, 0, 0, -0.649447, 0.760406, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45274 at 35.737415 yards.
(46282, 175566, 0, 2100.14, 476.564, 60.7574, 1.41372, 0, 0, 0.649447, 0.760406, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45237 at 52.236477 yards.
(46285, 175566, 0, 2071.39, 598.644, 34.1636, 6.12611, 0, 0, -0.0784588, 0.996917, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45173 at 69.193268 yards.
(46290, 175566, 0, 2170.57, 480.299, 66.9702, 1.67551, 0, 0, 0.743144, 0.669131, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45237 at 52.559711 yards.
(46291, 175566, 0, 2306.28, 494.127, 35.7492, 5.49779, 0, 0, -0.382683, 0.92388, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45262 at 30.822075 yards.
(25514, 175566, 0, 2193.01, 652.462, 32.8342, 0.471238, 0, 0, 0.233445, 0.97237, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 25513 at 38.092777 yards.
(46299, 175566, 0, 2170.57, 480.299, 66.2506, 1.67551, 0, 0, 0.743144, 0.669131, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 45237 at 52.409267 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(45864, 417, 0, 'Gloom Weed', 0, 10), -- Gloom Weeds in Tirisfal Glades
(25563, 417, 0, 'Gloom Weed', 0, 10), -- Gloom Weeds in Tirisfal Glades
(45882, 417, 0, 'Gloom Weed', 0, 10), -- Gloom Weeds in Tirisfal Glades
(45883, 417, 0, 'Gloom Weed', 0, 10), -- Gloom Weeds in Tirisfal Glades
(45884, 417, 0, 'Gloom Weed', 0, 10), -- Gloom Weeds in Tirisfal Glades
(45885, 417, 0, 'Gloom Weed', 0, 10), -- Gloom Weeds in Tirisfal Glades
(25564, 417, 0, 'Gloom Weed', 0, 10), -- Gloom Weeds in Tirisfal Glades
(46200, 417, 0, 'Gloom Weed', 0, 10), -- Gloom Weeds in Tirisfal Glades
(25566, 417, 0, 'Gloom Weed', 0, 10), -- Gloom Weeds in Tirisfal Glades
(46201, 417, 0, 'Gloom Weed', 0, 10), -- Gloom Weeds in Tirisfal Glades
(25551, 417, 0, 'Gloom Weed', 0, 10), -- Gloom Weeds in Tirisfal Glades
(46205, 417, 0, 'Gloom Weed', 0, 10), -- Gloom Weeds in Tirisfal Glades
(46244, 417, 0, 'Gloom Weed', 0, 10), -- Gloom Weeds in Tirisfal Glades
(46247, 417, 0, 'Gloom Weed', 0, 10), -- Gloom Weeds in Tirisfal Glades
(46252, 417, 0, 'Gloom Weed', 0, 10), -- Gloom Weeds in Tirisfal Glades
(25570, 417, 0, 'Gloom Weed', 0, 10), -- Gloom Weeds in Tirisfal Glades
(46257, 417, 0, 'Gloom Weed', 0, 10), -- Gloom Weeds in Tirisfal Glades
(46267, 417, 0, 'Gloom Weed', 0, 10), -- Gloom Weeds in Tirisfal Glades
(46276, 417, 0, 'Gloom Weed', 0, 10), -- Gloom Weeds in Tirisfal Glades
(46278, 417, 0, 'Gloom Weed', 0, 10), -- Gloom Weeds in Tirisfal Glades
(46279, 417, 0, 'Gloom Weed', 0, 10), -- Gloom Weeds in Tirisfal Glades
(46282, 417, 0, 'Gloom Weed', 0, 10), -- Gloom Weeds in Tirisfal Glades
(46285, 417, 0, 'Gloom Weed', 0, 10), -- Gloom Weeds in Tirisfal Glades
(46290, 417, 0, 'Gloom Weed', 0, 10), -- Gloom Weeds in Tirisfal Glades
(46291, 417, 0, 'Gloom Weed', 0, 10), -- Gloom Weeds in Tirisfal Glades
(25514, 417, 0, 'Gloom Weed', 0, 10), -- Gloom Weeds in Tirisfal Glades
(46299, 417, 0, 'Gloom Weed', 0, 10); -- Gloom Weeds in Tirisfal Glades

-- Correct position of Golden Sansam in Un'Goro Crater (position is off by 1.04446 yards).
UPDATE `gameobject` SET `position_x`=-6394.04, `position_y`=-1380.74, `position_z`=-271.681, `orientation`=5.25344, `rotation0`=0, `rotation1`=0, `rotation2`=-0.492423, `rotation3`=0.870356 WHERE `guid`=19203;

-- Correct position of Golden Sansam in Azshara (position is off by 0.801852 yards).
UPDATE `gameobject` SET `position_x`=3219.17, `position_y`=-4373.5, `position_z`=106.992, `orientation`=2.47837, `rotation0`=0, `rotation1`=0, `rotation2`=0.945518, `rotation3`=0.325568 WHERE `guid`=19165;

-- Correct position of Golden Sansam in Burning Steppes (position is off by 1.69449 yards).
UPDATE `gameobject` SET `position_x`=-7970.27, `position_y`=-1313.12, `position_z`=133.305, `orientation`=2.25147, `rotation0`=0, `rotation1`=0, `rotation2`=0.902585, `rotation3`=0.430512 WHERE `guid`=19049;

-- Correct position of Golden Sansam in Burning Steppes (position is off by 0.805407 yards).
UPDATE `gameobject` SET `position_x`=-8174.2, `position_y`=-1720.08, `position_z`=140.313, `orientation`=1.29154, `rotation0`=0, `rotation1`=0, `rotation2`=0.601814, `rotation3`=0.798636 WHERE `guid`=19025;

-- Correct position of Golden Sansam in Un'Goro Crater (position is off by 0.845289 yards).
UPDATE `gameobject` SET `position_x`=-7190.29, `position_y`=-2004.24, `position_z`=-271.609, `orientation`=2.11185, `rotation0`=0, `rotation1`=0, `rotation2`=0.870356, `rotation3`=0.492424 WHERE `guid`=19092;

-- Correct position of Golden Sansam in Burning Steppes (position is off by 1.08398 yards).
UPDATE `gameobject` SET `position_x`=-7945.05, `position_y`=-908.27, `position_z`=131.253, `orientation`=0.994837, `rotation0`=0, `rotation1`=0, `rotation2`=0.477159, `rotation3`=0.878817 WHERE `guid`=19096;

-- Correct position of Golden Sansam in Burning Steppes (position is off by 0.924014 yards).
UPDATE `gameobject` SET `position_x`=-8099.08, `position_y`=-2979.05, `position_z`=134.856, `orientation`=3.194, `rotation0`=0, `rotation1`=0, `rotation2`=-0.999657, `rotation3`=0.0262016 WHERE `guid`=18944;

-- Correct position of Golden Sansam in Burning Steppes (position is off by 2.75686 yards).
UPDATE `gameobject` SET `position_x`=-8101.28, `position_y`=-1424.45, `position_z`=131.193, `orientation`=1.48353, `rotation0`=0, `rotation1`=0, `rotation2`=0.67559, `rotation3`=0.737278 WHERE `guid`=19150;

-- Correct position of Golden Sansam in Burning Steppes (position is off by 1.23908 yards).
UPDATE `gameobject` SET `position_x`=-7764.15, `position_y`=-2843.23, `position_z`=133.439, `orientation`=2.1293, `rotation0`=0, `rotation1`=0, `rotation2`=0.874619, `rotation3`=0.48481 WHERE `guid`=19109;

-- Correct position of Golden Sansam in Un'Goro Crater (position is off by 3.95859 yards).
UPDATE `gameobject` SET `position_x`=-6660.58, `position_y`=-725.317, `position_z`=-270.855, `orientation`=3.4383, `rotation0`=0, `rotation1`=0, `rotation2`=-0.989016, `rotation3`=0.147811 WHERE `guid`=18977;

-- Correct position of Golden Sansam in The Hinterlands (position is off by 0.310264 yards).
UPDATE `gameobject` SET `position_x`=-282.718, `position_y`=-3336.04, `position_z`=140.87, `orientation`=4.18879, `rotation0`=0, `rotation1`=0, `rotation2`=-0.866025, `rotation3`=0.500001 WHERE `guid`=19003;

-- Correct position of Golden Sansam in Azshara (position is off by 3.53136 yards).
UPDATE `gameobject` SET `position_x`=3946.23, `position_y`=-5304.11, `position_z`=126.736, `orientation`=2.82743, `rotation0`=0, `rotation1`=0, `rotation2`=0.987688, `rotation3`=0.156436 WHERE `guid`=39929;

-- Correct position of Golden Sansam in Eastern Plaguelands (position is off by 2.45849 yards).
UPDATE `gameobject` SET `position_x`=1847.53, `position_y`=-3210.35, `position_z`=124.607, `orientation`=2.87979, `rotation0`=0, `rotation1`=0, `rotation2`=0.991445, `rotation3`=0.130528 WHERE `guid`=19083;

-- Correct position of Golden Sansam in The Hinterlands (position is off by 1.6628 yards).
UPDATE `gameobject` SET `position_x`=367.597, `position_y`=-3300.82, `position_z`=115.674, `orientation`=4.2237, `rotation0`=0, `rotation1`=0, `rotation2`=-0.857167, `rotation3`=0.515038 WHERE `guid`=19158;

-- Correct position of Golden Sansam in Un'Goro Crater (position is off by 0.647035 yards).
UPDATE `gameobject` SET `position_x`=-6813.65, `position_y`=-1419.74, `position_z`=-271.522, `orientation`=1.23918, `rotation0`=0, `rotation1`=0, `rotation2`=0.580703, `rotation3`=0.814116 WHERE `guid`=19072;

-- Correct position of Golden Sansam in Feralas (position is off by 0.446629 yards).
UPDATE `gameobject` SET `position_x`=-5319.58, `position_y`=1220.34, `position_z`=55.904, `orientation`=5.61996, `rotation0`=0, `rotation1`=0, `rotation2`=-0.325567, `rotation3`=0.945519 WHERE `guid`=18982;

-- Correct position of Golden Sansam in Un'Goro Crater (position is off by 0.40831 yards).
UPDATE `gameobject` SET `position_x`=-6753.93, `position_y`=-556.34, `position_z`=-272.215, `orientation`=0.558504, `rotation0`=0, `rotation1`=0, `rotation2`=0.275637, `rotation3`=0.961262 WHERE `guid`=19090;

-- Correct position of Golden Sansam in Un'Goro Crater (position is off by 0.984291 yards).
UPDATE `gameobject` SET `position_x`=-6559.05, `position_y`=-883.844, `position_z`=-272.204, `orientation`=5.72468, `rotation0`=0, `rotation1`=0, `rotation2`=-0.275637, `rotation3`=0.961262 WHERE `guid`=19181;

-- Missing Golden Sansam spawns in Azshara.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(19127, 176583, 1, 3628.94, -5387.71, 115.502, 4.79966, 0, 0, -0.67559, 0.737278, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19110 at 9.529222 yards.
(19052, 176583, 1, 4117.76, -5711.8, 127.303, 5.72468, 0, 0, -0.275637, 0.961262, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19047 at 19.257011 yards.
(19135, 176583, 1, 4705.46, -6650.12, 119.948, 0.0174525, 0, 0, 0.00872612, 0.999962, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19119 at 30.463467 yards.
(19186, 176583, 1, 4533.43, -6772.33, 129.034, 1.69297, 0, 0, 0.748956, 0.66262, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19179 at 21.476509 yards.
(19139, 176583, 1, 3934.18, -4993.8, 137.714, 2.68781, 0, 0, 0.97437, 0.224951, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19105 at 6.170334 yards.
(19169, 176583, 1, 3525.45, -4839.55, 123.035, 2.16421, 0, 0, 0.882947, 0.469473, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19134 at 39.516827 yards.
(19384, 176583, 1, 3817.59, -5242.69, 99.2626, 2.87979, 0, 0, 0.991445, 0.130528, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19185 at 45.410049 yards.
(19088, 176583, 1, 2737.93, -5414.55, 111.196, 2.9496, 0, 0, 0.995396, 0.0958512, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19086 at 25.192930 yards.
(19391, 176583, 1, 3710.2, -5181.4, 86.6548, 3.90954, 0, 0, -0.927183, 0.374608, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19140 at 5.253731 yards.
(19392, 176583, 1, 4512.31, -5480, 107.13, 0.663223, 0, 0, 0.325567, 0.945519, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19256 at 10.349870 yards.
(19395, 176583, 1, 3423.77, -4651.64, 102.226, 4.55531, 0, 0, -0.760406, 0.649449, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19215 at 20.179901 yards.
(19413, 176583, 1, 3426.97, -5096.9, 84.1595, 5.61996, 0, 0, -0.325567, 0.945519, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19199 at 38.370453 yards.
(19420, 176583, 1, 3156.39, -5501.31, 97.2671, 6.07375, 0, 0, -0.104528, 0.994522, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19176 at 6.065478 yards.
(19424, 176583, 1, 3466.07, -5246.82, 86.1165, 6.05629, 0, 0, -0.113203, 0.993572, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 19197 at 17.330723 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(19127, 1241, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Azshara 87 objects total
(19052, 1241, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Azshara 87 objects total
(19135, 1241, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Azshara 87 objects total
(19186, 1241, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Azshara 87 objects total
(19139, 1241, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Azshara 87 objects total
(19169, 1241, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Azshara 87 objects total
(19384, 1241, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Azshara 87 objects total
(19088, 1241, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Azshara 87 objects total
(19391, 1241, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Azshara 87 objects total
(19392, 1241, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Azshara 87 objects total
(19395, 1241, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Azshara 87 objects total
(19413, 1241, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Azshara 87 objects total
(19420, 1241, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Azshara 87 objects total
(19424, 1241, 0, 'Golden Sansam', 0, 10); -- Golden Sansam in Azshara 87 objects total

-- Missing Golden Sansam spawns in Burning Steppes.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(19027, 176583, 0, -7755.03, -1475.44, 134.3, 2.54818, 0, 0, 0.956305, 0.292372, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19024 at 17.624424 yards.
(19193, 176583, 0, -7563.25, -2762.65, 135.48, 1.36136, 0, 0, 0.62932, 0.777146, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19180 at 9.345937 yards.
(19426, 176583, 0, -7924.49, -2656.46, 220.236, 2.44346, 0, 0, 0.939692, 0.34202, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 19114 at 6.096519 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(19027, 1300, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Burning Steppes 32 objects total
(19193, 1300, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Burning Steppes 32 objects total
(19426, 1300, 0, 'Golden Sansam', 0, 10); -- Golden Sansam in Burning Steppes 32 objects total

-- Missing Golden Sansam spawns in The Hinterlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(19094, 176583, 0, 51.3171, -3625.82, 122.411, 5.34071, 0, 0, -0.45399, 0.891007, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19093 at 12.658143 yards.
(19039, 176583, 0, 605.156, -4074.16, 113.456, 1.6057, 0, 0, 0.719339, 0.694659, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19037 at 277.605927 yards.
(19043, 176583, 0, 970.431, -4124.26, 112.937, 2.53072, 0, 0, 0.953716, 0.300708, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19037 at 646.279358 yards.
(19053, 176583, 0, -75.4167, -4253.4, 120.531, 6.17847, 0, 0, -0.0523357, 0.99863, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19008 at 11.973753 yards.
(19054, 176583, 0, 336.581, -4032.55, 118.385, 4.71239, 0, 0, -0.707107, 0.707107, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19037 at 6.681913 yards.
(19058, 176583, 0, 789.577, -4213.53, 112.392, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19037 at 492.727631 yards.
(19059, 176583, 0, 434.739, -3537.61, 120.946, 1.78023, 0, 0, 0.777145, 0.629321, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 19021 at 23.917542 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(19094, 1253, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Hinterlands 25 objects total
(19039, 1253, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Hinterlands 25 objects total
(19043, 1253, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Hinterlands 25 objects total
(19053, 1253, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Hinterlands 25 objects total
(19054, 1253, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Hinterlands 25 objects total
(19058, 1253, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Hinterlands 25 objects total
(19059, 1253, 0, 'Golden Sansam', 0, 10); -- Golden Sansam in Hinterlands 25 objects total

-- Missing Golden Sansam spawns in Eastern Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(18976, 176583, 0, 1395.66, -3689.79, 75.5379, 4.11898, 0, 0, -0.882947, 0.469473, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 18973 at 6.307845 yards.
(19204, 176583, 0, 1823.56, -3750.1, 158.251, 3.45576, 0, 0, -0.987688, 0.156436, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19178 at 6.750258 yards.
(19030, 176583, 0, 2957.66, -2888.89, 101.571, 0.0174525, 0, 0, 0.00872612, 0.999962, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19017 at 5.170413 yards.
(19243, 176583, 0, 3010.27, -4983.56, 107.515, 3.17653, 0, 0, -0.999847, 0.0174693, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19234 at 14.484006 yards.
(19227, 176583, 0, 2933.23, -4004.29, 104.741, 1.22173, 0, 0, 0.573576, 0.819152, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 19151 at 14.786998 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(18976, 1268, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Eastern Plaguelands 45 objects total
(19204, 1268, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Eastern Plaguelands 45 objects total
(19030, 1268, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Eastern Plaguelands 45 objects total
(19243, 1268, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Eastern Plaguelands 45 objects total
(19227, 1268, 0, 'Golden Sansam', 0, 10); -- Golden Sansam in Eastern Plaguelands 45 objects total

-- Missing Golden Sansam spawns in Feralas.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(19076, 176583, 1, -3440.09, 1926.25, 41.6386, 6.23083, 0, 0, -0.0261765, 0.999657, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19074 at 10.912366 yards.
(19230, 176583, 1, -4951.82, 1747.18, 65.6505, 5.98648, 0, 0, -0.147809, 0.989016, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19183 at 24.023264 yards.
(19435, 176583, 1, -4491.8, -568.489, 4.83053, 1.02974, 0, 0, 0.492423, 0.870356, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 19143 at 16.602400 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(19076, 1194, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Feralas 17 objects total
(19230, 1194, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Feralas 17 objects total
(19435, 1194, 0, 'Golden Sansam', 0, 10); -- Golden Sansam in Feralas 17 objects total

-- Missing Golden Sansam spawns in Un'Goro Crater.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(19200, 176583, 1, -7746.09, -1525.73, -271.335, 3.85718, 0, 0, -0.936671, 0.35021, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19190 at 13.525796 yards.
(19155, 176583, 1, -7313.65, -2213.45, -271.057, 1.41372, 0, 0, 0.649447, 0.760406, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19097 at 18.561182 yards.
(19259, 176583, 1, -7821.75, -1319.65, -271.669, 0.820303, 0, 0, 0.398748, 0.91706, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19254 at 5.638643 yards.
(19013, 176583, 1, -7158.49, -408.365, -269.859, 3.07177, 0, 0, 0.999391, 0.0349061, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19007 at 6.927489 yards.
(19162, 176583, 1, -6374.37, -1508.72, -269.773, 5.79449, 0, 0, -0.241921, 0.970296, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19101 at 13.326804 yards.
(19260, 176583, 1, -6475.13, -1707.52, -275.624, 0.226892, 0, 0, 0.113203, 0.993572, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19245 at 10.990986 yards.
(19208, 176583, 1, -6743.61, -1848, -272.222, 4.39823, 0, 0, -0.809016, 0.587786, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19142 at 16.513203 yards.
(19389, 176583, 1, -7850.64, -1845.23, -273.153, 1.0472, 0, 0, 0.5, 0.866025, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19246 at 22.847378 yards.
(19062, 176583, 1, -6564.64, -701.637, -268.937, 5.8294, 0, 0, -0.224951, 0.97437, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19019 at 8.554332 yards.
(19428, 176583, 1, -7650.79, -1287.46, -269.252, 4.57276, 0, 0, -0.754709, 0.656059, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 19191 at 48.753635 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(19200, 1214, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Ungoro 94 objects total
(19155, 1214, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Ungoro 94 objects total
(19259, 1214, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Ungoro 94 objects total
(19013, 1214, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Ungoro 94 objects total
(19162, 1214, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Ungoro 94 objects total
(19260, 1214, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Ungoro 94 objects total
(19208, 1214, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Ungoro 94 objects total
(19389, 1214, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Ungoro 94 objects total
(19062, 1214, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Ungoro 94 objects total
(19428, 1214, 0, 'Golden Sansam', 0, 10); -- Golden Sansam in Ungoro 94 objects total

-- Missing Golden Sansam spawns in Silithus.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(19016, 176583, 1, -6663, 838.734, 3.7485, 2.70526, 0, 0, 0.976295, 0.216442, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19012 at 111.280182 yards.
(19071, 176583, 1, -7965.79, 1595, -0.923715, 4.62512, 0, 0, -0.737277, 0.675591, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 19038 at 298.037140 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(19016, 1224, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Silithus 26 objects total
(19071, 1224, 0, 'Golden Sansam', 0, 10); -- Golden Sansam in Silithus 26 objects total

-- Create new pool to hold Golden Sansam spawns in Felwood.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(418, 1, 'Golden Sansams in Felwood', 0, 10);

-- Missing Golden Sansam spawns in Felwood.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(17507, 176638, 1, 6144.64, -1849.78, 568.804, 1.85005, 0, 0, 0.798635, 0.601815, 1800, 1800, 1, 100, 0, 10),
(17510, 176638, 1, 6349.53, -1616.99, 459.913, 2.47837, 0, 0, 0.945518, 0.325568, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 17507 at 328.676483 yards.
(17556, 176638, 1, 6642.61, -1309.63, 458.125, 2.93214, 0, 0, 0.994521, 0.104536, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 17507 at 742.957458 yards.
(17557, 176638, 1, 6216.36, -1397.76, 375.794, 4.18879, 0, 0, -0.866025, 0.500001, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 17507 at 496.707825 yards.
(17558, 176638, 1, 4290.64, -604.054, 289.481, 2.33874, 0, 0, 0.920505, 0.390732, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 17507 at 2251.037842 yards.
(17559, 176638, 1, 6742.92, -1596.08, 477.572, 4.11898, 0, 0, -0.882947, 0.469473, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 17507 at 656.220764 yards.
(17560, 176638, 1, 5554.45, -987.39, 371.665, 5.35816, 0, 0, -0.446198, 0.894935, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 17507 at 1063.439941 yards.
(17561, 176638, 1, 6446.44, -1203.86, 395.012, 4.38078, 0, 0, -0.814116, 0.580703, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 17507 at 733.825256 yards.
(17562, 176638, 1, 4350.72, -951.657, 307.27, 3.90954, 0, 0, -0.927183, 0.374608, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 17507 at 2023.159302 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(17510, 418, 0, 'Golden Sansam', 0, 10), -- Golden Sansams in Felwood
(17556, 418, 0, 'Golden Sansam', 0, 10), -- Golden Sansams in Felwood
(17557, 418, 0, 'Golden Sansam', 0, 10), -- Golden Sansams in Felwood
(17558, 418, 0, 'Golden Sansam', 0, 10), -- Golden Sansams in Felwood
(17559, 418, 0, 'Golden Sansam', 0, 10), -- Golden Sansams in Felwood
(17560, 418, 0, 'Golden Sansam', 0, 10), -- Golden Sansams in Felwood
(17561, 418, 0, 'Golden Sansam', 0, 10), -- Golden Sansams in Felwood
(17562, 418, 0, 'Golden Sansam', 0, 10), -- Golden Sansams in Felwood
(17507, 418, 0, 'Golden Sansam', 0, 10);
-- Correct position of Goldthorn in Arathi Highlands (position is off by 0.636479 yards).
UPDATE `gameobject` SET `position_x`=-1692.98, `position_y`=-2382.04, `position_z`=37.5889, `orientation`=5.74214, `rotation0`=0, `rotation1`=0, `rotation2`=-0.267238, `rotation3`=0.963631 WHERE `guid`=9047;

-- Correct position of Goldthorn in Alterac Mountains (position is off by 1.14574 yards).
UPDATE `gameobject` SET `position_x`=517.737, `position_y`=-703.093, `position_z`=161.284, `orientation`=0.925024, `rotation0`=0, `rotation1`=0, `rotation2`=0.446198, `rotation3`=0.894935 WHERE `guid`=8753;

-- Correct position of Goldthorn in Swamp of Sorrows (position is off by 0.743762 yards).
UPDATE `gameobject` SET `position_x`=-10560.3, `position_y`=-2459.79, `position_z`=28.5932, `orientation`=1.76278, `rotation0`=0, `rotation1`=0, `rotation2`=0.771625, `rotation3`=0.636078 WHERE `guid`=8746;

-- Correct position of Goldthorn in Stranglethorn Vale (position is off by 0.330406 yards).
UPDATE `gameobject` SET `position_x`=-12801.3, `position_y`=-242.125, `position_z`=22.9495, `orientation`=6.16101, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0610485, `rotation3`=0.998135 WHERE `guid`=8894;

-- Correct position of Goldthorn in Alterac Mountains (position is off by 3.73637 yards).
UPDATE `gameobject` SET `position_x`=643.962, `position_y`=-695.862, `position_z`=205.971, `orientation`=4.99164, `rotation0`=0, `rotation1`=0, `rotation2`=-0.601814, `rotation3`=0.798636 WHERE `guid`=9172;

-- Correct position of Goldthorn in Arathi Highlands (position is off by 0.278869 yards).
UPDATE `gameobject` SET `position_x`=-950.858, `position_y`=-2239.76, `position_z`=54.3306, `orientation`=5.88176, `rotation0`=0, `rotation1`=0, `rotation2`=-0.199368, `rotation3`=0.979925 WHERE `guid`=8675;

-- Correct position of Goldthorn in Badlands (position is off by 0.836555 yards).
UPDATE `gameobject` SET `position_x`=-6826.8, `position_y`=-3148.87, `position_z`=261.128, `orientation`=0.0349062, `rotation0`=0, `rotation1`=0, `rotation2`=0.0174522, `rotation3`=0.999848 WHERE `guid`=9189;

-- Correct position of Goldthorn in Badlands (position is off by 2.82231 yards).
UPDATE `gameobject` SET `position_x`=-7041.4, `position_y`=-3283.15, `position_z`=246.536, `orientation`=4.4855, `rotation0`=0, `rotation1`=0, `rotation2`=-0.782608, `rotation3`=0.622515 WHERE `guid`=8888;

-- Correct position of Goldthorn in Badlands (position is off by 0.777714 yards).
UPDATE `gameobject` SET `position_x`=-6641.55, `position_y`=-2623.45, `position_z`=256.692, `orientation`=4.13643, `rotation0`=0, `rotation1`=0, `rotation2`=-0.878817, `rotation3`=0.47716 WHERE `guid`=9130;

-- Correct position of Goldthorn in Arathi Highlands (position is off by 0.42062 yards).
UPDATE `gameobject` SET `position_x`=-1069.87, `position_y`=-1611.4, `position_z`=46.1645, `orientation`=3.35105, `rotation0`=0, `rotation1`=0, `rotation2`=-0.994521, `rotation3`=0.104536 WHERE `guid`=9209;

-- Correct position of Goldthorn in The Hinterlands (position is off by 0.660439 yards).
UPDATE `gameobject` SET `position_x`=42.2495, `position_y`=-3664.66, `position_z`=131.693, `orientation`=6.00393, `rotation0`=0, `rotation1`=0, `rotation2`=-0.139173, `rotation3`=0.990268 WHERE `guid`=9210;

-- Correct position of Goldthorn in Stranglethorn Vale (position is off by 0.335682 yards).
UPDATE `gameobject` SET `position_x`=-12657.1, `position_y`=-45.3199, `position_z`=23.7914, `orientation`=5.25344, `rotation0`=0, `rotation1`=0, `rotation2`=-0.492423, `rotation3`=0.870356 WHERE `guid`=8770;

-- Correct position of Goldthorn in Swamp of Sorrows (position is off by 0.987386 yards).
UPDATE `gameobject` SET `position_x`=-10479.7, `position_y`=-2497.4, `position_z`=33.4731, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=8992;

-- Correct position of Goldthorn in Feralas (position is off by 0.292669 yards).
UPDATE `gameobject` SET `position_x`=-4692.77, `position_y`=1519.28, `position_z`=115.723, `orientation`=3.47321, `rotation0`=0, `rotation1`=0, `rotation2`=-0.986285, `rotation3`=0.16505 WHERE `guid`=9059;

-- Correct position of Goldthorn in Stranglethorn Vale (position is off by 0.299805 yards).
UPDATE `gameobject` SET `position_x`=-13051.7, `position_y`=164.205, `position_z`=40.8736, `orientation`=5.21854, `rotation0`=0, `rotation1`=0, `rotation2`=-0.507538, `rotation3`=0.861629 WHERE `guid`=8756;

-- Correct position of Goldthorn in Swamp of Sorrows (position is off by 2.90716 yards).
UPDATE `gameobject` SET `position_x`=-10588, `position_y`=-2737.17, `position_z`=34.8652, `orientation`=2.26893, `rotation0`=0, `rotation1`=0, `rotation2`=0.906307, `rotation3`=0.422619 WHERE `guid`=8692;

-- Correct position of Goldthorn in Arathi Highlands (position is off by 4.1628 yards).
UPDATE `gameobject` SET `position_x`=-1008.8, `position_y`=-2537.52, `position_z`=59.8594, `orientation`=1.22173, `rotation0`=0, `rotation1`=0, `rotation2`=0.573576, `rotation3`=0.819152 WHERE `guid`=8863;

-- Correct position of Goldthorn in Badlands (position is off by 0.473346 yards).
UPDATE `gameobject` SET `position_x`=-6627.56, `position_y`=-2827.04, `position_z`=255.113, `orientation`=3.194, `rotation0`=0, `rotation1`=0, `rotation2`=-0.999657, `rotation3`=0.0262016 WHERE `guid`=8647;

-- Correct position of Goldthorn in Arathi Highlands (position is off by 0.298276 yards).
UPDATE `gameobject` SET `position_x`=-1194.23, `position_y`=-1973.19, `position_z`=70.4671, `orientation`=2.35619, `rotation0`=0, `rotation1`=0, `rotation2`=0.92388, `rotation3`=0.382683 WHERE `guid`=8711;

-- Correct position of Goldthorn in Arathi Highlands (position is off by 0.456175 yards).
UPDATE `gameobject` SET `position_x`=-1344.72, `position_y`=-2790.36, `position_z`=55.4686, `orientation`=4.17134, `rotation0`=0, `rotation1`=0, `rotation2`=-0.870356, `rotation3`=0.492424 WHERE `guid`=8777;

-- Correct position of Goldthorn in Arathi Highlands (position is off by 1.19245 yards).
UPDATE `gameobject` SET `position_x`=-911.921, `position_y`=-1891.85, `position_z`=71.4452, `orientation`=5.34071, `rotation0`=0, `rotation1`=0, `rotation2`=-0.45399, `rotation3`=0.891007 WHERE `guid`=8754;

-- Correct position of Goldthorn in Alterac Mountains (position is off by 0.928379 yards).
UPDATE `gameobject` SET `position_x`=601.492, `position_y`=-257.09, `position_z`=152.942, `orientation`=2.9845, `rotation0`=0, `rotation1`=0, `rotation2`=0.996917, `rotation3`=0.0784664 WHERE `guid`=8680;

-- Correct position of Goldthorn in Badlands (position is off by 2.46737 yards).
UPDATE `gameobject` SET `position_x`=-7199.49, `position_y`=-2282.15, `position_z`=256.879, `orientation`=1.39626, `rotation0`=0, `rotation1`=0, `rotation2`=0.642787, `rotation3`=0.766045 WHERE `guid`=8814;

-- Correct position of Goldthorn in Swamp of Sorrows (position is off by 0.738364 yards).
UPDATE `gameobject` SET `position_x`=-10591.3, `position_y`=-2884.23, `position_z`=35.5221, `orientation`=3.194, `rotation0`=0, `rotation1`=0, `rotation2`=-0.999657, `rotation3`=0.0262016 WHERE `guid`=9088;

-- Correct position of Goldthorn in Arathi Highlands (position is off by 0.966932 yards).
UPDATE `gameobject` SET `position_x`=-1008.22, `position_y`=-1751.14, `position_z`=46.6344, `orientation`=5.8294, `rotation0`=0, `rotation1`=0, `rotation2`=-0.224951, `rotation3`=0.97437 WHERE `guid`=8820;

-- Correct position of Goldthorn in Arathi Highlands (position is off by 0.481374 yards).
UPDATE `gameobject` SET `position_x`=-1264.6, `position_y`=-2940.26, `position_z`=43.759, `orientation`=6.02139, `rotation0`=0, `rotation1`=0, `rotation2`=-0.130526, `rotation3`=0.991445 WHERE `guid`=8934;

-- Correct position of Goldthorn in Feralas (position is off by 0.505336 yards).
UPDATE `gameobject` SET `position_x`=-3801.2, `position_y`=2052.18, `position_z`=74.8953, `orientation`=4.64258, `rotation0`=0, `rotation1`=0, `rotation2`=-0.731354, `rotation3`=0.681998 WHERE `guid`=8832;

-- Correct position of Goldthorn in Stranglethorn Vale (position is off by 0.4073 yards).
UPDATE `gameobject` SET `position_x`=-13322.3, `position_y`=-30.7243, `position_z`=21.0645, `orientation`=4.36332, `rotation0`=0, `rotation1`=0, `rotation2`=-0.819152, `rotation3`=0.573577 WHERE `guid`=9121;

-- Correct position of Goldthorn in The Hinterlands (position is off by 0.807327 yards).
UPDATE `gameobject` SET `position_x`=-81.7064, `position_y`=-3537.64, `position_z`=120.173, `orientation`=5.75959, `rotation0`=0, `rotation1`=0, `rotation2`=-0.258819, `rotation3`=0.965926 WHERE `guid`=8710;

-- Correct position of Goldthorn in Swamp of Sorrows (position is off by 1.82996 yards).
UPDATE `gameobject` SET `position_x`=-10590.3, `position_y`=-2733.19, `position_z`=34.7039, `orientation`=5.74214, `rotation0`=0, `rotation1`=0, `rotation2`=-0.267238, `rotation3`=0.963631 WHERE `guid`=8692;

-- Correct position of Goldthorn in Stranglethorn Vale (position is off by 2.57969 yards).
UPDATE `gameobject` SET `position_x`=-11602.6, `position_y`=621.821, `position_z`=50.7443, `orientation`=3.31614, `rotation0`=0, `rotation1`=0, `rotation2`=-0.996194, `rotation3`=0.087165 WHERE `guid`=9116;

-- Correct position of Goldthorn in Stranglethorn Vale (position is off by 1.00135 yards).
UPDATE `gameobject` SET `position_x`=-12020, `position_y`=-155.049, `position_z`=41.7223, `orientation`=6.14356, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0697556, `rotation3`=0.997564 WHERE `guid`=8972;

-- Correct position of Goldthorn in Stranglethorn Vale (position is off by 1.15243 yards).
UPDATE `gameobject` SET `position_x`=-13427.6, `position_y`=603.917, `position_z`=42.9791, `orientation`=3.57793, `rotation0`=0, `rotation1`=0, `rotation2`=-0.976295, `rotation3`=0.216442 WHERE `guid`=9217;

-- Correct position of Goldthorn in Swamp of Sorrows (position is off by 0.261614 yards).
UPDATE `gameobject` SET `position_x`=-10101.6, `position_y`=-2908.98, `position_z`=38.0422, `orientation`=4.55531, `rotation0`=0, `rotation1`=0, `rotation2`=-0.760406, `rotation3`=0.649449 WHERE `guid`=8650;

-- Correct position of Goldthorn in Swamp of Sorrows (position is off by 4.00588 yards).
UPDATE `gameobject` SET `position_x`=-10571.5, `position_y`=-3451.2, `position_z`=34.1387, `orientation`=5.14872, `rotation0`=0, `rotation1`=0, `rotation2`=-0.537299, `rotation3`=0.843392 WHERE `guid`=8838;

-- Correct position of Goldthorn in Stranglethorn Vale (position is off by 1.04376 yards).
UPDATE `gameobject` SET `position_x`=-12200.4, `position_y`=-102.249, `position_z`=29.2303, `orientation`=3.76991, `rotation0`=0, `rotation1`=0, `rotation2`=-0.951056, `rotation3`=0.309017 WHERE `guid`=8965;

-- Correct position of Goldthorn in Stranglethorn Vale (position is off by 0.666134 yards).
UPDATE `gameobject` SET `position_x`=-12624, `position_y`=-274.663, `position_z`=27.0946, `orientation`=0.855211, `rotation0`=0, `rotation1`=0, `rotation2`=0.414693, `rotation3`=0.909961 WHERE `guid`=9078;

-- Correct position of Goldthorn in Alterac Mountains (position is off by 4.97938 yards).
UPDATE `gameobject` SET `position_x`=341.735, `position_y`=-795.433, `position_z`=141.415, `orientation`=3.78737, `rotation0`=0, `rotation1`=0, `rotation2`=-0.948323, `rotation3`=0.317306 WHERE `guid`=8851;

-- Correct position of Goldthorn in Stranglethorn Vale (position is off by 1.05508 yards).
UPDATE `gameobject` SET `position_x`=-11872.6, `position_y`=185.119, `position_z`=22.6955, `orientation`=2.80998, `rotation0`=0, `rotation1`=0, `rotation2`=0.986285, `rotation3`=0.16505 WHERE `guid`=9187;

-- Correct position of Goldthorn in Stranglethorn Vale (position is off by 0.300136 yards).
UPDATE `gameobject` SET `position_x`=-12987.7, `position_y`=316.323, `position_z`=31.1341, `orientation`=4.69494, `rotation0`=0, `rotation1`=0, `rotation2`=-0.71325, `rotation3`=0.70091 WHERE `guid`=8861;

-- Missing Goldthorn spawns in Badlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(17579, 2046, 0, -6921.44, -3104.99, 258.261, 1.27409, 0, 0, 0.594822, 0.803857, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8831 at 5.921994 yards.
(17581, 2046, 0, -6858.53, -3330.96, 245.336, 2.51327, 0, 0, 0.951056, 0.309017, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 8804 at 36.580170 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(17579, 1283, 0, 'Goldthorn', 0, 10), -- Goldthorn in Badlands 41 objects total
(17581, 1283, 0, 'Goldthorn', 0, 10); -- Goldthorn in Badlands 41 objects total

-- Missing Goldthorn spawns in Swamp of Sorrows.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(17672, 2046, 0, -10315.6, -2560.88, 32.842, 4.66003, 0, 0, -0.725374, 0.688355, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9065 at 6.709442 yards.
(17673, 2046, 0, -9818.33, -3718.11, 34.2834, 3.29869, 0, 0, -0.996917, 0.0784664, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8671 at 9.350371 yards.
(17674, 2046, 0, -10056.8, -2434.46, 32.7377, 5.51524, 0, 0, -0.374606, 0.927184, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8722 at 18.581739 yards.
(17675, 2046, 0, -10237.9, -2486.51, 38.0978, 1.39626, 0, 0, 0.642787, 0.766045, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9067 at 11.843241 yards.
(17677, 2046, 0, -10264.7, -2575.17, 40.6938, 4.45059, 0, 0, -0.793353, 0.608762, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9022 at 13.749869 yards.
(17678, 2046, 0, -10201.9, -2711.19, 29.335, 1.3439, 0, 0, 0.622514, 0.782609, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9136 at 11.775500 yards.
(17683, 2046, 0, -10325.4, -2475.95, 39.1077, 5.34071, 0, 0, -0.45399, 0.891007, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 8815 at 12.750734 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(17672, 1313, 0, 'Goldthorn', 0, 10), -- Goldthorn in Swamp of Sorrows (2) 56 objects total
(17673, 1308, 0, 'Goldthorn', 0, 10), -- Goldthorn in Swamp of Sorrows (1) 34 objects total
(17674, 1313, 0, 'Goldthorn', 0, 10), -- Goldthorn in Swamp of Sorrows (2) 56 objects total
(17675, 1313, 0, 'Goldthorn', 0, 10), -- Goldthorn in Swamp of Sorrows (2) 56 objects total
(17677, 1313, 0, 'Goldthorn', 0, 10), -- Goldthorn in Swamp of Sorrows (2) 56 objects total
(17678, 1313, 0, 'Goldthorn', 0, 10), -- Goldthorn in Swamp of Sorrows (2) 56 objects total
(17683, 1313, 0, 'Goldthorn', 0, 10); -- Goldthorn in Swamp of Sorrows (2) 56 objects total

-- Missing Goldthorn spawns in Dustwallow Marsh.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(56128, 2046, 1, -2472.02, -2875.58, 44.545, 4.38078, 0, 0, -0.814116, 0.580703, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 55947 at 462.477509 yards.
(17574, 2046, 1, -4222.87, -2760.22, 44.6807, 2.07694, 0, 0, 0.861629, 0.507539, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 13640 at 277.294250 yards.
(17582, 2046, 1, -2414.11, -4040.26, 16.5305, 5.18363, 0, 0, -0.522498, 0.85264, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 11764 at 291.567719 yards.
(40825, 2046, 1, -3639.01, -3525.38, 63.3026, 3.15906, 0, 0, -0.999962, 0.00873464, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 40824 at 28.192598 yards.
(56129, 2046, 1, -2647, -4289.55, 19.7775, 1.25664, 0, 0, 0.587785, 0.809017, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 55968 at 318.701111 yards.
(56130, 2046, 1, -2709.08, -2784.29, 65.9484, 2.84488, 0, 0, 0.989016, 0.147811, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 55947 at 208.796494 yards.
(17660, 2046, 1, -3133.07, -3684.59, 51.8294, 5.14872, 0, 0, -0.537299, 0.843392, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 14928 at 146.613586 yards.
(17664, 2046, 1, -2586.54, -3957.19, 19.2201, 2.93214, 0, 0, 0.994521, 0.104536, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 11764 at 101.573616 yards.
(40826, 2046, 1, -3570.55, -3437.41, 56.9542, 0.628317, 0, 0, 0.309016, 0.951057, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 40824 at 138.740845 yards.
(56131, 2046, 1, -3013.39, -3516.39, 75.8011, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 55994 at 143.628662 yards.
(17676, 2046, 1, -2558.18, -3757.4, 36.4821, 1.46608, 0, 0, 0.66913, 0.743145, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 11764 at 188.045425 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(56128, 1103, 0, 'Goldthorn', 0, 10), -- Goldthorn in Dustwallow Marsh 9 objects total
(17574, 1103, 0, 'Goldthorn', 0, 10), -- Goldthorn in Dustwallow Marsh 9 objects total
(17582, 1103, 0, 'Goldthorn', 0, 10), -- Goldthorn in Dustwallow Marsh 9 objects total
(40825, 1103, 0, 'Goldthorn', 0, 10), -- Goldthorn in Dustwallow Marsh 9 objects total
(56129, 1103, 0, 'Goldthorn', 0, 10), -- Goldthorn in Dustwallow Marsh 9 objects total
(56130, 1103, 0, 'Goldthorn', 0, 10), -- Goldthorn in Dustwallow Marsh 9 objects total
(17660, 1103, 0, 'Goldthorn', 0, 10), -- Goldthorn in Dustwallow Marsh 9 objects total
(17664, 1103, 0, 'Goldthorn', 0, 10), -- Goldthorn in Dustwallow Marsh 9 objects total
(40826, 1103, 0, 'Goldthorn', 0, 10), -- Goldthorn in Dustwallow Marsh 9 objects total
(56131, 1103, 0, 'Goldthorn', 0, 10), -- Goldthorn in Dustwallow Marsh 9 objects total
(17676, 1103, 0, 'Goldthorn', 0, 10); -- Goldthorn in Dustwallow Marsh 9 objects total

-- Missing Goldthorn spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(29279, 2046, 0, -12776.1, 269.979, 16.8659, 4.10153, 0, 0, -0.887011, 0.461749, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 29253 at 167.963303 yards.
(17662, 2046, 0, -12652.4, -763.995, 57.6516, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8879 at 21.161846 yards.
(30813, 2046, 0, -12103.3, -795.352, 45.2794, 2.9845, 0, 0, 0.996917, 0.0784664, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 30807 at 103.261368 yards.
(17682, 2046, 0, -12034.3, 138.011, 18.8933, 4.50295, 0, 0, -0.777145, 0.629321, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8810 at 80.805298 yards.
(17691, 2046, 0, -12773.8, -215.173, 37.9271, 0.0698117, 0, 0, 0.0348988, 0.999391, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8894 at 41.057068 yards.
(17695, 2046, 0, -13646.9, 350.781, 50.8679, 6.17847, 0, 0, -0.0523357, 0.99863, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8945 at 225.619690 yards.
(17696, 2046, 0, -12165.6, -532.823, 31.4166, 2.26893, 0, 0, 0.906307, 0.422619, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8900 at 69.558075 yards.
(17697, 2046, 0, -12520.5, -719.582, 40.9531, 0.820303, 0, 0, 0.398748, 0.91706, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 8761 at 100.215897 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(29279, 1174, 0, 'Goldthorn', 0, 10), -- Goldthorn in Stranglethorn 184 objects total
(17662, 1174, 0, 'Goldthorn', 0, 10), -- Goldthorn in Stranglethorn 184 objects total
(30813, 1174, 0, 'Goldthorn', 0, 10), -- Goldthorn in Stranglethorn 184 objects total
(17682, 1174, 0, 'Goldthorn', 0, 10), -- Goldthorn in Stranglethorn 184 objects total
(17691, 1174, 0, 'Goldthorn', 0, 10), -- Goldthorn in Stranglethorn 184 objects total
(17695, 1174, 0, 'Goldthorn', 0, 10), -- Goldthorn in Stranglethorn 184 objects total
(17696, 1174, 0, 'Goldthorn', 0, 10), -- Goldthorn in Stranglethorn 184 objects total
(17697, 1174, 0, 'Goldthorn', 0, 10); -- Goldthorn in Stranglethorn 184 objects total

-- Missing Goldthorn spawns in Alterac Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(35407, 2046, 0, 778.003, -343.424, 150.982, 5.84685, 0, 0, -0.216439, 0.976296, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 35390 at 94.080551 yards.
(17565, 2046, 0, 874.433, -211.295, 133.795, 4.15388, 0, 0, -0.874619, 0.48481, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9010 at 5.218170 yards.
(17566, 2046, 0, 926.029, -279.575, 145, 3.17653, 0, 0, -0.999847, 0.0174693, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9008 at 24.042830 yards.
(17583, 2046, 0, 604.806, -744.798, 176.252, 5.49779, 0, 0, -0.382683, 0.92388, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9004 at 9.964529 yards.
(17643, 2046, 0, 381.352, -626.85, 162.435, 5.41052, 0, 0, -0.422618, 0.906308, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8867 at 8.378616 yards.
(17645, 2046, 0, 405.361, -570.059, 167.804, 4.15388, 0, 0, -0.874619, 0.48481, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9213 at 5.142447 yards.
(17692, 2046, 0, 1163.05, -317.217, 49.2065, 6.07375, 0, 0, -0.104528, 0.994522, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 8635 at 15.600609 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(35407, 1058, 0, 'Goldthorn', 0, 10), -- Goldthorn in Alterac 81 objects total
(17565, 1058, 0, 'Goldthorn', 0, 10), -- Goldthorn in Alterac 81 objects total
(17566, 1058, 0, 'Goldthorn', 0, 10), -- Goldthorn in Alterac 81 objects total
(17583, 1058, 0, 'Goldthorn', 0, 10), -- Goldthorn in Alterac 81 objects total
(17643, 1058, 0, 'Goldthorn', 0, 10), -- Goldthorn in Alterac 81 objects total
(17645, 1058, 0, 'Goldthorn', 0, 10), -- Goldthorn in Alterac 81 objects total
(17692, 1058, 0, 'Goldthorn', 0, 10); -- Goldthorn in Alterac 81 objects total

-- Missing Goldthorn spawns in Arathi Highlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(17563, 2046, 0, -1299.32, -2316.38, 61.1865, 5.77704, 0, 0, -0.25038, 0.968148, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8615 at 110.083046 yards.
(17564, 2046, 0, -1195.1, -3645.17, 61.0922, 3.64774, 0, 0, -0.968147, 0.250381, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9163 at 164.421387 yards.
(17567, 2046, 0, -891.027, -3056.27, 90.9899, 3.47321, 0, 0, -0.986285, 0.16505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9094 at 31.861742 yards.
(17568, 2046, 0, -843.388, -1725.92, 58.0707, 2.54818, 0, 0, 0.956305, 0.292372, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8790 at 24.342508 yards.
(17569, 2046, 0, -678.993, -2016.39, 59.6948, 1.3439, 0, 0, 0.622514, 0.782609, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8652 at 13.327578 yards.
(17570, 2046, 0, -804.534, -3596.95, 78.1736, 5.28835, 0, 0, -0.477159, 0.878817, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8785 at 21.221725 yards.
(17571, 2046, 0, -1968.88, -2554.31, 75.2514, 0.802851, 0, 0, 0.390731, 0.920505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9178 at 126.943016 yards.
(17572, 2046, 0, -1274.86, -1488.95, 62.0622, 0.680677, 0, 0, 0.333806, 0.942642, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9106 at 20.988035 yards.
(17573, 2046, 0, -1645.62, -1495.3, 49.6567, 0.453785, 0, 0, 0.224951, 0.97437, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8870 at 16.766769 yards.
(17576, 2046, 0, -1854.84, -1542.01, 64.4842, 2.80998, 0, 0, 0.986285, 0.16505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8982 at 6.692545 yards.
(17577, 2046, 0, -975.522, -3707.89, 99.7785, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8954 at 11.640817 yards.
(17578, 2046, 0, -1853.14, -2781.02, 62.6143, 6.14356, 0, 0, -0.0697556, 0.997564, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8818 at 11.532467 yards.
(17580, 2046, 0, -2069.82, -2537.25, 80.8448, 4.01426, 0, 0, -0.906307, 0.422619, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16918 at 137.660370 yards.
(17647, 2046, 0, -793.96, -3207.02, 87.3358, 3.57793, 0, 0, -0.976295, 0.216442, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8909 at 9.935187 yards.
(17658, 2046, 0, -1789.37, -2527.05, 59.8264, 1.29154, 0, 0, 0.601814, 0.798636, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6985 at 124.924667 yards.
(17686, 2046, 0, -806.16, -3584.53, 81.9184, 2.67035, 0, 0, 0.972369, 0.233448, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 8785 at 19.544758 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(17563, 1181, 0, 'Goldthorn', 0, 10), -- Goldthorn in Arathi 120 objects total
(17564, 1181, 0, 'Goldthorn', 0, 10), -- Goldthorn in Arathi 120 objects total
(17567, 1181, 0, 'Goldthorn', 0, 10), -- Goldthorn in Arathi 120 objects total
(17568, 1181, 0, 'Goldthorn', 0, 10), -- Goldthorn in Arathi 120 objects total
(17569, 1181, 0, 'Goldthorn', 0, 10), -- Goldthorn in Arathi 120 objects total
(17570, 1181, 0, 'Goldthorn', 0, 10), -- Goldthorn in Arathi 120 objects total
(17571, 1181, 0, 'Goldthorn', 0, 10), -- Goldthorn in Arathi 120 objects total
(17572, 1181, 0, 'Goldthorn', 0, 10), -- Goldthorn in Arathi 120 objects total
(17573, 1181, 0, 'Goldthorn', 0, 10), -- Goldthorn in Arathi 120 objects total
(17576, 1181, 0, 'Goldthorn', 0, 10), -- Goldthorn in Arathi 120 objects total
(17577, 1181, 0, 'Goldthorn', 0, 10), -- Goldthorn in Arathi 120 objects total
(17578, 1181, 0, 'Goldthorn', 0, 10), -- Goldthorn in Arathi 120 objects total
(17580, 1181, 0, 'Goldthorn', 0, 10), -- Goldthorn in Arathi 120 objects total
(17647, 1181, 0, 'Goldthorn', 0, 10), -- Goldthorn in Arathi 120 objects total
(17658, 1181, 0, 'Goldthorn', 0, 10), -- Goldthorn in Arathi 120 objects total
(17686, 1181, 0, 'Goldthorn', 0, 10); -- Goldthorn in Arathi 120 objects total

-- Missing Goldthorn spawns in The Hinterlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(17680, 2046, 0, 213.36, -3447.47, 152.571, 3.61284, 0, 0, -0.972369, 0.233448, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8973 at 32.409969 yards.
(17681, 2046, 0, 461.521, -3311.35, 123.003, 3.00195, 0, 0, 0.997563, 0.0697661, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8672 at 32.715691 yards.
(17685, 2046, 0, 120.831, -4352.99, 121.36, 2.35619, 0, 0, 0.92388, 0.382683, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8868 at 14.838820 yards.
(17688, 2046, 0, -230.018, -4438.47, 20.1907, 2.86234, 0, 0, 0.990268, 0.139175, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8889 at 188.090881 yards.
(17689, 2046, 0, -9.83615, -4469.2, 155.765, 0.244346, 0, 0, 0.121869, 0.992546, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9054 at 25.847752 yards.
(17693, 2046, 0, -412.539, -2738.74, 110.711, 1.81514, 0, 0, 0.788011, 0.615662, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8886 at 107.736961 yards.
(17694, 2046, 0, -338.307, -3010.14, 99.9366, 0.628317, 0, 0, 0.309016, 0.951057, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 9100 at 21.498421 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(17680, 1249, 0, 'Goldthorn', 0, 10), -- Goldthron in Hinterlands 50 objects total
(17681, 1249, 0, 'Goldthorn', 0, 10), -- Goldthron in Hinterlands 50 objects total
(17685, 1249, 0, 'Goldthorn', 0, 10), -- Goldthron in Hinterlands 50 objects total
(17688, 1249, 0, 'Goldthorn', 0, 10), -- Goldthron in Hinterlands 50 objects total
(17689, 1249, 0, 'Goldthorn', 0, 10), -- Goldthron in Hinterlands 50 objects total
(17693, 1249, 0, 'Goldthorn', 0, 10), -- Goldthron in Hinterlands 50 objects total
(17694, 1249, 0, 'Goldthorn', 0, 10); -- Goldthron in Hinterlands 50 objects total

-- Missing Goldthorn spawns in Feralas.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(50360, 2046, 1, -3552.46, 2371.1, 79.5589, 1.23918, 0, 0, 0.580703, 0.814116, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 50248 at 63.139923 yards.
(17575, 2046, 1, -4025.22, 2287.75, 24.822, 0.0523589, 0, 0, 0.0261765, 0.999657, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8832 at 328.747314 yards.
(50361, 2046, 1, -4001.88, 1937.13, 105.72, 5.67232, 0, 0, -0.300705, 0.953717, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 50240 at 9.912003 yards.
(17650, 2046, 1, -3999.66, 219.765, 75.7146, 4.29351, 0, 0, -0.83867, 0.54464, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9195 at 137.450439 yards.
(17652, 2046, 1, -4755.83, 708.226, 71.9197, 3.14159, 0, 0, -1, 0, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8641 at 241.777466 yards.
(17654, 2046, 1, -5524.98, 1042.34, 124.109, 3.87463, 0, 0, -0.93358, 0.358368, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7021 at 184.809265 yards.
(50362, 2046, 1, -4782.09, 1235.58, 115.628, 0.349065, 0, 0, 0.173648, 0.984808, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 50246 at 163.565826 yards.
(17656, 2046, 1, -4738.59, 823.524, 141.484, 3.42085, 0, 0, -0.990268, 0.139175, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8641 at 120.533165 yards.
(50363, 2046, 1, -3028.14, 2512.9, 55.2185, 2.19911, 0, 0, 0.891006, 0.453991, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 50253 at 306.510620 yards.
(50364, 2046, 1, -4951.97, 172.805, 67.5288, 5.32326, 0, 0, -0.461748, 0.887011, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 50238 at 131.881088 yards.
(17665, 2046, 1, -5125.62, 1134.26, 92.5124, 5.3058, 0, 0, -0.469471, 0.882948, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7021 at 300.363556 yards.
(17679, 2046, 1, -5815.48, 1328.89, 73.17, 2.58308, 0, 0, 0.961261, 0.27564, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7032 at 131.683502 yards.
(50365, 2046, 1, -2877.14, 2099.61, 53.0593, 3.78737, 0, 0, -0.948323, 0.317306, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 50255 at 610.341370 yards.
(17684, 2046, 1, -5543.7, 1106.71, 69.3718, 1.53589, 0, 0, 0.694658, 0.71934, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7021 at 145.083206 yards.
(17687, 2046, 1, -5849.93, 1498.83, 86.9555, 1.62316, 0, 0, 0.725374, 0.688355, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7032 at 289.275391 yards.
(50387, 2046, 1, -3082.83, 2815.37, 94.9709, 5.79449, 0, 0, -0.241921, 0.970296, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 50253 at 287.595093 yards.
(50388, 2046, 1, -3519.65, 2754.67, 96.079, 3.17653, 0, 0, -0.999847, 0.0174693, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 50254 at 130.605957 yards.
(17690, 2046, 1, -4935.56, 1175.7, 75.7224, 4.90438, 0, 0, -0.636078, 0.771625, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 8641 at 294.374603 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(50360, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(17575, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(50361, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(17650, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(17652, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(17654, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(50362, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(17656, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(50363, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(50364, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(17665, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(17679, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(50365, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(17684, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(17687, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(50387, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(50388, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(17690, 1191, 0, 'Goldthorn', 0, 10); -- Goldthorn in Feralas 26 objects total

-- Guid 18676 should be part of pool Grave Moss (x13) - Kodo Graveyard (107).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (18676, 107, 0, 'Grave Moss', 0, 10);

-- Guid 18677 should be part of pool Grave Moss (x13) - Kodo Graveyard (107).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (18677, 107, 0, 'Grave Moss', 0, 10);

-- Guid 18680 should be part of pool Grave Moss (x13) - Kodo Graveyard (107).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (18680, 107, 0, 'Grave Moss', 0, 10);

-- Create new pool to hold Grave Moss spawns in Eastern Plaguelands.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(419, 1, 'Grave Mosss in Eastern Plaguelands', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(33336, 419, 0, 'Grave Moss', 0, 10);

-- Correct position of Grave Moss in The Barrens (position is off by 1.84061 yards).
UPDATE `gameobject` SET `position_x`=-3996.27, `position_y`=-1861.18, `position_z`=91.7213, `orientation`=0.418879, `rotation0`=0, `rotation1`=0, `rotation2`=0.207911, `rotation3`=0.978148 WHERE `guid`=4442;

-- Correct position of Grave Moss in Desolace (position is off by 0.88363 yards).
UPDATE `gameobject` SET `position_x`=-1243.92, `position_y`=1856.61, `position_z`=50.1459, `orientation`=5.95157, `rotation0`=0, `rotation1`=0, `rotation2`=-0.165047, `rotation3`=0.986286 WHERE `guid`=4437;

-- Correct position of Grave Moss in Duskwood (position is off by 1.37584 yards).
UPDATE `gameobject` SET `position_x`=-10442.8, `position_y`=221.964, `position_z`=31.7509, `orientation`=2.37364, `rotation0`=0, `rotation1`=0, `rotation2`=0.927183, `rotation3`=0.374608 WHERE `guid`=4452;

-- Correct position of Grave Moss in Arathi Highlands (position is off by 1.26648 yards).
UPDATE `gameobject` SET `position_x`=-1500.25, `position_y`=-1885.15, `position_z`=68.4893, `orientation`=0.680677, `rotation0`=0, `rotation1`=0, `rotation2`=0.333806, `rotation3`=0.942642 WHERE `guid`=4469;

-- Correct position of Grave Moss in Alterac Mountains (position is off by 1.11913 yards).
UPDATE `gameobject` SET `position_x`=479.536, `position_y`=-309.049, `position_z`=155.839, `orientation`=4.34587, `rotation0`=0, `rotation1`=0, `rotation2`=-0.824126, `rotation3`=0.566406 WHERE `guid`=4445;

-- Correct position of Grave Moss in Duskwood (position is off by 1.36779 yards).
UPDATE `gameobject` SET `position_x`=-10385.9, `position_y`=386.973, `position_z`=47.0414, `orientation`=5.06146, `rotation0`=0, `rotation1`=0, `rotation2`=-0.573576, `rotation3`=0.819152 WHERE `guid`=4465;

-- Missing Grave Moss spawns in Duskwood.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(17708, 1628, 0, -10547, 269.901, 28.4756, 4.59022, 0, 0, -0.748956, 0.66262, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4461 at 13.151790 yards.
(17709, 1628, 0, -10344.9, 227.065, 32.6557, 4.15388, 0, 0, -0.874619, 0.48481, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4447 at 10.998572 yards.
(17710, 1628, 0, -11007.5, -1295.47, 53.5987, 5.21854, 0, 0, -0.507538, 0.861629, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4440 at 8.845914 yards.
(17711, 1628, 0, -10539.9, 442.972, 38.0475, 1.22173, 0, 0, 0.573576, 0.819152, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 4485 at 14.838125 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(17708, 105, 0, 'Grave Moss', 0, 10), -- Grave Moss (x27) - Raven Hill
(17709, 105, 0, 'Grave Moss', 0, 10), -- Grave Moss (x27) - Raven Hill
(17710, 106, 0, 'Grave Moss', 0, 10), -- Grave Moss (x6) - Tranquil Gardens
(17711, 105, 0, 'Grave Moss', 0, 10); -- Grave Moss (x27) - Raven Hill

-- Missing Grave Moss spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(17706, 1628, 0, -2851.66, -2234.82, 16.3133, 5.86431, 0, 0, -0.207911, 0.978148, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 4456 at 16.781769 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(17706, 1148, 0, 'Grave Moss', 0, 10); -- Grave Moss in Wetlands 15 objects total

-- Missing Grave Moss spawns in Alterac Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(17704, 1628, 0, 493.417, -306.911, 153.738, 5.65487, 0, 0, -0.309016, 0.951057, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 4444 at 10.689419 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(17704, 1060, 0, 'Grave Moss', 0, 10); -- Grave Moss in Alterac 7 objects total

-- Missing Grave Moss spawns in Arathi Highlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(17702, 1628, 0, -1517.81, -1918.35, 68.7376, 2.32129, 0, 0, 0.91706, 0.39875, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4464 at 5.861720 yards.
(17705, 1628, 0, -1497.07, -1835.2, 68.4011, 1.48353, 0, 0, 0.67559, 0.737278, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 4449 at 11.842237 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(17702, 104, 0, 'Grave Moss', 0, 10), -- Grave Moss (x7) - Stromgarde
(17705, 104, 0, 'Grave Moss', 0, 10); -- Grave Moss (x7) - Stromgarde

-- Missing Grave Moss spawns in Eastern Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(33346, 1628, 0, 1602.21, -3239.35, 66.8794, 4.46804, 0, 0, -0.788011, 0.615662, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 33336 at 27.901777 yards.
(33355, 1628, 0, 1619.87, -3271.2, 88.1834, 4.86947, 0, 0, -0.649447, 0.760406, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 33336 at 35.080940 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(33346, 419, 0, 'Grave Moss', 0, 10), -- Grave Mosss in Eastern Plaguelands
(33355, 419, 0, 'Grave Moss', 0, 10); -- Grave Mosss in Eastern Plaguelands

-- Missing Grave Moss spawns in Desolace.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(17698, 1628, 1, -1299.83, 1942.04, 51.1616, 5.88176, 0, 0, -0.199368, 0.979925, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4487 at 5.888136 yards.
(17699, 1628, 1, -1599.25, 1376.42, 61.2987, 2.19911, 0, 0, 0.891006, 0.453991, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4481 at 433.997955 yards.
(18877, 1628, 1, -1342.52, 963.65, 91.5162, 2.16421, 0, 0, 0.882947, 0.469473, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 18676 at 331.919250 yards.
(17700, 1628, 1, -1158.39, 2254.16, 92.2791, 2.56563, 0, 0, 0.958819, 0.284016, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4499 at 257.957367 yards.
(17701, 1628, 1, -1307.94, 2046.85, 50.1442, 4.01426, 0, 0, -0.906307, 0.422619, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4499 at 20.791868 yards.
(17703, 1628, 1, -1402.27, 1831.51, 50.1442, 4.18879, 0, 0, -0.866025, 0.500001, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4477 at 7.134086 yards.
(18878, 1628, 1, -631.91, 1516.65, 89.813, 4.83456, 0, 0, -0.66262, 0.748956, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 18676 at 653.399292 yards.
(17707, 1628, 1, -647.017, 1758.21, 89.8061, 4.76475, 0, 0, -0.688354, 0.725374, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4437 at 606.480042 yards.
(18879, 1628, 1, -982.668, 2446.35, 94.8709, 5.21854, 0, 0, -0.507538, 0.861629, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 18680 at 208.852051 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(17698, 107, 0, 'Grave Moss', 0, 10), -- Grave Moss (x13) - Kodo Graveyard
(17699, 107, 0, 'Grave Moss', 0, 10), -- Grave Moss (x13) - Kodo Graveyard
(17700, 107, 0, 'Grave Moss', 0, 10), -- Grave Moss (x13) - Kodo Graveyard
(17701, 107, 0, 'Grave Moss', 0, 10), -- Grave Moss (x13) - Kodo Graveyard
(17703, 107, 0, 'Grave Moss', 0, 10), -- Grave Moss (x13) - Kodo Graveyard
(17707, 107, 0, 'Grave Moss', 0, 10), -- Grave Moss (x13) - Kodo Graveyard
(18879, 107, 0, 'Grave Moss', 0, 10); -- Grave Moss (x13) - Kodo Graveyard

-- Guid 17698 should be part of pool Grave Moss (x13) - Kodo Graveyard (107).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (17698, 107, 0, 'Grave Moss', 0, 10);

-- Guid 17699 should be part of pool Grave Moss (x13) - Kodo Graveyard (107).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (17699, 107, 0, 'Grave Moss', 0, 10);

-- Guid 17700 should be part of pool Grave Moss (x13) - Kodo Graveyard (107).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (17700, 107, 0, 'Grave Moss', 0, 10);

-- Guid 17701 should be part of pool Grave Moss (x13) - Kodo Graveyard (107).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (17701, 107, 0, 'Grave Moss', 0, 10);

-- Guid 17703 should be part of pool Grave Moss (x13) - Kodo Graveyard (107).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (17703, 107, 0, 'Grave Moss', 0, 10);

-- Guid 18877 should be part of pool Grave Moss (x13) - Kodo Graveyard (107).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (18877, 107, 0, 'Grave Moss', 0, 10);

-- Guid 18878 should be part of pool Grave Moss (x13) - Kodo Graveyard (107).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (18878, 107, 0, 'Grave Moss', 0, 10);


-- Correct position of Gromsblood in Desolace (position is off by 0.349976 yards).
UPDATE `gameobject` SET `position_x`=-1757.35, `position_y`=1973.41, `position_z`=62.1494, `orientation`=3.85718, `rotation0`=0, `rotation1`=0, `rotation2`=-0.936671, `rotation3`=0.35021 WHERE `guid`=16544;

-- Correct position of Gromsblood in Blasted Lands (position is off by 0.713928 yards).
UPDATE `gameobject` SET `position_x`=-11068.4, `position_y`=-3137.59, `position_z`=45.7823, `orientation`=0.471238, `rotation0`=0, `rotation1`=0, `rotation2`=0.233445, `rotation3`=0.97237 WHERE `guid`=16454;

-- Correct position of Gromsblood in Desolace (position is off by 1.00904 yards).
UPDATE `gameobject` SET `position_x`=-1750.69, `position_y`=1685.46, `position_z`=61.1134, `orientation`=4.53786, `rotation0`=0, `rotation1`=0, `rotation2`=-0.766044, `rotation3`=0.642789 WHERE `guid`=16539;

-- Correct position of Gromsblood in Blasted Lands (position is off by 0.616224 yards).
UPDATE `gameobject` SET `position_x`=-11264.6, `position_y`=-2726.9, `position_z`=11.6191, `orientation`=4.34587, `rotation0`=0, `rotation1`=0, `rotation2`=-0.824126, `rotation3`=0.566406 WHERE `guid`=16499;

-- Correct position of Gromsblood in Blasted Lands (position is off by 4.72832 yards).
UPDATE `gameobject` SET `position_x`=-11710.5, `position_y`=-3100.65, `position_z`=15.1948, `orientation`=0.366518, `rotation0`=0, `rotation1`=0, `rotation2`=0.182235, `rotation3`=0.983255 WHERE `guid`=32304;

-- Correct position of Gromsblood in Blasted Lands (position is off by 0.648481 yards).
UPDATE `gameobject` SET `position_x`=-11214.9, `position_y`=-2946.36, `position_z`=9.6068, `orientation`=3.75246, `rotation0`=0, `rotation1`=0, `rotation2`=-0.953716, `rotation3`=0.300708 WHERE `guid`=16479;

-- Correct position of Gromsblood in Blasted Lands (position is off by 1.13314 yards).
UPDATE `gameobject` SET `position_x`=-11515.9, `position_y`=-2783.26, `position_z`=0.843735, `orientation`=5.95157, `rotation0`=0, `rotation1`=0, `rotation2`=-0.165047, `rotation3`=0.986286 WHERE `guid`=16453;

-- Correct position of Gromsblood in Blasted Lands (position is off by 3.12921 yards).
UPDATE `gameobject` SET `position_x`=-11732, `position_y`=-3298.92, `position_z`=9.4208, `orientation`=2.65289, `rotation0`=0, `rotation1`=0, `rotation2`=0.970295, `rotation3`=0.241925 WHERE `guid`=32106;

-- Correct position of Gromsblood in Blasted Lands (position is off by 0.665999 yards).
UPDATE `gameobject` SET `position_x`=-11686.6, `position_y`=-2854.75, `position_z`=3.78871, `orientation`=1.83259, `rotation0`=0, `rotation1`=0, `rotation2`=0.793353, `rotation3`=0.608762 WHERE `guid`=16497;

-- Correct position of Gromsblood in Blasted Lands (position is off by 0.307748 yards).
UPDATE `gameobject` SET `position_x`=-10915.8, `position_y`=-2889.21, `position_z`=12.7667, `orientation`=3.29869, `rotation0`=0, `rotation1`=0, `rotation2`=-0.996917, `rotation3`=0.0784664 WHERE `guid`=16472;

-- Correct position of Gromsblood in Blasted Lands (position is off by 0.865478 yards).
UPDATE `gameobject` SET `position_x`=-11426.8, `position_y`=-3023.33, `position_z`=1.12268, `orientation`=3.15906, `rotation0`=0, `rotation1`=0, `rotation2`=-0.999962, `rotation3`=0.00873464 WHERE `guid`=16503;

-- Correct position of Gromsblood in Blasted Lands (position is off by 0.667978 yards).
UPDATE `gameobject` SET `position_x`=-11010.6, `position_y`=-2749.53, `position_z`=4.65064, `orientation`=2.63544, `rotation0`=0, `rotation1`=0, `rotation2`=0.968147, `rotation3`=0.250381 WHERE `guid`=16450;

-- Correct position of Gromsblood in Blasted Lands (position is off by 0.938291 yards).
UPDATE `gameobject` SET `position_x`=-11451.1, `position_y`=-2646.92, `position_z`=22.7724, `orientation`=0.872664, `rotation0`=0, `rotation1`=0, `rotation2`=0.422618, `rotation3`=0.906308 WHERE `guid`=16463;

-- Missing Gromsblood spawns in Blasted Lands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(17719, 142145, 0, -11813.1, -3189.12, -30.6491, 4.5204, 0, 0, -0.771625, 0.636078, 45, 90, 1, 100, 0, 10), -- Closest existing guid is 16521 at 54.823219 yards.
(17720, 142145, 0, -11688.5, -3211.32, 11.8707, 5.2709, 0, 0, -0.484809, 0.87462, 45, 90, 1, 100, 0, 10), -- Closest existing guid is 16526 at 28.892799 yards.
(17721, 142145, 0, -11373.2, -3043.34, -4.55977, 5.74214, 0, 0, -0.267238, 0.963631, 45, 90, 1, 100, 0, 10), -- Closest existing guid is 16503 at 56.868797 yards.
(32759, 142145, 0, -11255, -3132.8, 2.85068, 5.39307, 0, 0, -0.430511, 0.902586, 45, 90, 1, 100, 0, 10), -- Closest existing guid is 32758 at 149.933624 yards.
(17723, 142145, 0, -11872.9, -3162.18, -26.6012, 0.733038, 0, 0, 0.358368, 0.93358, 45, 90, 1, 100, 0, 10), -- Closest existing guid is 16521 at 113.927536 yards.
(35309, 142145, 0, -11365.7, -3225.41, 9.86462, 4.97419, 0, 0, -0.608761, 0.793354, 45, 90, 1, 100, 0, 10); -- Closest existing guid is 35307 at 176.616379 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(17719, 1275, 0, 'Gromsblood', 0, 10), -- Gromsblood in Blasted Lands 26 objects total
(17720, 1275, 0, 'Gromsblood', 0, 10), -- Gromsblood in Blasted Lands 26 objects total
(17721, 1275, 0, 'Gromsblood', 0, 10), -- Gromsblood in Blasted Lands 26 objects total
(32759, 1275, 0, 'Gromsblood', 0, 10), -- Gromsblood in Blasted Lands 26 objects total
(17723, 1275, 0, 'Gromsblood', 0, 10), -- Gromsblood in Blasted Lands 26 objects total
(35309, 1275, 0, 'Gromsblood', 0, 10); -- Gromsblood in Blasted Lands 26 objects total

-- Missing Gromsblood spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(17722, 142145, 1, 2049.3, -3138.72, 102.235, 1.91986, 0, 0, 0.819152, 0.573577, 45, 90, 1, 100, 0, 10), -- Closest existing guid is 16457 at 102.232574 yards.
(17724, 142145, 1, 1953.24, -3148.67, 100.534, 3.927, 0, 0, -0.923879, 0.382686, 45, 90, 1, 100, 0, 10), -- Closest existing guid is 16457 at 58.019310 yards.
(17725, 142145, 1, 1664.29, -3257.31, 144.601, 2.04204, 0, 0, 0.85264, 0.522499, 45, 90, 1, 100, 0, 10); -- Closest existing guid is 16481 at 102.710297 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(17722, 1327, 0, 'Gromsblood', 0, 10), -- Gromsblood in Ashenvale 8 objects total
(17724, 1327, 0, 'Gromsblood', 0, 10), -- Gromsblood in Ashenvale 8 objects total
(17725, 1327, 0, 'Gromsblood', 0, 10); -- Gromsblood in Ashenvale 8 objects total

-- Missing Gromsblood spawns in Desolace.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(17712, 142145, 1, -1682.46, 1941.42, 62.2338, 2.21657, 0, 0, 0.894934, 0.446199, 45, 90, 1, 100, 0, 10), -- Closest existing guid is 16538 at 40.005379 yards.
(17713, 142145, 1, -1866.38, 2046.31, 62.6681, 3.50812, 0, 0, -0.983254, 0.182238, 45, 90, 1, 100, 0, 10), -- Closest existing guid is 16464 at 115.915039 yards.
(17714, 142145, 1, -1805, 1645.8, 61.2939, 5.18363, 0, 0, -0.522498, 0.85264, 45, 90, 1, 100, 0, 10), -- Closest existing guid is 16539 at 66.435890 yards.
(17715, 142145, 1, -2052.13, 2077.23, 65.2471, 3.194, 0, 0, -0.999657, 0.0262016, 45, 90, 1, 100, 0, 10), -- Closest existing guid is 16502 at 63.237518 yards.
(17716, 142145, 1, -1872.68, 1775.92, 66.0818, 3.80482, 0, 0, -0.945518, 0.325568, 45, 90, 1, 100, 0, 10), -- Closest existing guid is 16537 at 87.646484 yards.
(17717, 142145, 1, -2114.53, 1920.92, 63.2417, 1.62316, 0, 0, 0.725374, 0.688355, 45, 90, 1, 100, 0, 10), -- Closest existing guid is 16458 at 90.239136 yards.
(17718, 142145, 1, -1829.13, 1681.74, 61.6428, 2.54818, 0, 0, 0.956305, 0.292372, 45, 90, 1, 100, 0, 10); -- Closest existing guid is 16539 at 78.180687 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(17712, 1143, 0, 'Gromsblood', 0, 10), -- Gromsblood in Desolace 12 objects total
(17713, 1143, 0, 'Gromsblood', 0, 10), -- Gromsblood in Desolace 12 objects total
(17714, 1143, 0, 'Gromsblood', 0, 10), -- Gromsblood in Desolace 12 objects total
(17715, 1143, 0, 'Gromsblood', 0, 10), -- Gromsblood in Desolace 12 objects total
(17716, 1143, 0, 'Gromsblood', 0, 10), -- Gromsblood in Desolace 12 objects total
(17717, 1143, 0, 'Gromsblood', 0, 10), -- Gromsblood in Desolace 12 objects total
(17718, 1143, 0, 'Gromsblood', 0, 10); -- Gromsblood in Desolace 12 objects total

-- Create new pool to hold Gromsblood spawns in Felwood.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(420, 1, 'Gromsbloods in Felwood', 0, 10);

-- Missing Gromsblood spawns in Felwood.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(17726, 176637, 1, 3829.71, -1018.73, 239.014, 1.58825, 0, 0, 0.71325, 0.70091, 1800, 1800, 1, 100, 0, 10),
(17727, 176637, 1, 4170.61, -1039.69, 290.399, 1.06465, 0, 0, 0.507538, 0.861629, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 17726 at 345.387421 yards.
(17728, 176637, 1, 6410.31, -1664.2, 489.088, 5.39307, 0, 0, -0.430511, 0.902586, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 17726 at 2671.828125 yards.
(17729, 176637, 1, 4275.2, -526.568, 300.463, 5.00909, 0, 0, -0.594823, 0.803857, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 17726 at 666.679016 yards.
(17731, 176637, 1, 6216.45, -1058.25, 382.754, 1.58825, 0, 0, 0.71325, 0.70091, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 17726 at 2391.391113 yards.
(17732, 176637, 1, 4713.48, -880.975, 333.382, 1.55334, 0, 0, 0.700909, 0.713251, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 17726 at 899.406006 yards.
(17733, 176637, 1, 4455.27, -649.972, 271.522, 0.925024, 0, 0, 0.446198, 0.894935, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 17726 at 726.886902 yards.
(17734, 176637, 1, 6171.32, -1320.39, 376.745, 4.90438, 0, 0, -0.636078, 0.771625, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 17726 at 2364.974854 yards.
(17735, 176637, 1, 4953.85, -628.289, 293.128, 2.33874, 0, 0, 0.920505, 0.390732, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 17726 at 1191.244507 yards.
(17736, 176637, 1, 4341.67, -975.19, 308.93, 3.31614, 0, 0, -0.996194, 0.087165, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 17726 at 518.543152 yards.
(17739, 176637, 1, 6435.29, -942.493, 423.112, 4.10153, 0, 0, -0.887011, 0.461749, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 17726 at 2613.187988 yards.
(17740, 176637, 1, 4427.99, -969.055, 319.897, 1.02974, 0, 0, 0.492423, 0.870356, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 17726 at 605.763123 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(17727, 420, 0, 'Gromsblood', 0, 10), -- Gromsbloods in Felwood
(17728, 420, 0, 'Gromsblood', 0, 10), -- Gromsbloods in Felwood
(17729, 420, 0, 'Gromsblood', 0, 10), -- Gromsbloods in Felwood
(17731, 420, 0, 'Gromsblood', 0, 10), -- Gromsbloods in Felwood
(17732, 420, 0, 'Gromsblood', 0, 10), -- Gromsbloods in Felwood
(17733, 420, 0, 'Gromsblood', 0, 10), -- Gromsbloods in Felwood
(17734, 420, 0, 'Gromsblood', 0, 10), -- Gromsbloods in Felwood
(17735, 420, 0, 'Gromsblood', 0, 10), -- Gromsbloods in Felwood
(17736, 420, 0, 'Gromsblood', 0, 10), -- Gromsbloods in Felwood
(17739, 420, 0, 'Gromsblood', 0, 10), -- Gromsbloods in Felwood
(17740, 420, 0, 'Gromsblood', 0, 10), -- Gromsbloods in Felwood
(17726, 420, 0, 'Gromsblood', 0, 10);-- Missing Icecap spawns in Winterspring.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(20263, 176588, 1, 6526.16, -4103.31, 661.573, 0.174532, 0, 0, 0.0871553, 0.996195, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 20261 at 14.392767 yards.
(49234, 176588, 1, 5267.52, -4901.57, 690.987, 0.610863, 0, 0, 0.300705, 0.953717, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 49123 at 18.956522 yards.
(49235, 176588, 1, 6457.21, -3587.55, 680.945, 4.7822, 0, 0, -0.681998, 0.731354, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 49132 at 225.920197 yards.
(49236, 176588, 1, 6451.75, -3584.58, 682.357, 2.58308, 0, 0, 0.961261, 0.27564, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 49132 at 225.464111 yards.
(49237, 176588, 1, 6223.48, -4188.69, 727.235, 2.91469, 0, 0, 0.993571, 0.113208, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 49129 at 81.595734 yards.
(20264, 176588, 1, 6049.27, -4390.58, 709.758, 1.20428, 0, 0, 0.566406, 0.824126, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 20212 at 45.055138 yards.
(20265, 176588, 1, 5644.77, -4574.31, 766.659, 1.11701, 0, 0, 0.529919, 0.848048, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 20244 at 61.897308 yards.
(20178, 176588, 1, 6828.07, -3437.83, 706.807, 4.60767, 0, 0, -0.743144, 0.669131, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 20170 at 71.043182 yards.
(20266, 176588, 1, 5077.42, -4713.18, 846.748, 4.50295, 0, 0, -0.777145, 0.629321, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 20224 at 26.266981 yards.
(20267, 176588, 1, 6452.4, -3043.28, 573.872, 4.66003, 0, 0, -0.725374, 0.688355, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 20199 at 20.443680 yards.
(20268, 176588, 1, 6710.26, -4405.53, 738.596, 4.7822, 0, 0, -0.681998, 0.731354, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 20229 at 95.813690 yards.
(20161, 176588, 1, 6482.95, -5062.63, 750.388, 1.88495, 0, 0, 0.809016, 0.587786, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 20154 at 246.933487 yards.
(20139, 176588, 1, 6773.42, -4154.48, 718.614, 1.29154, 0, 0, 0.601814, 0.798636, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 20136 at 236.655411 yards.
(20269, 176588, 1, 6268.37, -4792.4, 757.083, 3.05433, 0, 0, 0.999048, 0.0436193, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 20154 at 138.282150 yards.
(20270, 176588, 1, 6786.74, -3284.2, 656.729, 4.36332, 0, 0, -0.819152, 0.573577, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 20143 at 69.426270 yards.
(20271, 176588, 1, 6379.19, -5052.92, 752.284, 0.401425, 0, 0, 0.199368, 0.979925, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 20154 at 161.478439 yards.
(20272, 176588, 1, 7113.89, -4231.54, 691.835, 5.77704, 0, 0, -0.25038, 0.968148, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 20213 at 45.164650 yards.
(20273, 176588, 1, 5935.55, -4583.15, 717.809, 3.05433, 0, 0, 0.999048, 0.0436193, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 20138 at 27.140123 yards.
(20274, 176588, 1, 5571.02, -4874.4, 845.86, 4.24115, 0, 0, -0.85264, 0.522499, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 20148 at 123.200233 yards.
(20275, 176588, 1, 6342.89, -2458.11, 545.942, 0.471238, 0, 0, 0.233445, 0.97237, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 20207 at 69.148834 yards.
(49238, 176588, 1, 5121.67, -4969.84, 877.953, 0.95993, 0, 0, 0.461748, 0.887011, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 49122 at 53.169540 yards.
(49239, 176588, 1, 7187.52, -4762.29, 723.539, 2.87979, 0, 0, 0.991445, 0.130528, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 49118 at 252.654037 yards.
(49240, 176588, 1, 6748.4, -5178.43, 749.852, 1.13446, 0, 0, 0.537299, 0.843392, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 49121 at 260.971039 yards.
(20276, 176588, 1, 6570.82, -3575.14, 708.331, 4.29351, 0, 0, -0.83867, 0.54464, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 20190 at 178.045364 yards.
(20277, 176588, 1, 5491.81, -4616.75, 810.12, 1.5708, 0, 0, 0.707107, 0.707107, 2700, 2700, 1, 100, 0, 10); -- Closest existing guid is 20214 at 82.023178 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(20263, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(49234, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(49235, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(49236, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(49237, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(20264, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(20265, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(20178, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(20266, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(20267, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(20268, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(20161, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(20139, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(20269, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(20270, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(20271, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(20272, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(20273, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(20274, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(20275, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(49238, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(49239, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(49240, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(20276, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(20277, 1236, 0, 'Icecap', 0, 10); -- Icecaps in Winterspring 153 objects total

-- Create new pool to hold Incendia Agave spawns in Thousand Needles.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(421, 10, 'Incendia Agaves in Thousand Needles', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(16749, 421, 0, 'Incendia Agave', 0, 10),
(16750, 421, 0, 'Incendia Agave', 0, 10),
(16755, 421, 0, 'Incendia Agave', 0, 10),
(16756, 421, 0, 'Incendia Agave', 0, 10),
(16757, 421, 0, 'Incendia Agave', 0, 10),
(25684, 421, 0, 'Incendia Agave', 0, 10),
(25685, 421, 0, 'Incendia Agave', 0, 10),
(25686, 421, 0, 'Incendia Agave', 0, 10),
(25687, 421, 0, 'Incendia Agave', 0, 10),
(25688, 421, 0, 'Incendia Agave', 0, 10),
(25689, 421, 0, 'Incendia Agave', 0, 10),
(25690, 421, 0, 'Incendia Agave', 0, 10),
(25691, 421, 0, 'Incendia Agave', 0, 10),
(25692, 421, 0, 'Incendia Agave', 0, 10),
(25693, 421, 0, 'Incendia Agave', 0, 10),
(25694, 421, 0, 'Incendia Agave', 0, 10),
(25695, 421, 0, 'Incendia Agave', 0, 10),
(25696, 421, 0, 'Incendia Agave', 0, 10),
(25697, 421, 0, 'Incendia Agave', 0, 10);

-- Correct position of Incendia Agave in Thousand Needles (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-4966.54, `position_y`=-1914.79, `position_z`=-41.1326, `orientation`=3.78737, `rotation0`=0, `rotation1`=0, `rotation2`=-0.948323, `rotation3`=0.317306 WHERE `guid`=25687;

-- Correct position of Incendia Agave in Thousand Needles (position is off by 0.00976563 yards).
UPDATE `gameobject` SET `position_x`=-5028.41, `position_y`=-2000.75, `position_z`=-53.1136, `orientation`=5.37562, `rotation0`=0, `rotation1`=0, `rotation2`=-0.438371, `rotation3`=0.898794 WHERE `guid`=25685;

-- Correct position of Khadgar's Whisker in Swamp of Sorrows (position is off by 4.80832 yards).
UPDATE `gameobject` SET `position_x`=-10139.4, `position_y`=-2979.23, `position_z`=22.9316, `orientation`=1.81514, `rotation0`=0, `rotation1`=0, `rotation2`=0.788011, `rotation3`=0.615662 WHERE `guid`=7882;

-- Correct position of Khadgar's Whisker in Stranglethorn Vale (position is off by 0.212475 yards).
UPDATE `gameobject` SET `position_x`=-11895.1, `position_y`=-238.187, `position_z`=18.641, `orientation`=5.91667, `rotation0`=0, `rotation1`=0, `rotation2`=-0.182235, `rotation3`=0.983255 WHERE `guid`=8121;

-- Correct position of Khadgar's Whisker in Badlands (position is off by 0.701741 yards).
UPDATE `gameobject` SET `position_x`=-6862.68, `position_y`=-2684.03, `position_z`=244.368, `orientation`=4.83456, `rotation0`=0, `rotation1`=0, `rotation2`=-0.66262, `rotation3`=0.748956 WHERE `guid`=8129;

-- Correct position of Khadgar's Whisker in Arathi Highlands (position is off by 0.934277 yards).
UPDATE `gameobject` SET `position_x`=-943.772, `position_y`=-2879.49, `position_z`=66.9773, `orientation`=4.83456, `rotation0`=0, `rotation1`=0, `rotation2`=-0.66262, `rotation3`=0.748956 WHERE `guid`=7903;

-- Correct position of Khadgar's Whisker in Alterac Mountains (position is off by 0.00100708 yards).
UPDATE `gameobject` SET `position_x`=143.653, `position_y`=-93.971, `position_z`=115.869, `orientation`=0.436332, `rotation0`=0, `rotation1`=0, `rotation2`=0.216439, `rotation3`=0.976296 WHERE `guid`=7843;

-- Correct position of Khadgar's Whisker in Arathi Highlands (position is off by 1.23729 yards).
UPDATE `gameobject` SET `position_x`=-1852.57, `position_y`=-3180.92, `position_z`=51.6127, `orientation`=1.81514, `rotation0`=0, `rotation1`=0, `rotation2`=0.788011, `rotation3`=0.615662 WHERE `guid`=7864;

-- Correct position of Khadgar's Whisker in Arathi Highlands (position is off by 1.81555 yards).
UPDATE `gameobject` SET `position_x`=-1600.69, `position_y`=-2382.19, `position_z`=100.831, `orientation`=2.25147, `rotation0`=0, `rotation1`=0, `rotation2`=0.902585, `rotation3`=0.430512 WHERE `guid`=8105;

-- Correct position of Khadgar's Whisker in Badlands (position is off by 1.11095 yards).
UPDATE `gameobject` SET `position_x`=-6757.96, `position_y`=-2769.66, `position_z`=242.919, `orientation`=2.30383, `rotation0`=0, `rotation1`=0, `rotation2`=0.913545, `rotation3`=0.406738 WHERE `guid`=8115;

-- Correct position of Khadgar's Whisker in Stranglethorn Vale (position is off by 0.299943 yards).
UPDATE `gameobject` SET `position_x`=-12810.7, `position_y`=185.967, `position_z`=17.3171, `orientation`=2.40855, `rotation0`=0, `rotation1`=0, `rotation2`=0.93358, `rotation3`=0.358368 WHERE `guid`=7950;

-- Correct position of Khadgar's Whisker in Stranglethorn Vale (position is off by 0.400393 yards).
UPDATE `gameobject` SET `position_x`=-12964.4, `position_y`=167.524, `position_z`=22.3694, `orientation`=2.79252, `rotation0`=0, `rotation1`=0, `rotation2`=0.984807, `rotation3`=0.173652 WHERE `guid`=7876;

-- Correct position of Khadgar's Whisker in Stranglethorn Vale (position is off by 4.97169 yards).
UPDATE `gameobject` SET `position_x`=-14184.8, `position_y`=330.071, `position_z`=46.021, `orientation`=2.46091, `rotation0`=0, `rotation1`=0, `rotation2`=0.942641, `rotation3`=0.333808 WHERE `guid`=7964;

-- Correct position of Khadgar's Whisker in Swamp of Sorrows (position is off by 0.819849 yards).
UPDATE `gameobject` SET `position_x`=-10319.2, `position_y`=-2683.88, `position_z`=23.6573, `orientation`=3.76991, `rotation0`=0, `rotation1`=0, `rotation2`=-0.951056, `rotation3`=0.309017 WHERE `guid`=8025;

-- Correct position of Khadgar's Whisker in Stranglethorn Vale (position is off by 0.3001 yards).
UPDATE `gameobject` SET `position_x`=-12862.7, `position_y`=243.25, `position_z`=17.8317, `orientation`=2.58308, `rotation0`=0, `rotation1`=0, `rotation2`=0.961261, `rotation3`=0.27564 WHERE `guid`=7852;

-- Correct position of Khadgar's Whisker in Feralas (position is off by 0.271044 yards).
UPDATE `gameobject` SET `position_x`=-4360.75, `position_y`=-345.096, `position_z`=38.7082, `orientation`=2.53072, `rotation0`=0, `rotation1`=0, `rotation2`=0.953716, `rotation3`=0.300708 WHERE `guid`=7907;

-- Correct position of Khadgar's Whisker in Badlands (position is off by 0.682979 yards).
UPDATE `gameobject` SET `position_x`=-6803.79, `position_y`=-2829.65, `position_z`=242.446, `orientation`=0.925024, `rotation0`=0, `rotation1`=0, `rotation2`=0.446198, `rotation3`=0.894935 WHERE `guid`=8093;

-- Correct position of Khadgar's Whisker in Badlands (position is off by 0.37096 yards).
UPDATE `gameobject` SET `position_x`=-7033.63, `position_y`=-2311, `position_z`=252.41, `orientation`=5.68977, `rotation0`=0, `rotation1`=0, `rotation2`=-0.292372, `rotation3`=0.956305 WHERE `guid`=7839;

-- Correct position of Khadgar's Whisker in Arathi Highlands (position is off by 1.07569 yards).
UPDATE `gameobject` SET `position_x`=-1064.96, `position_y`=-3020.41, `position_z`=55.4701, `orientation`=3.4383, `rotation0`=0, `rotation1`=0, `rotation2`=-0.989016, `rotation3`=0.147811 WHERE `guid`=7888;

-- Correct position of Khadgar's Whisker in Badlands (position is off by 0.59141 yards).
UPDATE `gameobject` SET `position_x`=-6877.51, `position_y`=-2974.67, `position_z`=241.777, `orientation`=2.46091, `rotation0`=0, `rotation1`=0, `rotation2`=0.942641, `rotation3`=0.333808 WHERE `guid`=7918;

-- Correct position of Khadgar's Whisker in Stranglethorn Vale (position is off by 0.739606 yards).
UPDATE `gameobject` SET `position_x`=-12033.6, `position_y`=267.449, `position_z`=12.6497, `orientation`=5.44543, `rotation0`=0, `rotation1`=0, `rotation2`=-0.406736, `rotation3`=0.913546 WHERE `guid`=7889;

-- Correct position of Khadgar's Whisker in The Hinterlands (position is off by 0.666402 yards).
UPDATE `gameobject` SET `position_x`=287.296, `position_y`=-3228.73, `position_z`=116.157, `orientation`=4.15388, `rotation0`=0, `rotation1`=0, `rotation2`=-0.874619, `rotation3`=0.48481 WHERE `guid`=7987;

-- Correct position of Khadgar's Whisker in Dustwallow Marsh (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-3772.92, `position_y`=-3562.16, `position_z`=38.337, `orientation`=5.93412, `rotation0`=0, `rotation1`=0, `rotation2`=-0.173648, `rotation3`=0.984808 WHERE `guid`=56014;

-- Correct position of Khadgar's Whisker in Stranglethorn Vale (position is off by 0.997005 yards).
UPDATE `gameobject` SET `position_x`=-11809.3, `position_y`=444.485, `position_z`=49.6407, `orientation`=3.47321, `rotation0`=0, `rotation1`=0, `rotation2`=-0.986285, `rotation3`=0.16505 WHERE `guid`=8173;

-- Correct position of Khadgar's Whisker in Stranglethorn Vale (position is off by 0.43558 yards).
UPDATE `gameobject` SET `position_x`=-12771.2, `position_y`=-15.3801, `position_z`=9.45094, `orientation`=0.087266, `rotation0`=0, `rotation1`=0, `rotation2`=0.0436192, `rotation3`=0.999048 WHERE `guid`=7973;

-- Correct position of Khadgar's Whisker in Stranglethorn Vale (position is off by 0.800839 yards).
UPDATE `gameobject` SET `position_x`=-11736.5, `position_y`=-268.625, `position_z`=26.3078, `orientation`=3.4034, `rotation0`=0, `rotation1`=0, `rotation2`=-0.991445, `rotation3`=0.130528 WHERE `guid`=7978;

-- Correct position of Khadgar's Whisker in Badlands (position is off by 1.19267 yards).
UPDATE `gameobject` SET `position_x`=-6902.13, `position_y`=-2357.62, `position_z`=240.485, `orientation`=0.366518, `rotation0`=0, `rotation1`=0, `rotation2`=0.182235, `rotation3`=0.983255 WHERE `guid`=8007;

-- Correct position of Khadgar's Whisker in The Hinterlands (position is off by 2.9465 yards).
UPDATE `gameobject` SET `position_x`=156.958, `position_y`=-4024.11, `position_z`=123.38, `orientation`=4.66003, `rotation0`=0, `rotation1`=0, `rotation2`=-0.725374, `rotation3`=0.688355 WHERE `guid`=8011;

-- Correct position of Khadgar's Whisker in Feralas (position is off by 0.741573 yards).
UPDATE `gameobject` SET `position_x`=-4140.47, `position_y`=-185.429, `position_z`=56.7148, `orientation`=0.296705, `rotation0`=0, `rotation1`=0, `rotation2`=0.147809, `rotation3`=0.989016 WHERE `guid`=7863;

-- Correct position of Khadgar's Whisker in Stranglethorn Vale (position is off by 0.349505 yards).
UPDATE `gameobject` SET `position_x`=-11670.1, `position_y`=-465.304, `position_z`=22.9578, `orientation`=4.18879, `rotation0`=0, `rotation1`=0, `rotation2`=-0.866025, `rotation3`=0.500001 WHERE `guid`=7883;

-- Correct position of Khadgar's Whisker in Stranglethorn Vale (position is off by 0.430556 yards).
UPDATE `gameobject` SET `position_x`=-13871.3, `position_y`=661.595, `position_z`=15.0183, `orientation`=0.733038, `rotation0`=0, `rotation1`=0, `rotation2`=0.358368, `rotation3`=0.93358 WHERE `guid`=7963;

-- Correct position of Khadgar's Whisker in Stranglethorn Vale (position is off by 0.963068 yards).
UPDATE `gameobject` SET `position_x`=-12535.2, `position_y`=-34.5063, `position_z`=22.1414, `orientation`=0.139624, `rotation0`=0, `rotation1`=0, `rotation2`=0.0697556, `rotation3`=0.997564 WHERE `guid`=8124;

-- Correct position of Khadgar's Whisker in The Hinterlands (position is off by 1.22649 yards).
UPDATE `gameobject` SET `position_x`=11.1803, `position_y`=-3976.08, `position_z`=132.625, `orientation`=1.72787, `rotation0`=0, `rotation1`=0, `rotation2`=0.760406, `rotation3`=0.649449 WHERE `guid`=8052;

-- Correct position of Khadgar's Whisker in Stranglethorn Vale (position is off by 0.924083 yards).
UPDATE `gameobject` SET `position_x`=-11828.9, `position_y`=-547.797, `position_z`=15.4699, `orientation`=0.104719, `rotation0`=0, `rotation1`=0, `rotation2`=0.0523357, `rotation3`=0.99863 WHERE `guid`=7897;

-- Correct position of Khadgar's Whisker in Stranglethorn Vale (position is off by 1.01117 yards).
UPDATE `gameobject` SET `position_x`=-12438, `position_y`=-742.859, `position_z`=37.5079, `orientation`=5.61996, `rotation0`=0, `rotation1`=0, `rotation2`=-0.325567, `rotation3`=0.945519 WHERE `guid`=8088;

-- Missing Khadgar's Whisker spawns in Badlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(17806, 2043, 0, -7038.73, -3109.59, 241.785, 0.0174525, 0, 0, 0.00872612, 0.999962, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8114 at 179.196548 yards.
(17808, 2043, 0, -6773.71, -2528.45, 243.776, 3.927, 0, 0, -0.923879, 0.382686, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 7844 at 41.609974 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(17806, 1282, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Badlands 26 objects total
(17808, 1282, 0, 'Khadgars Whisker', 0, 10); -- Khadgars Whisker in Badlands 26 objects total

-- Missing Khadgar's Whisker spawns in Swamp of Sorrows.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(17755, 2043, 0, -10271.1, -2857.08, 27.0663, 5.53269, 0, 0, -0.366501, 0.930418, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8012 at 16.201609 yards.
(17805, 2043, 0, -10338.1, -2849.28, 24.6491, 2.75761, 0, 0, 0.981627, 0.190812, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8089 at 10.070968 yards.
(17811, 2043, 0, -10659.2, -4227.48, 23.3317, 0.715585, 0, 0, 0.350207, 0.936672, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8156 at 92.183922 yards.
(17814, 2043, 0, -10107.4, -3413.07, 22.6165, 2.9845, 0, 0, 0.996917, 0.0784664, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8020 at 14.381908 yards.
(17815, 2043, 0, -10686, -4084.35, 22.5595, 4.38078, 0, 0, -0.814116, 0.580703, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8154 at 97.195938 yards.
(17817, 2043, 0, -10331, -2819.58, 24.9289, 4.62512, 0, 0, -0.737277, 0.675591, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8189 at 20.138981 yards.
(17818, 2043, 0, -10147.2, -4100.49, 21.9425, 2.05949, 0, 0, 0.857167, 0.515038, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7960 at 163.223373 yards.
(17819, 2043, 0, -10188.6, -3787.47, 22.6709, 5.39307, 0, 0, -0.430511, 0.902586, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7840 at 140.153564 yards.
(17820, 2043, 0, -10442.5, -3509.2, 23.4964, 5.74214, 0, 0, -0.267238, 0.963631, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7874 at 16.807512 yards.
(17827, 2043, 0, -10220.8, -3086.67, 22.225, 0.750491, 0, 0, 0.366501, 0.930418, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 7882 at 130.652618 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(17755, 1310, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Swamp of Sorrows (2) 25 objects total
(17805, 1310, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Swamp of Sorrows (2) 25 objects total
(17811, 1309, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Swamp of Sorrows (1) 26 objects total
(17814, 1310, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Swamp of Sorrows (2) 25 objects total
(17815, 1309, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Swamp of Sorrows (1) 26 objects total
(17817, 1310, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Swamp of Sorrows (2) 25 objects total
(17818, 1309, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Swamp of Sorrows (1) 26 objects total
(17819, 1309, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Swamp of Sorrows (1) 26 objects total
(17820, 1309, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Swamp of Sorrows (1) 26 objects total
(17827, 1310, 0, 'Khadgars Whisker', 0, 10); -- Khadgars Whisker in Swamp of Sorrows (2) 25 objects total

-- Missing Khadgar's Whisker spawns in Dustwallow Marsh.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(17756, 2043, 1, -3321.41, -2843.75, 32.791, 3.56047, 0, 0, -0.978148, 0.207912, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7327 at 327.302734 yards.
(56132, 2043, 1, -3316.13, -4017.71, 29.0155, 0.296705, 0, 0, 0.147809, 0.989016, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 55934 at 564.241638 yards.
(56133, 2043, 1, -4127.7, -2823.48, 39.0979, 3.10665, 0, 0, 0.999847, 0.0174693, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 56060 at 175.472031 yards.
(56134, 2043, 1, -3841.73, -3706.29, 42.2347, 0.0523589, 0, 0, 0.0261765, 0.999657, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 56014 at 159.760788 yards.
(17807, 2043, 1, -4499.86, -3176.26, 35.5605, 3.80482, 0, 0, -0.945518, 0.325568, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12846 at 314.356995 yards.
(17816, 2043, 1, -4506, -3666.13, 38.9024, 2.93214, 0, 0, 0.994521, 0.104536, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 11971 at 13.670881 yards.
(17821, 2043, 1, -4256.67, -3587.84, 43.1987, 2.56563, 0, 0, 0.958819, 0.284016, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7201 at 103.847755 yards.
(40829, 2043, 1, -3531.54, -3056.35, 36.5391, 0.453785, 0, 0, 0.224951, 0.97437, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 40828 at 179.032593 yards.
(56135, 2043, 1, -4117.23, -3318.63, 38.7402, 2.35619, 0, 0, 0.92388, 0.382683, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 56008 at 158.012009 yards.
(17825, 2043, 1, -3637.24, -3373.67, 40.16, 0.471238, 0, 0, 0.233445, 0.97237, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 14613 at 51.909832 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(17756, 1102, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Dustwallow Marsh 9 objects total
(56132, 1102, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Dustwallow Marsh 9 objects total
(56133, 1102, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Dustwallow Marsh 9 objects total
(56134, 1102, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Dustwallow Marsh 9 objects total
(17807, 1102, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Dustwallow Marsh 9 objects total
(17816, 1102, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Dustwallow Marsh 9 objects total
(17821, 1102, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Dustwallow Marsh 9 objects total
(40829, 1102, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Dustwallow Marsh 9 objects total
(56135, 1102, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Dustwallow Marsh 9 objects total
(17825, 1102, 0, 'Khadgars Whisker', 0, 10); -- Khadgars Whisker in Dustwallow Marsh 9 objects total

-- Missing Khadgar's Whisker spawns in Azshara.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(48950, 2043, 1, 4666.72, -6522.82, 113.834, 2.86234, 0, 0, 0.990268, 0.139175, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 48477 at 700.735779 yards.
(48956, 2043, 1, 3213.58, -5146.55, 140.037, 0.942477, 0, 0, 0.45399, 0.891007, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 48476 at 553.435120 yards.
(48959, 2043, 1, 2967.38, -4074.46, 103.338, 1.79769, 0, 0, 0.782608, 0.622515, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 48476 at 947.360779 yards.
(48960, 2043, 1, 2630.11, -5716.02, 113.184, 4.17134, 0, 0, -0.870356, 0.492424, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 48479 at 299.354156 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(48950, 1189, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Feralas 14 objects total
(48956, 1189, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Feralas 14 objects total
(48959, 1189, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Feralas 14 objects total
(48960, 1189, 0, 'Khadgars Whisker', 0, 10); -- Khadgars Whisker in Feralas 14 objects total

-- Missing Khadgar's Whisker spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(17759, 2043, 0, -11723.3, 212.219, 41.4537, 1.64061, 0, 0, 0.731353, 0.681999, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8079 at 49.436161 yards.
(17802, 2043, 0, -12681.5, -121.948, 15.3385, 4.7473, 0, 0, -0.694658, 0.71934, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7973 at 139.583817 yards.
(17813, 2043, 0, -12732.6, -594.734, 42.1949, 5.53269, 0, 0, -0.366501, 0.930418, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8009 at 18.887331 yards.
(17828, 2043, 0, -13699.8, 511.229, 38.8513, 6.21337, 0, 0, -0.0348988, 0.999391, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8137 at 78.434006 yards.
(17829, 2043, 0, -11793.7, 70.5265, 24.8554, 2.00713, 0, 0, 0.843391, 0.5373, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7969 at 21.982925 yards.
(17830, 2043, 0, -12362.9, -191.168, 22.3143, 4.7822, 0, 0, -0.681998, 0.731354, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8061 at 55.500072 yards.
(17844, 2043, 0, -11608.4, -581.081, 27.9593, 4.90438, 0, 0, -0.636078, 0.771625, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7971 at 14.202690 yards.
(17863, 2043, 0, -11548.4, 843.898, 23.3085, 2.47837, 0, 0, 0.945518, 0.325568, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8033 at 177.125198 yards.
(17864, 2043, 0, -12497.6, -818.028, 41.9242, 4.88692, 0, 0, -0.642787, 0.766045, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12056 at 80.240982 yards.
(17865, 2043, 0, -12841.2, 97.749, 19.3022, 5.46288, 0, 0, -0.398748, 0.91706, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 8142 at 60.845470 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(17759, 1173, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Stranglethorn 179 objects total
(17802, 1173, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Stranglethorn 179 objects total
(17813, 1173, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Stranglethorn 179 objects total
(17828, 1173, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Stranglethorn 179 objects total
(17829, 1173, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Stranglethorn 179 objects total
(17830, 1173, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Stranglethorn 179 objects total
(17844, 1173, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Stranglethorn 179 objects total
(17863, 1173, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Stranglethorn 179 objects total
(17864, 1173, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Stranglethorn 179 objects total
(17865, 1173, 0, 'Khadgars Whisker', 0, 10); -- Khadgars Whisker in Stranglethorn 179 objects total

-- Missing Khadgar's Whisker spawns in Alterac Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(17742, 2043, 0, 1017.78, -357.786, 61.5597, 2.91469, 0, 0, 0.993571, 0.113208, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7906 at 97.310188 yards.
(17744, 2043, 0, 498.507, -1343.87, 68.2421, 5.48033, 0, 0, -0.390731, 0.920505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8064 at 47.165981 yards.
(17746, 2043, 0, -44.0645, -436.343, 105.588, 3.14159, 0, 0, -1, 0, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7843 at 390.591553 yards.
(17749, 2043, 0, 1201.66, -569.665, 71.0431, 4.17134, 0, 0, -0.870356, 0.492424, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8026 at 61.440010 yards.
(17799, 2043, 0, 651.71, -1333.18, 108.475, 5.96903, 0, 0, -0.156434, 0.987688, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8064 at 195.694901 yards.
(17804, 2043, 0, 1216.54, -502.072, 62.9315, 5.07891, 0, 0, -0.566406, 0.824126, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8030 at 95.545860 yards.
(17822, 2043, 0, -61.4537, -242.914, 138.338, 2.63544, 0, 0, 0.968147, 0.250381, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7843 at 254.474396 yards.
(17823, 2043, 0, -248.326, -285.914, 166.76, 5.53269, 0, 0, -0.366501, 0.930418, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7843 at 439.407257 yards.
(17824, 2043, 0, -116.969, -118.776, 137.862, 2.93214, 0, 0, 0.994521, 0.104536, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 7843 at 262.720947 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(17742, 1059, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Alterac 26 objects total
(17744, 1059, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Alterac 26 objects total
(17746, 1059, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Alterac 26 objects total
(17749, 1059, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Alterac 26 objects total
(17799, 1059, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Alterac 26 objects total
(17804, 1059, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Alterac 26 objects total
(17822, 1059, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Alterac 26 objects total
(17823, 1059, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Alterac 26 objects total
(17824, 1059, 0, 'Khadgars Whisker', 0, 10); -- Khadgars Whisker in Alterac 26 objects total

-- Missing Khadgar's Whisker spawns in Arathi Highlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(17741, 2043, 0, -1025.81, -2997.91, 54.5303, 5.89921, 0, 0, -0.190808, 0.981627, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7888 at 44.134827 yards.
(17798, 2043, 0, -998.321, -2613.74, 59.0053, 2.65289, 0, 0, 0.970295, 0.241925, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7957 at 83.547928 yards.
(17800, 2043, 0, -833.354, -3573.68, 75.1468, 2.16421, 0, 0, 0.882947, 0.469473, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7065 at 381.200256 yards.
(17801, 2043, 0, -1938.69, -2777.88, 76.5744, 4.88692, 0, 0, -0.642787, 0.766045, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7869 at 53.898926 yards.
(17803, 2043, 0, -1005.75, -2761.2, 49.9008, 2.74016, 0, 0, 0.979924, 0.19937, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8091 at 12.281904 yards.
(17812, 2043, 0, -1337.62, -3171.37, 36.8362, 0.575957, 0, 0, 0.284015, 0.95882, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 7954 at 32.702301 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(17741, 1182, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Arathi 71 objects total
(17798, 1182, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Arathi 71 objects total
(17800, 1182, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Arathi 71 objects total
(17801, 1182, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Arathi 71 objects total
(17803, 1182, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Arathi 71 objects total
(17812, 1182, 0, 'Khadgars Whisker', 0, 10); -- Khadgars Whisker in Arathi 71 objects total

-- Missing Khadgar's Whisker spawns in The Hinterlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(17761, 2043, 0, 472.906, -3579.43, 119.614, 5.58505, 0, 0, -0.34202, 0.939693, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 8135 at 37.287319 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(17761, 1248, 0, 'Khadgars Whisker', 0, 10); -- Khadgars Whisker in Hinterlands 28 objects total

-- Missing Khadgar's Whisker spawns in Feralas.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(50389, 2043, 1, -4526.93, 733.041, 58.6208, 3.05433, 0, 0, 0.999048, 0.0436193, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 50217 at 354.395477 yards.
(17779, 2043, 1, -4151.86, 181.619, 60.0951, 5.58505, 0, 0, -0.34202, 0.939693, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7863 at 367.826294 yards.
(17809, 2043, 1, -4444.69, -491.649, 16.8626, 5.60251, 0, 0, -0.333807, 0.942641, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7907 at 170.261536 yards.
(17810, 2043, 1, -4045.41, 22.926, 71.7135, 4.01426, 0, 0, -0.906307, 0.422619, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7863 at 229.834503 yards.
(50390, 2043, 1, -4963.53, 509.307, 9.36374, 3.87463, 0, 0, -0.93358, 0.358368, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 50217 at 463.934265 yards.
(50391, 2043, 1, -4746.1, 580.647, 37.8097, 3.194, 0, 0, -0.999657, 0.0262016, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 50217 at 367.966034 yards.
(50392, 2043, 1, -5066.7, 1580.28, 60.7236, 1.3439, 0, 0, 0.622514, 0.782609, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 50227 at 430.014160 yards.
(50393, 2043, 1, -5737.81, 1603.28, 79.7497, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 50225 at 544.893372 yards.
(50394, 2043, 1, -5852.32, 1607.68, 84.5751, 0.209439, 0, 0, 0.104528, 0.994522, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 50225 at 555.516724 yards.
(17826, 2043, 1, -5315.67, 1631.8, 52.4483, 5.86431, 0, 0, -0.207911, 0.978148, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7346 at 518.864258 yards.
(50395, 2043, 1, -5204.47, 1650.32, 86.5355, 0.244346, 0, 0, 0.121869, 0.992546, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 50227 at 508.731659 yards.
(50396, 2043, 1, -2908.44, 2786.06, 80.2477, 5.23599, 0, 0, -0.5, 0.866025, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 50228 at 506.736115 yards.
(50397, 2043, 1, -3451.05, 2724.27, 80.1605, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 50228 at 198.152527 yards.
(50398, 2043, 1, -4543.79, 876.104, 58.5503, 3.71755, 0, 0, -0.958819, 0.284016, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 50217 at 283.815521 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(50389, 1189, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Feralas 14 objects total
(17779, 1189, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Feralas 14 objects total
(17809, 1189, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Feralas 14 objects total
(17810, 1189, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Feralas 14 objects total
(50390, 1189, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Feralas 14 objects total
(50391, 1189, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Feralas 14 objects total
(50392, 1189, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Feralas 14 objects total
(50393, 1189, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Feralas 14 objects total
(50394, 1189, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Feralas 14 objects total
(17826, 1189, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Feralas 14 objects total
(50395, 1189, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Feralas 14 objects total
(50396, 1189, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Feralas 14 objects total
(50397, 1189, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Feralas 14 objects total
(50398, 1189, 0, 'Khadgars Whisker', 0, 10); -- Khadgars Whisker in Feralas 14 objects total

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES (101208, 2043, 0, -224.735, -434.981, 71.6844, 3.59538, 0, 0, -0.97437, 0.224951, 1800, 1800, 1, 100, 0, 10);
-- Correct position of Kingsblood in Thousand Needles (position is off by 0.744806 yards).
UPDATE `gameobject` SET `position_x`=-6023.53, `position_y`=-3794.54, `position_z`=-58.75, `orientation`=5.63741, `rotation0`=0, `rotation1`=0, `rotation2`=-0.317305, `rotation3`=0.948324 WHERE `guid`=4359;

-- Correct position of Kingsblood in Thousand Needles (position is off by 0.898815 yards).
UPDATE `gameobject` SET `position_x`=-6249.16, `position_y`=-3551.2, `position_z`=-58.7499, `orientation`=5.91667, `rotation0`=0, `rotation1`=0, `rotation2`=-0.182235, `rotation3`=0.983255 WHERE `guid`=4356;

-- Correct position of Kingsblood in The Barrens (position is off by 0.479054 yards).
UPDATE `gameobject` SET `position_x`=-4111.47, `position_y`=-1954.08, `position_z`=91.9037, `orientation`=5.32326, `rotation0`=0, `rotation1`=0, `rotation2`=-0.461748, `rotation3`=0.887011 WHERE `guid`=4406;

-- Correct position of Kingsblood in Stonetalon Mountains (position is off by 1.02303 yards).
UPDATE `gameobject` SET `position_x`=2408.39, `position_y`=1116.03, `position_z`=311.155, `orientation`=2.14675, `rotation0`=0, `rotation1`=0, `rotation2`=0.878817, `rotation3`=0.47716 WHERE `guid`=4429;

-- Correct position of Kingsblood in Desolace (position is off by 0.763617 yards).
UPDATE `gameobject` SET `position_x`=-982.269, `position_y`=1717.79, `position_z`=61.5822, `orientation`=1.36136, `rotation0`=0, `rotation1`=0, `rotation2`=0.62932, `rotation3`=0.777146 WHERE `guid`=4340;

-- Correct position of Kingsblood in Swamp of Sorrows (position is off by 1.49243 yards).
UPDATE `gameobject` SET `position_x`=-10226.6, `position_y`=-3333.69, `position_z`=22.4027, `orientation`=2.87979, `rotation0`=0, `rotation1`=0, `rotation2`=0.991445, `rotation3`=0.130528 WHERE `guid`=4280;

-- Correct position of Kingsblood in Stranglethorn Vale (position is off by 1.36557 yards).
UPDATE `gameobject` SET `position_x`=-11968.7, `position_y`=67.8222, `position_z`=13.6903, `orientation`=1.93731, `rotation0`=0, `rotation1`=0, `rotation2`=0.824125, `rotation3`=0.566408 WHERE `guid`=4305;

-- Correct position of Kingsblood in Badlands (position is off by 0.581931 yards).
UPDATE `gameobject` SET `position_x`=-6950.24, `position_y`=-2351.53, `position_z`=240.744, `orientation`=0.855211, `rotation0`=0, `rotation1`=0, `rotation2`=0.414693, `rotation3`=0.909961 WHERE `guid`=4386;

-- Correct position of Kingsblood in Badlands (position is off by 0.30802 yards).
UPDATE `gameobject` SET `position_x`=-6713.75, `position_y`=-2715.18, `position_z`=241.668, `orientation`=4.43314, `rotation0`=0, `rotation1`=0, `rotation2`=-0.798635, `rotation3`=0.601815 WHERE `guid`=4381;

-- Correct position of Kingsblood in Thousand Needles (position is off by 0.834636 yards).
UPDATE `gameobject` SET `position_x`=-5518.8, `position_y`=-2254.82, `position_z`=-59.8433, `orientation`=0.349065, `rotation0`=0, `rotation1`=0, `rotation2`=0.173648, `rotation3`=0.984808 WHERE `guid`=4428;

-- Correct position of Kingsblood in The Barrens (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-3652.88, `position_y`=-2094.61, `position_z`=92.8224, `orientation`=2.11185, `rotation0`=0, `rotation1`=0, `rotation2`=0.870356, `rotation3`=0.492424 WHERE `guid`=4043;

-- Correct position of Kingsblood in Alterac Mountains (position is off by 0.125032 yards).
UPDATE `gameobject` SET `position_x`=184.216, `position_y`=42.8294, `position_z`=55.9464, `orientation`=2.67035, `rotation0`=0, `rotation1`=0, `rotation2`=0.972369, `rotation3`=0.233448 WHERE `guid`=4354;

-- Correct position of Kingsblood in Duskwood (position is off by 1.30492 yards).
UPDATE `gameobject` SET `position_x`=-10967.3, `position_y`=-865.113, `position_z`=64.4771, `orientation`=5.93412, `rotation0`=0, `rotation1`=0, `rotation2`=-0.173648, `rotation3`=0.984808 WHERE `guid`=4377;

-- Correct position of Kingsblood in Alterac Mountains (position is off by 0.950773 yards).
UPDATE `gameobject` SET `position_x`=-47.9175, `position_y`=116.629, `position_z`=58.5075, `orientation`=3.31614, `rotation0`=0, `rotation1`=0, `rotation2`=-0.996194, `rotation3`=0.087165 WHERE `guid`=4278;

-- Correct position of Kingsblood in Arathi Highlands (position is off by 0.92714 yards).
UPDATE `gameobject` SET `position_x`=-1090.85, `position_y`=-2608.37, `position_z`=48.9337, `orientation`=0.331611, `rotation0`=0, `rotation1`=0, `rotation2`=0.165047, `rotation3`=0.986286 WHERE `guid`=4322;

-- Correct position of Kingsblood in Alterac Mountains (position is off by 0.765419 yards).
UPDATE `gameobject` SET `position_x`=-128.47, `position_y`=-603.544, `position_z`=161.321, `orientation`=3.50812, `rotation0`=0, `rotation1`=0, `rotation2`=-0.983254, `rotation3`=0.182238 WHERE `guid`=4371;

-- Correct position of Kingsblood in Hillsbrad Foothills (position is off by 1.08481 yards).
UPDATE `gameobject` SET `position_x`=-379.078, `position_y`=-421.901, `position_z`=53.1298, `orientation`=5.48033, `rotation0`=0, `rotation1`=0, `rotation2`=-0.390731, `rotation3`=0.920505 WHERE `guid`=4299;

-- Correct position of Kingsblood in The Barrens (position is off by 0.143099 yards).
UPDATE `gameobject` SET `position_x`=-1983.06, `position_y`=-2750.87, `position_z`=91.7331, `orientation`=0.715585, `rotation0`=0, `rotation1`=0, `rotation2`=0.350207, `rotation3`=0.936672 WHERE `guid`=4387;

-- Correct position of Kingsblood in Badlands (position is off by 0.655742 yards).
UPDATE `gameobject` SET `position_x`=-6815.46, `position_y`=-2875.63, `position_z`=242.118, `orientation`=2.33874, `rotation0`=0, `rotation1`=0, `rotation2`=0.920505, `rotation3`=0.390732 WHERE `guid`=4427;

-- Correct position of Kingsblood in Wetlands (position is off by 1.58815 yards).
UPDATE `gameobject` SET `position_x`=-2947.88, `position_y`=-2521.12, `position_z`=28.3675, `orientation`=2.09439, `rotation0`=0, `rotation1`=0, `rotation2`=0.866025, `rotation3`=0.500001 WHERE `guid`=4277;

-- Correct position of Kingsblood in Dustwallow Marsh (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-2414.87, `position_y`=-3147.57, `position_z`=33.3782, `orientation`=0.558504, `rotation0`=0, `rotation1`=0, `rotation2`=0.275637, `rotation3`=0.961262 WHERE `guid`=12566;

-- Correct position of Kingsblood in Badlands (position is off by 0.833031 yards).
UPDATE `gameobject` SET `position_x`=-6085.17, `position_y`=-3316.07, `position_z`=256.427, `orientation`=3.57793, `rotation0`=0, `rotation1`=0, `rotation2`=-0.976295, `rotation3`=0.216442 WHERE `guid`=4378;

-- Correct position of Kingsblood in Desolace (position is off by 0.664822 yards).
UPDATE `gameobject` SET `position_x`=-966.763, `position_y`=2083.74, `position_z`=62.1497, `orientation`=6.05629, `rotation0`=0, `rotation1`=0, `rotation2`=-0.113203, `rotation3`=0.993572 WHERE `guid`=4286;

-- Correct position of Kingsblood in Thousand Needles (position is off by 0.55357 yards).
UPDATE `gameobject` SET `position_x`=-6613.46, `position_y`=-3584.18, `position_z`=-58.75, `orientation`=4.92183, `rotation0`=0, `rotation1`=0, `rotation2`=-0.62932, `rotation3`=0.777146 WHERE `guid`=4300;

-- Correct position of Kingsblood in The Barrens (position is off by 0.100098 yards).
UPDATE `gameobject` SET `position_x`=-3135, `position_y`=-2235.9, `position_z`=91.9488, `orientation`=0.523598, `rotation0`=0, `rotation1`=0, `rotation2`=0.258819, `rotation3`=0.965926 WHERE `guid`=4295;

-- Correct position of Kingsblood in Stranglethorn Vale (position is off by 0.941376 yards).
UPDATE `gameobject` SET `position_x`=-12910.7, `position_y`=146.39, `position_z`=24.5323, `orientation`=5.70723, `rotation0`=0, `rotation1`=0, `rotation2`=-0.284015, `rotation3`=0.95882 WHERE `guid`=4418;

-- Correct position of Kingsblood in The Barrens (position is off by 0.294992 yards).
UPDATE `gameobject` SET `position_x`=-1857.72, `position_y`=-3239.05, `position_z`=81.4051, `orientation`=2.26893, `rotation0`=0, `rotation1`=0, `rotation2`=0.906307, `rotation3`=0.422619 WHERE `guid`=4288;

-- Correct position of Kingsblood in Desolace (position is off by 0.0600587 yards).
UPDATE `gameobject` SET `position_x`=-1770.06, `position_y`=1433.31, `position_z`=61.1111, `orientation`=2.09439, `rotation0`=0, `rotation1`=0, `rotation2`=0.866025, `rotation3`=0.500001 WHERE `guid`=4334;

-- Correct position of Kingsblood in The Barrens (position is off by 1.26963 yards).
UPDATE `gameobject` SET `position_x`=-2098.81, `position_y`=-1931.56, `position_z`=96.9205, `orientation`=5.14872, `rotation0`=0, `rotation1`=0, `rotation2`=-0.537299, `rotation3`=0.843392 WHERE `guid`=4329;

-- Correct position of Kingsblood in Arathi Highlands (position is off by 0.132314 yards).
UPDATE `gameobject` SET `position_x`=-1275.89, `position_y`=-2752.05, `position_z`=51.2921, `orientation`=3.64774, `rotation0`=0, `rotation1`=0, `rotation2`=-0.968147, `rotation3`=0.250381 WHERE `guid`=4337;

-- Correct position of Kingsblood in Badlands (position is off by 1.80106 yards).
UPDATE `gameobject` SET `position_x`=-7046, `position_y`=-3581.79, `position_z`=241.981, `orientation`=2.54818, `rotation0`=0, `rotation1`=0, `rotation2`=0.956305, `rotation3`=0.292372 WHERE `guid`=39959;

-- Correct position of Kingsblood in Badlands (position is off by 0.15387 yards).
UPDATE `gameobject` SET `position_x`=-7086.86, `position_y`=-2413.03, `position_z`=243.603, `orientation`=0.139624, `rotation0`=0, `rotation1`=0, `rotation2`=0.0697556, `rotation3`=0.997564 WHERE `guid`=4297;

-- Correct position of Kingsblood in Stranglethorn Vale (position is off by 0.841431 yards).
UPDATE `gameobject` SET `position_x`=-12267.8, `position_y`=-422.817, `position_z`=17.3265, `orientation`=4.04917, `rotation0`=0, `rotation1`=0, `rotation2`=-0.898793, `rotation3`=0.438373 WHERE `guid`=4392;

-- Correct position of Kingsblood in The Barrens (position is off by 1.15984 yards).
UPDATE `gameobject` SET `position_x`=-3917.17, `position_y`=-2119.19, `position_z`=91.6857, `orientation`=3.22886, `rotation0`=0, `rotation1`=0, `rotation2`=-0.999048, `rotation3`=0.0436193 WHERE `guid`=4298;

-- Correct position of Kingsblood in Badlands (position is off by 0.591394 yards).
UPDATE `gameobject` SET `position_x`=-6788.19, `position_y`=-3120.44, `position_z`=240.652, `orientation`=1.90241, `rotation0`=0, `rotation1`=0, `rotation2`=0.814116, `rotation3`=0.580703 WHERE `guid`=4395;

-- Correct position of Kingsblood in The Barrens (position is off by 0.403726 yards).
UPDATE `gameobject` SET `position_x`=-2911.27, `position_y`=-1992.3, `position_z`=93.0076, `orientation`=2.26893, `rotation0`=0, `rotation1`=0, `rotation2`=0.906307, `rotation3`=0.422619 WHERE `guid`=4347;

-- Correct position of Kingsblood in Desolace (position is off by 0.960711 yards).
UPDATE `gameobject` SET `position_x`=-1441.04, `position_y`=2290.71, `position_z`=93.0318, `orientation`=2.86234, `rotation0`=0, `rotation1`=0, `rotation2`=0.990268, `rotation3`=0.139175 WHERE `guid`=4358;

-- Correct position of Kingsblood in Arathi Highlands (position is off by 0.730854 yards).
UPDATE `gameobject` SET `position_x`=-1453.69, `position_y`=-2851.24, `position_z`=40.1021, `orientation`=5.23599, `rotation0`=0, `rotation1`=0, `rotation2`=-0.5, `rotation3`=0.866025 WHERE `guid`=4408;

-- Correct position of Kingsblood in Ashenvale (position is off by 0.842472 yards).
UPDATE `gameobject` SET `position_x`=2918.35, `position_y`=-3461.84, `position_z`=120.189, `orientation`=4.90438, `rotation0`=0, `rotation1`=0, `rotation2`=-0.636078, `rotation3`=0.771625 WHERE `guid`=4368;

-- Correct position of Kingsblood in Stonetalon Mountains (position is off by 0.241916 yards).
UPDATE `gameobject` SET `position_x`=1500.01, `position_y`=1400.27, `position_z`=142.972, `orientation`=3.03684, `rotation0`=0, `rotation1`=0, `rotation2`=0.998629, `rotation3`=0.0523532 WHERE `guid`=4370;

-- Correct position of Kingsblood in The Barrens (position is off by 0.867616 yards).
UPDATE `gameobject` SET `position_x`=-2581.38, `position_y`=-2315.22, `position_z`=91.6668, `orientation`=4.15388, `rotation0`=0, `rotation1`=0, `rotation2`=-0.874619, `rotation3`=0.48481 WHERE `guid`=4379;

-- Correct position of Kingsblood in Duskwood (position is off by 0.94291 yards).
UPDATE `gameobject` SET `position_x`=-11011.1, `position_y`=-949.232, `position_z`=65.1183, `orientation`=4.15388, `rotation0`=0, `rotation1`=0, `rotation2`=-0.874619, `rotation3`=0.48481 WHERE `guid`=4309;

-- Correct position of Kingsblood in Hillsbrad Foothills (position is off by 0.977442 yards).
UPDATE `gameobject` SET `position_x`=-242.454, `position_y`=82.7269, `position_z`=64.4676, `orientation`=3.89209, `rotation0`=0, `rotation1`=0, `rotation2`=-0.930417, `rotation3`=0.366502 WHERE `guid`=4369;

-- Correct position of Kingsblood in Stonetalon Mountains (position is off by 0.797746 yards).
UPDATE `gameobject` SET `position_x`=625.229, `position_y`=1695.67, `position_z`=-18.8574, `orientation`=2.07694, `rotation0`=0, `rotation1`=0, `rotation2`=0.861629, `rotation3`=0.507539 WHERE `guid`=4292;

-- Correct position of Kingsblood in Wetlands (position is off by 0.336149 yards).
UPDATE `gameobject` SET `position_x`=-3054.71, `position_y`=-2842.83, `position_z`=25.5066, `orientation`=3.78737, `rotation0`=0, `rotation1`=0, `rotation2`=-0.948323, `rotation3`=0.317306 WHERE `guid`=4375;

-- Correct position of Kingsblood in Wetlands (position is off by 0.404033 yards).
UPDATE `gameobject` SET `position_x`=-3985.61, `position_y`=-2900.04, `position_z`=12.3601, `orientation`=5.21854, `rotation0`=0, `rotation1`=0, `rotation2`=-0.507538, `rotation3`=0.861629 WHERE `guid`=4357;

-- Correct position of Kingsblood in Duskwood (position is off by 0.646297 yards).
UPDATE `gameobject` SET `position_x`=-11053.7, `position_y`=-822.482, `position_z`=58.9241, `orientation`=1.0821, `rotation0`=0, `rotation1`=0, `rotation2`=0.515038, `rotation3`=0.857168 WHERE `guid`=4407;

-- Correct position of Kingsblood in Thousand Needles (position is off by 0.623553 yards).
UPDATE `gameobject` SET `position_x`=-4380.46, `position_y`=-995.393, `position_z`=-55.849, `orientation`=2.93214, `rotation0`=0, `rotation1`=0, `rotation2`=0.994521, `rotation3`=0.104536 WHERE `guid`=4348;

-- Correct position of Kingsblood in Stranglethorn Vale (position is off by 0.494382 yards).
UPDATE `gameobject` SET `position_x`=-11686.6, `position_y`=-31.29, `position_z`=13.9421, `orientation`=3.50812, `rotation0`=0, `rotation1`=0, `rotation2`=-0.983254, `rotation3`=0.182238 WHERE `guid`=4312;

-- Correct position of Kingsblood in Stranglethorn Vale (position is off by 0.914066 yards).
UPDATE `gameobject` SET `position_x`=-12319.2, `position_y`=-471.44, `position_z`=15.7438, `orientation`=1.06465, `rotation0`=0, `rotation1`=0, `rotation2`=0.507538, `rotation3`=0.861629 WHERE `guid`=4362;

-- Correct position of Kingsblood in Badlands (position is off by 0.542233 yards).
UPDATE `gameobject` SET `position_x`=-7050.53, `position_y`=-2849.27, `position_z`=242.1, `orientation`=3.90954, `rotation0`=0, `rotation1`=0, `rotation2`=-0.927183, `rotation3`=0.374608 WHERE `guid`=4352;

-- Correct position of Kingsblood in Thousand Needles (position is off by 0.00976563 yards).
UPDATE `gameobject` SET `position_x`=-5371.22, `position_y`=-1649.36, `position_z`=-54.8743, `orientation`=0.575957, `rotation0`=0, `rotation1`=0, `rotation2`=0.284015, `rotation3`=0.95882 WHERE `guid`=10415;

-- Correct position of Kingsblood in Stranglethorn Vale (position is off by 0.993553 yards).
UPDATE `gameobject` SET `position_x`=-12127.5, `position_y`=190.618, `position_z`=14.4632, `orientation`=0.471238, `rotation0`=0, `rotation1`=0, `rotation2`=0.233445, `rotation3`=0.97237 WHERE `guid`=4333;

-- Correct position of Kingsblood in Stranglethorn Vale (position is off by 0.139325 yards).
UPDATE `gameobject` SET `position_x`=-11865, `position_y`=232.543, `position_z`=16.3644, `orientation`=4.04917, `rotation0`=0, `rotation1`=0, `rotation2`=-0.898793, `rotation3`=0.438373 WHERE `guid`=4430;

-- Correct position of Kingsblood in Stranglethorn Vale (position is off by 0.96143 yards).
UPDATE `gameobject` SET `position_x`=-11767.3, `position_y`=413.076, `position_z`=44.5881, `orientation`=5.58505, `rotation0`=0, `rotation1`=0, `rotation2`=-0.34202, `rotation3`=0.939693 WHERE `guid`=4326;

-- Correct position of Kingsblood in Stranglethorn Vale (position is off by 0.914177 yards).
UPDATE `gameobject` SET `position_x`=-11699.6, `position_y`=-823.69, `position_z`=35.5478, `orientation`=3.17653, `rotation0`=0, `rotation1`=0, `rotation2`=-0.999847, `rotation3`=0.0174693 WHERE `guid`=4285;

-- Correct position of Kingsblood in The Barrens (position is off by 0.184386 yards).
UPDATE `gameobject` SET `position_x`=-3420.14, `position_y`=-2177.12, `position_z`=91.6667, `orientation`=2.54818, `rotation0`=0, `rotation1`=0, `rotation2`=0.956305, `rotation3`=0.292372 WHERE `guid`=4342;

-- Correct position of Kingsblood in Ashenvale (position is off by 1.10902 yards).
UPDATE `gameobject` SET `position_x`=2080.19, `position_y`=-2744.77, `position_z`=108.548, `orientation`=3.03684, `rotation0`=0, `rotation1`=0, `rotation2`=0.998629, `rotation3`=0.0523532 WHERE `guid`=4423;

-- Correct position of Kingsblood in Hillsbrad Foothills (position is off by 0.124618 yards).
UPDATE `gameobject` SET `position_x`=-551.877, `position_y`=213.812, `position_z`=69.3841, `orientation`=3.10665, `rotation0`=0, `rotation1`=0, `rotation2`=0.999847, `rotation3`=0.0174693 WHERE `guid`=4346;

-- Correct position of Kingsblood in The Barrens (position is off by 0.532546 yards).
UPDATE `gameobject` SET `position_x`=-3207.59, `position_y`=-1790.34, `position_z`=91.6667, `orientation`=2.00713, `rotation0`=0, `rotation1`=0, `rotation2`=0.843391, `rotation3`=0.5373 WHERE `guid`=4330;

-- Correct position of Kingsblood in Stonetalon Mountains (position is off by 1.10271 yards).
UPDATE `gameobject` SET `position_x`=581.357, `position_y`=1533.65, `position_z`=-10.7468, `orientation`=2.9845, `rotation0`=0, `rotation1`=0, `rotation2`=0.996917, `rotation3`=0.0784664 WHERE `guid`=4283;

-- Correct position of Kingsblood in The Barrens (position is off by 0.952289 yards).
UPDATE `gameobject` SET `position_x`=-3718.66, `position_y`=-2255.68, `position_z`=92.7322, `orientation`=4.20625, `rotation0`=0, `rotation1`=0, `rotation2`=-0.861629, `rotation3`=0.507539 WHERE `guid`=4405;

-- Correct position of Kingsblood in Badlands (position is off by 0.668633 yards).
UPDATE `gameobject` SET `position_x`=-6783.38, `position_y`=-4044.25, `position_z`=266.662, `orientation`=0.523598, `rotation0`=0, `rotation1`=0, `rotation2`=0.258819, `rotation3`=0.965926 WHERE `guid`=4421;

-- Correct position of Kingsblood in Wailing Caverns (position is off by 1.15211 yards).
UPDATE `gameobject` SET `position_x`=-548.032, `position_y`=-2306.91, `position_z`=34.6002, `orientation`=2.63544, `rotation0`=0, `rotation1`=0, `rotation2`=0.968147, `rotation3`=0.250381 WHERE `guid`=4324;

-- Correct position of Kingsblood in Stranglethorn Vale (position is off by 1.21684 yards).
UPDATE `gameobject` SET `position_x`=-12278.7, `position_y`=42.6145, `position_z`=17.8215, `orientation`=1.06465, `rotation0`=0, `rotation1`=0, `rotation2`=0.507538, `rotation3`=0.861629 WHERE `guid`=4412;

-- Correct position of Kingsblood in Duskwood (position is off by 0.384104 yards).
UPDATE `gameobject` SET `position_x`=-10245, `position_y`=385.006, `position_z`=56.0608, `orientation`=2.18166, `rotation0`=0, `rotation1`=0, `rotation2`=0.887011, `rotation3`=0.461749 WHERE `guid`=4319;

-- Correct position of Kingsblood in Hillsbrad Foothills (position is off by 1.33657 yards).
UPDATE `gameobject` SET `position_x`=-713.182, `position_y`=-1530.38, `position_z`=56.3959, `orientation`=0.890117, `rotation0`=0, `rotation1`=0, `rotation2`=0.430511, `rotation3`=0.902586 WHERE `guid`=4416;

-- Correct position of Kingsblood in Hillsbrad Foothills (position is off by 1.27175 yards).
UPDATE `gameobject` SET `position_x`=-689.932, `position_y`=-1151.69, `position_z`=58.9228, `orientation`=5.32326, `rotation0`=0, `rotation1`=0, `rotation2`=-0.461748, `rotation3`=0.887011 WHERE `guid`=4282;

-- Correct position of Kingsblood in Hillsbrad Foothills (position is off by 0.903667 yards).
UPDATE `gameobject` SET `position_x`=-799.672, `position_y`=-387.842, `position_z`=17.5608, `orientation`=1.39626, `rotation0`=0, `rotation1`=0, `rotation2`=0.642787, `rotation3`=0.766045 WHERE `guid`=4318;

-- Correct position of Kingsblood in Stonetalon Mountains (position is off by 0.953437 yards).
UPDATE `gameobject` SET `position_x`=-28.7197, `position_y`=-721.868, `position_z`=-7.72236, `orientation`=6.21337, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0348988, `rotation3`=0.999391 WHERE `guid`=4303;

-- Correct position of Kingsblood in Hillsbrad Foothills (position is off by 0.854686 yards).
UPDATE `gameobject` SET `position_x`=-1081.2, `position_y`=-1133.3, `position_z`=51.1375, `orientation`=3.35105, `rotation0`=0, `rotation1`=0, `rotation2`=-0.994521, `rotation3`=0.104536 WHERE `guid`=4313;

-- Correct position of Kingsblood in Duskwood (position is off by 0.270206 yards).
UPDATE `gameobject` SET `position_x`=-10582.2, `position_y`=72.5619, `position_z`=40.2747, `orientation`=5.91667, `rotation0`=0, `rotation1`=0, `rotation2`=-0.182235, `rotation3`=0.983255 WHERE `guid`=4345;

-- Correct position of Kingsblood in Stranglethorn Vale (position is off by 0.860905 yards).
UPDATE `gameobject` SET `position_x`=-12647.3, `position_y`=-690.193, `position_z`=44.1882, `orientation`=5.88176, `rotation0`=0, `rotation1`=0, `rotation2`=-0.199368, `rotation3`=0.979925 WHERE `guid`=4425;

-- Missing Kingsblood spawns in Badlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(40027, 1624, 0, -7047.88, -3445.9, 244.803, 5.58505, 0, 0, -0.34202, 0.939693, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 39959 at 136.008148 yards.
(17877, 1624, 0, -6985.95, -2514.76, 243.313, 1.29154, 0, 0, 0.601814, 0.798636, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4297 at 143.409500 yards.
(17881, 1624, 0, -6949.4, -2819.11, 242.209, 5.98648, 0, 0, -0.147809, 0.989016, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4352 at 105.905609 yards.
(17890, 1624, 0, -6948.58, -2952.54, 241.874, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 11469 at 136.980682 yards.
(17912, 1624, 0, -6719.54, -4116.39, 263.889, 3.01941, 0, 0, 0.998135, 0.0610518, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 4421 at 96.969765 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(40027, 1284, 0, 'Kingsblood', 0, 10), -- Kingsblood in Badlands 21 objects total
(17877, 1284, 0, 'Kingsblood', 0, 10), -- Kingsblood in Badlands 21 objects total
(17881, 1284, 0, 'Kingsblood', 0, 10), -- Kingsblood in Badlands 21 objects total
(17890, 1284, 0, 'Kingsblood', 0, 10), -- Kingsblood in Badlands 21 objects total
(17912, 1284, 0, 'Kingsblood', 0, 10); -- Kingsblood in Badlands 21 objects total

-- Missing Kingsblood spawns in Swamp of Sorrows.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(17919, 1624, 0, -10124.8, -3588.34, 23.4905, 1.0821, 0, 0, 0.515038, 0.857168, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4281 at 32.367912 yards.
(18210, 1624, 0, -10076.5, -3834.19, 23.5613, 5.61996, 0, 0, -0.325567, 0.945519, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4281 at 220.453110 yards.
(30614, 1624, 0, -10327.3, -3494.82, 22.9893, 2.68781, 0, 0, 0.97437, 0.224951, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 30607 at 166.902802 yards.
(30634, 1624, 0, -10021.9, -3956.02, 21.9921, 0.715585, 0, 0, 0.350207, 0.936672, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 30628 at 218.118744 yards.
(18220, 1624, 0, -10339.8, -4218.48, 22.6371, 1.76278, 0, 0, 0.771625, 0.636078, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3948 at 123.478020 yards.
(30773, 1624, 0, -10677.2, -3810.53, 23.3097, 0.750491, 0, 0, 0.366501, 0.930418, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 30765 at 177.287750 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(17919, 1326, 0, 'Kingsblood', 0, 10), -- Kingsblood in Swamp of Sorrows 6 objects total
(18210, 1326, 0, 'Kingsblood', 0, 10), -- Kingsblood in Swamp of Sorrows 6 objects total
(30614, 1326, 0, 'Kingsblood', 0, 10), -- Kingsblood in Swamp of Sorrows 6 objects total
(30634, 1326, 0, 'Kingsblood', 0, 10), -- Kingsblood in Swamp of Sorrows 6 objects total
(18220, 1326, 0, 'Kingsblood', 0, 10), -- Kingsblood in Swamp of Sorrows 6 objects total
(30773, 1326, 0, 'Kingsblood', 0, 10); -- Kingsblood in Swamp of Sorrows 6 objects total

-- Missing Kingsblood spawns in Duskwood.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(17879, 1624, 0, -10525.1, -911.581, 46.8991, 6.00393, 0, 0, -0.139173, 0.990268, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4413 at 72.275368 yards.
(17882, 1624, 0, -10439, -864.635, 46.4699, 4.45059, 0, 0, -0.793353, 0.608762, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4413 at 109.997604 yards.
(33482, 1624, 0, -10799.6, -666.59, 40.8933, 0.174532, 0, 0, 0.0871553, 0.996195, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 33459 at 23.951094 yards.
(17888, 1624, 0, -11006.6, -859.188, 62.6391, 2.00713, 0, 0, 0.843391, 0.5373, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4377 at 41.055748 yards.
(18222, 1624, 0, -10598.5, -952.971, 53.2791, 4.17134, 0, 0, -0.870356, 0.492424, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4413 at 120.720146 yards.
(40028, 1624, 0, -10943.8, 243.869, 28.5117, 1.18682, 0, 0, 0.559193, 0.829038, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 39975 at 124.173485 yards.
(18241, 1624, 0, -10229.6, -33.3671, 32.1215, 5.95157, 0, 0, -0.165047, 0.986286, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4345 at 368.119598 yards.
(18246, 1624, 0, -10710.7, 442.859, 41.0738, 3.4034, 0, 0, -0.991445, 0.130528, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 14027 at 296.010803 yards.
(18249, 1624, 0, -10628, -49.8506, 33.4616, 2.37364, 0, 0, 0.927183, 0.374608, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 17144 at 19.252008 yards.
(18250, 1624, 0, -10292.2, -70.4041, 45.2325, 4.62512, 0, 0, -0.737277, 0.675591, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 4345 at 323.263184 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(17879, 1117, 0, 'Kingsblood', 0, 10), -- Kingsblood in Duskwood 19 objects total
(17882, 1117, 0, 'Kingsblood', 0, 10), -- Kingsblood in Duskwood 19 objects total
(33482, 1117, 0, 'Kingsblood', 0, 10), -- Kingsblood in Duskwood 19 objects total
(17888, 1117, 0, 'Kingsblood', 0, 10), -- Kingsblood in Duskwood 19 objects total
(18222, 1117, 0, 'Kingsblood', 0, 10), -- Kingsblood in Duskwood 19 objects total
(40028, 1117, 0, 'Kingsblood', 0, 10), -- Kingsblood in Duskwood 19 objects total
(18241, 1117, 0, 'Kingsblood', 0, 10), -- Kingsblood in Duskwood 19 objects total
(18246, 1117, 0, 'Kingsblood', 0, 10), -- Kingsblood in Duskwood 19 objects total
(18249, 1117, 0, 'Kingsblood', 0, 10), -- Kingsblood in Duskwood 19 objects total
(18250, 1117, 0, 'Kingsblood', 0, 10); -- Kingsblood in Duskwood 19 objects total

-- Missing Kingsblood spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(34102, 1624, 0, -2924.11, -1349.44, 9.14602, 4.32842, 0, 0, -0.829037, 0.559194, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34095 at 62.035286 yards.
(17908, 1624, 0, -3175.66, -952.048, 9.59336, 0.383971, 0, 0, 0.190808, 0.981627, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 14968 at 122.960762 yards.
(17911, 1624, 0, -3066.41, -2901.28, 24.6022, 4.32842, 0, 0, -0.829037, 0.559194, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 14882 at 8.202755 yards.
(34149, 1624, 0, -3368.22, -2250.94, 51.8282, 4.53786, 0, 0, -0.766044, 0.642789, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34129 at 80.870995 yards.
(17913, 1624, 0, -3488.41, -1359.98, 11.2726, 0.628317, 0, 0, 0.309016, 0.951057, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4341 at 396.172150 yards.
(17920, 1624, 0, -3484.24, -2721.16, 10.8223, 0.698131, 0, 0, 0.34202, 0.939693, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4008 at 279.044586 yards.
(34201, 1624, 0, -3097.8, -2239.42, 9.85018, 6.00393, 0, 0, -0.139173, 0.990268, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34129 at 258.599396 yards.
(34202, 1624, 0, -3357.61, -2803.33, 17.5986, 2.67035, 0, 0, 0.972369, 0.233448, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34136 at 189.114349 yards.
(18239, 1624, 0, -3692.01, -3027.69, 14.4341, 0.663223, 0, 0, 0.325567, 0.945519, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4419 at 69.137123 yards.
(46466, 1624, 0, -2783.93, -1984.39, 26.1942, 5.20108, 0, 0, -0.515038, 0.857168, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 46465 at 108.599609 yards.
(18248, 1624, 0, -3673.22, -2901.01, 12.9926, 5.93412, 0, 0, -0.173648, 0.984808, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 14891 at 156.644379 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(34102, 1155, 0, 'Kingsblood', 0, 10), -- Kingsblood in Wetlands 26 objects total
(17908, 1155, 0, 'Kingsblood', 0, 10), -- Kingsblood in Wetlands 26 objects total
(17911, 1155, 0, 'Kingsblood', 0, 10), -- Kingsblood in Wetlands 26 objects total
(34149, 1155, 0, 'Kingsblood', 0, 10), -- Kingsblood in Wetlands 26 objects total
(17913, 1155, 0, 'Kingsblood', 0, 10), -- Kingsblood in Wetlands 26 objects total
(17920, 1155, 0, 'Kingsblood', 0, 10), -- Kingsblood in Wetlands 26 objects total
(34201, 1155, 0, 'Kingsblood', 0, 10), -- Kingsblood in Wetlands 26 objects total
(34202, 1155, 0, 'Kingsblood', 0, 10), -- Kingsblood in Wetlands 26 objects total
(18239, 1155, 0, 'Kingsblood', 0, 10), -- Kingsblood in Wetlands 26 objects total
(46466, 1155, 0, 'Kingsblood', 0, 10), -- Kingsblood in Wetlands 26 objects total
(18248, 1155, 0, 'Kingsblood', 0, 10); -- Kingsblood in Wetlands 26 objects total

-- Missing Kingsblood spawns in Dustwallow Marsh.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(17875, 1624, 1, -3037.78, -4030.53, 39.2131, 6.02139, 0, 0, -0.130526, 0.991445, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 13655 at 441.042755 yards.
(17876, 1624, 1, -2750.72, -3012.27, 36.799, 0.977383, 0, 0, 0.469471, 0.882948, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16994 at 194.932465 yards.
(17883, 1624, 1, -3445.04, -3119.92, 39.4034, 0.296705, 0, 0, 0.147809, 0.989016, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 14671 at 239.084091 yards.
(17884, 1624, 1, -3661.01, -3444, 40.2866, 4.29351, 0, 0, -0.83867, 0.54464, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 14671 at 389.623383 yards.
(56136, 1624, 1, -3571.68, -2939.54, 34.2335, 5.70723, 0, 0, -0.284015, 0.95882, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 56016 at 111.736221 yards.
(17907, 1624, 1, -3545.88, -3147.84, 37.2179, 6.00393, 0, 0, -0.139173, 0.990268, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 14671 at 159.321335 yards.
(17917, 1624, 1, -2989.42, -3720.05, 38.4237, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 13655 at 211.083374 yards.
(18203, 1624, 1, -3133.65, -3765.89, 40.7043, 0.506145, 0, 0, 0.25038, 0.968148, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 13655 at 362.246643 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(17875, 1039, 0, 'Kingsblood', 0, 10), -- Kingsblood in Dustwallow Marsh 5 objects total
(17876, 1039, 0, 'Kingsblood', 0, 10), -- Kingsblood in Dustwallow Marsh 5 objects total
(17883, 1039, 0, 'Kingsblood', 0, 10), -- Kingsblood in Dustwallow Marsh 5 objects total
(17884, 1039, 0, 'Kingsblood', 0, 10), -- Kingsblood in Dustwallow Marsh 5 objects total
(56136, 1039, 0, 'Kingsblood', 0, 10), -- Kingsblood in Dustwallow Marsh 5 objects total
(17907, 1039, 0, 'Kingsblood', 0, 10), -- Kingsblood in Dustwallow Marsh 5 objects total
(17917, 1039, 0, 'Kingsblood', 0, 10), -- Kingsblood in Dustwallow Marsh 5 objects total
(18203, 1039, 0, 'Kingsblood', 0, 10); -- Kingsblood in Dustwallow Marsh 5 objects total

-- Missing Kingsblood spawns in The Barrens.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(17874, 1624, 1, -3254.12, -1900.28, 96.5674, 1.41372, 0, 0, 0.649447, 0.760406, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4330 at 119.635963 yards.
(17886, 1624, 1, -1945.03, -3406.26, 58.9039, 4.15388, 0, 0, -0.874619, 0.48481, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4288 at 189.876099 yards.
(17921, 1624, 1, -3879.04, -2228.16, 91.6667, 0.506145, 0, 0, 0.25038, 0.968148, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4298 at 114.962799 yards.
(18212, 1624, 1, -3752.99, -1823.72, 93.9388, 1.25664, 0, 0, 0.587785, 0.809017, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 13378 at 140.523315 yards.
(18231, 1624, 1, -3754.5, -2373.85, 94.315, 1.74533, 0, 0, 0.766044, 0.642789, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4405 at 124.339905 yards.
(18235, 1624, 1, -3751.89, -1915.54, 92.8664, 5.51524, 0, 0, -0.374606, 0.927184, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 13378 at 198.991867 yards.
(18238, 1624, 1, -3783.09, -2183.34, 93.6768, 1.48353, 0, 0, 0.67559, 0.737278, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4405 at 96.813965 yards.
(18242, 1624, 1, -3776.07, -1657.71, 93.783, 3.42085, 0, 0, -0.990268, 0.139175, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 13378 at 147.788254 yards.
(18243, 1624, 1, -3079.82, -1797.63, 91.8474, 0.349065, 0, 0, 0.173648, 0.984808, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4330 at 128.406952 yards.
(18244, 1624, 1, -2711.57, -1954.99, 96.872, 0.645772, 0, 0, 0.317305, 0.948324, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 4347 at 202.871674 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(17874, 1038, 0, 'Kingsblood', 0, 10), -- Kingsblood in Barrens 33 objects total
(17886, 1038, 0, 'Kingsblood', 0, 10), -- Kingsblood in Barrens 33 objects total
(17921, 1038, 0, 'Kingsblood', 0, 10), -- Kingsblood in Barrens 33 objects total
(18212, 1038, 0, 'Kingsblood', 0, 10), -- Kingsblood in Barrens 33 objects total
(18231, 1038, 0, 'Kingsblood', 0, 10), -- Kingsblood in Barrens 33 objects total
(18235, 1038, 0, 'Kingsblood', 0, 10), -- Kingsblood in Barrens 33 objects total
(18238, 1038, 0, 'Kingsblood', 0, 10), -- Kingsblood in Barrens 33 objects total
(18242, 1038, 0, 'Kingsblood', 0, 10), -- Kingsblood in Barrens 33 objects total
(18243, 1038, 0, 'Kingsblood', 0, 10), -- Kingsblood in Barrens 33 objects total
(18244, 1038, 0, 'Kingsblood', 0, 10); -- Kingsblood in Barrens 33 objects total

-- Missing Kingsblood spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(17870, 1624, 0, -12395.4, -141.24, 15.1016, 2.77507, 0, 0, 0.983254, 0.182238, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 11810 at 135.318649 yards.
(17914, 1624, 0, -13428.5, 669.158, 9.00704, 4.53786, 0, 0, -0.766044, 0.642789, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4391 at 511.026520 yards.
(17918, 1624, 0, -12670.5, -845.013, 53.1218, 6.02139, 0, 0, -0.130526, 0.991445, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4291 at 85.638176 yards.
(17922, 1624, 0, -11801.7, 401.433, 44.6777, 4.15388, 0, 0, -0.874619, 0.48481, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4326 at 36.321484 yards.
(17923, 1624, 0, -12248.2, -674.489, 13.2555, 0.331611, 0, 0, 0.165047, 0.986286, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4383 at 80.265808 yards.
(18192, 1624, 0, -12786.9, -108.016, 4.81024, 4.93928, 0, 0, -0.622514, 0.782609, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12120 at 150.563843 yards.
(32847, 1624, 0, -13038.2, 338.762, 20.095, 4.41568, 0, 0, -0.803857, 0.594823, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 32841 at 42.068768 yards.
(18224, 1624, 0, -11969.3, 117.251, 10.1975, 0.663223, 0, 0, 0.325567, 0.945519, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4305 at 49.950169 yards.
(18229, 1624, 0, -12200.6, 139.857, 18.0954, 3.01941, 0, 0, 0.998135, 0.0610518, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4333 at 89.961548 yards.
(18240, 1624, 0, -12147.8, -712.958, 17.1765, 0.209439, 0, 0, 0.104528, 0.994522, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4301 at 115.591179 yards.
(30814, 1624, 0, -11982.3, -852.595, 32.9149, 3.24635, 0, 0, -0.998629, 0.0523532, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 30809 at 267.691589 yards.
(32073, 1624, 0, -13340, 168.89, 17.202, 0.942477, 0, 0, 0.45399, 0.891007, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 32071 at 73.897369 yards.
(30815, 1624, 0, -11965.1, -775.195, 18.2167, 2.54818, 0, 0, 0.956305, 0.292372, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 30809 at 188.032852 yards.
(18245, 1624, 0, -11871.1, -181.152, 16.7947, 1.23918, 0, 0, 0.580703, 0.814116, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4312 at 237.584564 yards.
(18247, 1624, 0, -12081.5, -745.165, 12.3231, 2.54818, 0, 0, 0.956305, 0.292372, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 4301 at 156.948639 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(17870, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(17914, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(17918, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(17922, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(17923, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(18192, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(32847, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(18224, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(18229, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(18240, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(30814, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(32073, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(30815, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(18245, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(18247, 1170, 0, 'Kingsblood', 0, 10); -- Kingsblood in Stranglethorn 53 objects total

-- Missing Kingsblood spawns in Alterac Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(32362, 1624, 0, 1084.62, -621.656, 90.2999, 0.366518, 0, 0, 0.182235, 0.983255, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 32188 at 165.497787 yards.
(33294, 1624, 0, -60.0194, -194.283, 131.666, 5.89921, 0, 0, -0.190808, 0.981627, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 33197 at 141.146011 yards.
(21284, 1624, 0, -119.69, -310.971, 144.306, 1.78023, 0, 0, 0.777145, 0.629321, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 21279 at 96.368988 yards.
(32454, 1624, 0, 475.342, -957.903, 131.565, 1.5708, 0, 0, 0.707107, 0.707107, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 32209 at 146.296127 yards.
(33440, 1624, 0, 192.174, -601.28, 126.948, 2.9845, 0, 0, 0.996917, 0.0784664, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 33305 at 106.281044 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(32362, 1057, 0, 'Kingsblood', 0, 10), -- Kingsblood in Alterac 6 objects total
(33294, 1057, 0, 'Kingsblood', 0, 10), -- Kingsblood in Alterac 6 objects total
(21284, 1057, 0, 'Kingsblood', 0, 10), -- Kingsblood in Alterac 6 objects total
(32454, 1057, 0, 'Kingsblood', 0, 10), -- Kingsblood in Alterac 6 objects total
(33440, 1057, 0, 'Kingsblood', 0, 10); -- Kingsblood in Alterac 6 objects total

-- Missing Kingsblood spawns in Arathi Highlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(17868, 1624, 0, -1686.45, -2779.43, 46.748, 2.72271, 0, 0, 0.978148, 0.207912, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4030 at 166.206161 yards.
(17872, 1624, 0, -1726.49, -2720.18, 41.8945, 3.4034, 0, 0, -0.991445, 0.130528, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4030 at 186.062271 yards.
(17885, 1624, 0, -984.745, -3346.48, 56.8505, 5.75959, 0, 0, -0.258819, 0.965926, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16935 at 132.697296 yards.
(35628, 1624, 0, -1052.49, -1983.44, 67.8225, 3.78737, 0, 0, -0.948323, 0.317306, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 35555 at 235.169434 yards.
(35629, 1624, 0, -1193.48, -3173.99, 42.3659, 0.401425, 0, 0, 0.199368, 0.979925, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 35576 at 136.939407 yards.
(17909, 1624, 0, -1215.86, -2982.48, 46.8069, 2.70526, 0, 0, 0.976295, 0.216442, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16937 at 108.639229 yards.
(35630, 1624, 0, -1163.82, -1529.36, 56.8556, 4.4855, 0, 0, -0.782608, 0.622515, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 35554 at 162.563293 yards.
(35634, 1624, 0, -1053.47, -1787.58, 59.3678, 0.750491, 0, 0, 0.366501, 0.930418, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 35554 at 219.477524 yards.
(35635, 1624, 0, -1081.28, -3111.25, 48.0621, 5.06146, 0, 0, -0.573576, 0.819152, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 35576 at 137.750305 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(17868, 1180, 0, 'Kingsblood', 0, 10), -- Kingsblood in Arathi 25 objects total
(17872, 1180, 0, 'Kingsblood', 0, 10), -- Kingsblood in Arathi 25 objects total
(17885, 1180, 0, 'Kingsblood', 0, 10), -- Kingsblood in Arathi 25 objects total
(35628, 1180, 0, 'Kingsblood', 0, 10), -- Kingsblood in Arathi 25 objects total
(35629, 1180, 0, 'Kingsblood', 0, 10), -- Kingsblood in Arathi 25 objects total
(17909, 1180, 0, 'Kingsblood', 0, 10), -- Kingsblood in Arathi 25 objects total
(35630, 1180, 0, 'Kingsblood', 0, 10), -- Kingsblood in Arathi 25 objects total
(35634, 1180, 0, 'Kingsblood', 0, 10), -- Kingsblood in Arathi 25 objects total
(35635, 1180, 0, 'Kingsblood', 0, 10); -- Kingsblood in Arathi 25 objects total

-- Missing Kingsblood spawns in Hillsbrad Foothills.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(34240, 1624, 0, -187.114, -1285.37, 106.141, 2.53072, 0, 0, 0.953716, 0.300708, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34239 at 153.738388 yards.
(21282, 1624, 0, -1118.94, -989.685, 56.5378, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 21253 at 136.774567 yards.
(35627, 1624, 0, -904.452, -1262.58, 52.616, 0.383971, 0, 0, 0.190808, 0.981627, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 35552 at 50.131981 yards.
(34254, 1624, 0, -906.656, -868.855, 25.3802, 0.645772, 0, 0, 0.317305, 0.948324, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34253 at 229.072113 yards.
(21283, 1624, 0, -713.998, -1279.64, 61.4431, 1.74533, 0, 0, 0.766044, 0.642789, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 21254 at 48.376545 yards.
(30216, 1624, 0, -522.197, -157.553, 52.367, 5.72468, 0, 0, -0.275637, 0.961262, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 30023 at 171.962326 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(34240, 1051, 0, 'Kingsblood', 0, 10), -- Kingsblood in Hillsbrad 38 objects total
(21282, 1051, 0, 'Kingsblood', 0, 10), -- Kingsblood in Hillsbrad 38 objects total
(35627, 1051, 0, 'Kingsblood', 0, 10), -- Kingsblood in Hillsbrad 38 objects total
(34254, 1051, 0, 'Kingsblood', 0, 10), -- Kingsblood in Hillsbrad 38 objects total
(21283, 1051, 0, 'Kingsblood', 0, 10), -- Kingsblood in Hillsbrad 38 objects total
(30216, 1051, 0, 'Kingsblood', 0, 10); -- Kingsblood in Hillsbrad 38 objects total

-- Missing Kingsblood spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(48071, 1624, 1, 3357.22, 592.805, 3.73639, 0.523598, 0, 0, 0.258819, 0.965926, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 47949 at 31.522264 yards.
(48072, 1624, 1, 2849.34, -1983.63, 163.306, 3.57793, 0, 0, -0.976295, 0.216442, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 47953 at 266.390076 yards.
(18214, 1624, 1, 3094.44, -1596.81, 188.203, 2.82743, 0, 0, 0.987688, 0.156436, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9854 at 223.269638 yards.
(18215, 1624, 1, 3013.79, -1848.96, 170.763, 1.98967, 0, 0, 0.83867, 0.54464, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9854 at 143.798126 yards.
(48073, 1624, 1, 2552.5, -1973.38, 143.599, 2.33874, 0, 0, 0.920505, 0.390732, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 47953 at 32.791821 yards.
(32602, 1624, 1, 2111.2, -3017.49, 111.796, 4.25861, 0, 0, -0.848047, 0.529921, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 32569 at 138.559494 yards.
(18237, 1624, 1, 4030.25, 164.387, 4.05102, 0.244346, 0, 0, 0.121869, 0.992546, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4311 at 360.216034 yards.
(32605, 1624, 1, 2192.14, -972.788, 94.6969, 2.51327, 0, 0, 0.951056, 0.309017, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 32586 at 116.218430 yards.
(48074, 1624, 1, 2852.96, -785.46, 156.364, 4.81711, 0, 0, -0.66913, 0.743145, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 47951 at 555.306702 yards.
(48075, 1624, 1, 2309.54, -944.396, 88.0331, 0.59341, 0, 0, 0.292371, 0.956305, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 47947 at 201.515457 yards.
(32625, 1624, 1, 2132.78, -2968.13, 114.307, 5.42797, 0, 0, -0.414693, 0.909961, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 32569 at 177.350067 yards.
(48076, 1624, 1, 2857.16, -2521.59, 220.353, 3.57793, 0, 0, -0.976295, 0.216442, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 47952 at 303.021179 yards.
(48077, 1624, 1, 3178.81, 657.709, 2.36676, 1.43117, 0, 0, 0.656058, 0.75471, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 47949 at 206.800095 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(48071, 1078, 0, 'Kingsblood', 0, 10), -- Kingsblood in Ashenvale 27 objects total
(48072, 1078, 0, 'Kingsblood', 0, 10), -- Kingsblood in Ashenvale 27 objects total
(18214, 1078, 0, 'Kingsblood', 0, 10), -- Kingsblood in Ashenvale 27 objects total
(18215, 1078, 0, 'Kingsblood', 0, 10), -- Kingsblood in Ashenvale 27 objects total
(48073, 1078, 0, 'Kingsblood', 0, 10), -- Kingsblood in Ashenvale 27 objects total
(32602, 1078, 0, 'Kingsblood', 0, 10), -- Kingsblood in Ashenvale 27 objects total
(18237, 1078, 0, 'Kingsblood', 0, 10), -- Kingsblood in Ashenvale 27 objects total
(32605, 1078, 0, 'Kingsblood', 0, 10), -- Kingsblood in Ashenvale 27 objects total
(48074, 1078, 0, 'Kingsblood', 0, 10), -- Kingsblood in Ashenvale 27 objects total
(48075, 1078, 0, 'Kingsblood', 0, 10), -- Kingsblood in Ashenvale 27 objects total
(32625, 1078, 0, 'Kingsblood', 0, 10), -- Kingsblood in Ashenvale 27 objects total
(48076, 1078, 0, 'Kingsblood', 0, 10), -- Kingsblood in Ashenvale 27 objects total
(48077, 1078, 0, 'Kingsblood', 0, 10); -- Kingsblood in Ashenvale 27 objects total

-- Missing Kingsblood spawns in Thousand Needles.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(17866, 1624, 1, -5361.9, -3237.28, -43.1254, 6.10865, 0, 0, -0.0871553, 0.996195, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16814 at 347.922058 yards.
(17867, 1624, 1, -5323.93, -2830.42, -54.6644, 0.506145, 0, 0, 0.25038, 0.968148, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16814 at 119.893242 yards.
(17869, 1624, 1, -5022.25, -2211.85, -54.0231, 2.80998, 0, 0, 0.986285, 0.16505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4428 at 497.660217 yards.
(17887, 1624, 1, -6319.89, -3515.23, -58.75, 1.44862, 0, 0, 0.66262, 0.748956, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4356 at 78.512344 yards.
(17915, 1624, 1, -5649.32, -3652.89, -58.75, 5.42797, 0, 0, -0.414693, 0.909961, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16860 at 263.960663 yards.
(17916, 1624, 1, -5561.96, -2529.74, -54.2826, 5.72468, 0, 0, -0.275637, 0.961262, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4428 at 278.293427 yards.
(18218, 1624, 1, -5155.9, -2450.38, -52.7186, 4.43314, 0, 0, -0.798635, 0.601815, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4428 at 411.512817 yards.
(18221, 1624, 1, -4788.75, -1980.07, -59.9618, 2.58308, 0, 0, 0.961261, 0.27564, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16811 at 386.841705 yards.
(18233, 1624, 1, -6450.85, -3848.12, -58.75, 0.558504, 0, 0, 0.275637, 0.961262, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4300 at 309.922729 yards.
(18234, 1624, 1, -5429.14, -2040.26, -64.7291, 0.488691, 0, 0, 0.241921, 0.970296, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 16816 at 165.276840 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(17866, 1136, 0, 'Kingsblood', 0, 10), -- Kingsblood in Thousand Needles 15 objects total
(17867, 1136, 0, 'Kingsblood', 0, 10), -- Kingsblood in Thousand Needles 15 objects total
(17869, 1136, 0, 'Kingsblood', 0, 10), -- Kingsblood in Thousand Needles 15 objects total
(17887, 1136, 0, 'Kingsblood', 0, 10), -- Kingsblood in Thousand Needles 15 objects total
(17915, 1136, 0, 'Kingsblood', 0, 10), -- Kingsblood in Thousand Needles 15 objects total
(17916, 1136, 0, 'Kingsblood', 0, 10), -- Kingsblood in Thousand Needles 15 objects total
(18218, 1136, 0, 'Kingsblood', 0, 10), -- Kingsblood in Thousand Needles 15 objects total
(18221, 1136, 0, 'Kingsblood', 0, 10), -- Kingsblood in Thousand Needles 15 objects total
(18233, 1136, 0, 'Kingsblood', 0, 10), -- Kingsblood in Thousand Needles 15 objects total
(18234, 1136, 0, 'Kingsblood', 0, 10); -- Kingsblood in Thousand Needles 15 objects total

-- Missing Kingsblood spawns in Desolace.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(17871, 1624, 1, -196.438, 1116.59, 87.2241, 2.05949, 0, 0, 0.857167, 0.515038, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4389 at 401.905884 yards.
(17873, 1624, 1, -333.244, 2384.28, 37.4758, 4.59022, 0, 0, -0.748956, 0.66262, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4316 at 456.901978 yards.
(17878, 1624, 1, -1228.87, 2200.36, 91.8946, 5.11382, 0, 0, -0.551936, 0.833886, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4358 at 231.480927 yards.
(17880, 1624, 1, -1017.17, 952.096, 91.9954, 6.0912, 0, 0, -0.0958452, 0.995396, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4389 at 500.255402 yards.
(18194, 1624, 1, -1883.5, 2814.56, 55.792, 3.10665, 0, 0, 0.999847, 0.0174693, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4388 at 170.506622 yards.
(18205, 1624, 1, -366.88, 1950.63, 111.301, 0.174532, 0, 0, 0.0871553, 0.996195, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4398 at 372.357513 yards.
(18880, 1624, 1, -781.216, 1089.28, 89.3548, 4.83456, 0, 0, -0.66262, 0.748956, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 18624 at 317.488007 yards.
(18236, 1624, 1, -1619.56, 1171.6, 90.3512, 0.890117, 0, 0, 0.430511, 0.902586, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 4334 at 303.280945 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(17871, 1138, 0, 'Kingsblood', 0, 10), -- Kingsblood in Desolace 13 objects total
(17873, 1138, 0, 'Kingsblood', 0, 10), -- Kingsblood in Desolace 13 objects total
(17878, 1138, 0, 'Kingsblood', 0, 10), -- Kingsblood in Desolace 13 objects total
(17880, 1138, 0, 'Kingsblood', 0, 10), -- Kingsblood in Desolace 13 objects total
(18194, 1138, 0, 'Kingsblood', 0, 10), -- Kingsblood in Desolace 13 objects total
(18205, 1138, 0, 'Kingsblood', 0, 10), -- Kingsblood in Desolace 13 objects total
(18880, 1138, 0, 'Kingsblood', 0, 10), -- Kingsblood in Desolace 13 objects total
(18236, 1138, 0, 'Kingsblood', 0, 10); -- Kingsblood in Desolace 13 objects total

-- Missing Kingsblood spawns in Stonetalon Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(47482, 1624, 1, 1105.98, -239.175, -1.38236, 0.663223, 0, 0, 0.325567, 0.945519, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 47402 at 230.753189 yards.
(47483, 1624, 1, 2455.99, 1628.16, 287.085, 4.64258, 0, 0, -0.731354, 0.681998, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 47399 at 353.865387 yards.
(17910, 1624, 1, 579.086, 1700.51, -11.205, 6.00393, 0, 0, -0.139173, 0.990268, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4292 at 46.343693 yards.
(47484, 1624, 1, 2613.47, 1547.49, 261.202, 3.24635, 0, 0, -0.998629, 0.0523532, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 47389 at 235.650391 yards.
(47485, 1624, 1, 55.6568, -82.2592, 19.7826, 3.3685, 0, 0, -0.993571, 0.113208, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 47413 at 161.113083 yards.
(47487, 1624, 1, 1509.59, -235.847, 29.0809, 0.558504, 0, 0, 0.275637, 0.961262, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 47386 at 278.343109 yards.
(18199, 1624, 1, 1144.66, 692.578, 145.623, 2.46091, 0, 0, 0.942641, 0.333808, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4317 at 255.622528 yards.
(18201, 1624, 1, 1420.46, 723.077, 146.08, 2.35619, 0, 0, 0.92388, 0.382683, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 10294 at 314.447632 yards.
(47488, 1624, 1, 2370.62, 1459.79, 277.939, 1.0472, 0, 0, 0.5, 0.866025, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 47399 at 250.831146 yards.
(47489, 1624, 1, 881.701, 1748.01, -12.252, 5.34071, 0, 0, -0.45399, 0.891007, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 47438 at 44.563972 yards.
(47490, 1624, 1, 1161.17, 292.83, 15.5815, 2.30383, 0, 0, 0.913545, 0.406738, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 47402 at 315.393524 yards.
(47491, 1624, 1, 1449.23, -253.817, 12.8397, 1.76278, 0, 0, 0.771625, 0.636078, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 47386 at 218.904587 yards.
(47492, 1624, 1, 1415.75, 77.1022, 14.3272, 0.59341, 0, 0, 0.292371, 0.956305, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 47402 at 351.418152 yards.
(47493, 1624, 1, 1049.41, 57.1624, 10.1874, 3.57793, 0, 0, -0.976295, 0.216442, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 47402 at 72.687134 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(47482, 1088, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stonetalon 26 objects total
(47483, 1088, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stonetalon 26 objects total
(17910, 1088, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stonetalon 26 objects total
(47484, 1088, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stonetalon 26 objects total
(47485, 1088, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stonetalon 26 objects total
(47487, 1088, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stonetalon 26 objects total
(18199, 1088, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stonetalon 26 objects total
(18201, 1088, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stonetalon 26 objects total
(47488, 1088, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stonetalon 26 objects total
(47489, 1088, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stonetalon 26 objects total
(47490, 1088, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stonetalon 26 objects total
(47491, 1088, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stonetalon 26 objects total
(47492, 1088, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stonetalon 26 objects total
(47493, 1088, 0, 'Kingsblood', 0, 10); -- Kingsblood in Stonetalon 26 objects total

-- Missing Kingsblood spawns in Wailing Caverns.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(18207, 1624, 1, -645.017, -2182.7, 45.0493, 3.26377, 0, 0, -0.998135, 0.0610518, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 4036 at 82.217796 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(18207, 1053, 0, 'Kingsblood', 0, 10); -- Herbs in Wailing Caverns

-- Correct position of Liferoot in Stranglethorn Vale (position is off by 0.502431 yards).
UPDATE `gameobject` SET `position_x`=-13456.4, `position_y`=734.981, `position_z`=5.53083, `orientation`=3.29869, `rotation0`=0, `rotation1`=0, `rotation2`=-0.996917, `rotation3`=0.0784664 WHERE `guid`=7367;

-- Correct position of Liferoot in Wetlands (position is off by 2.15239 yards).
UPDATE `gameobject` SET `position_x`=-3389.46, `position_y`=-2702.66, `position_z`=8.36749, `orientation`=5.44543, `rotation0`=0, `rotation1`=0, `rotation2`=-0.406736, `rotation3`=0.913546 WHERE `guid`=39968;

-- Correct position of Liferoot in Alterac Mountains (position is off by 1.14085 yards).
UPDATE `gameobject` SET `position_x`=297.799, `position_y`=-1378.66, `position_z`=38.981, `orientation`=5.09636, `rotation0`=0, `rotation1`=0, `rotation2`=-0.559193, `rotation3`=0.829038 WHERE `guid`=7527;

-- Correct position of Liferoot in Arathi Highlands (position is off by 0.784682 yards).
UPDATE `gameobject` SET `position_x`=-1335.85, `position_y`=-1732.77, `position_z`=55.816, `orientation`=3.31614, `rotation0`=0, `rotation1`=0, `rotation2`=-0.996194, `rotation3`=0.087165 WHERE `guid`=7345;

-- Correct position of Liferoot in Stranglethorn Vale (position is off by 0.000100136 yards).
UPDATE `gameobject` SET `position_x`=-12423.7, `position_y`=-335.87, `position_z`=15.0724, `orientation`=4.85202, `rotation0`=0, `rotation1`=0, `rotation2`=-0.656058, `rotation3`=0.75471 WHERE `guid`=6642;

-- Correct position of Liferoot in Stranglethorn Vale (position is off by 0.809729 yards).
UPDATE `gameobject` SET `position_x`=-12554.4, `position_y`=-180.455, `position_z`=13.9325, `orientation`=3.00195, `rotation0`=0, `rotation1`=0, `rotation2`=0.997563, `rotation3`=0.0697661 WHERE `guid`=7372;

-- Correct position of Liferoot in Arathi Highlands (position is off by 0.320465 yards).
UPDATE `gameobject` SET `position_x`=-1950.31, `position_y`=-2507.08, `position_z`=72.3042, `orientation`=1.22173, `rotation0`=0, `rotation1`=0, `rotation2`=0.573576, `rotation3`=0.819152 WHERE `guid`=7518;

-- Correct position of Liferoot in Desolace (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-1659.96, `position_y`=1469.15, `position_z`=59.5974, `orientation`=2.54818, `rotation0`=0, `rotation1`=0, `rotation2`=0.956305, `rotation3`=0.292372 WHERE `guid`=21386;

-- Correct position of Liferoot in Desolace (position is off by 1.70741 yards).
UPDATE `gameobject` SET `position_x`=-1867.09, `position_y`=982.742, `position_z`=88.1002, `orientation`=5.32326, `rotation0`=0, `rotation1`=0, `rotation2`=-0.461748, `rotation3`=0.887011 WHERE `guid`=7458;

-- Correct position of Liferoot in Desolace (position is off by 0.331797 yards).
UPDATE `gameobject` SET `position_x`=-1889.67, `position_y`=1840.48, `position_z`=54.6402, `orientation`=4.04917, `rotation0`=0, `rotation1`=0, `rotation2`=-0.898793, `rotation3`=0.438373 WHERE `guid`=7469;

-- Correct position of Liferoot in Alterac Mountains (position is off by 0.806933 yards).
UPDATE `gameobject` SET `position_x`=534.668, `position_y`=-1541.55, `position_z`=40.6436, `orientation`=1.93731, `rotation0`=0, `rotation1`=0, `rotation2`=0.824125, `rotation3`=0.566408 WHERE `guid`=7452;

-- Correct position of Liferoot in Stranglethorn Vale (position is off by 0.429747 yards).
UPDATE `gameobject` SET `position_x`=-12001.2, `position_y`=-349.352, `position_z`=11.4441, `orientation`=5.41052, `rotation0`=0, `rotation1`=0, `rotation2`=-0.422618, `rotation3`=0.906308 WHERE `guid`=7499;

-- Correct position of Liferoot in Stranglethorn Vale (position is off by 0.0010376 yards).
UPDATE `gameobject` SET `position_x`=-13349.2, `position_y`=745.215, `position_z`=4.4602, `orientation`=0.90757, `rotation0`=0, `rotation1`=0, `rotation2`=0.438371, `rotation3`=0.898794 WHERE `guid`=6656;

-- Correct position of Liferoot in Feralas (position is off by 0.768115 yards).
UPDATE `gameobject` SET `position_x`=-4510.99, `position_y`=2089.55, `position_z`=1.78086, `orientation`=4.36332, `rotation0`=0, `rotation1`=0, `rotation2`=-0.819152, `rotation3`=0.573577 WHERE `guid`=7477;

-- Correct position of Liferoot in Desolace (position is off by 0.300049 yards).
UPDATE `gameobject` SET `position_x`=-1795.3, `position_y`=878.776, `position_z`=89.9599, `orientation`=5.34071, `rotation0`=0, `rotation1`=0, `rotation2`=-0.45399, `rotation3`=0.891007 WHERE `guid`=7437;

-- Correct position of Liferoot in Alterac Mountains (position is off by 0.652222 yards).
UPDATE `gameobject` SET `position_x`=396.544, `position_y`=-1424.91, `position_z`=38.9625, `orientation`=2.51327, `rotation0`=0, `rotation1`=0, `rotation2`=0.951056, `rotation3`=0.309017 WHERE `guid`=7391;

-- Correct position of Liferoot in Arathi Highlands (position is off by 4.20507 yards).
UPDATE `gameobject` SET `position_x`=-2015.39, `position_y`=-2512.9, `position_z`=72.7827, `orientation`=4.7473, `rotation0`=0, `rotation1`=0, `rotation2`=-0.694658, `rotation3`=0.71934 WHERE `guid`=7384;

-- Correct position of Liferoot in Stranglethorn Vale (position is off by 0.39144 yards).
UPDATE `gameobject` SET `position_x`=-12613.3, `position_y`=-98.8945, `position_z`=15.7905, `orientation`=0.122173, `rotation0`=0, `rotation1`=0, `rotation2`=0.0610485, `rotation3`=0.998135 WHERE `guid`=7521;

-- Correct position of Liferoot in Stranglethorn Vale (position is off by 0.45259 yards).
UPDATE `gameobject` SET `position_x`=-12709.6, `position_y`=130.92, `position_z`=9.78783, `orientation`=2.61799, `rotation0`=0, `rotation1`=0, `rotation2`=0.965925, `rotation3`=0.258821 WHERE `guid`=7381;

-- Correct position of Liferoot in Wetlands (position is off by 0.288495 yards).
UPDATE `gameobject` SET `position_x`=-4068.79, `position_y`=-3029.04, `position_z`=8.58876, `orientation`=2.14675, `rotation0`=0, `rotation1`=0, `rotation2`=0.878817, `rotation3`=0.47716 WHERE `guid`=7378;

-- Correct position of Liferoot in The Hinterlands (position is off by 0.643103 yards).
UPDATE `gameobject` SET `position_x`=-92.8787, `position_y`=-4014.63, `position_z`=121.424, `orientation`=1.8675, `rotation0`=0, `rotation1`=0, `rotation2`=0.803857, `rotation3`=0.594823 WHERE `guid`=7494;

-- Correct position of Liferoot in Swamp of Sorrows (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-10607.5, `position_y`=-4078.94, `position_z`=19.2055, `orientation`=4.34587, `rotation0`=0, `rotation1`=0, `rotation2`=-0.824126, `rotation3`=0.566406 WHERE `guid`=6648;

-- Correct position of Liferoot in Wetlands (position is off by 0.834224 yards).
UPDATE `gameobject` SET `position_x`=-3054.84, `position_y`=-2058.81, `position_z`=6.85599, `orientation`=1.51844, `rotation0`=0, `rotation1`=0, `rotation2`=0.688354, `rotation3`=0.725374 WHERE `guid`=7454;

-- Correct position of Liferoot in Stranglethorn Vale (position is off by 0.804821 yards).
UPDATE `gameobject` SET `position_x`=-12331.2, `position_y`=-259.94, `position_z`=15.5823, `orientation`=6.02139, `rotation0`=0, `rotation1`=0, `rotation2`=-0.130526, `rotation3`=0.991445 WHERE `guid`=7525;

-- Correct position of Liferoot in Dustwallow Marsh (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-4802.6, `position_y`=-3565.6, `position_z`=30.2317, `orientation`=3.97935, `rotation0`=0, `rotation1`=0, `rotation2`=-0.913545, `rotation3`=0.406738 WHERE `guid`=56031;

-- Correct position of Liferoot in Wetlands (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-3077.74, `position_y`=-1994.21, `position_z`=7.12134, `orientation`=4.79966, `rotation0`=0, `rotation1`=0, `rotation2`=-0.67559, `rotation3`=0.737278 WHERE `guid`=7417;

-- Correct position of Liferoot in Stranglethorn Vale (position is off by 0.416206 yards).
UPDATE `gameobject` SET `position_x`=-11668.4, `position_y`=-330.924, `position_z`=14.0935, `orientation`=1.83259, `rotation0`=0, `rotation1`=0, `rotation2`=0.793353, `rotation3`=0.608762 WHERE `guid`=7514;

-- Correct position of Liferoot in Stranglethorn Vale (position is off by 0.915496 yards).
UPDATE `gameobject` SET `position_x`=-14082.9, `position_y`=446.045, `position_z`=11.6335, `orientation`=3.59538, `rotation0`=0, `rotation1`=0, `rotation2`=-0.97437, `rotation3`=0.224951 WHERE `guid`=7490;

-- Correct position of Liferoot in Arathi Highlands (position is off by 1.28703 yards).
UPDATE `gameobject` SET `position_x`=-2085.59, `position_y`=-2513.78, `position_z`=73.9728, `orientation`=4.31097, `rotation0`=0, `rotation1`=0, `rotation2`=-0.833885, `rotation3`=0.551938 WHERE `guid`=7380;

-- Correct position of Liferoot in The Hinterlands (position is off by 0.82075 yards).
UPDATE `gameobject` SET `position_x`=447.687, `position_y`=-4007.4, `position_z`=103.455, `orientation`=2.40855, `rotation0`=0, `rotation1`=0, `rotation2`=0.93358, `rotation3`=0.358368 WHERE `guid`=7394;

-- Correct position of Liferoot in Stranglethorn Vale (position is off by 0.912859 yards).
UPDATE `gameobject` SET `position_x`=-12035.9, `position_y`=97.2901, `position_z`=1.18701, `orientation`=0.872664, `rotation0`=0, `rotation1`=0, `rotation2`=0.422618, `rotation3`=0.906308 WHERE `guid`=7455;

-- Correct position of Liferoot in Stranglethorn Vale (position is off by 0.51151 yards).
UPDATE `gameobject` SET `position_x`=-12547.5, `position_y`=-77.8921, `position_z`=14.3442, `orientation`=4.86947, `rotation0`=0, `rotation1`=0, `rotation2`=-0.649447, `rotation3`=0.760406 WHERE `guid`=7503;

-- Correct position of Liferoot in Stranglethorn Vale (position is off by 0.767122 yards).
UPDATE `gameobject` SET `position_x`=-11769.3, `position_y`=-329.706, `position_z`=10.7201, `orientation`=3.10665, `rotation0`=0, `rotation1`=0, `rotation2`=0.999847, `rotation3`=0.0174693 WHERE `guid`=7522;

-- Correct position of Liferoot in Wetlands (position is off by 1.37408 yards).
UPDATE `gameobject` SET `position_x`=-4173.95, `position_y`=-3015.97, `position_z`=7.73034, `orientation`=4.62512, `rotation0`=0, `rotation1`=0, `rotation2`=-0.737277, `rotation3`=0.675591 WHERE `guid`=7520;

-- Correct position of Liferoot in Ashenvale (position is off by 0.633855 yards).
UPDATE `gameobject` SET `position_x`=2599.92, `position_y`=-2837.02, `position_z`=163.409, `orientation`=1.71042, `rotation0`=0, `rotation1`=0, `rotation2`=0.754709, `rotation3`=0.656059 WHERE `guid`=7387;

-- Correct position of Liferoot in Stranglethorn Vale (position is off by 0.374221 yards).
UPDATE `gameobject` SET `position_x`=-11594.3, `position_y`=-119.192, `position_z`=13.4993, `orientation`=5.77704, `rotation0`=0, `rotation1`=0, `rotation2`=-0.25038, `rotation3`=0.968148 WHERE `guid`=7355;

-- Correct position of Liferoot in Stranglethorn Vale (position is off by 0.61979 yards).
UPDATE `gameobject` SET `position_x`=-11686.5, `position_y`=-336.717, `position_z`=10.0955, `orientation`=4.04917, `rotation0`=0, `rotation1`=0, `rotation2`=-0.898793, `rotation3`=0.438373 WHERE `guid`=7337;

-- Correct position of Liferoot in Ashenvale (position is off by 1.11339 yards).
UPDATE `gameobject` SET `position_x`=2239.33, `position_y`=-2190.92, `position_z`=100.649, `orientation`=1.11701, `rotation0`=0, `rotation1`=0, `rotation2`=0.529919, `rotation3`=0.848048 WHERE `guid`=7426;

-- Correct position of Liferoot in Alterac Mountains (position is off by 1.29545 yards).
UPDATE `gameobject` SET `position_x`=562.945, `position_y`=223.555, `position_z`=32.6625, `orientation`=2.18166, `rotation0`=0, `rotation1`=0, `rotation2`=0.887011, `rotation3`=0.461749 WHERE `guid`=7515;

-- Correct position of Liferoot in Wetlands (position is off by 0.398304 yards).
UPDATE `gameobject` SET `position_x`=-3421.35, `position_y`=-2679.81, `position_z`=7.33954, `orientation`=4.59022, `rotation0`=0, `rotation1`=0, `rotation2`=-0.748956, `rotation3`=0.66262 WHERE `guid`=7488;

-- Correct position of Liferoot in Ashenvale (position is off by 0.552357 yards).
UPDATE `gameobject` SET `position_x`=1476.45, `position_y`=-2163.62, `position_z`=87.262, `orientation`=5.13127, `rotation0`=0, `rotation1`=0, `rotation2`=-0.544639, `rotation3`=0.838671 WHERE `guid`=7453;

-- Missing Liferoot spawns in Swamp of Sorrows.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21855, 2041, 0, -10423.9, -2979.65, 18.9497, 3.38594, 0, 0, -0.992546, 0.12187, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6648 at 1114.526611 yards.
(21867, 2041, 0, -10472.1, -2599.18, 20.7916, 3.47321, 0, 0, -0.986285, 0.16505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6648 at 1485.952515 yards.
(21870, 2041, 0, -10188.3, -3340.09, 19.943, 5.53269, 0, 0, -0.366501, 0.930418, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6773 at 744.248047 yards.
(21874, 2041, 0, -10567.4, -2542.74, 20.7944, 1.16937, 0, 0, 0.551936, 0.833886, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6648 at 1536.734009 yards.
(21879, 2041, 0, -10338.3, -3419.24, 20.0979, 0.296705, 0, 0, 0.147809, 0.989016, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6773 at 680.155701 yards.
(21882, 2041, 0, -10330.6, -2957.37, 19.5952, 3.4034, 0, 0, -0.991445, 0.130528, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6773 at 1134.963501 yards.
(21883, 2041, 0, -10285.3, -3052.72, 19.9827, 6.02139, 0, 0, -0.130526, 0.991445, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6773 at 1035.455566 yards.
(21893, 2041, 0, -10156.2, -2534.16, 26.2465, 5.96903, 0, 0, -0.156434, 0.987688, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6773 at 1550.661499 yards.
(21894, 2041, 0, -10170.4, -2818.89, 19.9475, 0.680677, 0, 0, 0.333806, 0.942642, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6773 at 1265.665283 yards.
(21895, 2041, 0, -10195.5, -3511.92, 20.4763, 1.48353, 0, 0, 0.67559, 0.737278, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6773 at 572.381470 yards.
(21896, 2041, 0, -10078.1, -4046.58, 18.9007, 5.09636, 0, 0, -0.559193, 0.829038, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6773 at 123.597229 yards.
(21897, 2041, 0, -10284.3, -2789.84, 18.9399, 4.39823, 0, 0, -0.809016, 0.587786, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6773 at 1297.481812 yards.
(21898, 2041, 0, -10201.1, -2563.92, 26.4296, 5.44543, 0, 0, -0.406736, 0.913546, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6773 at 1520.406250 yards.
(21899, 2041, 0, -10361.3, -3570.38, 20.4923, 0.383971, 0, 0, 0.190808, 0.981627, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6773 at 539.912659 yards.
(21900, 2041, 0, -10190.6, -2971.65, 18.9285, 2.74016, 0, 0, 0.979924, 0.19937, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6773 at 1112.662354 yards.
(21901, 2041, 0, -10145.9, -2478.89, 25.4996, 4.97419, 0, 0, -0.608761, 0.793354, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6773 at 1606.197510 yards.
(21902, 2041, 0, -10557.8, -4243.63, 19.9668, 1.95477, 0, 0, 0.829038, 0.559193, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6648 at 172.017929 yards.
(21903, 2041, 0, -10243.5, -2922.67, 19.0033, 0.296705, 0, 0, 0.147809, 0.989016, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6773 at 1162.609131 yards.
(21904, 2041, 0, -10265.3, -3364.09, 20.3255, 1.36136, 0, 0, 0.62932, 0.777146, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6773 at 723.556274 yards.
(21905, 2041, 0, -10212.2, -3159.33, 19.1041, 3.08918, 0, 0, 0.999657, 0.0262016, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6773 at 925.115356 yards.
(21911, 2041, 0, -10632.2, -4029.9, 19.4455, 4.11898, 0, 0, -0.882947, 0.469473, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6648 at 54.918709 yards.
(21919, 2041, 0, -10097, -3010.47, 19.1777, 3.99681, 0, 0, -0.909961, 0.414694, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 6773 at 1078.365601 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(21855, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(21867, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(21870, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(21874, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(21879, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(21882, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(21883, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(21893, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(21894, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(21895, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(21896, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(21897, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(21898, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(21899, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(21900, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(21901, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(21902, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(21903, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(21904, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(21905, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(21911, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(21919, 1317, 0, 'Liferoot', 0, 10); -- Liferoots in Swamp of Sorrows (1) 6 objects total

-- Missing Liferoot spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21861, 2041, 0, -3102.63, -1299.36, 7.84485, 3.6652, 0, 0, -0.965925, 0.258821, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 14871 at 252.923691 yards.
(34120, 2041, 0, -2923.68, -1244.04, 7.05653, 2.80998, 0, 0, 0.986285, 0.16505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34104 at 139.079514 yards.
(34121, 2041, 0, -2848.54, -1301.96, 7.27921, 4.53786, 0, 0, -0.766044, 0.642789, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34104 at 130.483673 yards.
(34123, 2041, 0, -2739.23, -1328.33, 7.56998, 6.19592, 0, 0, -0.0436192, 0.999048, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34104 at 159.320175 yards.
(21869, 2041, 0, -3147.48, -1439.87, 7.53627, 2.67035, 0, 0, 0.972369, 0.233448, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 14716 at 264.927246 yards.
(21873, 2041, 0, -3094.27, -2504.67, 8.32382, 4.46804, 0, 0, -0.788011, 0.615662, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7413 at 62.201946 yards.
(34124, 2041, 0, -2750.8, -1461.47, 7.20136, 0.715585, 0, 0, 0.350207, 0.936672, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34097 at 102.657646 yards.
(21908, 2041, 0, -3046.49, -2245.78, 7.35686, 3.87463, 0, 0, -0.93358, 0.358368, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 7373 at 26.480942 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(21861, 1153, 0, 'Liferoot', 0, 10), -- Liferoots in Wetlands 51 objects total
(34120, 1153, 0, 'Liferoot', 0, 10), -- Liferoots in Wetlands 51 objects total
(34121, 1153, 0, 'Liferoot', 0, 10), -- Liferoots in Wetlands 51 objects total
(34123, 1153, 0, 'Liferoot', 0, 10), -- Liferoots in Wetlands 51 objects total
(21869, 1153, 0, 'Liferoot', 0, 10), -- Liferoots in Wetlands 51 objects total
(21873, 1153, 0, 'Liferoot', 0, 10), -- Liferoots in Wetlands 51 objects total
(34124, 1153, 0, 'Liferoot', 0, 10), -- Liferoots in Wetlands 51 objects total
(21908, 1153, 0, 'Liferoot', 0, 10); -- Liferoots in Wetlands 51 objects total

-- Missing Liferoot spawns in Dustwallow Marsh.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(56203, 2041, 1, -2624.21, -3272.21, 29.4896, 4.03171, 0, 0, -0.902585, 0.430512, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 55959 at 141.958511 yards.
(21858, 2041, 1, -3101.98, -4054.79, 23.703, 4.71239, 0, 0, -0.707107, 0.707107, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 18886 at 267.839386 yards.
(21859, 2041, 1, -3175.14, -3117.97, 30.5827, 6.07375, 0, 0, -0.104528, 0.994522, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 18885 at 207.129639 yards.
(21860, 2041, 1, -2816.24, -3081.45, 30.3134, 2.28638, 0, 0, 0.909961, 0.414694, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19444 at 54.844166 yards.
(21864, 2041, 1, -3775.09, -2953.29, 31.872, 5.44543, 0, 0, -0.406736, 0.913546, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12902 at 128.785858 yards.
(21871, 2041, 1, -3402.81, -3239.14, 30.4997, 5.8294, 0, 0, -0.224951, 0.97437, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 21109 at 332.561707 yards.
(21872, 2041, 1, -3445.87, -3330.67, 31.0648, 5.34071, 0, 0, -0.45399, 0.891007, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 21109 at 319.383972 yards.
(40745, 2041, 1, -3871.89, -3656.06, 31.251, 0, 0, 0, 0, 1, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 40739 at 266.153595 yards.
(21875, 2041, 1, -3772.63, -3295.04, 30.3823, 3.6652, 0, 0, -0.965925, 0.258821, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 21109 at 115.297874 yards.
(56204, 2041, 1, -4501, -2915.76, 30.4631, 2.77507, 0, 0, 0.983254, 0.182238, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 56030 at 147.121552 yards.
(56205, 2041, 1, -4594.51, -3245.26, 31.415, 1.39626, 0, 0, 0.642787, 0.766045, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 56030 at 195.392548 yards.
(21876, 2041, 1, -4042.81, -3541.31, 30.4527, 1.27409, 0, 0, 0.594822, 0.803857, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20971 at 130.741730 yards.
(21884, 2041, 1, -2696.02, -3670.07, 30.6771, 4.29351, 0, 0, -0.83867, 0.54464, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 14945 at 52.110149 yards.
(56206, 2041, 1, -3955.8, -3187.46, 30.7464, 4.95674, 0, 0, -0.615661, 0.788011, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 56005 at 47.959133 yards.
(21885, 2041, 1, -3259.52, -2847.8, 30.8701, 2.86234, 0, 0, 0.990268, 0.139175, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 21120 at 305.714813 yards.
(21891, 2041, 1, -3009.71, -3625.47, 28.6143, 0.296705, 0, 0, 0.147809, 0.989016, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19442 at 242.711716 yards.
(21892, 2041, 1, -2792.61, -3489.66, 31.1472, 0.226892, 0, 0, 0.113203, 0.993572, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19442 at 29.533159 yards.
(21906, 2041, 1, -4653.77, -3597.04, 31.8647, 2.51327, 0, 0, 0.951056, 0.309017, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12340 at 68.566895 yards.
(56207, 2041, 1, -2676.61, -3316.81, 31.123, 1.16937, 0, 0, 0.551936, 0.833886, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 55959 at 73.894005 yards.
(21912, 2041, 1, -3053.16, -3773.24, 30.6329, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 18886 at 159.171722 yards.
(21913, 2041, 1, -3623.66, -3275.27, 31.6351, 4.55531, 0, 0, -0.760406, 0.649449, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 21109 at 138.961502 yards.
(21914, 2041, 1, -2824.39, -3800.51, 29.9342, 5.88176, 0, 0, -0.199368, 0.979925, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 14945 at 219.828568 yards.
(21915, 2041, 1, -3557.42, -3318.69, 30.4225, 2.72271, 0, 0, 0.978148, 0.207912, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 21109 at 217.895462 yards.
(40746, 2041, 1, -3760, -3381.81, 30.9896, 3.54302, 0, 0, -0.979924, 0.19937, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 40739 at 164.240448 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(56203, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(21858, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(21859, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(21860, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(21864, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(21871, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(21872, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(40745, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(21875, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(56204, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(56205, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(21876, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(21884, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(56206, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(21885, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(21891, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(21892, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(21906, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(56207, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(21912, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(21913, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(21914, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(21915, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(40746, 1104, 0, 'Liferoot', 0, 10); -- Liferoots in Dustwallow Marsh 10 objects total

-- Missing Liferoot spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21854, 2041, 0, -13540, 664.827, 4.37746, 3.03684, 0, 0, 0.998629, 0.0523532, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7367 at 109.357925 yards.
(21856, 2041, 0, -11849.6, -313.75, 12.8228, 5.34071, 0, 0, -0.45399, 0.891007, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7522 at 82.056244 yards.
(21857, 2041, 0, -12179.3, 61.1013, 0.958485, 0.994837, 0, 0, 0.477159, 0.878817, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7472 at 58.537022 yards.
(32856, 2041, 0, -11910, -503.023, 12.6914, 1.72787, 0, 0, 0.760406, 0.649449, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 32833 at 123.429642 yards.
(21886, 2041, 0, -12118, 112.797, 1.71559, 4.88692, 0, 0, -0.642787, 0.766045, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7455 at 84.413437 yards.
(21887, 2041, 0, -12154.8, 30.5872, 2.45759, 4.31097, 0, 0, -0.833885, 0.551938, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7472 at 43.739742 yards.
(21888, 2041, 0, -12156, -65.9369, 10.715, 3.47321, 0, 0, -0.986285, 0.16505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7399 at 16.608559 yards.
(21889, 2041, 0, -14347, 142.964, 11.1941, 0.698131, 0, 0, 0.34202, 0.939693, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 11643 at 183.607666 yards.
(21910, 2041, 0, -12270.6, -355.563, 17.0246, 2.23402, 0, 0, 0.898793, 0.438373, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7546 at 75.908974 yards.
(21920, 2041, 0, -13674.1, 449.951, 41.3601, 2.37364, 0, 0, 0.927183, 0.374608, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7466 at 41.670376 yards.
(21921, 2041, 0, -11821.7, 872.976, 6.03503, 0.349065, 0, 0, 0.173648, 0.984808, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 11658 at 349.523102 yards.
(21922, 2041, 0, -11652.8, 1017.66, 2.37706, 2.40855, 0, 0, 0.93358, 0.358368, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 11658 at 339.820038 yards.
(21924, 2041, 0, -12081.1, 105.16, 1.89954, 1.97222, 0, 0, 0.833885, 0.551938, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7455 at 46.749054 yards.
(21925, 2041, 0, -12226.4, 312.19, 2.25928, 4.41568, 0, 0, -0.803857, 0.594823, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7501 at 73.112633 yards.
(21926, 2041, 0, -13675, 599.029, 10.4161, 5.79449, 0, 0, -0.241921, 0.970296, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7433 at 28.143934 yards.
(21927, 2041, 0, -11539.7, 656.182, 60.625, 2.04204, 0, 0, 0.85264, 0.522499, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 7497 at 33.395763 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(21854, 1179, 0, 'Liferoot', 0, 10), -- Liferoots in Stranglethorn 52 objects total
(21856, 1179, 0, 'Liferoot', 0, 10), -- Liferoots in Stranglethorn 52 objects total
(21857, 1179, 0, 'Liferoot', 0, 10), -- Liferoots in Stranglethorn 52 objects total
(32856, 1179, 0, 'Liferoot', 0, 10), -- Liferoots in Stranglethorn 52 objects total
(21886, 1179, 0, 'Liferoot', 0, 10), -- Liferoots in Stranglethorn 52 objects total
(21887, 1179, 0, 'Liferoot', 0, 10), -- Liferoots in Stranglethorn 52 objects total
(21888, 1179, 0, 'Liferoot', 0, 10), -- Liferoots in Stranglethorn 52 objects total
(21889, 1179, 0, 'Liferoot', 0, 10), -- Liferoots in Stranglethorn 52 objects total
(21910, 1179, 0, 'Liferoot', 0, 10), -- Liferoots in Stranglethorn 52 objects total
(21920, 1179, 0, 'Liferoot', 0, 10), -- Liferoots in Stranglethorn 52 objects total
(21921, 1179, 0, 'Liferoot', 0, 10), -- Liferoots in Stranglethorn 52 objects total
(21922, 1179, 0, 'Liferoot', 0, 10), -- Liferoots in Stranglethorn 52 objects total
(21924, 1179, 0, 'Liferoot', 0, 10), -- Liferoots in Stranglethorn 52 objects total
(21925, 1179, 0, 'Liferoot', 0, 10), -- Liferoots in Stranglethorn 52 objects total
(21926, 1179, 0, 'Liferoot', 0, 10), -- Liferoots in Stranglethorn 52 objects total
(21927, 1179, 0, 'Liferoot', 0, 10); -- Liferoots in Stranglethorn 52 objects total

-- Missing Liferoot spawns in Alterac Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21850, 2041, 0, 1393.61, -61.5613, 38.9985, 4.04917, 0, 0, -0.898793, 0.438373, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7552 at 220.787720 yards.
(35387, 2041, 0, 466.333, -1472.12, 40.626, 2.40855, 0, 0, 0.93358, 0.358368, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 35371 at 43.658577 yards.
(21877, 2041, 0, 335.301, -1352.17, 40.368, 4.99164, 0, 0, -0.601814, 0.798636, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7527 at 46.311089 yards.
(21916, 2041, 0, 1321.15, -164.634, 33.451, 0.366518, 0, 0, 0.182235, 0.983255, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 7552 at 95.383148 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(21850, 1063, 0, 'Liferoot', 0, 10), -- Liferoots in Alterac 36 objects total
(35387, 1063, 0, 'Liferoot', 0, 10), -- Liferoots in Alterac 36 objects total
(21877, 1063, 0, 'Liferoot', 0, 10), -- Liferoots in Alterac 36 objects total
(21916, 1063, 0, 'Liferoot', 0, 10); -- Liferoots in Alterac 36 objects total

-- Missing Liferoot spawns in Arathi Highlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21849, 2041, 0, -1455.35, -1925.88, 50.5102, 6.14356, 0, 0, -0.0697556, 0.997564, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7340 at 12.771090 yards.
(21851, 2041, 0, -1400.24, -1704.12, 48.3906, 1.78023, 0, 0, 0.777145, 0.629321, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 7505 at 14.763986 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(21849, 1184, 0, 'Liferoot', 0, 10), -- Liferoots in Arathi 47 objects total
(21851, 1184, 0, 'Liferoot', 0, 10); -- Liferoots in Arathi 47 objects total

-- Missing Liferoot spawns in The Hinterlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21863, 2041, 0, 17.8396, -3752.17, 146.476, 1.39626, 0, 0, 0.642787, 0.766045, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7538 at 65.595879 yards.
(21909, 2041, 0, 508.709, -3392.8, 103.179, 3.47321, 0, 0, -0.986285, 0.16505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7470 at 26.092207 yards.
(21917, 2041, 0, 249.01, -4457.45, 102.536, 0.244346, 0, 0, 0.121869, 0.992546, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 7363 at 103.160522 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(21863, 1251, 0, 'Liferoot', 0, 10), -- Liferoots in Hinterlands 17 objects total
(21909, 1251, 0, 'Liferoot', 0, 10), -- Liferoots in Hinterlands 17 objects total
(21917, 1251, 0, 'Liferoot', 0, 10); -- Liferoots in Hinterlands 17 objects total

-- Missing Liferoot spawns in Hillsbrad Foothills.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21852, 2041, 0, -433.665, -986.09, 34.3007, 3.4034, 0, 0, -0.991445, 0.130528, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6724 at 112.038933 yards.
(21853, 2041, 0, -79.2343, -1131.86, 37.7567, 0.0174525, 0, 0, 0.00872612, 0.999962, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6778 at 101.930031 yards.
(21862, 2041, 0, -426.187, -1054.69, 35.5166, 3.90954, 0, 0, -0.927183, 0.374608, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6724 at 65.670914 yards.
(21865, 2041, 0, -582.104, -829.921, 7.925, 4.01426, 0, 0, -0.906307, 0.422619, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6724 at 328.423309 yards.
(21878, 2041, 0, -226.602, -1092.11, 38.0874, 3.21142, 0, 0, -0.999391, 0.0349061, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 6778 at 62.969185 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(21852, 998, 0, 'Liferoot', 0, 10), -- Liferoot in Hillsbrad Foothills
(21853, 998, 0, 'Liferoot', 0, 10), -- Liferoot in Hillsbrad Foothills
(21862, 998, 0, 'Liferoot', 0, 10), -- Liferoot in Hillsbrad Foothills
(21865, 998, 0, 'Liferoot', 0, 10), -- Liferoot in Hillsbrad Foothills
(21878, 998, 0, 'Liferoot', 0, 10); -- Liferoot in Hillsbrad Foothills

-- Missing Liferoot spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(48970, 2041, 1, 1831.38, -2845.16, 95.0956, 3.87463, 0, 0, -0.93358, 0.358368, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 48181 at 399.396210 yards.
(48971, 2041, 1, 2203.34, -3562.25, 39.4123, 4.64258, 0, 0, -0.731354, 0.681998, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 48182 at 177.679977 yards.
(48972, 2041, 1, 2103.75, -2889.68, 106.928, 2.89725, 0, 0, 0.992546, 0.12187, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 48181 at 146.866104 yards.
(33549, 2041, 1, 1848.97, -1927.76, 94.8288, 4.5204, 0, 0, -0.771625, 0.636078, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 33548 at 227.827667 yards.
(33551, 2041, 1, 1767.24, -1808.65, 94.5485, 3.73501, 0, 0, -0.956305, 0.292372, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 33548 at 352.568665 yards.
(21918, 2041, 1, 2320.24, -2332.16, 112.906, 0.733038, 0, 0, 0.358368, 0.93358, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7426 at 164.344559 yards.
(21923, 2041, 1, 2506.59, -2342.51, 144.172, 0.0698117, 0, 0, 0.0348988, 0.999391, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7426 at 311.322205 yards.
(49241, 2041, 1, 1958.71, -2854.11, 95.1145, 1.69297, 0, 0, 0.748956, 0.66262, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 48181 at 274.276215 yards.
(32626, 2041, 1, 1920.16, -2939.41, 94.9626, 1.18682, 0, 0, 0.559193, 0.829038, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 32559 at 292.599884 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(48970, 1325, 0, 'Liferoot', 0, 10), -- Liferoot in Ashenvale 10 objects total
(48971, 1325, 0, 'Liferoot', 0, 10), -- Liferoot in Ashenvale 10 objects total
(48972, 1325, 0, 'Liferoot', 0, 10), -- Liferoot in Ashenvale 10 objects total
(33549, 1325, 0, 'Liferoot', 0, 10), -- Liferoot in Ashenvale 10 objects total
(33551, 1325, 0, 'Liferoot', 0, 10), -- Liferoot in Ashenvale 10 objects total
(21918, 1325, 0, 'Liferoot', 0, 10), -- Liferoot in Ashenvale 10 objects total
(21923, 1325, 0, 'Liferoot', 0, 10), -- Liferoot in Ashenvale 10 objects total
(49241, 1325, 0, 'Liferoot', 0, 10), -- Liferoot in Ashenvale 10 objects total
(32626, 1325, 0, 'Liferoot', 0, 10); -- Liferoot in Ashenvale 10 objects total

-- Missing Liferoot spawns in Feralas.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21866, 2041, 1, -4716.59, 2077.56, 2.63233, 3.47321, 0, 0, -0.986285, 0.16505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7416 at 91.708321 yards.
(21880, 2041, 1, -4649.62, 232.225, 6.14846, 2.07694, 0, 0, 0.861629, 0.507539, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7376 at 309.648560 yards.
(21881, 2041, 1, -3032.17, 2091.52, 28.1324, 0.331611, 0, 0, 0.165047, 0.986286, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 21443 at 124.380058 yards.
(21890, 2041, 1, -3303.51, 2199.39, 28.4162, 1.27409, 0, 0, 0.594822, 0.803857, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7435 at 243.824982 yards.
(21907, 2041, 1, -4662.81, 1144.55, 87.1693, 2.54818, 0, 0, 0.956305, 0.292372, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7440 at 138.937256 yards.
(21928, 2041, 1, -4237.53, 219.173, 52.6707, 2.04204, 0, 0, 0.85264, 0.522499, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7476 at 50.637497 yards.
(21929, 2041, 1, -4792.35, 1106.09, 84.0014, 1.18682, 0, 0, 0.559193, 0.829038, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 7440 at 9.050183 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(21866, 1193, 0, 'Liferoot', 0, 10), -- Liferoots in Feralas 19 objects total
(21880, 1193, 0, 'Liferoot', 0, 10), -- Liferoots in Feralas 19 objects total
(21881, 1193, 0, 'Liferoot', 0, 10), -- Liferoots in Feralas 19 objects total
(21890, 1193, 0, 'Liferoot', 0, 10), -- Liferoots in Feralas 19 objects total
(21907, 1193, 0, 'Liferoot', 0, 10), -- Liferoots in Feralas 19 objects total
(21928, 1193, 0, 'Liferoot', 0, 10), -- Liferoots in Feralas 19 objects total
(21929, 1193, 0, 'Liferoot', 0, 10); -- Liferoots in Feralas 19 objects total

-- Missing Liferoot spawns in Desolace.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(28674, 2041, 1, -1891.99, 1954.84, 53.4972, 4.36332, 0, 0, -0.819152, 0.573577, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 28646 at 61.985943 yards.
(21868, 2041, 1, -1981.55, 1582.63, 59.2617, 0.087266, 0, 0, 0.0436192, 0.999048, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7491 at 81.648743 yards.
(29194, 2041, 1, -1548.38, 1572.11, 58.781, 2.46091, 0, 0, 0.942641, 0.333808, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 29185 at 114.893074 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(28674, 1144, 0, 'Liferoot', 0, 10), -- Liferoots in Desolace 11 objects total
(21868, 1144, 0, 'Liferoot', 0, 10), -- Liferoots in Desolace 11 objects total
(29194, 1144, 0, 'Liferoot', 0, 10); -- Liferoots in Desolace 11 objects total

-- Correct position of Mageroyal in Hillsbrad Foothills (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-81.7724, `position_y`=-770.163, `position_z`=56.3972, `orientation`=2.67035, `rotation0`=0, `rotation1`=0, `rotation2`=0.972369, `rotation3`=0.233448 WHERE `guid`=2399;

-- Correct position of Mageroyal in Wailing Caverns (position is off by 1.44779 yards).
UPDATE `gameobject` SET `position_x`=-638.831, `position_y`=-2382.15, `position_z`=25.5687, `orientation`=3.99681, `rotation0`=0, `rotation1`=0, `rotation2`=-0.909961, `rotation3`=0.414694 WHERE `guid`=2085;

-- Correct position of Mageroyal in Wetlands (position is off by 0.995237 yards).
UPDATE `gameobject` SET `position_x`=-3615.94, `position_y`=-2842.3, `position_z`=14.4793, `orientation`=2.33874, `rotation0`=0, `rotation1`=0, `rotation2`=0.920505, `rotation3`=0.390732 WHERE `guid`=2149;

-- Correct position of Mageroyal in Redridge Mountains (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-9670.18, `position_y`=-1768.52, `position_z`=55.2736, `orientation`=4.7822, `rotation0`=0, `rotation1`=0, `rotation2`=-0.681998, `rotation3`=0.731354 WHERE `guid`=2288;

-- Correct position of Mageroyal in Durotar (position is off by 0.0400392 yards).
UPDATE `gameobject` SET `position_x`=763.569, `position_y`=-5037.04, `position_z`=7.18091, `orientation`=0.366518, `rotation0`=0, `rotation1`=0, `rotation2`=0.182235, `rotation3`=0.983255 WHERE `guid`=2278;

-- Correct position of Mageroyal in Duskwood (position is off by 0.417969 yards).
UPDATE `gameobject` SET `position_x`=-10778.7, `position_y`=-774.291, `position_z`=43.2322, `orientation`=3.97935, `rotation0`=0, `rotation1`=0, `rotation2`=-0.913545, `rotation3`=0.406738 WHERE `guid`=2265;

-- Correct position of Mageroyal in Hillsbrad Foothills (position is off by 0.453672 yards).
UPDATE `gameobject` SET `position_x`=-716.563, `position_y`=-682.115, `position_z`=13.0308, `orientation`=0.366518, `rotation0`=0, `rotation1`=0, `rotation2`=0.182235, `rotation3`=0.983255 WHERE `guid`=2516;

-- Correct position of Mageroyal in Loch Modan (position is off by 0.550393 yards).
UPDATE `gameobject` SET `position_x`=-5097.52, `position_y`=-3121.19, `position_z`=307.458, `orientation`=2.23402, `rotation0`=0, `rotation1`=0, `rotation2`=0.898793, `rotation3`=0.438373 WHERE `guid`=2169;

-- Correct position of Mageroyal in Duskwood (position is off by 0.923807 yards).
UPDATE `gameobject` SET `position_x`=-11081.7, `position_y`=-573.128, `position_z`=31.9725, `orientation`=2.1293, `rotation0`=0, `rotation1`=0, `rotation2`=0.874619, `rotation3`=0.48481 WHERE `guid`=2175;

-- Correct position of Mageroyal in Durotar (position is off by 2.81296 yards).
UPDATE `gameobject` SET `position_x`=1208.47, `position_y`=-5022.59, `position_z`=9.97329, `orientation`=4.15388, `rotation0`=0, `rotation1`=0, `rotation2`=-0.874619, `rotation3`=0.48481 WHERE `guid`=2366;

-- Correct position of Mageroyal in Wetlands (position is off by 0.613826 yards).
UPDATE `gameobject` SET `position_x`=-3982.32, `position_y`=-2953.52, `position_z`=12.4004, `orientation`=0.174532, `rotation0`=0, `rotation1`=0, `rotation2`=0.0871553, `rotation3`=0.996195 WHERE `guid`=2367;

-- Correct position of Mageroyal in Loch Modan (position is off by 0.00100708 yards).
UPDATE `gameobject` SET `position_x`=-5042.01, `position_y`=-3358.18, `position_z`=298.811, `orientation`=5.48033, `rotation0`=0, `rotation1`=0, `rotation2`=-0.390731, `rotation3`=0.920505 WHERE `guid`=2032;

-- Correct position of Mageroyal in Ashenvale (position is off by 4.60367 yards).
UPDATE `gameobject` SET `position_x`=3120.4, `position_y`=397.705, `position_z`=5.82121, `orientation`=4.18879, `rotation0`=0, `rotation1`=0, `rotation2`=-0.866025, `rotation3`=0.500001 WHERE `guid`=2526;

-- Correct position of Mageroyal in Darkshore (position is off by 0.867345 yards).
UPDATE `gameobject` SET `position_x`=5411.81, `position_y`=463.373, `position_z`=19.6885, `orientation`=0.698131, `rotation0`=0, `rotation1`=0, `rotation2`=0.34202, `rotation3`=0.939693 WHERE `guid`=2327;

-- Correct position of Mageroyal in Silverpine Forest (position is off by 0.828329 yards).
UPDATE `gameobject` SET `position_x`=944.517, `position_y`=1541.33, `position_z`=33.5463, `orientation`=3.97935, `rotation0`=0, `rotation1`=0, `rotation2`=-0.913545, `rotation3`=0.406738 WHERE `guid`=2120;

-- Correct position of Mageroyal in Silverpine Forest (position is off by 0.690258 yards).
UPDATE `gameobject` SET `position_x`=1087.7, `position_y`=1095.32, `position_z`=39.4568, `orientation`=1.88495, `rotation0`=0, `rotation1`=0, `rotation2`=0.809016, `rotation3`=0.587786 WHERE `guid`=2476;

-- Correct position of Mageroyal in Silverpine Forest (position is off by 0.661915 yards).
UPDATE `gameobject` SET `position_x`=631.639, `position_y`=1193.88, `position_z`=71.4564, `orientation`=2.67035, `rotation0`=0, `rotation1`=0, `rotation2`=0.972369, `rotation3`=0.233448 WHERE `guid`=2514;

-- Correct position of Mageroyal in Silverpine Forest (position is off by 0.980697 yards).
UPDATE `gameobject` SET `position_x`=1151.6, `position_y`=1371.06, `position_z`=36.6387, `orientation`=2.51327, `rotation0`=0, `rotation1`=0, `rotation2`=0.951056, `rotation3`=0.309017 WHERE `guid`=2448;

-- Correct position of Mageroyal in Wetlands (position is off by 0.000101089 yards).
UPDATE `gameobject` SET `position_x`=-3847.47, `position_y`=-2681.57, `position_z`=31.1855, `orientation`=5.39307, `rotation0`=0, `rotation1`=0, `rotation2`=-0.430511, `rotation3`=0.902586 WHERE `guid`=2396;

-- Correct position of Mageroyal in Wetlands (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-3918.23, `position_y`=-2716.54, `position_z`=26.4427, `orientation`=5.20108, `rotation0`=0, `rotation1`=0, `rotation2`=-0.515038, `rotation3`=0.857168 WHERE `guid`=2416;

-- Correct position of Mageroyal in Silverpine Forest (position is off by 0.892711 yards).
UPDATE `gameobject` SET `position_x`=843.962, `position_y`=1089.3, `position_z`=46.8802, `orientation`=1.309, `rotation0`=0, `rotation1`=0, `rotation2`=0.608761, `rotation3`=0.793354 WHERE `guid`=2155;

-- Correct position of Mageroyal in Loch Modan (position is off by 0.250193 yards).
UPDATE `gameobject` SET `position_x`=-4896.99, `position_y`=-3304.25, `position_z`=304.202, `orientation`=1.51844, `rotation0`=0, `rotation1`=0, `rotation2`=0.688354, `rotation3`=0.725374 WHERE `guid`=2309;

-- Correct position of Mageroyal in Silverpine Forest (position is off by 0.0711021 yards).
UPDATE `gameobject` SET `position_x`=1338.74, `position_y`=800.474, `position_z`=34.4119, `orientation`=1.6057, `rotation0`=0, `rotation1`=0, `rotation2`=0.719339, `rotation3`=0.694659 WHERE `guid`=2224;

-- Correct position of Mageroyal in Silverpine Forest (position is off by 0.55116 yards).
UPDATE `gameobject` SET `position_x`=1199.77, `position_y`=940.93, `position_z`=34.9147, `orientation`=3.08918, `rotation0`=0, `rotation1`=0, `rotation2`=0.999657, `rotation3`=0.0262016 WHERE `guid`=2527;

-- Correct position of Mageroyal in Wetlands (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-3317.16, `position_y`=-2676.49, `position_z`=14.5291, `orientation`=6.02139, `rotation0`=0, `rotation1`=0, `rotation2`=-0.130526, `rotation3`=0.991445 WHERE `guid`=2484;

-- Correct position of Mageroyal in Durotar (position is off by 0.957141 yards).
UPDATE `gameobject` SET `position_x`=816.497, `position_y`=-4099.66, `position_z`=-13.1232, `orientation`=4.39823, `rotation0`=0, `rotation1`=0, `rotation2`=-0.809016, `rotation3`=0.587786 WHERE `guid`=2420;

-- Correct position of Mageroyal in Darkshore (position is off by 0.289892 yards).
UPDATE `gameobject` SET `position_x`=5097.59, `position_y`=514.898, `position_z`=13.3284, `orientation`=0.087266, `rotation0`=0, `rotation1`=0, `rotation2`=0.0436192, `rotation3`=0.999048 WHERE `guid`=2432;

-- Correct position of Mageroyal in Loch Modan (position is off by 0.450912 yards).
UPDATE `gameobject` SET `position_x`=-5266.11, `position_y`=-3118.4, `position_z`=300.486, `orientation`=0.698131, `rotation0`=0, `rotation1`=0, `rotation2`=0.34202, `rotation3`=0.939693 WHERE `guid`=2101;

-- Correct position of Mageroyal in Loch Modan (position is off by 0.565112 yards).
UPDATE `gameobject` SET `position_x`=-5064.71, `position_y`=-3133.72, `position_z`=299.455, `orientation`=6.02139, `rotation0`=0, `rotation1`=0, `rotation2`=-0.130526, `rotation3`=0.991445 WHERE `guid`=2422;

-- Correct position of Mageroyal in Ashenvale (position is off by 0.00976563 yards).
UPDATE `gameobject` SET `position_x`=2227.15, `position_y`=-2295.62, `position_z`=104.684, `orientation`=2.02458, `rotation0`=0, `rotation1`=0, `rotation2`=0.848047, `rotation3`=0.529921 WHERE `guid`=47912;

-- Correct position of Mageroyal in Ashenvale (position is off by 0.965666 yards).
UPDATE `gameobject` SET `position_x`=1398.94, `position_y`=-2367.47, `position_z`=106.623, `orientation`=3.68265, `rotation0`=0, `rotation1`=0, `rotation2`=-0.96363, `rotation3`=0.267241 WHERE `guid`=2467;

-- Correct position of Mageroyal in Silverpine Forest (position is off by 0.510707 yards).
UPDATE `gameobject` SET `position_x`=1017.85, `position_y`=1068.03, `position_z`=39.512, `orientation`=3.49067, `rotation0`=0, `rotation1`=0, `rotation2`=-0.984807, `rotation3`=0.173652 WHERE `guid`=2115;

-- Correct position of Mageroyal in Silverpine Forest (position is off by 0.514951 yards).
UPDATE `gameobject` SET `position_x`=1183.83, `position_y`=382.143, `position_z`=33.6484, `orientation`=5.35816, `rotation0`=0, `rotation1`=0, `rotation2`=-0.446198, `rotation3`=0.894935 WHERE `guid`=2365;

-- Correct position of Mageroyal in Silverpine Forest (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=1418.59, `position_y`=578.4, `position_z`=35.8319, `orientation`=3.05433, `rotation0`=0, `rotation1`=0, `rotation2`=0.999048, `rotation3`=0.0436193 WHERE `guid`=2338;

-- Correct position of Mageroyal in Loch Modan (position is off by 1.41855 yards).
UPDATE `gameobject` SET `position_x`=-5325.98, `position_y`=-3041.61, `position_z`=327.224, `orientation`=1.39626, `rotation0`=0, `rotation1`=0, `rotation2`=0.642787, `rotation3`=0.766045 WHERE `guid`=2237;

-- Correct position of Mageroyal in Darkshore (position is off by 0.604366 yards).
UPDATE `gameobject` SET `position_x`=5866.61, `position_y`=166.033, `position_z`=31.1269, `orientation`=1.0472, `rotation0`=0, `rotation1`=0, `rotation2`=0.5, `rotation3`=0.866025 WHERE `guid`=2235;

-- Correct position of Mageroyal in Darkshore (position is off by 0.0195007 yards).
UPDATE `gameobject` SET `position_x`=5914.91, `position_y`=415.128, `position_z`=18.8381, `orientation`=1.36136, `rotation0`=0, `rotation1`=0, `rotation2`=0.62932, `rotation3`=0.777146 WHERE `guid`=2295;

-- Correct position of Mageroyal in Darkshore (position is off by 0.644824 yards).
UPDATE `gameobject` SET `position_x`=5530.29, `position_y`=64.6255, `position_z`=36.8811, `orientation`=4.2237, `rotation0`=0, `rotation1`=0, `rotation2`=-0.857167, `rotation3`=0.515038 WHERE `guid`=2286;

-- Correct position of Mageroyal in Darkshore (position is off by 0.861269 yards).
UPDATE `gameobject` SET `position_x`=7331.05, `position_y`=-274.139, `position_z`=9.089, `orientation`=5.35816, `rotation0`=0, `rotation1`=0, `rotation2`=-0.446198, `rotation3`=0.894935 WHERE `guid`=2458;

-- Correct position of Mageroyal in Darkshore (position is off by 0.982419 yards).
UPDATE `gameobject` SET `position_x`=5156.7, `position_y`=190.836, `position_z`=37.0906, `orientation`=4.66003, `rotation0`=0, `rotation1`=0, `rotation2`=-0.725374, `rotation3`=0.688355 WHERE `guid`=2305;

-- Correct position of Mageroyal in Darkshore (position is off by 1.20171 yards).
UPDATE `gameobject` SET `position_x`=4545.84, `position_y`=391.536, `position_z`=33.7408, `orientation`=2.09439, `rotation0`=0, `rotation1`=0, `rotation2`=0.866025, `rotation3`=0.500001 WHERE `guid`=2404;

-- Correct position of Mageroyal in Darkshore (position is off by 0.364344 yards).
UPDATE `gameobject` SET `position_x`=4407.68, `position_y`=677.593, `position_z`=25.6926, `orientation`=1.55334, `rotation0`=0, `rotation1`=0, `rotation2`=0.700909, `rotation3`=0.713251 WHERE `guid`=2415;

-- Correct position of Mageroyal in Darkshore (position is off by 0.464915 yards).
UPDATE `gameobject` SET `position_x`=4953.92, `position_y`=435.788, `position_z`=33.406, `orientation`=1.18682, `rotation0`=0, `rotation1`=0, `rotation2`=0.559193, `rotation3`=0.829038 WHERE `guid`=2529;

-- Correct position of Mageroyal in Westfall (position is off by 0.400756 yards).
UPDATE `gameobject` SET `position_x`=-10112.6, `position_y`=941.912, `position_z`=33.8729, `orientation`=2.67035, `rotation0`=0, `rotation1`=0, `rotation2`=0.972369, `rotation3`=0.233448 WHERE `guid`=2428;

-- Correct position of Mageroyal in Darkshore (position is off by 0.567038 yards).
UPDATE `gameobject` SET `position_x`=6857.36, `position_y`=410.354, `position_z`=15.3431, `orientation`=0.767944, `rotation0`=0, `rotation1`=0, `rotation2`=0.374606, `rotation3`=0.927184 WHERE `guid`=2478;

-- Correct position of Mageroyal in Durotar (position is off by 0.55203 yards).
UPDATE `gameobject` SET `position_x`=65.1475, `position_y`=-4306.45, `position_z`=62.9975, `orientation`=3.31614, `rotation0`=0, `rotation1`=0, `rotation2`=-0.996194, `rotation3`=0.087165 WHERE `guid`=2321;

-- Correct position of Mageroyal in Wailing Caverns (position is off by 2.88894 yards).
UPDATE `gameobject` SET `position_x`=-765.455, `position_y`=-2075.23, `position_z`=72.9444, `orientation`=3.4034, `rotation0`=0, `rotation1`=0, `rotation2`=-0.991445, `rotation3`=0.130528 WHERE `guid`=2474;

-- Correct position of Mageroyal in Darkshore (position is off by 1.00914 yards).
UPDATE `gameobject` SET `position_x`=6734.41, `position_y`=433.311, `position_z`=20.08, `orientation`=0.296705, `rotation0`=0, `rotation1`=0, `rotation2`=0.147809, `rotation3`=0.989016 WHERE `guid`=2129;

-- Correct position of Mageroyal in Redridge Mountains (position is off by 0.539192 yards).
UPDATE `gameobject` SET `position_x`=-9666.2, `position_y`=-2385.5, `position_z`=60.3805, `orientation`=4.13643, `rotation0`=0, `rotation1`=0, `rotation2`=-0.878817, `rotation3`=0.47716 WHERE `guid`=2323;

-- Correct position of Mageroyal in Redridge Mountains (position is off by 0.327695 yards).
UPDATE `gameobject` SET `position_x`=-9686.32, `position_y`=-2579.04, `position_z`=60.0086, `orientation`=5.75959, `rotation0`=0, `rotation1`=0, `rotation2`=-0.258819, `rotation3`=0.965926 WHERE `guid`=2189;

-- Correct position of Mageroyal in Redridge Mountains (position is off by 0.922564 yards).
UPDATE `gameobject` SET `position_x`=-9282.55, `position_y`=-2730.74, `position_z`=84.4196, `orientation`=2.74016, `rotation0`=0, `rotation1`=0, `rotation2`=0.979924, `rotation3`=0.19937 WHERE `guid`=2335;

-- Correct position of Mageroyal in Redridge Mountains (position is off by 0.986124 yards).
UPDATE `gameobject` SET `position_x`=-9329.94, `position_y`=-1899.88, `position_z`=68.762, `orientation`=1.29154, `rotation0`=0, `rotation1`=0, `rotation2`=0.601814, `rotation3`=0.798636 WHERE `guid`=2457;

-- Correct position of Mageroyal in Westfall (position is off by 0.31258 yards).
UPDATE `gameobject` SET `position_x`=-10504.3, `position_y`=853.873, `position_z`=38.4224, `orientation`=2.35619, `rotation0`=0, `rotation1`=0, `rotation2`=0.92388, `rotation3`=0.382683 WHERE `guid`=2319;

-- Missing Mageroyal spawns in Duskwood.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(18252, 1620, 0, -10020.2, -883.023, 29.7899, 2.51327, 0, 0, 0.951056, 0.309017, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2265 at 766.709534 yards.
(34037, 1620, 0, -10156.3, 273.428, 22.5262, 4.46804, 0, 0, -0.788011, 0.615662, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34033 at 489.370819 yards.
(18881, 1620, 0, -10953.2, 255.44, 28.4609, 1.48353, 0, 0, 0.67559, 0.737278, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 18570 at 230.264099 yards.
(33493, 1620, 0, -10024.5, -1190.48, 27.327, 4.32842, 0, 0, -0.829037, 0.559194, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 33486 at 807.636475 yards.
(18275, 1620, 0, -10810.8, -627.807, 39.8429, 0.209439, 0, 0, 0.104528, 0.994522, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2265 at 149.649689 yards.
(18908, 1620, 0, -11040.9, -1344.31, 53.8028, 5.63741, 0, 0, -0.317305, 0.948324, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 2214 at 227.928680 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(18252, 1116, 0, 'Mageroyal', 0, 10), -- Mageroyals in Duskwood 17 objects total
(34037, 1116, 0, 'Mageroyal', 0, 10), -- Mageroyals in Duskwood 17 objects total
(18881, 1116, 0, 'Mageroyal', 0, 10), -- Mageroyals in Duskwood 17 objects total
(33493, 1116, 0, 'Mageroyal', 0, 10), -- Mageroyals in Duskwood 17 objects total
(18275, 1116, 0, 'Mageroyal', 0, 10), -- Mageroyals in Duskwood 17 objects total
(18908, 1116, 0, 'Mageroyal', 0, 10); -- Mageroyals in Duskwood 17 objects total

-- Missing Mageroyal spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(18253, 1620, 0, -3465.23, -2913.83, 12.7782, 1.98967, 0, 0, 0.83867, 0.54464, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2149 at 166.111664 yards.
(34117, 1620, 0, -2807.56, -1419.77, 11.2288, 1.48353, 0, 0, 0.67559, 0.737278, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34094 at 134.464645 yards.
(18256, 1620, 0, -2713.41, -1618.32, 10.448, 3.22886, 0, 0, -0.999048, 0.0436193, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 14880 at 173.126724 yards.
(34119, 1620, 0, -2827.41, -1577.76, 9.48537, 2.14675, 0, 0, 0.878817, 0.47716, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34094 at 253.661133 yards.
(34203, 1620, 0, -3146.9, -3052.36, 23.1651, 4.53786, 0, 0, -0.766044, 0.642789, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34139 at 151.921036 yards.
(18902, 1620, 0, -3551.67, -2947.16, 11.5434, 0.226892, 0, 0, 0.113203, 0.993572, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 2149 at 122.789162 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(18253, 1154, 0, 'Mageroyal', 0, 10), -- Mageroyals in Wetlands 16 objects total
(34117, 1154, 0, 'Mageroyal', 0, 10), -- Mageroyals in Wetlands 16 objects total
(18256, 1154, 0, 'Mageroyal', 0, 10), -- Mageroyals in Wetlands 16 objects total
(34119, 1154, 0, 'Mageroyal', 0, 10), -- Mageroyals in Wetlands 16 objects total
(34203, 1154, 0, 'Mageroyal', 0, 10), -- Mageroyals in Wetlands 16 objects total
(18902, 1154, 0, 'Mageroyal', 0, 10); -- Mageroyals in Wetlands 16 objects total

-- Missing Mageroyal spawns in Durotar.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(18254, 1620, 1, 1450.59, -4902.48, 9.71276, 3.83973, 0, 0, -0.939692, 0.34202, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2366 at 270.276520 yards.
(18265, 1620, 1, 931.2, -4038.23, -13.3467, 3.97935, 0, 0, -0.913545, 0.406738, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2420 at 130.410187 yards.
(18266, 1620, 1, 122.15, -4474.05, 37.6347, 2.07694, 0, 0, 0.861629, 0.507539, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 2321 at 178.304871 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(18254, 1023, 0, 'Mageroyal', 0, 10), -- Mageroyals in Durotar 14 objects total
(18265, 1023, 0, 'Mageroyal', 0, 10), -- Mageroyals in Durotar 14 objects total
(18266, 1023, 0, 'Mageroyal', 0, 10); -- Mageroyals in Durotar 14 objects total

-- Missing Mageroyal spawns in Loch Modan.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(30217, 1620, 0, -5164.25, -3518.23, 297.873, 5.68977, 0, 0, -0.292372, 0.956305, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 30058 at 60.290615 yards.
(18269, 1620, 0, -5133.2, -3120.28, 305.114, 3.05433, 0, 0, 0.999048, 0.0436193, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2169 at 35.298698 yards.
(29978, 1620, 0, -5430.76, -3878.28, 332.083, 6.16101, 0, 0, -0.0610485, 0.998135, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 29976 at 175.579636 yards.
(18274, 1620, 0, -5005.27, -3419.37, 303.401, 3.07177, 0, 0, 0.999391, 0.0349061, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2032 at 71.520103 yards.
(30218, 1620, 0, -5234.17, -3462.64, 298.184, 1.5708, 0, 0, 0.707107, 0.707107, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 30058 at 140.863266 yards.
(18883, 1620, 0, -5548.28, -4147.27, 376.306, 5.28835, 0, 0, -0.477159, 0.878817, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 13112 at 219.018951 yards.
(18884, 1620, 0, -4949.69, -3498.08, 304.366, 6.03884, 0, 0, -0.121869, 0.992546, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2047 at 62.671555 yards.
(29983, 1620, 0, -5316.76, -3758.36, 310.217, 2.60054, 0, 0, 0.96363, 0.267241, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 29976 at 214.845154 yards.
(18903, 1620, 0, -5520.58, -3816.57, 324.065, 0.523598, 0, 0, 0.258819, 0.965926, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12784 at 82.083679 yards.
(29985, 1620, 0, -5601.12, -3600.26, 304.148, 3.35105, 0, 0, -0.994521, 0.104536, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 29976 at 152.231476 yards.
(30219, 1620, 0, -5072.19, -3795.14, 310.585, 2.40855, 0, 0, 0.93358, 0.358368, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 30016 at 216.086746 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(30217, 1163, 0, 'Mageroyal', 0, 10), -- Mageroyals in Loch Modan 20 objects total
(18269, 1163, 0, 'Mageroyal', 0, 10), -- Mageroyals in Loch Modan 20 objects total
(29978, 1163, 0, 'Mageroyal', 0, 10), -- Mageroyals in Loch Modan 20 objects total
(18274, 1163, 0, 'Mageroyal', 0, 10), -- Mageroyals in Loch Modan 20 objects total
(30218, 1163, 0, 'Mageroyal', 0, 10), -- Mageroyals in Loch Modan 20 objects total
(18883, 1163, 0, 'Mageroyal', 0, 10), -- Mageroyals in Loch Modan 20 objects total
(18884, 1163, 0, 'Mageroyal', 0, 10), -- Mageroyals in Loch Modan 20 objects total
(29983, 1163, 0, 'Mageroyal', 0, 10), -- Mageroyals in Loch Modan 20 objects total
(18903, 1163, 0, 'Mageroyal', 0, 10), -- Mageroyals in Loch Modan 20 objects total
(29985, 1163, 0, 'Mageroyal', 0, 10), -- Mageroyals in Loch Modan 20 objects total
(30219, 1163, 0, 'Mageroyal', 0, 10); -- Mageroyals in Loch Modan 20 objects total

-- Missing Mageroyal spawns in Westfall.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(30623, 1620, 0, -10301.8, 2022.11, 11.1882, 4.20625, 0, 0, -0.861629, 0.507539, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 30609 at 148.899490 yards.
(30625, 1620, 0, -9802.65, 1674.11, 11.6686, 3.42085, 0, 0, -0.990268, 0.139175, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 30603 at 139.122803 yards.
(42783, 1620, 0, -10804.1, 2060.42, 10.0065, 2.11185, 0, 0, 0.870356, 0.492424, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 42782 at 217.853348 yards.
(18912, 1620, 0, -9782.94, 1451.85, 44.3567, 3.78737, 0, 0, -0.948323, 0.317306, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2086 at 197.066193 yards.
(31944, 1620, 0, -11079.2, 1388.65, 45.8765, 1.13446, 0, 0, 0.537299, 0.843392, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 31938 at 157.549942 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(30623, 1108, 0, 'Mageroyal', 0, 10), -- Mageroyals in Westfall 45 objects total
(30625, 1108, 0, 'Mageroyal', 0, 10), -- Mageroyals in Westfall 45 objects total
(42783, 1108, 0, 'Mageroyal', 0, 10), -- Mageroyals in Westfall 45 objects total
(18912, 1108, 0, 'Mageroyal', 0, 10), -- Mageroyals in Westfall 45 objects total
(31944, 1108, 0, 'Mageroyal', 0, 10); -- Mageroyals in Westfall 45 objects total

-- Missing Mageroyal spawns in Redridge Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(18263, 1620, 0, -9512.06, -1926.95, 76.6898, 4.64258, 0, 0, -0.731354, 0.681998, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2457 at 184.344620 yards.
(33158, 1620, 0, -9688.03, -2101.71, 58.5017, 4.01426, 0, 0, -0.906307, 0.422619, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 33150 at 270.319794 yards.
(18276, 1620, 0, -9128.02, -2076.13, 124.798, 0.331611, 0, 0, 0.165047, 0.986286, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2279 at 36.550926 yards.
(20495, 1620, 0, -8744.09, -2456.23, 138.914, 1.79769, 0, 0, 0.782608, 0.622515, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20478 at 238.820007 yards.
(18910, 1620, 0, -9642.1, -3141.26, 48.5806, 1.88495, 0, 0, 0.809016, 0.587786, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 18600 at 167.006302 yards.
(20355, 1620, 0, -8976.07, -2171.74, 132.628, 0.0698117, 0, 0, 0.0348988, 0.999391, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 20311 at 87.532249 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(18263, 1306, 0, 'Mageroyal', 0, 10), -- Mageroyals in Redridge 24 objects total
(33158, 1306, 0, 'Mageroyal', 0, 10), -- Mageroyals in Redridge 24 objects total
(18276, 1306, 0, 'Mageroyal', 0, 10), -- Mageroyals in Redridge 24 objects total
(20495, 1306, 0, 'Mageroyal', 0, 10), -- Mageroyals in Redridge 24 objects total
(18910, 1306, 0, 'Mageroyal', 0, 10), -- Mageroyals in Redridge 24 objects total
(20355, 1306, 0, 'Mageroyal', 0, 10); -- Mageroyals in Redridge 24 objects total

-- Missing Mageroyal spawns in Silverpine Forest.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(35637, 1620, 0, 835.827, 1389.05, 40.3876, 5.00909, 0, 0, -0.594823, 0.803857, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 35501 at 22.652004 yards.
(18255, 1620, 0, 828.751, 1186.54, 48.3242, 5.88176, 0, 0, -0.199368, 0.979925, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2248 at 48.670654 yards.
(40029, 1620, 0, 626.599, 1114.28, 63.7859, 2.14675, 0, 0, 0.878817, 0.47716, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 39961 at 59.776779 yards.
(35638, 1620, 0, 618.615, 589.892, 34.8883, 1.91986, 0, 0, 0.819152, 0.573577, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 35564 at 425.632202 yards.
(40030, 1620, 0, 664.761, 1137.47, 57.2768, 3.00195, 0, 0, 0.997563, 0.0697661, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 39960 at 19.672209 yards.
(18258, 1620, 0, 833.252, 1214.64, 48.6721, 2.61799, 0, 0, 0.965925, 0.258821, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2251 at 35.052868 yards.
(35640, 1620, 0, 905.735, 1404.78, 35.6612, 1.6057, 0, 0, 0.719339, 0.694659, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 35501 at 54.774181 yards.
(42059, 1620, 0, -538.041, 1282.96, 56.2798, 0.925024, 0, 0, 0.446198, 0.894935, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 42052 at 108.031853 yards.
(18264, 1620, 0, -519.838, 1466.36, 19.123, 3.82227, 0, 0, -0.942641, 0.333808, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2491 at 101.678101 yards.
(18267, 1620, 0, -240.384, 1216.4, 50.4127, 5.02655, 0, 0, -0.587785, 0.809017, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2269 at 53.109966 yards.
(35641, 1620, 0, -457.327, 1176.1, 59.4468, 5.67232, 0, 0, -0.300705, 0.953717, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 35515 at 77.125015 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(35637, 1043, 0, 'Mageroyal', 0, 10), -- Mageroyals in Silverpine Forest 32 objects total
(18255, 1043, 0, 'Mageroyal', 0, 10), -- Mageroyals in Silverpine Forest 32 objects total
(40029, 1043, 0, 'Mageroyal', 0, 10), -- Mageroyals in Silverpine Forest 32 objects total
(35638, 1043, 0, 'Mageroyal', 0, 10), -- Mageroyals in Silverpine Forest 32 objects total
(40030, 1043, 0, 'Mageroyal', 0, 10), -- Mageroyals in Silverpine Forest 32 objects total
(18258, 1043, 0, 'Mageroyal', 0, 10), -- Mageroyals in Silverpine Forest 32 objects total
(35640, 1043, 0, 'Mageroyal', 0, 10), -- Mageroyals in Silverpine Forest 32 objects total
(42059, 1043, 0, 'Mageroyal', 0, 10), -- Mageroyals in Silverpine Forest 32 objects total
(18264, 1043, 0, 'Mageroyal', 0, 10), -- Mageroyals in Silverpine Forest 32 objects total
(18267, 1043, 0, 'Mageroyal', 0, 10), -- Mageroyals in Silverpine Forest 32 objects total
(35641, 1043, 0, 'Mageroyal', 0, 10); -- Mageroyals in Silverpine Forest 32 objects total

-- Missing Mageroyal spawns in Teldrassil.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(49804, 1620, 1, 10019.4, 483.16, 1314.04, 2.19911, 0, 0, 0.891006, 0.453991, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49682 at 114.089081 yards.
(18891, 1620, 1, 9561.74, 531.118, 1322.48, 3.85718, 0, 0, -0.936671, 0.35021, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 11953 at 108.070511 yards.
(49821, 1620, 1, 9588.16, 1090.76, 1267.09, 0.942477, 0, 0, 0.45399, 0.891007, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49683 at 205.088181 yards.
(18894, 1620, 1, 9777.3, 1797.91, 1305.34, 5.86431, 0, 0, -0.207911, 0.978148, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 11006 at 53.492409 yards.
(49822, 1620, 1, 9406.23, 1474.91, 1283.58, 0.349065, 0, 0, 0.173648, 0.984808, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49680 at 192.084366 yards.
(49919, 1620, 1, 9438.21, 1088.4, 1251.8, 5.2709, 0, 0, -0.484809, 0.87462, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 49680 at 206.247040 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(49804, 1004, 0, 'Mageroyal', 0, 10), -- Mageroyals in Teldrassil 12 objects total
(18891, 1004, 0, 'Mageroyal', 0, 10), -- Mageroyals in Teldrassil 12 objects total
(49821, 1004, 0, 'Mageroyal', 0, 10), -- Mageroyals in Teldrassil 12 objects total
(18894, 1004, 0, 'Mageroyal', 0, 10), -- Mageroyals in Teldrassil 12 objects total
(49822, 1004, 0, 'Mageroyal', 0, 10), -- Mageroyals in Teldrassil 12 objects total
(49919, 1004, 0, 'Mageroyal', 0, 10); -- Mageroyals in Teldrassil 12 objects total

-- Missing Mageroyal spawns in Darkshore.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(18257, 1620, 1, 7549.78, -934.65, 12.8812, 4.15388, 0, 0, -0.874619, 0.48481, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2411 at 147.248093 yards.
(18259, 1620, 1, 6741.07, 452.357, 19.4953, 4.36332, 0, 0, -0.819152, 0.573577, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2129 at 19.294182 yards.
(18261, 1620, 1, 6151.48, 481.864, 17.708, 3.73501, 0, 0, -0.956305, 0.292372, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2242 at 24.805317 yards.
(18262, 1620, 1, 7588.91, -803.94, 15.4576, 2.96704, 0, 0, 0.996194, 0.087165, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2410 at 68.373146 yards.
(18268, 1620, 1, 7518.13, -999.679, -9.88135, 1.36136, 0, 0, 0.62932, 0.777146, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2411 at 205.492554 yards.
(18895, 1620, 1, 6565.85, 276.078, 34.6048, 1.97222, 0, 0, 0.833885, 0.551938, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2134 at 84.756844 yards.
(18896, 1620, 1, 6098.4, 377.551, 25.8775, 5.63741, 0, 0, -0.317305, 0.948324, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2322 at 96.528961 yards.
(18899, 1620, 1, 7421.58, -556.772, 3.19416, 2.19911, 0, 0, 0.891006, 0.453991, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2413 at 38.293285 yards.
(18907, 1620, 1, 7098.78, -631.622, 47.2586, 0.157079, 0, 0, 0.0784588, 0.996917, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 2117 at 57.331985 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(18257, 1097, 0, 'Mageroyal', 0, 10), -- Mageroyals in Darkshore 61 objects total
(18259, 1097, 0, 'Mageroyal', 0, 10), -- Mageroyals in Darkshore 61 objects total
(18261, 1097, 0, 'Mageroyal', 0, 10), -- Mageroyals in Darkshore 61 objects total
(18262, 1097, 0, 'Mageroyal', 0, 10), -- Mageroyals in Darkshore 61 objects total
(18268, 1097, 0, 'Mageroyal', 0, 10), -- Mageroyals in Darkshore 61 objects total
(18895, 1097, 0, 'Mageroyal', 0, 10), -- Mageroyals in Darkshore 61 objects total
(18896, 1097, 0, 'Mageroyal', 0, 10), -- Mageroyals in Darkshore 61 objects total
(18899, 1097, 0, 'Mageroyal', 0, 10), -- Mageroyals in Darkshore 61 objects total
(18907, 1097, 0, 'Mageroyal', 0, 10); -- Mageroyals in Darkshore 61 objects total

-- Missing Mageroyal spawns in Hillsbrad Foothills.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(34291, 1620, 0, -699.789, 266.887, 48.9128, 1.88495, 0, 0, 0.809016, 0.587786, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 34268 at 47.538563 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(34291, 1049, 0, 'Mageroyal', 0, 10); -- Mageroyals in Hillsbrad 12 objects total

-- Missing Mageroyal spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(18270, 1620, 1, 2617.3, -36.7333, 90.8484, 0.698131, 0, 0, 0.34202, 0.939693, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2172 at 252.623505 yards.
(48078, 1620, 1, 2525.04, -3616.79, 58.6529, 0.925024, 0, 0, 0.446198, 0.894935, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 47913 at 326.123260 yards.
(18900, 1620, 1, 1876.14, -1721.68, 55.5824, 3.08918, 0, 0, 0.999657, 0.0262016, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2294 at 138.161255 yards.
(18905, 1620, 1, 3468.23, 698.412, 5.72655, 6.07375, 0, 0, -0.104528, 0.994522, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 2252 at 7.993010 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(18270, 1077, 0, 'Mageroyal', 0, 10), -- Mageroyals in Ashenvale 63 objects total
(48078, 1077, 0, 'Mageroyal', 0, 10), -- Mageroyals in Ashenvale 63 objects total
(18900, 1077, 0, 'Mageroyal', 0, 10), -- Mageroyals in Ashenvale 63 objects total
(18905, 1077, 0, 'Mageroyal', 0, 10); -- Mageroyals in Ashenvale 63 objects total

-- Missing Mageroyal spawns in Stonetalon Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(40721, 1620, 1, 1174.13, -170.249, -1.27209, 4.17134, 0, 0, -0.870356, 0.492424, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 40720 at 341.499939 yards.
(18251, 1620, 1, 2308.11, 1501.96, 281.706, 2.46091, 0, 0, 0.942641, 0.333808, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2216 at 491.213196 yards.
(40723, 1620, 1, 1101.18, 115.231, 0.153776, 1.13446, 0, 0, 0.537299, 0.843392, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 40720 at 267.004303 yards.
(40724, 1620, 1, -42.3266, -421.136, -29.0841, 3.194, 0, 0, -0.999657, 0.0262016, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 40722 at 369.999817 yards.
(18260, 1620, 1, 2576.27, 1677.75, 294.842, 0.157079, 0, 0, 0.0784588, 0.996917, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2216 at 746.304443 yards.
(40725, 1620, 1, 40.5508, -735.211, -18.9994, 2.19911, 0, 0, 0.891006, 0.453991, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 40722 at 65.255074 yards.
(40726, 1620, 1, 1269.18, -11.3787, -5.88981, 5.96903, 0, 0, -0.156434, 0.987688, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 40720 at 157.939072 yards.
(18273, 1620, 1, 2448.9, 1512.97, 262.881, 3.87463, 0, 0, -0.93358, 0.358368, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2216 at 542.244080 yards.
(40727, 1620, 1, 1511.73, 653.908, 139.48, 1.79769, 0, 0, 0.782608, 0.622515, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 40720 at 576.333618 yards.
(40728, 1620, 1, -82.9219, -500.105, -46.1249, 5.72468, 0, 0, -0.275637, 0.961262, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 40722 at 321.167969 yards.
(40729, 1620, 1, 45.3518, -661.375, -19.6092, 2.54818, 0, 0, 0.956305, 0.292372, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 40722 at 114.898575 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(40721, 1082, 0, 'Mageroyal', 0, 10), -- Various Herbs in Stonetalon (and Barrens) 28 objects total
(18251, 1082, 0, 'Mageroyal', 0, 10), -- Various Herbs in Stonetalon (and Barrens) 28 objects total
(40723, 1082, 0, 'Mageroyal', 0, 10), -- Various Herbs in Stonetalon (and Barrens) 28 objects total
(40724, 1082, 0, 'Mageroyal', 0, 10), -- Various Herbs in Stonetalon (and Barrens) 28 objects total
(18260, 1082, 0, 'Mageroyal', 0, 10), -- Various Herbs in Stonetalon (and Barrens) 28 objects total
(40725, 1082, 0, 'Mageroyal', 0, 10), -- Various Herbs in Stonetalon (and Barrens) 28 objects total
(40726, 1082, 0, 'Mageroyal', 0, 10), -- Various Herbs in Stonetalon (and Barrens) 28 objects total
(18273, 1082, 0, 'Mageroyal', 0, 10), -- Various Herbs in Stonetalon (and Barrens) 28 objects total
(40727, 1082, 0, 'Mageroyal', 0, 10), -- Various Herbs in Stonetalon (and Barrens) 28 objects total
(40728, 1082, 0, 'Mageroyal', 0, 10), -- Various Herbs in Stonetalon (and Barrens) 28 objects total
(40729, 1082, 0, 'Mageroyal', 0, 10); -- Various Herbs in Stonetalon (and Barrens) 28 objects total

-- Missing Mageroyal spawns in Wailing Caverns.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(18272, 1620, 1, -593.054, -2159.79, 52.5733, 1.309, 0, 0, 0.608761, 0.793354, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 2368 at 98.591064 yards.
(18882, 1620, 1, -628.346, -2029.38, 64.2924, 0.59341, 0, 0, 0.292371, 0.956305, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 13358 at 63.310703 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(18272, 1053, 0, 'Mageroyal', 0, 10), -- Herbs in Wailing Caverns
(18882, 1032, 0, 'Mageroyal', 0, 10); -- Mageroyals in Barrens 227 objects total

-- Create new pool to hold Mageroyal spawns in The Barrens.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(422, 1, 'Mageroyals in The Barrens', 0, 10);

-- Missing Mageroyal spawns in The Barrens.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(18914, 3727, 1, -3462.09, -2399.67, 92.3755, 0.0698117, 0, 0, 0.0348988, 0.999391, 1800, 1800, 1, 100, 0, 10),
(18928, 3727, 1, 1233.28, -3801.56, 33.4924, 4.20625, 0, 0, -0.861629, 0.507539, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 4900.537109 yards.
(18929, 3727, 1, 531.374, -3202.91, 93.1286, 0.0174525, 0, 0, 0.00872612, 0.999962, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 4073.444580 yards.
(18930, 3727, 1, -715.848, -3142.72, 94.6115, 4.13643, 0, 0, -0.878817, 0.47716, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 2844.991211 yards.
(18931, 3727, 1, -2772.87, -2109.86, 96.147, 4.90438, 0, 0, -0.636078, 0.771625, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 747.681824 yards.
(18932, 3727, 1, -2683.96, -1840.49, 92.0594, 1.62316, 0, 0, 0.725374, 0.688355, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 958.211243 yards.
(18933, 3727, 1, -1750.27, -2045.18, 93.5092, 4.50295, 0, 0, -0.777145, 0.629321, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 1748.139648 yards.
(18934, 3727, 1, -1152.78, -2354.12, 92.4685, 0.488691, 0, 0, 0.241921, 0.970296, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 2309.759277 yards.
(18935, 3727, 1, -154.469, -1946.83, 95.2778, 4.53786, 0, 0, -0.766044, 0.642789, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 3338.477051 yards.
(18936, 3727, 1, 449.584, -3116.32, 94.0315, 1.09956, 0, 0, 0.522498, 0.85264, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 3976.780518 yards.
(18937, 3727, 1, -1324.09, -2586.36, 93.059, 5.5676, 0, 0, -0.350207, 0.936672, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 2146.135498 yards.
(18938, 3727, 1, 885.531, -2912.21, 93.5429, 0.157079, 0, 0, 0.0784588, 0.996917, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 4377.729004 yards.
(18939, 3727, 1, -52.3808, -1508.4, 94.5811, 5.35816, 0, 0, -0.446198, 0.894935, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 3524.270752 yards.
(18940, 3727, 1, -1955.81, -1916.63, 93.8579, 2.60054, 0, 0, 0.96363, 0.267241, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 1581.837280 yards.
(18941, 3727, 1, 1156.44, -3751.48, 35.4822, 3.76991, 0, 0, -0.951056, 0.309017, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 4812.634277 yards.
(18942, 3727, 1, 25.342, -2375.39, 92.1641, 5.79449, 0, 0, -0.241921, 0.970296, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 3487.516846 yards.
(18943, 3727, 1, 865.839, -3489.71, 92.6699, 2.82743, 0, 0, 0.987688, 0.156436, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 4463.088379 yards.
(18946, 3727, 1, -2721.75, -1951.37, 95.6936, 2.09439, 0, 0, 0.866025, 0.500001, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 865.498291 yards.
(18948, 3727, 1, -721.839, -1879.39, 92.7246, 5.13127, 0, 0, -0.544639, 0.838671, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 2789.205322 yards.
(18951, 3727, 1, -2133.94, -1724.68, 91.6667, 6.05629, 0, 0, -0.113203, 0.993572, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 1489.830322 yards.
(18956, 3727, 1, -2518.09, -1851.83, 92.2329, 5.68977, 0, 0, -0.292372, 0.956305, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 1091.450684 yards.
(18958, 3727, 1, -1486.6, -2077.56, 82.5848, 1.39626, 0, 0, 0.642787, 0.766045, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 2001.602295 yards.
(18959, 3727, 1, -115.318, -2247.6, 91.6667, 4.27606, 0, 0, -0.843391, 0.5373, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 3350.225098 yards.
(18964, 3727, 1, 84.225, -1584.69, 94.6333, 0.942477, 0, 0, 0.45399, 0.891007, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 3638.756348 yards.
(18970, 3727, 1, -315.952, -1719.38, 92.395, 0.59341, 0, 0, 0.292371, 0.956305, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 3218.847412 yards.
(18989, 3727, 1, 422.249, -3630.41, 28.3725, 2.89725, 0, 0, 0.992546, 0.12187, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 4075.157227 yards.
(18993, 3727, 1, 586.758, -1882.36, 91.6667, 4.34587, 0, 0, -0.824126, 0.566406, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 4081.762207 yards.
(18996, 3727, 1, -387.624, -1458.01, 95.168, 5.32326, 0, 0, -0.461748, 0.887011, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 3215.442871 yards.
(19001, 3727, 1, -1854.13, -2813.15, 93.3581, 4.7473, 0, 0, -0.694658, 0.71934, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 1660.271851 yards.
(19005, 3727, 1, -2714.96, -2308.53, 91.681, 1.32645, 0, 0, 0.615661, 0.788011, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 752.668884 yards.
(19073, 3727, 1, -4112.9, -1905.92, 93.1088, 5.84685, 0, 0, -0.216439, 0.976296, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 816.910583 yards.
(19091, 3727, 1, -115.113, -1718.67, 94.2968, 4.20625, 0, 0, -0.861629, 0.507539, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 3415.555664 yards.
(19436, 3727, 1, -2894.87, -2221.63, 92.9427, 0.087266, 0, 0, 0.0436192, 0.999048, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 594.505737 yards.
(19437, 3727, 1, -3207.48, -2241.12, 91.8736, 0.401425, 0, 0, 0.199368, 0.979925, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 299.941010 yards.
(19438, 3727, 1, -820.308, -1749.19, 93.5486, 3.71755, 0, 0, -0.958819, 0.284016, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 2720.687256 yards.
(19439, 3727, 1, -2275.54, -1748.21, 91.6667, 1.76278, 0, 0, 0.771625, 0.636078, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 1353.625366 yards.
(19440, 3727, 1, -2214.45, -2616.82, 93.1482, 2.87979, 0, 0, 0.991445, 0.130528, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 1266.396729 yards.
(19443, 3727, 1, -2213.99, -2046.5, 93.1859, 0.0523589, 0, 0, 0.0261765, 0.999657, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 1297.105835 yards.
(19445, 3727, 1, -2184.46, -1851.25, 93.3504, 0.750491, 0, 0, 0.366501, 0.930418, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 1390.361206 yards.
(19447, 3727, 1, -1989.86, -3441.82, 54.0066, 3.89209, 0, 0, -0.930417, 0.366502, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 1804.164795 yards.
(19451, 3727, 1, -2282.97, -2287.78, 91.8577, 2.67035, 0, 0, 0.972369, 0.233448, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 1184.417114 yards.
(19460, 3727, 1, -2078.78, -1825.08, 91.6727, 1.83259, 0, 0, 0.793353, 0.608762, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 1497.898804 yards.
(19461, 3727, 1, -1656.15, -1915.26, 93.5014, 3.21142, 0, 0, -0.999391, 0.0349061, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 1869.779053 yards.
(19464, 3727, 1, 551.666, -3675.08, 27.2787, 5.51524, 0, 0, -0.374606, 0.927184, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 4212.024414 yards.
(19467, 3727, 1, -2702.22, -2023.16, 97.1988, 1.93731, 0, 0, 0.824125, 0.566408, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 848.048096 yards.
(19475, 3727, 1, -1851.45, -2949.39, 91.6667, 2.70526, 0, 0, 0.976295, 0.216442, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 1701.867920 yards.
(19476, 3727, 1, -2416.2, -2524.77, 91.6667, 0.0349062, 0, 0, 0.0174522, 0.999848, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 1053.345459 yards.
(19479, 3727, 1, -1445.05, -2186.18, 91.6629, 3.7001, 0, 0, -0.961261, 0.27564, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 2028.306885 yards.
(19485, 3727, 1, 737.1, -3683.63, 29.4815, 1.44862, 0, 0, 0.66262, 0.748956, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 4391.549316 yards.
(19493, 3727, 1, 727.135, -3027.79, 91.6667, 5.46288, 0, 0, -0.398748, 0.91706, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 4236.052246 yards.
(19497, 3727, 1, 580.55, -2781.6, 91.7421, 1.79769, 0, 0, 0.782608, 0.622515, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 4060.641602 yards.
(19546, 3727, 1, 463.624, -1807.32, 91.7776, 5.35816, 0, 0, -0.446198, 0.894935, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 3970.152344 yards.
(19554, 3727, 1, 155.817, -1793.3, 93.9141, 4.24115, 0, 0, -0.85264, 0.522499, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 3668.369873 yards.
(19567, 3727, 1, -3283.59, -2118.74, 91.8353, 1.58825, 0, 0, 0.71325, 0.70091, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 332.842560 yards.
(19587, 3727, 1, -3651.67, -2086.83, 92.3989, 1.48353, 0, 0, 0.67559, 0.737278, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 365.799500 yards.
(19842, 3727, 1, -3816.58, -2440.67, 91.6667, 0.104719, 0, 0, 0.0523357, 0.99863, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 356.853821 yards.
(19847, 3727, 1, -3132.56, -1902.42, 96.7309, 5.41052, 0, 0, -0.422618, 0.906308, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 596.545410 yards.
(19868, 3727, 1, -2512.43, -2472.45, 92.3745, 5.53269, 0, 0, -0.366501, 0.930418, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 952.444946 yards.
(19873, 3727, 1, 250.178, -1749.49, 91.6666, 3.28124, 0, 0, -0.997563, 0.0697661, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 3768.775635 yards.
(19885, 3727, 1, -2042.05, -2132.15, 92.7959, 1.29154, 0, 0, 0.601814, 0.798636, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 1445.019287 yards.
(19886, 3727, 1, -1355.5, -2205.64, 91.8376, 6.12611, 0, 0, -0.0784588, 0.996917, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 2115.507080 yards.
(19894, 3727, 1, -2047.76, -2618.79, 91.6667, 0, 0, 0, 0, 1, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 1431.203613 yards.
(19899, 3727, 1, -619.794, -1817.9, 92.2827, 3.05433, 0, 0, 0.999048, 0.0436193, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 2901.224609 yards.
(19903, 3727, 1, 497.297, -2394.02, 93.5046, 4.25861, 0, 0, -0.848047, 0.529921, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 3959.391357 yards.
(19917, 3727, 1, -1518.44, -2788.13, 93.8622, 3.83973, 0, 0, -0.939692, 0.34202, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 1982.089722 yards.
(19923, 3727, 1, -2053.85, -2349.05, 91.8999, 5.37562, 0, 0, -0.438371, 0.898794, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 1409.149536 yards.
(19927, 3727, 1, -2048.94, -2715.53, 91.9006, 0.750491, 0, 0, 0.366501, 0.930418, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 1448.019775 yards.
(19946, 3727, 1, -3043.68, -2155.73, 91.6667, 3.78737, 0, 0, -0.948323, 0.317306, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 484.328674 yards.
(19950, 3727, 1, -2929.99, -1959.83, 91.6667, 3.35105, 0, 0, -0.994521, 0.104536, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 690.355103 yards.
(19952, 3727, 1, 478.551, -2940.74, 91.7832, 4.7473, 0, 0, -0.694658, 0.71934, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 3977.613525 yards.
(19971, 3727, 1, 616.284, -2947.64, 92.1194, 1.71042, 0, 0, 0.754709, 0.656059, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 4115.021973 yards.
(19981, 3727, 1, -853.452, -2310.96, 92.8695, 1.97222, 0, 0, 0.833885, 0.551938, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 2610.145996 yards.
(19994, 3727, 1, -2050.38, -2050.88, 92.7058, 4.95674, 0, 0, -0.615661, 0.788011, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 1454.159668 yards.
(19997, 3727, 1, -2989.87, -2111.22, 93.1494, 0.95993, 0, 0, 0.461748, 0.887011, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 553.349487 yards.
(20009, 3727, 1, -2805.85, -1925.75, 91.6667, 4.72984, 0, 0, -0.700909, 0.713251, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 809.476074 yards.
(20019, 3727, 1, -2585.05, -2050.21, 91.6667, 4.7822, 0, 0, -0.681998, 0.731354, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 944.098511 yards.
(20023, 3727, 1, -1293.55, -2148.94, 91.8489, 5.70723, 0, 0, -0.284015, 0.95882, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 2182.987061 yards.
(20025, 3727, 1, -1724.29, -2693.6, 82.5758, 5.20108, 0, 0, -0.515038, 0.857168, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 1762.509521 yards.
(20039, 3727, 1, -3739.84, -2315.65, 93.6975, 2.26893, 0, 0, 0.906307, 0.422619, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 290.183014 yards.
(20041, 3727, 1, -827.816, -2138.57, 91.7369, 1.71042, 0, 0, 0.754709, 0.656059, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 2647.182373 yards.
(20077, 3727, 1, -1190.45, -1807.65, 86.4704, 5.72468, 0, 0, -0.275637, 0.961262, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 2347.524658 yards.
(20093, 3727, 1, -1786.14, -1785.21, 96.9878, 4.93928, 0, 0, -0.622514, 0.782609, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 1785.046509 yards.
(20100, 3727, 1, -3279.59, -1705.84, 91.6667, 4.97419, 0, 0, -0.608761, 0.793354, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 717.430664 yards.
(20112, 3727, 1, -3650.79, -1646.35, 91.6667, 4.38078, 0, 0, -0.814116, 0.580703, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 776.594543 yards.
(20113, 3727, 1, -3949.09, -1745.83, 93.5654, 2.63544, 0, 0, 0.968147, 0.250381, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 815.277344 yards.
(20128, 3727, 1, -1799, -3075.59, 83.0565, 4.18879, 0, 0, -0.866025, 0.500001, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 1795.222412 yards.
(20278, 3727, 1, 74.3646, -3443.92, 28.166, 5.77704, 0, 0, -0.25038, 0.968148, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 3687.965820 yards.
(20279, 3727, 1, 921.922, -3667.02, 31.433, 6.0912, 0, 0, -0.0958452, 0.995396, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 4563.929688 yards.
(20280, 3727, 1, -1290.88, -1919.27, 81.3488, 0.471238, 0, 0, 0.233445, 0.97237, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 2223.748535 yards.
(20281, 3727, 1, -2755.1, -2214.42, 95.583, 1.25664, 0, 0, 0.587785, 0.809017, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 730.864319 yards.
(20282, 3727, 1, -1543.9, -2609.17, 92.33, 0.261798, 0, 0, 0.130526, 0.991445, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 1929.596680 yards.
(20283, 3727, 1, -1755.6, -2587.81, 91.6667, 1.48353, 0, 0, 0.67559, 0.737278, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 1716.830200 yards.
(20284, 3727, 1, -2483.53, -2248.7, 95.6184, 2.67035, 0, 0, 0.972369, 0.233448, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 990.142517 yards.
(20285, 3727, 1, 943.49, -3185.56, 91.8506, 4.76475, 0, 0, -0.688354, 0.725374, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 4475.126953 yards.
(20286, 3727, 1, 651.194, -2083.68, 91.9575, 3.47321, 0, 0, -0.986285, 0.16505, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 4125.403809 yards.
(20287, 3727, 1, -2451.96, -1710.87, 94.5315, 4.04917, 0, 0, -0.898793, 0.438373, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 1222.625366 yards.
(20288, 3727, 1, -3550.2, -1830.2, 91.6667, 4.08407, 0, 0, -0.891006, 0.453991, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 576.246399 yards.
(20289, 3727, 1, -3813, -2215.8, 93.1443, 0.715585, 0, 0, 0.350207, 0.936672, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 396.164734 yards.
(20290, 3727, 1, -2641.9, -2292.76, 93.3241, 5.58505, 0, 0, -0.34202, 0.939693, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 827.129089 yards.
(20291, 3727, 1, -2266.8, -2566.73, 91.6666, 3.00195, 0, 0, 0.997563, 0.0697661, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 1206.908325 yards.
(20292, 3727, 1, -3815.81, -1850.86, 93.7421, 5.23599, 0, 0, -0.5, 0.866025, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 652.925720 yards.
(20293, 3727, 1, -3380.97, -2215, 94.8222, 6.03884, 0, 0, -0.121869, 0.992546, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 201.716232 yards.
(20294, 3727, 1, -1409.86, -1853.46, 91.7215, 1.18682, 0, 0, 0.559193, 0.829038, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 2123.674561 yards.
(20295, 3727, 1, -1357.99, -2854.88, 94.3614, 6.19592, 0, 0, -0.0436192, 0.999048, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 2152.778809 yards.
(20296, 3727, 1, 1221.21, -3048.45, 93.2425, 3.56047, 0, 0, -0.978148, 0.207912, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 4728.024414 yards.
(20297, 3727, 1, -846.395, -2877.4, 91.7914, 4.24115, 0, 0, -0.85264, 0.522499, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 2658.963623 yards.
(20298, 3727, 1, -1820.1, -1859.38, 97.1059, 1.02974, 0, 0, 0.492423, 0.870356, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 1728.602661 yards.
(20299, 3727, 1, -1048.15, -2883.74, 91.6667, 6.02139, 0, 0, -0.130526, 0.991445, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 2461.997314 yards.
(20300, 3727, 1, -3914.26, -2181.78, 91.6667, 6.12611, 0, 0, -0.0784588, 0.996917, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 501.930420 yards.
(20301, 3727, 1, -1712.07, -2379.35, 91.7887, 2.44346, 0, 0, 0.939692, 0.34202, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 1750.138184 yards.
(20302, 3727, 1, -591.644, -1680.88, 91.6674, 5.63741, 0, 0, -0.317305, 0.948324, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 2959.074219 yards.
(20303, 3727, 1, 538.218, -1532.07, 94.4988, 2.93214, 0, 0, 0.994521, 0.104536, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 4093.311523 yards.
(20304, 3727, 1, 785.477, -2085.2, 91.784, 4.81711, 0, 0, -0.66913, 0.743145, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 18914 at 4259.191895 yards.
(20305, 3727, 1, -1678.25, -2937.08, 91.6651, 1.64061, 0, 0, 0.731353, 0.681999, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 18914 at 1863.034058 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(18928, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(18929, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(18930, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(18931, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(18932, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(18933, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(18934, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(18935, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(18936, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(18937, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(18938, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(18939, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(18940, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(18941, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(18942, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(18943, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(18946, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(18948, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(18951, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(18956, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(18958, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(18959, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(18964, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(18970, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(18989, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(18993, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(18996, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(19001, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(19005, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(19073, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(19091, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(19436, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(19437, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(19438, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(19439, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(19440, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(19443, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(19445, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(19447, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(19451, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(19460, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(19461, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(19464, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(19467, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(19475, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(19476, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(19479, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(19485, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(19493, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(19497, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(19546, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(19554, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(19567, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(19587, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(19842, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(19847, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(19868, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(19873, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(19885, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(19886, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(19894, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(19899, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(19903, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(19917, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(19923, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(19927, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(19946, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(19950, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(19952, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(19971, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(19981, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(19994, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(19997, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(20009, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(20019, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(20023, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(20025, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(20039, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(20041, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(20077, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(20093, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(20100, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(20112, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(20113, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(20128, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(20278, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(20279, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(20280, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(20281, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(20282, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(20283, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(20284, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(20285, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(20286, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(20287, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(20288, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(20289, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(20290, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(20291, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(20292, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(20293, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(20294, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(20295, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(20296, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(20297, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(20298, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(20299, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(20300, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(20301, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(20302, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(20303, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(20304, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(20305, 422, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(18914, 422, 0, 'Mageroyal', 0, 10);

-- Correct position of Mountain Silversage in Un'Goro Crater (position is off by 1.38864 yards).
UPDATE `gameobject` SET `position_x`=-6446.52, `position_y`=-2034.81, `position_z`=-244.469, `orientation`=1.91986, `rotation0`=0, `rotation1`=0, `rotation2`=0.819152, `rotation3`=0.573577 WHERE `guid`=19754;

-- Correct position of Mountain Silversage in Burning Steppes (position is off by 0.389482 yards).
UPDATE `gameobject` SET `position_x`=-7503.81, `position_y`=-750.34, `position_z`=214.666, `orientation`=6.19592, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0436192, `rotation3`=0.999048 WHERE `guid`=19668;

-- Correct position of Mountain Silversage in Burning Steppes (position is off by 0.993467 yards).
UPDATE `gameobject` SET `position_x`=-7735.01, `position_y`=-2792.08, `position_z`=164.4, `orientation`=2.70526, `rotation0`=0, `rotation1`=0, `rotation2`=0.976295, `rotation3`=0.216442 WHERE `guid`=19746;

-- Correct position of Mountain Silversage in Un'Goro Crater (position is off by 0.00976563 yards).
UPDATE `gameobject` SET `position_x`=-6960.87, `position_y`=-2322.74, `position_z`=-224.537, `orientation`=3.22886, `rotation0`=0, `rotation1`=0, `rotation2`=-0.999048, `rotation3`=0.0436193 WHERE `guid`=16625;

-- Correct position of Mountain Silversage in Un'Goro Crater (position is off by 1.25987 yards).
UPDATE `gameobject` SET `position_x`=-7952.57, `position_y`=-2037.04, `position_z`=-245.416, `orientation`=1.79769, `rotation0`=0, `rotation1`=0, `rotation2`=0.782608, `rotation3`=0.622515 WHERE `guid`=19682;

-- Correct position of Mountain Silversage in Un'Goro Crater (position is off by 0.983162 yards).
UPDATE `gameobject` SET `position_x`=-6785.28, `position_y`=-2261.36, `position_z`=-243.692, `orientation`=4.69494, `rotation0`=0, `rotation1`=0, `rotation2`=-0.71325, `rotation3`=0.70091 WHERE `guid`=19807;

-- Correct position of Mountain Silversage in Un'Goro Crater (position is off by 0.370842 yards).
UPDATE `gameobject` SET `position_x`=-8053.94, `position_y`=-1734.27, `position_z`=-244.247, `orientation`=0.0349062, `rotation0`=0, `rotation1`=0, `rotation2`=0.0174522, `rotation3`=0.999848 WHERE `guid`=19782;

-- Correct position of Mountain Silversage in Un'Goro Crater (position is off by 1.12003 yards).
UPDATE `gameobject` SET `position_x`=-7288.34, `position_y`=-1226.62, `position_z`=-241.659, `orientation`=4.29351, `rotation0`=0, `rotation1`=0, `rotation2`=-0.83867, `rotation3`=0.54464 WHERE `guid`=19828;

-- Correct position of Mountain Silversage in Un'Goro Crater (position is off by 0.993697 yards).
UPDATE `gameobject` SET `position_x`=-6337.44, `position_y`=-916.593, `position_z`=-243.335, `orientation`=1.01229, `rotation0`=0, `rotation1`=0, `rotation2`=0.484809, `rotation3`=0.87462 WHERE `guid`=19826;

-- Correct position of Mountain Silversage in Burning Steppes (position is off by 1.02372 yards).
UPDATE `gameobject` SET `position_x`=-8334.38, `position_y`=-2438.24, `position_z`=203.358, `orientation`=4.45059, `rotation0`=0, `rotation1`=0, `rotation2`=-0.793353, `rotation3`=0.608762 WHERE `guid`=19806;

-- Correct position of Mountain Silversage in Azshara (position is off by 3.68112 yards).
UPDATE `gameobject` SET `position_x`=3507.2, `position_y`=-4555.06, `position_z`=131.419, `orientation`=0.314158, `rotation0`=0, `rotation1`=0, `rotation2`=0.156434, `rotation3`=0.987688 WHERE `guid`=39936;

-- Correct position of Mountain Silversage in Un'Goro Crater (position is off by 1.18737 yards).
UPDATE `gameobject` SET `position_x`=-7110.91, `position_y`=-1494.33, `position_z`=-247.364, `orientation`=0.558504, `rotation0`=0, `rotation1`=0, `rotation2`=0.275637, `rotation3`=0.961262 WHERE `guid`=19715;

-- Correct position of Mountain Silversage in Un'Goro Crater (position is off by 0.931602 yards).
UPDATE `gameobject` SET `position_x`=-6697.92, `position_y`=-459.107, `position_z`=-241.747, `orientation`=4.06662, `rotation0`=0, `rotation1`=0, `rotation2`=-0.894934, `rotation3`=0.446199 WHERE `guid`=19681;

-- Correct position of Mountain Silversage in Un'Goro Crater (position is off by 0.581246 yards).
UPDATE `gameobject` SET `position_x`=-6910.87, `position_y`=-371.391, `position_z`=-244.41, `orientation`=0.837757, `rotation0`=0, `rotation1`=0, `rotation2`=0.406736, `rotation3`=0.913546 WHERE `guid`=19750;

-- Correct position of Mountain Silversage in Un'Goro Crater (position is off by 1.03276 yards).
UPDATE `gameobject` SET `position_x`=-7078.44, `position_y`=-1199.77, `position_z`=-248.4, `orientation`=1.62316, `rotation0`=0, `rotation1`=0, `rotation2`=0.725374, `rotation3`=0.688355 WHERE `guid`=19747;

-- Missing Mountain Silversage spawns in Azshara.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(20563, 176586, 1, 4114.49, -5077.12, 147.331, 1.06465, 0, 0, 0.507538, 0.861629, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19677 at 117.974731 yards.
(20597, 176586, 1, 4689.2, -5365.06, 119.033, 5.42797, 0, 0, -0.414693, 0.909961, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19778 at 130.406708 yards.
(20600, 176586, 1, 3427.44, -4949.41, 147.959, 0.104719, 0, 0, 0.0523357, 0.99863, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19675 at 93.513153 yards.
(20607, 176586, 1, 2516.26, -6161.09, 113.564, 2.65289, 0, 0, 0.970295, 0.241925, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 19835 at 23.503195 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(20563, 1243, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Azshara 52 objects total
(20597, 1243, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Azshara 52 objects total
(20600, 1243, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Azshara 52 objects total
(20607, 1243, 0, 'Mountain Silversage', 0, 10); -- Mountain Silversage in Azshara 52 objects total

-- Missing Mountain Silversage spawns in Burning Steppes.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(20555, 176586, 0, -7638.9, -1553.96, 166.204, 2.80998, 0, 0, 0.986285, 0.16505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19666 at 167.938980 yards.
(20558, 176586, 0, -7815.3, -2636, 217.573, 3.76991, 0, 0, -0.951056, 0.309017, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19737 at 15.828743 yards.
(20565, 176586, 0, -8133.24, -917.333, 159.804, 0.349065, 0, 0, 0.173648, 0.984808, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19865 at 220.035660 yards.
(20567, 176586, 0, -8287.38, -1688.54, 159.236, 2.46091, 0, 0, 0.942641, 0.333808, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19819 at 9.732287 yards.
(20584, 176586, 0, -7622.81, -3033.84, 162.621, 0.174532, 0, 0, 0.0871553, 0.996195, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19723 at 259.982788 yards.
(20592, 176586, 0, -7896.6, -2558.81, 219.946, 3.14159, 0, 0, -1, 0, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19688 at 119.785316 yards.
(20593, 176586, 0, -7778.96, -2550.54, 170.852, 2.87979, 0, 0, 0.991445, 0.130528, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 19688 at 28.302341 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(20555, 1302, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Burning Steppes 29 objects total
(20558, 1302, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Burning Steppes 29 objects total
(20565, 1302, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Burning Steppes 29 objects total
(20567, 1302, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Burning Steppes 29 objects total
(20584, 1302, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Burning Steppes 29 objects total
(20592, 1302, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Burning Steppes 29 objects total
(20593, 1302, 0, 'Mountain Silversage', 0, 10); -- Mountain Silversage in Burning Steppes 29 objects total

-- Missing Mountain Silversage spawns in Eastern Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(46301, 176586, 0, 2245.04, -3049.81, 123.527, 5.79449, 0, 0, -0.241921, 0.970296, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45826 at 341.374084 yards.
(46303, 176586, 0, 2223.48, -4782.46, 113.655, 5.13127, 0, 0, -0.544639, 0.838671, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45813 at 518.947083 yards.
(46312, 176586, 0, 2025.9, -2715.96, 96.1808, 2.19911, 0, 0, 0.891006, 0.453991, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45826 at 694.425720 yards.
(46313, 176586, 0, 2577.55, -5107.67, 100.779, 1.16937, 0, 0, 0.551936, 0.833886, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45813 at 152.769363 yards.
(46359, 176586, 0, 2617.73, -4813.42, 113.094, 6.14356, 0, 0, -0.0697556, 0.997564, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45813 at 437.014679 yards.
(46360, 176586, 0, 2621.44, -5555.54, 171.376, 4.83456, 0, 0, -0.66262, 0.748956, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45813 at 362.589508 yards.
(46361, 176586, 0, 2249.72, -4420.42, 132.854, 4.50295, 0, 0, -0.777145, 0.629321, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45836 at 442.468628 yards.
(46362, 176586, 0, 2631.87, -5314.69, 168.59, 1.51844, 0, 0, 0.688354, 0.725374, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45813 at 186.736465 yards.
(46363, 176586, 0, 2626.87, -5270.43, 135.877, 1.95477, 0, 0, 0.829038, 0.559193, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45813 at 153.992706 yards.
(46367, 176586, 0, 2421.2, -3861.51, 206.033, 3.22886, 0, 0, -0.999048, 0.0436193, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45828 at 190.980164 yards.
(46373, 176586, 0, 2487.21, -3614.84, 188.068, 5.14872, 0, 0, -0.537299, 0.843392, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45828 at 193.472137 yards.
(46377, 176586, 0, 2866.6, -5421.66, 173.446, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45813 at 434.650330 yards.
(46380, 176586, 0, 2682.23, -3537.49, 129.73, 4.04917, 0, 0, -0.898793, 0.438373, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 45828 at 263.839172 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(46301, 1269, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Eastern Plaguelands 11 objects total
(46303, 1269, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Eastern Plaguelands 11 objects total
(46312, 1269, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Eastern Plaguelands 11 objects total
(46313, 1269, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Eastern Plaguelands 11 objects total
(46359, 1269, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Eastern Plaguelands 11 objects total
(46360, 1269, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Eastern Plaguelands 11 objects total
(46361, 1269, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Eastern Plaguelands 11 objects total
(46362, 1269, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Eastern Plaguelands 11 objects total
(46363, 1269, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Eastern Plaguelands 11 objects total
(46367, 1269, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Eastern Plaguelands 11 objects total
(46373, 1269, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Eastern Plaguelands 11 objects total
(46377, 1269, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Eastern Plaguelands 11 objects total
(46380, 1269, 0, 'Mountain Silversage', 0, 10); -- Mountain Silversage in Eastern Plaguelands 11 objects total

-- Missing Mountain Silversage spawns in Un'Goro Crater.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(20598, 176586, 1, -7116.87, -1231.23, -183.724, 3.57793, 0, 0, -0.976295, 0.216442, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19747 at 81.266975 yards.
(20603, 176586, 1, -7150.62, -1368.17, -180.883, 5.34071, 0, 0, -0.45399, 0.891007, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19854 at 31.768637 yards.
(20609, 176586, 1, -6214.53, -1342.51, -216.418, 5.81195, 0, 0, -0.233445, 0.97237, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 19792 at 47.340961 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(20598, 1218, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Ungoro 70 objects total
(20603, 1218, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Ungoro 70 objects total
(20609, 1218, 0, 'Mountain Silversage', 0, 10); -- Mountain Silversage in Ungoro 70 objects total

-- Missing Mountain Silversage spawns in Winterspring.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(20559, 176586, 1, 6882.36, -2716.21, 588.838, 1.90241, 0, 0, 0.814116, 0.580703, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19769 at 144.761658 yards.
(20561, 176586, 1, 5056.1, -4928.05, 889.552, 0.331611, 0, 0, 0.165047, 0.986286, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19789 at 342.887451 yards.
(20594, 176586, 1, 6775.71, -5208.24, 764.705, 2.28638, 0, 0, 0.909961, 0.414694, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19753 at 76.982239 yards.
(20595, 176586, 1, 6447.65, -3710.78, 715.518, 5.53269, 0, 0, -0.366501, 0.930418, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19718 at 26.461226 yards.
(20596, 176586, 1, 6394.99, -2627.12, 588.853, 3.50812, 0, 0, -0.983254, 0.182238, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19822 at 72.838951 yards.
(20599, 176586, 1, 6789.77, -4042.01, 708.498, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19773 at 66.814911 yards.
(20601, 176586, 1, 6983.7, -4332.11, 775.726, 0.174532, 0, 0, 0.0871553, 0.996195, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19756 at 53.411545 yards.
(20602, 176586, 1, 7010.93, -4831.64, 717.759, 4.55531, 0, 0, -0.760406, 0.649449, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19726 at 47.119354 yards.
(20604, 176586, 1, 5699.15, -5011.17, 810.042, 5.44543, 0, 0, -0.406736, 0.913546, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19861 at 217.388550 yards.
(20605, 176586, 1, 5474.26, -4839.97, 851.688, 0.453785, 0, 0, 0.224951, 0.97437, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19789 at 101.371658 yards.
(20606, 176586, 1, 6924.92, -4304.24, 767.658, 2.67035, 0, 0, 0.972369, 0.233448, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19756 at 26.691294 yards.
(20608, 176586, 1, 5232.98, -5020.01, 874.759, 6.00393, 0, 0, -0.139173, 0.990268, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 19789 at 237.066849 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(20559, 1237, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Winterspring 85 objects total
(20561, 1237, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Winterspring 85 objects total
(20594, 1237, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Winterspring 85 objects total
(20595, 1237, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Winterspring 85 objects total
(20596, 1237, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Winterspring 85 objects total
(20599, 1237, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Winterspring 85 objects total
(20601, 1237, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Winterspring 85 objects total
(20602, 1237, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Winterspring 85 objects total
(20604, 1237, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Winterspring 85 objects total
(20605, 1237, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Winterspring 85 objects total
(20606, 1237, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Winterspring 85 objects total
(20608, 1237, 0, 'Mountain Silversage', 0, 10); -- Mountain Silversage in Winterspring 85 objects total

-- Create new pool to hold Mountain Silversage spawns in Felwood.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(424, 1, 'Mountain Silversages in Felwood', 0, 10);

-- Missing Mountain Silversage spawns in Felwood.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(20610, 176640, 1, 6178.8, -1065.77, 385.206, 4.86947, 0, 0, -0.649447, 0.760406, 1800, 1800, 1, 100, 0, 10),
(20611, 176640, 1, 6156.16, -1839.16, 575.645, 0.733038, 0, 0, 0.358368, 0.93358, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 20610 at 796.813477 yards.
(20612, 176640, 1, 6175.16, -650.291, 429.208, 5.74214, 0, 0, -0.267238, 0.963631, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 20610 at 417.818390 yards.
(20613, 176640, 1, 5426.05, -809.724, 386.836, 2.9845, 0, 0, 0.996917, 0.0784664, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 20610 at 795.106812 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(20611, 424, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversages in Felwood
(20612, 424, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversages in Felwood
(20613, 424, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversages in Felwood
(20610, 424, 0, 'Mountain Silversage', 0, 10);

-- Create new pool to hold Mountain Silversage spawns in Western Plaguelands.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(427, 1, 'Mountain Silversages in Western Plaguelands', 0, 10);

-- Missing Mountain Silversage spawns in Western Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21849, 176586, 0, 1690.23, -2477.8, 99.8174, 3.21142, 0, 0, -0.999391, 0.0349061, 1800, 1800, 1, 100, 0, 10),
(21850, 176586, 0, 2907.65, -1319.5, 167.159, 5.42797, 0, 0, -0.414693, 0.909961, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21849 at 1681.756592 yards.
(21851, 176586, 0, 1861.67, -1889.43, 99.0528, 3.3685, 0, 0, -0.993571, 0.113208, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21849 at 612.838928 yards.
(21852, 176586, 0, 1862.28, -1242.78, 73.6229, 1.01229, 0, 0, 0.484809, 0.87462, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21849 at 1247.221680 yards.
(21853, 176586, 0, 1963.57, -2147.67, 83.2375, 3.59538, 0, 0, -0.97437, 0.224951, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21849 at 428.923676 yards.
(21854, 176586, 0, 2201.24, -1801.18, 72.0393, 1.25664, 0, 0, 0.587785, 0.809017, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 21849 at 848.361633 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(21850, 427, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversages in Western Plaguelands
(21851, 427, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversages in Western Plaguelands
(21852, 427, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversages in Western Plaguelands
(21853, 427, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversages in Western Plaguelands
(21854, 427, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversages in Western Plaguelands
(21849, 427, 0, 'Mountain Silversage', 0, 10);

-- Correct position of Peacebloom in Durotar (position is off by 0.000100136 yards).
UPDATE `gameobject` SET `position_x`=809.231, `position_y`=-5008.37, `position_z`=10.3424, `orientation`=0.436332, `rotation0`=0, `rotation1`=0, `rotation2`=0.216439, `rotation3`=0.976296 WHERE `guid`=1314;

-- Correct position of Peacebloom in Tirisfal Glades (position is off by 0.739165 yards).
UPDATE `gameobject` SET `position_x`=1937.37, `position_y`=536.597, `position_z`=50.284, `orientation`=4.62512, `rotation0`=0, `rotation1`=0, `rotation2`=-0.737277, `rotation3`=0.675591 WHERE `guid`=1391;

-- Correct position of Peacebloom in Tirisfal Glades (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=2004.82, `position_y`=430.121, `position_z`=36.5727, `orientation`=3.7001, `rotation0`=0, `rotation1`=0, `rotation2`=-0.961261, `rotation3`=0.27564 WHERE `guid`=1342;

-- Correct position of Peacebloom in Tirisfal Glades (position is off by 0.940914 yards).
UPDATE `gameobject` SET `position_x`=2188.6, `position_y`=953.799, `position_z`=35.976, `orientation`=4.92183, `rotation0`=0, `rotation1`=0, `rotation2`=-0.62932, `rotation3`=0.777146 WHERE `guid`=1349;

-- Correct position of Peacebloom in Tirisfal Glades (position is off by 0.334795 yards).
UPDATE `gameobject` SET `position_x`=2026.84, `position_y`=604.512, `position_z`=36.0793, `orientation`=0.401425, `rotation0`=0, `rotation1`=0, `rotation2`=0.199368, `rotation3`=0.979925 WHERE `guid`=1487;

-- Correct position of Peacebloom in Mulgore (position is off by 0.791189 yards).
UPDATE `gameobject` SET `position_x`=-2253.3, `position_y`=-1152.76, `position_z`=-0.719904, `orientation`=3.17653, `rotation0`=0, `rotation1`=0, `rotation2`=-0.999847, `rotation3`=0.0174693 WHERE `guid`=1439;

-- Correct position of Peacebloom in Mulgore (position is off by 0.884712 yards).
UPDATE `gameobject` SET `position_x`=-1217.21, `position_y`=-346.838, `position_z`=-17.8093, `orientation`=0.436332, `rotation0`=0, `rotation1`=0, `rotation2`=0.216439, `rotation3`=0.976296 WHERE `guid`=1557;

-- Correct position of Peacebloom in Mulgore (position is off by 1.48164 yards).
UPDATE `gameobject` SET `position_x`=-1160.24, `position_y`=287.672, `position_z`=25.4504, `orientation`=2.44346, `rotation0`=0, `rotation1`=0, `rotation2`=0.939692, `rotation3`=0.34202 WHERE `guid`=1472;

-- Correct position of Peacebloom in Mulgore (position is off by 0.529758 yards).
UPDATE `gameobject` SET `position_x`=-1243.54, `position_y`=-487.743, `position_z`=-56.9449, `orientation`=3.87463, `rotation0`=0, `rotation1`=0, `rotation2`=-0.93358, `rotation3`=0.358368 WHERE `guid`=1468;

-- Correct position of Peacebloom in Silverpine Forest (position is off by 0.882111 yards).
UPDATE `gameobject` SET `position_x`=1147.76, `position_y`=1069.45, `position_z`=32.9938, `orientation`=3.03684, `rotation0`=0, `rotation1`=0, `rotation2`=0.998629, `rotation3`=0.0523532 WHERE `guid`=1710;

-- Correct position of Peacebloom in Silverpine Forest (position is off by 0.211047 yards).
UPDATE `gameobject` SET `position_x`=1103.88, `position_y`=1458.85, `position_z`=34.7833, `orientation`=2.05949, `rotation0`=0, `rotation1`=0, `rotation2`=0.857167, `rotation3`=0.515038 WHERE `guid`=1535;

-- Correct position of Peacebloom in Silverpine Forest (position is off by 0.638645 yards).
UPDATE `gameobject` SET `position_x`=102.122, `position_y`=1200, `position_z`=65.299, `orientation`=1.18682, `rotation0`=0, `rotation1`=0, `rotation2`=0.559193, `rotation3`=0.829038 WHERE `guid`=1479;

-- Correct position of Peacebloom in Durotar (position is off by 1.04423 yards).
UPDATE `gameobject` SET `position_x`=411.254, `position_y`=-4226.16, `position_z`=25.4297, `orientation`=5.79449, `rotation0`=0, `rotation1`=0, `rotation2`=-0.241921, `rotation3`=0.970296 WHERE `guid`=1555;

-- Correct position of Peacebloom in Silverpine Forest (position is off by 0.362 yards).
UPDATE `gameobject` SET `position_x`=-159.638, `position_y`=950.241, `position_z`=64.9428, `orientation`=6.0912, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0958452, `rotation3`=0.995396 WHERE `guid`=1590;

-- Correct position of Peacebloom in Mulgore (position is off by 0.805123 yards).
UPDATE `gameobject` SET `position_x`=-1379.82, `position_y`=-353.434, `position_z`=-39.6538, `orientation`=4.41568, `rotation0`=0, `rotation1`=0, `rotation2`=-0.803857, `rotation3`=0.594823 WHERE `guid`=1607;

-- Correct position of Peacebloom in Mulgore (position is off by 0.578483 yards).
UPDATE `gameobject` SET `position_x`=-2222.54, `position_y`=152.929, `position_z`=61.2913, `orientation`=0.837757, `rotation0`=0, `rotation1`=0, `rotation2`=0.406736, `rotation3`=0.913546 WHERE `guid`=1574;

-- Correct position of Peacebloom in Mulgore (position is off by 0.749888 yards).
UPDATE `gameobject` SET `position_x`=-1783.5, `position_y`=-717.716, `position_z`=-9.48133, `orientation`=0.209439, `rotation0`=0, `rotation1`=0, `rotation2`=0.104528, `rotation3`=0.994522 WHERE `guid`=1610;

-- Correct position of Peacebloom in Thunder Bluff (position is off by 1.16922 yards).
UPDATE `gameobject` SET `position_x`=-978.505, `position_y`=78.1237, `position_z`=31.3837, `orientation`=5.88176, `rotation0`=0, `rotation1`=0, `rotation2`=-0.199368, `rotation3`=0.979925 WHERE `guid`=1371;

-- Correct position of Peacebloom in Mulgore (position is off by 0.998068 yards).
UPDATE `gameobject` SET `position_x`=-2414.67, `position_y`=-44.6815, `position_z`=-7.65019, `orientation`=3.87463, `rotation0`=0, `rotation1`=0, `rotation2`=-0.93358, `rotation3`=0.358368 WHERE `guid`=1724;

-- Correct position of Peacebloom in Mulgore (position is off by 0.498598 yards).
UPDATE `gameobject` SET `position_x`=-2619.65, `position_y`=-650.645, `position_z`=0.39445, `orientation`=1.95477, `rotation0`=0, `rotation1`=0, `rotation2`=0.829038, `rotation3`=0.559193 WHERE `guid`=1616;

-- Correct position of Peacebloom in Loch Modan (position is off by 0.79603 yards).
UPDATE `gameobject` SET `position_x`=-5335.43, `position_y`=-2800.35, `position_z`=350.679, `orientation`=2.93214, `rotation0`=0, `rotation1`=0, `rotation2`=0.994521, `rotation3`=0.104536 WHERE `guid`=1659;

-- Correct position of Peacebloom in Durotar (position is off by 0.942558 yards).
UPDATE `gameobject` SET `position_x`=587.152, `position_y`=-4016.66, `position_z`=10.3527, `orientation`=0.0349062, `rotation0`=0, `rotation1`=0, `rotation2`=0.0174522, `rotation3`=0.999848 WHERE `guid`=1613;

-- Correct position of Peacebloom in Tirisfal Glades (position is off by 0.622432 yards).
UPDATE `gameobject` SET `position_x`=2229.13, `position_y`=1249.01, `position_z`=40.501, `orientation`=1.78023, `rotation0`=0, `rotation1`=0, `rotation2`=0.777145, `rotation3`=0.629321 WHERE `guid`=1547;

-- Correct position of Peacebloom in Mulgore (position is off by 1.62377 yards).
UPDATE `gameobject` SET `position_x`=-1421.61, `position_y`=248.471, `position_z`=-4.84939, `orientation`=5.34071, `rotation0`=0, `rotation1`=0, `rotation2`=-0.45399, `rotation3`=0.891007 WHERE `guid`=1392;

-- Correct position of Peacebloom in Tirisfal Glades (position is off by 0.646256 yards).
UPDATE `gameobject` SET `position_x`=1930.88, `position_y`=800.377, `position_z`=38.8693, `orientation`=2.51327, `rotation0`=0, `rotation1`=0, `rotation2`=0.951056, `rotation3`=0.309017 WHERE `guid`=1357;

-- Correct position of Peacebloom in Mulgore (position is off by 0.0113724 yards).
UPDATE `gameobject` SET `position_x`=-2546.99, `position_y`=149.453, `position_z`=59.1786, `orientation`=3.63029, `rotation0`=0, `rotation1`=0, `rotation2`=-0.970295, `rotation3`=0.241925 WHERE `guid`=1678;

-- Correct position of Peacebloom in Mulgore (position is off by 1.12782 yards).
UPDATE `gameobject` SET `position_x`=-2346.98, `position_y`=-1014.55, `position_z`=-9.09553, `orientation`=2.07694, `rotation0`=0, `rotation1`=0, `rotation2`=0.861629, `rotation3`=0.507539 WHERE `guid`=1695;

-- Correct position of Peacebloom in Durotar (position is off by 0.144097 yards).
UPDATE `gameobject` SET `position_x`=576.44, `position_y`=-4645.88, `position_z`=31.6439, `orientation`=4.83456, `rotation0`=0, `rotation1`=0, `rotation2`=-0.66262, `rotation3`=0.748956 WHERE `guid`=1595;

-- Correct position of Peacebloom in Silverpine Forest (position is off by 0.594888 yards).
UPDATE `gameobject` SET `position_x`=-547.066, `position_y`=1622.77, `position_z`=7.69354, `orientation`=0.994837, `rotation0`=0, `rotation1`=0, `rotation2`=0.477159, `rotation3`=0.878817 WHERE `guid`=1518;

-- Correct position of Peacebloom in Silverpine Forest (position is off by 0.229315 yards).
UPDATE `gameobject` SET `position_x`=323.113, `position_y`=658.814, `position_z`=40.6597, `orientation`=4.10153, `rotation0`=0, `rotation1`=0, `rotation2`=-0.887011, `rotation3`=0.461749 WHERE `guid`=1728;

-- Correct position of Peacebloom in Durotar (position is off by 1.45678 yards).
UPDATE `gameobject` SET `position_x`=-146.132, `position_y`=-4716.83, `position_z`=29.0282, `orientation`=5.3058, `rotation0`=0, `rotation1`=0, `rotation2`=-0.469471, `rotation3`=0.882948 WHERE `guid`=1488;

-- Correct position of Peacebloom in Silverpine Forest (position is off by 0.700554 yards).
UPDATE `gameobject` SET `position_x`=1210.13, `position_y`=986.398, `position_z`=37.494, `orientation`=1.16937, `rotation0`=0, `rotation1`=0, `rotation2`=0.551936, `rotation3`=0.833886 WHERE `guid`=1519;

-- Correct position of Peacebloom in Loch Modan (position is off by 0.379904 yards).
UPDATE `gameobject` SET `position_x`=-4916.38, `position_y`=-3085, `position_z`=315.933, `orientation`=1.83259, `rotation0`=0, `rotation1`=0, `rotation2`=0.793353, `rotation3`=0.608762 WHERE `guid`=1406;

-- Correct position of Peacebloom in Tirisfal Glades (position is off by 0.135859 yards).
UPDATE `gameobject` SET `position_x`=2047.72, `position_y`=-93.1358, `position_z`=34.6191, `orientation`=0.453785, `rotation0`=0, `rotation1`=0, `rotation2`=0.224951, `rotation3`=0.97437 WHERE `guid`=1476;

-- Correct position of Peacebloom in Mulgore (position is off by 0.65246 yards).
UPDATE `gameobject` SET `position_x`=-1890.43, `position_y`=-185.54, `position_z`=-7.17074, `orientation`=4.20625, `rotation0`=0, `rotation1`=0, `rotation2`=-0.861629, `rotation3`=0.507539 WHERE `guid`=1551;

-- Correct position of Peacebloom in Durotar (position is off by 0.000101089 yards).
UPDATE `gameobject` SET `position_x`=482.284, `position_y`=-4083.93, `position_z`=30.2555, `orientation`=2.87979, `rotation0`=0, `rotation1`=0, `rotation2`=0.991445, `rotation3`=0.130528 WHERE `guid`=1543;

-- Correct position of Peacebloom in Tirisfal Glades (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=2117.83, `position_y`=295.336, `position_z`=60.9441, `orientation`=0.296705, `rotation0`=0, `rotation1`=0, `rotation2`=0.147809, `rotation3`=0.989016 WHERE `guid`=1334;

-- Correct position of Peacebloom in Durotar (position is off by 1.03533 yards).
UPDATE `gameobject` SET `position_x`=590.793, `position_y`=-4870.73, `position_z`=24.6471, `orientation`=4.76475, `rotation0`=0, `rotation1`=0, `rotation2`=-0.688354, `rotation3`=0.725374 WHERE `guid`=1641;

-- Correct position of Peacebloom in Loch Modan (position is off by 1.04632 yards).
UPDATE `gameobject` SET `position_x`=-5895.03, `position_y`=-3603.39, `position_z`=351.017, `orientation`=5.02655, `rotation0`=0, `rotation1`=0, `rotation2`=-0.587785, `rotation3`=0.809017 WHERE `guid`=1401;

-- Correct position of Peacebloom in Tirisfal Glades (position is off by 0.141291 yards).
UPDATE `gameobject` SET `position_x`=2348.53, `position_y`=-211.136, `position_z`=39.2133, `orientation`=5.68977, `rotation0`=0, `rotation1`=0, `rotation2`=-0.292372, `rotation3`=0.956305 WHERE `guid`=1715;

-- Correct position of Peacebloom in Tirisfal Glades (position is off by 0.539456 yards).
UPDATE `gameobject` SET `position_x`=2426.59, `position_y`=-249.455, `position_z`=50.7172, `orientation`=2.04204, `rotation0`=0, `rotation1`=0, `rotation2`=0.85264, `rotation3`=0.522499 WHERE `guid`=1541;

-- Correct position of Peacebloom in Silverpine Forest (position is off by 0.444991 yards).
UPDATE `gameobject` SET `position_x`=1100.14, `position_y`=1267.14, `position_z`=41.1007, `orientation`=6.10865, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0871553, `rotation3`=0.996195 WHERE `guid`=1671;

-- Correct position of Peacebloom in Westfall (position is off by 0.210616 yards).
UPDATE `gameobject` SET `position_x`=-9889.21, `position_y`=1136.34, `position_z`=34.2764, `orientation`=2.67035, `rotation0`=0, `rotation1`=0, `rotation2`=0.972369, `rotation3`=0.233448 WHERE `guid`=1377;

-- Correct position of Peacebloom in Dun Morogh (position is off by 0.000976563 yards).
UPDATE `gameobject` SET `position_x`=-5090.68, `position_y`=442.544, `position_z`=407.869, `orientation`=6.03884, `rotation0`=0, `rotation1`=0, `rotation2`=-0.121869, `rotation3`=0.992546 WHERE `guid`=1313;

-- Correct position of Peacebloom in Tirisfal Glades (position is off by 0.718783 yards).
UPDATE `gameobject` SET `position_x`=2199.56, `position_y`=-92.5553, `position_z`=32.3236, `orientation`=5.09636, `rotation0`=0, `rotation1`=0, `rotation2`=-0.559193, `rotation3`=0.829038 WHERE `guid`=1469;

-- Correct position of Peacebloom in Mulgore (position is off by 0.488149 yards).
UPDATE `gameobject` SET `position_x`=-1684.4, `position_y`=-583.225, `position_z`=-24.1663, `orientation`=0.575957, `rotation0`=0, `rotation1`=0, `rotation2`=0.284015, `rotation3`=0.95882 WHERE `guid`=1369;

-- Correct position of Peacebloom in Mulgore (position is off by 1.10324 yards).
UPDATE `gameobject` SET `position_x`=-849.958, `position_y`=-276.665, `position_z`=-16.8615, `orientation`=4.76475, `rotation0`=0, `rotation1`=0, `rotation2`=-0.688354, `rotation3`=0.725374 WHERE `guid`=1455;

-- Correct position of Peacebloom in Mulgore (position is off by 1.15987 yards).
UPDATE `gameobject` SET `position_x`=-984.919, `position_y`=-788.83, `position_z`=-8.38452, `orientation`=1.309, `rotation0`=0, `rotation1`=0, `rotation2`=0.608761, `rotation3`=0.793354 WHERE `guid`=1726;

-- Correct position of Peacebloom in Mulgore (position is off by 0.307225 yards).
UPDATE `gameobject` SET `position_x`=-1949.9, `position_y`=-353.275, `position_z`=-3.90635, `orientation`=0.139624, `rotation0`=0, `rotation1`=0, `rotation2`=0.0697556, `rotation3`=0.997564 WHERE `guid`=1367;

-- Correct position of Peacebloom in Mulgore (position is off by 1.0977 yards).
UPDATE `gameobject` SET `position_x`=-925.013, `position_y`=378.549, `position_z`=15.888, `orientation`=1.72787, `rotation0`=0, `rotation1`=0, `rotation2`=0.760406, `rotation3`=0.649449 WHERE `guid`=1625;

-- Correct position of Peacebloom in Mulgore (position is off by 1.15991 yards).
UPDATE `gameobject` SET `position_x`=-2013.9, `position_y`=-119.341, `position_z`=-7.13839, `orientation`=4.64258, `rotation0`=0, `rotation1`=0, `rotation2`=-0.731354, `rotation3`=0.681998 WHERE `guid`=1345;

-- Correct position of Peacebloom in Darkshore (position is off by 0.838243 yards).
UPDATE `gameobject` SET `position_x`=4323.75, `position_y`=41.262, `position_z`=58.1498, `orientation`=4.93928, `rotation0`=0, `rotation1`=0, `rotation2`=-0.622514, `rotation3`=0.782609 WHERE `guid`=1741;

-- Correct position of Peacebloom in Darkshore (position is off by 0.992095 yards).
UPDATE `gameobject` SET `position_x`=6720.39, `position_y`=207.814, `position_z`=23.1556, `orientation`=1.78023, `rotation0`=0, `rotation1`=0, `rotation2`=0.777145, `rotation3`=0.629321 WHERE `guid`=1353;

-- Correct position of Peacebloom in Darkshore (position is off by 0.314901 yards).
UPDATE `gameobject` SET `position_x`=6456.76, `position_y`=108.612, `position_z`=37.3303, `orientation`=1.50098, `rotation0`=0, `rotation1`=0, `rotation2`=0.681998, `rotation3`=0.731354 WHERE `guid`=1660;

-- Correct position of Peacebloom in Darkshore (position is off by 0.712297 yards).
UPDATE `gameobject` SET `position_x`=6270.3, `position_y`=390.889, `position_z`=32.5784, `orientation`=0.802851, `rotation0`=0, `rotation1`=0, `rotation2`=0.390731, `rotation3`=0.920505 WHERE `guid`=1609;

-- Correct position of Peacebloom in Darkshore (position is off by 1.01155 yards).
UPDATE `gameobject` SET `position_x`=4848.96, `position_y`=96.5679, `position_z`=50.2729, `orientation`=0.663223, `rotation0`=0, `rotation1`=0, `rotation2`=0.325567, `rotation3`=0.945519 WHERE `guid`=1631;

-- Correct position of Peacebloom in Durotar (position is off by 0.94345 yards).
UPDATE `gameobject` SET `position_x`=-713.907, `position_y`=-5020.74, `position_z`=17.0465, `orientation`=0.820303, `rotation0`=0, `rotation1`=0, `rotation2`=0.398748, `rotation3`=0.91706 WHERE `guid`=1717;

-- Correct position of Peacebloom in Durotar (position is off by 1.18033 yards).
UPDATE `gameobject` SET `position_x`=79.7799, `position_y`=-4245.79, `position_z`=59.7068, `orientation`=3.73501, `rotation0`=0, `rotation1`=0, `rotation2`=-0.956305, `rotation3`=0.292372 WHERE `guid`=1520;

-- Correct position of Peacebloom in Durotar (position is off by 0.557129 yards).
UPDATE `gameobject` SET `position_x`=106.372, `position_y`=-4009.62, `position_z`=46.3773, `orientation`=5.8294, `rotation0`=0, `rotation1`=0, `rotation2`=-0.224951, `rotation3`=0.97437 WHERE `guid`=1600;

-- Correct position of Peacebloom in Durotar (position is off by 0.401935 yards).
UPDATE `gameobject` SET `position_x`=1153.67, `position_y`=-4312.61, `position_z`=21.2124, `orientation`=3.68265, `rotation0`=0, `rotation1`=0, `rotation2`=-0.96363, `rotation3`=0.267241 WHERE `guid`=1390;

-- Correct position of Peacebloom in Tirisfal Glades (position is off by 0.797051 yards).
UPDATE `gameobject` SET `position_x`=2080.07, `position_y`=1120.71, `position_z`=37.3963, `orientation`=1.5708, `rotation0`=0, `rotation1`=0, `rotation2`=0.707107, `rotation3`=0.707107 WHERE `guid`=1745;

-- Correct position of Peacebloom in Durotar (position is off by 0.100115 yards).
UPDATE `gameobject` SET `position_x`=51.6326, `position_y`=-4151.9, `position_z`=63.7338, `orientation`=4.67748, `rotation0`=0, `rotation1`=0, `rotation2`=-0.719339, `rotation3`=0.694659 WHERE `guid`=1688;

-- Correct position of Peacebloom in Durotar (position is off by 0.959817 yards).
UPDATE `gameobject` SET `position_x`=209.838, `position_y`=-4051.3, `position_z`=44.4966, `orientation`=2.26893, `rotation0`=0, `rotation1`=0, `rotation2`=0.906307, `rotation3`=0.422619 WHERE `guid`=1696;

-- Correct position of Peacebloom in Durotar (position is off by 0.97311 yards).
UPDATE `gameobject` SET `position_x`=-174.129, `position_y`=-3886.43, `position_z`=41.3098, `orientation`=3.99681, `rotation0`=0, `rotation1`=0, `rotation2`=-0.909961, `rotation3`=0.414694 WHERE `guid`=1598;

-- Correct position of Peacebloom in Mulgore (position is off by 1.06042 yards).
UPDATE `gameobject` SET `position_x`=-912.891, `position_y`=-607.438, `position_z`=-54.8785, `orientation`=2.72271, `rotation0`=0, `rotation1`=0, `rotation2`=0.978148, `rotation3`=0.207912 WHERE `guid`=1350;

-- Correct position of Peacebloom in Mulgore (position is off by 0.825773 yards).
UPDATE `gameobject` SET `position_x`=-780.618, `position_y`=-449.783, `position_z`=-31.5029, `orientation`=2.58308, `rotation0`=0, `rotation1`=0, `rotation2`=0.961261, `rotation3`=0.27564 WHERE `guid`=1731;

-- Correct position of Peacebloom in Mulgore (position is off by 1.50859 yards).
UPDATE `gameobject` SET `position_x`=-1715.9, `position_y`=282.875, `position_z`=49.5149, `orientation`=0.767944, `rotation0`=0, `rotation1`=0, `rotation2`=0.374606, `rotation3`=0.927184 WHERE `guid`=1363;

-- Correct position of Peacebloom in Darkshore (position is off by 0.657877 yards).
UPDATE `gameobject` SET `position_x`=6537.38, `position_y`=-175.755, `position_z`=36.8939, `orientation`=5.74214, `rotation0`=0, `rotation1`=0, `rotation2`=-0.267238, `rotation3`=0.963631 WHERE `guid`=1389;

-- Correct position of Peacebloom in Westfall (position is off by 0.200274 yards).
UPDATE `gameobject` SET `position_x`=-10814.2, `position_y`=1072.8, `position_z`=37.0536, `orientation`=5.09636, `rotation0`=0, `rotation1`=0, `rotation2`=-0.559193, `rotation3`=0.829038 WHERE `guid`=1629;

-- Missing Peacebloom spawns in Dun Morogh.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(20631, 1618, 0, -5644.59, -1456.99, 399.917, 1.93731, 0, 0, 0.824125, 0.566408, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 10742 at 120.806923 yards.
(29663, 1618, 0, -5830.56, -690.37, 397.768, 1.41372, 0, 0, 0.649447, 0.760406, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 29642 at 83.408188 yards.
(20632, 1618, 0, -5413.17, -399.971, 398.614, 3.71755, 0, 0, -0.958819, 0.284016, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 10201 at 71.382210 yards.
(29370, 1618, 0, -5827.05, -481.184, 405.621, 6.0912, 0, 0, -0.0958452, 0.995396, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 29323 at 111.799576 yards.
(20660, 1618, 0, -5249.26, -432.63, 387.018, 2.82743, 0, 0, 0.987688, 0.156436, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 10201 at 201.340469 yards.
(29371, 1618, 0, -5716.99, -1300.76, 390.957, 3.63029, 0, 0, -0.970295, 0.241925, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 29314 at 54.186077 yards.
(20867, 1618, 0, -5555.24, -1461.55, 403.171, 3.59538, 0, 0, -0.97437, 0.224951, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 10742 at 44.793900 yards.
(20868, 1618, 0, -5519.1, -434.05, 405.842, 4.13643, 0, 0, -0.878817, 0.47716, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 10201 at 143.479797 yards.
(20919, 1618, 0, -6031.9, -337.854, 424.26, 0.209439, 0, 0, 0.104528, 0.994522, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1165 at 144.642960 yards.
(29372, 1618, 0, -5876.23, -10.789, 360.485, 4.95674, 0, 0, -0.615661, 0.788011, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 29327 at 77.280159 yards.
(20926, 1618, 0, -5813.63, -2057.92, 400.828, 0.837757, 0, 0, 0.406736, 0.913546, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 10864 at 141.119675 yards.
(20927, 1618, 0, -5882.81, -116.939, 364.699, 1.62316, 0, 0, 0.725374, 0.688355, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 10667 at 59.406200 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(20631, 1017, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Dun Morogh 41 objects total
(29663, 1017, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Dun Morogh 41 objects total
(20632, 1017, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Dun Morogh 41 objects total
(29370, 1017, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Dun Morogh 41 objects total
(20660, 1017, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Dun Morogh 41 objects total
(29371, 1017, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Dun Morogh 41 objects total
(20867, 1017, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Dun Morogh 41 objects total
(20868, 1017, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Dun Morogh 41 objects total
(20919, 1017, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Dun Morogh 41 objects total
(29372, 1017, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Dun Morogh 41 objects total
(20926, 1017, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Dun Morogh 41 objects total
(20927, 1017, 0, 'Peacebloom', 0, 10); -- Peaceblooms in Dun Morogh 41 objects total

-- Missing Peacebloom spawns in Elwynn Forest.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(27180, 1618, 0, -9814.99, -562.856, 28.7973, 1.20428, 0, 0, 0.566406, 0.824126, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 26903 at 256.582520 yards.
(33615, 1618, 0, -9681.9, -549.844, 49.2377, 1.06465, 0, 0, 0.507538, 0.861629, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 33613 at 268.984222 yards.
(20633, 1618, 0, -9738.53, -648.556, 43.5726, 1.93731, 0, 0, 0.824125, 0.566408, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1322 at 211.812073 yards.
(20634, 1618, 0, -9853.78, -952.625, 37.3469, 3.24635, 0, 0, -0.998629, 0.0523532, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1322 at 114.311516 yards.
(20635, 1618, 0, -9879.68, -1028.55, 30.0751, 5.88176, 0, 0, -0.199368, 0.979925, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1322 at 194.674225 yards.
(31147, 1618, 0, -9798.21, -1199.98, 38.0966, 4.45059, 0, 0, -0.793353, 0.608762, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 31110 at 109.909790 yards.
(20921, 1618, 0, -9748.69, -748.682, 41.5984, 2.63544, 0, 0, 0.968147, 0.250381, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1322 at 120.218971 yards.
(27181, 1618, 0, -9802.5, -386.555, 55.1582, 3.01941, 0, 0, 0.998135, 0.0610518, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 26903 at 109.422745 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(27180, 1012, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Elwynn Forest 34 objects total
(33615, 1012, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Elwynn Forest 34 objects total
(20633, 1012, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Elwynn Forest 34 objects total
(20634, 1012, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Elwynn Forest 34 objects total
(20635, 1012, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Elwynn Forest 34 objects total
(31147, 1012, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Elwynn Forest 34 objects total
(20921, 1012, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Elwynn Forest 34 objects total
(27181, 1012, 0, 'Peacebloom', 0, 10); -- Peaceblooms in Elwynn Forest 34 objects total

-- Missing Peacebloom spawns in Durotar.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(20614, 1618, 1, -1123.92, -5132.36, 2.30886, 0.0698117, 0, 0, 0.0348988, 0.999391, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12479 at 363.299835 yards.
(20615, 1618, 1, 950.419, -4981.33, 9.41513, 5.51524, 0, 0, -0.374606, 0.927184, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1315 at 99.374191 yards.
(55881, 1618, 1, 1192.58, -4006.66, 17.0034, 4.27606, 0, 0, -0.843391, 0.5373, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 55880 at 123.595833 yards.
(20866, 1618, 1, 1153.6, -4530.12, 19.5377, 1.74533, 0, 0, 0.766044, 0.642789, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12598 at 137.244812 yards.
(20869, 1618, 1, 456.343, -4551.55, 52.2991, 5.8294, 0, 0, -0.224951, 0.97437, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1595 at 154.117538 yards.
(20870, 1618, 1, 111.746, -5011.83, 9.82663, 1.44862, 0, 0, 0.66262, 0.748956, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12362 at 108.905365 yards.
(20876, 1618, 1, 188.786, -5087.78, 10.8326, 5.88176, 0, 0, -0.199368, 0.979925, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1428 at 100.470253 yards.
(20882, 1618, 1, -1190.88, -5502.52, 5.26831, 1.13446, 0, 0, 0.537299, 0.843392, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1717 at 678.505371 yards.
(20918, 1618, 1, 481.166, -3884.93, 20.6758, 2.58308, 0, 0, 0.961261, 0.27564, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12567 at 122.636505 yards.
(20920, 1618, 1, -726.661, -4810.64, 25.4452, 2.93214, 0, 0, 0.994521, 0.104536, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12478 at 148.273743 yards.
(20924, 1618, 1, 115.578, -4686.57, 27.4204, 1.18682, 0, 0, 0.559193, 0.829038, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1317 at 172.200150 yards.
(20928, 1618, 1, -55.2088, -5059.32, 10.3872, 1.22173, 0, 0, 0.573576, 0.819152, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12362 at 79.349487 yards.
(20929, 1618, 1, -249.421, -4915.39, 26.4992, 3.4034, 0, 0, -0.991445, 0.130528, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12631 at 122.755295 yards.
(20930, 1618, 1, 772.42, -4337.37, 17.6443, 1.58825, 0, 0, 0.71325, 0.70091, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1654 at 142.206039 yards.
(20946, 1618, 1, -1340.78, -5140.33, 3.48485, 2.74016, 0, 0, 0.979924, 0.19937, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12479 at 511.384338 yards.
(20947, 1618, 1, 122.605, -4414.1, 37.6684, 0.209439, 0, 0, 0.104528, 0.994522, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12578 at 144.192535 yards.
(32537, 1618, 1, -17.5935, -4018.54, 59.2235, 2.60054, 0, 0, 0.96363, 0.267241, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 32521 at 118.660461 yards.
(20948, 1618, 1, -125.189, -4933.25, 19.8904, 2.87979, 0, 0, 0.991445, 0.130528, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12631 at 86.695267 yards.
(20951, 1618, 1, -808.89, -5355.29, 2.16466, 4.60767, 0, 0, -0.743144, 0.669131, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1717 at 348.089417 yards.
(20952, 1618, 1, 979.562, -3922.74, 18.4933, 5.77704, 0, 0, -0.25038, 0.968148, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 12355 at 108.149498 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(20614, 1020, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Durotar 53 objects total
(20615, 1020, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Durotar 53 objects total
(55881, 1020, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Durotar 53 objects total
(20866, 1020, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Durotar 53 objects total
(20869, 1020, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Durotar 53 objects total
(20870, 1020, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Durotar 53 objects total
(20876, 1020, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Durotar 53 objects total
(20882, 1020, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Durotar 53 objects total
(20918, 1020, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Durotar 53 objects total
(20920, 1020, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Durotar 53 objects total
(20924, 1020, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Durotar 53 objects total
(20928, 1020, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Durotar 53 objects total
(20929, 1020, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Durotar 53 objects total
(20930, 1020, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Durotar 53 objects total
(20946, 1020, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Durotar 53 objects total
(20947, 1020, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Durotar 53 objects total
(32537, 1020, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Durotar 53 objects total
(20948, 1020, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Durotar 53 objects total
(20951, 1020, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Durotar 53 objects total
(20952, 1020, 0, 'Peacebloom', 0, 10); -- Peaceblooms in Durotar 53 objects total

-- Missing Peacebloom spawns in Loch Modan.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(20630, 1618, 0, -5165.76, -2766.13, 335.84, 0.418879, 0, 0, 0.207911, 0.978148, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 13078 at 124.415855 yards.
(29997, 1618, 0, -5640.9, -3202.46, 326.807, 3.59538, 0, 0, -0.97437, 0.224951, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 29990 at 147.322540 yards.
(20931, 1618, 0, -5342.74, -3775.8, 310.231, 1.53589, 0, 0, 0.694658, 0.71934, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 13111 at 109.643311 yards.
(20950, 1618, 0, -5499.95, -3748.77, 318.8, 1.97222, 0, 0, 0.833885, 0.551938, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 1491 at 112.939804 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(20630, 1161, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Loch Modan 19 objects total
(29997, 1161, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Loch Modan 19 objects total
(20931, 1161, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Loch Modan 19 objects total
(20950, 1161, 0, 'Peacebloom', 0, 10); -- Peaceblooms in Loch Modan 19 objects total

-- Missing Peacebloom spawns in Westfall.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(42784, 1618, 0, -10990.6, 1007.12, 37.6851, 0.453785, 0, 0, 0.224951, 0.97437, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 42780 at 146.902283 yards.
(20955, 1618, 0, -9792.85, 1410.87, 41.2623, 1.55334, 0, 0, 0.700909, 0.713251, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1356 at 189.790329 yards.
(42882, 1618, 0, -11136.2, 761.5, 36.2952, 2.00713, 0, 0, 0.843391, 0.5373, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 42780 at 414.091431 yards.
(30642, 1618, 0, -10402.8, 1629.95, 38.2378, 2.32129, 0, 0, 0.91706, 0.39875, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 30639 at 210.350021 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(42784, 1107, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Westfall 15 objects total
(20955, 1107, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Westfall 15 objects total
(42882, 1107, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Westfall 15 objects total
(30642, 1107, 0, 'Peacebloom', 0, 10); -- Peaceblooms in Westfall 15 objects total

-- Missing Peacebloom spawns in Tirisfal Glades.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(20621, 1618, 0, 1850.44, -552.155, 41.4346, 6.14356, 0, 0, -0.0697556, 0.997564, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1549 at 91.394783 yards.
(20922, 1618, 0, 2568.17, 916.615, 100.373, 4.10153, 0, 0, -0.887011, 0.461749, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1354 at 76.124107 yards.
(46397, 1618, 0, 2816.43, 196.755, 29.7697, 0.0523589, 0, 0, 0.0261765, 0.999657, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45099 at 126.266708 yards.
(20923, 1618, 0, 1894.6, -106.239, 33.2211, 5.21854, 0, 0, -0.507538, 0.861629, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 1335 at 114.635750 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(20621, 1006, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Tirisfal 51 objects total
(20922, 1006, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Tirisfal 51 objects total
(46397, 1006, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Tirisfal 51 objects total
(20923, 1006, 0, 'Peacebloom', 0, 10); -- Peaceblooms in Tirisfal 51 objects total

-- Missing Peacebloom spawns in Silverpine Forest.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(20629, 1618, 0, -100.278, 999.729, 67.1666, 5.00909, 0, 0, -0.594823, 0.803857, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1590 at 77.593307 yards.
(35645, 1618, 0, -427.72, 1118.08, 84.9261, 5.55015, 0, 0, -0.358368, 0.93358, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 35516 at 139.044250 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(20629, 1041, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Silverpine Forest 34 objects total
(35645, 1041, 0, 'Peacebloom', 0, 10); -- Peaceblooms in Silverpine Forest 34 objects total

-- Missing Peacebloom spawns in Teldrassil.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(49959, 1618, 1, 9971.03, 534.072, 1310.96, 2.9845, 0, 0, 0.996917, 0.0784664, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49656 at 117.767052 yards.
(20932, 1618, 1, 9969.02, 874.025, 1323.31, 3.49067, 0, 0, -0.984807, 0.173652, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 11941 at 147.887878 yards.
(20933, 1618, 1, 9972.62, 1105.91, 1325.89, 0.977383, 0, 0, 0.469471, 0.882948, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 11314 at 187.602768 yards.
(49655, 1618, 1, 10546.2, 1812.19, 1315.66, 1.72787, 0, 0, 0.760406, 0.649449, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49654 at 131.249100 yards.
(20934, 1618, 1, 10751.1, 1945.58, 1336.03, 3.78737, 0, 0, -0.948323, 0.317306, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 10987 at 117.091835 yards.
(20935, 1618, 1, 10203, 1883.9, 1332.16, 4.34587, 0, 0, -0.824126, 0.566406, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 10981 at 161.304169 yards.
(20936, 1618, 1, 10860.5, 1691.74, 1301.1, 2.23402, 0, 0, 0.898793, 0.438373, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 11210 at 165.871521 yards.
(20937, 1618, 1, 9452.79, 1552.37, 1298.68, 4.25861, 0, 0, -0.848047, 0.529921, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 11335 at 203.539932 yards.
(20938, 1618, 1, 9342.01, 1491.86, 1273.54, 2.23402, 0, 0, 0.898793, 0.438373, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 11335 at 93.908493 yards.
(20939, 1618, 1, 9224.16, 1283.27, 1308.56, 3.07177, 0, 0, 0.999391, 0.0349061, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 11561 at 186.245667 yards.
(20940, 1618, 1, 9608.76, 731.521, 1266.38, 1.25664, 0, 0, 0.587785, 0.809017, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 11935 at 147.838913 yards.
(20941, 1618, 1, 9225.5, 1110.92, 1314.62, 0.994837, 0, 0, 0.477159, 0.878817, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 11561 at 120.465019 yards.
(20942, 1618, 1, 10303.4, 1863.98, 1326.92, 1.3439, 0, 0, 0.622514, 0.782609, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 10981 at 64.761894 yards.
(49998, 1618, 1, 9957.9, 1544.88, 1311.75, 0.925024, 0, 0, 0.446198, 0.894935, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 49662 at 168.963211 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(49959, 1002, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Teldrassil 42 objects total
(20932, 1002, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Teldrassil 42 objects total
(20933, 1002, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Teldrassil 42 objects total
(49655, 1002, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Teldrassil 42 objects total
(20934, 1002, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Teldrassil 42 objects total
(20935, 1002, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Teldrassil 42 objects total
(20936, 1002, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Teldrassil 42 objects total
(20937, 1002, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Teldrassil 42 objects total
(20938, 1002, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Teldrassil 42 objects total
(20939, 1002, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Teldrassil 42 objects total
(20940, 1002, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Teldrassil 42 objects total
(20941, 1002, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Teldrassil 42 objects total
(20942, 1002, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Teldrassil 42 objects total
(49998, 1002, 0, 'Peacebloom', 0, 10); -- Peaceblooms in Teldrassil 42 objects total

-- Missing Peacebloom spawns in Darkshore.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(48963, 1618, 1, 4926.66, 381.136, 38.894, 0.680677, 0, 0, 0.333806, 0.942642, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 48532 at 222.003952 yards.
(20943, 1618, 1, 7653.11, -1068.2, 41.8302, 2.67035, 0, 0, 0.972369, 0.233448, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1418 at 27.395647 yards.
(48964, 1618, 1, 6784.08, -387.636, 40.4781, 2.42601, 0, 0, 0.936672, 0.350207, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 48670 at 211.625702 yards.
(20944, 1618, 1, 7223.89, -670.534, 37.2767, 4.41568, 0, 0, -0.803857, 0.594823, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 1533 at 110.699577 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(48963, 1096, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Darkshore 18 objects total
(20943, 1096, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Darkshore 18 objects total
(48964, 1096, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Darkshore 18 objects total
(20944, 1096, 0, 'Peacebloom', 0, 10); -- Peaceblooms in Darkshore 18 objects total

-- Missing Peacebloom spawns in Mulgore.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(20625, 1618, 1, -1518.6, -283.123, -26.0325, 4.95674, 0, 0, -0.615661, 0.788011, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1607 at 155.759125 yards.
(20628, 1618, 1, -2544.55, -1180.8, -3.04812, 1.6057, 0, 0, 0.719339, 0.694659, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 18543 at 177.542282 yards.
(20865, 1618, 1, -2044.42, 207.714, 71.7263, 1.97222, 0, 0, 0.833885, 0.551938, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1433 at 167.602966 yards.
(20883, 1618, 1, -2021.16, -980.508, 9.24252, 5.39307, 0, 0, -0.430511, 0.902586, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 18536 at 157.606812 yards.
(20925, 1618, 1, -1783.83, -82.7236, -6.90968, 5.93412, 0, 0, -0.173648, 0.984808, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1551 at 148.115158 yards.
(20945, 1618, 1, -1850.22, -586.735, 0.197725, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1610 at 147.762054 yards.
(20949, 1618, 1, -2279.85, -813.539, -5.10623, 2.23402, 0, 0, 0.898793, 0.438373, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 18544 at 190.632629 yards.
(20953, 1618, 1, -1477.14, -838.87, -0.309594, 4.88692, 0, 0, -0.642787, 0.766045, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 18502 at 117.296303 yards.
(20954, 1618, 1, -2246.43, -53.9905, 1.61653, 2.77507, 0, 0, 0.983254, 0.182238, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 1724 at 169.085541 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(20625, 1026, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Mulgore 56 objects total
(20628, 1026, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Mulgore 56 objects total
(20865, 1026, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Mulgore 56 objects total
(20883, 1026, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Mulgore 56 objects total
(20925, 1026, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Mulgore 56 objects total
(20945, 1026, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Mulgore 56 objects total
(20949, 1026, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Mulgore 56 objects total
(20953, 1026, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Mulgore 56 objects total
(20954, 1026, 0, 'Peacebloom', 0, 10); -- Peaceblooms in Mulgore 56 objects total

-- Missing Peacebloom spawns in The Barrens.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(56137, 3724, 1, 771.47, -3240.14, 213.597, 1.44862, 0, 0, 0.66262, 0.748956, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 1289.610474 yards.
(56138, 3724, 1, -2418.95, -2376.44, 93.8814, 3.24635, 0, 0, -0.998629, 0.0523532, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 2475.489746 yards.
(56139, 3724, 1, -1652.84, -3576.2, 94.1403, 5.39307, 0, 0, -0.430511, 0.902586, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 1287.927246 yards.
(56140, 3724, 1, -2521.37, -2314.1, 94.527, 2.58308, 0, 0, 0.961261, 0.27564, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 2595.174805 yards.
(56141, 3724, 1, -2618.37, -2338.07, 91.7466, 4.36332, 0, 0, -0.819152, 0.573577, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 2662.494629 yards.
(56142, 3724, 1, -2616.61, -1888.47, 95.5607, 3.3685, 0, 0, -0.993571, 0.113208, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 2929.770508 yards.
(56143, 3724, 1, -1680.8, -1983.97, 93.2022, 4.55531, 0, 0, -0.760406, 0.649449, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 2219.544434 yards.
(56144, 3724, 1, -1491.01, -1884.64, 94.5635, 1.18682, 0, 0, 0.559193, 0.829038, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 2199.432373 yards.
(56145, 3724, 1, -1358.9, -2043.76, 91.8389, 2.25147, 0, 0, 0.902585, 0.430512, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 1995.724121 yards.
(56146, 3724, 1, -1614.72, -2140.22, 94.3504, 4.15388, 0, 0, -0.874619, 0.48481, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 2054.610596 yards.
(56147, 3724, 1, -848.241, -2378.59, 91.7192, 6.00393, 0, 0, -0.139173, 0.990268, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 1481.319824 yards.
(56148, 3724, 1, -419.211, -2380.24, 91.7137, 4.01426, 0, 0, -0.906307, 0.422619, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 1405.300415 yards.
(56149, 3724, 1, -1602.51, -1824.2, 91.8433, 4.50295, 0, 0, -0.777145, 0.629321, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 2308.635742 yards.
(56150, 3724, 1, -1220.93, -2018.09, 91.6667, 3.97935, 0, 0, -0.913545, 0.406738, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 1955.181274 yards.
(56151, 3724, 1, -218.375, -2586.92, 94.245, 4.97419, 0, 0, -0.608761, 0.793354, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 1209.843140 yards.
(56152, 3724, 1, -950.176, -2815.22, 93.454, 0.767944, 0, 0, 0.374606, 0.927184, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 1123.969360 yards.
(56153, 3724, 1, -1985.86, -1981.32, 92.8823, 6.26573, 0, 0, -0.00872612, 0.999962, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 2412.575439 yards.
(56154, 3724, 1, -2454.54, -2045.98, 96.6962, 3.14159, 0, 0, -1, 0, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 2704.416748 yards.
(56155, 3724, 1, -2649.53, -2018.88, 97.969, 0.994837, 0, 0, 0.477159, 0.878817, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 2873.097656 yards.
(56156, 3724, 1, -810.676, -3250.87, 92.953, 6.26573, 0, 0, -0.00872612, 0.999962, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 685.947632 yards.
(56157, 3724, 1, -709.93, -3488.44, 91.664, 5.88176, 0, 0, -0.199368, 0.979925, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 444.620697 yards.
(56158, 3724, 1, -86.2176, -3649.48, 27.1848, 5.3058, 0, 0, -0.469471, 0.882948, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 326.083801 yards.
(56159, 3724, 1, 679.832, -2213.57, 94.4202, 1.65806, 0, 0, 0.737277, 0.675591, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 1897.360718 yards.
(56160, 3724, 1, 349.798, -1883.65, 91.728, 0.349065, 0, 0, 0.173648, 0.984808, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 2037.557617 yards.
(56161, 3724, 1, 280.543, -2581.38, 93.8831, 2.09439, 0, 0, 0.866025, 0.500001, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 1374.969360 yards.
(56162, 3724, 1, -622.489, -3582.95, 91.664, 0.59341, 0, 0, 0.292371, 0.956305, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 318.354279 yards.
(56163, 3724, 1, -1548.28, -3714.21, 91.796, 0.191985, 0, 0, 0.0958452, 0.995396, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 1168.630127 yards.
(56164, 3724, 1, -3619.68, -2155.59, 91.8781, 0.104719, 0, 0, 0.0523357, 0.99863, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 3623.289795 yards.
(56165, 3724, 1, -3449.13, -2216.36, 92.162, 4.10153, 0, 0, -0.887011, 0.461749, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 3443.728271 yards.
(56166, 3724, 1, -409.883, -2852.73, 93.4444, 4.57276, 0, 0, -0.754709, 0.656059, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 933.548096 yards.
(56167, 3724, 1, -524.746, -3453.84, 94.4237, 5.13127, 0, 0, -0.544639, 0.838671, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 364.720184 yards.
(56168, 3724, 1, -2257.83, -1570.24, 92.2167, 0.698131, 0, 0, 0.34202, 0.939693, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 2901.186523 yards.
(56169, 3724, 1, -2196.5, -2320.08, 93.5697, 5.93412, 0, 0, -0.173648, 0.984808, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 2331.024658 yards.
(56170, 3724, 1, -2191.67, -1945.28, 93.879, 3.21142, 0, 0, -0.999391, 0.0349061, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 2579.501709 yards.
(56171, 3724, 1, -1907.97, -3674.25, 10.7882, 0.226892, 0, 0, 0.113203, 0.993572, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 1528.617554 yards.
(56172, 3724, 1, -2819.61, -1986.15, 94.3748, 1.0472, 0, 0, 0.5, 0.866025, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 3028.297119 yards.
(56173, 3724, 1, -3549.77, -2350.69, 96.4671, 3.75246, 0, 0, -0.953716, 0.300708, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 3476.203125 yards.
(56174, 3724, 1, -3510.11, -1917.69, 93.5602, 3.89209, 0, 0, -0.930417, 0.366502, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 3641.771240 yards.
(56175, 3724, 1, -414.971, -3546.12, 92.8495, 4.62512, 0, 0, -0.737277, 0.675591, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 247.932983 yards.
(56176, 3724, 1, -2319, -2417.43, 95.6567, 3.7001, 0, 0, -0.961261, 0.27564, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 2370.163818 yards.
(56177, 3724, 1, 714.725, -2550.9, 92.7443, 4.5204, 0, 0, -0.771625, 0.636078, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 1652.170166 yards.
(56178, 3724, 1, -3615.46, -1942.71, 94.1204, 5.98648, 0, 0, -0.147809, 0.989016, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 3720.177246 yards.
(56179, 3724, 1, -3382.04, -1915.07, 92.1843, 3.01941, 0, 0, 0.998135, 0.0610518, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 3533.784424 yards.
(56180, 3724, 1, 1115.67, -3380.36, 93.8685, 5.3058, 0, 0, -0.469471, 0.882948, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 1553.711914 yards.
(56181, 3724, 1, 714.437, -1881.07, 91.6667, 5.044, 0, 0, -0.580703, 0.814116, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 2197.522217 yards.
(56182, 3724, 1, -308.541, -1819.66, 95.7815, 6.02139, 0, 0, -0.130526, 0.991445, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 1966.587158 yards.
(56183, 3724, 1, -1646.32, -2052.02, 93.133, 2.04204, 0, 0, 0.85264, 0.522499, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 2144.242188 yards.
(56184, 3724, 1, -1023.16, -2369.34, 94.4868, 4.25861, 0, 0, -0.848047, 0.529921, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 1553.692505 yards.
(56185, 3724, 1, -146.922, -2948.52, 91.9616, 4.34587, 0, 0, -0.824126, 0.566406, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 870.263977 yards.
(56186, 3724, 1, -946.539, -2618.98, 91.7864, 5.21854, 0, 0, -0.507538, 0.861629, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 1295.224243 yards.
(56187, 3724, 1, -2383.87, -2246.75, 91.6897, 2.16421, 0, 0, 0.882947, 0.469473, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 2523.494385 yards.
(56188, 3724, 1, -1884.84, -2284.89, 94.9252, 4.34587, 0, 0, -0.824126, 0.566406, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 2122.518311 yards.
(56189, 3724, 1, -1519.67, -1745.53, 92.6195, 5.11382, 0, 0, -0.551936, 0.833886, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 2334.367432 yards.
(56190, 3724, 1, 79.8073, -3551.83, 29.4317, 3.87463, 0, 0, -0.93358, 0.358368, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 517.990784 yards.
(56191, 3724, 1, -918.801, -2302.58, 91.6667, 3.00195, 0, 0, 0.997563, 0.0697661, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 1576.154297 yards.
(56192, 3724, 1, -1954.85, -2451.13, 91.6677, 5.3058, 0, 0, -0.469471, 0.882948, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 2061.337646 yards.
(56193, 3724, 1, 384.82, -2749.18, 92.7778, 3.15906, 0, 0, -0.999962, 0.00873464, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 1290.115112 yards.
(56194, 3724, 1, -2484.21, -1778.49, 93.2762, 0.349065, 0, 0, 0.173648, 0.984808, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 2904.892334 yards.
(56195, 3724, 1, 250.021, -3047.69, 96.0069, 4.55531, 0, 0, -0.760406, 0.649449, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 973.323669 yards.
(56196, 3724, 1, -182.081, -2814.53, 91.9249, 3.50812, 0, 0, -0.983254, 0.182238, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 991.830566 yards.
(56197, 3724, 1, -158.029, -3378.55, 92.3938, 0.244346, 0, 0, 0.121869, 0.992546, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 467.872925 yards.
(56198, 3724, 1, -1352.04, -3855.47, 17.8905, 3.89209, 0, 0, -0.930417, 0.366502, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 971.374084 yards.
(56199, 3724, 1, 390.577, -3414.15, 95.0342, 0.453785, 0, 0, 0.224951, 0.97437, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 55890 at 860.175537 yards.
(56200, 3724, 1, -980.281, -2982.13, 92.5597, 1.76278, 0, 0, 0.771625, 0.636078, 900, 900, 1, 100, 0, 10); -- Closest existing guid is 55890 at 1001.392578 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(56137, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56138, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56139, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56140, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56141, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56142, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56143, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56144, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56145, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56146, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56147, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56148, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56149, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56150, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56151, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56152, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56153, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56154, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56155, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56156, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56157, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56158, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56159, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56160, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56161, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56162, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56163, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56164, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56165, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56166, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56167, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56168, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56169, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56170, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56171, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56172, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56173, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56174, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56175, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56176, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56177, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56178, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56179, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56180, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56181, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56182, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56183, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56184, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56185, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56186, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56187, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56188, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56189, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56190, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56191, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56192, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56193, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56194, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56195, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56196, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56197, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56198, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56199, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(56200, 1030, 0, 'Peacebloom', 0, 10); -- Peaceblooms in Barrens 86 objects total

-- Correct position of Plaguebloom in Western Plaguelands (position is off by 0.885746 yards).
UPDATE `gameobject` SET `position_x`=1793.15, `position_y`=-1525.49, `position_z`=59.5958, `orientation`=4.99164, `rotation0`=0, `rotation1`=0, `rotation2`=-0.601814, `rotation3`=0.798636 WHERE `guid`=20069;

-- Correct position of Plaguebloom in Western Plaguelands (position is off by 0.802253 yards).
UPDATE `gameobject` SET `position_x`=1636.25, `position_y`=-2151.5, `position_z`=62.933, `orientation`=1.27409, `rotation0`=0, `rotation1`=0, `rotation2`=0.594822, `rotation3`=0.803857 WHERE `guid`=19948;

-- Correct position of Plaguebloom in Western Plaguelands (position is off by 0.931319 yards).
UPDATE `gameobject` SET `position_x`=1438.31, `position_y`=-1862.93, `position_z`=58.7446, `orientation`=0.383971, `rotation0`=0, `rotation1`=0, `rotation2`=0.190808, `rotation3`=0.981627 WHERE `guid`=19992;

-- Correct position of Plaguebloom in Eastern Plaguelands (position is off by 0.749571 yards).
UPDATE `gameobject` SET `position_x`=1782.65, `position_y`=-4221.37, `position_z`=88.5097, `orientation`=0.139624, `rotation0`=0, `rotation1`=0, `rotation2`=0.0697556, `rotation3`=0.997564 WHERE `guid`=19901;

-- Correct position of Plaguebloom in Eastern Plaguelands (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=1711.95, `position_y`=-3935.51, `position_z`=130.9, `orientation`=4.55531, `rotation0`=0, `rotation1`=0, `rotation2`=-0.760406, `rotation3`=0.649449 WHERE `guid`=19910;

-- Correct position of Plaguebloom in Eastern Plaguelands (position is off by 2.99211 yards).
UPDATE `gameobject` SET `position_x`=2016.61, `position_y`=-4694.26, `position_z`=91.7821, `orientation`=5.44543, `rotation0`=0, `rotation1`=0, `rotation2`=-0.406736, `rotation3`=0.913546 WHERE `guid`=19955;

-- Correct position of Plaguebloom in Eastern Plaguelands (position is off by 2.7626 yards).
UPDATE `gameobject` SET `position_x`=1744.05, `position_y`=-3014.99, `position_z`=77.4633, `orientation`=4.95674, `rotation0`=0, `rotation1`=0, `rotation2`=-0.615661, `rotation3`=0.788011 WHERE `guid`=19960;

-- Correct position of Plaguebloom in Eastern Plaguelands (position is off by 3.168 yards).
UPDATE `gameobject` SET `position_x`=2719.06, `position_y`=-4868.81, `position_z`=88.9132, `orientation`=1.43117, `rotation0`=0, `rotation1`=0, `rotation2`=0.656058, `rotation3`=0.75471 WHERE `guid`=20122;

-- Correct position of Plaguebloom in Western Plaguelands (position is off by 4.45907 yards).
UPDATE `gameobject` SET `position_x`=1810.51, `position_y`=-1249.53, `position_z`=60.7759, `orientation`=4.59022, `rotation0`=0, `rotation1`=0, `rotation2`=-0.748956, `rotation3`=0.66262 WHERE `guid`=19980;

-- Correct position of Plaguebloom in Eastern Plaguelands (position is off by 4.62324 yards).
UPDATE `gameobject` SET `position_x`=1646.8, `position_y`=-3432.92, `position_z`=136.714, `orientation`=5.51524, `rotation0`=0, `rotation1`=0, `rotation2`=-0.374606, `rotation3`=0.927184 WHERE `guid`=20013;

-- Missing Plaguebloom spawns in Western Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(20306, 176587, 0, 1673.49, -2277.09, 59.161, 5.42797, 0, 0, -0.414693, 0.909961, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19947 at 32.130016 yards.
(20368, 176587, 0, 1639.55, -2259.62, 59.2509, 2.11185, 0, 0, 0.870356, 0.492424, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20071 at 27.851536 yards.
(20369, 176587, 0, 1095.73, -2526.41, 61.4232, 6.24828, 0, 0, -0.0174522, 0.999848, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19942 at 14.189718 yards.
(20370, 176587, 0, 1423.88, -1886.62, 59.7396, 2.16421, 0, 0, 0.882947, 0.469473, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20120 at 18.387112 yards.
(20372, 176587, 0, 1943.64, -1904.94, 75.7893, 5.3058, 0, 0, -0.469471, 0.882948, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19895 at 20.947813 yards.
(20373, 176587, 0, 1501.36, -1822.75, 60.3359, 5.96903, 0, 0, -0.156434, 0.987688, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19925 at 31.521227 yards.
(20374, 176587, 0, 1208, -2550.61, 73.0816, 5.16618, 0, 0, -0.529919, 0.848048, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19912 at 10.796460 yards.
(20375, 176587, 0, 1238.8, -2549.02, 92.0041, 5.63741, 0, 0, -0.317305, 0.948324, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20108 at 5.773206 yards.
(20411, 176587, 0, 1861.09, -2010.82, 83.83, 4.10153, 0, 0, -0.887011, 0.461749, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19916 at 17.601728 yards.
(20424, 176587, 0, 1769.25, -2311.86, 60.0036, 4.86947, 0, 0, -0.649447, 0.760406, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20103 at 28.944180 yards.
(20454, 176587, 0, 1497.6, -1860.78, 58.628, 2.86234, 0, 0, 0.990268, 0.139175, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19925 at 10.244534 yards.
(20473, 176587, 0, 1814.54, -1161.08, 60.4921, 3.85718, 0, 0, -0.936671, 0.35021, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20012 at 24.670967 yards.
(20474, 176587, 0, 2160.22, -2457.96, 64.21, 5.81195, 0, 0, -0.233445, 0.97237, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19979 at 22.325752 yards.
(20477, 176587, 0, 1752.43, -1226.08, 59.6435, 3.00195, 0, 0, 0.997563, 0.0697661, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20051 at 28.548876 yards.
(20496, 176587, 0, 2237.28, -1541.57, 78.802, 1.62316, 0, 0, 0.725374, 0.688355, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20002 at 16.736601 yards.
(20509, 176587, 0, 1834.97, -2172.85, 66.8352, 3.94445, 0, 0, -0.920505, 0.390732, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19911 at 14.306360 yards.
(20515, 176587, 0, 2345.16, -1587.58, 109.385, 5.42797, 0, 0, -0.414693, 0.909961, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20001 at 14.397959 yards.
(20516, 176587, 0, 1890.2, -1756.4, 61.7958, 2.63544, 0, 0, 0.968147, 0.250381, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20073 at 10.849380 yards.
(20524, 176587, 0, 2028.71, -2379.53, 61.8859, 3.194, 0, 0, -0.999657, 0.0262016, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 19898 at 33.173168 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(20306, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(20368, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(20369, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(20370, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(20372, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(20373, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(20374, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(20375, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(20411, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(20424, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(20454, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(20473, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(20474, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(20477, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(20496, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(20509, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(20515, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(20516, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(20524, 1258, 0, 'Plaguebloom', 0, 10); -- Plagueblooms in Western Plaguelands 74 objects total

-- Missing Plaguebloom spawns in Eastern Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(20307, 176587, 0, 1680.81, -3853.04, 133.434, 0.733038, 0, 0, 0.358368, 0.93358, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19910 at 88.180267 yards.
(20359, 176587, 0, 2832.67, -4743.53, 77.3118, 0.471238, 0, 0, 0.233445, 0.97237, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19991 at 21.124720 yards.
(20360, 176587, 0, 3411.95, -4953.78, 164.461, 4.08407, 0, 0, -0.891006, 0.453991, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19973 at 138.467865 yards.
(20361, 176587, 0, 1577.75, -4618.21, 85.1723, 1.98967, 0, 0, 0.83867, 0.54464, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20029 at 7.846690 yards.
(20362, 176587, 0, 1626.86, -3243.33, 85.542, 2.00713, 0, 0, 0.843391, 0.5373, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20105 at 7.868289 yards.
(20363, 176587, 0, 1852.03, -3815.96, 136.994, 1.0821, 0, 0, 0.515038, 0.857168, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19963 at 27.134569 yards.
(20364, 176587, 0, 2483.69, -4265.49, 74.3489, 1.62316, 0, 0, 0.725374, 0.688355, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20055 at 9.744184 yards.
(20365, 176587, 0, 3021.44, -4038.53, 103.952, 2.74016, 0, 0, 0.979924, 0.19937, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20125 at 16.190050 yards.
(20366, 176587, 0, 3113.64, -3780.52, 130.505, 2.79252, 0, 0, 0.984807, 0.173652, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20045 at 7.270828 yards.
(20367, 176587, 0, 2158.7, -4345.31, 75.9694, 2.67035, 0, 0, 0.972369, 0.233448, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19953 at 19.170549 yards.
(20371, 176587, 0, 1744.66, -4339.93, 77.6948, 6.21337, 0, 0, -0.0348988, 0.999391, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20121 at 7.031590 yards.
(20376, 176587, 0, 1878.36, -4847.95, 107.496, 3.73501, 0, 0, -0.956305, 0.292372, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19993 at 149.716660 yards.
(20390, 176587, 0, 1649.55, -3722.11, 119.535, 1.46608, 0, 0, 0.66913, 0.743145, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19963 at 222.368927 yards.
(20409, 176587, 0, 1960.5, -5018.98, 76.7022, 0.663223, 0, 0, 0.325567, 0.945519, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19982 at 18.343681 yards.
(20417, 176587, 0, 2020.2, -3652.82, 128.096, 2.53072, 0, 0, 0.953716, 0.300708, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20063 at 36.427803 yards.
(20418, 176587, 0, 2274.09, -4297.45, 74.1448, 5.58505, 0, 0, -0.34202, 0.939693, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19966 at 13.796571 yards.
(20421, 176587, 0, 3192.28, -3585.68, 146.257, 4.59022, 0, 0, -0.748956, 0.66262, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20124 at 10.900506 yards.
(46300, 176587, 0, 2777.31, -3226.03, 105.933, 2.46091, 0, 0, 0.942641, 0.333808, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45833 at 71.337608 yards.
(20422, 176587, 0, 3236.68, -4728.21, 157.185, 2.74016, 0, 0, 0.979924, 0.19937, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19918 at 149.905701 yards.
(20457, 176587, 0, 2453.32, -3760.32, 177.514, 2.54818, 0, 0, 0.956305, 0.292372, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19904 at 7.634620 yards.
(20464, 176587, 0, 2067.59, -3926.66, 133.094, 4.20625, 0, 0, -0.861629, 0.507539, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19896 at 21.806383 yards.
(20466, 176587, 0, 2815.06, -5441.11, 158.186, 1.0821, 0, 0, 0.515038, 0.857168, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20129 at 19.915037 yards.
(20467, 176587, 0, 2645, -5522.47, 158.436, 0.349065, 0, 0, 0.173648, 0.984808, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20044 at 36.009937 yards.
(20475, 176587, 0, 2727.14, -5479.72, 161.22, 2.00713, 0, 0, 0.843391, 0.5373, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20130 at 13.941584 yards.
(20476, 176587, 0, 2689.53, -5363.66, 157.824, 0.942477, 0, 0, 0.45399, 0.891007, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19977 at 13.851860 yards.
(20499, 176587, 0, 1784.86, -4176.54, 86.9041, 0.663223, 0, 0, 0.325567, 0.945519, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20059 at 12.842490 yards.
(20506, 176587, 0, 2818.86, -4592.9, 90.6468, 4.59022, 0, 0, -0.748956, 0.66262, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19958 at 16.066998 yards.
(20507, 176587, 0, 1708.37, -4802.04, 84.4106, 5.61996, 0, 0, -0.325567, 0.945519, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19900 at 23.920475 yards.
(20508, 176587, 0, 2758.57, -5373.56, 156.996, 3.6652, 0, 0, -0.965925, 0.258821, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20099 at 6.636089 yards.
(20510, 176587, 0, 2009.09, -2985.9, 77.9653, 2.53072, 0, 0, 0.953716, 0.300708, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20123 at 17.167763 yards.
(20513, 176587, 0, 2453.53, -3656.75, 177.802, 5.35816, 0, 0, -0.446198, 0.894935, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20114 at 22.270550 yards.
(33885, 176587, 0, 1855.35, -4576.7, 79.0182, 5.2709, 0, 0, -0.484809, 0.87462, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 33864 at 44.894478 yards.
(20520, 176587, 0, 2115.63, -4873.79, 74.8908, 1.50098, 0, 0, 0.681998, 0.731354, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19955 at 203.051193 yards.
(20522, 176587, 0, 2937.81, -4292.18, 90.3692, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20110 at 11.885118 yards.
(20523, 176587, 0, 2147.51, -2717.23, 74.2392, 0.837757, 0, 0, 0.406736, 0.913546, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 20072 at 17.322309 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(20307, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(20359, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(20360, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(20361, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(20362, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(20363, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(20364, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(20365, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(20366, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(20367, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(20371, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(20376, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(20390, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(20409, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(20417, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(20418, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(20421, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(46300, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(20422, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(20457, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(20464, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(20466, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(20467, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(20475, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(20476, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(20499, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(20506, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(20507, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(20508, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(20510, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(20513, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(33885, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(20520, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(20522, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(20523, 1265, 0, 'Plaguebloom', 0, 10); -- Plagueblooms in Eastern Plaguelands 144 objects total

-- Missing Plaguebloom spawns in Felwood.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(20533, 176641, 1, 4204.94, -1031.77, 293.272, 4.81711, 0, 0, -0.66913, 0.743145, 1800, 1800, 1, 100, 0, 10),
(20534, 176641, 1, 6679.51, -1323.44, 467.133, 3.26377, 0, 0, -0.998135, 0.0610518, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 20533 at 2497.758057 yards.
(20535, 176641, 1, 6306.93, -856.434, 416.503, 2.02458, 0, 0, 0.848047, 0.529921, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 20533 at 2112.886963 yards.
(20536, 176641, 1, 4623.66, -883.974, 321.067, 5.79449, 0, 0, -0.241921, 0.970296, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 20533 at 444.907684 yards.
(20537, 176641, 1, 5540.28, -740.778, 341.768, 5.2709, 0, 0, -0.484809, 0.87462, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 20533 at 1367.538208 yards.
(20538, 176641, 1, 4513.95, -767.927, 262.422, 5.75959, 0, 0, -0.258819, 0.965926, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 20533 at 407.495026 yards.
(20540, 176641, 1, 6263.24, -1076.29, 373.896, 4.04917, 0, 0, -0.898793, 0.438373, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 20533 at 2060.359619 yards.
(20542, 176641, 1, 6419.71, -1623.33, 482.022, 3.4034, 0, 0, -0.991445, 0.130528, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 20533 at 2300.168701 yards.
(20543, 176641, 1, 4630.22, -670.115, 259.879, 0.59341, 0, 0, 0.292371, 0.956305, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 20533 at 559.260925 yards.
(20544, 176641, 1, 4460.42, -669.337, 268.7, 2.42601, 0, 0, 0.936672, 0.350207, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 20533 at 444.107544 yards.
(20545, 176641, 1, 5222.93, -781.834, 345.815, 0.837757, 0, 0, 0.406736, 0.913546, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 20533 at 1049.539307 yards.
(20546, 176641, 1, 4049.45, -1216.91, 279.827, 4.32842, 0, 0, -0.829037, 0.559194, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 20533 at 242.146088 yards.
(20547, 176641, 1, 4452.15, -933.014, 310.124, 5.93412, 0, 0, -0.173648, 0.984808, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 20533 at 266.738678 yards.
(20548, 176641, 1, 4348.48, -675.812, 270.243, 0.226892, 0, 0, 0.113203, 0.993572, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 20533 at 384.499908 yards.
(20549, 176641, 1, 4974.86, -553.669, 332.864, 4.69494, 0, 0, -0.71325, 0.70091, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 20533 at 907.151978 yards.
(20550, 176641, 1, 6852.51, -1816.94, 563.876, 0.401425, 0, 0, 0.199368, 0.979925, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 20533 at 2774.769287 yards.
(20551, 176641, 1, 6416.68, -1347.35, 377.708, 5.18363, 0, 0, -0.522498, 0.85264, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 20533 at 2235.735840 yards.
(20552, 176641, 1, 5644.48, -674.997, 343.131, 4.11898, 0, 0, -0.882947, 0.469473, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 20533 at 1483.930054 yards.
(20554, 176641, 1, 4886.47, -781, 296.668, 1.48353, 0, 0, 0.67559, 0.737278, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 20533 at 726.209839 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(20534, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(20535, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(20536, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(20537, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(20538, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(20540, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(20542, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(20543, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(20544, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(20545, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(20546, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(20547, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(20548, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(20549, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(20550, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(20551, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(20552, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(20554, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(20533, 1227, 0, 'Plaguebloom', 0, 10);

-- Missing Plaguebloom spawns in Eastern Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21855, 176587, 0, 2019.04, -4695.94, 91.3082, 2.9496, 0, 0, 0.995396, 0.0958512, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 19955 at 2.992112 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(21855, 1265, 0, 'Plaguebloom', 0, 10); -- Plagueblooms in Eastern Plaguelands 144 objects total

-- Correct position of Purple Lotus in Tanaris (position is off by 2.2099 yards).
UPDATE `gameobject` SET `position_x`=-7986.6, `position_y`=-3850.93, `position_z`=18.7965, `orientation`=0.872664, `rotation0`=0, `rotation1`=0, `rotation2`=0.422618, `rotation3`=0.906308 WHERE `guid`=15894;

-- Correct position of Purple Lotus in The Hinterlands (position is off by 0.718012 yards).
UPDATE `gameobject` SET `position_x`=-53.6596, `position_y`=-2497.63, `position_z`=122.501, `orientation`=1.20428, `rotation0`=0, `rotation1`=0, `rotation2`=0.566406, `rotation3`=0.824126 WHERE `guid`=15864;

-- Correct position of Purple Lotus in Badlands (position is off by 1.52016 yards).
UPDATE `gameobject` SET `position_x`=-6600.91, `position_y`=-2596.01, `position_z`=267.721, `orientation`=3.56047, `rotation0`=0, `rotation1`=0, `rotation2`=-0.978148, `rotation3`=0.207912 WHERE `guid`=15827;

-- Correct position of Purple Lotus in Badlands (position is off by 1.22217 yards).
UPDATE `gameobject` SET `position_x`=-6527.28, `position_y`=-3183.1, `position_z`=259.257, `orientation`=5.46288, `rotation0`=0, `rotation1`=0, `rotation2`=-0.398748, `rotation3`=0.91706 WHERE `guid`=15849;

-- Correct position of Purple Lotus in Azshara (position is off by 0.955584 yards).
UPDATE `gameobject` SET `position_x`=3465.79, `position_y`=-4853.79, `position_z`=131.019, `orientation`=4.20625, `rotation0`=0, `rotation1`=0, `rotation2`=-0.861629, `rotation3`=0.507539 WHERE `guid`=15944;

-- Correct position of Purple Lotus in Azshara (position is off by 3.54618 yards).
UPDATE `gameobject` SET `position_x`=3693.19, `position_y`=-5119.39, `position_z`=91.1671, `orientation`=3.80482, `rotation0`=0, `rotation1`=0, `rotation2`=-0.945518, `rotation3`=0.325568 WHERE `guid`=15876;

-- Correct position of Purple Lotus in Azshara (position is off by 1.26858 yards).
UPDATE `gameobject` SET `position_x`=2993.69, `position_y`=-4190.96, `position_z`=99.2725, `orientation`=0.191985, `rotation0`=0, `rotation1`=0, `rotation2`=0.0958452, `rotation3`=0.995396 WHERE `guid`=39932;

-- Correct position of Purple Lotus in Azshara (position is off by 0.000999451 yards).
UPDATE `gameobject` SET `position_x`=3435.67, `position_y`=-4595.98, `position_z`=104.198, `orientation`=1.64061, `rotation0`=0, `rotation1`=0, `rotation2`=0.731353, `rotation3`=0.681999 WHERE `guid`=39934;

-- Correct position of Purple Lotus in Ashenvale (position is off by 0.874528 yards).
UPDATE `gameobject` SET `position_x`=3676.34, `position_y`=810.223, `position_z`=6.04557, `orientation`=4.31097, `rotation0`=0, `rotation1`=0, `rotation2`=-0.833885, `rotation3`=0.551938 WHERE `guid`=15907;

-- Correct position of Purple Lotus in Stranglethorn Vale (position is off by 0.933619 yards).
UPDATE `gameobject` SET `position_x`=-12563, `position_y`=-745.924, `position_z`=39.8806, `orientation`=5.65487, `rotation0`=0, `rotation1`=0, `rotation2`=-0.309016, `rotation3`=0.951057 WHERE `guid`=15814;

-- Correct position of Purple Lotus in The Hinterlands (position is off by 1.38 yards).
UPDATE `gameobject` SET `position_x`=-212.253, `position_y`=-3122.93, `position_z`=130.193, `orientation`=2.33874, `rotation0`=0, `rotation1`=0, `rotation2`=0.920505, `rotation3`=0.390732 WHERE `guid`=15913;

-- Correct position of Purple Lotus in The Hinterlands (position is off by 1.1612 yards).
UPDATE `gameobject` SET `position_x`=-21.1782, `position_y`=-2837.13, `position_z`=126.25, `orientation`=1.93731, `rotation0`=0, `rotation1`=0, `rotation2`=0.824125, `rotation3`=0.566408 WHERE `guid`=15833;

-- Correct position of Purple Lotus in Tanaris (position is off by 2.92861 yards).
UPDATE `gameobject` SET `position_x`=-8274.79, `position_y`=-4711.89, `position_z`=0.241838, `orientation`=0, `rotation0`=0, `rotation1`=0, `rotation2`=0, `rotation3`=1 WHERE `guid`=15841;

-- Correct position of Purple Lotus in The Hinterlands (position is off by 3.73687 yards).
UPDATE `gameobject` SET `position_x`=-330.517, `position_y`=-3413.43, `position_z`=158.924, `orientation`=4.7473, `rotation0`=0, `rotation1`=0, `rotation2`=-0.694658, `rotation3`=0.71934 WHERE `guid`=15839;

-- Correct position of Purple Lotus in Azshara (position is off by 1.58077 yards).
UPDATE `gameobject` SET `position_x`=3443.29, `position_y`=-5076.38, `position_z`=83.4753, `orientation`=4.57276, `rotation0`=0, `rotation1`=0, `rotation2`=-0.754709, `rotation3`=0.656059 WHERE `guid`=15800;

-- Missing Purple Lotus spawns in Azshara.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(48965, 142140, 1, 2861.47, -4010.64, 141.192, 3.927, 0, 0, -0.923879, 0.382686, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 48341 at 56.227066 yards.
(20974, 142140, 1, 3336.85, -4491.03, 97.7367, 1.27409, 0, 0, 0.594822, 0.803857, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15920 at 7.867492 yards.
(20975, 142140, 1, 3788.44, -5311.64, 85.6851, 5.41052, 0, 0, -0.422618, 0.906308, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15855 at 20.227098 yards.
(20976, 142140, 1, 4675.05, -6700.34, 129.286, 1.23918, 0, 0, 0.580703, 0.814116, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15804 at 351.472107 yards.
(20977, 142140, 1, 4165.3, -7376.7, 11.9216, 4.7822, 0, 0, -0.681998, 0.731354, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15797 at 120.979134 yards.
(20978, 142140, 1, 3592.93, -4899.12, 125.755, 2.23402, 0, 0, 0.898793, 0.438373, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15906 at 44.639309 yards.
(20979, 142140, 1, 3145.88, -5256.87, 94.1848, 4.71239, 0, 0, -0.707107, 0.707107, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15872 at 5.797706 yards.
(21063, 142140, 1, 3276.13, -4601.25, 96.6221, 2.96704, 0, 0, 0.996194, 0.087165, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15840 at 95.084305 yards.
(21064, 142140, 1, 3797.78, -5155.82, 142.267, 0.191985, 0, 0, 0.0958452, 0.995396, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15903 at 76.899986 yards.
(21067, 142140, 1, 3375.36, -4901.83, 123.927, 0.209439, 0, 0, 0.104528, 0.994522, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15908 at 27.848259 yards.
(21069, 142140, 1, 3277.1, -5305.4, 88.0199, 0.767944, 0, 0, 0.374606, 0.927184, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15909 at 76.876694 yards.
(21070, 142140, 1, 2665.9, -4615.88, 135.965, 2.82743, 0, 0, 0.987688, 0.156436, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15837 at 201.972855 yards.
(21072, 142140, 1, 3580.77, -5089.3, 85.0643, 3.42085, 0, 0, -0.990268, 0.139175, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 15801 at 24.987345 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(48965, 1239, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Azshara 114 objects total
(20974, 1239, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Azshara 114 objects total
(20975, 1239, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Azshara 114 objects total
(20976, 1239, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Azshara 114 objects total
(20977, 1239, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Azshara 114 objects total
(20978, 1239, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Azshara 114 objects total
(20979, 1239, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Azshara 114 objects total
(21063, 1239, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Azshara 114 objects total
(21064, 1239, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Azshara 114 objects total
(21067, 1239, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Azshara 114 objects total
(21069, 1239, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Azshara 114 objects total
(21070, 1239, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Azshara 114 objects total
(21072, 1239, 0, 'Purple Lotus', 0, 10); -- Purple Lotus in Azshara 114 objects total

-- Missing Purple Lotus spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(20981, 142140, 0, -12469, -182.317, 14.5772, 5.5676, 0, 0, -0.350207, 0.936672, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15940 at 32.343143 yards.
(21065, 142140, 0, -11686.2, 723.244, 50.6623, 1.23918, 0, 0, 0.580703, 0.814116, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15899 at 16.314449 yards.
(21075, 142140, 0, -12162.9, -0.86122, -5.06293, 3.38594, 0, 0, -0.992546, 0.12187, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15940 at 324.218994 yards.
(21076, 142140, 0, -12832.5, -756.565, 76.742, 5.84685, 0, 0, -0.216439, 0.976296, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 15809 at 130.351852 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(20981, 1199, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Stranglethorn 15 objects total
(21065, 1199, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Stranglethorn 15 objects total
(21075, 1199, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Stranglethorn 15 objects total
(21076, 1199, 0, 'Purple Lotus', 0, 10); -- Purple Lotus in Stranglethorn 15 objects total

-- Missing Purple Lotus spawns in The Hinterlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(46419, 142140, 0, -316.936, -4234.65, 138.125, 0.628317, 0, 0, 0.309016, 0.951057, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 46302 at 79.974846 yards.
(46460, 142140, 0, -329.511, -4207.55, 152.009, 1.53589, 0, 0, 0.694658, 0.71934, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 46302 at 84.358688 yards.
(35011, 142140, 0, -371.908, -4127, 173.995, 1.79769, 0, 0, 0.782608, 0.622515, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34973 at 83.703262 yards.
(35013, 142140, 0, -447.216, -4033.18, 197.291, 1.23918, 0, 0, 0.580703, 0.814116, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34991 at 73.254074 yards.
(35020, 142140, 0, -504.943, -4198.09, 215.861, 4.53786, 0, 0, -0.766044, 0.642789, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34973 at 232.485458 yards.
(35021, 142140, 0, -575.298, -4170.64, 238.351, 5.49779, 0, 0, -0.382683, 0.92388, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34991 at 257.475616 yards.
(46467, 142140, 0, -262.42, -3912.02, 215.861, 2.46091, 0, 0, 0.942641, 0.333808, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 46297 at 76.323219 yards.
(35023, 142140, 0, -533.245, -3825.94, 238.163, 6.17847, 0, 0, -0.0523357, 0.99863, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34998 at 145.299118 yards.
(20972, 142140, 0, -33.9568, -2777.36, 122.507, 5.48033, 0, 0, -0.390731, 0.920505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15911 at 19.358761 yards.
(46468, 142140, 0, 389.724, -3402.35, 122.954, 4.32842, 0, 0, -0.829037, 0.559194, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 46311 at 329.377441 yards.
(35024, 142140, 0, -281.208, -4107.5, 138.673, 4.24115, 0, 0, -0.85264, 0.522499, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34971 at 20.501350 yards.
(35027, 142140, 0, -539.072, -4192.2, 215.934, 3.22886, 0, 0, -0.999048, 0.0436193, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34991 at 254.371017 yards.
(35029, 142140, 0, -589.769, -3878.78, 238.958, 5.49779, 0, 0, -0.382683, 0.92388, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34991 at 197.303238 yards.
(46469, 142140, 0, -173.964, -3896.27, 215.861, 0.139624, 0, 0, 0.0697556, 0.997564, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 46297 at 74.111198 yards.
(35030, 142140, 0, -352.482, -4108.68, 152.557, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34973 at 61.750637 yards.
(35031, 142140, 0, -422.78, -4200.25, 174.764, 0.279252, 0, 0, 0.139173, 0.990268, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34973 at 172.884155 yards.
(35032, 142140, 0, -449.898, -3900.91, 216.003, 2.00713, 0, 0, 0.843391, 0.5373, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34991 at 76.492950 yards.
(35033, 142140, 0, -685.337, -3991.11, 238.496, 6.00393, 0, 0, -0.139173, 0.990268, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34991 at 271.045471 yards.
(21071, 142140, 0, -418.711, -2793.62, 80.5266, 5.13127, 0, 0, -0.544639, 0.838671, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15858 at 51.727127 yards.
(21073, 142140, 0, -414.097, -2969.14, 95.1376, 0.0174525, 0, 0, 0.00872612, 0.999962, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 15858 at 129.298874 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(46419, 1254, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Hinterlands 29 objects total
(46460, 1254, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Hinterlands 29 objects total
(35011, 1254, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Hinterlands 29 objects total
(35013, 1254, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Hinterlands 29 objects total
(35020, 1254, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Hinterlands 29 objects total
(35021, 1254, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Hinterlands 29 objects total
(46467, 1254, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Hinterlands 29 objects total
(35023, 1254, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Hinterlands 29 objects total
(20972, 1254, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Hinterlands 29 objects total
(46468, 1254, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Hinterlands 29 objects total
(35024, 1254, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Hinterlands 29 objects total
(35027, 1254, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Hinterlands 29 objects total
(35029, 1254, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Hinterlands 29 objects total
(46469, 1254, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Hinterlands 29 objects total
(35030, 1254, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Hinterlands 29 objects total
(35031, 1254, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Hinterlands 29 objects total
(35032, 1254, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Hinterlands 29 objects total
(35033, 1254, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Hinterlands 29 objects total
(21071, 1254, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Hinterlands 29 objects total
(21073, 1254, 0, 'Purple Lotus', 0, 10); -- Purple Lotus in Hinterlands 29 objects total

-- Missing Purple Lotus spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(20973, 142140, 1, 4167.73, 1054.79, 3.75733, 4.11898, 0, 0, -0.882947, 0.469473, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15848 at 273.661499 yards.
(21074, 142140, 1, 2881.48, -2757.06, 211.224, 4.88692, 0, 0, -0.642787, 0.766045, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 15831 at 70.187988 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(20973, 1305, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Ashenvale 14 objects total
(21074, 1305, 0, 'Purple Lotus', 0, 10); -- Purple Lotus in Ashenvale 14 objects total

-- Missing Purple Lotus spawns in Feralas.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(49999, 142140, 1, -5449.09, 1327.84, 20.0258, 2.44346, 0, 0, 0.939692, 0.34202, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49979 at 104.543198 yards.
(50002, 142140, 1, -5770.9, 1320, 51.2895, 3.9619, 0, 0, -0.91706, 0.39875, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49977 at 204.528656 yards.
(50005, 142140, 1, -5610.68, 1442.64, 27.5771, 2.75761, 0, 0, 0.981627, 0.190812, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49981 at 76.581291 yards.
(50006, 142140, 1, -5741.64, 1168.35, 64.9306, 2.21657, 0, 0, 0.894934, 0.446199, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49977 at 179.838196 yards.
(50007, 142140, 1, -5358.88, 1241.68, 22.1054, 0.610863, 0, 0, 0.300705, 0.953717, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49980 at 114.980377 yards.
(50008, 142140, 1, -5380.43, 1269.73, 21.0369, 1.43117, 0, 0, 0.656058, 0.75471, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49979 at 106.189926 yards.
(21060, 142140, 1, -4913.04, 1193.57, 56.7543, 1.79769, 0, 0, 0.782608, 0.622515, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15932 at 51.934139 yards.
(21061, 142140, 1, -3153.04, 1919.11, 45.3751, 2.11185, 0, 0, 0.870356, 0.492424, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15869 at 65.364075 yards.
(50010, 142140, 1, -5478.73, 1138.19, 48.0808, 6.23083, 0, 0, -0.0261765, 0.999657, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49979 at 91.096802 yards.
(170119, 142140, 1, -5002.79, 1201.35, 54.0045, 6.05629, 0, 0, -0.113203, 0.993572, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 170103 at 106.383934 yards.
(50018, 142140, 1, -2947.83, 2695.4, 69.0527, 2.93214, 0, 0, 0.994521, 0.104536, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49982 at 71.841408 yards.
(50109, 142140, 1, -2956.43, 2825.18, 71.4067, 2.54818, 0, 0, 0.956305, 0.292372, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49985 at 83.919159 yards.
(50110, 142140, 1, -5561.03, 1195.79, 27.0421, 3.33359, 0, 0, -0.995396, 0.0958512, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 49977 at 52.713428 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(49999, 1324, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Feralas 15 objects total
(50002, 1324, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Feralas 15 objects total
(50005, 1324, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Feralas 15 objects total
(50006, 1324, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Feralas 15 objects total
(50007, 1324, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Feralas 15 objects total
(50008, 1324, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Feralas 15 objects total
(21060, 1324, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Feralas 15 objects total
(21061, 1324, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Feralas 15 objects total
(50010, 1324, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Feralas 15 objects total
(170119, 1324, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Feralas 15 objects total
(50018, 1324, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Feralas 15 objects total
(50109, 1324, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Feralas 15 objects total
(50110, 1324, 0, 'Purple Lotus', 0, 10); -- Purple Lotus in Feralas 15 objects total

-- Missing Purple Lotus spawns in Tanaris.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(20956, 142140, 1, -6999.92, -4372.03, 11.0493, 3.94445, 0, 0, -0.920505, 0.390732, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 17305 at 53.660614 yards.
(20957, 142140, 1, -6918.99, -4380.4, 11.7204, 1.29154, 0, 0, 0.601814, 0.798636, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 17308 at 31.498817 yards.
(32882, 142140, 1, -6835.3, -2926.15, 8.88333, 2.32129, 0, 0, 0.91706, 0.39875, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 32878 at 24.262632 yards.
(20958, 142140, 1, -8904.49, -3300.98, 19.1368, 3.42085, 0, 0, -0.990268, 0.139175, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15789 at 83.678467 yards.
(20959, 142140, 1, -8962.61, -3482.48, 20.1249, 2.14675, 0, 0, 0.878817, 0.47716, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 17311 at 35.150578 yards.
(20960, 142140, 1, -6956.38, -4358.96, 10.5284, 2.89725, 0, 0, 0.992546, 0.12187, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 17308 at 27.152010 yards.
(20961, 142140, 1, -6950.18, -4383.59, 9.9112, 1.71042, 0, 0, 0.754709, 0.656059, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 17305 at 31.764072 yards.
(20962, 142140, 1, -6921.26, -4414.95, 11.598, 0.610863, 0, 0, 0.300705, 0.953717, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 17305 at 43.058369 yards.
(20964, 142140, 1, -9611.99, -2737.25, 17.1735, 3.4383, 0, 0, -0.989016, 0.147811, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15918 at 83.052811 yards.
(20965, 142140, 1, -7954.11, -3844.91, 23.978, 1.02974, 0, 0, 0.492423, 0.870356, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15886 at 17.252953 yards.
(20966, 142140, 1, -6986.9, -4349.21, 9.60038, 3.38594, 0, 0, -0.992546, 0.12187, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15877 at 29.914413 yards.
(20967, 142140, 1, -8838.39, -3526.83, 10.4236, 4.24115, 0, 0, -0.85264, 0.522499, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15896 at 65.989418 yards.
(20968, 142140, 1, -9147.47, -3029.07, 36.9857, 1.55334, 0, 0, 0.700909, 0.713251, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15865 at 37.225437 yards.
(20970, 142140, 1, -9281.43, -3085.82, 10.6941, 4.5204, 0, 0, -0.771625, 0.636078, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15865 at 126.149216 yards.
(20980, 142140, 1, -6948.93, -4308.28, 9.77953, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15877 at 34.231178 yards.
(21062, 142140, 1, -7936.81, -3902.71, 9.61212, 4.5204, 0, 0, -0.771625, 0.636078, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15886 at 55.376484 yards.
(21066, 142140, 1, -9282.16, -3002.91, 13.5028, 0.087266, 0, 0, 0.0436192, 0.999048, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 17304 at 66.349319 yards.
(21068, 142140, 1, -6986.26, -4400.95, 9.79876, 3.59538, 0, 0, -0.97437, 0.224951, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 17305 at 24.711452 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(20956, 1205, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Tanaris 32 objects total
(20957, 1205, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Tanaris 32 objects total
(32882, 1205, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Tanaris 32 objects total
(20958, 1205, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Tanaris 32 objects total
(20959, 1205, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Tanaris 32 objects total
(20960, 1205, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Tanaris 32 objects total
(20961, 1205, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Tanaris 32 objects total
(20962, 1205, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Tanaris 32 objects total
(20964, 1205, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Tanaris 32 objects total
(20965, 1205, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Tanaris 32 objects total
(20966, 1205, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Tanaris 32 objects total
(20967, 1205, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Tanaris 32 objects total
(20968, 1205, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Tanaris 32 objects total
(20970, 1205, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Tanaris 32 objects total
(20980, 1205, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Tanaris 32 objects total
(21062, 1205, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Tanaris 32 objects total
(21066, 1205, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Tanaris 32 objects total
(21068, 1205, 0, 'Purple Lotus', 0, 10); -- Purple Lotus in Tanaris 32 objects total

-- Missing Purple Lotus spawns in Dire Maul.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(50009, 142140, 1, -3823, 1222.52, 150.905, 2.70526, 0, 0, 0.976295, 0.216442, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 49973 at 261.047272 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(50009, 1324, 0, 'Purple Lotus', 0, 10); -- Purple Lotus in Feralas 15 objects total

-- Correct position of Silverleaf in Durotar (position is off by 0.000991821 yards).
UPDATE `gameobject` SET `position_x`=-255.429, `position_y`=-4707.5, `position_z`=34.3226, `orientation`=3.80482, `rotation0`=0, `rotation1`=0, `rotation2`=-0.945518, `rotation3`=0.325568 WHERE `guid`=1090;

-- Correct position of Silverleaf in Tirisfal Glades (position is off by 0.209378 yards).
UPDATE `gameobject` SET `position_x`=2470.09, `position_y`=1303.12, `position_z`=30.0153, `orientation`=4.4855, `rotation0`=0, `rotation1`=0, `rotation2`=-0.782608, `rotation3`=0.622515 WHERE `guid`=937;

-- Correct position of Silverleaf in Tirisfal Glades (position is off by 0.333986 yards).
UPDATE `gameobject` SET `position_x`=1982.06, `position_y`=765.514, `position_z`=40.4216, `orientation`=3.73501, `rotation0`=0, `rotation1`=0, `rotation2`=-0.956305, `rotation3`=0.292372 WHERE `guid`=933;

-- Correct position of Silverleaf in Mulgore (position is off by 3.86142 yards).
UPDATE `gameobject` SET `position_x`=-1916.6, `position_y`=-996.191, `position_z`=45.854, `orientation`=5.044, `rotation0`=0, `rotation1`=0, `rotation2`=-0.580703, `rotation3`=0.814116 WHERE `guid`=877;

-- Correct position of Silverleaf in Silverpine Forest (position is off by 0.731387 yards).
UPDATE `gameobject` SET `position_x`=1147.77, `position_y`=1535.59, `position_z`=34.6036, `orientation`=2.04204, `rotation0`=0, `rotation1`=0, `rotation2`=0.85264, `rotation3`=0.522499 WHERE `guid`=572;

-- Correct position of Silverleaf in Mulgore (position is off by 0.517582 yards).
UPDATE `gameobject` SET `position_x`=-2289.25, `position_y`=-942.965, `position_z`=-5.45185, `orientation`=0.925024, `rotation0`=0, `rotation1`=0, `rotation2`=0.446198, `rotation3`=0.894935 WHERE `guid`=766;

-- Correct position of Silverleaf in Silverpine Forest (position is off by 0.551449 yards).
UPDATE `gameobject` SET `position_x`=1175.17, `position_y`=1799.59, `position_z`=18.5994, `orientation`=5.91667, `rotation0`=0, `rotation1`=0, `rotation2`=-0.182235, `rotation3`=0.983255 WHERE `guid`=806;

-- Correct position of Silverleaf in Silverpine Forest (position is off by 0.0130997 yards).
UPDATE `gameobject` SET `position_x`=1431.94, `position_y`=826.901, `position_z`=51.8469, `orientation`=2.47837, `rotation0`=0, `rotation1`=0, `rotation2`=0.945518, `rotation3`=0.325568 WHERE `guid`=1241;

-- Correct position of Silverleaf in Silverpine Forest (position is off by 0.516273 yards).
UPDATE `gameobject` SET `position_x`=1032.04, `position_y`=1212.5, `position_z`=48.3156, `orientation`=2.86234, `rotation0`=0, `rotation1`=0, `rotation2`=0.990268, `rotation3`=0.139175 WHERE `guid`=1097;

-- Correct position of Silverleaf in Silverpine Forest (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=1256.75, `position_y`=1151.34, `position_z`=50.9408, `orientation`=0.226892, `rotation0`=0, `rotation1`=0, `rotation2`=0.113203, `rotation3`=0.993572 WHERE `guid`=515;

-- Correct position of Silverleaf in Tirisfal Glades (position is off by 0.97266 yards).
UPDATE `gameobject` SET `position_x`=1859.72, `position_y`=704.132, `position_z`=40.2275, `orientation`=4.27606, `rotation0`=0, `rotation1`=0, `rotation2`=-0.843391, `rotation3`=0.5373 WHERE `guid`=728;

-- Correct position of Silverleaf in Durotar (position is off by 0.771847 yards).
UPDATE `gameobject` SET `position_x`=385.542, `position_y`=-4081.23, `position_z`=32.0753, `orientation`=4.03171, `rotation0`=0, `rotation1`=0, `rotation2`=-0.902585, `rotation3`=0.430512 WHERE `guid`=799;

-- Correct position of Silverleaf in Silverpine Forest (position is off by 0.00839996 yards).
UPDATE `gameobject` SET `position_x`=1118.51, `position_y`=1147.29, `position_z`=45.1796, `orientation`=5.00909, `rotation0`=0, `rotation1`=0, `rotation2`=-0.594823, `rotation3`=0.803857 WHERE `guid`=679;

-- Correct position of Silverleaf in Silverpine Forest (position is off by 0.0130997 yards).
UPDATE `gameobject` SET `position_x`=1360.65, `position_y`=1053.08, `position_z`=53.7951, `orientation`=0.401425, `rotation0`=0, `rotation1`=0, `rotation2`=0.199368, `rotation3`=0.979925 WHERE `guid`=529;

-- Correct position of Silverleaf in Mulgore (position is off by 0.991998 yards).
UPDATE `gameobject` SET `position_x`=-1103.82, `position_y`=296.43, `position_z`=40.5381, `orientation`=3.31614, `rotation0`=0, `rotation1`=0, `rotation2`=-0.996194, `rotation3`=0.087165 WHERE `guid`=1247;

-- Correct position of Silverleaf in Mulgore (position is off by 0.79428 yards).
UPDATE `gameobject` SET `position_x`=-1737.25, `position_y`=66.6602, `position_z`=-2.04936, `orientation`=1.90241, `rotation0`=0, `rotation1`=0, `rotation2`=0.814116, `rotation3`=0.580703 WHERE `guid`=747;

-- Correct position of Silverleaf in Mulgore (position is off by 0.629218 yards).
UPDATE `gameobject` SET `position_x`=-1723.28, `position_y`=-707.532, `position_z`=-9.68622, `orientation`=5.68977, `rotation0`=0, `rotation1`=0, `rotation2`=-0.292372, `rotation3`=0.956305 WHERE `guid`=1027;

-- Correct position of Silverleaf in Mulgore (position is off by 1.17925 yards).
UPDATE `gameobject` SET `position_x`=-2679.12, `position_y`=-261.173, `position_z`=3.0219, `orientation`=4.41568, `rotation0`=0, `rotation1`=0, `rotation2`=-0.803857, `rotation3`=0.594823 WHERE `guid`=1201;

-- Correct position of Silverleaf in Durotar (position is off by 0.0010376 yards).
UPDATE `gameobject` SET `position_x`=654.603, `position_y`=-4906.94, `position_z`=25.1601, `orientation`=4.64258, `rotation0`=0, `rotation1`=0, `rotation2`=-0.731354, `rotation3`=0.681998 WHERE `guid`=10376;

-- Correct position of Silverleaf in Mulgore (position is off by 1.14342 yards).
UPDATE `gameobject` SET `position_x`=-1762.1, `position_y`=224.467, `position_z`=38.1832, `orientation`=3.99681, `rotation0`=0, `rotation1`=0, `rotation2`=-0.909961, `rotation3`=0.414694 WHERE `guid`=680;

-- Correct position of Silverleaf in Thunder Bluff (position is off by 0.000976563 yards).
UPDATE `gameobject` SET `position_x`=-940.064, `position_y`=15.0219, `position_z`=16.501, `orientation`=5.96903, `rotation0`=0, `rotation1`=0, `rotation2`=-0.156434, `rotation3`=0.987688 WHERE `guid`=18271;

-- Correct position of Silverleaf in Silverpine Forest (position is off by 0.772616 yards).
UPDATE `gameobject` SET `position_x`=1419, `position_y`=1039.6, `position_z`=53.4083, `orientation`=0.191985, `rotation0`=0, `rotation1`=0, `rotation2`=0.0958452, `rotation3`=0.995396 WHERE `guid`=845;

-- Correct position of Silverleaf in Darkshore (position is off by 0.879245 yards).
UPDATE `gameobject` SET `position_x`=4736.46, `position_y`=337.591, `position_z`=54.0177, `orientation`=5.58505, `rotation0`=0, `rotation1`=0, `rotation2`=-0.34202, `rotation3`=0.939693 WHERE `guid`=1192;

-- Correct position of Silverleaf in Darkshore (position is off by 0.99723 yards).
UPDATE `gameobject` SET `position_x`=4963.24, `position_y`=287.666, `position_z`=41.1007, `orientation`=2.91469, `rotation0`=0, `rotation1`=0, `rotation2`=0.993571, `rotation3`=0.113208 WHERE `guid`=692;

-- Correct position of Silverleaf in Mulgore (position is off by 0.954956 yards).
UPDATE `gameobject` SET `position_x`=-2314.51, `position_y`=63.8172, `position_z`=36.9905, `orientation`=0.90757, `rotation0`=0, `rotation1`=0, `rotation2`=0.438371, `rotation3`=0.898794 WHERE `guid`=600;

-- Correct position of Silverleaf in Tirisfal Glades (position is off by 0.703492 yards).
UPDATE `gameobject` SET `position_x`=2288.28, `position_y`=1253, `position_z`=38.1232, `orientation`=1.98967, `rotation0`=0, `rotation1`=0, `rotation2`=0.83867, `rotation3`=0.54464 WHERE `guid`=697;

-- Correct position of Silverleaf in Silverpine Forest (position is off by 0.573681 yards).
UPDATE `gameobject` SET `position_x`=1422.82, `position_y`=963.759, `position_z`=53.1783, `orientation`=4.04917, `rotation0`=0, `rotation1`=0, `rotation2`=-0.898793, `rotation3`=0.438373 WHERE `guid`=900;

-- Correct position of Silverleaf in Durotar (position is off by 0.0986892 yards).
UPDATE `gameobject` SET `position_x`=-496.945, `position_y`=-4685.08, `position_z`=38.0286, `orientation`=4.29351, `rotation0`=0, `rotation1`=0, `rotation2`=-0.83867, `rotation3`=0.54464 WHERE `guid`=931;

-- Correct position of Silverleaf in Durotar (position is off by 0.655067 yards).
UPDATE `gameobject` SET `position_x`=-334.918, `position_y`=-5162.35, `position_z`=20.7662, `orientation`=3.64774, `rotation0`=0, `rotation1`=0, `rotation2`=-0.968147, `rotation3`=0.250381 WHERE `guid`=1254;

-- Correct position of Silverleaf in Durotar (position is off by 1.80695 yards).
UPDATE `gameobject` SET `position_x`=20.9071, `position_y`=-4266.03, `position_z`=72.0731, `orientation`=6.26573, `rotation0`=0, `rotation1`=0, `rotation2`=-0.00872612, `rotation3`=0.999962 WHERE `guid`=1008;

-- Correct position of Silverleaf in Durotar (position is off by 0.926123 yards).
UPDATE `gameobject` SET `position_x`=64.931, `position_y`=-4331.12, `position_z`=61.7287, `orientation`=3.22886, `rotation0`=0, `rotation1`=0, `rotation2`=-0.999048, `rotation3`=0.0436193 WHERE `guid`=871;

-- Correct position of Silverleaf in Silverpine Forest (position is off by 0.369205 yards).
UPDATE `gameobject` SET `position_x`=1418.93, `position_y`=877.221, `position_z`=48.7309, `orientation`=6.12611, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0784588, `rotation3`=0.996917 WHERE `guid`=1242;

-- Correct position of Silverleaf in Silverpine Forest (position is off by 0.690998 yards).
UPDATE `gameobject` SET `position_x`=-619.528, `position_y`=819.823, `position_z`=106.308, `orientation`=0.733038, `rotation0`=0, `rotation1`=0, `rotation2`=0.358368, `rotation3`=0.93358 WHERE `guid`=1028;

-- Correct position of Silverleaf in Mulgore (position is off by 0.817011 yards).
UPDATE `gameobject` SET `position_x`=-1960.78, `position_y`=-61.7807, `position_z`=-2.10473, `orientation`=4.66003, `rotation0`=0, `rotation1`=0, `rotation2`=-0.725374, `rotation3`=0.688355 WHERE `guid`=517;

-- Correct position of Silverleaf in Loch Modan (position is off by 0.686753 yards).
UPDATE `gameobject` SET `position_x`=-4694.24, `position_y`=-2836.63, `position_z`=324.716, `orientation`=6.14356, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0697556, `rotation3`=0.997564 WHERE `guid`=1151;

-- Correct position of Silverleaf in Tirisfal Glades (position is off by 0.727043 yards).
UPDATE `gameobject` SET `position_x`=2667.91, `position_y`=323.909, `position_z`=30.3662, `orientation`=4.50295, `rotation0`=0, `rotation1`=0, `rotation2`=-0.777145, `rotation3`=0.629321 WHERE `guid`=981;

-- Correct position of Silverleaf in Tirisfal Glades (position is off by 0.624185 yards).
UPDATE `gameobject` SET `position_x`=2064.9, `position_y`=327.924, `position_z`=55.4736, `orientation`=0.925024, `rotation0`=0, `rotation1`=0, `rotation2`=0.446198, `rotation3`=0.894935 WHERE `guid`=1152;

-- Correct position of Silverleaf in Tirisfal Glades (position is off by 0.580626 yards).
UPDATE `gameobject` SET `position_x`=2065.34, `position_y`=840.386, `position_z`=36.0886, `orientation`=2.9845, `rotation0`=0, `rotation1`=0, `rotation2`=0.996917, `rotation3`=0.0784664 WHERE `guid`=508;

-- Correct position of Silverleaf in Durotar (position is off by 0.000200272 yards).
UPDATE `gameobject` SET `position_x`=1098.23, `position_y`=-4027, `position_z`=17.6118, `orientation`=5.2709, `rotation0`=0, `rotation1`=0, `rotation2`=-0.484809, `rotation3`=0.87462 WHERE `guid`=820;

-- Correct position of Silverleaf in Mulgore (position is off by 0.976092 yards).
UPDATE `gameobject` SET `position_x`=-2445.28, `position_y`=-1313.81, `position_z`=-6.53294, `orientation`=0.122173, `rotation0`=0, `rotation1`=0, `rotation2`=0.0610485, `rotation3`=0.998135 WHERE `guid`=1070;

-- Correct position of Silverleaf in Mulgore (position is off by 0.375882 yards).
UPDATE `gameobject` SET `position_x`=-2191.18, `position_y`=-1163.33, `position_z`=16.4954, `orientation`=4.11898, `rotation0`=0, `rotation1`=0, `rotation2`=-0.882947, `rotation3`=0.469473 WHERE `guid`=995;

-- Correct position of Silverleaf in Elwynn Forest (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-10004.4, `position_y`=-51.3555, `position_z`=30.7996, `orientation`=6.23083, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0261765, `rotation3`=0.999657 WHERE `guid`=914;

-- Correct position of Silverleaf in Westfall (position is off by 0.400436 yards).
UPDATE `gameobject` SET `position_x`=-9869.6, `position_y`=879.703, `position_z`=32.099, `orientation`=2.42601, `rotation0`=0, `rotation1`=0, `rotation2`=0.936672, `rotation3`=0.350207 WHERE `guid`=663;

-- Correct position of Silverleaf in Tirisfal Glades (position is off by 0.00014162 yards).
UPDATE `gameobject` SET `position_x`=2842.78, `position_y`=23.8513, `position_z`=26.0167, `orientation`=3.82227, `rotation0`=0, `rotation1`=0, `rotation2`=-0.942641, `rotation3`=0.333808 WHERE `guid`=832;

-- Correct position of Silverleaf in Tirisfal Glades (position is off by 0.523537 yards).
UPDATE `gameobject` SET `position_x`=2512.33, `position_y`=475.013, `position_z`=35.5981, `orientation`=3.45576, `rotation0`=0, `rotation1`=0, `rotation2`=-0.987688, `rotation3`=0.156436 WHERE `guid`=510;

-- Correct position of Silverleaf in Tirisfal Glades (position is off by 0.239271 yards).
UPDATE `gameobject` SET `position_x`=2171.74, `position_y`=577.105, `position_z`=44.4721, `orientation`=4.45059, `rotation0`=0, `rotation1`=0, `rotation2`=-0.793353, `rotation3`=0.608762 WHERE `guid`=1229;

-- Correct position of Silverleaf in Loch Modan (position is off by 0.470023 yards).
UPDATE `gameobject` SET `position_x`=-5280.93, `position_y`=-2846.44, `position_z`=345.207, `orientation`=5.09636, `rotation0`=0, `rotation1`=0, `rotation2`=-0.559193, `rotation3`=0.829038 WHERE `guid`=657;

-- Correct position of Silverleaf in Mulgore (position is off by 0.762694 yards).
UPDATE `gameobject` SET `position_x`=-946.635, `position_y`=-705.401, `position_z`=-34.1329, `orientation`=3.6652, `rotation0`=0, `rotation1`=0, `rotation2`=-0.965925, `rotation3`=0.258821 WHERE `guid`=702;

-- Correct position of Silverleaf in Loch Modan (position is off by 0.546649 yards).
UPDATE `gameobject` SET `position_x`=-5295.13, `position_y`=-2777.47, `position_z`=353.044, `orientation`=1.27409, `rotation0`=0, `rotation1`=0, `rotation2`=0.594822, `rotation3`=0.803857 WHERE `guid`=703;

-- Correct position of Silverleaf in Loch Modan (position is off by 0.847436 yards).
UPDATE `gameobject` SET `position_x`=-5846.57, `position_y`=-3094.73, `position_z`=326.49, `orientation`=0.139624, `rotation0`=0, `rotation1`=0, `rotation2`=0.0697556, `rotation3`=0.997564 WHERE `guid`=1238;

-- Correct position of Silverleaf in Durotar (position is off by 0.636294 yards).
UPDATE `gameobject` SET `position_x`=117.178, `position_y`=-4960.4, `position_z`=9.15625, `orientation`=2.02458, `rotation0`=0, `rotation1`=0, `rotation2`=0.848047, `rotation3`=0.529921 WHERE `guid`=1171;

-- Correct position of Silverleaf in Durotar (position is off by 1.04121 yards).
UPDATE `gameobject` SET `position_x`=776.61, `position_y`=-4406.04, `position_z`=18.8163, `orientation`=5.53269, `rotation0`=0, `rotation1`=0, `rotation2`=-0.366501, `rotation3`=0.930418 WHERE `guid`=568;

-- Correct position of Silverleaf in Loch Modan (position is off by 0.84427 yards).
UPDATE `gameobject` SET `position_x`=-5227.5, `position_y`=-2940.68, `position_z`=341.919, `orientation`=3.35105, `rotation0`=0, `rotation1`=0, `rotation2`=-0.994521, `rotation3`=0.104536 WHERE `guid`=1227;

-- Correct position of Silverleaf in Darkshore (position is off by 0.427608 yards).
UPDATE `gameobject` SET `position_x`=4454.55, `position_y`=468.077, `position_z`=50.9815, `orientation`=0.575957, `rotation0`=0, `rotation1`=0, `rotation2`=0.284015, `rotation3`=0.95882 WHERE `guid`=470;

-- Correct position of Silverleaf in Darkshore (position is off by 0.541111 yards).
UPDATE `gameobject` SET `position_x`=4645.45, `position_y`=196.456, `position_z`=61.7261, `orientation`=1.02974, `rotation0`=0, `rotation1`=0, `rotation2`=0.492423, `rotation3`=0.870356 WHERE `guid`=1001;

-- Correct position of Silverleaf in Darkshore (position is off by 0.606603 yards).
UPDATE `gameobject` SET `position_x`=6173.2, `position_y`=367.5, `position_z`=33.1542, `orientation`=1.72787, `rotation0`=0, `rotation1`=0, `rotation2`=0.760406, `rotation3`=0.649449 WHERE `guid`=460;

-- Correct position of Silverleaf in Darkshore (position is off by 0.874234 yards).
UPDATE `gameobject` SET `position_x`=7237.36, `position_y`=-783.805, `position_z`=26.6101, `orientation`=6.02139, `rotation0`=0, `rotation1`=0, `rotation2`=-0.130526, `rotation3`=0.991445 WHERE `guid`=459;

-- Correct position of Silverleaf in Darkshore (position is off by 0.98468 yards).
UPDATE `gameobject` SET `position_x`=6827.44, `position_y`=258.564, `position_z`=21.5101, `orientation`=2.46091, `rotation0`=0, `rotation1`=0, `rotation2`=0.942641, `rotation3`=0.333808 WHERE `guid`=941;

-- Correct position of Silverleaf in Darkshore (position is off by 1.22741 yards).
UPDATE `gameobject` SET `position_x`=6900.68, `position_y`=-474.778, `position_z`=45.4724, `orientation`=0.0523589, `rotation0`=0, `rotation1`=0, `rotation2`=0.0261765, `rotation3`=0.999657 WHERE `guid`=876;

-- Correct position of Silverleaf in Darkshore (position is off by 0.859083 yards).
UPDATE `gameobject` SET `position_x`=7028.67, `position_y`=-602.416, `position_z`=51.3293, `orientation`=6.07375, `rotation0`=0, `rotation1`=0, `rotation2`=-0.104528, `rotation3`=0.994522 WHERE `guid`=1047;

-- Correct position of Silverleaf in Darkshore (position is off by 1.03028 yards).
UPDATE `gameobject` SET `position_x`=7136.7, `position_y`=83.1474, `position_z`=15.0964, `orientation`=5.39307, `rotation0`=0, `rotation1`=0, `rotation2`=-0.430511, `rotation3`=0.902586 WHERE `guid`=501;

-- Correct position of Silverleaf in Darkshore (position is off by 1.01376 yards).
UPDATE `gameobject` SET `position_x`=6353.61, `position_y`=52.8557, `position_z`=33.4221, `orientation`=5.49779, `rotation0`=0, `rotation1`=0, `rotation2`=-0.382683, `rotation3`=0.92388 WHERE `guid`=690;

-- Correct position of Silverleaf in Tirisfal Glades (position is off by 0.863322 yards).
UPDATE `gameobject` SET `position_x`=2333.6, `position_y`=606.94, `position_z`=34.1543, `orientation`=0.401425, `rotation0`=0, `rotation1`=0, `rotation2`=0.199368, `rotation3`=0.979925 WHERE `guid`=1187;

-- Correct position of Silverleaf in Durotar (position is off by 0.925286 yards).
UPDATE `gameobject` SET `position_x`=295.779, `position_y`=-4322.27, `position_z`=33.3949, `orientation`=0.488691, `rotation0`=0, `rotation1`=0, `rotation2`=0.241921, `rotation3`=0.970296 WHERE `guid`=843;

-- Correct position of Silverleaf in Durotar (position is off by 1.63499 yards).
UPDATE `gameobject` SET `position_x`=10.699, `position_y`=-4619.18, `position_z`=44.091, `orientation`=5.48033, `rotation0`=0, `rotation1`=0, `rotation2`=-0.390731, `rotation3`=0.920505 WHERE `guid`=1137;

-- Correct position of Silverleaf in Elwynn Forest (position is off by 2.13122 yards).
UPDATE `gameobject` SET `position_x`=-9597.17, `position_y`=971.579, `position_z`=42.0809, `orientation`=2.23402, `rotation0`=0, `rotation1`=0, `rotation2`=0.898793, `rotation3`=0.438373 WHERE `guid`=934;

-- Correct position of Silverleaf in Mulgore (position is off by 1.57422 yards).
UPDATE `gameobject` SET `position_x`=-1700.42, `position_y`=-807.382, `position_z`=18.8665, `orientation`=0.558504, `rotation0`=0, `rotation1`=0, `rotation2`=0.275637, `rotation3`=0.961262 WHERE `guid`=774;

-- Correct position of Silverleaf in Mulgore (position is off by 0.108602 yards).
UPDATE `gameobject` SET `position_x`=-2475.99, `position_y`=-71.0842, `position_z`=-3.06786, `orientation`=2.07694, `rotation0`=0, `rotation1`=0, `rotation2`=0.861629, `rotation3`=0.507539 WHERE `guid`=583;

-- Correct position of Silverleaf in Westfall (position is off by 4.4419 yards).
UPDATE `gameobject` SET `position_x`=-10307.6, `position_y`=1344.26, `position_z`=40.4595, `orientation`=3.29869, `rotation0`=0, `rotation1`=0, `rotation2`=-0.996917, `rotation3`=0.0784664 WHERE `guid`=40000;

-- Missing Silverleaf spawns in Dun Morogh.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21085, 1617, 0, -5576.14, -1609.03, 394.671, 5.42797, 0, 0, -0.414693, 0.909961, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 10859 at 57.612289 yards.
(21086, 1617, 0, -5718.47, -1813.51, 399.721, 2.96704, 0, 0, 0.996194, 0.087165, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 10869 at 146.726547 yards.
(21088, 1617, 0, -5731.14, -394.698, 365.579, 1.41372, 0, 0, 0.649447, 0.760406, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 10664 at 32.405155 yards.
(21122, 1617, 0, -5866.94, -2051.82, 401.116, 4.08407, 0, 0, -0.891006, 0.453991, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 10890 at 123.950882 yards.
(21123, 1617, 0, -5301.05, 284.52, 392.798, 6.05629, 0, 0, -0.113203, 0.993572, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9968 at 137.189148 yards.
(29373, 1617, 0, -5693.27, -1248.39, 389.542, 1.53589, 0, 0, 0.694658, 0.71934, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 29315 at 81.966591 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(21085, 1018, 0, 'Silverleaf', 0, 10), -- Silverleafs in Dun Morogh 54 objects total
(21086, 1018, 0, 'Silverleaf', 0, 10), -- Silverleafs in Dun Morogh 54 objects total
(21088, 1018, 0, 'Silverleaf', 0, 10), -- Silverleafs in Dun Morogh 54 objects total
(21122, 1018, 0, 'Silverleaf', 0, 10), -- Silverleafs in Dun Morogh 54 objects total
(21123, 1018, 0, 'Silverleaf', 0, 10), -- Silverleafs in Dun Morogh 54 objects total
(29373, 1018, 0, 'Silverleaf', 0, 10); -- Silverleafs in Dun Morogh 54 objects total

-- Missing Silverleaf spawns in Elwynn Forest.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(32750, 1617, 0, -9308.64, -208.554, 68.0084, 0.59341, 0, 0, 0.292371, 0.956305, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 32747 at 107.626015 yards.
(27182, 1617, 0, -9785.19, -1567, 41.5241, 4.31097, 0, 0, -0.833885, 0.551938, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 27053 at 145.667404 yards.
(27183, 1617, 0, -9490.43, -740.377, 60.2324, 2.23402, 0, 0, 0.898793, 0.438373, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 26922 at 82.427750 yards.
(21108, 1617, 0, -9627.64, -1495.21, 58.7032, 5.72468, 0, 0, -0.275637, 0.961262, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1079 at 185.124878 yards.
(27184, 1617, 0, -9884.6, -1331.49, 33.1969, 0.872664, 0, 0, 0.422618, 0.906308, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 27008 at 94.970551 yards.
(27185, 1617, 0, -9711.49, -1322.18, 50.8747, 5.34071, 0, 0, -0.45399, 0.891007, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 27008 at 102.296165 yards.
(21134, 1617, 0, -9023.61, -1263.65, 76.5311, 5.70723, 0, 0, -0.284015, 0.95882, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1156 at 175.263947 yards.
(27186, 1617, 0, -9329.45, -801.189, 66.006, 4.67748, 0, 0, -0.719339, 0.694659, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 26968 at 114.081909 yards.
(21135, 1617, 0, -9644.08, 797.022, 33.5315, 0.314158, 0, 0, 0.156434, 0.987688, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1095 at 117.074821 yards.
(27187, 1617, 0, -9403.12, -919.279, 60.9487, 5.34071, 0, 0, -0.45399, 0.891007, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 26922 at 117.301491 yards.
(30796, 1617, 0, -9787, -297.477, 46.8726, 4.18879, 0, 0, -0.866025, 0.500001, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 30792 at 106.102470 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(32750, 1013, 0, 'Silverleaf', 0, 10), -- Silverleafs in Elwynn Forest 59 objects total
(27182, 1013, 0, 'Silverleaf', 0, 10), -- Silverleafs in Elwynn Forest 59 objects total
(27183, 1013, 0, 'Silverleaf', 0, 10), -- Silverleafs in Elwynn Forest 59 objects total
(21108, 1013, 0, 'Silverleaf', 0, 10), -- Silverleafs in Elwynn Forest 59 objects total
(27184, 1013, 0, 'Silverleaf', 0, 10), -- Silverleafs in Elwynn Forest 59 objects total
(27185, 1013, 0, 'Silverleaf', 0, 10), -- Silverleafs in Elwynn Forest 59 objects total
(21134, 1013, 0, 'Silverleaf', 0, 10), -- Silverleafs in Elwynn Forest 59 objects total
(27186, 1013, 0, 'Silverleaf', 0, 10), -- Silverleafs in Elwynn Forest 59 objects total
(21135, 1013, 0, 'Silverleaf', 0, 10), -- Silverleafs in Elwynn Forest 59 objects total
(27187, 1013, 0, 'Silverleaf', 0, 10), -- Silverleafs in Elwynn Forest 59 objects total
(30796, 1013, 0, 'Silverleaf', 0, 10); -- Silverleafs in Elwynn Forest 59 objects total

-- Missing Silverleaf spawns in Durotar.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21077, 1617, 1, -1118.7, -5156.81, 1.81445, 0.802851, 0, 0, 0.390731, 0.920505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 901 at 306.607178 yards.
(21078, 1617, 1, 716.88, -5005.57, 15.1452, 6.26573, 0, 0, -0.00872612, 0.999962, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 684 at 21.815493 yards.
(21079, 1617, 1, 1358.3, -4569.46, 37.8919, 5.96903, 0, 0, -0.156434, 0.987688, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 499 at 24.895634 yards.
(21080, 1617, 1, 1428.5, -4748.67, 30.0708, 2.87979, 0, 0, 0.991445, 0.130528, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 10264 at 81.882889 yards.
(21091, 1617, 1, 332.682, -4996.81, 19.5713, 0.0349062, 0, 0, 0.0174522, 0.999848, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 930 at 9.102805 yards.
(21092, 1617, 1, -293.877, -4903.56, 31.5329, 5.00909, 0, 0, -0.594823, 0.803857, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 917 at 78.251564 yards.
(21093, 1617, 1, -547.241, -4659.26, 40.4069, 0.471238, 0, 0, 0.233445, 0.97237, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 931 at 56.500393 yards.
(21097, 1617, 1, 1429.07, -4813.38, 24.6158, 3.76991, 0, 0, -0.951056, 0.309017, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 10264 at 144.957535 yards.
(21098, 1617, 1, -236.168, -5203.23, 20.0912, 5.46288, 0, 0, -0.398748, 0.91706, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1149 at 79.683121 yards.
(21099, 1617, 1, -1244.33, -5499.28, 5.33197, 1.53589, 0, 0, 0.694658, 0.71934, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 901 at 671.110046 yards.
(21100, 1617, 1, 92.4622, -4616.65, 49.7868, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1116 at 14.463705 yards.
(21101, 1617, 1, 1053.77, -4301.23, 17.4971, 1.27409, 0, 0, 0.594822, 0.803857, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 781 at 97.187973 yards.
(21102, 1617, 1, 1292.54, -4168.69, 27.7662, 0.226892, 0, 0, 0.113203, 0.993572, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 765 at 6.802528 yards.
(21112, 1617, 1, -513.956, -4869.19, 35.9926, 6.03884, 0, 0, -0.121869, 0.992546, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 942 at 21.299011 yards.
(21117, 1617, 1, -410.612, -4662.34, 42.3551, 4.60767, 0, 0, -0.743144, 0.669131, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 530 at 20.757658 yards.
(21124, 1617, 1, -62.4103, -5153.83, 9.28289, 0.820303, 0, 0, 0.398748, 0.91706, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1147 at 10.632731 yards.
(21125, 1617, 1, -168.535, -5166.67, 24.9761, 0, 0, 0, 0, 1, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1149 at 17.762146 yards.
(21133, 1617, 1, -665.786, -5000.42, 24.3445, 4.55531, 0, 0, -0.760406, 0.649449, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 662 at 76.252029 yards.
(21136, 1617, 1, -836.319, -5351.61, 3.8319, 4.25861, 0, 0, -0.848047, 0.529921, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 662 at 466.810669 yards.
(21140, 1617, 1, 859.838, -4397.94, 16.4134, 4.57276, 0, 0, -0.754709, 0.656059, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 568 at 83.560089 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(21077, 1022, 0, 'Silverleaf', 0, 10), -- Silverleafs in Durotar 137 objects total
(21078, 1022, 0, 'Silverleaf', 0, 10), -- Silverleafs in Durotar 137 objects total
(21079, 1022, 0, 'Silverleaf', 0, 10), -- Silverleafs in Durotar 137 objects total
(21080, 1022, 0, 'Silverleaf', 0, 10), -- Silverleafs in Durotar 137 objects total
(21091, 1022, 0, 'Silverleaf', 0, 10), -- Silverleafs in Durotar 137 objects total
(21092, 1022, 0, 'Silverleaf', 0, 10), -- Silverleafs in Durotar 137 objects total
(21093, 1022, 0, 'Silverleaf', 0, 10), -- Silverleafs in Durotar 137 objects total
(21097, 1022, 0, 'Silverleaf', 0, 10), -- Silverleafs in Durotar 137 objects total
(21098, 1022, 0, 'Silverleaf', 0, 10), -- Silverleafs in Durotar 137 objects total
(21099, 1022, 0, 'Silverleaf', 0, 10), -- Silverleafs in Durotar 137 objects total
(21100, 1022, 0, 'Silverleaf', 0, 10), -- Silverleafs in Durotar 137 objects total
(21101, 1022, 0, 'Silverleaf', 0, 10), -- Silverleafs in Durotar 137 objects total
(21102, 1022, 0, 'Silverleaf', 0, 10), -- Silverleafs in Durotar 137 objects total
(21112, 1022, 0, 'Silverleaf', 0, 10), -- Silverleafs in Durotar 137 objects total
(21117, 1022, 0, 'Silverleaf', 0, 10), -- Silverleafs in Durotar 137 objects total
(21124, 1022, 0, 'Silverleaf', 0, 10), -- Silverleafs in Durotar 137 objects total
(21125, 1022, 0, 'Silverleaf', 0, 10), -- Silverleafs in Durotar 137 objects total
(21133, 1022, 0, 'Silverleaf', 0, 10), -- Silverleafs in Durotar 137 objects total
(21136, 1022, 0, 'Silverleaf', 0, 10), -- Silverleafs in Durotar 137 objects total
(21140, 1022, 0, 'Silverleaf', 0, 10); -- Silverleafs in Durotar 137 objects total

-- Missing Silverleaf spawns in Loch Modan.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21082, 1617, 0, -4999.76, -2823.31, 323.514, 0.122173, 0, 0, 0.0610485, 0.998135, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 13228 at 70.059425 yards.
(21089, 1617, 0, -5882.55, -2513.38, 307.529, 5.55015, 0, 0, -0.358368, 0.93358, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12819 at 316.269836 yards.
(21105, 1617, 0, -4916.39, -2793.79, 327.134, 6.16101, 0, 0, -0.0610485, 0.998135, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1172 at 93.816795 yards.
(21107, 1617, 0, -5156.2, -2807.7, 333.533, 3.63029, 0, 0, -0.970295, 0.241925, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 13229 at 68.231674 yards.
(21121, 1617, 0, -5091.97, -2699.25, 340.265, 1.0472, 0, 0, 0.5, 0.866025, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 13228 at 85.791031 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(21082, 1162, 0, 'Silverleaf', 0, 10), -- Silverleafs in Loch Modan 77 objects total
(21089, 1162, 0, 'Silverleaf', 0, 10), -- Silverleafs in Loch Modan 77 objects total
(21105, 1162, 0, 'Silverleaf', 0, 10), -- Silverleafs in Loch Modan 77 objects total
(21107, 1162, 0, 'Silverleaf', 0, 10), -- Silverleafs in Loch Modan 77 objects total
(21121, 1162, 0, 'Silverleaf', 0, 10); -- Silverleafs in Loch Modan 77 objects total

-- Missing Silverleaf spawns in Westfall.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(34861, 1617, 0, -11255.3, 1155.87, 89.0312, 4.59022, 0, 0, -0.748956, 0.66262, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34855 at 181.452591 yards.
(34862, 1617, 0, -11288, 1559.09, 71.4569, 2.21657, 0, 0, 0.894934, 0.446199, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34855 at 246.495895 yards.
(31148, 1617, 0, -10995.4, 1965.8, 33.421, 1.0821, 0, 0, 0.515038, 0.857168, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 31055 at 175.359421 yards.
(31149, 1617, 0, -11215.1, 1846.08, 35.4977, 5.63741, 0, 0, -0.317305, 0.948324, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 31055 at 336.500275 yards.
(21143, 1617, 0, -11091.3, 996.767, 35.9869, 1.39626, 0, 0, 0.642787, 0.766045, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 1143 at 70.521759 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(34861, 1106, 0, 'Silverleaf', 0, 10), -- Silverleafs in Westfall 23 objects total
(34862, 1106, 0, 'Silverleaf', 0, 10), -- Silverleafs in Westfall 23 objects total
(31148, 1106, 0, 'Silverleaf', 0, 10), -- Silverleafs in Westfall 23 objects total
(31149, 1106, 0, 'Silverleaf', 0, 10), -- Silverleafs in Westfall 23 objects total
(21143, 1106, 0, 'Silverleaf', 0, 10); -- Silverleafs in Westfall 23 objects total

-- Missing Silverleaf spawns in Tirisfal Glades.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(46470, 1617, 0, 2461.71, 1509.31, 34.6506, 3.24635, 0, 0, -0.998629, 0.0523532, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45141 at 113.540657 yards.
(21113, 1617, 0, 2414.88, 311.561, 37.561, 5.70723, 0, 0, -0.284015, 0.95882, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 557 at 96.701813 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(46470, 1007, 0, 'Silverleaf', 0, 10), -- Silverleafs in Tirisfal 69 objects total
(21113, 1007, 0, 'Silverleaf', 0, 10); -- Silverleafs in Tirisfal 69 objects total

-- Missing Silverleaf spawns in Teldrassil.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21119, 1617, 1, 9996.68, 1737.04, 1332.69, 2.68781, 0, 0, 0.97437, 0.224951, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 11225 at 198.687820 yards.
(50111, 1617, 1, 10009.9, 765.828, 1335.19, 1.32645, 0, 0, 0.615661, 0.788011, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49648 at 177.616806 yards.
(50113, 1617, 1, 9984.57, 455.704, 1310.01, 2.46091, 0, 0, 0.942641, 0.333808, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49642 at 119.769836 yards.
(21126, 1617, 1, 9624.83, 1133.31, 1270.84, 4.67748, 0, 0, -0.719339, 0.694659, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 11573 at 146.649048 yards.
(21127, 1617, 1, 10025, 1116.06, 1327.89, 3.61284, 0, 0, -0.972369, 0.233448, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 11237 at 87.107132 yards.
(21128, 1617, 1, 10735.3, 1789.88, 1330.76, 1.3439, 0, 0, 0.622514, 0.782609, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 10992 at 228.085678 yards.
(49631, 1617, 1, 9879.13, 1741.48, 1327.47, 5.18363, 0, 0, -0.522498, 0.85264, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49629 at 161.857834 yards.
(21129, 1617, 1, 10978.3, 1656.53, 1277.51, 4.67748, 0, 0, -0.719339, 0.694659, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 10992 at 425.832550 yards.
(21130, 1617, 1, 10582.4, 1740.16, 1310.47, 2.84488, 0, 0, 0.989016, 0.147811, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 11217 at 157.345978 yards.
(49637, 1617, 1, 9207.54, 1722.69, 1321.77, 3.00195, 0, 0, 0.997563, 0.0697661, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49636 at 86.645348 yards.
(50114, 1617, 1, 9206.35, 1088.72, 1318.27, 2.75761, 0, 0, 0.981627, 0.190812, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 49639 at 126.154327 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(21119, 1003, 0, 'Silverleaf', 0, 10), -- Silverleafs in Teldrassil 44 objects total
(50111, 1003, 0, 'Silverleaf', 0, 10), -- Silverleafs in Teldrassil 44 objects total
(50113, 1003, 0, 'Silverleaf', 0, 10), -- Silverleafs in Teldrassil 44 objects total
(21126, 1003, 0, 'Silverleaf', 0, 10), -- Silverleafs in Teldrassil 44 objects total
(21127, 1003, 0, 'Silverleaf', 0, 10), -- Silverleafs in Teldrassil 44 objects total
(21128, 1003, 0, 'Silverleaf', 0, 10), -- Silverleafs in Teldrassil 44 objects total
(49631, 1003, 0, 'Silverleaf', 0, 10), -- Silverleafs in Teldrassil 44 objects total
(21129, 1003, 0, 'Silverleaf', 0, 10), -- Silverleafs in Teldrassil 44 objects total
(21130, 1003, 0, 'Silverleaf', 0, 10), -- Silverleafs in Teldrassil 44 objects total
(49637, 1003, 0, 'Silverleaf', 0, 10), -- Silverleafs in Teldrassil 44 objects total
(50114, 1003, 0, 'Silverleaf', 0, 10); -- Silverleafs in Teldrassil 44 objects total

-- Missing Silverleaf spawns in Darkshore.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21090, 1617, 1, 7353.12, 119.21, 12.8687, 4.46804, 0, 0, -0.788011, 0.615662, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 494 at 217.783707 yards.
(21131, 1617, 1, 5744.92, 242.318, 32.4345, 5.2709, 0, 0, -0.484809, 0.87462, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 552 at 142.141998 yards.
(48966, 1617, 1, 6892.05, 62.8029, 15.7584, 1.48353, 0, 0, 0.67559, 0.737278, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 48660 at 125.567932 yards.
(21132, 1617, 1, 7349.18, -656.249, 25.1487, 4.64258, 0, 0, -0.731354, 0.681998, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1224 at 91.133202 yards.
(21141, 1617, 1, 6470.91, -113.706, 37.2739, 6.02139, 0, 0, -0.130526, 0.991445, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 1264 at 83.758278 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(21090, 1095, 0, 'Silverleaf', 0, 10), -- Silverleafs in Darkshore 64 objects total
(21131, 1095, 0, 'Silverleaf', 0, 10), -- Silverleafs in Darkshore 64 objects total
(48966, 1095, 0, 'Silverleaf', 0, 10), -- Silverleafs in Darkshore 64 objects total
(21132, 1095, 0, 'Silverleaf', 0, 10), -- Silverleafs in Darkshore 64 objects total
(21141, 1095, 0, 'Silverleaf', 0, 10); -- Silverleafs in Darkshore 64 objects total

-- Missing Silverleaf spawns in Mulgore.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21081, 1617, 1, -2575.59, -1052.96, -4.58471, 5.11382, 0, 0, -0.551936, 0.833886, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 18277 at 161.231598 yards.
(21083, 1617, 1, -1521.66, 118.448, -2.23671, 3.45576, 0, 0, -0.987688, 0.156436, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 631 at 8.532516 yards.
(21084, 1617, 1, -2148.52, -995.82, 18.7485, 0.750491, 0, 0, 0.366501, 0.930418, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 598 at 38.555294 yards.
(21087, 1617, 1, -2179.04, 291.146, 112.207, 1.16937, 0, 0, 0.551936, 0.833886, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 10639 at 100.688095 yards.
(21094, 1617, 1, -2616.35, 133.657, 56.7859, 0.366518, 0, 0, 0.182235, 0.983255, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1123 at 174.715561 yards.
(21095, 1617, 1, -2609.36, -1414, 38.187, 2.61799, 0, 0, 0.965925, 0.258821, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1070 at 198.134064 yards.
(21096, 1617, 1, -1825.77, -366.275, -5.48723, 3.26377, 0, 0, -0.998135, 0.0610518, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 644 at 6.908090 yards.
(21103, 1617, 1, -2391.54, -1137.76, -4.32129, 2.28638, 0, 0, 0.909961, 0.414694, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 974 at 8.371986 yards.
(21104, 1617, 1, -2785.56, 172.342, 60.4716, 0.087266, 0, 0, 0.0436192, 0.999048, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 10291 at 79.504837 yards.
(21114, 1617, 1, -1886.51, -627.507, 1.29836, 0.523598, 0, 0, 0.258819, 0.965926, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 1027 at 182.598724 yards.
(21115, 1617, 1, -1952.61, -242.826, -5.01756, 0.802851, 0, 0, 0.390731, 0.920505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 830 at 107.973862 yards.
(21116, 1617, 1, -1507.26, -175.414, 35.0973, 0.90757, 0, 0, 0.438371, 0.898794, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 10278 at 135.129745 yards.
(21118, 1617, 1, -2911.91, 228.381, 76.5499, 0.977383, 0, 0, 0.469471, 0.882948, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 10291 at 99.337250 yards.
(21137, 1617, 1, -1299.66, -971.783, 15.8565, 3.38594, 0, 0, -0.992546, 0.12187, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 18463 at 103.304207 yards.
(21138, 1617, 1, -783.408, -737.337, -3.49329, 2.75761, 0, 0, 0.981627, 0.190812, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 702 at 168.560059 yards.
(21139, 1617, 1, -1664.08, 269.539, 35.6687, 0.104719, 0, 0, 0.0523357, 0.99863, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 680 at 108.479408 yards.
(21142, 1617, 1, -2725.36, 49.9506, 25.0484, 4.24115, 0, 0, -0.85264, 0.522499, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 10291 at 220.259689 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(21081, 1027, 0, 'Silverleaf', 0, 10), -- Silverleafs in Mulgore 73 objects total
(21083, 1027, 0, 'Silverleaf', 0, 10), -- Silverleafs in Mulgore 73 objects total
(21084, 1027, 0, 'Silverleaf', 0, 10), -- Silverleafs in Mulgore 73 objects total
(21087, 1027, 0, 'Silverleaf', 0, 10), -- Silverleafs in Mulgore 73 objects total
(21094, 1027, 0, 'Silverleaf', 0, 10), -- Silverleafs in Mulgore 73 objects total
(21095, 1027, 0, 'Silverleaf', 0, 10), -- Silverleafs in Mulgore 73 objects total
(21096, 1027, 0, 'Silverleaf', 0, 10), -- Silverleafs in Mulgore 73 objects total
(21103, 1027, 0, 'Silverleaf', 0, 10), -- Silverleafs in Mulgore 73 objects total
(21104, 1027, 0, 'Silverleaf', 0, 10), -- Silverleafs in Mulgore 73 objects total
(21114, 1027, 0, 'Silverleaf', 0, 10), -- Silverleafs in Mulgore 73 objects total
(21115, 1027, 0, 'Silverleaf', 0, 10), -- Silverleafs in Mulgore 73 objects total
(21116, 1027, 0, 'Silverleaf', 0, 10), -- Silverleafs in Mulgore 73 objects total
(21118, 1027, 0, 'Silverleaf', 0, 10), -- Silverleafs in Mulgore 73 objects total
(21137, 1027, 0, 'Silverleaf', 0, 10), -- Silverleafs in Mulgore 73 objects total
(21138, 1027, 0, 'Silverleaf', 0, 10), -- Silverleafs in Mulgore 73 objects total
(21139, 1027, 0, 'Silverleaf', 0, 10), -- Silverleafs in Mulgore 73 objects total
(21142, 1027, 0, 'Silverleaf', 0, 10); -- Silverleafs in Mulgore 73 objects total

-- Create new pool to hold Silverleaf spawns in The Barrens.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(425, 1, 'Silverleafs in The Barrens', 0, 10);

-- Missing Silverleaf spawns in The Barrens.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21144, 3725, 1, 246.02, -3153.48, 90.0559, 5.16618, 0, 0, -0.529919, 0.848048, 1800, 1800, 1, 100, 0, 10),
(21145, 3725, 1, 238.912, -2780.93, 91.7317, 3.59538, 0, 0, -0.97437, 0.224951, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 372.621613 yards.
(21146, 3725, 1, -427.637, -2486.69, 92.1472, 6.10865, 0, 0, -0.0871553, 0.996195, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 947.853943 yards.
(21147, 3725, 1, -1200.81, -2142.22, 92.2816, 0.0349062, 0, 0, 0.0174522, 0.999848, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 1765.210693 yards.
(21148, 3725, 1, -1165.9, -2065.73, 92.2977, 3.45576, 0, 0, -0.987688, 0.156436, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 1782.336426 yards.
(21149, 3725, 1, -1110.87, -2153.9, 80.6538, 3.33359, 0, 0, -0.995396, 0.0958512, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 1685.348389 yards.
(21150, 3725, 1, -143.622, -2582.51, 91.6667, 4.60767, 0, 0, -0.743144, 0.669131, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 691.252625 yards.
(21151, 3725, 1, 426.637, -2819.96, 91.6667, 1.29154, 0, 0, 0.601814, 0.798636, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 379.289703 yards.
(21152, 3725, 1, 17.3861, -2470.59, 91.6666, 1.55334, 0, 0, 0.700909, 0.713251, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 720.149048 yards.
(21153, 3725, 1, -464.562, -1585.96, 91.8128, 3.15906, 0, 0, -0.999962, 0.00873464, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 1721.060303 yards.
(21154, 3725, 1, -1032.97, -2624.85, 91.6771, 1.91986, 0, 0, 0.819152, 0.573577, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 1383.931885 yards.
(21155, 3725, 1, -678.948, -2453.02, 91.6667, 1.81514, 0, 0, 0.788011, 0.615662, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 1160.264038 yards.
(21156, 3725, 1, -475.922, -1968.03, 92.3905, 6.14356, 0, 0, -0.0697556, 0.997564, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 1387.983154 yards.
(21157, 3725, 1, 224.484, -3345.04, 46.9378, 5.2709, 0, 0, -0.484809, 0.87462, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 197.530334 yards.
(21159, 3725, 1, 129.599, -2920.54, 92.4678, 5.02655, 0, 0, -0.587785, 0.809017, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 260.424042 yards.
(21160, 3725, 1, -798.95, -2859.27, 91.6667, 0.471238, 0, 0, 0.233445, 0.97237, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 1085.598633 yards.
(21161, 3725, 1, 521.076, -3664.99, 27.5696, 3.7001, 0, 0, -0.961261, 0.27564, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 584.125671 yards.
(21162, 3725, 1, -1157.22, -2283.67, 90.7383, 4.92183, 0, 0, -0.62932, 0.777146, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 1650.955078 yards.
(21163, 3725, 1, -1022.05, -2285.38, 93.5404, 0.541051, 0, 0, 0.267238, 0.963631, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 1536.753418 yards.
(21164, 3725, 1, 549.91, -3523.52, 92.9409, 0.733038, 0, 0, 0.358368, 0.93358, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 478.839264 yards.
(21165, 3725, 1, -845.504, -2742.02, 91.6667, 0.314158, 0, 0, 0.156434, 0.987688, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 1166.501831 yards.
(21166, 3725, 1, -982.5, -2006.16, 86.159, 5.044, 0, 0, -0.580703, 0.814116, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 1680.958008 yards.
(21167, 3725, 1, 451.24, -3405.39, 91.6825, 0.925024, 0, 0, 0.446198, 0.894935, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 324.925354 yards.
(21168, 3725, 1, 772.649, -2588.7, 91.6667, 2.70526, 0, 0, 0.976295, 0.216442, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 772.215698 yards.
(21169, 3725, 1, 750.243, -2392.38, 91.6667, 2.61799, 0, 0, 0.965925, 0.258821, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 912.971436 yards.
(21170, 3725, 1, 76.1382, -1872.33, 95.6032, 6.17847, 0, 0, -0.0523357, 0.99863, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 1292.376099 yards.
(21171, 3725, 1, 170.062, -1536.42, 91.6666, 4.55531, 0, 0, -0.760406, 0.649449, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 1618.843628 yards.
(21172, 3725, 1, 751.623, -1312.63, 91.6746, 5.53269, 0, 0, -0.366501, 0.930418, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 1909.022095 yards.
(21173, 3725, 1, -223.251, -1997.05, 91.7414, 1.85005, 0, 0, 0.798635, 0.601815, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 1248.017700 yards.
(21174, 3725, 1, -232.117, -2393.37, 91.9164, 4.72984, 0, 0, -0.700909, 0.713251, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 897.989685 yards.
(21175, 3725, 1, 725.631, -1979.33, 92.0113, 1.50098, 0, 0, 0.681998, 0.731354, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 1268.329102 yards.
(21176, 3725, 1, -553.01, -2704.87, 91.6667, 0.314158, 0, 0, 0.156434, 0.987688, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 916.352783 yards.
(21177, 3725, 1, -479.275, -2085.67, 91.6667, 4.17134, 0, 0, -0.870356, 0.492424, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 1290.842285 yards.
(21178, 3725, 1, -834.518, -2246.41, 91.6667, 5.70723, 0, 0, -0.284015, 0.95882, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 1410.794434 yards.
(21179, 3725, 1, -27.4418, -2241.91, 91.6667, 0.191985, 0, 0, 0.0958452, 0.995396, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 951.705811 yards.
(21180, 3725, 1, -1277.7, -2944.47, 93.1849, 2.9845, 0, 0, 0.996917, 0.0784664, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 1537.991333 yards.
(21181, 3725, 1, 467.918, -3003.29, 92.3428, 0.0174525, 0, 0, 0.00872612, 0.999962, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 267.957001 yards.
(21182, 3725, 1, 536.47, -2433.42, 91.8578, 1.36136, 0, 0, 0.62932, 0.777146, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 776.434753 yards.
(21183, 3725, 1, 194.273, -2543.79, 91.6667, 4.46804, 0, 0, -0.788011, 0.615662, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 611.884094 yards.
(21184, 3725, 1, -1020, -2140.87, 82.2547, 4.81711, 0, 0, -0.66913, 0.743145, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 1621.186646 yards.
(21185, 3725, 1, -1093.16, -2022.67, 80.5565, 4.79966, 0, 0, -0.67559, 0.737278, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 1752.776245 yards.
(21186, 3725, 1, -1309.69, -2797.13, 93.3444, 4.90438, 0, 0, -0.636078, 0.771625, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 1596.004272 yards.
(21187, 3725, 1, -902.43, -2082.73, 84.204, 4.72984, 0, 0, -0.700909, 0.713251, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 1570.183716 yards.
(21188, 3725, 1, 103.502, -3434.79, 27.6558, 4.88692, 0, 0, -0.642787, 0.766045, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 321.466187 yards.
(21189, 3725, 1, -962.656, -2071.39, 81.3033, 4.97419, 0, 0, -0.608761, 0.793354, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 1622.311035 yards.
(21190, 3725, 1, -320.032, -2227.09, 96.3361, 1.39626, 0, 0, 0.642787, 0.766045, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 1085.657715 yards.
(21192, 3725, 1, 390.286, -1557.93, 91.8818, 3.29869, 0, 0, -0.996917, 0.0784664, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 1602.059814 yards.
(21193, 3725, 1, 234.616, -1970.9, 91.6667, 1.83259, 0, 0, 0.793353, 0.608762, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 1182.635986 yards.
(21194, 3725, 1, -1186.96, -3192.73, 91.8396, 5.00909, 0, 0, -0.594823, 0.803857, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 1433.518555 yards.
(21195, 3725, 1, -1170.25, -3005.16, 95.8755, 4.18879, 0, 0, -0.866025, 0.500001, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 1424.027222 yards.
(21196, 3725, 1, -1342.66, -3034.1, 93.1366, 5.13127, 0, 0, -0.544639, 0.838671, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 1593.161987 yards.
(21197, 3725, 1, 547.454, -1394.52, 93.6277, 0.628317, 0, 0, 0.309016, 0.951057, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21144 at 1784.605103 yards.
(21198, 3725, 1, -1095.52, -2264.12, 80.967, 3.56047, 0, 0, -0.978148, 0.207912, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 21144 at 1609.587891 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(21145, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21146, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21147, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21148, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21149, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21150, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21151, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21152, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21153, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21154, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21155, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21156, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21157, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21159, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21160, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21161, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21162, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21163, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21164, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21165, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21166, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21167, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21168, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21169, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21170, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21171, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21172, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21173, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21174, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21175, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21176, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21177, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21178, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21179, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21180, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21181, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21182, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21183, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21184, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21185, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21186, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21187, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21188, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21189, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21190, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21192, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21193, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21194, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21195, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21196, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21197, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21198, 425, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(21144, 425, 0, 'Silverleaf', 0, 10);
-- Correct position of Stranglekelp in Stranglethorn Vale (position is off by 1.08328 yards).
UPDATE `gameobject` SET `position_x`=-12697.7, `position_y`=53.7122, `position_z`=-22.1556, `orientation`=1.90241, `rotation0`=0, `rotation1`=0, `rotation2`=0.814116, `rotation3`=0.580703 WHERE `guid`=8431;

-- Correct position of Stranglekelp in Wetlands (position is off by 0.712894 yards).
UPDATE `gameobject` SET `position_x`=-3084.31, `position_y`=-886.973, `position_z`=-12.8226, `orientation`=0.436332, `rotation0`=0, `rotation1`=0, `rotation2`=0.216439, `rotation3`=0.976296 WHERE `guid`=8325;

-- Correct position of Stranglekelp in The Barrens (position is off by 0.0141559 yards).
UPDATE `gameobject` SET `position_x`=-1915.86, `position_y`=-3779.83, `position_z`=-4.68931, `orientation`=6.00393, `rotation0`=0, `rotation1`=0, `rotation2`=-0.139173, `rotation3`=0.990268 WHERE `guid`=7556;

-- Correct position of Stranglekelp in Hillsbrad Foothills (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-1169.76, `position_y`=-249.171, `position_z`=-33.6806, `orientation`=5.74214, `rotation0`=0, `rotation1`=0, `rotation2`=-0.267238, `rotation3`=0.963631 WHERE `guid`=7492;

-- Correct position of Stranglekelp in The Barrens (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-868.215, `position_y`=-3953.02, `position_z`=-30.572, `orientation`=3.6652, `rotation0`=0, `rotation1`=0, `rotation2`=-0.965925, `rotation3`=0.258821 WHERE `guid`=7559;

-- Correct position of Stranglekelp in The Hinterlands (position is off by 0.00100708 yards).
UPDATE `gameobject` SET `position_x`=-485.872, `position_y`=-4719.62, `position_z`=-29.8458, `orientation`=2.74016, `rotation0`=0, `rotation1`=0, `rotation2`=0.979924, `rotation3`=0.19937 WHERE `guid`=7456;

-- Correct position of Stranglekelp in Stranglethorn Vale (position is off by 0.418785 yards).
UPDATE `gameobject` SET `position_x`=-13691.3, `position_y`=767.772, `position_z`=-12.2924, `orientation`=2.33874, `rotation0`=0, `rotation1`=0, `rotation2`=0.920505, `rotation3`=0.390732 WHERE `guid`=8216;

-- Correct position of Stranglekelp in The Hinterlands (position is off by 0.0010376 yards).
UPDATE `gameobject` SET `position_x`=-785.382, `position_y`=-4656.31, `position_z`=-24.7362, `orientation`=5.044, `rotation0`=0, `rotation1`=0, `rotation2`=-0.580703, `rotation3`=0.814116 WHERE `guid`=7432;

-- Correct position of Stranglekelp in Stranglethorn Vale (position is off by 0.0996094 yards).
UPDATE `gameobject` SET `position_x`=-14065.4, `position_y`=473.215, `position_z`=-14.4825, `orientation`=0.244346, `rotation0`=0, `rotation1`=0, `rotation2`=0.121869, `rotation3`=0.992546 WHERE `guid`=7495;

-- Correct position of Stranglekelp in Wetlands (position is off by 0.000100136 yards).
UPDATE `gameobject` SET `position_x`=-3612.66, `position_y`=-620.549, `position_z`=-13.8344, `orientation`=0.471238, `rotation0`=0, `rotation1`=0, `rotation2`=0.233445, `rotation3`=0.97237 WHERE `guid`=7524;

-- Correct position of Stranglekelp in Stranglethorn Vale (position is off by 0.478352 yards).
UPDATE `gameobject` SET `position_x`=-13251.6, `position_y`=781.087, `position_z`=-8.26174, `orientation`=2.75761, `rotation0`=0, `rotation1`=0, `rotation2`=0.981627, `rotation3`=0.190812 WHERE `guid`=8521;

-- Correct position of Stranglekelp in Wetlands (position is off by 0.711357 yards).
UPDATE `gameobject` SET `position_x`=-2879.56, `position_y`=-1005.58, `position_z`=-13.1264, `orientation`=0.558504, `rotation0`=0, `rotation1`=0, `rotation2`=0.275637, `rotation3`=0.961262 WHERE `guid`=8301;

-- Missing Stranglekelp spawns in Swamp of Sorrows.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21444, 2045, 0, -10586.3, -4423.44, -11.0613, 1.44862, 0, 0, 0.66262, 0.748956, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8247 at 79.800163 yards.
(21445, 2045, 0, -10510.6, -4471.76, -19.2922, 4.10153, 0, 0, -0.887011, 0.461749, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8533 at 149.524689 yards.
(21457, 2045, 0, -9867.43, -4365.9, -7.51678, 6.05629, 0, 0, -0.113203, 0.993572, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8222 at 128.563934 yards.
(21458, 2045, 0, -10712.4, -4542.03, -23.088, 6.19592, 0, 0, -0.0436192, 0.999048, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8247 at 220.981323 yards.
(30647, 2045, 0, -10746.3, -4331.94, -9.1593, 1.0821, 0, 0, 0.515038, 0.857168, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 30645 at 110.836418 yards.
(21459, 2045, 0, -10164.5, -4482.67, -8.31791, 2.00713, 0, 0, 0.843391, 0.5373, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8222 at 254.829483 yards.
(30648, 2045, 0, -10819.2, -4388.06, -35.3, 3.9619, 0, 0, -0.91706, 0.39875, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 30645 at 124.656509 yards.
(21460, 2045, 0, -10311, -4486.28, -17.337, 3.89209, 0, 0, -0.930417, 0.366502, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 8533 at 308.746368 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(21444, 1317, 0, 'Stranglekelp', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(21445, 1317, 0, 'Stranglekelp', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(21457, 1317, 0, 'Stranglekelp', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(21458, 1317, 0, 'Stranglekelp', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(30647, 1317, 0, 'Stranglekelp', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(21459, 1317, 0, 'Stranglekelp', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(30648, 1317, 0, 'Stranglekelp', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(21460, 1317, 0, 'Stranglekelp', 0, 10); -- Liferoots in Swamp of Sorrows (1) 6 objects total

-- Missing Stranglekelp spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21211, 2045, 0, -3756.01, -1219.82, -30.9406, 6.14356, 0, 0, -0.0697556, 0.997564, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 14904 at 83.266365 yards.
(21212, 2045, 0, -3006.93, -887.282, -11.8492, 2.53072, 0, 0, 0.953716, 0.300708, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8580 at 42.887791 yards.
(21213, 2045, 0, -3572.37, -1056.1, -14.5718, 3.10665, 0, 0, 0.999847, 0.0174693, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 14904 at 168.397079 yards.
(21219, 2045, 0, -3946.65, -878.974, -13.3966, 2.44346, 0, 0, 0.939692, 0.34202, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15126 at 36.715595 yards.
(32148, 2045, 0, -4068.29, -772.081, -15.1726, 3.49067, 0, 0, -0.984807, 0.173652, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 32117 at 102.051796 yards.
(21354, 2045, 0, -3346.15, -641.562, -14.7581, 5.8294, 0, 0, -0.224951, 0.97437, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 14867 at 194.087692 yards.
(21355, 2045, 0, -3526.34, -678.785, -12.1328, 0.174532, 0, 0, 0.0871553, 0.996195, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7524 at 104.141418 yards.
(32455, 2045, 0, -2628.22, -1494.79, -10.4608, 3.4034, 0, 0, -0.991445, 0.130528, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 32173 at 43.298641 yards.
(32459, 2045, 0, -4040.65, -783.567, -13.2906, 0.122173, 0, 0, 0.0610485, 0.998135, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 32117 at 72.189728 yards.
(21364, 2045, 0, -2523.04, -1413.89, -34.7353, 4.7822, 0, 0, -0.681998, 0.731354, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 14652 at 70.597412 yards.
(21366, 2045, 0, -3514.47, -597.227, -17.3902, 0.610863, 0, 0, 0.300705, 0.953717, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7524 at 100.984283 yards.
(21367, 2045, 0, -3812.61, -585.994, -12.5451, 4.64258, 0, 0, -0.731354, 0.681998, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8593 at 96.249763 yards.
(21368, 2045, 0, -3877.74, -960.628, -14.7171, 5.16618, 0, 0, -0.529919, 0.848048, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8596 at 38.672527 yards.
(21371, 2045, 0, -3859.09, -992.411, -16.97, 6.17847, 0, 0, -0.0523357, 0.99863, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8596 at 68.635353 yards.
(32885, 2045, 0, -4089.89, -634.874, -12.8446, 6.0912, 0, 0, -0.0958452, 0.995396, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 32884 at 154.820419 yards.
(21374, 2045, 0, -2740.34, -1026.76, -13.8492, 3.08918, 0, 0, 0.999657, 0.0262016, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 14866 at 32.718155 yards.
(33171, 2045, 0, -3623, -1010.74, -32.052, 2.91469, 0, 0, 0.993571, 0.113208, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 33166 at 178.279388 yards.
(21383, 2045, 0, -2641.34, -1442.62, -12.4426, 0.244346, 0, 0, 0.121869, 0.992546, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 14652 at 54.413033 yards.
(21384, 2045, 0, -2824.33, -910.341, -12.6657, 1.81514, 0, 0, 0.788011, 0.615662, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 14964 at 55.362686 yards.
(21385, 2045, 0, -3499.15, -515.982, -24.5927, 6.10865, 0, 0, -0.0871553, 0.996195, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7524 at 154.707870 yards.
(21387, 2045, 0, -2539.89, -1574.41, -15.3704, 5.18363, 0, 0, -0.522498, 0.85264, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8584 at 42.152431 yards.
(21436, 2045, 0, -3746.37, -1147.42, -32.052, 6.17847, 0, 0, -0.0523357, 0.99863, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 14904 at 75.040161 yards.
(21437, 2045, 0, -3683.3, -1085.2, -45.1089, 4.50295, 0, 0, -0.777145, 0.629321, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 14904 at 102.357826 yards.
(33172, 2045, 0, -3800.95, -1161.6, -20.5933, 5.49779, 0, 0, -0.382683, 0.92388, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 33166 at 111.727348 yards.
(21438, 2045, 0, -3441.99, -784.958, -9.7096, 5.68977, 0, 0, -0.292372, 0.956305, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 14907 at 118.641022 yards.
(21439, 2045, 0, -3192.15, -886.947, -12.2207, 2.54818, 0, 0, 0.956305, 0.292372, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8587 at 8.155163 yards.
(21469, 2045, 0, -3317.57, -688.273, -11.7266, 5.86431, 0, 0, -0.207911, 0.978148, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 14867 at 139.376511 yards.
(21525, 2045, 0, -2716.56, -1138.35, -6.98731, 5.5676, 0, 0, -0.350207, 0.936672, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 14863 at 88.720428 yards.
(21527, 2045, 0, -2745.02, -1074.81, -10.3433, 5.88176, 0, 0, -0.199368, 0.979925, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 14863 at 43.174755 yards.
(21528, 2045, 0, -3657.56, -540.877, -17.6931, 6.19592, 0, 0, -0.0436192, 0.999048, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 8593 at 89.689430 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(21211, 1149, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Wetlands 41 objects total
(21212, 1149, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Wetlands 41 objects total
(21213, 1149, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Wetlands 41 objects total
(21219, 1149, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Wetlands 41 objects total
(32148, 1149, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Wetlands 41 objects total
(21354, 1149, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Wetlands 41 objects total
(21355, 1149, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Wetlands 41 objects total
(32455, 1149, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Wetlands 41 objects total
(32459, 1149, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Wetlands 41 objects total
(21364, 1149, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Wetlands 41 objects total
(21366, 1149, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Wetlands 41 objects total
(21367, 1149, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Wetlands 41 objects total
(21368, 1149, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Wetlands 41 objects total
(21371, 1149, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Wetlands 41 objects total
(32885, 1149, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Wetlands 41 objects total
(21374, 1149, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Wetlands 41 objects total
(33171, 1149, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Wetlands 41 objects total
(21383, 1149, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Wetlands 41 objects total
(21384, 1149, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Wetlands 41 objects total
(21385, 1149, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Wetlands 41 objects total
(21387, 1149, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Wetlands 41 objects total
(21436, 1149, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Wetlands 41 objects total
(21437, 1149, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Wetlands 41 objects total
(33172, 1149, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Wetlands 41 objects total
(21438, 1149, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Wetlands 41 objects total
(21439, 1149, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Wetlands 41 objects total
(21469, 1149, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Wetlands 41 objects total
(21525, 1149, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Wetlands 41 objects total
(21527, 1149, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Wetlands 41 objects total
(21528, 1149, 0, 'Stranglekelp', 0, 10); -- Stranglekelp in Wetlands 41 objects total

-- Missing Stranglekelp spawns in Dustwallow Marsh.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(56201, 2045, 1, -2972.05, -4273.76, -4.45722, 5.42797, 0, 0, -0.414693, 0.909961, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 55964 at 343.959015 yards.
(56202, 2045, 1, -2666.74, -4205.86, -0.785061, 4.83456, 0, 0, -0.66262, 0.748956, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 55964 at 50.416744 yards.
(21538, 2045, 1, -2499.76, -4033.33, -8.77919, 3.194, 0, 0, -0.999657, 0.0262016, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 11759 at 90.814751 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(56201, 43522, 0, 'Stranglekelp', 0, 10), -- Dustwallow Marsh: Stranglekelp
(56202, 43522, 0, 'Stranglekelp', 0, 10), -- Dustwallow Marsh: Stranglekelp
(21538, 43522, 0, 'Stranglekelp', 0, 10); -- Dustwallow Marsh: Stranglekelp

-- Missing Stranglekelp spawns in Azshara.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(48967, 2045, 1, 4036.03, -6188.35, -9.22396, 3.76991, 0, 0, -0.951056, 0.309017, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 48481 at 212.455063 yards.
(21362, 2045, 1, 4341.05, -6369.84, -20.2832, 2.25147, 0, 0, 0.902585, 0.430512, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8440 at 136.751526 yards.
(21363, 2045, 1, 4122.78, -6782.2, -14.0695, 1.53589, 0, 0, 0.694658, 0.71934, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8558 at 181.560272 yards.
(48968, 2045, 1, 3790.65, -6209.3, -14.8562, 5.60251, 0, 0, -0.333807, 0.942641, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 48481 at 287.887238 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(48967, 1321, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Azshara 12 objects total
(21362, 1321, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Azshara 12 objects total
(21363, 1321, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Azshara 12 objects total
(48968, 1321, 0, 'Stranglekelp', 0, 10); -- Stranglekelp in Azshara 12 objects total

-- Missing Stranglekelp spawns in The Barrens.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(29281, 2045, 1, -1120.27, -4148.3, -67.1948, 0.453785, 0, 0, 0.224951, 0.97437, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 29235 at 92.493027 yards.
(32509, 2045, 1, -1153.03, -4052.26, -79.2146, 5.88176, 0, 0, -0.199368, 0.979925, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 32508 at 93.242081 yards.
(32514, 2045, 1, -1197.13, -3962.99, -13.6481, 6.03884, 0, 0, -0.121869, 0.992546, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 32507 at 77.328217 yards.
(21214, 2045, 1, -1092.08, -3926.1, -66.4876, 5.20108, 0, 0, -0.515038, 0.857168, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15757 at 97.214317 yards.
(21215, 2045, 1, -1583.17, -3992.43, -4.22765, 3.21142, 0, 0, -0.999391, 0.0349061, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8459 at 26.446989 yards.
(21349, 2045, 1, -1283.71, -3921.82, -9.34849, 4.08407, 0, 0, -0.891006, 0.453991, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8281 at 32.044624 yards.
(21358, 2045, 1, -1024.96, -4009.38, -70.7427, 5.67232, 0, 0, -0.300705, 0.953717, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15757 at 94.761360 yards.
(21359, 2045, 1, -1873.83, -3822.75, -8.72529, 4.2237, 0, 0, -0.857167, 0.515038, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7564 at 58.070736 yards.
(21369, 2045, 1, -1795.62, -3822.57, -6.41776, 5.06146, 0, 0, -0.573576, 0.819152, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7564 at 53.090900 yards.
(21376, 2045, 1, -1402.41, -4051.17, -11.1311, 1.29154, 0, 0, 0.601814, 0.798636, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8288 at 36.194923 yards.
(21461, 2045, 1, -1094.5, -4025.29, -84.8971, 5.5676, 0, 0, -0.350207, 0.936672, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15757 at 146.183884 yards.
(21462, 2045, 1, -1163.32, -4213.38, -9.56546, 0.383971, 0, 0, 0.190808, 0.981627, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7567 at 69.862610 yards.
(32867, 2045, 1, -1777.78, -4268.3, -18.2424, 2.79252, 0, 0, 0.984807, 0.173652, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 32866 at 241.933960 yards.
(32868, 2045, 1, -1675.68, -4438.51, -15.0827, 3.85718, 0, 0, -0.936671, 0.35021, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 32866 at 376.072144 yards.
(21515, 2045, 1, -1016.73, -4092.58, -38.4459, 2.30383, 0, 0, 0.913545, 0.406738, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 8317 at 58.434086 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(29281, 1064, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Barrens 52 objects total
(32509, 1064, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Barrens 52 objects total
(32514, 1064, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Barrens 52 objects total
(21214, 1064, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Barrens 52 objects total
(21215, 1064, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Barrens 52 objects total
(21349, 1064, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Barrens 52 objects total
(21358, 1064, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Barrens 52 objects total
(21359, 1064, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Barrens 52 objects total
(21369, 1064, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Barrens 52 objects total
(21376, 1064, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Barrens 52 objects total
(21461, 1064, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Barrens 52 objects total
(21462, 1064, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Barrens 52 objects total
(32867, 1064, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Barrens 52 objects total
(32868, 1064, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Barrens 52 objects total
(21515, 1064, 0, 'Stranglekelp', 0, 10); -- Stranglekelp in Barrens 52 objects total

-- Missing Stranglekelp spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21200, 2045, 0, -12476.1, 573.471, -68.107, 0.95993, 0, 0, 0.461748, 0.887011, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7509 at 85.391960 yards.
(29582, 2045, 0, -13138.7, 535.828, -26.0268, 0.349065, 0, 0, 0.173648, 0.984808, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 29559 at 70.406883 yards.
(32848, 2045, 0, -13168.1, 712.903, -17.1304, 3.927, 0, 0, -0.923879, 0.382686, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 32844 at 101.795830 yards.
(32510, 2045, 0, -13897.6, 765.022, -21.7174, 4.34587, 0, 0, -0.824126, 0.566406, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 32504 at 151.461029 yards.
(32849, 2045, 0, -13431.5, 891.744, -14.6987, 5.16618, 0, 0, -0.529919, 0.848048, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 32846 at 35.252293 yards.
(21201, 2045, 0, -12221.4, 589.087, -54.8489, 4.32842, 0, 0, -0.829037, 0.559194, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 11684 at 141.298996 yards.
(21202, 2045, 0, -12513.9, 742.732, -48.4631, 2.67035, 0, 0, 0.972369, 0.233448, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7509 at 211.089493 yards.
(29282, 2045, 0, -12320.9, 438.169, -30.6961, 0.0698117, 0, 0, 0.0348988, 0.999391, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 29259 at 46.044819 yards.
(21203, 2045, 0, -13738.2, 843.827, -39.5209, 1.81514, 0, 0, 0.788011, 0.615662, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8216 at 93.646301 yards.
(21285, 2045, 0, -12700.3, 33.8601, -15.6602, 5.60251, 0, 0, -0.333807, 0.942641, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8431 at 21.865005 yards.
(21286, 2045, 0, -14685.5, 201.541, -18.1998, 4.03171, 0, 0, -0.902585, 0.430512, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8549 at 36.837673 yards.
(21287, 2045, 0, -14900, 248.184, -17.7765, 3.61284, 0, 0, -0.972369, 0.233448, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8510 at 36.239388 yards.
(21288, 2045, 0, -12617.1, 459.617, -57.7316, 1.39626, 0, 0, 0.642787, 0.766045, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7509 at 101.721725 yards.
(21289, 2045, 0, -14515.7, 859.142, -46.9045, 1.98967, 0, 0, 0.83867, 0.54464, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8292 at 362.398621 yards.
(21377, 2045, 0, -12416.9, 749.594, -35.9542, 1.72787, 0, 0, 0.760406, 0.649449, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 11684 at 168.034088 yards.
(21379, 2045, 0, -12503.6, 231.236, -11.8243, 0.645772, 0, 0, 0.317305, 0.948324, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7403 at 5.110490 yards.
(21380, 2045, 0, -13659.4, 694.493, -16.9346, 3.22886, 0, 0, -0.999048, 0.0436193, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8216 at 79.954338 yards.
(21452, 2045, 0, -12989.7, 714.903, -46.0731, 2.67035, 0, 0, 0.972369, 0.233448, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7504 at 152.347961 yards.
(21453, 2045, 0, -13824.5, 756.112, -20.9001, 1.36136, 0, 0, 0.62932, 0.777146, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8216 at 134.303452 yards.
(29586, 2045, 0, -12712.3, 199.339, -11.1717, 0.0174525, 0, 0, 0.00872612, 0.999962, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 29563 at 134.787033 yards.
(32088, 2045, 0, -12690.2, 481.88, -28.4652, 6.26573, 0, 0, -0.00872612, 0.999962, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 32086 at 133.275650 yards.
(30885, 2045, 0, -13901.9, 857.129, -53.6328, 4.92183, 0, 0, -0.62932, 0.777146, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 30883 at 171.253967 yards.
(21474, 2045, 0, -12383.1, 642.023, -63.2243, 0.366518, 0, 0, 0.182235, 0.983255, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 11684 at 154.876038 yards.
(21475, 2045, 0, -12476.5, 425.215, -21.1171, 4.53786, 0, 0, -0.766044, 0.642789, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8424 at 77.420425 yards.
(21512, 2045, 0, -13599.8, 498.125, -35.318, 1.71042, 0, 0, 0.754709, 0.656059, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7502 at 78.366684 yards.
(21516, 2045, 0, -11825.1, 1133.24, -32.5217, 3.10665, 0, 0, 0.999847, 0.0174693, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 11646 at 221.096985 yards.
(21519, 2045, 0, -12066.3, 726.439, -17.8329, 3.10665, 0, 0, 0.999847, 0.0174693, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 11817 at 160.337524 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(21200, 1171, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Stranglethorn 57 objects total
(29582, 1171, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Stranglethorn 57 objects total
(32848, 1171, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Stranglethorn 57 objects total
(32510, 1171, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Stranglethorn 57 objects total
(32849, 1171, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Stranglethorn 57 objects total
(21201, 1171, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Stranglethorn 57 objects total
(21202, 1171, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Stranglethorn 57 objects total
(29282, 1171, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Stranglethorn 57 objects total
(21203, 1171, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Stranglethorn 57 objects total
(21285, 1171, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Stranglethorn 57 objects total
(21286, 1171, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Stranglethorn 57 objects total
(21287, 1171, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Stranglethorn 57 objects total
(21288, 1171, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Stranglethorn 57 objects total
(21289, 1171, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Stranglethorn 57 objects total
(21377, 1171, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Stranglethorn 57 objects total
(21379, 1171, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Stranglethorn 57 objects total
(21380, 1171, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Stranglethorn 57 objects total
(21452, 1171, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Stranglethorn 57 objects total
(21453, 1171, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Stranglethorn 57 objects total
(29586, 1171, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Stranglethorn 57 objects total
(32088, 1171, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Stranglethorn 57 objects total
(30885, 1171, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Stranglethorn 57 objects total
(21474, 1171, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Stranglethorn 57 objects total
(21475, 1171, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Stranglethorn 57 objects total
(21512, 1171, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Stranglethorn 57 objects total
(21516, 1171, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Stranglethorn 57 objects total
(21519, 1171, 0, 'Stranglekelp', 0, 10); -- Stranglekelp in Stranglethorn 57 objects total

-- Missing Stranglekelp spawns in Alterac Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21204, 2045, 0, 1186.09, 48.5129, -8.37858, 0.0698117, 0, 0, 0.0348988, 0.999391, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7398 at 130.361496 yards.
(21205, 2045, 0, 1287.22, 124.78, -11.3707, 6.24828, 0, 0, -0.0174522, 0.999848, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7398 at 121.280708 yards.
(21514, 2045, 0, 1286.95, 225.642, -6.62013, 0.855211, 0, 0, 0.414693, 0.909961, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 7398 at 221.353989 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(21204, 999, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Alterac Mountains
(21205, 999, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Alterac Mountains
(21514, 999, 0, 'Stranglekelp', 0, 10); -- Stranglekelp in Alterac Mountains

-- Missing Stranglekelp spawns in Westfall.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21520, 2045, 0, -11453.1, 1813.91, -4.72884, 5.44543, 0, 0, -0.406736, 0.913546, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8600 at 400.922638 yards.
(21521, 2045, 0, -11421.5, 2014.61, -22.1962, 2.28638, 0, 0, 0.909961, 0.414694, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8600 at 290.198273 yards.
(21522, 2045, 0, -11127, 2091.78, -6.63062, 4.41568, 0, 0, -0.803857, 0.594823, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8600 at 34.703098 yards.
(21523, 2045, 0, -10800.7, 2136.42, -4.88381, 2.37364, 0, 0, 0.927183, 0.374608, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8602 at 112.078079 yards.
(21524, 2045, 0, -9548.87, 1189.46, -19.0537, 4.06662, 0, 0, -0.894934, 0.446199, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8607 at 75.625557 yards.
(31029, 2045, 0, -9852.55, 1853.62, -7.98479, 4.83456, 0, 0, -0.66262, 0.748956, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 31021 at 86.167038 yards.
(21532, 2045, 0, -10690.1, 2180.92, -9.37201, 4.13643, 0, 0, -0.878817, 0.47716, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8602 at 10.976427 yards.
(21533, 2045, 0, -10120.3, 2109.93, -18.539, 0.401425, 0, 0, 0.199368, 0.979925, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8605 at 46.370663 yards.
(21534, 2045, 0, -11083.7, 2150.16, -10.6211, 6.03884, 0, 0, -0.121869, 0.992546, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8601 at 26.857416 yards.
(21535, 2045, 0, -11264.9, 2037.54, -3.9782, 2.77507, 0, 0, 0.983254, 0.182238, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8600 at 131.336014 yards.
(21536, 2045, 0, -11425.1, 1873.62, -14.6076, 3.90954, 0, 0, -0.927183, 0.374608, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8600 at 343.851044 yards.
(21537, 2045, 0, -11513.3, 1688.23, -9.08386, 5.98648, 0, 0, -0.147809, 0.989016, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 8600 at 529.025146 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(21520, 1122, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Westfall 20 objects total
(21521, 1122, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Westfall 20 objects total
(21522, 1122, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Westfall 20 objects total
(21523, 1122, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Westfall 20 objects total
(21524, 1122, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Westfall 20 objects total
(31029, 1122, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Westfall 20 objects total
(21532, 1122, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Westfall 20 objects total
(21533, 1122, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Westfall 20 objects total
(21534, 1122, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Westfall 20 objects total
(21535, 1122, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Westfall 20 objects total
(21536, 1122, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Westfall 20 objects total
(21537, 1122, 0, 'Stranglekelp', 0, 10); -- Stranglekelp in Westfall 20 objects total

-- Missing Stranglekelp spawns in The Hinterlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21344, 2045, 0, 227.089, -4819.19, -19.5382, 6.03884, 0, 0, -0.121869, 0.992546, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7441 at 437.236755 yards.
(21378, 2045, 0, -599.362, -4761.99, -25.7426, 3.83973, 0, 0, -0.939692, 0.34202, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7456 at 121.211670 yards.
(21446, 2045, 0, -120.28, -4735.02, -24.48, 4.31097, 0, 0, -0.833885, 0.551938, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7441 at 80.335281 yards.
(21447, 2045, 0, -645.925, -4777.93, -8.68316, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7456 at 171.654297 yards.
(21448, 2045, 0, -366.355, -4749.6, -25.055, 3.71755, 0, 0, -0.958819, 0.284016, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7439 at 75.164299 yards.
(21449, 2045, 0, -442.294, -4808.89, -25.8227, 5.8294, 0, 0, -0.224951, 0.97437, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7456 at 99.419701 yards.
(21455, 2045, 0, 396.026, -4747.28, -9.89115, 4.83456, 0, 0, -0.66262, 0.748956, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7441 at 596.691040 yards.
(21456, 2045, 0, 12.7143, -4829.58, -17.039, 3.03684, 0, 0, 0.998629, 0.0523532, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7441 at 236.903091 yards.
(21466, 2045, 0, -501.541, -4655.18, -7.51504, 0.366518, 0, 0, 0.182235, 0.983255, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7456 at 69.976547 yards.
(21467, 2045, 0, 308.52, -4750.46, -11.8114, 4.38078, 0, 0, -0.814116, 0.580703, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7441 at 509.377838 yards.
(21468, 2045, 0, 365.045, -4815.13, -12.0386, 5.32326, 0, 0, -0.461748, 0.887011, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7441 at 572.272583 yards.
(21471, 2045, 0, 458.723, -4765.3, -8.45733, 1.11701, 0, 0, 0.529919, 0.848048, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7441 at 660.195435 yards.
(21472, 2045, 0, 512.802, -4788.54, -8.23382, 4.18879, 0, 0, -0.866025, 0.500001, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7441 at 715.825806 yards.
(21473, 2045, 0, -418.383, -4633, -10.4412, 2.1293, 0, 0, 0.874619, 0.48481, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7456 at 111.508804 yards.
(21476, 2045, 0, -216.165, -4848.26, -12.7663, 2.3911, 0, 0, 0.930417, 0.366502, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 7441 at 124.433311 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(21344, 1000, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in The Hinterlands
(21378, 1000, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in The Hinterlands
(21446, 1000, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in The Hinterlands
(21447, 1000, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in The Hinterlands
(21448, 1000, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in The Hinterlands
(21449, 1000, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in The Hinterlands
(21455, 1000, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in The Hinterlands
(21456, 1000, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in The Hinterlands
(21466, 1000, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in The Hinterlands
(21467, 1000, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in The Hinterlands
(21468, 1000, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in The Hinterlands
(21471, 1000, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in The Hinterlands
(21472, 1000, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in The Hinterlands
(21473, 1000, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in The Hinterlands
(21476, 1000, 0, 'Stranglekelp', 0, 10); -- Stranglekelp in The Hinterlands

-- Missing Stranglekelp spawns in Darkshore.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21357, 2045, 1, 6942.93, 514.999, -8.91144, 4.2237, 0, 0, -0.857167, 0.515038, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8427 at 64.594948 yards.
(21370, 2045, 1, 7161.86, 618.004, -15.1351, 5.60251, 0, 0, -0.333807, 0.942641, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8238 at 238.179916 yards.
(30220, 2045, 1, 6249.11, 786.109, -11.7111, 0.750491, 0, 0, 0.366501, 0.930418, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 30150 at 140.513062 yards.
(21372, 2045, 1, 7083.13, 548.048, -15.6958, 1.13446, 0, 0, 0.537299, 0.843392, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8427 at 171.549042 yards.
(21373, 2045, 1, 4719.94, 734.034, -4.43692, 5.3058, 0, 0, -0.469471, 0.882948, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8449 at 96.289696 yards.
(21375, 2045, 1, 5096.73, 635.616, -14.2902, 3.49067, 0, 0, -0.984807, 0.173652, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8434 at 53.219913 yards.
(32668, 2045, 1, 4812.9, 833.845, -7.73045, 3.61284, 0, 0, -0.972369, 0.233448, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 32666 at 63.983093 yards.
(21507, 2045, 1, 6862.82, 920.631, -42.4513, 0.506145, 0, 0, 0.25038, 0.968148, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8235 at 170.396820 yards.
(31347, 2045, 1, 5948.04, 879.9, -12.8162, 2.19911, 0, 0, 0.891006, 0.453991, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 31343 at 109.237846 yards.
(21529, 2045, 1, 7438.31, -385.302, -26.4597, 2.14675, 0, 0, 0.878817, 0.47716, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 8488 at 55.944138 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(21357, 1322, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Darkshore 95 objects total
(21370, 1322, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Darkshore 95 objects total
(30220, 1322, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Darkshore 95 objects total
(21372, 1322, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Darkshore 95 objects total
(21373, 1322, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Darkshore 95 objects total
(21375, 1322, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Darkshore 95 objects total
(32668, 1322, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Darkshore 95 objects total
(21507, 1322, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Darkshore 95 objects total
(31347, 1322, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Darkshore 95 objects total
(21529, 1322, 0, 'Stranglekelp', 0, 10); -- Stranglekelp in Darkshore 95 objects total

-- Missing Stranglekelp spawns in Hillsbrad Foothills.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21350, 2045, 0, -1324.2, -610.357, -42.902, 5.86431, 0, 0, -0.207911, 0.978148, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8342 at 48.070824 yards.
(21351, 2045, 0, -1486.25, -650.948, -43.182, 0.226892, 0, 0, 0.113203, 0.993572, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8342 at 119.785751 yards.
(21352, 2045, 0, -1441.68, -615.168, -45.177, 1.46608, 0, 0, 0.66913, 0.743145, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8342 at 69.680481 yards.
(21353, 2045, 0, -1545.85, -679.492, -47.4133, 3.45576, 0, 0, -0.987688, 0.156436, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8515 at 179.637939 yards.
(21365, 2045, 0, -1450.26, -715.607, -43.9909, 1.11701, 0, 0, 0.529919, 0.848048, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8515 at 103.898537 yards.
(21381, 2045, 0, -1105.3, -322.388, -6.03368, 3.9619, 0, 0, -0.91706, 0.39875, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8386 at 47.571247 yards.
(21382, 2045, 0, -1169.07, -134.153, -42.2045, 4.7473, 0, 0, -0.694658, 0.71934, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7411 at 86.161049 yards.
(21450, 2045, 0, -1189.61, -408.038, -38.8643, 1.5708, 0, 0, 0.707107, 0.707107, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7463 at 48.023033 yards.
(21463, 2045, 0, -1486.52, -950.694, -38.6237, 2.18166, 0, 0, 0.887011, 0.461749, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7405 at 71.928024 yards.
(21464, 2045, 0, -1153.4, -370.777, -36.5393, 4.88692, 0, 0, -0.642787, 0.766045, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8465 at 64.657562 yards.
(21465, 2045, 0, -1147.72, -619.204, -44.5639, 4.59022, 0, 0, -0.748956, 0.66262, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7478 at 74.415863 yards.
(35361, 2045, 0, -1323.75, -478.575, -48.8598, 3.94445, 0, 0, -0.920505, 0.390732, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 35351 at 76.253311 yards.
(21470, 2045, 0, -1248.61, -706.6, -43.3916, 4.13643, 0, 0, -0.878817, 0.47716, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7478 at 66.721306 yards.
(21517, 2045, 0, -1253.59, -844.229, -5.48905, 4.93928, 0, 0, -0.622514, 0.782609, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 7446 at 103.612633 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(21350, 1123, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Hillsbrad 24 objects total
(21351, 1123, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Hillsbrad 24 objects total
(21352, 1123, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Hillsbrad 24 objects total
(21353, 1123, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Hillsbrad 24 objects total
(21365, 1123, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Hillsbrad 24 objects total
(21381, 1123, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Hillsbrad 24 objects total
(21382, 1123, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Hillsbrad 24 objects total
(21450, 1123, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Hillsbrad 24 objects total
(21463, 1123, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Hillsbrad 24 objects total
(21464, 1123, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Hillsbrad 24 objects total
(21465, 1123, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Hillsbrad 24 objects total
(35361, 1123, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Hillsbrad 24 objects total
(21470, 1123, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Hillsbrad 24 objects total
(21517, 1123, 0, 'Stranglekelp', 0, 10); -- Stranglekelp in Hillsbrad 24 objects total

-- Missing Stranglekelp spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21199, 2045, 1, 2215.95, -3022.04, 102.682, 3.47321, 0, 0, -0.986285, 0.16505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8324 at 24.267727 yards.
(34204, 2045, 1, 3920.55, 1185.61, -46.4731, 2.14675, 0, 0, 0.878817, 0.47716, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34154 at 164.257141 yards.
(34205, 2045, 1, 4057.86, 1248.01, -28.0978, 0.733038, 0, 0, 0.358368, 0.93358, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34154 at 88.924225 yards.
(21441, 2045, 1, 3524.1, 1277.05, -67.2698, 4.10153, 0, 0, -0.887011, 0.461749, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8220 at 158.552658 yards.
(21442, 2045, 1, 3615.29, 974.759, -2.47424, 5.07891, 0, 0, -0.566406, 0.824126, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8351 at 21.350786 yards.
(21454, 2045, 1, 2159.15, -2863.49, 105.558, 0.715585, 0, 0, 0.350207, 0.936672, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8284 at 40.309937 yards.
(21477, 2045, 1, 2443.87, -2849.66, 137.224, 3.4383, 0, 0, -0.989016, 0.147811, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8354 at 60.972012 yards.
(21509, 2045, 1, 3734.52, 1031.99, -9.91627, 1.16937, 0, 0, 0.551936, 0.833886, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8538 at 49.925751 yards.
(21511, 2045, 1, 4008.57, 969.902, -4.52686, 1.13446, 0, 0, 0.537299, 0.843392, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8464 at 40.683868 yards.
(21513, 2045, 1, 3610.39, 897.874, -2.06501, 3.00195, 0, 0, 0.997563, 0.0697661, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8416 at 18.126047 yards.
(21518, 2045, 1, 2285.43, -2899.01, 123.223, 0.488691, 0, 0, 0.241921, 0.970296, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8221 at 33.197884 yards.
(21526, 2045, 1, 3673.9, 1086.99, -11.7448, 2.65289, 0, 0, 0.970295, 0.241925, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8262 at 44.975002 yards.
(21530, 2045, 1, 4075.7, 941.426, -1.48411, 1.6057, 0, 0, 0.719339, 0.694659, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8373 at 31.878792 yards.
(21531, 2045, 1, 3045, 551.364, -1.96567, 0.575957, 0, 0, 0.284015, 0.95882, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 8502 at 20.675341 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(21199, 1076, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Ashenvale 107 objects total
(34204, 1076, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Ashenvale 107 objects total
(34205, 1076, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Ashenvale 107 objects total
(21441, 1076, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Ashenvale 107 objects total
(21442, 1076, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Ashenvale 107 objects total
(21454, 1076, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Ashenvale 107 objects total
(21477, 1076, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Ashenvale 107 objects total
(21509, 1076, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Ashenvale 107 objects total
(21511, 1076, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Ashenvale 107 objects total
(21513, 1076, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Ashenvale 107 objects total
(21518, 1076, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Ashenvale 107 objects total
(21526, 1076, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Ashenvale 107 objects total
(21530, 1076, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Ashenvale 107 objects total
(21531, 1076, 0, 'Stranglekelp', 0, 10); -- Stranglekelp in Ashenvale 107 objects total

-- Missing Stranglekelp spawns in Feralas.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21345, 2045, 1, -4028.73, 3024.21, -2.06751, 0.541051, 0, 0, 0.267238, 0.963631, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8556 at 56.632378 yards.
(50399, 2045, 1, -4187.1, 2592.7, -7.59936, 0.209439, 0, 0, 0.104528, 0.994522, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 50235 at 161.742889 yards.
(21346, 2045, 1, -5044.58, 3049.64, -36.145, 5.21854, 0, 0, -0.507538, 0.861629, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8227 at 234.410477 yards.
(21347, 2045, 1, -5051.09, 3747.41, -13.16, 1.29154, 0, 0, 0.601814, 0.798636, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8453 at 76.609756 yards.
(21348, 2045, 1, -4760.31, 2385.35, -12.5588, 5.70723, 0, 0, -0.284015, 0.95882, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8540 at 65.596344 yards.
(21356, 2045, 1, -4854.1, 2430.44, -38.6081, 3.21142, 0, 0, -0.999391, 0.0349061, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8540 at 172.423706 yards.
(21440, 2045, 1, -4381.42, 2387.58, -14.8299, 3.15906, 0, 0, -0.999962, 0.00873464, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8264 at 89.061630 yards.
(21510, 2045, 1, -4084.1, 2883.71, -20.2978, 5.79449, 0, 0, -0.241921, 0.970296, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 8556 at 100.908386 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(21345, 1190, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Feralas 28 objects total
(50399, 1190, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Feralas 28 objects total
(21346, 1190, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Feralas 28 objects total
(21347, 1190, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Feralas 28 objects total
(21348, 1190, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Feralas 28 objects total
(21356, 1190, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Feralas 28 objects total
(21440, 1190, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Feralas 28 objects total
(21510, 1190, 0, 'Stranglekelp', 0, 10); -- Stranglekelp in Feralas 28 objects total

-- Missing Stranglekelp spawns in Desolace.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(29204, 2045, 1, -1991.5, 3390.62, -80.1426, 1.79769, 0, 0, 0.782608, 0.622515, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 29198 at 105.171959 yards.
(29205, 2045, 1, -1970.76, 3437.42, -45.2902, 5.60251, 0, 0, -0.333807, 0.942641, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 29200 at 110.552795 yards.
(29206, 2045, 1, -2078.35, 3315.42, -45.7561, 4.55531, 0, 0, -0.760406, 0.649449, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 29199 at 96.518951 yards.
(29218, 2045, 1, -1704.58, 3391.2, -70.1595, 0.0698117, 0, 0, 0.0348988, 0.999391, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 29200 at 166.688950 yards.
(21206, 2045, 1, -1507.02, 3259.03, -40.4532, 0.663223, 0, 0, 0.325567, 0.945519, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8404 at 180.466766 yards.
(21207, 2045, 1, -1104.8, 3202.93, -40.4406, 2.49582, 0, 0, 0.948323, 0.317306, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8404 at 577.310059 yards.
(21208, 2045, 1, -955.076, 3084.12, -22.0212, 0.488691, 0, 0, 0.241921, 0.970296, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8258 at 456.768738 yards.
(21209, 2045, 1, -594.512, 2750.96, -24.6668, 2.70526, 0, 0, 0.976295, 0.216442, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8258 at 61.187523 yards.
(29219, 2045, 1, -377.632, 2730.15, -23.145, 4.11898, 0, 0, -0.882947, 0.469473, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 29201 at 72.036011 yards.
(21210, 2045, 1, -213.363, 2652.13, -38.9283, 0.977383, 0, 0, 0.469471, 0.882948, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8557 at 138.776138 yards.
(29220, 2045, 1, 278.958, 2765.91, -24.0204, 5.88176, 0, 0, -0.199368, 0.979925, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 29202 at 376.156769 yards.
(29221, 2045, 1, -277.718, 2798.71, -10.3644, 5.28835, 0, 0, -0.477159, 0.878817, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 29201 at 142.256592 yards.
(29222, 2045, 1, -1750.7, 3341.58, -45.1189, 1.37881, 0, 0, 0.636078, 0.771625, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 29200 at 134.697083 yards.
(21360, 2045, 1, -1966.79, 3144.09, -13.1968, 3.29869, 0, 0, -0.996917, 0.0784664, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8257 at 40.649281 yards.
(29223, 2045, 1, -1899.93, 3232.72, -43.6753, 4.32842, 0, 0, -0.829037, 0.559194, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 29198 at 87.041748 yards.
(21361, 2045, 1, -1887.67, 3160.65, -33.8379, 1.13446, 0, 0, 0.537299, 0.843392, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 8503 at 100.921005 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(29204, 1145, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Desolace 24 objects total
(29205, 1145, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Desolace 24 objects total
(29206, 1145, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Desolace 24 objects total
(29218, 1145, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Desolace 24 objects total
(21206, 1145, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Desolace 24 objects total
(21207, 1145, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Desolace 24 objects total
(21208, 1145, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Desolace 24 objects total
(21209, 1145, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Desolace 24 objects total
(29219, 1145, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Desolace 24 objects total
(21210, 1145, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Desolace 24 objects total
(29220, 1145, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Desolace 24 objects total
(29221, 1145, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Desolace 24 objects total
(29222, 1145, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Desolace 24 objects total
(21360, 1145, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Desolace 24 objects total
(29223, 1145, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Desolace 24 objects total
(21361, 1145, 0, 'Stranglekelp', 0, 10); -- Stranglekelp in Desolace 24 objects total

-- Correct position of Sungrass in Feralas (position is off by 0.865954 yards).
UPDATE `gameobject` SET `position_x`=-4714.79, `position_y`=1417.73, `position_z`=88.0768, `orientation`=3.3685, `rotation0`=0, `rotation1`=0, `rotation2`=-0.993571, `rotation3`=0.113208 WHERE `guid`=16270;

-- Correct position of Sungrass in Un'Goro Crater (position is off by 1.2367 yards).
UPDATE `gameobject` SET `position_x`=-7319.12, `position_y`=-1725.39, `position_z`=-271.619, `orientation`=0.366518, `rotation0`=0, `rotation1`=0, `rotation2`=0.182235, `rotation3`=0.983255 WHERE `guid`=16251;

-- Correct position of Sungrass in The Hinterlands (position is off by 0.64673 yards).
UPDATE `gameobject` SET `position_x`=95.6914, `position_y`=-2746.62, `position_z`=113.091, `orientation`=0.226892, `rotation0`=0, `rotation1`=0, `rotation2`=0.113203, `rotation3`=0.993572 WHERE `guid`=16279;

-- Correct position of Sungrass in Azshara (position is off by 0.628212 yards).
UPDATE `gameobject` SET `position_x`=3291.8, `position_y`=-4433.6, `position_z`=103.945, `orientation`=5.32326, `rotation0`=0, `rotation1`=0, `rotation2`=-0.461748, `rotation3`=0.887011 WHERE `guid`=16051;

-- Correct position of Sungrass in Burning Steppes (position is off by 1.79473 yards).
UPDATE `gameobject` SET `position_x`=-8040.43, `position_y`=-2923.46, `position_z`=133.134, `orientation`=4.67748, `rotation0`=0, `rotation1`=0, `rotation2`=-0.719339, `rotation3`=0.694659 WHERE `guid`=39958;

-- Correct position of Sungrass in Western Plaguelands (position is off by 0.472044 yards).
UPDATE `gameobject` SET `position_x`=1601.56, `position_y`=-1701.4, `position_z`=61.4415, `orientation`=3.194, `rotation0`=0, `rotation1`=0, `rotation2`=-0.999657, `rotation3`=0.0262016 WHERE `guid`=16233;

-- Correct position of Sungrass in Burning Steppes (position is off by 2.64882 yards).
UPDATE `gameobject` SET `position_x`=-7708.73, `position_y`=-2013.39, `position_z`=133.439, `orientation`=5.41052, `rotation0`=0, `rotation1`=0, `rotation2`=-0.422618, `rotation3`=0.906308 WHERE `guid`=39957;

-- Correct position of Sungrass in Burning Steppes (position is off by 0.557792 yards).
UPDATE `gameobject` SET `position_x`=-7905.47, `position_y`=-2443.7, `position_z`=133.659, `orientation`=5.77704, `rotation0`=0, `rotation1`=0, `rotation2`=-0.25038, `rotation3`=0.968148 WHERE `guid`=16106;

-- Correct position of Sungrass in Un'Goro Crater (position is off by 1.01779 yards).
UPDATE `gameobject` SET `position_x`=-7244.39, `position_y`=-948.767, `position_z`=-270.725, `orientation`=2.00713, `rotation0`=0, `rotation1`=0, `rotation2`=0.843391, `rotation3`=0.5373 WHERE `guid`=16188;

-- Correct position of Sungrass in Un'Goro Crater (position is off by 0.765831 yards).
UPDATE `gameobject` SET `position_x`=-7538.47, `position_y`=-974.738, `position_z`=-269.487, `orientation`=2.56563, `rotation0`=0, `rotation1`=0, `rotation2`=0.958819, `rotation3`=0.284016 WHERE `guid`=16266;

-- Correct position of Sungrass in The Hinterlands (position is off by 0.139838 yards).
UPDATE `gameobject` SET `position_x`=410.458, `position_y`=-3654.1, `position_z`=122.935, `orientation`=1.01229, `rotation0`=0, `rotation1`=0, `rotation2`=0.484809, `rotation3`=0.87462 WHERE `guid`=16116;

-- Correct position of Sungrass in Eastern Plaguelands (position is off by 0.000991821 yards).
UPDATE `gameobject` SET `position_x`=1631.8, `position_y`=-4090.24, `position_z`=151.422, `orientation`=6.14356, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0697556, `rotation3`=0.997564 WHERE `guid`=13687;

-- Correct position of Sungrass in Burning Steppes (position is off by 1.13192 yards).
UPDATE `gameobject` SET `position_x`=-7877.66, `position_y`=-2894.94, `position_z`=133.865, `orientation`=1.44862, `rotation0`=0, `rotation1`=0, `rotation2`=0.66262, `rotation3`=0.748956 WHERE `guid`=16052;

-- Correct position of Sungrass in The Hinterlands (position is off by 1.18779 yards).
UPDATE `gameobject` SET `position_x`=209.117, `position_y`=-3841.06, `position_z`=138.017, `orientation`=4.45059, `rotation0`=0, `rotation1`=0, `rotation2`=-0.793353, `rotation3`=0.608762 WHERE `guid`=16121;

-- Correct position of Sungrass in The Hinterlands (position is off by 0.788417 yards).
UPDATE `gameobject` SET `position_x`=-213.704, `position_y`=-2716.72, `position_z`=118.101, `orientation`=3.26377, `rotation0`=0, `rotation1`=0, `rotation2`=-0.998135, `rotation3`=0.0610518 WHERE `guid`=16235;

-- Correct position of Sungrass in The Hinterlands (position is off by 0.595842 yards).
UPDATE `gameobject` SET `position_x`=26.8899, `position_y`=-2417.52, `position_z`=126.043, `orientation`=3.17653, `rotation0`=0, `rotation1`=0, `rotation2`=-0.999847, `rotation3`=0.0174693 WHERE `guid`=16276;

-- Correct position of Sungrass in The Hinterlands (position is off by 0.143511 yards).
UPDATE `gameobject` SET `position_x`=66.809, `position_y`=-3028.1, `position_z`=133.7, `orientation`=0.279252, `rotation0`=0, `rotation1`=0, `rotation2`=0.139173, `rotation3`=0.990268 WHERE `guid`=16049;

-- Correct position of Sungrass in The Hinterlands (position is off by 0.00100708 yards).
UPDATE `gameobject` SET `position_x`=150.503, `position_y`=-3022.87, `position_z`=128.218, `orientation`=1.53589, `rotation0`=0, `rotation1`=0, `rotation2`=0.694658, `rotation3`=0.71934 WHERE `guid`=16213;

-- Correct position of Sungrass in Western Plaguelands (position is off by 0.2196 yards).
UPDATE `gameobject` SET `position_x`=1866.11, `position_y`=-1349.8, `position_z`=61.0008, `orientation`=4.50295, `rotation0`=0, `rotation1`=0, `rotation2`=-0.777145, `rotation3`=0.629321 WHERE `guid`=16236;

-- Correct position of Sungrass in Blasted Lands (position is off by 0.978558 yards).
UPDATE `gameobject` SET `position_x`=-11117.9, `position_y`=-2746.65, `position_z`=15.9751, `orientation`=4.83456, `rotation0`=0, `rotation1`=0, `rotation2`=-0.66262, `rotation3`=0.748956 WHERE `guid`=16094;

-- Correct position of Sungrass in Blasted Lands (position is off by 1.5704 yards).
UPDATE `gameobject` SET `position_x`=-11318.4, `position_y`=-3361.68, `position_z`=7.85883, `orientation`=1.81514, `rotation0`=0, `rotation1`=0, `rotation2`=0.788011, `rotation3`=0.615662 WHERE `guid`=39996;

-- Correct position of Sungrass in Blasted Lands (position is off by 0.866322 yards).
UPDATE `gameobject` SET `position_x`=-11255.7, `position_y`=-3121.49, `position_z`=2.52145, `orientation`=4.04917, `rotation0`=0, `rotation1`=0, `rotation2`=-0.898793, `rotation3`=0.438373 WHERE `guid`=16228;

-- Correct position of Sungrass in The Hinterlands (position is off by 0.333605 yards).
UPDATE `gameobject` SET `position_x`=214.263, `position_y`=-3954.11, `position_z`=126.244, `orientation`=6.02139, `rotation0`=0, `rotation1`=0, `rotation2`=-0.130526, `rotation3`=0.991445 WHERE `guid`=16144;

-- Correct position of Sungrass in Feralas (position is off by 1.0113 yards).
UPDATE `gameobject` SET `position_x`=-4657.48, `position_y`=1604.65, `position_z`=115.776, `orientation`=4.27606, `rotation0`=0, `rotation1`=0, `rotation2`=-0.843391, `rotation3`=0.5373 WHERE `guid`=16067;

-- Correct position of Sungrass in The Hinterlands (position is off by 1.10482 yards).
UPDATE `gameobject` SET `position_x`=59.1708, `position_y`=-3926.92, `position_z`=143.609, `orientation`=6.0912, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0958452, `rotation3`=0.995396 WHERE `guid`=16158;

-- Correct position of Sungrass in The Hinterlands (position is off by 1.3919 yards).
UPDATE `gameobject` SET `position_x`=117.788, `position_y`=-2423.14, `position_z`=123.836, `orientation`=1.67551, `rotation0`=0, `rotation1`=0, `rotation2`=0.743144, `rotation3`=0.669131 WHERE `guid`=16117;

-- Correct position of Sungrass in Azshara (position is off by 4.30736 yards).
UPDATE `gameobject` SET `position_x`=2952.15, `position_y`=-4158.74, `position_z`=99.8019, `orientation`=3.61284, `rotation0`=0, `rotation1`=0, `rotation2`=-0.972369, `rotation3`=0.233448 WHERE `guid`=39938;

-- Correct position of Sungrass in Blasted Lands (position is off by 0.850277 yards).
UPDATE `gameobject` SET `position_x`=-11418.3, `position_y`=-2960.52, `position_z`=1.67087, `orientation`=3.90954, `rotation0`=0, `rotation1`=0, `rotation2`=-0.927183, `rotation3`=0.374608 WHERE `guid`=16030;

-- Correct position of Sungrass in Un'Goro Crater (position is off by 0.759091 yards).
UPDATE `gameobject` SET `position_x`=-6415.11, `position_y`=-1590.72, `position_z`=-270.786, `orientation`=5.72468, `rotation0`=0, `rotation1`=0, `rotation2`=-0.275637, `rotation3`=0.961262 WHERE `guid`=16286;

-- Correct position of Sungrass in Un'Goro Crater (position is off by 0.734737 yards).
UPDATE `gameobject` SET `position_x`=-6650.59, `position_y`=-1211.38, `position_z`=-272.218, `orientation`=5.88176, `rotation0`=0, `rotation1`=0, `rotation2`=-0.199368, `rotation3`=0.979925 WHERE `guid`=16181;

-- Correct position of Sungrass in Burning Steppes (position is off by 1.17238 yards).
UPDATE `gameobject` SET `position_x`=-8046.81, `position_y`=-2482.85, `position_z`=132.768, `orientation`=5.37562, `rotation0`=0, `rotation1`=0, `rotation2`=-0.438371, `rotation3`=0.898794 WHERE `guid`=16227;

-- Correct position of Sungrass in The Hinterlands (position is off by 1.53539 yards).
UPDATE `gameobject` SET `position_x`=-250.096, `position_y`=-3246.21, `position_z`=123.919, `orientation`=1.67551, `rotation0`=0, `rotation1`=0, `rotation2`=0.743144, `rotation3`=0.669131 WHERE `guid`=16269;

-- Correct position of Sungrass in Blasted Lands (position is off by 0.270359 yards).
UPDATE `gameobject` SET `position_x`=-11356, `position_y`=-2755.73, `position_z`=7.42946, `orientation`=2.65289, `rotation0`=0, `rotation1`=0, `rotation2`=0.970295, `rotation3`=0.241925 WHERE `guid`=16153;

-- Correct position of Sungrass in Azshara (position is off by 3.71135 yards).
UPDATE `gameobject` SET `position_x`=3282.92, `position_y`=-4192.48, `position_z`=106.894, `orientation`=5.49779, `rotation0`=0, `rotation1`=0, `rotation2`=-0.382683, `rotation3`=0.92388 WHERE `guid`=39940;

-- Correct position of Sungrass in Un'Goro Crater (position is off by 1.92522 yards).
UPDATE `gameobject` SET `position_x`=-7815.27, `position_y`=-1183.7, `position_z`=-261.473, `orientation`=1.16937, `rotation0`=0, `rotation1`=0, `rotation2`=0.551936, `rotation3`=0.833886 WHERE `guid`=16090;

-- Missing Sungrass spawns in Blasted Lands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(32460, 142142, 0, -11582.6, -3341.9, 8.51584, 6.00393, 0, 0, -0.139173, 0.990268, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 32103 at 101.146843 yards.
(21566, 142142, 0, -11843.8, -3027.06, 15.8717, 5.86431, 0, 0, -0.207911, 0.978148, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16261 at 38.587429 yards.
(21581, 142142, 0, -11014, -2816.37, 6.90334, 3.90954, 0, 0, -0.927183, 0.374608, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16080 at 13.080610 yards.
(21582, 142142, 0, -11344.7, -3179.8, 11.0979, 5.79449, 0, 0, -0.241921, 0.970296, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16228 at 107.054764 yards.
(21586, 142142, 0, -11779.5, -2980.72, 10.5436, 2.79252, 0, 0, 0.984807, 0.173652, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 16260 at 27.993622 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(32460, 1277, 0, 'Sungrass', 0, 10), -- Sungrass in Blasted Lands 37 objects total
(21566, 1277, 0, 'Sungrass', 0, 10), -- Sungrass in Blasted Lands 37 objects total
(21581, 1277, 0, 'Sungrass', 0, 10), -- Sungrass in Blasted Lands 37 objects total
(21582, 1277, 0, 'Sungrass', 0, 10), -- Sungrass in Blasted Lands 37 objects total
(21586, 1277, 0, 'Sungrass', 0, 10); -- Sungrass in Blasted Lands 37 objects total

-- Missing Sungrass spawns in Azshara.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(48969, 142142, 1, 4821.41, -6690.78, 93.4824, 4.55531, 0, 0, -0.760406, 0.649449, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 48353 at 503.159119 yards.
(21544, 142142, 1, 2810.06, -5282.85, 118.888, 0.820303, 0, 0, 0.398748, 0.91706, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16040 at 66.820290 yards.
(21567, 142142, 1, 3370.3, -4711.7, 101.066, 1.20428, 0, 0, 0.566406, 0.824126, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16097 at 31.186626 yards.
(21580, 142142, 1, 2679.59, -4379.12, 99.9001, 4.83456, 0, 0, -0.66262, 0.748956, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16212 at 16.903671 yards.
(21587, 142142, 1, 3275.16, -4960.6, 123.957, 6.03884, 0, 0, -0.121869, 0.992546, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16239 at 124.052055 yards.
(21590, 142142, 1, 3513.71, -4175.21, 102.224, 0.523598, 0, 0, 0.258819, 0.965926, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 16100 at 45.415810 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(48969, 1240, 0, 'Sungrass', 0, 10), -- Sungrass in Azshara 93 objects total
(21544, 1240, 0, 'Sungrass', 0, 10), -- Sungrass in Azshara 93 objects total
(21567, 1240, 0, 'Sungrass', 0, 10), -- Sungrass in Azshara 93 objects total
(21580, 1240, 0, 'Sungrass', 0, 10), -- Sungrass in Azshara 93 objects total
(21587, 1240, 0, 'Sungrass', 0, 10), -- Sungrass in Azshara 93 objects total
(21590, 1240, 0, 'Sungrass', 0, 10); -- Sungrass in Azshara 93 objects total

-- Missing Sungrass spawns in Western Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(46473, 142142, 0, 1721.82, -1016.11, 71.0081, 0.244346, 0, 0, 0.121869, 0.992546, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45546 at 298.800781 yards.
(21561, 142142, 0, 2077.56, -1851.23, 63.6229, 4.53786, 0, 0, -0.766044, 0.642789, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16063 at 296.971436 yards.
(21563, 142142, 0, 2418.38, -1716.72, 108.163, 5.14872, 0, 0, -0.537299, 0.843392, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16063 at 220.953674 yards.
(21564, 142142, 0, 1862.53, -1105.95, 59.6888, 6.02139, 0, 0, -0.130526, 0.991445, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16236 at 244.079330 yards.
(21568, 142142, 0, 1975.75, -2324.23, 59.4981, 2.9496, 0, 0, 0.995396, 0.0958512, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16264 at 711.981323 yards.
(46476, 142142, 0, 1594.22, -1244.38, 65.4813, 0.628317, 0, 0, 0.309016, 0.951057, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45546 at 37.267345 yards.
(21572, 142142, 0, 1918.27, -2175.42, 75.8794, 5.23599, 0, 0, -0.5, 0.866025, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16264 at 562.401733 yards.
(21574, 142142, 0, 1835.37, -2031.33, 74.847, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16264 at 403.104370 yards.
(21575, 142142, 0, 2330.78, -1475.19, 96.9419, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16063 at 158.324478 yards.
(21588, 142142, 0, 1799.01, -1646.22, 60.0723, 1.23918, 0, 0, 0.580703, 0.814116, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16233 at 205.153473 yards.
(46478, 142142, 0, 2920.11, -1610.7, 147.766, 5.81195, 0, 0, -0.233445, 0.97237, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 45545 at 263.383301 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(46473, 1261, 0, 'Sungrass', 0, 10), -- Sungrass in Western Plaguelands 9 objects total
(21561, 1261, 0, 'Sungrass', 0, 10), -- Sungrass in Western Plaguelands 9 objects total
(21563, 1261, 0, 'Sungrass', 0, 10), -- Sungrass in Western Plaguelands 9 objects total
(21564, 1261, 0, 'Sungrass', 0, 10), -- Sungrass in Western Plaguelands 9 objects total
(21568, 1261, 0, 'Sungrass', 0, 10), -- Sungrass in Western Plaguelands 9 objects total
(46476, 1261, 0, 'Sungrass', 0, 10), -- Sungrass in Western Plaguelands 9 objects total
(21572, 1261, 0, 'Sungrass', 0, 10), -- Sungrass in Western Plaguelands 9 objects total
(21574, 1261, 0, 'Sungrass', 0, 10), -- Sungrass in Western Plaguelands 9 objects total
(21575, 1261, 0, 'Sungrass', 0, 10), -- Sungrass in Western Plaguelands 9 objects total
(21588, 1261, 0, 'Sungrass', 0, 10), -- Sungrass in Western Plaguelands 9 objects total
(46478, 1261, 0, 'Sungrass', 0, 10); -- Sungrass in Western Plaguelands 9 objects total

-- Missing Sungrass spawns in Burning Steppes.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21542, 142142, 0, -8206.89, -2190.3, 131.917, 6.05629, 0, 0, -0.113203, 0.993572, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16054 at 24.743719 yards.
(21543, 142142, 0, -8156.5, -2804.22, 135.611, 4.29351, 0, 0, -0.83867, 0.54464, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16131 at 56.626564 yards.
(21545, 142142, 0, -7620.03, -2774.08, 134.697, 0.523598, 0, 0, 0.258819, 0.965926, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16068 at 143.029938 yards.
(21552, 142142, 0, -7750.7, -2421.27, 140.446, 3.54302, 0, 0, -0.979924, 0.19937, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 16028 at 23.391556 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(21542, 1303, 0, 'Sungrass', 0, 10), -- Sungrass in Burning Steppes 20 objects total
(21543, 1303, 0, 'Sungrass', 0, 10), -- Sungrass in Burning Steppes 20 objects total
(21545, 1303, 0, 'Sungrass', 0, 10), -- Sungrass in Burning Steppes 20 objects total
(21552, 1303, 0, 'Sungrass', 0, 10); -- Sungrass in Burning Steppes 20 objects total

-- Missing Sungrass spawns in The Hinterlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21539, 142142, 0, -146.055, -3483.01, 127.314, 5.68977, 0, 0, -0.292372, 0.956305, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 13690 at 90.230621 yards.
(21540, 142142, 0, 126.82, -3811.6, 125.848, 1.98967, 0, 0, 0.83867, 0.54464, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16121 at 89.254623 yards.
(21541, 142142, 0, 48.7941, -2583.62, 113.303, 0.261798, 0, 0, 0.130526, 0.991445, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16026 at 66.369408 yards.
(21548, 142142, 0, 254.182, -3485.79, 161.809, 4.5204, 0, 0, -0.771625, 0.636078, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16034 at 133.379883 yards.
(21553, 142142, 0, -110.992, -2903.27, 122.513, 3.7001, 0, 0, -0.961261, 0.27564, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16238 at 101.981026 yards.
(21554, 142142, 0, 157.583, -3357.76, 116.646, 5.16618, 0, 0, -0.529919, 0.848048, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16243 at 95.210716 yards.
(46471, 142142, 0, -192.009, -4346.85, 120.757, 4.53786, 0, 0, -0.766044, 0.642789, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 46449 at 111.964958 yards.
(46472, 142142, 0, 84.1852, -4108.34, 158.736, 0.453785, 0, 0, 0.224951, 0.97437, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 46424 at 110.065598 yards.
(21555, 142142, 0, -42.7587, -2993.42, 122.968, 0.523598, 0, 0, 0.258819, 0.965926, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16238 at 12.820234 yards.
(21556, 142142, 0, -119.008, -4209.6, 121.428, 0.523598, 0, 0, 0.258819, 0.965926, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 13685 at 105.620453 yards.
(21569, 142142, 0, 185.703, -3148.8, 121.978, 0.0174525, 0, 0, 0.00872612, 0.999962, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16064 at 77.241737 yards.
(21570, 142142, 0, 75.4878, -3281.09, 117.157, 4.59022, 0, 0, -0.748956, 0.66262, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16124 at 33.166264 yards.
(46474, 142142, 0, 134.793, -3656.45, 133.251, 3.4034, 0, 0, -0.991445, 0.130528, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 46429 at 119.764221 yards.
(21571, 142142, 0, 158.747, -4206.66, 118.182, 0.715585, 0, 0, 0.350207, 0.936672, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16143 at 91.427841 yards.
(46475, 142142, 0, 179.138, -4381.11, 118.616, 4.57276, 0, 0, -0.754709, 0.656059, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 46434 at 107.114532 yards.
(21577, 142142, 0, 81.3494, -4316.38, 121.672, 1.69297, 0, 0, 0.748956, 0.66262, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 13685 at 138.338043 yards.
(46477, 142142, 0, -13.3295, -4387.78, 142.955, 5.23599, 0, 0, -0.5, 0.866025, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 46449 at 99.696709 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(21539, 1250, 0, 'Sungrass', 0, 10), -- Sungrass in Hinterlands 77 objects total
(21540, 1250, 0, 'Sungrass', 0, 10), -- Sungrass in Hinterlands 77 objects total
(21541, 1250, 0, 'Sungrass', 0, 10), -- Sungrass in Hinterlands 77 objects total
(21548, 1250, 0, 'Sungrass', 0, 10), -- Sungrass in Hinterlands 77 objects total
(21553, 1250, 0, 'Sungrass', 0, 10), -- Sungrass in Hinterlands 77 objects total
(21554, 1250, 0, 'Sungrass', 0, 10), -- Sungrass in Hinterlands 77 objects total
(46471, 1250, 0, 'Sungrass', 0, 10), -- Sungrass in Hinterlands 77 objects total
(46472, 1250, 0, 'Sungrass', 0, 10), -- Sungrass in Hinterlands 77 objects total
(21555, 1250, 0, 'Sungrass', 0, 10), -- Sungrass in Hinterlands 77 objects total
(21556, 1250, 0, 'Sungrass', 0, 10), -- Sungrass in Hinterlands 77 objects total
(21569, 1250, 0, 'Sungrass', 0, 10), -- Sungrass in Hinterlands 77 objects total
(21570, 1250, 0, 'Sungrass', 0, 10), -- Sungrass in Hinterlands 77 objects total
(46474, 1250, 0, 'Sungrass', 0, 10), -- Sungrass in Hinterlands 77 objects total
(21571, 1250, 0, 'Sungrass', 0, 10), -- Sungrass in Hinterlands 77 objects total
(46475, 1250, 0, 'Sungrass', 0, 10), -- Sungrass in Hinterlands 77 objects total
(21577, 1250, 0, 'Sungrass', 0, 10), -- Sungrass in Hinterlands 77 objects total
(46477, 1250, 0, 'Sungrass', 0, 10); -- Sungrass in Hinterlands 77 objects total

-- Missing Sungrass spawns in Eastern Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21549, 142142, 0, 2016.28, -3784.13, 129.389, 2.80998, 0, 0, 0.986285, 0.16505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16085 at 94.885773 yards.
(21550, 142142, 0, 3052.8, -2893.76, 109.784, 2.3911, 0, 0, 0.930417, 0.366502, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16164 at 31.229609 yards.
(21560, 142142, 0, 2863.05, -3118.23, 105.874, 4.60767, 0, 0, -0.743144, 0.669131, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16130 at 21.946526 yards.
(21562, 142142, 0, 2317.71, -4236.85, 98.6486, 0.0523589, 0, 0, 0.0261765, 0.999657, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 16166 at 81.099930 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(21549, 1320, 0, 'Sungrass', 0, 10), -- Sungrass in Eastern Plaguelands 35 objects total
(21550, 1320, 0, 'Sungrass', 0, 10), -- Sungrass in Eastern Plaguelands 35 objects total
(21560, 1320, 0, 'Sungrass', 0, 10), -- Sungrass in Eastern Plaguelands 35 objects total
(21562, 1320, 0, 'Sungrass', 0, 10); -- Sungrass in Eastern Plaguelands 35 objects total

-- Missing Sungrass spawns in Feralas.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(50400, 142142, 1, -4220.13, 114.092, 58.0438, 2.25147, 0, 0, 0.902585, 0.430512, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49989 at 173.571777 yards.
(50401, 142142, 1, -4312.9, 480.826, 54.8414, 3.85718, 0, 0, -0.936671, 0.35021, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49993 at 132.199158 yards.
(170120, 142142, 1, -4587.29, 724.25, 48.3546, 5.49779, 0, 0, -0.382683, 0.92388, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 170106 at 229.064087 yards.
(50402, 142142, 1, -3651.94, 1959.09, 75.3198, 0.698131, 0, 0, 0.34202, 0.939693, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49990 at 222.761734 yards.
(50403, 142142, 1, -4129.21, 393.795, 52.1514, 3.45576, 0, 0, -0.987688, 0.156436, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49993 at 133.142883 yards.
(50404, 142142, 1, -4016.51, -261.971, 151.339, 2.93214, 0, 0, 0.994521, 0.104536, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49989 at 270.125916 yards.
(50405, 142142, 1, -5606.37, 1107.94, 63.6876, 1.25664, 0, 0, 0.587785, 0.809017, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 50000 at 557.468445 yards.
(50406, 142142, 1, -5256.59, 1416.22, 36.897, 4.7473, 0, 0, -0.694658, 0.71934, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 50000 at 138.671646 yards.
(50407, 142142, 1, -2849.65, 2353.96, 36.8631, 3.3685, 0, 0, -0.993571, 0.113208, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 50003 at 157.830551 yards.
(170121, 142142, 1, -4292.6, 587.599, 60.3928, 3.80482, 0, 0, -0.945518, 0.325568, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 170106 at 104.317101 yards.
(170122, 142142, 1, -4421.08, -281.654, 32.5452, 6.26573, 0, 0, -0.00872612, 0.999962, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 170108 at 245.785919 yards.
(50408, 142142, 1, -4567.02, 1469.93, 99.658, 3.80482, 0, 0, -0.945518, 0.325568, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 50001 at 25.199680 yards.
(50409, 142142, 1, -4547.1, 1495.72, 101.124, 4.72984, 0, 0, -0.700909, 0.713251, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 50001 at 16.689426 yards.
(50410, 142142, 1, -5394.21, 1486.27, 26.0908, 4.99164, 0, 0, -0.601814, 0.798636, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 50000 at 143.069778 yards.
(21557, 142142, 1, -4940.68, 1379.55, 51.1686, 3.42085, 0, 0, -0.990268, 0.139175, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16270 at 231.980911 yards.
(50411, 142142, 1, -5247.18, 584.058, 58.8656, 2.04204, 0, 0, 0.85264, 0.522499, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49995 at 173.082840 yards.
(50412, 142142, 1, -5089.1, 237.204, 43.834, 4.50295, 0, 0, -0.777145, 0.629321, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49995 at 213.129715 yards.
(50413, 142142, 1, -5003.9, 252.587, 40.5844, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49997 at 177.176102 yards.
(21559, 142142, 1, -4771.66, 1382.84, 106.601, 4.67748, 0, 0, -0.719339, 0.694659, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16270 at 69.503502 yards.
(50414, 142142, 1, -5160.77, 1228.76, 58.0648, 5.21854, 0, 0, -0.507538, 0.861629, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 50000 at 342.491058 yards.
(50415, 142142, 1, -3785.27, 1951.63, 66.5355, 5.74214, 0, 0, -0.267238, 0.963631, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49990 at 347.042603 yards.
(50416, 142142, 1, -2982.08, 2346.6, 42.1704, 2.33874, 0, 0, 0.920505, 0.390732, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 50003 at 140.694794 yards.
(50417, 142142, 1, -4151.39, -421.797, 26.5573, 0.715585, 0, 0, 0.350207, 0.936672, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49986 at 137.903351 yards.
(50418, 142142, 1, -5769.63, 1275.29, 59.1949, 2.05949, 0, 0, 0.857167, 0.515038, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 50000 at 570.907837 yards.
(50419, 142142, 1, -5468.4, 1682.59, 60.2407, 5.88176, 0, 0, -0.199368, 0.979925, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 50000 at 236.291565 yards.
(50420, 142142, 1, -5589.56, 1687.75, 78.7239, 1.0821, 0, 0, 0.515038, 0.857168, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 50000 at 346.847351 yards.
(50421, 142142, 1, -5445.64, 1684.37, 57.6588, 3.00195, 0, 0, 0.997563, 0.0697661, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 50000 at 218.633621 yards.
(21578, 142142, 1, -4892.01, 1477.28, 83.182, 0.471238, 0, 0, 0.233445, 0.97237, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16270 at 186.555984 yards.
(50422, 142142, 1, -5181.7, 1479.84, 47.1308, 0.994837, 0, 0, 0.477159, 0.878817, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 50000 at 115.596802 yards.
(50423, 142142, 1, -5122.91, 1551.17, 54.7514, 1.43117, 0, 0, 0.656058, 0.75471, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 50000 at 147.972549 yards.
(21579, 142142, 1, -4542.05, 551.276, 61.0015, 5.2709, 0, 0, -0.484809, 0.87462, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16035 at 93.487549 yards.
(21584, 142142, 1, -4664.02, 1593.6, 116.131, 5.39307, 0, 0, -0.430511, 0.902586, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16067 at 13.855013 yards.
(50424, 142142, 1, -3510.86, 2515.86, 54.4166, 3.08918, 0, 0, 0.999657, 0.0262016, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 50004 at 166.154938 yards.
(50425, 142142, 1, -4180.1, -116.857, 59.4741, 0.925024, 0, 0, 0.446198, 0.894935, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49989 at 97.401413 yards.
(21589, 142142, 1, -4378.7, 473.177, 55.3617, 2.82743, 0, 0, 0.987688, 0.156436, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 16035 at 96.336067 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(50400, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(50401, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(170120, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(50402, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(50403, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(50404, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(50405, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(50406, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(50407, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(170121, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(170122, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(50408, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(50409, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(50410, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(21557, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(50411, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(50412, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(50413, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(21559, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(50414, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(50415, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(50416, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(50417, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(50418, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(50419, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(50420, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(50421, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(21578, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(50422, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(50423, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(21579, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(21584, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(50424, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(50425, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(21589, 1192, 0, 'Sungrass', 0, 10); -- Sungrass in Feralas 20 objects total

-- Missing Sungrass spawns in Un'Goro Crater.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21546, 142142, 1, -7448.17, -2418.1, -207.356, 0.471238, 0, 0, 0.233445, 0.97237, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16251 at 706.739441 yards.
(21547, 142142, 1, -8023.44, -1409.54, -271.486, 0.750491, 0, 0, 0.366501, 0.930418, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 17588 at 203.688156 yards.
(21565, 142142, 1, -6793.38, -908.425, -270.122, 0.767944, 0, 0, 0.374606, 0.927184, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 17589 at 239.944717 yards.
(21573, 142142, 1, -6960, -2445.9, -204.303, 4.41568, 0, 0, -0.803857, 0.594823, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16136 at 520.356018 yards.
(21585, 142142, 1, -6888.17, -484.732, -271.43, 1.29154, 0, 0, 0.601814, 0.798636, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 16191 at 16.282478 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(21546, 1215, 0, 'Sungrass', 0, 10), -- Sungrass in Ungoro 22 objects total
(21547, 1215, 0, 'Sungrass', 0, 10), -- Sungrass in Ungoro 22 objects total
(21565, 1215, 0, 'Sungrass', 0, 10), -- Sungrass in Ungoro 22 objects total
(21573, 1215, 0, 'Sungrass', 0, 10), -- Sungrass in Ungoro 22 objects total
(21585, 1215, 0, 'Sungrass', 0, 10); -- Sungrass in Ungoro 22 objects total

-- Missing Sungrass spawns in Silithus.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21558, 142142, 1, -6685.23, 86.7849, 6.31194, 0.122173, 0, 0, 0.0610485, 0.998135, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 13691 at 396.436188 yards.
(21583, 142142, 1, -6682.94, -111.977, 3.70413, 0.418879, 0, 0, 0.207911, 0.978148, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 13691 at 556.158081 yards.
(21591, 142142, 1, -7749.81, 1486.97, 0.788001, 3.24635, 0, 0, -0.998629, 0.0523532, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 13691 at 1367.232788 yards.
(21592, 142142, 1, -6852.07, 19.1105, 5.19067, 4.43314, 0, 0, -0.798635, 0.601815, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 13691 at 365.894806 yards.
(21593, 142142, 1, -7750.89, 950.673, -0.100626, 2.46091, 0, 0, 0.942641, 0.333808, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 13691 at 978.393372 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(21558, 1223, 0, 'Sungrass', 0, 10), -- Sungrass in Silithus
(21583, 1223, 0, 'Sungrass', 0, 10), -- Sungrass in Silithus
(21591, 1223, 0, 'Sungrass', 0, 10), -- Sungrass in Silithus
(21592, 1223, 0, 'Sungrass', 0, 10), -- Sungrass in Silithus
(21593, 1223, 0, 'Sungrass', 0, 10); -- Sungrass in Silithus

-- Create new pool to hold Sungrass spawns in Felwood.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(426, 1, 'Sungrasss in Felwood', 0, 10);

-- Missing Sungrass spawns in Felwood.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21594, 176636, 1, 6154.25, -1490.27, 439.412, 3.71755, 0, 0, -0.958819, 0.284016, 1800, 1800, 1, 100, 0, 10),
(21595, 176636, 1, 5969.22, -616.162, 399.796, 3.17653, 0, 0, -0.999847, 0.0174693, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21594 at 894.354675 yards.
(21596, 176636, 1, 5627.3, -520.709, 372.392, 5.67232, 0, 0, -0.300705, 0.953717, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21594 at 1105.539063 yards.
(21597, 176636, 1, 6238.8, -707.594, 416.565, 0, 0, 0, 0, 1, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21594 at 787.561096 yards.
(21598, 176636, 1, 3883.91, -1448.03, 216.904, 3.54302, 0, 0, -0.979924, 0.19937, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21594 at 2281.608643 yards.
(21599, 176636, 1, 3609.97, -1045.24, 219.979, 4.53786, 0, 0, -0.766044, 0.642789, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21594 at 2592.212158 yards.
(21600, 176636, 1, 6503.98, -1509.01, 438.926, 2.37364, 0, 0, 0.927183, 0.374608, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 21594 at 350.232056 yards.
(21601, 176636, 1, 5064.93, -547.86, 334.946, 2.89725, 0, 0, 0.992546, 0.12187, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 21594 at 1444.183960 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(21595, 426, 0, 'Sungrass', 0, 10), -- Sungrasss in Felwood
(21596, 426, 0, 'Sungrass', 0, 10), -- Sungrasss in Felwood
(21597, 426, 0, 'Sungrass', 0, 10), -- Sungrasss in Felwood
(21598, 426, 0, 'Sungrass', 0, 10), -- Sungrasss in Felwood
(21599, 426, 0, 'Sungrass', 0, 10), -- Sungrasss in Felwood
(21600, 426, 0, 'Sungrass', 0, 10), -- Sungrasss in Felwood
(21601, 426, 0, 'Sungrass', 0, 10), -- Sungrasss in Felwood
(21594, 426, 0, 'Sungrass', 0, 10);
-- Correct position of Wild Steelbloom in Thousand Needles (position is off by 1.47874 yards).
UPDATE `gameobject` SET `position_x`=-4895.45, `position_y`=-2023.79, `position_z`=-8.19877, `orientation`=2.68781, `rotation0`=0, `rotation1`=0, `rotation2`=0.97437, `rotation3`=0.224951 WHERE `guid`=4238;

-- Correct position of Wild Steelbloom in Stonetalon Mountains (position is off by 0.947888 yards).
UPDATE `gameobject` SET `position_x`=49.2554, `position_y`=-418.231, `position_z`=34.4702, `orientation`=0.418879, `rotation0`=0, `rotation1`=0, `rotation2`=0.207911, `rotation3`=0.978148 WHERE `guid`=4143;

-- Correct position of Wild Steelbloom in Arathi Highlands (position is off by 1.43903 yards).
UPDATE `gameobject` SET `position_x`=-1819.02, `position_y`=-2204.36, `position_z`=61.0504, `orientation`=4.03171, `rotation0`=0, `rotation1`=0, `rotation2`=-0.902585, `rotation3`=0.430512 WHERE `guid`=4114;

-- Correct position of Wild Steelbloom in Arathi Highlands (position is off by 3.5061 yards).
UPDATE `gameobject` SET `position_x`=-1056.01, `position_y`=-3760.48, `position_z`=107.311, `orientation`=3.194, `rotation0`=0, `rotation1`=0, `rotation2`=-0.999657, `rotation3`=0.0262016 WHERE `guid`=4146;

-- Correct position of Wild Steelbloom in Desolace (position is off by 0.616557 yards).
UPDATE `gameobject` SET `position_x`=-1112.15, `position_y`=827, `position_z`=131.113, `orientation`=2.46091, `rotation0`=0, `rotation1`=0, `rotation2`=0.942641, `rotation3`=0.333808 WHERE `guid`=3990;

-- Correct position of Wild Steelbloom in The Barrens (position is off by 0.259459 yards).
UPDATE `gameobject` SET `position_x`=-3314.23, `position_y`=-2294.88, `position_z`=125.741, `orientation`=1.09956, `rotation0`=0, `rotation1`=0, `rotation2`=0.522498, `rotation3`=0.85264 WHERE `guid`=3979;

-- Correct position of Wild Steelbloom in Stonetalon Mountains (position is off by 0.26195 yards).
UPDATE `gameobject` SET `position_x`=1291.34, `position_y`=1352.82, `position_z`=153.687, `orientation`=2.53072, `rotation0`=0, `rotation1`=0, `rotation2`=0.953716, `rotation3`=0.300708 WHERE `guid`=3909;

-- Correct position of Wild Steelbloom in Arathi Highlands (position is off by 0.541185 yards).
UPDATE `gameobject` SET `position_x`=-1984.48, `position_y`=-2369.75, `position_z`=87.083, `orientation`=3.61284, `rotation0`=0, `rotation1`=0, `rotation2`=-0.972369, `rotation3`=0.233448 WHERE `guid`=4236;

-- Correct position of Wild Steelbloom in Duskwood (position is off by 3.82267 yards).
UPDATE `gameobject` SET `position_x`=-10760.5, `position_y`=-353.31, `position_z`=95.6839, `orientation`=2.84488, `rotation0`=0, `rotation1`=0, `rotation2`=0.989016, `rotation3`=0.147811 WHERE `guid`=39988;

-- Correct position of Wild Steelbloom in Stranglethorn Vale (position is off by 0.286048 yards).
UPDATE `gameobject` SET `position_x`=-13085.9, `position_y`=-738.748, `position_z`=81.7554, `orientation`=3.21142, `rotation0`=0, `rotation1`=0, `rotation2`=-0.999391, `rotation3`=0.0349061 WHERE `guid`=3949;

-- Correct position of Wild Steelbloom in Thousand Needles (position is off by 1.95516 yards).
UPDATE `gameobject` SET `position_x`=-4836.5, `position_y`=-1969.12, `position_z`=-38.2483, `orientation`=1.6057, `rotation0`=0, `rotation1`=0, `rotation2`=0.719339, `rotation3`=0.694659 WHERE `guid`=4048;

-- Correct position of Wild Steelbloom in Stranglethorn Vale (position is off by 0.839826 yards).
UPDATE `gameobject` SET `position_x`=-12223.3, `position_y`=-28.597, `position_z`=19.7736, `orientation`=5.044, `rotation0`=0, `rotation1`=0, `rotation2`=-0.580703, `rotation3`=0.814116 WHERE `guid`=3915;

-- Correct position of Wild Steelbloom in Stonetalon Mountains (position is off by 4.61466 yards).
UPDATE `gameobject` SET `position_x`=1303.41, `position_y`=1028.89, `position_z`=191.713, `orientation`=1.23918, `rotation0`=0, `rotation1`=0, `rotation2`=0.580703, `rotation3`=0.814116 WHERE `guid`=3971;

-- Correct position of Wild Steelbloom in The Barrens (position is off by 0.454633 yards).
UPDATE `gameobject` SET `position_x`=-4212.71, `position_y`=-2089.35, `position_z`=105.007, `orientation`=2.46091, `rotation0`=0, `rotation1`=0, `rotation2`=0.942641, `rotation3`=0.333808 WHERE `guid`=4207;

-- Correct position of Wild Steelbloom in Stranglethorn Vale (position is off by 1.04051 yards).
UPDATE `gameobject` SET `position_x`=-11460.7, `position_y`=-357.005, `position_z`=62.8674, `orientation`=1.15192, `rotation0`=0, `rotation1`=0, `rotation2`=0.544639, `rotation3`=0.838671 WHERE `guid`=3890;

-- Correct position of Wild Steelbloom in Stranglethorn Vale (position is off by 0.792987 yards).
UPDATE `gameobject` SET `position_x`=-13513.4, `position_y`=192.587, `position_z`=53.9877, `orientation`=1.20428, `rotation0`=0, `rotation1`=0, `rotation2`=0.566406, `rotation3`=0.824126 WHERE `guid`=4225;

-- Correct position of Wild Steelbloom in Stranglethorn Vale (position is off by 1.08431 yards).
UPDATE `gameobject` SET `position_x`=-11924.6, `position_y`=505.368, `position_z`=46.0839, `orientation`=5.65487, `rotation0`=0, `rotation1`=0, `rotation2`=-0.309016, `rotation3`=0.951057 WHERE `guid`=4140;

-- Correct position of Wild Steelbloom in The Barrens (position is off by 0.382108 yards).
UPDATE `gameobject` SET `position_x`=-2765.04, `position_y`=-2022.38, `position_z`=121.663, `orientation`=2.75761, `rotation0`=0, `rotation1`=0, `rotation2`=0.981627, `rotation3`=0.190812 WHERE `guid`=4103;

-- Missing Wild Steelbloom spawns in Badlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21767, 1623, 0, -6519.87, -2397.08, 294.743, 2.9496, 0, 0, 0.995396, 0.0958512, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3601 at 150.295395 yards.
(21768, 1623, 0, -6456.49, -2473.7, 324.2, 2.00713, 0, 0, 0.843391, 0.5373, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3601 at 132.624023 yards.
(21780, 1623, 0, -7256.36, -3192.52, 293.308, 1.18682, 0, 0, 0.559193, 0.829038, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3638 at 739.912842 yards.
(21781, 1623, 0, -7264.99, -2188.65, 293.052, 2.65289, 0, 0, 0.970295, 0.241925, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3601 at 779.712830 yards.
(21803, 1623, 0, -7257.29, -3423.82, 294.898, 3.78737, 0, 0, -0.948323, 0.317306, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3638 at 707.391357 yards.
(21832, 1623, 0, -6628, -3368.33, 267.505, 3.24635, 0, 0, -0.998629, 0.0523532, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 3638 at 91.222633 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(21767, 1084, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelbloom in Badlands
(21768, 1084, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelbloom in Badlands
(21780, 1084, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelbloom in Badlands
(21781, 1084, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelbloom in Badlands
(21803, 1084, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelbloom in Badlands
(21832, 1084, 0, 'Wild Steelbloom', 0, 10); -- Wild Steelbloom in Badlands

-- Missing Wild Steelbloom spawns in Duskwood.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21763, 1623, 0, -10537.2, -1533.53, 124.838, 3.49067, 0, 0, -0.984807, 0.173652, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4209 at 204.122452 yards.
(21847, 1623, 0, -10638.6, -1451.02, 98.9746, 4.60767, 0, 0, -0.743144, 0.669131, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4209 at 302.670563 yards.
(32479, 1623, 0, -10556.8, -164.8, 75.6976, 0, 0, 0, 0, 1, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 32474 at 224.805313 yards.
(21848, 1623, 0, -10481.1, -718.845, 96.757, 2.3911, 0, 0, 0.930417, 0.366502, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 4178 at 243.417892 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(21763, 1114, 0, 'Wild Steelbloom', 0, 10), -- Wildsteel Blooms in Duskwood 10 objects total
(21847, 1114, 0, 'Wild Steelbloom', 0, 10), -- Wildsteel Blooms in Duskwood 10 objects total
(32479, 1114, 0, 'Wild Steelbloom', 0, 10), -- Wildsteel Blooms in Duskwood 10 objects total
(21848, 1114, 0, 'Wild Steelbloom', 0, 10); -- Wildsteel Blooms in Duskwood 10 objects total

-- Missing Wild Steelbloom spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21766, 1623, 0, -2655.84, -2395.78, 98.9103, 3.49067, 0, 0, -0.984807, 0.173652, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4073 at 32.975430 yards.
(21806, 1623, 0, -3679.29, -3214.33, 58.8998, 6.21337, 0, 0, -0.0348988, 0.999391, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3661 at 276.625397 yards.
(21807, 1623, 0, -3411.73, -1955.3, 112.661, 5.86431, 0, 0, -0.207911, 0.978148, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4137 at 122.549553 yards.
(21844, 1623, 0, -2659.93, -2048.6, 76.8451, 5.20108, 0, 0, -0.515038, 0.857168, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 4044 at 127.199364 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(21766, 1152, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Wetlands 47 objects total
(21806, 1152, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Wetlands 47 objects total
(21807, 1152, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Wetlands 47 objects total
(21844, 1152, 0, 'Wild Steelbloom', 0, 10); -- Wild Steelblooms in Wetlands 47 objects total

-- Missing Wild Steelbloom spawns in The Barrens.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21771, 1623, 1, -3432.11, -2372.13, 117.695, 0.471238, 0, 0, 0.233445, 0.97237, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3979 at 141.293152 yards.
(21824, 1623, 1, -3477.06, -1757.76, 112.405, 2.53072, 0, 0, 0.953716, 0.300708, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4085 at 24.017416 yards.
(21825, 1623, 1, -1881.15, -1678.6, 115.408, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4275 at 532.488892 yards.
(21826, 1623, 1, -3698.97, -1519.07, 132.925, 3.05433, 0, 0, 0.999048, 0.0436193, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 13369 at 233.285263 yards.
(21839, 1623, 1, -3816.51, -1418.15, 144.295, 5.88176, 0, 0, -0.199368, 0.979925, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 3937 at 331.092682 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(21771, 1168, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Barrens 29 objects total
(21824, 1168, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Barrens 29 objects total
(21825, 1168, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Barrens 29 objects total
(21826, 1168, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Barrens 29 objects total
(21839, 1168, 0, 'Wild Steelbloom', 0, 10); -- Wild Steelblooms in Barrens 29 objects total

-- Missing Wild Steelbloom spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21812, 1623, 0, -13023.6, -954.967, 104.673, 4.93928, 0, 0, -0.622514, 0.782609, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3952 at 87.546722 yards.
(21843, 1623, 0, -11513.2, 507.041, 82.1076, 1.27409, 0, 0, 0.594822, 0.803857, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 11654 at 79.464615 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(21812, 1169, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stranglethorn 41 objects total
(21843, 1169, 0, 'Wild Steelbloom', 0, 10); -- Wild Steelblooms in Stranglethorn 41 objects total

-- Missing Wild Steelbloom spawns in Alterac Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21846, 1623, 0, -39.3669, -666.351, 91.5816, 2.04204, 0, 0, 0.85264, 0.522499, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 4102 at 544.405334 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(21846, 1061, 0, 'Wild Steelbloom', 0, 10); -- Wild Steelblooms in Alterac 16 objects total

-- Missing Wild Steelbloom spawns in Arathi Highlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21607, 1623, 0, -2015.63, -2763.03, 88.1638, 5.42797, 0, 0, -0.414693, 0.909961, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4081 at 19.887192 yards.
(21611, 1623, 0, -1252.72, -1853.49, 104.184, 0.785397, 0, 0, 0.382683, 0.92388, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4133 at 5.658643 yards.
(21774, 1623, 0, -1953.65, -1621.69, 50.6998, 3.14159, 0, 0, -1, 0, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4161 at 7.935150 yards.
(21779, 1623, 0, -923.274, -3734.02, 97.1244, 2.65289, 0, 0, 0.970295, 0.241925, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4177 at 6.297833 yards.
(21782, 1623, 0, -755.853, -2290.78, 62.4308, 0, 0, 0, 0, 1, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3918 at 18.771318 yards.
(21800, 1623, 0, -1178.42, -2048.25, 80.5063, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4184 at 20.165701 yards.
(21830, 1623, 0, -766.667, -2339.4, 73.999, 5.93412, 0, 0, -0.173648, 0.984808, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3918 at 32.871376 yards.
(21831, 1623, 0, -949.621, -2621.07, 67.446, 2.84488, 0, 0, 0.989016, 0.147811, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4175 at 20.259676 yards.
(21835, 1623, 0, -1780.45, -2093.27, 82.2684, 5.75959, 0, 0, -0.258819, 0.965926, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 4163 at 7.938890 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(21607, 1185, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Arathi 127 objects total
(21611, 1185, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Arathi 127 objects total
(21774, 1185, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Arathi 127 objects total
(21779, 1185, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Arathi 127 objects total
(21782, 1185, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Arathi 127 objects total
(21800, 1185, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Arathi 127 objects total
(21830, 1185, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Arathi 127 objects total
(21831, 1185, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Arathi 127 objects total
(21835, 1185, 0, 'Wild Steelbloom', 0, 10); -- Wild Steelblooms in Arathi 127 objects total

-- Missing Wild Steelbloom spawns in Hillsbrad Foothills.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(34258, 1623, 0, -1386.77, -1207.64, 52.1702, 3.6652, 0, 0, -0.965925, 0.258821, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34252 at 583.241028 yards.
(21770, 1623, 0, -244.647, -1761.18, 134.621, 0.994837, 0, 0, 0.477159, 0.878817, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3626 at 632.323120 yards.
(21778, 1623, 0, -128.739, -1755.53, 144.186, 4.31097, 0, 0, -0.833885, 0.551938, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3626 at 666.495117 yards.
(21801, 1623, 0, -216.618, -1379.53, 116.65, 0.977383, 0, 0, 0.469471, 0.882948, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3626 at 296.869843 yards.
(21802, 1623, 0, -493.843, -1183.12, 80.3286, 3.47321, 0, 0, -0.986285, 0.16505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3626 at 96.822945 yards.
(34259, 1623, 0, -1401.68, -1098.82, 39.569, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34252 at 608.741577 yards.
(21809, 1623, 0, 87.1907, -1252.31, 82.3047, 0.698131, 0, 0, 0.34202, 0.939693, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3626 at 499.859253 yards.
(21813, 1623, 0, -434.975, -1152.92, 74.362, 2.25147, 0, 0, 0.902585, 0.430512, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3626 at 32.602699 yards.
(21827, 1623, 0, -274.828, -1037.61, 75.8699, 1.97222, 0, 0, 0.833885, 0.551938, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3626 at 171.193771 yards.
(21833, 1623, 0, -335.789, -1695.81, 107.266, 5.77704, 0, 0, -0.25038, 0.968148, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3626 at 549.057251 yards.
(21834, 1623, 0, -248.231, -1218.32, 118.386, 3.10665, 0, 0, 0.999847, 0.0174693, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3626 at 173.456833 yards.
(21837, 1623, 0, 114.982, -1020.31, 106.923, 3.76991, 0, 0, -0.951056, 0.309017, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3626 at 534.778870 yards.
(21838, 1623, 0, 47.1491, -640.59, 96.4607, 5.65487, 0, 0, -0.309016, 0.951057, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 3626 at 681.073914 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(34258, 1209, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Hillsbrad  objects total
(21770, 1209, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelbloom in Hillsbrad Foothills
(21778, 1209, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelbloom in Hillsbrad Foothills
(21801, 1209, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelbloom in Hillsbrad Foothills
(21802, 1209, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelbloom in Hillsbrad Foothills
(34259, 1209, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Hillsbrad  objects total
(21809, 1209, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelbloom in Hillsbrad Foothills
(21813, 1209, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelbloom in Hillsbrad Foothills
(21827, 1209, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelbloom in Hillsbrad Foothills
(21833, 1209, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelbloom in Hillsbrad Foothills
(21834, 1209, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelbloom in Hillsbrad Foothills
(21837, 1209, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelbloom in Hillsbrad Foothills
(21838, 1209, 0, 'Wild Steelbloom', 0, 10); -- Wild Steelbloom in Hillsbrad Foothills

-- Missing Wild Steelbloom spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21840, 1623, 1, 1712.75, -3379.23, 149.919, 0.279252, 0, 0, 0.139173, 0.990268, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 4025 at 16.381109 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(21840, 1081, 0, 'Wild Steelbloom', 0, 10); -- Wild Steelblooms in Ashenvale 57 objects total

-- Missing Wild Steelbloom spawns in Thousand Needles.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21606, 1623, 1, -6532.64, -3324.51, -41.3352, 4.64258, 0, 0, -0.731354, 0.681998, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4088 at 663.111572 yards.
(21762, 1623, 1, -5365.98, -2731.19, -19.6399, 6.24828, 0, 0, -0.0174522, 0.999848, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3919 at 24.451391 yards.
(21772, 1623, 1, -4656.35, -1535.07, -29.4601, 2.09439, 0, 0, 0.866025, 0.500001, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3977 at 108.885338 yards.
(21773, 1623, 1, -4540.06, -1112.71, -40.7963, 2.82743, 0, 0, 0.987688, 0.156436, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4060 at 7.821816 yards.
(21808, 1623, 1, -4638.27, -1335.26, -29.6609, 4.34587, 0, 0, -0.824126, 0.566406, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3911 at 19.558281 yards.
(21810, 1623, 1, -5744.01, -3299.31, -15.781, 4.71239, 0, 0, -0.707107, 0.707107, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4120 at 20.700256 yards.
(21811, 1623, 1, -5111.26, -1633.1, -27.9921, 2.53072, 0, 0, 0.953716, 0.300708, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4246 at 162.974380 yards.
(21814, 1623, 1, -5395.51, -1994.2, -44.7428, 5.81195, 0, 0, -0.233445, 0.97237, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16808 at 161.242020 yards.
(21815, 1623, 1, -5468.11, -1744.74, -17.1175, 0.698131, 0, 0, 0.34202, 0.939693, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4050 at 21.024477 yards.
(21816, 1623, 1, -5156.76, -1226.03, 49.1134, 1.58825, 0, 0, 0.71325, 0.70091, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4117 at 25.353037 yards.
(21823, 1623, 1, -5466.03, -3213.86, -16.943, 0.279252, 0, 0, 0.139173, 0.990268, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 3888 at 10.243816 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(21606, 1134, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Thousand Needles 42 objects total
(21762, 1134, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Thousand Needles 42 objects total
(21772, 1134, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Thousand Needles 42 objects total
(21773, 1134, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Thousand Needles 42 objects total
(21808, 1134, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Thousand Needles 42 objects total
(21810, 1134, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Thousand Needles 42 objects total
(21811, 1134, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Thousand Needles 42 objects total
(21814, 1134, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Thousand Needles 42 objects total
(21815, 1134, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Thousand Needles 42 objects total
(21816, 1134, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Thousand Needles 42 objects total
(21823, 1134, 0, 'Wild Steelbloom', 0, 10); -- Wild Steelblooms in Thousand Needles 42 objects total

-- Missing Wild Steelbloom spawns in Desolace.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21769, 1623, 1, -918.797, 839.595, 136.834, 0.820303, 0, 0, 0.398748, 0.91706, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 4063 at 34.962452 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(21769, 1142, 0, 'Wild Steelbloom', 0, 10); -- Wild Steelblooms in Desolace 10 objects total

-- Missing Wild Steelbloom spawns in Stonetalon Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21764, 1623, 1, -58.0826, -319.154, 13.3697, 3.9619, 0, 0, -0.91706, 0.39875, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4054 at 15.503306 yards.
(21765, 1623, 1, 471.506, 1698.63, 32.7717, 0.750491, 0, 0, 0.366501, 0.930418, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4034 at 22.750711 yards.
(21775, 1623, 1, 1588.58, 1417.84, 197.676, 2.44346, 0, 0, 0.939692, 0.34202, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4265 at 22.602268 yards.
(21776, 1623, 1, 2198.55, 1377.93, 285.3, 1.22173, 0, 0, 0.573576, 0.819152, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3961 at 36.449203 yards.
(21777, 1623, 1, 2361.29, 1689.74, 334.74, 5.68977, 0, 0, -0.292372, 0.956305, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3941 at 10.096108 yards.
(47494, 1623, 1, 2622.2, 1778.37, 337.445, 1.98967, 0, 0, 0.83867, 0.54464, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 47365 at 146.111801 yards.
(21804, 1623, 1, 9.36697, -836.588, 29.2434, 3.47321, 0, 0, -0.986285, 0.16505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4194 at 15.476217 yards.
(21805, 1623, 1, 2247.7, 1630.39, 326.004, 0.90757, 0, 0, 0.438371, 0.898794, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4071 at 7.604077 yards.
(21817, 1623, 1, 207.223, -438.468, 28.4137, 0.558504, 0, 0, 0.275637, 0.961262, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3912 at 10.556634 yards.
(21818, 1623, 1, 1207.74, 407.573, 84.235, 0.837757, 0, 0, 0.406736, 0.913546, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4047 at 54.502522 yards.
(21819, 1623, 1, 1550.65, -349.78, 56.6547, 4.08407, 0, 0, -0.891006, 0.453991, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4041 at 7.182665 yards.
(21820, 1623, 1, 719.457, 182.827, 75.7343, 5.49779, 0, 0, -0.382683, 0.92388, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4145 at 5.391454 yards.
(21821, 1623, 1, 2041.76, 1112.74, 257.874, 5.35816, 0, 0, -0.446198, 0.894935, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4155 at 10.762703 yards.
(21822, 1623, 1, 2543.4, 1184.89, 336.05, 2.51327, 0, 0, 0.951056, 0.309017, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4052 at 11.260164 yards.
(21828, 1623, 1, 232.98, 11.8919, 74.468, 5.34071, 0, 0, -0.45399, 0.891007, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4165 at 367.543945 yards.
(21829, 1623, 1, 545.39, 455.387, 85.2109, 4.41568, 0, 0, -0.803857, 0.594823, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4035 at 34.061798 yards.
(21836, 1623, 1, 998.557, -302.445, 29.2159, 4.88692, 0, 0, -0.642787, 0.766045, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3994 at 11.263259 yards.
(21842, 1623, 1, 1294.78, 422.753, 80.6176, 4.50295, 0, 0, -0.777145, 0.629321, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4135 at 5.492360 yards.
(21845, 1623, 1, 98.1569, -686.456, 22.3247, 3.9619, 0, 0, -0.91706, 0.39875, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 4019 at 10.508227 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(21764, 1085, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stonetalon 92 objects total
(21765, 1085, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stonetalon 92 objects total
(21775, 1085, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stonetalon 92 objects total
(21776, 1085, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stonetalon 92 objects total
(21777, 1085, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stonetalon 92 objects total
(47494, 1085, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stonetalon 92 objects total
(21804, 1085, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stonetalon 92 objects total
(21805, 1085, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stonetalon 92 objects total
(21817, 1085, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stonetalon 92 objects total
(21818, 1085, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stonetalon 92 objects total
(21819, 1085, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stonetalon 92 objects total
(21820, 1085, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stonetalon 92 objects total
(21821, 1085, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stonetalon 92 objects total
(21822, 1085, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stonetalon 92 objects total
(21828, 1085, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stonetalon 92 objects total
(21829, 1085, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stonetalon 92 objects total
(21836, 1085, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stonetalon 92 objects total
(21842, 1085, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stonetalon 92 objects total
(21845, 1085, 0, 'Wild Steelbloom', 0, 10); -- Wild Steelblooms in Stonetalon 92 objects total

-- Correct position of Wintersbite in Alterac Mountains (position is off by 4.40549 yards).
UPDATE `gameobject` SET `position_x`=439.039, `position_y`=-242.432, `position_z`=155.82, `orientation`=2.96704, `rotation0`=0, `rotation1`=0, `rotation2`=0.996194, `rotation3`=0.087165 WHERE `guid`=8211;

-- Correct position of Wintersbite in Alterac Mountains (position is off by 0.637646 yards).
UPDATE `gameobject` SET `position_x`=313.651, `position_y`=-349.851, `position_z`=167.662, `orientation`=4.86947, `rotation0`=0, `rotation1`=0, `rotation2`=-0.649447, `rotation3`=0.760406 WHERE `guid`=8212;

-- Missing Wintersbite spawns in Alterac Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21855, 2044, 0, 544.052, -207.92, 146.243, 1.48353, 0, 0, 0.67559, 0.737278, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8209 at 8.258742 yards.
(21856, 2044, 0, 250.224, -412.048, 153.166, 3.75246, 0, 0, -0.953716, 0.300708, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8196 at 10.912564 yards.
(21857, 2044, 0, 319.122, -386.163, 170.845, 3.85718, 0, 0, -0.936671, 0.35021, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8212 at 36.625572 yards.
(21858, 2044, 0, 783.456, -247.429, 135.859, 3.01941, 0, 0, 0.998135, 0.0610518, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 8207 at 182.269623 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(21855, 1062, 0, 'Wintersbite', 0, 10), -- Wintersbite in Alterac 34 objects total
(21856, 1062, 0, 'Wintersbite', 0, 10), -- Wintersbite in Alterac 34 objects total
(21857, 1062, 0, 'Wintersbite', 0, 10), -- Wintersbite in Alterac 34 objects total
(21858, 1062, 0, 'Wintersbite', 0, 10); -- Wintersbite in Alterac 34 objects total

-- Update Herbalism Gameobjects
UPDATE `gameobject` SET `spawn_flags` = 0 WHERE `id` IN (1618, 1617, 1619, 1620, 1621, 1622, 1623, 1624, 2041, 2866, 142140, 142141, 142142, 142143, 142144, 142145, 176583, 176584, 176586, 176587, 176588, 176589);
UPDATE `gameobject` SET `spawntimesecsmin`= 2700, `spawntimesecsmax` = 4500 WHERE `id` = 176589;
UPDATE `gameobject` SET `spawntimesecsmin`= 300, `spawntimesecsmax` = 300 WHERE `id` IN (142145, 142144, 176588, 176642);
UPDATE `gameobject` SET `spawntimesecsmin`= 604800, `spawntimesecsmax` = 604800 WHERE `id` = 1619 AND `map` = 43;
UPDATE `gameobject` SET `spawntimesecsmin`= 604800, `spawntimesecsmax` = 604800 WHERE `id` = 1621 AND `map` = 47;
UPDATE `gameobject` SET `spawntimesecsmin`= 604800, `spawntimesecsmax` = 604800 WHERE `id` = 2045 AND `map` IN (48, 349);
UPDATE `gameobject` SET `spawntimesecsmin`= 604800, `spawntimesecsmax` = 604800 WHERE `id` = 1622 AND `map` IN (48, 43);
UPDATE `gameobject` SET `spawntimesecsmin`= 604800, `spawntimesecsmax` = 604800 WHERE `id` = 1628 AND `map` IN (189, 129);
UPDATE `gameobject` SET `spawntimesecsmin`= 604800, `spawntimesecsmax` = 604800 WHERE `id` = 1624 AND `map` IN (189, 43);
UPDATE `gameobject` SET `spawntimesecsmin`= 604800, `spawntimesecsmax` = 604800 WHERE `id` = 2041 AND `map` IN (189, 43);
UPDATE `gameobject` SET `spawntimesecsmin`= 604800, `spawntimesecsmax` = 604800 WHERE `id` = 2042 AND `map` IN (189, 47);
UPDATE `gameobject` SET `spawntimesecsmin`= 604800, `spawntimesecsmax` = 604800 WHERE `id` = 2046 AND `map` IN (189, 129);
UPDATE `gameobject` SET `spawntimesecsmin`= 604800, `spawntimesecsmax` = 604800 WHERE `id` = 2044 AND `map` = 30;
UPDATE `gameobject` SET `spawntimesecsmin`= 604800, `spawntimesecsmax` = 604800 WHERE `id` = 180165 AND `map` = 309;
UPDATE `gameobject` SET `spawntimesecsmin`= 604800, `spawntimesecsmax` = 604800 WHERE `id` = 142141 AND `map` = 129;
UPDATE `gameobject` SET `spawntimesecsmin`= 604800, `spawntimesecsmax` = 604800 WHERE `id` = 180164 AND `map` = 309;
UPDATE `gameobject` SET `spawntimesecsmin`= 604800, `spawntimesecsmax` = 604800 WHERE `id` = 142143 AND `map` = 349;
UPDATE `gameobject` SET `spawntimesecsmin`= 604800, `spawntimesecsmax` = 604800 WHERE `id` = 142144 AND `map` IN (429, 349);
UPDATE `gameobject` SET `spawntimesecsmin`= 604800, `spawntimesecsmax` = 604800 WHERE `id` = 142145 AND `map` = 429;
UPDATE `gameobject` SET `spawntimesecsmin`= 604800, `spawntimesecsmax` = 604800 WHERE `id` = 180167 AND `map` = 309;
UPDATE `gameobject` SET `spawntimesecsmin`= 604800, `spawntimesecsmax` = 604800 WHERE `id` = 176638 AND `map` = 30;
UPDATE `gameobject` SET `spawntimesecsmin`= 604800, `spawntimesecsmax` = 604800 WHERE `id` = 176584 AND `map` = 429;
UPDATE `gameobject` SET `spawntimesecsmin`= 604800, `spawntimesecsmax` = 604800 WHERE `id` = 180168 AND `map` = 309;
UPDATE `gameobject` SET `spawntimesecsmin`= 604800, `spawntimesecsmax` = 604800 WHERE `id` = 176639 AND `map` = 30;
UPDATE `gameobject` SET `spawntimesecsmin`= 604800, `spawntimesecsmax` = 604800 WHERE `id` = 180166 AND `map` = 309;
UPDATE `gameobject` SET `spawntimesecsmin`= 604800, `spawntimesecsmax` = 604800 WHERE `id` = 176640 AND `map` = 30;
UPDATE `gameobject` SET `spawntimesecsmin`= 604800, `spawntimesecsmax` = 604800 WHERE `id` = 176588 AND `map` = 30;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
