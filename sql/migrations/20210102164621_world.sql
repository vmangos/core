DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210102164621');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210102164621');
-- Add your query below.


-- Correct location of existing objects.
UPDATE `gameobject` SET `position_x`=1037.78, `position_y`=1133.19, `position_z`=44.5143, `orientation`=5.8294, `rotation0`=0, `rotation1`=0, `rotation2`=-0.224951, `rotation3`=0.97437 WHERE `guid`=1042;
UPDATE `gameobject` SET `position_x`=2177.47, `position_y`=759.348, `position_z`=35.6046, `orientation`=0.366518, `rotation0`=0, `rotation1`=0, `rotation2`=0.182235, `rotation3`=0.983255 WHERE `guid`=1103;
UPDATE `gameobject` SET `position_x`=2294.16, `position_y`=1106.62, `position_z`=35.745, `orientation`=2.3911, `rotation0`=0, `rotation1`=0, `rotation2`=0.930417, `rotation3`=0.366502 WHERE `guid`=980;
UPDATE `gameobject` SET `position_x`=1256.76, `position_y`=1151.34, `position_z`=50.9408, `orientation`=0.226893, `rotation0`=0, `rotation1`=0, `rotation2`=0.113203, `rotation3`=0.993572 WHERE `guid`=515;
UPDATE `gameobject` SET `position_x`=1107.05, `position_y`=1313.31, `position_z`=37.6295, `orientation`=5.72468, `rotation0`=0, `rotation1`=0, `rotation2`=-0.275637, `rotation3`=0.961262 WHERE `guid`=1128;
UPDATE `gameobject` SET `position_x`=1109.29, `position_y`=1928.59, `position_z`=15.1003, `orientation`=4.85202, `rotation0`=0, `rotation1`=0, `rotation2`=-0.656058, `rotation3`=0.75471 WHERE `guid`=993;
UPDATE `gameobject` SET `position_x`=2062.22, `position_y`=948.025, `position_z`=38.142, `orientation`=4.01426, `rotation0`=0, `rotation1`=0, `rotation2`=-0.906307, `rotation3`=0.422619 WHERE `guid`=641;
UPDATE `gameobject` SET `position_x`=-1433.81, `position_y`=-370.969, `position_z`=-43.0002, `orientation`=3.83973, `rotation0`=0, `rotation1`=0, `rotation2`=-0.939692, `rotation3`=0.342021 WHERE `guid`=638;
UPDATE `gameobject` SET `position_x`=478.513, `position_y`=-4947.25, `position_z`=33.4624, `orientation`=1.79769, `rotation0`=0, `rotation1`=0, `rotation2`=0.782608, `rotation3`=0.622515 WHERE `guid`=615;
UPDATE `gameobject` SET `position_x`=-1281.33, `position_y`=-396.379, `position_z`=-38.5493, `orientation`=2.80997, `rotation0`=0, `rotation1`=0, `rotation2`=0.986285, `rotation3`=0.16505 WHERE `guid`=647;
UPDATE `gameobject` SET `position_x`=-255.43, `position_y`=-4707.5, `position_z`=34.3226, `orientation`=3.80482, `rotation0`=0, `rotation1`=0, `rotation2`=-0.945518, `rotation3`=0.325568 WHERE `guid`=1090;
UPDATE `gameobject` SET `position_x`=-1935.18, `position_y`=118.191, `position_z`=36.5683, `orientation`=0.733038, `rotation0`=0, `rotation1`=0, `rotation2`=0.358368, `rotation3`=0.933581 WHERE `guid`=594;
UPDATE `gameobject` SET `position_x`=-2083.43, `position_y`=103.156, `position_z`=46.6551, `orientation`=4.79966, `rotation0`=0, `rotation1`=0, `rotation2`=-0.67559, `rotation3`=0.737278 WHERE `guid`=1129;
UPDATE `gameobject` SET `position_x`=-2049.12, `position_y`=-291.195, `position_z`=-7.16006, `orientation`=1.43117, `rotation0`=0, `rotation1`=0, `rotation2`=0.656058, `rotation3`=0.75471 WHERE `guid`=830;
UPDATE `gameobject` SET `position_x`=-1571.92, `position_y`=-575.409, `position_z`=-48.7972, `orientation`=2.58308, `rotation0`=0, `rotation1`=0, `rotation2`=0.961261, `rotation3`=0.27564 WHERE `guid`=743;

