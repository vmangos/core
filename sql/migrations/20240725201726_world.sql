DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240725201726');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240725201726');
-- Add your query below.


-- Dwarven Fire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(348, 22207, 0, -5525.87, -671.842, 393.892, 1.71915, 0, 0, 0.757565, 0.65276, 60, 60, 100, 0, 3, 10); -- Dun Morogh

-- Highback Chair
UPDATE `gameobject` SET `id`=24391, `position_x`=-8443.97, `position_y`=386.024, `position_z`=121.031, `orientation`=3.02813, `rotation0`=0, `rotation1`=0, `rotation2`=0.998391, `rotation3`=0.0567022 WHERE `guid`=13893;

-- Stone Bench
UPDATE `gameobject` SET `id`=24394, `position_x`=-8303.8, `position_y`=571.122, `position_z`=99.6628, `orientation`=3.82227, `rotation0`=0, `rotation1`=0, `rotation2`=-0.942641, `rotation3`=0.333808 WHERE `guid`=13927;

-- Stone Bench
UPDATE `gameobject` SET `id`=24400, `position_x`=-8331.71, `position_y`=549.014, `position_z`=99.6628, `orientation`=0.680677, `rotation0`=0, `rotation1`=0, `rotation2`=0.333806, `rotation3`=0.942642 WHERE `guid`=13930;

-- Stone Bench
UPDATE `gameobject` SET `id`=24402, `position_x`=-8569.66, `position_y`=842.985, `position_z`=106.574, `orientation`=5.38434, `rotation0`=0, `rotation1`=0, `rotation2`=-0.434444, `rotation3`=0.900699 WHERE `guid`=13852;

-- Stone Bench
UPDATE `gameobject` SET `id`=24403, `position_x`=-8544.2, `position_y`=810.981, `position_z`=106.574, `orientation`=2.24275, `rotation0`=0, `rotation1`=0, `rotation2`=0.900698, `rotation3`=0.434446 WHERE `guid`=13853;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24404, `position_x`=-8462.33, `position_y`=500.753, `position_z`=99.7824, `orientation`=2.24275, `rotation0`=0, `rotation1`=0, `rotation2`=0.900698, `rotation3`=0.434446 WHERE `guid`=11129;

-- Stone Bench
UPDATE `gameobject` SET `id`=24405, `position_x`=-8537.04, `position_y`=816.681, `position_z`=106.574, `orientation`=2.24275, `rotation0`=0, `rotation1`=0, `rotation2`=0.900698, `rotation3`=0.434446 WHERE `guid`=13854;

-- Stone Bench
UPDATE `gameobject` SET `id`=24406, `position_x`=-8548.2, `position_y`=860.051, `position_z`=106.574, `orientation`=5.38434, `rotation0`=0, `rotation1`=0, `rotation2`=-0.434444, `rotation3`=0.900699 WHERE `guid`=13855;

-- Stone Bench
UPDATE `gameobject` SET `id`=24407, `position_x`=-8522.75, `position_y`=828.047, `position_z`=106.574, `orientation`=2.24275, `rotation0`=0, `rotation1`=0, `rotation2`=0.900698, `rotation3`=0.434446 WHERE `guid`=13856;

-- Stone Bench
UPDATE `gameobject` SET `id`=24408, `position_x`=-8428.54, `position_y`=465.506, `position_z`=123.802, `orientation`=0.67195, `rotation0`=0, `rotation1`=0, `rotation2`=0.32969, `rotation3`=0.944089 WHERE `guid`=13857;

-- Stone Bench
UPDATE `gameobject` SET `id`=24409, `position_x`=-8425.62, `position_y`=461.836, `position_z`=123.802, `orientation`=0.67195, `rotation0`=0, `rotation1`=0, `rotation2`=0.32969, `rotation3`=0.944089 WHERE `guid`=13866;

-- Stone Bench
UPDATE `gameobject` SET `id`=24410, `position_x`=-8414.05, `position_y`=447.284, `position_z`=123.802, `orientation`=0.67195, `rotation0`=0, `rotation1`=0, `rotation2`=0.32969, `rotation3`=0.944089 WHERE `guid`=13867;

-- Stone Bench
UPDATE `gameobject` SET `id`=24411, `position_x`=-8410.9, `position_y`=443.331, `position_z`=123.802, `orientation`=0.67195, `rotation0`=0, `rotation1`=0, `rotation2`=0.32969, `rotation3`=0.944089 WHERE `guid`=13858;

-- Stone Bench
UPDATE `gameobject` SET `id`=24412, `position_x`=-8402.45, `position_y`=442.545, `position_z`=123.816, `orientation`=2.24275, `rotation0`=0, `rotation1`=0, `rotation2`=0.900698, `rotation3`=0.434446 WHERE `guid`=13859;

-- Stone Bench
UPDATE `gameobject` SET `id`=24413, `position_x`=-8326.77, `position_y`=580.665, `position_z`=99.6628, `orientation`=5.39307, `rotation0`=0, `rotation1`=0, `rotation2`=-0.430511, `rotation3`=0.902586 WHERE `guid`=13933;

-- Stone Bench
UPDATE `gameobject` SET `id`=24414, `position_x`=-8398.78, `position_y`=445.464, `position_z`=123.816, `orientation`=2.24275, `rotation0`=0, `rotation1`=0, `rotation2`=0.900698, `rotation3`=0.434446 WHERE `guid`=13860;

-- Stone Bench
UPDATE `gameobject` SET `id`=24415, `position_x`=-8397.02, `position_y`=490.578, `position_z`=123.756, `orientation`=3.81355, `rotation0`=0, `rotation1`=0, `rotation2`=-0.944089, `rotation3`=0.329691 WHERE `guid`=13861;

-- Stone Bench
UPDATE `gameobject` SET `id`=24416, `position_x`=-8394.1, `position_y`=486.908, `position_z`=123.756, `orientation`=3.81355, `rotation0`=0, `rotation1`=0, `rotation2`=-0.944089, `rotation3`=0.329691 WHERE `guid`=13862;

-- Stone Bench
UPDATE `gameobject` SET `id`=24417, `position_x`=-8405.34, `position_y`=491.694, `position_z`=123.756, `orientation`=5.38434, `rotation0`=0, `rotation1`=0, `rotation2`=-0.434444, `rotation3`=0.900699 WHERE `guid`=13863;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24418, `position_x`=-8450.8, `position_y`=500.888, `position_z`=99.7824, `orientation`=0.619591, `rotation0`=0, `rotation1`=0, `rotation2`=0.304864, `rotation3`=0.952396 WHERE `guid`=11108;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24419, `position_x`=-8422.86, `position_y`=689.894, `position_z`=96.3214, `orientation`=4.06662, `rotation0`=0, `rotation1`=0, `rotation2`=-0.894934, `rotation3`=0.446199 WHERE `guid`=11080;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24420, `position_x`=-8421.33, `position_y`=688.128, `position_z`=96.3214, `orientation`=3.57793, `rotation0`=0, `rotation1`=0, `rotation2`=-0.976295, `rotation3`=0.216442 WHERE `guid`=11081;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24421, `position_x`=-8421.65, `position_y`=686.171, `position_z`=96.3214, `orientation`=2.9496, `rotation0`=0, `rotation1`=0, `rotation2`=0.995396, `rotation3`=0.0958512 WHERE `guid`=11082;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24422, `position_x`=-8720.9, `position_y`=1051.01, `position_z`=96.0077, `orientation`=0.794123, `rotation0`=0, `rotation1`=0, `rotation2`=0.38671, `rotation3`=0.922201 WHERE `guid`=42800;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24423, `position_x`=-8461.47, `position_y`=494.326, `position_z`=99.7824, `orientation`=0.619591, `rotation0`=0, `rotation1`=0, `rotation2`=0.304864, `rotation3`=0.952396 WHERE `guid`=11130;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24424, `position_x`=-8443.62, `position_y`=491.896, `position_z`=107.038, `orientation`=0.619591, `rotation0`=0, `rotation1`=0, `rotation2`=0.304864, `rotation3`=0.952396 WHERE `guid`=11110;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24425, `position_x`=-8720.49, `position_y`=1053.53, `position_z`=96.0077, `orientation`=5.45415, `rotation0`=0, `rotation1`=0, `rotation2`=-0.402746, `rotation3`=0.915312 WHERE `guid`=42801;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24426, `position_x`=-8718.16, `position_y`=1053.77, `position_z`=96.0077, `orientation`=3.93572, `rotation0`=0, `rotation1`=0, `rotation2`=-0.9222, `rotation3`=0.386713 WHERE `guid`=42802;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24427, `position_x`=-8716.78, `position_y`=1052.48, `position_z`=96.0077, `orientation`=3.93572, `rotation0`=0, `rotation1`=0, `rotation2`=-0.9222, `rotation3`=0.386713 WHERE `guid`=42803;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24428, `position_x`=-8457.3, `position_y`=497.45, `position_z`=99.7824, `orientation`=3.77864, `rotation0`=0, `rotation1`=0, `rotation2`=-0.949698, `rotation3`=0.313166 WHERE `guid`=11131;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24429, `position_x`=-8716.9, `position_y`=1049.97, `position_z`=96.0077, `orientation`=2.33001, `rotation0`=0, `rotation1`=0, `rotation2`=0.918791, `rotation3`=0.394745 WHERE `guid`=42793;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24430, `position_x`=-8719.39, `position_y`=1049.55, `position_z`=96.0077, `orientation`=0.794123, `rotation0`=0, `rotation1`=0, `rotation2`=0.38671, `rotation3`=0.922201 WHERE `guid`=42794;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24431, `position_x`=-8704.69, `position_y`=1049.74, `position_z`=95.9989, `orientation`=5.45415, `rotation0`=0, `rotation1`=0, `rotation2`=-0.402746, `rotation3`=0.915312 WHERE `guid`=42795;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24432, `position_x`=-8702.49, `position_y`=1049.66, `position_z`=95.9989, `orientation`=3.91827, `rotation0`=0, `rotation1`=0, `rotation2`=-0.92554, `rotation3`=0.37865 WHERE `guid`=42796;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24433, `position_x`=-8702.45, `position_y`=1047.57, `position_z`=95.9989, `orientation`=2.31256, `rotation0`=0, `rotation1`=0, `rotation2`=0.915311, `rotation3`=0.402748 WHERE `guid`=42797;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24434, `position_x`=-8704.62, `position_y`=1047.45, `position_z`=95.9989, `orientation`=0.776672, `rotation0`=0, `rotation1`=0, `rotation2`=0.378649, `rotation3`=0.92554 WHERE `guid`=42798;

-- Wooden Chair
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(497, 24435, 0, -8851.73, 1080.93, 95.211, 3.4383, 0, 0, -0.989016, 0.147811, 180, 180, 100, 1, 0, 10); -- Stormwind City

-- Wooden Chair
UPDATE `gameobject` SET `id`=24436, `position_x`=-8459.58, `position_y`=498.366, `position_z`=99.7824, `orientation`=5.38434, `rotation0`=0, `rotation1`=0, `rotation2`=-0.434444, `rotation3`=0.900699 WHERE `guid`=11116;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24437, `position_x`=-8845.74, `position_y`=1089.18, `position_z`=95.211, `orientation`=5.0091, `rotation0`=0, `rotation1`=0, `rotation2`=-0.594822, `rotation3`=0.803857 WHERE `guid`=13391;

-- Wooden Chair
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(505, 24438, 0, -8848.68, 1086.39, 95.211, 0.261798, 0, 0, 0.130526, 0.991445, 180, 180, 100, 1, 0, 10); -- Stormwind City

-- Wooden Chair
UPDATE `gameobject` SET `id`=24439, `position_x`=-8843.11, `position_y`=1080.57, `position_z`=95.211, `orientation`=5.0091, `rotation0`=0, `rotation1`=0, `rotation2`=-0.594822, `rotation3`=0.803857 WHERE `guid`=42799;

-- Wooden Chair
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(511, 24440, 0, -8847.76, 1088.58, 95.211, 5.0091, 0, 0, -0.594822, 0.803857, 180, 180, 100, 1, 0, 10); -- Stormwind City

-- Wooden Chair
UPDATE `gameobject` SET `id`=24441, `position_x`=-8857.44, `position_y`=1072.93, `position_z`=102.466, `orientation`=1.81514, `rotation0`=0, `rotation1`=0, `rotation2`=0.78801, `rotation3`=0.615663 WHERE `guid`=30706;

-- Wooden Chair
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(521, 24442, 0, -8850.39, 1070.48, 95.211, 4.95674, 0, 0, -0.615661, 0.788011, 180, 180, 100, 1, 0, 10); -- Stormwind City

-- Wooden Chair
UPDATE `gameobject` SET `id`=24443, `position_x`=-8851.57, `position_y`=1068.64, `position_z`=95.211, `orientation`=0.279252, `rotation0`=0, `rotation1`=0, `rotation2`=0.139173, `rotation3`=0.990268 WHERE `guid`=30708;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24444, `position_x`=-8860.2, `position_y`=1067.41, `position_z`=102.466, `orientation`=4.95674, `rotation0`=0, `rotation1`=0, `rotation2`=-0.615661, `rotation3`=0.788011 WHERE `guid`=30709;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24445, `position_x`=-8858.18, `position_y`=856.266, `position_z`=99.6083, `orientation`=4.59894, `rotation0`=0, `rotation1`=0, `rotation2`=-0.746058, `rotation3`=0.665882 WHERE `guid`=42810;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24446, `position_x`=-8458.96, `position_y`=493.737, `position_z`=99.7824, `orientation`=2.24275, `rotation0`=0, `rotation1`=0, `rotation2`=0.900698, `rotation3`=0.434446 WHERE `guid`=11117;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24447, `position_x`=-8861.17, `position_y`=1065.46, `position_z`=102.466, `orientation`=0.279252, `rotation0`=0, `rotation1`=0, `rotation2`=0.139173, `rotation3`=0.990268 WHERE `guid`=30711;

