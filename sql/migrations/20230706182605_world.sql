DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230706182605');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230706182605');
-- Add your query below.


SET @OGUID = 19510;
SET @PTEMPLATE = 4451;

-- 1497 Undercity / 3662 / 3705 / Food Crate / Barrel of Milk
DELETE FROM `pool_template` WHERE `entry` IN (SELECT `pool_entry` FROM `pool_gameobject` WHERE `guid` IN (45009, 45010, 45011, 45012, 45013, 55606, 55636, 55674));
DELETE FROM `gameobject` WHERE `guid` IN (45009, 45010, 45011, 45012, 45013, 55606, 55636, 55674);
DELETE FROM `pool_gameobject` WHERE `guid` IN (45009, 45010, 45011, 45012, 45013, 55606, 55636, 55674);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 3662, 0, 1455.03, 120.887, -60.1912, -2.11185, 0, 0, 0.870356, -0.492423, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 3662, 0, 1503.96, 344.823, -60.0877, -0.10472, 0, 0, 0.052336, -0.99863, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 3662, 0, 1526.48, 167.26, -42.6944, 2.09439, 0, 0, 0.866025, 0.5, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 3662, 0, 1604.67, 204.438, -55.343, 1.67552, 0, 0, 0.743145, 0.669131, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 3662, 0, 1660.31, 174.48, -41.3685, 3.00195, 0, 0, 0.997563, 0.0697661, 180, 180, 255, 1, 0, 0, 0, 10),
(@OGUID+6, 3662, 0, 1666.5, 115.051, -61.4739, 4.03171, 0, 0, -0.902585, 0.430512, 180, 180, 255, 1, 0, 0, 0, 10),
(@OGUID+7, 3662, 0, 1685.6, 140.026, -60.4732, -1.51844, 0, 0, 0.688354, -0.725374, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 3662, 0, 1378.8, 129.229, -62.3218, 4.60767, 0, 0, -0.743144, 0.669131, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 3662, 0, 1385.12, 373.351, -66.0055, 3.90954, 0, 0, -0.927183, 0.374608, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 3662, 0, 1419.91, 182.331, -62.1451, 2.74016, 0, 0, 0.979924, 0.19937, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 3662, 0, 1424.73, 371.461, -66.0016, 2.79252, 0, 0, 0.984807, 0.173652, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 3662, 0, 1425.11, 425.659, -84.9655, 5.98648, 0, 0, -0.147809, 0.989016, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 3662, 0, 1453.82, 71.8349, -62.2834, 3.12412, 0, 0, 0.999962, 0.00873464, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 3662, 0, 1504.66, 396.178, -62.2864, 1.36136, 0, 0, 0.62932, 0.777146, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 3662, 0, 1514.07, 58.333, -62.3423, 3.78737, 0, 0, -0.948323, 0.317306, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 3662, 0, 1530.09, 304.787, -41.3709, 4.62512, 0, 0, -0.737277, 0.675591, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 3662, 0, 1542.7, 264.242, -43.1032, 4.88692, 0, 0, -0.642787, 0.766045, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 3662, 0, 1554.96, 199.588, -43.1024, 5.61996, 0, 0, -0.325567, 0.945519, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 3662, 0, 1591.44, 281.779, -55.3429, 2.07694, 0, 0, 0.861629, 0.507539, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 3662, 0, 1634.82, 199.081, -43.1023, 3.03684, 0, 0, 0.998629, 0.0523532, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 3662, 0, 1663.39, 77.7893, -62.1818, 2.14675, 0, 0, 0.878817, 0.47716, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 3662, 0, 1668.99, 313.588, -41.9005, 3.42085, 0, 0, -0.990268, 0.139175, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 3662, 0, 1722.61, 181.031, -60.7738, 3.4383, 0, 0, -0.989016, 0.147811, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 3662, 0, 1737.67, 121.413, -60.1134, 5.23599, 0, 0, -0.5, 0.866025, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 3662, 0, 1742.27, 28.6836, -59.317, 0.0523589, 0, 0, 0.0261765, 0.999657, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 3705, 0, 1455.03, 120.887, -60.1912, -2.11185, 0, 0, 0.870356, -0.492423, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 3705, 0, 1503.96, 344.823, -60.0877, -0.10472, 0, 0, 0.052336, -0.99863, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 3705, 0, 1526.48, 167.26, -42.6944, 2.09439, 0, 0, 0.866025, 0.5, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+29, 3705, 0, 1604.67, 204.438, -55.343, 1.67552, 0, 0, 0.743145, 0.669131, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+30, 3705, 0, 1660.31, 174.48, -41.3685, 3.00195, 0, 0, 0.997563, 0.0697661, 180, 180, 255, 1, 0, 0, 0, 10),
(@OGUID+31, 3705, 0, 1666.5, 115.051, -61.4739, 4.03171, 0, 0, -0.902585, 0.430512, 180, 180, 255, 1, 0, 0, 0, 10),
(@OGUID+32, 3705, 0, 1685.6, 140.026, -60.4732, -1.51844, 0, 0, 0.688354, -0.725374, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+33, 3705, 0, 1378.8, 129.229, -62.3218, 4.60767, 0, 0, -0.743144, 0.669131, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+34, 3705, 0, 1385.12, 373.351, -66.0055, 3.90954, 0, 0, -0.927183, 0.374608, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+35, 3705, 0, 1419.91, 182.331, -62.1451, 2.74016, 0, 0, 0.979924, 0.19937, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+36, 3705, 0, 1424.73, 371.461, -66.0016, 2.79252, 0, 0, 0.984807, 0.173652, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+37, 3705, 0, 1425.11, 425.659, -84.9655, 5.98648, 0, 0, -0.147809, 0.989016, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+38, 3705, 0, 1453.82, 71.8349, -62.2834, 3.12412, 0, 0, 0.999962, 0.00873464, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+39, 3705, 0, 1504.66, 396.178, -62.2864, 1.36136, 0, 0, 0.62932, 0.777146, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+40, 3705, 0, 1514.07, 58.333, -62.3423, 3.78737, 0, 0, -0.948323, 0.317306, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+41, 3705, 0, 1530.09, 304.787, -41.3709, 4.62512, 0, 0, -0.737277, 0.675591, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+42, 3705, 0, 1542.7, 264.242, -43.1032, 4.88692, 0, 0, -0.642787, 0.766045, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+43, 3705, 0, 1554.96, 199.588, -43.1024, 5.61996, 0, 0, -0.325567, 0.945519, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+44, 3705, 0, 1591.44, 281.779, -55.3429, 2.07694, 0, 0, 0.861629, 0.507539, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+45, 3705, 0, 1634.82, 199.081, -43.1023, 3.03684, 0, 0, 0.998629, 0.0523532, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+46, 3705, 0, 1663.39, 77.7893, -62.1818, 2.14675, 0, 0, 0.878817, 0.47716, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+47, 3705, 0, 1668.99, 313.588, -41.9005, 3.42085, 0, 0, -0.990268, 0.139175, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+48, 3705, 0, 1722.61, 181.031, -60.7738, 3.4383, 0, 0, -0.989016, 0.147811, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+49, 3705, 0, 1737.67, 121.413, -60.1134, 5.23599, 0, 0, -0.5, 0.866025, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+50, 3705, 0, 1742.27, 28.6836, -59.317, 0.0523589, 0, 0, 0.0261765, 0.999657, 180, 180, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@PTEMPLATE+2, 1, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@PTEMPLATE+3, 1, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@PTEMPLATE+4, 1, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@PTEMPLATE+5, 1, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@PTEMPLATE+6, 1, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@PTEMPLATE+7, 1, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@PTEMPLATE+8, 1, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@PTEMPLATE+9, 1, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@PTEMPLATE+10, 1, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@PTEMPLATE+11, 1, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@PTEMPLATE+12, 1, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@PTEMPLATE+13, 1, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@PTEMPLATE+14, 1, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@PTEMPLATE+15, 1, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@PTEMPLATE+16, 1, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@PTEMPLATE+17, 1, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@PTEMPLATE+18, 1, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@PTEMPLATE+19, 1, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@PTEMPLATE+20, 1, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@PTEMPLATE+21, 1, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@PTEMPLATE+22, 1, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@PTEMPLATE+23, 1, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@PTEMPLATE+24, 1, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@PTEMPLATE+25, 1, 'Food Crate / Barrel of Milk - Undercity', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+2, @PTEMPLATE+2, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+3, @PTEMPLATE+3, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+4, @PTEMPLATE+4, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+5, @PTEMPLATE+5, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+6, @PTEMPLATE+6, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+7, @PTEMPLATE+7, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+8, @PTEMPLATE+8, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+9, @PTEMPLATE+9, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+10, @PTEMPLATE+10, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+11, @PTEMPLATE+11, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+12, @PTEMPLATE+12, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+13, @PTEMPLATE+13, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+14, @PTEMPLATE+14, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+15, @PTEMPLATE+15, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+16, @PTEMPLATE+16, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+17, @PTEMPLATE+17, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+18, @PTEMPLATE+18, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+19, @PTEMPLATE+19, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+20, @PTEMPLATE+20, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+21, @PTEMPLATE+21, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+22, @PTEMPLATE+22, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+23, @PTEMPLATE+23, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+24, @PTEMPLATE+24, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+25, @PTEMPLATE+25, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+26, @PTEMPLATE+1, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+27, @PTEMPLATE+2, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+28, @PTEMPLATE+3, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+29, @PTEMPLATE+4, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+30, @PTEMPLATE+5, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+31, @PTEMPLATE+6, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+32, @PTEMPLATE+7, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+33, @PTEMPLATE+8, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+34, @PTEMPLATE+9, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+35, @PTEMPLATE+10, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+36, @PTEMPLATE+11, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+37, @PTEMPLATE+12, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+38, @PTEMPLATE+13, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+39, @PTEMPLATE+14, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+40, @PTEMPLATE+15, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+41, @PTEMPLATE+16, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+42, @PTEMPLATE+17, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+43, @PTEMPLATE+18, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+44, @PTEMPLATE+19, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+45, @PTEMPLATE+20, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+46, @PTEMPLATE+21, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+47, @PTEMPLATE+22, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+48, @PTEMPLATE+23, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+49, @PTEMPLATE+24, 'Food Crate / Barrel of Milk - Undercity', 0, 10),
(@OGUID+50, @PTEMPLATE+25, 'Food Crate / Barrel of Milk - Undercity', 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+26, 11, 'Undercity - Food Crate / Barrel of Milk (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+26, 0, 'Food Crate / Barrel of Milk - Undercity', 0),
(@PTEMPLATE+2, @PTEMPLATE+26, 0, 'Food Crate / Barrel of Milk - Undercity', 0),
(@PTEMPLATE+3, @PTEMPLATE+26, 0, 'Food Crate / Barrel of Milk - Undercity', 0),
(@PTEMPLATE+4, @PTEMPLATE+26, 0, 'Food Crate / Barrel of Milk - Undercity', 0),
(@PTEMPLATE+5, @PTEMPLATE+26, 0, 'Food Crate / Barrel of Milk - Undercity', 0),
(@PTEMPLATE+6, @PTEMPLATE+26, 0, 'Food Crate / Barrel of Milk - Undercity', 0),
(@PTEMPLATE+7, @PTEMPLATE+26, 0, 'Food Crate / Barrel of Milk - Undercity', 0),
(@PTEMPLATE+8, @PTEMPLATE+26, 0, 'Food Crate / Barrel of Milk - Undercity', 0),
(@PTEMPLATE+9, @PTEMPLATE+26, 0, 'Food Crate / Barrel of Milk - Undercity', 0),
(@PTEMPLATE+10, @PTEMPLATE+26, 0, 'Food Crate / Barrel of Milk - Undercity', 0),
(@PTEMPLATE+11, @PTEMPLATE+26, 0, 'Food Crate / Barrel of Milk - Undercity', 0),
(@PTEMPLATE+12, @PTEMPLATE+26, 0, 'Food Crate / Barrel of Milk - Undercity', 0),
(@PTEMPLATE+13, @PTEMPLATE+26, 0, 'Food Crate / Barrel of Milk - Undercity', 0),
(@PTEMPLATE+14, @PTEMPLATE+26, 0, 'Food Crate / Barrel of Milk - Undercity', 0),
(@PTEMPLATE+15, @PTEMPLATE+26, 0, 'Food Crate / Barrel of Milk - Undercity', 0),
(@PTEMPLATE+16, @PTEMPLATE+26, 0, 'Food Crate / Barrel of Milk - Undercity', 0),
(@PTEMPLATE+17, @PTEMPLATE+26, 0, 'Food Crate / Barrel of Milk - Undercity', 0),
(@PTEMPLATE+18, @PTEMPLATE+26, 0, 'Food Crate / Barrel of Milk - Undercity', 0),
(@PTEMPLATE+19, @PTEMPLATE+26, 0, 'Food Crate / Barrel of Milk - Undercity', 0),
(@PTEMPLATE+20, @PTEMPLATE+26, 0, 'Food Crate / Barrel of Milk - Undercity', 0),
(@PTEMPLATE+21, @PTEMPLATE+26, 0, 'Food Crate / Barrel of Milk - Undercity', 0),
(@PTEMPLATE+22, @PTEMPLATE+26, 0, 'Food Crate / Barrel of Milk - Undercity', 0),
(@PTEMPLATE+23, @PTEMPLATE+26, 0, 'Food Crate / Barrel of Milk - Undercity', 0),
(@PTEMPLATE+24, @PTEMPLATE+26, 0, 'Food Crate / Barrel of Milk - Undercity', 0),
(@PTEMPLATE+25, @PTEMPLATE+26, 0, 'Food Crate / Barrel of Milk - Undercity', 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
