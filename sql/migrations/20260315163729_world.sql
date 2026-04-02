DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260315163729');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260315163729');
-- Add your query below.

SET @PTEMPLATE = 4095;

DELETE FROM `pool_pool` WHERE `pool_id` IN (5608, 5602, 5610, 5616, 5601);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Silithus - Group 1' WHERE `entry` IN (5608, 5602, 5610, 5616, 5601);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Silithus - Group 1' WHERE `pool_entry` IN (5608, 5602, 5610, 5616, 5601);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Silithus - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(5608, @PTEMPLATE+1, 0, 'Silithus - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5602, @PTEMPLATE+1, 0, 'Silithus - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5610, @PTEMPLATE+1, 0, 'Silithus - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5616, @PTEMPLATE+1, 0, 'Silithus - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5601, @PTEMPLATE+1, 0, 'Silithus - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (5612, 5615, 5316, 5317, 5605);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Silithus - Group 2' WHERE `entry` IN (5612, 5615, 5316, 5317, 5605);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Silithus - Group 2' WHERE `pool_entry` IN (5612, 5615, 5316, 5317, 5605);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Silithus - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(5612, @PTEMPLATE+2, 0, 'Silithus - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5615, @PTEMPLATE+2, 0, 'Silithus - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5316, @PTEMPLATE+2, 0, 'Silithus - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5317, @PTEMPLATE+2, 0, 'Silithus - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5605, @PTEMPLATE+2, 0, 'Silithus - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (5604, 5609, 5611, 5603, 5318);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Silithus - Group 3' WHERE `entry` IN (5604, 5609, 5611, 5603, 5318);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Silithus - Group 3' WHERE `pool_entry` IN (5604, 5609, 5611, 5603, 5318);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Silithus - Group 3 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(5604, @PTEMPLATE+3, 0, 'Silithus - Group 3 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5609, @PTEMPLATE+3, 0, 'Silithus - Group 3 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5611, @PTEMPLATE+3, 0, 'Silithus - Group 3 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5603, @PTEMPLATE+3, 0, 'Silithus - Group 3 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5318, @PTEMPLATE+3, 0, 'Silithus - Group 3 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (5613, 5607, 5319, 5320, 5614, 5606);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Silithus - Group 4' WHERE `entry` IN (5613, 5607, 5319, 5320, 5614, 5606);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Silithus - Group 4' WHERE `pool_entry` IN (5613, 5607, 5319, 5320, 5614, 5606);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 1, 'Silithus - Group 4 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(5613, @PTEMPLATE+4, 0, 'Silithus - Group 4 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5607, @PTEMPLATE+4, 0, 'Silithus - Group 4 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5319, @PTEMPLATE+4, 0, 'Silithus - Group 4 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5320, @PTEMPLATE+4, 0, 'Silithus - Group 4 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5614, @PTEMPLATE+4, 0, 'Silithus - Group 4 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5606, @PTEMPLATE+4, 0, 'Silithus - Group 4 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_template` WHERE  `entry` = 326;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
