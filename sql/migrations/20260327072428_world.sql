DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260327072428');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260327072428');
-- Add your query below.

SET @PTEMPLATE = 4591;

DELETE FROM `pool_pool` WHERE `pool_id` IN (32986, 17118, 32987, 32993, 32992, 32991);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Feralas - Group 1' WHERE `entry` IN (32986, 17118, 32987, 32993, 32992, 32991);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Feralas - Group 1' WHERE `pool_entry` IN (32986, 17118, 32987, 32993, 32992, 32991);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit - Feralas - Group 1 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(32986, @PTEMPLATE+1, 0, 'Feralas - Group 1 - Silver Vein / Gold Vein / Iron Deposit', 0),
(17118, @PTEMPLATE+1, 0, 'Feralas - Group 1 - Silver Vein / Gold Vein / Iron Deposit', 0),
(32987, @PTEMPLATE+1, 0, 'Feralas - Group 1 - Silver Vein / Gold Vein / Iron Deposit', 0),
(32993, @PTEMPLATE+1, 0, 'Feralas - Group 1 - Silver Vein / Gold Vein / Iron Deposit', 0),
(32992, @PTEMPLATE+1, 0, 'Feralas - Group 1 - Silver Vein / Gold Vein / Iron Deposit', 0),
(32991, @PTEMPLATE+1, 0, 'Feralas - Group 1 - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (23025, 32985, 32989, 32981, 32984);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Feralas - Group 2' WHERE `entry` IN (23025, 32985, 32989, 32981, 32984);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Feralas - Group 2' WHERE `pool_entry` IN (23025, 32985, 32989, 32981, 32984);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Silver Vein / Gold Vein / Iron Deposit - Feralas - Group 2 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(23025, @PTEMPLATE+2, 0, 'Feralas - Group 2 - Silver Vein / Gold Vein / Iron Deposit', 0),
(32985, @PTEMPLATE+2, 0, 'Feralas - Group 2 - Silver Vein / Gold Vein / Iron Deposit', 0),
(32989, @PTEMPLATE+2, 0, 'Feralas - Group 2 - Silver Vein / Gold Vein / Iron Deposit', 0),
(32981, @PTEMPLATE+2, 0, 'Feralas - Group 2 - Silver Vein / Gold Vein / Iron Deposit', 0),
(32984, @PTEMPLATE+2, 0, 'Feralas - Group 2 - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (17117, 17115, 17053, 32982);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Feralas - Group 3' WHERE `entry` IN (17117, 17115, 17053, 32982);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Feralas - Group 3' WHERE `pool_entry` IN (17117, 17115, 17053, 32982);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Silver Vein / Gold Vein / Iron Deposit - Feralas - Group 3 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(17117, @PTEMPLATE+3, 0, 'Feralas - Group 3 - Silver Vein / Gold Vein / Iron Deposit', 0),
(17115, @PTEMPLATE+3, 0, 'Feralas - Group 3 - Silver Vein / Gold Vein / Iron Deposit', 0),
(17053, @PTEMPLATE+3, 0, 'Feralas - Group 3 - Silver Vein / Gold Vein / Iron Deposit', 0),
(32982, @PTEMPLATE+3, 0, 'Feralas - Group 3 - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (17116, 32988, 2167, 32983);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Feralas - Group 4' WHERE `entry` IN (17116, 32988, 2167, 32983);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Feralas - Group 4' WHERE `pool_entry` IN (17116, 32988, 2167, 32983);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 1, 'Silver Vein / Gold Vein / Iron Deposit - Feralas - Group 4 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(17116, @PTEMPLATE+4, 0, 'Feralas - Group 4 - Silver Vein / Gold Vein / Iron Deposit', 0),
(32988, @PTEMPLATE+4, 0, 'Feralas - Group 4 - Silver Vein / Gold Vein / Iron Deposit', 0),
(2167, @PTEMPLATE+4, 0, 'Feralas - Group 4 - Silver Vein / Gold Vein / Iron Deposit', 0),
(32983, @PTEMPLATE+4, 0, 'Feralas - Group 4 - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_template` WHERE  `entry` = 1196;
UPDATE `pool_template` SET `max_limit` = 1 WHERE `entry` = 321;
UPDATE `pool_template` SET `max_limit` = 1 WHERE `entry` = 297;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
