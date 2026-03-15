DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260315101227');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260315101227');
-- Add your query below.

-- Thousand Needles
SET @PTEMPLATE = 4080;
DELETE FROM `pool_pool` WHERE `pool_id` IN (14259, 14267, 14260, 14265, 14266, 14264);
UPDATE `pool_template` SET `description` = 'Ooze Covered Silver Vein / Ooze Covered Gold Vein / Ooze Covered Mithril Deposit - Thousand Needles - Group 1' WHERE `entry` IN (14259, 14267, 14260, 14265, 14266, 14264);
UPDATE `pool_gameobject` SET `description` = 'Ooze Covered Silver Vein / Ooze Covered Gold Vein / Ooze Covered Mithril Deposit - Thousand Needles - Group 1' WHERE `pool_entry` IN (14259, 14267, 14260, 14265, 14266, 14264);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Thousand Needles - Group 1 - Ooze Covered Silver Vein / Ooze Covered Gold Vein / Ooze Covered Mithril Deposit', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(14259, @PTEMPLATE+1, 0, 'Thousand Needles - Group 1 - Ooze Covered Silver Vein / Ooze Covered Gold Vein / Ooze Covered Mithril Deposit', 0),
(14267, @PTEMPLATE+1, 0, 'Thousand Needles - Group 1 - Ooze Covered Silver Vein / Ooze Covered Gold Vein / Ooze Covered Mithril Deposit', 0),
(14260, @PTEMPLATE+1, 0, 'Thousand Needles - Group 1 - Ooze Covered Silver Vein / Ooze Covered Gold Vein / Ooze Covered Mithril Deposit', 0),
(14265, @PTEMPLATE+1, 0, 'Thousand Needles - Group 1 - Ooze Covered Silver Vein / Ooze Covered Gold Vein / Ooze Covered Mithril Deposit', 0),
(14266, @PTEMPLATE+1, 0, 'Thousand Needles - Group 1 - Ooze Covered Silver Vein / Ooze Covered Gold Vein / Ooze Covered Mithril Deposit', 0),
(14264, @PTEMPLATE+1, 0, 'Thousand Needles - Group 1 - Ooze Covered Silver Vein / Ooze Covered Gold Vein / Ooze Covered Mithril Deposit', 0);
DELETE FROM `pool_pool` WHERE `pool_id` IN (14261, 14263, 14262);
UPDATE `pool_template` SET `description` = 'Ooze Covered Silver Vein / Ooze Covered Gold Vein / Ooze Covered Mithril Deposit - Thousand Needles - Group 2' WHERE `entry` IN (14261, 14263, 14262);
UPDATE `pool_gameobject` SET `description` = 'Ooze Covered Silver Vein / Ooze Covered Gold Vein / Ooze Covered Mithril Deposit - Thousand Needles - Group 2' WHERE `pool_entry` IN (14261, 14263, 14262);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Thousand Needles - Group 2 - Ooze Covered Silver Vein / Ooze Covered Gold Vein / Ooze Covered Mithril Deposit', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(14261, @PTEMPLATE+2, 0, 'Thousand Needles - Group2 - Ooze Covered Silver Vein / Ooze Covered Gold Vein / Ooze Covered Mithril Deposit', 0),
(14263, @PTEMPLATE+2, 0, 'Thousand Needles - Group2 - Ooze Covered Silver Vein / Ooze Covered Gold Vein / Ooze Covered Mithril Deposit', 0),
(14262, @PTEMPLATE+2, 0, 'Thousand Needles - Group2 - Ooze Covered Silver Vein / Ooze Covered Gold Vein / Ooze Covered Mithril Deposit', 0);
DELETE FROM `pool_template` WHERE  `entry` = 304;

