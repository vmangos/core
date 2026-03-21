DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260319203329');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260319203329');
-- Add your query below.

SET @PTEMPLATE = 4267;

DELETE FROM `pool_pool` WHERE `pool_id` IN (25480, 25469, 25473, 25472, 9417);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands - Group 1' WHERE `entry` IN (25480, 25469, 25473, 25472, 9417);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands - Group 1' WHERE `pool_entry` IN (25480, 25469, 25473, 25472, 9417);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Western Plaguelands - Group 1 - Truesilver Deposit / Small Thorium Vein', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(25480, @PTEMPLATE+1, 0, 'Western Plaguelands - Group 1 - Truesilver Deposit / Small Thorium Vein', 0),
(25469, @PTEMPLATE+1, 0, 'Western Plaguelands - Group 1 - Truesilver Deposit / Small Thorium Vein', 0),
(25473, @PTEMPLATE+1, 0, 'Western Plaguelands - Group 1 - Truesilver Deposit / Small Thorium Vein', 0),
(25472, @PTEMPLATE+1, 0, 'Western Plaguelands - Group 1 - Truesilver Deposit / Small Thorium Vein', 0),
(9417, @PTEMPLATE+1, 0, 'Western Plaguelands - Group 1 - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (25482, 25486, 9418, 25476, 25475);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands - Group 2' WHERE `entry` IN (25482, 25486, 9418, 25476, 25475);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands - Group 2' WHERE `pool_entry` IN (25482, 25486, 9418, 25476, 25475);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Western Plaguelands - Group 2 - Truesilver Deposit / Small Thorium Vein', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(25482, @PTEMPLATE+2, 0, 'Western Plaguelands - Group 2 - Truesilver Deposit / Small Thorium Vein', 0),
(25486, @PTEMPLATE+2, 0, 'Western Plaguelands - Group 2 - Truesilver Deposit / Small Thorium Vein', 0),
(9418, @PTEMPLATE+2, 0, 'Western Plaguelands - Group 2 - Truesilver Deposit / Small Thorium Vein', 0),
(25476, @PTEMPLATE+2, 0, 'Western Plaguelands - Group 2 - Truesilver Deposit / Small Thorium Vein', 0),
(25475, @PTEMPLATE+2, 0, 'Western Plaguelands - Group 2 - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (25470, 25479, 25487, 25481, 14428, 25484);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands - Group 3' WHERE `entry` IN (25470, 25479, 25487, 25481, 14428, 25484);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands - Group 3' WHERE `pool_entry` IN (25470, 25479, 25487, 25481, 14428, 25484);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Western Plaguelands - Group 3 - Truesilver Deposit / Small Thorium Vein', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(25470, @PTEMPLATE+3, 0, 'Western Plaguelands - Group 3 - Truesilver Deposit / Small Thorium Vein', 0),
(25479, @PTEMPLATE+3, 0, 'Western Plaguelands - Group 3 - Truesilver Deposit / Small Thorium Vein', 0),
(25487, @PTEMPLATE+3, 0, 'Western Plaguelands - Group 3 - Truesilver Deposit / Small Thorium Vein', 0),
(25481, @PTEMPLATE+3, 0, 'Western Plaguelands - Group 3 - Truesilver Deposit / Small Thorium Vein', 0),
(14428, @PTEMPLATE+3, 0, 'Western Plaguelands - Group 3 - Truesilver Deposit / Small Thorium Vein', 0),
(25484, @PTEMPLATE+3, 0, 'Western Plaguelands - Group 3 - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (25474, 14429, 25471, 25478, 25483, 25477);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands - Group 4' WHERE `entry` IN (25474, 14429, 25471, 25478, 25483, 25477);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands - Group 4' WHERE `pool_entry` IN (25474, 14429, 25471, 25478, 25483, 25477);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 1, 'Western Plaguelands - Group 4 - Truesilver Deposit / Small Thorium Vein', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(25474, @PTEMPLATE+4, 0, 'Western Plaguelands - Group 4 - Truesilver Deposit / Small Thorium Vein', 0),
(14429, @PTEMPLATE+4, 0, 'Western Plaguelands - Group 4 - Truesilver Deposit / Small Thorium Vein', 0),
(25471, @PTEMPLATE+4, 0, 'Western Plaguelands - Group 4 - Truesilver Deposit / Small Thorium Vein', 0),
(25478, @PTEMPLATE+4, 0, 'Western Plaguelands - Group 4 - Truesilver Deposit / Small Thorium Vein', 0),
(25483, @PTEMPLATE+4, 0, 'Western Plaguelands - Group 4 - Truesilver Deposit / Small Thorium Vein', 0),
(25477, @PTEMPLATE+4, 0, 'Western Plaguelands - Group 4 - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (9419, 23011, 9420, 9421, 21662);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands - Group 5' WHERE `entry` IN (9419, 23011, 9420, 9421, 21662);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands - Group 5' WHERE `pool_entry` IN (9419, 23011, 9420, 9421, 21662);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+5, 1, 'Western Plaguelands - Group 5 - Truesilver Deposit / Small Thorium Vein', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(9419, @PTEMPLATE+5, 0, 'Western Plaguelands - Group 5 - Truesilver Deposit / Small Thorium Vein', 0),
(23011, @PTEMPLATE+5, 0, 'Western Plaguelands - Group 5 - Truesilver Deposit / Small Thorium Vein', 0),
(9420, @PTEMPLATE+5, 0, 'Western Plaguelands - Group 5 - Truesilver Deposit / Small Thorium Vein', 0),
(9421, @PTEMPLATE+5, 0, 'Western Plaguelands - Group 5 - Truesilver Deposit / Small Thorium Vein', 0),
(21662, @PTEMPLATE+5, 0, 'Western Plaguelands - Group 5 - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` = 25485;
DELETE FROM `pool_gameobject` WHERE `guid` IN (261416, 261435);
DELETE FROM `gameobject` WHERE `guid` IN (261416, 261435);
DELETE FROM `pool_template` WHERE  `entry` IN (1331, 8121, 25485);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
