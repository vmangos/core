DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250322154932');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250322154932');
-- Add your query below.


-- Campfire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(642, 2061, 0, -4959.43, -1763.44, 501.246, -1.39629, -0.00560875, 0.00668481, -0.642763, 0.766015, 7200, 7200, 100, 1, 0, 10), -- Dun Morogh
(644, 2061, 0, -4667.15, -1715.61, 503.324, 2.59181, 0, 0, 0.962455, 0.271441, 7200, 7200, 100, 1, 0, 10), -- Dun Morogh
(645, 2061, 0, -5525.87, -671.844, 393.893, 1.71915, 0, 0, 0.757565, 0.65276, 7200, 7200, 100, 1, 0, 10), -- Dun Morogh
(649, 2061, 0, -5500.65, -709.025, 392.241, -0.968683, -0.00689942, 0.00534255, -0.465597, 0.884954, 7200, 7200, 100, 1, 0, 10), -- Dun Morogh
(650, 2061, 0, -5928.73, -2042.23, 402.145, -1.78024, 0, 0, -0.777146, 0.629321, 7200, 7200, 100, 1, 0, 10), -- Dun Morogh
(651, 2061, 0, -5928.74, -2041.12, 402.145, 1.36136, 0, 0, 0.62932, 0.777146, 7200, 7200, 100, 1, 0, 10), -- Dun Morogh
(652, 2061, 0, -10526.3, -1219.94, 28.172, -1.20428, 0, 0, -0.566406, 0.824126, 7200, 7200, 100, 1, 0, 10), -- Duskwood
(653, 2061, 0, -10021.2, 36.2417, 35.1069, -2.17294, 0, 0, 0.884988, -0.465614, 7200, 7200, 100, 1, 0, 10), -- Elwynn Forest
(698, 2061, 0, -10020.7, 35.5168, 35.1069, -0.881392, 0, 0, -0.426569, 0.904455, 7200, 7200, 100, 1, 0, 10), -- Elwynn Forest
(699, 2061, 0, -9380.32, -65.9266, 69.4086, -0.872663, 0, 0, -0.422618, 0.906308, 7200, 7200, 100, 1, 0, 10), -- Elwynn Forest
(723, 2061, 0, -9379.57, -65.7043, 64.4918, 1.31772, 0, 0, 0.612217, 0.79069, 7200, 7200, 100, 1, 0, 10), -- Elwynn Forest
(724, 2061, 0, -9546.69, -1431.85, 57.5837, 2.7838, 0, 0, 0.984041, 0.177943, 7200, 7200, 100, 1, 0, 10), -- Elwynn Forest
(725, 2061, 0, -9547.23, -1432.62, 57.5837, -1.309, 0, 0, -0.608762, 0.793353, 7200, 7200, 100, 1, 0, 10), -- Elwynn Forest
(726, 2061, 0, -8694.52, -2343.68, 155.916, -0.689406, 0, 0, -0.337917, 0.941176, 7200, 7200, 100, 1, 0, 10), -- Redridge Mountains
(729, 2061, 0, -501.668, -4581.94, 8.71589, 3.14159, 0, 0, 1, 0, 7200, 7200, 100, 1, 0, 10), -- The Hinterlands
(730, 2061, 0, -8451.33, 466.544, 96.9824, 1.4399, 0, 0, 0.659346, 0.75184, 7200, 7200, 100, 1, 0, 10), -- Stormwind City
(738, 2061, 0, -8451.59, 465.881, 96.9824, -1.66679, 0, 0, -0.740218, 0.672367, 7200, 7200, 100, 1, 0, 10), -- Stormwind City
(770, 2061, 0, -8882.69, 1084.04, 92.411, 2.67035, 0, 0, 0.97237, 0.233446, 7200, 7200, 100, 1, 0, 10), -- Stormwind City
(771, 2061, 0, -8882.17, 1083.55, 92.411, -0.506144, 0, 0, -0.250379, 0.968148, 7200, 7200, 100, 1, 0, 10), -- Stormwind City
(772, 2061, 0, -8979.4, 1031.92, 100.734, -0.898844, 0, 0, -0.434445, 0.900698, 7200, 7200, 100, 1, 0, 10), -- Stormwind City
(775, 2061, 0, -4931.68, -1279.03, 501.681, -0.881391, 0, 0, -0.426569, 0.904455, 7200, 7200, 100, 1, 0, 10), -- Ironforge
(776, 2061, 1, 307.906, -4662.34, 16.3877, -3.14159, 0, 0, 0.492424, 0.870356, 180, 180, 100, 1, 0, 10), -- Durotar
(781, 2061, 1, -2767.1, -3975.07, 34.9388, 3.14159, 0, 0, 1, 0, 180, 180, 100, 1, 0, 10), -- Dustwallow Marsh
(782, 2061, 1, -2693.04, -4278.89, 3.84184, -2.34747, 0, 0, -0.806445, 0.59131, 180, 180, 100, 1, 0, 10), -- Dustwallow Marsh
(785, 2061, 1, 3962.28, -5029.25, 137.339, 3.14159, 0, 0, 1, 0, 180, 180, 100, 1, 0, 10), -- Azshara
(789, 2061, 1, -2036.7, -1968.26, 91.6667, -2.24275, 0, 0, 0.989651, -0.143493, 180, 180, 100, 1, 0, 10), -- The Barrens
(795, 2061, 1, 4639.52, 147.079, 58.1845, -3.14159, 0.01745, 0.01745, 0.999695, -0.000305, 180, 180, 100, 1, 0, 10), -- Darkshore
(844, 2061, 1, 5108.47, -358.458, 356.974, -1.33738, 0, 0, -0.61996, 0.784633, 180, 180, 100, 1, 0, 10), -- Felwood
(846, 2061, 48, -534.789, 317.353, -49.8213, -3.13794, 0.019173, -0.021242, 0.99959, -0.00142004, 180, 180, 100, 1, 0, 10), -- Blackfathom Deeps
(847, 2061, 229, 106.177, -265.953, 91.5711, -1.46608, 0, 0, -0.66913, 0.743145, 180, 180, 100, 1, 0, 10), -- Blackrock Spire
(858, 2061, 229, 16.9937, -253.821, 65.4498, 3.14159, 0, 0, 1, -4.37114e-008, 180, 180, 100, 1, 0, 10), -- Blackrock Spire
(861, 2061, 229, 72.8373, -265.63, 60.7365, 3.14159, 0, 0, 1, -4.37114e-008, 180, 180, 100, 1, 0, 10), -- Blackrock Spire
(865, 2061, 229, 56.3641, -306.158, 54.0157, 3.14159, 0, 0, 1, -4.37114e-008, 180, 180, 100, 1, 0, 10), -- Blackrock Spire
(872, 2061, 229, 16.1674, -280.865, 9.61726, 3.14159, 0, 0, 1, -4.37114e-008, 180, 180, 100, 1, 0, 10), -- Blackrock Spire
(873, 2061, 229, 68.8802, -283.794, 60.7365, 3.14159, 0, 0, 1, -4.37114e-008, 180, 180, 100, 1, 0, 10), -- Blackrock Spire
(874, 2061, 229, 125.656, -280.808, 91.5711, 2.72271, 0, 0, 0.978148, 0.207912, 180, 180, 100, 1, 0, 10), -- Blackrock Spire
(875, 2061, 229, 70.5435, -257.169, 60.7401, 3.12414, 0, 0, 0.999962, 0.00872596, 180, 180, 100, 1, 0, 10), -- Blackrock Spire
(878, 2061, 229, 117.454, -254.291, 91.5711, 2.72271, 0, 0, 0.978148, 0.207912, 180, 180, 100, 1, 0, 10), -- Blackrock Spire
(879, 2061, 229, 8.17041, -268.98, 65.4498, 3.14159, 0, 0, 1, -4.37114e-008, 180, 180, 100, 1, 0, 10), -- Blackrock Spire
(889, 2061, 229, 51.2451, -274.133, 65.4498, 3.14159, 0, 0, 1, -4.37114e-008, 180, 180, 100, 1, 0, 10), -- Blackrock Spire
(890, 2061, 229, 46.4689, -309.649, 91.5711, 2.72271, 0, 0, 0.978148, 0.207912, 180, 180, 100, 1, 0, 10), -- Blackrock Spire
(891, 2061, 229, 107.69, -253.095, 91.5711, 2.72271, 0, 0, 0.978148, 0.207912, 180, 180, 100, 1, 0, 10), -- Blackrock Spire
(892, 2061, 229, 69.9731, -329.868, 55.8721, 3.14159, 0, 0, 1, -4.37114e-008, 180, 180, 100, 1, 0, 10), -- Blackrock Spire
(893, 2061, 229, 82.5879, -364.586, 116.859, 2.72271, 0, 0, 0.978148, 0.207912, 180, 180, 100, 1, 0, 10), -- Blackrock Spire
(894, 2061, 229, 229.028, -307.81, 76.9668, 2.72271, 0, 0, 0.978148, 0.207912, 180, 180, 100, 1, 0, 10), -- Blackrock Spire
(896, 2061, 229, 215.773, -341.663, 76.8611, 1.92859, 0, 0, 0.821647, 0.569997, 180, 180, 100, 1, 0, 10), -- Blackrock Spire
(897, 2061, 229, -59.1198, -339.829, 70.9606, -1.83259, 0, 0, -0.793353, 0.608762, 180, 180, 100, 1, 0, 10), -- Blackrock Spire
(898, 2061, 229, -87.3357, -348.37, 71.0397, 3.14159, 0, 0, 1, -4.37114e-008, 180, 180, 100, 1, 0, 10), -- Blackrock Spire
(905, 2061, 229, -137.264, -305.605, 70.9606, -1.83259, 0, 0, -0.793353, 0.608762, 180, 180, 100, 1, 0, 10), -- Blackrock Spire
(932, 2061, 229, -121.137, -296.445, 71.0397, 3.14159, 0, 0, 1, -4.37114e-008, 180, 180, 100, 1, 0, 10), -- Blackrock Spire
(935, 2061, 229, -63.2568, -581.483, 29.2934, -3.14141, -0.029565, 0.001571, 0.999562, -4.60437e-005, 180, 180, 100, 1, 0, 10), -- Blackrock Spire
(939, 2061, 229, 18.0824, -505.634, 110.914, -3.14097, -0.00823, 0.019018, 0.999785, -0.000157044, 180, 180, 100, 1, 0, 10), -- Blackrock Spire
(942, 2061, 229, 21.5668, -506.581, 110.914, -1.57017, 0.019267, -0.007628, -0.706844, 0.707066, 180, 180, 100, 1, 0, 10), -- Blackrock Spire
(946, 2061, 229, 27.4453, -505.634, 110.914, -0.261174, 0.01993, 0.00567701, -0.130343, 0.991252, 180, 180, 100, 1, 0, 10), -- Blackrock Spire
(947, 2061, 229, 24.542, -504.736, 110.914, -2.35557, -0.014881, 0.014421, 0.923621, -0.382746, 180, 180, 100, 1, 0, 10), -- Blackrock Spire
(950, 2061, 229, 35.2499, -505.634, 110.914, -3.14097, -0.00823, 0.019018, 0.999785, -0.000157044, 180, 180, 100, 1, 0, 10), -- Blackrock Spire
(952, 2061, 229, 88.2152, -415.1, 110.957, 2.72271, 0, 0, 0.978148, 0.207912, 180, 180, 100, 1, 0, 10), -- Blackrock Spire
(955, 2061, 229, 87.4498, -468.454, 116.887, 2.72271, 0, 0, 0.978148, 0.207912, 180, 180, 100, 1, 0, 10), -- Blackrock Spire
(956, 2061, 229, 31.283, -505.634, 110.914, 1.57142, 0.007628, 0.019267, 0.707066, 0.706844, 180, 180, 100, 1, 0, 10), -- Blackrock Spire
(957, 2061, 229, -25.3349, -478.438, 17.2504, 3.14159, 0, 0, 1, -4.37114e-008, 180, 180, 100, 1, 0, 10), -- Blackrock Spire
(958, 2061, 229, -15.4378, -368.781, 49.4936, 3.14011, -0.033376, -0.011083, 0.999381, 0.000369956, 180, 180, 100, 1, 0, 10), -- Blackrock Spire
(959, 2061, 229, 53.1921, -461.07, 24.3897, -3.14141, -0.029565, 0.001571, 0.999562, -4.60437e-005, 180, 180, 100, 1, 0, 10), -- Blackrock Spire
(975, 2061, 429, -21.1058, -392.466, -58.1027, -1.16064, 0, 0, -0.548293, 0.836286, 180, 180, 100, 1, 0, 10), -- Dire Maul
(976, 2061, 429, 4.30648, -441.621, -37.9976, -2.71399, 0, 0, 0.977231, -0.212178, 180, 180, 100, 1, 0, 10), -- Dire Maul
(977, 2061, 469, -7683.71, -1052.78, 440.643, -2.53073, 0, 0, 0.953717, -0.300706, 180, 180, 100, 1, 0, 10), -- Blackwing Lair
(979, 2061, 469, -7691.45, -1040.23, 440.685, -2.53073, 0, 0, 0.953717, -0.300706, 180, 180, 100, 1, 0, 10), -- Blackwing Lair
(982, 2061, 469, -7752.4, -1155.65, 396.696, -2.94961, 0, 0, 0.995396, -0.0958455, 180, 180, 100, 1, 0, 10), -- Blackwing Lair
(983, 2061, 469, -7579.63, -912.661, 428.384, -2.53073, 0, 0, 0.953717, -0.300706, 180, 180, 100, 1, 0, 10), -- Blackwing Lair
(985, 2061, 469, -7592.78, -921.296, 428.426, -2.53073, 0, 0, 0.953717, -0.300706, 180, 180, 100, 1, 0, 10); -- Blackwing Lair

