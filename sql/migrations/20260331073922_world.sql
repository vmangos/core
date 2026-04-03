DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260331073922');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260331073922');
-- Add your query below.

SET @PTEMPLATE = 4659;

DELETE FROM `pool_pool` WHERE `pool_id` IN (4041, 4047, 14255, 4042);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein / Dark Iron Deposit - Searing Gorge - Group 1' WHERE `entry` IN (4041, 4047, 14255, 4042);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein / Dark Iron Deposit - Searing Gorge - Group 1' WHERE `pool_entry` IN (4041, 4047, 14255, 4042);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Small Thorium Vein / Dark Iron Deposit - Searing Gorge - Group 1 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(4041, @PTEMPLATE+1, 0, 'Searing Gorge - Group 1 - Truesilver Deposit / Small Thorium Vein / Dark Iron Deposit', 0),
(4047, @PTEMPLATE+1, 0, 'Searing Gorge - Group 1 - Truesilver Deposit / Small Thorium Vein / Dark Iron Deposit', 0),
(14255, @PTEMPLATE+1, 0, 'Searing Gorge - Group 1 - Truesilver Deposit / Small Thorium Vein / Dark Iron Deposit', 0),
(4042, @PTEMPLATE+1, 0, 'Searing Gorge - Group 1 - Truesilver Deposit / Small Thorium Vein / Dark Iron Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (4043, 4049, 4044, 4055);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein / Dark Iron Deposit - Searing Gorge - Group 2' WHERE `entry` IN (4043, 4049, 4044, 4055);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein / Dark Iron Deposit - Searing Gorge - Group 2' WHERE `pool_entry` IN (4043, 4049, 4044, 4055);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Truesilver Deposit / Small Thorium Vein / Dark Iron Deposit - Searing Gorge - Group 2 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(4043, @PTEMPLATE+2, 0, 'Searing Gorge - Group 2 - Truesilver Deposit / Small Thorium Vein / Dark Iron Deposit', 0),
(4049, @PTEMPLATE+2, 0, 'Searing Gorge - Group 2 - Truesilver Deposit / Small Thorium Vein / Dark Iron Deposit', 0),
(4044, @PTEMPLATE+2, 0, 'Searing Gorge - Group 2 - Truesilver Deposit / Small Thorium Vein / Dark Iron Deposit', 0),
(4055, @PTEMPLATE+2, 0, 'Searing Gorge - Group 2 - Truesilver Deposit / Small Thorium Vein / Dark Iron Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (4052, 4054, 4048, 4053);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein / Dark Iron Deposit - Searing Gorge - Group 3' WHERE `entry` IN (4052, 4054, 4048, 4053);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein / Dark Iron Deposit - Searing Gorge - Group 3' WHERE `pool_entry` IN (4052, 4054, 4048, 4053);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Truesilver Deposit / Small Thorium Vein / Dark Iron Deposit - Searing Gorge - Group 3 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(4052, @PTEMPLATE+3, 0, 'Searing Gorge - Group 3 - Truesilver Deposit / Small Thorium Vein / Dark Iron Deposit', 0),
(4054, @PTEMPLATE+3, 0, 'Searing Gorge - Group 3 - Truesilver Deposit / Small Thorium Vein / Dark Iron Deposit', 0),
(4048, @PTEMPLATE+3, 0, 'Searing Gorge - Group 3 - Truesilver Deposit / Small Thorium Vein / Dark Iron Deposit', 0),
(4053, @PTEMPLATE+3, 0, 'Searing Gorge - Group 3 - Truesilver Deposit / Small Thorium Vein / Dark Iron Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (4046, 4050, 4051, 4045);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein / Dark Iron Deposit - Searing Gorge - Group 4' WHERE `entry` IN (4046, 4050, 4051, 4045);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein / Dark Iron Deposit - Searing Gorge - Group 4' WHERE `pool_entry` IN (4046, 4050, 4051, 4045);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 1, 'Truesilver Deposit / Small Thorium Vein / Dark Iron Deposit - Searing Gorge - Group 4 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(4046, @PTEMPLATE+4, 0, 'Searing Gorge - Group 4 - Truesilver Deposit / Small Thorium Vein / Dark Iron Deposit', 0),
(4050, @PTEMPLATE+4, 0, 'Searing Gorge - Group 4 - Truesilver Deposit / Small Thorium Vein / Dark Iron Deposit', 0),
(4051, @PTEMPLATE+4, 0, 'Searing Gorge - Group 4 - Truesilver Deposit / Small Thorium Vein / Dark Iron Deposit', 0),
(4045, @PTEMPLATE+4, 0, 'Searing Gorge - Group 4 - Truesilver Deposit / Small Thorium Vein / Dark Iron Deposit', 0);

DELETE FROM `pool_template` WHERE  `entry` = 4350;
UPDATE `pool_template` SET `max_limit`=1 WHERE  `entry`=333 AND `patch_min`=0 AND `patch_max`=10;
UPDATE `pool_template` SET `max_limit`=1 WHERE  `entry`=331 AND `patch_min`=0 AND `patch_max`=10;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
