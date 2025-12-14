DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230617060049');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230617060049');
-- Add your query below.

-- Purple Lotus (142140)
SET @OGUID = 29365;

-- Correct position of Purple Lotus in Tanaris (position is off by 2.2099 yards).
UPDATE `gameobject` SET `position_x`=-7986.6, `position_y`=-3850.93, `position_z`=18.7965, `orientation`=0.872664, `rotation0`=0, `rotation1`=0, `rotation2`=0.422618, `rotation3`=0.906308 WHERE `guid`=15894;

-- Correct position of Purple Lotus in The Hinterlands (position is off by 0.718012 yards).
UPDATE `gameobject` SET `position_x`=-53.6596, `position_y`=-2497.63, `position_z`=122.501, `orientation`=1.20428, `rotation0`=0, `rotation1`=0, `rotation2`=0.566406, `rotation3`=0.824126 WHERE `guid`=15864;

-- Correct position of Purple Lotus in Badlands (position is off by 1.52016 yards).
UPDATE `gameobject` SET `position_x`=-6600.91, `position_y`=-2596.01, `position_z`=267.721, `orientation`=3.56047, `rotation0`=0, `rotation1`=0, `rotation2`=-0.978148, `rotation3`=0.207912 WHERE `guid`=15827;

-- Correct position of Purple Lotus in Badlands (position is off by 1.22217 yards).
UPDATE `gameobject` SET `position_x`=-6527.28, `position_y`=-3183.1, `position_z`=259.257, `orientation`=5.46288, `rotation0`=0, `rotation1`=0, `rotation2`=-0.398748, `rotation3`=0.91706 WHERE `guid`=15849;

-- Correct position of Purple Lotus in Azshara (position is off by 0.955584 yards).
UPDATE `gameobject` SET `position_x`=3465.79, `position_y`=-4853.79, `position_z`=131.019, `orientation`=4.20625, `rotation0`=0, `rotation1`=0, `rotation2`=-0.861629, `rotation3`=0.507539 WHERE `guid`=15944;

-- Correct position of Purple Lotus in Azshara (position is off by 3.54618 yards).
UPDATE `gameobject` SET `position_x`=3693.19, `position_y`=-5119.39, `position_z`=91.1671, `orientation`=3.80482, `rotation0`=0, `rotation1`=0, `rotation2`=-0.945518, `rotation3`=0.325568 WHERE `guid`=15876;

-- Correct position of Purple Lotus in Azshara (position is off by 1.26858 yards).
UPDATE `gameobject` SET `position_x`=2993.69, `position_y`=-4190.96, `position_z`=99.2725, `orientation`=0.191985, `rotation0`=0, `rotation1`=0, `rotation2`=0.0958452, `rotation3`=0.995396 WHERE `guid`=39932;

-- Correct position of Purple Lotus in Azshara (position is off by 0.000999451 yards).
UPDATE `gameobject` SET `position_x`=3435.67, `position_y`=-4595.98, `position_z`=104.198, `orientation`=1.64061, `rotation0`=0, `rotation1`=0, `rotation2`=0.731353, `rotation3`=0.681999 WHERE `guid`=39934;

-- Correct position of Purple Lotus in Ashenvale (position is off by 0.874528 yards).
UPDATE `gameobject` SET `position_x`=3676.34, `position_y`=810.223, `position_z`=6.04557, `orientation`=4.31097, `rotation0`=0, `rotation1`=0, `rotation2`=-0.833885, `rotation3`=0.551938 WHERE `guid`=15907;

-- Correct position of Purple Lotus in Stranglethorn Vale (position is off by 0.933619 yards).
UPDATE `gameobject` SET `position_x`=-12563, `position_y`=-745.924, `position_z`=39.8806, `orientation`=5.65487, `rotation0`=0, `rotation1`=0, `rotation2`=-0.309016, `rotation3`=0.951057 WHERE `guid`=15814;

-- Correct position of Purple Lotus in The Hinterlands (position is off by 1.38 yards).
UPDATE `gameobject` SET `position_x`=-212.253, `position_y`=-3122.93, `position_z`=130.193, `orientation`=2.33874, `rotation0`=0, `rotation1`=0, `rotation2`=0.920505, `rotation3`=0.390732 WHERE `guid`=15913;

-- Correct position of Purple Lotus in The Hinterlands (position is off by 1.1612 yards).
UPDATE `gameobject` SET `position_x`=-21.1782, `position_y`=-2837.13, `position_z`=126.25, `orientation`=1.93731, `rotation0`=0, `rotation1`=0, `rotation2`=0.824125, `rotation3`=0.566408 WHERE `guid`=15833;

