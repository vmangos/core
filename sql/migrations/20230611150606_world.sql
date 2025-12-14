DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230611150606');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230611150606');
-- Add your query below.


-- Khadgar's Whisker (2043)
SET @OGUID = 35028;

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
(@OGUID+1, 2043, 0, -7038.73, -3109.59, 241.785, 0.0174525, 0, 0, 0.00872612, 0.999962, 300, 300, 1, 100, 0, 10), 
(@OGUID+2, 2043, 0, -6773.71, -2528.45, 243.776, 3.927, 0, 0, -0.923879, 0.382686, 300, 300, 1, 100, 0, 10), 
(@OGUID+3, 2043, 0, -7099.71, -2385.18, 241.667, 4.08407, 0, 0, -0.891006, 0.453991, 300, 300, 1, 100, 0, 10),
(@OGUID+4, 2043, 0, -7085.83, -3356.17, 243.178, 3.07177, 0, 0, 0.999391, 0.0349061, 300, 300, 1, 100, 0, 10),
(@OGUID+5, 2043, 0, -6790.94, -3502.5, 243.616, 3.83973, 0, 0, -0.939692, 0.34202, 300, 300, 1, 100, 0, 10);

-- Missing Khadgar's Whisker spawns in Swamp of Sorrows.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+6, 2043, 0, -10271.1, -2857.08, 27.0663, 5.53269, 0, 0, -0.366501, 0.930418, 300, 300, 1, 100, 0, 10), 
(@OGUID+7, 2043, 0, -10338.1, -2849.28, 24.6491, 2.75761, 0, 0, 0.981627, 0.190812, 300, 300, 1, 100, 0, 10), 
(@OGUID+8, 2043, 0, -10659.2, -4227.48, 23.3317, 0.715585, 0, 0, 0.350207, 0.936672, 300, 300, 1, 100, 0, 10), 
(@OGUID+9, 2043, 0, -10107.4, -3413.07, 22.6165, 2.9845, 0, 0, 0.996917, 0.0784664, 300, 300, 1, 100, 0, 10), 
(@OGUID+10, 2043, 0, -10686, -4084.35, 22.5595, 4.38078, 0, 0, -0.814116, 0.580703, 300, 300, 1, 100, 0, 10), 
(@OGUID+11, 2043, 0, -10331, -2819.58, 24.9289, 4.62512, 0, 0, -0.737277, 0.675591, 300, 300, 1, 100, 0, 10), 
(@OGUID+12, 2043, 0, -10147.2, -4100.49, 21.9425, 2.05949, 0, 0, 0.857167, 0.515038, 300, 300, 1, 100, 0, 10), 
(@OGUID+13, 2043, 0, -10188.6, -3787.47, 22.6709, 5.39307, 0, 0, -0.430511, 0.902586, 300, 300, 1, 100, 0, 10), 
(@OGUID+14, 2043, 0, -10442.5, -3509.2, 23.4964, 5.74214, 0, 0, -0.267238, 0.963631, 300, 300, 1, 100, 0, 10), 
(@OGUID+15, 2043, 0, -10220.8, -3086.67, 22.225, 0.750491, 0, 0, 0.366501, 0.930418, 300, 300, 1, 100, 0, 10), 
(@OGUID+16, 2043, 0, -10803.2, -4056.36, 23.3321, 2.56563, 0, 0, 0.958819, 0.284016, 300, 300, 1, 100, 0, 10),
(@OGUID+17, 2043, 0, -10799.5, -3901.02, 21.7152, 3.4034, 0, 0, -0.991445, 0.130528, 300, 300, 1, 100, 0, 10),
(@OGUID+18, 2043, 0, -10667.8, -3866.48, 22.4199, 5.3058, 0, 0, -0.469471, 0.882948, 300, 300, 1, 100, 0, 10),
(@OGUID+19, 2043, 0, -10271.9, -2974.04, 22.9212, 4.32842, 0, 0, -0.829037, 0.559194, 300, 300, 1, 100, 0, 10),
(@OGUID+20, 2043, 0, -10251.2, -3603.33, 23.7774, 2.04204, 0, 0, 0.85264, 0.522499, 300, 300, 1, 100, 0, 10),
(@OGUID+21, 2043, 0, -10222.2, -3910.89, 22.8978, 2.70526, 0, 0, 0.976295, 0.216442, 300, 300, 1, 100, 0, 10),
(@OGUID+22, 2043, 0, -10206.6, -4192.47, 22.7902, 2.44346, 0, 0, 0.939692, 0.34202, 300, 300, 1, 100, 0, 10),
(@OGUID+23, 2043, 0, -10054.7, -3291.11, 23.8859, 3.56047, 0, 0, -0.978148, 0.207912, 300, 300, 1, 100, 0, 10),
(@OGUID+24, 2043, 0, -9919.22, -4132.79, 22.7334, 0.244346, 0, 0, 0.121869, 0.992546, 300, 300, 1, 100, 0, 10);

