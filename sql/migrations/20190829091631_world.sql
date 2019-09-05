DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190829091631');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190829091631');
-- Add your query below.


-- Events list for Twilight Thug
DELETE FROM `creature_ai_events` WHERE `creature_id`=2339;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (233901, 2339, 0, 11, 0, 100, 0, 0, 0, 0, 0, 233901, 0, 0, 'Twilight Thug - Cast Battle Stance on Spawn');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (233902, 2339, 0, 4, 0, 12, 2, 0, 0, 0, 0, 233902, 233903, 0, 'Twilight Thug - Say Text on Aggro');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (233904, 2339, 0, 2, 0, 100, 0, 15, 0, 0, 0, 233904, 0, 0, 'Twilight Thug - Flee at 15% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (233905, 2339, 0, 6, 0, 12, 2, 0, 0, 0, 0, 233905, 233906, 0, 'Twilight Thug - Chance Say on Death');
DELETE FROM `creature_ai_scripts` WHERE `id`=233905;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (233905, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 825, 826, 827, 828, 0, 0, 0, 0, 0, 'Twilight Thug - Say Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=233906;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (233906, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 829, 830, 831, 832, 0, 0, 0, 0, 0, 'Twilight Thug - Say Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=233902;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (233902, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 833, 834, 835, 836, 0, 0, 0, 0, 0, 'Twilight Thug - Say Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=233903;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (233903, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 837, 838, 839, 840, 0, 0, 0, 0, 0, 'Twilight Thug - Say Text');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