-- Feralas
SET @PTEMPLATE = 3535;
DELETE FROM `pool_pool` WHERE `pool_id` IN (3091, 3092, 3093);
UPDATE `pool_template` SET `description` = 'Ooze Covered Truesilver Deposit / Ooze Covered Thorium Vein - Feralas - Group 1' WHERE `entry` IN (3091, 3092, 3093);
UPDATE `pool_gameobject` SET `description` = 'Ooze Covered Truesilver Deposit / Ooze Covered Thorium Vein - Feralas - Group 1' WHERE `pool_entry` IN (3091, 3092, 3093);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Feralas - Group 1 - Ooze Covered Truesilver Deposit / Ooze Covered Thorium Vein', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(3091, @PTEMPLATE+1, 0, 'Feralas - Group 1 - Ooze Covered Truesilver Deposit / Ooze Covered Thorium Vein', 0),
(3092, @PTEMPLATE+1, 0, 'Feralas - Group 1 - Ooze Covered Truesilver Deposit / Ooze Covered Thorium Vein', 0),
(3093, @PTEMPLATE+1, 0, 'Feralas - Group 1 - Ooze Covered Truesilver Deposit / Ooze Covered Thorium Vein', 0);
DELETE FROM `pool_pool` WHERE `pool_id` IN (21631, 21632, 21633, 21634);
UPDATE `pool_template` SET `description` = 'Ooze Covered Gold Vein / Ooze Covered Mithril Deposit / Ooze Covered Truesilver Deposit - Feralas - Group 2' WHERE `entry` IN (21631, 21632, 21633, 21634);
UPDATE `pool_gameobject` SET `description` = 'Ooze Covered Gold Vein / Ooze Covered Mithril Deposit / Ooze Covered Truesilver Deposit - Feralas - Group 2' WHERE `pool_entry` IN (21631, 21632, 21633, 21634);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Feralas - Group 2 - Ooze Covered Gold Vein / Ooze Covered Mithril Deposit / Ooze Covered Truesilver Deposit', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(21631, @PTEMPLATE+2, 0, 'Feralas - Group 2 - Ooze Covered Gold Vein / Ooze Covered Mithril Deposit / Ooze Covered Truesilver Deposit', 0),
(21632, @PTEMPLATE+2, 0, 'Feralas - Group 2 - Ooze Covered Gold Vein / Ooze Covered Mithril Deposit / Ooze Covered Truesilver Deposit', 0),
(21633, @PTEMPLATE+2, 0, 'Feralas - Group 2 - Ooze Covered Gold Vein / Ooze Covered Mithril Deposit / Ooze Covered Truesilver Deposit', 0),
(21634, @PTEMPLATE+2, 0, 'Feralas - Group 2 - Ooze Covered Gold Vein / Ooze Covered Mithril Deposit / Ooze Covered Truesilver Deposit', 0);
DELETE FROM `pool_pool` WHERE `pool_id` IN (21635, 21636, 21637, 21638, 21639);
UPDATE `pool_template` SET `description` = 'Ooze Covered Gold Vein / Ooze Covered Mithril Deposit / Ooze Covered Truesilver Deposit - Feralas - Group 3' WHERE `entry` IN (21635, 21636, 21637, 21638, 21639);
UPDATE `pool_gameobject` SET `description` = 'Ooze Covered Gold Vein / Ooze Covered Mithril Deposit / Ooze Covered Truesilver Deposit - Feralas - Group 3' WHERE `pool_entry` IN (21635, 21636, 21637, 21638, 21639);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Feralas - Group 3 - Ooze Covered Gold Vein / Ooze Covered Mithril Deposit / Ooze Covered Truesilver Deposit', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(21635, @PTEMPLATE+3, 0, 'Feralas - Group 3 - Ooze Covered Gold Vein / Ooze Covered Mithril Deposit / Ooze Covered Truesilver Deposit', 0),
(21636, @PTEMPLATE+3, 0, 'Feralas - Group 3 - Ooze Covered Gold Vein / Ooze Covered Mithril Deposit / Ooze Covered Truesilver Deposit', 0),
(21637, @PTEMPLATE+3, 0, 'Feralas - Group 3 - Ooze Covered Gold Vein / Ooze Covered Mithril Deposit / Ooze Covered Truesilver Deposit', 0),
(21638, @PTEMPLATE+3, 0, 'Feralas - Group 3 - Ooze Covered Gold Vein / Ooze Covered Mithril Deposit / Ooze Covered Truesilver Deposit', 0),
(21639, @PTEMPLATE+3, 0, 'Feralas - Group 3 - Ooze Covered Gold Vein / Ooze Covered Mithril Deposit / Ooze Covered Truesilver Deposit', 0);
DELETE FROM `pool_pool` WHERE `pool_id` IN (21640, 21641, 21642, 21643, 21644);
UPDATE `pool_template` SET `description` = 'Ooze Covered Gold Vein / Ooze Covered Mithril Deposit / Ooze Covered Truesilver Deposit - Feralas - Group 4' WHERE `entry` IN (21640, 21641, 21642, 21643, 21644);
UPDATE `pool_gameobject` SET `description` = 'Ooze Covered Gold Vein / Ooze Covered Mithril Deposit / Ooze Covered Truesilver Deposit - Feralas - Group 4' WHERE `pool_entry` IN (21640, 21641, 21642, 21643, 21644);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 1, 'Feralas - Group 4 - Ooze Covered Gold Vein / Ooze Covered Mithril Deposit / Ooze Covered Truesilver Deposit', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(21640, @PTEMPLATE+4, 0, 'Feralas - Group 4 - Ooze Covered Gold Vein / Ooze Covered Mithril Deposit / Ooze Covered Truesilver Deposit', 0),
(21641, @PTEMPLATE+4, 0, 'Feralas - Group 4 - Ooze Covered Gold Vein / Ooze Covered Mithril Deposit / Ooze Covered Truesilver Deposit', 0),
(21642, @PTEMPLATE+4, 0, 'Feralas - Group 4 - Ooze Covered Gold Vein / Ooze Covered Mithril Deposit / Ooze Covered Truesilver Deposit', 0),
(21643, @PTEMPLATE+4, 0, 'Feralas - Group 4 - Ooze Covered Gold Vein / Ooze Covered Mithril Deposit / Ooze Covered Truesilver Deposit', 0),
(21644, @PTEMPLATE+4, 0, 'Feralas - Group 4 - Ooze Covered Gold Vein / Ooze Covered Mithril Deposit / Ooze Covered Truesilver Deposit', 0);
DELETE FROM `pool_template` WHERE  `entry` IN (1198, 413);

