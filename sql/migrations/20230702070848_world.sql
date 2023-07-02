DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230702070848');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230702070848');
-- Add your query below.


-- Create new pool to hold Weapon Crate spawns in The Barrens.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(63, 3, 'Weapon Crates in The Barrens', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(13309, 63, 0, 'Weapon Crate', 0, 10),
(13310, 63, 0, 'Weapon Crate', 0, 10);

-- Create new pool to hold Weapon Crate spawns in Darkshore.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(64, 3, 'Weapon Crates in Darkshore', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(48774, 64, 0, 'Weapon Crate', 0, 10);

-- Missing Weapon Crate spawns in The Barrens.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(13336, 3661, 1, -483.763, -2601.68, 127.867, 4.2237, 0, 0, -0.857167, 0.515038, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 13310 at 25.129442 yards.
(13337, 3661, 1, -332.152, -2559.53, 95.7875, 2.19911, 0, 0, 0.891006, 0.453991, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 13310 at 154.215744 yards.
(13344, 3661, 1, -1443.09, -3652.76, 92.2653, 5.42797, 0, 0, -0.414693, 0.909961, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 13309 at 89.139816 yards.
(13487, 3661, 1, -1568.41, -3894.21, 14.4994, 0.401425, 0, 0, 0.199368, 0.979925, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 13309 at 363.764099 yards.
(13488, 3661, 1, -1493.29, -3815.57, 24.6679, 5.86431, 0, 0, -0.207911, 0.978148, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 13309 at 258.177765 yards.
(13489, 3661, 1, -1360.28, -3913.57, 9.11687, 1.37881, 0, 0, 0.636078, 0.771625, 3600, 3600, 1, 100, 0, 10); -- Closest existing guid is 13309 at 327.625763 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(13336, 63, 0, 'Weapon Crate', 0, 10), -- Weapon Crates in The Barrens
(13337, 63, 0, 'Weapon Crate', 0, 10), -- Weapon Crates in The Barrens
(13344, 63, 0, 'Weapon Crate', 0, 10), -- Weapon Crates in The Barrens
(13487, 63, 0, 'Weapon Crate', 0, 10), -- Weapon Crates in The Barrens
(13488, 63, 0, 'Weapon Crate', 0, 10), -- Weapon Crates in The Barrens
(13489, 63, 0, 'Weapon Crate', 0, 10); -- Weapon Crates in The Barrens

-- Missing Weapon Crate spawns in Darkshore.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(48777, 3661, 1, 7558.19, -376.235, -1.87434, 1.37881, 0, 0, 0.636078, 0.771625, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48774 at 110.387810 yards.
(48822, 3661, 1, 5566.8, 575.271, -1.72532, 5.21854, 0, 0, -0.507538, 0.861629, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48774 at 2162.257813 yards.
(48827, 3661, 1, 7050, 392.654, -6.14862, 5.41052, 0, 0, -0.422618, 0.906308, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48774 at 939.171997 yards.
(48859, 3661, 1, 6103.46, 815.634, -33.4195, 2.61799, 0, 0, 0.965925, 0.258821, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48774 at 1862.147583 yards.
(48932, 3661, 1, 5470.45, 583.138, -0.04548, 5.09636, 0, 0, -0.559193, 0.829038, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48774 at 2251.228271 yards.
(48933, 3661, 1, 7131.98, 345.849, -41.7792, 5.65487, 0, 0, -0.309016, 0.951057, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48774 at 863.046692 yards.
(48934, 3661, 1, 7046.27, 407.369, -22.604, 2.04204, 0, 0, 0.85264, 0.522499, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48774 at 954.243225 yards.
(48956, 3661, 1, 7869.38, -918.659, -24.3792, 1.58825, 0, 0, 0.71325, 0.70091, 7200, 7200, 1, 100, 0, 10); -- Closest existing guid is 48774 at 617.548889 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(48777, 64, 0, 'Weapon Crate', 0, 10), -- Weapon Crates in Darkshore
(48822, 64, 0, 'Weapon Crate', 0, 10), -- Weapon Crates in Darkshore
(48827, 64, 0, 'Weapon Crate', 0, 10), -- Weapon Crates in Darkshore
(48859, 64, 0, 'Weapon Crate', 0, 10), -- Weapon Crates in Darkshore
(48932, 64, 0, 'Weapon Crate', 0, 10), -- Weapon Crates in Darkshore
(48933, 64, 0, 'Weapon Crate', 0, 10), -- Weapon Crates in Darkshore
(48934, 64, 0, 'Weapon Crate', 0, 10), -- Weapon Crates in Darkshore
(48956, 64, 0, 'Weapon Crate', 0, 10); -- Weapon Crates in Darkshore

UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `id`= 3661;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
