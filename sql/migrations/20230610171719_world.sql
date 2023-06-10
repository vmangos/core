DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230610171719');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230610171719');
-- Add your query below.


-- Golden Sansam (176583, 176638)
SET @OGUID = 30379;

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
(@OGUID+1, 176583, 1, 3628.94, -5387.71, 115.502, 4.79966, 0, 0, -0.67559, 0.737278, 300, 300, 1, 100, 0, 10), 
(@OGUID+2, 176583, 1, 4117.76, -5711.8, 127.303, 5.72468, 0, 0, -0.275637, 0.961262, 300, 300, 1, 100, 0, 10), 
(@OGUID+3, 176583, 1, 4705.46, -6650.12, 119.948, 0.0174525, 0, 0, 0.00872612, 0.999962, 300, 300, 1, 100, 0, 10), 
(@OGUID+4, 176583, 1, 4533.43, -6772.33, 129.034, 1.69297, 0, 0, 0.748956, 0.66262, 300, 300, 1, 100, 0, 10), 
(@OGUID+5, 176583, 1, 3934.18, -4993.8, 137.714, 2.68781, 0, 0, 0.97437, 0.224951, 300, 300, 1, 100, 0, 10), 
(@OGUID+6, 176583, 1, 3525.45, -4839.55, 123.035, 2.16421, 0, 0, 0.882947, 0.469473, 300, 300, 1, 100, 0, 10), 
(@OGUID+7, 176583, 1, 3817.59, -5242.69, 99.2626, 2.87979, 0, 0, 0.991445, 0.130528, 300, 300, 1, 100, 0, 10), 
(@OGUID+8, 176583, 1, 2737.93, -5414.55, 111.196, 2.9496, 0, 0, 0.995396, 0.0958512, 300, 300, 1, 100, 0, 10), 
(@OGUID+9, 176583, 1, 3710.2, -5181.4, 86.6548, 3.90954, 0, 0, -0.927183, 0.374608, 300, 300, 1, 100, 0, 10), 
(@OGUID+10, 176583, 1, 4512.31, -5480, 107.13, 0.663223, 0, 0, 0.325567, 0.945519, 300, 300, 1, 100, 0, 10), 
(@OGUID+11, 176583, 1, 3423.77, -4651.64, 102.226, 4.55531, 0, 0, -0.760406, 0.649449, 300, 300, 1, 100, 0, 10), 
(@OGUID+12, 176583, 1, 3426.97, -5096.9, 84.1595, 5.61996, 0, 0, -0.325567, 0.945519, 300, 300, 1, 100, 0, 10), 
(@OGUID+13, 176583, 1, 3156.39, -5501.31, 97.2671, 6.07375, 0, 0, -0.104528, 0.994522, 300, 300, 1, 100, 0, 10), 
(@OGUID+14, 176583, 1, 3466.07, -5246.82, 86.1165, 6.05629, 0, 0, -0.113203, 0.993572, 300, 300, 1, 100, 0, 10), 
(@OGUID+15, 176583, 1, 2869.25, -5320.77, 129.494, 2.53072, 0, 0, 0.953716, 0.300708, 300, 300, 1, 100, 0, 10),
(@OGUID+16, 176583, 1, 3738.77, -4930.92, 133.989, 3.59538, 0, 0, -0.97437, 0.224951, 300, 300, 1, 100, 0, 10),
(@OGUID+17, 176583, 1, 3744.09, -4797.82, 136.26, 1.67551, 0, 0, 0.743144, 0.669131, 300, 300, 1, 100, 0, 10),
(@OGUID+18, 176583, 1, 4153.91, -5536.97, 106.273, 5.61996, 0, 0, -0.325567, 0.945519, 300, 300, 1, 100, 0, 10),
(@OGUID+19, 176583, 1, 4258.53, -5579.05, 125.992, 2.3911, 0, 0, 0.930417, 0.366502, 300, 300, 1, 100, 0, 10),
(@OGUID+20, 176583, 1, 4341.18, -6008.75, 98.7778, 5.13127, 0, 0, -0.544639, 0.838671, 300, 300, 1, 100, 0, 10),
(@OGUID+21, 176583, 1, 4398.88, -6853.65, 105.1, 1.62316, 0, 0, 0.725374, 0.688355, 300, 300, 1, 100, 0, 10),
(@OGUID+22, 176583, 1, 4475.62, -6141.82, 95.8131, 3.6652, 0, 0, -0.965925, 0.258821, 300, 300, 1, 100, 0, 10),
(@OGUID+23, 176583, 1, 4672.03, -5910.41, 110.269, 1.71042, 0, 0, 0.754709, 0.656059, 300, 300, 1, 100, 0, 10),
(@OGUID+24, 176583, 1, 4736.53, -7139.11, 85.9018, 2.40855, 0, 0, 0.93358, 0.358368, 300, 300, 1, 100, 0, 10);

