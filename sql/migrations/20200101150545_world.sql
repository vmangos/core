DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200101150545');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200101150545');
-- Add your query below.


-- Change default movement type, level, and damage for Winter Revelers
UPDATE `creature_template` SET `movement_type`=0, `level_min`=30, `level_max`=40, `dmg_min`=45, `dmg_max`=60 WHERE `entry`=15760;

-- Set equipment for Winter Revelers.
UPDATE `creature_template` SET `equipment_id`=15760 WHERE `entry` IN (15780, 15781, 15782, 15783, 15784, 15785, 15786, 15787, 15788, 15789, 15790, 15791, 15792, 15793, 15794, 15795);

-- Goldshire
UPDATE `creature` SET `spawntimesecsmin`=300,`spawntimesecsmax`=480 WHERE `guid`=89359;
UPDATE `creature` SET `spawntimesecsmin`=300,`spawntimesecsmax`=480 WHERE `guid`=89360;
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89359, 6, 0, 0, 1, 16, 0, 0, '26239');
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89360, 6, 0, 0, 1, 16, 0, 0, '26240');
-- Stormwind
UPDATE `creature` SET `spawntimesecsmin`=300,`spawntimesecsmax`=480 WHERE `guid`=89361;
UPDATE `creature` SET `spawntimesecsmin`=300,`spawntimesecsmax`=480 WHERE `guid`=89362;
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89361, 6, 0, 0, 1, 16, 0, 0, '26239');
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89362, 6, 0, 0, 1, 16, 0, 0, '26240');
-- Westfall
UPDATE `creature` SET `spawntimesecsmin`=300,`spawntimesecsmax`=480 WHERE `guid`=89363;
UPDATE `creature` SET `spawntimesecsmin`=300,`spawntimesecsmax`=480 WHERE `guid`=89364;
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89363, 6, 0, 0, 1, 16, 0, 0, '26239');
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89364, 6, 0, 0, 1, 16, 0, 0, '26240');
-- Darkshire
UPDATE `creature` SET `spawntimesecsmin`=300,`spawntimesecsmax`=480 WHERE `guid`=89365;
UPDATE `creature` SET `spawntimesecsmin`=300,`spawntimesecsmax`=480 WHERE `guid`=89366;
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89365, 6, 0, 0, 1, 16, 0, 0, '26239');
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89366, 6, 0, 0, 1, 16, 0, 0, '26240');
-- Lakeshire
UPDATE `creature` SET `spawntimesecsmin`=300,`spawntimesecsmax`=480 WHERE `guid`=89367;
UPDATE `creature` SET `spawntimesecsmin`=300,`spawntimesecsmax`=480 WHERE `guid`=89368;
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89367, 6, 0, 0, 1, 16, 0, 0, '26239');
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89368, 6, 0, 0, 1, 16, 0, 0, '26240');
-- Dun Morogh
UPDATE `creature` SET `spawntimesecsmin`=300,`spawntimesecsmax`=480 WHERE `guid`=89369;
UPDATE `creature` SET `spawntimesecsmin`=300,`spawntimesecsmax`=480 WHERE `guid`=89370;
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89369, 6, 0, 0, 1, 16, 0, 0, '26241');
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89370, 6, 0, 0, 1, 16, 0, 0, '26242');
-- Ironforge
UPDATE `creature` SET `spawntimesecsmin`=300,`spawntimesecsmax`=480 WHERE `guid`=89372;
UPDATE `creature` SET `spawntimesecsmin`=300,`spawntimesecsmax`=480 WHERE `guid`=89371;
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89372, 6, 0, 0, 1, 16, 0, 0, '26241');
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89371, 6, 0, 0, 1, 16, 0, 0, '26242');
-- Teldrassil
UPDATE `creature` SET `spawntimesecsmin`=300,`spawntimesecsmax`=480 WHERE `guid`=89376;
UPDATE `creature` SET `spawntimesecsmin`=300,`spawntimesecsmax`=480 WHERE `guid`=89375;
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89376, 6, 0, 0, 1, 16, 0, 0, '26246');
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89375, 6, 0, 0, 1, 16, 0, 0, '26245');
-- Booty Bay
UPDATE `creature` SET `spawntimesecsmin`=300,`spawntimesecsmax`=480 WHERE `guid`=89380;
UPDATE `creature` SET `spawntimesecsmin`=300,`spawntimesecsmax`=480 WHERE `guid`=89379;
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89380, 6, 0, 0, 1, 16, 0, 0, '26244');
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89379, 6, 0, 0, 1, 16, 0, 0, '26243');
-- Crossroads
UPDATE `creature` SET `spawntimesecsmin`=300,`spawntimesecsmax`=480 WHERE `guid`=89381;
UPDATE `creature` SET `spawntimesecsmin`=300,`spawntimesecsmax`=480 WHERE `guid`=89382;
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89381, 6, 0, 0, 1, 16, 0, 0, '26250');
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89382, 6, 0, 0, 1, 16, 0, 0, '26247');
-- Orgrimmar
UPDATE `creature` SET `spawntimesecsmin`=300,`spawntimesecsmax`=480 WHERE `guid`=89383;
UPDATE `creature` SET `spawntimesecsmin`=300,`spawntimesecsmax`=480 WHERE `guid`=89384;
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89383, 6, 0, 0, 1, 16, 0, 0, '26247');
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89384, 6, 0, 0, 1, 16, 0, 0, '26248');
-- Thunder Bluff
UPDATE `creature` SET `spawntimesecsmin`=300,`spawntimesecsmax`=480 WHERE `guid`=89385;
UPDATE `creature` SET `spawntimesecsmin`=300,`spawntimesecsmax`=480 WHERE `guid`=89386;
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89385, 6, 0, 0, 1, 16, 0, 0, '26250');
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89386, 6, 0, 0, 1, 16, 0, 0, '26249');
-- Undercity
UPDATE `creature` SET `spawntimesecsmin`=300,`spawntimesecsmax`=480 WHERE `guid`=89387;
UPDATE `creature` SET `spawntimesecsmin`=300,`spawntimesecsmax`=480 WHERE `guid`=89388;
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89387, 6, 0, 0, 1, 16, 0, 0, '26254');
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89388, 6, 0, 0, 1, 16, 0, 0, '26253');
-- Tarren Mill
UPDATE `creature` SET `spawntimesecsmin`=300,`spawntimesecsmax`=480 WHERE `guid`=89389;
UPDATE `creature` SET `spawntimesecsmin`=300,`spawntimesecsmax`=480 WHERE `guid`=89390;
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89389, 6, 0, 0, 1, 16, 0, 0, '26254');
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89390, 6, 0, 0, 1, 16, 0, 0, '26253');
-- Tirisfal Glades
UPDATE `creature` SET `spawntimesecsmin`=300,`spawntimesecsmax`=480 WHERE `guid`=89391;
UPDATE `creature` SET `spawntimesecsmin`=300,`spawntimesecsmax`=480 WHERE `guid`=89392;
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89391, 6, 0, 0, 1, 16, 0, 0, '26254');
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89392, 6, 0, 0, 1, 16, 0, 0, '26253');
-- Durotar
UPDATE `creature` SET `spawntimesecsmin`=300,`spawntimesecsmax`=480 WHERE `guid`=89393;
UPDATE `creature` SET `spawntimesecsmin`=300,`spawntimesecsmax`=480 WHERE `guid`=89394;
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89393, 6, 0, 0, 1, 16, 0, 0, '26247');
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89394, 6, 0, 0, 1, 16, 0, 0, '26248');
-- Mulgore
UPDATE `creature` SET `spawntimesecsmin`=300,`spawntimesecsmax`=480 WHERE `guid`=89395;
UPDATE `creature` SET `spawntimesecsmin`=300,`spawntimesecsmax`=480 WHERE `guid`=89396;
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89395, 6, 0, 0, 1, 16, 0, 0, '26250');
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89396, 6, 0, 0, 1, 16, 0, 0, '26249');
-- Badlands
UPDATE `creature` SET `spawntimesecsmin`=300,`spawntimesecsmax`=480 WHERE `guid`=89397;
UPDATE `creature` SET `spawntimesecsmin`=300,`spawntimesecsmax`=480 WHERE `guid`=89398;
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89397, 6, 0, 0, 1, 16, 0, 0, '26248');
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89398, 6, 0, 0, 1, 16, 0, 0, '26247');
-- Southshore
UPDATE `creature` SET `spawntimesecsmin`=300,`spawntimesecsmax`=480 WHERE `guid`=89405;
UPDATE `creature` SET `spawntimesecsmin`=300,`spawntimesecsmax`=480 WHERE `guid`=89406;
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89405, 6, 0, 0, 1, 16, 0, 0, '26239');
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89406, 6, 0, 0, 1, 16, 0, 0, '26240');
-- Astranaar
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (89399, 15760, 0, 0, 0, 1, 0, 0, 2756.3, -419.052, 111.476, 3.43214, 300, 480, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (89400, 15760, 0, 0, 0, 1, 0, 0, 2754.04, -420.25, 111.471, 0.611771, 300, 480, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89399, 6, 0, 0, 1, 16, 0, 0, '26245');
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89400, 6, 0, 0, 1, 16, 0, 0, '26246');
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (89399, 2);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (89400, 2);
-- Darnassus
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (89401, 15760, 0, 0, 0, 1, 0, 0, 10128.2, 2218.37, 1329.99, 6.02016, 300, 480, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (89402, 15760, 0, 0, 0, 1, 0, 0, 10130.1, 2217.92, 1329.99, 2.76861, 300, 480, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89401, 6, 0, 0, 1, 16, 0, 0, '26245');
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89402, 6, 0, 0, 1, 16, 0, 0, '26246');
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (89401, 2);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (89402, 2);
-- Nijel's Point
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (89403, 15760, 0, 0, 0, 1, 0, 0, 246.91, 1259.09, 192.164, 0.951099, 300, 480, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (89404, 15760, 0, 0, 0, 1, 0, 0, 248.217, 1261.58, 192.159, 4.40921, 300, 480, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89403, 6, 0, 0, 1, 16, 0, 0, '26239');
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89404, 6, 0, 0, 1, 16, 0, 0, '26245');
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (89403, 2);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (89404, 2);
-- Shadowprey Village
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (89407, 15760, 0, 0, 0, 1, 0, 0, -1587.93, 3158.76, 47.1655, 5.62972, 300, 480, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (89408, 15760, 0, 0, 0, 1, 0, 0, -1586.06, 3157.71, 47.1656, 2.63029, 300, 480, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89407, 6, 0, 0, 1, 16, 0, 0, '26252');
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89408, 6, 0, 0, 1, 16, 0, 0, '26251');
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (89407, 2);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (89408, 2);
-- Feathermoon Stronghold
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (89409, 15760, 0, 0, 0, 1, 0, 0, -4350.65, 3289.7, 18.6701, 4.79722, 300, 480, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (89410, 15760, 0, 0, 0, 1, 0, 0, -4350.71, 3287.48, 18.6706, 1.54567, 300, 480, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89409, 6, 0, 0, 1, 16, 0, 0, '26245');
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89410, 6, 0, 0, 1, 16, 0, 0, '26246');
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (89409, 2);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (89410, 2);
-- Camp Mojache
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (89411, 15760, 0, 0, 0, 1, 0, 0, -4443.01, 253.042, 39.1077, 5.21849, 300, 480, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (89412, 15760, 0, 0, 0, 1, 0, 0, -4441.91, 250.713, 39.1075, 2.04155, 300, 480, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89411, 6, 0, 0, 1, 16, 0, 0, '26250');
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89412, 6, 0, 0, 1, 16, 0, 0, '26249');
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (89411, 2);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (89412, 2);
-- Loch Modan
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (89415, 15760, 0, 0, 0, 0, 0, 0, -5380.95, -2967.57, 322.058, 2.63296, 300, 480, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (89419, 15760, 0, 0, 0, 0, 0, 0, -5383.01, -2966.14, 322.058, 5.6489, 300, 480, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89415, 6, 0, 0, 1, 16, 0, 0, '26241');
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89419, 6, 0, 0, 1, 16, 0, 0, '26242');
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (89415, 2);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (89419, 2);
-- Silithus
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (89420, 15760, 0, 0, 0, 1, 0, 0, -6854.37, 737.732, 45.6625, 5.16703, 300, 480, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (89421, 15760, 0, 0, 0, 1, 0, 0, -6853.6, 735.501, 45.6626, 2.02544, 300, 480, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89420, 6, 0, 0, 1, 16, 0, 0, '26249');
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89421, 6, 0, 0, 1, 16, 0, 0, '26246');
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (89420, 2);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (89421, 2);
-- Stonetalon Mountains
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (89422, 15760, 0, 0, 0, 1, 0, 0, 910.056, 917.04, 106.258, 4.11374, 300, 480, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (90179, 15760, 0, 0, 0, 1, 0, 0, 908.816, 914.926, 106.258, 1.00356, 300, 480, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (89422, 6, 0, 0, 1, 16, 0, 0, '26250');
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (90179, 6, 0, 0, 1, 16, 0, 0, '26249');
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (89422, 2);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (90179, 2);
-- Tanaris
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (90180, 15760, 0, 0, 0, 1, 0, 0, -7161.89, -3844.66, 8.72069, 6.08667, 300, 480, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (90181, 15760, 0, 0, 0, 1, 0, 0, -7160.14, -3845.1, 8.78221, 2.9647, 300, 480, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (90180, 6, 0, 0, 1, 16, 0, 0, '26244');
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (90181, 6, 0, 0, 1, 16, 0, 0, '26243');
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (90180, 2);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (90181, 2);
-- Aerie Peak
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (90182, 15760, 0, 0, 0, 0, 0, 0, 397.73, -2093.59, 131.562, 4.9087, 300, 480, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (90183, 15760, 0, 0, 0, 0, 0, 0, 397.985, -2094.86, 131.562, 1.76318, 300, 480, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (90182, 6, 0, 0, 1, 16, 0, 0, '26241');
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (90183, 6, 0, 0, 1, 16, 0, 0, '26242');
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (90182, 2);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (90183, 2);
-- Revantusk Village
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (90185, 15760, 0, 0, 0, 0, 0, 0, -629.182, -4575, 12.3582, 3.99785, 300, 480, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (90186, 15760, 0, 0, 0, 0, 0, 0, -631.062, -4576.8, 12.3582, 0.772996, 300, 480, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (90185, 6, 0, 0, 1, 16, 0, 0, '26252');
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (90186, 6, 0, 0, 1, 16, 0, 0, '26251');
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (90185, 2);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (90186, 2);
-- Darkshore
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (90187, 15760, 0, 0, 0, 1, 0, 0, 6408.19, 518.432, 8.64959, 2.7685, 300, 480, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (90188, 15760, 0, 0, 0, 1, 0, 0, 6406.53, 519.057, 8.65005, 5.95719, 300, 480, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (90187, 6, 0, 0, 1, 16, 0, 0, '26246');
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (90188, 6, 0, 0, 1, 16, 0, 0, '26245');
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (90187, 2);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (90188, 2);
-- Theramore Isle
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (90189, 15760, 0, 0, 0, 1, 0, 0, -3620.36, -4462.42, 13.6222, 1.57957, 300, 480, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (90190, 15760, 0, 0, 0, 1, 0, 0, -3620.28, -4460.99, 13.6224, 4.71723, 300, 480, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (90189, 6, 0, 0, 1, 16, 0, 0, '26240');
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (90190, 6, 0, 0, 1, 16, 0, 0, '26239');
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (90189, 2);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (90190, 2);
-- Silverpine Forest
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (90191, 15760, 0, 0, 0, 0, 0, 0, 509.914, 1639.02, 125.942, 3.19987, 300, 480, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (90192, 15760, 0, 0, 0, 0, 0, 0, 505.762, 1638.93, 125.942, 0.00329638, 300, 480, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (90191, 6, 0, 0, 1, 16, 0, 0, '26254');
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (90192, 6, 0, 0, 1, 16, 0, 0, '26253');
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (90191, 2);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (90192, 2);
-- Stranglethorn Vale
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (90193, 15760, 0, 0, 0, 0, 0, 0, -12427.3, 212.364, 2.36578, 2.979, 300, 480, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (90194, 15760, 0, 0, 0, 0, 0, 0, -12429.3, 212.967, 2.36578, 6.03811, 300, 480, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (90193, 6, 0, 0, 1, 16, 0, 0, '26248');
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (90194, 6, 0, 0, 1, 16, 0, 0, '26247');
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (90193, 2);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (90194, 2);
-- Swamp of Sorrow
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (90195, 15760, 0, 0, 0, 0, 0, 0, -10488.7, -3251, 21.031, 2.35859, 300, 480, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (90196, 15760, 0, 0, 0, 0, 0, 0, -10490.9, -3248.7, 21.0323, 5.47271, 300, 480, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (90195, 6, 0, 0, 1, 16, 0, 0, '26248');
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (90196, 6, 0, 0, 1, 16, 0, 0, '26247');
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (90195, 2);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (90196, 2);
-- Thousand Needles
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (90197, 15760, 0, 0, 0, 1, 0, 0, -5461.82, -2454.93, 89.8208, 2.02411, 300, 480, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (90233, 15760, 0, 0, 0, 1, 0, 0, -5462.77, -2452.31, 89.7673, 5.07143, 300, 480, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (90197, 6, 0, 0, 1, 16, 0, 0, '26250');
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (90233, 6, 0, 0, 1, 16, 0, 0, '26249');
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (90197, 2);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (90233, 2);
-- Wetlands
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (90281, 15760, 0, 0, 0, 0, 0, 0, -3804.54, -826.874, 10.0928, 2.22376, 300, 480, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (90282, 15760, 0, 0, 0, 0, 0, 0, -3806.34, -825.119, 10.0928, 5.33786, 300, 480, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (90281, 6, 0, 0, 1, 16, 0, 0, '26241');
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (90282, 6, 0, 0, 1, 16, 0, 0, '26242');
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (90281, 2);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (90282, 2);
-- Winterspring
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (90283, 15760, 0, 0, 0, 1, 0, 0, 6689.98, -4678.31, 721.716, 6.19404, 300, 480, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (90284, 15760, 0, 0, 0, 1, 0, 0, 6691.95, -4678.56, 721.716, 3.08385, 300, 480, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (90283, 6, 0, 0, 1, 16, 0, 0, '26244');
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (90284, 6, 0, 0, 1, 16, 0, 0, '26243');
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (90283, 2);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (90284, 2);
-- Hammerfall
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (90285, 15760, 0, 0, 0, 0, 0, 0, -921.846, -3528.56, 72.5878, 4.71034, 300, 480, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (90288, 15760, 0, 0, 0, 0, 0, 0, -921.963, -3531.02, 72.5776, 1.54518, 300, 480, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (90285, 6, 0, 0, 1, 16, 0, 0, '26248');
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (90288, 6, 0, 0, 1, 16, 0, 0, '26247');
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (90285, 2);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (90288, 2);
-- Ratchet
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (90289, 15760, 0, 0, 0, 1, 0, 0, -1046.4, -3668.4, 23.8867, 1.39719, 300, 480, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (90296, 15760, 0, 0, 0, 1, 0, 0, -1045.47, -3664.27, 23.8897, 4.51522, 300, 480, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (90289, 6, 0, 0, 1, 16, 0, 0, '26244');
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (90296, 6, 0, 0, 1, 16, 0, 0, '26243');
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (90289, 2);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (90296, 2);
-- Camp Taurajo
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (90377, 15760, 0, 0, 0, 1, 0, 0, -2363.67, -1979, 96.7049, 2.6105, 300, 480, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (90378, 15760, 0, 0, 0, 1, 0, 0, -2365.86, -1977.85, 96.7051, 5.77053, 300, 480, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (90377, 6, 0, 0, 1, 16, 0, 0, '26248');
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (90378, 6, 0, 0, 1, 16, 0, 0, '26249');
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (90377, 2);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (90378, 2);
-- Splintertree Post
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (90380, 15760, 0, 0, 0, 1, 0, 0, 2336.32, -2578.54, 102.773, 5.92544, 300, 480, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (90426, 15760, 0, 0, 0, 1, 0, 0, 2338.5, -2579.34, 102.773, 2.71708, 300, 480, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (90380, 6, 0, 0, 1, 16, 0, 0, '26248');
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (90426, 6, 0, 0, 1, 16, 0, 0, '26247');
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (90380, 2);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (90426, 2);

-- Events list for Winter Reveler
DELETE FROM `creature_ai_events` WHERE `creature_id`=15760;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1576001, 15760, 0, 22, 0, 100, 1, 58, 0, 0, 0, 1576001, 0, 0, 'Winter Reveler - Cast Mistletoe on Receive Kiss Emote');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1576002, 15760, 0, 1, 0, 100, 1, 10000, 20000, 10000, 60000, 1576002, 0, 0, 'Winter Reveler - Emote on OOC');
DELETE FROM `creature_ai_scripts` WHERE `id`=1576002;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1576002, 0, 1, 24, 0, 0, 0, 0, 0, 0, 0, 11, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Reveler - Random Emote');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
