DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230610085513');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230610085513');
-- Add your query below.


-- Earthroot (1619, 3726)
SET @OGUID = 27675;

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
(@OGUID+1, 1619, 0, -5733.56, -1774.67, 401.658, 4.97419, 0, 0, -0.608761, 0.793354, 300, 300, 1, 100, 0, 10), 
(@OGUID+2, 1619, 0, -5719.87, -1606.49, 384.292, 4.90438, 0, 0, -0.636078, 0.771625, 300, 300, 1, 100, 0, 10), 
(@OGUID+3, 1619, 0, -5745.33, -1616.57, 363.214, 6.0912, 0, 0, -0.0958452, 0.995396, 300, 300, 1, 100, 0, 10), 
(@OGUID+4, 1619, 0, -5521.32, -1671.8, 399.031, 2.3911, 0, 0, 0.930417, 0.366502, 300, 300, 1, 100, 0, 10), 
(@OGUID+5, 1619, 0, -5656.49, -1614.88, 384.717, 4.08407, 0, 0, -0.891006, 0.453991, 300, 300, 1, 100, 0, 10), 
(@OGUID+6, 1619, 0, -5678.3, -1469.82, 405.582, 2.58308, 0, 0, 0.961261, 0.27564, 300, 300, 1, 100, 0, 10), 
(@OGUID+7, 1619, 0, -5630.62, -1352.33, 400.876, 5.39307, 0, 0, -0.430511, 0.902586, 300, 300, 1, 100, 0, 10), 
(@OGUID+8, 1619, 0, -5531.93, -1579.99, 403.146, 2.96704, 0, 0, 0.996194, 0.087165, 300, 300, 1, 100, 0, 10), 
(@OGUID+9, 1619, 0, -5854.08, -933.5, 409.683, 2.58308, 0, 0, 0.961261, 0.27564, 300, 300, 1, 100, 0, 10), 
(@OGUID+10, 1619, 0, -5731.78, -1090.68, 389.659, 3.21142, 0, 0, -0.999391, 0.0349061, 300, 300, 1, 100, 0, 10),  
(@OGUID+11, 1619, 0, -5838.34, -1653.31, 358.806, 3.56047, 0, 0, -0.978148, 0.207912, 300, 300, 1, 100, 0, 10), 
(@OGUID+12, 1619, 0, -5768, -1224.3, 379.924, 1.6057, 0, 0, 0.719339, 0.694659, 300, 300, 1, 100, 0, 10), 
(@OGUID+13, 1619, 0, -5686.64, -1627.61, 383.204, 0.90757, 0, 0, 0.438371, 0.898794, 300, 300, 1, 100, 0, 10);

-- Missing Earthroot spawns in Elwynn Forest.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+14, 1619, 0, -9764.79, -505.546, 38.3915, 0.383971, 0, 0, 0.190808, 0.981627, 300, 300, 1, 100, 0, 10), 
(@OGUID+15, 1619, 0, -9125.45, -647.984, 83.9311, 1.37881, 0, 0, 0.636078, 0.771625, 300, 300, 1, 100, 0, 10), 
(@OGUID+16, 1619, 0, -9287.4, 530.653, 87.7495, 5.68977, 0, 0, -0.292372, 0.956305, 300, 300, 1, 100, 0, 10), 
(@OGUID+17, 1619, 0, -8778.77, -729.493, 105.662, 0.383971, 0, 0, 0.190808, 0.981627, 300, 300, 1, 100, 0, 10), 
(@OGUID+18, 1619, 0, -8964.49, -682.498, 87.1403, 3.52557, 0, 0, -0.981627, 0.190812, 300, 300, 1, 100, 0, 10), 
(@OGUID+19, 1619, 0, -9011.51, -693.176, 96.236, 0.977383, 0, 0, 0.469471, 0.882948, 300, 300, 1, 100, 0, 10), 
(@OGUID+20, 1619, 0, -9679.7, -1220.33, 46.5051, 4.46804, 0, 0, -0.788011, 0.615662, 300, 300, 1, 100, 0, 10), 
(@OGUID+21, 1619, 0, -8737.64, -856.766, 105.149, 3.14159, 0, 0, -1, 0, 300, 300, 1, 100, 0, 10), 
(@OGUID+22, 1619, 0, -9044.25, -761.559, 100.335, 1.44862, 0, 0, 0.66262, 0.748956, 300, 300, 1, 100, 0, 10), 
(@OGUID+23, 1619, 0, -9436.08, 556.346, 70.3439, 2.63544, 0, 0, 0.968147, 0.250381, 300, 300, 1, 100, 0, 10), 
(@OGUID+24, 1619, 0, -9889.92, -225.995, 41.3389, 3.35105, 0, 0, -0.994521, 0.104536, 300, 300, 1, 100, 0, 10), 
(@OGUID+25, 1619, 0, -8777.18, -1119.31, 85.4837, 5.77704, 0, 0, -0.25038, 0.968148, 300, 300, 1, 100, 0, 10),  
(@OGUID+26, 1619, 0, -9923.33, -223.854, 48.9006, 2.96704, 0, 0, 0.996194, 0.087165, 300, 300, 1, 100, 0, 10), 
(@OGUID+27, 1619, 0, -9902.2, -205.827, 39.8754, 3.75246, 0, 0, -0.953716, 0.300708, 300, 300, 1, 100, 0, 10), 
(@OGUID+28, 1619, 0, -9902.19, -205.828, 39.8754, 3.75246, 0, 0, -0.953716, 0.300708, 300, 300, 1, 100, 0, 10);

-- Missing Earthroot spawns in Durotar.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+29, 1619, 1, 944.289, -4952.16, 10.0468, 3.87463, 0, 0, -0.93358, 0.358368, 300, 300, 1, 100, 0, 10), 
(@OGUID+30, 1619, 1, -861.296, -4725.5, 28.7156, 2.32129, 0, 0, 0.91706, 0.39875, 300, 300, 1, 100, 0, 10), 
(@OGUID+31, 1619, 1, 159.863, -3927.96, 45.6035, 1.43117, 0, 0, 0.656058, 0.75471, 300, 300, 1, 100, 0, 10), 
(@OGUID+32, 1619, 1, -734.752, -4977.03, 22.2292, 6.07375, 0, 0, -0.104528, 0.994522, 300, 300, 1, 100, 0, 10), 
(@OGUID+33, 1619, 1, 944.376, -4231.94, -6.23417, 1.36136, 0, 0, 0.62932, 0.777146, 300, 300, 1, 100, 0, 10), 
(@OGUID+34, 1619, 1, 574.81, -4254.14, 14.1797, 0.610863, 0, 0, 0.300705, 0.953717, 300, 300, 1, 100, 0, 10), 
(@OGUID+35, 1619, 1, -460.157, -4712.15, 37.342, 5.67232, 0, 0, -0.300705, 0.953717, 300, 300, 1, 100, 0, 10), 
(@OGUID+36, 1619, 1, -114.458, -3897.58, 44.0153, 0.785397, 0, 0, 0.382683, 0.92388, 300, 300, 1, 100, 0, 10), 
(@OGUID+37, 1619, 1, 191.52, -4436.94, 33.9087, 1.02974, 0, 0, 0.492423, 0.870356, 300, 300, 1, 100, 0, 10), 
(@OGUID+38, 1619, 1, 225.312, -4230.02, 41.828, 4.53786, 0, 0, -0.766044, 0.642789, 300, 300, 1, 100, 0, 10), 
(@OGUID+39, 1619, 1, 34.8251, -4923.91, 13.5517, 0, 0, 0, 0, 1, 300, 300, 1, 100, 0, 10), 
(@OGUID+40, 1619, 1, 934.805, -3918.83, 19.6192, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 1, 100, 0, 10),  
(@OGUID+41, 1619, 1, 942.257, -4404.73, 18.4526, 0.383971, 0, 0, 0.190808, 0.981627, 300, 300, 1, 100, 0, 10);

