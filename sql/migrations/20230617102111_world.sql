DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230617102111');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230617102111');
-- Add your query below.


-- Silverleaf (1617, 3725)
SET @OGUID = 46511;

-- Correct position of Silverleaf in Durotar (position is off by 0.000991821 yards).
UPDATE `gameobject` SET `position_x`=-255.429, `position_y`=-4707.5, `position_z`=34.3226, `orientation`=3.80482, `rotation0`=0, `rotation1`=0, `rotation2`=-0.945518, `rotation3`=0.325568 WHERE `guid`=1090;

-- Correct position of Silverleaf in Tirisfal Glades (position is off by 0.209378 yards).
UPDATE `gameobject` SET `position_x`=2470.09, `position_y`=1303.12, `position_z`=30.0153, `orientation`=4.4855, `rotation0`=0, `rotation1`=0, `rotation2`=-0.782608, `rotation3`=0.622515 WHERE `guid`=937;

-- Correct position of Silverleaf in Tirisfal Glades (position is off by 0.333986 yards).
UPDATE `gameobject` SET `position_x`=1982.06, `position_y`=765.514, `position_z`=40.4216, `orientation`=3.73501, `rotation0`=0, `rotation1`=0, `rotation2`=-0.956305, `rotation3`=0.292372 WHERE `guid`=933;

-- Correct position of Silverleaf in Mulgore (position is off by 3.86142 yards).
UPDATE `gameobject` SET `position_x`=-1916.6, `position_y`=-996.191, `position_z`=45.854, `orientation`=5.044, `rotation0`=0, `rotation1`=0, `rotation2`=-0.580703, `rotation3`=0.814116 WHERE `guid`=877;

-- Correct position of Silverleaf in Silverpine Forest (position is off by 0.731387 yards).
UPDATE `gameobject` SET `position_x`=1147.77, `position_y`=1535.59, `position_z`=34.6036, `orientation`=2.04204, `rotation0`=0, `rotation1`=0, `rotation2`=0.85264, `rotation3`=0.522499 WHERE `guid`=572;

-- Correct position of Silverleaf in Mulgore (position is off by 0.517582 yards).
UPDATE `gameobject` SET `position_x`=-2289.25, `position_y`=-942.965, `position_z`=-5.45185, `orientation`=0.925024, `rotation0`=0, `rotation1`=0, `rotation2`=0.446198, `rotation3`=0.894935 WHERE `guid`=766;

-- Correct position of Silverleaf in Silverpine Forest (position is off by 0.551449 yards).
UPDATE `gameobject` SET `position_x`=1175.17, `position_y`=1799.59, `position_z`=18.5994, `orientation`=5.91667, `rotation0`=0, `rotation1`=0, `rotation2`=-0.182235, `rotation3`=0.983255 WHERE `guid`=806;

-- Correct position of Silverleaf in Silverpine Forest (position is off by 0.0130997 yards).
UPDATE `gameobject` SET `position_x`=1431.94, `position_y`=826.901, `position_z`=51.8469, `orientation`=2.47837, `rotation0`=0, `rotation1`=0, `rotation2`=0.945518, `rotation3`=0.325568 WHERE `guid`=1241;

-- Correct position of Silverleaf in Silverpine Forest (position is off by 0.516273 yards).
UPDATE `gameobject` SET `position_x`=1032.04, `position_y`=1212.5, `position_z`=48.3156, `orientation`=2.86234, `rotation0`=0, `rotation1`=0, `rotation2`=0.990268, `rotation3`=0.139175 WHERE `guid`=1097;

