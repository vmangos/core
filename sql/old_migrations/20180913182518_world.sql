DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180913182518');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180913182518');
-- Add your query below.


-- Add Technician in Firemaw room's left alcove group to pull with the rest of the group.
INSERT INTO `creature_groups` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `flags`) VALUES (84558, 84570, 0, 0, 46);

-- Correct Rock Elemental snare/root immunity.
UPDATE `creature_template` SET `MechanicImmuneMask`=646015775 WHERE `entry`=92;

-- Fix spawn position of Bruiseweed.
UPDATE `gameobject` SET `position_z`=3.727536 WHERE `guid`=3440;

-- Kurinnaxx aggro range should be about 50 yards.
-- https://www.youtube.com/watch?v=Y-ACkUA-Q3w
UPDATE `creature_template` SET `Detection`=50 WHERE `entry`=15348;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
