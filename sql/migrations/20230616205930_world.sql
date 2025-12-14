DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230616205930');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230616205930');
-- Add your query below.


-- Mageroyal (1620, 3727)
SET @OGUID = 40331;

-- Correct position of Mageroyal in Hillsbrad Foothills (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-81.7724, `position_y`=-770.163, `position_z`=56.3972, `orientation`=2.67035, `rotation0`=0, `rotation1`=0, `rotation2`=0.972369, `rotation3`=0.233448 WHERE `guid`=2399;

-- Correct position of Mageroyal in Wailing Caverns (position is off by 1.44779 yards).
UPDATE `gameobject` SET `position_x`=-638.831, `position_y`=-2382.15, `position_z`=25.5687, `orientation`=3.99681, `rotation0`=0, `rotation1`=0, `rotation2`=-0.909961, `rotation3`=0.414694 WHERE `guid`=2085;

-- Correct position of Mageroyal in Wetlands (position is off by 0.995237 yards).
UPDATE `gameobject` SET `position_x`=-3615.94, `position_y`=-2842.3, `position_z`=14.4793, `orientation`=2.33874, `rotation0`=0, `rotation1`=0, `rotation2`=0.920505, `rotation3`=0.390732 WHERE `guid`=2149;

-- Correct position of Mageroyal in Redridge Mountains (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-9670.18, `position_y`=-1768.52, `position_z`=55.2736, `orientation`=4.7822, `rotation0`=0, `rotation1`=0, `rotation2`=-0.681998, `rotation3`=0.731354 WHERE `guid`=2288;

-- Correct position of Mageroyal in Durotar (position is off by 0.0400392 yards).
UPDATE `gameobject` SET `position_x`=763.569, `position_y`=-5037.04, `position_z`=7.18091, `orientation`=0.366518, `rotation0`=0, `rotation1`=0, `rotation2`=0.182235, `rotation3`=0.983255 WHERE `guid`=2278;

-- Correct position of Mageroyal in Duskwood (position is off by 0.417969 yards).
UPDATE `gameobject` SET `position_x`=-10778.7, `position_y`=-774.291, `position_z`=43.2322, `orientation`=3.97935, `rotation0`=0, `rotation1`=0, `rotation2`=-0.913545, `rotation3`=0.406738 WHERE `guid`=2265;

-- Correct position of Mageroyal in Hillsbrad Foothills (position is off by 0.453672 yards).
UPDATE `gameobject` SET `position_x`=-716.563, `position_y`=-682.115, `position_z`=13.0308, `orientation`=0.366518, `rotation0`=0, `rotation1`=0, `rotation2`=0.182235, `rotation3`=0.983255 WHERE `guid`=2516;

-- Correct position of Mageroyal in Loch Modan (position is off by 0.550393 yards).
UPDATE `gameobject` SET `position_x`=-5097.52, `position_y`=-3121.19, `position_z`=307.458, `orientation`=2.23402, `rotation0`=0, `rotation1`=0, `rotation2`=0.898793, `rotation3`=0.438373 WHERE `guid`=2169;

-- Correct position of Mageroyal in Duskwood (position is off by 0.923807 yards).
UPDATE `gameobject` SET `position_x`=-11081.7, `position_y`=-573.128, `position_z`=31.9725, `orientation`=2.1293, `rotation0`=0, `rotation1`=0, `rotation2`=0.874619, `rotation3`=0.48481 WHERE `guid`=2175;

-- Correct position of Mageroyal in Durotar (position is off by 2.81296 yards).
UPDATE `gameobject` SET `position_x`=1208.47, `position_y`=-5022.59, `position_z`=9.97329, `orientation`=4.15388, `rotation0`=0, `rotation1`=0, `rotation2`=-0.874619, `rotation3`=0.48481 WHERE `guid`=2366;

-- Correct position of Mageroyal in Wetlands (position is off by 0.613826 yards).
UPDATE `gameobject` SET `position_x`=-3982.32, `position_y`=-2953.52, `position_z`=12.4004, `orientation`=0.174532, `rotation0`=0, `rotation1`=0, `rotation2`=0.0871553, `rotation3`=0.996195 WHERE `guid`=2367;

-- Correct position of Mageroyal in Loch Modan (position is off by 0.00100708 yards).
UPDATE `gameobject` SET `position_x`=-5042.01, `position_y`=-3358.18, `position_z`=298.811, `orientation`=5.48033, `rotation0`=0, `rotation1`=0, `rotation2`=-0.390731, `rotation3`=0.920505 WHERE `guid`=2032;

-- Correct position of Mageroyal in Ashenvale (position is off by 4.60367 yards).
UPDATE `gameobject` SET `position_x`=3120.4, `position_y`=397.705, `position_z`=5.82121, `orientation`=4.18879, `rotation0`=0, `rotation1`=0, `rotation2`=-0.866025, `rotation3`=0.500001 WHERE `guid`=2526;

-- Correct position of Mageroyal in Darkshore (position is off by 0.867345 yards).
UPDATE `gameobject` SET `position_x`=5411.81, `position_y`=463.373, `position_z`=19.6885, `orientation`=0.698131, `rotation0`=0, `rotation1`=0, `rotation2`=0.34202, `rotation3`=0.939693 WHERE `guid`=2327;

-- Correct position of Mageroyal in Silverpine Forest (position is off by 0.828329 yards).
UPDATE `gameobject` SET `position_x`=944.517, `position_y`=1541.33, `position_z`=33.5463, `orientation`=3.97935, `rotation0`=0, `rotation1`=0, `rotation2`=-0.913545, `rotation3`=0.406738 WHERE `guid`=2120;

-- Correct position of Mageroyal in Silverpine Forest (position is off by 0.690258 yards).
UPDATE `gameobject` SET `position_x`=1087.7, `position_y`=1095.32, `position_z`=39.4568, `orientation`=1.88495, `rotation0`=0, `rotation1`=0, `rotation2`=0.809016, `rotation3`=0.587786 WHERE `guid`=2476;

-- Correct position of Mageroyal in Silverpine Forest (position is off by 0.661915 yards).
UPDATE `gameobject` SET `position_x`=631.639, `position_y`=1193.88, `position_z`=71.4564, `orientation`=2.67035, `rotation0`=0, `rotation1`=0, `rotation2`=0.972369, `rotation3`=0.233448 WHERE `guid`=2514;

-- Correct position of Mageroyal in Silverpine Forest (position is off by 0.980697 yards).
UPDATE `gameobject` SET `position_x`=1151.6, `position_y`=1371.06, `position_z`=36.6387, `orientation`=2.51327, `rotation0`=0, `rotation1`=0, `rotation2`=0.951056, `rotation3`=0.309017 WHERE `guid`=2448;

-- Correct position of Mageroyal in Wetlands (position is off by 0.000101089 yards).
UPDATE `gameobject` SET `position_x`=-3847.47, `position_y`=-2681.57, `position_z`=31.1855, `orientation`=5.39307, `rotation0`=0, `rotation1`=0, `rotation2`=-0.430511, `rotation3`=0.902586 WHERE `guid`=2396;

-- Correct position of Mageroyal in Wetlands (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-3918.23, `position_y`=-2716.54, `position_z`=26.4427, `orientation`=5.20108, `rotation0`=0, `rotation1`=0, `rotation2`=-0.515038, `rotation3`=0.857168 WHERE `guid`=2416;

-- Correct position of Mageroyal in Silverpine Forest (position is off by 0.892711 yards).
UPDATE `gameobject` SET `position_x`=843.962, `position_y`=1089.3, `position_z`=46.8802, `orientation`=1.309, `rotation0`=0, `rotation1`=0, `rotation2`=0.608761, `rotation3`=0.793354 WHERE `guid`=2155;

-- Correct position of Mageroyal in Loch Modan (position is off by 0.250193 yards).
UPDATE `gameobject` SET `position_x`=-4896.99, `position_y`=-3304.25, `position_z`=304.202, `orientation`=1.51844, `rotation0`=0, `rotation1`=0, `rotation2`=0.688354, `rotation3`=0.725374 WHERE `guid`=2309;

-- Correct position of Mageroyal in Silverpine Forest (position is off by 0.0711021 yards).
UPDATE `gameobject` SET `position_x`=1338.74, `position_y`=800.474, `position_z`=34.4119, `orientation`=1.6057, `rotation0`=0, `rotation1`=0, `rotation2`=0.719339, `rotation3`=0.694659 WHERE `guid`=2224;

-- Correct position of Mageroyal in Silverpine Forest (position is off by 0.55116 yards).
UPDATE `gameobject` SET `position_x`=1199.77, `position_y`=940.93, `position_z`=34.9147, `orientation`=3.08918, `rotation0`=0, `rotation1`=0, `rotation2`=0.999657, `rotation3`=0.0262016 WHERE `guid`=2527;

-- Correct position of Mageroyal in Wetlands (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-3317.16, `position_y`=-2676.49, `position_z`=14.5291, `orientation`=6.02139, `rotation0`=0, `rotation1`=0, `rotation2`=-0.130526, `rotation3`=0.991445 WHERE `guid`=2484;

-- Correct position of Mageroyal in Durotar (position is off by 0.957141 yards).
UPDATE `gameobject` SET `position_x`=816.497, `position_y`=-4099.66, `position_z`=-13.1232, `orientation`=4.39823, `rotation0`=0, `rotation1`=0, `rotation2`=-0.809016, `rotation3`=0.587786 WHERE `guid`=2420;

-- Correct position of Mageroyal in Darkshore (position is off by 0.289892 yards).
UPDATE `gameobject` SET `position_x`=5097.59, `position_y`=514.898, `position_z`=13.3284, `orientation`=0.087266, `rotation0`=0, `rotation1`=0, `rotation2`=0.0436192, `rotation3`=0.999048 WHERE `guid`=2432;

-- Correct position of Mageroyal in Loch Modan (position is off by 0.450912 yards).
UPDATE `gameobject` SET `position_x`=-5266.11, `position_y`=-3118.4, `position_z`=300.486, `orientation`=0.698131, `rotation0`=0, `rotation1`=0, `rotation2`=0.34202, `rotation3`=0.939693 WHERE `guid`=2101;

-- Correct position of Mageroyal in Loch Modan (position is off by 0.565112 yards).
UPDATE `gameobject` SET `position_x`=-5064.71, `position_y`=-3133.72, `position_z`=299.455, `orientation`=6.02139, `rotation0`=0, `rotation1`=0, `rotation2`=-0.130526, `rotation3`=0.991445 WHERE `guid`=2422;

-- Correct position of Mageroyal in Ashenvale (position is off by 0.00976563 yards).
UPDATE `gameobject` SET `position_x`=2227.15, `position_y`=-2295.62, `position_z`=104.684, `orientation`=2.02458, `rotation0`=0, `rotation1`=0, `rotation2`=0.848047, `rotation3`=0.529921 WHERE `guid`=47912;

-- Correct position of Mageroyal in Ashenvale (position is off by 0.965666 yards).
UPDATE `gameobject` SET `position_x`=1398.94, `position_y`=-2367.47, `position_z`=106.623, `orientation`=3.68265, `rotation0`=0, `rotation1`=0, `rotation2`=-0.96363, `rotation3`=0.267241 WHERE `guid`=2467;

-- Correct position of Mageroyal in Silverpine Forest (position is off by 0.510707 yards).
UPDATE `gameobject` SET `position_x`=1017.85, `position_y`=1068.03, `position_z`=39.512, `orientation`=3.49067, `rotation0`=0, `rotation1`=0, `rotation2`=-0.984807, `rotation3`=0.173652 WHERE `guid`=2115;

-- Correct position of Mageroyal in Silverpine Forest (position is off by 0.514951 yards).
UPDATE `gameobject` SET `position_x`=1183.83, `position_y`=382.143, `position_z`=33.6484, `orientation`=5.35816, `rotation0`=0, `rotation1`=0, `rotation2`=-0.446198, `rotation3`=0.894935 WHERE `guid`=2365;

-- Correct position of Mageroyal in Silverpine Forest (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=1418.59, `position_y`=578.4, `position_z`=35.8319, `orientation`=3.05433, `rotation0`=0, `rotation1`=0, `rotation2`=0.999048, `rotation3`=0.0436193 WHERE `guid`=2338;

-- Correct position of Mageroyal in Loch Modan (position is off by 1.41855 yards).
UPDATE `gameobject` SET `position_x`=-5325.98, `position_y`=-3041.61, `position_z`=327.224, `orientation`=1.39626, `rotation0`=0, `rotation1`=0, `rotation2`=0.642787, `rotation3`=0.766045 WHERE `guid`=2237;

-- Correct position of Mageroyal in Darkshore (position is off by 0.604366 yards).
UPDATE `gameobject` SET `position_x`=5866.61, `position_y`=166.033, `position_z`=31.1269, `orientation`=1.0472, `rotation0`=0, `rotation1`=0, `rotation2`=0.5, `rotation3`=0.866025 WHERE `guid`=2235;

-- Correct position of Mageroyal in Darkshore (position is off by 0.0195007 yards).
UPDATE `gameobject` SET `position_x`=5914.91, `position_y`=415.128, `position_z`=18.8381, `orientation`=1.36136, `rotation0`=0, `rotation1`=0, `rotation2`=0.62932, `rotation3`=0.777146 WHERE `guid`=2295;

-- Correct position of Mageroyal in Darkshore (position is off by 0.644824 yards).
UPDATE `gameobject` SET `position_x`=5530.29, `position_y`=64.6255, `position_z`=36.8811, `orientation`=4.2237, `rotation0`=0, `rotation1`=0, `rotation2`=-0.857167, `rotation3`=0.515038 WHERE `guid`=2286;

-- Correct position of Mageroyal in Darkshore (position is off by 0.861269 yards).
UPDATE `gameobject` SET `position_x`=7331.05, `position_y`=-274.139, `position_z`=9.089, `orientation`=5.35816, `rotation0`=0, `rotation1`=0, `rotation2`=-0.446198, `rotation3`=0.894935 WHERE `guid`=2458;

-- Correct position of Mageroyal in Darkshore (position is off by 0.982419 yards).
UPDATE `gameobject` SET `position_x`=5156.7, `position_y`=190.836, `position_z`=37.0906, `orientation`=4.66003, `rotation0`=0, `rotation1`=0, `rotation2`=-0.725374, `rotation3`=0.688355 WHERE `guid`=2305;

-- Correct position of Mageroyal in Darkshore (position is off by 1.20171 yards).
UPDATE `gameobject` SET `position_x`=4545.84, `position_y`=391.536, `position_z`=33.7408, `orientation`=2.09439, `rotation0`=0, `rotation1`=0, `rotation2`=0.866025, `rotation3`=0.500001 WHERE `guid`=2404;

-- Correct position of Mageroyal in Darkshore (position is off by 0.364344 yards).
UPDATE `gameobject` SET `position_x`=4407.68, `position_y`=677.593, `position_z`=25.6926, `orientation`=1.55334, `rotation0`=0, `rotation1`=0, `rotation2`=0.700909, `rotation3`=0.713251 WHERE `guid`=2415;

-- Correct position of Mageroyal in Darkshore (position is off by 0.464915 yards).
UPDATE `gameobject` SET `position_x`=4953.92, `position_y`=435.788, `position_z`=33.406, `orientation`=1.18682, `rotation0`=0, `rotation1`=0, `rotation2`=0.559193, `rotation3`=0.829038 WHERE `guid`=2529;

-- Correct position of Mageroyal in Westfall (position is off by 0.400756 yards).
UPDATE `gameobject` SET `position_x`=-10112.6, `position_y`=941.912, `position_z`=33.8729, `orientation`=2.67035, `rotation0`=0, `rotation1`=0, `rotation2`=0.972369, `rotation3`=0.233448 WHERE `guid`=2428;

-- Correct position of Mageroyal in Darkshore (position is off by 0.567038 yards).
UPDATE `gameobject` SET `position_x`=6857.36, `position_y`=410.354, `position_z`=15.3431, `orientation`=0.767944, `rotation0`=0, `rotation1`=0, `rotation2`=0.374606, `rotation3`=0.927184 WHERE `guid`=2478;

-- Correct position of Mageroyal in Durotar (position is off by 0.55203 yards).
UPDATE `gameobject` SET `position_x`=65.1475, `position_y`=-4306.45, `position_z`=62.9975, `orientation`=3.31614, `rotation0`=0, `rotation1`=0, `rotation2`=-0.996194, `rotation3`=0.087165 WHERE `guid`=2321;

-- Correct position of Mageroyal in Wailing Caverns (position is off by 2.88894 yards).
UPDATE `gameobject` SET `position_x`=-765.455, `position_y`=-2075.23, `position_z`=72.9444, `orientation`=3.4034, `rotation0`=0, `rotation1`=0, `rotation2`=-0.991445, `rotation3`=0.130528 WHERE `guid`=2474;

-- Correct position of Mageroyal in Darkshore (position is off by 1.00914 yards).
UPDATE `gameobject` SET `position_x`=6734.41, `position_y`=433.311, `position_z`=20.08, `orientation`=0.296705, `rotation0`=0, `rotation1`=0, `rotation2`=0.147809, `rotation3`=0.989016 WHERE `guid`=2129;

-- Correct position of Mageroyal in Redridge Mountains (position is off by 0.539192 yards).
UPDATE `gameobject` SET `position_x`=-9666.2, `position_y`=-2385.5, `position_z`=60.3805, `orientation`=4.13643, `rotation0`=0, `rotation1`=0, `rotation2`=-0.878817, `rotation3`=0.47716 WHERE `guid`=2323;

-- Correct position of Mageroyal in Redridge Mountains (position is off by 0.327695 yards).
UPDATE `gameobject` SET `position_x`=-9686.32, `position_y`=-2579.04, `position_z`=60.0086, `orientation`=5.75959, `rotation0`=0, `rotation1`=0, `rotation2`=-0.258819, `rotation3`=0.965926 WHERE `guid`=2189;

-- Correct position of Mageroyal in Redridge Mountains (position is off by 0.922564 yards).
UPDATE `gameobject` SET `position_x`=-9282.55, `position_y`=-2730.74, `position_z`=84.4196, `orientation`=2.74016, `rotation0`=0, `rotation1`=0, `rotation2`=0.979924, `rotation3`=0.19937 WHERE `guid`=2335;

-- Correct position of Mageroyal in Redridge Mountains (position is off by 0.986124 yards).
UPDATE `gameobject` SET `position_x`=-9329.94, `position_y`=-1899.88, `position_z`=68.762, `orientation`=1.29154, `rotation0`=0, `rotation1`=0, `rotation2`=0.601814, `rotation3`=0.798636 WHERE `guid`=2457;

-- Correct position of Mageroyal in Westfall (position is off by 0.31258 yards).
UPDATE `gameobject` SET `position_x`=-10504.3, `position_y`=853.873, `position_z`=38.4224, `orientation`=2.35619, `rotation0`=0, `rotation1`=0, `rotation2`=0.92388, `rotation3`=0.382683 WHERE `guid`=2319;

-- Missing Mageroyal spawns in Duskwood.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1620, 0, -10020.2, -883.023, 29.7899, 2.51327, 0, 0, 0.951056, 0.309017, 300, 300, 1, 100, 0, 10), 
(@OGUID+2, 1620, 0, -10156.3, 273.428, 22.5262, 4.46804, 0, 0, -0.788011, 0.615662, 300, 300, 1, 100, 0, 10), 
(@OGUID+3, 1620, 0, -10953.2, 255.44, 28.4609, 1.48353, 0, 0, 0.67559, 0.737278, 300, 300, 1, 100, 0, 10), 
(@OGUID+4, 1620, 0, -10024.5, -1190.48, 27.327, 4.32842, 0, 0, -0.829037, 0.559194, 300, 300, 1, 100, 0, 10), 
(@OGUID+5, 1620, 0, -10810.8, -627.807, 39.8429, 0.209439, 0, 0, 0.104528, 0.994522, 300, 300, 1, 100, 0, 10), 
(@OGUID+6, 1620, 0, -11040.9, -1344.31, 53.8028, 5.63741, 0, 0, -0.317305, 0.948324, 300, 300, 1, 100, 0, 10), 
(@OGUID+7, 1620, 0, -11091.2, -922.671, 62.7309, 3.57793, 0, 0, -0.976295, 0.216442, 300, 300, 1, 100, 0, 10),
(@OGUID+8, 1620, 0, -11047.3, -1116.92, 38.599, 0.296705, 0, 0, 0.147809, 0.989016, 300, 300, 1, 100, 0, 10),
(@OGUID+9, 1620, 0, -10380, -916.736, 46.281, 0.506145, 0, 0, 0.25038, 0.968148, 300, 300, 1, 100, 0, 10),
(@OGUID+10, 1620, 0, -10355.7, 117.561, 30.0454, 2.51327, 0, 0, 0.951056, 0.309017, 300, 300, 1, 100, 0, 10),
(@OGUID+11, 1620, 0, -10193, 88.2101, 27.1032, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 1, 100, 0, 10),
(@OGUID+12, 1620, 0, -10147.6, -61.248, 29.0283, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 1, 100, 0, 10);

-- Missing Mageroyal spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+13, 1620, 0, -3465.23, -2913.83, 12.7782, 1.98967, 0, 0, 0.83867, 0.54464, 300, 300, 1, 100, 0, 10), 
(@OGUID+14, 1620, 0, -2807.56, -1419.77, 11.2288, 1.48353, 0, 0, 0.67559, 0.737278, 300, 300, 1, 100, 0, 10), 
(@OGUID+15, 1620, 0, -2713.41, -1618.32, 10.448, 3.22886, 0, 0, -0.999048, 0.0436193, 300, 300, 1, 100, 0, 10), 
(@OGUID+16, 1620, 0, -2827.41, -1577.76, 9.48537, 2.14675, 0, 0, 0.878817, 0.47716, 300, 300, 1, 100, 0, 10), 
(@OGUID+17, 1620, 0, -3146.9, -3052.36, 23.1651, 4.53786, 0, 0, -0.766044, 0.642789, 300, 300, 1, 100, 0, 10), 
(@OGUID+18, 1620, 0, -3551.67, -2947.16, 11.5434, 0.226892, 0, 0, 0.113203, 0.993572, 300, 300, 1, 100, 0, 10), 
(@OGUID+19, 1620, 0, -3556.89, -1394.49, 9.70738, 2.30383, 0, 0, 0.913545, 0.406738, 300, 300, 1, 100, 0, 10),
(@OGUID+20, 1620, 0, -3500.03, -1740.5, 24.6364, 0.925024, 0, 0, 0.446198, 0.894935, 300, 300, 1, 100, 0, 10),
(@OGUID+21, 1620, 0, -2988.7, -2823.87, 26.3481, 5.70723, 0, 0, -0.284015, 0.95882, 300, 300, 1, 100, 0, 10),
(@OGUID+22, 1620, 0, -2974.33, -2288.35, 9.21251, 0.90757, 0, 0, 0.438371, 0.898794, 300, 300, 1, 100, 0, 10);

-- Missing Mageroyal spawns in Durotar.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+23, 1620, 1, 1450.59, -4902.48, 9.71276, 3.83973, 0, 0, -0.939692, 0.34202, 300, 300, 1, 100, 0, 10), 
(@OGUID+24, 1620, 1, 931.2, -4038.23, -13.3467, 3.97935, 0, 0, -0.913545, 0.406738, 300, 300, 1, 100, 0, 10), 
(@OGUID+25, 1620, 1, 122.15, -4474.05, 37.6347, 2.07694, 0, 0, 0.861629, 0.507539, 300, 300, 1, 100, 0, 10), 
(@OGUID+26, 1620, 1, 607.727, -4524.54, 11.3804, 2.25147, 0, 0, 0.902585, 0.430512, 300, 300, 1, 100, 0, 10),
(@OGUID+27, 1620, 1, 933.945, -4606.53, 18.4671, 0.663223, 0, 0, 0.325567, 0.945519, 300, 300, 1, 100, 0, 10);

-- Missing Mageroyal spawns in Loch Modan.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+28, 1620, 0, -5164.25, -3518.23, 297.873, 5.68977, 0, 0, -0.292372, 0.956305, 300, 300, 1, 100, 0, 10), 
(@OGUID+29, 1620, 0, -5133.2, -3120.28, 305.114, 3.05433, 0, 0, 0.999048, 0.0436193, 300, 300, 1, 100, 0, 10), 
(@OGUID+30, 1620, 0, -5430.76, -3878.28, 332.083, 6.16101, 0, 0, -0.0610485, 0.998135, 300, 300, 1, 100, 0, 10), 
(@OGUID+31, 1620, 0, -5005.27, -3419.37, 303.401, 3.07177, 0, 0, 0.999391, 0.0349061, 300, 300, 1, 100, 0, 10), 
(@OGUID+32, 1620, 0, -5234.17, -3462.64, 298.184, 1.5708, 0, 0, 0.707107, 0.707107, 300, 300, 1, 100, 0, 10), 
(@OGUID+33, 1620, 0, -5548.28, -4147.27, 376.306, 5.28835, 0, 0, -0.477159, 0.878817, 300, 300, 1, 100, 0, 10), 
(@OGUID+34, 1620, 0, -4949.69, -3498.08, 304.366, 6.03884, 0, 0, -0.121869, 0.992546, 300, 300, 1, 100, 0, 10), 
(@OGUID+35, 1620, 0, -5316.76, -3758.36, 310.217, 2.60054, 0, 0, 0.96363, 0.267241, 300, 300, 1, 100, 0, 10), 
(@OGUID+36, 1620, 0, -5520.58, -3816.57, 324.065, 0.523598, 0, 0, 0.258819, 0.965926, 300, 300, 1, 100, 0, 10), 
(@OGUID+37, 1620, 0, -5601.12, -3600.26, 304.148, 3.35105, 0, 0, -0.994521, 0.104536, 300, 300, 1, 100, 0, 10), 
(@OGUID+38, 1620, 0, -5072.19, -3795.14, 310.585, 2.40855, 0, 0, 0.93358, 0.358368, 300, 300, 1, 100, 0, 10), 
(@OGUID+39, 1620, 0, -5357.81, -3853.27, 332.392, 0.104719, 0, 0, 0.0523357, 0.99863, 300, 300, 1, 100, 0, 10),
(@OGUID+40, 1620, 0, -5355.99, -2734.98, 360.778, 5.93412, 0, 0, -0.173648, 0.984808, 300, 300, 1, 100, 0, 10),
(@OGUID+41, 1620, 0, -5313.25, -3015.33, 325.537, 0.645772, 0, 0, 0.317305, 0.948324, 300, 300, 1, 100, 0, 10),
(@OGUID+42, 1620, 0, -4890.47, -3605.77, 303.213, 0.733038, 0, 0, 0.358368, 0.93358, 300, 300, 1, 100, 0, 10),
(@OGUID+43, 1620, 0, -4839.14, -3537.37, 300.648, 3.7001, 0, 0, -0.961261, 0.27564, 300, 300, 1, 100, 0, 10);

-- Missing Mageroyal spawns in Westfall.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+44, 1620, 0, -10301.8, 2022.11, 11.1882, 4.20625, 0, 0, -0.861629, 0.507539, 300, 300, 1, 100, 0, 10), 
(@OGUID+45, 1620, 0, -9802.65, 1674.11, 11.6686, 3.42085, 0, 0, -0.990268, 0.139175, 300, 300, 1, 100, 0, 10), 
(@OGUID+46, 1620, 0, -10804.1, 2060.42, 10.0065, 2.11185, 0, 0, 0.870356, 0.492424, 300, 300, 1, 100, 0, 10), 
(@OGUID+47, 1620, 0, -9782.94, 1451.85, 44.3567, 3.78737, 0, 0, -0.948323, 0.317306, 300, 300, 1, 100, 0, 10), 
(@OGUID+48, 1620, 0, -11079.2, 1388.65, 45.8765, 1.13446, 0, 0, 0.537299, 0.843392, 300, 300, 1, 100, 0, 10), 
(@OGUID+49, 1620, 0, -10918.7, 1716.64, 37.2192, 5.75959, 0, 0, -0.258819, 0.965926, 300, 300, 1, 100, 0, 10),
(@OGUID+50, 1620, 0, -10901.2, 1166.75, 35.9096, 2.68781, 0, 0, 0.97437, 0.224951, 300, 300, 1, 100, 0, 10),
(@OGUID+51, 1620, 0, -10770.6, 1265, 31.3255, 1.53589, 0, 0, 0.694658, 0.71934, 300, 300, 1, 100, 0, 10),
(@OGUID+52, 1620, 0, -10444.5, 1296.04, 42.227, 4.39823, 0, 0, -0.809016, 0.587786, 300, 300, 1, 100, 0, 10),
(@OGUID+53, 1620, 0, -10429, 1900.47, 6.06006, 0.977383, 0, 0, 0.469471, 0.882948, 300, 300, 1, 100, 0, 10),
(@OGUID+54, 1620, 0, -10368.2, 1069.46, 36.6281, 0.0698117, 0, 0, 0.0348988, 0.999391, 300, 300, 1, 100, 0, 10),
(@OGUID+55, 1620, 0, -10124.6, 1280.59, 39.4595, 3.7001, 0, 0, -0.961261, 0.27564, 300, 300, 1, 100, 0, 10),
(@OGUID+56, 1620, 0, -9699.21, 1276.32, 10.1858, 5.39307, 0, 0, -0.430511, 0.902586, 300, 300, 1, 100, 0, 10),
(@OGUID+57, 1620, 0, -9657.54, 1504.9, 11.0599, 1.78023, 0, 0, 0.777145, 0.629321, 300, 300, 1, 100, 0, 10);

