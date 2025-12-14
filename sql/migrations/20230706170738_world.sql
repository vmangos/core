DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230706170738');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230706170738');
-- Add your query below.


SET @OGUID = 38937;
SET @PTEMPLATE = 3877;

-- 85 Tirisfal Glades 3658 / 153472 / Water Barrel / Food Crate
DELETE FROM `pool_template` WHERE `entry` IN (SELECT `pool_entry` FROM `pool_gameobject` WHERE `guid` IN (45059, 45061, 45062, 45103, 45104, 45105, 45107, 45108, 45109, 45160, 45219, 45227, 45259, 88087, 88088, 88089, 88090, 88091, 88092, 88093, 55753));
DELETE FROM `gameobject` WHERE `guid` IN (45059, 45061, 45062, 45103, 45104, 45105, 45107, 45108, 45109, 45160, 45219, 45227, 45259, 88087, 88088, 88089, 88090, 88091, 88092, 88093, 55753);
DELETE FROM `pool_gameobject` WHERE `guid` IN (45059, 45061, 45062, 45103, 45104, 45105, 45107, 45108, 45109, 45160, 45219, 45227, 45259, 88087, 88088, 88089, 88090, 88091, 88092, 88093, 55753);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 3658, 0, 1660.01, -735.278, 59.8819, 0.418879, 0, 0, 0.207911, 0.978148, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 3658, 0, 1741.42, -738.595, 59.6446, 0.785397, 0, 0, 0.382683, 0.92388, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 3658, 0, 1784.45, -734.314, 59.4288, 2.89725, 0, 0, 0.992546, 0.12187, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 3658, 0, 1957.5, -454.832, 35.6162, 5.96903, 0, 0, -0.156434, 0.987688, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 3658, 0, 1981.42, -406.394, 35.4522, 3.35105, 0, 0, -0.994521, 0.104536, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 3658, 0, 2040.9, -461.893, 35.9081, 2.19911, 0, 0, 0.891006, 0.453991, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 3658, 0, 2059.48, 300.754, 57.1388, 0.977383, 0, 0, 0.469471, 0.882948, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 3658, 0, 2151.47, 660.64, 33.6004, 3.08918, 0, 0, 0.999657, 0.0262016, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 3658, 0, 2277.38, 254.764, 34.7029, 3.87463, 0, 0, -0.93358, 0.358368, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 3658, 0, 2824.09, 300.03, 27.43, 2.09439, 0, 0, 0.866025, 0.500001, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 3658, 0, 2831.79, 822.436, 113.144, 2.72271, 0, 0, 0.978148, 0.207912, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 3658, 0, 2835.51, 415.341, 20.9173, 0.401425, 0, 0, 0.199368, 0.979925, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 3658, 0, 2860.1, 1095.11, 117.53, 0.471238, 0, 0, 0.233445, 0.97237, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 3658, 0, 2868.02, 930.203, 121.029, 2.74016, 0, 0, 0.979924, 0.19937, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 3658, 0, 2870.11, 1037.78, 115.56, 2.04204, 0, 0, 0.85264, 0.522499, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 3658, 0, 2904.5, 385.574, 30.3958, 3.50812, 0, 0, -0.983254, 0.182238, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 3658, 0, 2926.79, 892.296, 119.17, 0.541051, 0, 0, 0.267238, 0.963631, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 3658, 0, 2939.65, 570.441, 91.4753, 3.17653, 0, 0, -0.999847, 0.0174693, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 3658, 0, 2948.7, 727.587, 103.686, 2.49582, 0, 0, 0.948323, 0.317306, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 3658, 0, 3054.27, -350.856, -0.050096, 2.54818, 0, 0, 0.956305, 0.292372, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 3658, 0, 2670.02, 954.971, 114.079, 2.14675, 0, 0, 0.878817, 0.477159, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 3658, 0, 2522.86, 1512.94, 0.003494, 1.0472, 0, 0, 0.5, 0.866025, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 3658, 0, 2744.26, 786.462, 114.351, 2.07694, 0, 0, 0.861629, 0.507539, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 3658, 0, 3011.42, 661.036, 90.5849, 6.24828, 0, 0, -0.0174522, 0.999848, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 153472, 0, 1660.01, -735.278, 59.8819, 0.418879, 0, 0, 0.207911, 0.978148, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 153472, 0, 1741.42, -738.595, 59.6446, 0.785397, 0, 0, 0.382683, 0.92388, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 153472, 0, 1784.45, -734.314, 59.4288, 2.89725, 0, 0, 0.992546, 0.12187, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 153472, 0, 1957.5, -454.832, 35.6162, 5.96903, 0, 0, -0.156434, 0.987688, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+29, 153472, 0, 1981.42, -406.394, 35.4522, 3.35105, 0, 0, -0.994521, 0.104536, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+30, 153472, 0, 2040.9, -461.893, 35.9081, 2.19911, 0, 0, 0.891006, 0.453991, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+31, 153472, 0, 2059.48, 300.754, 57.1388, 0.977383, 0, 0, 0.469471, 0.882948, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+32, 153472, 0, 2151.47, 660.64, 33.6004, 3.08918, 0, 0, 0.999657, 0.0262016, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+33, 153472, 0, 2277.38, 254.764, 34.7029, 3.87463, 0, 0, -0.93358, 0.358368, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+34, 153472, 0, 2824.09, 300.03, 27.43, 2.09439, 0, 0, 0.866025, 0.500001, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+35, 153472, 0, 2831.79, 822.436, 113.144, 2.72271, 0, 0, 0.978148, 0.207912, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+36, 153472, 0, 2835.51, 415.341, 20.9173, 0.401425, 0, 0, 0.199368, 0.979925, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+37, 153472, 0, 2860.1, 1095.11, 117.53, 0.471238, 0, 0, 0.233445, 0.97237, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+38, 153472, 0, 2868.02, 930.203, 121.029, 2.74016, 0, 0, 0.979924, 0.19937, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+39, 153472, 0, 2870.11, 1037.78, 115.56, 2.04204, 0, 0, 0.85264, 0.522499, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+40, 153472, 0, 2904.5, 385.574, 30.3958, 3.50812, 0, 0, -0.983254, 0.182238, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+41, 153472, 0, 2926.79, 892.296, 119.17, 0.541051, 0, 0, 0.267238, 0.963631, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+42, 153472, 0, 2939.65, 570.441, 91.4753, 3.17653, 0, 0, -0.999847, 0.0174693, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+43, 153472, 0, 2948.7, 727.587, 103.686, 2.49582, 0, 0, 0.948323, 0.317306, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+44, 153472, 0, 3054.27, -350.856, -0.050096, 2.54818, 0, 0, 0.956305, 0.292372, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+45, 153472, 0, 2670.02, 954.971, 114.079, 2.14675, 0, 0, 0.878817, 0.477159, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+46, 153472, 0, 2522.86, 1512.94, 0.003494, 1.0472, 0, 0, 0.5, 0.866025, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+47, 153472, 0, 2744.26, 786.462, 114.351, 2.07694, 0, 0, 0.861629, 0.507539, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+48, 153472, 0, 3011.42, 661.036, 90.5849, 6.24828, 0, 0, -0.0174522, 0.999848, 180, 180, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@PTEMPLATE+2, 1, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@PTEMPLATE+3, 1, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@PTEMPLATE+4, 1, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@PTEMPLATE+5, 1, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@PTEMPLATE+6, 1, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@PTEMPLATE+7, 1, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@PTEMPLATE+8, 1, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@PTEMPLATE+9, 1, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@PTEMPLATE+10, 1, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@PTEMPLATE+11, 1, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@PTEMPLATE+12, 1, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@PTEMPLATE+13, 1, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@PTEMPLATE+14, 1, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@PTEMPLATE+15, 1, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@PTEMPLATE+16, 1, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@PTEMPLATE+17, 1, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@PTEMPLATE+18, 1, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@PTEMPLATE+19, 1, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@PTEMPLATE+20, 1, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@PTEMPLATE+21, 1, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@PTEMPLATE+22, 1, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@PTEMPLATE+23, 1, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@PTEMPLATE+24, 1, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+2, @PTEMPLATE+2, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+3, @PTEMPLATE+3, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+4, @PTEMPLATE+4, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+5, @PTEMPLATE+5, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+6, @PTEMPLATE+6, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+7, @PTEMPLATE+7, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+8, @PTEMPLATE+8, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+9, @PTEMPLATE+9, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+10, @PTEMPLATE+10, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+11, @PTEMPLATE+11, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+12, @PTEMPLATE+12, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+13, @PTEMPLATE+13, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+14, @PTEMPLATE+14, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+15, @PTEMPLATE+15, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+16, @PTEMPLATE+16, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+17, @PTEMPLATE+17, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+18, @PTEMPLATE+18, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+19, @PTEMPLATE+19, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+20, @PTEMPLATE+20, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+21, @PTEMPLATE+21, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+22, @PTEMPLATE+22, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+23, @PTEMPLATE+23, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+24, @PTEMPLATE+24, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+25, @PTEMPLATE+1, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+26, @PTEMPLATE+2, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+27, @PTEMPLATE+3, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+28, @PTEMPLATE+4, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+29, @PTEMPLATE+5, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+30, @PTEMPLATE+6, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+31, @PTEMPLATE+7, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+32, @PTEMPLATE+8, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+33, @PTEMPLATE+9, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+34, @PTEMPLATE+10, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+35, @PTEMPLATE+11, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+36, @PTEMPLATE+12, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+37, @PTEMPLATE+13, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+38, @PTEMPLATE+14, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+39, @PTEMPLATE+15, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+40, @PTEMPLATE+16, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+41, @PTEMPLATE+17, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+42, @PTEMPLATE+18, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+43, @PTEMPLATE+19, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+44, @PTEMPLATE+20, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+45, @PTEMPLATE+21, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+46, @PTEMPLATE+22, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+47, @PTEMPLATE+23, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+48, @PTEMPLATE+24, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+25, 11, 'Tirisfal Glades - Water Barrel / Food Crate (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+25, 0, 'Water Barrel / Food Crate - Tirisfal Glades', 0),
(@PTEMPLATE+2, @PTEMPLATE+25, 0, 'Water Barrel / Food Crate - Tirisfal Glades', 0),
(@PTEMPLATE+3, @PTEMPLATE+25, 0, 'Water Barrel / Food Crate - Tirisfal Glades', 0),
(@PTEMPLATE+4, @PTEMPLATE+25, 0, 'Water Barrel / Food Crate - Tirisfal Glades', 0),
(@PTEMPLATE+5, @PTEMPLATE+25, 0, 'Water Barrel / Food Crate - Tirisfal Glades', 0),
(@PTEMPLATE+6, @PTEMPLATE+25, 0, 'Water Barrel / Food Crate - Tirisfal Glades', 0),
(@PTEMPLATE+7, @PTEMPLATE+25, 0, 'Water Barrel / Food Crate - Tirisfal Glades', 0),
(@PTEMPLATE+8, @PTEMPLATE+25, 0, 'Water Barrel / Food Crate - Tirisfal Glades', 0),
(@PTEMPLATE+9, @PTEMPLATE+25, 0, 'Water Barrel / Food Crate - Tirisfal Glades', 0),
(@PTEMPLATE+10, @PTEMPLATE+25, 0, 'Water Barrel / Food Crate - Tirisfal Glades', 0),
(@PTEMPLATE+11, @PTEMPLATE+25, 0, 'Water Barrel / Food Crate - Tirisfal Glades', 0),
(@PTEMPLATE+12, @PTEMPLATE+25, 0, 'Water Barrel / Food Crate - Tirisfal Glades', 0),
(@PTEMPLATE+13, @PTEMPLATE+25, 0, 'Water Barrel / Food Crate - Tirisfal Glades', 0),
(@PTEMPLATE+14, @PTEMPLATE+25, 0, 'Water Barrel / Food Crate - Tirisfal Glades', 0),
(@PTEMPLATE+15, @PTEMPLATE+25, 0, 'Water Barrel / Food Crate - Tirisfal Glades', 0),
(@PTEMPLATE+16, @PTEMPLATE+25, 0, 'Water Barrel / Food Crate - Tirisfal Glades', 0),
(@PTEMPLATE+17, @PTEMPLATE+25, 0, 'Water Barrel / Food Crate - Tirisfal Glades', 0),
(@PTEMPLATE+18, @PTEMPLATE+25, 0, 'Water Barrel / Food Crate - Tirisfal Glades', 0),
(@PTEMPLATE+19, @PTEMPLATE+25, 0, 'Water Barrel / Food Crate - Tirisfal Glades', 0),
(@PTEMPLATE+20, @PTEMPLATE+25, 0, 'Water Barrel / Food Crate - Tirisfal Glades', 0),
(@PTEMPLATE+21, @PTEMPLATE+25, 0, 'Water Barrel / Food Crate - Tirisfal Glades', 0),
(@PTEMPLATE+22, @PTEMPLATE+25, 0, 'Water Barrel / Food Crate - Tirisfal Glades', 0),
(@PTEMPLATE+23, @PTEMPLATE+25, 0, 'Water Barrel / Food Crate - Tirisfal Glades', 0),
(@PTEMPLATE+24, @PTEMPLATE+25, 0, 'Water Barrel / Food Crate - Tirisfal Glades', 0);

