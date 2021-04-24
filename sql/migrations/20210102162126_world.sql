DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210102162126');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210102162126');
-- Add your query below.


-- Correct location of existing objects.
UPDATE `gameobject` SET `position_x`=-6732.99, `position_y`=-3184.11, `position_z`=249.668, `orientation`=5.98648, `rotation0`=0, `rotation1`=0, `rotation2`=-0.147809, `rotation3`=0.989016 WHERE `guid`=9188;
UPDATE `gameobject` SET `position_x`=-6447.5, `position_y`=-3366.45, `position_z`=244.277, `orientation`=4.08407, `rotation0`=0, `rotation1`=0, `rotation2`=-0.891007, `rotation3`=0.453991 WHERE `guid`=9083;
UPDATE `gameobject` SET `position_x`=-1033.84, `position_y`=-2618.83, `position_z`=57.3154, `orientation`=1.27409, `rotation0`=0, `rotation1`=0, `rotation2`=0.594822, `rotation3`=0.803857 WHERE `guid`=8780;
UPDATE `gameobject` SET `position_x`=129.425, `position_y`=-4091.16, `position_z`=151.222, `orientation`=6.14356, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0697555, `rotation3`=0.997564 WHERE `guid`=8975;
UPDATE `gameobject` SET `position_x`=349.219, `position_y`=-4016.42, `position_z`=122.159, `orientation`=0.872664, `rotation0`=0, `rotation1`=0, `rotation2`=0.422618, `rotation3`=0.906308 WHERE `guid`=8977;
UPDATE `gameobject` SET `position_x`=-753.136, `position_y`=-2057.97, `position_z`=39.9314, `orientation`=3.71755, `rotation0`=0, `rotation1`=0, `rotation2`=-0.958819, `rotation3`=0.284016 WHERE `guid`=9058;
UPDATE `gameobject` SET `position_x`=-1181.47, `position_y`=-3084.28, `position_z`=44.6811, `orientation`=6.17847, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0523357, `rotation3`=0.99863 WHERE `guid`=8803;


-- Missing spawns in Arathi Highlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6985, 2046, 0, -1847.43, -2637.66, 59.014, 5.0091, 0, 0, -0.594823, 0.803857, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6985, 1181, 'Goldthorn');


-- Missing spawns in Dustwallow Marsh.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6993, 2046, 1, -4974.11, -3864.3, 56.3607, 4.99164, 0, 0, -0.601814, 0.798636, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6993, 1103, 'Goldthorn');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7001, 2046, 1, -4374.49, -3313.25, 34.4254, 1.20428, 0, 0, 0.566406, 0.824126, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7001, 1103, 'Goldthorn');


-- Missing spawns in Feralas.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7002, 2046, 1, -3519.39, 1858.88, 73.0516, 3.15906, 0, 0, -0.999962, 0.00873464, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7002, 1191, 'Goldthorn');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7021, 2046, 1, -5420.75, 1183.68, 66.5455, 4.2237, 0, 0, -0.857167, 0.515038, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7021, 1191, 'Goldthorn');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7032, 2046, 1, -5868.21, 1210.25, 95.1845, 2.46091, 0, 0, 0.942641, 0.333808, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7032, 1191, 'Goldthorn');


-- Missing spawns in Scarlet Monastery.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6294, 2046, 189, 914.922, 1401.31, 18.0233, 1.15192, 0, 0, 0.544639, 0.838671, 604800, 604800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6294, 1054, 'Goldthorn');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7757, 2046, 189, 916.203, 1420.49, 17.9942, 0.244346, 0, 0, 0.121869, 0.992546, 604800, 604800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7757, 1054, 'Goldthorn');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7775, 2046, 189, 944.069, 1421.18, 18.0233, 1.37881, 0, 0, 0.636078, 0.771625, 604800, 604800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7775, 1054, 'Goldthorn');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7800, 2046, 189, 1008.59, 1436.93, 27.3057, 4.62512, 0, 0, -0.737277, 0.675591, 604800, 604800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7800, 1054, 'Goldthorn');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7814, 2046, 189, 1034.61, 1432.18, 27.3034, 6.10865, 0, 0, -0.0871553, 0.996195, 604800, 604800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7814, 1054, 'Goldthorn');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7825, 2046, 189, 1037.43, 1401.24, 27.3085, 6.02139, 0, 0, -0.130526, 0.991445, 604800, 604800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7825, 1054, 'Goldthorn');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7877, 2046, 189, 937.827, 1377.36, 18.0233, 4.71239, 0, 0, -0.707107, 0.707107, 604800, 604800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7877, 1054, 'Goldthorn');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (7887, 2046, 189, 1034.54, 1368.88, 27.3046, 2.23402, 0, 0, 0.898793, 0.438373, 604800, 604800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (7887, 1054, 'Goldthorn');


-- Missing spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6909, 2046, 0, -13053.3, -293.556, 11.6449, 4.72984, 0, 0, -0.700909, 0.713251, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6909, 1174, 'Goldthorn');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6964, 2046, 0, -13360.6, -16.135, 22.3618, 5.44543, 0, 0, -0.406736, 0.913545, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6964, 1174, 'Goldthorn');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6990, 2046, 0, -11836.9, 48.4786, 15.7018, 4.88692, 0, 0, -0.642787, 0.766045, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6990, 1174, 'Goldthorn');


-- Missing spawns in The Hinterlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6966, 2046, 0, -155.668, -4041.4, 122.494, 1.58825, 0, 0, 0.71325, 0.70091, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6966, 1249, 'Goldthorn');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
