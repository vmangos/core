DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250609164004');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250609164004');
-- Add your query below.


-- Duskwood
SET @GGUID = 1013;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1731, 0, -11072.4, -1385.5, 72.7384, 5.91667, 0, 0, -0.182235, 0.983255, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1119, 0, 'Copper Vein - Duskwood', 0, 0, 10);

-- Westfall
SET @GGUID = 1024;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1731, 0, -10014.4, 1386.8, 41.4724, 1.8675, 0, 0, 0.803857, 0.594823, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1111, 0, 'Copper Vein - Westfall', 0, 0, 10);

-- Gol'Bolar Quarry
SET @GGUID = 1026;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1731, 0, -5656.84, -1794.18, 359.091, 4.99164, 0, 0, -0.601814, 0.798636, 300, 900, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 8005, 0, 'Copper Vein - Dun Morogh - Gol\'Bolar Quarry', 0, 0, 10);

-- Silver Stream Mine
SET @GGUID = 1030;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1731, 0, -4904.09, -2970.6, 316.725, 2.53072, 0, 0, 0.953716, 0.300708, 300, 900, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 8073, 0, 'Copper Veins - Loch Modan - Silver Stream Mine', 0, 0, 10);

-- Silverpine Forest
SET @GGUID = 1048;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1731, 0, 830.515, 621.588, 55.1183, 4.71239, 0, 0, -0.707107, 0.707107, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1044, 0, 'Copper Vein - Silverpine Forest', 0, 0, 10);

-- Thousand Needles
SET @GGUID = 1055;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1731, 1, -5699.97, -2421.49, -54.2629, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 2585, 0, 'Copper Vein - Thousand Needles', 0, 0, 10);

-- Durotar
SET @GGUID = 1058;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1731, 1, -1040.14, -4566.35, 45.4612, 1.6057, 0, 0, 0.719339, 0.694659, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1024, 0, 'Copper Vein - Durotar', 0, 0, 10);

-- Elwynn Forest
SET @GGUID = 2491;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1731, 0, -9733.24, -1031.51, 39.6084, 3.05433, 0, 0, 0.999048, 0.0436193, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1731, 0, -9530.15, 793.169, 60.0321, 2.1293, 0, 0, 0.874619, 0.48481, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1731, 0, -9505.85, -1566.84, 71.6791, 4.08407, 0, 0, -0.891006, 0.453991, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1731, 0, -9296.18, -1008.83, 55.8491, 6.16101, 0, 0, -0.0610485, 0.998135, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 1731, 0, -9211.76, -1331.8, 101.91, 1.15192, 0, 0, 0.544639, 0.838671, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 1731, 0, -9201.25, -821.463, 77.8971, 3.54302, 0, 0, -0.979924, 0.19937, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1015, 0, 'Copper Vein - Elwynn Forest', 0, 0, 10),
(@GGUID+1, 1015, 0, 'Copper Vein - Elwynn Forest', 0, 0, 10),
(@GGUID+2, 1015, 0, 'Copper Vein - Elwynn Forest', 0, 0, 10),
(@GGUID+3, 1015, 0, 'Copper Vein - Elwynn Forest', 0, 0, 10),
(@GGUID+4, 1015, 0, 'Copper Vein - Elwynn Forest', 0, 0, 10),
(@GGUID+5, 1015, 0, 'Copper Vein - Elwynn Forest', 0, 0, 10);

-- Loch Modan
SET @GGUID = 2479;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1731, 0, -6100.43, -2984.39, 419.492, 1.44862, 0, 0, 0.66262, 0.748956, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1731, 0, -6026.11, -3014, 405.146, 5.96903, 0, 0, -0.156434, 0.987688, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1731, 0, -5758.16, -2862.26, 372.467, 6.02139, 0, 0, -0.130526, 0.991445, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1731, 0, -5015.67, -3805.06, 328.101, 5.16618, 0, 0, -0.529919, 0.848048, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1166, 0, 'Copper Vein - Loch Modan', 0, 0, 10),
(@GGUID+1, 1166, 0, 'Copper Vein - Loch Modan', 0, 0, 10),
(@GGUID+2, 1166, 0, 'Copper Vein - Loch Modan', 0, 0, 10),
(@GGUID+3, 1166, 0, 'Copper Vein - Loch Modan', 0, 0, 10);

