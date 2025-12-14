DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230616210153');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230616210153');
-- Add your query below.


-- Mountain Silversage (176586, 176640)
SET @OGUID = 66716;

-- Correct position of Mountain Silversage in Un'Goro Crater (position is off by 1.38864 yards).
UPDATE `gameobject` SET `position_x`=-6446.52, `position_y`=-2034.81, `position_z`=-244.469, `orientation`=1.91986, `rotation0`=0, `rotation1`=0, `rotation2`=0.819152, `rotation3`=0.573577 WHERE `guid`=19754;

-- Correct position of Mountain Silversage in Burning Steppes (position is off by 0.389482 yards).
UPDATE `gameobject` SET `position_x`=-7503.81, `position_y`=-750.34, `position_z`=214.666, `orientation`=6.19592, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0436192, `rotation3`=0.999048 WHERE `guid`=19668;

-- Correct position of Mountain Silversage in Burning Steppes (position is off by 0.993467 yards).
UPDATE `gameobject` SET `position_x`=-7735.01, `position_y`=-2792.08, `position_z`=164.4, `orientation`=2.70526, `rotation0`=0, `rotation1`=0, `rotation2`=0.976295, `rotation3`=0.216442 WHERE `guid`=19746;

-- Correct position of Mountain Silversage in Un'Goro Crater (position is off by 0.00976563 yards).
UPDATE `gameobject` SET `position_x`=-6960.87, `position_y`=-2322.74, `position_z`=-224.537, `orientation`=3.22886, `rotation0`=0, `rotation1`=0, `rotation2`=-0.999048, `rotation3`=0.0436193 WHERE `guid`=16625;

-- Correct position of Mountain Silversage in Un'Goro Crater (position is off by 1.25987 yards).
UPDATE `gameobject` SET `position_x`=-7952.57, `position_y`=-2037.04, `position_z`=-245.416, `orientation`=1.79769, `rotation0`=0, `rotation1`=0, `rotation2`=0.782608, `rotation3`=0.622515 WHERE `guid`=19682;

-- Correct position of Mountain Silversage in Un'Goro Crater (position is off by 0.983162 yards).
UPDATE `gameobject` SET `position_x`=-6785.28, `position_y`=-2261.36, `position_z`=-243.692, `orientation`=4.69494, `rotation0`=0, `rotation1`=0, `rotation2`=-0.71325, `rotation3`=0.70091 WHERE `guid`=19807;

-- Correct position of Mountain Silversage in Un'Goro Crater (position is off by 0.370842 yards).
UPDATE `gameobject` SET `position_x`=-8053.94, `position_y`=-1734.27, `position_z`=-244.247, `orientation`=0.0349062, `rotation0`=0, `rotation1`=0, `rotation2`=0.0174522, `rotation3`=0.999848 WHERE `guid`=19782;

-- Correct position of Mountain Silversage in Un'Goro Crater (position is off by 1.12003 yards).
UPDATE `gameobject` SET `position_x`=-7288.34, `position_y`=-1226.62, `position_z`=-241.659, `orientation`=4.29351, `rotation0`=0, `rotation1`=0, `rotation2`=-0.83867, `rotation3`=0.54464 WHERE `guid`=19828;

-- Correct position of Mountain Silversage in Un'Goro Crater (position is off by 0.993697 yards).
UPDATE `gameobject` SET `position_x`=-6337.44, `position_y`=-916.593, `position_z`=-243.335, `orientation`=1.01229, `rotation0`=0, `rotation1`=0, `rotation2`=0.484809, `rotation3`=0.87462 WHERE `guid`=19826;

-- Correct position of Mountain Silversage in Burning Steppes (position is off by 1.02372 yards).
UPDATE `gameobject` SET `position_x`=-8334.38, `position_y`=-2438.24, `position_z`=203.358, `orientation`=4.45059, `rotation0`=0, `rotation1`=0, `rotation2`=-0.793353, `rotation3`=0.608762 WHERE `guid`=19806;

-- Correct position of Mountain Silversage in Azshara (position is off by 3.68112 yards).
UPDATE `gameobject` SET `position_x`=3507.2, `position_y`=-4555.06, `position_z`=131.419, `orientation`=0.314158, `rotation0`=0, `rotation1`=0, `rotation2`=0.156434, `rotation3`=0.987688 WHERE `guid`=39936;

-- Correct position of Mountain Silversage in Un'Goro Crater (position is off by 1.18737 yards).
UPDATE `gameobject` SET `position_x`=-7110.91, `position_y`=-1494.33, `position_z`=-247.364, `orientation`=0.558504, `rotation0`=0, `rotation1`=0, `rotation2`=0.275637, `rotation3`=0.961262 WHERE `guid`=19715;

-- Correct position of Mountain Silversage in Un'Goro Crater (position is off by 0.931602 yards).
UPDATE `gameobject` SET `position_x`=-6697.92, `position_y`=-459.107, `position_z`=-241.747, `orientation`=4.06662, `rotation0`=0, `rotation1`=0, `rotation2`=-0.894934, `rotation3`=0.446199 WHERE `guid`=19681;

-- Correct position of Mountain Silversage in Un'Goro Crater (position is off by 0.581246 yards).
UPDATE `gameobject` SET `position_x`=-6910.87, `position_y`=-371.391, `position_z`=-244.41, `orientation`=0.837757, `rotation0`=0, `rotation1`=0, `rotation2`=0.406736, `rotation3`=0.913546 WHERE `guid`=19750;

