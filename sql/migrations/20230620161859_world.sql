DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230620161859');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230620161859');
-- Add your query below.

SET @OGUID = 66885;

-- Barrens
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 3729, 1, 530.586, -1449.89, 91.6667, 0, 0, 0, 0, 1, 300, 300, 1, 100, 0, 10),
(@OGUID+2, 3727, 1, -2047.76, -2618.79, 91.6667, 0, 0, 0, 0, 1, 300, 300, 1, 100, 0, 10),
(@OGUID+3, 3726, 1, -685.994, -3881.35, 41.5266, 1.64061, 0, 0, 0.731353, 0.681999, 300, 300, 1, 100, 0, 10),
(@OGUID+4, 3724, 1, -383.389, -3783.7, 29.3738, 0.628317, 0, 0, 0.309016, 0.951057, 300, 300, 1, 100, 0, 10),
(@OGUID+5, 1622, 1, -592.409, -2025.54, 58.5813, 1.69297, 0, 0, 0.748956, 0.66262, 300, 300, 1, 100, 0, 10),
(@OGUID+6, 1620, 1, -696.661, -2181.23, 30.172, 5.16618, 0, 0, -0.529919, 0.848048, 300, 300, 1, 100, 0, 10),
(@OGUID+7, 1620, 1, -688.772, -2010.5, 64.995, 5.13127, 0, 0, -0.544639, 0.838671, 300, 300, 1, 100, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+2, 1032, 0, 'Mageroyal', 0, 10),
(@OGUID+3, 1029, 0, 'Earthroot', 0, 10),
(@OGUID+4, 1030, 0, 'Peacebloom', 0, 10),
(@OGUID+5, 1036, 0, 'Bruiseweed', 0, 10),
(@OGUID+6, 1032, 0, 'Mageroyal', 0, 10),
(@OGUID+7, 1032, 0, 'Mageroyal', 0, 10);

-- Desolace
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(2001, 3, 'Ghost Mushroom in Desolace', 0, 10);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+8, 2041, 1, -2015.13, 2275.88, 53.7174, 2.70526, 0, 0, 0.976295, 0.216442, 300, 300, 1, 100, 0, 10),
(@OGUID+9, 2041, 1, -1677.75, 852.175, 88.6948, 0, 0, 0, 0, 1, 300, 300, 1, 100, 0, 10),
(@OGUID+10, 142144, 1, -1607.55, 2739.86, 93.7536, 5.81195, 0, 0, -0.233445, 0.97237, 300, 300, 1, 100, 0, 10),
(@OGUID+11, 142144, 1, -1513.54, 2890.08, 92.5331, 1.20428, 0, 0, 0.566406, 0.824126, 300, 300, 1, 100, 0, 10),
(@OGUID+12, 142144, 1, -1462.99, 2682.32, 92.618, 1.01229, 0, 0, 0.484809, 0.87462, 300, 300, 1, 100, 0, 10),
(@OGUID+13, 142144, 1, -1456.05, 2964.65, 123.402, 5.58505, 0, 0, -0.34202, 0.939693, 300, 300, 1, 100, 0, 10),
(@OGUID+14, 142144, 1, -1443.13, 2864.16, 87.9732, 5.02655, 0, 0, -0.587785, 0.809017, 300, 300, 1, 100, 0, 10),
(@OGUID+15, 142144, 1, -1370.94, 2878.47, 76.912, 4.15388, 0, 0, -0.874619, 0.48481, 300, 300, 1, 100, 0, 10),
(@OGUID+16, 142144, 1, -1339.14, 2667.2, 86.0024, 0.925024, 0, 0, 0.446198, 0.894935, 300, 300, 1, 100, 0, 10),
(@OGUID+17, 142144, 1, -1282.92, 3004.77, 88.6829, 4.06662, 0, 0, -0.894934, 0.446199, 300, 300, 1, 100, 0, 10),
(@OGUID+18, 142144, 1, -1255.65, 2933.59, 74.1313, 2.05949, 0, 0, 0.857167, 0.515038, 300, 300, 1, 100, 0, 10),
(@OGUID+19, 142144, 1, -1277.61, 2972.3, 72.428, 0.837757, 0, 0, 0.406736, 0.913546, 300, 300, 1, 100, 0, 10),
(@OGUID+20, 142144, 1, -1199.4, 2971.74, 64.6476, 5.34071, 0, 0, -0.45399, 0.891007, 300, 300, 1, 100, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+8, 1144, 0, 'Liferoot', 0, 10),
(@OGUID+9, 1144, 0, 'Liferoot', 0, 10),
(@OGUID+10, 2001, 0, 'Ghost Mushroom', 0, 10),
(@OGUID+11, 2001, 0, 'Ghost Mushroom', 0, 10),
(@OGUID+12, 2001, 0, 'Ghost Mushroom', 0, 10),
(@OGUID+13, 2001, 0, 'Ghost Mushroom', 0, 10),
(@OGUID+14, 2001, 0, 'Ghost Mushroom', 0, 10),
(@OGUID+15, 2001, 0, 'Ghost Mushroom', 0, 10),
(@OGUID+16, 2001, 0, 'Ghost Mushroom', 0, 10),
(@OGUID+17, 2001, 0, 'Ghost Mushroom', 0, 10),
(@OGUID+18, 2001, 0, 'Ghost Mushroom', 0, 10),
(@OGUID+19, 2001, 0, 'Ghost Mushroom', 0, 10),
(@OGUID+20, 2001, 0, 'Ghost Mushroom', 0, 10);

-- Ashenvale
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+21, 1622, 1, 4275.72, 733.381, -27.2986, 3.52557, 0, 0, -0.981627, 0.190812, 300, 300, 1, 100, 0, 10),
(@OGUID+22, 2045, 1, 4243.06, 671.224, -28.5827, 2.9496, 0, 0, 0.995396, 0.0958512, 300, 300, 1, 100, 0, 10),
(@OGUID+23, 2045, 1, 4307.48, 947.234, -22.5774, 5.41052, 0, 0, -0.422618, 0.906308, 300, 300, 1, 100, 0, 10),
(@OGUID+24, 2046, 1, 2902.07, -3951.59, 113.538, 1.32645, 0, 0, 0.615661, 0.788011, 300, 300, 1, 100, 0, 10),
(@OGUID+25, 1621, 1, 2896.12, -3005.33, 201.691, 2.00713, 0, 0, 0.843391, 0.5373, 300, 300, 1, 100, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+21, 1072, 0, 'Bruiseweed', 0, 10),
(@OGUID+22, 1076, 0, 'Stranglekelp', 0, 10),
(@OGUID+23, 1076, 0, 'Stranglekelp', 0, 10),
(@OGUID+24, 1308, 0, 'Goldthorn', 0, 10),
(@OGUID+25, 1073, 0, 'Briarthorn', 0, 10);

