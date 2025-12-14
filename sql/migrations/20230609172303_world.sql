DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230609172303');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230609172303');
-- Add your query below.


-- Dreamfoil (176584, 176639)
SET @OGUID = 18305;

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
(@OGUID+1, 176584, 1, 4350.75, -6867.52, 95.177, 3.01941, 0, 0, 0.998135, 0.0610518, 300, 300, 1, 100, 0, 10),
(@OGUID+2, 176584, 1, 3797.72, -4948.68, 145.915, 3.97935, 0, 0, -0.913545, 0.406738, 300, 300, 1, 100, 0, 10),
(@OGUID+3, 176584, 1, 3525.2, -4661.24, 101.48, 3.4034, 0, 0, -0.991445, 0.130528, 300, 300, 1, 100, 0, 10),
(@OGUID+4, 176584, 1, 2782.8, -5948.4, 102.623, 3.54302, 0, 0, -0.979924, 0.19937, 300, 300, 1, 100, 0, 10),
(@OGUID+5, 176584, 1, 3373.61, -4798.87, 110.855, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 1, 100, 0, 10),
(@OGUID+6, 176584, 1, 4417.09, -5555.2, 112.553, 4.7822, 0, 0, -0.681998, 0.731354, 300, 300, 1, 100, 0, 10),
(@OGUID+7, 176584, 1, 2608.8, -6279.1, 100.791, 4.38078, 0, 0, -0.814116, 0.580703, 300, 300, 1, 100, 0, 10),
(@OGUID+8, 176584, 1, 3395.1, -4277.85, 101.321, 4.41568, 0, 0, -0.803857, 0.594823, 300, 300, 1, 100, 0, 10),
(@OGUID+9, 176584, 1, 2576.27, -5874.06, 94.4094, 0.0523589, 0, 0, 0.0261765, 0.999657, 300, 300, 1, 100, 0, 10),
(@OGUID+10, 176584, 1, 2615.51, -4944.38, 126.447, 3.24635, 0, 0, -0.998629, 0.0523532, 300, 300, 1, 100, 0, 10),
(@OGUID+11, 176584, 1, 2947.01, -5158.5, 124.118, 5.58505, 0, 0, -0.34202, 0.939693, 300, 300, 1, 100, 0, 10),
(@OGUID+12, 176584, 1, 3133.33, -5112.11, 136.597, 2.89725, 0, 0, 0.992546, 0.12187, 300, 300, 1, 100, 0, 10),
(@OGUID+13, 176584, 1, 3535.88, -4140.06, 107.565, 5.98648, 0, 0, -0.147809, 0.989016, 300, 300, 1, 100, 0, 10),
(@OGUID+14, 176584, 1, 3626.1, -4851.65, 119.77, 4.92183, 0, 0, -0.62932, 0.777146, 300, 300, 1, 100, 0, 10),
(@OGUID+15, 176584, 1, 4044.84, -5306.96, 111.015, 4.90438, 0, 0, -0.636078, 0.771625, 300, 300, 1, 100, 0, 10),
(@OGUID+16, 176584, 1, 4326.12, -5929.41, 104.023, 3.94445, 0, 0, -0.920505, 0.390732, 300, 300, 1, 100, 0, 10),
(@OGUID+17, 176584, 1, 4404.89, -5789.1, 103.35, 3.12412, 0, 0, 0.999962, 0.00873464, 300, 300, 1, 100, 0, 10),
(@OGUID+18, 176584, 1, 4460.48, -7206.41, 97.106, 3.47321, 0, 0, -0.986285, 0.16505, 300, 300, 1, 100, 0, 10),
(@OGUID+19, 176584, 1, 4569.75, -6635.49, 95.2002, 5.79449, 0, 0, -0.241921, 0.970296, 300, 300, 1, 100, 0, 10);

-- Missing Dreamfoil spawns in Western Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+20, 176584, 0, 1515.73, -1079.51, 74.4867, 3.42085, 0, 0, -0.990268, 0.139175, 300, 300, 1, 100, 0, 10),
(@OGUID+21, 176584, 0, 2078, -1642.67, 63.1557, 1.27409, 0, 0, 0.594822, 0.803857, 300, 300, 1, 100, 0, 10),
(@OGUID+22, 176584, 0, 2017.62, -1572.94, 60.9312, 4.76475, 0, 0, -0.688354, 0.725374, 300, 300, 1, 100, 0, 10),
(@OGUID+23, 176584, 0, 1633.13, -2103.97, 58.8374, 5.77704, 0, 0, -0.25038, 0.968148, 300, 300, 1, 100, 0, 10),
(@OGUID+24, 176584, 0, 1985.93, -1858.12, 69.8165, 3.12412, 0, 0, 0.999962, 0.00873464, 300, 300, 1, 100, 0, 10),
(@OGUID+25, 176584, 0, 1916.66, -1954.35, 78.9259, 0.663223, 0, 0, 0.325567, 0.945519, 300, 300, 1, 100, 0, 10),
(@OGUID+26, 176584, 0, 1718.48, -1012.31, 71.3803, 2.93214, 0, 0, 0.994521, 0.104536, 300, 300, 1, 100, 0, 10),
(@OGUID+27, 176584, 0, 2080.25, -2486.74, 59.6818, 0.925024, 0, 0, 0.446198, 0.894935, 300, 300, 1, 100, 0, 10),
(@OGUID+28, 176584, 0, 1974.43, -2421.16, 60.5007, 1.37881, 0, 0, 0.636078, 0.771625, 300, 300, 1, 100, 0, 10),
(@OGUID+29, 176584, 0, 2858.97, -1490.24, 146.253, 2.51327, 0, 0, 0.951056, 0.309017, 300, 300, 1, 100, 0, 10);

