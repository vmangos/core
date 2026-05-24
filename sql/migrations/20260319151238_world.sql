DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260319151238');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260319151238');
-- Add your query below.

SET @PTEMPLATE = 4244;

DELETE FROM `pool_pool` WHERE `pool_id` IN (436, 442, 5327, 440, 437);
UPDATE `pool_template` SET `description` = 'Mithril Deposit / Gold Vein / Truesilver Deposit - Western Plaguelands - Group 1' WHERE `entry` IN (436, 442, 5327, 440, 437);
UPDATE `pool_gameobject` SET `description` = 'Mithril Deposit / Gold Vein / Truesilver Deposit - Western Plaguelands - Group 1' WHERE `pool_entry` IN (436, 442, 5327, 440, 437);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Western Plaguelands - Group 1 - Mithril Deposit / Gold Vein / Truesilver Deposit', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(436, @PTEMPLATE+1, 0, 'Western Plaguelands - Group 1 - Mithril Deposit / Gold Vein / Truesilver Deposit', 0),
(442, @PTEMPLATE+1, 0, 'Western Plaguelands - Group 1 - Mithril Deposit / Gold Vein / Truesilver Deposit', 0),
(5327, @PTEMPLATE+1, 0, 'Western Plaguelands - Group 1 - Mithril Deposit / Gold Vein / Truesilver Deposit', 0),
(440, @PTEMPLATE+1, 0, 'Western Plaguelands - Group 1 - Mithril Deposit / Gold Vein / Truesilver Deposit', 0),
(437, @PTEMPLATE+1, 0, 'Western Plaguelands - Group 1 - Mithril Deposit / Gold Vein / Truesilver Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (430, 429, 432, 427, 420);
UPDATE `pool_template` SET `description` = 'Mithril Deposit / Gold Vein / Truesilver Deposit - Western Plaguelands - Group 2' WHERE `entry` IN (430, 429, 432, 427, 420);
UPDATE `pool_gameobject` SET `description` = 'Mithril Deposit / Gold Vein / Truesilver Deposit - Western Plaguelands - Group 2' WHERE `pool_entry` IN (430, 429, 432, 427, 420);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Western Plaguelands - Group 2 - Mithril Deposit / Gold Vein / Truesilver Deposit', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(430, @PTEMPLATE+2, 0, 'Western Plaguelands - Group 2 - Mithril Deposit / Gold Vein / Truesilver Deposit', 0),
(429, @PTEMPLATE+2, 0, 'Western Plaguelands - Group 2 - Mithril Deposit / Gold Vein / Truesilver Deposit', 0),
(432, @PTEMPLATE+2, 0, 'Western Plaguelands - Group 2 - Mithril Deposit / Gold Vein / Truesilver Deposit', 0),
(427, @PTEMPLATE+2, 0, 'Western Plaguelands - Group 2 - Mithril Deposit / Gold Vein / Truesilver Deposit', 0),
(420, @PTEMPLATE+2, 0, 'Western Plaguelands - Group 2 - Mithril Deposit / Gold Vein / Truesilver Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (426, 441, 431, 17192, 423);
UPDATE `pool_template` SET `description` = 'Mithril Deposit / Gold Vein / Truesilver Deposit - Western Plaguelands - Group 3' WHERE `entry` IN (426, 441, 431, 17192, 423);
UPDATE `pool_gameobject` SET `description` = 'Mithril Deposit / Gold Vein / Truesilver Deposit - Western Plaguelands - Group 3' WHERE `pool_entry` IN (426, 441, 431, 17192, 423);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Western Plaguelands - Group 3 - Mithril Deposit / Gold Vein / Truesilver Deposit', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(426, @PTEMPLATE+3, 0, 'Western Plaguelands - Group 3 - Mithril Deposit / Gold Vein / Truesilver Deposit', 0),
(441, @PTEMPLATE+3, 0, 'Western Plaguelands - Group 3 - Mithril Deposit / Gold Vein / Truesilver Deposit', 0),
(431, @PTEMPLATE+3, 0, 'Western Plaguelands - Group 3 - Mithril Deposit / Gold Vein / Truesilver Deposit', 0),
(17192, @PTEMPLATE+3, 0, 'Western Plaguelands - Group 3 - Mithril Deposit / Gold Vein / Truesilver Deposit', 0),
(423, @PTEMPLATE+3, 0, 'Western Plaguelands - Group 3 - Mithril Deposit / Gold Vein / Truesilver Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (5328, 438, 17191, 434, 428, 421);
UPDATE `pool_template` SET `description` = 'Mithril Deposit / Gold Vein / Truesilver Deposit - Western Plaguelands - Group 4' WHERE `entry` IN (5328, 438, 17191, 434, 428, 421);
UPDATE `pool_gameobject` SET `description` = 'Mithril Deposit / Gold Vein / Truesilver Deposit - Western Plaguelands - Group 4' WHERE `pool_entry` IN (5328, 438, 17191, 434, 428, 421);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 1, 'Western Plaguelands - Group 4 - Mithril Deposit / Gold Vein / Truesilver Deposit', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(5328, @PTEMPLATE+4, 0, 'Western Plaguelands - Group 4 - Mithril Deposit / Gold Vein / Truesilver Deposit', 0),
(438, @PTEMPLATE+4, 0, 'Western Plaguelands - Group 4 - Mithril Deposit / Gold Vein / Truesilver Deposit', 0),
(17191, @PTEMPLATE+4, 0, 'Western Plaguelands - Group 4 - Mithril Deposit / Gold Vein / Truesilver Deposit', 0),
(434, @PTEMPLATE+4, 0, 'Western Plaguelands - Group 4 - Mithril Deposit / Gold Vein / Truesilver Deposit', 0),
(428, @PTEMPLATE+4, 0, 'Western Plaguelands - Group 4 - Mithril Deposit / Gold Vein / Truesilver Deposit', 0),
(421, @PTEMPLATE+4, 0, 'Western Plaguelands - Group 4 - Mithril Deposit / Gold Vein / Truesilver Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (439, 418, 435, 443, 425, 433);
UPDATE `pool_template` SET `description` = 'Mithril Deposit / Gold Vein / Truesilver Deposit - Western Plaguelands - Group 5' WHERE `entry` IN (439, 418, 435, 443, 425, 433);
UPDATE `pool_gameobject` SET `description` = 'Mithril Deposit / Gold Vein / Truesilver Deposit - Western Plaguelands - Group 5' WHERE `pool_entry` IN (439, 418, 435, 443, 425, 433);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+5, 1, 'Western Plaguelands - Group 5 - Mithril Deposit / Gold Vein / Truesilver Deposit', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(439, @PTEMPLATE+5, 0, 'Western Plaguelands - Group 5 - Mithril Deposit / Gold Vein / Truesilver Deposit', 0),
(418, @PTEMPLATE+5, 0, 'Western Plaguelands - Group 5 - Mithril Deposit / Gold Vein / Truesilver Deposit', 0),
(435, @PTEMPLATE+5, 0, 'Western Plaguelands - Group 5 - Mithril Deposit / Gold Vein / Truesilver Deposit', 0),
(443, @PTEMPLATE+5, 0, 'Western Plaguelands - Group 5 - Mithril Deposit / Gold Vein / Truesilver Deposit', 0),
(425, @PTEMPLATE+5, 0, 'Western Plaguelands - Group 5 - Mithril Deposit / Gold Vein / Truesilver Deposit', 0),
(433, @PTEMPLATE+5, 0, 'Western Plaguelands - Group 5 - Mithril Deposit / Gold Vein / Truesilver Deposit', 0);

DELETE FROM `pool_template` WHERE `entry` IN (1271, 419, 422, 424);
DELETE FROM `pool_pool` WHERE `pool_id` IN (419, 422, 424);
DELETE FROM `pool_gameobject` WHERE `pool_entry` IN (419, 422, 424);
DELETE FROM `gameobject` WHERE `guid` IN (21845, 21872, 21899, 21848, 21875, 21902, 21850, 21877, 21904);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
