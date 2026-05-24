DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260330074507');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260330074507');
-- Add your query below.

SET @PTEMPLATE = 4606;

DELETE FROM `pool_pool` WHERE `pool_id` IN (2163, 2161, 2162, 2155);
UPDATE `pool_template` SET `description` = 'Tin Vein / Silver Vein - Arathi Highlands - Group 1' WHERE `entry` IN (2163, 2161, 2162, 2155);
UPDATE `pool_gameobject` SET `description` = 'Tin Vein / Silver Vein - Arathi Highlands - Group 1' WHERE `pool_entry` IN (2163, 2161, 2162, 2155);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Arathi Highlands - Group 1 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(2163, @PTEMPLATE+1, 0, 'Arathi Highlands - Group 1 - Tin Vein / Silver Vein', 0),
(2161, @PTEMPLATE+1, 0, 'Arathi Highlands - Group 1 - Tin Vein / Silver Vein', 0),
(2162, @PTEMPLATE+1, 0, 'Arathi Highlands - Group 1 - Tin Vein / Silver Vein', 0),
(2155, @PTEMPLATE+1, 0, 'Arathi Highlands - Group 1 - Tin Vein / Silver Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (2158, 2156, 2153, 2151, 2149, 7035);
UPDATE `pool_template` SET `description` = 'Tin Vein / Silver Vein - Arathi Highlands - Group 2' WHERE `entry` IN (2158, 2156, 2153, 2151, 2149, 7035);
UPDATE `pool_gameobject` SET `description` = 'Tin Vein / Silver Vein - Arathi Highlands - Group 2' WHERE `pool_entry` IN (2158, 2156, 2153, 2151, 2149, 7035);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Tin Vein / Silver Vein - Arathi Highlands - Group 2 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(2158, @PTEMPLATE+2, 0, 'Arathi Highlands - Group 2 - Tin Vein / Silver Vein', 0),
(2156, @PTEMPLATE+2, 0, 'Arathi Highlands - Group 2 - Tin Vein / Silver Vein', 0),
(2153, @PTEMPLATE+2, 0, 'Arathi Highlands - Group 2 - Tin Vein / Silver Vein', 0),
(2151, @PTEMPLATE+2, 0, 'Arathi Highlands - Group 2 - Tin Vein / Silver Vein', 0),
(2149, @PTEMPLATE+2, 0, 'Arathi Highlands - Group 2 - Tin Vein / Silver Vein', 0),
(7035, @PTEMPLATE+2, 0, 'Arathi Highlands - Group 2 - Tin Vein / Silver Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (7037, 2157, 2159, 2160);
UPDATE `pool_template` SET `description` = 'Tin Vein / Silver Vein - Arathi Highlands - Group 3' WHERE `entry` IN (7037, 2157, 2159, 2160);
UPDATE `pool_gameobject` SET `description` = 'Tin Vein / Silver Vein - Arathi Highlands - Group 3' WHERE `pool_entry` IN (7037, 2157, 2159, 2160);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Tin Vein / Silver Vein - Arathi Highlands - Group 3 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(7037, @PTEMPLATE+3, 0, 'Arathi Highlands - Group 3 - Tin Vein / Silver Vein', 0),
(2157, @PTEMPLATE+3, 0, 'Arathi Highlands - Group 3 - Tin Vein / Silver Vein', 0),
(2159, @PTEMPLATE+3, 0, 'Arathi Highlands - Group 3 - Tin Vein / Silver Vein', 0),
(2160, @PTEMPLATE+3, 0, 'Arathi Highlands - Group 3 - Tin Vein / Silver Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (2152, 2154, 7036, 2148, 2144);
UPDATE `pool_template` SET `description` = 'Tin Vein / Silver Vein - Arathi Highlands - Group 4' WHERE `entry` IN (2152, 2154, 7036, 2148, 2144);
UPDATE `pool_gameobject` SET `description` = 'Tin Vein / Silver Vein - Arathi Highlands - Group 4' WHERE `pool_entry` IN (2152, 2154, 7036, 2148, 2144);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 1, 'Tin Vein / Silver Vein - Arathi Highlands - Group 4 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(2152, @PTEMPLATE+4, 0, 'Arathi Highlands - Group 4 - Tin Vein / Silver Vein', 0),
(2154, @PTEMPLATE+4, 0, 'Arathi Highlands - Group 4 - Tin Vein / Silver Vein', 0),
(7036, @PTEMPLATE+4, 0, 'Arathi Highlands - Group 4 - Tin Vein / Silver Vein', 0),
(2148, @PTEMPLATE+4, 0, 'Arathi Highlands - Group 4 - Tin Vein / Silver Vein', 0),
(2144, @PTEMPLATE+4, 0, 'Arathi Highlands - Group 4 - Tin Vein / Silver Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (2145, 2150, 2147, 10010, 2141, 2140);
UPDATE `pool_template` SET `description` = 'Tin Vein / Silver Vein - Arathi Highlands - Group 5' WHERE `entry` IN (2145, 2150, 2147, 10010, 2141, 2140);
UPDATE `pool_gameobject` SET `description` = 'Tin Vein / Silver Vein - Arathi Highlands - Group 5' WHERE `pool_entry` IN (2145, 2150, 2147, 10010, 2141, 2140);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+5, 1, 'Tin Vein / Silver Vein - Arathi Highlands - Group 5 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(2145, @PTEMPLATE+5, 0, 'Arathi Highlands - Group 5 - Tin Vein / Silver Vein', 0),
(2150, @PTEMPLATE+5, 0, 'Arathi Highlands - Group 5 - Tin Vein / Silver Vein', 0),
(2147, @PTEMPLATE+5, 0, 'Arathi Highlands - Group 5 - Tin Vein / Silver Vein', 0),
(10010, @PTEMPLATE+5, 0, 'Arathi Highlands - Group 5 - Tin Vein / Silver Vein', 0),
(2141, @PTEMPLATE+5, 0, 'Arathi Highlands - Group 5 - Tin Vein / Silver Vein', 0),
(2140, @PTEMPLATE+5, 0, 'Arathi Highlands - Group 5 - Tin Vein / Silver Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (2143, 2142, 21664, 7034, 2146);
UPDATE `pool_template` SET `description` = 'Tin Vein / Silver Vein - Arathi Highlands - Group 6' WHERE `entry` IN (2143, 2142, 21664, 7034, 2146);
UPDATE `pool_gameobject` SET `description` = 'Tin Vein / Silver Vein - Arathi Highlands - Group 6' WHERE `pool_entry` IN (2143, 2142, 21664, 7034, 2146);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+6, 1, 'Tin Vein / Silver Vein - Arathi Highlands - Group 6 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(2143, @PTEMPLATE+6, 0, 'Arathi Highlands - Group 6 - Tin Vein / Silver Vein', 0),
(2142, @PTEMPLATE+6, 0, 'Arathi Highlands - Group 6 - Tin Vein / Silver Vein', 0),
(21664, @PTEMPLATE+6, 0, 'Arathi Highlands - Group 6 - Tin Vein / Silver Vein', 0),
(7034, @PTEMPLATE+6, 0, 'Arathi Highlands - Group 6 - Tin Vein / Silver Vein', 0),
(2146, @PTEMPLATE+6, 0, 'Arathi Highlands - Group 6 - Tin Vein / Silver Vein', 0);

DELETE FROM `pool_template` WHERE  `entry` = 406;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
