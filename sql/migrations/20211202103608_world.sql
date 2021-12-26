DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211202103608');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211202103608');
-- Add your query below.


-- Completion script for quest Restoring the Necklace.
DELETE FROM `quest_end_scripts` WHERE `id`=2204;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(2204, 0, 3, 0, 6397, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -4574.79, -998.688, 503.657, 0, 0, 'Restoring the Necklace: Talvash del Kissel - Move'),
(2204, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3121, 0, 0, 0, 0, 0, 0, 0, 0, 'Restoring the Necklace: Talvash del Kissel - Say Text'),
(2204, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Restoring the Necklace: Talvash del Kissel - Remove Npc Flags'),
(2204, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3122, 0, 0, 0, 0, 0, 0, 0, 0, 'Restoring the Necklace: Talvash del Kissel - Say Text'),
(2204, 13, 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Restoring the Necklace: Talvash del Kissel - Emote OneShotExclamation'),
(2204, 13, 3, 0, 3886, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -4580.49, -993.985, 503.657, 0, 0, 'Restoring the Necklace: Talvash del Kissel - Move'),
(2204, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3123, 0, 0, 0, 0, 0, 0, 0, 0, 'Restoring the Necklace: Talvash del Kissel - Say Text'),
(2204, 18, 1, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Restoring the Necklace: Talvash del Kissel - Emote OneShotKneel'),
(2204, 21, 3, 0, 1332, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -4588.3, -1001.21, 503.657, 3.31613, 0, 'Restoring the Necklace: Talvash del Kissel - Move'),
(2204, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3124, 0, 0, 0, 0, 0, 0, 0, 0, 'Restoring the Necklace: Talvash del Kissel - Say Text'),
(2204, 26, 15, 9795, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Restoring the Necklace: Talvash del Kissel - Cast Spell Talvash\'s Necklace Repair'),
(2204, 34, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Restoring the Necklace: Talvash del Kissel - Emote OneShotCheer'),
(2204, 34, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Restoring the Necklace: Talvash del Kissel - Add Npc Flags'),
(2204, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3125, 0, 0, 0, 0, 0, 0, 0, 0, 'Restoring the Necklace: Talvash del Kissel - Say Text');
UPDATE `quest_template` SET `CompleteScript`=2204 WHERE `entry`=2204;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
