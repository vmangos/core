DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230611095646');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230611095646');
-- Add your query below.


-- Grave Moss (1628)
SET @OGUID = 29116;

-- Correct position of Grave Moss in The Barrens (position is off by 1.84061 yards).
UPDATE `gameobject` SET `position_x`=-3996.27, `position_y`=-1861.18, `position_z`=91.7213, `orientation`=0.418879, `rotation0`=0, `rotation1`=0, `rotation2`=0.207911, `rotation3`=0.978148 WHERE `guid`=4442;

-- Correct position of Grave Moss in Desolace (position is off by 0.88363 yards).
UPDATE `gameobject` SET `position_x`=-1243.92, `position_y`=1856.61, `position_z`=50.1459, `orientation`=5.95157, `rotation0`=0, `rotation1`=0, `rotation2`=-0.165047, `rotation3`=0.986286 WHERE `guid`=4437;

-- Correct position of Grave Moss in Duskwood (position is off by 1.37584 yards).
UPDATE `gameobject` SET `position_x`=-10442.8, `position_y`=221.964, `position_z`=31.7509, `orientation`=2.37364, `rotation0`=0, `rotation1`=0, `rotation2`=0.927183, `rotation3`=0.374608 WHERE `guid`=4452;

-- Correct position of Grave Moss in Arathi Highlands (position is off by 1.26648 yards).
UPDATE `gameobject` SET `position_x`=-1500.25, `position_y`=-1885.15, `position_z`=68.4893, `orientation`=0.680677, `rotation0`=0, `rotation1`=0, `rotation2`=0.333806, `rotation3`=0.942642 WHERE `guid`=4469;

-- Correct position of Grave Moss in Alterac Mountains (position is off by 1.11913 yards).
UPDATE `gameobject` SET `position_x`=479.536, `position_y`=-309.049, `position_z`=155.839, `orientation`=4.34587, `rotation0`=0, `rotation1`=0, `rotation2`=-0.824126, `rotation3`=0.566406 WHERE `guid`=4445;

-- Correct position of Grave Moss in Duskwood (position is off by 1.36779 yards).
UPDATE `gameobject` SET `position_x`=-10385.9, `position_y`=386.973, `position_z`=47.0414, `orientation`=5.06146, `rotation0`=0, `rotation1`=0, `rotation2`=-0.573576, `rotation3`=0.819152 WHERE `guid`=4465;