-- Durotar
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+26, 1620, 1, -157.146, -3992.43, 57.2922, 4.66003, 0, 0, -0.725374, 0.688355, 300, 300, 1, 100, 0, 10),
(@OGUID+27, 1619, 1, 34.8251, -4923.91, 13.5517, 0, 0, 0, 0, 1, 300, 300, 1, 100, 0, 10),
(@OGUID+28, 1619, 1, 37.1113, -3984.51, 48.3673, 3.71755, 0, 0, -0.958819, 0.284016, 300, 300, 1, 100, 0, 10),
(@OGUID+29, 1619, 1, 432.176, -3955.29, 29.5882, 3.90954, 0, 0, -0.927183, 0.374608, 300, 300, 1, 100, 0, 10),
(@OGUID+30, 1619, 1, 765.453, -3869.99, 24.0596, 1.16937, 0, 0, 0.551936, 0.833886, 300, 300, 1, 100, 0, 10),
(@OGUID+31, 1618, 1, 41.6207, -3916.78, 44.4288, 4.7473, 0, 0, -0.694658, 0.71934, 300, 300, 1, 100, 0, 10),
(@OGUID+32, 1618, 1, 139.258, -3887.16, 39.8697, 3.75246, 0, 0, -0.953716, 0.300708, 300, 300, 1, 100, 0, 10),
(@OGUID+33, 1618, 1, 410.002, -3984.35, 30.2169, 2.86234, 0, 0, 0.990268, 0.139175, 300, 300, 1, 100, 0, 10),
(@OGUID+34, 1618, 1, 687.802, -3908.26, 15.4886, 5.95157, 0, 0, -0.165047, 0.986286, 300, 300, 1, 100, 0, 10),
(@OGUID+35, 1618, 1, 808.397, -3849.42, 18.2498, 0.610863, 0, 0, 0.300705, 0.953717, 300, 300, 1, 100, 0, 10),
(@OGUID+36, 1618, 1, 871.441, -3921.87, 20.8167, 4.79966, 0, 0, -0.67559, 0.737278, 300, 300, 1, 100, 0, 10),
(@OGUID+37, 1618, 1, 1351.06, -4764.11, 26.9909, 0, 0, 0, 0, 1, 300, 300, 1, 100, 0, 10),
(@OGUID+38, 1617, 1, 763.727, -3959.34, 19.3767, 1.13446, 0, 0, 0.537299, 0.843392, 300, 300, 1, 100, 0, 10),
(@OGUID+39, 1617, 1, 1285.04, -4064.33, 33.2841, 4.2237, 0, 0, -0.857167, 0.515038, 300, 300, 1, 100, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+26, 1023, 0, 'Mageroyal', 0, 10),
(@OGUID+27, 1021, 0, 'Earthroot', 0, 10),
(@OGUID+28, 1021, 0, 'Earthroot', 0, 10),
(@OGUID+29, 1021, 0, 'Earthroot', 0, 10),
(@OGUID+30, 1021, 0, 'Earthroot', 0, 10),
(@OGUID+31, 1020, 0, 'Peacebloom', 0, 10),
(@OGUID+32, 1020, 0, 'Peacebloom', 0, 10),
(@OGUID+33, 1020, 0, 'Peacebloom', 0, 10),
(@OGUID+34, 1020, 0, 'Peacebloom', 0, 10),
(@OGUID+35, 1020, 0, 'Peacebloom', 0, 10),
(@OGUID+36, 1020, 0, 'Peacebloom', 0, 10),
(@OGUID+37, 1020, 0, 'Peacebloom', 0, 10),
(@OGUID+38, 1022, 0, 'Silverleaf', 0, 10),
(@OGUID+39, 1022, 0, 'Silverleaf', 0, 10);

-- Hinterlands
UPDATE `pool_template` SET `description`='Ghost Mushroom in Hinterlands' WHERE  `entry`=1247;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+40, 142144, 0, -726.138, -3786.03, 228.721, 5.84685, 0, 0, -0.216439, 0.976296, 300, 300, 1, 100, 0, 10),
(@OGUID+41, 142144, 0, -637.929, -3721.51, 235.289, 2.77507, 0, 0, 0.983254, 0.182238, 300, 300, 1, 100, 0, 10),
(@OGUID+42, 142144, 0, -627.208, -3836.7, 233.725, 5.16618, 0, 0, -0.529919, 0.848048, 300, 300, 1, 100, 0, 10),
(@OGUID+43, 142144, 0, -273.775, -3695.75, 241.68, 4.2237, 0, 0, -0.857167, 0.515038, 300, 300, 1, 100, 0, 10),
(@OGUID+44, 142144, 0, -265.643, -3708.77, 239.011, 2.16421, 0, 0, 0.882947, 0.469473, 300, 300, 1, 100, 0, 10),
(@OGUID+45, 142144, 0, 339.986, -3752.52, 107.354, 4.59022, 0, 0, -0.748956, 0.66262, 300, 300, 1, 100, 0, 10),
(@OGUID+46, 142144, 0, 357.638, -3789.23, 126.82, 1.41372, 0, 0, 0.649447, 0.760406, 300, 300, 1, 100, 0, 10),
(@OGUID+47, 142144, 0, 366.088, -3725.58, 105.882, 3.26377, 0, 0, -0.998135, 0.0610518, 300, 300, 1, 100, 0, 10),
(@OGUID+48, 142144, 0, 368.381, -3860.87, 106.184, 5.63741, 0, 0, -0.317305, 0.948324, 300, 300, 1, 100, 0, 10),
(@OGUID+49, 142144, 0, 369.478, -3901.46, 102.944, 1.74533, 0, 0, 0.766044, 0.642789, 300, 300, 1, 100, 0, 10),
(@OGUID+50, 142144, 0, 378.476, -3758.72, 103.351, 2.14675, 0, 0, 0.878817, 0.47716, 300, 300, 1, 100, 0, 10),
(@OGUID+51, 142144, 0, 405.047, -3807.52, 101.678, 3.85718, 0, 0, -0.936671, 0.35021, 300, 300, 1, 100, 0, 10),
(@OGUID+52, 142144, 0, 414.474, -3879.82, 98.0181, 5.16618, 0, 0, -0.529919, 0.848048, 300, 300, 1, 100, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+40, 1247, 0, 'Ghost Mushroom', 0, 10),
(@OGUID+41, 1247, 0, 'Ghost Mushroom', 0, 10),
(@OGUID+42, 1247, 0, 'Ghost Mushroom', 0, 10),
(@OGUID+43, 1247, 0, 'Ghost Mushroom', 0, 10),
(@OGUID+44, 1247, 0, 'Ghost Mushroom', 0, 10),
(@OGUID+45, 1247, 0, 'Ghost Mushroom', 0, 10),
(@OGUID+46, 1247, 0, 'Ghost Mushroom', 0, 10),
(@OGUID+47, 1247, 0, 'Ghost Mushroom', 0, 10),
(@OGUID+48, 1247, 0, 'Ghost Mushroom', 0, 10),
(@OGUID+49, 1247, 0, 'Ghost Mushroom', 0, 10),
(@OGUID+50, 1247, 0, 'Ghost Mushroom', 0, 10),
(@OGUID+51, 1247, 0, 'Ghost Mushroom', 0, 10),
(@OGUID+52, 1247, 0, 'Ghost Mushroom', 0, 10);

