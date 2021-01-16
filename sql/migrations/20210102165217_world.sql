DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210102165217');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210102165217');
-- Add your query below.


-- Correct location of existing objects.
UPDATE `gameobject` SET `position_x`=150.503, `position_y`=-3022.87, `position_z`=128.217, `orientation`=1.53589, `rotation0`=0, `rotation1`=0, `rotation2`=0.694658, `rotation3`=0.71934 WHERE `guid`=16213;
UPDATE `gameobject` SET `position_x`=1450.26, `position_y`=-1706.9, `position_z`=69.4751, `orientation`=5.70723, `rotation0`=0, `rotation1`=0, `rotation2`=-0.284015, `rotation3`=0.95882 WHERE `guid`=16205;
UPDATE `gameobject` SET `position_x`=-4645.59, `position_y`=1801.94, `position_z`=93.4592, `orientation`=6.00393, `rotation0`=0, `rotation1`=0, `rotation2`=-0.139173, `rotation3`=0.990268 WHERE `guid`=16267;


INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (1223, 1, 'Sungrass in Silithus', 0, 0, 0, 10);


-- Missing spawns in Azshara.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (13692, 142142, 1, 3619.93, -4289.52, 101.905, 1.48353, 0, 0, 0.67559, 0.737278, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (13692, 1240, 'Sungrass');


-- Missing spawns in Eastern Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (13684, 142142, 0, 3118.34, -4087.81, 98.5636, 1.13446, 0, 0, 0.537299, 0.843392, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (13684, 1320, 'Sungrass');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (13686, 142142, 0, 1846.9, -3946.46, 125.684, 3.22886, 0, 0, -0.999048, 0.0436193, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (13686, 1320, 'Sungrass');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (13687, 142142, 0, 1631.8, -4090.24, 151.421, 6.14356, 0, 0, -0.0697555, 0.997564, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (13687, 1320, 'Sungrass');


-- Missing spawns in Silithus.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (13691, 142142, 1, -6965.77, 366.89, 6.02273, 1.41372, 0, 0, 0.649447, 0.760406, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (13691, 1223, 'Sungrass');


-- Missing spawns in The Hinterlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (13685, 142142, 0, -13.5662, -4215.74, 121.354, 0.785397, 0, 0, 0.382683, 0.92388, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (13685, 1250, 'Sungrass');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (13688, 142142, 0, 312.959, -3978.31, 125.032, 1.51844, 0, 0, 0.688354, 0.725375, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (13688, 1250, 'Sungrass');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (13689, 142142, 0, 191.367, -4060.45, 119.505, 4.27606, 0, 0, -0.843391, 0.5373, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (13689, 1250, 'Sungrass');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (13690, 142142, 0, -223.719, -3525.59, 144.542, 1.39626, 0, 0, 0.642787, 0.766045, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (13690, 1250, 'Sungrass');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
