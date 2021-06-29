DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210107222838');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210107222838');
-- Add your query below.

-- Add start script to quest The Rethban Gauntlet
DELETE FROM `quest_start_scripts` WHERE `id`=1699;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1699, 0, 15, 8554, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Rethban Gauntlet: Player - Cast Spell Drinking Barleybrew Scalder');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1699, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2261, 0, 0, 0, 0, 0, 0, 0, 0, 'The Rethban Gauntlet: Yorus - Say Text');

UPDATE `quest_template` SET `StartScript`='1699' WHERE  `entry`=1699;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
