DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200616191529');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200616191529');
-- Add your query below.


-- add guard parker waypoints
UPDATE `creature` SET `movement_type` = 2 WHERE `id` = 464;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(464, 1, -9609.64, -1902.4, 59.823, 4.08447, 300000, 0, 0),
(464, 2, -9614.26, -1902.14, 59.4534, 100, 0, 0, 0),
(464, 3, -9625.03, -1906.27, 59.3688, 100, 0, 0, 0),
(464, 4, -9622.17, -1909.69, 59.9193, 100, 0, 0, 0),
(464, 5, -9598.17, -1929.43, 62.9719, 100, 0, 0, 0),
(464, 6, -9588.01, -1942.85, 64.7999, 100, 0, 0, 0),
(464, 7, -9582.05, -1947.67, 66.0178, 100, 5000, 0, 0),
(464, 8, -9581.61, -1927.79, 64.057, 100, 0, 0, 0),
(464, 9, -9589.5, -1899.4, 60.7739, 100, 0, 0, 0),
(464, 10, -9596.89, -1879.37, 58.5883, 100, 0, 0, 0);


-- add guard ashlock waypoints
UPDATE `creature` SET `movement_type` = 2 WHERE `id` = 932;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(932, 1, -9411.45, -2263.29, 67.44, 2.96349, 138000, 0, 0),
(932, 2, -9412.7, -2274.91, 67.5881, 100, 0, 0, 0),
(932, 3, -9392.95, -2276.88, 69.2616, 100, 0, 0, 0),
(932, 4, -9376.98, -2278.46, 70.8277, 100, 0, 0, 0),
(932, 5, -9355.68, -2280.33, 71.638, 100, 0, 0, 0),
(932, 6, -9326.81, -2282.58, 71.3529, 100, 0, 0, 0),
(932, 7, -9304.62, -2284.34, 69.7367, 100, 0, 0, 0),
(932, 8, -9283.22, -2286.02, 67.513, 100, 0, 0, 0),
(932, 9, -9272.34, -2288.82, 68.3972, 100, 40000, 0, 0),
(932, 10, -9280.92, -2286.35, 67.575, 100, 0, 0, 0),
(932, 11, -9302.99, -2284.43, 69.4787, 100, 0, 0, 0),
(932, 12, -9325.11, -2282.69, 71.2947, 100, 0, 0, 0),
(932, 13, -9353.9, -2280.47, 71.6418, 100, 0, 0, 0),
(932, 14, -9375.76, -2278.53, 70.9219, 100, 0, 0, 0),
(932, 15, -9398.81, -2267.96, 68.2125, 100, 0, 0, 0),
(932, 16, -9404.16, -2264.43, 67.5405, 100, 0, 0, 0);


-- add guard howe script
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 903;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (90301, 903, 0, 1, 0, 100, 1, 25000, 25000, 180000, 180000, 90301, 0, 0, 'Guard Howe - Say Text OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (90301, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 53, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Howe - Say Text');

