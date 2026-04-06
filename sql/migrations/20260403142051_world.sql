DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260403142051');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260403142051');
-- Add your query below.

SET @PTEMPLATE = 293;

DELETE FROM `pool_pool` WHERE `pool_id` IN (990, 989, 988, 995, 987, 986);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Eastern Plaguelands - Group 1' WHERE `entry` IN (990, 989, 988, 995, 987, 986);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Eastern Plaguelands - Group 1' WHERE `pool_entry` IN (990, 989, 988, 995, 987, 986);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Eastern Plaguelands - Group 1 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(990, @PTEMPLATE+1, 0, 'Eastern Plaguelands - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(989, @PTEMPLATE+1, 0, 'Eastern Plaguelands - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(988, @PTEMPLATE+1, 0, 'Eastern Plaguelands - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(995, @PTEMPLATE+1, 0, 'Eastern Plaguelands - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(987, @PTEMPLATE+1, 0, 'Eastern Plaguelands - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(986, @PTEMPLATE+1, 0, 'Eastern Plaguelands - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (994, 993, 992, 991, 17193);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Eastern Plaguelands - Group 2' WHERE `entry` IN (994, 993, 992, 991, 17193);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Eastern Plaguelands - Group 2' WHERE `pool_entry` IN (994, 993, 992, 991, 17193);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Eastern Plaguelands - Group 2 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(994, @PTEMPLATE+2, 0, 'Eastern Plaguelands - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(993, @PTEMPLATE+2, 0, 'Eastern Plaguelands - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(992, @PTEMPLATE+2, 0, 'Eastern Plaguelands - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(991, @PTEMPLATE+2, 0, 'Eastern Plaguelands - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(17193, @PTEMPLATE+2, 0, 'Eastern Plaguelands - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_template` WHERE  `entry` = 1263;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
