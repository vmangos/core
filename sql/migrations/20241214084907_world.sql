DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20241214084907');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20241214084907');
-- Add your query below.


-- Dun Morogh
UPDATE `pool_template` SET `max_limit` = 36 WHERE `entry` = 1019; -- Copper Veins - Dun Morogh
UPDATE `pool_template` SET `max_limit` = 25 WHERE `entry` = 1018; -- Silverleaf in Dun Morogh
UPDATE `pool_template` SET `max_limit` = 25 WHERE `entry` = 1017; -- Peacebloom in Dun Morogh
UPDATE `pool_template` SET `max_limit` = 16 WHERE `entry` = 1016; -- Earthroot in Dun Morogh

-- Western Plaguelands
UPDATE `pool_template` SET `max_limit` = 8 WHERE `entry` = 1258; -- Plaguebloom in Western Plaguelands
UPDATE `pool_template` SET `max_limit` = 6 WHERE `entry` = 1259; -- Arthas Tears in Western Plaguelands
UPDATE `pool_template` SET `max_limit` = 3 WHERE `entry` = 1261; -- Sungrass in Western Plaguelands
UPDATE `pool_template` SET `max_limit` = 4 WHERE `entry` = 1260; -- Dreamfoil in Western Plaguelands
UPDATE `pool_template` SET `max_limit` = 3 WHERE `entry` = 402; -- Mountain Silversage in Western Plaguelands
UPDATE `pool_template` SET `max_limit` = 5 WHERE `entry` = 1271; -- Western Plaguelands - Mithril Deposits / Gold Veins / Truesilver Deposits (Master Pool)
UPDATE `pool_template` SET `max_limit` = 3 WHERE `entry` = 1262; -- Western Plaguelands - Truesilver Deposits / Small Thorium Veins (Master Pool)
UPDATE `pool_template` SET `max_limit` = 2 WHERE `entry` = 1331; -- Western Plaguelands - Truesilver Deposits / Rich Thorium Veins (Master Pool)

-- Eastern Plaguelands
UPDATE `pool_template` SET `max_limit` = 15 WHERE `entry`=1265; -- Plaguebloom in Eastern Plaguelands
UPDATE `pool_template` SET `max_limit` = 3 WHERE `entry`=1267; -- Dreamfoil in Eastern Plaguelands
UPDATE `pool_template` SET `max_limit` = 7 WHERE `entry`=1266; -- Arthas Tears in Eastern Plaguelands
UPDATE `pool_template` SET `max_limit` = 3 WHERE `entry`=1269; -- Mountain Silversage in Eastern Plaguelands
UPDATE `pool_template` SET `max_limit` = 3 WHERE `entry`=1320; -- Sungrass in Eastern Plaguelands
UPDATE `pool_template` SET `max_limit` = 3 WHERE `entry`=1268; -- Golden Sansam in Eastern Plaguelands
UPDATE `pool_template` SET `max_limit` = 8 WHERE `entry` = 325; -- Eastern Plaguelands - Truesilver Deposits / Rich Thorium Veins (Master Pool)
UPDATE `pool_template` SET `max_limit` = 5 WHERE `entry` = 1264; -- Eastern Plaguelands - Truesilver Deposits / Small Thorium Veins (Master Pool)
UPDATE `pool_template` SET `max_limit` = 3 WHERE `entry` = 1263; -- Eastern Plaguelands - Mithril Deposits / Gold Veins / Truesilver Deposits (Master Pool)

-- Burning Steppes
UPDATE `pool_template` SET `max_limit` = 5 WHERE `entry` = 1302; -- Mountain Silversage in Burning Steppes
UPDATE `pool_template` SET `max_limit` = 4 WHERE `entry` = 1301; -- Dreamfoil in Burning Steppes
UPDATE `pool_template` SET `max_limit` = 2 WHERE `entry` = 1300; -- Golden Sansam in Burning Steppes
UPDATE `pool_template` SET `max_limit` = 2 WHERE `entry` = 1303; -- Sungrass in Burning Steppes
UPDATE `pool_template` SET `max_limit` = 2 WHERE `entry` = 1297; -- Burning Steppes - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein (Master Pool)
UPDATE `pool_template` SET `max_limit` = 4 WHERE `entry` = 1296; -- Burning Steppes - Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein (Master Pool)
UPDATE `pool_template` SET `max_limit` = 10 WHERE `entry` = 1299; -- Burning Steppes - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit (Master Pool)