-- Dun Morogh
SET @GGUID = 3157;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1731, 0, -6113.85, -155.679, 438.348, 0.453785, 0, 0, 0.224951, 0.97437, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1731, 0, -5910.08, -1244.65, 432.552, 3.194, 0, 0, -0.999657, 0.0262016, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1731, 0, -5838.87, -1475.59, 366.429, 0.0174525, 0, 0, 0.00872612, 0.999962, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1731, 0, -5776.53, -2050.67, 403.284, 2.68781, 0, 0, 0.97437, 0.224951, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 1731, 0, -5749.16, 575.068, 406.071, 3.14159, 0, 0, -1, 0, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 1731, 0, -5674.74, 41.0316, 401.546, 2.07694, 0, 0, 0.861629, 0.507539, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+6, 1731, 0, -5674.05, -906.333, 403.961, 3.76991, 0, 0, -0.951056, 0.309017, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+7, 1731, 0, -5122.66, -227.769, 403.801, 3.64774, 0, 0, -0.968147, 0.250381, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1019, 0, 'Copper Vein - Dun Morogh', 0, 0, 10),
(@GGUID+1, 1019, 0, 'Copper Vein - Dun Morogh', 0, 0, 10),
(@GGUID+2, 1019, 0, 'Copper Vein - Dun Morogh', 0, 0, 10),
(@GGUID+3, 1019, 0, 'Copper Vein - Dun Morogh', 0, 0, 10),
(@GGUID+4, 1019, 0, 'Copper Vein - Dun Morogh', 0, 0, 10),
(@GGUID+5, 1019, 0, 'Copper Vein - Dun Morogh', 0, 0, 10),
(@GGUID+6, 1019, 0, 'Copper Vein - Dun Morogh', 0, 0, 10),
(@GGUID+7, 1019, 0, 'Copper Vein - Dun Morogh', 0, 0, 10);

-- Grizzled Den
SET @GGUID = 1604;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1731, 0, -5658.29, -280.815, 370.92, 0, 0, 0, 0, 1, 300, 900, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1731, 0, -5419.91, -131.974, 349.558, 1.06465, 0, 0, 0.507538, 0.861629, 300, 900, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 8003, 0, 'Copper Vein - Dun Morogh - Grizzled Den', 0, 0, 10),
(@GGUID+1, 8003, 0, 'Copper Vein - Dun Morogh - Grizzled Den', 0, 0, 10);

-- Frostmane Hold
SET @GGUID = 2634;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1731, 0, -5655.25, 702.673, 389.15, 4.41568, 0, 0, -0.803857, 0.594823, 300, 900, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1731, 0, -5620.77, 739.511, 383.757, 0.715585, 0, 0, 0.350207, 0.936672, 300, 900, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1731, 0, -5605.46, 727.469, 383.754, 5.55015, 0, 0, -0.358368, 0.93358, 300, 900, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1731, 0, -5566.91, 572.22, 394.714, 3.6652, 0, 0, -0.965925, 0.258821, 300, 900, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 1731, 0, -5566.41, 773.132, 385.154, 4.83456, 0, 0, -0.66262, 0.748956, 300, 900, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 1731, 0, -5540.89, 615.888, 398.518, 3.10665, 0, 0, 0.999847, 0.0174693, 300, 900, 100, 1, 0, 0, 0, 10),
(@GGUID+6, 1731, 0, -5517.67, 694.662, 396.999, 2.00713, 0, 0, 0.843391, 0.5373, 300, 900, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 8004, 0, 'Copper Vein - Dun Morogh - Frostmane Hold', 0, 0, 10),
(@GGUID+1, 8004, 0, 'Copper Vein - Dun Morogh - Frostmane Hold', 0, 0, 10),
(@GGUID+2, 8004, 0, 'Copper Vein - Dun Morogh - Frostmane Hold', 0, 0, 10),
(@GGUID+3, 8004, 0, 'Copper Vein - Dun Morogh - Frostmane Hold', 0, 0, 10),
(@GGUID+4, 8004, 0, 'Copper Vein - Dun Morogh - Frostmane Hold', 0, 0, 10),
(@GGUID+5, 8004, 0, 'Copper Vein - Dun Morogh - Frostmane Hold', 0, 0, 10),
(@GGUID+6, 8004, 0, 'Copper Vein - Dun Morogh - Frostmane Hold', 0, 0, 10);

