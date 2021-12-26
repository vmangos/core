DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211217113644');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211217113644');
-- Add your query below.


-- Add Dark Iron gameobject spawns.
DELETE FROM `gameobject` WHERE `id` IN (147516, 147517);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`) VALUES 
(10104, 147516, 0, -6851.65, -1767.97, 253.54, 3.10665, 0, 0, 0.999847, 0.0174693, 120, 120, 1, 100),
(10108, 147516, 0, -6846.97, -1737.11, 254.38, 4.43314, 0, 0, -0.798635, 0.601815, 120, 120, 1, 100),
(10120, 147517, 0, -6798.13, -1770.21, 258.562, 3.87463, 0, 0, -0.93358, 0.358368, 120, 120, 1, 100),
(10127, 147517, 0, -6808.36, -1806.41, 261.995, 3.4383, 0, 0, -0.989016, 0.147811, 120, 120, 1, 100),
(10197, 147517, 0, -6736.38, -1790.24, 262.121, 1.97222, 0, 0, 0.833885, 0.551938, 120, 120, 1, 100),
(10227, 147517, 0, -6760, -1825.31, 259.777, 0.994837, 0, 0, 0.477159, 0.878817, 120, 120, 1, 100);

-- Add Singed Letter gameobject spawn.
DELETE FROM `gameobject` WHERE `id`=175704;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`) VALUES
(10106, 175704, 0, -6386.894, -1984.05054, 246.730042, 5.00909472, 0, 0, -0.5948229, 0.8038568, -300, -300, 1, 100);

