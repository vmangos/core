DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230603165413');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230603165413');
-- Add your query below.


-- Arthas Tears (142141, 176642) 
SET @OGUID = 5786;

-- Correct position of Arthas' Tears in Western Plaguelands (position is off by 2.82765 yards).
UPDATE `gameobject` SET `position_x`=1434.88, `position_y`=-1542.22, `position_z`=55.5123, `orientation`=1.25664, `rotation0`=0, `rotation1`=0, `rotation2`=0.587785, `rotation3`=0.809017 WHERE `guid`=16022;

-- Correct position of Arthas' Tears in Western Plaguelands (position is off by 0.969753 yards).
UPDATE `gameobject` SET `position_x`=1382.68, `position_y`=-1814.81, `position_z`=61.294, `orientation`=0.296705, `rotation0`=0, `rotation1`=0, `rotation2`=0.147809, `rotation3`=0.989016 WHERE `guid`=16003;

-- Correct position of Arthas' Tears in Western Plaguelands (position is off by 0.506465 yards).
UPDATE `gameobject` SET `position_x`=1842.55, `position_y`=-2206.58, `position_z`=62.1356, `orientation`=3.76991, `rotation0`=0, `rotation1`=0, `rotation2`=-0.951056, `rotation3`=0.309017 WHERE `guid`=16015;

-- Correct position of Arthas' Tears in Western Plaguelands (position is off by 0.965545 yards).
UPDATE `gameobject` SET `position_x`=1558.22, `position_y`=-995.456, `position_z`=67.24, `orientation`=4.59022, `rotation0`=0, `rotation1`=0, `rotation2`=-0.748956, `rotation3`=0.66262 WHERE `guid`=15966;

-- Correct position of Arthas' Tears in Western Plaguelands (position is off by 1.01018 yards).
UPDATE `gameobject` SET `position_x`=1852.22, `position_y`=-1382.49, `position_z`=59.8972, `orientation`=4.36332, `rotation0`=0, `rotation1`=0, `rotation2`=-0.819152, `rotation3`=0.573577 WHERE `guid`=16011;

-- Correct position of Arthas' Tears in Western Plaguelands (position is off by 0.791767 yards).
UPDATE `gameobject` SET `position_x`=2159.69, `position_y`=-1574.27, `position_z`=68.0867, `orientation`=4.76475, `rotation0`=0, `rotation1`=0, `rotation2`=-0.688354, `rotation3`=0.725374 WHERE `guid`=15992;

-- Correct position of Arthas' Tears in Eastern Plaguelands (position is off by 0.291844 yards).
UPDATE `gameobject` SET `position_x`=2309.34, `position_y`=-5247.21, `position_z`=84.3962, `orientation`=5.91667, `rotation0`=0, `rotation1`=0, `rotation2`=-0.182235, `rotation3`=0.983255 WHERE `guid`=15991;

-- Correct position of Arthas' Tears in Western Plaguelands (position is off by 0.377129 yards).
UPDATE `gameobject` SET `position_x`=1482.34, `position_y`=-1217.8, `position_z`=62.6274, `orientation`=1.23918, `rotation0`=0, `rotation1`=0, `rotation2`=0.580703, `rotation3`=0.814116 WHERE `guid`=15967;

-- Correct position of Arthas' Tears in Eastern Plaguelands (position is off by 0.733335 yards).
UPDATE `gameobject` SET `position_x`=2861.6, `position_y`=-4063.8, `position_z`=99.4177, `orientation`=0.0523589, `rotation0`=0, `rotation1`=0, `rotation2`=0.0261765, `rotation3`=0.999657 WHERE `guid`=15974;

