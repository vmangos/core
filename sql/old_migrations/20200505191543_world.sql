DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200505191543');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200505191543');
-- Add your query below.


-- Add missing emote when Kul Tiras Sailor charges.
DELETE FROM `creature_ai_events` WHERE `creature_id`=3128;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (312801, 3128, 0, 9, 0, 100, 0, 5, 30, 0, 0, 312801, 0, 0, 'Kul Tiras Sailor - Cast Rushing Charge');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (312802, 3128, 0, 2, 0, 100, 0, 15, 0, 0, 0, 312802, 0, 0, 'Kul Tiras Sailor - Flee at 15% HP');
DELETE FROM `creature_ai_scripts` WHERE `id`=312801;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (312801, 0, 15, 6268, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kul Tiras Sailor - Cast Spell Rushing Charge');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (312801, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 1254, 0, 0, 0, 0, 0, 0, 0, 0, 'Kul Tiras Sailor - Say Emoted Text');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
