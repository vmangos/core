DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20191102134337');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20191102134337');
-- Add your query below.


-- Add missing gameobject templates.
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES (152583, 5, 2572, 'AuctionNode', 1.6, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES (164759, 7, 39, 'Wooden Chair', 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES (164760, 7, 39, 'Wooden Chair', 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES (164761, 7, 39, 'Wooden Chair', 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES (164762, 7, 39, 'Wooden Chair', 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES (164763, 7, 39, 'Wooden Chair', 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES (164764, 7, 39, 'Wooden Chair', 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES (164765, 7, 39, 'Wooden Chair', 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES (164766, 7, 39, 'Wooden Chair', 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES (164767, 7, 39, 'Wooden Chair', 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES (174597, 2, 3231, 'Corrupted Songflower', 2, 0, 3623, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES (175534, 6, 335, 'Supply Crate', 1.01, 12, 60, 5, 16371, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES (175535, 6, 335, 'Supply Crate', 1.01, 12, 60, 5, 16369, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES (175536, 6, 335, 'Supply Crate', 1.01, 12, 60, 5, 16370, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES (175537, 6, 335, 'Supply Crate', 1.01, 12, 60, 5, 16432, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Add missing gameobject spawns.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES 
(55606, 3705, 0, 1604.67, 204.438, -55.3429, 1.67551, 0, 0, 0.743144, 0.669132, 7200, 7200, 255, 1, 0, 0, 0, 10),
(55636, 3705, 0, 1660.31, 174.48, -41.3685, 3.00195, 0, 0, 0.997563, 0.0697661, 7200, 7200, 255, 1, 0, 0, 0, 10),
(55674, 3662, 0, 1666.5, 115.051, -61.4739, 4.03171, 0, 0, -0.902585, 0.430512, 7200, 7200, 255, 1, 0, 0, 0, 10),
(55751, 1618, 0, 2585.57, 280.206, 46.6648, 0.785397, 0, 0, 0.382683, 0.92388, 900, 900, 255, 1, 0, 0, 0, 10),
(55753, 3658, 0, 2824.09, 300.03, 27.43, 2.09439, 0, 0, 0.866025, 0.500001, 180, 180, 255, 1, 0, 0, 0, 10),
(55754, 1619, 0, 2986.87, 180.857, 1.89819, 2.09439, 0, 0, 0.866025, 0.500001, 900, 900, 255, 1, 0, 0, 0, 10),
(55878, 1731, 1, 1266.67, -3991.47, 23.3678, 6.00393, 0, 0, -0.139173, 0.990268, 900, 900, 255, 1, 0, 0, 0, 10),
(55880, 1618, 1, 1123.47, -4109.11, 18.9393, 3.54302, 0, 0, -0.979924, 0.19937, 900, 900, 255, 1, 0, 0, 0, 10),
(55884, 1731, 1, 798.026, -4046.3, -1.21654, 3.03684, 0, 0, 0.998629, 0.0523532, 900, 900, 255, 1, 0, 0, 0, 10),
(55890, 3724, 1, -383.389, -3783.7, 29.3738, 0.628317, 0, 0, 0.309016, 0.951057, 120, 120, 255, 1, 0, 0, 0, 10),
(55891, 3729, 1, -640.457, -3877.07, 28.5433, 1.79769, 0, 0, 0.782608, 0.622515, 120, 120, 255, 1, 0, 0, 0, 10),
(55892, 3726, 1, -685.994, -3881.35, 41.5266, 1.64061, 0, 0, 0.731353, 0.681999, 120, 120, 255, 1, 0, 0, 0, 10),
(55898, 3689, 1, -1053.18, -3788.83, -24.9376, 4.41568, 0, 0, -0.803857, 0.594823, 3600, 3600, 255, 1, 0, 0, 0, 10),
(55911, 123332, 1, -1458.06, -3972.06, 8.26139, 1.39626, 0, 0, 0.642787, 0.766045, 120, 120, 255, 1, 0, 0, 0, 10),
(55913, 123355, 1, -1458.06, -3972.06, 8.26139, 1.39626, 0, 0, 0.642787, 0.766045, 120, 120, 255, 1, 0, 0, 0, 10),
(55916, 3689, 1, -1618.79, -3956.79, -0.229654, 1.69297, 0, 0, 0.748956, 0.66262, 3600, 3600, 255, 1, 0, 0, 0, 10),
(55917, 2045, 1, -1793.49, -3918.55, -6.77385, 0.994837, 0, 0, 0.477158, 0.878817, 900, 900, 255, 1, 0, 0, 0, 10),
(55918, 2045, 1, -2091.73, -3852.34, -12.8847, 1.37881, 0, 0, 0.636078, 0.771625, 900, 900, 255, 1, 0, 0, 0, 10),
(55919, 2045, 1, -2135.63, -3901.4, -8.63047, 4.93928, 0, 0, -0.622514, 0.782609, 900, 900, 255, 1, 0, 0, 0, 10),
(55931, 180683, 1, -2604.44, -3913.01, 0, 0.366518, 0, 0, 0.182235, 0.983255, 3600, 3600, 255, 1, 0, 0, 7, 10),
(55932, 20983, 1, -2767.1, -3975.07, 34.9388, 3.14159, 0, 0, -1, 0, 120, 120, 255, 1, 0, 0, 0, 10),
(55933, 3707, 1, -2773.38, -3966.53, 35.4322, 2.00713, 0, 0, 0.843391, 0.5373, 180, 180, 255, 1, 0, 0, 0, 10),
(55934, 2043, 1, -2770.72, -3873.4, 37.4555, 5.2709, 0, 0, -0.484809, 0.87462, 1800, 1800, 255, 1, 0, 0, 0, 10),
(55938, 1735, 1, -2972.48, -3509.32, 63.2665, 4.5204, 0, 0, -0.771625, 0.636078, 1800, 1800, 255, 1, 0, 0, 0, 10),
(55939, 3707, 1, -2897.16, -3342.46, 32.1454, 2.28638, 0, 0, 0.909961, 0.414694, 180, 180, 255, 1, 0, 0, 0, 10),
(55943, 3707, 1, -3097.42, -3220.7, 34.1704, 6.10865, 0, 0, -0.0871553, 0.996195, 180, 180, 255, 1, 0, 0, 0, 10),
(55946, 2046, 1, -2944.48, -2756.74, 47.5807, 2.56563, 0, 0, 0.958819, 0.284016, 1800, 1800, 255, 1, 0, 0, 0, 10),
(55947, 2046, 1, -2911.63, -2733.6, 66.2318, 0.680677, 0, 0, 0.333806, 0.942642, 1800, 1800, 255, 1, 0, 0, 0, 10),
(55948, 1735, 1, -2849.43, -2682.88, 33.2633, 5.88176, 0, 0, -0.199367, 0.979925, 1800, 1800, 255, 1, 0, 0, 0, 10),
(55949, 2040, 1, -2814.9, -2589.18, 33.667, 2.02458, 0, 0, 0.848047, 0.529921, 1800, 1800, 255, 1, 0, 0, 0, 10),
(55950, 1735, 1, -2823.51, -2610.95, 37.3061, 6.21337, 0, 0, -0.0348988, 0.999391, 1800, 1800, 255, 1, 0, 0, 0, 10),
(55952, 2042, 1, -2670.64, -2951.66, 38.9982, 4.60767, 0, 0, -0.743144, 0.669132, 1800, 1800, 255, 1, 0, 0, 0, 10),
(55953, 2041, 1, -2601.64, -2914.52, 29.3757, 3.89209, 0, 0, -0.930417, 0.366502, 1800, 1800, 255, 1, 0, 0, 0, 10),
(55954, 1735, 1, -2467.5, -2932.2, 43.5339, 5.72468, 0, 0, -0.275637, 0.961262, 1800, 1800, 255, 1, 0, 0, 0, 10),
(55955, 1732, 1, -2512.52, -2842.59, 63.2461, 2.61799, 0, 0, 0.965925, 0.258821, 900, 900, 255, 1, 0, 0, 0, 10),
(55956, 2041, 1, -2569.71, -3088.42, 30.9634, 0.139625, 0, 0, 0.0697555, 0.997564, 1800, 1800, 255, 1, 0, 0, 0, 10),
(55958, 2043, 1, -2687.53, -3251.11, 35.0143, 2.40855, 0, 0, 0.93358, 0.358368, 1800, 1800, 255, 1, 0, 0, 0, 10),
(55959, 2041, 1, -2741.41, -3352.31, 30.094, 4.90438, 0, 0, -0.636078, 0.771625, 1800, 1800, 255, 1, 0, 0, 0, 10),
(55962, 1735, 1, -2666.44, -4233.33, 13.1624, 3.38594, 0, 0, -0.992546, 0.12187, 1800, 1800, 255, 1, 0, 0, 0, 10),
(55964, 2045, 1, -2629.75, -4240.07, -2.59265, 5.06146, 0, 0, -0.573576, 0.819152, 900, 900, 255, 1, 0, 0, 0, 10),
(55965, 180682, 1, -2818.83, -4238.49, 0, 3.35105, 0, 0, -0.994521, 0.104535, 3600, 3600, 255, 1, 0, 0, 7, 10),
(55967, 2857, 1, -2974.57, -4357.69, 8.98935, 3.54302, 0, 0, -0.979924, 0.19937, 7200, 7200, 255, 1, 0, 0, 0, 10),
(55968, 2046, 1, -2962.82, -4332.27, 18.0261, 2.47837, 0, 0, 0.945518, 0.325568, 1800, 1800, 255, 1, 0, 0, 0, 10),
(55971, 2046, 1, -3112.43, -4127.25, 50.5083, 5.93412, 0, 0, -0.173648, 0.984808, 1800, 1800, 255, 1, 0, 0, 0, 10),
(55992, 2045, 1, -3620.14, -4055.11, -3.78779, 0.523598, 0, 0, 0.258819, 0.965926, 900, 900, 255, 1, 0, 0, 0, 10),
(55993, 4149, 1, -3633.96, -4060.18, -5.87566, 2.02458, 0, 0, 0.848047, 0.529921, 7200, 7200, 255, 1, 0, 0, 0, 10),
(55994, 2046, 1, -3046.96, -3380.2, 44.9054, 1.65806, 0, 0, 0.737277, 0.675591, 1800, 1800, 255, 1, 0, 0, 0, 10),
(56001, 21015, 1, -3701.36, -2535.18, 68.9326, 3.13916, 0, 0.0697555, 0.997563, 0.0012207, 120, 120, 255, 1, 0, 0, 0, 10),
(56002, 21016, 1, -3700.54, -2534.1, 68.7258, 3.14307, -0.00869989, -0.0784559, -0.996879, 0.00142357, 120, 120, 255, 1, 0, 0, 0, 10),
(56005, 2041, 1, -3911.32, -3205.39, 30.3895, 0.785397, 0, 0, 0.382683, 0.92388, 1800, 1800, 255, 1, 0, 0, 0, 10),
(56007, 2041, 1, -4023.87, -3263.74, 32.544, 1.72787, 0, 0, 0.760405, 0.649449, 1800, 1800, 255, 1, 0, 0, 0, 10),
(56008, 2043, 1, -4090.3, -3162.94, 40.5341, 3.89209, 0, 0, -0.930417, 0.366502, 1800, 1800, 255, 1, 0, 0, 0, 10),
(56012, 2042, 1, -3857.15, -3771.82, 40.9882, 4.43314, 0, 0, -0.798635, 0.601815, 1800, 1800, 255, 1, 0, 0, 0, 10),
(56013, 2046, 1, -3802.36, -3812.47, 65.6859, 0.174532, 0, 0, 0.0871553, 0.996195, 1800, 1800, 255, 1, 0, 0, 0, 10),
(56014, 2043, 1, -3772.92, -3562.16, 38.3371, 5.93412, 0, 0, -0.173648, 0.984808, 1800, 1800, 255, 1, 0, 0, 0, 10),
(56015, 2042, 1, -3896.24, -3288.22, 52.1139, 1.43117, 0, 0, 0.656058, 0.75471, 1800, 1800, 255, 1, 0, 0, 0, 10),
(56016, 1624, 1, -3619.13, -2838.4, 36.2724, 2.74016, 0, 0, 0.979924, 0.19937, 1800, 1800, 255, 1, 0, 0, 0, 10),
(56017, 2042, 1, -3498.02, -3224.97, 37.1408, 5.5676, 0, 0, -0.350207, 0.936672, 1800, 1800, 255, 1, 0, 0, 0, 10),
(56019, 2043, 1, -3369.18, -3299.47, 36.9247, 3.97936, 0, 0, -0.913545, 0.406738, 1800, 1800, 255, 1, 0, 0, 0, 10),
(56021, 1735, 1, -3609.48, -3458.61, 46.5524, 2.51327, 0, 0, 0.951056, 0.309017, 1800, 1800, 255, 1, 0, 0, 0, 10),
(56024, 1732, 1, -4203.84, -3725.7, 56.8925, 6.02139, 0, 0, -0.130526, 0.991445, 900, 900, 255, 1, 0, 0, 0, 10),
(56026, 1735, 1, -4344.76, -2621.95, 37.7756, 2.35619, 0, 0, 0.92388, 0.382683, 1800, 1800, 255, 1, 0, 0, 0, 10),
(56028, 2042, 1, -4485.16, -2872.85, 38.5212, 1.02974, 0, 0, 0.492423, 0.870356, 1800, 1800, 255, 1, 0, 0, 0, 10),
(56029, 2043, 1, -4567.23, -2790.01, 39.6747, 4.38078, 0, 0, -0.814116, 0.580703, 1800, 1800, 255, 1, 0, 0, 0, 10),
(56030, 2041, 1, -4541.49, -3057.2, 30.645, 5.2709, 0, 0, -0.484809, 0.87462, 1800, 1800, 255, 1, 0, 0, 0, 10),
(56031, 2041, 1, -4802.6, -3565.6, 30.2318, 3.97936, 0, 0, -0.913545, 0.406738, 1800, 1800, 255, 1, 0, 0, 0, 10),
(56046, 2045, 1, -4387.63, -4101.15, -6.98725, 4.2237, 0, 0, -0.857167, 0.515038, 900, 900, 255, 1, 0, 0, 0, 10),
(56048, 2046, 1, -4349.06, -3367.98, 38.0667, 5.02655, 0, 0, -0.587785, 0.809017, 1800, 1800, 255, 1, 0, 0, 0, 10),
(56049, 4149, 1, -4323.05, -3337.13, 35.764, 1.85005, 0, 0, 0.798635, 0.601815, 7200, 7200, 255, 1, 0, 0, 0, 10),
(56051, 153470, 1, -4350.11, -3295.58, 34.9571, 0.750491, 0, 0, 0.366501, 0.930418, 180, 180, 255, 1, 0, 0, 0, 10),
(56057, 1735, 1, -4381.84, -3001.28, 31.054, 3.194, 0, 0, -0.999657, 0.0262017, 1800, 1800, 255, 1, 0, 0, 0, 10),
(56059, 2040, 1, -4378.35, -2958.63, 27.1648, 3.38594, 0, 0, -0.992546, 0.12187, 1800, 1800, 255, 1, 0, 0, 0, 10),
(56060, 2043, 1, -4298.23, -2864.76, 36.6511, 2.00713, 0, 0, 0.843391, 0.5373, 1800, 1800, 255, 1, 0, 0, 0, 10),
(56062, 4149, 1, -4470.82, -2962.08, 26.4969, 5.37562, 0, 0, -0.438371, 0.898794, 7200, 7200, 255, 1, 0, 0, 0, 10);

-- Add new spawns to pools.
-- excluded guids 55887, 55914, 56066, 56067, 56068, 56069, 56070, 56071, 56072, 56073
UPDATE `gameobject` SET `id`=3726 WHERE `guid`=1798;
INSERT INTO `pool_template` VALUES (43518, 1, 'Undercity: Food Crate / Barrel of Milk', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (45013, 43518, 0, 'Undercity: Food Crate / Barrel of Milk', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (55606, 43518, 0, 'Undercity: Food Crate / Barrel of Milk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43520, 4, 'Dustwallow Marsh: Iron Vein', 0, 0, 7, 10);
INSERT INTO `pool_gameobject` VALUES (55938, 43520, 0, 'Dustwallow Marsh: Iron Vein', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (55948, 43520, 0, 'Dustwallow Marsh: Iron Vein', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (55950, 43520, 0, 'Dustwallow Marsh: Iron Vein', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (55954, 43520, 0, 'Dustwallow Marsh: Iron Vein', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (55962, 43520, 0, 'Dustwallow Marsh: Iron Vein', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (56021, 43520, 0, 'Dustwallow Marsh: Iron Vein', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (56026, 43520, 0, 'Dustwallow Marsh: Iron Vein', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (56057, 43520, 0, 'Dustwallow Marsh: Iron Vein', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43521, 1, 'Dustwallow Marsh: Tin Vein', 0, 0, 7, 10);
INSERT INTO `pool_gameobject` VALUES (55955, 43521, 0, 'Dustwallow Marsh: Tin Vein', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (56024, 43521, 0, 'Dustwallow Marsh: Tin Vein', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43522, 1, 'Dustwallow Marsh: Stranglekelp', 0, 0, 7, 10);
INSERT INTO `pool_gameobject` VALUES (55964, 43522, 0, 'Dustwallow Marsh: Stranglekelp', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (55992, 43522, 0, 'Dustwallow Marsh: Stranglekelp', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (56046, 43522, 0, 'Dustwallow Marsh: Stranglekelp', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43523, 1, 'Fish Node', 0, 0, 7, 10);
INSERT INTO `pool_gameobject` VALUES (56075, 43523, 0, 'Firefin Snapper School', 0, 7, 10);
INSERT INTO `pool_gameobject` VALUES (55965, 43523, 0, 'Oily Blackmouth School', 0, 7, 10);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (56075, 180683, 1, -2818.83, -4238.49, 0, 3.35105, 0, 0, -0.994521, 0.104535, 3600, 3600, 255, 1, 0, 0, 7, 10);
INSERT INTO `pool_template` VALUES (43524, 1, 'Dustwallow Marsh: Mithril Deposit', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (55949, 43524, 0, 'Dustwallow Marsh: Mithril Deposit', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (56059, 43524, 0, 'Dustwallow Marsh: Mithril Deposit', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (55751, 1006, 0, 'Tirisfal Glades: Peacebloom', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (55754, 1005, 0, 'Tirisfal Glades: Earthroot', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (55878, 1024, 0, 'Durotar: Copper Vein', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (55880, 1020, 0, 'Durotar: Peacebloom', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (55884, 1024, 0, 'Durotar: Copper Vein', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (55890, 1030, 0, 'Barrens: Peacebloom', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (55891, 1037, 0, 'Barrens: Briarthorn', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (55892, 1029, 0, 'Barrens: Earthroot', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (55917, 1064, 0, 'Barrens: Stranglekelp', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (55918, 1064, 0, 'Barrens: Stranglekelp', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (55919, 1064, 0, 'Barrens: Stranglekelp', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43519, 1, 'Fish Node', 0, 0, 7, 10);
INSERT INTO `pool_gameobject` VALUES (55931, 43519, 0, 'Firefin Snapper School', 0, 7, 10);
INSERT INTO `pool_gameobject` VALUES (56074, 43519, 0, 'Oily Blackmouth School', 0, 7, 10);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (56074, 180682, 1, -2604.44, -3913.01, 0, 0.366518, 0, 0, 0.182235, 0.983255, 3600, 3600, 255, 1, 0, 0, 7, 10);
INSERT INTO `pool_gameobject` VALUES (55934, 1102, 0, 'Dustwallow Marsh: Khadgar\'s Whisker', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (55946, 1103, 0, 'Dustwallow Marsh: Goldthorn', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (55947, 1103, 0, 'Dustwallow Marsh: Goldthorn', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (55952, 1328, 0, 'Dustwallow Marsh: Fadeleaf', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (55953, 1104, 0, 'Dustwallow Marsh: Liferoot', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (55956, 1104, 0, 'Dustwallow Marsh: Liferoot', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (55958, 1102, 0, 'Dustwallow Marsh: Khadgar\'s Whisker', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (55959, 1104, 0, 'Dustwallow Marsh: Liferoot', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (55968, 1103, 0, 'Dustwallow Marsh: Goldthorn', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (55971, 1103, 0, 'Dustwallow Marsh: Goldthorn', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (55994, 1103, 0, 'Dustwallow Marsh: Goldthorn', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (56005, 1104, 0, 'Dustwallow Marsh: Liferoot', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (56007, 1104, 0, 'Dustwallow Marsh: Liferoot', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (56008, 1102, 0, 'Dustwallow Marsh: Khadgar\'s Whisker', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (56012, 1328, 0, 'Dustwallow Marsh: Fadeleaf', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (56013, 1103, 0, 'Dustwallow Marsh: Goldthorn', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (56014, 1102, 0, 'Dustwallow Marsh: Khadgar\'s Whisker', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (56015, 1328, 0, 'Dustwallow Marsh: Fadeleaf', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (56016, 1039, 0, 'Dustwallow Marsh: Kingsblood', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (56017, 1328, 0, 'Dustwallow Marsh: Fadeleaf', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (56019, 1102, 0, 'Dustwallow Marsh: Khadgar\'s Whisker', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (56028, 1328, 0, 'Dustwallow Marsh: Fadeleaf', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (56029, 1102, 0, 'Dustwallow Marsh: Khadgar\'s Whisker', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (56030, 1104, 0, 'Dustwallow Marsh: Liferoot', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (56031, 1104, 0, 'Dustwallow Marsh: Liferoot', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (56048, 1103, 0, 'Dustwallow Marsh: Goldthorn', 0, 0, 10);
INSERT INTO `pool_gameobject` VALUES (56060, 1102, 0, 'Dustwallow Marsh: Khadgar\'s Whisker', 0, 0, 10);

-- Remove wrong hoofprints spawn.
DELETE FROM `gameobject` WHERE `guid`=10167;
DELETE FROM `gameobject_questrelation` WHERE `id`=187273;
INSERT INTO `gameobject_questrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES (21015, 1268, 0, 10);
INSERT INTO `gameobject_questrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES (21015, 1284, 0, 10);
INSERT INTO `gameobject_questrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES (21016, 1268, 0, 10);
INSERT INTO `gameobject_questrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES (21016, 1284, 0, 10);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
