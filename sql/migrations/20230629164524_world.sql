DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230629164524');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230629164524');
-- Add your query below.


-- Create new pool to hold Waterlogged Footlocker spawns in Ashenvale.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(515, 6, 'Waterlogged Footlockers in Ashenvale', 1, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(47812, 515, 0, 'Waterlogged Footlocker', 1, 10);

-- Missing Waterlogged Footlocker spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(48076, 179489, 1, 3835.16, 1193.29, -50.3636, 1.62316, 0, 0, 0.725374, 0.688355, 540, 540, 1, 100, 1, 10), -- Closest existing guid is 47812 at 208.364777 yards.
(48077, 179489, 1, 3719.96, 1252.63, -58.0381, 1.13446, 0, 0, 0.537299, 0.843392, 540, 540, 1, 100, 1, 10), -- Closest existing guid is 47812 at 337.598969 yards.
(48078, 179489, 1, 4028.78, 1178.43, -21.5397, 2.21657, 0, 0, 0.894934, 0.446199, 540, 540, 1, 100, 1, 10), -- Closest existing guid is 47812 at 96.535812 yards.
(48079, 179489, 1, 3994.74, 1327.9, -26.2946, 5.60251, 0, 0, -0.333807, 0.942641, 540, 540, 1, 100, 1, 10), -- Closest existing guid is 47812 at 244.662643 yards.
(48080, 179489, 1, 3521.32, 1236.32, -47.8199, 0.855211, 0, 0, 0.414693, 0.909961, 540, 540, 1, 100, 1, 10), -- Closest existing guid is 47812 at 512.526611 yards.
(48081, 179489, 1, 3510.62, 1146.26, -9.0148, 1.78023, 0, 0, 0.777145, 0.629321, 540, 540, 1, 100, 1, 10), -- Closest existing guid is 47812 at 503.238800 yards.
(48082, 179489, 1, 3874.98, 1152.07, -34.3129, 3.12412, 0, 0, 0.999962, 0.00873464, 540, 540, 1, 100, 1, 10), -- Closest existing guid is 47812 at 151.822723 yards.
(48083, 179489, 1, 4015.19, 1242.51, -34.1204, 2.93214, 0, 0, 0.994521, 0.104536, 540, 540, 1, 100, 1, 10), -- Closest existing guid is 47812 at 159.429626 yards.
(48084, 179489, 1, 4062.42, 1247.23, -27.3153, 3.83973, 0, 0, -0.939692, 0.34202, 540, 540, 1, 100, 1, 10), -- Closest existing guid is 47812 at 171.846603 yards.
(48085, 179489, 1, 3574.67, 1274.13, -71.0363, 5.00909, 0, 0, -0.594823, 0.803857, 540, 540, 1, 100, 1, 10), -- Closest existing guid is 47812 at 477.693665 yards.
(48086, 179489, 1, 4102.22, 1216.48, -22.2307, 3.05433, 0, 0, 0.999048, 0.0436193, 540, 540, 1, 100, 1, 10), -- Closest existing guid is 47812 at 161.701935 yards.
(48087, 179489, 1, 3884.94, 1023.95, -19.8452, 2.1293, 0, 0, 0.874619, 0.48481, 540, 540, 1, 100, 1, 10), -- Closest existing guid is 47812 at 138.491150 yards.
(48088, 179489, 1, 3784.83, 1106.24, -35.5465, 1.58825, 0, 0, 0.71325, 0.70091, 540, 540, 1, 100, 1, 10), -- Closest existing guid is 47812 at 226.648819 yards.
(48089, 179489, 1, 3924.88, 1199.25, -47.6976, 3.08918, 0, 0, 0.999657, 0.0262016, 540, 540, 1, 100, 1, 10); -- Closest existing guid is 47812 at 145.972824 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(48076, 515, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Ashenvale
(48077, 515, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Ashenvale
(48078, 515, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Ashenvale
(48079, 515, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Ashenvale
(48080, 515, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Ashenvale
(48081, 515, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Ashenvale
(48082, 515, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Ashenvale
(48083, 515, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Ashenvale
(48084, 515, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Ashenvale
(48085, 515, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Ashenvale
(48086, 515, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Ashenvale
(48087, 515, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Ashenvale
(48088, 515, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Ashenvale
(48089, 515, 0, 'Waterlogged Footlocker', 1, 10); -- Waterlogged Footlockers in Ashenvale

UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `id` = 179489;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