-- Feralas
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+53, 142140, 1, -3941.41, 1188.8, 149.715, 3.14159, 0, 0, -1, 0, 300, 300, 1, 100, 0, 10),
(@OGUID+54, 142140, 1, -3571.31, 1079.6, 149.463, 2.07694, 0, 0, 0.861629, 0.507539, 300, 300, 1, 100, 0, 10),
(@OGUID+55, 176583, 1, -3750.22, 1091.81, 131.942, 0.90757, 0, 0, 0.438371, 0.898794, 300, 300, 1, 100, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+53, 1324, 0, 'Purple Lotus', 0, 10),
(@OGUID+54, 1324, 0, 'Purple Lotus', 0, 10),
(@OGUID+55, 1194, 0, 'Golden Sansam', 0, 10);

-- Eastern Plaguelands
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+56, 176587, 0, 2016.61, -4694.26, 91.7821, 5.44543, 0, 0, -0.406736, 0.913546, 300, 300, 1, 100, 0, 10),
(@OGUID+57, 176587, 0, 2200.33, -5280.47, 90.5324, 0, 0, 0, 0, 1, 300, 300, 1, 100, 0, 10),
(@OGUID+58, 176587, 0, 1674.43, -3545.49, 126.405, 0, 0, 0, 0, 1, 300, 300, 1, 100, 0, 10),
(@OGUID+59, 176584, 0, 2104.34, -3477.04, 115.704, 0, 0, 0, 0, 1, 300, 300, 1, 100, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+56, 1265, 0, 'Plaguebloom', 0, 10),
(@OGUID+57, 1265, 0, 'Plaguebloom', 0, 10),
(@OGUID+58, 1265, 0, 'Plaguebloom', 0, 10),
(@OGUID+59, 1267, 0, 'Dreamfoil', 0, 10);

-- Swamp of Sorrows
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+60, 142143, 0, -10139, -3363.5, 20.8903, 0.104719, 0, 0, 0.0523357, 0.99863, 300, 300, 1, 100, 0, 10),
(@OGUID+61, 2046, 0, -10588, -2737.17, 34.8652, 2.26893, 0, 0, 0.906307, 0.422619, 300, 300, 1, 100, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+60, 1307, 0, 'Blindweed', 0, 10),
(@OGUID+61, 1313, 0, 'Goldthorn', 0, 10);

-- Stranglethorn Vale
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+62, 2043, 0, -11936, -181.676, 17.8796, 0.0698117, 0, 0, 0.0348988, 0.999391, 300, 300, 1, 100, 0, 10),
(@OGUID+63, 2041, 0, -12001.1, -349.351, 11.4441, 5.41052, 0, 0, -0.422618, 0.906308, 300, 300, 1, 100, 0, 10),
(@OGUID+64, 1624, 0, -11865, -549.116, 14.4704, 2.75761, 0, 0, 0.981627, 0.190812, 300, 300, 1, 100, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+62, 1173, 0, 'Khadgars Whisker', 0, 10),
(@OGUID+63, 1179, 0, 'Liferoot', 0, 10),
(@OGUID+64, 1170, 0, 'Kingsblood', 0, 10);

-- Wetlands
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+65, 1624, 0, -3190.35, -2841.49, 19.6929, 0, 0, 0, 0, 1, 300, 300, 1, 100, 0, 10),
(@OGUID+66, 1624, 0, -2985.44, -2727.56, 12.5439, 0, 0, 0, 0, 1, 300, 300, 1, 100, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+65, 1155, 0, 'Kingsblood', 0, 10),
(@OGUID+66, 1155, 0, 'Kingsblood', 0, 10);

-- Duskwood
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+67, 1623, 0, -10556.8, -164.8, 75.6976, 0, 0, 0, 0, 1, 300, 300, 1, 100, 0, 10),
(@OGUID+68, 1621, 0, -10705.2, -942.698, 76.341, 4.17134, 0, 0, -0.870356, 0.492424, 300, 300, 1, 100, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+67, 1114, 0, 'Wild Steelbloom', 0, 10),
(@OGUID+68, 1113, 0, 'Briarthorn', 0, 10);

-- Elwynn Forest
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+69, 1622, 0, -9986.18, 852.699, 37.2665, 3.35105, 0, 0, -0.994521, 0.104536, 300, 300, 1, 100, 0, 10),
(@OGUID+70, 1617, 0, -9687.95, -463.91, 53.1311, 5.93412, 0, 0, -0.173648, 0.984808, 300, 300, 1, 100, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+69, 1110, 0, 'Bruiseweed', 0, 10),
(@OGUID+70, 1013, 0, 'Silverleaf', 0, 10);

-- Redridge Mountains
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+71, 1621, 0, -9692.73, -2424.65, 58.8121, 3.82227, 0, 0, -0.942641, 0.333808, 300, 300, 1, 100, 0, 10),
(@OGUID+72, 1619, 0, -9190, -3239.01, 103.255, 4.72984, 0, 0, -0.700909, 0.713251, 300, 300, 1, 100, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+71, 1127, 0, 'Briarthorn', 0, 10),
(@OGUID+72, 1124, 0, 'Earthroot', 0, 10);

