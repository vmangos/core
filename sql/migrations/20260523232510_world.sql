DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260523232510');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260523232510');
-- Add your query below.


-- Sniffed Sulhasa position from wowemu, previous was handspawned by wowemu
UPDATE `creature` SET `position_x` = -6353.49, `position_y` = -249.848, `position_z` = -1.88865, `orientation` = 4.31096 WHERE `guid` = 18;

-- Sniffed Shaethis Darkoak position from wowemu, previous was handspawned by wowemu
UPDATE `creature` SET `position_x` = -6422.37, `position_y` = -319.64, `position_z` = -0.942892, `orientation` = 4.90438 WHERE `guid` = 14;

-- Pre naxx location NPC spawn should also be able to be human, from wowemu
UPDATE `creature` SET `id2` = 8547 WHERE `guid` = 151317;

-- Fix patch of chest at pre naxx location (originally from the 1.8 sniffs)
-- Solid Chest
UPDATE `gameobject` SET `patch_max` = 8 WHERE `guid` = 1034;

-- Old sniffed Chylina position, previous was handspawned by wowemu
UPDATE `creature` SET `position_x` = 2734.87, `position_y` = 1489.96, `position_z` = 237.593, `orientation` = 3.12414 WHERE `guid` = 32325;

-- Old sniffed Augustus the Touched position, previous was handspawned
UPDATE `creature` SET `position_x` = 2967.87, `position_y` = -2672.94, `position_z` = 99.0947, `orientation` = 6.16101 WHERE `guid` = 300233;

-- Sniffed Varian Wrynn position, previous was handspawned
UPDATE `creature` SET `position_x` = -2714.4, `position_y` = -4999.92, `position_z` = 7.16222, `orientation` = 4.76475 WHERE `guid` = 30879;

-- All pre 1.4 mount trainer location has custom spawns and wrong entries
-- Sen'jin has correct postions but wrong entries
-- Correct entry for Ivory Raptor in Sen'jin is 12348, from wowemu
UPDATE `creature` SET `id` = 12348 WHERE `guid` = 6405;
-- Correct enytry for Mottled Raptor in Sen'jin is 12345, from wowemu
UPDATE `creature` SET `id` = 12345 WHERE `guid` = 6404;

-- The old Dun morogh rams have wrong entries and wrong positions:
-- From wowemu, matches image from vanilla:
UPDATE `creature` SET `id` = 12370, `position_x` = -5531.01, `position_y` = -1358.63, `position_z` = 398.819, `orientation` = 1.7709, `wander_distance` = 2.0, `movement_type` = 1 WHERE `guid` = 4156;
UPDATE `creature` SET `id` = 12371, `position_x` = -5535.82, `position_y` = -1337.64, `position_z` = 398.894, `orientation` = 5.48232, `wander_distance` = 2.0, `movement_type` = 1 WHERE `guid` = 4155;
-- The rams should be max level 2 according to Allakhazam
UPDATE `creature_template` SET `level_max` = 2 WHERE `entry` = 12370;
UPDATE `creature_template` SET `level_max` = 2 WHERE `entry` = 12371;
-- Riding Tiger (White) should be Riding Nightsaber
UPDATE `creature` SET `id` = 12361 WHERE `guid` = 49183;
-- For some reason had display_scale1 = 1 in DB while all others had 0
UPDATE `creature_template` SET `display_scale1` = 0 WHERE `entry` = 12361;
-- Should have max level 2 according to Allakhazam
UPDATE `creature_template` SET `display_scale1` = 0, `level_max` = 2 WHERE `entry` = 12361;

-- Riding Tiger (Black) should be Riding Frostsaber
UPDATE `creature` SET `id` = 12362 WHERE `guid` = 48577;
-- Should have max level 2 according to Allakhazam
UPDATE `creature_template` SET `display_scale1` = 0, `level_max` = 2 WHERE `entry` = 12362;

-- Riding Stripped Nightsaber had diffrent spawn in pre 1.4
-- Used to have the same location Riding Striped Frostsaber uses post 1.4
UPDATE `creature` SET `patch_min` = 2 WHERE `guid` = 46332;
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (217037, 12360, 0, 0, 0, 0, 1, 10132.7, 2526.33, 1325.56, 3.63028, 300, 300, 0.0, 100.0, 100.0, 0, 0, 0.0, 0, 1);
INSERT INTO creature_addon
(guid, patch, display_id, mount_display_id, equipment_id, stand_state, sheath_state, emote_state, auras)
VALUES(217037, 0, 0, -1, -1, 3, 1, 0, NULL);

-- Riding Spotted Frostsaber had diffrent spawn in pre 1.4
-- Used to have the same location that Swift Stormsaber uses post 1.4:
UPDATE `creature` SET `patch_min` = 2 WHERE `guid` = 46327;
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (217038, 12359, 0, 0, 0, 0, 1, 10132.9, 2527.95, 1325.16, 4.01426, 300, 300, 0.0, 100.0, 0.0, 0, 0, 0.0, 0, 1);
INSERT INTO creature_addon
(guid, patch, display_id, mount_display_id, equipment_id, stand_state, sheath_state, emote_state, auras)
VALUES(217038, 0, 0, -1, -1, 3, 1, 0, NULL);