-- Missing Khadgar's Whisker spawns in Dustwallow Marsh.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+25, 2043, 1, -3321.41, -2843.75, 32.791, 3.56047, 0, 0, -0.978148, 0.207912, 300, 300, 1, 100, 0, 10), 
(@OGUID+26, 2043, 1, -3316.13, -4017.71, 29.0155, 0.296705, 0, 0, 0.147809, 0.989016, 300, 300, 1, 100, 0, 10), 
(@OGUID+27, 2043, 1, -4127.7, -2823.48, 39.0979, 3.10665, 0, 0, 0.999847, 0.0174693, 300, 300, 1, 100, 0, 10), 
(@OGUID+28, 2043, 1, -3841.73, -3706.29, 42.2347, 0.0523589, 0, 0, 0.0261765, 0.999657, 300, 300, 1, 100, 0, 10), 
(@OGUID+29, 2043, 1, -4499.86, -3176.26, 35.5605, 3.80482, 0, 0, -0.945518, 0.325568, 300, 300, 1, 100, 0, 10), 
(@OGUID+30, 2043, 1, -4506, -3666.13, 38.9024, 2.93214, 0, 0, 0.994521, 0.104536, 300, 300, 1, 100, 0, 10), 
(@OGUID+31, 2043, 1, -4256.67, -3587.84, 43.1987, 2.56563, 0, 0, 0.958819, 0.284016, 300, 300, 1, 100, 0, 10), 
(@OGUID+32, 2043, 1, -3531.54, -3056.35, 36.5391, 0.453785, 0, 0, 0.224951, 0.97437, 300, 300, 1, 100, 0, 10), 
(@OGUID+33, 2043, 1, -4117.23, -3318.63, 38.7402, 2.35619, 0, 0, 0.92388, 0.382683, 300, 300, 1, 100, 0, 10), 
(@OGUID+34, 2043, 1, -3637.24, -3373.67, 40.16, 0.471238, 0, 0, 0.233445, 0.97237, 300, 300, 1, 100, 0, 10), 
(@OGUID+35, 2043, 1, -4864.74, -3428.35, 36.8739, 2.25147, 0, 0, 0.902585, 0.430512, 300, 300, 1, 100, 0, 10),
(@OGUID+36, 2043, 1, -3940.15, -3543.23, 41.0601, 5.88176, 0, 0, -0.199368, 0.979925, 300, 300, 1, 100, 0, 10),
(@OGUID+37, 2043, 1, -3847.56, -3010.89, 37.5911, 4.46804, 0, 0, -0.788011, 0.615662, 300, 300, 1, 100, 0, 10),
(@OGUID+38, 2043, 1, -3384.03, -3199.55, 36.5296, 3.42085, 0, 0, -0.990268, 0.139175, 300, 300, 1, 100, 0, 10),
(@OGUID+39, 2043, 1, -2865.03, -3739.31, 41.2133, 5.21854, 0, 0, -0.507538, 0.861629, 300, 300, 1, 100, 0, 10);

-- Missing Khadgar's Whisker spawns in Azshara.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+40, 2043, 1, 4666.72, -6522.82, 113.834, 2.86234, 0, 0, 0.990268, 0.139175, 300, 300, 1, 100, 0, 10), 
(@OGUID+41, 2043, 1, 3213.58, -5146.55, 140.037, 0.942477, 0, 0, 0.45399, 0.891007, 300, 300, 1, 100, 0, 10), 
(@OGUID+42, 2043, 1, 2967.38, -4074.46, 103.338, 1.79769, 0, 0, 0.782608, 0.622515, 300, 300, 1, 100, 0, 10), 
(@OGUID+43, 2043, 1, 2630.11, -5716.02, 113.184, 4.17134, 0, 0, -0.870356, 0.492424, 300, 300, 1, 100, 0, 10), 
(@OGUID+44, 2043, 1, 2659.54, -5066.63, 119.639, 4.93928, 0, 0, -0.622514, 0.782609, 300, 300, 1, 100, 0, 10),
(@OGUID+45, 2043, 1, 3375.02, -4844.78, 116.478, 4.20625, 0, 0, -0.861629, 0.507539, 300, 300, 1, 100, 0, 10),
(@OGUID+46, 2043, 1, 4475.71, -6740.33, 96.6608, 3.29869, 0, 0, -0.996917, 0.0784664, 300, 300, 1, 100, 0, 10);


