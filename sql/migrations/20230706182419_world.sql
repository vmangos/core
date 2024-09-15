DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230706182419');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230706182419');
-- Add your query below.


SET @OGUID = 900;
SET @PTEMPLATE = 2129;

-- 406 Stonetalon Mountains / 3659 / 3695 / Barrel of Melon Juice / Food Crate
DELETE FROM `pool_template` WHERE `entry` IN (SELECT `pool_entry` FROM `pool_gameobject` WHERE `guid` IN (47569, 47560, 47559, 47558, 47557, 47552, 47460, 40717));
DELETE FROM `gameobject` WHERE `guid` IN (47569, 47560, 47559, 47558, 47557, 47552, 47460, 40717);
DELETE FROM `pool_gameobject` WHERE `guid` IN (47569, 47560, 47559, 47558, 47557, 47552, 47460, 40717);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 3659, 1, 2697.92, 1456.44, 234.873, -1.0472, 0, 0, 0.5, -0.866025, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 3659, 1, 2735.5, 1494.79, 236.814, 0.663223, 0, 0, 0.325567, 0.945519, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 3695, 1, 2697.92, 1456.44, 234.873, -1.0472, 0, 0, 0.5, -0.866025, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 3695, 1, 2735.5, 1494.79, 236.814, 0.663223, 0, 0, 0.325567, 0.945519, 180, 180, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Barrel of Melon Juice / Food Crate - Stonetalon Mountains', 0, 10),
(@PTEMPLATE+2, 1, 'Barrel of Melon Juice / Food Crate - Stonetalon Mountains', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Barrel of Melon Juice / Food Crate - Stonetalon Mountains', 0, 10),
(@OGUID+2, @PTEMPLATE+2, 'Barrel of Melon Juice / Food Crate - Stonetalon Mountains', 0, 10),
(@OGUID+3, @PTEMPLATE+1, 'Barrel of Melon Juice / Food Crate - Stonetalon Mountains', 0, 10),
(@OGUID+4, @PTEMPLATE+2, 'Barrel of Melon Juice / Food Crate - Stonetalon Mountains', 0, 10);

SET @OGUID = 28070;
SET @PTEMPLATE = 14377;

-- 3662 / 3705 / Food Crate / Barrel of Milk
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 3662, 1, 162.03, -900.954, 5.84075, 2.16421, 0, 0, 0.882948, 0.469472, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 3662, 1, -192.374, -301.287, 11.5468, 3.01942, 0, 0, 0.998135, 0.061049, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 3662, 1, -6.22917, -509.885, -41.3079, -1.25664, 0, 0, 0.587785, -0.809017, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 3662, 1, 878.17, 360.789, 23.2176, 1.8675, 0, 0, 0.803857, 0.594823, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 3662, 1, 125.913, -335.311, 3.59643, -2.96706, 0, 0, 0.996195, -0.087156, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 3662, 1, 141.558, -580.347, -0.440365, -1.44862, 0, 0, 0.66262, -0.748956, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 3662, 1, 993.306, 1015.48, 104.813, -1.81514, 0, 0, 0.788011, -0.615661, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 3662, 1, -177.643, -349.401, 8.65873, 4.13643, 0, 0, -0.878817, 0.47716, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 3662, 1, -153.953, -236.606, 5.65507, 4.81711, 0, 0, -0.66913, 0.743145, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 3662, 1, -77.3075, -489.413, -46.1329, 5.75959, 0, 0, -0.258819, 0.965926, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 3662, 1, 25.8173, -697.654, -19.4137, 4.5204, 0, 0, -0.771625, 0.636078, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 3662, 1, 51.1671, -783.412, -7.49603, 1.36136, 0, 0, 0.62932, 0.777146, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 3662, 1, 113.305, -595.729, -1.4753, 3.38594, 0, 0, -0.992546, 0.12187, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 3662, 1, 117.363, -802.816, -7.49603, 5.93412, 0, 0, -0.173648, 0.984808, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 3662, 1, 121.48, -385.271, 1.43976, 4.46804, 0, 0, -0.788011, 0.615662, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 3662, 1, 881.798, 927.564, 114.484, 2.87979, 0, 0, 0.991445, 0.130528, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 3662, 1, 987.439, -388.693, 8.42977, 6.00393, 0, 0, -0.139173, 0.990268, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 3662, 1, 1237.18, -0.219184, -4.03782, 6.21337, 0, 0, -0.0348988, 0.999391, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 3705, 1, 162.03, -900.954, 5.84075, 2.16421, 0, 0, 0.882948, 0.469472, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 3705, 1, -192.374, -301.287, 11.5468, 3.01942, 0, 0, 0.998135, 0.061049, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 3705, 1, -6.22917, -509.885, -41.3079, -1.25664, 0, 0, 0.587785, -0.809017, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 3705, 1, 878.17, 360.789, 23.2176, 1.8675, 0, 0, 0.803857, 0.594823, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 3705, 1, 125.913, -335.311, 3.59643, -2.96706, 0, 0, 0.996195, -0.087156, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 3705, 1, 141.558, -580.347, -0.440365, -1.44862, 0, 0, 0.66262, -0.748956, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 3705, 1, 993.306, 1015.48, 104.813, -1.81514, 0, 0, 0.788011, -0.615661, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 3705, 1, -177.643, -349.401, 8.65873, 4.13643, 0, 0, -0.878817, 0.47716, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 3705, 1, -153.953, -236.606, 5.65507, 4.81711, 0, 0, -0.66913, 0.743145, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 3705, 1, -77.3075, -489.413, -46.1329, 5.75959, 0, 0, -0.258819, 0.965926, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+29, 3705, 1, 25.8173, -697.654, -19.4137, 4.5204, 0, 0, -0.771625, 0.636078, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+30, 3705, 1, 51.1671, -783.412, -7.49603, 1.36136, 0, 0, 0.62932, 0.777146, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+31, 3705, 1, 113.305, -595.729, -1.4753, 3.38594, 0, 0, -0.992546, 0.12187, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+32, 3705, 1, 117.363, -802.816, -7.49603, 5.93412, 0, 0, -0.173648, 0.984808, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+33, 3705, 1, 121.48, -385.271, 1.43976, 4.46804, 0, 0, -0.788011, 0.615662, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+34, 3705, 1, 881.798, 927.564, 114.484, 2.87979, 0, 0, 0.991445, 0.130528, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+35, 3705, 1, 987.439, -388.693, 8.42977, 6.00393, 0, 0, -0.139173, 0.990268, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+36, 3705, 1, 1237.18, -0.219184, -4.03782, 6.21337, 0, 0, -0.0348988, 0.999391, 180, 180, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@PTEMPLATE+2, 1, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@PTEMPLATE+3, 1, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@PTEMPLATE+4, 1, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@PTEMPLATE+5, 1, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@PTEMPLATE+6, 1, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@PTEMPLATE+7, 1, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@PTEMPLATE+8, 1, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@PTEMPLATE+9, 1, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@PTEMPLATE+10, 1, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@PTEMPLATE+11, 1, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@PTEMPLATE+12, 1, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@PTEMPLATE+13, 1, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@PTEMPLATE+14, 1, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@PTEMPLATE+15, 1, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@PTEMPLATE+16, 1, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@PTEMPLATE+17, 1, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@PTEMPLATE+18, 1, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@OGUID+2, @PTEMPLATE+2, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@OGUID+3, @PTEMPLATE+3, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@OGUID+4, @PTEMPLATE+4, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@OGUID+5, @PTEMPLATE+5, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@OGUID+6, @PTEMPLATE+6, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@OGUID+7, @PTEMPLATE+7, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@OGUID+8, @PTEMPLATE+8, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@OGUID+9, @PTEMPLATE+9, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@OGUID+10, @PTEMPLATE+10, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@OGUID+11, @PTEMPLATE+11, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@OGUID+12, @PTEMPLATE+12, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@OGUID+13, @PTEMPLATE+13, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@OGUID+14, @PTEMPLATE+14, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@OGUID+15, @PTEMPLATE+15, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@OGUID+16, @PTEMPLATE+16, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@OGUID+17, @PTEMPLATE+17, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@OGUID+18, @PTEMPLATE+18, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@OGUID+19, @PTEMPLATE+1, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@OGUID+20, @PTEMPLATE+2, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@OGUID+21, @PTEMPLATE+3, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@OGUID+22, @PTEMPLATE+4, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@OGUID+23, @PTEMPLATE+5, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@OGUID+24, @PTEMPLATE+6, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@OGUID+25, @PTEMPLATE+7, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@OGUID+26, @PTEMPLATE+8, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@OGUID+27, @PTEMPLATE+9, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@OGUID+28, @PTEMPLATE+10, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@OGUID+29, @PTEMPLATE+11, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@OGUID+30, @PTEMPLATE+12, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@OGUID+31, @PTEMPLATE+13, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@OGUID+32, @PTEMPLATE+14, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@OGUID+33, @PTEMPLATE+15, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@OGUID+34, @PTEMPLATE+16, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@OGUID+35, @PTEMPLATE+17, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(@OGUID+36, @PTEMPLATE+18, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+19, 9, 'Stonetalon Mountains - Food Crate / Barrel of Milk (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+19, 0, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0),
(@PTEMPLATE+2, @PTEMPLATE+19, 0, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0),
(@PTEMPLATE+3, @PTEMPLATE+19, 0, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0),
(@PTEMPLATE+4, @PTEMPLATE+19, 0, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0),
(@PTEMPLATE+5, @PTEMPLATE+19, 0, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0),
(@PTEMPLATE+6, @PTEMPLATE+19, 0, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0),
(@PTEMPLATE+7, @PTEMPLATE+19, 0, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0),
(@PTEMPLATE+8, @PTEMPLATE+19, 0, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0),
(@PTEMPLATE+9, @PTEMPLATE+19, 0, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0),
(@PTEMPLATE+10, @PTEMPLATE+19, 0, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0),
(@PTEMPLATE+11, @PTEMPLATE+19, 0, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0),
(@PTEMPLATE+12, @PTEMPLATE+19, 0, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0),
(@PTEMPLATE+13, @PTEMPLATE+19, 0, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0),
(@PTEMPLATE+14, @PTEMPLATE+19, 0, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0),
(@PTEMPLATE+15, @PTEMPLATE+19, 0, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0),
(@PTEMPLATE+16, @PTEMPLATE+19, 0, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0),
(@PTEMPLATE+17, @PTEMPLATE+19, 0, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0),
(@PTEMPLATE+18, @PTEMPLATE+19, 0, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
