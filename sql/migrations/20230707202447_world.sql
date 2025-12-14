DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230707202447');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230707202447');
-- Add your query below.


SET @OGUID = 6021;
SET @PTEMPLATE = 25487;

-- Musty Tome
DELETE FROM `pool_template` WHERE `entry` IN (SELECT `pool_entry` FROM `pool_gameobject` WHERE `guid` IN (12195, 12196, 12201, 12205, 12211, 12337, 12338, 12342, 12419, 26034, 26035, 26036, 26037, 26038, 26039, 26040, 26041, 45459, 45460, 45461, 45462, 45463, 45464, 45465, 45466, 45467, 45468, 55373));
DELETE FROM `gameobject` WHERE `guid` IN (12195, 12196, 12201, 12205, 12211, 12337, 12338, 12342, 12419, 26034, 26035, 26036, 26037, 26038, 26039, 26040, 26041, 45459, 45460, 45461, 45462, 45463, 45464, 45465, 45466, 45467, 45468, 55373);
DELETE FROM `pool_gameobject` WHERE `guid` IN (12195, 12196, 12201, 12205, 12211, 12337, 12338, 12342, 12419, 26034, 26035, 26036, 26037, 26038, 26039, 26040, 26041, 45459, 45460, 45461, 45462, 45463, 45464, 45465, 45466, 45467, 45468, 55373);
DELETE FROM `pool_gameobject_template` WHERE `id` = 176150;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 176150, 0, 1356.51, -1452.11, 57.8184, 5.98648, 0, 0, -0.147809, 0.989016, 60, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 176150, 0, 1360.83, -1448.94, 56.969, 1.95477, 0, 0, 0.829038, 0.559193, 60, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 176150, 0, 1360.85, -1458.26, 56.969, 0.645772, 0, 0, 0.317305, 0.948324, 60, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 176150, 0, 1368.85, -1449.31, 56.969, 0.279253, 0, 0, 0.139173, 0.990268, 60, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 176150, 0, 1374.15, -1448.33, 56.969, 1.69297, 0, 0, 0.748956, 0.66262, 60, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 176150, 0, 1380.05, -1457.83, 56.9689, 1.71042, 0, 0, 0.754709, 0.656059, 60, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 176150, 0, 1382.42, -1449.85, 56.969, 1.64061, 0, 0, 0.731353, 0.681999, 60, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 176150, 0, 1385.29, -1455.31, 56.9689, 0.0174525, 0, 0, 0.00872612, 0.999962, 60, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 176150, 0, 1393.88, -1457.68, 58.3282, 2.33874, 0, 0, 0.920505, 0.390732, 60, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 176150, 0, 1394.99, -1450.47, 58.3282, 0.85521, 0, 0, 0.414693, 0.909962, 60, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 176151, 0, 1356.51, -1452.11, 57.8184, 5.98648, 0, 0, -0.147809, 0.989016, 60, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 176151, 0, 1360.83, -1448.94, 56.969, 1.95477, 0, 0, 0.829038, 0.559193, 60, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 176151, 0, 1360.85, -1458.26, 56.969, 0.645772, 0, 0, 0.317305, 0.948324, 60, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 176151, 0, 1368.85, -1449.31, 56.969, 0.279253, 0, 0, 0.139173, 0.990268, 60, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 176151, 0, 1374.15, -1448.33, 56.969, 1.69297, 0, 0, 0.748956, 0.66262, 60, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 176151, 0, 1380.05, -1457.83, 56.9689, 1.71042, 0, 0, 0.754709, 0.656059, 60, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 176151, 0, 1382.42, -1449.85, 56.969, 1.64061, 0, 0, 0.731353, 0.681999, 60, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 176151, 0, 1385.29, -1455.31, 56.9689, 0.0174525, 0, 0, 0.00872612, 0.999962, 60, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 176151, 0, 1393.88, -1457.68, 58.3282, 2.33874, 0, 0, 0.920505, 0.390732, 60, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 176151, 0, 1394.99, -1450.47, 58.3282, 0.85521, 0, 0, 0.414693, 0.909962, 60, 60, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Western Plaguelands - Musty Tome', 0, 10),
(@PTEMPLATE+2, 1, 'Western Plaguelands - Musty Tome', 0, 10),
(@PTEMPLATE+3, 1, 'Western Plaguelands - Musty Tome', 0, 10),
(@PTEMPLATE+4, 1, 'Western Plaguelands - Musty Tome', 0, 10),
(@PTEMPLATE+5, 1, 'Western Plaguelands - Musty Tome', 0, 10),
(@PTEMPLATE+6, 1, 'Western Plaguelands - Musty Tome', 0, 10),
(@PTEMPLATE+7, 1, 'Western Plaguelands - Musty Tome', 0, 10),
(@PTEMPLATE+8, 1, 'Western Plaguelands - Musty Tome', 0, 10),
(@PTEMPLATE+9, 1, 'Western Plaguelands - Musty Tome', 0, 10),
(@PTEMPLATE+10, 1, 'Western Plaguelands - Musty Tome', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Western Plaguelands - Musty Tome', 0, 10),
(@OGUID+2, @PTEMPLATE+2, 'Western Plaguelands - Musty Tome', 0, 10),
(@OGUID+3, @PTEMPLATE+3, 'Western Plaguelands - Musty Tome', 0, 10),
(@OGUID+4, @PTEMPLATE+4, 'Western Plaguelands - Musty Tome', 0, 10),
(@OGUID+5, @PTEMPLATE+5, 'Western Plaguelands - Musty Tome', 0, 10),
(@OGUID+6, @PTEMPLATE+6, 'Western Plaguelands - Musty Tome', 0, 10),
(@OGUID+7, @PTEMPLATE+7, 'Western Plaguelands - Musty Tome', 0, 10),
(@OGUID+8, @PTEMPLATE+8, 'Western Plaguelands - Musty Tome', 0, 10),
(@OGUID+9, @PTEMPLATE+9, 'Western Plaguelands - Musty Tome', 0, 10),
(@OGUID+10, @PTEMPLATE+10, 'Western Plaguelands - Musty Tome', 0, 10),
(@OGUID+11, @PTEMPLATE+1, 'Western Plaguelands - Musty Tome', 0, 10),
(@OGUID+12, @PTEMPLATE+2, 'Western Plaguelands - Musty Tome', 0, 10),
(@OGUID+13, @PTEMPLATE+3, 'Western Plaguelands - Musty Tome', 0, 10),
(@OGUID+14, @PTEMPLATE+4, 'Western Plaguelands - Musty Tome', 0, 10),
(@OGUID+15, @PTEMPLATE+5, 'Western Plaguelands - Musty Tome', 0, 10),
(@OGUID+16, @PTEMPLATE+6, 'Western Plaguelands - Musty Tome', 0, 10),
(@OGUID+17, @PTEMPLATE+7, 'Western Plaguelands - Musty Tome', 0, 10),
(@OGUID+18, @PTEMPLATE+8, 'Western Plaguelands - Musty Tome', 0, 10),
(@OGUID+19, @PTEMPLATE+9, 'Western Plaguelands - Musty Tome', 0, 10),
(@OGUID+20, @PTEMPLATE+10, 'Western Plaguelands - Musty Tome', 0, 10);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+21, 176152, 0, 1356.51, -1452.11, 57.8184, 5.98648, 0, 0, -0.147809, 0.989016, 60, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 176152, 0, 1360.83, -1448.94, 56.969, 1.95477, 0, 0, 0.829038, 0.559193, 60, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 176152, 0, 1360.85, -1458.26, 56.969, 0.645772, 0, 0, 0.317305, 0.948324, 60, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 176152, 0, 1368.85, -1449.31, 56.969, 0.279253, 0, 0, 0.139173, 0.990268, 60, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 176152, 0, 1374.15, -1448.33, 56.969, 1.69297, 0, 0, 0.748956, 0.66262, 60, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 176152, 0, 1380.05, -1457.83, 56.9689, 1.71042, 0, 0, 0.754709, 0.656059, 60, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 176152, 0, 1382.42, -1449.85, 56.969, 1.64061, 0, 0, 0.731353, 0.681999, 60, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 176152, 0, 1385.29, -1455.31, 56.9689, 0.0174525, 0, 0, 0.00872612, 0.999962, 60, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+29, 176152, 0, 1393.88, -1457.68, 58.3282, 2.33874, 0, 0, 0.920505, 0.390732, 60, 60, 100, 1, 0, 0, 0, 10),
(@OGUID+30, 176152, 0, 1394.99, -1450.47, 58.3282, 0.85521, 0, 0, 0.414693, 0.909962, 60, 60, 100, 1, 0, 0, 0, 10);

UPDATE `pool_gameobject` SET `chance` = 30 WHERE `description` = "Western Plaguelands - Musty Tome" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 176150);
UPDATE `pool_gameobject` SET `chance` = 70 WHERE `description` = "Western Plaguelands - Musty Tome" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 176151);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