-- Missing Earthroot spawns in Loch Modan.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+42, 1619, 0, -5469.14, -2707.13, 373.47, 5.41052, 0, 0, -0.422618, 0.906308, 300, 300, 1, 100, 0, 10), 
(@OGUID+43, 1619, 0, -5995.92, -2776.57, 410.39, 2.51327, 0, 0, 0.951056, 0.309017, 300, 300, 1, 100, 0, 10),  
(@OGUID+44, 1619, 0, -5573.65, -2896.35, 381.659, 2.04204, 0, 0, 0.85264, 0.522499, 300, 300, 1, 100, 0, 10), 
(@OGUID+45, 1619, 0, -4914.74, -2601.18, 328.96, 5.88176, 0, 0, -0.199368, 0.979925, 300, 300, 1, 100, 0, 10);

-- Missing Earthroot spawns in Westfall.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+46, 1619, 0, -10666.7, 1987.77, 34.5242, 3.57793, 0, 0, -0.976295, 0.216442, 300, 300, 1, 100, 0, 10), 
(@OGUID+47, 1619, 0, -10529.2, 2043.47, 36.7139, 5.48033, 0, 0, -0.390731, 0.920505, 300, 300, 1, 100, 0, 10), 
(@OGUID+48, 1619, 0, -9699.69, 1070.95, 24.5274, 3.54302, 0, 0, -0.979924, 0.19937, 300, 300, 1, 100, 0, 10), 
(@OGUID+49, 1619, 0, -11292.6, 1869.2, 37.1779, 5.93412, 0, 0, -0.173648, 0.984808, 300, 300, 1, 100, 0, 10),  
(@OGUID+50, 1619, 0, -11209.1, 1968.73, 21.1431, 0.541051, 0, 0, 0.267238, 0.963631, 300, 300, 1, 100, 0, 10), 
(@OGUID+51, 1619, 0, -9910.94, 1728.46, 30.7695, 5.23599, 0, 0, -0.5, 0.866025, 300, 300, 1, 100, 0, 10), 
(@OGUID+52, 1619, 0, -9745.69, 1255, 39.7788, 3.26377, 0, 0, -0.998135, 0.0610518, 300, 300, 1, 100, 0, 10);

-- Missing Earthroot spawns in Redridge Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+53, 1619, 0, -8993.99, -2544.28, 142.519, 4.45059, 0, 0, -0.793353, 0.608762, 300, 300, 1, 100, 0, 10), 
(@OGUID+54, 1619, 0, -8746.71, -2382.45, 158.531, 4.71239, 0, 0, -0.707107, 0.707107, 300, 300, 1, 100, 0, 10), 
(@OGUID+55, 1619, 0, -9339.2, -3063.91, 136.63, 1.97222, 0, 0, 0.833885, 0.551938, 300, 300, 1, 100, 0, 10), 
(@OGUID+56, 1619, 0, -9736.36, -3215.23, 58.7968, 3.59538, 0, 0, -0.97437, 0.224951, 300, 300, 1, 100, 0, 10), 
(@OGUID+57, 1619, 0, -9311.69, -3428.08, 104.76, 1.46608, 0, 0, 0.66913, 0.743145, 300, 300, 1, 100, 0, 10), 
(@OGUID+58, 1619, 0, -9125.74, -3186.11, 113.986, 2.3911, 0, 0, 0.930417, 0.366502, 300, 300, 1, 100, 0, 10), 
(@OGUID+59, 1619, 0, -9803.82, -2286.89, 63.6404, 0.890117, 0, 0, 0.430511, 0.902586, 300, 300, 1, 100, 0, 10), 
(@OGUID+60, 1619, 0, -9643.69, -2959.21, 59.7454, 2.26893, 0, 0, 0.906307, 0.422619, 300, 300, 1, 100, 0, 10), 
(@OGUID+61, 1619, 0, -9784.99, -2981.42, 94.4874, 4.4855, 0, 0, -0.782608, 0.622515, 300, 300, 1, 100, 0, 10), 
(@OGUID+62, 1619, 0, -8784.66, -2475.44, 136.705, 6.17847, 0, 0, -0.0523357, 0.99863, 300, 300, 1, 100, 0, 10), 
(@OGUID+63, 1619, 0, -8878.36, -2197.7, 143.024, 3.4383, 0, 0, -0.989016, 0.147811, 300, 300, 1, 100, 0, 10),  
(@OGUID+64, 1619, 0, -9611.12, -2718.37, 58.1685, 4.41568, 0, 0, -0.803857, 0.594823, 300, 300, 1, 100, 0, 10), 
(@OGUID+65, 1619, 0, -9430.68, -1904.9, 93.3589, 5.14872, 0, 0, -0.537299, 0.843392, 300, 300, 1, 100, 0, 10), 
(@OGUID+66, 1619, 0, -9319.15, -3281.53, 99.8038, 1.98967, 0, 0, 0.83867, 0.54464, 300, 300, 1, 100, 0, 10), 
(@OGUID+67, 1619, 0, -9285.61, -2814.08, 88.9416, 4.53786, 0, 0, -0.766044, 0.642789, 300, 300, 1, 100, 0, 10), 
(@OGUID+68, 1619, 0, -9102.29, -2008.52, 133.007, 4.17134, 0, 0, -0.870356, 0.492424, 300, 300, 1, 100, 0, 10), 
(@OGUID+69, 1619, 0, -9044.6, -2388.38, 131.419, 0.645772, 0, 0, 0.317305, 0.948324, 300, 300, 1, 100, 0, 10);