-- Winterspring
UPDATE `pool_template` SET `max_limit` = 20 WHERE `entry` = 1236; -- Icecap in Winterspring
UPDATE `pool_template` SET `max_limit` = 8 WHERE `entry` = 1237; -- Mountain Silversage in Winterspring
UPDATE `pool_template` SET `max_limit` = 5 WHERE `entry` = 1234; -- Winterspring - Gold Vein / Mithril Deposit / Truesilver Deposit (Master Pool)
UPDATE `pool_template` SET `max_limit` = 8 WHERE `entry` = 1233; -- Winterspring - Truesilver Deposit / Small Thorium Vein (Master Pool)
UPDATE `pool_template` SET `max_limit` = 8 WHERE `entry` = 1235; -- Winterspring - Truesilver Deposit / Rich Thorium Vein (Master Pool)

-- Felwood
UPDATE `pool_template` SET `max_limit` = 5 WHERE `entry` = 1227; -- Plaguebloom in Felwood
UPDATE `pool_template` SET `max_limit` = 4 WHERE `entry` = 1228; -- Dreamfoil in Felwood
UPDATE `pool_template` SET `max_limit` = 5 WHERE `entry` = 1225; -- Gromsblood in Felwood
UPDATE `pool_template` SET `max_limit` = 4 WHERE `entry` = 1226; -- Arthas Tears in Felwood
UPDATE `pool_template` SET `max_limit` = 3 WHERE `entry` = 401; -- Mountain Silversage in Felwood
UPDATE `pool_template` SET `max_limit` = 4 WHERE `entry` = 1230; -- Golden Sansam in Felwood
UPDATE `pool_template` SET `max_limit` = 3 WHERE `entry` = 1229; -- Sungrass in Felwood
UPDATE `pool_template` SET `max_limit` = 8 WHERE `entry` = 1232; -- Felwood - Truesilver Deposit / Small Thorium Vein (Master Pool)
UPDATE `pool_template` SET `max_limit` = 8 WHERE `entry` = 328; -- Felwood - Gold Vein / Mithril Deposit / Truesilver Deposit (Master Pool)

-- Tirisfal Glades
UPDATE `pool_template` SET `max_limit` = 32 WHERE `entry` = 1008; -- Copper Veins - Tirisfal Glades
UPDATE `pool_template` SET `max_limit` = 25 WHERE `entry` = 1007; -- Silverleaf in Tirisfal
UPDATE `pool_template` SET `max_limit` = 25 WHERE `entry` = 1006; -- Peacebloom in Tirisfal
UPDATE `pool_template` SET `max_limit` = 16 WHERE `entry` = 1005; -- Earthroot in Tirisfal

-- Silithus
UPDATE `pool_template` SET `max_limit` = 5 WHERE `entry` = 1220; -- Silithus - Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein (Master Pool)
UPDATE `pool_template` SET `max_limit` = 8 WHERE `entry` = 1219; -- Silithus - Truesilver Deposit / Small Thorium Vein (Master Pool)
UPDATE `pool_template` SET `max_limit` = 6 WHERE `entry` = 1222; -- Mountain Silversage in Silithus
UPDATE `pool_template` SET `max_limit` = 4 WHERE `entry` = 1221; -- Dreamfoil in Silithus

-- Elwynn Forest
UPDATE `pool_template` SET `max_limit` = 32 WHERE `entry` = 1015; -- Copper Veins - Elwynn Forest
UPDATE `pool_template` SET `max_limit` = 26 WHERE `entry` = 1013; -- Silverleaf in Elwynn Forest
UPDATE `pool_template` SET `max_limit` = 11 WHERE `entry` = 1011; -- Earthroot in Elwynn Forest

-- Loch Modan
UPDATE `pool_template` SET `max_limit`= 34 WHERE `entry` = 1166; -- Copper Veins - Loch Modan
UPDATE `pool_template` SET `max_limit`= 12 WHERE `entry` = 1186; -- Loch Modan - Tin Vein / Silver Vein (Master Pool)
UPDATE `pool_template` SET `max_limit`= 7 WHERE `entry` = 1163; -- Mageroyal in Loch Modan
UPDATE `pool_template` SET `max_limit`= 7 WHERE `entry` = 1165; -- Briarthorn in Loch Modan
UPDATE `pool_template` SET `max_limit`= 13 WHERE `entry` = 1162; -- Silverleaf in Loch Modan
UPDATE `pool_template` SET `max_limit`= 7 WHERE `entry` = 1161; -- Peacebloom in Loch Modan
UPDATE `pool_template` SET `max_limit`= 5 WHERE `entry` = 1160; -- Earthroot in Loch Modan

