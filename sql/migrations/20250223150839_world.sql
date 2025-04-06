DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250223150839');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250223150839');
-- Add your query below.


-- Waterlogged Footlocker
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1429, 179487, 0, -9511.57, -2655.24, 46.1449, -1.23918, 0, 0, 0.580703, -0.814116, 300, 300, 100, 1, 1, 10); -- Redridge Mountains
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(1429, 459, 'Waterlogged Footlocker', 1, 10);

-- Battered Footlocker
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1431, 179488, 1, 991.931, -336.163, 0.071559, 1.8675, 0, 0, 0.803857, 0.594823, 300, 300, 100, 1, 1, 10), -- Stonetalon Mountains
(1434, 179488, 1, 954.485, -282.887, -0.139864, -1.01229, 0, 0, 0.48481, -0.87462, 300, 300, 100, 1, 1, 10), -- Stonetalon Mountains
(1436, 179488, 1, 869.056, -318.116, 12.1516, -0.872665, 0, 0, 0.422618, -0.906308, 300, 300, 100, 1, 1, 10), -- Stonetalon Mountains
(1439, 179488, 1, 881.405, -263.775, 6.76053, -1.88496, 0, 0, 0.809017, -0.587785, 300, 300, 100, 1, 1, 10); -- Stonetalon Mountains
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES
(1431, 404, 'Battered Footlocker', 1, 10),
(1434, 404, 'Battered Footlocker', 1, 10),
(1436, 404, 'Battered Footlocker', 1, 10),
(1439, 404, 'Battered Footlocker', 1, 10);

-- Battered Footlocker
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1440, 179490, 0, -6362.1, -3080.79, 300.279, -2.23402, 0, 0, 0.898794, -0.438371, 300, 300, 100, 1, 1, 10), -- Badlands
(1441, 179490, 0, -6314.67, -3094.14, 301.113, 2.40855, 0, 0, 0.93358, 0.358368, 300, 300, 100, 1, 1, 10), -- Badlands
(1442, 179490, 0, -6366.32, -3094.74, 299.723, -2.9147, 0, 0, 0.993572, -0.113203, 300, 300, 100, 1, 1, 10); -- Badlands
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES
(1440, 411, 'Battered Footlocker', 1, 10),
(1441, 411, 'Battered Footlocker', 1, 10),
(1442, 411, 'Battered Footlocker', 1, 10);

-- Waterlogged Footlocker
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1450, 179491, 1, -275.596, 2727.58, -28.82, -2.04204, 0, 0, 0.85264, -0.522498, 300, 300, 100, 1, 1, 10), -- Desolace
(1456, 179491, 1, -291.274, 2619.92, -19.9492, 0.872665, 0, 0, 0.104528, 0.994522, 300, 300, 100, 1, 1, 10), -- Desolace
(1457, 179491, 1, -270.889, 2571.27, -17.5329, 0.20944, 0, 0, 0.374607, -0.927184, 300, 300, 100, 1, 1, 10), -- Desolace
(1459, 179491, 1, -63.4629, 2436.69, -17.4408, -2.89725, 0, 0, 0.382683, -0.92388, 300, 300, 100, 1, 1, 10), -- Desolace
(1461, 179491, 1, -311.087, 2585.18, -4.04776, 0.610865, 0, 0, 0.300706, 0.953717, 300, 300, 100, 1, 1, 10); -- Desolace
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES
(1450, 461, 'Waterlogged Footlocker', 1, 10),
(1456, 461, 'Waterlogged Footlocker', 1, 10),
(1457, 461, 'Waterlogged Footlocker', 1, 10),
(1459, 461, 'Waterlogged Footlocker', 1, 10),
(1461, 461, 'Waterlogged Footlocker', 1, 10);

-- Mossy Footlocker
DELETE FROM `pool_template` WHERE `entry` = 456;
DELETE FROM `pool_gameobject` WHERE `pool_entry` = 456;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1462, 179493, 0, -10499.6, -3941.77, -19.6098, -2.25147, 0, 0, 0.902585, -0.430511, 300, 300, 100, 1, 1, 10), -- Swamp of Sorrows
(1464, 179493, 0, -10482.5, -3947.15, -19.5508, 1.74533, 0, 0, 0.766044, 0.642788, 300, 300, 100, 1, 1, 10), -- Swamp of Sorrows
(1465, 179493, 0, -10367.9, -3734.51, -15.758, -2.77507, 0, 0, 0.983255, -0.182235, 300, 300, 100, 1, 1, 10), -- Swamp of Sorrows
(1466, 179493, 1, 122.846, 2515.78, -38.6042, 0.331613, 0, 0, 0.0610485, 0.998135, 300, 300, 100, 1, 1, 10); -- Desolace
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES
(1462, 457, 'Mossy Footlocker', 1, 10),
(1464, 457, 'Mossy Footlocker', 1, 10),
(1465, 457, 'Mossy Footlocker', 1, 10),
(30566, 457, 'Mossy Footlocker', 1, 10),
(30580, 457, 'Mossy Footlocker', 1, 10),
(30582, 457, 'Mossy Footlocker', 1, 10),
(30571, 457, 'Mossy Footlocker', 1, 10),
(30574, 457, 'Mossy Footlocker', 1, 10),
(30581, 457, 'Mossy Footlocker', 1, 10),
(30587, 457, 'Mossy Footlocker', 1, 10),
(30591, 457, 'Mossy Footlocker', 1, 10),
(30579, 457, 'Mossy Footlocker', 1, 10),
(30594, 457, 'Mossy Footlocker', 1, 10),
(30613, 457, 'Mossy Footlocker', 1, 10),
(30614, 457, 'Mossy Footlocker', 1, 10),
(30635, 457, 'Mossy Footlocker', 1, 10),
(1466, 455, 'Mossy Footlocker', 1, 10);

