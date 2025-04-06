DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250223093249');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250223093249');
-- Add your query below.


-- Battered Chest
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(654, 2843, 0, -6524.63, 362.427, 388.329, -2.75762, 0, 0, 0.981627, -0.190809, 300, 900, 100, 1, 0, 10); -- Dun Morogh
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(654, 20003, 'Dun Morogh - Coldridge Valley - Cave #3', 10);

-- Battered Chest
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(655, 2849, 0, 1008.1, 689.78, 60.975, -0.750491, 0, 0, 0.366501, -0.930418, 300, 300, 100, 1, 0, 10), -- Silverpine Forest
(656, 2849, 1, 1333.68, -3460.61, 95.1936, -0.733038, 0, 0, 0.358368, -0.93358, 300, 300, 100, 1, 0, 10), -- The Barrens
(659, 2849, 1, 508.974, -1187.51, 91.6904, -1.43117, 0, 0, 0.656059, -0.75471, 300, 300, 100, 1, 0, 10), -- The Barrens
(661, 2849, 1, 963.485, -256.297, -4.31736, -2.37365, 0, 0, 0.927184, -0.374607, 300, 300, 100, 1, 0, 10); -- Stonetalon Mountains
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(655, 35, 'Battered Chest', 10),
(656, 33, 'Battered Chest', 10),
(659, 33, 'Battered Chest', 10),
(661, 36, 'Battered Chest', 10);

-- Solid Chest
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(662, 2850, 0, -3030.09, -2259.15, 9.47054, -0.191986, 0, 0, 0.0958458, -0.995396, 300, 300, 100, 1, 0, 10), -- Wetlands
(663, 2850, 0, -9298, -2937.33, 163.846, 0.628319, 0, 0, 0.309017, 0.951057, 300, 300, 100, 1, 0, 10), -- Redridge Mountains
(667, 2850, 1, 2334.16, 44.381, 97.7759, -2.67035, 0, 0, 0.97237, -0.233445, 300, 300, 100, 1, 0, 10), -- Ashenvale
(671, 2850, 1, 1771.77, -1235.22, 156.567, -0.122173, 0, 0, 0.0610486, -0.998135, 300, 300, 100, 1, 0, 10), -- Ashenvale
(676, 2850, 1, 3392.14, -579.954, 188.144, -2.07694, 0, 0, 0.861629, -0.507538, 300, 300, 100, 1, 0, 10); -- Ashenvale
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(662, 3, 'Solid Chest', 10),
(663, 5, 'Solid Chest', 10),
(667, 8, 'Solid Chest', 10),
(671, 8, 'Solid Chest', 10),
(676, 8, 'Solid Chest', 10);

-- Solid Chest
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(681, 2852, 0, -11220.2, -153.509, 7.28759, -2.40855, 0, 0, 0.93358, -0.358368, 300, 300, 100, 1, 0, 10), -- Duskwood
(684, 2852, 0, -10451.8, -797.432, 52.3191, 1.74533, 0, 0, 0.766044, 0.642788, 300, 300, 100, 1, 0, 10), -- Duskwood
(685, 2852, 1, -5048.76, -942.561, -5.33799, -2.30383, 0, 0, 0.913545, -0.406737, 300, 300, 100, 1, 0, 10); -- Thousand Needles
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(681, 21, 'Solid Chest', 10),
(684, 21, 'Solid Chest', 10),
(685, 22, 'Solid Chest', 10);

-- Solid Chest
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(686, 2855, 0, -1340.1, 582.887, 103.529, -1.48353, 0, 0, 0.67559, -0.737277, 300, 300, 100, 1, 0, 10); -- Hillsbrad Foothills
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(686, 45, 'Solid Chest', 10);

