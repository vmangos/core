DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230704203038');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230704203038');
-- Add your query below.


SET @OGUID = 19109;
SET @PTEMPLATE = 2974;

-- 36 Alterac Mountains 3659 / 3695 / Barrel of Melon Juice / Food Crate
DELETE FROM `pool_template` WHERE `entry` IN (SELECT `pool_entry` FROM `pool_gameobject` WHERE `guid` IN (31337, 32116, 32118, 32176, 32186, 32192, 32205, 32212, 32280, 33142, 33167, 33194));
DELETE FROM `gameobject` WHERE `guid` IN (31337, 32116, 32118, 32176, 32186, 32192, 32205, 32212, 32280, 33142, 33167, 33194);
DELETE FROM `pool_gameobject` WHERE `guid` IN (31337, 32116, 32118, 32176, 32186, 32192, 32205, 32212, 32280, 33142, 33167, 33194);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 3659, 0, -100.047, 242.911, 55.215, -2.40855, 0, 0, 0.93358, -0.358368, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 3659, 0, 177.03, 217.541, 41.3711, -1.64061, 0, 0, 0.731354, -0.681998, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 3659, 0, 375.083, 148.578, 43.1998, -1.50098, 0, 0, 0.681998, -0.731354, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 3659, 0, -104.625, 212.555, 53.2755, 4.41568, 0, 0, -0.803857, 0.594823, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 3659, 0, -46.0892, -553.574, 151.201, 2.19911, 0, 0, 0.891006, 0.453991, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 3659, 0, -45.2862, 279.218, 66.0425, 2.93214, 0, 0, 0.994521, 0.104536, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 3659, 0, -38.9078, 260.841, 52.5001, 1.85005, 0, 0, 0.798635, 0.601815, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 3659, 0, 23.9243, 460.491, 43.341, 1.69297, 0, 0, 0.748956, 0.66262, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 3659, 0, 40.4733, 385.092, 43.038, 3.24635, 0, 0, -0.998629, 0.0523532, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 3659, 0, 105.517, 252.718, 43.3436, 2.25147, 0, 0, 0.902585, 0.430512, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 3659, 0, 224.48, -845.526, 146.664, 2.44346, 0, 0, 0.939692, 0.34202, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 3659, 0, 311.113, 188.194, 42.8525, 1.02974, 0, 0, 0.492423, 0.870356, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 3659, 0, 410.113, -964.287, 110.628, 5.98648, 0, 0, -0.147809, 0.989016, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 3659, 0, 433.688, 299.946, 41.9656, 4.83456, 0, 0, -0.66262, 0.748956, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 3659, 0, 504.21, 203.678, 43.1053, 1.95477, 0, 0, 0.829038, 0.559193, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 3695, 0, -100.047, 242.911, 55.215, -2.40855, 0, 0, 0.93358, -0.358368, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 3695, 0, 177.03, 217.541, 41.3711, -1.64061, 0, 0, 0.731354, -0.681998, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 3695, 0, 375.083, 148.578, 43.1998, -1.50098, 0, 0, 0.681998, -0.731354, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 3695, 0, -104.625, 212.555, 53.2755, 4.41568, 0, 0, -0.803857, 0.594823, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 3695, 0, -46.0892, -553.574, 151.201, 2.19911, 0, 0, 0.891006, 0.453991, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 3695, 0, -45.2862, 279.218, 66.0425, 2.93214, 0, 0, 0.994521, 0.104536, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 3695, 0, -38.9078, 260.841, 52.5001, 1.85005, 0, 0, 0.798635, 0.601815, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 3695, 0, 23.9243, 460.491, 43.341, 1.69297, 0, 0, 0.748956, 0.66262, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 3695, 0, 40.4733, 385.092, 43.038, 3.24635, 0, 0, -0.998629, 0.0523532, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 3695, 0, 105.517, 252.718, 43.3436, 2.25147, 0, 0, 0.902585, 0.430512, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 3695, 0, 224.48, -845.526, 146.664, 2.44346, 0, 0, 0.939692, 0.34202, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 3695, 0, 311.113, 188.194, 42.8525, 1.02974, 0, 0, 0.492423, 0.870356, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 3695, 0, 410.113, -964.287, 110.628, 5.98648, 0, 0, -0.147809, 0.989016, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+29, 3695, 0, 433.688, 299.946, 41.9656, 4.83456, 0, 0, -0.66262, 0.748956, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+30, 3695, 0, 504.21, 203.678, 43.1053, 1.95477, 0, 0, 0.829038, 0.559193, 180, 180, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0, 10),
(@PTEMPLATE+2, 1, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0, 10),
(@PTEMPLATE+3, 1, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0, 10),
(@PTEMPLATE+4, 1, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0, 10),
(@PTEMPLATE+5, 1, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0, 10),
(@PTEMPLATE+6, 1, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0, 10),
(@PTEMPLATE+7, 1, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0, 10),
(@PTEMPLATE+8, 1, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0, 10),
(@PTEMPLATE+9, 1, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0, 10),
(@PTEMPLATE+10, 1, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0, 10),
(@PTEMPLATE+11, 1, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0, 10),
(@PTEMPLATE+12, 1, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0, 10),
(@PTEMPLATE+13, 1, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0, 10),
(@PTEMPLATE+14, 1, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0, 10),
(@PTEMPLATE+15, 1, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+2, @PTEMPLATE+2, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+3, @PTEMPLATE+3, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+4, @PTEMPLATE+4, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+5, @PTEMPLATE+5, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+6, @PTEMPLATE+6, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+7, @PTEMPLATE+7, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+8, @PTEMPLATE+8, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+9, @PTEMPLATE+9, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+10, @PTEMPLATE+10, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+11, @PTEMPLATE+11, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+12, @PTEMPLATE+12, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+13, @PTEMPLATE+13, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+14, @PTEMPLATE+14, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+15, @PTEMPLATE+15, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+16, @PTEMPLATE+1, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+17, @PTEMPLATE+2, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+18, @PTEMPLATE+3, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+19, @PTEMPLATE+4, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+20, @PTEMPLATE+5, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+21, @PTEMPLATE+6, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+22, @PTEMPLATE+7, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+23, @PTEMPLATE+8, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+24, @PTEMPLATE+9, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+25, @PTEMPLATE+10, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+26, @PTEMPLATE+11, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+27, @PTEMPLATE+12, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+28, @PTEMPLATE+13, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+29, @PTEMPLATE+14, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+30, @PTEMPLATE+15, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+16, 6, 'Alterac Mountains - Barrel of Melon Juice / Food Crate (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+16, 0, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0),
(@PTEMPLATE+2, @PTEMPLATE+16, 0, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0),
(@PTEMPLATE+3, @PTEMPLATE+16, 0, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0),
(@PTEMPLATE+4, @PTEMPLATE+16, 0, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0),
(@PTEMPLATE+5, @PTEMPLATE+16, 0, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0),
(@PTEMPLATE+6, @PTEMPLATE+16, 0, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0),
(@PTEMPLATE+7, @PTEMPLATE+16, 0, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0),
(@PTEMPLATE+8, @PTEMPLATE+16, 0, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0),
(@PTEMPLATE+9, @PTEMPLATE+16, 0, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0),
(@PTEMPLATE+10, @PTEMPLATE+16, 0, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0),
(@PTEMPLATE+11, @PTEMPLATE+16, 0, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0),
(@PTEMPLATE+12, @PTEMPLATE+16, 0, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0),
(@PTEMPLATE+13, @PTEMPLATE+16, 0, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0),
(@PTEMPLATE+14, @PTEMPLATE+16, 0, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0),
(@PTEMPLATE+15, @PTEMPLATE+16, 0, 'Barrel of Melon Juice / Food Crate - Alterac Mountains', 0);


SET @OGUID = 30277;
SET @PTEMPLATE = 4708;

-- 36 Alterac Mountains 3706 / 3707 / Barrel of Sweet Nectar / Food Crate

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 3706, 0, 443.563, -607.169, 167.443, -1.51844, 0, 0, 0.688354, -0.725374, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 3706, 0, 575.566, -286.316, 150.669, 0.383972, 0, 0, 0.190809, 0.981627, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 3706, 0, 672.087, -579.128, 162.059, -0.471239, 0, 0, 0.233445, -0.97237, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 3706, 0, 699.577, -988.074, 164.991, 1.29154, 0, 0, 0.601815, 0.798636, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 3706, 0, 726.603, -972.032, 164.298, -0.645772, 0, 0, 0.317305, -0.948324, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 3706, 0, 770.268, -307.623, 136.1, -1.309, 0, 0, 0.608761, -0.793353, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 3706, 0, 1183.19, -558.203, 71.2063, -1.6057, 0, 0, 0.71934, -0.694658, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 3706, 0, 1205.95, -310.428, 42.7005, -2.14675, 0, 0, 0.878817, -0.477159, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 3706, 0, 412.854, -298.625, 168.274, 1.78023, 0, 0, 0.777145, 0.629321, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 3706, 0, 443.963, -589.741, 171.182, 1.95477, 0, 0, 0.829038, 0.559193, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 3706, 0, 546.724, -331.519, 152.835, 5.68977, 0, 0, -0.292372, 0.956305, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 3706, 0, 579.138, -211.082, 143.895, 1.90241, 0, 0, 0.814116, 0.580703, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 3706, 0, 635.729, -524.046, 180.789, 1.37881, 0, 0, 0.636078, 0.771625, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 3706, 0, 647.799, -822.471, 159.049, 0.296705, 0, 0, 0.147809, 0.989016, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 3706, 0, 648.538, -372.44, 154.294, 2.09439, 0, 0, 0.866025, 0.500001, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 3706, 0, 651.973, -984.087, 165.662, 5.8294, 0, 0, -0.224951, 0.97437, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 3706, 0, 678.052, -314.746, 146.405, 4.64258, 0, 0, -0.731354, 0.681998, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 3706, 0, 679.273, -995.049, 165.589, 2.32129, 0, 0, 0.91706, 0.39875, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 3706, 0, 687.687, -903.146, 157.78, 3.57793, 0, 0, -0.976295, 0.216442, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 3706, 0, 696.921, -943.725, 164.377, 0.296705, 0, 0, 0.147809, 0.989016, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 3706, 0, 774.814, -395.302, 139.625, 1.0472, 0, 0, 0.5, 0.866025, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 3706, 0, 855.196, -576.092, 143.233, 2.82743, 0, 0, 0.987688, 0.156436, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 3706, 0, 945.596, -834.833, 114.67, 5.60251, 0, 0, -0.333807, 0.942641, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 3706, 0, 1003.99, -777.19, 108.506, 2.72271, 0, 0, 0.978148, 0.207912, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 3706, 0, 1101.16, -355.433, 42.7522, 0.226892, 0, 0, 0.113203, 0.993572, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 3706, 0, 1106.01, -725.844, 71.6351, 1.0821, 0, 0, 0.515038, 0.857168, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 3706, 0, 1213.13, -252.366, 34.4831, 1.8675, 0, 0, 0.803857, 0.594823, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 3707, 0, 443.563, -607.169, 167.443, -1.51844, 0, 0, 0.688354, -0.725374, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+29, 3707, 0, 575.566, -286.316, 150.669, 0.383972, 0, 0, 0.190809, 0.981627, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+30, 3707, 0, 672.087, -579.128, 162.059, -0.471239, 0, 0, 0.233445, -0.97237, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+31, 3707, 0, 699.577, -988.074, 164.991, 1.29154, 0, 0, 0.601815, 0.798636, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+32, 3707, 0, 726.603, -972.032, 164.298, -0.645772, 0, 0, 0.317305, -0.948324, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+33, 3707, 0, 770.268, -307.623, 136.1, -1.309, 0, 0, 0.608761, -0.793353, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+34, 3707, 0, 1183.19, -558.203, 71.2063, -1.6057, 0, 0, 0.71934, -0.694658, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+35, 3707, 0, 1205.95, -310.428, 42.7005, -2.14675, 0, 0, 0.878817, -0.477159, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+36, 3707, 0, 412.854, -298.625, 168.274, 1.78023, 0, 0, 0.777145, 0.629321, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+37, 3707, 0, 443.963, -589.741, 171.182, 1.95477, 0, 0, 0.829038, 0.559193, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+38, 3707, 0, 546.724, -331.519, 152.835, 5.68977, 0, 0, -0.292372, 0.956305, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+39, 3707, 0, 579.138, -211.082, 143.895, 1.90241, 0, 0, 0.814116, 0.580703, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+40, 3707, 0, 635.729, -524.046, 180.789, 1.37881, 0, 0, 0.636078, 0.771625, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+41, 3707, 0, 647.799, -822.471, 159.049, 0.296705, 0, 0, 0.147809, 0.989016, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+42, 3707, 0, 648.538, -372.44, 154.294, 2.09439, 0, 0, 0.866025, 0.500001, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+43, 3707, 0, 651.973, -984.087, 165.662, 5.8294, 0, 0, -0.224951, 0.97437, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+44, 3707, 0, 678.052, -314.746, 146.405, 4.64258, 0, 0, -0.731354, 0.681998, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+45, 3707, 0, 679.273, -995.049, 165.589, 2.32129, 0, 0, 0.91706, 0.39875, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+46, 3707, 0, 687.687, -903.146, 157.78, 3.57793, 0, 0, -0.976295, 0.216442, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+47, 3707, 0, 696.921, -943.725, 164.377, 0.296705, 0, 0, 0.147809, 0.989016, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+48, 3707, 0, 774.814, -395.302, 139.625, 1.0472, 0, 0, 0.5, 0.866025, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+49, 3707, 0, 855.196, -576.092, 143.233, 2.82743, 0, 0, 0.987688, 0.156436, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+50, 3707, 0, 945.596, -834.833, 114.67, 5.60251, 0, 0, -0.333807, 0.942641, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+51, 3707, 0, 1003.99, -777.19, 108.506, 2.72271, 0, 0, 0.978148, 0.207912, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+52, 3707, 0, 1101.16, -355.433, 42.7522, 0.226892, 0, 0, 0.113203, 0.993572, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+53, 3707, 0, 1106.01, -725.844, 71.6351, 1.0821, 0, 0, 0.515038, 0.857168, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+54, 3707, 0, 1213.13, -252.366, 34.4831, 1.8675, 0, 0, 0.803857, 0.594823, 180, 180, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@PTEMPLATE+2, 1, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@PTEMPLATE+3, 1, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@PTEMPLATE+4, 1, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@PTEMPLATE+5, 1, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@PTEMPLATE+6, 1, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@PTEMPLATE+7, 1, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@PTEMPLATE+8, 1, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@PTEMPLATE+9, 1, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@PTEMPLATE+10, 1, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@PTEMPLATE+11, 1, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@PTEMPLATE+12, 1, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@PTEMPLATE+13, 1, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@PTEMPLATE+14, 1, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@PTEMPLATE+15, 1, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@PTEMPLATE+16, 1, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@PTEMPLATE+17, 1, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@PTEMPLATE+18, 1, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@PTEMPLATE+19, 1, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@PTEMPLATE+20, 1, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@PTEMPLATE+21, 1, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@PTEMPLATE+22, 1, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@PTEMPLATE+23, 1, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@PTEMPLATE+24, 1, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@PTEMPLATE+25, 1, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@PTEMPLATE+26, 1, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@PTEMPLATE+27, 1, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+2, @PTEMPLATE+2, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+3, @PTEMPLATE+3, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+4, @PTEMPLATE+4, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+5, @PTEMPLATE+5, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+6, @PTEMPLATE+6, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+7, @PTEMPLATE+7, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+8, @PTEMPLATE+8, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+9, @PTEMPLATE+9, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+10, @PTEMPLATE+10, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+11, @PTEMPLATE+11, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+12, @PTEMPLATE+12, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+13, @PTEMPLATE+13, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+14, @PTEMPLATE+14, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+15, @PTEMPLATE+15, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+16, @PTEMPLATE+16, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+17, @PTEMPLATE+17, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+18, @PTEMPLATE+18, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+19, @PTEMPLATE+19, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+20, @PTEMPLATE+20, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+21, @PTEMPLATE+21, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+22, @PTEMPLATE+22, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+23, @PTEMPLATE+23, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+24, @PTEMPLATE+24, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+25, @PTEMPLATE+25, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+26, @PTEMPLATE+26, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+27, @PTEMPLATE+27, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+28, @PTEMPLATE+1, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+29, @PTEMPLATE+2, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+30, @PTEMPLATE+3, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+31, @PTEMPLATE+4, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+32, @PTEMPLATE+5, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+33, @PTEMPLATE+6, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+34, @PTEMPLATE+7, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+35, @PTEMPLATE+8, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+36, @PTEMPLATE+9, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+37, @PTEMPLATE+10, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+38, @PTEMPLATE+11, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+39, @PTEMPLATE+12, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+40, @PTEMPLATE+13, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+41, @PTEMPLATE+14, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+42, @PTEMPLATE+15, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+43, @PTEMPLATE+16, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+44, @PTEMPLATE+17, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+45, @PTEMPLATE+18, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+46, @PTEMPLATE+19, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+47, @PTEMPLATE+20, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+48, @PTEMPLATE+21, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+49, @PTEMPLATE+22, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+50, @PTEMPLATE+23, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+51, @PTEMPLATE+24, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+52, @PTEMPLATE+25, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+53, @PTEMPLATE+26, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10),
(@OGUID+54, @PTEMPLATE+27, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+28, 11, 'Alterac Mountains - Barrel of Sweet Nectar / Food Crate (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+28, 0, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0),
(@PTEMPLATE+2, @PTEMPLATE+28, 0, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0),
(@PTEMPLATE+3, @PTEMPLATE+28, 0, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0),
(@PTEMPLATE+4, @PTEMPLATE+28, 0, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0),
(@PTEMPLATE+5, @PTEMPLATE+28, 0, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0),
(@PTEMPLATE+6, @PTEMPLATE+28, 0, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0),
(@PTEMPLATE+7, @PTEMPLATE+28, 0, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0),
(@PTEMPLATE+8, @PTEMPLATE+28, 0, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0),
(@PTEMPLATE+9, @PTEMPLATE+28, 0, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0),
(@PTEMPLATE+10, @PTEMPLATE+28, 0, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0),
(@PTEMPLATE+11, @PTEMPLATE+28, 0, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0),
(@PTEMPLATE+12, @PTEMPLATE+28, 0, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0),
(@PTEMPLATE+13, @PTEMPLATE+28, 0, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0),
(@PTEMPLATE+14, @PTEMPLATE+28, 0, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0),
(@PTEMPLATE+15, @PTEMPLATE+28, 0, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0),
(@PTEMPLATE+16, @PTEMPLATE+28, 0, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0),
(@PTEMPLATE+17, @PTEMPLATE+28, 0, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0),
(@PTEMPLATE+18, @PTEMPLATE+28, 0, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0),
(@PTEMPLATE+19, @PTEMPLATE+28, 0, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0),
(@PTEMPLATE+20, @PTEMPLATE+28, 0, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0),
(@PTEMPLATE+21, @PTEMPLATE+28, 0, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0),
(@PTEMPLATE+22, @PTEMPLATE+28, 0, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0),
(@PTEMPLATE+23, @PTEMPLATE+28, 0, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0),
(@PTEMPLATE+24, @PTEMPLATE+28, 0, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0),
(@PTEMPLATE+25, @PTEMPLATE+28, 0, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0),
(@PTEMPLATE+26, @PTEMPLATE+28, 0, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0),
(@PTEMPLATE+27, @PTEMPLATE+28, 0, 'Barrel of Sweet Nectar / Food Crate - Alterac Mountains', 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