-- Wooden Chair
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(533, 24448, 0, -8865.02, 1088.99, 102.466, 3.42085, 0, 0, -0.990268, 0.139175, 180, 180, 100, 1, 0, 10); -- Stormwind City

-- Wooden Chair
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(536, 24449, 0, -8861.76, 1081.64, 102.466, 0.279252, 0, 0, 0.139173, 0.990268, 180, 180, 100, 1, 0, 10); -- Stormwind City

-- Wooden Chair
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(537, 24450, 0, -8868.08, 1088.2, 102.466, 0.279252, 0, 0, 0.139173, 0.990268, 180, 180, 100, 1, 0, 10); -- Stormwind City

-- Stone Bench
UPDATE `gameobject` SET `id`=24451, `position_x`=-8344.28, `position_y`=564.794, `position_z`=99.6628, `orientation`=0.680677, `rotation0`=0, `rotation1`=0, `rotation2`=0.333806, `rotation3`=0.942642 WHERE `guid`=13929;

-- Stone Bench
UPDATE `gameobject` SET `id`=24452, `position_x`=-8409.29, `position_y`=488.549, `position_z`=123.756, `orientation`=5.38434, `rotation0`=0, `rotation1`=0, `rotation2`=-0.434444, `rotation3`=0.900699 WHERE `guid`=13851;

-- Stone Bench
UPDATE `gameobject` SET `id`=24453, `position_x`=-8310.17, `position_y`=579.191, `position_z`=99.6628, `orientation`=3.82227, `rotation0`=0, `rotation1`=0, `rotation2`=-0.942641, `rotation3`=0.333808 WHERE `guid`=13922;

-- Wooden Chair
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(542, 24454, 0, -8866.09, 1086.82, 102.466, 1.81514, 0, 0, 0.78801, 0.615663, 180, 180, 100, 1, 0, 10); -- Stormwind City

-- Wooden Chair
UPDATE `gameobject` SET `id`=24455, `position_x`=-8461.5, `position_y`=496.956, `position_z`=99.7824, `orientation`=5.38434, `rotation0`=0, `rotation1`=0, `rotation2`=-0.434444, `rotation3`=0.900699 WHERE `guid`=11118;

-- Wooden Chair
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(546, 24456, 0, -8858.28, 1075.92, 102.466, 4.95674, 0, 0, -0.615661, 0.788011, 180, 180, 100, 1, 0, 10); -- Stormwind City

-- Wooden Chair
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(549, 24457, 0, -8860.58, 1083.29, 102.466, 4.95674, 0, 0, -0.615661, 0.788011, 180, 180, 100, 1, 0, 10); -- Stormwind City

-- Wooden Chair
UPDATE `gameobject` SET `id`=24458, `position_x`=-9086.42, `position_y`=816.852, `position_z`=115.678, `orientation`=5.044, `rotation0`=0, `rotation1`=0, `rotation2`=-0.580702, `rotation3`=0.814116 WHERE `guid`=42820;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24459, `position_x`=-9087.25, `position_y`=814.728, `position_z`=115.678, `orientation`=0.36652, `rotation0`=0, `rotation1`=0, `rotation2`=0.182236, `rotation3`=0.983255 WHERE `guid`=42817;

-- Stone Bench
UPDATE `gameobject` SET `id`=24460, `position_x`=-8629.14, `position_y`=836.185, `position_z`=96.9638, `orientation`=0.67195, `rotation0`=0, `rotation1`=0, `rotation2`=0.32969, `rotation3`=0.944089 WHERE `guid`=13831;

-- Stone Bench
UPDATE `gameobject` SET `id`=24461, `position_x`=-8297.6, `position_y`=563.411, `position_z`=99.6628, `orientation`=3.82227, `rotation0`=0, `rotation1`=0, `rotation2`=-0.942641, `rotation3`=0.333808 WHERE `guid`=13924;

-- Stone Bench
UPDATE `gameobject` SET `id`=24462, `position_x`=-8626.66, `position_y`=838.402, `position_z`=96.9638, `orientation`=3.81355, `rotation0`=0, `rotation1`=0, `rotation2`=-0.944089, `rotation3`=0.329691 WHERE `guid`=13832;

-- Stone Bench
UPDATE `gameobject` SET `id`=24463, `position_x`=-8620.5, `position_y`=843.234, `position_z`=96.9638, `orientation`=0.67195, `rotation0`=0, `rotation1`=0, `rotation2`=0.32969, `rotation3`=0.944089 WHERE `guid`=13833;

-- Stone Bench
UPDATE `gameobject` SET `id`=24464, `position_x`=-8618.52, `position_y`=844.43, `position_z`=96.9638, `orientation`=3.81355, `rotation0`=0, `rotation1`=0, `rotation2`=-0.944089, `rotation3`=0.329691 WHERE `guid`=13834;

-- Stone Bench
UPDATE `gameobject` SET `id`=24465, `position_x`=-8648.9, `position_y`=815.854, `position_z`=96.8789, `orientation`=2.24275, `rotation0`=0, `rotation1`=0, `rotation2`=0.900698, `rotation3`=0.434446 WHERE `guid`=13864;

-- Stone Bench
UPDATE `gameobject` SET `id`=24466, `position_x`=-8939, `position_y`=958.186, `position_z`=117.188, `orientation`=0.462512, `rotation0`=0, `rotation1`=0, `rotation2`=0.2292, `rotation3`=0.973379 WHERE `guid`=42865;

-- Stone Bench
UPDATE `gameobject` SET `id`=24467, `position_x`=-8939.37, `position_y`=963.449, `position_z`=117.423, `orientation`=5.59378, `rotation0`=0, `rotation1`=0, `rotation2`=-0.337916, `rotation3`=0.941176 WHERE `guid`=42863;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24468, `position_x`=-9093.04, `position_y`=837.802, `position_z`=115.678, `orientation`=3.50812, `rotation0`=0, `rotation1`=0, `rotation2`=-0.983254, `rotation3`=0.182238 WHERE `guid`=42848;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24471, `position_x`=-9089.19, `position_y`=830.854, `position_z`=115.678, `orientation`=0.36652, `rotation0`=0, `rotation1`=0, `rotation2`=0.182236, `rotation3`=0.983255 WHERE `guid`=42849;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24472, `position_x`=-8461.74, `position_y`=479.774, `position_z`=107.038, `orientation`=5.36689, `rotation0`=0, `rotation1`=0, `rotation2`=-0.442288, `rotation3`=0.896873 WHERE `guid`=11100;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24473, `position_x`=-9096.13, `position_y`=836.81, `position_z`=115.678, `orientation`=0.36652, `rotation0`=0, `rotation1`=0, `rotation2`=0.182236, `rotation3`=0.983255 WHERE `guid`=42850;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24474, `position_x`=-9093.92, `position_y`=835.67, `position_z`=115.678, `orientation`=1.90241, `rotation0`=0, `rotation1`=0, `rotation2`=0.814115, `rotation3`=0.580704 WHERE `guid`=42821;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24475, `position_x`=-9085.34, `position_y`=825.549, `position_z`=115.678, `orientation`=5.044, `rotation0`=0, `rotation1`=0, `rotation2`=-0.580702, `rotation3`=0.814116 WHERE `guid`=42822;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24476, `position_x`=-9088.41, `position_y`=832.581, `position_z`=115.678, `orientation`=5.044, `rotation0`=0, `rotation1`=0, `rotation2`=-0.580702, `rotation3`=0.814116 WHERE `guid`=42823;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24477, `position_x`=-9073.92, `position_y`=839.836, `position_z`=108.423, `orientation`=5.09636, `rotation0`=0, `rotation1`=0, `rotation2`=-0.559193, `rotation3`=0.829038 WHERE `guid`=42824;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24478, `position_x`=-9082.6, `position_y`=829.698, `position_z`=108.423, `orientation`=0.383971, `rotation0`=0, `rotation1`=0, `rotation2`=0.190808, `rotation3`=0.981627 WHERE `guid`=42825;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24481, `position_x`=-8848.55, `position_y`=1069.37, `position_z`=95.211, `orientation`=3.42085, `rotation0`=0, `rotation1`=0, `rotation2`=-0.990268, `rotation3`=0.139175 WHERE `guid`=13393;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24482, `position_x`=-9084.33, `position_y`=815.838, `position_z`=115.678, `orientation`=3.50812, `rotation0`=0, `rotation1`=0, `rotation2`=-0.983254, `rotation3`=0.182238 WHERE `guid`=42826;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24483, `position_x`=-8455.23, `position_y`=481.516, `position_z`=107.038, `orientation`=0.619591, `rotation0`=0, `rotation1`=0, `rotation2`=0.304864, `rotation3`=0.952396 WHERE `guid`=11101;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24484, `position_x`=-9087.19, `position_y`=829.71, `position_z`=115.678, `orientation`=1.90241, `rotation0`=0, `rotation1`=0, `rotation2`=0.814115, `rotation3`=0.580704 WHERE `guid`=42827;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24485, `position_x`=-9072.42, `position_y`=836.408, `position_z`=108.423, `orientation`=1.95477, `rotation0`=0, `rotation1`=0, `rotation2`=0.829038, `rotation3`=0.559193 WHERE `guid`=42828;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24491, `position_x`=-8457.3, `position_y`=494.991, `position_z`=99.7824, `orientation`=2.24275, `rotation0`=0, `rotation1`=0, `rotation2`=0.900698, `rotation3`=0.434446 WHERE `guid`=11119;

-- Stone Bench
UPDATE `gameobject` SET `id`=24494, `position_x`=-8569.96, `position_y`=808.856, `position_z`=106.577, `orientation`=5.38434, `rotation0`=0, `rotation1`=0, `rotation2`=-0.434444, `rotation3`=0.900699 WHERE `guid`=13817;

-- Stone Bench
UPDATE `gameobject` SET `id`=24495, `position_x`=-8577.3, `position_y`=818.08, `position_z`=106.577, `orientation`=2.24275, `rotation0`=0, `rotation1`=0, `rotation2`=0.900698, `rotation3`=0.434446 WHERE `guid`=13818;

-- Stone Bench
UPDATE `gameobject` SET `id`=24497, `position_x`=-8316.44, `position_y`=586.892, `position_z`=99.6628, `orientation`=3.82227, `rotation0`=0, `rotation1`=0, `rotation2`=-0.942641, `rotation3`=0.333808 WHERE `guid`=13932;

-- Stone Bench
UPDATE `gameobject` SET `id`=24499, `position_x`=-8338.08, `position_y`=557.083, `position_z`=99.6628, `orientation`=0.680677, `rotation0`=0, `rotation1`=0, `rotation2`=0.333806, `rotation3`=0.942642 WHERE `guid`=13923;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24506, `position_x`=-8845.2, `position_y`=1079.96, `position_z`=95.211, `orientation`=5.0091, `rotation0`=0, `rotation1`=0, `rotation2`=-0.594822, `rotation3`=0.803857 WHERE `guid`=13424;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24509, `position_x`=-8843.8, `position_y`=1087.69, `position_z`=95.211, `orientation`=3.38594, `rotation0`=0, `rotation1`=0, `rotation2`=-0.992546, `rotation3`=0.12187 WHERE `guid`=42804;

-- Highback Chair
UPDATE `gameobject` SET `id`=24521, `position_x`=-8416.52, `position_y`=407.865, `position_z`=121.031, `orientation`=3.02813, `rotation0`=0, `rotation1`=0, `rotation2`=0.998391, `rotation3`=0.0567022 WHERE `guid`=13909;

-- Highback Chair
UPDATE `gameobject` SET `id`=24522, `position_x`=-8367.68, `position_y`=402.366, `position_z`=122.427, `orientation`=5.38434, `rotation0`=0, `rotation1`=0, `rotation2`=-0.434444, `rotation3`=0.900699 WHERE `guid`=13868;

-- Highback Chair
UPDATE `gameobject` SET `id`=24523, `position_x`=-8331.86, `position_y`=398.715, `position_z`=122.427, `orientation`=3.81355, `rotation0`=0, `rotation1`=0, `rotation2`=-0.944089, `rotation3`=0.329691 WHERE `guid`=13869;

-- Highback Chair
UPDATE `gameobject` SET `id`=24524, `position_x`=-8334.09, `position_y`=399.011, `position_z`=122.427, `orientation`=5.38434, `rotation0`=0, `rotation1`=0, `rotation2`=-0.434444, `rotation3`=0.900699 WHERE `guid`=13870;

-- Highback Chair
UPDATE `gameobject` SET `id`=24525, `position_x`=-8426.48, `position_y`=682.416, `position_z`=103.485, `orientation`=2.24275, `rotation0`=0, `rotation1`=0, `rotation2`=0.900698, `rotation3`=0.434446 WHERE `guid`=13921;

-- Highback Chair
UPDATE `gameobject` SET `id`=24526, `position_x`=-8332.09, `position_y`=396.319, `position_z`=122.427, `orientation`=2.24275, `rotation0`=0, `rotation1`=0, `rotation2`=0.900698, `rotation3`=0.434446 WHERE `guid`=13876;

-- Highback Chair
UPDATE `gameobject` SET `id`=24527, `position_x`=-8338.72, `position_y`=401.046, `position_z`=122.403, `orientation`=0.67195, `rotation0`=0, `rotation1`=0, `rotation2`=0.32969, `rotation3`=0.944089 WHERE `guid`=13871;

