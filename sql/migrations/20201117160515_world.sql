DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201117160515');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201117160515');
-- Add your query below.


-- Correct location of existing objects.
UPDATE `gameobject` SET `position_x`=2013.31, `position_y`=-4387.05, `position_z`=29.4598, `orientation`=3.26377, `rotation0`=0, `rotation1`=0, `rotation2`=-0.998135, `rotation3`=0.0610518 WHERE `guid`=18336;
UPDATE `gameobject` SET `position_x`=-8101.87, `position_y`=-1042.32, `position_z`=141.002, `orientation`=4.24115, `rotation0`=0, `rotation1`=0, `rotation2`=-0.85264, `rotation3`=0.522499 WHERE `guid`=18416;
UPDATE `gameobject` SET `position_x`=-6947.94, `position_y`=-411.617, `position_z`=-268.135, `orientation`=2.93214, `rotation0`=0, `rotation1`=0, `rotation2`=0.994521, `rotation3`=0.104535 WHERE `guid`=18363;
UPDATE `gameobject` SET `position_x`=6710.13, `position_y`=-5246.41, `position_z`=780.909, `orientation`=1.85005, `rotation0`=0, `rotation1`=0, `rotation2`=0.798635, `rotation3`=0.601815 WHERE `guid`=18371;

-- Missing spawns in Winterspring.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES
(18347, 175404, 1, 5199.74, -4899.9, 698.408, 5.48033, 0, 0, -0.390731, 0.920505, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(18347, 1235, 'Rich Thorium Vein');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES
(18370, 175404, 1, 4769.44, -4965.14, 895.611, 3.9619, 0, 0, -0.91706, 0.39875, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(18370, 1235, 'Rich Thorium Vein');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES
(18399, 175404, 1, 5166.9, -4775.03, 701.027, 4.46804, 0, 0, -0.788011, 0.615662, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(18399, 1235, 'Rich Thorium Vein');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES
(18404, 175404, 1, 6466.51, -3884.6, 663.217, 4.81711, 0, 0, -0.66913, 0.743145, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(18404, 1235, 'Rich Thorium Vein');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES
(18433, 175404, 1, 6556.81, -5255.44, 754.396, 4.20625, 0, 0, -0.861628, 0.507539, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(18433, 1235, 'Rich Thorium Vein');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES
(18503, 175404, 1, 6756.85, -5040.41, 730.881, 4.71239, 0, 0, -0.707107, 0.707107, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(18503, 1235, 'Rich Thorium Vein');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES
(18504, 175404, 1, 6849.58, -5146.53, 703.295, 4.18879, 0, 0, -0.866025, 0.500001, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(18504, 1235, 'Rich Thorium Vein');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES
(18514, 175404, 1, 5654.18, -4905.9, 806.267, 4.90438, 0, 0, -0.636078, 0.771625, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(18514, 1235, 'Rich Thorium Vein');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES
(18515, 175404, 1, 6654.32, -5345.31, 771.254, 5.89921, 0, 0, -0.190808, 0.981627, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(18515, 1235, 'Rich Thorium Vein');

-- Missing spawns in Western Plaguelands.
UPDATE `pool_template` SET `description`='Rich Thorium Veins in Western Plaguelands' WHERE `entry`=1264;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES
(18516, 175404, 0, 2285.39, -2334.25, 63.6795, 4.25861, 0, 0, -0.848047, 0.529921, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(18516, 1264, 'Rich Thorium Vein');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES
(18517, 175404, 0, 2284.89, -2227.45, 56.8073, 4.95674, 0, 0, -0.615661, 0.788011, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(18517, 1264, 'Rich Thorium Vein');

-- Missing spawns in Eastern Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES
(18518, 175404, 0, 2166.57, -4987.38, 56.6599, 4.15388, 0, 0, -0.874619, 0.48481, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(18518, 1274, 'Rich Thorium Vein');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES
(18519, 175404, 0, 2864.45, -5423.49, 173.813, 5.3058, 0, 0, -0.469471, 0.882948, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(18519, 1274, 'Rich Thorium Vein');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES
(18520, 175404, 0, 2733.85, -5332.87, 164.487, 2.53072, 0, 0, 0.953716, 0.300708, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(18520, 1274, 'Rich Thorium Vein');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES
(18521, 175404, 0, 2216.45, -5171.12, 55.044, 4.85202, 0, 0, -0.656058, 0.75471, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(18521, 1274, 'Rich Thorium Vein');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES
(18522, 175404, 0, 2636.65, -5313.67, 167.467, 4.25861, 0, 0, -0.848047, 0.529921, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(18522, 1274, 'Rich Thorium Vein');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES
(18523, 175404, 0, 3215.79, -4715.01, 154.944, 6.05629, 0, 0, -0.113203, 0.993572, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(18523, 1274, 'Rich Thorium Vein');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES
(18524, 175404, 0, 2482.73, -3862.86, 182.901, 4.79966, 0, 0, -0.67559, 0.737278, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(18524, 1274, 'Rich Thorium Vein');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES
(18525, 175404, 0, 3116.54, -4833.71, 108.094, 1.06465, 0, 0, 0.507538, 0.861629, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(18525, 1274, 'Rich Thorium Vein');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES
(18533, 175404, 0, 2139.89, -5152.19, 59.9362, 1.43117, 0, 0, 0.656058, 0.75471, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(18533, 1274, 'Rich Thorium Vein');

-- Missing spawns in Dire Maul.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(4301, 2, 'Dire Maul - Rich Thorium Vein', 0, 0, 1, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`) VALUES
(397161, 4301, 'Rich Thorium Vein', 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`) VALUES
(397160, 4301, 'Rich Thorium Vein', 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`) VALUES
(18539, 175404, 429, 246.195, -268.761, -52.933, 5.89921, 0, 0, -0.190808, 0.981627, 604800, 604800, 255, 1, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`) VALUES
(18539, 4301, 'Rich Thorium Vein', 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`) VALUES
(18540, 175404, 429, 288.452, -309.522, -84.566, 4.83456, 0, 0, -0.66262, 0.748956, 604800, 604800, 255, 1, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`) VALUES
(18540, 4301, 'Rich Thorium Vein', 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`) VALUES
(18545, 175404, 429, 276.913, -323.602, -90.5699, 5.42798, 0, 0, -0.414693, 0.909962, 604800, 604800, 255, 1, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`) VALUES
(18545, 4301, 'Rich Thorium Vein', 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`) VALUES
(18546, 175404, 429, 270.596, -286.689, -70.5572, 3.03684, 0, 0, 0.998629, 0.0523532, 604800, 604800, 255, 1, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`) VALUES
(18546, 4301, 'Rich Thorium Vein', 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`) VALUES
(18548, 175404, 429, 263.743, -266.911, -59.9769, 2.94959, 0, 0, 0.995396, 0.0958512, 604800, 604800, 255, 1, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`) VALUES
(18548, 4301, 'Rich Thorium Vein', 1);

-- Missing spawns in Azshara.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES
(18555, 175404, 1, 3648.63, -6378.19, -52.0457, 3.94445, 0, 0, -0.920505, 0.390732, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(18555, 1246, 'Rich Thorium Vein');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES
(18557, 175404, 1, 4210.82, -5213.95, 116.943, 4.67748, 0, 0, -0.719339, 0.694659, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(18557, 1246, 'Rich Thorium Vein');

-- Missing spawns in Burning Steppes.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES
(18563, 175404, 0, -7832, -1379.85, 159.736, 5.2709, 0, 0, -0.484809, 0.87462, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(18563, 1299, 'Rich Thorium Vein');

-- Missing spawns in Un'Goro Crater.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES 
(18566, 175404, 1, -7013.39, -237.771, -214.978, 4.17134, 0, 0, -0.870356, 0.492424, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(18566, 1217, 'Rich Thorium Vein');

-- Update animprogress to match existing spawns.
UPDATE `gameobject` SET `animprogress`=100 wHERE `id`=175404;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
