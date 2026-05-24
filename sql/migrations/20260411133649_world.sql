DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260411133649');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260411133649');
-- Add your query below.

SET @PTEMPLATE = 4955;

DELETE FROM `pool_pool` WHERE `pool_id` IN (440, 5327, 442, 436, 437);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Western Plaguelands - Group 1' WHERE `entry` IN (440, 5327, 442, 436, 437);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Western Plaguelands - Group 1' WHERE `pool_entry` IN (440, 5327, 442, 436, 437);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Western Plaguelands - Group 1 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(440, @PTEMPLATE+1, 0, 'Western Plaguelands - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5327, @PTEMPLATE+1, 0, 'Western Plaguelands - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(442, @PTEMPLATE+1, 0, 'Western Plaguelands - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(436, @PTEMPLATE+1, 0, 'Western Plaguelands - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(437, @PTEMPLATE+1, 0, 'Western Plaguelands - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (427, 432, 429, 430, 420);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Western Plaguelands - Group 2' WHERE `entry` IN (427, 432, 429, 430, 420);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Western Plaguelands - Group 2' WHERE `pool_entry` IN (427, 432, 429, 430, 420);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Western Plaguelands - Group 2 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(427, @PTEMPLATE+2, 0, 'Western Plaguelands - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(432, @PTEMPLATE+2, 0, 'Western Plaguelands - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(429, @PTEMPLATE+2, 0, 'Western Plaguelands - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(430, @PTEMPLATE+2, 0, 'Western Plaguelands - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(420, @PTEMPLATE+2, 0, 'Western Plaguelands - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (17192, 431, 441, 426, 423);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Western Plaguelands - Group 3' WHERE `entry` IN (17192, 431, 441, 426, 423);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Western Plaguelands - Group 3' WHERE `pool_entry` IN (17192, 431, 441, 426, 423);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Western Plaguelands - Group 3 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(17192, @PTEMPLATE+3, 0, 'Western Plaguelands - Group 3 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(431, @PTEMPLATE+3, 0, 'Western Plaguelands - Group 3 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(441, @PTEMPLATE+3, 0, 'Western Plaguelands - Group 3 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(426, @PTEMPLATE+3, 0, 'Western Plaguelands - Group 3 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(423, @PTEMPLATE+3, 0, 'Western Plaguelands - Group 3 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (434, 17191, 5328, 438, 428, 421);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Western Plaguelands - Group 4' WHERE `entry` IN (434, 17191, 5328, 438, 428, 421);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Western Plaguelands - Group 4' WHERE `pool_entry` IN (434, 17191, 5328, 438, 428, 421);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Western Plaguelands - Group 4 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(434, @PTEMPLATE+4, 0, 'Western Plaguelands - Group 4 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(17191, @PTEMPLATE+4, 0, 'Western Plaguelands - Group 4 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5328, @PTEMPLATE+4, 0, 'Western Plaguelands - Group 4 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(438, @PTEMPLATE+4, 0, 'Western Plaguelands - Group 4 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(428, @PTEMPLATE+4, 0, 'Western Plaguelands - Group 4 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(421, @PTEMPLATE+4, 0, 'Western Plaguelands - Group 4 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (443, 435, 418, 439, 425, 433);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Western Plaguelands - Group 5' WHERE `entry` IN (443, 435, 418, 439, 425, 433);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Western Plaguelands - Group 5' WHERE `pool_entry` IN (443, 435, 418, 439, 425, 433);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+5, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Western Plaguelands - Group 5 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(443, @PTEMPLATE+5, 0, 'Western Plaguelands - Group 5 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(435, @PTEMPLATE+5, 0, 'Western Plaguelands - Group 5 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(418, @PTEMPLATE+5, 0, 'Western Plaguelands - Group 5 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(439, @PTEMPLATE+5, 0, 'Western Plaguelands - Group 5 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(425, @PTEMPLATE+5, 0, 'Western Plaguelands - Group 5 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(433, @PTEMPLATE+5, 0, 'Western Plaguelands - Group 5 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_template` WHERE  `entry` IN (4245, 4246, 4247, 4248, 4249);

SET @PTEMPLATE = 4244;

DELETE FROM `pool_pool` WHERE `pool_id` IN (9417, 25473, 25469, 25480, 25472);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands - Group 1' WHERE `entry` IN (9417, 25473, 25469, 25480, 25472);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands - Group 1' WHERE `pool_entry` IN (9417, 25473, 25469, 25480, 25472);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands - Group 1 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(9417, @PTEMPLATE+1, 0, 'Western Plaguelands - Group 1 - Truesilver Deposit / Small Thorium Vein', 0),
(25473, @PTEMPLATE+1, 0, 'Western Plaguelands - Group 1 - Truesilver Deposit / Small Thorium Vein', 0),
(25469, @PTEMPLATE+1, 0, 'Western Plaguelands - Group 1 - Truesilver Deposit / Small Thorium Vein', 0),
(25480, @PTEMPLATE+1, 0, 'Western Plaguelands - Group 1 - Truesilver Deposit / Small Thorium Vein', 0),
(25472, @PTEMPLATE+1, 0, 'Western Plaguelands - Group 1 - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (9418, 25486, 25482, 25476, 25475);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands - Group 2' WHERE `entry` IN (9418, 25486, 25482, 25476, 25475);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands - Group 2' WHERE `pool_entry` IN (9418, 25486, 25482, 25476, 25475);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands - Group 2 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(9418, @PTEMPLATE+2, 0, 'Western Plaguelands - Group 2 - Truesilver Deposit / Small Thorium Vein', 0),
(25486, @PTEMPLATE+2, 0, 'Western Plaguelands - Group 2 - Truesilver Deposit / Small Thorium Vein', 0),
(25482, @PTEMPLATE+2, 0, 'Western Plaguelands - Group 2 - Truesilver Deposit / Small Thorium Vein', 0),
(25476, @PTEMPLATE+2, 0, 'Western Plaguelands - Group 2 - Truesilver Deposit / Small Thorium Vein', 0),
(25475, @PTEMPLATE+2, 0, 'Western Plaguelands - Group 2 - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (25481, 25487, 25479, 25470, 14428, 25484);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands - Group 3' WHERE `entry` IN (25481, 25487, 25479, 25470, 14428, 25484);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands - Group 3' WHERE `pool_entry` IN (25481, 25487, 25479, 25470, 14428, 25484);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands - Group 3 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(25481, @PTEMPLATE+3, 0, 'Western Plaguelands - Group 3 - Truesilver Deposit / Small Thorium Vein', 0),
(25487, @PTEMPLATE+3, 0, 'Western Plaguelands - Group 3 - Truesilver Deposit / Small Thorium Vein', 0),
(25479, @PTEMPLATE+3, 0, 'Western Plaguelands - Group 3 - Truesilver Deposit / Small Thorium Vein', 0),
(25470, @PTEMPLATE+3, 0, 'Western Plaguelands - Group 3 - Truesilver Deposit / Small Thorium Vein', 0),
(14428, @PTEMPLATE+3, 0, 'Western Plaguelands - Group 3 - Truesilver Deposit / Small Thorium Vein', 0),
(25484, @PTEMPLATE+3, 0, 'Western Plaguelands - Group 3 - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (25478, 25471, 14429, 25474, 25483, 25477);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands - Group 4' WHERE `entry` IN (25478, 25471, 14429, 25474, 25483, 25477);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands - Group 4' WHERE `pool_entry` IN (25478, 25471, 14429, 25474, 25483, 25477);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 1, 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands - Group 4 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(25478, @PTEMPLATE+4, 0, 'Western Plaguelands - Group 4 - Truesilver Deposit / Small Thorium Vein', 0),
(25471, @PTEMPLATE+4, 0, 'Western Plaguelands - Group 4 - Truesilver Deposit / Small Thorium Vein', 0),
(14429, @PTEMPLATE+4, 0, 'Western Plaguelands - Group 4 - Truesilver Deposit / Small Thorium Vein', 0),
(25474, @PTEMPLATE+4, 0, 'Western Plaguelands - Group 4 - Truesilver Deposit / Small Thorium Vein', 0),
(25483, @PTEMPLATE+4, 0, 'Western Plaguelands - Group 4 - Truesilver Deposit / Small Thorium Vein', 0),
(25477, @PTEMPLATE+4, 0, 'Western Plaguelands - Group 4 - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (9419, 23011, 9421, 21662, 9420);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands - Group 5' WHERE `entry` IN (9419, 23011, 9421, 21662, 9420);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands - Group 5' WHERE `pool_entry` IN (9419, 23011, 9421, 21662, 9420);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+5, 1, 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands - Group 5 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(9419, @PTEMPLATE+5, 0, 'Western Plaguelands - Group 5 - Truesilver Deposit / Small Thorium Vein', 0),
(23011, @PTEMPLATE+5, 0, 'Western Plaguelands - Group 5 - Truesilver Deposit / Small Thorium Vein', 0),
(9421, @PTEMPLATE+5, 0, 'Western Plaguelands - Group 5 - Truesilver Deposit / Small Thorium Vein', 0),
(21662, @PTEMPLATE+5, 0, 'Western Plaguelands - Group 5 - Truesilver Deposit / Small Thorium Vein', 0),
(9420, @PTEMPLATE+5, 0, 'Western Plaguelands - Group 5 - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_template` WHERE  `entry` IN (4268, 4269, 4270, 4271, 4272);

SET @PTEMPLATE = 4267;

DELETE FROM `pool_pool` WHERE `pool_id` IN (21659, 9422, 14432, 14431);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Western Plaguelands - Group 1' WHERE `entry` IN (21659, 9422, 14432, 14431);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Western Plaguelands - Group 1' WHERE `pool_entry` IN (21659, 9422, 14432, 14431);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Rich Thorium Vein - Western Plaguelands - Group 1 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(21659, @PTEMPLATE+1, 0, 'Western Plaguelands - Group 1 - Truesilver Deposit / Rich Thorium Vein', 0),
(9422, @PTEMPLATE+1, 0, 'Western Plaguelands - Group 1 - Truesilver Deposit / Rich Thorium Vein', 0),
(14432, @PTEMPLATE+1, 0, 'Western Plaguelands - Group 1 - Truesilver Deposit / Rich Thorium Vein', 0),
(14431, @PTEMPLATE+1, 0, 'Western Plaguelands - Group 1 - Truesilver Deposit / Rich Thorium Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (14433, 9423, 21658, 9424);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Western Plaguelands - Group 2' WHERE `entry` IN (14433, 9423, 21658, 9424);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Western Plaguelands - Group 2' WHERE `pool_entry` IN (14433, 9423, 21658, 9424);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Truesilver Deposit / Rich Thorium Vein - Western Plaguelands - Group 2 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(14433, @PTEMPLATE+2, 0, 'Western Plaguelands - Group 2 - Truesilver Deposit / Rich Thorium Vein', 0),
(9423, @PTEMPLATE+2, 0, 'Western Plaguelands - Group 2 - Truesilver Deposit / Rich Thorium Vein', 0),
(21658, @PTEMPLATE+2, 0, 'Western Plaguelands - Group 2 - Truesilver Deposit / Rich Thorium Vein', 0),
(9424, @PTEMPLATE+2, 0, 'Western Plaguelands - Group 2 - Truesilver Deposit / Rich Thorium Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (9425, 21661, 9426, 21660);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Western Plaguelands - Group 3' WHERE `entry` IN (9425, 21661, 9426, 21660);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Western Plaguelands - Group 3' WHERE `pool_entry` IN (9425, 21661, 9426, 21660);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Truesilver Deposit / Rich Thorium Vein - Western Plaguelands - Group 3 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(9425, @PTEMPLATE+3, 0, 'Western Plaguelands - Group 3 - Truesilver Deposit / Rich Thorium Vein', 0),
(21661, @PTEMPLATE+3, 0, 'Western Plaguelands - Group 3 - Truesilver Deposit / Rich Thorium Vein', 0),
(9426, @PTEMPLATE+3, 0, 'Western Plaguelands - Group 3 - Truesilver Deposit / Rich Thorium Vein', 0),
(21660, @PTEMPLATE+3, 0, 'Western Plaguelands - Group 3 - Truesilver Deposit / Rich Thorium Vein', 0);

DELETE FROM `pool_template` WHERE  `entry` IN (8138, 8120, 1262);

UPDATE `pool_template` SET `description`='Plaguebloom - Western Plaguelands - Group 1 - Master' WHERE `entry` = 3590;
UPDATE `pool_gameobject` SET `description`='Plaguebloom - Western Plaguelands - Group 1' WHERE `pool_entry` = 3590;

UPDATE `pool_template` SET `description`='Plaguebloom - Western Plaguelands - Group 2 - Master' WHERE `entry` = 3592;
UPDATE `pool_gameobject` SET `description`='Plaguebloom - Western Plaguelands - Group 2' WHERE `pool_entry` = 3592;

UPDATE `pool_template` SET `description`='Plaguebloom - Western Plaguelands - Group 3 - Master' WHERE `entry` = 3593;
UPDATE `pool_gameobject` SET `description`='Plaguebloom - Western Plaguelands - Group 3' WHERE `pool_entry` = 3593;

UPDATE `pool_template` SET `description`='Plaguebloom - Western Plaguelands - Group 4 - Master' WHERE `entry` = 3591;
UPDATE `pool_gameobject` SET `description`='Plaguebloom - Western Plaguelands - Group 4' WHERE `pool_entry` = 3591;

UPDATE `pool_template` SET `description`='Plaguebloom - Western Plaguelands - Group 5 - Master' WHERE `entry` = 3596;
UPDATE `pool_gameobject` SET `description`='Plaguebloom - Western Plaguelands - Group 5' WHERE `pool_entry` = 3596;

UPDATE `pool_template` SET `description`='Plaguebloom - Western Plaguelands - Group 6 - Master' WHERE `entry` = 3597;
UPDATE `pool_gameobject` SET `description`='Plaguebloom - Western Plaguelands - Group 6' WHERE `pool_entry` = 3597;

UPDATE `pool_template` SET `description`='Plaguebloom - Western Plaguelands - Group 7 - Master' WHERE `entry` = 3595;
UPDATE `pool_gameobject` SET `description`='Plaguebloom - Western Plaguelands - Group 7' WHERE `pool_entry` = 3595;

UPDATE `pool_template` SET `description`='Plaguebloom - Western Plaguelands - Group 8 - Master' WHERE `entry` = 3594;
UPDATE `pool_gameobject` SET `description`='Plaguebloom - Western Plaguelands - Group 8' WHERE `pool_entry` = 3594;

UPDATE `pool_template` SET `description`='Mountain Silversage - Western Plaguelands - Group 1 - Master' WHERE `entry` = 3612;
UPDATE `pool_gameobject` SET `description`='Mountain Silversage - Western Plaguelands - Group 1' WHERE `pool_entry` = 3612;

UPDATE `pool_template` SET `description`='Mountain Silversage - Western Plaguelands - Group 2 - Master' WHERE `entry` = 3613;
UPDATE `pool_gameobject` SET `description`='Mountain Silversage - Western Plaguelands - Group 2' WHERE `pool_entry` = 3613;


UPDATE `pool_template` SET `description`='Large Solid Chest (153463) / Large Mithril Bound Chest (153468) - Western Plaguelands - Group 1' WHERE  `entry` IN (39801, 39802, 39803);
UPDATE `pool_template` SET `description`='Large Solid Chest (153463) / Large Mithril Bound Chest (153468) - Western Plaguelands - Group 1 - Master' WHERE  `entry` = 39934;
UPDATE `pool_pool` SET `description`='Western Plaguelands - Group 1 - Large Solid Chest (153463) / Large Mithril Bound Chest (153468)' WHERE `pool_id` IN (39801, 39802, 39803);
UPDATE `pool_gameobject` SET `description`='Large Solid Chest (153463) / Large Mithril Bound Chest (153468) - Western Plaguelands - Group 1' WHERE `guid` IN (45486, 45493);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
