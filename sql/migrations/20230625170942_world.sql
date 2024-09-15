DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230625170942');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230625170942');
-- Add your query below.


SET @OGUID = 27473;
SET @PTEMPLATE = 3691;

-- Alterac Mountains
DELETE FROM `gameobject` WHERE `guid` IN (35466, 33300, 33284, 33212, 33211, 33210, 33209, 32191, 47425, 47426, 47427, 47431, 47432, 47461, 47462, 50342, 50343, 50345);
DELETE FROM `pool_gameobject` WHERE `guid` IN (35466, 33300, 33284, 33212, 33211, 33210, 33209, 32191, 47425, 47426, 47427, 47431, 47432, 47461, 47462, 50342, 50343, 50345);
DELETE FROM `pool_template` WHERE `entry` IN (SELECT `pool_entry` FROM `pool_gameobject` WHERE `guid` IN (35466, 33300, 33284, 33212, 33211, 33210, 33209, 32191, 47425, 47426, 47427, 47431, 47432, 47461, 47462, 50342, 50343, 50345));

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 180684, 0, 486.771, 409.1, 32.934, -0.575959, 0, 0, 0.284015, -0.95882, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+2, 180684, 0, 515.198, 365.689, 32.934, 1.37881, 0, 0, 0.636078, 0.771625, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+3, 180684, 0, 525.774, 296.498, 32.934, 1.79769, 0, 0, 0.782608, 0.622515, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+4, 180684, 0, 577.045, 227.188, 32.934, -2.74017, 0, 0, 0.979925, -0.199368, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+5, 180684, 0, 667.415, 130.111, 32.934, 2.49582, 0, 0, 0.948324, 0.317305, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+6, 180684, 0, 744.693, 8.48069, 32.934, -0.436333, 0, 0, 0.21644, -0.976296, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+7, 180684, 0, 794.327, -35.3443, 32.4959, -1.46608, 0, 0, 0.669131, -0.743145, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+8, 180684, 0, 843.119, -66.724, 32.9309, 1.48353, 0, 0, 0.67559, 0.737277, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+9, 180684, 0, 903.772, -82.2748, 32.9309, -2.51327, 0, 0, 0.951057, -0.309017, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+10, 180684, 0, 994.35, -169.237, 32.9309, -2.94961, 0, 0, 0.995396, -0.095846, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+11, 180684, 0, 1055.86, -208.246, 32.9309, 1.85005, 0, 0, 0.798636, 0.601815, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+12, 180684, 0, 1144.03, -244.238, 32.9309, -2.93215, 0, 0, 0.994522, -0.104529, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+13, 180684, 0, 1188.74, -247.037, 32.9309, -3.12414, 0, 0, 0.999962, -0.008727, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+14, 180684, 0, 1210.71, -235.344, 32.9309, -2.94961, 0, 0, 0.995396, -0.095846, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+15, 180684, 0, 1245.56, -204.805, 32.2924, 0.733038, 0, 0, 0.358368, 0.93358, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+16, 180684, 0, 534.866, 264.069, 32.934, 1.71042, 0, 0, 0.754709, 0.656059, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+17, 180684, 0, 903.546, -85.4035, 32.9309, 3.76991, 0, 0, -0.951056, 0.309017, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+18, 180684, 0, 916.189, -95.1171, 32.1471, 4.72984, 0, 0, -0.700909, 0.713251, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+19, 180684, 0, 943.365, -117.651, 32.4114, 2.96704, 0, 0, 0.996194, 0.087165, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+20, 180684, 0, 1308.22, -158.535, 32.9309, 0.872664, 0, 0, 0.422618, 0.906308, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+21, 180684, 0, 1319.81, -142.05, 32.9309, 3.75246, 0, 0, -0.953716, 0.300708, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+22, 180684, 0, 472.258, 465.116, 32.934, 0.488691, 0, 0, 0.241921, 0.970296, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+23, 180685, 0, 486.771, 409.1, 32.934, -0.575959, 0, 0, 0.284015, -0.95882, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+24, 180685, 0, 515.198, 365.689, 32.934, 1.37881, 0, 0, 0.636078, 0.771625, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+25, 180685, 0, 525.774, 296.498, 32.934, 1.79769, 0, 0, 0.782608, 0.622515, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+26, 180685, 0, 577.045, 227.188, 32.934, -2.74017, 0, 0, 0.979925, -0.199368, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+27, 180685, 0, 667.415, 130.111, 32.934, 2.49582, 0, 0, 0.948324, 0.317305, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+28, 180685, 0, 744.693, 8.48069, 32.934, -0.436333, 0, 0, 0.21644, -0.976296, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+29, 180685, 0, 794.327, -35.3443, 32.4959, -1.46608, 0, 0, 0.669131, -0.743145, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+30, 180685, 0, 843.119, -66.724, 32.9309, 1.48353, 0, 0, 0.67559, 0.737277, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+31, 180685, 0, 903.772, -82.2748, 32.9309, -2.51327, 0, 0, 0.951057, -0.309017, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+32, 180685, 0, 994.35, -169.237, 32.9309, -2.94961, 0, 0, 0.995396, -0.095846, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+33, 180685, 0, 1055.86, -208.246, 32.9309, 1.85005, 0, 0, 0.798636, 0.601815, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+34, 180685, 0, 1144.03, -244.238, 32.9309, -2.93215, 0, 0, 0.994522, -0.104529, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+35, 180685, 0, 1188.74, -247.037, 32.9309, -3.12414, 0, 0, 0.999962, -0.008727, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+36, 180685, 0, 1210.71, -235.344, 32.9309, -2.94961, 0, 0, 0.995396, -0.095846, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+37, 180685, 0, 1245.56, -204.805, 32.2924, 0.733038, 0, 0, 0.358368, 0.93358, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+38, 180685, 0, 534.866, 264.069, 32.934, 1.71042, 0, 0, 0.754709, 0.656059, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+39, 180685, 0, 903.546, -85.4035, 32.9309, 3.76991, 0, 0, -0.951056, 0.309017, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+40, 180685, 0, 916.189, -95.1171, 32.1471, 4.72984, 0, 0, -0.700909, 0.713251, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+41, 180685, 0, 943.365, -117.651, 32.4114, 2.96704, 0, 0, 0.996194, 0.087165, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+42, 180685, 0, 1308.22, -158.535, 32.9309, 0.872664, 0, 0, 0.422618, 0.906308, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+43, 180685, 0, 1319.81, -142.05, 32.9309, 3.75246, 0, 0, -0.953716, 0.300708, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+44, 180685, 0, 472.258, 465.116, 32.934, 0.488691, 0, 0, 0.241921, 0.970296, 180, 180, 100, 1, 0, 0, 7, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@PTEMPLATE+2, 1, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@PTEMPLATE+3, 1, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@PTEMPLATE+4, 1, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@PTEMPLATE+5, 1, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@PTEMPLATE+6, 1, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@PTEMPLATE+7, 1, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@PTEMPLATE+8, 1, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@PTEMPLATE+9, 1, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@PTEMPLATE+10, 1, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@PTEMPLATE+11, 1, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@PTEMPLATE+12, 1, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@PTEMPLATE+13, 1, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@PTEMPLATE+14, 1, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@PTEMPLATE+15, 1, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@PTEMPLATE+16, 1, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@PTEMPLATE+17, 1, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@PTEMPLATE+18, 1, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@PTEMPLATE+19, 1, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@PTEMPLATE+20, 1, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@PTEMPLATE+21, 1, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@PTEMPLATE+22, 1, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@OGUID+2, @PTEMPLATE+2, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@OGUID+3, @PTEMPLATE+3, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@OGUID+4, @PTEMPLATE+4, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@OGUID+5, @PTEMPLATE+5, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@OGUID+6, @PTEMPLATE+6, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@OGUID+7, @PTEMPLATE+7, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@OGUID+8, @PTEMPLATE+8, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@OGUID+9, @PTEMPLATE+9, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@OGUID+10, @PTEMPLATE+10, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@OGUID+11, @PTEMPLATE+11, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@OGUID+12, @PTEMPLATE+12, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@OGUID+13, @PTEMPLATE+13, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@OGUID+14, @PTEMPLATE+14, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@OGUID+15, @PTEMPLATE+15, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@OGUID+16, @PTEMPLATE+16, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@OGUID+17, @PTEMPLATE+17, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@OGUID+18, @PTEMPLATE+18, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@OGUID+19, @PTEMPLATE+19, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@OGUID+20, @PTEMPLATE+20, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@OGUID+21, @PTEMPLATE+21, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@OGUID+22, @PTEMPLATE+22, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@OGUID+23, @PTEMPLATE+1, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@OGUID+24, @PTEMPLATE+2, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@OGUID+25, @PTEMPLATE+3, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@OGUID+26, @PTEMPLATE+4, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@OGUID+27, @PTEMPLATE+5, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@OGUID+28, @PTEMPLATE+6, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@OGUID+29, @PTEMPLATE+7, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@OGUID+30, @PTEMPLATE+8, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@OGUID+31, @PTEMPLATE+9, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@OGUID+32, @PTEMPLATE+10, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@OGUID+33, @PTEMPLATE+11, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@OGUID+34, @PTEMPLATE+12, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@OGUID+35, @PTEMPLATE+13, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@OGUID+36, @PTEMPLATE+14, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@OGUID+37, @PTEMPLATE+15, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@OGUID+38, @PTEMPLATE+16, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@OGUID+39, @PTEMPLATE+17, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@OGUID+40, @PTEMPLATE+18, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@OGUID+41, @PTEMPLATE+19, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@OGUID+42, @PTEMPLATE+20, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@OGUID+43, @PTEMPLATE+21, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10),
(@OGUID+44, @PTEMPLATE+22, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 7, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+23, 9, 'Alterac Mountains - Greater Sagefish School / Floating Wreckage (Master Pool)', 0, 0, 7, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+23, 0, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 0),
(@PTEMPLATE+2, @PTEMPLATE+23, 0, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 0),
(@PTEMPLATE+3, @PTEMPLATE+23, 0, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 0),
(@PTEMPLATE+4, @PTEMPLATE+23, 0, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 0),
(@PTEMPLATE+5, @PTEMPLATE+23, 0, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 0),
(@PTEMPLATE+6, @PTEMPLATE+23, 0, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 0),
(@PTEMPLATE+7, @PTEMPLATE+23, 0, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 0),
(@PTEMPLATE+8, @PTEMPLATE+23, 0, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 0),
(@PTEMPLATE+9, @PTEMPLATE+23, 0, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 0),
(@PTEMPLATE+10, @PTEMPLATE+23, 0, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 0),
(@PTEMPLATE+11, @PTEMPLATE+23, 0, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 0),
(@PTEMPLATE+12, @PTEMPLATE+23, 0, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 0),
(@PTEMPLATE+13, @PTEMPLATE+23, 0, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 0),
(@PTEMPLATE+14, @PTEMPLATE+23, 0, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 0),
(@PTEMPLATE+15, @PTEMPLATE+23, 0, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 0),
(@PTEMPLATE+16, @PTEMPLATE+23, 0, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 0),
(@PTEMPLATE+17, @PTEMPLATE+23, 0, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 0),
(@PTEMPLATE+18, @PTEMPLATE+23, 0, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 0),
(@PTEMPLATE+19, @PTEMPLATE+23, 0, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 0),
(@PTEMPLATE+20, @PTEMPLATE+23, 0, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 0),
(@PTEMPLATE+21, @PTEMPLATE+23, 0, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 0),
(@PTEMPLATE+22, @PTEMPLATE+23, 0, 'Greater Sagefish School / Floating Wreckage - Alterac Mountains', 0);

UPDATE `pool_gameobject` SET `chance` = 80 WHERE `description` = "Greater Sagefish School / Floating Wreckage - Alterac Mountains" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 180684);
UPDATE `pool_gameobject` SET `chance` = 20 WHERE `description` = "Greater Sagefish School / Floating Wreckage - Alterac Mountains" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 180685);

DELETE FROM `gameobject` WHERE `guid` IN (27504, 27482);
DELETE FROM `pool_gameobject` WHERE `guid` IN (27504, 27482);
DELETE FROM `pool_template` WHERE `entry` = 3700;
DELETE FROM `pool_pool` WHERE `pool_id` = 3700;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