-- Correct position of Mountain Silversage in Un'Goro Crater (position is off by 1.03276 yards).
UPDATE `gameobject` SET `position_x`=-7078.44, `position_y`=-1199.77, `position_z`=-248.4, `orientation`=1.62316, `rotation0`=0, `rotation1`=0, `rotation2`=0.725374, `rotation3`=0.688355 WHERE `guid`=19747;

-- Missing Mountain Silversage spawns in Azshara.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 176586, 1, 4114.49, -5077.12, 147.331, 1.06465, 0, 0, 0.507538, 0.861629, 300, 300, 1, 100, 0, 10), 
(@OGUID+2, 176586, 1, 4689.2, -5365.06, 119.033, 5.42797, 0, 0, -0.414693, 0.909961, 300, 300, 1, 100, 0, 10), 
(@OGUID+3, 176586, 1, 3427.44, -4949.41, 147.959, 0.104719, 0, 0, 0.0523357, 0.99863, 300, 300, 1, 100, 0, 10), 
(@OGUID+4, 176586, 1, 2516.26, -6161.09, 113.564, 2.65289, 0, 0, 0.970295, 0.241925, 300, 300, 1, 100, 0, 10), 
(@OGUID+5, 176586, 1, 2546.52, -6899.08, 147.118, 0.0174525, 0, 0, 0.00872612, 0.999962, 300, 300, 1, 100, 0, 10),
(@OGUID+6, 176586, 1, 3666.04, -4959.06, 139.955, 0.261798, 0, 0, 0.130526, 0.991445, 300, 300, 1, 100, 0, 10),
(@OGUID+7, 176586, 1, 3736.97, -4757.26, 146.845, 4.85202, 0, 0, -0.656058, 0.75471, 300, 300, 1, 100, 0, 10),
(@OGUID+8, 176586, 1, 4186.38, -5703.56, 138.637, 2.68781, 0, 0, 0.97437, 0.224951, 300, 300, 1, 100, 0, 10),
(@OGUID+9, 176586, 1, 4193.3, -5288.64, 128.91, 4.64258, 0, 0, -0.731354, 0.681998, 300, 300, 1, 100, 0, 10),
(@OGUID+10, 176586, 1, 4325.66, -5795.31, 116.088, 1.67551, 0, 0, 0.743144, 0.669131, 300, 300, 1, 100, 0, 10),
(@OGUID+11, 176586, 1, 4401.51, -7315.7, 117.772, 5.34071, 0, 0, -0.45399, 0.891007, 300, 300, 1, 100, 0, 10),
(@OGUID+12, 176586, 1, 4440.81, -5607.32, 120.73, 6.16101, 0, 0, -0.0610485, 0.998135, 300, 300, 1, 100, 0, 10);

-- Missing Mountain Silversage spawns in Burning Steppes.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+13, 176586, 0, -7638.9, -1553.96, 166.204, 2.80998, 0, 0, 0.986285, 0.16505, 300, 300, 1, 100, 0, 10), 
(@OGUID+14, 176586, 0, -7815.3, -2636, 217.573, 3.76991, 0, 0, -0.951056, 0.309017, 300, 300, 1, 100, 0, 10), 
(@OGUID+15, 176586, 0, -8133.24, -917.333, 159.804, 0.349065, 0, 0, 0.173648, 0.984808, 300, 300, 1, 100, 0, 10), 
(@OGUID+16, 176586, 0, -8287.38, -1688.54, 159.236, 2.46091, 0, 0, 0.942641, 0.333808, 300, 300, 1, 100, 0, 10), 
(@OGUID+17, 176586, 0, -7622.81, -3033.84, 162.621, 0.174532, 0, 0, 0.0871553, 0.996195, 300, 300, 1, 100, 0, 10), 
(@OGUID+18, 176586, 0, -7896.6, -2558.81, 219.946, 3.14159, 0, 0, -1, 0, 300, 300, 1, 100, 0, 10), 
(@OGUID+19, 176586, 0, -7778.96, -2550.54, 170.852, 2.87979, 0, 0, 0.991445, 0.130528, 300, 300, 1, 100, 0, 10), 
(@OGUID+20, 176586, 0, -8442.42, -1276.31, 223.907, 5.63741, 0, 0, -0.317305, 0.948324, 300, 300, 1, 100, 0, 10),
(@OGUID+21, 176586, 0, -8368.66, -1856.81, 191.655, 4.27606, 0, 0, -0.843391, 0.5373, 300, 300, 1, 100, 0, 10),
(@OGUID+22, 176586, 0, -8302.04, -1349.66, 196.797, 2.9845, 0, 0, 0.996917, 0.0784664, 300, 300, 1, 100, 0, 10),
(@OGUID+23, 176586, 0, -8276.53, -2798.92, 167.143, 0.855211, 0, 0, 0.414693, 0.909961, 300, 300, 1, 100, 0, 10),
(@OGUID+24, 176586, 0, -8177.69, -3032.28, 162.586, 1.98967, 0, 0, 0.83867, 0.54464, 300, 300, 1, 100, 0, 10),
(@OGUID+25, 176586, 0, -7876.2, -2967.53, 148.748, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 1, 100, 0, 10),
(@OGUID+26, 176586, 0, -7813.84, -2716.66, 173.887, 2.07694, 0, 0, 0.861629, 0.507539, 300, 300, 1, 100, 0, 10),
(@OGUID+27, 176586, 0, -7805.19, -1384.86, 165.742, 4.7473, 0, 0, -0.694658, 0.71934, 300, 300, 1, 100, 0, 10),
(@OGUID+28, 176586, 0, -7641.99, -1764.1, 161.243, 0.750491, 0, 0, 0.366501, 0.930418, 300, 300, 1, 100, 0, 10),
(@OGUID+29, 176586, 0, -7569.65, -1400.24, 170.311, 6.12611, 0, 0, -0.0784588, 0.996917, 300, 300, 1, 100, 0, 10),
(@OGUID+30, 176586, 0, -7547.46, -2402.21, 169.371, 1.83259, 0, 0, 0.793353, 0.608762, 300, 300, 1, 100, 0, 10),
(@OGUID+31, 176586, 0, -7536.3, -2822.75, 161.614, 0.977383, 0, 0, 0.469471, 0.882948, 300, 300, 1, 100, 0, 10),
(@OGUID+32, 176586, 0, -7508.32, -2284.06, 180.768, 5.02655, 0, 0, -0.587785, 0.809017, 300, 300, 1, 100, 0, 10),
(@OGUID+33, 176586, 0, -7491.24, -1952.35, 196.606, 6.24828, 0, 0, -0.0174522, 0.999848, 300, 300, 1, 100, 0, 10);

