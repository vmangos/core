DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230617102432');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230617102432');
-- Add your query below.


-- Sungrass (142142, 176636)
SET @OGUID = 52495;

-- Correct position of Sungrass in Feralas (position is off by 0.865954 yards).
UPDATE `gameobject` SET `position_x`=-4714.79, `position_y`=1417.73, `position_z`=88.0768, `orientation`=3.3685, `rotation0`=0, `rotation1`=0, `rotation2`=-0.993571, `rotation3`=0.113208 WHERE `guid`=16270;

-- Correct position of Sungrass in Un'Goro Crater (position is off by 1.2367 yards).
UPDATE `gameobject` SET `position_x`=-7319.12, `position_y`=-1725.39, `position_z`=-271.619, `orientation`=0.366518, `rotation0`=0, `rotation1`=0, `rotation2`=0.182235, `rotation3`=0.983255 WHERE `guid`=16251;

-- Correct position of Sungrass in The Hinterlands (position is off by 0.64673 yards).
UPDATE `gameobject` SET `position_x`=95.6914, `position_y`=-2746.62, `position_z`=113.091, `orientation`=0.226892, `rotation0`=0, `rotation1`=0, `rotation2`=0.113203, `rotation3`=0.993572 WHERE `guid`=16279;

-- Correct position of Sungrass in Azshara (position is off by 0.628212 yards).
UPDATE `gameobject` SET `position_x`=3291.8, `position_y`=-4433.6, `position_z`=103.945, `orientation`=5.32326, `rotation0`=0, `rotation1`=0, `rotation2`=-0.461748, `rotation3`=0.887011 WHERE `guid`=16051;

-- Correct position of Sungrass in Burning Steppes (position is off by 1.79473 yards).
UPDATE `gameobject` SET `position_x`=-8040.43, `position_y`=-2923.46, `position_z`=133.134, `orientation`=4.67748, `rotation0`=0, `rotation1`=0, `rotation2`=-0.719339, `rotation3`=0.694659 WHERE `guid`=39958;

-- Correct position of Sungrass in Western Plaguelands (position is off by 0.472044 yards).
UPDATE `gameobject` SET `position_x`=1601.56, `position_y`=-1701.4, `position_z`=61.4415, `orientation`=3.194, `rotation0`=0, `rotation1`=0, `rotation2`=-0.999657, `rotation3`=0.0262016 WHERE `guid`=16233;

-- Correct position of Sungrass in Burning Steppes (position is off by 2.64882 yards).
UPDATE `gameobject` SET `position_x`=-7708.73, `position_y`=-2013.39, `position_z`=133.439, `orientation`=5.41052, `rotation0`=0, `rotation1`=0, `rotation2`=-0.422618, `rotation3`=0.906308 WHERE `guid`=39957;

-- Correct position of Sungrass in Burning Steppes (position is off by 0.557792 yards).
UPDATE `gameobject` SET `position_x`=-7905.47, `position_y`=-2443.7, `position_z`=133.659, `orientation`=5.77704, `rotation0`=0, `rotation1`=0, `rotation2`=-0.25038, `rotation3`=0.968148 WHERE `guid`=16106;

-- Correct position of Sungrass in Un'Goro Crater (position is off by 1.01779 yards).
UPDATE `gameobject` SET `position_x`=-7244.39, `position_y`=-948.767, `position_z`=-270.725, `orientation`=2.00713, `rotation0`=0, `rotation1`=0, `rotation2`=0.843391, `rotation3`=0.5373 WHERE `guid`=16188;

-- Correct position of Sungrass in Un'Goro Crater (position is off by 0.765831 yards).
UPDATE `gameobject` SET `position_x`=-7538.47, `position_y`=-974.738, `position_z`=-269.487, `orientation`=2.56563, `rotation0`=0, `rotation1`=0, `rotation2`=0.958819, `rotation3`=0.284016 WHERE `guid`=16266;

-- Correct position of Sungrass in The Hinterlands (position is off by 0.139838 yards).
UPDATE `gameobject` SET `position_x`=410.458, `position_y`=-3654.1, `position_z`=122.935, `orientation`=1.01229, `rotation0`=0, `rotation1`=0, `rotation2`=0.484809, `rotation3`=0.87462 WHERE `guid`=16116;

-- Correct position of Sungrass in Eastern Plaguelands (position is off by 0.000991821 yards).
UPDATE `gameobject` SET `position_x`=1631.8, `position_y`=-4090.24, `position_z`=151.422, `orientation`=6.14356, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0697556, `rotation3`=0.997564 WHERE `guid`=13687;

-- Correct position of Sungrass in Burning Steppes (position is off by 1.13192 yards).
UPDATE `gameobject` SET `position_x`=-7877.66, `position_y`=-2894.94, `position_z`=133.865, `orientation`=1.44862, `rotation0`=0, `rotation1`=0, `rotation2`=0.66262, `rotation3`=0.748956 WHERE `guid`=16052;

-- Correct position of Sungrass in The Hinterlands (position is off by 1.18779 yards).
UPDATE `gameobject` SET `position_x`=209.117, `position_y`=-3841.06, `position_z`=138.017, `orientation`=4.45059, `rotation0`=0, `rotation1`=0, `rotation2`=-0.793353, `rotation3`=0.608762 WHERE `guid`=16121;

-- Correct position of Sungrass in The Hinterlands (position is off by 0.788417 yards).
UPDATE `gameobject` SET `position_x`=-213.704, `position_y`=-2716.72, `position_z`=118.101, `orientation`=3.26377, `rotation0`=0, `rotation1`=0, `rotation2`=-0.998135, `rotation3`=0.0610518 WHERE `guid`=16235;

-- Correct position of Sungrass in The Hinterlands (position is off by 0.595842 yards).
UPDATE `gameobject` SET `position_x`=26.8899, `position_y`=-2417.52, `position_z`=126.043, `orientation`=3.17653, `rotation0`=0, `rotation1`=0, `rotation2`=-0.999847, `rotation3`=0.0174693 WHERE `guid`=16276;

-- Correct position of Sungrass in The Hinterlands (position is off by 0.143511 yards).
UPDATE `gameobject` SET `position_x`=66.809, `position_y`=-3028.1, `position_z`=133.7, `orientation`=0.279252, `rotation0`=0, `rotation1`=0, `rotation2`=0.139173, `rotation3`=0.990268 WHERE `guid`=16049;

-- Correct position of Sungrass in The Hinterlands (position is off by 0.00100708 yards).
UPDATE `gameobject` SET `position_x`=150.503, `position_y`=-3022.87, `position_z`=128.218, `orientation`=1.53589, `rotation0`=0, `rotation1`=0, `rotation2`=0.694658, `rotation3`=0.71934 WHERE `guid`=16213;

-- Correct position of Sungrass in Western Plaguelands (position is off by 0.2196 yards).
UPDATE `gameobject` SET `position_x`=1866.11, `position_y`=-1349.8, `position_z`=61.0008, `orientation`=4.50295, `rotation0`=0, `rotation1`=0, `rotation2`=-0.777145, `rotation3`=0.629321 WHERE `guid`=16236;

-- Correct position of Sungrass in Blasted Lands (position is off by 0.978558 yards).
UPDATE `gameobject` SET `position_x`=-11117.9, `position_y`=-2746.65, `position_z`=15.9751, `orientation`=4.83456, `rotation0`=0, `rotation1`=0, `rotation2`=-0.66262, `rotation3`=0.748956 WHERE `guid`=16094;

-- Correct position of Sungrass in Blasted Lands (position is off by 1.5704 yards).
UPDATE `gameobject` SET `position_x`=-11318.4, `position_y`=-3361.68, `position_z`=7.85883, `orientation`=1.81514, `rotation0`=0, `rotation1`=0, `rotation2`=0.788011, `rotation3`=0.615662 WHERE `guid`=39996;

-- Correct position of Sungrass in Blasted Lands (position is off by 0.866322 yards).
UPDATE `gameobject` SET `position_x`=-11255.7, `position_y`=-3121.49, `position_z`=2.52145, `orientation`=4.04917, `rotation0`=0, `rotation1`=0, `rotation2`=-0.898793, `rotation3`=0.438373 WHERE `guid`=16228;