-- Missing Golden Sansam spawns in Burning Steppes.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+25, 176583, 0, -7755.03, -1475.44, 134.3, 2.54818, 0, 0, 0.956305, 0.292372, 300, 300, 1, 100, 0, 10), 
(@OGUID+26, 176583, 0, -7563.25, -2762.65, 135.48, 1.36136, 0, 0, 0.62932, 0.777146, 300, 300, 1, 100, 0, 10), 
(@OGUID+27, 176583, 0, -7924.49, -2656.46, 220.236, 2.44346, 0, 0, 0.939692, 0.34202, 300, 300, 1, 100, 0, 10), 
(@OGUID+28, 176583, 0, -8426.43, -2806.45, 194.798, 4.15388, 0, 0, -0.874619, 0.48481, 300, 300, 1, 100, 0, 10),
(@OGUID+29, 176583, 0, -8181.55, -1587.78, 133.52, 2.00713, 0, 0, 0.843391, 0.5373, 300, 300, 1, 100, 0, 10),
(@OGUID+30, 176583, 0, -8104.26, -1913.78, 134.308, 6.26573, 0, 0, -0.00872612, 0.999962, 300, 300, 1, 100, 0, 10),
(@OGUID+31, 176583, 0, -7940.65, -1142.41, 172.842, 5.60251, 0, 0, -0.333807, 0.942641, 300, 300, 1, 100, 0, 10);

-- Missing Golden Sansam spawns in The Hinterlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+32, 176583, 0, 51.3171, -3625.82, 122.411, 5.34071, 0, 0, -0.45399, 0.891007, 300, 300, 1, 100, 0, 10), 
(@OGUID+33, 176583, 0, 605.156, -4074.16, 113.456, 1.6057, 0, 0, 0.719339, 0.694659, 300, 300, 1, 100, 0, 10), 
(@OGUID+34, 176583, 0, 970.431, -4124.26, 112.937, 2.53072, 0, 0, 0.953716, 0.300708, 300, 300, 1, 100, 0, 10), 
(@OGUID+35, 176583, 0, -75.4167, -4253.4, 120.531, 6.17847, 0, 0, -0.0523357, 0.99863, 300, 300, 1, 100, 0, 10), 
(@OGUID+36, 176583, 0, 336.581, -4032.55, 118.385, 4.71239, 0, 0, -0.707107, 0.707107, 300, 300, 1, 100, 0, 10), 
(@OGUID+37, 176583, 0, 789.577, -4213.53, 112.392, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 1, 100, 0, 10), 
(@OGUID+38, 176583, 0, 434.739, -3537.61, 120.946, 1.78023, 0, 0, 0.777145, 0.629321, 300, 300, 1, 100, 0, 10), 
(@OGUID+39, 176583, 0, -31.2875, -2533.09, 119.018, 5.63741, 0, 0, -0.317305, 0.948324, 300, 300, 1, 100, 0, 10);

