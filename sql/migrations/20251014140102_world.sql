DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20251014140102');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20251014140102');
-- Add your query below.


-- Respawn Talon Den spawns based on sniffs.
DELETE FROM `gameobject` WHERE `id`=152093;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1410, 152093, 1, 2322.79, 1860.63, 364.55, 2.02458, 0, 0, 0.848048, 0.529919, 7200, 7200, 100, 1, 0, 10), -- Stonetalon Mountains
(1411, 152093, 1, 2352.42, 1847.13, 355.451, 0.820305, 0, 0, 0.398749, 0.91706, 7200, 7200, 100, 1, 0, 10), -- Stonetalon Mountains
(1522, 152093, 1, 2297.36, 1806.83, 344.156, 1.5708, 0, 0, 0.707107, 0.707107, 7200, 7200, 100, 1, 0, 10), -- Stonetalon Mountains
(1526, 152093, 1, 2330.86, 1784.49, 323.715, 2.74017, 0, 0, 0.979925, 0.199368, 7200, 7200, 100, 1, 0, 10), -- Stonetalon Mountains
(1528, 152093, 1, 2307.34, 1872, 336.765, -2.26893, 0, 0, 0.906308, -0.422618, 7200, 7200, 100, 1, 0, 10), -- Stonetalon Mountains
(1533, 152093, 1, 2265.5, 1843.64, 319.074, 0.977384, 0, 0, 0.469472, 0.882948, 7200, 7200, 100, 1, 0, 10), -- Stonetalon Mountains
(1539, 152093, 1, 2340.25, 1912.59, 349.837, 1.8326, 0, 0, 0.793353, 0.608761, 7200, 7200, 100, 1, 0, 10), -- Stonetalon Mountains
(1544, 152093, 1, 2368.5, 1710.8, 340.883, 0.10472, 0, 0, 0.052336, 0.99863, 7200, 7200, 100, 1, 0, 10), -- Stonetalon Mountains
(1550, 152093, 1, 2413.8, 1707.22, 343.246, 0.488692, 0, 0, 0.241922, 0.970296, 7200, 7200, 100, 1, 0, 10), -- Stonetalon Mountains
(1561, 152093, 1, 2445.36, 1783.59, 344.973, -0.785398, 0, 0, 0.382683, -0.92388, 7200, 7200, 100, 1, 0, 10), -- Stonetalon Mountains
(1563, 152093, 1, 2407.17, 1724.53, 343.86, 1.13446, 0, 0, 0.5373, 0.843391, 7200, 7200, 100, 1, 0, 10), -- Stonetalon Mountains
(1567, 152093, 1, 2407.99, 1753.69, 340.147, 0.436332, 0, 0, 0.21644, 0.976296, 7200, 7200, 100, 1, 0, 10), -- Stonetalon Mountains
(1575, 152093, 1, 2380.2, 1792.45, 322.965, 0.575959, 0, 0, 0.284015, 0.95882, 7200, 7200, 100, 1, 0, 10), -- Stonetalon Mountains
(1584, 152093, 1, 2419.04, 1815.82, 352.505, 4.71239, 0, 0, 0.707107, -0.707107, 7200, 7200, 100, 1, 0, 10), -- Stonetalon Mountains
(1587, 152093, 1, 2343.74, 1800.4, 326.569, 0.10472, 0, 0, 0.052336, 0.99863, 7200, 7200, 100, 1, 0, 10), -- Stonetalon Mountains
(1592, 152093, 1, 2413.83, 1843.03, 373.255, -2.49582, 0, 0, 0.948324, -0.317305, 7200, 7200, 100, 1, 0, 10), -- Stonetalon Mountains
(1594, 152093, 1, 2395.77, 1802.89, 356.125, -1.90241, 0, 0, 0.814116, -0.580703, 7200, 7200, 100, 1, 0, 10), -- Stonetalon Mountains
(1601, 152093, 1, 2370.93, 1827.23, 360.477, 1.20428, 0, 0, 0.566406, 0.824126, 7200, 7200, 100, 1, 0, 10); -- Stonetalon Mountains


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
