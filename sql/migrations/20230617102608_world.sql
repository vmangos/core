DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230617102608');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230617102608');
-- Add your query below.


-- Wild Steelbloom (1623)
SET @OGUID = 56119;

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
(@OGUID+1, 1623, 0, -6519.87, -2397.08, 294.743, 2.9496, 0, 0, 0.995396, 0.0958512, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3601 at 150.295395 yards.
(@OGUID+2, 1623, 0, -6456.49, -2473.7, 324.2, 2.00713, 0, 0, 0.843391, 0.5373, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3601 at 132.624023 yards.
(@OGUID+3, 1623, 0, -7256.36, -3192.52, 293.308, 1.18682, 0, 0, 0.559193, 0.829038, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3638 at 739.912842 yards.
(@OGUID+4, 1623, 0, -7264.99, -2188.65, 293.052, 2.65289, 0, 0, 0.970295, 0.241925, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3601 at 779.712830 yards.
(@OGUID+5, 1623, 0, -7257.29, -3423.82, 294.898, 3.78737, 0, 0, -0.948323, 0.317306, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3638 at 707.391357 yards.
(@OGUID+6, 1623, 0, -6628, -3368.33, 267.505, 3.24635, 0, 0, -0.998629, 0.0523532, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3638 at 91.222633 yards.
(@OGUID+7, 1623, 0, -7358.67, -2348.66, 309.965, 5.68977, 0, 0, -0.292372, 0.956305, 300, 300, 1, 100, 0, 10),
(@OGUID+8, 1623, 0, -7357, -2468.26, 315.139, 2.26893, 0, 0, 0.906307, 0.422619, 300, 300, 1, 100, 0, 10),
(@OGUID+9, 1623, 0, -7271.19, -3498.73, 324.513, 5.96903, 0, 0, -0.156434, 0.987688, 300, 300, 1, 100, 0, 10),
(@OGUID+10, 1623, 0, -6472.69, -3875.27, 329.263, 6.00393, 0, 0, -0.139173, 0.990268, 300, 300, 1, 100, 0, 10),
(@OGUID+11, 1623, 0, -6437.25, -3771.69, 296.403, 4.25861, 0, 0, -0.848047, 0.529921, 300, 300, 1, 100, 0, 10);

-- Missing Wild Steelbloom spawns in Duskwood.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+12, 1623, 0, -10537.2, -1533.53, 124.838, 3.49067, 0, 0, -0.984807, 0.173652, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4209 at 204.122452 yards.
(@OGUID+13, 1623, 0, -10638.6, -1451.02, 98.9746, 4.60767, 0, 0, -0.743144, 0.669131, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4209 at 302.670563 yards.
(@OGUID+14, 1623, 0, -10556.8, -164.8, 75.6976, 0, 0, 0, 0, 1, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 32474 at 224.805313 yards.
(@OGUID+15, 1623, 0, -10481.1, -718.845, 96.757, 2.3911, 0, 0, 0.930417, 0.366502, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4178 at 243.417892 yards.
(@OGUID+16, 1623, 0, -11123, -1232.55, 102.053, 1.22173, 0, 0, 0.573576, 0.819152, 300, 300, 1, 100, 0, 10),
(@OGUID+17, 1623, 0, -10693.7, -601.31, 80.3573, 3.50812, 0, 0, -0.983254, 0.182238, 300, 300, 1, 100, 0, 10),
(@OGUID+18, 1623, 0, -10264, -692.957, 58.8501, 3.50812, 0, 0, -0.983254, 0.182238, 300, 300, 1, 100, 0, 10),
(@OGUID+19, 1623, 0, -10096.3, -384.409, 54.7689, 2.18166, 0, 0, 0.887011, 0.461749, 300, 300, 1, 100, 0, 10);

-- Missing Wild Steelbloom spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+20, 1623, 0, -2655.84, -2395.78, 98.9103, 3.49067, 0, 0, -0.984807, 0.173652, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4073 at 32.975430 yards.
(@OGUID+21, 1623, 0, -3679.29, -3214.33, 58.8998, 6.21337, 0, 0, -0.0348988, 0.999391, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3661 at 276.625397 yards.
(@OGUID+22, 1623, 0, -3411.73, -1955.3, 112.661, 5.86431, 0, 0, -0.207911, 0.978148, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4137 at 122.549553 yards.
(@OGUID+23, 1623, 0, -2659.93, -2048.6, 76.8451, 5.20108, 0, 0, -0.515038, 0.857168, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4044 at 127.199364 yards.
(@OGUID+24, 1623, 0, -3440.42, -2082.7, 114.44, 1.0472, 0, 0, 0.5, 0.866025, 300, 300, 1, 100, 0, 10),
(@OGUID+25, 1623, 0, -3385.33, -3465.06, 69.4809, 5.11382, 0, 0, -0.551936, 0.833886, 300, 300, 1, 100, 0, 10),
(@OGUID+26, 1623, 0, -3376.96, -1746.96, 66.1039, 3.49067, 0, 0, -0.984807, 0.173652, 300, 300, 1, 100, 0, 10),
(@OGUID+27, 1623, 0, -3272.46, -1950.03, 64.9973, 1.29154, 0, 0, 0.601814, 0.798636, 300, 300, 1, 100, 0, 10),
(@OGUID+28, 1623, 0, -3271.75, -2229.59, 58.2369, 5.37562, 0, 0, -0.438371, 0.898794, 300, 300, 1, 100, 0, 10),
(@OGUID+29, 1623, 0, -2715.24, -2815.2, 68.539, 0.0349062, 0, 0, 0.0174522, 0.999848, 300, 300, 1, 100, 0, 10);

-- Missing Wild Steelbloom spawns in The Barrens.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+30, 1623, 1, -3432.11, -2372.13, 117.695, 0.471238, 0, 0, 0.233445, 0.97237, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3979 at 141.293152 yards.
(@OGUID+31, 1623, 1, -3477.06, -1757.76, 112.405, 2.53072, 0, 0, 0.953716, 0.300708, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4085 at 24.017416 yards.
(@OGUID+32, 1623, 1, -1881.15, -1678.6, 115.408, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4275 at 532.488892 yards.
(@OGUID+33, 1623, 1, -3698.97, -1519.07, 132.925, 3.05433, 0, 0, 0.999048, 0.0436193, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 13369 at 233.285263 yards.
(@OGUID+34, 1623, 1, -3816.51, -1418.15, 144.295, 5.88176, 0, 0, -0.199368, 0.979925, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3937 at 331.092682 yards.
(@OGUID+35, 1623, 1, -3982.59, -1907.63, 129.872, 5.75959, 0, 0, -0.258819, 0.965926, 300, 300, 1, 100, 0, 10);

-- Missing Wild Steelbloom spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+36, 1623, 0, -13023.6, -954.967, 104.673, 4.93928, 0, 0, -0.622514, 0.782609, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3952 at 87.546722 yards.
(@OGUID+37, 1623, 0, -11513.2, 507.041, 82.1076, 1.27409, 0, 0, 0.594822, 0.803857, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 11654 at 79.464615 yards.
(@OGUID+38, 1623, 0, -14141.5, 110.259, 54.3712, 4.41568, 0, 0, -0.803857, 0.594823, 300, 300, 1, 100, 0, 10),
(@OGUID+39, 1623, 0, -14044.4, 78.7977, 22.9999, 2.16421, 0, 0, 0.882947, 0.469473, 300, 300, 1, 100, 0, 10),
(@OGUID+40, 1623, 0, -13890.5, 151.698, 27.7119, 1.44862, 0, 0, 0.66262, 0.748956, 300, 300, 1, 100, 0, 10),
(@OGUID+41, 1623, 0, -13833.2, 499.964, 86.8085, 3.927, 0, 0, -0.923879, 0.382686, 300, 300, 1, 100, 0, 10),
(@OGUID+42, 1623, 0, -13828.4, 430.285, 94.8073, 3.85718, 0, 0, -0.936671, 0.35021, 300, 300, 1, 100, 0, 10),
(@OGUID+43, 1623, 0, -13789.7, -1.86914, 37.6617, 3.87463, 0, 0, -0.93358, 0.358368, 300, 300, 1, 100, 0, 10),
(@OGUID+44, 1623, 0, -13768.8, -220.915, 31.0275, 0.453785, 0, 0, 0.224951, 0.97437, 300, 300, 1, 100, 0, 10),
(@OGUID+45, 1623, 0, -13744.2, 514.59, 62.0928, 1.95477, 0, 0, 0.829038, 0.559193, 300, 300, 1, 100, 0, 10),
(@OGUID+46, 1623, 0, -13727.1, 350.058, 52.7766, 0.209439, 0, 0, 0.104528, 0.994522, 300, 300, 1, 100, 0, 10),
(@OGUID+47, 1623, 0, -13081.1, -477.875, 49.3992, 2.25147, 0, 0, 0.902585, 0.430512, 300, 300, 1, 100, 0, 10),
(@OGUID+48, 1623, 0, -13016.4, -516.639, 83.6017, 5.00909, 0, 0, -0.594823, 0.803857, 300, 300, 1, 100, 0, 10),
(@OGUID+49, 1623, 0, -13007.6, -868.947, 91.5605, 3.6652, 0, 0, -0.965925, 0.258821, 300, 300, 1, 100, 0, 10),
(@OGUID+50, 1623, 0, -12957.5, -425.651, 42.6355, 5.11382, 0, 0, -0.551936, 0.833886, 300, 300, 1, 100, 0, 10),
(@OGUID+51, 1623, 0, -12850.3, -931.785, 80.3192, 4.27606, 0, 0, -0.843391, 0.5373, 300, 300, 1, 100, 0, 10),
(@OGUID+52, 1623, 0, -12818.3, -704.43, 81.3125, 2.58308, 0, 0, 0.961261, 0.27564, 300, 300, 1, 100, 0, 10),
(@OGUID+53, 1623, 0, -12680.3, -209.298, 37.1576, 5.89921, 0, 0, -0.190808, 0.981627, 300, 300, 1, 100, 0, 10),
(@OGUID+54, 1623, 0, -12212, -1033.11, 64.0134, 3.89209, 0, 0, -0.930417, 0.366502, 300, 300, 1, 100, 0, 10),
(@OGUID+55, 1623, 0, -12197.4, 74.5431, 21.7131, 4.41568, 0, 0, -0.803857, 0.594823, 300, 300, 1, 100, 0, 10),
(@OGUID+56, 1623, 0, -12074.1, -886.709, 61.8185, 1.88495, 0, 0, 0.809016, 0.587786, 300, 300, 1, 100, 0, 10),
(@OGUID+57, 1623, 0, -12027.6, -1035.87, 61.811, 1.78023, 0, 0, 0.777145, 0.629321, 300, 300, 1, 100, 0, 10),
(@OGUID+58, 1623, 0, -11924.1, 433.184, 49.4204, 2.26893, 0, 0, 0.906307, 0.422619, 300, 300, 1, 100, 0, 10),
(@OGUID+59, 1623, 0, -11903.7, 161.891, 41.3388, 5.70723, 0, 0, -0.284015, 0.95882, 300, 300, 1, 100, 0, 10),
(@OGUID+60, 1623, 0, -11879.8, 49.1928, 22.817, 1.46608, 0, 0, 0.66913, 0.743145, 300, 300, 1, 100, 0, 10),
(@OGUID+61, 1623, 0, -11784.8, 673.571, 76.1278, 3.45576, 0, 0, -0.987688, 0.156436, 300, 300, 1, 100, 0, 10),
(@OGUID+62, 1623, 0, -11746, -1000.18, 87.1822, 6.16101, 0, 0, -0.0610485, 0.998135, 300, 300, 1, 100, 0, 10),
(@OGUID+63, 1623, 0, -11743.4, 498.135, 72.245, 2.3911, 0, 0, 0.930417, 0.366502, 300, 300, 1, 100, 0, 10),
(@OGUID+64, 1623, 0, -11715.2, -721.097, 49.4207, 2.19911, 0, 0, 0.891006, 0.453991, 300, 300, 1, 100, 0, 10),
(@OGUID+65, 1623, 0, -11600.3, 1033.33, 34.8892, 1.69297, 0, 0, 0.748956, 0.66262, 300, 300, 1, 100, 0, 10),
(@OGUID+66, 1623, 0, -11467.9, 334.566, 56.6438, 5.96903, 0, 0, -0.156434, 0.987688, 300, 300, 1, 100, 0, 10),
(@OGUID+67, 1623, 0, -11409.8, -824.82, 92.1055, 5.86431, 0, 0, -0.207911, 0.978148, 300, 300, 1, 100, 0, 10);

-- Missing Wild Steelbloom spawns in Alterac Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+68, 1623, 0, -39.3669, -666.351, 91.5816, 2.04204, 0, 0, 0.85264, 0.522499, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 4102 at 544.405334 yards.

-- Missing Wild Steelbloom spawns in Arathi Highlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+69, 1623, 0, -2015.63, -2763.03, 88.1638, 5.42797, 0, 0, -0.414693, 0.909961, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4081 at 19.887192 yards.
(@OGUID+70, 1623, 0, -1252.72, -1853.49, 104.184, 0.785397, 0, 0, 0.382683, 0.92388, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4133 at 5.658643 yards.
(@OGUID+71, 1623, 0, -1953.65, -1621.69, 50.6998, 3.14159, 0, 0, -1, 0, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4161 at 7.935150 yards.
(@OGUID+72, 1623, 0, -923.274, -3734.02, 97.1244, 2.65289, 0, 0, 0.970295, 0.241925, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4177 at 6.297833 yards.
(@OGUID+73, 1623, 0, -755.853, -2290.78, 62.4308, 0, 0, 0, 0, 1, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3918 at 18.771318 yards.
(@OGUID+74, 1623, 0, -1178.42, -2048.25, 80.5063, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4184 at 20.165701 yards.
(@OGUID+75, 1623, 0, -766.667, -2339.4, 73.999, 5.93412, 0, 0, -0.173648, 0.984808, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3918 at 32.871376 yards.
(@OGUID+76, 1623, 0, -949.621, -2621.07, 67.446, 2.84488, 0, 0, 0.989016, 0.147811, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4175 at 20.259676 yards.
(@OGUID+77, 1623, 0, -1780.45, -2093.27, 82.2684, 5.75959, 0, 0, -0.258819, 0.965926, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4163 at 7.938890 yards.
(@OGUID+78, 1623, 0, -1925.43, -3260.48, 76.7621, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 1, 100, 0, 10),
(@OGUID+79, 1623, 0, -1905.36, -1663.11, 68.2803, 0.314158, 0, 0, 0.156434, 0.987688, 300, 300, 1, 100, 0, 10),
(@OGUID+80, 1623, 0, -1756.26, -3523.51, 72.5092, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 1, 100, 0, 10),
(@OGUID+81, 1623, 0, -1217.99, -2138.6, 72.9569, 3.89209, 0, 0, -0.930417, 0.366502, 300, 300, 1, 100, 0, 10),
(@OGUID+82, 1623, 0, -820.696, -3109.38, 88.8006, 4.46804, 0, 0, -0.788011, 0.615662, 300, 300, 1, 100, 0, 10),
(@OGUID+83, 1623, 0, -699.046, -2187.5, 82.7515, 5.34071, 0, 0, -0.45399, 0.891007, 300, 300, 1, 100, 0, 10),
(@OGUID+84, 1623, 0, -633.374, -2060.6, 67.0973, 1.69297, 0, 0, 0.748956, 0.66262, 300, 300, 1, 100, 0, 10);

-- Missing Wild Steelbloom spawns in Hillsbrad Foothills.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+85, 1623, 0, -1386.77, -1207.64, 52.1702, 3.6652, 0, 0, -0.965925, 0.258821, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34252 at 583.241028 yards.
(@OGUID+86, 1623, 0, -244.647, -1761.18, 134.621, 0.994837, 0, 0, 0.477159, 0.878817, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3626 at 632.323120 yards.
(@OGUID+87, 1623, 0, -128.739, -1755.53, 144.186, 4.31097, 0, 0, -0.833885, 0.551938, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3626 at 666.495117 yards.
(@OGUID+88, 1623, 0, -216.618, -1379.53, 116.65, 0.977383, 0, 0, 0.469471, 0.882948, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3626 at 296.869843 yards.
(@OGUID+89, 1623, 0, -493.843, -1183.12, 80.3286, 3.47321, 0, 0, -0.986285, 0.16505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3626 at 96.822945 yards.
(@OGUID+90, 1623, 0, -1401.68, -1098.82, 39.569, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34252 at 608.741577 yards.
(@OGUID+91, 1623, 0, 87.1907, -1252.31, 82.3047, 0.698131, 0, 0, 0.34202, 0.939693, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3626 at 499.859253 yards.
(@OGUID+92, 1623, 0, -434.975, -1152.92, 74.362, 2.25147, 0, 0, 0.902585, 0.430512, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3626 at 32.602699 yards.
(@OGUID+93, 1623, 0, -274.828, -1037.61, 75.8699, 1.97222, 0, 0, 0.833885, 0.551938, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3626 at 171.193771 yards.
(@OGUID+94, 1623, 0, -335.789, -1695.81, 107.266, 5.77704, 0, 0, -0.25038, 0.968148, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3626 at 549.057251 yards.
(@OGUID+95, 1623, 0, -248.231, -1218.32, 118.386, 3.10665, 0, 0, 0.999847, 0.0174693, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3626 at 173.456833 yards.
(@OGUID+96, 1623, 0, 114.982, -1020.31, 106.923, 3.76991, 0, 0, -0.951056, 0.309017, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3626 at 534.778870 yards.
(@OGUID+97, 1623, 0, 47.1491, -640.59, 96.4607, 5.65487, 0, 0, -0.309016, 0.951057, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3626 at 681.073914 yards.
(@OGUID+98, 1623, 0, -1431.21, -1182.22, 66.7875, 2.37364, 0, 0, 0.927183, 0.374608, 300, 300, 1, 100, 0, 10),
(@OGUID+99, 1623, 0, -1202.26, -987.624, 54.6266, 5.86431, 0, 0, -0.207911, 0.978148, 300, 300, 1, 100, 0, 10),
(@OGUID+100, 1623, 0, -1097.72, -862.315, 45.1709, 2.77507, 0, 0, 0.983254, 0.182238, 300, 300, 1, 100, 0, 10),
(@OGUID+101, 1623, 0, -1015.45, -1156.76, 70.3094, 5.16618, 0, 0, -0.529919, 0.848048, 300, 300, 1, 100, 0, 10),
(@OGUID+102, 1623, 0, -720.944, -956.985, 53.1234, 5.02655, 0, 0, -0.587785, 0.809017, 300, 300, 1, 100, 0, 10),
(@OGUID+103, 1623, 0, -251.247, -215.906, 98.5199, 2.51327, 0, 0, 0.951056, 0.309017, 300, 300, 1, 100, 0, 10),
(@OGUID+104, 1623, 0, -23.4002, -1335.71, 141.237, 4.88692, 0, 0, -0.642787, 0.766045, 300, 300, 1, 100, 0, 10);

-- Missing Wild Steelbloom spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+105, 1623, 1, 1712.75, -3379.23, 149.919, 0.279252, 0, 0, 0.139173, 0.990268, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4025 at 16.381109 yards.
(@OGUID+106, 1623, 1, 1717.64, -3238.66, 150.494, 1.36136, 0, 0, 0.62932, 0.777146, 300, 300, 1, 100, 0, 10),
(@OGUID+107, 1623, 1, 1718.72, -3502.94, 150.505, 4.46804, 0, 0, -0.788011, 0.615662, 300, 300, 1, 100, 0, 10),
(@OGUID+108, 1623, 1, 2099.48, -2164.8, 162.974, 2.07694, 0, 0, 0.861629, 0.507539, 300, 300, 1, 100, 0, 10),
(@OGUID+109, 1623, 1, 2381.64, 253.525, 162.387, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 1, 100, 0, 10),
(@OGUID+110, 1623, 1, 3556.59, -1425.08, 192.132, 3.47321, 0, 0, -0.986285, 0.16505, 300, 300, 1, 100, 0, 10);

-- Missing Wild Steelbloom spawns in Thousand Needles.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+111, 1623, 1, -6532.64, -3324.51, -41.3352, 4.64258, 0, 0, -0.731354, 0.681998, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4088 at 663.111572 yards.
(@OGUID+112, 1623, 1, -5365.98, -2731.19, -19.6399, 6.24828, 0, 0, -0.0174522, 0.999848, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3919 at 24.451391 yards.
(@OGUID+113, 1623, 1, -4656.35, -1535.07, -29.4601, 2.09439, 0, 0, 0.866025, 0.500001, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3977 at 108.885338 yards.
(@OGUID+114, 1623, 1, -4540.06, -1112.71, -40.7963, 2.82743, 0, 0, 0.987688, 0.156436, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4060 at 7.821816 yards.
(@OGUID+115, 1623, 1, -4638.27, -1335.26, -29.6609, 4.34587, 0, 0, -0.824126, 0.566406, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3911 at 19.558281 yards.
(@OGUID+116, 1623, 1, -5744.01, -3299.31, -15.781, 4.71239, 0, 0, -0.707107, 0.707107, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4120 at 20.700256 yards.
(@OGUID+117, 1623, 1, -5111.26, -1633.1, -27.9921, 2.53072, 0, 0, 0.953716, 0.300708, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4246 at 162.974380 yards.
(@OGUID+118, 1623, 1, -5395.51, -1994.2, -44.7428, 5.81195, 0, 0, -0.233445, 0.97237, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16808 at 161.242020 yards.
(@OGUID+119, 1623, 1, -5468.11, -1744.74, -17.1175, 0.698131, 0, 0, 0.34202, 0.939693, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4050 at 21.024477 yards.
(@OGUID+120, 1623, 1, -5156.76, -1226.03, 49.1134, 1.58825, 0, 0, 0.71325, 0.70091, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4117 at 25.353037 yards.
(@OGUID+121, 1623, 1, -5466.03, -3213.86, -16.943, 0.279252, 0, 0, 0.139173, 0.990268, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3888 at 10.243816 yards.
(@OGUID+122, 1623, 1, -5760.16, -4341.29, -42.3646, 5.44543, 0, 0, -0.406736, 0.913546, 300, 300, 1, 100, 0, 10),
(@OGUID+123, 1623, 1, -5685.46, -3129.31, -24.6649, 3.6652, 0, 0, -0.965925, 0.258821, 300, 300, 1, 100, 0, 10),
(@OGUID+124, 1623, 1, -5270.17, -2575.46, -31.8794, 3.97935, 0, 0, -0.913545, 0.406738, 300, 300, 1, 100, 0, 10),
(@OGUID+125, 1623, 1, -5100.27, -1069.34, 1.36694, 1.48353, 0, 0, 0.67559, 0.737278, 300, 300, 1, 100, 0, 10),
(@OGUID+126, 1623, 1, -4859.83, -911.604, 0.455012, 3.94445, 0, 0, -0.920505, 0.390732, 300, 300, 1, 100, 0, 10);

-- Missing Wild Steelbloom spawns in Desolace.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+127, 1623, 1, -918.797, 839.595, 136.834, 0.820303, 0, 0, 0.398748, 0.91706, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 4063 at 34.962452 yards.

-- Missing Wild Steelbloom spawns in Stonetalon Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+128, 1623, 1, -58.0826, -319.154, 13.3697, 3.9619, 0, 0, -0.91706, 0.39875, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4054 at 15.503306 yards.
(@OGUID+129, 1623, 1, 471.506, 1698.63, 32.7717, 0.750491, 0, 0, 0.366501, 0.930418, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4034 at 22.750711 yards.
(@OGUID+130, 1623, 1, 1588.58, 1417.84, 197.676, 2.44346, 0, 0, 0.939692, 0.34202, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4265 at 22.602268 yards.
(@OGUID+131, 1623, 1, 2198.55, 1377.93, 285.3, 1.22173, 0, 0, 0.573576, 0.819152, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3961 at 36.449203 yards.
(@OGUID+132, 1623, 1, 2361.29, 1689.74, 334.74, 5.68977, 0, 0, -0.292372, 0.956305, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3941 at 10.096108 yards.
(@OGUID+133, 1623, 1, 2622.2, 1778.37, 337.445, 1.98967, 0, 0, 0.83867, 0.54464, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 47365 at 146.111801 yards.
(@OGUID+134, 1623, 1, 9.36697, -836.588, 29.2434, 3.47321, 0, 0, -0.986285, 0.16505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4194 at 15.476217 yards.
(@OGUID+135, 1623, 1, 2247.7, 1630.39, 326.004, 0.90757, 0, 0, 0.438371, 0.898794, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4071 at 7.604077 yards.
(@OGUID+136, 1623, 1, 207.223, -438.468, 28.4137, 0.558504, 0, 0, 0.275637, 0.961262, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3912 at 10.556634 yards.
(@OGUID+137, 1623, 1, 1207.74, 407.573, 84.235, 0.837757, 0, 0, 0.406736, 0.913546, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4047 at 54.502522 yards.
(@OGUID+138, 1623, 1, 1550.65, -349.78, 56.6547, 4.08407, 0, 0, -0.891006, 0.453991, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4041 at 7.182665 yards.
(@OGUID+139, 1623, 1, 719.457, 182.827, 75.7343, 5.49779, 0, 0, -0.382683, 0.92388, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4145 at 5.391454 yards.
(@OGUID+140, 1623, 1, 2041.76, 1112.74, 257.874, 5.35816, 0, 0, -0.446198, 0.894935, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4155 at 10.762703 yards.
(@OGUID+141, 1623, 1, 2543.4, 1184.89, 336.05, 2.51327, 0, 0, 0.951056, 0.309017, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4052 at 11.260164 yards.
(@OGUID+142, 1623, 1, 232.98, 11.8919, 74.468, 5.34071, 0, 0, -0.45399, 0.891007, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4165 at 367.543945 yards.
(@OGUID+143, 1623, 1, 545.39, 455.387, 85.2109, 4.41568, 0, 0, -0.803857, 0.594823, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4035 at 34.061798 yards.
(@OGUID+144, 1623, 1, 998.557, -302.445, 29.2159, 4.88692, 0, 0, -0.642787, 0.766045, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 3994 at 11.263259 yards.
(@OGUID+145, 1623, 1, 1294.78, 422.753, 80.6176, 4.50295, 0, 0, -0.777145, 0.629321, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4135 at 5.492360 yards.
(@OGUID+146, 1623, 1, 98.1569, -686.456, 22.3247, 3.9619, 0, 0, -0.91706, 0.39875, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4019 at 10.508227 yards.
(@OGUID+147, 1623, 1, -183.607, -560.612, 11.3115, 1.25664, 0, 0, 0.587785, 0.809017, 300, 300, 1, 100, 0, 10),
(@OGUID+148, 1623, 1, 430.512, 1467.61, 41.3462, 0.750491, 0, 0, 0.366501, 0.930418, 300, 300, 1, 100, 0, 10),
(@OGUID+149, 1623, 1, 1055.79, 1644.41, 17.822, 4.39823, 0, 0, -0.809016, 0.587786, 300, 300, 1, 100, 0, 10),
(@OGUID+150, 1623, 1, 1171.33, 589.286, 164.457, 5.51524, 0, 0, -0.374606, 0.927184, 300, 300, 1, 100, 0, 10),
(@OGUID+151, 1623, 1, 1356.84, 1539.9, 152.084, 4.90438, 0, 0, -0.636078, 0.771625, 300, 300, 1, 100, 0, 10),
(@OGUID+152, 1623, 1, 1480.74, -635.58, 102.294, 5.53269, 0, 0, -0.366501, 0.930418, 300, 300, 1, 100, 0, 10),
(@OGUID+153, 1623, 1, 2180.62, 1486.93, 315.677, 3.87463, 0, 0, -0.93358, 0.358368, 300, 300, 1, 100, 0, 10),
(@OGUID+154, 1623, 1, 2449.11, 1076.53, 352.429, 3.52557, 0, 0, -0.981627, 0.190812, 300, 300, 1, 100, 0, 10),
(@OGUID+155, 1623, 1, 2738.14, 1455.01, 258.382, 2.79252, 0, 0, 0.984807, 0.173652, 300, 300, 1, 100, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1084, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelbloom in Badlands
(@OGUID+2, 1084, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelbloom in Badlands
(@OGUID+3, 1084, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelbloom in Badlands
(@OGUID+4, 1084, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelbloom in Badlands
(@OGUID+5, 1084, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelbloom in Badlands
(@OGUID+6, 1084, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelbloom in Badlands
(@OGUID+7, 1084, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelbloom in Badlands
(@OGUID+8, 1084, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelbloom in Badlands
(@OGUID+9, 1084, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelbloom in Badlands
(@OGUID+10, 1084, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelbloom in Badlands
(@OGUID+11, 1084, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelbloom in Badlands
(@OGUID+12, 1114, 0, 'Wild Steelbloom', 0, 10), -- Wildsteel Blooms in Duskwood 10 objects total
(@OGUID+13, 1114, 0, 'Wild Steelbloom', 0, 10), -- Wildsteel Blooms in Duskwood 10 objects total
(@OGUID+14, 1114, 0, 'Wild Steelbloom', 0, 10), -- Wildsteel Blooms in Duskwood 10 objects total
(@OGUID+15, 1114, 0, 'Wild Steelbloom', 0, 10), -- Wildsteel Blooms in Duskwood 10 objects total
(@OGUID+16, 1114, 0, 'Wild Steelbloom', 0, 10), -- Wildsteel Blooms in Duskwood 10 objects total
(@OGUID+17, 1114, 0, 'Wild Steelbloom', 0, 10), -- Wildsteel Blooms in Duskwood 10 objects total
(@OGUID+18, 1114, 0, 'Wild Steelbloom', 0, 10), -- Wildsteel Blooms in Duskwood 10 objects total
(@OGUID+19, 1114, 0, 'Wild Steelbloom', 0, 10), -- Wildsteel Blooms in Duskwood 10 objects total
(@OGUID+20, 1152, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Wetlands 47 objects total
(@OGUID+21, 1152, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Wetlands 47 objects total
(@OGUID+22, 1152, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Wetlands 47 objects total
(@OGUID+23, 1152, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Wetlands 47 objects total
(@OGUID+24, 1152, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Wetlands 47 objects total
(@OGUID+25, 1152, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Wetlands 47 objects total
(@OGUID+26, 1152, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Wetlands 47 objects total
(@OGUID+27, 1152, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Wetlands 47 objects total
(@OGUID+28, 1152, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Wetlands 47 objects total
(@OGUID+29, 1152, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Wetlands 47 objects total
(@OGUID+30, 1168, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Barrens 29 objects total
(@OGUID+31, 1168, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Barrens 29 objects total
(@OGUID+32, 1168, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Barrens 29 objects total
(@OGUID+33, 1168, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Barrens 29 objects total
(@OGUID+34, 1168, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Barrens 29 objects total
(@OGUID+35, 1168, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Barrens 29 objects total
(@OGUID+36, 1169, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stranglethorn 41 objects total
(@OGUID+37, 1169, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stranglethorn 41 objects total
(@OGUID+38, 1169, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stranglethorn 41 objects total
(@OGUID+39, 1169, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stranglethorn 41 objects total
(@OGUID+40, 1169, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stranglethorn 41 objects total
(@OGUID+41, 1169, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stranglethorn 41 objects total
(@OGUID+42, 1169, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stranglethorn 41 objects total
(@OGUID+43, 1169, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stranglethorn 41 objects total
(@OGUID+44, 1169, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stranglethorn 41 objects total
(@OGUID+45, 1169, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stranglethorn 41 objects total
(@OGUID+46, 1169, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stranglethorn 41 objects total
(@OGUID+47, 1169, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stranglethorn 41 objects total
(@OGUID+48, 1169, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stranglethorn 41 objects total
(@OGUID+49, 1169, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stranglethorn 41 objects total
(@OGUID+50, 1169, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stranglethorn 41 objects total
(@OGUID+51, 1169, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stranglethorn 41 objects total
(@OGUID+52, 1169, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stranglethorn 41 objects total
(@OGUID+53, 1169, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stranglethorn 41 objects total
(@OGUID+54, 1169, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stranglethorn 41 objects total
(@OGUID+55, 1169, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stranglethorn 41 objects total
(@OGUID+56, 1169, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stranglethorn 41 objects total
(@OGUID+57, 1169, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stranglethorn 41 objects total
(@OGUID+58, 1169, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stranglethorn 41 objects total
(@OGUID+59, 1169, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stranglethorn 41 objects total
(@OGUID+60, 1169, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stranglethorn 41 objects total
(@OGUID+61, 1169, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stranglethorn 41 objects total
(@OGUID+62, 1169, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stranglethorn 41 objects total
(@OGUID+63, 1169, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stranglethorn 41 objects total
(@OGUID+64, 1169, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stranglethorn 41 objects total
(@OGUID+65, 1169, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stranglethorn 41 objects total
(@OGUID+66, 1169, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stranglethorn 41 objects total
(@OGUID+67, 1169, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stranglethorn 41 objects total
(@OGUID+68, 1061, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Alterac 16 objects total
(@OGUID+69, 1185, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Arathi 127 objects total
(@OGUID+70, 1185, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Arathi 127 objects total
(@OGUID+71, 1185, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Arathi 127 objects total
(@OGUID+72, 1185, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Arathi 127 objects total
(@OGUID+73, 1185, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Arathi 127 objects total
(@OGUID+74, 1185, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Arathi 127 objects total
(@OGUID+75, 1185, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Arathi 127 objects total
(@OGUID+76, 1185, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Arathi 127 objects total
(@OGUID+77, 1185, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Arathi 127 objects total
(@OGUID+78, 1185, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Arathi 127 objects total
(@OGUID+79, 1185, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Arathi 127 objects total
(@OGUID+80, 1185, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Arathi 127 objects total
(@OGUID+81, 1185, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Arathi 127 objects total
(@OGUID+82, 1185, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Arathi 127 objects total
(@OGUID+83, 1185, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Arathi 127 objects total
(@OGUID+84, 1185, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Arathi 127 objects total
(@OGUID+85, 1209, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelbloom in Hillsbrad Foothills
(@OGUID+86, 1209, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelbloom in Hillsbrad Foothills
(@OGUID+87, 1209, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelbloom in Hillsbrad Foothills
(@OGUID+88, 1209, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelbloom in Hillsbrad Foothills
(@OGUID+89, 1209, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelbloom in Hillsbrad Foothills
(@OGUID+90, 1209, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelbloom in Hillsbrad Foothills
(@OGUID+91, 1209, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelbloom in Hillsbrad Foothills
(@OGUID+92, 1209, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Hillsbrad  objects total
(@OGUID+93, 1209, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelbloom in Hillsbrad Foothills
(@OGUID+94, 1209, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelbloom in Hillsbrad Foothills
(@OGUID+95, 1209, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelbloom in Hillsbrad Foothills
(@OGUID+96, 1209, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelbloom in Hillsbrad Foothills
(@OGUID+97, 1209, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Hillsbrad  objects total
(@OGUID+98, 1209, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelbloom in Hillsbrad Foothills
(@OGUID+99, 1209, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelbloom in Hillsbrad Foothills
(@OGUID+100, 1209, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelbloom in Hillsbrad Foothills
(@OGUID+101, 1209, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelbloom in Hillsbrad Foothills
(@OGUID+102, 1209, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelbloom in Hillsbrad Foothills
(@OGUID+103, 1209, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelbloom in Hillsbrad Foothills
(@OGUID+104, 1209, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelbloom in Hillsbrad Foothills
(@OGUID+105, 1081, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Ashenvale 57 objects total
(@OGUID+106, 1081, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Ashenvale 57 objects total
(@OGUID+107, 1081, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Ashenvale 57 objects total
(@OGUID+108, 1081, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Ashenvale 57 objects total
(@OGUID+109, 1081, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Ashenvale 57 objects total
(@OGUID+110, 1081, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Ashenvale 57 objects total
(@OGUID+111, 1134, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Thousand Needles 42 objects total
(@OGUID+112, 1134, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Thousand Needles 42 objects total
(@OGUID+113, 1134, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Thousand Needles 42 objects total
(@OGUID+114, 1134, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Thousand Needles 42 objects total
(@OGUID+115, 1134, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Thousand Needles 42 objects total
(@OGUID+116, 1134, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Thousand Needles 42 objects total
(@OGUID+117, 1134, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Thousand Needles 42 objects total
(@OGUID+118, 1134, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Thousand Needles 42 objects total
(@OGUID+119, 1134, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Thousand Needles 42 objects total
(@OGUID+120, 1134, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Thousand Needles 42 objects total
(@OGUID+121, 1134, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Thousand Needles 42 objects total
(@OGUID+122, 1134, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Thousand Needles 42 objects total
(@OGUID+123, 1134, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Thousand Needles 42 objects total
(@OGUID+124, 1134, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Thousand Needles 42 objects total
(@OGUID+125, 1134, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Thousand Needles 42 objects total
(@OGUID+126, 1134, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Thousand Needles 42 objects total
(@OGUID+127, 1142, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Desolace 10 objects total
(@OGUID+128, 1085, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stonetalon 92 objects total
(@OGUID+129, 1085, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stonetalon 92 objects total
(@OGUID+130, 1085, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stonetalon 92 objects total
(@OGUID+131, 1085, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stonetalon 92 objects total
(@OGUID+132, 1085, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stonetalon 92 objects total
(@OGUID+133, 1085, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stonetalon 92 objects total
(@OGUID+134, 1085, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stonetalon 92 objects total
(@OGUID+135, 1085, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stonetalon 92 objects total
(@OGUID+136, 1085, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stonetalon 92 objects total
(@OGUID+137, 1085, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stonetalon 92 objects total
(@OGUID+138, 1085, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stonetalon 92 objects total
(@OGUID+139, 1085, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stonetalon 92 objects total
(@OGUID+140, 1085, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stonetalon 92 objects total
(@OGUID+141, 1085, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stonetalon 92 objects total
(@OGUID+142, 1085, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stonetalon 92 objects total
(@OGUID+143, 1085, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stonetalon 92 objects total
(@OGUID+144, 1085, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stonetalon 92 objects total
(@OGUID+145, 1085, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stonetalon 92 objects total
(@OGUID+146, 1085, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stonetalon 92 objects total
(@OGUID+147, 1085, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stonetalon 92 objects total
(@OGUID+148, 1085, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stonetalon 92 objects total
(@OGUID+149, 1085, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stonetalon 92 objects total
(@OGUID+150, 1085, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stonetalon 92 objects total
(@OGUID+151, 1085, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stonetalon 92 objects total
(@OGUID+152, 1085, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stonetalon 92 objects total
(@OGUID+153, 1085, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stonetalon 92 objects total
(@OGUID+154, 1085, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelblooms in Stonetalon 92 objects total
(@OGUID+155, 1085, 0, 'Wild Steelbloom', 0, 10); -- Wild Steelblooms in Stonetalon 92 objects total

-- Correct Pools
UPDATE `pool_template` SET `description`='Wild Steelbloom in Alterac Mountains' WHERE  `entry`=1061;
UPDATE `pool_template` SET `description`='Wild Steelbloom in Arathi Highlands' WHERE  `entry`=1185;
UPDATE `pool_template` SET `description`='Wild Steelbloom in Ashenvale' WHERE  `entry`=1081;
UPDATE `pool_template` SET `description`='Wild Steelbloom in Barrens' WHERE  `entry`=1168;
UPDATE `pool_template` SET `description`='Wild Steelbloom in Desolace' WHERE  `entry`=1142;
UPDATE `pool_template` SET `description`='Wild Steelbloom in Stonetalon' WHERE  `entry`=1085;
UPDATE `pool_template` SET `description`='Wild Steelbloom in Stranglethorn' WHERE  `entry`=1169;
UPDATE `pool_template` SET `description`='Wild Steelbloom in Thousand Needles' WHERE  `entry`=1134;
UPDATE `pool_template` SET `description`='Wild Steelbloom in Wetlands' WHERE  `entry`=1152;
UPDATE `pool_template` SET `description`='Wild Steelbloom in Duskwood' WHERE  `entry`=1114;

-- Remove Custom Spawns (Non of these spawns exist in the sniff-db)
DELETE FROM `gameobject` WHERE `guid` IN (4178, 4202, 4199, 4006, 3891, 4274, 3952, 4033, 4273, 4084, 4193, 4139, 3970, 3996, 3887, 3888, 3889, 3892, 3893, 3894, 3895, 3896, 3897, 3900, 3901, 3902, 3903, 3905, 3906, 3907, 3908, 3910, 3911, 3912, 3914, 3916, 3917, 3918, 3919, 3922, 3923, 3926, 3927, 3928, 3929, 3930, 3931, 3932, 3933, 3934, 3935, 3936, 3937, 3939, 3940, 3941, 3942, 3944, 3945, 3947, 3950, 3951, 3954, 3955, 3956, 3957, 3958, 3959, 3960, 3961, 3962, 3966, 3967, 3968, 3969, 3972, 3973, 3974, 3975, 3976, 3977, 3978, 3980, 3981, 3983, 3984, 3985, 3986, 3987, 3988, 3989, 3992, 3993, 3994, 3997, 3998, 3999, 4001, 4002, 4003, 4004, 4005, 4010, 4011, 4012, 4013, 4014, 4015, 4016, 4017, 4018, 4019, 4020, 4022, 4023, 4024, 4025, 4026, 4028, 4031, 4034, 4035, 4037, 4039, 4040, 4041, 4042, 4044, 4045, 4047, 4049, 4050, 4051, 4052, 4053, 4054, 4056, 4057, 4058, 4060, 4063, 4064, 4065, 4066, 4068, 4069, 4070, 4071, 4072, 4073, 4074, 4075, 4076, 4077, 4078, 4080, 4081, 4082, 4083, 4085, 4087, 4088, 4089, 4090, 4091, 4092, 4093, 4094, 4095, 4097, 4098, 4099, 4100, 4101, 4102, 4104, 4106, 4107, 4109, 4110, 4111, 4113, 4115, 4116, 4117, 4118, 4119, 4120, 4121, 4122, 4123, 4124, 4125, 4126, 4127, 4129, 4131, 4132, 4133, 4135, 4137, 4138, 4141, 4144, 4145, 4147, 4148, 4149, 4150, 4151, 4152, 4153, 4154, 4155, 4156, 4157, 4158, 4159, 4160, 4161, 4162, 4163, 4164, 4165, 4166, 4167, 4168, 4169, 4170, 4171, 4172, 4174, 4175, 4176, 4177, 4179, 4180, 4182, 4184, 4185, 4186, 4187, 4188, 4191, 4192, 4194, 4195, 4201, 4203, 4204, 4206, 4208, 4211, 4212, 4213, 4214, 4215, 4216, 4221, 4226, 4227, 4229, 4230, 4231, 4232, 4234, 4235, 4240, 4241, 4242, 4243, 4244, 4245, 4247, 4248, 4249, 4250, 4251, 4254, 4255, 4256, 4257, 4259, 4260, 4261, 4263, 4264, 4265, 4267, 4268, 4270, 4271, 4275);
DELETE FROM `pool_gameobject` WHERE `guid` IN (4178, 4202, 4199, 4006, 3891, 4274, 3952, 4033, 4273, 4084, 4193, 4139, 3970, 3996, 3887, 3888, 3889, 3892, 3893, 3894, 3895, 3896, 3897, 3900, 3901, 3902, 3903, 3905, 3906, 3907, 3908, 3910, 3911, 3912, 3914, 3916, 3917, 3918, 3919, 3922, 3923, 3926, 3927, 3928, 3929, 3930, 3931, 3932, 3933, 3934, 3935, 3936, 3937, 3939, 3940, 3941, 3942, 3944, 3945, 3947, 3950, 3951, 3954, 3955, 3956, 3957, 3958, 3959, 3960, 3961, 3962, 3966, 3967, 3968, 3969, 3972, 3973, 3974, 3975, 3976, 3977, 3978, 3980, 3981, 3983, 3984, 3985, 3986, 3987, 3988, 3989, 3992, 3993, 3994, 3997, 3998, 3999, 4001, 4002, 4003, 4004, 4005, 4010, 4011, 4012, 4013, 4014, 4015, 4016, 4017, 4018, 4019, 4020, 4022, 4023, 4024, 4025, 4026, 4028, 4031, 4034, 4035, 4037, 4039, 4040, 4041, 4042, 4044, 4045, 4047, 4049, 4050, 4051, 4052, 4053, 4054, 4056, 4057, 4058, 4060, 4063, 4064, 4065, 4066, 4068, 4069, 4070, 4071, 4072, 4073, 4074, 4075, 4076, 4077, 4078, 4080, 4081, 4082, 4083, 4085, 4087, 4088, 4089, 4090, 4091, 4092, 4093, 4094, 4095, 4097, 4098, 4099, 4100, 4101, 4102, 4104, 4106, 4107, 4109, 4110, 4111, 4113, 4115, 4116, 4117, 4118, 4119, 4120, 4121, 4122, 4123, 4124, 4125, 4126, 4127, 4129, 4131, 4132, 4133, 4135, 4137, 4138, 4141, 4144, 4145, 4147, 4148, 4149, 4150, 4151, 4152, 4153, 4154, 4155, 4156, 4157, 4158, 4159, 4160, 4161, 4162, 4163, 4164, 4165, 4166, 4167, 4168, 4169, 4170, 4171, 4172, 4174, 4175, 4176, 4177, 4179, 4180, 4182, 4184, 4185, 4186, 4187, 4188, 4191, 4192, 4194, 4195, 4201, 4203, 4204, 4206, 4208, 4211, 4212, 4213, 4214, 4215, 4216, 4221, 4226, 4227, 4229, 4230, 4231, 4232, 4234, 4235, 4240, 4241, 4242, 4243, 4244, 4245, 4247, 4248, 4249, 4250, 4251, 4254, 4255, 4256, 4257, 4259, 4260, 4261, 4263, 4264, 4265, 4267, 4268, 4270, 4271, 4275);

-- Sync Gobject Data
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300, `spawn_flags` = 0, `animprogress` = 100 WHERE `id` IN (1623);

-- Update Counters
UPDATE `pool_template` SET `max_limit`=6 WHERE  `entry`=1114;
UPDATE `pool_template` SET `max_limit`=10 WHERE  `entry`=1152;
UPDATE `pool_template` SET `max_limit`=27 WHERE  `entry`=1169;
UPDATE `pool_template` SET `max_limit`=15 WHERE  `entry`=1185;
UPDATE `pool_template` SET `max_limit`=1 WHERE  `entry`=1061;
UPDATE `pool_template` SET `max_limit`=7 WHERE  `entry`=1168;
UPDATE `pool_template` SET `max_limit`=3 WHERE  `entry`=1081;
UPDATE `pool_template` SET `max_limit`=21 WHERE  `entry`=1085;
UPDATE `pool_template` SET `max_limit`=5 WHERE  `entry`=1084;
UPDATE `pool_template` SET `max_limit`=8 WHERE  `entry`=1209;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