-- Missing Arthas' Tears spawns in Western Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 142141, 0, 1668.4, -1594.04, 60.7286, 4.97419, 0, 0, -0.608761, 0.793354, 300, 300, 1, 100, 0, 10),
(@OGUID+2, 142141, 0, 2097.43, -1873.44, 63.6307, 0.209439, 0, 0, 0.104528, 0.994522, 300, 300, 1, 100, 0, 10),
(@OGUID+3, 142141, 0, 1075.39, -1688.27, 62.45, 3.73501, 0, 0, -0.956305, 0.292372, 300, 300, 1, 100, 0, 10),
(@OGUID+4, 142141, 0, 1728.19, -2407.51, 60.5032, 5.39307, 0, 0, -0.430511, 0.902586, 300, 300, 1, 100, 0, 10),
(@OGUID+5, 142141, 0, 2888.72, -1406.39, 148.374, 1.69297, 0, 0, 0.748956, 0.66262, 300, 300, 1, 100, 0, 10),
(@OGUID+6, 142141, 0, 1552.86, -1768.98, 61.8234, 4.32842, 0, 0, -0.829037, 0.559194, 300, 300, 1, 100, 0, 10),
(@OGUID+7, 142141, 0, 1821.96, -2044.74, 75.4277, 0.715585, 0, 0, 0.350207, 0.936672, 300, 300, 1, 100, 0, 10),
(@OGUID+8, 142141, 0, 2009.31, -1584.37, 59.8575, 3.59538, 0, 0, -0.97437, 0.224951, 300, 300, 1, 100, 0, 10),
(@OGUID+9, 142141, 0, 1955.09, -2288.2, 60.9163, 4.08407, 0, 0, -0.891006, 0.453991, 300, 300, 1, 100, 0, 10),
(@OGUID+10, 142141, 0, 1450, -1347.86, 61.3475, 1.76278, 0, 0, 0.771625, 0.636078, 300, 300, 1, 100, 0, 10),
(@OGUID+11, 142141, 0, 1922.05, -1480.68, 61.1334, 3.90954, 0, 0, -0.927183, 0.374608, 300, 300, 1, 100, 0, 10),
(@OGUID+12, 142141, 0, 1998.11, -1775.55, 64.2751, 1.18682, 0, 0, 0.559193, 0.829038, 300, 300, 1, 100, 0, 10),
(@OGUID+13, 142141, 0, 1607.96, -2178.57, 55.0344, 1.0821, 0, 0, 0.515038, 0.857168, 300, 300, 1, 100, 0, 10),
(@OGUID+14, 142141, 0, 2999.7, -1564.12, 147.003, 4.90438, 0, 0, -0.636078, 0.771625, 300, 300, 1, 100, 0, 10);