-- Correct position of Purple Lotus in Tanaris (position is off by 2.92861 yards).
UPDATE `gameobject` SET `position_x`=-8274.79, `position_y`=-4711.89, `position_z`=0.241838, `orientation`=0, `rotation0`=0, `rotation1`=0, `rotation2`=0, `rotation3`=1 WHERE `guid`=15841;

-- Correct position of Purple Lotus in The Hinterlands (position is off by 3.73687 yards).
UPDATE `gameobject` SET `position_x`=-330.517, `position_y`=-3413.43, `position_z`=158.924, `orientation`=4.7473, `rotation0`=0, `rotation1`=0, `rotation2`=-0.694658, `rotation3`=0.71934 WHERE `guid`=15839;

-- Correct position of Purple Lotus in Azshara (position is off by 1.58077 yards).
UPDATE `gameobject` SET `position_x`=3443.29, `position_y`=-5076.38, `position_z`=83.4753, `orientation`=4.57276, `rotation0`=0, `rotation1`=0, `rotation2`=-0.754709, `rotation3`=0.656059 WHERE `guid`=15800;

-- Missing Purple Lotus spawns in Azshara.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 142140, 1, 2861.47, -4010.64, 141.192, 3.927, 0, 0, -0.923879, 0.382686, 300, 300, 1, 100, 0, 10), 
(@OGUID+2, 142140, 1, 3336.85, -4491.03, 97.7367, 1.27409, 0, 0, 0.594822, 0.803857, 300, 300, 1, 100, 0, 10), 
(@OGUID+3, 142140, 1, 3788.44, -5311.64, 85.6851, 5.41052, 0, 0, -0.422618, 0.906308, 300, 300, 1, 100, 0, 10), 
(@OGUID+4, 142140, 1, 4675.05, -6700.34, 129.286, 1.23918, 0, 0, 0.580703, 0.814116, 300, 300, 1, 100, 0, 10), 
(@OGUID+5, 142140, 1, 4165.3, -7376.7, 11.9216, 4.7822, 0, 0, -0.681998, 0.731354, 300, 300, 1, 100, 0, 10), 
(@OGUID+6, 142140, 1, 3592.93, -4899.12, 125.755, 2.23402, 0, 0, 0.898793, 0.438373, 300, 300, 1, 100, 0, 10), 
(@OGUID+7, 142140, 1, 3145.88, -5256.87, 94.1848, 4.71239, 0, 0, -0.707107, 0.707107, 300, 300, 1, 100, 0, 10), 
(@OGUID+8, 142140, 1, 3276.13, -4601.25, 96.6221, 2.96704, 0, 0, 0.996194, 0.087165, 300, 300, 1, 100, 0, 10), 
(@OGUID+9, 142140, 1, 3797.78, -5155.82, 142.267, 0.191985, 0, 0, 0.0958452, 0.995396, 300, 300, 1, 100, 0, 10), 
(@OGUID+10, 142140, 1, 3375.36, -4901.83, 123.927, 0.209439, 0, 0, 0.104528, 0.994522, 300, 300, 1, 100, 0, 10), 
(@OGUID+11, 142140, 1, 3277.1, -5305.4, 88.0199, 0.767944, 0, 0, 0.374606, 0.927184, 300, 300, 1, 100, 0, 10), 
(@OGUID+12, 142140, 1, 2665.9, -4615.88, 135.965, 2.82743, 0, 0, 0.987688, 0.156436, 300, 300, 1, 100, 0, 10), 
(@OGUID+13, 142140, 1, 3580.77, -5089.3, 85.0643, 3.42085, 0, 0, -0.990268, 0.139175, 300, 300, 1, 100, 0, 10), 
(@OGUID+14, 142140, 1, 2885.61, -5107.11, 121.661, 4.69494, 0, 0, -0.71325, 0.70091, 300, 300, 1, 100, 0, 10),
(@OGUID+15, 142140, 1, 2995.56, -4113.16, 99.9418, 0.715585, 0, 0, 0.350207, 0.936672, 300, 300, 1, 100, 0, 10),
(@OGUID+16, 142140, 1, 3091.94, -4169.62, 100.002, 4.08407, 0, 0, -0.891006, 0.453991, 300, 300, 1, 100, 0, 10),
(@OGUID+17, 142140, 1, 3261.33, -5065.24, 130.02, 2.84488, 0, 0, 0.989016, 0.147811, 300, 300, 1, 100, 0, 10),
(@OGUID+18, 142140, 1, 3548.76, -4767.67, 111.289, 3.83973, 0, 0, -0.939692, 0.34202, 300, 300, 1, 100, 0, 10),
(@OGUID+19, 142140, 1, 3596.8, -4589.69, 104.494, 3.61284, 0, 0, -0.972369, 0.233448, 300, 300, 1, 100, 0, 10),
(@OGUID+20, 142140, 1, 3661.58, -4666.97, 120.406, 3.45576, 0, 0, -0.987688, 0.156436, 300, 300, 1, 100, 0, 10),
(@OGUID+21, 142140, 1, 4119.12, -7141.15, 16.8198, 1.32645, 0, 0, 0.615661, 0.788011, 300, 300, 1, 100, 0, 10),
(@OGUID+22, 142140, 1, 4399.91, -6148.22, 123.865, 1.0821, 0, 0, 0.515038, 0.857168, 300, 300, 1, 100, 0, 10),
(@OGUID+23, 142140, 1, 4702.21, -5872.97, 110.775, 3.35105, 0, 0, -0.994521, 0.104536, 300, 300, 1, 100, 0, 10);

