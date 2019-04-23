DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181206131938');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181206131938');
-- Add your query below.


-- Events list for Grub
DELETE FROM `creature_ai_events` WHERE `creature_id`=3443;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (344301, 3443, 0, 1, 0, 100, 1, 90000, 90000, 90000, 90000, 344301, 0, 0, 'Grub - Start Event Script OOC');
DELETE FROM `creature_ai_scripts` WHERE `id`=344301;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (344301, 0, 39, 3443, 0, 0, 0, 14389, 0, 9, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Grub - Start Event Script');
DELETE FROM `event_scripts` WHERE `id` = 3443;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(3443, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grub - Play Emote'),
(3443, 4, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Duhng - Play Emote'),
(3443, 7, 35, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 4.583168, 0, 'Duhng - Set Orientation'),
(3443, 10, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Duhng - Play Emote'),
(3443, 14, 35, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 5.91667, 0, 'Duhng - Set Orientation'),
(3443, 16, 1, 173, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Duhng - Play Emote');
UPDATE `creature_template` SET `AIName`='EventAI' WHERE `entry`=3443;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