-- ungoro
UPDATE `pool_template` SET `max_limit` = 8 WHERE `entry` = 1212; -- Dreamfoil in Ungoro Crater
UPDATE `pool_template` SET `max_limit` = 8 WHERE `entry` = 1218; -- Mountain Silversage in Ungoro Crater
UPDATE `pool_template` SET `max_limit` = 8 WHERE `entry` = 1214; -- Golden Sansam in Ungoro
UPDATE `pool_template` SET `max_limit` = 8 WHERE `entry` = 1215; -- Sungrass in Ungoro Crater
UPDATE `pool_template` SET `max_limit` = 3 WHERE `entry` = 1216; -- Blindweed in Ungoro
UPDATE `pool_template` SET `max_limit` = 9 WHERE `entry` = 1211; -- Un'Goro Crater - Truesilver Deposit / Small Thorium Vein (Master Pool)
UPDATE `pool_template` SET `max_limit` = 5 WHERE `entry` = 1210; -- Un'Goro Crater - Gold Vein / Mithril Deposit / Truesilver Deposit (Master Pool)
UPDATE `pool_template` SET `max_limit` = 2 WHERE `entry` = 1217; -- Un'Goro Crater - Truesilver Deposit / Rich Thorium Vein (Master Pool)
UPDATE `pool_template` SET `max_limit` = 2 WHERE `entry` = 412; -- Un'Goro Crater - Ooze Covered Truesilver Deposit / Ooze Covered Thorium Vein (Master Pool)

-- Feralas
UPDATE `pool_template` SET `max_limit` = 4 WHERE `entry` = 1196; -- Feralas - Silver Vein / Gold Vein / Iron Deposit (Master Pool)
UPDATE `pool_template` SET `max_limit` = 1 WHERE `entry` = 1197; -- Feralas - Mithril Deposit / Truesilver Deposit (Master Pool)
UPDATE `pool_template` SET `max_limit` = 2 WHERE `entry` = 985; -- Feralas - Truesilver Deposit / Small Thorium Vein (Master Pool)
UPDATE `pool_template` SET `max_limit` = 3 WHERE `entry` = 1198; -- Feralas - Ooze Covered Gold Vein / Ooze Covered Mithril Deposit / Ooze Covered Truesilver Deposit (Master Pool)
UPDATE `pool_template` SET `max_limit` = 1 WHERE `entry` = 413; -- Feralas - Ooze Covered Truesilver Deposit / Ooze Covered Thorium Vein (Master Pool)
UPDATE `pool_template` SET `max_limit` = 8 WHERE `entry` = 1357; -- Feralas - Gold Vein / Mithril Deposit (Master Pool)
UPDATE `pool_template` SET `max_limit` = 19 WHERE `entry` = 1192; -- Sungrass in Feralas
UPDATE `pool_template` SET `max_limit` = 18 WHERE `entry` = 1191; -- Goldthorn in Feralas
UPDATE `pool_template` SET `max_limit` = 15 WHERE `entry` = 1189; -- Khadgars Whisker in Feralas
UPDATE `pool_template` SET `max_limit` = 14 WHERE `entry` = 1324; -- Purple Lotus in Feralas
UPDATE `pool_template` SET `max_limit` = 4 WHERE `entry` = 1190 AND `patch_min`=5 AND `patch_max`=10; -- Stranglekelp in Feralas
UPDATE `pool_template` SET `max_limit` = 4 WHERE `entry` = 1194; -- Golden Sansam in Feralas

-- Durotar
UPDATE `pool_template` SET `max_limit` = 29 WHERE `entry` = 1024; -- Copper Veins - Durotar
UPDATE `pool_template` SET `max_limit` = 22 WHERE `entry` = 1022; -- Silverleaf in Durotar
UPDATE `pool_template` SET `max_limit` = 20 WHERE `entry` = 1020; -- Peacebloom in Durotar
UPDATE `pool_template` SET `max_limit` = 11 WHERE `entry` = 1021; -- Earthroot in Durotar
UPDATE `pool_template` SET `max_limit` = 1 WHERE `entry` = 1023; -- Mageroyal in Durotar

-- Mulgore
UPDATE `pool_template` SET `max_limit` = 32 WHERE `entry` = 1028; -- Copper Veins - Mulgore
UPDATE `pool_template` SET `max_limit` = 26 WHERE `entry` = 1027; -- Silverleaf in Mulgore
UPDATE `pool_template` SET `max_limit` = 23 WHERE `entry` = 1026; -- Peacebloom in Mulgore
UPDATE `pool_template` SET `max_limit` = 11 WHERE `entry` = 1025; -- Earthroot in Mulgore

