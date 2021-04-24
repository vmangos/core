DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20191226074501');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20191226074501');
-- Add your query below.


-- Pat's Snowcloud Guy
INSERT INTO `creature_template` (`entry`, `patch`, `display_id1`, `name`, `subname`, `unit_class`, `rank`, `beast_family`, `type`, `type_flags`, `health_min`, `health_max`, `mana_min`, `mana_max`, `level_min`, `level_max`, `faction`, `flags_extra`, `unit_flags`) VALUES (15730, 5, 15294, 'Pat\'s Snowcloud Guy', '', 1, 0, 0, 10, 0, 4120, 4120, 0, 0, 60, 60, 114, 64, 33555200);
INSERT INTO `creature_template_addon` (`entry`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (15730, 0, 0, 0, 0, 0, 0, 0, '26000');
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES 
(40063, 15730, 0, 0, 0, 0, 0, 0, 2051.41, 272.413, 57.174, -1.13446, 25, 25, 0, 0, 100, 0, 0, 0, 0, 0, 5, 10),
(40069, 15730, 0, 0, 0, 1, 0, 0, 1332.49, -4607.35, 24.4361, -1.13446, 25, 25, 0, 0, 100, 0, 0, 0, 0, 0, 5, 10),
(40134, 15730, 0, 0, 0, 0, 0, 0, -14294.2, 516.148, 8.95387, 0.593412, 25, 25, 0, 0, 100, 0, 0, 0, 0, 0, 5, 10),
(40161, 15730, 0, 0, 0, 0, 0, 0, -5049.3, -818.477, 495.292, -1.13446, 25, 25, 0, 0, 100, 0, 0, 0, 0, 0, 5, 10),
(40162, 15730, 0, 0, 0, 0, 0, 0, -8823.47, 540.116, 96.909, -2.00713, 25, 25, 0, 0, 100, 0, 0, 0, 0, 0, 5, 10);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES
(40063, 2),
(40069, 2),
(40134, 2),
(40161, 2),
(40162, 2);

-- PX-238 Winter Wondervolt TRAP
UPDATE `gameobject_template` SET `size`=0.001 WHERE `entry`=180797;

-- Present BIG
UPDATE `gameobject_template` SET `size`='1.5' WHERE `entry`=180798;

-- Present BIG
UPDATE `gameobject_template` SET `size`='1.5' WHERE `entry`=180799;

-- Christmas Tree (Medium)
UPDATE `gameobject_template` SET `size`='0.5' WHERE `entry`=178667;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
