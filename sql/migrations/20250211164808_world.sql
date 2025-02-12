DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250211164808');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250211164808');
-- Add your query below.


-- The Barrens
UPDATE `pool_gameobject` SET `description` = 'Copper Vein - Barrens' WHERE `guid` = 40313;
UPDATE `pool_gameobject` SET `description` = 'Copper Vein - Barrens' WHERE `guid` = 40329;
UPDATE `pool_template` SET `description` = 'Copper Veins - Barrens (Master Pool)' WHERE `entry` = 4303;
UPDATE `pool_template` SET `description` = 'Copper Veins (3763) - Barrens (Master Pool)' WHERE `entry` = 2588;
UPDATE `pool_template` SET `description` = 'Barrens - Copper Vein (103713) / Tin Vein (103711) / Silver Vein (105569) (Master Pool)' WHERE `entry` = 3165;

-- Tin Vein (3764) / Silver Vein
SET @OGUID = 69017;
SET @PTEMPLATE = 8865;

UPDATE `pool_gameobject` SET `description` = 'Tin Vein / Silver Vein - Barrens' WHERE `guid` = 34661;
UPDATE `pool_gameobject` SET `description` = 'Tin Vein / Silver Vein - Barrens' WHERE `guid` = 34729;
UPDATE `pool_template` SET `description` = 'Tin Vein / Silver Vein - Barrens' WHERE `entry` = 1920;
DELETE FROM `pool_gameobject` WHERE `pool_entry` = 2587;
DELETE FROM `pool_template` WHERE `entry` IN (2587, 1860, 1861, 1875, 1877, 1878, 1879, 1889, 1893, 1894, 1902, 1921, 2856);
DELETE FROM `pool_gameobject` WHERE `guid` IN (34711, 34669, 41966, 34670, 41967, 34684, 41976, 34686, 41978, 34687, 41979, 34688, 41980, 34698, 41989, 34702, 41992, 34703, 41995, 41999, 34730, 42005, 34735, 41985);
DELETE FROM `pool_pool` WHERE `pool_id` IN (1860, 1861, 1875, 1877, 1878, 1879, 1889, 1893, 1894, 1902, 1921, 2856);
DELETE FROM `gameobject` WHERE `guid` IN (34711, 34669, 41966, 34670, 41967, 34684, 41976, 34686, 41978, 34687, 41979, 34688, 41980, 34698, 41989, 34702, 41992, 34703, 41995, 41999, 34730, 42005, 34735, 41985, 41968, 41969, 41970, 41971, 41972, 41973, 41974, 41975, 41977, 41981, 41982, 41983, 41984, 41986, 41987, 41988, 41990, 41991, 41993, 41994, 41996, 41997, 41998, 42000, 42001, 42002, 42003, 42004, 42006, 42007, 42008, 84126, 84127, 84128, 84129, 84130, 84131, 207);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1733, 1, -1334.28, -3164.35, 96.3886, 1.88495, 0, 0, 0.809016, 0.587786, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1733, 1, -4012.9, -1685, 125.023, 2.46091, 0, 0, 0.942641, 0.333808, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1733, 1, -3893.97, -1552.1, 97.994, 0.977383, 0, 0, 0.469471, 0.882948, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1733, 1, -3814.16, -1466.68, 138.992, 2.1293, 0, 0, 0.874619, 0.48481, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1733, 1, -3740.23, -1504.02, 97.59, 3.21142, 0, 0, -0.999391, 0.0349061, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1733, 1, -3654.05, -1691.23, 113.431, 1.98967, 0, 0, 0.83867, 0.54464, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1733, 1, -2313.7, -2620.88, 103.164, 1.76278, 0, 0, 0.771625, 0.636078, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1733, 1, -2312.55, -2499.89, 94.7379, 3.17653, 0, 0, -0.999847, 0.0174693, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1733, 1, -2277.64, -2507.73, 93.9827, 3.28124, 0, 0, -0.997563, 0.0697661, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1733, 1, -2117.74, -2794.77, 92.5652, 1.23918, 0, 0, 0.580703, 0.814116, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 1733, 1, -2060.78, -2801.24, 91.6667, 1.01229, 0, 0, 0.484809, 0.87462, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 1733, 1, -2043.01, -2813.76, 91.6719, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 1733, 1, -1941.71, -2691.24, 95.6744, 4.93928, 0, 0, -0.622514, 0.782609, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 1733, 1, -1890.14, -2710.69, 96.0801, 6.12611, 0, 0, -0.0784588, 0.996917, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 1733, 1, -1847.26, -1925.07, 97.8816, 4.4855, 0, 0, -0.782608, 0.622515, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 1733, 1, -1472.59, -1494.68, 109.927, 4.01426, 0, 0, -0.906307, 0.422619, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 1733, 1, -1421.27, -1506.67, 98.5869, 3.50812, 0, 0, -0.983254, 0.182238, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 1733, 1, -1227.88, -2986.31, 81.0746, 4.06662, 0, 0, -0.894934, 0.446199, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 1733, 1, -1089.17, -2079.23, 62.6844, 3.4383, 0, 0, -0.989016, 0.147811, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 1733, 1, -1047.67, -2048.3, 63.4349, 3.4383, 0, 0, -0.989016, 0.147811, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 1733, 1, -1015.49, -2083.8, 63.6469, 5.35816, 0, 0, -0.446198, 0.894935, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 1733, 1, -259.587, -2990.22, 97.7034, 5.84685, 0, 0, -0.216439, 0.976296, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 1733, 1, -221.384, -3283.85, 92.1272, 4.76475, 0, 0, -0.688354, 0.725374, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 1733, 1, 19.4288, -1939.55, 82.605, 4.46804, 0, 0, -0.788011, 0.615662, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 1733, 1, 91.9908, -1923.08, 80.8534, 4.85202, 0, 0, -0.656058, 0.75471, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 1733, 1, 108.502, -1971.98, 86.3208, 3.7001, 0, 0, -0.961261, 0.27564, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 1733, 1, 609.74, -1188.85, 112.397, 4.10153, 0, 0, -0.887011, 0.461749, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 1733, 1, 643.704, -1276.92, 98.4661, 3.52557, 0, 0, -0.981627, 0.190812, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+29, 1733, 1, 736.88, -1231.18, 100.34, 1.09956, 0, 0, 0.522498, 0.85264, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+30, 1733, 1, 1352.22, -3465.01, 99.6129, 5.11382, 0, 0, -0.551936, 0.833886, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+31, 1733, 1, 1364.33, -3495.35, 94.4066, 0.488691, 0, 0, 0.241921, 0.970296, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+32, 1733, 1, 1365.14, -3417.64, 91.6672, 1.91986, 0, 0, 0.819152, 0.573577, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+33, 1733, 1, -1314.38, -3040.59, 83.7026, 6.03884, 0, 0, -0.121869, 0.992546, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+34, 1733, 1, -34.0801, -3400.02, 91.6849, 1.46608, 0, 0, 0.66913, 0.743145, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+35, 1733, 1, 78.5835, -1962.28, 84.1297, 3.10665, 0, 0, 0.999847, 0.0174693, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+36, 1733, 1, 467.337, -1225.43, 110.27, 1.29154, 0, 0, 0.601814, 0.798636, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+37, 1733, 1, 545.992, -1100.04, 107.342, 1.51844, 0, 0, 0.688354, 0.725374, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+38, 1733, 1, 792.941, -1411.38, 105.288, 2.60054, 0, 0, 0.96363, 0.267241, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+39, 1733, 1, -4077.23, -1776.9, 110.37, 4.45059, 0, 0, -0.793353, 0.608762, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+40, 1733, 1, -4027.05, -1759.14, 100.087, 4.27606, 0, 0, -0.843391, 0.5373, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+41, 1733, 1, -2266.12, -2536.62, 92.2936, 0.663223, 0, 0, 0.325567, 0.945519, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+42, 1733, 1, -2086.99, -1738.18, 96.4682, 3.42085, 0, 0, -0.990268, 0.139175, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+43, 1733, 1, -2085.87, -2587.43, 92.311, 5.13127, 0, 0, -0.544639, 0.838671, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+44, 1733, 1, -2062.71, -1949.56, 91.6667, 1.71042, 0, 0, 0.754709, 0.656059, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+45, 1733, 1, -1853.02, -1887.78, 98.8276, 1.93731, 0, 0, 0.824125, 0.566408, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+46, 1733, 1, -1290.2, -2984.47, 81.2099, 0.383971, 0, 0, 0.190808, 0.981627, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+47, 1733, 1, -1086.76, -2178, 65.2551, 0.0349062, 0, 0, 0.0174522, 0.999848, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+48, 1733, 1, -926.473, -2057.15, 72.4391, 0.750492, 0, 0, 0.366501, 0.930418, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+49, 1733, 1, 26.0743, -1906.15, 84.0589, 4.69494, 0, 0, -0.71325, 0.70091, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+50, 1733, 1, 884.066, -1317.24, 104.392, 4.01426, 0, 0, -0.906307, 0.422619, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+51, 3764, 1, -1334.28, -3164.35, 96.3886, 1.88495, 0, 0, 0.809016, 0.587786, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+52, 3764, 1, -4012.9, -1685, 125.023, 2.46091, 0, 0, 0.942641, 0.333808, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+53, 3764, 1, -3893.97, -1552.1, 97.994, 0.977383, 0, 0, 0.469471, 0.882948, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+54, 3764, 1, -3814.16, -1466.68, 138.992, 2.1293, 0, 0, 0.874619, 0.48481, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+55, 3764, 1, -3740.23, -1504.02, 97.59, 3.21142, 0, 0, -0.999391, 0.0349061, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+56, 3764, 1, -3654.05, -1691.23, 113.431, 1.98967, 0, 0, 0.83867, 0.54464, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+57, 3764, 1, -2313.7, -2620.88, 103.164, 1.76278, 0, 0, 0.771625, 0.636078, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+58, 3764, 1, -2312.55, -2499.89, 94.7379, 3.17653, 0, 0, -0.999847, 0.0174693, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+59, 3764, 1, -2277.64, -2507.73, 93.9827, 3.28124, 0, 0, -0.997563, 0.0697661, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+60, 3764, 1, -2117.74, -2794.77, 92.5652, 1.23918, 0, 0, 0.580703, 0.814116, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+61, 3764, 1, -2060.78, -2801.24, 91.6667, 1.01229, 0, 0, 0.484809, 0.87462, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+62, 3764, 1, -2043.01, -2813.76, 91.6719, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+63, 3764, 1, -1941.71, -2691.24, 95.6744, 4.93928, 0, 0, -0.622514, 0.782609, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+64, 3764, 1, -1890.14, -2710.69, 96.0801, 6.12611, 0, 0, -0.0784588, 0.996917, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+65, 3764, 1, -1847.26, -1925.07, 97.8816, 4.4855, 0, 0, -0.782608, 0.622515, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+66, 3764, 1, -1472.59, -1494.68, 109.927, 4.01426, 0, 0, -0.906307, 0.422619, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+67, 3764, 1, -1421.27, -1506.67, 98.5869, 3.50812, 0, 0, -0.983254, 0.182238, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+68, 3764, 1, -1227.88, -2986.31, 81.0746, 4.06662, 0, 0, -0.894934, 0.446199, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+69, 3764, 1, -1089.17, -2079.23, 62.6844, 3.4383, 0, 0, -0.989016, 0.147811, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+70, 3764, 1, -1047.67, -2048.3, 63.4349, 3.4383, 0, 0, -0.989016, 0.147811, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+71, 3764, 1, -1015.49, -2083.8, 63.6469, 5.35816, 0, 0, -0.446198, 0.894935, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+72, 3764, 1, -259.587, -2990.22, 97.7034, 5.84685, 0, 0, -0.216439, 0.976296, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+73, 3764, 1, -221.384, -3283.85, 92.1272, 4.76475, 0, 0, -0.688354, 0.725374, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+74, 3764, 1, 19.4288, -1939.55, 82.605, 4.46804, 0, 0, -0.788011, 0.615662, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+75, 3764, 1, 91.9908, -1923.08, 80.8534, 4.85202, 0, 0, -0.656058, 0.75471, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+76, 3764, 1, 108.502, -1971.98, 86.3208, 3.7001, 0, 0, -0.961261, 0.27564, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+77, 3764, 1, 609.74, -1188.85, 112.397, 4.10153, 0, 0, -0.887011, 0.461749, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+78, 3764, 1, 643.704, -1276.92, 98.4661, 3.52557, 0, 0, -0.981627, 0.190812, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+79, 3764, 1, 736.88, -1231.18, 100.34, 1.09956, 0, 0, 0.522498, 0.85264, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+80, 3764, 1, 1352.22, -3465.01, 99.6129, 5.11382, 0, 0, -0.551936, 0.833886, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+81, 3764, 1, 1364.33, -3495.35, 94.4066, 0.488691, 0, 0, 0.241921, 0.970296, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+82, 3764, 1, 1365.14, -3417.64, 91.6672, 1.91986, 0, 0, 0.819152, 0.573577, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+83, 3764, 1, -1314.38, -3040.59, 83.7026, 6.03884, 0, 0, -0.121869, 0.992546, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+84, 3764, 1, -34.0801, -3400.02, 91.6849, 1.46608, 0, 0, 0.66913, 0.743145, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+85, 3764, 1, 78.5835, -1962.28, 84.1297, 3.10665, 0, 0, 0.999847, 0.0174693, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+86, 3764, 1, 467.337, -1225.43, 110.27, 1.29154, 0, 0, 0.601814, 0.798636, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+87, 3764, 1, 545.992, -1100.04, 107.342, 1.51844, 0, 0, 0.688354, 0.725374, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+88, 3764, 1, 792.941, -1411.38, 105.288, 2.60054, 0, 0, 0.96363, 0.267241, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+89, 3764, 1, -4077.23, -1776.9, 110.37, 4.45059, 0, 0, -0.793353, 0.608762, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+90, 3764, 1, -4027.05, -1759.14, 100.087, 4.27606, 0, 0, -0.843391, 0.5373, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+91, 3764, 1, -2266.12, -2536.62, 92.2936, 0.663223, 0, 0, 0.325567, 0.945519, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+92, 3764, 1, -2086.99, -1738.18, 96.4682, 3.42085, 0, 0, -0.990268, 0.139175, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+93, 3764, 1, -2085.87, -2587.43, 92.311, 5.13127, 0, 0, -0.544639, 0.838671, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+94, 3764, 1, -2062.71, -1949.56, 91.6667, 1.71042, 0, 0, 0.754709, 0.656059, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+95, 3764, 1, -1853.02, -1887.78, 98.8276, 1.93731, 0, 0, 0.824125, 0.566408, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+96, 3764, 1, -1290.2, -2984.47, 81.2099, 0.383971, 0, 0, 0.190808, 0.981627, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+97, 3764, 1, -1086.76, -2178, 65.2551, 0.0349062, 0, 0, 0.0174522, 0.999848, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+98, 3764, 1, -926.473, -2057.15, 72.4391, 0.750492, 0, 0, 0.366501, 0.930418, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+99, 3764, 1, 26.0743, -1906.15, 84.0589, 4.69494, 0, 0, -0.71325, 0.70091, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+100, 3764, 1, 884.066, -1317.24, 104.392, 4.01426, 0, 0, -0.906307, 0.422619, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+2, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+3, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+4, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+5, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+6, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+7, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+8, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+9, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+10, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+11, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+12, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+13, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+14, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+15, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+16, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+17, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+18, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+19, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+20, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+21, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+22, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+23, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+24, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+25, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+26, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+27, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+28, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+29, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+30, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+31, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+32, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+33, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+34, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+35, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+36, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+37, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+38, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+39, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+40, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+41, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+42, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+43, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+44, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+45, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+46, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+47, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+48, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+49, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+50, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+2, @PTEMPLATE+2, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+3, @PTEMPLATE+3, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+4, @PTEMPLATE+4, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+5, @PTEMPLATE+5, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+6, @PTEMPLATE+6, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+7, @PTEMPLATE+7, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+8, @PTEMPLATE+8, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+9, @PTEMPLATE+9, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+10, @PTEMPLATE+10, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+11, @PTEMPLATE+11, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+12, @PTEMPLATE+12, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+13, @PTEMPLATE+13, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+14, @PTEMPLATE+14, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+15, @PTEMPLATE+15, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+16, @PTEMPLATE+16, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+17, @PTEMPLATE+17, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+18, @PTEMPLATE+18, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+19, @PTEMPLATE+19, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+20, @PTEMPLATE+20, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+21, @PTEMPLATE+21, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+22, @PTEMPLATE+22, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+23, @PTEMPLATE+23, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+24, @PTEMPLATE+24, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+25, @PTEMPLATE+25, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+26, @PTEMPLATE+26, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+27, @PTEMPLATE+27, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+28, @PTEMPLATE+28, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+29, @PTEMPLATE+29, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+30, @PTEMPLATE+30, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+31, @PTEMPLATE+31, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+32, @PTEMPLATE+32, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+33, @PTEMPLATE+33, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+34, @PTEMPLATE+34, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+35, @PTEMPLATE+35, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+36, @PTEMPLATE+36, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+37, @PTEMPLATE+37, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+38, @PTEMPLATE+38, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+39, @PTEMPLATE+39, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+40, @PTEMPLATE+40, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+41, @PTEMPLATE+41, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+42, @PTEMPLATE+42, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+43, @PTEMPLATE+43, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+44, @PTEMPLATE+44, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+45, @PTEMPLATE+45, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+46, @PTEMPLATE+46, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+47, @PTEMPLATE+47, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+48, @PTEMPLATE+48, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+49, @PTEMPLATE+49, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+50, @PTEMPLATE+50, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+51, @PTEMPLATE+1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+52, @PTEMPLATE+2, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+53, @PTEMPLATE+3, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+54, @PTEMPLATE+4, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+55, @PTEMPLATE+5, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+56, @PTEMPLATE+6, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+57, @PTEMPLATE+7, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+58, @PTEMPLATE+8, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+59, @PTEMPLATE+9, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+60, @PTEMPLATE+10, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+61, @PTEMPLATE+11, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+62, @PTEMPLATE+12, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+63, @PTEMPLATE+13, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+64, @PTEMPLATE+14, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+65, @PTEMPLATE+15, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+66, @PTEMPLATE+16, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+67, @PTEMPLATE+17, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+68, @PTEMPLATE+18, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+69, @PTEMPLATE+19, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+70, @PTEMPLATE+20, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+71, @PTEMPLATE+21, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+72, @PTEMPLATE+22, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+73, @PTEMPLATE+23, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+74, @PTEMPLATE+24, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+75, @PTEMPLATE+25, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+76, @PTEMPLATE+26, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+77, @PTEMPLATE+27, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+78, @PTEMPLATE+28, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+79, @PTEMPLATE+29, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+80, @PTEMPLATE+30, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+81, @PTEMPLATE+31, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+82, @PTEMPLATE+32, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+83, @PTEMPLATE+33, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+84, @PTEMPLATE+34, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+85, @PTEMPLATE+35, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+86, @PTEMPLATE+36, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+87, @PTEMPLATE+37, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+88, @PTEMPLATE+38, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+89, @PTEMPLATE+39, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+90, @PTEMPLATE+40, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+91, @PTEMPLATE+41, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+92, @PTEMPLATE+42, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+93, @PTEMPLATE+43, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+94, @PTEMPLATE+44, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+95, @PTEMPLATE+45, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+96, @PTEMPLATE+46, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+97, @PTEMPLATE+47, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+98, @PTEMPLATE+48, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+99, @PTEMPLATE+49, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@OGUID+100, @PTEMPLATE+50, 'Tin Vein (3764) / Silver Vein - Barrens', 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(2587, 9, 'Barrens - Tin Vein (3764) / Silver Vein (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+2, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+3, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+4, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+5, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+6, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+7, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+8, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+9, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+10, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+11, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+12, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+13, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+14, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+15, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+16, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+17, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+18, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+19, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+20, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+21, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+22, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+23, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+24, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+25, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+26, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+27, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+28, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+29, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+30, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+31, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+32, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+33, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+34, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+35, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+36, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+37, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+38, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+39, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+40, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+41, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+42, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+43, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+44, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+45, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+46, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+47, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+48, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+49, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+50, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0);

-- Barrens - Copper Vein (103713)
SET @OGUID = 94919;

DELETE FROM `gameobject` WHERE `guid` IN (28026, 28027, 28028, 28029, 28030, 28031, 28032, 28033, 28034, 28035, 28036, 28037, 28038, 28039, 28040, 28041, 28042, 28043, 28044, 28045, 28046, 28047, 28048, 28049, 28050, 28051, 28052, 28053, 28054, 28055, 28056, 28057, 28058, 28059, 28060, 28061, 28062, 28063, 28064, 28065, 28066, 28067, 28068, 28069, 28070);
DELETE FROM `pool_gameobject` WHERE `guid` IN (28026, 28027, 28028, 28029, 28030, 28031, 28032, 28033, 28034, 28035, 28036, 28037, 28038, 28039, 28040, 28041, 28042, 28043, 28044, 28045, 28046, 28047, 28048, 28049, 28050, 28051, 28052, 28053, 28054, 28055, 28056, 28057, 28058, 28059, 28060, 28061, 28062, 28063, 28064, 28065, 28066, 28067, 28068, 28069, 28070);
DELETE FROM `pool_template` WHERE `entry` IN (3165, 2273, 2274, 2275, 2276, 2277, 2278, 2279, 2280, 2281, 2282, 2283, 2284, 2285, 2286, 2287);
DELETE FROM `pool_pool` WHERE `mother_pool` = 3165;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 103713, 1, -4207.56, -2290.02, 57.1232, 3.38594, 0, 0, -0.992546, 0.12187, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 103713, 1, -4203.78, -2233.75, 55.3837, 0.209439, 0, 0, 0.104528, 0.994522, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 103713, 1, -4189.49, -2169.27, 56.5968, 4.15388, 0, 0, -0.874619, 0.48481, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 103713, 1, -4093.85, -2122.36, 55.9365, 1.74533, 0, 0, 0.766044, 0.642789, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 103713, 1, -4076.08, -2193.39, 53.0868, 4.71239, 0, 0, -0.707107, 0.707107, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(3165, 2, 'Barrens - Copper Vein (103713) (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, 3165, 'Copper Vein (103713) - Barrens', 10),
(@OGUID+2, 3165, 'Copper Vein (103713) - Barrens', 10),
(@OGUID+3, 3165, 'Copper Vein (103713) - Barrens', 10),
(@OGUID+4, 3165, 'Copper Vein (103713) - Barrens', 10),
(@OGUID+5, 3165, 'Copper Vein (103713) - Barrens', 10);

-- Tin Vein (103711) / Silver Vein (105569)
SET @OGUID = 94924;
SET @PTEMPLATE = 9405;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 103711, 1, -4224.98, -2266.66, 52.3942, 0.95993, 0, 0, 0.461748, 0.887011, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 103711, 1, -4204.59, -2201.6, 56.1207, 5.72468, 0, 0, -0.275637, 0.961262, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 103711, 1, -4193.71, -2187.79, 52.5116, 3.82227, 0, 0, -0.942641, 0.333808, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 103711, 1, -4189.95, -2273.66, 52.2812, 1.69297, 0, 0, 0.748956, 0.66262, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 103711, 1, -4154.6, -2156.53, 52.776, 4.59022, 0, 0, -0.748956, 0.66262, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 103711, 1, -4133.86, -2145.77, 51.8004, 2.25147, 0, 0, 0.902585, 0.430512, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 103711, 1, -4126.87, -2243.22, 51.5352, 1.0472, 0, 0, 0.5, 0.866025, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 103711, 1, -4115, -2231.68, 52.2902, 0.820303, 0, 0, 0.398748, 0.91706, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 103711, 1, -4064.47, -2151.67, 50.9367, 3.54302, 0, 0, -0.979924, 0.19937, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 103711, 1, -4060.03, -2183.86, 54.3944, 2.32129, 0, 0, 0.91706, 0.39875, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 105569, 1, -4224.98, -2266.66, 52.3942, 0.95993, 0, 0, 0.461748, 0.887011, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 105569, 1, -4204.59, -2201.6, 56.1207, 5.72468, 0, 0, -0.275637, 0.961262, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 105569, 1, -4193.71, -2187.79, 52.5116, 3.82227, 0, 0, -0.942641, 0.333808, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 105569, 1, -4189.95, -2273.66, 52.2812, 1.69297, 0, 0, 0.748956, 0.66262, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 105569, 1, -4154.6, -2156.53, 52.776, 4.59022, 0, 0, -0.748956, 0.66262, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 105569, 1, -4133.86, -2145.77, 51.8004, 2.25147, 0, 0, 0.902585, 0.430512, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 105569, 1, -4126.87, -2243.22, 51.5352, 1.0472, 0, 0, 0.5, 0.866025, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 105569, 1, -4115, -2231.68, 52.2902, 0.820303, 0, 0, 0.398748, 0.91706, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 105569, 1, -4064.47, -2151.67, 50.9367, 3.54302, 0, 0, -0.979924, 0.19937, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 105569, 1, -4060.03, -2183.86, 54.3944, 2.32129, 0, 0, 0.91706, 0.39875, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Tin Vein (103711) / Silver Vein (105569) - Barrens', 10),
(@PTEMPLATE+2, 1, 'Tin Vein (103711) / Silver Vein (105569) - Barrens', 10),
(@PTEMPLATE+3, 1, 'Tin Vein (103711) / Silver Vein (105569) - Barrens', 10),
(@PTEMPLATE+4, 1, 'Tin Vein (103711) / Silver Vein (105569) - Barrens', 10),
(@PTEMPLATE+5, 1, 'Tin Vein (103711) / Silver Vein (105569) - Barrens', 10),
(@PTEMPLATE+6, 1, 'Tin Vein (103711) / Silver Vein (105569) - Barrens', 10),
(@PTEMPLATE+7, 1, 'Tin Vein (103711) / Silver Vein (105569) - Barrens', 10),
(@PTEMPLATE+8, 1, 'Tin Vein (103711) / Silver Vein (105569) - Barrens', 10),
(@PTEMPLATE+9, 1, 'Tin Vein (103711) / Silver Vein (105569) - Barrens', 10),
(@PTEMPLATE+10, 1, 'Tin Vein (103711) / Silver Vein (105569) - Barrens', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Tin Vein (103711) / Silver Vein (105569) - Barrens', 10),
(@OGUID+2, @PTEMPLATE+2, 'Tin Vein (103711) / Silver Vein (105569) - Barrens', 10),
(@OGUID+3, @PTEMPLATE+3, 'Tin Vein (103711) / Silver Vein (105569) - Barrens', 10),
(@OGUID+4, @PTEMPLATE+4, 'Tin Vein (103711) / Silver Vein (105569) - Barrens', 10),
(@OGUID+5, @PTEMPLATE+5, 'Tin Vein (103711) / Silver Vein (105569) - Barrens', 10),
(@OGUID+6, @PTEMPLATE+6, 'Tin Vein (103711) / Silver Vein (105569) - Barrens', 10),
(@OGUID+7, @PTEMPLATE+7, 'Tin Vein (103711) / Silver Vein (105569) - Barrens', 10),
(@OGUID+8, @PTEMPLATE+8, 'Tin Vein (103711) / Silver Vein (105569) - Barrens', 10),
(@OGUID+9, @PTEMPLATE+9, 'Tin Vein (103711) / Silver Vein (105569) - Barrens', 10),
(@OGUID+10, @PTEMPLATE+10, 'Tin Vein (103711) / Silver Vein (105569) - Barrens', 10),
(@OGUID+11, @PTEMPLATE+1, 'Tin Vein (103711) / Silver Vein (105569) - Barrens', 10),
(@OGUID+12, @PTEMPLATE+2, 'Tin Vein (103711) / Silver Vein (105569) - Barrens', 10),
(@OGUID+13, @PTEMPLATE+3, 'Tin Vein (103711) / Silver Vein (105569) - Barrens', 10),
(@OGUID+14, @PTEMPLATE+4, 'Tin Vein (103711) / Silver Vein (105569) - Barrens', 10),
(@OGUID+15, @PTEMPLATE+5, 'Tin Vein (103711) / Silver Vein (105569) - Barrens', 10),
(@OGUID+16, @PTEMPLATE+6, 'Tin Vein (103711) / Silver Vein (105569) - Barrens', 10),
(@OGUID+17, @PTEMPLATE+7, 'Tin Vein (103711) / Silver Vein (105569) - Barrens', 10),
(@OGUID+18, @PTEMPLATE+8, 'Tin Vein (103711) / Silver Vein (105569) - Barrens', 10),
(@OGUID+19, @PTEMPLATE+9, 'Tin Vein (103711) / Silver Vein (105569) - Barrens', 10),
(@OGUID+20, @PTEMPLATE+10, 'Tin Vein (103711) / Silver Vein (105569) - Barrens', 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(2273, 3, 'Barrens - Tin Vein (103711) / Silver Vein (105569) (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 2273, 0, 'Barrens - Tin Vein (103711) / Silver Vein (105569)', 0),
(@PTEMPLATE+2, 2273, 0, 'Barrens - Tin Vein (103711) / Silver Vein (105569)', 0),
(@PTEMPLATE+3, 2273, 0, 'Barrens - Tin Vein (103711) / Silver Vein (105569)', 0),
(@PTEMPLATE+4, 2273, 0, 'Barrens - Tin Vein (103711) / Silver Vein (105569)', 0),
(@PTEMPLATE+5, 2273, 0, 'Barrens - Tin Vein (103711) / Silver Vein (105569)', 0),
(@PTEMPLATE+6, 2273, 0, 'Barrens - Tin Vein (103711) / Silver Vein (105569)', 0),
(@PTEMPLATE+7, 2273, 0, 'Barrens - Tin Vein (103711) / Silver Vein (105569)', 0),
(@PTEMPLATE+8, 2273, 0, 'Barrens - Tin Vein (103711) / Silver Vein (105569)', 0),
(@PTEMPLATE+9, 2273, 0, 'Barrens - Tin Vein (103711) / Silver Vein (105569)', 0),
(@PTEMPLATE+10, 2273, 0, 'Barrens - Tin Vein (103711) / Silver Vein (105569)', 0);

UPDATE `pool_template` SET `description` = 'Barrens - Tin Vein (1732) / Silver Vein (Master Pool)' WHERE `entry` = 1033;
UPDATE `pool_template` SET `description` = 'Copper Veins (1731) - Barrens (Master Pool)' WHERE `entry` = 4303;
UPDATE `pool_template` SET `max_limit` = 1 WHERE `entry` = 2273;
UPDATE `pool_template` SET `max_limit` = 1 WHERE `entry` = 3165;

-- Add Chance
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Tin Vein / Silver Vein - Barrens" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1732);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Tin Vein / Silver Vein - Barrens" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Tin Vein (3764) / Silver Vein - Barrens" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 3764);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Tin Vein (3764) / Silver Vein - Barrens" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Tin Vein (103711) / Silver Vein (105569) - Barrens" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 105569);
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Tin Vein (103711) / Silver Vein (105569) - Barrens" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 103711);

UPDATE `pool_template` SET `max_limit` = 4 WHERE `entry` = 1033;
UPDATE `pool_template` SET `max_limit` = 4 WHERE `entry` = 2587;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
