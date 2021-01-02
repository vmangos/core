DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210102165532');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210102165532');
-- Add your query below.


-- Correct location of existing objects.
UPDATE `gameobject` SET `position_x`=-3591.59, `position_y`=-2435.67, `position_z`=87.8097, `orientation`=4.11898, `rotation0`=0, `rotation1`=0, `rotation2`=-0.882947, `rotation3`=0.469473 WHERE `guid`=4196;
UPDATE `gameobject` SET `position_x`=-863.463, `position_y`=-2444.09, `position_z`=64.1538, `orientation`=4.13643, `rotation0`=0, `rotation1`=0, `rotation2`=-0.878817, `rotation3`=0.47716 WHERE `guid`=4105;
UPDATE `gameobject` SET `position_x`=-3611.91, `position_y`=-2615.64, `position_z`=74.1496, `orientation`=2.58308, `rotation0`=0, `rotation1`=0, `rotation2`=0.961261, `rotation3`=0.27564 WHERE `guid`=4218;
UPDATE `gameobject` SET `position_x`=779.101, `position_y`=625.206, `position_z`=128.977, `orientation`=2.05949, `rotation0`=0, `rotation1`=0, `rotation2`=0.857167, `rotation3`=0.515038 WHERE `guid`=4239;
UPDATE `gameobject` SET `position_x`=-5272.45, `position_y`=-1654.83, `position_z`=-38.2928, `orientation`=2.02458, `rotation0`=0, `rotation1`=0, `rotation2`=0.848047, `rotation3`=0.529921 WHERE `guid`=4246;
UPDATE `gameobject` SET `position_x`=-4296.05, `position_y`=-960.712, `position_z`=-38.4282, `orientation`=3.82227, `rotation0`=0, `rotation1`=0, `rotation2`=-0.942641, `rotation3`=0.333808 WHERE `guid`=3924;


INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (1084, 1, 'Wild Steelbloom in Badlands', 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (1209, 1, 'Wild Steelbloom in Hillsbrad Foothills', 0, 0, 0, 10);


-- Missing spawns in Arathi Highlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3629, 1623, 0, -676.339, -2124.9, 58.6958, 1.0472, 0, 0, 0.5, 0.866025, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3629, 1185, 'Wild Steelbloom');


-- Missing spawns in Badlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3601, 1623, 0, -6568.56, -2539.25, 297.132, 3.49067, 0, 0, -0.984807, 0.173652, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3601, 1084, 'Wild Steelbloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3638, 1623, 0, -6550.07, -3412.83, 283.882, 2.35619, 0, 0, 0.92388, 0.382683, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3638, 1084, 'Wild Steelbloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3663, 1623, 0, -6602.11, -2640.38, 268.07, 3.42085, 0, 0, -0.990268, 0.139175, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3663, 1084, 'Wild Steelbloom');


-- Missing spawns in Hillsbrad Foothills.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3626, 1623, 0, -402.397, -1151.77, 74.8978, 1.97222, 0, 0, 0.833885, 0.551938, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3626, 1209, 'Wild Steelbloom');


-- Missing spawns in The Barrens.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3664, 1623, 1, -4292.32, -2272.08, 109.006, 3.4034, 0, 0, -0.991445, 0.130528, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3664, 1168, 'Wild Steelbloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3699, 1623, 1, -3333.73, -1774.43, 115.264, 1.8675, 0, 0, 0.803857, 0.594823, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3699, 1168, 'Wild Steelbloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3723, 1623, 1, -2763.43, -2346.12, 145.385, 3.17653, 0, 0, -0.999847, 0.0174693, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3723, 1168, 'Wild Steelbloom');


-- Missing spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3586, 1623, 0, -3571.57, -2417.75, 75.7175, 1.25664, 0, 0, 0.587785, 0.809017, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3586, 1152, 'Wild Steelbloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3661, 1623, 0, -3517.36, -3438.22, 72.0767, 3.82227, 0, 0, -0.942641, 0.333808, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3661, 1152, 'Wild Steelbloom');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
