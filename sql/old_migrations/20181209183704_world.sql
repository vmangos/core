DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181209183704');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181209183704');
-- Add your query below.


-- White Kitten
DELETE FROM `creature_groups` WHERE `leader_guid` = 45501;
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES 
(45501, 45501, 0, 0, 1),
(45501, 53705, 2, 155, 1);
DELETE FROM creature WHERE guid = 53705 AND id = 7386;
INSERT INTO creature (guid, id, map, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecsmin, spawntimesecsmax, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
(53705, 7386, 0, 0, 0, -8650, 903.817, 98.421, 3.768, 180, 180, 0, 0, 64, 0, 0, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
