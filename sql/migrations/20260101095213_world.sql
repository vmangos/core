DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260101095213');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260101095213');
-- Add your query below.


-- Pool Plaguebloom in Western Plaguelands
SET @PTEMPLATE = 3589;
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DELETE FROM `pool_gameobject` WHERE `guid` IN (68799, 45556, 57724, 57706, 57701, 57705, 20108);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Western Plaguelands - Caer Darrow - Plaguebloom', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(68799, @PTEMPLATE+1, 0, 'Plaguebloom - Western Plaguelands - Caer Darrow', 0, 0, 10),
(45556, @PTEMPLATE+1, 0, 'Plaguebloom - Western Plaguelands - Caer Darrow', 0, 0, 10),
(57724, @PTEMPLATE+1, 0, 'Plaguebloom - Western Plaguelands - Caer Darrow', 0, 0, 10),
(57706, @PTEMPLATE+1, 0, 'Plaguebloom - Western Plaguelands - Caer Darrow', 0, 0, 10),
(57701, @PTEMPLATE+1, 0, 'Plaguebloom - Western Plaguelands - Caer Darrow', 0, 0, 10),
(20108, @PTEMPLATE+1, 0, 'Plaguebloom - Western Plaguelands - Caer Darrow', 0, 0, 10),
(57705, @PTEMPLATE+1, 0, 'Plaguebloom - Western Plaguelands - Caer Darrow', 0, 0, 10);

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DELETE FROM `pool_gameobject` WHERE `guid` IN (57708, 57699, 68802, 57750, 45470, 57700);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Western Plaguelands - Gahrron\'s Withering - Plaguebloom', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(57708, @PTEMPLATE+2, 0, 'Plaguebloom - Western Plaguelands - Gahrron\'s Withering', 0, 0, 10),
(57699, @PTEMPLATE+2, 0, 'Plaguebloom - Western Plaguelands - Gahrron\'s Withering', 0, 0, 10),
(68802, @PTEMPLATE+2, 0, 'Plaguebloom - Western Plaguelands - Gahrron\'s Withering', 0, 0, 10),
(57750, @PTEMPLATE+2, 0, 'Plaguebloom - Western Plaguelands - Gahrron\'s Withering', 0, 0, 10),
(45470, @PTEMPLATE+2, 0, 'Plaguebloom - Western Plaguelands - Gahrron\'s Withering', 0, 0, 10),
(57700, @PTEMPLATE+2, 0, 'Plaguebloom - Western Plaguelands - Gahrron\'s Withering', 0, 0, 10);

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DELETE FROM `pool_gameobject` WHERE `guid` IN (68798, 20069, 45471, 57755, 57754, 57757);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Western Plaguelands - Dalson\'s Tears - Plaguebloom', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(68798, @PTEMPLATE+3, 0, 'Plaguebloom - Western Plaguelands - Dalson\'s Tears', 0, 0, 10),
(20069, @PTEMPLATE+3, 0, 'Plaguebloom - Western Plaguelands - Dalson\'s Tears', 0, 0, 10),
(45471, @PTEMPLATE+3, 0, 'Plaguebloom - Western Plaguelands - Dalson\'s Tears', 0, 0, 10),
(57755, @PTEMPLATE+3, 0, 'Plaguebloom - Western Plaguelands - Dalson\'s Tears', 0, 0, 10),
(57754, @PTEMPLATE+3, 0, 'Plaguebloom - Western Plaguelands - Dalson\'s Tears', 0, 0, 10),
(57757, @PTEMPLATE+3, 0, 'Plaguebloom - Western Plaguelands - Dalson\'s Tears', 0, 0, 10);

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DELETE FROM `pool_gameobject` WHERE `guid` IN (32206, 57710, 57752, 68801, 19980, 57712);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 1, 'Western Plaguelands - Felstone Field - Plaguebloom', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(32206, @PTEMPLATE+4, 0, 'Plaguebloom - Western Plaguelands - Felstone Field', 0, 0, 10),
(57710, @PTEMPLATE+4, 0, 'Plaguebloom - Western Plaguelands - Felstone Field', 0, 0, 10),
(57752, @PTEMPLATE+4, 0, 'Plaguebloom - Western Plaguelands - Felstone Field', 0, 0, 10),
(68801, @PTEMPLATE+4, 0, 'Plaguebloom - Western Plaguelands - Felstone Field', 0, 0, 10),
(19980, @PTEMPLATE+4, 0, 'Plaguebloom - Western Plaguelands - Felstone Field', 0, 0, 10),
(57712, @PTEMPLATE+4, 0, 'Plaguebloom - Western Plaguelands - Felstone Field', 0, 0, 10);

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DELETE FROM `pool_gameobject` WHERE `guid` IN (57702, 45469, 57737, 57704, 57709, 19992);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+5, 1, 'Western Plaguelands - The Writhing Haunt - Plaguebloom', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(57702, @PTEMPLATE+5, 0, 'Plaguebloom - Western Plaguelands - The Writhing Haunt', 0, 0, 10),
(45469, @PTEMPLATE+5, 0, 'Plaguebloom - Western Plaguelands - The Writhing Haunt', 0, 0, 10),
(57737, @PTEMPLATE+5, 0, 'Plaguebloom - Western Plaguelands - The Writhing Haunt', 0, 0, 10),
(57704, @PTEMPLATE+5, 0, 'Plaguebloom - Western Plaguelands - The Writhing Haunt', 0, 0, 10),
(57709, @PTEMPLATE+5, 0, 'Plaguebloom - Western Plaguelands - The Writhing Haunt', 0, 0, 10),
(19992, @PTEMPLATE+5, 0, 'Plaguebloom - Western Plaguelands - The Writhing Haunt', 0, 0, 10);

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DELETE FROM `pool_gameobject` WHERE `guid` IN (19948, 45540, 57717, 57711, 57753);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+6, 1, 'Western Plaguelands - The Weeping Cave - Plaguebloom', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(19948, @PTEMPLATE+6, 0, 'Plaguebloom - Western Plaguelands - The Weeping Cave', 0, 0, 10),
(45540, @PTEMPLATE+6, 0, 'Plaguebloom - Western Plaguelands - The Weeping Cave', 0, 0, 10),
(57717, @PTEMPLATE+6, 0, 'Plaguebloom - Western Plaguelands - The Weeping Cave', 0, 0, 10),
(57711, @PTEMPLATE+6, 0, 'Plaguebloom - Western Plaguelands - The Weeping Cave', 0, 0, 10),
(57753, @PTEMPLATE+6, 0, 'Plaguebloom - Western Plaguelands - The Weeping Cave', 0, 0, 10);

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DELETE FROM `pool_gameobject` WHERE `guid` IN (57714, 45558, 57703, 57716, 57707);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+7, 1, 'Western Plaguelands - Misc - Plaguebloom', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(57714, @PTEMPLATE+7, 0, 'Plaguebloom - Western Plaguelands - Misc', 0, 0, 10),
(45558, @PTEMPLATE+7, 0, 'Plaguebloom - Western Plaguelands - Misc', 0, 0, 10),
(57703, @PTEMPLATE+7, 0, 'Plaguebloom - Western Plaguelands - Misc', 0, 0, 10),
(57716, @PTEMPLATE+7, 0, 'Plaguebloom - Western Plaguelands - Misc', 0, 0, 10),
(57707, @PTEMPLATE+7, 0, 'Plaguebloom - Western Plaguelands - Misc', 0, 0, 10);

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DELETE FROM `pool_gameobject` WHERE `guid` IN (45472, 68800, 57713, 57715, 19940);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+8, 1, 'Western Plaguelands - Northridge Lumber Camp - Plaguebloom', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(45472, @PTEMPLATE+8, 0, 'Plaguebloom - Western Plaguelands - Northridge Lumber Camp', 0, 0, 10),
(68800, @PTEMPLATE+8, 0, 'Plaguebloom - Western Plaguelands - Northridge Lumber Camp', 0, 0, 10),
(57713, @PTEMPLATE+8, 0, 'Plaguebloom - Western Plaguelands - Northridge Lumber Camp', 0, 0, 10),
(57715, @PTEMPLATE+8, 0, 'Plaguebloom - Western Plaguelands - Northridge Lumber Camp', 0, 0, 10),
(19940, @PTEMPLATE+8, 0, 'Plaguebloom - Western Plaguelands - Northridge Lumber Camp', 0, 0, 10);

DELETE FROM `gameobject` WHERE `guid` = 1369;
DELETE FROM `pool_gameobject` WHERE `guid` = 1369;
DELETE FROM `pool_template` WHERE `entry` = 1258;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