-- Missing Purple Lotus spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+24, 142140, 0, -12469, -182.317, 14.5772, 5.5676, 0, 0, -0.350207, 0.936672, 300, 300, 1, 100, 0, 10), 
(@OGUID+25, 142140, 0, -11686.2, 723.244, 50.6623, 1.23918, 0, 0, 0.580703, 0.814116, 300, 300, 1, 100, 0, 10), 
(@OGUID+26, 142140, 0, -12162.9, -0.86122, -5.06293, 3.38594, 0, 0, -0.992546, 0.12187, 300, 300, 1, 100, 0, 10), 
(@OGUID+27, 142140, 0, -12832.5, -756.565, 76.742, 5.84685, 0, 0, -0.216439, 0.976296, 300, 300, 1, 100, 0, 10), 
(@OGUID+28, 142140, 0, -13676.8, -285.352, 8.17285, 4.45059, 0, 0, -0.793353, 0.608762, 300, 300, 1, 100, 0, 10),
(@OGUID+29, 142140, 0, -13617.8, -274.348, 8.6585, 5.8294, 0, 0, -0.224951, 0.97437, 300, 300, 1, 100, 0, 10),
(@OGUID+30, 142140, 0, -13007.8, -717.884, 55.3487, 5.3058, 0, 0, -0.469471, 0.882948, 300, 300, 1, 100, 0, 10),
(@OGUID+31, 142140, 0, -12978.9, -610.158, 53.2944, 3.08918, 0, 0, 0.999657, 0.0262016, 300, 300, 1, 100, 0, 10),
(@OGUID+32, 142140, 0, -12929, -592.18, 54.1034, 0.0698117, 0, 0, 0.0348988, 0.999391, 300, 300, 1, 100, 0, 10),
(@OGUID+33, 142140, 0, -12904.2, -875.625, 68.7345, 0.925024, 0, 0, 0.446198, 0.894935, 300, 300, 1, 100, 0, 10),
(@OGUID+34, 142140, 0, -12873.4, -831.288, 54.5933, 0.575957, 0, 0, 0.284015, 0.95882, 300, 300, 1, 100, 0, 10),
(@OGUID+35, 142140, 0, -12704.1, -490.987, 30.4305, 1.64061, 0, 0, 0.731353, 0.681999, 300, 300, 1, 100, 0, 10),
(@OGUID+36, 142140, 0, -12646.8, -477.097, 31.1739, 2.9496, 0, 0, 0.995396, 0.0958512, 300, 300, 1, 100, 0, 10),
(@OGUID+37, 142140, 0, -11722.8, 671.323, 50.3055, 1.71042, 0, 0, 0.754709, 0.656059, 300, 300, 1, 100, 0, 10),
(@OGUID+38, 142140, 0, -11553.6, 736.776, 60.7313, 0.90757, 0, 0, 0.438371, 0.898794, 300, 300, 1, 100, 0, 10);

