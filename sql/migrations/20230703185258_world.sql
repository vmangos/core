DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230703185258');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230703185258');
-- Add your query below.


SET @OGUID = 19828;
SET @PTEMPLATE = 20057;

DELETE FROM `gameobject` WHERE `guid` IN (32555, 32554, 32553, 32551, 32550, 32549, 32547, 32546, 32545, 32544, 32543, 32784, 32681, 32679, 32674, 32670);
DELETE FROM `pool_gameobject` WHERE `guid` IN (32555, 32554, 32553, 32551, 32550, 32549, 32547, 32546, 32545, 32544, 32543, 32784, 32681, 32679, 32674, 32670);
DELETE FROM `pool_template` WHERE `entry` IN (SELECT `pool_entry` FROM `pool_gameobject` WHERE `guid` IN (32555, 32554, 32553, 32551, 32550, 32549, 32547, 32546, 32545, 32544, 32543, 32784, 32681, 32679, 32674, 32670));
DELETE FROM `gameobject_scripts` WHERE `id` IN (32555, 32554, 32553, 32551, 32550, 32549, 32547, 32546, 32545, 32544, 32543, 32784, 32681, 32679, 32674, 32670);
DELETE FROM `generic_scripts` WHERE `id`=176582;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 176635, 1, -2111.39, 3341.36, -48.6987, 4.57276, 0, 0, -0.754709, 0.656059, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 176635, 1, -2080.09, 3425.93, -50.8592, 5.044, 0, 0, -0.580703, 0.814116, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 176635, 1, -2024.38, 3293.43, -43.9713, 5.02655, 0, 0, -0.587785, 0.809017, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 176635, 1, -2005.05, 3358.99, -80.155, 4.4855, 0, 0, -0.782608, 0.622515, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 176635, 1, -1994.45, 3401.67, -80.061, 3.3685, 0, 0, -0.993571, 0.113208, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 176635, 1, -1980.03, 3252.06, -32.7441, 0.610863, 0, 0, 0.300705, 0.953717, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 176635, 1, -1975.23, 3193.08, -66.2544, 5.14872, 0, 0, -0.537299, 0.843392, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 176635, 1, -1962.74, 3303.61, -42.876, 2.53072, 0, 0, 0.953716, 0.300708, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 176635, 1, -1920.99, 3326.93, -74.3969, 3.59538, 0, 0, -0.97437, 0.224951, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 176635, 1, -1869.41, 3139.91, -29.0381, 5.88176, 0, 0, -0.199368, 0.979925, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 176635, 1, -1861.97, 3384.48, -69.699, 5.28835, 0, 0, -0.477159, 0.878817, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 176635, 1, -1860.29, 3183.45, -34.1432, 3.00195, 0, 0, 0.997563, 0.0697661, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 176635, 1, -1834.32, 3425.38, -48.2402, 4.85202, 0, 0, -0.656058, 0.75471, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 176635, 1, -1831.1, 3343.21, -44.4896, 0.244346, 0, 0, 0.121869, 0.992546, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 176635, 1, -1799.84, 3226.16, -45.5012, 4.4855, 0, 0, -0.782608, 0.622515, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 176635, 1, -1796.36, 3300.82, -69.3038, 3.08918, 0, 0, 0.999657, 0.0262016, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 176635, 1, -1754.22, 3332.64, -43.293, 0.401425, 0, 0, 0.199368, 0.979925, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 176635, 1, -1683.83, 3321.01, -44.2335, 2.14675, 0, 0, 0.878817, 0.47716, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 176635, 1, -1674.09, 3439.92, -48.884, 1.46608, 0, 0, 0.66913, 0.743145, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 176582, 1, -2111.39, 3341.36, -48.6987, 4.57276, 0, 0, -0.754709, 0.656059, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 176582, 1, -2080.09, 3425.93, -50.8592, 5.044, 0, 0, -0.580703, 0.814116, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 176582, 1, -2024.38, 3293.43, -43.9713, 5.02655, 0, 0, -0.587785, 0.809017, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 176582, 1, -2005.05, 3358.99, -80.155, 4.4855, 0, 0, -0.782608, 0.622515, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 176582, 1, -1994.45, 3401.67, -80.061, 3.3685, 0, 0, -0.993571, 0.113208, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 176582, 1, -1980.03, 3252.06, -32.7441, 0.610863, 0, 0, 0.300705, 0.953717, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 176582, 1, -1975.23, 3193.08, -66.2544, 5.14872, 0, 0, -0.537299, 0.843392, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 176582, 1, -1962.74, 3303.61, -42.876, 2.53072, 0, 0, 0.953716, 0.300708, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 176582, 1, -1920.99, 3326.93, -74.3969, 3.59538, 0, 0, -0.97437, 0.224951, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+29, 176582, 1, -1869.41, 3139.91, -29.0381, 5.88176, 0, 0, -0.199368, 0.979925, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+30, 176582, 1, -1861.97, 3384.48, -69.699, 5.28835, 0, 0, -0.477159, 0.878817, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+31, 176582, 1, -1860.29, 3183.45, -34.1432, 3.00195, 0, 0, 0.997563, 0.0697661, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+32, 176582, 1, -1834.32, 3425.38, -48.2402, 4.85202, 0, 0, -0.656058, 0.75471, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+33, 176582, 1, -1831.1, 3343.21, -44.4896, 0.244346, 0, 0, 0.121869, 0.992546, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+34, 176582, 1, -1799.84, 3226.16, -45.5012, 4.4855, 0, 0, -0.782608, 0.622515, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+35, 176582, 1, -1796.36, 3300.82, -69.3038, 3.08918, 0, 0, 0.999657, 0.0262016, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+36, 176582, 1, -1754.22, 3332.64, -43.293, 0.401425, 0, 0, 0.199368, 0.979925, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+37, 176582, 1, -1683.83, 3321.01, -44.2335, 2.14675, 0, 0, 0.878817, 0.47716, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+38, 176582, 1, -1674.09, 3439.92, -48.884, 1.46608, 0, 0, 0.66913, 0.743145, 180, 180, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Shellfish Trap - Desolace', 0, 10),
(@PTEMPLATE+2, 1, 'Shellfish Trap - Desolace', 0, 10),
(@PTEMPLATE+3, 1, 'Shellfish Trap - Desolace', 0, 10),
(@PTEMPLATE+4, 1, 'Shellfish Trap - Desolace', 0, 10),
(@PTEMPLATE+5, 1, 'Shellfish Trap - Desolace', 0, 10),
(@PTEMPLATE+6, 1, 'Shellfish Trap - Desolace', 0, 10),
(@PTEMPLATE+7, 1, 'Shellfish Trap - Desolace', 0, 10),
(@PTEMPLATE+8, 1, 'Shellfish Trap - Desolace', 0, 10),
(@PTEMPLATE+9, 1, 'Shellfish Trap - Desolace', 0, 10),
(@PTEMPLATE+10, 1, 'Shellfish Trap - Desolace', 0, 10),
(@PTEMPLATE+11, 1, 'Shellfish Trap - Desolace', 0, 10),
(@PTEMPLATE+12, 1, 'Shellfish Trap - Desolace', 0, 10),
(@PTEMPLATE+13, 1, 'Shellfish Trap - Desolace', 0, 10),
(@PTEMPLATE+14, 1, 'Shellfish Trap - Desolace', 0, 10),
(@PTEMPLATE+15, 1, 'Shellfish Trap - Desolace', 0, 10),
(@PTEMPLATE+16, 1, 'Shellfish Trap - Desolace', 0, 10),
(@PTEMPLATE+17, 1, 'Shellfish Trap - Desolace', 0, 10),
(@PTEMPLATE+18, 1, 'Shellfish Trap - Desolace', 0, 10),
(@PTEMPLATE+19, 1, 'Shellfish Trap - Desolace', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Shellfish Trap - Desolace', 0, 10),
(@OGUID+2, @PTEMPLATE+2, 'Shellfish Trap - Desolace', 0, 10),
(@OGUID+3, @PTEMPLATE+3, 'Shellfish Trap - Desolace', 0, 10),
(@OGUID+4, @PTEMPLATE+4, 'Shellfish Trap - Desolace', 0, 10),
(@OGUID+5, @PTEMPLATE+5, 'Shellfish Trap - Desolace', 0, 10),
(@OGUID+6, @PTEMPLATE+6, 'Shellfish Trap - Desolace', 0, 10),
(@OGUID+7, @PTEMPLATE+7, 'Shellfish Trap - Desolace', 0, 10),
(@OGUID+8, @PTEMPLATE+8, 'Shellfish Trap - Desolace', 0, 10),
(@OGUID+9, @PTEMPLATE+9, 'Shellfish Trap - Desolace', 0, 10),
(@OGUID+10, @PTEMPLATE+10, 'Shellfish Trap - Desolace', 0, 10),
(@OGUID+11, @PTEMPLATE+11, 'Shellfish Trap - Desolace', 0, 10),
(@OGUID+12, @PTEMPLATE+12, 'Shellfish Trap - Desolace', 0, 10),
(@OGUID+13, @PTEMPLATE+13, 'Shellfish Trap - Desolace', 0, 10),
(@OGUID+14, @PTEMPLATE+14, 'Shellfish Trap - Desolace', 0, 10),
(@OGUID+15, @PTEMPLATE+15, 'Shellfish Trap - Desolace', 0, 10),
(@OGUID+16, @PTEMPLATE+16, 'Shellfish Trap - Desolace', 0, 10),
(@OGUID+17, @PTEMPLATE+17, 'Shellfish Trap - Desolace', 0, 10),
(@OGUID+18, @PTEMPLATE+18, 'Shellfish Trap - Desolace', 0, 10),
(@OGUID+19, @PTEMPLATE+19, 'Shellfish Trap - Desolace', 0, 10),
(@OGUID+20, @PTEMPLATE+1, 'Shellfish Trap - Desolace', 0, 10),
(@OGUID+21, @PTEMPLATE+2, 'Shellfish Trap - Desolace', 0, 10),
(@OGUID+22, @PTEMPLATE+3, 'Shellfish Trap - Desolace', 0, 10),
(@OGUID+23, @PTEMPLATE+4, 'Shellfish Trap - Desolace', 0, 10),
(@OGUID+24, @PTEMPLATE+5, 'Shellfish Trap - Desolace', 0, 10),
(@OGUID+25, @PTEMPLATE+6, 'Shellfish Trap - Desolace', 0, 10),
(@OGUID+26, @PTEMPLATE+7, 'Shellfish Trap - Desolace', 0, 10),
(@OGUID+27, @PTEMPLATE+8, 'Shellfish Trap - Desolace', 0, 10),
(@OGUID+28, @PTEMPLATE+9, 'Shellfish Trap - Desolace', 0, 10),
(@OGUID+29, @PTEMPLATE+10, 'Shellfish Trap - Desolace', 0, 10),
(@OGUID+30, @PTEMPLATE+11, 'Shellfish Trap - Desolace', 0, 10),
(@OGUID+31, @PTEMPLATE+12, 'Shellfish Trap - Desolace', 0, 10),
(@OGUID+32, @PTEMPLATE+13, 'Shellfish Trap - Desolace', 0, 10),
(@OGUID+33, @PTEMPLATE+14, 'Shellfish Trap - Desolace', 0, 10),
(@OGUID+34, @PTEMPLATE+15, 'Shellfish Trap - Desolace', 0, 10),
(@OGUID+35, @PTEMPLATE+16, 'Shellfish Trap - Desolace', 0, 10),
(@OGUID+36, @PTEMPLATE+17, 'Shellfish Trap - Desolace', 0, 10),
(@OGUID+37, @PTEMPLATE+18, 'Shellfish Trap - Desolace', 0, 10),
(@OGUID+38, @PTEMPLATE+19, 'Shellfish Trap - Desolace', 0, 10);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+39, 176592, 1, -2111.39, 3341.36, -48.6987, 4.57276, 0, 0, -0.754709, 0.656059, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+40, 176592, 1, -2080.09, 3425.93, -50.8592, 5.044, 0, 0, -0.580703, 0.814116, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+41, 176592, 1, -2024.38, 3293.43, -43.9713, 5.02655, 0, 0, -0.587785, 0.809017, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+42, 176592, 1, -2005.05, 3358.99, -80.155, 4.4855, 0, 0, -0.782608, 0.622515, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+43, 176592, 1, -1994.45, 3401.67, -80.061, 3.3685, 0, 0, -0.993571, 0.113208, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+44, 176592, 1, -1980.03, 3252.06, -32.7441, 0.610863, 0, 0, 0.300705, 0.953717, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+45, 176592, 1, -1975.23, 3193.08, -66.2544, 5.14872, 0, 0, -0.537299, 0.843392, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+46, 176592, 1, -1962.74, 3303.61, -42.876, 2.53072, 0, 0, 0.953716, 0.300708, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+47, 176592, 1, -1920.99, 3326.93, -74.3969, 3.59538, 0, 0, -0.97437, 0.224951, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+48, 176592, 1, -1869.41, 3139.91, -29.0381, 5.88176, 0, 0, -0.199368, 0.979925, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+49, 176592, 1, -1861.97, 3384.48, -69.699, 5.28835, 0, 0, -0.477159, 0.878817, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+50, 176592, 1, -1860.29, 3183.45, -34.1432, 3.00195, 0, 0, 0.997563, 0.0697661, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+51, 176592, 1, -1834.32, 3425.38, -48.2402, 4.85202, 0, 0, -0.656058, 0.75471, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+52, 176592, 1, -1831.1, 3343.21, -44.4896, 0.244346, 0, 0, 0.121869, 0.992546, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+53, 176592, 1, -1799.84, 3226.16, -45.5012, 4.4855, 0, 0, -0.782608, 0.622515, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+54, 176592, 1, -1796.36, 3300.82, -69.3038, 3.08918, 0, 0, 0.999657, 0.0262016, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+55, 176592, 1, -1754.22, 3332.64, -43.293, 0.401425, 0, 0, 0.199368, 0.979925, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+56, 176592, 1, -1683.83, 3321.01, -44.2335, 2.14675, 0, 0, 0.878817, 0.47716, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+57, 176592, 1, -1674.09, 3439.92, -48.884, 1.46608, 0, 0, 0.66913, 0.743145, 180, 180, 100, 1, 0, 0, 0, 10);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
