DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240505202342');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240505202342');
-- Add your query below.


-- Delete Wooden Bench on 2nd floor in GM Island
DELETE FROM `gameobject` WHERE `guid`=240937;
-- Delete Mailbox on 2nd floor in GM Island
DELETE FROM `gameobject` WHERE `guid`=3996125;
-- Delete Throne spawned in uninstanced BWL
DELETE FROM `gameobject` WHERE `guid`=3996089;
-- Delete invisible object House 2 in old Quel'Thalas area
DELETE FROM `gameobject` WHERE `guid`=3996095;
-- Delete "Love is in the Air" objects in old Quel'Thalas area
DELETE FROM `gameobject` WHERE `guid`=3996106;
DELETE FROM `gameobject` WHERE `guid`=3996109;
-- Delete custom Horde Mailbox at the house in GM Island
DELETE FROM `gameobject` WHERE `guid`=314065;
-- Delete Wine bottles in GM Island
DELETE FROM `gameobject` WHERE `guid`=399536;
DELETE FROM `gameobject` WHERE `guid`=399537;
DELETE FROM `gameobject` WHERE `guid`=399538;
DELETE FROM `gameobject` WHERE `guid`=399539;
DELETE FROM `gameobject` WHERE `guid`=399540;

-- Delete Hawk Owls with waypoints on the roof of GM Island
DELETE FROM `creature` WHERE `guid`=301269;
DELETE FROM `creature` WHERE `guid`=301268;
DELETE FROM `creature_movement` WHERE `id`=301269;
DELETE FROM `creature_movement` WHERE `id`=301268;
-- Delete Wild Buck with waypoints on the roof of GM Island
DELETE FROM `creature` WHERE `guid`=301267;
DELETE FROM `creature_movement` WHERE `id`=301267;
-- Delete Emerald Dragon Whelp with wayppoints on the mountain of GM Island
DELETE FROM `creature` WHERE `guid`=301270;
DELETE FROM `creature_movement` WHERE `id`=301270;
-- Delete Huge Toad with waypoints on the dock of GM Island
DELETE FROM `creature` WHERE `guid`=301266;
DELETE FROM `creature_movement` WHERE `id`=301266;
-- Delete Rabbits on GM Island
DELETE FROM `creature` WHERE `guid`=301769;
DELETE FROM `creature` WHERE `guid`=301768;
DELETE FROM `creature` WHERE `guid`=301767;

-- Replace custom Alliance Mailbox at the house in GM Island to use entry that is all faction
UPDATE `gameobject` SET `id`=144570 WHERE `guid`=230922;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
