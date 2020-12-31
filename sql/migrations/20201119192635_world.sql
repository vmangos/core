DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201119192635');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201119192635');
-- Add your query below.


-- Events list for Mottled Boar
DELETE FROM `creature_ai_events` WHERE `creature_id`=3098;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (309801, 3098, 3098, 10, 0, 100, 1, 1, 5, 10000, 10000, 309801, 0, 0, 'Mottled Boar - Run Away on Player In Combat Approaching');
DELETE FROM `creature_ai_scripts` WHERE `id`=309801;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (309801, 0, 3, 2, 1000, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 'Mottled Boar - Run Away');
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (3098, -1, 85, 119, 0, 0, 0);
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3098;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