-- update guard clarke waypoints 
DELETE FROM `creature_movement` WHERE `id` = 10088;
DELETE FROM `creature_movement_template` WHERE `entry` = 934;
UPDATE `creature` SET `position_x` = -9266.45, `position_y` = -2182.23, `position_z` = 64.0898 WHERE `id` = 934;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(934, 1, -9266.45, -2182.23, 64.0898, 100, 0, 0, 0),
(934, 2, -9267.15, -2190.66, 64.0898, 100, 0, 0, 0),
(934, 3, -9266.46, -2197.24, 63.977, 100, 0, 0, 0),
(934, 4, -9265.52, -2199.73, 64.0586, 100, 0, 0, 0),
(934, 5, -9262.57, -2199.12, 64.0567, 100, 0, 0, 0),
(934, 6, -9265.44, -2199.72, 64.0586, 100, 0, 0, 0),
(934, 7, -9267.42, -2203.13, 64.0586, 100, 0, 0, 0),
(934, 8, -9265.77, -2214.89, 64.0584, 100, 0, 0, 0),
(934, 9, -9262.33, -2219.25, 63.9343, 100, 0, 0, 0),
(934, 10, -9266.99, -2221.09, 64.0521, 100, 0, 0, 0),
(934, 11, -9269.6, -2225.33, 64.0386, 100, 0, 0, 0),
(934, 12, -9270.27, -2243.48, 64.0462, 100, 0, 0, 0),
(934, 13, -9270.74, -2249.35, 64.2124, 100, 0, 0, 0),
(934, 14, -9271.01, -2264.53, 66.1423, 100, 0, 0, 0),
(934, 15, -9271.99, -2267.63, 66.4996, 100, 0, 0, 0),
(934, 16, -9273.32, -2269.94, 66.8647, 100, 0, 0, 0),
(934, 17, -9276.29, -2271.59, 67.3239, 100, 0, 0, 0),
(934, 18, -9279.75, -2263.68, 67.0197, 100, 0, 0, 0),
(934, 19, -9281.48, -2258.1, 65.1354, 100, 0, 0, 0),
(934, 20, -9283.07, -2247.62, 63.7107, 100, 0, 0, 0),
(934, 21, -9283.19, -2246.84, 63.6777, 100, 0, 0, 0),
(934, 22, -9283.75, -2239.96, 63.5313, 100, 0, 0, 0),
(934, 23, -9284.06, -2228.67, 63.4113, 100, 0, 0, 0),
(934, 24, -9284.29, -2225.03, 63.3697, 100, 0, 0, 0),
(934, 25, -9284.63, -2221.7, 63.3289, 100, 0, 0, 0),
(934, 26, -9284.85, -2219.53, 63.3023, 100, 0, 0, 0),
(934, 27, -9288.04, -2214.98, 62.9282, 100, 0, 0, 0),
(934, 28, -9293.16, -2213.18, 61.9805, 100, 0, 0, 0),
(934, 29, -9298.32, -2212.61, 61.8977, 100, 0, 0, 0),
(934, 30, -9299.46, -2212.44, 61.8977, 100, 0, 0, 0),
(934, 31, -9308.12, -2211.16, 61.8977, 100, 0, 0, 0),
(934, 32, -9314.33, -2210.5, 61.8977, 100, 0, 0, 0),
(934, 33, -9326.4, -2209.37, 61.8977, 100, 0, 0, 0),
(934, 34, -9338.37, -2207.38, 61.8977, 100, 0, 0, 0),
(934, 35, -9344.36, -2206.35, 61.8977, 100, 0, 0, 0),
(934, 36, -9338.37, -2207.38, 61.8977, 100, 0, 0, 0),
(934, 37, -9326.4, -2209.37, 61.8977, 100, 0, 0, 0),
(934, 38, -9314.33, -2210.5, 61.8977, 100, 0, 0, 0),
(934, 39, -9308.12, -2211.16, 61.8977, 100, 0, 0, 0),
(934, 40, -9299.46, -2212.44, 61.8977, 100, 0, 0, 0),
(934, 41, -9298.32, -2212.61, 61.8977, 100, 0, 0, 0),
(934, 42, -9293.24, -2213.16, 61.9698, 100, 0, 0, 0),
(934, 43, -9288.04, -2214.98, 62.9282, 100, 0, 0, 0),
(934, 44, -9284.85, -2219.62, 63.3034, 100, 0, 0, 0),
(934, 45, -9284.63, -2221.7, 63.3289, 100, 0, 0, 0),
(934, 46, -9284.31, -2224.9, 63.3682, 100, 0, 0, 0),
(934, 47, -9284.06, -2228.64, 63.411, 100, 0, 0, 0),
(934, 48, -9283.2, -2246.79, 63.6757, 100, 0, 0, 0),
(934, 49, -9281.5, -2257.96, 65.0833, 100, 0, 0, 0),
(934, 50, -9279.75, -2263.68, 67.0197, 100, 0, 0, 0),
(934, 51, -9276.29, -2271.59, 67.3239, 100, 0, 0, 0),
(934, 52, -9273.32, -2269.94, 66.8647, 100, 0, 0, 0),
(934, 53, -9271.99, -2267.63, 66.4996, 100, 0, 0, 0),
(934, 54, -9271.01, -2264.53, 66.1423, 100, 0, 0, 0),
(934, 55, -9270.74, -2249.5, 64.22, 100, 0, 0, 0),
(934, 56, -9270.26, -2243.47, 64.0462, 100, 0, 0, 0),
(934, 57, -9269.59, -2225.59, 64.0378, 100, 0, 0, 0),
(934, 58, -9267.76, -2221.29, 64.0534, 100, 0, 0, 0),
(934, 59, -9262.33, -2219.25, 63.9343, 100, 0, 0, 0),
(934, 60, -9265.77, -2214.89, 64.0584, 100, 0, 0, 0),
(934, 61, -9267.37, -2203.34, 64.0586, 100, 0, 0, 0),
(934, 62, -9267.42, -2203.13, 64.0586, 100, 0, 0, 0),
(934, 63, -9265.44, -2199.72, 64.0586, 100, 0, 0, 0),
(934, 64, -9262.57, -2199.12, 64.0567, 100, 0, 0, 0),
(934, 65, -9265.52, -2199.73, 64.0586, 100, 0, 0, 0),
(934, 66, -9266.46, -2197.24, 63.977, 100, 0, 0, 0),
(934, 67, -9267.15, -2190.66, 64.0898, 100, 0, 0, 0);

