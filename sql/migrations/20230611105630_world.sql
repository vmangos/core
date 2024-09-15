DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230611105630');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230611105630');
-- Add your query below.


-- Gromsblood (142145, 176637)
SET @OGUID = 42116;

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
(@OGUID+1, 142145, 0, -11813.1, -3189.12, -30.6491, 4.5204, 0, 0, -0.771625, 0.636078, 45, 90, 1, 100, 0, 10), 
(@OGUID+2, 142145, 0, -11688.5, -3211.32, 11.8707, 5.2709, 0, 0, -0.484809, 0.87462, 45, 90, 1, 100, 0, 10), 
(@OGUID+3, 142145, 0, -11373.2, -3043.34, -4.55977, 5.74214, 0, 0, -0.267238, 0.963631, 45, 90, 1, 100, 0, 10), 
(@OGUID+4, 142145, 0, -11255, -3132.8, 2.85068, 5.39307, 0, 0, -0.430511, 0.902586, 45, 90, 1, 100, 0, 10), 
(@OGUID+5, 142145, 0, -11872.9, -3162.18, -26.6012, 0.733038, 0, 0, 0.358368, 0.93358, 45, 90, 1, 100, 0, 10), 
(@OGUID+6, 142145, 0, -11365.7, -3225.41, 9.86462, 4.97419, 0, 0, -0.608761, 0.793354, 45, 90, 1, 100, 0, 10), 
(@OGUID+7, 142145, 0, -11835.8, -3261.03, -25.5813, 3.73501, 0, 0, -0.956305, 0.292372, 300, 300, 1, 100, 0, 10),
(@OGUID+8, 142145, 0, -11812.4, -3346.55, 5.48995, 4.18879, 0, 0, -0.866025, 0.500001, 300, 300, 1, 100, 0, 10),
(@OGUID+9, 142145, 0, -11811.1, -3047.59, 9.71363, 2.23402, 0, 0, 0.898793, 0.438373, 300, 300, 1, 100, 0, 10),
(@OGUID+10, 142145, 0, -11755.8, -3155.15, -19.205, 4.11898, 0, 0, -0.882947, 0.469473, 300, 300, 1, 100, 0, 10),
(@OGUID+11, 142145, 0, -11685.5, -3147.74, 14.2616, 5.98648, 0, 0, -0.147809, 0.989016, 300, 300, 1, 100, 0, 10),
(@OGUID+12, 142145, 0, -11524.3, -3333.03, 13.6837, 0.855211, 0, 0, 0.414693, 0.909961, 300, 300, 1, 100, 0, 10),
(@OGUID+13, 142145, 0, -11404, -2774.71, 2.90857, 4.03171, 0, 0, -0.902585, 0.430512, 300, 300, 1, 100, 0, 10),
(@OGUID+14, 142145, 0, -11387.2, -2577.01, 70.5934, 1.44862, 0, 0, 0.66262, 0.748956, 300, 300, 1, 100, 0, 10),
(@OGUID+15, 142145, 0, -11214.1, -2547.68, 100.099, 1.74533, 0, 0, 0.766044, 0.642789, 300, 300, 1, 100, 0, 10);

-- Missing Gromsblood spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+16, 142145, 1, 2049.3, -3138.72, 102.235, 1.91986, 0, 0, 0.819152, 0.573577, 45, 90, 1, 100, 0, 10), 
(@OGUID+17, 142145, 1, 1953.24, -3148.67, 100.534, 3.927, 0, 0, -0.923879, 0.382686, 45, 90, 1, 100, 0, 10), 
(@OGUID+18, 142145, 1, 1664.29, -3257.31, 144.601, 2.04204, 0, 0, 0.85264, 0.522499, 45, 90, 1, 100, 0, 10), 
(@OGUID+19, 142145, 1, 1666.03, -3411.14, 143.724, 1.29154, 0, 0, 0.601814, 0.798636, 300, 300, 1, 100, 0, 10),
(@OGUID+20, 142145, 1, 1987.07, -2988.45, 106.585, 2.72271, 0, 0, 0.978148, 0.207912, 300, 300, 1, 100, 0, 10);

