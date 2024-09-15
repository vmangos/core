DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230604173347');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230604173347');
-- Add your query below.


-- Bruiseweed (1622, 3730)
SET @OGUID = 24166;

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
(@OGUID+1, 1622, 0, -11045.7, 206.046, 27.283, 4.86947, 0, 0, -0.649447, 0.760406, 300, 300, 1, 100, 0, 10),
(@OGUID+2, 1622, 0, -10776.6, -1383.1, 39.0658, 6.02139, 0, 0, -0.130526, 0.991445, 300, 300, 1, 100, 0, 10),
(@OGUID+3, 1622, 0, -10831, -564.47, 36.8656, 0.0349062, 0, 0, 0.0174522, 0.999848, 300, 300, 1, 100, 0, 10),
(@OGUID+4, 1622, 0, -10974.2, -944.671, 70.3839, 5.96903, 0, 0, -0.156434, 0.987688, 300, 300, 1, 100, 0, 10),
(@OGUID+5, 1622, 0, -11073.5, -233.118, 18.9209, 2.30383, 0, 0, 0.913545, 0.406738, 300, 300, 1, 100, 0, 10),
(@OGUID+6, 1622, 0, -11001, -1369.58, 51.7539, 4.01426, 0, 0, -0.906307, 0.422619, 300, 300, 1, 100, 0, 10),
(@OGUID+7, 1622, 0, -11014.1, 194.772, 27.8686, 3.4383, 0, 0, -0.989016, 0.147811, 300, 300, 1, 100, 0, 10),
(@OGUID+8, 1622, 0, -10996.7, -283.717, 30.0249, 5.53269, 0, 0, -0.366501, 0.930418, 300, 300, 1, 100, 0, 10),
(@OGUID+9, 1622, 0, -10933.3, -126.226, 30.1699, 2.75761, 0, 0, 0.981627, 0.190812, 300, 300, 1, 100, 0, 10),
(@OGUID+10, 1622, 0, -10817.4, -1384.31, 44.162, 4.88692, 0, 0, -0.642787, 0.766045, 300, 300, 1, 100, 0, 10),
(@OGUID+11, 1622, 0, -10521.4, -113.655, 57.7244, 3.03684, 0, 0, 0.998629, 0.0523532, 300, 300, 1, 100, 0, 10),
(@OGUID+12, 1622, 0, -10513.9, 294.13, 31.4486, 3.57793, 0, 0, -0.976295, 0.216442, 300, 300, 1, 100, 0, 10),
(@OGUID+13, 1622, 0, -10476.5, -771.538, 59.4434, 4.67748, 0, 0, -0.719339, 0.694659, 300, 300, 1, 100, 0, 10),
(@OGUID+14, 1622, 0, -10415.9, 396.176, 46.7046, 3.82227, 0, 0, -0.942641, 0.333808, 300, 300, 1, 100, 0, 10),
(@OGUID+15, 1622, 0, -10353.9, 200.276, 34.39, 5.32326, 0, 0, -0.461748, 0.887011, 300, 300, 1, 100, 0, 10),
(@OGUID+16, 1622, 0, -10286.4, 70.4633, 39.0389, 2.89725, 0, 0, 0.992546, 0.12187, 300, 300, 1, 100, 0, 10),
(@OGUID+17, 1622, 0, -10251.4, -700.823, 46.9946, 3.7001, 0, 0, -0.961261, 0.27564, 300, 300, 1, 100, 0, 10),
(@OGUID+18, 1622, 0, -10189.1, -218.919, 48.528, 1.27409, 0, 0, 0.594822, 0.803857, 300, 300, 1, 100, 0, 10);

-- Missing Bruiseweed spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+19, 1622, 0, -3831.92, -1310.2, 34.3048, 5.20108, 0, 0, -0.515038, 0.857168, 300, 300, 1, 100, 0, 10),
(@OGUID+20, 1622, 0, -3886.87, -1078.15, 24.5511, 2.09439, 0, 0, 0.866025, 0.500001, 300, 300, 1, 100, 0, 10),
(@OGUID+21, 1622, 0, -3920.28, -1053.16, 28.3773, 2.70526, 0, 0, 0.976295, 0.216442, 300, 300, 1, 100, 0, 10),
(@OGUID+22, 1622, 0, -3369.54, -2349.1, 64.4333, 6.0912, 0, 0, -0.0958452, 0.995396, 300, 300, 1, 100, 0, 10),
(@OGUID+23, 1622, 0, -2955.6, -2622.49, 24.2999, 0.383971, 0, 0, 0.190808, 0.981627, 300, 300, 1, 100, 0, 10),
(@OGUID+24, 1622, 0, -3737.84, -931.895, 7.16821, 5.44543, 0, 0, -0.406736, 0.913546, 300, 300, 1, 100, 0, 10),
(@OGUID+25, 1622, 0, -3461.78, -1839.76, 18.645, 2.37364, 0, 0, 0.927183, 0.374608, 300, 300, 1, 100, 0, 10),
(@OGUID+26, 1622, 0, -3390.06, -1649.96, 24.1359, 5.3058, 0, 0, -0.469471, 0.882948, 300, 300, 1, 100, 0, 10),
(@OGUID+27, 1622, 0, -3280.57, -1743.55, 16.7819, 3.21142, 0, 0, -0.999391, 0.0349061, 300, 300, 1, 100, 0, 10),
(@OGUID+28, 1622, 0, -3106.5, -3245.33, 71.6458, 0.628317, 0, 0, 0.309016, 0.951057, 300, 300, 1, 100, 0, 10),
(@OGUID+29, 1622, 0, -2999.08, -3027.14, 52.8285, 3.03684, 0, 0, 0.998629, 0.0523532, 300, 300, 1, 100, 0, 10),
(@OGUID+30, 1622, 0, -2595.68, -2302.94, 90.4439, 4.62512, 0, 0, -0.737277, 0.675591, 300, 300, 1, 100, 0, 10);

-- Missing Bruiseweed spawns in Alterac Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+31, 1622, 0, 524.242, -222.035, 150.747, 0.488691, 0, 0, 0.241921, 0.970296, 300, 300, 1, 100, 0, 10),
(@OGUID+32, 1622, 0, -56.5404, 293.34, 53.3134, 1.09956, 0, 0, 0.522498, 0.85264, 300, 300, 1, 100, 0, 10),
(@OGUID+33, 1622, 0, 713.813, -316.486, 140.027, 3.49067, 0, 0, -0.984807, 0.173652, 300, 300, 1, 100, 0, 10),
(@OGUID+34, 1622, 0, 669.87, -986.526, 165, 1.22173, 0, 0, 0.573576, 0.819152, 300, 300, 1, 100, 0, 10),
(@OGUID+35, 1622, 0, 701.058, -933.615, 164.16, 5.91667, 0, 0, -0.182235, 0.983255, 300, 300, 1, 100, 0, 10);

-- Missing Bruiseweed spawns in Loch Modan.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+36, 1622, 0, -4989.58, -3872.57, 317.634, 1.91986, 0, 0, 0.819152, 0.573577, 300, 300, 1, 100, 0, 10),
(@OGUID+37, 1622, 0, -5476.34, -3939.22, 354.36, 2.33874, 0, 0, 0.920505, 0.390732, 300, 300, 1, 100, 0, 10),
(@OGUID+38, 1622, 0, -4774.1, -3937.35, 347.532, 0.767944, 0, 0, 0.374606, 0.927184, 300, 300, 1, 100, 0, 10),
(@OGUID+39, 1622, 0, -5316.59, -3923.52, 340.157, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 1, 100, 0, 10),
(@OGUID+40, 1622, 0, -5222.02, -4223.63, 361.923, 1.37881, 0, 0, 0.636078, 0.771625, 300, 300, 1, 100, 0, 10),
(@OGUID+41, 1622, 0, -5021.06, -3924.3, 324.104, 5.89921, 0, 0, -0.190808, 0.981627, 300, 300, 1, 100, 0, 10),
(@OGUID+42, 1622, 0, -4975.73, -4140.55, 311.253, 5.46288, 0, 0, -0.398748, 0.91706, 300, 300, 1, 100, 0, 10),
(@OGUID+43, 1622, 0, -4815.14, -3952.65, 327.612, 6.19592, 0, 0, -0.0436192, 0.999048, 300, 300, 1, 100, 0, 10);

-- Missing Bruiseweed spawns in Westfall.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+44, 1622, 0, -9793.57, 1498.49, 42.9337, 4.4855, 0, 0, -0.782608, 0.622515, 300, 300, 1, 100, 0, 10),
(@OGUID+45, 1622, 0, -10447, 1912.6, 9.39542, 1.78023, 0, 0, 0.777145, 0.629321, 300, 300, 1, 100, 0, 10),
(@OGUID+46, 1622, 0, -11209, 1943.46, 35.8023, 3.927, 0, 0, -0.923879, 0.382686, 300, 300, 1, 100, 0, 10),
(@OGUID+47, 1622, 0, -11177.9, 850.533, 40.7336, 1.22173, 0, 0, 0.573576, 0.819152, 300, 300, 1, 100, 0, 10),
(@OGUID+48, 1622, 0, -11126.9, 1839.96, 41.0078, 4.53786, 0, 0, -0.766044, 0.642789, 300, 300, 1, 100, 0, 10),
(@OGUID+49, 1622, 0, -9893.3, 1317.12, 42.1114, 5.20108, 0, 0, -0.515038, 0.857168, 300, 300, 1, 100, 0, 10);

