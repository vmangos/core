DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260526003322');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260526003322');
-- Add your query below.


-- Delete custom junk objects spawned deep in the sea of GM Island
-- Darkmoon Faire Signpost and DARKMOON FAIRE - Coming Soon!
DELETE FROM `gameobject` WHERE `guid` IN (255906, 255904);

-- Custom NPC spawn spawn ontop of Orgrimmar entrance wall
-- Spawn Point (Only GM can see it)
DELETE FROM `creature` WHERE `guid` = 300815;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