-- Missing Purple Lotus spawns in The Hinterlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+39, 142140, 0, -316.936, -4234.65, 138.125, 0.628317, 0, 0, 0.309016, 0.951057, 300, 300, 1, 100, 0, 10), 
(@OGUID+40, 142140, 0, -329.511, -4207.55, 152.009, 1.53589, 0, 0, 0.694658, 0.71934, 300, 300, 1, 100, 0, 10), 
(@OGUID+41, 142140, 0, -371.908, -4127, 173.995, 1.79769, 0, 0, 0.782608, 0.622515, 300, 300, 1, 100, 0, 10), 
(@OGUID+42, 142140, 0, -447.216, -4033.18, 197.291, 1.23918, 0, 0, 0.580703, 0.814116, 300, 300, 1, 100, 0, 10), 
(@OGUID+43, 142140, 0, -504.943, -4198.09, 215.861, 4.53786, 0, 0, -0.766044, 0.642789, 300, 300, 1, 100, 0, 10), 
(@OGUID+44, 142140, 0, -575.298, -4170.64, 238.351, 5.49779, 0, 0, -0.382683, 0.92388, 300, 300, 1, 100, 0, 10), 
(@OGUID+45, 142140, 0, -262.42, -3912.02, 215.861, 2.46091, 0, 0, 0.942641, 0.333808, 300, 300, 1, 100, 0, 10), 
(@OGUID+46, 142140, 0, -533.245, -3825.94, 238.163, 6.17847, 0, 0, -0.0523357, 0.99863, 300, 300, 1, 100, 0, 10), 
(@OGUID+47, 142140, 0, -33.9568, -2777.36, 122.507, 5.48033, 0, 0, -0.390731, 0.920505, 300, 300, 1, 100, 0, 10), 
(@OGUID+48, 142140, 0, 389.724, -3402.35, 122.954, 4.32842, 0, 0, -0.829037, 0.559194, 300, 300, 1, 100, 0, 10), 
(@OGUID+49, 142140, 0, -281.208, -4107.5, 138.673, 4.24115, 0, 0, -0.85264, 0.522499, 300, 300, 1, 100, 0, 10), 
(@OGUID+50, 142140, 0, -539.072, -4192.2, 215.934, 3.22886, 0, 0, -0.999048, 0.0436193, 300, 300, 1, 100, 0, 10), 
(@OGUID+51, 142140, 0, -589.769, -3878.78, 238.958, 5.49779, 0, 0, -0.382683, 0.92388, 300, 300, 1, 100, 0, 10), 
(@OGUID+52, 142140, 0, -173.964, -3896.27, 215.861, 0.139624, 0, 0, 0.0697556, 0.997564, 300, 300, 1, 100, 0, 10), 
(@OGUID+53, 142140, 0, -352.482, -4108.68, 152.557, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 1, 100, 0, 10), 
(@OGUID+54, 142140, 0, -422.78, -4200.25, 174.764, 0.279252, 0, 0, 0.139173, 0.990268, 300, 300, 1, 100, 0, 10), 
(@OGUID+55, 142140, 0, -449.898, -3900.91, 216.003, 2.00713, 0, 0, 0.843391, 0.5373, 300, 300, 1, 100, 0, 10), 
(@OGUID+56, 142140, 0, -685.337, -3991.11, 238.496, 6.00393, 0, 0, -0.139173, 0.990268, 300, 300, 1, 100, 0, 10), 
(@OGUID+57, 142140, 0, -418.711, -2793.62, 80.5266, 5.13127, 0, 0, -0.544639, 0.838671, 300, 300, 1, 100, 0, 10), 
(@OGUID+58, 142140, 0, -414.097, -2969.14, 95.1376, 0.0174525, 0, 0, 0.00872612, 0.999962, 300, 300, 1, 100, 0, 10), 
(@OGUID+59, 142140, 0, -531.812, -3946.42, 238.815, 1.69297, 0, 0, 0.748956, 0.66262, 300, 300, 1, 100, 0, 10),
(@OGUID+60, 142140, 0, -509.304, -3980.23, 215.861, 0.645772, 0, 0, 0.317305, 0.948324, 300, 300, 1, 100, 0, 10),
(@OGUID+61, 142140, 0, -484.935, -4047.31, 215.861, 1.64061, 0, 0, 0.731353, 0.681999, 300, 300, 1, 100, 0, 10),
(@OGUID+62, 142140, 0, -436.179, -4099.53, 195.065, 5.98648, 0, 0, -0.147809, 0.989016, 300, 300, 1, 100, 0, 10),
(@OGUID+63, 142140, 0, -273.687, -3844.07, 238.351, 4.67748, 0, 0, -0.719339, 0.694659, 300, 300, 1, 100, 0, 10),
(@OGUID+64, 142140, 0, -236.665, -3645.15, 237.931, 5.14872, 0, 0, -0.537299, 0.843392, 300, 300, 1, 100, 0, 10);

-- Missing Purple Lotus spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+65, 142140, 1, 4167.73, 1054.79, 3.75733, 4.11898, 0, 0, -0.882947, 0.469473, 300, 300, 1, 100, 0, 10), 
(@OGUID+66, 142140, 1, 2881.48, -2757.06, 211.224, 4.88692, 0, 0, -0.642787, 0.766045, 300, 300, 1, 100, 0, 10); 