-- Solid Chest
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(687, 2857, 0, -7055.18, -3638.68, 241.667, 1.29154, 0, 0, 0.601815, 0.798636, 300, 300, 100, 1, 0, 10), -- Badlands
(691, 2857, 0, -825.559, -3887.59, 147.768, -0.767945, 0, 0, 0.374607, -0.927184, 300, 300, 100, 1, 0, 10), -- Arathi Highlands
(696, 2857, 1, -2359.31, -4278.73, 0.512181, -0.575959, 0, 0, 0.284015, -0.95882, 300, 300, 100, 1, 0, 10); -- Dustwallow Marsh
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(687, 50, 'Solid Chest', 10),
(691, 52, 'Solid Chest', 10),
(696, 48, 'Solid Chest', 10);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(831, 4149, 0, -12386.2, -1068.35, 3.54067, 0.610865, 0, 0, 0.300706, 0.953717, 300, 300, 100, 1, 0, 10), -- Stranglethorn Vale
(834, 4149, 0, -13214.4, -485.175, 4.63056, -1.65806, 0, 0, 0.737277, -0.67559, 300, 300, 100, 1, 0, 10), -- Stranglethorn Vale
(840, 4149, 0, -6636.22, -650.602, 241.74, 2.93215, 0, 0, 0.994522, 0.104528, 300, 300, 100, 1, 0, 10), -- Searing Gorge
(841, 4149, 1, -4466.17, -3984.89, 28.6621, 0.541052, 0, 0, 0.267238, 0.96363, 300, 300, 100, 1, 0, 10); -- Dustwallow Marsh
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(831, 27, 'Solid Chest', 10),
(834, 27, 'Solid Chest', 10),
(840, 25, 'Solid Chest', 10),
(841, 29, 'Solid Chest', 10);

-- Large Battered Chest
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(899, 75293, 36, -121.301, -810.208, 16.9638, 1.76278, 0, 0, 0.771625, 0.636078, 604800, 604800, 100, 1, 0, 10); -- The Deadmines
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(899, 253, 'Battered Chest', 10);

-- Battered Chest
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(906, 106318, 0, -5581.71, 731.792, 391.769, 2.89725, 0, 0, 0.992546, 0.121869, 300, 900, 100, 1, 0, 10), -- Dun Morogh
(907, 106318, 0, -5552.33, 127.409, 452.539, -0.15708, 0, 0, 0.078459, -0.996917, 300, 900, 100, 1, 0, 10), -- Dun Morogh
(908, 106318, 0, 3053.4, 694.558, 66.4507, 2.3911, 0, 0, 0.930418, 0.366501, 300, 900, 100, 1, 0, 10), -- Tirisfal Glades
(909, 106318, 1, 915.269, -4714.02, 22.9547, -1.27409, 0, 0, 0.594823, -0.803857, 300, 900, 100, 1, 0, 10), -- Durotar
(910, 106318, 1, 10027.5, 273.265, 1323.58, 2.47837, 0, 0, 0.945519, 0.325568, 300, 900, 100, 1, 0, 10), -- Teldrassil
(913, 106318, 1, 9749.21, 1586.38, 1299.98, 1.91986, 0, 0, 0.819152, 0.573576, 300, 900, 100, 1, 0, 10), -- Teldrassil
(915, 106318, 1, 9703.41, 1543.03, 1254.1, 2.49582, 0, 0, 0.948324, 0.317305, 300, 900, 100, 1, 0, 10), -- Teldrassil
(916, 106318, 1, -1585.07, -1151.23, 104.118, 0.122173, 0, 0, 0.0610485, 0.998135, 300, 900, 100, 1, 0, 10), -- Mulgore
(917, 106318, 1, -2388.36, 444.887, 75.941, 1.15192, 0, 0, 0.544639, 0.838671, 300, 900, 100, 1, 0, 10); -- Mulgore
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(906, 20051, 'Battered Chest', 10),
(907, 20056, 'Battered Chest', 10),
(908, 20008, 'Battered Chest', 10),
(909, 20030, 'Battered Chest', 10),
(910, 20027, 'Battered Chest', 10),
(913, 20025, 'Battered Chest', 10),
(915, 20025, 'Battered Chest', 10),
(916, 20044, 'Battered Chest', 10),
(917, 20042, 'Battered Chest', 10);