-- Missing Mageroyal spawns in Redridge Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+58, 1620, 0, -9512.06, -1926.95, 76.6898, 4.64258, 0, 0, -0.731354, 0.681998, 300, 300, 1, 100, 0, 10), 
(@OGUID+59, 1620, 0, -9688.03, -2101.71, 58.5017, 4.01426, 0, 0, -0.906307, 0.422619, 300, 300, 1, 100, 0, 10), 
(@OGUID+60, 1620, 0, -9128.02, -2076.13, 124.798, 0.331611, 0, 0, 0.165047, 0.986286, 300, 300, 1, 100, 0, 10), 
(@OGUID+61, 1620, 0, -8744.09, -2456.23, 138.914, 1.79769, 0, 0, 0.782608, 0.622515, 300, 300, 1, 100, 0, 10), 
(@OGUID+62, 1620, 0, -9642.1, -3141.26, 48.5806, 1.88495, 0, 0, 0.809016, 0.587786, 300, 300, 1, 100, 0, 10), 
(@OGUID+63, 1620, 0, -8976.07, -2171.74, 132.628, 0.0698117, 0, 0, 0.0348988, 0.999391, 300, 300, 1, 100, 0, 10), 
(@OGUID+64, 1620, 0, -9357.58, -3256.63, 89.7532, 2.9845, 0, 0, 0.996917, 0.0784664, 300, 300, 1, 100, 0, 10),
(@OGUID+65, 1620, 0, -9185.93, -3013.12, 93.766, 0.366518, 0, 0, 0.182235, 0.983255, 300, 300, 1, 100, 0, 10),
(@OGUID+66, 1620, 0, -8960.17, -2067.33, 133.509, 0.453785, 0, 0, 0.224951, 0.97437, 300, 300, 1, 100, 0, 10);

