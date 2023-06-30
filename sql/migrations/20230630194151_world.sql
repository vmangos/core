DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230630194151');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230630194151');
-- Add your query below.


-- Create new pool to hold Hidden Strongbox spawns in Alterac Mountains.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(9, 6, 'Hidden Strongboxs in Alterac Mountains', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(32179, 9, 0, 'Hidden Strongbox', 0, 10),
(32183, 9, 0, 'Hidden Strongbox', 0, 10),
(32184, 9, 0, 'Hidden Strongbox', 0, 10);

-- Missing Hidden Strongbox spawns in Alterac Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(32346, 2039, 0, 475.848, 258.451, 43.3263, 2.58308, 0, 0, 0.961261, 0.27564, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 32184 at 139.037186 yards.
(32361, 2039, 0, 416.75, 238.28, 43.3589, 4.60767, 0, 0, -0.743144, 0.669131, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 32184 at 82.526695 yards.
(32362, 2039, 0, 97.6637, 461.808, 41.9076, 6.21337, 0, 0, -0.0348988, 0.999391, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 32183 at 344.504639 yards.
(32454, 2039, 0, 73.9381, 351.445, 42.0666, 5.96903, 0, 0, -0.156434, 0.987688, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 32183 at 288.853699 yards.
(32455, 2039, 0, 52.725, 484.512, 41.9076, 5.18363, 0, 0, -0.522498, 0.85264, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 32183 at 391.215179 yards.
(32459, 2039, 0, 496.922, 190.678, 41.9056, 5.91667, 0, 0, -0.182235, 0.983255, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 32184 at 132.060974 yards.
(32460, 2039, 0, 423.812, 178.545, 43.0778, 3.68265, 0, 0, -0.96363, 0.267241, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 32184 at 58.032925 yards.
(32470, 2039, 0, 109.063, 263.748, 43.2449, 5.49779, 0, 0, -0.382683, 0.92388, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 32183 at 219.380905 yards.
(32471, 2039, 0, 375.222, 203.855, 43.0311, 4.99164, 0, 0, -0.601814, 0.798636, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 32184 at 32.021175 yards.
(32479, 2039, 0, 90.2206, 237.015, 43.2842, 0.0349062, 0, 0, 0.0174522, 0.999848, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 32183 at 231.311691 yards.
(32485, 2039, 0, 72.1165, 424.798, 43.0758, 3.38594, 0, 0, -0.992546, 0.12187, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 32183 at 335.212189 yards.
(32492, 2039, 0, 63.5124, 268.543, 43.1233, 0.331611, 0, 0, 0.165047, 0.986286, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 32183 at 264.393341 yards.
(32493, 2039, 0, 298.736, 186.098, 42.6336, 2.30383, 0, 0, 0.913545, 0.406738, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 32183 at 22.190643 yards.
(32509, 2039, 0, 444.879, 196.229, 43.7402, 3.38594, 0, 0, -0.992546, 0.12187, 7200, 7200, 1, 100, 0, 10); -- Closest existing guid is 32184 at 82.155258 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(32346, 9, 0, 'Hidden Strongbox', 0, 10), -- Hidden Strongboxs in Alterac Mountains
(32361, 9, 0, 'Hidden Strongbox', 0, 10), -- Hidden Strongboxs in Alterac Mountains
(32362, 9, 0, 'Hidden Strongbox', 0, 10), -- Hidden Strongboxs in Alterac Mountains
(32454, 9, 0, 'Hidden Strongbox', 0, 10), -- Hidden Strongboxs in Alterac Mountains
(32455, 9, 0, 'Hidden Strongbox', 0, 10), -- Hidden Strongboxs in Alterac Mountains
(32459, 9, 0, 'Hidden Strongbox', 0, 10), -- Hidden Strongboxs in Alterac Mountains
(32460, 9, 0, 'Hidden Strongbox', 0, 10), -- Hidden Strongboxs in Alterac Mountains
(32470, 9, 0, 'Hidden Strongbox', 0, 10), -- Hidden Strongboxs in Alterac Mountains
(32471, 9, 0, 'Hidden Strongbox', 0, 10), -- Hidden Strongboxs in Alterac Mountains
(32479, 9, 0, 'Hidden Strongbox', 0, 10), -- Hidden Strongboxs in Alterac Mountains
(32485, 9, 0, 'Hidden Strongbox', 0, 10), -- Hidden Strongboxs in Alterac Mountains
(32492, 9, 0, 'Hidden Strongbox', 0, 10), -- Hidden Strongboxs in Alterac Mountains
(32493, 9, 0, 'Hidden Strongbox', 0, 10), -- Hidden Strongboxs in Alterac Mountains
(32509, 9, 0, 'Hidden Strongbox', 0, 10); -- Hidden Strongboxs in Alterac Mountains

UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `id` = 2039;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