-- Missing Mountain Silversage spawns in Eastern Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+34, 176586, 0, 2245.04, -3049.81, 123.527, 5.79449, 0, 0, -0.241921, 0.970296, 300, 300, 1, 100, 0, 10), 
(@OGUID+35, 176586, 0, 2223.48, -4782.46, 113.655, 5.13127, 0, 0, -0.544639, 0.838671, 300, 300, 1, 100, 0, 10), 
(@OGUID+36, 176586, 0, 2025.9, -2715.96, 96.1808, 2.19911, 0, 0, 0.891006, 0.453991, 300, 300, 1, 100, 0, 10), 
(@OGUID+37, 176586, 0, 2577.55, -5107.67, 100.779, 1.16937, 0, 0, 0.551936, 0.833886, 300, 300, 1, 100, 0, 10), 
(@OGUID+38, 176586, 0, 2617.73, -4813.42, 113.094, 6.14356, 0, 0, -0.0697556, 0.997564, 300, 300, 1, 100, 0, 10), 
(@OGUID+39, 176586, 0, 2621.44, -5555.54, 171.376, 4.83456, 0, 0, -0.66262, 0.748956, 300, 300, 1, 100, 0, 10), 
(@OGUID+40, 176586, 0, 2249.72, -4420.42, 132.854, 4.50295, 0, 0, -0.777145, 0.629321, 300, 300, 1, 100, 0, 10), 
(@OGUID+41, 176586, 0, 2631.87, -5314.69, 168.59, 1.51844, 0, 0, 0.688354, 0.725374, 300, 300, 1, 100, 0, 10), 
(@OGUID+42, 176586, 0, 2626.87, -5270.43, 135.877, 1.95477, 0, 0, 0.829038, 0.559193, 300, 300, 1, 100, 0, 10), 
(@OGUID+43, 176586, 0, 2421.2, -3861.51, 206.033, 3.22886, 0, 0, -0.999048, 0.0436193, 300, 300, 1, 100, 0, 10), 
(@OGUID+44, 176586, 0, 2487.21, -3614.84, 188.068, 5.14872, 0, 0, -0.537299, 0.843392, 300, 300, 1, 100, 0, 10), 
(@OGUID+45, 176586, 0, 2866.6, -5421.66, 173.446, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 1, 100, 0, 10), 
(@OGUID+46, 176586, 0, 2682.23, -3537.49, 129.73, 4.04917, 0, 0, -0.898793, 0.438373, 300, 300, 1, 100, 0, 10), 
(@OGUID+47, 176586, 0, 1789.25, -2739.28, 89.1006, 2.1293, 0, 0, 0.874619, 0.48481, 300, 300, 1, 100, 0, 10),
(@OGUID+48, 176586, 0, 1875.06, -4781.59, 123.595, 5.23599, 0, 0, -0.5, 0.866025, 300, 300, 1, 100, 0, 10),
(@OGUID+49, 176586, 0, 2258.02, -5386.99, 92.2303, 0.349065, 0, 0, 0.173648, 0.984808, 300, 300, 1, 100, 0, 10),
(@OGUID+50, 176586, 0, 2276.97, -4188.7, 119.793, 4.81711, 0, 0, -0.66913, 0.743145, 300, 300, 1, 100, 0, 10),
(@OGUID+51, 176586, 0, 2312.78, -3637.35, 182.334, 3.64774, 0, 0, -0.968147, 0.250381, 300, 300, 1, 100, 0, 10),
(@OGUID+52, 176586, 0, 2866.03, -5069.95, 121.89, 5.35816, 0, 0, -0.446198, 0.894935, 300, 300, 1, 100, 0, 10),
(@OGUID+53, 176586, 0, 3132.67, -4361.14, 139.667, 4.13643, 0, 0, -0.878817, 0.47716, 300, 300, 1, 100, 0, 10);