-- Correct position of Silverleaf in Silverpine Forest (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=1256.75, `position_y`=1151.34, `position_z`=50.9408, `orientation`=0.226892, `rotation0`=0, `rotation1`=0, `rotation2`=0.113203, `rotation3`=0.993572 WHERE `guid`=515;

-- Correct position of Silverleaf in Tirisfal Glades (position is off by 0.97266 yards).
UPDATE `gameobject` SET `position_x`=1859.72, `position_y`=704.132, `position_z`=40.2275, `orientation`=4.27606, `rotation0`=0, `rotation1`=0, `rotation2`=-0.843391, `rotation3`=0.5373 WHERE `guid`=728;

-- Correct position of Silverleaf in Durotar (position is off by 0.771847 yards).
UPDATE `gameobject` SET `position_x`=385.542, `position_y`=-4081.23, `position_z`=32.0753, `orientation`=4.03171, `rotation0`=0, `rotation1`=0, `rotation2`=-0.902585, `rotation3`=0.430512 WHERE `guid`=799;

-- Correct position of Silverleaf in Silverpine Forest (position is off by 0.00839996 yards).
UPDATE `gameobject` SET `position_x`=1118.51, `position_y`=1147.29, `position_z`=45.1796, `orientation`=5.00909, `rotation0`=0, `rotation1`=0, `rotation2`=-0.594823, `rotation3`=0.803857 WHERE `guid`=679;

-- Correct position of Silverleaf in Silverpine Forest (position is off by 0.0130997 yards).
UPDATE `gameobject` SET `position_x`=1360.65, `position_y`=1053.08, `position_z`=53.7951, `orientation`=0.401425, `rotation0`=0, `rotation1`=0, `rotation2`=0.199368, `rotation3`=0.979925 WHERE `guid`=529;

-- Correct position of Silverleaf in Mulgore (position is off by 0.991998 yards).
UPDATE `gameobject` SET `position_x`=-1103.82, `position_y`=296.43, `position_z`=40.5381, `orientation`=3.31614, `rotation0`=0, `rotation1`=0, `rotation2`=-0.996194, `rotation3`=0.087165 WHERE `guid`=1247;

-- Correct position of Silverleaf in Mulgore (position is off by 0.79428 yards).
UPDATE `gameobject` SET `position_x`=-1737.25, `position_y`=66.6602, `position_z`=-2.04936, `orientation`=1.90241, `rotation0`=0, `rotation1`=0, `rotation2`=0.814116, `rotation3`=0.580703 WHERE `guid`=747;

-- Correct position of Silverleaf in Mulgore (position is off by 0.629218 yards).
UPDATE `gameobject` SET `position_x`=-1723.28, `position_y`=-707.532, `position_z`=-9.68622, `orientation`=5.68977, `rotation0`=0, `rotation1`=0, `rotation2`=-0.292372, `rotation3`=0.956305 WHERE `guid`=1027;

-- Correct position of Silverleaf in Mulgore (position is off by 1.17925 yards).
UPDATE `gameobject` SET `position_x`=-2679.12, `position_y`=-261.173, `position_z`=3.0219, `orientation`=4.41568, `rotation0`=0, `rotation1`=0, `rotation2`=-0.803857, `rotation3`=0.594823 WHERE `guid`=1201;

-- Correct position of Silverleaf in Durotar (position is off by 0.0010376 yards).
UPDATE `gameobject` SET `position_x`=654.603, `position_y`=-4906.94, `position_z`=25.1601, `orientation`=4.64258, `rotation0`=0, `rotation1`=0, `rotation2`=-0.731354, `rotation3`=0.681998 WHERE `guid`=10376;

-- Correct position of Silverleaf in Mulgore (position is off by 1.14342 yards).
UPDATE `gameobject` SET `position_x`=-1762.1, `position_y`=224.467, `position_z`=38.1832, `orientation`=3.99681, `rotation0`=0, `rotation1`=0, `rotation2`=-0.909961, `rotation3`=0.414694 WHERE `guid`=680;

-- Correct position of Silverleaf in Thunder Bluff (position is off by 0.000976563 yards).
UPDATE `gameobject` SET `position_x`=-940.064, `position_y`=15.0219, `position_z`=16.501, `orientation`=5.96903, `rotation0`=0, `rotation1`=0, `rotation2`=-0.156434, `rotation3`=0.987688 WHERE `guid`=18271;

-- Correct position of Silverleaf in Silverpine Forest (position is off by 0.772616 yards).
UPDATE `gameobject` SET `position_x`=1419, `position_y`=1039.6, `position_z`=53.4083, `orientation`=0.191985, `rotation0`=0, `rotation1`=0, `rotation2`=0.0958452, `rotation3`=0.995396 WHERE `guid`=845;

-- Correct position of Silverleaf in Darkshore (position is off by 0.879245 yards).
UPDATE `gameobject` SET `position_x`=4736.46, `position_y`=337.591, `position_z`=54.0177, `orientation`=5.58505, `rotation0`=0, `rotation1`=0, `rotation2`=-0.34202, `rotation3`=0.939693 WHERE `guid`=1192;

-- Correct position of Silverleaf in Darkshore (position is off by 0.99723 yards).
UPDATE `gameobject` SET `position_x`=4963.24, `position_y`=287.666, `position_z`=41.1007, `orientation`=2.91469, `rotation0`=0, `rotation1`=0, `rotation2`=0.993571, `rotation3`=0.113208 WHERE `guid`=692;

-- Correct position of Silverleaf in Mulgore (position is off by 0.954956 yards).
UPDATE `gameobject` SET `position_x`=-2314.51, `position_y`=63.8172, `position_z`=36.9905, `orientation`=0.90757, `rotation0`=0, `rotation1`=0, `rotation2`=0.438371, `rotation3`=0.898794 WHERE `guid`=600;

-- Correct position of Silverleaf in Tirisfal Glades (position is off by 0.703492 yards).
UPDATE `gameobject` SET `position_x`=2288.28, `position_y`=1253, `position_z`=38.1232, `orientation`=1.98967, `rotation0`=0, `rotation1`=0, `rotation2`=0.83867, `rotation3`=0.54464 WHERE `guid`=697;

-- Correct position of Silverleaf in Silverpine Forest (position is off by 0.573681 yards).
UPDATE `gameobject` SET `position_x`=1422.82, `position_y`=963.759, `position_z`=53.1783, `orientation`=4.04917, `rotation0`=0, `rotation1`=0, `rotation2`=-0.898793, `rotation3`=0.438373 WHERE `guid`=900;

-- Correct position of Silverleaf in Durotar (position is off by 0.0986892 yards).
UPDATE `gameobject` SET `position_x`=-496.945, `position_y`=-4685.08, `position_z`=38.0286, `orientation`=4.29351, `rotation0`=0, `rotation1`=0, `rotation2`=-0.83867, `rotation3`=0.54464 WHERE `guid`=931;

-- Correct position of Silverleaf in Durotar (position is off by 0.655067 yards).
UPDATE `gameobject` SET `position_x`=-334.918, `position_y`=-5162.35, `position_z`=20.7662, `orientation`=3.64774, `rotation0`=0, `rotation1`=0, `rotation2`=-0.968147, `rotation3`=0.250381 WHERE `guid`=1254;

-- Correct position of Silverleaf in Durotar (position is off by 1.80695 yards).
UPDATE `gameobject` SET `position_x`=20.9071, `position_y`=-4266.03, `position_z`=72.0731, `orientation`=6.26573, `rotation0`=0, `rotation1`=0, `rotation2`=-0.00872612, `rotation3`=0.999962 WHERE `guid`=1008;

-- Correct position of Silverleaf in Durotar (position is off by 0.926123 yards).
UPDATE `gameobject` SET `position_x`=64.931, `position_y`=-4331.12, `position_z`=61.7287, `orientation`=3.22886, `rotation0`=0, `rotation1`=0, `rotation2`=-0.999048, `rotation3`=0.0436193 WHERE `guid`=871;

-- Correct position of Silverleaf in Silverpine Forest (position is off by 0.369205 yards).
UPDATE `gameobject` SET `position_x`=1418.93, `position_y`=877.221, `position_z`=48.7309, `orientation`=6.12611, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0784588, `rotation3`=0.996917 WHERE `guid`=1242;

-- Correct position of Silverleaf in Silverpine Forest (position is off by 0.690998 yards).
UPDATE `gameobject` SET `position_x`=-619.528, `position_y`=819.823, `position_z`=106.308, `orientation`=0.733038, `rotation0`=0, `rotation1`=0, `rotation2`=0.358368, `rotation3`=0.93358 WHERE `guid`=1028;

-- Correct position of Silverleaf in Mulgore (position is off by 0.817011 yards).
UPDATE `gameobject` SET `position_x`=-1960.78, `position_y`=-61.7807, `position_z`=-2.10473, `orientation`=4.66003, `rotation0`=0, `rotation1`=0, `rotation2`=-0.725374, `rotation3`=0.688355 WHERE `guid`=517;

-- Correct position of Silverleaf in Loch Modan (position is off by 0.686753 yards).
UPDATE `gameobject` SET `position_x`=-4694.24, `position_y`=-2836.63, `position_z`=324.716, `orientation`=6.14356, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0697556, `rotation3`=0.997564 WHERE `guid`=1151;

-- Correct position of Silverleaf in Tirisfal Glades (position is off by 0.727043 yards).
UPDATE `gameobject` SET `position_x`=2667.91, `position_y`=323.909, `position_z`=30.3662, `orientation`=4.50295, `rotation0`=0, `rotation1`=0, `rotation2`=-0.777145, `rotation3`=0.629321 WHERE `guid`=981;

-- Correct position of Silverleaf in Tirisfal Glades (position is off by 0.624185 yards).
UPDATE `gameobject` SET `position_x`=2064.9, `position_y`=327.924, `position_z`=55.4736, `orientation`=0.925024, `rotation0`=0, `rotation1`=0, `rotation2`=0.446198, `rotation3`=0.894935 WHERE `guid`=1152;

-- Correct position of Silverleaf in Tirisfal Glades (position is off by 0.580626 yards).
UPDATE `gameobject` SET `position_x`=2065.34, `position_y`=840.386, `position_z`=36.0886, `orientation`=2.9845, `rotation0`=0, `rotation1`=0, `rotation2`=0.996917, `rotation3`=0.0784664 WHERE `guid`=508;

-- Correct position of Silverleaf in Durotar (position is off by 0.000200272 yards).
UPDATE `gameobject` SET `position_x`=1098.23, `position_y`=-4027, `position_z`=17.6118, `orientation`=5.2709, `rotation0`=0, `rotation1`=0, `rotation2`=-0.484809, `rotation3`=0.87462 WHERE `guid`=820;

-- Correct position of Silverleaf in Mulgore (position is off by 0.976092 yards).
UPDATE `gameobject` SET `position_x`=-2445.28, `position_y`=-1313.81, `position_z`=-6.53294, `orientation`=0.122173, `rotation0`=0, `rotation1`=0, `rotation2`=0.0610485, `rotation3`=0.998135 WHERE `guid`=1070;

-- Correct position of Silverleaf in Mulgore (position is off by 0.375882 yards).
UPDATE `gameobject` SET `position_x`=-2191.18, `position_y`=-1163.33, `position_z`=16.4954, `orientation`=4.11898, `rotation0`=0, `rotation1`=0, `rotation2`=-0.882947, `rotation3`=0.469473 WHERE `guid`=995;

-- Correct position of Silverleaf in Elwynn Forest (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-10004.4, `position_y`=-51.3555, `position_z`=30.7996, `orientation`=6.23083, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0261765, `rotation3`=0.999657 WHERE `guid`=914;

-- Correct position of Silverleaf in Tirisfal Glades (position is off by 0.00014162 yards).
UPDATE `gameobject` SET `position_x`=2842.78, `position_y`=23.8513, `position_z`=26.0167, `orientation`=3.82227, `rotation0`=0, `rotation1`=0, `rotation2`=-0.942641, `rotation3`=0.333808 WHERE `guid`=832;

-- Correct position of Silverleaf in Tirisfal Glades (position is off by 0.523537 yards).
UPDATE `gameobject` SET `position_x`=2512.33, `position_y`=475.013, `position_z`=35.5981, `orientation`=3.45576, `rotation0`=0, `rotation1`=0, `rotation2`=-0.987688, `rotation3`=0.156436 WHERE `guid`=510;

-- Correct position of Silverleaf in Tirisfal Glades (position is off by 0.239271 yards).
UPDATE `gameobject` SET `position_x`=2171.74, `position_y`=577.105, `position_z`=44.4721, `orientation`=4.45059, `rotation0`=0, `rotation1`=0, `rotation2`=-0.793353, `rotation3`=0.608762 WHERE `guid`=1229;

-- Correct position of Silverleaf in Loch Modan (position is off by 0.470023 yards).
UPDATE `gameobject` SET `position_x`=-5280.93, `position_y`=-2846.44, `position_z`=345.207, `orientation`=5.09636, `rotation0`=0, `rotation1`=0, `rotation2`=-0.559193, `rotation3`=0.829038 WHERE `guid`=657;

-- Correct position of Silverleaf in Mulgore (position is off by 0.762694 yards).
UPDATE `gameobject` SET `position_x`=-946.635, `position_y`=-705.401, `position_z`=-34.1329, `orientation`=3.6652, `rotation0`=0, `rotation1`=0, `rotation2`=-0.965925, `rotation3`=0.258821 WHERE `guid`=702;

-- Correct position of Silverleaf in Loch Modan (position is off by 0.546649 yards).
UPDATE `gameobject` SET `position_x`=-5295.13, `position_y`=-2777.47, `position_z`=353.044, `orientation`=1.27409, `rotation0`=0, `rotation1`=0, `rotation2`=0.594822, `rotation3`=0.803857 WHERE `guid`=703;

-- Correct position of Silverleaf in Loch Modan (position is off by 0.847436 yards).
UPDATE `gameobject` SET `position_x`=-5846.57, `position_y`=-3094.73, `position_z`=326.49, `orientation`=0.139624, `rotation0`=0, `rotation1`=0, `rotation2`=0.0697556, `rotation3`=0.997564 WHERE `guid`=1238;

-- Correct position of Silverleaf in Durotar (position is off by 0.636294 yards).
UPDATE `gameobject` SET `position_x`=117.178, `position_y`=-4960.4, `position_z`=9.15625, `orientation`=2.02458, `rotation0`=0, `rotation1`=0, `rotation2`=0.848047, `rotation3`=0.529921 WHERE `guid`=1171;

-- Correct position of Silverleaf in Durotar (position is off by 1.04121 yards).
UPDATE `gameobject` SET `position_x`=776.61, `position_y`=-4406.04, `position_z`=18.8163, `orientation`=5.53269, `rotation0`=0, `rotation1`=0, `rotation2`=-0.366501, `rotation3`=0.930418 WHERE `guid`=568;

-- Correct position of Silverleaf in Loch Modan (position is off by 0.84427 yards).
UPDATE `gameobject` SET `position_x`=-5227.5, `position_y`=-2940.68, `position_z`=341.919, `orientation`=3.35105, `rotation0`=0, `rotation1`=0, `rotation2`=-0.994521, `rotation3`=0.104536 WHERE `guid`=1227;

-- Correct position of Silverleaf in Darkshore (position is off by 0.427608 yards).
UPDATE `gameobject` SET `position_x`=4454.55, `position_y`=468.077, `position_z`=50.9815, `orientation`=0.575957, `rotation0`=0, `rotation1`=0, `rotation2`=0.284015, `rotation3`=0.95882 WHERE `guid`=470;

-- Correct position of Silverleaf in Darkshore (position is off by 0.541111 yards).
UPDATE `gameobject` SET `position_x`=4645.45, `position_y`=196.456, `position_z`=61.7261, `orientation`=1.02974, `rotation0`=0, `rotation1`=0, `rotation2`=0.492423, `rotation3`=0.870356 WHERE `guid`=1001;

-- Correct position of Silverleaf in Darkshore (position is off by 0.606603 yards).
UPDATE `gameobject` SET `position_x`=6173.2, `position_y`=367.5, `position_z`=33.1542, `orientation`=1.72787, `rotation0`=0, `rotation1`=0, `rotation2`=0.760406, `rotation3`=0.649449 WHERE `guid`=460;

-- Correct position of Silverleaf in Darkshore (position is off by 0.874234 yards).
UPDATE `gameobject` SET `position_x`=7237.36, `position_y`=-783.805, `position_z`=26.6101, `orientation`=6.02139, `rotation0`=0, `rotation1`=0, `rotation2`=-0.130526, `rotation3`=0.991445 WHERE `guid`=459;

-- Correct position of Silverleaf in Darkshore (position is off by 0.98468 yards).
UPDATE `gameobject` SET `position_x`=6827.44, `position_y`=258.564, `position_z`=21.5101, `orientation`=2.46091, `rotation0`=0, `rotation1`=0, `rotation2`=0.942641, `rotation3`=0.333808 WHERE `guid`=941;

-- Correct position of Silverleaf in Darkshore (position is off by 1.22741 yards).
UPDATE `gameobject` SET `position_x`=6900.68, `position_y`=-474.778, `position_z`=45.4724, `orientation`=0.0523589, `rotation0`=0, `rotation1`=0, `rotation2`=0.0261765, `rotation3`=0.999657 WHERE `guid`=876;

-- Correct position of Silverleaf in Darkshore (position is off by 0.859083 yards).
UPDATE `gameobject` SET `position_x`=7028.67, `position_y`=-602.416, `position_z`=51.3293, `orientation`=6.07375, `rotation0`=0, `rotation1`=0, `rotation2`=-0.104528, `rotation3`=0.994522 WHERE `guid`=1047;

-- Correct position of Silverleaf in Darkshore (position is off by 1.03028 yards).
UPDATE `gameobject` SET `position_x`=7136.7, `position_y`=83.1474, `position_z`=15.0964, `orientation`=5.39307, `rotation0`=0, `rotation1`=0, `rotation2`=-0.430511, `rotation3`=0.902586 WHERE `guid`=501;

-- Correct position of Silverleaf in Darkshore (position is off by 1.01376 yards).
UPDATE `gameobject` SET `position_x`=6353.61, `position_y`=52.8557, `position_z`=33.4221, `orientation`=5.49779, `rotation0`=0, `rotation1`=0, `rotation2`=-0.382683, `rotation3`=0.92388 WHERE `guid`=690;

-- Correct position of Silverleaf in Tirisfal Glades (position is off by 0.863322 yards).
UPDATE `gameobject` SET `position_x`=2333.6, `position_y`=606.94, `position_z`=34.1543, `orientation`=0.401425, `rotation0`=0, `rotation1`=0, `rotation2`=0.199368, `rotation3`=0.979925 WHERE `guid`=1187;

-- Correct position of Silverleaf in Durotar (position is off by 0.925286 yards).
UPDATE `gameobject` SET `position_x`=295.779, `position_y`=-4322.27, `position_z`=33.3949, `orientation`=0.488691, `rotation0`=0, `rotation1`=0, `rotation2`=0.241921, `rotation3`=0.970296 WHERE `guid`=843;

-- Correct position of Silverleaf in Durotar (position is off by 1.63499 yards).
UPDATE `gameobject` SET `position_x`=10.699, `position_y`=-4619.18, `position_z`=44.091, `orientation`=5.48033, `rotation0`=0, `rotation1`=0, `rotation2`=-0.390731, `rotation3`=0.920505 WHERE `guid`=1137;

-- Correct position of Silverleaf in Elwynn Forest (position is off by 2.13122 yards).
UPDATE `gameobject` SET `position_x`=-9597.17, `position_y`=971.579, `position_z`=42.0809, `orientation`=2.23402, `rotation0`=0, `rotation1`=0, `rotation2`=0.898793, `rotation3`=0.438373 WHERE `guid`=934;

-- Correct position of Silverleaf in Mulgore (position is off by 1.57422 yards).
UPDATE `gameobject` SET `position_x`=-1700.42, `position_y`=-807.382, `position_z`=18.8665, `orientation`=0.558504, `rotation0`=0, `rotation1`=0, `rotation2`=0.275637, `rotation3`=0.961262 WHERE `guid`=774;

-- Correct position of Silverleaf in Mulgore (position is off by 0.108602 yards).
UPDATE `gameobject` SET `position_x`=-2475.99, `position_y`=-71.0842, `position_z`=-3.06786, `orientation`=2.07694, `rotation0`=0, `rotation1`=0, `rotation2`=0.861629, `rotation3`=0.507539 WHERE `guid`=583;

-- Correct position of Silverleaf in Westfall (position is off by 4.4419 yards).
UPDATE `gameobject` SET `position_x`=-10307.6, `position_y`=1344.26, `position_z`=40.4595, `orientation`=3.29869, `rotation0`=0, `rotation1`=0, `rotation2`=-0.996917, `rotation3`=0.0784664 WHERE `guid`=40000;

-- Missing Silverleaf spawns in Dun Morogh.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1617, 0, -5576.14, -1609.03, 394.671, 5.42797, 0, 0, -0.414693, 0.909961, 300, 300, 1, 100, 0, 10), 
(@OGUID+2, 1617, 0, -5718.47, -1813.51, 399.721, 2.96704, 0, 0, 0.996194, 0.087165, 300, 300, 1, 100, 0, 10), 
(@OGUID+3, 1617, 0, -5731.14, -394.698, 365.579, 1.41372, 0, 0, 0.649447, 0.760406, 300, 300, 1, 100, 0, 10), 
(@OGUID+4, 1617, 0, -5866.94, -2051.82, 401.116, 4.08407, 0, 0, -0.891006, 0.453991, 300, 300, 1, 100, 0, 10), 
(@OGUID+5, 1617, 0, -5301.05, 284.52, 392.798, 6.05629, 0, 0, -0.113203, 0.993572, 300, 300, 1, 100, 0, 10), 
(@OGUID+6, 1617, 0, -5693.27, -1248.39, 389.542, 1.53589, 0, 0, 0.694658, 0.71934, 300, 300, 1, 100, 0, 10), 
(@OGUID+7, 1617, 0, -5774.56, 288.959, 382.313, 4.46804, 0, 0, -0.788011, 0.615662, 300, 300, 1, 100, 0, 10),
(@OGUID+8, 1617, 0, -5756.76, -933.046, 397.323, 1.18682, 0, 0, 0.559193, 0.829038, 300, 300, 1, 100, 0, 10),
(@OGUID+9, 1617, 0, -5753.79, -1324.02, 391.111, 3.56047, 0, 0, -0.978148, 0.207912, 300, 300, 1, 100, 0, 10),
(@OGUID+10, 1617, 0, -5742.28, 130.065, 368.739, 1.53589, 0, 0, 0.694658, 0.71934, 300, 300, 1, 100, 0, 10),
(@OGUID+11, 1617, 0, -5682.57, 336.39, 387.171, 5.70723, 0, 0, -0.284015, 0.95882, 300, 300, 1, 100, 0, 10),
(@OGUID+12, 1617, 0, -5606.27, 274.597, 394.865, 3.00195, 0, 0, 0.997563, 0.0697661, 300, 300, 1, 100, 0, 10),
(@OGUID+13, 1617, 0, -5605.18, -1705.6, 398.696, 3.61284, 0, 0, -0.972369, 0.233448, 300, 300, 1, 100, 0, 10),
(@OGUID+14, 1617, 0, -5604.6, 405.176, 380.873, 0.645772, 0, 0, 0.317305, 0.948324, 300, 300, 1, 100, 0, 10),
(@OGUID+15, 1617, 0, -5353.64, 494.603, 385.315, 4.31097, 0, 0, -0.833885, 0.551938, 300, 300, 1, 100, 0, 10),
(@OGUID+16, 1617, 0, -5344.7, 349.86, 396.224, 3.68265, 0, 0, -0.96363, 0.267241, 300, 300, 1, 100, 0, 10),
(@OGUID+17, 1617, 0, -5244.96, 387.257, 394.74, 6.0912, 0, 0, -0.0958452, 0.995396, 300, 300, 1, 100, 0, 10),
(@OGUID+18, 1617, 0, -5212.73, 319.016, 398.053, 5.8294, 0, 0, -0.224951, 0.97437, 300, 300, 1, 100, 0, 10),
(@OGUID+19, 1617, 0, -5198.43, 429.902, 390.111, 3.14159, 0, 0, -1, 0, 300, 300, 1, 100, 0, 10),
(@OGUID+20, 1617, 0, -5102.46, 402.344, 405.065, 0.366518, 0, 0, 0.182235, 0.983255, 300, 300, 1, 100, 0, 10),
(@OGUID+21, 1617, 0, -5087.72, 94.2346, 395.396, 0.296705, 0, 0, 0.147809, 0.989016, 300, 300, 1, 100, 0, 10),
(@OGUID+22, 1617, 0, -5016.25, -29.291, 388.769, 4.13643, 0, 0, -0.878817, 0.47716, 300, 300, 1, 100, 0, 10),
(@OGUID+23, 1617, 0, -4924.67, -353.482, 391.228, 4.99164, 0, 0, -0.601814, 0.798636, 300, 300, 1, 100, 0, 10);

-- Missing Silverleaf spawns in Elwynn Forest.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+24, 1617, 0, -9308.64, -208.554, 68.0084, 0.59341, 0, 0, 0.292371, 0.956305, 300, 300, 1, 100, 0, 10), 
(@OGUID+25, 1617, 0, -9785.19, -1567, 41.5241, 4.31097, 0, 0, -0.833885, 0.551938, 300, 300, 1, 100, 0, 10), 
(@OGUID+26, 1617, 0, -9490.43, -740.377, 60.2324, 2.23402, 0, 0, 0.898793, 0.438373, 300, 300, 1, 100, 0, 10), 
(@OGUID+27, 1617, 0, -9627.64, -1495.21, 58.7032, 5.72468, 0, 0, -0.275637, 0.961262, 300, 300, 1, 100, 0, 10), 
(@OGUID+28, 1617, 0, -9884.6, -1331.49, 33.1969, 0.872664, 0, 0, 0.422618, 0.906308, 300, 300, 1, 100, 0, 10), 
(@OGUID+29, 1617, 0, -9711.49, -1322.18, 50.8747, 5.34071, 0, 0, -0.45399, 0.891007, 300, 300, 1, 100, 0, 10), 
(@OGUID+30, 1617, 0, -9023.61, -1263.65, 76.5311, 5.70723, 0, 0, -0.284015, 0.95882, 300, 300, 1, 100, 0, 10), 
(@OGUID+31, 1617, 0, -9329.45, -801.189, 66.006, 4.67748, 0, 0, -0.719339, 0.694659, 300, 300, 1, 100, 0, 10), 
(@OGUID+32, 1617, 0, -9644.08, 797.022, 33.5315, 0.314158, 0, 0, 0.156434, 0.987688, 300, 300, 1, 100, 0, 10), 
(@OGUID+33, 1617, 0, -9403.12, -919.279, 60.9487, 5.34071, 0, 0, -0.45399, 0.891007, 300, 300, 1, 100, 0, 10), 
(@OGUID+34, 1617, 0, -9787, -297.477, 46.8726, 4.18879, 0, 0, -0.866025, 0.500001, 300, 300, 1, 100, 0, 10), 
(@OGUID+35, 1617, 0, -10042.4, 13.059, 30.5839, 3.89209, 0, 0, -0.930417, 0.366502, 300, 300, 1, 100, 0, 10),
(@OGUID+36, 1617, 0, -9896.43, -96.5816, 29.1457, 5.11382, 0, 0, -0.551936, 0.833886, 300, 300, 1, 100, 0, 10),
(@OGUID+37, 1617, 0, -9757.63, -1501.73, 47.7348, 0.994837, 0, 0, 0.477159, 0.878817, 300, 300, 1, 100, 0, 10),
(@OGUID+38, 1617, 0, -9687.96, -463.91, 53.1311, 5.93412, 0, 0, -0.173648, 0.984808, 300, 300, 1, 100, 0, 10),
(@OGUID+39, 1617, 0, -9400.21, -264.986, 64.0626, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 1, 100, 0, 10);

