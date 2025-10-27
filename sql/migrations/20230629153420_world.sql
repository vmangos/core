DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230629153420');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230629153420');
-- Add your query below.


-- Create new pool to hold Dented Footlocker spawns in Searing Gorge.
DELETE FROM `pool_template` WHERE `entry` = 514;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(514, 14, 'Dented Footlockers in Searing Gorge', 1, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(7040, 514, 0, 'Dented Footlocker', 1, 10),
(7052, 514, 0, 'Dented Footlocker', 1, 10),
(7057, 514, 0, 'Dented Footlocker', 1, 10),
(7058, 514, 0, 'Dented Footlocker', 1, 10),
(9928, 514, 0, 'Dented Footlocker', 1, 10),
(9951, 514, 0, 'Dented Footlocker', 1, 10),
(9960, 514, 0, 'Dented Footlocker', 1, 10),
(9976, 514, 0, 'Dented Footlocker', 1, 10);

-- Missing Dented Footlocker spawns in Searing Gorge.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(7072, 179494, 0, -6512.53, -1226.73, 180.906, 4.92183, 0, 0, -0.62932, 0.777146, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 7052 at 47.373394 yards.
(10062, 179494, 0, -6755.83, -1268.04, 184.093, 2.35619, 0, 0, 0.92388, 0.382683, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 9928 at 98.255157 yards.
(10067, 179494, 0, -6693.35, -1146.22, 185.553, 4.38078, 0, 0, -0.814116, 0.580703, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 9928 at 82.431602 yards.
(7073, 179494, 0, -6714.52, -1106.64, 185.57, 4.81711, 0, 0, -0.66913, 0.743145, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 7040 at 64.176201 yards.
(10070, 179494, 0, -6904.37, -1266.76, 178.367, 2.51327, 0, 0, 0.951056, 0.309017, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 9951 at 55.943066 yards.
(10092, 179494, 0, -6905.48, -1317.65, 214.202, 3.94445, 0, 0, -0.920505, 0.390732, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 9951 at 90.644028 yards.
(10103, 179494, 0, -6901.59, -1332.98, 178.026, 3.35105, 0, 0, -0.994521, 0.104536, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 9951 at 111.494835 yards.
(7075, 179494, 0, -6487.51, -1216.39, 179.769, 4.93928, 0, 0, -0.622514, 0.782609, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 7057 at 32.579067 yards.
(10124, 179494, 0, -6564.79, -1161.19, 185.533, 4.43314, 0, 0, -0.798635, 0.601815, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 9976 at 70.522041 yards.
(10165, 179494, 0, -6588.27, -1239.27, 187.742, 1.37881, 0, 0, 0.636078, 0.771625, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 9976 at 25.816418 yards.
(10229, 179494, 0, -6734.04, -1249.45, 182.805, 2.58308, 0, 0, 0.961261, 0.27564, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 9928 at 70.786957 yards.
(7076, 179494, 0, -6433.15, -1239.85, 180.939, 3.89209, 0, 0, -0.930417, 0.366502, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 7057 at 54.476345 yards.
(10231, 179494, 0, -6634.95, -1184.97, 184.052, 4.83456, 0, 0, -0.66262, 0.748956, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 9928 at 51.571617 yards.
(10233, 179494, 0, -6725.11, -1213.18, 181.36, 4.27606, 0, 0, -0.843391, 0.5373, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 9928 at 58.323711 yards.
(10235, 179494, 0, -6708.36, -1171.31, 185.451, 0.349065, 0, 0, 0.173648, 0.984808, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 9928 at 67.000107 yards.
(7077, 179494, 0, -6891.97, -1185.27, 195.852, 2.86234, 0, 0, 0.990268, 0.139175, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 7058 at 37.689632 yards.
(10236, 179494, 0, -6758.77, -1183.21, 185.659, 3.10665, 0, 0, 0.999847, 0.0174693, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 9960 at 27.085808 yards.
(10237, 179494, 0, -6855.45, -1233.14, 177.142, 1.79769, 0, 0, 0.782608, 0.622515, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 9951 at 49.225571 yards.
(7079, 179494, 0, -6748.54, -1135.91, 185.602, 2.75761, 0, 0, 0.981627, 0.190812, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 7040 at 33.837051 yards.
(10239, 179494, 0, -6655.63, -1235.18, 179.888, 1.76278, 0, 0, 0.771625, 0.636078, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 9928 at 16.326767 yards.
(7080, 179494, 0, -6428.35, -1278.58, 180.939, 3.17653, 0, 0, -0.999847, 0.0174693, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 7057 at 91.042252 yards.
(7081, 179494, 0, -6736.37, -1103.68, 185.529, 4.76475, 0, 0, -0.688354, 0.725374, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 7040 at 46.533806 yards.
(10240, 179494, 0, -6656.28, -1162.41, 185.47, 3.49067, 0, 0, -0.984807, 0.173652, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 9928 at 63.337528 yards.
(7082, 179494, 0, -6480.9, -1303.11, 180.933, 1.43117, 0, 0, 0.656058, 0.75471, 180, 180, 1, 100, 1, 10); -- Closest existing guid is 7052 at 68.294716 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(7072, 514, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Searing Gorge
(10062, 514, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Searing Gorge
(10067, 514, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Searing Gorge
(7073, 514, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Searing Gorge
(10070, 514, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Searing Gorge
(10092, 514, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Searing Gorge
(10103, 514, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Searing Gorge
(7075, 514, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Searing Gorge
(10124, 514, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Searing Gorge
(10165, 514, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Searing Gorge
(10229, 514, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Searing Gorge
(7076, 514, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Searing Gorge
(10231, 514, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Searing Gorge
(10233, 514, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Searing Gorge
(10235, 514, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Searing Gorge
(7077, 514, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Searing Gorge
(10236, 514, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Searing Gorge
(10237, 514, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Searing Gorge
(7079, 514, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Searing Gorge
(10239, 514, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Searing Gorge
(7080, 514, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Searing Gorge
(7081, 514, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Searing Gorge
(10240, 514, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Searing Gorge
(7082, 514, 0, 'Dented Footlocker', 1, 10); -- Dented Footlockers in Searing Gorge

UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `id` = 179494;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