-- Bonfire Damage
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(986, 2066, 1, 1550.69, -2862.28, 181.754, 3.14159, 0, 0, 0.403899, 0.914804, 180, 180, 100, 1, 0, 10), -- Ashenvale
(988, 2066, 1, 1005.74, 932.732, 103.23, 3.14159, 0, 0, 1, 0, 180, 180, 100, 1, 0, 10); -- Stonetalon Mountains
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (988, 27);

-- Bonfire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1644, 176505, 1, 1005.74, 932.732, 103.23, 3.14159, 0, 0, 1, 0, 180, 180, 100, 1, 0, 10); -- Stonetalon Mountains
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (1644, 27);

-- Half-Buried Bottle
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(992, 2560, 0, -13799.8, -246.344, 0.29165, 0.226893, 0, 0, 0.113203, 0.993572, 180, 180, 100, 1, 0, 10), -- Stranglethorn Vale
(994, 2560, 0, -13893.4, -184.903, 1.19649, -1.58825, 0, 0, 0.71325, -0.700909, 180, 180, 100, 1, 0, 10), -- Stranglethorn Vale
(996, 2560, 0, -13760.7, -259.575, 0.052545, 0.837758, 0, 0, 0.406737, 0.913545, 180, 180, 100, 1, 0, 10); -- Stranglethorn Vale