-- Missing Mountain Silversage spawns in Un'Goro Crater.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+54, 176586, 1, -7116.87, -1231.23, -183.724, 3.57793, 0, 0, -0.976295, 0.216442, 300, 300, 1, 100, 0, 10), 
(@OGUID+55, 176586, 1, -7150.62, -1368.17, -180.883, 5.34071, 0, 0, -0.45399, 0.891007, 300, 300, 1, 100, 0, 10), 
(@OGUID+56, 176586, 1, -6214.53, -1342.51, -216.418, 5.81195, 0, 0, -0.233445, 0.97237, 300, 300, 1, 100, 0, 10), 
(@OGUID+57, 176586, 1, -8134.07, -1602.22, -223.076, 4.62512, 0, 0, -0.737277, 0.675591, 300, 300, 1, 100, 0, 10),
(@OGUID+58, 176586, 1, -8054.66, -934.592, -243.938, 0.296705, 0, 0, 0.147809, 0.989016, 300, 300, 1, 100, 0, 10),
(@OGUID+59, 176586, 1, -7908.18, -535.407, -231.766, 5.88176, 0, 0, -0.199368, 0.979925, 300, 300, 1, 100, 0, 10),
(@OGUID+60, 176586, 1, -7696.97, -2209.91, -241.955, 6.12611, 0, 0, -0.0784588, 0.996917, 300, 300, 1, 100, 0, 10),
(@OGUID+61, 176586, 1, -7690.37, -464.763, -255.672, 4.71239, 0, 0, -0.707107, 0.707107, 300, 300, 1, 100, 0, 10),
(@OGUID+62, 176586, 1, -7615.53, -2261.98, -243.478, 1.58825, 0, 0, 0.71325, 0.70091, 300, 300, 1, 100, 0, 10),
(@OGUID+63, 176586, 1, -7445.26, -2320.93, -226.268, 0.488691, 0, 0, 0.241921, 0.970296, 300, 300, 1, 100, 0, 10),
(@OGUID+64, 176586, 1, -7248.11, -1458.46, -223.329, 3.83973, 0, 0, -0.939692, 0.34202, 300, 300, 1, 100, 0, 10),
(@OGUID+65, 176586, 1, -7203.75, -310.285, -224.031, 3.78737, 0, 0, -0.948323, 0.317306, 300, 300, 1, 100, 0, 10),
(@OGUID+66, 176586, 1, -7149.01, -1414.98, -228.987, 6.16101, 0, 0, -0.0610485, 0.998135, 300, 300, 1, 100, 0, 10);

-- Missing Mountain Silversage spawns in Winterspring.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+67, 176586, 1, 6882.36, -2716.21, 588.838, 1.90241, 0, 0, 0.814116, 0.580703, 300, 300, 1, 100, 0, 10), 
(@OGUID+68, 176586, 1, 5056.1, -4928.05, 889.552, 0.331611, 0, 0, 0.165047, 0.986286, 300, 300, 1, 100, 0, 10), 
(@OGUID+69, 176586, 1, 6775.71, -5208.24, 764.705, 2.28638, 0, 0, 0.909961, 0.414694, 300, 300, 1, 100, 0, 10), 
(@OGUID+70, 176586, 1, 6447.65, -3710.78, 715.518, 5.53269, 0, 0, -0.366501, 0.930418, 300, 300, 1, 100, 0, 10), 
(@OGUID+71, 176586, 1, 6394.99, -2627.12, 588.853, 3.50812, 0, 0, -0.983254, 0.182238, 300, 300, 1, 100, 0, 10), 
(@OGUID+72, 176586, 1, 6789.77, -4042.01, 708.498, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 1, 100, 0, 10), 
(@OGUID+73, 176586, 1, 6983.7, -4332.11, 775.726, 0.174532, 0, 0, 0.0871553, 0.996195, 300, 300, 1, 100, 0, 10), 
(@OGUID+74, 176586, 1, 7010.93, -4831.64, 717.759, 4.55531, 0, 0, -0.760406, 0.649449, 300, 300, 1, 100, 0, 10), 
(@OGUID+75, 176586, 1, 5699.15, -5011.17, 810.042, 5.44543, 0, 0, -0.406736, 0.913546, 300, 300, 1, 100, 0, 10), 
(@OGUID+76, 176586, 1, 5474.26, -4839.97, 851.688, 0.453785, 0, 0, 0.224951, 0.97437, 300, 300, 1, 100, 0, 10), 
(@OGUID+77, 176586, 1, 6924.92, -4304.24, 767.658, 2.67035, 0, 0, 0.972369, 0.233448, 300, 300, 1, 100, 0, 10), 
(@OGUID+78, 176586, 1, 5232.98, -5020.01, 874.759, 6.00393, 0, 0, -0.139173, 0.990268, 300, 300, 1, 100, 0, 10), 
(@OGUID+79, 176586, 1, 4963.6, -4681.59, 896.602, 1.55334, 0, 0, 0.700909, 0.713251, 300, 300, 1, 100, 0, 10),
(@OGUID+80, 176586, 1, 5658.23, -4443.14, 792.11, 0.890117, 0, 0, 0.430511, 0.902586, 300, 300, 1, 100, 0, 10),
(@OGUID+81, 176586, 1, 5814.38, -4524.75, 801.705, 3.03684, 0, 0, 0.998629, 0.0523532, 300, 300, 1, 100, 0, 10),
(@OGUID+82, 176586, 1, 5872.38, -4990.16, 839.954, 3.57793, 0, 0, -0.976295, 0.216442, 300, 300, 1, 100, 0, 10),
(@OGUID+83, 176586, 1, 6314.28, -2348.73, 587.45, 3.7001, 0, 0, -0.961261, 0.27564, 300, 300, 1, 100, 0, 10),
(@OGUID+84, 176586, 1, 6319, -3988.07, 695.764, 4.7473, 0, 0, -0.694658, 0.71934, 300, 300, 1, 100, 0, 10),
(@OGUID+85, 176586, 1, 6382.77, -3143.01, 616.405, 3.73501, 0, 0, -0.956305, 0.292372, 300, 300, 1, 100, 0, 10),
(@OGUID+86, 176586, 1, 6384.57, -3255.25, 618.608, 5.77704, 0, 0, -0.25038, 0.968148, 300, 300, 1, 100, 0, 10),
(@OGUID+87, 176586, 1, 6386.13, -3480.97, 684.966, 2.75761, 0, 0, 0.981627, 0.190812, 300, 300, 1, 100, 0, 10),
(@OGUID+88, 176586, 1, 6502.88, -3643.28, 728.097, 0.314158, 0, 0, 0.156434, 0.987688, 300, 300, 1, 100, 0, 10),
(@OGUID+89, 176586, 1, 6672.38, -5135.28, 784.418, 4.45059, 0, 0, -0.793353, 0.608762, 300, 300, 1, 100, 0, 10),
(@OGUID+90, 176586, 1, 6696.07, -2752.15, 585.565, 5.88176, 0, 0, -0.199368, 0.979925, 300, 300, 1, 100, 0, 10),
(@OGUID+91, 176586, 1, 6807.96, -4929.61, 755.522, 5.74214, 0, 0, -0.267238, 0.963631, 300, 300, 1, 100, 0, 10),
(@OGUID+92, 176586, 1, 6879.18, -2828.45, 627.006, 0.837757, 0, 0, 0.406736, 0.913546, 300, 300, 1, 100, 0, 10),
(@OGUID+93, 176586, 1, 6994.66, -4421.91, 727.445, 1.8675, 0, 0, 0.803857, 0.594823, 300, 300, 1, 100, 0, 10),
(@OGUID+94, 176586, 1, 7141.25, -4721.84, 711.464, 3.15906, 0, 0, -0.999962, 0.00873464, 300, 300, 1, 100, 0, 10),
(@OGUID+95, 176586, 1, 7318.64, -4229.07, 741.845, 1.44862, 0, 0, 0.66262, 0.748956, 300, 300, 1, 100, 0, 10),
(@OGUID+96, 176586, 1, 7479.08, -5105.44, 741.617, 4.15388, 0, 0, -0.874619, 0.48481, 300, 300, 1, 100, 0, 10),
(@OGUID+97, 176586, 1, 7707.92, -4108.28, 734.29, 0.942477, 0, 0, 0.45399, 0.891007, 300, 300, 1, 100, 0, 10);

