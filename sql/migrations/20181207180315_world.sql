DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181207180315');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181207180315');
-- Add your query below.


-- Mogg and Pooka
UPDATE `creature_template` SET `equipment_id` = 14908 WHERE `entry` = 14908;

UPDATE `creature` SET `spawndist` = 0, `MovementType` = 2 WHERE `guid` = 13964 AND `id` = 14908;
DELETE FROM `creature_movement` WHERE `id` = 13964;

DELETE FROM `creature_equip_template` WHERE `entry` = 14908;
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES
(14908, 3350, 0, 0);

DELETE FROM `creature_movement_template` WHERE `entry` = 14908;
INSERT INTO `creature_movement_template` (`entry`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`waittime`,`script_id`,`textid1`) VALUES 
(14908,1,1022.24,-2235.11,93.3114, 0, 0, 0, 0),
(14908,2,1023.37,-2238.18,92.3744, 0, 0, 0, 0),
(14908,3,1024.2,-2243.96,92.4697, 0, 0, 0, 0),
(14908,4,1022.05,-2244.86,92.3385, 0, 0, 0, 0),
(14908,5,1020.21,-2242.92,92.2321, 2.642854, 8000, 1490801, 0),
(14908,6,1034.19,-2250.56,92.8656, 5.423162, 6000, 1490802, 0),
(14908,7,1033.85,-2258.61,93.6338, 5.976867, 5000, 1490803, 0),
(14908,8,1037.68,-2262.02,93.8145, 0, 0, 0, 0),
(14908,9,1036.96,-2269.7,93.7554, 0, 0, 0, 10297),
(14908,10,1042,-2273.46,93.6932, 0, 0, 0, 0),
(14908,11,1042.7,-2275.52,93.5781, 0, 0, 0, 0),
(14908,12,1046.52,-2274.46,93.6045, 0, 0, 0, 0),
(14908,13,1050.26,-2270.44,93.4986, 0, 0, 0, 0),
(14908,14,1049.74,-2266.86,93.3475, 0, 0, 0, 0),
(14908,15,1048.05,-2263.53,93.2249, 0, 0, 0, 0),
(14908,16,1041.05,-2258.77,93.4525, 0, 0, 0, 0),
(14908,17,1039.14,-2253.68,92.9611, 100, 6000, 1490804, 0),
(14908,18,1032.8,-2253.55,93.3633, 0, 0, 0, 0),
(14908,19,1025.83,-2258.54,93.1641, 0, 0, 0, 0),
(14908,20,1021.94,-2266.24,92.8306, 0, 0, 0, 0),
(14908,21,1022.81,-2272.14,92.6617, 0, 0, 0, 0),
(14908,22,1027.02,-2277.89,92.6709, 0, 0, 0, 0),
(14908,23,1036.56,-2280.12,93.1197, 0, 0, 0, 0),
(14908,24,1046.66,-2275.73,93.5356, 0, 0, 0, 0),
(14908,25,1049.61,-2269.77,93.5509, 0, 0, 0, 0),
(14908,26,1045.76,-2261.03,93.2522, 0, 0, 0, 0),
(14908,27,1038.3,-2254.31,93.1039, 100, 6000, 1490805, 0),
(14908,28,1028.89,-2245.04,92.4171, 2.151978, 14000, 1490806, 0),
(14908,29,1016.87,-2225.77,93.1025, 100, 80000, 1490807, 0);