-- Skittering Dark
SET @GGUID = 2204;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1731, 0, 1354.81, 1965.15, 14.021, 1.53589, 0, 0, 0.694658, 0.71934, 300, 900, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1731, 0, 1382.02, 1962.55, 15.3754, 4.85202, 0, 0, -0.656058, 0.75471, 300, 900, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1731, 0, 1430.73, 1939.74, 8.97005, 5.88176, 0, 0, -0.199368, 0.979925, 300, 900, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 8092, 0, 'Copper Vein - Silverpine Forest - Skittering Dark', 0, 0, 10),
(@GGUID+1, 8092, 0, 'Copper Vein - Silverpine Forest - Skittering Dark', 0, 0, 10),
(@GGUID+2, 8092, 0, 'Copper Vein - Silverpine Forest - Skittering Dark', 0, 0, 10);

-- Tirisfal
SET @GGUID = 5897;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1731, 0, 1657.44, -279.489, 56.2017, 3.47321, 0, 0, -0.986285, 0.16505, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1731, 0, 1954.12, 1223.42, 61.5855, 3.24635, 0, 0, -0.998629, 0.0523532, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1731, 0, 2085.72, -426.596, 45.7361, -2.82743, 0, 0, -0.987688, 0.156436, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1731, 0, 2104.39, -828.821, 112.061, 2.14675, 0, 0, 0.878817, 0.47716, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 1731, 0, 2159.71, -890.177, 89.4416, 1.93731, 0, 0, 0.824125, 0.566408, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 1731, 0, 2283.34, -1086.17, 83.1417, 4.18879, 0, 0, -0.866025, 0.500001, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+6, 1731, 0, 2473.81, 751.28, 57.4585, 5.07891, 0, 0, -0.566406, 0.824126, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+7, 1731, 0, 2517.72, 434.211, 29.6075, 3.17653, 0, 0, -0.999847, 0.0174693, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+8, 1731, 0, 2637.17, -658.979, 108.516, 3.12412, 0, 0, 0.999962, 0.00873464, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+9, 1731, 0, 2782.65, 758.797, 124.307, 1.88495, 0, 0, 0.809016, 0.587786, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+10, 1731, 0, 2843.99, 468.771, 20.1244, 1.3439, 0, 0, 0.622514, 0.782609, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+11, 1731, 0, 2869.09, 618.461, 117.791, 4.13643, 0, 0, -0.878817, 0.47716, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+12, 1731, 0, 2887.74, -325.06, 60.2809, 4.27606, 0, 0, -0.843391, 0.5373, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+13, 1731, 0, 2914.17, 318.584, 25.4894, 1.97222, 0, 0, 0.833885, 0.551938, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+14, 1731, 0, 3004.58, 896.272, 102.643, 5.74214, 0, 0, -0.267238, 0.963631, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+15, 1731, 0, 3017.09, 707.056, 99.7549, 3.54302, 0, 0, -0.979924, 0.19937, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+16, 1731, 0, 3040.21, 619.111, 98.6797, 4.7822, 0, 0, -0.681998, 0.731354, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+17, 1731, 0, 3042.23, -437.78, 6.26867, 4.38078, 0, 0, -0.814116, 0.580703, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1008, 0, 'Copper Vein - Tirisfal Glades', 0, 0, 10),
(@GGUID+1, 1008, 0, 'Copper Vein - Tirisfal Glades', 0, 0, 10),
(@GGUID+2, 1008, 0, 'Copper Vein - Tirisfal Glades', 0, 0, 10),
(@GGUID+3, 1008, 0, 'Copper Vein - Tirisfal Glades', 0, 0, 10),
(@GGUID+4, 1008, 0, 'Copper Vein - Tirisfal Glades', 0, 0, 10),
(@GGUID+5, 1008, 0, 'Copper Vein - Tirisfal Glades', 0, 0, 10),
(@GGUID+6, 1008, 0, 'Copper Vein - Tirisfal Glades', 0, 0, 10),
(@GGUID+7, 1008, 0, 'Copper Vein - Tirisfal Glades', 0, 0, 10),
(@GGUID+8, 1008, 0, 'Copper Vein - Tirisfal Glades', 0, 0, 10),
(@GGUID+9, 1008, 0, 'Copper Vein - Tirisfal Glades', 0, 0, 10),
(@GGUID+10, 1008, 0, 'Copper Vein - Tirisfal Glades', 0, 0, 10),
(@GGUID+11, 1008, 0, 'Copper Vein - Tirisfal Glades', 0, 0, 10),
(@GGUID+12, 1008, 0, 'Copper Vein - Tirisfal Glades', 0, 0, 10),
(@GGUID+13, 1008, 0, 'Copper Vein - Tirisfal Glades', 0, 0, 10),
(@GGUID+14, 1008, 0, 'Copper Vein - Tirisfal Glades', 0, 0, 10),
(@GGUID+15, 1008, 0, 'Copper Vein - Tirisfal Glades', 0, 0, 10),
(@GGUID+16, 1008, 0, 'Copper Vein - Tirisfal Glades', 0, 0, 10),
(@GGUID+17, 1008, 0, 'Copper Vein - Tirisfal Glades', 0, 0, 10);