-- Missing Khadgar's Whisker spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+47, 2043, 0, -11723.3, 212.219, 41.4537, 1.64061, 0, 0, 0.731353, 0.681999, 300, 300, 1, 100, 0, 10), 
(@OGUID+48, 2043, 0, -12681.5, -121.948, 15.3385, 4.7473, 0, 0, -0.694658, 0.71934, 300, 300, 1, 100, 0, 10), 
(@OGUID+49, 2043, 0, -12732.6, -594.734, 42.1949, 5.53269, 0, 0, -0.366501, 0.930418, 300, 300, 1, 100, 0, 10), 
(@OGUID+50, 2043, 0, -13699.8, 511.229, 38.8513, 6.21337, 0, 0, -0.0348988, 0.999391, 300, 300, 1, 100, 0, 10), 
(@OGUID+51, 2043, 0, -11793.7, 70.5265, 24.8554, 2.00713, 0, 0, 0.843391, 0.5373, 300, 300, 1, 100, 0, 10), 
(@OGUID+52, 2043, 0, -12362.9, -191.168, 22.3143, 4.7822, 0, 0, -0.681998, 0.731354, 300, 300, 1, 100, 0, 10), 
(@OGUID+53, 2043, 0, -11608.4, -581.081, 27.9593, 4.90438, 0, 0, -0.636078, 0.771625, 300, 300, 1, 100, 0, 10), 
(@OGUID+54, 2043, 0, -11548.4, 843.898, 23.3085, 2.47837, 0, 0, 0.945518, 0.325568, 300, 300, 1, 100, 0, 10), 
(@OGUID+55, 2043, 0, -12497.6, -818.028, 41.9242, 4.88692, 0, 0, -0.642787, 0.766045, 300, 300, 1, 100, 0, 10), 
(@OGUID+56, 2043, 0, -12841.2, 97.749, 19.3022, 5.46288, 0, 0, -0.398748, 0.91706, 300, 300, 1, 100, 0, 10), 
(@OGUID+57, 2043, 0, -14775.8, -152.402, 5.74952, 5.98648, 0, 0, -0.147809, 0.989016, 300, 300, 1, 100, 0, 10),
(@OGUID+58, 2043, 0, -13625.2, 316.356, 44.1129, 1.06465, 0, 0, 0.507538, 0.861629, 300, 300, 1, 100, 0, 10),
(@OGUID+59, 2043, 0, -13568.5, -234.428, 30.2198, 3.61284, 0, 0, -0.972369, 0.233448, 300, 300, 1, 100, 0, 10),
(@OGUID+60, 2043, 0, -13419.6, 250.341, 22.6322, 5.13127, 0, 0, -0.544639, 0.838671, 300, 300, 1, 100, 0, 10),
(@OGUID+61, 2043, 0, -13259.3, 496.703, 5.97683, 3.21142, 0, 0, -0.999391, 0.0349061, 300, 300, 1, 100, 0, 10),
(@OGUID+62, 2043, 0, -13053, 413.668, 24.8047, 4.38078, 0, 0, -0.814116, 0.580703, 300, 300, 1, 100, 0, 10),
(@OGUID+63, 2043, 0, -12874.8, -24.5285, 16.543, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 1, 100, 0, 10),
(@OGUID+64, 2043, 0, -12781.2, 109.064, 11.3627, 5.70723, 0, 0, -0.284015, 0.95882, 300, 300, 1, 100, 0, 10),
(@OGUID+65, 2043, 0, -12713, -241.92, 38.4442, 2.54818, 0, 0, 0.956305, 0.292372, 300, 300, 1, 100, 0, 10),
(@OGUID+66, 2043, 0, -12472.2, -656.677, 38.4287, 1.01229, 0, 0, 0.484809, 0.87462, 300, 300, 1, 100, 0, 10),
(@OGUID+67, 2043, 0, -12395.7, -772.087, 33.0181, 2.63544, 0, 0, 0.968147, 0.250381, 300, 300, 1, 100, 0, 10),
(@OGUID+68, 2043, 0, -12194.6, -895.55, 40.0078, 0.383971, 0, 0, 0.190808, 0.981627, 300, 300, 1, 100, 0, 10),
(@OGUID+69, 2043, 0, -12189.7, -829.898, 38.3669, 2.28638, 0, 0, 0.909961, 0.414694, 300, 300, 1, 100, 0, 10),
(@OGUID+70, 2043, 0, -12176.9, 249.226, 3.41079, 1.309, 0, 0, 0.608761, 0.793354, 300, 300, 1, 100, 0, 10),
(@OGUID+71, 2043, 0, -12076.2, -277.955, 17.7318, 1.3439, 0, 0, 0.622514, 0.782609, 300, 300, 1, 100, 0, 10),
(@OGUID+72, 2043, 0, -12004.3, -582.896, 14.048, 4.20625, 0, 0, -0.861629, 0.507539, 300, 300, 1, 100, 0, 10),
(@OGUID+73, 2043, 0, -11975.7, -265.456, 23.3149, 1.51844, 0, 0, 0.688354, 0.725374, 300, 300, 1, 100, 0, 10),
(@OGUID+74, 2043, 0, -11945.7, 296.664, 20.9065, 5.79449, 0, 0, -0.241921, 0.970296, 300, 300, 1, 100, 0, 10),
(@OGUID+75, 2043, 0, -11766.8, 157.535, 21.215, 3.54302, 0, 0, -0.979924, 0.19937, 300, 300, 1, 100, 0, 10),
(@OGUID+76, 2043, 0, -11748.8, 639.877, 50.7172, 1.22173, 0, 0, 0.573576, 0.819152, 300, 300, 1, 100, 0, 10),
(@OGUID+77, 2043, 0, -11679.9, -97.9076, 18.2134, 3.4034, 0, 0, -0.991445, 0.130528, 300, 300, 1, 100, 0, 10),
(@OGUID+78, 2043, 0, -11502.8, -655.407, 32.1102, 5.5676, 0, 0, -0.350207, 0.936672, 300, 300, 1, 100, 0, 10);

