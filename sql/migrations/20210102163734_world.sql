DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210102163734');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210102163734');
-- Add your query below.


-- Correct location of existing objects.
UPDATE `gameobject` SET `position_x`=-6447, `position_y`=-3315.48, `position_z`=241.667, `orientation`=2.91469, `rotation0`=0, `rotation1`=0, `rotation2`=0.993571, `rotation3`=0.113208 WHERE `guid`=4321;
UPDATE `gameobject` SET `position_x`=-855.681, `position_y`=88.6056, `position_z`=39.3379, `orientation`=1.309, `rotation0`=0, `rotation1`=0, `rotation2`=0.608761, `rotation3`=0.793354 WHERE `guid`=4409;
UPDATE `gameobject` SET `position_x`=-96.4679, `position_y`=-58.3431, `position_z`=142.345, `orientation`=5.55015, `rotation0`=0, `rotation1`=0, `rotation2`=-0.358368, `rotation3`=0.933581 WHERE `guid`=33197;
UPDATE `gameobject` SET `position_x`=-305.608, `position_y`=-560.832, `position_z`=55.8194, `orientation`=5.42798, `rotation0`=0, `rotation1`=0, `rotation2`=-0.414693, `rotation3`=0.909962 WHERE `guid`=4350;
UPDATE `gameobject` SET `position_x`=-6616.12, `position_y`=-3272.91, `position_z`=241.628, `orientation`=0.541051, `rotation0`=0, `rotation1`=0, `rotation2`=0.267238, `rotation3`=0.963631 WHERE `guid`=4336;
UPDATE `gameobject` SET `position_x`=-2414.87, `position_y`=-3147.57, `position_z`=33.3783, `orientation`=0.558504, `rotation0`=0, `rotation1`=0, `rotation2`=0.275637, `rotation3`=0.961262 WHERE `guid`=12566;
UPDATE `gameobject` SET `position_x`=-3119.02, `position_y`=-2246.05, `position_z`=94.0295, `orientation`=1.18682, `rotation0`=0, `rotation1`=0, `rotation2`=0.559193, `rotation3`=0.829038 WHERE `guid`=4390;


