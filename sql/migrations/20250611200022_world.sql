DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250611200022');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250611200022');
-- Add your query below.


-- Desolace
SET @GGUID = 21298;
SET @PTEMPLATE = 2823;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1733, 1, -2319.42, 2034.88, 118.639, 2.68781, 0, 0, 0.97437, 0.224901, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1733, 1, -2170.28, 1326.13, 68.2869, 1.39626, 0, 0, 0.642787, 0.766045, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1733, 1, -2040.65, 1245.91, 112.965, 3.78737, 0, 0, -0.948323, 0.317306, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1733, 1, -2032.49, 1993.69, 108.117, 0.191985, 0, 0, 0.0908452, 0.990396, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 1733, 1, -2010.17, 1496.46, 83.562, 6.10865, 0, 0, -0.0871553, 0.996190, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 1733, 1, -1501.31, 2173.37, 77.2193, 2.79252, 0, 0, 0.984807, 0.173652, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+6, 1733, 1, -1291.33, 1060.97, 98.4748, 2.9845, 0, 0, 0.996917, 0.0784664, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+7, 1733, 1, -1218.09, 2102.03, 97.4261, 1.90477, 0, 0, 0.829038, 0.559193, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+8, 1733, 1, -978.96, 1433.73, 69.1913, 2.82743, 0, 0, 0.987688, 0.156436, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+9, 1733, 1, -941.562, 1966.8, 72.4874, 0.0174525, 0, 0, 0.00872612, 0.999962, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+10, 1733, 1, -747.892, 2484.33, 91.2915, 0.0698117, 0, 0, 0.0348988, 0.999391, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+11, 1733, 1, -634.496, 684.903, 143.198, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+12, 1733, 1, -284.88, 2194.65, 114.605, 2.00713, 0, 0, 0.843391, 0.5373, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+13, 1733, 1, -278.014, 655.564, 113.608, 6.0912, 0, 0, -0.0908452, 0.990396, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+14, 1733, 1, -258.27, 1972.23, 169.742, 0.226892, 0, 0, 0.113203, 0.993572, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+15, 1733, 1, -174.675, 2103.35, 145.822, 4.71239, 0, 0, -0.707107, 0.707107, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+16, 1733, 1, -149.233, 891.301, 123.178, 4.38078, 0, 0, -0.814116, 0.580703, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+17, 1733, 1, -130.526, 737.533, 123.25, 2.84488, 0, 0, 0.989016, 0.147811, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+18, 1733, 1, -79.5582, 2147.99, 119.492, 0.733038, 0, 0, 0.358368, 0.93358, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+19, 1733, 1, -54.3965, 2490.24, -25.4267, 3.29869, 0, 0, -0.996917, 0.0784664, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+20, 1733, 1, -10.5289, 2267.28, 66.8052, 2.49082, 0, 0, 0.948323, 0.317306, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+21, 1733, 1, 46.9697, 2496.53, -28.0761, 5.32326, 0, 0, -0.461748, 0.887011, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+22, 1733, 1, 111.294, 2531.23, -52.8749, 1.44862, 0, 0, 0.66262, 0.748906, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+23, 1733, 1, 238.87, 2561.32, -52.5877, 3.22886, 0, 0, -0.999048, 0.0436193, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+24, 1733, 1, 275.046, 1982.8, 154.533, 3.08923, 0, 0, 0.999657, 0.026177, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+25, 1734, 1, -2319.42, 2034.88, 118.639, 2.68781, 0, 0, 0.97437, 0.224901, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+26, 1734, 1, -2170.28, 1326.13, 68.2869, 1.39626, 0, 0, 0.642787, 0.766045, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+27, 1734, 1, -2040.65, 1245.91, 112.965, 3.78737, 0, 0, -0.948323, 0.317306, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+28, 1734, 1, -2032.49, 1993.69, 108.117, 0.191985, 0, 0, 0.0908452, 0.990396, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+29, 1734, 1, -2010.17, 1496.46, 83.562, 6.10865, 0, 0, -0.0871553, 0.996190, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+30, 1734, 1, -1501.31, 2173.37, 77.2193, 2.79252, 0, 0, 0.984807, 0.173652, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+31, 1734, 1, -1291.33, 1060.97, 98.4748, 2.9845, 0, 0, 0.996917, 0.0784664, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+32, 1734, 1, -1218.09, 2102.03, 97.4261, 1.90477, 0, 0, 0.829038, 0.559193, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+33, 1734, 1, -978.96, 1433.73, 69.1913, 2.82743, 0, 0, 0.987688, 0.156436, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+34, 1734, 1, -941.562, 1966.8, 72.4874, 0.0174525, 0, 0, 0.00872612, 0.999962, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+35, 1734, 1, -747.892, 2484.33, 91.2915, 0.0698117, 0, 0, 0.0348988, 0.999391, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+36, 1734, 1, -634.496, 684.903, 143.198, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+37, 1734, 1, -284.88, 2194.65, 114.605, 2.00713, 0, 0, 0.843391, 0.5373, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+38, 1734, 1, -278.014, 655.564, 113.608, 6.0912, 0, 0, -0.0908452, 0.990396, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+39, 1734, 1, -258.27, 1972.23, 169.742, 0.226892, 0, 0, 0.113203, 0.993572, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+40, 1734, 1, -174.675, 2103.35, 145.822, 4.71239, 0, 0, -0.707107, 0.707107, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+41, 1734, 1, -149.233, 891.301, 123.178, 4.38078, 0, 0, -0.814116, 0.580703, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+42, 1734, 1, -130.526, 737.533, 123.25, 2.84488, 0, 0, 0.989016, 0.147811, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+43, 1734, 1, -79.5582, 2147.99, 119.492, 0.733038, 0, 0, 0.358368, 0.93358, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+44, 1734, 1, -54.3965, 2490.24, -25.4267, 3.29869, 0, 0, -0.996917, 0.0784664, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+45, 1734, 1, -10.5289, 2267.28, 66.8052, 2.49082, 0, 0, 0.948323, 0.317306, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+46, 1734, 1, 46.9697, 2496.53, -28.0761, 5.32326, 0, 0, -0.461748, 0.887011, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+47, 1734, 1, 111.294, 2531.23, -52.8749, 1.44862, 0, 0, 0.66262, 0.748906, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+48, 1734, 1, 238.87, 2561.32, -52.5877, 3.22886, 0, 0, -0.999048, 0.0436193, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+49, 1734, 1, 275.046, 1982.8, 154.533, 3.08923, 0, 0, 0.999657, 0.026177, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+50, 1735, 1, -2319.42, 2034.88, 118.639, 2.68781, 0, 0, 0.97437, 0.224901, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+51, 1735, 1, -2170.28, 1326.13, 68.2869, 1.39626, 0, 0, 0.642787, 0.766045, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+52, 1735, 1, -2040.65, 1245.91, 112.965, 3.78737, 0, 0, -0.948323, 0.317306, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+53, 1735, 1, -2032.49, 1993.69, 108.117, 0.191985, 0, 0, 0.0908452, 0.990396, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+54, 1735, 1, -2010.17, 1496.46, 83.562, 6.10865, 0, 0, -0.0871553, 0.996190, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+55, 1735, 1, -1501.31, 2173.37, 77.2193, 2.79252, 0, 0, 0.984807, 0.173652, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+56, 1735, 1, -1291.33, 1060.97, 98.4748, 2.9845, 0, 0, 0.996917, 0.0784664, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+57, 1735, 1, -1218.09, 2102.03, 97.4261, 1.90477, 0, 0, 0.829038, 0.559193, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+58, 1735, 1, -978.96, 1433.73, 69.1913, 2.82743, 0, 0, 0.987688, 0.156436, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+59, 1735, 1, -941.562, 1966.8, 72.4874, 0.0174525, 0, 0, 0.00872612, 0.999962, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+60, 1735, 1, -747.892, 2484.33, 91.2915, 0.0698117, 0, 0, 0.0348988, 0.999391, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+61, 1735, 1, -634.496, 684.903, 143.198, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+62, 1735, 1, -284.88, 2194.65, 114.605, 2.00713, 0, 0, 0.843391, 0.5373, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+63, 1735, 1, -278.014, 655.564, 113.608, 6.0912, 0, 0, -0.0908452, 0.990396, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+64, 1735, 1, -258.27, 1972.23, 169.742, 0.226892, 0, 0, 0.113203, 0.993572, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+65, 1735, 1, -174.675, 2103.35, 145.822, 4.71239, 0, 0, -0.707107, 0.707107, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+66, 1735, 1, -149.233, 891.301, 123.178, 4.38078, 0, 0, -0.814116, 0.580703, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+67, 1735, 1, -130.526, 737.533, 123.25, 2.84488, 0, 0, 0.989016, 0.147811, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+68, 1735, 1, -79.5582, 2147.99, 119.492, 0.733038, 0, 0, 0.358368, 0.93358, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+69, 1735, 1, -54.3965, 2490.24, -25.4267, 3.29869, 0, 0, -0.996917, 0.0784664, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+70, 1735, 1, -10.5289, 2267.28, 66.8052, 2.49082, 0, 0, 0.948323, 0.317306, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+71, 1735, 1, 46.9697, 2496.53, -28.0761, 5.32326, 0, 0, -0.461748, 0.887011, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+72, 1735, 1, 111.294, 2531.23, -52.8749, 1.44862, 0, 0, 0.66262, 0.748906, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+73, 1735, 1, 238.87, 2561.32, -52.5877, 3.22886, 0, 0, -0.999048, 0.0436193, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+74, 1735, 1, 275.046, 1982.8, 154.533, 3.08923, 0, 0, 0.999657, 0.026177, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 0, 10),
(@PTEMPLATE+2, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 0, 10),
(@PTEMPLATE+3, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 0, 10),
(@PTEMPLATE+4, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 0, 10),
(@PTEMPLATE+5, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 0, 10),
(@PTEMPLATE+6, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 0, 10),
(@PTEMPLATE+7, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 0, 10),
(@PTEMPLATE+8, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 0, 10),
(@PTEMPLATE+9, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 0, 10),
(@PTEMPLATE+10, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 0, 10),
(@PTEMPLATE+11, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 0, 10),
(@PTEMPLATE+12, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 0, 10),
(@PTEMPLATE+13, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 0, 10),
(@PTEMPLATE+14, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 0, 10),
(@PTEMPLATE+15, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 0, 10),
(@PTEMPLATE+16, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 0, 10),
(@PTEMPLATE+17, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 0, 10),
(@PTEMPLATE+18, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 0, 10),
(@PTEMPLATE+19, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 0, 10),
(@PTEMPLATE+20, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 0, 10),
(@PTEMPLATE+21, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 0, 10),
(@PTEMPLATE+22, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 0, 10),
(@PTEMPLATE+23, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 0, 10),
(@PTEMPLATE+24, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+2, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+3, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+4, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+5, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+6, @PTEMPLATE+6, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+7, @PTEMPLATE+7, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+8, @PTEMPLATE+8, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+9, @PTEMPLATE+9, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+10, @PTEMPLATE+10, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+11, @PTEMPLATE+11, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+12, @PTEMPLATE+12, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+13, @PTEMPLATE+13, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+14, @PTEMPLATE+14, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+15, @PTEMPLATE+15, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+16, @PTEMPLATE+16, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+17, @PTEMPLATE+17, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+18, @PTEMPLATE+18, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+19, @PTEMPLATE+19, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+20, @PTEMPLATE+20, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+21, @PTEMPLATE+21, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+22, @PTEMPLATE+22, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+23, @PTEMPLATE+23, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+24, @PTEMPLATE+24, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+25, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+26, @PTEMPLATE+1, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+27, @PTEMPLATE+2, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+28, @PTEMPLATE+3, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+29, @PTEMPLATE+4, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+30, @PTEMPLATE+5, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+31, @PTEMPLATE+6, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+32, @PTEMPLATE+7, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+33, @PTEMPLATE+8, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+34, @PTEMPLATE+9, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+35, @PTEMPLATE+10, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+36, @PTEMPLATE+11, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+37, @PTEMPLATE+12, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+38, @PTEMPLATE+13, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+39, @PTEMPLATE+14, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+40, @PTEMPLATE+15, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+41, @PTEMPLATE+16, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+42, @PTEMPLATE+17, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+43, @PTEMPLATE+18, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+44, @PTEMPLATE+19, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+45, @PTEMPLATE+20, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+46, @PTEMPLATE+21, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+47, @PTEMPLATE+22, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+48, @PTEMPLATE+23, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+49, @PTEMPLATE+24, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+50, @PTEMPLATE+0, 90, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+51, @PTEMPLATE+1, 90, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+52, @PTEMPLATE+2, 90, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+53, @PTEMPLATE+3, 90, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+54, @PTEMPLATE+4, 90, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+55, @PTEMPLATE+5, 90, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+56, @PTEMPLATE+6, 90, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+57, @PTEMPLATE+7, 90, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+58, @PTEMPLATE+8, 90, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+59, @PTEMPLATE+9, 90, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+60, @PTEMPLATE+10, 90, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+61, @PTEMPLATE+11, 90, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+62, @PTEMPLATE+12, 90, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+63, @PTEMPLATE+13, 90, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+64, @PTEMPLATE+14, 90, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+65, @PTEMPLATE+15, 90, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+66, @PTEMPLATE+16, 90, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+67, @PTEMPLATE+17, 90, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+68, @PTEMPLATE+18, 90, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+69, @PTEMPLATE+19, 90, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+70, @PTEMPLATE+20, 90, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+71, @PTEMPLATE+21, 90, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+72, @PTEMPLATE+22, 90, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+73, @PTEMPLATE+23, 90, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+74, @PTEMPLATE+24, 90, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 1351, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+1, 1351, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+2, 1351, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+3, 1351, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+4, 1351, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+5, 1351, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+6, 1351, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+7, 1351, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+8, 1351, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+9, 1351, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+10, 1351, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+11, 1351, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+12, 1351, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+13, 1351, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+14, 1351, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+15, 1351, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+16, 1351, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+17, 1351, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+18, 1351, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+19, 1351, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+20, 1351, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+21, 1351, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+22, 1351, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+23, 1351, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+24, 1351, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Stranglethorn
SET @GGUID = 7246;
SET @PTEMPLATE = 2555;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1733, 0, -14000.6, 32.3996, 33.4384, 5.20108, 0, 0, -0.515038, 0.857168, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1733, 0, -13643.5, -101.346, 40.4634, 6.16101, 0, 0, -0.0610485, 0.998135, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1733, 0, -13615.8, -211.779, 30.41, 0.209439, 0, 0, 0.104528, 0.994522, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1733, 0, -13454.8, -110.943, 48.0463, 1.43117, 0, 0, 0.656058, 0.75471, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 1733, 0, -13397.5, 312.935, 47.7852, 1.85005, 0, 0, 0.798635, 0.601815, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 1733, 0, -12928, -431.547, 31.7529, 4.27606, 0, 0, -0.843391, 0.5373, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+6, 1733, 0, -12686.5, -900.185, 77.658, 3.64774, 0, 0, -0.968147, 0.250381, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+7, 1733, 0, -12609, -909.657, 92.6656, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+8, 1733, 0, -12500.1, -1037.55, 79.0014, 3.3685, 0, 0, -0.993571, 0.113208, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+9, 1733, 0, -11708.7, -883.98, 38.2922, 6.03884, 0, 0, -0.121869, 0.992546, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+10, 1733, 0, -11614.7, -856.519, 50.4978, 5.49779, 0, 0, -0.382683, 0.92388, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+11, 1733, 0, -11599.4, 498.062, 67.5316, 5.70723, 0, 0, -0.284015, 0.90882, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+12, 1734, 0, -14000.6, 32.3996, 33.4384, 5.20108, 0, 0, -0.515038, 0.857168, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+13, 1734, 0, -13643.5, -101.346, 40.4634, 6.16101, 0, 0, -0.0610485, 0.998135, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+14, 1734, 0, -13615.8, -211.779, 30.41, 0.209439, 0, 0, 0.104528, 0.994522, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+15, 1734, 0, -13454.8, -110.943, 48.0463, 1.43117, 0, 0, 0.656058, 0.75471, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+16, 1734, 0, -13397.5, 312.935, 47.7852, 1.85005, 0, 0, 0.798635, 0.601815, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+17, 1734, 0, -12928, -431.547, 31.7529, 4.27606, 0, 0, -0.843391, 0.5373, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+18, 1734, 0, -12686.5, -900.185, 77.658, 3.64774, 0, 0, -0.968147, 0.250381, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+19, 1734, 0, -12609, -909.657, 92.6656, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+20, 1734, 0, -12500.1, -1037.55, 79.0014, 3.3685, 0, 0, -0.993571, 0.113208, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+21, 1734, 0, -11708.7, -883.98, 38.2922, 6.03884, 0, 0, -0.121869, 0.992546, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+22, 1734, 0, -11614.7, -856.519, 50.4978, 5.49779, 0, 0, -0.382683, 0.92388, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+23, 1734, 0, -11599.4, 498.062, 67.5316, 5.70723, 0, 0, -0.284015, 0.90882, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+24, 1735, 0, -14000.6, 32.3996, 33.4384, 5.20108, 0, 0, -0.515038, 0.857168, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+25, 1735, 0, -13643.5, -101.346, 40.4634, 6.16101, 0, 0, -0.0610485, 0.998135, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+26, 1735, 0, -13615.8, -211.779, 30.41, 0.209439, 0, 0, 0.104528, 0.994522, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+27, 1735, 0, -13454.8, -110.943, 48.0463, 1.43117, 0, 0, 0.656058, 0.75471, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+28, 1735, 0, -13397.5, 312.935, 47.7852, 1.85005, 0, 0, 0.798635, 0.601815, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+29, 1735, 0, -12928, -431.547, 31.7529, 4.27606, 0, 0, -0.843391, 0.5373, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+30, 1735, 0, -12686.5, -900.185, 77.658, 3.64774, 0, 0, -0.968147, 0.250381, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+31, 1735, 0, -12609, -909.657, 92.6656, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+32, 1735, 0, -12500.1, -1037.55, 79.0014, 3.3685, 0, 0, -0.993571, 0.113208, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+33, 1735, 0, -11708.7, -883.98, 38.2922, 6.03884, 0, 0, -0.121869, 0.992546, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+34, 1735, 0, -11614.7, -856.519, 50.4978, 5.49779, 0, 0, -0.382683, 0.92388, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+35, 1735, 0, -11599.4, 498.062, 67.5316, 5.70723, 0, 0, -0.284015, 0.90882, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 0, 10),
(@PTEMPLATE+2, 1, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 0, 10),
(@PTEMPLATE+3, 1, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 0, 10),
(@PTEMPLATE+4, 1, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 0, 10),
(@PTEMPLATE+5, 1, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 0, 10),
(@PTEMPLATE+6, 1, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 0, 10),
(@PTEMPLATE+7, 1, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 0, 10),
(@PTEMPLATE+8, 1, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 0, 10),
(@PTEMPLATE+9, 1, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 0, 10),
(@PTEMPLATE+10, 1, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 0, 10),
(@PTEMPLATE+11, 1, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 5, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+2, 5, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+3, 5, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+4, 5, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+5, 5, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 10),
(@GGUID+6, @PTEMPLATE+6, 5, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 10),
(@GGUID+7, @PTEMPLATE+7, 5, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 10),
(@GGUID+8, @PTEMPLATE+8, 5, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 10),
(@GGUID+9, @PTEMPLATE+9, 5, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 10),
(@GGUID+10, @PTEMPLATE+10, 5, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 10),
(@GGUID+11, @PTEMPLATE+11, 5, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 10),
(@GGUID+12, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 10),
(@GGUID+13, @PTEMPLATE+1, 5, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 10),
(@GGUID+14, @PTEMPLATE+2, 5, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 10),
(@GGUID+15, @PTEMPLATE+3, 5, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 10),
(@GGUID+16, @PTEMPLATE+4, 5, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 10),
(@GGUID+17, @PTEMPLATE+5, 5, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 10),
(@GGUID+18, @PTEMPLATE+6, 5, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 10),
(@GGUID+19, @PTEMPLATE+7, 5, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 10),
(@GGUID+20, @PTEMPLATE+8, 5, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 10),
(@GGUID+21, @PTEMPLATE+9, 5, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 10),
(@GGUID+22, @PTEMPLATE+10, 5, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 10),
(@GGUID+23, @PTEMPLATE+11, 5, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 10),
(@GGUID+24, @PTEMPLATE+0, 90, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 10),
(@GGUID+25, @PTEMPLATE+1, 90, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 10),
(@GGUID+26, @PTEMPLATE+2, 90, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 10),
(@GGUID+27, @PTEMPLATE+3, 90, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 10),
(@GGUID+28, @PTEMPLATE+4, 90, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 10),
(@GGUID+29, @PTEMPLATE+5, 90, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 10),
(@GGUID+30, @PTEMPLATE+6, 90, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 10),
(@GGUID+31, @PTEMPLATE+7, 90, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 10),
(@GGUID+32, @PTEMPLATE+8, 90, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 10),
(@GGUID+33, @PTEMPLATE+9, 90, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 10),
(@GGUID+34, @PTEMPLATE+10, 90, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 10),
(@GGUID+35, @PTEMPLATE+11, 90, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 9911, 0, 'Stranglethorn Vale - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+1, 9911, 0, 'Stranglethorn Vale - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+2, 9911, 0, 'Stranglethorn Vale - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+3, 9911, 0, 'Stranglethorn Vale - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+4, 9911, 0, 'Stranglethorn Vale - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+5, 9911, 0, 'Stranglethorn Vale - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+6, 9911, 0, 'Stranglethorn Vale - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+7, 9911, 0, 'Stranglethorn Vale - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+8, 9911, 0, 'Stranglethorn Vale - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+9, 9911, 0, 'Stranglethorn Vale - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+10, 9911, 0, 'Stranglethorn Vale - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+11, 9911, 0, 'Stranglethorn Vale - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Arathi
SET @GGUID = 6084;
SET @PTEMPLATE = 2464;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1733, 0, -2372.2, -1556.79, -45.2468, 3.7001, 0, 0, -0.961261, 0.27564, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1733, 0, -1908.4, -3042.94, 70.0447, 4.66003, 0, 0, -0.725374, 0.688355, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1733, 0, -1800.32, -3292.45, 30.0816, 1.18682, 0, 0, 0.559193, 0.829038, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1733, 0, -1005.58, -3711.87, 99.6205, 1.50098, 0, 0, 0.681998, 0.731354, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 1733, 0, -924.653, -2773.51, 67.1129, 4.31097, 0, 0, -0.833885, 0.551938, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 1733, 0, -824.069, -3644.92, 91.11, 4.45059, 0, 0, -0.793353, 0.608762, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+6, 1733, 0, -688.662, -2243.45, 72.0709, 2.32129, 0, 0, 0.91706, 0.39875, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+7, 1734, 0, -2372.2, -1556.79, -45.2468, 3.7001, 0, 0, -0.961261, 0.27564, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+8, 1734, 0, -1908.4, -3042.94, 70.0447, 4.66003, 0, 0, -0.725374, 0.688355, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+9, 1734, 0, -1800.32, -3292.45, 30.0816, 1.18682, 0, 0, 0.559193, 0.829038, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+10, 1734, 0, -1005.58, -3711.87, 99.6205, 1.50098, 0, 0, 0.681998, 0.731354, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+11, 1734, 0, -924.653, -2773.51, 67.1129, 4.31097, 0, 0, -0.833885, 0.551938, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+12, 1734, 0, -824.069, -3644.92, 91.11, 4.45059, 0, 0, -0.793353, 0.608762, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+13, 1734, 0, -688.662, -2243.45, 72.0709, 2.32129, 0, 0, 0.91706, 0.39875, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+14, 1735, 0, -2372.2, -1556.79, -45.2468, 3.7001, 0, 0, -0.961261, 0.27564, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+15, 1735, 0, -1908.4, -3042.94, 70.0447, 4.66003, 0, 0, -0.725374, 0.688355, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+16, 1735, 0, -1800.32, -3292.45, 30.0816, 1.18682, 0, 0, 0.559193, 0.829038, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+17, 1735, 0, -1005.58, -3711.87, 99.6205, 1.50098, 0, 0, 0.681998, 0.731354, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+18, 1735, 0, -924.653, -2773.51, 67.1129, 4.31097, 0, 0, -0.833885, 0.551938, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+19, 1735, 0, -824.069, -3644.92, 91.11, 4.45059, 0, 0, -0.793353, 0.608762, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+20, 1735, 0, -688.662, -2243.45, 72.0709, 2.32129, 0, 0, 0.91706, 0.39875, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 0, 0, 0, 10),
(@PTEMPLATE+2, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 0, 0, 0, 10),
(@PTEMPLATE+3, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 0, 0, 0, 10),
(@PTEMPLATE+4, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 0, 0, 0, 10),
(@PTEMPLATE+5, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 0, 0, 0, 10),
(@PTEMPLATE+6, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 5, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+2, 5, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+3, 5, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+4, 5, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+5, 5, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 0, 0, 10),
(@GGUID+6, @PTEMPLATE+6, 5, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 0, 0, 10),
(@GGUID+7, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 0, 0, 10),
(@GGUID+8, @PTEMPLATE+1, 5, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 0, 0, 10),
(@GGUID+9, @PTEMPLATE+2, 5, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 0, 0, 10),
(@GGUID+10, @PTEMPLATE+3, 5, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 0, 0, 10),
(@GGUID+11, @PTEMPLATE+4, 5, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 0, 0, 10),
(@GGUID+12, @PTEMPLATE+5, 5, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 0, 0, 10),
(@GGUID+13, @PTEMPLATE+6, 5, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 0, 0, 10),
(@GGUID+14, @PTEMPLATE+0, 90, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 0, 0, 10),
(@GGUID+15, @PTEMPLATE+1, 90, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 0, 0, 10),
(@GGUID+16, @PTEMPLATE+2, 90, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 0, 0, 10),
(@GGUID+17, @PTEMPLATE+3, 90, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 0, 0, 10),
(@GGUID+18, @PTEMPLATE+4, 90, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 0, 0, 10),
(@GGUID+19, @PTEMPLATE+5, 90, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 0, 0, 10),
(@GGUID+20, @PTEMPLATE+6, 90, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+1, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+2, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+3, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+4, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+5, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+6, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Dustwallow
SET @GGUID = 6132;
SET @PTEMPLATE = 2589;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1733, 1, -4367.68, -2961.22, 65.6353, 5.39307, 0, 0, -0.430511, 0.902586, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1733, 1, -4290.23, -2939.93, 40.2418, 3.07177, 0, 0, 0.999391, 0.0349061, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1733, 1, -3713.66, -4051.21, 0.624597, 6.21337, 0, 0, -0.0348988, 0.999391, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1733, 1, -3684.18, -3627.3, 56.7816, 4.99164, 0, 0, -0.601814, 0.798636, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 1733, 1, -2771.58, -2903.02, 40.0194, 4.27606, 0, 0, -0.843391, 0.5373, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 1733, 1, -2593.24, -3907.01, 18.1469, 1.97222, 0, 0, 0.833885, 0.551938, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+6, 1733, 1, -2494.65, -3128.5, 40.6818, 0.226892, 0, 0, 0.113203, 0.993572, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+7, 1734, 1, -4367.68, -2961.22, 65.6353, 5.39307, 0, 0, -0.430511, 0.902586, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+8, 1734, 1, -4290.23, -2939.93, 40.2418, 3.07177, 0, 0, 0.999391, 0.0349061, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+9, 1734, 1, -3713.66, -4051.21, 0.624597, 6.21337, 0, 0, -0.0348988, 0.999391, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+10, 1734, 1, -3684.18, -3627.3, 56.7816, 4.99164, 0, 0, -0.601814, 0.798636, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+11, 1734, 1, -2771.58, -2903.02, 40.0194, 4.27606, 0, 0, -0.843391, 0.5373, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+12, 1734, 1, -2593.24, -3907.01, 18.1469, 1.97222, 0, 0, 0.833885, 0.551938, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+13, 1734, 1, -2494.65, -3128.5, 40.6818, 0.226892, 0, 0, 0.113203, 0.993572, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+14, 1735, 1, -4367.68, -2961.22, 65.6353, 5.39307, 0, 0, -0.430511, 0.902586, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+15, 1735, 1, -4290.23, -2939.93, 40.2418, 3.07177, 0, 0, 0.999391, 0.0349061, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+16, 1735, 1, -3713.66, -4051.21, 0.624597, 6.21337, 0, 0, -0.0348988, 0.999391, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+17, 1735, 1, -3684.18, -3627.3, 56.7816, 4.99164, 0, 0, -0.601814, 0.798636, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+18, 1735, 1, -2771.58, -2903.02, 40.0194, 4.27606, 0, 0, -0.843391, 0.5373, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+19, 1735, 1, -2593.24, -3907.01, 18.1469, 1.97222, 0, 0, 0.833885, 0.551938, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+20, 1735, 1, -2494.65, -3128.5, 40.6818, 0.226892, 0, 0, 0.113203, 0.993572, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 0, 10),
(@PTEMPLATE+2, 1, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 0, 10),
(@PTEMPLATE+3, 1, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 0, 10),
(@PTEMPLATE+4, 1, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 0, 10),
(@PTEMPLATE+5, 1, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 0, 10),
(@PTEMPLATE+6, 1, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 5, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+2, 5, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+3, 5, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+4, 5, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+5, 5, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@GGUID+6, @PTEMPLATE+6, 5, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@GGUID+7, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@GGUID+8, @PTEMPLATE+1, 5, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@GGUID+9, @PTEMPLATE+2, 5, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@GGUID+10, @PTEMPLATE+3, 5, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@GGUID+11, @PTEMPLATE+4, 5, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@GGUID+12, @PTEMPLATE+5, 5, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@GGUID+13, @PTEMPLATE+6, 5, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@GGUID+14, @PTEMPLATE+0, 90, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@GGUID+15, @PTEMPLATE+1, 90, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@GGUID+16, @PTEMPLATE+2, 90, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@GGUID+17, @PTEMPLATE+3, 90, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@GGUID+18, @PTEMPLATE+4, 90, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@GGUID+19, @PTEMPLATE+5, 90, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@GGUID+20, @PTEMPLATE+6, 90, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 9904, 0, 'Dustwallow Marsh - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+1, 9904, 0, 'Dustwallow Marsh - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+2, 9904, 0, 'Dustwallow Marsh - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+3, 9904, 0, 'Dustwallow Marsh - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+4, 9904, 0, 'Dustwallow Marsh - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+5, 9904, 0, 'Dustwallow Marsh - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+6, 9904, 0, 'Dustwallow Marsh - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Alterac
SET @GGUID = 6064;
SET @PTEMPLATE = 2866;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1733, 0, 224.513, -1487.89, 64.2197, 5.49779, 0, 0, -0.382683, 0.92388, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1733, 0, 551.741, -661.490, 187.468, 3.80482, 0, 0, -0.945518, 0.325568, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1733, 0, 619.59, -145.721, 149.696, 5.41052, 0, 0, -0.422618, 0.906308, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1733, 0, 769.556, -501.706, 141.871, 2.25147, 0, 0, 0.902585, 0.430512, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 1733, 0, 967.853, -489.439, 136.014, 1.97222, 0, 0, 0.833885, 0.551938, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 1733, 0, 1157.02, -629.499, 82.0968, 0.90757, 0, 0, 0.438371, 0.898794, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+6, 1734, 0, 224.513, -1487.89, 64.2197, 5.49779, 0, 0, -0.382683, 0.92388, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+7, 1734, 0, 551.741, -661.490, 187.468, 3.80482, 0, 0, -0.945518, 0.325568, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+8, 1734, 0, 619.59, -145.721, 149.696, 5.41052, 0, 0, -0.422618, 0.906308, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+9, 1734, 0, 769.556, -501.706, 141.871, 2.25147, 0, 0, 0.902585, 0.430512, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+10, 1734, 0, 967.853, -489.439, 136.014, 1.97222, 0, 0, 0.833885, 0.551938, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+11, 1734, 0, 1157.02, -629.499, 82.0968, 0.90757, 0, 0, 0.438371, 0.898794, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+12, 1735, 0, 224.513, -1487.89, 64.2197, 5.49779, 0, 0, -0.382683, 0.92388, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+13, 1735, 0, 551.741, -661.490, 187.468, 3.80482, 0, 0, -0.945518, 0.325568, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+14, 1735, 0, 619.59, -145.721, 149.696, 5.41052, 0, 0, -0.422618, 0.906308, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+15, 1735, 0, 769.556, -501.706, 141.871, 2.25147, 0, 0, 0.902585, 0.430512, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+16, 1735, 0, 967.853, -489.439, 136.014, 1.97222, 0, 0, 0.833885, 0.551938, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+17, 1735, 0, 1157.02, -629.499, 82.0968, 0.90757, 0, 0, 0.438371, 0.898794, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Silver Vein / Gold Vein / Iron Deposit - Alterac Mountains', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit - Alterac Mountains', 0, 0, 0, 10),
(@PTEMPLATE+2, 1, 'Silver Vein / Gold Vein / Iron Deposit - Alterac Mountains', 0, 0, 0, 10),
(@PTEMPLATE+3, 1, 'Silver Vein / Gold Vein / Iron Deposit - Alterac Mountains', 0, 0, 0, 10),
(@PTEMPLATE+4, 1, 'Silver Vein / Gold Vein / Iron Deposit - Alterac Mountains', 0, 0, 0, 10),
(@PTEMPLATE+5, 1, 'Silver Vein / Gold Vein / Iron Deposit - Alterac Mountains', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Alterac Mountains', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 5, 'Silver Vein / Gold Vein / Iron Deposit - Alterac Mountains', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+2, 5, 'Silver Vein / Gold Vein / Iron Deposit - Alterac Mountains', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+3, 5, 'Silver Vein / Gold Vein / Iron Deposit - Alterac Mountains', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+4, 5, 'Silver Vein / Gold Vein / Iron Deposit - Alterac Mountains', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+5, 5, 'Silver Vein / Gold Vein / Iron Deposit - Alterac Mountains', 0, 0, 10),
(@GGUID+6, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Alterac Mountains', 0, 0, 10),
(@GGUID+7, @PTEMPLATE+1, 5, 'Silver Vein / Gold Vein / Iron Deposit - Alterac Mountains', 0, 0, 10),
(@GGUID+8, @PTEMPLATE+2, 5, 'Silver Vein / Gold Vein / Iron Deposit - Alterac Mountains', 0, 0, 10),
(@GGUID+9, @PTEMPLATE+3, 5, 'Silver Vein / Gold Vein / Iron Deposit - Alterac Mountains', 0, 0, 10),
(@GGUID+10, @PTEMPLATE+4, 5, 'Silver Vein / Gold Vein / Iron Deposit - Alterac Mountains', 0, 0, 10),
(@GGUID+11, @PTEMPLATE+5, 5, 'Silver Vein / Gold Vein / Iron Deposit - Alterac Mountains', 0, 0, 10),
(@GGUID+12, @PTEMPLATE+0, 90, 'Silver Vein / Gold Vein / Iron Deposit - Alterac Mountains', 0, 0, 10),
(@GGUID+13, @PTEMPLATE+1, 90, 'Silver Vein / Gold Vein / Iron Deposit - Alterac Mountains', 0, 0, 10),
(@GGUID+14, @PTEMPLATE+2, 90, 'Silver Vein / Gold Vein / Iron Deposit - Alterac Mountains', 0, 0, 10),
(@GGUID+15, @PTEMPLATE+3, 90, 'Silver Vein / Gold Vein / Iron Deposit - Alterac Mountains', 0, 0, 10),
(@GGUID+16, @PTEMPLATE+4, 90, 'Silver Vein / Gold Vein / Iron Deposit - Alterac Mountains', 0, 0, 10),
(@GGUID+17, @PTEMPLATE+5, 90, 'Silver Vein / Gold Vein / Iron Deposit - Alterac Mountains', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 9900, 0, 'Alterac Mountains - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+1, 9900, 0, 'Alterac Mountains - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+2, 9900, 0, 'Alterac Mountains - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+3, 9900, 0, 'Alterac Mountains - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+4, 9900, 0, 'Alterac Mountains - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+5, 9900, 0, 'Alterac Mountains - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Crystalvein Mine
SET @GGUID = 5064;
SET @PTEMPLATE = 2567;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1733, 0, -13255, -602.976, 5.9219, 4.27606, 0, 0, -0.843391, 0.5373, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1733, 0, -13228.1, -511.552, 14.2647, -1.16937, 0, 0, -0.551936, 0.833886, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1733, 0, -13198.3, -534.564, 5.02586, 0.209439, 0, 0, 0.104528, 0.994522, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1733, 0, -13192.1, -579.183, 12.9627, 1.83259, 0, 0, 0.793353, 0.608762, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 1733, 0, -13168.8, -480.454, 6.74536, 2.60054, 0, 0, 0.96363, 0.267241, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 1734, 0, -13255, -602.976, 5.9219, 4.27606, 0, 0, -0.843391, 0.5373, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+6, 1734, 0, -13228.1, -511.552, 14.2647, -1.16937, 0, 0, -0.551936, 0.833886, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+7, 1734, 0, -13198.3, -534.564, 5.02586, 0.209439, 0, 0, 0.104528, 0.994522, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+8, 1734, 0, -13192.1, -579.183, 12.9627, 1.83259, 0, 0, 0.793353, 0.608762, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+9, 1734, 0, -13168.8, -480.454, 6.74536, 2.60054, 0, 0, 0.96363, 0.267241, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+10, 1735, 0, -13255, -602.976, 5.9219, 4.27606, 0, 0, -0.843391, 0.5373, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+11, 1735, 0, -13228.1, -511.552, 14.2647, -1.16937, 0, 0, -0.551936, 0.833886, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+12, 1735, 0, -13198.3, -534.564, 5.02586, 0.209439, 0, 0, 0.104528, 0.994522, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+13, 1735, 0, -13192.1, -579.183, 12.9627, 1.83259, 0, 0, 0.793353, 0.608762, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+14, 1735, 0, -13168.8, -480.454, 6.74536, 2.60054, 0, 0, 0.96363, 0.267241, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale - Crystalvein Mine', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale - Crystalvein Mine', 0, 0, 0, 10),
(@PTEMPLATE+2, 1, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale - Crystalvein Mine', 0, 0, 0, 10),
(@PTEMPLATE+3, 1, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale - Crystalvein Mine', 0, 0, 0, 10),
(@PTEMPLATE+4, 1, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale - Crystalvein Mine', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale - Crystalvein Mine', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 5, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale - Crystalvein Mine', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+2, 5, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale - Crystalvein Mine', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+3, 5, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale - Crystalvein Mine', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+4, 5, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale - Crystalvein Mine', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale - Crystalvein Mine', 0, 0, 10),
(@GGUID+6, @PTEMPLATE+1, 5, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale - Crystalvein Mine', 0, 0, 10),
(@GGUID+7, @PTEMPLATE+2, 5, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale - Crystalvein Mine', 0, 0, 10),
(@GGUID+8, @PTEMPLATE+3, 5, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale - Crystalvein Mine', 0, 0, 10),
(@GGUID+9, @PTEMPLATE+4, 5, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale - Crystalvein Mine', 0, 0, 10),
(@GGUID+10, @PTEMPLATE+0, 90, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale - Crystalvein Mine', 0, 0, 10),
(@GGUID+11, @PTEMPLATE+1, 90, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale - Crystalvein Mine', 0, 0, 10),
(@GGUID+12, @PTEMPLATE+2, 90, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale - Crystalvein Mine', 0, 0, 10),
(@GGUID+13, @PTEMPLATE+3, 90, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale - Crystalvein Mine', 0, 0, 10),
(@GGUID+14, @PTEMPLATE+4, 90, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale - Crystalvein Mine', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 8142, 0, 'Stranglethorn Vale - Crystalvein Mine - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+1, 8142, 0, 'Stranglethorn Vale - Crystalvein Mine - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+2, 8142, 0, 'Stranglethorn Vale - Crystalvein Mine - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+3, 8142, 0, 'Stranglethorn Vale - Crystalvein Mine - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+4, 8142, 0, 'Stranglethorn Vale - Crystalvein Mine - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Thousand Needles
SET @GGUID = 3724;
SET @PTEMPLATE = 2376;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1733, 1, -6614.61, -3936.68, -52.4815, 4.79966, 0, 0, -0.67559, 0.737278, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1733, 1, -5796.34, -4346.9, -55.591, 2.60054, 0, 0, 0.96363, 0.267241, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1733, 1, -5090.45, -899.016, -3.68752, 6.00393, 0, 0, -0.139173, 0.990268, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1733, 1, -4936.29, -967.483, -3.93577, 3.3685, 0, 0, -0.993571, 0.113208, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 1734, 1, -6614.61, -3936.68, -52.4815, 4.79966, 0, 0, -0.67559, 0.737278, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 1734, 1, -5796.34, -4346.9, -55.591, 2.60054, 0, 0, 0.96363, 0.267241, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+6, 1734, 1, -5090.45, -899.016, -3.68752, 6.00393, 0, 0, -0.139173, 0.990268, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+7, 1734, 1, -4936.29, -967.483, -3.93577, 3.3685, 0, 0, -0.993571, 0.113208, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+8, 1735, 1, -6614.61, -3936.68, -52.4815, 4.79966, 0, 0, -0.67559, 0.737278, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+9, 1735, 1, -5796.34, -4346.9, -55.591, 2.60054, 0, 0, 0.96363, 0.267241, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+10, 1735, 1, -5090.45, -899.016, -3.68752, 6.00393, 0, 0, -0.139173, 0.990268, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+11, 1735, 1, -4936.29, -967.483, -3.93577, 3.3685, 0, 0, -0.993571, 0.113208, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 0, 0, 0, 10),
(@PTEMPLATE+2, 1, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 0, 0, 0, 10),
(@PTEMPLATE+3, 1, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 5, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+2, 5, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+3, 5, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+1, 5, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 0, 0, 10),
(@GGUID+6, @PTEMPLATE+2, 5, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 0, 0, 10),
(@GGUID+7, @PTEMPLATE+3, 5, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 0, 0, 10),
(@GGUID+8, @PTEMPLATE+0, 90, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 0, 0, 10),
(@GGUID+9, @PTEMPLATE+1, 90, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 0, 0, 10),
(@GGUID+10, @PTEMPLATE+2, 90, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 0, 0, 10),
(@GGUID+11, @PTEMPLATE+3, 90, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 329, 0, 'Thousand Needles - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+1, 329, 0, 'Thousand Needles - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+2, 329, 0, 'Thousand Needles - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+3, 329, 0, 'Thousand Needles - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Mosh'Ogg Ogre Mound
SET @GGUID = 3394;
SET @PTEMPLATE = 2471;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1733, 0, -12363.8, -1154.71, 1.2719, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1733, 0, -12337.2, -987.296, 14.0245, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1733, 0, -12334.3, -1063.92, 5.9181, 0.90757, 0, 0, 0.438371, 0.898794, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1734, 0, -12363.8, -1154.71, 1.2719, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 1734, 0, -12337.2, -987.296, 14.0245, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 1734, 0, -12334.3, -1063.92, 5.9181, 0.90757, 0, 0, 0.438371, 0.898794, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+6, 1735, 0, -12363.8, -1154.71, 1.2719, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+7, 1735, 0, -12337.2, -987.296, 14.0245, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+8, 1735, 0, -12334.3, -1063.92, 5.9181, 0.90757, 0, 0, 0.438371, 0.898794, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale - Mosh\'Ogg Ogre Mound', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale - Mosh\'Ogg Ogre Mound', 0, 0, 0, 10),
(@PTEMPLATE+2, 1, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale - Mosh\'Ogg Ogre Mound', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale - Mosh\'Ogg Ogre Mound', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 5, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale - Mosh\'Ogg Ogre Mound', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+2, 5, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale - Mosh\'Ogg Ogre Mound', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale - Mosh\'Ogg Ogre Mound', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+1, 5, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale - Mosh\'Ogg Ogre Mound', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+2, 5, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale - Mosh\'Ogg Ogre Mound', 0, 0, 10),
(@GGUID+6, @PTEMPLATE+0, 90, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale - Mosh\'Ogg Ogre Mound', 0, 0, 10),
(@GGUID+7, @PTEMPLATE+1, 90, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale - Mosh\'Ogg Ogre Mound', 0, 0, 10),
(@GGUID+8, @PTEMPLATE+2, 90, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale - Mosh\'Ogg Ogre Mound', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 8143, 0, 'Stranglethorn Vale - Mosh\'Ogg Ogre Mound - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+1, 8143, 0, 'Stranglethorn Vale - Mosh\'Ogg Ogre Mound - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+2, 8143, 0, 'Stranglethorn Vale - Mosh\'Ogg Ogre Mound - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Demon Fall
SET @GGUID = 3442;
SET @PTEMPLATE = 2580;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1733, 1, 1590.98, -2823.13, 186.157, 1.22173, 0, 0, 0.573576, 0.819152, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1733, 1, 1638.53, -3202.53, 147.499, 3.50812, 0, 0, -0.983254, 0.182238, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1733, 1, 1728.7, -3189.13, 116.334, 6.19092, 0, 0, -0.0436192, 0.999048, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1734, 1, 1590.98, -2823.13, 186.157, 1.22173, 0, 0, 0.573576, 0.819152, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 1734, 1, 1638.53, -3202.53, 147.499, 3.50812, 0, 0, -0.983254, 0.182238, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 1734, 1, 1728.7, -3189.13, 116.334, 6.19092, 0, 0, -0.0436192, 0.999048, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+6, 1735, 1, 1590.98, -2823.13, 186.157, 1.22173, 0, 0, 0.573576, 0.819152, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+7, 1735, 1, 1638.53, -3202.53, 147.499, 3.50812, 0, 0, -0.983254, 0.182238, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+8, 1735, 1, 1728.7, -3189.13, 116.334, 6.19092, 0, 0, -0.0436192, 0.999048, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale - Demon Fall Canyon', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale - Demon Fall Canyon', 0, 0, 0, 10),
(@PTEMPLATE+2, 1, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale - Demon Fall Canyon', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale - Demon Fall Canyon', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 5, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale - Demon Fall Canyon', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+2, 5, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale - Demon Fall Canyon', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale - Demon Fall Canyon', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+1, 5, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale - Demon Fall Canyon', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+2, 5, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale - Demon Fall Canyon', 0, 0, 10),
(@GGUID+6, @PTEMPLATE+0, 90, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale - Demon Fall Canyon', 0, 0, 10),
(@GGUID+7, @PTEMPLATE+1, 90, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale - Demon Fall Canyon', 0, 0, 10),
(@GGUID+8, @PTEMPLATE+2, 90, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale - Demon Fall Canyon', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 265, 0, 'Ashenvale - Demon Fall Canyon - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+1, 265, 0, 'Ashenvale - Demon Fall Canyon - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+2, 265, 0, 'Ashenvale - Demon Fall Canyon - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Witherbark
SET @GGUID = 3406;
SET @PTEMPLATE = 2227;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1733, 0, -2112.94, -3375.85, 62.0390, 3.7001, 0, 0, -0.961261, 0.27564, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1733, 0, -1935.68, -3318.48, 60.6718, 1.90241, 0, 0, 0.814116, 0.580703, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1734, 0, -2112.94, -3375.85, 62.0390, 3.7001, 0, 0, -0.961261, 0.27564, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1734, 0, -1935.68, -3318.48, 60.6718, 1.90241, 0, 0, 0.814116, 0.580703, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 1735, 0, -2112.94, -3375.85, 62.0390, 3.7001, 0, 0, -0.961261, 0.27564, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 1735, 0, -1935.68, -3318.48, 60.6718, 1.90241, 0, 0, 0.814116, 0.580703, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands - Witherbark Village', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands - Witherbark Village', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands - Witherbark Village', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 5, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands - Witherbark Village', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands - Witherbark Village', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+1, 5, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands - Witherbark Village', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+0, 90, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands - Witherbark Village', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+1, 90, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands - Witherbark Village', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 152, 0, 'Arathi Highlands - Witherbark Village - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+1, 152, 0, 'Arathi Highlands - Witherbark Village - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Drywhisker
SET @GGUID = 3418;
SET @PTEMPLATE = 2524;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1733, 0, -929.411, -3839.07, 147.576, 4.36332, 0, 0, -0.819152, 0.573577, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1733, 0, -877.246, -3966.93, 135.393, 1.0821, 0, 0, 0.515038, 0.857168, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1734, 0, -929.411, -3839.07, 147.576, 4.36332, 0, 0, -0.819152, 0.573577, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1734, 0, -877.246, -3966.93, 135.393, 1.0821, 0, 0, 0.515038, 0.857168, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 1735, 0, -929.411, -3839.07, 147.576, 4.36332, 0, 0, -0.819152, 0.573577, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 1735, 0, -877.246, -3966.93, 135.393, 1.0821, 0, 0, 0.515038, 0.857168, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands - Drywhisker Gorge', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands - Drywhisker Gorge', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands - Drywhisker Gorge', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 5, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands - Drywhisker Gorge', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands - Drywhisker Gorge', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+1, 5, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands - Drywhisker Gorge', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+0, 90, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands - Drywhisker Gorge', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+1, 90, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands - Drywhisker Gorge', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 146, 0, 'Arathi Highlands - Drywhisker Gorge - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+1, 146, 0, 'Arathi Highlands - Drywhisker Gorge - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Uldaman
SET @GGUID = 3471;
SET @PTEMPLATE = 2599;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1733, 70, -325.675, 87.1244, -51.0646, 1.13446, 0, 0, 0.537299, 0.843392, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1733, 70, -8.93542, 375.078, -43.5068, 4.86947, 0, 0, -0.649447, 0.760406, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1734, 70, -325.675, 87.1244, -51.0646, 1.13446, 0, 0, 0.537299, 0.843392, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1734, 70, -8.93542, 375.078, -43.5068, 4.86947, 0, 0, -0.649447, 0.760406, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 1735, 70, -325.675, 87.1244, -51.0646, 1.13446, 0, 0, 0.537299, 0.843392, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 1735, 70, -8.93542, 375.078, -43.5068, 4.86947, 0, 0, -0.649447, 0.760406, 604800, 604800, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Silver Vein / Gold Vein / Iron Deposit - Uldaman', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit - Uldaman', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Uldaman', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 5, 'Silver Vein / Gold Vein / Iron Deposit - Uldaman', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Uldaman', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+1, 5, 'Silver Vein / Gold Vein / Iron Deposit - Uldaman', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+0, 90, 'Silver Vein / Gold Vein / Iron Deposit - Uldaman', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+1, 90, 'Silver Vein / Gold Vein / Iron Deposit - Uldaman', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 3008, 0, 'Uldaman - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+1, 3008, 0, 'Uldaman - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Vul'Gol
SET @GGUID = 3511;
SET @PTEMPLATE = 2601;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1733, 0, -11221.6, -146.11, 10.6937, -1.01229, 0, 0, -0.484809, 0.87462, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1733, 0, -11163.5, -204.443, 12.3621, 1.09906, 0, 0, 0.522498, 0.85264, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1734, 0, -11221.6, -146.11, 10.6937, -1.01229, 0, 0, -0.484809, 0.87462, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1734, 0, -11163.5, -204.443, 12.3621, 1.09906, 0, 0, 0.522498, 0.85264, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 1735, 0, -11221.6, -146.11, 10.6937, -1.01229, 0, 0, -0.484809, 0.87462, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 1735, 0, -11163.5, -204.443, 12.3621, 1.09906, 0, 0, 0.522498, 0.85264, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Silver Vein / Gold Vein / Iron Deposit - Duskwood - Vul\'Gol Ogre Mound', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit - Duskwood - Vul\'Gol Ogre Mound', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Duskwood - Vul\'Gol Ogre Mound', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 5, 'Silver Vein / Gold Vein / Iron Deposit - Duskwood - Vul\'Gol Ogre Mound', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Duskwood - Vul\'Gol Ogre Mound', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+1, 5, 'Silver Vein / Gold Vein / Iron Deposit - Duskwood - Vul\'Gol Ogre Mound', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+0, 90, 'Silver Vein / Gold Vein / Iron Deposit - Duskwood - Vul\'Gol Ogre Mound', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+1, 90, 'Silver Vein / Gold Vein / Iron Deposit - Duskwood - Vul\'Gol Ogre Mound', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 266, 0, 'Duskwood - Vul\'Gol Ogre Mound - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+1, 266, 0, 'Duskwood - Vul\'Gol Ogre Mound - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Slaughter
SET @GGUID = 3519;
SET @PTEMPLATE = 2776;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1733, 0, 860.57, -579.18, 143.890, 1.97222, 0, 0, 0.833885, 0.551938, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1733, 0, 901.193, -540.490, 145.888, 3.35105, 0, 0, -0.994521, 0.104536, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1734, 0, 860.57, -579.18, 143.890, 1.97222, 0, 0, 0.833885, 0.551938, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1734, 0, 901.193, -540.490, 145.888, 3.35105, 0, 0, -0.994521, 0.104536, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 1735, 0, 860.57, -579.18, 143.890, 1.97222, 0, 0, 0.833885, 0.551938, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 1735, 0, 901.193, -540.490, 145.888, 3.35105, 0, 0, -0.994521, 0.104536, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Silver Vein / Gold Vein / Iron Deposit - Alterac Mountains - Slaughter Hollow', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit - Alterac Mountains - Slaughter Hollow', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Alterac Mountains - Slaughter Hollow', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 5, 'Silver Vein / Gold Vein / Iron Deposit - Alterac Mountains - Slaughter Hollow', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Alterac Mountains - Slaughter Hollow', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+1, 5, 'Silver Vein / Gold Vein / Iron Deposit - Alterac Mountains - Slaughter Hollow', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+0, 90, 'Silver Vein / Gold Vein / Iron Deposit - Alterac Mountains - Slaughter Hollow', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+1, 90, 'Silver Vein / Gold Vein / Iron Deposit - Alterac Mountains - Slaughter Hollow', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 8106, 0, 'Alterac Mountains - Slaughter Hollow - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+1, 8106, 0, 'Alterac Mountains - Slaughter Hollow - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Rolands Doom
SET @GGUID = 2392;
SET @PTEMPLATE = 1316;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1733, 0, -11123.5, -1165.56, 44.413, 5.18363, 0, 0, -0.522498, 0.85264, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1734, 0, -11123.5, -1165.56, 44.413, 5.18363, 0, 0, -0.522498, 0.85264, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1735, 0, -11123.5, -1165.56, 44.413, 5.18363, 0, 0, -0.522498, 0.85264, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Silver Vein / Gold Vein / Iron Deposit - Duskwood - Roland\'s Doom', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Duskwood - Roland\'s Doom', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Duskwood - Roland\'s Doom', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 90, 'Silver Vein / Gold Vein / Iron Deposit - Duskwood - Roland\'s Doom', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 267, 0, 'Duskwood - Roland\'s Doom - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Duskwood
SET @GGUID = 2444;
SET @PTEMPLATE = 1319;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1733, 0, -10486.4, -770.31, 62.5892, 1.09906, 0, 0, 0.522498, 0.85264, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1734, 0, -10486.4, -770.31, 62.5892, 1.09906, 0, 0, 0.522498, 0.85264, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1735, 0, -10486.4, -770.31, 62.5892, 1.09906, 0, 0, 0.522498, 0.85264, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Silver Vein / Gold Vein / Iron Deposit - Duskwood', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Duskwood', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Duskwood', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 90, 'Silver Vein / Gold Vein / Iron Deposit - Duskwood', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 1120, 0, 'Duskwood - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Ashenvale
SET @GGUID = 2469;
SET @PTEMPLATE = 1329;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1733, 1, 2354.26, -1916, 72.0001, 3.45576, 0, 0, -0.987688, 0.156436, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1734, 1, 2354.26, -1916, 72.0001, 3.45576, 0, 0, -0.987688, 0.156436, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1735, 1, 2354.26, -1916, 72.0001, 3.45576, 0, 0, -0.987688, 0.156436, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 90, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 1351, 0, 'Ashenvale - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Bloodfen
SET @GGUID = 2486;
SET @PTEMPLATE = 1330;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1733, 1, -4327.62, -2639.29, 39.3805, 0.279252, 0, 0, 0.139173, 0.990268, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1734, 1, -4327.62, -2639.29, 39.3805, 0.279252, 0, 0, 0.139173, 0.990268, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1735, 1, -4327.62, -2639.29, 39.3805, 0.279252, 0, 0, 0.139173, 0.990268, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh - Bloodfen Burrow', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh - Bloodfen Burrow', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh - Bloodfen Burrow', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 90, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh - Bloodfen Burrow', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 8103, 0, 'Dustwallow Marsh - Bloodfen Burrow - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Darkmist
SET @GGUID = 2506;
SET @PTEMPLATE = 1332;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1733, 1, -2810.3, -2682.02, 34.8281, 3.56047, 0, 0, -0.978148, 0.207912, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1734, 1, -2810.3, -2682.02, 34.8281, 3.56047, 0, 0, -0.978148, 0.207912, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1735, 1, -2810.3, -2682.02, 34.8281, 3.56047, 0, 0, -0.978148, 0.207912, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh - Darkmist Cavern', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh - Darkmist Cavern', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh - Darkmist Cavern', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 90, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh - Darkmist Cavern', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 8102, 0, 'Dustwallow Marsh - Darkmist Cavern - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Roguefeather
SET @GGUID = 2577;
SET @PTEMPLATE = 1333;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1733, 1, -5508.33, -1564.48, 27.1426, 2.25147, 0, 0, 0.902585, 0.430512, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1734, 1, -5508.33, -1564.48, 27.1426, 2.25147, 0, 0, 0.902585, 0.430512, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1735, 1, -5508.33, -1564.48, 27.1426, 2.25147, 0, 0, 0.902585, 0.430512, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles - Roguefeather Den', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles - Roguefeather Den', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles - Roguefeather Den', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 90, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles - Roguefeather Den', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 396, 0, 'Thousand Needles - Roguefeather Den - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Crushridge
SET @GGUID = 2609;
SET @PTEMPLATE = 1337;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1733, 0, 683.309, -615.361, 164.814, 0.925024, 0, 0, 0.446198, 0.894935, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1734, 0, 683.309, -615.361, 164.814, 0.925024, 0, 0, 0.446198, 0.894935, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1735, 0, 683.309, -615.361, 164.814, 0.925024, 0, 0, 0.446198, 0.894935, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Silver Vein / Gold Vein / Iron Deposit - Alterac Mountains - Crushridge Hold', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Alterac Mountains - Crushridge Hold', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Alterac Mountains - Crushridge Hold', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 90, 'Silver Vein / Gold Vein / Iron Deposit - Alterac Mountains - Crushridge Hold', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 8107, 0, 'Alterac Mountains - Crushridge Hold - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Hillsbrad
SET @GGUID = 2618;
SET @PTEMPLATE = 1346;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1733, 0, -438.232, -1829.24, 80.8482, 3.4034, 0, 0, -0.991445, 0.130528, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1734, 0, -438.232, -1829.24, 80.8482, 3.4034, 0, 0, -0.991445, 0.130528, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1735, 0, -438.232, -1829.24, 80.8482, 3.4034, 0, 0, -0.991445, 0.130528, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 90, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 1274, 0, 'Hillsbrad Foothills - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Should Be Iron
UPDATE `gameobject` SET `id`=1733 WHERE  `guid`=100500;
UPDATE `gameobject` SET `id`=1735 WHERE  `guid`=100494;
UPDATE `pool_template` SET `description`='Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill' WHERE  `entry`=7285 AND `patch_min`=0 AND `patch_max`=10;
UPDATE `pool_gameobject` SET `description`='Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill' WHERE  `guid`=100488;
UPDATE `pool_gameobject` SET `description`='Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill' WHERE  `guid`=100494;
UPDATE `pool_gameobject` SET `description`='Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill' WHERE  `guid`=100500;
UPDATE `pool_pool` SET `description`='Hillsbrad Foothills - Darrow Hill - Silver Vein / Gold Vein / Iron Deposit' WHERE  `pool_id`=7285;

UPDATE `gameobject` SET `id`=1733 WHERE  `guid`=85133;
UPDATE `gameobject` SET `id`=1735 WHERE  `guid`=85132;
UPDATE `pool_template` SET `description`='Silver Vein / Gold Vein / Iron Deposit - Alterac Mountains' WHERE  `entry`=5020 AND `patch_min`=0 AND `patch_max`=10;
UPDATE `pool_gameobject` SET `description`='Silver Vein / Gold Vein / Iron Deposit - Alterac Mountains' WHERE  `guid`=85132;
UPDATE `pool_gameobject` SET `description`='Silver Vein / Gold Vein / Iron Deposit - Alterac Mountains' WHERE  `guid`=85133;
UPDATE `pool_gameobject` SET `description`='Silver Vein / Gold Vein / Iron Deposit - Alterac Mountains' WHERE  `guid`=427054;
UPDATE `pool_pool` SET `mother_pool`=9900, `description`='Alterac Mountains - Silver Vein / Gold Vein / Iron Deposit' WHERE  `pool_id`=5020;

UPDATE `pool_pool` SET `description` = 'Dustwallow Marsh - Tin Vein / Silver Vein' WHERE `pool_id` = 10019;
UPDATE `pool_gameobject` SET `description`='Tin Vein / Silver Vein - Dustwallow Marsh' WHERE `guid` = 100528;
UPDATE `pool_gameobject` SET `description`='Tin Vein / Silver Vein - Dustwallow Marsh' WHERE `guid` = 100529;

UPDATE `gameobject` SET `spawntimesecsmin` = 600, `spawntimesecsmax` = 2700 WHERE `id` IN (1735, 73939) AND `map` IN (0, 1);

DELETE FROM `gameobject` WHERE `guid` IN (7252, 7264, 7276);
DELETE FROM `pool_template` WHERE `entry` = 2561;
DELETE FROM `pool_gameobject` WHERE  `guid` IN (7252, 7264, 7276);
DELETE FROM `pool_pool` WHERE `pool_id` = 2561;

DELETE FROM `gameobject` WHERE `guid` IN (7253, 7265, 7277);
DELETE FROM `pool_template` WHERE `entry` = 2562;
DELETE FROM `pool_gameobject` WHERE  `guid` IN (7253, 7265, 7277);
DELETE FROM `pool_pool` WHERE `pool_id` = 2562;

DELETE FROM `gameobject` WHERE `guid` IN (6137, 6144, 6151);
DELETE FROM `pool_template` WHERE `entry` = 2594;
DELETE FROM `pool_gameobject` WHERE  `guid` IN (6137, 6144, 6151);
DELETE FROM `pool_pool` WHERE `pool_id` = 2594;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
