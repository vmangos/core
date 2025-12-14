DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230707202622');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230707202622');
-- Add your query below.


SET @OGUID = 65908;
SET @PTEMPLATE = 18854;

-- Missing Hyacinth Mushroom spawns in Teldrassil. (Template)
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 152094, 1, 10451.4, 604.155, 1328.91, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 55298 at 33.631264 yards.

-- Missing Gnomish Toolbox spawns in Durotar.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+2, 3236, 1, 34.0079, -5367.41, -4.45259, 6.03884, 0, 0, -0.121869, 0.992546, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 12411 at 16.357759 yards.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 8, 'Durotar - Gnomish Toolbox', 0, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(3236, @PTEMPLATE+1, 0, 'Durotar - Gnomish Toolbox', 0, 10);
UPDATE `gameobject` SET `spawntimesecsmin` = 180, `spawntimesecsmax` = 180 WHERE `id` = 3236;

-- Missing Warsong Oil spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+4, 178195, 1, 2751.01, -2914.81, 146.594, 6.00393, 0, 0, -0.139173, 0.990268, 10, 10, 1, 100, 0, 10), -- Closest existing guid is 47800 at 43.111111 yards.
(@OGUID+5, 178195, 1, 2792.67, -2969.69, 149.561, 1.8675, 0, 0, 0.803857, 0.594823, 10, 10, 1, 100, 0, 10), -- Closest existing guid is 47800 at 111.924988 yards.
(@OGUID+6, 178195, 1, 2784.2, -3011.59, 154.347, 3.61284, 0, 0, -0.972369, 0.233448, 10, 10, 1, 100, 0, 10), -- Closest existing guid is 47800 at 143.187119 yards.
(@OGUID+7, 178195, 1, 2949.42, -2835.61, 212.732, 2.04204, 0, 0, 0.85264, 0.522499, 10, 10, 1, 100, 0, 10), -- Closest existing guid is 47799 at 17.830444 yards.
(@OGUID+8, 178195, 1, 2926.51, -2861, 216.315, 2.89725, 0, 0, 0.992546, 0.12187, 10, 10, 1, 100, 0, 10), -- Closest existing guid is 47799 at 43.263832 yards.
(@OGUID+9, 178195, 1, 2953.12, -2814.07, 212.583, 6.26573, 0, 0, -0.00872612, 0.999962, 10, 10, 1, 100, 0, 10), -- Closest existing guid is 47797 at 5.623562 yards.
(@OGUID+10, 178195, 1, 2489.59, -2143.84, 200.56, 4.34587, 0, 0, -0.824126, 0.566406, 10, 10, 1, 100, 0, 10), -- Closest existing guid is 47796 at 12.015337 yards.
(@OGUID+11, 178195, 1, 2474.02, -2146.3, 202.267, 1.0472, 0, 0, 0.5, 0.866025, 10, 10, 1, 100, 0, 10), -- Closest existing guid is 47795 at 9.183559 yards.
(@OGUID+12, 178195, 1, 2504.42, -2123.87, 201.745, 0.95993, 0, 0, 0.461748, 0.887011, 10, 10, 1, 100, 0, 10), -- Closest existing guid is 47796 at 18.418159 yards.
(@OGUID+13, 178195, 1, 2792.46, -2957.21, 148.862, 1.58825, 0, 0, 0.71325, 0.70091, 10, 10, 1, 100, 0, 10), -- Closest existing guid is 47800 at 102.359489 yards.
(@OGUID+14, 178195, 1, 2783.77, -3015.04, 154.257, 1.01229, 0, 0, 0.484809, 0.87462, 10, 10, 1, 100, 0, 10), -- Closest existing guid is 47800 at 146.118164 yards.
(@OGUID+15, 178195, 1, 2930.76, -2838.76, 212.71, 2.35619, 0, 0, 0.92388, 0.382683, 10, 10, 1, 100, 0, 10), -- Closest existing guid is 47799 at 20.956667 yards.
(@OGUID+16, 178195, 1, 2954.01, -2827.32, 212.789, 5.61996, 0, 0, -0.325567, 0.945519, 10, 10, 1, 100, 0, 10), -- Closest existing guid is 47799 at 15.303365 yards.
(@OGUID+17, 178195, 1, 2502.23, -2123.78, 201.613, 1.15192, 0, 0, 0.544639, 0.838671, 10, 10, 1, 100, 0, 10), -- Closest existing guid is 47796 at 16.531034 yards.
(@OGUID+18, 178195, 1, 2711.84, -2920.14, 141.185, 0.541051, 0, 0, 0.267238, 0.963631, 10, 10, 1, 100, 0, 10), -- Closest existing guid is 47800 at 39.600323 yards.
(@OGUID+19, 178195, 1, 2778.14, -3017.46, 154.199, 1.09956, 0, 0, 0.522498, 0.85264, 10, 10, 1, 100, 0, 10), -- Closest existing guid is 47800 at 146.073608 yards.
(@OGUID+20, 178195, 1, 2765.68, -2915.32, 146.546, 2.67035, 0, 0, 0.972369, 0.233448, 10, 10, 1, 100, 0, 10), -- Closest existing guid is 47800 at 54.278584 yards.
(@OGUID+21, 178195, 1, 2787.64, -2977.16, 150.394, 5.55015, 0, 0, -0.358368, 0.93358, 10, 10, 1, 100, 0, 10), -- Closest existing guid is 47800 at 114.918587 yards.
(@OGUID+22, 178195, 1, 2741.17, -2985.79, 140.798, 0.418879, 0, 0, 0.207911, 0.978148, 10, 10, 1, 100, 0, 10), -- Closest existing guid is 47800 at 105.144386 yards.
(@OGUID+23, 178195, 1, 2748.99, -2907.84, 147.325, 1.36136, 0, 0, 0.62932, 0.777146, 10, 10, 1, 100, 0, 10), -- Closest existing guid is 47800 at 36.673634 yards.
(@OGUID+24, 178195, 1, 2798.02, -2955.86, 149.086, 1.18682, 0, 0, 0.559193, 0.829038, 10, 10, 1, 100, 0, 10), -- Closest existing guid is 47800 at 105.300278 yards.
(@OGUID+25, 178195, 1, 2741.81, -2978.87, 140.917, 0.436332, 0, 0, 0.216439, 0.976296, 10, 10, 1, 100, 0, 10), -- Closest existing guid is 47800 at 98.476181 yards.
(@OGUID+26, 178195, 1, 2763.43, -2948.9, 143.182, 6.24828, 0, 0, -0.0174522, 0.999848, 10, 10, 1, 100, 0, 10); -- Closest existing guid is 47800 at 78.125961 yards.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 13, 'Ashenvale - Warsong Oils', 0, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `description`) VALUES
(178195, @PTEMPLATE+2, 'Ashenvale - Warsong Oils');
UPDATE `gameobject` SET `spawntimesecsmin` = 180, `spawntimesecsmax` = 180 WHERE `id` = 178195;

-- Missing Miners' League Crates spawns in Loch Modan.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+27, 271, 0, -4891.73, -2966.21, 316.63, 4.97419, 0, 0, -0.608761, 0.793354, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 13287 at 28.678619 yards.
(@OGUID+28, 271, 0, -4893.47, -2984.15, 316.954, 5.72468, 0, 0, -0.275637, 0.961262, 180, 180, 1, 100, 0, 10); -- Closest existing guid is 13610 at 28.820187 yards.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 5, 'Loch Modan - Miners League Crates', 0, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(271, @PTEMPLATE+3, 0, 'Loch Modan - Miners League Crates', 0, 10);
UPDATE `gameobject` SET `spawntimesecsmin` = 180, `spawntimesecsmax` = 180 WHERE `id` = 271;

-- Missing Death Cap
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+29, 11713, 1, 6787.37, -719.039, 89.3338, 4.45059, 0, 0, -0.793353, 0.608762, 10, 10, 1, 100, 0, 10), -- Closest existing guid is 48689 at 35.802418 yards.
(@OGUID+30, 11713, 1, 6746.37, -685.748, 69.7221, 2.04204, 0, 0, 0.85264, 0.522499, 10, 10, 1, 100, 0, 10), -- Closest existing guid is 48685 at 18.173227 yards.
(@OGUID+31, 11713, 1, 6796.33, -762.062, 69.6737, 1.0821, 0, 0, 0.515038, 0.857168, 10, 10, 1, 100, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 5, 'Darkshore - Death Cap', 0, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(11713, @PTEMPLATE+4, 0, 'Darkshore - Death Cap', 0, 10);
UPDATE `gameobject` SET `spawntimesecsmin` = 180, `spawntimesecsmax` = 180 WHERE `id` = 11713;

-- Missing Loose Soil spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+32, 331, 0, -3469.87, -1836.43, 17.2882, 0, 0, 0, 0, 1, 30, 60, 1, 100, 0, 10), -- Closest existing guid is 9739 at 90.631569 yards.
(@OGUID+33, 331, 0, -3392.07, -1857.27, 25.8701, 0.331611, 0, 0, 0.165047, 0.986286, 30, 60, 1, 100, 0, 10), -- Closest existing guid is 9740 at 94.013260 yards.
(@OGUID+34, 331, 0, -3549.77, -1723.89, 81.994, 2.75761, 0, 0, 0.981627, 0.190812, 30, 60, 1, 100, 0, 10), -- Closest existing guid is 9742 at 45.769291 yards.
(@OGUID+35, 331, 0, -3568.4, -1845.56, 24.3617, 3.31614, 0, 0, -0.996194, 0.087165, 30, 60, 1, 100, 0, 10), -- Closest existing guid is 9742 at 95.571922 yards.
(@OGUID+36, 331, 0, -3500.26, -1766.83, 16.417, 2.67035, 0, 0, 0.972369, 0.233448, 30, 60, 1, 100, 0, 10), -- Closest existing guid is 9741 at 45.956619 yards.
(@OGUID+37, 331, 0, -3461.63, -1803.47, 25.7061, 4.45059, 0, 0, -0.793353, 0.608762, 30, 60, 1, 100, 0, 10), -- Closest existing guid is 9739 at 58.002724 yards.
(@OGUID+38, 331, 0, -3420.89, -1856.84, 16.9872, 2.51327, 0, 0, 0.951056, 0.309017, 30, 60, 1, 100, 0, 10), -- Closest existing guid is 9739 at 99.475723 yards.
(@OGUID+39, 331, 0, -3393.8, -1825.06, 24.913, 1.09956, 0, 0, 0.522498, 0.85264, 30, 60, 1, 100, 0, 10), -- Closest existing guid is 9739 at 74.193367 yards.
(@OGUID+40, 331, 0, -3432.51, -1790.23, 16.3942, 4.15388, 0, 0, -0.874619, 0.48481, 30, 60, 1, 100, 0, 10), -- Closest existing guid is 9739 at 34.875607 yards.
(@OGUID+41, 331, 0, -3470.78, -1863.77, 24.0417, 5.49779, 0, 0, -0.382683, 0.92388, 30, 60, 1, 100, 0, 10), -- Closest existing guid is 9739 at 115.009499 yards.
(@OGUID+42, 331, 0, -3550.56, -1805.25, 27.3557, 5.93412, 0, 0, -0.173648, 0.984808, 30, 60, 1, 100, 0, 10), -- Closest existing guid is 9742 at 65.498001 yards.
(@OGUID+43, 331, 0, -3391.45, -1783.01, 25.2344, 3.31614, 0, 0, -0.996194, 0.087165, 30, 60, 1, 100, 0, 10); -- Closest existing guid is 9739 at 42.351723 yards.
UPDATE `pool_template` SET `max_limit`=6 WHERE  `entry`=152;
UPDATE `gameobject` SET `spawntimesecsmin` = 180, `spawntimesecsmax` = 180 WHERE `id` = 331;

