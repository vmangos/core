DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260718130001');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260718130001');
-- Add your query below.

-- Fadeleaf
-- Hinterlands
SET @PTEMPLATE = 1145;
DELETE FROM `pool_template` WHERE `entry` = 1252;
DELETE FROM `pool_gameobject` WHERE `pool_entry` = 1252;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Fadeleaf - Hinterlands - Group 1 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(28974, @PTEMPLATE+1, 'Fadeleaf - Hinterlands - Group 1'),
(28975, @PTEMPLATE+1, 'Fadeleaf - Hinterlands - Group 1'),
(28978, @PTEMPLATE+1, 'Fadeleaf - Hinterlands - Group 1'),
(28979, @PTEMPLATE+1, 'Fadeleaf - Hinterlands - Group 1'),
(34959, @PTEMPLATE+1, 'Fadeleaf - Hinterlands - Group 1');

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Fadeleaf - Hinterlands - Group 2 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(28972, @PTEMPLATE+2, 'Fadeleaf - Hinterlands - Group 2'),
(28973, @PTEMPLATE+2, 'Fadeleaf - Hinterlands - Group 2'),
(28976, @PTEMPLATE+2, 'Fadeleaf - Hinterlands - Group 2'),
(28977, @PTEMPLATE+2, 'Fadeleaf - Hinterlands - Group 2'),
(46399, @PTEMPLATE+2, 'Fadeleaf - Hinterlands - Group 2');

UPDATE `pool_gameobject` SET `pool_entry` = 1071 WHERE `guid` = 33201;
DELETE FROM `gameobject` WHERE `guid` = 7660;

-- Gromsblood
-- Desolace
SET @PTEMPLATE = 4979;
DELETE FROM `pool_template` WHERE `entry` = 1143;
DELETE FROM `pool_gameobject` WHERE `pool_entry` = 1143;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gromsblood - Desolace - Group 1 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(16523, @PTEMPLATE+1, 'Gromsblood - Desolace - Group 1'),
(16544, @PTEMPLATE+1, 'Gromsblood - Desolace - Group 1'),
(42137, @PTEMPLATE+1, 'Gromsblood - Desolace - Group 1'),
(42138, @PTEMPLATE+1, 'Gromsblood - Desolace - Group 1'),
(42141, @PTEMPLATE+1, 'Gromsblood - Desolace - Group 1');

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Gromsblood - Desolace - Group 2 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(16537, @PTEMPLATE+2, 'Gromsblood - Desolace - Group 2'),
(16539, @PTEMPLATE+2, 'Gromsblood - Desolace - Group 2'),
(42139, @PTEMPLATE+2, 'Gromsblood - Desolace - Group 2'),
(42143, @PTEMPLATE+2, 'Gromsblood - Desolace - Group 2'),
(42146, @PTEMPLATE+2, 'Gromsblood - Desolace - Group 2');

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Gromsblood - Desolace - Group 3 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(16458, @PTEMPLATE+3, 'Gromsblood - Desolace - Group 3'),
(42140, @PTEMPLATE+3, 'Gromsblood - Desolace - Group 3'),
(42142, @PTEMPLATE+3, 'Gromsblood - Desolace - Group 3'),
(42144, @PTEMPLATE+3, 'Gromsblood - Desolace - Group 3'),
(42145, @PTEMPLATE+3, 'Gromsblood - Desolace - Group 3');

DELETE FROM `gameobject` WHERE `guid` IN (16533, 16464);

-- Grave Moss
-- Desolace
SET @PTEMPLATE = 4982;
DELETE FROM `pool_template` WHERE `entry` = 107;
DELETE FROM `pool_gameobject` WHERE `pool_entry` = 107;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Grave Moss - Desolace - Group 1 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(18680, @PTEMPLATE+1, 'Grave Moss - Desolace - Group 1'),
(29137, @PTEMPLATE+1, 'Grave Moss - Desolace - Group 1'),
(29142, @PTEMPLATE+1, 'Grave Moss - Desolace - Group 1'),
(29145, @PTEMPLATE+1, 'Grave Moss - Desolace - Group 1'),
(68708, @PTEMPLATE+1, 'Grave Moss - Desolace - Group 1');

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Grave Moss - Desolace - Group 2 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(18676, @PTEMPLATE+2, 'Grave Moss - Desolace - Group 2'),
(29135, @PTEMPLATE+2, 'Grave Moss - Desolace - Group 2'),
(29136, @PTEMPLATE+2, 'Grave Moss - Desolace - Group 2'),
(29140, @PTEMPLATE+2, 'Grave Moss - Desolace - Group 2'),
(29141, @PTEMPLATE+2, 'Grave Moss - Desolace - Group 2');

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Grave Moss - Desolace - Group 3 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(1159, @PTEMPLATE+3, 'Grave Moss - Desolace - Group 3'),
(18677, @PTEMPLATE+3, 'Grave Moss - Desolace - Group 3'),
(29143, @PTEMPLATE+3, 'Grave Moss - Desolace - Group 3'),
(29144, @PTEMPLATE+3, 'Grave Moss - Desolace - Group 3'),
(68709, @PTEMPLATE+3, 'Grave Moss - Desolace - Group 3');

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 1, 'Grave Moss - Desolace - Group 4 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(4507, @PTEMPLATE+4, 'Grave Moss - Desolace - Group 4'),
(29134, @PTEMPLATE+4, 'Grave Moss - Desolace - Group 4'),
(29138, @PTEMPLATE+4, 'Grave Moss - Desolace - Group 4'),
(29147, @PTEMPLATE+4, 'Grave Moss - Desolace - Group 4'),
(29149, @PTEMPLATE+4, 'Grave Moss - Desolace - Group 4');

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+5, 1, 'Grave Moss - Desolace - Group 5 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(4437, @PTEMPLATE+5, 'Grave Moss - Desolace - Group 5'),
(4495, @PTEMPLATE+5, 'Grave Moss - Desolace - Group 5'),
(29139, @PTEMPLATE+5, 'Grave Moss - Desolace - Group 5'),
(29146, @PTEMPLATE+5, 'Grave Moss - Desolace - Group 5'),
(29148, @PTEMPLATE+5, 'Grave Moss - Desolace - Group 5');


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
