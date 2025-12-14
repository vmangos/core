DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230629163920');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230629163920');
-- Add your query below.


-- Create new pool to hold Waterlogged Footlocker spawns in Redridge Mountains.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(459, 12, 'Waterlogged Footlockers in Redridge Mountains', 1, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(18897, 459, 0, 'Waterlogged Footlocker', 1, 10),
(20483, 459, 0, 'Waterlogged Footlocker', 1, 10),
(20484, 459, 0, 'Waterlogged Footlocker', 1, 10),
(20485, 459, 0, 'Waterlogged Footlocker', 1, 10),
(20486, 459, 0, 'Waterlogged Footlocker', 1, 10),
(20487, 459, 0, 'Waterlogged Footlocker', 1, 10),
(20488, 459, 0, 'Waterlogged Footlocker', 1, 10),
(20489, 459, 0, 'Waterlogged Footlocker', 1, 10);

-- Create new pool to hold Waterlogged Footlocker spawns in Ashenvale.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(460, 12, 'Waterlogged Footlockers in Ashenvale', 1, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(47803, 460, 0, 'Waterlogged Footlocker', 1, 10),
(47804, 460, 0, 'Waterlogged Footlocker', 1, 10),
(47805, 460, 0, 'Waterlogged Footlocker', 1, 10),
(47806, 460, 0, 'Waterlogged Footlocker', 1, 10),
(47807, 460, 0, 'Waterlogged Footlocker', 1, 10),
(47808, 460, 0, 'Waterlogged Footlocker', 1, 10),
(47809, 460, 0, 'Waterlogged Footlocker', 1, 10);

-- Missing Waterlogged Footlocker spawns in Redridge Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(20492, 179487, 0, -9451.81, -2573.72, 37.0704, 3.07177, 0, 0, 0.999391, 0.0349061, 480, 540, 1, 100, 1, 10), -- Closest existing guid is 20485 at 36.283298 yards.
(20493, 179487, 0, -9369.86, -2570.58, 36.8449, 0.575957, 0, 0, 0.284015, 0.95882, 480, 540, 1, 100, 1, 10), -- Closest existing guid is 20486 at 33.924129 yards.
(20494, 179487, 0, -9404.34, -2575.55, 47.9735, 2.37364, 0, 0, 0.927183, 0.374608, 480, 540, 1, 100, 1, 10), -- Closest existing guid is 20485 at 42.059761 yards.
(20495, 179487, 0, -9398.21, -2524.62, 24.717, 3.33359, 0, 0, -0.995396, 0.0958512, 480, 540, 1, 100, 1, 10), -- Closest existing guid is 20486 at 21.550997 yards.
(20496, 179487, 0, -9482.21, -2474.54, 39.2688, 4.64258, 0, 0, -0.731354, 0.681998, 480, 540, 1, 100, 1, 10), -- Closest existing guid is 20489 at 46.920361 yards.
(20499, 179487, 0, -9451.42, -2521.37, 32.5952, 0.331611, 0, 0, 0.165047, 0.986286, 480, 540, 1, 100, 1, 10), -- Closest existing guid is 20485 at 31.905325 yards.
(18899, 179487, 0, -9447.61, -2466.74, 41.1327, 4.76475, 0, 0, -0.688354, 0.725374, 480, 540, 1, 100, 1, 10), -- Closest existing guid is 18897 at 49.336674 yards.
(20505, 179487, 0, -9535.76, -2469.39, 39.6929, 5.79449, 0, 0, -0.241921, 0.970296, 480, 540, 1, 100, 1, 10), -- Closest existing guid is 20489 at 51.954193 yards.
(20506, 179487, 0, -9417.94, -2486.43, 32.0577, 5.25344, 0, 0, -0.492423, 0.870356, 480, 540, 1, 100, 1, 10), -- Closest existing guid is 20485 at 59.707157 yards.
(18900, 179487, 0, -9431.91, -2438.22, 49.7343, 5.25344, 0, 0, -0.492423, 0.870356, 480, 540, 1, 100, 1, 10), -- Closest existing guid is 18897 at 41.843636 yards.
(18902, 179487, 0, -9507.71, -2422.95, 53.7339, 5.5676, 0, 0, -0.350207, 0.936672, 480, 540, 1, 100, 1, 10), -- Closest existing guid is 18897 at 36.223572 yards.
(20507, 179487, 0, -9387.96, -2626.23, 37.9692, 1.69297, 0, 0, 0.748956, 0.66262, 480, 540, 1, 100, 1, 10), -- Closest existing guid is 20488 at 32.827477 yards.
(20508, 179487, 0, -9478.94, -2538.47, 46.8134, 6.16101, 0, 0, -0.0610485, 0.998135, 480, 540, 1, 100, 1, 10), -- Closest existing guid is 20489 at 38.773190 yards.
(20509, 179487, 0, -9507.08, -2696.54, 43.0157, 0.645772, 0, 0, 0.317305, 0.948324, 480, 540, 1, 100, 1, 10), -- Closest existing guid is 20487 at 45.297058 yards.
(20510, 179487, 0, -9452.85, -2625.65, 41.1664, 2.87979, 0, 0, 0.991445, 0.130528, 480, 540, 1, 100, 1, 10), -- Closest existing guid is 20487 at 78.357224 yards.
(20513, 179487, 0, -9464.15, -2597.7, 42.5076, 0.767944, 0, 0, 0.374606, 0.927184, 480, 540, 1, 100, 1, 10), -- Closest existing guid is 20485 at 63.414806 yards.
(20515, 179487, 0, -9495.78, -2562.44, 50.6315, 0.680677, 0, 0, 0.333806, 0.942642, 480, 540, 1, 100, 1, 10), -- Closest existing guid is 20489 at 51.160946 yards.
(20516, 179487, 0, -9409.14, -2700.31, 49.0647, 2.44346, 0, 0, 0.939692, 0.34202, 480, 540, 1, 100, 1, 10), -- Closest existing guid is 20484 at 53.139156 yards.
(20520, 179487, 0, -9436.4, -2736.28, 42.7393, 1.8675, 0, 0, 0.803857, 0.594823, 480, 540, 1, 100, 1, 10), -- Closest existing guid is 20487 at 42.203209 yards.
(20522, 179487, 0, -9431.7, -2605.68, 43.5151, 3.01941, 0, 0, 0.998135, 0.0610518, 480, 540, 1, 100, 1, 10), -- Closest existing guid is 20485 at 61.463299 yards.
(20523, 179487, 0, -9484.73, -2616.82, 45.5676, 2.44346, 0, 0, 0.939692, 0.34202, 480, 540, 1, 100, 1, 10); -- Closest existing guid is 20487 at 89.620819 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(20492, 459, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Redridge Mountains
(20493, 459, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Redridge Mountains
(20494, 459, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Redridge Mountains
(20495, 459, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Redridge Mountains
(20496, 459, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Redridge Mountains
(20499, 459, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Redridge Mountains
(18899, 459, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Redridge Mountains
(20505, 459, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Redridge Mountains
(20506, 459, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Redridge Mountains
(18900, 459, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Redridge Mountains
(18902, 459, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Redridge Mountains
(20507, 459, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Redridge Mountains
(20508, 459, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Redridge Mountains
(20509, 459, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Redridge Mountains
(20510, 459, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Redridge Mountains
(20513, 459, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Redridge Mountains
(20515, 459, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Redridge Mountains
(20516, 459, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Redridge Mountains
(20520, 459, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Redridge Mountains
(20522, 459, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Redridge Mountains
(20523, 459, 0, 'Waterlogged Footlocker', 1, 10); -- Waterlogged Footlockers in Redridge Mountains

-- Missing Waterlogged Footlocker spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(47829, 179487, 1, 3595.42, 1129.77, 1.17463, 5.00909, 0, 0, -0.594823, 0.803857, 480, 540, 1, 100, 1, 10), -- Closest existing guid is 47808 at 205.183517 yards.
(48037, 179487, 1, 3516.24, 1073.22, 12.6221, 4.50295, 0, 0, -0.777145, 0.629321, 480, 540, 1, 100, 1, 10), -- Closest existing guid is 47804 at 162.567383 yards.
(48038, 179487, 1, 3557.53, 1023.29, -1.39948, 5.044, 0, 0, -0.580703, 0.814116, 480, 540, 1, 100, 1, 10), -- Closest existing guid is 47808 at 121.158485 yards.
(48048, 179487, 1, 3535.29, 948.418, 3.52732, 4.97419, 0, 0, -0.608761, 0.793354, 480, 540, 1, 100, 1, 10), -- Closest existing guid is 47804 at 62.156399 yards.
(48049, 179487, 1, 3570.23, 937.069, 2.06354, 0.645772, 0, 0, 0.317305, 0.948324, 480, 540, 1, 100, 1, 10), -- Closest existing guid is 47808 at 62.568523 yards.
(48050, 179487, 1, 4097.43, 924.64, 5.39245, 2.63544, 0, 0, 0.968147, 0.250381, 480, 540, 1, 100, 1, 10), -- Closest existing guid is 47809 at 85.476517 yards.
(48051, 179487, 1, 4049.47, 883.908, -0.795611, 1.62316, 0, 0, 0.725374, 0.688355, 480, 540, 1, 100, 1, 10), -- Closest existing guid is 47807 at 63.580658 yards.
(48052, 179487, 1, 3786.11, 867.023, 0.436485, 3.78737, 0, 0, -0.948323, 0.317306, 480, 540, 1, 100, 1, 10), -- Closest existing guid is 47808 at 165.602173 yards.
(48053, 179487, 1, 4191.96, 1288.67, 0.907915, 5.25344, 0, 0, -0.492423, 0.870356, 480, 540, 1, 100, 1, 10), -- Closest existing guid is 47803 at 64.166489 yards.
(48054, 179487, 1, 3616.25, 878.275, -2.91687, 0.488691, 0, 0, 0.241921, 0.970296, 480, 540, 1, 100, 1, 10), -- Closest existing guid is 47808 at 52.401531 yards.
(48055, 179487, 1, 3514.91, 1013.07, 2.22407, 0.0174525, 0, 0, 0.00872612, 0.999962, 480, 540, 1, 100, 1, 10), -- Closest existing guid is 47804 at 103.838509 yards.
(48056, 179487, 1, 3694.63, 985.968, 2.10302, 4.4855, 0, 0, -0.782608, 0.622515, 480, 540, 1, 100, 1, 10), -- Closest existing guid is 47808 at 85.320465 yards.
(48057, 179487, 1, 3667.76, 943.347, 3.40273, 4.15388, 0, 0, -0.874619, 0.48481, 480, 540, 1, 100, 1, 10), -- Closest existing guid is 47808 at 38.849751 yards.
(48058, 179487, 1, 3909.48, 892.834, -4.36562, 4.38078, 0, 0, -0.814116, 0.580703, 480, 540, 1, 100, 1, 10), -- Closest existing guid is 47806 at 100.364594 yards.
(48068, 179487, 1, 3905.87, 955.496, 1.75919, 2.28638, 0, 0, 0.909961, 0.414694, 480, 540, 1, 100, 1, 10), -- Closest existing guid is 47806 at 160.699738 yards.
(48069, 179487, 1, 3686.23, 896.725, 1.30081, 2.70526, 0, 0, 0.976295, 0.216442, 480, 540, 1, 100, 1, 10), -- Closest existing guid is 47808 at 62.463776 yards.
(48070, 179487, 1, 3822.12, 815.942, 2.11093, 0.802851, 0, 0, 0.390731, 0.920505, 480, 540, 1, 100, 1, 10), -- Closest existing guid is 47806 at 123.191643 yards.
(48071, 179487, 1, 3635.48, 1058.9, 1.27651, 4.36332, 0, 0, -0.819152, 0.573577, 480, 540, 1, 100, 1, 10), -- Closest existing guid is 47808 at 131.049622 yards.
(48072, 179487, 1, 3897.08, 848.288, 4.98377, 3.45576, 0, 0, -0.987688, 0.156436, 480, 540, 1, 100, 1, 10), -- Closest existing guid is 47806 at 67.781120 yards.
(48073, 179487, 1, 3667.58, 842.233, 5.34729, 6.17847, 0, 0, -0.0523357, 0.99863, 480, 540, 1, 100, 1, 10), -- Closest existing guid is 47808 at 92.755241 yards.
(48074, 179487, 1, 3538.53, 915.577, 4.53245, 6.23083, 0, 0, -0.0261765, 0.999657, 480, 540, 1, 100, 1, 10), -- Closest existing guid is 47804 at 55.094376 yards.
(48075, 179487, 1, 3722.14, 904.603, 0.96701, 2.02458, 0, 0, 0.848047, 0.529921, 480, 540, 1, 100, 1, 10); -- Closest existing guid is 47808 at 93.001556 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(47829, 460, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Ashenvale
(48037, 460, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Ashenvale
(48038, 460, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Ashenvale
(48048, 460, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Ashenvale
(48049, 460, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Ashenvale
(48050, 460, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Ashenvale
(48051, 460, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Ashenvale
(48052, 460, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Ashenvale
(48053, 460, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Ashenvale
(48054, 460, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Ashenvale
(48055, 460, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Ashenvale
(48056, 460, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Ashenvale
(48057, 460, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Ashenvale
(48058, 460, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Ashenvale
(48068, 460, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Ashenvale
(48069, 460, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Ashenvale
(48070, 460, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Ashenvale
(48071, 460, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Ashenvale
(48072, 460, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Ashenvale
(48073, 460, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Ashenvale
(48074, 460, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Ashenvale
(48075, 460, 0, 'Waterlogged Footlocker', 1, 10); -- Waterlogged Footlockers in Ashenvale

UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `id` = 179487;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
