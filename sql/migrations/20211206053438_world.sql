DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211206053438');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211206053438');
-- Add your query below.


-- Completion script for quest Rite of Vision.
DELETE FROM `quest_end_scripts` WHERE `id`=772;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(772, 0, 15, 1126, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rite of Vision: Seer Wiserunner - Cast Spell Mark of the Wild');
UPDATE `quest_template` SET `CompleteScript`=772 WHERE `entry`=772;

-- Seer Wiserunner should say text on player approaching.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (772, 9, 772, 0, 0, 0, 0);
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (298402, 2984, 772, 10, 0, 100, 1, 2, 20, 120000, 120000, 298402, 0, 0, 'Seer Wiserunner - Say Text on Player in LoS');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (298402, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 947, 0, 0, 0, 0, 0, 0, 0, 0, 'Seer Wiserunner - Say Text');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
