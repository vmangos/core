DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200417113246');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200417113246');
-- Add your query below.


-- Add missing aura and fix movement of Corrupt Water Spirit.
UPDATE `creature` SET `wander_distance`=3, `movement_type`=1 WHERE `id`=5897;
UPDATE `creature_template_addon` SET `auras`='8203' WHERE `entry`=5897;

-- Fix gameobject spawns for Call of Water (Part 7).
DELETE FROM `gameobject` WHERE `guid`=27558;
UPDATE `gameobject` SET `position_x`=425.1126, `position_y`=1864.08, `position_z`=9.974041, `orientation`=3.412122, `rotation2`=-0.9908657, `rotation3`=0.1348523 WHERE `guid`=33369;
UPDATE `gameobject` SET `position_x`=419.041, `position_y`=1843.152, `position_z`=11.98904, `orientation`=3.141479, `rotation0`=0.0130887, `rotation1`=0.004362106, `rotation2`=-0.9999046, `rotation3`=0 WHERE `guid`=33417;
UPDATE `gameobject` SET `position_x`=425.0673, `position_y`=1864.188, `position_z`=10.35329, `orientation`=6.265733, `rotation0`=0, `rotation1`=0, `rotation2`=-0.00872612, `rotation3`=0.9999619 WHERE `guid`=35418;

-- Update start script for Call of Water (Part 7).
DELETE FROM `quest_start_scripts` WHERE `id`=100;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (100, 0, 9, 15175, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Water (Part 7): Respawn Water Manifestation Effect');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (100, 0, 68, 5897, 2, 5897, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Water (Part 7): Start Script For All Corrupt Water Spirits');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (100, 15, 10, 5895, 180000, 0, 0, 0, 0, 0, 0, 4, 0, 6, 1, 417.05, 1822.39, 13.007, 0.035, 0, 'Call of Water (Part 7): Summon Minor Manifestation of Water');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (100, 15, 9, 15176, 180, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Water (Part 7): Respawn Water Manifestation Aura');
DELETE FROM `event_scripts` WHERE `id`=5897;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5897, 0, 48, 100, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Corrupt Water Spirit - Kill Self');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
