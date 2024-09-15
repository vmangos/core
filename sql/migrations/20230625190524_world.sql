DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230625190524');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230625190524');
-- Add your query below.


SET @OGUID = 24529;
SET @PTEMPLATE = 1971;

-- Westfall
DELETE FROM `gameobject` WHERE `guid` IN (1637, 1639, 1645, 1646, 1650, 1655, 1656, 1691, 1699, 1729, 1732, 1734, 1735, 1736, 1744, 1762, 1768, 1769, 27589, 42693, 42694, 42695, 42696, 42697, 42698, 47247, 47283);
DELETE FROM `pool_gameobject` WHERE `guid` IN (1637, 1639, 1645, 1646, 1650, 1655, 1656, 1691, 1699, 1729, 1732, 1734, 1735, 1736, 1744, 1762, 1768, 1769, 27589, 42693, 42694, 42695, 42696, 42697, 42698, 47247, 47283);
DELETE FROM `pool_template` WHERE `entry` IN (SELECT `pool_entry` FROM `pool_gameobject` WHERE `guid` IN (1637, 1639, 1645, 1646, 1650, 1655, 1656, 1691, 1699, 1729, 1732, 1734, 1735, 1736, 1744, 1762, 1768, 1769, 27589, 42693, 42694, 42695, 42696, 42697, 42698, 47247, 47283));

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 180582, 0, -11243.9, 2021.24, 0, 2.23402, 0, 0, 0.898794, 0.438371, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+2, 180582, 0, -10790.8, 2126.85, 0, 1.27409, 0, 0, 0.594823, 0.803857, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+3, 180582, 0, -10549.4, 2127.94, 0, 1.91986, 0, 0, 0.819152, 0.573576, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+4, 180582, 0, -10411.3, 2116.25, 0, 0.506145, 0, 0, 0.25038, 0.968148, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+5, 180582, 0, -10326.1, 2091.91, 0, 2.96706, 0, 0, 0.996195, 0.087156, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+6, 180582, 0, -9882.07, 1833.48, 0, 1.11701, 0, 0, 0.529919, 0.848048, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+7, 180582, 0, -9808.47, 1813.63, 0, 1.53589, 0, 0, 0.694658, 0.71934, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+8, 180582, 0, -9801.39, 1766.6, 0, -0.087267, 0, 0, 0.04362, -0.999048, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+9, 180582, 0, -9574.33, 1392.54, 0, -0.122173, 0, 0, 0.061049, -0.998135, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+10, 180582, 0, -11450, 1801.7, 0, 4.01426, 0, 0, -0.906307, 0.422619, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+11, 180582, 0, -11372.5, 1953.38, 0, 2.74016, 0, 0, 0.979924, 0.19937, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+12, 180582, 0, -11117, 2055.51, 0, 0.942477, 0, 0, 0.45399, 0.891007, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+13, 180582, 0, -11077.3, 2115.66, 0, 1.50098, 0, 0, 0.681998, 0.731354, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+14, 180582, 0, -10942.5, 2133.54, 0, 4.39823, 0, 0, -0.809016, 0.587786, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+15, 180582, 0, -10699.8, 2163.26, 0, 3.85718, 0, 0, -0.936671, 0.35021, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+16, 180582, 0, -10182.1, 2063.74, 0, 5.41052, 0, 0, -0.422618, 0.906308, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+17, 180582, 0, -10106.6, 2022.43, 0, 0.453785, 0, 0, 0.224951, 0.97437, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+18, 180582, 0, -10025.7, 1948.16, 0, 2.47837, 0, 0, 0.945518, 0.325568, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+19, 180582, 0, -9803.17, 1767.27, 0, 0.785397, 0, 0, 0.382683, 0.92388, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+20, 180582, 0, -9619.89, 1573.21, 0, 1.67551, 0, 0, 0.743144, 0.669131, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+21, 180582, 0, -9607.81, 1098.14, 0, 5.16618, 0, 0, -0.529919, 0.848048, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+22, 180582, 0, -9577.72, 1480.38, 0, 5.28835, 0, 0, -0.477159, 0.878817, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+23, 180655, 0, -11243.9, 2021.24, 0, 2.23402, 0, 0, 0.898794, 0.438371, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+24, 180655, 0, -10790.8, 2126.85, 0, 1.27409, 0, 0, 0.594823, 0.803857, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+25, 180655, 0, -10549.4, 2127.94, 0, 1.91986, 0, 0, 0.819152, 0.573576, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+26, 180655, 0, -10411.3, 2116.25, 0, 0.506145, 0, 0, 0.25038, 0.968148, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+27, 180655, 0, -10326.1, 2091.91, 0, 2.96706, 0, 0, 0.996195, 0.087156, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+28, 180655, 0, -9882.07, 1833.48, 0, 1.11701, 0, 0, 0.529919, 0.848048, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+29, 180655, 0, -9808.47, 1813.63, 0, 1.53589, 0, 0, 0.694658, 0.71934, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+30, 180655, 0, -9801.39, 1766.6, 0, -0.087267, 0, 0, 0.04362, -0.999048, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+31, 180655, 0, -9574.33, 1392.54, 0, -0.122173, 0, 0, 0.061049, -0.998135, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+32, 180655, 0, -11450, 1801.7, 0, 4.01426, 0, 0, -0.906307, 0.422619, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+33, 180655, 0, -11372.5, 1953.38, 0, 2.74016, 0, 0, 0.979924, 0.19937, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+34, 180655, 0, -11117, 2055.51, 0, 0.942477, 0, 0, 0.45399, 0.891007, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+35, 180655, 0, -11077.3, 2115.66, 0, 1.50098, 0, 0, 0.681998, 0.731354, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+36, 180655, 0, -10942.5, 2133.54, 0, 4.39823, 0, 0, -0.809016, 0.587786, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+37, 180655, 0, -10699.8, 2163.26, 0, 3.85718, 0, 0, -0.936671, 0.35021, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+38, 180655, 0, -10182.1, 2063.74, 0, 5.41052, 0, 0, -0.422618, 0.906308, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+39, 180655, 0, -10106.6, 2022.43, 0, 0.453785, 0, 0, 0.224951, 0.97437, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+40, 180655, 0, -10025.7, 1948.16, 0, 2.47837, 0, 0, 0.945518, 0.325568, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+41, 180655, 0, -9803.17, 1767.27, 0, 0.785397, 0, 0, 0.382683, 0.92388, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+42, 180655, 0, -9619.89, 1573.21, 0, 1.67551, 0, 0, 0.743144, 0.669131, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+43, 180655, 0, -9607.81, 1098.14, 0, 5.16618, 0, 0, -0.529919, 0.848048, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+44, 180655, 0, -9577.72, 1480.38, 0, 5.28835, 0, 0, -0.477159, 0.878817, 180, 180, 100, 1, 0, 0, 7, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@PTEMPLATE+2, 1, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@PTEMPLATE+3, 1, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@PTEMPLATE+4, 1, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@PTEMPLATE+5, 1, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@PTEMPLATE+6, 1, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@PTEMPLATE+7, 1, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@PTEMPLATE+8, 1, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@PTEMPLATE+9, 1, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@PTEMPLATE+10, 1, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@PTEMPLATE+11, 1, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@PTEMPLATE+12, 1, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@PTEMPLATE+13, 1, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@PTEMPLATE+14, 1, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@PTEMPLATE+15, 1, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@PTEMPLATE+16, 1, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@PTEMPLATE+17, 1, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@PTEMPLATE+18, 1, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@PTEMPLATE+19, 1, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@PTEMPLATE+20, 1, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@PTEMPLATE+21, 1, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@PTEMPLATE+22, 1, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@OGUID+2, @PTEMPLATE+2, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@OGUID+3, @PTEMPLATE+3, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@OGUID+4, @PTEMPLATE+4, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@OGUID+5, @PTEMPLATE+5, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@OGUID+6, @PTEMPLATE+6, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@OGUID+7, @PTEMPLATE+7, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@OGUID+8, @PTEMPLATE+8, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@OGUID+9, @PTEMPLATE+9, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@OGUID+10, @PTEMPLATE+10, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@OGUID+11, @PTEMPLATE+11, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@OGUID+12, @PTEMPLATE+12, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@OGUID+13, @PTEMPLATE+13, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@OGUID+14, @PTEMPLATE+14, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@OGUID+15, @PTEMPLATE+15, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@OGUID+16, @PTEMPLATE+16, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@OGUID+17, @PTEMPLATE+17, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@OGUID+18, @PTEMPLATE+18, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@OGUID+19, @PTEMPLATE+19, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@OGUID+20, @PTEMPLATE+20, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@OGUID+21, @PTEMPLATE+21, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@OGUID+22, @PTEMPLATE+22, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@OGUID+23, @PTEMPLATE+1, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@OGUID+24, @PTEMPLATE+2, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@OGUID+25, @PTEMPLATE+3, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@OGUID+26, @PTEMPLATE+4, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@OGUID+27, @PTEMPLATE+5, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@OGUID+28, @PTEMPLATE+6, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@OGUID+29, @PTEMPLATE+7, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@OGUID+30, @PTEMPLATE+8, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@OGUID+31, @PTEMPLATE+9, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@OGUID+32, @PTEMPLATE+10, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@OGUID+33, @PTEMPLATE+11, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@OGUID+34, @PTEMPLATE+12, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@OGUID+35, @PTEMPLATE+13, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@OGUID+36, @PTEMPLATE+14, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@OGUID+37, @PTEMPLATE+15, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@OGUID+38, @PTEMPLATE+16, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@OGUID+39, @PTEMPLATE+17, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@OGUID+40, @PTEMPLATE+18, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@OGUID+41, @PTEMPLATE+19, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@OGUID+42, @PTEMPLATE+20, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@OGUID+43, @PTEMPLATE+21, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10),
(@OGUID+44, @PTEMPLATE+22, 'Oily Blackmouth School / Floating Debris - Westfall', 7, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+23, 11, 'Westfall - Oily Blackmouth School / Floating Debris (Master Pool)', 0, 0, 7, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+23, 0, 'Oily Blackmouth School / Floating Debris - Westfall', 0),
(@PTEMPLATE+2, @PTEMPLATE+23, 0, 'Oily Blackmouth School / Floating Debris - Westfall', 0),
(@PTEMPLATE+3, @PTEMPLATE+23, 0, 'Oily Blackmouth School / Floating Debris - Westfall', 0),
(@PTEMPLATE+4, @PTEMPLATE+23, 0, 'Oily Blackmouth School / Floating Debris - Westfall', 0),
(@PTEMPLATE+5, @PTEMPLATE+23, 0, 'Oily Blackmouth School / Floating Debris - Westfall', 0),
(@PTEMPLATE+6, @PTEMPLATE+23, 0, 'Oily Blackmouth School / Floating Debris - Westfall', 0),
(@PTEMPLATE+7, @PTEMPLATE+23, 0, 'Oily Blackmouth School / Floating Debris - Westfall', 0),
(@PTEMPLATE+8, @PTEMPLATE+23, 0, 'Oily Blackmouth School / Floating Debris - Westfall', 0),
(@PTEMPLATE+9, @PTEMPLATE+23, 0, 'Oily Blackmouth School / Floating Debris - Westfall', 0),
(@PTEMPLATE+10, @PTEMPLATE+23, 0, 'Oily Blackmouth School / Floating Debris - Westfall', 0),
(@PTEMPLATE+11, @PTEMPLATE+23, 0, 'Oily Blackmouth School / Floating Debris - Westfall', 0),
(@PTEMPLATE+12, @PTEMPLATE+23, 0, 'Oily Blackmouth School / Floating Debris - Westfall', 0),
(@PTEMPLATE+13, @PTEMPLATE+23, 0, 'Oily Blackmouth School / Floating Debris - Westfall', 0),
(@PTEMPLATE+14, @PTEMPLATE+23, 0, 'Oily Blackmouth School / Floating Debris - Westfall', 0),
(@PTEMPLATE+15, @PTEMPLATE+23, 0, 'Oily Blackmouth School / Floating Debris - Westfall', 0),
(@PTEMPLATE+16, @PTEMPLATE+23, 0, 'Oily Blackmouth School / Floating Debris - Westfall', 0),
(@PTEMPLATE+17, @PTEMPLATE+23, 0, 'Oily Blackmouth School / Floating Debris - Westfall', 0),
(@PTEMPLATE+18, @PTEMPLATE+23, 0, 'Oily Blackmouth School / Floating Debris - Westfall', 0),
(@PTEMPLATE+19, @PTEMPLATE+23, 0, 'Oily Blackmouth School / Floating Debris - Westfall', 0),
(@PTEMPLATE+20, @PTEMPLATE+23, 0, 'Oily Blackmouth School / Floating Debris - Westfall', 0),
(@PTEMPLATE+21, @PTEMPLATE+23, 0, 'Oily Blackmouth School / Floating Debris - Westfall', 0),
(@PTEMPLATE+22, @PTEMPLATE+23, 0, 'Oily Blackmouth School / Floating Debris - Westfall', 0);

UPDATE `pool_gameobject` SET `chance` = 60 WHERE `description` = "Oily Blackmouth School / Floating Debris - Westfall" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 180582);
UPDATE `pool_gameobject` SET `chance` = 20 WHERE `description` = "Oily Blackmouth School / Floating Debris - Westfall" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 180655);

-- Correct position of Stone Bench in Stormwind City (position is off by 0.00396729 yards).
UPDATE `gameobject` SET `position_x`=-8923.21, `position_y`=634.853, `position_z`=99.5682, `orientation`=5.21854, `rotation0`=0, `rotation1`=0, `rotation2`=-0.507538, `rotation3`=0.861629 WHERE `guid`=26672;

DELETE FROM `gameobject` WHERE `guid` IN (24537, 24559);
DELETE FROM `pool_gameobject` WHERE `guid` IN (24537, 24559);
DELETE FROM `pool_template` WHERE `entry` = 1979;
DELETE FROM `pool_pool` WHERE `pool_id` = 1979;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