-- Correct position of Sungrass in The Hinterlands (position is off by 0.333605 yards).
UPDATE `gameobject` SET `position_x`=214.263, `position_y`=-3954.11, `position_z`=126.244, `orientation`=6.02139, `rotation0`=0, `rotation1`=0, `rotation2`=-0.130526, `rotation3`=0.991445 WHERE `guid`=16144;

-- Correct position of Sungrass in Feralas (position is off by 1.0113 yards).
UPDATE `gameobject` SET `position_x`=-4657.48, `position_y`=1604.65, `position_z`=115.776, `orientation`=4.27606, `rotation0`=0, `rotation1`=0, `rotation2`=-0.843391, `rotation3`=0.5373 WHERE `guid`=16067;

-- Correct position of Sungrass in The Hinterlands (position is off by 1.10482 yards).
UPDATE `gameobject` SET `position_x`=59.1708, `position_y`=-3926.92, `position_z`=143.609, `orientation`=6.0912, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0958452, `rotation3`=0.995396 WHERE `guid`=16158;

-- Correct position of Sungrass in The Hinterlands (position is off by 1.3919 yards).
UPDATE `gameobject` SET `position_x`=117.788, `position_y`=-2423.14, `position_z`=123.836, `orientation`=1.67551, `rotation0`=0, `rotation1`=0, `rotation2`=0.743144, `rotation3`=0.669131 WHERE `guid`=16117;

-- Correct position of Sungrass in Azshara (position is off by 4.30736 yards).
UPDATE `gameobject` SET `position_x`=2952.15, `position_y`=-4158.74, `position_z`=99.8019, `orientation`=3.61284, `rotation0`=0, `rotation1`=0, `rotation2`=-0.972369, `rotation3`=0.233448 WHERE `guid`=39938;

-- Correct position of Sungrass in Blasted Lands (position is off by 0.850277 yards).
UPDATE `gameobject` SET `position_x`=-11418.3, `position_y`=-2960.52, `position_z`=1.67087, `orientation`=3.90954, `rotation0`=0, `rotation1`=0, `rotation2`=-0.927183, `rotation3`=0.374608 WHERE `guid`=16030;

-- Correct position of Sungrass in Un'Goro Crater (position is off by 0.759091 yards).
UPDATE `gameobject` SET `position_x`=-6415.11, `position_y`=-1590.72, `position_z`=-270.786, `orientation`=5.72468, `rotation0`=0, `rotation1`=0, `rotation2`=-0.275637, `rotation3`=0.961262 WHERE `guid`=16286;

-- Correct position of Sungrass in Un'Goro Crater (position is off by 0.734737 yards).
UPDATE `gameobject` SET `position_x`=-6650.59, `position_y`=-1211.38, `position_z`=-272.218, `orientation`=5.88176, `rotation0`=0, `rotation1`=0, `rotation2`=-0.199368, `rotation3`=0.979925 WHERE `guid`=16181;

-- Correct position of Sungrass in Burning Steppes (position is off by 1.17238 yards).
UPDATE `gameobject` SET `position_x`=-8046.81, `position_y`=-2482.85, `position_z`=132.768, `orientation`=5.37562, `rotation0`=0, `rotation1`=0, `rotation2`=-0.438371, `rotation3`=0.898794 WHERE `guid`=16227;

-- Correct position of Sungrass in The Hinterlands (position is off by 1.53539 yards).
UPDATE `gameobject` SET `position_x`=-250.096, `position_y`=-3246.21, `position_z`=123.919, `orientation`=1.67551, `rotation0`=0, `rotation1`=0, `rotation2`=0.743144, `rotation3`=0.669131 WHERE `guid`=16269;

-- Correct position of Sungrass in Blasted Lands (position is off by 0.270359 yards).
UPDATE `gameobject` SET `position_x`=-11356, `position_y`=-2755.73, `position_z`=7.42946, `orientation`=2.65289, `rotation0`=0, `rotation1`=0, `rotation2`=0.970295, `rotation3`=0.241925 WHERE `guid`=16153;

-- Correct position of Sungrass in Azshara (position is off by 3.71135 yards).
UPDATE `gameobject` SET `position_x`=3282.92, `position_y`=-4192.48, `position_z`=106.894, `orientation`=5.49779, `rotation0`=0, `rotation1`=0, `rotation2`=-0.382683, `rotation3`=0.92388 WHERE `guid`=39940;

-- Correct position of Sungrass in Un'Goro Crater (position is off by 1.92522 yards).
UPDATE `gameobject` SET `position_x`=-7815.27, `position_y`=-1183.7, `position_z`=-261.473, `orientation`=1.16937, `rotation0`=0, `rotation1`=0, `rotation2`=0.551936, `rotation3`=0.833886 WHERE `guid`=16090;

-- Missing Sungrass spawns in Blasted Lands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 142142, 0, -11582.6, -3341.9, 8.51584, 6.00393, 0, 0, -0.139173, 0.990268, 300, 300, 1, 100, 0, 10), 
(@OGUID+2, 142142, 0, -11843.8, -3027.06, 15.8717, 5.86431, 0, 0, -0.207911, 0.978148, 300, 300, 1, 100, 0, 10), 
(@OGUID+3, 142142, 0, -11014, -2816.37, 6.90334, 3.90954, 0, 0, -0.927183, 0.374608, 300, 300, 1, 100, 0, 10), 
(@OGUID+4, 142142, 0, -11344.7, -3179.8, 11.0979, 5.79449, 0, 0, -0.241921, 0.970296, 300, 300, 1, 100, 0, 10), 
(@OGUID+5, 142142, 0, -11779.5, -2980.72, 10.5436, 2.79252, 0, 0, 0.984807, 0.173652, 300, 300, 1, 100, 0, 10), 
(@OGUID+6, 142142, 0, -11728.1, -3342.95, 18.9871, 2.56563, 0, 0, 0.958819, 0.284016, 300, 300, 1, 100, 0, 10),
(@OGUID+7, 142142, 0, -11623.3, -2793.73, 3.64443, 1.309, 0, 0, 0.608761, 0.793354, 300, 300, 1, 100, 0, 10),
(@OGUID+8, 142142, 0, -11620.4, -3179.27, 11.3477, 4.17134, 0, 0, -0.870356, 0.492424, 300, 300, 1, 100, 0, 10);

