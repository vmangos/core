DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200729201638');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200729201638');
-- Add your query below.


-- gina lang summon imp
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 5750;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (575001, 5750, 0, 11, 0, 100, 0, 0, 0, 0, 0, 575001, 0, 0, 'Gina Lang - Summon Imp on Spawn');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (575001, 0, 15, 11939, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gina Lang - Summon Imp on Spawn');

-- allow doreen beltis to roam
UPDATE `creature` SET `movement_type` = 1, `wander_distance` = 2 WHERE `guid` = 31918;

-- allow jamie nore to roam
UPDATE `creature` SET `movement_type` = 1, `wander_distance` = 2 WHERE `guid` = 31921;

-- allow shelene rhobart to roam
UPDATE `creature` SET `movement_type` = 1, `wander_distance` = 2 WHERE `guid` = 38289;

-- set oliver dwor orientation
UPDATE `creature` SET `orientation` = 4.72669 WHERE `guid` = 38290;

-- remove incorrect deathguard elite
DELETE FROM `creature` WHERE `guid` = 14369;

-- junior apothecary holland - say OOC
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 10665;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1066501, 10665, 0, 1, 0, 100, 1, 10000, 20000, 40000, 60000, 1066501, 0, 0, 'Junior Apothecary Holland - Say OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1066501, 0, 39, 1066501, 1066502, 0, 0, 0, 0, 0, 4, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Junior Apothecary Holland - Start Script');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1066501, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 5955, 5956, 5957, 5958, 0, 0, 0, 0, 0, 'Junior Apothecary Holland - Talk');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1066502, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 5959, 5960, 5961, 5962, 0, 0, 0, 0, 0, 'Junior Apothecary Holland - Talk');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
