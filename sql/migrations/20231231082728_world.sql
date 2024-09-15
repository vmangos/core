DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20231231082728');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20231231082728');
-- Add your query below.


-- Events list for Scarshield Portal
DELETE FROM `creature_ai_events` WHERE `creature_id`=9707;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(970701, 9707, 0, 11, 0, 100, 1, 0, 0, 0, 0, 970701, 0, 0, 'Scarshield Portal - Disable Attack and Movement on Spawn'),
(970702, 9707, 0, 1, 0, 100, 1, 12000, 12000, 12000, 12000, 970702, 0, 0, 'Scarshield Portal - Summon Burning Felhound OOC'),
(970703, 9707, 0, 1, 0, 10, 0, 20000, 20000, 0, 0, 970703, 0, 0, 'Scarshield Portal - Summon Burning Felguard OOC');
DELETE FROM `creature_ai_scripts` WHERE `id`=970701;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(970701, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarshield Portal - Disable Melee Attack'),
(970701, 0, 0, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarshield Portal - Disable Combat Movement');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
