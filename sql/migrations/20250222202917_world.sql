DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250222202917');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250222202917');
-- Add your query below.

-- Silverleaf
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1, 1617, 0, 2424.77, 1685.84, 27.5105, -0.541052, 0, 0, 0.267238, -0.96363, 300, 300, 100, 1, 0, 10), -- Tirisfal Glades
(157, 1617, 0, 2594.16, 1270.24, 56.4382, -1.11701, 0, 0, 0.529919, -0.848048, 300, 300, 100, 1, 0, 10), -- Tirisfal Glades
(173, 1617, 0, 2590.68, 540.587, 16.2911, 2.30383, 0, 0, 0.913545, 0.406737, 300, 300, 100, 1, 0, 10), -- Tirisfal Glades
(174, 1617, 1, 9704, 425.908, 1313.46, -2.84489, 0, 0, 0.989016, -0.147809, 300, 300, 100, 1, 0, 10), -- Teldrassil
(176, 1617, 1, 9258.89, 1237.69, 1296.86, -2.56563, 0, 0, 0.95882, -0.284015, 300, 300, 100, 1, 0, 10), -- Teldrassil
(203, 1617, 1, 10984.5, 1349.24, 1336.57, -0.558505, 0, 0, 0.275637, -0.961262, 300, 300, 100, 1, 0, 10), -- Teldrassil
(204, 1617, 1, 10966.5, 1432.73, 1307.23, 2.23402, 0, 0, 0.898794, 0.438371, 300, 300, 100, 1, 0, 10), -- Teldrassil
(208, 1617, 1, -890.855, 389.65, 32.1049, -2.33874, 0, 0, 0.920505, -0.390731, 300, 300, 100, 1, 0, 10); -- Mulgore
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(1, 1007, 'Silverleaf', 10),
(157, 1007, 'Silverleaf', 10),
(173, 1007, 'Silverleaf', 10),
(174, 1003, 'Silverleaf', 10),
(176, 1003, 'Silverleaf', 10),
(203, 1003, 'Silverleaf', 10),
(204, 1003, 'Silverleaf', 10),
(208, 1027, 'Silverleaf', 10);

-- Peacebloom
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(210, 1618, 0, 2552.62, 1022.32, 89.9897, -0.680679, 0, 0, 0.333807, -0.942641, 300, 300, 100, 1, 0, 10), -- Tirisfal Glades
(223, 1618, 0, 2966.91, 600.531, 96.059, -2.84489, 0, 0, 0.989016, -0.147809, 300, 300, 100, 1, 0, 10), -- Tirisfal Glades
(224, 1618, 0, 982.004, 1877.77, 9.83395, -2.68781, 0, 0, 0.97437, -0.224951, 300, 300, 100, 1, 0, 10), -- Silverpine Forest
(225, 1618, 1, 9389.27, 1675.06, 1301.12, -1.20428, 0, 0, 0.566406, -0.824126, 300, 300, 100, 1, 0, 10), -- Teldrassil
(226, 1618, 1, 10707.8, 1461.24, 1318.58, -2.16421, 0, 0, 0.882948, -0.469472, 300, 300, 100, 1, 0, 10), -- Teldrassil
(232, 1618, 1, 10705.2, 1416.07, 1326.14, -1.58825, 0, 0, 0.71325, -0.700909, 300, 300, 100, 1, 0, 10), -- Teldrassil
(245, 1618, 1, 9554.92, 1119.77, 1265.2, -2.82743, 0, 0, 0.987688, -0.156434, 300, 300, 100, 1, 0, 10), -- Teldrassil
(289, 1618, 1, 9591.63, 1213.87, 1271.78, 0.0523599, 0, 0, 0.0261769, 0.999657, 300, 300, 100, 1, 0, 10), -- Teldrassil
(290, 1618, 1, 9589.17, 1156.16, 1270.15, 2.33874, 0, 0, 0.920505, 0.390731, 300, 300, 100, 1, 0, 10), -- Teldrassil
(807, 3724, 1, -1212.77, -3520.31, 91.6667, -2.84489, 0, 0, 0.989016, -0.147809, 300, 300, 100, 1, 0, 10); -- The Barrens
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(210, 1006, 'Peacebloom', 10),
(223, 1006, 'Peacebloom', 10),
(224, 1041, 'Peacebloom', 10),
(225, 1002, 'Peacebloom', 10),
(226, 1002, 'Peacebloom', 10),
(232, 1002, 'Peacebloom', 10),
(245, 1002, 'Peacebloom', 10),
(289, 1002, 'Peacebloom', 10),
(290, 1002, 'Peacebloom', 10),
(807, 1030, 'Peacebloom', 10);

