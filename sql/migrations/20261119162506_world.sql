DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20261119162506');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20261119162506');
-- Add your query below.

-- Fix Some DB Errors
UPDATE `creature` SET `mana_percent` = 100 WHERE `id` IN (8523, 8560, 8525, 8526);

-- Pool Dustwallow Fadeleaf
UPDATE `pool_template` SET `max_limit` = 1 WHERE `entry` = 106;
DELETE FROM `gameobject` WHERE `guid` = 21;

SET @PTEMPLATE = 4987;
DELETE FROM `pool_template` WHERE `entry` = 1328;
DELETE FROM `pool_gameobject` WHERE `pool_entry` = 1328;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Fadeleaf - Dustwallow Marsh - Group 1 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(248, @PTEMPLATE+1, 'Fadeleaf - Dustwallow Marsh - Group 1'),
(262, @PTEMPLATE+1, 'Fadeleaf - Dustwallow Marsh - Group 1'),
(28942, @PTEMPLATE+1, 'Fadeleaf - Dustwallow Marsh - Group 1'),
(28950, @PTEMPLATE+1, 'Fadeleaf - Dustwallow Marsh - Group 1'),
(40832, @PTEMPLATE+1, 'Fadeleaf - Dustwallow Marsh - Group 1'),
(56015, @PTEMPLATE+1, 'Fadeleaf - Dustwallow Marsh - Group 1');

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Fadeleaf - Dustwallow Marsh - Group 2 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(254, @PTEMPLATE+2, 'Fadeleaf - Dustwallow Marsh - Group 2'),
(12899, @PTEMPLATE+2, 'Fadeleaf - Dustwallow Marsh - Group 2'),
(28943, @PTEMPLATE+2, 'Fadeleaf - Dustwallow Marsh - Group 2'),
(28949, @PTEMPLATE+2, 'Fadeleaf - Dustwallow Marsh - Group 2'),
(56012, @PTEMPLATE+2, 'Fadeleaf - Dustwallow Marsh - Group 2'),
(68599, @PTEMPLATE+2, 'Fadeleaf - Dustwallow Marsh - Group 2');

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Fadeleaf - Dustwallow Marsh - Group 3 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(261, @PTEMPLATE+3, 'Fadeleaf - Dustwallow Marsh - Group 3'),
(13641, @PTEMPLATE+3, 'Fadeleaf - Dustwallow Marsh - Group 3'),
(28948, @PTEMPLATE+3, 'Fadeleaf - Dustwallow Marsh - Group 3'),
(56028, @PTEMPLATE+3, 'Fadeleaf - Dustwallow Marsh - Group 3'),
(68602, @PTEMPLATE+3, 'Fadeleaf - Dustwallow Marsh - Group 3');

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 1, 'Fadeleaf - Dustwallow Marsh - Group 4 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(263, @PTEMPLATE+4, 'Fadeleaf - Dustwallow Marsh - Group 4'),
(28947, @PTEMPLATE+4, 'Fadeleaf - Dustwallow Marsh - Group 4'),
(40740, @PTEMPLATE+4, 'Fadeleaf - Dustwallow Marsh - Group 4'),
(68598, @PTEMPLATE+4, 'Fadeleaf - Dustwallow Marsh - Group 4'),
(68600, @PTEMPLATE+4, 'Fadeleaf - Dustwallow Marsh - Group 4');

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+5, 1, 'Fadeleaf - Dustwallow Marsh - Group 5 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(6820, @PTEMPLATE+5, 'Fadeleaf - Dustwallow Marsh - Group 5'),
(6824, @PTEMPLATE+5, 'Fadeleaf - Dustwallow Marsh - Group 5'),
(12894, @PTEMPLATE+5, 'Fadeleaf - Dustwallow Marsh - Group 5'),
(28944, @PTEMPLATE+5, 'Fadeleaf - Dustwallow Marsh - Group 5'),
(55952, @PTEMPLATE+5, 'Fadeleaf - Dustwallow Marsh - Group 5'),
(68601, @PTEMPLATE+5, 'Fadeleaf - Dustwallow Marsh - Group 5');

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+6, 1, 'Fadeleaf - Dustwallow Marsh - Group 6 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(14927, @PTEMPLATE+6, 'Fadeleaf - Dustwallow Marsh - Group 6'),
(28939, @PTEMPLATE+6, 'Fadeleaf - Dustwallow Marsh - Group 6'),
(28940, @PTEMPLATE+6, 'Fadeleaf - Dustwallow Marsh - Group 6'),
(28945, @PTEMPLATE+6, 'Fadeleaf - Dustwallow Marsh - Group 6'),
(28951, @PTEMPLATE+6, 'Fadeleaf - Dustwallow Marsh - Group 6'),
(68597, @PTEMPLATE+6, 'Fadeleaf - Dustwallow Marsh - Group 6');

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+7, 1, 'Fadeleaf - Dustwallow Marsh - Group 7 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(28941, @PTEMPLATE+7, 'Fadeleaf - Dustwallow Marsh - Group 7'),
(28946, @PTEMPLATE+7, 'Fadeleaf - Dustwallow Marsh - Group 7'),
(28952, @PTEMPLATE+7, 'Fadeleaf - Dustwallow Marsh - Group 7'),
(40833, @PTEMPLATE+7, 'Fadeleaf - Dustwallow Marsh - Group 7'),
(56017, @PTEMPLATE+7, 'Fadeleaf - Dustwallow Marsh - Group 7');

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