-- Missing Grave Moss spawns in Duskwood.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1628, 0, -10547, 269.901, 28.4756, 4.59022, 0, 0, -0.748956, 0.66262, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4461 at 13.151790 yards.
(@OGUID+2, 1628, 0, -10344.9, 227.065, 32.6557, 4.15388, 0, 0, -0.874619, 0.48481, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4447 at 10.998572 yards.
(@OGUID+3, 1628, 0, -11007.5, -1295.47, 53.5987, 5.21854, 0, 0, -0.507538, 0.861629, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4440 at 8.845914 yards.
(@OGUID+4, 1628, 0, -10539.9, 442.972, 38.0475, 1.22173, 0, 0, 0.573576, 0.819152, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4485 at 14.838125 yards.
(@OGUID+5, 1628, 0, -11038.5, -1320, 53.6162, 0.680677, 0, 0, 0.333806, 0.942642, 300, 300, 1, 100, 0, 10),
(@OGUID+6, 1628, 0, -10989.7, -1280.99, 52.7249, 3.78737, 0, 0, -0.948323, 0.317306, 300, 300, 1, 100, 0, 10),
(@OGUID+7, 1628, 0, -10395.3, 174.046, 35.1744, 4.99164, 0, 0, -0.601814, 0.798636, 300, 300, 1, 100, 0, 10);

-- Missing Grave Moss spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+8, 1628, 0, -2851.66, -2234.82, 16.3133, 5.86431, 0, 0, -0.207911, 0.978148, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4456 at 16.781769 yards.
(@OGUID+9, 1628, 0, -2887.61, -2191.98, 25.5817, 3.4383, 0, 0, -0.989016, 0.147811, 300, 300, 1, 100, 0, 10),
(@OGUID+10, 1628, 0, -2874.28, -2189.41, 24.3568, 1.309, 0, 0, 0.608761, 0.793354, 300, 300, 1, 100, 0, 10),
(@OGUID+11, 1628, 0, -2863.84, -2169.54, 23.2902, 3.99681, 0, 0, -0.909961, 0.414694, 300, 300, 1, 100, 0, 10),
(@OGUID+12, 1628, 0, -2853.07, -2194.42, 7.41447, 1.62316, 0, 0, 0.725374, 0.688355, 300, 300, 1, 100, 0, 10);

-- Missing Grave Moss spawns in Alterac Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+13, 1628, 0, 493.417, -306.911, 153.738, 5.65487, 0, 0, -0.309016, 0.951057, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 4444 at 10.689419 yards.

-- Missing Grave Moss spawns in Arathi Highlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+14, 1628, 0, -1517.81, -1918.35, 68.7376, 2.32129, 0, 0, 0.91706, 0.39875, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4464 at 5.861720 yards.
(@OGUID+15, 1628, 0, -1497.07, -1835.2, 68.4011, 1.48353, 0, 0, 0.67559, 0.737278, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 4449 at 11.842237 yards.

-- Missing Grave Moss spawns in Eastern Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+16, 1628, 0, 1602.21, -3239.35, 66.8794, 4.46804, 0, 0, -0.788011, 0.615662, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 33336 at 27.901777 yards.
(@OGUID+17, 1628, 0, 1619.87, -3271.2, 88.1834, 4.86947, 0, 0, -0.649447, 0.760406, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 33336 at 35.080940 yards.

-- Missing Grave Moss spawns in Desolace.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+18, 1628, 1, -1299.83, 1942.04, 51.1616, 5.88176, 0, 0, -0.199368, 0.979925, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4487 at 5.888136 yards.
(@OGUID+19, 1628, 1, -1599.25, 1376.42, 61.2987, 2.19911, 0, 0, 0.891006, 0.453991, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4481 at 433.997955 yards.
(@OGUID+20, 1628, 1, -1342.52, 963.65, 91.5162, 2.16421, 0, 0, 0.882947, 0.469473, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 18676 at 331.919250 yards.
(@OGUID+21, 1628, 1, -1158.39, 2254.16, 92.2791, 2.56563, 0, 0, 0.958819, 0.284016, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4499 at 257.957367 yards.
(@OGUID+22, 1628, 1, -1307.94, 2046.85, 50.1442, 4.01426, 0, 0, -0.906307, 0.422619, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4499 at 20.791868 yards.
(@OGUID+23, 1628, 1, -1402.27, 1831.51, 50.1442, 4.18879, 0, 0, -0.866025, 0.500001, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4477 at 7.134086 yards.
(@OGUID+24, 1628, 1, -631.91, 1516.65, 89.813, 4.83456, 0, 0, -0.66262, 0.748956, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 18676 at 653.399292 yards.
(@OGUID+25, 1628, 1, -647.017, 1758.21, 89.8061, 4.76475, 0, 0, -0.688354, 0.725374, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4437 at 606.480042 yards.
(@OGUID+26, 1628, 1, -982.668, 2446.35, 94.8709, 5.21854, 0, 0, -0.507538, 0.861629, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 18680 at 208.852051 yards.
(@OGUID+27, 1628, 1, -2265.49, 1326.23, 63.6699, 3.05433, 0, 0, 0.999048, 0.0436193, 300, 300, 1, 100, 0, 10),
(@OGUID+28, 1628, 1, -2146.59, 1298.96, 63.5881, 4.34587, 0, 0, -0.824126, 0.566406, 300, 300, 1, 100, 0, 10),
(@OGUID+29, 1628, 1, -1825.41, 2496.97, 63.0604, 2.16421, 0, 0, 0.882947, 0.469473, 300, 300, 1, 100, 0, 10),
(@OGUID+30, 1628, 1, -1430.55, 1776.73, 50.1442, 1.48353, 0, 0, 0.67559, 0.737278, 300, 300, 1, 100, 0, 10),
(@OGUID+31, 1628, 1, -1313.5, 1995.42, 50.4294, 0.820303, 0, 0, 0.398748, 0.91706, 300, 300, 1, 100, 0, 10),
(@OGUID+32, 1628, 1, -1251.02, 1900.7, 50.1459, 4.71239, 0, 0, -0.707107, 0.707107, 300, 300, 1, 100, 0, 10),
(@OGUID+33, 1628, 1, -1228.86, 1979.92, 50.146, 5.00909, 0, 0, -0.594823, 0.803857, 300, 300, 1, 100, 0, 10);

-- Missing Grave Moss spawns in Barrens.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+34, 1628, 1, -4010.3, -1761.14, 96.7407, 0.785397, 0, 0, 0.382683, 0.92388, 300, 300, 1, 100, 0, 10),
(@OGUID+35, 1628, 1, -3996.27, -1861.18, 91.7213, 0.418879, 0, 0, 0.207911, 0.978148, 300, 300, 1, 100, 0, 10);

-- Missing Grave Moss spawns in Scarlet Monastery Graveyard.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+36, 1628, 189, 1746.37, 1410.68, 22.1887, 0.226892, 0, 0, 0.113203, 0.993572, 300, 300, 1, 100, 0, 10),
(@OGUID+37, 1628, 189, 1775.33, 1288.49, 17.5498, 3.73501, 0, 0, -0.956305, 0.292372, 300, 300, 1, 100, 0, 10),
(@OGUID+38, 1628, 189, 1776.21, 1224.47, 17.5028, 1.6057, 0, 0, 0.719339, 0.694659, 300, 300, 1, 100, 0, 10),
(@OGUID+39, 1628, 189, 1796.03, 1417.5, 14.4893, 3.59538, 0, 0, -0.97437, 0.224951, 300, 300, 1, 100, 0, 10),
(@OGUID+40, 1628, 189, 1818.8, 1241, 17.5499, 3.90954, 0, 0, -0.927183, 0.374608, 300, 300, 1, 100, 0, 10),
(@OGUID+41, 1628, 189, 1833.85, 1318.35, 19.6896, 2.49582, 0, 0, 0.948323, 0.317306, 300, 300, 1, 100, 0, 10),
(@OGUID+42, 1628, 189, 1836.24, 1408.23, 21.7179, 2.51327, 0, 0, 0.951056, 0.309017, 300, 300, 1, 100, 0, 10),
(@OGUID+43, 1628, 189, 1839.61, 1377.49, 18.6989, 4.29351, 0, 0, -0.83867, 0.54464, 300, 300, 1, 100, 0, 10),
(@OGUID+44, 1628, 189, 1840.29, 1347.77, 18.0907, 0, 0, 0, 0, 1, 300, 300, 1, 100, 0, 10);

DELETE FROM `pool_gameobject` WHERE `guid` IN (4473);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 105, 0, 'Grave Moss', 0, 10), -- Grave Moss (x27) - Duskwood
(@OGUID+2, 105, 0, 'Grave Moss', 0, 10), -- Grave Moss (x6) - Duskwood
(@OGUID+3, 105, 0, 'Grave Moss', 0, 10), -- Grave Moss (x27) - Duskwood
(@OGUID+4, 105, 0, 'Grave Moss', 0, 10), -- Grave Moss (x27) - Duskwood
(@OGUID+5, 105, 0, 'Grave Moss', 0, 10), -- Grave Moss (x27) - Duskwood
(@OGUID+6, 105, 0, 'Grave Moss', 0, 10), -- Grave Moss (x6) - Duskwood
(@OGUID+7, 105, 0, 'Grave Moss', 0, 10), -- Grave Moss (x27) - Duskwood
(4473, 105, 0, 'Grave Moss', 0, 10), -- Static
(@OGUID+8, 1148, 0, 'Grave Moss', 0, 10), -- Grave Moss in Wetlands 15 objects total
(@OGUID+9, 1148, 0, 'Grave Moss', 0, 10), -- Grave Moss in Wetlands 15 objects total
(@OGUID+10, 1148, 0, 'Grave Moss', 0, 10), -- Grave Moss in Wetlands 15 objects total
(@OGUID+11, 1148, 0, 'Grave Moss', 0, 10), -- Grave Moss in Wetlands 15 objects total
(@OGUID+12, 1148, 0, 'Grave Moss', 0, 10), -- Grave Moss in Wetlands 15 objects total
(@OGUID+13, 1060, 0, 'Grave Moss', 0, 10), -- Grave Moss in Alterac 7 objects total
(@OGUID+14, 104, 0, 'Grave Moss', 0, 10), -- Grave Moss (x7) - Arathi Highlands
(@OGUID+15, 104, 0, 'Grave Moss', 0, 10), -- Grave Moss (x7) - Arathi Highlands
(@OGUID+16, 106, 0, 'Grave Moss', 0, 10), -- Grave Mosss in Eastern Plaguelands
(@OGUID+17, 106, 0, 'Grave Moss', 0, 10), -- Grave Mosss in Eastern Plaguelands
(@OGUID+18, 107, 0, 'Grave Moss', 0, 10), -- Grave Mosss in Desolace
(@OGUID+19, 107, 0, 'Grave Moss', 0, 10), -- Grave Mosss in Desolace
(@OGUID+20, 107, 0, 'Grave Moss', 0, 10), -- Grave Mosss in Desolace
(@OGUID+21, 107, 0, 'Grave Moss', 0, 10), -- Grave Mosss in Desolace
(@OGUID+22, 107, 0, 'Grave Moss', 0, 10), -- Grave Mosss in Desolace
(@OGUID+23, 107, 0, 'Grave Moss', 0, 10), -- Grave Mosss in Desolace
(@OGUID+24, 107, 0, 'Grave Moss', 0, 10), -- Grave Mosss in Desolace
(@OGUID+25, 107, 0, 'Grave Moss', 0, 10), -- Grave Mosss in Desolace
(@OGUID+26, 107, 0, 'Grave Moss', 0, 10), -- Grave Mosss in Desolace
(@OGUID+27, 107, 0, 'Grave Moss', 0, 10), -- Grave Mosss in Desolace
(@OGUID+28, 107, 0, 'Grave Moss', 0, 10), -- Grave Mosss in Desolace
(@OGUID+29, 107, 0, 'Grave Moss', 0, 10), -- Grave Mosss in Desolace
(@OGUID+30, 107, 0, 'Grave Moss', 0, 10), -- Grave Mosss in Desolace
(@OGUID+31, 107, 0, 'Grave Moss', 0, 10), -- Grave Mosss in Desolace
(@OGUID+32, 107, 0, 'Grave Moss', 0, 10), -- Grave Mosss in Desolace
(@OGUID+33, 107, 0, 'Grave Moss', 0, 10), -- Grave Mosss in Desolace
(18676, 107, 0, 'Grave Moss', 0, 10), -- Static
(18677, 107, 0, 'Grave Moss', 0, 10), -- Static
(18680, 107, 0, 'Grave Moss', 0, 10), -- Static
(@OGUID+34, 1083, 0, 'Grave Moss', 0, 10), -- Grave Mosss in Barrens
(@OGUID+35, 1083, 0, 'Grave Moss', 0, 10); -- Grave Mosss in Barrens

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (514, 4, 'Grave Moss in Scarlet Monastery Graveyard', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+36, 514, 0, 'Grave Moss', 0, 10), -- Grave Mosss in Scarlet Monastery Graveyard
(@OGUID+37, 514, 0, 'Grave Moss', 0, 10), -- Grave Mosss in Scarlet Monastery Graveyard
(@OGUID+38, 514, 0, 'Grave Moss', 0, 10), -- Grave Mosss in Scarlet Monastery Graveyard
(@OGUID+39, 514, 0, 'Grave Moss', 0, 10), -- Grave Mosss in Scarlet Monastery Graveyard
(@OGUID+40, 514, 0, 'Grave Moss', 0, 10), -- Grave Mosss in Scarlet Monastery Graveyard
(@OGUID+41, 514, 0, 'Grave Moss', 0, 10), -- Grave Mosss in Scarlet Monastery Graveyard
(@OGUID+42, 514, 0, 'Grave Moss', 0, 10), -- Grave Mosss in Scarlet Monastery Graveyard
(@OGUID+43, 514, 0, 'Grave Moss', 0, 10), -- Grave Mosss in Scarlet Monastery Graveyard
(@OGUID+44, 514, 0, 'Grave Moss', 0, 10); -- Grave Mosss in Scarlet Monastery Graveyard

-- Correct Pools
UPDATE `pool_gameobject` SET `description`='Grave Moss' WHERE `guid` IN (4469, 16751, 4507, 4437, 4495, 4465, 4502, 4452, 33483, 14026, 4433, 17892); 
UPDATE `pool_template` SET `description`='Grave Moss in Desolace' WHERE  `entry`=107;
UPDATE `pool_template` SET `description`='Grave Moss in Duskwood' WHERE  `entry`=105;
UPDATE `pool_template` SET `description`='Grave Moss in Eastern Plaguelands' WHERE  `entry`=106;
UPDATE `pool_template` SET `description`='Grave Moss in Arathi Highlands' WHERE  `entry`=104;
UPDATE `pool_template` SET `description`='Grave Moss in Barrens' WHERE  `entry`=1083;
UPDATE `pool_template` SET `description`='Grave Moss in Wetlands' WHERE  `entry`=1148;

-- Remove Custom Spawns (Non of these spawns exist in the sniff-db)
DELETE FROM `gameobject` WHERE `guid` IN (4504, 4471, 4481, 4442, 4432, 4434, 4435, 4438, 4439, 4440, 4443, 4444, 4446, 4447, 4448, 4449, 4450, 4451, 4453, 4454, 4455, 4456, 4457, 4458, 4459, 4460, 4461, 4463, 4464, 4466, 4467, 4472, 4474, 4475, 4476, 4477, 4479, 4480, 4482, 4483, 4484, 4485, 4487, 4488, 4489, 4491, 4492, 4493, 4494, 4497, 4498, 4499, 4500, 4501, 4503, 4505, 39995);
DELETE FROM `pool_gameobject` WHERE `guid` IN (4504, 4471, 4481, 4442, 4432, 4434, 4435, 4438, 4439, 4440, 4443, 4444, 4446, 4447, 4448, 4449, 4450, 4451, 4453, 4454, 4455, 4456, 4457, 4458, 4459, 4460, 4461, 4463, 4464, 4466, 4467, 4472, 4474, 4475, 4476, 4477, 4479, 4480, 4482, 4483, 4484, 4485, 4487, 4488, 4489, 4491, 4492, 4493, 4494, 4497, 4498, 4499, 4500, 4501, 4503, 4505, 39995);

-- Sync Gobject Data
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300, `spawn_flags` = 0, `animprogress` = 100 WHERE `id` IN (1628);

-- Update Counters
UPDATE `pool_template` SET `max_limit`=9 WHERE  `entry`=107;
UPDATE `pool_template` SET `max_limit`=2 WHERE  `entry`=1148;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
