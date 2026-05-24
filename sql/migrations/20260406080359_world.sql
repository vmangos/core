DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260406080359');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260406080359');
-- Add your query below.

UPDATE `pool_template` SET `description`='Plaguebloom - Eastern Plaguelands - Group 1 - Master' WHERE `entry` = 4072;
UPDATE `pool_gameobject` SET `description`='Plaguebloom - Eastern Plaguelands - Group 1' WHERE `pool_entry` = 4072;

UPDATE `pool_template` SET `description`='Plaguebloom - Eastern Plaguelands - Group 2 - Master' WHERE `entry` = 4069;
UPDATE `pool_gameobject` SET `description`='Plaguebloom - Eastern Plaguelands - Group 2' WHERE `pool_entry` = 4069;

UPDATE `pool_template` SET `description`='Plaguebloom - Eastern Plaguelands - Group 3 - Master' WHERE `entry` = 4079;
UPDATE `pool_gameobject` SET `description`='Plaguebloom - Eastern Plaguelands - Group 3' WHERE `pool_entry` = 4079;

UPDATE `pool_template` SET `description`='Plaguebloom - Eastern Plaguelands - Group 4 - Master' WHERE `entry` = 4068;
UPDATE `pool_gameobject` SET `description`='Plaguebloom - Eastern Plaguelands - Group 4' WHERE `pool_entry` = 4068;

UPDATE `pool_template` SET `description`='Plaguebloom - Eastern Plaguelands - Group 5 - Master' WHERE `entry` = 4077;
UPDATE `pool_gameobject` SET `description`='Plaguebloom - Eastern Plaguelands - Group 5' WHERE `pool_entry` = 4077;

UPDATE `pool_template` SET `description`='Plaguebloom - Eastern Plaguelands - Group 6 - Master' WHERE `entry` = 4078;
UPDATE `pool_gameobject` SET `description`='Plaguebloom - Eastern Plaguelands - Group 6' WHERE `pool_entry` = 4078;

UPDATE `pool_template` SET `description`='Plaguebloom - Eastern Plaguelands - Group 7 - Master' WHERE `entry` = 4070;
UPDATE `pool_gameobject` SET `description`='Plaguebloom - Eastern Plaguelands - Group 7' WHERE `pool_entry` = 4070;

UPDATE `pool_template` SET `description`='Plaguebloom - Eastern Plaguelands - Group 8 - Master' WHERE `entry` = 4080;
UPDATE `pool_gameobject` SET `description`='Plaguebloom - Eastern Plaguelands - Group 8' WHERE `pool_entry` = 4080;

UPDATE `pool_template` SET `description`='Plaguebloom - Eastern Plaguelands - Group 9 - Master' WHERE `entry` = 4071;
UPDATE `pool_gameobject` SET `description`='Plaguebloom - Eastern Plaguelands - Group 9' WHERE `pool_entry` = 4071;

UPDATE `pool_template` SET `description`='Plaguebloom - Eastern Plaguelands - Group 10 - Master' WHERE `entry` = 4073;
UPDATE `pool_gameobject` SET `description`='Plaguebloom - Eastern Plaguelands - Group 10' WHERE `pool_entry` = 4073;

UPDATE `pool_template` SET `description`='Plaguebloom - Eastern Plaguelands - Group 11 - Master' WHERE `entry` = 4074;
UPDATE `pool_gameobject` SET `description`='Plaguebloom - Eastern Plaguelands - Group 11' WHERE `pool_entry` = 4074;

UPDATE `pool_template` SET `description`='Plaguebloom - Eastern Plaguelands - Group 12 - Master' WHERE `entry` = 4075;
UPDATE `pool_gameobject` SET `description`='Plaguebloom - Eastern Plaguelands - Group 12' WHERE `pool_entry` = 4075;

UPDATE `pool_template` SET `description`='Plaguebloom - Eastern Plaguelands - Group 13 - Master' WHERE `entry` = 4063;
UPDATE `pool_gameobject` SET `description`='Plaguebloom - Eastern Plaguelands - Group 13' WHERE `pool_entry` = 4063;

UPDATE `pool_template` SET `description`='Plaguebloom - Eastern Plaguelands - Group 14 - Master' WHERE `entry` = 4076;
UPDATE `pool_gameobject` SET `description`='Plaguebloom - Eastern Plaguelands - Group 14' WHERE `pool_entry` = 4076;

UPDATE `pool_template` SET `description`='Plaguebloom - Eastern Plaguelands - Group 15 - Master' WHERE `entry` = 4066;
UPDATE `pool_gameobject` SET `description`='Plaguebloom - Eastern Plaguelands - Group 15' WHERE `pool_entry` = 4066;

UPDATE `pool_template` SET `description`='Plaguebloom - Eastern Plaguelands - Group 16 - Master' WHERE `entry` = 4067;
UPDATE `pool_gameobject` SET `description`='Plaguebloom - Eastern Plaguelands - Group 16' WHERE `pool_entry` = 4067;

UPDATE `pool_template` SET `description`='Plaguebloom - Eastern Plaguelands - Group 17 - Master' WHERE `entry` = 4064;
UPDATE `pool_gameobject` SET `description`='Plaguebloom - Eastern Plaguelands - Group 17' WHERE `pool_entry` = 4064;

UPDATE `pool_template` SET `description`='Plaguebloom - Eastern Plaguelands - Group 18 - Master' WHERE `entry` = 4065;
UPDATE `pool_gameobject` SET `description`='Plaguebloom - Eastern Plaguelands - Group 18' WHERE `pool_entry` = 4065;

UPDATE `pool_template` SET `description`='Grave Moss - Eastern Plaguelands - Group 1 - Master' WHERE `entry` = 106;

UPDATE `pool_template` SET `description`='Black Lotus - Eastern Plaguelands - Group 1 - Master' WHERE `entry` = 301;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
