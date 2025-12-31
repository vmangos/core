DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20251204140338');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20251204140338');
-- Add your query below.


/*
 World of Warcraft Client Patch 1.3.0 (2005-03-22)
 - Yeti will no longer flee when at low health.
*/

-- 4020: Content Patch Is Equal Or Less Than 1.2
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4020, 24, 0, 2, 0, 0, 0);

-- Events list for Cave Yeti
DELETE FROM `creature_ai_events` WHERE `creature_id`=2248;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(224801, 2248, 4020, 2, 0, 100, 0, 15, 0, 0, 0, 224801, 0, 0, 'Cave Yeti - Flee at 15% HP (Before 1.3)');
DELETE FROM `creature_ai_scripts` WHERE `id`=224801;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(224801, 0, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cave Yeti - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2248;

-- Events list for Mountain Yeti
DELETE FROM `creature_ai_events` WHERE `creature_id`=2250;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(225001, 2250, 4020, 2, 0, 100, 0, 15, 0, 0, 0, 225001, 0, 0, 'Mountain Yeti - Flee at 15% HP (Before 1.3)');
DELETE FROM `creature_ai_scripts` WHERE `id`=225001;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(225001, 0, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mountain Yeti - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2250;

-- Events list for Giant Yeti
DELETE FROM `creature_ai_events` WHERE `creature_id`=2251;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(225101, 2251, 4020, 2, 0, 100, 0, 15, 0, 0, 0, 225101, 0, 0, 'Giant Yeti - Flee at 15% HP (Before 1.3)');
DELETE FROM `creature_ai_scripts` WHERE `id`=225101;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(225101, 0, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Giant Yeti - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2251;

-- Events list for Feral Scar Yeti
DELETE FROM `creature_ai_events` WHERE `creature_id`=5292;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(529201, 5292, 4020, 2, 0, 100, 0, 15, 0, 0, 0, 529201, 0, 0, 'Feral Scar Yeti - Flee at 15% HP (Before 1.3)');
DELETE FROM `creature_ai_scripts` WHERE `id`=529201;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(529201, 0, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Feral Scar Yeti - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=5292;

-- Events list for Ice Thistle Yeti
DELETE FROM `creature_ai_events` WHERE `creature_id`=7458;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(745801, 7458, 4020, 2, 0, 100, 0, 15, 0, 0, 0, 745801, 0, 0, 'Ice Thistle Yeti - Flee at 15% HP (Before 1.3)');
DELETE FROM `creature_ai_scripts` WHERE `id`=745801;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(745801, 0, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ice Thistle Yeti - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=7458;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