-- Missing Purple Lotus spawns in Feralas.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+67, 142140, 1, -5449.09, 1327.84, 20.0258, 2.44346, 0, 0, 0.939692, 0.34202, 300, 300, 1, 100, 0, 10), 
(@OGUID+68, 142140, 1, -5770.9, 1320, 51.2895, 3.9619, 0, 0, -0.91706, 0.39875, 300, 300, 1, 100, 0, 10), 
(@OGUID+69, 142140, 1, -5610.68, 1442.64, 27.5771, 2.75761, 0, 0, 0.981627, 0.190812, 300, 300, 1, 100, 0, 10), 
(@OGUID+70, 142140, 1, -5741.64, 1168.35, 64.9306, 2.21657, 0, 0, 0.894934, 0.446199, 300, 300, 1, 100, 0, 10), 
(@OGUID+71, 142140, 1, -5358.88, 1241.68, 22.1054, 0.610863, 0, 0, 0.300705, 0.953717, 300, 300, 1, 100, 0, 10), 
(@OGUID+72, 142140, 1, -5380.43, 1269.73, 21.0369, 1.43117, 0, 0, 0.656058, 0.75471, 300, 300, 1, 100, 0, 10), 
(@OGUID+73, 142140, 1, -4913.04, 1193.57, 56.7543, 1.79769, 0, 0, 0.782608, 0.622515, 300, 300, 1, 100, 0, 10), 
(@OGUID+74, 142140, 1, -3153.04, 1919.11, 45.3751, 2.11185, 0, 0, 0.870356, 0.492424, 300, 300, 1, 100, 0, 10), 
(@OGUID+75, 142140, 1, -5478.73, 1138.19, 48.0808, 6.23083, 0, 0, -0.0261765, 0.999657, 300, 300, 1, 100, 0, 10), 
(@OGUID+76, 142140, 1, -5002.79, 1201.35, 54.0045, 6.05629, 0, 0, -0.113203, 0.993572, 300, 300, 1, 100, 0, 10), 
(@OGUID+77, 142140, 1, -2947.83, 2695.4, 69.0527, 2.93214, 0, 0, 0.994521, 0.104536, 300, 300, 1, 100, 0, 10), 
(@OGUID+78, 142140, 1, -2956.43, 2825.18, 71.4067, 2.54818, 0, 0, 0.956305, 0.292372, 300, 300, 1, 100, 0, 10), 
(@OGUID+79, 142140, 1, -5561.03, 1195.79, 27.0421, 3.33359, 0, 0, -0.995396, 0.0958512, 300, 300, 1, 100, 0, 10), 
(@OGUID+80, 142140, 1, -3823, 1222.52, 150.905, 2.70526, 0, 0, 0.976295, 0.216442, 300, 300, 1, 100, 0, 10),
(@OGUID+81, 142140, 1, -5540.37, 1236.14, 20.6141, 6.02139, 0, 0, -0.130526, 0.991445, 300, 300, 1, 100, 0, 10),
(@OGUID+82, 142140, 1, -5482.52, 1279.18, 22.9122, 4.50295, 0, 0, -0.777145, 0.629321, 300, 300, 1, 100, 0, 10),
(@OGUID+83, 142140, 1, -4544.23, 1272.1, 126.413, 1.83259, 0, 0, 0.793353, 0.608762, 300, 300, 1, 100, 0, 10),
(@OGUID+84, 142140, 1, -4533.25, 1388.1, 126.193, 0.977383, 0, 0, 0.469471, 0.882948, 300, 300, 1, 100, 0, 10),
(@OGUID+85, 142140, 1, -4455.41, 1097.56, 126.638, 3.56047, 0, 0, -0.978148, 0.207912, 300, 300, 1, 100, 0, 10),
(@OGUID+86, 142140, 1, -3123.66, 1847.84, 43.4188, 2.30383, 0, 0, 0.913545, 0.406738, 300, 300, 1, 100, 0, 10),
(@OGUID+87, 142140, 1, -2911.16, 2622.77, 55.0221, 3.35105, 0, 0, -0.994521, 0.104536, 300, 300, 1, 100, 0, 10),
(@OGUID+88, 142140, 1, -2763.84, 2632.74, 71.4734, 0.855211, 0, 0, 0.414693, 0.909961, 300, 300, 1, 100, 0, 10);

