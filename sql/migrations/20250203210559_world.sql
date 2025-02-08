DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250203210559');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250203210559');
-- Add your query below.


SET @OGUID = 52947;
SET @PTEMPLATE = 4627;

-- Arathi Highlands
UPDATE `pool_template` SET `description` = 'Mithril Deposit / Truesilver Deposit - Hinterlands' WHERE `entry` = 17206;
UPDATE `pool_pool` SET `mother_pool` = 1067 WHERE `pool_id` = 17206;
UPDATE `pool_template` SET `description` = 'Lesser Bloodstone Deposits in Arathi Highlands (Master Pool)' WHERE `entry` = 298;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(323, 16, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit (Master Pool)', 0, 0, 0, 10);

-- Gold Vein / Mithril Deposit / Truesilver Deposit
DELETE FROM `gameobject` WHERE `guid` IN (324, 325, 326, 327, 25330, 25331, 25334, 25336, 25339, 25340, 427540, 427547, 28115, 28116, 28117, 28118, 28119, 28120, 28121, 28122, 28123, 28124, 28125, 28126, 28127, 28128, 28129, 28130, 28131, 28132, 28133, 28134, 28135, 28136, 28137, 28138, 28139, 28140, 28141, 28142, 28143, 28144, 28145, 28146, 28147, 28148, 34589, 220433, 220434, 220439, 220440, 220441, 220442, 220443, 260201, 260202, 260203, 260204, 260205, 260206, 260207, 260208, 260209, 260210, 260211, 260212, 260213, 260214, 260215, 260216, 260217, 260218, 260219, 260220, 427420, 427421, 427422, 427423, 427424, 427425, 427426, 427427, 427428, 427429, 427430, 427431, 427432, 427433, 427434, 427435, 427436, 427437, 427438, 427439, 427440, 427441, 427442, 427443, 427444, 427445, 427446, 427447, 427448, 427449, 427450, 427481, 427540, 427547, 427575, 427577);
DELETE FROM `pool_gameobject` WHERE `guid` IN (324, 325, 326, 327, 25330, 25331, 25334, 25336, 25339, 25340, 427540, 427547, 28115, 28116, 28117, 28118, 28119, 28120, 28121, 28122, 28123, 28124, 28125, 28126, 28127, 28128, 28129, 28130, 28131, 28132, 28133, 28134, 28135, 28136, 28137, 28138, 28139, 28140, 28141, 28142, 28143, 28144, 28145, 28146, 28147, 28148, 34589, 220433, 220434, 220439, 220440, 220441, 220442, 220443, 260201, 260202, 260203, 260204, 260205, 260206, 260207, 260208, 260209, 260210, 260211, 260212, 260213, 260214, 260215, 260216, 260217, 260218, 260219, 260220, 427420, 427421, 427422, 427423, 427424, 427425, 427426, 427427, 427428, 427429, 427430, 427431, 427432, 427433, 427434, 427435, 427436, 427437, 427438, 427439, 427440, 427441, 427442, 427443, 427444, 427445, 427446, 427447, 427448, 427449, 427450, 427481, 427540, 427547, 427575, 427577);
DELETE FROM `pool_pool` WHERE `mother_pool` IN (2222, 1358, 18840);
DELETE FROM `pool_template` WHERE `entry` IN (2222, 1358, 18840, 2218, 2219, 2220, 2221, 2454, 2455, 2456, 2457, 2458, 2459, 2460, 2461, 2462, 2463, 2464, 2465, 2466, 2467, 2468, 2469, 2470, 17000, 17004, 17148, 17149, 17150, 17151, 17152, 17153, 17205, 18851, 18852, 18853, 18854, 23054, 23055);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1734, 0, -2182, -1665.24, -35.4133, 0.59341, 0, 0, 0.292371, 0.956305, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1734, 0, -2178.65, -1789.86, -41.0136, 4.55531, 0, 0, -0.760406, 0.649449, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1734, 0, -2065.41, -3307.87, 67.9717, 5.34071, 0, 0, -0.45399, 0.891007, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1734, 0, -2063.44, -2676.59, 88.1955, 1.62316, 0, 0, 0.725374, 0.688355, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1734, 0, -1941.89, -1648.68, 48.6327, 0.157079, 0, 0, 0.0784588, 0.996917, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1734, 0, -1854.6, -1493.8, 49.2701, 4.7822, 0, 0, -0.681998, 0.731354, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1734, 0, -1851.72, -1538.44, 66.9113, 2.19911, 0, 0, 0.891006, 0.453991, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1734, 0, -1848.64, -1760.39, 67.3599, 5.88176, 0, 0, -0.199368, 0.979925, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1734, 0, -1842.88, -2536.53, 55.9154, -0.680679, 0, 0, 0.333807, -0.942641, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1734, 0, -1831.79, -1443.18, 59.4886, -0.314159, 0, 0, 0.156434, -0.987688, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 1734, 0, -1824.19, -1799.81, 60.5315, 1.79769, 0, 0, 0.782608, 0.622515, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 1734, 0, -1819.15, -2011.03, 66.5258, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 1734, 0, -1755.99, -1427.99, 63.643, 1.78023, 0, 0, 0.777145, 0.629321, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 1734, 0, -1729.78, -3290.1, 13.5406, 4.13643, 0, 0, -0.878817, 0.47716, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 1734, 0, -1657.74, -2215.52, 23.8297, 5.55015, 0, 0, -0.358368, 0.93358, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 1734, 0, -2106.72, -3357.28, 59.2213, -0.802851, 0, 0, 0.390731, -0.920505, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 1734, 0, -2339.53, -1646.11, -24.6021, 0.698131, 0, 0, 0.34202, 0.939693, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 1734, 0, -2307.24, -1790.67, -22.6112, 0.453785, 0, 0, 0.224951, 0.97437, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 1734, 0, -2241.04, -1835.02, -20.1633, 0.418879, 0, 0, 0.207911, 0.978148, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 1734, 0, -2044.11, -3332.36, 59.5733, 2.9845, 0, 0, 0.996917, 0.0784664, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 1734, 0, -2032.64, -3347.23, 61.9084, 3.4034, 0, 0, -0.991445, 0.130528, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 1734, 0, -1920.89, -1674.88, 62.1752, 3.56047, 0, 0, -0.978148, 0.207912, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 1734, 0, -1827.82, -2643.53, 59.8704, 6.23083, 0, 0, -0.0261765, 0.999657, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 1734, 0, -1674.69, -1442.03, 45.8495, 5.41052, 0, 0, -0.422618, 0.906308, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 1734, 0, -920.493, -3939.74, 149.412, 3.6652, 0, 0, -0.965925, 0.258821, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 1734, 0, -890.553, -3868.59, 135.962, 1.88495, 0, 0, 0.809016, 0.587786, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 1734, 0, -821.052, -3915.51, 146.443, 4.93928, 0, 0, -0.622514, 0.782609, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 1734, 0, -926.399, -3898.71, 144.877, 1.36136, 0, 0, 0.62932, 0.777146, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+29, 1734, 0, -899.783, -3967.06, 137.724, 0.331611, 0, 0, 0.165047, 0.986286, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+30, 1734, 0, -873.642, -4014.27, 146.178, 6.21337, 0, 0, -0.0348988, 0.999391, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+31, 1734, 0, -874.558, -3911.16, 134.068, -0.977384, 0, 0, -0.469471, 0.882948, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+32, 1734, 0, -857.528, -3931.43, 149.044, 6.07375, 0, 0, -0.104528, 0.994522, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+33, 2040, 0, -2182, -1665.24, -35.4133, 0.59341, 0, 0, 0.292371, 0.956305, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+34, 2040, 0, -2178.65, -1789.86, -41.0136, 4.55531, 0, 0, -0.760406, 0.649449, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+35, 2040, 0, -2065.41, -3307.87, 67.9717, 5.34071, 0, 0, -0.45399, 0.891007, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+36, 2040, 0, -2063.44, -2676.59, 88.1955, 1.62316, 0, 0, 0.725374, 0.688355, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+37, 2040, 0, -1941.89, -1648.68, 48.6327, 0.157079, 0, 0, 0.0784588, 0.996917, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+38, 2040, 0, -1854.6, -1493.8, 49.2701, 4.7822, 0, 0, -0.681998, 0.731354, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+39, 2040, 0, -1851.72, -1538.44, 66.9113, 2.19911, 0, 0, 0.891006, 0.453991, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+40, 2040, 0, -1848.64, -1760.39, 67.3599, 5.88176, 0, 0, -0.199368, 0.979925, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+41, 2040, 0, -1842.88, -2536.53, 55.9154, -0.680679, 0, 0, 0.333807, -0.942641, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+42, 2040, 0, -1831.79, -1443.18, 59.4886, -0.314159, 0, 0, 0.156434, -0.987688, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+43, 2040, 0, -1824.19, -1799.81, 60.5315, 1.79769, 0, 0, 0.782608, 0.622515, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+44, 2040, 0, -1819.15, -2011.03, 66.5258, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+45, 2040, 0, -1755.99, -1427.99, 63.643, 1.78023, 0, 0, 0.777145, 0.629321, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+46, 2040, 0, -1729.78, -3290.1, 13.5406, 4.13643, 0, 0, -0.878817, 0.47716, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+47, 2040, 0, -1657.74, -2215.52, 23.8297, 5.55015, 0, 0, -0.358368, 0.93358, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+48, 2040, 0, -2106.72, -3357.28, 59.2213, -0.802851, 0, 0, 0.390731, -0.920505, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+49, 2040, 0, -2339.53, -1646.11, -24.6021, 0.698131, 0, 0, 0.34202, 0.939693, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+50, 2040, 0, -2307.24, -1790.67, -22.6112, 0.453785, 0, 0, 0.224951, 0.97437, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+51, 2040, 0, -2241.04, -1835.02, -20.1633, 0.418879, 0, 0, 0.207911, 0.978148, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+52, 2040, 0, -2044.11, -3332.36, 59.5733, 2.9845, 0, 0, 0.996917, 0.0784664, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+53, 2040, 0, -2032.64, -3347.23, 61.9084, 3.4034, 0, 0, -0.991445, 0.130528, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+54, 2040, 0, -1920.89, -1674.88, 62.1752, 3.56047, 0, 0, -0.978148, 0.207912, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+55, 2040, 0, -1827.82, -2643.53, 59.8704, 6.23083, 0, 0, -0.0261765, 0.999657, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+56, 2040, 0, -1674.69, -1442.03, 45.8495, 5.41052, 0, 0, -0.422618, 0.906308, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+57, 2040, 0, -920.493, -3939.74, 149.412, 3.6652, 0, 0, -0.965925, 0.258821, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+58, 2040, 0, -890.553, -3868.59, 135.962, 1.88495, 0, 0, 0.809016, 0.587786, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+59, 2040, 0, -821.052, -3915.51, 146.443, 4.93928, 0, 0, -0.622514, 0.782609, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+60, 2040, 0, -926.399, -3898.71, 144.877, 1.36136, 0, 0, 0.62932, 0.777146, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+61, 2040, 0, -899.783, -3967.06, 137.724, 0.331611, 0, 0, 0.165047, 0.986286, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+62, 2040, 0, -873.642, -4014.27, 146.178, 6.21337, 0, 0, -0.0348988, 0.999391, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+63, 2040, 0, -874.558, -3911.16, 134.068, -0.977384, 0, 0, -0.469471, 0.882948, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+64, 2040, 0, -857.528, -3931.43, 149.044, 6.07375, 0, 0, -0.104528, 0.994522, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+65, 2047, 0, -2182, -1665.24, -35.4133, 0.59341, 0, 0, 0.292371, 0.956305, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+66, 2047, 0, -2178.65, -1789.86, -41.0136, 4.55531, 0, 0, -0.760406, 0.649449, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+67, 2047, 0, -2065.41, -3307.87, 67.9717, 5.34071, 0, 0, -0.45399, 0.891007, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+68, 2047, 0, -2063.44, -2676.59, 88.1955, 1.62316, 0, 0, 0.725374, 0.688355, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+69, 2047, 0, -1941.89, -1648.68, 48.6327, 0.157079, 0, 0, 0.0784588, 0.996917, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+70, 2047, 0, -1854.6, -1493.8, 49.2701, 4.7822, 0, 0, -0.681998, 0.731354, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+71, 2047, 0, -1851.72, -1538.44, 66.9113, 2.19911, 0, 0, 0.891006, 0.453991, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+72, 2047, 0, -1848.64, -1760.39, 67.3599, 5.88176, 0, 0, -0.199368, 0.979925, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+73, 2047, 0, -1842.88, -2536.53, 55.9154, -0.680679, 0, 0, 0.333807, -0.942641, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+74, 2047, 0, -1831.79, -1443.18, 59.4886, -0.314159, 0, 0, 0.156434, -0.987688, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+75, 2047, 0, -1824.19, -1799.81, 60.5315, 1.79769, 0, 0, 0.782608, 0.622515, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+76, 2047, 0, -1819.15, -2011.03, 66.5258, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+77, 2047, 0, -1755.99, -1427.99, 63.643, 1.78023, 0, 0, 0.777145, 0.629321, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+78, 2047, 0, -1729.78, -3290.1, 13.5406, 4.13643, 0, 0, -0.878817, 0.47716, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+79, 2047, 0, -1657.74, -2215.52, 23.8297, 5.55015, 0, 0, -0.358368, 0.93358, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+80, 2047, 0, -2106.72, -3357.28, 59.2213, -0.802851, 0, 0, 0.390731, -0.920505, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+81, 2047, 0, -2339.53, -1646.11, -24.6021, 0.698131, 0, 0, 0.34202, 0.939693, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+82, 2047, 0, -2307.24, -1790.67, -22.6112, 0.453785, 0, 0, 0.224951, 0.97437, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+83, 2047, 0, -2241.04, -1835.02, -20.1633, 0.418879, 0, 0, 0.207911, 0.978148, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+84, 2047, 0, -2044.11, -3332.36, 59.5733, 2.9845, 0, 0, 0.996917, 0.0784664, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+85, 2047, 0, -2032.64, -3347.23, 61.9084, 3.4034, 0, 0, -0.991445, 0.130528, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+86, 2047, 0, -1920.89, -1674.88, 62.1752, 3.56047, 0, 0, -0.978148, 0.207912, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+87, 2047, 0, -1827.82, -2643.53, 59.8704, 6.23083, 0, 0, -0.0261765, 0.999657, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+88, 2047, 0, -1674.69, -1442.03, 45.8495, 5.41052, 0, 0, -0.422618, 0.906308, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+89, 2047, 0, -920.493, -3939.74, 149.412, 3.6652, 0, 0, -0.965925, 0.258821, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+90, 2047, 0, -890.553, -3868.59, 135.962, 1.88495, 0, 0, 0.809016, 0.587786, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+91, 2047, 0, -821.052, -3915.51, 146.443, 4.93928, 0, 0, -0.622514, 0.782609, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+92, 2047, 0, -926.399, -3898.71, 144.877, 1.36136, 0, 0, 0.62932, 0.777146, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+93, 2047, 0, -899.783, -3967.06, 137.724, 0.331611, 0, 0, 0.165047, 0.986286, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+94, 2047, 0, -873.642, -4014.27, 146.178, 6.21337, 0, 0, -0.0348988, 0.999391, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+95, 2047, 0, -874.558, -3911.16, 134.068, -0.977384, 0, 0, -0.469471, 0.882948, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+96, 2047, 0, -857.528, -3931.43, 149.044, 6.07375, 0, 0, -0.104528, 0.994522, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@PTEMPLATE+2, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@PTEMPLATE+3, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@PTEMPLATE+4, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@PTEMPLATE+5, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@PTEMPLATE+6, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@PTEMPLATE+7, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@PTEMPLATE+8, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@PTEMPLATE+9, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@PTEMPLATE+10, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@PTEMPLATE+11, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@PTEMPLATE+12, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@PTEMPLATE+13, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@PTEMPLATE+14, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@PTEMPLATE+15, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@PTEMPLATE+16, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@PTEMPLATE+17, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@PTEMPLATE+18, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@PTEMPLATE+19, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@PTEMPLATE+20, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@PTEMPLATE+21, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@PTEMPLATE+22, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@PTEMPLATE+23, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@PTEMPLATE+24, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@PTEMPLATE+25, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@PTEMPLATE+26, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@PTEMPLATE+27, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@PTEMPLATE+28, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@PTEMPLATE+29, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@PTEMPLATE+30, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@PTEMPLATE+31, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@PTEMPLATE+32, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+2, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+3, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+4, @PTEMPLATE+4, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+5, @PTEMPLATE+5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+6, @PTEMPLATE+6, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+7, @PTEMPLATE+7, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+8, @PTEMPLATE+8, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+9, @PTEMPLATE+9, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+10, @PTEMPLATE+10, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+11, @PTEMPLATE+11, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+12, @PTEMPLATE+12, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+13, @PTEMPLATE+13, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+14, @PTEMPLATE+14, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+15, @PTEMPLATE+15, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+16, @PTEMPLATE+16, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+17, @PTEMPLATE+17, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+18, @PTEMPLATE+18, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+19, @PTEMPLATE+19, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+20, @PTEMPLATE+20, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+21, @PTEMPLATE+21, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+22, @PTEMPLATE+22, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+23, @PTEMPLATE+23, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+24, @PTEMPLATE+24, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+25, @PTEMPLATE+25, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+26, @PTEMPLATE+26, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+27, @PTEMPLATE+27, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+28, @PTEMPLATE+28, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+29, @PTEMPLATE+29, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+30, @PTEMPLATE+30, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+31, @PTEMPLATE+31, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+32, @PTEMPLATE+32, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+33, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+34, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+35, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+36, @PTEMPLATE+4, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+37, @PTEMPLATE+5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+38, @PTEMPLATE+6, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+39, @PTEMPLATE+7, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+40, @PTEMPLATE+8, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+41, @PTEMPLATE+9, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+42, @PTEMPLATE+10, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+43, @PTEMPLATE+11, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+44, @PTEMPLATE+12, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+45, @PTEMPLATE+13, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+46, @PTEMPLATE+14, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+47, @PTEMPLATE+15, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+48, @PTEMPLATE+16, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+49, @PTEMPLATE+17, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+50, @PTEMPLATE+18, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+51, @PTEMPLATE+19, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+52, @PTEMPLATE+20, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+53, @PTEMPLATE+21, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+54, @PTEMPLATE+22, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+55, @PTEMPLATE+23, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+56, @PTEMPLATE+24, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+57, @PTEMPLATE+25, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+58, @PTEMPLATE+26, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+59, @PTEMPLATE+27, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+60, @PTEMPLATE+28, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+61, @PTEMPLATE+29, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+62, @PTEMPLATE+30, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+63, @PTEMPLATE+31, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+64, @PTEMPLATE+32, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+65, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+66, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+67, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+68, @PTEMPLATE+4, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+69, @PTEMPLATE+5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+70, @PTEMPLATE+6, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+71, @PTEMPLATE+7, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+72, @PTEMPLATE+8, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+73, @PTEMPLATE+9, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+74, @PTEMPLATE+10, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+75, @PTEMPLATE+11, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+76, @PTEMPLATE+12, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+77, @PTEMPLATE+13, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+78, @PTEMPLATE+14, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+79, @PTEMPLATE+15, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+80, @PTEMPLATE+16, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+81, @PTEMPLATE+17, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+82, @PTEMPLATE+18, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+83, @PTEMPLATE+19, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+84, @PTEMPLATE+20, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+85, @PTEMPLATE+21, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+86, @PTEMPLATE+22, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+87, @PTEMPLATE+23, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+88, @PTEMPLATE+24, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+89, @PTEMPLATE+25, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+90, @PTEMPLATE+26, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+91, @PTEMPLATE+27, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+92, @PTEMPLATE+28, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+93, @PTEMPLATE+29, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+94, @PTEMPLATE+30, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+95, @PTEMPLATE+31, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+96, @PTEMPLATE+32, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(1358, 8, 'Arathi Highlands - Gold Vein / Mithril Deposit / Truesilver Deposit (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1358, 0, 'Arathi Highlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+2, 1358, 0, 'Arathi Highlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+3, 1358, 0, 'Arathi Highlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+4, 1358, 0, 'Arathi Highlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+5, 1358, 0, 'Arathi Highlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+6, 1358, 0, 'Arathi Highlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+7, 1358, 0, 'Arathi Highlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+8, 1358, 0, 'Arathi Highlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+9, 1358, 0, 'Arathi Highlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+10, 1358, 0, 'Arathi Highlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+11, 1358, 0, 'Arathi Highlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+12, 1358, 0, 'Arathi Highlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+13, 1358, 0, 'Arathi Highlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+14, 1358, 0, 'Arathi Highlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+15, 1358, 0, 'Arathi Highlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+16, 1358, 0, 'Arathi Highlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+17, 1358, 0, 'Arathi Highlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+18, 1358, 0, 'Arathi Highlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+19, 1358, 0, 'Arathi Highlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+20, 1358, 0, 'Arathi Highlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+21, 1358, 0, 'Arathi Highlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+22, 1358, 0, 'Arathi Highlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+23, 1358, 0, 'Arathi Highlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+24, 1358, 0, 'Arathi Highlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+25, 1358, 0, 'Arathi Highlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+26, 1358, 0, 'Arathi Highlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+27, 1358, 0, 'Arathi Highlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+28, 1358, 0, 'Arathi Highlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+29, 1358, 0, 'Arathi Highlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+30, 1358, 0, 'Arathi Highlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+31, 1358, 0, 'Arathi Highlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+32, 1358, 0, 'Arathi Highlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Silver / Gold / Iron
SET @OGUID = 57388;
SET @PTEMPLATE = 1691;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1733, 0, -942.624, -3954.16, 146.634, -0.244346, 0, 0, 0.121869, -0.992546, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1733, 0, -911.687, -3877.76, 141.116, 2.51327, 0, 0, 0.951057, 0.309017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1733, 0, -864.812, -3980.47, 149.623, 0.226892, 0, 0, 0.113203, 0.993572, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1733, 0, -847.617, -3965.75, 150.471, 0.226892, 0, 0, 0.113203, 0.993572, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1734, 0, -942.624, -3954.16, 146.634, -0.244346, 0, 0, 0.121869, -0.992546, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1734, 0, -911.687, -3877.76, 141.116, 2.51327, 0, 0, 0.951057, 0.309017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1734, 0, -864.812, -3980.47, 149.623, 0.226892, 0, 0, 0.113203, 0.993572, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1734, 0, -847.617, -3965.75, 150.471, 0.226892, 0, 0, 0.113203, 0.993572, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1735, 0, -942.624, -3954.16, 146.634, -0.244346, 0, 0, 0.121869, -0.992546, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1735, 0, -911.687, -3877.76, 141.116, 2.51327, 0, 0, 0.951057, 0.309017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 1735, 0, -864.812, -3980.47, 149.623, 0.226892, 0, 0, 0.113203, 0.993572, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 1735, 0, -847.617, -3965.75, 150.471, 0.226892, 0, 0, 0.113203, 0.993572, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@PTEMPLATE+2, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@PTEMPLATE+3, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@PTEMPLATE+4, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+2, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+3, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+4, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+5, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+6, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+7, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+8, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+9, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+10, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+11, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+12, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+2, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+3, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+4, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Add Chance
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Tin Vein / Silver Vein - Arathi Highlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1732);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Tin Vein / Silver Vein - Arathi Highlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);

