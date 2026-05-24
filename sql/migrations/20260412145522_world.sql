DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260412145522');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260412145522');
-- Add your query below.

UPDATE `pool_template` SET `description`='Sungrass - Silithus - Group 1 - Master' WHERE `entry` = 3546;
UPDATE `pool_gameobject` SET `description`='Sungrass - Silithus - Group 1' WHERE `pool_entry` = 3546;

UPDATE `pool_template` SET `description`='Sungrass - Silithus - Group 2 - Master' WHERE `entry` = 3547;
UPDATE `pool_gameobject` SET `description`='Sungrass - Silithus - Group 2' WHERE `pool_entry` = 3547;

UPDATE `pool_template` SET `description`='Sungrass - Silithus - Group 3 - Master' WHERE `entry` = 3548;
UPDATE `pool_gameobject` SET `description`='Sungrass - Silithus - Group 3' WHERE `pool_entry` = 3548;

UPDATE `pool_template` SET `description`='Mountain Silversage - Silithus - Group 1 - Master' WHERE `entry` = 3991;
UPDATE `pool_gameobject` SET `description`='Mountain Silversage - Silithus - Group 1' WHERE `pool_entry` = 3991;

UPDATE `pool_template` SET `description`='Mountain Silversage - Silithus - Group 2 - Master' WHERE `entry` = 3992;
UPDATE `pool_gameobject` SET `description`='Mountain Silversage - Silithus - Group 2' WHERE `pool_entry` = 3992;

UPDATE `pool_template` SET `description`='Mountain Silversage - Silithus - Group 3 - Master' WHERE `entry` = 3993;
UPDATE `pool_gameobject` SET `description`='Mountain Silversage - Silithus - Group 3' WHERE `pool_entry` = 3993;

UPDATE `pool_template` SET `description`='Mountain Silversage - Silithus - Group 4 - Master' WHERE `entry` = 3994;
UPDATE `pool_gameobject` SET `description`='Mountain Silversage - Silithus - Group 4' WHERE `pool_entry` = 3994;

UPDATE `pool_template` SET `description`='Mountain Silversage - Silithus - Group 5 - Master' WHERE `entry` = 3995;
UPDATE `pool_gameobject` SET `description`='Mountain Silversage - Silithus - Group 5' WHERE `pool_entry` = 3995;

UPDATE `pool_template` SET `description`='Mountain Silversage - Silithus - Group 6 - Master' WHERE `entry` = 3996;
UPDATE `pool_gameobject` SET `description`='Mountain Silversage - Silithus - Group 6' WHERE `pool_entry` = 3996;

UPDATE `pool_template` SET `description`='Golden Sansam - Silithus - Group 1 - Master' WHERE `entry` = 3730;
UPDATE `pool_gameobject` SET `description`='Golden Sansam - Silithus - Group 1' WHERE `pool_entry` = 3730;

UPDATE `pool_template` SET `description`='Golden Sansam - Silithus - Group 2 - Master' WHERE `entry` = 3731;
UPDATE `pool_gameobject` SET `description`='Golden Sansam - Silithus - Group 2' WHERE `pool_entry` = 3731;

UPDATE `pool_template` SET `description`='Golden Sansam - Silithus - Group 3 - Master' WHERE `entry` = 3732;
UPDATE `pool_gameobject` SET `description`='Golden Sansam - Silithus - Group 3' WHERE `pool_entry` = 3732;

UPDATE `pool_template` SET `description`='Golden Sansam - Silithus - Group 4 - Master' WHERE `entry` = 3733;
UPDATE `pool_gameobject` SET `description`='Golden Sansam - Silithus - Group 4' WHERE `pool_entry` = 3733;

UPDATE `pool_template` SET `description`='Plaguebloom - Felwood - Group 1 - Master' WHERE `entry` = 3649;
UPDATE `pool_gameobject` SET `description`='Plaguebloom - Felwood - Group 1' WHERE `pool_entry` = 3649;

UPDATE `pool_template` SET `description`='Plaguebloom - Felwood - Group 2 - Master' WHERE `entry` = 3650;
UPDATE `pool_gameobject` SET `description`='Plaguebloom - Felwood - Group 2' WHERE `pool_entry` = 3650;

