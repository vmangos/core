DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240430043145');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240430043145');
-- Add your query below.


-- Half-buried Barrel
UPDATE `gameobject` SET `position_x`=-3107.43, `position_y`=-966.177, `position_z`=8.26463, `orientation`=3.14159, `rotation0`=-0.237647, `rotation1`=0.628378, `rotation2`=0.710253, `rotation3`=0.210253 WHERE `guid`=13743;

-- Small Thorium Vein
UPDATE `gameobject` SET `position_x`=-7890.67, `position_y`=-2537.66, `position_z`=129.832, `orientation`=1.53589, `rotation0`=0, `rotation1`=0, `rotation2`=0.694658, `rotation3`=0.71934 WHERE `guid`=31161;

-- Battleground Shield
UPDATE `gameobject` SET `position_x`=-5577.55, `position_y`=-429.308, `position_z`=398.548, `orientation`=0.733038, `rotation0`=0, `rotation1`=0, `rotation2`=0.358368, `rotation3`=0.93358 WHERE `guid`=10020;

-- Bruiseweed
UPDATE `gameobject` SET `position_x`=2469.96, `position_y`=-1661.18, `position_z`=149.331, `orientation`=1.06465, `rotation0`=0, `rotation1`=0, `rotation2`=0.507538, `rotation3`=0.861629 WHERE `guid`=3257;

-- Copper Vein
UPDATE `gameobject` SET `position_x`=-11324, `position_y`=1599.41, `position_z`=37.1515, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=31078;
UPDATE `gameobject` SET `position_x`=-11325, `position_y`=1598.41, `position_z`=37.1515, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=31078;
UPDATE `gameobject` SET `position_x`=-11322, `position_y`=1601.41, `position_z`=37.1515, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=31078;

-- Tin Vein
UPDATE `gameobject` SET `position_x`=2450.75, `position_y`=1557.49, `position_z`=277.38, `orientation`=1.18682, `rotation0`=0, `rotation1`=0, `rotation2`=0.559193, `rotation3`=0.829038 WHERE `guid`=27255;

-- Gold Vein
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(157, 1734, 0, -1171.69, -1305.33, 86.2144, 1.83259, 0, 0, 0.793353, 0.608762, 604800, 604800, 100, 1, 0, 10); -- Arathi Highlands
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(157, 323, 0, 'Gold Vein in Arathi Highlands', 0, 0, 10);

-- Campfire
UPDATE `gameobject` SET `position_x`=-8694.52, `position_y`=-2343.68, `position_z`=155.916, `orientation`=5.59378, `rotation0`=0, `rotation1`=0, `rotation2`=-0.337916, `rotation3`=0.941176 WHERE `guid`=34846;

-- Liferoot
UPDATE `gameobject` SET `position_x`=-12001.2, `position_y`=-349.352, `position_z`=11.4441, `orientation`=5.41052, `rotation0`=0, `rotation1`=0, `rotation2`=-0.422618, `rotation3`=0.906308 WHERE `guid`=66948;

-- Fadeleaf
UPDATE `gameobject` SET `position_x`=-3841.12, `position_y`=-3422.93, `position_z`=37.3159, `orientation`=1.11701, `rotation0`=0, `rotation1`=0, `rotation2`=0.529919, `rotation3`=0.848048 WHERE `guid`=40832;

-- Khadgar's Whisker
UPDATE `gameobject` SET `position_x`=-3636.51, `position_y`=-3425.49, `position_z`=38.7149, `orientation`=1.74533, `rotation0`=0, `rotation1`=0, `rotation2`=0.766044, `rotation3`=0.642789 WHERE `guid`=14613;

-- Goldthorn
UPDATE `gameobject` SET `position_x`=-4001.88, `position_y`=1937.13, `position_z`=105.72, `orientation`=5.67232, `rotation0`=0, `rotation1`=0, `rotation2`=-0.300705, `rotation3`=0.953717 WHERE `guid`=50240;

-- Cathedral Square
UPDATE `gameobject` SET `position_x`=-8684.69, `position_y`=880.801, `position_z`=97.394, `orientation`=3.81355, `rotation0`=0, `rotation1`=0, `rotation2`=-0.944089, `rotation3`=0.329691 WHERE `guid`=4659;