-- Hinterlands
UPDATE `pool_template` SET `description` = 'Hinterlands - Gold Vein / Mithril Deposit / Truesilver Deposit (Master Pool)' WHERE `entry` = 1067;
UPDATE `pool_template` SET `description` = 'Hinterlands - Gold Vein / Silver Vein / Iron Deposit (Master Pool)' WHERE `entry` = 1349;

UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Hinterlands' WHERE `entry` = 17206;
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Hinterlands' WHERE `guid` IN (427578, 16701);
UPDATE `pool_pool` SET `mother_pool` = 1070, `description` = 'Hinterlands - Truesilver Deposit / Small Thorium Vein' WHERE `pool_id` = 17206;
DELETE FROM `pool_gameobject` WHERE `guid` = 427576;

UPDATE `pool_template` SET `description`= 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands' WHERE `entry` = 17052;
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands' WHERE `guid` IN (427071, 427072, 427574);
UPDATE `gameobject` SET `id` = 2047 WHERE `guid` = 427072;
UPDATE `pool_pool` SET `mother_pool` = 1067, `description`='Hinterlands - Gold Vein / Mithril Deposit / Truesilver Deposit' WHERE `pool_id` = 17052;
DELETE FROM `pool_gameobject` WHERE `guid` = 427070;

-- Add Chance
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Hinterlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Hinterlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Hinterlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Hinterlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 324);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Hinterlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