-- Barrens
SET @GGUID = 2746;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1731, 1, -3862.99, -2441.34, 97.8637, 5.98648, 0, 0, -0.147809, 0.989016, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1731, 1, -1558.3, -3192.03, 96.6312, 5.89921, 0, 0, -0.190808, 0.981627, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1731, 1, -1488.98, -3509.48, 179.095, 5.06146, 0, 0, -0.573576, 0.819152, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1731, 1, -1300.41, -3262.67, 98.3092, 3.4383, 0, 0, -0.989016, 0.147811, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 3763, 1, -1495.71, -1483.02, 105.204, 5.28835, 0, 0, -0.477159, 0.878817, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 3763, 1, -1468.31, -1519.67, 95.6948, 3.73501, 0, 0, -0.956305, 0.292372, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 4303, 0, 'Copper Vein - Barrens', 0, 0, 10),
(@GGUID+1, 4303, 0, 'Copper Vein - Barrens', 0, 0, 10),
(@GGUID+2, 4303, 0, 'Copper Vein - Barrens', 0, 0, 10),
(@GGUID+3, 4303, 0, 'Copper Vein - Barrens', 0, 0, 10),
(@GGUID+4, 2588, 0, 'Copper Vein (3763) - Barrens', 0, 0, 10),
(@GGUID+5, 2588, 0, 'Copper Vein (3763) - Barrens', 0, 0, 10);

-- Mulgore
SET @GGUID = 2211;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1731, 1, -3053.41, 315.199, 150.878, 0.0174525, 0, 0, 0.00872612, 0.999962, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1731, 1, -1084.01, -1189.03, 74.0368, -2.02458, 0, 0, -0.848047, 0.529921, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1731, 1, -496.688, -448.461, 61.3525, 2.89725, 0, 0, 0.992546, 0.12187, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1028, 0, 'Copper Vein - Mulgore', 0, 0, 10),
(@GGUID+1, 1028, 0, 'Copper Vein - Mulgore', 0, 0, 10),
(@GGUID+2, 1028, 0, 'Copper Vein - Mulgore', 0, 0, 10);

-- Palemane Rock
SET @GGUID = 1617;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1731, 1, -2342.21, 530.949, 40.9719, 0.418879, 0, 0, 0.207911, 0.978148, 300, 900, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1731, 1, -2339.22, 486.35, 45.4588, 5.21854, 0, 0, -0.507538, 0.861629, 300, 900, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 8009, 0, 'Copper Vein - Mulgore - Palemane Rock', 0, 0, 10),
(@GGUID+1, 8009, 0, 'Copper Vein - Mulgore - Palemane Rock', 0, 0, 10);

