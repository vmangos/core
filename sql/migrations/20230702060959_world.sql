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


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