-- Missing Dreamfoil spawns in Burning Steppes.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+30, 176584, 0, -7887.27, -1978.09, 134.917, 3.78737, 0, 0, -0.948323, 0.317306, 300, 300, 1, 100, 0, 10),
(@OGUID+31, 176584, 0, -7940.46, -2839.89, 133.573, 5.3058, 0, 0, -0.469471, 0.882948, 300, 300, 1, 100, 0, 10),
(@OGUID+32, 176584, 0, -7986.98, -2422.14, 128.268, 3.17653, 0, 0, -0.999847, 0.0174693, 300, 300, 1, 100, 0, 10),
(@OGUID+33, 176584, 0, -8382.47, -1244.62, 197.574, 5.74214, 0, 0, -0.267238, 0.963631, 300, 300, 1, 100, 0, 10),
(@OGUID+34, 176584, 0, -8296.64, -1911.99, 142.722, 0.558504, 0, 0, 0.275637, 0.961262, 300, 300, 1, 100, 0, 10),
(@OGUID+35, 176584, 0, -8208.66, -932.638, 133.372, 0.488691, 0, 0, 0.241921, 0.970296, 300, 300, 1, 100, 0, 10),
(@OGUID+36, 176584, 0, -8147.9, -2879.29, 135.687, 4.39823, 0, 0, -0.809016, 0.587786, 300, 300, 1, 100, 0, 10),
(@OGUID+37, 176584, 0, -8130.73, -753.006, 134.006, 2.77507, 0, 0, 0.983254, 0.182238, 300, 300, 1, 100, 0, 10),
(@OGUID+38, 176584, 0, -8109.43, -1610.11, 133.374, 5.11382, 0, 0, -0.551936, 0.833886, 300, 300, 1, 100, 0, 10),
(@OGUID+39, 176584, 0, -7959.27, -1379.52, 133.373, 1.18682, 0, 0, 0.559193, 0.829038, 300, 300, 1, 100, 0, 10),
(@OGUID+40, 176584, 0, -7786.68, -1741.32, 133.194, 5.02655, 0, 0, -0.587785, 0.809017, 300, 300, 1, 100, 0, 10),
(@OGUID+41, 176584, 0, -7731.5, -2235.52, 135.508, 2.51327, 0, 0, 0.951056, 0.309017, 300, 300, 1, 100, 0, 10),
(@OGUID+42, 176584, 0, -7658.67, -2904.56, 134.163, 0.645772, 0, 0, 0.317305, 0.948324, 300, 300, 1, 100, 0, 10),
(@OGUID+43, 176584, 0, -7621.57, -2539.79, 133.49, 0.872664, 0, 0, 0.422618, 0.906308, 300, 300, 1, 100, 0, 10),
(@OGUID+44, 176584, 0, -7532.94, -1946.5, 183.276, 0.558504, 0, 0, 0.275637, 0.961262, 300, 300, 1, 100, 0, 10);

-- Missing Dreamfoil spawns in Eastern Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+45, 176584, 0, 1773.09, -4107.52, 99.4197, 1.6057, 0, 0, 0.719339, 0.694659, 300, 300, 1, 100, 0, 10),
(@OGUID+46, 176584, 0, 2390.77, -5082.78, 79.6235, 3.49067, 0, 0, -0.984807, 0.173652, 300, 300, 1, 100, 0, 10),
(@OGUID+47, 176584, 0, 1675.74, -4981.45, 79.0261, 3.28124, 0, 0, -0.997563, 0.0697661, 300, 300, 1, 100, 0, 10),
(@OGUID+48, 176584, 0, 1950.77, -3732.88, 127.524, 5.18363, 0, 0, -0.522498, 0.85264, 300, 300, 1, 100, 0, 10),
(@OGUID+49, 176584, 0, 2839.3, -3883, 106.737, 1.3439, 0, 0, 0.622514, 0.782609, 300, 300, 1, 100, 0, 10),
(@OGUID+50, 176584, 0, 1886.58, -3537.26, 110.21, 3.35105, 0, 0, -0.994521, 0.104536, 300, 300, 1, 100, 0, 10),
(@OGUID+51, 176584, 0, 2066.79, -3799.68, 133.023, 0.733038, 0, 0, 0.358368, 0.93358, 300, 300, 1, 100, 0, 10),
(@OGUID+52, 176584, 0, 2089.32, -4781.44, 74.7134, 3.57793, 0, 0, -0.976295, 0.216442, 300, 300, 1, 100, 0, 10),
(@OGUID+53, 176584, 0, 2282.73, -4875.34, 101.072, 0.95993, 0, 0, 0.461748, 0.887011, 300, 300, 1, 100, 0, 10),
(@OGUID+54, 176584, 0, 1648.37, -3419.78, 133.083, 0.453785, 0, 0, 0.224951, 0.97437, 300, 300, 1, 100, 0, 10),
(@OGUID+55, 176584, 0, 2006.54, -5191.45, 81.064, 3.50812, 0, 0, -0.983254, 0.182238, 300, 300, 1, 100, 0, 10),
(@OGUID+56, 176584, 0, 2386.19, -5174.74, 74.0617, 0.349065, 0, 0, 0.173648, 0.984808, 300, 300, 1, 100, 0, 10),
(@OGUID+57, 176584, 0, 1850, -4281.62, 86.9686, 3.4034, 0, 0, -0.991445, 0.130528, 300, 300, 1, 100, 0, 10),
(@OGUID+58, 176584, 0, 2789.93, -4104.28, 99.2775, 1.3439, 0, 0, 0.622514, 0.782609, 300, 300, 1, 100, 0, 10),
(@OGUID+59, 176584, 0, 1878.28, -4879.28, 98.8299, 2.9845, 0, 0, 0.996917, 0.0784664, 300, 300, 1, 100, 0, 10),
(@OGUID+60, 176584, 0, 1792.39, -2944.86, 73.7743, 4.86947, 0, 0, -0.649447, 0.760406, 300, 300, 1, 100, 0, 10),
(@OGUID+61, 176584, 0, 1922.32, -4962.93, 76.6725, 3.71755, 0, 0, -0.958819, 0.284016, 300, 300, 1, 100, 0, 10),
(@OGUID+62, 176584, 0, 2007.94, -4948.45, 74.1835, 5.11382, 0, 0, -0.551936, 0.833886, 300, 300, 1, 100, 0, 10),
(@OGUID+63, 176584, 0, 2328.65, -4239.03, 95.0663, 4.38078, 0, 0, -0.814116, 0.580703, 300, 300, 1, 100, 0, 10),
(@OGUID+64, 176584, 0, 2505.65, -4891.79, 77.3231, 5.95157, 0, 0, -0.165047, 0.986286, 300, 300, 1, 100, 0, 10),
(@OGUID+65, 176584, 0, 2798.28, -3348.45, 96.2219, 1.32645, 0, 0, 0.615661, 0.788011, 300, 300, 1, 100, 0, 10);