-- Teldrassil
UPDATE `pool_template` SET `max_limit` = 23 WHERE `entry` = 1003; -- Silverleaf in Teldrassil
UPDATE `pool_template` SET `max_limit` = 21 WHERE `entry` = 1002; -- Peacebloom in Teldrassil
UPDATE `pool_template` SET `max_limit` = 9 WHERE `entry` = 1001; -- Earthroot in Teldrassil

-- Thousand Needles
UPDATE `pool_template` SET `max_limit` = 6 WHERE `entry`=1133; -- Bruiseweed in Thousand Needles
UPDATE `pool_template` SET `max_limit` = 2 WHERE `entry`=2586; -- Mithril Deposits - Thousand Needles
UPDATE `pool_template` SET `max_limit` = 6 WHERE `entry`=1136; -- Kingsblood in Thousand Needles
UPDATE `pool_template` SET `max_limit` = 5 WHERE `entry`=1134; -- Wild Steelbloom in Thousand Needles
UPDATE `pool_template` SET `max_limit` = 11 WHERE `entry`=1131; -- Thousand Needles - Tin Vein / Silver Vein (Master Pool)
UPDATE `pool_template` SET `max_limit` = 14 WHERE `entry`=1132; -- Thousand Needles - Gold Vein / Iron Deposit (Master Pool)
UPDATE `pool_template` SET `max_limit` = 11 WHERE `entry`=2585; -- Copper Veins - Thousand Needles
UPDATE `pool_template` SET `max_limit` = 2 WHERE `entry`=304; -- Thousand Needles - Ooze Covered Silver Vein / Ooze Covered Gold Vein / Ooze Covered Mithril Deposit (Master Pool)
UPDATE `pool_template` SET `max_limit` = 3 WHERE `entry`=329; -- Thousand Needles - Silver Vein / Gold Vein / Iron Deposit (Master Pool)

-- Blasted Lands
UPDATE `pool_template` SET `max_limit` = 6 WHERE `entry` = 1275; -- Gromsblood in Blasted Lands
UPDATE `pool_template` SET `max_limit` = 5 WHERE `entry` = 1276; -- Firebloom in Blasted Lands
UPDATE `pool_template` SET `max_limit` = 5 WHERE `entry` = 1277; -- Sungrass in Blasted Lands
UPDATE `pool_template` SET `max_limit` = 7 WHERE `entry` = 1359; -- Blasted Lands - Truesilver Deposit / Small Thorium Vein (Master Pool)
UPDATE `pool_template` SET `max_limit` = 7 WHERE `entry` = 1279; -- Blasted Lands - Gold Vein / Mithril Deposit (Master Pool)
UPDATE `pool_template` SET `max_limit` = 2 WHERE `entry` = 3956; -- Blasted Lands - Garrison Armory - Gold Vein / Mithril Deposit (Master Pool)
UPDATE `pool_template` SET `max_limit` = 1 WHERE `entry` = 4345; -- Blasted Lands - Garrison Armory - Truesilver Deposit / Small Thorium Vein (Master Pool)
UPDATE `pool_template` SET `max_limit` = 1 WHERE `entry` = 4250; -- Blasted Lands - Garrison Armory - Gold Vein / Mithril Deposit / Truesilver Deposit (Master Pool)
UPDATE `pool_template` SET `max_limit` = 1 WHERE `entry` = 1280; -- Blasted Lands - Gold Vein / Mithril Deposit / Truesilver Deposit / Small Thorium Vein (Master Pool)

-- Swamp of Sorrows
UPDATE `pool_template` SET `max_limit` = 15 WHERE `entry`=1307; -- Blindweed in Swamp of Sorrows
UPDATE `pool_template` SET `max_limit` = 7 WHERE `entry`=1317; -- Liferoot in Swamp of Sorrows
UPDATE `pool_template` SET `max_limit` = 5 WHERE `entry`=1313; -- Goldthorn in Swamp of Sorrows
UPDATE `pool_template` SET `max_limit` = 6 WHERE `entry`=1309; -- Khadgars Whisker in Swamp of Sorrows
UPDATE `pool_template` SET `max_limit` = 4 WHERE `entry`=984 AND `patch_min`=5 AND `patch_max`=10; -- Stranglekelp in Swamp of Sorrows
UPDATE `pool_template` SET `max_limit` = 4 WHERE `entry`=1326; -- Kingsblood in Swamp of Sorrows
UPDATE `pool_template` SET `max_limit` = 3 WHERE `entry`=1311; -- Fadeleaf in Swamp of Sorrows
UPDATE `pool_template` SET `max_limit` = 4 WHERE `entry`=984 AND `patch_min`=0 AND `patch_max`=4; -- Stranglekelp in Swamp of Sorrows
UPDATE `pool_template` SET `max_limit` = 6 WHERE `entry` = 1318; -- Swamp of Sorrows - Silver Vein / Gold Vein / Iron Deposit (Master Pool)
UPDATE `pool_template` SET `max_limit` = 4 WHERE `entry` = 1314; -- Swamp of Sorrows - Mithril Deposit / Truesilver Deposit (Master Pool)

