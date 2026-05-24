DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260323181336');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260323181336');
-- Add your query below.

SET @PTEMPLATE = 3656;

DELETE FROM `pool_pool` WHERE `pool_id` IN (25617, 25616, 25613, 25615, 25614);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Hinterlands - Group 1' WHERE `entry` IN (25617, 25616, 25613, 25615, 25614);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Hinterlands - Group 1' WHERE `pool_entry` IN (25617, 25616, 25613, 25615, 25614);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Small Thorium Vein - Hinterlands - Group 1 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(25617, @PTEMPLATE+1, 0, 'Hinterlands - Group 1 - Truesilver Deposit / Small Thorium Vein', 0),
(25616, @PTEMPLATE+1, 0, 'Hinterlands - Group 1 - Truesilver Deposit / Small Thorium Vein', 0),
(25613, @PTEMPLATE+1, 0, 'Hinterlands - Group 1 - Truesilver Deposit / Small Thorium Vein', 0),
(25615, @PTEMPLATE+1, 0, 'Hinterlands - Group 1 - Truesilver Deposit / Small Thorium Vein', 0),
(25614, @PTEMPLATE+1, 0, 'Hinterlands - Group 1 - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (25619, 3031, 25612, 25611);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Hinterlands - Group 2' WHERE `entry` IN (25619, 3031, 25612, 25611);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Hinterlands - Group 2' WHERE `pool_entry` IN (25619, 3031, 25612, 25611);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Truesilver Deposit / Small Thorium Vein - Hinterlands - Group 2 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(25619, @PTEMPLATE+2, 0, 'Hinterlands - Group 2 - Truesilver Deposit / Small Thorium Vein', 0),
(3031, @PTEMPLATE+2, 0, 'Hinterlands - Group 2 - Truesilver Deposit / Small Thorium Vein', 0),
(25612, @PTEMPLATE+2, 0, 'Hinterlands - Group 2 - Truesilver Deposit / Small Thorium Vein', 0),
(25611, @PTEMPLATE+2, 0, 'Hinterlands - Group 2 - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (9440, 25618, 9441, 17206);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Hinterlands - Group 3' WHERE `entry` IN (9440, 25618, 9441, 17206);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Hinterlands - Group 3' WHERE `pool_entry` IN (9440, 25618, 9441, 17206);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Truesilver Deposit / Small Thorium Vein - Hinterlands - Group 3 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(9440, @PTEMPLATE+3, 0, 'Hinterlands - Group 3 - Truesilver Deposit / Small Thorium Vein', 0),
(25618, @PTEMPLATE+3, 0, 'Hinterlands - Group 3 - Truesilver Deposit / Small Thorium Vein', 0),
(9441, @PTEMPLATE+3, 0, 'Hinterlands - Group 3 - Truesilver Deposit / Small Thorium Vein', 0),
(17206, @PTEMPLATE+3, 0, 'Hinterlands - Group 3 - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_template` WHERE  `entry` IN (295, 294, 1070);

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
