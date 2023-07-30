DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230729171655');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230729171655');
-- Add your query below.


-- Remove Duplicate Food Crates
DELETE FROM `pool_pool` WHERE `pool_id` IN (SELECT `pool_entry` FROM `pool_gameobject` WHERE `guid` IN (44156, 44204, 44155, 44206, 44137, 44185, 44150, 44198, 44149, 44197, 44137, 44185));
DELETE FROM `pool_template` WHERE `entry` IN (SELECT `pool_entry` FROM `pool_gameobject` WHERE `guid` IN (44156, 44204, 44155, 44206, 44137, 44185, 44150, 44198, 44149, 44197, 44137, 44185));
DELETE FROM `gameobject` WHERE `guid` IN (44156, 44204, 44155, 44206, 44137, 44185, 44150, 44198, 44149, 44197, 44137, 44185);
DELETE FROM `pool_gameobject` WHERE `guid` IN (44156, 44204, 44155, 44206, 44137, 44185, 44150, 44198, 44149, 44197, 44137, 44185);

-- Remove Duplicate Cortellos Riddle
DELETE FROM `gameobject` WHERE `guid` = 129;
DELETE FROM `pool_gameobject` WHERE `guid` IN (129);

-- Add Missing Event Objects and Creatures
SET @CGUID = 10999;
SET @OGUID = 2555;
-- WSG WEEKEND 19
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 180400, 0, -8460.94, 313.787, 121.997, 3.82227, 0, 0, -0.942641, 0.333808, 180, 180, 100, 1, 0, 0, 5, 10),
(@OGUID+2, 180397, 0, -8461.34, 313.517, 120.886, 0.698131, 0, 0, 0.34202, 0.939693, 180, 180, 100, 1, 0, 0, 5, 10);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES
(@OGUID+1, 19),
(@OGUID+2, 19);

INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@CGUID+1, 15102, 0, 0, 0, 0, 0, -8460.44, 317.161, 120.969, 5.53269, 300, 300, 0, 100, 0, 0, 0, 0, 5, 10),
(@CGUID+2, 15102, 0, 0, 0, 0, 0, -8457.36, 314.096, 120.969, 2.30383, 300, 300, 0, 100, 0, 0, 0, 0, 5, 10);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES
(@CGUID+1, 19),
(@CGUID+2, 19);

-- ARATHI WEEKEND 20
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+3, 180398, 0, -8411.64, 327.647, 120.886, 3.01941, 0, 0, 0.998135, 0.0610518, 180, 180, 100, 1, 0, 0, 5, 10);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES
(@OGUID+3, 20);

INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@CGUID+3, 14991, 0, 0, 0, 0, 0, -8416.18, 329.05, 120.969, 5.53269, 120, 120, 0, 100, 0, 0, 0, 0, 5, 10),
(@CGUID+4, 14991, 0, 0, 0, 0, 0, -8414.17, 326.23, 120.969, 2.30383, 120, 120, 0, 100, 0, 0, 0, 0, 5, 10);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES
(@CGUID+3, 20),
(@CGUID+4, 20);

-- AV WEEKEND 18
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+4, 180399, 0, -8418.02, 347.772, 121.629, 3.80482, 0, 0, -0.945518, 0.325568, 180, 180, 100, 1, 0, 0, 5, 10),
(@OGUID+5, 180397, 0, -8417.59, 348.152, 120.886, 3.80482, 0, 0, -0.945518, 0.325568, 180, 180, 100, 1, 0, 0, 5, 10);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES
(@OGUID+4, 18),
(@OGUID+5, 18);

INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@CGUID+5, 15103, 0, 0, 0, 0, 0, -8422.24, 347.872, 120.969, 5.53269, 300, 300, 0, 100, 0, 0, 0, 0, 5, 10),
(@CGUID+6, 15103, 0, 0, 0, 0, 0, -8419.03, 343.831, 120.969, 2.30383, 300, 300, 0, 100, 0, 0, 0, 0, 5, 10);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES
(@CGUID+5, 18),
(@CGUID+6, 18);

-- Remove Duplicate Blood of Heroes
DELETE FROM `gameobject` WHERE `guid` IN (25981, 25918, 25962, 25972, 55363);
DELETE FROM `pool_gameobject` WHERE `guid` IN (25981, 25918, 25962, 25972, 55363);

-- Dont Use TBC Postitions For PVP Signposts
-- AB 180398
UPDATE `gameobject` SET `position_x` = -8403.36, `position_y` = 576.668, `position_z` = 91.5761, `orientation` = 2.18166, `rotation0` = 0, `rotation1` = 0, `rotation2` = 0.887011, `rotation3` = 0.461749 WHERE `guid` = 190088;

-- WSG 180397
UPDATE `gameobject` SET `position_x` = -8404.05, `position_y` = 577.197, `position_z` = 91.9778, `orientation` = 5.28835, `rotation0` = 0, `rotation1` = 0, `rotation2` = -0.477159, `rotation3` = 0.878817 WHERE `guid` = 190084;
UPDATE `gameobject` SET `position_x` = -8403.57, `position_y` = 576.764, `position_z` = 93.0165, `orientation` = 5.28835, `rotation0` = 0, `rotation1` = 0, `rotation2` = -0.477159, `rotation3` = 0.878817 WHERE `guid` = 190087;

-- AV 180397
UPDATE `gameobject` SET `position_x` = -8403.31, `position_y` = 576.532, `position_z` = 91.5694, `orientation` = 5.32326, `rotation0` = 0, `rotation1` = 0, `rotation2` = -0.461748, `rotation3` = 0.887011 WHERE `guid` = 190086;
UPDATE `gameobject` SET `position_x` = -8402.93, `position_y` = 576.101, `position_z` = 92.1175, `orientation` = 5.32326, `rotation0` = 0, `rotation1` = 0, `rotation2` = -0.461748, `rotation3` = 0.887011 WHERE `guid` = 190085;

-- Remove TBC Spawns From Stormwind Keep War Room
DELETE FROM `gameobject` WHERE `guid` IN ( 190068, 190070, 190066, 190069, 190067);
DELETE FROM `game_event_gameobject` WHERE `guid` IN ( 190068, 190070, 190066, 190069, 190067);
DELETE FROM `creature` WHERE `guid` IN ( 190154, 190155, 190153, 190152, 190157, 190156);
DELETE FROM `game_event_creature` WHERE `guid` IN ( 190154, 190155, 190153, 190152, 190157, 190156);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