-- Missing Mageroyal spawns in Silverpine Forest.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+67, 1620, 0, 835.827, 1389.05, 40.3876, 5.00909, 0, 0, -0.594823, 0.803857, 300, 300, 1, 100, 0, 10), 
(@OGUID+68, 1620, 0, 828.751, 1186.54, 48.3242, 5.88176, 0, 0, -0.199368, 0.979925, 300, 300, 1, 100, 0, 10), 
(@OGUID+69, 1620, 0, 626.599, 1114.28, 63.7859, 2.14675, 0, 0, 0.878817, 0.47716, 300, 300, 1, 100, 0, 10), 
(@OGUID+70, 1620, 0, 618.615, 589.892, 34.8883, 1.91986, 0, 0, 0.819152, 0.573577, 300, 300, 1, 100, 0, 10), 
(@OGUID+71, 1620, 0, 664.761, 1137.47, 57.2768, 3.00195, 0, 0, 0.997563, 0.0697661, 300, 300, 1, 100, 0, 10), 
(@OGUID+72, 1620, 0, 833.252, 1214.64, 48.6721, 2.61799, 0, 0, 0.965925, 0.258821, 300, 300, 1, 100, 0, 10), 
(@OGUID+73, 1620, 0, 905.735, 1404.78, 35.6612, 1.6057, 0, 0, 0.719339, 0.694659, 300, 300, 1, 100, 0, 10), 
(@OGUID+74, 1620, 0, -538.041, 1282.96, 56.2798, 0.925024, 0, 0, 0.446198, 0.894935, 300, 300, 1, 100, 0, 10), 
(@OGUID+75, 1620, 0, -519.838, 1466.36, 19.123, 3.82227, 0, 0, -0.942641, 0.333808, 300, 300, 1, 100, 0, 10), 
(@OGUID+76, 1620, 0, -240.384, 1216.4, 50.4127, 5.02655, 0, 0, -0.587785, 0.809017, 300, 300, 1, 100, 0, 10), 
(@OGUID+77, 1620, 0, -457.327, 1176.1, 59.4468, 5.67232, 0, 0, -0.300705, 0.953717, 300, 300, 1, 100, 0, 10), 
(@OGUID+78, 1620, 0, 111.52, 1174.16, 65.381, 3.17653, 0, 0, -0.999847, 0.0174693, 300, 300, 1, 100, 0, 10),
(@OGUID+79, 1620, 0, 840.177, 1330.11, 33.9282, 3.17653, 0, 0, -0.999847, 0.0174693, 300, 300, 1, 100, 0, 10);