-- Missing Mountain Silversage spawns in Felwood.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+98, 176640, 1, 6178.8, -1065.77, 385.206, 4.86947, 0, 0, -0.649447, 0.760406, 1800, 1800, 1, 100, 0, 10),
(@OGUID+99, 176640, 1, 6156.16, -1839.16, 575.645, 0.733038, 0, 0, 0.358368, 0.93358, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+100, 176640, 1, 6175.16, -650.291, 429.208, 5.74214, 0, 0, -0.267238, 0.963631, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+101, 176640, 1, 5426.05, -809.724, 386.836, 2.9845, 0, 0, 0.996917, 0.0784664, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+102, 176640, 1, 4430.56, -475.128, 328.786, 3.54302, 0, 0, -0.979924, 0.19937, 300, 300, 1, 100, 0, 10),
(@OGUID+103, 176640, 1, 4788.45, -339.211, 361.536, 4.7473, 0, 0, -0.694658, 0.71934, 300, 300, 1, 100, 0, 10),
(@OGUID+104, 176640, 1, 5344.76, -954.472, 390.509, 3.50812, 0, 0, -0.983254, 0.182238, 300, 300, 1, 100, 0, 10),
(@OGUID+105, 176640, 1, 5597.5, -1154.5, 407.204, 5.3058, 0, 0, -0.469471, 0.882948, 300, 300, 1, 100, 0, 10),
(@OGUID+106, 176640, 1, 5773.74, -808.852, 411.437, 3.57793, 0, 0, -0.976295, 0.216442, 300, 300, 1, 100, 0, 10),
(@OGUID+107, 176640, 1, 5859.85, -1279.18, 415.842, 3.78737, 0, 0, -0.948323, 0.317306, 300, 300, 1, 100, 0, 10),
(@OGUID+108, 176640, 1, 5961.15, -1084.52, 436.177, 3.17653, 0, 0, -0.999847, 0.0174693, 300, 300, 1, 100, 0, 10),
(@OGUID+109, 176640, 1, 6180.62, -1422.32, 406.45, 4.95674, 0, 0, -0.615661, 0.788011, 300, 300, 1, 100, 0, 10),
(@OGUID+110, 176640, 1, 6253.29, -617.998, 478.346, 2.51327, 0, 0, 0.951056, 0.309017, 300, 300, 1, 100, 0, 10),
(@OGUID+111, 176640, 1, 6291.3, -2068.77, 595.53, 2.65289, 0, 0, 0.970295, 0.241925, 300, 300, 1, 100, 0, 10),
(@OGUID+112, 176640, 1, 6318.31, -1694.08, 503.783, 2.40855, 0, 0, 0.93358, 0.358368, 300, 300, 1, 100, 0, 10),
(@OGUID+113, 176640, 1, 6714.69, -1660.98, 501.72, 2.14675, 0, 0, 0.878817, 0.47716, 300, 300, 1, 100, 0, 10),
(@OGUID+114, 176640, 1, 6950.7, -2005.28, 604.186, 3.94445, 0, 0, -0.920505, 0.390732, 300, 300, 1, 100, 0, 10);

