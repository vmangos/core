DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230627054925');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230627054925');
-- Add your query below.


SET @OGUID = 20127;
SET @PTEMPLATE = 4100;

-- Desolace
DELETE FROM `gameobject` WHERE `guid` IN (32565, 32564, 32563, 32562, 32561, 32560, 32556, 18200, 18206, 18202, 18211, 18225, 50296, 50297);
DELETE FROM `pool_gameobject` WHERE `guid` IN (32565, 32564, 32563, 32562, 32561, 32560, 32556, 18200, 18206, 18202, 18211, 18225, 50296, 50297);
DELETE FROM `pool_template` WHERE `entry` IN (SELECT `pool_entry` FROM `pool_gameobject` WHERE `guid` IN (32565, 32564, 32563, 32562, 32561, 32560, 32556, 18200, 18206, 18202, 18211, 18225, 50296, 50297));

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 180682, 1, -2019.94, 3154.51, 0, -1.64061, 0, 0, 0.731354, -0.681998, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+2, 180682, 1, -1967.56, 3075.03, 0, 0.890118, 0, 0, 0.430511, 0.902585, 900, 900, 100, 1, 0, 0, 7, 10),
(@OGUID+3, 180682, 1, -1932.85, 3071.6, 0, -1.23918, 0, 0, 0.580703, -0.814116, 900, 900, 100, 1, 0, 0, 7, 10),
(@OGUID+4, 180682, 1, -1890.94, 3079.53, 0, 1.55334, 0, 0, 0.700909, 0.71325, 900, 900, 100, 1, 0, 0, 7, 10),
(@OGUID+5, 180682, 1, -1849.59, 3071.28, 0, -1.20428, 0, 0, 0.566406, -0.824126, 900, 900, 100, 1, 0, 0, 7, 10),
(@OGUID+6, 180682, 1, -1819.44, 3065.4, 0, -2.70526, 0, 0, 0.976296, -0.21644, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+7, 180682, 1, -1773.08, 3283.3, 0, 0.645772, 0, 0, 0.317305, 0.948324, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+8, 180682, 1, -1753.47, 3150.17, 0, 1.20428, 0, 0, 0.566406, 0.824126, 900, 900, 100, 1, 0, 0, 7, 10),
(@OGUID+9, 180682, 1, -1746.44, 3268.02, 0, -2.79253, 0, 0, 0.984808, -0.173648, 900, 900, 100, 1, 0, 0, 7, 10),
(@OGUID+10, 180682, 1, -1726.92, 3240.38, 0, 0.541052, 0, 0, 0.267238, 0.96363, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+11, 180682, 1, -270.212, 2531.49, 0, -3.00197, 0, 0, 0.997564, -0.069756, 3600, 3600, 100, 1, 0, 0, 7, 10),
(@OGUID+12, 180682, 1, -232.931, 2502.31, 0, -0.872665, 0, 0, 0.422618, -0.906308, 3600, 3600, 100, 1, 0, 0, 7, 10),
(@OGUID+13, 180682, 1, -206.448, 2473.09, 0, -1.20428, 0, 0, 0.566406, -0.824126, 900, 900, 100, 1, 0, 0, 7, 10),
(@OGUID+14, 180682, 1, -1984.93, 3133.09, 0, 6.00393, 0, 0, -0.139173, 0.990268, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+15, 180682, 1, -1789.15, 3247.44, 0, 4.04917, 0, 0, -0.898793, 0.438373, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+16, 180682, 1, -1754.46, 3176.15, 0, 5.39307, 0, 0, -0.430511, 0.902586, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+17, 180682, 1, -480.88, 2627.41, 0, 0.541051, 0, 0, 0.267238, 0.963631, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+18, 180682, 1, -452.101, 2626.5, 0, 0.436332, 0, 0, 0.216439, 0.976296, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+19, 180682, 1, -391.816, 2625.05, 0, 5.96903, 0, 0, -0.156434, 0.987688, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+20, 180682, 1, -340.662, 2612.61, 0, 2.91469, 0, 0, 0.993571, 0.113208, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+21, 180682, 1, -300.034, 2568.28, 0, 5.8294, 0, 0, -0.224951, 0.97437, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+22, 180683, 1, -2019.94, 3154.51, 0, -1.64061, 0, 0, 0.731354, -0.681998, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+23, 180683, 1, -1967.56, 3075.03, 0, 0.890118, 0, 0, 0.430511, 0.902585, 900, 900, 100, 1, 0, 0, 7, 10),
(@OGUID+24, 180683, 1, -1932.85, 3071.6, 0, -1.23918, 0, 0, 0.580703, -0.814116, 900, 900, 100, 1, 0, 0, 7, 10),
(@OGUID+25, 180683, 1, -1890.94, 3079.53, 0, 1.55334, 0, 0, 0.700909, 0.71325, 900, 900, 100, 1, 0, 0, 7, 10),
(@OGUID+26, 180683, 1, -1849.59, 3071.28, 0, -1.20428, 0, 0, 0.566406, -0.824126, 900, 900, 100, 1, 0, 0, 7, 10),
(@OGUID+27, 180683, 1, -1819.44, 3065.4, 0, -2.70526, 0, 0, 0.976296, -0.21644, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+28, 180683, 1, -1773.08, 3283.3, 0, 0.645772, 0, 0, 0.317305, 0.948324, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+29, 180683, 1, -1753.47, 3150.17, 0, 1.20428, 0, 0, 0.566406, 0.824126, 900, 900, 100, 1, 0, 0, 7, 10),
(@OGUID+30, 180683, 1, -1746.44, 3268.02, 0, -2.79253, 0, 0, 0.984808, -0.173648, 900, 900, 100, 1, 0, 0, 7, 10),
(@OGUID+31, 180683, 1, -1726.92, 3240.38, 0, 0.541052, 0, 0, 0.267238, 0.96363, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+32, 180683, 1, -270.212, 2531.49, 0, -3.00197, 0, 0, 0.997564, -0.069756, 3600, 3600, 100, 1, 0, 0, 7, 10),
(@OGUID+33, 180683, 1, -232.931, 2502.31, 0, -0.872665, 0, 0, 0.422618, -0.906308, 3600, 3600, 100, 1, 0, 0, 7, 10),
(@OGUID+34, 180683, 1, -206.448, 2473.09, 0, -1.20428, 0, 0, 0.566406, -0.824126, 900, 900, 100, 1, 0, 0, 7, 10),
(@OGUID+35, 180683, 1, -1984.93, 3133.09, 0, 6.00393, 0, 0, -0.139173, 0.990268, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+36, 180683, 1, -1789.15, 3247.44, 0, 4.04917, 0, 0, -0.898793, 0.438373, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+37, 180683, 1, -1754.46, 3176.15, 0, 5.39307, 0, 0, -0.430511, 0.902586, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+38, 180683, 1, -480.88, 2627.41, 0, 0.541051, 0, 0, 0.267238, 0.963631, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+39, 180683, 1, -452.101, 2626.5, 0, 0.436332, 0, 0, 0.216439, 0.976296, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+40, 180683, 1, -391.816, 2625.05, 0, 5.96903, 0, 0, -0.156434, 0.987688, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+41, 180683, 1, -340.662, 2612.61, 0, 2.91469, 0, 0, 0.993571, 0.113208, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+42, 180683, 1, -300.034, 2568.28, 0, 5.8294, 0, 0, -0.224951, 0.97437, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+43, 180685, 1, -2019.94, 3154.51, 0, -1.64061, 0, 0, 0.731354, -0.681998, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+44, 180685, 1, -1967.56, 3075.03, 0, 0.890118, 0, 0, 0.430511, 0.902585, 900, 900, 100, 1, 0, 0, 7, 10),
(@OGUID+45, 180685, 1, -1932.85, 3071.6, 0, -1.23918, 0, 0, 0.580703, -0.814116, 900, 900, 100, 1, 0, 0, 7, 10),
(@OGUID+46, 180685, 1, -1890.94, 3079.53, 0, 1.55334, 0, 0, 0.700909, 0.71325, 900, 900, 100, 1, 0, 0, 7, 10),
(@OGUID+47, 180685, 1, -1849.59, 3071.28, 0, -1.20428, 0, 0, 0.566406, -0.824126, 900, 900, 100, 1, 0, 0, 7, 10),
(@OGUID+48, 180685, 1, -1819.44, 3065.4, 0, -2.70526, 0, 0, 0.976296, -0.21644, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+49, 180685, 1, -1773.08, 3283.3, 0, 0.645772, 0, 0, 0.317305, 0.948324, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+50, 180685, 1, -1753.47, 3150.17, 0, 1.20428, 0, 0, 0.566406, 0.824126, 900, 900, 100, 1, 0, 0, 7, 10),
(@OGUID+51, 180685, 1, -1746.44, 3268.02, 0, -2.79253, 0, 0, 0.984808, -0.173648, 900, 900, 100, 1, 0, 0, 7, 10),
(@OGUID+52, 180685, 1, -1726.92, 3240.38, 0, 0.541052, 0, 0, 0.267238, 0.96363, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+53, 180685, 1, -270.212, 2531.49, 0, -3.00197, 0, 0, 0.997564, -0.069756, 3600, 3600, 100, 1, 0, 0, 7, 10),
(@OGUID+54, 180685, 1, -232.931, 2502.31, 0, -0.872665, 0, 0, 0.422618, -0.906308, 3600, 3600, 100, 1, 0, 0, 7, 10),
(@OGUID+55, 180685, 1, -206.448, 2473.09, 0, -1.20428, 0, 0, 0.566406, -0.824126, 900, 900, 100, 1, 0, 0, 7, 10),
(@OGUID+56, 180685, 1, -1984.93, 3133.09, 0, 6.00393, 0, 0, -0.139173, 0.990268, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+57, 180685, 1, -1789.15, 3247.44, 0, 4.04917, 0, 0, -0.898793, 0.438373, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+58, 180685, 1, -1754.46, 3176.15, 0, 5.39307, 0, 0, -0.430511, 0.902586, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+59, 180685, 1, -480.88, 2627.41, 0, 0.541051, 0, 0, 0.267238, 0.963631, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+60, 180685, 1, -452.101, 2626.5, 0, 0.436332, 0, 0, 0.216439, 0.976296, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+61, 180685, 1, -391.816, 2625.05, 0, 5.96903, 0, 0, -0.156434, 0.987688, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+62, 180685, 1, -340.662, 2612.61, 0, 2.91469, 0, 0, 0.993571, 0.113208, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+63, 180685, 1, -300.034, 2568.28, 0, 5.8294, 0, 0, -0.224951, 0.97437, 180, 180, 100, 1, 0, 0, 7, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@PTEMPLATE+2, 1, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@PTEMPLATE+3, 1, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@PTEMPLATE+4, 1, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@PTEMPLATE+5, 1, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@PTEMPLATE+6, 1, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@PTEMPLATE+7, 1, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@PTEMPLATE+8, 1, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@PTEMPLATE+9, 1, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@PTEMPLATE+10, 1, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@PTEMPLATE+11, 1, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@PTEMPLATE+12, 1, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@PTEMPLATE+13, 1, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@PTEMPLATE+14, 1, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@PTEMPLATE+15, 1, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@PTEMPLATE+16, 1, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@PTEMPLATE+17, 1, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@PTEMPLATE+18, 1, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@PTEMPLATE+19, 1, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@PTEMPLATE+20, 1, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@PTEMPLATE+21, 1, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+2, @PTEMPLATE+2, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+3, @PTEMPLATE+3, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+4, @PTEMPLATE+4, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+5, @PTEMPLATE+5, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+6, @PTEMPLATE+6, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+7, @PTEMPLATE+7, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+8, @PTEMPLATE+8, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+9, @PTEMPLATE+9, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+10, @PTEMPLATE+10, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+11, @PTEMPLATE+11, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+12, @PTEMPLATE+12, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+13, @PTEMPLATE+13, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+14, @PTEMPLATE+14, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+15, @PTEMPLATE+15, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+16, @PTEMPLATE+16, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+17, @PTEMPLATE+17, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+18, @PTEMPLATE+18, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+19, @PTEMPLATE+19, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+20, @PTEMPLATE+20, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+21, @PTEMPLATE+21, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+22, @PTEMPLATE+1, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+23, @PTEMPLATE+2, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+24, @PTEMPLATE+3, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+25, @PTEMPLATE+4, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+26, @PTEMPLATE+5, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+27, @PTEMPLATE+6, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+28, @PTEMPLATE+7, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+29, @PTEMPLATE+8, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+30, @PTEMPLATE+9, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+31, @PTEMPLATE+10, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+32, @PTEMPLATE+11, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+33, @PTEMPLATE+12, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+34, @PTEMPLATE+13, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+35, @PTEMPLATE+14, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+36, @PTEMPLATE+15, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+37, @PTEMPLATE+16, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+38, @PTEMPLATE+17, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+39, @PTEMPLATE+18, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+40, @PTEMPLATE+19, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+41, @PTEMPLATE+20, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+42, @PTEMPLATE+21, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+43, @PTEMPLATE+1, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+44, @PTEMPLATE+2, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+45, @PTEMPLATE+3, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+46, @PTEMPLATE+4, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+47, @PTEMPLATE+5, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+48, @PTEMPLATE+6, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+49, @PTEMPLATE+7, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+50, @PTEMPLATE+8, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+51, @PTEMPLATE+9, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+52, @PTEMPLATE+10, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+53, @PTEMPLATE+11, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+54, @PTEMPLATE+12, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+55, @PTEMPLATE+13, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+56, @PTEMPLATE+14, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+57, @PTEMPLATE+15, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+58, @PTEMPLATE+16, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+59, @PTEMPLATE+17, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+60, @PTEMPLATE+18, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+61, @PTEMPLATE+19, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+62, @PTEMPLATE+20, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10),
(@OGUID+63, @PTEMPLATE+21, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 7, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+22, 11, 'Wetlands - Firefin Snapper School / Floating Wreckage / Oily Blackmouth School (Master Pool)', 0, 0, 7, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+22, 0, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 0),
(@PTEMPLATE+2, @PTEMPLATE+22, 0, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 0),
(@PTEMPLATE+3, @PTEMPLATE+22, 0, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 0),
(@PTEMPLATE+4, @PTEMPLATE+22, 0, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 0),
(@PTEMPLATE+5, @PTEMPLATE+22, 0, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 0),
(@PTEMPLATE+6, @PTEMPLATE+22, 0, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 0),
(@PTEMPLATE+7, @PTEMPLATE+22, 0, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 0),
(@PTEMPLATE+8, @PTEMPLATE+22, 0, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 0),
(@PTEMPLATE+9, @PTEMPLATE+22, 0, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 0),
(@PTEMPLATE+10, @PTEMPLATE+22, 0, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 0),
(@PTEMPLATE+11, @PTEMPLATE+22, 0, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 0),
(@PTEMPLATE+12, @PTEMPLATE+22, 0, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 0),
(@PTEMPLATE+13, @PTEMPLATE+22, 0, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 0),
(@PTEMPLATE+14, @PTEMPLATE+22, 0, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 0),
(@PTEMPLATE+15, @PTEMPLATE+22, 0, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 0),
(@PTEMPLATE+16, @PTEMPLATE+22, 0, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 0),
(@PTEMPLATE+17, @PTEMPLATE+22, 0, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 0),
(@PTEMPLATE+18, @PTEMPLATE+22, 0, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 0),
(@PTEMPLATE+19, @PTEMPLATE+22, 0, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 0),
(@PTEMPLATE+20, @PTEMPLATE+22, 0, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 0),
(@PTEMPLATE+21, @PTEMPLATE+22, 0, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace', 0);

UPDATE `pool_gameobject` SET `chance` = 30 WHERE `description` = "Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 180682);
UPDATE `pool_gameobject` SET `chance` = 60 WHERE `description` = "Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 180683);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Desolace" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 180685);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
