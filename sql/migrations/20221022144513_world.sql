DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20221022144513');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20221022144513');
-- Add your query below.


-- Update player stats for race-class-level combinations we have data for.
UPDATE `player_classlevelstats` SET `basehp`=18, `basemana`=60 WHERE `class`=2 && `level`=1; -- Old HP 28 Mana 59
UPDATE `player_classlevelstats` SET `basemana`=65 WHERE `class`=3 && `level`=1; -- Old HP 26 Mana 63
UPDATE `player_classlevelstats` SET `basehp`=32 WHERE `class`=5 && `level`=1; -- Old HP 31 Mana 110
UPDATE `player_classlevelstats` SET `basehp`=47, `basemana`=119 WHERE `class`=5 && `level`=2; -- Old HP 37 Mana 165
UPDATE `player_classlevelstats` SET `basehp`=137, `basemana`=212 WHERE `class`=5 && `level`=10; -- Old HP 127 Mana 272
UPDATE `player_classlevelstats` SET `basehp`=928, `basemana`=1142 WHERE `class`=5 && `level`=49; -- Old HP 918 Mana 1202
UPDATE `player_classlevelstats` SET `basehp`=1053, `basemana`=1214 WHERE `class`=5 && `level`=52; -- Old HP 1043 Mana 1274
UPDATE `player_classlevelstats` SET `basehp`=1090, `basemana`=1238 WHERE `class`=5 && `level`=53; -- Old HP 1080 Mana 1298
UPDATE `player_classlevelstats` SET `basehp`=1177, `basemana`=1271 WHERE `class`=5 && `level`=55; -- Old HP 1167 Mana 1331
UPDATE `player_classlevelstats` SET `basehp`=1217, `basemana`=1295 WHERE `class`=5 && `level`=56; -- Old HP 1207 Mana 1355
UPDATE `player_classlevelstats` SET `basehp`=1258, `basemana`=1319 WHERE `class`=5 && `level`=57; -- Old HP 1248 Mana 1379
UPDATE `player_classlevelstats` SET `basehp`=1300, `basemana`=1343 WHERE `class`=5 && `level`=58; -- Old HP 1290 Mana 1403
UPDATE `player_classlevelstats` SET `basehp`=1353, `basemana`=1352 WHERE `class`=5 && `level`=59; -- Old HP 1343 Mana 1412
UPDATE `player_classlevelstats` SET `basehp`=1397, `basemana`=1376 WHERE `class`=5 && `level`=60; -- Old HP 1387 Mana 1436
UPDATE `player_classlevelstats` SET `basemana`=55 WHERE `class`=7 && `level`=1; -- Old HP 27 Mana 53
UPDATE `player_classlevelstats` SET `basemana`=665 WHERE `class`=7 && `level`=30; -- Old HP 335 Mana 718
UPDATE `player_classlevelstats` SET `basemana`=1323 WHERE `class`=7 && `level`=52; -- Old HP 960 Mana 1313
UPDATE `player_classlevelstats` SET `basehp`=32 WHERE `class`=8 && `level`=1; -- Old HP 31 Mana 100
UPDATE `player_classlevelstats` SET `basehp`=47, `basemana`=110 WHERE `class`=8 && `level`=2; -- Old HP 37 Mana 170
UPDATE `player_classlevelstats` SET `basehp`=52, `basemana`=121 WHERE `class`=8 && `level`=3; -- Old HP 42 Mana 181
UPDATE `player_classlevelstats` SET `basehp`=67, `basemana`=118 WHERE `class`=8 && `level`=4; -- Old HP 57 Mana 178
UPDATE `player_classlevelstats` SET `basehp`=82, `basemana`=131 WHERE `class`=8 && `level`=5; -- Old HP 72 Mana 191
UPDATE `player_classlevelstats` SET `basehp`=97, `basemana`=145 WHERE `class`=8 && `level`=6; -- Old HP 87 Mana 205
UPDATE `player_classlevelstats` SET `basehp`=102, `basemana`=160 WHERE `class`=8 && `level`=7; -- Old HP 92 Mana 220
UPDATE `player_classlevelstats` SET `basehp`=117, `basemana`=161 WHERE `class`=8 && `level`=8; -- Old HP 107 Mana 221
UPDATE `player_classlevelstats` SET `basehp`=132, `basemana`=178 WHERE `class`=8 && `level`=9; -- Old HP 122 Mana 238
UPDATE `player_classlevelstats` SET `basehp`=137, `basemana`=196 WHERE `class`=8 && `level`=10; -- Old HP 127 Mana 256
UPDATE `player_classlevelstats` SET `basehp`=152, `basemana`=215 WHERE `class`=8 && `level`=11; -- Old HP 142 Mana 275
UPDATE `player_classlevelstats` SET `basehp`=167, `basemana`=220 WHERE `class`=8 && `level`=12; -- Old HP 157 Mana 280
UPDATE `player_classlevelstats` SET `basehp`=172, `basemana`=241 WHERE `class`=8 && `level`=13; -- Old HP 162 Mana 301
UPDATE `player_classlevelstats` SET `basehp`=187, `basemana`=263 WHERE `class`=8 && `level`=14; -- Old HP 177 Mana 323
UPDATE `player_classlevelstats` SET `basehp`=202, `basemana`=271 WHERE `class`=8 && `level`=15; -- Old HP 192 Mana 331
UPDATE `player_classlevelstats` SET `basehp`=207, `basemana`=295 WHERE `class`=8 && `level`=16; -- Old HP 197 Mana 355
UPDATE `player_classlevelstats` SET `basehp`=222, `basemana`=305 WHERE `class`=8 && `level`=17; -- Old HP 212 Mana 365
UPDATE `player_classlevelstats` SET `basehp`=237, `basemana`=331 WHERE `class`=8 && `level`=18; -- Old HP 227 Mana 391
UPDATE `player_classlevelstats` SET `basehp`=242, `basemana`=343 WHERE `class`=8 && `level`=19; -- Old HP 232 Mana 403
UPDATE `player_classlevelstats` SET `basehp`=257, `basemana`=371 WHERE `class`=8 && `level`=20; -- Old HP 247 Mana 431
UPDATE `player_classlevelstats` SET `basehp`=272, `basemana`=385 WHERE `class`=8 && `level`=21; -- Old HP 262 Mana 445
UPDATE `player_classlevelstats` SET `basehp`=277, `basemana`=415 WHERE `class`=8 && `level`=22; -- Old HP 267 Mana 475
UPDATE `player_classlevelstats` SET `basehp`=292, `basemana`=431 WHERE `class`=8 && `level`=23; -- Old HP 282 Mana 491
UPDATE `player_classlevelstats` SET `basehp`=298, `basemana`=463 WHERE `class`=8 && `level`=24; -- Old HP 288 Mana 523
UPDATE `player_classlevelstats` SET `basehp`=315, `basemana`=481 WHERE `class`=8 && `level`=25; -- Old HP 305 Mana 541
UPDATE `player_classlevelstats` SET `basehp`=333, `basemana`=515 WHERE `class`=8 && `level`=26; -- Old HP 323 Mana 575
UPDATE `player_classlevelstats` SET `basehp`=342, `basemana`=535 WHERE `class`=8 && `level`=27; -- Old HP 332 Mana 595
UPDATE `player_classlevelstats` SET `basehp`=362, `basemana`=556 WHERE `class`=8 && `level`=28; -- Old HP 352 Mana 616
UPDATE `player_classlevelstats` SET `basehp`=373, `basemana`=592 WHERE `class`=8 && `level`=29; -- Old HP 363 Mana 652
UPDATE `player_classlevelstats` SET `basehp`=395, `basemana`=613 WHERE `class`=8 && `level`=30; -- Old HP 385 Mana 673
UPDATE `player_classlevelstats` SET `basehp`=418, `basemana`=634 WHERE `class`=8 && `level`=31; -- Old HP 408 Mana 694
UPDATE `player_classlevelstats` SET `basehp`=432, `basemana`=670 WHERE `class`=8 && `level`=32; -- Old HP 422 Mana 730
UPDATE `player_classlevelstats` SET `basehp`=457, `basemana`=691 WHERE `class`=8 && `level`=33; -- Old HP 447 Mana 751
UPDATE `player_classlevelstats` SET `basehp`=473, `basemana`=712 WHERE `class`=8 && `level`=34; -- Old HP 463 Mana 772
UPDATE `player_classlevelstats` SET `basehp`=500, `basemana`=733 WHERE `class`=8 && `level`=35; -- Old HP 490 Mana 793
UPDATE `player_classlevelstats` SET `basehp`=518, `basemana`=754 WHERE `class`=8 && `level`=36; -- Old HP 508 Mana 814
UPDATE `player_classlevelstats` SET `basehp`=547, `basemana`=790 WHERE `class`=8 && `level`=37; -- Old HP 537 Mana 850
UPDATE `player_classlevelstats` SET `basehp`=577, `basemana`=811 WHERE `class`=8 && `level`=38; -- Old HP 567 Mana 871
UPDATE `player_classlevelstats` SET `basehp`=598, `basemana`=832 WHERE `class`=8 && `level`=39; -- Old HP 588 Mana 892
UPDATE `player_classlevelstats` SET `basehp`=630, `basemana`=853 WHERE `class`=8 && `level`=40; -- Old HP 620 Mana 913
UPDATE `player_classlevelstats` SET `basehp`=653, `basemana`=874 WHERE `class`=8 && `level`=41; -- Old HP 643 Mana 934
UPDATE `player_classlevelstats` SET `basehp`=687, `basemana`=895 WHERE `class`=8 && `level`=42; -- Old HP 677 Mana 955
UPDATE `player_classlevelstats` SET `basehp`=712, `basemana`=916 WHERE `class`=8 && `level`=43; -- Old HP 702 Mana 976
UPDATE `player_classlevelstats` SET `basehp`=748, `basemana`=937 WHERE `class`=8 && `level`=44; -- Old HP 738 Mana 997
UPDATE `player_classlevelstats` SET `basehp`=775, `basemana`=958 WHERE `class`=8 && `level`=45; -- Old HP 765 Mana 1018
UPDATE `player_classlevelstats` SET `basehp`=813, `basemana`=979 WHERE `class`=8 && `level`=46; -- Old HP 803 Mana 1039
UPDATE `player_classlevelstats` SET `basehp`=842, `basemana`=1000 WHERE `class`=8 && `level`=47; -- Old HP 832 Mana 1060
UPDATE `player_classlevelstats` SET `basehp`=882, `basemana`=1021 WHERE `class`=8 && `level`=48; -- Old HP 872 Mana 1081
UPDATE `player_classlevelstats` SET `basehp`=913, `basemana`=1042 WHERE `class`=8 && `level`=49; -- Old HP 903 Mana 1102
UPDATE `player_classlevelstats` SET `basehp`=955, `basemana`=1048 WHERE `class`=8 && `level`=50; -- Old HP 945 Mana 1108
UPDATE `player_classlevelstats` SET `basehp`=988, `basemana`=1069 WHERE `class`=8 && `level`=51; -- Old HP 978 Mana 1129
UPDATE `player_classlevelstats` SET `basehp`=1032, `basemana`=1090 WHERE `class`=8 && `level`=52; -- Old HP 1022 Mana 1150
UPDATE `player_classlevelstats` SET `basehp`=1067, `basemana`=1111 WHERE `class`=8 && `level`=53; -- Old HP 1057 Mana 1171
UPDATE `player_classlevelstats` SET `basehp`=1103, `basemana`=1117 WHERE `class`=8 && `level`=54; -- Old HP 1093 Mana 1177
UPDATE `player_classlevelstats` SET `basehp`=1150, `basemana`=1138 WHERE `class`=8 && `level`=55; -- Old HP 1140 Mana 1198
UPDATE `player_classlevelstats` SET `basehp`=1188, `basemana`=1159 WHERE `class`=8 && `level`=56; -- Old HP 1178 Mana 1219
UPDATE `player_classlevelstats` SET `basehp`=1237, `basemana`=1165 WHERE `class`=8 && `level`=57; -- Old HP 1227 Mana 1225
UPDATE `player_classlevelstats` SET `basehp`=1277, `basemana`=1186 WHERE `class`=8 && `level`=58; -- Old HP 1267 Mana 1246
UPDATE `player_classlevelstats` SET `basehp`=1328, `basemana`=1192 WHERE `class`=8 && `level`=59; -- Old HP 1318 Mana 1252
UPDATE `player_classlevelstats` SET `basehp`=1370, `basemana`=1213 WHERE `class`=8 && `level`=60; -- Old HP 1360 Mana 1273
UPDATE `player_classlevelstats` SET `basemana`=90 WHERE `class`=9 && `level`=1; -- Old HP 23 Mana 59
UPDATE `player_classlevelstats` SET `basehp`=833 WHERE `class`=9 && `level`=46; -- Old HP 823 Mana 1064
UPDATE `player_classlevelstats` SET `basehp`=1099 WHERE `class`=9 && `level`=53; -- Old HP 1089 Mana 1226
UPDATE `player_classlevelstats` SET `basehp`=1141 WHERE `class`=9 && `level`=54; -- Old HP 1131 Mana 1247
UPDATE `player_levelstats` SET `spi`=20 WHERE `race`=1 && `class`=1 && `level`=1; -- Old Strength 23 Agility 20 Stamina 22 Intellect 20 Spirit 21
UPDATE `player_levelstats` SET `spi`=20 WHERE `race`=1 && `class`=1 && `level`=2; -- Old Strength 24 Agility 21 Stamina 23 Intellect 20 Spirit 21
UPDATE `player_levelstats` SET `spi`=45 WHERE `race`=1 && `class`=1 && `level`=60; -- Old Strength 120 Agility 80 Stamina 110 Intellect 30 Spirit 47
UPDATE `player_levelstats` SET `spi`=21 WHERE `race`=1 && `class`=2 && `level`=1; -- Old Strength 22 Agility 20 Stamina 22 Intellect 20 Spirit 22
UPDATE `player_levelstats` SET `spi`=22 WHERE `race`=1 && `class`=2 && `level`=2; -- Old Strength 23 Agility 21 Stamina 23 Intellect 21 Spirit 23
UPDATE `player_levelstats` SET `spi`=22 WHERE `race`=1 && `class`=2 && `level`=3; -- Old Strength 24 Agility 21 Stamina 24 Intellect 21 Spirit 23
UPDATE `player_levelstats` SET `spi`=23 WHERE `race`=1 && `class`=2 && `level`=4; -- Old Strength 25 Agility 22 Stamina 25 Intellect 22 Spirit 24
UPDATE `player_levelstats` SET `spi`=24 WHERE `race`=1 && `class`=2 && `level`=5; -- Old Strength 26 Agility 22 Stamina 26 Intellect 22 Spirit 25
UPDATE `player_levelstats` SET `spi`=24 WHERE `race`=1 && `class`=2 && `level`=6; -- Old Strength 27 Agility 23 Stamina 27 Intellect 23 Spirit 25
UPDATE `player_levelstats` SET `spi`=25 WHERE `race`=1 && `class`=2 && `level`=7; -- Old Strength 28 Agility 23 Stamina 28 Intellect 24 Spirit 26
UPDATE `player_levelstats` SET `spi`=25 WHERE `race`=1 && `class`=2 && `level`=8; -- Old Strength 29 Agility 24 Stamina 28 Intellect 24 Spirit 26
UPDATE `player_levelstats` SET `spi`=26 WHERE `race`=1 && `class`=2 && `level`=9; -- Old Strength 30 Agility 24 Stamina 29 Intellect 25 Spirit 27
UPDATE `player_levelstats` SET `spi`=27 WHERE `race`=1 && `class`=2 && `level`=10; -- Old Strength 31 Agility 25 Stamina 30 Intellect 25 Spirit 28
UPDATE `player_levelstats` SET `spi`=28 WHERE `race`=1 && `class`=2 && `level`=11; -- Old Strength 32 Agility 25 Stamina 31 Intellect 26 Spirit 29
UPDATE `player_levelstats` SET `spi`=28 WHERE `race`=1 && `class`=2 && `level`=12; -- Old Strength 33 Agility 26 Stamina 32 Intellect 27 Spirit 29
UPDATE `player_levelstats` SET `spi`=29 WHERE `race`=1 && `class`=2 && `level`=13; -- Old Strength 34 Agility 27 Stamina 33 Intellect 27 Spirit 30
UPDATE `player_levelstats` SET `spi`=30 WHERE `race`=1 && `class`=2 && `level`=14; -- Old Strength 35 Agility 27 Stamina 34 Intellect 28 Spirit 31
UPDATE `player_levelstats` SET `spi`=30 WHERE `race`=1 && `class`=2 && `level`=15; -- Old Strength 36 Agility 28 Stamina 36 Intellect 29 Spirit 31
UPDATE `player_levelstats` SET `spi`=31 WHERE `race`=1 && `class`=2 && `level`=16; -- Old Strength 38 Agility 28 Stamina 37 Intellect 29 Spirit 32
UPDATE `player_levelstats` SET `spi`=32 WHERE `race`=1 && `class`=2 && `level`=17; -- Old Strength 39 Agility 29 Stamina 38 Intellect 30 Spirit 33
UPDATE `player_levelstats` SET `spi`=33 WHERE `race`=1 && `class`=2 && `level`=18; -- Old Strength 40 Agility 30 Stamina 39 Intellect 31 Spirit 34
UPDATE `player_levelstats` SET `spi`=33 WHERE `race`=1 && `class`=2 && `level`=19; -- Old Strength 41 Agility 30 Stamina 40 Intellect 31 Spirit 34
UPDATE `player_levelstats` SET `spi`=34 WHERE `race`=1 && `class`=2 && `level`=20; -- Old Strength 42 Agility 31 Stamina 41 Intellect 32 Spirit 35
UPDATE `player_levelstats` SET `spi`=62 WHERE `race`=1 && `class`=2 && `level`=49; -- Old Strength 84 Agility 54 Stamina 81 Intellect 58 Spirit 65
UPDATE `player_levelstats` SET `spi`=63 WHERE `race`=1 && `class`=2 && `level`=50; -- Old Strength 86 Agility 55 Stamina 82 Intellect 59 Spirit 66
UPDATE `player_levelstats` SET `spi`=64 WHERE `race`=1 && `class`=2 && `level`=51; -- Old Strength 88 Agility 56 Stamina 84 Intellect 60 Spirit 67
UPDATE `player_levelstats` SET `spi`=65 WHERE `race`=1 && `class`=2 && `level`=52; -- Old Strength 90 Agility 57 Stamina 86 Intellect 61 Spirit 68
UPDATE `player_levelstats` SET `spi`=66 WHERE `race`=1 && `class`=2 && `level`=53; -- Old Strength 92 Agility 58 Stamina 87 Intellect 62 Spirit 69
UPDATE `player_levelstats` SET `spi`=67 WHERE `race`=1 && `class`=2 && `level`=54; -- Old Strength 93 Agility 59 Stamina 89 Intellect 63 Spirit 70
UPDATE `player_levelstats` SET `spi`=69 WHERE `race`=1 && `class`=2 && `level`=55; -- Old Strength 95 Agility 60 Stamina 91 Intellect 64 Spirit 72
UPDATE `player_levelstats` SET `spi`=70 WHERE `race`=1 && `class`=2 && `level`=56; -- Old Strength 97 Agility 61 Stamina 93 Intellect 65 Spirit 73
UPDATE `player_levelstats` SET `spi`=71 WHERE `race`=1 && `class`=2 && `level`=57; -- Old Strength 99 Agility 62 Stamina 94 Intellect 66 Spirit 74
UPDATE `player_levelstats` SET `spi`=72 WHERE `race`=1 && `class`=2 && `level`=58; -- Old Strength 101 Agility 63 Stamina 96 Intellect 68 Spirit 75
UPDATE `player_levelstats` SET `spi`=74 WHERE `race`=1 && `class`=2 && `level`=59; -- Old Strength 103 Agility 64 Stamina 98 Intellect 69 Spirit 77
UPDATE `player_levelstats` SET `spi`=75 WHERE `race`=1 && `class`=2 && `level`=60; -- Old Strength 105 Agility 65 Stamina 100 Intellect 70 Spirit 78
UPDATE `player_levelstats` SET `spi`=20 WHERE `race`=1 && `class`=4 && `level`=2; -- Old Strength 22 Agility 24 Stamina 22 Intellect 20 Spirit 21
UPDATE `player_levelstats` SET `spi`=21 WHERE `race`=1 && `class`=4 && `level`=3; -- Old Strength 22 Agility 25 Stamina 22 Intellect 20 Spirit 22
UPDATE `player_levelstats` SET `spi`=21 WHERE `race`=1 && `class`=4 && `level`=4; -- Old Strength 23 Agility 27 Stamina 23 Intellect 21 Spirit 22
UPDATE `player_levelstats` SET `spi`=50 WHERE `race`=1 && `class`=4 && `level`=60; -- Old Strength 80 Agility 130 Stamina 75 Intellect 35 Spirit 52
UPDATE `player_levelstats` SET `spi`=23 WHERE `race`=1 && `class`=5 && `level`=1; -- Old Strength 20 Agility 20 Stamina 20 Intellect 22 Spirit 24
UPDATE `player_levelstats` SET `spi`=24 WHERE `race`=1 && `class`=5 && `level`=2; -- Old Strength 20 Agility 20 Stamina 20 Intellect 23 Spirit 25
UPDATE `player_levelstats` SET `spi`=125 WHERE `race`=1 && `class`=5 && `level`=60; -- Old Strength 35 Agility 40 Stamina 50 Intellect 120 Spirit 131
UPDATE `player_levelstats` SET `spi`=23 WHERE `race`=1 && `class`=8 && `level`=2; -- Old Strength 20 Agility 20 Stamina 20 Intellect 24 Spirit 24
UPDATE `player_levelstats` SET `spi`=24 WHERE `race`=1 && `class`=8 && `level`=3; -- Old Strength 20 Agility 20 Stamina 21 Intellect 25 Spirit 25
UPDATE `player_levelstats` SET `spi`=25 WHERE `race`=1 && `class`=8 && `level`=4; -- Old Strength 20 Agility 21 Stamina 21 Intellect 27 Spirit 26
UPDATE `player_levelstats` SET `spi`=27 WHERE `race`=1 && `class`=8 && `level`=5; -- Old Strength 20 Agility 21 Stamina 21 Intellect 28 Spirit 28
UPDATE `player_levelstats` SET `spi`=28 WHERE `race`=1 && `class`=8 && `level`=6; -- Old Strength 21 Agility 21 Stamina 21 Intellect 29 Spirit 29
UPDATE `player_levelstats` SET `spi`=29 WHERE `race`=1 && `class`=8 && `level`=7; -- Old Strength 21 Agility 21 Stamina 22 Intellect 30 Spirit 30
UPDATE `player_levelstats` SET `spi`=34 WHERE `race`=1 && `class`=8 && `level`=11; -- Old Strength 21 Agility 22 Stamina 23 Intellect 35 Spirit 35
UPDATE `player_levelstats` SET `spi`=35 WHERE `race`=1 && `class`=8 && `level`=12; -- Old Strength 21 Agility 22 Stamina 23 Intellect 37 Spirit 36
UPDATE `player_levelstats` SET `spi`=36 WHERE `race`=1 && `class`=8 && `level`=13; -- Old Strength 21 Agility 22 Stamina 24 Intellect 38 Spirit 37
UPDATE `player_levelstats` SET `spi`=38 WHERE `race`=1 && `class`=8 && `level`=14; -- Old Strength 22 Agility 22 Stamina 24 Intellect 39 Spirit 39
UPDATE `player_levelstats` SET `spi`=39 WHERE `race`=1 && `class`=8 && `level`=15; -- Old Strength 22 Agility 23 Stamina 24 Intellect 41 Spirit 40
UPDATE `player_levelstats` SET `spi`=40 WHERE `race`=1 && `class`=8 && `level`=16; -- Old Strength 22 Agility 23 Stamina 25 Intellect 42 Spirit 42
UPDATE `player_levelstats` SET `spi`=42 WHERE `race`=1 && `class`=8 && `level`=17; -- Old Strength 22 Agility 23 Stamina 25 Intellect 43 Spirit 44
UPDATE `player_levelstats` SET `spi`=43 WHERE `race`=1 && `class`=8 && `level`=18; -- Old Strength 22 Agility 23 Stamina 25 Intellect 45 Spirit 45
UPDATE `player_levelstats` SET `spi`=44 WHERE `race`=1 && `class`=8 && `level`=19; -- Old Strength 22 Agility 23 Stamina 26 Intellect 46 Spirit 46
UPDATE `player_levelstats` SET `spi`=46 WHERE `race`=1 && `class`=8 && `level`=20; -- Old Strength 22 Agility 24 Stamina 26 Intellect 48 Spirit 48
UPDATE `player_levelstats` SET `spi`=47 WHERE `race`=1 && `class`=8 && `level`=21; -- Old Strength 23 Agility 24 Stamina 26 Intellect 49 Spirit 49
UPDATE `player_levelstats` SET `spi`=49 WHERE `race`=1 && `class`=8 && `level`=22; -- Old Strength 23 Agility 24 Stamina 27 Intellect 51 Spirit 51
UPDATE `player_levelstats` SET `spi`=23 WHERE `race`=1 && `class`=9 && `level`=2; -- Old Strength 20 Agility 20 Stamina 22 Intellect 23 Spirit 24
UPDATE `player_levelstats` SET `spi`=24 WHERE `race`=1 && `class`=9 && `level`=3; -- Old Strength 21 Agility 21 Stamina 22 Intellect 24 Spirit 25
UPDATE `player_levelstats` SET `spi`=25 WHERE `race`=1 && `class`=9 && `level`=4; -- Old Strength 21 Agility 21 Stamina 23 Intellect 25 Spirit 26
UPDATE `player_levelstats` SET `spi`=26 WHERE `race`=1 && `class`=9 && `level`=5; -- Old Strength 21 Agility 21 Stamina 23 Intellect 26 Spirit 27
UPDATE `player_levelstats` SET `spi`=27 WHERE `race`=1 && `class`=9 && `level`=6; -- Old Strength 21 Agility 22 Stamina 24 Intellect 27 Spirit 28
UPDATE `player_levelstats` SET `spi`=29 WHERE `race`=1 && `class`=9 && `level`=7; -- Old Strength 22 Agility 22 Stamina 24 Intellect 28 Spirit 30
UPDATE `player_levelstats` SET `spi`=30 WHERE `race`=1 && `class`=9 && `level`=8; -- Old Strength 22 Agility 22 Stamina 25 Intellect 29 Spirit 31
UPDATE `player_levelstats` SET `spi`=31 WHERE `race`=1 && `class`=9 && `level`=9; -- Old Strength 22 Agility 23 Stamina 25 Intellect 30 Spirit 32
UPDATE `player_levelstats` SET `spi`=32 WHERE `race`=1 && `class`=9 && `level`=10; -- Old Strength 23 Agility 23 Stamina 26 Intellect 31 Spirit 33
UPDATE `player_levelstats` SET `spi`=33 WHERE `race`=1 && `class`=9 && `level`=11; -- Old Strength 23 Agility 24 Stamina 26 Intellect 33 Spirit 34
UPDATE `player_levelstats` SET `spi`=34 WHERE `race`=1 && `class`=9 && `level`=12; -- Old Strength 23 Agility 24 Stamina 27 Intellect 34 Spirit 35
UPDATE `player_levelstats` SET `spi`=36 WHERE `race`=1 && `class`=9 && `level`=13; -- Old Strength 24 Agility 24 Stamina 27 Intellect 35 Spirit 37
UPDATE `player_levelstats` SET `spi`=37 WHERE `race`=1 && `class`=9 && `level`=14; -- Old Strength 24 Agility 25 Stamina 28 Intellect 36 Spirit 38
UPDATE `player_levelstats` SET `spi`=38 WHERE `race`=1 && `class`=9 && `level`=15; -- Old Strength 24 Agility 25 Stamina 29 Intellect 37 Spirit 39
UPDATE `player_levelstats` SET `spi`=39 WHERE `race`=1 && `class`=9 && `level`=16; -- Old Strength 25 Agility 26 Stamina 29 Intellect 38 Spirit 40
UPDATE `player_levelstats` SET `spi`=41 WHERE `race`=1 && `class`=9 && `level`=17; -- Old Strength 25 Agility 26 Stamina 30 Intellect 40 Spirit 43
UPDATE `player_levelstats` SET `spi`=42 WHERE `race`=1 && `class`=9 && `level`=18; -- Old Strength 25 Agility 26 Stamina 30 Intellect 41 Spirit 44
UPDATE `player_levelstats` SET `spi`=43 WHERE `race`=1 && `class`=9 && `level`=19; -- Old Strength 26 Agility 27 Stamina 31 Intellect 42 Spirit 45
UPDATE `player_levelstats` SET `spi`=45 WHERE `race`=1 && `class`=9 && `level`=20; -- Old Strength 26 Agility 27 Stamina 32 Intellect 43 Spirit 47
UPDATE `player_levelstats` SET `spi`=46 WHERE `race`=1 && `class`=9 && `level`=21; -- Old Strength 26 Agility 28 Stamina 32 Intellect 45 Spirit 48
UPDATE `player_levelstats` SET `spi`=47 WHERE `race`=1 && `class`=9 && `level`=22; -- Old Strength 27 Agility 28 Stamina 33 Intellect 46 Spirit 49
UPDATE `player_levelstats` SET `spi`=49 WHERE `race`=1 && `class`=9 && `level`=23; -- Old Strength 27 Agility 29 Stamina 34 Intellect 47 Spirit 51
UPDATE `player_levelstats` SET `spi`=50 WHERE `race`=1 && `class`=9 && `level`=24; -- Old Strength 28 Agility 29 Stamina 34 Intellect 49 Spirit 52
UPDATE `player_levelstats` SET `spi`=52 WHERE `race`=1 && `class`=9 && `level`=25; -- Old Strength 28 Agility 30 Stamina 35 Intellect 50 Spirit 54
UPDATE `player_levelstats` SET `spi`=56 WHERE `race`=1 && `class`=9 && `level`=28; -- Old Strength 29 Agility 31 Stamina 37 Intellect 54 Spirit 58
UPDATE `player_levelstats` SET `spi`=57 WHERE `race`=1 && `class`=9 && `level`=29; -- Old Strength 30 Agility 31 Stamina 38 Intellect 56 Spirit 59
UPDATE `player_levelstats` SET `spi`=59 WHERE `race`=1 && `class`=9 && `level`=30; -- Old Strength 30 Agility 32 Stamina 38 Intellect 57 Spirit 61
UPDATE `player_levelstats` SET `spi`=61 WHERE `race`=1 && `class`=9 && `level`=31; -- Old Strength 30 Agility 32 Stamina 39 Intellect 58 Spirit 64
UPDATE `player_levelstats` SET `spi`=62 WHERE `race`=1 && `class`=9 && `level`=32; -- Old Strength 31 Agility 33 Stamina 40 Intellect 60 Spirit 65
UPDATE `player_levelstats` SET `spi`=64 WHERE `race`=1 && `class`=9 && `level`=33; -- Old Strength 31 Agility 33 Stamina 41 Intellect 61 Spirit 67
UPDATE `player_levelstats` SET `spi`=65 WHERE `race`=1 && `class`=9 && `level`=34; -- Old Strength 32 Agility 34 Stamina 41 Intellect 63 Spirit 68
UPDATE `player_levelstats` SET `spi`=67 WHERE `race`=1 && `class`=9 && `level`=35; -- Old Strength 32 Agility 34 Stamina 42 Intellect 64 Spirit 70
UPDATE `player_levelstats` SET `spi`=69 WHERE `race`=1 && `class`=9 && `level`=36; -- Old Strength 33 Agility 35 Stamina 43 Intellect 66 Spirit 72
UPDATE `player_levelstats` SET `spi`=70 WHERE `race`=1 && `class`=9 && `level`=37; -- Old Strength 33 Agility 36 Stamina 44 Intellect 68 Spirit 73
UPDATE `player_levelstats` SET `spi`=72 WHERE `race`=1 && `class`=9 && `level`=38; -- Old Strength 33 Agility 36 Stamina 45 Intellect 69 Spirit 75
UPDATE `player_levelstats` SET `spi`=74 WHERE `race`=1 && `class`=9 && `level`=39; -- Old Strength 34 Agility 37 Stamina 45 Intellect 71 Spirit 77
UPDATE `player_levelstats` SET `spi`=115 WHERE `race`=1 && `class`=9 && `level`=60; -- Old Strength 45 Agility 50 Stamina 65 Intellect 110 Spirit 120
UPDATE `player_levelstats` SET `agi`=45 WHERE `race`=2 && `class`=4 && `level`=19; -- Old Strength 38 Agility 44 Stamina 35 Intellect 20 Spirit 30
UPDATE `player_levelstats` SET `inte`=21 WHERE `race`=2 && `class`=4 && `level`=20; -- Old Strength 38 Agility 46 Stamina 36 Intellect 20 Spirit 30
UPDATE `player_levelstats` SET `sta`=67 WHERE `race`=2 && `class`=9 && `level`=60; -- Old Strength 48 Agility 47 Stamina 66 Intellect 107 Spirit 118
UPDATE `player_levelstats` SET `inte`=21, `spi`=27 WHERE `race`=5 && `class`=8 && `level`=1; -- Old Strength 19 Agility 18 Stamina 21 Intellect 27 Spirit 21
UPDATE `player_levelstats` SET `sta`=44, `spi`=74 WHERE `race`=5 && `class`=9 && `level`=36; -- Old Strength 32 Agility 33 Stamina 43 Intellect 64 Spirit 75
UPDATE `player_levelstats` SET `sta`=49, `spi`=84 WHERE `race`=5 && `class`=9 && `level`=42; -- Old Strength 34 Agility 36 Stamina 48 Intellect 74 Spirit 85
UPDATE `player_levelstats` SET `spi`=91 WHERE `race`=5 && `class`=9 && `level`=46; -- Old Strength 36 Agility 39 Stamina 52 Intellect 81 Spirit 90
UPDATE `player_levelstats` SET `spi`=97 WHERE `race`=5 && `class`=9 && `level`=49; -- Old Strength 38 Agility 41 Stamina 55 Intellect 86 Spirit 96
UPDATE `player_levelstats` SET `sta`=61, `spi`=109 WHERE `race`=5 && `class`=9 && `level`=55; -- Old Strength 41 Agility 44 Stamina 60 Intellect 98 Spirit 110
UPDATE `player_levelstats` SET `sta`=64 WHERE `race`=5 && `class`=9 && `level`=58; -- Old Strength 43 Agility 47 Stamina 63 Intellect 104 Spirit 116
UPDATE `player_levelstats` SET `inte`=26 WHERE `race`=7 && `class`=1 && `level`=21; -- Old Strength 43 Agility 38 Stamina 44 Intellect 27 Spirit 26
UPDATE `player_levelstats` SET `inte`=23 WHERE `race`=7 && `class`=4 && `level`=2; -- Old Strength 17 Agility 27 Stamina 21 Intellect 24 Spirit 20
UPDATE `player_levelstats` SET `inte`=23 WHERE `race`=7 && `class`=4 && `level`=3; -- Old Strength 17 Agility 28 Stamina 21 Intellect 24 Spirit 21
UPDATE `player_levelstats` SET `inte`=24 WHERE `race`=7 && `class`=4 && `level`=4; -- Old Strength 18 Agility 30 Stamina 22 Intellect 25 Spirit 21
UPDATE `player_levelstats` SET `inte`=24 WHERE `race`=7 && `class`=4 && `level`=5; -- Old Strength 19 Agility 31 Stamina 23 Intellect 25 Spirit 21
UPDATE `player_levelstats` SET `inte`=24 WHERE `race`=7 && `class`=4 && `level`=6; -- Old Strength 19 Agility 32 Stamina 23 Intellect 25 Spirit 22
UPDATE `player_levelstats` SET `inte`=24 WHERE `race`=7 && `class`=4 && `level`=7; -- Old Strength 20 Agility 34 Stamina 24 Intellect 25 Spirit 22
UPDATE `player_levelstats` SET `inte`=24 WHERE `race`=7 && `class`=4 && `level`=8; -- Old Strength 21 Agility 35 Stamina 24 Intellect 25 Spirit 22
UPDATE `player_levelstats` SET `inte`=24 WHERE `race`=7 && `class`=4 && `level`=9; -- Old Strength 22 Agility 36 Stamina 25 Intellect 25 Spirit 23
UPDATE `player_levelstats` SET `inte`=25 WHERE `race`=7 && `class`=4 && `level`=10; -- Old Strength 22 Agility 38 Stamina 26 Intellect 26 Spirit 23
UPDATE `player_levelstats` SET `inte`=27 WHERE `race`=7 && `class`=8 && `level`=2; -- Old Strength 15 Agility 23 Stamina 19 Intellect 28 Spirit 23
UPDATE `player_levelstats` SET `inte`=28 WHERE `race`=7 && `class`=8 && `level`=3; -- Old Strength 15 Agility 23 Stamina 20 Intellect 29 Spirit 24
UPDATE `player_levelstats` SET `inte`=30 WHERE `race`=7 && `class`=8 && `level`=4; -- Old Strength 15 Agility 24 Stamina 20 Intellect 32 Spirit 25
UPDATE `player_levelstats` SET `inte`=31 WHERE `race`=7 && `class`=8 && `level`=5; -- Old Strength 15 Agility 24 Stamina 20 Intellect 33 Spirit 27
UPDATE `player_levelstats` SET `inte`=32 WHERE `race`=7 && `class`=8 && `level`=6; -- Old Strength 16 Agility 24 Stamina 20 Intellect 34 Spirit 28
UPDATE `player_levelstats` SET `inte`=33 WHERE `race`=7 && `class`=8 && `level`=7; -- Old Strength 16 Agility 24 Stamina 21 Intellect 35 Spirit 29
UPDATE `player_levelstats` SET `inte`=34 WHERE `race`=7 && `class`=8 && `level`=8; -- Old Strength 16 Agility 24 Stamina 21 Intellect 36 Spirit 30
UPDATE `player_levelstats` SET `inte`=36 WHERE `race`=7 && `class`=8 && `level`=9; -- Old Strength 16 Agility 24 Stamina 21 Intellect 38 Spirit 31
UPDATE `player_levelstats` SET `inte`=37 WHERE `race`=7 && `class`=8 && `level`=10; -- Old Strength 16 Agility 25 Stamina 22 Intellect 39 Spirit 33
UPDATE `player_levelstats` SET `inte`=38 WHERE `race`=7 && `class`=8 && `level`=11; -- Old Strength 16 Agility 25 Stamina 22 Intellect 40 Spirit 34
UPDATE `player_levelstats` SET `inte`=40 WHERE `race`=7 && `class`=8 && `level`=12; -- Old Strength 16 Agility 25 Stamina 22 Intellect 42 Spirit 35
UPDATE `player_levelstats` SET `inte`=41 WHERE `race`=7 && `class`=8 && `level`=13; -- Old Strength 16 Agility 25 Stamina 23 Intellect 43 Spirit 36
UPDATE `player_levelstats` SET `inte`=42 WHERE `race`=7 && `class`=8 && `level`=14; -- Old Strength 17 Agility 25 Stamina 23 Intellect 44 Spirit 38
UPDATE `player_levelstats` SET `inte`=44 WHERE `race`=7 && `class`=8 && `level`=15; -- Old Strength 17 Agility 26 Stamina 23 Intellect 46 Spirit 39
UPDATE `player_levelstats` SET `inte`=45 WHERE `race`=7 && `class`=8 && `level`=16; -- Old Strength 17 Agility 26 Stamina 24 Intellect 47 Spirit 40
UPDATE `player_levelstats` SET `inte`=46 WHERE `race`=7 && `class`=8 && `level`=17; -- Old Strength 17 Agility 26 Stamina 24 Intellect 48 Spirit 42
UPDATE `player_levelstats` SET `inte`=48 WHERE `race`=7 && `class`=8 && `level`=18; -- Old Strength 17 Agility 26 Stamina 24 Intellect 50 Spirit 43
UPDATE `player_levelstats` SET `inte`=49 WHERE `race`=7 && `class`=8 && `level`=19; -- Old Strength 17 Agility 26 Stamina 25 Intellect 51 Spirit 44
UPDATE `player_levelstats` SET `inte`=51 WHERE `race`=7 && `class`=8 && `level`=20; -- Old Strength 17 Agility 27 Stamina 25 Intellect 54 Spirit 46
UPDATE `player_levelstats` SET `inte`=52 WHERE `race`=7 && `class`=8 && `level`=21; -- Old Strength 18 Agility 27 Stamina 25 Intellect 55 Spirit 47
UPDATE `player_levelstats` SET `inte`=54 WHERE `race`=7 && `class`=8 && `level`=22; -- Old Strength 18 Agility 27 Stamina 26 Intellect 57 Spirit 49
UPDATE `player_levelstats` SET `inte`=55 WHERE `race`=7 && `class`=8 && `level`=23; -- Old Strength 18 Agility 27 Stamina 26 Intellect 58 Spirit 50
UPDATE `player_levelstats` SET `inte`=57 WHERE `race`=7 && `class`=8 && `level`=24; -- Old Strength 18 Agility 28 Stamina 27 Intellect 60 Spirit 52
UPDATE `player_levelstats` SET `inte`=58 WHERE `race`=7 && `class`=8 && `level`=25; -- Old Strength 18 Agility 28 Stamina 27 Intellect 61 Spirit 53
UPDATE `player_levelstats` SET `inte`=60 WHERE `race`=7 && `class`=8 && `level`=26; -- Old Strength 18 Agility 28 Stamina 27 Intellect 63 Spirit 55
UPDATE `player_levelstats` SET `inte`=62 WHERE `race`=7 && `class`=8 && `level`=27; -- Old Strength 18 Agility 28 Stamina 28 Intellect 65 Spirit 56
UPDATE `player_levelstats` SET `inte`=63 WHERE `race`=7 && `class`=8 && `level`=28; -- Old Strength 19 Agility 28 Stamina 28 Intellect 66 Spirit 58
UPDATE `player_levelstats` SET `inte`=65 WHERE `race`=7 && `class`=8 && `level`=29; -- Old Strength 19 Agility 29 Stamina 29 Intellect 68 Spirit 59
UPDATE `player_levelstats` SET `inte`=67 WHERE `race`=7 && `class`=8 && `level`=30; -- Old Strength 19 Agility 29 Stamina 29 Intellect 70 Spirit 61
UPDATE `player_levelstats` SET `inte`=68 WHERE `race`=7 && `class`=8 && `level`=31; -- Old Strength 19 Agility 29 Stamina 29 Intellect 71 Spirit 63
UPDATE `player_levelstats` SET `inte`=70 WHERE `race`=7 && `class`=8 && `level`=32; -- Old Strength 19 Agility 29 Stamina 30 Intellect 74 Spirit 64
UPDATE `player_levelstats` SET `inte`=72 WHERE `race`=7 && `class`=8 && `level`=33; -- Old Strength 19 Agility 30 Stamina 30 Intellect 76 Spirit 66
UPDATE `player_levelstats` SET `inte`=73 WHERE `race`=7 && `class`=8 && `level`=34; -- Old Strength 20 Agility 30 Stamina 31 Intellect 77 Spirit 68
UPDATE `player_levelstats` SET `inte`=75 WHERE `race`=7 && `class`=8 && `level`=35; -- Old Strength 20 Agility 30 Stamina 31 Intellect 79 Spirit 69
UPDATE `player_levelstats` SET `inte`=77 WHERE `race`=7 && `class`=8 && `level`=36; -- Old Strength 20 Agility 31 Stamina 32 Intellect 81 Spirit 71
UPDATE `player_levelstats` SET `inte`=79 WHERE `race`=7 && `class`=8 && `level`=37; -- Old Strength 20 Agility 31 Stamina 32 Intellect 83 Spirit 73
UPDATE `player_levelstats` SET `inte`=81 WHERE `race`=7 && `class`=8 && `level`=38; -- Old Strength 20 Agility 31 Stamina 32 Intellect 85 Spirit 75
UPDATE `player_levelstats` SET `inte`=83 WHERE `race`=7 && `class`=8 && `level`=39; -- Old Strength 21 Agility 31 Stamina 33 Intellect 87 Spirit 76
UPDATE `player_levelstats` SET `inte`=84 WHERE `race`=7 && `class`=8 && `level`=40; -- Old Strength 21 Agility 32 Stamina 33 Intellect 88 Spirit 78
UPDATE `player_levelstats` SET `inte`=86 WHERE `race`=7 && `class`=8 && `level`=41; -- Old Strength 21 Agility 32 Stamina 34 Intellect 90 Spirit 80
UPDATE `player_levelstats` SET `inte`=88 WHERE `race`=7 && `class`=8 && `level`=42; -- Old Strength 21 Agility 32 Stamina 34 Intellect 92 Spirit 82
UPDATE `player_levelstats` SET `inte`=90 WHERE `race`=7 && `class`=8 && `level`=43; -- Old Strength 21 Agility 32 Stamina 35 Intellect 95 Spirit 84
UPDATE `player_levelstats` SET `inte`=92 WHERE `race`=7 && `class`=8 && `level`=44; -- Old Strength 21 Agility 33 Stamina 35 Intellect 97 Spirit 86
UPDATE `player_levelstats` SET `inte`=94 WHERE `race`=7 && `class`=8 && `level`=45; -- Old Strength 22 Agility 33 Stamina 36 Intellect 99 Spirit 88
UPDATE `player_levelstats` SET `inte`=96 WHERE `race`=7 && `class`=8 && `level`=46; -- Old Strength 22 Agility 33 Stamina 36 Intellect 101 Spirit 90
UPDATE `player_levelstats` SET `inte`=98 WHERE `race`=7 && `class`=8 && `level`=47; -- Old Strength 22 Agility 34 Stamina 37 Intellect 103 Spirit 92
UPDATE `player_levelstats` SET `inte`=101 WHERE `race`=7 && `class`=8 && `level`=48; -- Old Strength 22 Agility 34 Stamina 37 Intellect 106 Spirit 94
UPDATE `player_levelstats` SET `inte`=103 WHERE `race`=7 && `class`=8 && `level`=49; -- Old Strength 23 Agility 34 Stamina 38 Intellect 108 Spirit 96
UPDATE `player_levelstats` SET `inte`=105 WHERE `race`=7 && `class`=8 && `level`=50; -- Old Strength 23 Agility 35 Stamina 38 Intellect 110 Spirit 98
UPDATE `player_levelstats` SET `inte`=107 WHERE `race`=7 && `class`=8 && `level`=51; -- Old Strength 23 Agility 35 Stamina 39 Intellect 112 Spirit 100
UPDATE `player_levelstats` SET `inte`=109 WHERE `race`=7 && `class`=8 && `level`=52; -- Old Strength 23 Agility 35 Stamina 39 Intellect 114 Spirit 102
UPDATE `player_levelstats` SET `inte`=111 WHERE `race`=7 && `class`=8 && `level`=53; -- Old Strength 23 Agility 36 Stamina 40 Intellect 117 Spirit 104
UPDATE `player_levelstats` SET `inte`=114 WHERE `race`=7 && `class`=8 && `level`=54; -- Old Strength 24 Agility 36 Stamina 41 Intellect 120 Spirit 106
UPDATE `player_levelstats` SET `inte`=116 WHERE `race`=7 && `class`=8 && `level`=55; -- Old Strength 24 Agility 36 Stamina 41 Intellect 122 Spirit 109
UPDATE `player_levelstats` SET `inte`=118 WHERE `race`=7 && `class`=8 && `level`=56; -- Old Strength 24 Agility 37 Stamina 42 Intellect 124 Spirit 111
UPDATE `player_levelstats` SET `inte`=121 WHERE `race`=7 && `class`=8 && `level`=57; -- Old Strength 24 Agility 37 Stamina 42 Intellect 127 Spirit 113
UPDATE `player_levelstats` SET `inte`=123 WHERE `race`=7 && `class`=8 && `level`=58; -- Old Strength 25 Agility 37 Stamina 43 Intellect 129 Spirit 115
UPDATE `player_levelstats` SET `inte`=126 WHERE `race`=7 && `class`=8 && `level`=59; -- Old Strength 25 Agility 38 Stamina 43 Intellect 132 Spirit 118
UPDATE `player_levelstats` SET `inte`=128 WHERE `race`=7 && `class`=8 && `level`=60; -- Old Strength 25 Agility 38 Stamina 44 Intellect 133 Spirit 120
UPDATE `player_levelstats` SET `inte`=113 WHERE `race`=7 && `class`=9 && `level`=60; -- Old Strength 40 Agility 53 Stamina 64 Intellect 119 Spirit 115


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