-- Sack of Oats
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(998, 2724, 0, -11016.6, 1935.3, 34.7743, -2.98451, 0, 0, 0.996917, -0.0784591, 180, 180, 100, 1, 0, 10), -- Westfall
(999, 2724, 0, -10641.2, 1753.2, 38.4942, -1.79769, 0, 0, 0.782608, -0.622515, 180, 180, 100, 1, 0, 10), -- Westfall
(1000, 2724, 0, -11159.9, 726.896, 32.9446, -0.628319, 0, 0, 0.309017, -0.951056, 180, 180, 100, 1, 0, 10); -- Westfall

-- Ambercorn
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1003, 2912, 1, -2466.27, 238.618, 60.3287, 0.349066, 0, 0, 0.173648, 0.984808, 180, 180, 100, 1, 0, 10); -- Mulgore

-- Plant Bundle
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1005, 17282, 1, 3854.67, -155.432, 2.73195, -1.55334, 0, 0, 0.700909, -0.71325, 60, 60, 100, 1, 0, 10), -- Ashenvale
(1006, 17282, 1, 3872.38, -182.069, 4.66719, 2.98451, 0, 0, 0.996917, 0.0784591, 60, 60, 100, 1, 0, 10); -- Ashenvale

-- Box of Assorted Parts
-- Pool 68: Box of Assorted Partss in The Barrens
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1007, 19019, 1, 1332.44, -3449.7, 95.1557, -0.610865, 0, 0, 0.300706, -0.953717, 300, 300, 100, 1, 0, 10); -- The Barrens
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(1007, 68, 0, 'Box of Assorted Parts', 0, 0, 10);