-- Missing Sungrass spawns in Azshara.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+9, 142142, 1, 4821.41, -6690.78, 93.4824, 4.55531, 0, 0, -0.760406, 0.649449, 300, 300, 1, 100, 0, 10), 
(@OGUID+10, 142142, 1, 2810.06, -5282.85, 118.888, 0.820303, 0, 0, 0.398748, 0.91706, 300, 300, 1, 100, 0, 10), 
(@OGUID+11, 142142, 1, 3370.3, -4711.7, 101.066, 1.20428, 0, 0, 0.566406, 0.824126, 300, 300, 1, 100, 0, 10), 
(@OGUID+12, 142142, 1, 2679.59, -4379.12, 99.9001, 4.83456, 0, 0, -0.66262, 0.748956, 300, 300, 1, 100, 0, 10), 
(@OGUID+13, 142142, 1, 3275.16, -4960.6, 123.957, 6.03884, 0, 0, -0.121869, 0.992546, 300, 300, 1, 100, 0, 10), 
(@OGUID+14, 142142, 1, 3513.71, -4175.21, 102.224, 0.523598, 0, 0, 0.258819, 0.965926, 300, 300, 1, 100, 0, 10), 
(@OGUID+15, 142142, 1, 2547.64, -5915.04, 95.0461, 0.383971, 0, 0, 0.190808, 0.981627, 300, 300, 1, 100, 0, 10),
(@OGUID+16, 142142, 1, 2557.3, -6810.12, 111.966, 0.802851, 0, 0, 0.390731, 0.920505, 300, 300, 1, 100, 0, 10),
(@OGUID+17, 142142, 1, 2617.87, -4683.66, 136.462, 2.30383, 0, 0, 0.913545, 0.406738, 300, 300, 1, 100, 0, 10),
(@OGUID+18, 142142, 1, 2816.17, -5614.1, 125.489, 1.13446, 0, 0, 0.537299, 0.843392, 300, 300, 1, 100, 0, 10),
(@OGUID+19, 142142, 1, 3021.72, -4117.69, 101.23, 0.261798, 0, 0, 0.130526, 0.991445, 300, 300, 1, 100, 0, 10),
(@OGUID+20, 142142, 1, 3049.64, -5151.86, 130.717, 4.39823, 0, 0, -0.809016, 0.587786, 300, 300, 1, 100, 0, 10),
(@OGUID+21, 142142, 1, 3392.53, -4222.12, 106.433, 0.523598, 0, 0, 0.258819, 0.965926, 300, 300, 1, 100, 0, 10),
(@OGUID+22, 142142, 1, 3418.74, -4312, 101.8, 1.18682, 0, 0, 0.559193, 0.829038, 300, 300, 1, 100, 0, 10),
(@OGUID+23, 142142, 1, 4080.45, -5389.4, 114.153, 3.4383, 0, 0, -0.989016, 0.147811, 300, 300, 1, 100, 0, 10),
(@OGUID+24, 142142, 1, 4302.15, -5878.45, 97.2801, 3.45576, 0, 0, -0.987688, 0.156436, 300, 300, 1, 100, 0, 10),
(@OGUID+25, 142142, 1, 4421.19, -6246.29, 94.951, 5.21854, 0, 0, -0.507538, 0.861629, 300, 300, 1, 100, 0, 10),
(@OGUID+26, 142142, 1, 4550.12, -6469.65, 108.8, 5.61996, 0, 0, -0.325567, 0.945519, 300, 300, 1, 100, 0, 10),
(@OGUID+27, 142142, 1, 4586.58, -5645.24, 104.775, 4.03171, 0, 0, -0.902585, 0.430512, 300, 300, 1, 100, 0, 10);

-- Missing Sungrass spawns in Western Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+28, 142142, 0, 1721.82, -1016.11, 71.0081, 0.244346, 0, 0, 0.121869, 0.992546, 300, 300, 1, 100, 0, 10), 
(@OGUID+29, 142142, 0, 2077.56, -1851.23, 63.6229, 4.53786, 0, 0, -0.766044, 0.642789, 300, 300, 1, 100, 0, 10), 
(@OGUID+30, 142142, 0, 2418.38, -1716.72, 108.163, 5.14872, 0, 0, -0.537299, 0.843392, 300, 300, 1, 100, 0, 10), 
(@OGUID+31, 142142, 0, 1862.53, -1105.95, 59.6888, 6.02139, 0, 0, -0.130526, 0.991445, 300, 300, 1, 100, 0, 10), 
(@OGUID+32, 142142, 0, 1975.75, -2324.23, 59.4981, 2.9496, 0, 0, 0.995396, 0.0958512, 300, 300, 1, 100, 0, 10), 
(@OGUID+33, 142142, 0, 1594.22, -1244.38, 65.4813, 0.628317, 0, 0, 0.309016, 0.951057, 300, 300, 1, 100, 0, 10), 
(@OGUID+34, 142142, 0, 1918.27, -2175.42, 75.8794, 5.23599, 0, 0, -0.5, 0.866025, 300, 300, 1, 100, 0, 10), 
(@OGUID+35, 142142, 0, 1835.37, -2031.33, 74.847, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 1, 100, 0, 10), 
(@OGUID+36, 142142, 0, 2330.78, -1475.19, 96.9419, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 1, 100, 0, 10), 
(@OGUID+37, 142142, 0, 1799.01, -1646.22, 60.0723, 1.23918, 0, 0, 0.580703, 0.814116, 300, 300, 1, 100, 0, 10), 
(@OGUID+38, 142142, 0, 2920.11, -1610.7, 147.766, 5.81195, 0, 0, -0.233445, 0.97237, 300, 300, 1, 100, 0, 10), 
(@OGUID+39, 142142, 0, 2301.46, -1686.57, 100.712, 5.93412, 0, 0, -0.173648, 0.984808, 300, 300, 1, 100, 0, 10);

-- Missing Sungrass spawns in Burning Steppes.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+40, 142142, 0, -8206.89, -2190.3, 131.917, 6.05629, 0, 0, -0.113203, 0.993572, 300, 300, 1, 100, 0, 10), 
(@OGUID+41, 142142, 0, -8156.5, -2804.22, 135.611, 4.29351, 0, 0, -0.83867, 0.54464, 300, 300, 1, 100, 0, 10), 
(@OGUID+42, 142142, 0, -7620.03, -2774.08, 134.697, 0.523598, 0, 0, 0.258819, 0.965926, 300, 300, 1, 100, 0, 10), 
(@OGUID+43, 142142, 0, -7750.7, -2421.27, 140.446, 3.54302, 0, 0, -0.979924, 0.19937, 300, 300, 1, 100, 0, 10), 
(@OGUID+44, 142142, 0, -7734.56, -2249.26, 136.182, 4.53786, 0, 0, -0.766044, 0.642789, 300, 300, 1, 100, 0, 10),
(@OGUID+45, 142142, 0, -7708.77, -2935.67, 133.485, 4.27606, 0, 0, -0.843391, 0.5373, 300, 300, 1, 100, 0, 10);

-- Missing Sungrass spawns in The Hinterlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+46, 142142, 0, -146.055, -3483.01, 127.314, 5.68977, 0, 0, -0.292372, 0.956305, 300, 300, 1, 100, 0, 10), 
(@OGUID+47, 142142, 0, 126.82, -3811.6, 125.848, 1.98967, 0, 0, 0.83867, 0.54464, 300, 300, 1, 100, 0, 10), 
(@OGUID+48, 142142, 0, 48.7941, -2583.62, 113.303, 0.261798, 0, 0, 0.130526, 0.991445, 300, 300, 1, 100, 0, 10), 
(@OGUID+49, 142142, 0, 254.182, -3485.79, 161.809, 4.5204, 0, 0, -0.771625, 0.636078, 300, 300, 1, 100, 0, 10), 
(@OGUID+50, 142142, 0, -110.992, -2903.27, 122.513, 3.7001, 0, 0, -0.961261, 0.27564, 300, 300, 1, 100, 0, 10), 
(@OGUID+51, 142142, 0, 157.583, -3357.76, 116.646, 5.16618, 0, 0, -0.529919, 0.848048, 300, 300, 1, 100, 0, 10), 
(@OGUID+52, 142142, 0, -192.009, -4346.85, 120.757, 4.53786, 0, 0, -0.766044, 0.642789, 300, 300, 1, 100, 0, 10), 
(@OGUID+53, 142142, 0, 84.1852, -4108.34, 158.736, 0.453785, 0, 0, 0.224951, 0.97437, 300, 300, 1, 100, 0, 10), 
(@OGUID+54, 142142, 0, -42.7587, -2993.42, 122.968, 0.523598, 0, 0, 0.258819, 0.965926, 300, 300, 1, 100, 0, 10), 
(@OGUID+55, 142142, 0, -119.008, -4209.6, 121.428, 0.523598, 0, 0, 0.258819, 0.965926, 300, 300, 1, 100, 0, 10), 
(@OGUID+56, 142142, 0, 185.703, -3148.8, 121.978, 0.0174525, 0, 0, 0.00872612, 0.999962, 300, 300, 1, 100, 0, 10), 
(@OGUID+57, 142142, 0, 75.4878, -3281.09, 117.157, 4.59022, 0, 0, -0.748956, 0.66262, 300, 300, 1, 100, 0, 10), 
(@OGUID+58, 142142, 0, 134.793, -3656.45, 133.251, 3.4034, 0, 0, -0.991445, 0.130528, 300, 300, 1, 100, 0, 10), 
(@OGUID+59, 142142, 0, 158.747, -4206.66, 118.182, 0.715585, 0, 0, 0.350207, 0.936672, 300, 300, 1, 100, 0, 10), 
(@OGUID+60, 142142, 0, 179.138, -4381.11, 118.616, 4.57276, 0, 0, -0.754709, 0.656059, 300, 300, 1, 100, 0, 10), 
(@OGUID+61, 142142, 0, 81.3494, -4316.38, 121.672, 1.69297, 0, 0, 0.748956, 0.66262, 300, 300, 1, 100, 0, 10), 
(@OGUID+62, 142142, 0, -13.3295, -4387.78, 142.955, 5.23599, 0, 0, -0.5, 0.866025, 300, 300, 1, 100, 0, 10), 
(@OGUID+63, 142142, 0, -161.274, -2780.97, 120.945, 3.78737, 0, 0, -0.948323, 0.317306, 300, 300, 1, 100, 0, 10),
(@OGUID+64, 142142, 0, -10.5097, -3543.58, 119.021, 4.18879, 0, 0, -0.866025, 0.500001, 300, 300, 1, 100, 0, 10),
(@OGUID+65, 142142, 0, 72.6079, -2282.54, 107.053, 0.994837, 0, 0, 0.477159, 0.878817, 300, 300, 1, 100, 0, 10),
(@OGUID+66, 142142, 0, 82.176, -2672, 110.872, 4.67748, 0, 0, -0.719339, 0.694659, 300, 300, 1, 100, 0, 10),
(@OGUID+67, 142142, 0, 182.627, -3593.6, 126.181, 4.20625, 0, 0, -0.861629, 0.507539, 300, 300, 1, 100, 0, 10),
(@OGUID+68, 142142, 0, 228.485, -4264.18, 120.824, 5.11382, 0, 0, -0.551936, 0.833886, 300, 300, 1, 100, 0, 10),
(@OGUID+69, 142142, 0, 264.186, -2898.2, 108.21, 4.27606, 0, 0, -0.843391, 0.5373, 300, 300, 1, 100, 0, 10);

