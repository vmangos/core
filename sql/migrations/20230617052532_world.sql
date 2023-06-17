DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230617052532');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230617052532');
-- Add your query below.


-- Plaguebloom (176587, 176641)
SET @OGUID = 57698;

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
(@OGUID+1, 176587, 0, 1673.49, -2277.09, 59.161, 5.42797, 0, 0, -0.414693, 0.909961, 300, 300, 1, 100, 0, 10), 
(@OGUID+2, 176587, 0, 1639.55, -2259.62, 59.2509, 2.11185, 0, 0, 0.870356, 0.492424, 300, 300, 1, 100, 0, 10), 
(@OGUID+3, 176587, 0, 1095.73, -2526.41, 61.4232, 6.24828, 0, 0, -0.0174522, 0.999848, 300, 300, 1, 100, 0, 10), 
(@OGUID+4, 176587, 0, 1423.88, -1886.62, 59.7396, 2.16421, 0, 0, 0.882947, 0.469473, 300, 300, 1, 100, 0, 10), 
(@OGUID+5, 176587, 0, 1943.64, -1904.94, 75.7893, 5.3058, 0, 0, -0.469471, 0.882948, 300, 300, 1, 100, 0, 10), 
(@OGUID+6, 176587, 0, 1501.36, -1822.75, 60.3359, 5.96903, 0, 0, -0.156434, 0.987688, 300, 300, 1, 100, 0, 10), 
(@OGUID+7, 176587, 0, 1208, -2550.61, 73.0816, 5.16618, 0, 0, -0.529919, 0.848048, 300, 300, 1, 100, 0, 10), 
(@OGUID+8, 176587, 0, 1238.8, -2549.02, 92.0041, 5.63741, 0, 0, -0.317305, 0.948324, 300, 300, 1, 100, 0, 10), 
(@OGUID+9, 176587, 0, 1861.09, -2010.82, 83.83, 4.10153, 0, 0, -0.887011, 0.461749, 300, 300, 1, 100, 0, 10), 
(@OGUID+10, 176587, 0, 1769.25, -2311.86, 60.0036, 4.86947, 0, 0, -0.649447, 0.760406, 300, 300, 1, 100, 0, 10), 
(@OGUID+11, 176587, 0, 1497.6, -1860.78, 58.628, 2.86234, 0, 0, 0.990268, 0.139175, 300, 300, 1, 100, 0, 10), 
(@OGUID+12, 176587, 0, 1814.54, -1161.08, 60.4921, 3.85718, 0, 0, -0.936671, 0.35021, 300, 300, 1, 100, 0, 10), 
(@OGUID+13, 176587, 0, 2160.22, -2457.96, 64.21, 5.81195, 0, 0, -0.233445, 0.97237, 300, 300, 1, 100, 0, 10), 
(@OGUID+14, 176587, 0, 1752.43, -1226.08, 59.6435, 3.00195, 0, 0, 0.997563, 0.0697661, 300, 300, 1, 100, 0, 10), 
(@OGUID+15, 176587, 0, 2237.28, -1541.57, 78.802, 1.62316, 0, 0, 0.725374, 0.688355, 300, 300, 1, 100, 0, 10), 
(@OGUID+16, 176587, 0, 1834.97, -2172.85, 66.8352, 3.94445, 0, 0, -0.920505, 0.390732, 300, 300, 1, 100, 0, 10), 
(@OGUID+17, 176587, 0, 2345.16, -1587.58, 109.385, 5.42797, 0, 0, -0.414693, 0.909961, 300, 300, 1, 100, 0, 10), 
(@OGUID+18, 176587, 0, 1890.2, -1756.4, 61.7958, 2.63544, 0, 0, 0.968147, 0.250381, 300, 300, 1, 100, 0, 10), 
(@OGUID+19, 176587, 0, 2028.71, -2379.53, 61.8859, 3.194, 0, 0, -0.999657, 0.0262016, 300, 300, 1, 100, 0, 10), 
(@OGUID+20, 176587, 0, 1028.51, -1703.57, 62.7305, 0.776715, 0, 0, 0.378669, 0.925532, 300, 300, 1, 100, 0, 10),
(@OGUID+21, 176587, 0, 1086.53, -1867.01, 62.745, 0.49343, 0, 0, 0.24422, 0.96972, 300, 300, 1, 100, 0, 10),
(@OGUID+22, 176587, 0, 1087.1, -1121.8, 78.8244, 6.25233, 0, 0, -0.0154295, 0.999881, 300, 300, 1, 100, 0, 10),
(@OGUID+23, 176587, 0, 1097.77, -1287.56, 61.6154, 4.03607, 0, 0, -0.901645, 0.432478, 300, 300, 1, 100, 0, 10),
(@OGUID+24, 176587, 0, 1113.77, -1883.22, 60.8971, 5.33608, 0, 0, -0.456053, 0.889953, 300, 300, 1, 100, 0, 10),
(@OGUID+25, 176587, 0, 1141.38, -1178.33, 65.492, 4.46098, 0, 0, -0.79018, 0.612875, 300, 300, 1, 100, 0, 10),
(@OGUID+26, 176587, 0, 1159.13, -2530.25, 61.1132, 5.02655, 0, 0, -0.587785, 0.809017, 300, 300, 1, 100, 0, 10),
(@OGUID+27, 176587, 0, 1177.89, -1058.01, 78.2658, 4.40159, 0, 0, -0.808029, 0.589143, 300, 300, 1, 100, 0, 10),
(@OGUID+28, 176587, 0, 1189.84, -1780.12, 61.4257, 0.666216, 0, 0, 0.326982, 0.945031, 300, 300, 1, 100, 0, 10),
(@OGUID+29, 176587, 0, 1220.14, -1334.62, 53.3612, 5.59745, 0, 0, -0.33619, 0.941794, 300, 300, 1, 100, 0, 10),
(@OGUID+30, 176587, 0, 1235.68, -1750.07, 61.9271, 4.35286, 0, 0, -0.822143, 0.569282, 300, 300, 1, 100, 0, 10),
(@OGUID+31, 176587, 0, 1240.96, -1496.09, 58.7353, 2.11324, 0, 0, 0.870699, 0.491816, 300, 300, 1, 100, 0, 10),
(@OGUID+32, 176587, 0, 1416.38, -1510.47, 56.0101, 5.59745, 0, 0, -0.33619, 0.941794, 300, 300, 1, 100, 0, 10),
(@OGUID+33, 176587, 0, 1439.76, -1658.07, 69.8183, 5.59745, 0, 0, -0.33619, 0.941794, 300, 300, 1, 100, 0, 10),
(@OGUID+34, 176587, 0, 1447.51, -1359.73, 60.8375, 5.59745, 0, 0, -0.33619, 0.941794, 300, 300, 1, 100, 0, 10),
(@OGUID+35, 176587, 0, 1452.47, -1089.07, 70.8289, 4.89631, 0, 0, -0.639184, 0.769054, 300, 300, 1, 100, 0, 10),
(@OGUID+36, 176587, 0, 1495.01, -1228.02, 61.0839, 5.691, 0, 0, -0.291785, 0.956484, 300, 300, 1, 100, 0, 10),
(@OGUID+37, 176587, 0, 1499.5, -1181.05, 72.821, 5.89797, 0, 0, -0.191421, 0.981508, 300, 300, 1, 100, 0, 10),
(@OGUID+38, 176587, 0, 1518.6, -1265.74, 55.8567, 2.20082, 0, 0, 0.891394, 0.45323, 300, 300, 1, 100, 0, 10),
(@OGUID+39, 176587, 0, 1519.64, -1843.35, 61.2472, 4.92183, 0, 0, -0.62932, 0.777146, 300, 300, 1, 100, 0, 10),
(@OGUID+40, 176587, 0, 1546.88, -1248.69, 58.5634, 5.41061, 0, 0, -0.422577, 0.906327, 300, 300, 1, 100, 0, 10),
(@OGUID+41, 176587, 0, 1559.67, -1321.86, 61.1078, 2.51112, 0, 0, 0.950723, 0.310043, 300, 300, 1, 100, 0, 10),
(@OGUID+42, 176587, 0, 1559.86, -1048.06, 71.5523, 0.925101, 0, 0, 0.446232, 0.894917, 300, 300, 1, 100, 0, 10),
(@OGUID+43, 176587, 0, 1561.39, -1117.5, 70.7611, 5.66283, 0, 0, -0.305229, 0.952279, 300, 300, 1, 100, 0, 10),
(@OGUID+44, 176587, 0, 1575.84, -1292.09, 66.3214, 5.85682, 0, 0, -0.211574, 0.977362, 300, 300, 1, 100, 0, 10),
(@OGUID+45, 176587, 0, 1576.99, -1083.78, 71.2836, 0, 0, 0, 0, 1, 300, 300, 1, 100, 0, 10),
(@OGUID+46, 176587, 0, 1581.82, -1130.16, 68.3846, 5.41662, 0, 0, -0.41985, 0.907593, 300, 300, 1, 100, 0, 10),
(@OGUID+47, 176587, 0, 1584.09, -1218.74, 69.8783, 0.696199, 0, 0, 0.341112, 0.940023, 300, 300, 1, 100, 0, 10),
(@OGUID+48, 176587, 0, 1621.57, -1697.08, 60.3542, 1.23585, 0, 0, 0.579344, 0.815083, 300, 300, 1, 100, 0, 10),
(@OGUID+49, 176587, 0, 1633.97, -1783.98, 59.9916, 0.997525, 0, 0, 0.478339, 0.878175, 300, 300, 1, 100, 0, 10),
(@OGUID+50, 176587, 0, 1661.24, -1686.8, 59.9268, 6.27504, 0, 0, -0.00407124, 0.999992, 300, 300, 1, 100, 0, 10),
(@OGUID+51, 176587, 0, 1685.84, -2089.81, 64.0013, 1.86758, 0, 0, 0.80388, 0.594792, 300, 300, 1, 100, 0, 10),
(@OGUID+52, 176587, 0, 1701.48, -2219.41, 59.4933, 0.837757, 0, 0, 0.406736, 0.913546, 300, 300, 1, 100, 0, 10),
(@OGUID+53, 176587, 0, 1745.31, -1346.37, 61.187, 5.67079, 0, 0, -0.301434, 0.953487, 300, 300, 1, 100, 0, 10),
(@OGUID+54, 176587, 0, 1779.36, -1187.77, 60.3535, 3.78737, 0, 0, -0.948323, 0.317306, 300, 300, 1, 100, 0, 10),
(@OGUID+55, 176587, 0, 1785.91, -2446.28, 61.966, 3.64774, 0, 0, -0.968147, 0.250381, 300, 300, 1, 100, 0, 10),
(@OGUID+56, 176587, 0, 1835.43, -1642.28, 60.4431, 1.41372, 0, 0, 0.649447, 0.760406, 300, 300, 1, 100, 0, 10),
(@OGUID+57, 176587, 0, 1837.29, -1573.28, 59.0019, 4.92183, 0, 0, -0.62932, 0.777146, 300, 300, 1, 100, 0, 10),
(@OGUID+58, 176587, 0, 1848.76, -2112.37, 68.2124, 1.57171, 0, 0, 0.707429, 0.706784, 300, 300, 1, 100, 0, 10),
(@OGUID+59, 176587, 0, 1887.29, -1580.29, 59.4747, 3.85718, 0, 0, -0.936671, 0.35021, 300, 300, 1, 100, 0, 10);

