DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220501213609');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220501213609');
-- Add your query below.


-- TIN ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Correct position of Tin Vein in Hillsbrad Foothills (position is off by 1.02559 yards).
UPDATE `gameobject` SET `position_x`=86.8319, `position_y`=-1064.58, `position_z`=58.904, `orientation`=5.65487, `rotation0`=0, `rotation1`=0, `rotation2`=-0.309016, `rotation3`=0.951057 WHERE `guid`=5671;

-- Correct position of Tin Vein in Arathi Highlands (position is off by 1.62838 yards).
UPDATE `gameobject` SET `position_x`=-1734.98, `position_y`=-3102.7, `position_z`=25.0462, `orientation`=2.42601, `rotation0`=0, `rotation1`=0, `rotation2`=0.936672, `rotation3`=0.350207 WHERE `guid`=5638;

-- Correct position of Tin Vein in Desolace (position is off by 0.89981 yards).
UPDATE `gameobject` SET `position_x`=-2057.46, `position_y`=2282.55, `position_z`=68.2259, `orientation`=4.27606, `rotation0`=0, `rotation1`=0, `rotation2`=-0.843391, `rotation3`=0.5373 WHERE `guid`=5654;

-- Correct position of Tin Vein in Hillsbrad Foothills (position is off by 1.36926 yards).
UPDATE `gameobject` SET `position_x`=-23.3489, `position_y`=-679.042, `position_z`=76.8395, `orientation`=2.1293, `rotation0`=0, `rotation1`=0, `rotation2`=0.874619, `rotation3`=0.48481 WHERE `guid`=5494;

-- Correct position of Tin Vein in Stonetalon Mountains (position is off by 1.05487 yards).
UPDATE `gameobject` SET `position_x`=73.2608, `position_y`=-295.049, `position_z`=37.2434, `orientation`=3.42085, `rotation0`=0, `rotation1`=0, `rotation2`=-0.990268, `rotation3`=0.139175 WHERE `guid`=5669;

-- Correct position of Tin Vein in Silverpine Forest (position is off by 0.0219879 yards).
UPDATE `gameobject` SET `position_x`=-330.949, `position_y`=975.041, `position_z`=131.206, `orientation`=5.21854, `rotation0`=0, `rotation1`=0, `rotation2`=-0.507538, `rotation3`=0.861629 WHERE `guid`=35570;

-- Correct position of Tin Vein in Hillsbrad Foothills (position is off by 0.684721 yards).
UPDATE `gameobject` SET `position_x`=-105.9, `position_y`=-689.352, `position_z`=74.0013, `orientation`=3.45576, `rotation0`=0, `rotation1`=0, `rotation2`=-0.987688, `rotation3`=0.156436 WHERE `guid`=5568;

-- Correct position of Tin Vein in Desolace (position is off by 0.861517 yards).
UPDATE `gameobject` SET `position_x`=-1120.6, `position_y`=2110.51, `position_z`=86.2034, `orientation`=1.58825, `rotation0`=0, `rotation1`=0, `rotation2`=0.71325, `rotation3`=0.70091 WHERE `guid`=5571;

-- Correct position of Tin Vein in Desolace (position is off by 0.42848 yards).
UPDATE `gameobject` SET `position_x`=-284.348, `position_y`=1431.92, `position_z`=105.729, `orientation`=3.22886, `rotation0`=0, `rotation1`=0, `rotation2`=-0.999048, `rotation3`=0.0436193 WHERE `guid`=5614;

-- Correct position of Tin Vein in The Barrens (position is off by 0.300899 yards).
UPDATE `gameobject` SET `position_x`=-3025.72, `position_y`=-2184.11, `position_z`=102.403, `orientation`=0.331611, `rotation0`=0, `rotation1`=0, `rotation2`=0.165047, `rotation3`=0.986286 WHERE `guid`=5657;

-- Correct position of Tin Vein in Hillsbrad Foothills (position is off by 1.01004 yards).
UPDATE `gameobject` SET `position_x`=188.268, `position_y`=-1064.92, `position_z`=73.355, `orientation`=1.02974, `rotation0`=0, `rotation1`=0, `rotation2`=0.492423, `rotation3`=0.870356 WHERE `guid`=5582;

-- Correct position of Tin Vein in Desolace (position is off by 1.11537 yards).
UPDATE `gameobject` SET `position_x`=-1276.26, `position_y`=2162.55, `position_z`=99.6269, `orientation`=5.44543, `rotation0`=0, `rotation1`=0, `rotation2`=-0.406736, `rotation3`=0.913546 WHERE `guid`=5600;

-- Correct position of Tin Vein in Desolace (position is off by 0.359985 yards).
UPDATE `gameobject` SET `position_x`=-1940.36, `position_y`=1653.59, `position_z`=62.6459, `orientation`=2.30383, `rotation0`=0, `rotation1`=0, `rotation2`=0.913545, `rotation3`=0.406738 WHERE `guid`=5500;

-- Correct position of Tin Vein in The Barrens (position is off by 0.554418 yards).
UPDATE `gameobject` SET `position_x`=-1729.69, `position_y`=-3879.37, `position_z`=25.8715, `orientation`=3.17653, `rotation0`=0, `rotation1`=0, `rotation2`=-0.999847, `rotation3`=0.0174693 WHERE `guid`=5635;

-- Correct position of Tin Vein in Darkshore (position is off by 0.229968 yards).
UPDATE `gameobject` SET `position_x`=7476.1, `position_y`=-941.806, `position_z`=24.6554, `orientation`=3.54302, `rotation0`=0, `rotation1`=0, `rotation2`=-0.979924, `rotation3`=0.19937 WHERE `guid`=5531;

-- Correct position of Tin Vein in The Barrens (position is off by 0.639839 yards).
UPDATE `gameobject` SET `position_x`=-3026.27, `position_y`=-1959.28, `position_z`=104.39, `orientation`=0.645772, `rotation0`=0, `rotation1`=0, `rotation2`=0.317305, `rotation3`=0.948324 WHERE `guid`=5644;

-- Correct position of Tin Vein in Hillsbrad Foothills (position is off by 2.55297 yards).
UPDATE `gameobject` SET `position_x`=-267.566, `position_y`=-217.9, `position_z`=85.3977, `orientation`=3.35105, `rotation0`=0, `rotation1`=0, `rotation2`=-0.994521, `rotation3`=0.104536 WHERE `guid`=5655;

-- Correct position of Tin Vein in Ashenvale (position is off by 1.37905 yards).
UPDATE `gameobject` SET `position_x`=2507.28, `position_y`=-1447.08, `position_z`=171.929, `orientation`=4.53786, `rotation0`=0, `rotation1`=0, `rotation2`=-0.766044, `rotation3`=0.642789 WHERE `guid`=5525;

-- Correct position of Tin Vein in Silverpine Forest (position is off by 0.593224 yards).
UPDATE `gameobject` SET `position_x`=-596.84, `position_y`=896.666, `position_z`=99.8922, `orientation`=3.59538, `rotation0`=0, `rotation1`=0, `rotation2`=-0.97437, `rotation3`=0.224951 WHERE `guid`=5640;

-- Correct position of Tin Vein in Hillsbrad Foothills (position is off by 4.2584 yards).
UPDATE `gameobject` SET `position_x`=-318.377, `position_y`=-365.531, `position_z`=68.8522, `orientation`=1.27409, `rotation0`=0, `rotation1`=0, `rotation2`=0.594822, `rotation3`=0.803857 WHERE `guid`=5589;

-- Correct position of Tin Vein in Darkshore (position is off by 0.2668 yards).
UPDATE `gameobject` SET `position_x`=5954.85, `position_y`=-58.2668, `position_z`=47.1143, `orientation`=2.79252, `rotation0`=0, `rotation1`=0, `rotation2`=0.984807, `rotation3`=0.173652 WHERE `guid`=5561;

-- Correct position of Tin Vein in Hillsbrad Foothills (position is off by 0.866833 yards).
UPDATE `gameobject` SET `position_x`=-619.142, `position_y`=-1014.93, `position_z`=61.8551, `orientation`=0.733038, `rotation0`=0, `rotation1`=0, `rotation2`=0.358368, `rotation3`=0.93358 WHERE `guid`=5563;

-- Correct position of Tin Vein in Hillsbrad Foothills (position is off by 0.255652 yards).
UPDATE `gameobject` SET `position_x`=52.3908, `position_y`=-1232.24, `position_z`=71.2689, `orientation`=0.59341, `rotation0`=0, `rotation1`=0, `rotation2`=0.292371, `rotation3`=0.956305 WHERE `guid`=5570;

-- Correct position of Tin Vein in Westfall (position is off by 3.12697 yards).
UPDATE `gameobject` SET `position_x`=-10169, `position_y`=2039.09, `position_z`=6.40937, `orientation`=4.13643, `rotation0`=0, `rotation1`=0, `rotation2`=-0.878817, `rotation3`=0.47716 WHERE `guid`=5648;

-- Correct position of Tin Vein in Redridge Mountains (position is off by 1.30823 yards).
UPDATE `gameobject` SET `position_x`=-9254.95, `position_y`=-2870.78, `position_z`=94.876, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=5656;

-- Correct position of Tin Vein in Darkshore (position is off by 0.875875 yards).
UPDATE `gameobject` SET `position_x`=7263.24, `position_y`=-972.666, `position_z`=48.9116, `orientation`=1.36136, `rotation0`=0, `rotation1`=0, `rotation2`=0.62932, `rotation3`=0.777146 WHERE `guid`=5592;

-- Correct position of Tin Vein in Redridge Mountains (position is off by 1.26576 yards).
UPDATE `gameobject` SET `position_x`=-9254.29, `position_y`=-2734.14, `position_z`=89.1034, `orientation`=0.436332, `rotation0`=0, `rotation1`=0, `rotation2`=0.216439, `rotation3`=0.976296 WHERE `guid`=5515;

-- Missing Tin Vein spawns in Duskwood.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(33466, 1732, 0, -11148, -513.184, 41.4328, 0.506145, 0, 0, 0.25038, 0.968148, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 33461 at 294.493958 yards.
(18581, 1732, 0, -10575.1, -1008.32, 55.5346, 0.0349062, 0, 0, 0.0174522, 0.999848, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 18553 at 73.429344 yards.
(42665, 1732, 0, -11246, -173.352, 5.11785, 0.383971, 0, 0, 0.190808, 0.981627, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 42481 at 70.551369 yards.
(17090, 1732, 0, -10568.9, -1506.51, 95.3776, 4.15388, 0, 0, -0.874619, 0.48481, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16988 at 37.163624 yards.
(17181, 1732, 0, -10160.4, -288.859, 47.7796, 5.93412, 0, 0, -0.173648, 0.984808, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 17145 at 199.790894 yards.
(17183, 1732, 0, -11166.4, 188.423, 36.8217, 4.32842, 0, 0, -0.829037, 0.559194, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16984 at 192.902649 yards.
(14037, 1732, 0, -10820.8, -729.183, 46.4459, 3.4383, 0, 0, -0.989016, 0.147811, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 14031 at 176.827072 yards.
(29366, 1732, 0, -11099.4, -696.347, 54.7799, 1.58825, 0, 0, 0.71325, 0.70091, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 29355 at 153.709961 yards.
(14048, 1732, 0, -10729.1, -783.827, 49.1737, 3.38594, 0, 0, -0.992546, 0.12187, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 14031 at 197.217575 yards.
(33469, 1732, 0, -10997.8, -542.823, 34.96, 5.32326, 0, 0, -0.461748, 0.887011, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 33461 at 143.983398 yards.
(40004, 1732, 0, -11096.3, -135.736, 39.7418, 1.46608, 0, 0, 0.66913, 0.743145, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 39993 at 67.826302 yards.
(42668, 1732, 0, -11137.3, -166.128, 11.467, 2.96704, 0, 0, 0.996194, 0.087165, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 42481 at 43.317749 yards.
(42707, 1732, 0, -11136.9, -124.765, 9.87703, 5.93412, 0, 0, -0.173648, 0.984808, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 42481 at 50.416073 yards.
(29367, 1732, 0, -11200, -833.442, 77.4169, 4.45059, 0, 0, -0.793353, 0.608762, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 29355 at 63.324783 yards.
(18584, 1732, 0, -11151.1, -1153.09, 46.036, 0.174532, 0, 0, 0.0871553, 0.996195, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 18505 at 22.027159 yards.
(17227, 1732, 0, -10466.3, -120.787, 62.3164, 4.45059, 0, 0, -0.793353, 0.608762, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 17145 at 177.460037 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(33466, 1120, 0, 'Tin Vein', 0, 10), -- Tin Veins in Duskwood 22 objects total
(18581, 1120, 0, 'Tin Vein', 0, 10), -- Tin Veins in Duskwood 22 objects total
(42665, 1120, 0, 'Tin Vein', 0, 10), -- Tin Veins in Duskwood 22 objects total
(17090, 1120, 0, 'Tin Vein', 0, 10), -- Tin Veins in Duskwood 22 objects total
(17181, 1120, 0, 'Tin Vein', 0, 10), -- Tin Veins in Duskwood 22 objects total
(17183, 1120, 0, 'Tin Vein', 0, 10), -- Tin Veins in Duskwood 22 objects total
(14037, 1120, 0, 'Tin Vein', 0, 10), -- Tin Veins in Duskwood 22 objects total
(29366, 1120, 0, 'Tin Vein', 0, 10), -- Tin Veins in Duskwood 22 objects total
(14048, 1120, 0, 'Tin Vein', 0, 10), -- Tin Veins in Duskwood 22 objects total
(33469, 1120, 0, 'Tin Vein', 0, 10), -- Tin Veins in Duskwood 22 objects total
(40004, 1120, 0, 'Tin Vein', 0, 10), -- Tin Veins in Duskwood 22 objects total
(42668, 1120, 0, 'Tin Vein', 0, 10), -- Tin Veins in Duskwood 22 objects total
(42707, 1120, 0, 'Tin Vein', 0, 10), -- Tin Veins in Duskwood 22 objects total
(29367, 1120, 0, 'Tin Vein', 0, 10), -- Tin Veins in Duskwood 22 objects total
(18584, 1120, 0, 'Tin Vein', 0, 10), -- Tin Veins in Duskwood 22 objects total
(17227, 1120, 0, 'Tin Vein', 0, 10); -- Tin Veins in Duskwood 22 objects total

-- Missing Tin Vein spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(6870, 1732, 0, -4209.78, -3200.41, 39.9346, 3.68265, 0, 0, -0.96363, 0.267241, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5608 at 53.870476 yards.
(34127, 1732, 0, -3993.14, -2598.76, 59.9468, 4.17134, 0, 0, -0.870356, 0.492424, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34126 at 119.154564 yards.
(33512, 1732, 0, -3533.25, -2533.37, 66.5472, 6.21337, 0, 0, -0.0348988, 0.999391, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 33510 at 108.263908 yards.
(9666, 1732, 0, -4300.05, -2679.25, 70.5852, 4.32842, 0, 0, -0.829037, 0.559194, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5556 at 59.085690 yards.
(34140, 1732, 0, -3766.69, -2633.3, 75.8543, 4.88692, 0, 0, -0.642787, 0.766045, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34126 at 122.980812 yards.
(34146, 1732, 0, -3738.05, -2625.42, 53.5793, 1.50098, 0, 0, 0.681998, 0.731354, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34126 at 143.499542 yards.
(34147, 1732, 0, -3858.7, -2624.47, 63.9141, 4.45059, 0, 0, -0.793353, 0.608762, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34126 at 46.432228 yards.
(9670, 1732, 0, -4247.21, -2627.36, 65.4306, 5.70723, 0, 0, -0.284015, 0.95882, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5594 at 34.004005 yards.
(15183, 1732, 0, -3683.25, -2596.19, 63.3477, 0.471238, 0, 0, 0.233445, 0.97237, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15182 at 140.726715 yards.
(14921, 1732, 0, -4218.68, -3083.5, 9.42818, 5.20108, 0, 0, -0.515038, 0.857168, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 14901 at 63.081566 yards.
(14922, 1732, 0, -4250.16, -3066.69, 8.75446, 3.50812, 0, 0, -0.983254, 0.182238, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 14901 at 89.377716 yards.
(9698, 1732, 0, -4233.31, -2766.75, 46.313, 2.51327, 0, 0, 0.951056, 0.309017, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5564 at 131.866989 yards.
(14923, 1732, 0, -2633.04, -1957.8, 63.8588, 1.09956, 0, 0, 0.522498, 0.85264, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 14896 at 174.938385 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(6870, 1157, 0, 'Tin Vein', 0, 10), -- Tin Veins in Wetlands 52 objects total
(34127, 1157, 0, 'Tin Vein', 0, 10), -- Tin Veins in Wetlands 52 objects total
(33512, 1157, 0, 'Tin Vein', 0, 10), -- Tin Veins in Wetlands 52 objects total
(9666, 1157, 0, 'Tin Vein', 0, 10), -- Tin Veins in Wetlands 52 objects total
(34140, 1157, 0, 'Tin Vein', 0, 10), -- Tin Veins in Wetlands 52 objects total
(34146, 1157, 0, 'Tin Vein', 0, 10), -- Tin Veins in Wetlands 52 objects total
(34147, 1157, 0, 'Tin Vein', 0, 10), -- Tin Veins in Wetlands 52 objects total
(9670, 1157, 0, 'Tin Vein', 0, 10), -- Tin Veins in Wetlands 52 objects total
(15183, 1157, 0, 'Tin Vein', 0, 10), -- Tin Veins in Wetlands 52 objects total
(14921, 1157, 0, 'Tin Vein', 0, 10), -- Tin Veins in Wetlands 52 objects total
(14922, 1157, 0, 'Tin Vein', 0, 10), -- Tin Veins in Wetlands 52 objects total
(9698, 1157, 0, 'Tin Vein', 0, 10), -- Tin Veins in Wetlands 52 objects total
(14923, 1157, 0, 'Tin Vein', 0, 10); -- Tin Veins in Wetlands 52 objects total

-- Missing Tin Vein spawns in Dustwallow Marsh.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(55957, 1732, 1, -2356.37, -3166.03, 49.9149, 4.41568, 0, 0, -0.803857, 0.594823, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 55955 at 359.407715 yards.
(55960, 1732, 1, -2748.49, -4020.92, 43.7121, 3.64774, 0, 0, -0.968147, 0.250381, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 55955 at 1201.883789 yards.
(56025, 1732, 1, -3770.91, -3715.19, 48.8534, 3.12412, 0, 0, 0.999962, 0.00873464, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 56024 at 433.132080 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(55957, 43521, 0, 'Tin Vein', 0, 10), -- Dustwallow Marsh: Tin Vein
(55960, 43521, 0, 'Tin Vein', 0, 10), -- Dustwallow Marsh: Tin Vein
(56025, 43521, 0, 'Tin Vein', 0, 10); -- Dustwallow Marsh: Tin Vein

-- Missing Tin Vein spawns in The Barrens.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(16219, 1732, 1, -185.128, -1833.16, 99.0415, 3.73501, 0, 0, -0.956305, 0.292372, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15688 at 138.326294 yards.
(16294, 1732, 1, -242.207, -1819.49, 100.772, 1.95477, 0, 0, 0.829038, 0.559193, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15688 at 191.802704 yards.
(16427, 1732, 1, 521.879, -3235.76, 118.281, 2.84488, 0, 0, 0.989016, 0.147811, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15692 at 170.437454 yards.
(16428, 1732, 1, 1024.2, -3380.53, 97.7864, 0.383971, 0, 0, 0.190808, 0.981627, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15699 at 254.343201 yards.
(16432, 1732, 1, -452.804, -2149.09, 97.2853, 5.16618, 0, 0, -0.529919, 0.848048, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15688 at 432.145905 yards.
(16435, 1732, 1, 611.802, -2297.8, 106.212, 1.91986, 0, 0, 0.819152, 0.573577, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15696 at 104.626549 yards.
(8951, 1732, 1, -1232.93, -1900.2, 83.0397, 5.5676, 0, 0, -0.350207, 0.936672, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5649 at 185.125168 yards.
(9623, 1732, 1, -3822.94, -2313.46, 105.104, 1.76278, 0, 0, 0.771625, 0.636078, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5605 at 123.195091 yards.
(9636, 1732, 1, -2895.26, -2238.97, 103.375, 1.6057, 0, 0, 0.719339, 0.694659, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5657 at 141.829437 yards.
(16436, 1732, 1, -3424.42, -1774.99, 92.4047, 2.26893, 0, 0, 0.906307, 0.422619, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15690 at 152.763901 yards.
(16439, 1732, 1, 804.16, -2154.34, 113.395, 2.25147, 0, 0, 0.902585, 0.430512, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15693 at 97.619881 yards.
(16440, 1732, 1, 117.095, -1436.41, 95.928, 5.14872, 0, 0, -0.537299, 0.843392, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15697 at 116.348503 yards.
(16441, 1732, 1, 564.967, -2091.1, 100.963, 0.261798, 0, 0, 0.130526, 0.991445, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15696 at 138.727768 yards.
(16444, 1732, 1, -395.093, -1589.36, 101.445, 3.4383, 0, 0, -0.989016, 0.147811, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15688 at 459.243927 yards.
(9695, 1732, 1, -1425.03, -2045.83, 83.8641, 5.86431, 0, 0, -0.207911, 0.978148, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5634 at 338.325378 yards.
(9696, 1732, 1, -1823.01, -3776.37, 14.0085, 2.09439, 0, 0, 0.866025, 0.500001, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5635 at 138.989548 yards.
(16446, 1732, 1, 443.844, -2996.4, 103.127, 3.12412, 0, 0, 0.999962, 0.00873464, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15692 at 257.279907 yards.
(16518, 1732, 1, -2716.05, -2332.41, 97.1788, 5.72468, 0, 0, -0.275637, 0.961262, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15689 at 321.844940 yards.
(16531, 1732, 1, -3675.34, -1822.64, 102.655, 0.0174525, 0, 0, 0.00872612, 0.999962, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15690 at 103.717560 yards.
(16534, 1732, 1, -1645.21, -2619.43, 86.5365, 1.06465, 0, 0, 0.507538, 0.861629, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15694 at 294.880127 yards.
(16563, 1732, 1, 543.106, -2348.81, 93.3756, 6.24828, 0, 0, -0.0174522, 0.999848, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15696 at 122.398628 yards.
(16573, 1732, 1, -3219.37, -2291.98, 95.301, 4.24115, 0, 0, -0.85264, 0.522499, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15689 at 196.929871 yards.
(16582, 1732, 1, 322.231, -2828.59, 95.1144, 5.61996, 0, 0, -0.325567, 0.945519, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15692 at 409.482574 yards.
(16586, 1732, 1, 303.017, -1412.02, 93.3997, 5.95157, 0, 0, -0.165047, 0.986286, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15697 at 288.632874 yards.
(16588, 1732, 1, 790.214, -1955.62, 96.0057, 2.30383, 0, 0, 0.913545, 0.406738, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15693 at 129.652374 yards.
(16621, 1732, 1, -2109.26, -3677.45, 62.0206, 0.0174525, 0, 0, 0.00872612, 0.999962, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15691 at 270.584259 yards.
(21290, 3764, 1, -1847.26, -1925.07, 97.8816, 4.4855, 0, 0, -0.782608, 0.622515, 300, 300, 1, 100, 0, 10),
(21291, 3764, 1, -1086.76, -2178, 65.2551, 0.0349062, 0, 0, 0.0174522, 0.999848, 300, 300, 1, 100, 0, 10),
(21292, 3764, 1, -2277.64, -2507.73, 93.9827, 3.28124, 0, 0, -0.997563, 0.0697661, 300, 300, 1, 100, 0, 10),
(21293, 3764, 1, -2266.12, -2536.62, 92.2936, 0.663223, 0, 0, 0.325567, 0.945519, 300, 300, 1, 100, 0, 10),
(21294, 3764, 1, -2060.78, -2801.24, 91.6667, 1.01229, 0, 0, 0.484809, 0.87462, 300, 300, 1, 100, 0, 10),
(21110, 3764, 1, -2117.74, -2794.77, 92.5652, 1.23918, 0, 0, 0.580703, 0.814116, 300, 300, 1, 100, 0, 10),
(21111, 3764, 1, -1941.71, -2691.24, 95.6744, 4.93928, 0, 0, -0.622514, 0.782609, 300, 300, 1, 100, 0, 10),
(24979, 3764, 1, -1890.14, -2710.69, 96.0801, 6.12611, 0, 0, -0.0784588, 0.996917, 300, 300, 1, 100, 0, 10),
(21298, 3764, 1, -2062.71, -1949.56, 91.6667, 1.71042, 0, 0, 0.754709, 0.656059, 300, 300, 1, 100, 0, 10),
(21299, 3764, 1, 91.9908, -1923.08, 80.8534, 4.85202, 0, 0, -0.656058, 0.75471, 300, 300, 1, 100, 0, 10),
(21300, 3764, 1, 1364.33, -3495.35, 94.4066, 0.488691, 0, 0, 0.241921, 0.970296, 300, 300, 1, 100, 0, 10),
(21301, 3764, 1, -1015.49, -2083.8, 63.6469, 5.35816, 0, 0, -0.446198, 0.894935, 300, 300, 1, 100, 0, 10),
(21302, 3764, 1, -1853.02, -1887.78, 98.8276, 1.93731, 0, 0, 0.824125, 0.566408, 300, 300, 1, 100, 0, 10),
(21303, 3764, 1, 26.0743, -1906.15, 84.0589, 4.69494, 0, 0, -0.71325, 0.70091, 300, 300, 1, 100, 0, 10),
(21304, 3764, 1, 884.066, -1317.24, 104.392, 4.01426, 0, 0, -0.906307, 0.422619, 300, 300, 1, 100, 0, 10),
(21305, 3764, 1, -2086.99, -1738.18, 96.4682, 3.42085, 0, 0, -0.990268, 0.139175, 300, 300, 1, 100, 0, 10),
(21306, 3764, 1, -1472.59, -1494.68, 109.927, 4.01426, 0, 0, -0.906307, 0.422619, 300, 300, 1, 100, 0, 10),
(21307, 3764, 1, -3654.05, -1691.23, 113.431, 1.98967, 0, 0, 0.83867, 0.54464, 300, 300, 1, 100, 0, 10),
(21308, 3764, 1, -3814.16, -1466.68, 138.992, 2.1293, 0, 0, 0.874619, 0.48481, 300, 300, 1, 100, 0, 10),
(21309, 3764, 1, -1089.17, -2079.23, 62.6844, 3.4383, 0, 0, -0.989016, 0.147811, 300, 300, 1, 100, 0, 10),
(21310, 3764, 1, -2043.01, -2813.76, 91.6719, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 1, 100, 0, 10),
(21311, 3764, 1, -2313.7, -2620.88, 103.164, 1.76278, 0, 0, 0.771625, 0.636078, 300, 300, 1, 100, 0, 10),
(21312, 3764, 1, -4077.23, -1776.9, 110.37, 4.45059, 0, 0, -0.793353, 0.608762, 300, 300, 1, 100, 0, 10),
(21313, 3764, 1, 108.502, -1971.98, 86.3208, 3.7001, 0, 0, -0.961261, 0.27564, 300, 300, 1, 100, 0, 10),
(21314, 3764, 1, -1227.88, -2986.31, 81.0746, 4.06662, 0, 0, -0.894934, 0.446199, 300, 300, 1, 100, 0, 10),
(21315, 3764, 1, -4027.05, -1759.14, 100.087, 4.27606, 0, 0, -0.843391, 0.5373, 300, 300, 1, 100, 0, 10),
(21316, 3764, 1, -3740.23, -1504.02, 97.59, 3.21142, 0, 0, -0.999391, 0.0349061, 300, 300, 1, 100, 0, 10),
(21317, 3764, 1, -221.384, -3283.85, 92.1272, 4.76475, 0, 0, -0.688354, 0.725374, 300, 300, 1, 100, 0, 10),
(21318, 3764, 1, 643.704, -1276.92, 98.4661, 3.52557, 0, 0, -0.981627, 0.190812, 300, 300, 1, 100, 0, 10),
(21319, 3764, 1, -1047.67, -2048.3, 63.4349, 3.4383, 0, 0, -0.989016, 0.147811, 300, 300, 1, 100, 0, 10),
(21320, 3764, 1, -1290.2, -2984.47, 81.2099, 0.383971, 0, 0, 0.190808, 0.981627, 300, 300, 1, 100, 0, 10),
(21321, 3764, 1, -2312.55, -2499.89, 94.7379, 3.17653, 0, 0, -0.999847, 0.0174693, 300, 300, 1, 100, 0, 10),
(21322, 103711, 1, -4064.47, -2151.67, 50.9367, 3.54302, 0, 0, -0.979924, 0.19937, 1800, 1800, 1, 100, 0, 10),
(21323, 103711, 1, -4189.95, -2273.66, 52.2812, 1.69297, 0, 0, 0.748956, 0.66262, 1800, 1800, 1, 100, 0, 10),
(21324, 103711, 1, -4115, -2231.68, 52.2902, 0.820303, 0, 0, 0.398748, 0.91706, 1800, 1800, 1, 100, 0, 10),
(21325, 103711, 1, -4060.03, -2183.86, 54.3944, 2.32129, 0, 0, 0.91706, 0.39875, 1800, 1800, 1, 100, 0, 10),
(21326, 103711, 1, -4133.86, -2145.77, 51.8004, 2.25147, 0, 0, 0.902585, 0.430512, 1800, 1800, 1, 100, 0, 10),
(21327, 103711, 1, -4154.6, -2156.53, 52.776, 4.59022, 0, 0, -0.748956, 0.66262, 1800, 1800, 1, 100, 0, 10),
(21328, 103711, 1, -4193.71, -2187.79, 52.5116, 3.82227, 0, 0, -0.942641, 0.333808, 1800, 1800, 1, 100, 0, 10);
DELETE FROM `game_event_gameobject` WHERE `guid`=16586;
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(16219, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(16294, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(16427, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(16428, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(16432, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(16435, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(8951, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(9623, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(9636, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(16436, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(16439, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(16440, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(16441, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(16444, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(9695, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(9696, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(16446, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(16518, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(16531, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(16534, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(16563, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(16573, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(16582, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(16586, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(16588, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(16621, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(21290, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(21291, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(21292, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(21293, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(21294, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(21110, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(21111, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(24979, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(21298, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(21299, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(21300, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(21301, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(21302, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(21303, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(21304, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(21305, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(21306, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(21307, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(21308, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(21309, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(21310, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(21311, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(21312, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(21313, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(21314, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(21315, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(21316, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(21317, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(21318, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(21319, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(21320, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(21321, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(21322, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(21323, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(21324, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(21325, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(21326, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(21327, 1034, 0, 'Tin Vein', 0, 10), -- Tin Veins in Barrens 29 objects total
(21328, 1034, 0, 'Tin Vein', 0, 10); -- Tin Veins in Barrens 29 objects total

-- Missing Tin Vein spawns in Alterac Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(33196, 1732, 0, 225.675, -72.2974, 110.061, 1.95477, 0, 0, 0.829038, 0.559193, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 33195 at 248.217819 yards.
(33198, 1732, 0, 244.997, -10.5061, 83.3397, 0.209439, 0, 0, 0.104528, 0.994522, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 33195 at 266.550751 yards.
(33213, 1732, 0, 12.0793, -148.168, 130.97, 3.3685, 0, 0, -0.993571, 0.113208, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 33195 at 121.186020 yards.
(32305, 1732, 0, -185.258, 375.062, 116.572, 1.02974, 0, 0, 0.492423, 0.870356, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 32279 at 69.703323 yards.
(32306, 1732, 0, -161.117, 398.667, 105.474, 4.08407, 0, 0, -0.891006, 0.453991, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 32279 at 96.789047 yards.
(33286, 1732, 0, 75.6466, -78.375, 114.581, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 33195 at 105.404190 yards.
(33287, 1732, 0, -130.354, -149.858, 120.737, 1.97222, 0, 0, 0.833885, 0.551938, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 33195 at 161.181259 yards.
(42098, 1732, 0, 642.53, 266.969, 22.9494, 3.89209, 0, 0, -0.930417, 0.366502, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 42066 at 399.322693 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(33196, 1067, 0, 'Tin Vein', 0, 10), -- Tin Veins in Hillsbrad 29 objects total
(33198, 1067, 0, 'Tin Vein', 0, 10), -- Tin Veins in Hillsbrad 29 objects total
(33213, 1067, 0, 'Tin Vein', 0, 10), -- Tin Veins in Hillsbrad 29 objects total
(32305, 1067, 0, 'Tin Vein', 0, 10), -- Tin Veins in Hillsbrad 29 objects total
(32306, 1067, 0, 'Tin Vein', 0, 10), -- Tin Veins in Hillsbrad 29 objects total
(33286, 1067, 0, 'Tin Vein', 0, 10), -- Tin Veins in Hillsbrad 29 objects total
(33287, 1067, 0, 'Tin Vein', 0, 10), -- Tin Veins in Hillsbrad 29 objects total
(42098, 1045, 0, 'Tin Vein', 0, 10); -- Tin Veins in Silverpine Forest 21 objects total CORRECT!

-- Missing Tin Vein spawns in Loch Modan.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(30098, 1732, 0, -5361.27, -2695.27, 386.191, 2.68781, 0, 0, 0.97437, 0.224951, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 30075 at 222.173599 yards.
(13100, 1732, 0, -4763.16, -2960.69, 323.212, 0.471238, 0, 0, 0.233445, 0.97237, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 13011 at 460.086639 yards.
(30069, 1732, 0, -5766.73, -3573.74, 337.774, 5.39307, 0, 0, -0.430511, 0.902586, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 30066 at 170.558212 yards.
(30003, 1732, 0, -4958.93, -4036.67, 302.923, 0.785397, 0, 0, 0.382683, 0.92388, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 30002 at 45.550743 yards.
(9755, 1732, 0, -5842.29, -4205.48, 417.789, 3.83973, 0, 0, -0.939692, 0.34202, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5626 at 267.062225 yards.
(9756, 1732, 0, -6097.9, -2814.65, 420.024, 2.47837, 0, 0, 0.945518, 0.325568, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5643 at 279.918549 yards.
(13102, 1732, 0, -5697.35, -3950.6, 327.836, 1.83259, 0, 0, 0.793353, 0.608762, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12905 at 51.179825 yards.
(13103, 1732, 0, -5683.48, -3989.89, 331.728, 1.95477, 0, 0, 0.829038, 0.559193, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12905 at 72.342773 yards.
(13189, 1732, 0, -5469.68, -3993.96, 348.996, 4.46804, 0, 0, -0.788011, 0.615662, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 13143 at 158.300934 yards.
(13195, 1732, 0, -5077.94, -3892.1, 328.07, 5.48033, 0, 0, -0.390731, 0.920505, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 13188 at 119.833641 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(30098, 1167, 0, 'Tin Vein', 0, 10), -- Tin Veins in Loch Modan 18 objects total
(13100, 1167, 0, 'Tin Vein', 0, 10), -- Tin Veins in Loch Modan 18 objects total
(30069, 1167, 0, 'Tin Vein', 0, 10), -- Tin Veins in Loch Modan 18 objects total
(30003, 1167, 0, 'Tin Vein', 0, 10), -- Tin Veins in Loch Modan 18 objects total
(9755, 1167, 0, 'Tin Vein', 0, 10), -- Tin Veins in Loch Modan 18 objects total
(9756, 1167, 0, 'Tin Vein', 0, 10), -- Tin Veins in Loch Modan 18 objects total
(13102, 1167, 0, 'Tin Vein', 0, 10), -- Tin Veins in Loch Modan 18 objects total
(13103, 1167, 0, 'Tin Vein', 0, 10), -- Tin Veins in Loch Modan 18 objects total
(13189, 1167, 0, 'Tin Vein', 0, 10), -- Tin Veins in Loch Modan 18 objects total
(13195, 1167, 0, 'Tin Vein', 0, 10); -- Tin Veins in Loch Modan 18 objects total

-- Missing Tin Vein spawns in Westfall.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(34860, 1732, 0, -11171.6, 653.933, 40.0183, 0.977383, 0, 0, 0.469471, 0.882948, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34856 at 637.400391 yards.
(30999, 1732, 0, -10588.5, 2009.49, -3.73039, 1.46608, 0, 0, 0.66913, 0.743145, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 30983 at 37.395714 yards.
(31010, 1732, 0, -10533.9, 1938.48, 5.95517, 0.523598, 0, 0, 0.258819, 0.965926, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 30983 at 59.560539 yards.
(31955, 1732, 0, -11239.2, 1564.08, 72.4693, 1.0821, 0, 0, 0.515038, 0.857168, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 31949 at 126.301117 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(34860, 1112, 0, 'Tin Vein', 0, 10), -- Tin Veins in Westfall 61 objects total
(30999, 1112, 0, 'Tin Vein', 0, 10), -- Tin Veins in Westfall 61 objects total
(31010, 1112, 0, 'Tin Vein', 0, 10), -- Tin Veins in Westfall 61 objects total
(31955, 1112, 0, 'Tin Vein', 0, 10); -- Tin Veins in Westfall 61 objects total

-- Missing Tin Vein spawns in Redridge Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(29238, 1732, 0, -9140.93, -2028.65, 124.528, 0.436332, 0, 0, 0.216439, 0.976296, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 29236 at 189.870850 yards.
(29254, 1732, 0, -9114.75, -2195.5, 125.289, 3.54302, 0, 0, -0.979924, 0.19937, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 29236 at 114.643456 yards.
(20492, 1732, 0, -8709.11, -2189.66, 154.599, 3.12412, 0, 0, 0.999962, 0.00873464, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20479 at 43.874249 yards.
(29272, 1732, 0, -8749.71, -2186.82, 163.259, 5.21854, 0, 0, -0.507538, 0.861629, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 29248 at 16.274542 yards.
(29273, 1732, 0, -8879.81, -2286.95, 138.31, 5.67232, 0, 0, -0.300705, 0.953717, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 29248 at 153.421936 yards.
(9758, 1732, 0, -9179.15, -2442.4, 115.091, 0.314158, 0, 0, 0.156434, 0.987688, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5664 at 98.998192 yards.
(9762, 1732, 0, -9423.47, -2985.06, 136.619, 0.733038, 0, 0, 0.358368, 0.93358, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5642 at 34.318707 yards.
(20839, 1732, 0, -9681.26, -3114.55, 55.7525, 2.30383, 0, 0, 0.913545, 0.406738, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20794 at 141.645691 yards.
(20840, 1732, 0, -9782.66, -3158.25, 71.5411, 2.75761, 0, 0, 0.981627, 0.190812, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20794 at 191.571976 yards.
(9763, 1732, 0, -9184.41, -3380.13, 119.577, 5.51524, 0, 0, -0.374606, 0.927184, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5627 at 26.074028 yards.
(20841, 1732, 0, -9632.27, -2965.74, 59.3339, 2.86234, 0, 0, 0.990268, 0.139175, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20794 at 86.301674 yards.
(29274, 1732, 0, -8649.48, -2259.47, 156.491, 1.19794, 0, 0, 0.563793, 0.825916, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 29247 at 78.132828 yards.
(20493, 1732, 0, -8704.96, -2174.29, 151.974, 4.86947, 0, 0, -0.649447, 0.760406, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20479 at 32.317600 yards.
(20494, 1732, 0, -8750, -2144, 156.404, 5.86431, 0, 0, -0.207911, 0.978148, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20479 at 29.341415 yards.
(29277, 1732, 0, -8827.17, -2188.08, 179.982, 1.78023, 0, 0, 0.777145, 0.629321, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 29248 at 77.511017 yards.
(23827, 2054, 0, -8901.02, -2016.14, 126.447, 1.46608, 0, 0, 0.66913, 0.743145, 300, 300, 1, 100, 0, 10),
(21329, 2054, 0, -8786.52, -2028.94, 130.408, 3.05433, 0, 0, 0.999048, 0.0436193, 300, 300, 1, 100, 0, 10),
(21330, 2054, 0, -8759.31, -2013.18, 130.802, 5.5676, 0, 0, -0.350207, 0.936672, 300, 300, 1, 100, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(29238, 1129, 0, 'Tin Vein', 0, 10), -- Tin Veins in Redridge 36 objects total
(29254, 1129, 0, 'Tin Vein', 0, 10), -- Tin Veins in Redridge 36 objects total
(20492, 1129, 0, 'Tin Vein', 0, 10), -- Tin Veins in Redridge 36 objects total
(29272, 1129, 0, 'Tin Vein', 0, 10), -- Tin Veins in Redridge 36 objects total
(29273, 1129, 0, 'Tin Vein', 0, 10), -- Tin Veins in Redridge 36 objects total
(9758, 1129, 0, 'Tin Vein', 0, 10), -- Tin Veins in Redridge 36 objects total
(9762, 1129, 0, 'Tin Vein', 0, 10), -- Tin Veins in Redridge 36 objects total
(20839, 1129, 0, 'Tin Vein', 0, 10), -- Tin Veins in Redridge 36 objects total
(20840, 1129, 0, 'Tin Vein', 0, 10), -- Tin Veins in Redridge 36 objects total
(9763, 1129, 0, 'Tin Vein', 0, 10), -- Tin Veins in Redridge 36 objects total
(20841, 1129, 0, 'Tin Vein', 0, 10), -- Tin Veins in Redridge 36 objects total
(29274, 1129, 0, 'Tin Vein', 0, 10), -- Tin Veins in Redridge 36 objects total
(20493, 1129, 0, 'Tin Vein', 0, 10), -- Tin Veins in Redridge 36 objects total
(20494, 1129, 0, 'Tin Vein', 0, 10), -- Tin Veins in Redridge 36 objects total
(29277, 1129, 0, 'Tin Vein', 0, 10), -- Tin Veins in Redridge 36 objects total
(23827, 1129, 0, 'Tin Vein', 0, 10), -- Tin Veins in Redridge 36 objects total
(21329, 1129, 0, 'Tin Vein', 0, 10), -- Tin Veins in Redridge 36 objects total
(21330, 1129, 0, 'Tin Vein', 0, 10); -- Tin Veins in Redridge 36 objects total

-- Missing Tin Vein spawns in Arathi Highlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(35563, 1732, 0, -1614.11, -1993.65, 36.8947, 3.10665, 0, 0, 0.999847, 0.0174693, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 35562 at 340.667816 yards.
(35565, 1732, 0, -1441.19, -2172.02, 23.7131, 1.58825, 0, 0, 0.71325, 0.70091, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 35562 at 222.516602 yards.
(32302, 1732, 0, -1278.39, -1489.21, 65.222, 0.558504, 0, 0, 0.275637, 0.961262, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 32181 at 120.266472 yards.
(16979, 1732, 0, -1080.33, -1610.24, 51.8741, 2.26893, 0, 0, 0.906307, 0.422619, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16967 at 114.914520 yards.
(16951, 1732, 0, -1125.3, -2600.46, 62.6392, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16948 at 203.032303 yards.
(35590, 1732, 0, -1309.58, -2312.32, 64.8675, 2.58308, 0, 0, 0.961261, 0.27564, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 35562 at 276.977081 yards.
(35591, 1732, 0, -1539.82, -2277.77, 34.7815, 4.59022, 0, 0, -0.748956, 0.66262, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 35562 at 86.505005 yards.
(33398, 1732, 0, -692.266, -2099.61, 56.2173, 5.23599, 0, 0, -0.5, 0.866025, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 33377 at 401.697418 yards.
(16955, 1732, 0, -1005.18, -2712.79, 62.6548, 0.0523589, 0, 0, 0.0261765, 0.999657, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16948 at 222.077835 yards.
(33400, 1732, 0, -915.045, -1890.88, 72.8949, 2.91469, 0, 0, 0.993571, 0.113208, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 33377 at 180.089676 yards.
(32307, 1732, 0, -1482.43, -1532.45, 62.7249, 5.8294, 0, 0, -0.224951, 0.97437, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 32181 at 95.976044 yards.
(16932, 1732, 0, -1786.03, -2230.23, 59.2944, 3.54302, 0, 0, -0.979924, 0.19937, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16924 at 118.722694 yards.
(35613, 1732, 0, -1568.49, -2074.03, 37.9544, 2.26893, 0, 0, 0.906307, 0.422619, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 35562 at 260.551605 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(35563, 1187, 0, 'Tin Vein', 0, 10), -- Tin Veins in Arathi 16 objects total
(35565, 1187, 0, 'Tin Vein', 0, 10), -- Tin Veins in Arathi 16 objects total
(32302, 1187, 0, 'Tin Vein', 0, 10), -- Tin Veins in Arathi 16 objects total
(16979, 1187, 0, 'Tin Vein', 0, 10), -- Tin Veins in Arathi 16 objects total
(16951, 1187, 0, 'Tin Vein', 0, 10), -- Tin Veins in Arathi 16 objects total
(35590, 1187, 0, 'Tin Vein', 0, 10), -- Tin Veins in Arathi 16 objects total
(35591, 1187, 0, 'Tin Vein', 0, 10), -- Tin Veins in Arathi 16 objects total
(33398, 1187, 0, 'Tin Vein', 0, 10), -- Tin Veins in Arathi 16 objects total
(16955, 1187, 0, 'Tin Vein', 0, 10), -- Tin Veins in Arathi 16 objects total
(33400, 1187, 0, 'Tin Vein', 0, 10), -- Tin Veins in Arathi 16 objects total
(32307, 1187, 0, 'Tin Vein', 0, 10), -- Tin Veins in Arathi 16 objects total
(16932, 1187, 0, 'Tin Vein', 0, 10), -- Tin Veins in Arathi 16 objects total
(35613, 1187, 0, 'Tin Vein', 0, 10); -- Tin Veins in Arathi 16 objects total

-- Missing Tin Vein spawns in Silverpine Forest.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(42074, 1732, 0, 415.897, 996.533, 109.065, 5.00909, 0, 0, -0.594823, 0.803857, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 42061 at 22.011717 yards.
(6892, 1732, 0, 15.2126, 803.973, 77.9227, 3.75246, 0, 0, -0.953716, 0.300708, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5625 at 136.768478 yards.
(35491, 1732, 0, -282.336, 1030.5, 115.62, 3.54302, 0, 0, -0.979924, 0.19937, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 35478 at 45.946609 yards.
(35589, 1732, 0, -298.773, 958.085, 132.695, 5.28835, 0, 0, -0.477159, 0.878817, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 35570 at 36.401695 yards.
(35550, 1732, 0, -548.759, 1018.47, 105.532, 5.79449, 0, 0, -0.241921, 0.970296, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 35547 at 118.968185 yards.
(35553, 1732, 0, -329.648, 1024.6, 118.751, 4.31097, 0, 0, -0.833885, 0.551938, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 35478 at 31.775393 yards.
(35593, 1732, 0, 1020.51, 1438.16, 46.4768, 2.87979, 0, 0, 0.991445, 0.130528, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 35502 at 294.285522 yards.
(35475, 1732, 0, 520.041, 882.858, 135.329, 4.66003, 0, 0, -0.725374, 0.688355, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 35450 at 128.762436 yards.
(35594, 1732, 0, 392.47, 707.618, 45.5647, 3.24635, 0, 0, -0.998629, 0.0523532, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 35486 at 115.044365 yards.
(35597, 1732, 0, -369.275, 914.196, 132.793, 1.6057, 0, 0, 0.719339, 0.694659, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 35568 at 35.094868 yards.
(35598, 1732, 0, -353.392, 992.701, 128.054, 4.53786, 0, 0, -0.766044, 0.642789, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 35570 at 28.729073 yards.
(35600, 1732, 0, 625.231, 874.41, 37.9086, 1.48353, 0, 0, 0.67559, 0.737278, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 35486 at 171.631012 yards.
(9669, 1732, 0, 136.547, 539.18, 49.9037, 4.39823, 0, 0, -0.809016, 0.587786, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5625 at 236.594498 yards.
(9687, 1732, 0, 192.598, 601.971, 50.1232, 2.40855, 0, 0, 0.93358, 0.358368, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5625 at 256.438782 yards.
(35601, 1732, 0, 368.115, 604.431, 48.3461, 3.89209, 0, 0, -0.930417, 0.366502, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 35486 at 206.481827 yards.
(35606, 1732, 0, 1221.43, 1728.9, 34.2743, 1.79769, 0, 0, 0.782608, 0.622515, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 35519 at 191.603027 yards.
(9697, 1732, 0, 215.092, 1457.74, 121.133, 4.03171, 0, 0, -0.902585, 0.430512, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5505 at 151.692902 yards.
(35607, 1732, 0, 1298.86, 462.37, 17.1292, 2.47837, 0, 0, 0.945518, 0.325568, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 35454 at 269.000122 yards.
(35612, 1732, 0, -312.241, 1036.87, 115.711, 1.41372, 0, 0, 0.649447, 0.760406, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 35478 at 20.490026 yards.
(9764, 1732, 0, -567.707, 813.416, 91.6254, 1.83259, 0, 0, 0.793353, 0.608762, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 5640 at 88.102097 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(42074, 1045, 0, 'Tin Vein', 0, 10), -- Tin Veins in Silverpine Forest 21 objects total
(6892, 1045, 0, 'Tin Vein', 0, 10), -- Tin Veins in Silverpine Forest 21 objects total
(35491, 1045, 0, 'Tin Vein', 0, 10), -- Tin Veins in Silverpine Forest 21 objects total
(35589, 1045, 0, 'Tin Vein', 0, 10), -- Tin Veins in Silverpine Forest 21 objects total
(35550, 1045, 0, 'Tin Vein', 0, 10), -- Tin Veins in Silverpine Forest 21 objects total
(35553, 1045, 0, 'Tin Vein', 0, 10), -- Tin Veins in Silverpine Forest 21 objects total
(35593, 1045, 0, 'Tin Vein', 0, 10), -- Tin Veins in Silverpine Forest 21 objects total
(35475, 1045, 0, 'Tin Vein', 0, 10), -- Tin Veins in Silverpine Forest 21 objects total
(35594, 1045, 0, 'Tin Vein', 0, 10), -- Tin Veins in Silverpine Forest 21 objects total
(35597, 1045, 0, 'Tin Vein', 0, 10), -- Tin Veins in Silverpine Forest 21 objects total
(35598, 1045, 0, 'Tin Vein', 0, 10), -- Tin Veins in Silverpine Forest 21 objects total
(35600, 1045, 0, 'Tin Vein', 0, 10), -- Tin Veins in Silverpine Forest 21 objects total
(9669, 1045, 0, 'Tin Vein', 0, 10), -- Tin Veins in Silverpine Forest 21 objects total
(9687, 1045, 0, 'Tin Vein', 0, 10), -- Tin Veins in Silverpine Forest 21 objects total
(35601, 1045, 0, 'Tin Vein', 0, 10), -- Tin Veins in Silverpine Forest 21 objects total
(35606, 1045, 0, 'Tin Vein', 0, 10), -- Tin Veins in Silverpine Forest 21 objects total
(9697, 1045, 0, 'Tin Vein', 0, 10), -- Tin Veins in Silverpine Forest 21 objects total
(35607, 1045, 0, 'Tin Vein', 0, 10), -- Tin Veins in Silverpine Forest 21 objects total
(35612, 1045, 0, 'Tin Vein', 0, 10), -- Tin Veins in Silverpine Forest 21 objects total
(9764, 1045, 0, 'Tin Vein', 0, 10); -- Tin Veins in Silverpine Forest 21 objects total

-- Missing Tin Vein spawns in Darkshore.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(48763, 1732, 1, 7508.31, -1102.54, 50.2059, 4.38078, 0, 0, -0.814116, 0.580703, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 48757 at 106.373032 yards.
(9628, 1732, 1, 7248.41, 412.611, -2.72741, 4.57276, 0, 0, -0.754709, 0.656059, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5641 at 653.586975 yards.
(9641, 1732, 1, 7447.99, -140.624, 3.34259, 1.81514, 0, 0, 0.788011, 0.615662, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5485 at 239.221069 yards.
(9691, 1732, 1, 7392.54, -1088.89, 42.2422, 5.61996, 0, 0, -0.325567, 0.945519, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5531 at 169.864914 yards.
(9692, 1732, 1, 7555.8, 54.8934, -2.61125, 0.575957, 0, 0, 0.284015, 0.95882, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5485 at 459.021393 yards.
(9757, 1732, 1, 5776.75, 49.0581, 45.8117, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5572 at 122.940964 yards.
(9759, 1732, 1, 6878.92, -765.453, 61.0139, 5.96903, 0, 0, -0.156434, 0.987688, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5592 at 436.872345 yards.
(48500, 1732, 1, 4649.95, 16.5248, 70.9768, 2.65289, 0, 0, 0.970295, 0.241925, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 48493 at 59.297283 yards.
(9760, 1732, 1, 7196.19, -576.259, 38.9873, 0.0349062, 0, 0, 0.0174522, 0.999848, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5485 at 281.802155 yards.
(9765, 1732, 1, 6985.49, 189.042, -0.514565, 3.64774, 0, 0, -0.968147, 0.250381, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 5641 at 411.286743 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(48763, 1099, 0, 'Tin Vein', 0, 10), -- Tin Veins in Darkshore 19 objects total
(9628, 1099, 0, 'Tin Vein', 0, 10), -- Tin Veins in Darkshore 19 objects total
(9641, 1099, 0, 'Tin Vein', 0, 10), -- Tin Veins in Darkshore 19 objects total
(9691, 1099, 0, 'Tin Vein', 0, 10), -- Tin Veins in Darkshore 19 objects total
(9692, 1099, 0, 'Tin Vein', 0, 10), -- Tin Veins in Darkshore 19 objects total
(9757, 1099, 0, 'Tin Vein', 0, 10), -- Tin Veins in Darkshore 19 objects total
(9759, 1099, 0, 'Tin Vein', 0, 10), -- Tin Veins in Darkshore 19 objects total
(48500, 1099, 0, 'Tin Vein', 0, 10), -- Tin Veins in Darkshore 19 objects total
(9760, 1099, 0, 'Tin Vein', 0, 10), -- Tin Veins in Darkshore 19 objects total
(9765, 1099, 0, 'Tin Vein', 0, 10); -- Tin Veins in Darkshore 19 objects total

-- Missing Tin Vein spawns in Hillsbrad Foothills.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(27625, 1732, 0, -466.639, -1189.97, 62.6573, 6.03884, 0, 0, -0.121869, 0.992546, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 27623 at 53.962635 yards.
(29294, 1732, 0, 115.795, -639.137, 97.0621, 5.96903, 0, 0, -0.156434, 0.987688, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 29290 at 68.601288 yards.
(28519, 1732, 0, 146.455, -789.081, 96.4316, 6.16101, 0, 0, -0.0610485, 0.998135, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 28516 at 80.130478 yards.
(28522, 1732, 0, -817.62, -1210.97, 57.0243, 1.53589, 0, 0, 0.694658, 0.71934, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 28521 at 230.362900 yards.
(9619, 1732, 0, -246.092, -1070.03, 47.9878, 0.977383, 0, 0, 0.469471, 0.882948, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5597 at 121.943420 yards.
(27626, 1732, 0, -403.761, -1124.34, 56.1819, 2.40855, 0, 0, 0.93358, 0.358368, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 27623 at 47.819267 yards.
(33202, 1732, 0, 113.881, -836.672, 82.0067, 5.86431, 0, 0, -0.207911, 0.978148, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 33199 at 93.956940 yards.
(33376, 1732, 0, -304.803, -1240.07, 72.5146, 0.209439, 0, 0, 0.104528, 0.994522, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 33360 at 42.826859 yards.
(9652, 1732, 0, -277.789, -1020.47, 66.2642, 3.52557, 0, 0, -0.981627, 0.190812, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5597 at 130.239212 yards.
(9690, 1732, 0, -1121.06, -1262.97, 63.4558, 2.25147, 0, 0, 0.902585, 0.430512, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5524 at 14.429770 yards.
(9693, 1732, 0, 73.2704, -1002.17, 59.4981, 0.139624, 0, 0, 0.0697556, 0.997564, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5671 at 64.096527 yards.
(33407, 1732, 0, -223.61, -1172.77, 60.582, 1.95477, 0, 0, 0.829038, 0.559193, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 33360 at 79.132294 yards.
(33413, 1732, 0, -226.163, -560.77, 65.1476, 3.26377, 0, 0, -0.998135, 0.0610518, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 33357 at 98.896759 yards.
(968, 1732, 0, -206.104, -92.2563, 88.0968, 5.02655, 0, 0, -0.587785, 0.809017, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5655 at 138.857941 yards.
(21297, 1732, 0, -90.0451, -1361.99, 123.778, 3.3685, 0, 0, -0.993571, 0.113208, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 21295 at 143.713776 yards.
(33288, 1732, 0, 194.473, -948.311, 83.2584, 5.55015, 0, 0, -0.358368, 0.93358, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 33199 at 55.898308 yards.
(9761, 1732, 0, 154.879, -1004.65, 77.9133, 6.23083, 0, 0, -0.0261765, 0.999657, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5582 at 68.451302 yards.
(21331, 103711, 0, -688.964, 168.78, 18.368, 3.05433, 0, 0, 0.999048, 0.0436193, 300, 300, 1, 100, 0, 10),
(21332, 103711, 0, -753.013, 60.5743, 13.9019, 4.18879, 0, 0, -0.866025, 0.500001, 300, 300, 1, 100, 0, 10),
(21333, 103711, 0, -814.69, 61.7938, 7.22033, 3.76991, 0, 0, -0.951056, 0.309017, 300, 300, 1, 100, 0, 10),
(21334, 103711, 0, -701.806, 50.6085, 14.2192, 3.00195, 0, 0, 0.997563, 0.0697661, 300, 300, 1, 100, 0, 10),
(21335, 103711, 0, -819.406, 157.641, 17.9377, 1.39626, 0, 0, 0.642787, 0.766045, 300, 300, 1, 100, 0, 10),
(21336, 103711, 0, -802.309, 104.239, 8.29598, 0.872664, 0, 0, 0.422618, 0.906308, 300, 300, 1, 100, 0, 10),
(21337, 103711, 0, -835.033, 202.398, 7.71369, 5.72468, 0, 0, -0.275637, 0.961262, 300, 300, 1, 100, 0, 10),
(21338, 103711, 0, -816.58, 164.147, 4.45748, 4.31097, 0, 0, -0.833885, 0.551938, 300, 300, 1, 100, 0, 10),
(21339, 103711, 0, -786.916, 36.4646, 15.6267, 5.93412, 0, 0, -0.173648, 0.984808, 300, 300, 1, 100, 0, 10),
(21340, 103711, 0, -736.823, 43.7604, 12.0023, 0.453785, 0, 0, 0.224951, 0.97437, 300, 300, 1, 100, 0, 10),
(21341, 103711, 0, -772.421, 158.365, 21.1145, 5.41052, 0, 0, -0.422618, 0.906308, 300, 300, 1, 100, 0, 10),
(21342, 103711, 0, -791.245, 147.029, 4.00136, 5.41052, 0, 0, -0.422618, 0.906308, 300, 300, 1, 100, 0, 10),
(21343, 103711, 0, -837.585, 81.8425, 3.4292, 4.88692, 0, 0, -0.642787, 0.766045, 300, 300, 1, 100, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(27625, 1067, 0, 'Tin Vein', 0, 10), -- Tin Veins in Hillsbrad 29 objects total
(29294, 1067, 0, 'Tin Vein', 0, 10), -- Tin Veins in Hillsbrad 29 objects total
(28519, 1067, 0, 'Tin Vein', 0, 10), -- Tin Veins in Hillsbrad 29 objects total
(28522, 1067, 0, 'Tin Vein', 0, 10), -- Tin Veins in Hillsbrad 29 objects total
(9619, 1067, 0, 'Tin Vein', 0, 10), -- Tin Veins in Hillsbrad 29 objects total
(27626, 1067, 0, 'Tin Vein', 0, 10), -- Tin Veins in Hillsbrad 29 objects total
(33202, 1067, 0, 'Tin Vein', 0, 10), -- Tin Veins in Hillsbrad 29 objects total
(33376, 1067, 0, 'Tin Vein', 0, 10), -- Tin Veins in Hillsbrad 29 objects total
(9652, 1067, 0, 'Tin Vein', 0, 10), -- Tin Veins in Hillsbrad 29 objects total
(9690, 1067, 0, 'Tin Vein', 0, 10), -- Tin Veins in Hillsbrad 29 objects total
(9693, 1067, 0, 'Tin Vein', 0, 10), -- Tin Veins in Hillsbrad 29 objects total
(33407, 1067, 0, 'Tin Vein', 0, 10), -- Tin Veins in Hillsbrad 29 objects total
(33413, 1067, 0, 'Tin Vein', 0, 10), -- Tin Veins in Hillsbrad 29 objects total
(968, 1067, 0, 'Tin Vein', 0, 10), -- Tin Veins in Hillsbrad 29 objects total
(21297, 1067, 0, 'Tin Vein', 0, 10), -- Tin Veins in Hillsbrad 29 objects total
(33288, 1067, 0, 'Tin Vein', 0, 10), -- Tin Veins in Hillsbrad 29 objects total
(9761, 1067, 0, 'Tin Vein', 0, 10), -- Tin Veins in Hillsbrad 29 objects total
(21331, 1067, 0, 'Tin Vein', 0, 10), -- Tin Veins in Hillsbrad 29 objects total
(21332, 1067, 0, 'Tin Vein', 0, 10), -- Tin Veins in Hillsbrad 29 objects total
(21333, 1067, 0, 'Tin Vein', 0, 10), -- Tin Veins in Hillsbrad 29 objects total
(21334, 1067, 0, 'Tin Vein', 0, 10), -- Tin Veins in Hillsbrad 29 objects total
(21335, 1067, 0, 'Tin Vein', 0, 10), -- Tin Veins in Hillsbrad 29 objects total
(21336, 1067, 0, 'Tin Vein', 0, 10), -- Tin Veins in Hillsbrad 29 objects total
(21337, 1067, 0, 'Tin Vein', 0, 10), -- Tin Veins in Hillsbrad 29 objects total
(21338, 1067, 0, 'Tin Vein', 0, 10), -- Tin Veins in Hillsbrad 29 objects total
(21339, 1067, 0, 'Tin Vein', 0, 10), -- Tin Veins in Hillsbrad 29 objects total
(21340, 1067, 0, 'Tin Vein', 0, 10), -- Tin Veins in Hillsbrad 29 objects total
(21341, 1067, 0, 'Tin Vein', 0, 10), -- Tin Veins in Hillsbrad 29 objects total
(21342, 1067, 0, 'Tin Vein', 0, 10), -- Tin Veins in Hillsbrad 29 objects total
(21343, 1067, 0, 'Tin Vein', 0, 10); -- Tin Veins in Hillsbrad 29 objects total

-- Missing Tin Vein spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(9637, 1732, 1, 2535.7, -3647.75, 64.2268, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5499 at 203.585754 yards.
(9640, 1732, 1, 3496.51, 160.563, 11.7161, 5.46288, 0, 0, -0.398748, 0.91706, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5585 at 191.594162 yards.
(34192, 1732, 1, 4150.94, 1239.4, 0.411521, 4.46804, 0, 0, -0.788011, 0.615662, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34153 at 76.739906 yards.
(9667, 1732, 1, 2116.88, -3558.51, 60.8862, 1.79769, 0, 0, 0.782608, 0.622515, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5499 at 630.445801 yards.
(48132, 1732, 1, 3104.31, 397.07, 14.2702, 3.21142, 0, 0, -0.999391, 0.0349061, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 48127 at 135.799927 yards.
(32583, 1732, 1, 2186.04, -2180.25, 117.121, 3.26377, 0, 0, -0.998135, 0.0610518, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 32579 at 204.167557 yards.
(33543, 1732, 1, 3278.94, 381.677, 10.9858, 5.18363, 0, 0, -0.522498, 0.85264, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 33541 at 99.583359 yards.
(14480, 1732, 1, 2331.05, -3524.71, 53.3985, 1.16937, 0, 0, 0.551936, 0.833886, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5499 at 438.042725 yards.
(48125, 1732, 1, 3246.52, -340.965, 162.653, 2.91469, 0, 0, 0.993571, 0.113208, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 48124 at 315.357025 yards.
(32597, 1732, 1, 2909.78, 415.713, 103.499, 1.309, 0, 0, 0.608761, 0.793354, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 32587 at 199.615494 yards.
(48133, 1732, 1, 1835.21, -3164.55, 93.6548, 5.49779, 0, 0, -0.382683, 0.92388, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 48128 at 312.633484 yards.
(14488, 1732, 1, 3305.86, 679.983, 18.0436, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 5676 at 190.596008 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(9637, 1074, 0, 'Tin Vein', 0, 10), -- Tin Veins in Ashenvale 30 objects total
(9640, 1074, 0, 'Tin Vein', 0, 10), -- Tin Veins in Ashenvale 30 objects total
(34192, 1074, 0, 'Tin Vein', 0, 10), -- Tin Veins in Ashenvale 30 objects total
(9667, 1074, 0, 'Tin Vein', 0, 10), -- Tin Veins in Ashenvale 30 objects total
(48132, 1074, 0, 'Tin Vein', 0, 10), -- Tin Veins in Ashenvale 30 objects total
(32583, 1074, 0, 'Tin Vein', 0, 10), -- Tin Veins in Ashenvale 30 objects total
(33543, 1074, 0, 'Tin Vein', 0, 10), -- Tin Veins in Ashenvale 30 objects total
(14480, 1074, 0, 'Tin Vein', 0, 10), -- Tin Veins in Ashenvale 30 objects total
(48125, 1074, 0, 'Tin Vein', 0, 10), -- Tin Veins in Ashenvale 30 objects total
(32597, 1074, 0, 'Tin Vein', 0, 10), -- Tin Veins in Ashenvale 30 objects total
(48133, 1074, 0, 'Tin Vein', 0, 10), -- Tin Veins in Ashenvale 30 objects total
(14488, 1074, 0, 'Tin Vein', 0, 10); -- Tin Veins in Ashenvale 30 objects total

-- Missing Tin Vein spawns in Thousand Needles.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(17151, 1732, 1, -5620.49, -4221.83, -56.8478, 2.25147, 0, 0, 0.902585, 0.430512, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 17136 at 1019.974976 yards.
(17163, 1732, 1, -4867, -2029.09, -14.7009, 4.53786, 0, 0, -0.766044, 0.642789, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 17162 at 395.891724 yards.
(17152, 1732, 1, -5432.73, -3276.28, -33.0539, 0.645772, 0, 0, 0.317305, 0.948324, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 17137 at 149.401688 yards.
(17164, 1732, 1, -4726.98, -1956.17, -46.6445, 3.4383, 0, 0, -0.989016, 0.147811, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 17159 at 451.761230 yards.
(17165, 1732, 1, -4405.88, -1035.62, -51.8744, 4.32842, 0, 0, -0.829037, 0.559194, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 17158 at 311.522461 yards.
(17166, 1732, 1, -5196.11, -1641.78, -53.4753, 5.72468, 0, 0, -0.275637, 0.961262, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 17159 at 396.419495 yards.
(9644, 1732, 1, -5170.76, -2468.91, -50.2186, 3.4034, 0, 0, -0.991445, 0.130528, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5613 at 113.694695 yards.
(17153, 1732, 1, -5532.87, -3203.78, -26.6375, 3.75246, 0, 0, -0.953716, 0.300708, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 17137 at 228.265701 yards.
(17171, 1732, 1, -5332.29, -1845.28, -38.8503, 3.07177, 0, 0, 0.999391, 0.0349061, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 17155 at 226.116653 yards.
(17172, 1732, 1, -5136.27, -1594.52, -45.4162, 2.96704, 0, 0, 0.996194, 0.087165, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 17159 at 325.280243 yards.
(17173, 1732, 1, -4595.86, -924.888, -50.1135, 1.81514, 0, 0, 0.788011, 0.615662, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 17158 at 192.209595 yards.
(17174, 1732, 1, -5326.55, -2659.52, -40.025, 3.28124, 0, 0, -0.997563, 0.0697661, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 17161 at 163.894073 yards.
(17175, 1732, 1, -5404.32, -3212.83, -24.5899, 2.07694, 0, 0, 0.861629, 0.507539, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 17137 at 102.014061 yards.
(9694, 1732, 1, -5748.98, -3198.82, -36.5817, 2.05949, 0, 0, 0.857167, 0.515038, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5678 at 253.460800 yards.
(17176, 1732, 1, -5281.81, -1940.02, -40.8085, 5.88176, 0, 0, -0.199368, 0.979925, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 17155 at 165.436417 yards.
(170118, 1732, 1, -4638.31, -1229.49, -52.2849, 0.750491, 0, 0, 0.366501, 0.930418, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 170095 at 111.945503 yards.
(17177, 1732, 1, -5487.45, -2996.18, -28.7473, 0.139624, 0, 0, 0.0697556, 0.997564, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 17157 at 151.435089 yards.
(17178, 1732, 1, -5453.83, -1982.42, -51.407, 1.46608, 0, 0, 0.66913, 0.743145, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 17155 at 101.770752 yards.
(17179, 1732, 1, -5102.58, -2206.2, -45.4434, 0.349065, 0, 0, 0.173648, 0.984808, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 17162 at 101.872467 yards.
(17180, 1732, 1, -5368.9, -2900.7, -56.4231, 5.28835, 0, 0, -0.477159, 0.878817, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 17157 at 58.129078 yards.
(17182, 1732, 1, -4948.66, -2009.09, -42.2582, 4.59022, 0, 0, -0.748956, 0.66262, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 17162 at 343.989197 yards.
(9700, 1732, 1, -5026.32, -2294.76, -49.7846, 2.84488, 0, 0, 0.989016, 0.147811, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5613 at 127.295036 yards.
(14481, 1732, 1, -5210.62, -2515.15, -40.6858, 1.50098, 0, 0, 0.681998, 0.731354, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5613 at 172.071518 yards.
(17184, 1732, 1, -5107.07, -1449.59, -31.6964, 0.401425, 0, 0, 0.199368, 0.979925, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 17159 at 293.151733 yards.
(14486, 1732, 1, -5121.02, -2374.72, -51.7483, 0, 0, 0, 0, 1, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5613 at 19.589302 yards.
(14487, 1732, 1, -5819.69, -3387.3, -47.8351, 1.51844, 0, 0, 0.688354, 0.725374, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5678 at 454.590118 yards.
(17185, 1732, 1, -5405.82, -1634.32, -50.4901, 0.90757, 0, 0, 0.438371, 0.898794, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 17155 at 428.688538 yards.
(17226, 1732, 1, -5572.41, -2240.99, -55.2881, 4.08407, 0, 0, -0.891006, 0.453991, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 17156 at 129.574493 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(17151, 1131, 0, 'Tin Vein', 0, 10), -- Tin Veins in Thousand Needles 15 objects total
(17163, 1131, 0, 'Tin Vein', 0, 10), -- Tin Veins in Thousand Needles 15 objects total
(17152, 1131, 0, 'Tin Vein', 0, 10), -- Tin Veins in Thousand Needles 15 objects total
(17164, 1131, 0, 'Tin Vein', 0, 10), -- Tin Veins in Thousand Needles 15 objects total
(17165, 1131, 0, 'Tin Vein', 0, 10), -- Tin Veins in Thousand Needles 15 objects total
(17166, 1131, 0, 'Tin Vein', 0, 10), -- Tin Veins in Thousand Needles 15 objects total
(9644, 1131, 0, 'Tin Vein', 0, 10), -- Tin Veins in Thousand Needles 15 objects total
(17153, 1131, 0, 'Tin Vein', 0, 10), -- Tin Veins in Thousand Needles 15 objects total
(17171, 1131, 0, 'Tin Vein', 0, 10), -- Tin Veins in Thousand Needles 15 objects total
(17172, 1131, 0, 'Tin Vein', 0, 10), -- Tin Veins in Thousand Needles 15 objects total
(17173, 1131, 0, 'Tin Vein', 0, 10), -- Tin Veins in Thousand Needles 15 objects total
(17174, 1131, 0, 'Tin Vein', 0, 10), -- Tin Veins in Thousand Needles 15 objects total
(17175, 1131, 0, 'Tin Vein', 0, 10), -- Tin Veins in Thousand Needles 15 objects total
(9694, 1131, 0, 'Tin Vein', 0, 10), -- Tin Veins in Thousand Needles 15 objects total
(17176, 1131, 0, 'Tin Vein', 0, 10), -- Tin Veins in Thousand Needles 15 objects total
(170118, 1131, 0, 'Tin Vein', 0, 10), -- Tin Veins in Thousand Needles 15 objects total
(17177, 1131, 0, 'Tin Vein', 0, 10), -- Tin Veins in Thousand Needles 15 objects total
(17178, 1131, 0, 'Tin Vein', 0, 10), -- Tin Veins in Thousand Needles 15 objects total
(17179, 1131, 0, 'Tin Vein', 0, 10), -- Tin Veins in Thousand Needles 15 objects total
(17180, 1131, 0, 'Tin Vein', 0, 10), -- Tin Veins in Thousand Needles 15 objects total
(17182, 1131, 0, 'Tin Vein', 0, 10), -- Tin Veins in Thousand Needles 15 objects total
(9700, 1131, 0, 'Tin Vein', 0, 10), -- Tin Veins in Thousand Needles 15 objects total
(14481, 1131, 0, 'Tin Vein', 0, 10), -- Tin Veins in Thousand Needles 15 objects total
(17184, 1131, 0, 'Tin Vein', 0, 10), -- Tin Veins in Thousand Needles 15 objects total
(14486, 1131, 0, 'Tin Vein', 0, 10), -- Tin Veins in Thousand Needles 15 objects total
(14487, 1131, 0, 'Tin Vein', 0, 10), -- Tin Veins in Thousand Needles 15 objects total
(17185, 1131, 0, 'Tin Vein', 0, 10), -- Tin Veins in Thousand Needles 15 objects total
(17226, 1131, 0, 'Tin Vein', 0, 10); -- Tin Veins in Thousand Needles 15 objects total

-- Missing Tin Vein spawns in Desolace.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(20753, 1732, 1, -1623.51, 1472.56, 65.1219, 0.698131, 0, 0, 0.34202, 0.939693, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20726 at 223.904739 yards.
(6865, 1732, 1, -1873.53, 2182.41, 81.0751, 0.837757, 0, 0, 0.406736, 0.913546, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5654 at 210.594986 yards.
(20754, 1732, 1, -222.367, 843.651, 91.3909, 3.6652, 0, 0, -0.965925, 0.258821, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20731 at 323.020813 yards.
(20755, 1732, 1, -1737.01, 2171.06, 89.2184, 6.07375, 0, 0, -0.104528, 0.994522, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20729 at 298.411682 yards.
(8912, 1732, 1, -1716.97, 2435.48, 101.691, 5.60251, 0, 0, -0.333807, 0.942641, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5654 at 374.949280 yards.
(20822, 1732, 1, -688.839, 2700.32, 37.8741, 3.7001, 0, 0, -0.961261, 0.27564, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20727 at 196.482361 yards.
(8950, 1732, 1, -1942.31, 2602.81, 72.7339, 3.29869, 0, 0, -0.996917, 0.0784664, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5654 at 339.911774 yards.
(8964, 1732, 1, -508.031, 859.585, 94.608, 0, 0, 0, 0, 1, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5602 at 523.021545 yards.
(20824, 1732, 1, -169.338, 1786.58, 155.518, 4.72984, 0, 0, -0.700909, 0.713251, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20728 at 373.317474 yards.
(20838, 1732, 1, -1146.02, 1271.71, 94.6874, 1.13446, 0, 0, 0.537299, 0.843392, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20730 at 304.586395 yards.
(9689, 1732, 1, -1787.2, 2460.57, 78.082, 2.91469, 0, 0, 0.993571, 0.113208, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 5654 at 323.848328 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(20753, 1140, 0, 'Tin Vein', 0, 10), -- Tin Veins in Desolace 15 objects total
(6865, 1140, 0, 'Tin Vein', 0, 10), -- Tin Veins in Desolace 15 objects total
(20754, 1140, 0, 'Tin Vein', 0, 10), -- Tin Veins in Desolace 15 objects total
(20755, 1140, 0, 'Tin Vein', 0, 10), -- Tin Veins in Desolace 15 objects total
(8912, 1140, 0, 'Tin Vein', 0, 10), -- Tin Veins in Desolace 15 objects total
(20822, 1140, 0, 'Tin Vein', 0, 10), -- Tin Veins in Desolace 15 objects total
(8950, 1140, 0, 'Tin Vein', 0, 10), -- Tin Veins in Desolace 15 objects total
(8964, 1140, 0, 'Tin Vein', 0, 10), -- Tin Veins in Desolace 15 objects total
(20824, 1140, 0, 'Tin Vein', 0, 10), -- Tin Veins in Desolace 15 objects total
(20838, 1140, 0, 'Tin Vein', 0, 10), -- Tin Veins in Desolace 15 objects total
(9689, 1140, 0, 'Tin Vein', 0, 10); -- Tin Veins in Desolace 15 objects total

-- Missing Tin Vein spawns in Stonetalon Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(48038, 1732, 1, 2225.04, 955.083, 311.717, 4.4855, 0, 0, -0.782608, 0.622515, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 47687 at 347.137970 yards.
(6858, 1732, 1, 2450.75, 1557.49, 277.38, 1.18682, 0, 0, 0.559193, 0.829038, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5502 at 236.204788 yards.
(48048, 1732, 1, 1466.73, -489.995, 39.1938, 1.16937, 0, 0, 0.551936, 0.833886, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 47686 at 313.334747 yards.
(9651, 1732, 1, -2.90169, -378.754, 3.61077, 0.750491, 0, 0, 0.366501, 0.930418, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5669 at 118.873955 yards.
(48049, 1732, 1, 1616.15, 950.318, 126.069, 2.54818, 0, 0, 0.956305, 0.292372, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 47684 at 326.273071 yards.
(48050, 1732, 1, 1332.36, -467.888, 43.0343, 3.85718, 0, 0, -0.936671, 0.35021, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 47686 at 212.069092 yards.
(48051, 1732, 1, 939.367, -364.76, 17.9968, 6.19592, 0, 0, -0.0436192, 0.999048, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 47676 at 70.999504 yards.
(48052, 1732, 1, 1658.01, 785.485, 141.008, 0.994837, 0, 0, 0.477159, 0.878817, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 47684 at 165.115891 yards.
(48053, 1732, 1, 2420.78, 1084.96, 339.115, 2.33874, 0, 0, 0.920505, 0.390732, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 47687 at 218.286896 yards.
(48054, 1732, 1, 2471.98, 1237.88, 317.663, 2.67035, 0, 0, 0.972369, 0.233448, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 47687 at 142.562195 yards.
(34193, 1732, 1, 792.672, 1546.45, -20.5975, 3.68265, 0, 0, -0.96363, 0.267241, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34157 at 441.537170 yards.
(14482, 1732, 1, 124.152, -217.584, 25.9676, 4.08407, 0, 0, -0.891006, 0.453991, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5669 at 92.438934 yards.
(48055, 1732, 1, 972.861, -6.39605, 30.3832, 2.35619, 0, 0, 0.92388, 0.382683, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 47677 at 288.344818 yards.
(48056, 1732, 1, 971.631, -326.555, 24.0093, 0.418879, 0, 0, 0.207911, 0.978148, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 47676 at 32.633438 yards.
(48057, 1732, 1, 1626.51, -62.4331, 78.6646, 5.68977, 0, 0, -0.292372, 0.956305, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 47686 at 456.825470 yards.
(48058, 1732, 1, -41.746, 246.04, 85.9696, 4.38078, 0, 0, -0.814116, 0.580703, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 47682 at 70.480515 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(48038, 1090, 0, 'Tin Vein', 0, 10), -- Tin Veins in Stonetalon 25 objects total
(6858, 1090, 0, 'Tin Vein', 0, 10), -- Tin Veins in Stonetalon 25 objects total
(48048, 1090, 0, 'Tin Vein', 0, 10), -- Tin Veins in Stonetalon 25 objects total
(9651, 1090, 0, 'Tin Vein', 0, 10), -- Tin Veins in Stonetalon 25 objects total
(48049, 1090, 0, 'Tin Vein', 0, 10), -- Tin Veins in Stonetalon 25 objects total
(48050, 1090, 0, 'Tin Vein', 0, 10), -- Tin Veins in Stonetalon 25 objects total
(48051, 1090, 0, 'Tin Vein', 0, 10), -- Tin Veins in Stonetalon 25 objects total
(48052, 1090, 0, 'Tin Vein', 0, 10), -- Tin Veins in Stonetalon 25 objects total
(48053, 1090, 0, 'Tin Vein', 0, 10), -- Tin Veins in Stonetalon 25 objects total
(48054, 1090, 0, 'Tin Vein', 0, 10), -- Tin Veins in Stonetalon 25 objects total
(34193, 1090, 0, 'Tin Vein', 0, 10), -- Tin Veins in Stonetalon 25 objects total
(14482, 1090, 0, 'Tin Vein', 0, 10), -- Tin Veins in Stonetalon 25 objects total
(48055, 1090, 0, 'Tin Vein', 0, 10), -- Tin Veins in Stonetalon 25 objects total
(48056, 1090, 0, 'Tin Vein', 0, 10), -- Tin Veins in Stonetalon 25 objects total
(48057, 1090, 0, 'Tin Vein', 0, 10), -- Tin Veins in Stonetalon 25 objects total
(48058, 1090, 0, 'Tin Vein', 0, 10); -- Tin Veins in Stonetalon 25 objects total

-- Missing Tin Vein spawns in The Deadmines.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(34837, 1732, 0, -11246.3, 1495.25, 25.8256, 4.93928, 0, 0, -0.622514, 0.782609, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34834 at 52.742420 yards.
(30549, 1732, 0, -11252, 1595.68, 34.8681, 2.89725, 0, 0, 0.992546, 0.12187, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 30548 at 128.731491 yards.
(30550, 1732, 0, -11238.8, 1561.65, 35.6531, 0.436332, 0, 0, 0.216439, 0.976296, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 30548 at 93.703247 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(34837, 1112, 0, 'Tin Vein', 0, 10), -- Tin Veins in Westfall 61 objects total
(30549, 1112, 0, 'Tin Vein', 0, 10), -- Tin Veins in Westfall 61 objects total
(30550, 1112, 0, 'Tin Vein', 0, 10); -- Tin Veins in Westfall 61 objects total

-- Missing Tin Vein spawns in Stranglethorn
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES (405, 1, 'Tin Veins in Stranglethorn');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(57638, 1732, 0, -11761, -254.122, 28.2692, 0.767944, 0, 0, 0.374606, 0.927184, 300, 300, 1, 100, 0, 10),
(57639, 1732, 0, -11447.7, -321.118, 59.8395, 2.53072, 0, 0, 0.953716, 0.300708, 300, 300, 1, 100, 0, 10),
(57640, 1732, 0, -11501, -191.352, 56.1841, 6.16101, 0, 0, -0.0610485, 0.998135, 300, 300, 1, 100, 0, 10),
(57641, 1732, 0, -11654.8, -549.555, 29.7414, 1.0472, 0, 0, 0.5, 0.866025, 300, 300, 1, 100, 0, 10),
(57642, 1732, 0, -11441.2, 107.13, 41.1716, 6.14356, 0, 0, -0.0697556, 0.997564, 300, 300, 1, 100, 0, 10),
(57643, 1732, 0, -11463, -93.0085, 35.1165, 0.925024, 0, 0, 0.446198, 0.894935, 300, 300, 1, 100, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(57638, 405, 0, 'Tin Vein', 0, 10),
(57639, 405, 0, 'Tin Vein', 0, 10),
(57640, 405, 0, 'Tin Vein', 0, 10),
(57641, 405, 0, 'Tin Vein', 0, 10),
(57642, 405, 0, 'Tin Vein', 0, 10),
(57643, 405, 0, 'Tin Vein', 0, 10);

-- Missing Tin Vein spawns in Redridge Mountains,
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(57644, 1732, 0, -8827.17, -2188.08, 179.982, 1.78023, 0, 0, 0.777145, 0.629321, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 29248 at 77,511017 yards,
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(57644, 1129, 0, 'Tin Vein', 0, 10); -- Tin Veins in Redridge 36 objects total

UPDATE `pool_gameobject` SET `description` = 'Tin Vein' WHERE `guid` = 55955;
UPDATE `pool_gameobject` SET `description` = 'Tin Vein' WHERE `guid` = 56024;
UPDATE `pool_template` SET `description` = 'Tin Veins in Dustwallow Marsh' WHERE `entry` = 43521;

-- Remove Undergroud Objects Not Present In Sniffs
DELETE FROM `gameobject` WHERE `guid` IN (5637, 5649, 29277);
DELETE FROM `pool_gameobject` WHERE `guid` IN (5637, 5649, 29277);

-- COPPER ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Correct position of Copper Vein in Durotar (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=1056.59, `position_y`=-4808.49, `position_z`=21.7389, `orientation`=4.24115, `rotation0`=0, `rotation1`=0, `rotation2`=-0.85264, `rotation3`=0.522499 WHERE `guid`=12485;

-- Correct position of Copper Vein in Durotar (position is off by 0.000976563 yards).
UPDATE `gameobject` SET `position_x`=518.501, `position_y`=-4760.18, `position_z`=29.9781, `orientation`=0.785397, `rotation0`=0, `rotation1`=0, `rotation2`=0.382683, `rotation3`=0.92388 WHERE `guid`=12487;

-- Correct position of Copper Vein in The Barrens (position is off by 0.00100708 yards).
UPDATE `gameobject` SET `position_x`=-418.613, `position_y`=-2186.97, `position_z`=143.571, `orientation`=5.70723, `rotation0`=0, `rotation1`=0, `rotation2`=-0.284015, `rotation3`=0.95882 WHERE `guid`=15162;

-- Correct position of Copper Vein in Mulgore (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-2299.02, `position_y`=385.609, `position_z`=58.3093, `orientation`=2.67035, `rotation0`=0, `rotation1`=0, `rotation2`=0.972369, `rotation3`=0.233448 WHERE `guid`=20716;

-- Correct position of Copper Vein in Silverpine Forest (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=1035.12, `position_y`=1633.56, `position_z`=28.2433, `orientation`=0.261798, `rotation0`=0, `rotation1`=0, `rotation2`=0.130526, `rotation3`=0.991445 WHERE `guid`=5102;

-- Correct position of Copper Vein in Elwynn Forest (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-9897.81, `position_y`=-1150, `position_z`=24.353, `orientation`=4.34587, `rotation0`=0, `rotation1`=0, `rotation2`=-0.824126, `rotation3`=0.566406 WHERE `guid`=27068;

-- Correct position of Copper Vein in Redridge Mountains (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-9412.47, `position_y`=-2484.24, `position_z`=30.4685, `orientation`=3.7001, `rotation0`=0, `rotation1`=0, `rotation2`=-0.961261, `rotation3`=0.27564 WHERE `guid`=5454;

-- Correct position of Copper Vein in Durotar (position is off by 0.00976563 yards).
UPDATE `gameobject` SET `position_x`=1213.05, `position_y`=-4591.97, `position_z`=23.571, `orientation`=2.05949, `rotation0`=0, `rotation1`=0, `rotation2`=0.857167, `rotation3`=0.515038 WHERE `guid`=4752;

-- Correct position of Copper Vein in Desolace (position is off by 0.00100708 yards).
UPDATE `gameobject` SET `position_x`=-322.087, `position_y`=1097.67, `position_z`=94.8923, `orientation`=0.558504, `rotation0`=0, `rotation1`=0, `rotation2`=0.275637, `rotation3`=0.961262 WHERE `guid`=34182;

-- Correct position of Copper Vein in Mulgore (position is off by 0.00100708 yards).
UPDATE `gameobject` SET `position_x`=-1118.57, `position_y`=-484.428, `position_z`=-39.7389, `orientation`=5.86431, `rotation0`=0, `rotation1`=0, `rotation2`=-0.207911, `rotation3`=0.978148 WHERE `guid`=4836;

-- Correct position of Copper Vein in Silverpine Forest (position is off by 4.85622 yards).
UPDATE `gameobject` SET `position_x`=378.47, `position_y`=1053.96, `position_z`=106.416, `orientation`=2.61799, `rotation0`=0, `rotation1`=0, `rotation2`=0.965925, `rotation3`=0.258821 WHERE `guid`=4979;

-- Correct position of Copper Vein in Silverpine Forest (position is off by 0.629768 yards).
UPDATE `gameobject` SET `position_x`=1235.28, `position_y`=2052.67, `position_z`=10.8418, `orientation`=0.541051, `rotation0`=0, `rotation1`=0, `rotation2`=0.267238, `rotation3`=0.963631 WHERE `guid`=5155;

-- Correct position of Copper Vein in Silverpine Forest (position is off by 0.772368 yards).
UPDATE `gameobject` SET `position_x`=378.733, `position_y`=1341.94, `position_z`=92.9362, `orientation`=2.77507, `rotation0`=0, `rotation1`=0, `rotation2`=0.983254, `rotation3`=0.182238 WHERE `guid`=5448;

-- Correct position of Copper Vein in Silverpine Forest (position is off by 0.0120087 yards).
UPDATE `gameobject` SET `position_x`=-313.933, `position_y`=936.846, `position_z`=131.92, `orientation`=2.14675, `rotation0`=0, `rotation1`=0, `rotation2`=0.878817, `rotation3`=0.47716 WHERE `guid`=35444;

-- Correct position of Copper Vein in The Barrens (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-501.907, `position_y`=-1354.5, `position_z`=92.7284, `orientation`=2.00713, `rotation0`=0, `rotation1`=0, `rotation2`=0.843391, `rotation3`=0.5373 WHERE `guid`=15782;

-- Correct position of Copper Vein in Thunder Bluff (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-959.687, `position_y`=-189.309, `position_z`=25.0983, `orientation`=0.453785, `rotation0`=0, `rotation1`=0, `rotation2`=0.224951, `rotation3`=0.97437 WHERE `guid`=4851;

-- Correct position of Copper Vein in Loch Modan (position is off by 0.00981741 yards).
UPDATE `gameobject` SET `position_x`=-5692.68, `position_y`=-3123.95, `position_z`=316.189, `orientation`=4.18879, `rotation0`=0, `rotation1`=0, `rotation2`=-0.866025, `rotation3`=0.500001 WHERE `guid`=29972;

-- Correct position of Copper Vein in Loch Modan (position is off by 0.00976563 yards).
UPDATE `gameobject` SET `position_x`=-5517.82, `position_y`=-2731.01, `position_z`=366.158, `orientation`=0.750491, `rotation0`=0, `rotation1`=0, `rotation2`=0.366501, `rotation3`=0.930418 WHERE `guid`=30104;

-- Correct position of Copper Vein in Dun Morogh (position is off by 0.00976563 yards).
UPDATE `gameobject` SET `position_x`=-5633.05, `position_y`=-1751.15, `position_z`=358.066, `orientation`=5.61996, `rotation0`=0, `rotation1`=0, `rotation2`=-0.325567, `rotation3`=0.945519 WHERE `guid`=10852;

-- Correct position of Copper Vein in Dun Morogh (position is off by 0.00100708 yards).
UPDATE `gameobject` SET `position_x`=-5640.9, `position_y`=-1706.94, `position_z`=362.449, `orientation`=2.58308, `rotation0`=0, `rotation1`=0, `rotation2`=0.961261, `rotation3`=0.27564 WHERE `guid`=10853;

-- Correct position of Copper Vein in Dun Morogh (position is off by 0.00144597 yards).
UPDATE `gameobject` SET `position_x`=-5051.87, `position_y`=-585.697, `position_z`=426.163, `orientation`=0, `rotation0`=0, `rotation1`=0, `rotation2`=0, `rotation3`=1 WHERE `guid`=7120;

-- Correct position of Copper Vein in Dun Morogh (position is off by 0.00976563 yards).
UPDATE `gameobject` SET `position_x`=-5770.99, `position_y`=-653.592, `position_z`=403.583, `orientation`=6.02139, `rotation0`=0, `rotation1`=0, `rotation2`=-0.130526, `rotation3`=0.991445 WHERE `guid`=10675;

-- Correct position of Copper Vein in Duskwood (position is off by 0.000102997 yards).
UPDATE `gameobject` SET `position_x`=-10557.2, `position_y`=-760.492, `position_z`=60.5833, `orientation`=5.23599, `rotation0`=0, `rotation1`=0, `rotation2`=-0.5, `rotation3`=0.866025 WHERE `guid`=33462;

-- Correct position of Copper Vein in Mulgore (position is off by 0.0100103 yards).
UPDATE `gameobject` SET `position_x`=-2762.57, `position_y`=-633.859, `position_z`=21.28, `orientation`=0.541051, `rotation0`=0, `rotation1`=0, `rotation2`=0.267238, `rotation3`=0.963631 WHERE `guid`=5219;

-- Correct position of Copper Vein in Duskwood (position is off by 0.000100136 yards).
UPDATE `gameobject` SET `position_x`=-10519.2, `position_y`=677.127, `position_z`=15.6122, `orientation`=2.58308, `rotation0`=0, `rotation1`=0, `rotation2`=0.961261, `rotation3`=0.27564 WHERE `guid`=5412;

-- Correct position of Copper Vein in Dun Morogh (position is off by 0.0102539 yards).
UPDATE `gameobject` SET `position_x`=-5600.43, `position_y`=-744.175, `position_z`=434.065, `orientation`=1.79769, `rotation0`=0, `rotation1`=0, `rotation2`=0.782608, `rotation3`=0.622515 WHERE `guid`=10695;

-- Correct position of Copper Vein in Dun Morogh (position is off by 0.00100708 yards).
UPDATE `gameobject` SET `position_x`=-5334.67, `position_y`=-659.969, `position_z`=394.837, `orientation`=5.41052, `rotation0`=0, `rotation1`=0, `rotation2`=-0.422618, `rotation3`=0.906308 WHERE `guid`=10682;

-- Correct position of Copper Vein in The Barrens (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-4146.65, `position_y`=-2297.34, `position_z`=105.493, `orientation`=0.296705, `rotation0`=0, `rotation1`=0, `rotation2`=0.147809, `rotation3`=0.989016 WHERE `guid`=5099;

-- Correct position of Copper Vein in Dun Morogh (position is off by 0.00100708 yards).
UPDATE `gameobject` SET `position_x`=-5567.07, `position_y`=-1799.28, `position_z`=360.231, `orientation`=5.39307, `rotation0`=0, `rotation1`=0, `rotation2`=-0.430511, `rotation3`=0.902586 WHERE `guid`=29621;

-- Correct position of Copper Vein in Ashenvale (position is off by 0.000991821 yards).
UPDATE `gameobject` SET `position_x`=2546.06, `position_y`=-1335.72, `position_z`=161.545, `orientation`=1.55334, `rotation0`=0, `rotation1`=0, `rotation2`=0.700909, `rotation3`=0.713251 WHERE `guid`=4891;

-- Correct position of Copper Vein in Hillsbrad Foothills (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-502.591, `position_y`=-828.237, `position_z`=53.355, `orientation`=3.03684, `rotation0`=0, `rotation1`=0, `rotation2`=0.998629, `rotation3`=0.0523532 WHERE `guid`=30030;

-- Correct position of Copper Vein in Wetlands (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-4080.01, `position_y`=-2911.18, `position_z`=4.63452, `orientation`=0.977383, `rotation0`=0, `rotation1`=0, `rotation2`=0.469471, `rotation3`=0.882948 WHERE `guid`=5250;

-- Correct position of Copper Vein in Loch Modan (position is off by 0.00976563 yards).
UPDATE `gameobject` SET `position_x`=-5179.53, `position_y`=-3290.78, `position_z`=276.421, `orientation`=3.38594, `rotation0`=0, `rotation1`=0, `rotation2`=-0.992546, `rotation3`=0.12187 WHERE `guid`=12813;

-- Correct position of Copper Vein in Loch Modan (position is off by 0.00976563 yards).
UPDATE `gameobject` SET `position_x`=-5091.8, `position_y`=-3324.24, `position_z`=280.257, `orientation`=3.78737, `rotation0`=0, `rotation1`=0, `rotation2`=-0.948323, `rotation3`=0.317306 WHERE `guid`=4953;

-- Correct position of Copper Vein in Durotar (position is off by 0.00982059 yards).
UPDATE `gameobject` SET `position_x`=733.337, `position_y`=-4104.11, `position_z`=-9.99905, `orientation`=1.27409, `rotation0`=0, `rotation1`=0, `rotation2`=0.594822, `rotation3`=0.803857 WHERE `guid`=12377;

-- Correct position of Copper Vein in Redridge Mountains (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-9697.58, `position_y`=-1754.86, `position_z`=62.2563, `orientation`=3.61284, `rotation0`=0, `rotation1`=0, `rotation2`=-0.972369, `rotation3`=0.233448 WHERE `guid`=31115;

-- Correct position of Copper Vein in Silverpine Forest (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=511.705, `position_y`=1353.71, `position_z`=88.8817, `orientation`=1.8675, `rotation0`=0, `rotation1`=0, `rotation2`=0.803857, `rotation3`=0.594823 WHERE `guid`=5349;

-- Correct position of Copper Vein in Ashenvale (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=2585.55, `position_y`=-1074.56, `position_z`=131.414, `orientation`=2.35619, `rotation0`=0, `rotation1`=0, `rotation2`=0.92388, `rotation3`=0.382683 WHERE `guid`=33545;

-- Correct position of Copper Vein in Darkshore (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=7358.84, `position_y`=117.991, `position_z`=12.6752, `orientation`=3.35105, `rotation0`=0, `rotation1`=0, `rotation2`=-0.994521, `rotation3`=0.104536 WHERE `guid`=48666;

-- Correct position of Copper Vein in Darkshore (position is off by 0.0102539 yards).
UPDATE `gameobject` SET `position_x`=4787.53, `position_y`=766.542, `position_z`=8.5393, `orientation`=1.20428, `rotation0`=0, `rotation1`=0, `rotation2`=0.566406, `rotation3`=0.824126 WHERE `guid`=31357;

-- Correct position of Copper Vein in The Barrens (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-3307.13, `position_y`=-2266.09, `position_z`=93.2678, `orientation`=1.83259, `rotation0`=0, `rotation1`=0, `rotation2`=0.793353, `rotation3`=0.608762 WHERE `guid`=15178;

-- Correct position of Copper Vein in Durotar (position is off by 1.27307 yards).
UPDATE `gameobject` SET `position_x`=972.06, `position_y`=-4718.87, `position_z`=29.4653, `orientation`=0, `rotation0`=0, `rotation1`=0, `rotation2`=0, `rotation3`=1 WHERE `guid`=5401;

-- Correct position of Copper Vein in Wetlands (position is off by 0.0102539 yards).
UPDATE `gameobject` SET `position_x`=-4153.11, `position_y`=-3038.73, `position_z`=2.50557, `orientation`=3.90954, `rotation0`=0, `rotation1`=0, `rotation2`=-0.927183, `rotation3`=0.374608 WHERE `guid`=14875;

-- Correct position of Copper Vein in The Barrens (position is off by 0.000101089 yards).
UPDATE `gameobject` SET `position_x`=-1273.68, `position_y`=-3803, `position_z`=31.564, `orientation`=5.70723, `rotation0`=0, `rotation1`=0, `rotation2`=-0.284015, `rotation3`=0.95882 WHERE `guid`=15136;

-- Correct position of Copper Vein in The Barrens (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-2575.43, `position_y`=-2387.76, `position_z`=104.146, `orientation`=5.8294, `rotation0`=0, `rotation1`=0, `rotation2`=-0.224951, `rotation3`=0.97437 WHERE `guid`=15682;

-- Correct position of Copper Vein in Durotar (position is off by 1.02897 yards).
UPDATE `gameobject` SET `position_x`=-1000.02, `position_y`=-4499.93, `position_z`=28.362, `orientation`=0.698131, `rotation0`=0, `rotation1`=0, `rotation2`=0.34202, `rotation3`=0.939693 WHERE `guid`=4991;

-- Correct position of Copper Vein in Stonetalon Mountains (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=67.2039, `position_y`=-513.643, `position_z`=39.1254, `orientation`=5.49779, `rotation0`=0, `rotation1`=0, `rotation2`=-0.382683, `rotation3`=0.92388 WHERE `guid`=47697;

-- Correct position of Copper Vein in Hillsbrad Foothills (position is off by 0.000100136 yards).
UPDATE `gameobject` SET `position_x`=-1048.94, `position_y`=-13.9948, `position_z`=17.3759, `orientation`=0.331611, `rotation0`=0, `rotation1`=0, `rotation2`=0.165047, `rotation3`=0.986286 WHERE `guid`=25046;

-- Correct position of Copper Vein in Loch Modan (position is off by 0.0100573 yards).
UPDATE `gameobject` SET `position_x`=-5407.56, `position_y`=-3421.51, `position_z`=285.106, `orientation`=1.88495, `rotation0`=0, `rotation1`=0, `rotation2`=0.809016, `rotation3`=0.587786 WHERE `guid`=12890;

-- Correct position of Copper Vein in Thousand Needles (position is off by 0.0102539 yards).
UPDATE `gameobject` SET `position_x`=-5720.24, `position_y`=-3154.99, `position_z`=-28.4684, `orientation`=5.68977, `rotation0`=0, `rotation1`=0, `rotation2`=-0.292372, `rotation3`=0.956305 WHERE `guid`=17095;

-- Correct position of Copper Vein in The Barrens (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=1385.21, `position_y`=-3485.35, `position_z`=95.0849, `orientation`=1.27409, `rotation0`=0, `rotation1`=0, `rotation2`=0.594822, `rotation3`=0.803857 WHERE `guid`=15452;

-- Correct position of Copper Vein in The Barrens (position is off by 0.00100708 yards).
UPDATE `gameobject` SET `position_x`=388.236, `position_y`=-2245.49, `position_z`=196.681, `orientation`=0.087266, `rotation0`=0, `rotation1`=0, `rotation2`=0.0436192, `rotation3`=0.999048 WHERE `guid`=15170;

-- Correct position of Copper Vein in Thousand Needles (position is off by 0.000102997 yards).
UPDATE `gameobject` SET `position_x`=-5208.44, `position_y`=-1578.95, `position_z`=-38.6579, `orientation`=5.51524, `rotation0`=0, `rotation1`=0, `rotation2`=-0.374606, `rotation3`=0.927184 WHERE `guid`=4774;

-- Correct position of Copper Vein in Loch Modan (position is off by 0.00976563 yards).
UPDATE `gameobject` SET `position_x`=-4728.93, `position_y`=-3142.43, `position_z`=302.941, `orientation`=3.10665, `rotation0`=0, `rotation1`=0, `rotation2`=0.999847, `rotation3`=0.0174693 WHERE `guid`=30022;

-- Correct position of Copper Vein in Tirisfal Glades (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=1781.53, `position_y`=-748.291, `position_z`=63.1568, `orientation`=2.00713, `rotation0`=0, `rotation1`=0, `rotation2`=0.843391, `rotation3`=0.5373 WHERE `guid`=45090;

-- Correct position of Copper Vein in Dun Morogh (position is off by 0.00100708 yards).
UPDATE `gameobject` SET `position_x`=-6099.44, `position_y`=-341.376, `position_z`=439.958, `orientation`=0.261798, `rotation0`=0, `rotation1`=0, `rotation2`=0.130526, `rotation3`=0.991445 WHERE `guid`=29616;

-- Correct position of Copper Vein in Westfall (position is off by 4.52486 yards).
UPDATE `gameobject` SET `position_x`=-10467.7, `position_y`=1346.31, `position_z`=45.3696, `orientation`=2.53072, `rotation0`=0, `rotation1`=0, `rotation2`=0.953716, `rotation3`=0.300708 WHERE `guid`=40003;

-- Correct position of Copper Vein in Ashenvale (position is off by 2.61886 yards).
UPDATE `gameobject` SET `position_x`=2623.96, `position_y`=-967.716, `position_z`=132.084, `orientation`=2.72271, `rotation0`=0, `rotation1`=0, `rotation2`=0.978148, `rotation3`=0.207912 WHERE `guid`=4888;

-- Correct position of Copper Vein in Durotar (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=503.216, `position_y`=-3923.43, `position_z`=23.0152, `orientation`=3.47321, `rotation0`=0, `rotation1`=0, `rotation2`=-0.986285, `rotation3`=0.16505 WHERE `guid`=32523;

-- Correct position of Copper Vein in Silverpine Forest (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=1324.63, `position_y`=1969.28, `position_z`=14.6851, `orientation`=0.331611, `rotation0`=0, `rotation1`=0, `rotation2`=0.165047, `rotation3`=0.986286 WHERE `guid`=35540;

-- Correct position of Copper Vein in Tirisfal Glades (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=2510.69, `position_y`=-376.824, `position_z`=85.8907, `orientation`=5.70723, `rotation0`=0, `rotation1`=0, `rotation2`=-0.284015, `rotation3`=0.95882 WHERE `guid`=5372;

-- Correct position of Copper Vein in Tirisfal Glades (position is off by 0.0010376 yards).
UPDATE `gameobject` SET `position_x`=2716.62, `position_y`=-540.283, `position_z`=106.932, `orientation`=0.139624, `rotation0`=0, `rotation1`=0, `rotation2`=0.0697556, `rotation3`=0.997564 WHERE `guid`=5154;

-- Correct position of Copper Vein in Elwynn Forest (position is off by 0.000991821 yards).
UPDATE `gameobject` SET `position_x`=-9758.44, `position_y`=140.715, `position_z`=21.5286, `orientation`=2.63544, `rotation0`=0, `rotation1`=0, `rotation2`=0.968147, `rotation3`=0.250381 WHERE `guid`=32463;

-- Correct position of Copper Vein in Elwynn Forest (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-9736.79, `position_y`=87.7491, `position_z`=12.8907, `orientation`=3.64774, `rotation0`=0, `rotation1`=0, `rotation2`=-0.968147, `rotation3`=0.250381 WHERE `guid`=32461;

-- Correct position of Copper Vein in Elwynn Forest (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-9058.96, `position_y`=-621.586, `position_z`=54.7671, `orientation`=4.15388, `rotation0`=0, `rotation1`=0, `rotation2`=-0.874619, `rotation3`=0.48481 WHERE `guid`=30945;

-- Correct position of Copper Vein in Elwynn Forest (position is off by 0.0098877 yards).
UPDATE `gameobject` SET `position_x`=-9685.88, `position_y`=-1195.68, `position_z`=50.4208, `orientation`=1.02974, `rotation0`=0, `rotation1`=0, `rotation2`=0.492423, `rotation3`=0.870356 WHERE `guid`=31109;

-- Correct position of Copper Vein in Loch Modan (position is off by 0.00100708 yards).
UPDATE `gameobject` SET `position_x`=-5783.95, `position_y`=-3212.13, `position_z`=309.844, `orientation`=0.645772, `rotation0`=0, `rotation1`=0, `rotation2`=0.317305, `rotation3`=0.948324 WHERE `guid`=13199;

-- Correct position of Copper Vein in Tirisfal Glades (position is off by 0.000999451 yards).
UPDATE `gameobject` SET `position_x`=2756.54, `position_y`=1079.45, `position_z`=110.498, `orientation`=3.52557, `rotation0`=0, `rotation1`=0, `rotation2`=-0.981627, `rotation3`=0.190812 WHERE `guid`=5486;

-- Correct position of Copper Vein in Hillsbrad Foothills (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-664.995, `position_y`=489.126, `position_z`=88.2481, `orientation`=6.14356, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0697556, `rotation3`=0.997564 WHERE `guid`=5380;

-- Correct position of Copper Vein in Tirisfal Glades (position is off by 0.0010376 yards).
UPDATE `gameobject` SET `position_x`=2781.51, `position_y`=-833.163, `position_z`=154.953, `orientation`=2.23402, `rotation0`=0, `rotation1`=0, `rotation2`=0.898793, `rotation3`=0.438373 WHERE `guid`=4787;

-- Correct position of Copper Vein in Stonetalon Mountains (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=1357.7, `position_y`=1544.49, `position_z`=156.776, `orientation`=4.15388, `rotation0`=0, `rotation1`=0, `rotation2`=-0.874619, `rotation3`=0.48481 WHERE `guid`=47666;

-- Correct position of Copper Vein in Stonetalon Mountains (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=1493.04, `position_y`=-277.715, `position_z`=26.7762, `orientation`=0.453785, `rotation0`=0, `rotation1`=0, `rotation2`=0.224951, `rotation3`=0.97437 WHERE `guid`=4772;

-- Correct position of Copper Vein in The Barrens (position is off by 0.000999451 yards).
UPDATE `gameobject` SET `position_x`=-2726.32, `position_y`=-2024.73, `position_z`=113.358, `orientation`=2.87979, `rotation0`=0, `rotation1`=0, `rotation2`=0.991445, `rotation3`=0.130528 WHERE `guid`=5256;

-- Correct position of Copper Vein in The Barrens (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-1447.37, `position_y`=-2373.72, `position_z`=112.527, `orientation`=3.42085, `rotation0`=0, `rotation1`=0, `rotation2`=-0.990268, `rotation3`=0.139175 WHERE `guid`=5331;

-- Correct position of Copper Vein in Duskwood (position is off by 0.000102997 yards).
UPDATE `gameobject` SET `position_x`=-11062.5, `position_y`=-729.195, `position_z`=59.6658, `orientation`=4.62512, `rotation0`=0, `rotation1`=0, `rotation2`=-0.737277, `rotation3`=0.675591 WHERE `guid`=5211;

-- Correct position of Copper Vein in Mulgore (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-1037.6, `position_y`=-1101.76, `position_z`=45.8684, `orientation`=4.24115, `rotation0`=0, `rotation1`=0, `rotation2`=-0.85264, `rotation3`=0.522499 WHERE `guid`=20749;

-- Correct position of Copper Vein in Durotar (position is off by 1.26134 yards).
UPDATE `gameobject` SET `position_x`=845.625, `position_y`=-4164.17, `position_z`=-8.82255, `orientation`=5.28835, `rotation0`=0, `rotation1`=0, `rotation2`=-0.477159, `rotation3`=0.878817 WHERE `guid`=5213;

-- Correct position of Copper Vein in Durotar (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=790.85, `position_y`=-3870.64, `position_z`=21.5309, `orientation`=3.94445, `rotation0`=0, `rotation1`=0, `rotation2`=-0.920505, `rotation3`=0.390732 WHERE `guid`=12544;

-- Correct position of Copper Vein in Loch Modan (position is off by 0.73812 yards).
UPDATE `gameobject` SET `position_x`=-5721.44, `position_y`=-3713.94, `position_z`=312.301, `orientation`=3.75246, `rotation0`=0, `rotation1`=0, `rotation2`=-0.953716, `rotation3`=0.300708 WHERE `guid`=4712;

-- Correct position of Copper Vein in Darkshore (position is off by 0.822618 yards).
UPDATE `gameobject` SET `position_x`=7277.56, `position_y`=-842.787, `position_z`=37.8692, `orientation`=1.16937, `rotation0`=0, `rotation1`=0, `rotation2`=0.551936, `rotation3`=0.833886 WHERE `guid`=5142;

-- Correct position of Copper Vein in Darkshore (position is off by 0.364549 yards).
UPDATE `gameobject` SET `position_x`=4452.31, `position_y`=413.871, `position_z`=67.4349, `orientation`=5.3058, `rotation0`=0, `rotation1`=0, `rotation2`=-0.469471, `rotation3`=0.882948 WHERE `guid`=5445;

-- Correct position of Copper Vein in Darkshore (position is off by 0.906329 yards).
UPDATE `gameobject` SET `position_x`=4895.36, `position_y`=44.2655, `position_z`=60.8504, `orientation`=1.64061, `rotation0`=0, `rotation1`=0, `rotation2`=0.731353, `rotation3`=0.681999 WHERE `guid`=4992;

-- Correct position of Copper Vein in Darkshore (position is off by 0.0010376 yards).
UPDATE `gameobject` SET `position_x`=6866.71, `position_y`=-659.673, `position_z`=83.6733, `orientation`=5.3058, `rotation0`=0, `rotation1`=0, `rotation2`=-0.469471, `rotation3`=0.882948 WHERE `guid`=5216;

-- Correct position of Copper Vein in Darkshore (position is off by 0.729876 yards).
UPDATE `gameobject` SET `position_x`=6836.17, `position_y`=-291.012, `position_z`=40.5437, `orientation`=1.91986, `rotation0`=0, `rotation1`=0, `rotation2`=0.819152, `rotation3`=0.573577 WHERE `guid`=5355;

-- Correct position of Copper Vein in Darkshore (position is off by 0.750054 yards).
UPDATE `gameobject` SET `position_x`=6898.08, `position_y`=-588.399, `position_z`=30.6687, `orientation`=3.56047, `rotation0`=0, `rotation1`=0, `rotation2`=-0.978148, `rotation3`=0.207912 WHERE `guid`=5055;

-- Correct position of Copper Vein in Darkshore (position is off by 0.269936 yards).
UPDATE `gameobject` SET `position_x`=7325.29, `position_y`=-523.23, `position_z`=8.48972, `orientation`=1.55334, `rotation0`=0, `rotation1`=0, `rotation2`=0.700909, `rotation3`=0.713251 WHERE `guid`=5377;

-- Correct position of Copper Vein in Darkshore (position is off by 0.000999451 yards).
UPDATE `gameobject` SET `position_x`=6354.29, `position_y`=119.985, `position_z`=22.1034, `orientation`=1.58825, `rotation0`=0, `rotation1`=0, `rotation2`=0.71325, `rotation3`=0.70091 WHERE `guid`=4824;

-- Correct position of Copper Vein in Durotar (position is off by 0.00100708 yards).
UPDATE `gameobject` SET `position_x`=-341.064, `position_y`=-5100.17, `position_z`=28.9194, `orientation`=1.88495, `rotation0`=0, `rotation1`=0, `rotation2`=0.809016, `rotation3`=0.587786 WHERE `guid`=12443;

-- Correct position of Copper Vein in Durotar (position is off by 0.000101089 yards).
UPDATE `gameobject` SET `position_x`=-834.234, `position_y`=-4838.99, `position_z`=21.7599, `orientation`=3.73501, `rotation0`=0, `rotation1`=0, `rotation2`=-0.956305, `rotation3`=0.292372 WHERE `guid`=4791;

-- Correct position of Copper Vein in Durotar (position is off by 0.00976563 yards).
UPDATE `gameobject` SET `position_x`=-996.959, `position_y`=-4816.74, `position_z`=13.0821, `orientation`=0.366518, `rotation0`=0, `rotation1`=0, `rotation2`=0.182235, `rotation3`=0.983255 WHERE `guid`=4815;

-- Correct position of Copper Vein in Durotar (position is off by 0.000991821 yards).
UPDATE `gameobject` SET `position_x`=134.771, `position_y`=-4134.01, `position_z`=54.8472, `orientation`=2.23402, `rotation0`=0, `rotation1`=0, `rotation2`=0.898793, `rotation3`=0.438373 WHERE `guid`=4852;

-- Correct position of Copper Vein in Silverpine Forest (position is off by 0.172983 yards).
UPDATE `gameobject` SET `position_x`=-581.14, `position_y`=1097.34, `position_z`=90.129, `orientation`=1.23918, `rotation0`=0, `rotation1`=0, `rotation2`=0.580703, `rotation3`=0.814116 WHERE `guid`=4846;

-- Correct position of Copper Vein in Thousand Needles (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-4620.59, `position_y`=-1715.87, `position_z`=-22.4819, `orientation`=5.75959, `rotation0`=0, `rotation1`=0, `rotation2`=-0.258819, `rotation3`=0.965926 WHERE `guid`=4853;

-- Correct position of Copper Vein in Westfall (position is off by 1.41421 yards).
UPDATE `gameobject` SET `position_x`=-11323, `position_y`=1600.41, `position_z`=37.1515, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=31124;

-- Correct position of Copper Vein in The Deadmines (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-11150.4, `position_y`=1547.25, `position_z`=22.634, `orientation`=0.942477, `rotation0`=0, `rotation1`=0, `rotation2`=0.45399, `rotation3`=0.891007 WHERE `guid`=34832;

-- Correct position of Copper Vein in Westfall (position is off by 0.552836 yards).
UPDATE `gameobject` SET `position_x`=-9602.69, `position_y`=969.846, `position_z`=39.3992, `orientation`=3.61284, `rotation0`=0, `rotation1`=0, `rotation2`=-0.972369, `rotation3`=0.233448 WHERE `guid`=4930;

-- Correct position of Copper Vein in Redridge Mountains (position is off by 0.827771 yards).
UPDATE `gameobject` SET `position_x`=-9141.37, `position_y`=-3079.47, `position_z`=122.507, `orientation`=3.05433, `rotation0`=0, `rotation1`=0, `rotation2`=0.999048, `rotation3`=0.0436193 WHERE `guid`=5159;

-- Correct position of Copper Vein in Mulgore (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-1301.52, `position_y`=-1039.44, `position_z`=61.9713, `orientation`=3.4383, `rotation0`=0, `rotation1`=0, `rotation2`=-0.989016, `rotation3`=0.147811 WHERE `guid`=20719;

-- Correct position of Copper Vein in Mulgore (position is off by 0.0010376 yards).
UPDATE `gameobject` SET `position_x`=-441.273, `position_y`=-634.283, `position_z`=68.3678, `orientation`=1.55334, `rotation0`=0, `rotation1`=0, `rotation2`=0.700909, `rotation3`=0.713251 WHERE `guid`=20674;

-- Correct position of Copper Vein in The Barrens (position is off by 0.00100708 yards).
UPDATE `gameobject` SET `position_x`=-338.933, `position_y`=-2986.05, `position_z`=100.969, `orientation`=2.25147, `rotation0`=0, `rotation1`=0, `rotation2`=0.902585, `rotation3`=0.430512 WHERE `guid`=33550;

-- Correct position of Copper Vein in The Barrens (position is off by 0.000991821 yards).
UPDATE `gameobject` SET `position_x`=-1387.82, `position_y`=-2392.19, `position_z`=130.659, `orientation`=2.3911, `rotation0`=0, `rotation1`=0, `rotation2`=0.930417, `rotation3`=0.366502 WHERE `guid`=5330;

-- Correct position of Copper Vein in Mulgore (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-2764.17, `position_y`=-1390.74, `position_z`=63.256, `orientation`=5.79449, `rotation0`=0, `rotation1`=0, `rotation2`=-0.241921, `rotation3`=0.970296 WHERE `guid`=5263;

-- Correct position of Copper Vein in Darkshore (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=7925.2, `position_y`=-1176.95, `position_z`=57.2328, `orientation`=2.84488, `rotation0`=0, `rotation1`=0, `rotation2`=0.989016, `rotation3`=0.147811 WHERE `guid`=48762;

-- Correct position of Copper Vein in Darkshore (position is off by 0.000101089 yards).
UPDATE `gameobject` SET `position_x`=6798.9, `position_y`=231.377, `position_z`=25.7077, `orientation`=5.60251, `rotation0`=0, `rotation1`=0, `rotation2`=-0.333807, `rotation3`=0.942641 WHERE `guid`=4938;

-- Correct position of Copper Vein in Duskwood (position is off by 0.00099696 yards).
UPDATE `gameobject` SET `position_x`=-10966.5, `position_y`=-183.177, `position_z`=17.1386, `orientation`=2.56563, `rotation0`=0, `rotation1`=0, `rotation2`=0.958819, `rotation3`=0.284016 WHERE `guid`=17149;

-- Correct position of Copper Vein in Duskwood (position is off by 0.100586 yards).
UPDATE `gameobject` SET `position_x`=-10856.6, `position_y`=-1283.99, `position_z`=62.4551, `orientation`=0.296705, `rotation0`=0, `rotation1`=0, `rotation2`=0.147809, `rotation3`=0.989016 WHERE `guid`=42664;

-- Correct position of Copper Vein in Westfall (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-9830.03, `position_y`=1401.71, `position_z`=48.2202, `orientation`=3.52557, `rotation0`=0, `rotation1`=0, `rotation2`=-0.981627, `rotation3`=0.190812 WHERE `guid`=30588;

-- Correct position of Copper Vein in Westfall (position is off by 0.0100103 yards).
UPDATE `gameobject` SET `position_x`=-10446.2, `position_y`=1932.17, `position_z`=13.1238, `orientation`=3.05433, `rotation0`=0, `rotation1`=0, `rotation2`=0.999048, `rotation3`=0.0436193 WHERE `guid`=5237;

-- Correct position of Copper Vein in Westfall (position is off by 0.0996094 yards).
UPDATE `gameobject` SET `position_x`=-11298.1, `position_y`=1636.16, `position_z`=61.5966, `orientation`=0.209439, `rotation0`=0, `rotation1`=0, `rotation2`=0.104528, `rotation3`=0.994522 WHERE `guid`=31052;

-- Correct position of Copper Vein in The Deadmines (position is off by 0.0996094 yards).
UPDATE `gameobject` SET `position_x`=-11201.4, `position_y`=1520.96, `position_z`=21.3151, `orientation`=5.14872, `rotation0`=0, `rotation1`=0, `rotation2`=-0.537299, `rotation3`=0.843392 WHERE `guid`=31951;

-- Correct position of Copper Vein in Westfall (position is off by 0.0996094 yards).
UPDATE `gameobject` SET `position_x`=-10237.9, `position_y`=1316.13, `position_z`=43.1496, `orientation`=4.81711, `rotation0`=0, `rotation1`=0, `rotation2`=-0.66913, `rotation3`=0.743145 WHERE `guid`=30631;

-- Missing Copper Vein spawns in Durotar.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(12888, 1731, 1, 850.867, -4766.13, 38.2993, 5.23599, 0, 0, -0.5, 0.866025, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12493 at 57.260567 yards.
(12900, 1731, 1, 873.399, -4743.74, 30.9023, 0.942477, 0, 0, 0.45399, 0.891007, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12543 at 60.607513 yards.
(12901, 1731, 1, 958.338, -4793.02, 18.7893, 0.418879, 0, 0, 0.207911, 0.978148, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12543 at 50.319996 yards.
(13104, 1731, 1, 966.096, -4906.56, 28.7647, 4.27606, 0, 0, -0.843391, 0.5373, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12482 at 92.573685 yards.
(13105, 1731, 1, 447.97, -4500.48, 50.7318, 3.47321, 0, 0, -0.986285, 0.16505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12489 at 87.916260 yards.
(9786, 1731, 1, -150.154, -5160.85, 25.5989, 0.279252, 0, 0, 0.139173, 0.990268, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5080 at 6.756102 yards.
(9787, 1731, 1, 149.417, -5075.54, 16.1375, 0.0349062, 0, 0, 0.0174522, 0.999848, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5225 at 147.568588 yards.
(9788, 1731, 1, -784.408, -5563.74, 16.6928, 0.680677, 0, 0, 0.333806, 0.942642, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5061 at 481.343689 yards.
(9789, 1731, 1, -651.845, -5585.51, 12.682, 0.942477, 0, 0, 0.45399, 0.891007, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5472 at 485.683533 yards.
(9790, 1731, 1, -716.199, -5685.54, 20.8872, 4.04917, 0, 0, -0.898793, 0.438373, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5472 at 590.222595 yards.
(9791, 1731, 1, -1302.21, -5541.29, 9.82803, 1.78023, 0, 0, 0.777145, 0.629321, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5061 at 561.602478 yards.
(4862, 1731, 1, -775.502, -4786.63, 29.6299, 4.69494, 0, 0, -0.71325, 0.70091, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4791 at 79.075844 yards.
(9792, 1731, 1, -837.403, -4718.7, 30.9681, 4.67748, 0, 0, -0.719339, 0.694659, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4764 at 42.974297 yards.
(9794, 1731, 1, -207.867, -5165.25, 27.5083, 6.14356, 0, 0, -0.0697556, 0.997564, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5080 at 59.283737 yards.
(9795, 1731, 1, 847.784, -4206.12, -10.5332, 0.95993, 0, 0, 0.461748, 0.887011, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5152 at 17.659142 yards.
(9796, 1731, 1, 482.297, -4194.12, 31.8438, 3.12412, 0, 0, 0.999962, 0.00873464, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4670 at 21.135496 yards.
(9800, 1731, 1, -5.93815, -4229.33, 97.8519, 2.25147, 0, 0, 0.902585, 0.430512, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 4733 at 9.470348 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(12888, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(12900, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(12901, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(13104, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(13105, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(9786, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(9787, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(9788, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(9789, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(9790, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(9791, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(4862, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(9792, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(9794, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(9795, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(9796, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(9800, 1024, 0, 'Copper Vein', 0, 10); -- Copper Veins in Durotar 127 objects total

-- Missing Copper Vein spawns in The Barrens.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(16652, 1731, 1, -2394.48, -2623.69, 176.881, 3.05433, 0, 0, 0.999048, 0.0436193, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 16055 at 152.569626 yards.
(15184, 1731, 1, 346.108, -2270.83, 242.689, 3.08918, 0, 0, 0.999657, 0.0262016, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 15170 at 67.332870 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(16652, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(15184, 1033, 0, 'Copper Vein', 0, 10); -- Copper Veins in Barrens 147 objects total

-- Missing Copper Vein spawns in Loch Modan.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(13106, 1731, 0, -5073.87, -2708.62, 320.316, 4.08407, 0, 0, -0.891006, 0.453991, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 13005 at 15.798904 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(13106, 1166, 0, 'Copper Vein', 0, 10); -- Copper Veins in Loch Modan 82 objects total

-- Missing Copper Vein spawns in Westfall.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(9801, 1731, 0, -11111.9, 1118.64, 54.0787, 4.4855, 0, 0, -0.782608, 0.622515, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5260 at 109.223763 yards.
(9802, 1731, 0, -11278.8, 1137.58, 97.9341, 0.90757, 0, 0, 0.438371, 0.898794, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 5259 at 86.485275 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(9801, 1111, 0, 'Copper Vein', 0, 10), -- Copper Veins in Westfall 57 objects total
(9802, 1111, 0, 'Copper Vein', 0, 10); -- Copper Veins in Westfall 57 objects total

-- Missing Copper Vein spawns in Redridge Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(9803, 1731, 0, -9341.33, -3197.56, 102.736, 5.49779, 0, 0, -0.382683, 0.92388, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4843 at 131.900299 yards.
(9804, 1731, 0, -9397.86, -3131.52, 87.0181, 0.523598, 0, 0, 0.258819, 0.965926, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 4843 at 146.639740 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(9803, 1128, 0, 'Copper Vein', 0, 10), -- Copper Veins in Redridge 52 objects total
(9804, 1128, 0, 'Copper Vein', 0, 10); -- Copper Veins in Redridge 52 objects total

-- Missing Copper Vein spawns in Silverpine Forest.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(9767, 1731, 0, 1346.48, 1958.65, 14.2065, 5.46288, 0, 0, -0.398748, 0.91706, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5480 at 7.036702 yards.
(35616, 1731, 0, 1389.75, 1970.95, 15.3534, 5.44543, 0, 0, -0.406736, 0.913546, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 35535 at 9.417406 yards.
(35617, 1731, 0, 1420.63, 1928.08, 10.2896, 0.296705, 0, 0, 0.147809, 0.989016, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 35443 at 13.453968 yards.
(35618, 1731, 0, 1164.29, 390.215, 42.536, 5.18363, 0, 0, -0.522498, 0.85264, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 35455 at 173.413376 yards.
(14489, 1731, 0, -744.473, 1409.05, 38.1738, 4.18879, 0, 0, -0.866025, 0.500001, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5131 at 214.048447 yards.
(9793, 1731, 0, 360.693, 1067.62, 105.336, 0.872664, 0, 0, 0.422618, 0.906308, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 4979 at 25.908981 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(9767, 1044, 0, 'Copper Vein', 0, 10), -- Copper Veins in Silverpine Forest 92 objects total
(35616, 1044, 0, 'Copper Vein', 0, 10), -- Copper Veins in Silverpine Forest 92 objects total
(35617, 1044, 0, 'Copper Vein', 0, 10), -- Copper Veins in Silverpine Forest 92 objects total
(35618, 1044, 0, 'Copper Vein', 0, 10), -- Copper Veins in Silverpine Forest 92 objects total
(14489, 1044, 0, 'Copper Vein', 0, 10), -- Copper Veins in Silverpine Forest 92 objects total
(9793, 1044, 0, 'Copper Vein', 0, 10); -- Copper Veins in Silverpine Forest 92 objects total

-- Missing Copper Vein spawns in Darkshore.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(48901, 1731, 1, 7225.66, -737.653, 55.2411, 5.46288, 0, 0, -0.398748, 0.91706, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 48742 at 114.871223 yards.
(48909, 1731, 1, 4419.6, -3.89882, 93.5844, 1.6057, 0, 0, 0.719339, 0.694659, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 48494 at 188.190659 yards.
(9797, 1731, 1, 6975.51, -639.299, 67.8948, 0.855211, 0, 0, 0.414693, 0.909961, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5078 at 75.158340 yards.
(48917, 1731, 1, 6753.14, -688.306, 89.6568, 3.10665, 0, 0, 0.999847, 0.0174693, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 48681 at 34.878399 yards.
(48930, 1731, 1, 4558.31, 14.4214, 99.8561, 2.74016, 0, 0, 0.979924, 0.19937, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 48494 at 62.899220 yards.
(9799, 1731, 1, 6183.53, 107.973, 31.5811, 0.698131, 0, 0, 0.34202, 0.939693, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 5452 at 103.676826 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(48901, 1098, 0, 'Copper Vein', 0, 10), -- Copper Veins in Darkshore 84 objects total
(48909, 1098, 0, 'Copper Vein', 0, 10), -- Copper Veins in Darkshore 84 objects total
(9797, 1098, 0, 'Copper Vein', 0, 10), -- Copper Veins in Darkshore 84 objects total
(48917, 1098, 0, 'Copper Vein', 0, 10), -- Copper Veins in Darkshore 84 objects total
(48930, 1098, 0, 'Copper Vein', 0, 10), -- Copper Veins in Darkshore 84 objects total
(9799, 1098, 0, 'Copper Vein', 0, 10); -- Copper Veins in Darkshore 84 objects total

-- Missing Copper Vein spawns in Mulgore.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(20842, 1731, 1, -2361.1, 343.807, 64.7413, 4.92183, 0, 0, -0.62932, 0.777146, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 20709 at 25.212273 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(20842, 1028, 0, 'Copper Vein', 0, 10); -- Copper Veins in Mulgore 64 objects total

-- Missing Copper Vein spawns in Hillsbrad Foothills.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21277, 1731, 0, -483.161, -244.188, 59.4281, 2.19911, 0, 0, 0.891006, 0.453991, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 21251 at 117.238396 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(21277, 1066, 0, 'Copper Vein', 0, 10); -- Copper Veins in Hillsbrad 20 objects total

-- Missing Copper Vein spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(9798, 1731, 1, 3414.26, -24.0284, 21.7966, 6.02139, 0, 0, -0.130526, 0.991445, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 4872 at 17.429634 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(9798, 1075, 0, 'Copper Vein', 0, 10); -- Copper Veins in Ashenvale 69 objects total

-- Missing Copper Vein spawns in The Deadmines.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(31956, 1731, 0, -11258.6, 1499.64, 39.4549, 0.104719, 0, 0, 0.0523357, 0.99863, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 31950 at 56.219994 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(31956, 1111, 0, 'Copper Vein', 0, 10); -- Copper Veins in Westfall 57 objects total

UPDATE `pool_gameobject` SET `description` = 'Copper Vein' WHERE `guid`=55878;
UPDATE `pool_gameobject` SET `description` = 'Copper Vein' WHERE `guid`=55884;

-- Correct position of Copper Vein in The Barrens (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-2287.27, `position_y`=-2533.56, `position_z`=95.5277, `orientation`=0.541051, `rotation0`=0, `rotation1`=0, `rotation2`=0.267238, `rotation3`=0.963631 WHERE `guid`=5507;

-- Correct position of Copper Vein in The Barrens (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-3956.45, `position_y`=-1863.94, `position_z`=97.3946, `orientation`=4.46804, `rotation0`=0, `rotation1`=0, `rotation2`=-0.788011, `rotation3`=0.615662 WHERE `guid`=5301;

-- Correct position of Copper Vein in The Barrens (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-1823.53, `position_y`=-1875.66, `position_z`=97.7162, `orientation`=6.24828, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0174522, `rotation3`=0.999848 WHERE `guid`=5020;

-- Correct position of Copper Vein in The Barrens (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-141.477, `position_y`=-3034.67, `position_z`=91.7, `orientation`=5.25344, `rotation0`=0, `rotation1`=0, `rotation2`=-0.492423, `rotation3`=0.870356 WHERE `guid`=5302;

-- Missing Copper Vein spawns in The Barrens.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(9853, 3763, 1, -3885.71, -1617.31, 91.6667, 2.91469, 0, 0, 0.993571, 0.113208, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5307 at 40.414883 yards.
(9855, 3763, 1, -124.809, -3121.5, 97.477, 5.86431, 0, 0, -0.207911, 0.978148, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 5312 at 72.685699 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(9853, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(9855, 1033, 0, 'Copper Vein', 0, 10); -- Copper Veins in Barrens 147 objects total

-- Remove Undergroud Objects Not Present In Sniffs
DELETE FROM `gameobject` WHERE `guid` IN (4788, 5027, 5149);
DELETE FROM `pool_gameobject` WHERE `guid` IN (4788, 5027, 5149);

-- DARK IRON ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Correct position of Dark Iron Deposit in Burning Steppes (position is off by 4.72449 yards).
UPDATE `gameobject` SET `position_x`=-7616.39, `position_y`=-705.041, `position_z`=181.31, `orientation`=0.977383, `rotation0`=0, `rotation1`=0, `rotation2`=0.469471, `rotation3`=0.882948 WHERE `guid`=3998521;

-- Correct position of Dark Iron Deposit in Burning Steppes (position is off by 4.40298 yards).
UPDATE `gameobject` SET `position_x`=-7824.89, `position_y`=-2618.07, `position_z`=123.346, `orientation`=6.19592, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0436192, `rotation3`=0.999048 WHERE `guid`=3998562;

-- Correct position of Dark Iron Deposit in Burning Steppes (position is off by 3.54928 yards).
UPDATE `gameobject` SET `position_x`=-7784.13, `position_y`=-2052, `position_z`=143.532, `orientation`=1.62316, `rotation0`=0, `rotation1`=0, `rotation2`=0.725374, `rotation3`=0.688355 WHERE `guid`=3998543;

-- Missing Dark Iron Deposit spawns in Burning Steppes.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(3998629, 165658, 0, -7889.31, -2160.1, 131.521, 4.25861, 0, 0, -0.848047, 0.529921, 300, 300, 1, 100, 5, 10), -- Closest existing guid is 3998547 at 10.770436 yards.
(3998647, 165658, 0, -8019.87, -743.805, 142.527, 2.04204, 0, 0, 0.85264, 0.522499, 300, 300, 1, 100, 5, 10), -- Closest existing guid is 3998522 at 202.123169 yards.
(3998653, 165658, 0, -8165.27, -762, 132.767, 3.45576, 0, 0, -0.987688, 0.156436, 300, 300, 1, 100, 5, 10), -- Closest existing guid is 3998524 at 291.936737 yards.
(3998657, 165658, 0, -7771.45, -1950.79, 133.599, 4.03171, 0, 0, -0.902585, 0.430512, 300, 300, 1, 100, 5, 10), -- Closest existing guid is 3998538 at 99.453789 yards.
(3998658, 165658, 0, -7978.81, -2636.86, 170.912, 6.05629, 0, 0, -0.113203, 0.993572, 300, 300, 1, 100, 5, 10), -- Closest existing guid is 3998563 at 77.062340 yards.
(3998661, 165658, 0, -7891.56, -2589.27, 124.627, 3.14159, 0, 0, -1, 0, 300, 300, 1, 100, 5, 10), -- Closest existing guid is 3998560 at 30.144604 yards.
(3998662, 165658, 0, -7685, -1650.93, 144.559, 0.296705, 0, 0, 0.147809, 0.989016, 300, 300, 1, 100, 5, 10), -- Closest existing guid is 3998534 at 8.103163 yards.
(3998664, 165658, 0, -7798.7, -2700.66, 173.512, 1.22173, 0, 0, 0.573576, 0.819152, 300, 300, 1, 100, 5, 10), -- Closest existing guid is 3998567 at 54.102592 yards.
(3998665, 165658, 0, -8386.3, -2815.53, 211.551, 2.47837, 0, 0, 0.945518, 0.325568, 300, 300, 1, 100, 5, 10), -- Closest existing guid is 3998573 at 17.418512 yards.
(3998666, 165658, 0, -7890.92, -2537.66, 129.832, 1.53589, 0, 0, 0.694658, 0.71934, 300, 300, 1, 100, 5, 10), -- Closest existing guid is 3998556 at 30.768915 yards.
(3998673, 165658, 0, -7942.18, -2657.86, 218.995, 2.46091, 0, 0, 0.942641, 0.333808, 300, 300, 1, 100, 5, 10), -- Closest existing guid is 3998563 at 18.497490 yards.
(3998674, 165658, 0, -8188.76, -1926.49, 148.641, 5.60251, 0, 0, -0.333807, 0.942641, 300, 300, 1, 100, 5, 10), -- Closest existing guid is 3998540 at 7.622613 yards.
(3998675, 165658, 0, -7814.68, -2648.13, 223.628, 0, 0, 0, 0, 1, 300, 300, 1, 100, 5, 10), -- Closest existing guid is 3998565 at 8.098018 yards.
(3998677, 165658, 0, -7888.64, -2573.78, 176.537, 1.37881, 0, 0, 0.636078, 0.771625, 300, 300, 1, 100, 5, 10), -- Closest existing guid is 3998556 at 54.754230 yards.
(3998678, 165658, 0, -7916.36, -1989.86, 141.389, 1.32645, 0, 0, 0.615661, 0.788011, 300, 300, 1, 100, 5, 10), -- Closest existing guid is 3998542 at 16.049841 yards.
(3998679, 165658, 0, -8124.25, -2463.32, 149.642, 2.80998, 0, 0, 0.986285, 0.16505, 300, 300, 1, 100, 5, 10), -- Closest existing guid is 3998552 at 16.139236 yards.
(3998680, 165658, 0, -7891.51, -2502.56, 130.12, 6.12611, 0, 0, -0.0784588, 0.996917, 300, 300, 1, 100, 5, 10), -- Closest existing guid is 3998554 at 25.353792 yards.
(3998682, 165658, 0, -7681.69, -1883.48, 137.159, 4.88692, 0, 0, -0.642787, 0.766045, 300, 300, 1, 100, 5, 10), -- Closest existing guid is 3998538 at 15.691463 yards.
(3998687, 165658, 0, -8069.67, -1793.36, 138.633, 5.67232, 0, 0, -0.300705, 0.953717, 300, 300, 1, 100, 5, 10), -- Closest existing guid is 3998536 at 13.924442 yards.
(3998688, 165658, 0, -8265.21, -2501.09, 151.887, 0.261798, 0, 0, 0.130526, 0.991445, 300, 300, 1, 100, 5, 10); -- Closest existing guid is 3998553 at 14.851388 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(3998629, 1337, 0, 'Dark Iron Deposit', 5, 10), -- Burning Steppes Dark Iron
(3998647, 1337, 0, 'Dark Iron Deposit', 5, 10), -- Burning Steppes Dark Iron
(3998653, 1337, 0, 'Dark Iron Deposit', 5, 10), -- Burning Steppes Dark Iron
(3998657, 1337, 0, 'Dark Iron Deposit', 5, 10), -- Burning Steppes Dark Iron
(3998658, 1337, 0, 'Dark Iron Deposit', 5, 10), -- Burning Steppes Dark Iron
(3998661, 1337, 0, 'Dark Iron Deposit', 5, 10), -- Burning Steppes Dark Iron
(3998662, 1337, 0, 'Dark Iron Deposit', 5, 10), -- Burning Steppes Dark Iron
(3998664, 1337, 0, 'Dark Iron Deposit', 5, 10), -- Burning Steppes Dark Iron
(3998665, 1337, 0, 'Dark Iron Deposit', 5, 10), -- Burning Steppes Dark Iron
(3998666, 1337, 0, 'Dark Iron Deposit', 5, 10), -- Burning Steppes Dark Iron
(3998673, 1337, 0, 'Dark Iron Deposit', 5, 10), -- Burning Steppes Dark Iron
(3998674, 1337, 0, 'Dark Iron Deposit', 5, 10), -- Burning Steppes Dark Iron
(3998675, 1337, 0, 'Dark Iron Deposit', 5, 10), -- Burning Steppes Dark Iron
(3998677, 1337, 0, 'Dark Iron Deposit', 5, 10), -- Burning Steppes Dark Iron
(3998678, 1337, 0, 'Dark Iron Deposit', 5, 10), -- Burning Steppes Dark Iron
(3998679, 1337, 0, 'Dark Iron Deposit', 5, 10), -- Burning Steppes Dark Iron
(3998680, 1337, 0, 'Dark Iron Deposit', 5, 10), -- Burning Steppes Dark Iron
(3998682, 1337, 0, 'Dark Iron Deposit', 5, 10), -- Burning Steppes Dark Iron
(3998687, 1337, 0, 'Dark Iron Deposit', 5, 10), -- Burning Steppes Dark Iron
(3998688, 1337, 0, 'Dark Iron Deposit', 5, 10); -- Burning Steppes Dark Iron

-- Missing Dark Iron Deposit spawns in Searing Gorge.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(3998643, 165658, 0, -6580.63, -1837.71, 244.947, 2.42601, 0, 0, 0.936672, 0.350207, 300, 300, 1, 100, 5, 10), -- Closest existing guid is 3998626 at 5.965899 yards.
(3998644, 165658, 0, -6561.7, -1257.7, 136.212, 5.84685, 0, 0, -0.216439, 0.976296, 300, 300, 1, 100, 5, 10), -- Closest existing guid is 3998611 at 99.691429 yards.
(3998645, 165658, 0, -6727.07, -1085.87, 185.576, 0.994837, 0, 0, 0.477159, 0.878817, 300, 300, 1, 100, 5, 10), -- Closest existing guid is 3998597 at 27.933603 yards.
(3998646, 165658, 0, -6865.97, -1191.79, 182.557, 0.383971, 0, 0, 0.190808, 0.981627, 300, 300, 1, 100, 5, 10), -- Closest existing guid is 3998602 at 45.611626 yards.
(3998648, 165658, 0, -7314.01, -1597.51, 315.985, 0.261798, 0, 0, 0.130526, 0.991445, 300, 300, 1, 100, 5, 10), -- Closest existing guid is 3998620 at 29.218557 yards.
(3998649, 165658, 0, -6463.52, -824.624, 336.551, 0.994837, 0, 0, 0.477159, 0.878817, 300, 300, 1, 100, 5, 10), -- Closest existing guid is 3998587 at 18.102976 yards.
(3998650, 165658, 0, -6718.6, -1252.82, 183.493, 0.139624, 0, 0, 0.0697556, 0.997564, 300, 300, 1, 100, 5, 10), -- Closest existing guid is 3998605 at 12.263851 yards.
(3998651, 165658, 0, -6467.07, -1390.98, 142.91, 3.49067, 0, 0, -0.984807, 0.173652, 300, 300, 1, 100, 5, 10), -- Closest existing guid is 3998611 at 95.717155 yards.
(3998652, 165658, 0, -6736.55, -1686.12, 219.236, 4.03171, 0, 0, -0.902585, 0.430512, 300, 300, 1, 100, 5, 10), -- Closest existing guid is 3998623 at 29.250608 yards.
(3998654, 165658, 0, -6935.9, -1202.91, 148.082, 1.20428, 0, 0, 0.566406, 0.824126, 300, 300, 1, 100, 5, 10), -- Closest existing guid is 3998603 at 14.424098 yards.
(3998655, 165658, 0, -6862.05, -1551.08, 242.068, 3.10665, 0, 0, 0.999847, 0.0174693, 300, 300, 1, 100, 5, 10), -- Closest existing guid is 3998617 at 106.700317 yards.
(3998656, 165658, 0, -6835.71, -1484.15, 208.595, 1.58825, 0, 0, 0.71325, 0.70091, 300, 300, 1, 100, 5, 10), -- Closest existing guid is 3998617 at 36.086281 yards.
(3998659, 165658, 0, -6644.5, -858.294, 244.144, 0.90757, 0, 0, 0.438371, 0.898794, 300, 300, 1, 100, 5, 10), -- Closest existing guid is 3998589 at 19.658464 yards.
(3998660, 165658, 0, -7156.05, -1163.11, 265.518, 4.38078, 0, 0, -0.814116, 0.580703, 300, 300, 1, 100, 5, 10), -- Closest existing guid is 3998599 at 9.750084 yards.
(3998663, 165658, 0, -7076.41, -1297.19, 267.191, 5.98648, 0, 0, -0.147809, 0.989016, 300, 300, 1, 100, 5, 10), -- Closest existing guid is 3998609 at 22.202290 yards.
(3998667, 165658, 0, -6680.17, -1020.97, 253.177, 1.74533, 0, 0, 0.766044, 0.642789, 300, 300, 1, 100, 5, 10), -- Closest existing guid is 3998595 at 7.297639 yards.
(3998668, 165658, 0, -6560.44, -824.799, 297.716, 3.6652, 0, 0, -0.965925, 0.258821, 300, 300, 1, 100, 5, 10), -- Closest existing guid is 3998588 at 98.464851 yards.
(3998669, 165658, 0, -6647.45, -699.644, 233.32, 4.5204, 0, 0, -0.771625, 0.636078, 300, 300, 1, 100, 5, 10), -- Closest existing guid is 3998583 at 28.385668 yards.
(3998670, 165658, 0, -6581.75, -672.116, 241.635, 1.90241, 0, 0, 0.814116, 0.580703, 300, 300, 1, 100, 5, 10), -- Closest existing guid is 3998582 at 17.947741 yards.
(3998671, 165658, 0, -6869.47, -1410.38, 172.377, 3.50812, 0, 0, -0.983254, 0.182238, 300, 300, 1, 100, 5, 10), -- Closest existing guid is 3998613 at 14.913168 yards.
(3998672, 165658, 0, -6473.71, -1195.53, 183.154, 1.29154, 0, 0, 0.601814, 0.798636, 300, 300, 1, 100, 5, 10), -- Closest existing guid is 3998612 at 56.554573 yards.
(3998676, 165658, 0, -7229.66, -1427.41, 266.9, 2.37364, 0, 0, 0.927183, 0.374608, 300, 300, 1, 100, 5, 10), -- Closest existing guid is 3998614 at 55.730518 yards.
(3998681, 165658, 0, -7117.15, -1606, 258.349, 3.4383, 0, 0, -0.989016, 0.147811, 300, 300, 1, 100, 5, 10), -- Closest existing guid is 3998621 at 21.517963 yards.
(3998683, 165658, 0, -6637.57, -1450.73, 259.679, 2.77507, 0, 0, 0.983254, 0.182238, 300, 300, 1, 100, 5, 10), -- Closest existing guid is 3998616 at 13.640462 yards.
(3998684, 165658, 0, -6502.38, -1040.03, 344.818, 2.63544, 0, 0, 0.968147, 0.250381, 300, 300, 1, 100, 5, 10), -- Closest existing guid is 3998596 at 54.626911 yards.
(3998685, 165658, 0, -6811, -1356.96, 169.573, 0.087266, 0, 0, 0.0436192, 0.999048, 300, 300, 1, 100, 5, 10), -- Closest existing guid is 3998613 at 80.586441 yards.
(3998686, 165658, 0, -6599.25, -1432.17, 167.379, 2.37364, 0, 0, 0.927183, 0.374608, 300, 300, 1, 100, 5, 10), -- Closest existing guid is 3998616 at 100.790688 yards.
(3998689, 165658, 0, -6989.5, -1754.34, 234.098, 4.93928, 0, 0, -0.622514, 0.782609, 300, 300, 1, 100, 5, 10); -- Closest existing guid is 3998624 at 9.338870 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(3998643, 1338, 0, 'Dark Iron Deposit', 5, 10), -- Searing Gorge Dark Iron
(3998644, 1338, 0, 'Dark Iron Deposit', 5, 10), -- Searing Gorge Dark Iron
(3998645, 1338, 0, 'Dark Iron Deposit', 5, 10), -- Searing Gorge Dark Iron
(3998646, 1338, 0, 'Dark Iron Deposit', 5, 10), -- Searing Gorge Dark Iron
(3998648, 1338, 0, 'Dark Iron Deposit', 5, 10), -- Searing Gorge Dark Iron
(3998649, 1338, 0, 'Dark Iron Deposit', 5, 10), -- Searing Gorge Dark Iron
(3998650, 1338, 0, 'Dark Iron Deposit', 5, 10), -- Searing Gorge Dark Iron
(3998651, 1338, 0, 'Dark Iron Deposit', 5, 10), -- Searing Gorge Dark Iron
(3998652, 1338, 0, 'Dark Iron Deposit', 5, 10), -- Searing Gorge Dark Iron
(3998654, 1338, 0, 'Dark Iron Deposit', 5, 10), -- Searing Gorge Dark Iron
(3998655, 1338, 0, 'Dark Iron Deposit', 5, 10), -- Searing Gorge Dark Iron
(3998656, 1338, 0, 'Dark Iron Deposit', 5, 10), -- Searing Gorge Dark Iron
(3998659, 1338, 0, 'Dark Iron Deposit', 5, 10), -- Searing Gorge Dark Iron
(3998660, 1338, 0, 'Dark Iron Deposit', 5, 10), -- Searing Gorge Dark Iron
(3998663, 1338, 0, 'Dark Iron Deposit', 5, 10), -- Searing Gorge Dark Iron
(3998667, 1338, 0, 'Dark Iron Deposit', 5, 10), -- Searing Gorge Dark Iron
(3998668, 1338, 0, 'Dark Iron Deposit', 5, 10), -- Searing Gorge Dark Iron
(3998669, 1338, 0, 'Dark Iron Deposit', 5, 10), -- Searing Gorge Dark Iron
(3998670, 1338, 0, 'Dark Iron Deposit', 5, 10), -- Searing Gorge Dark Iron
(3998671, 1338, 0, 'Dark Iron Deposit', 5, 10), -- Searing Gorge Dark Iron
(3998672, 1338, 0, 'Dark Iron Deposit', 5, 10), -- Searing Gorge Dark Iron
(3998676, 1338, 0, 'Dark Iron Deposit', 5, 10), -- Searing Gorge Dark Iron
(3998681, 1338, 0, 'Dark Iron Deposit', 5, 10), -- Searing Gorge Dark Iron
(3998683, 1338, 0, 'Dark Iron Deposit', 5, 10), -- Searing Gorge Dark Iron
(3998684, 1338, 0, 'Dark Iron Deposit', 5, 10), -- Searing Gorge Dark Iron
(3998685, 1338, 0, 'Dark Iron Deposit', 5, 10), -- Searing Gorge Dark Iron
(3998686, 1338, 0, 'Dark Iron Deposit', 5, 10), -- Searing Gorge Dark Iron
(3998689, 1338, 0, 'Dark Iron Deposit', 5, 10); -- Searing Gorge Dark Iron

UPDATE `pool_gameobject` SET `description` = 'Dark Iron Deposit' WHERE `guid` IN (
43688,
43689,
43690,
43691,
43692,
43693,
43694,
43695,
43696,
43697,
43698,
43699,
43700,
43701,
43702,
43703,
43704,
43705,
43706,
43707,
43708,
43709,
43710,
43711,
43712,
43713,
43714,
43715,
43716,
43717,
43718,
43719,
43720,
43721,
43722,
43723,
43724,
43725,
43726,
43727,
43728,
43729,
43730,
43731,
43732,
43733,
43734,
43735,
43736,
43737,
43738,
43739,
43740,
43741,
43742,
43743,
43744,
43745,
43746,
43747,
43748,
43749,
43750,
43751,
43752,
43753,
3998521,
3998522,
3998523,
3998524,
3998525,
3998526,
3998527,
3998528,
3998529,
3998530,
3998531,
3998532,
3998533,
3998534,
3998535,
3998536,
3998537,
3998538,
3998539,
3998540,
3998541,
3998542,
3998543,
3998544,
3998545,
3998546,
3998547,
3998548,
3998549,
3998550,
3998551,
3998552,
3998553,
3998554,
3998555,
3998556,
3998557,
3998558,
3998559,
3998560,
3998561,
3998562,
3998563,
3998564,
3998565,
3998566,
3998567,
3998568,
3998569,
3998570,
3998571,
3998572,
3998573,
3998574,
3998575,
3998576,
3998577,
3998578,
3998579,
3998580,
3998581,
3998582,
3998583,
3998584,
3998585,
3998586,
3998587,
3998588,
3998589,
3998590,
3998591,
3998592,
3998593,
3998594,
3998595,
3998596,
3998597,
3998598,
3998599,
3998600,
3998601,
3998602,
3998603,
3998604,
3998605,
3998606,
3998607,
3998608,
3998609,
3998610,
3998611,
3998612,
3998613,
3998614,
3998615,
3998616,
3998617,
3998618,
3998619,
3998620,
3998621,
3998622,
3998623,
3998624,
3998625,
3998626,
3998627,
3998628,
3998629,
3998643,
3998644,
3998645,
3998646,
3998647,
3998648,
3998649,
3998650,
3998651,
3998652,
3998653,
3998654,
3998655,
3998656,
3998657,
3998658,
3998659,
3998660,
3998661,
3998662,
3998663,
3998664,
3998665,
3998666,
3998667,
3998668,
3998669,
3998670,
3998671,
3998672,
3998673,
3998674,
3998675,
3998676,
3998677,
3998678,
3998679,
3998680,
3998681,
3998682,
3998683,
3998684,
3998685,
3998686,
3998687,
3998688,
3998689);

UPDATE `pool_template` SET `description`='Dark Iron Deposits in Molten Core' WHERE `entry`=25609;
UPDATE `pool_template` SET `description`='Dark Iron Deposits in BRD' WHERE `entry`=25622;
UPDATE `pool_template` SET `description`='Dark Iron Deposits in Burning Steppes' WHERE  `entry`=1337;
UPDATE `pool_template` SET `description`='Dark Iron Deposits in Searing Gorge' WHERE  `entry`=1338;

-- IRON ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Guid 6010 should be part of pool Iron Deposits in Swamp of Sorrows (2) 31 objects total (1314).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (6010, 1314, 0, 'Iron Deposit', 0, 10);

-- Guid 6045 should be part of pool Iron Deposits in Thousand Needles 102 objects total (1132).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (6045, 1132, 0, 'Iron Deposit', 0, 10);

-- Guid 6075 should be part of pool Iron Deposits in Searing Gorge 7 objects total (1292).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (6075, 1292, 0, 'Iron Deposit', 0, 10);

-- Guid 6076 should be part of pool Iron Deposits in Searing Gorge 7 objects total (1292).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (6076, 1292, 0, 'Iron Deposit', 0, 10);

-- Guid 6093 should be part of pool Iron Deposits in Alterac 78 objects total (1068).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (6093, 1068, 0, 'Iron Deposit', 0, 10);

-- Guid 6115 should be part of pool Iron Deposits in Badlands 83 objects total (1287).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (6115, 1287, 0, 'Iron Deposit', 0, 10);

-- Guid 6166 should be part of pool Iron Deposits in Arathi 182 objects total (1186).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (6166, 1186, 0, 'Iron Deposit', 0, 10);

-- Guid 6220 should be part of pool Iron Deposits in Arathi 182 objects total (1186).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (6220, 1186, 0, 'Iron Deposit', 0, 10);

-- Guid 6221 should be part of pool Iron Deposits in Arathi 182 objects total (1186).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (6221, 1186, 0, 'Iron Deposit', 0, 10);

-- Guid 6222 should be part of pool Iron Deposits in Arathi 182 objects total (1186).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (6222, 1186, 0, 'Iron Deposit', 0, 10);

-- Guid 6236 should be part of pool Iron Deposits in Swamp of Sorrows (2) 31 objects total (1314).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (6236, 1314, 0, 'Iron Deposit', 0, 10);

-- Guid 6318 should be part of pool Iron Deposits in Thousand Needles 102 objects total (1132).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (6318, 1132, 0, 'Iron Deposit', 0, 10);

-- Guid 6327 should be part of pool Iron Deposits in Thousand Needles 102 objects total (1132).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (6327, 1132, 0, 'Iron Deposit', 0, 10);

-- Guid 6336 should be part of pool Iron Deposits in Thousand Needles 102 objects total (1132).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (6336, 1132, 0, 'Iron Deposit', 0, 10);

-- Guid 6395 should be part of pool Iron Deposits in Hillsbrad 33 objects total (1070).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (6395, 1070, 0, 'Iron Deposit', 0, 10);

-- Guid 6414 should be part of pool Iron Deposits in Arathi 182 objects total (1186).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (6414, 1186, 0, 'Iron Deposit', 0, 10);

-- Guid 6446 should be part of pool Iron Deposits in Arathi 182 objects total (1186).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (6446, 1186, 0, 'Iron Deposit', 0, 10);

-- Guid 6473 should be part of pool Iron Deposits in Thousand Needles 102 objects total (1132).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (6473, 1132, 0, 'Iron Deposit', 0, 10);

-- Guid 6518 should be part of pool Iron Deposits in Swamp of Sorrows (2) 31 objects total (1314).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (6518, 1314, 0, 'Iron Deposit', 0, 10);

-- Guid 6548 should be part of pool Iron Deposits in Badlands 83 objects total (1287).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (6548, 1287, 0, 'Iron Deposit', 0, 10);

-- Guid 6556 should be part of pool Iron Deposits in Searing Gorge 7 objects total (1292).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (6556, 1292, 0, 'Iron Deposit', 0, 10);

-- Guid 6614 should be part of pool Iron Deposits in Arathi 182 objects total (1186).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (6614, 1186, 0, 'Iron Deposit', 0, 10);

-- Guid 6634 should be part of pool Iron Deposits in Swamp of Sorrows (2) 31 objects total (1314).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (6634, 1314, 0, 'Iron Deposit', 0, 10);

-- Guid 6697 should be part of pool Iron Deposits in Alterac 78 objects total (1068).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (6697, 1068, 0, 'Iron Deposit', 0, 10);

-- Guid 6704 should be part of pool Iron Deposits in Feralas 30 objects total (1196).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (6704, 1196, 0, 'Iron Deposit', 0, 10);

-- Guid 6747 should be part of pool Iron Deposits in Arathi 182 objects total (1186).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (6747, 1186, 0, 'Iron Deposit', 0, 10);

-- Guid 6750 should be part of pool Iron Deposits in Hillsbrad 33 objects total (1070).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (6750, 1070, 0, 'Iron Deposit', 0, 10);

-- Guid 9592 should be part of pool Iron Deposits in Arathi 182 objects total (1186).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (9592, 1186, 0, 'Iron Deposit', 0, 10);

-- Guid 11488 should be part of pool Iron Deposits in Badlands 83 objects total (1287).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (11488, 1287, 0, 'Iron Deposit', 0, 10);

-- Guid 11761 should be part of pool Dustwallow Marsh: Iron Vein (43520).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (11761, 43520, 0, 'Iron Deposit', 0, 10);

-- Guid 13669 should be part of pool Dustwallow Marsh: Iron Vein (43520).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (13669, 43520, 0, 'Iron Deposit', 0, 10);

-- Guid 14611 should be part of pool Dustwallow Marsh: Iron Vein (43520).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (14611, 43520, 0, 'Iron Deposit', 0, 10);

-- Guid 14612 should be part of pool Dustwallow Marsh: Iron Vein (43520).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (14612, 43520, 0, 'Iron Deposit', 0, 10);

-- Guid 14956 should be part of pool Dustwallow Marsh: Iron Vein (43520).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (14956, 43520, 0, 'Iron Deposit', 0, 10);

-- Guid 15048 should be part of pool Iron Deposits in Arathi 182 objects total (1186).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (15048, 1186, 0, 'Iron Deposit', 0, 10);

-- Guid 16745 should be part of pool Iron Deposits in Arathi 182 objects total (1186).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (16745, 1186, 0, 'Iron Deposit', 0, 10);

-- Guid 16954 should be part of pool Iron Deposits in Arathi 182 objects total (1186).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (16954, 1186, 0, 'Iron Deposit', 0, 10);

-- Guid 16964 should be part of pool Iron Deposits in Arathi 182 objects total (1186).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (16964, 1186, 0, 'Iron Deposit', 0, 10);

-- Guid 20817 should be part of pool Iron Deposits in Hillsbrad 33 objects total (1070).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (20817, 1070, 0, 'Iron Deposit', 0, 10);

-- Guid 21270 should be part of pool Iron Deposits in Arathi 182 objects total (1186).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (21270, 1186, 0, 'Iron Deposit', 0, 10);

-- Guid 32196 should be part of pool Iron Deposits in Alterac 78 objects total (1068).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (32196, 1068, 0, 'Iron Deposit', 0, 10);

-- Guid 33134 should be part of pool Iron Deposits in Alterac 78 objects total (1068).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (33134, 1068, 0, 'Iron Deposit', 0, 10);

-- Guid 35374 should be part of pool Iron Deposits in Alterac 78 objects total (1068).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (35374, 1068, 0, 'Iron Deposit', 0, 10);

-- Create new pool to hold Iron Deposit spawns in The Hinterlands.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(415, 1, 'Iron Deposits in The Hinterlands', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(6019, 415, 0, 'Iron Deposit', 0, 10),
(6039, 415, 0, 'Iron Deposit', 0, 10),
(6090, 415, 0, 'Iron Deposit', 0, 10),
(6110, 415, 0, 'Iron Deposit', 0, 10),
(6176, 415, 0, 'Iron Deposit', 0, 10),
(6290, 415, 0, 'Iron Deposit', 0, 10),
(6291, 415, 0, 'Iron Deposit', 0, 10),
(6297, 415, 0, 'Iron Deposit', 0, 10),
(6305, 415, 0, 'Iron Deposit', 0, 10),
(6308, 415, 0, 'Iron Deposit', 0, 10),
(6340, 415, 0, 'Iron Deposit', 0, 10),
(6383, 415, 0, 'Iron Deposit', 0, 10),
(6452, 415, 0, 'Iron Deposit', 0, 10),
(6493, 415, 0, 'Iron Deposit', 0, 10),
(6609, 415, 0, 'Iron Deposit', 0, 10),
(6716, 415, 0, 'Iron Deposit', 0, 10),
(34967, 415, 0, 'Iron Deposit', 0, 10),
(46368, 415, 0, 'Iron Deposit', 0, 10);

-- Correct position of Iron Deposit in Thousand Needles (position is off by 0.698659 yards).
UPDATE `gameobject` SET `position_x`=-5828.66, `position_y`=-3958.22, `position_z`=-71.9373, `orientation`=4.4855, `rotation0`=0, `rotation1`=0, `rotation2`=-0.782608, `rotation3`=0.622515 WHERE `guid`=6250;

-- Correct position of Iron Deposit in Swamp of Sorrows (position is off by 1.63399 yards).
UPDATE `gameobject` SET `position_x`=-10629.5, `position_y`=-2461.66, `position_z`=38.145, `orientation`=1.6057, `rotation0`=0, `rotation1`=0, `rotation2`=0.719339, `rotation3`=0.694659 WHERE `guid`=6095;

-- Correct position of Iron Deposit in Alterac Mountains (position is off by 4.85846 yards).
UPDATE `gameobject` SET `position_x`=531.835, `position_y`=-1097.24, `position_z`=154.998, `orientation`=2.23402, `rotation0`=0, `rotation1`=0, `rotation2`=0.898793, `rotation3`=0.438373 WHERE `guid`=6711;

-- Correct position of Iron Deposit in Stranglethorn Vale (position is off by 0.419223 yards).
UPDATE `gameobject` SET `position_x`=-14099, `position_y`=318.75, `position_z`=24.437, `orientation`=2.47837, `rotation0`=0, `rotation1`=0, `rotation2`=0.945518, `rotation3`=0.325568 WHERE `guid`=6550;

-- Correct position of Iron Deposit in Desolace (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-1367.99, `position_y`=1272.66, `position_z`=105.93, `orientation`=0.925024, `rotation0`=0, `rotation1`=0, `rotation2`=0.446198, `rotation3`=0.894935 WHERE `guid`=6366;

-- Correct position of Iron Deposit in Arathi Highlands (position is off by 0.250764 yards).
UPDATE `gameobject` SET `position_x`=-1709.25, `position_y`=-3219.01, `position_z`=37.5768, `orientation`=2.46091, `rotation0`=0, `rotation1`=0, `rotation2`=0.942641, `rotation3`=0.333808 WHERE `guid`=6557;

-- Correct position of Iron Deposit in Arathi Highlands (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-1618.12, `position_y`=-2121.86, `position_z`=31.3074, `orientation`=3.01941, `rotation0`=0, `rotation1`=0, `rotation2`=0.998135, `rotation3`=0.0610518 WHERE `guid`=16927;

-- Correct position of Iron Deposit in Desolace (position is off by 0.148694 yards).
UPDATE `gameobject` SET `position_x`=-1695.14, `position_y`=2789.52, `position_z`=144.595, `orientation`=2.09439, `rotation0`=0, `rotation1`=0, `rotation2`=0.866025, `rotation3`=0.500001 WHERE `guid`=6174;

-- Correct position of Iron Deposit in Arathi Highlands (position is off by 1.11787 yards).
UPDATE `gameobject` SET `position_x`=-1306.28, `position_y`=-2825.75, `position_z`=56.2672, `orientation`=1.58825, `rotation0`=0, `rotation1`=0, `rotation2`=0.71325, `rotation3`=0.70091 WHERE `guid`=6289;

-- Correct position of Iron Deposit in Badlands (position is off by 1.08676 yards).
UPDATE `gameobject` SET `position_x`=-6656.69, `position_y`=-3375.81, `position_z`=260.036, `orientation`=5.72468, `rotation0`=0, `rotation1`=0, `rotation2`=-0.275637, `rotation3`=0.961262 WHERE `guid`=6009;

-- Correct position of Iron Deposit in Badlands (position is off by 1.27911 yards).
UPDATE `gameobject` SET `position_x`=-6787.1, `position_y`=-2965.44, `position_z`=249.699, `orientation`=2.28638, `rotation0`=0, `rotation1`=0, `rotation2`=0.909961, `rotation3`=0.414694 WHERE `guid`=6364;

-- Correct position of Iron Deposit in Badlands (position is off by 0.159611 yards).
UPDATE `gameobject` SET `position_x`=-6792.97, `position_y`=-2452.85, `position_z`=265.002, `orientation`=4.97419, `rotation0`=0, `rotation1`=0, `rotation2`=-0.608761, `rotation3`=0.793354 WHERE `guid`=6079;

-- Correct position of Iron Deposit in Desolace (position is off by 1.44655 yards).
UPDATE `gameobject` SET `position_x`=-1167.23, `position_y`=2198.37, `position_z`=89.178, `orientation`=3.47321, `rotation0`=0, `rotation1`=0, `rotation2`=-0.986285, `rotation3`=0.16505 WHERE `guid`=6074;

-- Correct position of Iron Deposit in Desolace (position is off by 0.650244 yards).
UPDATE `gameobject` SET `position_x`=-1328.47, `position_y`=2576.41, `position_z`=116.466, `orientation`=3.7001, `rotation0`=0, `rotation1`=0, `rotation2`=-0.961261, `rotation3`=0.27564 WHERE `guid`=6380;

-- Correct position of Iron Deposit in Duskwood (position is off by 2.77998 yards).
UPDATE `gameobject` SET `position_x`=-10662.4, `position_y`=-894.27, `position_z`=58.8167, `orientation`=0.994837, `rotation0`=0, `rotation1`=0, `rotation2`=0.477159, `rotation3`=0.878817 WHERE `guid`=39984;

-- Correct position of Iron Deposit in The Hinterlands (position is off by 0.532407 yards).
UPDATE `gameobject` SET `position_x`=-44.5067, `position_y`=-2654.06, `position_z`=135.595, `orientation`=2.46091, `rotation0`=0, `rotation1`=0, `rotation2`=0.942641, `rotation3`=0.333808 WHERE `guid`=6340;

-- Correct position of Iron Deposit in Thousand Needles (position is off by 0.00976563 yards).
UPDATE `gameobject` SET `position_x`=-5457.66, `position_y`=-2200.77, `position_z`=-57.5791, `orientation`=3.45576, `rotation0`=0, `rotation1`=0, `rotation2`=-0.987688, `rotation3`=0.156436 WHERE `guid`=170109;

-- Correct position of Iron Deposit in Tanaris (position is off by 1.46866 yards).
UPDATE `gameobject` SET `position_x`=-7385.07, `position_y`=-4483.87, `position_z`=13.9269, `orientation`=0.296705, `rotation0`=0, `rotation1`=0, `rotation2`=0.147809, `rotation3`=0.989016 WHERE `guid`=6705;

-- Correct position of Iron Deposit in Arathi Highlands (position is off by 2.8795 yards).
UPDATE `gameobject` SET `position_x`=-1192.32, `position_y`=-1953.69, `position_z`=26.9048, `orientation`=1.36136, `rotation0`=0, `rotation1`=0, `rotation2`=0.62932, `rotation3`=0.777146 WHERE `guid`=6227;

-- Correct position of Iron Deposit in Badlands (position is off by 1.38441 yards).
UPDATE `gameobject` SET `position_x`=-6893.85, `position_y`=-2792.91, `position_z`=242.547, `orientation`=3.05433, `rotation0`=0, `rotation1`=0, `rotation2`=0.999048, `rotation3`=0.0436193 WHERE `guid`=6404;

-- Correct position of Iron Deposit in Badlands (position is off by 0.640433 yards).
UPDATE `gameobject` SET `position_x`=-6867, `position_y`=-2399.52, `position_z`=250.525, `orientation`=2.19911, `rotation0`=0, `rotation1`=0, `rotation2`=0.891006, `rotation3`=0.453991 WHERE `guid`=6226;

-- Correct position of Iron Deposit in Badlands (position is off by 1.31417 yards).
UPDATE `gameobject` SET `position_x`=-7104.98, `position_y`=-2640.14, `position_z`=264.982, `orientation`=1.97222, `rotation0`=0, `rotation1`=0, `rotation2`=0.833885, `rotation3`=0.551938 WHERE `guid`=6148;

-- Correct position of Iron Deposit in Thousand Needles (position is off by 1.0769 yards).
UPDATE `gameobject` SET `position_x`=-6521.36, `position_y`=-3828.84, `position_z`=-63.9889, `orientation`=4.86947, `rotation0`=0, `rotation1`=0, `rotation2`=-0.649447, `rotation3`=0.760406 WHERE `guid`=6229;

-- Correct position of Iron Deposit in Badlands (position is off by 1.0891 yards).
UPDATE `gameobject` SET `position_x`=-6998.15, `position_y`=-2744.32, `position_z`=248.538, `orientation`=5.72468, `rotation0`=0, `rotation1`=0, `rotation2`=-0.275637, `rotation3`=0.961262 WHERE `guid`=6601;

-- Correct position of Iron Deposit in Swamp of Sorrows (position is off by 1.85341 yards).
UPDATE `gameobject` SET `position_x`=-10285.2, `position_y`=-2883.34, `position_z`=27.7251, `orientation`=4.43314, `rotation0`=0, `rotation1`=0, `rotation2`=-0.798635, `rotation3`=0.601815 WHERE `guid`=6761;

-- Correct position of Iron Deposit in Badlands (position is off by 0.89787 yards).
UPDATE `gameobject` SET `position_x`=-6807.24, `position_y`=-2348.27, `position_z`=279.923, `orientation`=3.28124, `rotation0`=0, `rotation1`=0, `rotation2`=-0.997563, `rotation3`=0.0697661 WHERE `guid`=6516;

-- Correct position of Iron Deposit in Badlands (position is off by 2.16943 yards).
UPDATE `gameobject` SET `position_x`=-7146.91, `position_y`=-3493.61, `position_z`=264.67, `orientation`=4.57276, `rotation0`=0, `rotation1`=0, `rotation2`=-0.754709, `rotation3`=0.656059 WHERE `guid`=39964;

-- Correct position of Iron Deposit in Badlands (position is off by 0.54124 yards).
UPDATE `gameobject` SET `position_x`=-6770.47, `position_y`=-2845.89, `position_z`=246.351, `orientation`=0.523598, `rotation0`=0, `rotation1`=0, `rotation2`=0.258819, `rotation3`=0.965926 WHERE `guid`=6270;

-- Correct position of Iron Deposit in Badlands (position is off by 1.25475 yards).
UPDATE `gameobject` SET `position_x`=-6742.13, `position_y`=-3092.78, `position_z`=280.762, `orientation`=0.733038, `rotation0`=0, `rotation1`=0, `rotation2`=0.358368, `rotation3`=0.93358 WHERE `guid`=6335;

-- Correct position of Iron Deposit in Badlands (position is off by 1.57098 yards).
UPDATE `gameobject` SET `position_x`=-6870, `position_y`=-3135.92, `position_z`=262.557, `orientation`=5.51524, `rotation0`=0, `rotation1`=0, `rotation2`=-0.374606, `rotation3`=0.927184 WHERE `guid`=6008;

-- Correct position of Iron Deposit in Arathi Highlands (position is off by 0.237693 yards).
UPDATE `gameobject` SET `position_x`=-1139.77, `position_y`=-2089.06, `position_z`=71.3311, `orientation`=2.40855, `rotation0`=0, `rotation1`=0, `rotation2`=0.93358, `rotation3`=0.358368 WHERE `guid`=6362;

-- Correct position of Iron Deposit in Badlands (position is off by 2.77248 yards).
UPDATE `gameobject` SET `position_x`=-6794.99, `position_y`=-3219.91, `position_z`=265.918, `orientation`=1.41372, `rotation0`=0, `rotation1`=0, `rotation2`=0.649447, `rotation3`=0.760406 WHERE `guid`=39965;

-- Correct position of Iron Deposit in Badlands (position is off by 0.442385 yards).
UPDATE `gameobject` SET `position_x`=-7054.84, `position_y`=-2526.41, `position_z`=269.896, `orientation`=1.62316, `rotation0`=0, `rotation1`=0, `rotation2`=0.725374, `rotation3`=0.688355 WHERE `guid`=6445;

-- Correct position of Iron Deposit in Dustwallow Marsh (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-2972.48, `position_y`=-3509.33, `position_z`=63.2665, `orientation`=4.5204, `rotation0`=0, `rotation1`=0, `rotation2`=-0.771625, `rotation3`=0.636078 WHERE `guid`=55938;

-- Correct position of Iron Deposit in Dustwallow Marsh (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-4344.76, `position_y`=-2621.94, `position_z`=37.7756, `orientation`=2.35619, `rotation0`=0, `rotation1`=0, `rotation2`=0.92388, `rotation3`=0.382683 WHERE `guid`=56026;

-- Correct position of Iron Deposit in Hillsbrad Foothills (position is off by 4.74325 yards).
UPDATE `gameobject` SET `position_x`=-156.347, `position_y`=-135.198, `position_z`=114.634, `orientation`=0.750491, `rotation0`=0, `rotation1`=0, `rotation2`=0.366501, `rotation3`=0.930418 WHERE `guid`=6146;

-- Correct position of Iron Deposit in Duskwood (position is off by 1.03319 yards).
UPDATE `gameobject` SET `position_x`=-11099.1, `position_y`=-1155.73, `position_z`=42.4535, `orientation`=0.331611, `rotation0`=0, `rotation1`=0, `rotation2`=0.165047, `rotation3`=0.986286 WHERE `guid`=40741;

-- Correct position of Iron Deposit in Arathi Highlands (position is off by 2.43687 yards).
UPDATE `gameobject` SET `position_x`=-1220.4, `position_y`=-2039.04, `position_z`=43.7159, `orientation`=1.71042, `rotation0`=0, `rotation1`=0, `rotation2`=0.754709, `rotation3`=0.656059 WHERE `guid`=6183;

-- Correct position of Iron Deposit in Stranglethorn Vale (position is off by 0.514325 yards).
UPDATE `gameobject` SET `position_x`=-11468.3, `position_y`=378.432, `position_z`=75.4524, `orientation`=4.20625, `rotation0`=0, `rotation1`=0, `rotation2`=-0.861629, `rotation3`=0.507539 WHERE `guid`=6662;

-- Correct position of Iron Deposit in Tanaris (position is off by 0.879466 yards).
UPDATE `gameobject` SET `position_x`=-7517.91, `position_y`=-4357.27, `position_z`=12.1812, `orientation`=3.59538, `rotation0`=0, `rotation1`=0, `rotation2`=-0.97437, `rotation3`=0.224951 WHERE `guid`=6272;

-- Correct position of Iron Deposit in Searing Gorge (position is off by 0.439579 yards).
UPDATE `gameobject` SET `position_x`=-6833.31, `position_y`=-1762.8, `position_z`=260.022, `orientation`=3.01941, `rotation0`=0, `rotation1`=0, `rotation2`=0.998135, `rotation3`=0.0610518 WHERE `guid`=6014;

-- Correct position of Iron Deposit in Ashenvale (position is off by 0.905657 yards).
UPDATE `gameobject` SET `position_x`=2039.52, `position_y`=-2201.36, `position_z`=120.158, `orientation`=1.69297, `rotation0`=0, `rotation1`=0, `rotation2`=0.748956, `rotation3`=0.66262 WHERE `guid`=6392;

-- Correct position of Iron Deposit in Thousand Needles (position is off by 0.564779 yards).
UPDATE `gameobject` SET `position_x`=-5486.36, `position_y`=-3329.63, `position_z`=-27.7709, `orientation`=2.87979, `rotation0`=0, `rotation1`=0, `rotation2`=0.991445, `rotation3`=0.130528 WHERE `guid`=6031;

-- Correct position of Iron Deposit in Stranglethorn Vale (position is off by 0.969888 yards).
UPDATE `gameobject` SET `position_x`=-12906.5, `position_y`=387.039, `position_z`=53.7599, `orientation`=3.6652, `rotation0`=0, `rotation1`=0, `rotation2`=-0.965925, `rotation3`=0.258821 WHERE `guid`=6470;

-- Correct position of Iron Deposit in Desolace (position is off by 0.86124 yards).
UPDATE `gameobject` SET `position_x`=-1685.51, `position_y`=2907.91, `position_z`=112.984, `orientation`=0.698131, `rotation0`=0, `rotation1`=0, `rotation2`=0.34202, `rotation3`=0.939693 WHERE `guid`=6407;

-- Correct position of Iron Deposit in Thousand Needles (position is off by 0.885341 yards).
UPDATE `gameobject` SET `position_x`=-5061.47, `position_y`=-2103.62, `position_z`=-37.6556, `orientation`=5.79449, `rotation0`=0, `rotation1`=0, `rotation2`=-0.241921, `rotation3`=0.970296 WHERE `guid`=6155;

-- Correct position of Iron Deposit in Tanaris (position is off by 1.82162 yards).
UPDATE `gameobject` SET `position_x`=-7648.39, `position_y`=-4168.19, `position_z`=18.2273, `orientation`=4.39823, `rotation0`=0, `rotation1`=0, `rotation2`=-0.809016, `rotation3`=0.587786 WHERE `guid`=6113;

-- Correct position of Iron Deposit in Duskwood (position is off by 1.35374 yards).
UPDATE `gameobject` SET `position_x`=-10415.6, `position_y`=-1253.79, `position_z`=52.5802, `orientation`=3.49067, `rotation0`=0, `rotation1`=0, `rotation2`=-0.984807, `rotation3`=0.173652 WHERE `guid`=6136;

-- Missing Iron Deposit spawns in Badlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(10244, 1735, 0, -6681.36, -3014.65, 260.138, 3.56047, 0, 0, -0.978148, 0.207912, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6346 at 14.864834 yards.
(10249, 1735, 0, -6170.33, -3384.25, 244.062, 5.61996, 0, 0, -0.325567, 0.945519, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6698 at 55.627674 yards.
(10250, 1735, 0, -6905.36, -2668.86, 250.132, 1.15192, 0, 0, 0.544639, 0.838671, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6235 at 5.779813 yards.
(10277, 1735, 0, -6460.72, -2489.19, 307.971, 2.58308, 0, 0, 0.961261, 0.27564, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6503 at 6.404358 yards.
(10335, 1735, 0, -6975.78, -3110.13, 260.854, 0.226892, 0, 0, 0.113203, 0.993572, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6357 at 74.074280 yards.
(10336, 1735, 0, -7181.32, -3132.52, 274.391, 4.36332, 0, 0, -0.819152, 0.573577, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6471 at 26.747110 yards.
(10337, 1735, 0, -7157.41, -3201.9, 249.293, 4.45059, 0, 0, -0.793353, 0.608762, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6471 at 72.759789 yards.
(10338, 1735, 0, -7077.13, -2696.51, 255.947, 1.50098, 0, 0, 0.681998, 0.731354, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6757 at 6.844467 yards.
(11518, 1735, 0, -7445.42, -2269.32, 231.433, 0.733038, 0, 0, 0.358368, 0.93358, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 11488 at 67.774025 yards.
(10349, 1735, 0, -6110.06, -3428.19, 265.838, 6.23083, 0, 0, -0.0261765, 0.999657, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6416 at 27.683800 yards.
(10359, 1735, 0, -6484.9, -3383.26, 261.872, 1.44862, 0, 0, 0.66262, 0.748956, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 6169 at 69.104378 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(10244, 1287, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Badlands 83 objects total
(10249, 1287, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Badlands 83 objects total
(10250, 1287, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Badlands 83 objects total
(10277, 1287, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Badlands 83 objects total
(10335, 1287, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Badlands 83 objects total
(10336, 1287, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Badlands 83 objects total
(10337, 1287, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Badlands 83 objects total
(10338, 1287, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Badlands 83 objects total
(10349, 1287, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Badlands 83 objects total
(10359, 1287, 0, 'Iron Deposit', 0, 10); -- Iron Deposits in Badlands 83 objects total

-- Missing Iron Deposit spawns in Swamp of Sorrows.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(10124, 1735, 0, -10679.8, -2521.83, 30.6933, 0.925024, 0, 0, 0.446198, 0.894935, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6530 at 33.057987 yards.
(10231, 1735, 0, -10403.8, -2357.67, 86.7584, 5.32326, 0, 0, -0.461748, 0.887011, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6429 at 159.507858 yards.
(10246, 1735, 0, -10618.9, -2629.92, 52.7337, 0.087266, 0, 0, 0.0436192, 0.999048, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6209 at 7.096964 yards.
(10576, 1735, 0, -10514.8, -2467.04, 40.9475, 4.20625, 0, 0, -0.861629, 0.507539, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6533 at 23.415394 yards.
(10591, 1735, 0, -10178.6, -2644.38, 37.9923, 4.85202, 0, 0, -0.656058, 0.75471, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6129 at 39.385044 yards.
(10592, 1735, 0, -10628.5, -2767.37, 50.1937, 1.0472, 0, 0, 0.5, 0.866025, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6214 at 13.024908 yards.
(10593, 1735, 0, -9725.86, -3878.2, 27.4351, 1.309, 0, 0, 0.608761, 0.793354, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6219 at 144.286560 yards.
(10606, 1735, 0, -10055.2, -3113.76, 32.0439, 5.06146, 0, 0, -0.573576, 0.819152, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 6541 at 6.257443 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(10124, 1314, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Swamp of Sorrows (2) 31 objects total
(10231, 1314, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Swamp of Sorrows (2) 31 objects total
(10246, 1314, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Swamp of Sorrows (2) 31 objects total
(10576, 1314, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Swamp of Sorrows (2) 31 objects total
(10591, 1314, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Swamp of Sorrows (2) 31 objects total
(10592, 1314, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Swamp of Sorrows (2) 31 objects total
(10593, 1318, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Swamp of Sorrows (1) 14 objects total
(10606, 1314, 0, 'Iron Deposit', 0, 10); -- Iron Deposits in Swamp of Sorrows (2) 31 objects total

-- Missing Iron Deposit spawns in Duskwood.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(10245, 1735, 0, -10237.8, -1291.58, 46.9721, 5.06146, 0, 0, -0.573576, 0.819152, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6663 at 76.266991 yards.
(10326, 1735, 0, -10362.5, -1404.4, 81.8085, 1.22173, 0, 0, 0.573576, 0.819152, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6663 at 137.158325 yards.
(10339, 1735, 0, -10563.4, -1486.63, 95.4168, 0.0349062, 0, 0, 0.0174522, 0.999848, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6136 at 278.421051 yards.
(40005, 1735, 0, -10678.7, -908.818, 68.4815, 2.65289, 0, 0, 0.970295, 0.241925, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 39985 at 6.364556 yards.
(10580, 1735, 0, -10301.6, -1467.02, 90.2184, 5.91667, 0, 0, -0.182235, 0.983255, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6663 at 128.494156 yards.
(30378, 1735, 0, -11116, -937.882, 66.9419, 1.6057, 0, 0, 0.719339, 0.694659, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 30377 at 117.719292 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(10245, 1118, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Duskwood 16 objects total
(10326, 1118, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Duskwood 16 objects total
(10339, 1118, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Duskwood 16 objects total
(40005, 1118, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Duskwood 16 objects total
(10580, 1118, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Duskwood 16 objects total
(30378, 1118, 0, 'Iron Deposit', 0, 10); -- Iron Deposits in Duskwood 16 objects total

-- Missing Iron Deposit spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(10347, 1735, 0, -3533.33, -2399.93, 66.7631, 3.68265, 0, 0, -0.96363, 0.267241, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6359 at 9.102184 yards.
(10351, 1735, 0, -3587.47, -2433.2, 89.9511, 4.60767, 0, 0, -0.743144, 0.669131, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 6359 at 59.455330 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(10347, 1158, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Wetlands 19 objects total
(10351, 1158, 0, 'Iron Deposit', 0, 10); -- Iron Deposits in Wetlands 19 objects total

-- Missing Iron Deposit spawns in Dustwallow Marsh.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(12108, 1735, 1, -2327.41, -4118.17, 16.9944, 5.68977, 0, 0, -0.292372, 0.956305, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 11761 at 187.727570 yards.
(56027, 1735, 1, -4337.58, -2598.09, 41.2869, 5.39307, 0, 0, -0.430511, 0.902586, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 56026 at 25.162874 yards.
(55940, 1735, 1, -3192.54, -3406.31, 14.8458, 5.21854, 0, 0, -0.507538, 0.861629, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 55938 at 247.754013 yards.
(55963, 1735, 1, -2819.24, -4116.35, 45.4726, 4.17134, 0, 0, -0.870356, 0.492424, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 55962 at 195.131042 yards.
(55966, 1735, 1, -2715.27, -3905.9, 66.2966, 4.66003, 0, 0, -0.725374, 0.688355, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 55962 at 335.288147 yards.
(55969, 1735, 1, -2694.8, -4296.36, 8.4852, 2.46091, 0, 0, 0.942641, 0.333808, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 55962 at 69.274277 yards.
(13673, 1735, 1, -3240.65, -3501.07, 19.8705, 4.41568, 0, 0, -0.803857, 0.594823, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 13669 at 176.451920 yards.
(56058, 1735, 1, -4427.89, -2987.49, 30.9241, 4.46804, 0, 0, -0.788011, 0.615662, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 56057 at 48.070900 yards.
(13674, 1735, 1, -3279.71, -3840.21, 52.5267, 2.51327, 0, 0, 0.951056, 0.309017, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 13669 at 316.011597 yards.
(13675, 1735, 1, -3661.02, -3836.26, 6.66474, 3.87463, 0, 0, -0.93358, 0.358368, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 13669 at 378.476410 yards.
(55970, 1735, 1, -2557.49, -3790, 13.52, 0.750491, 0, 0, 0.366501, 0.930418, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 55962 at 456.521393 yards.
(56032, 1735, 1, -3782.45, -2723.36, 63.6209, 4.53786, 0, 0, -0.766044, 0.642789, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 56026 at 571.965332 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(56027, 43520, 0, 'Iron Deposit', 0, 10), -- Dustwallow Marsh: Iron Vein
(55940, 43520, 0, 'Iron Deposit', 0, 10), -- Dustwallow Marsh: Iron Vein
(55963, 43520, 0, 'Iron Deposit', 0, 10), -- Dustwallow Marsh: Iron Vein
(55966, 43520, 0, 'Iron Deposit', 0, 10), -- Dustwallow Marsh: Iron Vein
(55969, 43520, 0, 'Iron Deposit', 0, 10), -- Dustwallow Marsh: Iron Vein
(56058, 43520, 0, 'Iron Deposit', 0, 10), -- Dustwallow Marsh: Iron Vein
(55970, 43520, 0, 'Iron Deposit', 0, 10), -- Dustwallow Marsh: Iron Vein
(56032, 43520, 0, 'Iron Deposit', 0, 10); -- Dustwallow Marsh: Iron Vein

-- Missing Iron Deposit spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(29580, 1735, 0, -12639.2, -39.5763, 27.4667, 0.488691, 0, 0, 0.241921, 0.970296, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 29533 at 259.329224 yards.
(29581, 1735, 0, -12676.2, -179.953, 36.221, 0.0349062, 0, 0, 0.0174522, 0.999848, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 29533 at 114.529526 yards.
(12156, 1735, 0, -11486.6, -744.597, 35.9581, 1.93731, 0, 0, 0.824125, 0.566408, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 12047 at 41.507542 yards.
(12166, 1735, 0, -11596, -510.279, 28.4238, 6.23083, 0, 0, -0.0261765, 0.999657, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 11969 at 200.987167 yards.
(10586, 1735, 0, -13521.4, 646.87, 10.4685, 0.244346, 0, 0, 0.121869, 0.992546, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6053 at 372.134155 yards.
(12168, 1735, 0, -11935, 543.475, 33.0384, 2.47837, 0, 0, 0.945518, 0.325568, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 12133 at 226.371460 yards.
(29277, 1735, 0, -11771.9, 35.4992, 17.5232, 1.3439, 0, 0, 0.622514, 0.782609, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 29267 at 156.856659 yards.
(32490, 1735, 0, -11934, 458.191, 44.5061, 6.19592, 0, 0, -0.0436192, 0.999048, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 32486 at 154.478836 yards.
(12173, 1735, 0, -11755.1, -547.294, 23.6612, 2.87979, 0, 0, 0.991445, 0.130528, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 11969 at 125.045158 yards.
(10617, 1735, 0, -11518.7, -861.167, 72.1001, 6.16101, 0, 0, -0.0610485, 0.998135, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6030 at 62.098492 yards.
(10618, 1735, 0, -11398.9, -826.872, 15.511, 3.35105, 0, 0, -0.994521, 0.104536, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6731 at 56.387070 yards.
(10619, 1735, 0, -11490.4, 276.76, 22.9154, 4.50295, 0, 0, -0.777145, 0.629321, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 6258 at 100.724602 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(29580, 1175, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Stranglethorn 44 objects total
(29581, 1175, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Stranglethorn 44 objects total
(12156, 1175, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Stranglethorn 44 objects total
(12166, 1175, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Stranglethorn 44 objects total
(10586, 1175, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Stranglethorn 44 objects total
(12168, 1175, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Stranglethorn 44 objects total
(29277, 1175, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Stranglethorn 44 objects total
(32490, 1175, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Stranglethorn 44 objects total
(12173, 1175, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Stranglethorn 44 objects total
(10617, 1175, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Stranglethorn 44 objects total
(10618, 1175, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Stranglethorn 44 objects total
(10619, 1175, 0, 'Iron Deposit', 0, 10); -- Iron Deposits in Stranglethorn 44 objects total

-- Missing Iron Deposit spawns in Alterac Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(9907, 1735, 0, 648.067, -590.311, 164.735, 0.122173, 0, 0, 0.0610485, 0.998135, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6410 at 21.659430 yards.
(10230, 1735, 0, 1216.42, -459.816, 69.9228, 2.47837, 0, 0, 0.945518, 0.325568, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6591 at 28.593275 yards.
(33185, 1735, 0, 264.654, -44.6943, 124.458, 5.11382, 0, 0, -0.551936, 0.833886, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 33179 at 127.650467 yards.
(33186, 1735, 0, 448.832, 7.38818, 140.777, 2.02458, 0, 0, 0.848047, 0.529921, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 33179 at 166.413574 yards.
(10238, 1735, 0, 271.415, -259.615, 148.774, 2.1293, 0, 0, 0.874619, 0.48481, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6441 at 8.850666 yards.
(33135, 1735, 0, 545.352, -1686.1, 57.1031, 2.91469, 0, 0, 0.993571, 0.113208, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 33134 at 129.793106 yards.
(32314, 1735, 0, 444.986, -906.441, 132.939, 5.34071, 0, 0, -0.45399, 0.891007, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 32193 at 89.344170 yards.
(33290, 1735, 0, 627.304, -724.827, 188.74, 4.11898, 0, 0, -0.882947, 0.469473, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 33190 at 37.683449 yards.
(10341, 1735, 0, 550.242, -438.635, 170.444, 4.15388, 0, 0, -0.874619, 0.48481, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6026 at 33.839478 yards.
(10342, 1735, 0, 802.018, -298.852, 140.517, 0.95993, 0, 0, 0.461748, 0.887011, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6248 at 113.183083 yards.
(10343, 1735, 0, 500.147, -106.041, 146.138, 4.10153, 0, 0, -0.887011, 0.461749, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6275 at 52.134834 yards.
(35403, 1735, 0, 243.813, -247.871, 147.019, 3.45576, 0, 0, -0.987688, 0.156436, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 35399 at 15.935924 yards.
(10571, 1735, 0, 617.05, -648.97, 154.328, 6.14356, 0, 0, -0.0697556, 0.997564, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6688 at 19.348444 yards.
(10583, 1735, 0, 779.732, -346.297, 151.973, 1.06465, 0, 0, 0.507538, 0.861629, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6248 at 69.679459 yards.
(35375, 1735, 0, 502.952, -1391.69, 72.4759, 6.03884, 0, 0, -0.121869, 0.992546, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 35374 at 71.351273 yards.
(10615, 1735, 0, 663.022, -590.838, 161.983, 0.767944, 0, 0, 0.374606, 0.927184, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 6410 at 7.635174 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(9907, 1068, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Alterac 78 objects total
(10230, 1068, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Alterac 78 objects total
(33185, 1068, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Alterac 78 objects total
(33186, 1068, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Alterac 78 objects total
(10238, 1068, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Alterac 78 objects total
(32314, 1068, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Alterac 78 objects total
(33290, 1068, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Alterac 78 objects total
(10341, 1068, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Alterac 78 objects total
(10342, 1068, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Alterac 78 objects total
(10343, 1068, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Alterac 78 objects total
(35403, 1068, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Alterac 78 objects total
(10571, 1068, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Alterac 78 objects total
(10583, 1068, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Alterac 78 objects total
(10615, 1068, 0, 'Iron Deposit', 0, 10); -- Iron Deposits in Alterac 78 objects total

-- Missing Iron Deposit spawns in Arathi Highlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(9859, 1735, 0, -1974.64, -2760.31, 80.9394, 0.314158, 0, 0, 0.156434, 0.987688, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6482 at 19.898153 yards.
(9860, 1735, 0, -762.899, -3238.2, 91.8026, 2.40855, 0, 0, 0.93358, 0.358368, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6644 at 17.960270 yards.
(10229, 1735, 0, -1966.79, -2348.83, 60.9744, 4.62512, 0, 0, -0.737277, 0.675591, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6589 at 79.946304 yards.
(10235, 1735, 0, -936.717, -1556.4, 58.4301, 2.32129, 0, 0, 0.91706, 0.39875, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6309 at 12.134856 yards.
(10236, 1735, 0, -1251.6, -2065.47, 50.7246, 0.087266, 0, 0, 0.0436192, 0.999048, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6746 at 7.885101 yards.
(10239, 1735, 0, -961.645, -2236.57, 58.6912, 3.47321, 0, 0, -0.986285, 0.16505, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6756 at 18.623573 yards.
(10240, 1735, 0, -1906.57, -3145.93, 69.5193, 2.53072, 0, 0, 0.953716, 0.300708, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6713 at 97.581070 yards.
(10241, 1735, 0, -1748.22, -2094.48, 68.8157, 2.70526, 0, 0, 0.976295, 0.216442, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6660 at 38.922791 yards.
(10242, 1735, 0, -915.477, -1973.57, 53.7444, 1.71042, 0, 0, 0.754709, 0.656059, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6480 at 167.997375 yards.
(16759, 1735, 0, -2241.74, -1640.24, -21.8187, 0.558504, 0, 0, 0.275637, 0.961262, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 16745 at 75.270020 yards.
(10247, 1735, 0, -795.956, -3359.17, 84.0471, 5.53269, 0, 0, -0.366501, 0.930418, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6086 at 21.035952 yards.
(16760, 1735, 0, -2280.09, -1525.94, -33.5753, 1.39626, 0, 0, 0.642787, 0.766045, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 16752 at 136.950104 yards.
(10331, 1735, 0, -990.192, -2587.46, 65.2202, 1.97222, 0, 0, 0.833885, 0.551938, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6377 at 62.728207 yards.
(16761, 1735, 0, -2183.83, -1728.47, -63.0671, 1.46608, 0, 0, 0.66913, 0.743145, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 16745 at 119.123642 yards.
(10333, 1735, 0, -740.197, -2164.02, 54.8543, 2.82743, 0, 0, 0.987688, 0.156436, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6695 at 68.924614 yards.
(10334, 1735, 0, -914.584, -3627.3, 88.1162, 2.72271, 0, 0, 0.978148, 0.207912, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6035 at 143.626740 yards.
(10340, 1735, 0, -809.747, -2334.22, 71.9745, 4.71239, 0, 0, -0.707107, 0.707107, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6422 at 76.355812 yards.
(15059, 1735, 0, -2249.11, -1888.32, 18.0896, 4.39823, 0, 0, -0.809016, 0.587786, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 15048 at 176.566101 yards.
(16765, 1735, 0, -2119.26, -1633.36, -26.2676, 4.2237, 0, 0, -0.857167, 0.515038, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 16752 at 82.557434 yards.
(10353, 1735, 0, -1189.47, -3085.4, 47.0624, 4.95674, 0, 0, -0.615661, 0.788011, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6196 at 20.407278 yards.
(10354, 1735, 0, -1161.66, -2044.55, 37.005, 0.296705, 0, 0, 0.147809, 0.989016, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6356 at 10.058452 yards.
(10585, 1735, 0, -892.058, -2428.34, 62.8315, 3.03684, 0, 0, 0.998629, 0.0523532, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6092 at 47.594543 yards.
(10596, 1735, 0, -1281.79, -2677.53, 66.1927, 2.11185, 0, 0, 0.870356, 0.492424, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6363 at 20.640001 yards.
(10602, 1735, 0, -972.981, -3184.12, 52.1261, 5.49779, 0, 0, -0.382683, 0.92388, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 6587 at 38.222454 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(9859, 1186, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Arathi 182 objects total
(9860, 1186, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Arathi 182 objects total
(10229, 1186, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Arathi 182 objects total
(10235, 1186, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Arathi 182 objects total
(10236, 1186, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Arathi 182 objects total
(10239, 1186, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Arathi 182 objects total
(10240, 1186, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Arathi 182 objects total
(10241, 1186, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Arathi 182 objects total
(10242, 1186, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Arathi 182 objects total
(10247, 1186, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Arathi 182 objects total
(16760, 1186, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Arathi 182 objects total
(10331, 1186, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Arathi 182 objects total
(10333, 1186, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Arathi 182 objects total
(10334, 1186, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Arathi 182 objects total
(10340, 1186, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Arathi 182 objects total
(16765, 1186, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Arathi 182 objects total
(10353, 1186, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Arathi 182 objects total
(10354, 1186, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Arathi 182 objects total
(10585, 1186, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Arathi 182 objects total
(10596, 1186, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Arathi 182 objects total
(10602, 1186, 0, 'Iron Deposit', 0, 10); -- Iron Deposits in Arathi 182 objects total

-- Missing Iron Deposit spawns in The Hinterlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(10282, 1735, 0, -318.155, -3241.78, 137.564, 0.122173, 0, 0, 0.0610485, 0.998135, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6493 at 33.055527 yards.
(10332, 1735, 0, 167.071, -2509.18, 136.759, 1.39626, 0, 0, 0.642787, 0.766045, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6452 at 248.581619 yards.
(10575, 1735, 0, 187.713, -3077.86, 138.235, 0.802851, 0, 0, 0.390731, 0.920505, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6291 at 8.186250 yards.
(10597, 1735, 0, -39.0903, -2395.62, 152.759, 3.6652, 0, 0, -0.965925, 0.258821, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 6452 at 19.148710 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(10282, 279, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in The Hinterlands
(10332, 279, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in The Hinterlands
(10575, 279, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in The Hinterlands
(10597, 279, 0, 'Iron Deposit', 0, 10); -- Iron Deposits in The Hinterlands

-- Missing Iron Deposit spawns in Hillsbrad Foothills.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(29655, 1735, 0, -1212.15, -1247.16, 52.4297, 3.35105, 0, 0, -0.994521, 0.104536, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 29651 at 78.499451 yards.
(29659, 1735, 0, -1179.44, -1261.21, 50.4825, 5.70723, 0, 0, -0.284015, 0.95882, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 29651 at 57.301006 yards.
(10233, 1735, 0, -271.124, -337.963, 64.5877, 6.14356, 0, 0, -0.0697556, 0.997564, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6191 at 59.812698 yards.
(10237, 1735, 0, -498.583, -1658.01, 84.0551, 2.37364, 0, 0, 0.927183, 0.374608, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6239 at 9.870501 yards.
(10281, 1735, 0, -256.987, -1494.96, 100.147, 6.16101, 0, 0, -0.0610485, 0.998135, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6123 at 100.771805 yards.
(10293, 1735, 0, -261.954, -1771.5, 128.367, 0.418879, 0, 0, 0.207911, 0.978148, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6750 at 18.798830 yards.
(10350, 1735, 0, -1373.79, -1072.68, 19.7061, 2.21657, 0, 0, 0.894934, 0.446199, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6060 at 29.989584 yards.
(10361, 1735, 0, -356.236, -1705.29, 96.5566, 5.49779, 0, 0, -0.382683, 0.92388, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6222 at 63.241730 yards.
(30074, 1735, 0, -274.632, -415.753, 68.9685, 4.20625, 0, 0, -0.861629, 0.507539, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 30035 at 133.000931 yards.
(30103, 1735, 0, 321.191, -1061.54, 97.7876, 1.83259, 0, 0, 0.793353, 0.608762, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 30034 at 744.722107 yards.
(10594, 1735, 0, -166.388, -198.118, 109.465, 2.51327, 0, 0, 0.951056, 0.309017, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6146 at 66.047218 yards.
(30105, 1735, 0, -188.376, -353.486, 54.2951, 1.0472, 0, 0, 0.5, 0.866025, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 30035 at 45.379368 yards.
(30106, 1735, 0, -200.169, -357.171, 72.8802, 1.88495, 0, 0, 0.809016, 0.587786, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 30035 at 45.506702 yards.
(30110, 1735, 0, -175.098, -386.277, 51.7808, 1.93731, 0, 0, 0.824125, 0.566408, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 30035 at 78.461746 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(29655, 1070, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Hillsbrad 182 objects total
(29659, 1070, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Hillsbrad 182 objects total
(10233, 1070, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Hillsbrad 33 objects total
(10237, 1070, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Hillsbrad 182 objects total
(10281, 1070, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Hillsbrad 33 objects total
(10350, 1070, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Hillsbrad 33 objects total
(30074, 1070, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Hillsbrad 33 objects total
(30103, 1070, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Hillsbrad 33 objects total
(10594, 1070, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Hillsbrad 33 objects total
(30105, 1070, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Hillsbrad 33 objects total
(30106, 1070, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Hillsbrad 33 objects total
(30110, 1070, 0, 'Iron Deposit', 0, 10); -- Iron Deposits in Hillsbrad 33 objects total

-- Missing Iron Deposit spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(10344, 1735, 1, 2480.12, -2480.06, 183.31, 5.2709, 0, 0, -0.484809, 0.87462, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6195 at 74.198097 yards.
(48415, 1735, 1, 2503.89, -3679.43, 63.2847, 1.65806, 0, 0, 0.737277, 0.675591, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 48138 at 615.468201 yards.
(10356, 1735, 1, 2129.54, -2191.22, 150.562, 2.58308, 0, 0, 0.961261, 0.27564, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6392 at 94.702240 yards.
(10357, 1735, 1, 2185.05, -2803.73, 128.734, 1.16937, 0, 0, 0.551936, 0.833886, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6058 at 68.865410 yards.
(10358, 1735, 1, 2690.09, -2019.96, 169.427, 2.25147, 0, 0, 0.902585, 0.430512, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6415 at 50.731663 yards.
(10570, 1735, 1, 3209.16, -1811.62, 189.909, 1.8675, 0, 0, 0.803857, 0.594823, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6725 at 230.209946 yards.
(10581, 1735, 1, 2536.39, -2015.46, 152.15, 4.4855, 0, 0, -0.782608, 0.622515, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6006 at 68.798538 yards.
(10600, 1735, 1, 1739.69, -2038.2, 108.563, 0.383971, 0, 0, 0.190808, 0.981627, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6118 at 80.990387 yards.
(10608, 1735, 1, 1355.24, -1953.8, 141.523, 5.53269, 0, 0, -0.366501, 0.930418, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6694 at 95.741150 yards.
(10610, 1735, 1, 3012.81, -1648.72, 199.679, 4.72984, 0, 0, -0.700909, 0.713251, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6725 at 40.602573 yards.
(10611, 1735, 1, 2810.71, -1888.54, 194.402, 2.23402, 0, 0, 0.898793, 0.438373, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6710 at 56.544052 yards.
(10616, 1735, 1, 1965.24, -2903.04, 109.934, 4.60767, 0, 0, -0.743144, 0.669131, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6467 at 10.100490 yards.
(48447, 1735, 1, 1629.99, -3425.47, 152.353, 5.60251, 0, 0, -0.333807, 0.942641, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 48139 at 133.930603 yards.
(48456, 1735, 1, 2227.35, -3529.37, 54.6161, 5.20108, 0, 0, -0.515038, 0.857168, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 48138 at 311.185760 yards.
(48484, 1735, 1, 2772.39, -3572.61, 119.582, 3.29869, 0, 0, -0.996917, 0.0784664, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 48140 at 792.544617 yards.
(48485, 1735, 1, 2042.96, -3541.44, 98.8403, 3.97935, 0, 0, -0.913545, 0.406738, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 48138 at 234.969727 yards.
(10620, 1735, 1, 2244.52, -2069.69, 113.951, 2.07694, 0, 0, 0.861629, 0.507539, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 6192 at 75.191460 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(10344, 1079, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Ashenvale 58 objects total
(48415, 1079, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Ashenvale 58 objects total
(10356, 1079, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Ashenvale 58 objects total
(10357, 1079, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Ashenvale 58 objects total
(10358, 1079, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Ashenvale 58 objects total
(10570, 1079, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Ashenvale 58 objects total
(10581, 1079, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Ashenvale 58 objects total
(10600, 1079, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Ashenvale 58 objects total
(10608, 1079, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Ashenvale 58 objects total
(10610, 1079, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Ashenvale 58 objects total
(10611, 1079, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Ashenvale 58 objects total
(10616, 1079, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Ashenvale 58 objects total
(48447, 1079, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Ashenvale 58 objects total
(48456, 1079, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Ashenvale 58 objects total
(48484, 1079, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Ashenvale 58 objects total
(48485, 1079, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Ashenvale 58 objects total
(10620, 1079, 0, 'Iron Deposit', 0, 10); -- Iron Deposits in Ashenvale 58 objects total

-- Missing Iron Deposit spawns in Feralas.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(50108, 1735, 1, -4017.34, 529.486, 99.249, 5.06146, 0, 0, -0.573576, 0.819152, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 50024 at 217.301529 yards.
(50245, 1735, 1, -4493.3, 761.976, 69.7072, 5.42797, 0, 0, -0.414693, 0.909961, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 50162 at 116.904900 yards.
(10573, 1735, 1, -5092.58, 1902.77, 89.6925, 4.25861, 0, 0, -0.848047, 0.529921, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6249 at 13.249966 yards.
(10621, 1735, 1, -4152.17, -196.633, 63.744, 4.39823, 0, 0, -0.809016, 0.587786, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 6696 at 221.623840 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(50108, 1196, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Feralas 30 objects total
(50245, 1196, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Feralas 30 objects total
(10573, 1196, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Feralas 30 objects total
(10621, 1196, 0, 'Iron Deposit', 0, 10); -- Iron Deposits in Feralas 30 objects total

-- Missing Iron Deposit spawns in Thousand Needles.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(17249, 1735, 1, -5997.79, -3502.85, -55.509, 0.541051, 0, 0, 0.267238, 0.963631, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 17190 at 261.929291 yards.
(9857, 1735, 1, -6669.38, -3510.05, -55.2365, 0.104719, 0, 0, 0.0523357, 0.99863, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6318 at 18.774633 yards.
(9858, 1735, 1, -5418.67, -3033.57, -33.8258, 0.0174525, 0, 0, 0.00872612, 0.999962, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6089 at 15.197531 yards.
(10243, 1735, 1, -5673.35, -3048.78, -44.674, 5.14872, 0, 0, -0.537299, 0.843392, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6016 at 96.082924 yards.
(10346, 1735, 1, -5745.73, -3374.91, -36.3462, 2.14675, 0, 0, 0.878817, 0.47716, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6531 at 12.893941 yards.
(10348, 1735, 1, -5788.96, -3886.07, -94.2955, 4.60767, 0, 0, -0.743144, 0.669131, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6676 at 36.885067 yards.
(10352, 1735, 1, -5696.34, -3242.83, -35.4584, 0.855211, 0, 0, 0.414693, 0.909961, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6150 at 57.107155 yards.
(10574, 1735, 1, -4774.29, -1954.05, -48.3147, 5.96903, 0, 0, -0.156434, 0.987688, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6098 at 16.877234 yards.
(10577, 1735, 1, -5466.35, -2869.42, -44.2802, 6.17847, 0, 0, -0.0523357, 0.99863, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6255 at 14.503681 yards.
(10578, 1735, 1, -5489.34, -1611.09, 28.4255, 1.93731, 0, 0, 0.824125, 0.566408, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6578 at 12.836982 yards.
(10579, 1735, 1, -5024.05, -1225.72, -43.9318, 5.89921, 0, 0, -0.190808, 0.981627, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6722 at 19.352739 yards.
(10584, 1735, 1, -4933.02, -2261.19, -65.3333, 2.61799, 0, 0, 0.965925, 0.258821, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6378 at 66.683395 yards.
(17253, 1735, 1, -5112.55, -2418.23, -49.4608, 5.34071, 0, 0, -0.45399, 0.891007, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 17194 at 90.564255 yards.
(10598, 1735, 1, -5404.91, -1701.34, -40.4254, 3.00195, 0, 0, 0.997563, 0.0697661, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6265 at 81.270691 yards.
(10599, 1735, 1, -5506.93, -1633.27, 25.4443, 1.72787, 0, 0, 0.760406, 0.649449, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6170 at 5.372316 yards.
(10603, 1735, 1, -5532.84, -1944.92, -58.501, 3.87463, 0, 0, -0.93358, 0.358368, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6216 at 25.222111 yards.
(10604, 1735, 1, -4810.13, -1983.76, -53.1975, 2.56563, 0, 0, 0.958819, 0.284016, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6180 at 37.908047 yards.
(10605, 1735, 1, -5326.44, -2796.01, -47.6895, 1.71042, 0, 0, 0.754709, 0.656059, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6576 at 54.545162 yards.
(10607, 1735, 1, -6714.54, -3789.62, -24.6829, 5.46288, 0, 0, -0.398748, 0.91706, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6097 at 149.653137 yards.
(10609, 1735, 1, -4624.08, -1479.37, -48.9603, 1.23918, 0, 0, 0.580703, 0.814116, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6282 at 30.958391 yards.
(10612, 1735, 1, -4521.09, -1129.81, -52.7595, 6.03884, 0, 0, -0.121869, 0.992546, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 6080 at 214.813232 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(17249, 1132, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Thousand Needles 102 objects total
(9858, 1132, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Thousand Needles 102 objects total
(10243, 1132, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Thousand Needles 102 objects total
(10346, 1132, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Thousand Needles 102 objects total
(10348, 1132, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Thousand Needles 102 objects total
(10352, 1132, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Thousand Needles 102 objects total
(10574, 1132, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Thousand Needles 102 objects total
(10577, 1132, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Thousand Needles 102 objects total
(10578, 1132, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Thousand Needles 102 objects total
(10579, 1132, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Thousand Needles 102 objects total
(10584, 1132, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Thousand Needles 102 objects total
(17253, 1132, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Thousand Needles 102 objects total
(10598, 1132, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Thousand Needles 102 objects total
(10599, 1132, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Thousand Needles 102 objects total
(10603, 1132, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Thousand Needles 102 objects total
(10604, 1132, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Thousand Needles 102 objects total
(10605, 1132, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Thousand Needles 102 objects total
(10607, 1132, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Thousand Needles 102 objects total
(10609, 1132, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Thousand Needles 102 objects total
(10612, 1132, 0, 'Iron Deposit', 0, 10); -- Iron Deposits in Thousand Needles 102 objects total

-- Missing Iron Deposit spawns in Desolace.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(10082, 1735, 1, -905.967, 1554.35, 65.5055, 0.104719, 0, 0, 0.0523357, 0.99863, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6617 at 50.352337 yards.
(10232, 1735, 1, -541.81, 1972.59, 99.6952, 4.62512, 0, 0, -0.737277, 0.675591, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6647 at 131.754227 yards.
(20843, 1735, 1, -1661.28, 804.258, 113.704, 3.4383, 0, 0, -0.989016, 0.147811, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 20796 at 433.222260 yards.
(10248, 1735, 1, -1780.7, 2332.43, 78.9031, 5.41052, 0, 0, -0.422618, 0.906308, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6231 at 44.158211 yards.
(20844, 1735, 1, -1956.47, 1002.19, 120.009, 1.51844, 0, 0, 0.688354, 0.725374, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 20796 at 202.774490 yards.
(20846, 1735, 1, -2191.98, 2111.58, 82.0862, 5.5676, 0, 0, -0.350207, 0.936672, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 20770 at 189.698120 yards.
(10279, 1735, 1, -1256.88, 886.57, 113.211, 4.06662, 0, 0, -0.894934, 0.446199, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6453 at 221.329010 yards.
(10280, 1735, 1, -274.474, 1849.42, 171.919, 6.17847, 0, 0, -0.0523357, 0.99863, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6647 at 254.281815 yards.
(20847, 1735, 1, -884.113, 1800.19, 69.0845, 4.53786, 0, 0, -0.766044, 0.642789, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 20815 at 59.888477 yards.
(10323, 1735, 1, -1146.26, 841.045, 135.752, 0.157079, 0, 0, 0.0784588, 0.996917, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6453 at 111.220543 yards.
(10328, 1735, 1, -953.958, 858.162, 96.9176, 6.19592, 0, 0, -0.0436192, 0.999048, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6699 at 59.431236 yards.
(10329, 1735, 1, -1619.46, 1323.85, 85.8146, 1.0472, 0, 0, 0.5, 0.866025, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6373 at 91.917953 yards.
(10330, 1735, 1, -654.898, 903.117, 120.886, 0.698131, 0, 0, 0.34202, 0.939693, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6140 at 35.092171 yards.
(10345, 1735, 1, -1352.43, 891.679, 112.672, 1.51844, 0, 0, 0.688354, 0.725374, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6418 at 268.786896 yards.
(10582, 1735, 1, -505.308, 1586.65, 101.761, 4.97419, 0, 0, -0.608761, 0.793354, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6737 at 45.645824 yards.
(20848, 1735, 1, -1094.26, 2691.54, 123.094, 5.21854, 0, 0, -0.507538, 0.861629, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 20792 at 38.701473 yards.
(10589, 1735, 1, -808.286, 1245.34, 98.5527, 5.02655, 0, 0, -0.587785, 0.809017, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6238 at 56.437748 yards.
(10590, 1735, 1, -1079.68, 1495.66, 69.8399, 3.07177, 0, 0, 0.999391, 0.0349061, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6211 at 193.351135 yards.
(10595, 1735, 1, -1441.55, 1129.64, 97.3767, 5.11382, 0, 0, -0.551936, 0.833886, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6592 at 65.846458 yards.
(10601, 1735, 1, -1783.48, 1617.22, 79.1153, 0.541051, 0, 0, 0.267238, 0.963631, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6457 at 264.188477 yards.
(20849, 1735, 1, -1002.77, 2398.7, 101.129, 2.58308, 0, 0, 0.961261, 0.27564, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 20790 at 148.102219 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(10082, 1141, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Desolace 86 objects total
(10232, 1141, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Desolace 86 objects total
(20843, 1141, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Desolace 86 objects total
(10248, 1141, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Desolace 86 objects total
(20844, 1141, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Desolace 86 objects total
(20846, 1141, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Desolace 86 objects total
(10279, 1141, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Desolace 86 objects total
(10280, 1141, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Desolace 86 objects total
(20847, 1141, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Desolace 86 objects total
(10323, 1141, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Desolace 86 objects total
(10328, 1141, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Desolace 86 objects total
(10329, 1141, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Desolace 86 objects total
(10330, 1141, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Desolace 86 objects total
(10345, 1141, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Desolace 86 objects total
(10582, 1141, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Desolace 86 objects total
(20848, 1141, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Desolace 86 objects total
(10589, 1141, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Desolace 86 objects total
(10590, 1141, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Desolace 86 objects total
(10595, 1141, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Desolace 86 objects total
(10601, 1141, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Desolace 86 objects total
(20849, 1141, 0, 'Iron Deposit', 0, 10); -- Iron Deposits in Desolace 86 objects total

-- Missing Iron Deposit spawns in Stonetalon Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(10355, 1735, 1, 824.478, 1724.76, -15.1428, 4.88692, 0, 0, -0.642787, 0.766045, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6497 at 63.094124 yards.
(10587, 1735, 1, 641.753, 1416.86, 9.3058, 2.75761, 0, 0, 0.981627, 0.190812, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 6319 at 103.598862 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(10355, 1091, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Stonetalon 23 objects total
(10587, 1091, 0, 'Iron Deposit', 0, 10); -- Iron Deposits in Stonetalon 23 objects total

-- Missing Iron Deposit spawns in Tanaris.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(10324, 1735, 1, -7717.82, -4544.33, 9.15551, 5.58505, 0, 0, -0.34202, 0.939693, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6426 at 54.466942 yards.
(10325, 1735, 1, -7965.87, -5080.34, 19.4028, 0.977383, 0, 0, 0.469471, 0.882948, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6406 at 66.000648 yards.
(17454, 1735, 1, -8121.62, -5194.75, 17.8264, 3.71755, 0, 0, -0.958819, 0.284016, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 17449 at 104.771210 yards.
(17455, 1735, 1, -7255.52, -4241.1, 18.2609, 1.13446, 0, 0, 0.537299, 0.843392, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 17452 at 123.633339 yards.
(10360, 1735, 1, -7591.08, -4094.75, 11.661, 0.59341, 0, 0, 0.292371, 0.956305, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6491 at 8.957023 yards.
(10572, 1735, 1, -7769.18, -4483.9, 13.7021, 4.90438, 0, 0, -0.636078, 0.771625, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6345 at 49.341434 yards.
(10588, 1735, 1, -7735.29, -2826.04, 12.2225, 4.66003, 0, 0, -0.725374, 0.688355, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 6147 at 14.212698 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(10324, 1200, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Tanaris 47 objects total
(10325, 1200, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Tanaris 47 objects total
(17454, 1200, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Tanaris 47 objects total
(17455, 1200, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Tanaris 47 objects total
(10360, 1200, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Tanaris 47 objects total
(10572, 1200, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Tanaris 47 objects total
(10588, 1200, 0, 'Iron Deposit', 0, 10); -- Iron Deposits in Tanaris 47 objects total

-- Missing Iron Deposit spawns in Uldaman.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(33289, 1735, 0, -6191.4, -3057.34, 214.469, 1.44862, 0, 0, 0.66262, 0.748956, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 33204 at 20.412785 yards.
(10327, 1735, 0, -6084.95, -3034.08, 250.361, 3.99681, 0, 0, -0.909961, 0.414694, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6367 at 8.172177 yards.
(33291, 1735, 0, -6172.92, -3007.9, 226.637, 0.610863, 0, 0, 0.300705, 0.953717, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 33204 at 34.016712 yards.
(33292, 1735, 0, -6083.84, -3166.85, 255.265, 3.83973, 0, 0, -0.939692, 0.34202, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 33191 at 72.403687 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(33289, 1287, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Badlands 83 objects total
(10327, 1287, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Badlands 83 objects total
(33291, 1287, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Badlands 83 objects total
(33292, 1287, 0, 'Iron Deposit', 0, 10); -- Iron Deposits in Badlands 83 objects total

-- Guid 9857 should be part of pool Iron Deposits in Thousand Needles 102 objects total (1132).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (9857, 1132, 0, 'Iron Deposit', 0, 10);

-- Guid 10293 should be part of pool Iron Deposits in Hillsbrad 33 objects total (1070).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (10293, 1070, 0, 'Iron Deposit', 0, 10);

-- Guid 10361 should be part of pool Iron Deposits in Hillsbrad 33 objects total (1070).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (10361, 1070, 0, 'Iron Deposit', 0, 10);

-- Guid 11518 should be part of pool Iron Deposits in Badlands 83 objects total (1287).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (11518, 1287, 0, 'Iron Deposit', 0, 10);

-- Guid 12108 should be part of pool Dustwallow Marsh: Iron Vein (43520).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (12108, 43520, 0, 'Iron Deposit', 0, 10);

-- Guid 13673 should be part of pool Dustwallow Marsh: Iron Vein (43520).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (13673, 43520, 0, 'Iron Deposit', 0, 10);

-- Guid 13674 should be part of pool Dustwallow Marsh: Iron Vein (43520).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (13674, 43520, 0, 'Iron Deposit', 0, 10);

-- Guid 13675 should be part of pool Dustwallow Marsh: Iron Vein (43520).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (13675, 43520, 0, 'Iron Deposit', 0, 10);

-- Guid 15059 should be part of pool Iron Deposits in Arathi 182 objects total (1186).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (15059, 1186, 0, 'Iron Deposit', 0, 10);

-- Guid 16759 should be part of pool Iron Deposits in Arathi 182 objects total (1186).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (16759, 1186, 0, 'Iron Deposit', 0, 10);

-- Guid 16761 should be part of pool Iron Deposits in Arathi 182 objects total (1186).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (16761, 1186, 0, 'Iron Deposit', 0, 10);

-- Guid 33135 should be part of pool Iron Deposits in Hillsbrad 33 objects total (1070).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (33135, 1070, 0, 'Iron Deposit', 0, 10);

-- Guid 35375 should be part of pool Iron Deposits in Hillsbrad 33 objects total (1070).
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (35375, 1070, 0, 'Iron Deposit', 0, 10);

UPDATE `pool_template` SET `description`='Iron Deposits in Dustwallow Marsh' WHERE  `entry`=43520;

UPDATE `pool_gameobject` SET `description`='Iron Deposit' WHERE  `guid` IN (
55938,
55948,
55950,
55954,
55962,
56021,
56026,
56057
);

-- GOLD ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Correct position of Gold Vein in Swamp of Sorrows (position is off by 0.000100136 yards).
UPDATE `gameobject` SET `position_x`=-10307.9, `position_y`=-3859.91, `position_z`=-15.8641, `orientation`=0.663223, `rotation0`=0, `rotation1`=0, `rotation2`=0.325567, `rotation3`=0.945519 WHERE `guid`=5816;

-- Correct position of Gold Vein in Badlands (position is off by 0.874623 yards).
UPDATE `gameobject` SET `position_x`=-7118.27, `position_y`=-3161.17, `position_z`=248.919, `orientation`=2.35619, `rotation0`=0, `rotation1`=0, `rotation2`=0.92388, `rotation3`=0.382683 WHERE `guid`=5909;

-- Correct position of Gold Vein in Azshara (position is off by 0.0102539 yards).
UPDATE `gameobject` SET `position_x`=4280.41, `position_y`=-7293.17, `position_z`=17.8182, `orientation`=1.51844, `rotation0`=0, `rotation1`=0, `rotation2`=0.688354, `rotation3`=0.725374 WHERE `guid`=7204;

-- Correct position of Gold Vein in Searing Gorge (position is off by 0.00976563 yards).
UPDATE `gameobject` SET `position_x`=-7079.49, `position_y`=-998.117, `position_z`=243.831, `orientation`=3.49067, `rotation0`=0, `rotation1`=0, `rotation2`=-0.984807, `rotation3`=0.173652 WHERE `guid`=5831;

-- Correct position of Gold Vein in Searing Gorge (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-6683.49, `position_y`=-1230.45, `position_z`=181.85, `orientation`=2.1293, `rotation0`=0, `rotation1`=0, `rotation2`=0.874619, `rotation3`=0.48481 WHERE `guid`=5837;

-- Correct position of Gold Vein in Searing Gorge (position is off by 0.00100708 yards).
UPDATE `gameobject` SET `position_x`=-7207.76, `position_y`=-783.353, `position_z`=329.508, `orientation`=4.7473, `rotation0`=0, `rotation1`=0, `rotation2`=-0.694658, `rotation3`=0.71934 WHERE `guid`=5802;

-- Correct position of Gold Vein in Arathi Highlands (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-890.106, `position_y`=-2366.57, `position_z`=67.8352, `orientation`=0.349065, `rotation0`=0, `rotation1`=0, `rotation2`=0.173648, `rotation3`=0.984808 WHERE `guid`=6143;

-- Correct position of Gold Vein in Swamp of Sorrows (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-10285.2, `position_y`=-2883.34, `position_z`=27.7251, `orientation`=4.43314, `rotation0`=0, `rotation1`=0, `rotation2`=-0.798635, `rotation3`=0.601815 WHERE `guid`=5879;

-- Correct position of Gold Vein in Wetlands (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-3584.03, `position_y`=-2588.48, `position_z`=79.383, `orientation`=5.20108, `rotation0`=0, `rotation1`=0, `rotation2`=-0.515038, `rotation3`=0.857168 WHERE `guid`=7357;

-- Correct position of Gold Vein in Duskwood (position is off by 0.0996094 yards).
UPDATE `gameobject` SET `position_x`=-10559.6, `position_y`=-724.451, `position_z`=76.4627, `orientation`=5.49779, `rotation0`=0, `rotation1`=0, `rotation2`=-0.382683, `rotation3`=0.92388 WHERE `guid`=6100;

-- Missing Gold Vein spawns in Badlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(11434, 1734, 0, -6975.78, -3110.13, 260.854, 0.226892, 0, 0, 0.113203, 0.993572, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5909 at 151.858017 yards.
(11437, 1734, 0, -6110.06, -3428.19, 265.838, 6.23083, 0, 0, -0.0261765, 0.999657, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 5843 at 134.624924 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(11434, 1288, 0, 'Gold Vein', 0, 10), -- Gold Veins in Badlands 8 objects total
(11437, 1288, 0, 'Gold Vein', 0, 10); -- Gold Veins in Badlands 8 objects total

-- Missing Gold Vein spawns in Blasted Lands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(12189, 1734, 0, -11252, -3575.26, 9.13002, 0.645772, 0, 0, 0.317305, 0.948324, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6262 at 101.033363 yards.
(14186, 150080, 0, -10481.5, -3269.82, -4.87173, 0.0523589, 0, 0, 0.0261765, 0.999657, 1800, 1800, 1, 100, 0, 10),
(14187, 150080, 0, -10684.2, -3692.6, -11.4256, 0.349065, 0, 0, 0.173648, 0.984808, 1800, 1800, 1, 100, 0, 10),
(14189, 150080, 0, -10503.3, -3453.36, -14.0034, 4.62512, 0, 0, -0.737277, 0.675591, 1800, 1800, 1, 100, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(12189, 1359, 0, 'Gold Vein', 0, 10), -- Gold Veins in Blasted Lands
(14186, 1359, 0, 'Gold Vein', 0, 10), -- Gold Veins in Blasted Lands
(14187, 1359, 0, 'Gold Vein', 0, 10), -- Gold Veins in Blasted Lands
(14189, 1359, 0, 'Gold Vein', 0, 10); -- Gold Veins in Blasted Lands

-- Missing Gold Vein spawns in Duskwood.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(11435, 1734, 0, -10233.3, -1358.39, 83.4799, 2.30383, 0, 0, 0.913545, 0.406738, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 7382 at 128.494156 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(11435, 1121, 0, 'Gold Vein', 0, 10); -- Gold Veins in Duskwood 5 objects total

-- Missing Gold Vein spawns in Dustwallow Marsh.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(40776, 1734, 1, -2525.41, -3510.83, 50.4315, 1.72787, 0, 0, 0.760406, 0.649449, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 40774 at 804.679810 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(40776, 1335, 0, 'Gold Vein', 0, 10); -- Gold Veins in Dustwallow Marsh

-- Missing Gold Vein spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(12286, 1734, 0, -13946.2, 220.203, 18.3835, 5.09636, 0, 0, -0.559193, 0.829038, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5881 at 156.191513 yards.
(12294, 1734, 0, -11468.3, 378.432, 75.4524, 4.20625, 0, 0, -0.861629, 0.507539, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 5854 at 116.557999 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(12286, 1176, 0, 'Gold Vein', 0, 10), -- Gold Veins in Stranglethorn 51 objects total
(12294, 1176, 0, 'Gold Vein', 0, 10); -- Gold Veins in Stranglethorn 51 objects total

-- Missing Gold Vein spawns in Alterac Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(10622, 1734, 0, 243.813, -247.871, 147.019, 3.45576, 0, 0, -0.987688, 0.156436, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6509 at 38.590897 yards.
(14483, 1734, 0, 247.102, -286.261, 153.984, 1.23918, 0, 0, 0.580703, 0.814116, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6509 at 22.633656 yards.
(12261, 1734, 0, 595.001, -651.02, 153.667, 4.20625, 0, 0, -0.861629, 0.507539, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 6420 at 22.153973 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(10622, 1353, 0, 'Gold Vein', 0, 10), -- Gold Veins in Alterac Mountains
(14483, 1353, 0, 'Gold Vein', 0, 10), -- Gold Veins in Alterac Mountains
(12261, 1353, 0, 'Gold Vein', 0, 10); -- Gold Veins in Alterac Mountains

-- Missing Gold Vein spawns in Burning Steppes.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(11461, 1734, 0, -7891.56, -2589.27, 124.627, 3.14159, 0, 0, -1, 0, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 5927 at 6.619087 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(11461, 1333, 0, 'Gold Vein', 0, 10); -- Gold Vein in Burning Steppes 8 objects total

-- Missing Gold Vein spawns in The Hinterlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(11459, 1734, 0, 314.887, -3711.68, 107.684, 5.89921, 0, 0, -0.190808, 0.981627, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 7395 at 143.660599 yards.
(11460, 1734, 0, 377.842, -4680.53, 12.5864, 1.20428, 0, 0, 0.566406, 0.824126, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 7395 at 856.879822 yards.
(11519, 1734, 0, 423.703, -3795.01, 101.592, 0.191985, 0, 0, 0.0958452, 0.995396, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 7395 at 47.769741 yards.
(12208, 1734, 0, 898.164, -4054.45, 118.902, 5.58505, 0, 0, -0.34202, 0.939693, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 7395 at 550.441956 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(11459, 1358, 0, 'Gold Vein', 0, 10), -- Gold Veins in Hinterlands
(11460, 1358, 0, 'Gold Vein', 0, 10), -- Gold Veins in Hinterlands
(11519, 1358, 0, 'Gold Vein', 0, 10), -- Gold Veins in Hinterlands
(12208, 1358, 0, 'Gold Vein', 0, 10); -- Gold Veins in Hinterlands

-- Missing Gold Vein spawns in Hillsbrad Foothills.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(11458, 1734, 0, -252.057, -306.233, 54.1448, 3.35105, 0, 0, -0.994521, 0.104536, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 6051 at 64.757782 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(11458, 1349, 0, 'Gold Vein', 0, 10); -- Gold Veins in Hillsbrad Foothills

-- Missing Gold Vein spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(12183, 1734, 1, 1843.65, -2022.99, 122.451, 2.09439, 0, 0, 0.866025, 0.500001, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 5777 at 105.980743 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(12183, 1351, 0, 'Gold Vein', 0, 10); -- Gold Veins in Ashenvale

-- Missing Gold Vein spawns in Feralas.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(11462, 1734, 1, -4821.13, 446.714, 5.45126, 0.157079, 0, 0, 0.0784588, 0.996917, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 7583 at 459.338135 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(11462, 1357, 0, 'Gold Vein', 0, 10); -- Gold Veins in Feralas

-- Missing Gold Vein spawns in Thousand Needles.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(11436, 1734, 1, -4933.02, -2261.19, -65.3333, 2.61799, 0, 0, 0.965925, 0.258821, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5844 at 49.142319 yards.
(11457, 1734, 1, -5145.4, -2558.24, -46.5695, 4.10153, 0, 0, -0.887011, 0.461749, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 6353 at 184.706436 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(11436, 1135, 0, 'Gold Vein', 0, 10), -- Gold Veins in Thousand Needles 37 objects total
(11457, 1135, 0, 'Gold Vein', 0, 10); -- Gold Veins in Thousand Needles 37 objects total

-- Missing Gold Vein spawns in Desolace.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(34194, 1734, 1, -1619.46, 1323.85, 85.8146, 1.0472, 0, 0, 0.5, 0.866025, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 34191 at 493.359833 yards.
(34195, 1734, 1, -1242.73, 2641.72, 137.034, 2.93214, 0, 0, 0.994521, 0.104536, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 34189 at 343.400360 yards.
(34196, 1734, 1, -1628.29, 1604.64, 91.5897, 1.90241, 0, 0, 0.814116, 0.580703, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 34190 at 461.407288 yards.
(3996097, 1734, 1, -1338.7, 2898.86, 73.0065, 2.28638, 0, 0, 0.909961, 0.414694, 1800, 1800, 1, 100, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(34194, 1347, 0, 'Gold Vein', 0, 10), -- Gold Veins in Desolace
(34195, 1347, 0, 'Gold Vein', 0, 10), -- Gold Veins in Desolace
(34196, 1347, 0, 'Gold Vein', 0, 10), -- Gold Veins in Desolace
(3996097, 1347, 0, 'Gold Vein', 0, 10); -- Gold Veins in Desolace

-- Missing Gold Vein spawns in Tanaris.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(12240, 1734, 1, -7170.07, -2769.94, 20.5885, 2.53072, 0, 0, 0.953716, 0.300708, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5878 at 29.060221 yards.
(12254, 1734, 1, -7242.14, -3437.92, 13.3299, 1.0472, 0, 0, 0.5, 0.866025, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 5782 at 258.568207 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(12240, 1201, 0, 'Gold Vein', 0, 10), -- Gold Veins in Tanaris 60 objects total
(12254, 1201, 0, 'Gold Vein', 0, 10); -- Gold Veins in Tanaris 60 objects total

-- Missing Gold Vein spawns in Uldaman.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(16934, 1734, 0, -6186.06, -3038.78, 221.079, 5.84685, 0, 0, -0.216439, 0.976296, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 16906 at 105.369492 yards.
(16943, 1734, 0, -6191.4, -3057.34, 214.469, 1.44862, 0, 0, 0.66262, 0.748956, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 16906 at 114.720543 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(16934, 1288, 0, 'Gold Vein', 0, 10), -- Gold Veins in Badlands 8 objects total
(16943, 1288, 0, 'Gold Vein', 0, 10); -- Gold Veins in Badlands 8 objects total

-- Missing Gold Vein spawns in Felwood.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES (665, 1, 'Gold Veins in Felwood');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(14477, 181109, 1, 4293.29, -663.367, 293.914, 0.59341, 0, 0, 0.292371, 0.956305, 1800, 1800, 1, 100, 0, 10),
(14478, 181109, 1, 5278.41, -541.085, 273.116, 3.6652, 0, 0, -0.965925, 0.258821, 1800, 1800, 1, 100, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(14477, 665, 0, 'Gold Vein', 0, 10), 
(14478, 665, 0, 'Gold Vein', 0, 10);

UPDATE `pool_template` SET `description`='Gold Veins in Western Plaguelands 19 objects total' WHERE  `entry`=1331;
UPDATE `pool_template` SET `description`='Gold Veins in Swamp of sorrows 9 objects total' WHERE  `entry`=1332;
UPDATE `pool_template` SET `description`='Gold Veins in Burning Steppes 8 objects total' WHERE  `entry`=1333;

-- LESSER BLOODSTONE ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Create new pool to hold Lesser Bloodstone Deposit spawns in Arathi Highlands.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(298, 1, 'Lesser Bloodstone Deposits in Arathi Highlands', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(10364, 298, 0, 'Lesser Bloodstone Deposit', 0, 10),
(10365, 298, 0, 'Lesser Bloodstone Deposit', 0, 10),
(11993, 298, 0, 'Lesser Bloodstone Deposit', 0, 10),
(12002, 298, 0, 'Lesser Bloodstone Deposit', 0, 10),
(12005, 298, 0, 'Lesser Bloodstone Deposit', 0, 10),
(16958, 298, 0, 'Lesser Bloodstone Deposit', 0, 10),
(26003, 298, 0, 'Lesser Bloodstone Deposit', 0, 10),
(26004, 298, 0, 'Lesser Bloodstone Deposit', 0, 10),
(26005, 298, 0, 'Lesser Bloodstone Deposit', 0, 10),
(26006, 298, 0, 'Lesser Bloodstone Deposit', 0, 10),
(26007, 298, 0, 'Lesser Bloodstone Deposit', 0, 10),
(26008, 298, 0, 'Lesser Bloodstone Deposit', 0, 10),
(26009, 298, 0, 'Lesser Bloodstone Deposit', 0, 10),
(26010, 298, 0, 'Lesser Bloodstone Deposit', 0, 10),
(26011, 298, 0, 'Lesser Bloodstone Deposit', 0, 10),
(26012, 298, 0, 'Lesser Bloodstone Deposit', 0, 10),
(26013, 298, 0, 'Lesser Bloodstone Deposit', 0, 10),
(26015, 298, 0, 'Lesser Bloodstone Deposit', 0, 10),
(26016, 298, 0, 'Lesser Bloodstone Deposit', 0, 10),
(26017, 298, 0, 'Lesser Bloodstone Deposit', 0, 10),
(26018, 298, 0, 'Lesser Bloodstone Deposit', 0, 10),
(26019, 298, 0, 'Lesser Bloodstone Deposit', 0, 10),
(26020, 298, 0, 'Lesser Bloodstone Deposit', 0, 10),
(26021, 298, 0, 'Lesser Bloodstone Deposit', 0, 10),
(26023, 298, 0, 'Lesser Bloodstone Deposit', 0, 10),
(26025, 298, 0, 'Lesser Bloodstone Deposit', 0, 10),
(26027, 298, 0, 'Lesser Bloodstone Deposit', 0, 10),
(26028, 298, 0, 'Lesser Bloodstone Deposit', 0, 10),
(26030, 298, 0, 'Lesser Bloodstone Deposit', 0, 10),
(26031, 298, 0, 'Lesser Bloodstone Deposit', 0, 10),
(26032, 298, 0, 'Lesser Bloodstone Deposit', 0, 10),
(26033, 298, 0, 'Lesser Bloodstone Deposit', 0, 10);

-- Missing Lesser Bloodstone Deposit spawns in Arathi Highlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(26014, 2653, 0, -909.263, -3952, 152.514, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 26013 at 6.287732 yards.
(26022, 2653, 0, -936.332, -3858.24, 148.046, 1.18682, 0, 0, 0.559193, 0.829038, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 26019 at 10.375037 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(26014, 298, 0, 'Lesser Bloodstone Deposit', 0, 10), -- Lesser Bloodstone Deposits in Arathi Highlands
(26022, 298, 0, 'Lesser Bloodstone Deposit', 0, 10); -- Lesser Bloodstone Deposits in Arathi Highlands

-- MITHRIL ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Correct position of Mithril Deposit in Arathi Highlands (position is off by 4.04767 yards).
UPDATE `gameobject` SET `position_x`=-2178.65, `position_y`=-1789.86, `position_z`=-41.0136, `orientation`=4.55531, `rotation0`=0, `rotation1`=0, `rotation2`=-0.760406, `rotation3`=0.649449 WHERE `guid`=7169;

-- Correct position of Mithril Deposit in Burning Steppes (position is off by 1.6737 yards).
UPDATE `gameobject` SET `position_x`=-8265.21, `position_y`=-2501.09, `position_z`=151.887, `orientation`=0.261798, `rotation0`=0, `rotation1`=0, `rotation2`=0.130526, `rotation3`=0.991445 WHERE `guid`=7281;

-- Correct position of Mithril Deposit in Western Plaguelands (position is off by 0.54103 yards).
UPDATE `gameobject` SET `position_x`=1491.92, `position_y`=-1351.54, `position_z`=63.0037, `orientation`=3.4383, `rotation0`=0, `rotation1`=0, `rotation2`=-0.989016, `rotation3`=0.147811 WHERE `guid`=7132;

-- Correct position of Mithril Deposit in Desolace (position is off by 1.04012 yards).
UPDATE `gameobject` SET `position_x`=-1767.4, `position_y`=2862.34, `position_z`=61.5412, `orientation`=5.74214, `rotation0`=0, `rotation1`=0, `rotation2`=-0.267238, `rotation3`=0.963631 WHERE `guid`=7325;

-- Correct position of Mithril Deposit in Searing Gorge (position is off by 1.04976 yards).
UPDATE `gameobject` SET `position_x`=-7117.15, `position_y`=-1606, `position_z`=258.349, `orientation`=3.4383, `rotation0`=0, `rotation1`=0, `rotation2`=-0.989016, `rotation3`=0.147811 WHERE `guid`=7166;

-- Correct position of Mithril Deposit in Desolace (position is off by 0.26001 yards).
UPDATE `gameobject` SET `position_x`=-1747.26, `position_y`=1657.03, `position_z`=72.1814, `orientation`=5.96903, `rotation0`=0, `rotation1`=0, `rotation2`=-0.156434, `rotation3`=0.987688 WHERE `guid`=7305;

-- Correct position of Mithril Deposit in Desolace (position is off by 0.449951 yards).
UPDATE `gameobject` SET `position_x`=-1838.55, `position_y`=882.157, `position_z`=103.443, `orientation`=3.45576, `rotation0`=0, `rotation1`=0, `rotation2`=-0.987688, `rotation3`=0.156436 WHERE `guid`=7293;

-- Correct position of Mithril Deposit in Maraudon (position is off by 0.380005 yards).
UPDATE `gameobject` SET `position_x`=-1407.62, `position_y`=2911.05, `position_z`=93.9409, `orientation`=2.74016, `rotation0`=0, `rotation1`=0, `rotation2`=0.979924, `rotation3`=0.19937 WHERE `guid`=7203;

-- Correct position of Mithril Deposit in Stranglethorn Vale (position is off by 1.00734 yards).
UPDATE `gameobject` SET `position_x`=-14360.8, `position_y`=152.343, `position_z`=14.1746, `orientation`=5.61996, `rotation0`=0, `rotation1`=0, `rotation2`=-0.325567, `rotation3`=0.945519 WHERE `guid`=7143;

-- Correct position of Mithril Deposit in Blasted Lands (position is off by 0.397192 yards).
UPDATE `gameobject` SET `position_x`=-11126.9, `position_y`=-3365.38, `position_z`=58.9554, `orientation`=4.67748, `rotation0`=0, `rotation1`=0, `rotation2`=-0.719339, `rotation3`=0.694659 WHERE `guid`=7199;

-- Correct position of Mithril Deposit in Tanaris (position is off by 1.14915 yards).
UPDATE `gameobject` SET `position_x`=-8037.05, `position_y`=-5177.5, `position_z`=6.83151, `orientation`=5.72468, `rotation0`=0, `rotation1`=0, `rotation2`=-0.275637, `rotation3`=0.961262 WHERE `guid`=7168;

-- Correct position of Mithril Deposit in Western Plaguelands (position is off by 1.1652 yards).
UPDATE `gameobject` SET `position_x`=1238.13, `position_y`=-1780.96, `position_z`=68.3152, `orientation`=5.34071, `rotation0`=0, `rotation1`=0, `rotation2`=-0.45399, `rotation3`=0.891007 WHERE `guid`=7193;

-- Correct position of Mithril Deposit in Western Plaguelands (position is off by 1.33475 yards).
UPDATE `gameobject` SET `position_x`=1440.1, `position_y`=-1000.29, `position_z`=79.8371, `orientation`=4.39823, `rotation0`=0, `rotation1`=0, `rotation2`=-0.809016, `rotation3`=0.587786 WHERE `guid`=7316;

-- Correct position of Mithril Deposit in Western Plaguelands (position is off by 0.847026 yards).
UPDATE `gameobject` SET `position_x`=1326.3, `position_y`=-1876.09, `position_z`=75.9321, `orientation`=1.0472, `rotation0`=0, `rotation1`=0, `rotation2`=0.5, `rotation3`=0.866025 WHERE `guid`=7223;

-- Correct position of Mithril Deposit in Searing Gorge (position is off by 0.223115 yards).
UPDATE `gameobject` SET `position_x`=-6666.01, `position_y`=-884.02, `position_z`=254.61, `orientation`=3.15906, `rotation0`=0, `rotation1`=0, `rotation2`=-0.999962, `rotation3`=0.00873464 WHERE `guid`=7234;

-- Correct position of Mithril Deposit in Burning Steppes (position is off by 1.52386 yards).
UPDATE `gameobject` SET `position_x`=-7984.65, `position_y`=-2750.98, `position_z`=165.192, `orientation`=3.08918, `rotation0`=0, `rotation1`=0, `rotation2`=0.999657, `rotation3`=0.0262016 WHERE `guid`=7220;

-- Correct position of Mithril Deposit in Tanaris (position is off by 0.0937481 yards).
UPDATE `gameobject` SET `position_x`=-7170.07, `position_y`=-2769.94, `position_z`=20.5885, `orientation`=2.53072, `rotation0`=0, `rotation1`=0, `rotation2`=0.953716, `rotation3`=0.300708 WHERE `guid`=7184;

-- Correct position of Mithril Deposit in Tanaris (position is off by 0.96934 yards).
UPDATE `gameobject` SET `position_x`=-7126.65, `position_y`=-2853.83, `position_z`=15.9532, `orientation`=3.05433, `rotation0`=0, `rotation1`=0, `rotation2`=0.999048, `rotation3`=0.0436193 WHERE `guid`=7156;

-- Correct position of Mithril Deposit in Searing Gorge (position is off by 1.82687 yards).
UPDATE `gameobject` SET `position_x`=-7076.41, `position_y`=-1297.19, `position_z`=267.191, `orientation`=5.98648, `rotation0`=0, `rotation1`=0, `rotation2`=-0.147809, `rotation3`=0.989016 WHERE `guid`=7300;

-- Correct position of Mithril Deposit in Searing Gorge (position is off by 0.0943908 yards).
UPDATE `gameobject` SET `position_x`=-6862.05, `position_y`=-1551.08, `position_z`=242.068, `orientation`=3.10665, `rotation0`=0, `rotation1`=0, `rotation2`=0.999847, `rotation3`=0.0174693 WHERE `guid`=7079;

-- Correct position of Mithril Deposit in Western Plaguelands (position is off by 1.60459 yards).
UPDATE `gameobject` SET `position_x`=1082.49, `position_y`=-1079.31, `position_z`=100.575, `orientation`=2.80998, `rotation0`=0, `rotation1`=0, `rotation2`=0.986285, `rotation3`=0.16505 WHERE `guid`=7146;

-- Correct position of Mithril Deposit in Western Plaguelands (position is off by 1.25071 yards).
UPDATE `gameobject` SET `position_x`=1180.49, `position_y`=-1692.75, `position_z`=73.1479, `orientation`=2.74016, `rotation0`=0, `rotation1`=0, `rotation2`=0.979924, `rotation3`=0.19937 WHERE `guid`=7292;

-- Correct position of Mithril Deposit in Stranglethorn Vale (position is off by 1.01771 yards).
UPDATE `gameobject` SET `position_x`=-13796.6, `position_y`=610.099, `position_z`=43.7884, `orientation`=1.0472, `rotation0`=0, `rotation1`=0, `rotation2`=0.5, `rotation3`=0.866025 WHERE `guid`=7306;

-- Correct position of Mithril Deposit in Desolace (position is off by 0.817874 yards).
UPDATE `gameobject` SET `position_x`=-1965.25, `position_y`=2658.2, `position_z`=69.2784, `orientation`=1.32645, `rotation0`=0, `rotation1`=0, `rotation2`=0.615661, `rotation3`=0.788011 WHERE `guid`=7187;

-- Correct position of Mithril Deposit in Feralas (position is off by 1.81486 yards).
UPDATE `gameobject` SET `position_x`=-4780.32, `position_y`=931.156, `position_z`=148.734, `orientation`=4.04917, `rotation0`=0, `rotation1`=0, `rotation2`=-0.898793, `rotation3`=0.438373 WHERE `guid`=7216;

-- Correct position of Mithril Deposit in Azshara (position is off by 3.31453 yards).
UPDATE `gameobject` SET `position_x`=3283.68, `position_y`=-4261.74, `position_z`=128.746, `orientation`=1.65806, `rotation0`=0, `rotation1`=0, `rotation2`=0.737277, `rotation3`=0.675591 WHERE `guid`=39941;

-- Correct position of Mithril Deposit in Dustwallow Marsh (position is off by 0.00976563 yards).
UPDATE `gameobject` SET `position_x`=-4378.36, `position_y`=-2958.63, `position_z`=27.1648, `orientation`=3.38594, `rotation0`=0, `rotation1`=0, `rotation2`=-0.992546, `rotation3`=0.12187 WHERE `guid`=56059;

-- Correct position of Mithril Deposit in The Hinterlands (position is off by 0.548403 yards).
UPDATE `gameobject` SET `position_x`=41.2691, `position_y`=-4190.52, `position_z`=117.515, `orientation`=5.75959, `rotation0`=0, `rotation1`=0, `rotation2`=-0.258819, `rotation3`=0.965926 WHERE `guid`=7237;

-- Correct position of Mithril Deposit in Tanaris (position is off by 1.14127 yards).
UPDATE `gameobject` SET `position_x`=-9037.99, `position_y`=-2266.84, `position_z`=22.5236, `orientation`=3.87463, `rotation0`=0, `rotation1`=0, `rotation2`=-0.93358, `rotation3`=0.358368 WHERE `guid`=7072;

-- Correct position of Mithril Deposit in Tanaris (position is off by 0.395175 yards).
UPDATE `gameobject` SET `position_x`=-7065.73, `position_y`=-3248.89, `position_z`=15.4797, `orientation`=0.610863, `rotation0`=0, `rotation1`=0, `rotation2`=0.300705, `rotation3`=0.953717 WHERE `guid`=7181;

-- Correct position of Mithril Deposit in Tanaris (position is off by 0.840464 yards).
UPDATE `gameobject` SET `position_x`=-6966.75, `position_y`=-3472.27, `position_z`=28.0206, `orientation`=5.61996, `rotation0`=0, `rotation1`=0, `rotation2`=-0.325567, `rotation3`=0.945519 WHERE `guid`=7145;

-- Correct position of Mithril Deposit in Desolace (position is off by 0.659557 yards).
UPDATE `gameobject` SET `position_x`=-1906.89, `position_y`=3012.74, `position_z`=18.351, `orientation`=0.558504, `rotation0`=0, `rotation1`=0, `rotation2`=0.275637, `rotation3`=0.961262 WHERE `guid`=7260;

-- Correct position of Mithril Deposit in Desolace (position is off by 2.58092 yards).
UPDATE `gameobject` SET `position_x`=-1914.5, `position_y`=2069.99, `position_z`=71.4208, `orientation`=2.65289, `rotation0`=0, `rotation1`=0, `rotation2`=0.970295, `rotation3`=0.241925 WHERE `guid`=7153;

-- Correct position of Mithril Deposit in The Hinterlands (position is off by 1.03873 yards).
UPDATE `gameobject` SET `position_x`=229.585, `position_y`=-3500.51, `position_z`=159.564, `orientation`=5.3058, `rotation0`=0, `rotation1`=0, `rotation2`=-0.469471, `rotation3`=0.882948 WHERE `guid`=7274;

-- Correct position of Mithril Deposit in Desolace (position is off by 0.810083 yards).
UPDATE `gameobject` SET `position_x`=-1833.65, `position_y`=1021.58, `position_z`=98.3811, `orientation`=1.46608, `rotation0`=0, `rotation1`=0, `rotation2`=0.66913, `rotation3`=0.743145 WHERE `guid`=7074;

-- Correct position of Mithril Deposit in Tanaris (position is off by 1.64018 yards).
UPDATE `gameobject` SET `position_x`=-7000.3, `position_y`=-3962.55, `position_z`=31.6025, `orientation`=4.2237, `rotation0`=0, `rotation1`=0, `rotation2`=-0.857167, `rotation3`=0.515038 WHERE `guid`=7099;

-- Correct position of Mithril Deposit in Tanaris (position is off by 2.29148 yards).
UPDATE `gameobject` SET `position_x`=-7821.17, `position_y`=-2637.95, `position_z`=-48.7174, `orientation`=0.541051, `rotation0`=0, `rotation1`=0, `rotation2`=0.267238, `rotation3`=0.963631 WHERE `guid`=7192;

-- Correct position of Mithril Deposit in The Hinterlands (position is off by 1.32563 yards).
UPDATE `gameobject` SET `position_x`=-53.3081, `position_y`=-3159.08, `position_z`=95.2516, `orientation`=0.698131, `rotation0`=0, `rotation1`=0, `rotation2`=0.34202, `rotation3`=0.939693 WHERE `guid`=7256;

-- Correct position of Mithril Deposit in Blasted Lands (position is off by 0.42778 yards).
UPDATE `gameobject` SET `position_x`=-11347.9, `position_y`=-2880.95, `position_z`=12.63, `orientation`=3.90954, `rotation0`=0, `rotation1`=0, `rotation2`=-0.927183, `rotation3`=0.374608 WHERE `guid`=7291;

-- Correct position of Mithril Deposit in Blasted Lands (position is off by 1.24587 yards).
UPDATE `gameobject` SET `position_x`=-10942.8, `position_y`=-2822.68, `position_z`=27.2863, `orientation`=4.76475, `rotation0`=0, `rotation1`=0, `rotation2`=-0.688354, `rotation3`=0.725374 WHERE `guid`=7159;

-- Missing Mithril Deposit spawns in Badlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(13139, 2040, 0, -6991.04, -2673.25, 295.239, 0.436332, 0, 0, 0.216439, 0.976296, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7272 at 50.272621 yards.
(13208, 2040, 0, -6471.75, -2381.15, 298.949, 5.81195, 0, 0, -0.233445, 0.97237, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7135 at 103.084793 yards.
(13330, 2040, 0, -7292.22, -3208.34, 299.893, 3.4383, 0, 0, -0.989016, 0.147811, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7196 at 68.589066 yards.
(13331, 2040, 0, -6433.6, -2475.08, 328.755, 0.244346, 0, 0, 0.121869, 0.992546, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7135 at 43.051235 yards.
(13332, 2040, 0, -7172.12, -2231.94, 298.441, 6.12611, 0, 0, -0.0784588, 0.996917, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7257 at 47.392239 yards.
(13545, 2040, 0, -7472.15, -2246.71, 236.758, 0.087266, 0, 0, 0.0436192, 0.999048, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7130 at 74.161346 yards.
(13568, 2040, 0, -7344.53, -3478.77, 335.204, 4.08407, 0, 0, -0.891006, 0.453991, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7196 at 333.922302 yards.
(13570, 2040, 0, -7248.51, -3471.09, 316.221, 5.72468, 0, 0, -0.275637, 0.961262, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7196 at 307.839844 yards.
(13577, 2040, 0, -6549.7, -2434.55, 296.762, 4.99164, 0, 0, -0.601814, 0.798636, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7229 at 90.445610 yards.
(13578, 2040, 0, -7479.58, -2286.49, 234.297, 1.37881, 0, 0, 0.636078, 0.771625, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 11483 at 66.258110 yards.
(13583, 2040, 0, -6696.94, -4017.02, 267.021, 2.44346, 0, 0, 0.939692, 0.34202, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 11508 at 133.287231 yards.
(13584, 2040, 0, -6813.23, -4039.64, 266.999, 1.91986, 0, 0, 0.819152, 0.573577, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 11516 at 128.352478 yards.
(13588, 2040, 0, -6518.01, -2460.01, 307.32, 3.49067, 0, 0, -0.984807, 0.173652, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7135 at 49.908325 yards.
(13590, 2040, 0, -6974.24, -2305.7, 256.075, 0.837757, 0, 0, 0.406736, 0.913546, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7064 at 38.316082 yards.
(13591, 2040, 0, -7118.27, -3161.17, 248.919, 2.35619, 0, 0, 0.92388, 0.382683, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7083 at 68.769188 yards.
(13628, 2040, 0, -6880.82, -4142.43, 279.195, 5.09636, 0, 0, -0.559193, 0.829038, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 11516 at 86.884613 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(13139, 1289, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Badlands 31 objects total
(13208, 1289, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Badlands 31 objects total
(13330, 1289, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Badlands 31 objects total
(13331, 1289, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Badlands 31 objects total
(13332, 1289, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Badlands 31 objects total
(13545, 1289, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Badlands 31 objects total
(13568, 1289, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Badlands 31 objects total
(13570, 1289, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Badlands 31 objects total
(13577, 1289, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Badlands 31 objects total
(13578, 1289, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Badlands 31 objects total
(13583, 1289, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Badlands 31 objects total
(13584, 1289, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Badlands 31 objects total
(13588, 1289, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Badlands 31 objects total
(13590, 1289, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Badlands 31 objects total
(13591, 1289, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Badlands 31 objects total
(13628, 1289, 0, 'Mithril Deposit', 0, 10); -- Mithril Deposits in Badlands 31 objects total

-- Missing Mithril Deposit spawns in Blasted Lands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(13601, 2040, 0, -11864.1, -3352.51, 17.5933, 2.60054, 0, 0, 0.96363, 0.267241, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7279 at 78.059967 yards.
(13602, 2040, 0, -11542.7, -2919.17, 14.5303, 4.11898, 0, 0, -0.882947, 0.469473, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7059 at 13.104739 yards.
(13638, 2040, 0, -11303.6, -3203.56, 30.4578, 1.25664, 0, 0, 0.587785, 0.809017, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7273 at 105.229286 yards.
(387400, 2040, 0, -11733.5, -3170.78, -7.08996, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7268 at 40.513371 yards.
(387401, 2040, 0, -11180.9, -2909.93, 39.0139, 4.41568, 0, 0, -0.803857, 0.594823, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7291 at 171.562546 yards.
(387402, 2040, 0, -11252, -3575.26, 9.13002, 0.645772, 0, 0, 0.317305, 0.948324, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 42461 at 101.033363 yards.
(387403, 150079, 0, -10678, -3063.91, 19.3301, 1.16937, 0, 0, 0.551936, 0.833886, 300, 300, 1, 100, 0, 10),
(387404, 150079, 0, -10857.4, -3167.36, 47.1372, 0.331611, 0, 0, 0.165047, 0.986286, 300, 300, 1, 100, 0, 10),
(387405, 150079, 0, -10554.8, -3591.63, -13.6239, 3.03684, 0, 0, 0.998629, 0.0523532, 300, 300, 1, 100, 0, 10),
(387406, 150079, 0, -10603.2, -3214.84, -2.70033, 2.87979, 0, 0, 0.991445, 0.130528, 300, 300, 1, 100, 0, 10),
(387407, 150079, 0, -10494.9, -3214.97, -1.79457, 1.46608, 0, 0, 0.66913, 0.743145, 300, 300, 1, 100, 0, 10),
(387408, 150079, 0, -10497.4, -3329.15, -4.38601, 1.01229, 0, 0, 0.484809, 0.87462, 300, 300, 1, 100, 0, 10),
(387409, 150079, 0, -10625, -3655, -15.6897, 3.64774, 0, 0, -0.968147, 0.250381, 300, 300, 1, 100, 0, 10),
(387410, 150079, 0, -10481.5, -3269.82, -4.87173, 0.0523589, 0, 0, 0.0261765, 0.999657, 300, 300, 1, 100, 0, 10),
(387411, 150079, 0, -10741.1, -3678.92, -10.5593, 3.71755, 0, 0, -0.958819, 0.284016, 300, 300, 1, 100, 0, 10),
(387412, 150079, 0, -10503.3, -3453.36, -14.0034, 4.62512, 0, 0, -0.737277, 0.675591, 300, 300, 1, 100, 0, 10),
(387413, 150079, 0, -10530.1, -3547.74, -9.48959, 3.00195, 0, 0, 0.997563, 0.0697661, 300, 300, 1, 100, 0, 10),
(387414, 150079, 0, -10801.7, -3064.23, 45.8933, 0.802851, 0, 0, 0.390731, 0.920505, 300, 300, 1, 100, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(13601, 1279, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Blasted Lands 37 objects total
(13602, 1279, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Blasted Lands 37 objects total
(13638, 1279, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Blasted Lands 37 objects total
(387400, 1279, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Blasted Lands 37 objects total
(387401, 1279, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Blasted Lands 37 objects total
(387402, 1279, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Blasted Lands 37 objects total
(387403, 1279, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Blasted Lands 37 objects total
(387404, 1279, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Blasted Lands 37 objects total
(387405, 1279, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Blasted Lands 37 objects total
(387406, 1279, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Blasted Lands 37 objects total
(387407, 1279, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Blasted Lands 37 objects total
(387408, 1279, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Blasted Lands 37 objects total
(387409, 1279, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Blasted Lands 37 objects total
(387410, 1279, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Blasted Lands 37 objects total
(387411, 1279, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Blasted Lands 37 objects total
(387412, 1279, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Blasted Lands 37 objects total
(387413, 1279, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Blasted Lands 37 objects total
(387414, 1279, 0, 'Mithril Deposit', 0, 10); -- Mithril Deposits in Blasted Lands 37 objects total

-- Missing Mithril Deposit spawns in Swamp of Sorrows.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(13579, 2040, 0, -10307.9, -3859.91, -15.8641, 0.663223, 0, 0, 0.325567, 0.945519, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7137 at 650.661255 yards.
(31024, 2040, 0, -10068.9, -3040.34, 33.9087, 2.28638, 0, 0, 0.909961, 0.414694, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 31015 at 169.368057 yards.
(387415, 2040, 0, -10950.3, -3693.78, 26.4363, 4.20625, 0, 0, -0.861629, 0.507539, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7137 at 1016.679077 yards.
(387416, 2040, 0, -10890, -3619.06, 15.7217, 5.8294, 0, 0, -0.224951, 0.97437, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 7137 at 932.201538 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(13579, 1315, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Swamp of Sorrows (2) 17 objects total
(31024, 1315, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Swamp of Sorrows (2) 17 objects total
(387415, 1315, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Swamp of Sorrows (2) 17 objects total
(387416, 1315, 0, 'Mithril Deposit', 0, 10); -- Mithril Deposits in Swamp of Sorrows (2) 17 objects total

-- Missing Mithril Deposit spawns in Dustwallow Marsh.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(56061, 2040, 1, -4678.96, -4025.91, 50.7891, 2.51327, 0, 0, 0.951056, 0.309017, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 56059 at 1109.058594 yards.
(56063, 2040, 1, -4399.6, -3014.34, 34.0548, 0.802851, 0, 0, 0.390731, 0.920505, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 56059 at 60.022175 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(56061, 43524, 0, 'Mithril Deposit', 0, 10), -- Dustwallow Marsh: Mithril Deposit
(56063, 43524, 0, 'Mithril Deposit', 0, 10); -- Dustwallow Marsh: Mithril Deposit

-- Missing Mithril Deposit spawns in Azshara.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(13340, 2040, 1, 4915.54, -7019, 108.375, 3.21142, 0, 0, -0.999391, 0.0349061, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7086 at 119.693329 yards.
(13355, 2040, 1, 4111.43, -5137.35, 146.158, 3.90954, 0, 0, -0.927183, 0.374608, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7149 at 51.768219 yards.
(48487, 2040, 1, 2740.53, -6057.06, 52.9025, 2.25147, 0, 0, 0.902585, 0.430512, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 48464 at 391.634033 yards.
(13597, 2040, 1, 3036.39, -4058.49, 123.179, 1.25664, 0, 0, 0.587785, 0.809017, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7243 at 156.208344 yards.
(13618, 2040, 1, 3253.48, -4371.95, 126.518, 4.97419, 0, 0, -0.608761, 0.793354, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7061 at 105.546318 yards.
(13619, 2040, 1, 3973.14, -5413.5, 124.489, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7269 at 330.108704 yards.
(13631, 2040, 1, 3805.53, -5566.64, 26.7421, 4.4855, 0, 0, -0.782608, 0.622515, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7136 at 373.842896 yards.
(13633, 2040, 1, 2930.96, -4063.48, 121.14, 4.01426, 0, 0, -0.906307, 0.422619, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 7243 at 57.394852 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(13340, 1329, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposit in Azshara 22 objects total
(13355, 1329, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposit in Azshara 22 objects total
(48487, 1329, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposit in Azshara 22 objects total
(13597, 1329, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposit in Azshara 22 objects total
(13618, 1329, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposit in Azshara 22 objects total
(13619, 1329, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposit in Azshara 22 objects total
(13631, 1329, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposit in Azshara 22 objects total
(13633, 1329, 0, 'Mithril Deposit', 0, 10); -- Mithril Deposit in Azshara 22 objects total

-- Missing Mithril Deposit spawns in Western Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(13107, 2040, 0, 1402.24, -1103.01, 71.5185, 2.58308, 0, 0, 0.961261, 0.27564, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7316 at 109.429123 yards.
(13328, 2040, 0, 1481.64, -867.292, 78.0325, 0.645772, 0, 0, 0.317305, 0.948324, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7316 at 139.730072 yards.
(13329, 2040, 0, 1163.15, -1867.06, 73.9792, 0.837757, 0, 0, 0.406736, 0.913546, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7193 at 113.871429 yards.
(13333, 2040, 0, 1429.4, -1221.99, 67.6879, 5.60251, 0, 0, -0.333807, 0.942641, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7132 at 143.449966 yards.
(13335, 2040, 0, 1387.13, -1723.46, 71.8066, 5.2709, 0, 0, -0.484809, 0.87462, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7219 at 60.799854 yards.
(13341, 2040, 0, 1264.27, -1297.43, 74.5188, 0.663223, 0, 0, 0.325567, 0.945519, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7191 at 13.620117 yards.
(13342, 2040, 0, 1537.2, -1700.27, 78.4948, 6.00393, 0, 0, -0.139173, 0.990268, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7219 at 102.408356 yards.
(13600, 2040, 0, 1420.81, -1972.1, 69.9208, 4.45059, 0, 0, -0.793353, 0.608762, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7223 at 135.507431 yards.
(45504, 2040, 0, 1882.89, -1053.47, 78.6267, 2.65289, 0, 0, 0.970295, 0.241925, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 45496 at 54.869389 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(13107, 1271, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Western Plaguelands 17 objects total
(13328, 1271, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Western Plaguelands 17 objects total
(13329, 1271, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Western Plaguelands 17 objects total
(13333, 1271, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Western Plaguelands 17 objects total
(13335, 1271, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Western Plaguelands 17 objects total
(13341, 1271, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Western Plaguelands 17 objects total
(13342, 1271, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Western Plaguelands 17 objects total
(13600, 1271, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Western Plaguelands 17 objects total
(45504, 1271, 0, 'Mithril Deposit', 0, 10); -- Mithril Deposits in Western Plaguelands 17 objects total

-- Missing Mithril Deposit spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(40021, 2040, 0, -11447.4, -845.448, 15.4786, 6.14356, 0, 0, -0.0697556, 0.997564, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 40013 at 928.257751 yards.
(387417, 2040, 0, -12788.7, 222.431, 18.9157, 1.23918, 0, 0, 0.580703, 0.814116, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7176 at 77.611160 yards.
(387418, 2040, 0, -13249.5, -519.636, 18.0377, 5.70723, 0, 0, -0.284015, 0.95882, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 11696 at 29.353403 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(40021, 1177, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Stranglethorn 19 objects total
(387417, 1177, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Stranglethorn 19 objects total
(387418, 1177, 0, 'Mithril Deposit', 0, 10); -- Mithril Deposits in Stranglethorn 19 objects total

-- Missing Mithril Deposit spawns in Alterac Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(387419, 2040, 0, 631.671, -730.556, 155.593, 5.70723, 0, 0, -0.284015, 0.95882, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7262 at 36.489506 yards.
(387420, 2040, 0, 892.592, -278.629, 152.45, 1.06465, 0, 0, 0.507538, 0.861629, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 7167 at 93.144279 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(387419, 1069, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Alterac 37 objects total
(387420, 1069, 0, 'Mithril Deposit', 0, 10); -- Mithril Deposits in Alterac 37 objects total

-- Missing Mithril Deposit spawns in Arathi Highlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(13114, 2040, 0, -1824.19, -1799.81, 60.5315, 1.79769, 0, 0, 0.782608, 0.622515, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7175 at 15.446314 yards.
(13115, 2040, 0, -926.399, -3898.71, 144.877, 1.36136, 0, 0, 0.62932, 0.777146, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7082 at 140.923706 yards.
(13116, 2040, 0, -899.783, -3967.06, 137.724, 0.331611, 0, 0, 0.165047, 0.986286, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7082 at 211.725830 yards.
(13120, 2040, 0, -1729.78, -3290.1, 13.5406, 4.13643, 0, 0, -0.878817, 0.47716, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7157 at 49.592442 yards.
(13121, 2040, 0, -2065.41, -3307.87, 67.9717, 5.34071, 0, 0, -0.45399, 0.891007, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7177 at 38.281921 yards.
(13249, 2040, 0, -1755.99, -1427.99, 63.643, 1.78023, 0, 0, 0.777145, 0.629321, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7062 at 27.683750 yards.
(387421, 2040, 0, -1674.69, -1442.03, 45.8495, 5.41052, 0, 0, -0.422618, 0.906308, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7062 at 61.522541 yards.
(13336, 2040, 0, -1827.82, -2643.53, 59.8704, 6.23083, 0, 0, -0.0261765, 0.999657, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7073 at 9.815951 yards.
(32316, 2040, 0, -1851.72, -1538.44, 66.9113, 2.19911, 0, 0, 0.891006, 0.453991, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 32175 at 97.605049 yards.
(32317, 2040, 0, -1854.6, -1493.8, 49.2701, 4.7822, 0, 0, -0.681998, 0.731354, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 32175 at 56.454361 yards.
(13573, 2040, 0, -2307.24, -1790.67, -22.6112, 0.453785, 0, 0, 0.224951, 0.97437, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7133 at 83.500183 yards.
(13575, 2040, 0, -2182, -1665.24, -35.4133, 0.59341, 0, 0, 0.292371, 0.956305, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7133 at 114.926666 yards.
(13576, 2040, 0, -2241.04, -1835.02, -20.1633, 0.418879, 0, 0, 0.207911, 0.978148, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7296 at 74.767525 yards.
(387422, 2040, 0, -1657.74, -2215.52, 23.8297, 5.55015, 0, 0, -0.358368, 0.93358, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7209 at 61.236763 yards.
(387423, 2040, 0, -1819.15, -2011.03, 66.5258, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7188 at 46.037064 yards.
(387424, 2040, 0, -1848.64, -1760.39, 67.3599, 5.88176, 0, 0, -0.199368, 0.979925, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 7222 at 5.241910 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(13114, 1188, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Arathi 48 objects total
(13115, 1188, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Arathi 48 objects total
(13116, 1188, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Arathi 48 objects total
(13120, 1188, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Arathi 48 objects total
(13121, 1188, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Arathi 48 objects total
(13249, 1188, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Arathi 48 objects total
(387421, 1188, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Arathi 48 objects total
(13336, 1188, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Arathi 48 objects total
(32316, 1188, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Arathi 48 objects total
(32317, 1188, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Arathi 48 objects total
(13573, 1188, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Arathi 48 objects total
(13575, 1188, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Arathi 48 objects total
(13576, 1188, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Arathi 48 objects total
(387422, 1188, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Arathi 48 objects total
(387423, 1188, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Arathi 48 objects total
(387424, 1188, 0, 'Mithril Deposit', 0, 10); -- Mithril Deposits in Arathi 48 objects total

-- Missing Mithril Deposit spawns in Burning Steppes.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(13131, 2040, 0, -7855.9, -2538.82, 177.637, 1.95477, 0, 0, 0.829038, 0.559193, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7285 at 33.178898 yards.
(13132, 2040, 0, -7956.23, -2514.58, 134.91, 4.15388, 0, 0, -0.874619, 0.48481, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7285 at 87.470169 yards.
(13133, 2040, 0, -7888.64, -2573.78, 176.537, 1.37881, 0, 0, 0.636078, 0.771625, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7285 at 58.810337 yards.
(13337, 2040, 0, -7824.89, -2618.07, 123.346, 6.19592, 0, 0, -0.0436192, 0.999048, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7088 at 102.538200 yards.
(13367, 2040, 0, -7892.74, -2637.32, 169.992, 6.02139, 0, 0, -0.130526, 0.991445, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7088 at 114.275703 yards.
(13484, 2040, 0, -7756.13, -2785.21, 163.069, 1.79769, 0, 0, 0.782608, 0.622515, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7088 at 92.884071 yards.
(13485, 2040, 0, -7930.76, -2717.33, 164.43, 3.83973, 0, 0, -0.939692, 0.34202, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7220 at 63.556107 yards.
(13566, 2040, 0, -7891.51, -2502.56, 130.12, 6.12611, 0, 0, -0.0784588, 0.996917, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7285 at 36.710579 yards.
(13567, 2040, 0, -8225.09, -2783.73, 139.593, 3.927, 0, 0, -0.923879, 0.382686, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7220 at 244.611389 yards.
(13571, 2040, 0, -7891.56, -2589.27, 124.627, 3.14159, 0, 0, -1, 0, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7285 at 74.844765 yards.
(13572, 2040, 0, -7797.94, -2358.84, 144.69, 4.32842, 0, 0, -0.829037, 0.559194, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7285 at 179.861572 yards.
(13580, 2040, 0, -7811.58, -2645.43, 174.273, 5.46288, 0, 0, -0.398748, 0.91706, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7088 at 59.709507 yards.
(13585, 2040, 0, -7722.68, -2614.47, 162.427, 0.802851, 0, 0, 0.390731, 0.920505, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 7088 at 118.808800 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(13131, 1296, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Burning Steppes 17 objects total
(13132, 1296, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Burning Steppes 17 objects total
(13133, 1296, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Burning Steppes 17 objects total
(13337, 1296, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Burning Steppes 17 objects total
(13367, 1296, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Burning Steppes 17 objects total
(13484, 1296, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Burning Steppes 17 objects total
(13485, 1296, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Burning Steppes 17 objects total
(13566, 1296, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Burning Steppes 17 objects total
(13567, 1296, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Burning Steppes 17 objects total
(13571, 1296, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Burning Steppes 17 objects total
(13572, 1296, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Burning Steppes 17 objects total
(13580, 1296, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Burning Steppes 17 objects total
(13585, 1296, 0, 'Mithril Deposit', 0, 10); -- Mithril Deposits in Burning Steppes 17 objects total

-- Missing Mithril Deposit spawns in The Hinterlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(46438, 2040, 0, 453.572, -3309.84, 123.93, 3.05433, 0, 0, 0.999048, 0.0436193, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 46426 at 66.245422 yards.
(387425, 2040, 0, 423.703, -3795.01, 101.592, 0.191985, 0, 0, 0.0958452, 0.995396, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7259 at 79.069214 yards.
(46270, 2040, 0, -19.1472, -3913.21, 163.854, 3.21142, 0, 0, -0.999391, 0.0349061, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 46269 at 180.135071 yards.
(13587, 2040, 0, -93.0135, -2774.19, 127.279, 0.558504, 0, 0, 0.275637, 0.961262, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7102 at 36.237217 yards.
(46439, 2040, 0, 172.95, -4770.56, -5.95633, 2.07694, 0, 0, 0.861629, 0.507539, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 46431 at 382.297485 yards.
(34988, 2040, 0, -433.382, -4637.36, -6.58656, 0.977383, 0, 0, 0.469471, 0.882948, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34987 at 451.970520 yards.
(13589, 2040, 0, 125.024, -4081.02, 143.891, 4.86947, 0, 0, -0.649447, 0.760406, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7237 at 139.865433 yards.
(35001, 2040, 0, -421.121, -3772.12, 246.352, 6.00393, 0, 0, -0.139173, 0.990268, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34985 at 208.426071 yards.
(13596, 2040, 0, 898.164, -4054.45, 118.902, 5.58505, 0, 0, -0.34202, 0.939693, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7154 at 558.170227 yards.
(35002, 2040, 0, -183.887, -4243.68, 138.965, 1.37881, 0, 0, 0.636078, 0.771625, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34987 at 211.169891 yards.
(46442, 2040, 0, 195.373, -3811.23, 133.341, 1.50098, 0, 0, 0.681998, 0.731354, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 46432 at 157.927155 yards.
(34962, 2040, 0, -311.54, -3532.09, 163.262, 3.52557, 0, 0, -0.981627, 0.190812, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34957 at 110.224876 yards.
(46452, 2040, 0, -61.2061, -4550.14, 15.3726, 3.49067, 0, 0, -0.984807, 0.173652, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 46431 at 172.913177 yards.
(13604, 2040, 0, 314.887, -3711.68, 107.684, 5.89921, 0, 0, -0.190808, 0.981627, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7315 at 11.674106 yards.
(13605, 2040, 0, 395.458, -3830.24, 117.181, 1.58825, 0, 0, 0.71325, 0.70091, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7154 at 53.798855 yards.
(13606, 2040, 0, 346.52, -4015.32, 121.662, 2.07694, 0, 0, 0.861629, 0.507539, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7154 at 142.052521 yards.
(13608, 2040, 0, 526.685, -4046.76, 137.139, 1.79769, 0, 0, 0.782608, 0.622515, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7154 at 234.199554 yards.
(13622, 2040, 0, -130.105, -4157.03, 122.284, 6.16101, 0, 0, -0.0610485, 0.998135, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7237 at 174.681198 yards.
(35003, 2040, 0, -671.874, -4083.03, 244.798, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34985 at 303.260864 yards.
(46455, 2040, 0, 122.431, -4356.28, 121.259, 2.40855, 0, 0, 0.93358, 0.358368, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 46431 at 169.699249 yards.
(46456, 2040, 0, 322.24, -3778.69, 161.759, 3.73501, 0, 0, -0.956305, 0.292372, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 46432 at 44.481186 yards.
(35005, 2040, 0, -773.764, -4422.3, 25.206, 5.61996, 0, 0, -0.325567, 0.945519, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34987 at 457.574280 yards.
(35006, 2040, 0, -625.061, -4760.33, -21.4149, 3.03684, 0, 0, 0.998629, 0.0523532, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34987 at 615.620178 yards.
(46458, 2040, 0, -448.762, -2758.04, 105.522, 3.75246, 0, 0, -0.953716, 0.300708, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 46427 at 298.217896 yards.
(46459, 2040, 0, -484.378, -2863.71, 113.477, 3.6652, 0, 0, -0.965925, 0.258821, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 46427 at 307.429474 yards.
(34964, 2040, 0, -82.8166, -3537.39, 120.366, 5.13127, 0, 0, -0.544639, 0.838671, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34957 at 132.436096 yards.
(46271, 2040, 0, -199.741, -4044.66, 175.941, 6.10865, 0, 0, -0.0871553, 0.996195, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 46269 at 71.724648 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(46438, 1255, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Hinterlands 24 objects total
(387425, 1255, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Hinterlands 24 objects total
(46270, 1255, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Hinterlands 24 objects total
(13587, 1255, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Hinterlands 24 objects total
(46439, 1255, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Hinterlands 24 objects total
(34988, 1255, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Hinterlands 24 objects total
(13589, 1255, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Hinterlands 24 objects total
(35001, 1255, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Hinterlands 24 objects total
(13596, 1255, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Hinterlands 24 objects total
(35002, 1255, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Hinterlands 24 objects total
(46442, 1255, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Hinterlands 24 objects total
(34962, 1255, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Hinterlands 24 objects total
(46452, 1255, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Hinterlands 24 objects total
(13604, 1255, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Hinterlands 24 objects total
(13605, 1255, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Hinterlands 24 objects total
(13606, 1255, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Hinterlands 24 objects total
(13608, 1255, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Hinterlands 24 objects total
(13622, 1255, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Hinterlands 24 objects total
(35003, 1255, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Hinterlands 24 objects total
(46455, 1255, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Hinterlands 24 objects total
(46456, 1255, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Hinterlands 24 objects total
(35005, 1255, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Hinterlands 24 objects total
(35006, 1255, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Hinterlands 24 objects total
(46458, 1255, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Hinterlands 24 objects total
(46459, 1255, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Hinterlands 24 objects total
(34964, 1255, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Hinterlands 24 objects total
(46271, 1255, 0, 'Mithril Deposit', 0, 10); -- Mithril Deposits in Hinterlands 24 objects total

-- Missing Mithril Deposit spawns in Searing Gorge.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(13117, 2040, 0, -7040.85, -1749.85, 259.663, 0.104719, 0, 0, 0.0523357, 0.99863, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7166 at 163.650208 yards.
(387426, 2040, 0, -6865.97, -1191.79, 182.557, 0.383971, 0, 0, 0.190808, 0.981627, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 10060 at 78.754944 yards.
(387700, 2040, 0, -7325.74, -1755.42, 267.655, 2.33874, 0, 0, 0.920505, 0.390732, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 10004 at 165.556549 yards.
(387701, 2040, 0, -6869.47, -1410.38, 172.377, 3.50812, 0, 0, -0.983254, 0.182238, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7240 at 79.882164 yards.
(387702, 2040, 0, -6580.63, -1837.71, 244.947, 2.42601, 0, 0, 0.936672, 0.350207, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 10070 at 198.824753 yards.
(387703, 2040, 0, -6736.55, -1686.12, 219.236, 4.03171, 0, 0, -0.902585, 0.430512, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7079 at 185.786804 yards.
(387704, 2040, 0, -7079.49, -998.117, 243.831, 3.49067, 0, 0, -0.984807, 0.173652, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 10058 at 183.178543 yards.
(387705, 2040, 0, -6782.98, -1169.51, 243.777, 5.18363, 0, 0, -0.522498, 0.85264, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7310 at 168.142151 yards.
(387706, 2040, 0, -6473.71, -1195.53, 183.154, 1.29154, 0, 0, 0.601814, 0.798636, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 13219 at 79.913109 yards.
(387707, 2040, 0, -6654.58, -721.022, 242.777, 5.74214, 0, 0, -0.267238, 0.963631, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7234 at 163.789703 yards.
(387708, 2040, 0, -6835.71, -1484.15, 208.595, 1.58825, 0, 0, 0.71325, 0.70091, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7240 at 9.977887 yards.
(387709, 2040, 0, -6989.5, -1754.34, 234.098, 4.93928, 0, 0, -0.622514, 0.782609, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7166 at 197.890228 yards.
(387710, 2040, 0, -6712.46, -1592, 192.912, 1.0821, 0, 0, 0.515038, 0.857168, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7079 at 162.665680 yards.
(387711, 2040, 0, -6754.19, -1363.81, 196.629, 1.90241, 0, 0, 0.814116, 0.580703, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7211 at 37.590443 yards.
(387712, 2040, 0, -6811, -1356.96, 169.573, 0.087266, 0, 0, 0.0436192, 0.999048, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7211 at 93.027458 yards.
(387713, 2040, 0, -6657.98, -1272.72, 252.689, 4.71239, 0, 0, -0.707107, 0.707107, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7310 at 6.604876 yards.
(387714, 2040, 0, -6683.49, -1230.45, 181.85, 2.1293, 0, 0, 0.874619, 0.48481, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7310 at 87.340279 yards.
(387715, 2040, 0, -7260.88, -1141.82, 283.953, 0.523598, 0, 0, 0.258819, 0.965926, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 10058 at 108.547043 yards.
(387716, 2040, 0, -6555.58, -1572.64, 310.16, 4.76475, 0, 0, -0.688354, 0.725374, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 10070 at 125.093620 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(13117, 1293, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Searing Gorge 21 objects total
(387426, 1293, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Searing Gorge 21 objects total
(387700, 1293, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Searing Gorge 21 objects total
(387701, 1293, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Searing Gorge 21 objects total
(387702, 1293, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Searing Gorge 21 objects total
(387703, 1293, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Searing Gorge 21 objects total
(387704, 1293, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Searing Gorge 21 objects total
(387705, 1293, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Searing Gorge 21 objects total
(387706, 1293, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Searing Gorge 21 objects total
(387707, 1293, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Searing Gorge 21 objects total
(387708, 1293, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Searing Gorge 21 objects total
(387709, 1293, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Searing Gorge 21 objects total
(387710, 1293, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Searing Gorge 21 objects total
(387711, 1293, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Searing Gorge 21 objects total
(387712, 1293, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Searing Gorge 21 objects total
(387713, 1293, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Searing Gorge 21 objects total
(387714, 1293, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Searing Gorge 21 objects total
(387715, 1293, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Searing Gorge 21 objects total
(387716, 1293, 0, 'Mithril Deposit', 0, 10); -- Mithril Deposits in Searing Gorge 21 objects total

-- Missing Mithril Deposit spawns in Feralas.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(50252, 2040, 1, -4963.03, 619.299, 39.5716, 4.60767, 0, 0, -0.743144, 0.669131, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 50204 at 226.020737 yards.
(50338, 2040, 1, -4014.75, 1942.18, 104.728, 1.3439, 0, 0, 0.622514, 0.782609, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 50200 at 364.287170 yards.
(50347, 2040, 1, -3782.9, 1914.12, 81.3752, 0.191985, 0, 0, 0.0958452, 0.995396, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 50194 at 270.953613 yards.
(50349, 2040, 1, -5095.32, 1861.92, 84.5127, 3.73501, 0, 0, -0.956305, 0.292372, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 50201 at 73.472626 yards.
(50350, 2040, 1, -5247.45, 635.118, 66.4176, 5.75959, 0, 0, -0.258819, 0.965926, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 50204 at 470.065918 yards.
(50351, 2040, 1, -3127.18, 1822.67, 46.9297, 4.55531, 0, 0, -0.760406, 0.649449, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 50194 at 393.336945 yards.
(50352, 2040, 1, -5801.94, 1311.5, 66.8884, 2.23402, 0, 0, 0.898793, 0.438373, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 50201 at 826.590332 yards.
(50353, 2040, 1, -5749.9, 1684.3, 97.6473, 3.194, 0, 0, -0.999657, 0.0262016, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 50202 at 610.841248 yards.
(50355, 2040, 1, -3888.16, 1568.54, 121.972, 3.78737, 0, 0, -0.948323, 0.317306, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 50200 at 42.683121 yards.
(50356, 2040, 1, -3891.48, 1624.96, 118.84, 0.802851, 0, 0, 0.390731, 0.920505, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 50200 at 49.075935 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(50252, 1195, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Feralas 12 objects total
(50338, 1195, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Feralas 12 objects total
(50347, 1195, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Feralas 12 objects total
(50349, 1195, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Feralas 12 objects total
(50350, 1195, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Feralas 12 objects total
(50351, 1195, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Feralas 12 objects total
(50352, 1195, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Feralas 12 objects total
(50353, 1195, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Feralas 12 objects total
(50355, 1195, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Feralas 12 objects total
(50356, 1195, 0, 'Mithril Deposit', 0, 10); -- Mithril Deposits in Feralas 12 objects total

-- Missing Mithril Deposit spawns in Desolace.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(27900, 2040, 1, 198.962, 2670.46, -69.6515, 5.07891, 0, 0, -0.566406, 0.824126, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 27895 at 190.442368 yards.
(27901, 2040, 1, 213.924, 2735.46, -68.5553, 6.07375, 0, 0, -0.104528, 0.994522, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 27895 at 204.997406 yards.
(27902, 2040, 1, 267.468, 2632.63, -43.1734, 4.88692, 0, 0, -0.642787, 0.766045, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 27895 at 267.392639 yards.
(13137, 2040, 1, -1951.28, 2900.84, 49.8261, 3.89209, 0, 0, -0.930417, 0.366502, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7260 at 124.995689 yards.
(27903, 2040, 1, -1777.43, 1765.9, 83.9239, 1.06465, 0, 0, 0.507538, 0.861629, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 27893 at 58.379192 yards.
(27904, 2040, 1, -1297.31, 2950.38, 120.484, 1.6057, 0, 0, 0.719339, 0.694659, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 27892 at 71.135857 yards.
(13215, 2040, 1, -1170.37, 2974.11, 64.7407, 1.25664, 0, 0, 0.587785, 0.809017, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7160 at 86.688736 yards.
(13216, 2040, 1, -1523.36, 2828.88, 144.781, 6.03884, 0, 0, -0.121869, 0.992546, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7178 at 47.382816 yards.
(387717, 2040, 1, -1313.19, 2791.93, 127.485, 0.575957, 0, 0, 0.284015, 0.95882, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7071 at 32.460232 yards.
(34199, 2040, 1, -2277.12, 2508.5, 75.3471, 2.47837, 0, 0, 0.945518, 0.325568, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34177 at 106.332176 yards.
(13607, 2040, 1, -2008.28, 2777.47, 67.2456, 3.15906, 0, 0, -0.999962, 0.00873464, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 7187 at 126.849228 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(27900, 1146, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Desolace 37 objects total
(27901, 1146, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Desolace 37 objects total
(27902, 1146, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Desolace 37 objects total
(13137, 1146, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Desolace 37 objects total
(27903, 1146, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Desolace 37 objects total
(27904, 1146, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Desolace 37 objects total
(13215, 1146, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Desolace 37 objects total
(13216, 1146, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Desolace 37 objects total
(387717, 1146, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Desolace 37 objects total
(34199, 1146, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Desolace 37 objects total
(13607, 1146, 0, 'Mithril Deposit', 0, 10); -- Mithril Deposits in Desolace 37 objects total

-- Missing Mithril Deposit spawns in Tanaris.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(387718, 2040, 1, -8409.17, -3354.81, 17.3865, 0.575957, 0, 0, 0.284015, 0.95882, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7277 at 284.889191 yards.
(387719, 2040, 1, -9013.94, -4161.08, 8.55525, 3.3685, 0, 0, -0.993571, 0.113208, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7308 at 51.802792 yards.
(387720, 2040, 1, -9032.32, -4171.35, -29.587, 3.64774, 0, 0, -0.968147, 0.250381, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7308 at 22.657204 yards.
(387721, 2040, 1, -9183.13, -4206.48, -44.1234, 3.56047, 0, 0, -0.978148, 0.207912, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7158 at 69.006104 yards.
(387722, 2040, 1, -9568.28, -2611.01, 31.4629, 0.488691, 0, 0, 0.241921, 0.970296, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 17477 at 113.288643 yards.
(387723, 2040, 1, -8237.67, -2772.79, 30.5581, 4.11898, 0, 0, -0.882947, 0.469473, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7328 at 317.338440 yards.
(387724, 2040, 1, -8103.43, -2419.51, -45.8249, 1.309, 0, 0, 0.608761, 0.793354, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7253 at 113.272545 yards.
(387725, 2040, 1, -8066.52, -2266.52, 15.7821, 3.90954, 0, 0, -0.927183, 0.374608, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7253 at 155.858536 yards.
(387726, 2040, 1, -7106.94, -2582.7, 13.6203, 4.50295, 0, 0, -0.777145, 0.629321, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7184 at 197.752853 yards.
(387727, 2040, 1, -7242.14, -3437.92, 13.3299, 1.0472, 0, 0, 0.5, 0.866025, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7181 at 258.301453 yards.
(387728, 2040, 1, -8349.22, -4346.75, 15.8852, 4.13643, 0, 0, -0.878817, 0.47716, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 17484 at 480.471069 yards.
(387729, 2040, 1, -9196.5, -3915.01, -31.9711, 4.04917, 0, 0, -0.898793, 0.438373, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 17481 at 171.523590 yards.
(387730, 2040, 1, -7866.98, -2659.8, -55.7798, 0.645772, 0, 0, 0.317305, 0.948324, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7192 at 53.099216 yards.
(387731, 2040, 1, -7987.72, -2537.27, -45.9242, 2.87979, 0, 0, 0.991445, 0.130528, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 17489 at 27.231962 yards.
(387732, 2040, 1, -7728.64, -2599.35, -58.1333, 0.261798, 0, 0, 0.130526, 0.991445, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 7152 at 11.318727 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(387718, 1203, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Tanaris 37 objects total
(387719, 1203, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Tanaris 37 objects total
(387720, 1203, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Tanaris 37 objects total
(387721, 1203, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Tanaris 37 objects total
(387722, 1203, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Tanaris 37 objects total
(387723, 1203, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Tanaris 37 objects total
(387724, 1203, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Tanaris 37 objects total
(387725, 1203, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Tanaris 37 objects total
(387726, 1203, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Tanaris 37 objects total
(387727, 1203, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Tanaris 37 objects total
(387728, 1203, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Tanaris 37 objects total
(387729, 1203, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Tanaris 37 objects total
(387730, 1203, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Tanaris 37 objects total
(387731, 1203, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Tanaris 37 objects total
(387732, 1203, 0, 'Mithril Deposit', 0, 10); -- Mithril Deposits in Tanaris 37 objects total

-- Missing Mithril Deposit spawns in Un'Goro Crater.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES (299, 6, 'Mithril Deposits in Ungoro');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(18005, 2040, 1, -7001.47, -2450.71, -215.175, 4.95674, 0, 0, -0.615661, 0.788011, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 18004 at 395.048798 yards.
(18006, 2040, 1, -6353.36, -1076.58, -271.628, 2.77507, 0, 0, 0.983254, 0.182238, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 18004 at 1670.304443 yards.
(18007, 2040, 1, -6346.85, -1587.08, -268.273, 1.32645, 0, 0, 0.615661, 0.788011, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 18004 at 1314.703491 yards.
(18015, 2040, 1, -7181.35, -685.201, -267.175, 6.16101, 0, 0, -0.0610485, 0.998135, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 18004 at 1712.812622 yards.
(18129, 2040, 1, -7720.98, -1329.27, -266.113, 4.76475, 0, 0, -0.688354, 0.725374, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 18004 at 1106.655273 yards.
(18131, 2040, 1, -6482.95, -749.834, -270.295, 2.70526, 0, 0, 0.976295, 0.216442, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 18004 at 1870.577026 yards.
(18138, 2040, 1, -8148.67, -1107.1, -219.01, 1.50098, 0, 0, 0.681998, 0.731354, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 18004 at 1485.151733 yards.
(18176, 2040, 1, -6414.91, -1786.3, -267.509, 3.73501, 0, 0, -0.956305, 0.292372, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 18004 at 1145.814087 yards.
(18178, 2040, 1, -7598.37, -1725.01, -268.873, 1.93731, 0, 0, 0.824125, 0.566408, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 18004 at 693.227844 yards.
(18180, 2040, 1, -6828.59, -1685.69, -264.789, 0.59341, 0, 0, 0.292371, 0.956305, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 18004 at 898.174805 yards.
(18182, 2040, 1, -7567.56, -1400.13, -265.711, 5.2709, 0, 0, -0.484809, 0.87462, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 18004 at 1001.196716 yards.
(18186, 2040, 1, -7557.78, -866.94, -267.322, 3.59538, 0, 0, -0.97437, 0.224951, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 18004 at 1527.443237 yards.
(18188, 2040, 1, -6836.58, -980.387, -262.594, 1.309, 0, 0, 0.608761, 0.793354, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 18004 at 1510.175781 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(18005, 299, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Ungoro
(18006, 299, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Ungoro
(18007, 299, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Ungoro
(18015, 299, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Ungoro
(18129, 299, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Ungoro
(18131, 299, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Ungoro
(18138, 299, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Ungoro
(18176, 299, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Ungoro
(18178, 299, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Ungoro
(18180, 299, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Ungoro
(18182, 299, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Ungoro
(18186, 299, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Ungoro
(18188, 299, 0, 'Mithril Deposit', 0, 10); -- Mithril Deposits in Ungoro

-- Missing Mithril Deposit spawns in Winterspring.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(49188, 2040, 1, 6809.32, -4122.53, 718.508, 3.56047, 0, 0, -0.978148, 0.207912, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49176 at 417.122253 yards.
(49219, 2040, 1, 6421.83, -3610.23, 701.964, 2.11185, 0, 0, 0.870356, 0.492424, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49176 at 431.721130 yards.
(49220, 2040, 1, 6855.67, -2513.47, 568.177, 0.733038, 0, 0, 0.358368, 0.93358, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49177 at 506.412659 yards.
(49221, 2040, 1, 6694.52, -2552.11, 533.295, 0.820303, 0, 0, 0.398748, 0.91706, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49177 at 357.788757 yards.
(49222, 2040, 1, 6304.15, -2418.64, 558.7, 0.244346, 0, 0, 0.121869, 0.992546, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49177 at 399.138306 yards.
(49224, 2040, 1, 6881.43, -3540.6, 731.622, 1.71042, 0, 0, 0.754709, 0.656059, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49176 at 171.236847 yards.
(49227, 2040, 1, 6691.43, -2944.9, 577.266, 4.85202, 0, 0, -0.656058, 0.75471, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49177 at 296.790283 yards.
(49228, 2040, 1, 6743.8, -3450.22, 677.85, 5.11382, 0, 0, -0.551936, 0.833886, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49176 at 280.684052 yards.
(49229, 2040, 1, 6801.23, -2694.93, 553.018, 5.18363, 0, 0, -0.522498, 0.85264, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 49177 at 380.177124 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(49188, 1330, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposit in Winterspring 19 objects total
(49219, 1330, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposit in Winterspring 19 objects total
(49220, 1330, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposit in Winterspring 19 objects total
(49221, 1330, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposit in Winterspring 19 objects total
(49222, 1330, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposit in Winterspring 19 objects total
(49224, 1330, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposit in Winterspring 19 objects total
(49227, 1330, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposit in Winterspring 19 objects total
(49228, 1330, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposit in Winterspring 19 objects total
(49229, 1330, 0, 'Mithril Deposit', 0, 10); -- Mithril Deposit in Winterspring 19 objects total

-- Missing Mithril Deposit spawns in Uldaman.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(13574, 2040, 0, -6271.73, -2913.52, 227.83, 2.89725, 0, 0, 0.992546, 0.12187, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 11495 at 128.153702 yards.
(13581, 2040, 0, -6280.71, -2957.27, 224.883, 1.37881, 0, 0, 0.636078, 0.771625, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 11495 at 154.363235 yards.
(13582, 2040, 0, -6152.34, -3027.72, 220.905, 2.19911, 0, 0, 0.891006, 0.453991, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 7170 at 13.061338 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(13574, 1289, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Badlands 31 objects total
(13581, 1289, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Badlands 31 objects total
(13582, 1289, 0, 'Mithril Deposit', 0, 10); -- Mithril Deposits in Badlands 31 objects total

-- Missing Mithril Deposit spawns in Maraudon.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(34197, 2040, 1, -1563.17, 2683.34, 93.2477, 1.23918, 0, 0, 0.580703, 0.814116, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34179 at 133.657623 yards.
(13210, 2040, 1, -1405.84, 2835.96, 78.7253, 1.48353, 0, 0, 0.67559, 0.737278, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7203 at 76.646622 yards.
(13232, 2040, 1, -1440.75, 2949.23, 124.248, 5.79449, 0, 0, -0.241921, 0.970296, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7203 at 58.726345 yards.
(34198, 2040, 1, -1445.41, 2712.28, 78.1281, 2.35619, 0, 0, 0.92388, 0.382683, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34179 at 101.384369 yards.
(13586, 2040, 1, -1375.16, 2722.34, 94.2334, 2.86234, 0, 0, 0.990268, 0.139175, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 7320 at 123.181419 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(34197, 1146, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Desolace 37 objects total
(13210, 1146, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Desolace 37 objects total
(13232, 1146, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Desolace 37 objects total
(34198, 1146, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Desolace 37 objects total
(13586, 1146, 0, 'Mithril Deposit', 0, 10); -- Mithril Deposits in Desolace 37 objects total

-- Missing Mithril Deposit spawns in Hillsbrad
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES (323, 1, 'Mithril Deposits in Hillsbrad');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(29012, 2040, 0, -154.448, -345.575, 50.5997, 1.27409, 0, 0, 0.594822, 0.803857, 300, 300, 1, 100, 0, 10),
(82090, 2040, 0, -219.275, -317.052, 73.0997, 3.63029, 0, 0, -0.970295, 0.241925, 300, 300, 1, 100, 0, 10),
(29014, 2040, 0, -252.057, -306.233, 54.1448, 3.35105, 0, 0, -0.994521, 0.104536, 300, 300, 1, 100, 0, 10),
(29015, 2040, 0, -121.89, -364.606, 53.3096, 5.09636, 0, 0, -0.559193, 0.829038, 300, 300, 1, 100, 0, 10),
(29016, 2040, 0, -291.373, -291.808, 44.137, 1.97222, 0, 0, 0.833885, 0.551938, 300, 300, 1, 100, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(29012, 323, 0, 'Mithril Deposit', 0, 10),
(82090, 323, 0, 'Mithril Deposit', 0, 10),
(29014, 323, 0, 'Mithril Deposit', 0, 10),
(29015, 323, 0, 'Mithril Deposit', 0, 10),
(29016, 323, 0, 'Mithril Deposit', 0, 10);

-- Missing Mithril Deposit spawns in Stonetalon
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES (324, 1, 'Mithril Deposits in Stonetalon');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(29017, 2040, 1, 793.298, 1391.64, -0.47419, 1.32645, 0, 0, 0.615661, 0.788011, 300, 300, 1, 100, 0, 10),
(29018, 2040, 1, 450.51, 1604.75, 24.6407, 5.95157, 0, 0, -0.165047, 0.986286, 300, 300, 1, 100, 0, 10),
(29019, 2040, 1, 1392.52, 1516.42, 146.42, 0.733038, 0, 0, 0.358368, 0.93358, 300, 300, 1, 100, 0, 10),
(29020, 2040, 1, 744.61, 1543.04, -18.1738, 5.89921, 0, 0, -0.190808, 0.981627, 300, 300, 1, 100, 0, 10),
(29021, 2040, 1, 663.333, 1399.73, 21.9571, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 1, 100, 0, 10),
(29022, 2040, 1, 516.378, 1829.76, 12.888, 3.15906, 0, 0, -0.999962, 0.00873464, 300, 300, 1, 100, 0, 10),
(29023, 2040, 1, 857.82, 1923.35, 25.0864, 1.25664, 0, 0, 0.587785, 0.809017, 300, 300, 1, 100, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(29017, 324, 0, 'Mithril Deposit', 0, 10),
(29018, 324, 0, 'Mithril Deposit', 0, 10),
(29019, 324, 0, 'Mithril Deposit', 0, 10),
(29020, 324, 0, 'Mithril Deposit', 0, 10),
(29021, 324, 0, 'Mithril Deposit', 0, 10),
(29022, 324, 0, 'Mithril Deposit', 0, 10),
(29023, 324, 0, 'Mithril Deposit', 0, 10);

-- Missing Mithril Deposit spawns in Eastern Plaguelands
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES (325, 1, 'Mithril Deposits in Eastern Plaguelands');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(29024, 2040, 0, 1786.47, -2717.86, 86.9323, 5.41052, 0, 0, -0.422618, 0.906308, 300, 300, 1, 100, 0, 10),
(29025, 2040, 0, 2226.71, -2750.54, 88.3278, 0.558504, 0, 0, 0.275637, 0.961262, 300, 300, 1, 100, 0, 10),
(29026, 2040, 0, 1897.5, -3642.02, 132.624, 3.75246, 0, 0, -0.953716, 0.300708, 300, 300, 1, 100, 0, 10),
(29027, 2040, 0, 1528.01, -3881.09, 157.042, 3.50812, 0, 0, -0.983254, 0.182238, 300, 300, 1, 100, 0, 10),
(29028, 2040, 0, 1903.44, -3134.22, 107.396, 5.21854, 0, 0, -0.507538, 0.861629, 300, 300, 1, 100, 0, 10),
(29029, 2040, 0, 2071.16, -2985.42, 91.1268, 1.36136, 0, 0, 0.62932, 0.777146, 300, 300, 1, 100, 0, 10),
(29030, 2040, 0, 1853.97, -3791.3, 144.32, 0.523598, 0, 0, 0.258819, 0.965926, 300, 300, 1, 100, 0, 10),
(29031, 2040, 0, 1651.95, -3570.09, 130.989, 3.94445, 0, 0, -0.920505, 0.390732, 300, 300, 1, 100, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(29024, 325, 0, 'Mithril Deposit', 0, 10),
(29025, 325, 0, 'Mithril Deposit', 0, 10),
(29026, 325, 0, 'Mithril Deposit', 0, 10),
(29027, 325, 0, 'Mithril Deposit', 0, 10),
(29028, 325, 0, 'Mithril Deposit', 0, 10),
(29029, 325, 0, 'Mithril Deposit', 0, 10),
(29030, 325, 0, 'Mithril Deposit', 0, 10),
(29031, 325, 0, 'Mithril Deposit', 0, 10);

-- Missing Mithril Deposit spawns in Silithus
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES (326, 1, 'Mithril Deposits in Silithus');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(29032, 2040, 1, -7037.16, 615.484, 9.91324, 5.58505, 0, 0, -0.34202, 0.939693, 300, 300, 1, 100, 0, 10),
(29033, 2040, 1, -7635.38, 1600.22, 14.7116, 6.0912, 0, 0, -0.0958452, 0.995396, 300, 300, 1, 100, 0, 10),
(29034, 2040, 1, -8053.13, 1759.93, 10.0795, 3.14159, 0, 0, -1, 0, 300, 300, 1, 100, 0, 10),
(29035, 2040, 1, -6277.1, 1250.14, 18.5354, 2.25147, 0, 0, 0.902585, 0.430512, 300, 300, 1, 100, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(29032, 326, 0, 'Mithril Deposit', 0, 10),
(29033, 326, 0, 'Mithril Deposit', 0, 10),
(29034, 326, 0, 'Mithril Deposit', 0, 10),
(29035, 326, 0, 'Mithril Deposit', 0, 10);

-- Missing Mithril Deposit spawns in Thousand Needles
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES (327, 1, 'Mithril Deposits in Thousand Needles');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(29036, 2040, 1, -4871.51, -2358.7, -53.7004, 4.31097, 0, 0, -0.833885, 0.551938, 300, 300, 1, 100, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(29036, 327, 0, 'Mithril Deposit', 0, 10);

-- Missing Mithril Deposit spawns in Felwood
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES (328, 1, 'Mithril Deposits in Felwood');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(31474, 176645, 1, 3499.25, -1117.15, 230.418, 1.0821, 0, 0, 0.515038, 0.857168, 300, 300, 1, 100, 0, 10),
(31475, 176645, 1, 4581.32, -955.979, 339.161, 3.15906, 0, 0, -0.999962, 0.00873464, 300, 300, 1, 100, 0, 10),
(31476, 176645, 1, 5278.41, -541.085, 273.116, 3.6652, 0, 0, -0.965925, 0.258821, 300, 300, 1, 100, 0, 10),
(31477, 176645, 1, 6348.48, -1705.57, 439.886, 4.92183, 0, 0, -0.62932, 0.777146, 300, 300, 1, 100, 0, 10),
(31478, 176645, 1, 5154.33, -526.877, 345.128, 1.6057, 0, 0, 0.719339, 0.694659, 300, 300, 1, 100, 0, 10),
(31479, 176645, 1, 6401.62, -1674.39, 419.268, 3.94445, 0, 0, -0.920505, 0.390732, 300, 300, 1, 100, 0, 10),
(31480, 176645, 1, 3649.17, -1207.23, 220.904, 0.191985, 0, 0, 0.0958452, 0.995396, 300, 300, 1, 100, 0, 10),
(31481, 176645, 1, 4802.7, -557.871, 275.073, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 1, 100, 0, 10),
(31482, 176645, 1, 4760.73, -579.275, 281.063, 2.93214, 0, 0, 0.994521, 0.104536, 300, 300, 1, 100, 0, 10),
(31483, 176645, 1, 4753.38, -589.886, 283.662, 2.56563, 0, 0, 0.958819, 0.284016, 300, 300, 1, 100, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(31474, 328, 0, 'Mithril Deposit', 0, 10),
(31475, 328, 0, 'Mithril Deposit', 0, 10),
(31476, 328, 0, 'Mithril Deposit', 0, 10),
(31477, 328, 0, 'Mithril Deposit', 0, 10),
(31478, 328, 0, 'Mithril Deposit', 0, 10),
(31479, 328, 0, 'Mithril Deposit', 0, 10),
(31480, 328, 0, 'Mithril Deposit', 0, 10),
(31481, 328, 0, 'Mithril Deposit', 0, 10),
(31482, 328, 0, 'Mithril Deposit', 0, 10),
(31483, 328, 0, 'Mithril Deposit', 0, 10);

UPDATE `pool_template` SET `description`='Mithril Deposits in Dustwallow Marsh' WHERE  `entry`=43524;
UPDATE `pool_template` SET `description`='Mithril Deposits in Azshara 22 objects total' WHERE  `entry`=1329;
UPDATE `pool_template` SET `description`='Mithril Deposits in Winterspring 19 objects total' WHERE  `entry`=1330;
UPDATE `pool_template` SET `description`='Mithril Deposits in Swamp of Sorrows 17 objects total' WHERE  `entry`=1315;

-- OOZE COVERED MITHRIL ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Create new pool to hold Ooze Covered Mithril Deposit spawns in Thousand Needles.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(304, 1, 'Ooze Covered Mithril Deposits in Thousand Needles', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(15429, 304, 0, 'Ooze Covered Mithril Deposit', 0, 10),
(15437, 304, 0, 'Ooze Covered Mithril Deposit', 0, 10),
(15443, 304, 0, 'Ooze Covered Mithril Deposit', 0, 10),
(15444, 304, 0, 'Ooze Covered Mithril Deposit', 0, 10),
(15445, 304, 0, 'Ooze Covered Mithril Deposit', 0, 10),
(15447, 304, 0, 'Ooze Covered Mithril Deposit', 0, 10),
(15449, 304, 0, 'Ooze Covered Mithril Deposit', 0, 10),
(15450, 304, 0, 'Ooze Covered Mithril Deposit', 0, 10),
(17085, 304, 0, 'Ooze Covered Mithril Deposit', 0, 10),
(17086, 304, 0, 'Ooze Covered Mithril Deposit', 0, 10);

-- Correct position of Ooze Covered Mithril Deposit in Thousand Needles (position is off by 0.960965 yards).
UPDATE `gameobject` SET `position_x`=-6395.6, `position_y`=-3482.74, `position_z`=-70.1255, `orientation`=5.61996, `rotation0`=0, `rotation1`=0, `rotation2`=-0.325567, `rotation3`=0.945519 WHERE `guid`=15437;

-- Missing Ooze Covered Mithril Deposit spawns in Feralas.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(16678, 123310, 1, -5335.88, 330.337, 19.5203, 0.610863, 0, 0, 0.300705, 0.953717, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 15446 at 38.125507 yards.
(16679, 123310, 1, -5221.93, 98.6769, 31.7134, 3.56047, 0, 0, -0.978148, 0.207912, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 15433 at 45.749561 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(16678, 1198, 0, 'Ooze Covered Mithril Deposit', 0, 10), -- Ooze Covered Mithril in Feralas 17 objects total
(16679, 1198, 0, 'Ooze Covered Mithril Deposit', 0, 10); -- Ooze Covered Mithril in Feralas 17 objects total

-- Missing Ooze Covered Mithril Deposit spawns in Thousand Needles.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(16675, 123310, 1, -6512.62, -3470.86, -69.1632, 2.14675, 0, 0, 0.878817, 0.47716, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 15449 at 41.873108 yards.
(16676, 123310, 1, -6518.18, -3307.59, -93.4714, 2.19911, 0, 0, 0.891006, 0.453991, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 15443 at 7.179568 yards.
(16677, 123310, 1, -6458.28, -3487.44, -69.0885, 2.28638, 0, 0, 0.909961, 0.414694, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 15447 at 35.912548 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(16675, 304, 0, 'Ooze Covered Mithril Deposit', 0, 10), -- Ooze Covered Mithril Deposits in Thousand Needles
(16676, 304, 0, 'Ooze Covered Mithril Deposit', 0, 10), -- Ooze Covered Mithril Deposits in Thousand Needles
(16677, 304, 0, 'Ooze Covered Mithril Deposit', 0, 10); -- Ooze Covered Mithril Deposits in Thousand Needles

UPDATE `pool_template` SET `description`='Ooze Covered Mithril Deposits in Feralas 17 objects total' WHERE  `entry`=1198;

-- OOZE COVERED RICH THORIUM ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Missing Ooze Covered Rich Thorium Vein spawns in Silithus.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(49453, 177388, 1, -6613.57, 880.51, 1.43134, 3.78737, 0, 0, -0.948323, 0.317306, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 49436 at 87.474739 yards.
(49454, 177388, 1, -6600.76, 759.011, -51.7008, 5.65487, 0, 0, -0.309016, 0.951057, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 49436 at 189.723053 yards.
(20553, 177388, 1, -6658.89, 1069.41, -28.0512, 3.47321, 0, 0, -0.986285, 0.16505, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 20552 at 6.181974 yards.
(49455, 177388, 1, -7358.18, 1271.68, -85.4734, 5.93412, 0, 0, -0.173648, 0.984808, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 49448 at 113.916283 yards.
(49456, 177388, 1, -7548.23, 1406.13, -92.8264, 5.48033, 0, 0, -0.390731, 0.920505, 2700, 2700, 1, 100, 0, 10); -- Closest existing guid is 49448 at 141.991165 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(49453, 37000, 0, 'Ooze Covered Rich Thorium Vein', 0, 10), -- Silithus [Ooze Covered Rich Thorium Vein]
(49454, 37000, 0, 'Ooze Covered Rich Thorium Vein', 0, 10), -- Silithus [Ooze Covered Rich Thorium Vein]
(20553, 37000, 0, 'Ooze Covered Rich Thorium Vein', 0, 10), -- Silithus [Ooze Covered Rich Thorium Vein]
(49455, 37000, 0, 'Ooze Covered Rich Thorium Vein', 0, 10), -- Silithus [Ooze Covered Rich Thorium Vein]
(49456, 37000, 0, 'Ooze Covered Rich Thorium Vein', 0, 10); -- Silithus [Ooze Covered Rich Thorium Vein]

-- OOZE COVERED THORIUM ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Correct position of Ooze Covered Thorium Vein in Un'Goro Crater (position is off by 0.792379 yards).
UPDATE `gameobject` SET `position_x`=-7945.01, `position_y`=-1286.78, `position_z`=-278.139, `orientation`=2.61799, `rotation0`=0, `rotation1`=0, `rotation2`=0.965925, `rotation3`=0.258821 WHERE `guid`=15462;

-- Correct position of Ooze Covered Thorium Vein in Un'Goro Crater (position is off by 4.60743 yards).
UPDATE `gameobject` SET `position_x`=-7963.21, `position_y`=-1072.9, `position_z`=-326.898, `orientation`=1.51844, `rotation0`=0, `rotation1`=0, `rotation2`=0.688354, `rotation3`=0.725374 WHERE `guid`=15470;

-- Missing Ooze Covered Thorium Vein spawns in Un'Goro Crater.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(16680, 123848, 1, -8118.19, -1238.8, -339.222, 4.29351, 0, 0, -0.83867, 0.54464, 2700, 2700, 1, 100, 0, 10); -- Closest existing guid is 15460 at 32.626099 yards.

-- RICH THORIUM ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Correct position of Rich Thorium Vein in Burning Steppes (position is off by 1.06682 yards).
UPDATE `gameobject` SET `position_x`=-7685, `position_y`=-1650.93, `position_z`=144.559, `orientation`=0.296705, `rotation0`=0, `rotation1`=0, `rotation2`=0.147809, `rotation3`=0.989016 WHERE `guid`=18321;

-- Correct position of Rich Thorium Vein in Burning Steppes (position is off by 0.507709 yards).
UPDATE `gameobject` SET `position_x`=-7905.12, `position_y`=-1491.49, `position_z`=155.801, `orientation`=0.226892, `rotation0`=0, `rotation1`=0, `rotation2`=0.113203, `rotation3`=0.993572 WHERE `guid`=18405;

-- Correct position of Rich Thorium Vein in Burning Steppes (position is off by 0.587081 yards).
UPDATE `gameobject` SET `position_x`=-8253.05, `position_y`=-1695.74, `position_z`=158.461, `orientation`=5.70723, `rotation0`=0, `rotation1`=0, `rotation2`=-0.284015, `rotation3`=0.95882 WHERE `guid`=18320;

-- Correct position of Rich Thorium Vein in Burning Steppes (position is off by 0.254358 yards).
UPDATE `gameobject` SET `position_x`=-8019.87, `position_y`=-743.805, `position_z`=142.527, `orientation`=2.04204, `rotation0`=0, `rotation1`=0, `rotation2`=0.85264, `rotation3`=0.522499 WHERE `guid`=18427;

-- Correct position of Rich Thorium Vein in Winterspring (position is off by 0.0010376 yards).
UPDATE `gameobject` SET `position_x`=6756.85, `position_y`=-5040.41, `position_z`=730.882, `orientation`=4.71239, `rotation0`=0, `rotation1`=0, `rotation2`=-0.707107, `rotation3`=0.707107 WHERE `guid`=18503;

-- Correct position of Rich Thorium Vein in Eastern Plaguelands (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=2166.58, `position_y`=-4987.38, `position_z`=56.6599, `orientation`=4.15388, `rotation0`=0, `rotation1`=0, `rotation2`=-0.874619, `rotation3`=0.48481 WHERE `guid`=18518;

-- Correct position of Rich Thorium Vein in Un'Goro Crater (position is off by 1.45577 yards).
UPDATE `gameobject` SET `position_x`=-7075.35, `position_y`=-1190.53, `position_z`=-248.725, `orientation`=3.71755, `rotation0`=0, `rotation1`=0, `rotation2`=-0.958819, `rotation3`=0.284016 WHERE `guid`=18311;

-- Missing Rich Thorium Vein spawns in Azshara.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(48931, 175404, 1, 3152.03, -6037.21, 4.75105, 1.98967, 0, 0, 0.83867, 0.54464, 2700, 2700, 1, 100, 0, 10); -- Closest existing guid is 48298 at 594.329285 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(48931, 1246, 0, 'Rich Thorium Vein', 0, 10); -- Rich Thorium Veins in Azshara 34 objects total

-- Missing Rich Thorium Vein spawns in Burning Steppes.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(18589, 175404, 0, -7737.77, -2306.15, 141.825, 3.71755, 0, 0, -0.958819, 0.284016, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 18392 at 105.059891 yards.
(18592, 175404, 0, -7651.12, -3066.23, 135.603, 3.61284, 0, 0, -0.972369, 0.233448, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 18390 at 683.753479 yards.
(18612, 175404, 0, -7611.14, -2387.1, 137.676, 6.14356, 0, 0, -0.0697556, 0.997564, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 18390 at 46.877720 yards.
(18613, 175404, 0, -7818.59, -1621.74, 143.013, 4.13643, 0, 0, -0.878817, 0.47716, 2700, 2700, 1, 100, 0, 10); -- Closest existing guid is 18415 at 90.170799 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(18589, 1299, 0, 'Rich Thorium Vein', 0, 10), -- Rich Thorium Veins in Burning Steppes 44 objects total
(18592, 1299, 0, 'Rich Thorium Vein', 0, 10), -- Rich Thorium Veins in Burning Steppes 44 objects total
(18612, 1299, 0, 'Rich Thorium Vein', 0, 10), -- Rich Thorium Veins in Burning Steppes 44 objects total
(18613, 1299, 0, 'Rich Thorium Vein', 0, 10); -- Rich Thorium Veins in Burning Steppes 44 objects total

-- Missing Rich Thorium Vein spawns in Eastern Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(18384, 175404, 0, 2066.89, -5049.99, 54.2746, 6.26573, 0, 0, -0.00872612, 0.999962, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 18348 at 34.715309 yards.
(18606, 175404, 0, 2806.29, -4762.35, 88.8857, 5.44543, 0, 0, -0.406736, 0.913546, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 18409 at 244.927658 yards.
(18608, 175404, 0, 2233.68, -5041.2, 58.3313, 0.122173, 0, 0, 0.0610485, 0.998135, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 18518 at 86.041580 yards.
(18609, 175404, 0, 2300.42, -5140.93, 56.7484, 5.88176, 0, 0, -0.199368, 0.979925, 2700, 2700, 1, 100, 0, 10); -- Closest existing guid is 18521 at 89.248489 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(18384, 1274, 0, 'Rich Thorium Vein', 0, 10), -- Rich Thorium Veins in Eastern Plaguelands 26 objects total
(18606, 1274, 0, 'Rich Thorium Vein', 0, 10), -- Rich Thorium Veins in Eastern Plaguelands 26 objects total
(18608, 1274, 0, 'Rich Thorium Vein', 0, 10), -- Rich Thorium Veins in Eastern Plaguelands 26 objects total
(18609, 1274, 0, 'Rich Thorium Vein', 0, 10); -- Rich Thorium Veins in Eastern Plaguelands 26 objects total

-- Missing Rich Thorium Vein spawns in Un'Goro Crater.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(39946, 175404, 1, -7246.51, -1459.93, -223.326, 2.44346, 0, 0, 0.939692, 0.34202, 2700, 2700, 1, 100, 0, 10); -- Closest existing guid is 39945 at 8.162623 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(39946, 1217, 0, 'Rich Thorium Vein', 0, 10); -- Rich Thorium Veins in Ungoro 25 objects total

-- Missing Rich Thorium Vein spawns in Winterspring.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(18588, 175404, 1, 5910.75, -4169.74, 606.879, 3.42085, 0, 0, -0.990268, 0.139175, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 18388 at 248.469803 yards.
(49080, 175404, 1, 5748.65, -4983.06, 809.087, 4.69494, 0, 0, -0.71325, 0.70091, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 49005 at 91.946747 yards.
(18387, 175404, 1, 6433.16, -4100.37, 669.295, 4.76475, 0, 0, -0.688354, 0.725374, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 18357 at 35.614834 yards.
(18667, 175404, 1, 6769.06, -5200.93, 760.343, 1.53589, 0, 0, 0.694658, 0.71934, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 18345 at 21.827044 yards.
(18668, 175404, 1, 6768.02, -5337.8, 744.37, 0.296705, 0, 0, 0.147809, 0.989016, 2700, 2700, 1, 100, 0, 10); -- Closest existing guid is 18371 at 114.185959 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(18588, 1235, 0, 'Rich Thorium Vein', 0, 10), -- Rich Thorium Veins in Winterspring 41 objects total
(49080, 1235, 0, 'Rich Thorium Vein', 0, 10), -- Rich Thorium Veins in Winterspring 41 objects total
(18387, 1235, 0, 'Rich Thorium Vein', 0, 10), -- Rich Thorium Veins in Winterspring 41 objects total
(18667, 1235, 0, 'Rich Thorium Vein', 0, 10), -- Rich Thorium Veins in Winterspring 41 objects total
(18668, 1235, 0, 'Rich Thorium Vein', 0, 10); -- Rich Thorium Veins in Winterspring 41 objects total

UPDATE `pool_template` SET `description`='Rich Thorium Veins in Dire Maul' WHERE  `entry`=4301;

-- SILVER ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Missing Silver Vein spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(15166, 1733, 0, -3858.7, -2624.47, 63.9141, 4.45059, 0, 0, -0.793353, 0.608762, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15158 at 121.095459 yards.
(15179, 1733, 0, -3766.71, -2700.05, 38.3341, 4.24115, 0, 0, -0.85264, 0.522499, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15158 at 81.384659 yards.
(15185, 1733, 0, -3766.69, -2633.3, 75.8543, 4.88692, 0, 0, -0.642787, 0.766045, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15158 at 37.128365 yards.
(15186, 1733, 0, -3683.25, -2596.19, 63.3477, 0.471238, 0, 0, 0.233445, 0.97237, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15158 at 62.871765 yards.
(13663, 1733, 0, -4300.05, -2679.25, 70.5852, 4.32842, 0, 0, -0.829037, 0.559194, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5687 at 473.009552 yards.
(13667, 1733, 0, -4247.21, -2627.36, 65.4306, 5.70723, 0, 0, -0.284015, 0.95882, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 5687 at 402.016144 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(15166, 1159, 0, 'Silver Vein', 0, 10), -- Silver Veins in Wetlands 7 objects total
(15179, 1159, 0, 'Silver Vein', 0, 10), -- Silver Veins in Wetlands 7 objects total
(15185, 1159, 0, 'Silver Vein', 0, 10), -- Silver Veins in Wetlands 7 objects total
(15186, 1159, 0, 'Silver Vein', 0, 10), -- Silver Veins in Wetlands 7 objects total
(13663, 1159, 0, 'Silver Vein', 0, 10), -- Silver Veins in Wetlands 7 objects total
(13667, 1159, 0, 'Silver Vein', 0, 10); -- Silver Veins in Wetlands 7 objects total

-- Missing Silver Vein spawns in The Barrens.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(387733, 1733, 1, 16.4664, -1378.21, 100.787, 1.41372, 0, 0, 0.649447, 0.760406, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5759 at 512.348755 yards.
(387734, 1733, 1, 1024.2, -3380.53, 97.7864, 0.383971, 0, 0, 0.190808, 0.981627, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5759 at 2010.238525 yards.
(387735, 1733, 1, -2062.71, -1949.56, 91.6667, 1.71042, 0, 0, 0.754709, 0.656059, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5686 at 530.699097 yards.
(387736, 1733, 1, 521.879, -3235.76, 118.281, 2.84488, 0, 0, 0.989016, 0.147811, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5759 at 1609.261597 yards.
(387737, 1733, 1, 797.905, -1798.65, 92.4391, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 15704 at 526.434509 yards.
(387738, 1733, 1, -3025.72, -2184.11, 102.403, 0.331611, 0, 0, 0.165047, 0.986286, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5686 at 1371.216064 yards.
(387739, 1733, 1, -3576.01, -1793.37, 96.8127, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5686 at 1981.325928 yards.
(387740, 1733, 1, -1425.03, -2045.83, 83.8641, 5.86431, 0, 0, -0.207911, 0.978148, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5686 at 341.087646 yards.
(387741, 1733, 1, -1729.69, -3879.37, 25.8715, 3.17653, 0, 0, -0.999847, 0.0174693, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5686 at 1588.125977 yards.
(387742, 1733, 1, -2266.12, -2536.62, 92.2936, 0.663223, 0, 0, 0.325567, 0.945519, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5686 at 653.824402 yards.
(387743, 1733, 1, -395.093, -1589.36, 101.445, 3.4383, 0, 0, -0.989016, 0.147811, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5759 at 276.274414 yards.
(387744, 1733, 1, -1086.76, -2178, 65.2551, 0.0349062, 0, 0, 0.0174522, 0.999848, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5686 at 584.287354 yards.
(387745, 1733, 1, -1645.21, -2619.43, 86.5365, 1.06465, 0, 0, 0.507538, 0.861629, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5686 at 325.722443 yards.
(387746, 105569, 1, -4133.86, -2145.77, 51.8004, 2.25147, 0, 0, 0.902585, 0.430512, 300, 300, 1, 100, 0, 10),
(387747, 105569, 1, -4224.98, -2266.66, 52.3942, 0.95993, 0, 0, 0.461748, 0.887011, 300, 300, 1, 100, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(387733, 1035, 0, 'Silver Vein', 0, 10), -- Silver Veins in Barrens 5 objects total
(387734, 1035, 0, 'Silver Vein', 0, 10), -- Silver Veins in Barrens 5 objects total
(387735, 1035, 0, 'Silver Vein', 0, 10), -- Silver Veins in Barrens 5 objects total
(387736, 1035, 0, 'Silver Vein', 0, 10), -- Silver Veins in Barrens 5 objects total
(387737, 1035, 0, 'Silver Vein', 0, 10), -- Silver Veins in Barrens 5 objects total
(387738, 1035, 0, 'Silver Vein', 0, 10), -- Silver Veins in Barrens 5 objects total
(387739, 1035, 0, 'Silver Vein', 0, 10), -- Silver Veins in Barrens 5 objects total
(387740, 1035, 0, 'Silver Vein', 0, 10), -- Silver Veins in Barrens 5 objects total
(387741, 1035, 0, 'Silver Vein', 0, 10), -- Silver Veins in Barrens 5 objects total
(387742, 1035, 0, 'Silver Vein', 0, 10), -- Silver Veins in Barrens 5 objects total
(387743, 1035, 0, 'Silver Vein', 0, 10), -- Silver Veins in Barrens 5 objects total
(387744, 1035, 0, 'Silver Vein', 0, 10), -- Silver Veins in Barrens 5 objects total
(387745, 1035, 0, 'Silver Vein', 0, 10), -- Silver Veins in Barrens 5 objects total
(387746, 1035, 0, 'Silver Vein', 0, 10), -- Silver Veins in Barrens 5 objects total
(387747, 1035, 0, 'Silver Vein', 0, 10); -- Silver Veins in Barrens 5 objects total

-- Missing Silver Vein spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(387748, 1733, 1, 3496.51, 160.563, 11.7161, 5.46288, 0, 0, -0.398748, 0.91706, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5732 at 161.218887 yards.
(387749, 1733, 1, 2855.24, -2027.55, 169.05, 0.785397, 0, 0, 0.382683, 0.92388, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5716 at 417.083496 yards.
(387750, 1733, 1, 2331.05, -3524.71, 53.3985, 1.16937, 0, 0, 0.551936, 0.833886, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5696 at 367.203735 yards.
(387751, 1733, 1, 2535.7, -3647.75, 64.2268, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5696 at 602.645752 yards.
(387752, 1733, 1, 3278.94, 381.677, 10.9858, 5.18363, 0, 0, -0.522498, 0.85264, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 5735 at 75.294785 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(387748, 1080, 0, 'Silver Vein', 0, 10), -- Silver Veins in Ashenvale 58 objects total
(387749, 1080, 0, 'Silver Vein', 0, 10), -- Silver Veins in Ashenvale 58 objects total
(387750, 1080, 0, 'Silver Vein', 0, 10), -- Silver Veins in Ashenvale 58 objects total
(387751, 1080, 0, 'Silver Vein', 0, 10), -- Silver Veins in Ashenvale 58 objects total
(387752, 1080, 0, 'Silver Vein', 0, 10); -- Silver Veins in Ashenvale 58 objects total

-- Missing Silver Vein spawns in Desolace.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES (321, 3, 'Silver Veins in Desolace');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(20854, 1733, 1, -1352.43, 891.679, 112.672, 1.51844, 0, 0, 0.688354, 0.725374, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20737 at 1231.634033 yards.
(20855, 1733, 1, -1242.73, 2641.72, 137.034, 2.93214, 0, 0, 0.994521, 0.104536, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20737 at 2205.247314 yards.
(20858, 1733, 1, -1256.88, 886.57, 113.211, 4.06662, 0, 0, -0.894934, 0.446199, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20737 at 1136.215698 yards.
(20862, 1733, 1, -31.4126, 1103.66, 107.949, 2.96704, 0, 0, 0.996194, 0.087165, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20737 at 379.613708 yards.
(20863, 1733, 1, -1623.51, 1472.56, 65.1219, 0.698131, 0, 0, 0.34202, 0.939693, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20737 at 1665.126099 yards.
(20864, 1733, 1, -1244.74, 2893.57, 124.94, 0.575957, 0, 0, 0.284015, 0.95882, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 20737 at 2426.926514 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(20854, 321, 0, 'Silver Vein', 0, 10), -- Silver Veins in Desolace
(20855, 321, 0, 'Silver Vein', 0, 10), -- Silver Veins in Desolace
(20858, 321, 0, 'Silver Vein', 0, 10), -- Silver Veins in Desolace
(20862, 321, 0, 'Silver Vein', 0, 10), -- Silver Veins in Desolace
(20863, 321, 0, 'Silver Vein', 0, 10), -- Silver Veins in Desolace
(20864, 321, 0, 'Silver Vein', 0, 10); -- Silver Veins in Desolace

-- Missing Silver Vein spawns in Stonetalon Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(48068, 1733, 1, 2290.5, 1648.7, 325.965, 2.75761, 0, 0, 0.981627, 0.190812, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 47689 at 1847.467041 yards.
(48069, 1733, 1, 2530.58, 1762.06, 355.937, 2.67035, 0, 0, 0.972369, 0.233448, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 47689 at 2098.703369 yards.
(48070, 1733, 1, 2241.39, 1505.45, 313.59, 1.41372, 0, 0, 0.649447, 0.760406, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 47689 at 1792.730469 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(48068, 1092, 0, 'Silver Vein', 0, 10), -- Silver Veins in Stonetalon 11 objects total
(48069, 1092, 0, 'Silver Vein', 0, 10), -- Silver Veins in Stonetalon 11 objects total
(48070, 1092, 0, 'Silver Vein', 0, 10); -- Silver Veins in Stonetalon 11 objects total

-- Missing Silver Vein spawns in Hillsbrad.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES (322, 1, 'Silver Veins in Hillsbrad');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(14280, 105569, 0, -802.309, 104.239, 8.29598, 0.872664, 0, 0, 0.422618, 0.906308, 300, 300, 1, 100, 0, 10),
(14281, 105569, 0, -701.806, 50.6085, 14.2192, 3.00195, 0, 0, 0.997563, 0.0697661, 300, 300, 1, 100, 0, 10),
(14282, 105569, 0, -819.406, 157.641, 17.9377, 1.39626, 0, 0, 0.642787, 0.766045, 300, 300, 1, 100, 0, 10),
(14283, 105569, 0, -688.964, 168.78, 18.368, 3.05433, 0, 0, 0.999048, 0.0436193, 300, 300, 1, 100, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(14280, 322, 0, 'Silver Vein', 0, 10),
(14281, 322, 0, 'Silver Vein', 0, 10),
(14282, 322, 0, 'Silver Vein', 0, 10),
(14283, 322, 0, 'Silver Vein', 0, 10);

-- Missing Silver Vein spawns in Thousand Needles
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES (329, 1, 'Silver Veins in Thousand Needles');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(31484, 1733, 1, -6521.36, -3828.84, -63.9889, 4.86947, 0, 0, -0.649447, 0.760406, 300, 300, 1, 100, 0, 10),
(31485, 1733, 1, -4948.66, -2009.09, -42.2582, 4.59022, 0, 0, -0.748956, 0.66262, 300, 300, 1, 100, 0, 10),
(31486, 1733, 1, -5404.32, -3212.83, -24.5899, 2.07694, 0, 0, 0.861629, 0.507539, 300, 300, 1, 100, 0, 10),
(31487, 1733, 1, -5121.02, -2374.72, -51.7483, 0, 0, 0, 0, 1, 300, 300, 1, 100, 0, 10),
(31488, 1733, 1, -5649.77, -2964.91, -42.7809, 6.00393, 0, 0, -0.139173, 0.990268, 300, 300, 1, 100, 0, 10),
(31489, 1733, 1, -5560.52, -2061.05, -60.3545, 2.65289, 0, 0, 0.970295, 0.241925, 300, 300, 1, 100, 0, 10),
(31490, 1733, 1, -4300.21, -1016.96, -51.5875, 5.70723, 0, 0, -0.284015, 0.95882, 300, 300, 1, 100, 0, 10),
(31491, 1733, 1, -4727.46, -1295.19, -35.9262, 3.21142, 0, 0, -0.999391, 0.0349061, 300, 300, 1, 100, 0, 10),
(31492, 1733, 1, -5696.34, -3242.83, -35.4584, 0.855211, 0, 0, 0.414693, 0.909961, 300, 300, 1, 100, 0, 10),
(31493, 1733, 1, -6714.54, -3789.62, -24.6829, 5.46288, 0, 0, -0.398748, 0.91706, 300, 300, 1, 100, 0, 10),
(31494, 1733, 1, -5457.66, -2200.77, -57.5791, 3.45576, 0, 0, -0.987688, 0.156436, 300, 300, 1, 100, 0, 10),
(31495, 1733, 1, -4726.98, -1956.17, -46.6445, 3.4383, 0, 0, -0.989016, 0.147811, 300, 300, 1, 100, 0, 10),
(31496, 1733, 1, -5043.71, -2271.26, -49.626, 2.35619, 0, 0, 0.92388, 0.382683, 300, 300, 1, 100, 0, 10),
(31497, 1733, 1, -4624.08, -1479.37, -48.9603, 1.23918, 0, 0, 0.580703, 0.814116, 300, 300, 1, 100, 0, 10),
(31498, 1733, 1, -5026.32, -2294.76, -49.7846, 2.84488, 0, 0, 0.989016, 0.147811, 300, 300, 1, 100, 0, 10),
(31499, 1733, 1, -4821.21, -1514.55, -33.2018, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 1, 100, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(31484, 329, 0, 'Silver Vein', 0, 10),
(31485, 329, 0, 'Silver Vein', 0, 10),
(31486, 329, 0, 'Silver Vein', 0, 10),
(31487, 329, 0, 'Silver Vein', 0, 10),
(31488, 329, 0, 'Silver Vein', 0, 10),
(31489, 329, 0, 'Silver Vein', 0, 10),
(31490, 329, 0, 'Silver Vein', 0, 10),
(31491, 329, 0, 'Silver Vein', 0, 10),
(31492, 329, 0, 'Silver Vein', 0, 10),
(31493, 329, 0, 'Silver Vein', 0, 10),
(31494, 329, 0, 'Silver Vein', 0, 10),
(31495, 329, 0, 'Silver Vein', 0, 10),
(31496, 329, 0, 'Silver Vein', 0, 10),
(31497, 329, 0, 'Silver Vein', 0, 10),
(31498, 329, 0, 'Silver Vein', 0, 10),
(31499, 329, 0, 'Silver Vein', 0, 10);

-- Missing Silver Vein spawns in Darkshore
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES (332, 1, 'Silver Veins in Darkshore');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(31500, 1733, 1, 7441.33, -1006.91, -5.89542, 2.44346, 0, 0, 0.939692, 0.34202, 300, 300, 1, 100, 0, 10),
(31501, 1733, 1, 7555.8, 54.8934, -2.61125, 0.575957, 0, 0, 0.284015, 0.95882, 300, 300, 1, 100, 0, 10),
(31502, 1733, 1, 7679.59, -987.505, 37.6635, 4.62512, 0, 0, -0.737277, 0.675591, 300, 300, 1, 100, 0, 10),
(31503, 1733, 1, 7347.33, -752.403, 20.2063, 3.14159, 0, 0, -1, 0, 300, 300, 1, 100, 0, 10),
(31504, 1733, 1, 7191.03, -380.363, 41.5449, 1.27409, 0, 0, 0.594822, 0.803857, 300, 300, 1, 100, 0, 10),
(31505, 1733, 1, 5573.86, 468.625, 20.336, 5.88176, 0, 0, -0.199368, 0.979925, 300, 300, 1, 100, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(31500, 332, 0, 'Silver Vein', 0, 10),
(31501, 332, 0, 'Silver Vein', 0, 10),
(31502, 332, 0, 'Silver Vein', 0, 10),
(31503, 332, 0, 'Silver Vein', 0, 10),
(31504, 332, 0, 'Silver Vein', 0, 10),
(31505, 332, 0, 'Silver Vein', 0, 10);

-- Missing Silver Vein spawns in Tanaris
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES (984, 1, 'Silver Veins in Tanaris');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(31506, 1733, 1, -7591.08, -4094.75, 11.661, 0.59341, 0, 0, 0.292371, 0.956305, 300, 300, 1, 100, 0, 10),
(31507, 1733, 1, -7369.77, -4287.44, 9.05438, 1.95477, 0, 0, 0.829038, 0.559193, 300, 300, 1, 100, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(31506, 984, 0, 'Silver Vein', 0, 10),
(31507, 984, 0, 'Silver Vein', 0, 10);

-- Missing Silver Vein spawns in Arathi
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES (335, 1, 'Silver Veins in Arathi');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(31508, 1733, 0, -2183.83, -1728.47, -63.0671, 1.46608, 0, 0, 0.66913, 0.743145, 300, 300, 1, 100, 0, 10),
(31509, 1733, 0, -1754.28, -3379.13, 41.0831, 4.57276, 0, 0, -0.754709, 0.656059, 300, 300, 1, 100, 0, 10),
(31510, 1733, 0, -1678, -2606.31, 61.6783, 4.59022, 0, 0, -0.748956, 0.66262, 300, 300, 1, 100, 0, 10),
(31511, 1733, 0, -1585.11, -2329.29, 87.4846, 1.23918, 0, 0, 0.580703, 0.814116, 300, 300, 1, 100, 0, 10),
(31512, 1733, 0, -1398.59, -1485.99, 67.5944, 1.11701, 0, 0, 0.529919, 0.848048, 300, 300, 1, 100, 0, 10),
(31513, 1733, 0, -1125.3, -2600.46, 62.6392, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 1, 100, 0, 10),
(31514, 1733, 0, -915.477, -1973.57, 53.7444, 1.71042, 0, 0, 0.754709, 0.656059, 300, 300, 1, 100, 0, 10),
(31515, 1733, 0, -892.058, -2428.34, 62.8315, 3.03684, 0, 0, 0.998629, 0.0523532, 300, 300, 1, 100, 0, 10),
(31516, 1733, 0, -809.747, -2334.22, 71.9745, 4.71239, 0, 0, -0.707107, 0.707107, 300, 300, 1, 100, 0, 10),
(31517, 1733, 0, -646.91, -2104.2, 71.6644, 0.314158, 0, 0, 0.156434, 0.987688, 300, 300, 1, 100, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(31508, 335, 0, 'Silver Vein', 0, 10),
(31509, 335, 0, 'Silver Vein', 0, 10),
(31510, 335, 0, 'Silver Vein', 0, 10),
(31511, 335, 0, 'Silver Vein', 0, 10),
(31512, 335, 0, 'Silver Vein', 0, 10),
(31513, 335, 0, 'Silver Vein', 0, 10),
(31514, 335, 0, 'Silver Vein', 0, 10),
(31515, 335, 0, 'Silver Vein', 0, 10),
(31516, 335, 0, 'Silver Vein', 0, 10),
(31517, 335, 0, 'Silver Vein', 0, 10);

-- Missing Silver Vein spawns in Stranglethorn
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES (386, 1, 'Silver Veins in Stranglethorn');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(31518, 1733, 0, -11935, 543.475, 33.0384, 2.47837, 0, 0, 0.945518, 0.325568, 300, 300, 1, 100, 0, 10),
(31519, 1733, 0, -11525, -484.469, 44.4924, 4.20625, 0, 0, -0.861629, 0.507539, 300, 300, 1, 100, 0, 10),
(31520, 1733, 0, -11441.2, 107.13, 41.1716, 6.14356, 0, 0, -0.0697556, 0.997564, 300, 300, 1, 100, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(31518, 386, 0, 'Silver Vein', 0, 10),
(31519, 386, 0, 'Silver Vein', 0, 10),
(31520, 386, 0, 'Silver Vein', 0, 10);

-- Missing Silver Vein spawns in Alterac
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES (397, 1, 'Silver Veins in Alterac');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(31521, 1733, 0, -185.258, 375.062, 116.572, 1.02974, 0, 0, 0.492423, 0.870356, 300, 300, 1, 100, 0, 10),
(31522, 1733, 0, -19.4989, -33.674, 106.887, 5.3058, 0, 0, -0.469471, 0.882948, 300, 300, 1, 100, 0, 10),
(31523, 1733, 0, -16.5498, 463.366, 53.6286, 5.11382, 0, 0, -0.551936, 0.833886, 300, 300, 1, 100, 0, 10),
(31524, 1733, 0, 481.541, -1324.04, 79.9635, 6.16101, 0, 0, -0.0610485, 0.998135, 300, 300, 1, 100, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(31521, 397, 0, 'Silver Vein', 0, 10),
(31522, 397, 0, 'Silver Vein', 0, 10),
(31523, 397, 0, 'Silver Vein', 0, 10),
(31524, 397, 0, 'Silver Vein', 0, 10);

-- Missing Silver Vein spawns in Hillsbrad
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(31525, 1733, 0, -1251.6, -2065.47, 50.7246, 0.087266, 0, 0, 0.0436192, 0.999048, 300, 300, 1, 100, 0, 10),
(31526, 1733, 0, -1171.69, -1305.33, 86.2144, 1.83259, 0, 0, 0.793353, 0.608762, 300, 300, 1, 100, 0, 10),
(31527, 1733, 0, -1155.32, -1349.64, 58.0543, 3.42085, 0, 0, -0.990268, 0.139175, 300, 300, 1, 100, 0, 10),
(31528, 1733, 0, -466.639, -1189.97, 62.6573, 6.03884, 0, 0, -0.121869, 0.992546, 300, 300, 1, 100, 0, 10),
(31529, 1733, 0, -318.377, -365.531, 68.8522, 1.27409, 0, 0, 0.594822, 0.803857, 300, 300, 1, 100, 0, 10),
(31530, 1733, 0, -271.124, -337.963, 64.5877, 6.14356, 0, 0, -0.0697556, 0.997564, 300, 300, 1, 100, 0, 10),
(31531, 1733, 0, -265.678, -269.988, 52.5609, 0.767944, 0, 0, 0.374606, 0.927184, 300, 300, 1, 100, 0, 10),
(31532, 1733, 0, -190.746, -312.664, 73.9734, 2.53072, 0, 0, 0.953716, 0.300708, 300, 300, 1, 100, 0, 10),
(31533, 1733, 0, -156.347, -135.198, 114.634, 0.750491, 0, 0, 0.366501, 0.930418, 300, 300, 1, 100, 0, 10),
(31534, 1733, 0, 47.3426, -642.852, 94.4918, 5.96903, 0, 0, -0.156434, 0.987688, 300, 300, 1, 100, 0, 10),
(31535, 1733, 0, 154.879, -1004.65, 77.9133, 6.23083, 0, 0, -0.0261765, 0.999657, 300, 300, 1, 100, 0, 10),
(31536, 1733, 0, 222.155, -1110.72, 71.7815, 5.11382, 0, 0, -0.551936, 0.833886, 300, 300, 1, 100, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(31525, 322, 0, 'Silver Vein', 0, 10),
(31526, 322, 0, 'Silver Vein', 0, 10),
(31527, 322, 0, 'Silver Vein', 0, 10),
(31528, 322, 0, 'Silver Vein', 0, 10),
(31529, 322, 0, 'Silver Vein', 0, 10),
(31530, 322, 0, 'Silver Vein', 0, 10),
(31531, 322, 0, 'Silver Vein', 0, 10),
(31532, 322, 0, 'Silver Vein', 0, 10),
(31533, 322, 0, 'Silver Vein', 0, 10),
(31534, 322, 0, 'Silver Vein', 0, 10),
(31535, 322, 0, 'Silver Vein', 0, 10),
(31536, 322, 0, 'Silver Vein', 0, 10);

-- Missing Silver Vein spawns in Duskwood
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES (398, 1, 'Silver Veins in Duskwood');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(31537, 1733, 0, -10848.7, -1375.08, 63.6493, 3.68265, 0, 0, -0.96363, 0.267241, 300, 300, 1, 100, 0, 10),
(31538, 1733, 0, -10800.4, -424.663, 59.9856, 5.89921, 0, 0, -0.190808, 0.981627, 300, 300, 1, 100, 0, 10),
(31539, 1733, 0, -10575.1, -1008.32, 55.5346, 0.0349062, 0, 0, 0.0174522, 0.999848, 300, 300, 1, 100, 0, 10),
(31540, 1733, 0, -10362.5, -1404.4, 81.8085, 1.22173, 0, 0, 0.573576, 0.819152, 300, 300, 1, 100, 0, 10),
(31541, 1733, 0, -10237.8, -1291.58, 46.9721, 5.06146, 0, 0, -0.573576, 0.819152, 300, 300, 1, 100, 0, 10),
(31542, 1733, 0, -10233.3, -1358.39, 83.4799, 2.30383, 0, 0, 0.913545, 0.406738, 300, 300, 1, 100, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(31537, 398, 0, 'Silver Vein', 0, 10),
(31538, 398, 0, 'Silver Vein', 0, 10),
(31539, 398, 0, 'Silver Vein', 0, 10),
(31540, 398, 0, 'Silver Vein', 0, 10),
(31541, 398, 0, 'Silver Vein', 0, 10),
(31542, 398, 0, 'Silver Vein', 0, 10);

-- Missing Silver Vein spawns in Badlands
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES (399, 1, 'Silver Veins in Badlands');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(31543, 1733, 0, -6870, -3135.92, 262.557, 5.51524, 0, 0, -0.374606, 0.927184, 300, 300, 1, 100, 0, 10),
(31544, 1733, 0, -6854.86, -3306.8, 267.706, 0.523598, 0, 0, 0.258819, 0.965926, 300, 300, 1, 100, 0, 10),
(31545, 1733, 0, -6742.13, -3092.78, 280.762, 0.733038, 0, 0, 0.358368, 0.93358, 300, 300, 1, 100, 0, 10),
(31546, 1733, 0, -6709.36, -3182.67, 267.629, 0.523598, 0, 0, 0.258819, 0.965926, 300, 300, 1, 100, 0, 10),
(31547, 1733, 0, -6696.16, -2446.62, 281.194, 3.78737, 0, 0, -0.948323, 0.317306, 300, 300, 1, 100, 0, 10),
(31548, 1733, 0, -6681.36, -3014.65, 260.138, 3.56047, 0, 0, -0.978148, 0.207912, 300, 300, 1, 100, 0, 10),
(31549, 1733, 0, -6121.22, -3080.16, 251.248, 3.194, 0, 0, -0.999657, 0.0262016, 300, 300, 1, 100, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(31543, 399, 0, 'Silver Vein', 0, 10),
(31544, 399, 0, 'Silver Vein', 0, 10),
(31545, 399, 0, 'Silver Vein', 0, 10),
(31546, 399, 0, 'Silver Vein', 0, 10),
(31547, 399, 0, 'Silver Vein', 0, 10),
(31548, 399, 0, 'Silver Vein', 0, 10),
(31549, 399, 0, 'Silver Vein', 0, 10);

-- Missing Silver Vein spawns in Redridge
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES (400, 1, 'Silver Veins in Redridge');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(31550, 1733, 0, -9317.58, -3472.81, 118.905, 4.29351, 0, 0, -0.83867, 0.54464, 300, 300, 1, 100, 0, 10),
(31551, 1733, 0, -8723.21, -2522.05, 143.106, 5.00909, 0, 0, -0.594823, 0.803857, 300, 300, 1, 100, 0, 10),
(31552, 1733, 0, -8671.02, -2353.16, 163.042, 4.03171, 0, 0, -0.902585, 0.430512, 300, 300, 1, 100, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(31550, 400, 0, 'Silver Vein', 0, 10),
(31551, 400, 0, 'Silver Vein', 0, 10),
(31552, 400, 0, 'Silver Vein', 0, 10);

-- Missing Silver Vein spawns in Silverpine
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES (401, 1, 'Silver Veins in Silverpine');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(31553, 1733, 0, -301.063, 1064.82, 117.501, 4.32842, 0, 0, -0.829037, 0.559194, 300, 300, 1, 100, 0, 10),
(31554, 1733, 0, 136.547, 539.18, 49.9037, 4.39823, 0, 0, -0.809016, 0.587786, 300, 300, 1, 100, 0, 10),
(31555, 1733, 0, 368.115, 604.431, 48.3461, 3.89209, 0, 0, -0.930417, 0.366502, 300, 300, 1, 100, 0, 10),
(31556, 1733, 0, 520.041, 882.858, 135.329, 4.66003, 0, 0, -0.725374, 0.688355, 300, 300, 1, 100, 0, 10),
(31557, 1733, 0, 1298.86, 462.37, 17.1292, 2.47837, 0, 0, 0.945518, 0.325568, 300, 300, 1, 100, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(31553, 401, 0, 'Silver Vein', 0, 10),
(31554, 401, 0, 'Silver Vein', 0, 10),
(31555, 401, 0, 'Silver Vein', 0, 10),
(31556, 401, 0, 'Silver Vein', 0, 10),
(31557, 401, 0, 'Silver Vein', 0, 10);

-- Missing Silver Vein spawns in Hinterlands
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES (402, 1, 'Silver Veins in Hinterlands');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(31558, 1733, 0, -64.6879, -3592.83, 133.142, 4.97419, 0, 0, -0.608761, 0.793354, 300, 300, 1, 100, 0, 10),
(31559, 1733, 0, 167.071, -2509.18, 136.759, 1.39626, 0, 0, 0.642787, 0.766045, 300, 300, 1, 100, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(31558, 402, 0, 'Silver Vein', 0, 10),
(31559, 402, 0, 'Silver Vein', 0, 10);

-- Missing Silver Vein spawns in Loch Modan
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES (403, 1, 'Silver Veins in Loch Modan');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(31560, 1733, 0, -5842.29, -4205.48, 417.789, 3.83973, 0, 0, -0.939692, 0.34202, 300, 300, 1, 100, 0, 10),
(31561, 1733, 0, -4991.61, -4149.51, 312.482, 0.383971, 0, 0, 0.190808, 0.981627, 300, 300, 1, 100, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(31560, 403, 0, 'Silver Vein', 0, 10),
(31561, 403, 0, 'Silver Vein', 0, 10);

-- Missing Silver Vein spawns in Barrens
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(31562, 1733, 1, -5052.28, 1176.74, 61.5778, 0.366518, 0, 0, 0.182235, 0.983255, 300, 300, 1, 100, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(31562, 1035, 0, 'Silver Vein', 0, 10);

-- Missing Silver Vein spawns in Feralas
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES (404, 1, 'Silver Veins in Feralas');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(31563, 1733, 0, -223.61, -1172.77, 60.582, 1.95477, 0, 0, 0.829038, 0.559193, 300, 300, 1, 100, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(31563, 404, 0, 'Silver Vein', 0, 10);

-- SMALL THORIUM ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Correct position of Small Thorium Vein in Burning Steppes (position is off by 0.663559 yards).
UPDATE `gameobject` SET `position_x`=-7890.92, `position_y`=-2537.66, `position_z`=129.832, `orientation`=1.53589, `rotation0`=0, `rotation1`=0, `rotation2`=0.694658, `rotation3`=0.71934 WHERE `guid`=4595;

-- Correct position of Small Thorium Vein in Searing Gorge (position is off by 0.483679 yards).
UPDATE `gameobject` SET `position_x`=-6560.44, `position_y`=-824.799, `position_z`=297.716, `orientation`=3.6652, `rotation0`=0, `rotation1`=0, `rotation2`=-0.965925, `rotation3`=0.258821 WHERE `guid`=13213;

-- Correct position of Small Thorium Vein in Searing Gorge (position is off by 0.865117 yards).
UPDATE `gameobject` SET `position_x`=-6644.5, `position_y`=-858.294, `position_z`=244.144, `orientation`=0.90757, `rotation0`=0, `rotation1`=0, `rotation2`=0.438371, `rotation3`=0.898794 WHERE `guid`=373;

-- Correct position of Small Thorium Vein in Searing Gorge (position is off by 0.887713 yards).
UPDATE `gameobject` SET `position_x`=-6892.15, `position_y`=-851.136, `position_z`=260.943, `orientation`=2.80998, `rotation0`=0, `rotation1`=0, `rotation2`=0.986285, `rotation3`=0.16505 WHERE `guid`=324;

-- Correct position of Small Thorium Vein in Burning Steppes (position is off by 0.779909 yards).
UPDATE `gameobject` SET `position_x`=-8283.12, `position_y`=-2374.25, `position_z`=177.531, `orientation`=1.36136, `rotation0`=0, `rotation1`=0, `rotation2`=0.62932, `rotation3`=0.777146 WHERE `guid`=207;

-- Correct position of Small Thorium Vein in Burning Steppes (position is off by 4.7193 yards).
UPDATE `gameobject` SET `position_x`=-7814.68, `position_y`=-2648.13, `position_z`=223.628, `orientation`=0, `rotation0`=0, `rotation1`=0, `rotation2`=0, `rotation3`=1 WHERE `guid`=303;

-- Correct position of Small Thorium Vein in Searing Gorge (position is off by 1.63846 yards).
UPDATE `gameobject` SET `position_x`=-6718.6, `position_y`=-1252.82, `position_z`=183.493, `orientation`=0.139624, `rotation0`=0, `rotation1`=0, `rotation2`=0.0697556, `rotation3`=0.997564 WHERE `guid`=258;

-- Correct position of Small Thorium Vein in Burning Steppes (position is off by 1.2565 yards).
UPDATE `gameobject` SET `position_x`=-8160.95, `position_y`=-2169.34, `position_z`=148.758, `orientation`=6.17847, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0523357, `rotation3`=0.99863 WHERE `guid`=379;

-- Correct position of Small Thorium Vein in Burning Steppes (position is off by 0.285261 yards).
UPDATE `gameobject` SET `position_x`=-8165.27, `position_y`=-762, `position_z`=132.767, `orientation`=3.45576, `rotation0`=0, `rotation1`=0, `rotation2`=-0.987688, `rotation3`=0.156436 WHERE `guid`=237;

-- Correct position of Small Thorium Vein in Un'Goro Crater (position is off by 0.566809 yards).
UPDATE `gameobject` SET `position_x`=-7606.33, `position_y`=-1802.14, `position_z`=-259.561, `orientation`=2.32129, `rotation0`=0, `rotation1`=0, `rotation2`=0.91706, `rotation3`=0.39875 WHERE `guid`=206;

-- Correct position of Small Thorium Vein in Western Plaguelands (position is off by 0.266998 yards).
UPDATE `gameobject` SET `position_x`=2778.65, `position_y`=-1672.19, `position_z`=134.91, `orientation`=5.28835, `rotation0`=0, `rotation1`=0, `rotation2`=-0.477159, `rotation3`=0.878817 WHERE `guid`=45499;

-- Correct position of Small Thorium Vein in Western Plaguelands (position is off by 1.64857 yards).
UPDATE `gameobject` SET `position_x`=2326.7, `position_y`=-1935.16, `position_z`=115.164, `orientation`=3.194, `rotation0`=0, `rotation1`=0, `rotation2`=-0.999657, `rotation3`=0.0262016 WHERE `guid`=232;

-- Correct position of Small Thorium Vein in Burning Steppes (position is off by 0.394032 yards).
UPDATE `gameobject` SET `position_x`=-7978.81, `position_y`=-2636.86, `position_z`=170.912, `orientation`=6.05629, `rotation0`=0, `rotation1`=0, `rotation2`=-0.113203, `rotation3`=0.993572 WHERE `guid`=4597;

-- Correct position of Small Thorium Vein in Un'Goro Crater (position is off by 1.29011 yards).
UPDATE `gameobject` SET `position_x`=-6930.23, `position_y`=-2390.2, `position_z`=-198.334, `orientation`=3.21142, `rotation0`=0, `rotation1`=0, `rotation2`=-0.999391, `rotation3`=0.0349061 WHERE `guid`=213;

-- Correct position of Small Thorium Vein in Un'Goro Crater (position is off by 0.674473 yards).
UPDATE `gameobject` SET `position_x`=-7186.48, `position_y`=-2309.92, `position_z`=-245.578, `orientation`=4.34587, `rotation0`=0, `rotation1`=0, `rotation2`=-0.824126, `rotation3`=0.566406 WHERE `guid`=367;

-- Correct position of Small Thorium Vein in Un'Goro Crater (position is off by 0.962771 yards).
UPDATE `gameobject` SET `position_x`=-6835.47, `position_y`=-1518.23, `position_z`=-262.664, `orientation`=4.13643, `rotation0`=0, `rotation1`=0, `rotation2`=-0.878817, `rotation3`=0.47716 WHERE `guid`=336;

-- Correct position of Small Thorium Vein in Tanaris (position is off by 1.08668 yards).
UPDATE `gameobject` SET `position_x`=-8844.1, `position_y`=-2373.4, `position_z`=17.7803, `orientation`=5.72468, `rotation0`=0, `rotation1`=0, `rotation2`=-0.275637, `rotation3`=0.961262 WHERE `guid`=180;

-- Correct position of Small Thorium Vein in Blasted Lands (position is off by 1.70554 yards).
UPDATE `gameobject` SET `position_x`=-11513.3, `position_y`=-2965.08, `position_z`=35.6738, `orientation`=3.4383, `rotation0`=0, `rotation1`=0, `rotation2`=-0.989016, `rotation3`=0.147811 WHERE `guid`=364;

-- Correct position of Small Thorium Vein in Un'Goro Crater (position is off by 1.20819 yards).
UPDATE `gameobject` SET `position_x`=-6366.44, `position_y`=-1829.02, `position_z`=-260.553, `orientation`=4.64258, `rotation0`=0, `rotation1`=0, `rotation2`=-0.731354, `rotation3`=0.681998 WHERE `guid`=299;

-- Correct position of Small Thorium Vein in Un'Goro Crater (position is off by 1.76027 yards).
UPDATE `gameobject` SET `position_x`=-7702.7, `position_y`=-2188.03, `position_z`=-258.438, `orientation`=3.35105, `rotation0`=0, `rotation1`=0, `rotation2`=-0.994521, `rotation3`=0.104536 WHERE `guid`=282;

-- Correct position of Small Thorium Vein in Un'Goro Crater (position is off by 1.09565 yards).
UPDATE `gameobject` SET `position_x`=-6791.62, `position_y`=-1799.59, `position_z`=-259.316, `orientation`=5.58505, `rotation0`=0, `rotation1`=0, `rotation2`=-0.34202, `rotation3`=0.939693 WHERE `guid`=315;

-- Correct position of Small Thorium Vein in Blasted Lands (position is off by 0.335071 yards).
UPDATE `gameobject` SET `position_x`=-11386.1, `position_y`=-3164.7, `position_z`=19.121, `orientation`=2.77507, `rotation0`=0, `rotation1`=0, `rotation2`=0.983254, `rotation3`=0.182238 WHERE `guid`=362;

-- Correct position of Small Thorium Vein in Un'Goro Crater (position is off by 3.50569 yards).
UPDATE `gameobject` SET `position_x`=-6406.31, `position_y`=-2017.48, `position_z`=-265.031, `orientation`=4.08407, `rotation0`=0, `rotation1`=0, `rotation2`=-0.891006, `rotation3`=0.453991 WHERE `guid`=377;

-- Correct position of Small Thorium Vein in Blasted Lands (position is off by 0.855347 yards).
UPDATE `gameobject` SET `position_x`=-11220.8, `position_y`=-2780.84, `position_z`=42.5384, `orientation`=4.32842, `rotation0`=0, `rotation1`=0, `rotation2`=-0.829037, `rotation3`=0.559194 WHERE `guid`=230;

-- Missing Small Thorium Vein spawns in Blasted Lands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(13753, 324, 0, -10872.9, -2727.42, 9.55622, 5.53269, 0, 0, -0.366501, 0.930418, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 221 at 5.684651 yards.
(13792, 324, 0, -11377.6, -2688.77, 33.9724, 4.85202, 0, 0, -0.656058, 0.75471, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 356 at 163.545120 yards.
(13800, 324, 0, -11542.9, -2873.28, 12.1575, 6.14356, 0, 0, -0.0697556, 0.997564, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 153 at 5.240901 yards.
(14020, 324, 0, -11240.1, -3554.26, 8.27983, 1.69297, 0, 0, 0.748956, 0.66262, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 13980 at 102.665512 yards.
(13802, 324, 0, -11277, -3490.93, 9.94501, 6.26573, 0, 0, -0.00872612, 0.999962, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 245 at 41.412369 yards.
(13804, 324, 0, -10908.3, -2637.55, 14.5878, 0.244346, 0, 0, 0.121869, 0.992546, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 221 at 92.726036 yards.
(14470, 150082, 0, -10552.4, -3171.3, 5.98372, 2.86234, 0, 0, 0.990268, 0.139175, 300, 300, 1, 100, 0, 10),
(14471, 150082, 0, -10557.8, -3255.34, 5.07344, 2.61799, 0, 0, 0.965925, 0.258821, 300, 300, 1, 100, 0, 10),
(14472, 150082, 0, -10614.3, -3279.39, -6.62452, 3.71755, 0, 0, -0.958819, 0.284016, 300, 300, 1, 100, 0, 10),
(14473, 150082, 0, -10550.4, -3393.96, -2.81507, 0.837757, 0, 0, 0.406736, 0.913546, 300, 300, 1, 100, 0, 10),
(14474, 150082, 0, -10673.9, -3564.52, -33.5804, 4.93928, 0, 0, -0.622514, 0.782609, 300, 300, 1, 100, 0, 10),
(14475, 150082, 0, -10671.9, -3101.02, 21.8348, 3.03684, 0, 0, 0.998629, 0.0523532, 300, 300, 1, 100, 0, 10),
(14476, 150082, 0, -10604.6, -3622.64, -12.7788, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 1, 100, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(13753, 1280, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Blasted Lands 31 objects total
(13792, 1280, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Blasted Lands 31 objects total
(13800, 1280, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Blasted Lands 31 objects total
(14020, 1280, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Blasted Lands 31 objects total
(13802, 1280, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Blasted Lands 31 objects total
(13804, 1280, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Blasted Lands 31 objects total
(14470, 1280, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Blasted Lands 31 objects total
(14471, 1280, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Blasted Lands 31 objects total
(14472, 1280, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Blasted Lands 31 objects total
(14473, 1280, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Blasted Lands 31 objects total
(14474, 1280, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Blasted Lands 31 objects total
(14475, 1280, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Blasted Lands 31 objects total
(14476, 1280, 0, 'Small Thorium Vein', 0, 10); -- Small Thorium Veins in Blasted Lands 31 objects total

-- Missing Small Thorium Vein spawns in Western Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(1841, 324, 0, 1634.02, -1956.59, 73.183, 1.8675, 0, 0, 0.803857, 0.594823, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 283 at 55.892269 yards.
(2038, 324, 0, 2089.01, -1983.69, 88.3662, 3.14159, 0, 0, -1, 0, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 232 at 245.141724 yards.
(13702, 324, 0, 1911.18, -2145.27, 75.1413, 6.21337, 0, 0, -0.0348988, 0.999391, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 295 at 62.642410 yards.
(13752, 324, 0, 2266.57, -1614.03, 97.5257, 5.5676, 0, 0, -0.350207, 0.936672, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 307 at 23.514456 yards.
(13756, 324, 0, 1861.01, -1916.53, 95.6276, 3.9619, 0, 0, -0.91706, 0.39875, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 368 at 47.022747 yards.
(13778, 324, 0, 2408.59, -1759.78, 103.076, 1.81514, 0, 0, 0.788011, 0.615662, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 156 at 148.490021 yards.
(45557, 324, 0, 2009.89, -1503.28, 82.854, 0.715585, 0, 0, 0.350207, 0.936672, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45498 at 139.550537 yards.
(13803, 324, 0, 2742.22, -1859.11, 75.9589, 5.3058, 0, 0, -0.469471, 0.882948, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 146 at 35.014442 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(1841, 1263, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Western Plaguelands 25 objects total
(2038, 1263, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Western Plaguelands 25 objects total
(13702, 1263, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Western Plaguelands 25 objects total
(13752, 1263, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Western Plaguelands 25 objects total
(13756, 1263, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Western Plaguelands 25 objects total
(13778, 1263, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Western Plaguelands 25 objects total
(45557, 1263, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Western Plaguelands 25 objects total
(13803, 1263, 0, 'Small Thorium Vein', 0, 10); -- Small Thorium Veins in Western Plaguelands 25 objects total

-- Missing Small Thorium Vein spawns in Burning Steppes.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(445, 324, 0, -7864.27, -874.889, 150.601, 2.70526, 0, 0, 0.976295, 0.216442, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 183 at 7.389390 yards.
(447, 324, 0, -8124.25, -2463.32, 149.642, 2.80998, 0, 0, 0.986285, 0.16505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 150 at 8.866940 yards.
(448, 324, 0, -7858.74, -2693.35, 173.306, 0.680677, 0, 0, 0.333806, 0.942642, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 247 at 36.773102 yards.
(449, 324, 0, -7499.86, -2133.78, 143.687, 3.63029, 0, 0, -0.970295, 0.241925, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 271 at 19.785688 yards.
(450, 324, 0, -7905.27, -2637.69, 182.47, 1.3439, 0, 0, 0.622514, 0.782609, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 159 at 5.759482 yards.
(451, 324, 0, -7843.5, -2715.97, 170.357, 3.73501, 0, 0, -0.956305, 0.292372, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 247 at 46.724483 yards.
(452, 324, 0, -8386.3, -2815.53, 211.551, 2.47837, 0, 0, 0.945518, 0.325568, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 233 at 212.163330 yards.
(455, 324, 0, -7924, -2653.41, 159.456, 4.03171, 0, 0, -0.902585, 0.430512, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 159 at 29.111744 yards.
(9766, 324, 0, -7744.56, -2400.38, 144.921, 3.61284, 0, 0, -0.972369, 0.233448, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 387 at 188.520218 yards.
(14484, 324, 0, -7885.49, -2977.03, 154.692, 0.628317, 0, 0, 0.309016, 0.951057, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 247 at 265.406464 yards.
(5637, 324, 0, -7771.45, -1950.79, 133.599, 4.03171, 0, 0, -0.902585, 0.430512, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 370 at 7.704159 yards.
(13700, 324, 0, -7883.55, -1702.45, 137.553, 5.55015, 0, 0, -0.358368, 0.93358, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 242 at 42.828991 yards.
(13791, 324, 0, -7867.83, -2616.99, 124.392, 5.44543, 0, 0, -0.406736, 0.913546, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 305 at 57.744373 yards.
(13793, 324, 0, -8085.11, -1281.41, 141.056, 4.25861, 0, 0, -0.848047, 0.529921, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 188 at 69.791489 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(445, 1298, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Burning Steppes 40 objects total
(447, 1298, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Burning Steppes 40 objects total
(448, 1298, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Burning Steppes 40 objects total
(449, 1298, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Burning Steppes 40 objects total
(450, 1298, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Burning Steppes 40 objects total
(451, 1298, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Burning Steppes 40 objects total
(452, 1298, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Burning Steppes 40 objects total
(455, 1298, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Burning Steppes 40 objects total
(9766, 1298, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Burning Steppes 40 objects total
(14484, 1298, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Burning Steppes 40 objects total
(5637, 1298, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Burning Steppes 40 objects total
(13700, 1298, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Burning Steppes 40 objects total
(13791, 1298, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Burning Steppes 40 objects total
(13793, 1298, 0, 'Small Thorium Vein', 0, 10); -- Small Thorium Veins in Burning Steppes 40 objects total

-- Missing Small Thorium Vein spawns in The Hinterlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(444, 324, 0, 107.217, -4568.66, 132.759, 1.71042, 0, 0, 0.754709, 0.656059, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 296 at 97.710045 yards.
(14485, 324, 0, -121.696, -4368.51, 153.591, 4.69494, 0, 0, -0.71325, 0.70091, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 354 at 121.626671 yards.
(13699, 324, 0, -222.086, -3605.74, 231.848, 3.89209, 0, 0, -0.930417, 0.366502, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 360 at 144.790466 yards.
(13701, 324, 0, 408.902, -4095.56, 113.969, 6.12611, 0, 0, -0.0784588, 0.996917, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 331 at 19.041668 yards.
(13755, 324, 0, -155.38, -4073.34, 127.776, 1.71042, 0, 0, 0.754709, 0.656059, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 349 at 220.628830 yards.
(13790, 324, 0, -261.942, -3704.23, 242.799, 2.72271, 0, 0, 0.978148, 0.207912, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 360 at 39.542103 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(444, 1257, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Hinterlands 9 objects total
(14485, 1257, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Hinterlands 9 objects total
(13699, 1257, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Hinterlands 9 objects total
(13701, 1257, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Hinterlands 9 objects total
(13755, 1257, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Hinterlands 9 objects total
(13790, 1257, 0, 'Small Thorium Vein', 0, 10); -- Small Thorium Veins in Hinterlands 9 objects total

-- Missing Small Thorium Vein spawns in Searing Gorge.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(443, 324, 0, -6561.7, -1257.7, 136.212, 5.84685, 0, 0, -0.216439, 0.976296, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 175 at 131.318481 yards.
(13697, 324, 0, -6502.38, -1040.03, 344.818, 2.63544, 0, 0, 0.968147, 0.250381, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 13212 at 214.234131 yards.
(454, 324, 0, -6421.86, -1300.82, 180.939, 4.01426, 0, 0, -0.906307, 0.422619, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 175 at 269.450500 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(443, 1295, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Searing Gorge 13 objects total
(13697, 1295, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Searing Gorge 13 objects total
(454, 1295, 0, 'Small Thorium Vein', 0, 10); -- Small Thorium Veins in Searing Gorge 13 objects total

-- Missing Small Thorium Vein spawns in Eastern Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(45958, 324, 0, 2225.85, -4448.13, 122.931, 6.03884, 0, 0, -0.121869, 0.992546, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45956 at 302.564484 yards.
(45929, 324, 0, 3179.09, -3083.8, 156.172, 4.95674, 0, 0, -0.615661, 0.788011, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45893 at 251.174545 yards.
(842, 324, 0, 2272.24, -4186.96, 116.365, 4.45059, 0, 0, -0.793353, 0.608762, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 164 at 310.683380 yards.
(46054, 324, 0, 2103.91, -3646.72, 155.5, 1.18682, 0, 0, 0.559193, 0.829038, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45970 at 284.297028 yards.
(45964, 324, 0, 2224.84, -4789.01, 116.323, 4.90438, 0, 0, -0.636078, 0.771625, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45956 at 475.819122 yards.
(4608, 324, 0, 1952.06, -3994.58, 134.542, 1.0821, 0, 0, 0.515038, 0.857168, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 201 at 34.627148 yards.
(45965, 324, 0, 1956.73, -4855.31, 104.564, 3.08918, 0, 0, 0.999657, 0.0262016, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45961 at 341.567871 yards.
(33871, 324, 0, 1679.37, -4469.86, 87.2107, 5.75959, 0, 0, -0.258819, 0.965926, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 33863 at 173.902557 yards.
(45966, 324, 0, 1995.39, -5110.2, 98.9908, 1.37881, 0, 0, 0.636078, 0.771625, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45961 at 265.464600 yards.
(33884, 324, 0, 1711.56, -4170.16, 118.338, 2.33874, 0, 0, 0.920505, 0.390732, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 33863 at 193.159409 yards.
(45940, 324, 0, 3207.65, -3589.91, 150.687, 3.21142, 0, 0, -0.999391, 0.0349061, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45893 at 355.830872 yards.
(13798, 324, 0, 2668.91, -4208.31, 100.766, 4.53786, 0, 0, -0.766044, 0.642789, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 197 at 25.757324 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(45958, 1273, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Eastern Plaguelands 13 objects total
(45929, 1273, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Eastern Plaguelands 13 objects total
(842, 1273, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Eastern Plaguelands 13 objects total
(46054, 1273, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Eastern Plaguelands 13 objects total
(45964, 1273, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Eastern Plaguelands 13 objects total
(4608, 1273, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Eastern Plaguelands 13 objects total
(45965, 1273, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Eastern Plaguelands 13 objects total
(33871, 1273, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Eastern Plaguelands 13 objects total
(45966, 1273, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Eastern Plaguelands 13 objects total
(33884, 1273, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Eastern Plaguelands 13 objects total
(45940, 1273, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Eastern Plaguelands 13 objects total
(13798, 1273, 0, 'Small Thorium Vein', 0, 10); -- Small Thorium Veins in Eastern Plaguelands 13 objects total

-- Missing Small Thorium Vein spawns in Tanaris.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(17353, 324, 1, -8990.3, -4147.92, -30.7274, 5.93412, 0, 0, -0.173648, 0.984808, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 17313 at 265.967407 yards.
(446, 324, 1, -7896.6, -2350.58, -21.7524, 5.09636, 0, 0, -0.559193, 0.829038, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 182 at 5.440292 yards.
(17355, 324, 1, -9250.91, -4122.72, -53.0446, 0.680677, 0, 0, 0.333806, 0.942642, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 17313 at 83.816658 yards.
(13750, 324, 1, -9099.4, -2099.06, 24.8635, 5.46288, 0, 0, -0.398748, 0.91706, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 288 at 62.644402 yards.
(13751, 324, 1, -8894, -2071.01, 21.4428, 4.01426, 0, 0, -0.906307, 0.422619, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 366 at 145.543991 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(17353, 1204, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Tanaris 70 objects total
(446, 1204, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Tanaris 39 objects total
(17355, 1204, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Tanaris 70 objects total
(13750, 1204, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Tanaris 70 objects total
(13751, 1204, 0, 'Small Thorium Vein', 0, 10); -- Small Thorium Veins in Tanaris 70 objects total

-- Missing Small Thorium Vein spawns in Un'Goro Crater.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(453, 324, 1, -6295.59, -1320.97, -253.628, 3.94445, 0, 0, -0.920505, 0.390732, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 169 at 58.025951 yards.
(17632, 324, 1, -6303.35, -1918.32, -272.502, 1.11701, 0, 0, 0.529919, 0.848048, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 17592 at 43.866798 yards.
(13698, 324, 1, -6755.37, -1399.22, -264.227, 4.93928, 0, 0, -0.622514, 0.782609, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 336 at 143.839081 yards.
(13794, 324, 1, -6403.33, -1914.53, -262.49, 0.925024, 0, 0, 0.446198, 0.894935, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 280 at 56.565353 yards.
(13796, 324, 1, -7842.36, -1337.36, -260.721, 0.418879, 0, 0, 0.207911, 0.978148, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 338 at 8.478886 yards.
(13797, 324, 1, -8109.4, -1280.43, -263.574, 4.67748, 0, 0, -0.719339, 0.694659, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 359 at 162.078400 yards.
(17634, 324, 1, -7607.18, -1270.21, -254.524, 1.8675, 0, 0, 0.803857, 0.594823, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 17596 at 127.808350 yards.
(17641, 324, 1, -6838.09, -864.837, -265.727, 1.48353, 0, 0, 0.67559, 0.737278, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 17595 at 281.937866 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(453, 1211, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Ungoro 39 objects total
(17632, 1211, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Ungoro 39 objects total
(13698, 1211, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Ungoro 39 objects total
(13794, 1211, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Ungoro 39 objects total
(13796, 1211, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Ungoro 39 objects total
(13797, 1211, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Ungoro 39 objects total
(17634, 1211, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Ungoro 39 objects total
(17641, 1211, 0, 'Small Thorium Vein', 0, 10); -- Small Thorium Veins in Ungoro 39 objects total

-- Missing Small Thorium Vein spawns in Winterspring.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(49095, 324, 1, 6147.94, -4159.54, 642.698, 0.541051, 0, 0, 0.267238, 0.963631, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49081 at 135.411865 yards.
(49139, 324, 1, 6132.12, -4236.62, 654.105, 1.83259, 0, 0, 0.793353, 0.608762, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49081 at 93.673180 yards.
(49230, 324, 1, 4978, -4508.38, 867.794, 3.50812, 0, 0, -0.983254, 0.182238, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49085 at 179.972153 yards.
(49231, 324, 1, 5135.46, -5009.03, 890.965, 2.51327, 0, 0, 0.951056, 0.309017, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49079 at 123.516083 yards.
(49232, 324, 1, 6139.67, -4271.55, 657.488, 3.94445, 0, 0, -0.920505, 0.390732, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49081 at 78.053879 yards.
(49233, 324, 1, 7545.34, -4227.77, 664.088, 4.2237, 0, 0, -0.857167, 0.515038, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49084 at 458.277863 yards.
(13795, 324, 1, 6978.94, -4386.25, 750.311, 4.79966, 0, 0, -0.67559, 0.737278, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 220 at 479.403625 yards.
(13799, 324, 1, 6650.88, -5297.41, 753.44, 2.86234, 0, 0, 0.990268, 0.139175, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 293 at 959.401917 yards.
(13801, 324, 1, 6647.44, -5225.18, 758.182, 0.401425, 0, 0, 0.199368, 0.979925, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 166 at 900.600647 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(49095, 1233, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Winterspring 22 objects total
(49139, 1233, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Winterspring 22 objects total
(49230, 1233, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Winterspring 22 objects total
(49231, 1233, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Winterspring 22 objects total
(49232, 1233, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Winterspring 22 objects total
(49233, 1233, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Winterspring 22 objects total
(13795, 1233, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Winterspring 22 objects total
(13799, 1233, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Winterspring 22 objects total
(13801, 1233, 0, 'Small Thorium Vein', 0, 10); -- Small Thorium Veins in Winterspring 22 objects total

-- Missing Small Thorium Vein spawns in Silithus.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(5649, 324, 1, -6420.68, 717.69, 0.731453, 0.471238, 0, 0, 0.233445, 0.97237, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 319 at 71.317810 yards.
(13754, 324, 1, -6843.3, 580.553, -1.48054, 2.30383, 0, 0, 0.913545, 0.406738, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 257 at 317.436035 yards.
(13805, 324, 1, -6816.57, 1052.21, -1.23178, 3.68265, 0, 0, -0.96363, 0.267241, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 257 at 282.033173 yards.
(13819, 324, 1, -7365.2, 630.688, -5.69446, 1.01229, 0, 0, 0.484809, 0.87462, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 343 at 13.568816 yards.
(13820, 324, 1, -7509.1, 1091.58, -1.2318, 4.41568, 0, 0, -0.803857, 0.594823, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 139 at 9.230183 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(5649, 1220, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Silithus 42 objects total
(13754, 1220, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Silithus 42 objects total
(13805, 1220, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Silithus 42 objects total
(13819, 1220, 0, 'Small Thorium Vein', 0, 10), -- Small Thorium Veins in Silithus 42 objects total
(13820, 1220, 0, 'Small Thorium Vein', 0, 10); -- Small Thorium Veins in Silithus 42 objects total

-- Missing Small Thorium Vein spawns in Feralas
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES (985, 1, 'Small Thorium Veins in Feralas');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(31564, 324, 1, -5580.26, 1134.28, 23.2439, 0.90757, 0, 0, 0.438371, 0.898794, 300, 300, 1, 100, 0, 10),
(31565, 324, 1, -5575.68, 1104.02, 17.9483, 4.76475, 0, 0, -0.688354, 0.725374, 300, 300, 1, 100, 0, 10),
(31566, 324, 1, -3844.81, 2815.48, 18.7056, 2.07694, 0, 0, 0.861629, 0.507539, 300, 300, 1, 100, 0, 10),
(31567, 324, 1, -5580.58, 1063.48, 18.3804, 4.69494, 0, 0, -0.71325, 0.70091, 300, 300, 1, 100, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(31564, 985, 0, 'Small Thorium Vein', 0, 10),
(31565, 985, 0, 'Small Thorium Vein', 0, 10),
(31566, 985, 0, 'Small Thorium Vein', 0, 10),
(31567, 985, 0, 'Small Thorium Vein', 0, 10);

-- Missing Small Thorium Vein spawns in Felwood
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(31568, 176643, 1, 5381.58, -554.62, 272.882, 3.194, 0, 0, -0.999657, 0.0262016, 300, 300, 1, 100, 0, 10),
(31569, 176643, 1, 6317.94, -1882.6, 432.896, 2.19911, 0, 0, 0.891006, 0.453991, 300, 300, 1, 100, 0, 10),
(31570, 176643, 1, 6741.89, -1987.19, 555.268, 4.34587, 0, 0, -0.824126, 0.566406, 300, 300, 1, 100, 0, 10),
(31571, 176643, 1, 5342.51, -842.086, 349.25, 5.16618, 0, 0, -0.529919, 0.848048, 300, 300, 1, 100, 0, 10),
(31572, 176643, 1, 4426.35, -562.19, 278.148, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 1, 100, 0, 10),
(31573, 176643, 1, 4751.59, -878.72, 358.641, 3.90954, 0, 0, -0.927183, 0.374608, 300, 300, 1, 100, 0, 10),
(31574, 176643, 1, 6835.33, -1990.14, 558.56, 4.43314, 0, 0, -0.798635, 0.601815, 300, 300, 1, 100, 0, 10),
(31575, 176643, 1, 5315.99, -588.572, 247.057, 2.72271, 0, 0, 0.978148, 0.207912, 300, 300, 1, 100, 0, 10),
(31576, 176643, 1, 5131.26, -426.738, 301.296, 3.927, 0, 0, -0.923879, 0.382686, 300, 300, 1, 100, 0, 10),
(31577, 176643, 1, 5022.09, -595.304, 311.172, 1.91986, 0, 0, 0.819152, 0.573577, 300, 300, 1, 100, 0, 10),
(31578, 176643, 1, 5171.69, -307.868, 350.616, 5.63741, 0, 0, -0.317305, 0.948324, 300, 300, 1, 100, 0, 10),
(31579, 176643, 1, 5897.76, -550.083, 409.429, 6.00393, 0, 0, -0.139173, 0.990268, 300, 300, 1, 100, 0, 10),
(31580, 176643, 1, 6900.49, -1782.53, 584.844, 3.42085, 0, 0, -0.990268, 0.139175, 300, 300, 1, 100, 0, 10),
(31581, 176643, 1, 4847.09, -324.365, 367.956, 4.15388, 0, 0, -0.874619, 0.48481, 300, 300, 1, 100, 0, 10),
(31582, 176643, 1, 5010.27, -446.018, 321.039, 1.91986, 0, 0, 0.819152, 0.573577, 300, 300, 1, 100, 0, 10),
(31583, 176643, 1, 4578.17, -334.32, 305.403, 6.19592, 0, 0, -0.0436192, 0.999048, 300, 300, 1, 100, 0, 10),
(31584, 176643, 1, 5927.7, -1241.3, 388.772, 3.80482, 0, 0, -0.945518, 0.325568, 300, 300, 1, 100, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(31568, 1232, 0, 'Small Thorium Vein', 0, 10),
(31569, 1232, 0, 'Small Thorium Vein', 0, 10),
(31570, 1232, 0, 'Small Thorium Vein', 0, 10),
(31571, 1232, 0, 'Small Thorium Vein', 0, 10),
(31572, 1232, 0, 'Small Thorium Vein', 0, 10),
(31573, 1232, 0, 'Small Thorium Vein', 0, 10),
(31574, 1232, 0, 'Small Thorium Vein', 0, 10),
(31575, 1232, 0, 'Small Thorium Vein', 0, 10),
(31576, 1232, 0, 'Small Thorium Vein', 0, 10),
(31577, 1232, 0, 'Small Thorium Vein', 0, 10),
(31578, 1232, 0, 'Small Thorium Vein', 0, 10),
(31579, 1232, 0, 'Small Thorium Vein', 0, 10),
(31580, 1232, 0, 'Small Thorium Vein', 0, 10),
(31581, 1232, 0, 'Small Thorium Vein', 0, 10),
(31582, 1232, 0, 'Small Thorium Vein', 0, 10),
(31583, 1232, 0, 'Small Thorium Vein', 0, 10),
(31584, 1232, 0, 'Small Thorium Vein', 0, 10);

-- TRUESILVER ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Missing Truesilver Deposit spawns in Badlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(13822, 2047, 0, -6549.7, -2434.55, 296.762, 4.99164, 0, 0, -0.601814, 0.798636, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 11442 at 127.064819 yards.
(14084, 2047, 0, -6518.01, -2460.01, 307.32, 3.49067, 0, 0, -0.984807, 0.173652, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 11442 at 88.383018 yards.
(14095, 2047, 0, -7472.15, -2246.71, 236.758, 0.087266, 0, 0, 0.0436192, 0.999048, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9645 at 24.988974 yards.
(14102, 2047, 0, -6635, -4134.52, 278.097, 0.925024, 0, 0, 0.446198, 0.894935, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9611 at 313.276398 yards.
(14103, 2047, 0, -6653.81, -4029.69, 269.574, 5.28835, 0, 0, -0.477159, 0.878817, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9611 at 245.857025 yards.
(14138, 2047, 0, -6767.48, -3360.57, 250.464, 1.51844, 0, 0, 0.688354, 0.725374, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 9251 at 29.862043 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(13822, 1290, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Badlands 27 objects total
(14084, 1290, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Badlands 27 objects total
(14095, 1290, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Badlands 138 objects total
(14102, 1290, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Badlands 27 objects total
(14103, 1290, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Badlands 27 objects total
(14138, 1290, 0, 'Truesilver Deposit', 0, 10); -- Truesilver Deposits in Badlands 27 objects total

-- Missing Truesilver Deposit spawns in Blasted Lands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(14080, 2047, 0, -11126.9, -3365.38, 58.9554, 4.67748, 0, 0, -0.719339, 0.694659, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9504 at 127.721725 yards.
(14120, 2047, 0, -11542.7, -2919.17, 14.5303, 4.11898, 0, 0, -0.882947, 0.469473, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9560 at 68.535973 yards.
(14145, 2047, 0, -10872.9, -2727.42, 9.55622, 5.53269, 0, 0, -0.366501, 0.930418, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9294 at 106.037689 yards.
(14146, 2047, 0, -10942.8, -2822.68, 27.2863, 4.76475, 0, 0, -0.688354, 0.725374, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9294 at 17.606758 yards.
(17860, 150081, 0, -10604.6, -3622.64, -12.7788, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 1, 100, 0, 10),
(17861, 150081, 0, -10497.4, -3329.15, -4.38601, 1.01229, 0, 0, 0.484809, 0.87462, 300, 300, 1, 100, 0, 10),
(17862, 150081, 0, -10678, -3063.91, 19.3301, 1.16937, 0, 0, 0.551936, 0.833886, 300, 300, 1, 100, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(14080, 1278, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Blasted Lands 26 objects total
(14120, 1278, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Blasted Lands 26 objects total
(14145, 1278, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Blasted Lands 8 objects total
(14146, 1278, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Blasted Lands 8 objects total
(17860, 1278, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Blasted Lands 26 objects total
(17861, 1278, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Blasted Lands 8 objects total
(17862, 1278, 0, 'Truesilver Deposit', 0, 10); -- Truesilver Deposits in Blasted Lands 8 objects total

-- Missing Truesilver Deposit spawns in Swamp of Sorrows.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(14117, 2047, 0, -10068.9, -3040.34, 33.9087, 2.28638, 0, 0, 0.909961, 0.414694, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 9306 at 283.143707 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(14117, 1316, 0, 'Truesilver Deposit', 0, 10); -- Truesilver Deposits in Swamp of Sorrows (2) 8 objects total

-- Missing Truesilver Deposit spawns in Azshara.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(14127, 2047, 1, 2828.26, -3994.61, 117.324, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 9329 at 1214.595459 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(14127, 1244, 0, 'Truesilver Deposit', 0, 10); -- Truesilver Deposits in Azshara 14 objects total

-- Missing Truesilver Deposit spawns in Western Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(14119, 2047, 0, 2318.85, -2372.06, 54.5187, 5.48033, 0, 0, -0.390731, 0.920505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9303 at 469.944794 yards.
(14126, 2047, 0, 1911.18, -2145.27, 75.1413, 6.21337, 0, 0, -0.0348988, 0.999391, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9393 at 331.736542 yards.
(14143, 2047, 0, 1491.92, -1351.54, 63.0037, 3.4383, 0, 0, -0.989016, 0.147811, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9403 at 357.611237 yards.
(14152, 2047, 0, 1634.02, -1956.59, 73.183, 1.8675, 0, 0, 0.803857, 0.594823, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9393 at 117.756729 yards.
(14153, 2047, 0, 1238.13, -1780.96, 68.3152, 5.34071, 0, 0, -0.45399, 0.891007, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9638 at 105.134918 yards.
(14154, 2047, 0, 2266.57, -1614.03, 97.5257, 5.5676, 0, 0, -0.350207, 0.936672, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 9303 at 294.161682 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(14119, 1262, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Western Plaguelands 16 objects total
(14126, 1262, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Western Plaguelands 16 objects total
(14143, 1262, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Western Plaguelands 16 objects total
(14152, 1262, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Western Plaguelands 16 objects total
(14153, 1262, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Western Plaguelands 16 objects total
(14154, 1262, 0, 'Truesilver Deposit', 0, 10); -- Truesilver Deposits in Western Plaguelands 16 objects total

-- Missing Truesilver Deposit spawns in Burning Steppes.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(14091, 2047, 0, -7756.13, -2785.21, 163.069, 1.79769, 0, 0, 0.782608, 0.622515, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9598 at 73.049744 yards.
(14092, 2047, 0, -7824.89, -2618.07, 123.346, 6.19592, 0, 0, -0.0436192, 0.999048, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9532 at 30.558954 yards.
(14100, 2047, 0, -8191.1, -1650.54, 147.062, 5.93412, 0, 0, -0.173648, 0.984808, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9530 at 75.633057 yards.
(14105, 2047, 0, -7978.81, -2636.86, 170.912, 6.05629, 0, 0, -0.113203, 0.993572, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9311 at 50.674606 yards.
(14134, 2047, 0, -7867.83, -2616.99, 124.392, 5.44543, 0, 0, -0.406736, 0.913546, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9532 at 22.055857 yards.
(14184, 2047, 0, -8085.11, -1281.41, 141.056, 4.25861, 0, 0, -0.848047, 0.529921, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9366 at 181.738419 yards.
(14185, 2047, 0, -7905.12, -1491.49, 155.801, 0.226892, 0, 0, 0.113203, 0.993572, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 9655 at 46.167610 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(14091, 1297, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Burning Steppes 138 objects total
(14092, 1297, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Burning Steppes 138 objects total
(14100, 1297, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Burning Steppes 138 objects total
(14105, 1297, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Burning Steppes 138 objects total
(14134, 1297, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Burning Steppes 138 objects total
(14184, 1297, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Burning Steppes 138 objects total
(14185, 1297, 0, 'Truesilver Deposit', 0, 10); -- Truesilver Deposits in Burning Steppes 138 objects total

-- Missing Truesilver Deposit spawns in The Hinterlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(14104, 2047, 0, -209.675, -3491.38, 147.553, 4.57276, 0, 0, -0.754709, 0.656059, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9474 at 106.840073 yards.
(14108, 2047, 0, 121.811, -4147.39, 157.877, 0.244346, 0, 0, 0.121869, 0.992546, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9643 at 320.994812 yards.
(14109, 2047, 0, 314.887, -3711.68, 107.684, 5.89921, 0, 0, -0.190808, 0.981627, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9643 at 352.173767 yards.
(14111, 2047, 0, -177.469, -2881.45, 115.721, 5.98648, 0, 0, -0.147809, 0.989016, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9281 at 91.532074 yards.
(14114, 2047, 0, -345.231, -3401.23, 163.319, 5.93412, 0, 0, -0.173648, 0.984808, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9478 at 106.993919 yards.
(14124, 2047, 0, -82.8166, -3537.39, 120.366, 5.13127, 0, 0, -0.544639, 0.838671, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9474 at 137.439880 yards.
(14128, 2047, 0, -601.705, -3747.02, 231.71, 5.86431, 0, 0, -0.207911, 0.978148, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9395 at 322.487946 yards.
(14132, 2047, 0, 345.971, -3868.34, 106.97, 2.46091, 0, 0, 0.942641, 0.333808, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9643 at 194.373047 yards.
(14141, 2047, 0, -222.086, -3605.74, 231.848, 3.89209, 0, 0, -0.930417, 0.366502, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9440 at 18.182875 yards.
(14142, 2047, 0, -130.105, -4157.03, 122.284, 6.16101, 0, 0, -0.0610485, 0.998135, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9291 at 231.198669 yards.
(14144, 2047, 0, 41.2691, -4190.52, 117.515, 5.75959, 0, 0, -0.258819, 0.965926, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9264 at 258.136688 yards.
(14150, 2047, 0, 1071.21, -4067.14, 137.553, 4.76475, 0, 0, -0.688354, 0.725374, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9643 at 649.684570 yards.
(14151, 2047, 0, -183.887, -4243.68, 138.965, 1.37881, 0, 0, 0.636078, 0.771625, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9291 at 154.539932 yards.
(46413, 2047, 0, -433.382, -4637.36, -6.58656, 0.977383, 0, 0, 0.469471, 0.882948, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 46403 at 382.889526 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(14104, 1256, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Hinterlands 26 objects total
(14108, 1256, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Hinterlands 26 objects total
(14109, 1256, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Hinterlands 26 objects total
(14111, 1256, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Hinterlands 26 objects total
(14114, 1256, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Hinterlands 26 objects total
(14124, 1256, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Hinterlands 26 objects total
(14128, 1256, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Hinterlands 26 objects total
(14132, 1256, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Hinterlands 26 objects total
(14141, 1256, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Hinterlands 26 objects total
(14142, 1256, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Hinterlands 26 objects total
(14144, 1256, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Hinterlands 26 objects total
(14150, 1256, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Hinterlands 26 objects total
(14151, 1256, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Hinterlands 26 objects total
(46413, 1256, 0, 'Truesilver Deposit', 0, 10); -- Truesilver Deposits in Hinterlands 26 objects total

-- Missing Truesilver Deposit spawns in Searing Gorge.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(13821, 2047, 0, -7314.01, -1597.51, 315.985, 0.261798, 0, 0, 0.130526, 0.991445, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9439 at 226.309647 yards.
(14021, 2047, 0, -6484.22, -1675.34, 307.176, 0.575957, 0, 0, 0.284015, 0.95882, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 13226 at 118.592377 yards.
(14081, 2047, 0, -6683.49, -1230.45, 181.85, 2.1293, 0, 0, 0.874619, 0.48481, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9633 at 50.968449 yards.
(14082, 2047, 0, -6782.98, -1169.51, 243.777, 5.18363, 0, 0, -0.522498, 0.85264, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9631 at 82.541229 yards.
(14093, 2047, 0, -6463.52, -824.624, 336.551, 0.994837, 0, 0, 0.477159, 0.878817, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 13225 at 109.176941 yards.
(14116, 2047, 0, -6862.05, -1551.08, 242.068, 3.10665, 0, 0, 0.999847, 0.0174693, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9602 at 89.256042 yards.
(14122, 2047, 0, -6935.9, -1202.91, 148.082, 1.20428, 0, 0, 0.566406, 0.824126, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9498 at 117.084587 yards.
(14123, 2047, 0, -6680.17, -1020.97, 253.177, 1.74533, 0, 0, 0.766044, 0.642789, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9383 at 58.577667 yards.
(14129, 2047, 0, -7117.15, -1606, 258.349, 3.4383, 0, 0, -0.989016, 0.147811, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9439 at 25.695459 yards.
(14130, 2047, 0, -6736.55, -1686.12, 219.236, 4.03171, 0, 0, -0.902585, 0.430512, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9458 at 18.776443 yards.
(14147, 2047, 0, -6754.19, -1363.81, 196.629, 1.90241, 0, 0, 0.814116, 0.580703, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9610 at 58.807659 yards.
(14148, 2047, 0, -6869.47, -1410.38, 172.377, 3.50812, 0, 0, -0.983254, 0.182238, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9610 at 84.913795 yards.
(14155, 2047, 0, -7156.05, -1163.11, 265.518, 4.38078, 0, 0, -0.814116, 0.580703, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 9309 at 78.765457 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(13821, 1294, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Searing Gorge 39 objects total
(14021, 1294, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Searing Gorge 39 objects total
(14081, 1294, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Searing Gorge 39 objects total
(14082, 1294, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Searing Gorge 39 objects total
(14093, 1294, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Searing Gorge 39 objects total
(14116, 1294, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Searing Gorge 39 objects total
(14122, 1294, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Searing Gorge 39 objects total
(14123, 1294, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Searing Gorge 39 objects total
(14129, 1294, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Searing Gorge 39 objects total
(14130, 1294, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Searing Gorge 39 objects total
(14147, 1294, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Searing Gorge 39 objects total
(14148, 1294, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Searing Gorge 39 objects total
(14155, 1294, 0, 'Truesilver Deposit', 0, 10); -- Truesilver Deposits in Searing Gorge 39 objects total

-- Missing Truesilver Deposit spawns in Eastern Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(14125, 2047, 0, 2272.24, -4186.96, 116.365, 4.45059, 0, 0, -0.793353, 0.608762, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9615 at 277.684723 yards.
(14157, 2047, 0, 1958.6, -4320.36, 24.7932, 5.95157, 0, 0, -0.165047, 0.986286, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 9654 at 71.562431 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(14125, 1272, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Eastern Plaguelands 23 objects total
(14157, 1272, 0, 'Truesilver Deposit', 0, 10); -- Truesilver Deposits in Eastern Plaguelands 23 objects total

-- Missing Truesilver Deposit spawns in Feralas.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(50357, 2047, 1, -3847.84, 1737.33, 143.018, 3.07177, 0, 0, 0.999391, 0.0349061, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 50258 at 127.431198 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(50357, 1197, 0, 'Truesilver Deposit', 0, 10); -- Truesilver Deposits in Feralas 5 objects total

-- Missing Truesilver Deposit spawns in Desolace.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(14023, 2047, 1, -2118.6, 1952.15, 73.0367, 0.226892, 0, 0, 0.113203, 0.993572, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9295 at 291.746704 yards.
(29217, 2047, 1, -1523.36, 2828.88, 144.781, 6.03884, 0, 0, -0.121869, 0.992546, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 29207 at 214.093216 yards.
(14090, 2047, 1, -2319.18, 2605.48, 63.8411, 4.29351, 0, 0, -0.83867, 0.54464, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9295 at 491.968903 yards.
(14094, 2047, 1, -1833.65, 1021.58, 98.3811, 1.46608, 0, 0, 0.66913, 0.743145, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9295 at 1214.475830 yards.
(14112, 2047, 1, -2008.28, 2777.47, 67.2456, 3.15906, 0, 0, -0.999962, 0.00873464, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 9256 at 303.939728 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(14023, 1147, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Desolace 11 objects total
(29217, 1147, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Desolace 11 objects total
(14090, 1147, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Desolace 11 objects total
(14094, 1147, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Desolace 11 objects total
(14112, 1147, 0, 'Truesilver Deposit', 0, 10); -- Truesilver Deposits in Desolace 11 objects total

-- Missing Truesilver Deposit spawns in Tanaris.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(14079, 2047, 1, -7000.3, -3962.55, 31.6025, 4.2237, 0, 0, -0.857167, 0.515038, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9432 at 216.694000 yards.
(14113, 2047, 1, -7242.14, -3437.92, 13.3299, 1.0472, 0, 0, 0.5, 0.866025, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9235 at 7.063921 yards.
(14115, 2047, 1, -9128.43, -2205.64, 21.9909, 1.16937, 0, 0, 0.551936, 0.833886, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9421 at 84.145699 yards.
(14149, 2047, 1, -6967.48, -3572.2, 29.089, 1.71042, 0, 0, 0.754709, 0.656059, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 9634 at 253.480164 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(14079, 1202, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Tanaris 25 objects total
(14113, 1202, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Tanaris 25 objects total
(14115, 1202, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Tanaris 25 objects total
(14149, 1202, 0, 'Truesilver Deposit', 0, 10); -- Truesilver Deposits in Tanaris 25 objects total

-- Missing Truesilver Deposit spawns in Un'Goro Crater.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(18190, 2047, 1, -6828.59, -1685.69, -264.789, 0.59341, 0, 0, 0.292371, 0.956305, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 18011 at 295.679688 yards.
(14098, 2047, 1, -6358.96, -2003.23, -275.88, 2.86234, 0, 0, 0.990268, 0.139175, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9534 at 42.167591 yards.
(14099, 2047, 1, -6346.85, -1587.08, -268.273, 1.32645, 0, 0, 0.615661, 0.788011, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 9275 at 331.112793 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(18190, 1210, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Veins in Ungoro 14 objects total
(14098, 1210, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Veins in Ungoro 14 objects total
(14099, 1210, 0, 'Truesilver Deposit', 0, 10); -- Truesilver Veins in Ungoro 14 objects total

-- Missing Truesilver Deposit spawns in Winterspring.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(14101, 2047, 1, 5985.9, -4293.72, 762.11, 0.645772, 0, 0, 0.317305, 0.948324, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 9466 at 552.233643 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(14101, 1234, 0, 'Truesilver Deposit', 0, 10); -- Truesilver Deposits in Winterspring 11 objects total

-- Missing Truesilver Deposit spawns in Silithus.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(14156, 2047, 1, -7314.07, 276.762, 16.4116, 1.25664, 0, 0, 0.587785, 0.809017, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 9622 at 752.307800 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(14156, 1219, 0, 'Truesilver Deposit', 0, 10); -- Truesilver Deposits in Silithus 6 objects total

-- Missing Truesilver Deposit spawns in Desolace.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(14078, 2047, 1, -1361.49, 2601.74, 73.1999, 4.76475, 0, 0, -0.688354, 0.725374, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9418 at 332.520172 yards.
(14083, 2047, 1, -1276.49, 2921.21, 74.2758, 1.309, 0, 0, 0.608761, 0.793354, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 9418 at 19.983637 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(14078, 1147, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposits in Desolace 11 objects total
(14083, 1147, 0, 'Truesilver Deposit', 0, 10); -- Truesilver Deposits in Desolace 11 objects total

-- Missing Truesilver Deposit spawns in Hillsbrad
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES (406, 1, 'Truesilver Deposits in Hillsbrad');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(87878, 2047, 0, -291.373, -291.808, 44.137, 1.97222, 0, 0, 0.833885, 0.551938, 300, 300, 1, 100, 0, 10); 
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(87878, 406, 0, 'Truesilver Deposit', 0, 10);

-- Missing Truesilver Deposit spawns in Alterac
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES (407, 1, 'Truesilver Deposits in Alterac');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(87879, 2047, 0, 742.411, -759.57, 179.781, 0.122173, 0, 0, 0.0610485, 0.998135, 300, 300, 1, 100, 0, 10),
(87880, 2047, 0, 759.1, -212.715, 145.379, 1.39626, 0, 0, 0.642787, 0.766045, 300, 300, 1, 100, 0, 10),
(87881, 2047, 0, 285.762, -121.496, 145.998, 0.383971, 0, 0, 0.190808, 0.981627, 300, 300, 1, 100, 0, 10); 
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(87879, 407, 0, 'Truesilver Deposit', 0, 10),
(87880, 407, 0, 'Truesilver Deposit', 0, 10),
(87881, 407, 0, 'Truesilver Deposit', 0, 10);

-- Missing Truesilver Deposit spawns in Arathi
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES (408, 1, 'Truesilver Deposits in Arathi');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(370216, 2047, 0, -1657.74, -2215.52, 23.8297, 5.55015, 0, 0, -0.358368, 0.93358, 300, 300, 1, 100, 0, 10),
(87882, 2047, 0, -1827.82, -2643.53, 59.8704, 6.23083, 0, 0, -0.0261765, 0.999657, 300, 300, 1, 100, 0, 10),
(87883, 2047, 0, -2182, -1665.24, -35.4133, 0.59341, 0, 0, 0.292371, 0.956305, 300, 300, 1, 100, 0, 10),
(87884, 2047, 0, -1831.79, -1443.18, 59.4886, 5.96903, 0, 0, -0.156434, 0.987688, 300, 300, 1, 100, 0, 10),
(87885, 2047, 0, -1842.88, -2536.53, 55.9154, 5.60251, 0, 0, -0.333807, 0.942641, 300, 300, 1, 100, 0, 10),
(87886, 2047, 0, -2339.53, -1646.11, -24.6021, 0.698131, 0, 0, 0.34202, 0.939693, 300, 300, 1, 100, 0, 10),
(87887, 2047, 0, -2307.24, -1790.67, -22.6112, 0.453785, 0, 0, 0.224951, 0.97437, 300, 300, 1, 100, 0, 10),
(87888, 2047, 0, -2241.04, -1835.02, -20.1633, 0.418879, 0, 0, 0.207911, 0.978148, 300, 300, 1, 100, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(370216, 408, 0, 'Truesilver Deposit', 0, 10),
(87882, 408, 0, 'Truesilver Deposit', 0, 10),
(87883, 408, 0, 'Truesilver Deposit', 0, 10),
(87884, 408, 0, 'Truesilver Deposit', 0, 10),
(87885, 408, 0, 'Truesilver Deposit', 0, 10),
(87886, 408, 0, 'Truesilver Deposit', 0, 10),
(87887, 408, 0, 'Truesilver Deposit', 0, 10),
(87888, 408, 0, 'Truesilver Deposit', 0, 10);

UPDATE `pool_template` SET `description`='Truesilver Deposits in Stranglethorn' WHERE  `entry`=1178;
UPDATE `pool_template` SET `description`='Truesilver Deposits in Swamp of Sorrows' WHERE  `entry`=1316;

-- MISC ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DELETE FROM `gameobject` WHERE  `guid` IN (
15460,
15461,
15463,
15464,
15465,
15466,
15468,
15469,
15471,
15472,
15473,
20542,
20543,
20544,
20545,
20546,
20547,
20548,
20549,
20550,
20551,
20552,
20554,
20555);

DELETE FROM `pool_gameobject` WHERE  `guid` IN (
15460,
15461,
15463,
15464,
15465,
15466,
15468,
15469,
15471,
15472,
15473,
20542,
20543,
20544,
20545,
20546,
20547,
20548,
20549,
20550,
20551,
20552,
20554,
20555);

DELETE FROM `pool_gameobject` WHERE  `guid` IN (
15467,
15459,
15470,
17754,
17751,
50167,
16680,
15462);

UPDATE `pool_template` SET `description`='Ooze Covered Rich Thorium Veins in Silithus' WHERE  `entry`=37000;

-- Sync Some Gobject Respawn Times With Cmangos
UPDATE `gameobject` SET `spawntimesecsmin` = 10, `spawntimesecsmax` = 10 WHERE `id` IN (
52,
54,
57,
58,
759,
2716,
2717,
2718,
2739,
2740,
2741,
2742,
3237,
3238,
3239,
13949,
20447,
104564,
104569,
104574,
126158,
148499,
169294,
176484,
176485,
176486,
176487,
176785,
177287,
177805,
177806,
177964,
178084,
178085,
179488,
179498,
180665,
180667
);

UPDATE `gameobject` SET `spawntimesecsmin` = 30, `spawntimesecsmax` = 30 WHERE `id` IN (
1721,
1722,
177927
);

UPDATE `gameobject` SET `spawntimesecsmin` = 45, `spawntimesecsmax` = 90 WHERE `id` IN (
142144,
142145
);

UPDATE `gameobject` SET `spawntimesecsmin` = 50, `spawntimesecsmax` = 50 WHERE `id` IN (
19284
);

UPDATE `gameobject` SET `spawntimesecsmin` = 60, `spawntimesecsmax` = 60 WHERE `id` IN (
3644
);

UPDATE `gameobject` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `id` IN (
2124,
164729
);

UPDATE `gameobject` SET `spawntimesecsmin` = 180, `spawntimesecsmax` = 180 WHERE `id` IN (
3658,
3694,
3719,
12654,
19541,
19542,
19868,
176325,
176327,
180582,
180656,
180657,
180662,
180663,
180664,
181598
);

UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `id` IN (
324,
1610,
1617,
1618,
1619,
1620,
1621,
1622,
1623,
1624,
1628,
1731,
1732,
1733,
1734,
1735,
1736,
2040,
2041,
2042,
2043,
2044,
2045,
2046,
2047,
2055,
2656,
2712,
2866,
3724,
13360,
13872,
142140,
142141,
142142,
142143,
160445,
175566,
176583,
176584,
176586,
176587,
142143
);

UPDATE `gameobject` SET `spawntimesecsmin` = 900, `spawntimesecsmax` = 900 WHERE `id` IN (
2855,
3236,
3706,
3724,
3725,
3726,
3727,
3729,
3799,
3800,
4087,
4088,
4089,
4090
);

UPDATE `gameobject` SET `spawntimesecsmin` = 1800, `spawntimesecsmax` = 1800 WHERE `id` IN (
180753
);

UPDATE `gameobject` SET `spawntimesecsmin` = 3595, `spawntimesecsmax` = 3595 WHERE `id` IN (
173284,
173324,
173327,
174594,
174595,
174596,
174598,
174599,
174600,
174601,
174602,
174603,
174604,
174605,
174606,
174607,
174608,
174684,
174686,
174708,
174709,
174712,
174713
);

UPDATE `gameobject` SET `spawntimesecsmin` = 3600, `spawntimesecsmax` = 3600 WHERE `id` IN (
2850,
3695,
3715,
74448,
111095
);

UPDATE `gameobject` SET `spawntimesecsmin` = 5200, `spawntimesecsmax` = 5200 WHERE `id` IN (
75293
);

UPDATE `gameobject` SET `spawntimesecsmin` = 604800, `spawntimesecsmax` = 604800 WHERE `id` IN (
3703,
3704,
34025,
34026,
34027,
34028,
34029,
34030,
75296,
75299,
153464,
153469,
164819,
164911,
175245,
179516,
179528,
179548,
180691,
181356
);

UPDATE gameobject SET spawntimesecsmin = 10, spawntimesecsmax = 10 WHERE spawntimesecsmin < 21 AND spawntimesecsmin > 0;

-- Update Mining Gameobjects
UPDATE `gameobject` SET `spawn_flags` = 0 WHERE `id` IN (1731, 1732, 165658, 2047, 324, 175404);

UPDATE `gameobject` SET `spawntimesecsmin`= 300, `spawntimesecsmax` = 300 WHERE `id` = 103713;
UPDATE `gameobject` SET `spawntimesecsmin`= 300, `spawntimesecsmax` = 300 WHERE `id` = 3763;
UPDATE `gameobject` SET `spawntimesecsmin`= 300, `spawntimesecsmax` = 300 WHERE `id` = 73941;
UPDATE `gameobject` SET `spawntimesecsmin`= 300, `spawntimesecsmax` = 300 WHERE `id` = 123310;
UPDATE `gameobject` SET `spawntimesecsmin`= 300, `spawntimesecsmax` = 300 WHERE `id` = 123309;
UPDATE `gameobject` SET `spawntimesecsmin`= 300, `spawntimesecsmax` = 300 WHERE `id` = 165658;
UPDATE `gameobject` SET `spawntimesecsmin`= 300, `spawntimesecsmax` = 300 WHERE `id` = 175404;

UPDATE `gameobject` SET `spawntimesecsmin`= 604800, `spawntimesecsmax` = 604800 WHERE `id` = 1733 AND `map` = 48;
UPDATE `gameobject` SET `spawntimesecsmin`= 604800, `spawntimesecsmax` = 604800 WHERE `id` = 1731 AND `map` IN (43, 36);
UPDATE `gameobject` SET `spawntimesecsmin`= 604800, `spawntimesecsmax` = 604800 WHERE `id` = 1732 AND `map` IN (43, 36);
UPDATE `gameobject` SET `spawntimesecsmin`= 604800, `spawntimesecsmax` = 604800 WHERE `id` = 1735 AND `map` IN (409, 230, 47, 70);
UPDATE `gameobject` SET `spawntimesecsmin`= 604800, `spawntimesecsmax` = 604800 WHERE `id` = 181109 AND `map` = 30;
UPDATE `gameobject` SET `spawntimesecsmin`= 604800, `spawntimesecsmax` = 604800 WHERE `id` = 1734 AND `map` IN (349, 47);
UPDATE `gameobject` SET `spawntimesecsmin`= 604800, `spawntimesecsmax` = 604800 WHERE `id` = 2040 AND `map` IN (349, 70);
UPDATE `gameobject` SET `spawntimesecsmin`= 604800, `spawntimesecsmax` = 604800 WHERE `id` = 176645 AND `map` = 30;
UPDATE `gameobject` SET `spawntimesecsmin`= 604800, `spawntimesecsmax` = 604800 WHERE `id` = 2047 AND `map` = 349;
UPDATE `gameobject` SET `spawntimesecsmin`= 604800, `spawntimesecsmax` = 604800 WHERE `id` = 165658 AND `map` IN (409, 230);
UPDATE `gameobject` SET `spawntimesecsmin`= 604800, `spawntimesecsmax` = 604800 WHERE `id` = 176643 AND `map` = 30;
UPDATE `gameobject` SET `spawntimesecsmin`= 604800, `spawntimesecsmax` = 604800 WHERE `id` = 175404 AND `map` IN (429, 30);

-- Create new pool to hold Ooze Covered Gold Vein spawns in Durotar.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(409, 1, 'Ooze Covered Gold Veins in Durotar', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(14685, 409, 0, 'Ooze Covered Gold Vein', 0, 10);

-- Create new pool to hold Ooze Covered Silver Vein spawns in Thousand Needles.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(410, 1, 'Ooze Covered Silver Veins in Thousand Needles', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(14684, 410, 0, 'Ooze Covered Silver Vein', 0, 10);

-- Create new pool to hold Ooze Covered Thorium Vein spawns in Feralas.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(411, 1, 'Ooze Covered Thorium Veins in Feralas', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(50167, 411, 0, 'Ooze Covered Thorium Vein', 0, 10);

-- Create new pool to hold Ooze Covered Thorium Vein spawns in Un'Goro Crater.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(412, 1, 'Ooze Covered Thorium Veins in Ungoro Crater', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(15462, 412, 0, 'Ooze Covered Thorium Vein', 0, 10),
(15470, 412, 0, 'Ooze Covered Thorium Vein', 0, 10),
(16680, 412, 0, 'Ooze Covered Thorium Vein', 0, 10),
(17751, 412, 0, 'Ooze Covered Thorium Vein', 0, 10),
(15459, 412, 0, 'Ooze Covered Thorium Vein', 0, 10),
(15467, 412, 0, 'Ooze Covered Thorium Vein', 0, 10),
(17754, 412, 0, 'Ooze Covered Thorium Vein', 0, 10);

-- Create new pool to hold Ooze Covered Truesilver Deposit spawns in Feralas.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(413, 1, 'Ooze Covered Truesilver Deposits in Feralas', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(15424, 413, 0, 'Ooze Covered Truesilver Deposit', 0, 10),
(15425, 413, 0, 'Ooze Covered Truesilver Deposit', 0, 10),
(15428, 413, 0, 'Ooze Covered Truesilver Deposit', 0, 10);

-- Create new pool to hold Ooze Covered Truesilver Deposit spawns in Un'Goro Crater.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(414, 1, 'Ooze Covered Truesilver Deposits in Ungoro Crater', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(15423, 414, 0, 'Ooze Covered Truesilver Deposit', 0, 10),
(15426, 414, 0, 'Ooze Covered Truesilver Deposit', 0, 10),
(15427, 414, 0, 'Ooze Covered Truesilver Deposit', 0, 10);

UPDATE `pool_template` SET `description`='Gold Veins in Ungoro Crater' WHERE  `entry`=1346;
UPDATE `pool_template` SET `description`='Truesilver Veins in Ungoro Crater' WHERE  `entry`=1213;
UPDATE `pool_template` SET `description`='Gold Veins in Swamp of Sorrows' WHERE  `entry`=1332;
UPDATE `pool_template` SET `description`='Rich Thorium Veins in Ungoro Crater' WHERE  `entry`=1217;
UPDATE `pool_template` SET `description`='Small Thorium Veins in Ungoro Crater' WHERE  `entry`=1211;
UPDATE `pool_template` SET `description`='Mithril Deposits in Arathi Highlands' WHERE  `entry`=1188;
UPDATE `pool_template` SET `description`='Liferoots in Arathi Highlands' WHERE  `entry`=1184;
UPDATE `pool_template` SET `description`='Wild Steelblooms in Arathi Highlands' WHERE  `entry`=1185;
UPDATE `pool_template` SET `description`='Iron Deposits in Arathi Highlands' WHERE  `entry`=1186;
UPDATE `pool_template` SET `description`='Fadeleafs in Arathi Highlands' WHERE  `entry`=1183;
UPDATE `pool_template` SET `description`='Khadgars Whisker in Arathi Highlands' WHERE  `entry`=1182;
UPDATE `pool_template` SET `description`='Tin Veins in Arathi Highlands' WHERE  `entry`=1187;
UPDATE `pool_template` SET `description`='Kingsblood in Arathi Highlands' WHERE  `entry`=1180;
UPDATE `pool_template` SET `description`='Goldthorn in Arathi Highlands' WHERE  `entry`=1181;
UPDATE `pool_template` SET `description`='Silver Veins in Arathi Highlands' WHERE  `entry`=335;
UPDATE `pool_template` SET `description`='Truesilver Deposits in Arathi Highlands' WHERE  `entry`=408;
UPDATE `pool_template` SET `description`='Stranglekelp in Hillsbrad Foothills' WHERE  `entry`=1123;
UPDATE `pool_template` SET `description`='Iron Deposits in Hillsbrad Foothills' WHERE  `entry`=1070;
UPDATE `pool_template` SET `description`='Copper Veins in Hillsbrad Foothills' WHERE  `entry`=1066;
UPDATE `pool_template` SET `description`='Tin Veins in Hillsbrad Foothills' WHERE  `entry`=1067;
UPDATE `pool_template` SET `description`='Kingsblood in Hillsbrad Foothills' WHERE  `entry`=1051;
UPDATE `pool_template` SET `description`='Briarthorn in Hillsbrad Foothills' WHERE  `entry`=1050;
UPDATE `pool_template` SET `description`='Mageroyals in Hillsbrad Foothills' WHERE  `entry`=1049;
UPDATE `pool_template` SET `description`='Bruiseweed in Hillsbrad Foothills' WHERE  `entry`=1048;
UPDATE `pool_template` SET `description`='Mithril Deposits in Hillsbrad Foothills' WHERE  `entry`=323;
UPDATE `pool_template` SET `description`='Silver Veins in Hillsbrad Foothills' WHERE  `entry`=322;
UPDATE `pool_template` SET `description`='Truesilver Deposits in Hillsbrad Foothills' WHERE  `entry`=406;
UPDATE `pool_template` SET `description`='Silver Veins in Alterac Mountains' WHERE  `entry`=397;
UPDATE `pool_template` SET `description`='Truesilver Deposits in Alterac Mountains' WHERE  `entry`=407;
UPDATE `pool_template` SET `description`='Bruiseweed in Alterac Mountains' WHERE  `entry`=1056;
UPDATE `pool_template` SET `description`='Kingsblood in Alterac Mountains' WHERE  `entry`=1057;
UPDATE `pool_template` SET `description`='Khadgars Whisker in Alterac Mountains' WHERE  `entry`=1059;
UPDATE `pool_template` SET `description`='Goldthorn in Alterac Mountains' WHERE  `entry`=1058;
UPDATE `pool_template` SET `description`='Grave Moss in Alterac Mountains' WHERE  `entry`=1060;
UPDATE `pool_template` SET `description`='Wild Steelblooms in Alterac Mountains' WHERE  `entry`=1061;
UPDATE `pool_template` SET `description`='Wintersbite in Alterac Mountains' WHERE  `entry`=1062;
UPDATE `pool_template` SET `description`='Iron Deposits in Alterac Mountains' WHERE  `entry`=1068;
UPDATE `pool_template` SET `description`='Liferoots in Alterac Mountains' WHERE  `entry`=1063;
UPDATE `pool_template` SET `description`='Mithril Deposits in Alterac Mountains' WHERE  `entry`=1069;
UPDATE `pool_template` SET `description`='Fadeleafs in Alterac Mountains' WHERE  `entry`=1071;
UPDATE `pool_template` SET `description`='Copper Veins in Barrens' WHERE  `entry`=1033;
UPDATE `pool_template` SET `description`='Copper Veins in Durotar' WHERE  `entry`=1024;
UPDATE `pool_template` SET `description`='Copper Veins in Silverpine Forest' WHERE  `entry`=1044;
UPDATE `pool_template` SET `description`='Copper Veins in Elwynn Forest' WHERE  `entry`=1015;
UPDATE `pool_template` SET `description`='Copper Veins in Darkshore' WHERE  `entry`=1098;
UPDATE `pool_template` SET `description`='Copper Veins in Loch Modan' WHERE  `entry`=1166;
UPDATE `pool_template` SET `description`='Copper Veins in Stonetalon' WHERE  `entry`=1089;
UPDATE `pool_template` SET `description`='Copper Veins in Dun Morogh' WHERE  `entry`=1019;
UPDATE `pool_template` SET `description`='Small Thorium Veins in Tanaris' WHERE  `entry`=1204;
UPDATE `pool_template` SET `description`='Copper Veins in Ashenvale' WHERE  `entry`=1075;
UPDATE `pool_template` SET `description`='Copper Veins in Mulgore' WHERE  `entry`=1028;
UPDATE `pool_template` SET `description`='Tin Veins in Barrens' WHERE  `entry`=1034;
UPDATE `pool_template` SET `description`='Copper Veins in Redridge' WHERE  `entry`=1128;
UPDATE `pool_template` SET `description`='Tin Veins in Wetlands' WHERE  `entry`=1157;
UPDATE `pool_template` SET `description`='Copper Veins in Thousand Needles' WHERE  `entry`=1130;
UPDATE `pool_template` SET `description`='Copper Veins in Tirisfal' WHERE  `entry`=1008;
UPDATE `pool_template` SET `description`='Gold Veins in Tanaris' WHERE  `entry`=1201;
UPDATE `pool_template` SET `description`='Tin Veins in Stonetalon' WHERE  `entry`=1090;
UPDATE `pool_template` SET `description`='Tin Veins in Silverpine Forest' WHERE  `entry`=1045;
UPDATE `pool_template` SET `description`='Rich Thorium Veins in Burning Steppes' WHERE  `entry`=1299;
UPDATE `pool_template` SET `description`='Small Thorium Veins in Silithus' WHERE  `entry`=1220;
UPDATE `pool_template` SET `description`='Small Thorium Veins in Ungoro Crater' WHERE  `entry`=1211;
UPDATE `pool_template` SET `description`='Small Thorium Veins in Burning Steppes' WHERE  `entry`=1298;
UPDATE `pool_template` SET `description`='Rich Thorium Veins in Winterspring' WHERE  `entry`=1235;
UPDATE `pool_template` SET `description`='Gold Veins in Stranglethorn' WHERE  `entry`=1176;
UPDATE `pool_template` SET `description`='Tin Veins in Redridge' WHERE  `entry`=1129;
UPDATE `pool_template` SET `description`='Silver Veins in Ashenvale' WHERE  `entry`=1080;
UPDATE `pool_template` SET `description`='Rich Thorium Veins in Azshara' WHERE  `entry`=1246;
UPDATE `pool_template` SET `description`='Copper Veins in Wetlands' WHERE  `entry`=1156;
UPDATE `pool_template` SET `description`='Tin Veins in Ashenvale' WHERE  `entry`=1074;
UPDATE `pool_template` SET `description`='Small Thorium Veins in Blasted Lands' WHERE  `entry`=1280;
UPDATE `pool_template` SET `description`='Copper Veins in Duskwood' WHERE  `entry`=1119;
UPDATE `pool_template` SET `description`='Gold Veins in Thousand Needles' WHERE  `entry`=1135;
UPDATE `pool_template` SET `description`='Tin Veins in Westfall' WHERE  `entry`=1112;
UPDATE `pool_template` SET `description`='Silver Veins in Stonetalon' WHERE  `entry`=1092;
UPDATE `pool_template` SET `description`='Gold Veins in Badlands' WHERE  `entry`=1288;
UPDATE `pool_template` SET `description`='Rich Thorium Veins in Ungoro Crater' WHERE  `entry`=1217;
UPDATE `pool_template` SET `description`='Small Thorium Veins in Felwood' WHERE  `entry`=1232;
UPDATE `pool_template` SET `description`='Small Thorium Veins in Western Plaguelands' WHERE  `entry`=1263;
UPDATE `pool_template` SET `description`='Copper Veins in Westfall' WHERE  `entry`=1111;
UPDATE `pool_template` SET `description`='Small Thorium Veins in Winterspring' WHERE  `entry`=1233;
UPDATE `pool_template` SET `description`='Silver Veins in Wetlands' WHERE  `entry`=1159;
UPDATE `pool_template` SET `description`='Tin Veins in Duskwood' WHERE  `entry`=1120;
UPDATE `pool_template` SET `description`='Gold Veins in Western Plaguelands' WHERE  `entry`=1331;
UPDATE `pool_template` SET `description`='Rich Thorium Veins in Eastern Plaguelands' WHERE  `entry`=1274;
UPDATE `pool_template` SET `description`='Tin Veins in Loch Modan' WHERE  `entry`=1167;
UPDATE `pool_template` SET `description`='Tin Veins in Darkshore' WHERE  `entry`=1099;
UPDATE `pool_template` SET `description`='Gold Veins in Stonetalon' WHERE  `entry`=1093;
UPDATE `pool_template` SET `description`='Tin Veins in Desolace' WHERE  `entry`=1140;
UPDATE `pool_template` SET `description`='Tin Veins in Thousand Needles' WHERE  `entry`=1131;
UPDATE `pool_template` SET `description`='Gold Veins in Duskwood' WHERE  `entry`=1121;
UPDATE `pool_template` SET `description`='Small Thorium Veins in Searing Gorge' WHERE  `entry`=1295;
UPDATE `pool_template` SET `description`='Small Thorium Veins in Eastern Plaguelands' WHERE  `entry`=1273;
UPDATE `pool_template` SET `description`='Gold Veins in Swamp of Sorrows' WHERE  `entry`=1332;
UPDATE `pool_template` SET `description`='Truesilver Veins in Ungoro Crater' WHERE  `entry`=1213;
UPDATE `pool_template` SET `description`='Small Thorium Veins in Azshara' WHERE  `entry`=1245;
UPDATE `pool_template` SET `description`='Small Thorium Veins in Hinterlands' WHERE  `entry`=1257;
UPDATE `pool_template` SET `description`='Gold Veins in Burning Steppes' WHERE  `entry`=1333;
UPDATE `pool_template` SET `description`='Silver Veins in Barrens' WHERE  `entry`=1035;
UPDATE `pool_template` SET `description`='Copper Veins in Desolace' WHERE  `entry`=1139;
UPDATE `pool_template` SET `description`='Mithril Deposits in Ungoro Crater' WHERE  `entry`=299;
UPDATE `pool_template` SET `description`='Truesilver Deposits in Feralas' WHERE  `entry`=1197;
UPDATE `pool_template` SET `description`='Iron Deposits in Searing Gorge' WHERE  `entry`=1292;
UPDATE `pool_template` SET `description`='Truesilver Deposits in Silithus' WHERE  `entry`=1219;
UPDATE `pool_template` SET `description`='Truesilver Deposits in Winterspring' WHERE  `entry`=1234;
UPDATE `pool_template` SET `description`='Truesilver Deposits in Desolace' WHERE  `entry`=1147;
UPDATE `pool_template` SET `description`='Truesilver Deposits in Azshara' WHERE  `entry`=1244;
UPDATE `pool_template` SET `description`='Truesilver Deposits in Ungoro Crater' WHERE  `entry`=1210;
UPDATE `pool_template` SET `description`='Truesilver Deposits in Stranglethorn' WHERE  `entry`=1178;
UPDATE `pool_template` SET `description`='Truesilver Deposits in Western Plaguelands' WHERE  `entry`=1262;
UPDATE `pool_template` SET `description`='Iron Deposits in Swamp of Sorrows (1)' WHERE  `entry`=1318;
UPDATE `pool_template` SET `description`='Iron Deposits in Duskwood' WHERE  `entry`=1118;
UPDATE `pool_template` SET `description`='Truesilver Deposits in Eastern Plaguelands' WHERE  `entry`=1272;
UPDATE `pool_template` SET `description`='Truesilver Deposits in Felwood' WHERE  `entry`=1231;
UPDATE `pool_template` SET `description`='Truesilver Deposits in Burning Steppes' WHERE  `entry`=1297;
UPDATE `pool_template` SET `description`='Iron Deposits in Wetlands' WHERE  `entry`=1158;
UPDATE `pool_template` SET `description`='Ooze Covered Mithril Deposits in Feralas' WHERE  `entry`=1198;
UPDATE `pool_template` SET `description`='Mithril Deposits in Feralas' WHERE  `entry`=1195;
UPDATE `pool_template` SET `description`='Truesilver Deposits in Hinterlands' WHERE  `entry`=1256;
UPDATE `pool_template` SET `description`='Mithril Deposits in Western Plaguelands' WHERE  `entry`=1271;
UPDATE `pool_template` SET `description`='Truesilver Deposits in Blasted Lands' WHERE  `entry`=1278;
UPDATE `pool_template` SET `description`='Mithril Deposits in Burning Steppes' WHERE  `entry`=1296;
UPDATE `pool_template` SET `description`='Truesilver Deposits in Tanaris' WHERE  `entry`=1202;
UPDATE `pool_template` SET `description`='Mithril Deposits in Swamp of Sorrows' WHERE  `entry`=1315;
UPDATE `pool_template` SET `description`='Mithril Deposits in Winterspring' WHERE  `entry`=1330;
UPDATE `pool_template` SET `description`='Truesilver Deposits in Badlands' WHERE  `entry`=1290;
UPDATE `pool_template` SET `description`='Iron Deposits in Stonetalon' WHERE  `entry`=1091;
UPDATE `pool_template` SET `description`='Mithril Deposits in Azshara' WHERE  `entry`=1329;
UPDATE `pool_template` SET `description`='Mithril Deposits in Stranglethorn' WHERE  `entry`=1177;
UPDATE `pool_template` SET `description`='Iron Deposits in Feralas' WHERE  `entry`=1196;
UPDATE `pool_template` SET `description`='Mithril Deposits in Hinterlands' WHERE  `entry`=1255;
UPDATE `pool_template` SET `description`='Truesilver Deposits in Searing Gorge' WHERE  `entry`=1294;
UPDATE `pool_template` SET `description`='Mithril Deposits in Searing Gorge' WHERE  `entry`=1293;
UPDATE `pool_template` SET `description`='Iron Deposits in Swamp of Sorrows (2)' WHERE  `entry`=1314;
UPDATE `pool_template` SET `description`='Iron Deposits in Stranglethorn' WHERE  `entry`=1175;
UPDATE `pool_template` SET `description`='Mithril Deposits in Badlands' WHERE  `entry`=1289;
UPDATE `pool_template` SET `description`='Iron Deposits in Tanaris' WHERE  `entry`=1200;
UPDATE `pool_template` SET `description`='Mithril Deposits in Blasted Lands' WHERE  `entry`=1279;
UPDATE `pool_template` SET `description`='Mithril Deposits in Desolace' WHERE  `entry`=1146;
UPDATE `pool_template` SET `description`='Mithril Deposits in Tanaris' WHERE  `entry`=1203;
UPDATE `pool_template` SET `description`='Iron Deposits in Ashenvale' WHERE  `entry`=1079;
UPDATE `pool_template` SET `description`='Iron Deposits in Badlands' WHERE  `entry`=1287;
UPDATE `pool_template` SET `description`='Iron Deposits in Desolace' WHERE  `entry`=1141;
UPDATE `pool_template` SET `description`='Iron Deposits in Thousand Needles' WHERE  `entry`=1132;

UPDATE `pool_template` SET `max_limit`=2 WHERE  `entry`=412;
UPDATE `pool_template` SET `max_limit`=2 WHERE  `entry`=397;
UPDATE `pool_template` SET `max_limit`=4 WHERE  `entry`=335;
UPDATE `pool_template` SET `max_limit`=3 WHERE  `entry`=399;
UPDATE `pool_template` SET `max_limit`=2 WHERE  `entry`=401;
UPDATE `pool_template` SET `max_limit`=7 WHERE  `entry`=329;
UPDATE `pool_template` SET `max_limit`=2 WHERE  `entry`=405;
UPDATE `pool_template` SET `max_limit`=5 WHERE  `entry`=1139;
UPDATE `pool_template` SET `max_limit`=4 WHERE  `entry`=1353;
UPDATE `pool_template` SET `max_limit`=5 WHERE  `entry`=1348;
UPDATE `pool_template` SET `max_limit`=4 WHERE  `entry`=1351;
UPDATE `pool_template` SET `max_limit`=2 WHERE  `entry`=1359;
UPDATE `pool_template` SET `max_limit`=2 WHERE  `entry`=1333;
UPDATE `pool_template` SET `max_limit`=2 WHERE  `entry`=1358;
UPDATE `pool_template` SET `max_limit`=5 WHERE  `entry`=1350;
UPDATE `pool_template` SET `max_limit`=3 WHERE  `entry`=1346;
UPDATE `pool_template` SET `max_limit`=2 WHERE  `entry`=1264;
UPDATE `pool_template` SET `max_limit`=6 WHERE  `entry`=1332;
UPDATE `pool_template` SET `max_limit`=6 WHERE  `entry`=1257;
UPDATE `pool_template` SET `max_limit`=6 WHERE  `entry`=1213;
UPDATE `pool_template` SET `max_limit`=11 WHERE  `entry`=1273;
UPDATE `pool_template` SET `max_limit`=6 WHERE  `entry`=1295;
UPDATE `pool_template` SET `max_limit`=7 WHERE  `entry`=1093;
UPDATE `pool_template` SET `max_limit`=12 WHERE  `entry`=1187;
UPDATE `pool_template` SET `max_limit`=10 WHERE  `entry`=1140;
UPDATE `pool_template` SET `max_limit`=20 WHERE  `entry`=1131;
UPDATE `pool_template` SET `max_limit`=12 WHERE  `entry`=1066;
UPDATE `pool_template` SET `max_limit`=10 WHERE  `entry`=1331;
UPDATE `pool_template` SET `max_limit`=18 WHERE  `entry`=1274;
UPDATE `pool_template` SET `max_limit`=13 WHERE  `entry`=1099;
UPDATE `pool_template` SET `max_limit`=13 WHERE  `entry`=1167;
UPDATE `pool_template` SET `max_limit`=5 WHERE  `entry`=1159;
UPDATE `pool_template` SET `max_limit`=14 WHERE  `entry`=1233;
UPDATE `pool_template` SET `max_limit`=17 WHERE  `entry`=1120;
UPDATE `pool_template` SET `max_limit`=39 WHERE  `entry`=1111;
UPDATE `pool_template` SET `max_limit`=5 WHERE  `entry`=1288;
UPDATE `pool_template` SET `max_limit`=11 WHERE  `entry`=1217;
UPDATE `pool_template` SET `max_limit`=6 WHERE  `entry`=1092;
UPDATE `pool_template` SET `max_limit`=20 WHERE  `entry`=1232;
UPDATE `pool_template` SET `max_limit`=15 WHERE  `entry`=1263;
UPDATE `pool_template` SET `max_limit`=20 WHERE  `entry`=1135;
UPDATE `pool_template` SET `max_limit`=30 WHERE  `entry`=1067;
UPDATE `pool_template` SET `max_limit`=19 WHERE  `entry`=1112;
UPDATE `pool_template` SET `max_limit`=17 WHERE  `entry`=1119;
UPDATE `pool_template` SET `max_limit`=10 WHERE  `entry`=37000;
UPDATE `pool_template` SET `max_limit`=20 WHERE  `entry`=1280;
UPDATE `pool_template` SET `max_limit`=14 WHERE  `entry`=1074;
UPDATE `pool_template` SET `max_limit`=20 WHERE  `entry`=1156;
UPDATE `pool_template` SET `max_limit`=11 WHERE  `entry`=1246;
UPDATE `pool_template` SET `max_limit`=22 WHERE  `entry`=1080;
UPDATE `pool_template` SET `max_limit`=24 WHERE  `entry`=1129;
UPDATE `pool_template` SET `max_limit`=25 WHERE  `entry`=1176;
UPDATE `pool_template` SET `max_limit`=25 WHERE  `entry`=1235;
UPDATE `pool_template` SET `max_limit`=27 WHERE  `entry`=1298;
UPDATE `pool_template` SET `max_limit`=21 WHERE  `entry`=1211;
UPDATE `pool_template` SET `max_limit`=21 WHERE  `entry`=1299;
UPDATE `pool_template` SET `max_limit`=21 WHERE  `entry`=1220;
UPDATE `pool_template` SET `max_limit`=46 WHERE  `entry`=1008;
UPDATE `pool_template` SET `max_limit`=31 WHERE  `entry`=1201;
UPDATE `pool_template` SET `max_limit`=18 WHERE  `entry`=1045;
UPDATE `pool_template` SET `max_limit`=19 WHERE  `entry`=1090;
UPDATE `pool_template` SET `max_limit`=26 WHERE  `entry`=1130;
UPDATE `pool_template` SET `max_limit`=29 WHERE  `entry`=1128;
UPDATE `pool_template` SET `max_limit`=30 WHERE  `entry`=1157;
UPDATE `pool_template` SET `max_limit`=45 WHERE  `entry`=1034;
UPDATE `pool_template` SET `max_limit`=44 WHERE  `entry`=1028;
UPDATE `pool_template` SET `max_limit`=26 WHERE  `entry`=1075;
UPDATE `pool_template` SET `max_limit`=28 WHERE  `entry`=1204;
UPDATE `pool_template` SET `max_limit`=55 WHERE  `entry`=1019;
UPDATE `pool_template` SET `max_limit`=30 WHERE  `entry`=1089;
UPDATE `pool_template` SET `max_limit`=47 WHERE  `entry`=1166;
UPDATE `pool_template` SET `max_limit`=51 WHERE  `entry`=1098;
UPDATE `pool_template` SET `max_limit`=54 WHERE  `entry`=1015;
UPDATE `pool_template` SET `max_limit`=73 WHERE  `entry`=1024;
UPDATE `pool_template` SET `max_limit`=47 WHERE  `entry`=1044;
UPDATE `pool_template` SET `max_limit`=108 WHERE  `entry`=1033;
UPDATE `pool_template` SET `max_limit`=2 WHERE  `entry`=332;
UPDATE `pool_template` SET `max_limit`=2 WHERE  `entry`=398;
UPDATE `pool_template` SET `max_limit`=7 WHERE  `entry`=322;
UPDATE `pool_template` SET `max_limit`=3 WHERE  `entry`=325;
UPDATE `pool_template` SET `max_limit`=2 WHERE  `entry`=324;
UPDATE `pool_template` SET `max_limit`=2 WHERE  `entry`=323;
UPDATE `pool_template` SET `max_limit`=16 WHERE  `entry`=298;
UPDATE `pool_template` SET `max_limit`=10 WHERE  `entry`=279;
UPDATE `pool_template` SET `max_limit`=4 WHERE  `entry`=328;
UPDATE `pool_template` SET `max_limit`=5 WHERE  `entry`=304;
UPDATE `pool_template` SET `max_limit`=3 WHERE  `entry`=408;
UPDATE `pool_template` SET `max_limit`=3 WHERE  `entry`=1292;
UPDATE `pool_template` SET `max_limit`=5 WHERE  `entry`=1234;
UPDATE `pool_template` SET `max_limit`=6 WHERE  `entry`=1147;
UPDATE `pool_template` SET `max_limit`=3 WHERE  `entry`=1316;
UPDATE `pool_template` SET `max_limit`=6 WHERE  `entry`=1244;
UPDATE `pool_template` SET `max_limit`=1 WHERE  `entry`=1210;
UPDATE `pool_template` SET `max_limit`=6 WHERE  `entry`=1178;
UPDATE `pool_template` SET `max_limit`=8 WHERE  `entry`=1262;
UPDATE `pool_template` SET `max_limit`=6 WHERE  `entry`=1318;
UPDATE `pool_template` SET `max_limit`=36 WHERE  `entry`=1338;
UPDATE `pool_template` SET `max_limit`=11 WHERE  `entry`=43520;
UPDATE `pool_template` SET `max_limit`=9 WHERE  `entry`=1118;
UPDATE `pool_template` SET `max_limit`=10 WHERE  `entry`=1272;
UPDATE `pool_template` SET `max_limit`=9 WHERE  `entry`=1231;
UPDATE `pool_template` SET `max_limit`=64 WHERE  `entry`=1297;
UPDATE `pool_template` SET `max_limit`=39 WHERE  `entry`=1337;
UPDATE `pool_template` SET `max_limit`=9 WHERE  `entry`=1158;
UPDATE `pool_template` SET `max_limit`=8 WHERE  `entry`=1198;
UPDATE `pool_template` SET `max_limit`=10 WHERE  `entry`=1195;
UPDATE `pool_template` SET `max_limit`=19 WHERE  `entry`=1256;
UPDATE `pool_template` SET `max_limit`=11 WHERE  `entry`=1271;
UPDATE `pool_template` SET `max_limit`=9 WHERE  `entry`=1278;
UPDATE `pool_template` SET `max_limit`=12 WHERE  `entry`=1296;
UPDATE `pool_template` SET `max_limit`=12 WHERE  `entry`=1202;
UPDATE `pool_template` SET `max_limit`=9 WHERE  `entry`=1315;
UPDATE `pool_template` SET `max_limit`=13 WHERE  `entry`=1330;
UPDATE `pool_template` SET `max_limit`=12 WHERE  `entry`=25622;
UPDATE `pool_template` SET `max_limit`=5 WHERE  `entry`=299;
UPDATE `pool_template` SET `max_limit`=14 WHERE  `entry`=1290;
UPDATE `pool_template` SET `max_limit`=11 WHERE  `entry`=1091;
UPDATE `pool_template` SET `max_limit`=14 WHERE  `entry`=1329;
UPDATE `pool_template` SET `max_limit`=9 WHERE  `entry`=1177;
UPDATE `pool_template` SET `max_limit`=16 WHERE  `entry`=1196;
UPDATE `pool_template` SET `max_limit`=24 WHERE  `entry`=1255;
UPDATE `pool_template` SET `max_limit`=23 WHERE  `entry`=1294;
UPDATE `pool_template` SET `max_limit`=18 WHERE  `entry`=1293;
UPDATE `pool_template` SET `max_limit`=19 WHERE  `entry`=1314;
UPDATE `pool_template` SET `max_limit`=19 WHERE  `entry`=25609;
UPDATE `pool_template` SET `max_limit`=18 WHERE  `entry`=1070;
UPDATE `pool_template` SET `max_limit`=25 WHERE  `entry`=1175;
UPDATE `pool_template` SET `max_limit`=22 WHERE  `entry`=1289;
UPDATE `pool_template` SET `max_limit`=25 WHERE  `entry`=1200;
UPDATE `pool_template` SET `max_limit`=20 WHERE  `entry`=1279;
UPDATE `pool_template` SET `max_limit`=15 WHERE  `entry`=1069;
UPDATE `pool_template` SET `max_limit`=25 WHERE  `entry`=1146;
UPDATE `pool_template` SET `max_limit`=23 WHERE  `entry`=1203;
UPDATE `pool_template` SET `max_limit`=33 WHERE  `entry`=1079;
UPDATE `pool_template` SET `max_limit`=30 WHERE  `entry`=1188;
UPDATE `pool_template` SET `max_limit`=45 WHERE  `entry`=1068;
UPDATE `pool_template` SET `max_limit`=47 WHERE  `entry`=1287;
UPDATE `pool_template` SET `max_limit`=51 WHERE  `entry`=1141;
UPDATE `pool_template` SET `max_limit`=60 WHERE  `entry`=1132;
UPDATE `pool_template` SET `max_limit`=104 WHERE  `entry`=1186;

UPDATE `pool_gameobject` SET `description`='Mithril Deposit' WHERE  `guid` IN (56059, 55949);
UPDATE `pool_gameobject` SET `description`='Ooze Covered Rich Thorium Vein' WHERE  `guid` IN (
3996175,
50348,
49449,
49448,
49447,
49446,
49445,
49444,
49443,
49442,
49441,
49440,
49439,
49438,
49437,
49436,
49435);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
