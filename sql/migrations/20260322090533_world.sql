DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260322090533');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260322090533');
-- Add your query below.

SET @PTEMPLATE = 4272;

DELETE FROM `pool_pool` WHERE `pool_id` IN (1394, 1397, 1392, 1390);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Un\'Goro Crater - Group 1' WHERE `entry` IN (1394, 1397, 1392, 1390);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Un\'Goro Crater - Group 1' WHERE `pool_entry` IN (1394, 1397, 1392, 1390);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Un\'Goro Crater - Group 1 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1394, @PTEMPLATE+1, 0, 'Un\'Goro Crater - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(1397, @PTEMPLATE+1, 0, 'Un\'Goro Crater - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(1392, @PTEMPLATE+1, 0, 'Un\'Goro Crater - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(1390, @PTEMPLATE+1, 0, 'Un\'Goro Crater - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (1401, 1398, 1402, 1395);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Un\'Goro Crater - Group 2' WHERE `entry` IN (1401, 1398, 1402, 1395);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Un\'Goro Crater - Group 2' WHERE `pool_entry` IN (1401, 1398, 1402, 1395);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Un\'Goro Crater - Group 2 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1401, @PTEMPLATE+2, 0, 'Un\'Goro Crater - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(1398, @PTEMPLATE+2, 0, 'Un\'Goro Crater - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(1402, @PTEMPLATE+2, 0, 'Un\'Goro Crater - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(1395, @PTEMPLATE+2, 0, 'Un\'Goro Crater - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (1393, 1391, 1396, 1388);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Un\'Goro Crater - Group 3' WHERE `entry` IN (1393, 1391, 1396, 1388);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Un\'Goro Crater - Group 3' WHERE `pool_entry` IN (1393, 1391, 1396, 1388);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Un\'Goro Crater - Group 3 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1393, @PTEMPLATE+3, 0, 'Un\'Goro Crater - Group 3 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(1391, @PTEMPLATE+3, 0, 'Un\'Goro Crater - Group 3 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(1396, @PTEMPLATE+3, 0, 'Un\'Goro Crater - Group 3 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(1388, @PTEMPLATE+3, 0, 'Un\'Goro Crater - Group 3 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (1387, 1386, 1389, 1399);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Un\'Goro Crater - Group 4' WHERE `entry` IN (1387, 1386, 1389, 1399);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Un\'Goro Crater - Group 4' WHERE `pool_entry` IN (1387, 1386, 1389, 1399);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Un\'Goro Crater - Group 4 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1387, @PTEMPLATE+4, 0, 'Un\'Goro Crater - Group 4 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(1386, @PTEMPLATE+4, 0, 'Un\'Goro Crater - Group 4 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(1389, @PTEMPLATE+4, 0, 'Un\'Goro Crater - Group 4 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(1399, @PTEMPLATE+4, 0, 'Un\'Goro Crater - Group 4 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_template` WHERE  `entry` = 1210;
UPDATE `pool_template` SET `description`='Ooze Covered Truesilver Deposit / Ooze Covered Thorium Vein - Un\'Goro Crater - Group 1 - Master' WHERE  `entry`=1222 AND `patch_min`=0 AND `patch_max`=10;
UPDATE `pool_template` SET `description`='Ooze Covered Truesilver Deposit / Ooze Covered Thorium Vein - Un\'Goro Crater - Group 2 - Master' WHERE  `entry`=1223 AND `patch_min`=0 AND `patch_max`=10;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
