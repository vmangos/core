DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230708185644');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230708185644');
-- Add your query below.


-- Missing Mossy Footlocker spawns in The Temple of Atal'Hakkar.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(30635, 179493, 0, -10402.1, -3941.69, -19.5574, 1.0472, 0, 0, 0.5, 0.866025, 300, 300, 1, 100, 1, 10); -- Closest existing guid is 30580 at 38.354729 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(30635, 456, 0, 'Mossy Footlocker', 1, 10); -- Mossy Footlockers in Sunken Temple

-- Missing Dented Footlocker spawns in Tanaris.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(17482, 179496, 1, -8083.73, -5253.23, 0.680218, 5.11382, 0, 0, -0.551936, 0.833886, 300, 300, 1, 100, 1, 10); -- Closest existing guid is 17315 at 15.613722 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(17482, 415, 0, 'Dented Footlocker', 1, 10); -- Dented Footlockers in Tanaris

-- Missing Alliance Chest spawns in Hillsbrad Foothills.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(29665, 4096, 0, -871.026, 217.223, 8.80425, 2.28638, 0, 0, 0.909961, 0.414694, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 29650 at 162.522659 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(29665, 70, 0, 'Alliance Chest', 0, 10); -- Alliance Chests in Hillsbrad Foothills

-- Missing Alliance Chest spawns in Silverpine Forest.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(35619, 111095, 0, -151.1, 799.07, 63.9039, 1.97222, 0, 0, 0.833885, 0.551938, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 35489 at 25.744791 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(35619, 67, 0, 'Alliance Chest', 0, 10); -- Alliance Chests in Silverpine Forest

-- Missing Battered Chest spawns in The Barrens.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(13195, 2849, 1, 1333.15, -3657.51, 92.0099, 3.54302, 0, 0, -0.979924, 0.19937, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 13074 at 77.541336 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(13195, 33, 0, 'Battered Chest', 0, 10); -- Battered Chests in The Barrens

-- Missing Battered Chest spawns in Redridge Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(20818, 2849, 0, -9799.3, -2215.58, 58.6601, 5.63741, 0, 0, -0.317305, 0.948324, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 20798 at 40.590511 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(20818, 34, 0, 'Battered Chest', 0, 10); -- Battered Chests in Redridge Mountains

-- Missing Battered Chest spawns in Darkshore.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(48552, 2849, 1, 4201.29, 1293.38, 3.48289, 3.12412, 0, 0, 0.999962, 0.00873464, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 48533 at 756.130005 yards.
(48560, 2849, 1, 4201.29, 1293.38, 3.48289, 3.12412, 0, 0, 0.999962, 0.00873464, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 48533 at 756.130005 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(48552, 40, 0, 'Battered Chest', 0, 10), -- Battered Chests in Darkshore
(48560, 40, 0, 'Battered Chest', 0, 10); -- Battered Chests in Darkshore

-- Missing Cortello\'s Riddle spawns in Stranglethorn Vale.
UPDATE `pool_gameobject` SET `pool_entry` = 402 WHERE `guid` = 66836;
DELETE FROM `gameobject` WHERE `guid` = 55174;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(26053, 2554, 0, -14923.2, 126.022, 8.21919, 6.14356, 0, 0, -0.0697556, 0.997564, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 26046 at 36.987926 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(26053, 398, 0, 'Cortello\'s Riddle', 0, 10); -- Stranglethorn Vale - Ship 3 - Cortello's Riddle

-- Missing Half-Buried Bottle spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(26159, 2560, 0, -14274.1, 12.3585, 0.687387, 1.13446, 0, 0, 0.537299, 0.843392, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 26081 at 29.827625 yards.
(26160, 2560, 0, -14504.6, -102.795, -0.330474, 2.61799, 0, 0, 0.965925, 0.258821, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 26075 at 28.300808 yards.
(11967, 2560, 0, -14616.5, -88.2083, 0.587145, 4.46804, 0, 0, -0.788011, 0.615662, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 11705 at 24.817171 yards.
(11973, 2560, 0, -14555, -86.4878, 0.379937, 2.25147, 0, 0, 0.902585, 0.430512, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 11705 at 37.205421 yards.
(12191, 2560, 0, -14456.3, 37.463, 0.395053, 5.74214, 0, 0, -0.267238, 0.963631, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12051 at 27.281712 yards.
(26161, 2560, 0, -14274.1, 12.3585, 0.687387, 1.13446, 0, 0, 0.537299, 0.843392, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 26081 at 29.827625 yards.
(11147, 2560, 0, -14193.2, -78.2309, 0.308181, 5.18363, 0, 0, -0.522498, 0.85264, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 11032 at 27.042591 yards.

-- Missing Giant Clam spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(48123, 19018, 0, -2758.24, -951.861, -13.6005, 3.90954, 0, 0, -0.927183, 0.374608, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 48020 at 120.130379 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(48123, 1340, 0, 'Giant Clam', 0, 10); -- Wetlands - Giant Clam

-- Missing Sack of Oats spawns in Westfall.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(55299, 2724, 0, -11140.9, 1045.63, 34.3394, 4.36332, 0, 0, -0.819152, 0.573577, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 55206 at 99.889412 yards.

-- Missing Sapphire of Aku'Mai spawns in Blackfathom Deeps.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(47896, 178185, 1, 4222.6, 786.904, -16.1785, 0.314158, 0, 0, 0.156434, 0.987688, 180, 180, 1, 100, 0, 10); -- Closest existing guid is 47706 at 42.386314 yards.

-- Missing Sapphire of Aku'Mai spawns in Blackfathom Deeps.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(55191, 178186, 1, 4251.33, 804.095, -8.22898, 2.32129, 0, 0, 0.91706, 0.39875, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 55100 at 64.850845 yards.

-- Missing Solid Chest spawns in Redridge Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(20839, 2850, 0, -9444.99, -3073.69, 136.687, 0.0698117, 0, 0, 0.0348988, 0.999391, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20823 at 75.265877 yards.
(20840, 2850, 0, -9278.63, -3312.23, 125.985, 2.58308, 0, 0, 0.961261, 0.27564, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 20805 at 61.230640 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(20839, 5, 0, 'Solid Chest', 0, 10), -- Solid Chests in Redridge Mountains
(20840, 5, 0, 'Solid Chest', 0, 10); -- Solid Chests in Redridge Mountains

-- Missing Solid Chest spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(14984, 2852, 0, -2882.22, -2947.11, 33.7046, 5.41052, 0, 0, -0.422618, 0.906308, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 14960 at 64.838104 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(14984, 20, 0, 'Solid Chest', 0, 10); -- Solid Chests in Wetlands

-- Missing Solid Chest spawns in Thousand Needles.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(16731, 2852, 1, -5585.58, -1629.46, 16.2051, 2.35619, 0, 0, 0.92388, 0.382683, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 16715 at 43.485207 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(16731, 22, 0, 'Solid Chest', 0, 10); -- Solid Chests in Thousand Needles

-- Missing Solid Chest spawns in Desolace.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(30266, 2855, 1, -1054.44, 1008.37, 90.526, 1.5708, 0, 0, 0.707107, 0.707107, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 30169 at 134.438736 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(30266, 46, 0, 'Solid Chest', 0, 10); -- Solid Chests in Desolace

-- Missing Solid Chest spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(11692, 2857, 0, -11508.4, 737.012, 61.4116, 3.76991, 0, 0, -0.951056, 0.309017, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 11691 at 151.648544 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(11692, 51, 0, 'Solid Chest', 0, 10); -- Solid Chests in Stranglethorn Vale

-- Missing Solid Chest spawns in Alterac Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(33194, 2857, 0, 936.042, -850.617, 114.649, 1.22173, 0, 0, 0.573576, 0.819152, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 33193 at 82.356110 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(33194, 55, 0, 'Solid Chest', 0, 10); -- Solid Chests in Alterac Mountains

-- Missing Solid Chest spawns in Badlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(11645, 4149, 0, -7387.19, -2237.2, 233.927, 3.85718, 0, 0, -0.936671, 0.35021, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 11479 at 95.020706 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(11645, 26, 0, 'Solid Chest', 0, 10); -- Solid Chests in Badlands

-- Missing Solid Chest spawns in Dustwallow Marsh.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(56050, 4149, 1, -4374.53, -3330.37, 34.8726, 0.139624, 0, 0, 0.0697556, 0.997564, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 56049 at 51.929543 yards.
(14624, 4149, 1, -4269.59, -3892.14, -6.99016, 2.42601, 0, 0, 0.936672, 0.350207, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 14620 at 32.004475 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(56050, 29, 0, 'Solid Chest', 0, 10), -- Solid Chests in Dustwallow Marsh
(14624, 29, 0, 'Solid Chest', 0, 10); -- Solid Chests in Dustwallow Marsh

-- Missing Solid Chest spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(11690, 4149, 0, -14595.4, -244.479, 24.9781, 3.45576, 0, 0, -0.987688, 0.156436, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 11676 at 85.721550 yards.
(11664, 4149, 0, -14978.5, 342.927, 0.260496, 0.296705, 0, 0, 0.147809, 0.989016, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 11663 at 80.805199 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(11690, 27, 0, 'Solid Chest', 0, 10), -- Solid Chests in Stranglethorn Vale
(11664, 27, 0, 'Solid Chest', 0, 10); -- Solid Chests in Stranglethorn Vale

-- Missing Solid Chest spawns in The Hinterlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(46367, 4149, 0, -43.0638, -2478.95, 119.087, 2.25147, 0, 0, 0.902585, 0.430512, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 46316 at 218.789490 yards.
(46368, 4149, 0, -43.0638, -2478.95, 119.087, 2.25147, 0, 0, 0.902585, 0.430512, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 46316 at 218.789490 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(46367, 31, 0, 'Solid Chest', 0, 10), -- Solid Chests in The Hinterlands
(46368, 31, 0, 'Solid Chest', 0, 10); -- Solid Chests in The Hinterlands

-- Missing Solid Chest spawns in Azshara.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(48497, 153453, 1, 4322.74, -5726.07, 100.923, 1.71042, 0, 0, 0.754709, 0.656059, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 48494 at 240.063904 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(48497, 19, 0, 'Solid Chest', 0, 10); -- Solid Chests in Azshara

-- Missing Silverleaf spawns in Elwynn Forest.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(26782, 1617, 0, -9218.83, 96.9757, 74.9729, 0.925024, 0, 0, 0.446198, 0.894935, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 26769 at 0.000397 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(26782, 1013, 0, 'Silverleaf', 0, 10); -- Silverleaf in Elwynn Forest

UPDATE `gameobject` SET `spawntimesecsmax` = 604800, `spawntimesecsmin` = 604800 WHERE `id` = 75293;
UPDATE `gameobject` SET `spawntimesecsmax` = 300, `spawntimesecsmin` = 300 WHERE `id` = 178185;
UPDATE `gameobject` SET `spawntimesecsmax` = 300, `spawntimesecsmin` = 300 WHERE `id` = 142144 AND `map` = 0;
UPDATE `gameobject` SET `spawntimesecsmax` = 180, `spawntimesecsmin` = 180 WHERE `id` = 175928;
UPDATE `gameobject` SET `spawntimesecsmax` = 180, `spawntimesecsmin` = 180 WHERE `id` = 141853;
UPDATE `gameobject` SET `spawntimesecsmax` = 300, `spawntimesecsmin` = 300 WHERE `id` = 176638 AND `map` = 1;

DELETE FROM `gameobject` WHERE `guid` IN ( 55099, 55100, 55101, 55102, 361752);

-- Correct position of Dark Iron Pillow in Searing Gorge (position is off by 2.52587 yards).
UPDATE `gameobject` SET `position_x`=-6555.04, `position_y`=-1351.12, `position_z`=210.26, `orientation`=2.26893, `rotation0`=0, `rotation1`=0, `rotation2`=0.906307, `rotation3`=0.422619 WHERE `guid`=66099;

-- Correct position of Dark Iron Pillow in Searing Gorge (position is off by 4.3279 yards).
UPDATE `gameobject` SET `position_x`=-6550.69, `position_y`=-1322.46, `position_z`=212.376, `orientation`=1.309, `rotation0`=0, `rotation1`=0, `rotation2`=0.608761, `rotation3`=0.793354 WHERE `guid`=66096;

-- Correct position of Dark Iron Pillow in Searing Gorge (position is off by 4.56912 yards).
UPDATE `gameobject` SET `position_x`=-6514.41, `position_y`=-1365.62, `position_z`=210.763, `orientation`=0.680677, `rotation0`=0, `rotation1`=0, `rotation2`=0.333806, `rotation3`=0.942642 WHERE `guid`=66109;

-- Correct position of Dark Iron Pillow in Searing Gorge (position is off by 4.56739 yards).
UPDATE `gameobject` SET `position_x`=-6575.96, `position_y`=-1323.58, `position_z`=210.152, `orientation`=4.29351, `rotation0`=0, `rotation1`=0, `rotation2`=-0.83867, `rotation3`=0.54464 WHERE `guid`=6995;

-- Correct position of Arena Treasure Chest in Stranglethorn Vale (position is off by 1.50537 yards).
UPDATE `gameobject` SET `position_x`=-13202.9, `position_y`=276.757, `position_z`=21.8571, `orientation`=2.77507, `rotation0`=0, `rotation1`=0, `rotation2`=0.983254, `rotation3`=0.182238 WHERE `guid`=12029;

SET @OGUID = 25431;

-- Misc Dungeon Objects
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 105570, 0, 389.558, 178.222, 41.9383, 3.26377, 0, 0, -0.998135, 0.0610518, 3600, 3600, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 3714, 1, -4113.86, -2302.24, 126.262, 5.61996, 0, 0, -0.325567, 0.945519, 3600, 3600, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 75296, 189, 1748.22, 1252.28, 18.1573, 5.70723, 0, 0, -0.284015, 0.95882, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 75296, 189, 1762.11, 1153.56, 7.49028, 4.72984, 0, 0, -0.700909, 0.713251, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 75296, 189, 1847.77, 1276.34, 18.1573, 2.80998, 0, 0, 0.986285, 0.16505, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 153469, 229, -161.149, -494.667, -18.4564, 5.65487, 0, 0, -0.309016, 0.951057, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 153469, 229, -20.2914, -361.811, 50.6356, 4.64258, 0, 0, -0.731354, 0.681998, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 153469, 229, 163.142, -241.759, 110.949, 4.2237, 0, 0, -0.857167, 0.515038, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 153469, 329, 3850.91, -3629.15, 146.895, 2.79252, 0, 0, 0.984807, 0.173652, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 173232, 230, 709.659, 57.0049, -44.1391, 2.74016, 0, 0, 0.979924, 0.19937, 600, 600, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 173232, 230, 860.409, 36.9705, -53.6437, 2.33874, 0, 0, 0.920505, 0.390732, 600, 600, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 173232, 230, 1107.97, -156.909, -74.3595, 2.54818, 0, 0, 0.956305, 0.292372, 600, 600, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 173234, 230, 686.841, -8.77618, -58.8389, 3.12412, 0, 0, 0.999962, 0.00873464, 600, 600, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 75293, 36, -300.887, -532.542, 49.4236, 0.226892, 0, 0, 0.113203, 0.993572, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 75293, 43, 46.7143, -166.269, -82.1537, 5.34071, 0, 0, -0.45399, 0.891007, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 75298, 48, -466.738, -87.5996, -39.1289, 2.93214, 0, 0, 0.994521, 0.104536, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 75299, 189, 1748.22, 1252.28, 18.1573, 5.70723, 0, 0, -0.284015, 0.95882, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 75299, 189, 1788.14, 1394.66, -0.455138, 2.63544, 0, 0, 0.968147, 0.250381, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 153464, 229, -84.2677, -350.104, 70.9524, 1.91986, 0, 0, 0.819152, 0.573577, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 153464, 229, 163.142, -241.759, 110.949, 4.2237, 0, 0, -0.857167, 0.515038, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 153464, 229, 171.163, -290.776, 110.942, 3.08918, 0, 0, 0.999657, 0.0262016, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 1733, 0, -8683.48, -2235.91, 155.424, 5.63741, 0, 0, -0.317305, 0.948324, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 1735, 1, -913.527, 1033.02, 96.0823, 0.925024, 0, 0, 0.446198, 0.894935, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 1732, 48, -479.657, 295.416, -64.3415, 4.88692, 0, 0, -0.642787, 0.766045, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 1735, 70, 70.1268, 443.334, -41.0286, 0.331611, 0, 0, 0.165047, 0.986286, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 324, 229, -201.751, -306.885, 68.5368, 0, 0, 0, 0, 1, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 180215, 309, -12145.4, -1941.74, 134.893, 1.8675, 0, 0, 0.803857, 0.594823, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 1734, 349, 141.178, -391.741, -175.001, 4.7822, 0, 0, -0.681998, 0.731354, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+29, 2040, 349, 289.052, 50.4382, -131.01, 4.62512, 0, 0, -0.737277, 0.675591, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+30, 2040, 349, 291.651, -49.0027, -130.93, 1.5708, 0, 0, 0.707107, 0.707107, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+31, 2040, 349, 596.232, -209.992, -64.0246, 1.11701, 0, 0, 0.529919, 0.848048, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+32, 2040, 349, 1045.67, -312.662, -38.0973, 0.436332, 0, 0, 0.216439, 0.976296, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+33, 75295, 34, 90.5921, -145.882, -33.9396, 1.44862, 0, 0, 0.66262, 0.748956, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+34, 75295, 34, 92.3032, -56.1773, -34.8562, 6.07375, 0, 0, -0.104528, 0.994522, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+35, 75295, 34, 146.967, -121.079, -33.9396, 3.50812, 0, 0, -0.983254, 0.182238, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+36, 75295, 34, 151.69, -65.131, -34.8562, 5.09636, 0, 0, -0.559193, 0.829038, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+37, 75298, 34, 104.455, 77.2554, -34.8562, 5.91667, 0, 0, -0.182235, 0.983255, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+38, 75298, 34, 165.322, 57.6663, -34.8562, 2.91469, 0, 0, 0.993571, 0.113208, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+39, 75298, 34, 173.185, 146.955, -33.9396, 4.2237, 0, 0, -0.857167, 0.515038, 604800, 604800, 100, 1, 0, 0, 0, 10);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