-- Missing Silverleaf spawns in Durotar.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+40, 1617, 1, -1118.7, -5156.81, 1.81445, 0.802851, 0, 0, 0.390731, 0.920505, 300, 300, 1, 100, 0, 10), 
(@OGUID+41, 1617, 1, 716.88, -5005.57, 15.1452, 6.26573, 0, 0, -0.00872612, 0.999962, 300, 300, 1, 100, 0, 10), 
(@OGUID+42, 1617, 1, 1358.3, -4569.46, 37.8919, 5.96903, 0, 0, -0.156434, 0.987688, 300, 300, 1, 100, 0, 10), 
(@OGUID+43, 1617, 1, 1428.5, -4748.67, 30.0708, 2.87979, 0, 0, 0.991445, 0.130528, 300, 300, 1, 100, 0, 10), 
(@OGUID+44, 1617, 1, 332.682, -4996.81, 19.5713, 0.0349062, 0, 0, 0.0174522, 0.999848, 300, 300, 1, 100, 0, 10), 
(@OGUID+45, 1617, 1, -293.877, -4903.56, 31.5329, 5.00909, 0, 0, -0.594823, 0.803857, 300, 300, 1, 100, 0, 10), 
(@OGUID+46, 1617, 1, -547.241, -4659.26, 40.4069, 0.471238, 0, 0, 0.233445, 0.97237, 300, 300, 1, 100, 0, 10), 
(@OGUID+47, 1617, 1, 1429.07, -4813.38, 24.6158, 3.76991, 0, 0, -0.951056, 0.309017, 300, 300, 1, 100, 0, 10), 
(@OGUID+48, 1617, 1, -236.168, -5203.23, 20.0912, 5.46288, 0, 0, -0.398748, 0.91706, 300, 300, 1, 100, 0, 10), 
(@OGUID+49, 1617, 1, -1244.33, -5499.28, 5.33197, 1.53589, 0, 0, 0.694658, 0.71934, 300, 300, 1, 100, 0, 10), 
(@OGUID+50, 1617, 1, 92.4622, -4616.65, 49.7868, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 1, 100, 0, 10), 
(@OGUID+51, 1617, 1, 1053.77, -4301.23, 17.4971, 1.27409, 0, 0, 0.594822, 0.803857, 300, 300, 1, 100, 0, 10), 
(@OGUID+52, 1617, 1, 1292.54, -4168.69, 27.7662, 0.226892, 0, 0, 0.113203, 0.993572, 300, 300, 1, 100, 0, 10), 
(@OGUID+53, 1617, 1, -513.956, -4869.19, 35.9926, 6.03884, 0, 0, -0.121869, 0.992546, 300, 300, 1, 100, 0, 10), 
(@OGUID+54, 1617, 1, -410.612, -4662.34, 42.3551, 4.60767, 0, 0, -0.743144, 0.669131, 300, 300, 1, 100, 0, 10), 
(@OGUID+55, 1617, 1, -62.4103, -5153.83, 9.28289, 0.820303, 0, 0, 0.398748, 0.91706, 300, 300, 1, 100, 0, 10), 
(@OGUID+56, 1617, 1, -168.535, -5166.67, 24.9761, 0, 0, 0, 0, 1, 300, 300, 1, 100, 0, 10), 
(@OGUID+57, 1617, 1, -665.786, -5000.42, 24.3445, 4.55531, 0, 0, -0.760406, 0.649449, 300, 300, 1, 100, 0, 10), 
(@OGUID+58, 1617, 1, -836.319, -5351.61, 3.8319, 4.25861, 0, 0, -0.848047, 0.529921, 300, 300, 1, 100, 0, 10), 
(@OGUID+59, 1617, 1, 859.838, -4397.94, 16.4134, 4.57276, 0, 0, -0.754709, 0.656059, 300, 300, 1, 100, 0, 10), 
(@OGUID+60, 1617, 1, -1028.34, -4863.9, 8.51242, 5.5676, 0, 0, -0.350207, 0.936672, 300, 300, 1, 100, 0, 10),
(@OGUID+61, 1617, 1, -801.764, -4569.84, 49.5787, 2.96704, 0, 0, 0.996194, 0.087165, 300, 300, 1, 100, 0, 10),
(@OGUID+62, 1617, 1, -690.432, -5610.89, 26.6571, 2.1293, 0, 0, 0.874619, 0.48481, 300, 300, 1, 100, 0, 10),
(@OGUID+63, 1617, 1, -109.584, -4607.25, 46.3883, 5.34071, 0, 0, -0.45399, 0.891007, 300, 300, 1, 100, 0, 10),
(@OGUID+64, 1617, 1, 101.713, -4080.68, 54.7553, 1.22173, 0, 0, 0.573576, 0.819152, 300, 300, 1, 100, 0, 10),
(@OGUID+65, 1617, 1, 135.734, -4484.05, 36.5378, 6.12611, 0, 0, -0.0784588, 0.996917, 300, 300, 1, 100, 0, 10),
(@OGUID+66, 1617, 1, 794.438, -4269.78, 18.8703, 2.14675, 0, 0, 0.878817, 0.47716, 300, 300, 1, 100, 0, 10);

