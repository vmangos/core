DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230706165659');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230706165659');
-- Add your query below.


SET @OGUID = 33633;
SET @PTEMPLATE = 7080;

-- 38 Loch Modan / 3662 / 3705 / Food Crate / Barrel of Milk
DELETE FROM `pool_template` WHERE `entry` IN (SELECT `pool_entry` FROM `pool_gameobject` WHERE `guid` IN (13008, 12920, 12919, 12918, 12862, 12845, 12826, 12801, 12795, 12794));
DELETE FROM `gameobject` WHERE `guid` IN (13008, 12920, 12919, 12918, 12862, 12845, 12826, 12801, 12795, 12794);
DELETE FROM `pool_gameobject` WHERE `guid` IN (13008, 12920, 12919, 12918, 12862, 12845, 12826, 12801, 12795, 12794);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 3662, 0, -6057.48, -2747.02, 418.459, 1.16937, 0, 0, 0.551937, 0.833886, 7200, 7200, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 3662, 0, -6048.65, -2977.59, 403.13, 0.279253, 0, 0, 0.139173, 0.990268, 7200, 7200, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 3662, 0, -5863.49, -2661.53, 310.606, -1.79769, 0, 0, 0.782608, -0.622515, 7200, 7200, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 3662, 0, -5708.4, -3774.1, 322.841, -0.750491, 0, 0, 0.366501, -0.930418, 7200, 7200, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 3662, 0, -5692.8, -3912.19, 337.257, 1.67552, 0, 0, 0.743145, 0.669131, 7200, 7200, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 3662, 0, -5291.79, -2949.98, 336.758, 1.53589, 0, 0, 0.694658, 0.71934, 7200, 7200, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 3662, 0, -5277.47, -2694.25, 344.979, 2.56563, 0, 0, 0.95882, 0.284015, 7200, 7200, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 3662, 0, -4893.78, -3911.83, 299.384, -2.93215, 0, 0, 0.994522, -0.104529, 7200, 7200, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 3662, 0, -4876.23, -3318.48, 305.601, -2.80998, 0, 0, 0.986286, -0.165048, 7200, 7200, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 3662, 0, -4773.52, -2991.69, 322.995, 0.663225, 0, 0, 0.325568, 0.945519, 7200, 7200, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 3662, 0, -6068.6, -3029.74, 401.523, 5.07891, 0, 0, -0.566406, 0.824126, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 3662, 0, -5975.29, -2786.09, 385.061, 5.74214, 0, 0, -0.267238, 0.963631, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 3662, 0, -5840.78, -2639.82, 315.843, 2.86234, 0, 0, 0.990268, 0.139175, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 3662, 0, -5795.83, -2929.93, 363.821, 1.48353, 0, 0, 0.67559, 0.737278, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 3662, 0, -5757.15, -3999.7, 330.592, 1.29154, 0, 0, 0.601814, 0.798636, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 3662, 0, -5728.46, -3906.47, 322.958, 5.74214, 0, 0, -0.267238, 0.963631, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 3662, 0, -5650.94, -3930.91, 324.779, 3.85718, 0, 0, -0.936671, 0.35021, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 3662, 0, -5582.09, -3883.97, 330.112, 2.68781, 0, 0, 0.97437, 0.224951, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 3662, 0, -5541, -2725.67, 366.985, 6.26573, 0, 0, -0.00872612, 0.999962, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 3662, 0, -5392.1, -2709.46, 366.038, 6.14356, 0, 0, -0.0697556, 0.997564, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 3662, 0, -5373.65, -2952.16, 323.683, 0.802851, 0, 0, 0.390731, 0.920505, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 3662, 0, -5287.15, -2990.18, 340.888, 2.91469, 0, 0, 0.993571, 0.113208, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 3662, 0, -5033.73, -2699.3, 320.22, 1.01229, 0, 0, 0.484809, 0.87462, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 3662, 0, -4931.47, -3430.26, 306.02, 5.86431, 0, 0, -0.207911, 0.978148, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 3662, 0, -4868.68, -3906.8, 303.317, 4.55531, 0, 0, -0.760406, 0.649449, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 3662, 0, -4831.44, -2701.95, 327.267, 3.97935, 0, 0, -0.913545, 0.406738, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 3662, 0, -4829.81, -2982.96, 323.09, 2.61799, 0, 0, 0.965925, 0.258821, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 3662, 0, -4740.01, -3274.93, 310.257, 1.5708, 0, 0, 0.707107, 0.707107, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+29, 3662, 0, -5980.33, -2962.16, 387.75, 3.68265, 0, 0, -0.96363, 0.267241, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+30, 3705, 0, -6057.48, -2747.02, 418.459, 1.16937, 0, 0, 0.551937, 0.833886, 7200, 7200, 100, 1, 0, 0, 0, 10),
(@OGUID+31, 3705, 0, -6048.65, -2977.59, 403.13, 0.279253, 0, 0, 0.139173, 0.990268, 7200, 7200, 100, 1, 0, 0, 0, 10),
(@OGUID+32, 3705, 0, -5863.49, -2661.53, 310.606, -1.79769, 0, 0, 0.782608, -0.622515, 7200, 7200, 100, 1, 0, 0, 0, 10),
(@OGUID+33, 3705, 0, -5708.4, -3774.1, 322.841, -0.750491, 0, 0, 0.366501, -0.930418, 7200, 7200, 100, 1, 0, 0, 0, 10),
(@OGUID+34, 3705, 0, -5692.8, -3912.19, 337.257, 1.67552, 0, 0, 0.743145, 0.669131, 7200, 7200, 100, 1, 0, 0, 0, 10),
(@OGUID+35, 3705, 0, -5291.79, -2949.98, 336.758, 1.53589, 0, 0, 0.694658, 0.71934, 7200, 7200, 100, 1, 0, 0, 0, 10),
(@OGUID+36, 3705, 0, -5277.47, -2694.25, 344.979, 2.56563, 0, 0, 0.95882, 0.284015, 7200, 7200, 100, 1, 0, 0, 0, 10),
(@OGUID+37, 3705, 0, -4893.78, -3911.83, 299.384, -2.93215, 0, 0, 0.994522, -0.104529, 7200, 7200, 100, 1, 0, 0, 0, 10),
(@OGUID+38, 3705, 0, -4876.23, -3318.48, 305.601, -2.80998, 0, 0, 0.986286, -0.165048, 7200, 7200, 100, 1, 0, 0, 0, 10),
(@OGUID+39, 3705, 0, -4773.52, -2991.69, 322.995, 0.663225, 0, 0, 0.325568, 0.945519, 7200, 7200, 100, 1, 0, 0, 0, 10),
(@OGUID+40, 3705, 0, -6068.6, -3029.74, 401.523, 5.07891, 0, 0, -0.566406, 0.824126, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+41, 3705, 0, -5975.29, -2786.09, 385.061, 5.74214, 0, 0, -0.267238, 0.963631, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+42, 3705, 0, -5840.78, -2639.82, 315.843, 2.86234, 0, 0, 0.990268, 0.139175, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+43, 3705, 0, -5795.83, -2929.93, 363.821, 1.48353, 0, 0, 0.67559, 0.737278, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+44, 3705, 0, -5757.15, -3999.7, 330.592, 1.29154, 0, 0, 0.601814, 0.798636, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+45, 3705, 0, -5728.46, -3906.47, 322.958, 5.74214, 0, 0, -0.267238, 0.963631, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+46, 3705, 0, -5650.94, -3930.91, 324.779, 3.85718, 0, 0, -0.936671, 0.35021, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+47, 3705, 0, -5582.09, -3883.97, 330.112, 2.68781, 0, 0, 0.97437, 0.224951, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+48, 3705, 0, -5541, -2725.67, 366.985, 6.26573, 0, 0, -0.00872612, 0.999962, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+49, 3705, 0, -5392.1, -2709.46, 366.038, 6.14356, 0, 0, -0.0697556, 0.997564, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+50, 3705, 0, -5373.65, -2952.16, 323.683, 0.802851, 0, 0, 0.390731, 0.920505, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+51, 3705, 0, -5287.15, -2990.18, 340.888, 2.91469, 0, 0, 0.993571, 0.113208, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+52, 3705, 0, -5033.73, -2699.3, 320.22, 1.01229, 0, 0, 0.484809, 0.87462, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+53, 3705, 0, -4931.47, -3430.26, 306.02, 5.86431, 0, 0, -0.207911, 0.978148, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+54, 3705, 0, -4868.68, -3906.8, 303.317, 4.55531, 0, 0, -0.760406, 0.649449, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+55, 3705, 0, -4831.44, -2701.95, 327.267, 3.97935, 0, 0, -0.913545, 0.406738, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+56, 3705, 0, -4829.81, -2982.96, 323.09, 2.61799, 0, 0, 0.965925, 0.258821, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+57, 3705, 0, -4740.01, -3274.93, 310.257, 1.5708, 0, 0, 0.707107, 0.707107, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+58, 3705, 0, -5980.33, -2962.16, 387.75, 3.68265, 0, 0, -0.96363, 0.267241, 180, 180, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@PTEMPLATE+2, 1, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@PTEMPLATE+3, 1, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@PTEMPLATE+4, 1, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@PTEMPLATE+5, 1, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@PTEMPLATE+6, 1, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@PTEMPLATE+7, 1, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@PTEMPLATE+8, 1, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@PTEMPLATE+9, 1, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@PTEMPLATE+10, 1, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@PTEMPLATE+11, 1, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@PTEMPLATE+12, 1, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@PTEMPLATE+13, 1, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@PTEMPLATE+14, 1, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@PTEMPLATE+15, 1, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@PTEMPLATE+16, 1, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@PTEMPLATE+17, 1, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@PTEMPLATE+18, 1, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@PTEMPLATE+19, 1, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@PTEMPLATE+20, 1, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@PTEMPLATE+21, 1, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@PTEMPLATE+22, 1, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@PTEMPLATE+23, 1, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@PTEMPLATE+24, 1, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@PTEMPLATE+25, 1, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@PTEMPLATE+26, 1, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@PTEMPLATE+27, 1, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@PTEMPLATE+28, 1, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@PTEMPLATE+29, 1, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+2, @PTEMPLATE+2, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+3, @PTEMPLATE+3, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+4, @PTEMPLATE+4, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+5, @PTEMPLATE+5, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+6, @PTEMPLATE+6, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+7, @PTEMPLATE+7, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+8, @PTEMPLATE+8, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+9, @PTEMPLATE+9, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+10, @PTEMPLATE+10, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+11, @PTEMPLATE+11, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+12, @PTEMPLATE+12, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+13, @PTEMPLATE+13, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+14, @PTEMPLATE+14, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+15, @PTEMPLATE+15, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+16, @PTEMPLATE+16, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+17, @PTEMPLATE+17, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+18, @PTEMPLATE+18, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+19, @PTEMPLATE+19, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+20, @PTEMPLATE+20, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+21, @PTEMPLATE+21, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+22, @PTEMPLATE+22, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+23, @PTEMPLATE+23, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+24, @PTEMPLATE+24, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+25, @PTEMPLATE+25, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+26, @PTEMPLATE+26, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+27, @PTEMPLATE+27, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+28, @PTEMPLATE+28, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+29, @PTEMPLATE+29, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+30, @PTEMPLATE+1, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+31, @PTEMPLATE+2, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+32, @PTEMPLATE+3, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+33, @PTEMPLATE+4, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+34, @PTEMPLATE+5, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+35, @PTEMPLATE+6, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+36, @PTEMPLATE+7, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+37, @PTEMPLATE+8, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+38, @PTEMPLATE+9, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+39, @PTEMPLATE+10, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+40, @PTEMPLATE+11, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+41, @PTEMPLATE+12, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+42, @PTEMPLATE+13, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+43, @PTEMPLATE+14, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+44, @PTEMPLATE+15, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+45, @PTEMPLATE+16, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+46, @PTEMPLATE+17, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+47, @PTEMPLATE+18, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+48, @PTEMPLATE+19, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+49, @PTEMPLATE+20, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+50, @PTEMPLATE+21, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+51, @PTEMPLATE+22, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+52, @PTEMPLATE+23, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+53, @PTEMPLATE+24, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+54, @PTEMPLATE+25, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+55, @PTEMPLATE+26, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+56, @PTEMPLATE+27, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+57, @PTEMPLATE+28, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10),
(@OGUID+58, @PTEMPLATE+29, 'Food Crate / Barrel of Milk - Loch Modan', 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+30, 13, 'Loch Modan - Food Crate / Barrel of Milk (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+30, 0, 'Food Crate / Barrel of Milk - Loch Modan', 0),
(@PTEMPLATE+2, @PTEMPLATE+30, 0, 'Food Crate / Barrel of Milk - Loch Modan', 0),
(@PTEMPLATE+3, @PTEMPLATE+30, 0, 'Food Crate / Barrel of Milk - Loch Modan', 0),
(@PTEMPLATE+4, @PTEMPLATE+30, 0, 'Food Crate / Barrel of Milk - Loch Modan', 0),
(@PTEMPLATE+5, @PTEMPLATE+30, 0, 'Food Crate / Barrel of Milk - Loch Modan', 0),
(@PTEMPLATE+6, @PTEMPLATE+30, 0, 'Food Crate / Barrel of Milk - Loch Modan', 0),
(@PTEMPLATE+7, @PTEMPLATE+30, 0, 'Food Crate / Barrel of Milk - Loch Modan', 0),
(@PTEMPLATE+8, @PTEMPLATE+30, 0, 'Food Crate / Barrel of Milk - Loch Modan', 0),
(@PTEMPLATE+9, @PTEMPLATE+30, 0, 'Food Crate / Barrel of Milk - Loch Modan', 0),
(@PTEMPLATE+10, @PTEMPLATE+30, 0, 'Food Crate / Barrel of Milk - Loch Modan', 0),
(@PTEMPLATE+11, @PTEMPLATE+30, 0, 'Food Crate / Barrel of Milk - Loch Modan', 0),
(@PTEMPLATE+12, @PTEMPLATE+30, 0, 'Food Crate / Barrel of Milk - Loch Modan', 0),
(@PTEMPLATE+13, @PTEMPLATE+30, 0, 'Food Crate / Barrel of Milk - Loch Modan', 0),
(@PTEMPLATE+14, @PTEMPLATE+30, 0, 'Food Crate / Barrel of Milk - Loch Modan', 0),
(@PTEMPLATE+15, @PTEMPLATE+30, 0, 'Food Crate / Barrel of Milk - Loch Modan', 0),
(@PTEMPLATE+16, @PTEMPLATE+30, 0, 'Food Crate / Barrel of Milk - Loch Modan', 0),
(@PTEMPLATE+17, @PTEMPLATE+30, 0, 'Food Crate / Barrel of Milk - Loch Modan', 0),
(@PTEMPLATE+18, @PTEMPLATE+30, 0, 'Food Crate / Barrel of Milk - Loch Modan', 0),
(@PTEMPLATE+19, @PTEMPLATE+30, 0, 'Food Crate / Barrel of Milk - Loch Modan', 0),
(@PTEMPLATE+20, @PTEMPLATE+30, 0, 'Food Crate / Barrel of Milk - Loch Modan', 0),
(@PTEMPLATE+21, @PTEMPLATE+30, 0, 'Food Crate / Barrel of Milk - Loch Modan', 0),
(@PTEMPLATE+22, @PTEMPLATE+30, 0, 'Food Crate / Barrel of Milk - Loch Modan', 0),
(@PTEMPLATE+23, @PTEMPLATE+30, 0, 'Food Crate / Barrel of Milk - Loch Modan', 0),
(@PTEMPLATE+24, @PTEMPLATE+30, 0, 'Food Crate / Barrel of Milk - Loch Modan', 0),
(@PTEMPLATE+25, @PTEMPLATE+30, 0, 'Food Crate / Barrel of Milk - Loch Modan', 0),
(@PTEMPLATE+26, @PTEMPLATE+30, 0, 'Food Crate / Barrel of Milk - Loch Modan', 0),
(@PTEMPLATE+27, @PTEMPLATE+30, 0, 'Food Crate / Barrel of Milk - Loch Modan', 0),
(@PTEMPLATE+28, @PTEMPLATE+30, 0, 'Food Crate / Barrel of Milk - Loch Modan', 0),
(@PTEMPLATE+29, @PTEMPLATE+30, 0, 'Food Crate / Barrel of Milk - Loch Modan', 0);

UPDATE `gameobject` SET `spawntimesecsmin` = 180, `spawntimesecsmax` = 180 WHERE `id` IN (3662, 3705);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