-- Riding Striped Frostsaber had diffrent spawn in pre 1.4
-- Used to have the same location that Riding Spotted Frostsaber uses post 1.4:
UPDATE `creature` SET `patch_min` = 2 WHERE `guid` = 46321;
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (217039, 12358, 0, 0, 0, 0, 1, 10127.7, 2521.29, 1326.04, 1.8675, 300, 300, 0.0, 100.0, 100.0, 0, 0, 0.0, 0, 1);
INSERT INTO creature_addon
(guid, patch, display_id, mount_display_id, equipment_id, stand_state, sheath_state, emote_state, auras)
VALUES(217039, 0, 0, -1, -1, 3, 1, 0, NULL);

-- Sniffed old AQ gong:
-- Ahn'Qiraj Gong
UPDATE `gameobject` SET `position_x` = -8067.785, `position_y` = 1568.161, `position_z` = 8.034219, `orientation` = 1.265365, `rotation0` = 0, `rotation1` = 0, `rotation2` = 0.59131, `rotation3` = 0.806445 WHERE `guid` = 66333;

-- Revantusk Village was added in patch 1.5, some objects were missing patch_min:
-- Call to Arms!, Forge, Anvil, Campfire, Pupellyverbos Port, Troll Drum Sound Object
UPDATE `gameobject` SET `patch_min` = 3 WHERE `guid` IN (46197, 46082, 46052, 46050, 46051, 46348, 46214, 46314);
-- Riding Raptor:
UPDATE `creature` SET `patch_min` = 3 WHERE `guid` = 92890;
-- Missing campfire in pre 1.5, note this was found in 1.8 sniffs so this is an object blizz forgot to delete
-- In post 1.5 it is barely visible as its inside a big clientside object:
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (370857, 176786, 0, -501.6679, -4581.943, 8.715889, 3.141593, 0, 0, 1, 0, 3600, 3600, 100, 1, 0, 0.0, 0, 10);

-- Add missing RFC objects from wowemu, all inside dungeon but outside portal, others like it were already spawned in DB
-- Doodad_OrcSign_theSlowBlade
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (370850, 175302, 389, 17.9547, 117.038, 12.5586, -0.026181, 0, 0, -0.01309, 0.999914, 3600, 3600, 100, 1, 0, 0.0, 0, 10);
-- Doodad_MediumBrazierPurple11
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (370851, 175306, 389, 66.9001, 75.5444, -9.23551, -2.54818, 0, 0, 0.956305, -0.292372, 3600, 3600, 100, 1, 0, 0.0, 0, 10);
-- Doodad_OrcSign_IronwoodStavesandWands
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (370852, 175311, 389, 63.9071, 88.004, -5.47027, -3.05433, 0, 0, 0.999048, -0.043619, 3600, 3600, 100, 1, 0, 0.0, 0, 10);

-- Old ZG door pre ZG release, from wowemu:
-- ZulGurubMainDoor01
UPDATE `gameobject_template` SET `faction` = 114, `flags` = 20 WHERE `entry` = 177184;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (370853, 177184, 0, -11916.2, -1221.06, 92.279, -1.5708, 0, 0, -0.707107, 0.707107, 3600, 3600, 100, 1, 0, 0.0, 0, 4);
-- Post release ZG door correct patch:
-- Gates of Zul'Gurub
UPDATE `gameobject_template` SET `patch` = 5 WHERE `entry` = 180323;
UPDATE `gameobject` SET `patch_min` = 5 WHERE `guid` = 10698;

-- Pre patch 1.4 IF vault doors, from wowemu:
-- Vault Door
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (370854, 177237, 0, -4842.93, -1061.82, 502.142, 1.35263, 0, 0, 0.625924, 0.779884, 3600, 3600, 100, 1, 0, 0.0, 0, 1);
-- Vault Door
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (370855, 177238, 0, -4831.81, -1052.61, 502.156, 3.09796, 0, 0, 0.999762, 0.021815, 3600, 3600, 100, 1, 0, 0.0, 0, 1);
-- Set flag to 20 in according to wowemu, can't interact and untargetable
UPDATE `gameobject_template` SET `flags` = 20 WHERE `entry` IN (177237, 177238);

-- For some reason Caverns of Time door was deleted in 1.4 and replaced with serverside object
-- Was later on added back as clientside object in 1.6
-- CavernDoor01
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (370856, 179588, 1, -8173.24, -4747.53, 34.9166, 1.76278, 0, 0, 0.771625, 0.636078, 3600, 3600, 100, 1, 0, 0.0, 2, 3);
-- Set flag to 20 in according to wowemu, can't interact and untargetable
UPDATE `gameobject_template` SET `flags` = 20 WHERE `entry` = 179588;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