-- Missing Silverleaf spawns in Loch Modan.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+67, 1617, 0, -4999.76, -2823.31, 323.514, 0.122173, 0, 0, 0.0610485, 0.998135, 300, 300, 1, 100, 0, 10), 
(@OGUID+68, 1617, 0, -5882.55, -2513.38, 307.529, 5.55015, 0, 0, -0.358368, 0.93358, 300, 300, 1, 100, 0, 10), 
(@OGUID+69, 1617, 0, -4916.39, -2793.79, 327.134, 6.16101, 0, 0, -0.0610485, 0.998135, 300, 300, 1, 100, 0, 10), 
(@OGUID+70, 1617, 0, -5156.2, -2807.7, 333.533, 3.63029, 0, 0, -0.970295, 0.241925, 300, 300, 1, 100, 0, 10), 
(@OGUID+71, 1617, 0, -5091.97, -2699.25, 340.265, 1.0472, 0, 0, 0.5, 0.866025, 300, 300, 1, 100, 0, 10), 
(@OGUID+72, 1617, 0, -5120.14, -2750.12, 341.391, 1.93731, 0, 0, 0.824125, 0.566408, 300, 300, 1, 100, 0, 10),
(@OGUID+73, 1617, 0, -5026.91, -2633.13, 328.394, 2.67035, 0, 0, 0.972369, 0.233448, 300, 300, 1, 100, 0, 10);

-- Missing Silverleaf spawns in Westfall.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+74, 1617, 0, -11255.3, 1155.87, 89.0312, 4.59022, 0, 0, -0.748956, 0.66262, 300, 300, 1, 100, 0, 10), 
(@OGUID+75, 1617, 0, -11288, 1559.09, 71.4569, 2.21657, 0, 0, 0.894934, 0.446199, 300, 300, 1, 100, 0, 10), 
(@OGUID+76, 1617, 0, -10995.4, 1965.8, 33.421, 1.0821, 0, 0, 0.515038, 0.857168, 300, 300, 1, 100, 0, 10), 
(@OGUID+77, 1617, 0, -11215.1, 1846.08, 35.4977, 5.63741, 0, 0, -0.317305, 0.948324, 300, 300, 1, 100, 0, 10), 
(@OGUID+78, 1617, 0, -11091.3, 996.767, 35.9869, 1.39626, 0, 0, 0.642787, 0.766045, 300, 300, 1, 100, 0, 10), 
(@OGUID+79, 1617, 0, -11240.1, 1721.31, 37.4474, 6.24828, 0, 0, -0.0174522, 0.999848, 300, 300, 1, 100, 0, 10),
(@OGUID+80, 1617, 0, -10833.7, 1991.96, 35.7367, 5.67232, 0, 0, -0.300705, 0.953717, 300, 300, 1, 100, 0, 10),
(@OGUID+81, 1617, 0, -10515, 1887.26, 38.3548, 4.41568, 0, 0, -0.803857, 0.594823, 300, 300, 1, 100, 0, 10),
(@OGUID+82, 1617, 0, -10306.4, 1783.08, 36.7131, 2.14675, 0, 0, 0.878817, 0.47716, 300, 300, 1, 100, 0, 10),
(@OGUID+83, 1617, 0, -10044.4, 907.009, 30.8313, 5.86431, 0, 0, -0.207911, 0.978148, 300, 300, 1, 100, 0, 10),
(@OGUID+84, 1617, 0, -9804.8, 1572.55, 39.433, 4.39823, 0, 0, -0.809016, 0.587786, 300, 300, 1, 100, 0, 10),
(@OGUID+85, 1617, 0, -9869.6, 879.703, 32.099, 2.42601, 0, 0, 0.936672, 0.350207, 300, 300, 1, 100, 0, 10),
(@OGUID+86, 1617, 0, -11244.6, 1461.82, 89.0313, 0.0523589, 0, 0, 0.0261765, 0.999657, 300, 300, 1, 100, 0, 10);

-- Missing Silverleaf spawns in Tirisfal Glades.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+87, 1617, 0, 2461.71, 1509.31, 34.6506, 3.24635, 0, 0, -0.998629, 0.0523532, 300, 300, 1, 100, 0, 10), 
(@OGUID+88, 1617, 0, 2414.88, 311.561, 37.561, 5.70723, 0, 0, -0.284015, 0.95882, 300, 300, 1, 100, 0, 10), 
(@OGUID+89, 1617, 0, 1857.92, 937.34, 35.2496, 3.7001, 0, 0, -0.961261, 0.27564, 300, 300, 1, 100, 0, 10),
(@OGUID+90, 1617, 0, 1916.41, 989.16, 38.365, 4.13643, 0, 0, -0.878817, 0.47716, 300, 300, 1, 100, 0, 10),
(@OGUID+91, 1617, 0, 2150.32, 860.178, 39.8432, 0.0698117, 0, 0, 0.0348988, 0.999391, 300, 300, 1, 100, 0, 10),
(@OGUID+92, 1617, 0, 2419.32, -705.173, 73.5635, 1.93731, 0, 0, 0.824125, 0.566408, 300, 300, 1, 100, 0, 10),
(@OGUID+93, 1617, 0, 2437.09, 1151.7, 55.2049, 0.523598, 0, 0, 0.258819, 0.965926, 300, 300, 1, 100, 0, 10),
(@OGUID+94, 1617, 0, 2452.44, 592.72, 29.5111, 4.20625, 0, 0, -0.861629, 0.507539, 300, 300, 1, 100, 0, 10),
(@OGUID+95, 1617, 0, 2521.1, 953.773, 90.1524, 4.17134, 0, 0, -0.870356, 0.492424, 300, 300, 1, 100, 0, 10),
(@OGUID+96, 1617, 0, 2570.9, -288.022, 60.1582, 4.92183, 0, 0, -0.62932, 0.777146, 300, 300, 1, 100, 0, 10);

-- Missing Silverleaf spawns in Silverpine.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+97, 1617, 0, 783.538, 1408.73, 59.4719, 4.72984, 0, 0, -0.700909, 0.713251, 300, 300, 1, 100, 0, 10);