-- Missing Sungrass spawns in Eastern Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+70, 142142, 0, 2016.28, -3784.13, 129.389, 2.80998, 0, 0, 0.986285, 0.16505, 300, 300, 1, 100, 0, 10), 
(@OGUID+71, 142142, 0, 3052.8, -2893.76, 109.784, 2.3911, 0, 0, 0.930417, 0.366502, 300, 300, 1, 100, 0, 10), 
(@OGUID+72, 142142, 0, 2863.05, -3118.23, 105.874, 4.60767, 0, 0, -0.743144, 0.669131, 300, 300, 1, 100, 0, 10), 
(@OGUID+73, 142142, 0, 2317.71, -4236.85, 98.6486, 0.0523589, 0, 0, 0.0261765, 0.999657, 300, 300, 1, 100, 0, 10), 
(@OGUID+74, 142142, 0, 1982.18, -4091.15, 86.3628, 3.87463, 0, 0, -0.93358, 0.358368, 300, 300, 1, 100, 0, 10),
(@OGUID+75, 142142, 0, 2101.91, -4440.85, 73.8504, 1.90241, 0, 0, 0.814116, 0.580703, 300, 300, 1, 100, 0, 10),
(@OGUID+76, 142142, 0, 2191.87, -4578.98, 73.6903, 4.67748, 0, 0, -0.719339, 0.694659, 300, 300, 1, 100, 0, 10),
(@OGUID+77, 142142, 0, 2756.84, -4735.5, 76.9312, 1.62316, 0, 0, 0.725374, 0.688355, 300, 300, 1, 100, 0, 10),
(@OGUID+78, 142142, 0, 2779.7, -4005.54, 99.1068, 0.977383, 0, 0, 0.469471, 0.882948, 300, 300, 1, 100, 0, 10),
(@OGUID+79, 142142, 0, 3142.79, -4519.12, 116.495, 1.76278, 0, 0, 0.771625, 0.636078, 300, 300, 1, 100, 0, 10);

-- Missing Sungrass spawns in Feralas.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+80, 142142, 1, -4220.13, 114.092, 58.0438, 2.25147, 0, 0, 0.902585, 0.430512, 300, 300, 1, 100, 0, 10), 
(@OGUID+81, 142142, 1, -4312.9, 480.826, 54.8414, 3.85718, 0, 0, -0.936671, 0.35021, 300, 300, 1, 100, 0, 10), 
(@OGUID+82, 142142, 1, -4587.29, 724.25, 48.3546, 5.49779, 0, 0, -0.382683, 0.92388, 300, 300, 1, 100, 0, 10), 
(@OGUID+83, 142142, 1, -3651.94, 1959.09, 75.3198, 0.698131, 0, 0, 0.34202, 0.939693, 300, 300, 1, 100, 0, 10), 
(@OGUID+84, 142142, 1, -4129.21, 393.795, 52.1514, 3.45576, 0, 0, -0.987688, 0.156436, 300, 300, 1, 100, 0, 10), 
(@OGUID+85, 142142, 1, -4016.51, -261.971, 151.339, 2.93214, 0, 0, 0.994521, 0.104536, 300, 300, 1, 100, 0, 10), 
(@OGUID+86, 142142, 1, -5606.37, 1107.94, 63.6876, 1.25664, 0, 0, 0.587785, 0.809017, 300, 300, 1, 100, 0, 10), 
(@OGUID+87, 142142, 1, -5256.59, 1416.22, 36.897, 4.7473, 0, 0, -0.694658, 0.71934, 300, 300, 1, 100, 0, 10), 
(@OGUID+88, 142142, 1, -2849.65, 2353.96, 36.8631, 3.3685, 0, 0, -0.993571, 0.113208, 300, 300, 1, 100, 0, 10), 
(@OGUID+89, 142142, 1, -4292.6, 587.599, 60.3928, 3.80482, 0, 0, -0.945518, 0.325568, 300, 300, 1, 100, 0, 10), 
(@OGUID+90, 142142, 1, -4421.08, -281.654, 32.5452, 6.26573, 0, 0, -0.00872612, 0.999962, 300, 300, 1, 100, 0, 10), 
(@OGUID+91, 142142, 1, -4567.02, 1469.93, 99.658, 3.80482, 0, 0, -0.945518, 0.325568, 300, 300, 1, 100, 0, 10), 
(@OGUID+92, 142142, 1, -4547.1, 1495.72, 101.124, 4.72984, 0, 0, -0.700909, 0.713251, 300, 300, 1, 100, 0, 10), 
(@OGUID+93, 142142, 1, -5394.21, 1486.27, 26.0908, 4.99164, 0, 0, -0.601814, 0.798636, 300, 300, 1, 100, 0, 10), 
(@OGUID+94, 142142, 1, -4940.68, 1379.55, 51.1686, 3.42085, 0, 0, -0.990268, 0.139175, 300, 300, 1, 100, 0, 10), 
(@OGUID+95, 142142, 1, -5247.18, 584.058, 58.8656, 2.04204, 0, 0, 0.85264, 0.522499, 300, 300, 1, 100, 0, 10), 
(@OGUID+96, 142142, 1, -5089.1, 237.204, 43.834, 4.50295, 0, 0, -0.777145, 0.629321, 300, 300, 1, 100, 0, 10), 
(@OGUID+97, 142142, 1, -5003.9, 252.587, 40.5844, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 1, 100, 0, 10), 
(@OGUID+98, 142142, 1, -4771.66, 1382.84, 106.601, 4.67748, 0, 0, -0.719339, 0.694659, 300, 300, 1, 100, 0, 10), 
(@OGUID+99, 142142, 1, -5160.77, 1228.76, 58.0648, 5.21854, 0, 0, -0.507538, 0.861629, 300, 300, 1, 100, 0, 10), 
(@OGUID+100, 142142, 1, -3785.27, 1951.63, 66.5355, 5.74214, 0, 0, -0.267238, 0.963631, 300, 300, 1, 100, 0, 10), 
(@OGUID+101, 142142, 1, -2982.08, 2346.6, 42.1704, 2.33874, 0, 0, 0.920505, 0.390732, 300, 300, 1, 100, 0, 10), 
(@OGUID+102, 142142, 1, -4151.39, -421.797, 26.5573, 0.715585, 0, 0, 0.350207, 0.936672, 300, 300, 1, 100, 0, 10), 
(@OGUID+103, 142142, 1, -5769.63, 1275.29, 59.1949, 2.05949, 0, 0, 0.857167, 0.515038, 300, 300, 1, 100, 0, 10), 
(@OGUID+104, 142142, 1, -5468.4, 1682.59, 60.2407, 5.88176, 0, 0, -0.199368, 0.979925, 300, 300, 1, 100, 0, 10), 
(@OGUID+105, 142142, 1, -5589.56, 1687.75, 78.7239, 1.0821, 0, 0, 0.515038, 0.857168, 300, 300, 1, 100, 0, 10), 
(@OGUID+106, 142142, 1, -5445.64, 1684.37, 57.6588, 3.00195, 0, 0, 0.997563, 0.0697661, 300, 300, 1, 100, 0, 10), 
(@OGUID+107, 142142, 1, -4892.01, 1477.28, 83.182, 0.471238, 0, 0, 0.233445, 0.97237, 300, 300, 1, 100, 0, 10), 
(@OGUID+108, 142142, 1, -5181.7, 1479.84, 47.1308, 0.994837, 0, 0, 0.477159, 0.878817, 300, 300, 1, 100, 0, 10), 
(@OGUID+109, 142142, 1, -5122.91, 1551.17, 54.7514, 1.43117, 0, 0, 0.656058, 0.75471, 300, 300, 1, 100, 0, 10), 
(@OGUID+110, 142142, 1, -4542.05, 551.276, 61.0015, 5.2709, 0, 0, -0.484809, 0.87462, 300, 300, 1, 100, 0, 10), 
(@OGUID+111, 142142, 1, -4664.02, 1593.6, 116.131, 5.39307, 0, 0, -0.430511, 0.902586, 300, 300, 1, 100, 0, 10), 
(@OGUID+112, 142142, 1, -3510.86, 2515.86, 54.4166, 3.08918, 0, 0, 0.999657, 0.0262016, 300, 300, 1, 100, 0, 10), 
(@OGUID+113, 142142, 1, -4180.1, -116.857, 59.4741, 0.925024, 0, 0, 0.446198, 0.894935, 300, 300, 1, 100, 0, 10), 
(@OGUID+114, 142142, 1, -4378.7, 473.177, 55.3617, 2.82743, 0, 0, 0.987688, 0.156436, 300, 300, 1, 100, 0, 10), 
(@OGUID+115, 142142, 1, -5795.07, 1569.15, 74.455, 0.610863, 0, 0, 0.300705, 0.953717, 300, 300, 1, 100, 0, 10),
(@OGUID+116, 142142, 1, -5681.78, 1666.42, 89.5492, 2.19911, 0, 0, 0.891006, 0.453991, 300, 300, 1, 100, 0, 10),
(@OGUID+117, 142142, 1, -5618.95, 1590.62, 68.7866, 0.244346, 0, 0, 0.121869, 0.992546, 300, 300, 1, 100, 0, 10),
(@OGUID+118, 142142, 1, -5007.59, 573.402, 28.4242, 2.32129, 0, 0, 0.91706, 0.39875, 300, 300, 1, 100, 0, 10),
(@OGUID+119, 142142, 1, -4906.91, 521.909, 9.59683, 4.85202, 0, 0, -0.656058, 0.75471, 300, 300, 1, 100, 0, 10),
(@OGUID+120, 142142, 1, -4748.36, 1284.41, 105.557, 3.45576, 0, 0, -0.987688, 0.156436, 300, 300, 1, 100, 0, 10),
(@OGUID+121, 142142, 1, -4721.07, 1237.54, 104.924, 1.39626, 0, 0, 0.642787, 0.766045, 300, 300, 1, 100, 0, 10),
(@OGUID+122, 142142, 1, -4546.78, 1843.52, 90.6822, 0.139624, 0, 0, 0.0697556, 0.997564, 300, 300, 1, 100, 0, 10),
(@OGUID+123, 142142, 1, -4454.82, -108.855, 56.0407, 4.67748, 0, 0, -0.719339, 0.694659, 300, 300, 1, 100, 0, 10),
(@OGUID+124, 142142, 1, -4219.56, 468.836, 50.3814, 0.645772, 0, 0, 0.317305, 0.948324, 300, 300, 1, 100, 0, 10),
(@OGUID+125, 142142, 1, -4134.24, 391.194, 53.1853, 4.17134, 0, 0, -0.870356, 0.492424, 300, 300, 1, 100, 0, 10),
(@OGUID+126, 142142, 1, -3488.37, 2192.53, 28.3378, 2.46091, 0, 0, 0.942641, 0.333808, 300, 300, 1, 100, 0, 10);