-- Missing Stardust Covered Bush spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+44, 19016, 1, 2094.48, -267.58, 94.5631, 5.13127, 0, 0, -0.544639, 0.838671, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 47887 at 22.081537 yards.
(@OGUID+45, 19016, 1, 2065.15, -263.138, 95.2919, 5.79449, 0, 0, -0.241921, 0.970296, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 47887 at 10.435078 yards.
(@OGUID+46, 19016, 1, 2086.73, -236.191, 97.2096, 2.42601, 0, 0, 0.936672, 0.350207, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 47883 at 14.339638 yards.
(@OGUID+47, 19016, 1, 2116.37, -207.953, 97.0796, 5.95157, 0, 0, -0.165047, 0.986286, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 47889 at 28.446453 yards.
(@OGUID+48, 19016, 1, 2049.06, -253.306, 97.1589, 0.90757, 0, 0, 0.438371, 0.898794, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 47887 at 29.217587 yards.
(@OGUID+49, 19016, 1, 2058.03, -179.217, 95.2847, 1.15192, 0, 0, 0.544639, 0.838671, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 47886 at 20.459620 yards.
(@OGUID+50, 19016, 1, 2127.18, -222.545, 97.0247, 2.46091, 0, 0, 0.942641, 0.333808, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 47885 at 36.982529 yards.
(@OGUID+51, 19016, 1, 2108.54, -224.343, 97.071, 1.74533, 0, 0, 0.766044, 0.642789, 180, 180, 1, 100, 0, 10); -- Closest existing guid is 47889 at 19.453566 yards.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+5, 7, 'Ashenvale - Stardust Covered Bush', 0, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(19016, @PTEMPLATE+5, 0, 'Ashenvale - Stardust Covered Bush', 0, 10);

-- Missing Shimmerweed Basket
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+52, 276, 0, -5328.81, -237.058, 440.409, 5.72468, 0, 0, -0.275637, 0.961262, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 10131 at 6.366234 yards.
(@OGUID+53, 276, 0, -5018.66, -284.39, 441.669, 5.72468, 0, 0, -0.275637, 0.961262, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 10193 at 20.013279 yards.
(@OGUID+54, 276, 0, -5054.04, -264.371, 441.49, 0, 0, 0, 0, 1, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 10181 at 6.372083 yards.
(@OGUID+55, 276, 0, -5021.43, -208.935, 445.487, 0.191985, 0, 0, 0.0958452, 0.995396, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 10178 at 6.593803 yards.
(@OGUID+56, 276, 0, -5028.47, -252.546, 442.879, 0, 0, 0, 0, 1, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 10193 at 17.270668 yards.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+6, 8, 'Dun Morogh - Shimmerweed Basket', 0, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(276, @PTEMPLATE+6, 0, 'Dun Morogh - Shimmerweed Basket', 0, 10);
UPDATE `gameobject` SET `spawntimesecsmin` = 180, `spawntimesecsmax` = 180 WHERE `id` = 276;

-- Missing Wildkin Feather spawns in The Hinterlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+57, 153239, 0, 205.795, -2174.33, 108.727, 2.84488, 0, 0, 0.989016, 0.147811, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 46330 at 87.851929 yards.
(@OGUID+58, 153239, 0, 191.618, -2281.54, 103.856, 3.94445, 0, 0, -0.920505, 0.390732, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 46335 at 76.846687 yards.
(@OGUID+59, 153239, 0, 96.7856, -2395.4, 124.498, 1.27409, 0, 0, 0.594822, 0.803857, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 46277 at 69.649513 yards.
(@OGUID+60, 153239, 0, 2.94607, -2569.56, 119.592, 4.17134, 0, 0, -0.870356, 0.492424, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 46343 at 62.192589 yards.
(@OGUID+61, 153239, 0, -123.471, -2544.14, 122.048, 3.50812, 0, 0, -0.983254, 0.182238, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 46343 at 84.936661 yards.
(@OGUID+62, 153239, 0, -83.7073, -2670.24, 127.294, 1.29154, 0, 0, 0.601814, 0.798636, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 46274 at 57.491772 yards.
(@OGUID+63, 153239, 0, 47.3673, -2776.53, 125.193, 1.3439, 0, 0, 0.622514, 0.782609, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 46317 at 20.232862 yards.
(@OGUID+64, 153239, 0, 69.5435, -2769.64, 118.309, 4.79966, 0, 0, -0.67559, 0.737278, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 46317 at 19.741524 yards.
(@OGUID+65, 153239, 0, -83.6674, -2848.91, 122.059, 4.57276, 0, 0, -0.754709, 0.656059, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 46338 at 71.322159 yards.
(@OGUID+66, 153239, 0, 69.3124, -2870.35, 115.684, 1.62316, 0, 0, 0.725374, 0.688355, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 46261 at 41.509106 yards.
(@OGUID+67, 153239, 0, 80.4471, -2528.41, 113.989, 2.04204, 0, 0, 0.85264, 0.522499, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 46336 at 56.389721 yards.
(@OGUID+68, 153239, 0, 127.448, -2493.27, 120.31, 5.044, 0, 0, -0.580703, 0.814116, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 46333 at 33.551682 yards.
(@OGUID+69, 153239, 0, 87.8953, -2572.14, 112.121, 2.77507, 0, 0, 0.983254, 0.182238, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 46336 at 15.781225 yards.
(@OGUID+70, 153239, 0, 139.976, -2864.91, 115.417, 4.20625, 0, 0, -0.861629, 0.507539, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 46261 at 39.070152 yards.
(@OGUID+71, 153239, 0, 194.53, -2491.13, 128.471, 0.541051, 0, 0, 0.267238, 0.963631, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 46344 at 69.951805 yards.
(@OGUID+72, 153239, 0, -194.949, -2590.71, 119.634, 4.86947, 0, 0, -0.649447, 0.760406, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 46309 at 108.610672 yards.
(@OGUID+73, 153239, 0, -173.508, -2799.11, 119.449, 3.73501, 0, 0, -0.956305, 0.292372, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 46274 at 100.486443 yards.
(@OGUID+74, 153239, 0, -122.271, -2769.74, 120.518, 4.93928, 0, 0, -0.622514, 0.782609, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 46274 at 56.764297 yards.
(@OGUID+75, 153239, 0, -215.548, -2728.71, 116.61, 2.80998, 0, 0, 0.986285, 0.16505, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 46274 at 95.770546 yards.
(@OGUID+76, 153239, 0, 108.32, -2589.14, 119.623, 0.506145, 0, 0, 0.25038, 0.968148, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 46336 at 12.050517 yards.
(@OGUID+77, 153239, 0, 107.89, -2648.31, 117.056, 3.63029, 0, 0, -0.970295, 0.241925, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 46331 at 36.357037 yards.
(@OGUID+78, 153239, 0, 111.844, -2968.95, 116.937, 1.25664, 0, 0, 0.587785, 0.809017, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 46228 at 78.280037 yards.
(@OGUID+79, 153239, 0, -189.021, -2667.57, 120.135, 4.88692, 0, 0, -0.642787, 0.766045, 180, 180, 1, 100, 0, 10); -- Closest existing guid is 46274 at 81.843163 yards.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+7, 44, 'Hinterlands - Wildkin Feather', 0, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(153239, @PTEMPLATE+7, 0, 'Hinterlands - Wildkin Feather', 0, 10);

-- Missing Large Termite Mound spawns in Eastern Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+80, 177464, 0, 3005.32, -4070.9, 99.0826, 3.7001, 0, 0, -0.961261, 0.27564, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45862 at 138.168289 yards.
(@OGUID+81, 177464, 0, 2883.59, -3801.83, 110.205, 0.401425, 0, 0, 0.199368, 0.979925, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45852 at 54.956425 yards.
(@OGUID+82, 177464, 0, 3026.57, -3496.16, 151.803, 0.453785, 0, 0, 0.224951, 0.97437, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45889 at 94.798019 yards.
(@OGUID+83, 177464, 0, 3009.17, -3350.52, 142.172, 2.56563, 0, 0, 0.958819, 0.284016, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45789 at 55.564514 yards.
(@OGUID+84, 177464, 0, 3031.95, -3122.73, 120.407, 4.25861, 0, 0, -0.848047, 0.529921, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45867 at 78.930305 yards.
(@OGUID+85, 177464, 0, 3065.83, -3094.37, 126.452, 3.49067, 0, 0, -0.984807, 0.173652, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45849 at 91.663979 yards.
(@OGUID+86, 177464, 0, 3299.66, -3041.3, 142.884, 5.67232, 0, 0, -0.300705, 0.953717, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45859 at 56.833565 yards.
(@OGUID+87, 177464, 0, 3176.14, -3286.39, 163.574, 4.2237, 0, 0, -0.857167, 0.515038, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45850 at 64.459328 yards.
(@OGUID+88, 177464, 0, 3161.73, -3431.04, 158.997, 0.680677, 0, 0, 0.333806, 0.942642, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45873 at 66.914688 yards.
(@OGUID+89, 177464, 0, 3159.3, -3589.56, 147.144, 4.64258, 0, 0, -0.731354, 0.681998, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45888 at 38.915195 yards.
(@OGUID+90, 177464, 0, 3164.12, -3728, 134.284, 2.82743, 0, 0, 0.987688, 0.156436, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45874 at 42.458164 yards.
(@OGUID+91, 177464, 0, 3029.15, -2992.28, 114.925, 2.89725, 0, 0, 0.992546, 0.12187, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45788 at 75.457748 yards.
(@OGUID+92, 177464, 0, 2964.19, -3105.65, 112.549, 2.1293, 0, 0, 0.874619, 0.48481, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45867 at 119.770988 yards.
(@OGUID+93, 177464, 0, 3060.6, -3851.3, 119.154, 1.53589, 0, 0, 0.694658, 0.71934, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45858 at 74.443840 yards.
(@OGUID+94, 177464, 0, 2947.86, -3876.89, 125, 3.17653, 0, 0, -0.999847, 0.0174693, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45852 at 45.058182 yards.
(@OGUID+95, 177464, 0, 2962.72, -3641.03, 131.199, 0.628317, 0, 0, 0.309016, 0.951057, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45889 at 66.537819 yards.
(@OGUID+96, 177464, 0, 3165.4, -3536.86, 153.719, 5.88176, 0, 0, -0.199368, 0.979925, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45888 at 32.628113 yards.
(@OGUID+97, 177464, 0, 3062.51, -3293.22, 144.476, 2.9845, 0, 0, 0.996917, 0.0784664, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45867 at 100.231873 yards.
(@OGUID+98, 177464, 0, 3192.66, -3122.59, 158.035, 4.17134, 0, 0, -0.870356, 0.492424, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45849 at 46.338120 yards.
(@OGUID+99, 177464, 0, 2889.87, -4000.27, 102.284, 1.0821, 0, 0, 0.515038, 0.857168, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45862 at 50.122066 yards.
(@OGUID+100, 177464, 0, 2972.09, -3900.67, 117.967, 5.11382, 0, 0, -0.551936, 0.833886, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45852 at 78.690422 yards.
(@OGUID+101, 177464, 0, 3232.37, -3418.94, 144.832, 4.86947, 0, 0, -0.649447, 0.760406, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45790 at 58.849575 yards.
(@OGUID+102, 177464, 0, 3336.8, -3626.68, 147.302, 5.16618, 0, 0, -0.529919, 0.848048, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45874 at 163.145035 yards.
(@OGUID+103, 177464, 0, 3331.53, -3742.98, 157.961, 4.01426, 0, 0, -0.906307, 0.422619, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45874 at 129.939316 yards.
(@OGUID+104, 177464, 0, 3215.45, -3868.48, 136.815, 4.31097, 0, 0, -0.833885, 0.551938, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45890 at 42.278576 yards.
(@OGUID+105, 177464, 0, 3237.94, -3010.82, 126.975, 2.21657, 0, 0, 0.894934, 0.446199, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45857 at 43.837475 yards.
(@OGUID+106, 177464, 0, 3233.65, -3130.15, 160.076, 2.18166, 0, 0, 0.887011, 0.461749, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45859 at 78.198883 yards.
(@OGUID+107, 177464, 0, 3160.54, -3837.46, 128.316, 3.45576, 0, 0, -0.987688, 0.156436, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45890 at 40.337799 yards.
(@OGUID+108, 177464, 0, 3008.96, -3648.81, 138.91, 6.23083, 0, 0, -0.0261765, 0.999657, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45889 at 76.132599 yards.
(@OGUID+109, 177464, 0, 3182.62, -3214.05, 160.985, 0.383971, 0, 0, 0.190808, 0.981627, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45849 at 111.998085 yards.
(@OGUID+110, 177464, 0, 3138.45, -3960.4, 111.758, 3.56047, 0, 0, -0.978148, 0.207912, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45858 at 67.734070 yards.
(@OGUID+111, 177464, 0, 2767.12, -3909.49, 98.2715, 5.51524, 0, 0, -0.374606, 0.927184, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45877 at 103.757339 yards.
(@OGUID+112, 177464, 0, 3079.91, -3764.93, 133.009, 1.64061, 0, 0, 0.731353, 0.681999, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45871 at 72.452637 yards.
(@OGUID+113, 177464, 0, 3113.45, -3633.66, 146.398, 4.4855, 0, 0, -0.782608, 0.622515, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45888 at 102.332329 yards.
(@OGUID+114, 177464, 0, 3127.75, -3135.91, 160.298, 0.349065, 0, 0, 0.173648, 0.984808, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45849 at 35.910843 yards.
(@OGUID+115, 177464, 0, 2794.01, -3198.74, 110.21, 0.244346, 0, 0, 0.121869, 0.992546, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45732 at 44.325020 yards.
(@OGUID+116, 177464, 0, 2920.42, -3177.44, 118.566, 4.43314, 0, 0, -0.798635, 0.601815, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45732 at 96.200844 yards.
(@OGUID+117, 177464, 0, 2783.32, -3712.19, 103.139, 4.41568, 0, 0, -0.803857, 0.594823, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45877 at 108.611107 yards.
(@OGUID+118, 177464, 0, 2918.73, -3613.49, 115.49, 3.47321, 0, 0, -0.986285, 0.16505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45891 at 74.445801 yards.
(@OGUID+119, 177464, 0, 3071.9, -3992.19, 106.312, 1.41372, 0, 0, 0.649447, 0.760406, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45858 at 102.775002 yards.
(@OGUID+120, 177464, 0, 3085.49, -3533.2, 135.754, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45873 at 67.129311 yards.
(@OGUID+121, 177464, 0, 3010.9, -3281.43, 139.33, 0.872664, 0, 0, 0.422618, 0.906308, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45866 at 50.288948 yards.
(@OGUID+122, 177464, 0, 3010.59, -3249.58, 143.781, 3.78737, 0, 0, -0.948323, 0.317306, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45867 at 57.172810 yards.
(@OGUID+123, 177464, 0, 3225.21, -3167.04, 149.742, 4.53786, 0, 0, -0.766044, 0.642789, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45849 at 97.595428 yards.
(@OGUID+124, 177464, 0, 3031.23, -3730.52, 127.546, 2.53072, 0, 0, 0.953716, 0.300708, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45872 at 50.942039 yards.
(@OGUID+125, 177464, 0, 2918.59, -3327.23, 120.493, 5.72468, 0, 0, -0.275637, 0.961262, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45866 at 59.782982 yards.
(@OGUID+126, 177464, 0, 2933.01, -3050.32, 111.408, 1.0472, 0, 0, 0.5, 0.866025, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45733 at 110.367332 yards.
(@OGUID+127, 177464, 0, 2886.06, -3918.41, 107.714, 6.14356, 0, 0, -0.0697556, 0.997564, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45862 at 55.658493 yards.
(@OGUID+128, 177464, 0, 2845.49, -3721.67, 108.643, 1.69297, 0, 0, 0.748956, 0.66262, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45891 at 66.140343 yards.
(@OGUID+129, 177464, 0, 2837.75, -3477.08, 106.876, 0.855211, 0, 0, 0.414693, 0.909961, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45878 at 64.636810 yards.
(@OGUID+130, 177464, 0, 3041.71, -3895.81, 117.727, 4.7473, 0, 0, -0.694658, 0.71934, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45858 at 73.187599 yards.
(@OGUID+131, 177464, 0, 3044.73, -3030.82, 125.754, 5.61996, 0, 0, -0.325567, 0.945519, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45788 at 80.787560 yards.
(@OGUID+132, 177464, 0, 2938.07, -3422.84, 132.954, 0.261798, 0, 0, 0.130526, 0.991445, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45878 at 66.888298 yards.
(@OGUID+133, 177464, 0, 2861.42, -3295.48, 112.382, 5.2709, 0, 0, -0.484809, 0.87462, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45732 at 90.740112 yards.
(@OGUID+134, 177464, 0, 2866.64, -3183.02, 118.198, 4.69494, 0, 0, -0.71325, 0.70091, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45732 at 47.117676 yards.
(@OGUID+135, 177464, 0, 2857.62, -3656.35, 113.858, 4.85202, 0, 0, -0.656058, 0.75471, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45891 at 51.851563 yards.
(@OGUID+136, 177464, 0, 2796.9, -3648.62, 102.826, 3.4383, 0, 0, -0.989016, 0.147811, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45891 at 110.732063 yards.
(@OGUID+137, 177464, 0, 2887.31, -3274.73, 124.875, 2.79252, 0, 0, 0.984807, 0.173652, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45866 at 77.554825 yards.
(@OGUID+138, 177464, 0, 3107.83, -3111.81, 150.77, 2.53072, 0, 0, 0.953716, 0.300708, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45849 at 43.200378 yards.
(@OGUID+139, 177464, 0, 3181.33, -3169.7, 157.345, 4.81711, 0, 0, -0.66913, 0.743145, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45849 at 70.491478 yards.
(@OGUID+140, 177464, 0, 2926.1, -3489.14, 122.402, 2.63544, 0, 0, 0.968147, 0.250381, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45878 at 82.160118 yards.
(@OGUID+141, 177464, 0, 2888.19, -3539.11, 112.085, 1.20428, 0, 0, 0.566406, 0.824126, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45889 at 105.987244 yards.
(@OGUID+142, 177464, 0, 3028.16, -3150.33, 122.155, 0.663223, 0, 0, 0.325567, 0.945519, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45867 at 53.062759 yards.
(@OGUID+143, 177464, 0, 2809.28, -3295.59, 99.5157, 3.82227, 0, 0, -0.942641, 0.333808, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45732 at 91.968102 yards.
(@OGUID+144, 177464, 0, 3180.04, -3007.34, 125.389, 4.53786, 0, 0, -0.766044, 0.642789, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45848 at 47.802933 yards.
(@OGUID+145, 177464, 0, 3272.09, -3084.48, 158.415, 0.104719, 0, 0, 0.0523357, 0.99863, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45859 at 40.609566 yards.
(@OGUID+146, 177464, 0, 3153.27, -3373.76, 154.009, 5.93412, 0, 0, -0.173648, 0.984808, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45850 at 60.058666 yards.
(@OGUID+147, 177464, 0, 3266.84, -3792.71, 144.374, 1.6057, 0, 0, 0.719339, 0.694659, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45874 at 95.344894 yards.
(@OGUID+148, 177464, 0, 3257.55, -3734.91, 145.85, 4.13643, 0, 0, -0.878817, 0.47716, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45874 at 55.456909 yards.
(@OGUID+149, 177464, 0, 3117.16, -3031.48, 131.624, 3.54302, 0, 0, -0.979924, 0.19937, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45788 at 60.435459 yards.
(@OGUID+150, 177464, 0, 3264.9, -2995.55, 129.91, 4.88692, 0, 0, -0.642787, 0.766045, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45857 at 19.597006 yards.
(@OGUID+151, 177464, 0, 2928.42, -3220.76, 124.062, 4.5204, 0, 0, -0.771625, 0.636078, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 45866 at 76.012115 yards.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+8, 44, 'Eastern Plaguelands - Large Termite Mound', 0, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(177464, @PTEMPLATE+8, 0, 'Eastern Plaguelands - Large Termite Mound', 0, 10);
UPDATE `gameobject` SET `spawntimesecsmin` = 180, `spawntimesecsmax` = 180 WHERE `id` = 177464;

-- Missing Ambercorn spawns in Mulgore.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+152, 2912, 1, -1433.32, -387.397, -46.2085, 1.58825, 0, 0, 0.71325, 0.70091, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 18820 at 95.283951 yards.
(@OGUID+153, 2912, 1, -1586.8, -331.475, -30.3236, 2.05949, 0, 0, 0.857167, 0.515038, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 18921 at 251.156021 yards.
(@OGUID+154, 2912, 1, -1892.86, -434.164, -5.15549, 4.95674, 0, 0, -0.615661, 0.788011, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 18921 at 95.194130 yards.
(@OGUID+155, 2912, 1, -2443.54, -605.072, -2.96866, 4.27606, 0, 0, -0.843391, 0.5373, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 20319 at 80.625099 yards.
(@OGUID+156, 2912, 1, -2459.35, -619.561, -2.63018, 0.174532, 0, 0, 0.0871553, 0.996195, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 20319 at 94.545189 yards.
(@OGUID+157, 2912, 1, -2441.47, -1475.93, 31.9935, 3.57793, 0, 0, -0.976295, 0.216442, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 18857 at 292.050293 yards.
(@OGUID+158, 2912, 1, -1253.35, -557.481, -55.9928, 4.69494, 0, 0, -0.71325, 0.70091, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 18815 at 137.339951 yards.
(@OGUID+159, 2912, 1, -2035.87, -51.518, -5.00589, 4.64258, 0, 0, -0.731354, 0.681998, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 20321 at 71.568497 yards.
(@OGUID+160, 2912, 1, -1925.65, -676.451, -4.03008, 5.35816, 0, 0, -0.446198, 0.894935, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 18869 at 61.193794 yards.
(@OGUID+161, 2912, 1, -2556.47, -815.005, -0.147034, 4.2237, 0, 0, -0.857167, 0.515038, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 20325 at 120.572693 yards.
(@OGUID+162, 2912, 1, -2708.71, -330.148, -0.372176, 2.87979, 0, 0, 0.991445, 0.130528, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 18855 at 80.179947 yards.
(@OGUID+163, 2912, 1, -2570.12, -228.345, -8.49608, 3.24635, 0, 0, -0.998629, 0.0523532, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 18855 at 111.718788 yards.
(@OGUID+164, 2912, 1, -2752.97, -190.937, 15.3972, 2.96704, 0, 0, 0.996194, 0.087165, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 18824 at 89.299751 yards.
(@OGUID+165, 2912, 1, -2794.86, -677.109, 16.6269, 2.72271, 0, 0, 0.978148, 0.207912, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 20314 at 131.462662 yards.
(@OGUID+166, 2912, 1, -2478.16, -1241.01, -2.6469, 5.65487, 0, 0, -0.309016, 0.951057, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 18898 at 217.281708 yards.
(@OGUID+167, 2912, 1, -652.837, -528.393, -6.65837, 3.78737, 0, 0, -0.948323, 0.317306, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 18828 at 224.075348 yards.
(@OGUID+168, 2912, 1, -1648.95, 268.623, 30.9097, 4.62512, 0, 0, -0.737277, 0.675591, 180, 180, 1, 100, 0, 10); -- Closest existing guid is 18713 at 119.798668 yards.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+9, 31, 'Mulgore - Ambercorn', 0, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(2912, @PTEMPLATE+9, 0, 'Mulgore - Ambercorn', 0, 10);

-- Missing Pupellyverbos Port spawns in The Hinterlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+169, 2068, 0, 110.22, -4728.37, 7.06235, 1.15192, 0, 0, 0.544639, 0.838671, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 46351 at 56.596493 yards.
(@OGUID+170, 2068, 0, 77.42, -4728.21, 7.57427, 6.07375, 0, 0, -0.104528, 0.994522, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 46410 at 43.580128 yards.
(@OGUID+171, 2068, 0, -184.38, -4489.35, 12.9905, 3.89209, 0, 0, -0.930417, 0.366502, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 46378 at 87.156036 yards.
(@OGUID+172, 2068, 0, -337.181, -4554.87, 11.4991, 1.55334, 0, 0, 0.700909, 0.713251, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 46379 at 51.143814 yards.
(@OGUID+173, 2068, 0, -411.438, -4509.61, 10.2161, 2.40855, 0, 0, 0.93358, 0.358368, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 46375 at 61.469818 yards.
(@OGUID+174, 2068, 0, -2.35569, -4710.65, 5.32679, 3.64774, 0, 0, -0.968147, 0.250381, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 46410 at 52.054420 yards.
(@OGUID+175, 2068, 0, -670.764, -4498.54, 11.2125, 3.194, 0, 0, -0.999657, 0.0262016, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 46415 at 40.281570 yards.
(@OGUID+176, 2068, 0, -139.051, -4565.21, 11.7204, 5.61996, 0, 0, -0.325567, 0.945519, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 46378 at 76.802223 yards.
(@OGUID+177, 2068, 0, -85.1969, -4627.1, 12.2291, 3.82227, 0, 0, -0.942641, 0.333808, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 46436 at 33.784439 yards.
(@OGUID+178, 2068, 0, -301.977, -4591.42, 10.4102, 3.15906, 0, 0, -0.999962, 0.00873464, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 46379 at 46.569794 yards.
(@OGUID+179, 2068, 0, -824.682, -4407.49, 10.5744, 2.56563, 0, 0, 0.958819, 0.284016, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 46287 at 57.019081 yards.
(@OGUID+180, 2068, 0, -875.348, -4421.73, 5.40005, 4.13643, 0, 0, -0.878817, 0.47716, 180, 180, 1, 100, 0, 10); -- Closest existing guid is 46409 at 33.227680 yards.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+10, 20, 'Hinterlands - Pupellyverbos Port', 0, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(2068, @PTEMPLATE+10, 0, 'Hinterlands - Pupellyverbos Port', 0, 10);

-- Missing Bauble Container spawns in Moonglade.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+181, 177785, 1, 7769.78, -2487.91, 417.833, 5.044, 0, 0, -0.580703, 0.814116, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 49210 at 122.972382 yards.
(@OGUID+182, 177785, 1, 7666.62, -2584.24, 400.925, 2.67035, 0, 0, 0.972369, 0.233448, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 49208 at 60.215000 yards.
(@OGUID+183, 177785, 1, 7713.5, -2534.34, 398.51, 5.84685, 0, 0, -0.216439, 0.976296, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 49210 at 78.189667 yards.
(@OGUID+184, 177785, 1, 7592.7, -2779.52, 401.488, 1.27409, 0, 0, 0.594822, 0.803857, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 49208 at 150.663040 yards.
(@OGUID+185, 177785, 1, 7666.5, -2679.52, 392.206, 0, 0, 0, 0, 1, 180, 180, 1, 100, 0, 10); -- Closest existing guid is 49208 at 55.329056 yards.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+11, 4, 'Moonglade - Bauble Container', 0, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(177785, @PTEMPLATE+11, 0, 'Moonglade - Bauble Container', 0, 10);

-- Missing Dark Iron Pillow spawns in Searing Gorge.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+186, 179828, 0, -6555.52, -1309.98, 210.26, 1.91986, 0, 0, 0.819152, 0.573577, 300, 300, 1, 100, 3, 10), -- Closest existing guid is 7009 at 9.390129 yards.
(@OGUID+187, 179828, 0, -6554.33, -1313.8, 210.26, 5.28835, 0, 0, -0.477159, 0.878817, 300, 300, 1, 100, 3, 10), -- Closest existing guid is 7009 at 5.459375 yards.
(@OGUID+188, 179828, 0, -6547.68, -1325.57, 212.376, 2.75761, 0, 0, 0.981627, 0.190812, 300, 300, 1, 100, 3, 10), -- Closest existing guid is 7009 at 8.300499 yards.
(@OGUID+189, 179828, 0, -6528.67, -1339.02, 210.124, 2.67035, 0, 0, 0.972369, 0.233448, 300, 300, 1, 100, 3, 10), -- Closest existing guid is 6991 at 10.924319 yards.
(@OGUID+190, 179828, 0, -6523.54, -1364.66, 212.984, 0.418879, 0, 0, 0.207911, 0.978148, 300, 300, 1, 100, 3, 10), -- Closest existing guid is 6974 at 14.772972 yards.
(@OGUID+191, 179828, 0, -6554.68, -1351.74, 212.682, 2.14675, 0, 0, 0.878817, 0.47716, 300, 300, 1, 100, 3, 10), -- Closest existing guid is 7006 at 5.824247 yards.
(@OGUID+192, 179828, 0, -6535.21, -1335.93, 210.214, 2.54818, 0, 0, 0.956305, 0.292372, 300, 300, 1, 100, 3, 10), -- Closest existing guid is 6991 at 18.075546 yards.
(@OGUID+193, 179828, 0, -6531.65, -1337.63, 210.18, 4.39823, 0, 0, -0.809016, 0.587786, 300, 300, 1, 100, 3, 10), -- Closest existing guid is 6991 at 14.167161 yards.
(@OGUID+194, 179828, 0, -6546.63, -1356.37, 212.376, 2.30383, 0, 0, 0.913545, 0.406738, 300, 300, 1, 100, 3, 10), -- Closest existing guid is 7006 at 14.604881 yards.
(@OGUID+195, 179828, 0, -6532.75, -1363.12, 210.812, 5.2709, 0, 0, -0.484809, 0.87462, 300, 300, 1, 100, 3, 10), -- Closest existing guid is 6974 at 24.152454 yards.
(@OGUID+196, 179828, 0, -6527.64, -1340.23, 212.095, 1.83259, 0, 0, 0.793353, 0.608762, 300, 300, 1, 100, 3, 10), -- Closest existing guid is 6991 at 9.848306 yards.
(@OGUID+197, 179828, 0, -6543.81, -1358.71, 210.544, 3.75246, 0, 0, -0.953716, 0.300708, 300, 300, 1, 100, 3, 10), -- Closest existing guid is 7006 at 18.110325 yards.
(@OGUID+198, 179828, 0, -6551.29, -1354.12, 212.668, 3.64774, 0, 0, -0.968147, 0.250381, 300, 300, 1, 100, 3, 10), -- Closest existing guid is 7006 at 9.700323 yards.
(@OGUID+199, 179828, 0, -6551.14, -1354.85, 210.433, 4.36332, 0, 0, -0.819152, 0.573577, 300, 300, 1, 100, 3, 10), -- Closest existing guid is 7006 at 10.001985 yards.
(@OGUID+200, 179828, 0, -6528.76, -1363.6, 212.657, 2.61799, 0, 0, 0.965925, 0.258821, 300, 300, 1, 100, 3, 10), -- Closest existing guid is 6974 at 20.049841 yards.
(@OGUID+201, 179828, 0, -6518.91, -1364.86, 210.541, 5.65487, 0, 0, -0.309016, 0.951057, 300, 300, 1, 100, 3, 10); -- Closest existing guid is 6974 at 10.399881 yards.

-- Missing Excavation Supply Crate spawns in Badlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+202, 2867, 0, -6245.92, -3735.86, 243.396, 3.31614, 0, 0, -0.996194, 0.087165, 10, 10, 1, 100, 0, 10), -- Closest existing guid is 11500 at 33.564705 yards.
(@OGUID+203, 2867, 0, -6254.85, -3735.93, 243.85, 5.00909, 0, 0, -0.594823, 0.803857, 10, 10, 1, 100, 0, 10); -- Closest existing guid is 11500 at 24.963169 yards.

-- Missing Moonpetal Lily spawns in Teldrassil.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+204, 152095, 1, 10571.2, 903.68, 1311.4, 1.6057, 0, 0, 0.719339, 0.694659, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49573 at 13.391023 yards.
(@OGUID+205, 152095, 1, 10527.6, 935.307, 1314.05, 2.3911, 0, 0, 0.930417, 0.366502, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 49586 at 15.905927 yards.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+12, 9, 'Teldrassil - Moonpetal Lily', 0, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(152095, @PTEMPLATE+12, 0, 'Teldrassil - Moonpetal Lily', 0, 10);
UPDATE `gameobject` SET `spawntimesecsmin` = 180, `spawntimesecsmax` = 180 WHERE `id` = 152095;

-- Missing Sapphire of Aku'Mai spawns in Blackfathom Deeps.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+206, 178185, 1, 4255.42, 729.008, -24.2581, 1.48353, 0, 0, 0.67559, 0.737278, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 47706 at 27.524839 yards.
(@OGUID+209, 178185, 1, 4258.72, 838.539, -1.47972, 5.37562, 0, 0, -0.438371, 0.898794, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 12974 at 26.597336 yards.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+13, 5, 'Ashenvale - Sapphire of Aku\'Mai', 0, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(178185, @PTEMPLATE+13, 0, 'Ashenvale - Sapphire of Aku\'Mai', 0, 10);
UPDATE `gameobject` SET `spawntimesecsmin` = 180, `spawntimesecsmax` = 180 WHERE `id` = 178185;

-- Missing Tool Bucket spawns in Western Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+210, 177726, 0, 2876.9, -1549.13, 145.872, 1.76278, 0, 0, 0.771625, 0.636078, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 45433 at 14.553500 yards.
(@OGUID+211, 177726, 0, 2896.48, -1527.02, 146.761, 3.82227, 0, 0, -0.942641, 0.333808, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 45435 at 31.535645 yards.
(@OGUID+212, 177726, 0, 2892.12, -1542.69, 145.804, 0.191985, 0, 0, 0.0958452, 0.995396, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 45435 at 23.106398 yards.
(@OGUID+213, 177726, 0, 2879.44, -1462.61, 145.273, 5.72468, 0, 0, -0.275637, 0.961262, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 45432 at 13.641475 yards.
(@OGUID+214, 177726, 0, 2824.21, -1443.01, 145.818, 4.29351, 0, 0, -0.83867, 0.54464, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 45430 at 44.886936 yards.
(@OGUID+215, 177726, 0, 2968.7, -1476.3, 146.271, 4.25861, 0, 0, -0.848047, 0.529921, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 45434 at 11.732040 yards.
(@OGUID+216, 177726, 0, 2986.87, -1507.66, 145.885, 1.71042, 0, 0, 0.754709, 0.656059, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 45436 at 22.042866 yards.
(@OGUID+217, 177726, 0, 2865.24, -1474.01, 145.742, 1.81514, 0, 0, 0.788011, 0.615662, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 45429 at 10.122108 yards.
(@OGUID+218, 177726, 0, 2874.65, -1527.36, 145.294, 2.00713, 0, 0, 0.843391, 0.5373, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 45433 at 36.391499 yards.
(@OGUID+219, 177726, 0, 3002.21, -1516.26, 145.812, 4.97419, 0, 0, -0.608761, 0.793354, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 45431 at 11.906282 yards.
(@OGUID+220, 177726, 0, 2864.16, -1479.78, 146.027, 4.20625, 0, 0, -0.861629, 0.507539, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 45429 at 8.262079 yards.
(@OGUID+221, 177726, 0, 2857.62, -1464.99, 146.383, 3.80482, 0, 0, -0.945518, 0.325568, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 45430 at 6.647936 yards.
(@OGUID+222, 177726, 0, 2896.78, -1566.02, 145.214, 4.13643, 0, 0, -0.878817, 0.47716, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 45433 at 17.437513 yards.
(@OGUID+223, 177726, 0, 2881.41, -1475.39, 146.244, 2.49582, 0, 0, 0.948323, 0.317306, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 45429 at 10.850341 yards.
(@OGUID+224, 177726, 0, 3016.8, -1519.74, 146.259, 1.0472, 0, 0, 0.5, 0.866025, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 45431 at 11.037997 yards.
(@OGUID+225, 177726, 0, 2873.61, -1466.1, 145.701, 0.767944, 0, 0, 0.374606, 0.927184, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 45430 at 9.840968 yards.
(@OGUID+226, 177726, 0, 2965.24, -1456.32, 145.656, 4.95674, 0, 0, -0.615661, 0.788011, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 45434 at 29.129597 yards.
(@OGUID+227, 177726, 0, 2883.92, -1551.77, 145.329, 3.61284, 0, 0, -0.972369, 0.233448, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 45433 at 12.485304 yards.
(@OGUID+228, 177726, 0, 2972.37, -1486.09, 147.202, 6.12611, 0, 0, -0.0784588, 0.996917, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 45436 at 11.312881 yards.
(@OGUID+229, 177726, 0, 2840.79, -1427.65, 145.459, 2.77507, 0, 0, 0.983254, 0.182238, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 45432 at 38.850014 yards.
(@OGUID+230, 177726, 0, 2888.73, -1571.57, 147.257, 0.139624, 0, 0, 0.0697556, 0.997564, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 45433 at 12.233257 yards.
(@OGUID+231, 177726, 0, 2973.81, -1454.46, 146.139, 6.05629, 0, 0, -0.113203, 0.993572, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 45436 at 32.946182 yards.
(@OGUID+232, 177726, 0, 2971.57, -1519.24, 145.965, 1.83259, 0, 0, 0.793353, 0.608762, 7200, 7200, 1, 100, 0, 10); -- Closest existing guid is 45436 at 35.506332 yards.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+14, 15, 'Western Plaguelands - Tool Bucket', 0, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(177726, @PTEMPLATE+14, 0, 'Western Plaguelands - Tool Bucket', 0, 10);
UPDATE `gameobject` SET `spawntimesecsmin` = 180, `spawntimesecsmax` = 180 WHERE `id` = 177726;


INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+234, 178184, 1, 4240.29, 747.249, -21.9254, 6.05629, 0, 0, -0.113203, 0.993572, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12969 at 20.176172 yards.
(@OGUID+235, 178184, 1, 4217.43, 759.061, -19.9687, 0.418879, 0, 0, 0.207911, 0.978148, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 47702 at 33.557671 yards.
(@OGUID+236, 178184, 1, 4276.26, 736.315, -25.4155, 4.85202, 0, 0, -0.656058, 0.75471, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12969 at 40.703712 yards.
(@OGUID+237, 178184, 1, 4315.48, 889.12, -10.3028, 0.418879, 0, 0, 0.207911, 0.978148, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 12979 at 22.115051 yards.

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+15, 5, 'Darkshore - Scaber Stalk', 0, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(11714, @PTEMPLATE+15, 0, 'Darkshore - Scaber Stalk', 0, 10);

-- Create new pool to hold Blood of Heroes spawns in Western Plaguelands.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(9, 16, 'Western Plaguelands - Blood of Heroes', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(25918, 9, 0, 'Blood of Heroes', 0, 10),
(25919, 9, 0, 'Blood of Heroes', 0, 10),
(25920, 9, 0, 'Blood of Heroes', 0, 10),
(25922, 9, 0, 'Blood of Heroes', 0, 10),
(25923, 9, 0, 'Blood of Heroes', 0, 10),
(25924, 9, 0, 'Blood of Heroes', 0, 10),
(25925, 9, 0, 'Blood of Heroes', 0, 10),
(25926, 9, 0, 'Blood of Heroes', 0, 10),
(25928, 9, 0, 'Blood of Heroes', 0, 10),
(25929, 9, 0, 'Blood of Heroes', 0, 10),
(25930, 9, 0, 'Blood of Heroes', 0, 10),
(25932, 9, 0, 'Blood of Heroes', 0, 10),
(25936, 9, 0, 'Blood of Heroes', 0, 10),
(25945, 9, 0, 'Blood of Heroes', 0, 10),
(25953, 9, 0, 'Blood of Heroes', 0, 10),
(25954, 9, 0, 'Blood of Heroes', 0, 10),
(25958, 9, 0, 'Blood of Heroes', 0, 10),
(25965, 9, 0, 'Blood of Heroes', 0, 10),
(25968, 9, 0, 'Blood of Heroes', 0, 10),
(25970, 9, 0, 'Blood of Heroes', 0, 10),
(45512, 9, 0, 'Blood of Heroes', 0, 10),
(45514, 9, 0, 'Blood of Heroes', 0, 10),
(55345, 9, 0, 'Blood of Heroes', 0, 10),
(55346, 9, 0, 'Blood of Heroes', 0, 10),
(55348, 9, 0, 'Blood of Heroes', 0, 10),
(55349, 9, 0, 'Blood of Heroes', 0, 10),
(55350, 9, 0, 'Blood of Heroes', 0, 10),
(55351, 9, 0, 'Blood of Heroes', 0, 10),
(55352, 9, 0, 'Blood of Heroes', 0, 10),
(55353, 9, 0, 'Blood of Heroes', 0, 10),
(55354, 9, 0, 'Blood of Heroes', 0, 10),
(55356, 9, 0, 'Blood of Heroes', 0, 10),
(55357, 9, 0, 'Blood of Heroes', 0, 10),
(55358, 9, 0, 'Blood of Heroes', 0, 10),
(55359, 9, 0, 'Blood of Heroes', 0, 10),
(55369, 9, 0, 'Blood of Heroes', 0, 10),
(25931, 41, 0, 'Blood of Heroes', 0, 10),
(25934, 41, 0, 'Blood of Heroes', 0, 10);

-- Create new pool to hold Blood of Heroes spawns in Eastern Plaguelands.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(38, 36, 'Eastern Plaguelands - Blood of Heroes', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(25927, 38, 0, 'Blood of Heroes', 0, 10),
(25933, 38, 0, 'Blood of Heroes', 0, 10),
(25935, 38, 0, 'Blood of Heroes', 0, 10),
(25937, 38, 0, 'Blood of Heroes', 0, 10),
(25938, 38, 0, 'Blood of Heroes', 0, 10),
(25939, 38, 0, 'Blood of Heroes', 0, 10),
(25940, 38, 0, 'Blood of Heroes', 0, 10),
(25941, 38, 0, 'Blood of Heroes', 0, 10),
(25942, 38, 0, 'Blood of Heroes', 0, 10),
(25943, 38, 0, 'Blood of Heroes', 0, 10),
(25944, 38, 0, 'Blood of Heroes', 0, 10),
(25946, 38, 0, 'Blood of Heroes', 0, 10),
(25947, 38, 0, 'Blood of Heroes', 0, 10),
(25948, 38, 0, 'Blood of Heroes', 0, 10),
(25949, 38, 0, 'Blood of Heroes', 0, 10),
(25950, 38, 0, 'Blood of Heroes', 0, 10),
(25951, 38, 0, 'Blood of Heroes', 0, 10),
(25952, 38, 0, 'Blood of Heroes', 0, 10),
(25955, 38, 0, 'Blood of Heroes', 0, 10),
(25956, 38, 0, 'Blood of Heroes', 0, 10),
(25957, 38, 0, 'Blood of Heroes', 0, 10),
(25959, 38, 0, 'Blood of Heroes', 0, 10),
(25960, 38, 0, 'Blood of Heroes', 0, 10),
(25961, 38, 0, 'Blood of Heroes', 0, 10),
(25962, 38, 0, 'Blood of Heroes', 0, 10),
(25963, 38, 0, 'Blood of Heroes', 0, 10),
(25964, 38, 0, 'Blood of Heroes', 0, 10),
(25966, 38, 0, 'Blood of Heroes', 0, 10),
(25967, 38, 0, 'Blood of Heroes', 0, 10),
(25969, 38, 0, 'Blood of Heroes', 0, 10),
(25971, 38, 0, 'Blood of Heroes', 0, 10),
(25972, 38, 0, 'Blood of Heroes', 0, 10),
(25973, 38, 0, 'Blood of Heroes', 0, 10),
(25974, 38, 0, 'Blood of Heroes', 0, 10),
(25975, 38, 0, 'Blood of Heroes', 0, 10),
(25976, 38, 0, 'Blood of Heroes', 0, 10),
(25977, 38, 0, 'Blood of Heroes', 0, 10),
(25978, 38, 0, 'Blood of Heroes', 0, 10),
(25979, 38, 0, 'Blood of Heroes', 0, 10),
(25980, 38, 0, 'Blood of Heroes', 0, 10),
(25981, 38, 0, 'Blood of Heroes', 0, 10),
(25982, 38, 0, 'Blood of Heroes', 0, 10),
(25983, 38, 0, 'Blood of Heroes', 0, 10),
(25984, 38, 0, 'Blood of Heroes', 0, 10),
(25985, 38, 0, 'Blood of Heroes', 0, 10),
(25986, 38, 0, 'Blood of Heroes', 0, 10),
(25987, 38, 0, 'Blood of Heroes', 0, 10),
(25988, 38, 0, 'Blood of Heroes', 0, 10),
(25989, 38, 0, 'Blood of Heroes', 0, 10),
(25990, 38, 0, 'Blood of Heroes', 0, 10),
(25991, 38, 0, 'Blood of Heroes', 0, 10),
(25992, 38, 0, 'Blood of Heroes', 0, 10),
(25993, 38, 0, 'Blood of Heroes', 0, 10),
(25994, 38, 0, 'Blood of Heroes', 0, 10),
(25995, 38, 0, 'Blood of Heroes', 0, 10),
(25996, 38, 0, 'Blood of Heroes', 0, 10),
(25997, 38, 0, 'Blood of Heroes', 0, 10),
(45736, 38, 0, 'Blood of Heroes', 0, 10),
(45853, 38, 0, 'Blood of Heroes', 0, 10),
(45868, 38, 0, 'Blood of Heroes', 0, 10),
(45892, 38, 0, 'Blood of Heroes', 0, 10),
(45934, 38, 0, 'Blood of Heroes', 0, 10),
(45936, 38, 0, 'Blood of Heroes', 0, 10),
(55347, 38, 0, 'Blood of Heroes', 0, 10),
(55355, 38, 0, 'Blood of Heroes', 0, 10),
(55360, 38, 0, 'Blood of Heroes', 0, 10),
(55361, 38, 0, 'Blood of Heroes', 0, 10),
(55362, 38, 0, 'Blood of Heroes', 0, 10),
(55363, 38, 0, 'Blood of Heroes', 0, 10),
(55364, 38, 0, 'Blood of Heroes', 0, 10),
(55365, 38, 0, 'Blood of Heroes', 0, 10),
(55366, 38, 0, 'Blood of Heroes', 0, 10),
(55367, 38, 0, 'Blood of Heroes', 0, 10),
(55368, 38, 0, 'Blood of Heroes', 0, 10),
(55370, 38, 0, 'Blood of Heroes', 0, 10),
(55371, 38, 0, 'Blood of Heroes', 0, 10),
(55372, 38, 0, 'Blood of Heroes', 0, 10);

DELETE FROM `pool_gameobject_template` WHERE `pool_entry` = 1634;
DELETE FROM `pool_template` WHERE `entry` = 1634;

-- Correct position of Un'Goro Dirt Pile in Un'Goro Crater (position is off by 0.00100708 yards).
UPDATE `gameobject` SET `position_x`=-6537.01, `position_y`=-878.389, `position_z`=-272.13, `orientation`=2.28638, `rotation0`=0, `rotation1`=0, `rotation2`=0.909961, `rotation3`=0.414694 WHERE `guid`=11181;

-- Correct position of Warsong Oil in Ashenvale (position is off by 4.24072 yards).
UPDATE `gameobject` SET `position_x`=2483.79, `position_y`=-2132.99, `position_z`=201.7, `orientation`=3.54302, `rotation0`=0, `rotation1`=0, `rotation2`=-0.979924, `rotation3`=0.19937 WHERE `guid`=47796;

-- Correct position of Warsong Oil in Ashenvale (position is off by 2.86351 yards).
UPDATE `gameobject` SET `position_x`=2955.12, `position_y`=-2810.06, `position_z`=212.554, `orientation`=4.66003, `rotation0`=0, `rotation1`=0, `rotation2`=-0.725374, `rotation3`=0.688355 WHERE `guid`=47797;

-- Correct position of Half-Buried Bottle in Stranglethorn Vale (position is off by 0.39528 yards).
UPDATE `gameobject` SET `position_x`=-13734.8, `position_y`=-255.343, `position_z`=0.00472, `orientation`=0.523598, `rotation0`=0, `rotation1`=0, `rotation2`=0.258819, `rotation3`=0.965926 WHERE `guid`=11031;

-- Correct position of Half-Buried Bottle in Stranglethorn Vale (position is off by 1.86579 yards).
UPDATE `gameobject` SET `position_x`=-13912.6, `position_y`=-166.436, `position_z`=0.534212, `orientation`=5.98648, `rotation0`=0, `rotation1`=0, `rotation2`=-0.147809, `rotation3`=0.989016 WHERE `guid`=11034;

-- Correct position of Half-Buried Bottle in Stranglethorn Vale (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-14270.1, `position_y`=-17.1997, `position_z`=0.675434, `orientation`=2.18166, `rotation0`=0, `rotation1`=0, `rotation2`=0.887011, `rotation3`=0.461749 WHERE `guid`=26081;

-- Correct position of Sack of Oats in Westfall (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-9848.6, `position_y`=1049.01, `position_z`=33.4474, `orientation`=6.26573, `rotation0`=0, `rotation1`=0, `rotation2`=-0.00872612, `rotation3`=0.999962 WHERE `guid`=25736;

-- Correct position of Sack of Oats in Westfall (position is off by 0.000976563 yards).
UPDATE `gameobject` SET `position_x`=-10427.2, `position_y`=947.126, `position_z`=38.189, `orientation`=5.96903, `rotation0`=0, `rotation1`=0, `rotation2`=-0.156434, `rotation3`=0.987688 WHERE `guid`=25715;

-- Correct position of Sack of Oats in Westfall (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-9804.56, `position_y`=1006.26, `position_z`=29.1304, `orientation`=0.90757, `rotation0`=0, `rotation1`=0, `rotation2`=0.438371, `rotation3`=0.898794 WHERE `guid`=25737;

-- Correct position of Sack of Oats in Westfall (position is off by 0.000976563 yards).
UPDATE `gameobject` SET `position_x`=-11125.2, `position_y`=937.746, `position_z`=36.1692, `orientation`=0.767944, `rotation0`=0, `rotation1`=0, `rotation2`=0.374606, `rotation3`=0.927184 WHERE `guid`=25699;

-- Correct position of Sack of Oats in Westfall (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-11046.5, `position_y`=1557.89, `position_z`=43.3992, `orientation`=4.64258, `rotation0`=0, `rotation1`=0, `rotation2`=-0.731354, `rotation3`=0.681998 WHERE `guid`=25702;

-- Correct position of Sack of Oats in Westfall (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-9868.23, `position_y`=1325.72, `position_z`=43.0655, `orientation`=6.12611, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0784588, `rotation3`=0.996917 WHERE `guid`=25725;

-- Correct position of Sack of Oats in Westfall (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-11165.5, `position_y`=1716.91, `position_z`=40.856, `orientation`=4.04917, `rotation0`=0, `rotation1`=0, `rotation2`=-0.898793, `rotation3`=0.438373 WHERE `guid`=25698;

-- Correct position of Evoroot in Feralas (position is off by 0.00976563 yards).
UPDATE `gameobject` SET `position_x`=-2840.12, `position_y`=2347.59, `position_z`=41.7155, `orientation`=4.90438, `rotation0`=0, `rotation1`=0, `rotation2`=-0.636078, `rotation3`=0.771625 WHERE `guid`=50156;

-- Correct position of Alterac Granite in Hillsbrad Foothills (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-219.077, `position_y`=-343.909, `position_z`=47.6937, `orientation`=0.942477, `rotation0`=0, `rotation1`=0, `rotation2`=0.45399, `rotation3`=0.891007 WHERE `guid`=10367;

-- Correct position of Bottle of Disease in Ashenvale (position is off by 0.297812 yards).
UPDATE `gameobject` SET `position_x`=1910.05, `position_y`=-2642.61, `position_z`=84.2405, `orientation`=4.36332, `rotation0`=0, `rotation1`=0, `rotation2`=-0.819152, `rotation3`=0.573577 WHERE `guid`=47983;

-- Correct position of Ancient Chest in Uldaman (position is off by 0.000991821 yards).
UPDATE `gameobject` SET `position_x`=-6201.66, `position_y`=-3057.53, `position_z`=212.238, `orientation`=2.00618, `rotation0`=-0.0524955, `rotation1`=0.0560932, `rotation2`=0.839878, `rotation3`=0.53731 WHERE `guid`=10919;

-- Correct position of Goodsteel Ledger in Searing Gorge (position is off by 0.180407 yards).
UPDATE `gameobject` SET `position_x`=-7025.01, `position_y`=-1784.49, `position_z`=265.744, `orientation`=2.26893, `rotation0`=0, `rotation1`=0, `rotation2`=0.906307, `rotation3`=0.422619 WHERE `guid`=47578;

-- Correct position of Bundle of Wood in Elwynn Forest (position is off by 0.000102997 yards).
UPDATE `gameobject` SET `position_x`=-9364.32, `position_y`=-1387.31, `position_z`=60.4559, `orientation`=3.6652, `rotation0`=0, `rotation1`=0, `rotation2`=-0.965925, `rotation3`=0.258821 WHERE `guid`=12326;

-- Correct position of Bundle of Wood in Elwynn Forest (position is off by 0.0098877 yards).
UPDATE `gameobject` SET `position_x`=-9350.76, `position_y`=-1421.43, `position_z`=63.5312, `orientation`=0.383971, `rotation0`=0, `rotation1`=0, `rotation2`=0.190808, `rotation3`=0.981627 WHERE `guid`=12334;

-- Correct position of Tool Bucket in The Barrens (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=1056.95, `position_y`=-3175.03, `position_z`=75.2593, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=11725;

-- Correct position of Tool Bucket in The Barrens (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=1129.37, `position_y`=-3030.57, `position_z`=92.0539, `orientation`=1.06465, `rotation0`=0, `rotation1`=0, `rotation2`=0.507538, `rotation3`=0.861629 WHERE `guid`=11721;

-- Correct position of Tool Bucket in The Barrens (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=1146.49, `position_y`=-3074.65, `position_z`=95.9085, `orientation`=2.58308, `rotation0`=0, `rotation1`=0, `rotation2`=0.961261, `rotation3`=0.27564 WHERE `guid`=11728;

-- Correct position of Gahz'ridian in Tanaris (position is off by 0.000100136 yards).
UPDATE `gameobject` SET `position_x`=-8788.72, `position_y`=-3404.95, `position_z`=10.8891, `orientation`=4.36332, `rotation0`=0, `rotation1`=0, `rotation2`=-0.819152, `rotation3`=0.573577 WHERE `guid`=9236;

-- Correct position of Gahz'ridian in Tanaris (position is off by 0.000101089 yards).
UPDATE `gameobject` SET `position_x`=-8908.18, `position_y`=-3343.32, `position_z`=18.6347, `orientation`=5.60251, `rotation0`=0, `rotation1`=0, `rotation2`=-0.333807, `rotation3`=0.942641 WHERE `guid`=9159;

-- Correct position of Gahz'ridian in Tanaris (position is off by 0.0102539 yards).
UPDATE `gameobject` SET `position_x`=-8285.36, `position_y`=-4132.74, `position_z`=10.029, `orientation`=2.87979, `rotation0`=0, `rotation1`=0, `rotation2`=0.991445, `rotation3`=0.130528 WHERE `guid`=9244;

-- Correct position of Taillasher Eggs in Durotar (position is off by 0.0102539 yards).
UPDATE `gameobject` SET `position_x`=-812.713, `position_y`=-5314.82, `position_z`=3.33753, `orientation`=3.99681, `rotation0`=0, `rotation1`=0, `rotation2`=-0.909961, `rotation3`=0.414694 WHERE `guid`=10413;

-- Correct position of Balia'mah Trophy Skulls in Stranglethorn Vale (position is off by 0.000976563 yards).
UPDATE `gameobject` SET `position_x`=-12544, `position_y`=-723.062, `position_z`=40.4432, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=9986;

-- Correct position of Crate of Elunite in Darkshore (position is off by 0.0010376 yards).
UPDATE `gameobject` SET `position_x`=6375.59, `position_y`=871.361, `position_z`=-36.6744, `orientation`=4.86947, `rotation0`=0, `rotation1`=0, `rotation2`=-0.649447, `rotation3`=0.760406 WHERE `guid`=48875;

-- Correct position of Crate of Elunite in Darkshore (position is off by 0.000101089 yards).
UPDATE `gameobject` SET `position_x`=6419.64, `position_y`=732.402, `position_z`=-19.075, `orientation`=2.19911, `rotation0`=0, `rotation1`=0, `rotation2`=0.891006, `rotation3`=0.453991 WHERE `guid`=25783;

-- Correct position of Crate of Elunite in Darkshore (position is off by 0.000976563 yards).
UPDATE `gameobject` SET `position_x`=6468.53, `position_y`=811.574, `position_z`=-36.8584, `orientation`=3.4383, `rotation0`=0, `rotation1`=0, `rotation2`=-0.989016, `rotation3`=0.147811 WHERE `guid`=25787;

-- Correct position of Troll Chest in Ashenvale (position is off by 0.000991821 yards).
UPDATE `gameobject` SET `position_x`=3359.89, `position_y`=-724.698, `position_z`=165.479, `orientation`=3.54302, `rotation0`=0, `rotation1`=0, `rotation2`=-0.979924, `rotation3`=0.19937 WHERE `guid`=12520;

-- Correct position of Troll Chest in Ashenvale (position is off by 0.0010376 yards).
UPDATE `gameobject` SET `position_x`=3328.89, `position_y`=-757.629, `position_z`=166.867, `orientation`=2.28638, `rotation0`=0, `rotation1`=0, `rotation2`=0.909961, `rotation3`=0.414694 WHERE `guid`=12497;

-- Correct position of Sunscorched Shell in Thousand Needles (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-5199.17, `position_y`=-1168.36, `position_z`=48.9649, `orientation`=2.77507, `rotation0`=0, `rotation1`=0, `rotation2`=0.983254, `rotation3`=0.182238 WHERE `guid`=25793;

-- Correct position of Tablet of Sael'hai in Azshara (position is off by 0.0102539 yards).
UPDATE `gameobject` SET `position_x`=3317.96, `position_y`=-5272.68, `position_z`=86.733, `orientation`=3.90954, `rotation0`=0, `rotation1`=0, `rotation2`=-0.927183, `rotation3`=0.374608 WHERE `guid`=25857;

-- Correct position of Basket of Bloodkelp in Dustwallow Marsh (position is off by 0.00976563 yards).
UPDATE `gameobject` SET `position_x`=-2644.77, `position_y`=-4998.72, `position_z`=22.8469, `orientation`=1.79769, `rotation0`=0, `rotation1`=0, `rotation2`=0.782608, `rotation3`=0.622515 WHERE `guid`=13098;

-- Correct position of Highperch Wyvern Egg in Thousand Needles (position is off by 0.0010376 yards).
UPDATE `gameobject` SET `position_x`=-5004.84, `position_y`=-845.741, `position_z`=-5.58322, `orientation`=6.14356, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0697556, `rotation3`=0.997564 WHERE `guid`=12103;

-- Correct position of Scattered Crate in Swamp of Sorrows (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-10387.1, `position_y`=-2904.32, `position_z`=18.8122, `orientation`=2.91469, `rotation0`=0, `rotation1`=0, `rotation2`=0.993571, `rotation3`=0.113208 WHERE `guid`=25762;

-- Correct position of Fel Cone in Teldrassil (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=9939.07, `position_y`=312.243, `position_z`=1318.15, `orientation`=5.28835, `rotation0`=0, `rotation1`=0, `rotation2`=-0.477159, `rotation3`=0.878817 WHERE `guid`=25591;

-- Correct position of Fel Cone in Teldrassil (position is off by 0.0010376 yards).
UPDATE `gameobject` SET `position_x`=9563.05, `position_y`=615.462, `position_z`=1272.59, `orientation`=1.02974, `rotation0`=0, `rotation1`=0, `rotation2`=0.492423, `rotation3`=0.870356 WHERE `guid`=25579;

-- Correct position of Kim'jael's Equipment in Azshara (position is off by 0.0102539 yards).
UPDATE `gameobject` SET `position_x`=4402.83, `position_y`=-6228.16, `position_z`=96.8815, `orientation`=0.0174525, `rotation0`=0, `rotation1`=0, `rotation2`=0.00872612, `rotation3`=0.999962 WHERE `guid`=10629;

-- Correct position of Secret Plans: Fiery Flux in Searing Gorge (position is off by 0.00976563 yards).
UPDATE `gameobject` SET `position_x`=-6631.62, `position_y`=-1225.39, `position_z`=210.617, `orientation`=0.698131, `rotation0`=0, `rotation1`=0, `rotation2`=0.34202, `rotation3`=0.939693 WHERE `guid`=6970;

-- Correct position of Vessel of Tainted Blood in The Hinterlands (position is off by 0.0102539 yards).
UPDATE `gameobject` SET `position_x`=-386.41, `position_y`=-4205.76, `position_z`=174.139, `orientation`=6.21337, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0348988, `rotation3`=0.999391 WHERE `guid`=13026;

-- Correct position of Large Solid Chest in Western Plaguelands (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=2851.74, `position_y`=-1403.16, `position_z`=148.907, `orientation`=0.523598, `rotation0`=0, `rotation1`=0, `rotation2`=0.258819, `rotation3`=0.965926 WHERE `guid`=45537;

-- Correct position of Large Solid Chest in Western Plaguelands (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=2939.02, `position_y`=-1376.04, `position_z`=167.237, `orientation`=5.09636, `rotation0`=0, `rotation1`=0, `rotation2`=-0.559193, `rotation3`=0.829038 WHERE `guid`=45486;

-- Correct position of Silithid Mound in The Barrens (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-3295.54, `position_y`=-1875.07, `position_z`=93.8088, `orientation`=3.99681, `rotation0`=0, `rotation1`=0, `rotation2`=-0.909961, `rotation3`=0.414694 WHERE `guid`=25635;

-- Correct position of Silithid Mound in The Barrens (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-3121.44, `position_y`=-2181.57, `position_z`=94.8178, `orientation`=2.40855, `rotation0`=0, `rotation1`=0, `rotation2`=0.93358, `rotation3`=0.358368 WHERE `guid`=25662;

-- Correct position of Snufflenose Owner's Manual in The Barrens (position is off by 0.134251 yards).
UPDATE `gameobject` SET `position_x`=-929.383, `position_y`=-3693.46, `position_z`=8.70877, `orientation`=4.88692, `rotation0`=0, `rotation1`=0, `rotation2`=-0.642787, `rotation3`=0.766045 WHERE `guid`=13046;

-- Correct position of Apple Bob in The Hinterlands (position is off by 0.000991821 yards).
UPDATE `gameobject` SET `position_x`=398.111, `position_y`=-2100.5, `position_z`=131.84, `orientation`=2.58308, `rotation0`=0, `rotation1`=0, `rotation2`=0.961261, `rotation3`=0.27564 WHERE `guid`=34307;

-- Correct position of Apple Bob in Redridge Mountains (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-9217.99, `position_y`=-2151.35, `position_z`=64.6316, `orientation`=1.93731, `rotation0`=0, `rotation1`=0, `rotation2`=0.824125, `rotation3`=0.566408 WHERE `guid`=332873;

-- Correct position of Apple Bob in Tanaris (position is off by 0.0102539 yards).
UPDATE `gameobject` SET `position_x`=-7154.14, `position_y`=-3842.12, `position_z`=9.06118, `orientation`=4.81711, `rotation0`=0, `rotation1`=0, `rotation2`=-0.66913, `rotation3`=0.743145 WHERE `guid`=332871;

-- Correct position of Apple Bob in Winterspring (position is off by 0.0400391 yards).
UPDATE `gameobject` SET `position_x`=6692.21, `position_y`=-4661.61, `position_z`=721.989, `orientation`=4.97419, `rotation0`=0, `rotation1`=0, `rotation2`=-0.608761, `rotation3`=0.793354 WHERE `guid`=332857;

-- Correct position of Apple Bob in Darkshore (position is off by 0.00976563 yards).
UPDATE `gameobject` SET `position_x`=6415.74, `position_y`=512.385, `position_z`=8.92158, `orientation`=1.65806, `rotation0`=0, `rotation1`=0, `rotation2`=0.737277, `rotation3`=0.675591 WHERE `guid`=332884;

-- Correct position of Apple Bob in Darnassus (position is off by 0.100586 yards).
UPDATE `gameobject` SET `position_x`=10139.1, `position_y`=2223.77, `position_z`=1330.25, `orientation`=2.26893, `rotation0`=0, `rotation1`=0, `rotation2`=0.906307, `rotation3`=0.422619 WHERE `guid`=34414;

-- Correct position of Apple Bob in Feralas (position is off by 0.0102539 yards).
UPDATE `gameobject` SET `position_x`=-4443.64, `position_y`=245.328, `position_z`=39.3853, `orientation`=3.97935, `rotation0`=0, `rotation1`=0, `rotation2`=-0.913545, `rotation3`=0.406738 WHERE `guid`=332868;

-- Correct position of Apple Bob in Badlands (position is off by 0.000991821 yards).
UPDATE `gameobject` SET `position_x`=-6647.28, `position_y`=-2156.66, `position_z`=245.629, `orientation`=3.94445, `rotation0`=0, `rotation1`=0, `rotation2`=-0.920505, `rotation3`=0.390732 WHERE `guid`=332845;

-- Correct position of Apple Bob in Orgrimmar (position is off by 0.00976563 yards).
UPDATE `gameobject` SET `position_x`=1635.93, `position_y`=-4443.07, `position_z`=16.0593, `orientation`=0.645772, `rotation0`=0, `rotation1`=0, `rotation2`=0.317305, `rotation3`=0.948324 WHERE `guid`=332856;

-- Correct position of Calcified Elven Gem in Arathi Highlands (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-2230.11, `position_y`=-1713.47, `position_z`=-64.7426, `orientation`=4.17134, `rotation0`=0, `rotation1`=0, `rotation2`=-0.870356, `rotation3`=0.492424 WHERE `guid`=9305;

-- Correct position of Fissure Plant in The Barrens (position is off by 0.577372 yards).
UPDATE `gameobject` SET `position_x`=-1279.74, `position_y`=-3013.78, `position_z`=71.5814, `orientation`=3.80482, `rotation0`=0, `rotation1`=0, `rotation2`=-0.945518, `rotation3`=0.325568 WHERE `guid`=332892;

-- Correct position of Fissure Plant in The Barrens (position is off by 2.11237 yards).
UPDATE `gameobject` SET `position_x`=-1274.77, `position_y`=-3008.18, `position_z`=71.5097, `orientation`=0, `rotation0`=0, `rotation1`=0, `rotation2`=0, `rotation3`=1 WHERE `guid`=332891;

-- Correct position of Fissure Plant in The Barrens (position is off by 1.60885 yards).
UPDATE `gameobject` SET `position_x`=-1273.74, `position_y`=-3017.27, `position_z`=73.0493, `orientation`=3.78737, `rotation0`=0, `rotation1`=0, `rotation2`=-0.948323, `rotation3`=0.317306 WHERE `guid`=332894;

-- Correct position of Fissure Plant in The Barrens (position is off by 4.69907 yards).
UPDATE `gameobject` SET `position_x`=-1271.31, `position_y`=-3013.2, `position_z`=71.9223, `orientation`=0.488691, `rotation0`=0, `rotation1`=0, `rotation2`=0.241921, `rotation3`=0.970296 WHERE `guid`=332894;

-- Correct position of Fissure Plant in The Barrens (position is off by 2.54256 yards).
UPDATE `gameobject` SET `position_x`=-1279.01, `position_y`=-3010.59, `position_z`=71.5588, `orientation`=2.07694, `rotation0`=0, `rotation1`=0, `rotation2`=0.861629, `rotation3`=0.507539 WHERE `guid`=332890;

-- Correct position of Fissure Plant in The Barrens (position is off by 2.41025 yards).
UPDATE `gameobject` SET `position_x`=-1272.46, `position_y`=-3016.28, `position_z`=72.8214, `orientation`=0.59341, `rotation0`=0, `rotation1`=0, `rotation2`=0.292371, `rotation3`=0.956305 WHERE `guid`=332894;

-- Correct position of Fissure Plant in The Barrens (position is off by 0.959569 yards).
UPDATE `gameobject` SET `position_x`=-1278.46, `position_y`=-3015.85, `position_z`=72.2563, `orientation`=0, `rotation0`=0, `rotation1`=0, `rotation2`=0, `rotation3`=1 WHERE `guid`=332893;

-- Correct position of Frostmaul Shards in Winterspring (position is off by 0.0010376 yards).
UPDATE `gameobject` SET `position_x`=5315.06, `position_y`=-4707.63, `position_z`=699.835, `orientation`=4.81711, `rotation0`=0, `rotation1`=0, `rotation2`=-0.66913, `rotation3`=0.743145 WHERE `guid`=12025;

-- Correct position of Frostmaul Shards in Winterspring (position is off by 0.0102539 yards).
UPDATE `gameobject` SET `position_x`=5273.74, `position_y`=-4674.34, `position_z`=698.687, `orientation`=2.42601, `rotation0`=0, `rotation1`=0, `rotation2`=0.936672, `rotation3`=0.350207 WHERE `guid`=12024;

-- Correct position of Tablet of Markri in Azshara (position is off by 0.0102539 yards).
UPDATE `gameobject` SET `position_x`=3494.48, `position_y`=-5047.47, `position_z`=85.7378, `orientation`=5.53269, `rotation0`=0, `rotation1`=0, `rotation2`=-0.366501, `rotation3`=0.930418 WHERE `guid`=25842;

-- Correct position of Tablet of Markri in Azshara (position is off by 0.0102539 yards).
UPDATE `gameobject` SET `position_x`=3301.12, `position_y`=-5301.28, `position_z`=90.2181, `orientation`=0.890117, `rotation0`=0, `rotation1`=0, `rotation2`=0.430511, `rotation3`=0.902586 WHERE `guid`=25838;

-- Correct position of Atal'ai Artifact in Swamp of Sorrows (position is off by 2.6852 yards).
UPDATE `gameobject` SET `position_x`=-10323.6, `position_y`=-3792.94, `position_z`=-19.7852, `orientation`=3.38594, `rotation0`=0, `rotation1`=0, `rotation2`=-0.992546, `rotation3`=0.12187 WHERE `guid` IN (21723, 21623, 21673);

-- Correct position of Atal'ai Artifact in Swamp of Sorrows (position is off by 0.547199 yards).
UPDATE `gameobject` SET `position_x`=-10414.1, `position_y`=-3933.38, `position_z`=-19.7472, `orientation`=6.02139, `rotation0`=0, `rotation1`=0, `rotation2`=-0.130526, `rotation3`=0.991445 WHERE `guid` IN (21722, 21622, 21672);

-- Correct position of Atal'ai Artifact in Swamp of Sorrows (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-10289.5, `position_y`=-3738.6, `position_z`=14.7113, `orientation`=3.85718, `rotation0`=0, `rotation1`=0, `rotation2`=-0.936671, `rotation3`=0.35021 WHERE `guid` IN (21713, 21613, 21663);

-- Correct position of Twilight Tablet Fragment in Silithus (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-6494.24, `position_y`=1924.91, `position_z`=7.51197, `orientation`=5.41052, `rotation0`=0, `rotation1`=0, `rotation2`=-0.422618, `rotation3`=0.906308 WHERE `guid` IN (24081, 24151, 54116);

-- Correct position of Twilight Tablet Fragment in Silithus (position is off by 0.0098877 yards).
UPDATE `gameobject` SET `position_x`=-6177.33, `position_y`=1784.07, `position_z`=30.2543, `orientation`=5.07891, `rotation0`=0, `rotation1`=0, `rotation2`=-0.566406, `rotation3`=0.824126 WHERE `guid` IN (24087, 24157, 24122);

-- Correct position of Twilight Tablet Fragment in Silithus (position is off by 0.000100136 yards).
UPDATE `gameobject` SET `position_x`=-6352.44, `position_y`=1866.77, `position_z`=10.6696, `orientation`=3.63029, `rotation0`=0, `rotation1`=0, `rotation2`=-0.970295, `rotation3`=0.241925 WHERE `guid` IN (24082, 24152, 24117);

-- Correct position of Twilight Tablet Fragment in Silithus (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-6317.44, `position_y`=1839.62, `position_z`=6.68679, `orientation`=0.558504, `rotation0`=0, `rotation1`=0, `rotation2`=0.275637, `rotation3`=0.961262 WHERE `guid` IN (24118, 24083, 24153);

-- Correct position of Twilight Tablet Fragment in Silithus (position is off by 0.000100136 yards).
UPDATE `gameobject` SET `position_x`=-6254.69, `position_y`=1789.41, `position_z`=10.4657, `orientation`=2.16421, `rotation0`=0, `rotation1`=0, `rotation2`=0.882947, `rotation3`=0.469473 WHERE `guid` IN (24130, 24095, 24165);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