-- add roger and jamin scripts
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 5607;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (560701, 5607, 0, 1, 0, 100, 1, 1000, 15000, 150000, 180000, 560701, 0, 0, 'Roger - Start Conversation with Roger OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (560701, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1922, 0, 0, 0, 0, 0, 0, 0, 0, 'Roger - Say Text');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (560701, 0, 39, 560801, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Roger - Start Script to Say Texts');
DELETE FROM `event_scripts` WHERE `id`=560801;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (560801, 2, 0, 0, 0, 0, 0, 6153, 0, 9, 2, 1923, 0, 0, 0, 0, 0, 0, 0, 0, 'Jamin - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (560801, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1924, 0, 0, 0, 0, 0, 0, 0, 0, 'Roger - Say Text');

-- add rachel nathan running waypoints
DELETE FROM `creature_movement_template` WHERE `entry` = 849;
DELETE FROM `creature_movement` WHERE `id` = 6154;
UPDATE `creature` SET `position_x` = -9261.87, `position_y` = -2204.55, `position_z` = 64.0584 WHERE `id` = 849;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(849, 1, -9261.87, -2204.55, 64.0584, 100, 0, 0, 84901),
(849, 2, -9261.87, -2204.55, 64.0584, 100, 0, 0, 84901),
(849, 3, -9282.83, -2209.97, 63.3877, 100, 0, 0, 0),
(849, 4, -9301.25, -2213.08, 61.8977, 100, 0, 0, 0),
(849, 5, -9310.97, -2213.33, 61.8977, 100, 0, 0, 0),
(849, 6, -9315.62, -2213.45, 61.8977, 100, 0, 0, 0),
(849, 7, -9330.2, -2210.8, 61.8977, 100, 0, 0, 0),
(849, 8, -9340.87, -2207.14, 61.8977, 100, 0, 0, 0),
(849, 9, -9343.02, -2197.43, 61.8977, 100, 0, 0, 0),
(849, 10, -9343.81, -2187.63, 61.8977, 100, 0, 0, 0),
(849, 11, -9336.98, -2186.64, 61.8977, 100, 0, 0, 0),
(849, 12, -9339.89, -2200.43, 61.8977, 100, 0, 0, 0),
(849, 13, -9333.95, -2210.12, 61.8977, 100, 0, 0, 0),
(849, 14, -9330.47, -2210.75, 61.8977, 100, 0, 0, 0),
(849, 15, -9321.55, -2211.16, 61.8977, 100, 0, 0, 0),
(849, 16, -9302.36, -2210.39, 61.8977, 100, 0, 0, 0),
(849, 17, -9296.63, -2209.55, 61.8977, 100, 0, 0, 0),
(849, 18, -9288.54, -2204.6, 62.6703, 100, 0, 0, 0),
(849, 19, -9285.53, -2188.26, 61.3343, 100, 0, 0, 0),
(849, 20, -9284.87, -2184.13, 60.7893, 100, 0, 0, 0),
(849, 21, -9278.34, -2171, 60.5339, 100, 0, 0, 0),
(849, 22, -9268.07, -2144.49, 61.7918, 100, 0, 0, 0),
(849, 23, -9264.06, -2133.67, 64.2613, 100, 0, 0, 0),
(849, 24, -9258.41, -2131.88, 64.3106, 100, 0, 0, 0),
(849, 25, -9239.23, -2129.39, 63.9688, 100, 0, 0, 0),
(849, 26, -9227.58, -2127.89, 64.0584, 100, 0, 0, 0),
(849, 27, -9218.61, -2131.55, 64.0584, 100, 0, 0, 0),
(849, 28, -9211.34, -2134.51, 64.0584, 100, 0, 0, 0),
(849, 29, -9201.9, -2136.4, 64.1311, 100, 0, 0, 0),
(849, 30, -9199.55, -2136.14, 64.1766, 100, 0, 0, 0),
(849, 31, -9192.25, -2135.31, 64.4404, 100, 0, 0, 0),
(849, 32, -9190.95, -2136.76, 64.0945, 100, 0, 0, 0),
(849, 33, -9183.52, -2151.81, 64.0584, 100, 0, 0, 0),
(849, 34, -9183.23, -2153.86, 64.0584, 100, 0, 0, 0),
(849, 35, -9181, -2171.11, 64.0584, 100, 0, 0, 0),
(849, 36, -9180.76, -2173.08, 64.0584, 100, 0, 0, 0),
(849, 37, -9187.96, -2197.41, 64.0522, 100, 0, 0, 0),
(849, 38, -9189.03, -2198.99, 64.0514, 100, 0, 0, 0),
(849, 39, -9193.73, -2191.88, 64.0544, 100, 0, 0, 0),
(849, 40, -9193.95, -2190.23, 64.0551, 100, 0, 0, 0),
(849, 41, -9203.56, -2177.41, 64.0584, 100, 0, 0, 0),
(849, 42, -9204.96, -2176.53, 64.0584, 100, 0, 0, 0),
(849, 43, -9212.17, -2174.02, 64.0584, 100, 0, 0, 0),
(849, 44, -9213.79, -2174.03, 64.0584, 100, 0, 0, 0),
(849, 45, -9221.38, -2174.06, 64.0584, 100, 0, 0, 0),
(849, 46, -9231.65, -2174.3, 64.0558, 100, 0, 0, 0),
(849, 47, -9233.2, -2174.36, 64.055, 100, 0, 0, 0),
(849, 48, -9242.85, -2174.74, 64.0504, 100, 0, 0, 0),
(849, 49, -9241.15, -2180.4, 64.0499, 100, 0, 0, 0),
(849, 50, -9256.22, -2185.57, 64.0499, 100, 0, 0, 0),
(849, 51, -9257.27, -2186.56, 64.0499, 100, 0, 0, 0),
(849, 52, -9261.97, -2194.93, 64.0508, 100, 0, 0, 0),
(849, 53, -9264.77, -2203.95, 64.0586, 100, 0, 0, 0);
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (84901, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'rachel - run');
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES
(6154, 6155, 1.50062, 5.82011, 1);

-- add zem leeward scripts
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 348;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (34801, 348, 0, 1, 0, 100, 1, 1000, 15000, 150000, 180000, 34801, 0, 0, 'Zem Leeward - Say Text OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (34801, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 45, 46, 0, 0, 0, 0, 0, 0, 0, 'Zem Leeward - Say Text');

-- add madison waypoints
DELETE FROM `creature_movement_template` WHERE `entry` = 848;
DELETE FROM `creature_movement` WHERE `id` = 6150;
UPDATE `creature` SET `position_x` = -9327.6, `position_y` = -2202.14, `position_z` = 61.6543 WHERE `id` = 848;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(848, 1, -9327.6, -2202.14, 61.6543, 2.48597, 180000, 0, 84801),
(848, 2, -9327.6, -2202.14, 61.6543, 100, 0, 0, 84801),
(848, 3, -9288.57, -2207.7, 62.6775, 100, 0, 0, 0),
(848, 4, -9283.07, -2175.61, 59.7877, 100, 0, 0, 0),
(848, 5, -9262.11, -2129.53, 65.7599, 100, 0, 0, 0),
(848, 6, -9251.15, -2120.13, 65.595, 100, 0, 0, 0),
(848, 7, -9246.17, -2106.29, 69.2763, 100, 0, 0, 0),
(848, 8, -9241.55, -2058.98, 76.77, 100, 0, 0, 0),
(848, 9, -9247.91, -2045.51, 77.0013, 100, 0, 0, 0),
(848, 10, -9247.19, -2013.88, 77.0015, 100, 90000, 2, 0),
(848, 11, -9248.24, -2032.96, 76.9804, 100, 0, 0, 0),
(848, 12, -9241.26, -2057.29, 76.8678, 100, 0, 0, 0),
(848, 13, -9241.83, -2094.96, 74.013, 100, 0, 0, 0),
(848, 14, -9254.74, -2138.21, 63.9325, 100, 0, 0, 0),
(848, 15, -9255.15, -2181.33, 64.0119, 100, 0, 0, 0),
(848, 16, -9269.38, -2191.46, 64.0892, 100, 0, 0, 0),
(848, 17, -9280.25, -2210.56, 63.6031, 100, 0, 0, 0),
(848, 18, -9314.18, -2208.45, 61.8981, 100, 0, 0, 0);
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (84801, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Madison - Run');

-- add amy davenport waypoints
UPDATE `creature` SET `movement_type` = 2 WHERE `id` = 777;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(777, 1, -9260.21, -2203.09, 63.934, 3.33358, 40000, 0, 0),
(777, 2, -9261.72, -2199.52, 63.9353, 100, 40000, 0, 0),
(777, 3, -9262.13, -2204.12, 63.9335, 100, 1000, 0, 0);

-- add matthew hooper waypoints
UPDATE `creature` SET `movement_type` = 2 WHERE `id` = 1680;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(1680, 1, -9315.38, -2156.7, 63.4833, 4.83902, 45000, 0, 0),
(1680, 2, -9314.04, -2153.96, 63.4833, 100, 0, 0, 0),
(1680, 3, -9311.38, -2148.47, 63.4833, 100, 0, 0, 0),
(1680, 4, -9308.34, -2140.88, 63.4833, 100, 30000, 0, 168001),
(1680, 5, -9316.69, -2146.62, 63.4833, 2.83685, 45000, 0, 168002);
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (168001, 0, 25, 1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'matthew hooper - run');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (168002, 0, 25, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'matthew hooper - walk');

-- add darcy waypoints
UPDATE `creature` SET `position_x` = -9216.47, `position_y` = -2148.66, `position_z` = 64.3539, `movement_type` = 2 WHERE `id` = 379;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(379, 1, -9216.47, -2148.66, 64.3539, 100, 11000, 0, 0),
(379, 2, -9217.04, -2151.46, 64.3541, 100, 0, 0, 0),
(379, 3, -9218.84, -2155.02, 64.3541, 100, 0, 0, 0),
(379, 4, -9223.95, -2154.93, 63.7311, 100, 30000, 0, 0),
(379, 5, -9231.81, -2155.05, 64.3564, 100, 0, 0, 0),
(379, 6, -9236.02, -2158.94, 64.3574, 100, 192000, 0, 0),
(379, 7, -9233.59, -2155.21, 64.3564, 100, 0, 0, 0),
(379, 8, -9232.92, -2147.98, 64.3574, 100, 30000, 0, 0),
(379, 9, -9232.44, -2154.41, 64.3564, 100, 0, 0, 0),
(379, 10, -9226.46, -2155.25, 63.7313, 100, 0, 0, 0),
(379, 11, -9227.06, -2159.63, 63.731, 100, 30000, 0, 0),
(379, 12, -9226.46, -2155.25, 63.7313, 100, 0, 0, 0),
(379, 13, -9223.95, -2154.93, 63.7311, 100, 0, 0, 0),
(379, 14, -9218.84, -2155.02, 64.3541, 100, 0, 0, 0),
(379, 15, -9217.04, -2151.46, 64.3541, 100, 0, 0, 0);

-- add alma jainrose waypoints
UPDATE `creature` SET `movement_type` = 2 WHERE `id` = 812;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(812, 1, -9237.78, -2041.65, 78.1678, 4.64889, 45000, 0, 0),
(812, 2, -9234.28, -2033.73, 78.1663, 3.9619, 35000, 0, 0);

-- various npc's should roam
UPDATE `creature` SET `movement_type` = 1, `wander_distance` = 1 WHERE `guid` IN (6158);
UPDATE `creature` SET `movement_type` = 1, `wander_distance` = 0.5 WHERE `guid` IN (6717, 6721, 6265, 6262, 6260);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
