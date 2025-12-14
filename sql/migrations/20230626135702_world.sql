DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230626135702');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230626135702');
-- Add your query below.


SET @OGUID = 9608;
SET @PTEMPLATE = 2029;

-- Silverpine Forest
DELETE FROM `gameobject` WHERE `guid` IN (479, 485, 624, 639, 726, 732, 733, 738, 751, 767, 776, 807, 840, 841, 846, 854, 861, 865, 872, 873, 874, 875, 894, 897, 35423, 35424, 35425, 35426, 35428, 35429, 35438, 35439, 35441, 35453, 35482, 35505);
DELETE FROM `pool_gameobject` WHERE `guid` IN (479, 485, 624, 639, 726, 732, 733, 738, 751, 767, 776, 807, 840, 841, 846, 854, 861, 865, 872, 873, 874, 875, 894, 897, 35423, 35424, 35425, 35426, 35428, 35429, 35438, 35439, 35441, 35453, 35482, 35505);
DELETE FROM `pool_template` WHERE `entry` IN (SELECT `pool_entry` FROM `pool_gameobject` WHERE `guid` IN (479, 485, 624, 639, 726, 732, 733, 738, 751, 767, 776, 807, 840, 841, 846, 854, 861, 865, 872, 873, 874, 875, 894, 897, 35423, 35424, 35425, 35426, 35428, 35429, 35438, 35439, 35441, 35453, 35482, 35505));

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 180582, 0, -494.957, 1687.07, 0, 0.698131, 0, 0, 0.34202, 0.939693, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+2, 180582, 0, -459.576, 1677.06, 0, 4.38078, 0, 0, -0.814116, 0.580703, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+3, 180582, 0, -335.832, 1723.09, 0, 4.45059, 0, 0, -0.793353, 0.608762, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+4, 180582, 0, 699.816, 1845.44, -0.446223, 3.83973, 0, 0, -0.939692, 0.34202, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+5, 180582, 0, 736.54, 1845.57, 0, 4.29351, 0, 0, -0.83867, 0.54464, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+6, 180582, 0, 771.161, 1861.35, 0, 5.81195, 0, 0, -0.233445, 0.97237, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+7, 180582, 0, 817.288, 1870.43, 0, 3.80482, 0, 0, -0.945518, 0.325568, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+8, 180582, 0, 866.832, 1899.76, 0, 1.06465, 0, 0, 0.507538, 0.861629, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+9, 180582, 0, 902.456, 1920.94, 0, 4.76475, 0, 0, -0.688354, 0.725374, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+10, 180582, 0, 1021.5, 1954.79, 0, 3.17653, 0, 0, -0.999847, 0.0174693, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+11, 180582, 0, 1105.35, 1980.23, 0, 2.37364, 0, 0, 0.927183, 0.374608, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+12, 180582, 0, 1200.86, 2081.54, 0, 0.453785, 0, 0, 0.224951, 0.97437, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+13, 180582, 0, 1219.64, 2090.3, 0, 5.48033, 0, 0, -0.390731, 0.920505, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+14, 180582, 0, 817.672, 1896.21, 0, 2.60054, 0, 0, 0.96363, 0.267241, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+15, 180582, 0, 1154.32, 2096.54, 0, 0.820303, 0, 0, 0.398748, 0.91706, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+16, 180582, 0, 719.737, 978.174, 32.9329, -0.802851, 0, 0, 0.390731, -0.920505, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+17, 180582, 0, 992.979, 1958.68, 0, -2.9147, 0, 0, 0.993572, -0.113203, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+18, 180655, 0, -494.957, 1687.07, 0, 0.698131, 0, 0, 0.34202, 0.939693, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+19, 180655, 0, -459.576, 1677.06, 0, 4.38078, 0, 0, -0.814116, 0.580703, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+20, 180655, 0, -335.832, 1723.09, 0, 4.45059, 0, 0, -0.793353, 0.608762, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+21, 180655, 0, 699.816, 1845.44, -0.446223, 3.83973, 0, 0, -0.939692, 0.34202, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+22, 180655, 0, 736.54, 1845.57, 0, 4.29351, 0, 0, -0.83867, 0.54464, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+23, 180655, 0, 771.161, 1861.35, 0, 5.81195, 0, 0, -0.233445, 0.97237, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+24, 180655, 0, 817.288, 1870.43, 0, 3.80482, 0, 0, -0.945518, 0.325568, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+25, 180655, 0, 866.832, 1899.76, 0, 1.06465, 0, 0, 0.507538, 0.861629, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+26, 180655, 0, 902.456, 1920.94, 0, 4.76475, 0, 0, -0.688354, 0.725374, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+27, 180655, 0, 1021.5, 1954.79, 0, 3.17653, 0, 0, -0.999847, 0.0174693, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+28, 180655, 0, 1105.35, 1980.23, 0, 2.37364, 0, 0, 0.927183, 0.374608, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+29, 180655, 0, 1200.86, 2081.54, 0, 0.453785, 0, 0, 0.224951, 0.97437, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+30, 180655, 0, 1219.64, 2090.3, 0, 5.48033, 0, 0, -0.390731, 0.920505, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+31, 180655, 0, 817.672, 1896.21, 0, 2.60054, 0, 0, 0.96363, 0.267241, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+32, 180655, 0, 1154.32, 2096.54, 0, 0.820303, 0, 0, 0.398748, 0.91706, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+33, 180655, 0, 719.737, 978.174, 32.9329, -0.802851, 0, 0, 0.390731, -0.920505, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+34, 180655, 0, 992.979, 1958.68, 0, -2.9147, 0, 0, 0.993572, -0.113203, 180, 180, 100, 1, 0, 0, 7, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@PTEMPLATE+2, 1, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@PTEMPLATE+3, 1, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@PTEMPLATE+4, 1, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@PTEMPLATE+5, 1, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@PTEMPLATE+6, 1, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@PTEMPLATE+7, 1, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@PTEMPLATE+8, 1, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@PTEMPLATE+9, 1, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@PTEMPLATE+10, 1, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@PTEMPLATE+11, 1, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@PTEMPLATE+12, 1, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@PTEMPLATE+13, 1, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@PTEMPLATE+14, 1, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@PTEMPLATE+15, 1, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@PTEMPLATE+16, 1, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@PTEMPLATE+17, 1, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@OGUID+2, @PTEMPLATE+2, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@OGUID+3, @PTEMPLATE+3, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@OGUID+4, @PTEMPLATE+4, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@OGUID+5, @PTEMPLATE+5, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@OGUID+6, @PTEMPLATE+6, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@OGUID+7, @PTEMPLATE+7, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@OGUID+8, @PTEMPLATE+8, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@OGUID+9, @PTEMPLATE+9, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@OGUID+10, @PTEMPLATE+10, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@OGUID+11, @PTEMPLATE+11, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@OGUID+12, @PTEMPLATE+12, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@OGUID+13, @PTEMPLATE+13, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@OGUID+14, @PTEMPLATE+14, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@OGUID+15, @PTEMPLATE+15, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@OGUID+16, @PTEMPLATE+16, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@OGUID+17, @PTEMPLATE+17, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@OGUID+18, @PTEMPLATE+1, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@OGUID+19, @PTEMPLATE+2, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@OGUID+20, @PTEMPLATE+3, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@OGUID+21, @PTEMPLATE+4, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@OGUID+22, @PTEMPLATE+5, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@OGUID+23, @PTEMPLATE+6, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@OGUID+24, @PTEMPLATE+7, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@OGUID+25, @PTEMPLATE+8, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@OGUID+26, @PTEMPLATE+9, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@OGUID+27, @PTEMPLATE+10, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@OGUID+28, @PTEMPLATE+11, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@OGUID+29, @PTEMPLATE+12, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@OGUID+30, @PTEMPLATE+13, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@OGUID+31, @PTEMPLATE+14, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@OGUID+32, @PTEMPLATE+15, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@OGUID+33, @PTEMPLATE+16, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10),
(@OGUID+34, @PTEMPLATE+17, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 7, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+18, 6, 'Silverpine Forest - Oily Blackmouth School / Floating Debris (Master Pool)', 0, 0, 7, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+18, 0, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 0),
(@PTEMPLATE+2, @PTEMPLATE+18, 0, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 0),
(@PTEMPLATE+3, @PTEMPLATE+18, 0, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 0),
(@PTEMPLATE+4, @PTEMPLATE+18, 0, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 0),
(@PTEMPLATE+5, @PTEMPLATE+18, 0, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 0),
(@PTEMPLATE+6, @PTEMPLATE+18, 0, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 0),
(@PTEMPLATE+7, @PTEMPLATE+18, 0, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 0),
(@PTEMPLATE+8, @PTEMPLATE+18, 0, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 0),
(@PTEMPLATE+9, @PTEMPLATE+18, 0, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 0),
(@PTEMPLATE+10, @PTEMPLATE+18, 0, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 0),
(@PTEMPLATE+11, @PTEMPLATE+18, 0, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 0),
(@PTEMPLATE+12, @PTEMPLATE+18, 0, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 0),
(@PTEMPLATE+13, @PTEMPLATE+18, 0, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 0),
(@PTEMPLATE+14, @PTEMPLATE+18, 0, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 0),
(@PTEMPLATE+15, @PTEMPLATE+18, 0, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 0),
(@PTEMPLATE+16, @PTEMPLATE+18, 0, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 0),
(@PTEMPLATE+17, @PTEMPLATE+18, 0, 'Oily Blackmouth School / Floating Debris - Silverpine Forest', 0);

