DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20221106005233');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20221106005233');
-- Add your query below.

-- Events list for Timber Wolf
DELETE FROM `creature_ai_events` WHERE `creature_id`=69;
DELETE FROM `creature_ai_scripts` WHERE `id`=6901;

-- Events list for Young Wolf
DELETE FROM `creature_ai_events` WHERE `creature_id`=299;
DELETE FROM `creature_ai_scripts` WHERE `id`=29901;

-- Events list for Coyote
DELETE FROM `creature_ai_events` WHERE `creature_id`=834;
DELETE FROM `creature_ai_scripts` WHERE `id`=83401;

-- Events list for Young Scavenger
DELETE FROM `creature_ai_events` WHERE `creature_id`=1508;
DELETE FROM `creature_ai_scripts` WHERE `id`=150801;

-- Events list for Ragged Scavenger
DELETE FROM `creature_ai_events` WHERE `creature_id`=1509;
DELETE FROM `creature_ai_scripts` WHERE `id`=150901;

-- Events list for Gray Forest Wolf
DELETE FROM `creature_ai_events` WHERE `creature_id`=1922;
DELETE FROM `creature_ai_scripts` WHERE `id`=192201;

-- Events list for Elder Crag Coyote
DELETE FROM `creature_ai_events` WHERE `creature_id`=2729;
DELETE FROM `creature_ai_scripts` WHERE `id`=272901;

-- Events list for Prairie Wolf
DELETE FROM `creature_ai_events` WHERE `creature_id`=2958;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (295801, 2958, 0, 9, 0, 100, 1, 0, 5, 45000, 45000, 295801, 0, 0, 'Prairie Wolf - Cast Threatening Growl');

DELETE FROM `creature_ai_scripts` WHERE `id`=295801;
DELETE FROM `creature_ai_scripts` WHERE `id`=295802;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(295801, 0, 0, 15, 5781, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Prairie Wolf - Cast Spell Threatening Growl');

-- Events list for Prairie Stalker
DELETE FROM `creature_ai_events` WHERE `creature_id`=2959;
DELETE FROM `creature_ai_scripts` WHERE `id`=295901;

-- Events list for Prairie Wolf Alpha
DELETE FROM `creature_ai_events` WHERE `creature_id`=2960;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (296001, 2960, 0, 9, 0, 100, 1, 0, 5, 45000, 45000, 296001, 0, 0, 'Prairie Wolf Alpha - Cast Threatening Growl');

DELETE FROM `creature_ai_scripts` WHERE `id`=296001;
DELETE FROM `creature_ai_scripts` WHERE `id`=296002;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(296001, 0, 0, 15, 5781, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Prairie Wolf Alpha - Cast Spell Threatening Growl');

-- Events list for Longtooth Howler
DELETE FROM `creature_ai_events` WHERE `creature_id`=5287;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (528701, 5287, 0, 2, 0, 100, 1, 20, 0, 0, 0, 528701, 0, 0, 'Longtooth Howler - Call For Help at 20% HP');

DELETE FROM `creature_ai_scripts` WHERE `id`=528701;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(528701, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 0, 0, 0, 0, 'Longtooth Howler - Call for Help');


-- Remove references to event_ai for creatures that no longer have events
UPDATE `creature_template` SET `ai_name`='' WHERE `entry` IN (69, 299, 834, 1508, 1509, 1922, 2729, 2959); 

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
