DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260102094534');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260102094534');
-- Add your query below.


-- Pool Plaguebloom in Felwood
SET @PTEMPLATE = 3648;
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DELETE FROM `pool_gameobject` WHERE `guid` IN (57858, 68819, 57860, 68823, 57850, 57839);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Felwood - Morlos\'Aran - Plaguebloom', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(57858, @PTEMPLATE+1, 0, 'Plaguebloom - Felwood - Morlos\'Aran', 0, 0, 10),
(68819, @PTEMPLATE+1, 0, 'Plaguebloom - Felwood - Morlos\'Aran', 0, 0, 10),
(57860, @PTEMPLATE+1, 0, 'Plaguebloom - Felwood - Morlos\'Aran', 0, 0, 10),
(68823, @PTEMPLATE+1, 0, 'Plaguebloom - Felwood - Morlos\'Aran', 0, 0, 10),
(57850, @PTEMPLATE+1, 0, 'Plaguebloom - Felwood - Morlos\'Aran', 0, 0, 10),
(57839, @PTEMPLATE+1, 0, 'Plaguebloom - Felwood - Morlos\'Aran', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DELETE FROM `pool_gameobject` WHERE `guid` IN (68821, 68824, 623, 57861, 57859, 57862);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Felwood - Deadwood Village - Plaguebloom', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(68821, @PTEMPLATE+2, 0, 'Plaguebloom - Felwood - Deadwood Village', 0, 0, 10),
(68824, @PTEMPLATE+2, 0, 'Plaguebloom - Felwood - Deadwood Village', 0, 0, 10),
(623, @PTEMPLATE+2, 0, 'Plaguebloom - Felwood - Deadwood Village', 0, 0, 10),
(57861, @PTEMPLATE+2, 0, 'Plaguebloom - Felwood - Deadwood Village', 0, 0, 10),
(57859, @PTEMPLATE+2, 0, 'Plaguebloom - Felwood - Deadwood Village', 0, 0, 10),
(57862, @PTEMPLATE+2, 0, 'Plaguebloom - Felwood - Deadwood Village', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DELETE FROM `pool_gameobject` WHERE `guid` IN (57852, 57863, 57848, 57864, 57844, 57847);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Felwood - Ruins of Constellas - Plaguebloom', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(57852, @PTEMPLATE+3, 0, 'Plaguebloom - Felwood - Ruins of Constellas', 0, 0, 10),
(57863, @PTEMPLATE+3, 0, 'Plaguebloom - Felwood - Ruins of Constellas', 0, 0, 10),
(57848, @PTEMPLATE+3, 0, 'Plaguebloom - Felwood - Ruins of Constellas', 0, 0, 10),
(57864, @PTEMPLATE+3, 0, 'Plaguebloom - Felwood - Ruins of Constellas', 0, 0, 10),
(57844, @PTEMPLATE+3, 0, 'Plaguebloom - Felwood - Ruins of Constellas', 0, 0, 10),
(57847, @PTEMPLATE+3, 0, 'Plaguebloom - Felwood - Ruins of Constellas', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DELETE FROM `pool_gameobject` WHERE `guid` IN (57851, 57842, 57857, 57853, 57849, 624);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 1, 'Felwood - Jaedenar - Plaguebloom', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(57851, @PTEMPLATE+4, 0, 'Plaguebloom - Felwood - Jaedenar', 0, 0, 10),
(57842, @PTEMPLATE+4, 0, 'Plaguebloom - Felwood - Jaedenar', 0, 0, 10),
(57857, @PTEMPLATE+4, 0, 'Plaguebloom - Felwood - Jaedenar', 0, 0, 10),
(57853, @PTEMPLATE+4, 0, 'Plaguebloom - Felwood - Jaedenar', 0, 0, 10),
(57849, @PTEMPLATE+4, 0, 'Plaguebloom - Felwood - Jaedenar', 0, 0, 10),
(624, @PTEMPLATE+4, 0, 'Plaguebloom - Felwood - Jaedenar', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DELETE FROM `pool_gameobject` WHERE `guid` IN (57865, 57866, 57843, 57856, 57868, 57867);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+5, 1, 'Felwood - Shatter Scar Vale - Plaguebloom', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(57865, @PTEMPLATE+5, 0, 'Plaguebloom - Felwood - Shatter Scar Vale', 0, 0, 10),
(57866, @PTEMPLATE+5, 0, 'Plaguebloom - Felwood - Shatter Scar Vale', 0, 0, 10),
(57843, @PTEMPLATE+5, 0, 'Plaguebloom - Felwood - Shatter Scar Vale', 0, 0, 10),
(57856, @PTEMPLATE+5, 0, 'Plaguebloom - Felwood - Shatter Scar Vale', 0, 0, 10),
(57868, @PTEMPLATE+5, 0, 'Plaguebloom - Felwood - Shatter Scar Vale', 0, 0, 10),
(57867, @PTEMPLATE+5, 0, 'Plaguebloom - Felwood - Shatter Scar Vale', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DELETE FROM `pool_gameobject` WHERE `guid` IN (57869, 57870, 68822, 57872, 57845, 57855);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+6, 1, 'Felwood - Irontree Woods Lower - Plaguebloom', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(57869, @PTEMPLATE+6, 0, 'Plaguebloom - Felwood - Irontree Woods Lower', 0, 0, 10),
(57870, @PTEMPLATE+6, 0, 'Plaguebloom - Felwood - Irontree Woods Lower', 0, 0, 10),
(68822, @PTEMPLATE+6, 0, 'Plaguebloom - Felwood - Irontree Woods Lower', 0, 0, 10),
(57872, @PTEMPLATE+6, 0, 'Plaguebloom - Felwood - Irontree Woods Lower', 0, 0, 10),
(57845, @PTEMPLATE+6, 0, 'Plaguebloom - Felwood - Irontree Woods Lower', 0, 0, 10),
(57855, @PTEMPLATE+6, 0, 'Plaguebloom - Felwood - Irontree Woods Lower', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DELETE FROM `pool_gameobject` WHERE `guid` IN (68820, 57873, 57876, 57846, 57874, 57871);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+7, 1, 'Felwood - Irontree Woods Upper - Plaguebloom', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(68820, @PTEMPLATE+7, 0, 'Plaguebloom - Felwood - Irontree Woods Upper', 0, 0, 10),
(57873, @PTEMPLATE+7, 0, 'Plaguebloom - Felwood - Irontree Woods Upper', 0, 0, 10),
(57876, @PTEMPLATE+7, 0, 'Plaguebloom - Felwood - Irontree Woods Upper', 0, 0, 10),
(57846, @PTEMPLATE+7, 0, 'Plaguebloom - Felwood - Irontree Woods Upper', 0, 0, 10),
(57874, @PTEMPLATE+7, 0, 'Plaguebloom - Felwood - Irontree Woods Upper', 0, 0, 10),
(57871, @PTEMPLATE+7, 0, 'Plaguebloom - Felwood - Irontree Woods Upper', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DELETE FROM `pool_gameobject` WHERE `guid` IN (57841, 68825, 57840, 57875, 57854);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+8, 1, 'Felwood - Jadefire Run - Plaguebloom', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(57841, @PTEMPLATE+8, 0, 'Plaguebloom - Felwood - Jadefire Run', 0, 0, 10),
(68825, @PTEMPLATE+8, 0, 'Plaguebloom - Felwood - Jadefire Run', 0, 0, 10),
(57840, @PTEMPLATE+8, 0, 'Plaguebloom - Felwood - Jadefire Run', 0, 0, 10),
(57875, @PTEMPLATE+8, 0, 'Plaguebloom - Felwood - Jadefire Run', 0, 0, 10),
(57854, @PTEMPLATE+8, 0, 'Plaguebloom - Felwood - Jadefire Run', 0, 0, 10);

DELETE FROM `pool_template` WHERE `entry` = 1227;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
