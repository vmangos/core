DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211202115104');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211202115104');
-- Add your query below.


-- Completion script for quest Recover the Key!
DELETE FROM `quest_end_scripts` WHERE `id`=7846;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(7846, 0, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover the Key!: Elder Torntusk - Stand Up'),
(7846, 0, 4, 147, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover the Key!: Elder Torntusk - Remove Npc Flags'),
(7846, 0, 18, 120000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover the Key!: Elder Torntusk - Despawn in 2 Minutes'),
(7846, 1, 1, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover the Key!: Elder Torntusk - Emote OneShotRoar'),
(7846, 5, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover the Key!: Elder Torntusk - Emote OneShotCheer'),
(7846, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10013, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover the Key!: Elder Torntusk - Say Text');
UPDATE `quest_template` SET `CompleteScript`=7846 WHERE `entry`=7846;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