-- Desolace
UPDATE `pool_template` SET `max_limit` = 1 WHERE `entry` = 321;
UPDATE `pool_template` SET `max_limit` = 1 WHERE `entry` = 1139;
UPDATE `pool_template` SET `max_limit` = 1 WHERE `entry` = 1147;
UPDATE `pool_template` SET `max_limit` = 4 WHERE `entry` = 1140;
UPDATE `pool_template` SET `max_limit` = 15 WHERE `entry` = 1146;
UPDATE `pool_template` SET `max_limit` = 8 WHERE `entry` = 1141;
UPDATE `pool_template` SET `max_limit` = 4 WHERE `entry` = 23058;
UPDATE `pool_template` SET `max_limit` = 4 WHERE `entry` = 1145 AND `patch_min`=5 AND `patch_max`=10;
UPDATE `pool_template` SET `max_limit` = 4 WHERE `entry` = 1145 AND `patch_min`=0 AND `patch_max`=4;
UPDATE `pool_template` SET `max_limit` = 5 WHERE `entry` = 1137;
UPDATE `pool_template` SET `max_limit` = 6 WHERE `entry` = 107;
UPDATE `pool_template` SET `max_limit` = 3 WHERE `entry` = 1144;
UPDATE `pool_template` SET `max_limit` = 3 WHERE `entry` = 1143;
UPDATE `pool_template` SET `max_limit` = 4 WHERE `entry` = 1142;

-- Tanaris
UPDATE `pool_template` SET `max_limit` = 15 WHERE `entry`=1208; -- Firebloom in Tanaris
UPDATE `pool_template` SET `max_limit` = 10 WHERE `entry`=1205; -- Purple Lotus in Tanaris
UPDATE `pool_template` SET `max_limit` = 10 WHERE `entry`=1200; -- Tanaris - Silver Vein / Gold Vein / Iron Deposit (Master Pool)
UPDATE `pool_template` SET `max_limit` = 16 WHERE `entry`=1203; -- Tanaris - Gold Vein / Mithril Deposit / Truesilver Deposit (Master Pool)
UPDATE `pool_template` SET `max_limit` = 4 WHERE `entry`=1204; -- Small Thorium Veins - Tanaris

-- Dustwallow Marsh
UPDATE `pool_template` SET `max_limit` = 6 WHERE `entry` = 43520 AND `patch_min` = 7 AND `patch_max` = 10;
UPDATE `pool_template` SET `max_limit` = 2 WHERE `entry` = 43521 AND `patch_min` = 7 AND `patch_max` = 10;
UPDATE `pool_template` SET `max_limit` = 10 WHERE `entry`=1102;
UPDATE `pool_template` SET `max_limit` = 14 WHERE `entry`=1104;
UPDATE `pool_template` SET `max_limit` = 8 WHERE `entry`=1103;
UPDATE `pool_template` SET `max_limit` = 8 WHERE `entry`=1328;
UPDATE `pool_template` SET `max_limit` = 6 WHERE `entry`=1039;

-- Badlands
UPDATE `pool_template` SET `max_limit` = 6 WHERE `entry` = 1284;
UPDATE `pool_template` SET `max_limit` = 5 WHERE `entry` = 1281;
UPDATE `pool_template` SET `max_limit` = 5 WHERE `entry` = 1282;
UPDATE `pool_template` SET `max_limit` = 3 WHERE `entry` = 1283;
UPDATE `pool_template` SET `max_limit` = 4 WHERE `entry` = 1084;
UPDATE `pool_template` SET `max_limit` = 2 WHERE `entry` = 1285;
UPDATE `pool_template` SET `max_limit` = 1 WHERE `entry` = 1286;
UPDATE `pool_template` SET `max_limit` = 11 WHERE `entry` = 1287;
UPDATE `pool_template` SET `max_limit` = 10 WHERE `entry` = 1288;

