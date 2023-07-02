DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230701092538');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230701092538');
-- Add your query below.


-- Create new pool to hold Solid Chest spawns in Azshara.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(19, 5, 'Solid Chests in Azshara', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(48366, 19, 0, 'Solid Chest', 0, 10),
(48367, 19, 0, 'Solid Chest', 0, 10),
(48368, 19, 0, 'Solid Chest', 0, 10),
(48369, 19, 0, 'Solid Chest', 0, 10),
(48370, 19, 0, 'Solid Chest', 0, 10),
(48371, 19, 0, 'Solid Chest', 0, 10);

-- Create new pool to hold Solid Chest spawns in Western Plaguelands.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(17, 5, 'Solid Chests in Western Plaguelands', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(45484, 17, 0, 'Solid Chest', 0, 10),
(45485, 17, 0, 'Solid Chest', 0, 10),
(45488, 17, 0, 'Solid Chest', 0, 10),
(45492, 17, 0, 'Solid Chest', 0, 10),
(45548, 17, 0, 'Solid Chest', 0, 10);

-- Create new pool to hold Solid Chest spawns in Burning Steppes.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(16, 5, 'Solid Chests in Burning Steppes', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(6827, 16, 0, 'Solid Chest', 0, 10),
(6835, 16, 0, 'Solid Chest', 0, 10),
(6837, 16, 0, 'Solid Chest', 0, 10),
(6868, 16, 0, 'Solid Chest', 0, 10),
(6871, 16, 0, 'Solid Chest', 0, 10);

-- Create new pool to hold Solid Chest spawns in Eastern Plaguelands.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(18, 5, 'Solid Chests in Eastern Plaguelands', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(45735, 18, 0, 'Solid Chest', 0, 10),
(45949, 18, 0, 'Solid Chest', 0, 10),
(45950, 18, 0, 'Solid Chest', 0, 10);

-- Missing Solid Chest spawns in Azshara.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(48485, 153453, 1, 3137.52, -5671.9, 34.3905, 4.55531, 0, 0, -0.760406, 0.649449, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48368 at 695.513611 yards.
(48486, 153453, 1, 2957.74, -6046.32, -0.102492, 5.13127, 0, 0, -0.544639, 0.838671, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48366 at 622.576538 yards.
(48487, 153453, 1, 4376.94, -6132.56, 122.385, 1.8675, 0, 0, 0.803857, 0.594823, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48371 at 294.473602 yards.
(48488, 153453, 1, 4301.38, -7222.64, 24.7146, 1.27409, 0, 0, 0.594822, 0.803857, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48367 at 515.022156 yards.
(48493, 153453, 1, 2754.88, -5400.19, 116.273, 5.81195, 0, 0, -0.233445, 0.97237, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48368 at 232.919357 yards.
(48494, 153453, 1, 4459.83, -5529.17, 109.138, 4.57276, 0, 0, -0.754709, 0.656059, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48370 at 246.611710 yards.
(48499, 153453, 1, 2316.16, -6893.69, 123.094, 3.05433, 0, 0, 0.999048, 0.0436193, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48369 at 499.735626 yards.
(48500, 153453, 1, 4703.36, -5873.57, 110.646, 2.74016, 0, 0, 0.979924, 0.19937, 7200, 7200, 1, 100, 0, 10); -- Closest existing guid is 48370 at 497.952484 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(48485, 19, 0, 'Solid Chest', 0, 10), -- Solid Chests in Azshara
(48486, 19, 0, 'Solid Chest', 0, 10), -- Solid Chests in Azshara
(48487, 19, 0, 'Solid Chest', 0, 10), -- Solid Chests in Azshara
(48488, 19, 0, 'Solid Chest', 0, 10), -- Solid Chests in Azshara
(48493, 19, 0, 'Solid Chest', 0, 10), -- Solid Chests in Azshara
(48494, 19, 0, 'Solid Chest', 0, 10), -- Solid Chests in Azshara
(48499, 19, 0, 'Solid Chest', 0, 10), -- Solid Chests in Azshara
(48500, 19, 0, 'Solid Chest', 0, 10); -- Solid Chests in Azshara

-- Missing Solid Chest spawns in Western Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(45496, 153453, 0, 1459.34, -1589.07, 67.8359, 3.10665, 0, 0, 0.999847, 0.0174693, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 45484 at 236.859848 yards.
(45497, 153453, 0, 1271.73, -1386.66, 49.8822, 3.49067, 0, 0, -0.984807, 0.173652, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 45484 at 52.758896 yards.
(45498, 153453, 0, 1497.01, -1522.51, 56.3196, 2.07694, 0, 0, 0.861629, 0.507539, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 45484 at 235.734650 yards.
(45499, 153453, 0, 1425.59, -1697.22, 69.0793, 0.820303, 0, 0, 0.398748, 0.91706, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 45484 at 298.500427 yards.
(45551, 153453, 0, 2704.41, -1942.55, 72.15, 3.82227, 0, 0, -0.942641, 0.333808, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 45548 at 534.267883 yards.
(45500, 153453, 0, 1877.16, -1337.25, 60.108, 3.47321, 0, 0, -0.986285, 0.16505, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 45488 at 290.217651 yards.
(45501, 153453, 0, 1808.6, -1214.38, 60.3427, 3.9619, 0, 0, -0.91706, 0.39875, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 45492 at 360.258423 yards.
(45552, 153453, 0, 2389.43, -1526.34, 102.669, 1.27409, 0, 0, 0.594822, 0.803857, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 45548 at 309.359253 yards.
(45502, 153453, 0, 1501.24, -1896.6, 60.9601, 2.35619, 0, 0, 0.92388, 0.382683, 7200, 7200, 1, 100, 0, 10); -- Closest existing guid is 45485 at 493.355072 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(45496, 17, 0, 'Solid Chest', 0, 10), -- Solid Chests in Western Plaguelands
(45497, 17, 0, 'Solid Chest', 0, 10), -- Solid Chests in Western Plaguelands
(45498, 17, 0, 'Solid Chest', 0, 10), -- Solid Chests in Western Plaguelands
(45499, 17, 0, 'Solid Chest', 0, 10), -- Solid Chests in Western Plaguelands
(45551, 17, 0, 'Solid Chest', 0, 10), -- Solid Chests in Western Plaguelands
(45500, 17, 0, 'Solid Chest', 0, 10), -- Solid Chests in Western Plaguelands
(45501, 17, 0, 'Solid Chest', 0, 10), -- Solid Chests in Western Plaguelands
(45552, 17, 0, 'Solid Chest', 0, 10), -- Solid Chests in Western Plaguelands
(45502, 17, 0, 'Solid Chest', 0, 10); -- Solid Chests in Western Plaguelands

-- Missing Solid Chest spawns in Burning Steppes.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(6843, 153453, 0, -7985.18, -2630.35, 166.192, 1.309, 0, 0, 0.608761, 0.793354, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 6837 at 86.289696 yards.
(6844, 153453, 0, -8122.53, -2498.15, 139.938, 2.42601, 0, 0, 0.936672, 0.350207, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 6835 at 119.421928 yards.
(6850, 153453, 0, -7763.62, -1524.23, 131.932, 0.401425, 0, 0, 0.199368, 0.979925, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 6827 at 69.573997 yards.
(6869, 153453, 0, -7971.75, -1322.26, 132.953, 4.2237, 0, 0, -0.857167, 0.515038, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 6868 at 311.260773 yards.
(6873, 153453, 0, -8080.28, -1891.26, 147.863, 4.7473, 0, 0, -0.694658, 0.71934, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 6871 at 329.153107 yards.
(6856, 153453, 0, -7932.06, -2693.91, 146.367, 3.10665, 0, 0, 0.999847, 0.0174693, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 6837 at 45.039658 yards.
(7013, 153453, 0, -8092.34, -1403.27, 130.926, 4.41568, 0, 0, -0.803857, 0.594823, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 6871 at 188.487137 yards.
(6870, 153453, 0, -7956.8, -904.648, 131.554, 0.383971, 0, 0, 0.190808, 0.981627, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 6868 at 402.463318 yards.
(6858, 153453, 0, -7769.91, -2852.65, 133.439, 6.07375, 0, 0, -0.104528, 0.994522, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 6837 at 234.802902 yards.
(7083, 153453, 0, -8225.17, -1954.8, 142.569, 0.645772, 0, 0, 0.317305, 0.948324, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 6871 at 384.025665 yards.
(6864, 153453, 0, -7550.28, -2740.63, 136.647, 3.21142, 0, 0, -0.999391, 0.0349061, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 6837 at 365.105927 yards.
(7084, 153453, 0, -8073.49, -2968.62, 134.251, 4.01426, 0, 0, -0.906307, 0.422619, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 6837 at 348.905273 yards.
(7085, 153453, 0, -7702.62, -1460.46, 140.932, 1.29154, 0, 0, 0.601814, 0.798636, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 6827 at 74.965042 yards.
(7086, 153453, 0, -8068.42, -1762.72, 138.351, 1.88495, 0, 0, 0.809016, 0.587786, 7200, 7200, 1, 100, 0, 10); -- Closest existing guid is 6871 at 213.747787 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(6843, 16, 0, 'Solid Chest', 0, 10), -- Solid Chests in Burning Steppes
(6844, 16, 0, 'Solid Chest', 0, 10), -- Solid Chests in Burning Steppes
(6850, 16, 0, 'Solid Chest', 0, 10), -- Solid Chests in Burning Steppes
(6869, 16, 0, 'Solid Chest', 0, 10), -- Solid Chests in Burning Steppes
(6873, 16, 0, 'Solid Chest', 0, 10), -- Solid Chests in Burning Steppes
(6856, 16, 0, 'Solid Chest', 0, 10), -- Solid Chests in Burning Steppes
(7013, 16, 0, 'Solid Chest', 0, 10), -- Solid Chests in Burning Steppes
(6870, 16, 0, 'Solid Chest', 0, 10), -- Solid Chests in Burning Steppes
(6858, 16, 0, 'Solid Chest', 0, 10), -- Solid Chests in Burning Steppes
(7083, 16, 0, 'Solid Chest', 0, 10), -- Solid Chests in Burning Steppes
(6864, 16, 0, 'Solid Chest', 0, 10), -- Solid Chests in Burning Steppes
(7084, 16, 0, 'Solid Chest', 0, 10), -- Solid Chests in Burning Steppes
(7085, 16, 0, 'Solid Chest', 0, 10), -- Solid Chests in Burning Steppes
(7086, 16, 0, 'Solid Chest', 0, 10); -- Solid Chests in Burning Steppes

-- Missing Solid Chest spawns in Eastern Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(45951, 153453, 0, 2068.44, -4474.16, 75.8982, 0.506145, 0, 0, 0.25038, 0.968148, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 45950 at 86.721245 yards.
(45952, 153453, 0, 1964.44, -4475.61, 74.2907, 4.13643, 0, 0, -0.878817, 0.47716, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 45950 at 97.605690 yards.
(45737, 153453, 0, 3027.25, -3230.02, 146.529, 0.209439, 0, 0, 0.104528, 0.994522, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 45735 at 508.946869 yards.
(45953, 153453, 0, 1602.33, -3233.98, 67.0181, 3.927, 0, 0, -0.923879, 0.382686, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 45949 at 550.787842 yards.
(45956, 153453, 0, 1418.05, -3662, 77.246, 6.00393, 0, 0, -0.139173, 0.990268, 7200, 7200, 1, 100, 0, 10); -- Closest existing guid is 45949 at 439.072510 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(45951, 18, 0, 'Solid Chest', 0, 10), -- Solid Chests in Eastern Plaguelands
(45952, 18, 0, 'Solid Chest', 0, 10), -- Solid Chests in Eastern Plaguelands
(45737, 18, 0, 'Solid Chest', 0, 10), -- Solid Chests in Eastern Plaguelands
(45953, 18, 0, 'Solid Chest', 0, 10), -- Solid Chests in Eastern Plaguelands
(45956, 18, 0, 'Solid Chest', 0, 10); -- Solid Chests in Eastern Plaguelands

UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `id`= 153453;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