-- Missing Bruiseweed spawns in Redridge Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+50, 1622, 0, -9462.51, -3026.77, 136.647, 1.02974, 0, 0, 0.492423, 0.870356, 300, 300, 1, 100, 0, 10),
(@OGUID+51, 1622, 0, -9098.85, -3333.52, 100.367, 1.44862, 0, 0, 0.66262, 0.748956, 300, 300, 1, 100, 0, 10),
(@OGUID+52, 1622, 0, -9677.12, -2839.97, 51.9216, 4.03171, 0, 0, -0.902585, 0.430512, 300, 300, 1, 100, 0, 10),
(@OGUID+53, 1622, 0, -9620.35, -2869.21, 61.6724, 6.0912, 0, 0, -0.0958452, 0.995396, 300, 300, 1, 100, 0, 10),
(@OGUID+54, 1622, 0, -9602.98, -3096.85, 57.9598, 3.26377, 0, 0, -0.998135, 0.0610518, 300, 300, 1, 100, 0, 10),
(@OGUID+55, 1622, 0, -9628.97, -3168.42, 49.4796, 4.62512, 0, 0, -0.737277, 0.675591, 300, 300, 1, 100, 0, 10),
(@OGUID+56, 1622, 0, -9288.58, -3325.65, 112.675, 0.383971, 0, 0, 0.190808, 0.981627, 300, 300, 1, 100, 0, 10),
(@OGUID+57, 1622, 0, -8703.74, -2310.06, 161.109, 6.24828, 0, 0, -0.0174522, 0.999848, 300, 300, 1, 100, 0, 10),
(@OGUID+58, 1622, 0, -9744.08, -2407.2, 79.0861, 3.57793, 0, 0, -0.976295, 0.216442, 300, 300, 1, 100, 0, 10),
(@OGUID+59, 1622, 0, -9722.56, -3076.28, 58.6725, 1.97222, 0, 0, 0.833885, 0.551938, 300, 300, 1, 100, 0, 10),
(@OGUID+60, 1622, 0, -9574.95, -2857.7, 67.7004, 0.541051, 0, 0, 0.267238, 0.963631, 300, 300, 1, 100, 0, 10),
(@OGUID+61, 1622, 0, -9500.21, -2869.15, 92.9556, 3.63029, 0, 0, -0.970295, 0.241925, 300, 300, 1, 100, 0, 10),
(@OGUID+62, 1622, 0, -9499.42, -3054.76, 110.48, 0.436332, 0, 0, 0.216439, 0.976296, 300, 300, 1, 100, 0, 10),
(@OGUID+63, 1622, 0, -9444.16, -3404.24, 94.6279, 0.785397, 0, 0, 0.382683, 0.92388, 300, 300, 1, 100, 0, 10),
(@OGUID+64, 1622, 0, -9425.92, -3079.96, 136.693, 2.96704, 0, 0, 0.996194, 0.087165, 300, 300, 1, 100, 0, 10),
(@OGUID+65, 1622, 0, -9378.38, -3038.53, 136.687, 5.68977, 0, 0, -0.292372, 0.956305, 300, 300, 1, 100, 0, 10),
(@OGUID+66, 1622, 0, -9282.31, -2910.74, 128.707, 3.01941, 0, 0, 0.998135, 0.0610518, 300, 300, 1, 100, 0, 10),
(@OGUID+67, 1622, 0, -9244.37, -3403.93, 105.793, 3.47321, 0, 0, -0.986285, 0.16505, 300, 300, 1, 100, 0, 10),
(@OGUID+68, 1622, 0, -9237.13, -3248.83, 102.098, 2.05949, 0, 0, 0.857167, 0.515038, 300, 300, 1, 100, 0, 10),
(@OGUID+69, 1622, 0, -9175.99, -2392.31, 99.8053, 5.98648, 0, 0, -0.147809, 0.989016, 300, 300, 1, 100, 0, 10),
(@OGUID+70, 1622, 0, -9172.05, -2443.96, 114.471, 0.890117, 0, 0, 0.430511, 0.902586, 300, 300, 1, 100, 0, 10),
(@OGUID+71, 1622, 0, -8797.02, -2414.19, 157.404, 5.63741, 0, 0, -0.317305, 0.948324, 300, 300, 1, 100, 0, 10);

-- Missing Bruiseweed spawns in Arathi Highlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+72, 1622, 0, -776.789, -1982.12, 34.4857, 1.22173, 0, 0, 0.573576, 0.819152, 300, 300, 1, 100, 0, 10),
(@OGUID+73, 1622, 0, -1759.68, -1525.38, 60.9828, 2.05949, 0, 0, 0.857167, 0.515038, 300, 300, 1, 100, 0, 10),
(@OGUID+74, 1622, 0, -1566.26, -1655.15, 68.1308, 5.93412, 0, 0, -0.173648, 0.984808, 300, 300, 1, 100, 0, 10),
(@OGUID+75, 1622, 0, -1723.8, -1832.74, 81.1296, 3.94445, 0, 0, -0.920505, 0.390732, 300, 300, 1, 100, 0, 10),
(@OGUID+76, 1622, 0, -1664.37, -1769.13, 81.2792, 3.07177, 0, 0, 0.999391, 0.0349061, 300, 300, 1, 100, 0, 10),
(@OGUID+77, 1622, 0, -1649.61, -1919.43, 68.8551, 1.16937, 0, 0, 0.551936, 0.833886, 300, 300, 1, 100, 0, 10),
(@OGUID+78, 1622, 0, -1569.17, -1752.2, 68.0593, 5.58505, 0, 0, -0.34202, 0.939693, 300, 300, 1, 100, 0, 10);

-- Missing Bruiseweed spawns in Silverpine Forest.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+79, 1622, 0, 114.162, 1327.6, 103.393, 2.51327, 0, 0, 0.951056, 0.309017, 300, 300, 1, 100, 0, 10),
(@OGUID+80, 1622, 0, -212.187, 961.788, 72.1722, 4.10153, 0, 0, -0.887011, 0.461749, 300, 300, 1, 100, 0, 10),
(@OGUID+81, 1622, 0, -82.8668, 872.231, 65.2026, 1.72787, 0, 0, 0.760406, 0.649449, 300, 300, 1, 100, 0, 10),
(@OGUID+82, 1622, 0, 227.415, 1478.35, 142.382, 2.72271, 0, 0, 0.978148, 0.207912, 300, 300, 1, 100, 0, 10),
(@OGUID+83, 1622, 0, 68.9466, 762.575, 63.6638, 4.25861, 0, 0, -0.848047, 0.529921, 300, 300, 1, 100, 0, 10);

-- Missing Bruiseweed spawns in Darkshore.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+84, 1622, 1, 7371.6, -964.426, 32.2543, 5.63741, 0, 0, -0.317305, 0.948324, 300, 300, 1, 100, 0, 10),
(@OGUID+85, 1622, 1, 4609.48, 563.931, 1.2706, 2.63544, 0, 0, 0.968147, 0.250381, 300, 300, 1, 100, 0, 10),
(@OGUID+86, 1622, 1, 7370.56, -776.133, 8.09829, 4.03171, 0, 0, -0.902585, 0.430512, 300, 300, 1, 100, 0, 10),
(@OGUID+87, 1622, 1, 4326.1, 921.623, -16.6916, 4.59022, 0, 0, -0.748956, 0.66262, 300, 300, 1, 100, 0, 10),
(@OGUID+88, 1622, 1, 4542.48, 571.957, 3.24723, 4.10153, 0, 0, -0.887011, 0.461749, 300, 300, 1, 100, 0, 10),
(@OGUID+89, 1622, 1, 6754.48, -192.831, 33.7616, 3.12412, 0, 0, 0.999962, 0.00873464, 300, 300, 1, 100, 0, 10);

-- Missing Bruiseweed spawns in Hillsbrad Foothills.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+90, 1622, 0, -772.051, -1217.61, 61.4927, 6.03884, 0, 0, -0.121869, 0.992546, 300, 300, 1, 100, 0, 10),
(@OGUID+91, 1622, 0, -983.237, -1207.32, 67.0874, 1.83259, 0, 0, 0.793353, 0.608762, 300, 300, 1, 100, 0, 10),
(@OGUID+92, 1622, 0, -326.226, -354.014, 80.6472, 2.67035, 0, 0, 0.972369, 0.233448, 300, 300, 1, 100, 0, 10),
(@OGUID+93, 1622, 0, 87.021, -1039.61, 87.1876, 0.767944, 0, 0, 0.374606, 0.927184, 300, 300, 1, 100, 0, 10),
(@OGUID+94, 1622, 0, 182.338, -1051.84, 83.7362, 4.83456, 0, 0, -0.66262, 0.748956, 300, 300, 1, 100, 0, 10),
(@OGUID+95, 1622, 0, -796.592, -1170.49, 68.9588, 5.49779, 0, 0, -0.382683, 0.92388, 300, 300, 1, 100, 0, 10),
(@OGUID+96, 1622, 0, 160.866, -1025.17, 95.9587, 2.47837, 0, 0, 0.945518, 0.325568, 300, 300, 1, 100, 0, 10),
(@OGUID+97, 1622, 0, -214.537, -1207.99, 119.931, 1.88495, 0, 0, 0.809016, 0.587786, 300, 300, 1, 100, 0, 10),
(@OGUID+98, 1622, 0, -253.693, -1540.89, 109.527, 6.16101, 0, 0, -0.0610485, 0.998135, 300, 300, 1, 100, 0, 10),
(@OGUID+99, 1622, 0, -463.715, 76.9327, 56.6125, 5.02655, 0, 0, -0.587785, 0.809017, 300, 300, 1, 100, 0, 10),
(@OGUID+100, 1622, 0, -919.715, -144.827, 50.9302, 4.08407, 0, 0, -0.891006, 0.453991, 300, 300, 1, 100, 0, 10),
(@OGUID+101, 1622, 0, -874.282, -272.776, 48.9107, 1.51844, 0, 0, 0.688354, 0.725374, 300, 300, 1, 100, 0, 10),
(@OGUID+102, 1622, 0, -758.983, -88.6771, 45.1848, 5.46288, 0, 0, -0.398748, 0.91706, 300, 300, 1, 100, 0, 10),
(@OGUID+103, 1622, 0, -753.954, -1005.48, 49.0006, 1.78023, 0, 0, 0.777145, 0.629321, 300, 300, 1, 100, 0, 10),
(@OGUID+104, 1622, 0, -738.179, -117.919, 46.9347, 5.55015, 0, 0, -0.358368, 0.93358, 300, 300, 1, 100, 0, 10),
(@OGUID+105, 1622, 0, -647.144, -348.227, 47.832, 0.139624, 0, 0, 0.0697556, 0.997564, 300, 300, 1, 100, 0, 10),
(@OGUID+106, 1622, 0, -475.658, -246.216, 61.4152, 2.61799, 0, 0, 0.965925, 0.258821, 300, 300, 1, 100, 0, 10),
(@OGUID+107, 1622, 0, -444.45, -223.873, 74.4664, 3.63029, 0, 0, -0.970295, 0.241925, 300, 300, 1, 100, 0, 10),
(@OGUID+108, 1622, 0, -428.358, -247.58, 64.5375, 0.366518, 0, 0, 0.182235, 0.983255, 300, 300, 1, 100, 0, 10),
(@OGUID+109, 1622, 0, -180.773, 13.7548, 89.4167, 1.97222, 0, 0, 0.833885, 0.551938, 300, 300, 1, 100, 0, 10);