-- Missing Arthas' Tears spawns in Eastern Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+15, 142141, 0, 1572.06, -2977.36, 84.4113, 4.41568, 0, 0, -0.803857, 0.594823, 300, 300, 1, 100, 0, 10),
(@OGUID+16, 142141, 0, 1846.88, -3386.36, 114.412, 0.715585, 0, 0, 0.350207, 0.936672, 300, 300, 1, 100, 0, 10),
(@OGUID+17, 142141, 0, 2648.07, -4149.05, 82.2208, 2.47837, 0, 0, 0.945518, 0.325568, 300, 300, 1, 100, 0, 10),
(@OGUID+18, 142141, 0, 2703.26, -4790.44, 79.8637, 1.13446, 0, 0, 0.537299, 0.843392, 300, 300, 1, 100, 0, 10),
(@OGUID+19, 142141, 0, 2978.28, -3640.08, 134.325, 1.62316, 0, 0, 0.725374, 0.688355, 300, 300, 1, 100, 0, 10),
(@OGUID+20, 142141, 0, 3122.05, -4285.86, 112.994, 4.27606, 0, 0, -0.843391, 0.5373, 300, 300, 1, 100, 0, 10),
(@OGUID+21, 142141, 0, 3147.55, -3085.48, 149.058, 4.31097, 0, 0, -0.833885, 0.551938, 300, 300, 1, 100, 0, 10),
(@OGUID+22, 142141, 0, 2929.91, -4735.68, 91.4919, 4.46804, 0, 0, -0.788011, 0.615662, 300, 300, 1, 100, 0, 10),
(@OGUID+23, 142141, 0, 1949.96, -3962.64, 133.924, 1.58825, 0, 0, 0.71325, 0.70091, 300, 300, 1, 100, 0, 10),
(@OGUID+24, 142141, 0, 3192.78, -3243.9, 153.666, 5.16618, 0, 0, -0.529919, 0.848048, 300, 300, 1, 100, 0, 10),
(@OGUID+25, 142141, 0, 1499.3, -3183.54, 111.201, 0.453785, 0, 0, 0.224951, 0.97437, 300, 300, 1, 100, 0, 10),
(@OGUID+26, 142141, 0, 1986, -4740.94, 97.6036, 4.24115, 0, 0, -0.85264, 0.522499, 300, 300, 1, 100, 0, 10),
(@OGUID+27, 142141, 0, 2913.5, -4492.8, 91.647, 2.56563, 0, 0, 0.958819, 0.284016, 300, 300, 1, 100, 0, 10),
(@OGUID+28, 142141, 0, 3305.3, -3724.89, 156.091, 2.21657, 0, 0, 0.894934, 0.446199, 300, 300, 1, 100, 0, 10),
(@OGUID+29, 142141, 0, 1742.24, -3982.27, 129.338, 6.23083, 0, 0, -0.0261765, 0.999657, 300, 300, 1, 100, 0, 10),
(@OGUID+30, 142141, 0, 2011.19, -3766.6, 128.541, 6.26573, 0, 0, -0.00872612, 0.999962, 300, 300, 1, 100, 0, 10),
(@OGUID+31, 142141, 0, 2059.79, -5247.57, 86.0375, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 1, 100, 0, 10),
(@OGUID+32, 142141, 0, 3196.24, -3516.36, 149.184, 5.00909, 0, 0, -0.594823, 0.803857, 300, 300, 1, 100, 0, 10),
(@OGUID+33, 142141, 0, 2887.04, -3766.36, 112.598, 3.50812, 0, 0, -0.983254, 0.182238, 300, 300, 1, 100, 0, 10),
(@OGUID+34, 142141, 0, 1924.72, -4990.11, 75.2966, 1.81514, 0, 0, 0.788011, 0.615662, 300, 300, 1, 100, 0, 10);