-- Missing Plaguebloom spawns in Eastern Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+60, 176587, 0, 1680.81, -3853.04, 133.434, 0.733038, 0, 0, 0.358368, 0.93358, 300, 300, 1, 100, 0, 10), 
(@OGUID+61, 176587, 0, 2832.67, -4743.53, 77.3118, 0.471238, 0, 0, 0.233445, 0.97237, 300, 300, 1, 100, 0, 10), 
(@OGUID+62, 176587, 0, 3411.95, -4953.78, 164.461, 4.08407, 0, 0, -0.891006, 0.453991, 300, 300, 1, 100, 0, 10), 
(@OGUID+63, 176587, 0, 1577.75, -4618.21, 85.1723, 1.98967, 0, 0, 0.83867, 0.54464, 300, 300, 1, 100, 0, 10), 
(@OGUID+64, 176587, 0, 1626.86, -3243.33, 85.542, 2.00713, 0, 0, 0.843391, 0.5373, 300, 300, 1, 100, 0, 10), 
(@OGUID+65, 176587, 0, 1852.03, -3815.96, 136.994, 1.0821, 0, 0, 0.515038, 0.857168, 300, 300, 1, 100, 0, 10), 
(@OGUID+66, 176587, 0, 2483.69, -4265.49, 74.3489, 1.62316, 0, 0, 0.725374, 0.688355, 300, 300, 1, 100, 0, 10), 
(@OGUID+67, 176587, 0, 3021.44, -4038.53, 103.952, 2.74016, 0, 0, 0.979924, 0.19937, 300, 300, 1, 100, 0, 10), 
(@OGUID+68, 176587, 0, 3113.64, -3780.52, 130.505, 2.79252, 0, 0, 0.984807, 0.173652, 300, 300, 1, 100, 0, 10), 
(@OGUID+69, 176587, 0, 2158.7, -4345.31, 75.9694, 2.67035, 0, 0, 0.972369, 0.233448, 300, 300, 1, 100, 0, 10), 
(@OGUID+70, 176587, 0, 1744.66, -4339.93, 77.6948, 6.21337, 0, 0, -0.0348988, 0.999391, 300, 300, 1, 100, 0, 10), 
(@OGUID+71, 176587, 0, 1878.36, -4847.95, 107.496, 3.73501, 0, 0, -0.956305, 0.292372, 300, 300, 1, 100, 0, 10), 
(@OGUID+72, 176587, 0, 1649.55, -3722.11, 119.535, 1.46608, 0, 0, 0.66913, 0.743145, 300, 300, 1, 100, 0, 10), 
(@OGUID+73, 176587, 0, 1960.5, -5018.98, 76.7022, 0.663223, 0, 0, 0.325567, 0.945519, 300, 300, 1, 100, 0, 10), 
(@OGUID+74, 176587, 0, 2020.2, -3652.82, 128.096, 2.53072, 0, 0, 0.953716, 0.300708, 300, 300, 1, 100, 0, 10), 
(@OGUID+75, 176587, 0, 2274.09, -4297.45, 74.1448, 5.58505, 0, 0, -0.34202, 0.939693, 300, 300, 1, 100, 0, 10), 
(@OGUID+76, 176587, 0, 3192.28, -3585.68, 146.257, 4.59022, 0, 0, -0.748956, 0.66262, 300, 300, 1, 100, 0, 10), 
(@OGUID+77, 176587, 0, 2777.31, -3226.03, 105.933, 2.46091, 0, 0, 0.942641, 0.333808, 300, 300, 1, 100, 0, 10), 
(@OGUID+78, 176587, 0, 3236.68, -4728.21, 157.185, 2.74016, 0, 0, 0.979924, 0.19937, 300, 300, 1, 100, 0, 10), 
(@OGUID+79, 176587, 0, 2453.32, -3760.32, 177.514, 2.54818, 0, 0, 0.956305, 0.292372, 300, 300, 1, 100, 0, 10), 
(@OGUID+80, 176587, 0, 2067.59, -3926.66, 133.094, 4.20625, 0, 0, -0.861629, 0.507539, 300, 300, 1, 100, 0, 10), 
(@OGUID+81, 176587, 0, 2815.06, -5441.11, 158.186, 1.0821, 0, 0, 0.515038, 0.857168, 300, 300, 1, 100, 0, 10), 
(@OGUID+82, 176587, 0, 2645, -5522.47, 158.436, 0.349065, 0, 0, 0.173648, 0.984808, 300, 300, 1, 100, 0, 10), 
(@OGUID+83, 176587, 0, 2727.14, -5479.72, 161.22, 2.00713, 0, 0, 0.843391, 0.5373, 300, 300, 1, 100, 0, 10), 
(@OGUID+84, 176587, 0, 2689.53, -5363.66, 157.824, 0.942477, 0, 0, 0.45399, 0.891007, 300, 300, 1, 100, 0, 10), 
(@OGUID+85, 176587, 0, 1784.86, -4176.54, 86.9041, 0.663223, 0, 0, 0.325567, 0.945519, 300, 300, 1, 100, 0, 10), 
(@OGUID+86, 176587, 0, 2818.86, -4592.9, 90.6468, 4.59022, 0, 0, -0.748956, 0.66262, 300, 300, 1, 100, 0, 10), 
(@OGUID+87, 176587, 0, 1708.37, -4802.04, 84.4106, 5.61996, 0, 0, -0.325567, 0.945519, 300, 300, 1, 100, 0, 10), 
(@OGUID+88, 176587, 0, 2758.57, -5373.56, 156.996, 3.6652, 0, 0, -0.965925, 0.258821, 300, 300, 1, 100, 0, 10), 
(@OGUID+89, 176587, 0, 2009.09, -2985.9, 77.9653, 2.53072, 0, 0, 0.953716, 0.300708, 300, 300, 1, 100, 0, 10), 
(@OGUID+90, 176587, 0, 2453.53, -3656.75, 177.802, 5.35816, 0, 0, -0.446198, 0.894935, 300, 300, 1, 100, 0, 10), 
(@OGUID+91, 176587, 0, 1855.35, -4576.7, 79.0182, 5.2709, 0, 0, -0.484809, 0.87462, 300, 300, 1, 100, 0, 10), 
(@OGUID+92, 176587, 0, 2115.63, -4873.79, 74.8908, 1.50098, 0, 0, 0.681998, 0.731354, 300, 300, 1, 100, 0, 10), 
(@OGUID+93, 176587, 0, 2937.81, -4292.18, 90.3692, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 1, 100, 0, 10), 
(@OGUID+94, 176587, 0, 2147.51, -2717.23, 74.2392, 0.837757, 0, 0, 0.406736, 0.913546, 300, 300, 1, 100, 0, 10), 
(@OGUID+95, 176587, 0, 1620.04, -3080.32, 76.4986, 2.68625, 0, 0, 0.974195, 0.22571, 300, 300, 1, 100, 0, 10),
(@OGUID+96, 176587, 0, 1631.9, -3616.87, 112.763, 1.86628, 0, 0, 0.803493, 0.595314, 300, 300, 1, 100, 0, 10),
(@OGUID+97, 176587, 0, 1656.12, -3119.97, 86.8754, 1.2842, 0, 0, 0.59888, 0.800839, 300, 300, 1, 100, 0, 10),
(@OGUID+98, 176587, 0, 1674.43, -3545.49, 126.405, 0, 0, 0, 0, 1, 300, 300, 1, 100, 0, 10),
(@OGUID+99, 176587, 0, 1761.89, -4743.4, 77.9261, 2.60375, 0, 0, 0.964058, 0.265692, 300, 300, 1, 100, 0, 10),
(@OGUID+100, 176587, 0, 1789.97, -3547.67, 121.78, 4.02898, 0, 0, -0.903172, 0.42928, 300, 300, 1, 100, 0, 10),
(@OGUID+101, 176587, 0, 1890.52, -4443.94, 78.2775, 1.40651, 0, 0, 0.646704, 0.762741, 300, 300, 1, 100, 0, 10),
(@OGUID+102, 176587, 0, 1891.52, -3494.16, 112.042, 0.783327, 0, 0, 0.381726, 0.924275, 300, 300, 1, 100, 0, 10),
(@OGUID+103, 176587, 0, 1894.58, -3235.96, 119.528, 0.279252, 0, 0, 0.139173, 0.990268, 300, 300, 1, 100, 0, 10),
(@OGUID+104, 176587, 0, 1907.31, -3503.06, 110.467, 0.488691, 0, 0, 0.241921, 0.970296, 300, 300, 1, 100, 0, 10),
(@OGUID+105, 176587, 0, 1941.2, -4263.26, 83.2624, 3.90804, 0, 0, -0.927464, 0.373911, 300, 300, 1, 100, 0, 10),
(@OGUID+106, 176587, 0, 1946.92, -4494.56, 75.7824, 0.76297, 0, 0, 0.372299, 0.928113, 300, 300, 1, 100, 0, 10),
(@OGUID+107, 176587, 0, 1947.94, -3658.45, 124.892, 1.46143, 0, 0, 0.667402, 0.744697, 300, 300, 1, 100, 0, 10),
(@OGUID+108, 176587, 0, 1989.78, -4066.59, 85.9721, 3.54302, 0, 0, -0.979924, 0.19937, 300, 300, 1, 100, 0, 10),
(@OGUID+109, 176587, 0, 1994.41, -4520.73, 75.6213, 0.420901, 0, 0, 0.2089, 0.977937, 300, 300, 1, 100, 0, 10),
(@OGUID+110, 176587, 0, 2012.49, -4831.26, 82.7848, 4.69357, 0, 0, -0.71373, 0.700421, 300, 300, 1, 100, 0, 10),
(@OGUID+111, 176587, 0, 2037.85, -4473.02, 74.7746, 4.62, 0, 0, -0.739004, 0.673701, 300, 300, 1, 100, 0, 10),
(@OGUID+112, 176587, 0, 2039.58, -4445.27, 74.1907, 2.64402, 0, 0, 0.969213, 0.246226, 300, 300, 1, 100, 0, 10),
(@OGUID+113, 176587, 0, 2042.98, -5205.61, 84.7182, 4.4157, 0, 0, -0.803851, 0.594831, 300, 300, 1, 100, 0, 10),
(@OGUID+114, 176587, 0, 2091.32, -5192.51, 81.4752, 4.69659, 0, 0, -0.712669, 0.7015, 300, 300, 1, 100, 0, 10),
(@OGUID+115, 176587, 0, 2111.78, -4539, 75.3911, 1.8491, 0, 0, 0.798348, 0.602196, 300, 300, 1, 100, 0, 10),
(@OGUID+116, 176587, 0, 2114.62, -5088.57, 80.1533, 4.46098, 0, 0, -0.790179, 0.612876, 300, 300, 1, 100, 0, 10),
(@OGUID+117, 176587, 0, 2166.35, -4166.44, 77.1267, 6.20864, 0, 0, -0.0372648, 0.999305, 300, 300, 1, 100, 0, 10),
(@OGUID+118, 176587, 0, 2184.77, -5190.54, 81.7401, 3.54283, 0, 0, -0.979943, 0.199277, 300, 300, 1, 100, 0, 10),
(@OGUID+119, 176587, 0, 2189.15, -4767.17, 92.7373, 4.93047, 0, 0, -0.625957, 0.779857, 300, 300, 1, 100, 0, 10),
(@OGUID+120, 176587, 0, 2200.33, -5280.47, 90.5324, 0, 0, 0, 0, 1, 300, 300, 1, 100, 0, 10),
(@OGUID+121, 176587, 0, 2238.38, -5055.69, 75.6281, 1.23089, 0, 0, 0.577324, 0.816515, 300, 300, 1, 100, 0, 10),
(@OGUID+122, 176587, 0, 2268.82, -5113.77, 77.2742, 4.69995, 0, 0, -0.711492, 0.702695, 300, 300, 1, 100, 0, 10),
(@OGUID+123, 176587, 0, 2272.37, -4773.45, 111.517, 4.46163, 0, 0, -0.78998, 0.613133, 300, 300, 1, 100, 0, 10),
(@OGUID+124, 176587, 0, 2282.43, -3562.96, 154.137, 3.71755, 0, 0, -0.958819, 0.284016, 300, 300, 1, 100, 0, 10),
(@OGUID+125, 176587, 0, 2411.96, -4427.33, 74.0722, 1.91986, 0, 0, 0.819152, 0.573577, 300, 300, 1, 100, 0, 10),
(@OGUID+126, 176587, 0, 2467.82, -4814.61, 77.5062, 3.66411, 0, 0, -0.966065, 0.258298, 300, 300, 1, 100, 0, 10),
(@OGUID+127, 176587, 0, 2537.37, -4499.34, 78.3478, 3.15906, 0, 0, -0.999962, 0.00873464, 300, 300, 1, 100, 0, 10),
(@OGUID+128, 176587, 0, 2611.49, -4381.19, 79.9559, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 1, 100, 0, 10),
(@OGUID+129, 176587, 0, 2617.41, -4910.38, 82.3329, 2.26893, 0, 0, 0.906307, 0.422619, 300, 300, 1, 100, 0, 10),
(@OGUID+130, 176587, 0, 2716.76, -4691.48, 76.8073, 0.855211, 0, 0, 0.414693, 0.909961, 300, 300, 1, 100, 0, 10),
(@OGUID+131, 176587, 0, 2754, -3390.6, 91.2035, 0.855211, 0, 0, 0.414693, 0.909961, 300, 300, 1, 100, 0, 10),
(@OGUID+132, 176587, 0, 2813.84, -3678, 104.815, 0.0174525, 0, 0, 0.00872612, 0.999962, 300, 300, 1, 100, 0, 10),
(@OGUID+133, 176587, 0, 2930.5, -4491.75, 92.8297, 2.59309, 0, 0, 0.962628, 0.270826, 300, 300, 1, 100, 0, 10),
(@OGUID+134, 176587, 0, 3009.24, -4187.49, 94.5654, 5.11382, 0, 0, -0.551936, 0.833886, 300, 300, 1, 100, 0, 10),
(@OGUID+135, 176587, 0, 3036.82, -3270.26, 144.908, 0.599137, 0, 0, 0.295108, 0.955464, 300, 300, 1, 100, 0, 10),
(@OGUID+136, 176587, 0, 3104.87, -3972.7, 110.676, 0.488691, 0, 0, 0.241921, 0.970296, 300, 300, 1, 100, 0, 10),
(@OGUID+137, 176587, 0, 3120.71, -3058.46, 133.354, 3.12412, 0, 0, 0.999962, 0.00873464, 300, 300, 1, 100, 0, 10),
(@OGUID+138, 176587, 0, 3140.44, -3679.26, 133.914, 2.33874, 0, 0, 0.920505, 0.390732, 300, 300, 1, 100, 0, 10),
(@OGUID+139, 176587, 0, 3285.81, -4861.64, 170.945, 0.558504, 0, 0, 0.275637, 0.961262, 300, 300, 1, 100, 0, 10),
(@OGUID+140, 176587, 0, 2019.04, -4695.94, 91.3082, 2.9496, 0, 0, 0.995396, 0.0958512, 300, 300, 1, 100, 0, 10); 