-- Stone Bench
UPDATE `gameobject` SET `id`=24535, `position_x`=-8307.09, `position_y`=575.318, `position_z`=99.6628, `orientation`=3.82227, `rotation0`=0, `rotation1`=0, `rotation2`=-0.942641, `rotation3`=0.333808 WHERE `guid`=13926;

-- Wooden Bench
UPDATE `gameobject` SET `id`=24540, `position_x`=-8527.79, `position_y`=365.847, `position_z`=108.375, `orientation`=2.24275, `rotation0`=0, `rotation1`=0, `rotation2`=0.900698, `rotation3`=0.434446 WHERE `guid`=13936;

-- Wooden Bench
UPDATE `gameobject` SET `id`=24549, `position_x`=-8526.71, `position_y`=375.12, `position_z`=108.375, `orientation`=3.81355, `rotation0`=0, `rotation1`=0, `rotation2`=-0.944089, `rotation3`=0.329691 WHERE `guid`=13943;

-- Wooden Bench
UPDATE `gameobject` SET `id`=24553, `position_x`=-8532.46, `position_y`=371.912, `position_z`=108.413, `orientation`=2.24275, `rotation0`=0, `rotation1`=0, `rotation2`=0.900698, `rotation3`=0.434446 WHERE `guid`=13945;

-- Wooden Bench
UPDATE `gameobject` SET `id`=24554, `position_x`=-8530.79, `position_y`=369.817, `position_z`=108.413, `orientation`=2.24275, `rotation0`=0, `rotation1`=0, `rotation2`=0.900698, `rotation3`=0.434446 WHERE `guid`=13946;

-- Highback Chair
UPDATE `gameobject` SET `id`=24557, `position_x`=-8419.84, `position_y`=408.35, `position_z`=121.031, `orientation`=6.16974, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0566921, `rotation3`=0.998392 WHERE `guid`=13910;

-- Highback Chair
UPDATE `gameobject` SET `id`=24558, `position_x`=-8345.8, `position_y`=409.895, `position_z`=122.403, `orientation`=0.67195, `rotation0`=0, `rotation1`=0, `rotation2`=0.32969, `rotation3`=0.944089 WHERE `guid`=13872;

-- Highback Chair
UPDATE `gameobject` SET `id`=24559, `position_x`=-8353.99, `position_y`=388.773, `position_z`=122.403, `orientation`=3.81355, `rotation0`=0, `rotation1`=0, `rotation2`=-0.944089, `rotation3`=0.329691 WHERE `guid`=13873;

-- Highback Chair
UPDATE `gameobject` SET `id`=24560, `position_x`=-8361.06, `position_y`=397.722, `position_z`=122.403, `orientation`=3.81355, `rotation0`=0, `rotation1`=0, `rotation2`=-0.944089, `rotation3`=0.329691 WHERE `guid`=13874;

-- Highback Chair
UPDATE `gameobject` SET `id`=24561, `position_x`=-8367.69, `position_y`=400.171, `position_z`=122.427, `orientation`=0.67195, `rotation0`=0, `rotation1`=0, `rotation2`=0.32969, `rotation3`=0.944089 WHERE `guid`=13875;

-- Highback Chair
UPDATE `gameobject` SET `id`=24565, `position_x`=-8314.28, `position_y`=545.67, `position_z`=99.7124, `orientation`=2.24275, `rotation0`=0, `rotation1`=0, `rotation2`=0.900698, `rotation3`=0.434446 WHERE `guid`=13918;

-- Highback Chair
UPDATE `gameobject` SET `id`=24567, `position_x`=-8517.83, `position_y`=328.096, `position_z`=121.031, `orientation`=3.02813, `rotation0`=0, `rotation1`=0, `rotation2`=0.998391, `rotation3`=0.0567022 WHERE `guid`=13898;

-- Highback Chair
UPDATE `gameobject` SET `id`=24569, `position_x`=-8519.2, `position_y`=329.886, `position_z`=121.031, `orientation`=4.59895, `rotation0`=0, `rotation1`=0, `rotation2`=-0.746057, `rotation3`=0.665883 WHERE `guid`=13908;

-- Highback Chair
UPDATE `gameobject` SET `id`=24570, `position_x`=-8519.69, `position_y`=326.564, `position_z`=121.031, `orientation`=1.45735, `rotation0`=0, `rotation1`=0, `rotation2`=0.665881, `rotation3`=0.746058 WHERE `guid`=13899;

-- Highback Chair
UPDATE `gameobject` SET `id`=24571, `position_x`=-8514.88, `position_y`=352.729, `position_z`=121.031, `orientation`=3.02813, `rotation0`=0, `rotation1`=0, `rotation2`=0.998391, `rotation3`=0.0567022 WHERE `guid`=13900;

-- Highback Chair
UPDATE `gameobject` SET `id`=24572, `position_x`=-8518.2, `position_y`=353.214, `position_z`=121.031, `orientation`=6.16974, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0566921, `rotation3`=0.998392 WHERE `guid`=13901;

-- Highback Chair
UPDATE `gameobject` SET `id`=24573, `position_x`=-8516.41, `position_y`=354.585, `position_z`=121.031, `orientation`=4.59895, `rotation0`=0, `rotation1`=0, `rotation2`=-0.746057, `rotation3`=0.665883 WHERE `guid`=13902;

-- Highback Chair
UPDATE `gameobject` SET `id`=24574, `position_x`=-8419.47, `position_y`=383.232, `position_z`=121.031, `orientation`=3.02813, `rotation0`=0, `rotation1`=0, `rotation2`=0.998391, `rotation3`=0.0567022 WHERE `guid`=13911;

-- Highback Chair
UPDATE `gameobject` SET `id`=24575, `position_x`=-8304.55, `position_y`=553.264, `position_z`=99.7124, `orientation`=2.24275, `rotation0`=0, `rotation1`=0, `rotation2`=0.900698, `rotation3`=0.434446 WHERE `guid`=13919;

-- Highback Chair
UPDATE `gameobject` SET `id`=24576, `position_x`=-8491.91, `position_y`=351.793, `position_z`=121.031, `orientation`=4.59895, `rotation0`=0, `rotation1`=0, `rotation2`=-0.746057, `rotation3`=0.665883 WHERE `guid`=13903;

-- Highback Chair
UPDATE `gameobject` SET `id`=24577, `position_x`=-8493.7, `position_y`=350.422, `position_z`=121.031, `orientation`=6.16974, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0566921, `rotation3`=0.998392 WHERE `guid`=13877;

-- Highback Chair
UPDATE `gameobject` SET `id`=24578, `position_x`=-8490.38, `position_y`=349.937, `position_z`=121.031, `orientation`=3.02813, `rotation0`=0, `rotation1`=0, `rotation2`=0.998391, `rotation3`=0.0567022 WHERE `guid`=13913;

-- Highback Chair
UPDATE `gameobject` SET `id`=24579, `position_x`=-8495.18, `position_y`=323.772, `position_z`=121.031, `orientation`=1.45735, `rotation0`=0, `rotation1`=0, `rotation2`=0.665881, `rotation3`=0.746058 WHERE `guid`=13878;

-- Highback Chair
UPDATE `gameobject` SET `id`=24580, `position_x`=-8418.05, `position_y`=409.721, `position_z`=121.031, `orientation`=4.59894, `rotation0`=0, `rotation1`=0, `rotation2`=-0.746058, `rotation3`=0.665882 WHERE `guid`=13912;

-- Highback Chair
UPDATE `gameobject` SET `id`=24581, `position_x`=-8494.7, `position_y`=327.094, `position_z`=121.031, `orientation`=4.59895, `rotation0`=0, `rotation1`=0, `rotation2`=-0.746057, `rotation3`=0.665883 WHERE `guid`=13879;

-- Highback Chair
UPDATE `gameobject` SET `id`=24582, `position_x`=-8493.33, `position_y`=325.304, `position_z`=121.031, `orientation`=3.02813, `rotation0`=0, `rotation1`=0, `rotation2`=0.998391, `rotation3`=0.0567022 WHERE `guid`=13880;

-- Highback Chair
UPDATE `gameobject` SET `id`=24583, `position_x`=-8395.27, `position_y`=295.026, `position_z`=121.031, `orientation`=2.24275, `rotation0`=0, `rotation1`=0, `rotation2`=0.900698, `rotation3`=0.434446 WHERE `guid`=13881;

-- Highback Chair
UPDATE `gameobject` SET `id`=24584, `position_x`=-8395.04, `position_y`=297.422, `position_z`=121.031, `orientation`=3.81355, `rotation0`=0, `rotation1`=0, `rotation2`=-0.944089, `rotation3`=0.329691 WHERE `guid`=13882;

-- Highback Chair
UPDATE `gameobject` SET `id`=24585, `position_x`=-8397.27, `position_y`=297.718, `position_z`=121.031, `orientation`=5.38434, `rotation0`=0, `rotation1`=0, `rotation2`=-0.434444, `rotation3`=0.900699 WHERE `guid`=13883;

-- Highback Chair
UPDATE `gameobject` SET `id`=24586, `position_x`=-8381.92, `position_y`=278.418, `position_z`=121.031, `orientation`=5.38434, `rotation0`=0, `rotation1`=0, `rotation2`=-0.434444, `rotation3`=0.900699 WHERE `guid`=13884;

-- Highback Chair
UPDATE `gameobject` SET `id`=24587, `position_x`=-8442.55, `position_y`=412.513, `position_z`=121.031, `orientation`=4.59894, `rotation0`=0, `rotation1`=0, `rotation2`=-0.746058, `rotation3`=0.665882 WHERE `guid`=13917;

-- Highback Chair
UPDATE `gameobject` SET `id`=24588, `position_x`=-8421.33, `position_y`=381.7, `position_z`=121.031, `orientation`=1.45735, `rotation0`=0, `rotation1`=0, `rotation2`=0.665881, `rotation3`=0.746058 WHERE `guid`=13907;

-- Highback Chair
UPDATE `gameobject` SET `id`=24589, `position_x`=-8423.27, `position_y`=684.967, `position_z`=103.485, `orientation`=2.24275, `rotation0`=0, `rotation1`=0, `rotation2`=0.900698, `rotation3`=0.434446 WHERE `guid`=13920;

-- Highback Chair
UPDATE `gameobject` SET `id`=24590, `position_x`=-8379.69, `position_y`=278.122, `position_z`=121.031, `orientation`=3.81355, `rotation0`=0, `rotation1`=0, `rotation2`=-0.944089, `rotation3`=0.329691 WHERE `guid`=13885;

-- Highback Chair
UPDATE `gameobject` SET `id`=24591, `position_x`=-8379.91, `position_y`=275.726, `position_z`=121.031, `orientation`=2.24275, `rotation0`=0, `rotation1`=0, `rotation2`=0.900698, `rotation3`=0.434446 WHERE `guid`=13886;

-- Highback Chair
UPDATE `gameobject` SET `id`=24592, `position_x`=-8399.42, `position_y`=260.396, `position_z`=121.031, `orientation`=2.24275, `rotation0`=0, `rotation1`=0, `rotation2`=0.900698, `rotation3`=0.434446 WHERE `guid`=13887;

-- Highback Chair
UPDATE `gameobject` SET `id`=24593, `position_x`=-8399.12, `position_y`=262.631, `position_z`=121.031, `orientation`=3.81355, `rotation0`=0, `rotation1`=0, `rotation2`=-0.944089, `rotation3`=0.329691 WHERE `guid`=13888;

-- Highback Chair
UPDATE `gameobject` SET `id`=24594, `position_x`=-8401.82, `position_y`=260.625, `position_z`=121.031, `orientation`=0.67195, `rotation0`=0, `rotation1`=0, `rotation2`=0.32969, `rotation3`=0.944089 WHERE `guid`=13889;

-- Highback Chair
UPDATE `gameobject` SET `id`=24595, `position_x`=-8414.48, `position_y`=281.931, `position_z`=121.031, `orientation`=3.81355, `rotation0`=0, `rotation1`=0, `rotation2`=-0.944089, `rotation3`=0.329691 WHERE `guid`=13890;

-- Highback Chair
UPDATE `gameobject` SET `id`=24596, `position_x`=-8414.77, `position_y`=279.695, `position_z`=121.031, `orientation`=2.24275, `rotation0`=0, `rotation1`=0, `rotation2`=0.900698, `rotation3`=0.434446 WHERE `guid`=13891;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24597, `position_x`=-8459.5, `position_y`=479.333, `position_z`=107.038, `orientation`=3.76119, `rotation0`=0, `rotation1`=0, `rotation2`=-0.952395, `rotation3`=0.304865 WHERE `guid`=11107;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24598, `position_x`=-9076.9, `position_y`=820.725, `position_z`=108.423, `orientation`=5.044, `rotation0`=0, `rotation1`=0, `rotation2`=-0.580702, `rotation3`=0.814116 WHERE `guid`=42818;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24599, `position_x`=-9077.66, `position_y`=818.8, `position_z`=108.423, `orientation`=0.36652, `rotation0`=0, `rotation1`=0, `rotation2`=0.182236, `rotation3`=0.983255 WHERE `guid`=42819;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24602, `position_x`=-9074.4, `position_y`=835.577, `position_z`=108.423, `orientation`=1.95477, `rotation0`=0, `rotation1`=0, `rotation2`=0.829038, `rotation3`=0.559193 WHERE `guid`=42829;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24603, `position_x`=-8454.87, `position_y`=483.763, `position_z`=107.038, `orientation`=5.36689, `rotation0`=0, `rotation1`=0, `rotation2`=-0.442288, `rotation3`=0.896873 WHERE `guid`=11102;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24604, `position_x`=-8449.35, `position_y`=486.372, `position_z`=107.038, `orientation`=0.619591, `rotation0`=0, `rotation1`=0, `rotation2`=0.304864, `rotation3`=0.952396 WHERE `guid`=11103;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24605, `position_x`=-9072.51, `position_y`=830.593, `position_z`=108.423, `orientation`=5.09636, `rotation0`=0, `rotation1`=0, `rotation2`=-0.559193, `rotation3`=0.829038 WHERE `guid`=42830;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24608, `position_x`=-9071.91, `position_y`=838.496, `position_z`=108.423, `orientation`=3.47321, `rotation0`=0, `rotation1`=0, `rotation2`=-0.986285, `rotation3`=0.16505 WHERE `guid`=42831;