-- Missing Mageroyal spawns in Teldrassil.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+80, 1620, 1, 10019.4, 483.16, 1314.04, 2.19911, 0, 0, 0.891006, 0.453991, 300, 300, 1, 100, 0, 10), 
(@OGUID+81, 1620, 1, 9561.74, 531.118, 1322.48, 3.85718, 0, 0, -0.936671, 0.35021, 300, 300, 1, 100, 0, 10), 
(@OGUID+82, 1620, 1, 9588.16, 1090.76, 1267.09, 0.942477, 0, 0, 0.45399, 0.891007, 300, 300, 1, 100, 0, 10), 
(@OGUID+83, 1620, 1, 9777.3, 1797.91, 1305.34, 5.86431, 0, 0, -0.207911, 0.978148, 300, 300, 1, 100, 0, 10), 
(@OGUID+84, 1620, 1, 9406.23, 1474.91, 1283.58, 0.349065, 0, 0, 0.173648, 0.984808, 300, 300, 1, 100, 0, 10), 
(@OGUID+85, 1620, 1, 9438.21, 1088.4, 1251.8, 5.2709, 0, 0, -0.484809, 0.87462, 300, 300, 1, 100, 0, 10); 

-- Missing Mageroyal spawns in Darkshore.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+86, 1620, 1, 7549.78, -934.65, 12.8812, 4.15388, 0, 0, -0.874619, 0.48481, 300, 300, 1, 100, 0, 10), 
(@OGUID+87, 1620, 1, 6741.07, 452.357, 19.4953, 4.36332, 0, 0, -0.819152, 0.573577, 300, 300, 1, 100, 0, 10), 
(@OGUID+88, 1620, 1, 6151.48, 481.864, 17.708, 3.73501, 0, 0, -0.956305, 0.292372, 300, 300, 1, 100, 0, 10), 
(@OGUID+89, 1620, 1, 7588.91, -803.94, 15.4576, 2.96704, 0, 0, 0.996194, 0.087165, 300, 300, 1, 100, 0, 10), 
(@OGUID+90, 1620, 1, 7518.13, -999.679, -9.88135, 1.36136, 0, 0, 0.62932, 0.777146, 300, 300, 1, 100, 0, 10), 
(@OGUID+91, 1620, 1, 6565.85, 276.078, 34.6048, 1.97222, 0, 0, 0.833885, 0.551938, 300, 300, 1, 100, 0, 10), 
(@OGUID+92, 1620, 1, 6098.4, 377.551, 25.8775, 5.63741, 0, 0, -0.317305, 0.948324, 300, 300, 1, 100, 0, 10), 
(@OGUID+93, 1620, 1, 7421.58, -556.772, 3.19416, 2.19911, 0, 0, 0.891006, 0.453991, 300, 300, 1, 100, 0, 10), 
(@OGUID+94, 1620, 1, 7098.78, -631.622, 47.2586, 0.157079, 0, 0, 0.0784588, 0.996917, 300, 300, 1, 100, 0, 10), 
(@OGUID+95, 1620, 1, 4457.79, 684.135, 21.6212, 4.50295, 0, 0, -0.777145, 0.629321, 300, 300, 1, 100, 0, 10),
(@OGUID+96, 1620, 1, 4840.55, 564.985, 16.172, 5.61996, 0, 0, -0.325567, 0.945519, 300, 300, 1, 100, 0, 10),
(@OGUID+97, 1620, 1, 5250.59, 495.726, 16.0721, 4.18879, 0, 0, -0.866025, 0.500001, 300, 300, 1, 100, 0, 10),
(@OGUID+98, 1620, 1, 6126.49, 190.753, 24.4633, 4.83456, 0, 0, -0.66262, 0.748956, 300, 300, 1, 100, 0, 10),
(@OGUID+99, 1620, 1, 7180.5, -854.9, 48.1778, 5.61996, 0, 0, -0.325567, 0.945519, 300, 300, 1, 100, 0, 10),
(@OGUID+100, 1620, 1, 7316.48, -538.257, 2.8054, 3.97935, 0, 0, -0.913545, 0.406738, 300, 300, 1, 100, 0, 10);

-- Missing Mageroyal spawns in Hillsbrad Foothills.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+101, 1620, 0, -699.789, 266.887, 48.9128, 1.88495, 0, 0, 0.809016, 0.587786, 300, 300, 1, 100, 0, 10), 
(@OGUID+102, 1620, 0, -800.171, -334.05, 18.1611, 0.925024, 0, 0, 0.446198, 0.894935, 300, 300, 1, 100, 0, 10),
(@OGUID+103, 1620, 0, -748.175, -32.9106, 28.1021, 6.16101, 0, 0, -0.0610485, 0.998135, 300, 300, 1, 100, 0, 10);

-- Missing Mageroyal spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+104, 1620, 1, 2617.3, -36.7333, 90.8484, 0.698131, 0, 0, 0.34202, 0.939693, 300, 300, 1, 100, 0, 10), 
(@OGUID+105, 1620, 1, 2525.04, -3616.79, 58.6529, 0.925024, 0, 0, 0.446198, 0.894935, 300, 300, 1, 100, 0, 10), 
(@OGUID+106, 1620, 1, 1876.14, -1721.68, 55.5824, 3.08918, 0, 0, 0.999657, 0.0262016, 300, 300, 1, 100, 0, 10), 
(@OGUID+107, 1620, 1, 3468.23, 698.412, 5.72655, 6.07375, 0, 0, -0.104528, 0.994522, 300, 300, 1, 100, 0, 10), 
(@OGUID+108, 1620, 1, 1398.94, -2367.47, 106.623, 3.68265, 0, 0, -0.96363, 0.267241, 300, 300, 1, 100, 0, 10),
(@OGUID+109, 1620, 1, 1697.37, -2600.6, 103.252, 0.977383, 0, 0, 0.469471, 0.882948, 300, 300, 1, 100, 0, 10),
(@OGUID+110, 1620, 1, 1932.98, -2733.33, 110.253, 0.890117, 0, 0, 0.430511, 0.902586, 300, 300, 1, 100, 0, 10),
(@OGUID+111, 1620, 1, 2960.09, 537.748, 5.89731, 0.90757, 0, 0, 0.438371, 0.898794, 300, 300, 1, 100, 0, 10),
(@OGUID+112, 1620, 1, 3211.14, 718.514, 5.62216, 2.35619, 0, 0, 0.92388, 0.382683, 300, 300, 1, 100, 0, 10),
(@OGUID+113, 1620, 1, 3407.52, 388.852, 1.78606, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 1, 100, 0, 10);

-- Missing Mageroyal spawns in Stonetalon Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+114, 1620, 1, 1174.13, -170.249, -1.27209, 4.17134, 0, 0, -0.870356, 0.492424, 300, 300, 1, 100, 0, 10), 
(@OGUID+115, 1620, 1, 2308.11, 1501.96, 281.706, 2.46091, 0, 0, 0.942641, 0.333808, 300, 300, 1, 100, 0, 10), 
(@OGUID+116, 1620, 1, 1101.18, 115.231, 0.153776, 1.13446, 0, 0, 0.537299, 0.843392, 300, 300, 1, 100, 0, 10), 
(@OGUID+117, 1620, 1, -42.3266, -421.136, -29.0841, 3.194, 0, 0, -0.999657, 0.0262016, 300, 300, 1, 100, 0, 10), 
(@OGUID+118, 1620, 1, 2576.27, 1677.75, 294.842, 0.157079, 0, 0, 0.0784588, 0.996917, 300, 300, 1, 100, 0, 10), 
(@OGUID+119, 1620, 1, 40.5508, -735.211, -18.9994, 2.19911, 0, 0, 0.891006, 0.453991, 300, 300, 1, 100, 0, 10), 
(@OGUID+120, 1620, 1, 1269.18, -11.3787, -5.88981, 5.96903, 0, 0, -0.156434, 0.987688, 300, 300, 1, 100, 0, 10), 
(@OGUID+121, 1620, 1, 2448.9, 1512.97, 262.881, 3.87463, 0, 0, -0.93358, 0.358368, 300, 300, 1, 100, 0, 10), 
(@OGUID+122, 1620, 1, 1511.73, 653.908, 139.48, 1.79769, 0, 0, 0.782608, 0.622515, 300, 300, 1, 100, 0, 10), 
(@OGUID+123, 1620, 1, -82.9219, -500.105, -46.1249, 5.72468, 0, 0, -0.275637, 0.961262, 300, 300, 1, 100, 0, 10), 
(@OGUID+124, 1620, 1, 45.3518, -661.375, -19.6092, 2.54818, 0, 0, 0.956305, 0.292372, 300, 300, 1, 100, 0, 10), 
(@OGUID+125, 1620, 1, 548.473, 1451.95, -0.056133, 0.104719, 0, 0, 0.0523357, 0.99863, 300, 300, 1, 100, 0, 10),
(@OGUID+126, 1620, 1, 890.31, 247.498, 22.9681, 1.3439, 0, 0, 0.622514, 0.782609, 300, 300, 1, 100, 0, 10),
(@OGUID+127, 1620, 1, 2229.94, 1018.03, 273.6, 4.86947, 0, 0, -0.649447, 0.760406, 300, 300, 1, 100, 0, 10),
(@OGUID+128, 1620, 1, 2680.52, 1311.49, 270.504, 1.29154, 0, 0, 0.601814, 0.798636, 300, 300, 1, 100, 0, 10);