-- Missing Gromsblood spawns in Desolace.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+21, 142145, 1, -1682.46, 1941.42, 62.2338, 2.21657, 0, 0, 0.894934, 0.446199, 45, 90, 1, 100, 0, 10), 
(@OGUID+22, 142145, 1, -1866.38, 2046.31, 62.6681, 3.50812, 0, 0, -0.983254, 0.182238, 45, 90, 1, 100, 0, 10), 
(@OGUID+23, 142145, 1, -1805, 1645.8, 61.2939, 5.18363, 0, 0, -0.522498, 0.85264, 45, 90, 1, 100, 0, 10), 
(@OGUID+24, 142145, 1, -2052.13, 2077.23, 65.2471, 3.194, 0, 0, -0.999657, 0.0262016, 45, 90, 1, 100, 0, 10), 
(@OGUID+25, 142145, 1, -1872.68, 1775.92, 66.0818, 3.80482, 0, 0, -0.945518, 0.325568, 45, 90, 1, 100, 0, 10), 
(@OGUID+26, 142145, 1, -2114.53, 1920.92, 63.2417, 1.62316, 0, 0, 0.725374, 0.688355, 45, 90, 1, 100, 0, 10), 
(@OGUID+27, 142145, 1, -1829.13, 1681.74, 61.6428, 2.54818, 0, 0, 0.956305, 0.292372, 45, 90, 1, 100, 0, 10), 
(@OGUID+28, 142145, 1, -2027.25, 2133.57, 52.4994, 6.02139, 0, 0, -0.130526, 0.991445, 300, 300, 1, 100, 0, 10),
(@OGUID+29, 142145, 1, -1988.43, 1979.86, 63.384, 2.70526, 0, 0, 0.976295, 0.216442, 300, 300, 1, 100, 0, 10),
(@OGUID+30, 142145, 1, -1887.12, 1720.37, 62.723, 4.71239, 0, 0, -0.707107, 0.707107, 300, 300, 1, 100, 0, 10);

