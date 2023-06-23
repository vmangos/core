DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20221209225611');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20221209225611');
-- Add your query below.


-- 152620: GameObject 152620 Is Within 75 Yards Of The Target
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (152620, 21, 152620, 75, 0, 0, 0);
-- 152621: GameObject 152621 Is Within 75 Yards Of The Target
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (152621, 21, 152621, 75, 0, 0, 0);
-- 152622: GameObject 152622 Is Within 75 Yards Of The Target
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (152622, 21, 152622, 75, 0, 0, 0);
-- 152631: GameObject 152631 Is Within 75 Yards Of The Target
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (152631, 21, 152631, 75, 0, 0, 0);

-- Events list for Felhound Tracker
DELETE FROM `creature_ai_events` WHERE `creature_id`=8668;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (866801, 8668, 0, 11, 0, 100, 0, 0, 0, 0, 0, 866801, 0, 0, 'Felhound Tracker - Set React State to Passive on Spawn');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (866802, 8668, 0, 29, 0, 100, 1, 8, 1, 0, 0, 866802, 0, 0, 'Felhound Tracker - Follow Owner on Reaching Point');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (866803, 8668, 152620, 22, 2, 100, 1, 75, 0, 0, 0, 866803, 0, 0, 'Felhound Tracker - Run to Nearest Azsharite on Roar Emote');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (866804, 8668, 152621, 22, 2, 100, 1, 75, 0, 0, 0, 866804, 0, 0, 'Felhound Tracker - Run to Nearest Azsharite on Roar Emote');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (866805, 8668, 152622, 22, 2, 100, 1, 75, 0, 0, 0, 866805, 0, 0, 'Felhound Tracker - Run to Nearest Azsharite on Roar Emote');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (866806, 8668, 152631, 22, 2, 100, 1, 75, 0, 0, 0, 866806, 0, 0, 'Felhound Tracker - Run to Nearest Azsharite on Roar Emote');
DELETE FROM `creature_ai_scripts` WHERE `id`=866801;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(866801, 0, 0, 59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Felhound Tracker - Set React State to Passive');
DELETE FROM `creature_ai_scripts` WHERE `id`=866802;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(866802, 0, 0, 39, 866802, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Felhound Tracker - Start Script to Follow Owner');
DELETE FROM `generic_scripts` WHERE `id`=866802;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(866802, 3, 0, 88, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Felhound Tracker - Set Command State to Follow'),
(866802, 3, 1, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Felhound Tracker - Set Phase to 0');
DELETE FROM `creature_ai_scripts` WHERE `id`=866803;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(866803, 0, 0, 88, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Felhound Tracker - Set Command State to Stay'),
(866803, 0, 1, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Felhound Tracker - Set Phase to 1'),
(866803, 0, 2, 3, 2, 0, 69, 3, 152620, 80, 11, 0, 1, 0, 0, 0, 2, 0, 0, 0, 0, 'Felhound Tracker - Move to Nearest Azsharite'),
(866803, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4570, 0, 0, 0, 0, 0, 0, 0, 0, 'Felhound Tracker - Say Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=866804;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(866804, 0, 0, 88, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Felhound Tracker - Set Command State to Stay'),
(866804, 0, 1, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Felhound Tracker - Set Phase to 1'),
(866804, 0, 2, 3, 2, 0, 69, 3, 152621, 80, 11, 0, 1, 0, 0, 0, 2, 0, 0, 0, 0, 'Felhound Tracker - Move to Nearest Azsharite'),
(866804, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4570, 0, 0, 0, 0, 0, 0, 0, 0, 'Felhound Tracker - Say Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=866805;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(866805, 0, 0, 88, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Felhound Tracker - Set Command State to Stay'),
(866805, 0, 1, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Felhound Tracker - Set Phase to 1'),
(866805, 0, 2, 3, 2, 0, 69, 3, 152622, 80, 11, 0, 1, 0, 0, 0, 2, 0, 0, 0, 0, 'Felhound Tracker - Move to Nearest Azsharite'),
(866805, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4570, 0, 0, 0, 0, 0, 0, 0, 0, 'Felhound Tracker - Say Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=866806;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(866806, 0, 0, 88, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Felhound Tracker - Set Command State to Stay'),
(866806, 0, 1, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Felhound Tracker - Set Phase to 1'),
(866806, 0, 2, 3, 2, 0, 69, 3, 152631, 80, 11, 0, 1, 0, 0, 0, 2, 0, 0, 0, 0, 'Felhound Tracker - Move to Nearest Azsharite'),
(866806, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4570, 0, 0, 0, 0, 0, 0, 0, 0, 'Felhound Tracker - Say Text');
UPDATE `creature_template` SET `unit_flags`=768, `ai_name`='EventAI' WHERE `entry`=8668;

-- Remove repeatable flag from Longtooth Howler call for help.
DELETE FROM `creature_ai_events` WHERE `creature_id`=5287;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (528701, 5287, 0, 2, 0, 100, 0, 20, 1, 0, 0, 528701, 0, 0, 'Longtooth Howler - Call For Help at 20% HP');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
