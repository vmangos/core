DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20251012011416');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20251012011416');
-- Add your query below.


-- Completion script for quest The Star, the Hand and the Heart.
DELETE FROM `quest_end_scripts` WHERE `id`=735;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(735, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 919, 0, 0, 0, 0, 0, 0, 0, 0, 'The Star, the Hand and the Heart: Gerrig Bonegrip - Say Text'),
(735, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 920, 0, 0, 0, 0, 0, 0, 0, 0, 'The Star, the Hand and the Heart: Gerrig Bonegrip - Say Text');
UPDATE `broadcast_text` SET `emote_id1`=2 WHERE `entry`=920;
UPDATE `quest_template` SET `CompleteScript`=735 WHERE `entry`=735;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
