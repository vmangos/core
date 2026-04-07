DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260407152428');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260407152428');
-- Add your query below.

SET @PTEMPLATE = 4804;

DELETE FROM `pool_pool` WHERE `pool_id` IN (4267, 4266, 4265, 4263, 4264, 4262);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows - Group 1' WHERE `entry` IN (4267, 4266, 4265, 4263, 4264, 4262);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows - Group 1' WHERE `pool_entry` IN (4267, 4266, 4265, 4263, 4264, 4262);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows - Group 1 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(4267, @PTEMPLATE+1, 0, 'Swamp of Sorrows - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4266, @PTEMPLATE+1, 0, 'Swamp of Sorrows - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4265, @PTEMPLATE+1, 0, 'Swamp of Sorrows - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4263, @PTEMPLATE+1, 0, 'Swamp of Sorrows - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4264, @PTEMPLATE+1, 0, 'Swamp of Sorrows - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4262, @PTEMPLATE+1, 0, 'Swamp of Sorrows - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (5285, 5287, 4261, 5331, 4260, 5286);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows - Group 2' WHERE `entry` IN (5285, 5287, 4261, 5331, 4260, 5286);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows - Group 2' WHERE `pool_entry` IN (5285, 5287, 4261, 5331, 4260, 5286);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows - Group 2 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(5285, @PTEMPLATE+2, 0, 'Swamp of Sorrows - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5287, @PTEMPLATE+2, 0, 'Swamp of Sorrows - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4261, @PTEMPLATE+2, 0, 'Swamp of Sorrows - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5331, @PTEMPLATE+2, 0, 'Swamp of Sorrows - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4260, @PTEMPLATE+2, 0, 'Swamp of Sorrows - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5286, @PTEMPLATE+2, 0, 'Swamp of Sorrows - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (5289, 4259, 4258, 5290);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows - Group 3' WHERE `entry` IN (5289, 4259, 4258, 5290);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows - Group 3' WHERE `pool_entry` IN (5289, 4259, 4258, 5290);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows - Group 3 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(5289, @PTEMPLATE+3, 0, 'Swamp of Sorrows - Group 3 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4259, @PTEMPLATE+3, 0, 'Swamp of Sorrows - Group 3 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4258, @PTEMPLATE+3, 0, 'Swamp of Sorrows - Group 3 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5290, @PTEMPLATE+3, 0, 'Swamp of Sorrows - Group 3 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (4257, 4256, 5288, 4255);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows - Group 4' WHERE `entry` IN (4257, 4256, 5288, 4255);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows - Group 4' WHERE `pool_entry` IN (4257, 4256, 5288, 4255);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows - Group 4 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(4257, @PTEMPLATE+4, 0, 'Swamp of Sorrows - Group 4 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4256, @PTEMPLATE+4, 0, 'Swamp of Sorrows - Group 4 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5288, @PTEMPLATE+4, 0, 'Swamp of Sorrows - Group 4 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4255, @PTEMPLATE+4, 0, 'Swamp of Sorrows - Group 4 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_template` WHERE  `entry` IN (1314, 8119);

UPDATE `pool_template` SET `max_limit`=1 WHERE `entry` = 269;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