-- Missing Earthroot spawns in Tirisfal Glades.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+70, 1619, 0, 2585.16, 1369.27, 7.36252, 3.90954, 0, 0, -0.927183, 0.374608, 300, 300, 1, 100, 0, 10), 
(@OGUID+71, 1619, 0, 2444.71, 1443.39, 36.0942, 0.977383, 0, 0, 0.469471, 0.882948, 300, 300, 1, 100, 0, 10), 
(@OGUID+72, 1619, 0, 1572.23, -683.486, 54.7838, 2.9496, 0, 0, 0.995396, 0.0958512, 300, 300, 1, 100, 0, 10), 
(@OGUID+73, 1619, 0, 2667.74, -578.889, 106.293, 5.34071, 0, 0, -0.45399, 0.891007, 300, 300, 1, 100, 0, 10),  
(@OGUID+74, 1619, 0, 2285.42, -1092.11, 82.5132, 3.97935, 0, 0, -0.913545, 0.406738, 300, 300, 1, 100, 0, 10), 
(@OGUID+75, 1619, 0, 2330.92, 211.52, 36.8418, 5.00909, 0, 0, -0.594823, 0.803857, 300, 300, 1, 100, 0, 10), 
(@OGUID+76, 1619, 0, 2660.27, -968.056, 86.388, 3.56047, 0, 0, -0.978148, 0.207912, 300, 300, 1, 100, 0, 10), 
(@OGUID+77, 1619, 0, 2667.3, 1066.87, 115.238, 4.55531, 0, 0, -0.760406, 0.649449, 300, 300, 1, 100, 0, 10);

-- Missing Earthroot spawns in Silverpine Forest.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+78, 1619, 0, -25.7078, 836.054, 78.0244, 4.71239, 0, 0, -0.707107, 0.707107, 300, 300, 1, 100, 0, 10), 
(@OGUID+79, 1619, 0, 67.4183, 640.243, 78.5119, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 1, 100, 0, 10);

-- Missing Earthroot spawns in Teldrassil.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+80, 1619, 1, 10000.7, 1646.47, 1334.52, 3.45576, 0, 0, -0.987688, 0.156436, 300, 300, 1, 100, 0, 10), 
(@OGUID+81, 1619, 1, 9675.78, 1158.03, 1279.33, 4.7822, 0, 0, -0.681998, 0.731354, 300, 300, 1, 100, 0, 10), 
(@OGUID+82, 1619, 1, 10479.9, 2025.14, 1343.85, 3.38594, 0, 0, -0.992546, 0.12187, 300, 300, 1, 100, 0, 10), 
(@OGUID+83, 1619, 1, 10245.8, 1532.83, 1332.78, 3.21142, 0, 0, -0.999391, 0.0349061, 300, 300, 1, 100, 0, 10), 
(@OGUID+84, 1619, 1, 9355.75, 1552.31, 1281.67, 2.49582, 0, 0, 0.948323, 0.317306, 300, 300, 1, 100, 0, 10), 
(@OGUID+85, 1619, 1, 9300.17, 1681.18, 1320.12, 0.872664, 0, 0, 0.422618, 0.906308, 300, 300, 1, 100, 0, 10), 
(@OGUID+86, 1619, 1, 9388.27, 710.325, 1295.32, 4.5204, 0, 0, -0.771625, 0.636078, 300, 300, 1, 100, 0, 10),  
(@OGUID+87, 1619, 1, 9453.49, 619.698, 1321.92, 5.81195, 0, 0, -0.233445, 0.97237, 300, 300, 1, 100, 0, 10), 
(@OGUID+88, 1619, 1, 9777.89, 1245.07, 1293.48, 4.69494, 0, 0, -0.71325, 0.70091, 300, 300, 1, 100, 0, 10), 
(@OGUID+89, 1619, 1, 10202.1, 1773.15, 1338.03, 5.02655, 0, 0, -0.587785, 0.809017, 300, 300, 1, 100, 0, 10), 
(@OGUID+90, 1619, 1, 10491.9, 1846.27, 1324.73, 0.90757, 0, 0, 0.438371, 0.898794, 300, 300, 1, 100, 0, 10), 
(@OGUID+91, 1619, 1, 10826.1, 1799, 1344.52, 2.72271, 0, 0, 0.978148, 0.207912, 300, 300, 1, 100, 0, 10), 
(@OGUID+92, 1619, 1, 10930.9, 1772.33, 1327.66, 4.03171, 0, 0, -0.902585, 0.430512, 300, 300, 1, 100, 0, 10);

-- Missing Earthroot spawns in Darkshore.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+93, 1619, 1, 6977.43, -652.401, 69.4153, 3.29869, 0, 0, -0.996917, 0.0784664, 300, 300, 1, 100, 0, 10), 
(@OGUID+94, 1619, 1, 5189.79, 343.254, 41.3473, 1.79769, 0, 0, 0.782608, 0.622515, 300, 300, 1, 100, 0, 10), 
(@OGUID+95, 1619, 1, 7689.64, -988.655, 38.2943, 0.558504, 0, 0, 0.275637, 0.961262, 300, 300, 1, 100, 0, 10),  
(@OGUID+96, 1619, 1, 7230.73, -738.764, 54.1534, 2.37364, 0, 0, 0.927183, 0.374608, 300, 300, 1, 100, 0, 10);

