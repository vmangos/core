DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211201050831');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211201050831');
-- Add your query below.


-- Completion script for quest Forbidden Knowledge.
DELETE FROM `quest_end_scripts` WHERE `id`=737;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(737, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 923, 0, 0, 0, 0, 0, 0, 0, 0, 'Forbidden Knowledge: Theldurin the Lost - Say Text'),
(737, 0, 28, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Forbidden Knowledge: Theldurin the Lost - Set Stand State to Kneel'),
(737, 2, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Forbidden Knowledge: Theldurin the Lost - Set Stand State to Stand'),
(737, 3, 1, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Forbidden Knowledge: Theldurin the Lost - Emote OneShotWoundCritical'),
(737, 3, 15, 4947, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Forbidden Knowledge: Theldurin the Lost - Cast Spell Magic Backlash'),
(737, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 924, 0, 0, 0, 0, 0, 0, 0, 0, 'Forbidden Knowledge: Theldurin the Lost - Say Text'),
(737, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 934, 0, 0, 0, 0, 0, 0, 0, 0, 'Forbidden Knowledge: Theldurin the Lost - Say Text');
UPDATE `quest_template` SET `CompleteScript`=737 WHERE `entry`=737;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