-- Missing Arthas' Tears spawns in Felwood.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+35, 176642, 1, 6264.92, -1559.39, 451.637, 3.63029, 0, 0, -0.970295, 0.241925, 2700, 2700, 1, 100, 0, 10),
(@OGUID+36, 176642, 1, 4349.79, -513.339, 299.717, 0.087266, 0, 0, 0.0436192, 0.999048, 2700, 2700, 1, 100, 0, 10),
(@OGUID+37, 176642, 1, 3579.68, -1135.33, 219.174, 1.0821, 0, 0, 0.515038, 0.857168, 2700, 2700, 1, 100, 0, 10),
(@OGUID+38, 176642, 1, 3812.56, -755.703, 319.767, 2.75761, 0, 0, 0.981627, 0.190812, 2700, 2700, 1, 100, 0, 10),
(@OGUID+39, 176642, 1, 3900.77, -1445.23, 217.063, 5.044, 0, 0, -0.580703, 0.814116, 2700, 2700, 1, 100, 0, 10),
(@OGUID+40, 176642, 1, 3938.6, -918.995, 266.608, 3.03684, 0, 0, 0.998629, 0.0523532, 2700, 2700, 1, 100, 0, 10),
(@OGUID+41, 176642, 1, 4545.12, -940.496, 321.687, 6.16101, 0, 0, -0.0610485, 0.998135, 2700, 2700, 1, 100, 0, 10),
(@OGUID+42, 176642, 1, 4793.78, -408.137, 347.36, 0.139624, 0, 0, 0.0697556, 0.997564, 2700, 2700, 1, 100, 0, 10),
(@OGUID+43, 176642, 1, 5431.61, -543.402, 363.146, 3.28124, 0, 0, -0.997563, 0.0697661, 2700, 2700, 1, 100, 0, 10),
(@OGUID+44, 176642, 1, 5464.14, -872.528, 366.253, 5.35816, 0, 0, -0.446198, 0.894935, 2700, 2700, 1, 100, 0, 10),
(@OGUID+45, 176642, 1, 5606.94, -720.785, 342.258, 3.45576, 0, 0, -0.987688, 0.156436, 2700, 2700, 1, 100, 0, 10),
(@OGUID+46, 176642, 1, 6393.54, -744.701, 471.024, 0.296705, 0, 0, 0.147809, 0.989016, 2700, 2700, 1, 100, 0, 10),
(@OGUID+47, 176642, 1, 6517.34, -1392.39, 438.211, 0.453785, 0, 0, 0.224951, 0.97437, 2700, 2700, 1, 100, 0, 10),
(@OGUID+48, 176642, 1, 6526.05, -1016.26, 433.901, 5.58505, 0, 0, -0.34202, 0.939693, 2700, 2700, 1, 100, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1259, 0, 'Arthas Tears', 0, 10),
(@OGUID+2, 1259, 0, 'Arthas Tears', 0, 10),
(@OGUID+3, 1259, 0, 'Arthas Tears', 0, 10),
(@OGUID+4, 1259, 0, 'Arthas Tears', 0, 10),
(@OGUID+5, 1259, 0, 'Arthas Tears', 0, 10),
(@OGUID+6, 1259, 0, 'Arthas Tears', 0, 10),
(@OGUID+7, 1259, 0, 'Arthas Tears', 0, 10),
(@OGUID+8, 1259, 0, 'Arthas Tears', 0, 10),
(@OGUID+9, 1259, 0, 'Arthas Tears', 0, 10),
(@OGUID+10, 1259, 0, 'Arthas Tears', 0, 10),
(@OGUID+11, 1259, 0, 'Arthas Tears', 0, 10),
(@OGUID+12, 1259, 0, 'Arthas Tears', 0, 10),
(@OGUID+13, 1259, 0, 'Arthas Tears', 0, 10),
(@OGUID+14, 1259, 0, 'Arthas Tears', 0, 10),
(@OGUID+15, 1266, 0, 'Arthas Tears', 0, 10),
(@OGUID+16, 1266, 0, 'Arthas Tears', 0, 10),
(@OGUID+17, 1266, 0, 'Arthas Tears', 0, 10),
(@OGUID+18, 1266, 0, 'Arthas Tears', 0, 10),
(@OGUID+19, 1266, 0, 'Arthas Tears', 0, 10),
(@OGUID+20, 1266, 0, 'Arthas Tears', 0, 10),
(@OGUID+21, 1266, 0, 'Arthas Tears', 0, 10),
(@OGUID+22, 1266, 0, 'Arthas Tears', 0, 10),
(@OGUID+23, 1266, 0, 'Arthas Tears', 0, 10),
(@OGUID+24, 1266, 0, 'Arthas Tears', 0, 10),
(@OGUID+25, 1266, 0, 'Arthas Tears', 0, 10),
(@OGUID+26, 1266, 0, 'Arthas Tears', 0, 10),
(@OGUID+27, 1266, 0, 'Arthas Tears', 0, 10),
(@OGUID+28, 1266, 0, 'Arthas Tears', 0, 10),
(@OGUID+29, 1266, 0, 'Arthas Tears', 0, 10),
(@OGUID+30, 1266, 0, 'Arthas Tears', 0, 10),
(@OGUID+31, 1266, 0, 'Arthas Tears', 0, 10),
(@OGUID+32, 1266, 0, 'Arthas Tears', 0, 10),
(@OGUID+33, 1266, 0, 'Arthas Tears', 0, 10),
(@OGUID+34, 1266, 0, 'Arthas Tears', 0, 10),
(@OGUID+35, 1226, 0, 'Arthas Tears', 0, 10),
(@OGUID+36, 1226, 0, 'Arthas Tears', 0, 10),
(@OGUID+37, 1226, 0, 'Arthas Tears', 0, 10),
(@OGUID+38, 1226, 0, 'Arthas Tears', 0, 10),
(@OGUID+39, 1226, 0, 'Arthas Tears', 0, 10),
(@OGUID+40, 1226, 0, 'Arthas Tears', 0, 10),
(@OGUID+41, 1226, 0, 'Arthas Tears', 0, 10),
(@OGUID+42, 1226, 0, 'Arthas Tears', 0, 10),
(@OGUID+43, 1226, 0, 'Arthas Tears', 0, 10),
(@OGUID+44, 1226, 0, 'Arthas Tears', 0, 10),
(@OGUID+45, 1226, 0, 'Arthas Tears', 0, 10),
(@OGUID+46, 1226, 0, 'Arthas Tears', 0, 10),
(@OGUID+47, 1226, 0, 'Arthas Tears', 0, 10),
(@OGUID+48, 1226, 0, 'Arthas Tears', 0, 10);

