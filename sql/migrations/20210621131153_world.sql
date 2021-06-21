DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210621131153');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210621131153');
-- Add your query below.


-- Events list for Deviate Guardian
DELETE FROM `creature_ai_events` WHERE `creature_id`=3637;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (363701, 3637, 0, 2, 0, 100, 0, 30, 1, 0, 0, 363701, 0, 0, 'Deviate Guardian - Call for Help at 30% HP');
DELETE FROM `creature_ai_scripts` WHERE `id`=363701;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (363701, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2081, 0, 0, 0, 0, 0, 0, 0, 0, 'Deviate Guardian - Say Emoted Text');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (363701, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 0, 0, 0, 0, 'Deviate Guardian - Call for Help');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3637;

-- Events list for Sunscale Screecher
DELETE FROM `creature_ai_events` WHERE `creature_id`=3255;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (325501, 3255, 0, 2, 0, 100, 0, 30, 1, 0, 0, 325501, 0, 0, 'Sunscale Screecher - Call for Help at 30% HP');
DELETE FROM `creature_ai_scripts` WHERE `id`=325501;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (325501, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2081, 0, 0, 0, 0, 0, 0, 0, 0, 'Sunscale Screecher - Say Emoted Text');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (325501, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 40, 0, 0, 0, 0, 'Sunscale Screecher - Call for Help');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3255;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