-- Alterac Mountains
UPDATE `pool_template` SET `max_limit` = 10 WHERE `entry`=1068;
UPDATE `pool_template` SET `max_limit` = 9 WHERE `entry`=1069;
UPDATE `pool_template` SET `max_limit` = 1 WHERE `entry`=407;
UPDATE `pool_template` SET `max_limit` = 8 WHERE `entry`=1058;
UPDATE `pool_template` SET `max_limit` = 6 WHERE `entry`=1057;
UPDATE `pool_template` SET `max_limit` = 6 WHERE `entry`=1059;
UPDATE `pool_template` SET `max_limit` = 4 WHERE `entry`=1062;
UPDATE `pool_template` SET `max_limit` = 3 WHERE `entry`=1071;
UPDATE `pool_template` SET `max_limit` = 3 WHERE `entry`=1063;
UPDATE `pool_template` SET `max_limit` = 2 WHERE `entry`=1056;

-- Stranglethorn
UPDATE `pool_template` SET `max_limit` = 15 WHERE `entry`=1175;
UPDATE `pool_template` SET `max_limit` = 10 WHERE `entry`=1174;
UPDATE `pool_template` SET `max_limit` = 16 WHERE `entry`=1171 AND `patch_min`=0 AND `patch_max`=10;
UPDATE `pool_template` SET `max_limit` = 19 WHERE `entry`=1170;
UPDATE `pool_template` SET `max_limit` = 11 WHERE `entry`=1173;
UPDATE `pool_template` SET `max_limit` = 13 WHERE `entry`=1179;
UPDATE `pool_template` SET `max_limit` = 11 WHERE `entry`=1169;
UPDATE `pool_template` SET `max_limit` = 16 WHERE `entry`=1171 AND `patch_min`=0 AND `patch_max`=4;
UPDATE `pool_template` SET `max_limit` = 3 WHERE `entry`=1199;
UPDATE `pool_template` SET `max_limit` = 4 WHERE `entry`=1172;
UPDATE `pool_template` SET `max_limit` = 3 WHERE `entry`=1178;
UPDATE `pool_template` SET `max_limit` = 2 WHERE `entry`=1176;

-- Searing Gorge
UPDATE `pool_template` SET `max_limit` = 12 WHERE `entry`=1291;
UPDATE `pool_template` SET `max_limit` = 3 WHERE `entry`=4350;
UPDATE `pool_template` SET `max_limit` = 2 WHERE `entry`=4352;
UPDATE `pool_template` SET `max_limit` = 8 WHERE `entry`=1338;
UPDATE `pool_template` SET `max_limit` = 3 WHERE `entry`=4351;

-- Stonetalon
UPDATE `pool_template` SET `max_limit` = 14 WHERE `entry`=1086;
UPDATE `pool_template` SET `max_limit` = 13 WHERE `entry`=1085;
UPDATE `pool_template` SET `max_limit` = 11 WHERE `entry`=1088;
UPDATE `pool_template` SET `max_limit` = 8 WHERE `entry`=1087;
UPDATE `pool_template` SET `max_limit` = 4 WHERE `entry`=1082;
UPDATE `pool_template` SET `max_limit` = 6 WHERE `entry`=1091;
UPDATE `pool_template` SET `max_limit` = 15 WHERE `entry`=1090;
UPDATE `pool_template` SET `max_limit` = 16 WHERE `entry`=1089;

-- Redridge
UPDATE `pool_template` SET `max_limit` = 22 WHERE `entry`=1128;
UPDATE `pool_template` SET `max_limit` = 7 WHERE `entry`=400;
UPDATE `pool_template` SET `max_limit` = 7 WHERE `entry`=1129;
UPDATE `pool_template` SET `max_limit` = 8 WHERE `entry`=1126;
UPDATE `pool_template` SET `max_limit` = 8 WHERE `entry`=1127;
UPDATE `pool_template` SET `max_limit` = 12 WHERE `entry`=1124;
UPDATE `pool_template` SET `max_limit` = 6 WHERE `entry`=1306;

-- Darkshore
UPDATE `pool_template` SET `max_limit` = 9 WHERE `entry`=1322 AND `patch_min`=5 AND `patch_max`=10;
UPDATE `pool_template` SET `max_limit` = 10 WHERE `entry`=1097;
UPDATE `pool_template` SET `max_limit` = 9 WHERE `entry`=1100;
UPDATE `pool_template` SET `max_limit` = 11 WHERE `entry`=1095;
UPDATE `pool_template` SET `max_limit` = 9 WHERE `entry`=1322 AND `patch_min`=0 AND `patch_max`=4;
UPDATE `pool_template` SET `max_limit` = 10 WHERE `entry`=1094;
UPDATE `pool_template` SET `max_limit` = 8 WHERE `entry`=1096;
UPDATE `pool_template` SET `max_limit` = 4 WHERE `entry`=1101;
UPDATE `pool_template` SET `max_limit` = 28 WHERE `entry`=1098;
UPDATE `pool_template` SET `max_limit` = 11 WHERE `entry`=1099;