-- Missing Gromsblood spawns in Felwood.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+31, 176637, 1, 3829.71, -1018.73, 239.014, 1.58825, 0, 0, 0.71325, 0.70091, 1800, 1800, 1, 100, 0, 10),
(@OGUID+32, 176637, 1, 4170.61, -1039.69, 290.399, 1.06465, 0, 0, 0.507538, 0.861629, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+33, 176637, 1, 6410.31, -1664.2, 489.088, 5.39307, 0, 0, -0.430511, 0.902586, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+34, 176637, 1, 4275.2, -526.568, 300.463, 5.00909, 0, 0, -0.594823, 0.803857, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+35, 176637, 1, 6216.45, -1058.25, 382.754, 1.58825, 0, 0, 0.71325, 0.70091, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+36, 176637, 1, 4713.48, -880.975, 333.382, 1.55334, 0, 0, 0.700909, 0.713251, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+37, 176637, 1, 4455.27, -649.972, 271.522, 0.925024, 0, 0, 0.446198, 0.894935, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+38, 176637, 1, 6171.32, -1320.39, 376.745, 4.90438, 0, 0, -0.636078, 0.771625, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+39, 176637, 1, 4953.85, -628.289, 293.128, 2.33874, 0, 0, 0.920505, 0.390732, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+40, 176637, 1, 4341.67, -975.19, 308.93, 3.31614, 0, 0, -0.996194, 0.087165, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+41, 176637, 1, 6435.29, -942.493, 423.112, 4.10153, 0, 0, -0.887011, 0.461749, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+42, 176637, 1, 4427.99, -969.055, 319.897, 1.02974, 0, 0, 0.492423, 0.870356, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+43, 176637, 1, 3665.94, -1034.32, 221.811, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 1, 100, 0, 10),
(@OGUID+44, 176637, 1, 3826.26, -744.31, 320.932, 4.99164, 0, 0, -0.601814, 0.798636, 300, 300, 1, 100, 0, 10),
(@OGUID+45, 176637, 1, 3999.68, -794.823, 286.05, 5.44543, 0, 0, -0.406736, 0.913546, 300, 300, 1, 100, 0, 10),
(@OGUID+46, 176637, 1, 4148.58, -697.723, 282.085, 3.4034, 0, 0, -0.991445, 0.130528, 300, 300, 1, 100, 0, 10),
(@OGUID+47, 176637, 1, 4498.2, -518.471, 298.419, 4.92183, 0, 0, -0.62932, 0.777146, 300, 300, 1, 100, 0, 10),
(@OGUID+48, 176637, 1, 4772.08, -429.159, 343.536, 3.194, 0, 0, -0.999657, 0.0262016, 300, 300, 1, 100, 0, 10),
(@OGUID+49, 176637, 1, 5520.46, -982.505, 371.932, 0.645772, 0, 0, 0.317305, 0.948324, 300, 300, 1, 100, 0, 10),
(@OGUID+50, 176637, 1, 5582.39, -883.424, 377.295, 2.56563, 0, 0, 0.958819, 0.284016, 300, 300, 1, 100, 0, 10),
(@OGUID+51, 176637, 1, 5622.4, -1084.7, 379.209, 5.44543, 0, 0, -0.406736, 0.913546, 300, 300, 1, 100, 0, 10),
(@OGUID+52, 176637, 1, 5991.86, -1328.28, 414.972, 5.89921, 0, 0, -0.190808, 0.981627, 300, 300, 1, 100, 0, 10),
(@OGUID+53, 176637, 1, 6004.83, -1181.92, 376.221, 3.94445, 0, 0, -0.920505, 0.390732, 300, 300, 1, 100, 0, 10),
(@OGUID+54, 176637, 1, 6317.09, -1277.11, 374.092, 4.2237, 0, 0, -0.857167, 0.515038, 300, 300, 1, 100, 0, 10),
(@OGUID+55, 176637, 1, 6323.52, -1560.57, 446.547, 4.7473, 0, 0, -0.694658, 0.71934, 300, 300, 1, 100, 0, 10),
(@OGUID+56, 176637, 1, 6858.76, -1927.15, 550.92, 2.04204, 0, 0, 0.85264, 0.522499, 300, 300, 1, 100, 0, 10),
(@OGUID+57, 176637, 1, 6887.74, -1605.99, 500.34, 2.58308, 0, 0, 0.961261, 0.27564, 300, 300, 1, 100, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1275, 0, 'Gromsblood', 0, 10), -- Gromsblood in Blasted Lands 26 objects total
(@OGUID+2, 1275, 0, 'Gromsblood', 0, 10), -- Gromsblood in Blasted Lands 26 objects total
(@OGUID+3, 1275, 0, 'Gromsblood', 0, 10), -- Gromsblood in Blasted Lands 26 objects total
(@OGUID+4, 1275, 0, 'Gromsblood', 0, 10), -- Gromsblood in Blasted Lands 26 objects total
(@OGUID+5, 1275, 0, 'Gromsblood', 0, 10), -- Gromsblood in Blasted Lands 26 objects total
(@OGUID+6, 1275, 0, 'Gromsblood', 0, 10), -- Gromsblood in Blasted Lands 26 objects total
(@OGUID+7, 1275, 0, 'Gromsblood', 0, 10), -- Gromsblood in Blasted Lands 26 objects total
(@OGUID+8, 1275, 0, 'Gromsblood', 0, 10), -- Gromsblood in Blasted Lands 26 objects total
(@OGUID+9, 1275, 0, 'Gromsblood', 0, 10), -- Gromsblood in Blasted Lands 26 objects total
(@OGUID+10, 1275, 0, 'Gromsblood', 0, 10), -- Gromsblood in Blasted Lands 26 objects total
(@OGUID+11, 1275, 0, 'Gromsblood', 0, 10), -- Gromsblood in Blasted Lands 26 objects total
(@OGUID+12, 1275, 0, 'Gromsblood', 0, 10), -- Gromsblood in Blasted Lands 26 objects total
(@OGUID+13, 1275, 0, 'Gromsblood', 0, 10), -- Gromsblood in Blasted Lands 26 objects total
(@OGUID+14, 1275, 0, 'Gromsblood', 0, 10), -- Gromsblood in Blasted Lands 26 objects total
(@OGUID+15, 1275, 0, 'Gromsblood', 0, 10), -- Gromsblood in Blasted Lands 26 objects total
(@OGUID+16, 1327, 0, 'Gromsblood', 0, 10), -- Gromsblood in Ashenvale 8 objects total
(@OGUID+17, 1327, 0, 'Gromsblood', 0, 10), -- Gromsblood in Ashenvale 8 objects total
(@OGUID+18, 1327, 0, 'Gromsblood', 0, 10), -- Gromsblood in Ashenvale 8 objects total
(@OGUID+19, 1327, 0, 'Gromsblood', 0, 10), -- Gromsblood in Ashenvale 8 objects total
(@OGUID+20, 1327, 0, 'Gromsblood', 0, 10), -- Gromsblood in Ashenvale 8 objects total
(@OGUID+21, 1143, 0, 'Gromsblood', 0, 10), -- Gromsblood in Desolace 12 objects total
(@OGUID+22, 1143, 0, 'Gromsblood', 0, 10), -- Gromsblood in Desolace 12 objects total
(@OGUID+23, 1143, 0, 'Gromsblood', 0, 10), -- Gromsblood in Desolace 12 objects total
(@OGUID+24, 1143, 0, 'Gromsblood', 0, 10), -- Gromsblood in Desolace 12 objects total
(@OGUID+25, 1143, 0, 'Gromsblood', 0, 10), -- Gromsblood in Desolace 12 objects total
(@OGUID+26, 1143, 0, 'Gromsblood', 0, 10), -- Gromsblood in Desolace 12 objects total
(@OGUID+27, 1143, 0, 'Gromsblood', 0, 10), -- Gromsblood in Desolace 12 objects total
(@OGUID+28, 1143, 0, 'Gromsblood', 0, 10), -- Gromsblood in Desolace 12 objects total
(@OGUID+29, 1143, 0, 'Gromsblood', 0, 10), -- Gromsblood in Desolace 12 objects total
(@OGUID+30, 1143, 0, 'Gromsblood', 0, 10), -- Gromsblood in Desolace 12 objects total
(@OGUID+31, 1225, 0, 'Gromsblood', 0, 10), -- Gromsbloods in Felwood
(@OGUID+32, 1225, 0, 'Gromsblood', 0, 10), -- Gromsbloods in Felwood
(@OGUID+33, 1225, 0, 'Gromsblood', 0, 10), -- Gromsbloods in Felwood
(@OGUID+34, 1225, 0, 'Gromsblood', 0, 10), -- Gromsbloods in Felwood
(@OGUID+35, 1225, 0, 'Gromsblood', 0, 10), -- Gromsbloods in Felwood
(@OGUID+36, 1225, 0, 'Gromsblood', 0, 10), -- Gromsbloods in Felwood
(@OGUID+37, 1225, 0, 'Gromsblood', 0, 10), -- Gromsbloods in Felwood
(@OGUID+38, 1225, 0, 'Gromsblood', 0, 10), -- Gromsbloods in Felwood
(@OGUID+39, 1225, 0, 'Gromsblood', 0, 10), -- Gromsbloods in Felwood
(@OGUID+40, 1225, 0, 'Gromsblood', 0, 10), -- Gromsbloods in Felwood
(@OGUID+41, 1225, 0, 'Gromsblood', 0, 10), -- Gromsbloods in Felwood
(@OGUID+42, 1225, 0, 'Gromsblood', 0, 10), -- Gromsbloods in Felwood
(@OGUID+43, 1225, 0, 'Gromsblood', 0, 10), -- Gromsbloods in Felwood
(@OGUID+44, 1225, 0, 'Gromsblood', 0, 10), -- Gromsbloods in Felwood
(@OGUID+45, 1225, 0, 'Gromsblood', 0, 10), -- Gromsbloods in Felwood
(@OGUID+46, 1225, 0, 'Gromsblood', 0, 10), -- Gromsbloods in Felwood
(@OGUID+47, 1225, 0, 'Gromsblood', 0, 10), -- Gromsbloods in Felwood
(@OGUID+48, 1225, 0, 'Gromsblood', 0, 10), -- Gromsbloods in Felwood
(@OGUID+49, 1225, 0, 'Gromsblood', 0, 10), -- Gromsbloods in Felwood
(@OGUID+50, 1225, 0, 'Gromsblood', 0, 10), -- Gromsbloods in Felwood
(@OGUID+51, 1225, 0, 'Gromsblood', 0, 10), -- Gromsbloods in Felwood
(@OGUID+52, 1225, 0, 'Gromsblood', 0, 10), -- Gromsbloods in Felwood
(@OGUID+53, 1225, 0, 'Gromsblood', 0, 10), -- Gromsbloods in Felwood
(@OGUID+54, 1225, 0, 'Gromsblood', 0, 10), -- Gromsbloods in Felwood
(@OGUID+55, 1225, 0, 'Gromsblood', 0, 10), -- Gromsbloods in Felwood
(@OGUID+56, 1225, 0, 'Gromsblood', 0, 10), -- Gromsbloods in Felwood
(@OGUID+57, 1225, 0, 'Gromsblood', 0, 10); -- Gromsbloods in Felwood