UPDATE `pool_template` SET `description`='Plaguebloom - Felwood - Group 3 - Master' WHERE `entry` = 3651;
UPDATE `pool_gameobject` SET `description`='Plaguebloom - Felwood - Group 3' WHERE `pool_entry` = 3651;

UPDATE `pool_template` SET `description`='Plaguebloom - Felwood - Group 4 - Master' WHERE `entry` = 3652;
UPDATE `pool_gameobject` SET `description`='Plaguebloom - Felwood - Group 4' WHERE `pool_entry` = 3652;

UPDATE `pool_template` SET `description`='Plaguebloom - Felwood - Group 5 - Master' WHERE `entry` = 3653;
UPDATE `pool_gameobject` SET `description`='Plaguebloom - Felwood - Group 5' WHERE `pool_entry` = 3653;

UPDATE `pool_template` SET `description`='Plaguebloom - Felwood - Group 6 - Master' WHERE `entry` = 3654;
UPDATE `pool_gameobject` SET `description`='Plaguebloom - Felwood - Group 6' WHERE `pool_entry` = 3654;

UPDATE `pool_template` SET `description`='Plaguebloom - Felwood - Group 7 - Master' WHERE `entry` = 3655;
UPDATE `pool_gameobject` SET `description`='Plaguebloom - Felwood - Group 7' WHERE `pool_entry` = 3655;

UPDATE `pool_template` SET `description`='Plaguebloom - Felwood - Group 8 - Master' WHERE `entry` = 3656;
UPDATE `pool_gameobject` SET `description`='Plaguebloom - Felwood - Group 8' WHERE `pool_entry` = 3656;

UPDATE `pool_template` SET `description`='Gromsblood - Ashenvale - Group 1 - Master' WHERE `entry` = 1764;
UPDATE `pool_gameobject` SET `description`='Gromsblood - Ashenvale - Group 1' WHERE `pool_entry` = 1764;

UPDATE `pool_template` SET `description`='Gromsblood - Ashenvale - Group 2 - Master' WHERE `entry` = 1765;
UPDATE `pool_gameobject` SET `description`='Gromsblood - Ashenvale - Group 2' WHERE `pool_entry` = 1765;

UPDATE `pool_template` SET `description`='Ghost Mushroom - Hinterlands - Group 1 - Master' WHERE `entry` = 4089;
UPDATE `pool_gameobject` SET `description`='Ghost Mushroom - Hinterlands - Group 1' WHERE `pool_entry` = 4089;

UPDATE `pool_template` SET `description`='Ghost Mushroom - Hinterlands - Group 2 - Master' WHERE `entry` = 4090;
UPDATE `pool_gameobject` SET `description`='Ghost Mushroom - Hinterlands - Group 2' WHERE `pool_entry` = 4090;

UPDATE `pool_template` SET `description`='Ghost Mushroom - Hinterlands - Group 3 - Master' WHERE `entry` = 4091;
UPDATE `pool_gameobject` SET `description`='Ghost Mushroom - Hinterlands - Group 3' WHERE `pool_entry` = 4091;

UPDATE `pool_template` SET `description`='Ghost Mushroom - Hinterlands - Group 4 - Master' WHERE `entry` = 4092;
UPDATE `pool_gameobject` SET `description`='Ghost Mushroom - Hinterlands - Group 4' WHERE `pool_entry` = 4092;

UPDATE `pool_template` SET `description`='Ghost Mushroom - Hinterlands - Group 5 - Master' WHERE `entry` = 4093;
UPDATE `pool_gameobject` SET `description`='Ghost Mushroom - Hinterlands - Group 5' WHERE `pool_entry` = 4093;

UPDATE `pool_template` SET `description`='Ghost Mushroom - Hinterlands - Group 6 - Master' WHERE `entry` = 4094;
UPDATE `pool_gameobject` SET `description`='Ghost Mushroom - Hinterlands - Group 6' WHERE `pool_entry` = 4094;

UPDATE `pool_template` SET `description`='Ghost Mushroom - Hinterlands - Group 7 - Master' WHERE `entry` = 4095;
UPDATE `pool_gameobject` SET `description`='Ghost Mushroom - Hinterlands - Group 7' WHERE `pool_entry` = 4095;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