-- Venture Co. Mine
SET @GGUID = 2582;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1731, 1, -1785.26, -1154.13, 116.714, 5.98648, 0, 0, -0.147809, 0.989016, 300, 900, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1731, 1, -1742.35, -1030.27, 121.385, 5.044, 0, 0, -0.580703, 0.814116, 300, 900, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1731, 1, -1693.59, -1207.56, 129.139, 4.2237, 0, 0, -0.857167, 0.515038, 300, 900, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1731, 1, -1638.59, -1169.32, 111.829, 1.22173, 0, 0, 0.573576, 0.819152, 300, 900, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 8008, 0, 'Copper Vein - Mulgore - Venture Co. Mine', 0, 0, 10),
(@GGUID+1, 8008, 0, 'Copper Vein - Mulgore - Venture Co. Mine', 0, 0, 10),
(@GGUID+2, 8008, 0, 'Copper Vein - Mulgore - Venture Co. Mine', 0, 0, 10),
(@GGUID+3, 8008, 0, 'Copper Vein - Mulgore - Venture Co. Mine', 0, 0, 10);

-- Stonetalon Mountains
SET @GGUID = 2256;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1731, 1, 177.252, -445.665, 21.8702, 1.71042, 0, 0, 0.754709, 0.656059, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1731, 1, 1272.78, 45.4122, 5.25526, 2.87979, 0, 0, 0.991445, 0.130528, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1731, 1, 1616.52, -270.224, 61.8016, 2.47837, 0, 0, 0.945518, 0.325568, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1089, 0, 'Copper Vein - Stonetalon Mountains', 0, 0, 10),
(@GGUID+1, 1089, 0, 'Copper Vein - Stonetalon Mountains', 0, 0, 10),
(@GGUID+2, 1089, 0, 'Copper Vein - Stonetalon Mountains', 0, 0, 10);

-- Ashenvale
SET @GGUID = 1633;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1731, 1, 2446, -103.604, 102.093, 3.9619, 0, 0, -0.91706, 0.39875, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1731, 1, 2546.42, 128.562, 100.143, 5.75959, 0, 0, -0.258819, 0.965926, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1075, 0, 'Copper Vein - Ashenvale', 0, 0, 10),
(@GGUID+1, 1075, 0, 'Copper Vein - Ashenvale', 0, 0, 10);

-- Darkshore
SET @GGUID = 2291;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1731, 1, 6276.09, 152.29, 38.1961, 6.10865, 0, 0, -0.0871553, 0.996195, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1731, 1, 7093.88, -456.053, 32.294, 0.95993, 0, 0, 0.461748, 0.887011, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1731, 1, 7784.44, -853.688, 34.283, 2.60054, 0, 0, 0.96363, 0.267241, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1098, 0, 'Copper Vein - Darkshore', 0, 0, 10),
(@GGUID+1, 1098, 0, 'Copper Vein - Darkshore', 0, 0, 10),
(@GGUID+2, 1098, 0, 'Copper Vein - Darkshore', 0, 0, 10);

-- Wailing Caverns
SET @GGUID = 2299;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1731, 43, -159.831, -324.855, -67.9101, 3.3685, 0, 0, -0.993571, 0.113208, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1731, 43, 11.0334, 528.04, -57.3123, 1.25664, 0, 0, 0.587785, 0.809017, 604800, 604800, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 4794, 0, 'Wailing Caverns - Copper Vein', 0, 0, 10),
(@GGUID+1, 4794, 0, 'Wailing Caverns - Copper Vein', 0, 0, 10);

-- Boulder Lode Mine
SET @GGUID = 1066;
SET @PTEMPLATE = 1246;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1731, 1, 1370.38, -3434.86, 98.207, 5.84685, 0, 0, -0.216439, 0.976296, 300, 900, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Copper Veins - Barrens - Boulder Lode Mine', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 0, 'Copper Veins - Barrens - Boulder Lode Mine', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 395, 0, 'Barrens - Boulder Lode Mine - Copper Veins', 0);

-- Stonesplinter Valley
SET @GGUID = 1085;
SET @PTEMPLATE = 1257;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1731, 0, -6118.86, -2984.57, 400.643, 4.20625, 0, 0, -0.861629, 0.507539, 300, 900, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Copper Veins - Loch Modan - Stonesplinter Valley', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 0, 'Copper Veins - Loch Modan - Stonesplinter Valley', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 8072, 0, 'Loch Modan - Stonesplinter Valley - Copper Veins', 0);