-- Earthroot
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(292, 1619, 0, -9761.37, -457.87, 41.5615, 1.5708, 0, 0, 0.707107, 0.707107, 300, 300, 100, 1, 0, 10), -- Elwynn Forest
(293, 1619, 0, -9083.2, -1084.1, 82.282, 0.331613, 0, 0, 0.165048, 0.986286, 300, 300, 100, 1, 0, 10), -- Elwynn Forest
(294, 1619, 0, -8753.15, -806.402, 100.999, -2.18166, 0, 0, 0.887011, -0.461749, 300, 300, 100, 1, 0, 10), -- Elwynn Forest
(295, 1619, 0, -6017.43, -2825.69, 410.212, 0.750492, 0, 0, 0.366501, 0.930418, 300, 300, 100, 1, 0, 10), -- Loch Modan
(296, 1619, 0, 2664.12, 1169.69, 88.3795, 2.11185, 0, 0, 0.870356, 0.492424, 300, 300, 100, 1, 0, 10), -- Tirisfal Glades
(297, 1619, 0, 2803.89, 1118.27, 88.8948, -0.523599, 0, 0, 0.258819, -0.965926, 300, 300, 100, 1, 0, 10), -- Tirisfal Glades
(309, 1619, 0, 2903.58, 315.131, 28.2823, 1.25664, 0, 0, 0.587785, 0.809017, 300, 300, 100, 1, 0, 10), -- Tirisfal Glades
(310, 1619, 0, 2954.16, -472.011, 99.9302, -1.74533, 0, 0, 0.766044, -0.642788, 300, 300, 100, 1, 0, 10), -- Tirisfal Glades
(311, 1619, 0, -49.2648, 685.177, 79.171, -0.855212, 0, 0, 0.414693, -0.909961, 300, 300, 100, 1, 0, 10), -- Silverpine Forest
(312, 1619, 1, 52.9918, -4088.75, 59.7974, 2.74017, 0, 0, 0.979925, 0.199368, 300, 300, 100, 1, 0, 10), -- Durotar
(324, 1619, 1, 10772.8, 1442.78, 1334.56, -1.62316, 0, 0, 0.725374, -0.688354, 300, 300, 100, 1, 0, 10), -- Teldrassil
(325, 1619, 1, 10610.3, 1560.11, 1314.63, -0.541052, 0, 0, 0.267238, -0.96363, 300, 300, 100, 1, 0, 10), -- Teldrassil
(326, 1619, 1, 10412.7, 1750.1, 1315.66, 0.733038, 0, 0, 0.358368, 0.93358, 300, 300, 100, 1, 0, 10), -- Teldrassil
(327, 1619, 1, 9252.04, 1765.57, 1340.38, -2.07694, 0, 0, 0.861629, -0.507538, 300, 300, 100, 1, 0, 10), -- Teldrassil
(329, 1619, 1, -494.837, -544.558, 66.8035, -1.01229, 0, 0, 0.48481, -0.87462, 300, 300, 100, 1, 0, 10); -- Mulgore
UPDATE `gameobject` SET `position_x`=5414.28, `position_y`=118.868, `position_z`=37.0711, `orientation`=0.261799, `rotation0`=0, `rotation1`=0, `rotation2`=0.130526, `rotation3`=0.991445 WHERE `guid`=1976;
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(292, 1011, 'Earthroot', 10),
(293, 1011, 'Earthroot', 10),
(294, 1011, 'Earthroot', 10),
(295, 1160, 'Earthroot', 10),
(296, 1005, 'Earthroot', 10),
(297, 1005, 'Earthroot', 10),
(309, 1005, 'Earthroot', 10),
(310, 1005, 'Earthroot', 10),
(311, 1040, 'Earthroot', 10),
(312, 1021, 'Earthroot', 10),
(324, 1001, 'Earthroot', 10),
(325, 1001, 'Earthroot', 10),
(326, 1001, 'Earthroot', 10),
(327, 1001, 'Earthroot', 10),
(329, 1025, 'Earthroot', 10);