-- Missing Dreamfoil spawns in Un'Goro Crater.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+66, 176584, 1, -7633.23, -1917.64, -268.372, 3.73501, 0, 0, -0.956305, 0.292372, 300, 300, 1, 100, 0, 10),
(@OGUID+67, 176584, 1, -7412.39, -1424.75, -271.369, 4.71239, 0, 0, -0.707107, 0.707107, 300, 300, 1, 100, 0, 10),
(@OGUID+68, 176584, 1, -7794.81, -1975.55, -270.681, 2.87979, 0, 0, 0.991445, 0.130528, 300, 300, 1, 100, 0, 10),
(@OGUID+69, 176584, 1, -7901.05, -1131.63, -272.205, 4.53786, 0, 0, -0.766044, 0.642789, 300, 300, 1, 100, 0, 10),
(@OGUID+70, 176584, 1, -7515.11, -723.628, -254.456, 2.19911, 0, 0, 0.891006, 0.453991, 300, 300, 1, 100, 0, 10),
(@OGUID+71, 176584, 1, -7289.47, -420.506, -269.51, 2.91469, 0, 0, 0.993571, 0.113208, 300, 300, 1, 100, 0, 10),
(@OGUID+72, 176584, 1, -7076.98, -650.943, -269.642, 6.23083, 0, 0, -0.0261765, 0.999657, 300, 300, 1, 100, 0, 10),
(@OGUID+73, 176584, 1, -6695.48, -772.953, -271.134, 2.21657, 0, 0, 0.894934, 0.446199, 300, 300, 1, 100, 0, 10),
(@OGUID+74, 176584, 1, -6483.88, -1379.81, -272.495, 4.2237, 0, 0, -0.857167, 0.515038, 300, 300, 1, 100, 0, 10),
(@OGUID+75, 176584, 1, -7199.46, -246.709, -217.839, 5.98648, 0, 0, -0.147809, 0.989016, 300, 300, 1, 100, 0, 10),
(@OGUID+76, 176584, 1, -7544.54, -1114.93, -269.081, 4.46804, 0, 0, -0.788011, 0.615662, 300, 300, 1, 100, 0, 10),
(@OGUID+77, 176584, 1, -8157.05, -1333.05, -226.25, 4.7822, 0, 0, -0.681998, 0.731354, 300, 300, 1, 100, 0, 10),
(@OGUID+78, 176584, 1, -7886.36, -682.965, -258.863, 2.54818, 0, 0, 0.956305, 0.292372, 300, 300, 1, 100, 0, 10),
(@OGUID+79, 176584, 1, -7771.52, -1717.76, -271.683, 0.261798, 0, 0, 0.130526, 0.991445, 300, 300, 1, 100, 0, 10),
(@OGUID+80, 176584, 1, -7681.8, -1086.47, -270.185, 4.08407, 0, 0, -0.891006, 0.453991, 300, 300, 1, 100, 0, 10),
(@OGUID+81, 176584, 1, -7581.58, -511.841, -267.643, 1.53589, 0, 0, 0.694658, 0.71934, 300, 300, 1, 100, 0, 10),
(@OGUID+82, 176584, 1, -7497.5, -1536.28, -272.164, 2.96704, 0, 0, 0.996194, 0.087165, 300, 300, 1, 100, 0, 10),
(@OGUID+83, 176584, 1, -7416.85, -912.96, -267.874, 5.32326, 0, 0, -0.461748, 0.887011, 300, 300, 1, 100, 0, 10),
(@OGUID+84, 176584, 1, -7411.89, -1748.98, -276.871, 2.67035, 0, 0, 0.972369, 0.233448, 300, 300, 1, 100, 0, 10),
(@OGUID+85, 176584, 1, -7081.8, -2247.8, -271.156, 1.83259, 0, 0, 0.793353, 0.608762, 300, 300, 1, 100, 0, 10),
(@OGUID+86, 176584, 1, -6950.32, -1015.22, -272.186, 0.226892, 0, 0, 0.113203, 0.993572, 300, 300, 1, 100, 0, 10),
(@OGUID+87, 176584, 1, -6885.31, -1580.54, -272.208, 4.03171, 0, 0, -0.902585, 0.430512, 300, 300, 1, 100, 0, 10),
(@OGUID+88, 176584, 1, -6808.27, -816.903, -272.222, 0.925024, 0, 0, 0.446198, 0.894935, 300, 300, 1, 100, 0, 10),
(@OGUID+89, 176584, 1, -6650.78, -1718.38, -272.222, 1.97222, 0, 0, 0.833885, 0.551938, 300, 300, 1, 100, 0, 10),
(@OGUID+90, 176584, 1, -6454.92, -921.171, -275.226, 5.42797, 0, 0, -0.414693, 0.909961, 300, 300, 1, 100, 0, 10);

