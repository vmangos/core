DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260330064037');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260330064037');
-- Add your query below.

SET @PTEMPLATE = 4599;

DELETE FROM `pool_pool` WHERE `pool_id` IN (4651, 4640, 4637, 4633, 4634);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands - Group 1' WHERE `entry` IN (4651, 4640, 4637, 4633, 4634);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands - Group 1' WHERE `pool_entry` IN (4651, 4640, 4637, 4633, 4634);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands - Group 1 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(4651, @PTEMPLATE+1, 0, 'Arathi Highlands - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4640, @PTEMPLATE+1, 0, 'Arathi Highlands - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4637, @PTEMPLATE+1, 0, 'Arathi Highlands - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4633, @PTEMPLATE+1, 0, 'Arathi Highlands - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4634, @PTEMPLATE+1, 0, 'Arathi Highlands - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (4644, 4645, 4646, 4629, 4628);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands - Group 2' WHERE `entry` IN (4644, 4645, 4646, 4629, 4628);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands - Group 2' WHERE `pool_entry` IN (4644, 4645, 4646, 4629, 4628);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands - Group 2 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(4644, @PTEMPLATE+2, 0, 'Arathi Highlands - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4645, @PTEMPLATE+2, 0, 'Arathi Highlands - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4646, @PTEMPLATE+2, 0, 'Arathi Highlands - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4629, @PTEMPLATE+2, 0, 'Arathi Highlands - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4628, @PTEMPLATE+2, 0, 'Arathi Highlands - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (4632, 4649, 4635, 4638, 4639);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands - Group 3' WHERE `entry` IN (4632, 4649, 4635, 4638, 4639);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands - Group 3' WHERE `pool_entry` IN (4632, 4649, 4635, 4638, 4639);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands - Group 3 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(4632, @PTEMPLATE+3, 0, 'Arathi Highlands - Group 3 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4649, @PTEMPLATE+3, 0, 'Arathi Highlands - Group 3 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4635, @PTEMPLATE+3, 0, 'Arathi Highlands - Group 3 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4638, @PTEMPLATE+3, 0, 'Arathi Highlands - Group 3 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4639, @PTEMPLATE+3, 0, 'Arathi Highlands - Group 3 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (4642, 4636, 4650, 4631, 4641);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands - Group 4' WHERE `entry` IN (4642, 4636, 4650, 4631, 4641);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands - Group 4' WHERE `pool_entry` IN (4642, 4636, 4650, 4631, 4641);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands - Group 4 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(4642, @PTEMPLATE+4, 0, 'Arathi Highlands - Group 4 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4636, @PTEMPLATE+4, 0, 'Arathi Highlands - Group 4 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4650, @PTEMPLATE+4, 0, 'Arathi Highlands - Group 4 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4631, @PTEMPLATE+4, 0, 'Arathi Highlands - Group 4 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4641, @PTEMPLATE+4, 0, 'Arathi Highlands - Group 4 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (4647, 4630, 4648, 4643);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands - Group 5' WHERE `entry` IN (4647, 4630, 4648, 4643);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands - Group 5' WHERE `pool_entry` IN (4647, 4630, 4648, 4643);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+5, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands - Group 5 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(4647, @PTEMPLATE+5, 0, 'Arathi Highlands - Group 5 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4630, @PTEMPLATE+5, 0, 'Arathi Highlands - Group 5 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4648, @PTEMPLATE+5, 0, 'Arathi Highlands - Group 5 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4643, @PTEMPLATE+5, 0, 'Arathi Highlands - Group 5 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (5330, 4655, 4653, 4652, 4658);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands - Group 6' WHERE `entry` IN (5330, 4655, 4653, 4652, 4658);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands - Group 6' WHERE `pool_entry` IN (5330, 4655, 4653, 4652, 4658);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+6, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands - Group 6 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(5330, @PTEMPLATE+6, 0, 'Arathi Highlands - Group 6 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4655, @PTEMPLATE+6, 0, 'Arathi Highlands - Group 6 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4653, @PTEMPLATE+6, 0, 'Arathi Highlands - Group 6 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4652, @PTEMPLATE+6, 0, 'Arathi Highlands - Group 6 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4658, @PTEMPLATE+6, 0, 'Arathi Highlands - Group 6 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (4656, 4657, 4659, 4654);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands - Group 7' WHERE `entry` IN (4656, 4657, 4659, 4654);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands - Group 7' WHERE `pool_entry` IN (4656, 4657, 4659, 4654);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+7, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands - Group 7 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(4656, @PTEMPLATE+7, 0, 'Arathi Highlands - Group 7 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4657, @PTEMPLATE+7, 0, 'Arathi Highlands - Group 7 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4659, @PTEMPLATE+7, 0, 'Arathi Highlands - Group 7 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4654, @PTEMPLATE+7, 0, 'Arathi Highlands - Group 7 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_template` WHERE  `entry` = 1358;

SET @PTEMPLATE = 4286;
DELETE FROM `gameobject` WHERE `guid` = 25333;
DELETE FROM `pool_template` WHERE `entry` = 298;
DELETE FROM `pool_gameobject` WHERE `pool_entry` = 298;

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Lesser Bloodstone Deposit - Arathi Highlands - Group 1 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(112801, @PTEMPLATE+1, 'Lesser Bloodstone Deposit - Arathi Highlands - Group 1'),
(25342, @PTEMPLATE+1, 'Lesser Bloodstone Deposit - Arathi Highlands - Group 1'),
(45341, @PTEMPLATE+1, 'Lesser Bloodstone Deposit - Arathi Highlands - Group 1');

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Lesser Bloodstone Deposit - Arathi Highlands - Group 2 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(25332, @PTEMPLATE+2, 'Lesser Bloodstone Deposit - Arathi Highlands - Group 2'),
(25337, @PTEMPLATE+2, 'Lesser Bloodstone Deposit - Arathi Highlands - Group 2'),
(112800, @PTEMPLATE+2, 'Lesser Bloodstone Deposit - Arathi Highlands - Group 2');

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Lesser Bloodstone Deposit - Arathi Highlands - Group 3 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(25335, @PTEMPLATE+3, 'Lesser Bloodstone Deposit - Arathi Highlands - Group 3'),
(112802, @PTEMPLATE+3, 'Lesser Bloodstone Deposit - Arathi Highlands - Group 3'),
(25338, @PTEMPLATE+3, 'Lesser Bloodstone Deposit - Arathi Highlands - Group 3');

UPDATE `pool_template` SET `max_limit`=1 WHERE  `entry`=146 AND `patch_min`=0 AND `patch_max`=10;
UPDATE `pool_template` SET `max_limit`=1 WHERE  `entry`=152 AND `patch_min`=0 AND `patch_max`=10;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