-- Missing Plaguebloom spawns in Felwood.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+141, 176641, 1, 4204.94, -1031.77, 293.272, 4.81711, 0, 0, -0.66913, 0.743145, 1800, 1800, 1, 100, 0, 10),
(@OGUID+142, 176641, 1, 6679.51, -1323.44, 467.133, 3.26377, 0, 0, -0.998135, 0.0610518, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+143, 176641, 1, 6306.93, -856.434, 416.503, 2.02458, 0, 0, 0.848047, 0.529921, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+144, 176641, 1, 4623.66, -883.974, 321.067, 5.79449, 0, 0, -0.241921, 0.970296, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+145, 176641, 1, 5540.28, -740.778, 341.768, 5.2709, 0, 0, -0.484809, 0.87462, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+146, 176641, 1, 4513.95, -767.927, 262.422, 5.75959, 0, 0, -0.258819, 0.965926, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+147, 176641, 1, 6263.24, -1076.29, 373.896, 4.04917, 0, 0, -0.898793, 0.438373, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+148, 176641, 1, 6419.71, -1623.33, 482.022, 3.4034, 0, 0, -0.991445, 0.130528, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+149, 176641, 1, 4630.22, -670.115, 259.879, 0.59341, 0, 0, 0.292371, 0.956305, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+150, 176641, 1, 4460.42, -669.337, 268.7, 2.42601, 0, 0, 0.936672, 0.350207, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+151, 176641, 1, 5222.93, -781.834, 345.815, 0.837757, 0, 0, 0.406736, 0.913546, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+152, 176641, 1, 4049.45, -1216.91, 279.827, 4.32842, 0, 0, -0.829037, 0.559194, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+153, 176641, 1, 4452.15, -933.014, 310.124, 5.93412, 0, 0, -0.173648, 0.984808, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+154, 176641, 1, 4348.48, -675.812, 270.243, 0.226892, 0, 0, 0.113203, 0.993572, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+155, 176641, 1, 4974.86, -553.669, 332.864, 4.69494, 0, 0, -0.71325, 0.70091, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+156, 176641, 1, 6852.51, -1816.94, 563.876, 0.401425, 0, 0, 0.199368, 0.979925, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+157, 176641, 1, 6416.68, -1347.35, 377.708, 5.18363, 0, 0, -0.522498, 0.85264, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+158, 176641, 1, 5644.48, -674.997, 343.131, 4.11898, 0, 0, -0.882947, 0.469473, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+159, 176641, 1, 4886.47, -781, 296.668, 1.48353, 0, 0, 0.67559, 0.737278, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+160, 176641, 1, 3667.74, -1439.07, 182.799, 0.436332, 0, 0, 0.216439, 0.976296, 300, 300, 1, 100, 0, 10),
(@OGUID+161, 176641, 1, 3921.51, -618.069, 340.333, 3.49067, 0, 0, -0.984807, 0.173652, 300, 300, 1, 100, 0, 10),
(@OGUID+162, 176641, 1, 3926.56, -1617.91, 264.133, 5.60251, 0, 0, -0.333807, 0.942641, 300, 300, 1, 100, 0, 10),
(@OGUID+163, 176641, 1, 3974.46, -890.846, 269.99, 3.35105, 0, 0, -0.994521, 0.104536, 300, 300, 1, 100, 0, 10),
(@OGUID+164, 176641, 1, 4136.16, -708.367, 282.032, 0.95993, 0, 0, 0.461748, 0.887011, 300, 300, 1, 100, 0, 10),
(@OGUID+165, 176641, 1, 4343.3, -591.783, 265.205, 1.27409, 0, 0, 0.594822, 0.803857, 300, 300, 1, 100, 0, 10),
(@OGUID+166, 176641, 1, 4493.51, -564.449, 289.21, 4.11898, 0, 0, -0.882947, 0.469473, 300, 300, 1, 100, 0, 10),
(@OGUID+167, 176641, 1, 5490.02, -846.46, 360.329, 6.05629, 0, 0, -0.113203, 0.993572, 300, 300, 1, 100, 0, 10),
(@OGUID+168, 176641, 1, 5553.3, -919.271, 377.671, 1.3439, 0, 0, 0.622514, 0.782609, 300, 300, 1, 100, 0, 10),
(@OGUID+169, 176641, 1, 5649.91, -1113.43, 381.096, 1.32645, 0, 0, 0.615661, 0.788011, 300, 300, 1, 100, 0, 10),
(@OGUID+170, 176641, 1, 5691.41, -717.777, 376.673, 0.680677, 0, 0, 0.333806, 0.942642, 300, 300, 1, 100, 0, 10),
(@OGUID+171, 176641, 1, 5883.98, -1280.45, 408.559, 1.32645, 0, 0, 0.615661, 0.788011, 300, 300, 1, 100, 0, 10),
(@OGUID+172, 176641, 1, 6042.52, -1123.21, 388.022, 0.663223, 0, 0, 0.325567, 0.945519, 300, 300, 1, 100, 0, 10),
(@OGUID+173, 176641, 1, 6146.19, -1916.72, 575.18, 0.523598, 0, 0, 0.258819, 0.965926, 300, 300, 1, 100, 0, 10),
(@OGUID+174, 176641, 1, 6180.81, -1159.71, 370.023, 0.733038, 0, 0, 0.358368, 0.93358, 300, 300, 1, 100, 0, 10),
(@OGUID+175, 176641, 1, 6217.16, -1618.61, 475.595, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 1, 100, 0, 10),
(@OGUID+176, 176641, 1, 6585.48, -1452.25, 453.583, 2.9845, 0, 0, 0.996917, 0.0784664, 300, 300, 1, 100, 0, 10),
(@OGUID+177, 176641, 1, 6708.46, -1532.55, 474.694, 0.349065, 0, 0, 0.173648, 0.984808, 300, 300, 1, 100, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+2, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+3, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+4, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+5, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+6, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+7, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+8, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+9, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+10, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+11, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+12, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+13, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+14, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+15, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+16, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+17, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+18, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+19, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+20, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+21, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+22, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+23, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+24, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+25, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+26, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+27, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+28, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+29, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+30, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+31, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+32, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+33, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+34, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+35, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+36, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+37, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+38, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+39, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+40, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+41, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+42, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+43, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+44, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+45, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+46, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+47, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+48, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+49, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+50, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+51, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+52, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+53, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+54, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+55, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+56, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+57, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+58, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+59, 1258, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Western Plaguelands 74 objects total
(@OGUID+60, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+61, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+62, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+63, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+64, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+65, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+66, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+67, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+68, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+69, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+70, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+71, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+72, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+73, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+74, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+75, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+76, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+77, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+78, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+79, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+80, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+81, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+82, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+83, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+84, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+85, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+86, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+87, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+88, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+89, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+90, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+91, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+92, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+93, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+94, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+95, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+96, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+97, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+98, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+99, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+100, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+101, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+102, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+103, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+104, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+105, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+106, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+107, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+108, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+109, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+110, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+111, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+112, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+113, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+114, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+115, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+116, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+117, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+118, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+119, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+120, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+121, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+122, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+123, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+124, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+125, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+126, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+127, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+128, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+129, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+130, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+131, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+132, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+133, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+134, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+135, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+136, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+137, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+138, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+139, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+140, 1265, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Eastern Plaguelands 144 objects total
(@OGUID+141, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(@OGUID+142, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(@OGUID+143, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(@OGUID+144, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(@OGUID+145, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(@OGUID+146, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(@OGUID+147, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(@OGUID+148, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(@OGUID+149, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(@OGUID+150, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(@OGUID+151, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(@OGUID+152, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(@OGUID+153, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(@OGUID+154, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(@OGUID+155, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(@OGUID+156, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(@OGUID+157, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(@OGUID+158, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(@OGUID+159, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(@OGUID+160, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(@OGUID+161, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(@OGUID+162, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(@OGUID+163, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(@OGUID+164, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(@OGUID+165, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(@OGUID+166, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(@OGUID+167, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(@OGUID+168, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(@OGUID+169, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(@OGUID+170, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(@OGUID+171, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(@OGUID+172, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(@OGUID+173, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(@OGUID+174, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(@OGUID+175, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(@OGUID+176, 1227, 0, 'Plaguebloom', 0, 10), -- Plagueblooms in Felwood
(@OGUID+177, 1227, 0, 'Plaguebloom', 0, 10); -- Plagueblooms in Felwood

-- Correct Pools
UPDATE `pool_template` SET `description`='Plaguebloom in Eastern Plaguelands' WHERE  `entry`=1265;
UPDATE `pool_template` SET `description`='Plaguebloom in Felwood' WHERE  `entry`=1227;
UPDATE `pool_template` SET `description`='Plaguebloom in Western Plaguelands' WHERE  `entry`=1258;

-- Remove Custom Spawns (Non of these spawns exist in the sniff-db)
DELETE FROM `gameobject` WHERE `guid` IN (19929, 19914, 20083, 20032, 19955, 19874, 19875, 19876, 19877, 19878, 19879, 19880, 19881, 19882, 19883, 19884, 19887, 19888, 19889, 19890, 19891, 19892, 19893, 19895, 19896, 19897, 19898, 19900, 19902, 19904, 19906, 19907, 19908, 19909, 19911, 19912, 19913, 19915, 19916, 19918, 19919, 19920, 19921, 19922, 19924, 19925, 19926, 19928, 19930, 19931, 19932, 19933, 19934, 19935, 19936, 19937, 19938, 19939, 19941, 19942, 19943, 19944, 19945, 19947, 19949, 19951, 19953, 19954, 19956, 19957, 19958, 19959, 19961, 19962, 19963, 19964, 19965, 19966, 19967, 19968, 19973, 19974, 19976, 19977, 19978, 19979, 19982, 19983, 19984, 19985, 19986, 19987, 19988, 19989, 19990, 19991, 19993, 19995, 19996, 19998, 19999, 20000, 20001, 20002, 20003, 20004, 20005, 20006, 20007, 20008, 20010, 20011, 20012, 20014, 20015, 20016, 20017, 20018, 20020, 20021, 20022, 20024, 20026, 20027, 20028, 20029, 20031, 20033, 20034, 20035, 20036, 20037, 20038, 20040, 20042, 20043, 20044, 20045, 20046, 20047, 20048, 20049, 20050, 20051, 20052, 20053, 20054, 20055, 20056, 20057, 20058, 20059, 20060, 20061, 20062, 20063, 20064, 20065, 20066, 20067, 20068, 20070, 20071, 20072, 20073, 20074, 20075, 20076, 20078, 20079, 20080, 20081, 20082, 20084, 20085, 20086, 20087, 20088, 20089, 20090, 20091, 20092, 20095, 20096, 20097, 20098, 20099, 20101, 20102, 20103, 20105, 20106, 20107, 20109, 20110, 20111, 20114, 20115, 20116, 20117, 20118, 20119, 20120, 20121, 20123, 20124, 20125, 20126, 20129, 20130, 20131, 20132, 20133);
DELETE FROM `pool_gameobject` WHERE `guid` IN (19929, 19914, 20083, 20032, 19955, 19874, 19875, 19876, 19877, 19878, 19879, 19880, 19881, 19882, 19883, 19884, 19887, 19888, 19889, 19890, 19891, 19892, 19893, 19895, 19896, 19897, 19898, 19900, 19902, 19904, 19906, 19907, 19908, 19909, 19911, 19912, 19913, 19915, 19916, 19918, 19919, 19920, 19921, 19922, 19924, 19925, 19926, 19928, 19930, 19931, 19932, 19933, 19934, 19935, 19936, 19937, 19938, 19939, 19941, 19942, 19943, 19944, 19945, 19947, 19949, 19951, 19953, 19954, 19956, 19957, 19958, 19959, 19961, 19962, 19963, 19964, 19965, 19966, 19967, 19968, 19973, 19974, 19976, 19977, 19978, 19979, 19982, 19983, 19984, 19985, 19986, 19987, 19988, 19989, 19990, 19991, 19993, 19995, 19996, 19998, 19999, 20000, 20001, 20002, 20003, 20004, 20005, 20006, 20007, 20008, 20010, 20011, 20012, 20014, 20015, 20016, 20017, 20018, 20020, 20021, 20022, 20024, 20026, 20027, 20028, 20029, 20031, 20033, 20034, 20035, 20036, 20037, 20038, 20040, 20042, 20043, 20044, 20045, 20046, 20047, 20048, 20049, 20050, 20051, 20052, 20053, 20054, 20055, 20056, 20057, 20058, 20059, 20060, 20061, 20062, 20063, 20064, 20065, 20066, 20067, 20068, 20070, 20071, 20072, 20073, 20074, 20075, 20076, 20078, 20079, 20080, 20081, 20082, 20084, 20085, 20086, 20087, 20088, 20089, 20090, 20091, 20092, 20095, 20096, 20097, 20098, 20099, 20101, 20102, 20103, 20105, 20106, 20107, 20109, 20110, 20111, 20114, 20115, 20116, 20117, 20118, 20119, 20120, 20121, 20123, 20124, 20125, 20126, 20129, 20130, 20131, 20132, 20133);

-- Sync Gobject Data
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300, `spawn_flags` = 0, `animprogress` = 100 WHERE `id` IN (176641, 176587);

-- Update Counters
UPDATE `pool_template` SET `max_limit`=35 WHERE  `entry`=1258;
UPDATE `pool_template` SET `max_limit`=52 WHERE  `entry`=1265;
UPDATE `pool_template` SET `max_limit`=16 WHERE  `entry`=1227;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
