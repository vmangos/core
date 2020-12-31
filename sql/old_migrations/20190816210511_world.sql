DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190816210511');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190816210511');
-- Add your query below.


-- Spawn position for Justin.
UPDATE `creature` SET `position_x`=-8582.03, `position_y`=633.634, `position_z`=96.338, `orientation`=4.98933 WHERE `guid`=79815;

-- Spawn position for Brandon.
UPDATE `creature` SET `position_x`=-8580.092, `position_y`=634.187, `position_z`=96.338, `orientation`=5.129, `MovementType`=0 WHERE `guid`=79817;
DELETE FROM `creature_movement` WHERE `id`=79817;

-- Spawn position for Roman.
UPDATE `creature` SET `position_x`=-8583.88, `position_y`=633.127, `position_z`=96.338, `orientation`=4.98933, `MovementType`=0 WHERE `guid`=79816;
DELETE FROM `creature_movement` WHERE `id`=79816;

-- Events list for Justin
DELETE FROM `creature_ai_events` WHERE `creature_id`=1368;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (136801, 1368, 0, 1, 0, 100, 1, 35000, 60000, 35000, 60000, 136801, 0, 0, 'Justin - Say Text OOC');
DELETE FROM `creature_ai_scripts` WHERE `id`=136801;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (136801, 0, 39, 136801, 136802, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Justin - Say Text');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (136801, 0, 39, 136803, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Brandon and Roman - Say Text');
DELETE FROM `event_scripts` WHERE `id`=136801;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (136801, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 149, 150, 151, 152, 0, 0, 0, 0, 0, 'Justin - Say Text');
DELETE FROM `event_scripts` WHERE `id`=136802;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (136802, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 153, 154, 155, 156, 0, 0, 0, 0, 0, 'Justin - Say Text');
DELETE FROM `event_scripts` WHERE `id`=136803;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (136803, 2, 39, 136804, 136805, 0, 0, 79817, 0, 9, 2, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Brandon - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (136803, 10, 39, 136806, 136807, 0, 0, 79816, 0, 9, 2, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Roman - Say Text');
DELETE FROM `event_scripts` WHERE `id`=136804;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (136804, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 147, 157, 158, 166, 0, 0, 0, 0, 0, 'Brandon - Say Text');
DELETE FROM `event_scripts` WHERE `id`=136805;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (136805, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 167, 168, 169, 170, 0, 0, 0, 0, 0, 'Brandon - Say Text');
DELETE FROM `event_scripts` WHERE `id`=136806;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (136806, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 171, 172, 173, 174, 0, 0, 0, 0, 0, 'Roman - Say Text');
DELETE FROM `event_scripts` WHERE `id`=136807;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (136807, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 175, 176, 177, 0, 0, 0, 0, 0, 0, 'Roman - Say Text');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=1368;

-- Waypoints for Justin.
DELETE FROM `creature_movement` WHERE `id`=79815;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `wander_distance`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES 
(79815, 1, -8582.03, 633.634, 96.3386, 1800000, 0, 7981501, 0, 0, 0, 0, 0, 0, 0, 5.02218, 0, 0),
(79815, 2, -8582.03, 633.634, 96.3386, 1000, 0, 7981502, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 3, -8592.9, 656.706, 98.215, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 4, -8603.73, 656.529, 98.667, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 5, -8616.8, 653.192, 98.877, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 6, -8638.93, 656.882, 101.093, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 7, -8652.71, 660.539, 100.896, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 8, -8663.02, 670.676, 100.304, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 9, -8669.88, 678.648, 99.344, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 10, -8675.11, 685.278, 98.608, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 11, -8693.1, 707.655, 97.018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 12, -8704.13, 721.515, 97.017, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 13, -8715.06, 737.284, 97.807, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 14, -8725.33, 751.855, 98.203, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 15, -8730.63, 759.914, 98.186, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 16, -8729.58, 773.227, 98.045, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 17, -8719.73, 787.05, 97.497, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 18, -8717.58, 797.687, 97.095, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 19, -8725.29, 811.882, 97.227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 20, -8727.36, 825.57, 96.71, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 21, -8724.79, 839.923, 96.092, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 22, -8714.8, 851.813, 96.761, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 23, -8708.47, 858.245, 97.006, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 24, -8698.47, 866.606, 97.081, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 25, -8691.03, 872.861, 97.017, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 26, -8680.25, 880.963, 97.017, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 27, -8660.5, 897.437, 97.581, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 28, -8660.09, 905.128, 97.394, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 29, -8667.05, 913.248, 96.338, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 30, -8673.76, 909.402, 96.338, 0, 0, 7981530, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 31, -8675.49, 909.244, 96.3384, 1800000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.80119, 0, 0),
(79815, 32, -8675.49, 909.244, 96.3384, 1000, 0, 7981502, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 33, -8667.05, 913.248, 96.338, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 34, -8660.09, 905.128, 97.394, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 35, -8660.5, 897.437, 97.581, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 36, -8680.25, 880.963, 97.017, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 37, -8691.03, 872.861, 97.017, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 38, -8698.47, 866.606, 97.081, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 39, -8708.47, 858.245, 97.006, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 40, -8714.8, 851.813, 96.761, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 41, -8724.79, 839.923, 96.092, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 42, -8727.36, 825.57, 96.71, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 43, -8725.29, 811.882, 97.227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 44, -8717.58, 797.687, 97.095, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 45, -8719.73, 787.05, 97.497, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 46, -8729.58, 773.227, 98.045, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 47, -8730.63, 759.914, 98.186, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 48, -8725.33, 751.855, 98.203, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 49, -8715.06, 737.284, 97.807, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 50, -8704.13, 721.515, 97.017, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 51, -8693.1, 707.655, 97.018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 52, -8675.11, 685.278, 98.608, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 53, -8669.88, 678.648, 99.344, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 54, -8663.02, 670.676, 100.304, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 55, -8652.71, 660.539, 100.896, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 56, -8638.93, 656.882, 101.093, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 57, -8616.8, 653.192, 98.877, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 58, -8603.73, 656.529, 98.667, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79815, 59, -8592.9, 656.706, 98.215, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Waypoint scripts for Justin.
DELETE FROM `creature_movement_scripts` WHERE `id`=7981501;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7981501, 0, 79, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Justin - Disband Creature Group');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7981501, 1, 3, 0, 0, 66, 2, 79817, 0, 9, 2, 0, 0, 0, 0, -8580.092, 634.187, 96.338, 5.129, 0, 'Brandon - Move to point');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7981501, 1, 3, 0, 0, 66, 2, 79816, 0, 9, 2, 0, 0, 0, 0, -8583.88, 633.127, 96.338, 4.98933, 0, 'Roman - Move to point');
DELETE FROM `creature_movement_scripts` WHERE `id`=7981502;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7981502, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1090, 0, 0, 0, 0, 0, 0, 0, 0, 'Justin - Say Text');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7981502, 0, 78, 1, 0, 0, 0, 79817, 0, 9, 2, 0, 0, 0, 0, 2.19769, 0, 0, 1.9, 0, 'Brandon - Follow Justin');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7981502, 0, 78, 1, 0, 0, 0, 79816, 0, 9, 2, 0, 0, 0, 0, 2.19769, 0, 0, 4.50248, 0, 'Roman - Follow Justin');
DELETE FROM `creature_movement_scripts` WHERE `id`=7981530;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7981530, 0, 79, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Justin - Disband Creature Group');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7981530, 1, 3, 0, 0, 66, 2, 79816, 0, 9, 2, 0, 0, 0, 0, -8673.38, 911.824, 96.3384, 2.25631, 0, 'Roman - Move to point');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7981530, 1, 3, 0, 0, 66, 2, 79817, 0, 9, 2, 0, 0, 0, 0, -8674.68, 910.761, 96.3384, 2.25631, 0, 'Brandon - Move to point');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