-- Highback Chair
UPDATE `gameobject` SET `id`=24609, `position_x`=-8445.34, `position_y`=387.814, `position_z`=121.031, `orientation`=4.59894, `rotation0`=0, `rotation1`=0, `rotation2`=-0.746058, `rotation3`=0.665882 WHERE `guid`=13904;

-- Highback Chair
UPDATE `gameobject` SET `id`=24610, `position_x`=-8445.83, `position_y`=384.492, `position_z`=121.031, `orientation`=1.45735, `rotation0`=0, `rotation1`=0, `rotation2`=0.665881, `rotation3`=0.746058 WHERE `guid`=13905;

-- Stone Bench
UPDATE `gameobject` SET `id`=24611, `position_x`=-8934.69, `position_y`=955.002, `position_z`=117.235, `orientation`=1.27409, `rotation0`=0, `rotation1`=0, `rotation2`=0.594823, `rotation3`=0.803857 WHERE `guid`=42864;

-- Stone Bench
UPDATE `gameobject` SET `id`=24612, `position_x`=-8569.12, `position_y`=817.202, `position_z`=106.577, `orientation`=0.67195, `rotation0`=0, `rotation1`=0, `rotation2`=0.32969, `rotation3`=0.944089 WHERE `guid`=13843;

-- Stone Bench
UPDATE `gameobject` SET `id`=24614, `position_x`=-8569.19, `position_y`=828.855, `position_z`=106.577, `orientation`=3.81355, `rotation0`=0, `rotation1`=0, `rotation2`=-0.944089, `rotation3`=0.329691 WHERE `guid`=13844;

-- Stone Bench
UPDATE `gameobject` SET `id`=24615, `position_x`=-8589.53, `position_y`=812.671, `position_z`=106.577, `orientation`=0.67195, `rotation0`=0, `rotation1`=0, `rotation2`=0.32969, `rotation3`=0.944089 WHERE `guid`=13845;

-- Stone Bench
UPDATE `gameobject` SET `id`=24617, `position_x`=-8578.28, `position_y`=809.912, `position_z`=106.577, `orientation`=3.81355, `rotation0`=0, `rotation1`=0, `rotation2`=-0.944089, `rotation3`=0.329691 WHERE `guid`=13847;

-- Stone Bench
UPDATE `gameobject` SET `id`=24618, `position_x`=-8533.88, `position_y`=871.441, `position_z`=106.574, `orientation`=5.38434, `rotation0`=0, `rotation1`=0, `rotation2`=-0.434444, `rotation3`=0.900699 WHERE `guid`=13848;

-- Stone Bench
UPDATE `gameobject` SET `id`=24619, `position_x`=-8508.43, `position_y`=839.437, `position_z`=106.574, `orientation`=2.24275, `rotation0`=0, `rotation1`=0, `rotation2`=0.900698, `rotation3`=0.434446 WHERE `guid`=13849;

-- Stone Bench
UPDATE `gameobject` SET `id`=24620, `position_x`=-8562.49, `position_y`=848.685, `position_z`=106.574, `orientation`=5.38434, `rotation0`=0, `rotation1`=0, `rotation2`=-0.434444, `rotation3`=0.900699 WHERE `guid`=13850;

-- Stone Bench
UPDATE `gameobject` SET `id`=24621, `position_x`=-8325.44, `position_y`=541.313, `position_z`=99.6628, `orientation`=0.680677, `rotation0`=0, `rotation1`=0, `rotation2`=0.333806, `rotation3`=0.942642 WHERE `guid`=13931;

-- Stone Bench
UPDATE `gameobject` SET `id`=24622, `position_x`=-8335.74, `position_y`=573.539, `position_z`=99.6628, `orientation`=5.39307, `rotation0`=0, `rotation1`=0, `rotation2`=-0.430511, `rotation3`=0.902586 WHERE `guid`=13925;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24623, `position_x`=-9074.96, `position_y`=819.784, `position_z`=108.423, `orientation`=3.50812, `rotation0`=0, `rotation1`=0, `rotation2`=-0.983254, `rotation3`=0.182238 WHERE `guid`=42842;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24624, `position_x`=-9069.08, `position_y`=827.882, `position_z`=108.423, `orientation`=1.95477, `rotation0`=0, `rotation1`=0, `rotation2`=0.829038, `rotation3`=0.559193 WHERE `guid`=42843;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24625, `position_x`=-9068.53, `position_y`=830.027, `position_z`=108.423, `orientation`=3.47321, `rotation0`=0, `rotation1`=0, `rotation2`=-0.986285, `rotation3`=0.16505 WHERE `guid`=42844;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24626, `position_x`=-9071.09, `position_y`=826.994, `position_z`=108.423, `orientation`=1.95477, `rotation0`=0, `rotation1`=0, `rotation2`=0.829038, `rotation3`=0.559193 WHERE `guid`=42845;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24628, `position_x`=-9081.79, `position_y`=827.785, `position_z`=108.423, `orientation`=0.383971, `rotation0`=0, `rotation1`=0, `rotation2`=0.190808, `rotation3`=0.981627 WHERE `guid`=42846;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24629, `position_x`=-9081.58, `position_y`=832.044, `position_z`=108.423, `orientation`=5.044, `rotation0`=0, `rotation1`=0, `rotation2`=-0.580703, `rotation3`=0.814116 WHERE `guid`=42847;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24630, `position_x`=-9078.49, `position_y`=829.069, `position_z`=108.423, `orientation`=3.52557, `rotation0`=0, `rotation1`=0, `rotation2`=-0.981627, `rotation3`=0.190812 WHERE `guid`=42832;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24636, `position_x`=-8326.39, `position_y`=545.578, `position_z`=99.6082, `orientation`=3.4383, `rotation0`=0, `rotation1`=0, `rotation2`=-0.989016, `rotation3`=0.147811 WHERE `guid`=13958;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24637, `position_x`=-8464.03, `position_y`=499.517, `position_z`=99.7824, `orientation`=2.24275, `rotation0`=0, `rotation1`=0, `rotation2`=0.900698, `rotation3`=0.434446 WHERE `guid`=11115;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24638, `position_x`=-8315.54, `position_y`=582.544, `position_z`=99.6082, `orientation`=0.296705, `rotation0`=0, `rotation1`=0, `rotation2`=0.147809, `rotation3`=0.989016 WHERE `guid`=13959;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24639, `position_x`=-8302.66, `position_y`=566.876, `position_z`=99.6082, `orientation`=0.296705, `rotation0`=0, `rotation1`=0, `rotation2`=0.147809, `rotation3`=0.989016 WHERE `guid`=13960;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24640, `position_x`=-8301.25, `position_y`=565.159, `position_z`=99.6082, `orientation`=1.22173, `rotation0`=0, `rotation1`=0, `rotation2`=0.573577, `rotation3`=0.819152 WHERE `guid`=13955;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24641, `position_x`=-8313.98, `position_y`=580.621, `position_z`=99.6082, `orientation`=1.22173, `rotation0`=0, `rotation1`=0, `rotation2`=0.573577, `rotation3`=0.819152 WHERE `guid`=13956;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24642, `position_x`=-8340.08, `position_y`=563.18, `position_z`=99.6082, `orientation`=4.36332, `rotation0`=0, `rotation1`=0, `rotation2`=-0.819152, `rotation3`=0.573577 WHERE `guid`=13961;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24643, `position_x`=-8338.49, `position_y`=561.133, `position_z`=99.6082, `orientation`=3.4383, `rotation0`=0, `rotation1`=0, `rotation2`=-0.989016, `rotation3`=0.147811 WHERE `guid`=13962;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24644, `position_x`=-8407.52, `position_y`=543.856, `position_z`=102.477, `orientation`=3.81355, `rotation0`=0, `rotation1`=0, `rotation2`=-0.944089, `rotation3`=0.329691 WHERE `guid`=11074;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24645, `position_x`=-8464.49, `position_y`=504.235, `position_z`=99.7824, `orientation`=5.38434, `rotation0`=0, `rotation1`=0, `rotation2`=-0.434444, `rotation3`=0.900699 WHERE `guid`=11127;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24646, `position_x`=-8409.46, `position_y`=543.561, `position_z`=95.4882, `orientation`=2.24275, `rotation0`=0, `rotation1`=0, `rotation2`=0.900698, `rotation3`=0.434446 WHERE `guid`=11075;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24647, `position_x`=-8411.34, `position_y`=546.007, `position_z`=95.4882, `orientation`=5.38434, `rotation0`=0, `rotation1`=0, `rotation2`=-0.434444, `rotation3`=0.900699 WHERE `guid`=11083;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24648, `position_x`=-8411.59, `position_y`=543.736, `position_z`=95.4882, `orientation`=0.67195, `rotation0`=0, `rotation1`=0, `rotation2`=0.32969, `rotation3`=0.944089 WHERE `guid`=11084;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24649, `position_x`=-8418.18, `position_y`=554.439, `position_z`=95.4608, `orientation`=5.87303, `rotation0`=0, `rotation1`=0, `rotation2`=-0.203641, `rotation3`=0.979046 WHERE `guid`=11085;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24650, `position_x`=-8418.59, `position_y`=551.879, `position_z`=95.4608, `orientation`=0.349065, `rotation0`=0, `rotation1`=0, `rotation2`=0.173648, `rotation3`=0.984808 WHERE `guid`=11076;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24651, `position_x`=-8416.88, `position_y`=549.811, `position_z`=95.4608, `orientation`=1.07338, `rotation0`=0, `rotation1`=0, `rotation2`=0.511292, `rotation3`=0.859407 WHERE `guid`=11086;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24652, `position_x`=-8414.31, `position_y`=550.168, `position_z`=95.4608, `orientation`=1.93732, `rotation0`=0, `rotation1`=0, `rotation2`=0.824126, `rotation3`=0.566406 WHERE `guid`=11087;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24655, `position_x`=-8450.68, `position_y`=502.968, `position_z`=99.7824, `orientation`=5.36689, `rotation0`=0, `rotation1`=0, `rotation2`=-0.442288, `rotation3`=0.896873 WHERE `guid`=11112;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24656, `position_x`=-8466.29, `position_y`=502.851, `position_z`=99.7824, `orientation`=5.38434, `rotation0`=0, `rotation1`=0, `rotation2`=-0.434444, `rotation3`=0.900699 WHERE `guid`=11128;

-- Highback Chair
UPDATE `gameobject` SET `id`=24657, `position_x`=-8441.02, `position_y`=410.657, `position_z`=121.031, `orientation`=3.02813, `rotation0`=0, `rotation1`=0, `rotation2`=0.998391, `rotation3`=0.0567022 WHERE `guid`=13906;