-- Scattered Crate
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1050, 28604, 0, -9933.41, -3711.39, 23.1958, -0.820305, 0, 0, 0.398749, -0.91706, 60, 60, 100, 1, 0, 10); -- Swamp of Sorrows

-- Sunscorched Shell
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1078, 89635, 1, -5082.1, -1056.9, -1.74951, -2.96706, 0, 0, 0.996195, -0.0871558, 60, 60, 100, 1, 0, 10); -- Thousand Needles

-- Artificial Extrapolator
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1166, 142344, 90, -369.787, 148.366, -208.02, -1.79769, 0, 0, 0.782608, -0.622515, 604800, 604800, 100, 1, 0, 10); -- Gnomeregan

-- Tablet of Markri
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1168, 148514, 1, 3257.28, -5297.19, 88.2631, 1.50098, 0, 0, 0.681998, 0.731354, 180, 180, 100, 1, 0, 10); -- Azshara

-- Atal'ai Statue
UPDATE `gameobject` SET `position_x`=-443.55, `position_y`=53.9243, `position_z`=-148.74, `orientation`=0.907571, `rotation0`=0, `rotation1`=0, `rotation2`=0.438371, `rotation3`=0.898794 WHERE `guid`=315035;

-- Hyacinth Mushroom
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1232, 152094, 1, 10546.4, 569.59, 1343.11, 2.75762, 0, 0, 0.981627, 0.190809, 180, 180, 100, 1, 0, 10); -- Teldrassil