-- Correct Pools
UPDATE `pool_template` SET `description`='Gromsblood in Dire Maul East' WHERE  `entry`=4292;
UPDATE `pool_template` SET `description`='Gromsblood in Ashenvale' WHERE  `entry`=1327;
UPDATE `pool_template` SET `description`='Gromsblood in Blasted Lands' WHERE  `entry`=1275;
UPDATE `pool_template` SET `description`='Gromsblood in Desolace' WHERE  `entry`=1143;
UPDATE `pool_template` SET `description`='Gromsblood in Felwood' WHERE  `entry`=1225;
DELETE FROM `pool_template` WHERE  `entry`=420;

-- Remove Custom Spawns (Non of these spawns exist in the sniff-db)
DELETE FROM `gameobject` WHERE `guid` IN (16449, 16502, 16451, 16452, 16455, 16459, 16460, 16461, 16465, 16466, 16467, 16468, 16469, 16470, 16471, 16473, 16474, 16480, 16483, 16484, 16485, 16486, 16487, 16488, 16489, 16490, 16491, 16492, 16493, 16494, 16495, 16496, 16500, 16501, 16505, 16506, 16507, 16508, 16509, 16512, 16513, 16514, 16516, 16519, 16520, 16522, 16524, 16525, 16528, 16529, 16530, 16532, 16535, 16536, 16542, 16543, 16545, 16456, 16457, 16475, 16476, 16477, 16478, 16481, 16482, 16498, 16504, 16515, 16517, 16526, 16527, 16538, 16540, 39997, 429012, 429013, 429014, 429015, 429016, 429017, 429018, 429019, 429020, 429021);
DELETE FROM `pool_gameobject` WHERE `guid` IN (16449, 16502, 16451, 16452, 16455, 16459, 16460, 16461, 16465, 16466, 16467, 16468, 16469, 16470, 16471, 16473, 16474, 16480, 16483, 16484, 16485, 16486, 16487, 16488, 16489, 16490, 16491, 16492, 16493, 16494, 16495, 16496, 16500, 16501, 16505, 16506, 16507, 16508, 16509, 16512, 16513, 16514, 16516, 16519, 16520, 16522, 16524, 16525, 16528, 16529, 16530, 16532, 16535, 16536, 16542, 16543, 16545, 16456, 16457, 16475, 16476, 16477, 16478, 16481, 16482, 16498, 16504, 16515, 16517, 16526, 16527, 16538, 16540, 39997, 429012, 429013, 429014, 429015, 429016, 429017, 429018, 429019, 429020, 429021);

-- Sync Gobject Data
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300, `spawn_flags` = 0, `animprogress` = 100 WHERE `id` IN (176637, 142145);

-- Update Counters
UPDATE `pool_template` SET `max_limit`=18 WHERE  `entry`=1275;
UPDATE `pool_template` SET `max_limit`=39 WHERE  `entry`=1225;
UPDATE `pool_template` SET `max_limit`=9 WHERE  `entry`=1143;
UPDATE `pool_template` SET `max_limit`=4 WHERE  `entry`=1327;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
