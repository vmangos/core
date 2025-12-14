DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230625171130');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230625171130');
-- Add your query below.


SET @OGUID = 29896;
SET @PTEMPLATE = 3310;

-- Loch Modan
DELETE FROM `gameobject` WHERE `guid` IN (1465, 1466, 1477, 1489, 1492, 1526, 1604, 1605, 1611, 1617, 1618, 1619, 1624, 1635, 1770, 1771, 1773, 1784, 1791, 1805, 1839, 1851, 1858, 1895, 1912, 1929, 2001, 2026, 2031, 2045, 2051, 2208, 4561, 4562, 4583, 12770, 12773, 12774, 12775, 12778, 12780, 12782, 47351, 47352, 47353, 47354, 47355, 47356, 47358, 47359, 47360, 47361, 47363, 50322);
DELETE FROM `pool_gameobject` WHERE `guid` IN (1465, 1466, 1477, 1489, 1492, 1526, 1604, 1605, 1611, 1617, 1618, 1619, 1624, 1635, 1770, 1771, 1773, 1784, 1791, 1805, 1839, 1851, 1858, 1895, 1912, 1929, 2001, 2026, 2031, 2045, 2051, 2208, 4561, 4562, 4583, 12770, 12773, 12774, 12775, 12778, 12780, 12782, 47351, 47352, 47353, 47354, 47355, 47356, 47358, 47359, 47360, 47361, 47363, 50322);
DELETE FROM `pool_template` WHERE `entry` IN (SELECT `pool_entry` FROM `pool_gameobject` WHERE `guid` IN (1465, 1466, 1477, 1489, 1492, 1526, 1604, 1605, 1611, 1617, 1618, 1619, 1624, 1635, 1770, 1771, 1773, 1784, 1791, 1805, 1839, 1851, 1858, 1895, 1912, 1929, 2001, 2026, 2031, 2045, 2051, 2208, 4561, 4562, 4583, 12770, 12773, 12774, 12775, 12778, 12780, 12782, 47351, 47352, 47353, 47354, 47355, 47356, 47358, 47359, 47360, 47361, 47363, 50322));

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 180655, 0, -5730.29, -3414.34, 297.605, -2.80998, 0, 0, 0.986286, -0.165048, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+2, 180655, 0, -5642.59, -3291.67, 297.605, 2.14675, 0, 0, 0.878817, 0.477159, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+3, 180655, 0, -5347.89, -3706.57, 297.605, -1.8326, 0, 0, 0.793353, -0.608761, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+4, 180655, 0, -5291.58, -3505.29, 297.605, 2.37365, 0, 0, 0.927184, 0.374607, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+5, 180655, 0, -5260.79, -3631.81, 297.605, 1.64061, 0, 0, 0.731354, 0.681998, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+6, 180655, 0, -5250.53, -3448.45, 297.605, -0.436333, 0, 0, 0.21644, -0.976296, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+7, 180655, 0, -5232.57, -3133.11, 297.605, -2.00713, 0, 0, 0.843391, -0.5373, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+8, 180655, 0, -5202.45, -3145.92, 297.605, 2.25148, 0, 0, 0.902585, 0.430511, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+9, 180655, 0, -5167.09, -3142.34, 297.605, -0.034907, 0, 0, 0.017452, -0.999848, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+10, 180655, 0, -5141.95, -3445.86, 297.025, 0.872665, 0, 0, 0.422618, 0.906308, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+11, 180655, 0, -5127.44, -3148.62, 297.605, -2.98451, 0, 0, 0.996917, -0.078459, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+12, 180655, 0, -5120.34, -3561.44, 297.615, 2.25148, 0, 0, 0.902585, 0.430511, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+13, 180655, 0, -5032.86, -3580.12, 297.605, -1.93731, 0, 0, 0.824126, -0.566406, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+14, 180655, 0, -4982.37, -3543.38, 297.605, 1.50098, 0, 0, 0.681998, 0.731354, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+15, 180655, 0, -4912.3, -3581.94, 297.605, -0.663225, 0, 0, 0.325568, -0.945519, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+16, 180655, 0, -4845.88, -3409.7, 297.605, 2.07694, 0, 0, 0.861629, 0.507538, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+17, 180655, 0, -4773.38, -3163.92, 297.605, -2.18166, 0, 0, 0.887011, -0.461749, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+18, 180655, 0, -4746.4, -3163.21, 297.605, 2.86234, 0, 0, 0.990268, 0.139173, 3600, 3600, 100, 1, 0, 0, 7, 10),
(@OGUID+19, 180655, 0, -5702.91, -3473.16, 297.605, 3.17653, 0, 0, -0.999847, 0.0174693, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+20, 180655, 0, -5623.21, -3554.64, 297.618, 0.523598, 0, 0, 0.258819, 0.965926, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+21, 180655, 0, -5541.79, -3464.88, 297.605, 2.79252, 0, 0, 0.984807, 0.173652, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+22, 180655, 0, -5531.11, -3633.95, 297.605, 6.07375, 0, 0, -0.104528, 0.994522, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+23, 180655, 0, -5480.5, -3691.84, 297.605, 4.76475, 0, 0, -0.688354, 0.725374, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+24, 180655, 0, -5404.51, -3717.46, 297.605, 2.51327, 0, 0, 0.951056, 0.309017, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+25, 180655, 0, -5255.98, -3540.55, 297.605, 4.95674, 0, 0, -0.615661, 0.788011, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+26, 180655, 0, -5176.12, -3600.61, 297.605, 2.11185, 0, 0, 0.870356, 0.492424, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+27, 180655, 0, -4923, -3274.12, 297.605, 6.16101, 0, 0, -0.0610485, 0.998135, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+28, 180655, 0, -4779.28, -3489.41, 297.62, 6.21337, 0, 0, -0.0348988, 0.999391, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+29, 180656, 0, -5730.29, -3414.34, 297.605, -2.80998, 0, 0, 0.986286, -0.165048, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+30, 180656, 0, -5642.59, -3291.67, 297.605, 2.14675, 0, 0, 0.878817, 0.477159, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+31, 180656, 0, -5347.89, -3706.57, 297.605, -1.8326, 0, 0, 0.793353, -0.608761, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+32, 180656, 0, -5291.58, -3505.29, 297.605, 2.37365, 0, 0, 0.927184, 0.374607, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+33, 180656, 0, -5260.79, -3631.81, 297.605, 1.64061, 0, 0, 0.731354, 0.681998, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+34, 180656, 0, -5250.53, -3448.45, 297.605, -0.436333, 0, 0, 0.21644, -0.976296, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+35, 180656, 0, -5232.57, -3133.11, 297.605, -2.00713, 0, 0, 0.843391, -0.5373, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+36, 180656, 0, -5202.45, -3145.92, 297.605, 2.25148, 0, 0, 0.902585, 0.430511, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+37, 180656, 0, -5167.09, -3142.34, 297.605, -0.034907, 0, 0, 0.017452, -0.999848, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+38, 180656, 0, -5141.95, -3445.86, 297.025, 0.872665, 0, 0, 0.422618, 0.906308, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+39, 180656, 0, -5127.44, -3148.62, 297.605, -2.98451, 0, 0, 0.996917, -0.078459, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+40, 180656, 0, -5120.34, -3561.44, 297.615, 2.25148, 0, 0, 0.902585, 0.430511, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+41, 180656, 0, -5032.86, -3580.12, 297.605, -1.93731, 0, 0, 0.824126, -0.566406, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+42, 180656, 0, -4982.37, -3543.38, 297.605, 1.50098, 0, 0, 0.681998, 0.731354, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+43, 180656, 0, -4912.3, -3581.94, 297.605, -0.663225, 0, 0, 0.325568, -0.945519, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+44, 180656, 0, -4845.88, -3409.7, 297.605, 2.07694, 0, 0, 0.861629, 0.507538, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+45, 180656, 0, -4773.38, -3163.92, 297.605, -2.18166, 0, 0, 0.887011, -0.461749, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+46, 180656, 0, -4746.4, -3163.21, 297.605, 2.86234, 0, 0, 0.990268, 0.139173, 3600, 3600, 100, 1, 0, 0, 7, 10),
(@OGUID+47, 180656, 0, -5702.91, -3473.16, 297.605, 3.17653, 0, 0, -0.999847, 0.0174693, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+48, 180656, 0, -5623.21, -3554.64, 297.618, 0.523598, 0, 0, 0.258819, 0.965926, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+49, 180656, 0, -5541.79, -3464.88, 297.605, 2.79252, 0, 0, 0.984807, 0.173652, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+50, 180656, 0, -5531.11, -3633.95, 297.605, 6.07375, 0, 0, -0.104528, 0.994522, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+51, 180656, 0, -5480.5, -3691.84, 297.605, 4.76475, 0, 0, -0.688354, 0.725374, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+52, 180656, 0, -5404.51, -3717.46, 297.605, 2.51327, 0, 0, 0.951056, 0.309017, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+53, 180656, 0, -5255.98, -3540.55, 297.605, 4.95674, 0, 0, -0.615661, 0.788011, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+54, 180656, 0, -5176.12, -3600.61, 297.605, 2.11185, 0, 0, 0.870356, 0.492424, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+55, 180656, 0, -4923, -3274.12, 297.605, 6.16101, 0, 0, -0.0610485, 0.998135, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+56, 180656, 0, -4779.28, -3489.41, 297.62, 6.21337, 0, 0, -0.0348988, 0.999391, 180, 180, 100, 1, 0, 0, 7, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@PTEMPLATE+2, 1, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@PTEMPLATE+3, 1, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@PTEMPLATE+4, 1, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@PTEMPLATE+5, 1, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@PTEMPLATE+6, 1, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@PTEMPLATE+7, 1, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@PTEMPLATE+8, 1, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@PTEMPLATE+9, 1, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@PTEMPLATE+10, 1, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@PTEMPLATE+11, 1, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@PTEMPLATE+12, 1, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@PTEMPLATE+13, 1, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@PTEMPLATE+14, 1, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@PTEMPLATE+15, 1, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@PTEMPLATE+16, 1, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@PTEMPLATE+17, 1, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@PTEMPLATE+18, 1, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@PTEMPLATE+19, 1, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@PTEMPLATE+20, 1, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@PTEMPLATE+21, 1, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@PTEMPLATE+22, 1, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@PTEMPLATE+23, 1, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@PTEMPLATE+24, 1, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@PTEMPLATE+25, 1, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@PTEMPLATE+26, 1, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@PTEMPLATE+27, 1, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@PTEMPLATE+28, 1, 'Floating Debris / Sagefish School - Loch Modan', 7, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+2, @PTEMPLATE+2, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+3, @PTEMPLATE+3, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+4, @PTEMPLATE+4, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+5, @PTEMPLATE+5, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+6, @PTEMPLATE+6, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+7, @PTEMPLATE+7, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+8, @PTEMPLATE+8, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+9, @PTEMPLATE+9, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+10, @PTEMPLATE+10, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+11, @PTEMPLATE+11, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+12, @PTEMPLATE+12, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+13, @PTEMPLATE+13, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+14, @PTEMPLATE+14, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+15, @PTEMPLATE+15, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+16, @PTEMPLATE+16, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+17, @PTEMPLATE+17, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+18, @PTEMPLATE+18, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+19, @PTEMPLATE+19, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+20, @PTEMPLATE+20, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+21, @PTEMPLATE+21, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+22, @PTEMPLATE+22, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+23, @PTEMPLATE+23, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+24, @PTEMPLATE+24, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+25, @PTEMPLATE+25, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+26, @PTEMPLATE+26, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+27, @PTEMPLATE+27, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+28, @PTEMPLATE+28, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+29, @PTEMPLATE+1, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+30, @PTEMPLATE+2, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+31, @PTEMPLATE+3, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+32, @PTEMPLATE+4, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+33, @PTEMPLATE+5, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+34, @PTEMPLATE+6, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+35, @PTEMPLATE+7, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+36, @PTEMPLATE+8, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+37, @PTEMPLATE+9, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+38, @PTEMPLATE+10, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+39, @PTEMPLATE+11, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+40, @PTEMPLATE+12, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+41, @PTEMPLATE+13, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+42, @PTEMPLATE+14, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+43, @PTEMPLATE+15, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+44, @PTEMPLATE+16, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+45, @PTEMPLATE+17, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+46, @PTEMPLATE+18, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+47, @PTEMPLATE+19, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+48, @PTEMPLATE+20, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+49, @PTEMPLATE+21, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+50, @PTEMPLATE+22, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+51, @PTEMPLATE+23, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+52, @PTEMPLATE+24, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+53, @PTEMPLATE+25, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+54, @PTEMPLATE+26, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+55, @PTEMPLATE+27, 'Floating Debris / Sagefish School - Loch Modan', 7, 10),
(@OGUID+56, @PTEMPLATE+28, 'Floating Debris / Sagefish School - Loch Modan', 7, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+29, 12, 'Loch Modan - Floating Debris / Sagefish School (Master Pool)', 0, 0, 7, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+29, 0, 'Floating Debris / Sagefish School - Loch Modan', 0),
(@PTEMPLATE+2, @PTEMPLATE+29, 0, 'Floating Debris / Sagefish School - Loch Modan', 0),
(@PTEMPLATE+3, @PTEMPLATE+29, 0, 'Floating Debris / Sagefish School - Loch Modan', 0),
(@PTEMPLATE+4, @PTEMPLATE+29, 0, 'Floating Debris / Sagefish School - Loch Modan', 0),
(@PTEMPLATE+5, @PTEMPLATE+29, 0, 'Floating Debris / Sagefish School - Loch Modan', 0),
(@PTEMPLATE+6, @PTEMPLATE+29, 0, 'Floating Debris / Sagefish School - Loch Modan', 0),
(@PTEMPLATE+7, @PTEMPLATE+29, 0, 'Floating Debris / Sagefish School - Loch Modan', 0),
(@PTEMPLATE+8, @PTEMPLATE+29, 0, 'Floating Debris / Sagefish School - Loch Modan', 0),
(@PTEMPLATE+9, @PTEMPLATE+29, 0, 'Floating Debris / Sagefish School - Loch Modan', 0),
(@PTEMPLATE+10, @PTEMPLATE+29, 0, 'Floating Debris / Sagefish School - Loch Modan', 0),
(@PTEMPLATE+11, @PTEMPLATE+29, 0, 'Floating Debris / Sagefish School - Loch Modan', 0),
(@PTEMPLATE+12, @PTEMPLATE+29, 0, 'Floating Debris / Sagefish School - Loch Modan', 0),
(@PTEMPLATE+13, @PTEMPLATE+29, 0, 'Floating Debris / Sagefish School - Loch Modan', 0),
(@PTEMPLATE+14, @PTEMPLATE+29, 0, 'Floating Debris / Sagefish School - Loch Modan', 0),
(@PTEMPLATE+15, @PTEMPLATE+29, 0, 'Floating Debris / Sagefish School - Loch Modan', 0),
(@PTEMPLATE+16, @PTEMPLATE+29, 0, 'Floating Debris / Sagefish School - Loch Modan', 0),
(@PTEMPLATE+17, @PTEMPLATE+29, 0, 'Floating Debris / Sagefish School - Loch Modan', 0),
(@PTEMPLATE+18, @PTEMPLATE+29, 0, 'Floating Debris / Sagefish School - Loch Modan', 0),
(@PTEMPLATE+19, @PTEMPLATE+29, 0, 'Floating Debris / Sagefish School - Loch Modan', 0),
(@PTEMPLATE+20, @PTEMPLATE+29, 0, 'Floating Debris / Sagefish School - Loch Modan', 0),
(@PTEMPLATE+21, @PTEMPLATE+29, 0, 'Floating Debris / Sagefish School - Loch Modan', 0),
(@PTEMPLATE+22, @PTEMPLATE+29, 0, 'Floating Debris / Sagefish School - Loch Modan', 0),
(@PTEMPLATE+23, @PTEMPLATE+29, 0, 'Floating Debris / Sagefish School - Loch Modan', 0),
(@PTEMPLATE+24, @PTEMPLATE+29, 0, 'Floating Debris / Sagefish School - Loch Modan', 0),
(@PTEMPLATE+25, @PTEMPLATE+29, 0, 'Floating Debris / Sagefish School - Loch Modan', 0),
(@PTEMPLATE+26, @PTEMPLATE+29, 0, 'Floating Debris / Sagefish School - Loch Modan', 0),
(@PTEMPLATE+27, @PTEMPLATE+29, 0, 'Floating Debris / Sagefish School - Loch Modan', 0),
(@PTEMPLATE+28, @PTEMPLATE+29, 0, 'Floating Debris / Sagefish School - Loch Modan', 0);

UPDATE `pool_gameobject` SET `chance` = 30 WHERE `description` = "Floating Debris / Sagefish School - Loch Modan" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 180655);
UPDATE `pool_gameobject` SET `chance` = 70 WHERE `description` = "Floating Debris / Sagefish School - Loch Modan" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 180656);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