-- Missing spawns in Durotar.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (10264, 1617, 1, 1402.2, -4671.18, 32.9784, 2.02458, 0, 0, 0.848047, 0.529921, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (10264, 1022, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (10376, 1617, 1, 654.602, -4906.94, 25.1601, 4.64258, 0, 0, -0.731354, 0.681998, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (10376, 1022, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (10397, 1617, 1, 821.031, -4890.18, 35.3849, 1.0472, 0, 0, 0.5, 0.866025, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (10397, 1022, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (10398, 1617, 1, 1056.99, -5000.04, 17.4907, 4.92183, 0, 0, -0.62932, 0.777146, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (10398, 1022, 'Silverleaf');

-- Missing spawns in Elwynn Forest.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (748, 1617, 0, -9127.98, -15.8528, 85.698, 6.14356, 0, 0, -0.0697555, 0.997564, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (748, 1013, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (914, 1617, 0, -10004.4, -51.3555, 30.7997, 6.23083, 0, 0, -0.0261765, 0.999657, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (914, 1013, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (954, 1617, 0, -10009.4, 465.371, 31.1393, 1.25664, 0, 0, 0.587785, 0.809017, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (954, 1013, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1035, 1617, 0, -9394.66, -1293.73, 54.1131, 2.25147, 0, 0, 0.902585, 0.430512, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1035, 1013, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1079, 1617, 0, -9442.58, -1496.34, 63.4883, 5.77704, 0, 0, -0.25038, 0.968148, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1079, 1013, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1080, 1617, 0, -9740.14, -1205.03, 45.0785, 2.04204, 0, 0, 0.85264, 0.522499, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1080, 1013, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1095, 1617, 0, -9737.88, 727.222, 27.5254, 1.69297, 0, 0, 0.748956, 0.66262, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1095, 1013, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1113, 1617, 0, -9785.34, 225.803, 44.7786, 5.86431, 0, 0, -0.207912, 0.978148, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1113, 1013, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1156, 1617, 0, -9198.81, -1258.92, 77.0887, 0.314158, 0, 0, 0.156434, 0.987688, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1156, 1013, 'Silverleaf');

-- Missing spawns in Loch Modan.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (588, 1617, 0, -4749.33, -3077.36, 313.461, 5.96903, 0, 0, -0.156434, 0.987688, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (588, 1162, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (614, 1617, 0, -4884.1, -3106.54, 322.733, 2.1293, 0, 0, 0.874619, 0.48481, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (614, 1162, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1172, 1617, 0, -4837.14, -2743.59, 326.137, 4.20625, 0, 0, -0.861628, 0.507539, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1172, 1162, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1179, 1617, 0, -5443.69, -2982.44, 356.83, 5.86431, 0, 0, -0.207912, 0.978148, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1179, 1162, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (9720, 1617, 0, -5108.3, -2945.94, 334.151, 5.77704, 0, 0, -0.25038, 0.968148, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (9720, 1162, 'Silverleaf');

-- Missing spawns in Mulgore.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (10262, 1617, 1, -1240.85, -573.591, -55.5674, 6.10865, 0, 0, -0.0871553, 0.996195, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (10262, 1027, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (10278, 1617, 1, -1395.45, -244.261, 3.18103, 3.45576, 0, 0, -0.987688, 0.156436, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (10278, 1027, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (10291, 1617, 1, -2813.88, 244.206, 79.3017, 1.01229, 0, 0, 0.484809, 0.87462, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (10291, 1027, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (10627, 1617, 1, -909.978, -990.789, 23.0142, 0.890117, 0, 0, 0.43051, 0.902586, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (10627, 1027, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (10639, 1617, 1, -2257.43, 235.841, 81.6378, 3.85718, 0, 0, -0.936671, 0.35021, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (10639, 1027, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (10640, 1617, 1, -935.092, -851.219, 3.78136, 4.67748, 0, 0, -0.719339, 0.694659, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (10640, 1027, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (18277, 1617, 1, -2483.28, -920.769, -4.42509, 2.86233, 0, 0, 0.990268, 0.139175, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (18277, 1027, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (19969, 1617, 1, -906.076, -97.406, 2.42219, 1.98967, 0, 0, 0.83867, 0.54464, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (19969, 1027, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (18271, 1617, 1, -940.065, 15.0219, 16.501, 5.96903, 0, 0, -0.156434, 0.987688, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (18271, 1027, 'Silverleaf');

-- Missing spawns in Silverpine Forest.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (582, 1617, 0, 1397.55, 1006.83, 53.7419, 1.0821, 0, 0, 0.515037, 0.857168, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (582, 1042, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (788, 1617, 0, 992.227, 1595.33, 30.3211, 3.71755, 0, 0, -0.958819, 0.284016, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (788, 1042, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (960, 1617, 0, 896.103, 1337.66, 45.1423, 1.93731, 0, 0, 0.824125, 0.566408, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (960, 1042, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (8402, 1617, 0, 1129.89, 1426.89, 37.3946, 3.57793, 0, 0, -0.976295, 0.216442, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (8402, 1042, 'Silverleaf');

-- Missing spawns in Teldrassil.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (10283, 1617, 1, 10232, 1437.95, 1332.42, 1.02974, 0, 0, 0.492423, 0.870356, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (10283, 1003, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (19972, 1617, 1, 10044.2, 1254.35, 1325.02, 4.95674, 0, 0, -0.615661, 0.788011, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (19972, 1003, 'Silverleaf');

-- Missing spawns in Tirisfal Glades.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (475, 1617, 0, 2060.01, 4.3954, 43.3182, 0.925024, 0, 0, 0.446198, 0.894934, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (475, 1007, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (500, 1617, 0, 1701.92, 705.036, 63.8095, 2.28638, 0, 0, 0.909961, 0.414694, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (500, 1007, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (557, 1617, 0, 2504.55, 276.301, 45.7606, 2.56563, 0, 0, 0.958819, 0.284016, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (557, 1007, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (569, 1617, 0, 2717.51, 236.582, 34.224, 1.3439, 0, 0, 0.622514, 0.782609, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (569, 1007, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (587, 1617, 0, 2928.26, 384.147, 32.2781, 0.733038, 0, 0, 0.358368, 0.933581, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (587, 1007, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (607, 1617, 0, 2357.97, 33.8889, 26.3059, 4.39823, 0, 0, -0.809016, 0.587786, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (607, 1007, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (626, 1617, 0, 2315.77, 1683.72, 46.5538, 4.92183, 0, 0, -0.62932, 0.777146, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (626, 1007, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (637, 1617, 0, 2228.95, 1147.06, 37.3862, 3.9619, 0, 0, -0.91706, 0.39875, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (637, 1007, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (677, 1617, 0, 2196.37, -359.505, 75.1928, 0.279252, 0, 0, 0.139173, 0.990268, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (677, 1007, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (757, 1617, 0, 1670.8, -412.24, 44.7601, 2.23402, 0, 0, 0.898793, 0.438373, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (757, 1007, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (801, 1617, 0, 2254.86, 623.59, 34.8548, 6.00393, 0, 0, -0.139173, 0.990268, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (801, 1007, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (825, 1617, 0, 2200.77, 789.698, 34.3001, 3.54302, 0, 0, -0.979924, 0.19937, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (825, 1007, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (832, 1617, 0, 2842.78, 23.8514, 26.0168, 3.82227, 0, 0, -0.942641, 0.333808, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (832, 1007, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (863, 1617, 0, 1966.1, -593.648, 56.9309, 2.42601, 0, 0, 0.936672, 0.350207, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (863, 1007, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (880, 1617, 0, 2937.52, 1069.4, 98.3469, 6.17847, 0, 0, -0.0523357, 0.99863, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (880, 1007, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (895, 1617, 0, 2849.01, 257.817, 31.8816, 4.31097, 0, 0, -0.833885, 0.551938, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (895, 1007, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (967, 1617, 0, 2720.47, 856.41, 113.721, 3.4383, 0, 0, -0.989016, 0.147811, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (967, 1007, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (9708, 1617, 0, 2339.24, -353.655, 69.7924, 5.21854, 0, 0, -0.507538, 0.861629, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (9708, 1007, 'Silverleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (10260, 1617, 0, 1604.38, -641.317, 52.6502, 1.97222, 0, 0, 0.833885, 0.551938, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (10260, 1007, 'Silverleaf');

-- Missing spawns in Westfall.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (1108, 1617, 0, -10128.5, 1001.42, 37.3444, 0.279252, 0, 0, 0.139173, 0.990268, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (1108, 1106, 'Silverleaf');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