-- Missing Mountain Silversage spawns in Western Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+115, 176586, 0, 1690.23, -2477.8, 99.8174, 3.21142, 0, 0, -0.999391, 0.0349061, 1800, 1800, 1, 100, 0, 10),
(@OGUID+116, 176586, 0, 2907.65, -1319.5, 167.159, 5.42797, 0, 0, -0.414693, 0.909961, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+117, 176586, 0, 1861.67, -1889.43, 99.0528, 3.3685, 0, 0, -0.993571, 0.113208, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+118, 176586, 0, 1862.28, -1242.78, 73.6229, 1.01229, 0, 0, 0.484809, 0.87462, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+119, 176586, 0, 1963.57, -2147.67, 83.2375, 3.59538, 0, 0, -0.97437, 0.224951, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+120, 176586, 0, 2201.24, -1801.18, 72.0393, 1.25664, 0, 0, 0.587785, 0.809017, 1800, 1800, 1, 100, 0, 10); 

-- Missing Mountain Silversage spawns in Silithus.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+121, 176586, 1, -7620.16, 202.188, 28.3698, 5.55015, 0, 0, -0.358368, 0.93358, 300, 300, 1, 100, 0, 10),
(@OGUID+122, 176586, 1, -7568.76, 1891.56, 33.3759, 4.41568, 0, 0, -0.803857, 0.594823, 300, 300, 1, 100, 0, 10),
(@OGUID+123, 176586, 1, -6708.03, 1935.4, 32.7525, 1.72787, 0, 0, 0.760406, 0.649449, 300, 300, 1, 100, 0, 10),
(@OGUID+124, 176586, 1, -6196.8, 1559.43, 30.4003, 2.00713, 0, 0, 0.843391, 0.5373, 300, 300, 1, 100, 0, 10);

-- Create new pool to hold Mountain Silversage spawns in Felwood.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(401, 1, 'Mountain Silversages in Felwood', 0, 10);

