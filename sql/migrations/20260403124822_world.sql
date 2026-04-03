DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260403124822');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260403124822');
-- Add your query below.

SET @PTEMPLATE = 4668;

DELETE FROM `pool_pool` WHERE `pool_id` IN (5313, 14461, 14471, 14457);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Group 1' WHERE `entry` IN (5313, 14461, 14471, 14457);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Group 1' WHERE `pool_entry` IN (5313, 14461, 14471, 14457);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Group 1 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(5313, @PTEMPLATE+1, 0, 'Blasted Lands - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(14461, @PTEMPLATE+1, 0, 'Blasted Lands - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(14471, @PTEMPLATE+1, 0, 'Blasted Lands - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(14457, @PTEMPLATE+1, 0, 'Blasted Lands - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (5314, 14469, 14464, 14463);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Group 2' WHERE `entry` IN (5314, 14469, 14464, 14463);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Group 2' WHERE `pool_entry` IN (5314, 14469, 14464, 14463);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Group 2 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(5314, @PTEMPLATE+2, 0, 'Blasted Lands - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(14469, @PTEMPLATE+2, 0, 'Blasted Lands - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(14464, @PTEMPLATE+2, 0, 'Blasted Lands - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(14463, @PTEMPLATE+2, 0, 'Blasted Lands - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (14472, 14465, 14470, 14467);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Group 3' WHERE `entry` IN (14472, 14465, 14470, 14467);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Group 3' WHERE `pool_entry` IN (14472, 14465, 14470, 14467);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Group 3 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(14472, @PTEMPLATE+3, 0, 'Blasted Lands - Group 3 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(14465, @PTEMPLATE+3, 0, 'Blasted Lands - Group 3 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(14470, @PTEMPLATE+3, 0, 'Blasted Lands - Group 3 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(14467, @PTEMPLATE+3, 0, 'Blasted Lands - Group 3 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (14468, 14466, 14458, 14473);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Group 4' WHERE `entry` IN (14468, 14466, 14458, 14473);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Group 4' WHERE `pool_entry` IN (14468, 14466, 14458, 14473);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Group 4 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(14468, @PTEMPLATE+4, 0, 'Blasted Lands - Group 4 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(14466, @PTEMPLATE+4, 0, 'Blasted Lands - Group 4 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(14458, @PTEMPLATE+4, 0, 'Blasted Lands - Group 4 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(14473, @PTEMPLATE+4, 0, 'Blasted Lands - Group 4 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (14459, 14460, 5315, 14462);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Group 5' WHERE `entry` IN (14459, 14460, 5315, 14462);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Group 5' WHERE `pool_entry` IN (14459, 14460, 5315, 14462);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+5, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Group 5 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(14459, @PTEMPLATE+5, 0, 'Blasted Lands - Group 5 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(14460, @PTEMPLATE+5, 0, 'Blasted Lands - Group 5 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5315, @PTEMPLATE+5, 0, 'Blasted Lands - Group 5 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(14462, @PTEMPLATE+5, 0, 'Blasted Lands - Group 5 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_template` WHERE  `entry` = 1279;
UPDATE `pool_template` SET `max_limit`=1 WHERE  `entry`=8112 AND `patch_min`=0 AND `patch_max`=10;
DELETE FROM `gameobject` WHERE `guid` IN (2627, 2628, 2629);
DELETE FROM `pool_gameobject` WHERE `pool_entry` = 1347;
DELETE FROM `pool_pool` WHERE `pool_id` = 1347;
DELETE FROM `pool_template` WHERE `entry` = 1347;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
