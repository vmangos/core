DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230707202216');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230707202216');
-- Add your query below.


SET @OGUID = 66441;

-- Map 30 / Alterac Valley / 178646 / Alliance Supply Crate
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 178646, 30, 639.11, -62.8011, 41.6571, 1.51844, 0, 0, 0.688354, 0.725374, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 178646, 30, 639.143, -62.6807, 42.8655, 4.72984, 0, 0, -0.700909, 0.713251, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 178646, 30, 639.182, -62.8141, 42.2613, 1.39626, 0, 0, 0.642787, 0.766045, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 178646, 30, 639.208, -60.1743, 41.6571, 0, 0, 0, 0, 1, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 178646, 30, 639.284, -61.5004, 41.6571, 4.60767, 0, 0, -0.743144, 0.669131, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 178646, 30, 639.285, -60.1675, 42.2613, 0, 0, 0, 0, 1, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 178646, 30, 639.372, -61.5296, 42.2613, 4.46804, 0, 0, -0.788011, 0.615662, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 178646, 30, 639.395, -58.6921, 41.6571, 6.24828, 0, 0, -0.0174522, 0.999848, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 178646, 30, 639.412, -58.7139, 42.2474, 6.26573, 0, 0, -0.00872612, 0.999962, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 178646, 30, 639.711, -57.2125, 41.6571, 4.64258, 0, 0, -0.731354, 0.681998, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 178646, 30, 639.732, -57.2604, 42.2752, 4.67748, 0, 0, -0.719339, 0.694659, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 178646, 30, 640.829, -55.8194, 41.7912, 1.15192, 0, 0, 0.544639, 0.838671, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 178646, 30, 640.887, -55.835, 42.3779, 4.45059, 0, 0, -0.793353, 0.608762, 180, 180, 100, 1, 0, 0, 0, 10);

UPDATE `gameobject` SET `spawntimesecsmin` = 180, `spawntimesecsmax` = 180, `patch_min` = 3 WHERE `id` = 178646;

-- Deadmines
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+15, 3662, 36, -37.0586, -720.381, 8.35814, 3.00195, 0, 0, 0.997563, 0.0697661, 604800, 604800, 100, 1, 0, 0, 0, 10);

-- Uldaman
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+16, 3707, 70, -346.995, 105.85, -53.3132, 4.20625, 0, 0, -0.861629, 0.507539, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 3707, 70, -150.741, 215.673, -46.1308, 0.383971, 0, 0, 0.190808, 0.981627, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 3707, 70, -77.3072, 200.739, -49.7122, 1.39626, 0, 0, 0.642787, 0.766045, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 3707, 70, 7.23665, 389.231, -43.7525, 1.71042, 0, 0, 0.754709, 0.656059, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 3707, 70, -150.931, 253.757, -48.2797, 0.837757, 0, 0, 0.406736, 0.913546, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 3707, 70, -7.95842, 275.67, -48.8676, 2.18166, 0, 0, 0.887011, 0.461749, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 3707, 70, -208.706, 224.748, -46.9613, 2.46091, 0, 0, 0.942641, 0.333808, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 3707, 70, 12.4986, 217.998, -31.1776, 1.18682, 0, 0, 0.559193, 0.829038, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 3707, 70, -85.3423, 311.221, -51.0015, 2.30383, 0, 0, 0.913545, 0.406738, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 3707, 70, 50.5515, 322.313, -43.2326, 2.23402, 0, 0, 0.898793, 0.438373, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 3707, 70, 140.289, 301.205, -52.2145, 4.72984, 0, 0, -0.700909, 0.713251, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 3707, 70, -117.284, 235.933, -51.811, 5.88176, 0, 0, -0.199368, 0.979925, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+29, 3707, 70, -101.293, 329.776, -47.5239, 3.6652, 0, 0, -0.965925, 0.258821, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+30, 3707, 70, -363.178, 123.211, -45.2583, 0.226892, 0, 0, 0.113203, 0.993572, 604800, 604800, 100, 1, 0, 0, 0, 10);

UPDATE `gameobject` SET `spawntimesecsmin` = 604800, `spawntimesecsmax` = 604800 WHERE `guid` IN (40666, 40661, 40663, 40664, 26212, 31957, 26208, 26207, 33283, 33282, 40670, 40671, 40672, 32410, 32398);