-- Mossy Footlocker
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1467, 179497, 1, 2665.14, -6703.98, 10.4188, 0.890118, 0, 0, 0.430511, 0.902585, 300, 300, 100, 1, 1, 10), -- Azshara
(1470, 179497, 1, 3392.26, -6436.96, -17.3431, -0.541052, 0, 0, 0.267238, -0.96363, 300, 300, 100, 1, 1, 10), -- Azshara
(1480, 179497, 1, 3502.23, -6283.34, -34.2007, -0.977384, 0, 0, 0.469472, -0.882948, 300, 300, 100, 1, 1, 10), -- Azshara
(1481, 179497, 1, 3625.05, -6419.19, -37.6802, -2.49582, 0, 0, 0.948324, -0.317305, 300, 300, 100, 1, 1, 10), -- Azshara
(1489, 179497, 1, 4115.04, -7373.35, 12.3958, -1.3439, 0, 0, 0.642788, -0.766044, 300, 300, 100, 1, 1, 10), -- Azshara
(1492, 179497, 1, 3834.31, -7154.81, 22.4843, 0.122173, 0, 0, 0.0610485, 0.998135, 300, 300, 100, 1, 1, 10), -- Azshara
(1497, 179497, 1, 2850.19, -7342.33, -22.5326, -1.01229, 0, 0, 0.48481, -0.87462, 300, 300, 100, 1, 1, 10), -- Azshara
(1505, 179497, 1, 2998.39, -6738.33, -21.849, -1.55334, 0, 0, 0.700909, -0.71325, 300, 300, 100, 1, 1, 10), -- Azshara
(1506, 179497, 1, 4058.42, -6458.52, -18.1063, 2.49582, 0, 0, 0.948324, 0.317305, 300, 300, 100, 1, 1, 10), -- Azshara
(1509, 179497, 1, 3330.32, -5669, 8.39549, 0.802851, 0, 0, 0.390731, 0.920505, 300, 300, 100, 1, 1, 10), -- Azshara
(1511, 179497, 1, 2270.13, -7183.66, -11.1104, 0.994838, 0, 0, 0.477159, 0.878817, 300, 300, 100, 1, 1, 10); -- Azshara
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES
(1467, 458, 'Mossy Footlocker', 1, 10),
(1470, 458, 'Mossy Footlocker', 1, 10),
(1480, 458, 'Mossy Footlocker', 1, 10),
(1481, 458, 'Mossy Footlocker', 1, 10),
(1489, 458, 'Mossy Footlocker', 1, 10),
(1492, 458, 'Mossy Footlocker', 1, 10),
(1497, 458, 'Mossy Footlocker', 1, 10),
(1505, 458, 'Mossy Footlocker', 1, 10),
(1506, 458, 'Mossy Footlocker', 1, 10),
(1509, 458, 'Mossy Footlocker', 1, 10),
(1511, 458, 'Mossy Footlocker', 1, 10);

-- Scarlet Footlocker
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1512, 179498, 0, 1548.83, -5258.82, 113.932, 1.06465, 0, 0, 0.507538, 0.861629, 300, 300, 100, 1, 1, 10), -- Eastern Plaguelands
(1513, 179498, 0, 1601.19, -5315.66, 68.7325, 2.67035, 0, 0, 0.97237, 0.233445, 300, 300, 100, 1, 1, 10), -- Eastern Plaguelands
(1514, 179498, 0, 1603.19, -5619.16, 101.087, 0.593412, 0, 0, 0.292372, 0.956305, 300, 300, 100, 1, 1, 10); -- Eastern Plaguelands
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES
(1512, 3011, 'Scarlet Footlocker', 1, 10),
(1513, 3011, 'Scarlet Footlocker', 1, 10),
(1514, 3011, 'Scarlet Footlocker', 1, 10);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