-- Cathedral Square
UPDATE `gameobject` SET `position_x`=-8828.66, `position_y`=616.824, `position_z`=94.162, `orientation`=5.38434, `rotation0`=0, `rotation1`=0, `rotation2`=-0.434444, `rotation3`=0.900699 WHERE `guid`=4972;

-- Legends of the Earth
UPDATE `gameobject` SET `position_x`=-8341.27, `position_y`=398.552, `position_z`=124.33, `orientation`=3.76119, `rotation0`=0.177046, `rotation1`=-0.684584, `rotation2`=-0.66014, `rotation3`=0.253407 WHERE `guid`=12007;

-- Battered Dwarven Skeleton
UPDATE `gameobject` SET `position_x`=-6924.42, `position_y`=-3345.08, `position_z`=243.685, `orientation`=5.29708, `rotation0`=-0.874378, `rotation1`=0.474092, `rotation2`=0.0658674, `rotation3`=0.0797589 WHERE `guid`=10827;

-- Cooking Fire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(179, 3265, 1, -2036.7, -1968.26, 91.6667, 4.04044, 0, 0, -0.900698, 0.434446, 180, 180, 100, 1, 0, 10); -- The Barrens

-- Barrel of Milk
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(44179, 3705, 0, -8927.76, 996.049, 122.374, 4.55531, 0, 0, -0.760406, 0.649449, 180, 180, 100, 1, 0, 10); -- Stormwind City
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(44179, 4764, 0, 'Food Crate / Barrel of Milk - Stormwind', 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(4764, 1, 'Food Crate / Barrel of Milk - Stormwind', 0, 0, 0, 10);

-- Remove duplicate Barrel of Milk pool.
DELETE FROM `pool_gameobject` WHERE `pool_entry`=4761;
DELETE FROM `gameobject` WHERE `guid`=44203;

-- Add missing Firecrackers in Darnassus pool template.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(4254, 1, 'Firecrackers - Darnassus', 0, 0, 7, 10);

-- Food Crate
UPDATE `gameobject` SET `position_x`=-3.95842, `position_y`=279.67, `position_z`=-48.8676, `orientation`=0, `rotation0`=0, `rotation1`=0, `rotation2`=0, `rotation3`=1 WHERE `guid`=66463;

-- Tin Vein
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(207, 3764, 1, -1334.28, -3164.35, 96.3886, 1.88495, 0, 0, 0.809016, 0.587786, 300, 300, 100, 1, 0, 10); -- The Barrens
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(207, 2587, 0, 'Tin Vein (3764) - Barrens', 0, 0, 10);

-- Sprouted Frond are spawned by script.
DELETE FROM `gameobject` WHERE `id`=7510;

-- Wooden Chair
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(42807, 10207, 0, -8859.67, 821.751, 98.354, 3.81355, 0, 0, -0.944089, 0.329691, 180, 180, 100, 1, 0, 10); -- Stormwind City

-- Wooden Chair
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(42808, 10208, 0, -8861.97, 819.846, 98.354, 0.67195, 0, 0, 0.32969, 0.944089, 180, 180, 100, 1, 0, 10); -- Stormwind City

-- Wooden Chair
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(42809, 10222, 0, -8857.95, 865.656, 99.6506, 3.80482, 0, 0, -0.945518, 0.325568, 180, 180, 100, 1, 0, 10); -- Stormwind City

-- Wooden Chair
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(42852, 10224, 0, -8858.18, 863.521, 99.6414, 2.23402, 0, 0, 0.898793, 0.438373, 180, 180, 100, 1, 0, 10); -- Stormwind City

-- Mesa Elevator
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(233, 11898, 209, 2600.81, 1228.72, 89.0211, 2.60926, 0, 0, 0.964787, 0.263034, 3600, 3600, 100, 1, 0, 10); -- Zul'Farrak

-- Mesa Elevator
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(234, 11899, 209, 2617.51, 1243.92, -40.5284, 2.36492, 0, 0, 0.92554, 0.37865, 3600, 3600, 100, 1, 0, 10); -- Zul'Farrak

-- Serpentbloom
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(235, 13891, 1, -599.772, -2044.96, 57.1683, 3.82227, 0, 0, -0.942641, 0.333808, 300, 300, 100, 1, 0, 10), -- The Barrens
(236, 13891, 1, -584.853, -2083.25, 54.9603, 1.93731, 0, 0, 0.824125, 0.566408, 300, 300, 100, 1, 0, 10), -- The Barrens
(237, 13891, 1, -682.722, -2254.79, 18.7693, 1.53589, 0, 0, 0.694658, 0.71934, 300, 300, 100, 1, 0, 10), -- The Barrens
(238, 13891, 1, -579.235, -2280.78, 35.023, 2.58308, 0, 0, 0.961261, 0.27564, 300, 300, 100, 1, 0, 10), -- The Barrens
(239, 13891, 1, -672.65, -2006.37, 64.6799, 5.74214, 0, 0, -0.267238, 0.963631, 300, 300, 100, 1, 0, 10), -- The Barrens
(241, 13891, 1, -711.709, -2059.59, 67.1504, 0.663223, 0, 0, 0.325567, 0.945519, 300, 300, 100, 1, 0, 10), -- The Barrens
(242, 13891, 1, -733.289, -2059.56, 69.5646, 2.9845, 0, 0, 0.996917, 0.0784664, 300, 300, 100, 1, 0, 10), -- Wailing Caverns
(243, 13891, 43, -95.8325, 423.05, -106.731, 2.84488, 0, 0, 0.989016, 0.147811, 300, 300, 100, 1, 0, 10); -- Wailing Caverns

-- Serpentbloom
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(335, 19535, 1, -599.772, -2044.96, 57.1683, 3.82227, 0, 0, -0.942641, 0.333808, 300, 300, 100, 1, 0, 10), -- The Barrens
(336, 19535, 1, -584.853, -2083.25, 54.9603, 1.93731, 0, 0, 0.824125, 0.566408, 300, 300, 100, 1, 0, 10), -- The Barrens
(337, 19535, 1, -682.722, -2254.79, 18.7693, 1.53589, 0, 0, 0.694658, 0.71934, 300, 300, 100, 1, 0, 10), -- The Barrens
(338, 19535, 1, -579.235, -2280.78, 35.023, 2.58308, 0, 0, 0.961261, 0.27564, 300, 300, 100, 1, 0, 10), -- The Barrens
(339, 19535, 1, -672.65, -2006.37, 64.6799, 5.74214, 0, 0, -0.267238, 0.963631, 300, 300, 100, 1, 0, 10), -- The Barrens
(340, 19535, 1, -711.709, -2059.59, 67.1504, 0.663223, 0, 0, 0.325567, 0.945519, 300, 300, 100, 1, 0, 10), -- The Barrens
(341, 19535, 1, -733.289, -2059.56, 69.5646, 2.9845, 0, 0, 0.996917, 0.0784664, 300, 300, 100, 1, 0, 10), -- Wailing Caverns
(342, 19535, 43, -95.8325, 423.05, -106.731, 2.84488, 0, 0, 0.989016, 0.147811, 300, 300, 100, 1, 0, 10); -- Wailing Caverns

-- Foundry Door
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(26182, 16399, 36, -168.514, -579.861, 19.3159, 3.12412, 0, 0, 0.999962, 0.00873464, 180, 180, 100, 1, 0, 10); -- The Deadmines

-- Mast Room Door
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(26185, 16400, 36, -290.294, -536.96, 49.4353, 1.55334, 0, 0, 0.700909, 0.713251, 180, 180, 100, 1, 0, 10); -- The Deadmines

-- Wooden Chair
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(30535, 17250, 0, -8954.26, 1008.3, 122.038, 2.19039, 0, 0, 0.889017, 0.457874, 180, 180, 100, 1, 0, 10); -- Stormwind City

-- Wooden Chair
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(30691, 17251, 0, -8956.59, 1008.58, 122.038, 0.654499, 0, 0, 0.32144, 0.94693, 180, 180, 100, 1, 0, 10); -- Stormwind City

-- Wooden Chair
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(42813, 17253, 0, -9076.53, 836.78, 108.423, 0.349065, 0, 0, 0.173648, 0.984808, 180, 180, 100, 1, 0, 10); -- Stormwind City

-- Wooden Chair
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(42814, 17254, 0, -9070.64, 831.407, 108.423, 5.09636, 0, 0, -0.559193, 0.829038, 180, 180, 100, 1, 0, 10); -- Stormwind City

-- Wooden Chair
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(42815, 17256, 0, -9075.87, 839.089, 108.423, 5.09636, 0, 0, -0.559193, 0.829038, 180, 180, 100, 1, 0, 10); -- Stormwind City

-- Wooden Chair
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(42816, 17257, 0, -9084.21, 822.607, 115.678, 1.90241, 0, 0, 0.814115, 0.580704, 180, 180, 100, 1, 0, 10); -- Stormwind City

-- Wooden Chair
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(42811, 17259, 0, -8861.44, 854.281, 99.6083, 6.16974, 0, 0, -0.0566921, 0.998392, 180, 180, 100, 1, 0, 10); -- Stormwind City

-- Wooden Chair
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(42812, 17260, 0, -8858.78, 851.644, 99.6083, 1.57952, 0, 0, 0.710185, 0.704015, 180, 180, 100, 1, 0, 10); -- Stormwind City

-- Wooden Chair
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(30795, 17270, 0, -8938.35, 1005.09, 122.047, 3.81355, 0, 0, -0.944089, 0.329691, 180, 180, 100, 1, 0, 10); -- Stormwind City

-- Wooden Chair
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(17423, 17271, 0, -8939.65, 1006.7, 122.047, 3.81355, 0, 0, -0.944089, 0.329691, 180, 180, 100, 1, 0, 10); -- Stormwind City

-- Wooden Chair
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(17425, 17272, 0, -8942.28, 1006.78, 122.047, 5.34944, 0, 0, -0.450098, 0.892979, 180, 180, 100, 1, 0, 10); -- Stormwind City

-- Wooden Chair
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(17427, 17273, 0, -8942.79, 1004.3, 122.047, 0.67195, 0, 0, 0.32969, 0.944089, 180, 180, 100, 1, 0, 10); -- Stormwind City

-- Wooden Chair
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(30932, 17277, 0, -8941.54, 1002.57, 122.047, 0.67195, 0, 0, 0.32969, 0.944089, 180, 180, 100, 1, 0, 10); -- Stormwind City

-- Wooden Chair
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(35451, 17278, 0, -8939.07, 1002.52, 122.047, 2.19039, 0, 0, 0.889017, 0.457874, 180, 180, 100, 1, 0, 10); -- Stormwind City

-- Wooden Chair
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(30057, 17279, 0, -8953.95, 1010.44, 122.038, 3.79609, 0, 0, -0.94693, 0.32144, 180, 180, 100, 1, 0, 10); -- Stormwind City

-- Wooden Chair
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(30186, 17280, 0, -8956.34, 1010.81, 122.038, 5.33198, 0, 0, -0.457872, 0.889018, 180, 180, 100, 1, 0, 10); -- Stormwind City

-- Ancient Statuette
UPDATE `gameobject` SET `position_x`=3471.96, `position_y`=847.067, `position_z`=5.36682, `orientation`=0.90757, `rotation0`=0, `rotation1`=0, `rotation2`=0.438371, `rotation3`=0.898794 WHERE `guid`=399738;

-- Jin'Zil's Smoke
UPDATE `gameobject` SET `position_x`=-274.04, `position_y`=-396.297, `position_z`=18.0829, `orientation`=3.90954, `rotation0`=0, `rotation1`=0, `rotation2`=-0.927183, `rotation3`=0.374608 WHERE `guid`=399737;

-- Pools of Arlithrien Moonwell
UPDATE `gameobject` SET `position_x`=9554.56, `position_y`=1655.09, `position_z`=1297.83, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=50359;

-- Glowing Soulgem
UPDATE `gameobject` SET `position_x`=3184.8, `position_y`=190.657, `position_z`=4.62868, `orientation`=4.67748, `rotation0`=0, `rotation1`=0, `rotation2`=-0.719339, `rotation3`=0.694659 WHERE `guid`=21191;

-- Dwarven Fire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(504, 22205, 0, -4959.43, -1763.44, 501.246, 4.8869, -0.00560856, 0.0066843, -0.642762, 0.766016, 60, 60, 100, 0, 3, 10); -- Dun Morogh
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(10683, 22205, 0, -5500.65, -709.025, 392.242, 5.3145, -0.00689936, 0.00534248, -0.465596, 0.884954, 60, 60, 100, 0, 3, 10); -- Dun Morogh

-- Dwarven Fire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(506, 22207, 0, -5928.74, -2041.12, 402.146, 1.36136, 0, 0, 0.62932, 0.777146, 60, 60, 100, 0, 3, 10); -- Dun Morogh

-- Dwarven Fire
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(10687, 22208, 0, -5525.48, -672.885, 393.892, 4.86074, 0, 0, -0.65276, 0.757565, 60, 60, 100, 0, 3, 10), -- Dun Morogh
(10688, 22208, 0, -5928.73, -2042.24, 402.146, 4.50295, 0, 0, -0.777145, 0.629321, 60, 60, 100, 0, 3, 10); -- Dun Morogh

-- Dwarven Fire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(514, 22223, 0, -4152.31, -1137.39, 167.103, 5.37559, -0.0070591, 0.00512886, -0.438354, 0.89876, 7200, 7200, 100, 1, 0, 10), -- Dun Morogh
(518, 22223, 0, -4033.19, -1488.53, 166.848, 5.58503, -0.00755644, 0.00436306, -0.342007, 0.939657, 7200, 7200, 100, 1, 0, 10), -- Dun Morogh
(519, 22223, 0, -3978.4, -1547.24, 166.916, 5.61121, -0.00761318, 0.00426388, -0.329678, 0.944053, 7200, 7200, 100, 1, 0, 10); -- Wetlands

-- Wooden Chair
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(15024, 22534, 0, -10594.7, -1250.71, 37.4789, 4.76475, 0, 0, -0.688354, 0.725375, 7200, 7200, 100, 1, 0, 10); -- Duskwood

-- Wooden Chair
UPDATE `gameobject` SET `position_x`=-10527.2, `position_y`=-1168.18, `position_z`=27.4804, `orientation`=5.70723, `rotation0`=0, `rotation1`=0, `rotation2`=-0.284015, `rotation3`=0.95882 WHERE `guid`=14635;

-- Larson Clothiers
UPDATE `gameobject` SET `position_x`=-8973.36, `position_y`=827.531, `position_z`=106.426, `orientation`=2.28638, `rotation0`=0, `rotation1`=0, `rotation2`=0.909961, `rotation3`=0.414694 WHERE `guid`=42859;

-- Anvil
UPDATE `gameobject` SET `position_x`=-8420.76, `position_y`=616.389, `position_z`=95.4548, `orientation`=5.35816, `rotation0`=0, `rotation1`=0, `rotation2`=-0.446197, `rotation3`=0.894935 WHERE `guid`=13810;

-- Anvil
UPDATE `gameobject` SET `position_x`=-8425.14, `position_y`=614.48, `position_z`=95.2453, `orientation`=1.9984, `rotation0`=0, `rotation1`=0, `rotation2`=0.841039, `rotation3`=0.540975 WHERE `guid`=13812;

-- Forge
UPDATE `gameobject` SET `position_x`=-8421.32, `position_y`=613.437, `position_z`=95.181, `orientation`=3.81355, `rotation0`=0, `rotation1`=0, `rotation2`=-0.944089, `rotation3`=0.329691 WHERE `guid`=13813;

-- Forge
UPDATE `gameobject` SET `position_x`=-8425.16, `position_y`=618.063, `position_z`=95.3874, `orientation`=3.81355, `rotation0`=0, `rotation1`=0, `rotation2`=-0.944089, `rotation3`=0.329691 WHERE `guid`=13814;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
