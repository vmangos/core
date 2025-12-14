DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250721160556');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250721160556');
-- Add your query below.


-- Minor Manifestation of Water
UPDATE `creature_template` SET `auras` = '8203', `movement_type` = 2 WHERE `entry` = 5895;
DELETE FROM `creature_movement_template` WHERE `entry` = 5895;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`, `path_id`) VALUES
(5895, 1, 417.04, 1822.66, 12.61, 1.483, 300000, 0, 0, 0),
(5895, 2, 417.04, 1822.66, 12.61, 1.483, 0, 0, 589500, 0),
(5895, 3, 421.879, 1840.35, 12.0528, 100, 0, 0, 0, 0),
(5895, 4, 431.016, 1847.81, 11.6124, 100, 0, 0, 0, 0),
(5895, 5, 454.363, 1883.92, 5.44203, 100, 0, 0, 0, 0),
(5895, 6, 459.398, 1923.79, -10.2403, 100, 1000, 0, 4, 0);
DELETE FROM `creature_movement_scripts` WHERE `id` = 589500;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(589500, 0, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Water: Minor Manifestation of Water - Modify Flags');

-- Corrupt Water Spirit
UPDATE `creature` SET `spawntimesecsmin` = 450, `spawntimesecsmax` = 450 WHERE `id` = 5897;

-- Water Spirit
UPDATE `creature_template` SET `faction` = 35, `auras` = '8203', `ai_name` = 'EventAI' WHERE `entry` = 6748;

DELETE FROM `creature_ai_events` WHERE `creature_id`=6748;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(674801, 6748, 0, 1, 0, 100, 1, 0, 1000, 1000, 1000, 674801, 0, 0, 'Water Spirit - Set Orientation - OOC');
DELETE FROM `creature_ai_scripts` WHERE `id`=674801;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(674801, 0, 0, 35, 0, 0, 0, 0, 20, 0, 25, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Water Spirit - Set Orientation');

INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(10997, 6748, 0, 0, 0, 0, 0, 392.31, 1847.33, 12.36, 6.068, 10, 10, 0, 100, 100, 2, 2, 0, 0, 10),
(10998, 6748, 0, 0, 0, 0, 0, 439.28, 1837.3, 12.42, 2.934, 10, 10, 0, 100, 100, 2, 2, 0, 0, 10),
(10999, 6748, 0, 0, 0, 0, 0, 431.41, 1849.24, 11.39, 3.516, 10, 10, 0, 100, 100, 2, 2, 0, 0, 10),
(11001, 6748, 0, 0, 0, 0, 0, 404.85, 1863.62, 11.2, 5.135, 10, 10, 0, 100, 100, 2, 2, 0, 0, 10),
(11002, 6748, 0, 0, 0, 0, 0, 418.96, 1854.28, 10.97, 4.339, 10, 10, 0, 100, 100, 2, 2, 0, 0, 10),
(11003, 6748, 0, 0, 0, 0, 0, 393.13, 1860.64, 11.22, 5.577, 10, 10, 0, 100, 100, 2, 2, 0, 0, 10),
(11004, 6748, 0, 0, 0, 0, 0, 405.81, 1843.58, 12.54, 6.161, 10, 10, 0, 100, 100, 2, 2, 0, 0, 10),
(11005, 6748, 0, 0, 0, 0, 0, 400.15, 1827.5, 10.46, 0.813, 10, 10, 0, 100, 100, 2, 2, 0, 0, 10),
(11006, 6748, 0, 0, 0, 0, 0, 424.45, 1818.22, 10.46, 1.964, 10, 10, 0, 100, 100, 2, 2, 0, 0, 10),
(11007, 6748, 0, 0, 0, 0, 0, 424.75, 1840.46, 12.25, 2.945, 10, 10, 0, 100, 100, 2, 2, 0, 0, 10),
(11008, 6748, 0, 0, 0, 0, 0, 413.2, 1831.29, 10.46, 1.468, 10, 10, 0, 100, 100, 2, 2, 0, 0, 10),
(11009, 6748, 0, 0, 0, 0, 0, 434.02, 1862.14, 10.89, 3.925, 10, 10, 0, 100, 100, 2, 2, 0, 0, 10);

DELETE FROM `creature_movement` WHERE `id` IN (10997, 10998, 10999, 11001, 11002, 11003, 11004, 11005, 11006, 11007, 11008, 11009);
INSERT INTO `creature_movement` (`id`, `path_id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `script_id`) VALUES 
(10997, 0, 1, 392.31, 1847.33, 12.36, 6.068, 300000, 0),
(10997, 0, 2, 392.31, 1847.33, 12.36, 6.068, 3000, 0),
(10997, 0, 3, 406.45312, 1853.0293, 11.4607525, 100,  0,  0),
(10997, 0, 4, 426.0931, 1853.4049, 11.238218, 100,  0,  0),
(10997, 0, 5, 439.47028, 1859.5836, 10.419017, 100,  0,  0),
(10997, 0, 6, 452.2871, 1873.2698, 8.482309, 100,  0,  0),
(10997, 0, 7, 469.80817, 1890.7695, 1.4991376, 100,  1000,  674800),
(10998, 0, 1, 439.28, 1837.30, 12.42, 2.934, 300000, 0),
(10998, 0, 2, 439.28, 1837.30, 12.42, 2.934, 5000, 0),
(10998, 0, 3, 439.02524, 1844.5131, 11.919017, 100,  0,  0),
(10998, 0, 4, 439.42584, 1860.4017, 10.526927, 100,  0,  0),
(10998, 0, 5, 443.2843, 1880.2444, 5.9984226, 100,  0,  0),
(10998, 0, 6, 442.6797, 1877.0859, 6.942026, 100,  1000,  674800),
(10999, 0, 1, 431.41, 1849.24, 11.39, 3.516, 300000, 0),
(10999, 0, 2, 431.41, 1849.24, 11.39, 3.516, 5000, 0),
(10999, 0, 3, 438.10107, 1862.1263, 10.4462385, 100,  0,  0),
(10999, 0, 4, 445.3859, 1866.9548, 9.960947, 100,  0,  0),
(10999, 0, 5, 449.72852, 1879.206, 6.567026, 100,  0,  0),
(10999, 0, 6, 446.74728, 1892.3281, 1.0941257, 100,  0,  0),
(10999, 0, 7, 443.83682, 1903.1873, -5.6569366, 100,  1000,  674800),
(11001, 0, 1, 404.85, 1863.62, 11.20, 5.135, 300000, 0),
(11001, 0, 2, 404.85, 1863.62, 11.20, 5.135, 500, 0),
(11001, 0, 3, 410.91525, 1860.8453, 10.843443, 100,  0,  0),
(11001, 0, 4, 427.12457, 1856.0109, 10.926939, 100,  0,  0),
(11001, 0, 5, 437.1794, 1860.1814, 10.519969, 100,  0,  0),
(11001, 0, 6, 457.08438, 1888.1526, 4.269785, 100,  0,  0),
(11001, 0, 7, 464.85547, 1909.8047, -5.720413, 100,  1000,  674800),
(11002, 0, 1, 418.96, 1854.28, 10.97, 4.339, 300000, 0),
(11002, 0, 2, 418.96, 1854.28, 10.97, 4.339, 3000, 0),
(11002, 0, 3, 430.84006, 1853.1951, 11.028135, 100,  0,  0),
(11002, 0, 4, 437.45844, 1860.4113, 10.4864, 100,  0,  0),
(11002, 0, 5, 444.05286, 1873.4497, 8.562632, 100,  0,  0),
(11002, 0, 6, 448.75015, 1888.2692, 3.3022556, 100,  0,  0),
(11002, 0, 7, 457.16418, 1900.19, -1.3889923, 100,  1000,  674800),
(11003, 0, 1, 393.13, 1860.64, 11.22, 5.577, 300000, 0),
(11003, 0, 2, 393.13, 1860.64, 11.22, 5.577, 5000, 0),
(11003, 0, 3, 407.33914, 1859.3123, 11.392515, 100,  0,  0),
(11003, 0, 4, 429.232, 1856.2153, 10.9607525, 100,  0,  0),
(11003, 0, 5, 443.2384, 1870.1517, 9.710215, 100,  0,  0),
(11003, 0, 6, 463.67264, 1896.4757, 0.32032204, 100,  1000,  674800),
(11004, 0, 1, 405.81, 1843.58, 12.54, 6.161, 300000, 0),
(11004, 0, 2, 405.81, 1843.58, 12.54, 6.161, 10000, 0),
(11004, 0, 3, 425.22348, 1816.2814, 10.487756, 100,  0,  0),
(11004, 0, 4, 430.78104, 1820.6372, 10.487756, 100,  0,  0),
(11004, 0, 5, 439.31754, 1825.1202, 12.664169, 100,  0,  0),
(11004, 0, 6, 441.66635, 1835.1333, 12.419017, 100,  0,  0),
(11004, 0, 7, 444.533, 1842.4141, 12.521068, 100,  0,  0),
(11004, 0, 8, 449.82465, 1849.613, 11.037059, 100,  0,  0),
(11004, 0, 9, 446.33344, 1861.1415, 10.195994, 100,  0,  0),
(11004, 0, 10, 469.31055, 1891.5924, 1.3225019, 100,  1000,  674800),
(11005, 0, 1, 400.15, 1827.50, 10.46, 0.813, 300000, 0),
(11005, 0, 2, 400.15, 1827.50, 10.46, 0.813, 10000, 0),
(11005, 0, 3, 428.5726, 1819.7274, 10.487756, 100,  0,  0),
(11005, 0, 4, 427.20813, 1827.1571, 10.487756, 100,  0,  0),
(11005, 0, 5, 432.24295, 1836.5192, 12.405577, 100,  0,  0),
(11005, 0, 6, 438.77335, 1843.1816, 12.084422, 100,  0,  0),
(11005, 0, 7, 436.4252, 1853.4467, 10.884349, 100,  0,  0),
(11005, 0, 8, 434.67307, 1868.783, 10.27186, 100,  0,  0),
(11005, 0, 9, 439.33084, 1876.4147, 8.145517, 100,  0,  0),
(11005, 0, 10, 444.48453, 1893.4553, 0.009897232, 100,  0,  0),
(11005, 0, 11, 440.0733, 1901.166, -5.9965363, 100,  1000,  674800),
(11006, 0, 1, 424.45, 1818.22, 10.46, 1.964, 300000, 0),
(11006, 0, 2, 424.45, 1818.22, 10.46, 1.964, 11000, 0),
(11006, 0, 3, 428.00943, 1825.4735, 10.487756, 100,  0,  0),
(11006, 0, 4, 425.67725, 1830.5055, 10.480554, 100,  0,  0),
(11006, 0, 5, 428.95306, 1840.714, 12.4607525, 100,  0,  0),
(11006, 0, 6, 436.45667, 1845.7812, 11.806468, 100,  0,  0),
(11006, 0, 7, 437.6485, 1854.5172, 10.588695, 100,  0,  0),
(11006, 0, 8, 449.22168, 1880.1298, 6.3767185, 100,  0,  0),
(11006, 0, 9, 448.36328, 1878.207, 6.817026, 100,  1000,  674800),
(11007, 0, 1, 424.75, 1840.46, 12.25, 2.945, 300000, 0),
(11007, 0, 2, 424.75, 1840.46, 12.25, 2.945, 11000, 0),
(11007, 0, 3, 435.19205, 1825.6515, 12.399033, 100,  0,  0),
(11007, 0, 4, 442.65442, 1836.267, 12.600047, 100,  0,  0),
(11007, 0, 5, 445.90778, 1853.7994, 10.150584, 100,  0,  0),
(11007, 0, 6, 445.82993, 1865.9453, 10.130931, 100,  0,  0),
(11007, 0, 7, 458.66364, 1884.7913, 5.2171726, 100,  0,  0),
(11007, 0, 8, 470.88943, 1897.9523, -1.1516192, 100,  1000,  674800),
(11008, 0, 1, 413.20, 1831.29, 10.46, 1.468, 300000, 0),
(11008, 0, 2, 413.20, 1831.29, 10.46, 1.468, 11000, 0),
(11008, 0, 3, 428.40353, 1829.527, 10.391686, 100,  0,  0),
(11008, 0, 4, 432.89297, 1843.0895, 12.342833, 100,  0,  0),
(11008, 0, 5, 430.71457, 1858.4186, 10.9607525, 100,  0,  0),
(11008, 0, 6, 439.50668, 1870.2897, 9.891489, 100,  0,  0),
(11008, 0, 7, 451.3856, 1891.964, 2.2780857, 100,  0,  0),
(11008, 0, 8, 451.89758, 1899.8502, -1.6959133, 100,  1000,  674800),
(11009, 0, 1, 434.02, 1862.14, 10.89, 3.925, 300000, 0),
(11009, 0, 2, 434.02, 1862.14, 10.89, 3.925, 3000, 0),
(11009, 0, 3, 454.813, 1891.4397, 2.8512058,  100,  1000,  674800);

