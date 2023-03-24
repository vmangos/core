DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230324094209');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230324094209');
-- Add your query below.

-- Events list for Pyrewood Elder
DELETE FROM `creature_ai_events` WHERE `creature_id`=1895;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(189501, 1895, 0, 2, 0, 100, 0, 15, 0, 0, 0, 189501, 0, 0, 'Pyrewood Elder - Flee at 15% HP'),
(189502, 1895, 0, 14, 0, 100, 1, 400, 40, 15300, 22900, 189502, 0, 0, 'Pyrewood Elder - Cast Lesser Heal on Friendly Missing HP');

DELETE FROM `creature_ai_scripts` WHERE `id` IN (189501, 189502);
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(189501, 0, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyrewood Elder - Flee'),
(189502, 0, 0, 15, 2053, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyrewood Elder - Cast Lesser Heal');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
