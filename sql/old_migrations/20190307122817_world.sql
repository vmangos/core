DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190307122817');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190307122817');
-- Add your query below.


-- This creature should not be spawned.
DELETE FROM `creature` WHERE `guid`=86176;
DELETE FROM `creature_addon` WHERE `guid`=86176;

-- Add missing vendor Seersa Copperpinch.
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `MovementType`, `spawndist`) VALUES (58284, 13432, 1, -1274.94, 109.166, 129.298, 1.86951, 1480, 1690, 0, 0);
INSERT INTO `game_event_creature` VALUES (58284, 2);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES 
(13432, 17194, 0, 0),
(13432, 17195, 0, 0),
(13432, 17196, 0, 0),
(13432, 17200, 0, 0),
(13432, 17201, 0, 0),
(13432, 17202, 0, 0),
(13432, 17303, 0, 0),
(13432, 17304, 0, 0),
(13432, 17307, 0, 0),
(13432, 17344, 0, 0);

-- Fix respawn time of scourge invasion bosses.
UPDATE `creature` SET `spawntimesecsmin`=604800, `spawntimesecsmax`=604800 WHERE `guid` IN (2349, 2350, 2351, 2352, 2353, 2354);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
