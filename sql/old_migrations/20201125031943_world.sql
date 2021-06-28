DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201125031943');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201125031943');
-- Add your query below.



-- Correct location of existing objects.
UPDATE `gameobject` SET `position_x`=1901.47, `position_y`=734.731, `position_z`=36.8667, `orientation`=0.191985, `rotation0`=0, `rotation1`=0, `rotation2`=0.0958452, `rotation3`=0.995396 WHERE `guid`=1698;
UPDATE `gameobject` SET `position_x`=1729.3, `position_y`=738.43, `position_z`=51.1099, `orientation`=0.750491, `rotation0`=0, `rotation1`=0, `rotation2`=0.366501, `rotation3`=0.930418 WHERE `guid`=1652;
UPDATE `gameobject` SET `position_x`=2178.24, `position_y`=71.7921, `position_z`=28.6869, `orientation`=3.47321, `rotation0`=0, `rotation1`=0, `rotation2`=-0.986285, `rotation3`=0.16505 WHERE `guid`=1453;
UPDATE `gameobject` SET `position_x`=2106.63, `position_y`=1055.04, `position_z`=33.1502, `orientation`=5.68977, `rotation0`=0, `rotation1`=0, `rotation2`=-0.292372, `rotation3`=0.956305 WHERE `guid`=1651;
UPDATE `gameobject` SET `position_x`=1166.19, `position_y`=-4927.81, `position_z`=16.5958, `orientation`=4.13643, `rotation0`=0, `rotation1`=0, `rotation2`=-0.878817, `rotation3`=0.47716 WHERE `guid`=1352;
UPDATE `gameobject` SET `position_x`=1317.86, `position_y`=-4986.07, `position_z`=2.62448, `orientation`=2.46091, `rotation0`=0, `rotation1`=0, `rotation2`=0.942641, `rotation3`=0.333808 WHERE `guid`=1676;
UPDATE `gameobject` SET `position_x`=482.284, `position_y`=-4083.93, `position_z`=30.2554, `orientation`=2.87979, `rotation0`=0, `rotation1`=0, `rotation2`=0.991445, `rotation3`=0.130528 WHERE `guid`=1543;
UPDATE `gameobject` SET `position_x`=1771.03, `position_y`=-506.915, `position_z`=40.7929, `orientation`=0.453785, `rotation0`=0, `rotation1`=0, `rotation2`=0.224951, `rotation3`=0.97437 WHERE `guid`=1549;
UPDATE `gameobject` SET `position_x`=-1819.37, `position_y`=153.606, `position_z`=25.2146, `orientation`=0.226893, `rotation0`=0, `rotation1`=0, `rotation2`=0.113203, `rotation3`=0.993572 WHERE `guid`=1615;
UPDATE `gameobject` SET `position_x`=1989.74, `position_y`=986.886, `position_z`=33.0626, `orientation`=1.0821, `rotation0`=0, `rotation1`=0, `rotation2`=0.515037, `rotation3`=0.857168 WHERE `guid`=1482;
UPDATE `gameobject` SET `position_x`=-2483.92, `position_y`=-1381.26, `position_z`=7.91413, `orientation`=2.63544, `rotation0`=0, `rotation1`=0, `rotation2`=0.968147, `rotation3`=0.250381 WHERE `guid`=1530;
UPDATE `gameobject` SET `position_x`=-1282.12, `position_y`=322.474, `position_z`=-0.953603, `orientation`=5.65487, `rotation0`=0, `rotation1`=0, `rotation2`=-0.309016, `rotation3`=0.951057 WHERE `guid`=1558;
UPDATE `gameobject` SET `position_x`=-847.561, `position_y`=-718.053, `position_z`=-20.1135, `orientation`=1.23918, `rotation0`=0, `rotation1`=0, `rotation2`=0.580703, `rotation3`=0.814116 WHERE `guid`=1638;


-- Missing spawns in Dun Morogh.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1313, 1618, 0, -5090.68, 442.544, 407.868, 6.03884, 0, 0, -0.121869, 0.992546, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1313, 1017, 'Peacebloom');

-- Missing spawns in Durotar.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1314, 1618, 1, 809.231, -5008.37, 10.3425, 0.436332, 0, 0, 0.216439, 0.976296, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1314, 1020, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1315, 1618, 1, 1049.16, -4971.99, 15.5962, 0.157079, 0, 0, 0.0784588, 0.996917, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1315, 1020, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1316, 1618, 1, 872.486, -4636.95, 14.7904, 5.63741, 0, 0, -0.317305, 0.948324, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1316, 1020, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1317, 1618, 1, 81.6812, -4855.03, 16.2339, 4.57276, 0, 0, -0.754709, 0.656059, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1317, 1020, 'Peacebloom');