-- Missing spawns in Alterac Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3938, 1624, 0, 55.5641, -50.3888, 99.1906, 5.044, 0, 0, -0.580703, 0.814116, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3938, 1057, 'Kingsblood');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3964, 1624, 0, -128.134, 349.505, 84.4771, 5.70723, 0, 0, -0.284015, 0.95882, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3964, 1057, 'Kingsblood');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (4029, 1624, 0, -190.381, 251.907, 89.6564, 4.32842, 0, 0, -0.829037, 0.559194, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (4029, 1057, 'Kingsblood');


-- Missing spawns in Arathi Highlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (4021, 1624, 0, -1250.13, -3383.25, 37.3728, 2.84488, 0, 0, 0.989016, 0.147811, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (4021, 1180, 'Kingsblood');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (4030, 1624, 0, -1816.56, -2881.86, 61.0276, 1.91986, 0, 0, 0.819152, 0.573577, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (4030, 1180, 'Kingsblood');


-- Missing spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (9854, 1624, 1, 3152.67, -1811.98, 175.534, 6.21337, 0, 0, -0.0348988, 0.999391, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (9854, 1078, 'Kingsblood');

-- Missing spawns in Badlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3920, 1624, 0, -6813.04, -2683.8, 241.826, 4.08407, 0, 0, -0.891007, 0.453991, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3920, 1284, 'Kingsblood');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3921, 1624, 0, -6718.24, -3248.64, 240.744, 1.41372, 0, 0, 0.649447, 0.760406, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3921, 1284, 'Kingsblood');


-- Missing spawns in Desolace.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (10371, 1624, 1, -1646.38, 2346.47, 88.3708, 0.418879, 0, 0, 0.207912, 0.978148, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (10371, 1138, 'Kingsblood');


-- Missing spawns in Dustwallow Marsh.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (4046, 1624, 1, -2837.37, -2825.55, 34.6673, 3.35105, 0, 0, -0.994521, 0.104535, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (4046, 1039, 'Kingsblood');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (9856, 1624, 1, -2720.66, -3549.57, 33.7416, 5.86431, 0, 0, -0.207912, 0.978148, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (9856, 1039, 'Kingsblood');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (9861, 1624, 1, -2799.21, -3227.14, 31.9061, 4.20625, 0, 0, -0.861628, 0.507539, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (9861, 1039, 'Kingsblood');

-- Missing spawns in Hillsbrad Foothills.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3965, 1624, 0, -443.955, 218.854, 80.0781, 1.83259, 0, 0, 0.793353, 0.608762, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3965, 1051, 'Kingsblood');

-- Missing spawns in Scarlet Monastery.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (10445, 1624, 189, 1796.03, 1417.5, 14.4893, 3.59538, 0, 0, -0.97437, 0.224951, 604800, 604800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (10445, 1054, 'Kingsblood');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (12027, 1624, 189, 1746.37, 1410.68, 22.1887, 0.226893, 0, 0, 0.113203, 0.993572, 604800, 604800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (12027, 1054, 'Kingsblood');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (12679, 1624, 189, 1739.89, 1377.57, 17.521, 5.21854, 0, 0, -0.507538, 0.861629, 604800, 604800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (12679, 1054, 'Kingsblood');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (14457, 1624, 189, 1836.24, 1408.23, 21.7179, 2.51327, 0, 0, 0.951056, 0.309017, 604800, 604800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (14457, 1054, 'Kingsblood');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (14459, 1624, 189, 1818.8, 1241, 17.5499, 3.90954, 0, 0, -0.927183, 0.374608, 604800, 604800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (14459, 1054, 'Kingsblood');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (17730, 1624, 189, 1775.33, 1288.49, 17.5497, 3.73501, 0, 0, -0.956305, 0.292372, 604800, 604800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (17730, 1054, 'Kingsblood');


-- Missing spawns in Stonetalon Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (10294, 1624, 1, 1727.06, 791.881, 134.26, 2.37364, 0, 0, 0.927183, 0.374608, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (10294, 1088, 'Kingsblood');


-- Missing spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3953, 1624, 0, -12451.9, -11.4759, 2.76284, 3.76991, 0, 0, -0.951056, 0.309017, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3953, 1170, 'Kingsblood');


-- Missing spawns in Swamp of Sorrows.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3946, 1624, 0, -10348.1, -3110.08, 22.1766, 4.85202, 0, 0, -0.656058, 0.75471, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3946, 1326, 'Kingsblood');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3948, 1624, 0, -10305.2, -4099.95, 22.0213, 0.610863, 0, 0, 0.300705, 0.953717, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3948, 1326, 'Kingsblood');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3991, 1624, 0, -10538.6, -4057.57, 21.6968, 1.09956, 0, 0, 0.522498, 0.852641, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3991, 1326, 'Kingsblood');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3995, 1624, 0, -10741.6, -4204.1, 21.8815, 1.48353, 0, 0, 0.67559, 0.737278, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3995, 1326, 'Kingsblood');


-- Missing spawns in The Barrens.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (4038, 1624, 1, -2381.14, -2293.68, 91.6667, 2.25147, 0, 0, 0.902585, 0.430512, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (4038, 1038, 'Kingsblood');                        
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (4043, 1624, 1, -3652.89, -2094.61, 92.8224, 2.11185, 0, 0, 0.870356, 0.492424, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (4043, 1038, 'Kingsblood');


-- Missing spawns in Thousand Needles.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (10415, 1624, 1, -5371.23, -1649.36, -54.8743, 0.575957, 0, 0, 0.284015, 0.95882, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (10415, 1136, 'Kingsblood');


-- Missing spawns in Wailing Caverns.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (4032, 1624, 1, -583.072, -2260.18, 38.7323, 0.785397, 0, 0, 0.382683, 0.92388, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (4032, 1053, 'Kingsblood');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (4036, 1624, 1, -564.824, -2200.06, 50.2902, 5.044, 0, 0, -0.580703, 0.814116, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (4036, 1053, 'Kingsblood');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (10429, 1624, 1, -682.903, -2338.59, 17.1252, 1.36136, 0, 0, 0.62932, 0.777146, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (10429, 1053, 'Kingsblood');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (10441, 1624, 1, -605.093, -2352.9, 24.3262, 4.67748, 0, 0, -0.719339, 0.694659, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (10441, 1053, 'Kingsblood');


-- Missing spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (3963, 1624, 0, -3936.86, -2670.8, 36.8535, 6.02139, 0, 0, -0.130526, 0.991445, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (3963, 1155, 'Kingsblood');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (4008, 1624, 0, -3484.03, -2444.53, 47.452, 1.02974, 0, 0, 0.492423, 0.870356, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (4008, 1155, 'Kingsblood');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (4027, 1624, 0, -3367.87, -3122.86, 25.0722, 4.76475, 0, 0, -0.688354, 0.725375, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (4027, 1155, 'Kingsblood');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