UPDATE `pool_gameobject` SET `chance` = 40 WHERE `description` = "Oily Blackmouth School / Floating Debris - Silverpine Forest" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 180582);
UPDATE `pool_gameobject` SET `chance` = 60 WHERE `description` = "Oily Blackmouth School / Floating Debris - Silverpine Forest" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 180655);

SET @OGUID = 19203;
SET @PTEMPLATE = 2628;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 180656, 0, 643.843, 916.963, 32.9329, 3.14159, 0, 0, -1, 0, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+2, 180656, 0, 664.48, 728.523, 32.9329, 6.00393, 0, 0, -0.139173, 0.990268, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+3, 180656, 0, 678.563, 944.605, 32.9329, 1.79769, 0, 0, 0.782608, 0.622515, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+4, 180656, 0, 697.501, 756.158, 32.9329, 6.00393, 0, 0, -0.139173, 0.990268, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+5, 180656, 0, 697.509, 974.869, 32.9329, 5.48033, 0, 0, -0.390731, 0.920505, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+6, 180656, 0, 710.623, 927.133, 32.9329, 2.07694, 0, 0, 0.861629, 0.507539, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+7, 180656, 0, 721.065, 774.639, 32.9329, 2.54818, 0, 0, 0.956305, 0.292372, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+8, 180656, 0, 731.759, 945.118, 32.9329, 1.5708, 0, 0, 0.707107, 0.707107, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+9, 180656, 0, 795.908, 1026.9, 32.9309, 6.17847, 0, 0, -0.0523357, 0.99863, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+10, 180656, 0, 933.454, 1070.39, 32.9309, 3.14159, 0, 0, -1, 0, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+11, 180656, 0, 1067.24, 1049.39, 32.9309, 2.91469, 0, 0, 0.993571, 0.113208, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+12, 180656, 0, 1137.81, 1063.2, 32.9309, 0.628317, 0, 0, 0.309016, 0.951057, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+13, 180656, 0, 1180.77, 906.178, 32.9309, 5.09636, 0, 0, -0.559193, 0.829038, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+14, 180656, 0, 1262.39, 850.592, 32.9309, 0.506145, 0, 0, 0.25038, 0.968148, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+15, 180656, 0, 1321.13, 757.507, 32.9309, 4.15388, 0, 0, -0.874619, 0.48481, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+16, 180656, 0, 1366.96, 644.577, 32.9309, 5.72468, 0, 0, -0.275637, 0.961262, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+17, 180656, 0, 1411.55, 481.094, 32.9309, 6.24828, 0, 0, -0.0174522, 0.999848, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+18, 180656, 0, 604.853, 644.405, 32.9334, 6.03884, 0, 0, -0.121869, 0.992546, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+19, 180655, 0, 643.843, 916.963, 32.9329, 3.14159, 0, 0, -1, 0, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+20, 180655, 0, 664.48, 728.523, 32.9329, 6.00393, 0, 0, -0.139173, 0.990268, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+21, 180655, 0, 678.563, 944.605, 32.9329, 1.79769, 0, 0, 0.782608, 0.622515, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+22, 180655, 0, 697.501, 756.158, 32.9329, 6.00393, 0, 0, -0.139173, 0.990268, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+23, 180655, 0, 697.509, 974.869, 32.9329, 5.48033, 0, 0, -0.390731, 0.920505, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+24, 180655, 0, 710.623, 927.133, 32.9329, 2.07694, 0, 0, 0.861629, 0.507539, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+25, 180655, 0, 721.065, 774.639, 32.9329, 2.54818, 0, 0, 0.956305, 0.292372, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+26, 180655, 0, 731.759, 945.118, 32.9329, 1.5708, 0, 0, 0.707107, 0.707107, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+27, 180655, 0, 795.908, 1026.9, 32.9309, 6.17847, 0, 0, -0.0523357, 0.99863, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+28, 180655, 0, 933.454, 1070.39, 32.9309, 3.14159, 0, 0, -1, 0, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+29, 180655, 0, 1067.24, 1049.39, 32.9309, 2.91469, 0, 0, 0.993571, 0.113208, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+30, 180655, 0, 1137.81, 1063.2, 32.9309, 0.628317, 0, 0, 0.309016, 0.951057, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+31, 180655, 0, 1180.77, 906.178, 32.9309, 5.09636, 0, 0, -0.559193, 0.829038, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+32, 180655, 0, 1262.39, 850.592, 32.9309, 0.506145, 0, 0, 0.25038, 0.968148, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+33, 180655, 0, 1321.13, 757.507, 32.9309, 4.15388, 0, 0, -0.874619, 0.48481, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+34, 180655, 0, 1366.96, 644.577, 32.9309, 5.72468, 0, 0, -0.275637, 0.961262, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+35, 180655, 0, 1411.55, 481.094, 32.9309, 6.24828, 0, 0, -0.0174522, 0.999848, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+36, 180655, 0, 604.853, 644.405, 32.9334, 6.03884, 0, 0, -0.121869, 0.992546, 180, 180, 100, 1, 0, 0, 7, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@PTEMPLATE+2, 1, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@PTEMPLATE+3, 1, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@PTEMPLATE+4, 1, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@PTEMPLATE+5, 1, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@PTEMPLATE+6, 1, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@PTEMPLATE+7, 1, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@PTEMPLATE+8, 1, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@PTEMPLATE+9, 1, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@PTEMPLATE+10, 1, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@PTEMPLATE+11, 1, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@PTEMPLATE+12, 1, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@PTEMPLATE+13, 1, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@PTEMPLATE+14, 1, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@PTEMPLATE+15, 1, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@PTEMPLATE+16, 1, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@PTEMPLATE+17, 1, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@PTEMPLATE+18, 1, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@OGUID+2, @PTEMPLATE+2, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@OGUID+3, @PTEMPLATE+3, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@OGUID+4, @PTEMPLATE+4, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@OGUID+5, @PTEMPLATE+5, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@OGUID+6, @PTEMPLATE+6, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@OGUID+7, @PTEMPLATE+7, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@OGUID+8, @PTEMPLATE+8, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@OGUID+9, @PTEMPLATE+9, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@OGUID+10, @PTEMPLATE+10, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@OGUID+11, @PTEMPLATE+11, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@OGUID+12, @PTEMPLATE+12, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@OGUID+13, @PTEMPLATE+13, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@OGUID+14, @PTEMPLATE+14, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@OGUID+15, @PTEMPLATE+15, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@OGUID+16, @PTEMPLATE+16, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@OGUID+17, @PTEMPLATE+17, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@OGUID+18, @PTEMPLATE+18, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@OGUID+19, @PTEMPLATE+1, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@OGUID+20, @PTEMPLATE+2, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@OGUID+21, @PTEMPLATE+3, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@OGUID+22, @PTEMPLATE+4, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@OGUID+23, @PTEMPLATE+5, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@OGUID+24, @PTEMPLATE+6, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@OGUID+25, @PTEMPLATE+7, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@OGUID+26, @PTEMPLATE+8, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@OGUID+27, @PTEMPLATE+9, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@OGUID+28, @PTEMPLATE+10, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@OGUID+29, @PTEMPLATE+11, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@OGUID+30, @PTEMPLATE+12, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@OGUID+31, @PTEMPLATE+13, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@OGUID+32, @PTEMPLATE+14, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@OGUID+33, @PTEMPLATE+15, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@OGUID+34, @PTEMPLATE+16, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@OGUID+35, @PTEMPLATE+17, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10),
(@OGUID+36, @PTEMPLATE+18, 'Floating Debris / Sagefish School - Silverpine Forest', 7, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+19, 7, 'Silverpine Forest - Floating Debris / Sagefish School (Master Pool)', 0, 0, 7, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+19, 0, 'Floating Debris / Sagefish School - Silverpine Forest', 0),
(@PTEMPLATE+2, @PTEMPLATE+19, 0, 'Floating Debris / Sagefish School - Silverpine Forest', 0),
(@PTEMPLATE+3, @PTEMPLATE+19, 0, 'Floating Debris / Sagefish School - Silverpine Forest', 0),
(@PTEMPLATE+4, @PTEMPLATE+19, 0, 'Floating Debris / Sagefish School - Silverpine Forest', 0),
(@PTEMPLATE+5, @PTEMPLATE+19, 0, 'Floating Debris / Sagefish School - Silverpine Forest', 0),
(@PTEMPLATE+6, @PTEMPLATE+19, 0, 'Floating Debris / Sagefish School - Silverpine Forest', 0),
(@PTEMPLATE+7, @PTEMPLATE+19, 0, 'Floating Debris / Sagefish School - Silverpine Forest', 0),
(@PTEMPLATE+8, @PTEMPLATE+19, 0, 'Floating Debris / Sagefish School - Silverpine Forest', 0),
(@PTEMPLATE+9, @PTEMPLATE+19, 0, 'Floating Debris / Sagefish School - Silverpine Forest', 0),
(@PTEMPLATE+10, @PTEMPLATE+19, 0, 'Floating Debris / Sagefish School - Silverpine Forest', 0),
(@PTEMPLATE+11, @PTEMPLATE+19, 0, 'Floating Debris / Sagefish School - Silverpine Forest', 0),
(@PTEMPLATE+12, @PTEMPLATE+19, 0, 'Floating Debris / Sagefish School - Silverpine Forest', 0),
(@PTEMPLATE+13, @PTEMPLATE+19, 0, 'Floating Debris / Sagefish School - Silverpine Forest', 0),
(@PTEMPLATE+14, @PTEMPLATE+19, 0, 'Floating Debris / Sagefish School - Silverpine Forest', 0),
(@PTEMPLATE+15, @PTEMPLATE+19, 0, 'Floating Debris / Sagefish School - Silverpine Forest', 0),
(@PTEMPLATE+16, @PTEMPLATE+19, 0, 'Floating Debris / Sagefish School - Silverpine Forest', 0),
(@PTEMPLATE+17, @PTEMPLATE+19, 0, 'Floating Debris / Sagefish School - Silverpine Forest', 0),
(@PTEMPLATE+18, @PTEMPLATE+19, 0, 'Floating Debris / Sagefish School - Silverpine Forest', 0);

UPDATE `gameobject` SET `id` = 180656 WHERE `guid` = 9624;
UPDATE `pool_template` SET `description`='Floating Debris / Sagefish School - Silverpine Forest' WHERE  `entry`=2045;
UPDATE `pool_gameobject` SET `description`='Floating Debris / Sagefish School - Silverpine Forest' WHERE  `guid`=9624;
UPDATE `pool_gameobject` SET `description`='Floating Debris / Sagefish School - Silverpine Forest' WHERE  `guid`=9641;
UPDATE `pool_pool` SET `description`='Floating Debris / Sagefish School - Silverpine Forest' WHERE  `pool_id`=2045;

UPDATE `pool_gameobject` SET `chance` = 20 WHERE `description` = "Floating Debris / Sagefish School - Silverpine Forest" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 180655);
UPDATE `pool_gameobject` SET `chance` = 80 WHERE `description` = "Floating Debris / Sagefish School - Silverpine Forest" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 180656);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
