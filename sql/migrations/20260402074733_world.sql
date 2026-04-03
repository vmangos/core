DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260402074733');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260402074733');
-- Add your query below.

SET @PTEMPLATE = 4663;

DELETE FROM `pool_pool` WHERE `pool_id` IN (2454, 6005, 2455, 2456, 2457, 2458);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh - Group 1' WHERE `entry` IN (2454, 6005, 2455, 2456, 2457, 2458);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh - Group 1' WHERE `pool_entry` IN (2454, 6005, 2455, 2456, 2457, 2458);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh - Group 1 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(2454, @PTEMPLATE+1, 0, 'Dustwallow Marsh - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(6005, @PTEMPLATE+1, 0, 'Dustwallow Marsh - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(2455, @PTEMPLATE+1, 0, 'Dustwallow Marsh - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(2456, @PTEMPLATE+1, 0, 'Dustwallow Marsh - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(2457, @PTEMPLATE+1, 0, 'Dustwallow Marsh - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(2458, @PTEMPLATE+1, 0, 'Dustwallow Marsh - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (2459, 2460, 6003, 2461, 2462, 2463);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh - Group 2' WHERE `entry` IN (2459, 2460, 6003, 2461, 2462, 2463);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh - Group 2' WHERE `pool_entry` IN (2459, 2460, 6003, 2461, 2462, 2463);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh - Group 2 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(2459, @PTEMPLATE+2, 0, 'Dustwallow Marsh - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(2460, @PTEMPLATE+2, 0, 'Dustwallow Marsh - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(6003, @PTEMPLATE+2, 0, 'Dustwallow Marsh - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(2461, @PTEMPLATE+2, 0, 'Dustwallow Marsh - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(2462, @PTEMPLATE+2, 0, 'Dustwallow Marsh - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(2463, @PTEMPLATE+2, 0, 'Dustwallow Marsh - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (6002, 2775, 6008, 6010);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh - Group 3' WHERE `entry` IN (6002, 2775, 6008, 6010);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh - Group 3' WHERE `pool_entry` IN (6002, 2775, 6008, 6010);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh - Group 3 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(6002, @PTEMPLATE+3, 0, 'Dustwallow Marsh - Group 3 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(2775, @PTEMPLATE+3, 0, 'Dustwallow Marsh - Group 3 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(6008, @PTEMPLATE+3, 0, 'Dustwallow Marsh - Group 3 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(6010, @PTEMPLATE+3, 0, 'Dustwallow Marsh - Group 3 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (6004, 6055, 2774, 6009);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh - Group 4' WHERE `entry` IN (6004, 6055, 2774, 6009);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh - Group 4' WHERE `pool_entry` IN (6004, 6055, 2774, 6009);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh - Group 4 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(6004, @PTEMPLATE+4, 0, 'Dustwallow Marsh - Group 4 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(6055, @PTEMPLATE+4, 0, 'Dustwallow Marsh - Group 4 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(2774, @PTEMPLATE+4, 0, 'Dustwallow Marsh - Group 4 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(6009, @PTEMPLATE+4, 0, 'Dustwallow Marsh - Group 4 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (6007, 6058, 6006, 6001);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh - Group 5' WHERE `entry` IN (6007, 6058, 6006, 6001);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh - Group 5' WHERE `pool_entry` IN (6007, 6058, 6006, 6001);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+5, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh - Group 5 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(6007, @PTEMPLATE+5, 0, 'Dustwallow Marsh - Group 5 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(6058, @PTEMPLATE+5, 0, 'Dustwallow Marsh - Group 5 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(6006, @PTEMPLATE+5, 0, 'Dustwallow Marsh - Group 5 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(6001, @PTEMPLATE+5, 0, 'Dustwallow Marsh - Group 5 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_template` WHERE  `entry` = 9903;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
