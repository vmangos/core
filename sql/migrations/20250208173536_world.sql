DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250208173536');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250208173536');
-- Add your query below.


-- Stonetalon Mountains
UPDATE `pool_template` SET `description` = 'Copper Veins - Stonetalon Mountains (Master Pool)' WHERE `entry` = 1089;

-- Tin Vein / Silver Vein
DELETE FROM `pool_gameobject` WHERE `guid` = 27255;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(22035, 1733, 1, 2450.75, 1557.49, 277.38, 1.18682, 0, 0, 0.559193, 0.829038, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(1567, 1, 'Tin Vein / Silver Vein - Stonetalon Mountains', 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(27255, 1567, 'Tin Vein / Silver Vein - Stonetalon Mountains', 10),
(22035, 1567, 'Tin Vein / Silver Vein - Stonetalon Mountains', 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1567, 1090, 0, 'Stonetalon Mountains - Tin Vein / Silver Vein', 0);

-- Silver Vein / Gold Vein / Iron Deposit
DELETE FROM `gameobject` WHERE `guid` IN (27218, 27264, 28419, 27301, 427323, 28329, 28330, 28331, 28332, 28333, 28334, 28335, 28336, 28337, 28338, 28339, 28340, 28341, 28342, 28343, 28344, 28345, 28346, 28347, 28348, 28349, 28350, 28351, 28352, 28353, 28354, 28355, 28356, 28357, 28358, 28359, 28360, 28361, 28362, 28363, 28364, 28365, 28366, 28367, 28368, 28369, 28370, 28371, 28372, 28373, 28374, 28375, 28376, 28377, 28378, 28379, 28380, 28381, 28382, 28383, 28384, 28385, 28386, 28387, 28388, 28389, 28390, 28391, 28392, 28393, 28394, 28395, 28396, 28397, 28398, 28399, 28400, 28401, 28402, 28403, 28404, 28405, 28406, 28407, 28408, 28409, 28410, 28411, 28412, 28413, 28414, 28415, 28416, 28417, 28418, 427081, 427082, 427083, 427084, 427085, 427308, 427309, 427310, 427311, 427312, 427313, 427314, 427315, 427316, 427317, 427318, 427319, 427320, 427321, 427322);
DELETE FROM `pool_gameobject` WHERE `guid` IN (27218, 27264, 28419, 27301, 427323, 28329, 28330, 28331, 28332, 28333, 28334, 28335, 28336, 28337, 28338, 28339, 28340, 28341, 28342, 28343, 28344, 28345, 28346, 28347, 28348, 28349, 28350, 28351, 28352, 28353, 28354, 28355, 28356, 28357, 28358, 28359, 28360, 28361, 28362, 28363, 28364, 28365, 28366, 28367, 28368, 28369, 28370, 28371, 28372, 28373, 28374, 28375, 28376, 28377, 28378, 28379, 28380, 28381, 28382, 28383, 28384, 28385, 28386, 28387, 28388, 28389, 28390, 28391, 28392, 28393, 28394, 28395, 28396, 28397, 28398, 28399, 28400, 28401, 28402, 28403, 28404, 28405, 28406, 28407, 28408, 28409, 28410, 28411, 28412, 28413, 28414, 28415, 28416, 28417, 28418, 427081, 427082, 427083, 427084, 427085, 427308, 427309, 427310, 427311, 427312, 427313, 427314, 427315, 427316, 427317, 427318, 427319, 427320, 427321, 427322);
DELETE FROM `pool_template` WHERE `entry` IN (1091, 2299, 2336, 1927, 1928, 1929, 1930, 1931, 1932, 1933, 1934, 1935, 1936, 1937, 1938, 1939, 1940, 1941, 1942, 1943, 1944, 17055, 17120, 17121, 17122);
DELETE FROM `pool_pool` WHERE `pool_id` IN (2299, 2336);
DELETE FROM `pool_pool` WHERE `mother_pool` IN (1091);

-- Silver Vein / Gold Vein / Iron Deposit
SET @OGUID = 21923;
SET @PTEMPLATE = 8841;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1733, 1, 471.83, 1693.53, 31.8308, 4.60767, 0, 0, -0.743144, 0.669131, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1733, 1, 592.311, 1904.49, 19.9064, 5.42797, 0, 0, -0.414693, 0.909961, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1733, 1, 641.753, 1416.86, 9.3058, 2.75761, 0, 0, 0.981627, 0.190812, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1733, 1, 824.478, 1724.76, -15.1428, 4.88692, 0, 0, -0.642787, 0.766045, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1733, 1, 892.079, 1850.13, 15.1665, 4.53786, 0, 0, -0.766044, 0.642789, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1733, 1, 2229.49, 1354.33, 315.216, 2.87979, 0, 0, 0.991445, 0.130528, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1733, 1, 2291.5, 1287.6, 346.898, 0.244346, 0, 0, 0.121869, 0.992546, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1733, 1, 2616.56, 1516.24, 257.183, 2.11185, 0, 0, 0.870356, 0.492424, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1733, 1, 2743.31, 1578.79, 299.965, 3.85718, 0, 0, -0.936671, 0.35021, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1733, 1, 2463.74, 1770.67, 374.254, 3.35105, 0, 0, -0.994521, 0.104536, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 1733, 1, 2450.95, 1559.48, 277.567, 2.86234, 0, 0, 0.990268, 0.139175, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 1733, 1, 471.047, 1521.84, 31.6324, 6.14356, 0, 0, -0.0697556, 0.997564, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 1734, 1, 471.83, 1693.53, 31.8308, 4.60767, 0, 0, -0.743144, 0.669131, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 1734, 1, 592.311, 1904.49, 19.9064, 5.42797, 0, 0, -0.414693, 0.909961, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 1734, 1, 641.753, 1416.86, 9.3058, 2.75761, 0, 0, 0.981627, 0.190812, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 1734, 1, 824.478, 1724.76, -15.1428, 4.88692, 0, 0, -0.642787, 0.766045, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 1734, 1, 892.079, 1850.13, 15.1665, 4.53786, 0, 0, -0.766044, 0.642789, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 1734, 1, 2229.49, 1354.33, 315.216, 2.87979, 0, 0, 0.991445, 0.130528, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 1734, 1, 2291.5, 1287.6, 346.898, 0.244346, 0, 0, 0.121869, 0.992546, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 1734, 1, 2616.56, 1516.24, 257.183, 2.11185, 0, 0, 0.870356, 0.492424, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 1734, 1, 2743.31, 1578.79, 299.965, 3.85718, 0, 0, -0.936671, 0.35021, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 1734, 1, 2463.74, 1770.67, 374.254, 3.35105, 0, 0, -0.994521, 0.104536, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 1734, 1, 2450.95, 1559.48, 277.567, 2.86234, 0, 0, 0.990268, 0.139175, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 1734, 1, 471.047, 1521.84, 31.6324, 6.14356, 0, 0, -0.0697556, 0.997564, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 1735, 1, 471.83, 1693.53, 31.8308, 4.60767, 0, 0, -0.743144, 0.669131, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 1735, 1, 592.311, 1904.49, 19.9064, 5.42797, 0, 0, -0.414693, 0.909961, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 1735, 1, 641.753, 1416.86, 9.3058, 2.75761, 0, 0, 0.981627, 0.190812, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 1735, 1, 824.478, 1724.76, -15.1428, 4.88692, 0, 0, -0.642787, 0.766045, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+29, 1735, 1, 892.079, 1850.13, 15.1665, 4.53786, 0, 0, -0.766044, 0.642789, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+30, 1735, 1, 2229.49, 1354.33, 315.216, 2.87979, 0, 0, 0.991445, 0.130528, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+31, 1735, 1, 2291.5, 1287.6, 346.898, 0.244346, 0, 0, 0.121869, 0.992546, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+32, 1735, 1, 2616.56, 1516.24, 257.183, 2.11185, 0, 0, 0.870356, 0.492424, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+33, 1735, 1, 2743.31, 1578.79, 299.965, 3.85718, 0, 0, -0.936671, 0.35021, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+34, 1735, 1, 2463.74, 1770.67, 374.254, 3.35105, 0, 0, -0.994521, 0.104536, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+35, 1735, 1, 2450.95, 1559.48, 277.567, 2.86234, 0, 0, 0.990268, 0.139175, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+36, 1735, 1, 471.047, 1521.84, 31.6324, 6.14356, 0, 0, -0.0697556, 0.997564, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains', 10),
(@PTEMPLATE+2, 1, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains', 10),
(@PTEMPLATE+3, 1, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains', 10),
(@PTEMPLATE+4, 1, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains', 10),
(@PTEMPLATE+5, 1, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains', 10),
(@PTEMPLATE+6, 1, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains', 10),
(@PTEMPLATE+7, 1, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains', 10),
(@PTEMPLATE+8, 1, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains', 10),
(@PTEMPLATE+9, 1, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains', 10),
(@PTEMPLATE+10, 1, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains', 10),
(@PTEMPLATE+11, 1, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains', 10),
(@PTEMPLATE+12, 1, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains', 10),
(@OGUID+2, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains', 10),
(@OGUID+3, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains', 10),
(@OGUID+4, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains', 10),
(@OGUID+5, @PTEMPLATE+5, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains', 10),
(@OGUID+6, @PTEMPLATE+6, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains', 10),
(@OGUID+7, @PTEMPLATE+7, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains', 10),
(@OGUID+8, @PTEMPLATE+8, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains', 10),
(@OGUID+9, @PTEMPLATE+9, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains', 10),
(@OGUID+10, @PTEMPLATE+10, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains', 10),
(@OGUID+11, @PTEMPLATE+11, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains', 10),
(@OGUID+12, @PTEMPLATE+12, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains', 10),
(@OGUID+13, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains', 10),
(@OGUID+14, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains', 10),
(@OGUID+15, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains', 10),
(@OGUID+16, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains', 10),
(@OGUID+17, @PTEMPLATE+5, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains', 10),
(@OGUID+18, @PTEMPLATE+6, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains', 10),
(@OGUID+19, @PTEMPLATE+7, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains', 10),
(@OGUID+20, @PTEMPLATE+8, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains', 10),
(@OGUID+21, @PTEMPLATE+9, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains', 10),
(@OGUID+22, @PTEMPLATE+10, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains', 10),
(@OGUID+23, @PTEMPLATE+11, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains', 10),
(@OGUID+24, @PTEMPLATE+12, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains', 10),
(@OGUID+25, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains', 10),
(@OGUID+26, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains', 10),
(@OGUID+27, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains', 10),
(@OGUID+28, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains', 10),
(@OGUID+29, @PTEMPLATE+5, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains', 10),
(@OGUID+30, @PTEMPLATE+6, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains', 10),
(@OGUID+31, @PTEMPLATE+7, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains', 10),
(@OGUID+32, @PTEMPLATE+8, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains', 10),
(@OGUID+33, @PTEMPLATE+9, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains', 10),
(@OGUID+34, @PTEMPLATE+10, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains', 10),
(@OGUID+35, @PTEMPLATE+11, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains', 10),
(@OGUID+36, @PTEMPLATE+12, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains', 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(1091, 4, 'Stonetalon Mountains - Silver Vein / Gold Vein / Iron Deposit (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1091, 0, 'Stonetalon Mountains - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+2, 1091, 0, 'Stonetalon Mountains - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+3, 1091, 0, 'Stonetalon Mountains - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+4, 1091, 0, 'Stonetalon Mountains - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+5, 1091, 0, 'Stonetalon Mountains - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+6, 1091, 0, 'Stonetalon Mountains - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+7, 1091, 0, 'Stonetalon Mountains - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+8, 1091, 0, 'Stonetalon Mountains - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+9, 1091, 0, 'Stonetalon Mountains - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+10, 1091, 0, 'Stonetalon Mountains - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+11, 1091, 0, 'Stonetalon Mountains - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+12, 1091, 0, 'Stonetalon Mountains - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Gold Vein / Mithril Deposit / Truesilver Deposit
SET @OGUID = 68951;
SET @PTEMPLATE = 8853;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1734, 1, 435.737, 1468.71, 38.6624, 4.7473, 0, 0, -0.694658, 0.71934, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1734, 1, 450.51, 1604.75, 24.6407, 5.95157, 0, 0, -0.165047, 0.986286, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1734, 1, 516.378, 1829.76, 12.888, 3.15906, 0, 0, -0.999962, 0.00873464, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1734, 1, 663.333, 1399.73, 21.9571, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1734, 1, 744.61, 1543.04, -18.1738, 5.89921, 0, 0, -0.190808, 0.981627, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1734, 1, 758.625, 1793.01, -13.7902, 0.855211, 0, 0, 0.414693, 0.909961, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1734, 1, 793.298, 1391.64, -0.47419, 1.32645, 0, 0, 0.615661, 0.788011, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1734, 1, 857.82, 1923.35, 25.0864, 1.25664, 0, 0, 0.587785, 0.809017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1734, 1, 916.968, 1492.84, 14.9964, 6.10865, 0, 0, -0.0871553, 0.996195, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1734, 1, 969.634, 1775.25, 20.448, 4.11898, 0, 0, -0.882947, 0.469473, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 1734, 1, 999.73, 1653.85, 11.5945, 3.4383, 0, 0, -0.989016, 0.147811, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 1734, 1, 1392.52, 1516.42, 146.42, 0.733038, 0, 0, 0.358368, 0.93358, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 2040, 1, 435.737, 1468.71, 38.6624, 4.7473, 0, 0, -0.694658, 0.71934, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 2040, 1, 450.51, 1604.75, 24.6407, 5.95157, 0, 0, -0.165047, 0.986286, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 2040, 1, 516.378, 1829.76, 12.888, 3.15906, 0, 0, -0.999962, 0.00873464, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 2040, 1, 663.333, 1399.73, 21.9571, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 2040, 1, 744.61, 1543.04, -18.1738, 5.89921, 0, 0, -0.190808, 0.981627, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 2040, 1, 758.625, 1793.01, -13.7902, 0.855211, 0, 0, 0.414693, 0.909961, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 2040, 1, 793.298, 1391.64, -0.47419, 1.32645, 0, 0, 0.615661, 0.788011, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 2040, 1, 857.82, 1923.35, 25.0864, 1.25664, 0, 0, 0.587785, 0.809017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 2040, 1, 916.968, 1492.84, 14.9964, 6.10865, 0, 0, -0.0871553, 0.996195, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 2040, 1, 969.634, 1775.25, 20.448, 4.11898, 0, 0, -0.882947, 0.469473, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 2040, 1, 999.73, 1653.85, 11.5945, 3.4383, 0, 0, -0.989016, 0.147811, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 2040, 1, 1392.52, 1516.42, 146.42, 0.733038, 0, 0, 0.358368, 0.93358, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 2047, 1, 435.737, 1468.71, 38.6624, 4.7473, 0, 0, -0.694658, 0.71934, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 2047, 1, 450.51, 1604.75, 24.6407, 5.95157, 0, 0, -0.165047, 0.986286, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 2047, 1, 516.378, 1829.76, 12.888, 3.15906, 0, 0, -0.999962, 0.00873464, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 2047, 1, 663.333, 1399.73, 21.9571, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+29, 2047, 1, 744.61, 1543.04, -18.1738, 5.89921, 0, 0, -0.190808, 0.981627, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+30, 2047, 1, 758.625, 1793.01, -13.7902, 0.855211, 0, 0, 0.414693, 0.909961, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+31, 2047, 1, 793.298, 1391.64, -0.47419, 1.32645, 0, 0, 0.615661, 0.788011, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+32, 2047, 1, 857.82, 1923.35, 25.0864, 1.25664, 0, 0, 0.587785, 0.809017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+33, 2047, 1, 916.968, 1492.84, 14.9964, 6.10865, 0, 0, -0.0871553, 0.996195, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+34, 2047, 1, 969.634, 1775.25, 20.448, 4.11898, 0, 0, -0.882947, 0.469473, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+35, 2047, 1, 999.73, 1653.85, 11.5945, 3.4383, 0, 0, -0.989016, 0.147811, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+36, 2047, 1, 1392.52, 1516.42, 146.42, 0.733038, 0, 0, 0.358368, 0.93358, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@PTEMPLATE+2, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@PTEMPLATE+3, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@PTEMPLATE+4, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@PTEMPLATE+5, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@PTEMPLATE+6, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@PTEMPLATE+7, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@PTEMPLATE+8, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@PTEMPLATE+9, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@PTEMPLATE+10, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@PTEMPLATE+11, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@PTEMPLATE+12, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+2, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+3, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+4, @PTEMPLATE+4, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+5, @PTEMPLATE+5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+6, @PTEMPLATE+6, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+7, @PTEMPLATE+7, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+8, @PTEMPLATE+8, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+9, @PTEMPLATE+9, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+10, @PTEMPLATE+10, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+11, @PTEMPLATE+11, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+12, @PTEMPLATE+12, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+13, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+14, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+15, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+16, @PTEMPLATE+4, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+17, @PTEMPLATE+5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+18, @PTEMPLATE+6, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+19, @PTEMPLATE+7, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+20, @PTEMPLATE+8, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+21, @PTEMPLATE+9, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+22, @PTEMPLATE+10, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+23, @PTEMPLATE+11, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+24, @PTEMPLATE+12, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+25, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+26, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+27, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+28, @PTEMPLATE+4, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+29, @PTEMPLATE+5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+30, @PTEMPLATE+6, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+31, @PTEMPLATE+7, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+32, @PTEMPLATE+8, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+33, @PTEMPLATE+9, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+34, @PTEMPLATE+10, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+35, @PTEMPLATE+11, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+36, @PTEMPLATE+12, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(1927, 2, 'Stonetalon Mountains - Gold Vein / Mithril Deposit / Truesilver Deposit (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1927, 0, 'Stonetalon Mountains - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+2, 1927, 0, 'Stonetalon Mountains - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+3, 1927, 0, 'Stonetalon Mountains - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+4, 1927, 0, 'Stonetalon Mountains - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+5, 1927, 0, 'Stonetalon Mountains - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+6, 1927, 0, 'Stonetalon Mountains - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+7, 1927, 0, 'Stonetalon Mountains - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+8, 1927, 0, 'Stonetalon Mountains - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+9, 1927, 0, 'Stonetalon Mountains - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+10, 1927, 0, 'Stonetalon Mountains - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+11, 1927, 0, 'Stonetalon Mountains - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+12, 1927, 0, 'Stonetalon Mountains - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Add Chance
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Tin Vein / Silver Vein - Stonetalon Mountains" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1732);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Tin Vein / Silver Vein - Stonetalon Mountains" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