-- Stranglekelp
UPDATE `gameobject` SET `position_x`=-10820.4, `position_y`=-4390.35, `position_z`=-35.3, `orientation`=2.53073, `rotation0`=0, `rotation1`=0, `rotation2`=0.953717, `rotation3`=0.300706 WHERE `guid`=50482;

-- Briarthorn
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(808, 3729, 1, 551.364, -1181.94, 92.4717, 2.96706, 0, 0, 0.996195, 0.0871558, 300, 300, 100, 1, 0, 10), -- The Barrens
(811, 3729, 1, -2058.05, -3599.88, 29.5675, -2.70526, 0, 0, 0.976296, -0.21644, 300, 300, 100, 1, 0, 10); -- The Barrens
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(808, 1037, 'Briarthorn', 10),
(811, 1037, 'Briarthorn', 10);

-- Bruiseweed
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(812, 3730, 1, -819.789, -1947.24, 97.0043, -2.63545, 0, 0, 0.968148, -0.25038, 300, 300, 100, 1, 0, 10), -- The Barrens
(818, 3730, 1, 1375.76, -3648.63, 91.8001, 0.680678, 0, 0, 0.333807, 0.942641, 300, 300, 100, 1, 0, 10), -- The Barrens
(819, 3730, 1, -2218, -3700.16, 92.6086, -0.139626, 0, 0, 0.0697565, -0.997564, 300, 300, 100, 1, 0, 10); -- The Barrens
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(812, 1036, 'Bruiseweed', 10),
(818, 1036, 'Bruiseweed', 10),
(819, 1036, 'Bruiseweed', 10);

-- Gloom Weed
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1082, 175566, 0, 2267.1, 972.917, 57.5825, -0.174533, 0, 0, 0.0871559, -0.996195, 180, 180, 100, 1, 0, 10); -- Tirisfal Glades

-- Plaguebloom
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1369, 176587, 0, 2479.99, -1630.05, 105.924, 2.87979, 0, 0, 0.991445, 0.130526, 300, 300, 100, 1, 0, 10), -- Western Plaguelands
(1372, 176587, 0, 2508.27, -3786.51, 177.507, -1.46608, 0, 0, 0.669131, -0.743145, 300, 300, 100, 1, 0, 10), -- Eastern Plaguelands
(1373, 176587, 0, 3000.71, -5011.22, 103.588, 1.309, 0, 0, 0.608761, 0.793353, 300, 300, 100, 1, 0, 10), -- Eastern Plaguelands
(1374, 176587, 0, 2990.56, -3135.62, 112.868, -2.86234, 0, 0, 0.990268, -0.139173, 300, 300, 100, 1, 0, 10); -- Eastern Plaguelands
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(1369, 1258, 'Plaguebloom', 10),
(1372, 1265, 'Plaguebloom', 10),
(1373, 1265, 'Plaguebloom', 10),
(1374, 1265, 'Plaguebloom', 10);