-- Remove Custom Spawns (Non of these spawns exist in the sniff-db)
DELETE FROM `gameobject` WHERE `guid` IN (15988, 15995, 15949, 15950, 15951, 15952, 15953, 15954, 15955, 15956, 15957, 15958, 15959, 15960, 15961, 15962, 15963, 15964, 15965, 15969, 15970, 15971, 15972, 15973, 15975, 15976, 15977, 15978, 15979, 15981, 15982, 15983, 15984, 15985, 15986, 15987, 15989, 15990, 15993, 15994, 15996, 15997, 15998, 15999, 16000, 16001, 16004, 16005, 16006, 16008, 16009, 16010, 16012, 16013, 16014, 16016, 16017, 16018, 16019, 16020, 16021, 16023, 16024, 16025);
DELETE FROM `pool_gameobject` WHERE `guid` IN (15988, 15995, 15949, 15950, 15951, 15952, 15953, 15954, 15955, 15956, 15957, 15958, 15959, 15960, 15961, 15962, 15963, 15964, 15965, 15969, 15970, 15971, 15972, 15973, 15975, 15976, 15977, 15978, 15979, 15981, 15982, 15983, 15984, 15985, 15986, 15987, 15989, 15990, 15993, 15994, 15996, 15997, 15998, 15999, 16000, 16001, 16004, 16005, 16006, 16008, 16009, 16010, 16012, 16013, 16014, 16016, 16017, 16018, 16019, 16020, 16021, 16023, 16024, 16025);

-- Sync Gobject Data
UPDATE `gameobject` SET `spawn_flags` = 0 WHERE `id` IN (142141, 176642);

-- Rename Pools
UPDATE `pool_template` SET `description` = 'Arthas Tears in Eastern Plaguelands' WHERE `entry` = 1266;
UPDATE `pool_template` SET `description` = 'Arthas Tears in Western Plaguelands' WHERE `entry` = 1259;
UPDATE `pool_template` SET `description` = 'Arthas Tears in Felwood' WHERE `entry` = 1226;
UPDATE pool_gameobject SET `description` = 'Arthas Tears' WHERE description LIKE 'Arthas\' Tears';

-- Update Counters
UPDATE `pool_template` SET `max_limit` = 8 WHERE `entry`=1226;
UPDATE `pool_template` SET `max_limit` = 18 WHERE `entry`=1259;
UPDATE `pool_template` SET `max_limit` = 25 WHERE `entry`=1266;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
