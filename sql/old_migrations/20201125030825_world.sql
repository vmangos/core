DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201125030825');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201125030825');
-- Add your query below.


-- Correct location of existing objects.
UPDATE `gameobject` SET `position_x`=461.656, `position_y`=202.05, `position_z`=42.4419, `orientation`=6.21337, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0348988, `rotation3`=0.999391 WHERE `guid`=3853;
UPDATE `gameobject` SET `position_x`=359.451, `position_y`=1396.92, `position_z`=132.017, `orientation`=0.802851, `rotation0`=0, `rotation1`=0, `rotation2`=0.390731, `rotation3`=0.920505 WHERE `guid`=3750;
UPDATE `gameobject` SET `position_x`=-2585.17, `position_y`=-2386.27, `position_z`=80.2662, `orientation`=5.32326, `rotation0`=0, `rotation1`=0, `rotation2`=-0.461748, `rotation3`=0.887011 WHERE `guid`=3531;
UPDATE `gameobject` SET `position_x`=-465.653, `position_y`=-1409.62, `position_z`=89.7087, `orientation`=5.72468, `rotation0`=0, `rotation1`=0, `rotation2`=-0.275637, `rotation3`=0.961262 WHERE `guid`=3833;
UPDATE `gameobject` SET `position_x`=-9109.17, `position_y`=-2640.52, `position_z`=120.736, `orientation`=0.0523589, `rotation0`=0, `rotation1`=0, `rotation2`=0.0261765, `rotation3`=0.999657 WHERE `guid`=3182;
UPDATE `gameobject` SET `position_x`=-4246.6, `position_y`=-2604.91, `position_z`=84.7081, `orientation`=2.51327, `rotation0`=0, `rotation1`=0, `rotation2`=0.951056, `rotation3`=0.309017 WHERE `guid`=2960;
UPDATE `gameobject` SET `position_x`=-6059.98, `position_y`=-3502.83, `position_z`=-51.4185, `orientation`=4.13643, `rotation0`=0, `rotation1`=0, `rotation2`=-0.878817, `rotation3`=0.47716 WHERE `guid`=3647;
UPDATE `gameobject` SET `position_x`=-4971.19, `position_y`=-1936.63, `position_z`=-37.8026, `orientation`=2.56563, `rotation0`=0, `rotation1`=0, `rotation2`=0.958819, `rotation3`=0.284016 WHERE `guid`=3616;
UPDATE `gameobject` SET `position_x`=-271.263, `position_y`=-1279.71, `position_z`=83.612, `orientation`=6.14356, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0697555, `rotation3`=0.997564 WHERE `guid`=3569;
UPDATE `gameobject` SET `position_x`=-3872.2, `position_y`=-2602.69, `position_z`=52.5481, `orientation`=2.14675, `rotation0`=0, `rotation1`=0, `rotation2`=0.878817, `rotation3`=0.47716 WHERE `guid`=3581;
UPDATE `gameobject` SET `position_x`=-870.382, `position_y`=1478.65, `position_z`=70.024, `orientation`=6.02139, `rotation0`=0, `rotation1`=0, `rotation2`=-0.130526, `rotation3`=0.991445 WHERE `guid`=3814;
UPDATE `gameobject` SET `position_x`=-4331.15, `position_y`=-2649.06, `position_z`=96.4845, `orientation`=3.31614, `rotation0`=0, `rotation1`=0, `rotation2`=-0.996194, `rotation3`=0.087165 WHERE `guid`=3487;
UPDATE `gameobject` SET `position_x`=-1676.69, `position_y`=1979.87, `position_z`=60.7538, `orientation`=6.26573, `rotation0`=0, `rotation1`=0, `rotation2`=-0.00872612, `rotation3`=0.999962 WHERE `guid`=3772;
UPDATE `gameobject` SET `position_x`=-4399.95, `position_y`=-1006.17, `position_z`=-53.1422, `orientation`=4.2237, `rotation0`=0, `rotation1`=0, `rotation2`=-0.857167, `rotation3`=0.515038 WHERE `guid`=3697;
UPDATE `gameobject` SET `position_x`=-9853.16, `position_y`=1047.78, `position_z`=33.4548, `orientation`=0.488691, `rotation0`=0, `rotation1`=0, `rotation2`=0.241921, `rotation3`=0.970296 WHERE `guid`=3795;


INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (1052, 1, 'Bruiseweed in Arathi Highlands', 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (1053, 1, 'Herbs in Wailing Caverns', 0, 0, 0, 10);


-- Missing spawns in Alterac Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2917, 1622, 0, -98.9951, 244.966, 53.2755, 4.67748, 0, 0, -0.719339, 0.694659, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2917, 1056, 'Bruiseweed');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2929, 1622, 0, 49.357, 437.539, 41.9076, 5.49779, 0, 0, -0.382683, 0.92388, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2929, 1056, 'Bruiseweed');

-- Missing spawns in Arathi Highlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2941, 1622, 0, -1075.52, -2794.77, 42.197, 3.6652, 0, 0, -0.965925, 0.258821, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2941, 1052, 'Bruiseweed');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3062, 1622, 0, -863.799, -2067.71, 34.5095, 4.90438, 0, 0, -0.636078, 0.771625, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3062, 1052, 'Bruiseweed');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3074, 1622, 0, -1096.9, -2921.88, 42.197, 4.71239, 0, 0, -0.707107, 0.707107, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3074, 1052, 'Bruiseweed');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3079, 1622, 0, -869.361, -2011.93, 34.3577, 1.78023, 0, 0, 0.777145, 0.629321, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3079, 1052, 'Bruiseweed');

-- Missing spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2957, 1622, 1, 2688.04, -3632.16, 99.4288, 4.53786, 0, 0, -0.766044, 0.642789, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2957, 1072, 'Bruiseweed');

-- Missing spawns in Hillsbrad Foothills.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2966, 1622, 0, -495.436, 128.488, 56.6126, 4.92183, 0, 0, -0.62932, 0.777146, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2966, 1048, 'Bruiseweed');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2969, 1622, 0, -1032.7, -258.556, 24.9987, 4.27606, 0, 0, -0.843391, 0.5373, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2969, 1048, 'Bruiseweed');

-- Missing spawns in Silverpine Forest.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2970, 1622, 0, -195.068, 955.452, 65.7338, 3.76991, 0, 0, -0.951056, 0.309017, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2970, 1047, 'Bruiseweed');

-- Missing spawns in Stonetalon Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2972, 1622, 1, -185.075, -496.055, 9.14996, 3.57793, 0, 0, -0.976295, 0.216442, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2972, 1086, 'Bruiseweed');

-- Missing spawns in Thousand Needles.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2988, 1622, 1, -4755.94, -1052.56, -55.8106, 2.56563, 0, 0, 0.958819, 0.284016, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2988, 1133, 'Bruiseweed');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3031, 1622, 1, -4652.88, -1281.84, -45.4742, 1.90241, 0, 0, 0.814116, 0.580703, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3031, 1133, 'Bruiseweed');

-- Missing spawns in Wailing Caverns.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3035, 1622, 1, -735.582, -2128.8, 66.6034, 3.45576, 0, 0, -0.987688, 0.156436, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3035, 1053, 'Bruiseweed');

-- Missing spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3043, 1622, 0, -4212.26, -2354.9, 204.552, 4.32842, 0, 0, -0.829037, 0.559194, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3043, 1150, 'Bruiseweed');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3059, 1622, 0, -3574.38, -2477.01, 72.7115, 1.76278, 0, 0, 0.771625, 0.636078, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3059, 1150, 'Bruiseweed');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