SET @OGUID = 82054;
SET @PTEMPLATE = 2511;
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 15 Dustwallow Marsh 3707 / 153470
-- Create new pool to hold Food Crate spawns in Dustwallow Marsh.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 6, 'Food Crates in Dustwallow Marsh', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(9097, @PTEMPLATE+1, 0, 'Food Crate', 0, 10),
(9098, @PTEMPLATE+1, 0, 'Food Crate', 0, 10),
(13144, @PTEMPLATE+1, 0, 'Food Crate', 0, 10),
(13634, @PTEMPLATE+1, 0, 'Food Crate', 0, 10),
(14675, @PTEMPLATE+1, 0, 'Food Crate', 0, 10),
(40822, @PTEMPLATE+1, 0, 'Food Crate', 0, 10),
(55933, @PTEMPLATE+1, 0, 'Food Crate', 0, 10),
(55939, @PTEMPLATE+1, 0, 'Food Crate', 0, 10),
(55943, @PTEMPLATE+1, 0, 'Food Crate', 0, 10);

-- Missing Food Crate spawns in Dustwallow Marsh.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 3707, 1, -2649.03, -3515.22, 33.4671, 5.37562, 0, 0, -0.438371, 0.898794, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 14675 at 245.760773 yards.
(@OGUID+2, 3707, 1, -3150.93, -2880.38, 33.781, 4.06662, 0, 0, -0.894934, 0.446199, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 13144 at 60.182327 yards.
(@OGUID+4, 3707, 1, -2673.81, -4211.31, -0.035784, 1.06465, 0, 0, 0.507538, 0.861629, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 9097 at 202.033051 yards.
(@OGUID+5, 3707, 1, -2533.51, -3826.51, -0.050045, 6.10865, 0, 0, -0.0871553, 0.996195, 180, 180, 1, 100, 0, 10); -- Closest existing guid is 9097 at 211.817322 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, @PTEMPLATE+1, 0, 'Food Crate', 0, 10), -- Food Crates in Dustwallow Marsh
(@OGUID+2, @PTEMPLATE+1, 0, 'Food Crate', 0, 10), -- Food Crates in Dustwallow Marsh
(@OGUID+3, @PTEMPLATE+1, 0, 'Food Crate', 0, 10), -- Food Crates in Dustwallow Marsh
(@OGUID+4, @PTEMPLATE+1, 0, 'Food Crate', 0, 10), -- Food Crates in Dustwallow Marsh
(@OGUID+5, @PTEMPLATE+1, 0, 'Food Crate', 0, 10); -- Food Crates in Dustwallow Marsh

-- Create new pool to hold Food Crate spawns in Dustwallow Marsh.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 4, 'Food Crates in Dustwallow Marsh', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(11754, @PTEMPLATE+2, 0, 'Food Crate', 0, 10),
(14932, @PTEMPLATE+2, 0, 'Food Crate', 0, 10),
(30214, @PTEMPLATE+2, 0, 'Food Crate', 0, 10),
(56051, @PTEMPLATE+2, 0, 'Food Crate', 0, 10);

-- Missing Food Crate spawns in Dustwallow Marsh.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+6, 153470, 1, -3373.84, -2834.7, 33.9843, 3.45576, 0, 0, -0.987688, 0.156436, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 30214 at 559.647644 yards.
(@OGUID+7, 153470, 1, -4019.69, -3809.7, 40.56, 0.0523589, 0, 0, 0.0261765, 0.999657, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 14932 at 234.179855 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+6, @PTEMPLATE+2, 0, 'Food Crate', 0, 10), -- Food Crates in Dustwallow Marsh
(@OGUID+7, @PTEMPLATE+2, 0, 'Food Crate', 0, 10), -- Food Crates in Dustwallow Marsh
(@OGUID+8, @PTEMPLATE+2, 0, 'Food Crate', 0, 10); -- Food Crates in Dustwallow Marsh

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 28 Western Plaguelands 153471
-- Create new pool to hold Food Crate spawns in Western Plaguelands.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 5, 'Food Crates in Western Plaguelands', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(45483, @PTEMPLATE+3, 0, 'Food Crate', 0, 10),
(45487, @PTEMPLATE+3, 0, 'Food Crate', 0, 10),
(45489, @PTEMPLATE+3, 0, 'Food Crate', 0, 10),
(45490, @PTEMPLATE+3, 0, 'Food Crate', 0, 10),
(45491, @PTEMPLATE+3, 0, 'Food Crate', 0, 10),
(45547, @PTEMPLATE+3, 0, 'Food Crate', 0, 10),
(45549, @PTEMPLATE+3, 0, 'Food Crate', 0, 10),
(45550, @PTEMPLATE+3, 0, 'Food Crate', 0, 10);

-- Missing Food Crate spawns in Western Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+9, 153471, 0, 1377.65, -1645.25, 65.8011, 5.41052, 0, 0, -0.422618, 0.906308, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 45491 at 124.397659 yards.
(@OGUID+10, 153471, 0, 1419.75, -1269.23, 61.7803, 4.32842, 0, 0, -0.829037, 0.559194, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 45550 at 214.203903 yards.
(@OGUID+11, 153471, 0, 1908.63, -1619.02, 60.4806, 2.37364, 0, 0, 0.927183, 0.374608, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 45490 at 288.695892 yards.
(@OGUID+12, 153471, 0, 2426.08, -1660.85, 102.501, 2.61799, 0, 0, 0.965925, 0.258821, 7200, 7200, 1, 100, 0, 10); -- Closest existing guid is 45547 at 212.552856 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+9, @PTEMPLATE+3, 0, 'Food Crate', 0, 10), -- Food Crates in Western Plaguelands
(@OGUID+10, @PTEMPLATE+3, 0, 'Food Crate', 0, 10), -- Food Crates in Western Plaguelands
(@OGUID+11, @PTEMPLATE+3, 0, 'Food Crate', 0, 10), -- Food Crates in Western Plaguelands
(@OGUID+12, @PTEMPLATE+3, 0, 'Food Crate', 0, 10); -- Food Crates in Western Plaguelands
UPDATE `gameobject` SET `spawntimesecsmin` = 180, `spawntimesecsmax` = 180  WHERE `id` = 153471;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 47 Hinterlands 153470
-- Create new pool to hold Food Crate spawns in The Hinterlands.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 5, 'Food Crates in The Hinterlands', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(46224, @PTEMPLATE+4, 0, 'Food Crate', 0, 10),
(46226, @PTEMPLATE+4, 0, 'Food Crate', 0, 10),
(46234, @PTEMPLATE+4, 0, 'Food Crate', 0, 10),
(46238, @PTEMPLATE+4, 0, 'Food Crate', 0, 10),
(46248, @PTEMPLATE+4, 0, 'Food Crate', 0, 10),
(46251, @PTEMPLATE+4, 0, 'Food Crate', 0, 10),
(46275, @PTEMPLATE+4, 0, 'Food Crate', 0, 10),
(46428, @PTEMPLATE+4, 0, 'Food Crate', 0, 10);

-- Missing Food Crate spawns in The Hinterlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+13, 153470, 0, 373.294, -3779.54, 169.851, 4.5204, 0, 0, -0.771625, 0.636078, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 46428 at 180.553589 yards.
(@OGUID+14, 153470, 0, 240.621, -2203.65, 125.171, 5.88176, 0, 0, -0.199368, 0.979925, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 46251 at 174.189774 yards.
(@OGUID+15, 153470, 0, -26.6015, -2803.9, 122.034, 0.785397, 0, 0, 0.382683, 0.92388, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 46224 at 309.217957 yards.
(@OGUID+16, 153470, 0, 313.332, -4118.64, 118.919, 6.17847, 0, 0, -0.0523357, 0.99863, 7200, 7200, 1, 100, 0, 10); -- Closest existing guid is 46428 at 512.283630 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+13, @PTEMPLATE+4, 0, 'Food Crate', 0, 10), -- Food Crates in The Hinterlands
(@OGUID+14, @PTEMPLATE+4, 0, 'Food Crate', 0, 10), -- Food Crates in The Hinterlands
(@OGUID+15, @PTEMPLATE+4, 0, 'Food Crate', 0, 10), -- Food Crates in The Hinterlands
(@OGUID+16, @PTEMPLATE+4, 0, 'Food Crate', 0, 10); -- Food Crates in The Hinterlands
UPDATE `gameobject` SET `spawntimesecsmin` = 180, `spawntimesecsmax` = 180  WHERE `id` = 153470;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 17 Barrens 3690 / 3691 / 3693 / 3695

-- Missing Food Crate spawns in The Barrens.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+17, 3690, 1, 1367.86, -3556.09, 93.9161, 0.366518, 0, 0, 0.182235, 0.983255, 3600, 3600, 1, 100, 0, 10); -- Closest existing guid is 13440 at 76.870895 yards.

-- Missing Food Crate spawns in The Barrens.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+18, 3691, 1, -1503.06, -3824.64, 23.4828, 1.36136, 0, 0, 0.62932, 0.777146, 3600, 3600, 1, 100, 0, 10); -- Closest existing guid is 13442 at 94.426231 yards.

-- Missing Food Crate spawns in The Barrens.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+19, 3693, 1, 1350.04, -3648.25, 111.642, 0.820303, 0, 0, 0.398748, 0.91706, 3600, 3600, 1, 100, 0, 10); -- Closest existing guid is 13448 at 103.020088 yards.

-- Missing Food Crate spawns in The Barrens.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+20, 3695, 1, -4061.65, -2371.05, 118.075, 4.67748, 0, 0, -0.719339, 0.694659, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 13455 at 28.387096 yards.
(@OGUID+21, 3695, 1, -4049.41, -2361.03, 135.856, 3.52557, 0, 0, -0.981627, 0.190812, 3600, 3600, 1, 100, 0, 10); -- Closest existing guid is 13455 at 44.786751 yards.


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
