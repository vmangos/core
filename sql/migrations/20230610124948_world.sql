DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230610124948');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230610124948');
-- Add your query below.


-- Events list for Defias Dockmaster
DELETE FROM `creature_ai_events` WHERE `creature_id`=6846;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (684601, 6846, 0, 4, 0, 100, 0, 0, 0, 0, 0, 684601, 0, 0, 'Defias Dockmaster - Say on Aggro');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (684602, 6846, 0, 0, 0, 100, 0, 0, 0, 1500, 1500, 684602, 0, 0, 'Defias Dockmaster - Summon 3 Defias Bodyguards on Aggro');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (684603, 6846, 0, 35, 0, 100, 1, 10000, 10000, 0, 0, 684603, 0, 0, 'Defias Dockmaster - Say on Stealth Alert');
DELETE FROM `creature_ai_scripts` WHERE `id`=684603;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(684603, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2865, 0, 0, 0, 0, 0, 0, 0, 0, 'Defias Dockmaster - Say Text');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
