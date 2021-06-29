DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210614060736');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210614060736');
-- Add your query below.


-- Script when using Mount of Dirt for quest The Scythe of Elune.
DELETE FROM `event_scripts` WHERE `id`=664;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (664, 0, 10, 3946, 13000, 1, 10, 0, 0, 0, 0, 8, 0, -1, 1, -11141.1, -1152.68, 43.5816, 4.7822, 0, 'The Scythe of Elune: Mound of Dirt - Summon Creature Velinde Starsong');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (664, 1, 35, 0, 0, 0, 0, 3946, 10, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Scythe of Elune: Velinde Starsong - Set Orientation');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (664, 5, 0, 0, 0, 0, 0, 3946, 10, 8, 2, 1359, 0, 0, 0, 0, 0, 0, 0, 0, 'The Scythe of Elune: Velinde Starsong - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (664, 9, 0, 0, 0, 0, 0, 3946, 10, 8, 2, 1360, 0, 0, 0, 0, 0, 0, 0, 0, 'The Scythe of Elune: Velinde Starsong - Say Text');

-- Assign emotes to texts.
UPDATE `broadcast_text` SET `emote_id1`=1 WHERE `entry`=1359;
UPDATE `broadcast_text` SET `emote_id1`=18 WHERE `entry`=1360;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