-- Missing Earthroot spawns in Mulgore.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+97, 1619, 1, -2490.61, -1493.57, 61.8547, 3.78737, 0, 0, -0.948323, 0.317306, 300, 300, 1, 100, 0, 10), 
(@OGUID+98, 1619, 1, -946.452, -1151.27, 93.0153, 2.61799, 0, 0, 0.965925, 0.258821, 300, 300, 1, 100, 0, 10), 
(@OGUID+99, 1619, 1, -960.953, -1117.19, 60.7869, 5.53269, 0, 0, -0.366501, 0.930418, 300, 300, 1, 100, 0, 10), 
(@OGUID+100, 1619, 1, -1759.17, -910.335, 79.1745, 2.04204, 0, 0, 0.85264, 0.522499, 300, 300, 1, 100, 0, 10), 
(@OGUID+101, 1619, 1, -2037.5, 298.458, 126.762, 2.3911, 0, 0, 0.930417, 0.366502, 300, 300, 1, 100, 0, 10), 
(@OGUID+102, 1619, 1, -1281.1, -1042.77, 48.7105, 2.14675, 0, 0, 0.878817, 0.47716, 300, 300, 1, 100, 0, 10), 
(@OGUID+103, 1619, 1, -1664.08, 368.102, 111.681, 4.88692, 0, 0, -0.642787, 0.766045, 300, 300, 1, 100, 0, 10), 
(@OGUID+104, 1619, 1, -2735.74, -321.652, 13.0835, 1.27409, 0, 0, 0.594822, 0.803857, 300, 300, 1, 100, 0, 10),  
(@OGUID+105, 1619, 1, -2818.18, -732.171, 38.7207, 6.03884, 0, 0, -0.121869, 0.992546, 300, 300, 1, 100, 0, 10), 
(@OGUID+106, 1619, 1, -2790.54, -404.294, 13.6166, 1.25664, 0, 0, 0.587785, 0.809017, 300, 300, 1, 100, 0, 10), 
(@OGUID+107, 1619, 1, -2724.77, -621.791, 12.4038, 3.52557, 0, 0, -0.981627, 0.190812, 300, 300, 1, 100, 0, 10), 
(@OGUID+108, 1619, 1, -2566.75, 274.828, 110.127, 1.39626, 0, 0, 0.642787, 0.766045, 300, 300, 1, 100, 0, 10), 
(@OGUID+109, 1619, 1, -2511.14, 259.343, 83.7874, 0.837757, 0, 0, 0.406736, 0.913546, 300, 300, 1, 100, 0, 10), 
(@OGUID+110, 1619, 1, -2234.58, 276.564, 109.757, 1.58825, 0, 0, 0.71325, 0.70091, 300, 300, 1, 100, 0, 10), 
(@OGUID+111, 1619, 1, -2178.11, -1192.25, 40.4926, 0.296705, 0, 0, 0.147809, 0.989016, 300, 300, 1, 100, 0, 10), 
(@OGUID+112, 1619, 1, -1798.62, -1006.45, 79.0837, 4.29351, 0, 0, -0.83867, 0.54464, 300, 300, 1, 100, 0, 10), 
(@OGUID+113, 1619, 1, -1671.87, -863.447, 46.0943, 0.541051, 0, 0, 0.267238, 0.963631, 300, 300, 1, 100, 0, 10), 
(@OGUID+114, 1619, 1, -1481.25, 301.857, 42.1067, 1.44862, 0, 0, 0.66262, 0.748956, 300, 300, 1, 100, 0, 10), 
(@OGUID+115, 1619, 1, -837.577, -788.3, -0.570349, 4.39823, 0, 0, -0.809016, 0.587786, 300, 300, 1, 100, 0, 10), 
(@OGUID+116, 1619, 1, -695.509, -784.198, 54.4815, 5.00909, 0, 0, -0.594823, 0.803857, 300, 300, 1, 100, 0, 10), 
(@OGUID+117, 1619, 1, -543.733, -676.766, 52.0546, 0.226892, 0, 0, 0.113203, 0.993572, 300, 300, 1, 100, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1016, 0, 'Earthroot', 0, 10), -- Earthroots in Dun Morogh 31 objects total
(@OGUID+2, 1016, 0, 'Earthroot', 0, 10), -- Earthroots in Dun Morogh 31 objects total
(@OGUID+3, 1016, 0, 'Earthroot', 0, 10), -- Earthroots in Dun Morogh 31 objects total
(@OGUID+4, 1016, 0, 'Earthroot', 0, 10), -- Earthroots in Dun Morogh 31 objects total
(@OGUID+5, 1016, 0, 'Earthroot', 0, 10), -- Earthroots in Dun Morogh 31 objects total
(@OGUID+6, 1016, 0, 'Earthroot', 0, 10), -- Earthroots in Dun Morogh 31 objects total
(@OGUID+7, 1016, 0, 'Earthroot', 0, 10), -- Earthroots in Dun Morogh 31 objects total
(@OGUID+8, 1016, 0, 'Earthroot', 0, 10), -- Earthroots in Dun Morogh 31 objects total
(@OGUID+9, 1016, 0, 'Earthroot', 0, 10), -- Earthroots in Dun Morogh 31 objects total
(@OGUID+10, 1016, 0, 'Earthroot', 0, 10), -- Earthroots in Dun Morogh 31 objects total
(@OGUID+11, 1016, 0, 'Earthroot', 0, 10), -- Earthroots in Dun Morogh 31 objects total
(@OGUID+12, 1016, 0, 'Earthroot', 0, 10), -- Earthroots in Dun Morogh 31 objects total
(@OGUID+13, 1016, 0, 'Earthroot', 0, 10), -- Earthroots in Dun Morogh 31 objects total
(@OGUID+14, 1011, 0, 'Earthroot', 0, 10), -- Earthroots in Elwynn Forest 17 objects total
(@OGUID+15, 1011, 0, 'Earthroot', 0, 10), -- Earthroots in Elwynn Forest 17 objects total
(@OGUID+16, 1011, 0, 'Earthroot', 0, 10), -- Earthroots in Elwynn Forest 17 objects total
(@OGUID+17, 1011, 0, 'Earthroot', 0, 10), -- Earthroots in Elwynn Forest 17 objects total
(@OGUID+18, 1011, 0, 'Earthroot', 0, 10), -- Earthroots in Elwynn Forest 17 objects total
(@OGUID+19, 1011, 0, 'Earthroot', 0, 10), -- Earthroots in Elwynn Forest 17 objects total
(@OGUID+20, 1011, 0, 'Earthroot', 0, 10), -- Earthroots in Elwynn Forest 17 objects total
(@OGUID+21, 1011, 0, 'Earthroot', 0, 10), -- Earthroots in Elwynn Forest 17 objects total
(@OGUID+22, 1011, 0, 'Earthroot', 0, 10), -- Earthroots in Elwynn Forest 17 objects total
(@OGUID+23, 1011, 0, 'Earthroot', 0, 10), -- Earthroots in Elwynn Forest 17 objects total
(@OGUID+24, 1011, 0, 'Earthroot', 0, 10), -- Earthroots in Elwynn Forest 17 objects total
(@OGUID+25, 1011, 0, 'Earthroot', 0, 10), -- Earthroots in Elwynn Forest 17 objects total
(@OGUID+26, 1011, 0, 'Earthroot', 0, 10), -- Earthroots in Elwynn Forest 17 objects total
(@OGUID+27, 1011, 0, 'Earthroot', 0, 10), -- Earthroots in Elwynn Forest 17 objects total
(@OGUID+28, 1011, 0, 'Earthroot', 0, 10), -- Earthroots in Elwynn Forest 17 objects total
(@OGUID+29, 1021, 0, 'Earthroot', 0, 10), -- Earthroots in Durotar 33 objects total
(@OGUID+30, 1021, 0, 'Earthroot', 0, 10), -- Earthroots in Durotar 33 objects total
(@OGUID+31, 1021, 0, 'Earthroot', 0, 10), -- Earthroots in Durotar 33 objects total
(@OGUID+32, 1021, 0, 'Earthroot', 0, 10), -- Earthroots in Durotar 33 objects total
(@OGUID+33, 1021, 0, 'Earthroot', 0, 10), -- Earthroots in Durotar 33 objects total
(@OGUID+34, 1021, 0, 'Earthroot', 0, 10), -- Earthroots in Durotar 33 objects total
(@OGUID+35, 1021, 0, 'Earthroot', 0, 10), -- Earthroots in Durotar 33 objects total
(@OGUID+36, 1021, 0, 'Earthroot', 0, 10), -- Earthroots in Durotar 33 objects total
(@OGUID+37, 1021, 0, 'Earthroot', 0, 10), -- Earthroots in Durotar 33 objects total
(@OGUID+38, 1021, 0, 'Earthroot', 0, 10), -- Earthroots in Durotar 33 objects total
(@OGUID+39, 1021, 0, 'Earthroot', 0, 10), -- Earthroots in Durotar 33 objects total
(@OGUID+40, 1021, 0, 'Earthroot', 0, 10), -- Earthroots in Durotar 33 objects total
(@OGUID+41, 1021, 0, 'Earthroot', 0, 10), -- Earthroots in Durotar 33 objects total
(@OGUID+42, 1160, 0, 'Earthroot', 0, 10), -- Earthroots in Loch Modan 9 objects total
(@OGUID+43, 1160, 0, 'Earthroot', 0, 10), -- Earthroots in Loch Modan 9 objects total
(@OGUID+44, 1160, 0, 'Earthroot', 0, 10), -- Earthroots in Loch Modan 9 objects total
(@OGUID+45, 1160, 0, 'Earthroot', 0, 10), -- Earthroots in Loch Modan 9 objects total
(@OGUID+46, 1105, 0, 'Earthroot', 0, 10), -- Earthroots in Westfall 25 objects total
(@OGUID+47, 1105, 0, 'Earthroot', 0, 10), -- Earthroots in Westfall 25 objects total
(@OGUID+48, 1105, 0, 'Earthroot', 0, 10), -- Earthroots in Westfall 25 objects total
(@OGUID+49, 1105, 0, 'Earthroot', 0, 10), -- Earthroots in Westfall 25 objects total
(@OGUID+50, 1105, 0, 'Earthroot', 0, 10), -- Earthroots in Westfall 25 objects total
(@OGUID+51, 1105, 0, 'Earthroot', 0, 10), -- Earthroots in Westfall 25 objects total
(@OGUID+52, 1105, 0, 'Earthroot', 0, 10), -- Earthroots in Westfall 25 objects total
(@OGUID+53, 1124, 0, 'Earthroot', 0, 10), -- Earthroots in Redridge 24 objects total
(@OGUID+54, 1124, 0, 'Earthroot', 0, 10), -- Earthroots in Redridge 24 objects total
(@OGUID+55, 1124, 0, 'Earthroot', 0, 10), -- Earthroots in Redridge 24 objects total
(@OGUID+56, 1124, 0, 'Earthroot', 0, 10), -- Earthroots in Redridge 24 objects total
(@OGUID+57, 1124, 0, 'Earthroot', 0, 10), -- Earthroots in Redridge 24 objects total
(@OGUID+58, 1124, 0, 'Earthroot', 0, 10), -- Earthroots in Redridge 24 objects total
(@OGUID+59, 1124, 0, 'Earthroot', 0, 10), -- Earthroots in Redridge 24 objects total
(@OGUID+60, 1124, 0, 'Earthroot', 0, 10), -- Earthroots in Redridge 24 objects total
(@OGUID+61, 1124, 0, 'Earthroot', 0, 10), -- Earthroots in Redridge 24 objects total
(@OGUID+62, 1124, 0, 'Earthroot', 0, 10), -- Earthroots in Redridge 24 objects total
(@OGUID+63, 1124, 0, 'Earthroot', 0, 10), -- Earthroots in Redridge 24 objects total
(@OGUID+64, 1124, 0, 'Earthroot', 0, 10), -- Earthroots in Redridge 24 objects total
(@OGUID+65, 1124, 0, 'Earthroot', 0, 10), -- Earthroots in Redridge 24 objects total
(@OGUID+66, 1124, 0, 'Earthroot', 0, 10), -- Earthroots in Redridge 24 objects total
(@OGUID+67, 1124, 0, 'Earthroot', 0, 10), -- Earthroots in Redridge 24 objects total
(@OGUID+68, 1124, 0, 'Earthroot', 0, 10), -- Earthroots in Redridge 24 objects total
(@OGUID+69, 1124, 0, 'Earthroot', 0, 10), -- Earthroots in Redridge 24 objects total
(@OGUID+70, 1005, 0, 'Earthroot', 0, 10), -- Earthroots in Tirisfal 32 objects total
(@OGUID+71, 1005, 0, 'Earthroot', 0, 10), -- Earthroots in Tirisfal 32 objects total
(@OGUID+72, 1005, 0, 'Earthroot', 0, 10), -- Earthroots in Tirisfal 32 objects total
(@OGUID+73, 1005, 0, 'Earthroot', 0, 10), -- Earthroots in Tirisfal 32 objects total
(@OGUID+74, 1005, 0, 'Earthroot', 0, 10), -- Earthroots in Tirisfal 32 objects total
(@OGUID+75, 1005, 0, 'Earthroot', 0, 10), -- Earthroots in Tirisfal 32 objects total
(@OGUID+76, 1005, 0, 'Earthroot', 0, 10), -- Earthroots in Tirisfal 32 objects total
(@OGUID+77, 1005, 0, 'Earthroot', 0, 10), -- Earthroots in Tirisfal 32 objects total
(@OGUID+78, 1040, 0, 'Earthroot', 0, 10), -- Earthroots in Silverpine Forest 13 objects total
(@OGUID+79, 1040, 0, 'Earthroot', 0, 10), -- Earthroots in Silverpine Forest 13 objects total
(@OGUID+80, 1001, 0, 'Earthroot', 0, 10), -- Earthroots in Teldrassil 26 objects total
(@OGUID+81, 1001, 0, 'Earthroot', 0, 10), -- Earthroots in Teldrassil 26 objects total
(@OGUID+82, 1001, 0, 'Earthroot', 0, 10), -- Earthroots in Teldrassil 26 objects total
(@OGUID+83, 1001, 0, 'Earthroot', 0, 10), -- Earthroots in Teldrassil 26 objects total
(@OGUID+84, 1001, 0, 'Earthroot', 0, 10), -- Earthroots in Teldrassil 26 objects total
(@OGUID+85, 1001, 0, 'Earthroot', 0, 10), -- Earthroots in Teldrassil 26 objects total
(@OGUID+86, 1001, 0, 'Earthroot', 0, 10), -- Earthroots in Teldrassil 26 objects total
(@OGUID+87, 1001, 0, 'Earthroot', 0, 10), -- Earthroots in Teldrassil 26 objects total
(@OGUID+88, 1001, 0, 'Earthroot', 0, 10), -- Earthroots in Teldrassil 26 objects total
(@OGUID+89, 1001, 0, 'Earthroot', 0, 10), -- Earthroots in Teldrassil 26 objects total
(@OGUID+90, 1001, 0, 'Earthroot', 0, 10), -- Earthroots in Teldrassil 26 objects total
(@OGUID+91, 1001, 0, 'Earthroot', 0, 10), -- Earthroots in Teldrassil 26 objects total
(@OGUID+92, 1001, 0, 'Earthroot', 0, 10), -- Earthroots in Teldrassil 26 objects total
(@OGUID+93, 1094, 0, 'Earthroot', 0, 10), -- Earthroots in Darkshore 20 objects total
(@OGUID+94, 1094, 0, 'Earthroot', 0, 10), -- Earthroots in Darkshore 20 objects total
(@OGUID+95, 1094, 0, 'Earthroot', 0, 10), -- Earthroots in Darkshore 20 objects total
(@OGUID+96, 1094, 0, 'Earthroot', 0, 10), -- Earthroots in Darkshore 20 objects total
(@OGUID+97, 1025, 0, 'Earthroot', 0, 10), -- Earthroots in Mulgore 31 objects total
(@OGUID+98, 1025, 0, 'Earthroot', 0, 10), -- Earthroots in Mulgore 31 objects total
(@OGUID+99, 1025, 0, 'Earthroot', 0, 10), -- Earthroots in Mulgore 31 objects total
(@OGUID+100, 1025, 0, 'Earthroot', 0, 10), -- Earthroots in Mulgore 31 objects total
(@OGUID+101, 1025, 0, 'Earthroot', 0, 10), -- Earthroots in Mulgore 31 objects total
(@OGUID+102, 1025, 0, 'Earthroot', 0, 10), -- Earthroots in Mulgore 31 objects total
(@OGUID+103, 1025, 0, 'Earthroot', 0, 10), -- Earthroots in Mulgore 31 objects total
(@OGUID+104, 1025, 0, 'Earthroot', 0, 10), -- Earthroots in Mulgore 31 objects total
(@OGUID+105, 1025, 0, 'Earthroot', 0, 10), -- Earthroots in Mulgore 31 objects total
(@OGUID+106, 1025, 0, 'Earthroot', 0, 10), -- Earthroots in Mulgore 31 objects total
(@OGUID+107, 1025, 0, 'Earthroot', 0, 10), -- Earthroots in Mulgore 31 objects total
(@OGUID+108, 1025, 0, 'Earthroot', 0, 10), -- Earthroots in Mulgore 31 objects total
(@OGUID+109, 1025, 0, 'Earthroot', 0, 10), -- Earthroots in Mulgore 31 objects total
(@OGUID+110, 1025, 0, 'Earthroot', 0, 10), -- Earthroots in Mulgore 31 objects total
(@OGUID+111, 1025, 0, 'Earthroot', 0, 10), -- Earthroots in Mulgore 31 objects total
(@OGUID+112, 1025, 0, 'Earthroot', 0, 10), -- Earthroots in Mulgore 31 objects total
(@OGUID+113, 1025, 0, 'Earthroot', 0, 10), -- Earthroots in Mulgore 31 objects total
(@OGUID+114, 1025, 0, 'Earthroot', 0, 10), -- Earthroots in Mulgore 31 objects total
(@OGUID+115, 1025, 0, 'Earthroot', 0, 10), -- Earthroots in Mulgore 31 objects total
(@OGUID+116, 1025, 0, 'Earthroot', 0, 10), -- Earthroots in Mulgore 31 objects total
(@OGUID+117, 1025, 0, 'Earthroot', 0, 10); -- Earthroots in Mulgore 31 objects total

