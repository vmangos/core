DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210407230044');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210407230044');
-- Add your query below.


-- On use script for gameobject Tome of Mel'Thandris for quest The Howling Vale.
DELETE FROM `event_scripts` WHERE `id`=663;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (663, 1, 10, 3946, 17000, 1, 30, 0, 0, 0, 0, 8, 0, -1, 1, 3169.08, -1211.59, 217.201, 4.43314, 0, 'Tome of Mel\'Thandris: Velinde Starsong - Summon Creature Velinde Starsong');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (663, 2, 28, 8, 0, 0, 0, 3946, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tome of Mel\'Thandris: Velinde Starsong - Set Stand State');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (663, 5, 0, 0, 0, 0, 0, 3946, 30, 8, 2, 1356, 0, 0, 0, 0, 0, 0, 0, 0, 'Tome of Mel\'Thandris: Velinde Starsong - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (663, 8, 0, 0, 0, 0, 0, 3946, 30, 8, 2, 1357, 0, 0, 0, 0, 0, 0, 0, 0, 'Tome of Mel\'Thandris: Velinde Starsong - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (663, 15, 0, 0, 0, 0, 0, 3946, 30, 8, 2, 1358, 0, 0, 0, 0, 0, 0, 0, 0, 'Tome of Mel\'Thandris: Velinde Starsong - Say Text');

-- Add talk emotes to texts.
UPDATE `broadcast_text` SET `emote_id1`=1 WHERE `entry`=1356;
UPDATE `broadcast_text` SET `emote_id1`=1 WHERE `entry`=1357;

-- Correct data for Velinde Starsong.
UPDATE `creature_template` SET `level_min`=40, `level_max`=40, `health_min`=1753, `health_max`=1753, `faction`=35, `unit_flags`=33555200, `speed_walk`=1, `speed_run`=1.14286 WHERE `entry`=3946;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