-- Missing Silverleaf spawns in Teldrassil.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+98, 1617, 1, 9996.68, 1737.04, 1332.69, 2.68781, 0, 0, 0.97437, 0.224951, 300, 300, 1, 100, 0, 10), 
(@OGUID+99, 1617, 1, 10009.9, 765.828, 1335.19, 1.32645, 0, 0, 0.615661, 0.788011, 300, 300, 1, 100, 0, 10), 
(@OGUID+100, 1617, 1, 9984.57, 455.704, 1310.01, 2.46091, 0, 0, 0.942641, 0.333808, 300, 300, 1, 100, 0, 10), 
(@OGUID+101, 1617, 1, 9624.83, 1133.31, 1270.84, 4.67748, 0, 0, -0.719339, 0.694659, 300, 300, 1, 100, 0, 10), 
(@OGUID+102, 1617, 1, 10025, 1116.06, 1327.89, 3.61284, 0, 0, -0.972369, 0.233448, 300, 300, 1, 100, 0, 10), 
(@OGUID+103, 1617, 1, 10735.3, 1789.88, 1330.76, 1.3439, 0, 0, 0.622514, 0.782609, 300, 300, 1, 100, 0, 10), 
(@OGUID+104, 1617, 1, 9879.13, 1741.48, 1327.47, 5.18363, 0, 0, -0.522498, 0.85264, 300, 300, 1, 100, 0, 10), 
(@OGUID+105, 1617, 1, 10978.3, 1656.53, 1277.51, 4.67748, 0, 0, -0.719339, 0.694659, 300, 300, 1, 100, 0, 10), 
(@OGUID+106, 1617, 1, 10582.4, 1740.16, 1310.47, 2.84488, 0, 0, 0.989016, 0.147811, 300, 300, 1, 100, 0, 10), 
(@OGUID+107, 1617, 1, 9207.54, 1722.69, 1321.77, 3.00195, 0, 0, 0.997563, 0.0697661, 300, 300, 1, 100, 0, 10), 
(@OGUID+108, 1617, 1, 9206.35, 1088.72, 1318.27, 2.75761, 0, 0, 0.981627, 0.190812, 300, 300, 1, 100, 0, 10), 
(@OGUID+109, 1617, 1, 9592.27, 847.689, 1253.86, 3.35105, 0, 0, -0.994521, 0.104536, 300, 300, 1, 100, 0, 10),
(@OGUID+110, 1617, 1, 9776.32, 1165.22, 1281.21, 2.96704, 0, 0, 0.996194, 0.087165, 300, 300, 1, 100, 0, 10),
(@OGUID+111, 1617, 1, 10043.9, 446.943, 1315.5, 0.314158, 0, 0, 0.156434, 0.987688, 300, 300, 1, 100, 0, 10),
(@OGUID+112, 1617, 1, 10451.1, 1962.97, 1319.19, 5.2709, 0, 0, -0.484809, 0.87462, 300, 300, 1, 100, 0, 10),
(@OGUID+113, 1617, 1, 10744.9, 1962.5, 1336.54, 5.44543, 0, 0, -0.406736, 0.913546, 300, 300, 1, 100, 0, 10),
(@OGUID+114, 1617, 1, 10955.1, 1880.54, 1331.02, 2.35619, 0, 0, 0.92388, 0.382683, 300, 300, 1, 100, 0, 10);

-- Missing Silverleaf spawns in Darkshore.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+115, 1617, 1, 7353.12, 119.21, 12.8687, 4.46804, 0, 0, -0.788011, 0.615662, 300, 300, 1, 100, 0, 10), 
(@OGUID+116, 1617, 1, 5744.92, 242.318, 32.4345, 5.2709, 0, 0, -0.484809, 0.87462, 300, 300, 1, 100, 0, 10), 
(@OGUID+117, 1617, 1, 6892.05, 62.8029, 15.7584, 1.48353, 0, 0, 0.67559, 0.737278, 300, 300, 1, 100, 0, 10), 
(@OGUID+118, 1617, 1, 7349.18, -656.249, 25.1487, 4.64258, 0, 0, -0.731354, 0.681998, 300, 300, 1, 100, 0, 10), 
(@OGUID+119, 1617, 1, 6470.91, -113.706, 37.2739, 6.02139, 0, 0, -0.130526, 0.991445, 300, 300, 1, 100, 0, 10), 
(@OGUID+120, 1617, 1, 6062.24, 330.004, 28.136, 1.50098, 0, 0, 0.681998, 0.731354, 300, 300, 1, 100, 0, 10),
(@OGUID+121, 1617, 1, 6535.28, 57.4255, 36.3466, 5.70723, 0, 0, -0.284015, 0.95882, 300, 300, 1, 100, 0, 10),
(@OGUID+122, 1617, 1, 6767.09, -315.66, 40.1223, 3.08918, 0, 0, 0.999657, 0.0262016, 300, 300, 1, 100, 0, 10),
(@OGUID+123, 1617, 1, 7213.49, -925.065, 44.3236, 1.97222, 0, 0, 0.833885, 0.551938, 300, 300, 1, 100, 0, 10);

-- Missing Silverleaf spawns in Mulgore.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+124, 1617, 1, -2575.59, -1052.96, -4.58471, 5.11382, 0, 0, -0.551936, 0.833886, 300, 300, 1, 100, 0, 10), 
(@OGUID+125, 1617, 1, -1521.66, 118.448, -2.23671, 3.45576, 0, 0, -0.987688, 0.156436, 300, 300, 1, 100, 0, 10), 
(@OGUID+126, 1617, 1, -2148.52, -995.82, 18.7485, 0.750491, 0, 0, 0.366501, 0.930418, 300, 300, 1, 100, 0, 10), 
(@OGUID+127, 1617, 1, -2179.04, 291.146, 112.207, 1.16937, 0, 0, 0.551936, 0.833886, 300, 300, 1, 100, 0, 10), 
(@OGUID+128, 1617, 1, -2616.35, 133.657, 56.7859, 0.366518, 0, 0, 0.182235, 0.983255, 300, 300, 1, 100, 0, 10), 
(@OGUID+129, 1617, 1, -2609.36, -1414, 38.187, 2.61799, 0, 0, 0.965925, 0.258821, 300, 300, 1, 100, 0, 10), 
(@OGUID+130, 1617, 1, -1825.77, -366.275, -5.48723, 3.26377, 0, 0, -0.998135, 0.0610518, 300, 300, 1, 100, 0, 10), 
(@OGUID+131, 1617, 1, -2391.54, -1137.76, -4.32129, 2.28638, 0, 0, 0.909961, 0.414694, 300, 300, 1, 100, 0, 10), 
(@OGUID+132, 1617, 1, -2785.56, 172.342, 60.4716, 0.087266, 0, 0, 0.0436192, 0.999048, 300, 300, 1, 100, 0, 10), 
(@OGUID+133, 1617, 1, -1886.51, -627.507, 1.29836, 0.523598, 0, 0, 0.258819, 0.965926, 300, 300, 1, 100, 0, 10), 
(@OGUID+134, 1617, 1, -1952.61, -242.826, -5.01756, 0.802851, 0, 0, 0.390731, 0.920505, 300, 300, 1, 100, 0, 10), 
(@OGUID+135, 1617, 1, -1507.26, -175.414, 35.0973, 0.90757, 0, 0, 0.438371, 0.898794, 300, 300, 1, 100, 0, 10), 
(@OGUID+136, 1617, 1, -2911.91, 228.381, 76.5499, 0.977383, 0, 0, 0.469471, 0.882948, 300, 300, 1, 100, 0, 10), 
(@OGUID+137, 1617, 1, -1299.66, -971.783, 15.8565, 3.38594, 0, 0, -0.992546, 0.12187, 300, 300, 1, 100, 0, 10), 
(@OGUID+138, 1617, 1, -783.408, -737.337, -3.49329, 2.75761, 0, 0, 0.981627, 0.190812, 300, 300, 1, 100, 0, 10), 
(@OGUID+139, 1617, 1, -1664.08, 269.539, 35.6687, 0.104719, 0, 0, 0.0523357, 0.99863, 300, 300, 1, 100, 0, 10), 
(@OGUID+140, 1617, 1, -2725.36, 49.9506, 25.0484, 4.24115, 0, 0, -0.85264, 0.522499, 300, 300, 1, 100, 0, 10), 
(@OGUID+141, 1617, 1, -2195.54, -108.831, -4.78835, 0.471238, 0, 0, 0.233445, 0.97237, 300, 300, 1, 100, 0, 10),
(@OGUID+142, 1617, 1, -1165.96, -981.61, 2.30113, 1.91986, 0, 0, 0.819152, 0.573577, 300, 300, 1, 100, 0, 10),
(@OGUID+143, 1617, 1, -842.82, -351.477, -21.0278, 2.3911, 0, 0, 0.930417, 0.366502, 300, 300, 1, 100, 0, 10);