DELETE FROM `creature_movement_scripts` WHERE `id`= 674800;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(674800, 0, 0, 41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Water Spirit - Remove Creature');

-- Corrupt Minor Manifestation of Water
UPDATE `creature` SET `position_x`= 418.87442, `position_y` = 1831.7448, `position_z` = 10.740808, `orientation` = 1.29154360294342, `movement_type` = 2 WHERE `guid` = 84707;
DELETE FROM `creature_movement_template` WHERE `entry` = 5894;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`, `path_id`) VALUES
(5894, 1, 418.874, 1831.74, 10.7408, 1.29154, 15000, 0, 0, 0),
(5894, 2, 411.101, 1830.18, 10.4878, 100, 0, 0, 0, 0),
(5894, 3, 405.481, 1825.35, 10.4878, 100, 0, 0, 0, 0),
(5894, 4, 405.215, 1819.34, 10.4343, 100, 0, 0, 0, 0),
(5894, 5, 413.839, 1811.1, 10.6594, 100, 0, 0, 0, 0),
(5894, 6, 422.242, 1812.21, 10.6679, 100, 0, 0, 0, 0),
(5894, 7, 426.716, 1816.27, 10.4878, 100, 0, 0, 0, 0),
(5894, 8, 429.111, 1821.22, 10.4878, 100, 0, 0, 0, 0),
(5894, 9, 427.671, 1827.4, 10.4878, 100, 0, 0, 0, 0),
(5894, 10, 420.717, 1832, 10.7591, 100, 1000, 0, 0, 0),
(5894, 11, 418.874, 1831.74, 10.7408, 100, 1000, 0, 0, 0),
(5894, 12, 418.874, 1831.74, 10.7408, 1.29154, 47000, 0, 0, 0),
(5894, 13, 425.767, 1830.2, 10.6121, 100, 0, 0, 0, 0),
(5894, 14, 428.906, 1822.9, 10.4878, 100, 0, 0, 0, 0),
(5894, 15, 426.916, 1815.86, 10.4878, 100, 0, 0, 0, 0),
(5894, 16, 420.529, 1811.66, 11.1522, 100, 0, 0, 0, 0),
(5894, 17, 411.956, 1812.03, 11.1035, 100, 0, 0, 0, 0),
(5894, 18, 405.622, 1817.44, 10.1745, 100, 0, 0, 0, 0),
(5894, 19, 404.275, 1823.17, 10.4878, 100, 0, 0, 0, 0),
(5894, 20, 407.255, 1828.5, 10.4878, 100, 0, 0, 0, 0),
(5894, 21, 412.924, 1831.53, 10.4878, 100, 0, 0, 0, 0),
(5894, 22, 417.869, 1833.24, 10.5609, 100, 0, 0, 0, 0),
(5894, 23, 418.874, 1831.74, 10.7408, 100, 0, 0, 0, 0),
(5894, 24, 418.874, 1831.74, 10.7408, 1.29154, 2000, 0, 0, 0),
(5894, 25, 417.949, 1841.03, 11.7537, 100, 0, 0, 0, 0),
(5894, 26, 412.838, 1840.49, 12.2891, 100, 0, 0, 0, 0),
(5894, 27, 406.217, 1836.33, 12.8358, 100, 0, 0, 0, 0),
(5894, 28, 394.713, 1846.76, 12.2286, 100, 0, 0, 0, 0),
(5894, 29, 399.557, 1860.32, 11.4649, 100, 0, 0, 0, 0),
(5894, 30, 410.529, 1863.6, 10.5587, 100, 0, 0, 0, 0),
(5894, 31, 420.337, 1853.75, 11.2009, 100, 0, 0, 0, 0),
(5894, 32, 429.426, 1847.49, 11.689, 100, 0, 0, 0, 0),
(5894, 33, 440.584, 1847.81, 11.27, 100, 0, 0, 0, 0),
(5894, 34, 443.787, 1843, 12.2899, 100, 0, 0, 0, 0),
(5894, 35, 440.005, 1835.25, 12.419, 100, 0, 0, 0, 0),
(5894, 36, 433.309, 1829.94, 12.1319, 100, 0, 0, 0, 0),
(5894, 37, 428.294, 1837.99, 12.4147, 100, 0, 0, 0, 0),
(5894, 38, 421.721, 1840.7, 12.1011, 100, 0, 0, 0, 0),
(5894, 39, 418.874, 1831.74, 10.7408, 100, 0, 0, 0, 0),
(5894, 40, 418.874, 1831.74, 10.7408, 1.29154, 25000, 0, 0, 0);

-- Quest 100 Start Script
DELETE FROM `quest_start_scripts` WHERE `id` = 100;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(100, 0, 0, 31, 5895, 20, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Water: Terminate Script'),
(100, 0, 1, 39, 100, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Water: Start Script');

DELETE FROM `generic_scripts` WHERE `id` = 100;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(100, 0, 1, 68, 5897, 2, 5897, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Water: Corrupt Water Spirit - Start Script For All'),
(100, 1, 0, 9, 15176, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Water: Respawn Gameobject'),
(100, 12, 0, 9, 15175, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Water: Respawn Gameobject'),
(100, 15, 0, 10, 5895, 360000, 0, 0, 0, 0, 0, 0, 4, 0, -1, 1, 417.04, 1822.66, 12.61, 1.483, 0, 'Call of Water: Summon Minor Manifestation of Water'),
(100, 19, 1, 91, 10997, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Water: Respawn Water Spirit'),
(100, 19, 1, 91, 10998, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Water: Respawn Water Spirit'),
(100, 19, 1, 91, 10999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Water: Respawn Water Spirit'),
(100, 20, 1, 91, 11001, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Water: Respawn Water Spirit'),
(100, 20, 1, 91, 11002, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Water: Respawn Water Spirit'),
(100, 22, 1, 91, 11003, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Water: Respawn Water Spirit'),
(100, 22, 1, 91, 11004, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Water: Respawn Water Spirit'),
(100, 22, 1, 91, 11005, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Water: Respawn Water Spirit'),
(100, 24, 1, 91, 11006, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Water: Respawn Water Spirit'),
(100, 24, 1, 91, 11007, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Water: Respawn Water Spirit'),
(100, 25, 1, 91, 11008, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Water: Respawn Water Spirit'),
(100, 25, 1, 91, 11009, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Water: Respawn Water Spirit');

-- Quest 96 Start Script
UPDATE `quest_template` SET `StartScript` = 96 WHERE `entry` = 96;

DELETE FROM `quest_start_scripts` WHERE `id` = 96;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(96, 12, 0, 60, 2, 2, 0, 0, 0, 0, 0, 0, 0, 5895, 0, 0, 0, 0, 0, 0, 0, 'Call of Water: Minor Manifestation of Water -Start Waypoints'),
(96, 13, 0, 60, 1, 2, 0, 0, 11006, 0, 11, 2, 11006, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Water: Water Spirit -Start Waypoints'),
(96, 13, 0, 60, 1, 2, 0, 0, 11008, 0, 11, 2, 11008, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Water: Water Spirit -Start Waypoints'),
(96, 13, 0, 60, 1, 2, 0, 0, 10997, 0, 11, 2, 10997, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Water: Water Spirit -Start Waypoints'),
(96, 13, 0, 60, 1, 2, 0, 0, 10998, 0, 11, 2, 10998, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Water: Water Spirit -Start Waypoints'),
(96, 13, 0, 60, 1, 2, 0, 0, 10999, 0, 11, 2, 10999, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Water: Water Spirit -Start Waypoints'),
(96, 13, 0, 60, 1, 2, 0, 0, 11001, 0, 11, 2, 11001, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Water: Water Spirit -Start Waypoints'),
(96, 13, 0, 60, 1, 2, 0, 0, 11002, 0, 11, 2, 11002, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Water: Water Spirit -Start Waypoints'),
(96, 13, 0, 60, 1, 2, 0, 0, 11003, 0, 11, 2, 11003, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Water: Water Spirit -Start Waypoints'),
(96, 13, 0, 60, 1, 2, 0, 0, 11004, 0, 11, 2, 11004, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Water: Water Spirit -Start Waypoints'),
(96, 13, 0, 60, 1, 2, 0, 0, 11005, 0, 11, 2, 11005, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Water: Water Spirit -Start Waypoints'),
(96, 13, 0, 60, 1, 2, 0, 0, 11009, 0, 11, 2, 11009, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Water: Water Spirit -Start Waypoints'),
(96, 13, 0, 60, 1, 2, 0, 0, 11007, 0, 11, 2, 11007, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Water: Water Spirit -Start Waypoints');

-- Quest 1103 End Script
UPDATE `quest_template` SET `PrevQuestId` = 220 WHERE `entry` = 972;
UPDATE `quest_template` SET `PrevQuestId` = 63 WHERE `entry` = 1103;
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES 
(9735, 0, 101750, 0, 0, 0, 5875);

DELETE FROM `quest_end_scripts` WHERE `id`=1103;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1103, 0, 0, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Water: Tiev Mordune - Set Standstate'),
(1103, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3069, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Water: Tiev Mordune - Talk'),
(1103, 3, 0, 60, 3, 0, 0, 0, 0, 0, 0, 0, 0, 7007, 0, 0, 0, 0, 0, 0, 0, 'Call of Water: Tiev Mordune - Start Waypoints');

DELETE FROM `creature_movement_special` WHERE `id` = 7007;
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`, `path_id`) VALUES
(7007, 1, 431.493, 1869.76, 10.9623, 100, 6000, 0, 700700, 0),
(7007, 2, 433.69, 1865.99, 10.5627, 100, 0, 0, 0, 0),
(7007, 3, 435.59, 1863.4, 10.6, 100, 0, 0, 0, 0),
(7007, 4, 419.184, 1849.87, 11.6537, 100, 0, 0, 0, 0),
(7007, 5, 419.108, 1845.34, 11.9373, 100, 15000, 0, 700701, 0),
(7007, 6, 418.881, 1834.54, 10.5858, 100, 0, 0, 0, 0),
(7007, 7, 416.736, 1827.01, 11.6469, 100, 16000, 0, 700702, 0),
(7007, 8, 424.093, 1833.23, 9.8055, 100, 0, 0, 0, 0),
(7007, 9, 435.794, 1853.76, 10.9224, 100, 0, 0, 0, 0),
(7007, 10, 434.792, 1868.7, 10.2297, 100, 0, 0, 0, 0),
(7007, 11, 430.836, 1880.7, 15.1794, 100, 0, 0, 0, 0),
(7007, 12, 430.385, 1881.86, 15.4235, 100, 0, 0, 0, 0),
(7007, 13, 430.385, 1881.86, 15.4235, 5.131, 4000, 0, 700703, 0);