-- Un'Goro Dirt Pile
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1233, 157936, 1, -7005.89, -230.212, -218.187, 4.71239, 0, 0, 0.707107, -0.707107, 180, 180, 100, 1, 0, 10); -- Un'Goro Crater

-- Red Power Crystal
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1248, 164658, 1, -7487.29, -2434.66, -172.157, 3.08923, 0, 0, 0.999657, 0.026177, 180, 180, 100, 1, 0, 10), -- Un'Goro Crater
(1253, 164659, 1, -7487.29, -2434.66, -172.157, 3.08923, 0, 0, 0.999657, 0.026177, 180, 180, 100, 1, 0, 10), -- Un'Goro Crater
(1255, 164660, 1, -7487.29, -2434.66, -172.157, 3.08923, 0, 0, 0.999657, 0.026177, 180, 180, 100, 1, 0, 10), -- Un'Goro Crater
(1256, 164661, 1, -7487.29, -2434.66, -172.157, 3.08923, 0, 0, 0.999657, 0.026177, 180, 180, 100, 1, 0, 10), -- Un'Goro Crater
(1257, 164778, 1, -7487.29, -2434.66, -172.157, 3.08923, 0, 0, 0.999657, 0.026177, 180, 180, 100, 1, 0, 10), -- Un'Goro Crater
(1258, 164779, 1, -7487.29, -2434.66, -172.157, 3.08923, 0, 0, 0.999657, 0.026177, 180, 180, 100, 1, 0, 10), -- Un'Goro Crater
(1259, 164780, 1, -7487.29, -2434.66, -172.157, 3.08923, 0, 0, 0.999657, 0.026177, 180, 180, 100, 1, 0, 10), -- Un'Goro Crater
(1260, 164781, 1, -7487.29, -2434.66, -172.157, 3.08923, 0, 0, 0.999657, 0.026177, 180, 180, 100, 1, 0, 10); -- Un'Goro Crater
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(1248, 1292, 0, 'Un\'Goro Crater - Power Crystals', 0, 0, 10),
(1253, 1292, 0, 'Un\'Goro Crater - Power Crystals', 0, 0, 10),
(1255, 1292, 0, 'Un\'Goro Crater - Power Crystals', 0, 0, 10),
(1256, 1292, 0, 'Un\'Goro Crater - Power Crystals', 0, 0, 10),
(1257, 1292, 0, 'Un\'Goro Crater - Power Crystals', 0, 0, 10),
(1258, 1292, 0, 'Un\'Goro Crater - Power Crystals', 0, 0, 10),
(1259, 1292, 0, 'Un\'Goro Crater - Power Crystals', 0, 0, 10),
(1260, 1292, 0, 'Un\'Goro Crater - Power Crystals', 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(1292, 1, 'Un\'Goro Crater - Power Crystals', 0, 0, 0, 10);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