-- Missing Golden Sansam spawns in Eastern Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+40, 176583, 0, 1395.66, -3689.79, 75.5379, 4.11898, 0, 0, -0.882947, 0.469473, 300, 300, 1, 100, 0, 10), 
(@OGUID+41, 176583, 0, 1823.56, -3750.1, 158.251, 3.45576, 0, 0, -0.987688, 0.156436, 300, 300, 1, 100, 0, 10), 
(@OGUID+42, 176583, 0, 2957.66, -2888.89, 101.571, 0.0174525, 0, 0, 0.00872612, 0.999962, 300, 300, 1, 100, 0, 10), 
(@OGUID+43, 176583, 0, 3010.27, -4983.56, 107.515, 3.17653, 0, 0, -0.999847, 0.0174693, 300, 300, 1, 100, 0, 10), 
(@OGUID+44, 176583, 0, 2933.23, -4004.29, 104.741, 1.22173, 0, 0, 0.573576, 0.819152, 300, 300, 1, 100, 0, 10), 
(@OGUID+45, 176583, 0, 2003.8, -4580.15, 74.8585, 1.95477, 0, 0, 0.829038, 0.559193, 300, 300, 1, 100, 0, 10),
(@OGUID+46, 176583, 0, 2460.7, -5189.65, 74.8806, 5.51524, 0, 0, -0.374606, 0.927184, 300, 300, 1, 100, 0, 10);

-- Missing Golden Sansam spawns in Feralas.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+47, 176583, 1, -3440.09, 1926.25, 41.6386, 6.23083, 0, 0, -0.0261765, 0.999657, 300, 300, 1, 100, 0, 10), 
(@OGUID+48, 176583, 1, -4951.82, 1747.18, 65.6505, 5.98648, 0, 0, -0.147809, 0.989016, 300, 300, 1, 100, 0, 10), 
(@OGUID+49, 176583, 1, -4491.8, -568.489, 4.83053, 1.02974, 0, 0, 0.492423, 0.870356, 300, 300, 1, 100, 0, 10), 
(@OGUID+50, 176583, 1, -3876.53, 1975.75, 72.5063, 4.18879, 0, 0, -0.866025, 0.500001, 300, 300, 1, 100, 0, 10);

-- Missing Golden Sansam spawns in Un'Goro Crater.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+51, 176583, 1, -7746.09, -1525.73, -271.335, 3.85718, 0, 0, -0.936671, 0.35021, 300, 300, 1, 100, 0, 10), 
(@OGUID+52, 176583, 1, -7313.65, -2213.45, -271.057, 1.41372, 0, 0, 0.649447, 0.760406, 300, 300, 1, 100, 0, 10), 
(@OGUID+53, 176583, 1, -7821.75, -1319.65, -271.669, 0.820303, 0, 0, 0.398748, 0.91706, 300, 300, 1, 100, 0, 10), 
(@OGUID+54, 176583, 1, -7158.49, -408.365, -269.859, 3.07177, 0, 0, 0.999391, 0.0349061, 300, 300, 1, 100, 0, 10), 
(@OGUID+55, 176583, 1, -6374.37, -1508.72, -269.773, 5.79449, 0, 0, -0.241921, 0.970296, 300, 300, 1, 100, 0, 10), 
(@OGUID+56, 176583, 1, -6475.13, -1707.52, -275.624, 0.226892, 0, 0, 0.113203, 0.993572, 300, 300, 1, 100, 0, 10), 
(@OGUID+57, 176583, 1, -6743.61, -1848, -272.222, 4.39823, 0, 0, -0.809016, 0.587786, 300, 300, 1, 100, 0, 10), 
(@OGUID+58, 176583, 1, -7850.64, -1845.23, -273.153, 1.0472, 0, 0, 0.5, 0.866025, 300, 300, 1, 100, 0, 10), 
(@OGUID+59, 176583, 1, -6564.64, -701.637, -268.937, 5.8294, 0, 0, -0.224951, 0.97437, 300, 300, 1, 100, 0, 10), 
(@OGUID+60, 176583, 1, -7650.79, -1287.46, -269.252, 4.57276, 0, 0, -0.754709, 0.656059, 300, 300, 1, 100, 0, 10), 
(@OGUID+61, 176583, 1, -8236.15, -1083.52, -204.848, 5.35816, 0, 0, -0.446198, 0.894935, 300, 300, 1, 100, 0, 10),
(@OGUID+62, 176583, 1, -8014.74, -1518.74, -269.584, 4.95674, 0, 0, -0.615661, 0.788011, 300, 300, 1, 100, 0, 10),
(@OGUID+63, 176583, 1, -7749.09, -617.513, -268.614, 1.13446, 0, 0, 0.537299, 0.843392, 300, 300, 1, 100, 0, 10),
(@OGUID+64, 176583, 1, -7709.43, -816.753, -269.67, 5.98648, 0, 0, -0.147809, 0.989016, 300, 300, 1, 100, 0, 10),
(@OGUID+65, 176583, 1, -7381.45, -612.923, -270.7, 1.22173, 0, 0, 0.573576, 0.819152, 300, 300, 1, 100, 0, 10),
(@OGUID+66, 176583, 1, -7342.38, -892.753, -271.443, 5.60251, 0, 0, -0.333807, 0.942641, 300, 300, 1, 100, 0, 10),
(@OGUID+67, 176583, 1, -7234.43, -1684.81, -270.78, 5.34071, 0, 0, -0.45399, 0.891007, 300, 300, 1, 100, 0, 10),
(@OGUID+68, 176583, 1, -7207.93, -1824.62, -274.809, 1.67551, 0, 0, 0.743144, 0.669131, 300, 300, 1, 100, 0, 10),
(@OGUID+69, 176583, 1, -7001.82, -670.431, -272.165, 2.86234, 0, 0, 0.990268, 0.139175, 300, 300, 1, 100, 0, 10),
(@OGUID+70, 176583, 1, -6924.01, -1676.07, -272.419, 2.87979, 0, 0, 0.991445, 0.130528, 300, 300, 1, 100, 0, 10),
(@OGUID+71, 176583, 1, -6844.17, -795.444, -271.073, 1.67551, 0, 0, 0.743144, 0.669131, 300, 300, 1, 100, 0, 10),
(@OGUID+72, 176583, 1, -6699.56, -2050.99, -271.633, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 1, 100, 0, 10),
(@OGUID+73, 176583, 1, -6394.96, -1529.24, -269.078, 6.03884, 0, 0, -0.121869, 0.992546, 300, 300, 1, 100, 0, 10),
(@OGUID+74, 176583, 1, -6216.37, -1561.47, -218.796, 2.3911, 0, 0, 0.930417, 0.366502, 300, 300, 1, 100, 0, 10);