-- Highback Chair
UPDATE `gameobject` SET `id`=24658, `position_x`=-8444.34, `position_y`=411.142, `position_z`=121.031, `orientation`=6.16974, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0566921, `rotation3`=0.998392 WHERE `guid`=13916;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24659, `position_x`=-8409.19, `position_y`=545.868, `position_z`=95.4882, `orientation`=3.81355, `rotation0`=0, `rotation1`=0, `rotation2`=-0.944089, `rotation3`=0.329691 WHERE `guid`=11077;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24660, `position_x`=-8430.34, `position_y`=697.816, `position_z`=103.337, `orientation`=3.831, `rotation0`=0, `rotation1`=0, `rotation2`=-0.941175, `rotation3`=0.337918 WHERE `guid`=11078;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24661, `position_x`=-8424.65, `position_y`=690.316, `position_z`=96.3214, `orientation`=4.53786, `rotation0`=0, `rotation1`=0, `rotation2`=-0.766044, `rotation3`=0.642789 WHERE `guid`=11079;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24662, `position_x`=-8443.25, `position_y`=494.206, `position_z`=107.038, `orientation`=5.36689, `rotation0`=0, `rotation1`=0, `rotation2`=-0.442288, `rotation3`=0.896873 WHERE `guid`=11109;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24663, `position_x`=-9086.18, `position_y`=823.714, `position_z`=115.678, `orientation`=0.36652, `rotation0`=0, `rotation1`=0, `rotation2`=0.182236, `rotation3`=0.983255 WHERE `guid`=42833;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24664, `position_x`=-8448.99, `position_y`=488.62, `position_z`=107.038, `orientation`=5.36689, `rotation0`=0, `rotation1`=0, `rotation2`=-0.442288, `rotation3`=0.896873 WHERE `guid`=11104;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24665, `position_x`=-9073.26, `position_y`=828.162, `position_z`=108.423, `orientation`=0.349065, `rotation0`=0, `rotation1`=0, `rotation2`=0.173648, `rotation3`=0.984808 WHERE `guid`=42834;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24666, `position_x`=-9079.69, `position_y`=826.846, `position_z`=108.423, `orientation`=1.02102, `rotation0`=0, `rotation1`=0, `rotation2`=0.488621, `rotation3`=0.872496 WHERE `guid`=42851;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24667, `position_x`=-9079.09, `position_y`=831.016, `position_z`=108.423, `orientation`=3.52557, `rotation0`=0, `rotation1`=0, `rotation2`=-0.981627, `rotation3`=0.190812 WHERE `guid`=42835;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24668, `position_x`=-9031.49, `position_y`=853.674, `position_z`=107.114, `orientation`=5.07018, `rotation0`=0, `rotation1`=0, `rotation2`=-0.569997, `rotation3`=0.821647 WHERE `guid`=42836;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24669, `position_x`=-9030.18, `position_y`=850.776, `position_z`=107.114, `orientation`=1.92859, `rotation0`=0, `rotation1`=0, `rotation2`=0.821647, `rotation3`=0.569997 WHERE `guid`=42837;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24670, `position_x`=-9028.44, `position_y`=846.87, `position_z`=107.114, `orientation`=5.26217, `rotation0`=0, `rotation1`=0, `rotation2`=-0.488621, `rotation3`=0.872496 WHERE `guid`=42838;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24671, `position_x`=-9026.85, `position_y`=843.905, `position_z`=107.114, `orientation`=2.12057, `rotation0`=0, `rotation1`=0, `rotation2`=0.872496, `rotation3`=0.488622 WHERE `guid`=42839;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24672, `position_x`=-8446.85, `position_y`=488.252, `position_z`=107.038, `orientation`=3.76119, `rotation0`=0, `rotation1`=0, `rotation2`=-0.952395, `rotation3`=0.304865 WHERE `guid`=11105;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24673, `position_x`=-9034.79, `position_y`=837.916, `position_z`=107.114, `orientation`=2.14675, `rotation0`=0, `rotation1`=0, `rotation2`=0.878817, `rotation3`=0.47716 WHERE `guid`=42840;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24674, `position_x`=-9036.78, `position_y`=840.76, `position_z`=107.114, `orientation`=5.28835, `rotation0`=0, `rotation1`=0, `rotation2`=-0.477158, `rotation3`=0.878818 WHERE `guid`=42841;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24675, `position_x`=-8569.69, `position_y`=887.592, `position_z`=106.523, `orientation`=3.81355, `rotation0`=0, `rotation1`=0, `rotation2`=-0.944089, `rotation3`=0.329691 WHERE `guid`=11039;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24676, `position_x`=-8558.23, `position_y`=873.316, `position_z`=106.523, `orientation`=3.81355, `rotation0`=0, `rotation1`=0, `rotation2`=-0.944089, `rotation3`=0.329691 WHERE `guid`=11040;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24677, `position_x`=-8585.14, `position_y`=877.401, `position_z`=106.523, `orientation`=5.38434, `rotation0`=0, `rotation1`=0, `rotation2`=-0.434444, `rotation3`=0.900699 WHERE `guid`=11041;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24678, `position_x`=-8585.83, `position_y`=874.996, `position_z`=106.523, `orientation`=0.67195, `rotation0`=0, `rotation1`=0, `rotation2`=0.32969, `rotation3`=0.944089 WHERE `guid`=11042;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24679, `position_x`=-8558.51, `position_y`=871.096, `position_z`=106.523, `orientation`=2.24275, `rotation0`=0, `rotation1`=0, `rotation2`=0.900698, `rotation3`=0.434446 WHERE `guid`=11043;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24680, `position_x`=-8452.77, `position_y`=483.293, `position_z`=107.038, `orientation`=3.76119, `rotation0`=0, `rotation1`=0, `rotation2`=-0.952395, `rotation3`=0.304865 WHERE `guid`=11106;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24681, `position_x`=-8571.99, `position_y`=887.916, `position_z`=106.523, `orientation`=5.38434, `rotation0`=0, `rotation1`=0, `rotation2`=-0.434444, `rotation3`=0.900699 WHERE `guid`=11044;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24682, `position_x`=-8528.03, `position_y`=802.491, `position_z`=106.523, `orientation`=0.67195, `rotation0`=0, `rotation1`=0, `rotation2`=0.32969, `rotation3`=0.944089 WHERE `guid`=11045;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24683, `position_x`=-8516.74, `position_y`=788.297, `position_z`=106.523, `orientation`=0.67195, `rotation0`=0, `rotation1`=0, `rotation2`=0.32969, `rotation3`=0.944089 WHERE `guid`=11046;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24684, `position_x`=-8514.44, `position_y`=815.458, `position_z`=106.523, `orientation`=5.38434, `rotation0`=0, `rotation1`=0, `rotation2`=-0.434444, `rotation3`=0.900699 WHERE `guid`=11047;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24685, `position_x`=-8514.44, `position_y`=788.049, `position_z`=106.523, `orientation`=2.24275, `rotation0`=0, `rotation1`=0, `rotation2`=0.900698, `rotation3`=0.434446 WHERE `guid`=11048;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24688, `position_x`=-8448.76, `position_y`=500.585, `position_z`=99.7824, `orientation`=2.22529, `rotation0`=0, `rotation1`=0, `rotation2`=0.896873, `rotation3`=0.442289 WHERE `guid`=11111;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24689, `position_x`=-8501.15, `position_y`=798.666, `position_z`=106.523, `orientation`=2.24275, `rotation0`=0, `rotation1`=0, `rotation2`=0.900698, `rotation3`=0.434446 WHERE `guid`=11049;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24690, `position_x`=-8500.72, `position_y`=801.048, `position_z`=106.523, `orientation`=3.81355, `rotation0`=0, `rotation1`=0, `rotation2`=-0.944089, `rotation3`=0.329691 WHERE `guid`=11050;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24691, `position_x`=-8527.74, `position_y`=804.874, `position_z`=106.523, `orientation`=5.38434, `rotation0`=0, `rotation1`=0, `rotation2`=-0.434444, `rotation3`=0.900699 WHERE `guid`=11051;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24692, `position_x`=-8462.01, `position_y`=503.295, `position_z`=99.7824, `orientation`=3.76119, `rotation0`=0, `rotation1`=0, `rotation2`=-0.952395, `rotation3`=0.304865 WHERE `guid`=11113;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24693, `position_x`=-8512.07, `position_y`=815.228, `position_z`=106.523, `orientation`=3.81355, `rotation0`=0, `rotation1`=0, `rotation2`=-0.944089, `rotation3`=0.329691 WHERE `guid`=11052;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24694, `position_x`=-8498.37, `position_y`=822.401, `position_z`=96.6782, `orientation`=5.38434, `rotation0`=0, `rotation1`=0, `rotation2`=-0.434444, `rotation3`=0.900699 WHERE `guid`=11132;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24695, `position_x`=-8496.03, `position_y`=822.13, `position_z`=96.6782, `orientation`=3.81355, `rotation0`=0, `rotation1`=0, `rotation2`=-0.944089, `rotation3`=0.329691 WHERE `guid`=11053;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24696, `position_x`=-8485.33, `position_y`=808.661, `position_z`=96.6782, `orientation`=3.81355, `rotation0`=0, `rotation1`=0, `rotation2`=-0.944089, `rotation3`=0.329691 WHERE `guid`=11054;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24697, `position_x`=-8485.57, `position_y`=806.179, `position_z`=96.6782, `orientation`=2.24275, `rotation0`=0, `rotation1`=0, `rotation2`=0.900698, `rotation3`=0.434446 WHERE `guid`=11055;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24698, `position_x`=-8510.78, `position_y`=812.485, `position_z`=96.6782, `orientation`=5.38434, `rotation0`=0, `rotation1`=0, `rotation2`=-0.434444, `rotation3`=0.900699 WHERE `guid`=11056;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24699, `position_x`=-8510.99, `position_y`=810.204, `position_z`=96.6782, `orientation`=0.67195, `rotation0`=0, `rotation1`=0, `rotation2`=0.32969, `rotation3`=0.944089 WHERE `guid`=11057;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24700, `position_x`=-8559.96, `position_y`=902.136, `position_z`=96.6897, `orientation`=5.38434, `rotation0`=0, `rotation1`=0, `rotation2`=-0.434444, `rotation3`=0.900699 WHERE `guid`=11058;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24701, `position_x`=-8557.65, `position_y`=901.768, `position_z`=96.6897, `orientation`=3.81355, `rotation0`=0, `rotation1`=0, `rotation2`=-0.944089, `rotation3`=0.329691 WHERE `guid`=11059;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24702, `position_x`=-8546.88, `position_y`=888.219, `position_z`=96.6897, `orientation`=3.81355, `rotation0`=0, `rotation1`=0, `rotation2`=-0.944089, `rotation3`=0.329691 WHERE `guid`=11060;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24703, `position_x`=-8547.14, `position_y`=885.77, `position_z`=96.6897, `orientation`=2.24275, `rotation0`=0, `rotation1`=0, `rotation2`=0.900698, `rotation3`=0.434446 WHERE `guid`=11061;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24704, `position_x`=-8561.78, `position_y`=876.324, `position_z`=96.6897, `orientation`=0.67195, `rotation0`=0, `rotation1`=0, `rotation2`=0.32969, `rotation3`=0.944089 WHERE `guid`=11062;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24705, `position_x`=-8559.54, `position_y`=875.961, `position_z`=96.6897, `orientation`=2.24275, `rotation0`=0, `rotation1`=0, `rotation2`=0.900698, `rotation3`=0.434446 WHERE `guid`=11063;

-- Wooden Chair
UPDATE `gameobject` SET `id`=24706, `position_x`=-8466.44, `position_y`=500.125, `position_z`=99.7824, `orientation`=0.637045, `rotation0`=0, `rotation1`=0, `rotation2`=0.313164, `rotation3`=0.949699 WHERE `guid`=11114;

-- Forge
UPDATE `gameobject` SET `position_x`=-8427.1, `position_y`=631.106, `position_z`=95.6311, `orientation`=2.23402, `rotation0`=0, `rotation1`=0, `rotation2`=0.898794, `rotation3`=0.438371 WHERE `guid`=13970;

-- Warm Fire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(943, 24758, 0, -8882.69, 1084.03, 92.411, 2.67035, 0, 0, 0.972369, 0.233448, 180, 180, 100, 1, 0, 10); -- Stormwind City

-- Warm Fire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(944, 24759, 0, -9109.69, 830.972, 105.623, 5.86431, 0, 0, -0.207911, 0.978148, 180, 180, 100, 1, 0, 10); -- Stormwind City

-- Warm Fire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(945, 24765, 0, -9110.25, 831.412, 105.623, 2.75761, 0, 0, 0.981627, 0.190812, 180, 180, 100, 1, 0, 10); -- Stormwind City

-- Mage Quarter
UPDATE `gameobject` SET `id`=25350, `position_x`=-8863.89, `position_y`=943.257, `position_z`=114.328, `orientation`=0.506145, `rotation0`=0, `rotation1`=0, `rotation2`=0.25038, `rotation3`=0.968148 WHERE `guid`=42877;

-- Mage Quarter
UPDATE `gameobject` SET `id`=25351, `position_x`=-8851.11, `position_y`=920.184, `position_z`=114.328, `orientation`=0.506145, `rotation0`=0, `rotation1`=0, `rotation2`=0.25038, `rotation3`=0.968148 WHERE `guid`=42878;

-- Cathedral Square
UPDATE `gameobject` SET `id`=25355, `position_x`=-8687.9, `position_y`=885.323, `position_z`=103.556, `orientation`=2.24275, `rotation0`=0, `rotation1`=0, `rotation2`=0.900698, `rotation3`=0.434446 WHERE `guid`=42869;

-- Cathedral Square
UPDATE `gameobject` SET `id`=25356, `position_x`=-8667.11, `position_y`=880.119, `position_z`=109.421, `orientation`=2.24275, `rotation0`=0, `rotation1`=0, `rotation2`=0.900698, `rotation3`=0.434446 WHERE `guid`=42870;

-- Cathedral Square
UPDATE `gameobject` SET `id`=25357, `position_x`=-8687.7, `position_y`=863.74, `position_z`=109.421, `orientation`=2.24275, `rotation0`=0, `rotation1`=0, `rotation2`=0.900698, `rotation3`=0.434446 WHERE `guid`=42871;

-- Stormwind Gate
UPDATE `gameobject` SET `id`=28039, `position_x`=-8706.82, `position_y`=865.906, `position_z`=96.1668, `orientation`=2.2602, `rotation0`=0, `rotation1`=0, `rotation2`=0.904454, `rotation3`=0.426571 WHERE `guid`=42879;

-- Dwarven District
UPDATE `gameobject` SET `position_x`=-8479.61, `position_y`=679.04, `position_z`=111.569, `orientation`=2.24275, `rotation0`=0, `rotation1`=0, `rotation2`=0.900698, `rotation3`=0.434446 WHERE `guid`=14136;

-- Dwarven District
UPDATE `gameobject` SET `id`=28045, `position_x`=-8529.82, `position_y`=495.843, `position_z`=111.292, `orientation`=3.81355, `rotation0`=0, `rotation1`=0, `rotation2`=-0.944089, `rotation3`=0.329691 WHERE `guid`=14133;

-- Dwarven District
UPDATE `gameobject` SET `id`=28046, `position_x`=-8458.72, `position_y`=695.654, `position_z`=111.569, `orientation`=2.24275, `rotation0`=0, `rotation1`=0, `rotation2`=0.900698, `rotation3`=0.434446 WHERE `guid`=14135;

-- Dwarven Fire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(961, 29150, 0, -4118.35, -1259.76, 142.855, 0.401425, 0, 0, 0.199368, 0.979925, 7200, 7200, 100, 1, 0, 10); -- Dun Morogh

-- Dwarven Fire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(964, 29151, 0, -4119.26, -1260.4, 142.855, 3.54302, 0, 0, -0.979924, 0.19937, 7200, 7200, 100, 1, 0, 10); -- Dun Morogh

-- Wooden Chair
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(965, 29741, 0, -4598.46, -1716.81, 503.483, 2.80998, 0, 0, 0.986285, 0.16505, 900, 900, 100, 1, 0, 10); -- Dun Morogh

