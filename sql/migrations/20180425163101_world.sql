DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180425163101');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180425163101');
-- Add your query below.


-- Make doors in Twin Emperors room active objects.
UPDATE `gameobject` SET `spawnFlags`=1 WHERE `guid` IN (21783, 21784);

-- Delete custom teleport npc.
DELETE FROM `creature_template` WHERE `entry`=20008;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