-- Missing Golden Sansam spawns in Silithus.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+75, 176583, 1, -6663, 838.734, 3.7485, 2.70526, 0, 0, 0.976295, 0.216442, 300, 300, 1, 100, 0, 10), 
(@OGUID+76, 176583, 1, -7965.79, 1595, -0.923715, 4.62512, 0, 0, -0.737277, 0.675591, 300, 300, 1, 100, 0, 10), 
(@OGUID+77, 176583, 1, -7958.95, 870.595, 2.91314, 1.58825, 0, 0, 0.71325, 0.70091, 300, 300, 1, 100, 0, 10),
(@OGUID+78, 176583, 1, -7829.49, 1807.95, 3.085, 4.10153, 0, 0, -0.887011, 0.461749, 300, 300, 1, 100, 0, 10),
(@OGUID+79, 176583, 1, -7493.65, 901.767, 3.50373, 3.05433, 0, 0, 0.999048, 0.0436193, 300, 300, 1, 100, 0, 10),
(@OGUID+80, 176583, 1, -7090.5, 1250.5, 4.69263, 0, 0, 0, 0, 1, 300, 300, 1, 100, 0, 10),
(@OGUID+81, 176583, 1, -6891.56, 1183.88, 3.19818, 3.94445, 0, 0, -0.920505, 0.390732, 300, 300, 1, 100, 0, 10),
(@OGUID+82, 176583, 1, -6722.45, 931.875, 2.72163, 0.349065, 0, 0, 0.173648, 0.984808, 300, 300, 1, 100, 0, 10);

