DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201211113354');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201211113354');
-- Add your query below.


-- Imp Minion should say text on aggro.
DELETE FROM `creature_ai_events` WHERE `creature_id`=12922;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1292201, 12922, 0, 4, 0, 10, 2, 0, 0, 0, 0, 1292201, 1292202, 0, 'Imp Minion - Say Text on Aggro');
DELETE FROM `creature_ai_scripts` WHERE `id`=1292201;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1292201, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 746, 747, 749, 750, 0, 0, 0, 0, 0, 'Imp Minion - Say Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=1292202;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1292202, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 751, 752, 753, 754, 0, 0, 0, 0, 0, 'Imp Minion - Say Text');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
