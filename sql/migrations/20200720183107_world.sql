DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200720183107');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200720183107');
-- Add your query below.


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
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 1884;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (4716201, 1884, 4716201, 1, 0, 100, 1, 2000, 2000, 2000, 2000, 4716201, 0, 0, 'Creature GUID 47162 - Emote Talk OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4716201, 0, 39, 4716201, 4716202, 4716203, 4716201, 0, 0, 0, 0, 25, 25, 25, 25, 0, 0, 0, 0, 0, 'Creature GUID 47162 - Start Script');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4716201, 0, 1, 1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Creature GUID 47162 - Emote Talk');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4716202, 0, 1, 1, 0, 0, 0, 46782, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Creature GUID 46782 - Emote Talk');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4716203, 0, 1, 1, 0, 0, 0, 47163, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Creature GUID 47163 - Emote Talk');
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4716201, 52, 47162, 0, 0, 0, 0);
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (4716202, 1884, 4716202, 1, 0, 100, 1, 2000, 2000, 2000, 2000, 4716202, 0, 0, 'Creature GUID 47152 - Emote Talk OOC ');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4716202, 0, 39, 4716204, 4716205, 4716206, 4716202, 0, 0, 0, 0, 25, 25, 25, 25, 0, 0, 0, 0, 0, 'Creature GUID 47152 - Start Script');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4716204, 0, 1, 1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Creature GUID 47152 - Emote Talk');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4716205, 0, 1, 1, 0, 0, 0, 46781, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Creature GUID 46781 - Emote Talk');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4716206, 0, 1, 1, 0, 0, 0, 46783, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Creature GUID 46783 - Emote Talk OOC ');
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4716202, 52, 47152, 0, 0, 0, 0);

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
