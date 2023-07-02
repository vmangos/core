DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230702080910');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230702080910');
-- Add your query below.


-- Create new pool to hold Box of Assorted Parts spawns in The Barrens.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(68, 1, 'Box of Assorted Partss in The Barrens', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(13300, 68, 0, 'Box of Assorted Parts', 0, 10);

-- Create new pool to hold Box of Assorted Parts spawns in Westfall.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(69, 3, 'Box of Assorted Partss in Westfall', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(42685, 69, 0, 'Box of Assorted Parts', 0, 10),
(42752, 69, 0, 'Box of Assorted Parts', 0, 10);

-- Missing Box of Assorted Parts spawns in The Barrens.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(13490, 19019, 1, 1326.78, -3639.1, 91.7399, 3.38594, 0, 0, -0.992546, 0.12187, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 13300 at 56.625462 yards.
(13546, 19019, 1, 1367.9, -3651.88, 97.2595, 3.01941, 0, 0, 0.998135, 0.0610518, 3600, 3600, 1, 100, 0, 10); -- Closest existing guid is 13300 at 94.467255 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(13490, 68, 0, 'Box of Assorted Parts', 0, 10), -- Box of Assorted Partss in The Barrens
(13546, 68, 0, 'Box of Assorted Parts', 0, 10); -- Box of Assorted Partss in The Barrens

-- Missing Box of Assorted Parts spawns in Westfall.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(42707, 19019, 0, -10543.9, 2119.12, 0.081357, 1.85005, 0, 0, 0.798635, 0.601815, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 42685 at 536.684692 yards.
(42932, 19019, 0, -11013.9, 1528.84, 43.7747, 0.174532, 0, 0, 0.0871553, 0.996195, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 42752 at 77.803619 yards.
(42933, 19019, 0, -11059, 1445.25, 43.3236, 2.49582, 0, 0, 0.948323, 0.317306, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 42752 at 167.826218 yards.
(42937, 19019, 0, -10981.8, 1477.53, 50.6081, 4.71239, 0, 0, -0.707107, 0.707107, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 42752 at 100.264534 yards.
(42939, 19019, 0, -11098.1, 2090.4, -0.057365, 2.46091, 0, 0, 0.942641, 0.333808, 3600, 3600, 1, 100, 0, 10); -- Closest existing guid is 42752 at 540.960938 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(42707, 69, 0, 'Box of Assorted Parts', 0, 10), -- Box of Assorted Partss in Westfall
(42932, 69, 0, 'Box of Assorted Parts', 0, 10), -- Box of Assorted Partss in Westfall
(42933, 69, 0, 'Box of Assorted Parts', 0, 10), -- Box of Assorted Partss in Westfall
(42937, 69, 0, 'Box of Assorted Parts', 0, 10), -- Box of Assorted Partss in Westfall
(42939, 69, 0, 'Box of Assorted Parts', 0, 10); -- Box of Assorted Partss in Westfall

UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `id`= 19019;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
