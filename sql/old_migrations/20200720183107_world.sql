DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200720183107');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200720183107');
-- Add your query below.


-- northridge lumber camp
-- add chop wood emote to  scarlet lumberjack
INSERT INTO `creature_addon` (`guid`, `emote`)VALUES
(46775, 234),
(45384, 234),
(45380, 234),
(47156, 234),
(45386, 234),
(46784, 234),
(45378, 234),
(46776, 234),
(47159, 234),
(45383, 234),
(46777, 234),
(47161, 234),
(47164, 234);

-- add talk emote to scarlet lumberjack
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (188401, 52, 47162, 46782, 47163, 47152, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (188402, 52, 46781, 46783, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (188403, -2, 188401, 188402, 0, 0, 0);
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 1884;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (188401, 1884, 188403, 1, 0, 100, 1, 3000, 9000, 3000, 9000, 188401, 0, 0, 'Scarlet Lumberjack - Emote OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (188401, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Lumberjack - Emote Talk');

-- hearthglen
-- scarlet workers emote talk
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (188301, 52, 52498, 48482, 51480, 48483, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (188302, 52, 47943, 52002, 48594, 45394, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (188303, 52, 46794, 48485, 45389, 52253, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (188304, -2, 188301, 188302, 188303, 0, 0);
DELETE FROM `creature_ai_events` WHERE `creature_id`=1883;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (188301, 1883, 188304, 1, 0, 100, 1, 3000, 9000, 3000, 9000, 188301, 0, 0, 'Scarlet Worker - Emote OOC');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (188302, 1883, 0, 2, 0, 100, 0, 15, 0, 0, 0, 188302, 0, 0, 'Scarlet Worker - Flee at 15% HP');
DELETE FROM `creature_ai_scripts` WHERE `id`=188301;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (188301, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Worker - Emote Talk');
DELETE FROM `creature_ai_scripts` WHERE `id`=188302;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (188302, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Worker - Flee');
DELETE FROM `creature_ai_scripts` WHERE `id` IN (188303, 188304);
-- add attack 1h emote to  scarlet sentinel
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (182701, 1827, 182701, 1, 0, 100, 1, 3000, 9000, 3000, 9000, 182701, 0, 0, 'Scarlet Sentinel - Emote OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (182701, 0, 1, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Sentinel - Emote Attack1H');
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (182701, 52, 51745, 45396, 48624, 0, 0);

-- add attack 1h emote to  scarlet paladins
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (183401, 52, 47976, 51644, 49418, 49996, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (183402, 52, 48598, 52000, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (183403, -2, 183401, 183402, 0, 0, 0);
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (183401, 1834, 183403, 1, 0, 100, 1, 3000, 9000, 3000, 9000, 183401, 0, 0, 'Scarlet Paladin - Emote OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (183401, 0, 1, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Paladin - Emote Attack1H');

-- allow creatures to roam 
UPDATE `creature` SET `movement_type` = 1, `wander_distance` = 1 WHERE `guid` IN (52251, 48615, 51999, 52004, 48206, 48205);

-- caer darrow
-- artist renfray should roam
UPDATE `creature` SET `movement_type` = 1, `wander_distance` = 1 WHERE `guid` = 46872;

-- add missing text to artist renfray
DELETE FROM `creature_ai_scripts` WHERE `id`=1193601;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1193601, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7272, 7274, 7273, 7275, 0, 0, 0, 0, 0, 'Artist Renfray - Say Text');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