-- The Barrens Incorrect Spawns
DELETE FROM `gameobject` WHERE `guid` IN (1849, 2042, 1951, 2027, 1974, 1954, 2070, 1835, 27772, 1758, 1871, 2048, 2046, 2058, 1904, 1755, 1756, 1757, 1759, 1761, 1764, 1765, 1767, 1776, 1779, 1781, 1782, 1783, 1787, 1792, 1793, 1796, 1797, 1802, 1804, 1807, 1808, 1809, 1810, 1813, 1814, 1815, 1816, 1823, 1830, 1833, 1837, 1852, 1853, 1854, 1855, 1856, 1857, 1859, 1861, 1864, 1866, 1868, 1896, 1897, 1898, 1899, 1900, 1901, 1902, 1903, 1905, 1907, 1908, 1911, 1925, 1926, 1928, 1930, 1931, 1932, 1934, 1935, 1936, 1943, 1944, 1945, 1946, 1957, 1958, 1959, 1960, 1961, 1963, 1965, 1967, 1968, 1972, 1975, 1977, 1978, 1979, 1980, 1983, 1992, 1995, 1997, 1998, 2003, 2004, 2005, 2006, 2007, 2009, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023, 2028, 2029, 2030, 2040, 2041, 2050, 2060, 2061, 2062, 2063, 2066, 2069, 2071, 2072, 2078, 2079, 2080, 12357, 12527, 32525, 55892);
DELETE FROM `pool_gameobject` WHERE `guid` IN (1849, 2042, 1951, 2027, 1974, 1954, 2070, 1835, 27772, 1758, 1871, 2048, 2046, 2058, 1904, 1755, 1756, 1757, 1759, 1761, 1764, 1765, 1767, 1776, 1779, 1781, 1782, 1783, 1787, 1792, 1793, 1796, 1797, 1802, 1804, 1807, 1808, 1809, 1810, 1813, 1814, 1815, 1816, 1823, 1830, 1833, 1837, 1852, 1853, 1854, 1855, 1856, 1857, 1859, 1861, 1864, 1866, 1868, 1896, 1897, 1898, 1899, 1900, 1901, 1902, 1903, 1905, 1907, 1908, 1911, 1925, 1926, 1928, 1930, 1931, 1932, 1934, 1935, 1936, 1943, 1944, 1945, 1946, 1957, 1958, 1959, 1960, 1961, 1963, 1965, 1967, 1968, 1972, 1975, 1977, 1978, 1979, 1980, 1983, 1992, 1995, 1997, 1998, 2003, 2004, 2005, 2006, 2007, 2009, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023, 2028, 2029, 2030, 2040, 2041, 2050, 2060, 2061, 2062, 2063, 2066, 2069, 2071, 2072, 2078, 2079, 2080, 12357, 12527, 32525, 55892);