-- Missing Dreamfoil spawns in Silithus.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+91, 176584, 1, -6988.66, 571.305, 8.68417, 0.767944, 0, 0, 0.374606, 0.927184, 300, 300, 1, 100, 0, 10),
(@OGUID+92, 176584, 1, -6759.77, 1476.92, 4.77277, 6.02139, 0, 0, -0.130526, 0.991445, 300, 300, 1, 100, 0, 10),
(@OGUID+93, 176584, 1, -7526.1, 940.236, 4.11149, 3.35105, 0, 0, -0.994521, 0.104536, 300, 300, 1, 100, 0, 10),
(@OGUID+94, 176584, 1, -7716.8, 1188.04, -0.216536, 5.44543, 0, 0, -0.406736, 0.913546, 300, 300, 1, 100, 0, 10),
(@OGUID+95, 176584, 1, -7987.46, 1282.15, -3.45968, 3.29869, 0, 0, -0.996917, 0.0784664, 300, 300, 1, 100, 0, 10),
(@OGUID+96, 176584, 1, -7882.29, 870.72, -1.37092, 5.00909, 0, 0, -0.594823, 0.803857, 300, 300, 1, 100, 0, 10),
(@OGUID+97, 176584, 1, -7418.48, 719.633, -6.51437, 3.54302, 0, 0, -0.979924, 0.19937, 300, 300, 1, 100, 0, 10),
(@OGUID+98, 176584, 1, -7360.87, 1076.73, 0.508525, 4.86947, 0, 0, -0.649447, 0.760406, 300, 300, 1, 100, 0, 10),
(@OGUID+99, 176584, 1, -6992.27, 212.119, 2.68579, 0.942477, 0, 0, 0.45399, 0.891007, 300, 300, 1, 100, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1242, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Azshara 122 objects total
(@OGUID+2, 1242, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Azshara 122 objects total
(@OGUID+3, 1242, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Azshara 122 objects total
(@OGUID+4, 1242, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Azshara 122 objects total
(@OGUID+5, 1242, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Azshara 122 objects total
(@OGUID+6, 1242, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Azshara 122 objects total
(@OGUID+7, 1242, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Azshara 122 objects total
(@OGUID+8, 1242, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Azshara 122 objects total
(@OGUID+9, 1242, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Azshara 122 objects total
(@OGUID+10, 1242, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Azshara 122 objects total
(@OGUID+11, 1242, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Azshara 122 objects total
(@OGUID+12, 1242, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Azshara 122 objects total
(@OGUID+13, 1242, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Azshara 122 objects total
(@OGUID+14, 1242, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Azshara 122 objects total
(@OGUID+15, 1242, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Azshara 122 objects total
(@OGUID+16, 1242, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Azshara 122 objects total
(@OGUID+17, 1242, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Azshara 122 objects total
(@OGUID+18, 1242, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Azshara 122 objects total
(@OGUID+19, 1242, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Azshara 122 objects total
(@OGUID+20, 1260, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Western Plaguelands 33 objects total
(@OGUID+21, 1260, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Western Plaguelands 33 objects total
(@OGUID+22, 1260, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Western Plaguelands 33 objects total
(@OGUID+23, 1260, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Western Plaguelands 33 objects total
(@OGUID+24, 1260, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Western Plaguelands 33 objects total
(@OGUID+25, 1260, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Western Plaguelands 33 objects total
(@OGUID+26, 1260, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Western Plaguelands 33 objects total
(@OGUID+27, 1260, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Western Plaguelands 33 objects total
(@OGUID+28, 1260, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Western Plaguelands 33 objects total
(@OGUID+29, 1260, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Western Plaguelands 33 objects total
(@OGUID+30, 1301, 0, 'Dreamfoil', 0, 10), -- Dream Foil in Burning Steppes 57 objects total
(@OGUID+31, 1301, 0, 'Dreamfoil', 0, 10), -- Dream Foil in Burning Steppes 57 objects total
(@OGUID+32, 1301, 0, 'Dreamfoil', 0, 10), -- Dream Foil in Burning Steppes 57 objects total
(@OGUID+33, 1301, 0, 'Dreamfoil', 0, 10), -- Dream Foil in Burning Steppes 57 objects total
(@OGUID+34, 1301, 0, 'Dreamfoil', 0, 10), -- Dream Foil in Burning Steppes 57 objects total
(@OGUID+35, 1301, 0, 'Dreamfoil', 0, 10), -- Dream Foil in Burning Steppes 57 objects total
(@OGUID+36, 1301, 0, 'Dreamfoil', 0, 10), -- Dream Foil in Burning Steppes 57 objects total
(@OGUID+37, 1301, 0, 'Dreamfoil', 0, 10), -- Dream Foil in Burning Steppes 57 objects total
(@OGUID+38, 1301, 0, 'Dreamfoil', 0, 10), -- Dream Foil in Burning Steppes 57 objects total
(@OGUID+39, 1301, 0, 'Dreamfoil', 0, 10), -- Dream Foil in Burning Steppes 57 objects total
(@OGUID+40, 1301, 0, 'Dreamfoil', 0, 10), -- Dream Foil in Burning Steppes 57 objects total
(@OGUID+41, 1301, 0, 'Dreamfoil', 0, 10), -- Dream Foil in Burning Steppes 57 objects total
(@OGUID+42, 1301, 0, 'Dreamfoil', 0, 10), -- Dream Foil in Burning Steppes 57 objects total
(@OGUID+43, 1301, 0, 'Dreamfoil', 0, 10), -- Dream Foil in Burning Steppes 57 objects total
(@OGUID+44, 1301, 0, 'Dreamfoil', 0, 10), -- Dream Foil in Burning Steppes 57 objects total
(@OGUID+45, 1267, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Eastern Plaguelands 71 objects total
(@OGUID+46, 1267, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Eastern Plaguelands 71 objects total
(@OGUID+47, 1267, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Eastern Plaguelands 71 objects total
(@OGUID+48, 1267, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Eastern Plaguelands 71 objects total
(@OGUID+49, 1267, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Eastern Plaguelands 71 objects total
(@OGUID+50, 1267, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Eastern Plaguelands 71 objects total
(@OGUID+51, 1267, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Eastern Plaguelands 71 objects total
(@OGUID+52, 1267, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Eastern Plaguelands 71 objects total
(@OGUID+53, 1267, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Eastern Plaguelands 71 objects total
(@OGUID+54, 1267, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Eastern Plaguelands 71 objects total
(@OGUID+55, 1267, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Eastern Plaguelands 71 objects total
(@OGUID+56, 1267, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Eastern Plaguelands 71 objects total
(@OGUID+57, 1267, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Eastern Plaguelands 71 objects total
(@OGUID+58, 1267, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Eastern Plaguelands 71 objects total
(@OGUID+59, 1267, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Eastern Plaguelands 71 objects total
(@OGUID+60, 1267, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Eastern Plaguelands 71 objects total
(@OGUID+61, 1267, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Eastern Plaguelands 71 objects total
(@OGUID+62, 1267, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Eastern Plaguelands 71 objects total
(@OGUID+63, 1267, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Eastern Plaguelands 71 objects total
(@OGUID+64, 1267, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Eastern Plaguelands 71 objects total
(@OGUID+65, 1267, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Eastern Plaguelands 71 objects total
(@OGUID+66, 1212, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Ungoro 83 objects total
(@OGUID+67, 1212, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Ungoro 83 objects total
(@OGUID+68, 1212, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Ungoro 83 objects total
(@OGUID+69, 1212, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Ungoro 83 objects total
(@OGUID+70, 1212, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Ungoro 83 objects total
(@OGUID+71, 1212, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Ungoro 83 objects total
(@OGUID+72, 1212, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Ungoro 83 objects total
(@OGUID+73, 1212, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Ungoro 83 objects total
(@OGUID+74, 1212, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Ungoro 83 objects total
(@OGUID+75, 1212, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Ungoro 83 objects total
(@OGUID+76, 1212, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Ungoro 83 objects total
(@OGUID+77, 1212, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Ungoro 83 objects total
(@OGUID+78, 1212, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Ungoro 83 objects total
(@OGUID+79, 1212, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Ungoro 83 objects total
(@OGUID+80, 1212, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Ungoro 83 objects total
(@OGUID+81, 1212, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Ungoro 83 objects total
(@OGUID+82, 1212, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Ungoro 83 objects total
(@OGUID+83, 1212, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Ungoro 83 objects total
(@OGUID+84, 1212, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Ungoro 83 objects total
(@OGUID+85, 1212, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Ungoro 83 objects total
(@OGUID+86, 1212, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Ungoro 83 objects total
(@OGUID+87, 1212, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Ungoro 83 objects total
(@OGUID+88, 1212, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Ungoro 83 objects total
(@OGUID+89, 1212, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Ungoro 83 objects total
(@OGUID+90, 1212, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Ungoro 83 objects total
(@OGUID+91, 1221, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Silithus 22 objects total
(@OGUID+92, 1221, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Silithus 22 objects total
(@OGUID+93, 1221, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Silithus 22 objects total
(@OGUID+94, 1221, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Silithus 22 objects total
(@OGUID+95, 1221, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Silithus 22 objects total
(@OGUID+96, 1221, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Silithus 22 objects total
(@OGUID+97, 1221, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Silithus 22 objects total
(@OGUID+98, 1221, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Silithus 22 objects total
(@OGUID+99, 1221, 0, 'Dreamfoil', 0, 10); -- Dreamfoil in Silithus 22 objects total

-- Remove Custom Spawns In Felwood
SET @OGUID = 15421;
DELETE FROM `gameobject` WHERE `guid` IN (19276, 19307, 19317, 19320, 19347, 19360, 19377, 19379, 19381, 19382, 19399, 19412, 19414, 19415, 19432, 19449, 19450, 19459, 19462, 19463, 19471, 19486, 19487, 19488, 19500, 19521, 19539, 19545, 19547, 19557, 19561, 19562, 19572, 19574, 19576, 19580, 19623, 19635, 19638, 19651, 19655, 19660);
DELETE FROM `pool_gameobject` WHERE `guid` IN (19276, 19307, 19317, 19320, 19347, 19360, 19377, 19379, 19381, 19382, 19399, 19412, 19414, 19415, 19432, 19449, 19450, 19459, 19462, 19463, 19471, 19486, 19487, 19488, 19500, 19521, 19539, 19545, 19547, 19557, 19561, 19562, 19572, 19574, 19576, 19580, 19623, 19635, 19638, 19651, 19655, 19660);

-- Missing Dreamfoil spawns in Felwood.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 176639, 1, 6644.92, -1244.1, 455.831, 2.46091, 0, 0, 0.942641, 0.333808, 300, 300, 1, 100, 0, 10),
(@OGUID+2, 176639, 1, 6521.35, -1473.55, 439.164, 5.67232, 0, 0, -0.300705, 0.953717, 300, 300, 1, 100, 0, 10),
(@OGUID+3, 176639, 1, 4953.82, -647.138, 295.787, 3.54302, 0, 0, -0.979924, 0.19937, 300, 300, 1, 100, 0, 10),
(@OGUID+4, 176639, 1, 6440.84, -1691.32, 502.469, 0.837757, 0, 0, 0.406736, 0.913546, 300, 300, 1, 100, 0, 10),
(@OGUID+5, 176639, 1, 5820.31, -727.122, 381.453, 0.279252, 0, 0, 0.139173, 0.990268, 300, 300, 1, 100, 0, 10),
(@OGUID+6, 176639, 1, 6338.19, -1171.82, 375.17, 5.75959, 0, 0, -0.258819, 0.965926, 300, 300, 1, 100, 0, 10),
(@OGUID+7, 176639, 1, 5188.97, -596.913, 326.327, 4.99164, 0, 0, -0.601814, 0.798636, 300, 300, 1, 100, 0, 10),
(@OGUID+8, 176639, 1, 4521.6, -661.612, 259.686, 4.41568, 0, 0, -0.803857, 0.594823, 300, 300, 1, 100, 0, 10),
(@OGUID+9, 176639, 1, 3775.38, -1104.45, 228.32, 1.93731, 0, 0, 0.824125, 0.566408, 300, 300, 1, 100, 0, 10),
(@OGUID+10, 176639, 1, 6210.37, -1035.32, 386.014, 1.72787, 0, 0, 0.760406, 0.649449, 300, 300, 1, 100, 0, 10),
(@OGUID+11, 176639, 1, 3881.28, -988.969, 246.243, 1.39626, 0, 0, 0.642787, 0.766045, 300, 300, 1, 100, 0, 10),
(@OGUID+12, 176639, 1, 4714.74, -816.447, 309.083, 3.12412, 0, 0, 0.999962, 0.00873464, 300, 300, 1, 100, 0, 10),
(@OGUID+13, 176639, 1, 4253, -998.988, 298.48, 0.191985, 0, 0, 0.0958452, 0.995396, 300, 300, 1, 100, 0, 10),
(@OGUID+14, 176639, 1, 6528.6, -1323.92, 439.695, 0.855211, 0, 0, 0.414693, 0.909961, 300, 300, 1, 100, 0, 10),
(@OGUID+15, 176639, 1, 3757.66, -1243.59, 209.258, 4.01426, 0, 0, -0.906307, 0.422619, 300, 300, 1, 100, 0, 10),
(@OGUID+16, 176639, 1, 3877.94, -1616.04, 250.439, 4.38078, 0, 0, -0.814116, 0.580703, 300, 300, 1, 100, 0, 10),
(@OGUID+17, 176639, 1, 4017.34, -788.968, 285.693, 4.18879, 0, 0, -0.866025, 0.500001, 300, 300, 1, 100, 0, 10),
(@OGUID+18, 176639, 1, 4140.46, -700.01, 282.675, 2.28638, 0, 0, 0.909961, 0.414694, 300, 300, 1, 100, 0, 10),
(@OGUID+19, 176639, 1, 4266.84, -1118.4, 320.928, 4.64258, 0, 0, -0.731354, 0.681998, 300, 300, 1, 100, 0, 10),
(@OGUID+20, 176639, 1, 4468.12, -926.952, 314.772, 3.68265, 0, 0, -0.96363, 0.267241, 300, 300, 1, 100, 0, 10),
(@OGUID+21, 176639, 1, 4791.07, -500.714, 325.658, 0.436332, 0, 0, 0.216439, 0.976296, 300, 300, 1, 100, 0, 10),
(@OGUID+22, 176639, 1, 5483.54, -675.606, 347.061, 1.16937, 0, 0, 0.551936, 0.833886, 300, 300, 1, 100, 0, 10),
(@OGUID+23, 176639, 1, 5612.15, -1024.02, 376.038, 0.436332, 0, 0, 0.216439, 0.976296, 300, 300, 1, 100, 0, 10),
(@OGUID+24, 176639, 1, 5885.37, -1262.66, 405.783, 2.00713, 0, 0, 0.843391, 0.5373, 300, 300, 1, 100, 0, 10),
(@OGUID+25, 176639, 1, 6099.61, -1464.19, 430.039, 1.64061, 0, 0, 0.731353, 0.681999, 300, 300, 1, 100, 0, 10),
(@OGUID+26, 176639, 1, 6384.31, -2048.23, 571.964, 2.16421, 0, 0, 0.882947, 0.469473, 300, 300, 1, 100, 0, 10),
(@OGUID+27, 176639, 1, 6433.98, -939.995, 423.01, 0.715585, 0, 0, 0.350207, 0.936672, 300, 300, 1, 100, 0, 10),
(@OGUID+28, 176639, 1, 6681.8, -1470.58, 473.485, 1.62316, 0, 0, 0.725374, 0.688355, 300, 300, 1, 100, 0, 10),
(@OGUID+29, 176639, 1, 6691.09, -1957.73, 551.707, 0.139624, 0, 0, 0.0697556, 0.997564, 300, 300, 1, 100, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1228, 0, 'Dreamfoil', 0, 10), -- Dreamfoils in Felwood
(@OGUID+2, 1228, 0, 'Dreamfoil', 0, 10), -- Dreamfoils in Felwood
(@OGUID+3, 1228, 0, 'Dreamfoil', 0, 10), -- Dreamfoils in Felwood
(@OGUID+4, 1228, 0, 'Dreamfoil', 0, 10), -- Dreamfoils in Felwood
(@OGUID+5, 1228, 0, 'Dreamfoil', 0, 10), -- Dreamfoils in Felwood
(@OGUID+6, 1228, 0, 'Dreamfoil', 0, 10), -- Dreamfoils in Felwood
(@OGUID+7, 1228, 0, 'Dreamfoil', 0, 10), -- Dreamfoils in Felwood
(@OGUID+8, 1228, 0, 'Dreamfoil', 0, 10), -- Dreamfoils in Felwood
(@OGUID+9, 1228, 0, 'Dreamfoil', 0, 10), -- Dreamfoils in Felwood
(@OGUID+10, 1228, 0, 'Dreamfoil', 0, 10), -- Dreamfoils in Felwood
(@OGUID+11, 1228, 0, 'Dreamfoil', 0, 10), -- Dreamfoils in Felwood
(@OGUID+12, 1228, 0, 'Dreamfoil', 0, 10), -- Dreamfoils in Felwood
(@OGUID+13, 1228, 0, 'Dreamfoil', 0, 10), -- Dreamfoils in Felwood
(@OGUID+14, 1228, 0, 'Dreamfoil', 0, 10), -- Dreamfoils in Felwood
(@OGUID+15, 1228, 0, 'Dreamfoil', 0, 10), -- Dreamfoils in Felwood
(@OGUID+16, 1228, 0, 'Dreamfoil', 0, 10), -- Dreamfoils in Felwood
(@OGUID+17, 1228, 0, 'Dreamfoil', 0, 10), -- Dreamfoils in Felwood
(@OGUID+18, 1228, 0, 'Dreamfoil', 0, 10), -- Dreamfoils in Felwood
(@OGUID+19, 1228, 0, 'Dreamfoil', 0, 10), -- Dreamfoils in Felwood
(@OGUID+20, 1228, 0, 'Dreamfoil', 0, 10), -- Dreamfoils in Felwood
(@OGUID+21, 1228, 0, 'Dreamfoil', 0, 10), -- Dreamfoils in Felwood
(@OGUID+22, 1228, 0, 'Dreamfoil', 0, 10), -- Dreamfoils in Felwood
(@OGUID+23, 1228, 0, 'Dreamfoil', 0, 10), -- Dreamfoils in Felwood
(@OGUID+24, 1228, 0, 'Dreamfoil', 0, 10), -- Dreamfoils in Felwood
(@OGUID+25, 1228, 0, 'Dreamfoil', 0, 10), -- Dreamfoils in Felwood
(@OGUID+26, 1228, 0, 'Dreamfoil', 0, 10), -- Dreamfoils in Felwood
(@OGUID+27, 1228, 0, 'Dreamfoil', 0, 10), -- Dreamfoils in Felwood
(@OGUID+28, 1228, 0, 'Dreamfoil', 0, 10), -- Dreamfoils in Felwood
(@OGUID+29, 1228, 0, 'Dreamfoil', 0, 10); -- Dreamfoils in Felwood

-- Correct Pools
UPDATE `pool_template` SET `description`='Dreamfoil in Burning Steppes' WHERE  `entry`=1301;
UPDATE `pool_template` SET `description`='Dreamfoil in Azshara' WHERE  `entry`=1242;
UPDATE `pool_template` SET `description`='Dreamfoil in Eastern Plaguelands' WHERE  `entry`=1267;
UPDATE `pool_template` SET `description`='Dreamfoil in Felwood' WHERE  `entry`=1228;
UPDATE `pool_template` SET `description`='Dreamfoil in Silithus' WHERE  `entry`=1221;
UPDATE `pool_template` SET `description`='Dreamfoil in Ungoro Crater' WHERE  `entry`=1212;
UPDATE `pool_template` SET `description`='Dreamfoil in Western Plaguelands' WHERE  `entry`=1260;

-- Remove Custom Spawns (Non of these spawns exist in the sniff-db)
DELETE FROM `gameobject` WHERE `guid` IN (19492, 19527, 19499, 19578, 19528, 19433, 19296, 19634, 19597, 19262, 19263, 19264, 19265, 19267, 19270, 19271, 19272, 19273, 19274, 19275, 19277, 19278, 19279, 19280, 19281, 19283, 19284, 19285, 19286, 19287, 19288, 19289, 19290, 19291, 19292, 19298, 19299, 19300, 19301, 19302, 19303, 19304, 19305, 19306, 19307, 19308, 19309, 19310, 19312, 19313, 19314, 19315, 19316, 19317, 19318, 19319, 19320, 19321, 19322, 19323, 19324, 19325, 19329, 19330, 19331, 19332, 19333, 19335, 19336, 19339, 19341, 19342, 19343, 19344, 19345, 19346, 19347, 19348, 19351, 19353, 19354, 19355, 19357, 19358, 19359, 19360, 19361, 19363, 19364, 19365, 19368, 19369, 19370, 19371, 19373, 19374, 19376, 19377, 19378, 19379, 19381, 19382, 19383, 19385, 19386, 19387, 19388, 19390, 19393, 19394, 19396, 19397, 19398, 19400, 19401, 19402, 19403, 19405, 19406, 19407, 19408, 19410, 19411, 19412, 19414, 19415, 19416, 19417, 19418, 19421, 19422, 19423, 19425, 19429, 19430, 19431, 19432, 19446, 19448, 19449, 19450, 19452, 19453, 19455, 19456, 19457, 19458, 19459, 19462, 19463, 19465, 19466, 19468, 19469, 19470, 19471, 19472, 19473, 19474, 19477, 19478, 19480, 19481, 19482, 19483, 19484, 19486, 19488, 19489, 19490, 19491, 19494, 19495, 19496, 19498, 19500, 19501, 19502, 19503, 19504, 19505, 19506, 19507, 19508, 19509, 19511, 19512, 19513, 19514, 19516, 19517, 19518, 19519, 19520, 19521, 19523, 19524, 19525, 19526, 19529, 19531, 19532, 19533, 19535, 19537, 19538, 19539, 19540, 19542, 19543, 19544, 19545, 19547, 19548, 19549, 19551, 19552, 19553, 19555, 19556, 19557, 19558, 19559, 19560, 19561, 19562, 19563, 19564, 19566, 19568, 19569, 19570, 19571, 19572, 19573, 19576, 19577, 19579, 19580, 19581, 19583, 19586, 19588, 19589, 19590, 19591, 19592, 19593, 19594, 19595, 19596, 19598, 19599, 19600, 19602, 19603, 19604, 19605, 19606, 19607, 19608, 19609, 19610, 19611, 19612, 19613, 19614, 19617, 19618, 19620, 19621, 19622, 19623, 19624, 19625, 19626, 19629, 19630, 19632, 19633, 19635, 19636, 19637, 19638, 19639, 19640, 19641, 19643, 19645, 19646, 19647, 19648, 19649, 19651, 19653, 19654, 19655, 19656, 19657, 19658, 19659, 19660, 19661, 19662, 39931, 39952, 39954, 429001, 429002, 429003, 429004, 429005, 429006, 429007, 429008, 429009, 429010, 429011);
DELETE FROM `pool_gameobject` WHERE `guid` IN (19492, 19527, 19499, 19578, 19528, 19433, 19296, 19634, 19597, 19262, 19263, 19264, 19265, 19267, 19270, 19271, 19272, 19273, 19274, 19275, 19277, 19278, 19279, 19280, 19281, 19283, 19284, 19285, 19286, 19287, 19288, 19289, 19290, 19291, 19292, 19298, 19299, 19300, 19301, 19302, 19303, 19304, 19305, 19306, 19307, 19308, 19309, 19310, 19312, 19313, 19314, 19315, 19316, 19317, 19318, 19319, 19320, 19321, 19322, 19323, 19324, 19325, 19329, 19330, 19331, 19332, 19333, 19335, 19336, 19339, 19341, 19342, 19343, 19344, 19345, 19346, 19347, 19348, 19351, 19353, 19354, 19355, 19357, 19358, 19359, 19360, 19361, 19363, 19364, 19365, 19368, 19369, 19370, 19371, 19373, 19374, 19376, 19377, 19378, 19379, 19381, 19382, 19383, 19385, 19386, 19387, 19388, 19390, 19393, 19394, 19396, 19397, 19398, 19400, 19401, 19402, 19403, 19405, 19406, 19407, 19408, 19410, 19411, 19412, 19414, 19415, 19416, 19417, 19418, 19421, 19422, 19423, 19425, 19429, 19430, 19431, 19432, 19446, 19448, 19449, 19450, 19452, 19453, 19455, 19456, 19457, 19458, 19459, 19462, 19463, 19465, 19466, 19468, 19469, 19470, 19471, 19472, 19473, 19474, 19477, 19478, 19480, 19481, 19482, 19483, 19484, 19486, 19488, 19489, 19490, 19491, 19494, 19495, 19496, 19498, 19500, 19501, 19502, 19503, 19504, 19505, 19506, 19507, 19508, 19509, 19511, 19512, 19513, 19514, 19516, 19517, 19518, 19519, 19520, 19521, 19523, 19524, 19525, 19526, 19529, 19531, 19532, 19533, 19535, 19537, 19538, 19539, 19540, 19542, 19543, 19544, 19545, 19547, 19548, 19549, 19551, 19552, 19553, 19555, 19556, 19557, 19558, 19559, 19560, 19561, 19562, 19563, 19564, 19566, 19568, 19569, 19570, 19571, 19572, 19573, 19576, 19577, 19579, 19580, 19581, 19583, 19586, 19588, 19589, 19590, 19591, 19592, 19593, 19594, 19595, 19596, 19598, 19599, 19600, 19602, 19603, 19604, 19605, 19606, 19607, 19608, 19609, 19610, 19611, 19612, 19613, 19614, 19617, 19618, 19620, 19621, 19622, 19623, 19624, 19625, 19626, 19629, 19630, 19632, 19633, 19635, 19636, 19637, 19638, 19639, 19640, 19641, 19643, 19645, 19646, 19647, 19648, 19649, 19651, 19653, 19654, 19655, 19656, 19657, 19658, 19659, 19660, 19661, 19662, 39931, 39952, 39954, 429001, 429002, 429003, 429004, 429005, 429006, 429007, 429008, 429009, 429010, 429011);

-- Sync Gobject Data
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300, `spawn_flags` = 0, `animprogress` = 100 WHERE `id` IN (176584, 176639);

-- Update Counters
UPDATE `pool_template` SET `max_limit`=9 WHERE `entry`=1260;
UPDATE `pool_template` SET `max_limit`=15 WHERE `entry`=1267;
UPDATE `pool_template` SET `max_limit`=7 WHERE `entry`=1221;
UPDATE `pool_template` SET `max_limit`=12 WHERE `entry`=1228;
UPDATE `pool_template` SET `max_limit`=14 WHERE `entry`=1242;
UPDATE `pool_template` SET `max_limit`=12 WHERE `entry`=1301;
UPDATE `pool_template` SET `max_limit`=21 WHERE `entry`=1212;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
