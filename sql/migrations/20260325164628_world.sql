DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260325164628');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260325164628');
-- Add your query below.

SET @PTEMPLATE = 4583;

DELETE FROM `pool_pool` WHERE `pool_id` IN (22966, 22968, 17194, 22948, 22964, 22963);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Silithus - Group 1' WHERE `entry` IN (22966, 22968, 17194, 22948, 22964, 22963);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Silithus - Group 1' WHERE `pool_entry` IN (22966, 22968, 17194, 22948, 22964, 22963);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Small Thorium Vein - Silithus - Group 1 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(22966, @PTEMPLATE+1, 0, 'Silithus - Group 1 - Truesilver Deposit / Small Thorium Vein', 0),
(22968, @PTEMPLATE+1, 0, 'Silithus - Group 1 - Truesilver Deposit / Small Thorium Vein', 0),
(17194, @PTEMPLATE+1, 0, 'Silithus - Group 1 - Truesilver Deposit / Small Thorium Vein', 0),
(22948, @PTEMPLATE+1, 0, 'Silithus - Group 1 - Truesilver Deposit / Small Thorium Vein', 0),
(22964, @PTEMPLATE+1, 0, 'Silithus - Group 1 - Truesilver Deposit / Small Thorium Vein', 0),
(22963, @PTEMPLATE+1, 0, 'Silithus - Group 1 - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (22961, 22962, 23006, 22949, 22950, 9446);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Silithus - Group 2' WHERE `entry` IN (22961, 22962, 23006, 22949, 22950, 9446);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Silithus - Group 2' WHERE `pool_entry` IN (22961, 22962, 23006, 22949, 22950, 9446);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Truesilver Deposit / Small Thorium Vein - Silithus - Group 2 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(22961, @PTEMPLATE+2, 0, 'Silithus - Group 2 - Truesilver Deposit / Small Thorium Vein', 0),
(22962, @PTEMPLATE+2, 0, 'Silithus - Group 2 - Truesilver Deposit / Small Thorium Vein', 0),
(23006, @PTEMPLATE+2, 0, 'Silithus - Group 2 - Truesilver Deposit / Small Thorium Vein', 0),
(22949, @PTEMPLATE+2, 0, 'Silithus - Group 2 - Truesilver Deposit / Small Thorium Vein', 0),
(22950, @PTEMPLATE+2, 0, 'Silithus - Group 2 - Truesilver Deposit / Small Thorium Vein', 0),
(9446, @PTEMPLATE+2, 0, 'Silithus - Group 2 - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (22955, 22954, 9447, 22972, 22973);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Silithus - Group 3' WHERE `entry` IN (22955, 22954, 9447, 22972, 22973);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Silithus - Group 3' WHERE `pool_entry` IN (22955, 22954, 9447, 22972, 22973);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Truesilver Deposit / Small Thorium Vein - Silithus - Group 3 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(22955, @PTEMPLATE+3, 0, 'Silithus - Group 3 - Truesilver Deposit / Small Thorium Vein', 0),
(22954, @PTEMPLATE+3, 0, 'Silithus - Group 3 - Truesilver Deposit / Small Thorium Vein', 0),
(9447, @PTEMPLATE+3, 0, 'Silithus - Group 3 - Truesilver Deposit / Small Thorium Vein', 0),
(22972, @PTEMPLATE+3, 0, 'Silithus - Group 3 - Truesilver Deposit / Small Thorium Vein', 0),
(22973, @PTEMPLATE+3, 0, 'Silithus - Group 3 - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (14422, 22956, 22951, 14421, 9448);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Silithus - Group 4' WHERE `entry` IN (14422, 22956, 22951, 14421, 9448);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Silithus - Group 4' WHERE `pool_entry` IN (14422, 22956, 22951, 14421, 9448);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 1, 'Truesilver Deposit / Small Thorium Vein - Silithus - Group 4 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(14422, @PTEMPLATE+4, 0, 'Silithus - Group 4 - Truesilver Deposit / Small Thorium Vein', 0),
(22956, @PTEMPLATE+4, 0, 'Silithus - Group 4 - Truesilver Deposit / Small Thorium Vein', 0),
(22951, @PTEMPLATE+4, 0, 'Silithus - Group 4 - Truesilver Deposit / Small Thorium Vein', 0),
(14421, @PTEMPLATE+4, 0, 'Silithus - Group 4 - Truesilver Deposit / Small Thorium Vein', 0),
(9448, @PTEMPLATE+4, 0, 'Silithus - Group 4 - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (9449, 9450, 5617, 9451, 22971);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Silithus - Group 5' WHERE `entry` IN (9449, 9450, 5617, 9451, 22971);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Silithus - Group 5' WHERE `pool_entry` IN (9449, 9450, 5617, 9451, 22971);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+5, 1, 'Truesilver Deposit / Small Thorium Vein - Silithus - Group 5 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(9449, @PTEMPLATE+5, 0, 'Silithus - Group 5 - Truesilver Deposit / Small Thorium Vein', 0),
(9450, @PTEMPLATE+5, 0, 'Silithus - Group 5 - Truesilver Deposit / Small Thorium Vein', 0),
(5617, @PTEMPLATE+5, 0, 'Silithus - Group 5 - Truesilver Deposit / Small Thorium Vein', 0),
(9451, @PTEMPLATE+5, 0, 'Silithus - Group 5 - Truesilver Deposit / Small Thorium Vein', 0),
(22971, @PTEMPLATE+5, 0, 'Silithus - Group 5 - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (22957, 17195, 22953, 22952, 22970);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Silithus - Group 6' WHERE `entry` IN (22957, 17195, 22953, 22952, 22970);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Silithus - Group 6' WHERE `pool_entry` IN (22957, 17195, 22953, 22952, 22970);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+6, 1, 'Truesilver Deposit / Small Thorium Vein - Silithus - Group 6 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(22957, @PTEMPLATE+6, 0, 'Silithus - Group 6 - Truesilver Deposit / Small Thorium Vein', 0),
(17195, @PTEMPLATE+6, 0, 'Silithus - Group 6 - Truesilver Deposit / Small Thorium Vein', 0),
(22953, @PTEMPLATE+6, 0, 'Silithus - Group 6 - Truesilver Deposit / Small Thorium Vein', 0),
(22952, @PTEMPLATE+6, 0, 'Silithus - Group 6 - Truesilver Deposit / Small Thorium Vein', 0),
(22970, @PTEMPLATE+6, 0, 'Silithus - Group 6 - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (22969, 14420, 22959, 9452, 23004);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Silithus - Group 7' WHERE `entry` IN (22969, 14420, 22959, 9452, 23004);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Silithus - Group 7' WHERE `pool_entry` IN (22969, 14420, 22959, 9452, 23004);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+7, 1, 'Truesilver Deposit / Small Thorium Vein - Silithus - Group 7 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(22969, @PTEMPLATE+7, 0, 'Silithus - Group 7 - Truesilver Deposit / Small Thorium Vein', 0),
(14420, @PTEMPLATE+7, 0, 'Silithus - Group 7 - Truesilver Deposit / Small Thorium Vein', 0),
(22959, @PTEMPLATE+7, 0, 'Silithus - Group 7 - Truesilver Deposit / Small Thorium Vein', 0),
(9452, @PTEMPLATE+7, 0, 'Silithus - Group 7 - Truesilver Deposit / Small Thorium Vein', 0),
(23004, @PTEMPLATE+7, 0, 'Silithus - Group 7 - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (22946, 9453, 22945, 23005, 22947);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Silithus - Group 8' WHERE `entry` IN (22946, 9453, 22945, 23005, 22947);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Silithus - Group 8' WHERE `pool_entry` IN (22946, 9453, 22945, 23005, 22947);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+8, 1, 'Truesilver Deposit / Small Thorium Vein - Silithus - Group 8 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(22946, @PTEMPLATE+8, 0, 'Silithus - Group 8 - Truesilver Deposit / Small Thorium Vein', 0),
(9453, @PTEMPLATE+8, 0, 'Silithus - Group 8 - Truesilver Deposit / Small Thorium Vein', 0),
(22945, @PTEMPLATE+8, 0, 'Silithus - Group 8 - Truesilver Deposit / Small Thorium Vein', 0),
(23005, @PTEMPLATE+8, 0, 'Silithus - Group 8 - Truesilver Deposit / Small Thorium Vein', 0),
(22947, @PTEMPLATE+8, 0, 'Silithus - Group 8 - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_template` WHERE `entry` IN (22958, 22960, 22965, 22967, 1219);
DELETE FROM `pool_pool` WHERE `pool_id` IN (22958, 22960, 22965, 22967);
DELETE FROM `pool_gameobject` WHERE `pool_entry` IN ( 22958, 22960, 22965, 22967);
DELETE FROM `gameobject` WHERE `guid` IN ( 23495, 23524, 23497, 23526, 23502, 23531, 23504, 23533);

UPDATE `pool_template` SET `description`='Gold Vein / Mithril Deposit / Truesilver Deposit - Silithus - Group 1 - Master' WHERE  `entry`=4096 AND `patch_min`=0 AND `patch_max`=10;
UPDATE `pool_template` SET `description`='Gold Vein / Mithril Deposit / Truesilver Deposit - Silithus - Group 2 - Master' WHERE  `entry`=4097 AND `patch_min`=0 AND `patch_max`=10;
UPDATE `pool_template` SET `description`='Gold Vein / Mithril Deposit / Truesilver Deposit - Silithus - Group 3 - Master' WHERE  `entry`=4098 AND `patch_min`=0 AND `patch_max`=10;
UPDATE `pool_template` SET `description`='Gold Vein / Mithril Deposit / Truesilver Deposit - Silithus - Group 4 - Master' WHERE  `entry`=4099 AND `patch_min`=0 AND `patch_max`=10;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