DELETE FROM `creature_movement_scripts` WHERE `id` IN (1490801, 1490802, 1490803, 1490804, 1490805, 1490806, 1490807);
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1490801, 1, 20, 1, 1, 0, 1, 13980, 0, 9, 2, 0, 0, 0, 0, 5, 0, 0, 0, 0, 'Mogg - Set Random Movement 5 Yards (Pooka)'),
(1490801, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10293, 0, 0, 0, 0, 0, 0, 0, 0, 'Mogg - Say Text'),
(1490801, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10294, 0, 0, 0, 0, 0, 0, 0, 0, 'Mogg - Say Text'),
(1490802, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10295, 0, 0, 0, 0, 0, 0, 0, 0, 'Mogg - Say Text'),
(1490802, 5, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mogg - Set Run On'),
(1490803, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10296, 0, 0, 0, 0, 0, 0, 0, 0, 'Mogg - Say Text'),
(1490804, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10298, 0, 0, 0, 0, 0, 0, 0, 0, 'Mogg - Say Text'),
(1490805, 2, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mogg - Set Run Off'),
(1490805, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10299, 0, 0, 0, 0, 0, 0, 0, 0, 'Mogg - Say Text'),
(1490806, 0, 20, 0, 0, 0, 1, 13980, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mogg - Stop Random Movement (Pooka)'),
(1490806, 2, 3, 0, 0, 2, 1, 13980, 0, 9, 2, 0, 0, 0, 0, 1021.28, -2233.42, 93.33, 5.05, 0, 'Mogg - Move To Position (Pooka)'),
(1490806, 6, 0, 0, 0, 0, 0, 13980, 0, 9, 2, 10300, 0, 0, 0, 0, 0, 0, 0, 0, 'Mogg - Say Text (Pooka)'),
(1490806, 8, 3, 0, 0, 2, 1, 13980, 0, 9, 2, 0, 0, 0, 0, 1013.24, -2221.47, 92.9837, 2.5, 0, 'Mogg - Move To Position (Pooka)'),
(1490806, 12, 3, 0, 0, 2, 1, 13980, 0, 9, 2, 0, 0, 0, 0, 1017.95, -2224.33, 93.08, 4.7, 0, 'Mogg - Move To Position (Pooka)'),
(1490806, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10301, 0, 0, 0, 0, 0, 0, 0, 0, 'Mogg - Say Text'),
(1490806, 16, 20, 1, 1, 0, 1, 13980, 0, 9, 2, 0, 0, 0, 0, 5, 0, 0, 0, 0, 'Mogg - Set Random Movement 5 Yards (Pooka)'),
(1490807, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10303, 0, 0, 0, 0, 0, 0, 0, 0, 'Mogg - Say Text'),
(1490807, 4, 0, 0, 0, 0, 0, 13980, 0, 9, 2, 10304, 0, 0, 0, 0, 0, 0, 0, 0, 'Mogg - Say Text (Pooka)'),
(1490807, 5, 60, 3, 0, 0, 0, 13980, 0, 9, 2, 0, 14909, 0, 0, 0, 0, 0, 0, 0, 'Mogg - Start Waypoints (Pooka)');

DELETE FROM creature_movement_special WHERE id = 14909;
INSERT INTO creature_movement_special (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `script_id`) VALUES
(14909, 1, 1025.19, -2239.77, 92.4462, 0, 0, 0),
(14909, 2, 1032.77, -2242.09, 92.1655, 0, 0, 0),
(14909, 3, 1040.45, -2241.81, 91.9457, 0, 0, 0),
(14909, 4, 1040.65, -2233.18, 91.735, 0, 0, 0),
(14909, 5, 1037.72, -2227.49, 91.8037, 0, 0, 0),
(14909, 6, 1035.65, -2224.96, 91.9576, 3.011992, 12000, 1490901),
(14909, 7, 1039.38, -2231.71, 91.7299, 0, 0, 0),
(14909, 8, 1041.05, -2240.78, 91.9556, 0, 0, 0),
(14909, 9, 1031.51, -2241.51, 92.1757, 0, 0, 0),
(14909, 10, 1025.37, -2240.84, 92.4583, 0, 0, 0),
(14909, 11, 1020.98, -2232.5, 93.3069, 0, 0, 0),
(14909, 12, 1014.45, -2225.92, 93.0579, 100, 1000, 1490902);

DELETE FROM `creature_movement_scripts` WHERE `id` IN (1490901, 1490902);
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1490901, 1, 1, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pooka - Play Emote'),
(1490901, 6, 1, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pooka - Play Emote'),
(1490902, 0, 20, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 'Pooka - Set Random Movement 5 Yards');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
