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
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (6901, 69, 0, 1, 0, 10, 1, 60000, 600000, 120000, 600000, 6901, 0, 0, 'Diseased Timber Wolf - Howl and Emote OOC');

DELETE FROM `creature_ai_scripts` WHERE `id`=6901;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(6901, 0, 0, 16, 1018, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Timber Wolf - Play Sound 1018'),
(6901, 0, 0, 1, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Timber Wolf - Emote 15');

-- Events list for Young Wolf
DELETE FROM `creature_ai_events` WHERE `creature_id`=299;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (29901, 299, 0, 1, 0, 10, 1, 30000, 600000, 120000, 600000, 29901, 0, 0, 'Young Wolf - Howl and Emote OOC');

DELETE FROM `creature_ai_scripts` WHERE `id`=29901;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(29901, 0, 0, 16, 1018, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Young Wolf - Play Sound 1018'),
(29901, 0, 0, 1, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Young Wolf - Emote 15');

-- Events list for Coyote
DELETE FROM `creature_ai_events` WHERE `creature_id`=834;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (83401, 834, 0, 1, 0, 10, 1, 30000, 600000, 120000, 600000, 83401, 0, 0, 'Coyote - Howl and Emote OOC');

DELETE FROM `creature_ai_scripts` WHERE `id`=83401;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(83401, 0, 0, 16, 1018, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Coyote - Play Sound 1018'),
(83401, 0, 0, 1, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Coyote - Emote 15');

-- Events list for Young Scavenger
DELETE FROM `creature_ai_events` WHERE `creature_id`=1508;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (150801, 1508, 0, 1, 0, 10, 1, 30000, 600000, 120000, 600000, 150801, 0, 0, 'Young Scavenger - Howl and Emote OOC');

DELETE FROM `creature_ai_scripts` WHERE `id`=150801;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(150801, 0, 0, 16, 1018, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Young Scavenger - Play Sound 1018'),
(150801, 0, 0, 1, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Young Scavenger - Emote 15');

-- Events list for Ragged Scavenger
DELETE FROM `creature_ai_events` WHERE `creature_id`=1509;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (150901, 1509, 0, 1, 0, 10, 1, 30000, 600000, 120000, 600000, 150901, 0, 0, 'Ragged Scavenger - Howl and Emote OOC');

DELETE FROM `creature_ai_scripts` WHERE `id`=150901;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(150901, 0, 0, 16, 1018, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ragged Scavenger - Play Sound 1018'),
(150901, 0, 0, 1, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ragged Scavenger - Emote 15');

-- Events list for Gray Forest Wolf
DELETE FROM `creature_ai_events` WHERE `creature_id`=1922;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (192201, 1922, 0, 1, 0, 10, 1, 120000, 600000, 120000, 600000, 192201, 0, 0, 'Gray Forest Wolf - Howl and Emote OOC');

DELETE FROM `creature_ai_scripts` WHERE `id`=192201;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(192201, 0, 0, 16, 1018, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gray Forest Wolf - Play Sound 1018'),
(192201, 0, 0, 1, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gray Forest Wolf - Emote 15');

-- Events list for Elder Crag Coyote
DELETE FROM `creature_ai_events` WHERE `creature_id`=2729;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (272901, 2729, 0, 1, 0, 5, 1, 30000, 600000, 120000, 600000, 272901, 0, 0, 'Elder Crag Coyote - Howl and Emote OOC');

DELETE FROM `creature_ai_scripts` WHERE `id`=272901;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(272901, 0, 0, 16, 1018, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Elder Crag Coyote - Play Sound 1018'),
(272901, 0, 0, 1, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Elder Crag Coyote - Emote 15');

-- Events list for Prairie Wolf
DELETE FROM `creature_ai_events` WHERE `creature_id`=2958;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (295801, 2958, 0, 1, 0, 5, 1, 60000, 600000, 120000, 600000, 295801, 0, 0, 'Prairie Wolf - Howl and Emote OOC');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (295802, 2958, 0, 9, 0, 100, 1, 0, 5, 45000, 45000, 295802, 0, 0, 'Prairie Wolf - Cast Threatening Growl');

DELETE FROM `creature_ai_scripts` WHERE `id`=295801;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(295801, 0, 0, 16, 1018, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Prairie Wolf - Play Sound 1018'),
(295801, 0, 0, 1, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Prairie Wolf - Emote 15');

-- Events list for Prairie Stalker
DELETE FROM `creature_ai_events` WHERE `creature_id`=2959;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (295901, 2959, 0, 1, 0, 5, 1, 60000, 600000, 120000, 600000, 295901, 0, 0, 'Prairie Stalker - Howl and Emote OOC');

DELETE FROM `creature_ai_scripts` WHERE `id`=295901;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(295901, 0, 0, 16, 1018, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Prairie Stalker - Play Sound 1018'),
(295901, 0, 0, 1, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Prairie Stalker - Emote 15');

-- Events list for Prairie Wolf Alpha
DELETE FROM `creature_ai_events` WHERE `creature_id`=2960;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (296001, 2960, 0, 1, 0, 5, 1, 60000, 600000, 120000, 600000, 296001, 0, 0, 'Prairie Wolf Alpha - Howl and Emote OOC');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (296002, 2960, 0, 9, 0, 100, 1, 0, 5, 45000, 45000, 296002, 0, 0, 'Prairie Wolf Alpha - Cast Threatening Growl');

DELETE FROM `creature_ai_scripts` WHERE `id`=296001;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(296001, 0, 0, 16, 1018, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Prairie Wolf Alpha - Play Sound 1018'),
(296001, 0, 0, 1, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Prairie Wolf Alpha - Emote 15');

-- Events list for Longtooth Howler
DELETE FROM `creature_ai_events` WHERE `creature_id`=5287;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (528701, 5287, 0, 2, 0, 100, 1, 20, 0, 0, 0, 528701, 0, 0, 'Longtooth Howler - Howl and Emote and Call For Help at 20% HP');

DELETE FROM `creature_ai_scripts` WHERE `id`=528701;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(528701, 0, 0, 16, 1018, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Longtooth Howler - Play Sound 1018'),
(528701, 0, 0, 1, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Longtooth Howler - Emote 15'),
(528701, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 0, 0, 0, 0, 'Longtooth Howler - Call for Help');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
