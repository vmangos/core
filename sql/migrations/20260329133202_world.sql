DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260329133202');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260329133202');
-- Add your query below.

SET @PTEMPLATE = 293;

DELETE FROM `pool_pool` WHERE `pool_id` IN (8851, 8850, 8849, 8852, 8847, 8848);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains - Group 1' WHERE `entry` IN (8851, 8850, 8849, 8852, 8847, 8848);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains - Group 1' WHERE `pool_entry` IN (8851, 8850, 8849, 8852, 8847, 8848);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains - Group 1 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(8851, @PTEMPLATE+1, 0, 'Stonetalon Mountains - Group 1 - Silver Vein / Gold Vein / Iron Deposit', 0),
(8850, @PTEMPLATE+1, 0, 'Stonetalon Mountains - Group 1 - Silver Vein / Gold Vein / Iron Deposit', 0),
(8849, @PTEMPLATE+1, 0, 'Stonetalon Mountains - Group 1 - Silver Vein / Gold Vein / Iron Deposit', 0),
(8852, @PTEMPLATE+1, 0, 'Stonetalon Mountains - Group 1 - Silver Vein / Gold Vein / Iron Deposit', 0),
(8847, @PTEMPLATE+1, 0, 'Stonetalon Mountains - Group 1 - Silver Vein / Gold Vein / Iron Deposit', 0),
(8848, @PTEMPLATE+1, 0, 'Stonetalon Mountains - Group 1 - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (8846, 8845, 8843, 8842, 8853, 8844);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains - Group 2' WHERE `entry` IN (8846, 8845, 8843, 8842, 8853, 8844);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains - Group 2' WHERE `pool_entry` IN (8846, 8845, 8843, 8842, 8853, 8844);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Silver Vein / Gold Vein / Iron Deposit - Stonetalon Mountains - Group 2 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(8846, @PTEMPLATE+2, 0, 'Stonetalon Mountains - Group 2 - Silver Vein / Gold Vein / Iron Deposit', 0),
(8845, @PTEMPLATE+2, 0, 'Stonetalon Mountains - Group 2 - Silver Vein / Gold Vein / Iron Deposit', 0),
(8843, @PTEMPLATE+2, 0, 'Stonetalon Mountains - Group 2 - Silver Vein / Gold Vein / Iron Deposit', 0),
(8842, @PTEMPLATE+2, 0, 'Stonetalon Mountains - Group 2 - Silver Vein / Gold Vein / Iron Deposit', 0),
(8853, @PTEMPLATE+2, 0, 'Stonetalon Mountains - Group 2 - Silver Vein / Gold Vein / Iron Deposit', 0),
(8844, @PTEMPLATE+2, 0, 'Stonetalon Mountains - Group 2 - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_template` WHERE  `entry` = 1091;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