-- Missing Purple Lotus spawns in Tanaris.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+89, 142140, 1, -6999.92, -4372.03, 11.0493, 3.94445, 0, 0, -0.920505, 0.390732, 300, 300, 1, 100, 0, 10), 
(@OGUID+90, 142140, 1, -6918.99, -4380.4, 11.7204, 1.29154, 0, 0, 0.601814, 0.798636, 300, 300, 1, 100, 0, 10), 
(@OGUID+91, 142140, 1, -6835.3, -2926.15, 8.88333, 2.32129, 0, 0, 0.91706, 0.39875, 300, 300, 1, 100, 0, 10), 
(@OGUID+92, 142140, 1, -8904.49, -3300.98, 19.1368, 3.42085, 0, 0, -0.990268, 0.139175, 300, 300, 1, 100, 0, 10), 
(@OGUID+93, 142140, 1, -8962.61, -3482.48, 20.1249, 2.14675, 0, 0, 0.878817, 0.47716, 300, 300, 1, 100, 0, 10), 
(@OGUID+94, 142140, 1, -6956.38, -4358.96, 10.5284, 2.89725, 0, 0, 0.992546, 0.12187, 300, 300, 1, 100, 0, 10), 
(@OGUID+95, 142140, 1, -6950.18, -4383.59, 9.9112, 1.71042, 0, 0, 0.754709, 0.656059, 300, 300, 1, 100, 0, 10), 
(@OGUID+96, 142140, 1, -6921.26, -4414.95, 11.598, 0.610863, 0, 0, 0.300705, 0.953717, 300, 300, 1, 100, 0, 10), 
(@OGUID+97, 142140, 1, -9611.99, -2737.25, 17.1735, 3.4383, 0, 0, -0.989016, 0.147811, 300, 300, 1, 100, 0, 10), 
(@OGUID+98, 142140, 1, -7954.11, -3844.91, 23.978, 1.02974, 0, 0, 0.492423, 0.870356, 300, 300, 1, 100, 0, 10), 
(@OGUID+99, 142140, 1, -6986.9, -4349.21, 9.60038, 3.38594, 0, 0, -0.992546, 0.12187, 300, 300, 1, 100, 0, 10), 
(@OGUID+100, 142140, 1, -8838.39, -3526.83, 10.4236, 4.24115, 0, 0, -0.85264, 0.522499, 300, 300, 1, 100, 0, 10), 
(@OGUID+101, 142140, 1, -9147.47, -3029.07, 36.9857, 1.55334, 0, 0, 0.700909, 0.713251, 300, 300, 1, 100, 0, 10), 
(@OGUID+102, 142140, 1, -9281.43, -3085.82, 10.6941, 4.5204, 0, 0, -0.771625, 0.636078, 300, 300, 1, 100, 0, 10), 
(@OGUID+103, 142140, 1, -6948.93, -4308.28, 9.77953, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 1, 100, 0, 10), 
(@OGUID+104, 142140, 1, -7936.81, -3902.71, 9.61212, 4.5204, 0, 0, -0.771625, 0.636078, 300, 300, 1, 100, 0, 10), 
(@OGUID+105, 142140, 1, -9282.16, -3002.91, 13.5028, 0.087266, 0, 0, 0.0436192, 0.999048, 300, 300, 1, 100, 0, 10), 
(@OGUID+106, 142140, 1, -6986.26, -4400.95, 9.79876, 3.59538, 0, 0, -0.97437, 0.224951, 300, 300, 1, 100, 0, 10), 
(@OGUID+107, 142140, 1, -9225.46, -2990.06, 17.4505, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 1, 100, 0, 10),
(@OGUID+108, 142140, 1, -9182.69, -3021.71, 29.7001, 5.23599, 0, 0, -0.5, 0.866025, 300, 300, 1, 100, 0, 10),
(@OGUID+109, 142140, 1, -8880.9, -3466.59, 10.7594, 1.309, 0, 0, 0.608761, 0.793354, 300, 300, 1, 100, 0, 10),
(@OGUID+110, 142140, 1, -8842.05, -3483.83, 10.9182, 0.610863, 0, 0, 0.300705, 0.953717, 300, 300, 1, 100, 0, 10),
(@OGUID+111, 142140, 1, -8057.83, -3926.48, 10.0293, 0.157079, 0, 0, 0.0784588, 0.996917, 300, 300, 1, 100, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1239, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Azshara 114 objects total
(@OGUID+2, 1239, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Azshara 114 objects total
(@OGUID+3, 1239, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Azshara 114 objects total
(@OGUID+4, 1239, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Azshara 114 objects total
(@OGUID+5, 1239, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Azshara 114 objects total
(@OGUID+6, 1239, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Azshara 114 objects total
(@OGUID+7, 1239, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Azshara 114 objects total
(@OGUID+8, 1239, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Azshara 114 objects total
(@OGUID+9, 1239, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Azshara 114 objects total
(@OGUID+10, 1239, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Azshara 114 objects total
(@OGUID+11, 1239, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Azshara 114 objects total
(@OGUID+12, 1239, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Azshara 114 objects total
(@OGUID+13, 1239, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Azshara 114 objects total
(@OGUID+14, 1239, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Azshara 114 objects total
(@OGUID+15, 1239, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Azshara 114 objects total
(@OGUID+16, 1239, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Azshara 114 objects total
(@OGUID+17, 1239, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Azshara 114 objects total
(@OGUID+18, 1239, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Azshara 114 objects total
(@OGUID+19, 1239, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Azshara 114 objects total
(@OGUID+20, 1239, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Azshara 114 objects total
(@OGUID+21, 1239, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Azshara 114 objects total
(@OGUID+22, 1239, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Azshara 114 objects total
(@OGUID+23, 1239, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Azshara 114 objects total
(@OGUID+24, 1199, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Stranglethorn 15 objects total
(@OGUID+25, 1199, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Stranglethorn 15 objects total
(@OGUID+26, 1199, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Stranglethorn 15 objects total
(@OGUID+27, 1199, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Stranglethorn 15 objects total
(@OGUID+28, 1199, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Stranglethorn 15 objects total
(@OGUID+29, 1199, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Stranglethorn 15 objects total
(@OGUID+30, 1199, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Stranglethorn 15 objects total
(@OGUID+31, 1199, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Stranglethorn 15 objects total
(@OGUID+32, 1199, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Stranglethorn 15 objects total
(@OGUID+33, 1199, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Stranglethorn 15 objects total
(@OGUID+34, 1199, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Stranglethorn 15 objects total
(@OGUID+35, 1199, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Stranglethorn 15 objects total
(@OGUID+36, 1199, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Stranglethorn 15 objects total
(@OGUID+37, 1199, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Stranglethorn 15 objects total
(@OGUID+38, 1199, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Stranglethorn 15 objects total
(@OGUID+39, 1254, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Hinterlands 29 objects total
(@OGUID+40, 1254, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Hinterlands 29 objects total
(@OGUID+41, 1254, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Hinterlands 29 objects total
(@OGUID+42, 1254, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Hinterlands 29 objects total
(@OGUID+43, 1254, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Hinterlands 29 objects total
(@OGUID+44, 1254, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Hinterlands 29 objects total
(@OGUID+45, 1254, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Hinterlands 29 objects total
(@OGUID+46, 1254, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Hinterlands 29 objects total
(@OGUID+47, 1254, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Hinterlands 29 objects total
(@OGUID+48, 1254, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Hinterlands 29 objects total
(@OGUID+49, 1254, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Hinterlands 29 objects total
(@OGUID+50, 1254, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Hinterlands 29 objects total
(@OGUID+51, 1254, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Hinterlands 29 objects total
(@OGUID+52, 1254, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Hinterlands 29 objects total
(@OGUID+53, 1254, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Hinterlands 29 objects total
(@OGUID+54, 1254, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Hinterlands 29 objects total
(@OGUID+55, 1254, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Hinterlands 29 objects total
(@OGUID+56, 1254, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Hinterlands 29 objects total
(@OGUID+57, 1254, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Hinterlands 29 objects total
(@OGUID+58, 1254, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Hinterlands 29 objects total
(@OGUID+59, 1254, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Hinterlands 29 objects total
(@OGUID+60, 1254, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Hinterlands 29 objects total
(@OGUID+61, 1254, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Hinterlands 29 objects total
(@OGUID+62, 1254, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Hinterlands 29 objects total
(@OGUID+63, 1254, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Hinterlands 29 objects total
(@OGUID+64, 1254, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Hinterlands 29 objects total
(@OGUID+65, 1305, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Ashenvale 14 objects total
(@OGUID+66, 1305, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Ashenvale 14 objects total
(@OGUID+67, 1324, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Feralas 15 objects total
(@OGUID+68, 1324, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Feralas 15 objects total
(@OGUID+69, 1324, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Feralas 15 objects total
(@OGUID+70, 1324, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Feralas 15 objects total
(@OGUID+71, 1324, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Feralas 15 objects total
(@OGUID+72, 1324, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Feralas 15 objects total
(@OGUID+73, 1324, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Feralas 15 objects total
(@OGUID+74, 1324, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Feralas 15 objects total
(@OGUID+75, 1324, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Feralas 15 objects total
(@OGUID+76, 1324, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Feralas 15 objects total
(@OGUID+77, 1324, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Feralas 15 objects total
(@OGUID+78, 1324, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Feralas 15 objects total
(@OGUID+79, 1324, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Feralas 15 objects total
(@OGUID+80, 1324, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Feralas 15 objects total
(@OGUID+81, 1324, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Feralas 15 objects total
(@OGUID+82, 1324, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Feralas 15 objects total
(@OGUID+83, 1324, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Feralas 15 objects total
(@OGUID+84, 1324, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Feralas 15 objects total
(@OGUID+85, 1324, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Feralas 15 objects total
(@OGUID+86, 1324, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Feralas 15 objects total
(@OGUID+87, 1324, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Feralas 15 objects total
(@OGUID+88, 1324, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Feralas 15 objects total
(@OGUID+89, 1205, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Tanaris 32 objects total
(@OGUID+90, 1205, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Tanaris 32 objects total
(@OGUID+91, 1205, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Tanaris 32 objects total
(@OGUID+92, 1205, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Tanaris 32 objects total
(@OGUID+93, 1205, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Tanaris 32 objects total
(@OGUID+94, 1205, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Tanaris 32 objects total
(@OGUID+95, 1205, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Tanaris 32 objects total
(@OGUID+96, 1205, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Tanaris 32 objects total
(@OGUID+97, 1205, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Tanaris 32 objects total
(@OGUID+98, 1205, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Tanaris 32 objects total
(@OGUID+99, 1205, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Tanaris 32 objects total
(@OGUID+100, 1205, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Tanaris 32 objects total
(@OGUID+101, 1205, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Tanaris 32 objects total
(@OGUID+102, 1205, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Tanaris 32 objects total
(@OGUID+103, 1205, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Tanaris 32 objects total
(@OGUID+104, 1205, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Tanaris 32 objects total
(@OGUID+105, 1205, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Tanaris 32 objects total
(@OGUID+106, 1205, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Tanaris 32 objects total
(@OGUID+107, 1205, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Tanaris 32 objects total
(@OGUID+108, 1205, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Tanaris 32 objects total
(@OGUID+109, 1205, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Tanaris 32 objects total
(@OGUID+110, 1205, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Tanaris 32 objects total
(@OGUID+111, 1205, 0, 'Purple Lotus', 0, 10); -- Purple Lotus in Tanaris 32 objects total

-- Correct Pools
UPDATE `pool_template` SET `description`='Purple Lotus in Ashenvale' WHERE  `entry`=1305;
UPDATE `pool_template` SET `description`='Purple Lotus in Azshara' WHERE  `entry`=1239;
UPDATE `pool_template` SET `description`='Purple Lotus in Badlands' WHERE  `entry`=1286;
UPDATE `pool_template` SET `description`='Purple Lotus in Feralas' WHERE  `entry`=1324;
UPDATE `pool_template` SET `description`='Purple Lotus in Hinterlands' WHERE  `entry`=1254;
UPDATE `pool_template` SET `description`='Purple Lotus in Stranglethorn' WHERE  `entry`=1199;
UPDATE `pool_template` SET `description`='Purple Lotus in Tanaris' WHERE  `entry`=1205;

-- Remove Custom Spawns (Non of these spawns exist in the sniff-db)
DELETE FROM `gameobject` WHERE `guid` IN (15934, 15809, 15865, 15790, 15792, 15793, 15794, 15795, 15797, 15798, 15799, 15801, 15802, 15803, 15804, 15806, 15808, 15810, 15811, 15813, 15815, 15816, 15817, 15818, 15819, 15820, 15822, 15823, 15824, 15825, 15826, 15828, 15829, 15830, 15831, 15832, 15834, 15835, 15836, 15837, 15838, 15840, 15843, 15846, 15848, 15850, 15851, 15852, 15853, 15854, 15855, 15856, 15857, 15858, 15859, 15860, 15861, 15862, 15863, 15867, 15868, 15871, 15872, 15874, 15875, 15877, 15878, 15879, 15880, 15881, 15882, 15883, 15884, 15886, 15887, 15888, 15890, 15891, 15893, 15895, 15897, 15898, 15900, 15901, 15902, 15903, 15904, 15906, 15909, 15910, 15911, 15912, 15914, 15915, 15917, 15919, 15920, 15921, 15922, 15923, 15924, 15925, 15926, 15927, 15928, 15929, 15930, 15931, 15933, 15936, 15938, 15941, 15942, 15943, 15945, 15946, 15947);
DELETE FROM `pool_gameobject` WHERE `guid` IN (15934, 15809, 15865, 15790, 15792, 15793, 15794, 15795, 15797, 15798, 15799, 15801, 15802, 15803, 15804, 15806, 15808, 15810, 15811, 15813, 15815, 15816, 15817, 15818, 15819, 15820, 15822, 15823, 15824, 15825, 15826, 15828, 15829, 15830, 15831, 15832, 15834, 15835, 15836, 15837, 15838, 15840, 15843, 15846, 15848, 15850, 15851, 15852, 15853, 15854, 15855, 15856, 15857, 15858, 15859, 15860, 15861, 15862, 15863, 15867, 15868, 15871, 15872, 15874, 15875, 15877, 15878, 15879, 15880, 15881, 15882, 15883, 15884, 15886, 15887, 15888, 15890, 15891, 15893, 15895, 15897, 15898, 15900, 15901, 15902, 15903, 15904, 15906, 15909, 15910, 15911, 15912, 15914, 15915, 15917, 15919, 15920, 15921, 15922, 15923, 15924, 15925, 15926, 15927, 15928, 15929, 15930, 15931, 15933, 15936, 15938, 15941, 15942, 15943, 15945, 15946, 15947);

-- Sync Gobject Data
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300, `spawn_flags` = 0, `animprogress` = 100 WHERE `id` IN (142140);

-- Update Counters
UPDATE `pool_template` SET `max_limit`=20 WHERE  `entry`=1205;
UPDATE `pool_template` SET `max_limit`=11 WHERE  `entry`=1199;
UPDATE `pool_template` SET `max_limit`=24 WHERE  `entry`=1254;
UPDATE `pool_template` SET `max_limit`=17 WHERE  `entry`=1324;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
