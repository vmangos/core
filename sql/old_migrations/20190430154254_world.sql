DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190430154254');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190430154254');
-- Add your query below.


UPDATE `creature` SET `spawndist` = 0, `MovementType` = 0 WHERE `guid` IN (6880, 6886, 6885, 6877);
DELETE FROM `creature_movement` WHERE `id` IN (6880, 6886, 6885, 6877);

DELETE FROM `creature_groups` WHERE `leader_guid` = 6883;
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES 
(6883, 6883, 0, 0, 1),
(6883, 6880, 3, 360, 1),
(6883, 6886, 5, 360, 1),
(6883, 6877, 3, 180, 1),
(6883, 6885, 3, 0, 1);

DELETE FROM `creature_movement` WHERE `id` = 6883;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `orientation`) VALUES
(6883, 1, -6692.72, -2159.63, 244.195, 98000, 908601, 4.03171),
(6883, 2, -6698.09, -2166.71, 244.144, 0, 0, 3.4671),
(6883, 3, -6724.88, -2177.67, 244.144, 0, 0, 3.52993),
(6883, 4, -6754.51, -2188.96, 244.145, 0, 0, 3.49066),
(6883, 5, -6789.04, -2200.47, 244.127, 0, 0, 3.46317),
(6883, 6, -6836.76, -2216.8, 244.144, 0, 0, 3.75377),
(6883, 7, -6842.6, -2224.08, 243.735, 0, 0, 4.36638),
(6883, 8, -6831.41, -2224.13, 244.326, 0, 0, 0.125227),
(6883, 9, -6819.23, -2217.24, 244.193, 0, 0, 0.474729),
(6883, 10, -6779.18, -2201.85, 244.142, 0, 0, 0.356919),
(6883, 11, -6742.57, -2187.83, 244.144, 0, 0, 0.388335),
(6883, 12, -6704.67, -2180.27, 244.325, 0, 0, 6.07854),
(6883, 13, -6696.46, -2187.56, 247.256, 0, 0, 5.8979),
(6883, 14, -6675.44, -2195.12, 247.47, 0, 0, 5.90968),
(6883, 15, -6657.14, -2204.38, 246.199, 0, 0, 5.54447),
(6883, 16, -6639.98, -2211.67, 244.322, 0, 0, 5.45807),
(6883, 17, -6622.15, -2237.86, 244.144, 0, 0, 4.99076),
(6883, 18, -6609.55, -2297.66, 244.144, 0, 0, 4.92008),
(6883, 19, -6602.49, -2337.11, 244.564, 0, 0, 5.65835),
(6883, 20, -6593.68, -2338.02, 244.451, 0, 0, 1.49181),
(6883, 21, -6597.48, -2311.3, 244.163, 0, 0, 1.80205),
(6883, 22, -6608.46, -2282.16, 244.144, 0, 0, 1.79812),
(6883, 23, -6615.97, -2237.53, 244.144, 0, 0, 1.75885),
(6883, 24, -6638.14, -2204.14, 244.144, 0, 0, 2.21045),
(6883, 25, -6664.19, -2186.06, 244.144, 0, 0, 2.54032),
(6883, 26, -6689.15, -2168.01, 244.145, 0, 0, 2.53247),
(6883, 27, -6690.26, -2159.42, 244.145, 0, 0, 4.03171),
(6883, 28, -6692.72, -2159.63, 244.195, 450000, 908602, 4.03171);

