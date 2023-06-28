DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230625113954');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230625113954');
-- Add your query below.


SET @OGUID = 19334;
SET @PTEMPLATE = 2416;

-- Azshara
DELETE FROM `gameobject` WHERE `guid` IN (18086, 18284, 18067, 18084, 18122, 18284, 18293, 48230, 48231, 48232, 48233, 48451);
DELETE FROM `pool_gameobject` WHERE `pool_entry` IN (18086, 18284, 18067, 18084, 18122, 18284, 18293, 48230, 48231, 48232, 48233, 48451);
DELETE FROM `pool_template` WHERE `entry` IN (SELECT `pool_entry` FROM `pool_gameobject` WHERE `guid` IN (18086, 18284, 18067, 18084, 18122, 18284, 18293, 48230, 48231, 48232, 48233, 48451));

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 180712, 1, 2959.22, -6004.52, 0, -1.53589, 0, 0, 0.694658, -0.71934, 180, 180, 100, 1, 0, 0, 9, 10),
(@OGUID+2, 180712, 1, 3612.69, -5743.88, 0, -2.93215, 0, 0, 0.994522, -0.104529, 180, 180, 100, 1, 0, 0, 9, 10),
(@OGUID+3, 180712, 1, 3875.84, -5796.33, 0, -0.087267, 0, 0, 0.04362, -0.999048, 180, 180, 100, 1, 0, 0, 9, 10),
(@OGUID+4, 180712, 1, 3333.88, -5834.96, 0, 0.15708, 0, 0, 0.078459, 0.996917, 180, 180, 100, 1, 0, 0, 9, 10),
(@OGUID+5, 180712, 1, 3960.55, -5921.98, 0, 1.97222, 0, 0, 0.833886, 0.551937, 180, 180, 100, 1, 0, 0, 9, 10),
(@OGUID+6, 180712, 1, 3254.9, -5812.65, 0, -2.58309, 0, 0, 0.961262, -0.275637, 180, 180, 100, 1, 0, 0, 9, 10),
(@OGUID+7, 180712, 1, 3453.5, -5820.57, 0, 1.64061, 0, 0, 0.731354, 0.681998, 180, 180, 100, 1, 0, 0, 9, 10),
(@OGUID+8, 180712, 1, 3638.11, -6042.03, 0, 1.91986, 0, 0, 0.819152, 0.573576, 180, 180, 100, 1, 0, 0, 9, 10),
(@OGUID+9, 180712, 1, 2969.99, -6115.76, 0, -0.017453, 0, 0, 0.008727, -0.999962, 180, 180, 100, 1, 0, 0, 9, 10),
(@OGUID+10, 180712, 1, 3165.24, -5838.86, 0, -1.64061, 0, 0, 0.731354, -0.681998, 180, 180, 100, 1, 0, 0, 9, 10),
(@OGUID+11, 180712, 1, 3011.61, -6056.23, 0, 4.7822, 0, 0, -0.681998, 0.731354, 180, 180, 100, 0, 0, 0, 9, 10),
(@OGUID+12, 180712, 1, 3372.06, -5999.89, 0, 1.09956, 0, 0, 0.522498, 0.85264, 180, 180, 100, 0, 0, 0, 9, 10),
(@OGUID+13, 180712, 1, 3530.68, -5894.45, 0, 5.81195, 0, 0, -0.233445, 0.97237, 180, 180, 100, 0, 0, 0, 9, 10),
(@OGUID+14, 180712, 1, 3665.53, -5933.02, 0, 2.61799, 0, 0, 0.965925, 0.258821, 180, 180, 100, 0, 0, 0, 9, 10),
(@OGUID+15, 180712, 1, 3727.71, -5777.92, 0, 3.03684, 0, 0, 0.998629, 0.0523532, 180, 180, 100, 0, 0, 0, 9, 10),
(@OGUID+16, 180712, 1, 3785.95, -5740.7, 0, 3.12412, 0, 0, 0.999962, 0.00873464, 180, 180, 100, 0, 0, 0, 9, 10),
(@OGUID+17, 180750, 1, 2959.22, -6004.52, 0, -1.53589, 0, 0, 0.694658, -0.71934, 180, 180, 100, 1, 0, 0, 9, 10),
(@OGUID+18, 180750, 1, 3612.69, -5743.88, 0, -2.93215, 0, 0, 0.994522, -0.104529, 180, 180, 100, 1, 0, 0, 9, 10),
(@OGUID+19, 180750, 1, 3875.84, -5796.33, 0, -0.087267, 0, 0, 0.04362, -0.999048, 180, 180, 100, 1, 0, 0, 9, 10),
(@OGUID+20, 180750, 1, 3333.88, -5834.96, 0, 0.15708, 0, 0, 0.078459, 0.996917, 180, 180, 100, 1, 0, 0, 9, 10),
(@OGUID+21, 180750, 1, 3960.55, -5921.98, 0, 1.97222, 0, 0, 0.833886, 0.551937, 180, 180, 100, 1, 0, 0, 9, 10),
(@OGUID+22, 180750, 1, 3254.9, -5812.65, 0, -2.58309, 0, 0, 0.961262, -0.275637, 180, 180, 100, 1, 0, 0, 9, 10),
(@OGUID+23, 180750, 1, 3453.5, -5820.57, 0, 1.64061, 0, 0, 0.731354, 0.681998, 180, 180, 100, 1, 0, 0, 9, 10),
(@OGUID+24, 180750, 1, 3638.11, -6042.03, 0, 1.91986, 0, 0, 0.819152, 0.573576, 180, 180, 100, 1, 0, 0, 9, 10),
(@OGUID+25, 180750, 1, 2969.99, -6115.76, 0, -0.017453, 0, 0, 0.008727, -0.999962, 180, 180, 100, 1, 0, 0, 9, 10),
(@OGUID+26, 180750, 1, 3165.24, -5838.86, 0, -1.64061, 0, 0, 0.731354, -0.681998, 180, 180, 100, 1, 0, 0, 9, 10),
(@OGUID+27, 180750, 1, 3011.61, -6056.23, 0, 4.7822, 0, 0, -0.681998, 0.731354, 180, 180, 100, 0, 0, 0, 9, 10),
(@OGUID+28, 180750, 1, 3372.06, -5999.89, 0, 1.09956, 0, 0, 0.522498, 0.85264, 180, 180, 100, 0, 0, 0, 9, 10),
(@OGUID+29, 180750, 1, 3530.68, -5894.45, 0, 5.81195, 0, 0, -0.233445, 0.97237, 180, 180, 100, 0, 0, 0, 9, 10),
(@OGUID+30, 180750, 1, 3665.53, -5933.02, 0, 2.61799, 0, 0, 0.965925, 0.258821, 180, 180, 100, 0, 0, 0, 9, 10),
(@OGUID+31, 180750, 1, 3727.71, -5777.92, 0, 3.03684, 0, 0, 0.998629, 0.0523532, 180, 180, 100, 0, 0, 0, 9, 10),
(@OGUID+32, 180750, 1, 3785.95, -5740.7, 0, 3.12412, 0, 0, 0.999962, 0.00873464, 180, 180, 100, 0, 0, 0, 9, 10),
(@OGUID+33, 180751, 1, 2959.22, -6004.52, 0, -1.53589, 0, 0, 0.694658, -0.71934, 180, 180, 100, 1, 0, 0, 9, 10),
(@OGUID+34, 180751, 1, 3612.69, -5743.88, 0, -2.93215, 0, 0, 0.994522, -0.104529, 180, 180, 100, 1, 0, 0, 9, 10),
(@OGUID+35, 180751, 1, 3875.84, -5796.33, 0, -0.087267, 0, 0, 0.04362, -0.999048, 180, 180, 100, 1, 0, 0, 9, 10),
(@OGUID+36, 180751, 1, 3333.88, -5834.96, 0, 0.15708, 0, 0, 0.078459, 0.996917, 180, 180, 100, 1, 0, 0, 9, 10),
(@OGUID+37, 180751, 1, 3960.55, -5921.98, 0, 1.97222, 0, 0, 0.833886, 0.551937, 180, 180, 100, 1, 0, 0, 9, 10),
(@OGUID+38, 180751, 1, 3254.9, -5812.65, 0, -2.58309, 0, 0, 0.961262, -0.275637, 180, 180, 100, 1, 0, 0, 9, 10),
(@OGUID+39, 180751, 1, 3453.5, -5820.57, 0, 1.64061, 0, 0, 0.731354, 0.681998, 180, 180, 100, 1, 0, 0, 9, 10),
(@OGUID+40, 180751, 1, 3638.11, -6042.03, 0, 1.91986, 0, 0, 0.819152, 0.573576, 180, 180, 100, 1, 0, 0, 9, 10),
(@OGUID+41, 180751, 1, 2969.99, -6115.76, 0, -0.017453, 0, 0, 0.008727, -0.999962, 180, 180, 100, 1, 0, 0, 9, 10),
(@OGUID+42, 180751, 1, 3165.24, -5838.86, 0, -1.64061, 0, 0, 0.731354, -0.681998, 180, 180, 100, 1, 0, 0, 9, 10),
(@OGUID+43, 180751, 1, 3011.61, -6056.23, 0, 4.7822, 0, 0, -0.681998, 0.731354, 180, 180, 100, 0, 0, 0, 9, 10),
(@OGUID+44, 180751, 1, 3372.06, -5999.89, 0, 1.09956, 0, 0, 0.522498, 0.85264, 180, 180, 100, 0, 0, 0, 9, 10),
(@OGUID+45, 180751, 1, 3530.68, -5894.45, 0, 5.81195, 0, 0, -0.233445, 0.97237, 180, 180, 100, 0, 0, 0, 9, 10),
(@OGUID+46, 180751, 1, 3665.53, -5933.02, 0, 2.61799, 0, 0, 0.965925, 0.258821, 180, 180, 100, 0, 0, 0, 9, 10),
(@OGUID+47, 180751, 1, 3727.71, -5777.92, 0, 3.03684, 0, 0, 0.998629, 0.0523532, 180, 180, 100, 0, 0, 0, 9, 10),
(@OGUID+48, 180751, 1, 3785.95, -5740.7, 0, 3.12412, 0, 0, 0.999962, 0.00873464, 180, 180, 100, 0, 0, 0, 9, 10),
(@OGUID+49, 180752, 1, 2959.22, -6004.52, 0, -1.53589, 0, 0, 0.694658, -0.71934, 180, 180, 100, 1, 0, 0, 9, 10),
(@OGUID+50, 180752, 1, 3612.69, -5743.88, 0, -2.93215, 0, 0, 0.994522, -0.104529, 180, 180, 100, 1, 0, 0, 9, 10),
(@OGUID+51, 180752, 1, 3875.84, -5796.33, 0, -0.087267, 0, 0, 0.04362, -0.999048, 180, 180, 100, 1, 0, 0, 9, 10),
(@OGUID+52, 180752, 1, 3333.88, -5834.96, 0, 0.15708, 0, 0, 0.078459, 0.996917, 180, 180, 100, 1, 0, 0, 9, 10),
(@OGUID+53, 180752, 1, 3960.55, -5921.98, 0, 1.97222, 0, 0, 0.833886, 0.551937, 180, 180, 100, 1, 0, 0, 9, 10),
(@OGUID+54, 180752, 1, 3254.9, -5812.65, 0, -2.58309, 0, 0, 0.961262, -0.275637, 180, 180, 100, 1, 0, 0, 9, 10),
(@OGUID+55, 180752, 1, 3453.5, -5820.57, 0, 1.64061, 0, 0, 0.731354, 0.681998, 180, 180, 100, 1, 0, 0, 9, 10),
(@OGUID+56, 180752, 1, 3638.11, -6042.03, 0, 1.91986, 0, 0, 0.819152, 0.573576, 180, 180, 100, 1, 0, 0, 9, 10),
(@OGUID+57, 180752, 1, 2969.99, -6115.76, 0, -0.017453, 0, 0, 0.008727, -0.999962, 180, 180, 100, 1, 0, 0, 9, 10),
(@OGUID+58, 180752, 1, 3165.24, -5838.86, 0, -1.64061, 0, 0, 0.731354, -0.681998, 180, 180, 100, 1, 0, 0, 9, 10),
(@OGUID+59, 180752, 1, 3011.61, -6056.23, 0, 4.7822, 0, 0, -0.681998, 0.731354, 180, 180, 100, 0, 0, 0, 9, 10),
(@OGUID+60, 180752, 1, 3372.06, -5999.89, 0, 1.09956, 0, 0, 0.522498, 0.85264, 180, 180, 100, 0, 0, 0, 9, 10),
(@OGUID+61, 180752, 1, 3530.68, -5894.45, 0, 5.81195, 0, 0, -0.233445, 0.97237, 180, 180, 100, 0, 0, 0, 9, 10),
(@OGUID+62, 180752, 1, 3665.53, -5933.02, 0, 2.61799, 0, 0, 0.965925, 0.258821, 180, 180, 100, 0, 0, 0, 9, 10),
(@OGUID+63, 180752, 1, 3727.71, -5777.92, 0, 3.03684, 0, 0, 0.998629, 0.0523532, 180, 180, 100, 0, 0, 0, 9, 10),
(@OGUID+64, 180752, 1, 3785.95, -5740.7, 0, 3.12412, 0, 0, 0.999962, 0.00873464, 180, 180, 100, 0, 0, 0, 9, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@PTEMPLATE+2, 1, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@PTEMPLATE+3, 1, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@PTEMPLATE+4, 1, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@PTEMPLATE+5, 1, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@PTEMPLATE+6, 1, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@PTEMPLATE+7, 1, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@PTEMPLATE+8, 1, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@PTEMPLATE+9, 1, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@PTEMPLATE+10, 1, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@PTEMPLATE+11, 1, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@PTEMPLATE+12, 1, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@PTEMPLATE+13, 1, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@PTEMPLATE+14, 1, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@PTEMPLATE+15, 1, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@PTEMPLATE+16, 1, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+2, @PTEMPLATE+2, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+3, @PTEMPLATE+3, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+4, @PTEMPLATE+4, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+5, @PTEMPLATE+5, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+6, @PTEMPLATE+6, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+7, @PTEMPLATE+7, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+8, @PTEMPLATE+8, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+9, @PTEMPLATE+9, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+10, @PTEMPLATE+10, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+11, @PTEMPLATE+11, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+12, @PTEMPLATE+12, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+13, @PTEMPLATE+13, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+14, @PTEMPLATE+14, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+15, @PTEMPLATE+15, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+16, @PTEMPLATE+16, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+17, @PTEMPLATE+1, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+18, @PTEMPLATE+2, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+19, @PTEMPLATE+3, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+20, @PTEMPLATE+4, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+21, @PTEMPLATE+5, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+22, @PTEMPLATE+6, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+23, @PTEMPLATE+7, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+24, @PTEMPLATE+8, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+25, @PTEMPLATE+9, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+26, @PTEMPLATE+10, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+27, @PTEMPLATE+11, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+28, @PTEMPLATE+12, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+29, @PTEMPLATE+13, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+30, @PTEMPLATE+14, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+31, @PTEMPLATE+15, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+32, @PTEMPLATE+16, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+33, @PTEMPLATE+1, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+34, @PTEMPLATE+2, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+35, @PTEMPLATE+3, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+36, @PTEMPLATE+4, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+37, @PTEMPLATE+5, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+38, @PTEMPLATE+6, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+39, @PTEMPLATE+7, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+40, @PTEMPLATE+8, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+41, @PTEMPLATE+9, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+42, @PTEMPLATE+10, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+43, @PTEMPLATE+11, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+44, @PTEMPLATE+12, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+45, @PTEMPLATE+13, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+46, @PTEMPLATE+14, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+47, @PTEMPLATE+15, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+48, @PTEMPLATE+16, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+49, @PTEMPLATE+1, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+50, @PTEMPLATE+2, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+51, @PTEMPLATE+3, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+52, @PTEMPLATE+4, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+53, @PTEMPLATE+5, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+54, @PTEMPLATE+6, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+55, @PTEMPLATE+7, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+56, @PTEMPLATE+8, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+57, @PTEMPLATE+9, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+58, @PTEMPLATE+10, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+59, @PTEMPLATE+11, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+60, @PTEMPLATE+12, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+61, @PTEMPLATE+13, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+62, @PTEMPLATE+14, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+63, @PTEMPLATE+15, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10),
(@OGUID+64, @PTEMPLATE+16, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 9, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+17, 6, 'Azshara - Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School (Master Pool)', 0, 0, 9, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+17, 0, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 0),
(@PTEMPLATE+2, @PTEMPLATE+17, 0, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 0),
(@PTEMPLATE+3, @PTEMPLATE+17, 0, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 0),
(@PTEMPLATE+4, @PTEMPLATE+17, 0, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 0),
(@PTEMPLATE+5, @PTEMPLATE+17, 0, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 0),
(@PTEMPLATE+6, @PTEMPLATE+17, 0, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 0),
(@PTEMPLATE+7, @PTEMPLATE+17, 0, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 0),
(@PTEMPLATE+8, @PTEMPLATE+17, 0, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 0),
(@PTEMPLATE+9, @PTEMPLATE+17, 0, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 0),
(@PTEMPLATE+10, @PTEMPLATE+17, 0, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 0),
(@PTEMPLATE+11, @PTEMPLATE+17, 0, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 0),
(@PTEMPLATE+12, @PTEMPLATE+17, 0, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 0),
(@PTEMPLATE+13, @PTEMPLATE+17, 0, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 0),
(@PTEMPLATE+14, @PTEMPLATE+17, 0, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 0),
(@PTEMPLATE+15, @PTEMPLATE+17, 0, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 0),
(@PTEMPLATE+16, @PTEMPLATE+17, 0, 'Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara', 0);

UPDATE `pool_gameobject` SET `chance` = 30 WHERE `description` = "Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 180712);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 180750);
UPDATE `pool_gameobject` SET `chance` = 20 WHERE `description` = "Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 180751);
UPDATE `pool_gameobject` SET `chance` = 40 WHERE `description` = "Stonescale Eel Swarm / Oily Blackmouth School / Floating Wreckage / Firefin Snapper School - Azshara" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 180752);

-- Patch of Elemental Water
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+65, 180753, 1, 4022.64, -6045.29, 0, 1.85005, 0, 0, 0.798635, 0.601815, 1800, 1800, 1, 100, 7, 10);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
