DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210620150858');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210620150858');
-- Add your query below.


UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` IN (15892);
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` IN (180871, 180872, 180763, 180873, 180870, 180764);

INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1589201, 15892, 0, 1, 0, 100, 1, 10000, 20000, 10000, 20000, 1589201, 0, 0, 'Lunar Festival Emissary - Start Script - OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1589201, 0, 39, 1589201, 1589202, 1589203, 1589204, 0, 0, 0, 0, 25, 25, 25, 25, 0, 0, 0, 0, 0, 'Lunar Festival Emissary - Start Script - OOC');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1589201, 0, 81, 0, 5, 0, 0, 180763, 50000, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 500, 'Lunar Festival Emissary - Despawn Gobject');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1589202, 0, 81, 0, 5, 0, 0, 180764, 50000, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 501, 'Lunar Festival Emissary - Despawn Gobject');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
