DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190110010547');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190110010547');
-- Add your query below.


-- HORDE
-- some taken from TrinityCore's Database
-- vid from `patch` 1.4 https://www.youtube.com/watch?v=Yt18WyPxvQI

-- Blood Guard Hini'wanas faction should be Darkspear and PvP flagged
UPDATE `creature_template` SET `faction`=126 WHERE `entry`=12789;
UPDATE `creature_template` SET `unit_flags`=4096 WHERE `entry`=12789;

-- Fix Tauren `scale`
UPDATE `creature_template` SET `scale`=1.35 WHERE `entry`=12791;
UPDATE `creature_template` SET `scale`=1.35 WHERE `entry`=14581;
UPDATE `creature_template` SET `scale`=1.25 WHERE `entry`=12793;

-- Weapons sheathed
DELETE FROM `creature_template_addon` WHERE `entry`=14581;
INSERT INTO `creature_template_addon` (`entry`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (14581, 2, 0, 0, 0, 16, 0, 0, NULL);
DELETE FROM `creature_template_addon` WHERE `entry`=12792;
INSERT INTO `creature_template_addon` (`entry`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (12792, 2, 0, 0, 0, 16, 0, 0, NULL);
DELETE FROM `creature_template_addon` WHERE `entry`=12788;
INSERT INTO `creature_template_addon` (`entry`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (12788, 2, 0, 0, 0, 16, 0, 0, NULL);
DELETE FROM `creature_template_addon` WHERE `entry`=12794;
INSERT INTO `creature_template_addon` (`entry`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (12794, 2, 0, 0, 0, 16, 0, 0, NULL);
DELETE FROM `creature_template_addon` WHERE `entry`=12793;
INSERT INTO `creature_template_addon` (`entry`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (12793, 2, 0, 0, 0, 16, 0, 0, NULL);
DELETE FROM `creature_template_addon` WHERE `entry`=12796;
INSERT INTO `creature_template_addon` (`entry`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (12796, 2, 0, 0, 0, 16, 0, 0, NULL);
DELETE FROM `creature_template_addon` WHERE `entry`=12795;
INSERT INTO `creature_template_addon` (`entry`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (12795, 2, 0, 0, 0, 16, 0, 0, NULL);
DELETE FROM `creature_template_addon` WHERE `entry`=12789;
INSERT INTO `creature_template_addon` (`entry`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (12789, 2, 0, 0, 0, 16, 0, 0, NULL);

-- Add Grunt Korf & Grunt Bek'rah
INSERT INTO creature (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (52728, 12798, 450, 0, 12798, 238.214, 73.3759, 25.7981, 1.18682, 180, 180, 0, 0, 4079, 0, 0, 0, 0, 0, 2, 10);
INSERT INTO creature (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (52729, 12797, 450, 0, 12797, 230.81, 86.728, 25.8015, 6.12611, 180, 180, 0, 0, 4079, 0, 0, 0, 0, 0, 2, 10);

-- Correct Positions for NPCs
UPDATE creature SET `position_x`=239.877, `position_y`=85.6123, `position_z`=24.8598, `orientation`=6.12611 WHERE guid=86422; -- Legionnaire Teena
UPDATE creature SET `position_x`=246.295, `position_y`=86.5842, `position_z`=24.8598, `orientation`=3.71755 WHERE guid=86421; -- Blood Guard Hini'wana
UPDATE creature SET `position_x`=240.616, `position_y`=103.316, `position_z`=25.8049, `orientation`=4.85202 WHERE guid=86419; -- Stone Guard Zarg
UPDATE creature SET `position_x`=256.485, `position_y`=99.3971, `position_z`=25.8042, `orientation`=3.9619 WHERE guid=86381; -- Brave Stonehide
UPDATE creature SET `position_x`=258.963, `position_y`=73.2198, `position_z`=25.8045, `orientation`=2.49582 WHERE guid=86378; -- Raider Bork
UPDATE creature SET `position_x`=246.83, `position_y`=82.4214, `position_z`=24.8454, `orientation`=2.56563 WHERE guid=86367; -- Chieftain Earthbind
UPDATE creature SET `position_x`=239.886, `position_y`=84.128, `position_z`=24.8549, `orientation`=1.11701 WHERE guid=52723; -- Advisor Willington

-- Correct Subnames for `patch` 9
UPDATE `creature_template` SET `subname`='Weapons Quartermaster' WHERE `entry`=12794 AND `patch`=9;
UPDATE `creature_template` SET `subname`='Armor Quartermaster' WHERE `entry`=12795 AND `patch`=9;

-- Add Mighty Blazes & Military Ranks of the Horde & Alliance
INSERT INTO `gameobject` (`id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (176570, 450, 242.585, 97.2076, 25.826, 1.19555, 0, 0, 0.562804, 0.82659, 7200, 7200, 255, 1, 0, 0, 2, 10);
INSERT INTO `gameobject` (`id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (176571, 450, 230.55, 83.6898, 25.7982, 1.19555, 0, 0, 0.562804, 0.82659, 7200, 7200, 255, 1, 0, 0, 2, 10);
INSERT INTO `gameobject` (`id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (176572, 450, 235.829, 74.5563, 25.7982, 2.93214, 0, 0, 0.994521, 0.104535, 7200, 7200, 255, 1, 0, 0, 2, 10);
INSERT INTO `gameobject` (`id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (179707, 450, 242.979, 87.1698, 25.8072, 5.02968, 0, 0, 0.586518, -0.809936, 7200, 7200, 255, 1, 0, 0, 2, 10);
INSERT INTO `gameobject` (`id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (176569, 450, 252.497, 76.7461, 25.826, 5.00037, 0, 0, -0.598325, 0.801254, 7200, 7200, 255, 1, 0, 0, 2, 10);
INSERT INTO `gameobject` (`id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (176568, 450, 255.704, 85.4733, 25.826, 5.71595, 0, 0, -0.279828, 0.96005, 7200, 7200, 255, 1, 0, 0, 2, 10);
INSERT INTO `gameobject` (`id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (176567, 450, 251.489, 94.4714, 25.826, 0.968657, 0, 0, 0.465614, 0.884988, 7200, 7200, 255, 1, 0, 0, 2, 10);

-- ALLIANCE
-- Champion's Hall Videos i found:
-- early TBC: https://www.youtube.com/watch?v=zA68eR408kc
-- TBC: https://www.youtube.com/watch?v=XE3EMO0Syd4

-- Correct Subnames for `patch` 9
UPDATE `creature_template` SET `subname`='Weapons Quartermaster' WHERE `entry`=12784 AND `patch`=9;
UPDATE `creature_template` SET `subname`='Armor Quartermaster' WHERE `entry`=12785 AND `patch`=9;

-- Add more chairs & Treatise on Military Ranks
INSERT INTO `gameobject` (`id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (176384, 449, -9.0253, 28.0725, 1.06098, 0, 0, 0, 0, 1, 25, 25, 100, 1, 0, 0, 2, 10);
INSERT INTO `gameobject` (`id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (176385, 449, -9.0253, 30.1114, 1.06098, 0, 0, 0, 0, 1, 25, 25, 100, 1, 0, 0, 2, 10);
INSERT INTO `gameobject` (`id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (176386, 449, 7.12302, 12.036, -0.244337, 6.26573, 0, 0, -0.00872612, 0.999962, 25, 25, 100, 1, 0, 0, 2, 10);
INSERT INTO `gameobject` (`id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (176387, 449, 6.82727, 6.82645, -0.244337, 0.191985, 0, 0, 0.0958452, 0.995396, 25, 25, 100, 1, 0, 0, 2, 10);
INSERT INTO `gameobject` (`id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (176388, 449, -4.75979, 14.6068, -0.244337, 1.76278, 0, 0, 0.771625, 0.636078, 25, 25, 100, 1, 0, 0, 2, 10);
INSERT INTO `gameobject` (`id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (179706, 449, 0.097743, 29.0823, 2.43142, 4.64258, 0, 0, -0.731354, 0.681998, 25, 25, 100, 1, 0, 0, 2, 10);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