-- Create new pool to hold Mountain Silversage spawns in Western Plaguelands.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(402, 1, 'Mountain Silversages in Western Plaguelands', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1243, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Azshara 52 objects total
(@OGUID+2, 1243, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Azshara 52 objects total
(@OGUID+3, 1243, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Azshara 52 objects total
(@OGUID+4, 1243, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Azshara 52 objects total
(@OGUID+5, 1243, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Azshara 52 objects total
(@OGUID+6, 1243, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Azshara 52 objects total
(@OGUID+7, 1243, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Azshara 52 objects total
(@OGUID+8, 1243, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Azshara 52 objects total
(@OGUID+9, 1243, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Azshara 52 objects total
(@OGUID+10, 1243, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Azshara 52 objects total
(@OGUID+11, 1243, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Azshara 52 objects total
(@OGUID+12, 1243, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Azshara 52 objects total
(@OGUID+13, 1302, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Burning Steppes 29 objects total
(@OGUID+14, 1302, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Burning Steppes 29 objects total
(@OGUID+15, 1302, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Burning Steppes 29 objects total
(@OGUID+16, 1302, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Burning Steppes 29 objects total
(@OGUID+17, 1302, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Burning Steppes 29 objects total
(@OGUID+18, 1302, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Burning Steppes 29 objects total
(@OGUID+19, 1302, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Burning Steppes 29 objects total
(@OGUID+20, 1302, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Burning Steppes 29 objects total
(@OGUID+21, 1302, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Burning Steppes 29 objects total
(@OGUID+22, 1302, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Burning Steppes 29 objects total
(@OGUID+23, 1302, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Burning Steppes 29 objects total
(@OGUID+24, 1302, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Burning Steppes 29 objects total
(@OGUID+25, 1302, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Burning Steppes 29 objects total
(@OGUID+26, 1302, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Burning Steppes 29 objects total
(@OGUID+27, 1302, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Burning Steppes 29 objects total
(@OGUID+28, 1302, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Burning Steppes 29 objects total
(@OGUID+29, 1302, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Burning Steppes 29 objects total
(@OGUID+30, 1302, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Burning Steppes 29 objects total
(@OGUID+31, 1302, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Burning Steppes 29 objects total
(@OGUID+32, 1302, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Burning Steppes 29 objects total
(@OGUID+33, 1302, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Burning Steppes 29 objects total
(@OGUID+34, 1269, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Eastern Plaguelands 11 objects total
(@OGUID+35, 1269, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Eastern Plaguelands 11 objects total
(@OGUID+36, 1269, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Eastern Plaguelands 11 objects total
(@OGUID+37, 1269, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Eastern Plaguelands 11 objects total
(@OGUID+38, 1269, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Eastern Plaguelands 11 objects total
(@OGUID+39, 1269, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Eastern Plaguelands 11 objects total
(@OGUID+40, 1269, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Eastern Plaguelands 11 objects total
(@OGUID+41, 1269, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Eastern Plaguelands 11 objects total
(@OGUID+42, 1269, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Eastern Plaguelands 11 objects total
(@OGUID+43, 1269, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Eastern Plaguelands 11 objects total
(@OGUID+44, 1269, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Eastern Plaguelands 11 objects total
(@OGUID+45, 1269, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Eastern Plaguelands 11 objects total
(@OGUID+46, 1269, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Eastern Plaguelands 11 objects total
(@OGUID+47, 1269, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Eastern Plaguelands 11 objects total
(@OGUID+48, 1269, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Eastern Plaguelands 11 objects total
(@OGUID+49, 1269, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Eastern Plaguelands 11 objects total
(@OGUID+50, 1269, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Eastern Plaguelands 11 objects total
(@OGUID+51, 1269, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Eastern Plaguelands 11 objects total
(@OGUID+52, 1269, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Eastern Plaguelands 11 objects total
(@OGUID+53, 1269, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Eastern Plaguelands 11 objects total
(@OGUID+54, 1218, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Ungoro 70 objects total
(@OGUID+55, 1218, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Ungoro 70 objects total
(@OGUID+56, 1218, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Ungoro 70 objects total
(@OGUID+57, 1218, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Ungoro 70 objects total
(@OGUID+58, 1218, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Ungoro 70 objects total
(@OGUID+59, 1218, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Ungoro 70 objects total
(@OGUID+60, 1218, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Ungoro 70 objects total
(@OGUID+61, 1218, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Ungoro 70 objects total
(@OGUID+62, 1218, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Ungoro 70 objects total
(@OGUID+63, 1218, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Ungoro 70 objects total
(@OGUID+64, 1218, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Ungoro 70 objects total
(@OGUID+65, 1218, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Ungoro 70 objects total
(@OGUID+66, 1218, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Ungoro 70 objects total
(@OGUID+67, 1237, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Winterspring 85 objects total
(@OGUID+68, 1237, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Winterspring 85 objects total
(@OGUID+69, 1237, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Winterspring 85 objects total
(@OGUID+70, 1237, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Winterspring 85 objects total
(@OGUID+71, 1237, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Winterspring 85 objects total
(@OGUID+72, 1237, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Winterspring 85 objects total
(@OGUID+73, 1237, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Winterspring 85 objects total
(@OGUID+74, 1237, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Winterspring 85 objects total
(@OGUID+75, 1237, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Winterspring 85 objects total
(@OGUID+76, 1237, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Winterspring 85 objects total
(@OGUID+77, 1237, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Winterspring 85 objects total
(@OGUID+78, 1237, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Winterspring 85 objects total
(@OGUID+79, 1237, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Winterspring 85 objects total
(@OGUID+80, 1237, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Winterspring 85 objects total
(@OGUID+81, 1237, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Winterspring 85 objects total
(@OGUID+82, 1237, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Winterspring 85 objects total
(@OGUID+83, 1237, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Winterspring 85 objects total
(@OGUID+84, 1237, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Winterspring 85 objects total
(@OGUID+85, 1237, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Winterspring 85 objects total
(@OGUID+86, 1237, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Winterspring 85 objects total
(@OGUID+87, 1237, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Winterspring 85 objects total
(@OGUID+88, 1237, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Winterspring 85 objects total
(@OGUID+89, 1237, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Winterspring 85 objects total
(@OGUID+90, 1237, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Winterspring 85 objects total
(@OGUID+91, 1237, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Winterspring 85 objects total
(@OGUID+92, 1237, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Winterspring 85 objects total
(@OGUID+93, 1237, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Winterspring 85 objects total
(@OGUID+94, 1237, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Winterspring 85 objects total
(@OGUID+95, 1237, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Winterspring 85 objects total
(@OGUID+96, 1237, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Winterspring 85 objects total
(@OGUID+97, 1237, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Winterspring 85 objects total
(@OGUID+98, 401, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversages in Felwood
(@OGUID+99, 401, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversages in Felwood
(@OGUID+100, 401, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversages in Felwood
(@OGUID+101, 401, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversages in Felwood
(@OGUID+102, 401, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversages in Felwood
(@OGUID+103, 401, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversages in Felwood
(@OGUID+104, 401, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversages in Felwood
(@OGUID+105, 401, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversages in Felwood
(@OGUID+106, 401, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversages in Felwood
(@OGUID+107, 401, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversages in Felwood
(@OGUID+108, 401, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversages in Felwood
(@OGUID+109, 401, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversages in Felwood
(@OGUID+110, 401, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversages in Felwood
(@OGUID+111, 401, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversages in Felwood
(@OGUID+112, 401, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversages in Felwood
(@OGUID+113, 401, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversages in Felwood
(@OGUID+114, 401, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversages in Felwood
(@OGUID+115, 402, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversages in Western Plaguelands
(@OGUID+116, 402, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversages in Western Plaguelands
(@OGUID+117, 402, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversages in Western Plaguelands
(@OGUID+118, 402, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversages in Western Plaguelands
(@OGUID+119, 402, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversages in Western Plaguelands
(@OGUID+120, 332, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversages in Silithus
(@OGUID+121, 1222, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversages in Silithus
(@OGUID+122, 1222, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversages in Silithus
(@OGUID+123, 1222, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversages in Silithus
(@OGUID+124, 1222, 0, 'Mountain Silversage', 0, 10); -- Mountain Silversages in Silithus

-- Correct Pools
UPDATE `pool_template` SET `description`='Mountain Silversage in Azshara' WHERE  `entry`=1243;
UPDATE `pool_template` SET `description`='Mountain Silversage in Burning Steppes' WHERE  `entry`=1302;
UPDATE `pool_template` SET `description`='Mountain Silversage in Eastern Plaguelands' WHERE  `entry`=1269;
UPDATE `pool_template` SET `description`='Mountain Silversage in Silithus' WHERE  `entry`=1222;
UPDATE `pool_template` SET `description`='Mountain Silversage in Ungoro Crater' WHERE  `entry`=1218;
UPDATE `pool_template` SET `description`='Mountain Silversage in Winterspring' WHERE  `entry`=1237;
UPDATE `pool_template` SET `description`='Mountain Silversage in Felwood' WHERE  `entry`=401;
UPDATE `pool_template` SET `description`='Mountain Silversage in Western Plaguelands' WHERE  `entry`=402;

-- Remove Custom Spawns (Non of these spawns exist in the sniff-db)
DELETE FROM `gameobject` WHERE `guid` IN (19751, 19790, 19748, 19697, 19663, 19664, 19665, 19666, 19669, 19670, 19671, 19672, 19673, 19674, 19675, 19676, 19677, 19678, 19680, 19683, 19684, 19685, 19688, 19689, 19690, 19691, 19692, 19693, 19694, 19695, 19696, 19698, 19699, 19700, 19701, 19703, 19704, 19705, 19707, 19708, 19709, 19710, 19711, 19712, 19714, 19716, 19717, 19718, 19719, 19720, 19721, 19722, 19723, 19724, 19726, 19727, 19728, 19729, 19730, 19731, 19732, 19733, 19735, 19736, 19738, 19740, 19741, 19742, 19743, 19744, 19745, 19749, 19752, 19753, 19755, 19756, 19757, 19759, 19760, 19761, 19762, 19763, 19764, 19765, 19766, 19767, 19768, 19769, 19770, 19771, 19772, 19773, 19774, 19775, 19776, 19777, 19778, 19779, 19780, 19781, 19783, 19784, 19785, 19786, 19787, 19788, 19789, 19791, 19792, 19793, 19794, 19795, 19796, 19797, 19798, 19799, 19800, 19801, 19802, 19803, 19804, 19805, 19808, 19809, 19810, 19811, 19812, 19813, 19814, 19815, 19817, 19818, 19819, 19820, 19821, 19822, 19823, 19824, 19825, 19829, 19830, 19831, 19832, 19833, 19834, 19835, 19836, 19837, 19843, 19844, 19845, 19846, 19848, 19849, 19850, 19851, 19852, 19853, 19854, 19855, 19856, 19857, 19858, 19859, 19860, 19861, 19862, 19863, 19864, 19865, 19866, 19867, 19869, 19870, 19871, 19872, 39955, 39956);
DELETE FROM `pool_gameobject` WHERE `guid` IN (19751, 19790, 19748, 19697, 19663, 19664, 19665, 19666, 19669, 19670, 19671, 19672, 19673, 19674, 19675, 19676, 19677, 19678, 19680, 19683, 19684, 19685, 19688, 19689, 19690, 19691, 19692, 19693, 19694, 19695, 19696, 19698, 19699, 19700, 19701, 19703, 19704, 19705, 19707, 19708, 19709, 19710, 19711, 19712, 19714, 19716, 19717, 19718, 19719, 19720, 19721, 19722, 19723, 19724, 19726, 19727, 19728, 19729, 19730, 19731, 19732, 19733, 19735, 19736, 19738, 19740, 19741, 19742, 19743, 19744, 19745, 19749, 19752, 19753, 19755, 19756, 19757, 19759, 19760, 19761, 19762, 19763, 19764, 19765, 19766, 19767, 19768, 19769, 19770, 19771, 19772, 19773, 19774, 19775, 19776, 19777, 19778, 19779, 19780, 19781, 19783, 19784, 19785, 19786, 19787, 19788, 19789, 19791, 19792, 19793, 19794, 19795, 19796, 19797, 19798, 19799, 19800, 19801, 19802, 19803, 19804, 19805, 19808, 19809, 19810, 19811, 19812, 19813, 19814, 19815, 19817, 19818, 19819, 19820, 19821, 19822, 19823, 19824, 19825, 19829, 19830, 19831, 19832, 19833, 19834, 19835, 19836, 19837, 19843, 19844, 19845, 19846, 19848, 19849, 19850, 19851, 19852, 19853, 19854, 19855, 19856, 19857, 19858, 19859, 19860, 19861, 19862, 19863, 19864, 19865, 19866, 19867, 19869, 19870, 19871, 19872, 39955, 39956);

-- Sync Gobject Data
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300, `spawn_flags` = 0, `animprogress` = 100 WHERE `id` IN (176586, 176640);

-- Update Counters
UPDATE `pool_template` SET `max_limit`=13 WHERE  `entry`=1269;
UPDATE `pool_template` SET `max_limit`=3 WHERE  `entry`=1222;
UPDATE `pool_template` SET `max_limit`=20 WHERE  `entry`=1237;
UPDATE `pool_template` SET `max_limit`=16 WHERE  `entry`=1218;
UPDATE `pool_template` SET `max_limit`=12 WHERE  `entry`=1302;
UPDATE `pool_template` SET `max_limit`=6 WHERE  `entry`=401;
UPDATE `pool_template` SET `max_limit`=3 WHERE  `entry`=402;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