-- Missing Sungrass spawns in Un'Goro Crater.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+127, 142142, 1, -7448.17, -2418.1, -207.356, 0.471238, 0, 0, 0.233445, 0.97237, 300, 300, 1, 100, 0, 10), 
(@OGUID+128, 142142, 1, -8023.44, -1409.54, -271.486, 0.750491, 0, 0, 0.366501, 0.930418, 300, 300, 1, 100, 0, 10), 
(@OGUID+129, 142142, 1, -6793.38, -908.425, -270.122, 0.767944, 0, 0, 0.374606, 0.927184, 300, 300, 1, 100, 0, 10), 
(@OGUID+130, 142142, 1, -6960, -2445.9, -204.303, 4.41568, 0, 0, -0.803857, 0.594823, 300, 300, 1, 100, 0, 10), 
(@OGUID+131, 142142, 1, -6888.17, -484.732, -271.43, 1.29154, 0, 0, 0.601814, 0.798636, 300, 300, 1, 100, 0, 10), 
(@OGUID+132, 142142, 1, -8211.17, -1096.52, -213.905, 2.42601, 0, 0, 0.936672, 0.350207, 300, 300, 1, 100, 0, 10),
(@OGUID+133, 142142, 1, -8192.22, -1555.34, -219.564, 3.52557, 0, 0, -0.981627, 0.190812, 300, 300, 1, 100, 0, 10),
(@OGUID+134, 142142, 1, -7921.63, -986.951, -273.355, 0.663223, 0, 0, 0.325567, 0.945519, 300, 300, 1, 100, 0, 10),
(@OGUID+135, 142142, 1, -7746.36, -680.292, -259.149, 3.927, 0, 0, -0.923879, 0.382686, 300, 300, 1, 100, 0, 10),
(@OGUID+136, 142142, 1, -7736.79, -1046.92, -271.153, 5.23599, 0, 0, -0.5, 0.866025, 300, 300, 1, 100, 0, 10),
(@OGUID+137, 142142, 1, -7689.39, -1246.2, -269.944, 1.55334, 0, 0, 0.700909, 0.713251, 300, 300, 1, 100, 0, 10),
(@OGUID+138, 142142, 1, -7551.09, -1314.93, -271.389, 2.30383, 0, 0, 0.913545, 0.406738, 300, 300, 1, 100, 0, 10),
(@OGUID+139, 142142, 1, -7545.94, -522.651, -269.095, 4.86947, 0, 0, -0.649447, 0.760406, 300, 300, 1, 100, 0, 10),
(@OGUID+140, 142142, 1, -7449.2, -1652.3, -283.659, 2.74016, 0, 0, 0.979924, 0.19937, 300, 300, 1, 100, 0, 10),
(@OGUID+141, 142142, 1, -7310.49, -1013.22, -272.091, 4.24115, 0, 0, -0.85264, 0.522499, 300, 300, 1, 100, 0, 10),
(@OGUID+142, 142142, 1, -7085.11, -916.453, -270.59, 1.76278, 0, 0, 0.771625, 0.636078, 300, 300, 1, 100, 0, 10),
(@OGUID+143, 142142, 1, -6856.67, -2181.42, -269.856, 3.85718, 0, 0, -0.936671, 0.35021, 300, 300, 1, 100, 0, 10);