SET @OGUID = 33785;
SET @PTEMPLATE = 4195;
-- 3658 / 153473 / Water Barrel / Food Crate

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 3658, 0, 3081.58, -565.609, 131.491, 2.89725, 0, 0, 0.992546, 0.121869, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 3658, 0, 1782.73, 698.258, 45.757, 4.36332, 0, 0, -0.819152, 0.573577, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 3658, 0, 1798.7, 746.055, 48.8531, 3.15906, 0, 0, -0.999962, 0.00873464, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 3658, 0, 1808.27, 724.804, 48.9904, 4.31097, 0, 0, -0.833885, 0.551938, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 3658, 0, 2159.47, -524.26, 86.4679, 0.261798, 0, 0, 0.130526, 0.991445, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 3658, 0, 2166.62, -561.002, 79.265, 2.00713, 0, 0, 0.843391, 0.5373, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 3658, 0, 2340.66, 1306.41, 34.0632, 3.17653, 0, 0, -0.999847, 0.0174693, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 3658, 0, 2417.42, 1596.05, 33.3333, 3.33359, 0, 0, -0.995396, 0.0958512, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 3658, 0, 2620.59, 1714.67, 0.00232, 1.65806, 0, 0, 0.737277, 0.675591, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 3658, 0, 2960.99, 116.605, -0.017485, 3.29869, 0, 0, -0.996917, 0.0784664, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 3658, 0, 3020.86, 364.63, -0.20469, 3.31614, 0, 0, -0.996194, 0.087165, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 3658, 0, 3050.19, -574.39, 122.454, 4.7822, 0, 0, -0.681998, 0.731354, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 3658, 0, 3072.41, -37.3976, -0.064231, 4.20625, 0, 0, -0.861629, 0.507539, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 3658, 0, 3100.69, -548.569, 126.714, 3.97935, 0, 0, -0.913545, 0.406738, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 3658, 0, 2144.11, -505.623, 81.6561, 1.76278, 0, 0, 0.771625, 0.636078, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 3658, 0, 2522.86, 1512.94, 0.003494, 1.0472, 0, 0, 0.5, 0.866025, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 153473, 0, 3081.58, -565.609, 131.491, 2.89725, 0, 0, 0.992546, 0.121869, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 153473, 0, 1782.73, 698.258, 45.757, 4.36332, 0, 0, -0.819152, 0.573577, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 153473, 0, 1798.7, 746.055, 48.8531, 3.15906, 0, 0, -0.999962, 0.00873464, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 153473, 0, 1808.27, 724.804, 48.9904, 4.31097, 0, 0, -0.833885, 0.551938, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 153473, 0, 2159.47, -524.26, 86.4679, 0.261798, 0, 0, 0.130526, 0.991445, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 153473, 0, 2166.62, -561.002, 79.265, 2.00713, 0, 0, 0.843391, 0.5373, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 153473, 0, 2340.66, 1306.41, 34.0632, 3.17653, 0, 0, -0.999847, 0.0174693, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 153473, 0, 2417.42, 1596.05, 33.3333, 3.33359, 0, 0, -0.995396, 0.0958512, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 153473, 0, 2620.59, 1714.67, 0.00232, 1.65806, 0, 0, 0.737277, 0.675591, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 153473, 0, 2960.99, 116.605, -0.017485, 3.29869, 0, 0, -0.996917, 0.0784664, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 153473, 0, 3020.86, 364.63, -0.20469, 3.31614, 0, 0, -0.996194, 0.087165, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 153473, 0, 3050.19, -574.39, 122.454, 4.7822, 0, 0, -0.681998, 0.731354, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+29, 153473, 0, 3072.41, -37.3976, -0.064231, 4.20625, 0, 0, -0.861629, 0.507539, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+30, 153473, 0, 3100.69, -548.569, 126.714, 3.97935, 0, 0, -0.913545, 0.406738, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+31, 153473, 0, 2144.11, -505.623, 81.6561, 1.76278, 0, 0, 0.771625, 0.636078, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+32, 153473, 0, 2522.86, 1512.94, 0.003494, 1.0472, 0, 0, 0.5, 0.866025, 180, 180, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@PTEMPLATE+2, 1, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@PTEMPLATE+3, 1, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@PTEMPLATE+4, 1, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@PTEMPLATE+5, 1, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@PTEMPLATE+6, 1, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@PTEMPLATE+7, 1, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@PTEMPLATE+8, 1, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@PTEMPLATE+9, 1, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@PTEMPLATE+10, 1, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@PTEMPLATE+11, 1, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@PTEMPLATE+12, 1, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@PTEMPLATE+13, 1, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@PTEMPLATE+14, 1, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@PTEMPLATE+15, 1, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@PTEMPLATE+16, 1, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+2, @PTEMPLATE+2, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+3, @PTEMPLATE+3, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+4, @PTEMPLATE+4, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+5, @PTEMPLATE+5, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+6, @PTEMPLATE+6, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+7, @PTEMPLATE+7, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+8, @PTEMPLATE+8, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+9, @PTEMPLATE+9, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+10, @PTEMPLATE+10, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+11, @PTEMPLATE+11, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+12, @PTEMPLATE+12, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+13, @PTEMPLATE+13, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+14, @PTEMPLATE+14, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+15, @PTEMPLATE+15, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+16, @PTEMPLATE+16, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+17, @PTEMPLATE+1, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+18, @PTEMPLATE+2, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+19, @PTEMPLATE+3, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+20, @PTEMPLATE+4, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+21, @PTEMPLATE+5, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+22, @PTEMPLATE+6, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+23, @PTEMPLATE+7, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+24, @PTEMPLATE+8, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+25, @PTEMPLATE+9, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+26, @PTEMPLATE+10, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+27, @PTEMPLATE+11, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+28, @PTEMPLATE+12, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+29, @PTEMPLATE+13, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+30, @PTEMPLATE+14, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+31, @PTEMPLATE+15, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(@OGUID+32, @PTEMPLATE+16, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+17, 6, 'Tirisfal Glades - Water Barrel / Food Crate (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+17, 0, 'Water Barrel / Food Crate - Tirisfal Glades', 0),
(@PTEMPLATE+2, @PTEMPLATE+17, 0, 'Water Barrel / Food Crate - Tirisfal Glades', 0),
(@PTEMPLATE+3, @PTEMPLATE+17, 0, 'Water Barrel / Food Crate - Tirisfal Glades', 0),
(@PTEMPLATE+4, @PTEMPLATE+17, 0, 'Water Barrel / Food Crate - Tirisfal Glades', 0),
(@PTEMPLATE+5, @PTEMPLATE+17, 0, 'Water Barrel / Food Crate - Tirisfal Glades', 0),
(@PTEMPLATE+6, @PTEMPLATE+17, 0, 'Water Barrel / Food Crate - Tirisfal Glades', 0),
(@PTEMPLATE+7, @PTEMPLATE+17, 0, 'Water Barrel / Food Crate - Tirisfal Glades', 0),
(@PTEMPLATE+8, @PTEMPLATE+17, 0, 'Water Barrel / Food Crate - Tirisfal Glades', 0),
(@PTEMPLATE+9, @PTEMPLATE+17, 0, 'Water Barrel / Food Crate - Tirisfal Glades', 0),
(@PTEMPLATE+10, @PTEMPLATE+17, 0, 'Water Barrel / Food Crate - Tirisfal Glades', 0),
(@PTEMPLATE+11, @PTEMPLATE+17, 0, 'Water Barrel / Food Crate - Tirisfal Glades', 0),
(@PTEMPLATE+12, @PTEMPLATE+17, 0, 'Water Barrel / Food Crate - Tirisfal Glades', 0),
(@PTEMPLATE+13, @PTEMPLATE+17, 0, 'Water Barrel / Food Crate - Tirisfal Glades', 0),
(@PTEMPLATE+14, @PTEMPLATE+17, 0, 'Water Barrel / Food Crate - Tirisfal Glades', 0),
(@PTEMPLATE+15, @PTEMPLATE+17, 0, 'Water Barrel / Food Crate - Tirisfal Glades', 0),
(@PTEMPLATE+16, @PTEMPLATE+17, 0, 'Water Barrel / Food Crate - Tirisfal Glades', 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