-- Un\'Goro
SET @PTEMPLATE = 1221;
DELETE FROM `pool_pool` WHERE `pool_id` IN (2267, 2270, 2265, 2266, 2271);
UPDATE `pool_template` SET `description` = 'Ooze Covered Truesilver Deposit / Ooze Covered Thorium Vein - Un\'Goro Crater - Group 1' WHERE `entry` IN (2267, 2270, 2265, 2266, 2271);
UPDATE `pool_gameobject` SET `description` = 'Ooze Covered Truesilver Deposit / Ooze Covered Thorium Vein - Un\'Goro Crater - Group 1' WHERE `pool_entry` IN (2267, 2270, 2265, 2266, 2271);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Un\'Goro Crater - Group 1 - Ooze Covered Truesilver Deposit / Ooze Covered Thorium Vein', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(2267, @PTEMPLATE+1, 0, 'Un\'Goro Crater - Group 1 - Ooze Covered Truesilver Deposit / Ooze Covered Thorium Vein', 0),
(2270, @PTEMPLATE+1, 0, 'Un\'Goro Crater - Group 1 - Ooze Covered Truesilver Deposit / Ooze Covered Thorium Vein', 0),
(2265, @PTEMPLATE+1, 0, 'Un\'Goro Crater - Group 1 - Ooze Covered Truesilver Deposit / Ooze Covered Thorium Vein', 0),
(2266, @PTEMPLATE+1, 0, 'Un\'Goro Crater - Group 1 - Ooze Covered Truesilver Deposit / Ooze Covered Thorium Vein', 0),
(2271, @PTEMPLATE+1, 0, 'Un\'Goro Crater - Group 1 - Ooze Covered Truesilver Deposit / Ooze Covered Thorium Vein', 0);
DELETE FROM `pool_pool` WHERE `pool_id` IN (14451, 2264, 2268, 2263, 2269);
UPDATE `pool_template` SET `description` = 'Ooze Covered Truesilver Deposit / Ooze Covered Thorium Vein - Un\'Goro Crater - Group 2' WHERE `entry` IN (14451, 2264, 2268, 2263, 2269);
UPDATE `pool_gameobject` SET `description` = 'Ooze Covered Truesilver Deposit / Ooze Covered Thorium Vein - Un\'Goro Crater - Group 2' WHERE `pool_entry` IN (14451, 2264, 2268, 2263, 2269);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Un\'Goro Crater - Group 2 - Ooze Covered Truesilver Deposit / Ooze Covered Thorium Vein', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(14451, @PTEMPLATE+2, 0, 'Un\'Goro Crater - Group 2 - Ooze Covered Truesilver Deposit / Ooze Covered Thorium Vein', 0),
(2264, @PTEMPLATE+2, 0, 'Un\'Goro Crater - Group 2 - Ooze Covered Truesilver Deposit / Ooze Covered Thorium Vein', 0),
(2268, @PTEMPLATE+2, 0, 'Un\'Goro Crater - Group 2 - Ooze Covered Truesilver Deposit / Ooze Covered Thorium Vein', 0),
(2263, @PTEMPLATE+2, 0, 'Un\'Goro Crater - Group 2 - Ooze Covered Truesilver Deposit / Ooze Covered Thorium Vein', 0),
(2269, @PTEMPLATE+2, 0, 'Un\'Goro Crater - Group 2 - Ooze Covered Truesilver Deposit / Ooze Covered Thorium Vein', 0);
DELETE FROM `pool_template` WHERE  `entry` = 412;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