-- Missing Mageroyal spawns in The Barrens.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+129, 3727, 1, -3462.09, -2399.67, 92.3755, 0.0698117, 0, 0, 0.0348988, 0.999391, 1800, 1800, 1, 100, 0, 10),
(@OGUID+130, 3727, 1, 1233.28, -3801.56, 33.4924, 4.20625, 0, 0, -0.861629, 0.507539, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+131, 3727, 1, 531.374, -3202.91, 93.1286, 0.0174525, 0, 0, 0.00872612, 0.999962, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+132, 3727, 1, -715.848, -3142.72, 94.6115, 4.13643, 0, 0, -0.878817, 0.47716, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+133, 3727, 1, -2772.87, -2109.86, 96.147, 4.90438, 0, 0, -0.636078, 0.771625, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+134, 3727, 1, -2683.96, -1840.49, 92.0594, 1.62316, 0, 0, 0.725374, 0.688355, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+135, 3727, 1, -1750.27, -2045.18, 93.5092, 4.50295, 0, 0, -0.777145, 0.629321, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+136, 3727, 1, -1152.78, -2354.12, 92.4685, 0.488691, 0, 0, 0.241921, 0.970296, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+137, 3727, 1, -154.469, -1946.83, 95.2778, 4.53786, 0, 0, -0.766044, 0.642789, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+138, 3727, 1, 449.584, -3116.32, 94.0315, 1.09956, 0, 0, 0.522498, 0.85264, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+139, 3727, 1, -1324.09, -2586.36, 93.059, 5.5676, 0, 0, -0.350207, 0.936672, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+140, 3727, 1, 885.531, -2912.21, 93.5429, 0.157079, 0, 0, 0.0784588, 0.996917, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+141, 3727, 1, -52.3808, -1508.4, 94.5811, 5.35816, 0, 0, -0.446198, 0.894935, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+142, 3727, 1, -1955.81, -1916.63, 93.8579, 2.60054, 0, 0, 0.96363, 0.267241, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+143, 3727, 1, 1156.44, -3751.48, 35.4822, 3.76991, 0, 0, -0.951056, 0.309017, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+144, 3727, 1, 25.342, -2375.39, 92.1641, 5.79449, 0, 0, -0.241921, 0.970296, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+145, 3727, 1, 865.839, -3489.71, 92.6699, 2.82743, 0, 0, 0.987688, 0.156436, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+146, 3727, 1, -2721.75, -1951.37, 95.6936, 2.09439, 0, 0, 0.866025, 0.500001, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+147, 3727, 1, -721.839, -1879.39, 92.7246, 5.13127, 0, 0, -0.544639, 0.838671, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+148, 3727, 1, -2133.94, -1724.68, 91.6667, 6.05629, 0, 0, -0.113203, 0.993572, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+149, 3727, 1, -2518.09, -1851.83, 92.2329, 5.68977, 0, 0, -0.292372, 0.956305, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+150, 3727, 1, -1486.6, -2077.56, 82.5848, 1.39626, 0, 0, 0.642787, 0.766045, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+151, 3727, 1, -115.318, -2247.6, 91.6667, 4.27606, 0, 0, -0.843391, 0.5373, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+152, 3727, 1, 84.225, -1584.69, 94.6333, 0.942477, 0, 0, 0.45399, 0.891007, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+153, 3727, 1, -315.952, -1719.38, 92.395, 0.59341, 0, 0, 0.292371, 0.956305, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+154, 3727, 1, 422.249, -3630.41, 28.3725, 2.89725, 0, 0, 0.992546, 0.12187, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+155, 3727, 1, 586.758, -1882.36, 91.6667, 4.34587, 0, 0, -0.824126, 0.566406, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+156, 3727, 1, -387.624, -1458.01, 95.168, 5.32326, 0, 0, -0.461748, 0.887011, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+157, 3727, 1, -1854.13, -2813.15, 93.3581, 4.7473, 0, 0, -0.694658, 0.71934, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+158, 3727, 1, -2714.96, -2308.53, 91.681, 1.32645, 0, 0, 0.615661, 0.788011, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+159, 3727, 1, -4112.9, -1905.92, 93.1088, 5.84685, 0, 0, -0.216439, 0.976296, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+160, 3727, 1, -115.113, -1718.67, 94.2968, 4.20625, 0, 0, -0.861629, 0.507539, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+161, 3727, 1, -2894.87, -2221.63, 92.9427, 0.087266, 0, 0, 0.0436192, 0.999048, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+162, 3727, 1, -3207.48, -2241.12, 91.8736, 0.401425, 0, 0, 0.199368, 0.979925, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+163, 3727, 1, -820.308, -1749.19, 93.5486, 3.71755, 0, 0, -0.958819, 0.284016, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+164, 3727, 1, -2275.54, -1748.21, 91.6667, 1.76278, 0, 0, 0.771625, 0.636078, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+165, 3727, 1, -2214.45, -2616.82, 93.1482, 2.87979, 0, 0, 0.991445, 0.130528, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+166, 3727, 1, -2213.99, -2046.5, 93.1859, 0.0523589, 0, 0, 0.0261765, 0.999657, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+167, 3727, 1, -2184.46, -1851.25, 93.3504, 0.750491, 0, 0, 0.366501, 0.930418, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+168, 3727, 1, -1989.86, -3441.82, 54.0066, 3.89209, 0, 0, -0.930417, 0.366502, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+169, 3727, 1, -2282.97, -2287.78, 91.8577, 2.67035, 0, 0, 0.972369, 0.233448, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+170, 3727, 1, -2078.78, -1825.08, 91.6727, 1.83259, 0, 0, 0.793353, 0.608762, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+171, 3727, 1, -1656.15, -1915.26, 93.5014, 3.21142, 0, 0, -0.999391, 0.0349061, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+172, 3727, 1, 551.666, -3675.08, 27.2787, 5.51524, 0, 0, -0.374606, 0.927184, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+173, 3727, 1, -2702.22, -2023.16, 97.1988, 1.93731, 0, 0, 0.824125, 0.566408, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+174, 3727, 1, -1851.45, -2949.39, 91.6667, 2.70526, 0, 0, 0.976295, 0.216442, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+175, 3727, 1, -2416.2, -2524.77, 91.6667, 0.0349062, 0, 0, 0.0174522, 0.999848, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+176, 3727, 1, -1445.05, -2186.18, 91.6629, 3.7001, 0, 0, -0.961261, 0.27564, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+177, 3727, 1, 737.1, -3683.63, 29.4815, 1.44862, 0, 0, 0.66262, 0.748956, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+178, 3727, 1, 727.135, -3027.79, 91.6667, 5.46288, 0, 0, -0.398748, 0.91706, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+179, 3727, 1, 580.55, -2781.6, 91.7421, 1.79769, 0, 0, 0.782608, 0.622515, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+180, 3727, 1, 463.624, -1807.32, 91.7776, 5.35816, 0, 0, -0.446198, 0.894935, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+181, 3727, 1, 155.817, -1793.3, 93.9141, 4.24115, 0, 0, -0.85264, 0.522499, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+182, 3727, 1, -3283.59, -2118.74, 91.8353, 1.58825, 0, 0, 0.71325, 0.70091, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+183, 3727, 1, -3651.67, -2086.83, 92.3989, 1.48353, 0, 0, 0.67559, 0.737278, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+184, 3727, 1, -3816.58, -2440.67, 91.6667, 0.104719, 0, 0, 0.0523357, 0.99863, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+185, 3727, 1, -3132.56, -1902.42, 96.7309, 5.41052, 0, 0, -0.422618, 0.906308, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+186, 3727, 1, -2512.43, -2472.45, 92.3745, 5.53269, 0, 0, -0.366501, 0.930418, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+187, 3727, 1, 250.178, -1749.49, 91.6666, 3.28124, 0, 0, -0.997563, 0.0697661, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+188, 3727, 1, -2042.05, -2132.15, 92.7959, 1.29154, 0, 0, 0.601814, 0.798636, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+189, 3727, 1, -1355.5, -2205.64, 91.8376, 6.12611, 0, 0, -0.0784588, 0.996917, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+190, 3727, 1, -2047.76, -2618.79, 91.6667, 0, 0, 0, 0, 1, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+191, 3727, 1, -619.794, -1817.9, 92.2827, 3.05433, 0, 0, 0.999048, 0.0436193, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+192, 3727, 1, 497.297, -2394.02, 93.5046, 4.25861, 0, 0, -0.848047, 0.529921, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+193, 3727, 1, -1518.44, -2788.13, 93.8622, 3.83973, 0, 0, -0.939692, 0.34202, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+194, 3727, 1, -2053.85, -2349.05, 91.8999, 5.37562, 0, 0, -0.438371, 0.898794, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+195, 3727, 1, -2048.94, -2715.53, 91.9006, 0.750491, 0, 0, 0.366501, 0.930418, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+196, 3727, 1, -3043.68, -2155.73, 91.6667, 3.78737, 0, 0, -0.948323, 0.317306, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+197, 3727, 1, -2929.99, -1959.83, 91.6667, 3.35105, 0, 0, -0.994521, 0.104536, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+198, 3727, 1, 478.551, -2940.74, 91.7832, 4.7473, 0, 0, -0.694658, 0.71934, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+199, 3727, 1, 616.284, -2947.64, 92.1194, 1.71042, 0, 0, 0.754709, 0.656059, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+200, 3727, 1, -853.452, -2310.96, 92.8695, 1.97222, 0, 0, 0.833885, 0.551938, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+201, 3727, 1, -2050.38, -2050.88, 92.7058, 4.95674, 0, 0, -0.615661, 0.788011, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+202, 3727, 1, -2989.87, -2111.22, 93.1494, 0.95993, 0, 0, 0.461748, 0.887011, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+203, 3727, 1, -2805.85, -1925.75, 91.6667, 4.72984, 0, 0, -0.700909, 0.713251, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+204, 3727, 1, -2585.05, -2050.21, 91.6667, 4.7822, 0, 0, -0.681998, 0.731354, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+205, 3727, 1, -1293.55, -2148.94, 91.8489, 5.70723, 0, 0, -0.284015, 0.95882, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+206, 3727, 1, -1724.29, -2693.6, 82.5758, 5.20108, 0, 0, -0.515038, 0.857168, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+207, 3727, 1, -3739.84, -2315.65, 93.6975, 2.26893, 0, 0, 0.906307, 0.422619, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+208, 3727, 1, -827.816, -2138.57, 91.7369, 1.71042, 0, 0, 0.754709, 0.656059, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+209, 3727, 1, -1190.45, -1807.65, 86.4704, 5.72468, 0, 0, -0.275637, 0.961262, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+210, 3727, 1, -1786.14, -1785.21, 96.9878, 4.93928, 0, 0, -0.622514, 0.782609, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+211, 3727, 1, -3279.59, -1705.84, 91.6667, 4.97419, 0, 0, -0.608761, 0.793354, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+212, 3727, 1, -3650.79, -1646.35, 91.6667, 4.38078, 0, 0, -0.814116, 0.580703, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+213, 3727, 1, -3949.09, -1745.83, 93.5654, 2.63544, 0, 0, 0.968147, 0.250381, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+214, 3727, 1, -1799, -3075.59, 83.0565, 4.18879, 0, 0, -0.866025, 0.500001, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+215, 3727, 1, 74.3646, -3443.92, 28.166, 5.77704, 0, 0, -0.25038, 0.968148, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+216, 3727, 1, 921.922, -3667.02, 31.433, 6.0912, 0, 0, -0.0958452, 0.995396, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+217, 3727, 1, -1290.88, -1919.27, 81.3488, 0.471238, 0, 0, 0.233445, 0.97237, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+218, 3727, 1, -2755.1, -2214.42, 95.583, 1.25664, 0, 0, 0.587785, 0.809017, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+219, 3727, 1, -1543.9, -2609.17, 92.33, 0.261798, 0, 0, 0.130526, 0.991445, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+220, 3727, 1, -1755.6, -2587.81, 91.6667, 1.48353, 0, 0, 0.67559, 0.737278, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+221, 3727, 1, -2483.53, -2248.7, 95.6184, 2.67035, 0, 0, 0.972369, 0.233448, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+222, 3727, 1, 943.49, -3185.56, 91.8506, 4.76475, 0, 0, -0.688354, 0.725374, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+223, 3727, 1, 651.194, -2083.68, 91.9575, 3.47321, 0, 0, -0.986285, 0.16505, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+224, 3727, 1, -2451.96, -1710.87, 94.5315, 4.04917, 0, 0, -0.898793, 0.438373, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+225, 3727, 1, -3550.2, -1830.2, 91.6667, 4.08407, 0, 0, -0.891006, 0.453991, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+226, 3727, 1, -3813, -2215.8, 93.1443, 0.715585, 0, 0, 0.350207, 0.936672, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+227, 3727, 1, -2641.9, -2292.76, 93.3241, 5.58505, 0, 0, -0.34202, 0.939693, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+228, 3727, 1, -2266.8, -2566.73, 91.6666, 3.00195, 0, 0, 0.997563, 0.0697661, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+229, 3727, 1, -3815.81, -1850.86, 93.7421, 5.23599, 0, 0, -0.5, 0.866025, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+230, 3727, 1, -3380.97, -2215, 94.8222, 6.03884, 0, 0, -0.121869, 0.992546, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+231, 3727, 1, -1409.86, -1853.46, 91.7215, 1.18682, 0, 0, 0.559193, 0.829038, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+232, 3727, 1, -1357.99, -2854.88, 94.3614, 6.19592, 0, 0, -0.0436192, 0.999048, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+233, 3727, 1, 1221.21, -3048.45, 93.2425, 3.56047, 0, 0, -0.978148, 0.207912, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+234, 3727, 1, -846.395, -2877.4, 91.7914, 4.24115, 0, 0, -0.85264, 0.522499, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+235, 3727, 1, -1820.1, -1859.38, 97.1059, 1.02974, 0, 0, 0.492423, 0.870356, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+236, 3727, 1, -1048.15, -2883.74, 91.6667, 6.02139, 0, 0, -0.130526, 0.991445, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+237, 3727, 1, -3914.26, -2181.78, 91.6667, 6.12611, 0, 0, -0.0784588, 0.996917, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+238, 3727, 1, -1712.07, -2379.35, 91.7887, 2.44346, 0, 0, 0.939692, 0.34202, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+239, 3727, 1, -591.644, -1680.88, 91.6674, 5.63741, 0, 0, -0.317305, 0.948324, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+240, 3727, 1, 538.218, -1532.07, 94.4988, 2.93214, 0, 0, 0.994521, 0.104536, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+241, 3727, 1, 785.477, -2085.2, 91.784, 4.81711, 0, 0, -0.66913, 0.743145, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+242, 3727, 1, -1678.25, -2937.08, 91.6651, 1.64061, 0, 0, 0.731353, 0.681999, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+243, 1620, 1, -593.054, -2159.79, 52.5733, 1.309, 0, 0, 0.608761, 0.793354, 300, 300, 1, 100, 0, 10), 
(@OGUID+244, 1620, 1, -628.346, -2029.38, 64.2924, 0.59341, 0, 0, 0.292371, 0.956305, 300, 300, 1, 100, 0, 10), 
(@OGUID+245, 3727, 1, -4070.01, -1816.23, 92.4737, 3.99681, 0, 0, -0.909961, 0.414694, 300, 300, 1, 100, 0, 10),
(@OGUID+246, 3727, 1, -3441.88, -1846.97, 91.6712, 4.81711, 0, 0, -0.66913, 0.743145, 300, 300, 1, 100, 0, 10),
(@OGUID+247, 3727, 1, -3407.94, -2259.88, 91.6667, 3.00195, 0, 0, 0.997563, 0.0697661, 300, 300, 1, 100, 0, 10),
(@OGUID+248, 3727, 1, -3206.77, -1923.75, 92.4619, 0.174532, 0, 0, 0.0871553, 0.996195, 300, 300, 1, 100, 0, 10),
(@OGUID+249, 3727, 1, -2014.99, -2486.35, 94.0685, 1.88495, 0, 0, 0.809016, 0.587786, 300, 300, 1, 100, 0, 10),
(@OGUID+250, 3727, 1, -1856.58, -2593.17, 91.6667, 4.53786, 0, 0, -0.766044, 0.642789, 300, 300, 1, 100, 0, 10),
(@OGUID+251, 3727, 1, -1849.05, -2217.31, 95.2032, 4.93928, 0, 0, -0.622514, 0.782609, 300, 300, 1, 100, 0, 10),
(@OGUID+252, 3727, 1, -1835.03, -1687.6, 91.6667, 2.72271, 0, 0, 0.978148, 0.207912, 300, 300, 1, 100, 0, 10),
(@OGUID+253, 3727, 1, -1719.9, -2878.27, 82.6073, 5.42797, 0, 0, -0.414693, 0.909961, 300, 300, 1, 100, 0, 10),
(@OGUID+254, 3727, 1, -1640.43, -2358.56, 82.8611, 2.49582, 0, 0, 0.948323, 0.317306, 300, 300, 1, 100, 0, 10),
(@OGUID+255, 3727, 1, -1516.13, -2478.43, 93.55, 1.74533, 0, 0, 0.766044, 0.642789, 300, 300, 1, 100, 0, 10),
(@OGUID+256, 3727, 1, -1498.94, -1566.58, 91.662, 1.6057, 0, 0, 0.719339, 0.694659, 300, 300, 1, 100, 0, 10),
(@OGUID+257, 3727, 1, -1453.54, -2950.38, 91.6667, 2.54818, 0, 0, 0.956305, 0.292372, 300, 300, 1, 100, 0, 10),
(@OGUID+258, 3727, 1, -1121.48, -1885.28, 92.6562, 5.88176, 0, 0, -0.199368, 0.979925, 300, 300, 1, 100, 0, 10),
(@OGUID+259, 3727, 1, -875.545, -1918.65, 92.023, 2.56563, 0, 0, 0.958819, 0.284016, 300, 300, 1, 100, 0, 10),
(@OGUID+260, 3727, 1, 250.099, -1549.66, 91.6679, 0.104719, 0, 0, 0.0523357, 0.99863, 300, 300, 1, 100, 0, 10),
(@OGUID+261, 3727, 1, 317.927, -1883.46, 91.6667, 3.24635, 0, 0, -0.998629, 0.0523532, 300, 300, 1, 100, 0, 10),
(@OGUID+262, 3727, 1, 540.767, -1327.15, 91.7845, 3.7001, 0, 0, -0.961261, 0.27564, 300, 300, 1, 100, 0, 10),
(@OGUID+263, 3727, 1, 578.294, -1676.02, 93.485, 1.78023, 0, 0, 0.777145, 0.629321, 300, 300, 1, 100, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1116, 0, 'Mageroyal', 0, 10), -- Mageroyals in Duskwood 17 objects total
(@OGUID+2, 1116, 0, 'Mageroyal', 0, 10), -- Mageroyals in Duskwood 17 objects total
(@OGUID+3, 1116, 0, 'Mageroyal', 0, 10), -- Mageroyals in Duskwood 17 objects total
(@OGUID+4, 1116, 0, 'Mageroyal', 0, 10), -- Mageroyals in Duskwood 17 objects total
(@OGUID+5, 1116, 0, 'Mageroyal', 0, 10), -- Mageroyals in Duskwood 17 objects total
(@OGUID+6, 1116, 0, 'Mageroyal', 0, 10), -- Mageroyals in Duskwood 17 objects total
(@OGUID+7, 1116, 0, 'Mageroyal', 0, 10), -- Mageroyals in Duskwood 17 objects total
(@OGUID+8, 1116, 0, 'Mageroyal', 0, 10), -- Mageroyals in Duskwood 17 objects total
(@OGUID+9, 1116, 0, 'Mageroyal', 0, 10), -- Mageroyals in Duskwood 17 objects total
(@OGUID+10, 1116, 0, 'Mageroyal', 0, 10), -- Mageroyals in Duskwood 17 objects total
(@OGUID+11, 1116, 0, 'Mageroyal', 0, 10), -- Mageroyals in Duskwood 17 objects total
(@OGUID+12, 1116, 0, 'Mageroyal', 0, 10), -- Mageroyals in Duskwood 17 objects total
(@OGUID+13, 1154, 0, 'Mageroyal', 0, 10), -- Mageroyals in Wetlands 16 objects total
(@OGUID+14, 1154, 0, 'Mageroyal', 0, 10), -- Mageroyals in Wetlands 16 objects total
(@OGUID+15, 1154, 0, 'Mageroyal', 0, 10), -- Mageroyals in Wetlands 16 objects total
(@OGUID+16, 1154, 0, 'Mageroyal', 0, 10), -- Mageroyals in Wetlands 16 objects total
(@OGUID+17, 1154, 0, 'Mageroyal', 0, 10), -- Mageroyals in Wetlands 16 objects total
(@OGUID+18, 1154, 0, 'Mageroyal', 0, 10), -- Mageroyals in Wetlands 16 objects total
(@OGUID+19, 1154, 0, 'Mageroyal', 0, 10), -- Mageroyals in Wetlands 16 objects total
(@OGUID+20, 1154, 0, 'Mageroyal', 0, 10), -- Mageroyals in Wetlands 16 objects total
(@OGUID+21, 1154, 0, 'Mageroyal', 0, 10), -- Mageroyals in Wetlands 16 objects total
(@OGUID+22, 1154, 0, 'Mageroyal', 0, 10), -- Mageroyals in Wetlands 16 objects total
(@OGUID+23, 1023, 0, 'Mageroyal', 0, 10), -- Mageroyals in Durotar 14 objects total
(@OGUID+24, 1023, 0, 'Mageroyal', 0, 10), -- Mageroyals in Durotar 14 objects total
(@OGUID+25, 1023, 0, 'Mageroyal', 0, 10), -- Mageroyals in Durotar 14 objects total
(@OGUID+26, 1023, 0, 'Mageroyal', 0, 10), -- Mageroyals in Durotar 14 objects total
(@OGUID+27, 1023, 0, 'Mageroyal', 0, 10), -- Mageroyals in Durotar 14 objects total
(@OGUID+28, 1163, 0, 'Mageroyal', 0, 10), -- Mageroyals in Loch Modan 20 objects total
(@OGUID+29, 1163, 0, 'Mageroyal', 0, 10), -- Mageroyals in Loch Modan 20 objects total
(@OGUID+30, 1163, 0, 'Mageroyal', 0, 10), -- Mageroyals in Loch Modan 20 objects total
(@OGUID+31, 1163, 0, 'Mageroyal', 0, 10), -- Mageroyals in Loch Modan 20 objects total
(@OGUID+32, 1163, 0, 'Mageroyal', 0, 10), -- Mageroyals in Loch Modan 20 objects total
(@OGUID+33, 1163, 0, 'Mageroyal', 0, 10), -- Mageroyals in Loch Modan 20 objects total
(@OGUID+34, 1163, 0, 'Mageroyal', 0, 10), -- Mageroyals in Loch Modan 20 objects total
(@OGUID+35, 1163, 0, 'Mageroyal', 0, 10), -- Mageroyals in Loch Modan 20 objects total
(@OGUID+36, 1163, 0, 'Mageroyal', 0, 10), -- Mageroyals in Loch Modan 20 objects total
(@OGUID+37, 1163, 0, 'Mageroyal', 0, 10), -- Mageroyals in Loch Modan 20 objects total
(@OGUID+38, 1163, 0, 'Mageroyal', 0, 10), -- Mageroyals in Loch Modan 20 objects total
(@OGUID+39, 1163, 0, 'Mageroyal', 0, 10), -- Mageroyals in Loch Modan 20 objects total
(@OGUID+40, 1163, 0, 'Mageroyal', 0, 10), -- Mageroyals in Loch Modan 20 objects total
(@OGUID+41, 1163, 0, 'Mageroyal', 0, 10), -- Mageroyals in Loch Modan 20 objects total
(@OGUID+42, 1163, 0, 'Mageroyal', 0, 10), -- Mageroyals in Loch Modan 20 objects total
(@OGUID+43, 1163, 0, 'Mageroyal', 0, 10), -- Mageroyals in Loch Modan 20 objects total
(@OGUID+44, 1108, 0, 'Mageroyal', 0, 10), -- Mageroyals in Westfall 45 objects total
(@OGUID+45, 1108, 0, 'Mageroyal', 0, 10), -- Mageroyals in Westfall 45 objects total
(@OGUID+46, 1108, 0, 'Mageroyal', 0, 10), -- Mageroyals in Westfall 45 objects total
(@OGUID+47, 1108, 0, 'Mageroyal', 0, 10), -- Mageroyals in Westfall 45 objects total
(@OGUID+48, 1108, 0, 'Mageroyal', 0, 10), -- Mageroyals in Westfall 45 objects total
(@OGUID+49, 1108, 0, 'Mageroyal', 0, 10), -- Mageroyals in Westfall 45 objects total
(@OGUID+50, 1108, 0, 'Mageroyal', 0, 10), -- Mageroyals in Westfall 45 objects total
(@OGUID+51, 1108, 0, 'Mageroyal', 0, 10), -- Mageroyals in Westfall 45 objects total
(@OGUID+52, 1108, 0, 'Mageroyal', 0, 10), -- Mageroyals in Westfall 45 objects total
(@OGUID+53, 1108, 0, 'Mageroyal', 0, 10), -- Mageroyals in Westfall 45 objects total
(@OGUID+54, 1108, 0, 'Mageroyal', 0, 10), -- Mageroyals in Westfall 45 objects total
(@OGUID+55, 1108, 0, 'Mageroyal', 0, 10), -- Mageroyals in Westfall 45 objects total
(@OGUID+56, 1108, 0, 'Mageroyal', 0, 10), -- Mageroyals in Westfall 45 objects total
(@OGUID+57, 1108, 0, 'Mageroyal', 0, 10), -- Mageroyals in Westfall 45 objects total
(@OGUID+58, 1306, 0, 'Mageroyal', 0, 10), -- Mageroyals in Redridge 24 objects total
(@OGUID+59, 1306, 0, 'Mageroyal', 0, 10), -- Mageroyals in Redridge 24 objects total
(@OGUID+60, 1306, 0, 'Mageroyal', 0, 10), -- Mageroyals in Redridge 24 objects total
(@OGUID+61, 1306, 0, 'Mageroyal', 0, 10), -- Mageroyals in Redridge 24 objects total
(@OGUID+62, 1306, 0, 'Mageroyal', 0, 10), -- Mageroyals in Redridge 24 objects total
(@OGUID+63, 1306, 0, 'Mageroyal', 0, 10), -- Mageroyals in Redridge 24 objects total
(@OGUID+64, 1306, 0, 'Mageroyal', 0, 10), -- Mageroyals in Redridge 24 objects total
(@OGUID+65, 1306, 0, 'Mageroyal', 0, 10), -- Mageroyals in Redridge 24 objects total
(@OGUID+66, 1306, 0, 'Mageroyal', 0, 10), -- Mageroyals in Redridge 24 objects total
(@OGUID+67, 1043, 0, 'Mageroyal', 0, 10), -- Mageroyals in Silverpine Forest 32 objects total
(@OGUID+68, 1043, 0, 'Mageroyal', 0, 10), -- Mageroyals in Silverpine Forest 32 objects total
(@OGUID+69, 1043, 0, 'Mageroyal', 0, 10), -- Mageroyals in Silverpine Forest 32 objects total
(@OGUID+70, 1043, 0, 'Mageroyal', 0, 10), -- Mageroyals in Silverpine Forest 32 objects total
(@OGUID+71, 1043, 0, 'Mageroyal', 0, 10), -- Mageroyals in Silverpine Forest 32 objects total
(@OGUID+72, 1043, 0, 'Mageroyal', 0, 10), -- Mageroyals in Silverpine Forest 32 objects total
(@OGUID+73, 1043, 0, 'Mageroyal', 0, 10), -- Mageroyals in Silverpine Forest 32 objects total
(@OGUID+74, 1043, 0, 'Mageroyal', 0, 10), -- Mageroyals in Silverpine Forest 32 objects total
(@OGUID+75, 1043, 0, 'Mageroyal', 0, 10), -- Mageroyals in Silverpine Forest 32 objects total
(@OGUID+76, 1043, 0, 'Mageroyal', 0, 10), -- Mageroyals in Silverpine Forest 32 objects total
(@OGUID+77, 1043, 0, 'Mageroyal', 0, 10), -- Mageroyals in Silverpine Forest 32 objects total
(@OGUID+78, 1043, 0, 'Mageroyal', 0, 10), -- Mageroyals in Silverpine Forest 32 objects total
(@OGUID+79, 1043, 0, 'Mageroyal', 0, 10), -- Mageroyals in Silverpine Forest 32 objects total
(@OGUID+80, 1004, 0, 'Mageroyal', 0, 10), -- Mageroyals in Teldrassil 12 objects total
(@OGUID+81, 1004, 0, 'Mageroyal', 0, 10), -- Mageroyals in Teldrassil 12 objects total
(@OGUID+82, 1004, 0, 'Mageroyal', 0, 10), -- Mageroyals in Teldrassil 12 objects total
(@OGUID+83, 1004, 0, 'Mageroyal', 0, 10), -- Mageroyals in Teldrassil 12 objects total
(@OGUID+84, 1004, 0, 'Mageroyal', 0, 10), -- Mageroyals in Teldrassil 12 objects total
(@OGUID+85, 1004, 0, 'Mageroyal', 0, 10), -- Mageroyals in Teldrassil 12 objects total
(@OGUID+86, 1097, 0, 'Mageroyal', 0, 10), -- Mageroyals in Darkshore 61 objects total
(@OGUID+87, 1097, 0, 'Mageroyal', 0, 10), -- Mageroyals in Darkshore 61 objects total
(@OGUID+88, 1097, 0, 'Mageroyal', 0, 10), -- Mageroyals in Darkshore 61 objects total
(@OGUID+89, 1097, 0, 'Mageroyal', 0, 10), -- Mageroyals in Darkshore 61 objects total
(@OGUID+90, 1097, 0, 'Mageroyal', 0, 10), -- Mageroyals in Darkshore 61 objects total
(@OGUID+91, 1097, 0, 'Mageroyal', 0, 10), -- Mageroyals in Darkshore 61 objects total
(@OGUID+92, 1097, 0, 'Mageroyal', 0, 10), -- Mageroyals in Darkshore 61 objects total
(@OGUID+93, 1097, 0, 'Mageroyal', 0, 10), -- Mageroyals in Darkshore 61 objects total
(@OGUID+94, 1097, 0, 'Mageroyal', 0, 10), -- Mageroyals in Darkshore 61 objects total
(@OGUID+95, 1097, 0, 'Mageroyal', 0, 10), -- Mageroyals in Darkshore 61 objects total
(@OGUID+96, 1097, 0, 'Mageroyal', 0, 10), -- Mageroyals in Darkshore 61 objects total
(@OGUID+97, 1097, 0, 'Mageroyal', 0, 10), -- Mageroyals in Darkshore 61 objects total
(@OGUID+98, 1097, 0, 'Mageroyal', 0, 10), -- Mageroyals in Darkshore 61 objects total
(@OGUID+99, 1097, 0, 'Mageroyal', 0, 10), -- Mageroyals in Darkshore 61 objects total
(@OGUID+100, 1097, 0, 'Mageroyal', 0, 10), -- Mageroyals in Darkshore 61 objects total
(@OGUID+101, 1049, 0, 'Mageroyal', 0, 10), -- Mageroyals in Hillsbrad 12 objects total
(@OGUID+102, 1049, 0, 'Mageroyal', 0, 10), -- Mageroyals in Hillsbrad 12 objects total
(@OGUID+103, 1049, 0, 'Mageroyal', 0, 10), -- Mageroyals in Hillsbrad 12 objects total
(@OGUID+104, 1077, 0, 'Mageroyal', 0, 10), -- Mageroyals in Ashenvale 63 objects total
(@OGUID+105, 1077, 0, 'Mageroyal', 0, 10), -- Mageroyals in Ashenvale 63 objects total
(@OGUID+106, 1077, 0, 'Mageroyal', 0, 10), -- Mageroyals in Ashenvale 63 objects total
(@OGUID+107, 1077, 0, 'Mageroyal', 0, 10), -- Mageroyals in Ashenvale 63 objects total
(@OGUID+108, 1077, 0, 'Mageroyal', 0, 10), -- Mageroyals in Ashenvale 63 objects total
(@OGUID+109, 1077, 0, 'Mageroyal', 0, 10), -- Mageroyals in Ashenvale 63 objects total
(@OGUID+110, 1077, 0, 'Mageroyal', 0, 10), -- Mageroyals in Ashenvale 63 objects total
(@OGUID+111, 1077, 0, 'Mageroyal', 0, 10), -- Mageroyals in Ashenvale 63 objects total
(@OGUID+112, 1077, 0, 'Mageroyal', 0, 10), -- Mageroyals in Ashenvale 63 objects total
(@OGUID+113, 1077, 0, 'Mageroyal', 0, 10), -- Mageroyals in Ashenvale 63 objects total
(@OGUID+114, 1082, 0, 'Mageroyal', 0, 10), -- Various Herbs in Stonetalon 28 objects total
(@OGUID+115, 1082, 0, 'Mageroyal', 0, 10), -- Various Herbs in Stonetalon 28 objects total
(@OGUID+116, 1082, 0, 'Mageroyal', 0, 10), -- Various Herbs in Stonetalon 28 objects total
(@OGUID+117, 1082, 0, 'Mageroyal', 0, 10), -- Various Herbs in Stonetalon 28 objects total
(@OGUID+118, 1082, 0, 'Mageroyal', 0, 10), -- Various Herbs in Stonetalon 28 objects total
(@OGUID+119, 1082, 0, 'Mageroyal', 0, 10), -- Various Herbs in Stonetalon 28 objects total
(@OGUID+120, 1082, 0, 'Mageroyal', 0, 10), -- Various Herbs in Stonetalon 28 objects total
(@OGUID+121, 1082, 0, 'Mageroyal', 0, 10), -- Various Herbs in Stonetalon 28 objects total
(@OGUID+122, 1082, 0, 'Mageroyal', 0, 10), -- Various Herbs in Stonetalon 28 objects total
(@OGUID+123, 1082, 0, 'Mageroyal', 0, 10), -- Various Herbs in Stonetalon 28 objects total
(@OGUID+124, 1082, 0, 'Mageroyal', 0, 10), -- Various Herbs in Stonetalon 28 objects total
(@OGUID+125, 1082, 0, 'Mageroyal', 0, 10), -- Various Herbs in Stonetalon 28 objects total
(@OGUID+126, 1082, 0, 'Mageroyal', 0, 10), -- Various Herbs in Stonetalon 28 objects total
(@OGUID+127, 1082, 0, 'Mageroyal', 0, 10), -- Various Herbs in Stonetalon 28 objects total
(@OGUID+128, 1082, 0, 'Mageroyal', 0, 10), -- Various Herbs in Stonetalon 28 objects total
(@OGUID+129, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+130, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+131, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+132, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+133, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+134, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+135, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+136, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+137, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+138, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+139, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+140, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+141, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+142, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+143, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+144, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+145, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+146, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+147, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+148, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+149, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+150, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+151, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+152, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+153, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+154, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+155, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+156, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+157, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+158, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+159, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+160, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+161, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+162, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+163, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+164, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+165, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+166, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+167, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+168, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+169, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+170, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+171, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+172, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+173, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+174, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+175, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+176, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+177, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+178, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+179, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+180, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+181, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+182, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+183, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+184, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+185, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+186, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+187, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+188, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+189, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+190, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+191, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+192, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+193, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+194, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+195, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+196, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+197, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+198, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+199, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+200, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+201, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+202, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+203, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+204, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+205, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+206, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+207, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+208, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+209, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+210, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+211, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+212, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+213, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+214, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+215, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+216, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+217, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+218, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+219, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+220, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+221, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+222, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+223, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+224, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+225, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+226, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+227, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+228, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+229, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+230, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+231, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+232, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+233, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+234, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+235, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+236, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+237, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+238, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+239, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+240, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+241, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+242, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+243, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+244, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+245, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+246, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+247, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+248, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+249, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+250, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+251, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+252, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+253, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+254, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+255, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+256, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+257, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+258, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+259, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+260, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+261, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+262, 1032, 0, 'Mageroyal', 0, 10), -- Mageroyals in The Barrens
(@OGUID+263, 1032, 0, 'Mageroyal', 0, 10); -- Mageroyals in The Barrens