-- Missing Silverleaf spawns in The Barrens.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+144, 3725, 1, 246.02, -3153.48, 90.0559, 5.16618, 0, 0, -0.529919, 0.848048, 1800, 1800, 1, 100, 0, 10),
(@OGUID+145, 3725, 1, 238.912, -2780.93, 91.7317, 3.59538, 0, 0, -0.97437, 0.224951, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+146, 3725, 1, -427.637, -2486.69, 92.1472, 6.10865, 0, 0, -0.0871553, 0.996195, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+147, 3725, 1, -1200.81, -2142.22, 92.2816, 0.0349062, 0, 0, 0.0174522, 0.999848, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+148, 3725, 1, -1165.9, -2065.73, 92.2977, 3.45576, 0, 0, -0.987688, 0.156436, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+149, 3725, 1, -1110.87, -2153.9, 80.6538, 3.33359, 0, 0, -0.995396, 0.0958512, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+150, 3725, 1, -143.622, -2582.51, 91.6667, 4.60767, 0, 0, -0.743144, 0.669131, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+151, 3725, 1, 426.637, -2819.96, 91.6667, 1.29154, 0, 0, 0.601814, 0.798636, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+152, 3725, 1, 17.3861, -2470.59, 91.6666, 1.55334, 0, 0, 0.700909, 0.713251, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+153, 3725, 1, -464.562, -1585.96, 91.8128, 3.15906, 0, 0, -0.999962, 0.00873464, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+154, 3725, 1, -1032.97, -2624.85, 91.6771, 1.91986, 0, 0, 0.819152, 0.573577, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+155, 3725, 1, -678.948, -2453.02, 91.6667, 1.81514, 0, 0, 0.788011, 0.615662, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+156, 3725, 1, -475.922, -1968.03, 92.3905, 6.14356, 0, 0, -0.0697556, 0.997564, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+157, 3725, 1, 224.484, -3345.04, 46.9378, 5.2709, 0, 0, -0.484809, 0.87462, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+158, 3725, 1, 129.599, -2920.54, 92.4678, 5.02655, 0, 0, -0.587785, 0.809017, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+159, 3725, 1, -798.95, -2859.27, 91.6667, 0.471238, 0, 0, 0.233445, 0.97237, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+160, 3725, 1, 521.076, -3664.99, 27.5696, 3.7001, 0, 0, -0.961261, 0.27564, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+161, 3725, 1, -1157.22, -2283.67, 90.7383, 4.92183, 0, 0, -0.62932, 0.777146, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+162, 3725, 1, -1022.05, -2285.38, 93.5404, 0.541051, 0, 0, 0.267238, 0.963631, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+163, 3725, 1, 549.91, -3523.52, 92.9409, 0.733038, 0, 0, 0.358368, 0.93358, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+164, 3725, 1, -845.504, -2742.02, 91.6667, 0.314158, 0, 0, 0.156434, 0.987688, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+165, 3725, 1, -982.5, -2006.16, 86.159, 5.044, 0, 0, -0.580703, 0.814116, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+166, 3725, 1, 451.24, -3405.39, 91.6825, 0.925024, 0, 0, 0.446198, 0.894935, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+167, 3725, 1, 772.649, -2588.7, 91.6667, 2.70526, 0, 0, 0.976295, 0.216442, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+168, 3725, 1, 750.243, -2392.38, 91.6667, 2.61799, 0, 0, 0.965925, 0.258821, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+169, 3725, 1, 76.1382, -1872.33, 95.6032, 6.17847, 0, 0, -0.0523357, 0.99863, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+170, 3725, 1, 170.062, -1536.42, 91.6666, 4.55531, 0, 0, -0.760406, 0.649449, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+171, 3725, 1, 751.623, -1312.63, 91.6746, 5.53269, 0, 0, -0.366501, 0.930418, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+172, 3725, 1, -223.251, -1997.05, 91.7414, 1.85005, 0, 0, 0.798635, 0.601815, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+173, 3725, 1, -232.117, -2393.37, 91.9164, 4.72984, 0, 0, -0.700909, 0.713251, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+174, 3725, 1, 725.631, -1979.33, 92.0113, 1.50098, 0, 0, 0.681998, 0.731354, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+175, 3725, 1, -553.01, -2704.87, 91.6667, 0.314158, 0, 0, 0.156434, 0.987688, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+176, 3725, 1, -479.275, -2085.67, 91.6667, 4.17134, 0, 0, -0.870356, 0.492424, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+177, 3725, 1, -834.518, -2246.41, 91.6667, 5.70723, 0, 0, -0.284015, 0.95882, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+178, 3725, 1, -27.4418, -2241.91, 91.6667, 0.191985, 0, 0, 0.0958452, 0.995396, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+179, 3725, 1, -1277.7, -2944.47, 93.1849, 2.9845, 0, 0, 0.996917, 0.0784664, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+180, 3725, 1, 467.918, -3003.29, 92.3428, 0.0174525, 0, 0, 0.00872612, 0.999962, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+181, 3725, 1, 536.47, -2433.42, 91.8578, 1.36136, 0, 0, 0.62932, 0.777146, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+182, 3725, 1, 194.273, -2543.79, 91.6667, 4.46804, 0, 0, -0.788011, 0.615662, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+183, 3725, 1, -1020, -2140.87, 82.2547, 4.81711, 0, 0, -0.66913, 0.743145, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+184, 3725, 1, -1093.16, -2022.67, 80.5565, 4.79966, 0, 0, -0.67559, 0.737278, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+185, 3725, 1, -1309.69, -2797.13, 93.3444, 4.90438, 0, 0, -0.636078, 0.771625, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+186, 3725, 1, -902.43, -2082.73, 84.204, 4.72984, 0, 0, -0.700909, 0.713251, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+187, 3725, 1, 103.502, -3434.79, 27.6558, 4.88692, 0, 0, -0.642787, 0.766045, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+188, 3725, 1, -962.656, -2071.39, 81.3033, 4.97419, 0, 0, -0.608761, 0.793354, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+189, 3725, 1, -320.032, -2227.09, 96.3361, 1.39626, 0, 0, 0.642787, 0.766045, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+190, 3725, 1, 390.286, -1557.93, 91.8818, 3.29869, 0, 0, -0.996917, 0.0784664, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+191, 3725, 1, 234.616, -1970.9, 91.6667, 1.83259, 0, 0, 0.793353, 0.608762, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+192, 3725, 1, -1186.96, -3192.73, 91.8396, 5.00909, 0, 0, -0.594823, 0.803857, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+193, 3725, 1, -1170.25, -3005.16, 95.8755, 4.18879, 0, 0, -0.866025, 0.500001, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+194, 3725, 1, -1342.66, -3034.1, 93.1366, 5.13127, 0, 0, -0.544639, 0.838671, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+195, 3725, 1, 547.454, -1394.52, 93.6277, 0.628317, 0, 0, 0.309016, 0.951057, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+196, 3725, 1, -1095.52, -2264.12, 80.967, 3.56047, 0, 0, -0.978148, 0.207912, 1800, 1800, 1, 100, 0, 10), 
(@OGUID+197, 3725, 1, -1571.07, -2898.3, 91.6667, 0.453785, 0, 0, 0.224951, 0.97437, 300, 300, 1, 100, 0, 10),
(@OGUID+198, 3725, 1, -1312.37, -3093.32, 93.212, 4.27606, 0, 0, -0.843391, 0.5373, 300, 300, 1, 100, 0, 10),
(@OGUID+199, 3725, 1, 459.242, -1479.91, 91.7608, 1.20428, 0, 0, 0.566406, 0.824126, 300, 300, 1, 100, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1018, 0, 'Silverleaf', 0, 10), -- Silverleafs in Dun Morogh 54 objects total
(@OGUID+2, 1018, 0, 'Silverleaf', 0, 10), -- Silverleafs in Dun Morogh 54 objects total
(@OGUID+3, 1018, 0, 'Silverleaf', 0, 10), -- Silverleafs in Dun Morogh 54 objects total
(@OGUID+4, 1018, 0, 'Silverleaf', 0, 10), -- Silverleafs in Dun Morogh 54 objects total
(@OGUID+5, 1018, 0, 'Silverleaf', 0, 10), -- Silverleafs in Dun Morogh 54 objects total
(@OGUID+6, 1018, 0, 'Silverleaf', 0, 10), -- Silverleafs in Dun Morogh 54 objects total
(@OGUID+7, 1018, 0, 'Silverleaf', 0, 10), -- Silverleafs in Dun Morogh 54 objects total
(@OGUID+8, 1018, 0, 'Silverleaf', 0, 10), -- Silverleafs in Dun Morogh 54 objects total
(@OGUID+9, 1018, 0, 'Silverleaf', 0, 10), -- Silverleafs in Dun Morogh 54 objects total
(@OGUID+10, 1018, 0, 'Silverleaf', 0, 10), -- Silverleafs in Dun Morogh 54 objects total
(@OGUID+11, 1018, 0, 'Silverleaf', 0, 10), -- Silverleafs in Dun Morogh 54 objects total
(@OGUID+12, 1018, 0, 'Silverleaf', 0, 10), -- Silverleafs in Dun Morogh 54 objects total
(@OGUID+13, 1018, 0, 'Silverleaf', 0, 10), -- Silverleafs in Dun Morogh 54 objects total
(@OGUID+14, 1018, 0, 'Silverleaf', 0, 10), -- Silverleafs in Dun Morogh 54 objects total
(@OGUID+15, 1018, 0, 'Silverleaf', 0, 10), -- Silverleafs in Dun Morogh 54 objects total
(@OGUID+16, 1018, 0, 'Silverleaf', 0, 10), -- Silverleafs in Dun Morogh 54 objects total
(@OGUID+17, 1018, 0, 'Silverleaf', 0, 10), -- Silverleafs in Dun Morogh 54 objects total
(@OGUID+18, 1018, 0, 'Silverleaf', 0, 10), -- Silverleafs in Dun Morogh 54 objects total
(@OGUID+19, 1018, 0, 'Silverleaf', 0, 10), -- Silverleafs in Dun Morogh 54 objects total
(@OGUID+20, 1018, 0, 'Silverleaf', 0, 10), -- Silverleafs in Dun Morogh 54 objects total
(@OGUID+21, 1018, 0, 'Silverleaf', 0, 10), -- Silverleafs in Dun Morogh 54 objects total
(@OGUID+22, 1018, 0, 'Silverleaf', 0, 10), -- Silverleafs in Dun Morogh 54 objects total
(@OGUID+23, 1018, 0, 'Silverleaf', 0, 10), -- Silverleafs in Dun Morogh 54 objects total
(@OGUID+24, 1013, 0, 'Silverleaf', 0, 10), -- Silverleafs in Elwynn Forest 59 objects total
(@OGUID+25, 1013, 0, 'Silverleaf', 0, 10), -- Silverleafs in Elwynn Forest 59 objects total
(@OGUID+26, 1013, 0, 'Silverleaf', 0, 10), -- Silverleafs in Elwynn Forest 59 objects total
(@OGUID+27, 1013, 0, 'Silverleaf', 0, 10), -- Silverleafs in Elwynn Forest 59 objects total
(@OGUID+28, 1013, 0, 'Silverleaf', 0, 10), -- Silverleafs in Elwynn Forest 59 objects total
(@OGUID+29, 1013, 0, 'Silverleaf', 0, 10), -- Silverleafs in Elwynn Forest 59 objects total
(@OGUID+30, 1013, 0, 'Silverleaf', 0, 10), -- Silverleafs in Elwynn Forest 59 objects total
(@OGUID+31, 1013, 0, 'Silverleaf', 0, 10), -- Silverleafs in Elwynn Forest 59 objects total
(@OGUID+32, 1013, 0, 'Silverleaf', 0, 10), -- Silverleafs in Elwynn Forest 59 objects total
(@OGUID+33, 1013, 0, 'Silverleaf', 0, 10), -- Silverleafs in Elwynn Forest 59 objects total
(@OGUID+34, 1013, 0, 'Silverleaf', 0, 10), -- Silverleafs in Elwynn Forest 59 objects total
(@OGUID+35, 1013, 0, 'Silverleaf', 0, 10), -- Silverleafs in Elwynn Forest 59 objects total
(@OGUID+36, 1013, 0, 'Silverleaf', 0, 10), -- Silverleafs in Elwynn Forest 59 objects total
(@OGUID+37, 1013, 0, 'Silverleaf', 0, 10), -- Silverleafs in Elwynn Forest 59 objects total
(@OGUID+38, 1013, 0, 'Silverleaf', 0, 10), -- Silverleafs in Elwynn Forest 59 objects total
(@OGUID+39, 1013, 0, 'Silverleaf', 0, 10), -- Silverleafs in Elwynn Forest 59 objects total
(@OGUID+40, 1022, 0, 'Silverleaf', 0, 10), -- Silverleafs in Durotar 137 objects total
(@OGUID+41, 1022, 0, 'Silverleaf', 0, 10), -- Silverleafs in Durotar 137 objects total
(@OGUID+42, 1022, 0, 'Silverleaf', 0, 10), -- Silverleafs in Durotar 137 objects total
(@OGUID+43, 1022, 0, 'Silverleaf', 0, 10), -- Silverleafs in Durotar 137 objects total
(@OGUID+44, 1022, 0, 'Silverleaf', 0, 10), -- Silverleafs in Durotar 137 objects total
(@OGUID+45, 1022, 0, 'Silverleaf', 0, 10), -- Silverleafs in Durotar 137 objects total
(@OGUID+46, 1022, 0, 'Silverleaf', 0, 10), -- Silverleafs in Durotar 137 objects total
(@OGUID+47, 1022, 0, 'Silverleaf', 0, 10), -- Silverleafs in Durotar 137 objects total
(@OGUID+48, 1022, 0, 'Silverleaf', 0, 10), -- Silverleafs in Durotar 137 objects total
(@OGUID+49, 1022, 0, 'Silverleaf', 0, 10), -- Silverleafs in Durotar 137 objects total
(@OGUID+50, 1022, 0, 'Silverleaf', 0, 10), -- Silverleafs in Durotar 137 objects total
(@OGUID+51, 1022, 0, 'Silverleaf', 0, 10), -- Silverleafs in Durotar 137 objects total
(@OGUID+52, 1022, 0, 'Silverleaf', 0, 10), -- Silverleafs in Durotar 137 objects total
(@OGUID+53, 1022, 0, 'Silverleaf', 0, 10), -- Silverleafs in Durotar 137 objects total
(@OGUID+54, 1022, 0, 'Silverleaf', 0, 10), -- Silverleafs in Durotar 137 objects total
(@OGUID+55, 1022, 0, 'Silverleaf', 0, 10), -- Silverleafs in Durotar 137 objects total
(@OGUID+56, 1022, 0, 'Silverleaf', 0, 10), -- Silverleafs in Durotar 137 objects total
(@OGUID+57, 1022, 0, 'Silverleaf', 0, 10), -- Silverleafs in Durotar 137 objects total
(@OGUID+58, 1022, 0, 'Silverleaf', 0, 10), -- Silverleafs in Durotar 137 objects total
(@OGUID+59, 1022, 0, 'Silverleaf', 0, 10), -- Silverleafs in Durotar 137 objects total
(@OGUID+60, 1022, 0, 'Silverleaf', 0, 10), -- Silverleafs in Durotar 137 objects total
(@OGUID+61, 1022, 0, 'Silverleaf', 0, 10), -- Silverleafs in Durotar 137 objects total
(@OGUID+62, 1022, 0, 'Silverleaf', 0, 10), -- Silverleafs in Durotar 137 objects total
(@OGUID+63, 1022, 0, 'Silverleaf', 0, 10), -- Silverleafs in Durotar 137 objects total
(@OGUID+64, 1022, 0, 'Silverleaf', 0, 10), -- Silverleafs in Durotar 137 objects total
(@OGUID+65, 1022, 0, 'Silverleaf', 0, 10), -- Silverleafs in Durotar 137 objects total
(@OGUID+66, 1022, 0, 'Silverleaf', 0, 10), -- Silverleafs in Durotar 137 objects total
(@OGUID+67, 1162, 0, 'Silverleaf', 0, 10), -- Silverleafs in Loch Modan 77 objects total
(@OGUID+68, 1162, 0, 'Silverleaf', 0, 10), -- Silverleafs in Loch Modan 77 objects total
(@OGUID+69, 1162, 0, 'Silverleaf', 0, 10), -- Silverleafs in Loch Modan 77 objects total
(@OGUID+70, 1162, 0, 'Silverleaf', 0, 10), -- Silverleafs in Loch Modan 77 objects total
(@OGUID+71, 1162, 0, 'Silverleaf', 0, 10), -- Silverleafs in Loch Modan 77 objects total
(@OGUID+72, 1162, 0, 'Silverleaf', 0, 10), -- Silverleafs in Loch Modan 77 objects total
(@OGUID+73, 1162, 0, 'Silverleaf', 0, 10), -- Silverleafs in Loch Modan 77 objects total
(@OGUID+74, 1106, 0, 'Silverleaf', 0, 10), -- Silverleafs in Westfall 23 objects total
(@OGUID+75, 1106, 0, 'Silverleaf', 0, 10), -- Silverleafs in Westfall 23 objects total
(@OGUID+76, 1106, 0, 'Silverleaf', 0, 10), -- Silverleafs in Westfall 23 objects total
(@OGUID+77, 1106, 0, 'Silverleaf', 0, 10), -- Silverleafs in Westfall 23 objects total
(@OGUID+78, 1106, 0, 'Silverleaf', 0, 10), -- Silverleafs in Westfall 23 objects total
(@OGUID+79, 1106, 0, 'Silverleaf', 0, 10), -- Silverleafs in Westfall 23 objects total
(@OGUID+80, 1106, 0, 'Silverleaf', 0, 10), -- Silverleafs in Westfall 23 objects total
(@OGUID+81, 1106, 0, 'Silverleaf', 0, 10), -- Silverleafs in Westfall 23 objects total
(@OGUID+82, 1106, 0, 'Silverleaf', 0, 10), -- Silverleafs in Westfall 23 objects total
(@OGUID+83, 1106, 0, 'Silverleaf', 0, 10), -- Silverleafs in Westfall 23 objects total
(@OGUID+84, 1106, 0, 'Silverleaf', 0, 10), -- Silverleafs in Westfall 23 objects total
(@OGUID+85, 1106, 0, 'Silverleaf', 0, 10), -- Silverleafs in Westfall 23 objects total
(@OGUID+86, 1106, 0, 'Silverleaf', 0, 10), -- Silverleafs in Westfall 23 objects total
(@OGUID+87, 1007, 0, 'Silverleaf', 0, 10), -- Silverleafs in Tirisfal 69 objects total
(@OGUID+88, 1007, 0, 'Silverleaf', 0, 10), -- Silverleafs in Tirisfal 69 objects total
(@OGUID+89, 1007, 0, 'Silverleaf', 0, 10), -- Silverleafs in Tirisfal 69 objects total
(@OGUID+90, 1007, 0, 'Silverleaf', 0, 10), -- Silverleafs in Tirisfal 69 objects total
(@OGUID+91, 1007, 0, 'Silverleaf', 0, 10), -- Silverleafs in Tirisfal 69 objects total
(@OGUID+92, 1007, 0, 'Silverleaf', 0, 10), -- Silverleafs in Tirisfal 69 objects total
(@OGUID+93, 1007, 0, 'Silverleaf', 0, 10), -- Silverleafs in Tirisfal 69 objects total
(@OGUID+94, 1007, 0, 'Silverleaf', 0, 10), -- Silverleafs in Tirisfal 69 objects total
(@OGUID+95, 1007, 0, 'Silverleaf', 0, 10), -- Silverleafs in Tirisfal 69 objects total
(@OGUID+96, 1007, 0, 'Silverleaf', 0, 10), -- Silverleafs in Tirisfal 69 objects total
(@OGUID+97, 1042, 0, 'Silverleaf', 0, 10), -- Silverleafs in Silverpine 69 objects total
(@OGUID+98, 1003, 0, 'Silverleaf', 0, 10), -- Silverleafs in Teldrassil 44 objects total
(@OGUID+99, 1003, 0, 'Silverleaf', 0, 10), -- Silverleafs in Teldrassil 44 objects total
(@OGUID+100, 1003, 0, 'Silverleaf', 0, 10), -- Silverleafs in Teldrassil 44 objects total
(@OGUID+101, 1003, 0, 'Silverleaf', 0, 10), -- Silverleafs in Teldrassil 44 objects total
(@OGUID+102, 1003, 0, 'Silverleaf', 0, 10), -- Silverleafs in Teldrassil 44 objects total
(@OGUID+103, 1003, 0, 'Silverleaf', 0, 10), -- Silverleafs in Teldrassil 44 objects total
(@OGUID+104, 1003, 0, 'Silverleaf', 0, 10), -- Silverleafs in Teldrassil 44 objects total
(@OGUID+105, 1003, 0, 'Silverleaf', 0, 10), -- Silverleafs in Teldrassil 44 objects total
(@OGUID+106, 1003, 0, 'Silverleaf', 0, 10), -- Silverleafs in Teldrassil 44 objects total
(@OGUID+107, 1003, 0, 'Silverleaf', 0, 10), -- Silverleafs in Teldrassil 44 objects total
(@OGUID+108, 1003, 0, 'Silverleaf', 0, 10), -- Silverleafs in Teldrassil 44 objects total
(@OGUID+109, 1003, 0, 'Silverleaf', 0, 10), -- Silverleafs in Teldrassil 44 objects total
(@OGUID+110, 1003, 0, 'Silverleaf', 0, 10), -- Silverleafs in Teldrassil 44 objects total
(@OGUID+111, 1003, 0, 'Silverleaf', 0, 10), -- Silverleafs in Teldrassil 44 objects total
(@OGUID+112, 1003, 0, 'Silverleaf', 0, 10), -- Silverleafs in Teldrassil 44 objects total
(@OGUID+113, 1003, 0, 'Silverleaf', 0, 10), -- Silverleafs in Teldrassil 44 objects total
(@OGUID+114, 1003, 0, 'Silverleaf', 0, 10), -- Silverleafs in Teldrassil 44 objects total
(@OGUID+115, 1095, 0, 'Silverleaf', 0, 10), -- Silverleafs in Darkshore 64 objects total
(@OGUID+116, 1095, 0, 'Silverleaf', 0, 10), -- Silverleafs in Darkshore 64 objects total
(@OGUID+117, 1095, 0, 'Silverleaf', 0, 10), -- Silverleafs in Darkshore 64 objects total
(@OGUID+118, 1095, 0, 'Silverleaf', 0, 10), -- Silverleafs in Darkshore 64 objects total
(@OGUID+119, 1095, 0, 'Silverleaf', 0, 10), -- Silverleafs in Darkshore 64 objects total
(@OGUID+120, 1095, 0, 'Silverleaf', 0, 10), -- Silverleafs in Darkshore 64 objects total
(@OGUID+121, 1095, 0, 'Silverleaf', 0, 10), -- Silverleafs in Darkshore 64 objects total
(@OGUID+122, 1095, 0, 'Silverleaf', 0, 10), -- Silverleafs in Darkshore 64 objects total
(@OGUID+123, 1095, 0, 'Silverleaf', 0, 10), -- Silverleafs in Darkshore 64 objects total
(@OGUID+124, 1027, 0, 'Silverleaf', 0, 10), -- Silverleafs in Mulgore 73 objects total
(@OGUID+125, 1027, 0, 'Silverleaf', 0, 10), -- Silverleafs in Mulgore 73 objects total
(@OGUID+126, 1027, 0, 'Silverleaf', 0, 10), -- Silverleafs in Mulgore 73 objects total
(@OGUID+127, 1027, 0, 'Silverleaf', 0, 10), -- Silverleafs in Mulgore 73 objects total
(@OGUID+128, 1027, 0, 'Silverleaf', 0, 10), -- Silverleafs in Mulgore 73 objects total
(@OGUID+129, 1027, 0, 'Silverleaf', 0, 10), -- Silverleafs in Mulgore 73 objects total
(@OGUID+130, 1027, 0, 'Silverleaf', 0, 10), -- Silverleafs in Mulgore 73 objects total
(@OGUID+131, 1027, 0, 'Silverleaf', 0, 10), -- Silverleafs in Mulgore 73 objects total
(@OGUID+132, 1027, 0, 'Silverleaf', 0, 10), -- Silverleafs in Mulgore 73 objects total
(@OGUID+133, 1027, 0, 'Silverleaf', 0, 10), -- Silverleafs in Mulgore 73 objects total
(@OGUID+134, 1027, 0, 'Silverleaf', 0, 10), -- Silverleafs in Mulgore 73 objects total
(@OGUID+135, 1027, 0, 'Silverleaf', 0, 10), -- Silverleafs in Mulgore 73 objects total
(@OGUID+136, 1027, 0, 'Silverleaf', 0, 10), -- Silverleafs in Mulgore 73 objects total
(@OGUID+137, 1027, 0, 'Silverleaf', 0, 10), -- Silverleafs in Mulgore 73 objects total
(@OGUID+138, 1027, 0, 'Silverleaf', 0, 10), -- Silverleafs in Mulgore 73 objects total
(@OGUID+139, 1027, 0, 'Silverleaf', 0, 10), -- Silverleafs in Mulgore 73 objects total
(@OGUID+140, 1027, 0, 'Silverleaf', 0, 10), -- Silverleafs in Mulgore 73 objects total
(@OGUID+141, 1027, 0, 'Silverleaf', 0, 10), -- Silverleafs in Mulgore 73 objects total
(@OGUID+142, 1027, 0, 'Silverleaf', 0, 10), -- Silverleafs in Mulgore 73 objects total
(@OGUID+143, 1027, 0, 'Silverleaf', 0, 10), -- Silverleafs in Mulgore 73 objects total
(@OGUID+144, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+145, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+146, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+147, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+148, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+149, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+150, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+151, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+152, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+153, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+154, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+155, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+156, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+157, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+158, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+159, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+160, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+161, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+162, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+163, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+164, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+165, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+166, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+167, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+168, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+169, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+170, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+171, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+172, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+173, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+174, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+175, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+176, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+177, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+178, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+179, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+180, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+181, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+182, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+183, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+184, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+185, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+186, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+187, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+188, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+189, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+190, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+191, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+192, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+193, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+194, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+195, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+196, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+197, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+198, 1031, 0, 'Silverleaf', 0, 10), -- Silverleafs in The Barrens
(@OGUID+199, 1031, 0, 'Silverleaf', 0, 10); -- Silverleafs in The Barrens