-- Ashenvale
UPDATE `pool_template` SET `max_limit` = 11 WHERE `entry` = 1075;
UPDATE `pool_template` SET `max_limit` = 6 WHERE `entry` = 1080;
UPDATE `pool_template` SET `max_limit` = 10 WHERE `entry` = 1078;
UPDATE `pool_template` SET `max_limit` = 11 WHERE `entry` = 1072;
UPDATE `pool_template` SET `max_limit` = 6 WHERE `entry` = 1076 AND `patch_min`=5 AND `patch_max`=10;
UPDATE `pool_template` SET `max_limit` = 6 WHERE `entry` = 1074;
UPDATE `pool_template` SET `max_limit` = 10 WHERE `entry` = 1073;
UPDATE `pool_template` SET `max_limit` = 4 WHERE `entry` = 1351;
UPDATE `pool_template` SET `max_limit` = 6 WHERE `entry` = 1076 AND `patch_min`=0 AND `patch_max`=4;
UPDATE `pool_template` SET `max_limit` = 8 WHERE `entry` = 1077;
UPDATE `pool_template` SET `max_limit` = 4 WHERE `entry` = 1079;
UPDATE `pool_template` SET `max_limit` = 4 WHERE `entry` = 1325;

-- Duskwood
UPDATE `pool_template` SET `max_limit` = 10 WHERE `entry` = 1113;
UPDATE `pool_template` SET `max_limit` = 6 WHERE `entry` = 399;
UPDATE `pool_template` SET `max_limit` = 11 WHERE `entry` = 1119;
UPDATE `pool_template` SET `max_limit` = 9 WHERE `entry` = 1115;
UPDATE `pool_template` SET `max_limit` = 5 WHERE `entry` = 1117;
UPDATE `pool_template` SET `max_limit` = 6 WHERE `entry` = 1120;
UPDATE `pool_template` SET `max_limit` = 3 WHERE `entry` = 1116;
UPDATE `pool_template` SET `max_limit` = 4 WHERE `entry` = 1114;
UPDATE `pool_template` SET `max_limit` = 3 WHERE `entry` = 105;
UPDATE `pool_template` SET `max_limit` = 6 WHERE `entry` = 18830;

-- Barrens
UPDATE `pool_template` SET `max_limit` = 22 WHERE `entry` = 1032;
UPDATE `pool_template` SET `max_limit` = 18 WHERE `entry` = 1037;
UPDATE `pool_template` SET `max_limit` = 16 WHERE `entry` = 1036;
UPDATE `pool_template` SET `max_limit` = 16 WHERE `entry` = 1030;
UPDATE `pool_template` SET `max_limit` = 14 WHERE `entry` = 1031;
UPDATE `pool_template` SET `max_limit` = 11 WHERE `entry` = 1029;
UPDATE `pool_template` SET `max_limit` = 12 WHERE `entry` = 1038;
UPDATE `pool_template` SET `max_limit` = 6 WHERE `entry` = 1064 AND `patch_min`=5 AND `patch_max`=10;
UPDATE `pool_template` SET `max_limit` = 6 WHERE `entry` = 1064 AND `patch_min`=0 AND `patch_max`=4;
UPDATE `pool_template` SET `max_limit` = 4 WHERE `entry` = 1168;
UPDATE `pool_template` SET `max_limit` = 3 WHERE `entry` = 3165;
UPDATE `pool_template` SET `max_limit` = 9 WHERE `entry` = 2587;
UPDATE `pool_template` SET `max_limit` = 9 WHERE `entry` = 1033;
UPDATE `pool_template` SET `max_limit` = 28 WHERE `entry` = 4303;

-- Westfall
UPDATE `pool_template` SET `max_limit` = 27 WHERE `entry` = 1111;
UPDATE `pool_template` SET `max_limit` = 10 WHERE `entry` = 1109;
UPDATE `pool_template` SET `max_limit` = 7 WHERE `entry` = 1108;
UPDATE `pool_template` SET `max_limit` = 7 WHERE `entry` = 1110;
UPDATE `pool_template` SET `max_limit` = 9 WHERE `entry`=1122 AND `patch_min`=5 AND `patch_max`=10;
UPDATE `pool_template` SET `max_limit` = 12 WHERE `entry` = 1106;
UPDATE `pool_template` SET `max_limit` = 6 WHERE `entry` = 1105;
UPDATE `pool_template` SET `max_limit` = 8 WHERE `entry` = 1107;
UPDATE `pool_template` SET `max_limit` = 9 WHERE `entry` = 1112;