-- Missing spawns in Elwynn Forest.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1318, 1618, 0, -9819.93, -1534.26, 38.1285, 0.506145, 0, 0, 0.25038, 0.968148, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1318, 1012, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1319, 1618, 0, -9401.43, -772.841, 63.7403, 2.37364, 0, 0, 0.927183, 0.374608, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1319, 1012, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1320, 1618, 0, -9724.51, -1535.47, 51.8514, 0.418879, 0, 0, 0.207912, 0.978148, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1320, 1012, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1321, 1618, 0, -9910.36, -1381.62, 30.7112, 0.85521, 0, 0, 0.414693, 0.909962, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1321, 1012, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1322, 1618, 0, -9824.13, -842.282, 40.8678, 1.64061, 0, 0, 0.731353, 0.681999, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1322, 1012, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1323, 1618, 0, -9965.29, 188.475, 32.6272, 3.76991, 0, 0, -0.951056, 0.309017, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1323, 1012, 'Peacebloom');

-- Missing spawns in Mulgore.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1324, 1618, 1, -1003.55, -983.244, 7.90341, 2.70526, 0, 0, 0.976295, 0.216442, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1324, 1026, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1325, 1618, 1, -1151.82, -648.848, -58.1973, 5.0091, 0, 0, -0.594823, 0.803857, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1325, 1026, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1326, 1618, 1, -1284.96, -776.862, -34.4384, 4.08407, 0, 0, -0.891007, 0.453991, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1326, 1026, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1327, 1618, 1, -1150.75, -917.353, -3.13117, 5.28835, 0, 0, -0.477158, 0.878817, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1327, 1026, 'Peacebloom');

-- Missing spawns in Silverpine Forest.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1328, 1618, 0, 1233.81, 933.051, 36.8226, 4.86947, 0, 0, -0.649447, 0.760406, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1328, 1041, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1329, 1618, 0, 1262.32, 1024.38, 43.5392, 2.54818, 0, 0, 0.956305, 0.292372, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1329, 1041, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1330, 1618, 0, 1298.74, 1153.24, 52.504, 0.401425, 0, 0, 0.199367, 0.979925, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1330, 1041, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1331, 1618, 0, 1348.36, 1005.2, 52.2037, 2.61799, 0, 0, 0.965925, 0.258821, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1331, 1041, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1332, 1618, 0, -246.822, 1142.97, 61.4903, 0.837758, 0, 0, 0.406736, 0.913545, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1332, 1041, 'Peacebloom');

-- Missing spawns in Teldrassil.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1333, 1618, 1, 9948.93, 1773.71, 1333.29, 0.890117, 0, 0, 0.43051, 0.902586, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1333, 1002, 'Peacebloom');

-- Missing spawns in Tirisfal Glades.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1334, 1618, 0, 2117.82, 295.336, 60.9441, 0.296705, 0, 0, 0.147809, 0.989016, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1334, 1006, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1335, 1618, 0, 1886.88, -220.493, 38.492, 4.83456, 0, 0, -0.66262, 0.748956, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1335, 1006, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1336, 1618, 0, 2363.27, 1298.64, 32.7865, 0.680677, 0, 0, 0.333806, 0.942642, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1336, 1006, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1337, 1618, 0, 2314.25, 49.2733, 31.3656, 4.93928, 0, 0, -0.622514, 0.782609, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1337, 1006, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1338, 1618, 0, 2314.62, 1553.87, 33.5216, 3.97936, 0, 0, -0.913545, 0.406738, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1338, 1006, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1339, 1618, 0, 1691.54, 646.112, 49.5556, 3.24635, 0, 0, -0.998629, 0.0523532, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1339, 1006, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1340, 1618, 0, 2458.25, 192.079, 32.4518, 4.62512, 0, 0, -0.737277, 0.675591, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1340, 1006, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1341, 1618, 0, 2689.26, 22.6892, 26.7711, 3.52557, 0, 0, -0.981627, 0.190812, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1341, 1006, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1342, 1618, 0, 2004.82, 430.121, 36.5728, 3.7001, 0, 0, -0.961261, 0.27564, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1342, 1006, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1343, 1618, 0, 2529.39, 1329.26, 28.9393, 4.06662, 0, 0, -0.894934, 0.446199, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1343, 1006, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1344, 1618, 0, 2006.02, 694.037, 41.9342, 6.0912, 0, 0, -0.0958452, 0.995396, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1344, 1006, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1354, 1618, 0, 2643.64, 916.569, 110.331, 5.044, 0, 0, -0.580703, 0.814116, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1354, 1006, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1359, 1618, 0, 2205.07, 438.51, 62.0898, 6.26573, 0, 0, -0.00872612, 0.999962, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1359, 1006, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1366, 1618, 0, 1631.95, -654.718, 47.0466, 1.39626, 0, 0, 0.642787, 0.766045, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1366, 1006, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1378, 1618, 0, 1636.3, -436.567, 44.9996, 1.02974, 0, 0, 0.492423, 0.870356, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1378, 1006, 'Peacebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1381, 1618, 0, 1801.63, -302.715, 37.7097, 0.436332, 0, 0, 0.216439, 0.976296, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1381, 1006, 'Peacebloom');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