-- Missing Sungrass spawns in Silithus.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+144, 142142, 1, -6685.23, 86.7849, 6.31194, 0.122173, 0, 0, 0.0610485, 0.998135, 300, 300, 1, 100, 0, 10), 
(@OGUID+145, 142142, 1, -6682.94, -111.977, 3.70413, 0.418879, 0, 0, 0.207911, 0.978148, 300, 300, 1, 100, 0, 10), 
(@OGUID+146, 142142, 1, -7749.81, 1486.97, 0.788001, 3.24635, 0, 0, -0.998629, 0.0523532, 300, 300, 1, 100, 0, 10), 
(@OGUID+147, 142142, 1, -6852.07, 19.1105, 5.19067, 4.43314, 0, 0, -0.798635, 0.601815, 300, 300, 1, 100, 0, 10), 
(@OGUID+148, 142142, 1, -7750.89, 950.673, -0.100626, 2.46091, 0, 0, 0.942641, 0.333808, 300, 300, 1, 100, 0, 10), 
(@OGUID+149, 142142, 1, -7239.56, 1193.56, -0.285464, 5.51524, 0, 0, -0.374606, 0.927184, 300, 300, 1, 100, 0, 10),
(@OGUID+150, 142142, 1, -6748.26, 1252.42, 5.5192, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 1, 100, 0, 10),
(@OGUID+151, 142142, 1, -6536.36, 409.216, 5.08667, 3.80482, 0, 0, -0.945518, 0.325568, 300, 300, 1, 100, 0, 10);