-- Missing Khadgar's Whisker spawns in Alterac Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+79, 2043, 0, 1017.78, -357.786, 61.5597, 2.91469, 0, 0, 0.993571, 0.113208, 300, 300, 1, 100, 0, 10), 
(@OGUID+80, 2043, 0, 498.507, -1343.87, 68.2421, 5.48033, 0, 0, -0.390731, 0.920505, 300, 300, 1, 100, 0, 10), 
(@OGUID+81, 2043, 0, -44.0645, -436.343, 105.588, 3.14159, 0, 0, -1, 0, 300, 300, 1, 100, 0, 10), 
(@OGUID+82, 2043, 0, 1201.66, -569.665, 71.0431, 4.17134, 0, 0, -0.870356, 0.492424, 300, 300, 1, 100, 0, 10), 
(@OGUID+83, 2043, 0, 651.71, -1333.18, 108.475, 5.96903, 0, 0, -0.156434, 0.987688, 300, 300, 1, 100, 0, 10), 
(@OGUID+84, 2043, 0, 1216.54, -502.072, 62.9315, 5.07891, 0, 0, -0.566406, 0.824126, 300, 300, 1, 100, 0, 10), 
(@OGUID+85, 2043, 0, -61.4537, -242.914, 138.338, 2.63544, 0, 0, 0.968147, 0.250381, 300, 300, 1, 100, 0, 10), 
(@OGUID+86, 2043, 0, -248.326, -285.914, 166.76, 5.53269, 0, 0, -0.366501, 0.930418, 300, 300, 1, 100, 0, 10), 
(@OGUID+87, 2043, 0, -116.969, -118.776, 137.862, 2.93214, 0, 0, 0.994521, 0.104536, 300, 300, 1, 100, 0, 10), 
(@OGUID+88, 2043, 0, 599.274, -846.469, 158.328, 1.15192, 0, 0, 0.544639, 0.838671, 300, 300, 1, 100, 0, 10),
(@OGUID+89, 2043, 0, 696.216, -803.623, 166.445, 3.49067, 0, 0, -0.984807, 0.173652, 300, 300, 1, 100, 0, 10),
(@OGUID+90, 2043, 0, 870.148, -925.065, 130.53, 2.1293, 0, 0, 0.874619, 0.48481, 300, 300, 1, 100, 0, 10),
(@OGUID+91, 2043, 0, 1026.24, -841.602, 99.1553, 5.93412, 0, 0, -0.173648, 0.984808, 300, 300, 1, 100, 0, 10),
(@OGUID+92, 2043, 0, 1176.82, -649.001, 63.1475, 1.55334, 0, 0, 0.700909, 0.713251, 300, 300, 1, 100, 0, 10),
(@OGUID+93, 2043, 0, 1183.12, -315.709, 42.4671, 6.03884, 0, 0, -0.121869, 0.992546, 300, 300, 1, 100, 0, 10);

-- Missing Khadgar's Whisker spawns in Arathi Highlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+94, 2043, 0, -1025.81, -2997.91, 54.5303, 5.89921, 0, 0, -0.190808, 0.981627, 300, 300, 1, 100, 0, 10), 
(@OGUID+95, 2043, 0, -998.321, -2613.74, 59.0053, 2.65289, 0, 0, 0.970295, 0.241925, 300, 300, 1, 100, 0, 10), 
(@OGUID+96, 2043, 0, -833.354, -3573.68, 75.1468, 2.16421, 0, 0, 0.882947, 0.469473, 300, 300, 1, 100, 0, 10), 
(@OGUID+97, 2043, 0, -1938.69, -2777.88, 76.5744, 4.88692, 0, 0, -0.642787, 0.766045, 300, 300, 1, 100, 0, 10), 
(@OGUID+98, 2043, 0, -1005.75, -2761.2, 49.9008, 2.74016, 0, 0, 0.979924, 0.19937, 300, 300, 1, 100, 0, 10), 
(@OGUID+99, 2043, 0, -1337.62, -3171.37, 36.8362, 0.575957, 0, 0, 0.284015, 0.95882, 300, 300, 1, 100, 0, 10), 
(@OGUID+100, 2043, 0, -1874.17, -3108.33, 58.5064, 5.18363, 0, 0, -0.522498, 0.85264, 300, 300, 1, 100, 0, 10),
(@OGUID+101, 2043, 0, -1686.26, -3196.85, 29.4435, 4.50295, 0, 0, -0.777145, 0.629321, 300, 300, 1, 100, 0, 10),
(@OGUID+102, 2043, 0, -1652.72, -3462.09, 54.7456, 3.73501, 0, 0, -0.956305, 0.292372, 300, 300, 1, 100, 0, 10),
(@OGUID+103, 2043, 0, -1640.56, -3274.57, 24.9171, 4.7822, 0, 0, -0.681998, 0.731354, 300, 300, 1, 100, 0, 10),
(@OGUID+104, 2043, 0, -1325.07, -2853.97, 54.0805, 1.88495, 0, 0, 0.809016, 0.587786, 300, 300, 1, 100, 0, 10),
(@OGUID+105, 2043, 0, -1256.4, -1633.42, 49.7173, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 1, 100, 0, 10);

-- Missing Khadgar's Whisker spawns in The Hinterlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+106, 2043, 0, 472.906, -3579.43, 119.614, 5.58505, 0, 0, -0.34202, 0.939693, 300, 300, 1, 100, 0, 10), 
(@OGUID+107, 2043, 0, 34.7109, -4435.45, 145.705, 2.1293, 0, 0, 0.874619, 0.48481, 300, 300, 1, 100, 0, 10);

