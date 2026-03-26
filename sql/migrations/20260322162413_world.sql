DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260322162413');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260322162413');
-- Add your query below.


SET @PTEMPLATE = 4276;

DELETE FROM `pool_pool` WHERE `pool_id` IN (7151, 7155, 7152, 7157, 7162);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Tanaris - Group 1' WHERE `entry` IN (7151, 7155, 7152, 7157, 7162);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Tanaris - Group 1' WHERE `pool_entry` IN (7151, 7155, 7152, 7157, 7162);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Small Thorium Vein - Tanaris - Group 1 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(7151, @PTEMPLATE+1, 0, 'Tanaris - Group 1 - Truesilver Deposit / Small Thorium Vein', 0),
(7155, @PTEMPLATE+1, 0, 'Tanaris - Group 1 - Truesilver Deposit / Small Thorium Vein', 0),
(7152, @PTEMPLATE+1, 0, 'Tanaris - Group 1 - Truesilver Deposit / Small Thorium Vein', 0),
(7157, @PTEMPLATE+1, 0, 'Tanaris - Group 1 - Truesilver Deposit / Small Thorium Vein', 0),
(7162, @PTEMPLATE+1, 0, 'Tanaris - Group 1 - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (7153, 7161, 9443, 7160, 7164);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Tanaris - Group 2' WHERE `entry` IN (7153, 7161, 9443, 7160, 7164);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Tanaris - Group 2' WHERE `pool_entry` IN (7153, 7161, 9443, 7160, 7164);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Truesilver Deposit / Small Thorium Vein - Tanaris - Group 2 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(7153, @PTEMPLATE+2, 0, 'Tanaris - Group 2 - Truesilver Deposit / Small Thorium Vein', 0),
(7161, @PTEMPLATE+2, 0, 'Tanaris - Group 2 - Truesilver Deposit / Small Thorium Vein', 0),
(9443, @PTEMPLATE+2, 0, 'Tanaris - Group 2 - Truesilver Deposit / Small Thorium Vein', 0),
(7160, @PTEMPLATE+2, 0, 'Tanaris - Group 2 - Truesilver Deposit / Small Thorium Vein', 0),
(7164, @PTEMPLATE+2, 0, 'Tanaris - Group 2 - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (7156, 9444, 7150, 7154, 9445);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Tanaris - Group 3' WHERE `entry` IN (7156, 9444, 7150, 7154, 9445);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Tanaris - Group 3' WHERE `pool_entry` IN (7156, 9444, 7150, 7154, 9445);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Truesilver Deposit / Small Thorium Vein - Tanaris - Group 3 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(7156, @PTEMPLATE+3, 0, 'Tanaris - Group 3 - Truesilver Deposit / Small Thorium Vein', 0),
(9444, @PTEMPLATE+3, 0, 'Tanaris - Group 3 - Truesilver Deposit / Small Thorium Vein', 0),
(7150, @PTEMPLATE+3, 0, 'Tanaris - Group 3 - Truesilver Deposit / Small Thorium Vein', 0),
(7154, @PTEMPLATE+3, 0, 'Tanaris - Group 3 - Truesilver Deposit / Small Thorium Vein', 0),
(9445, @PTEMPLATE+3, 0, 'Tanaris - Group 3 - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (7159, 9442, 7163, 7158);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Tanaris - Group 4' WHERE `entry` IN (7159, 9442, 7163, 7158);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Tanaris - Group 4' WHERE `pool_entry` IN (7159, 9442, 7163, 7158);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 1, 'Truesilver Deposit / Small Thorium Vein - Tanaris - Group 4 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(7159, @PTEMPLATE+4, 0, 'Tanaris - Group 4 - Truesilver Deposit / Small Thorium Vein', 0),
(9442, @PTEMPLATE+4, 0, 'Tanaris - Group 4 - Truesilver Deposit / Small Thorium Vein', 0),
(7163, @PTEMPLATE+4, 0, 'Tanaris - Group 4 - Truesilver Deposit / Small Thorium Vein', 0),
(7158, @PTEMPLATE+4, 0, 'Tanaris - Group 4 - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_template` WHERE  `entry` = 9915;
UPDATE `pool_template` SET `max_limit` = 2 WHERE `entry` = 8141;
UPDATE `pool_template` SET `max_limit` = 1 WHERE  `entry` = 8139;
UPDATE `pool_template` SET `max_limit` = 1 WHERE  `entry` = 8140;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
