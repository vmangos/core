DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211101215420');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211101215420');
-- Add your query below.


-- Update Alterac Valley spawning
-- Stormpike Herald
UPDATE `creature` SET `position_x`=930.498, `position_y`=-520.755, `position_z`=93.7334, `orientation`=1.8326 WHERE `guid`=150154;
-- Lieutenant Spencer
UPDATE `creature` SET `position_x`=80.2742, `position_y`=-413.037, `position_z`=49.1795 `orientation`=1.85005 WHERE `guid`=150164;
-- Commander Karl Philips
UPDATE `creature` SET `position_x`=214.099, `position_y`=-373.896, `position_z`=56.4709 `orientation`=2.26893 WHERE `guid`=53226;
-- Lieutenant Greywand
UPDATE `creature` SET `position_x`=14.7054, `position_y`=-278.976, `position_z`=16.1597 `orientation`=6.10865 WHERE `guid`=53202;
-- Lieutenant Largent
UPDATE `creature` SET `position_x`=9.62153, `position_y`=-318.631, `position_z`=17.1601 `orientation`=6.14356 WHERE `guid`=53200;
-- Lieutenant Lewis
UPDATE `creature` SET `position_x`=-491.384, `position_y`=-176.36, `position_z`=57.5352 `orientation`=5.96903 WHERE `guid`=53111;
-- Lieutenant Vol'talar
UPDATE `creature` SET `position_x`=-498.928, `position_y`=-195.038, `position_z`=57.5484 `orientation`=6.14356 WHERE `guid`=53108;
-- Captain Galvangar
UPDATE `creature` SET `position_x`=-545.23, `position_y`=-165.35, `position_z`=57.7886 `orientation`=6.00393 WHERE `guid`=150145;
-- Commander Louis Philips
UPDATE `creature` SET `position_x`=-764.654, `position_y`=-355.085, `position_z`=90.8848 `orientation`=1.13446 WHERE `guid`=53115;
-- Lieutenant Rugba
UPDATE `creature` SET `position_x`=-637.599, `position_y`=-373.806, `position_z`=61.1606 `orientation`=5.8294 WHERE `guid`=53086;
-- Lieutenant Stronghoof
UPDATE `creature` SET `position_x`=-610.156, `position_y`=-404.244, `position_z`=60.2827 `orientation`=2.98451 WHERE `guid`=53107;
-- Commander Malgor
UPDATE `creature` SET `position_x`=-1090.32, `position_y`=-349.623, `position_z`=54.6447 `orientation`=0.0349066 WHERE `guid`=53113;
-- Commander Duffy
UPDATE `creature` SET `position_x`=672.408, `position_y`=-286.799, `position_z`=29.7551 `orientation`=3.61283 WHERE `guid`=53225;
-- Commander Randolph
UPDATE `creature` SET `position_x`=-159.406, `position_y`=-458.363, `position_z`=40.4791 `orientation`=1.25664 WHERE `guid`=53088;

-- Remove campfire from FW
DELETE FROM `gameobject` WHERE `guid` = 90151;

-- AV landmines should not be spawned past 1.8
-- Stormpine Landmine, custom spawned atm
UPDATE `gameobject` SET `patch_max` = 5 WHERE `id` = 179325;
-- Frostwolf Landmine, custom spawned atm
UPDATE `gameobject` SET `patch_max` = 5 WHERE `id` = 179324;
-- Stormpike Mine Layer shouldn't be spawned past 1.8, custom spawned atm
UPDATE `creature` SET `patch_max` = 5 WHERE `id` = 13356;
-- Frostwolf Mine Layer shouldn't be spawned past 1.8, custom spawned atm
UPDATE `creature` SET `patch_max`= 5 WHERE `id` = 13357;

-- Stormpike Explosive Expert shouldn't be spawned past 1.10, custom spawned atm
UPDATE `creature` SET `patch_max`= 7 WHERE `id` = 13598;
-- Frostwolf Explosive Expert shouldn't be spawned past 1.10, custom spawned atm
UPDATE `creature` SET `patch_max`= 7 WHERE `id` = 13597;

-- Patch 1.8: There is now a portcullis at the end of each of the entrance tunnels inside Alterac Valley. They will rise two minutes into the battle. 
UPDATE `gameobject` SET `patch_max` = 5 WHERE `id` = 180424;

-- Nuke prelease AV NPCs (I haven't even seen those on original AV PTR)
-- Stormpike Ranger
DELETE FROM `creature` WHERE `id` IN (13520, 13521, 13522, 13523);
-- Frostwolf Outrunner
DELETE FROM `creature` WHERE `id` IN (13516, 13519, 13518, 13517);

-- Alliance
-- Set mountainer max patch
UPDATE `creature` SET `patch_max`=8 WHERE `id` IN (12047,13325,13426,13335);
UPDATE `creature` SET `patch_max`=0 where `guid` = 190243;
-- Set sentinel max patch
UPDATE `creature` SET `patch_max`=8 WHERE `id` IN (12048,13327,13336,13427);

-- Horde
-- Set warrior max patch
UPDATE `creature` SET `patch_max`=8 WHERE `id` IN (12052,13330,13337,13428);

-- Trolls shouldn't be spawned after patch 1.10
UPDATE `creature` SET `patch_max`=8 WHERE `id` IN (10983,12157, 11679, 13956, 10983, 12156, 13958);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
