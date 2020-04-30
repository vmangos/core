DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200426205604');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200426205604');
-- Add your query below.


-- remove unused event game object in ironforge
DELETE FROM `gameobject` WHERE `guid` IN (4771, 5051);

-- add correct position for objects inside deeprun tram.
UPDATE `gameobject` SET `position_z` = -4.3 WHERE `guid` IN (20738, 20739, 20740);

-- update correct greeting for springspindle fizzlegear
UPDATE `npc_text` SET `BroadcastTextID0` = 7851 WHERE `ID` = 4732;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