-- Missing Bruiseweed spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+110, 1622, 1, 2922.28, -3496.77, 116.395, 1.309, 0, 0, 0.608761, 0.793354, 300, 300, 1, 100, 0, 10),
(@OGUID+111, 1622, 1, 2038.86, -2776.85, 125.449, 4.34587, 0, 0, -0.824126, 0.566406, 300, 300, 1, 100, 0, 10),
(@OGUID+112, 1622, 1, 3459.65, 826.669, 6.31089, 0.122173, 0, 0, 0.0610485, 0.998135, 300, 300, 1, 100, 0, 10),
(@OGUID+113, 1622, 1, 3714.13, 901.109, 0.967006, 0.575957, 0, 0, 0.284015, 0.95882, 300, 300, 1, 100, 0, 10),
(@OGUID+114, 1622, 1, 1947.19, -1507.37, 76.0937, 1.29154, 0, 0, 0.601814, 0.798636, 300, 300, 1, 100, 0, 10),
(@OGUID+115, 1622, 1, 3635.83, 935.257, 3.26611, 5.51524, 0, 0, -0.374606, 0.927184, 300, 300, 1, 100, 0, 10),
(@OGUID+116, 1622, 1, 2536.5, -2189.83, 198.977, 1.29154, 0, 0, 0.601814, 0.798636, 300, 300, 1, 100, 0, 10),
(@OGUID+117, 1622, 1, 1603.09, -3015.52, 102.267, 1.44862, 0, 0, 0.66262, 0.748956, 300, 300, 1, 100, 0, 10),
(@OGUID+118, 1622, 1, 2231.59, -1551.59, 93.0479, 0.645772, 0, 0, 0.317305, 0.948324, 300, 300, 1, 100, 0, 10),
(@OGUID+119, 1622, 1, 1573.24, -3374.25, 143.295, 3.97935, 0, 0, -0.913545, 0.406738, 300, 300, 1, 100, 0, 10),
(@OGUID+120, 1622, 1, 1715.81, -3398.16, 151.409, 1.50098, 0, 0, 0.681998, 0.731354, 300, 300, 1, 100, 0, 10),
(@OGUID+121, 1622, 1, 1722.06, -3220.28, 137.148, 3.47321, 0, 0, -0.986285, 0.16505, 300, 300, 1, 100, 0, 10),
(@OGUID+122, 1622, 1, 1834.59, -2316.66, 131.207, 3.08918, 0, 0, 0.999657, 0.0262016, 300, 300, 1, 100, 0, 10),
(@OGUID+123, 1622, 1, 2475.31, -2139.73, 202.785, 6.16101, 0, 0, -0.0610485, 0.998135, 300, 300, 1, 100, 0, 10),
(@OGUID+124, 1622, 1, 2726.56, 212.083, 77.6215, 5.2709, 0, 0, -0.484809, 0.87462, 300, 300, 1, 100, 0, 10),
(@OGUID+125, 1622, 1, 2786.12, 286.809, 76.6258, 4.72984, 0, 0, -0.700909, 0.713251, 300, 300, 1, 100, 0, 10),
(@OGUID+126, 1622, 1, 3051.65, -2787.59, 199.605, 0.401425, 0, 0, 0.199368, 0.979925, 300, 300, 1, 100, 0, 10),
(@OGUID+127, 1622, 1, 3071.79, 615.018, 5.34308, 5.14872, 0, 0, -0.537299, 0.843392, 300, 300, 1, 100, 0, 10),
(@OGUID+128, 1622, 1, 3334.14, -495.504, 154.218, 2.68781, 0, 0, 0.97437, 0.224951, 300, 300, 1, 100, 0, 10),
(@OGUID+129, 1622, 1, 3458.32, -129.015, 6.99813, 0.733038, 0, 0, 0.358368, 0.93358, 300, 300, 1, 100, 0, 10);

-- Missing Bruiseweed spawns in Thousand Needles.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+130, 1622, 1, -6381.36, -3356.16, -55.2018, 2.84488, 0, 0, 0.989016, 0.147811, 300, 300, 1, 100, 0, 10),
(@OGUID+131, 1622, 1, -5455.87, -3290, -33.4933, 4.18879, 0, 0, -0.866025, 0.500001, 300, 300, 1, 100, 0, 10),
(@OGUID+132, 1622, 1, -6669.87, -3806.92, -52.5477, 2.74016, 0, 0, 0.979924, 0.19937, 300, 300, 1, 100, 0, 10),
(@OGUID+133, 1622, 1, -5536.36, -3036.44, -44.4939, 1.48353, 0, 0, 0.67559, 0.737278, 300, 300, 1, 100, 0, 10),
(@OGUID+134, 1622, 1, -5186.26, -2464.78, -50.7728, 4.2237, 0, 0, -0.857167, 0.515038, 300, 300, 1, 100, 0, 10),
(@OGUID+135, 1622, 1, -6433.54, -3439.05, -58.7499, 3.03684, 0, 0, 0.998629, 0.0523532, 300, 300, 1, 100, 0, 10),
(@OGUID+136, 1622, 1, -6189.25, -3501.39, -54.5429, 3.87463, 0, 0, -0.93358, 0.358368, 300, 300, 1, 100, 0, 10),
(@OGUID+137, 1622, 1, -4679.05, -1474.73, -48.2578, 5.61996, 0, 0, -0.325567, 0.945519, 300, 300, 1, 100, 0, 10),
(@OGUID+138, 1622, 1, -4652.41, -942.781, -45.128, 4.67748, 0, 0, -0.719339, 0.694659, 300, 300, 1, 100, 0, 10),
(@OGUID+139, 1622, 1, -4503.07, -1151, -56.5955, 5.34071, 0, 0, -0.45399, 0.891007, 300, 300, 1, 100, 0, 10),
(@OGUID+140, 1622, 1, -4872.65, -1103.77, -56.2533, 0.698131, 0, 0, 0.34202, 0.939693, 300, 300, 1, 100, 0, 10),
(@OGUID+141, 1622, 1, -5220.05, -2716.26, -48.2689, 3.47321, 0, 0, -0.986285, 0.16505, 300, 300, 1, 100, 0, 10),
(@OGUID+142, 1622, 1, -5130.82, -2040.2, -47.5401, 4.24115, 0, 0, -0.85264, 0.522499, 300, 300, 1, 100, 0, 10),
(@OGUID+143, 1622, 1, -6593.99, -4064.78, -53.6787, 0.104719, 0, 0, 0.0523357, 0.99863, 300, 300, 1, 100, 0, 10),
(@OGUID+144, 1622, 1, -6443.36, -4237.51, -55.1966, 3.76991, 0, 0, -0.951056, 0.309017, 300, 300, 1, 100, 0, 10),
(@OGUID+145, 1622, 1, -5904.8, -3438.74, -53.4028, 1.85005, 0, 0, 0.798635, 0.601815, 300, 300, 1, 100, 0, 10),
(@OGUID+146, 1622, 1, -5569.09, -2710.54, -46.951, 3.7001, 0, 0, -0.961261, 0.27564, 300, 300, 1, 100, 0, 10),
(@OGUID+147, 1622, 1, -5159.17, -1386.54, -49.9085, 2.68781, 0, 0, 0.97437, 0.224951, 300, 300, 1, 100, 0, 10);

-- Missing Bruiseweed spawns in Desolace.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+148, 1622, 1, -210.988, 695.236, 91.0378, 2.35619, 0, 0, 0.92388, 0.382683, 300, 300, 1, 100, 0, 10),
(@OGUID+149, 1622, 1, -432.996, 1840.38, 126.799, 5.2709, 0, 0, -0.484809, 0.87462, 300, 300, 1, 100, 0, 10),
(@OGUID+150, 1622, 1, -1868.14, 1964.29, 62.4533, 3.85718, 0, 0, -0.936671, 0.35021, 300, 300, 1, 100, 0, 10),
(@OGUID+151, 1622, 1, -1732.9, 1875.7, 62.3673, 4.64258, 0, 0, -0.731354, 0.681998, 300, 300, 1, 100, 0, 10),
(@OGUID+152, 1622, 1, -391.862, 1841.03, 126.799, 2.70526, 0, 0, 0.976295, 0.216442, 300, 300, 1, 100, 0, 10),
(@OGUID+153, 1622, 1, -113.552, 998.368, 90.3626, 0.663223, 0, 0, 0.325567, 0.945519, 300, 300, 1, 100, 0, 10),
(@OGUID+154, 1622, 1, -1662.41, 1919.26, 60.9899, 1.0472, 0, 0, 0.5, 0.866025, 300, 300, 1, 100, 0, 10),
(@OGUID+155, 1622, 1, -1146.25, 2904.26, 199.923, 5.79449, 0, 0, -0.241921, 0.970296, 300, 300, 1, 100, 0, 10),
(@OGUID+156, 1622, 1, -1082.9, 1342.79, 73.2827, 4.24115, 0, 0, -0.85264, 0.522499, 300, 300, 1, 100, 0, 10),
(@OGUID+157, 1622, 1, -1455.16, 1437.82, 69.9978, 0.610863, 0, 0, 0.300705, 0.953717, 300, 300, 1, 100, 0, 10),
(@OGUID+158, 1622, 1, -1406.87, 2479.42, 89.5196, 1.58825, 0, 0, 0.71325, 0.70091, 300, 300, 1, 100, 0, 10),
(@OGUID+159, 1622, 1, -1405.59, 2901.74, 137.689, 3.83973, 0, 0, -0.939692, 0.34202, 300, 300, 1, 100, 0, 10),
(@OGUID+160, 1622, 1, -1255.12, 2694.01, 113.528, 2.86234, 0, 0, 0.990268, 0.139175, 300, 300, 1, 100, 0, 10),
(@OGUID+161, 1622, 1, -853.792, 1900.13, 70.7439, 4.72984, 0, 0, -0.700909, 0.713251, 300, 300, 1, 100, 0, 10),
(@OGUID+162, 1622, 1, -419.425, 1896.52, 126.536, 3.54302, 0, 0, -0.979924, 0.19937, 300, 300, 1, 100, 0, 10),
(@OGUID+163, 1622, 1, -362.14, 1720.11, 130.595, 1.6057, 0, 0, 0.719339, 0.694659, 300, 300, 1, 100, 0, 10),
(@OGUID+164, 1622, 1, -328.662, 821.262, 91.6325, 5.68977, 0, 0, -0.292372, 0.956305, 300, 300, 1, 100, 0, 10),
(@OGUID+165, 1622, 1, -106.686, 869.37, 121.325, 1.48353, 0, 0, 0.67559, 0.737278, 300, 300, 1, 100, 0, 10);