DELETE FROM `creature_movement_scripts` WHERE `id`=700700;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(700700, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3070, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Water: Tiev Mordune - Talk'),
(700700, 3, 0, 35, 0, 0, 0, 0, 10, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Water: Tiev Mordune - Set Orientation'),
(700700, 3, 1, 15, 9735, 0, 0, 0, 10, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Water: Tiev Mordune - Cast Spell');

DELETE FROM `creature_movement_scripts` WHERE `id`=700701;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(700701, 0, 0, 35, 0, 0, 0, 0, 10, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Water: Tiev Mordune - Set Orientation'),
(700701, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3071, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Water: Tiev Mordune - Talk'),
(700701, 2, 0, 1, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Water: Tiev Mordune - Emote'),
(700701, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3072, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Water: Tiev Mordune - Talk'),
(700701, 6, 0, 39, 100, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Water: Tiev Mordune - Start Script');

DELETE FROM `creature_movement_scripts` WHERE `id`=700702;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(700702, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3073, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Water: Tiev Mordune - Talk');

DELETE FROM `creature_movement_scripts` WHERE `id`=700703;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(700703, 0, 0, 28, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Water: Tiev Mordune - Set Standstate');

-- Misc
UPDATE `quest_template` SET `OfferRewardText` = 'The wind approaches you quickly from the horizon; the earth is steady beneath your feet; and your spirit is already warmed by fire--I would say it is time for you to learn about the purity of water.$B$BYour path has led you this far, and your spirit will give you the strength to carry on even further. But the first step is yours to take.' WHERE `entry` = 2986;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES
(3066, 2986),
(3173, 2985);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
