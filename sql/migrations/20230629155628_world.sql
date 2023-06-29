DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230629155628');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230629155628');
-- Add your query below.


-- Create new pool to hold Mossy Footlocker spawns in Azshara.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(458, 19, 'Mossy Footlockers in Azshara', 1, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(48265, 458, 0, 'Mossy Footlocker', 1, 10),
(48266, 458, 0, 'Mossy Footlocker', 1, 10),
(48267, 458, 0, 'Mossy Footlocker', 1, 10),
(48268, 458, 0, 'Mossy Footlocker', 1, 10),
(48269, 458, 0, 'Mossy Footlocker', 1, 10),
(48270, 458, 0, 'Mossy Footlocker', 1, 10),
(48271, 458, 0, 'Mossy Footlocker', 1, 10),
(48272, 458, 0, 'Mossy Footlocker', 1, 10),
(48273, 458, 0, 'Mossy Footlocker', 1, 10),
(48274, 458, 0, 'Mossy Footlocker', 1, 10),
(48275, 458, 0, 'Mossy Footlocker', 1, 10),
(48276, 458, 0, 'Mossy Footlocker', 1, 10),
(48277, 458, 0, 'Mossy Footlocker', 1, 10),
(48278, 458, 0, 'Mossy Footlocker', 1, 10),
(48279, 458, 0, 'Mossy Footlocker', 1, 10),
(48280, 458, 0, 'Mossy Footlocker', 1, 10),
(48281, 458, 0, 'Mossy Footlocker', 1, 10),
(48282, 458, 0, 'Mossy Footlocker', 1, 10);

-- Missing Mossy Footlocker spawns in Azshara.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(48285, 179497, 1, 3779.31, -5682.83, -6.04934, 2.04204, 0, 0, 0.85264, 0.522499, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 48278 at 140.613693 yards.
(48286, 179497, 1, 4237.11, -6625.9, -14.4877, 2.46091, 0, 0, 0.942641, 0.333808, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 48274 at 453.705139 yards.
(48287, 179497, 1, 3800.04, -7206.78, 26.4807, 3.45576, 0, 0, -0.987688, 0.156436, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 48267 at 33.188381 yards.
(48288, 179497, 1, 3277.67, -5710.71, -6.61303, 2.19911, 0, 0, 0.891006, 0.453991, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 48271 at 127.626930 yards.
(48289, 179497, 1, 3527.06, -5890.35, -1.50365, 5.53269, 0, 0, -0.366501, 0.930418, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 48281 at 205.239044 yards.
(48290, 179497, 1, 3706.3, -6187.47, -23.4849, 0.925024, 0, 0, 0.446198, 0.894935, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 48273 at 117.762405 yards.
(48296, 179497, 1, 3598.47, -6287.37, -33.6655, 5.2709, 0, 0, -0.484809, 0.87462, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 48270 at 78.070686 yards.
(48297, 179497, 1, 3219.52, -6446.21, -9.1047, 3.78737, 0, 0, -0.948323, 0.317306, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 48268 at 290.509552 yards.
(48298, 179497, 1, 3498.3, -6620.76, -62.1338, 1.81514, 0, 0, 0.788011, 0.615662, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 48270 at 297.558990 yards.
(48415, 179497, 1, 4133.9, -7152.86, 21.1571, 3.99681, 0, 0, -0.909961, 0.414694, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 48279 at 163.198013 yards.
(48447, 179497, 1, 3935.17, -6444.64, -19.422, 1.11701, 0, 0, 0.529919, 0.848048, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 48269 at 174.710251 yards.
(48451, 179497, 1, 3913.49, -6737.45, -22.0292, 1.51844, 0, 0, 0.688354, 0.725374, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 48274 at 250.832184 yards.
(48456, 179497, 1, 3037.61, -6043.01, -9.86239, 0.366518, 0, 0, 0.182235, 0.983255, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 48282 at 233.577972 yards.
(48463, 179497, 1, 3649.37, -5779.98, 6.49878, 3.21142, 0, 0, -0.999391, 0.0349061, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 48276 at 283.738556 yards.
(48464, 179497, 1, 4306.7, -7214.35, 27.3252, 3.63029, 0, 0, -0.970295, 0.241925, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 48280 at 249.664932 yards.
(48465, 179497, 1, 3764.99, -5758.16, -4.60572, 5.68977, 0, 0, -0.292372, 0.956305, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 48276 at 171.962708 yards.
(48466, 179497, 1, 3744, -5524.04, 19.9333, 1.58825, 0, 0, 0.71325, 0.70091, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 48278 at 195.658447 yards.
(48467, 179497, 1, 3504.52, -5616.66, 7.6661, 2.54818, 0, 0, 0.956305, 0.292372, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 48271 at 364.187592 yards.
(48468, 179497, 1, 2857.96, -6209.07, 3.10567, 3.85718, 0, 0, -0.936671, 0.35021, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 48268 at 191.500458 yards.
(48469, 179497, 1, 2689.44, -7127.38, -16.6372, 3.75246, 0, 0, -0.953716, 0.300708, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 48266 at 273.387207 yards.
(48470, 179497, 1, 3618.68, -5471.57, 43.614, 5.49779, 0, 0, -0.382683, 0.92388, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 48278 at 330.649506 yards.
(48471, 179497, 1, 3568.31, -6028.93, -14.8908, 4.41568, 0, 0, -0.803857, 0.594823, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 48273 at 148.160782 yards.
(48472, 179497, 1, 3876.6, -6504.14, -10.9378, 2.37364, 0, 0, 0.927183, 0.374608, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 48269 at 226.600647 yards.
(48484, 179497, 1, 3969.65, -6947.92, -35.0491, 1.5708, 0, 0, 0.707107, 0.707107, 180, 180, 1, 100, 1, 10); -- Closest existing guid is 48274 at 39.810982 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(48285, 458, 0, 'Mossy Footlocker', 1, 10), -- Mossy Footlockers in Azshara
(48286, 458, 0, 'Mossy Footlocker', 1, 10), -- Mossy Footlockers in Azshara
(48287, 458, 0, 'Mossy Footlocker', 1, 10), -- Mossy Footlockers in Azshara
(48288, 458, 0, 'Mossy Footlocker', 1, 10), -- Mossy Footlockers in Azshara
(48289, 458, 0, 'Mossy Footlocker', 1, 10), -- Mossy Footlockers in Azshara
(48290, 458, 0, 'Mossy Footlocker', 1, 10), -- Mossy Footlockers in Azshara
(48296, 458, 0, 'Mossy Footlocker', 1, 10), -- Mossy Footlockers in Azshara
(48297, 458, 0, 'Mossy Footlocker', 1, 10), -- Mossy Footlockers in Azshara
(48298, 458, 0, 'Mossy Footlocker', 1, 10), -- Mossy Footlockers in Azshara
(48415, 458, 0, 'Mossy Footlocker', 1, 10), -- Mossy Footlockers in Azshara
(48447, 458, 0, 'Mossy Footlocker', 1, 10), -- Mossy Footlockers in Azshara
(48451, 458, 0, 'Mossy Footlocker', 1, 10), -- Mossy Footlockers in Azshara
(48456, 458, 0, 'Mossy Footlocker', 1, 10), -- Mossy Footlockers in Azshara
(48463, 458, 0, 'Mossy Footlocker', 1, 10), -- Mossy Footlockers in Azshara
(48464, 458, 0, 'Mossy Footlocker', 1, 10), -- Mossy Footlockers in Azshara
(48465, 458, 0, 'Mossy Footlocker', 1, 10), -- Mossy Footlockers in Azshara
(48466, 458, 0, 'Mossy Footlocker', 1, 10), -- Mossy Footlockers in Azshara
(48467, 458, 0, 'Mossy Footlocker', 1, 10), -- Mossy Footlockers in Azshara
(48468, 458, 0, 'Mossy Footlocker', 1, 10), -- Mossy Footlockers in Azshara
(48469, 458, 0, 'Mossy Footlocker', 1, 10), -- Mossy Footlockers in Azshara
(48470, 458, 0, 'Mossy Footlocker', 1, 10), -- Mossy Footlockers in Azshara
(48471, 458, 0, 'Mossy Footlocker', 1, 10), -- Mossy Footlockers in Azshara
(48472, 458, 0, 'Mossy Footlocker', 1, 10), -- Mossy Footlockers in Azshara
(48484, 458, 0, 'Mossy Footlocker', 1, 10); -- Mossy Footlockers in Azshara


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
