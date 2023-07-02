DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230702060959');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230702060959');
-- Add your query below.


-- Create new pool to hold Alliance Chest spawns in The Barrens.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(60, 1, 'Alliance Chests in The Barrens', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(13528, 60, 0, 'Alliance Chest', 0, 10);

-- Create new pool to hold Alliance Chest spawns in Hillsbrad Foothills.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(61, 2, 'Alliance Chests in Hillsbrad Foothills', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(20885, 61, 0, 'Alliance Chest', 0, 10),
(30036, 61, 0, 'Alliance Chest', 0, 10);

-- Create new pool to hold Alliance Chest spawns in Stonetalon Mountains.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(62, 2, 'Alliance Chests in Stonetalon Mountains', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(47589, 62, 0, 'Alliance Chest', 0, 10),
(47590, 62, 0, 'Alliance Chest', 0, 10);

-- Missing Alliance Chest spawns in The Barrens.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(13539, 3715, 1, -4113.86, -2302.24, 126.262, 5.61996, 0, 0, -0.325567, 0.945519, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 13528 at 129.830124 yards.
(13545, 3715, 1, -4065.35, -2417.5, 126.133, 3.57793, 0, 0, -0.976295, 0.216442, 3600, 3600, 1, 100, 0, 10); -- Closest existing guid is 13528 at 34.388451 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(13539, 60, 0, 'Alliance Chest', 0, 10), -- Alliance Chests in The Barrens
(13545, 60, 0, 'Alliance Chest', 0, 10); -- Alliance Chests in The Barrens

-- Missing Alliance Chest spawns in Hillsbrad Foothills.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(20957, 3715, 0, -336.64, 32.6983, 55.4212, 2.63544, 0, 0, 0.968147, 0.250381, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 20885 at 141.648819 yards.
(20958, 3715, 0, -488.521, 109.981, 60.4183, 6.23083, 0, 0, -0.0261765, 0.999657, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 20885 at 52.787895 yards.
(30262, 3715, 0, -396.274, -61.4486, 54.4769, 3.24635, 0, 0, -0.998629, 0.0523532, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 30036 at 67.082222 yards.
(20959, 3715, 0, -526.998, 100.357, 56.8403, 4.2237, 0, 0, -0.857167, 0.515038, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 20885 at 92.103302 yards.
(20960, 3715, 0, -566.732, 32.3075, 49.8843, 2.53072, 0, 0, 0.953716, 0.300708, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 20885 at 160.268631 yards.
(30263, 3715, 0, -553.312, -101.599, 45.8161, 2.96704, 0, 0, 0.996194, 0.087165, 3600, 3600, 1, 100, 0, 10); -- Closest existing guid is 30036 at 106.931511 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(20957, 61, 0, 'Alliance Chest', 0, 10), -- Alliance Chests in Hillsbrad Foothills
(20958, 61, 0, 'Alliance Chest', 0, 10), -- Alliance Chests in Hillsbrad Foothills
(30262, 61, 0, 'Alliance Chest', 0, 10), -- Alliance Chests in Hillsbrad Foothills
(20959, 61, 0, 'Alliance Chest', 0, 10), -- Alliance Chests in Hillsbrad Foothills
(20960, 61, 0, 'Alliance Chest', 0, 10), -- Alliance Chests in Hillsbrad Foothills
(30263, 61, 0, 'Alliance Chest', 0, 10); -- Alliance Chests in Hillsbrad Foothills

-- Missing Alliance Chest spawns in Stonetalon Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(47618, 3715, 1, 2416.15, 1760.86, 347.275, 1.11701, 0, 0, 0.529919, 0.848048, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 47589 at 142.485703 yards.
(47619, 3715, 1, 2518.13, 1982.36, 348.044, 2.28638, 0, 0, 0.909961, 0.414694, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 47590 at 26.936926 yards.
(47620, 3715, 1, 2493.49, 1856.61, 365.885, 2.86234, 0, 0, 0.990268, 0.139175, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 47589 at 23.358732 yards.
(47621, 3715, 1, 2419.41, 1791.47, 349.38, 3.17653, 0, 0, -0.999847, 0.0174693, 3600, 3600, 1, 100, 0, 10); -- Closest existing guid is 47589 at 120.184952 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(47618, 62, 0, 'Alliance Chest', 0, 10), -- Alliance Chests in Stonetalon Mountains
(47619, 62, 0, 'Alliance Chest', 0, 10), -- Alliance Chests in Stonetalon Mountains
(47620, 62, 0, 'Alliance Chest', 0, 10), -- Alliance Chests in Stonetalon Mountains
(47621, 62, 0, 'Alliance Chest', 0, 10); -- Alliance Chests in Stonetalon Mountains

UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `id`= 3715;

-- Create new pool to hold Horde Chest spawns in Arathi Highlands.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(65, 2, 'Horde Chests in Arathi Highlands', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(16947, 65, 0, 'Horde Chest', 0, 10);

-- Missing Horde Chest spawns in Arathi Highlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(16970, 105578, 0, -1487.69, -3124.46, 13.3643, 5.48033, 0, 0, -0.390731, 0.920505, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 16947 at 94.587196 yards.
(16971, 105578, 0, -1542.43, -3033.22, 12.9804, 6.23083, 0, 0, -0.0261765, 0.999657, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 16947 at 67.309319 yards.
(16972, 105578, 0, -1466.3, -3081.7, 13.2939, 2.89725, 0, 0, 0.992546, 0.12187, 7200, 7200, 1, 100, 0, 10); -- Closest existing guid is 16947 at 51.763432 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(16970, 65, 0, 'Horde Chest', 0, 10), -- Horde Chests in Arathi Highlands
(16971, 65, 0, 'Horde Chest', 0, 10), -- Horde Chests in Arathi Highlands
(16972, 65, 0, 'Horde Chest', 0, 10); -- Horde Chests in Arathi Highlands

UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `id`= 105578;

-- Create new pool to hold Alliance Chest spawns in The Barrens.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(66, 2, 'Alliance Chests in The Barrens', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(15748, 66, 0, 'Alliance Chest', 0, 10);

-- Create new pool to hold Alliance Chest spawns in Silverpine Forest.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(67, 3, 'Alliance Chests in Silverpine Forest', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(35449, 67, 0, 'Alliance Chest', 0, 10),
(35481, 67, 0, 'Alliance Chest', 0, 10),
(35489, 67, 0, 'Alliance Chest', 0, 10);

-- Missing Alliance Chest spawns in The Barrens.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(15752, 111095, 1, -2009.53, -3600.92, 21.7593, 3.56047, 0, 0, -0.978148, 0.207912, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 15748 at 156.407181 yards.
(15763, 111095, 1, -2214.52, -3689.79, 93.4471, 5.49779, 0, 0, -0.382683, 0.92388, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 15748 at 128.947769 yards.
(15764, 111095, 1, -2101.53, -3646.35, 61.716, 0.0523589, 0, 0, 0.0261765, 0.999657, 3600, 3600, 1, 100, 0, 10); -- Closest existing guid is 15748 at 86.649811 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(15752, 66, 0, 'Alliance Chest', 0, 10), -- Alliance Chests in The Barrens
(15763, 66, 0, 'Alliance Chest', 0, 10), -- Alliance Chests in The Barrens
(15764, 66, 0, 'Alliance Chest', 0, 10); -- Alliance Chests in The Barrens

-- Missing Alliance Chest spawns in Silverpine Forest.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(35563, 111095, 0, -83.4207, 802.136, 63.7815, 5.32326, 0, 0, -0.461748, 0.887011, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 35489 at 56.640015 yards.
(35482, 111095, 0, -470.033, 826.422, 96.8248, 5.67232, 0, 0, -0.300705, 0.953717, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 35481 at 245.915451 yards.
(35565, 111095, 0, -71.4637, 808.973, 64.8878, 3.14159, 0, 0, -1, 0, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 35489 at 70.286011 yards.
(35568, 111095, 0, -348.764, 949.185, 129.781, 0.767944, 0, 0, 0.374606, 0.927184, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 35481 at 195.435898 yards.
(35475, 111095, 0, 73.6614, 767.879, 63.6439, 4.88692, 0, 0, -0.642787, 0.766045, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 35449 at 56.494854 yards.
(35601, 111095, 0, 62.7082, 789.352, 64.0437, 2.42601, 0, 0, 0.936672, 0.350207, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 35449 at 39.882446 yards.
(35607, 111095, 0, 38.3443, 792.112, 64.9459, 6.16101, 0, 0, -0.0610485, 0.998135, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 35449 at 15.406877 yards.
(35613, 111095, 0, -105.879, 810.486, 63.712, 0.087266, 0, 0, 0.0436192, 0.999048, 3600, 3600, 1, 100, 0, 10); -- Closest existing guid is 35489 at 42.950706 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(35563, 67, 0, 'Alliance Chest', 0, 10), -- Alliance Chests in Silverpine Forest
(35482, 67, 0, 'Alliance Chest', 0, 10), -- Alliance Chests in Silverpine Forest
(35565, 67, 0, 'Alliance Chest', 0, 10), -- Alliance Chests in Silverpine Forest
(35568, 67, 0, 'Alliance Chest', 0, 10), -- Alliance Chests in Silverpine Forest
(35475, 67, 0, 'Alliance Chest', 0, 10), -- Alliance Chests in Silverpine Forest
(35601, 67, 0, 'Alliance Chest', 0, 10), -- Alliance Chests in Silverpine Forest
(35607, 67, 0, 'Alliance Chest', 0, 10), -- Alliance Chests in Silverpine Forest
(35613, 67, 0, 'Alliance Chest', 0, 10); -- Alliance Chests in Silverpine Forest

UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `id`= 111095;

-- Create new pool to hold Alliance Chest spawns in Hillsbrad Foothills.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(70, 2, 'Alliance Chests in Hillsbrad Foothills', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(29650, 70, 0, 'Alliance Chest', 0, 10),
(30032, 70, 0, 'Alliance Chest', 0, 10);

-- Missing Alliance Chest spawns in Hillsbrad Foothills.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(30264, 4096, 0, -1290.25, -1224.9, 22.957, 5.00909, 0, 0, -0.594823, 0.803857, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 30032 at 73.315445 yards.
(29663, 4096, 0, -801.115, 65.3181, 8.89202, 0.785397, 0, 0, 0.382683, 0.92388, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 29650 at 42.744179 yards.
(29664, 4096, 0, -722.055, 131.321, 21.1245, 4.31097, 0, 0, -0.833885, 0.551938, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 29650 at 142.692291 yards.
(30265, 4096, 0, -1296.34, -1172.98, 38.0041, 1.5708, 0, 0, 0.707107, 0.707107, 7200, 7200, 1, 100, 0, 10); -- Closest existing guid is 30032 at 95.762459 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(30264, 70, 0, 'Alliance Chest', 0, 10), -- Alliance Chests in Hillsbrad Foothills
(29663, 70, 0, 'Alliance Chest', 0, 10), -- Alliance Chests in Hillsbrad Foothills
(29664, 70, 0, 'Alliance Chest', 0, 10), -- Alliance Chests in Hillsbrad Foothills
(30265, 70, 0, 'Alliance Chest', 0, 10); -- Alliance Chests in Hillsbrad Foothills

UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `id`= 4096;

-- Create new pool to hold Alliance Chest spawns in Arathi Highlands.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(74, 1, 'Alliance Chests in Arathi Highlands', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(16992, 74, 0, 'Alliance Chest', 0, 10);

-- Missing Alliance Chest spawns in Arathi Highlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(17031, 105581, 0, -1544.81, -1751.48, 68.1662, 1.11701, 0, 0, 0.529919, 0.848048, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 16992 at 134.963043 yards.
(17032, 105581, 0, -1601.2, -1645, 68.1097, 2.9845, 0, 0, 0.996917, 0.0784664, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 16992 at 69.362106 yards.
(17035, 105581, 0, -1509.78, -1689.98, 68.8217, 4.90438, 0, 0, -0.636078, 0.771625, 7200, 7200, 1, 100, 0, 10); -- Closest existing guid is 16992 at 150.650986 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(17031, 74, 0, 'Alliance Chest', 0, 10), -- Alliance Chests in Arathi Highlands
(17032, 74, 0, 'Alliance Chest', 0, 10), -- Alliance Chests in Arathi Highlands
(17035, 74, 0, 'Alliance Chest', 0, 10); -- Alliance Chests in Arathi Highlands

UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `id`= 105581;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