-- Cliffspring Falls
SET @GGUID = 1102;
SET @PTEMPLATE = 1272;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1731, 1, 6782.25, -644.613, 66.4197, 1.72787, 0, 0, 0.760406, 0.649449, 300, 900, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Copper Veins - Darkshore - Cliffspring Falls', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 0, 'Copper Veins - Darkshore - Cliffspring Falls', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 8062, 0, 'Darkshore - Cliffspring Falls - Copper Veins', 0);

-- Rethban Caverns
SET @GGUID = 2905;
SET @PTEMPLATE = 1696;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 2055, 0, -8935.75, -1996.76, 141.232, 6.00393, 0, 0, -0.139173, 0.990268, 300, 900, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 2055, 0, -8924.21, -2042.53, 130.215, -3.10665, 0, 0, -0.999847, 0.0174693, 300, 900, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 2055, 0, -8898.29, -1959.62, 137.719, 1.3439, 0, 0, 0.622514, 0.782609, 300, 900, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 2055, 0, -8878.65, -1899.83, 132.692, 3.68265, 0, 0, -0.96363, 0.267241, 300, 900, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 2055, 0, -8850.24, -2047.94, 125.614, 3.73501, 0, 0, -0.956305, 0.292372, 300, 900, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 2055, 0, -8802.57, -1927.02, 126.091, 3.45576, 0, 0, -0.987688, 0.156436, 300, 900, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Copper Veins - Redridge Mountains - Rethban Caverns', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Copper Veins - Redridge Mountains - Rethban Caverns', 0, 0, 0, 10),
(@PTEMPLATE+2, 1, 'Copper Veins - Redridge Mountains - Rethban Caverns', 0, 0, 0, 10),
(@PTEMPLATE+3, 1, 'Copper Veins - Redridge Mountains - Rethban Caverns', 0, 0, 0, 10),
(@PTEMPLATE+4, 1, 'Copper Veins - Redridge Mountains - Rethban Caverns', 0, 0, 0, 10),
(@PTEMPLATE+5, 1, 'Copper Veins - Redridge Mountains - Rethban Caverns', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 0, 'Copper Veins - Redridge Mountains - Rethban Caverns', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 0, 'Copper Veins - Redridge Mountains - Rethban Caverns', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+2, 0, 'Copper Veins - Redridge Mountains - Rethban Caverns', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+3, 0, 'Copper Veins - Redridge Mountains - Rethban Caverns', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+4, 0, 'Copper Veins - Redridge Mountains - Rethban Caverns', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+5, 0, 'Copper Veins - Redridge Mountains - Rethban Caverns', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 8079, 0, 'Redridge Mountains - Rethban Caverns - Copper Veins', 0),
(@PTEMPLATE+1, 8079, 0, 'Redridge Mountains - Rethban Caverns - Copper Veins', 0),
(@PTEMPLATE+2, 8079, 0, 'Redridge Mountains - Rethban Caverns - Copper Veins', 0),
(@PTEMPLATE+3, 8079, 0, 'Redridge Mountains - Rethban Caverns - Copper Veins', 0),
(@PTEMPLATE+4, 8079, 0, 'Redridge Mountains - Rethban Caverns - Copper Veins', 0),
(@PTEMPLATE+5, 8079, 0, 'Redridge Mountains - Rethban Caverns - Copper Veins', 0);

-- Deadmines Entrance
SET @GGUID = 2375;
SET @PTEMPLATE = 1631;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1731, 0, -11350.8, 1548.55, 30.5495, 4.45059, 0, 0, -0.793353, 0.608762, 300, 900, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1731, 0, -11328.8, 1594.18, 36.9639, 4.46804, 0, 0, -0.788011, 0.615662, 300, 900, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1731, 0, -11287.6, 1565.5, 37.6382, 5.20108, 0, 0, -0.515038, 0.857168, 300, 900, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Copper Veins - Westfall - Deadmines Entrance', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Copper Veins - Westfall - Deadmines Entrance', 0, 0, 0, 10),
(@PTEMPLATE+2, 1, 'Copper Veins - Westfall - Deadmines Entrance', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 0, 'Copper Veins - Westfall - Deadmines Entrance', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 0, 'Copper Veins - Westfall - Deadmines Entrance', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+2, 0, 'Copper Veins - Westfall - Deadmines Entrance', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 8054, 0, 'Westfall - Deadmines Entrance - Copper Veins', 0),
(@PTEMPLATE+1, 8054, 0, 'Westfall - Deadmines Entrance - Copper Veins', 0),
(@PTEMPLATE+2, 8054, 0, 'Westfall - Deadmines Entrance - Copper Veins', 0);