-- Start script for quest Suntara Stones.
DELETE FROM `quest_start_scripts` WHERE `id`=3367;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(3367, 0, 61, 3367, 900, 0, 0, 0, 0, 0, 8, 0, 336700, 6303, 336701, 0, 0, 0, 0, 0, 'Suntara Stones: Start Scripted Map Event'),
(3367, 1, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Suntara Stones: Dorius Stonetender - Stand Up'),
(3367, 1, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Suntara Stones: Dorius Stonetender - Set Walk'),
(3367, 1, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Suntara Stones: Dorius Stonetender - Remove Npc Flags'),
(3367, 1, 4, 46, 512, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Suntara Stones: Dorius Stonetender - Remove Unit Flags'),
(3367, 1, 60, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Suntara Stones: Dorius Stonetender - Start Waypoints');
UPDATE `quest_template` SET `StartScript`=3367 WHERE `entry`=3367;

-- Script when event is successful.
DELETE FROM `generic_scripts` WHERE `id`=336700;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(336700, 0, 7, 3367, 100, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Suntara Stones: Complete Quest');

-- Script when the event fails.
DELETE FROM `generic_scripts` WHERE `id`=336701;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(336701, 0, 70, 3367, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Suntara Stones: Fail Quest'),
(336701, 0, 71, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Suntara Stones: Dorius Stonetender - Respawn');

-- Events list for Dorius Stonetender
DELETE FROM `creature_addon` WHERE `guid`=6823;
DELETE FROM `creature_ai_events` WHERE `creature_id`=8284;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(828401, 8284, 0, 4, 0, 100, 0, 0, 0, 0, 0, 828401, 0, 0, 'Dorius Stonetender - Say Text on Aggro'),
(828402, 8284, 0, 11, 0, 100, 1, 0, 0, 0, 0, 828402, 0, 0, 'Dorius Stonetender - Set Stand State on Spawn');
DELETE FROM `creature_ai_scripts` WHERE `id`=828401;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(828401, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4351, 4352, 4353, 0, 0, 0, 0, 0, 0, 'Dorius Stonetender - Say Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=828402;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(828402, 0, 4, 46, 768, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dorius Stonetender - Add Unit Flags'),
(828402, 0, 28, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dorius Stonetender - Set Stand State to Dead');
UPDATE `creature_template` SET `unit_flags`=768, `ai_name`='EventAI', `script_name`='' WHERE `entry`=8284;

-- Remove old waypoints for Dorius Stonetender.
DELETE FROM `script_waypoint` WHERE `entry`=8284;

-- Waypoints for Dorius Stonetender.
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(8284, 1, -7007.205078, -1749.161133, 234.181778, 100.000000, 0, 0.000000, 0),
(8284, 2, -7007.295410, -1743.095337, 234.207687, 100.000000, 0, 0.000000, 0),
(8284, 3, -7007.364746, -1739.057373, 234.223450, 100.000000, 0, 0.000000, 0),
(8284, 4, -7007.536621, -1734.993774, 234.223450, 100.000000, 0, 0.000000, 0),
(8284, 5, -7006.327637, -1727.702393, 234.153198, 100.000000, 0, 0.000000, 0),
(8284, 6, -7003.400879, -1726.250000, 234.586075, 100.000000, 0, 0.000000, 0),
(8284, 7, -6997.156250, -1730.394531, 236.955673, 100.000000, 0, 0.000000, 0),
(8284, 8, -6978.939453, -1736.749268, 241.820663, 100.000000, 0, 0.000000, 0),
(8284, 9, -6970.934570, -1737.743896, 241.846573, 100.000000, 0, 0.000000, 0),
(8284, 10, -6954.874512, -1739.480469, 241.743652, 100.000000, 0, 0.000000, 0),
(8284, 11, -6939.103516, -1737.898926, 241.129120, 100.000000, 0, 0.000000, 0),
(8284, 12, -6934.981445, -1732.661011, 241.678406, 100.000000, 0, 0.000000, 0),
(8284, 13, -6933.888184, -1724.685913, 241.962982, 100.000000, 0, 0.000000, 0),
(8284, 14, -6933.885254, -1720.591553, 242.006943, 100.000000, 0, 0.000000, 0),
(8284, 15, -6926.519531, -1717.737915, 242.145981, 100.000000, 0, 0.000000, 0),
(8284, 16, -6914.446777, -1716.972412, 241.820068, 100.000000, 0, 0.000000, 0),
(8284, 17, -6902.797852, -1720.004883, 242.145004, 100.000000, 0, 0.000000, 0),
(8284, 18, -6867.254395, -1747.908081, 249.847931, 100.000000, 0, 0.000000, 0),
(8284, 19, -6856.326660, -1751.043213, 251.591064, 100.000000, 10000, 0.000000, 828419),
(8284, 20, -6859.308594, -1734.536987, 251.846069, 100.000000, 0, 0.000000, 0),
(8284, 21, -6861.288574, -1722.772827, 251.841339, 100.000000, 0, 0.000000, 0),
(8284, 22, -6859.838867, -1714.911255, 251.584854, 100.000000, 0, 0.000000, 0),
(8284, 23, -6854.809082, -1703.922974, 250.846069, 100.000000, 0, 0.000000, 0),
(8284, 24, -6850.070313, -1692.841919, 250.883072, 100.000000, 0, 0.000000, 0),
(8284, 25, -6845.723145, -1686.133423, 251.448837, 100.000000, 0, 0.000000, 0),
(8284, 26, -6839.424805, -1681.599731, 251.521973, 100.000000, 0, 0.000000, 0),
(8284, 27, -6831.694336, -1679.259277, 251.578568, 100.000000, 0, 0.000000, 0),
(8284, 28, -6824.018066, -1676.799683, 251.577133, 100.000000, 0, 0.000000, 0),
(8284, 29, -6816.517578, -1672.656250, 250.886337, 100.000000, 5000, 0.000000, 828429),
(8284, 30, -6816.517578, -1672.656250, 250.886337, 5.480784, 3000, 0.000000, 828430),
(8284, 31, -6811.430664, -1678.824829, 250.200073, 100.000000, 0, 0.000000, 0),
(8284, 32, -6808.890137, -1681.942017, 250.377975, 100.000000, 0, 0.000000, 0),
(8284, 33, -6806.927734, -1684.988770, 251.971558, 100.000000, 0, 0.000000, 0),
(8284, 34, -6805.111328, -1688.004150, 253.964630, 100.000000, 0, 0.000000, 0),
(8284, 35, -6800.683594, -1694.438721, 257.765472, 100.000000, 0, 0.000000, 0),
(8284, 36, -6793.520508, -1702.757568, 259.558350, 100.000000, 0, 0.000000, 0),
(8284, 37, -6788.359375, -1708.960083, 259.560852, 100.000000, 0, 0.000000, 0),
(8284, 38, -6782.738770, -1719.612183, 259.560852, 100.000000, 0, 0.000000, 0),
(8284, 39, -6778.868164, -1731.107666, 259.560852, 100.000000, 0, 0.000000, 0),
(8284, 40, -6777.435547, -1739.098022, 259.672424, 100.000000, 0, 0.000000, 0),
(8284, 41, -6776.022949, -1759.095459, 257.796906, 100.000000, 0, 0.000000, 0),
(8284, 42, -6776.070801, -1767.136597, 257.066895, 100.000000, 0, 0.000000, 0),
(8284, 43, -6776.478027, -1779.274902, 256.961426, 100.000000, 0, 0.000000, 0),
(8284, 44, -6776.106445, -1783.227539, 256.961426, 100.000000, 0, 0.000000, 0),
(8284, 45, -6774.146973, -1791.145508, 256.961426, 100.000000, 5000, 0.000000, 828445),
(8284, 46, -6757.969727, -1803.382690, 256.479004, 100.000000, 0, 0.000000, 0),
(8284, 47, -6747.044434, -1808.286865, 254.797501, 100.000000, 0, 0.000000, 0),
(8284, 48, -6735.710449, -1812.271973, 253.739304, 100.000000, 0, 0.000000, 0),
(8284, 49, -6727.854492, -1814.080200, 253.425323, 100.000000, 0, 0.000000, 0),
(8284, 50, -6711.748535, -1815.840332, 251.646271, 100.000000, 5000, 0.000000, 828450),
(8284, 51, -6703.762207, -1816.575806, 250.787674, 100.000000, 0, 0.000000, 0),
(8284, 52, -6695.636719, -1817.553101, 249.971466, 100.000000, 0, 0.000000, 0),
(8284, 53, -6687.564453, -1819.759766, 249.513290, 100.000000, 0, 0.000000, 0),
(8284, 54, -6673.954102, -1827.933472, 249.448181, 100.000000, 0, 0.000000, 0),
(8284, 55, -6667.733887, -1832.808228, 248.312424, 100.000000, 0, 0.000000, 0),
(8284, 56, -6653.172852, -1850.701050, 246.358078, 100.000000, 0, 0.000000, 0),
(8284, 57, -6645.001465, -1863.972412, 244.244980, 100.000000, 0, 0.000000, 0),
(8284, 58, -6636.664551, -1877.679688, 244.235214, 100.000000, 0, 0.000000, 0),
(8284, 59, -6629.192383, -1891.827759, 244.300476, 100.000000, 0, 0.000000, 0),
(8284, 60, -6612.099609, -1908.935181, 245.263168, 100.000000, 0, 0.000000, 0),
(8284, 61, -6598.986328, -1916.171021, 244.338608, 100.000000, 0, 0.000000, 0),
(8284, 62, -6575.387695, -1922.094727, 244.275940, 100.000000, 0, 0.000000, 0),
(8284, 63, -6553.863281, -1932.544556, 244.326828, 100.000000, 0, 0.000000, 0),
(8284, 64, -6536.433594, -1948.984253, 245.139648, 100.000000, 0, 0.000000, 0),
(8284, 65, -6525.164063, -1960.216064, 245.545792, 100.000000, 0, 0.000000, 0),
(8284, 66, -6510.726074, -1966.823364, 245.000198, 100.000000, 0, 0.000000, 0),
(8284, 67, -6494.980469, -1969.914551, 244.340897, 100.000000, 0, 0.000000, 0),
(8284, 68, -6470.790039, -1967.939453, 244.497070, 100.000000, 0, 0.000000, 0),
(8284, 69, -6462.786133, -1967.909180, 245.099472, 100.000000, 0, 0.000000, 0),
(8284, 70, -6448.443359, -1973.592773, 244.814438, 100.000000, 0, 0.000000, 0),
(8284, 71, -6426.075195, -1978.520264, 246.361267, 100.000000, 0, 0.000000, 0),
(8284, 72, -6409.959961, -1978.443359, 247.567429, 100.000000, 0, 0.000000, 0),
(8284, 73, -6401.834961, -1978.499023, 247.823593, 100.000000, 0, 0.000000, 0),
(8284, 74, -6388.764648, -1983.479614, 246.832718, 100.000000, 251000, 0.000000, 828474),
(8284, 75, -6388.764648, -1983.479614, 246.832718, 100.000000, 1000, 0.000000, 0);

-- Waypoint scripts for Dorius Stonetender.
DELETE FROM `creature_movement_scripts` WHERE `id`=828419;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(828419, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4345, 0, 0, 0, 0, 0, 0, 0, 0, 'Suntara Stones: Dorius Stonetender - Say Text'),
(828419, 0, 28, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Suntara Stones: Dorius Stonetender - Kneel'),
(828419, 4, 13, 0, 0, 0, 0, 10104, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Suntara Stones: Dark Iron - Activate GameObject'),
(828419, 4, 13, 0, 0, 0, 0, 10108, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Suntara Stones: Dark Iron - Activate GameObject');
DELETE FROM `creature_movement_scripts` WHERE `id`=828429;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(828429, 3, 0, 0, 0, 0, 0, 3367, 0, 21, 0, 4354, 0, 0, 0, 0, 0, 0, 0, 0, 'Suntara Stones: Dorius Stonetender - Say Text'),
(828429, 3, 1, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Suntara Stones: Dorius Stonetender - Emote OneShotPoint');
DELETE FROM `creature_movement_scripts` WHERE `id`=828430;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(828430, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4355, 0, 0, 0, 0, 0, 0, 0, 0, 'Suntara Stones: Dorius Stonetender - Say Text'),
(828430, 0, 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Suntara Stones: Dorius Stonetender - Emote OneShotExclamation');
DELETE FROM `creature_movement_scripts` WHERE `id`=828445;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(828445, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4356, 0, 0, 0, 0, 0, 0, 0, 0, 'Suntara Stones: Dorius Stonetender - Say Text'),
(828445, 2, 35, 0, 0, 0, 0, 3367, 0, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Suntara Stones: Dorius Stonetender - Turn to Event Target'),
(828445, 3, 1, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Suntara Stones: Dorius Stonetender - Emote OneShotKneel'),
(828445, 4, 13, 0, 0, 0, 0, 10120, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Suntara Stones: Dark Iron - Activate GameObject'),
(828445, 4, 13, 0, 0, 0, 0, 10127, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Suntara Stones: Dark Iron - Activate GameObject'),
(828445, 4, 13, 0, 0, 0, 0, 10197, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Suntara Stones: Dark Iron - Activate GameObject'),
(828445, 4, 13, 0, 0, 0, 0, 10227, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Suntara Stones: Dark Iron - Activate GameObject');
DELETE FROM `creature_movement_scripts` WHERE `id`=828450;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(828450, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Suntara Stones: Dorius Stonetender - Set Run'),
(828450, 4, 35, 0, 0, 0, 0, 3367, 0, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Suntara Stones: Dorius Stonetender - Turn to Event Target'),
(828450, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4357, 0, 0, 0, 0, 0, 0, 0, 0, 'Suntara Stones: Dorius Stonetender - Say Text');
DELETE FROM `creature_movement_scripts` WHERE `id`=828474;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(828474, 0, 20, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Suntara Stones: Dorius Stonetender - Move Idle'),
(828474, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4363, 0, 0, 0, 0, 0, 0, 0, 0, 'Suntara Stones: Dorius Stonetender - Say Text'),
(828474, 0, 10, 8338, 9313, 0, 0, 0, 0, 0, 0, 0, 336702, -1, 1, -6369.84, -1974.87, 256.843, 3.54302, 0, 'Suntara Stones: Summon Creature Dark Iron Marksman'),
(828474, 0, 18, 250000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Suntara Stones: Dorius Stonetender - Despawn in 250 seconds'),
(828474, 6, 1, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Suntara Stones: Dorius Stonetender - Emote OneShotWoundCritical'),
(828474, 6, 15, 12218, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Suntara Stones: Dorius Stonetender - Cast Spell Man Down!'),
(828474, 7, 4, 46, 512, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Suntara Stones: Dorius Stonetender - Add Unit Flags'),
(828474, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4359, 0, 0, 0, 0, 0, 0, 0, 0, 'Suntara Stones: Dorius Stonetender - Say Text'),
(828474, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5944, 0, 0, 0, 0, 0, 0, 0, 0, 'Suntara Stones: Dorius Stonetender - Say Text'),
(828474, 8, 9, 10106, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Suntara Stones: Singed Letter - Respawn GameObject'),
(828474, 8, 62, 3367, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Suntara Stones: Complete Scripted Map Event'),
(828474, 9, 28, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Suntara Stones: Dorius Stonetender - Set Stand State to Dead');

-- Spawn script for Dark Iron Marksman.
DELETE FROM `generic_scripts` WHERE `id`=336702;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(336702, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4358, 0, 0, 0, 0, 0, 0, 0, 0, 'Suntara Stones: Dark Iron Marksman - Say Text'),
(336702, 3, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.56838, 0, 'Suntara Stones: Dark Iron Marksman - Set Orientation'),
(336702, 3, 15, 12198, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Suntara Stones: Dark Iron Marksman - Cast Spell Marksman Hit'),
(336702, 9, 15, 12244, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Suntara Stones: Dark Iron Marksman - Cast Spell Poof');

-- Correct data for Dark Iron Marksman.
UPDATE `creature_template` SET `unit_flags`=768, `base_attack_time`=2000 WHERE `entry`=8338;

-- This text should be yelled.
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=4358;

-- 3367: Scripted Map Event 3367 Is Active
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (3367, 36, 3367, 0, 0, 0, 0);

-- Events list for Dark Iron Steelshifter
DELETE FROM `creature_ai_events` WHERE `creature_id`=8337;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (833701, 8337, 3367, 11, 0, 100, 0, 0, 0, 0, 0, 833701, 0, 0, 'Dark Iron Steelshifter - Run to Dorius Stonetender on Spawn');
DELETE FROM `creature_ai_scripts` WHERE `id`=833701;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (833701, 0, 3, 2, 0, 5, 0, 3367, 0, 20, 0, 0, 0, 0, 0, 3, 0, 0, -1, 0, 'Dark Iron Steelshifter - Run to Dorius Stonetender');
UPDATE `creature_template` SET `ai_name`='EventAI', `base_attack_time`=2000 WHERE `entry`=8337;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