-- Correct Pools
UPDATE `pool_template` SET `description`='Silverleaf in Darkshore' WHERE  `entry`=1095;
UPDATE `pool_template` SET `description`='Silverleaf in Dun Morogh' WHERE  `entry`=1018;
UPDATE `pool_template` SET `description`='Silverleaf in Durotar' WHERE  `entry`=1022;
UPDATE `pool_template` SET `description`='Silverleaf in Elwynn Forest' WHERE  `entry`=1013;
UPDATE `pool_template` SET `description`='Silverleaf in Loch Modan' WHERE  `entry`=1162;
UPDATE `pool_template` SET `description`='Silverleaf in Mulgore' WHERE  `entry`=1027;
UPDATE `pool_template` SET `description`='Silverleaf in Silverpine Forest' WHERE  `entry`=1042;
UPDATE `pool_template` SET `description`='Silverleaf in Teldrassil' WHERE  `entry`=1003;
UPDATE `pool_template` SET `description`='Silverleaf in Barrens' WHERE  `entry`=1031;
UPDATE `pool_template` SET `description`='Silverleaf in Tirisfal' WHERE  `entry`=1007;
UPDATE `pool_template` SET `description`='Silverleaf in Westfall' WHERE  `entry`=1106;

-- Remove Custom Spawns (Non of these spawns exist in the sniff-db)
DELETE FROM `gameobject` WHERE `guid` IN (33610, 32747, 901, 1199, 469, 1096, 1117, 525, 645, 1265, 634, 631, 644, 992, 663, 458, 462, 466, 473, 478, 482, 484, 486, 488, 489, 490, 493, 494, 495, 496, 497, 498, 499, 504, 505, 506, 507, 511, 514, 518, 519, 520, 521, 523, 528, 530, 532, 533, 537, 538, 539, 540, 542, 546, 549, 550, 551, 552, 555, 561, 562, 566, 577, 578, 579, 585, 589, 591, 593, 597, 598, 599, 602, 604, 605, 606, 609, 616, 620, 623, 625, 630, 632, 642, 650, 651, 652, 653, 654, 655, 656, 659, 661, 662, 667, 671, 681, 684, 685, 686, 687, 696, 700, 704, 705, 709, 710, 712, 714, 715, 716, 721, 723, 729, 730, 731, 739, 744, 745, 752, 754, 764, 765, 769, 770, 771, 772, 775, 781, 782, 784, 785, 789, 795, 812, 817, 818, 819, 824, 831, 834, 844, 847, 850, 851, 852, 855, 857, 858, 869, 878, 879, 881, 882, 883, 884, 885, 886, 887, 888, 889, 890, 891, 892, 893, 896, 902, 903, 904, 905, 906, 907, 908, 909, 910, 913, 917, 923, 927, 928, 929, 932, 935, 939, 942, 943, 944, 945, 946, 947, 950, 955, 956, 957, 958, 959, 966, 972, 974, 975, 976, 979, 982, 983, 990, 994, 996, 998, 1000, 1002, 1003, 1004, 1005, 1006, 1007, 1011, 1013, 1024, 1026, 1030, 1032, 1034, 1039, 1040, 1051, 1052, 1053, 1054, 1055, 1058, 1063, 1064, 1065, 1066, 1078, 1082, 1085, 1086, 1087, 1088, 1089, 1092, 1100, 1105, 1106, 1107, 1115, 1116, 1130, 1131, 1133, 1138, 1139, 1141, 1146, 1147, 1149, 1150, 1153, 1158, 1159, 1161, 1166, 1168, 1169, 1170, 1178, 1180, 1183, 1184, 1185, 1186, 1193, 1197, 1198, 1213, 1218, 1221, 1228, 1230, 1232, 1233, 1234, 1248, 1253, 1255, 1256, 1257, 1258, 1259, 1262, 1264, 12583, 12523);
DELETE FROM `pool_gameobject` WHERE `guid` IN (33610, 32747, 901, 1199, 469, 1096, 1117, 525, 645, 1265, 634, 631, 644, 992, 663, 458, 462, 466, 473, 478, 482, 484, 486, 488, 489, 490, 493, 494, 495, 496, 497, 498, 499, 504, 505, 506, 507, 511, 514, 518, 519, 520, 521, 523, 528, 530, 532, 533, 537, 538, 539, 540, 542, 546, 549, 550, 551, 552, 555, 561, 562, 566, 577, 578, 579, 585, 589, 591, 593, 597, 598, 599, 602, 604, 605, 606, 609, 616, 620, 623, 625, 630, 632, 642, 650, 651, 652, 653, 654, 655, 656, 659, 661, 662, 667, 671, 681, 684, 685, 686, 687, 696, 700, 704, 705, 709, 710, 712, 714, 715, 716, 721, 723, 729, 730, 731, 739, 744, 745, 752, 754, 764, 765, 769, 770, 771, 772, 775, 781, 782, 784, 785, 789, 795, 812, 817, 818, 819, 824, 831, 834, 844, 847, 850, 851, 852, 855, 857, 858, 869, 878, 879, 881, 882, 883, 884, 885, 886, 887, 888, 889, 890, 891, 892, 893, 896, 902, 903, 904, 905, 906, 907, 908, 909, 910, 913, 917, 923, 927, 928, 929, 932, 935, 939, 942, 943, 944, 945, 946, 947, 950, 955, 956, 957, 958, 959, 966, 972, 974, 975, 976, 979, 982, 983, 990, 994, 996, 998, 1000, 1002, 1003, 1004, 1005, 1006, 1007, 1011, 1013, 1024, 1026, 1030, 1032, 1034, 1039, 1040, 1051, 1052, 1053, 1054, 1055, 1058, 1063, 1064, 1065, 1066, 1078, 1082, 1085, 1086, 1087, 1088, 1089, 1092, 1100, 1105, 1106, 1107, 1115, 1116, 1130, 1131, 1133, 1138, 1139, 1141, 1146, 1147, 1149, 1150, 1153, 1158, 1159, 1161, 1166, 1168, 1169, 1170, 1178, 1180, 1183, 1184, 1185, 1186, 1193, 1197, 1198, 1213, 1218, 1221, 1228, 1230, 1232, 1233, 1234, 1248, 1253, 1255, 1256, 1257, 1258, 1259, 1262, 1264, 12583, 12523);

-- Sync Gobject Data
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300, `spawn_flags` = 0, `animprogress` = 100 WHERE `id` IN (3725, 1617);

-- Update Counters
UPDATE `pool_template` SET `max_limit`=15 WHERE  `entry`=1106;
UPDATE `pool_template` SET `max_limit`=14 WHERE  `entry`=1095;
UPDATE `pool_template` SET `max_limit`=16 WHERE  `entry`=1162;
UPDATE `pool_template` SET `max_limit`=23 WHERE  `entry`=1042;
UPDATE `pool_template` SET `max_limit`=27 WHERE  `entry`=1031;
UPDATE `pool_template` SET `max_limit`=37 WHERE  `entry`=1027;
UPDATE `pool_template` SET `max_limit`=32 WHERE  `entry`=1022;
UPDATE `pool_template` SET `max_limit`=29 WHERE  `entry`=1003;
UPDATE `pool_template` SET `max_limit`=40 WHERE  `entry`=1007;
UPDATE `pool_template` SET `max_limit`=40 WHERE  `entry`=1013;
UPDATE `pool_template` SET `max_limit`=36 WHERE  `entry`=1018;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
