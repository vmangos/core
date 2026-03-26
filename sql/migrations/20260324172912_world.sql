DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260324172912');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260324172912');
-- Add your query below.

SET @PTEMPLATE = 4579;

DELETE FROM `pool_pool` WHERE `pool_id` IN (6113, 6128, 6127, 6134, 6131);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Wetlands - Group 1' WHERE `entry` IN (6113, 6128, 6127, 6134, 6131);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Wetlands - Group 1' WHERE `pool_entry` IN (6113, 6128, 6127, 6134, 6131);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit - Wetlands - Group 1 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(6113, @PTEMPLATE+1, 0, 'Wetlands - Group 1 - Silver Vein / Gold Vein / Iron Deposit', 0),
(6128, @PTEMPLATE+1, 0, 'Wetlands - Group 1 - Silver Vein / Gold Vein / Iron Deposit', 0),
(6127, @PTEMPLATE+1, 0, 'Wetlands - Group 1 - Silver Vein / Gold Vein / Iron Deposit', 0),
(6134, @PTEMPLATE+1, 0, 'Wetlands - Group 1 - Silver Vein / Gold Vein / Iron Deposit', 0),
(6131, @PTEMPLATE+1, 0, 'Wetlands - Group 1 - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (6129, 6114, 6115, 6126, 6116);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Wetlands - Group 2' WHERE `entry` IN (6129, 6114, 6115, 6126, 6116);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Wetlands - Group 2' WHERE `pool_entry` IN (6129, 6114, 6115, 6126, 6116);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Silver Vein / Gold Vein / Iron Deposit - Wetlands - Group 2 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(6129, @PTEMPLATE+2, 0, 'Wetlands - Group 2 - Silver Vein / Gold Vein / Iron Deposit', 0),
(6114, @PTEMPLATE+2, 0, 'Wetlands - Group 2 - Silver Vein / Gold Vein / Iron Deposit', 0),
(6115, @PTEMPLATE+2, 0, 'Wetlands - Group 2 - Silver Vein / Gold Vein / Iron Deposit', 0),
(6126, @PTEMPLATE+2, 0, 'Wetlands - Group 2 - Silver Vein / Gold Vein / Iron Deposit', 0),
(6116, @PTEMPLATE+2, 0, 'Wetlands - Group 2 - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (6117, 2820, 6118, 6119, 6132, 6120);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Wetlands - Group 3' WHERE `entry` IN (6117, 2820, 6118, 6119, 6132, 6120);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Wetlands - Group 3' WHERE `pool_entry` IN (6117, 2820, 6118, 6119, 6132, 6120);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Silver Vein / Gold Vein / Iron Deposit - Wetlands - Group 3 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(6117, @PTEMPLATE+3, 0, 'Wetlands - Group 3 - Silver Vein / Gold Vein / Iron Deposit', 0),
(2820, @PTEMPLATE+3, 0, 'Wetlands - Group 3 - Silver Vein / Gold Vein / Iron Deposit', 0),
(6118, @PTEMPLATE+3, 0, 'Wetlands - Group 3 - Silver Vein / Gold Vein / Iron Deposit', 0),
(6119, @PTEMPLATE+3, 0, 'Wetlands - Group 3 - Silver Vein / Gold Vein / Iron Deposit', 0),
(6132, @PTEMPLATE+3, 0, 'Wetlands - Group 3 - Silver Vein / Gold Vein / Iron Deposit', 0),
(6120, @PTEMPLATE+3, 0, 'Wetlands - Group 3 - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (6133, 6130, 6121, 6122, 6123, 17025);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Wetlands - Group 4' WHERE `entry` IN (6133, 6130, 6121, 6122, 6123, 17025);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Wetlands - Group 4' WHERE `pool_entry` IN (6133, 6130, 6121, 6122, 6123, 17025);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 1, 'Silver Vein / Gold Vein / Iron Deposit - Wetlands - Group 4 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(6133, @PTEMPLATE+4, 0, 'Wetlands - Group 4 - Silver Vein / Gold Vein / Iron Deposit', 0),
(6130, @PTEMPLATE+4, 0, 'Wetlands - Group 4 - Silver Vein / Gold Vein / Iron Deposit', 0),
(6121, @PTEMPLATE+4, 0, 'Wetlands - Group 4 - Silver Vein / Gold Vein / Iron Deposit', 0),
(6122, @PTEMPLATE+4, 0, 'Wetlands - Group 4 - Silver Vein / Gold Vein / Iron Deposit', 0),
(6123, @PTEMPLATE+4, 0, 'Wetlands - Group 4 - Silver Vein / Gold Vein / Iron Deposit', 0),
(17025, @PTEMPLATE+4, 0, 'Wetlands - Group 4 - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_template` WHERE  `entry` = 1355;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