-- Jangolode Mine
SET @GGUID = 2387;
SET @PTEMPLATE = 1928;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1731, 0, -9892.91, 1420.05, 41.3209, 1.36136, 0, 0, 0.62932, 0.777146, 300, 900, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1731, 0, -9861.03, 1451.54, 41.9984, 5.88176, 0, 0, -0.199368, 0.979925, 300, 900, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1731, 0, -9833.92, 1408.46, 38.2337, 3.45576, 0, 0, -0.987688, 0.156436, 300, 900, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Copper Veins - Westfall - Jangolode Mine', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Copper Veins - Westfall - Jangolode Mine', 0, 0, 0, 10),
(@PTEMPLATE+2, 1, 'Copper Veins - Westfall - Jangolode Mine', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 0, 'Copper Veins - Westfall - Jangolode Mine', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 0, 'Copper Veins - Westfall - Jangolode Mine', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+2, 0, 'Copper Veins - Westfall - Jangolode Mine', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 8020, 0, 'Westfall - Jangolode Mine - Copper Veins', 0),
(@PTEMPLATE+1, 8020, 0, 'Westfall - Jangolode Mine - Copper Veins', 0),
(@PTEMPLATE+2, 8020, 0, 'Westfall - Jangolode Mine - Copper Veins', 0);

-- Gold Coast Quarry
SET @GGUID = 1654;
SET @PTEMPLATE = 1702;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1731, 0, -10560.3, 1980.62, -2.54986, 3.87463, 0, 0, -0.93358, 0.358368, 300, 900, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1731, 0, -10431, 1931.26, 10.2356, 5.39307, 0, 0, -0.430511, 0.902586, 300, 900, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Copper Veins - Westfall - Gold Coast Quarry', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Copper Veins - Westfall - Gold Coast Quarry', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 0, 'Copper Veins - Westfall - Gold Coast Quarry', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 0, 'Copper Veins - Westfall - Gold Coast Quarry', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 8036, 0, 'Westfall - Gold Coast Quarry - Copper Veins', 0),
(@PTEMPLATE+1, 8036, 0, 'Westfall - Gold Coast Quarry - Copper Veins', 0);

-- Render's Rock
SET @GGUID = 1661;
SET @PTEMPLATE = 1770;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1731, 0, -8759, -2159.01, 160.248, 1.88495, 0, 0, 0.809016, 0.587786, 300, 900, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1731, 0, -8667.75, -2278.18, 158.176, 0.95993, 0, 0, 0.461748, 0.887011, 300, 900, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Copper Veins - Redridge Mountains - Render\'s Rock', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Copper Veins - Redridge Mountains - Render\'s Rock', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 0, 'Copper Veins - Redridge Mountains - Render\'s Rock', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 0, 'Copper Veins - Redridge Mountains - Render\'s Rock', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 8091, 0, 'Redridge Mountains - Render\'s Rock - Copper Veins', 0),
(@PTEMPLATE+1, 8091, 0, 'Redridge Mountains - Render\'s Rock - Copper Veins', 0);

-- Beren's Peril
SET @GGUID = 1791;
SET @PTEMPLATE = 1877;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1731, 0, -355.392, 899.087, 132.781, 5.21854, 0, 0, -0.507538, 0.861629, 300, 900, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1731, 0, -334.055, 945.309, 132.997, 3.85718, 0, 0, -0.936671, 0.35021, 300, 900, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Copper Veins - Silverpine Forest - Beren\'s Peril', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Copper Veins - Silverpine Forest - Beren\'s Peril', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 0, 'Copper Veins - Silverpine Forest - Beren\'s Peril', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 0, 'Copper Veins - Silverpine Forest - Beren\'s Peril', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 8101, 0, 'Silverpine Forest - Beren\'s Peril - Copper Veins', 0),
(@PTEMPLATE+1, 8101, 0, 'Silverpine Forest - Beren\'s Peril - Copper Veins', 0);

UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 900 WHERE `id` IN (1731, 3763, 2055, 103713) AND `map` IN (0, 1);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
