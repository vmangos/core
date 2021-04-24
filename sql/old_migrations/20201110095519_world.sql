DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201110095519');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201110095519');
-- Add your query below.


-- add emotes to Silverwing Elite
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1471501, 52, 32710, 32711, 32712, 32713, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1471502, 52, 32706, 32707, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1471503, -2, 1471501, 1471502, 0, 0, 0);
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1471502, 14715, 1471503, 1, 0, 100, 1, 12000, 22000, 12000, 22000, 1471502, 0, 0, 'Silverwing Elite - Emote OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1471502, 0, 39, 1471502, 1471503, 0, 0, 0, 0, 0, 4, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Silverwing Elite - Start Script');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1471502, 0, 1, 1, 5, 6, 11, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Silverwing Elite - Emote');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1471503, 0, 1, 273, 274, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Silverwing Elite - Emote');

INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1471504, 52, 32711, 0, 0, 0, 0);
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1471503, 14715, 1471504, 1, 0, 100, 1, 0, 0, 60000, 60000, 1471503, 0, 0, 'Silverwing Elite - Emote OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1471503, 0, 68, 1471504, 2, 14715, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Silverwing Elite - Start Script For All');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1471504, 0, 1, 66, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Silverwing Elite - Emote OOC');

-- correct position and movement for Dagri
UPDATE `creature` SET `position_x` = 2765.12, `position_y` = -412.961, `position_z` = 111.471, `movement_type` = 1, `wander_distance` = 3 WHERE `guid` = 32389;

-- add missing Auberdine Sentinel
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(85479, 6086, 0, 0, 0, 1, 6419.39, 490.11, 7.84875, 1.96054, 275, 275, 10, 100, 0, 1, 0, 0, 0, 10);

-- allow Sentinel Glynda to roam
 UPDATE `creature` SET `movement_type` = 1, `wander_distance` = 3 WHERE `guid` = 37103;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
