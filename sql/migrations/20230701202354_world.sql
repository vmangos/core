DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230701202354');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230701202354');
-- Add your query below.


-- Create new pool to hold Solid Chest spawns in Blasted Lands.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(57, 2, 'Solid Chests in Blasted Lands', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(32134, 57, 0, 'Solid Chest', 0, 10),
(42439, 57, 0, 'Solid Chest', 0, 10);

-- Create new pool to hold Solid Chest spawns in Azshara.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(59, 5, 'Solid Chests in Azshara', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(48362, 59, 0, 'Solid Chest', 0, 10),
(48363, 59, 0, 'Solid Chest', 0, 10),
(48364, 59, 0, 'Solid Chest', 0, 10),
(48365, 59, 0, 'Solid Chest', 0, 10);

-- Create new pool to hold Solid Chest spawns in The Hinterlands.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(58, 7, 'Solid Chests in The Hinterlands', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(46292, 58, 0, 'Solid Chest', 0, 10),
(46345, 58, 0, 'Solid Chest', 0, 10),
(46346, 58, 0, 'Solid Chest', 0, 10),
(46370, 58, 0, 'Solid Chest', 0, 10),
(46430, 58, 0, 'Solid Chest', 0, 10);

-- Create new pool to hold Solid Chest spawns in Tanaris.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(56, 4, 'Solid Chests in Tanaris', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(17329, 56, 0, 'Solid Chest', 0, 10),
(17330, 56, 0, 'Solid Chest', 0, 10),
(17331, 56, 0, 'Solid Chest', 0, 10);

-- Missing Solid Chest spawns in Blasted Lands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(32510, 153451, 0, -11331.9, -3332.5, 8.61777, 2.54818, 0, 0, 0.956305, 0.292372, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 32134 at 104.096306 yards.
(42444, 153451, 0, -10834.8, -2728.32, 7.77758, 2.09439, 0, 0, 0.866025, 0.500001, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 42439 at 81.545799 yards.
(42445, 153451, 0, -10858.3, -2645.97, 8.7453, 4.15388, 0, 0, -0.874619, 0.48481, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 42439 at 34.311974 yards.
(32514, 153451, 0, -11227.9, -3480.42, 8.41118, 5.39307, 0, 0, -0.430511, 0.902586, 7200, 7200, 1, 100, 0, 10); -- Closest existing guid is 32134 at 95.742867 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(32510, 57, 0, 'Solid Chest', 0, 10), -- Solid Chests in Blasted Lands
(42444, 57, 0, 'Solid Chest', 0, 10), -- Solid Chests in Blasted Lands
(42445, 57, 0, 'Solid Chest', 0, 10), -- Solid Chests in Blasted Lands
(32514, 57, 0, 'Solid Chest', 0, 10); -- Solid Chests in Blasted Lands

-- Missing Solid Chest spawns in Azshara.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(48509, 153451, 1, 3448.36, -4623.76, 103.711, 2.26893, 0, 0, 0.906307, 0.422619, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48365 at 316.035919 yards.
(48525, 153451, 1, 3653.14, -5367.08, 111.546, 2.47837, 0, 0, 0.945518, 0.325568, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48363 at 160.257553 yards.
(48554, 153451, 1, 4129.42, -5078.69, 144.178, 3.26377, 0, 0, -0.998135, 0.0610518, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48364 at 356.703186 yards.
(48556, 153451, 1, 3231.76, -4316.57, 131.014, 2.54818, 0, 0, 0.956305, 0.292372, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48362 at 266.518524 yards.
(48570, 153451, 1, 3969.52, -5034.33, 136.582, 1.95477, 0, 0, 0.829038, 0.559193, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48364 at 196.714645 yards.
(48575, 153451, 1, 2869.88, -4038.23, 142.5, 0.122173, 0, 0, 0.0610485, 0.998135, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48362 at 197.403336 yards.
(48578, 153451, 1, 3570.11, -5089.52, 84.794, 3.82227, 0, 0, -0.942641, 0.333808, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48365 at 195.928894 yards.
(48581, 153451, 1, 3264.44, -4590.36, 98.1213, 6.02139, 0, 0, -0.130526, 0.991445, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48365 at 457.536194 yards.
(48585, 153451, 1, 3328.43, -5143.73, 87.2847, 4.41568, 0, 0, -0.803857, 0.594823, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48365 at 366.762665 yards.
(48587, 153451, 1, 3549.59, -4760.24, 110.663, 0.698131, 0, 0, 0.34202, 0.939693, 7200, 7200, 1, 100, 0, 10); -- Closest existing guid is 48365 at 149.479965 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(48509, 59, 0, 'Solid Chest', 0, 10), -- Solid Chests in Azshara
(48525, 59, 0, 'Solid Chest', 0, 10), -- Solid Chests in Azshara
(48554, 59, 0, 'Solid Chest', 0, 10), -- Solid Chests in Azshara
(48556, 59, 0, 'Solid Chest', 0, 10), -- Solid Chests in Azshara
(48570, 59, 0, 'Solid Chest', 0, 10), -- Solid Chests in Azshara
(48575, 59, 0, 'Solid Chest', 0, 10), -- Solid Chests in Azshara
(48578, 59, 0, 'Solid Chest', 0, 10), -- Solid Chests in Azshara
(48581, 59, 0, 'Solid Chest', 0, 10), -- Solid Chests in Azshara
(48585, 59, 0, 'Solid Chest', 0, 10), -- Solid Chests in Azshara
(48587, 59, 0, 'Solid Chest', 0, 10); -- Solid Chests in Azshara

-- Missing Solid Chest spawns in The Hinterlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(46373, 153451, 0, -355.508, -4077.57, 177.515, 6.23083, 0, 0, -0.0261765, 0.999657, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 46370 at 139.091461 yards.
(46377, 153451, 0, -417.437, -4015.41, 195.178, 4.08407, 0, 0, -0.891006, 0.453991, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 46370 at 188.431992 yards.
(46431, 153451, 0, 445.376, -3321.57, 120.824, 1.01229, 0, 0, 0.484809, 0.87462, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 46430 at 299.945862 yards.
(46360, 153451, 0, 213.652, -4312.45, 117.838, 4.90438, 0, 0, -0.636078, 0.771625, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 46345 at 553.450867 yards.
(46299, 153451, 0, -200.11, -4048.97, 177.774, 1.27409, 0, 0, 0.594822, 0.803857, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 46292 at 135.615860 yards.
(46300, 153451, 0, -161.006, -3784.68, 239.553, 1.13446, 0, 0, 0.537299, 0.843392, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 46292 at 139.598694 yards.
(46380, 153451, 0, -245.525, -4179.18, 121.946, 6.21337, 0, 0, -0.0348988, 0.999391, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 46370 at 180.047089 yards.
(46301, 153451, 0, -204.854, -3964.76, 195.571, 5.39307, 0, 0, -0.430511, 0.902586, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 46292 at 52.101963 yards.
(46303, 153451, 0, -402.939, -3824.5, 238.351, 2.56563, 0, 0, 0.958819, 0.284016, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 46292 at 234.424194 yards.
(46361, 153451, 0, 322.28, -4134.71, 120.035, 0.523598, 0, 0, 0.258819, 0.965926, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 46345 at 355.477722 yards.
(46432, 153451, 0, 98.6047, -3510.1, 108.363, 3.03684, 0, 0, 0.998629, 0.0523532, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 46430 at 393.970856 yards.
(46362, 153451, 0, -517.781, -4180.18, 215.861, 1.36136, 0, 0, 0.62932, 0.777146, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 46346 at 70.637856 yards.
(46363, 153451, 0, -678.642, -4035.07, 238.373, 4.57276, 0, 0, -0.754709, 0.656059, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 46346 at 168.407593 yards.
(46382, 153451, 0, -343.456, -4220.94, 152.02, 6.14356, 0, 0, -0.0697556, 0.997564, 7200, 7200, 1, 100, 0, 10); -- Closest existing guid is 46370 at 78.230591 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(46373, 58, 0, 'Solid Chest', 0, 10), -- Solid Chests in The Hinterlands
(46377, 58, 0, 'Solid Chest', 0, 10), -- Solid Chests in The Hinterlands
(46431, 58, 0, 'Solid Chest', 0, 10), -- Solid Chests in The Hinterlands
(46360, 58, 0, 'Solid Chest', 0, 10), -- Solid Chests in The Hinterlands
(46299, 58, 0, 'Solid Chest', 0, 10), -- Solid Chests in The Hinterlands
(46300, 58, 0, 'Solid Chest', 0, 10), -- Solid Chests in The Hinterlands
(46380, 58, 0, 'Solid Chest', 0, 10), -- Solid Chests in The Hinterlands
(46301, 58, 0, 'Solid Chest', 0, 10), -- Solid Chests in The Hinterlands
(46303, 58, 0, 'Solid Chest', 0, 10), -- Solid Chests in The Hinterlands
(46361, 58, 0, 'Solid Chest', 0, 10), -- Solid Chests in The Hinterlands
(46432, 58, 0, 'Solid Chest', 0, 10), -- Solid Chests in The Hinterlands
(46362, 58, 0, 'Solid Chest', 0, 10), -- Solid Chests in The Hinterlands
(46363, 58, 0, 'Solid Chest', 0, 10), -- Solid Chests in The Hinterlands
(46382, 58, 0, 'Solid Chest', 0, 10); -- Solid Chests in The Hinterlands

-- Missing Solid Chest spawns in Tanaris.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(17467, 153451, 1, -7901.72, -5206.91, 0.792425, 2.93214, 0, 0, 0.994521, 0.104536, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 17330 at 50.682072 yards.
(17468, 153451, 1, -7960.2, -5245.88, 1.51478, 5.61996, 0, 0, -0.325567, 0.945519, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 17330 at 110.848846 yards.
(17469, 153451, 1, -8497.94, -3061.38, 9.52853, 0.994837, 0, 0, 0.477159, 0.878817, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 17331 at 150.379807 yards.
(17470, 153451, 1, -8490.85, -2888.62, 8.66692, 0.331611, 0, 0, 0.165047, 0.986286, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 17331 at 145.324249 yards.
(17477, 153451, 1, -7977.4, -5127, 5.78821, 0.0698117, 0, 0, 0.0348988, 0.999391, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 17330 at 88.629700 yards.
(17478, 153451, 1, -8383.04, -3083.96, 8.62471, 2.23402, 0, 0, 0.898793, 0.438373, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 17331 at 108.701469 yards.
(17479, 153451, 1, -8092.79, -5307.67, 0.861935, 3.4383, 0, 0, -0.989016, 0.147811, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 17329 at 146.620819 yards.
(17480, 153451, 1, -8079.38, -5251.62, 0.680218, 0, 0, 0, 0, 1, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 17329 at 185.402115 yards.
(17481, 153451, 1, -8023.66, -5228.58, 0.592669, 5.58505, 0, 0, -0.34202, 0.939693, 7200, 7200, 1, 100, 0, 10); -- Closest existing guid is 17330 at 148.150055 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(17467, 56, 0, 'Solid Chest', 0, 10), -- Solid Chests in Tanaris
(17468, 56, 0, 'Solid Chest', 0, 10), -- Solid Chests in Tanaris
(17469, 56, 0, 'Solid Chest', 0, 10), -- Solid Chests in Tanaris
(17470, 56, 0, 'Solid Chest', 0, 10), -- Solid Chests in Tanaris
(17477, 56, 0, 'Solid Chest', 0, 10), -- Solid Chests in Tanaris
(17478, 56, 0, 'Solid Chest', 0, 10), -- Solid Chests in Tanaris
(17479, 56, 0, 'Solid Chest', 0, 10), -- Solid Chests in Tanaris
(17480, 56, 0, 'Solid Chest', 0, 10), -- Solid Chests in Tanaris
(17481, 56, 0, 'Solid Chest', 0, 10); -- Solid Chests in Tanaris

UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `id`= 153451;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