DELETE FROM `creature_movement_scripts` WHERE `id` IN (908601, 908602);
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(908601, 1, 60, 3, 1, 0, 0, 6878, 0, 9, 2, 0, 9077, 0, 0, 0, 0, 0, 0, 0, "Grunt Gargal - Start Waypoints (Creature GUID: 6878)"),
(908601, 2, 3, 0, 0, 2, 0, 6877, 0, 9, 2, 0, 0, 0, 0, -6687.93, -2159.12, 245.282, 3.942, 0, "Grunt Gargal - Move To Position (Creature GUID: 6877)"),
(908601, 2, 3, 0, 0, 2, 0, 6885, 0, 9, 2, 0, 0, 0, 0, -6686.64, -2162.669, 244.195, 2.388, 0, "Grunt Gargal - Move To Position (Creature GUID: 6885)"),
(908601, 2, 3, 0, 0, 2, 0, 6886, 0, 9, 2, 0, 0, 0, 0, -6690.129, -2161.77, 244.195, 0.802, 0, "Grunt Gargal - Move To Position (Creature GUID: 6886)"),
(908601, 2, 3, 0, 0, 2, 0, 6880, 0, 9, 2, 0, 0, 0, 0, -6690.18, -2156.939, 244.195, 4.014, 0, "Grunt Gargal - Move To Position (Creature GUID: 6880)"),
(908601, 2, 3, 0, 0, 2, 0, 0, 0, 0, 4, 0, 0, 0, 0, -6692.72, -2159.629, 244.195, 6.248, 0, "Grunt Gargal - Move To Position"),
(908601, 4, 4, 147, 2, 2, 0, 6885, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Grunt Gargal - Remove Flag Quest Giver (Creature GUID: 6885)"),
(908601, 4, 4, 147, 2, 2, 0, 6886, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Grunt Gargal - Remove Flag Quest Giver (Creature GUID: 6886)"),

(908602, 1, 3, 0, 0, 2, 0, 6877, 0, 9, 2, 0, 0, 0, 0, -6687.93, -2159.12, 245.282, 3.942, 0, "Grunt Gargal - Move To Position (Creature GUID: 6877)"),
(908602, 1, 3, 0, 0, 2, 0, 6885, 0, 9, 2, 0, 0, 0, 0, -6686.64, -2162.669, 244.195, 2.388, 0, "Grunt Gargal - Move To Position (Creature GUID: 6885)"),
(908602, 1, 3, 0, 0, 2, 0, 6886, 0, 9, 2, 0, 0, 0, 0, -6690.129, -2161.77, 244.195, 0.802, 0, "Grunt Gargal - Move To Position (Creature GUID: 6886)"),
(908602, 1, 3, 0, 0, 2, 0, 6880, 0, 9, 2, 0, 0, 0, 0, -6690.18, -2156.939, 244.195, 4.014, 0, "Grunt Gargal - Move To Position (Creature GUID: 6880)"),
(908602, 1, 3, 0, 0, 2, 0, 0, 0, 0, 4, 0, 0, 0, 0, -6692.72, -2159.629, 244.195, 6.248, 0, "Grunt Gargal - Move To Position"),
(908602, 4, 4, 147, 2, 1, 0, 6885, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Grunt Gargal - Add Flag Quest Giver (Creature GUID: 6885)"),
(908602, 4, 4, 147, 2, 1, 0, 6886, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Grunt Gargal - Add Flag Quest Giver (Creature GUID: 6886)");

DELETE FROM `creature_movement_special` WHERE `id` = 9077;
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `script_id`, `orientation`, `waittime`) VALUES
(9077, 1, -6677.62, -2224.11, 278.559, 0, 100, 0),
(9077, 2, -6677.62, -2224.11, 278.559, 907701, 100, 0),
(9077, 3, -6666.75, -2223.21, 278.58, 0, 100, 0),
(9077, 4, -6661.61, -2231.73, 278.446, 0, 100, 0),
(9077, 5, -6666.28, -2243.37, 272.058, 0, 100, 0),
(9077, 6, -6677.49, -2244.14, 272.019, 0, 100, 0),
(9077, 7, -6679.47, -2232.97, 272.045, 0, 100, 0),
(9077, 8, -6672.57, -2227.45, 269.454, 0, 100, 0),
(9077, 9, -6668.03, -2233.48, 266.891, 0, 100, 0),
(9077, 10, -6674.64, -2238.53, 264.064, 0, 100, 0),
(9077, 11, -6680.17, -2230.43, 260.373, 907702, 100, 0),
(9077, 12, -6647.47, -2210.55, 245.571, 0, 100, 0),
(9077, 13, -6646.23, -2200.34, 244.144, 0, 100, 0),
(9077, 14, -6653.89, -2191.76, 244.144, 0, 100, 0),
(9077, 15, -6680.09, -2174.92, 244.158, 0, 100, 0),
(9077, 16, -6686.56, -2165.76, 244.144, 907703, 100, 42000),
(9077, 17, -6686.56, -2165.76, 244.144, 0, 100, 0),
(9077, 18, -6679.02, -2153.74, 244.144, 907704, 100, 30000),
(9077, 19, -6679.02, -2153.74, 244.144, 0, 100, 0),
(9077, 20, -6686.15, -2165.75, 244.144, 0, 100, 0),
(9077, 21, -6679.55, -2175.26, 244.158, 0, 100, 0),
(9077, 22, -6653.74, -2191.61, 244.145, 0, 100, 0),
(9077, 23, -6646.55, -2203.24, 244.145, 0, 100, 0),
(9077, 24, -6649.67, -2210.69, 246.134, 0, 100, 0),
(9077, 25, -6679.81, -2230.96, 260.432, 0, 100, 0),
(9077, 26, -6673.88, -2238.29, 264.133, 0, 100, 0),
(9077, 27, -6667.92, -2233.3, 266.899, 0, 100, 0),
(9077, 28, -6672.64, -2227.78, 269.461, 0, 100, 0),
(9077, 29, -6679.08, -2233.75, 272.046, 0, 100, 0),
(9077, 30, -6677.21, -2244.13, 272.023, 0, 100, 0),
(9077, 31, -6666.05, -2243.3, 272.203, 0, 100, 0),
(9077, 32, -6661.79, -2230.97, 278.574, 0, 100, 0),
(9077, 33, -6666.63, -2223.8, 278.563, 0, 100, 0),
(9077, 34, -6677.62, -2224.11, 278.559, 0, 100, 0),
(9077, 35, -6677.62, -2224.11, 278.559, 907705, 100, 0);

DELETE FROM `creature_movement_scripts` WHERE `id` IN (907701, 907702, 907703, 907704, 907705);
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(907701, 0, 4, 147, 3, 2, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Warlord Goretooth - Remove Flags Gossip & Quest Giver"),

(907702, 0, 0, 0, 0, 0, 0, 6880, 0, 9, 2, 4661, 0, 0, 0, 0, 0, 0, 0, 0, "Warlord Goretooth - Say Text (Creature GUID: 6880)"),
(907702, 8, 0, 0, 0, 0, 0, 6877, 0, 9, 2, 4662, 0, 0, 0, 0, 0, 0, 0, 0, "Warlord Goretooth - Say Text (Creature GUID: 6877)"),
(907702, 12, 0, 0, 0, 0, 0, 6877, 0, 9, 2, 4663, 0, 0, 0, 0, 0, 0, 0, 0, "Warlord Goretooth - Say Text (Creature GUID: 6877)"),
(907702, 20, 0, 2, 0, 0, 0, 6883, 0, 9, 2, 4664, 0, 0, 0, 0, 0, 0, 0, 0, "Warlord Goretooth - Say Text (Creature GUID: 6883)"),
(907702, 24, 0, 0, 0, 0, 0, 6883, 0, 9, 2, 4665, 0, 0, 0, 0, 0, 0, 0, 0, "Warlord Goretooth - Say Text (Creature GUID: 6883)"),
(907702, 26, 0, 0, 0, 0, 0, 6885, 0, 9, 2, 4666, 0, 0, 0, 0, 0, 0, 0, 0, "Warlord Goretooth - Say Text (Creature GUID: 6885)"),
(907702, 28, 0, 0, 0, 0, 0, 6883, 0, 9, 2, 4667, 0, 0, 0, 0, 0, 0, 0, 0, "Warlord Goretooth - Say Text (Creature GUID: 6883)"),
(907702, 29, 0, 0, 0, 0, 0, 6885, 0, 9, 2, 4668, 0, 0, 0, 0, 0, 0, 0, 0, "Warlord Goretooth - Say Text (Creature GUID: 6885)"),
(907702, 32, 0, 0, 0, 0, 0, 6886, 0, 9, 2, 4669, 0, 0, 0, 0, 0, 0, 0, 0, "Warlord Goretooth - Say Text (Creature GUID: 6886)"),

(907703, 1, 35, 1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 2.02664, 0, 'Warlord Goretooth - Set Orientation (2.02664)'),
(907703, 2, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4673, 0, 0, 0, 0, 0, 0, 0, 0, 'Warlord Goretooth - Say Text'),
(907703, 2, 35, 1, 0, 0, 0, 6885, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 5.17217, 0, 'Warlord Goretooth - Set Orientation (5.17217) (Creature GUID: 6885)'),
(907703, 6, 0, 0, 0, 0, 0, 6885, 0, 9, 2, 4672, 0, 0, 0, 0, 0, 0, 0, 0, 'Warlord Goretooth - Say Text (Creature GUID: 6885)'),
(907703, 10, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4688, 0, 0, 0, 0, 0, 0, 0, 0, 'Warlord Goretooth - Say Text'),
(907703, 16, 0, 0, 0, 0, 0, 6885, 0, 9, 2, 4690, 0, 0, 0, 0, 0, 0, 0, 0, 'Warlord Goretooth - Say Text (Creature GUID: 6885)'),
(907703, 18, 35, 1, 0, 0, 0, 6885, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 2.38871, 0, 'Warlord Goretooth - Set Orientation (2.38871) (Creature GUID: 6885)'),
(907703, 19, 0, 0, 0, 0, 0, 6885, 0, 9, 2, 4691, 0, 0, 0, 0, 0, 0, 0, 0, 'Warlord Goretooth - Say Text (Creature GUID: 6885)'),
(907703, 28, 0, 0, 0, 0, 0, 6881, 0, 9, 2, 4679, 0, 0, 0, 0, 0, 0, 0, 0, 'Warlord Goretooth - Say Text (Creature GUID: 6881)'),
(907703, 32, 0, 0, 0, 0, 0, 6884, 0, 9, 2, 4683, 0, 0, 0, 0, 0, 0, 0, 0, 'Warlord Goretooth - Say Text (Creature GUID: 6884)'),
(907703, 37, 0, 0, 0, 0, 0, 6881, 0, 9, 2, 4685, 0, 0, 0, 0, 0, 0, 0, 0, 'Warlord Goretooth - Say Text (Creature GUID: 6881)'),
(907703, 45, 0, 2, 0, 0, 0, 6884, 0, 9, 2, 4687, 0, 0, 0, 0, 0, 0, 0, 0, 'Warlord Goretooth - Say Text (Creature GUID: 6884)'),
(907703, 46, 0, 0, 0, 0, 0, 6884, 0, 9, 2, 4686, 0, 0, 0, 0, 0, 0, 0, 0, 'Warlord Goretooth - Say Text (Creature GUID: 6884)'),

(907704, 1, 35, 1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 2.90471, 0, 'Warlord Goretooth - Set Orientation (2.90471)'),
(907704, 2, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4689, 0, 0, 0, 0, 0, 0, 0, 0, 'Warlord Goretooth - Say Text'),
(907704, 3, 35, 1, 0, 0, 0, 6884, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 5.41178, 0, 'Warlord Goretooth - Set Orientation (5.41178) (Creature GUID: 6884)'),
(907704, 3, 35, 1, 0, 0, 0, 6881, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0.03572, 0, 'Warlord Goretooth - Set Orientation (0.03572) (Creature GUID: 6881)'),
(907704, 6, 0, 0, 0, 0, 0, 6881, 0, 9, 2, 4694, 0, 0, 0, 0, 0, 0, 0, 0, 'Warlord Goretooth - Say Text (Creature GUID: 6881)'),
(907704, 7, 0, 2, 0, 0, 0, 6884, 0, 9, 2, 4693, 0, 0, 0, 0, 0, 0, 0, 0, 'Warlord Goretooth - Say Text (Creature GUID: 6884)'),
(907704, 10, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4695, 0, 0, 0, 0, 0, 0, 0, 0, 'Warlord Goretooth - Say Text'),
(907704, 14, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4696, 0, 0, 0, 0, 0, 0, 0, 0, 'Warlord Goretooth - Say Text'),
(907704, 20, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4697, 0, 0, 0, 0, 0, 0, 0, 0, 'Warlord Goretooth - Say Text'),
(907704, 28, 35, 1, 0, 0, 0, 6884, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 4.67748, 0, 'Warlord Goretooth - Set Orientation (4.67748) (Creature GUID: 6884)'),
(907704, 28, 35, 1, 0, 0, 0, 6881, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 1.29154, 0, 'Warlord Goretooth - Set Orientation (1.29154) (Creature GUID: 6881)'),

(907705, 1, 35, 1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 2.56563, 0, 'Warlord Goretooth - Set Orientation (2.56563)'),
(907705, 2, 4, 147, 3, 1, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warlord Goretooth - Add Flags Gossip & Quest Giver');

UPDATE `broadcast_text` SET `EmoteId0` = 1 WHERE `ID` IN (4662, 4663, 4665, 4667, 4688, 4679, 4683, 4685, 4686, 4696, 4697);
UPDATE `broadcast_text` SET `EmoteId0` = 5 WHERE `ID` IN (4673, 4691);
UPDATE `broadcast_text` SET `EmoteId0` = 6 WHERE `ID` = 4661;
UPDATE `broadcast_text` SET `EmoteId0` = 11 WHERE `ID` IN (4669, 4695);
UPDATE `broadcast_text` SET `EmoteId0` = 21 WHERE `ID` = 4687;
UPDATE `broadcast_text` SET `EmoteId0` = 23 WHERE `ID` = 4689;
UPDATE `broadcast_text` SET `EmoteId0` = 24 WHERE `ID` = 4693;
UPDATE `broadcast_text` SET `EmoteId0` = 66 WHERE `ID` = 4690;
UPDATE `broadcast_text` SET `EmoteId0` = 274 WHERE `ID` IN (4666, 4668, 4672, 4694);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