-- Missing Sungrass spawns in Felwood.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+152, 176636, 1, 6154.25, -1490.27, 439.412, 3.71755, 0, 0, -0.958819, 0.284016, 1800, 1800, 1, 100, 0, 10),
(@OGUID+153, 176636, 1, 5969.22, -616.162, 399.796, 3.17653, 0, 0, -0.999847, 0.0174693, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+154, 176636, 1, 5627.3, -520.709, 372.392, 5.67232, 0, 0, -0.300705, 0.953717, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+155, 176636, 1, 6238.8, -707.594, 416.565, 0, 0, 0, 0, 1, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+156, 176636, 1, 3883.91, -1448.03, 216.904, 3.54302, 0, 0, -0.979924, 0.19937, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+157, 176636, 1, 3609.97, -1045.24, 219.979, 4.53786, 0, 0, -0.766044, 0.642789, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+158, 176636, 1, 6503.98, -1509.01, 438.926, 2.37364, 0, 0, 0.927183, 0.374608, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+159, 176636, 1, 5064.93, -547.86, 334.946, 2.89725, 0, 0, 0.992546, 0.12187, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+160, 176636, 1, 3854.78, -685.998, 326.543, 4.13643, 0, 0, -0.878817, 0.47716, 300, 300, 1, 100, 0, 10),
(@OGUID+161, 176636, 1, 4705.27, -843.209, 318.183, 3.61284, 0, 0, -0.972369, 0.233448, 300, 300, 1, 100, 0, 10),
(@OGUID+162, 176636, 1, 5851.77, -1181.76, 403.348, 2.60054, 0, 0, 0.96363, 0.267241, 300, 300, 1, 100, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1277, 0, 'Sungrass', 0, 10), -- Sungrass in Blasted Lands 37 objects total
(@OGUID+2, 1277, 0, 'Sungrass', 0, 10), -- Sungrass in Blasted Lands 37 objects total
(@OGUID+3, 1277, 0, 'Sungrass', 0, 10), -- Sungrass in Blasted Lands 37 objects total
(@OGUID+4, 1277, 0, 'Sungrass', 0, 10), -- Sungrass in Blasted Lands 37 objects total
(@OGUID+5, 1277, 0, 'Sungrass', 0, 10), -- Sungrass in Blasted Lands 37 objects total
(@OGUID+6, 1277, 0, 'Sungrass', 0, 10), -- Sungrass in Blasted Lands 37 objects total
(@OGUID+7, 1277, 0, 'Sungrass', 0, 10), -- Sungrass in Blasted Lands 37 objects total
(@OGUID+8, 1277, 0, 'Sungrass', 0, 10), -- Sungrass in Blasted Lands 37 objects total
(@OGUID+9, 1240, 0, 'Sungrass', 0, 10), -- Sungrass in Azshara 93 objects total
(@OGUID+10, 1240, 0, 'Sungrass', 0, 10), -- Sungrass in Azshara 93 objects total
(@OGUID+11, 1240, 0, 'Sungrass', 0, 10), -- Sungrass in Azshara 93 objects total
(@OGUID+12, 1240, 0, 'Sungrass', 0, 10), -- Sungrass in Azshara 93 objects total
(@OGUID+13, 1240, 0, 'Sungrass', 0, 10), -- Sungrass in Azshara 93 objects total
(@OGUID+14, 1240, 0, 'Sungrass', 0, 10), -- Sungrass in Azshara 93 objects total
(@OGUID+15, 1240, 0, 'Sungrass', 0, 10), -- Sungrass in Azshara 93 objects total
(@OGUID+16, 1240, 0, 'Sungrass', 0, 10), -- Sungrass in Azshara 93 objects total
(@OGUID+17, 1240, 0, 'Sungrass', 0, 10), -- Sungrass in Azshara 93 objects total
(@OGUID+18, 1240, 0, 'Sungrass', 0, 10), -- Sungrass in Azshara 93 objects total
(@OGUID+19, 1240, 0, 'Sungrass', 0, 10), -- Sungrass in Azshara 93 objects total
(@OGUID+20, 1240, 0, 'Sungrass', 0, 10), -- Sungrass in Azshara 93 objects total
(@OGUID+21, 1240, 0, 'Sungrass', 0, 10), -- Sungrass in Azshara 93 objects total
(@OGUID+22, 1240, 0, 'Sungrass', 0, 10), -- Sungrass in Azshara 93 objects total
(@OGUID+23, 1240, 0, 'Sungrass', 0, 10), -- Sungrass in Azshara 93 objects total
(@OGUID+24, 1240, 0, 'Sungrass', 0, 10), -- Sungrass in Azshara 93 objects total
(@OGUID+25, 1240, 0, 'Sungrass', 0, 10), -- Sungrass in Azshara 93 objects total
(@OGUID+26, 1240, 0, 'Sungrass', 0, 10), -- Sungrass in Azshara 93 objects total
(@OGUID+27, 1240, 0, 'Sungrass', 0, 10), -- Sungrass in Azshara 93 objects total
(@OGUID+28, 1261, 0, 'Sungrass', 0, 10), -- Sungrass in Western Plaguelands 9 objects total
(@OGUID+29, 1261, 0, 'Sungrass', 0, 10), -- Sungrass in Western Plaguelands 9 objects total
(@OGUID+30, 1261, 0, 'Sungrass', 0, 10), -- Sungrass in Western Plaguelands 9 objects total
(@OGUID+31, 1261, 0, 'Sungrass', 0, 10), -- Sungrass in Western Plaguelands 9 objects total
(@OGUID+32, 1261, 0, 'Sungrass', 0, 10), -- Sungrass in Western Plaguelands 9 objects total
(@OGUID+33, 1261, 0, 'Sungrass', 0, 10), -- Sungrass in Western Plaguelands 9 objects total
(@OGUID+34, 1261, 0, 'Sungrass', 0, 10), -- Sungrass in Western Plaguelands 9 objects total
(@OGUID+35, 1261, 0, 'Sungrass', 0, 10), -- Sungrass in Western Plaguelands 9 objects total
(@OGUID+36, 1261, 0, 'Sungrass', 0, 10), -- Sungrass in Western Plaguelands 9 objects total
(@OGUID+37, 1261, 0, 'Sungrass', 0, 10), -- Sungrass in Western Plaguelands 9 objects total
(@OGUID+38, 1261, 0, 'Sungrass', 0, 10), -- Sungrass in Western Plaguelands 9 objects total
(@OGUID+39, 1261, 0, 'Sungrass', 0, 10), -- Sungrass in Western Plaguelands 9 objects total
(@OGUID+40, 1303, 0, 'Sungrass', 0, 10), -- Sungrass in Burning Steppes 20 objects total
(@OGUID+41, 1303, 0, 'Sungrass', 0, 10), -- Sungrass in Burning Steppes 20 objects total
(@OGUID+42, 1303, 0, 'Sungrass', 0, 10), -- Sungrass in Burning Steppes 20 objects total
(@OGUID+43, 1303, 0, 'Sungrass', 0, 10), -- Sungrass in Burning Steppes 20 objects total
(@OGUID+44, 1303, 0, 'Sungrass', 0, 10), -- Sungrass in Burning Steppes 20 objects total
(@OGUID+45, 1303, 0, 'Sungrass', 0, 10), -- Sungrass in Burning Steppes 20 objects total
(@OGUID+46, 1250, 0, 'Sungrass', 0, 10), -- Sungrass in Hinterlands 77 objects total
(@OGUID+47, 1250, 0, 'Sungrass', 0, 10), -- Sungrass in Hinterlands 77 objects total
(@OGUID+48, 1250, 0, 'Sungrass', 0, 10), -- Sungrass in Hinterlands 77 objects total
(@OGUID+49, 1250, 0, 'Sungrass', 0, 10), -- Sungrass in Hinterlands 77 objects total
(@OGUID+50, 1250, 0, 'Sungrass', 0, 10), -- Sungrass in Hinterlands 77 objects total
(@OGUID+51, 1250, 0, 'Sungrass', 0, 10), -- Sungrass in Hinterlands 77 objects total
(@OGUID+52, 1250, 0, 'Sungrass', 0, 10), -- Sungrass in Hinterlands 77 objects total
(@OGUID+53, 1250, 0, 'Sungrass', 0, 10), -- Sungrass in Hinterlands 77 objects total
(@OGUID+54, 1250, 0, 'Sungrass', 0, 10), -- Sungrass in Hinterlands 77 objects total
(@OGUID+55, 1250, 0, 'Sungrass', 0, 10), -- Sungrass in Hinterlands 77 objects total
(@OGUID+56, 1250, 0, 'Sungrass', 0, 10), -- Sungrass in Hinterlands 77 objects total
(@OGUID+57, 1250, 0, 'Sungrass', 0, 10), -- Sungrass in Hinterlands 77 objects total
(@OGUID+58, 1250, 0, 'Sungrass', 0, 10), -- Sungrass in Hinterlands 77 objects total
(@OGUID+59, 1250, 0, 'Sungrass', 0, 10), -- Sungrass in Hinterlands 77 objects total
(@OGUID+60, 1250, 0, 'Sungrass', 0, 10), -- Sungrass in Hinterlands 77 objects total
(@OGUID+61, 1250, 0, 'Sungrass', 0, 10), -- Sungrass in Hinterlands 77 objects total
(@OGUID+62, 1250, 0, 'Sungrass', 0, 10), -- Sungrass in Hinterlands 77 objects total
(@OGUID+63, 1250, 0, 'Sungrass', 0, 10), -- Sungrass in Hinterlands 77 objects total
(@OGUID+64, 1250, 0, 'Sungrass', 0, 10), -- Sungrass in Hinterlands 77 objects total
(@OGUID+65, 1250, 0, 'Sungrass', 0, 10), -- Sungrass in Hinterlands 77 objects total
(@OGUID+66, 1250, 0, 'Sungrass', 0, 10), -- Sungrass in Hinterlands 77 objects total
(@OGUID+67, 1250, 0, 'Sungrass', 0, 10), -- Sungrass in Hinterlands 77 objects total
(@OGUID+68, 1250, 0, 'Sungrass', 0, 10), -- Sungrass in Hinterlands 77 objects total
(@OGUID+69, 1250, 0, 'Sungrass', 0, 10), -- Sungrass in Hinterlands 77 objects total
(@OGUID+70, 1320, 0, 'Sungrass', 0, 10), -- Sungrass in Eastern Plaguelands 35 objects total
(@OGUID+71, 1320, 0, 'Sungrass', 0, 10), -- Sungrass in Eastern Plaguelands 35 objects total
(@OGUID+72, 1320, 0, 'Sungrass', 0, 10), -- Sungrass in Eastern Plaguelands 35 objects total
(@OGUID+73, 1320, 0, 'Sungrass', 0, 10), -- Sungrass in Eastern Plaguelands 35 objects total
(@OGUID+74, 1320, 0, 'Sungrass', 0, 10), -- Sungrass in Eastern Plaguelands 35 objects total
(@OGUID+75, 1320, 0, 'Sungrass', 0, 10), -- Sungrass in Eastern Plaguelands 35 objects total
(@OGUID+76, 1320, 0, 'Sungrass', 0, 10), -- Sungrass in Eastern Plaguelands 35 objects total
(@OGUID+77, 1320, 0, 'Sungrass', 0, 10), -- Sungrass in Eastern Plaguelands 35 objects total
(@OGUID+78, 1320, 0, 'Sungrass', 0, 10), -- Sungrass in Eastern Plaguelands 35 objects total
(@OGUID+79, 1320, 0, 'Sungrass', 0, 10), -- Sungrass in Eastern Plaguelands 35 objects total
(@OGUID+80, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(@OGUID+81, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(@OGUID+82, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(@OGUID+83, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(@OGUID+84, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(@OGUID+85, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(@OGUID+86, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(@OGUID+87, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(@OGUID+88, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(@OGUID+89, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(@OGUID+90, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(@OGUID+91, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(@OGUID+92, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(@OGUID+93, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(@OGUID+94, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(@OGUID+95, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(@OGUID+96, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(@OGUID+97, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(@OGUID+98, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(@OGUID+99, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(@OGUID+100, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(@OGUID+101, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(@OGUID+102, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(@OGUID+103, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(@OGUID+104, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(@OGUID+105, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(@OGUID+106, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(@OGUID+107, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(@OGUID+108, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(@OGUID+109, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(@OGUID+110, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(@OGUID+111, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(@OGUID+112, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(@OGUID+113, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(@OGUID+114, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(@OGUID+115, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(@OGUID+116, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(@OGUID+117, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(@OGUID+118, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(@OGUID+119, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(@OGUID+120, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(@OGUID+121, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(@OGUID+122, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(@OGUID+123, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(@OGUID+124, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(@OGUID+125, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(@OGUID+126, 1192, 0, 'Sungrass', 0, 10), -- Sungrass in Feralas 20 objects total
(@OGUID+127, 1215, 0, 'Sungrass', 0, 10), -- Sungrass in Ungoro 22 objects total
(@OGUID+128, 1215, 0, 'Sungrass', 0, 10), -- Sungrass in Ungoro 22 objects total
(@OGUID+129, 1215, 0, 'Sungrass', 0, 10), -- Sungrass in Ungoro 22 objects total
(@OGUID+130, 1215, 0, 'Sungrass', 0, 10), -- Sungrass in Ungoro 22 objects total
(@OGUID+131, 1215, 0, 'Sungrass', 0, 10), -- Sungrass in Ungoro 22 objects total
(@OGUID+132, 1215, 0, 'Sungrass', 0, 10), -- Sungrass in Ungoro 22 objects total
(@OGUID+133, 1215, 0, 'Sungrass', 0, 10), -- Sungrass in Ungoro 22 objects total
(@OGUID+134, 1215, 0, 'Sungrass', 0, 10), -- Sungrass in Ungoro 22 objects total
(@OGUID+135, 1215, 0, 'Sungrass', 0, 10), -- Sungrass in Ungoro 22 objects total
(@OGUID+136, 1215, 0, 'Sungrass', 0, 10), -- Sungrass in Ungoro 22 objects total
(@OGUID+137, 1215, 0, 'Sungrass', 0, 10), -- Sungrass in Ungoro 22 objects total
(@OGUID+138, 1215, 0, 'Sungrass', 0, 10), -- Sungrass in Ungoro 22 objects total
(@OGUID+139, 1215, 0, 'Sungrass', 0, 10), -- Sungrass in Ungoro 22 objects total
(@OGUID+140, 1215, 0, 'Sungrass', 0, 10), -- Sungrass in Ungoro 22 objects total
(@OGUID+141, 1215, 0, 'Sungrass', 0, 10), -- Sungrass in Ungoro 22 objects total
(@OGUID+142, 1215, 0, 'Sungrass', 0, 10), -- Sungrass in Ungoro 22 objects total
(@OGUID+143, 1215, 0, 'Sungrass', 0, 10), -- Sungrass in Ungoro 22 objects total
(@OGUID+144, 1223, 0, 'Sungrass', 0, 10), -- Sungrass in Silithus
(@OGUID+145, 1223, 0, 'Sungrass', 0, 10), -- Sungrass in Silithus
(@OGUID+146, 1223, 0, 'Sungrass', 0, 10), -- Sungrass in Silithus
(@OGUID+147, 1223, 0, 'Sungrass', 0, 10), -- Sungrass in Silithus
(@OGUID+148, 1223, 0, 'Sungrass', 0, 10), -- Sungrass in Silithus
(@OGUID+149, 1223, 0, 'Sungrass', 0, 10), -- Sungrass in Silithus
(@OGUID+150, 1223, 0, 'Sungrass', 0, 10), -- Sungrass in Silithus
(@OGUID+151, 1223, 0, 'Sungrass', 0, 10), -- Sungrass in Silithus
(@OGUID+152, 1229, 0, 'Sungrass', 0, 10), -- Sungrasss in Felwood
(@OGUID+153, 1229, 0, 'Sungrass', 0, 10), -- Sungrasss in Felwood
(@OGUID+154, 1229, 0, 'Sungrass', 0, 10), -- Sungrasss in Felwood
(@OGUID+155, 1229, 0, 'Sungrass', 0, 10), -- Sungrasss in Felwood
(@OGUID+156, 1229, 0, 'Sungrass', 0, 10), -- Sungrasss in Felwood
(@OGUID+157, 1229, 0, 'Sungrass', 0, 10), -- Sungrasss in Felwood
(@OGUID+158, 1229, 0, 'Sungrass', 0, 10), -- Sungrasss in Felwood
(@OGUID+159, 1229, 0, 'Sungrass', 0, 10), -- Sungrasss in Felwood
(@OGUID+160, 1229, 0, 'Sungrass', 0, 10), -- Sungrasss in Felwood
(@OGUID+161, 1229, 0, 'Sungrass', 0, 10), -- Sungrasss in Felwood
(@OGUID+162, 1229, 0, 'Sungrass', 0, 10); -- Sungrasss in Felwood

-- Correct Pools
UPDATE `pool_template` SET `description`='Sungrass in Azshara' WHERE  `entry`=1240;
UPDATE `pool_template` SET `description`='Sungrass in Blasted Lands' WHERE  `entry`=1277;
UPDATE `pool_template` SET `description`='Sungrass in Burning Steppes' WHERE  `entry`=1303;
UPDATE `pool_template` SET `description`='Sungrass in Eastern Plaguelands' WHERE  `entry`=1320;
UPDATE `pool_template` SET `description`='Sungrass in Felwood' WHERE  `entry`=1229;
UPDATE `pool_template` SET `description`='Sungrass in Feralas' WHERE  `entry`=1192;
UPDATE `pool_template` SET `description`='Sungrass in Hinterlands' WHERE  `entry`=1250;
UPDATE `pool_template` SET `description`='Sungrass in Ungoro Crater' WHERE  `entry`=1215;
UPDATE `pool_template` SET `description`='Sungrass in Western Plaguelands' WHERE  `entry`=1261;

-- Remove Custom Spawns (Non of these spawns exist in the sniff-db)
DELETE FROM `gameobject` WHERE `guid` IN (16050, 16029, 16206, 16066, 16143, 16232, 16162, 16268, 16234, 16026, 16027, 16028, 16031, 16032, 16033, 16034, 16036, 16037, 16038, 16039, 16040, 16041, 16042, 16043, 16044, 16045, 16046, 16047, 16048, 16053, 16054, 16056, 16057, 16058, 16060, 16061, 16062, 16064, 16065, 16068, 16069, 16070, 16071, 16072, 16073, 16074, 16076, 16078, 16079, 16080, 16081, 16082, 16083, 16084, 16085, 16087, 16088, 16091, 16095, 16097, 16098, 16099, 16100, 16101, 16102, 16103, 16107, 16108, 16109, 16110, 16111, 16112, 16113, 16114, 16115, 16118, 16119, 16122, 16124, 16125, 16126, 16127, 16128, 16129, 16130, 16131, 16133, 16134, 16135, 16137, 16138, 16139, 16141, 16142, 16145, 16146, 16147, 16148, 16149, 16150, 16151, 16152, 16154, 16155, 16156, 16157, 16159, 16160, 16161, 16163, 16164, 16165, 16166, 16167, 16168, 16169, 16171, 16172, 16173, 16175, 16176, 16177, 16179, 16180, 16182, 16183, 16184, 16185, 16186, 16187, 16189, 16192, 16193, 16195, 16196, 16197, 16198, 16199, 16200, 16201, 16203, 16204, 16207, 16208, 16209, 16210, 16211, 16212, 16214, 16215, 16216, 16217, 16218, 16220, 16221, 16222, 16223, 16224, 16225, 16226, 16229, 16230, 16231, 16238, 16239, 16240, 16241, 16242, 16243, 16244, 16245, 16246, 16247, 16248, 16249, 16250, 16252, 16253, 16255, 16257, 16258, 16259, 16260, 16261, 16262, 16263, 16265, 16271, 16272, 16273, 16274, 16275, 16277, 16278, 16280, 16281, 16282, 16283, 16284, 16285);
DELETE FROM `pool_gameobject` WHERE `guid` IN (16050, 16029, 16206, 16066, 16143, 16232, 16162, 16268, 16234, 16026, 16027, 16028, 16031, 16032, 16033, 16034, 16036, 16037, 16038, 16039, 16040, 16041, 16042, 16043, 16044, 16045, 16046, 16047, 16048, 16053, 16054, 16056, 16057, 16058, 16060, 16061, 16062, 16064, 16065, 16068, 16069, 16070, 16071, 16072, 16073, 16074, 16076, 16078, 16079, 16080, 16081, 16082, 16083, 16084, 16085, 16087, 16088, 16091, 16095, 16097, 16098, 16099, 16100, 16101, 16102, 16103, 16107, 16108, 16109, 16110, 16111, 16112, 16113, 16114, 16115, 16118, 16119, 16122, 16124, 16125, 16126, 16127, 16128, 16129, 16130, 16131, 16133, 16134, 16135, 16137, 16138, 16139, 16141, 16142, 16145, 16146, 16147, 16148, 16149, 16150, 16151, 16152, 16154, 16155, 16156, 16157, 16159, 16160, 16161, 16163, 16164, 16165, 16166, 16167, 16168, 16169, 16171, 16172, 16173, 16175, 16176, 16177, 16179, 16180, 16182, 16183, 16184, 16185, 16186, 16187, 16189, 16192, 16193, 16195, 16196, 16197, 16198, 16199, 16200, 16201, 16203, 16204, 16207, 16208, 16209, 16210, 16211, 16212, 16214, 16215, 16216, 16217, 16218, 16220, 16221, 16222, 16223, 16224, 16225, 16226, 16229, 16230, 16231, 16238, 16239, 16240, 16241, 16242, 16243, 16244, 16245, 16246, 16247, 16248, 16249, 16250, 16252, 16253, 16255, 16257, 16258, 16259, 16260, 16261, 16262, 16263, 16265, 16271, 16272, 16273, 16274, 16275, 16277, 16278, 16280, 16281, 16282, 16283, 16284, 16285);

-- Sync Gobject Data
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300, `spawn_flags` = 0, `animprogress` = 100 WHERE `id` IN (176636, 142142);

-- Update Counters
UPDATE `pool_template` SET `max_limit`=33 WHERE  `entry`=1192;
UPDATE `pool_template` SET `max_limit`=25 WHERE  `entry`=1250;
UPDATE `pool_template` SET `max_limit`=8 WHERE  `entry`=1261;
UPDATE `pool_template` SET `max_limit`=3 WHERE  `entry`=1229;
UPDATE `pool_template` SET `max_limit`=16 WHERE  `entry`=1240;
UPDATE `pool_template` SET `max_limit`=4 WHERE  `entry`=1303;
UPDATE `pool_template` SET `max_limit`=14 WHERE  `entry`=1215;
UPDATE `pool_template` SET `max_limit`=7 WHERE  `entry`=1320;
UPDATE `pool_template` SET `max_limit`=3 WHERE  `entry`=1223;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