-- Correct Pools
UPDATE `pool_template` SET `description`='Mageroyal in Ashenvale' WHERE  `entry`=1077;
UPDATE `pool_template` SET `description`='Mageroyal in Barrens' WHERE  `entry`=1032;
UPDATE `pool_template` SET `description`='Mageroyal in Darkshore' WHERE  `entry`=1097;
UPDATE `pool_template` SET `description`='Mageroyal in Durotar' WHERE  `entry`=1023;
UPDATE `pool_template` SET `description`='Mageroyal in Duskwood' WHERE  `entry`=1116;
UPDATE `pool_template` SET `description`='Mageroyal in Hillsbrad Foothills' WHERE  `entry`=1049;
UPDATE `pool_template` SET `description`='Mageroyal in Loch Modan' WHERE  `entry`=1163;
UPDATE `pool_template` SET `description`='Mageroyal in Redridge' WHERE  `entry`=1306;
UPDATE `pool_template` SET `description`='Mageroyal in Silverpine Forest' WHERE  `entry`=1043;
UPDATE `pool_template` SET `description`='Mageroyal in Teldrassil' WHERE  `entry`=1004;
UPDATE `pool_template` SET `description`='Mageroyal in Westfall' WHERE  `entry`=1108;
UPDATE `pool_template` SET `description`='Mageroyal in Wetlands' WHERE  `entry`=1154;