-- Silverpine
UPDATE `pool_template` SET `max_limit` = 23 WHERE `entry` = 1044;
UPDATE `pool_template` SET `max_limit` = 10 WHERE `entry` = 1046;
UPDATE `pool_template` SET `max_limit` = 10 WHERE `entry` = 1043;
UPDATE `pool_template` SET `max_limit` = 19 WHERE `entry` = 1042;
UPDATE `pool_template` SET `max_limit` = 13 WHERE `entry` = 1041;
UPDATE `pool_template` SET `max_limit` = 4 WHERE `entry` = 1047;
UPDATE `pool_template` SET `max_limit` = 4 WHERE `entry`=1065 AND `patch_min`=5 AND `patch_max`=10;
UPDATE `pool_template` SET `max_limit` = 4 WHERE `entry`=1065 AND `patch_min`=0 AND `patch_max`=4;
UPDATE `pool_template` SET `max_limit` = 5 WHERE `entry`=1045;
UPDATE `pool_template` SET `max_limit` = 5 WHERE `entry`=1354;

-- Wetlands
UPDATE `pool_template` SET `max_limit` = 7 WHERE `entry` = 1156;
UPDATE `pool_template` SET `max_limit` = 8 WHERE `entry` = 1348;
UPDATE `pool_template` SET `max_limit` = 4 WHERE `entry` = 1355;
UPDATE `pool_template` SET `max_limit` = 11 WHERE `entry`=1149 AND `patch_min`=5 AND `patch_max`=10;
UPDATE `pool_template` SET `max_limit` = 11 WHERE `entry`=1149 AND `patch_min`=0 AND `patch_max`=4;
UPDATE `pool_template` SET `max_limit` = 13 WHERE `entry` = 1155;
UPDATE `pool_template` SET `max_limit` = 11 WHERE `entry` = 1151;
UPDATE `pool_template` SET `max_limit` = 11 WHERE `entry` = 1153;
UPDATE `pool_template` SET `max_limit` = 7 WHERE `entry` = 1150;
UPDATE `pool_template` SET `max_limit` = 5 WHERE `entry` = 1154;
UPDATE `pool_template` SET `max_limit` = 6 WHERE `entry` = 1152;

-- Hillsbrad
UPDATE `pool_template` SET `max_limit` = 11 WHERE `entry` = 1273;
UPDATE `pool_template` SET `max_limit` = 7 WHERE `entry` = 1050;
UPDATE `pool_template` SET `max_limit` = 7 WHERE `entry` = 1051;
UPDATE `pool_template` SET `max_limit` = 6 WHERE `entry`=1123 AND `patch_min`=5 AND `patch_max`=10;
UPDATE `pool_template` SET `max_limit` = 6 WHERE `entry`=1123 AND `patch_min`=0 AND `patch_max`=4;
UPDATE `pool_template` SET `max_limit` = 8 WHERE `entry` = 1048;
UPDATE `pool_template` SET `max_limit` = 11 WHERE `entry` = 1066;
UPDATE `pool_template` SET `max_limit` = 4 WHERE `entry` = 1209;
UPDATE `pool_template` SET `max_limit` = 4 WHERE `entry` = 1274;
UPDATE `pool_template` SET `max_limit` = 2 WHERE `entry` = 1049;
UPDATE `pool_template` SET `max_limit` = 2 WHERE `entry` = 322;
UPDATE `pool_template` SET `max_limit` = 3 WHERE `entry` = 3310;
UPDATE `pool_template` SET `max_limit` = 2 WHERE `entry` = 998;

-- Arathi
UPDATE `pool_template` SET `max_limit` = 4 WHERE `entry` = 18840;
UPDATE `pool_template` SET `max_limit` = 4 WHERE `entry` = 1358;
UPDATE `pool_template` SET `max_limit` = 8 WHERE `entry` = 406;
UPDATE `pool_template` SET `max_limit` = 16 WHERE `entry` = 323;
UPDATE `pool_template` SET `max_limit` = 10 WHERE `entry` = 1185;
UPDATE `pool_template` SET `max_limit` = 10 WHERE `entry` = 1181;
UPDATE `pool_template` SET `max_limit` = 8 WHERE `entry` = 1182;
UPDATE `pool_template` SET `max_limit` = 6 WHERE `entry` = 1180;
UPDATE `pool_template` SET `max_limit` = 5 WHERE `entry` = 1183;
UPDATE `pool_template` SET `max_limit` = 4 WHERE `entry` = 1184;
UPDATE `pool_template` SET `max_limit` = 2 WHERE `entry` = 298;
UPDATE `pool_template` SET `max_limit` = 2 WHERE `entry` = 1052;
UPDATE `pool_template` SET `max_limit` = 1 WHERE `entry` = 104;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
