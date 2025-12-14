DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230625114125');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230625114125');
-- Add your query below.


SET @OGUID = 138;
SET @PTEMPLATE = 1556;

-- Barrens
DELETE FROM `gameobject` WHERE `guid` IN (899, 915, 919, 952, 1048, 1124, 1188, 1431, 1441, 1442, 1457, 1461, 5120, 10964, 13421, 13422, 13429, 13430, 13431, 13432, 14778, 15202, 15397, 15707, 15708, 16574, 16576, 16577, 16578, 16579, 16580, 18139, 18140, 18144, 18151, 18153, 18154, 50267, 50268, 50276, 50278, 50279, 50283, 50284, 50305, 50307, 50313, 50314, 50333, 50335, 50337);
DELETE FROM `pool_gameobject` WHERE `guid` IN (899, 915, 919, 952, 1048, 1124, 1188, 1431, 1441, 1442, 1457, 1461, 5120, 10964, 13421, 13422, 13429, 13430, 13431, 13432, 14778, 15202, 15397, 15707, 15708, 16574, 16576, 16577, 16578, 16579, 16580, 18139, 18140, 18144, 18151, 18153, 18154, 50267, 50268, 50276, 50278, 50279, 50283, 50284, 50305, 50307, 50313, 50314, 50333, 50335, 50337);
DELETE FROM `pool_template` WHERE `entry` IN (SELECT `pool_entry` FROM `pool_gameobject` WHERE `guid` IN (899, 915, 919, 952, 1048, 1124, 1188, 1431, 1441, 1442, 1457, 1461, 5120, 10964, 13421, 13422, 13429, 13430, 13431, 13432, 14778, 15202, 15397, 15707, 15708, 16574, 16576, 16577, 16578, 16579, 16580, 18139, 18140, 18144, 18151, 18153, 18154, 50267, 50268, 50276, 50278, 50279, 50283, 50284, 50305, 50307, 50313, 50314, 50333, 50335, 50337));

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 180682, 1, -2359.54, -3854.49, 0, -1.29154, 0, 0, 0.601815, -0.798635, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+2, 180682, 1, -2295.38, -3893.07, 0, -0.994838, 0, 0, 0.477159, -0.878817, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+3, 180682, 1, -2229.07, -3910.16, 0, 2.87979, 0, 0, 0.991445, 0.130526, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+4, 180682, 1, -2179.12, -3912.34, 0, 2.3911, 0, 0, 0.930418, 0.366501, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+5, 180682, 1, -2396.59, -3798.74, 0, 5.68977, 0, 0, -0.292372, 0.956305, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+6, 180683, 1, -2359.54, -3854.49, 0, -1.29154, 0, 0, 0.601815, -0.798635, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+7, 180683, 1, -2295.38, -3893.07, 0, -0.994838, 0, 0, 0.477159, -0.878817, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+8, 180683, 1, -2229.07, -3910.16, 0, 2.87979, 0, 0, 0.991445, 0.130526, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+9, 180683, 1, -2179.12, -3912.34, 0, 2.3911, 0, 0, 0.930418, 0.366501, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+10, 180683, 1, -2396.59, -3798.74, 0, 5.68977, 0, 0, -0.292372, 0.956305, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+11, 180685, 1, -2359.54, -3854.49, 0, -1.29154, 0, 0, 0.601815, -0.798635, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+12, 180685, 1, -2295.38, -3893.07, 0, -0.994838, 0, 0, 0.477159, -0.878817, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+13, 180685, 1, -2229.07, -3910.16, 0, 2.87979, 0, 0, 0.991445, 0.130526, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+14, 180685, 1, -2179.12, -3912.34, 0, 2.3911, 0, 0, 0.930418, 0.366501, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+15, 180685, 1, -2396.59, -3798.74, 0, 5.68977, 0, 0, -0.292372, 0.956305, 180, 180, 100, 1, 0, 0, 7, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Barrens', 7, 10),
(@PTEMPLATE+2, 1, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Barrens', 7, 10),
(@PTEMPLATE+3, 1, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Barrens', 7, 10),
(@PTEMPLATE+4, 1, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Barrens', 7, 10),
(@PTEMPLATE+5, 1, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Barrens', 7, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+2, @PTEMPLATE+2, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+3, @PTEMPLATE+3, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+4, @PTEMPLATE+4, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+5, @PTEMPLATE+5, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+6, @PTEMPLATE+1, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+7, @PTEMPLATE+2, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+8, @PTEMPLATE+3, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+9, @PTEMPLATE+4, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+10, @PTEMPLATE+5, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+11, @PTEMPLATE+1, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+12, @PTEMPLATE+2, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+13, @PTEMPLATE+3, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+14, @PTEMPLATE+4, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+15, @PTEMPLATE+5, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Barrens', 7, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+6, 2, 'Barrens - Oily Blackmouth School / Firefin Snapper School / Floating Wreckage (Master Pool)', 0, 0, 7, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+6, 0, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Barrens', 0),
(@PTEMPLATE+2, @PTEMPLATE+6, 0, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Barrens', 0),
(@PTEMPLATE+3, @PTEMPLATE+6, 0, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Barrens', 0),
(@PTEMPLATE+4, @PTEMPLATE+6, 0, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Barrens', 0),
(@PTEMPLATE+5, @PTEMPLATE+6, 0, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Barrens', 0);

UPDATE `pool_gameobject` SET `chance` = 30 WHERE `description` = "Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Barrens" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 180682);
UPDATE `pool_gameobject` SET `chance` = 40 WHERE `description` = "Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Barrens" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 180683);
UPDATE `pool_gameobject` SET `chance` = 30 WHERE `description` = "Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Barrens" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 180685);

SET @OGUID = 19444;
SET @PTEMPLATE = 2606;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 180582, 1, -1981.99, -3767.3, 0, 1.5708, 0, 0, 0.707107, 0.707107, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+2, 180582, 1, -1951.5, -3759.95, 0, 0.663225, 0, 0, 0.325568, 0.945519, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+3, 180582, 1, -1925.76, -3760.7, 0, 1.11701, 0, 0, 0.529919, 0.848048, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+4, 180582, 1, -1773.84, -3813.52, 0, -2.68781, 0, 0, 0.97437, -0.224951, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+5, 180582, 1, -1608.05, -3954.22, 0, 2.19912, 0, 0, 0.891007, 0.453991, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+6, 180582, 1, -1586.55, -3948.27, 0, -1.25664, 0, 0, 0.587785, -0.809017, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+7, 180582, 1, -1476.99, -3924.05, 0, -3.05433, 0, 0, 0.999048, -0.043619, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+8, 180582, 1, -1321.56, -4052.38, 0, 2.02458, 0, 0, 0.848048, 0.529919, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+9, 180582, 1, -1302.54, -3916.2, 0, 1.06465, 0, 0, 0.507538, 0.861629, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+10, 180582, 1, -1199.29, -3823.79, 0, -1.32645, 0, 0, 0.615661, -0.788011, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+11, 180582, 1, -1011.95, -3808.33, 0, -2.3911, 0, 0, 0.930418, -0.366501, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+12, 180582, 1, -1001.69, -3733.47, 0, 2.37365, 0, 0, 0.927184, 0.374607, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+13, 180582, 1, -988.858, -3775.46, 0, -1.97222, 0, 0, 0.833886, -0.551937, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+14, 180582, 1, -957.178, -3778.92, 0, -0.174533, 0, 0, 0.087156, -0.996195, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+15, 180582, 1, -872.794, -3814.69, 0, -2.86234, 0, 0, 0.990268, -0.139173, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+16, 180582, 1, -833.911, -3919.65, 0, 0.994838, 0, 0, 0.477159, 0.878817, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+17, 180582, 1, -1797.26, -3795.81, 0, 4.97419, 0, 0, -0.608761, 0.793354, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+18, 180582, 1, -1776.29, -3783.66, 0, 0.122173, 0, 0, 0.0610485, 0.998135, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+19, 180582, 1, -1288.6, -3900.71, 0, 0.174532, 0, 0, 0.0871553, 0.996195, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+20, 180582, 1, -975.692, -3835.2, 0, 4.7473, 0, 0, -0.694658, 0.71934, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+21, 180582, 1, -969.846, -3805.12, 0, 5.68977, 0, 0, -0.292372, 0.956305, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+22, 180655, 1, -1981.99, -3767.3, 0, 1.5708, 0, 0, 0.707107, 0.707107, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+23, 180655, 1, -1951.5, -3759.95, 0, 0.663225, 0, 0, 0.325568, 0.945519, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+24, 180655, 1, -1925.76, -3760.7, 0, 1.11701, 0, 0, 0.529919, 0.848048, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+25, 180655, 1, -1773.84, -3813.52, 0, -2.68781, 0, 0, 0.97437, -0.224951, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+26, 180655, 1, -1608.05, -3954.22, 0, 2.19912, 0, 0, 0.891007, 0.453991, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+27, 180655, 1, -1586.55, -3948.27, 0, -1.25664, 0, 0, 0.587785, -0.809017, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+28, 180655, 1, -1476.99, -3924.05, 0, -3.05433, 0, 0, 0.999048, -0.043619, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+29, 180655, 1, -1321.56, -4052.38, 0, 2.02458, 0, 0, 0.848048, 0.529919, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+30, 180655, 1, -1302.54, -3916.2, 0, 1.06465, 0, 0, 0.507538, 0.861629, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+31, 180655, 1, -1199.29, -3823.79, 0, -1.32645, 0, 0, 0.615661, -0.788011, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+32, 180655, 1, -1011.95, -3808.33, 0, -2.3911, 0, 0, 0.930418, -0.366501, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+33, 180655, 1, -1001.69, -3733.47, 0, 2.37365, 0, 0, 0.927184, 0.374607, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+34, 180655, 1, -988.858, -3775.46, 0, -1.97222, 0, 0, 0.833886, -0.551937, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+35, 180655, 1, -957.178, -3778.92, 0, -0.174533, 0, 0, 0.087156, -0.996195, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+36, 180655, 1, -872.794, -3814.69, 0, -2.86234, 0, 0, 0.990268, -0.139173, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+37, 180655, 1, -833.911, -3919.65, 0, 0.994838, 0, 0, 0.477159, 0.878817, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+38, 180655, 1, -1797.26, -3795.81, 0, 4.97419, 0, 0, -0.608761, 0.793354, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+39, 180655, 1, -1776.29, -3783.66, 0, 0.122173, 0, 0, 0.0610485, 0.998135, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+40, 180655, 1, -1288.6, -3900.71, 0, 0.174532, 0, 0, 0.0871553, 0.996195, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+41, 180655, 1, -975.692, -3835.2, 0, 4.7473, 0, 0, -0.694658, 0.71934, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+42, 180655, 1, -969.846, -3805.12, 0, 5.68977, 0, 0, -0.292372, 0.956305, 180, 180, 100, 1, 0, 0, 7, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@PTEMPLATE+2, 1, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@PTEMPLATE+3, 1, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@PTEMPLATE+4, 1, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@PTEMPLATE+5, 1, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@PTEMPLATE+6, 1, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@PTEMPLATE+7, 1, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@PTEMPLATE+8, 1, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@PTEMPLATE+9, 1, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@PTEMPLATE+10, 1, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@PTEMPLATE+11, 1, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@PTEMPLATE+12, 1, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@PTEMPLATE+13, 1, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@PTEMPLATE+14, 1, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@PTEMPLATE+15, 1, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@PTEMPLATE+16, 1, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@PTEMPLATE+17, 1, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@PTEMPLATE+18, 1, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@PTEMPLATE+19, 1, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@PTEMPLATE+20, 1, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@PTEMPLATE+21, 1, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+2, @PTEMPLATE+2, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+3, @PTEMPLATE+3, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+4, @PTEMPLATE+4, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+5, @PTEMPLATE+5, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+6, @PTEMPLATE+6, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+7, @PTEMPLATE+7, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+8, @PTEMPLATE+8, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+9, @PTEMPLATE+9, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+10, @PTEMPLATE+10, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+11, @PTEMPLATE+11, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+12, @PTEMPLATE+12, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+13, @PTEMPLATE+13, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+14, @PTEMPLATE+14, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+15, @PTEMPLATE+15, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+16, @PTEMPLATE+16, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+17, @PTEMPLATE+17, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+18, @PTEMPLATE+18, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+19, @PTEMPLATE+19, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+20, @PTEMPLATE+20, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+21, @PTEMPLATE+21, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+22, @PTEMPLATE+1, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+23, @PTEMPLATE+2, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+24, @PTEMPLATE+3, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+25, @PTEMPLATE+4, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+26, @PTEMPLATE+5, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+27, @PTEMPLATE+6, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+28, @PTEMPLATE+7, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+29, @PTEMPLATE+8, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+30, @PTEMPLATE+9, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+31, @PTEMPLATE+10, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+32, @PTEMPLATE+11, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+33, @PTEMPLATE+12, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+34, @PTEMPLATE+13, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+35, @PTEMPLATE+14, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+36, @PTEMPLATE+15, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+37, @PTEMPLATE+16, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+38, @PTEMPLATE+17, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+39, @PTEMPLATE+18, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+40, @PTEMPLATE+19, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+41, @PTEMPLATE+20, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10),
(@OGUID+42, @PTEMPLATE+21, 'Oily Blackmouth School / Floating Wreckage - Barrens', 7, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+22, 8, 'Barrens - Oily Blackmouth School / Floating Wreckage (Master Pool)', 0, 0, 7, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+22, 0, 'Oily Blackmouth School / Floating Wreckage - Barrens', 0),
(@PTEMPLATE+2, @PTEMPLATE+22, 0, 'Oily Blackmouth School / Floating Wreckage - Barrens', 0),
(@PTEMPLATE+3, @PTEMPLATE+22, 0, 'Oily Blackmouth School / Floating Wreckage - Barrens', 0),
(@PTEMPLATE+4, @PTEMPLATE+22, 0, 'Oily Blackmouth School / Floating Wreckage - Barrens', 0),
(@PTEMPLATE+5, @PTEMPLATE+22, 0, 'Oily Blackmouth School / Floating Wreckage - Barrens', 0),
(@PTEMPLATE+6, @PTEMPLATE+22, 0, 'Oily Blackmouth School / Floating Wreckage - Barrens', 0),
(@PTEMPLATE+7, @PTEMPLATE+22, 0, 'Oily Blackmouth School / Floating Wreckage - Barrens', 0),
(@PTEMPLATE+8, @PTEMPLATE+22, 0, 'Oily Blackmouth School / Floating Wreckage - Barrens', 0),
(@PTEMPLATE+9, @PTEMPLATE+22, 0, 'Oily Blackmouth School / Floating Wreckage - Barrens', 0),
(@PTEMPLATE+10, @PTEMPLATE+22, 0, 'Oily Blackmouth School / Floating Wreckage - Barrens', 0),
(@PTEMPLATE+11, @PTEMPLATE+22, 0, 'Oily Blackmouth School / Floating Wreckage - Barrens', 0),
(@PTEMPLATE+12, @PTEMPLATE+22, 0, 'Oily Blackmouth School / Floating Wreckage - Barrens', 0),
(@PTEMPLATE+13, @PTEMPLATE+22, 0, 'Oily Blackmouth School / Floating Wreckage - Barrens', 0),
(@PTEMPLATE+14, @PTEMPLATE+22, 0, 'Oily Blackmouth School / Floating Wreckage - Barrens', 0),
(@PTEMPLATE+15, @PTEMPLATE+22, 0, 'Oily Blackmouth School / Floating Wreckage - Barrens', 0),
(@PTEMPLATE+16, @PTEMPLATE+22, 0, 'Oily Blackmouth School / Floating Wreckage - Barrens', 0),
(@PTEMPLATE+17, @PTEMPLATE+22, 0, 'Oily Blackmouth School / Floating Wreckage - Barrens', 0),
(@PTEMPLATE+18, @PTEMPLATE+22, 0, 'Oily Blackmouth School / Floating Wreckage - Barrens', 0),
(@PTEMPLATE+19, @PTEMPLATE+22, 0, 'Oily Blackmouth School / Floating Wreckage - Barrens', 0),
(@PTEMPLATE+20, @PTEMPLATE+22, 0, 'Oily Blackmouth School / Floating Wreckage - Barrens', 0),
(@PTEMPLATE+21, @PTEMPLATE+22, 0, 'Oily Blackmouth School / Floating Wreckage - Barrens', 0);

UPDATE `pool_gameobject` SET `chance` = 50 WHERE `description` = "Oily Blackmouth School / Floating Wreckage - Barrens" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 180582);
UPDATE `pool_gameobject` SET `chance` = 50 WHERE `description` = "Oily Blackmouth School / Floating Wreckage - Barrens" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 180655);

-- School of Deviate Fish
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+43, 180658, 1, 113.619, -1943.1, 89.6808, 6.12611, 0, 0, -0.0784588, 0.996917, 300, 300, 1, 100, 0, 10),
(@OGUID+44, 180658, 1, -1088.85, -2240.98, 80.1618, 2.04204, 0, 0, 0.85264, 0.522499, 300, 300, 1, 100, 0, 10),
(@OGUID+45, 180658, 1, 19.8286, -1903.19, 89.6808, 0.209439, 0, 0, 0.104528, 0.994522, 300, 300, 1, 100, 0, 10),
(@OGUID+46, 180658, 1, 15.2904, -1948.07, 89.6808, 1.37881, 0, 0, 0.636078, 0.771625, 300, 300, 1, 100, 0, 10),
(@OGUID+47, 180658, 1, -1074.97, -2025.14, 80.1618, 1.5708, 0, 0, 0.707107, 0.707107, 300, 300, 1, 100, 0, 10),
(@OGUID+48, 180658, 1, -1210.28, -2973.53, 87.7131, 3.97935, 0, 0, -0.913545, 0.406738, 300, 300, 1, 100, 0, 10),
(@OGUID+49, 180658, 1, -929.019, -2072.72, 80.1618, 3.61284, 0, 0, -0.972369, 0.233448, 300, 300, 1, 100, 0, 10),
(@OGUID+50, 180658, 1, -1294.98, -3056.88, 87.7131, 2.79252, 0, 0, 0.984807, 0.173652, 300, 300, 1, 100, 0, 10),
(@OGUID+51, 180658, 1, -935.247, -2043.59, 80.1618, 0.523598, 0, 0, 0.258819, 0.965926, 300, 300, 1, 100, 0, 10),
(@OGUID+52, 180658, 1, -1313.39, -3005.07, 87.7131, 4.67748, 0, 0, -0.719339, 0.694659, 300, 300, 1, 100, 0, 10),
(@OGUID+53, 180658, 1, -987.799, -2084.51, 80.1618, 4.71239, 0, 0, -0.707107, 0.707107, 300, 300, 1, 100, 0, 10),
(@OGUID+54, 180658, 1, -1279.27, -2975.28, 87.7131, 2.84488, 0, 0, 0.989016, 0.147811, 300, 300, 1, 100, 0, 10);

UPDATE `gameobject` SET `spawntimesecsmin` = 180, `spawntimesecsmax` = 180, `patch_min` = 7 WHERE `id` = 180658;

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(3292, 6, 'Barrens - School of Deviate Fish', 0, 0, 7, 10);

INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(180658, 3292, 0, 'Barrens - School of Deviate Fish', 0, 7, 10);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