-- Remove Custom Spawns (Non of these spawns exist in the sniff-db)
DELETE FROM `gameobject` WHERE `guid` IN (2126, 2214, 2359, 2301, 2497, 2533, 2086, 2303, 2190, 2273, 2158, 2467, 2131, 2216, 2082, 2084, 2088, 2089, 2091, 2092, 2095, 2098, 2099, 2103, 2104, 2106, 2107, 2108, 2109, 2110, 2112, 2113, 2116, 2117, 2118, 2121, 2122, 2123, 2124, 2125, 2127, 2128, 2130, 2133, 2134, 2135, 2136, 2137, 2138, 2139, 2141, 2142, 2143, 2144, 2145, 2146, 2147, 2150, 2151, 2152, 2153, 2154, 2156, 2159, 2160, 2161, 2162, 2165, 2166, 2167, 2168, 2170, 2171, 2172, 2173, 2174, 2176, 2177, 2178, 2179, 2180, 2181, 2182, 2183, 2184, 2185, 2186, 2187, 2188, 2191, 2192, 2193, 2194, 2195, 2196, 2198, 2199, 2200, 2201, 2202, 2203, 2204, 2205, 2206, 2207, 2209, 2211, 2212, 2213, 2217, 2219, 2220, 2222, 2223, 2225, 2226, 2227, 2228, 2229, 2230, 2231, 2232, 2233, 2234, 2238, 2240, 2241, 2242, 2244, 2245, 2246, 2247, 2249, 2250, 2252, 2253, 2256, 2257, 2258, 2259, 2261, 2262, 2263, 2264, 2266, 2267, 2268, 2270, 2271, 2272, 2274, 2275, 2276, 2277, 2280, 2281, 2285, 2287, 2289, 2290, 2291, 2292, 2293, 2294, 2296, 2297, 2299, 2300, 2304, 2308, 2310, 2311, 2312, 2313, 2314, 2315, 2316, 2317, 2318, 2326, 2328, 2330, 2332, 2333, 2334, 2337, 2339, 2340, 2341, 2342, 2343, 2344, 2345, 2347, 2348, 2349, 2350, 2351, 2352, 2353, 2354, 2355, 2356, 2357, 2358, 2361, 2362, 2363, 2369, 2375, 2377, 2378, 2381, 2382, 2383, 2384, 2385, 2386, 2387, 2388, 2389, 2390, 2392, 2393, 2394, 2395, 2397, 2400, 2401, 2405, 2406, 2407, 2408, 2409, 2410, 2411, 2412, 2413, 2414, 2417, 2418, 2419, 2423, 2424, 2425, 2426, 2427, 2429, 2430, 2431, 2433, 2434, 2436, 2437, 2438, 2439, 2440, 2441, 2442, 2443, 2444, 2445, 2446, 2447, 2450, 2452, 2454, 2455, 2459, 2461, 2462, 2463, 2464, 2469, 2470, 2471, 2472, 2475, 2479, 2480, 2482, 2483, 2486, 2487, 2488, 2489, 2492, 2493, 2494, 2495, 2496, 2498, 2501, 2503, 2504, 2506, 2507, 2508, 2509, 2512, 2513, 2515, 2518, 2520, 2522, 2523, 2525, 2528, 2530, 2534, 2535, 2536, 2537, 2538, 2539, 2540, 2541, 12625, 13357, 13358);
DELETE FROM `pool_gameobject` WHERE `guid` IN (2126, 2214, 2359, 2301, 2497, 2533, 2086, 2303, 2190, 2273, 2158, 2467, 2131, 2216, 2082, 2084, 2088, 2089, 2091, 2092, 2095, 2098, 2099, 2103, 2104, 2106, 2107, 2108, 2109, 2110, 2112, 2113, 2116, 2117, 2118, 2121, 2122, 2123, 2124, 2125, 2127, 2128, 2130, 2133, 2134, 2135, 2136, 2137, 2138, 2139, 2141, 2142, 2143, 2144, 2145, 2146, 2147, 2150, 2151, 2152, 2153, 2154, 2156, 2159, 2160, 2161, 2162, 2165, 2166, 2167, 2168, 2170, 2171, 2172, 2173, 2174, 2176, 2177, 2178, 2179, 2180, 2181, 2182, 2183, 2184, 2185, 2186, 2187, 2188, 2191, 2192, 2193, 2194, 2195, 2196, 2198, 2199, 2200, 2201, 2202, 2203, 2204, 2205, 2206, 2207, 2209, 2211, 2212, 2213, 2217, 2219, 2220, 2222, 2223, 2225, 2226, 2227, 2228, 2229, 2230, 2231, 2232, 2233, 2234, 2238, 2240, 2241, 2242, 2244, 2245, 2246, 2247, 2249, 2250, 2252, 2253, 2256, 2257, 2258, 2259, 2261, 2262, 2263, 2264, 2266, 2267, 2268, 2270, 2271, 2272, 2274, 2275, 2276, 2277, 2280, 2281, 2285, 2287, 2289, 2290, 2291, 2292, 2293, 2294, 2296, 2297, 2299, 2300, 2304, 2308, 2310, 2311, 2312, 2313, 2314, 2315, 2316, 2317, 2318, 2326, 2328, 2330, 2332, 2333, 2334, 2337, 2339, 2340, 2341, 2342, 2343, 2344, 2345, 2347, 2348, 2349, 2350, 2351, 2352, 2353, 2354, 2355, 2356, 2357, 2358, 2361, 2362, 2363, 2369, 2375, 2377, 2378, 2381, 2382, 2383, 2384, 2385, 2386, 2387, 2388, 2389, 2390, 2392, 2393, 2394, 2395, 2397, 2400, 2401, 2405, 2406, 2407, 2408, 2409, 2410, 2411, 2412, 2413, 2414, 2417, 2418, 2419, 2423, 2424, 2425, 2426, 2427, 2429, 2430, 2431, 2433, 2434, 2436, 2437, 2438, 2439, 2440, 2441, 2442, 2443, 2444, 2445, 2446, 2447, 2450, 2452, 2454, 2455, 2459, 2461, 2462, 2463, 2464, 2469, 2470, 2471, 2472, 2475, 2479, 2480, 2482, 2483, 2486, 2487, 2488, 2489, 2492, 2493, 2494, 2495, 2496, 2498, 2501, 2503, 2504, 2506, 2507, 2508, 2509, 2512, 2513, 2515, 2518, 2520, 2522, 2523, 2525, 2528, 2530, 2534, 2535, 2536, 2537, 2538, 2539, 2540, 2541, 12625, 13357, 13358);

-- Sync Gobject Data
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300, `spawn_flags` = 0, `animprogress` = 100 WHERE `id` IN (1620, 3727);

-- Update Counters
UPDATE `pool_template` SET `max_limit`=13 WHERE  `entry`=1306;
UPDATE `pool_template` SET `max_limit`=10 WHERE  `entry`=1116;
UPDATE `pool_template` SET `max_limit`=22 WHERE  `entry`=1108;
UPDATE `pool_template` SET `max_limit`=21 WHERE  `entry`=1097;
UPDATE `pool_template` SET `max_limit`=18 WHERE  `entry`=1163;
UPDATE `pool_template` SET `max_limit`=15 WHERE  `entry`=1154;
UPDATE `pool_template` SET `max_limit`=24 WHERE  `entry`=1043;
UPDATE `pool_template` SET `max_limit`=66 WHERE  `entry`=1032;
UPDATE `pool_template` SET `max_limit`=5 WHERE  `entry`=1023;
UPDATE `pool_template` SET `max_limit`=9 WHERE  `entry`=1077;
UPDATE `pool_template` SET `max_limit`=7 WHERE  `entry`=1004;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
