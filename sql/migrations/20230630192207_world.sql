DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230630192207');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230630192207');
-- Add your query below.


-- Create new pool to hold Solid Chest spawns in Duskwood.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(4, 7, 'Solid Chests in Duskwood', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(16983, 4, 0, 'Solid Chest', 0, 10),
(17033, 4, 0, 'Solid Chest', 0, 10),
(18565, 4, 0, 'Solid Chest', 0, 10),
(18572, 4, 0, 'Solid Chest', 0, 10),
(18577, 4, 0, 'Solid Chest', 0, 10),
(33475, 4, 0, 'Solid Chest', 0, 10);

-- Create new pool to hold Solid Chest spawns in Wetlands.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(3, 13, 'Solid Chests in Wetlands', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(15050, 3, 0, 'Solid Chest', 0, 10),
(15084, 3, 0, 'Solid Chest', 0, 10),
(15142, 3, 0, 'Solid Chest', 0, 10),
(15146, 3, 0, 'Solid Chest', 0, 10),
(15147, 3, 0, 'Solid Chest', 0, 10),
(15149, 3, 0, 'Solid Chest', 0, 10),
(15207, 3, 0, 'Solid Chest', 0, 10),
(15212, 3, 0, 'Solid Chest', 0, 10),
(15213, 3, 0, 'Solid Chest', 0, 10);

-- Create new pool to hold Solid Chest spawns in The Barrens.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(2, 2, 'Solid Chests in The Barrens', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(13079, 2, 0, 'Solid Chest', 0, 10);

-- Create new pool to hold Solid Chest spawns in Redridge Mountains.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(5, 9, 'Solid Chests in Redridge Mountains', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(18583, 5, 0, 'Solid Chest', 0, 10),
(18917, 5, 0, 'Solid Chest', 0, 10),
(20765, 5, 0, 'Solid Chest', 0, 10),
(20771, 5, 0, 'Solid Chest', 0, 10),
(20793, 5, 0, 'Solid Chest', 0, 10),
(29240, 5, 0, 'Solid Chest', 0, 10),
(31132, 5, 0, 'Solid Chest', 0, 10),
(42621, 5, 0, 'Solid Chest', 0, 10);

-- Create new pool to hold Solid Chest spawns in Hillsbrad Foothills.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(6, 2, 'Solid Chests in Hillsbrad Foothills', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(30018, 6, 0, 'Solid Chest', 0, 10);

-- Create new pool to hold Solid Chest spawns in Ashenvale.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(8, 5, 'Solid Chests in Ashenvale', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(47816, 8, 0, 'Solid Chest', 0, 10),
(47817, 8, 0, 'Solid Chest', 0, 10),
(47818, 8, 0, 'Solid Chest', 0, 10),
(47819, 8, 0, 'Solid Chest', 0, 10),
(47820, 8, 0, 'Solid Chest', 0, 10);

-- Create new pool to hold Solid Chest spawns in Stonetalon Mountains.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(7, 2, 'Solid Chests in Stonetalon Mountains', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(40712, 7, 0, 'Solid Chest', 0, 10),
(40713, 7, 0, 'Solid Chest', 0, 10);

-- Missing Solid Chest spawns in Duskwood.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(16984, 2850, 0, -11015.3, 240.348, 27.0152, 1.309, 0, 0, 0.608761, 0.793354, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 16983 at 29.275505 yards.
(18581, 2850, 0, -10205.7, 170.329, 27.2421, 2.89725, 0, 0, 0.992546, 0.12187, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 18572 at 212.125732 yards.
(33482, 2850, 0, -10759.3, -587.221, 36.8814, 1.01229, 0, 0, 0.484809, 0.87462, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 33475 at 78.713707 yards.
(33484, 2850, 0, -10784.6, -586.092, 37.9249, 4.43314, 0, 0, -0.798635, 0.601815, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 33475 at 54.132896 yards.
(18584, 2850, 0, -10698, -104.122, 37.9923, 5.74214, 0, 0, -0.267238, 0.963631, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 18572 at 406.715179 yards.
(17034, 2850, 0, -10819.8, -1384.35, 44.2552, 5.32326, 0, 0, -0.461748, 0.887011, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 17033 at 46.517521 yards.
(18589, 2850, 0, -10431.6, -22.1773, 47.5033, 4.62512, 0, 0, -0.737277, 0.675591, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 18572 at 131.285599 yards.
(18592, 2850, 0, -10222.7, -49.3107, 31.8578, 5.51524, 0, 0, -0.374606, 0.927184, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 18572 at 84.414818 yards.
(18606, 2850, 0, -10178.6, -1023.05, 27.6378, 4.13643, 0, 0, -0.878817, 0.47716, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 18577 at 259.647522 yards.
(18608, 2850, 0, -10173.1, -831.417, 41.9193, 5.48033, 0, 0, -0.390731, 0.920505, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 18577 at 67.558693 yards.
(18609, 2850, 0, -10516.3, 437.68, 37.7729, 5.84685, 0, 0, -0.216439, 0.976296, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 18572 at 504.933807 yards.
(18612, 2850, 0, -10205.6, 476.661, 27.0559, 5.35816, 0, 0, -0.446198, 0.894935, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 18572 at 504.665802 yards.
(17085, 2850, 0, -10792.3, -1377.22, 39.027, 1.5708, 0, 0, 0.707107, 0.707107, 3600, 3600, 1, 100, 0, 10); -- Closest existing guid is 17033 at 18.482624 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(16984, 4, 0, 'Solid Chest', 0, 10), -- Solid Chests in Duskwood
(18581, 4, 0, 'Solid Chest', 0, 10), -- Solid Chests in Duskwood
(33482, 4, 0, 'Solid Chest', 0, 10), -- Solid Chests in Duskwood
(33484, 4, 0, 'Solid Chest', 0, 10), -- Solid Chests in Duskwood
(18584, 4, 0, 'Solid Chest', 0, 10), -- Solid Chests in Duskwood
(17034, 4, 0, 'Solid Chest', 0, 10), -- Solid Chests in Duskwood
(18589, 4, 0, 'Solid Chest', 0, 10), -- Solid Chests in Duskwood
(18592, 4, 0, 'Solid Chest', 0, 10), -- Solid Chests in Duskwood
(18606, 4, 0, 'Solid Chest', 0, 10), -- Solid Chests in Duskwood
(18608, 4, 0, 'Solid Chest', 0, 10), -- Solid Chests in Duskwood
(18609, 4, 0, 'Solid Chest', 0, 10), -- Solid Chests in Duskwood
(18612, 4, 0, 'Solid Chest', 0, 10), -- Solid Chests in Duskwood
(17085, 4, 0, 'Solid Chest', 0, 10); -- Solid Chests in Duskwood

-- Missing Solid Chest spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(15208, 2850, 0, -3145.96, -1059.43, 8.08108, 0.575957, 0, 0, 0.284015, 0.95882, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 15207 at 180.764481 yards.
(15209, 2850, 0, -3212.39, -1022.89, 9.32691, 1.20428, 0, 0, 0.566406, 0.824126, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 15207 at 106.872597 yards.
(15150, 2850, 0, -3751.49, -2922.89, 12.0202, 3.73501, 0, 0, -0.956305, 0.292372, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 15149 at 161.463638 yards.
(15143, 2850, 0, -2995.48, -2525.18, 11.3921, 0.541051, 0, 0, 0.267238, 0.963631, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 15142 at 353.336548 yards.
(15210, 2850, 0, -3199.67, -950.395, 8.9407, 4.29351, 0, 0, -0.83867, 0.54464, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 15207 at 87.432243 yards.
(15151, 2850, 0, -3107.93, -963.956, 8.52378, 5.13127, 0, 0, -0.544639, 0.838671, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 15147 at 126.429352 yards.
(15085, 2850, 0, -4141.16, -2950.04, 11.5826, 5.88176, 0, 0, -0.199368, 0.979925, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 15084 at 84.651718 yards.
(15155, 2850, 0, -3778.29, -3009.95, 11.5863, 4.7473, 0, 0, -0.694658, 0.71934, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 15149 at 108.387543 yards.
(15225, 2850, 0, -4307.18, -2399.89, 209.588, 2.72271, 0, 0, 0.978148, 0.207912, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 15213 at 114.657211 yards.
(15226, 2850, 0, -3969.95, -2338.92, 18.2082, 0.0523589, 0, 0, 0.0261765, 0.999657, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 15212 at 202.458878 yards.
(15156, 2850, 0, -3050.79, -973.153, 9.12081, 0.837757, 0, 0, 0.406736, 0.913546, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 15147 at 70.838905 yards.
(15157, 2850, 0, -2800.48, -1002.4, -13.2592, 3.49067, 0, 0, -0.984807, 0.173652, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 15147 at 186.138901 yards.
(15158, 2850, 0, -2977.38, -1955.39, 9.45823, 3.76991, 0, 0, -0.951056, 0.309017, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 15146 at 125.002953 yards.
(15059, 2850, 0, -2970.03, -1697.64, 9.53065, 3.9619, 0, 0, -0.91706, 0.39875, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 15050 at 156.507217 yards.
(15160, 2850, 0, -3036.7, -2156.59, 9.97567, 4.85202, 0, 0, -0.656058, 0.75471, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 15142 at 79.391701 yards.
(15161, 2850, 0, -2991.62, -1058.62, 8.82124, 4.04917, 0, 0, -0.898793, 0.438373, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 15147 at 96.575203 yards.
(15162, 2850, 0, -2898.26, -2577.74, 33.8699, 3.29869, 0, 0, -0.996917, 0.0784664, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 15142 at 441.395508 yards.
(15211, 2850, 0, -3240.3, -1146.19, 9.08437, 2.67035, 0, 0, 0.972369, 0.233448, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 15207 at 205.195114 yards.
(15163, 2850, 0, -3104.2, -2267.92, 10.0134, 3.71755, 0, 0, -0.958819, 0.284016, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 15142 at 77.623634 yards.
(15227, 2850, 0, -4245.12, -2329.4, 206.53, 3.57793, 0, 0, -0.976295, 0.216442, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 15213 at 78.188194 yards.
(15086, 2850, 0, -3886.19, -3029.93, 11.0323, 2.70526, 0, 0, 0.976295, 0.216442, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 15084 at 185.719772 yards.
(15228, 2850, 0, -3790.94, -2454.6, 24.1786, 2.21657, 0, 0, 0.894934, 0.446199, 3600, 3600, 1, 100, 0, 10); -- Closest existing guid is 15212 at 89.356567 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(15208, 3, 0, 'Solid Chest', 0, 10), -- Solid Chests in Wetlands
(15209, 3, 0, 'Solid Chest', 0, 10), -- Solid Chests in Wetlands
(15150, 3, 0, 'Solid Chest', 0, 10), -- Solid Chests in Wetlands
(15143, 3, 0, 'Solid Chest', 0, 10), -- Solid Chests in Wetlands
(15210, 3, 0, 'Solid Chest', 0, 10), -- Solid Chests in Wetlands
(15151, 3, 0, 'Solid Chest', 0, 10), -- Solid Chests in Wetlands
(15085, 3, 0, 'Solid Chest', 0, 10), -- Solid Chests in Wetlands
(15155, 3, 0, 'Solid Chest', 0, 10), -- Solid Chests in Wetlands
(15225, 3, 0, 'Solid Chest', 0, 10), -- Solid Chests in Wetlands
(15226, 3, 0, 'Solid Chest', 0, 10), -- Solid Chests in Wetlands
(15156, 3, 0, 'Solid Chest', 0, 10), -- Solid Chests in Wetlands
(15157, 3, 0, 'Solid Chest', 0, 10), -- Solid Chests in Wetlands
(15158, 3, 0, 'Solid Chest', 0, 10), -- Solid Chests in Wetlands
(15059, 3, 0, 'Solid Chest', 0, 10), -- Solid Chests in Wetlands
(15160, 3, 0, 'Solid Chest', 0, 10), -- Solid Chests in Wetlands
(15161, 3, 0, 'Solid Chest', 0, 10), -- Solid Chests in Wetlands
(15162, 3, 0, 'Solid Chest', 0, 10), -- Solid Chests in Wetlands
(15211, 3, 0, 'Solid Chest', 0, 10), -- Solid Chests in Wetlands
(15163, 3, 0, 'Solid Chest', 0, 10), -- Solid Chests in Wetlands
(15227, 3, 0, 'Solid Chest', 0, 10), -- Solid Chests in Wetlands
(15086, 3, 0, 'Solid Chest', 0, 10), -- Solid Chests in Wetlands
(15228, 3, 0, 'Solid Chest', 0, 10); -- Solid Chests in Wetlands

-- Missing Solid Chest spawns in The Barrens.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(13100, 2850, 1, -4010.15, -1747.43, 97.6985, 0.191985, 0, 0, 0.0958452, 0.995396, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 13079 at 344.523529 yards.
(13102, 2850, 1, -3908.19, -1627.89, 91.6667, 3.21142, 0, 0, -0.999391, 0.0349061, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 13079 at 209.458755 yards.
(13103, 2850, 1, -3984.97, -1867.27, 92.1764, 1.41372, 0, 0, 0.649447, 0.760406, 3600, 3600, 1, 100, 0, 10); -- Closest existing guid is 13079 at 393.370087 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(13100, 2, 0, 'Solid Chest', 0, 10), -- Solid Chests in The Barrens
(13102, 2, 0, 'Solid Chest', 0, 10), -- Solid Chests in The Barrens
(13103, 2, 0, 'Solid Chest', 0, 10); -- Solid Chests in The Barrens

-- Missing Solid Chest spawns in Redridge Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(20794, 2850, 0, -8694.73, -2143.48, 158.255, 4.76475, 0, 0, -0.688354, 0.725374, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 20793 at 101.656555 yards.
(29245, 2850, 0, -8720.19, -2338.02, 155.916, 5.63741, 0, 0, -0.317305, 0.948324, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 29240 at 42.684891 yards.
(20799, 2850, 0, -9355.05, -3053.42, 136.687, 5.75959, 0, 0, -0.258819, 0.965926, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 20771 at 29.429087 yards.
(18588, 2850, 0, -9542.22, -3255.59, 48.8464, 3.57793, 0, 0, -0.976295, 0.216442, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 18583 at 130.444580 yards.
(20803, 2850, 0, -9246.9, -3418.03, 109.538, 4.01426, 0, 0, -0.906307, 0.422619, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 20765 at 156.804184 yards.
(20804, 2850, 0, -9373.07, -3168.83, 83.5116, 1.79769, 0, 0, 0.782608, 0.622515, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 20771 at 141.920609 yards.
(31149, 2850, 0, -9324.92, -2830.86, 69.0098, 5.02655, 0, 0, -0.587785, 0.809017, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 31132 at 139.969437 yards.
(20805, 2850, 0, -9223.85, -3300.4, 101.32, 6.26573, 0, 0, -0.00872612, 0.999962, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 20765 at 66.575356 yards.
(20806, 2850, 0, -9406.75, -3008.83, 136.687, 0.087266, 0, 0, 0.0436192, 0.999048, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 20771 at 67.547089 yards.
(29247, 2850, 0, -8686.61, -2301.04, 156.814, 4.38078, 0, 0, -0.814116, 0.580703, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 29240 at 63.455814 yards.
(20819, 2850, 0, -8792.6, -2175.8, 146.436, 1.01229, 0, 0, 0.484809, 0.87462, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 20793 at 46.614536 yards.
(20821, 2850, 0, -9117.6, -3225.17, 100.786, 3.68265, 0, 0, -0.96363, 0.267241, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 20765 at 75.608330 yards.
(20823, 2850, 0, -9373.04, -3079.24, 158.072, 3.78737, 0, 0, -0.948323, 0.317306, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 20771 at 28.744741 yards.
(20826, 2850, 0, -8831.21, -2198.59, 139.95, 1.88495, 0, 0, 0.809016, 0.587786, 3600, 3600, 1, 100, 0, 10); -- Closest existing guid is 20793 at 78.744133 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(20794, 5, 0, 'Solid Chest', 0, 10), -- Solid Chests in Redridge Mountains
(29245, 5, 0, 'Solid Chest', 0, 10), -- Solid Chests in Redridge Mountains
(20799, 5, 0, 'Solid Chest', 0, 10), -- Solid Chests in Redridge Mountains
(18588, 5, 0, 'Solid Chest', 0, 10), -- Solid Chests in Redridge Mountains
(20803, 5, 0, 'Solid Chest', 0, 10), -- Solid Chests in Redridge Mountains
(20804, 5, 0, 'Solid Chest', 0, 10), -- Solid Chests in Redridge Mountains
(31149, 5, 0, 'Solid Chest', 0, 10), -- Solid Chests in Redridge Mountains
(20805, 5, 0, 'Solid Chest', 0, 10), -- Solid Chests in Redridge Mountains
(20806, 5, 0, 'Solid Chest', 0, 10), -- Solid Chests in Redridge Mountains
(29247, 5, 0, 'Solid Chest', 0, 10), -- Solid Chests in Redridge Mountains
(20819, 5, 0, 'Solid Chest', 0, 10), -- Solid Chests in Redridge Mountains
(20821, 5, 0, 'Solid Chest', 0, 10), -- Solid Chests in Redridge Mountains
(20823, 5, 0, 'Solid Chest', 0, 10), -- Solid Chests in Redridge Mountains
(20826, 5, 0, 'Solid Chest', 0, 10); -- Solid Chests in Redridge Mountains

-- Missing Solid Chest spawns in Hillsbrad Foothills.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(30147, 2850, 0, -427.76, -1408.39, 99.0212, 3.07177, 0, 0, 0.999391, 0.0349061, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 30018 at 61.431728 yards.
(30148, 2850, 0, -404.319, -1339.46, 64.8823, 2.9845, 0, 0, 0.996917, 0.0784664, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 30018 at 136.736298 yards.
(30227, 2850, 0, -483.284, -1343.46, 53.6968, 2.09439, 0, 0, 0.866025, 0.500001, 3600, 3600, 1, 100, 0, 10); -- Closest existing guid is 30018 at 136.551422 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(30147, 6, 0, 'Solid Chest', 0, 10), -- Solid Chests in Hillsbrad Foothills
(30148, 6, 0, 'Solid Chest', 0, 10), -- Solid Chests in Hillsbrad Foothills
(30227, 6, 0, 'Solid Chest', 0, 10); -- Solid Chests in Hillsbrad Foothills

-- Missing Solid Chest spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(48098, 2850, 1, 1994.6, -1234.64, 57.3724, 0.523598, 0, 0, 0.258819, 0.965926, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 47816 at 274.035919 yards.
(48099, 2850, 1, 3288.89, -586.277, 156.085, 0.680677, 0, 0, 0.333806, 0.942642, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 47818 at 168.868256 yards.
(48100, 2850, 1, 2380.96, -1179.1, 91.4765, 3.47321, 0, 0, -0.986285, 0.16505, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 47819 at 247.790970 yards.
(48101, 2850, 1, 2203.02, -1432.82, 90.4306, 0.872664, 0, 0, 0.422618, 0.906308, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 47819 at 120.557076 yards.
(48102, 2850, 1, 3374.5, -485.57, 154.218, 1.16937, 0, 0, 0.551936, 0.833886, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 47818 at 168.386780 yards.
(48103, 2850, 1, 3334.05, -738.619, 165.437, 4.46804, 0, 0, -0.788011, 0.615662, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 47818 at 156.256973 yards.
(48104, 2850, 1, 3198.29, -273.749, 122.521, 1.51844, 0, 0, 0.688354, 0.725374, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 47817 at 105.092422 yards.
(48108, 2850, 1, 2241.25, -1544.39, 88.66, 0.820303, 0, 0, 0.398748, 0.91706, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 47819 at 148.825958 yards.
(48109, 2850, 1, 2343.71, 261.446, 153.828, 4.55531, 0, 0, -0.760406, 0.649449, 3600, 3600, 1, 100, 0, 10); -- Closest existing guid is 47820 at 561.195984 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(48098, 8, 0, 'Solid Chest', 0, 10), -- Solid Chests in Ashenvale
(48099, 8, 0, 'Solid Chest', 0, 10), -- Solid Chests in Ashenvale
(48100, 8, 0, 'Solid Chest', 0, 10), -- Solid Chests in Ashenvale
(48101, 8, 0, 'Solid Chest', 0, 10), -- Solid Chests in Ashenvale
(48102, 8, 0, 'Solid Chest', 0, 10), -- Solid Chests in Ashenvale
(48103, 8, 0, 'Solid Chest', 0, 10), -- Solid Chests in Ashenvale
(48104, 8, 0, 'Solid Chest', 0, 10), -- Solid Chests in Ashenvale
(48108, 8, 0, 'Solid Chest', 0, 10), -- Solid Chests in Ashenvale
(48109, 8, 0, 'Solid Chest', 0, 10); -- Solid Chests in Ashenvale

-- Missing Solid Chest spawns in Stonetalon Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(40725, 2850, 1, 676.759, 1439.35, -7.96637, 5.51524, 0, 0, -0.374606, 0.927184, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 40713 at 96.934174 yards.
(40726, 2850, 1, 1001.33, 1698.48, -5.53388, 0.087266, 0, 0, 0.0436192, 0.999048, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 40712 at 240.185837 yards.
(40727, 2850, 1, 898.908, 1559.58, -16.3545, 2.51327, 0, 0, 0.951056, 0.309017, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 40713 at 226.259995 yards.
(40728, 2850, 1, 628.739, 1822.79, -10.3557, 3.9619, 0, 0, -0.91706, 0.39875, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 40712 at 200.433624 yards.
(40729, 2850, 1, 767.892, 1653.52, -32.6456, 4.10153, 0, 0, -0.887011, 0.461749, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 40713 at 151.382767 yards.
(40730, 2850, 1, 651.431, 1917.55, -5.88195, 3.42085, 0, 0, -0.990268, 0.139175, 3600, 3600, 1, 100, 0, 10); -- Closest existing guid is 40712 at 182.611237 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(40725, 7, 0, 'Solid Chest', 0, 10), -- Solid Chests in Stonetalon Mountains
(40726, 7, 0, 'Solid Chest', 0, 10), -- Solid Chests in Stonetalon Mountains
(40727, 7, 0, 'Solid Chest', 0, 10), -- Solid Chests in Stonetalon Mountains
(40728, 7, 0, 'Solid Chest', 0, 10), -- Solid Chests in Stonetalon Mountains
(40729, 7, 0, 'Solid Chest', 0, 10), -- Solid Chests in Stonetalon Mountains
(40730, 7, 0, 'Solid Chest', 0, 10); -- Solid Chests in Stonetalon Mountains

-- Guid 60046 should be part of pool Battered Chests (106318) - Teldrassil - The Oracle Glade (20028).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (60046, 20028, 0, 'Battered Chest', 0, 10);

-- Missing Battered Chest spawns in Elwynn Forest.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(60053, 106318, 0, -9913.4, -1086.03, 25.0252, 1.0821, 0, 0, 0.515038, 0.857168, 300, 900, 1, 100, 0, 10); -- Closest existing guid is 60030 at 30.910257 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(60053, 20019, 0, 'Battered Chest', 0, 10); -- Battered Chests (106318) - Elwyn Forest - Southcoast (Murlocs)

-- Missing Battered Chest spawns in Teldrassil.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(49631, 106318, 1, 10652.6, 2016.06, 1326.44, 3.61284, 0, 0, -0.972369, 0.233448, 300, 900, 1, 100, 0, 10); -- Closest existing guid is 49623 at 58.145363 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(49631, 20028, 0, 'Battered Chest', 0, 10); -- Battered Chests (106318) - Teldrassil - The Oracle Glade

UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `id` = 2850;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