-- Battered Chest
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(919, 106319, 0, -10557.7, 1990.01, -14.0808, -3.03687, 0, 0, 0.99863, -0.0523359, 300, 300, 100, 1, 0, 10), -- Westfall
(923, 106319, 1, 12.0282, -1774.23, 93.026, -0.733038, 0, 0, 0.358368, -0.93358, 300, 300, 100, 1, 0, 10), -- The Barrens
(927, 106319, 1, 389.084, -2100.03, 132.591, -0.453786, 0, 0, 0.224951, -0.97437, 300, 300, 100, 1, 0, 10), -- The Barrens
(928, 106319, 1, -213.471, -3040.08, 91.6667, 2.44346, 0, 0, 0.939693, 0.34202, 300, 300, 100, 1, 0, 10), -- The Barrens
(929, 106319, 1, 7549.98, 315.378, -3.96372, -1.71042, 0, 0, 0.75471, -0.656059, 300, 300, 100, 1, 0, 10); -- Darkshore
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(919, 13, 'Battered Chest', 10),
(923, 11, 'Battered Chest', 10),
(927, 11, 'Battered Chest', 10),
(928, 11, 'Battered Chest', 10),
(929, 15, 'Battered Chest', 10);

-- Solid Chest
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1032, 153451, 1, -8320.32, -3131.56, 8.64368, -0.890118, 0, 0, 0.430511, -0.902585, 300, 300, 100, 1, 0, 10); -- Tanaris
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(1032, 56, 'Solid Chest', 10);

-- Solid Chest
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1034, 153453, 0, 3118.88, -3750.21, 133.62, 0.558505, 0, 0, 0.275637, 0.961262, 300, 300, 100, 1, 0, 10); -- Eastern Plaguelands
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(1034, 18, 'Solid Chest', 10);

-- Solid Chest
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1039, 153454, 0, 1558.68, -5417.94, 75.197, 0.0523599, 0, 0, 0.0261769, 0.999657, 300, 300, 100, 1, 0, 10), -- Eastern Plaguelands
(1040, 153454, 1, 6356.18, -3952.89, 685.263, 1.91986, 0, 0, 0.819152, 0.573576, 300, 300, 100, 1, 0, 10); -- Winterspring
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(1039, 71, 'Solid Chest', 10),
(1040, 72, 'Solid Chest', 10);

-- Alliance Chest
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(784, 3715, 1, 2529.93, 1941.3, 348.085, -2.09439, 0, 0, 0.866025, -0.5, 300, 300, 100, 1, 0, 10); -- Stonetalon Mountains
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(784, 62, 'Alliance Chest', 10);

-- Armor Crate
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(291, 3689, 1, -4069.14, -2354.85, 108.909, -1.62316, 0, 0, 0.725374, -0.688354, 180, 180, 100, 1, 0, 10), -- The Barrens
(328, 3695, 1, -4069.14, -2354.85, 108.909, -1.62316, 0, 0, 0.725374, -0.688354, 180, 180, 100, 1, 0, 10), -- The Barrens
(330, 3702, 1, -4069.14, -2354.85, 108.909, -1.62316, 0, 0, 0.725374, -0.688354, 180, 180, 100, 1, 0, 10); -- The Barrens
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(417, 1, 'Food Crate / Armor Crate / Weapon Crate - Barrens', 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(291, 417, 'Food Crate / Armor Crate / Weapon Crate - Barrens', 0, 10),
(328, 417, 'Food Crate / Armor Crate / Weapon Crate - Barrens', 0, 10),
(330, 417, 'Food Crate / Armor Crate / Weapon Crate - Barrens', 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(417, 18843, 0, 'Food Crate / Armor Crate / Weapon Crate - Barrens', 0);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
