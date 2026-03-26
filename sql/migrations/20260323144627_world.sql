DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260323144627');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260323144627');
-- Add your query below.

SET @PTEMPLATE = 4280;

DELETE FROM `pool_pool` WHERE `pool_id` IN (42915, 42913, 42929, 42928, 17099);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Tanaris - Group 1' WHERE `entry` IN (42915, 42913, 42929, 42928, 17099);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Tanaris - Group 1' WHERE `pool_entry` IN (42915, 42913, 42929, 42928, 17099);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit - Tanaris - Group 1 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(42915, @PTEMPLATE+1, 0, 'Tanaris - Group 1 - Silver Vein / Gold Vein / Iron Deposit', 0),
(42913, @PTEMPLATE+1, 0, 'Tanaris - Group 1 - Silver Vein / Gold Vein / Iron Deposit', 0),
(42929, @PTEMPLATE+1, 0, 'Tanaris - Group 1 - Silver Vein / Gold Vein / Iron Deposit', 0),
(42928, @PTEMPLATE+1, 0, 'Tanaris - Group 1 - Silver Vein / Gold Vein / Iron Deposit', 0),
(17099, @PTEMPLATE+1, 0, 'Tanaris - Group 1 - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (2165, 42931, 42914, 42916, 42912);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Tanaris - Group 2' WHERE `entry` IN (2165, 42931, 42914, 42916, 42912);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Tanaris - Group 2' WHERE `pool_entry` IN (2165, 42931, 42914, 42916, 42912);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Silver Vein / Gold Vein / Iron Deposit - Tanaris - Group 2 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(2165, @PTEMPLATE+2, 0, 'Tanaris - Group 2 - Silver Vein / Gold Vein / Iron Deposit', 0),
(42931, @PTEMPLATE+2, 0, 'Tanaris - Group 2 - Silver Vein / Gold Vein / Iron Deposit', 0),
(42914, @PTEMPLATE+2, 0, 'Tanaris - Group 2 - Silver Vein / Gold Vein / Iron Deposit', 0),
(42916, @PTEMPLATE+2, 0, 'Tanaris - Group 2 - Silver Vein / Gold Vein / Iron Deposit', 0),
(42912, @PTEMPLATE+2, 0, 'Tanaris - Group 2 - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (2166, 42926, 42932, 42911, 17098);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Tanaris - Group 3' WHERE `entry` IN (2166, 42926, 42932, 42911, 17098);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Tanaris - Group 3' WHERE `pool_entry` IN (2166, 42926, 42932, 42911, 17098);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Silver Vein / Gold Vein / Iron Deposit - Tanaris - Group 3 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(2166, @PTEMPLATE+3, 0, 'Tanaris - Group 3 - Silver Vein / Gold Vein / Iron Deposit', 0),
(42926, @PTEMPLATE+3, 0, 'Tanaris - Group 3 - Silver Vein / Gold Vein / Iron Deposit', 0),
(42932, @PTEMPLATE+3, 0, 'Tanaris - Group 3 - Silver Vein / Gold Vein / Iron Deposit', 0),
(42911, @PTEMPLATE+3, 0, 'Tanaris - Group 3 - Silver Vein / Gold Vein / Iron Deposit', 0),
(17098, @PTEMPLATE+3, 0, 'Tanaris - Group 3 - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (42917, 17101, 42923, 42919, 17100);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Tanaris - Group 4' WHERE `entry` IN (42917, 17101, 42923, 42919, 17100);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Tanaris - Group 4' WHERE `pool_entry` IN (42917, 17101, 42923, 42919, 17100);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 1, 'Silver Vein / Gold Vein / Iron Deposit - Tanaris - Group 4 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(42917, @PTEMPLATE+4, 0, 'Tanaris - Group 4 - Silver Vein / Gold Vein / Iron Deposit', 0),
(17101, @PTEMPLATE+4, 0, 'Tanaris - Group 4 - Silver Vein / Gold Vein / Iron Deposit', 0),
(42923, @PTEMPLATE+4, 0, 'Tanaris - Group 4 - Silver Vein / Gold Vein / Iron Deposit', 0),
(42919, @PTEMPLATE+4, 0, 'Tanaris - Group 4 - Silver Vein / Gold Vein / Iron Deposit', 0),
(17100, @PTEMPLATE+4, 0, 'Tanaris - Group 4 - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (42924, 42920, 42922, 42925);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Tanaris - Group 5' WHERE `entry` IN (42924, 42920, 42922, 42925);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Tanaris - Group 5' WHERE `pool_entry` IN (42924, 42920, 42922, 42925);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+5, 1, 'Silver Vein / Gold Vein / Iron Deposit - Tanaris - Group 5 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(42924, @PTEMPLATE+5, 0, 'Tanaris - Group 5 - Silver Vein / Gold Vein / Iron Deposit', 0),
(42920, @PTEMPLATE+5, 0, 'Tanaris - Group 5 - Silver Vein / Gold Vein / Iron Deposit', 0),
(42922, @PTEMPLATE+5, 0, 'Tanaris - Group 5 - Silver Vein / Gold Vein / Iron Deposit', 0),
(42925, @PTEMPLATE+5, 0, 'Tanaris - Group 5 - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (42930, 42927, 42918, 42921);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Tanaris - Group 6' WHERE `entry` IN (42930, 42927, 42918, 42921);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Tanaris - Group 6' WHERE `pool_entry` IN (42930, 42927, 42918, 42921);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+6, 1, 'Silver Vein / Gold Vein / Iron Deposit - Tanaris - Group 6 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(42930, @PTEMPLATE+6, 0, 'Tanaris - Group 6 - Silver Vein / Gold Vein / Iron Deposit', 0),
(42927, @PTEMPLATE+6, 0, 'Tanaris - Group 6 - Silver Vein / Gold Vein / Iron Deposit', 0),
(42918, @PTEMPLATE+6, 0, 'Tanaris - Group 6 - Silver Vein / Gold Vein / Iron Deposit', 0),
(42921, @PTEMPLATE+6, 0, 'Tanaris - Group 6 - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_template` WHERE  `entry` = 1200;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