-- Missing Khadgar's Whisker spawns in Feralas.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+108, 2043, 1, -4526.93, 733.041, 58.6208, 3.05433, 0, 0, 0.999048, 0.0436193, 300, 300, 1, 100, 0, 10), 
(@OGUID+109, 2043, 1, -4151.86, 181.619, 60.0951, 5.58505, 0, 0, -0.34202, 0.939693, 300, 300, 1, 100, 0, 10), 
(@OGUID+110, 2043, 1, -4444.69, -491.649, 16.8626, 5.60251, 0, 0, -0.333807, 0.942641, 300, 300, 1, 100, 0, 10), 
(@OGUID+111, 2043, 1, -4045.41, 22.926, 71.7135, 4.01426, 0, 0, -0.906307, 0.422619, 300, 300, 1, 100, 0, 10), 
(@OGUID+112, 2043, 1, -4963.53, 509.307, 9.36374, 3.87463, 0, 0, -0.93358, 0.358368, 300, 300, 1, 100, 0, 10), 
(@OGUID+113, 2043, 1, -4746.1, 580.647, 37.8097, 3.194, 0, 0, -0.999657, 0.0262016, 300, 300, 1, 100, 0, 10), 
(@OGUID+114, 2043, 1, -5066.7, 1580.28, 60.7236, 1.3439, 0, 0, 0.622514, 0.782609, 300, 300, 1, 100, 0, 10), 
(@OGUID+115, 2043, 1, -5737.81, 1603.28, 79.7497, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 1, 100, 0, 10), 
(@OGUID+116, 2043, 1, -5852.32, 1607.68, 84.5751, 0.209439, 0, 0, 0.104528, 0.994522, 300, 300, 1, 100, 0, 10), 
(@OGUID+117, 2043, 1, -5315.67, 1631.8, 52.4483, 5.86431, 0, 0, -0.207911, 0.978148, 300, 300, 1, 100, 0, 10), 
(@OGUID+118, 2043, 1, -5204.47, 1650.32, 86.5355, 0.244346, 0, 0, 0.121869, 0.992546, 300, 300, 1, 100, 0, 10), 
(@OGUID+119, 2043, 1, -2908.44, 2786.06, 80.2477, 5.23599, 0, 0, -0.5, 0.866025, 300, 300, 1, 100, 0, 10), 
(@OGUID+120, 2043, 1, -3451.05, 2724.27, 80.1605, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 1, 100, 0, 10), 
(@OGUID+121, 2043, 1, -4543.79, 876.104, 58.5503, 3.71755, 0, 0, -0.958819, 0.284016, 300, 300, 1, 100, 0, 10), 
(@OGUID+122, 2043, 1, -5071.13, 1282.02, 41.5515, 6.00393, 0, 0, -0.139173, 0.990268, 300, 300, 1, 100, 0, 10),
(@OGUID+123, 2043, 1, -5024.87, 1576.07, 59.1374, 3.10665, 0, 0, 0.999847, 0.0174693, 300, 300, 1, 100, 0, 10),
(@OGUID+124, 2043, 1, -4977.69, 1288.03, 98.0431, 2.49582, 0, 0, 0.948323, 0.317306, 300, 300, 1, 100, 0, 10),
(@OGUID+125, 2043, 1, -4651.69, 1035.05, 108.29, 5.42797, 0, 0, -0.414693, 0.909961, 300, 300, 1, 100, 0, 10),
(@OGUID+126, 2043, 1, -4640.38, 1532.9, 124.493, 0.087266, 0, 0, 0.0436192, 0.999048, 300, 300, 1, 100, 0, 10),
(@OGUID+127, 2043, 1, -4442.9, 648.624, 66.5648, 1.93731, 0, 0, 0.824125, 0.566408, 300, 300, 1, 100, 0, 10),
(@OGUID+128, 2043, 1, -4422.45, -75.8642, 56.9736, 1.309, 0, 0, 0.608761, 0.793354, 300, 300, 1, 100, 0, 10),
(@OGUID+129, 2043, 1, -4421.48, 1457.81, 125.772, 2.68781, 0, 0, 0.97437, 0.224951, 300, 300, 1, 100, 0, 10),
(@OGUID+130, 2043, 1, -4357.07, 690.767, 91.7815, 2.28638, 0, 0, 0.909961, 0.414694, 300, 300, 1, 100, 0, 10),
(@OGUID+131, 2043, 1, -4211.01, 617.553, 66.1571, 2.96704, 0, 0, 0.996194, 0.087165, 300, 300, 1, 100, 0, 10),
(@OGUID+132, 2043, 1, -4182.84, 263.658, 53.623, 3.35105, 0, 0, -0.994521, 0.104536, 300, 300, 1, 100, 0, 10),
(@OGUID+133, 2043, 1, -3862.15, 1882.34, 86.0225, 2.96704, 0, 0, 0.996194, 0.087165, 300, 300, 1, 100, 0, 10),
(@OGUID+134, 2043, 1, -3794.42, 1760.53, 159.905, 0.820303, 0, 0, 0.398748, 0.91706, 300, 300, 1, 100, 0, 10),
(@OGUID+135, 2043, 1, -2964.38, 2557.44, 43.6311, 2.96704, 0, 0, 0.996194, 0.087165, 300, 300, 1, 100, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1282, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Badlands 26 objects total
(@OGUID+2, 1282, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Badlands 26 objects total
(@OGUID+3, 1282, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Badlands 26 objects total
(@OGUID+4, 1282, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Badlands 26 objects total
(@OGUID+5, 1282, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Badlands 26 objects total
(@OGUID+6, 1309, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Swamp of Sorrows (2) 25 objects total
(@OGUID+7, 1309, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Swamp of Sorrows (1) 26 objects total
(@OGUID+8, 1309, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Swamp of Sorrows (2) 25 objects total
(@OGUID+9, 1309, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Swamp of Sorrows (1) 26 objects total
(@OGUID+10, 1309, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Swamp of Sorrows (2) 25 objects total
(@OGUID+11, 1309, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Swamp of Sorrows (1) 26 objects total
(@OGUID+12, 1309, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Swamp of Sorrows (1) 26 objects total
(@OGUID+13, 1309, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Swamp of Sorrows (1) 26 objects total
(@OGUID+14, 1309, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Swamp of Sorrows (2) 25 objects total
(@OGUID+15, 1309, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Swamp of Sorrows (2) 25 objects total
(@OGUID+16, 1309, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Swamp of Sorrows (2) 25 objects total
(@OGUID+17, 1309, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Swamp of Sorrows (1) 26 objects total
(@OGUID+18, 1309, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Swamp of Sorrows (2) 25 objects total
(@OGUID+19, 1309, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Swamp of Sorrows (1) 26 objects total
(@OGUID+20, 1309, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Swamp of Sorrows (2) 25 objects total
(@OGUID+21, 1309, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Swamp of Sorrows (1) 26 objects total
(@OGUID+22, 1309, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Swamp of Sorrows (1) 26 objects total
(@OGUID+23, 1309, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Swamp of Sorrows (1) 26 objects total
(@OGUID+24, 1309, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Swamp of Sorrows (2) 25 objects total
(@OGUID+25, 1102, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Dustwallow Marsh 9 objects total
(@OGUID+26, 1102, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Dustwallow Marsh 9 objects total
(@OGUID+27, 1102, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Dustwallow Marsh 9 objects total
(@OGUID+28, 1102, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Dustwallow Marsh 9 objects total
(@OGUID+29, 1102, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Dustwallow Marsh 9 objects total
(@OGUID+30, 1102, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Dustwallow Marsh 9 objects total
(@OGUID+31, 1102, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Dustwallow Marsh 9 objects total
(@OGUID+32, 1102, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Dustwallow Marsh 9 objects total
(@OGUID+33, 1102, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Dustwallow Marsh 9 objects total
(@OGUID+34, 1102, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Dustwallow Marsh 9 objects total
(@OGUID+35, 1102, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Dustwallow Marsh 9 objects total
(@OGUID+36, 1102, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Dustwallow Marsh 9 objects total
(@OGUID+37, 1102, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Dustwallow Marsh 9 objects total
(@OGUID+38, 1102, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Dustwallow Marsh 9 objects total
(@OGUID+39, 1102, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Dustwallow Marsh 9 objects total
(@OGUID+40, 1055, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Azshara 14 objects total
(@OGUID+41, 1055, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Azshara 14 objects total
(@OGUID+42, 1055, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Azshara 14 objects total
(@OGUID+43, 1055, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Azshara 14 objects total
(@OGUID+44, 1055, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Azshara 14 objects total
(@OGUID+45, 1055, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Azshara 14 objects total
(@OGUID+46, 1055, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Azshara 14 objects total
(@OGUID+47, 1173, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Stranglethorn 179 objects total
(@OGUID+48, 1173, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Stranglethorn 179 objects total
(@OGUID+49, 1173, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Stranglethorn 179 objects total
(@OGUID+50, 1173, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Stranglethorn 179 objects total
(@OGUID+51, 1173, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Stranglethorn 179 objects total
(@OGUID+52, 1173, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Stranglethorn 179 objects total
(@OGUID+53, 1173, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Stranglethorn 179 objects total
(@OGUID+54, 1173, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Stranglethorn 179 objects total
(@OGUID+55, 1173, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Stranglethorn 179 objects total
(@OGUID+56, 1173, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Stranglethorn 179 objects total
(@OGUID+57, 1173, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Stranglethorn 179 objects total
(@OGUID+58, 1173, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Stranglethorn 179 objects total
(@OGUID+59, 1173, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Stranglethorn 179 objects total
(@OGUID+60, 1173, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Stranglethorn 179 objects total
(@OGUID+61, 1173, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Stranglethorn 179 objects total
(@OGUID+62, 1173, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Stranglethorn 179 objects total
(@OGUID+63, 1173, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Stranglethorn 179 objects total
(@OGUID+64, 1173, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Stranglethorn 179 objects total
(@OGUID+65, 1173, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Stranglethorn 179 objects total
(@OGUID+66, 1173, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Stranglethorn 179 objects total
(@OGUID+67, 1173, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Stranglethorn 179 objects total
(@OGUID+68, 1173, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Stranglethorn 179 objects total
(@OGUID+69, 1173, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Stranglethorn 179 objects total
(@OGUID+70, 1173, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Stranglethorn 179 objects total
(@OGUID+71, 1173, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Stranglethorn 179 objects total
(@OGUID+72, 1173, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Stranglethorn 179 objects total
(@OGUID+73, 1173, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Stranglethorn 179 objects total
(@OGUID+74, 1173, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Stranglethorn 179 objects total
(@OGUID+75, 1173, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Stranglethorn 179 objects total
(@OGUID+76, 1173, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Stranglethorn 179 objects total
(@OGUID+77, 1173, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Stranglethorn 179 objects total
(@OGUID+78, 1173, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Stranglethorn 179 objects total
(@OGUID+79, 1059, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Alterac 26 objects total
(@OGUID+80, 1059, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Alterac 26 objects total
(@OGUID+81, 1059, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Alterac 26 objects total
(@OGUID+82, 1059, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Alterac 26 objects total
(@OGUID+83, 1059, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Alterac 26 objects total
(@OGUID+84, 1059, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Alterac 26 objects total
(@OGUID+85, 1059, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Alterac 26 objects total
(@OGUID+86, 1059, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Alterac 26 objects total
(@OGUID+87, 1059, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Alterac 26 objects total
(@OGUID+88, 1059, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Alterac 26 objects total
(@OGUID+89, 1059, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Alterac 26 objects total
(@OGUID+90, 1059, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Alterac 26 objects total
(@OGUID+91, 1059, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Alterac 26 objects total
(@OGUID+92, 1059, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Alterac 26 objects total
(@OGUID+93, 1059, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Alterac 26 objects total
(@OGUID+94, 1182, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Arathi 71 objects total
(@OGUID+95, 1182, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Arathi 71 objects total
(@OGUID+96, 1182, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Arathi 71 objects total
(@OGUID+97, 1182, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Arathi 71 objects total
(@OGUID+98, 1182, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Arathi 71 objects total
(@OGUID+99, 1182, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Arathi 71 objects total
(@OGUID+100, 1182, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Arathi 71 objects total
(@OGUID+101, 1182, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Arathi 71 objects total
(@OGUID+102, 1182, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Arathi 71 objects total
(@OGUID+103, 1182, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Arathi 71 objects total
(@OGUID+104, 1182, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Arathi 71 objects total
(@OGUID+105, 1182, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Arathi 71 objects total
(@OGUID+106, 1248, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Hinterlands 28 objects total
(@OGUID+107, 1248, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Hinterlands 28 objects total
(@OGUID+108, 1189, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Feralas 14 objects total
(@OGUID+109, 1189, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Feralas 14 objects total
(@OGUID+110, 1189, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Feralas 14 objects total
(@OGUID+111, 1189, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Feralas 14 objects total
(@OGUID+112, 1189, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Feralas 14 objects total
(@OGUID+113, 1189, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Feralas 14 objects total
(@OGUID+114, 1189, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Feralas 14 objects total
(@OGUID+115, 1189, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Feralas 14 objects total
(@OGUID+116, 1189, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Feralas 14 objects total
(@OGUID+117, 1189, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Feralas 14 objects total
(@OGUID+118, 1189, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Feralas 14 objects total
(@OGUID+119, 1189, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Feralas 14 objects total
(@OGUID+120, 1189, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Feralas 14 objects total
(@OGUID+121, 1189, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Feralas 14 objects total
(@OGUID+122, 1189, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Feralas 14 objects total
(@OGUID+123, 1189, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Feralas 14 objects total
(@OGUID+124, 1189, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Feralas 14 objects total
(@OGUID+125, 1189, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Feralas 14 objects total
(@OGUID+126, 1189, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Feralas 14 objects total
(@OGUID+127, 1189, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Feralas 14 objects total
(@OGUID+128, 1189, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Feralas 14 objects total
(@OGUID+129, 1189, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Feralas 14 objects total
(@OGUID+130, 1189, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Feralas 14 objects total
(@OGUID+131, 1189, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Feralas 14 objects total
(@OGUID+132, 1189, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Feralas 14 objects total
(@OGUID+133, 1189, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Feralas 14 objects total
(@OGUID+134, 1189, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Feralas 14 objects total
(@OGUID+135, 1189, 0, 'Khadgars Whisker', 0, 10); -- Khadgars Whisker in Feralas 14 objects total

-- Correct Pools
DELETE FROM `pool_template` WHERE `entry` = 1310;
DELETE FROM `pool_gameobject` WHERE `pool_entry` = 1310;
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(7103, 1309, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Swamp of Sorrows (2) 25 objects total
(7162, 1309, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Swamp of Sorrows (2) 25 objects total
(8025, 1309, 0, 'Khadgars Whisker', 0, 10), -- Khadgars Whisker in Swamp of Sorrows (1) 26 objects total
(30624, 1309, 0, 'Khadgars Whisker', 0, 10); -- Khadgars Whisker in Swamp of Sorrows (2) 25 objects total
UPDATE `pool_template` SET `description`='Khadgars Whisker in Badlands' WHERE  `entry`=1282;
UPDATE `pool_template` SET `description`='Khadgars Whisker in Dustwallow Marsh' WHERE  `entry`=1102;
UPDATE `pool_template` SET `description`='Khadgars Whisker in Feralas' WHERE  `entry`=1189;
UPDATE `pool_template` SET `description`='Khadgars Whisker in Hinterlands' WHERE  `entry`=1248;
UPDATE `pool_template` SET `description`='Khadgars Whisker in Stranglethorn' WHERE  `entry`=1173;
UPDATE `pool_template` SET `description`='Khadgars Whisker in Swamp of Sorrows' WHERE  `entry`=1309;

-- Remove Custom Spawns (Non of these spawns exist in the sniff-db)
DELETE FROM `gameobject` WHERE `guid` IN (7886, 8035, 7890, 8142, 7994, 7855, 8171, 8084, 8086, 8094, 8060, 8112, 7831, 7832, 7833, 7834, 7835, 7836, 7837, 7838, 7841, 7844, 7845, 7846, 7847, 7849, 7850, 7853, 7854, 7857, 7858, 7859, 7860, 7861, 7862, 7865, 7866, 7867, 7868, 7869, 7870, 7871, 7872, 7873, 7878, 7879, 7880, 7881, 7884, 7885, 7891, 7892, 7893, 7894, 7895, 7896, 7898, 7899, 7900, 7901, 7902, 7904, 7905, 7906, 7908, 7909, 7910, 7912, 7913, 7915, 7916, 7917, 7919, 7921, 7922, 7923, 7924, 7925, 7926, 7928, 7929, 7930, 7933, 7934, 7936, 7937, 7938, 7939, 7940, 7941, 7942, 7943, 7945, 7947, 7948, 7949, 7951, 7953, 7954, 7955, 7956, 7957, 7958, 7959, 7960, 7961, 7962, 7966, 7967, 7968, 7969, 7970, 7971, 7972, 7975, 7976, 7979, 7980, 7981, 7982, 7983, 7985, 7986, 7988, 7991, 7992, 7993, 7995, 7997, 7998, 8000, 8001, 8002, 8003, 8004, 8005, 8006, 8009, 8010, 8012, 8013, 8014, 8018, 8020, 8021, 8022, 8026, 8029, 8030, 8031, 8032, 8033, 8034, 8036, 8037, 8038, 8039, 8040, 8041, 8042, 8043, 8044, 8045, 8046, 8047, 8048, 8051, 8053, 8054, 8055, 8057, 8059, 8061, 8064, 8065, 8066, 8067, 8068, 8069, 8072, 8073, 8074, 8075, 8076, 8077, 8079, 8080, 8081, 8082, 8083, 8085, 8087, 8089, 8090, 8091, 8096, 8097, 8098, 8100, 8101, 8106, 8107, 8108, 8109, 8110, 8111, 8113, 8114, 8116, 8117, 8118, 8119, 8120, 8122, 8123, 8125, 8126, 8130, 8131, 8132, 8133, 8135, 8136, 8137, 8138, 8139, 8140, 8141, 8143, 8144, 8145, 8146, 8147, 8148, 8149, 8150, 8151, 8152, 8153, 8154, 8155, 8156, 8157, 8158, 8159, 8160, 8161, 8162, 8164, 8165, 8166, 8167, 8168, 8169, 8170, 8172, 8175, 8177, 8178, 8179, 8180, 8181, 8182, 8184, 8186, 8187, 8188, 8189);
DELETE FROM `pool_gameobject` WHERE `guid` IN (7886, 8035, 7890, 8142, 7994, 7855, 8171, 8084, 8086, 8094, 8060, 8112, 7831, 7832, 7833, 7834, 7835, 7836, 7837, 7838, 7841, 7844, 7845, 7846, 7847, 7849, 7850, 7853, 7854, 7857, 7858, 7859, 7860, 7861, 7862, 7865, 7866, 7867, 7868, 7869, 7870, 7871, 7872, 7873, 7878, 7879, 7880, 7881, 7884, 7885, 7891, 7892, 7893, 7894, 7895, 7896, 7898, 7899, 7900, 7901, 7902, 7904, 7905, 7906, 7908, 7909, 7910, 7912, 7913, 7915, 7916, 7917, 7919, 7921, 7922, 7923, 7924, 7925, 7926, 7928, 7929, 7930, 7933, 7934, 7936, 7937, 7938, 7939, 7940, 7941, 7942, 7943, 7945, 7947, 7948, 7949, 7951, 7953, 7954, 7955, 7956, 7957, 7958, 7959, 7960, 7961, 7962, 7966, 7967, 7968, 7969, 7970, 7971, 7972, 7975, 7976, 7979, 7980, 7981, 7982, 7983, 7985, 7986, 7988, 7991, 7992, 7993, 7995, 7997, 7998, 8000, 8001, 8002, 8003, 8004, 8005, 8006, 8009, 8010, 8012, 8013, 8014, 8018, 8020, 8021, 8022, 8026, 8029, 8030, 8031, 8032, 8033, 8034, 8036, 8037, 8038, 8039, 8040, 8041, 8042, 8043, 8044, 8045, 8046, 8047, 8048, 8051, 8053, 8054, 8055, 8057, 8059, 8061, 8064, 8065, 8066, 8067, 8068, 8069, 8072, 8073, 8074, 8075, 8076, 8077, 8079, 8080, 8081, 8082, 8083, 8085, 8087, 8089, 8090, 8091, 8096, 8097, 8098, 8100, 8101, 8106, 8107, 8108, 8109, 8110, 8111, 8113, 8114, 8116, 8117, 8118, 8119, 8120, 8122, 8123, 8125, 8126, 8130, 8131, 8132, 8133, 8135, 8136, 8137, 8138, 8139, 8140, 8141, 8143, 8144, 8145, 8146, 8147, 8148, 8149, 8150, 8151, 8152, 8153, 8154, 8155, 8156, 8157, 8158, 8159, 8160, 8161, 8162, 8164, 8165, 8166, 8167, 8168, 8169, 8170, 8172, 8175, 8177, 8178, 8179, 8180, 8181, 8182, 8184, 8186, 8187, 8188, 8189);

-- Sync Gobject Data
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300, `spawn_flags` = 0, `animprogress` = 100 WHERE `id` IN (2043);

-- Update Counters
UPDATE `pool_template` SET `max_limit`=9 WHERE  `entry`=1059;
UPDATE `pool_template` SET `max_limit`=12 WHERE  `entry`=1182;
UPDATE `pool_template` SET `max_limit`=3 WHERE  `entry`=1055;
UPDATE `pool_template` SET `max_limit`=6 WHERE  `entry`=1282;
UPDATE `pool_template` SET `max_limit`=17 WHERE  `entry`=1102;
UPDATE `pool_template` SET `max_limit`=23 WHERE  `entry`=1189;
UPDATE `pool_template` SET `max_limit`=4 WHERE  `entry`=1248;
UPDATE `pool_template` SET `max_limit`=36 WHERE  `entry`=1173;
UPDATE `pool_template` SET `max_limit`=13 WHERE  `entry`=1309;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(13693, 2043, 0, -224.735, -434.981, 71.6844, 3.59538, 0, 0, -0.97437, 0.224951, 300, 300, 1, 100, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(13693, 1248, 0, 'Khadgars Whisker', 0, 10); -- Khadgars Whisker in Hinterlands 28 objects total


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
