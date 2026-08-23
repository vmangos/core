DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260823080903');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260823080903');
-- Add your query below.

-- Pool Badlands Mithril

SET @PTEMPLATE = 5157;
DELETE FROM `pool_pool` WHERE `pool_id` IN (5552, 5548, 5547, 5545);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands - Group 2' WHERE `entry` IN (5552, 5548, 5547, 5545);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands - Group 2' WHERE `pool_entry` IN (5552, 5548, 5547, 5545);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands - Group 2 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(5552, @PTEMPLATE+2, 0, 'Badlands - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5548, @PTEMPLATE+2, 0, 'Badlands - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5547, @PTEMPLATE+2, 0, 'Badlands - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5545, @PTEMPLATE+2, 0, 'Badlands - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DELETE FROM `pool_pool` WHERE `pool_id` IN (5531, 5546, 5539, 5533, 5541, 5549);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands - Group 3' WHERE `entry` IN (5531, 5546, 5539, 5533, 5541, 5549);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands - Group 3' WHERE `pool_entry` IN (5531, 5546, 5539, 5533, 5541, 5549);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands - Group 3 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(5531, @PTEMPLATE+3, 0, 'Badlands - Group 3 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5546, @PTEMPLATE+3, 0, 'Badlands - Group 3 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5539, @PTEMPLATE+3, 0, 'Badlands - Group 3 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5533, @PTEMPLATE+3, 0, 'Badlands - Group 3 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5541, @PTEMPLATE+3, 0, 'Badlands - Group 3 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5549, @PTEMPLATE+3, 0, 'Badlands - Group 3 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DELETE FROM `pool_pool` WHERE `pool_id` IN (5524, 5519, 5513, 5504);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands - Group 4' WHERE `entry` IN (5524, 5519, 5513, 5504);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands - Group 4' WHERE `pool_entry` IN (5524, 5519, 5513, 5504);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands - Group 4 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(5524, @PTEMPLATE+4, 0, 'Badlands - Group 4 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5519, @PTEMPLATE+4, 0, 'Badlands - Group 4 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5513, @PTEMPLATE+4, 0, 'Badlands - Group 4 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5504, @PTEMPLATE+4, 0, 'Badlands - Group 4 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DELETE FROM `pool_pool` WHERE `pool_id` IN (5522, 5515, 5528, 5520);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands - Group 5' WHERE `entry` IN (5522, 5515, 5528, 5520);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands - Group 5' WHERE `pool_entry` IN (5522, 5515, 5528, 5520);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+5, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands - Group 5 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(5522, @PTEMPLATE+5, 0, 'Badlands - Group 5 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5515, @PTEMPLATE+5, 0, 'Badlands - Group 5 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5528, @PTEMPLATE+5, 0, 'Badlands - Group 5 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5520, @PTEMPLATE+5, 0, 'Badlands - Group 5 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DELETE FROM `pool_pool` WHERE `pool_id` IN (5521, 5518, 5510, 5505, 5525);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands - Group 6' WHERE `entry` IN (5521, 5518, 5510, 5505, 5525);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands - Group 6' WHERE `pool_entry` IN (5521, 5518, 5510, 5505, 5525);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+6, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands - Group 6 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(5521, @PTEMPLATE+6, 0, 'Badlands - Group 6 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5518, @PTEMPLATE+6, 0, 'Badlands - Group 6 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5510, @PTEMPLATE+6, 0, 'Badlands - Group 6 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5505, @PTEMPLATE+6, 0, 'Badlands - Group 6 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5525, @PTEMPLATE+6, 0, 'Badlands - Group 6 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DELETE FROM `pool_pool` WHERE `pool_id` IN (5502, 5506, 5509, 5507);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands - Group 7' WHERE `entry` IN (5502, 5506, 5509, 5507);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands - Group 7' WHERE `pool_entry` IN (5502, 5506, 5509, 5507);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+7, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands - Group 7 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(5502, @PTEMPLATE+7, 0, 'Badlands - Group 7 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5506, @PTEMPLATE+7, 0, 'Badlands - Group 7 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5509, @PTEMPLATE+7, 0, 'Badlands - Group 7 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5507, @PTEMPLATE+7, 0, 'Badlands - Group 7 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DELETE FROM `pool_pool` WHERE `pool_id` IN (5501, 5503, 5508, 5511);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands - Group 8' WHERE `entry` IN (5501, 5503, 5508, 5511);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands - Group 8' WHERE `pool_entry` IN (5501, 5503, 5508, 5511);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+8, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands - Group 8 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(5501, @PTEMPLATE+8, 0, 'Badlands - Group 8 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5503, @PTEMPLATE+8, 0, 'Badlands - Group 8 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5508, @PTEMPLATE+8, 0, 'Badlands - Group 8 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5511, @PTEMPLATE+8, 0, 'Badlands - Group 8 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DELETE FROM `pool_pool` WHERE `pool_id` IN (5538, 5523, 5526, 5532, 5535);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands - Group 9' WHERE `entry` IN (5538, 5523, 5526, 5532, 5535);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands - Group 9' WHERE `pool_entry` IN (5538, 5523, 5526, 5532, 5535);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+9, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands - Group 9 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(5538, @PTEMPLATE+9, 0, 'Badlands - Group 9 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5523, @PTEMPLATE+9, 0, 'Badlands - Group 9 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5526, @PTEMPLATE+9, 0, 'Badlands - Group 9 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5532, @PTEMPLATE+9, 0, 'Badlands - Group 9 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5535, @PTEMPLATE+9, 0, 'Badlands - Group 9 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DELETE FROM `pool_pool` WHERE `pool_id` IN (5516, 5514, 5517, 5512);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands - Group 10' WHERE `entry` IN (5516, 5514, 5517, 5512);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands - Group 10' WHERE `pool_entry` IN (5516, 5514, 5517, 5512);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+10, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands - Group 10 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(5516, @PTEMPLATE+10, 0, 'Badlands - Group 10 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5514, @PTEMPLATE+10, 0, 'Badlands - Group 10 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5517, @PTEMPLATE+10, 0, 'Badlands - Group 10 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5512, @PTEMPLATE+10, 0, 'Badlands - Group 10 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DELETE FROM `pool_pool` WHERE `pool_id` IN (5527, 5529, 5530, 5534);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands - Group 11' WHERE `entry` IN (5527, 5529, 5530, 5534);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands - Group 11' WHERE `pool_entry` IN (5527, 5529, 5530, 5534);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+11, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands - Group 11 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(5527, @PTEMPLATE+11, 0, 'Badlands - Group 11 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5529, @PTEMPLATE+11, 0, 'Badlands - Group 11 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5530, @PTEMPLATE+11, 0, 'Badlands - Group 11 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5534, @PTEMPLATE+11, 0, 'Badlands - Group 11 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DELETE FROM `pool_pool` WHERE `pool_id` IN (5537, 5536, 5540, 5543);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands - Group 12' WHERE `entry` IN (5537, 5536, 5540, 5543);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands - Group 12' WHERE `pool_entry` IN (5537, 5536, 5540, 5543);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+12, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands - Group 12 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(5537, @PTEMPLATE+12, 0, 'Badlands - Group 12 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5536, @PTEMPLATE+12, 0, 'Badlands - Group 12 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5540, @PTEMPLATE+12, 0, 'Badlands - Group 12 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5543, @PTEMPLATE+12, 0, 'Badlands - Group 12 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DELETE FROM `pool_pool` WHERE `pool_id` IN (5542, 5544, 5551, 5550);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands - Group 13' WHERE `entry` IN (5542, 5544, 5551, 5550);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands - Group 13' WHERE `pool_entry` IN (5542, 5544, 5551, 5550);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+13, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands - Group 13 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(5542, @PTEMPLATE+13, 0, 'Badlands - Group 13 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5544, @PTEMPLATE+13, 0, 'Badlands - Group 13 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5551, @PTEMPLATE+13, 0, 'Badlands - Group 13 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5550, @PTEMPLATE+13, 0, 'Badlands - Group 13 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DELETE FROM `pool_template` WHERE  `entry` IN (1288, 8109);

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