-- Wooden Chair
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(966, 29742, 0, -4590.05, -1724.01, 510.353, 5.20981, 0, 0, -0.511292, 0.859407, 900, 900, 100, 1, 0, 10); -- Dun Morogh

-- Wooden Chair
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(968, 29743, 0, -4589.09, -1703.91, 503.483, 3.42085, 0, 0, -0.990268, 0.139175, 900, 900, 100, 1, 0, 10); -- Dun Morogh

-- Wooden Chair
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(971, 29744, 0, -4592.09, -1725.09, 510.353, 6.25701, 0, 0, -0.0130892, 0.999914, 900, 900, 100, 1, 0, 10); -- Dun Morogh

-- Wooden Chair
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(972, 29745, 0, -4590.41, -1702.22, 503.483, 4.24988, 0, 0, -0.850351, 0.526215, 900, 900, 100, 1, 0, 10); -- Dun Morogh

-- Wooden Chair
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(973, 29746, 0, -4572.61, -1710.12, 510.353, 2.41728, 0, 0, 0.935135, 0.354292, 900, 900, 100, 1, 0, 10); -- Dun Morogh

-- Wooden Chair
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(974, 29747, 0, -4600.95, -1716.9, 503.483, 0.628319, 0, 0, 0.309017, 0.951056, 900, 900, 100, 1, 0, 10); -- Dun Morogh

-- Wooden Chair
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1086, 61919, 1, -3996.15, -5021.5, 7.28278, 2.95833, 0, 0, 0.995805, 0.0915032, 900, 900, 100, 1, 0, 10); -- Dustwallow Marsh

-- Wooden Chair
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1087, 61920, 1, -3999.62, -5018.7, 7.31559, 2.95833, 0, 0, 0.995805, 0.0915032, 900, 900, 100, 1, 0, 10); -- Dustwallow Marsh

-- Wooden Chair
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1088, 61921, 1, -4001.26, -5018.43, 7.31559, 6.02139, 0, 0, -0.130526, 0.991445, 900, 900, 100, 1, 0, 10); -- Dustwallow Marsh

-- Wooden Chair
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1089, 61922, 1, -3998.64, -5014.47, 7.31573, 3.83973, 0, 0, -0.939692, 0.34202, 900, 900, 100, 1, 0, 10); -- Dustwallow Marsh

-- Wooden Chair
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1092, 61923, 1, -3999.49, -5015.19, 7.31573, 0.619593, 0, 0, 0.304865, 0.952396, 900, 900, 100, 1, 0, 10); -- Dustwallow Marsh

-- Wooden Chair
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1096, 61924, 1, -3995.32, -5004.92, 7.31812, 2.95833, 0, 0, 0.995805, 0.0915032, 900, 900, 100, 1, 0, 10); -- Dustwallow Marsh

-- Wooden Chair
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1100, 61925, 1, -3996.82, -5004.64, 7.31812, 6.02139, 0, 0, -0.130526, 0.991445, 900, 900, 100, 1, 0, 10); -- Dustwallow Marsh

-- Wooden Chair
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1116, 101843, 0, 28.083, -1623.78, 203.906, 3.48194, 0, 0, -0.985556, 0.169352, 180, 180, 100, 1, 0, 10); -- Alterac Mountains

-- Cathedral Square
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1117, 103794, 0, -8825.4, 957.326, 99.247, 3.831, 0, 0, -0.941175, 0.337918, 180, 180, 100, 1, 0, 10); -- Stormwind City

-- Old Town
UPDATE `gameobject` SET `id`=103796, `position_x`=-8508.7, `position_y`=658.082, `position_z`=100.564, `orientation`=2.17293, `rotation0`=0, `rotation1`=0, `rotation2`=0.884987, `rotation3`=0.465616 WHERE `guid`=10693;

-- Wooden Chair
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1130, 103797, 0, -8855.14, 1079.94, 95.211, 0.296705, 0, 0, 0.147809, 0.989016, 180, 180, 100, 1, 0, 10); -- Stormwind City

-- Wooden Chair
UPDATE `gameobject` SET `id`=103798, `position_x`=-8858.27, `position_y`=1066.15, `position_z`=102.466, `orientation`=3.42085, `rotation0`=0, `rotation1`=0, `rotation2`=-0.990268, `rotation3`=0.139175 WHERE `guid`=30794;

-- Wooden Chair
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1133, 103799, 0, -8859.81, 1080.39, 102.466, 1.81514, 0, 0, 0.78801, 0.615663, 180, 180, 100, 1, 0, 10); -- Stormwind City

-- Wooden Chair
UPDATE `gameobject` SET `id`=103800, `position_x`=-8844.58, `position_y`=1085.61, `position_z`=95.211, `orientation`=1.8675, `rotation0`=0, `rotation1`=0, `rotation2`=0.803857, `rotation3`=0.594823 WHERE `guid`=17420;

-- Wooden Chair
UPDATE `gameobject` SET `id`=103801, `position_x`=-8846.6, `position_y`=1084.97, `position_z`=95.211, `orientation`=1.8675, `rotation0`=0, `rotation1`=0, `rotation2`=0.803857, `rotation3`=0.594823 WHERE `guid`=17421;

-- Wooden Chair
UPDATE `gameobject` SET `id`=103812, `position_x`=-8996.6, `position_y`=871.903, `position_z`=148.72, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=42891;

-- Summoning Circle
UPDATE `gameobject` SET `position_x`=1805.83, `position_y`=-4373.97, `position_z`=-17.4956, `orientation`=5.51524, `rotation0`=0, `rotation1`=0, `rotation2`=-0.374606, `rotation3`=0.927184 WHERE `guid`=12595;

-- Wooden Chair
UPDATE `gameobject` SET `id`=112899, `position_x`=-8846.09, `position_y`=1077.48, `position_z`=95.211, `orientation`=0.261798, `rotation0`=0, `rotation1`=0, `rotation2`=0.130526, `rotation3`=0.991445 WHERE `guid`=17422;

-- Wooden Chair
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1158, 112900, 0, -8852.63, 1076.63, 95.211, 0.93375, 0, 0, 0.450098, 0.892979, 180, 180, 100, 1, 0, 10); -- Stormwind City

-- Chair
UPDATE `gameobject` SET `id`=136932, `position_x`=157.778, `position_y`=-389.954, `position_z`=121.964, `orientation`=4.71239, `rotation0`=0, `rotation1`=0, `rotation2`=-0.707107, `rotation3`=0.707107 WHERE `guid`=15239;

-- Chair
UPDATE `gameobject` SET `id`=136933, `position_x`=150.609, `position_y`=-396.408, `position_z`=121.964, `orientation`=4.71239, `rotation0`=0, `rotation1`=0, `rotation2`=-0.707107, `rotation3`=0.707107 WHERE `guid`=15237;

-- Chair
UPDATE `gameobject` SET `id`=136934, `position_x`=155.816, `position_y`=-390.035, `position_z`=121.964, `orientation`=4.71239, `rotation0`=0, `rotation1`=0, `rotation2`=-0.707107, `rotation3`=0.707107 WHERE `guid`=15240;

-- Chair
UPDATE `gameobject` SET `id`=136935, `position_x`=145.176, `position_y`=-390.035, `position_z`=121.964, `orientation`=4.71239, `rotation0`=0, `rotation1`=0, `rotation2`=-0.707107, `rotation3`=0.707107 WHERE `guid`=15242;

-- Bench
UPDATE `gameobject` SET `id`=136936, `position_x`=153.36, `position_y`=-386.169, `position_z`=121.964, `orientation`=4.71239, `rotation0`=0, `rotation1`=0, `rotation2`=-0.707107, `rotation3`=0.707107 WHERE `guid`=15565;

-- Bench
UPDATE `gameobject` SET `id`=136937, `position_x`=149.569, `position_y`=-454.687, `position_z`=121.964, `orientation`=1.5708, `rotation0`=0, `rotation1`=0, `rotation2`=0.707107, `rotation3`=0.707107 WHERE `guid`=15566;

-- Bench
UPDATE `gameobject` SET `id`=136938, `position_x`=153.253, `position_y`=-454.707, `position_z`=121.964, `orientation`=1.5708, `rotation0`=0, `rotation1`=0, `rotation2`=0.707107, `rotation3`=0.707107 WHERE `guid`=15567;

-- Chair
UPDATE `gameobject` SET `id`=136939, `position_x`=157.753, `position_y`=-450.158, `position_z`=121.964, `orientation`=1.5708, `rotation0`=0, `rotation1`=0, `rotation2`=0.707107, `rotation3`=0.707107 WHERE `guid`=15238;

-- Chair
UPDATE `gameobject` SET `id`=136940, `position_x`=155.768, `position_y`=-450.239, `position_z`=121.964, `orientation`=1.5708, `rotation0`=0, `rotation1`=0, `rotation2`=0.707107, `rotation3`=0.707107 WHERE `guid`=15235;

-- Chair
UPDATE `gameobject` SET `id`=136941, `position_x`=152.32, `position_y`=-444.305, `position_z`=121.964, `orientation`=1.5708, `rotation0`=0, `rotation1`=0, `rotation2`=0.707107, `rotation3`=0.707107 WHERE `guid`=15243;

-- Chair
UPDATE `gameobject` SET `id`=136942, `position_x`=150.342, `position_y`=-444.305, `position_z`=121.964, `orientation`=1.5708, `rotation0`=0, `rotation1`=0, `rotation2`=0.707107, `rotation3`=0.707107 WHERE `guid`=15244;

-- Chair
UPDATE `gameobject` SET `id`=136943, `position_x`=147.113, `position_y`=-450.158, `position_z`=121.964, `orientation`=1.5708, `rotation0`=0, `rotation1`=0, `rotation2`=0.707107, `rotation3`=0.707107 WHERE `guid`=15245;

-- Chair
UPDATE `gameobject` SET `id`=136944, `position_x`=145.151, `position_y`=-450.239, `position_z`=121.964, `orientation`=1.5708, `rotation0`=0, `rotation1`=0, `rotation2`=0.707107, `rotation3`=0.707107 WHERE `guid`=15246;

-- Bench
UPDATE `gameobject` SET `id`=136946, `position_x`=-172.352, `position_y`=-462.842, `position_z`=87.3983, `orientation`=4.67748, `rotation0`=0, `rotation1`=0, `rotation2`=-0.719339, `rotation3`=0.694659 WHERE `guid`=15570;

-- Fire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1412, 136947, 229, 16.9937, -253.821, 65.4498, 3.14159, 0, 0, -1, 0, 180, 180, 100, 1, 0, 10); -- Blackrock Spire

-- Fire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1413, 136948, 229, 8.17041, -268.98, 65.4498, 3.14159, 0, 0, -1, 0, 180, 180, 100, 1, 0, 10); -- Blackrock Spire

-- Fire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1414, 136949, 229, 51.2451, -274.133, 65.4498, 3.14159, 0, 0, -1, 0, 180, 180, 100, 1, 0, 10); -- Blackrock Spire

-- Bonfire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1415, 136954, 229, 16.1674, -280.865, 9.61726, 3.14159, 0, 0, -1, 0, 180, 180, 100, 1, 0, 10); -- Blackrock Spire

-- Bonfire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1419, 136961, 229, 46.4689, -309.649, 91.5711, 2.72271, 0, 0, 0.978148, 0.207912, 180, 180, 100, 1, 0, 10); -- Blackrock Spire

-- Wooden Chair
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1428, 138614, 1, -3997.64, -5021.22, 7.28278, 6.02139, 0, 0, -0.130526, 0.991445, 900, 900, 100, 1, 0, 10); -- Dustwallow Marsh

-- Wooden Chair
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1471, 147078, 1, -8495.34, -4154.96, -204.363, 5.24775, -0.00745058, 0.130222, -0.48385, 0.865376, 180, 180, 100, 1, 0, 10); -- Tanaris

-- Wooden Chair
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1475, 147079, 1, -8503.11, -4169.82, -204.265, 1.16053, 0.112069, 0.0667381, 0.54418, 0.828767, 180, 180, 100, 1, 0, 10); -- Tanaris

-- Wooden Chair
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1477, 147080, 1, -8492.07, -4155.35, -205.198, 4.61506, -0.0478563, 0.121339, -0.730516, 0.670323, 180, 180, 100, 1, 0, 10); -- Tanaris

-- Wooden Chair
UPDATE `gameobject` SET `id`=147823, `position_x`=-8841.14, `position_y`=1078.93, `position_z`=95.211, `orientation`=3.38594, `rotation0`=0, `rotation1`=0, `rotation2`=-0.992546, `rotation3`=0.12187 WHERE `guid`=42806;

-- Wooden Chair
UPDATE `gameobject` SET `id`=147825, `position_x`=-8843.96, `position_y`=1076.22, `position_z`=95.211, `orientation`=1.8675, `rotation0`=0, `rotation1`=0, `rotation2`=0.803857, `rotation3`=0.594823 WHERE `guid`=17419;

-- Wooden Chair
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1485, 147826, 0, -8854.58, 1078.04, 95.211, 0.296705, 0, 0, 0.147809, 0.989016, 180, 180, 100, 1, 0, 10); -- Stormwind City

-- Wooden Chair
UPDATE `gameobject` SET `id`=147827, `position_x`=-8841.89, `position_y`=1076.86, `position_z`=95.211, `orientation`=1.8675, `rotation0`=0, `rotation1`=0, `rotation2`=0.803857, `rotation3`=0.594823 WHERE `guid`=42805;

-- Wooden Chair
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1490, 147828, 0, -8853.95, 1082.02, 95.211, 4.95673, 0, 0, -0.615662, 0.788011, 180, 180, 100, 1, 0, 10); -- Stormwind City

-- Wooden Chair
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1491, 147829, 0, -8851.16, 1078.87, 95.211, 3.4383, 0, 0, -0.989016, 0.147811, 180, 180, 100, 1, 0, 10); -- Stormwind City

