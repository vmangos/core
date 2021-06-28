DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210102163421');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210102163421');
-- Add your query below.


-- Correct location of existing objects.
UPDATE `gameobject` SET `position_x`=-6881.08, `position_y`=-2492.59, `position_z`=246.156, `orientation`=3.94445, `rotation0`=0, `rotation1`=0, `rotation2`=-0.920505, `rotation3`=0.390732 WHERE `guid`=8016;
UPDATE `gameobject` SET `position_x`=143.652, `position_y`=-93.971, `position_z`=115.869, `orientation`=0.436332, `rotation0`=0, `rotation1`=0, `rotation2`=0.216439, `rotation3`=0.976296 WHERE `guid`=7843;
UPDATE `gameobject` SET `position_x`=-10537.3, `position_y`=-4171.27, `position_z`=22.8462, `orientation`=6.07375, `rotation0`=0, `rotation1`=0, `rotation2`=-0.104528, `rotation3`=0.994522 WHERE `guid`=8185;
UPDATE `gameobject` SET `position_x`=-4505.21, `position_y`=-3679.75, `position_z`=39.7749, `orientation`=4.97419, `rotation0`=0, `rotation1`=0, `rotation2`=-0.608761, `rotation3`=0.793354 WHERE `guid`=11971;


INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (1055, 1, 'Khadgars Whisker in Azshara', 0, 0, 0, 10);


-- Missing spawns in Arathi Highlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7065, 2043, 0, -1111.34, -3313.98, 50.7871, 1.88495, 0, 0, 0.809016, 0.587786, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7065, 1182, "Khadgar's Whisker");
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7115, 2043, 0, -873.379, -2402.82, 57.2111, 3.64774, 0, 0, -0.968147, 0.250381, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7115, 1182, "Khadgar's Whisker");
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7185, 2043, 0, -1803.52, -3141.65, 41.2629, 3.45576, 0, 0, -0.987688, 0.156436, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7185, 1182, "Khadgar's Whisker");


-- Missing spawns in Azshara.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7347, 2043, 1, 3820.44, -4898.04, 148.32, 0.244346, 0, 0, 0.121869, 0.992546, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7347, 1055, "Khadgar's Whisker");


-- Missing spawns in Dustwallow Marsh.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7201, 2043, 1, -4259.72, -3484.04, 42.4232, 3.17653, 0, 0, -0.999847, 0.0174693, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7201, 1102, "Khadgar's Whisker");
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7205, 2043, 1, -4975.66, -3709.25, 42.2869, 5.88176, 0, 0, -0.199367, 0.979925, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7205, 1102, "Khadgar's Whisker");
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7226, 2043, 1, -2673.08, -3158.31, 44.6691, 0.174532, 0, 0, 0.0871553, 0.996195, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7226, 1102, "Khadgar's Whisker");
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7244, 2043, 1, -4431.83, -3681.06, 38.826, 3.26377, 0, 0, -0.998135, 0.0610518, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7244, 1102, "Khadgar's Whisker");
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7283, 2043, 1, -3680.71, -2954.99, 34.8736, 1.46608, 0, 0, 0.66913, 0.743145, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7283, 1102, "Khadgar's Whisker");
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7327, 2043, 1, -3644.71, -2894.66, 36.3016, 4.10152, 0, 0, -0.887011, 0.461749, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7327, 1102, "Khadgar's Whisker");
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7332, 2043, 1, -3651.61, -2773.03, 35.1337, 0.558504, 0, 0, 0.275637, 0.961262, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7332, 1102, "Khadgar's Whisker");


-- Missing spawns in Feralas.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7333, 2043, 1, -3498.04, 1972.02, 44.8768, 3.89209, 0, 0, -0.930417, 0.366502, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7333, 1189, "Khadgar's Whisker");
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7346, 2043, 1, -5341.18, 1113.72, 65.19, 4.7473, 0, 0, -0.694658, 0.71934, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7346, 1189, "Khadgar's Whisker");


-- Missing spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7078, 2043, 0, -12909.8, -309.647, 14.1951, 3.15906, 0, 0, -0.999962, 0.00873464, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7078, 1173, "Khadgar's Whisker");


-- Missing spawns in Swamp of Sorrows.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7103, 2043, 0, -10201.5, -3447.1, 22.3132, 5.79449, 0, 0, -0.241921, 0.970296, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7103, 1310, "Khadgar's Whisker");
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7162, 2043, 0, -10523.5, -4182.17, 23.6343, 2.89724, 0, 0, 0.992546, 0.12187, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7162, 1310, "Khadgar's Whisker");


-- Missing spawns in The Hinterlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7163, 2043, 0, 281.061, -4074.91, 125.109, 4.17134, 0, 0, -0.870356, 0.492424, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7163, 1248, "Khadgar's Whisker");


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
