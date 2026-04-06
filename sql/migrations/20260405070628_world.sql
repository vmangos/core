DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260405070628');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260405070628');
-- Add your query below.

SET @PTEMPLATE = 4686;

DELETE FROM `pool_pool` WHERE `pool_id` IN (21529, 21523, 17201, 14401, 21516, 21524);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Group 1' WHERE `entry` IN (21529, 21523, 17201, 14401, 21516, 21524);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Group 1' WHERE `pool_entry` IN (21529, 21523, 17201, 14401, 21516, 21524);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Group 1 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(21529, @PTEMPLATE+1, 0, 'Blasted Lands - Group 1 - Truesilver Deposit / Small Thorium Vein', 0),
(21523, @PTEMPLATE+1, 0, 'Blasted Lands - Group 1 - Truesilver Deposit / Small Thorium Vein', 0),
(17201, @PTEMPLATE+1, 0, 'Blasted Lands - Group 1 - Truesilver Deposit / Small Thorium Vein', 0),
(14401, @PTEMPLATE+1, 0, 'Blasted Lands - Group 1 - Truesilver Deposit / Small Thorium Vein', 0),
(21516, @PTEMPLATE+1, 0, 'Blasted Lands - Group 1 - Truesilver Deposit / Small Thorium Vein', 0),
(21524, @PTEMPLATE+1, 0, 'Blasted Lands - Group 1 - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (23012, 9436, 21525, 9437);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Group 2' WHERE `entry` IN (23012, 9436, 21525, 9437);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Group 2' WHERE `pool_entry` IN (23012, 9436, 21525, 9437);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Group 2 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(23012, @PTEMPLATE+2, 0, 'Blasted Lands - Group 2 - Truesilver Deposit / Small Thorium Vein', 0),
(9436, @PTEMPLATE+2, 0, 'Blasted Lands - Group 2 - Truesilver Deposit / Small Thorium Vein', 0),
(21525, @PTEMPLATE+2, 0, 'Blasted Lands - Group 2 - Truesilver Deposit / Small Thorium Vein', 0),
(9437, @PTEMPLATE+2, 0, 'Blasted Lands - Group 2 - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (21528, 21518, 14402, 21513);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Group 3' WHERE `entry` IN (21528, 21518, 14402, 21513);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Group 3' WHERE `pool_entry` IN (21528, 21518, 14402, 21513);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Group 3 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(21528, @PTEMPLATE+3, 0, 'Blasted Lands - Group 3 - Truesilver Deposit / Small Thorium Vein', 0),
(21518, @PTEMPLATE+3, 0, 'Blasted Lands - Group 3 - Truesilver Deposit / Small Thorium Vein', 0),
(14402, @PTEMPLATE+3, 0, 'Blasted Lands - Group 3 - Truesilver Deposit / Small Thorium Vein', 0),
(21513, @PTEMPLATE+3, 0, 'Blasted Lands - Group 3 - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (21517, 21515, 21514, 21520);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Group 4' WHERE `entry` IN (21517, 21515, 21514, 21520);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Group 4' WHERE `pool_entry` IN (21517, 21515, 21514, 21520);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 1, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Group 4 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(21517, @PTEMPLATE+4, 0, 'Blasted Lands - Group 4 - Truesilver Deposit / Small Thorium Vein', 0),
(21515, @PTEMPLATE+4, 0, 'Blasted Lands - Group 4 - Truesilver Deposit / Small Thorium Vein', 0),
(21514, @PTEMPLATE+4, 0, 'Blasted Lands - Group 4 - Truesilver Deposit / Small Thorium Vein', 0),
(21520, @PTEMPLATE+4, 0, 'Blasted Lands - Group 4 - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (21522, 14403, 21519, 21521);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Group 5' WHERE `entry` IN (21522, 14403, 21519, 21521);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Group 5' WHERE `pool_entry` IN (21522, 14403, 21519, 21521);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+5, 1, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Group 5 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(21522, @PTEMPLATE+5, 0, 'Blasted Lands - Group 5 - Truesilver Deposit / Small Thorium Vein', 0),
(14403, @PTEMPLATE+5, 0, 'Blasted Lands - Group 5 - Truesilver Deposit / Small Thorium Vein', 0),
(21519, @PTEMPLATE+5, 0, 'Blasted Lands - Group 5 - Truesilver Deposit / Small Thorium Vein', 0),
(21521, @PTEMPLATE+5, 0, 'Blasted Lands - Group 5 - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_template` WHERE  `entry` IN (8111, 8112, 1359);

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
