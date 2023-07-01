DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230701111928');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230701111928');
-- Add your query below.


-- Create new pool to hold Solid Chest spawns in Badlands.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(26, 1, 'Solid Chests in Badlands', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(11479, 26, 0, 'Solid Chest', 0, 10);

-- Create new pool to hold Solid Chest spawns in Swamp of Sorrows.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(28, 5, 'Solid Chests in Swamp of Sorrows', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(13978, 28, 0, 'Solid Chest', 0, 10),
(13979, 28, 0, 'Solid Chest', 0, 10),
(31044, 28, 0, 'Solid Chest', 0, 10),
(31045, 28, 0, 'Solid Chest', 0, 10);

-- Create new pool to hold Solid Chest spawns in Dustwallow Marsh.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(29, 5, 'Solid Chests in Dustwallow Marsh', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(14619, 29, 0, 'Solid Chest', 0, 10),
(14931, 29, 0, 'Solid Chest', 0, 10),
(40758, 29, 0, 'Solid Chest', 0, 10),
(40772, 29, 0, 'Solid Chest', 0, 10),
(40796, 29, 0, 'Solid Chest', 0, 10),
(55993, 29, 0, 'Solid Chest', 0, 10),
(56049, 29, 0, 'Solid Chest', 0, 10),
(56062, 29, 0, 'Solid Chest', 0, 10);

-- Create new pool to hold Solid Chest spawns in Stranglethorn Vale.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(27, 11, 'Solid Chests in Stranglethorn Vale', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(11651, 27, 0, 'Solid Chest', 0, 10),
(11676, 27, 0, 'Solid Chest', 0, 10),
(11693, 27, 0, 'Solid Chest', 0, 10),
(11695, 27, 0, 'Solid Chest', 0, 10),
(11704, 27, 0, 'Solid Chest', 0, 10),
(11806, 27, 0, 'Solid Chest', 0, 10),
(12157, 27, 0, 'Solid Chest', 0, 10),
(12185, 27, 0, 'Solid Chest', 0, 10),
(29256, 27, 0, 'Solid Chest', 0, 10);

-- Create new pool to hold Solid Chest spawns in The Hinterlands.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(31, 5, 'Solid Chests in The Hinterlands', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(46268, 31, 0, 'Solid Chest', 0, 10),
(46316, 31, 0, 'Solid Chest', 0, 10),
(46387, 31, 0, 'Solid Chest', 0, 10);

-- Create new pool to hold Solid Chest spawns in Searing Gorge.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(25, 5, 'Solid Chests in Searing Gorge', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(10031, 25, 0, 'Solid Chest', 0, 10),
(10093, 25, 0, 'Solid Chest', 0, 10),
(10157, 25, 0, 'Solid Chest', 0, 10),
(10163, 25, 0, 'Solid Chest', 0, 10),
(10204, 25, 0, 'Solid Chest', 0, 10);

-- Create new pool to hold Solid Chest spawns in Tanaris.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(30, 5, 'Solid Chests in Tanaris', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(17298, 30, 0, 'Solid Chest', 0, 10),
(17299, 30, 0, 'Solid Chest', 0, 10),
(17300, 30, 0, 'Solid Chest', 0, 10);

-- Correct position of Solid Chest in Dustwallow Marsh (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-4470.82, `position_y`=-2962.09, `position_z`=26.4969, `orientation`=5.37562, `rotation0`=0, `rotation1`=0, `rotation2`=-0.438371, `rotation3`=0.898794 WHERE `guid`=56062;

-- Missing Solid Chest spawns in Badlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(11515, 4149, 0, -7483.71, -2268.2, 233.716, 0.0698117, 0, 0, 0.0348988, 0.999391, 7200, 7200, 1, 100, 0, 10); -- Closest existing guid is 11479 at 67.058205 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(11515, 26, 0, 'Solid Chest', 0, 10); -- Solid Chests in Badlands

-- Missing Solid Chest spawns in Swamp of Sorrows.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(31048, 4149, 0, -10819.5, -4266.54, -4.39961, 2.05949, 0, 0, 0.857167, 0.515038, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 31044 at 172.105881 yards.
(31050, 4149, 0, -10550.7, -4400.34, 0.416397, 3.6652, 0, 0, -0.965925, 0.258821, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 31044 at 128.499298 yards.
(31057, 4149, 0, -10426.7, -4390.78, 5.12247, 0.890117, 0, 0, 0.430511, 0.902586, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 31045 at 31.234758 yards.
(13980, 4149, 0, -10874.4, -3681.49, 18.1765, 3.90954, 0, 0, -0.927183, 0.374608, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 13978 at 51.946568 yards.
(31090, 4149, 0, -10906.6, -4208.03, 1.01048, 0.802851, 0, 0, 0.390731, 0.920505, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 31044 at 276.054901 yards.
(31170, 4149, 0, -11054.1, -4122.13, 0.538078, 5.5676, 0, 0, -0.350207, 0.936672, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 31044 at 446.667755 yards.
(14020, 4149, 0, -10897.3, -3712.66, 8.76335, 2.86234, 0, 0, 0.990268, 0.139175, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 13978 at 88.446930 yards.
(14021, 4149, 0, -10862.7, -3631.31, 24.4419, 3.45576, 0, 0, -0.987688, 0.156436, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 13978 at 12.862801 yards.
(31185, 4149, 0, -10037.5, -4313.46, 0.254656, 4.4855, 0, 0, -0.782608, 0.622515, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 31045 at 369.641205 yards.
(14031, 4149, 0, -11101.2, -3831.97, 3.0087, 3.14159, 0, 0, -1, 0, 3600, 3600, 1, 100, 0, 10); -- Closest existing guid is 13978 at 311.801392 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(31048, 28, 0, 'Solid Chest', 0, 10), -- Solid Chests in Swamp of Sorrows
(31050, 28, 0, 'Solid Chest', 0, 10), -- Solid Chests in Swamp of Sorrows
(31057, 28, 0, 'Solid Chest', 0, 10), -- Solid Chests in Swamp of Sorrows
(13980, 28, 0, 'Solid Chest', 0, 10), -- Solid Chests in Swamp of Sorrows
(31090, 28, 0, 'Solid Chest', 0, 10), -- Solid Chests in Swamp of Sorrows
(31170, 28, 0, 'Solid Chest', 0, 10), -- Solid Chests in Swamp of Sorrows
(14020, 28, 0, 'Solid Chest', 0, 10), -- Solid Chests in Swamp of Sorrows
(14021, 28, 0, 'Solid Chest', 0, 10), -- Solid Chests in Swamp of Sorrows
(31185, 28, 0, 'Solid Chest', 0, 10), -- Solid Chests in Swamp of Sorrows
(14031, 28, 0, 'Solid Chest', 0, 10); -- Solid Chests in Swamp of Sorrows

-- Missing Solid Chest spawns in Dustwallow Marsh.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(14982, 4149, 1, -4606.16, -3779.07, 34.7463, 3.14159, 0, 0, -1, 0, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 14931 at 380.073334 yards.
(14620, 4149, 1, -4246.86, -3914.45, -10.1359, 4.93928, 0, 0, -0.622514, 0.782609, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 14619 at 32.957531 yards.
(14621, 4149, 1, -4232.95, -3921.11, -15.8423, 5.91667, 0, 0, -0.182235, 0.983255, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 14619 at 32.364059 yards.
(40797, 4149, 1, -4294.95, -3006.75, 34.6152, 1.29154, 0, 0, 0.601814, 0.798636, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 40796 at 117.173164 yards.
(55995, 4149, 1, -3651.22, -4063.5, -17.7203, 2.79252, 0, 0, 0.984807, 0.173652, 7200, 7200, 1, 100, 0, 10); -- Closest existing guid is 55993 at 21.194960 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(14982, 29, 0, 'Solid Chest', 0, 10), -- Solid Chests in Dustwallow Marsh
(14620, 29, 0, 'Solid Chest', 0, 10), -- Solid Chests in Dustwallow Marsh
(14621, 29, 0, 'Solid Chest', 0, 10), -- Solid Chests in Dustwallow Marsh
(40797, 29, 0, 'Solid Chest', 0, 10), -- Solid Chests in Dustwallow Marsh
(55995, 29, 0, 'Solid Chest', 0, 10); -- Solid Chests in Dustwallow Marsh

-- Missing Solid Chest spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(11824, 4149, 0, -13328, -26.3568, 21.8891, 1.88495, 0, 0, 0.809016, 0.587786, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 11806 at 49.458157 yards.
(11804, 4149, 0, -12991.2, -701.092, 54.6397, 4.69494, 0, 0, -0.71325, 0.70091, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 11704 at 121.940269 yards.
(11700, 4149, 0, -13062.8, -466.432, 44.7542, 1.5708, 0, 0, 0.707107, 0.707107, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 11695 at 210.011307 yards.
(11701, 4149, 0, -13180.3, -545.59, 4.64249, 3.29869, 0, 0, -0.996917, 0.0784664, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 11695 at 75.206451 yards.
(11688, 4149, 0, -14610.4, -363.52, 7.1323, 0.0523589, 0, 0, 0.0261765, 0.999657, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 11676 at 169.301086 yards.
(11661, 4149, 0, -14920.7, 68.7844, 0.245401, 1.5708, 0, 0, 0.707107, 0.707107, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 11651 at 21.039986 yards.
(12189, 4149, 0, -14126.5, 477.396, 1.27591, 3.94445, 0, 0, -0.920505, 0.390732, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 12185 at 318.077240 yards.
(12208, 4149, 0, -13876.5, 430.319, 92.1166, 5.16618, 0, 0, -0.529919, 0.848048, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 12185 at 57.820797 yards.
(29260, 4149, 0, -13664.5, -280.413, 8.12, 4.43314, 0, 0, -0.798635, 0.601815, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 29256 at 412.945679 yards.
(11703, 4149, 0, -13141.3, -471.359, 53.0697, 0.733038, 0, 0, 0.358368, 0.93358, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 11695 at 141.184753 yards.
(11968, 4149, 0, -12938.7, -636.273, 53.2873, 2.68781, 0, 0, 0.97437, 0.224951, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 11704 at 188.540222 yards.
(11662, 4149, 0, -14874.5, 304.62, 0.425162, 0.174532, 0, 0, 0.0871553, 0.996195, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 11651 at 219.450073 yards.
(11663, 4149, 0, -14977.5, 262.128, 0.234813, 1.53589, 0, 0, 0.694658, 0.71934, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 11651 at 181.950180 yards.
(11668, 4149, 0, -14855.5, 71.8133, 1.16342, 1.01229, 0, 0, 0.484809, 0.87462, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 11651 at 66.189995 yards.
(29272, 4149, 0, -13624.2, -323.034, 9.13148, 2.49582, 0, 0, 0.948323, 0.317306, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 29256 at 360.885315 yards.
(11689, 4149, 0, -14812.9, -373.351, 6.51484, 1.13446, 0, 0, 0.537299, 0.843392, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 11676 at 221.801590 yards.
(11986, 4149, 0, -12345.7, -1082.26, 5.56533, 2.60054, 0, 0, 0.96363, 0.267241, 3600, 3600, 1, 100, 0, 10); -- Closest existing guid is 11693 at 159.145309 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(11824, 27, 0, 'Solid Chest', 0, 10), -- Solid Chests in Stranglethorn Vale
(11804, 27, 0, 'Solid Chest', 0, 10), -- Solid Chests in Stranglethorn Vale
(11700, 27, 0, 'Solid Chest', 0, 10), -- Solid Chests in Stranglethorn Vale
(11701, 27, 0, 'Solid Chest', 0, 10), -- Solid Chests in Stranglethorn Vale
(11688, 27, 0, 'Solid Chest', 0, 10), -- Solid Chests in Stranglethorn Vale
(11661, 27, 0, 'Solid Chest', 0, 10), -- Solid Chests in Stranglethorn Vale
(12189, 27, 0, 'Solid Chest', 0, 10), -- Solid Chests in Stranglethorn Vale
(12208, 27, 0, 'Solid Chest', 0, 10), -- Solid Chests in Stranglethorn Vale
(29260, 27, 0, 'Solid Chest', 0, 10), -- Solid Chests in Stranglethorn Vale
(11703, 27, 0, 'Solid Chest', 0, 10), -- Solid Chests in Stranglethorn Vale
(11968, 27, 0, 'Solid Chest', 0, 10), -- Solid Chests in Stranglethorn Vale
(11662, 27, 0, 'Solid Chest', 0, 10), -- Solid Chests in Stranglethorn Vale
(11663, 27, 0, 'Solid Chest', 0, 10), -- Solid Chests in Stranglethorn Vale
(11668, 27, 0, 'Solid Chest', 0, 10), -- Solid Chests in Stranglethorn Vale
(29272, 27, 0, 'Solid Chest', 0, 10), -- Solid Chests in Stranglethorn Vale
(11689, 27, 0, 'Solid Chest', 0, 10), -- Solid Chests in Stranglethorn Vale
(11986, 27, 0, 'Solid Chest', 0, 10); -- Solid Chests in Stranglethorn Vale

-- Missing Solid Chest spawns in The Hinterlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(46397, 4149, 0, -305.712, -3402.4, 165.572, 6.16101, 0, 0, -0.0610485, 0.998135, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 46387 at 74.875694 yards.
(46320, 4149, 0, -477.565, -2814.38, 110.539, 3.4383, 0, 0, -0.989016, 0.147811, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 46316 at 348.093842 yards.
(46269, 4149, 0, -57.3702, -3162.79, 95.2744, 4.46804, 0, 0, -0.788011, 0.615662, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 46268 at 183.520065 yards.
(46350, 4149, 0, -41.2321, -2810.77, 122.291, 3.50812, 0, 0, -0.983254, 0.182238, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 46316 at 332.547119 yards.
(46359, 4149, 0, -268.738, -2792.09, 111.674, 1.16937, 0, 0, 0.551936, 0.833886, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 46316 at 241.396881 yards.
(46270, 4149, 0, -382.985, -3008.53, 109.563, 1.09956, 0, 0, 0.522498, 0.85264, 7200, 7200, 1, 100, 0, 10); -- Closest existing guid is 46268 at 187.699722 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(46397, 31, 0, 'Solid Chest', 0, 10), -- Solid Chests in The Hinterlands
(46320, 31, 0, 'Solid Chest', 0, 10), -- Solid Chests in The Hinterlands
(46269, 31, 0, 'Solid Chest', 0, 10), -- Solid Chests in The Hinterlands
(46350, 31, 0, 'Solid Chest', 0, 10), -- Solid Chests in The Hinterlands
(46359, 31, 0, 'Solid Chest', 0, 10), -- Solid Chests in The Hinterlands
(46270, 31, 0, 'Solid Chest', 0, 10); -- Solid Chests in The Hinterlands

-- Missing Solid Chest spawns in Searing Gorge.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(10241, 4149, 0, -6873.67, -1321.84, 243.05, 2.68781, 0, 0, 0.97437, 0.224951, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 10163 at 160.803070 yards.
(10242, 4149, 0, -6918.89, -1412.95, 256.107, 3.54302, 0, 0, -0.979924, 0.19937, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 10163 at 153.230560 yards.
(10243, 4149, 0, -6602.92, -1312.25, 208.743, 5.42797, 0, 0, -0.414693, 0.909961, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 10031 at 87.370415 yards.
(10244, 4149, 0, -6679.84, -1169.02, 240.224, 2.87979, 0, 0, 0.991445, 0.130528, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 10157 at 85.366425 yards.
(10245, 4149, 0, -7031.12, -1712.23, 241.667, 0.436332, 0, 0, 0.216439, 0.976296, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 10163 at 401.245239 yards.
(10246, 4149, 0, -6469.35, -962.396, 335.602, 2.72271, 0, 0, 0.978148, 0.207912, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 10204 at 63.211365 yards.
(10247, 4149, 0, -6414.12, -1253.51, 180.939, 1.43117, 0, 0, 0.656058, 0.75471, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 10031 at 283.811859 yards.
(10250, 4149, 0, -6666.43, -716.584, 238.184, 5.2709, 0, 0, -0.484809, 0.87462, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 10204 at 284.204803 yards.
(10277, 4149, 0, -6831.52, -1161.4, 241.089, 2.65289, 0, 0, 0.970295, 0.241925, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 10157 at 140.726761 yards.
(10281, 4149, 0, -6469.97, -1368.05, 212.107, 6.24828, 0, 0, -0.0174522, 0.999848, 7200, 7200, 1, 100, 0, 10); -- Closest existing guid is 10031 at 212.266663 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(10241, 25, 0, 'Solid Chest', 0, 10), -- Solid Chests in Searing Gorge
(10242, 25, 0, 'Solid Chest', 0, 10), -- Solid Chests in Searing Gorge
(10243, 25, 0, 'Solid Chest', 0, 10), -- Solid Chests in Searing Gorge
(10244, 25, 0, 'Solid Chest', 0, 10), -- Solid Chests in Searing Gorge
(10245, 25, 0, 'Solid Chest', 0, 10), -- Solid Chests in Searing Gorge
(10246, 25, 0, 'Solid Chest', 0, 10), -- Solid Chests in Searing Gorge
(10247, 25, 0, 'Solid Chest', 0, 10), -- Solid Chests in Searing Gorge
(10250, 25, 0, 'Solid Chest', 0, 10), -- Solid Chests in Searing Gorge
(10277, 25, 0, 'Solid Chest', 0, 10), -- Solid Chests in Searing Gorge
(10281, 25, 0, 'Solid Chest', 0, 10); -- Solid Chests in Searing Gorge

-- Missing Solid Chest spawns in Tanaris.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(17453, 4149, 1, -7414.26, -4583.68, 8.77651, 5.20108, 0, 0, -0.515038, 0.857168, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 17298 at 140.132492 yards.
(17454, 4149, 1, -7675.42, -4410.94, 8.95528, 1.0472, 0, 0, 0.5, 0.866025, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 17299 at 142.117966 yards.
(17455, 4149, 1, -7720.31, -4632.25, 8.8768, 0.383971, 0, 0, 0.190808, 0.981627, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 17299 at 364.576843 yards.
(17456, 4149, 1, -6912.34, -3128.72, 8.79548, 3.42085, 0, 0, -0.990268, 0.139175, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 17300 at 1357.606079 yards.
(17457, 4149, 1, -7193.02, -2980.91, 8.79554, 3.64774, 0, 0, -0.968147, 0.250381, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 17299 at 1379.595459 yards.
(17458, 4149, 1, -7384.69, -4731.94, 9.16363, 2.35619, 0, 0, 0.92388, 0.382683, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 17298 at 216.232697 yards.
(17459, 4149, 1, -7212.92, -4623.56, 8.8849, 3.05433, 0, 0, 0.999048, 0.0436193, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 17298 at 105.339882 yards.
(17461, 4149, 1, -7549.1, -4266.47, 8.87937, 2.1293, 0, 0, 0.874619, 0.48481, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 17299 at 137.368240 yards.
(17462, 4149, 1, -6992.11, -2808.41, 10.7516, 5.32326, 0, 0, -0.461748, 0.887011, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 17299 at 1617.451904 yards.
(17463, 4149, 1, -7706.76, -4706.06, 8.87676, 4.67748, 0, 0, -0.719339, 0.694659, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 17299 at 437.282532 yards.
(17466, 4149, 1, -7550.48, -4734.68, 9.45221, 1.79769, 0, 0, 0.782608, 0.622515, 7200, 7200, 1, 100, 0, 10); -- Closest existing guid is 17298 at 331.519806 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(17453, 30, 0, 'Solid Chest', 0, 10), -- Solid Chests in Tanaris
(17454, 30, 0, 'Solid Chest', 0, 10), -- Solid Chests in Tanaris
(17455, 30, 0, 'Solid Chest', 0, 10), -- Solid Chests in Tanaris
(17456, 30, 0, 'Solid Chest', 0, 10), -- Solid Chests in Tanaris
(17457, 30, 0, 'Solid Chest', 0, 10), -- Solid Chests in Tanaris
(17458, 30, 0, 'Solid Chest', 0, 10), -- Solid Chests in Tanaris
(17459, 30, 0, 'Solid Chest', 0, 10), -- Solid Chests in Tanaris
(17461, 30, 0, 'Solid Chest', 0, 10), -- Solid Chests in Tanaris
(17462, 30, 0, 'Solid Chest', 0, 10), -- Solid Chests in Tanaris
(17463, 30, 0, 'Solid Chest', 0, 10), -- Solid Chests in Tanaris
(17466, 30, 0, 'Solid Chest', 0, 10); -- Solid Chests in Tanaris

UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `id`= 4149;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
