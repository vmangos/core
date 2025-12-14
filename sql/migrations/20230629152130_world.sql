DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230629152130');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230629152130');
-- Add your query below.


-- Create new pool to hold Dented Footlocker spawns in Badlands.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(416, 5, 'Dented Footlockers in Badlands', 1, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(11496, 416, 0, 'Dented Footlocker', 1, 10),
(11497, 416, 0, 'Dented Footlocker', 1, 10),
(11498, 416, 0, 'Dented Footlocker', 1, 10),
(11499, 416, 0, 'Dented Footlocker', 1, 10);

-- Missing Dented Footlocker spawns in Badlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(11505, 179492, 0, -6354.1, -3110.97, 285.278, 2.53072, 0, 0, 0.953716, 0.300708, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 11497 at 16.270391 yards.
(11506, 179492, 0, -6341.45, -3112.8, 293.056, 2.49582, 0, 0, 0.948323, 0.317306, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 11497 at 12.244774 yards.
(11507, 179492, 0, -6376.45, -3125.57, 283.889, 5.61996, 0, 0, -0.325567, 0.945519, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 11499 at 16.878023 yards.
(11508, 179492, 0, -6368.76, -3132.49, 284.563, 1.29154, 0, 0, 0.601814, 0.798636, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 11499 at 8.145582 yards.
(11509, 179492, 0, -6375.28, -3119.65, 283.889, 6.10865, 0, 0, -0.0871553, 0.996195, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 11499 at 18.865578 yards.
(11511, 179492, 0, -6340.54, -3126.39, 293.057, 0.890117, 0, 0, 0.430511, 0.902586, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 11499 at 22.744701 yards.
(11512, 179492, 0, -6349.47, -3066.05, 301.111, 5.89921, 0, 0, -0.190808, 0.981627, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 11496 at 27.809978 yards.
(11513, 179492, 0, -6356.58, -3126.73, 283.889, 2.40855, 0, 0, 0.93358, 0.358368, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 11499 at 6.380174 yards.
(11514, 179492, 0, -6334.34, -3121.7, 293.057, 4.13643, 0, 0, -0.878817, 0.47716, 180, 180, 1, 100, 1, 10); -- Closest existing guid is 11497 at 23.009706 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(11505, 416, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Badlands
(11506, 416, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Badlands
(11507, 416, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Badlands
(11508, 416, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Badlands
(11509, 416, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Badlands
(11511, 416, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Badlands
(11512, 416, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Badlands
(11513, 416, 0, 'Dented Footlocker', 1, 10), -- Dented Footlockers in Badlands
(11514, 416, 0, 'Dented Footlocker', 1, 10); -- Dented Footlockers in Badlands

UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `id` = 179492;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