-- Wooden Chair
UPDATE `gameobject` SET `id`=147830, `position_x`=-8859.38, `position_y`=1074.27, `position_z`=102.466, `orientation`=0.279252, `rotation0`=0, `rotation1`=0, `rotation2`=0.139173, `rotation3`=0.990268 WHERE `guid`=30755;

-- Wooden Chair
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1524, 148866, 1, -3985.99, -5039.94, 7.31704, 1.74533, 0, 0, 0.766045, 0.642787, 900, 900, 100, 1, 0, 10); -- Dustwallow Marsh

-- Wooden Chair
UPDATE `gameobject` SET `id`=161476, `position_x`=-9006.84, `position_y`=882.8, `position_z`=148.72, `orientation`=6.2221, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0305386, `rotation3`=0.999534 WHERE `guid`=42893;

-- Wooden Chair
UPDATE `gameobject` SET `id`=161477, `position_x`=-8999.93, `position_y`=877.168, `position_z`=29.7392, `orientation`=0.67195, `rotation0`=0, `rotation1`=0, `rotation2`=0.32969, `rotation3`=0.944089 WHERE `guid`=42894;

-- Wooden Chair
UPDATE `gameobject` SET `id`=161478, `position_x`=-9006.42, `position_y`=859.192, `position_z`=29.7392, `orientation`=3.81355, `rotation0`=0, `rotation1`=0, `rotation2`=-0.944089, `rotation3`=0.329691 WHERE `guid`=42895;

-- Wooden Chair
UPDATE `gameobject` SET `id`=161479, `position_x`=-9004.77, `position_y`=860.181, `position_z`=148.72, `orientation`=1.90241, `rotation0`=0, `rotation1`=0, `rotation2`=0.814115, `rotation3`=0.580704 WHERE `guid`=42896;

-- Wooden Chair
UPDATE `gameobject` SET `id`=161480, `position_x`=-9015.59, `position_y`=862.67, `position_z`=148.72, `orientation`=0.794125, `rotation0`=0, `rotation1`=0, `rotation2`=0.386711, `rotation3`=0.922201 WHERE `guid`=42892;

-- Forge
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1690, 161487, 30, 361.098, -531.693, 71.1898, 4.12771, 0, 0, -0.88089, 0.473321, 180, 180, 100, 1, 3, 10); -- Alterac Valley

-- Bonfire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1691, 161488, 30, 360.915, -497.099, 71.3389, 3.14159, 0, 0, -1, 0, 180, 180, 100, 1, 3, 10); -- Alterac Valley

-- Anvil
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1693, 161489, 30, 360.38, -527.549, 71.1205, 4.23242, 0, 0, -0.854912, 0.518773, 180, 180, 100, 1, 3, 10); -- Alterac Valley

-- Wooden Chair
UPDATE `gameobject` SET `id`=170002, `position_x`=-10653.9, `position_y`=-1257.98, `position_z`=30.6564, `orientation`=4.06662, `rotation0`=0, `rotation1`=0, `rotation2`=-0.894934, `rotation3`=0.446199 WHERE `guid`=3998043;

-- Chair
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(8677, 174503, 230, 873.428, -142.527, -49.7396, 0.375245, 0, 0, 0.186523, 0.98245, 180, 180, 100, 1, 0, 10); -- Blackrock Depths

-- Chair
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(12337, 177364, 1, -1651.59, -4374.85, 17.6702, 0.855211, 0, 0, 0.414693, 0.909961, 180, 180, 100, 1, 0, 10), -- The Barrens
(12338, 177364, 1, -8010.07, -5204.36, 13.1384, 3.53429, 0, 0, -0.980785, 0.19509, 180, 180, 100, 1, 0, 10); -- Tanaris

-- Subway Bench
UPDATE `gameobject` SET `id`=176005, `position_x`=23.3444, `position_y`=2507.95, `position_z`=-4.29468, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=18716;

-- Subway Bench
UPDATE `gameobject` SET `id`=176006, `position_x`=23.4934, `position_y`=2504.6, `position_z`=-4.29468, `orientation`=3.06302, `rotation0`=0, `rotation1`=0, `rotation2`=0.999228, `rotation3`=0.039274 WHERE `guid`=18756;

-- Subway Bench
UPDATE `gameobject` SET `id`=176007, `position_x`=23.3444, `position_y`=2475.57, `position_z`=-4.29468, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=18757;

-- Subway Bench
UPDATE `gameobject` SET `id`=176008, `position_x`=23.4934, `position_y`=2472.22, `position_z`=-4.29468, `orientation`=3.06302, `rotation0`=0, `rotation1`=0, `rotation2`=0.999228, `rotation3`=0.039274 WHERE `guid`=18758;

-- Subway Bench
UPDATE `gameobject` SET `id`=176009, `position_x`=23.6666, `position_y`=2478.91, `position_z`=-4.29468, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=18801;

-- Subway Bench
UPDATE `gameobject` SET `id`=176010, `position_x`=20.5539, `position_y`=2501.28, `position_z`=-4.29468, `orientation`=2.93214, `rotation0`=0, `rotation1`=0, `rotation2`=0.994521, `rotation3`=0.104536 WHERE `guid`=18759;

-- Subway Bench
UPDATE `gameobject` SET `id`=176011, `position_x`=20.7506, `position_y`=2514.58, `position_z`=-4.29468, `orientation`=3.22016, `rotation0`=0, `rotation1`=0, `rotation2`=-0.999228, `rotation3`=0.039274 WHERE `guid`=18763;

-- Subway Bench
UPDATE `gameobject` SET `id`=176012, `position_x`=20.7506, `position_y`=2481.73, `position_z`=-4.29468, `orientation`=3.22016, `rotation0`=0, `rotation1`=0, `rotation2`=-0.999228, `rotation3`=0.039274 WHERE `guid`=18764;

-- Subway Bench
UPDATE `gameobject` SET `id`=176013, `position_x`=20.5539, `position_y`=2468.43, `position_z`=-4.29468, `orientation`=2.93214, `rotation0`=0, `rotation1`=0, `rotation2`=0.994521, `rotation3`=0.104536 WHERE `guid`=18789;

-- Subway Bench
UPDATE `gameobject` SET `id`=176014, `position_x`=39.7335, `position_y`=2508.68, `position_z`=-4.29468, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=18765;

-- Subway Bench
UPDATE `gameobject` SET `id`=176015, `position_x`=39.8293, `position_y`=2514.31, `position_z`=-4.29468, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=18766;

-- Subway Bench
UPDATE `gameobject` SET `id`=176016, `position_x`=39.7016, `position_y`=2501.76, `position_z`=-4.29468, `orientation`=3.06302, `rotation0`=0, `rotation1`=0, `rotation2`=0.999228, `rotation3`=0.039274 WHERE `guid`=18767;

-- Subway Bench
UPDATE `gameobject` SET `id`=176017, `position_x`=39.7015, `position_y`=2469.29, `position_z`=-4.29468, `orientation`=3.06302, `rotation0`=0, `rotation1`=0, `rotation2`=0.999228, `rotation3`=0.039274 WHERE `guid`=18794;

-- Subway Bench
UPDATE `gameobject` SET `id`=176018, `position_x`=39.7335, `position_y`=2476.2, `position_z`=-4.29468, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=18768;

-- Subway Bench
UPDATE `gameobject` SET `id`=176019, `position_x`=39.8293, `position_y`=2481.84, `position_z`=-4.29468, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=18769;

-- Subway Bench
UPDATE `gameobject` SET `id`=176020, `position_x`=-64.4887, `position_y`=2504.56, `position_z`=-4.29468, `orientation`=0, `rotation0`=0, `rotation1`=0, `rotation2`=0, `rotation3`=1 WHERE `guid`=18770;

-- Subway Bench
UPDATE `gameobject` SET `id`=176021, `position_x`=-64.1665, `position_y`=2507.9, `position_z`=-4.29468, `orientation`=0, `rotation0`=0, `rotation1`=0, `rotation2`=0, `rotation3`=1 WHERE `guid`=18774;

-- Subway Bench
UPDATE `gameobject` SET `id`=176022, `position_x`=-64.3156, `position_y`=2511.25, `position_z`=-4.29468, `orientation`=6.20465, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0392599, `rotation3`=0.999229 WHERE `guid`=18798;

-- Subway Bench
UPDATE `gameobject` SET `id`=176023, `position_x`=-63.7322, `position_y`=2475.64, `position_z`=-4.29468, `orientation`=0, `rotation0`=0, `rotation1`=0, `rotation2`=0, `rotation3`=1 WHERE `guid`=18773;

-- Subway Bench
UPDATE `gameobject` SET `id`=176024, `position_x`=-63.8812, `position_y`=2479, `position_z`=-4.29468, `orientation`=6.20465, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0392599, `rotation3`=0.999229 WHERE `guid`=18775;

-- Subway Bench
UPDATE `gameobject` SET `id`=176025, `position_x`=-64.0544, `position_y`=2472.31, `position_z`=-4.29468, `orientation`=0, `rotation0`=0, `rotation1`=0, `rotation2`=0, `rotation3`=1 WHERE `guid`=18795;

-- Subway Bench
UPDATE `gameobject` SET `id`=176026, `position_x`=-61.376, `position_y`=2514.58, `position_z`=-4.29468, `orientation`=6.07375, `rotation0`=0, `rotation1`=0, `rotation2`=-0.104527, `rotation3`=0.994522 WHERE `guid`=18776;

-- Subway Bench
UPDATE `gameobject` SET `id`=176027, `position_x`=-61.5727, `position_y`=2501.27, `position_z`=-4.29468, `orientation`=0.07854, `rotation0`=0, `rotation1`=0, `rotation2`=0.0392599, `rotation3`=0.999229 WHERE `guid`=18777;

-- Subway Bench
UPDATE `gameobject` SET `id`=176028, `position_x`=-61.1384, `position_y`=2469.48, `position_z`=-4.29468, `orientation`=0.07854, `rotation0`=0, `rotation1`=0, `rotation2`=0.0392599, `rotation3`=0.999229 WHERE `guid`=18778;

-- Subway Bench
UPDATE `gameobject` SET `id`=176029, `position_x`=-60.9417, `position_y`=2482.78, `position_z`=-4.29468, `orientation`=6.07375, `rotation0`=0, `rotation1`=0, `rotation2`=-0.104527, `rotation3`=0.994522 WHERE `guid`=18760;

-- Subway Bench
UPDATE `gameobject` SET `id`=176030, `position_x`=-80.5674, `position_y`=2507, `position_z`=-4.29468, `orientation`=0, `rotation0`=0, `rotation1`=0, `rotation2`=0, `rotation3`=1 WHERE `guid`=18761;

-- Subway Bench
UPDATE `gameobject` SET `id`=176031, `position_x`=-80.6632, `position_y`=2501.36, `position_z`=-4.29468, `orientation`=0, `rotation0`=0, `rotation1`=0, `rotation2`=0, `rotation3`=1 WHERE `guid`=18762;

-- Subway Bench
UPDATE `gameobject` SET `id`=176032, `position_x`=-80.5355, `position_y`=2513.92, `position_z`=-4.29468, `orientation`=6.20465, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0392599, `rotation3`=0.999229 WHERE `guid`=18790;

-- Subway Bench
UPDATE `gameobject` SET `id`=176033, `position_x`=-80.6469, `position_y`=2480.34, `position_z`=-4.29468, `orientation`=6.20465, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0392599, `rotation3`=0.999229 WHERE `guid`=18780;

-- Subway Bench
UPDATE `gameobject` SET `id`=176034, `position_x`=-80.6789, `position_y`=2473.42, `position_z`=-4.29468, `orientation`=0, `rotation0`=0, `rotation1`=0, `rotation2`=0, `rotation3`=1 WHERE `guid`=18771;

-- Subway Bench
UPDATE `gameobject` SET `id`=176035, `position_x`=-80.7747, `position_y`=2467.78, `position_z`=-4.29468, `orientation`=0, `rotation0`=0, `rotation1`=0, `rotation2`=0, `rotation3`=1 WHERE `guid`=18717;

-- Subway Bench
UPDATE `gameobject` SET `id`=176036, `position_x`=-64.5702, `position_y`=-10.5595, `position_z`=-4.29485, `orientation`=0, `rotation0`=0, `rotation1`=0, `rotation2`=0, `rotation3`=1 WHERE `guid`=18792;

-- Subway Bench
UPDATE `gameobject` SET `id`=176037, `position_x`=-64.248, `position_y`=-7.22165, `position_z`=-4.29485, `orientation`=0, `rotation0`=0, `rotation1`=0, `rotation2`=0, `rotation3`=1 WHERE `guid`=18721;

-- Subway Bench
UPDATE `gameobject` SET `id`=176038, `position_x`=-64.397, `position_y`=-3.87008, `position_z`=-4.29485, `orientation`=6.20465, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0392599, `rotation3`=0.999229 WHERE `guid`=18722;

-- Subway Bench
UPDATE `gameobject` SET `id`=176039, `position_x`=-64.248, `position_y`=25.1631, `position_z`=-4.29485, `orientation`=0, `rotation0`=0, `rotation1`=0, `rotation2`=0, `rotation3`=1 WHERE `guid`=18723;

-- Subway Bench
UPDATE `gameobject` SET `id`=176040, `position_x`=-64.397, `position_y`=28.5147, `position_z`=-4.29485, `orientation`=6.20465, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0392599, `rotation3`=0.999229 WHERE `guid`=18799;

-- Subway Bench
UPDATE `gameobject` SET `id`=176041, `position_x`=-64.5702, `position_y`=21.8254, `position_z`=-4.29485, `orientation`=0, `rotation0`=0, `rotation1`=0, `rotation2`=0, `rotation3`=1 WHERE `guid`=18724;