-- Correct position of Earthroot in The Barrens (position is off by 0.747622 yards).
UPDATE `gameobject` SET `position_x`=-1546.28, `position_y`=-3958.2, `position_z`=20.1385, `orientation`=0.645772, `rotation0`=0, `rotation1`=0, `rotation2`=0.317305, `rotation3`=0.948324 WHERE `guid`=1798;

-- Missing Earthroot spawns in The Barrens.
SET @OGUID = 28419;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 3726, 1, -3948.84, -2014.57, 99.8912, 0.471238, 0, 0, 0.233445, 0.97237, 900, 900, 1, 100, 0, 10), 
(@OGUID+2, 3726, 1, -327.506, -1385.88, 112.398, 0.942477, 0, 0, 0.45399, 0.891007, 900, 900, 1, 100, 0, 10), 
(@OGUID+3, 3726, 1, -153.105, -1482.47, 107.757, 3.927, 0, 0, -0.923879, 0.382686, 900, 900, 1, 100, 0, 10), 
(@OGUID+4, 3726, 1, -44.65, -1347.71, 103.885, 5.21854, 0, 0, -0.507538, 0.861629, 900, 900, 1, 100, 0, 10), 
(@OGUID+5, 3726, 1, 384.268, -3543.53, 46.8668, 0.855211, 0, 0, 0.414693, 0.909961, 900, 900, 1, 100, 0, 10), 
(@OGUID+6, 3726, 1, -226.043, -1245.33, 93.0938, 0.122173, 0, 0, 0.0610485, 0.998135, 900, 900, 1, 100, 0, 10), 
(@OGUID+7, 3726, 1, -554.613, -3789.55, 43.7731, 0.383971, 0, 0, 0.190808, 0.981627, 900, 900, 1, 100, 0, 10), 
(@OGUID+8, 3726, 1, -2173.47, -1688.16, 122.478, 5.42797, 0, 0, -0.414693, 0.909961, 900, 900, 1, 100, 0, 10), 
(@OGUID+9, 3726, 1, -284.883, -3613.54, 52.1593, 5.13127, 0, 0, -0.544639, 0.838671, 900, 900, 1, 100, 0, 10), 
(@OGUID+10, 3726, 1, 826.997, -3665.93, 37.5249, 4.43314, 0, 0, -0.798635, 0.601815, 900, 900, 1, 100, 0, 10), 
(@OGUID+11, 3726, 1, 962.542, -3658.51, 52.2945, 4.76475, 0, 0, -0.688354, 0.725374, 900, 900, 1, 100, 0, 10), 
(@OGUID+12, 3726, 1, 141.038, -2473.28, 140.871, 3.76991, 0, 0, -0.951056, 0.309017, 900, 900, 1, 100, 0, 10), 
(@OGUID+13, 3726, 1, -450.492, -3692.4, 48.0801, 5.02655, 0, 0, -0.587785, 0.809017, 900, 900, 1, 100, 0, 10), 
(@OGUID+14, 3726, 1, -463.693, -1340.92, 110.516, 4.97419, 0, 0, -0.608761, 0.793354, 900, 900, 1, 100, 0, 10), 
(@OGUID+15, 3726, 1, -396.659, -1586.49, 103.695, 0.244346, 0, 0, 0.121869, 0.992546, 900, 900, 1, 100, 0, 10), 
(@OGUID+16, 3726, 1, -2475.08, -1594.51, 111.186, 3.52557, 0, 0, -0.981627, 0.190812, 900, 900, 1, 100, 0, 10), 
(@OGUID+17, 3726, 1, -1367.89, -3949.43, 42.8773, 2.07694, 0, 0, 0.861629, 0.507539, 900, 900, 1, 100, 0, 10), 
(@OGUID+18, 3726, 1, -4152.02, -2279.53, 95.8744, 5.02655, 0, 0, -0.587785, 0.809017, 900, 900, 1, 100, 0, 10), 
(@OGUID+19, 3726, 1, -1815.75, -1971.06, 104.918, 4.59022, 0, 0, -0.748956, 0.66262, 900, 900, 1, 100, 0, 10), 
(@OGUID+20, 3726, 1, -1721.55, -3900.48, 16.4119, 0.104719, 0, 0, 0.0523357, 0.99863, 900, 900, 1, 100, 0, 10), 
(@OGUID+21, 3726, 1, 538.108, -3613.34, 59.7735, 2.37364, 0, 0, 0.927183, 0.374608, 900, 900, 1, 100, 0, 10), 
(@OGUID+22, 3726, 1, -1351.95, -3756.06, 58.8003, 3.52557, 0, 0, -0.981627, 0.190812, 900, 900, 1, 100, 0, 10), 
(@OGUID+23, 3726, 1, -1568.26, -3783.89, 43.2512, 2.02458, 0, 0, 0.848047, 0.529921, 900, 900, 1, 100, 0, 10), 
(@OGUID+24, 3726, 1, 659.889, -3663.35, 42.7321, 0.349065, 0, 0, 0.173648, 0.984808, 900, 900, 1, 100, 0, 10), 
(@OGUID+25, 3726, 1, 398.654, -2009.49, 121.304, 6.12611, 0, 0, -0.0784588, 0.996917, 900, 900, 1, 100, 0, 10), 
(@OGUID+26, 3726, 1, 416.685, -1331.55, 105.313, 1.15192, 0, 0, 0.544639, 0.838671, 900, 900, 1, 100, 0, 10), 
(@OGUID+27, 3726, 1, 451.32, -1225.72, 120.871, 2.28638, 0, 0, 0.909961, 0.414694, 900, 900, 1, 100, 0, 10), 
(@OGUID+28, 3726, 1, 307.877, -1675.3, 109.163, 3.83973, 0, 0, -0.939692, 0.34202, 900, 900, 1, 100, 0, 10), 
(@OGUID+29, 3726, 1, 58.7128, -2242.22, 114.009, 2.70526, 0, 0, 0.976295, 0.216442, 900, 900, 1, 100, 0, 10), 
(@OGUID+30, 3726, 1, -386.79, -1516.62, 106.923, 2.21657, 0, 0, 0.894934, 0.446199, 900, 900, 1, 100, 0, 10), 
(@OGUID+31, 3726, 1, -183.78, -3576.83, 47.203, 0.541051, 0, 0, 0.267238, 0.963631, 900, 900, 1, 100, 0, 10), 
(@OGUID+32, 3726, 1, -1253.92, -1713.56, 115.503, 5.09636, 0, 0, -0.559193, 0.829038, 900, 900, 1, 100, 0, 10), 
(@OGUID+33, 3726, 1, -3670.86, -1756.42, 92.5359, 0.820303, 0, 0, 0.398748, 0.91706, 900, 900, 1, 100, 0, 10), 
(@OGUID+34, 3726, 1, -1753.09, -3690.84, 34.6685, 1.32645, 0, 0, 0.615661, 0.788011, 900, 900, 1, 100, 0, 10), 
(@OGUID+35, 3726, 1, 40.5391, -1749.56, 111.579, 3.87463, 0, 0, -0.93358, 0.358368, 900, 900, 1, 100, 0, 10), 
(@OGUID+36, 3726, 1, -2552.32, -1730.75, 109.963, 2.74016, 0, 0, 0.979924, 0.19937, 900, 900, 1, 100, 0, 10), 
(@OGUID+37, 3726, 1, 441.502, -2441.14, 141.281, 4.46804, 0, 0, -0.788011, 0.615662, 900, 900, 1, 100, 0, 10), 
(@OGUID+38, 3726, 1, -1159.54, -1705.57, 92.367, 5.28835, 0, 0, -0.477159, 0.878817, 900, 900, 1, 100, 0, 10), 
(@OGUID+39, 3726, 1, 308.67, -3438.26, 56.0001, 6.03884, 0, 0, -0.121869, 0.992546, 900, 900, 1, 100, 0, 10), 
(@OGUID+40, 3726, 1, 207.534, -1912.12, 101.752, 4.17134, 0, 0, -0.870356, 0.492424, 900, 900, 1, 100, 0, 10), 
(@OGUID+41, 3726, 1, -610.527, -1526.39, 108.306, 0.244346, 0, 0, 0.121869, 0.992546, 900, 900, 1, 100, 0, 10), 
(@OGUID+42, 3726, 1, 652.265, -1394.01, 107.489, 4.01426, 0, 0, -0.906307, 0.422619, 900, 900, 1, 100, 0, 10), 
(@OGUID+43, 3726, 1, 775.852, -1414.33, 120.828, 4.57276, 0, 0, -0.754709, 0.656059, 900, 900, 1, 100, 0, 10),  
(@OGUID+44, 3726, 1, -4307.95, -2350.99, 99.3688, 3.927, 0, 0, -0.923879, 0.382686, 300, 300, 1, 100, 0, 10), 
(@OGUID+45, 3726, 1, -3931.37, -1850.23, 96.5837, 1.29154, 0, 0, 0.601814, 0.798636, 300, 300, 1, 100, 0, 10), 
(@OGUID+46, 3726, 1, 161.163, -1473.86, 113.257, 0.977383, 0, 0, 0.469471, 0.882948, 300, 300, 1, 100, 0, 10), 
(@OGUID+47, 3726, 1, 459.912, -1620.7, 122.136, 1.95477, 0, 0, 0.829038, 0.559193, 300, 300, 1, 100, 0, 10), 
(@OGUID+48, 3726, 1, 530.585, -2142.83, 94.6693, 4.27606, 0, 0, -0.843391, 0.5373, 300, 300, 1, 100, 0, 10), 
(@OGUID+49, 1619, 1, -2490.61, -1493.57, 61.8547, 3.78737, 0, 0, -0.948323, 0.317306, 300, 300, 1, 100, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(@OGUID+2, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(@OGUID+3, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(@OGUID+4, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(@OGUID+5, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(@OGUID+6, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(@OGUID+7, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(@OGUID+8, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(@OGUID+9, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(@OGUID+10, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(@OGUID+11, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(@OGUID+12, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(@OGUID+13, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(@OGUID+14, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(@OGUID+15, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(@OGUID+16, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(@OGUID+17, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(@OGUID+18, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(@OGUID+19, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(@OGUID+20, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(@OGUID+21, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(@OGUID+22, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(@OGUID+23, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(@OGUID+24, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(@OGUID+25, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(@OGUID+26, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(@OGUID+27, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(@OGUID+28, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(@OGUID+29, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(@OGUID+30, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(@OGUID+31, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(@OGUID+32, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(@OGUID+33, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(@OGUID+34, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(@OGUID+35, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(@OGUID+36, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(@OGUID+37, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(@OGUID+38, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(@OGUID+39, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(@OGUID+40, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(@OGUID+41, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(@OGUID+42, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(@OGUID+43, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(@OGUID+44, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(@OGUID+45, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(@OGUID+46, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(@OGUID+47, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(@OGUID+48, 1029, 0, 'Earthroot', 0, 10), -- Earthroots in Barrens 127 objects total
(@OGUID+49, 1029, 0, 'Earthroot', 0, 10); -- Earthroots in Barrens 127 objects total

-- Correct Pools
UPDATE `pool_template` SET `description`='Earthroot in Barrens' WHERE `entry`=1029;
UPDATE `pool_template` SET `description`='Earthroot in Darkshore' WHERE `entry`=1094;
UPDATE `pool_template` SET `description`='Earthroot in Dun Morogh' WHERE `entry`=1016;
UPDATE `pool_template` SET `description`='Earthroot in Durotar' WHERE `entry`=1021;
UPDATE `pool_template` SET `description`='Earthroot in Elwynn Forest' WHERE `entry`=1011;
UPDATE `pool_template` SET `description`='Earthroot in Loch Modan' WHERE `entry`=1160;
UPDATE `pool_template` SET `description`='Earthroot in Mulgore' WHERE `entry`=1025;
UPDATE `pool_template` SET `description`='Earthroot in Redridge' WHERE `entry`=1124;
UPDATE `pool_template` SET `description`='Earthroot in Silverpine Forest' WHERE `entry`=1040;
UPDATE `pool_template` SET `description`='Earthroot in Teldrassil' WHERE `entry`=1001;
UPDATE `pool_template` SET `description`='Earthroot in Tirisfal' WHERE `entry`=1005;
UPDATE `pool_template` SET `description`='Earthroot in Westfall' WHERE `entry`=1105;
UPDATE `pool_gameobject` SET `description`='Earthroot' WHERE `guid`=55754;

-- Remove Custom Spawns (Non of these spawns exist in the sniff-db)
DELETE FROM `gameobject` WHERE `guid` IN (1754, 1755, 1756, 1759, 1761, 1764, 1765, 1767, 1776, 1779, 1781, 1782, 1783, 1793, 1797, 1802, 1804, 1807, 1808, 1809, 1813, 1814, 1815, 1816, 1823, 1830, 1834, 1837, 1844, 1845, 1846, 1852, 1853, 1854, 1855, 1856, 1861, 1864, 1866, 1868, 1896, 1897, 1898, 1899, 1900, 1902, 1903, 1905, 1907, 1913, 1917, 1918, 1919, 1920, 1921, 1925, 1928, 1932, 1934, 1935, 1936, 1943, 1944, 1945, 1946, 1950, 1957, 1958, 1959, 1960, 1961, 1963, 1965, 1967, 1968, 1972, 1975, 1977, 1978, 1979, 1980, 1983, 1986, 1988, 1989, 1991, 1992, 1995, 1997, 2003, 2004, 2005, 2006, 2007, 2009, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023, 2028, 2029, 2030, 2040, 2041, 2043, 2050, 2060, 2061, 2062, 2063, 2064, 2066, 2067, 2068, 2069, 2071, 2078, 2079);

-- Remove Custom Spawns (Non of these spawns exist in the sniff-db)
DELETE FROM `pool_gameobject` WHERE `guid` IN (1754, 1755, 1756, 1759, 1761, 1764, 1765, 1767, 1776, 1779, 1781, 1782, 1783, 1793, 1797, 1802, 1804, 1807, 1808, 1809, 1813, 1814, 1815, 1816, 1823, 1830, 1834, 1837, 1844, 1845, 1846, 1852, 1853, 1854, 1855, 1856, 1861, 1864, 1866, 1868, 1896, 1897, 1898, 1899, 1900, 1902, 1903, 1905, 1907, 1913, 1917, 1918, 1919, 1920, 1921, 1925, 1928, 1932, 1934, 1935, 1936, 1943, 1944, 1945, 1946, 1950, 1957, 1958, 1959, 1960, 1961, 1963, 1965, 1967, 1968, 1972, 1975, 1977, 1978, 1979, 1980, 1983, 1986, 1988, 1989, 1991, 1992, 1995, 1997, 2003, 2004, 2005, 2006, 2007, 2009, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023, 2028, 2029, 2030, 2040, 2041, 2043, 2050, 2060, 2061, 2062, 2063, 2064, 2066, 2067, 2068, 2069, 2071, 2078, 2079);

-- Sync Gobject Data
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300, `spawn_flags` = 0, `animprogress` = 100 WHERE `id` IN (1619, 3726);

-- Update Counters
UPDATE `pool_template` SET `max_limit`=18 WHERE  `entry`=1124;
UPDATE `pool_template` SET `max_limit`=13 WHERE  `entry`=1105;
UPDATE `pool_template` SET `max_limit`=9 WHERE  `entry`=1094;
UPDATE `pool_template` SET `max_limit`=4 WHERE  `entry`=1160;
UPDATE `pool_template` SET `max_limit`=7 WHERE  `entry`=1040;
UPDATE `pool_template` SET `max_limit`=24 WHERE  `entry`=1029;
UPDATE `pool_template` SET `max_limit`=21 WHERE  `entry`=1025;
UPDATE `pool_template` SET `max_limit`=16 WHERE  `entry`=1021;
UPDATE `pool_template` SET `max_limit`=17 WHERE  `entry`=1001;
UPDATE `pool_template` SET `max_limit`=19 WHERE  `entry`=1005;
UPDATE `pool_template` SET `max_limit`=16 WHERE  `entry`=1011;
UPDATE `pool_template` SET `max_limit`=20 WHERE  `entry`=1016;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