-- Icecap
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1375, 176588, 1, 6991.69, -5149.03, 700.378, -3.12414, 0, 0, 0.999962, -0.00872653, 300, 300, 100, 1, 0, 10), -- Winterspring
(1376, 176588, 1, 5153.57, -4556.76, 839.158, -0.645772, 0, 0, 0.317305, -0.948324, 300, 300, 100, 1, 0, 10), -- Winterspring
(1384, 176588, 1, 5433.95, -4551.99, 814.326, -2.14675, 0, 0, 0.878817, -0.477159, 300, 300, 100, 1, 0, 10), -- Winterspring
(1385, 176588, 1, 5525.33, -4937.1, 841.203, -1.18682, 0, 0, 0.559193, -0.829037, 300, 300, 100, 1, 0, 10), -- Winterspring
(1392, 176588, 1, 6437.91, -3895.96, 673.699, -1.25664, 0, 0, 0.587785, -0.809017, 300, 300, 100, 1, 0, 10); -- Winterspring
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(1375, 1236, 'Icecap', 10),
(1376, 1236, 'Icecap', 10),
(1384, 1236, 'Icecap', 10),
(1385, 1236, 'Icecap', 10),
(1392, 1236, 'Icecap', 10);

-- Dark Iron Deposit
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1063, 165658, 230, 416.557, -157.786, -59.976, 0.226893, 0, 0, 0.113203, 0.993572, 604800, 604800, 100, 1, 5, 10); -- Blackrock Depths
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(1063, 25622, 'Dark Iron Deposit', 10);

-- Copper Vein
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(822, 3763, 1, -1432.43, -1536.64, 94.439, 0.244346, 0, 0, 0.121869, 0.992546, 300, 900, 100, 1, 0, 10); -- The Barrens
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(822, 2588, 'Copper Vein (3763) - Barrens', 10);

-- Tin Vein
SET @PTEMPLATE = 1156;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(823, 1733, 1, 767.581, -1273.11, 97.0626, 2.3911, 0, 0, 0.930418, 0.366501, 300, 300, 100, 1, 0, 10),
(824, 1733, 1, -210.906, -3065.3, 95.8595, 2.54818, 0, 0, 0.956305, 0.292372, 300, 300, 100, 1, 0, 10),
(1516, 3764, 1, 767.581, -1273.11, 97.0626, 2.3911, 0, 0, 0.930418, 0.366501, 300, 300, 100, 1, 0, 10),
(1517, 3764, 1, -210.906, -3065.3, 95.8595, 2.54818, 0, 0, 0.956305, 0.292372, 300, 300, 100, 1, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(@PTEMPLATE+2, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(823, @PTEMPLATE+1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(824, @PTEMPLATE+2, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(1516, @PTEMPLATE+1, 'Tin Vein (3764) / Silver Vein - Barrens', 10),
(1517, @PTEMPLATE+2, 'Tin Vein (3764) / Silver Vein - Barrens', 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+2, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0);
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Tin Vein (3764) / Silver Vein - Barrens" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 3764);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Tin Vein (3764) / Silver Vein - Barrens" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);

UPDATE `gameobject` SET `position_x`=-6599.61, `position_y`=-1431.66, `position_z`=167.413, `orientation`=2.37365, `rotation0`=0, `rotation1`=0, `rotation2`=0.927184, `rotation3`=0.374607 WHERE `guid` IN (397355, 397315, 397275, 397235);
UPDATE `gameobject` SET `position_x`=-2967.17, `position_y`=-3240.31, `position_z`=54.206, `orientation`=-0.959931, `rotation0`=0, `rotation1`=0, `rotation2`=0.461749, `rotation3`=-0.887011 WHERE `guid` IN (74541, 74519, 74563);
UPDATE `gameobject` SET `position_x`=-6717.47, `position_y`=-1252.7, `position_z`=183.796, `orientation`=0.139626, `rotation0`=0, `rotation1`=0, `rotation2`=0.0697565, `rotation3`=0.997564 WHERE `guid` IN (397422, 397407, 397392);
UPDATE `gameobject` SET `position_x`=2170.57, `position_y`=480.298, `position_z`=66.3666, `orientation`=1.67552, `rotation0`=0, `rotation1`=0, `rotation2`=0.743145, `rotation3`=0.669131 WHERE `guid`=55004;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