-- Subway Bench
UPDATE `gameobject` SET `id`=176042, `position_x`=-61.4575, `position_y`=-0.546299, `position_z`=-4.29485, `orientation`=6.07375, `rotation0`=0, `rotation1`=0, `rotation2`=-0.104527, `rotation3`=0.994522 WHERE `guid`=18725;

-- Subway Bench
UPDATE `gameobject` SET `id`=176043, `position_x`=-61.6542, `position_y`=-13.8475, `position_z`=-4.29485, `orientation`=0.07854, `rotation0`=0, `rotation1`=0, `rotation2`=0.0392599, `rotation3`=0.999229 WHERE `guid`=18726;

-- Subway Bench
UPDATE `gameobject` SET `id`=176044, `position_x`=-61.6542, `position_y`=19.0014, `position_z`=-4.29485, `orientation`=0.07854, `rotation0`=0, `rotation1`=0, `rotation2`=0.0392599, `rotation3`=0.999229 WHERE `guid`=18727;

-- Subway Bench
UPDATE `gameobject` SET `id`=176045, `position_x`=-61.4575, `position_y`=32.3024, `position_z`=-4.29485, `orientation`=6.07375, `rotation0`=0, `rotation1`=0, `rotation2`=-0.104527, `rotation3`=0.994522 WHERE `guid`=18793;

-- Subway Bench
UPDATE `gameobject` SET `id`=176046, `position_x`=-80.6371, `position_y`=-7.94344, `position_z`=-4.29485, `orientation`=0, `rotation0`=0, `rotation1`=0, `rotation2`=0, `rotation3`=1 WHERE `guid`=18800;

-- Subway Bench
UPDATE `gameobject` SET `id`=176047, `position_x`=-80.7329, `position_y`=-13.5812, `position_z`=-4.29485, `orientation`=0, `rotation0`=0, `rotation1`=0, `rotation2`=0, `rotation3`=1 WHERE `guid`=18728;

-- Subway Bench
UPDATE `gameobject` SET `id`=176048, `position_x`=-80.6052, `position_y`=-1.02612, `position_z`=-4.29485, `orientation`=6.20465, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0392599, `rotation3`=0.999229 WHERE `guid`=18729;

-- Subway Bench
UPDATE `gameobject` SET `id`=176049, `position_x`=-80.6052, `position_y`=31.4461, `position_z`=-4.29485, `orientation`=6.20465, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0392599, `rotation3`=0.999229 WHERE `guid`=18730;

-- Subway Bench
UPDATE `gameobject` SET `id`=176050, `position_x`=-80.6371, `position_y`=24.529, `position_z`=-4.29485, `orientation`=0, `rotation0`=0, `rotation1`=0, `rotation2`=0, `rotation3`=1 WHERE `guid`=18731;

-- Subway Bench
UPDATE `gameobject` SET `id`=176051, `position_x`=-80.7329, `position_y`=18.891, `position_z`=-4.29485, `orientation`=0, `rotation0`=0, `rotation1`=0, `rotation2`=0, `rotation3`=1 WHERE `guid`=18732;

-- Subway Bench
UPDATE `gameobject` SET `id`=176052, `position_x`=23.5851, `position_y`=-3.82999, `position_z`=-4.29485, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=18733;

-- Subway Bench
UPDATE `gameobject` SET `id`=176053, `position_x`=23.2629, `position_y`=-7.16788, `position_z`=-4.29485, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=18788;

-- Subway Bench
UPDATE `gameobject` SET `id`=176054, `position_x`=23.412, `position_y`=-10.5194, `position_z`=-4.29485, `orientation`=3.06302, `rotation0`=0, `rotation1`=0, `rotation2`=0.999228, `rotation3`=0.039274 WHERE `guid`=18750;

-- Subway Bench
UPDATE `gameobject` SET `id`=176055, `position_x`=22.8286, `position_y`=25.0888, `position_z`=-4.29485, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=18751;

-- Subway Bench
UPDATE `gameobject` SET `id`=176056, `position_x`=22.9776, `position_y`=21.7373, `position_z`=-4.29485, `orientation`=3.06302, `rotation0`=0, `rotation1`=0, `rotation2`=0.999228, `rotation3`=0.039274 WHERE `guid`=18752;

-- Subway Bench
UPDATE `gameobject` SET `id`=176057, `position_x`=23.1508, `position_y`=28.4265, `position_z`=-4.29485, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=18753;

-- Subway Bench
UPDATE `gameobject` SET `id`=176058, `position_x`=20.4724, `position_y`=-13.8432, `position_z`=-4.29485, `orientation`=2.93214, `rotation0`=0, `rotation1`=0, `rotation2`=0.994521, `rotation3`=0.104536 WHERE `guid`=18754;

-- Subway Bench
UPDATE `gameobject` SET `id`=176059, `position_x`=20.6691, `position_y`=-0.542012, `position_z`=-4.29485, `orientation`=3.22016, `rotation0`=0, `rotation1`=0, `rotation2`=-0.999228, `rotation3`=0.039274 WHERE `guid`=18734;

-- Subway Bench
UPDATE `gameobject` SET `id`=176060, `position_x`=20.2348, `position_y`=31.2505, `position_z`=-4.29485, `orientation`=3.22016, `rotation0`=0, `rotation1`=0, `rotation2`=-0.999228, `rotation3`=0.039274 WHERE `guid`=18735;

-- Subway Bench
UPDATE `gameobject` SET `id`=176061, `position_x`=20.038, `position_y`=17.9495, `position_z`=-4.29485, `orientation`=2.93214, `rotation0`=0, `rotation1`=0, `rotation2`=0.994521, `rotation3`=0.104536 WHERE `guid`=18736;

-- Subway Bench
UPDATE `gameobject` SET `id`=176062, `position_x`=39.6638, `position_y`=-6.26684, `position_z`=-4.29485, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=18737;

-- Subway Bench
UPDATE `gameobject` SET `id`=176063, `position_x`=39.7596, `position_y`=-0.629033, `position_z`=-4.29485, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=18738;

-- Subway Bench
UPDATE `gameobject` SET `id`=176064, `position_x`=39.6319, `position_y`=-13.1842, `position_z`=-4.29485, `orientation`=3.06302, `rotation0`=0, `rotation1`=0, `rotation2`=0.999228, `rotation3`=0.039274 WHERE `guid`=18739;

-- Subway Bench
UPDATE `gameobject` SET `id`=176065, `position_x`=39.7433, `position_y`=20.3935, `position_z`=-4.29485, `orientation`=3.06302, `rotation0`=0, `rotation1`=0, `rotation2`=0.999228, `rotation3`=0.039274 WHERE `guid`=18720;

-- Subway Bench
UPDATE `gameobject` SET `id`=176066, `position_x`=39.7753, `position_y`=27.3106, `position_z`=-4.29485, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=18740;

-- Subway Bench
UPDATE `gameobject` SET `id`=176067, `position_x`=39.8711, `position_y`=32.9487, `position_z`=-4.29485, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=18741;

-- Subway Bench
UPDATE `gameobject` SET `id`=176068, `position_x`=-17.0512, `position_y`=24.529, `position_z`=-4.29485, `orientation`=0, `rotation0`=0, `rotation1`=0, `rotation2`=0, `rotation3`=1 WHERE `guid`=18742;

-- Subway Bench
UPDATE `gameobject` SET `id`=176069, `position_x`=-17.147, `position_y`=18.891, `position_z`=-4.29485, `orientation`=0, `rotation0`=0, `rotation1`=0, `rotation2`=0, `rotation3`=1 WHERE `guid`=18743;

-- Subway Bench
UPDATE `gameobject` SET `id`=176070, `position_x`=-17.0192, `position_y`=31.4461, `position_z`=-4.29485, `orientation`=6.20465, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0392599, `rotation3`=0.999229 WHERE `guid`=18744;

-- Subway Bench
UPDATE `gameobject` SET `id`=176071, `position_x`=-20.6657, `position_y`=-6.96157, `position_z`=-4.29485, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=18772;

-- Subway Bench
UPDATE `gameobject` SET `id`=176072, `position_x`=-20.5699, `position_y`=-1.32354, `position_z`=-4.29485, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=18745;

-- Subway Bench
UPDATE `gameobject` SET `id`=176073, `position_x`=-20.6976, `position_y`=-13.8787, `position_z`=-4.29485, `orientation`=3.06302, `rotation0`=0, `rotation1`=0, `rotation2`=0.999228, `rotation3`=0.039274 WHERE `guid`=18746;

-- Subway Bench
UPDATE `gameobject` SET `id`=176074, `position_x`=-17.6736, `position_y`=-1.02612, `position_z`=-4.29485, `orientation`=6.20465, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0392599, `rotation3`=0.999229 WHERE `guid`=18747;

-- Subway Bench
UPDATE `gameobject` SET `id`=176075, `position_x`=-17.7056, `position_y`=-7.94343, `position_z`=-4.29485, `orientation`=0, `rotation0`=0, `rotation1`=0, `rotation2`=0, `rotation3`=1 WHERE `guid`=18748;

-- Subway Bench
UPDATE `gameobject` SET `id`=176076, `position_x`=-17.8014, `position_y`=-13.5812, `position_z`=-4.29485, `orientation`=0, `rotation0`=0, `rotation1`=0, `rotation2`=0, `rotation3`=1 WHERE `guid`=18749;

-- Subway Bench
UPDATE `gameobject` SET `id`=176077, `position_x`=-20.1103, `position_y`=18.6886, `position_z`=-4.29485, `orientation`=3.06302, `rotation0`=0, `rotation1`=0, `rotation2`=0.999228, `rotation3`=0.039274 WHERE `guid`=18796;

-- Subway Bench
UPDATE `gameobject` SET `id`=176078, `position_x`=-20.0783, `position_y`=25.6059, `position_z`=-4.29485, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=18797;

-- Subway Bench
UPDATE `gameobject` SET `id`=176079, `position_x`=-19.9826, `position_y`=31.2438, `position_z`=-4.29485, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=18719;

-- Unfired Plate Gauntlets
UPDATE `gameobject` SET `position_x`=-18.8626, `position_y`=-360.394, `position_z`=-31.4268, `orientation`=2.51327, `rotation0`=0, `rotation1`=0, `rotation2`=0.951056, `rotation3`=0.309017 WHERE `guid`=257526;

-- Human Remains
UPDATE `gameobject` SET `position_x`=-19.0726, `position_y`=-361.991, `position_z`=-31.5237, `orientation`=5.93412, `rotation0`=0, `rotation1`=0, `rotation2`=-0.173648, `rotation3`=0.984808 WHERE `guid`=35868;

-- Subway Bench
UPDATE `gameobject` SET `id`=176098, `position_x`=-19.9828, `position_y`=2513.02, `position_z`=-4.29485, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=18779;

-- Subway Bench
UPDATE `gameobject` SET `id`=176099, `position_x`=-20.0786, `position_y`=2507.39, `position_z`=-4.29485, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=18714;

-- Subway Bench
UPDATE `gameobject` SET `id`=176100, `position_x`=-20.1105, `position_y`=2500.47, `position_z`=-4.29485, `orientation`=3.06302, `rotation0`=0, `rotation1`=0, `rotation2`=0.999228, `rotation3`=0.039274 WHERE `guid`=18791;

-- Subway Bench
UPDATE `gameobject` SET `id`=176101, `position_x`=-20.6659, `position_y`=2474.82, `position_z`=-4.29485, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=18715;

-- Subway Bench
UPDATE `gameobject` SET `id`=176102, `position_x`=-20.5701, `position_y`=2480.46, `position_z`=-4.29485, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=18718;

-- Subway Bench
UPDATE `gameobject` SET `id`=176103, `position_x`=-20.6978, `position_y`=2467.9, `position_z`=-4.29485, `orientation`=3.06302, `rotation0`=0, `rotation1`=0, `rotation2`=0.999228, `rotation3`=0.039274 WHERE `guid`=18781;

-- Subway Bench
UPDATE `gameobject` SET `id`=176104, `position_x`=-17.7058, `position_y`=2473.84, `position_z`=-4.29485, `orientation`=0, `rotation0`=0, `rotation1`=0, `rotation2`=0, `rotation3`=1 WHERE `guid`=18782;

-- Subway Bench
UPDATE `gameobject` SET `id`=176105, `position_x`=-17.8016, `position_y`=2468.2, `position_z`=-4.29485, `orientation`=0, `rotation0`=0, `rotation1`=0, `rotation2`=0, `rotation3`=1 WHERE `guid`=18783;

-- Subway Bench
UPDATE `gameobject` SET `id`=176106, `position_x`=-17.0195, `position_y`=2513.23, `position_z`=-4.29485, `orientation`=6.20465, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0392599, `rotation3`=0.999229 WHERE `guid`=18787;

-- Subway Bench
UPDATE `gameobject` SET `id`=176107, `position_x`=-17.1472, `position_y`=2500.67, `position_z`=-4.29485, `orientation`=0, `rotation0`=0, `rotation1`=0, `rotation2`=0, `rotation3`=1 WHERE `guid`=18784;

-- Subway Bench
UPDATE `gameobject` SET `id`=176108, `position_x`=-17.0514, `position_y`=2506.31, `position_z`=-4.29485, `orientation`=0, `rotation0`=0, `rotation1`=0, `rotation2`=0, `rotation3`=1 WHERE `guid`=18785;

-- Subway Bench
UPDATE `gameobject` SET `id`=176109, `position_x`=-17.6739, `position_y`=2480.75, `position_z`=-4.29485, `orientation`=6.20465, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0392599, `rotation3`=0.999229 WHERE `guid`=18786;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