-- Swamp of Sorrows
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+73, 2043, 0, -10296, -4092.72, 23.3151, 0.733038, 0, 0, 0.358368, 0.93358, 300, 300, 1, 100, 0, 10),
(@OGUID+74, 2041, 0, -10389.1, -4076, 19.9551, 0.261798, 0, 0, 0.130526, 0.991445, 300, 300, 1, 100, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+73, 1309, 0, 'Khadgars Whisker', 0, 10),
(@OGUID+74, 1317, 0, 'Liferoot', 0, 10);

-- Misc
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+75, 2866, 1, -8950.79, -2918.7, 48.9025, 4.60767, 0, 0, -0.743144, 0.669131, 300, 300, 1, 100, 0, 10),
(@OGUID+76, 2866, 0, -6598.05, -1812.66, 251.337, 0, 0, 0, 0, 1, 300, 300, 1, 100, 0, 10),
(@OGUID+77, 2041, 1, -3871.89, -3656.06, 31.251, 0, 0, 0, 0, 1, 300, 300, 1, 100, 0, 10),
(@OGUID+78, 176587, 0, 1576.99, -1083.78, 71.2836, 0, 0, 0, 0, 1, 300, 300, 1, 100, 0, 10),
(@OGUID+79, 176586, 1, -7972, -633.369, -218.124, 0.820303, 0, 0, 0.398748, 0.91706, 300, 300, 1, 100, 0, 10),
(@OGUID+80, 176583, 1, -7090.5, 1250.5, 4.69263, 0, 0, 0, 0, 1, 300, 300, 1, 100, 0, 10),
(@OGUID+81, 142142, 0, -11209, -3315.33, 8.70227, 0, 0, 0, 0, 1, 300, 300, 1, 100, 0, 10),
(@OGUID+82, 176636, 1, 6238.8, -707.594, 416.565, 0, 0, 0, 0, 1, 300, 300, 1, 100, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+75, 1208, 0, 'Firebloom', 0, 10),
(@OGUID+76, 1291, 0, 'Firebloom', 0, 10),
(@OGUID+77, 1104, 0, 'Liferoot', 0, 10),
(@OGUID+78, 1258, 0, 'Plaguebloom', 0, 10),
(@OGUID+79, 1218, 0, 'Mountain Silversage', 0, 10),
(@OGUID+80, 1224, 0, 'Golden Sansam', 0, 10),
(@OGUID+81, 1229, 0, 'Sungrass', 0, 10),
(@OGUID+82, 1229, 0, 'Sungrass', 0, 10);

