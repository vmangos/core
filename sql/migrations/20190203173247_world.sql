DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190203173247');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190203173247');
-- Add your query below.


-- Fizzles
DELETE FROM `creature` WHERE `guid` = 90184 AND `id` = 1419;
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(90184, 1419, 0, 0, 0, -8994.19, 947.069, 118.348, 4.29351, 180, 180, 0, 0, 100, 0, 0, 0);

-- Gil - Added two OOC texts
-- https://wow.gamepedia.com/Gil
DELETE FROM `creature_ai_scripts` WHERE `id` IN (350401, 350402);
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(350401, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1092, 1099, 1098, 1093, 0, 0, 0, 0, 0, 'Gil - Say Text'),
(350402, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1100, 1094, 1097, 1095, 0, 0, 0, 0, 0, 'Gil - Say Text');

DELETE FROM `conditions` WHERE `condition_entry` = 3504;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
(3504, 20, 1307, 20, 0, 0, 3);

DELETE FROM `creature_ai_events` WHERE `creature_id` = 3504;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(350401, 3504, 3504, 1, 0, 100, 1, 0, 0, 180000, 180000, 350401, 0, 0, 'Gil - Random Say 1'),
(350402, 3504, 3504, 1, 0, 100, 1, 60000, 60000, 180000, 180000, 350402, 0, 0, 'Gil - Random Say 2');

UPDATE `creature` SET `MovementType` = 0 WHERE `guid` IN (90440, 90443);
DELETE FROM `creature_movement` WHERE `id` IN (90440, 90443);
UPDATE `creature_movement` SET `textid1` = 0 WHERE `point` IN (28, 29, 30) AND `id` = 90439;
UPDATE `creature_movement` SET `waittime` = 0 WHERE `point` IN (28, 30) AND `id` = 90439;
UPDATE `creature_movement` SET `waittime` = 20000, `script_id` = 233001 WHERE `point` = 29 AND `id` = 90439;

DELETE FROM `creature_movement_scripts` WHERE `id` = 233001;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(233001, 1, 35, 1, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 1.127396, 0, 'Karlee Chaddis - Set Orientation'),
(233001, 3, 35, 1, 0, 0, 0, 90440, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 1.176093, 0, 'Karlee Chaddis - Set Orientation (Paige Chaddis)'),
(233001, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 587, 0, 0, 0, 0, 0, 0, 0, 0, 'Karlee Chaddis - Say Text'),
(233001, 8, 0, 0, 0, 0, 0, 90440, 0, 9, 2, 588, 0, 0, 0, 0, 0, 0, 0, 0, 'Karlee Chaddis - Say Text (Paige Chaddis)'),
(233001, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 589, 0, 0, 0, 0, 0, 0, 0, 0, 'Karlee Chaddis - Say Text'),
(233001, 15, 0, 0, 0, 0, 0, 90443, 0, 9, 2, 1091, 0, 0, 0, 0, 0, 0, 0, 0, 'Karlee Chaddis - Say Text (Gil)'),
(233001, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 590, 0, 0, 0, 0, 0, 0, 0, 0, 'Karlee Chaddis - Say Text');

DELETE FROM `creature_groups` WHERE `leader_guid` = 90439;
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES 
(90439, 90439, 0, 0, 1),
(90439, 90443, 2, 285, 1),
(90439, 90440, 1, 92, 1);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
