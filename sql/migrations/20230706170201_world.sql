DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230706170201');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230706170201');
-- Add your query below.


SET @OGUID = 31253;
SET @PTEMPLATE = 192;

-- 44 Redridge Mountains 3659 / 3695 / Barrel of Melon Juice / Food Crate
DELETE FROM `pool_template` WHERE `entry` IN (SELECT `pool_entry` FROM `pool_gameobject` WHERE `guid` IN (29239, 20788, 20617, 20501, 20433, 18604, 18602, 18587, 18580, 42624, 42623, 42622));
DELETE FROM `gameobject` WHERE `guid` IN (29239, 20788, 20617, 20501, 20433, 18604, 18602, 18587, 18580, 42624, 42623, 42622);
DELETE FROM `pool_gameobject` WHERE `guid` IN (29239, 20788, 20617, 20501, 20433, 18604, 18602, 18587, 18580, 42624, 42623, 42622);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 3659, 0, -8680.4, -2357.14, 159.703, -1.3439, 0, 0, 0.622515, -0.782608, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 3659, 0, -9250.18, -3211.8, 100.666, 2.07694, 0, 0, 0.861629, 0.507538, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 3659, 0, -9271.67, -3290.89, 115.668, 1.25664, 0, 0, 0.587785, 0.809017, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 3659, 0, -9710.18, -3166.36, 58.6868, -1.6057, 0, 0, 0.71934, -0.694658, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 3659, 0, -9195.45, -2873.63, 113.036, -0.436333, 0, 0, 0.21644, -0.976296, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 3659, 0, -9371.79, -3082.53, 140.675, 3.01942, 0, 0, 0.998135, 0.061049, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 3659, 0, -9818.14, -3268.34, 62.0597, 3.26377, 0, 0, -0.998135, 0.0610518, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 3659, 0, -9531.23, -3258.96, 48.974, 2.67035, 0, 0, 0.972369, 0.233448, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 3659, 0, -9439.26, -3081.96, 136.687, 1.85005, 0, 0, 0.798635, 0.601815, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 3659, 0, -9416.04, -3395.21, 89.0458, 0.767944, 0, 0, 0.374606, 0.927184, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 3659, 0, -9410.7, -3085.99, 139.773, 4.95674, 0, 0, -0.615661, 0.788011, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 3659, 0, -9370.27, -3171.53, 83.5489, 4.92183, 0, 0, -0.62932, 0.777146, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 3659, 0, -9279.15, -2940.47, 128.761, 1.8675, 0, 0, 0.803857, 0.594823, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 3659, 0, -9227.43, -3294.38, 100.555, 6.07375, 0, 0, -0.104528, 0.994522, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 3659, 0, -9115.65, -3230.97, 100.572, 0.820303, 0, 0, 0.398748, 0.91706, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 3659, 0, -8730.53, -2336.46, 155.917, 4.97419, 0, 0, -0.608761, 0.793354, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 3659, 0, -9352.76, -3064.98, 136.687, 3.54302, 0, 0, -0.979924, 0.19937, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 3659, 0, -8818.47, -2170.91, 150.485, 2.00713, 0, 0, 0.843391, 0.5373, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 3695, 0, -8680.4, -2357.14, 159.703, -1.3439, 0, 0, 0.622515, -0.782608, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 3695, 0, -9250.18, -3211.8, 100.666, 2.07694, 0, 0, 0.861629, 0.507538, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 3695, 0, -9271.67, -3290.89, 115.668, 1.25664, 0, 0, 0.587785, 0.809017, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 3695, 0, -9710.18, -3166.36, 58.6868, -1.6057, 0, 0, 0.71934, -0.694658, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 3695, 0, -9195.45, -2873.63, 113.036, -0.436333, 0, 0, 0.21644, -0.976296, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 3695, 0, -9371.79, -3082.53, 140.675, 3.01942, 0, 0, 0.998135, 0.061049, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 3695, 0, -9818.14, -3268.34, 62.0597, 3.26377, 0, 0, -0.998135, 0.0610518, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 3695, 0, -9531.23, -3258.96, 48.974, 2.67035, 0, 0, 0.972369, 0.233448, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 3695, 0, -9439.26, -3081.96, 136.687, 1.85005, 0, 0, 0.798635, 0.601815, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 3695, 0, -9416.04, -3395.21, 89.0458, 0.767944, 0, 0, 0.374606, 0.927184, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+29, 3695, 0, -9410.7, -3085.99, 139.773, 4.95674, 0, 0, -0.615661, 0.788011, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+30, 3695, 0, -9370.27, -3171.53, 83.5489, 4.92183, 0, 0, -0.62932, 0.777146, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+31, 3695, 0, -9279.15, -2940.47, 128.761, 1.8675, 0, 0, 0.803857, 0.594823, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+32, 3695, 0, -9227.43, -3294.38, 100.555, 6.07375, 0, 0, -0.104528, 0.994522, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+33, 3695, 0, -9115.65, -3230.97, 100.572, 0.820303, 0, 0, 0.398748, 0.91706, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+34, 3695, 0, -8730.53, -2336.46, 155.917, 4.97419, 0, 0, -0.608761, 0.793354, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+35, 3695, 0, -9352.76, -3064.98, 136.687, 3.54302, 0, 0, -0.979924, 0.19937, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+36, 3695, 0, -8818.47, -2170.91, 150.485, 2.00713, 0, 0, 0.843391, 0.5373, 180, 180, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@PTEMPLATE+2, 1, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@PTEMPLATE+3, 1, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@PTEMPLATE+4, 1, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@PTEMPLATE+5, 1, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@PTEMPLATE+6, 1, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@PTEMPLATE+7, 1, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@PTEMPLATE+8, 1, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@PTEMPLATE+9, 1, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@PTEMPLATE+10, 1, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@PTEMPLATE+11, 1, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@PTEMPLATE+12, 1, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@PTEMPLATE+13, 1, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@PTEMPLATE+14, 1, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@PTEMPLATE+15, 1, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@PTEMPLATE+16, 1, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@PTEMPLATE+17, 1, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@PTEMPLATE+18, 1, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@OGUID+2, @PTEMPLATE+2, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@OGUID+3, @PTEMPLATE+3, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@OGUID+4, @PTEMPLATE+4, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@OGUID+5, @PTEMPLATE+5, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@OGUID+6, @PTEMPLATE+6, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@OGUID+7, @PTEMPLATE+7, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@OGUID+8, @PTEMPLATE+8, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@OGUID+9, @PTEMPLATE+9, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@OGUID+10, @PTEMPLATE+10, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@OGUID+11, @PTEMPLATE+11, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@OGUID+12, @PTEMPLATE+12, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@OGUID+13, @PTEMPLATE+13, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@OGUID+14, @PTEMPLATE+14, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@OGUID+15, @PTEMPLATE+15, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@OGUID+16, @PTEMPLATE+16, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@OGUID+17, @PTEMPLATE+17, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@OGUID+18, @PTEMPLATE+18, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@OGUID+19, @PTEMPLATE+1, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@OGUID+20, @PTEMPLATE+2, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@OGUID+21, @PTEMPLATE+3, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@OGUID+22, @PTEMPLATE+4, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@OGUID+23, @PTEMPLATE+5, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@OGUID+24, @PTEMPLATE+6, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@OGUID+25, @PTEMPLATE+7, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@OGUID+26, @PTEMPLATE+8, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@OGUID+27, @PTEMPLATE+9, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@OGUID+28, @PTEMPLATE+10, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@OGUID+29, @PTEMPLATE+11, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@OGUID+30, @PTEMPLATE+12, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@OGUID+31, @PTEMPLATE+13, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@OGUID+32, @PTEMPLATE+14, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@OGUID+33, @PTEMPLATE+15, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@OGUID+34, @PTEMPLATE+16, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@OGUID+35, @PTEMPLATE+17, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10),
(@OGUID+36, @PTEMPLATE+18, 'Barrel of Melon Juice / Food Crate - Redridge', 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+19, 8, 'Redridge - Barrel of Melon Juice / Food Crate (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+19, 0, 'Barrel of Melon Juice / Food Crate - Redridge', 0),
(@PTEMPLATE+2, @PTEMPLATE+19, 0, 'Barrel of Melon Juice / Food Crate - Redridge', 0),
(@PTEMPLATE+3, @PTEMPLATE+19, 0, 'Barrel of Melon Juice / Food Crate - Redridge', 0),
(@PTEMPLATE+4, @PTEMPLATE+19, 0, 'Barrel of Melon Juice / Food Crate - Redridge', 0),
(@PTEMPLATE+5, @PTEMPLATE+19, 0, 'Barrel of Melon Juice / Food Crate - Redridge', 0),
(@PTEMPLATE+6, @PTEMPLATE+19, 0, 'Barrel of Melon Juice / Food Crate - Redridge', 0),
(@PTEMPLATE+7, @PTEMPLATE+19, 0, 'Barrel of Melon Juice / Food Crate - Redridge', 0),
(@PTEMPLATE+8, @PTEMPLATE+19, 0, 'Barrel of Melon Juice / Food Crate - Redridge', 0),
(@PTEMPLATE+9, @PTEMPLATE+19, 0, 'Barrel of Melon Juice / Food Crate - Redridge', 0),
(@PTEMPLATE+10, @PTEMPLATE+19, 0, 'Barrel of Melon Juice / Food Crate - Redridge', 0),
(@PTEMPLATE+11, @PTEMPLATE+19, 0, 'Barrel of Melon Juice / Food Crate - Redridge', 0),
(@PTEMPLATE+12, @PTEMPLATE+19, 0, 'Barrel of Melon Juice / Food Crate - Redridge', 0),
(@PTEMPLATE+13, @PTEMPLATE+19, 0, 'Barrel of Melon Juice / Food Crate - Redridge', 0),
(@PTEMPLATE+14, @PTEMPLATE+19, 0, 'Barrel of Melon Juice / Food Crate - Redridge', 0),
(@PTEMPLATE+15, @PTEMPLATE+19, 0, 'Barrel of Melon Juice / Food Crate - Redridge', 0),
(@PTEMPLATE+16, @PTEMPLATE+19, 0, 'Barrel of Melon Juice / Food Crate - Redridge', 0),
(@PTEMPLATE+17, @PTEMPLATE+19, 0, 'Barrel of Melon Juice / Food Crate - Redridge', 0),
(@PTEMPLATE+18, @PTEMPLATE+19, 0, 'Barrel of Melon Juice / Food Crate - Redridge', 0);

SET @OGUID = 31473;
SET @PTEMPLATE = 2704;

-- 3662 / 3705 / Food Crate / Barrel of Milk

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 3662, 0, -8968.61, -2079.53, 132.445, -1.85005, 0, 0, 0.798635, -0.601815, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 3662, 0, -9797.5, -2243.93, 69.962, 0.855211, 0, 0, 0.414693, 0.909961, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 3662, 0, -9776.85, -2263.73, 59.2903, 2.21657, 0, 0, 0.894934, 0.446199, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 3662, 0, -9507.26, -1901.14, 79.1296, 0.383971, 0, 0, 0.190808, 0.981627, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 3662, 0, -9485.74, -1939.03, 78.7392, 2.77507, 0, 0, 0.983254, 0.182238, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 3662, 0, -9462.39, -1905.32, 82.3743, 5.95157, 0, 0, -0.165047, 0.986286, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 3662, 0, -9440.73, -2230.18, 69.5418, 1.8675, 0, 0, 0.803857, 0.594823, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 3662, 0, -9337.97, -2296.93, 73.2459, 1.83259, 0, 0, 0.793353, 0.608762, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 3662, 0, -9234.33, -2040.43, 78.1511, 6.05629, 0, 0, -0.113203, 0.993572, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 3662, 0, -9218.39, -2057.53, 78.0984, 1.309, 0, 0, 0.608761, 0.793354, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 3662, 0, -9190.77, -2156.29, 57.1861, 3.14159, 0, 0, -1, 0, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 3662, 0, -9177.17, -2089.26, 88.9374, 0.244346, 0, 0, 0.121869, 0.992546, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 3662, 0, -9107.94, -2039.61, 128.651, 4.45059, 0, 0, -0.793353, 0.608762, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 3662, 0, -9039.46, -2416.55, 128.855, 2.37364, 0, 0, 0.927183, 0.374608, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 3662, 0, -8990.36, -2180.67, 132.771, 3.24635, 0, 0, -0.998629, 0.0523532, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 3662, 0, -8934, -2318.61, 132.537, 3.08918, 0, 0, 0.999657, 0.0262016, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 3662, 0, -8894.44, -2176.12, 132.722, 3.01941, 0, 0, 0.998135, 0.0610518, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 3662, 0, -9794.08, -2218.39, 58.6209, 1.51844, 0, 0, 0.688354, 0.725374, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 3705, 0, -8968.61, -2079.53, 132.445, -1.85005, 0, 0, 0.798635, -0.601815, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 3705, 0, -9797.5, -2243.93, 69.962, 0.855211, 0, 0, 0.414693, 0.909961, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 3705, 0, -9776.85, -2263.73, 59.2903, 2.21657, 0, 0, 0.894934, 0.446199, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 3705, 0, -9507.26, -1901.14, 79.1296, 0.383971, 0, 0, 0.190808, 0.981627, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 3705, 0, -9485.74, -1939.03, 78.7392, 2.77507, 0, 0, 0.983254, 0.182238, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 3705, 0, -9462.39, -1905.32, 82.3743, 5.95157, 0, 0, -0.165047, 0.986286, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 3705, 0, -9440.73, -2230.18, 69.5418, 1.8675, 0, 0, 0.803857, 0.594823, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 3705, 0, -9337.97, -2296.93, 73.2459, 1.83259, 0, 0, 0.793353, 0.608762, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 3705, 0, -9234.33, -2040.43, 78.1511, 6.05629, 0, 0, -0.113203, 0.993572, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 3705, 0, -9218.39, -2057.53, 78.0984, 1.309, 0, 0, 0.608761, 0.793354, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+29, 3705, 0, -9190.77, -2156.29, 57.1861, 3.14159, 0, 0, -1, 0, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+30, 3705, 0, -9177.17, -2089.26, 88.9374, 0.244346, 0, 0, 0.121869, 0.992546, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+31, 3705, 0, -9107.94, -2039.61, 128.651, 4.45059, 0, 0, -0.793353, 0.608762, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+32, 3705, 0, -9039.46, -2416.55, 128.855, 2.37364, 0, 0, 0.927183, 0.374608, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+33, 3705, 0, -8990.36, -2180.67, 132.771, 3.24635, 0, 0, -0.998629, 0.0523532, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+34, 3705, 0, -8934, -2318.61, 132.537, 3.08918, 0, 0, 0.999657, 0.0262016, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+35, 3705, 0, -8894.44, -2176.12, 132.722, 3.01941, 0, 0, 0.998135, 0.0610518, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+36, 3705, 0, -9794.08, -2218.39, 58.6209, 1.51844, 0, 0, 0.688354, 0.725374, 180, 180, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@PTEMPLATE+2, 1, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@PTEMPLATE+3, 1, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@PTEMPLATE+4, 1, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@PTEMPLATE+5, 1, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@PTEMPLATE+6, 1, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@PTEMPLATE+7, 1, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@PTEMPLATE+8, 1, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@PTEMPLATE+9, 1, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@PTEMPLATE+10, 1, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@PTEMPLATE+11, 1, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@PTEMPLATE+12, 1, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@PTEMPLATE+13, 1, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@PTEMPLATE+14, 1, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@PTEMPLATE+15, 1, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@PTEMPLATE+16, 1, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@PTEMPLATE+17, 1, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@PTEMPLATE+18, 1, 'Food Crate / Barrel of Milk - Redridge', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@OGUID+2, @PTEMPLATE+2, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@OGUID+3, @PTEMPLATE+3, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@OGUID+4, @PTEMPLATE+4, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@OGUID+5, @PTEMPLATE+5, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@OGUID+6, @PTEMPLATE+6, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@OGUID+7, @PTEMPLATE+7, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@OGUID+8, @PTEMPLATE+8, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@OGUID+9, @PTEMPLATE+9, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@OGUID+10, @PTEMPLATE+10, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@OGUID+11, @PTEMPLATE+11, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@OGUID+12, @PTEMPLATE+12, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@OGUID+13, @PTEMPLATE+13, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@OGUID+14, @PTEMPLATE+14, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@OGUID+15, @PTEMPLATE+15, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@OGUID+16, @PTEMPLATE+16, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@OGUID+17, @PTEMPLATE+17, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@OGUID+18, @PTEMPLATE+18, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@OGUID+19, @PTEMPLATE+1, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@OGUID+20, @PTEMPLATE+2, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@OGUID+21, @PTEMPLATE+3, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@OGUID+22, @PTEMPLATE+4, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@OGUID+23, @PTEMPLATE+5, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@OGUID+24, @PTEMPLATE+6, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@OGUID+25, @PTEMPLATE+7, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@OGUID+26, @PTEMPLATE+8, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@OGUID+27, @PTEMPLATE+9, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@OGUID+28, @PTEMPLATE+10, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@OGUID+29, @PTEMPLATE+11, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@OGUID+30, @PTEMPLATE+12, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@OGUID+31, @PTEMPLATE+13, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@OGUID+32, @PTEMPLATE+14, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@OGUID+33, @PTEMPLATE+15, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@OGUID+34, @PTEMPLATE+16, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@OGUID+35, @PTEMPLATE+17, 'Food Crate / Barrel of Milk - Redridge', 0, 10),
(@OGUID+36, @PTEMPLATE+18, 'Food Crate / Barrel of Milk - Redridge', 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+19, 8, 'Redridge - Food Crate / Barrel of Milk (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+19, 0, 'Food Crate / Barrel of Milk - Redridge', 0),
(@PTEMPLATE+2, @PTEMPLATE+19, 0, 'Food Crate / Barrel of Milk - Redridge', 0),
(@PTEMPLATE+3, @PTEMPLATE+19, 0, 'Food Crate / Barrel of Milk - Redridge', 0),
(@PTEMPLATE+4, @PTEMPLATE+19, 0, 'Food Crate / Barrel of Milk - Redridge', 0),
(@PTEMPLATE+5, @PTEMPLATE+19, 0, 'Food Crate / Barrel of Milk - Redridge', 0),
(@PTEMPLATE+6, @PTEMPLATE+19, 0, 'Food Crate / Barrel of Milk - Redridge', 0),
(@PTEMPLATE+7, @PTEMPLATE+19, 0, 'Food Crate / Barrel of Milk - Redridge', 0),
(@PTEMPLATE+8, @PTEMPLATE+19, 0, 'Food Crate / Barrel of Milk - Redridge', 0),
(@PTEMPLATE+9, @PTEMPLATE+19, 0, 'Food Crate / Barrel of Milk - Redridge', 0),
(@PTEMPLATE+10, @PTEMPLATE+19, 0, 'Food Crate / Barrel of Milk - Redridge', 0),
(@PTEMPLATE+11, @PTEMPLATE+19, 0, 'Food Crate / Barrel of Milk - Redridge', 0),
(@PTEMPLATE+12, @PTEMPLATE+19, 0, 'Food Crate / Barrel of Milk - Redridge', 0),
(@PTEMPLATE+13, @PTEMPLATE+19, 0, 'Food Crate / Barrel of Milk - Redridge', 0),
(@PTEMPLATE+14, @PTEMPLATE+19, 0, 'Food Crate / Barrel of Milk - Redridge', 0),
(@PTEMPLATE+15, @PTEMPLATE+19, 0, 'Food Crate / Barrel of Milk - Redridge', 0),
(@PTEMPLATE+16, @PTEMPLATE+19, 0, 'Food Crate / Barrel of Milk - Redridge', 0),
(@PTEMPLATE+17, @PTEMPLATE+19, 0, 'Food Crate / Barrel of Milk - Redridge', 0),
(@PTEMPLATE+18, @PTEMPLATE+19, 0, 'Food Crate / Barrel of Milk - Redridge', 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