-- Pool Orphaned Objects
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(33336, 106, 0, 'Grave Moss', 0, 10),
(7882, 1309, 0, 'Khadgars Whisker', 0, 10),
(30786, 984, 0, 'Stranglekelp', 0, 10),
(30645, 984, 0, 'Stranglekelp', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(32000, 1053, 0, 'Earthroot', 0, 10),
(35595, 1053, 0, 'Earthroot', 0, 10),
(35620, 1053, 0, 'Earthroot', 0, 10),
(35636, 1053, 0, 'Earthroot', 0, 10),
(35639, 1053, 0, 'Earthroot', 0, 10),
(35651, 1053, 0, 'Earthroot', 0, 10),
(35633, 1053, 0, 'Bruiseweed', 0, 10),
(35592, 1053, 0, 'Kingsblood', 0, 10),
(35642, 1053, 0, 'Kingsblood', 0, 10),
(31992, 1053, 0, 'Liferoot', 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(2002, 5, 'Herbs in Razorfen Kraul', 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(35728, 2002, 0, 'Briarthorn', 0, 10),
(35748, 2002, 0, 'Briarthorn', 0, 10),
(35742, 2002, 0, 'Briarthorn', 0, 10),
(35738, 2002, 0, 'Briarthorn', 0, 10),
(35701, 2002, 0, 'Briarthorn', 0, 10),
(67173, 2002, 0, 'Briarthorn', 0, 10),
(35706, 2002, 0, 'Briarthorn', 0, 10),
(35695, 2002, 0, 'Fadeleaf', 0, 10),
(35702, 2002, 0, 'Fadeleaf', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(32683, 1014, 0, 'Bruiseweed', 0, 10),
(32620, 1014, 0, 'Bruiseweed', 0, 10),
(32608, 1014, 0, 'Stranglekelp', 0, 10),
(32613, 1014, 0, 'Stranglekelp', 0, 10),
(32616, 1014, 0, 'Stranglekelp', 0, 10),
(32690, 1014, 0, 'Stranglekelp', 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(2003, 5, 'Herbs in Razorfen Downs', 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(32051, 2003, 0, 'Grave Moss', 0, 10),
(32060, 2003, 0, 'Grave Moss', 0, 10),
(32055, 2003, 0, 'Grave Moss', 0, 10),
(32053, 2003, 0, 'Grave Moss', 0, 10),
(32054, 2003, 0, 'Goldthorn', 0, 10),
(32050, 2003, 0, 'Goldthorn', 0, 10),
(32052, 2003, 0, 'Arthas Tears', 0, 10),
(35669, 2003, 0, 'Arthas Tears', 0, 10),
(32028, 2003, 0, 'Arthas Tears', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(11871, 1054, 0, 'Kingsblood', 0, 10),
(11873, 1054, 0, 'Grave Moss', 0, 10),
(11880, 1054, 0, 'Liferoot', 0, 10),
(11904, 1054, 0, 'Liferoot', 0, 10),
(11900, 1054, 0, 'Fadeleaf', 0, 10),
(32251, 1054, 0, 'Fadeleaf', 0, 10),
(11878, 1054, 0, 'Goldthorn', 0, 10),
(11879, 1054, 0, 'Goldthorn', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(28715, 1035, 0, 'Sungrass', 0, 10),
(28712, 1035, 0, 'Sungrass', 0, 10),
(28763, 1035, 0, 'Purple Lotus', 0, 10),
(28757, 1035, 0, 'Purple Lotus', 0, 10),
(28761, 1035, 0, 'Purple Lotus', 0, 10),
(28711, 1035, 0, 'Mountain Silversage', 0, 10),
(28714, 1035, 0, 'Mountain Silversage', 0, 10),
(28756, 1035, 0, 'Mountain Silversage', 0, 10),
(28713, 1035, 0, 'Mountain Silversage', 0, 10),
(28718, 1035, 0, 'Golden Sansam', 0, 10),
(28758, 1035, 0, 'Golden Sansam', 0, 10),
(28755, 1035, 0, 'Golden Sansam', 0, 10),
(28716, 1035, 0, 'Golden Sansam', 0, 10),
(28717, 1035, 0, 'Golden Sansam', 0, 10),
(28759, 1035, 0, 'Dreamfoil', 0, 10),
(28760, 1035, 0, 'Dreamfoil', 0, 10),
(28762, 1035, 0, 'Dreamfoil', 0, 10),
(28710, 1035, 0, 'Dreamfoil', 0, 10),
(28709, 1035, 0, 'Dreamfoil', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(32924, 34902, 0, 'Stranglekelp', 0, 10),
(32926, 34902, 0, 'Stranglekelp', 0, 10),
(32925, 34902, 0, 'Stranglekelp', 0, 10),
(32923, 34902, 0, 'Blindweed', 0, 10),
(32919, 34902, 0, 'Blindweed', 0, 10),
(32927, 34902, 0, 'Blindweed', 0, 10);

-- Correct Some Pools
UPDATE `pool_template` SET `description`='Mageroyal in Stonetalon' WHERE  `entry`=1082;
DELETE FROM `pool_gameobject` WHERE  `guid`=918;
DELETE FROM `pool_gameobject` WHERE  `guid`=689;
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(918, 1031, 0, 'Silverleaf', 0, 10),
(689, 1031, 0, 'Silverleaf', 0, 10);

-- Remove More Duplicates
DELETE FROM `gameobject` WHERE `guid` IN (22142, 66946, 374522, 3838, 46549, 84108, 84109, 84112, 84108, 84109, 84112, 7461, 7529, 7491, 8207, 8506, 8242, 8854, 8028, 7989, 4397, 4361, 4311, 4279, 4317, 46550, 1260, 971, 1189, 699, 1102, 999, 1164, 1050, 11007, 691, 1400, 1356, 1450, 1517, 1721, 1711, 1561, 1516, 1385, 1415, 1533, 1720, 2421, 2105, 2491, 2325, 2519, 2453, 2403, 2481, 65838, 65839, 65840, 65841, 65842, 65843, 65844, 65845, 65846, 65847, 65848, 65849, 65850, 65851, 65852, 65853, 65854, 65855, 65856, 65857, 65858, 65859, 65860, 65861, 65862, 65863, 65864, 45284, 45275, 55008, 45241, 65828, 65829, 65830, 65831, 65832, 65833, 65834, 65835, 65836, 65837, 2585, 2560, 2874, 2629, 2653, 2862, 2632, 2573, 3016, 3506, 3439, 3439, 3253, 3480, 3308, 3427, 3816, 3792, 1981, 1915, 2034, 7554, 7676, 4433, 42129, 20104, 19975, 15935, 15847, 16063, 3998253, 3998244, 3998254, 3998250, 3998252, 3998144, 3998205, 3998221, 3998194);
DELETE FROM `pool_gameobject` WHERE `guid` IN (22142, 66946, 374522, 3838, 46549, 84108, 84109, 84112, 84108, 84109, 84112, 7461, 7529, 7491, 8207, 8506, 8242, 8854, 8028, 7989, 4397, 4361, 4311, 4279, 4317, 46550, 1260, 971, 1189, 699, 1102, 999, 1164, 1050, 11007, 691, 1400, 1356, 1450, 1517, 1721, 1711, 1561, 1516, 1385, 1415, 1533, 1720, 2421, 2105, 2491, 2325, 2519, 2453, 2403, 2481, 65838, 65839, 65840, 65841, 65842, 65843, 65844, 65845, 65846, 65847, 65848, 65849, 65850, 65851, 65852, 65853, 65854, 65855, 65856, 65857, 65858, 65859, 65860, 65861, 65862, 65863, 65864, 45284, 45275, 55008, 45241, 65828, 65829, 65830, 65831, 65832, 65833, 65834, 65835, 65836, 65837, 2585, 2560, 2874, 2629, 2653, 2862, 2632, 2573, 3016, 3506, 3439, 3439, 3253, 3480, 3308, 3427, 3816, 3792, 1981, 1915, 2034, 7554, 7676, 4433, 42129, 20104, 19975, 15935, 15847, 16063, 3998253, 3998244, 3998254, 3998250, 3998252, 3998144, 3998205, 3998221, 3998194);

-- Correct Some Descriptions
UPDATE `pool_gameobject` SET `description`='Peacebloom' WHERE  `guid` IN (55751, 55880);
UPDATE `pool_gameobject` SET `description`='Briarthorn' WHERE  `guid`=55891;
UPDATE `pool_gameobject` SET `description`='Kingsblood' WHERE  `guid`=56016;
UPDATE `pool_gameobject` SET `description`='Stranglekelp' WHERE  `guid` IN (56046, 55992, 55964, 55919, 55918, 55917);
UPDATE `pool_gameobject` SET `description`='Liferoot' WHERE  `guid` IN (56031, 56030, 56007, 56005, 55959, 55956, 55953);
UPDATE `pool_template` SET `description`='Blindweed in Ungoro' WHERE  `entry`=1216;
UPDATE `pool_template` SET `description`='Herbs in Dire Maul' WHERE  `entry`=4291;
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `id` IN (176642, 180164, 180165, 180166, 180167, 180168, 1621, 3729);
DELETE FROM `pool_template` WHERE  `entry`=1125;
UPDATE `pool_gameobject` SET `description` = 'Khadgars Whisker' WHERE `guid` IN (
7065,
7078,
7103,
7115,
7162,
7163,
7185,
7201,
7205,
7226,
7244,
7283,
7327,
7332,
7333,
7346,
7347,
7839,
7843,
7852,
7863,
7864,
7876,
7882,
7883,
7888,
7889,
7897,
7903,
7907,
7918,
7920,
7935,
7950,
7952,
7963,
7964,
7965,
7973,
7978,
7987,
8007,
8008,
8011,
8016,
8023,
8025,
8027,
8052,
8088,
8093,
8099,
8105,
8115,
8121,
8124,
8129,
8134,
8163,
8173,
8185,
11443,
11446,
11452,
11490,
11639,
11674,
11681,
11682,
11699,
11760,
11807,
11971,
12056,
12717,
12846,
13630,
13693,
14601,
14613,
14943,
16793,
16797,
16798,
16905,
16907,
16916,
16939,
16942,
21227,
29246,
29251,
29269,
29527,
29535,
30610,
30624,
30808,
30830,
31141,
32068,
32198,
32200,
32210,
32211,
32503,
32840,
34961,
35029,
35030,
35031,
35032,
35033,
35034,
35035,
35036,
35037,
35038,
35039,
35040,
35041,
35042,
35043,
35044,
35045,
35046,
35047,
35048,
35049,
35050,
35051,
35052,
35053,
35054,
35055,
35056,
35057,
35058,
35059,
35060,
35061,
35062,
35063,
35064,
35065,
35066,
35067,
35068,
35069,
35070,
35071,
35072,
35073,
35074,
35075,
35076,
35077,
35078,
35079,
35080,
35081,
35082,
35083,
35084,
35085,
35086,
35087,
35088,
35089,
35090,
35091,
35092,
35093,
35094,
35095,
35096,
35097,
35098,
35099,
35100,
35101,
35102,
35103,
35104,
35105,
35106,
35107,
35108,
35109,
35110,
35111,
35112,
35113,
35114,
35115,
35116,
35117,
35118,
35119,
35120,
35121,
35122,
35123,
35124,
35125,
35126,
35127,
35128,
35129,
35130,
35131,
35132,
35133,
35134,
35135,
35136,
35137,
35138,
35139,
35140,
35141,
35142,
35143,
35144,
35145,
35146,
35147,
35148,
35149,
35150,
35151,
35152,
35153,
35154,
35155,
35156,
35157,
35158,
35159,
35160,
35161,
35162,
35163,
35574,
40828,
46253,
46281,
48476,
48477,
48478,
48479,
50216,
50217,
50218,
50219,
50220,
50221,
50222,
50223,
50225,
50226,
50227,
50228,
50229,
55934,
55958,
56008,
56014,
56019,
56029,
56060,
58277,
58278,
58279,
58280,
58281,
58282,
58283,
58284,
58285,
58286,
58287,
58288,
58289,
58290,
58291,
58292,
58293,
58294,
58295,
58296,
58297,
58298,
58299,
58300,
58301,
58302,
58303,
58304,
58305,
58306,
58307,
58308,
58309,
58310,
58311,
58312,
58313,
58314,
58315,
58316,
58317,
58318,
58319,
58320,
58321,
58322,
58323,
58324,
58325,
66947,
66958,
170107);

-- Update Counters
UPDATE `pool_template` SET `max_limit`=15 WHERE  `entry`=1259;
UPDATE `pool_template` SET `max_limit`=15 WHERE  `entry`=1266;
UPDATE `pool_template` SET `max_limit`=7 WHERE  `entry`=1226;
UPDATE `pool_template` SET `max_limit`=43 WHERE  `entry`=1307;
UPDATE `pool_template` SET `max_limit`=28 WHERE  `entry`=1113;
UPDATE `pool_template` SET `max_limit`=26 WHERE  `entry`=1109;
UPDATE `pool_template` SET `max_limit`=18 WHERE  `entry`=1100;
UPDATE `pool_template` SET `max_limit`=16 WHERE  `entry`=1165;
UPDATE `pool_template` SET `max_limit`=25 WHERE  `entry`=1151;
UPDATE `pool_template` SET `max_limit`=22 WHERE  `entry`=1050;
UPDATE `pool_template` SET `max_limit`=28 WHERE  `entry`=1046;
UPDATE `pool_template` SET `max_limit`=64 WHERE  `entry`=1037;
UPDATE `pool_template` SET `max_limit`=19 WHERE  `entry`=1073;
UPDATE `pool_template` SET `max_limit`=19 WHERE  `entry`=1126;
UPDATE `pool_template` SET `max_limit`=16 WHERE  `entry`=1115;
UPDATE `pool_template` SET `max_limit`=22 WHERE  `entry`=1110;
UPDATE `pool_template` SET `max_limit`=7 WHERE  `entry`=1101;
UPDATE `pool_template` SET `max_limit`=7 WHERE  `entry`=1164;
UPDATE `pool_template` SET `max_limit`=19 WHERE  `entry`=1150;
UPDATE `pool_template` SET `max_limit`=4 WHERE  `entry`=1056;
UPDATE `pool_template` SET `max_limit`=20 WHERE  `entry`=1048;
UPDATE `pool_template` SET `max_limit`=9 WHERE  `entry`=1047;
UPDATE `pool_template` SET `max_limit`=36 WHERE  `entry`=1036;
UPDATE `pool_template` SET `max_limit`=15 WHERE  `entry`=1133;
UPDATE `pool_template` SET `max_limit`=22 WHERE  `entry`=1072;
UPDATE `pool_template` SET `max_limit`=13 WHERE  `entry`=1137;
UPDATE `pool_template` SET `max_limit`=34 WHERE  `entry`=1086;
UPDATE `pool_template` SET `max_limit`=18 WHERE  `entry`=1267;
UPDATE `pool_template` SET `max_limit`=13 WHERE  `entry`=1228;
UPDATE `pool_template` SET `max_limit`=19 WHERE  `entry`=1242;
UPDATE `pool_template` SET `max_limit`=9 WHERE  `entry`=1301;
UPDATE `pool_template` SET `max_limit`=16 WHERE  `entry`=1124;
UPDATE `pool_template` SET `max_limit`=15 WHERE  `entry`=1105;
UPDATE `pool_template` SET `max_limit`=11 WHERE  `entry`=1094;
UPDATE `pool_template` SET `max_limit`=3 WHERE  `entry`=1160;
UPDATE `pool_template` SET `max_limit`=9 WHERE  `entry`=1040;
UPDATE `pool_template` SET `max_limit`=25 WHERE  `entry`=1029;
UPDATE `pool_template` SET `max_limit`=19 WHERE  `entry`=1025;
UPDATE `pool_template` SET `max_limit`=18 WHERE  `entry`=1021;
UPDATE `pool_template` SET `max_limit`=22 WHERE  `entry`=1001;
UPDATE `pool_template` SET `max_limit`=25 WHERE  `entry`=1005;
UPDATE `pool_template` SET `max_limit`=19 WHERE  `entry`=1011;
UPDATE `pool_template` SET `max_limit`=21 WHERE  `entry`=1016;
UPDATE `pool_template` SET `max_limit`=11 WHERE  `entry`=1172;
UPDATE `pool_template` SET `max_limit`=9 WHERE  `entry`=1183;
UPDATE `pool_template` SET `max_limit`=7 WHERE  `entry`=1071;
UPDATE `pool_template` SET `max_limit`=7 WHERE  `entry`=1311;
UPDATE `pool_template` SET `max_limit`=15 WHERE  `entry`=1328;
UPDATE `pool_template` SET `max_limit`=8 WHERE  `entry`=1276;
UPDATE `pool_template` SET `max_limit`=31 WHERE  `entry`=1291;
UPDATE `pool_template` SET `max_limit`=6 WHERE  `entry`=1281;
UPDATE `pool_template` SET `max_limit`=36 WHERE  `entry`=1208;
UPDATE `pool_template` SET `max_limit`=12 WHERE  `entry`=1247;
UPDATE `pool_template` SET `max_limit`=4 WHERE  `entry`=2001;
UPDATE `pool_template` SET `max_limit`=7 WHERE  `entry`=1253;
UPDATE `pool_template` SET `max_limit`=5 WHERE  `entry`=1268;
UPDATE `pool_template` SET `max_limit`=6 WHERE  `entry`=1230;
UPDATE `pool_template` SET `max_limit`=22 WHERE  `entry`=1241;
UPDATE `pool_template` SET `max_limit`=18 WHERE  `entry`=1214;
UPDATE `pool_template` SET `max_limit`=46 WHERE  `entry`=1174;
UPDATE `pool_template` SET `max_limit`=36 WHERE  `entry`=1191;
UPDATE `pool_template` SET `max_limit`=12 WHERE  `entry`=1249;
UPDATE `pool_template` SET `max_limit`=22 WHERE  `entry`=1181;
UPDATE `pool_template` SET `max_limit`=17 WHERE  `entry`=1058;
UPDATE `pool_template` SET `max_limit`=21 WHERE  `entry`=1103;
UPDATE `pool_template` SET `max_limit`=6 WHERE  `entry`=1283;
UPDATE `pool_template` SET `max_limit`=15 WHERE  `entry`=1313;
UPDATE `pool_template` SET `max_limit`=6 WHERE  `entry`=105;
UPDATE `pool_template` SET `max_limit`=10 WHERE  `entry`=107;
UPDATE `pool_template` SET `max_limit`=13 WHERE  `entry`=1275;
UPDATE `pool_template` SET `max_limit`=12 WHERE  `entry`=1225;
UPDATE `pool_template` SET `max_limit`=6 WHERE  `entry`=1143;
UPDATE `pool_template` SET `max_limit`=2 WHERE  `entry`=1327;
UPDATE `pool_template` SET `max_limit`=62 WHERE  `entry`=1236;
UPDATE `pool_template` SET `max_limit`=38 WHERE  `entry`=1173;
UPDATE `pool_template` SET `max_limit`=28 WHERE  `entry`=1189;
UPDATE `pool_template` SET `max_limit`=16 WHERE  `entry`=1182;
UPDATE `pool_template` SET `max_limit`=11 WHERE  `entry`=1059;
UPDATE `pool_template` SET `max_limit`=19 WHERE  `entry`=1102;
UPDATE `pool_template` SET `max_limit`=14 WHERE  `entry`=1309;
UPDATE `pool_template` SET `max_limit`=5 WHERE  `entry`=1055;
UPDATE `pool_template` SET `max_limit`=28 WHERE  `entry`=1155;
UPDATE `pool_template` SET `max_limit`=40 WHERE  `entry`=1170;
UPDATE `pool_template` SET `max_limit`=16 WHERE  `entry`=1180;
UPDATE `pool_template` SET `max_limit`=12 WHERE  `entry`=1057;
UPDATE `pool_template` SET `max_limit`=21 WHERE  `entry`=1051;
UPDATE `pool_template` SET `max_limit`=11 WHERE  `entry`=1039;
UPDATE `pool_template` SET `max_limit`=19 WHERE  `entry`=1038;
UPDATE `pool_template` SET `max_limit`=23 WHERE  `entry`=1078;
UPDATE `pool_template` SET `max_limit`=11 WHERE  `entry`=1138;
UPDATE `pool_template` SET `max_limit`=26 WHERE  `entry`=1088;
UPDATE `pool_template` SET `max_limit`=19 WHERE  `entry`=1153;
UPDATE `pool_template` SET `max_limit`=33 WHERE  `entry`=1179;
UPDATE `pool_template` SET `max_limit`=7 WHERE  `entry`=1193;
UPDATE `pool_template` SET `max_limit`=5 WHERE  `entry`=1251;
UPDATE `pool_template` SET `max_limit`=7 WHERE  `entry`=1184;
UPDATE `pool_template` SET `max_limit`=7 WHERE  `entry`=1063;
UPDATE `pool_template` SET `max_limit`=28 WHERE  `entry`=1104;
UPDATE `pool_template` SET `max_limit`=8 WHERE  `entry`=1144;
UPDATE `pool_template` SET `max_limit`=17 WHERE  `entry`=1317;
UPDATE `pool_template` SET `max_limit`=10 WHERE  `entry`=1325;
UPDATE `pool_template` SET `max_limit`=3 WHERE  `entry`=998;
UPDATE `pool_template` SET `max_limit`=12 WHERE  `entry`=1306;
UPDATE `pool_template` SET `max_limit`=9 WHERE  `entry`=1116;
UPDATE `pool_template` SET `max_limit`=25 WHERE  `entry`=1108;
UPDATE `pool_template` SET `max_limit`=24 WHERE  `entry`=1097;
UPDATE `pool_template` SET `max_limit`=21 WHERE  `entry`=1163;
UPDATE `pool_template` SET `max_limit`=17 WHERE  `entry`=1154;
UPDATE `pool_template` SET `max_limit`=26 WHERE  `entry`=1043;
UPDATE `pool_template` SET `max_limit`=73 WHERE  `entry`=1032;
UPDATE `pool_template` SET `max_limit`=6 WHERE  `entry`=1023;
UPDATE `pool_template` SET `max_limit`=11 WHERE  `entry`=1077;
UPDATE `pool_template` SET `max_limit`=7 WHERE  `entry`=1082;
UPDATE `pool_template` SET `max_limit`=8 WHERE  `entry`=1004;
UPDATE `pool_template` SET `max_limit`=14 WHERE  `entry`=1269;
UPDATE `pool_template` SET `max_limit`=5 WHERE  `entry`=1222;
UPDATE `pool_template` SET `max_limit`=26 WHERE  `entry`=1237;
UPDATE `pool_template` SET `max_limit`=13 WHERE  `entry`=1243;
UPDATE `pool_template` SET `max_limit`=18 WHERE  `entry`=1218;
UPDATE `pool_template` SET `max_limit`=11 WHERE  `entry`=1302;
UPDATE `pool_template` SET `max_limit`=7 WHERE  `entry`=401;
UPDATE `pool_template` SET `max_limit`=2 WHERE  `entry`=402;
UPDATE `pool_template` SET `max_limit`=35 WHERE  `entry`=1030;
UPDATE `pool_template` SET `max_limit`=33 WHERE  `entry`=1020;
UPDATE `pool_template` SET `max_limit`=36 WHERE  `entry`=1002;
UPDATE `pool_template` SET `max_limit`=36 WHERE  `entry`=1006;
UPDATE `pool_template` SET `max_limit`=33 WHERE  `entry`=1017;
UPDATE `pool_template` SET `max_limit`=37 WHERE  `entry`=1258;
UPDATE `pool_template` SET `max_limit`=60 WHERE  `entry`=1265;
UPDATE `pool_template` SET `max_limit`=20 WHERE  `entry`=1227;
UPDATE `pool_template` SET `max_limit`=12 WHERE  `entry`=1199;
UPDATE `pool_template` SET `max_limit`=26 WHERE  `entry`=1254;
UPDATE `pool_template` SET `max_limit`=25 WHERE  `entry`=1239;
UPDATE `pool_template` SET `max_limit`=3 WHERE  `entry`=1305;
UPDATE `pool_template` SET `max_limit`=19 WHERE  `entry`=1205;
UPDATE `pool_template` SET `max_limit`=23 WHERE  `entry`=1324;
UPDATE `pool_template` SET `max_limit`=15 WHERE  `entry`=1095;
UPDATE `pool_template` SET `max_limit`=26 WHERE  `entry`=1042;
UPDATE `pool_template` SET `max_limit`=28 WHERE  `entry`=1031;
UPDATE `pool_template` SET `max_limit`=39 WHERE  `entry`=1027;
UPDATE `pool_template` SET `max_limit`=34 WHERE  `entry`=1022;
UPDATE `pool_template` SET `max_limit`=41 WHERE  `entry`=1003;
UPDATE `pool_template` SET `max_limit`=47 WHERE  `entry`=1007;
UPDATE `pool_template` SET `max_limit`=39 WHERE  `entry`=1018;
UPDATE `pool_template` SET `max_limit`=17 WHERE  `entry`=1122;
UPDATE `pool_template` SET `max_limit`=38 WHERE  `entry`=1149;
UPDATE `pool_template` SET `max_limit`=45 WHERE  `entry`=1171;
UPDATE `pool_template` SET `max_limit`=8 WHERE  `entry`=1190;
UPDATE `pool_template` SET `max_limit`=21 WHERE  `entry`=1123;
UPDATE `pool_template` SET `max_limit`=9 WHERE  `entry`=1065;
UPDATE `pool_template` SET `max_limit`=19 WHERE  `entry`=1064;
UPDATE `pool_template` SET `max_limit`=22 WHERE  `entry`=1076;
UPDATE `pool_template` SET `max_limit`=15 WHERE  `entry`=1145;
UPDATE `pool_template` SET `max_limit`=26 WHERE  `entry`=1322;
UPDATE `pool_template` SET `max_limit`=1 WHERE  `entry`=1323;
UPDATE `pool_template` SET `max_limit`=5 WHERE  `entry`=43522;
UPDATE `pool_template` SET `max_limit`=12 WHERE  `entry`=1000;
UPDATE `pool_template` SET `max_limit`=14 WHERE  `entry`=984;
UPDATE `pool_template` SET `max_limit`=3 WHERE  `entry`=996;
UPDATE `pool_template` SET `max_limit`=42 WHERE  `entry`=1192;
UPDATE `pool_template` SET `max_limit`=24 WHERE  `entry`=1250;
UPDATE `pool_template` SET `max_limit`=9 WHERE  `entry`=1261;
UPDATE `pool_template` SET `max_limit`=7 WHERE  `entry`=1277;
UPDATE `pool_template` SET `max_limit`=4 WHERE  `entry`=1229;
UPDATE `pool_template` SET `max_limit`=21 WHERE  `entry`=1240;
UPDATE `pool_template` SET `max_limit`=15 WHERE  `entry`=1215;
UPDATE `pool_template` SET `max_limit`=8 WHERE  `entry`=1320;
UPDATE `pool_template` SET `max_limit`=4 WHERE  `entry`=1223;
UPDATE `pool_template` SET `max_limit`=10 WHERE  `entry`=1062;
UPDATE `pool_template` SET `max_limit`=13 WHERE  `entry`=1152;
UPDATE `pool_template` SET `max_limit`=29 WHERE  `entry`=1169;
UPDATE `pool_template` SET `max_limit`=22 WHERE  `entry`=1185;
UPDATE `pool_template` SET `max_limit`=9 WHERE  `entry`=1168;
UPDATE `pool_template` SET `max_limit`=13 WHERE  `entry`=1134;
UPDATE `pool_template` SET `max_limit`=5 WHERE  `entry`=1081;
UPDATE `pool_template` SET `max_limit`=2 WHERE  `entry`=1142;
UPDATE `pool_template` SET `max_limit`=26 WHERE  `entry`=1085;
UPDATE `pool_template` SET `max_limit`=6 WHERE  `entry`=1084;
UPDATE `pool_template` SET `max_limit`=10 WHERE  `entry`=1209;
UPDATE `pool_template` SET `max_limit`=13 WHERE  `entry`=4291;
UPDATE `pool_template` SET `max_limit`=22 WHERE  `entry`=34902;
UPDATE `pool_template` SET `max_limit`=8 WHERE  `entry`=2002;
UPDATE `pool_template` SET `max_limit`=11 WHERE  `entry`=1053;
UPDATE `pool_template` SET `max_limit`=19 WHERE  `entry`=1054;
UPDATE `pool_template` SET `max_limit`=7 WHERE  `entry`=1014;
UPDATE `pool_template` SET `max_limit`=30 WHERE  `entry`=1035;
UPDATE `pool_template` SET `max_limit`=11 WHERE  `entry`=2003;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