-- Missing Bruiseweed spawns in Stonetalon Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+166, 1622, 1, 2207.85, 1457.16, 298.49, 3.28124, 0, 0, -0.997563, 0.0697661, 300, 300, 1, 100, 0, 10),
(@OGUID+167, 1622, 1, 110.031, 121.699, 58.117, 3.99681, 0, 0, -0.909961, 0.414694, 300, 300, 1, 100, 0, 10),
(@OGUID+168, 1622, 1, -137.271, -444.173, -11.8297, 4.34587, 0, 0, -0.824126, 0.566406, 300, 300, 1, 100, 0, 10),
(@OGUID+169, 1622, 1, -13.3543, -539.787, -38.692, 0.506145, 0, 0, 0.25038, 0.968148, 300, 300, 1, 100, 0, 10),
(@OGUID+170, 1622, 1, 2686.99, 1573.27, 261.167, 1.37881, 0, 0, 0.636078, 0.771625, 300, 300, 1, 100, 0, 10),
(@OGUID+171, 1622, 1, 2513.21, 1658.03, 300.209, 5.5676, 0, 0, -0.350207, 0.936672, 300, 300, 1, 100, 0, 10),
(@OGUID+172, 1622, 1, 748.818, 1542.47, -16.4499, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 1, 100, 0, 10),
(@OGUID+173, 1622, 1, 2517.74, 1685.1, 302.962, 2.77507, 0, 0, 0.983254, 0.182238, 300, 300, 1, 100, 0, 10),
(@OGUID+174, 1622, 1, 182.025, -790.818, 10.764, 4.15388, 0, 0, -0.874619, 0.48481, 300, 300, 1, 100, 0, 10),
(@OGUID+175, 1622, 1, 2667.05, 1450.21, 227.443, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 1, 100, 0, 10),
(@OGUID+176, 1622, 1, -150.817, -588.083, 0.593653, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 1, 100, 0, 10),
(@OGUID+177, 1622, 1, 1474.58, -507.138, 44.3524, 1.37881, 0, 0, 0.636078, 0.771625, 300, 300, 1, 100, 0, 10),
(@OGUID+178, 1622, 1, 1024.82, -335.812, 5.84693, 0.59341, 0, 0, 0.292371, 0.956305, 300, 300, 1, 100, 0, 10),
(@OGUID+179, 1622, 1, 1238.75, -2.22407, -6.00124, 4.66003, 0, 0, -0.725374, 0.688355, 300, 300, 1, 100, 0, 10),
(@OGUID+180, 1622, 1, 2428.22, 1794.94, 394.01, 2.3911, 0, 0, 0.930417, 0.366502, 300, 300, 1, 100, 0, 10),
(@OGUID+181, 1622, 1, 1390.03, 1016.71, 163.304, 4.18879, 0, 0, -0.866025, 0.500001, 300, 300, 1, 100, 0, 10),
(@OGUID+182, 1622, 1, 1494.71, 1292.89, 181.399, 2.63544, 0, 0, 0.968147, 0.250381, 300, 300, 1, 100, 0, 10),
(@OGUID+183, 1622, 1, 574.627, 1869.33, 0.097795, 4.10153, 0, 0, -0.887011, 0.461749, 300, 300, 1, 100, 0, 10),
(@OGUID+184, 1622, 1, 980.301, 1755.52, 2.21413, 5.8294, 0, 0, -0.224951, 0.97437, 300, 300, 1, 100, 0, 10),
(@OGUID+185, 1622, 1, 1757.32, 846.001, 148.717, 2.25147, 0, 0, 0.902585, 0.430512, 300, 300, 1, 100, 0, 10),
(@OGUID+186, 1622, 1, 859.194, 149.806, 36.5573, 0.575957, 0, 0, 0.284015, 0.95882, 300, 300, 1, 100, 0, 10),
(@OGUID+187, 1622, 1, 1198.88, -377.383, 16.838, 3.75246, 0, 0, -0.953716, 0.300708, 300, 300, 1, 100, 0, 10),
(@OGUID+188, 1622, 1, 991.179, -367.07, 10.4241, 3.24635, 0, 0, -0.998629, 0.0523532, 300, 300, 1, 100, 0, 10),
(@OGUID+189, 1622, 1, -7.82878, -371.534, 1.38996, 3.26377, 0, 0, -0.998135, 0.0610518, 300, 300, 1, 100, 0, 10),
(@OGUID+190, 1622, 1, 1332.29, 52.235, 13.952, 2.96704, 0, 0, 0.996194, 0.087165, 300, 300, 1, 100, 0, 10),
(@OGUID+191, 1622, 1, -38.2416, -141.34, 35.205, 1.18682, 0, 0, 0.559193, 0.829038, 300, 300, 1, 100, 0, 10),
(@OGUID+192, 1622, 1, 244.87, 358.562, 69.6436, 3.07177, 0, 0, 0.999391, 0.0349061, 300, 300, 1, 100, 0, 10),
(@OGUID+193, 1622, 1, 680.712, 1901.94, 7.93983, 0.418879, 0, 0, 0.207911, 0.978148, 300, 300, 1, 100, 0, 10),
(@OGUID+194, 1622, 1, 681.608, 1882.77, -1.26325, 4.79966, 0, 0, -0.67559, 0.737278, 300, 300, 1, 100, 0, 10),
(@OGUID+195, 1622, 1, 795.631, 1715.86, -13.2136, 0.855211, 0, 0, 0.414693, 0.909961, 300, 300, 1, 100, 0, 10),
(@OGUID+196, 1622, 1, 917.237, 1645.03, -8.82564, 6.24828, 0, 0, -0.0174522, 0.999848, 300, 300, 1, 100, 0, 10),
(@OGUID+197, 1622, 1, 1034.48, 1738.96, -0.546102, 5.34071, 0, 0, -0.45399, 0.891007, 300, 300, 1, 100, 0, 10),
(@OGUID+198, 1622, 1, 1530.68, 1085.39, 163.236, 2.82743, 0, 0, 0.987688, 0.156436, 300, 300, 1, 100, 0, 10),
(@OGUID+199, 1622, 1, 2267.7, 1446.69, 288.195, 4.46804, 0, 0, -0.788011, 0.615662, 300, 300, 1, 100, 0, 10),
(@OGUID+200, 1622, 1, 2308.3, 1309.17, 303.417, 6.23083, 0, 0, -0.0261765, 0.999657, 300, 300, 1, 100, 0, 10),
(@OGUID+201, 1622, 1, 2356.16, 1533.46, 288.423, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 1, 100, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1115, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Duskwood 85 objects total
(@OGUID+2, 1115, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Duskwood 85 objects total
(@OGUID+3, 1115, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Duskwood 85 objects total
(@OGUID+4, 1115, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Duskwood 85 objects total
(@OGUID+5, 1115, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Duskwood 85 objects total
(@OGUID+6, 1115, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Duskwood 85 objects total
(@OGUID+7, 1115, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Duskwood 85 objects total
(@OGUID+8, 1115, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Duskwood 85 objects total
(@OGUID+9, 1115, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Duskwood 85 objects total
(@OGUID+10, 1115, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Duskwood 85 objects total
(@OGUID+11, 1115, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Duskwood 85 objects total
(@OGUID+12, 1115, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Duskwood 85 objects total
(@OGUID+13, 1115, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Duskwood 85 objects total
(@OGUID+14, 1115, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Duskwood 85 objects total
(@OGUID+15, 1115, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Duskwood 85 objects total
(@OGUID+16, 1115, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Duskwood 85 objects total
(@OGUID+17, 1115, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Duskwood 85 objects total
(@OGUID+18, 1115, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Duskwood 85 objects total
(@OGUID+19, 1150, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Wetlands 97 objects total
(@OGUID+20, 1150, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Wetlands 97 objects total
(@OGUID+21, 1150, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Wetlands 97 objects total
(@OGUID+22, 1150, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Wetlands 97 objects total
(@OGUID+23, 1150, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Wetlands 97 objects total
(@OGUID+24, 1150, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Wetlands 97 objects total
(@OGUID+25, 1150, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Wetlands 97 objects total
(@OGUID+26, 1150, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Wetlands 97 objects total
(@OGUID+27, 1150, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Wetlands 97 objects total
(@OGUID+28, 1150, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Wetlands 97 objects total
(@OGUID+29, 1150, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Wetlands 97 objects total
(@OGUID+30, 1150, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Wetlands 97 objects total
(@OGUID+31, 1056, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Alterac 25 objects total
(@OGUID+32, 1056, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Alterac 25 objects total
(@OGUID+33, 1056, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Alterac 25 objects total
(@OGUID+34, 1056, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Alterac 25 objects total
(@OGUID+35, 1056, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Alterac 25 objects total
(@OGUID+36, 1164, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Loch Modan 61 objects total
(@OGUID+37, 1164, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Loch Modan 61 objects total
(@OGUID+38, 1164, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Loch Modan 61 objects total
(@OGUID+39, 1164, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Loch Modan 61 objects total
(@OGUID+40, 1164, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Loch Modan 61 objects total
(@OGUID+41, 1164, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Loch Modan 61 objects total
(@OGUID+42, 1164, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Loch Modan 61 objects total
(@OGUID+43, 1164, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Loch Modan 61 objects total
(@OGUID+44, 1110, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Westfall 76 objects total
(@OGUID+45, 1110, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Westfall 76 objects total
(@OGUID+46, 1110, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Westfall 76 objects total
(@OGUID+47, 1110, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Westfall 76 objects total
(@OGUID+48, 1110, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Westfall 76 objects total
(@OGUID+49, 1110, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Westfall 76 objects total
(@OGUID+50, 1126, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Redridge 98 objects total
(@OGUID+51, 1126, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Redridge 98 objects total
(@OGUID+52, 1126, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Redridge 98 objects total
(@OGUID+53, 1126, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Redridge 98 objects total
(@OGUID+54, 1126, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Redridge 98 objects total
(@OGUID+55, 1126, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Redridge 98 objects total
(@OGUID+56, 1126, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Redridge 98 objects total
(@OGUID+57, 1126, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Redridge 98 objects total
(@OGUID+58, 1126, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Redridge 98 objects total
(@OGUID+59, 1126, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Redridge 98 objects total
(@OGUID+60, 1126, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Redridge 98 objects total
(@OGUID+61, 1126, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Redridge 98 objects total
(@OGUID+62, 1126, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Redridge 98 objects total
(@OGUID+63, 1126, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Redridge 98 objects total
(@OGUID+64, 1126, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Redridge 98 objects total
(@OGUID+65, 1126, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Redridge 98 objects total
(@OGUID+66, 1126, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Redridge 98 objects total
(@OGUID+67, 1126, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Redridge 98 objects total
(@OGUID+68, 1126, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Redridge 98 objects total
(@OGUID+69, 1126, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Redridge 98 objects total
(@OGUID+70, 1126, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Redridge 98 objects total
(@OGUID+71, 1126, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Redridge 98 objects total
(@OGUID+72, 1052, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Arathi Highlands
(@OGUID+73, 1052, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Arathi Highlands
(@OGUID+74, 1052, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Arathi Highlands
(@OGUID+75, 1052, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Arathi Highlands
(@OGUID+76, 1052, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Arathi Highlands
(@OGUID+77, 1052, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Arathi Highlands
(@OGUID+78, 1052, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Arathi Highlands
(@OGUID+79, 1047, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Silverpine Forest 76 objects total
(@OGUID+80, 1047, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Silverpine Forest 76 objects total
(@OGUID+81, 1047, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Silverpine Forest 76 objects total
(@OGUID+82, 1047, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Silverpine Forest 76 objects total
(@OGUID+83, 1047, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Silverpine Forest 76 objects total
(@OGUID+84, 1101, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Darkshore 39 objects total
(@OGUID+85, 1101, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Darkshore 39 objects total
(@OGUID+86, 1101, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Darkshore 39 objects total
(@OGUID+87, 1101, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Darkshore 39 objects total
(@OGUID+88, 1101, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Darkshore 39 objects total
(@OGUID+89, 1101, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Darkshore 39 objects total
(@OGUID+90, 1048, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Hillsbrad 102 objects total
(@OGUID+91, 1048, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Hillsbrad 102 objects total
(@OGUID+92, 1048, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Hillsbrad 102 objects total
(@OGUID+93, 1048, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Hillsbrad 102 objects total
(@OGUID+94, 1048, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Hillsbrad 102 objects total
(@OGUID+95, 1048, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Hillsbrad 102 objects total
(@OGUID+96, 1048, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Hillsbrad 102 objects total
(@OGUID+97, 1048, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Hillsbrad 102 objects total
(@OGUID+98, 1048, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Hillsbrad 102 objects total
(@OGUID+99, 1048, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Hillsbrad 102 objects total
(@OGUID+100, 1048, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Hillsbrad 102 objects total
(@OGUID+101, 1048, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Hillsbrad 102 objects total
(@OGUID+102, 1048, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Hillsbrad 102 objects total
(@OGUID+103, 1048, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Hillsbrad 102 objects total
(@OGUID+104, 1048, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Hillsbrad 102 objects total
(@OGUID+105, 1048, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Hillsbrad 102 objects total
(@OGUID+106, 1048, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Hillsbrad 102 objects total
(@OGUID+107, 1048, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Hillsbrad 102 objects total
(@OGUID+108, 1048, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Hillsbrad 102 objects total
(@OGUID+109, 1048, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Hillsbrad 102 objects total
(@OGUID+110, 1072, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Ashenvale 137 objects total
(@OGUID+111, 1072, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Ashenvale 137 objects total
(@OGUID+112, 1072, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Ashenvale 137 objects total
(@OGUID+113, 1072, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Ashenvale 137 objects total
(@OGUID+114, 1072, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Ashenvale 137 objects total
(@OGUID+115, 1072, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Ashenvale 137 objects total
(@OGUID+116, 1072, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Ashenvale 137 objects total
(@OGUID+117, 1072, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Ashenvale 137 objects total
(@OGUID+118, 1072, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Ashenvale 137 objects total
(@OGUID+119, 1072, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Ashenvale 137 objects total
(@OGUID+120, 1072, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Ashenvale 137 objects total
(@OGUID+121, 1072, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Ashenvale 137 objects total
(@OGUID+122, 1072, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Ashenvale 137 objects total
(@OGUID+123, 1072, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Ashenvale 137 objects total
(@OGUID+124, 1072, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Ashenvale 137 objects total
(@OGUID+125, 1072, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Ashenvale 137 objects total
(@OGUID+126, 1072, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Ashenvale 137 objects total
(@OGUID+127, 1072, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Ashenvale 137 objects total
(@OGUID+128, 1072, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Ashenvale 137 objects total
(@OGUID+129, 1072, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Ashenvale 137 objects total
(@OGUID+130, 1133, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Thousand Needles 59 objects total
(@OGUID+131, 1133, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Thousand Needles 59 objects total
(@OGUID+132, 1133, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Thousand Needles 59 objects total
(@OGUID+133, 1133, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Thousand Needles 59 objects total
(@OGUID+134, 1133, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Thousand Needles 59 objects total
(@OGUID+135, 1133, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Thousand Needles 59 objects total
(@OGUID+136, 1133, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Thousand Needles 59 objects total
(@OGUID+137, 1133, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Thousand Needles 59 objects total
(@OGUID+138, 1133, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Thousand Needles 59 objects total
(@OGUID+139, 1133, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Thousand Needles 59 objects total
(@OGUID+140, 1133, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Thousand Needles 59 objects total
(@OGUID+141, 1133, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Thousand Needles 59 objects total
(@OGUID+142, 1133, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Thousand Needles 59 objects total
(@OGUID+143, 1133, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Thousand Needles 59 objects total
(@OGUID+144, 1133, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Thousand Needles 59 objects total
(@OGUID+145, 1133, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Thousand Needles 59 objects total
(@OGUID+146, 1133, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Thousand Needles 59 objects total
(@OGUID+147, 1133, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Thousand Needles 59 objects total
(@OGUID+148, 1137, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Desolace 50 objects total
(@OGUID+149, 1137, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Desolace 50 objects total
(@OGUID+150, 1137, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Desolace 50 objects total
(@OGUID+151, 1137, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Desolace 50 objects total
(@OGUID+152, 1137, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Desolace 50 objects total
(@OGUID+153, 1137, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Desolace 50 objects total
(@OGUID+154, 1137, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Desolace 50 objects total
(@OGUID+155, 1137, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Desolace 50 objects total
(@OGUID+156, 1137, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Desolace 50 objects total
(@OGUID+157, 1137, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Desolace 50 objects total
(@OGUID+158, 1137, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Desolace 50 objects total
(@OGUID+159, 1137, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Desolace 50 objects total
(@OGUID+160, 1137, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Desolace 50 objects total
(@OGUID+161, 1137, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Desolace 50 objects total
(@OGUID+162, 1137, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Desolace 50 objects total
(@OGUID+163, 1137, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Desolace 50 objects total
(@OGUID+164, 1137, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Desolace 50 objects total
(@OGUID+165, 1137, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Desolace 50 objects total
(@OGUID+166, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(@OGUID+167, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(@OGUID+168, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(@OGUID+169, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(@OGUID+170, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(@OGUID+171, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(@OGUID+172, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(@OGUID+173, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(@OGUID+174, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(@OGUID+175, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(@OGUID+176, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(@OGUID+177, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(@OGUID+178, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(@OGUID+179, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(@OGUID+180, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(@OGUID+181, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(@OGUID+182, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(@OGUID+183, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(@OGUID+184, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(@OGUID+185, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(@OGUID+186, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(@OGUID+187, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(@OGUID+188, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(@OGUID+189, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(@OGUID+190, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(@OGUID+191, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(@OGUID+192, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(@OGUID+193, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(@OGUID+194, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(@OGUID+195, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(@OGUID+196, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(@OGUID+197, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(@OGUID+198, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(@OGUID+199, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(@OGUID+200, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon 169 objects total
(@OGUID+201, 1086, 0, 'Bruiseweed', 0, 10); -- Bruiseweed in Stonetalon 169 objects total

-- Missing Bruiseweed spawns in The Barrens.
SET @OGUID = 24400;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 3730, 1, 836.7, -3294.61, 208.639, 3.03684, 0, 0, 0.998629, 0.0523532, 300, 300, 1, 100, 0, 10),
(@OGUID+2, 3730, 1, -1462.52, -3666.71, 92.5161, 1.22173, 0, 0, 0.573576, 0.819152, 300, 300, 1, 100, 0, 10),
(@OGUID+3, 3730, 1, -3992.33, -1976.66, 95.7966, 5.75959, 0, 0, -0.258819, 0.965926, 300, 300, 1, 100, 0, 10),
(@OGUID+4, 3730, 1, -3138.19, -1828.97, 104.068, 3.47321, 0, 0, -0.986285, 0.16505, 300, 300, 1, 100, 0, 10),
(@OGUID+5, 3730, 1, -3020.08, -1820.19, 114.323, 3.07177, 0, 0, 0.999391, 0.0349061, 300, 300, 1, 100, 0, 10),
(@OGUID+6, 3730, 1, 766.801, -3167.56, 208.865, 3.29869, 0, 0, -0.996917, 0.0784664, 300, 300, 1, 100, 0, 10),
(@OGUID+7, 3730, 1, 1362.08, -3548.99, 94.1139, 0.977383, 0, 0, 0.469471, 0.882948, 300, 300, 1, 100, 0, 10),
(@OGUID+8, 3730, 1, -1936.38, -2890.16, 100.831, 0.349065, 0, 0, 0.173648, 0.984808, 300, 300, 1, 100, 0, 10),
(@OGUID+9, 3730, 1, -3047.77, -1973.38, 99.2705, 3.76991, 0, 0, -0.951056, 0.309017, 300, 300, 1, 100, 0, 10),
(@OGUID+10, 3730, 1, 725.236, -3259.67, 237.531, 0.90757, 0, 0, 0.438371, 0.898794, 300, 300, 1, 100, 0, 10),
(@OGUID+11, 3730, 1, 1260.38, -3611.9, 89.6523, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 1, 100, 0, 10),
(@OGUID+12, 3730, 1, -3037.77, -1890.05, 92.5043, 3.15906, 0, 0, -0.999962, 0.00873464, 300, 300, 1, 100, 0, 10),
(@OGUID+13, 3730, 1, 788.142, -3367.38, 208.85, 1.62316, 0, 0, 0.725374, 0.688355, 300, 300, 1, 100, 0, 10),
(@OGUID+14, 3730, 1, 662.912, -1226.24, 116.405, 5.70723, 0, 0, -0.284015, 0.95882, 300, 300, 1, 100, 0, 10),
(@OGUID+15, 3730, 1, -3327.7, -1823.19, 101.588, 2.63544, 0, 0, 0.968147, 0.250381, 300, 300, 1, 100, 0, 10),
(@OGUID+16, 3730, 1, -3069.06, -2175.8, 109.849, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 1, 100, 0, 10),
(@OGUID+17, 3730, 1, -593.159, -2232.84, 222.446, 4.31097, 0, 0, -0.833885, 0.551938, 300, 300, 1, 100, 0, 10),
(@OGUID+18, 3730, 1, -4217.95, -1984.49, 100.462, 0.401425, 0, 0, 0.199368, 0.979925, 300, 300, 1, 100, 0, 10),
(@OGUID+19, 3730, 1, -4195.54, -2300.27, 87.197, 0.261798, 0, 0, 0.130526, 0.991445, 300, 300, 1, 100, 0, 10),
(@OGUID+20, 3730, 1, -3227.17, -2259.22, 103.7, 6.03884, 0, 0, -0.121869, 0.992546, 300, 300, 1, 100, 0, 10),
(@OGUID+21, 3730, 1, -595.274, -2358.61, 156.3, 1.11701, 0, 0, 0.529919, 0.848048, 300, 300, 1, 100, 0, 10),
(@OGUID+22, 3730, 1, -1597.58, -1623.89, 116.987, 4.85202, 0, 0, -0.656058, 0.75471, 300, 300, 1, 100, 0, 10),
(@OGUID+23, 3730, 1, -3048.72, -1750.75, 107.992, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 1, 100, 0, 10),
(@OGUID+24, 3730, 1, -3283.72, -1768.19, 103.057, 6.12611, 0, 0, -0.0784588, 0.996917, 300, 300, 1, 100, 0, 10),
(@OGUID+25, 3730, 1, -4094.49, -1790.92, 118.49, 1.88495, 0, 0, 0.809016, 0.587786, 300, 300, 1, 100, 0, 10),
(@OGUID+26, 3730, 1, -3201.34, -2307.78, 109.676, 3.99681, 0, 0, -0.909961, 0.414694, 300, 300, 1, 100, 0, 10),
(@OGUID+27, 3730, 1, -3068.82, -2245.11, 93.3119, 4.17134, 0, 0, -0.870356, 0.492424, 300, 300, 1, 100, 0, 10),
(@OGUID+28, 3730, 1, -2067.82, -3178.61, 122.367, 5.2709, 0, 0, -0.484809, 0.87462, 300, 300, 1, 100, 0, 10),
(@OGUID+29, 3730, 1, 668.432, -3163.95, 189.868, 1.3439, 0, 0, 0.622514, 0.782609, 300, 300, 1, 100, 0, 10),
(@OGUID+30, 3730, 1, 260.302, -2386.83, 186.325, 5.84685, 0, 0, -0.216439, 0.976296, 300, 300, 1, 100, 0, 10),
(@OGUID+31, 3730, 1, -2346.53, -2219.04, 92.2233, 0.890117, 0, 0, 0.430511, 0.902586, 300, 300, 1, 100, 0, 10),
(@OGUID+32, 3730, 1, -3905.45, -1915.39, 99.6396, 1.36136, 0, 0, 0.62932, 0.777146, 300, 300, 1, 100, 0, 10),
(@OGUID+33, 3730, 1, -661.164, -2159.27, 200.95, 2.30383, 0, 0, 0.913545, 0.406738, 300, 300, 1, 100, 0, 10),
(@OGUID+34, 3730, 1, -3972.73, -1639.11, 97.5111, 1.27409, 0, 0, 0.594822, 0.803857, 300, 300, 1, 100, 0, 10),
(@OGUID+35, 3730, 1, -3043.2, -1683.72, 107.098, 2.87979, 0, 0, 0.991445, 0.130528, 300, 300, 1, 100, 0, 10),
(@OGUID+36, 3730, 1, -3241.27, -1656.94, 92.4505, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 1, 100, 0, 10),
(@OGUID+37, 3730, 1, -4022.79, -1906.58, 98.1126, 2.23402, 0, 0, 0.898793, 0.438373, 300, 300, 1, 100, 0, 10),
(@OGUID+38, 3730, 1, -4202.47, -2087.11, 100.523, 1.46608, 0, 0, 0.66913, 0.743145, 300, 300, 1, 100, 0, 10),
(@OGUID+39, 3730, 1, 810.242, -1256.33, 112.431, 4.38078, 0, 0, -0.814116, 0.580703, 300, 300, 1, 100, 0, 10),
(@OGUID+40, 3730, 1, -2082.59, -3663.98, 61.1472, 2.54818, 0, 0, 0.956305, 0.292372, 300, 300, 1, 100, 0, 10),
(@OGUID+41, 3730, 1, -4204.42, -2367.51, 96.472, 3.50812, 0, 0, -0.983254, 0.182238, 300, 300, 1, 100, 0, 10),
(@OGUID+42, 3730, 1, -4120.15, -2356.06, 126.668, 0.488691, 0, 0, 0.241921, 0.970296, 300, 300, 1, 100, 0, 10),
(@OGUID+43, 3730, 1, -4109.08, -2328.2, 125.812, 3.97935, 0, 0, -0.913545, 0.406738, 300, 300, 1, 100, 0, 10),
(@OGUID+44, 3730, 1, -3928.71, -1572.74, 98.9453, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 1, 100, 0, 10),
(@OGUID+45, 3730, 1, -3151.24, -1943.86, 99.891, 1.18682, 0, 0, 0.559193, 0.829038, 300, 300, 1, 100, 0, 10),
(@OGUID+46, 3730, 1, -3014.61, -1603.43, 95.8928, 3.97935, 0, 0, -0.913545, 0.406738, 300, 300, 1, 100, 0, 10),
(@OGUID+47, 3730, 1, -2313.37, -2640.34, 119.496, 5.72468, 0, 0, -0.275637, 0.961262, 300, 300, 1, 100, 0, 10),
(@OGUID+48, 3730, 1, -1985.64, -3603.24, 21.7593, 6.03884, 0, 0, -0.121869, 0.992546, 300, 300, 1, 100, 0, 10),
(@OGUID+49, 3730, 1, -1524.99, -3553.36, 174.708, 3.927, 0, 0, -0.923879, 0.382686, 300, 300, 1, 100, 0, 10),
(@OGUID+50, 3730, 1, -1523.29, -3394.4, 231.149, 4.29351, 0, 0, -0.83867, 0.54464, 300, 300, 1, 100, 0, 10),
(@OGUID+51, 3730, 1, -1344.83, -1761, 108.934, 1.97222, 0, 0, 0.833885, 0.551938, 300, 300, 1, 100, 0, 10),
(@OGUID+52, 3730, 1, -752.891, -2323.23, 120.647, 5.00909, 0, 0, -0.594823, 0.803857, 300, 300, 1, 100, 0, 10),
(@OGUID+53, 3730, 1, 203.488, -2193.84, 200.454, 3.71755, 0, 0, -0.958819, 0.284016, 300, 300, 1, 100, 0, 10),
(@OGUID+54, 3730, 1, 314.383, -2233.26, 232.258, 1.25664, 0, 0, 0.587785, 0.809017, 300, 300, 1, 100, 0, 10),
(@OGUID+55, 3730, 1, 408.86, -2095.4, 142.987, 5.63741, 0, 0, -0.317305, 0.948324, 300, 300, 1, 100, 0, 10),
(@OGUID+56, 3730, 1, 611.749, -3288.6, 200.684, 5.44543, 0, 0, -0.406736, 0.913546, 300, 300, 1, 100, 0, 10),
(@OGUID+57, 3730, 1, 881.488, -1389.72, 107.279, 0.0523589, 0, 0, 0.0261765, 0.999657, 300, 300, 1, 100, 0, 10),
(@OGUID+58, 3730, 1, 1338.36, -3662.2, 91.8797, 5.74214, 0, 0, -0.267238, 0.963631, 300, 300, 1, 100, 0, 10),
(@OGUID+59, 1622, 1, -732.775, -2066.87, 72.771, 4.7822, 0, 0, -0.681998, 0.731354, 300, 300, 1, 100, 0, 10),
(@OGUID+60, 1622, 1, -606.03, -2135.14, 52.8572, 2.37364, 0, 0, 0.927183, 0.374608, 300, 300, 1, 100, 0, 10),
(@OGUID+61, 1622, 1, -772.777, -2009.33, 77.1303, 2.21657, 0, 0, 0.894934, 0.446199, 300, 300, 1, 100, 0, 10),
(@OGUID+62, 1622, 1, -665.934, -2028.22, 68.1886, 4.04917, 0, 0, -0.898793, 0.438373, 300, 300, 1, 100, 0, 10),
(@OGUID+63, 1622, 1, -689.763, -2102.04, 65.5142, 4.90438, 0, 0, -0.636078, 0.771625, 300, 300, 1, 100, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1036, 0, 'Bruiseweed', 0, 10),
(@OGUID+2, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+3, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+4, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+5, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+6, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+7, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+8, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+9, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+10, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+11, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+12, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+13, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+14, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+15, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+16, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+17, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+18, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+19, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+20, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+21, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+22, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+23, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+24, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+25, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+26, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+27, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+28, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+29, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+30, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+31, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+32, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+33, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+34, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+35, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+36, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+37, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+38, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+39, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+40, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+41, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+42, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+43, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+44, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+45, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+46, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+47, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+48, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+49, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+50, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+51, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+52, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+53, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+54, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+55, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+56, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+57, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+58, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+59, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+60, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+61, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+62, 1036, 0, 'Bruiseweed', 0, 10), -- Bruiseweeds in The Barrens
(@OGUID+63, 1036, 0, 'Bruiseweed', 0, 10); -- Bruiseweeds in The Barrens

-- Correct Pools
UPDATE `pool_template` SET `description`='Bruiseweed in Ashenvale' WHERE  `entry`=1072;
UPDATE `pool_template` SET `description`='Bruiseweed in Barrens' WHERE  `entry`=1036;
UPDATE `pool_template` SET `description`='Bruiseweed in Darkshore' WHERE  `entry`=1101;
UPDATE `pool_template` SET `description`='Bruiseweed in Desolace' WHERE  `entry`=1137;
UPDATE `pool_template` SET `description`='Bruiseweed in Duskwood' WHERE  `entry`=1115;
UPDATE `pool_template` SET `description`='Bruiseweed in Loch Modan' WHERE  `entry`=1164;
UPDATE `pool_template` SET `description`='Bruiseweed in Redridge' WHERE  `entry`=1126;
UPDATE `pool_template` SET `description`='Bruiseweed in Silverpine Forest' WHERE  `entry`=1047;
UPDATE `pool_template` SET `description`='Bruiseweed in Stonetalon' WHERE  `entry`=1086;
UPDATE `pool_template` SET `description`='Bruiseweed in Thousand Needles' WHERE  `entry`=1133;
UPDATE `pool_template` SET `description`='Bruiseweed in Westfall' WHERE  `entry`=1110;
UPDATE `pool_template` SET `description`='Bruiseweed in Wetlands' WHERE  `entry`=1150;

-- Remove Custom Spawns (Non of these spawns exist in the sniff-db)
DELETE FROM `gameobject` WHERE `guid` IN (3378, 3882, 3005, 3314, 3263, 3715, 3840, 2999, 3382, 2940, 3243, 2992, 2938, 3200, 3337, 3515, 3138, 3614, 3556, 2688, 3428, 2928, 2930, 2950, 2951, 2952, 2955, 2971, 3015, 3028, 3032, 3047, 3049, 3050, 3056, 3058, 3099, 3100, 3101, 3102, 3103, 3104, 3105, 3106, 3107, 3134, 3135, 3143, 3157, 3226, 3245, 3260, 3261, 3262, 3270, 3271, 3272, 3274, 3275, 3276, 3328, 3329, 3342, 3361, 3375, 3376, 3406, 3409, 3410, 3451, 3452, 3453, 3455, 3458, 3464, 3465, 3469, 3478, 3494, 3495, 3496, 3497, 3498, 3505, 3524, 3538, 3549, 3552, 3558, 3574, 3575, 3579, 3591, 3595, 3621, 3667, 3692, 3693, 3694, 3703, 3708, 3734, 3735, 3736, 3739, 3793, 3812, 3813, 3827, 3852, 3854, 3862, 13362, 13363);
DELETE FROM `gameobject` WHERE `guid` IN (3378, 3882, 3005, 3314, 3263, 3715, 3840, 2999, 3382, 2940, 3243, 2992, 2938, 3200, 3337, 3515, 3138, 3614, 3556, 2688, 3428, 2908, 2909, 2910, 2911, 2912, 2913, 2914, 2915, 2916, 2920, 2921, 2922, 2923, 2924, 2925, 2926, 2927, 2928, 2931, 2932, 2933, 2934, 2935, 2939, 2942, 2943, 2944, 2945, 2946, 2947, 2948, 2949, 2950, 2951, 2952, 2953, 2954, 2955, 2956, 2958, 2959, 2961, 2962, 2963, 2965, 2967, 2968, 2971, 2973, 2974, 2975, 2976, 2977, 2979, 2980, 2981, 2982, 2983, 2985, 2986, 2987, 2989, 2990, 2991, 2993, 2994, 2995, 2996, 2997, 2998, 3000, 3001, 3002, 3003, 3006, 3007, 3009, 3010, 3011, 3012, 3013, 3014, 3015, 3017, 3018, 3019, 3020, 3021, 3022, 3023, 3024, 3025, 3027, 3029, 3030, 3032, 3033, 3034, 3036, 3037, 3038, 3039, 3040, 3041, 3042, 3045, 3046, 3047, 3048, 3052, 3053, 3055, 3056, 3058, 3060, 3061, 3063, 3064, 3065, 3066, 3067, 3068, 3069, 3070, 3071, 3072, 3073, 3075, 3076, 3078, 3081, 3082, 3083, 3084, 3085, 3086, 3087, 3088, 3089, 3090, 3092, 3093, 3094, 3095, 3096, 3097, 3099, 3100, 3101, 3102, 3103, 3104, 3105, 3106, 3107, 3108, 3109, 3111, 3112, 3113, 3114, 3115, 3116, 3117, 3118, 3119, 3122, 3124, 3125, 3126, 3128, 3129, 3131, 3132, 3133, 3134, 3135, 3136, 3139, 3140, 3141, 3142, 3143, 3146, 3147, 3148, 3152, 3153, 3154, 3155, 3157, 3158, 3159, 3160, 3161, 3162, 3163, 3164, 3165, 3167, 3168, 3169, 3170, 3171, 3172, 3174, 3175, 3176, 3177, 3178, 3179, 3183, 3184, 3185, 3186, 3188, 3189, 3190, 3191, 3193, 3194, 3195, 3196, 3197, 3198, 3202, 3205, 3206, 3207, 3208, 3209, 3210, 3211, 3217, 3220, 3222, 3224, 3225, 3226, 3227, 3228, 3229, 3230, 3231, 3232, 3233, 3234, 3235, 3236, 3237, 3238, 3239, 3240, 3241, 3245, 3246, 3247, 3248, 3249, 3250, 3251, 3252, 3254, 3255, 3256, 3258, 3259, 3260, 3261, 3262, 3264, 3265, 3266, 3267, 3268, 3270, 3271, 3272, 3274, 3275, 3276, 3277, 3278, 3279, 3281, 3282, 3283, 3284, 3285, 3286, 3287, 3288, 3289, 3290, 3292, 3293, 3294, 3295, 3296, 3298, 3299, 3300, 3301, 3302, 3303, 3304, 3305, 3306, 3307, 3310, 3311, 3313, 3315, 3316, 3317, 3318, 3320, 3321, 3322, 3323, 3324, 3325, 3327, 3328, 3329, 3330, 3331, 3332, 3333, 3334, 3335, 3338, 3339, 3341, 3342, 3344, 3346, 3347, 3348, 3349, 3350, 3351, 3352, 3353, 3354, 3355, 3356, 3357, 3358, 3359, 3360, 3362, 3363, 3364, 3365, 3366, 3367, 3368, 3369, 3370, 3371, 3372, 3373, 3374, 3375, 3376, 3379, 3380, 3381, 3383, 3384, 3385, 3386, 3387, 3388, 3389, 3390, 3391, 3394, 3395, 3396, 3397, 3398, 3399, 3400, 3402, 3403, 3404, 3406, 3407, 3408, 3409, 3410, 3411, 3412, 3413, 3418, 3419, 3420, 3421, 3422, 3423, 3424, 3429, 3430, 3431, 3433, 3434, 3436, 3437, 3438, 3440, 3442, 3443, 3444, 3445, 3446, 3447, 3448, 3449, 3450, 3451, 3452, 3453, 3455, 3456, 3459, 3460, 3461, 3462, 3463, 3464, 3465, 3466, 3467, 3468, 3471, 3472, 3473, 3474, 3475, 3476, 3477, 3478, 3481, 3483, 3484, 3485, 3486, 3488, 3489, 3490, 3491, 3492, 3493, 3494, 3495, 3496, 3497, 3498, 3499, 3500, 3501, 3502, 3503, 3504, 3507, 3508, 3511, 3512, 3513, 3514, 3516, 3517, 3519, 3520, 3521, 3523, 3524, 3525, 3526, 3527, 3528, 3529, 3530, 3532, 3533, 3534, 3535, 3537, 3539, 3540, 3542, 3543, 3544, 3545, 3547, 3548, 3550, 3551, 3552, 3553, 3554, 3557, 3558, 3559, 3560, 3562, 3563, 3565, 3566, 3567, 3568, 3570, 3572, 3573, 3574, 3575, 3577, 3578, 3579, 3580, 3582, 3584, 3585, 3587, 3588, 3589, 3590, 3591, 3592, 3593, 3594, 3595, 3596, 3597, 3599, 3600, 3602, 3603, 3604, 3605, 3606, 3607, 3608, 3609, 3610, 3611, 3612, 3613, 3615, 3617, 3618, 3619, 3620, 3621, 3622, 3623, 3625, 3627, 3628, 3630, 3631, 3632, 3634, 3635, 3636, 3637, 3639, 3640, 3641, 3642, 3643, 3644, 3646, 3649, 3650, 3651, 3652, 3653, 3654, 3655, 3656, 3657, 3658, 3659, 3660, 3665, 3666, 3667, 3668, 3669, 3670, 3671, 3672, 3673, 3674, 3675, 3676, 3677, 3678, 3679, 3680, 3681, 3682, 3683, 3684, 3685, 3686, 3688, 3690, 3691, 3692, 3693, 3694, 3695, 3696, 3700, 3701, 3702, 3707, 3709, 3710, 3711, 3712, 3713, 3714, 3716, 3717, 3718, 3719, 3720, 3721, 3722, 3724, 3725, 3726, 3727, 3728, 3729, 3730, 3731, 3732, 3733, 3734, 3735, 3737, 3741, 3742, 3743, 3745, 3746, 3747, 3749, 3751, 3752, 3753, 3754, 3755, 3756, 3759, 3760, 3761, 3763, 3764, 3765, 3766, 3767, 3768, 3769, 3770, 3771, 3773, 3775, 3776, 3778, 3779, 3780, 3781, 3782, 3783, 3784, 3785, 3786, 3787, 3789, 3793, 3796, 3798, 3801, 3802, 3803, 3805, 3806, 3807, 3808, 3809, 3810, 3811, 3812, 3813, 3815, 3817, 3818, 3819, 3820, 3821, 3822, 3823, 3824, 3825, 3826, 3827, 3828, 3829, 3830, 3831, 3834, 3835, 3836, 3837, 3839, 3842, 3844, 3845, 3846, 3847, 3848, 3850, 3852, 3855, 3856, 3857, 3858, 3860, 3861, 3862, 3863, 3864, 3866, 3867, 3868, 3869, 3870, 3871, 3872, 3875, 3878, 3879, 3880, 3883, 3884, 3885, 3886, 39979, 39999);
DELETE FROM `pool_gameobject` WHERE `guid` IN (3378, 3882, 3005, 3314, 3263, 3715, 3840, 2999, 3382, 2940, 3243, 2992, 2938, 3200, 3337, 3515, 3138, 3614, 3556, 2688, 3428, 2928, 2930, 2950, 2951, 2952, 2955, 2971, 3015, 3028, 3032, 3047, 3049, 3050, 3056, 3058, 3099, 3100, 3101, 3102, 3103, 3104, 3105, 3106, 3107, 3134, 3135, 3143, 3157, 3226, 3245, 3260, 3261, 3262, 3270, 3271, 3272, 3274, 3275, 3276, 3328, 3329, 3342, 3361, 3375, 3376, 3406, 3409, 3410, 3451, 3452, 3453, 3455, 3458, 3464, 3465, 3469, 3478, 3494, 3495, 3496, 3497, 3498, 3505, 3524, 3538, 3549, 3552, 3558, 3574, 3575, 3579, 3591, 3595, 3621, 3667, 3692, 3693, 3694, 3703, 3708, 3734, 3735, 3736, 3739, 3793, 3812, 3813, 3827, 3852, 3854, 3862, 13362, 13363);
DELETE FROM `pool_gameobject` WHERE `guid` IN (3378, 3882, 3005, 3314, 3263, 3715, 3840, 2999, 3382, 2940, 3243, 2992, 2938, 3200, 3337, 3515, 3138, 3614, 3556, 2688, 3428, 2908, 2909, 2910, 2911, 2912, 2913, 2914, 2915, 2916, 2920, 2921, 2922, 2923, 2924, 2925, 2926, 2927, 2928, 2931, 2932, 2933, 2934, 2935, 2939, 2942, 2943, 2944, 2945, 2946, 2947, 2948, 2949, 2950, 2951, 2952, 2953, 2954, 2955, 2956, 2958, 2959, 2961, 2962, 2963, 2965, 2967, 2968, 2971, 2973, 2974, 2975, 2976, 2977, 2979, 2980, 2981, 2982, 2983, 2985, 2986, 2987, 2989, 2990, 2991, 2993, 2994, 2995, 2996, 2997, 2998, 3000, 3001, 3002, 3003, 3006, 3007, 3009, 3010, 3011, 3012, 3013, 3014, 3015, 3017, 3018, 3019, 3020, 3021, 3022, 3023, 3024, 3025, 3027, 3029, 3030, 3032, 3033, 3034, 3036, 3037, 3038, 3039, 3040, 3041, 3042, 3045, 3046, 3047, 3048, 3052, 3053, 3055, 3056, 3058, 3060, 3061, 3063, 3064, 3065, 3066, 3067, 3068, 3069, 3070, 3071, 3072, 3073, 3075, 3076, 3078, 3081, 3082, 3083, 3084, 3085, 3086, 3087, 3088, 3089, 3090, 3092, 3093, 3094, 3095, 3096, 3097, 3099, 3100, 3101, 3102, 3103, 3104, 3105, 3106, 3107, 3108, 3109, 3111, 3112, 3113, 3114, 3115, 3116, 3117, 3118, 3119, 3122, 3124, 3125, 3126, 3128, 3129, 3131, 3132, 3133, 3134, 3135, 3136, 3139, 3140, 3141, 3142, 3143, 3146, 3147, 3148, 3152, 3153, 3154, 3155, 3157, 3158, 3159, 3160, 3161, 3162, 3163, 3164, 3165, 3167, 3168, 3169, 3170, 3171, 3172, 3174, 3175, 3176, 3177, 3178, 3179, 3183, 3184, 3185, 3186, 3188, 3189, 3190, 3191, 3193, 3194, 3195, 3196, 3197, 3198, 3202, 3205, 3206, 3207, 3208, 3209, 3210, 3211, 3217, 3220, 3222, 3224, 3225, 3226, 3227, 3228, 3229, 3230, 3231, 3232, 3233, 3234, 3235, 3236, 3237, 3238, 3239, 3240, 3241, 3245, 3246, 3247, 3248, 3249, 3250, 3251, 3252, 3254, 3255, 3256, 3258, 3259, 3260, 3261, 3262, 3264, 3265, 3266, 3267, 3268, 3270, 3271, 3272, 3274, 3275, 3276, 3277, 3278, 3279, 3281, 3282, 3283, 3284, 3285, 3286, 3287, 3288, 3289, 3290, 3292, 3293, 3294, 3295, 3296, 3298, 3299, 3300, 3301, 3302, 3303, 3304, 3305, 3306, 3307, 3310, 3311, 3313, 3315, 3316, 3317, 3318, 3320, 3321, 3322, 3323, 3324, 3325, 3327, 3328, 3329, 3330, 3331, 3332, 3333, 3334, 3335, 3338, 3339, 3341, 3342, 3344, 3346, 3347, 3348, 3349, 3350, 3351, 3352, 3353, 3354, 3355, 3356, 3357, 3358, 3359, 3360, 3362, 3363, 3364, 3365, 3366, 3367, 3368, 3369, 3370, 3371, 3372, 3373, 3374, 3375, 3376, 3379, 3380, 3381, 3383, 3384, 3385, 3386, 3387, 3388, 3389, 3390, 3391, 3394, 3395, 3396, 3397, 3398, 3399, 3400, 3402, 3403, 3404, 3406, 3407, 3408, 3409, 3410, 3411, 3412, 3413, 3418, 3419, 3420, 3421, 3422, 3423, 3424, 3429, 3430, 3431, 3433, 3434, 3436, 3437, 3438, 3440, 3442, 3443, 3444, 3445, 3446, 3447, 3448, 3449, 3450, 3451, 3452, 3453, 3455, 3456, 3459, 3460, 3461, 3462, 3463, 3464, 3465, 3466, 3467, 3468, 3471, 3472, 3473, 3474, 3475, 3476, 3477, 3478, 3481, 3483, 3484, 3485, 3486, 3488, 3489, 3490, 3491, 3492, 3493, 3494, 3495, 3496, 3497, 3498, 3499, 3500, 3501, 3502, 3503, 3504, 3507, 3508, 3511, 3512, 3513, 3514, 3516, 3517, 3519, 3520, 3521, 3523, 3524, 3525, 3526, 3527, 3528, 3529, 3530, 3532, 3533, 3534, 3535, 3537, 3539, 3540, 3542, 3543, 3544, 3545, 3547, 3548, 3550, 3551, 3552, 3553, 3554, 3557, 3558, 3559, 3560, 3562, 3563, 3565, 3566, 3567, 3568, 3570, 3572, 3573, 3574, 3575, 3577, 3578, 3579, 3580, 3582, 3584, 3585, 3587, 3588, 3589, 3590, 3591, 3592, 3593, 3594, 3595, 3596, 3597, 3599, 3600, 3602, 3603, 3604, 3605, 3606, 3607, 3608, 3609, 3610, 3611, 3612, 3613, 3615, 3617, 3618, 3619, 3620, 3621, 3622, 3623, 3625, 3627, 3628, 3630, 3631, 3632, 3634, 3635, 3636, 3637, 3639, 3640, 3641, 3642, 3643, 3644, 3646, 3649, 3650, 3651, 3652, 3653, 3654, 3655, 3656, 3657, 3658, 3659, 3660, 3665, 3666, 3667, 3668, 3669, 3670, 3671, 3672, 3673, 3674, 3675, 3676, 3677, 3678, 3679, 3680, 3681, 3682, 3683, 3684, 3685, 3686, 3688, 3690, 3691, 3692, 3693, 3694, 3695, 3696, 3700, 3701, 3702, 3707, 3709, 3710, 3711, 3712, 3713, 3714, 3716, 3717, 3718, 3719, 3720, 3721, 3722, 3724, 3725, 3726, 3727, 3728, 3729, 3730, 3731, 3732, 3733, 3734, 3735, 3737, 3741, 3742, 3743, 3745, 3746, 3747, 3749, 3751, 3752, 3753, 3754, 3755, 3756, 3759, 3760, 3761, 3763, 3764, 3765, 3766, 3767, 3768, 3769, 3770, 3771, 3773, 3775, 3776, 3778, 3779, 3780, 3781, 3782, 3783, 3784, 3785, 3786, 3787, 3789, 3793, 3796, 3798, 3801, 3802, 3803, 3805, 3806, 3807, 3808, 3809, 3810, 3811, 3812, 3813, 3815, 3817, 3818, 3819, 3820, 3821, 3822, 3823, 3824, 3825, 3826, 3827, 3828, 3829, 3830, 3831, 3834, 3835, 3836, 3837, 3839, 3842, 3844, 3845, 3846, 3847, 3848, 3850, 3852, 3855, 3856, 3857, 3858, 3860, 3861, 3862, 3863, 3864, 3866, 3867, 3868, 3869, 3870, 3871, 3872, 3875, 3878, 3879, 3880, 3883, 3884, 3885, 3886, 39979, 39999);

-- Sync Gobject Data
UPDATE `gameobject` SET `spawn_flags` = 0, `animprogress` = 100 WHERE `id` IN (1622, 3730);

-- Update Counters
UPDATE `pool_template` SET `max_limit` = 58 WHERE `entry`=1126;
UPDATE `pool_template` SET `max_limit` = 48 WHERE `entry`=1115;
UPDATE `pool_template` SET `max_limit` = 37 WHERE `entry`=1110;
UPDATE `pool_template` SET `max_limit` = 20 WHERE `entry`=1101;
UPDATE `pool_template` SET `max_limit` = 29 WHERE `entry`=1164;
UPDATE `pool_template` SET `max_limit` = 51 WHERE `entry`=1150;
UPDATE `pool_template` SET `max_limit` = 12 WHERE `entry`=1056;
UPDATE `pool_template` SET `max_limit` = 55 WHERE `entry`=1048;
UPDATE `pool_template` SET `max_limit` = 25 WHERE `entry`=1047;
UPDATE `pool_template` SET `max_limit` = 29 WHERE `entry`=1036;
UPDATE `pool_template` SET `max_limit` = 35 WHERE `entry`=1133;
UPDATE `pool_template` SET `max_limit` = 44 WHERE `entry`=1072;
UPDATE `pool_template` SET `max_limit` = 25 WHERE `entry`=1137;
UPDATE `pool_template` SET `max_limit` = 102 WHERE `entry`=1086;
UPDATE `pool_template` SET `max_limit` = 3 WHERE `entry`=1052;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
