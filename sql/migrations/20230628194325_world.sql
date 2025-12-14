DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230628194325');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230628194325');
-- Add your query below.


-- Create new pool to hold Dented Footlocker spawns in Searing Gorge.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(414, 8, 'Dented Footlockers in Searing Gorge', 1, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(7053, 414, 0, 'Dented Footlocker', 1, 10),
(7054, 414, 0, 'Dented Footlocker', 1, 10),
(7055, 414, 0, 'Dented Footlocker', 1, 10),
(7056, 414, 0, 'Dented Footlocker', 1, 10),
(9970, 414, 0, 'Dented Footlocker', 1, 10);

-- Create new pool to hold Dented Footlocker spawns in Tanaris.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(415, 11, 'Dented Footlockers in Tanaris', 1, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(17274, 415, 0, 'Dented Footlocker', 1, 10),
(17275, 415, 0, 'Dented Footlocker', 1, 10),
(17276, 415, 0, 'Dented Footlocker', 1, 10),
(17277, 415, 0, 'Dented Footlocker', 1, 10),
(17278, 415, 0, 'Dented Footlocker', 1, 10),
(17279, 415, 0, 'Dented Footlocker', 1, 10),
(17280, 415, 0, 'Dented Footlocker', 1, 10),
(17281, 415, 0, 'Dented Footlocker', 1, 10);

-- Missing Dented Footlocker spawns in Searing Gorge.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(7059, 179496, 0, -6645.22, -1286.76, 208.616, 5.91667, 0, 0, -0.182235, 0.983255, 7200, 7200, 1, 100, 1, 10), -- Closest existing guid is 7056 at 81.857880 yards.
(7061, 179496, 0, -6621.68, -1228.86, 209.808, 3.94445, 0, 0, -0.920505, 0.390732, 7200, 7200, 1, 100, 1, 10), -- Closest existing guid is 7056 at 77.557053 yards.
(7062, 179496, 0, -6644.26, -1233.54, 209.81, 0.401425, 0, 0, 0.199368, 0.979925, 7200, 7200, 1, 100, 1, 10), -- Closest existing guid is 7056 at 93.207207 yards.
(9999, 179496, 0, -6563.71, -1338.32, 208.777, 0.174532, 0, 0, 0.0871553, 0.996195, 7200, 7200, 1, 100, 1, 10), -- Closest existing guid is 9970 at 35.414371 yards.
(10004, 179496, 0, -6526.39, -1292.38, 200.945, 5.61996, 0, 0, -0.325567, 0.945519, 7200, 7200, 1, 100, 1, 10), -- Closest existing guid is 9970 at 35.583958 yards.
(10007, 179496, 0, -6586.92, -1304, 208.743, 1.44862, 0, 0, 0.66262, 0.748956, 7200, 7200, 1, 100, 1, 10), -- Closest existing guid is 9970 at 27.542294 yards.
(10058, 179496, 0, -6616.51, -1303.85, 208.743, 2.18166, 0, 0, 0.887011, 0.461749, 7200, 7200, 1, 100, 1, 10), -- Closest existing guid is 9970 at 57.123676 yards.
(7063, 179496, 0, -6557.3, -1264.01, 208.674, 4.92183, 0, 0, -0.62932, 0.777146, 7200, 7200, 1, 100, 1, 10), -- Closest existing guid is 7056 at 17.445314 yards.
(7064, 179496, 0, -6750.8, -1386.84, 194.181, 2.49582, 0, 0, 0.948323, 0.317306, 7200, 7200, 1, 100, 1, 10), -- Closest existing guid is 7054 at 18.544992 yards.
(7066, 179496, 0, -6587.98, -1270.17, 208.743, 4.88692, 0, 0, -0.642787, 0.766045, 7200, 7200, 1, 100, 1, 10), -- Closest existing guid is 7056 at 26.370674 yards.
(7067, 179496, 0, -6491.73, -1345.37, 212.107, 5.23599, 0, 0, -0.5, 0.866025, 7200, 7200, 1, 100, 1, 10), -- Closest existing guid is 7055 at 25.613008 yards.
(7068, 179496, 0, -6535.62, -1359.2, 209.033, 1.15192, 0, 0, 0.544639, 0.838671, 7200, 7200, 1, 100, 1, 10), -- Closest existing guid is 7053 at 20.931141 yards.
(10060, 179496, 0, -6632.78, -1320.45, 208.743, 1.74533, 0, 0, 0.766044, 0.642789, 7200, 7200, 1, 100, 1, 10), -- Closest existing guid is 9970 at 75.396523 yards.
(7069, 179496, 0, -6739.9, -1408.06, 215.522, 1.50098, 0, 0, 0.681998, 0.731354, 7200, 7200, 1, 100, 1, 10), -- Closest existing guid is 7054 at 46.463131 yards.
(7070, 179496, 0, -6478.27, -1338.94, 212.107, 4.01426, 0, 0, -0.906307, 0.422619, 7200, 7200, 1, 100, 1, 10); -- Closest existing guid is 7055 at 30.453411 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(7059, 414, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Searing Gorge
(7061, 414, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Searing Gorge
(7062, 414, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Searing Gorge
(9999, 414, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Searing Gorge
(10004, 414, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Searing Gorge
(10007, 414, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Searing Gorge
(10058, 414, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Searing Gorge
(7063, 414, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Searing Gorge
(7064, 414, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Searing Gorge
(7066, 414, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Searing Gorge
(7067, 414, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Searing Gorge
(7068, 414, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Searing Gorge
(10060, 414, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Searing Gorge
(7069, 414, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Searing Gorge
(7070, 414, 0, 'Dented Footlocker', 1, 10); -- Dented Footlockers in Searing Gorge

-- Missing Dented Footlocker spawns in Tanaris.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(17312, 179496, 1, -7916.56, -5206.65, 0.708901, 6.0912, 0, 0, -0.0958452, 0.995396, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 17280 at 78.967987 yards.
(17313, 179496, 1, -8041.49, -5207.45, 0.57482, 3.50812, 0, 0, -0.983254, 0.182238, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 17280 at 69.065140 yards.
(17314, 179496, 1, -8091.85, -5225.95, 0.840984, 0.349065, 0, 0, 0.173648, 0.984808, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 17274 at 90.441612 yards.
(17315, 179496, 1, -8071.07, -5244.25, 2.37394, 1.8675, 0, 0, 0.803857, 0.594823, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 17280 at 86.463295 yards.
(17328, 179496, 1, -8023.18, -5388.44, 0.569156, 1.06465, 0, 0, 0.507538, 0.861629, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 17281 at 18.676846 yards.
(17353, 179496, 1, -7963.17, -5235.39, 1.72257, 1.58825, 0, 0, 0.71325, 0.70091, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 17280 at 24.241430 yards.
(17355, 179496, 1, -8048.72, -5326.68, 8.17487, 5.42797, 0, 0, -0.414693, 0.909961, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 17278 at 19.572109 yards.
(17356, 179496, 1, -8081.23, -5284.02, 0.588573, 5.60251, 0, 0, -0.333807, 0.942641, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 17278 at 71.535370 yards.
(17357, 179496, 1, -7892.96, -5163.64, 5.33995, 0.244346, 0, 0, 0.121869, 0.992546, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 17280 at 123.713417 yards.
(17360, 179496, 1, -8058.73, -5153.32, 10.2032, 5.35816, 0, 0, -0.446198, 0.894935, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 17274 at 44.738682 yards.
(17424, 179496, 1, -7972.73, -5292.55, 0.633841, 1.8675, 0, 0, 0.803857, 0.594823, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 17280 at 47.450871 yards.
(17426, 179496, 1, -7865.37, -5116.27, 5.89815, 0.209439, 0, 0, 0.104528, 0.994522, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 17280 at 176.738312 yards.
(17446, 179496, 1, -8108.45, -5270.5, 1.85173, 4.99164, 0, 0, -0.601814, 0.798636, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 17278 at 100.183624 yards.
(17447, 179496, 1, -8089.51, -5340.05, 7.68573, 0.59341, 0, 0, 0.292371, 0.956305, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 17277 at 49.123428 yards.
(17448, 179496, 1, -7990.16, -5424.76, 1.12043, 0.418879, 0, 0, 0.207911, 0.978148, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 17279 at 45.383316 yards.
(17449, 179496, 1, -8087.64, -5305.57, 1.05312, 5.35816, 0, 0, -0.446198, 0.894935, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 17278 at 62.177383 yards.
(17450, 179496, 1, -8117.3, -5227.89, 3.96554, 5.21854, 0, 0, -0.507538, 0.861629, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 17274 at 93.188416 yards.
(17451, 179496, 1, -7971.1, -5404.14, 1.12043, 3.57793, 0, 0, -0.976295, 0.216442, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 17276 at 23.052532 yards.
(17452, 179496, 1, -7958.7, -5475.55, 12.945, 0.575957, 0, 0, 0.284015, 0.95882, 180, 180, 1, 100, 1, 10); -- Closest existing guid is 17279 at 39.349831 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(17312, 415, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Tanaris
(17313, 415, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Tanaris
(17314, 415, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Tanaris
(17315, 415, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Tanaris
(17328, 415, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Tanaris
(17353, 415, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Tanaris
(17355, 415, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Tanaris
(17356, 415, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Tanaris
(17357, 415, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Tanaris
(17360, 415, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Tanaris
(17424, 415, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Tanaris
(17426, 415, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Tanaris
(17446, 415, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Tanaris
(17447, 415, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Tanaris
(17448, 415, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Tanaris
(17449, 415, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Tanaris
(17450, 415, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Tanaris
(17451, 415, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Tanaris
(17452, 415, 0, 'Dented Footlocker', 1, 10); -- Dented Footlockers in Tanaris

UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `id` = 179496;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
