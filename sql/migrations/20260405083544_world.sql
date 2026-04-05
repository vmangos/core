DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260405083544');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260405083544');
-- Add your query below.

SET @PTEMPLATE = 4691;

DELETE FROM `pool_pool` WHERE `pool_id` IN (21593, 17069, 17068, 21588, 21585, 17065);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows - Group 1' WHERE `entry` IN (21593, 17069, 17068, 21588, 21585, 17065);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows - Group 1' WHERE `pool_entry` IN (21593, 17069, 17068, 21588, 21585, 17065);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows - Group 1 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(21593, @PTEMPLATE+1, 0, 'Swamp of Sorrows - Group 1 - Silver Vein / Gold Vein / Iron Deposit', 0),
(17069, @PTEMPLATE+1, 0, 'Swamp of Sorrows - Group 1 - Silver Vein / Gold Vein / Iron Deposit', 0),
(17068, @PTEMPLATE+1, 0, 'Swamp of Sorrows - Group 1 - Silver Vein / Gold Vein / Iron Deposit', 0),
(21588, @PTEMPLATE+1, 0, 'Swamp of Sorrows - Group 1 - Silver Vein / Gold Vein / Iron Deposit', 0),
(21585, @PTEMPLATE+1, 0, 'Swamp of Sorrows - Group 1 - Silver Vein / Gold Vein / Iron Deposit', 0),
(17065, @PTEMPLATE+1, 0, 'Swamp of Sorrows - Group 1 - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (21592, 34919, 21587, 17067, 17066, 21586);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows - Group 2' WHERE `entry` IN (21592, 34919, 21587, 17067, 17066, 21586);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows - Group 2' WHERE `pool_entry` IN (21592, 34919, 21587, 17067, 17066, 21586);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows - Group 2 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(21592, @PTEMPLATE+2, 0, 'Swamp of Sorrows - Group 2 - Silver Vein / Gold Vein / Iron Deposit', 0),
(34919, @PTEMPLATE+2, 0, 'Swamp of Sorrows - Group 2 - Silver Vein / Gold Vein / Iron Deposit', 0),
(21587, @PTEMPLATE+2, 0, 'Swamp of Sorrows - Group 2 - Silver Vein / Gold Vein / Iron Deposit', 0),
(17067, @PTEMPLATE+2, 0, 'Swamp of Sorrows - Group 2 - Silver Vein / Gold Vein / Iron Deposit', 0),
(17066, @PTEMPLATE+2, 0, 'Swamp of Sorrows - Group 2 - Silver Vein / Gold Vein / Iron Deposit', 0),
(21586, @PTEMPLATE+2, 0, 'Swamp of Sorrows - Group 2 - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (21582, 21584, 21581, 21576, 21575, 21578);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows - Group 3' WHERE `entry` IN (21582, 21584, 21581, 21576, 21575, 21578);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows - Group 3' WHERE `pool_entry` IN (21582, 21584, 21581, 21576, 21575, 21578);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows - Group 3 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(21582, @PTEMPLATE+3, 0, 'Swamp of Sorrows - Group 3 - Silver Vein / Gold Vein / Iron Deposit', 0),
(21584, @PTEMPLATE+3, 0, 'Swamp of Sorrows - Group 3 - Silver Vein / Gold Vein / Iron Deposit', 0),
(21581, @PTEMPLATE+3, 0, 'Swamp of Sorrows - Group 3 - Silver Vein / Gold Vein / Iron Deposit', 0),
(21576, @PTEMPLATE+3, 0, 'Swamp of Sorrows - Group 3 - Silver Vein / Gold Vein / Iron Deposit', 0),
(21575, @PTEMPLATE+3, 0, 'Swamp of Sorrows - Group 3 - Silver Vein / Gold Vein / Iron Deposit', 0),
(21578, @PTEMPLATE+3, 0, 'Swamp of Sorrows - Group 3 - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (21577, 21590, 21571, 17049, 21573);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows - Group 4' WHERE `entry` IN (21577, 21590, 21571, 17049, 21573);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows - Group 4' WHERE `pool_entry` IN (21577, 21590, 21571, 17049, 21573);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 1, 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows - Group 4 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(21577, @PTEMPLATE+4, 0, 'Swamp of Sorrows - Group 4 - Silver Vein / Gold Vein / Iron Deposit', 0),
(21590, @PTEMPLATE+4, 0, 'Swamp of Sorrows - Group 4 - Silver Vein / Gold Vein / Iron Deposit', 0),
(21571, @PTEMPLATE+4, 0, 'Swamp of Sorrows - Group 4 - Silver Vein / Gold Vein / Iron Deposit', 0),
(17049, @PTEMPLATE+4, 0, 'Swamp of Sorrows - Group 4 - Silver Vein / Gold Vein / Iron Deposit', 0),
(21573, @PTEMPLATE+4, 0, 'Swamp of Sorrows - Group 4 - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (21583, 21591, 21579, 21580);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows - Group 5' WHERE `entry` IN (21583, 21591, 21579, 21580);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows - Group 5' WHERE `pool_entry` IN (21583, 21591, 21579, 21580);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+5, 1, 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows - Group 5 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(21583, @PTEMPLATE+5, 0, 'Swamp of Sorrows - Group 5 - Silver Vein / Gold Vein / Iron Deposit', 0),
(21591, @PTEMPLATE+5, 0, 'Swamp of Sorrows - Group 5 - Silver Vein / Gold Vein / Iron Deposit', 0),
(21579, @PTEMPLATE+5, 0, 'Swamp of Sorrows - Group 5 - Silver Vein / Gold Vein / Iron Deposit', 0),
(21580, @PTEMPLATE+5, 0, 'Swamp of Sorrows - Group 5 - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (17064, 21574, 21572, 17063);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows - Group 6' WHERE `entry` IN (17064, 21574, 21572, 17063);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows - Group 6' WHERE `pool_entry` IN (17064, 21574, 21572, 17063);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+6, 1, 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows - Group 6 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(17064, @PTEMPLATE+6, 0, 'Swamp of Sorrows - Group 6 - Silver Vein / Gold Vein / Iron Deposit', 0),
(21574, @PTEMPLATE+6, 0, 'Swamp of Sorrows - Group 6 - Silver Vein / Gold Vein / Iron Deposit', 0),
(21572, @PTEMPLATE+6, 0, 'Swamp of Sorrows - Group 6 - Silver Vein / Gold Vein / Iron Deposit', 0),
(17063, @PTEMPLATE+6, 0, 'Swamp of Sorrows - Group 6 - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_template` WHERE  `entry` = 1318;
UPDATE `pool_template` SET `max_limit`=1 WHERE  `entry`=8119 AND `patch_min`=0 AND `patch_max`=10;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
