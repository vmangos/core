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

-- remove quest the reason for the season (7062) from courier hammerfall (10877)
DELETE FROM `creature_questrelation` WHERE `quest` = 7062 AND `id` = 10877;

-- add light leather bracers and embossed leather pants to Gretta Finespindle
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`, `build_min`, `build_max`) VALUES
(1466, 9066, 450, 165, 70, 0, 0, 5875),
(1466, 3786, 500, 165, 75, 0, 0, 5875);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