-- Missing Golden Sansam spawns in Felwood.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+83, 176638, 1, 6144.64, -1849.78, 568.804, 1.85005, 0, 0, 0.798635, 0.601815, 1800, 1800, 1, 100, 0, 10),
(@OGUID+84, 176638, 1, 6349.53, -1616.99, 459.913, 2.47837, 0, 0, 0.945518, 0.325568, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+85, 176638, 1, 6642.61, -1309.63, 458.125, 2.93214, 0, 0, 0.994521, 0.104536, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+86, 176638, 1, 6216.36, -1397.76, 375.794, 4.18879, 0, 0, -0.866025, 0.500001, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+87, 176638, 1, 4290.64, -604.054, 289.481, 2.33874, 0, 0, 0.920505, 0.390732, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+88, 176638, 1, 6742.92, -1596.08, 477.572, 4.11898, 0, 0, -0.882947, 0.469473, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+89, 176638, 1, 5554.45, -987.39, 371.665, 5.35816, 0, 0, -0.446198, 0.894935, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+90, 176638, 1, 6446.44, -1203.86, 395.012, 4.38078, 0, 0, -0.814116, 0.580703, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+91, 176638, 1, 4350.72, -951.657, 307.27, 3.90954, 0, 0, -0.927183, 0.374608, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+92, 176638, 1, 3810.86, -1607.13, 220.173, 2.46091, 0, 0, 0.942641, 0.333808, 300, 300, 1, 100, 0, 10),
(@OGUID+93, 176638, 1, 4045.64, -809.268, 275.562, 2.09439, 0, 0, 0.866025, 0.500001, 300, 300, 1, 100, 0, 10),
(@OGUID+94, 176638, 1, 4090.04, -1119.42, 277.589, 2.60054, 0, 0, 0.96363, 0.267241, 300, 300, 1, 100, 0, 10),
(@OGUID+95, 176638, 1, 4909.64, -586.56, 314.779, 4.41568, 0, 0, -0.803857, 0.594823, 300, 300, 1, 100, 0, 10),
(@OGUID+96, 176638, 1, 6233.26, -1057.02, 380.173, 6.19592, 0, 0, -0.0436192, 0.999048, 300, 300, 1, 100, 0, 10),
(@OGUID+97, 176638, 1, 6383.56, -1928.92, 551.95, 4.7473, 0, 0, -0.694658, 0.71934, 300, 300, 1, 100, 0, 10),
(@OGUID+98, 176638, 1, 6384.93, -731.851, 472.948, 1.01229, 0, 0, 0.484809, 0.87462, 300, 300, 1, 100, 0, 10),
(@OGUID+99, 176638, 1, 6882.78, -2028.31, 578.535, 0.0349062, 0, 0, 0.0174522, 0.999848, 300, 300, 1, 100, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1241, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Azshara 87 objects total
(@OGUID+2, 1241, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Azshara 87 objects total
(@OGUID+3, 1241, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Azshara 87 objects total
(@OGUID+4, 1241, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Azshara 87 objects total
(@OGUID+5, 1241, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Azshara 87 objects total
(@OGUID+6, 1241, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Azshara 87 objects total
(@OGUID+7, 1241, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Azshara 87 objects total
(@OGUID+8, 1241, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Azshara 87 objects total
(@OGUID+9, 1241, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Azshara 87 objects total
(@OGUID+10, 1241, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Azshara 87 objects total
(@OGUID+11, 1241, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Azshara 87 objects total
(@OGUID+12, 1241, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Azshara 87 objects total
(@OGUID+13, 1241, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Azshara 87 objects total
(@OGUID+14, 1241, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Azshara 87 objects total
(@OGUID+15, 1241, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Azshara 87 objects total
(@OGUID+16, 1241, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Azshara 87 objects total
(@OGUID+17, 1241, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Azshara 87 objects total
(@OGUID+18, 1241, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Azshara 87 objects total
(@OGUID+19, 1241, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Azshara 87 objects total
(@OGUID+20, 1241, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Azshara 87 objects total
(@OGUID+21, 1241, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Azshara 87 objects total
(@OGUID+22, 1241, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Azshara 87 objects total
(@OGUID+23, 1241, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Azshara 87 objects total
(@OGUID+24, 1241, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Azshara 87 objects total
(@OGUID+25, 1300, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Burning Steppes 32 objects total
(@OGUID+26, 1300, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Burning Steppes 32 objects total
(@OGUID+27, 1300, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Burning Steppes 32 objects total
(@OGUID+28, 1300, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Burning Steppes 32 objects total
(@OGUID+29, 1300, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Burning Steppes 32 objects total
(@OGUID+30, 1300, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Burning Steppes 32 objects total
(@OGUID+31, 1300, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Burning Steppes 32 objects total
(@OGUID+32, 1253, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Hinterlands 25 objects total
(@OGUID+33, 1253, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Hinterlands 25 objects total
(@OGUID+34, 1253, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Hinterlands 25 objects total
(@OGUID+35, 1253, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Hinterlands 25 objects total
(@OGUID+36, 1253, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Hinterlands 25 objects total
(@OGUID+37, 1253, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Hinterlands 25 objects total
(@OGUID+38, 1253, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Hinterlands 25 objects total
(@OGUID+39, 1253, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Hinterlands 25 objects total
(@OGUID+40, 1268, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Eastern Plaguelands 45 objects total
(@OGUID+41, 1268, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Eastern Plaguelands 45 objects total
(@OGUID+42, 1268, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Eastern Plaguelands 45 objects total
(@OGUID+43, 1268, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Eastern Plaguelands 45 objects total
(@OGUID+44, 1268, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Eastern Plaguelands 45 objects total
(@OGUID+45, 1268, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Eastern Plaguelands 45 objects total
(@OGUID+46, 1268, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Eastern Plaguelands 45 objects total
(@OGUID+47, 1194, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Feralas 17 objects total
(@OGUID+48, 1194, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Feralas 17 objects total
(@OGUID+49, 1194, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Feralas 17 objects total
(@OGUID+50, 1194, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Feralas 17 objects total
(@OGUID+51, 1214, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Ungoro 94 objects total
(@OGUID+52, 1214, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Ungoro 94 objects total
(@OGUID+53, 1214, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Ungoro 94 objects total
(@OGUID+54, 1214, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Ungoro 94 objects total
(@OGUID+55, 1214, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Ungoro 94 objects total
(@OGUID+56, 1214, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Ungoro 94 objects total
(@OGUID+57, 1214, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Ungoro 94 objects total
(@OGUID+58, 1214, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Ungoro 94 objects total
(@OGUID+59, 1214, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Ungoro 94 objects total
(@OGUID+60, 1214, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Ungoro 94 objects total
(@OGUID+61, 1214, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Ungoro 94 objects total
(@OGUID+62, 1214, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Ungoro 94 objects total
(@OGUID+63, 1214, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Ungoro 94 objects total
(@OGUID+64, 1214, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Ungoro 94 objects total
(@OGUID+65, 1214, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Ungoro 94 objects total
(@OGUID+66, 1214, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Ungoro 94 objects total
(@OGUID+67, 1214, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Ungoro 94 objects total
(@OGUID+68, 1214, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Ungoro 94 objects total
(@OGUID+69, 1214, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Ungoro 94 objects total
(@OGUID+70, 1214, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Ungoro 94 objects total
(@OGUID+71, 1214, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Ungoro 94 objects total
(@OGUID+72, 1214, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Ungoro 94 objects total
(@OGUID+73, 1214, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Ungoro 94 objects total
(@OGUID+74, 1214, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Ungoro 94 objects total
(@OGUID+75, 1224, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Silithus 26 objects total
(@OGUID+76, 1224, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Silithus 26 objects total
(@OGUID+77, 1224, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Silithus 26 objects total
(@OGUID+78, 1224, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Silithus 26 objects total
(@OGUID+79, 1224, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Silithus 26 objects total
(@OGUID+80, 1224, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Silithus 26 objects total
(@OGUID+81, 1224, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Silithus 26 objects total
(@OGUID+82, 1224, 0, 'Golden Sansam', 0, 10), -- Golden Sansam in Silithus 26 objects total
(@OGUID+83, 1230, 0, 'Golden Sansam', 0, 10), -- Golden Sansams in Felwood
(@OGUID+84, 1230, 0, 'Golden Sansam', 0, 10), -- Golden Sansams in Felwood
(@OGUID+85, 1230, 0, 'Golden Sansam', 0, 10), -- Golden Sansams in Felwood
(@OGUID+86, 1230, 0, 'Golden Sansam', 0, 10), -- Golden Sansams in Felwood
(@OGUID+87, 1230, 0, 'Golden Sansam', 0, 10), -- Golden Sansams in Felwood
(@OGUID+88, 1230, 0, 'Golden Sansam', 0, 10), -- Golden Sansams in Felwood
(@OGUID+89, 1230, 0, 'Golden Sansam', 0, 10), -- Golden Sansams in Felwood
(@OGUID+90, 1230, 0, 'Golden Sansam', 0, 10), -- Golden Sansams in Felwood
(@OGUID+91, 1230, 0, 'Golden Sansam', 0, 10), -- Golden Sansams in Felwood
(@OGUID+92, 1230, 0, 'Golden Sansam', 0, 10), -- Golden Sansams in Felwood
(@OGUID+93, 1230, 0, 'Golden Sansam', 0, 10), -- Golden Sansams in Felwood
(@OGUID+94, 1230, 0, 'Golden Sansam', 0, 10), -- Golden Sansams in Felwood
(@OGUID+95, 1230, 0, 'Golden Sansam', 0, 10), -- Golden Sansams in Felwood
(@OGUID+96, 1230, 0, 'Golden Sansam', 0, 10), -- Golden Sansams in Felwood
(@OGUID+97, 1230, 0, 'Golden Sansam', 0, 10), -- Golden Sansams in Felwood
(@OGUID+98, 1230, 0, 'Golden Sansam', 0, 10), -- Golden Sansams in Felwood
(@OGUID+99, 1230, 0, 'Golden Sansam', 0, 10); -- Golden Sansams in Felwood

-- Correct Pools
UPDATE `pool_template` SET `description`='Golden Sansam in Azshara' WHERE  `entry`=1241;
UPDATE `pool_template` SET `description`='Golden Sansam in Burning Steppes' WHERE  `entry`=1300;
UPDATE `pool_template` SET `description`='Golden Sansam in Eastern Plaguelands' WHERE  `entry`=1268;
UPDATE `pool_template` SET `description`='Golden Sansam in Felwood' WHERE  `entry`=1230;
UPDATE `pool_template` SET `description`='Golden Sansam in Feralas' WHERE  `entry`=1194;
UPDATE `pool_template` SET `description`='Golden Sansam in Hinterlands' WHERE  `entry`=1253;
UPDATE `pool_template` SET `description`='Golden Sansam in Silithus' WHERE  `entry`=1224;
UPDATE `pool_template` SET `description`='Golden Sansam in Ungoro' WHERE  `entry`=1214;

-- Remove Custom Spawns (None of these spawns exist in the sniff-db)
DELETE FROM `gameobject` WHERE `guid` IN (19114, 19034, 19254, 19126, 19035, 19015, 19033, 19040, 19232, 18986, 19106, 18945, 18947, 18949, 18950, 18953, 18954, 18955, 18957, 18960, 18962, 18963, 18965, 18966, 18967, 18968, 18969, 18971, 18972, 18973, 18975, 18978, 18979, 18980, 18981, 18983, 18984, 18985, 18987, 18988, 18990, 18991, 18992, 18994, 18995, 18997, 18998, 18999, 19000, 19002, 19004, 19006, 19007, 19008, 19009, 19010, 19011, 19012, 19014, 19017, 19018, 19019, 19020, 19021, 19022, 19024, 19028, 19029, 19031, 19036, 19037, 19038, 19041, 19042, 19044, 19045, 19046, 19047, 19048, 19050, 19051, 19055, 19056, 19057, 19060, 19061, 19063, 19064, 19065, 19066, 19067, 19068, 19069, 19070, 19074, 19075, 19077, 19078, 19079, 19080, 19082, 19084, 19085, 19086, 19087, 19089, 19093, 19095, 19097, 19098, 19099, 19100, 19101, 19102, 19103, 19104, 19105, 19107, 19108, 19110, 19111, 19112, 19113, 19115, 19116, 19117, 19118, 19119, 19120, 19121, 19122, 19123, 19124, 19125, 19128, 19129, 19130, 19131, 19132, 19134, 19136, 19137, 19138, 19140, 19141, 19142, 19143, 19144, 19145, 19146, 19147, 19148, 19149, 19151, 19152, 19153, 19154, 19156, 19157, 19159, 19160, 19161, 19163, 19164, 19166, 19167, 19168, 19170, 19171, 19172, 19173, 19174, 19175, 19176, 19177, 19178, 19179, 19180, 19182, 19183, 19185, 19187, 19188, 19189, 19190, 19191, 19192, 19194, 19195, 19196, 19197, 19198, 19199, 19201, 19205, 19206, 19207, 19209, 19210, 19211, 19212, 19213, 19214, 19215, 19216, 19217, 19218, 19219, 19220, 19221, 19222, 19223, 19224, 19225, 19226, 19228, 19229, 19231, 19233, 19234, 19235, 19236, 19237, 19238, 19239, 19240, 19241, 19242, 19244, 19245, 19246, 19247, 19248, 19249, 19250, 19251, 19252, 19253, 19255, 19256, 19257, 19258, 39951);
DELETE FROM `pool_gameobject` WHERE `guid` IN (19114, 19034, 19254, 19126, 19035, 19015, 19033, 19040, 19232, 18986, 19106, 18945, 18947, 18949, 18950, 18953, 18954, 18955, 18957, 18960, 18962, 18963, 18965, 18966, 18967, 18968, 18969, 18971, 18972, 18973, 18975, 18978, 18979, 18980, 18981, 18983, 18984, 18985, 18987, 18988, 18990, 18991, 18992, 18994, 18995, 18997, 18998, 18999, 19000, 19002, 19004, 19006, 19007, 19008, 19009, 19010, 19011, 19012, 19014, 19017, 19018, 19019, 19020, 19021, 19022, 19024, 19028, 19029, 19031, 19036, 19037, 19038, 19041, 19042, 19044, 19045, 19046, 19047, 19048, 19050, 19051, 19055, 19056, 19057, 19060, 19061, 19063, 19064, 19065, 19066, 19067, 19068, 19069, 19070, 19074, 19075, 19077, 19078, 19079, 19080, 19082, 19084, 19085, 19086, 19087, 19089, 19093, 19095, 19097, 19098, 19099, 19100, 19101, 19102, 19103, 19104, 19105, 19107, 19108, 19110, 19111, 19112, 19113, 19115, 19116, 19117, 19118, 19119, 19120, 19121, 19122, 19123, 19124, 19125, 19128, 19129, 19130, 19131, 19132, 19134, 19136, 19137, 19138, 19140, 19141, 19142, 19143, 19144, 19145, 19146, 19147, 19148, 19149, 19151, 19152, 19153, 19154, 19156, 19157, 19159, 19160, 19161, 19163, 19164, 19166, 19167, 19168, 19170, 19171, 19172, 19173, 19174, 19175, 19176, 19177, 19178, 19179, 19180, 19182, 19183, 19185, 19187, 19188, 19189, 19190, 19191, 19192, 19194, 19195, 19196, 19197, 19198, 19199, 19201, 19205, 19206, 19207, 19209, 19210, 19211, 19212, 19213, 19214, 19215, 19216, 19217, 19218, 19219, 19220, 19221, 19222, 19223, 19224, 19225, 19226, 19228, 19229, 19231, 19233, 19234, 19235, 19236, 19237, 19238, 19239, 19240, 19241, 19242, 19244, 19245, 19246, 19247, 19248, 19249, 19250, 19251, 19252, 19253, 19255, 19256, 19257, 19258, 39951);

-- Sync Gobject Data
UPDATE `gameobject` SET `spawn_flags` = 0, `animprogress` = 100 WHERE `id` IN (176583, 176583);

-- Update Counters
UPDATE `pool_template` SET `max_limit`=3 WHERE  `entry`=1194;
UPDATE `pool_template` SET `max_limit`=6 WHERE  `entry`=1253;
UPDATE `pool_template` SET `max_limit`=6 WHERE  `entry`=1268;
UPDATE `pool_template` SET `max_limit`=5 WHERE  `entry`=1224;
UPDATE `pool_template` SET `max_limit`=7 WHERE  `entry`=1230;
UPDATE `pool_template` SET `max_limit`=16 WHERE  `entry`=1241;
UPDATE `pool_template` SET `max_limit`=8 WHERE  `entry`=1300;
UPDATE `pool_template` SET `max_limit`=21 WHERE  `entry`=1214;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
