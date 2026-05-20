DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260520091620');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260520091620');
-- Add your query below.


-- Ironforge Guard (Entry: 5595, Guid: 97) - DISTANCE 75.3335
UPDATE `creature` SET `position_x`=-4948.85, `position_y`=-1191.17, `position_z`=501.66 WHERE `guid`=97;

-- Ironforge Guard (Entry: 5595, Guid: 105) - DISTANCE 40.768
UPDATE `creature` SET `position_x`=-4973.11, `position_y`=-995.715, `position_z`=501.658 WHERE `guid`=105;

-- Ironforge Guard (Entry: 5595, Guid: 121) - DISTANCE 49.4408
UPDATE `creature` SET `position_x`=-4979.97, `position_y`=-889.479, `position_z`=501.627 WHERE `guid`=121;

-- Ironforge Mountaineer (Entry: 727, Guid: 225) - DISTANCE 22.2018
UPDATE `creature` SET `position_x`=-5711.44, `position_y`=-553.78, `position_z`=398.49 WHERE `guid`=225;

-- Bone Chewer (Entry: 210, Guid: 5973) - DISTANCE 38.1588
UPDATE `creature` SET `position_x`=-10243.5, `position_y`=161.273, `position_z`=0.0465889 WHERE `guid`=5973;

-- Skeletal Raider (Entry: 1110, Guid: 5138) - DISTANCE 29.1416
UPDATE `creature` SET `position_x`=-10426.2, `position_y`=343.543, `position_z`=42.0242 WHERE `guid`=5138;

-- Ironforge Guard (Entry: 5595, Guid: 1760) - DISTANCE 78.1083
UPDATE `creature` SET `position_x`=-4672.09, `position_y`=-983.101, `position_z`=501.658 WHERE `guid`=1760;

-- Bimble Longberry (Entry: 7978, Guid: 1768) - DISTANCE 20.3488
UPDATE `creature` SET `position_x`=-4707.85, `position_y`=-907.012, `position_z`=501.659 WHERE `guid`=1768;

-- Watcher Backus (Entry: 840, Guid: 4230) - DISTANCE 192.999
UPDATE `creature` SET `position_x`=-10330.9, `position_y`=-1122.6, `position_z`=21.8575 WHERE `guid`=4230;

-- Watcher Ladimore (Entry: 576, Guid: 4211) - DISTANCE 35.9802
UPDATE `creature` SET `position_x`=-10581.6, `position_y`=-1172.89, `position_z`=28.4936 WHERE `guid`=4211;

-- Leper Gnome (Entry: 1211, Guid: 2418) - DISTANCE 23.2913
UPDATE `creature` SET `position_x`=-5122.42, `position_y`=450.757, `position_z`=396.876 WHERE `guid`=2418;

-- Dreadscorn (Entry: 8304, Guid: 3902) - DISTANCE 29.9231
UPDATE `creature` SET `position_x`=-11447.9, `position_y`=-2646.15, `position_z`=24.1283 WHERE `guid`=3902;

-- Felguard Sentry (Entry: 6011, Guid: 3883) - DISTANCE 31.3489
UPDATE `creature` SET `position_x`=-11748, `position_y`=-3072.61, `position_z`=12.723 WHERE `guid`=3883;

-- Tristane Shadowstone (Entry: 11807, Guid: 3031) - DISTANCE 45.1524
UPDATE `creature` SET `position_x`=-5367.29, `position_y`=285.647, `position_z`=394.25 WHERE `guid`=3031;

-- Bloodsail Raider (Entry: 1561, Guid: 2571) - DISTANCE 39.6011
UPDATE `creature` SET `position_x`=-14141.8, `position_y`=477.248, `position_z`=3.25545 WHERE `guid`=2571;

-- Ironforge Mountaineer (Entry: 727, Guid: 4481) - DISTANCE 432.627
UPDATE `creature` SET `position_x`=-5508.87, `position_y`=-1966.94, `position_z`=399.491 WHERE `guid`=4481;

-- Bloodscalp Berserker (Entry: 597, Guid: 2237) - DISTANCE 42.8179
UPDATE `creature` SET `position_x`=-11621.5, `position_y`=705.35, `position_z`=42.2621 WHERE `guid`=2237;

-- Mosh'Ogg Brute (Entry: 1142, Guid: 2185) - DISTANCE 23.0946
UPDATE `creature` SET `position_x`=-12526.9, `position_y`=-99.9495, `position_z`=14.6065 WHERE `guid`=2185;

-- Mosh'Ogg Brute (Entry: 1142, Guid: 2162) - DISTANCE 22.2186
UPDATE `creature` SET `position_x`=-12477.3, `position_y`=-129.195, `position_z`=13.7891 WHERE `guid`=2162;

-- Mosh'Ogg Brute (Entry: 1142, Guid: 2154) - DISTANCE 49.5728
UPDATE `creature` SET `position_x`=-12438.5, `position_y`=-135.884, `position_z`=15.6819 WHERE `guid`=2154;

-- Bloodscalp Berserker (Entry: 597, Guid: 2111) - DISTANCE 44.8574
UPDATE `creature` SET `position_x`=-11562.7, `position_y`=730.125, `position_z`=59.5396 WHERE `guid`=2111;

-- Crystal Spine Basilisk (Entry: 689, Guid: 2106) - DISTANCE 60.6836
UPDATE `creature` SET `position_x`=-11886.4, `position_y`=717.058, `position_z`=26.5422 WHERE `guid`=2106;

-- Dabyrie Militia (Entry: 2581, Guid: 12045) - DISTANCE 28.9553
UPDATE `creature` SET `position_x`=-1095.12, `position_y`=-2939.86, `position_z`=44.4017 WHERE `guid`=12045;

-- Bloodscalp Berserker (Entry: 597, Guid: 2057) - DISTANCE 36.7792
UPDATE `creature` SET `position_x`=-11608.8, `position_y`=769.426, `position_z`=40.1039 WHERE `guid`=2057;

-- Bloodscalp Scout (Entry: 588, Guid: 1927) - DISTANCE 22.8092
UPDATE `creature` SET `position_x`=-11648, `position_y`=564.524, `position_z`=49.8145 WHERE `guid`=1927;

-- Dabyrie Militia (Entry: 2581, Guid: 11913) - DISTANCE 77.4288
UPDATE `creature` SET `position_x`=-1014.42, `position_y`=-2918.99, `position_z`=59.6612 WHERE `guid`=11913;

-- Dabyrie Militia (Entry: 2581, Guid: 11727) - DISTANCE 56.1831
UPDATE `creature` SET `position_x`=-1027.88, `position_y`=-2866.24, `position_z`=50.072 WHERE `guid`=11727;

-- Refuge Pointe Defender (Entry: 10696, Guid: 11581) - DISTANCE 130.091
UPDATE `creature` SET `position_x`=-1287.23, `position_y`=-2607.49, `position_z`=60.2273 WHERE `guid`=11581;

-- Kurzen Witch Doctor (Entry: 942, Guid: 1618) - DISTANCE 57.4569
UPDATE `creature` SET `position_x`=-11525.8, `position_y`=-907.2, `position_z`=25.5492 WHERE `guid`=1618;

-- Skullsplitter Hunter (Entry: 669, Guid: 1391) - DISTANCE 41.4714
UPDATE `creature` SET `position_x`=-12992.4, `position_y`=-671.172, `position_z`=52.4459 WHERE `guid`=1391;

-- Rorgish Jowl (Entry: 10639, Guid: 32869) - DISTANCE 36.1387
UPDATE `creature` SET `position_x`=3265.91, `position_y`=-365.72, `position_z`=153.103 WHERE `guid`=32869;

-- Menethil Sentry (Entry: 1434, Guid: 9695) - DISTANCE 41.3898
UPDATE `creature` SET `position_x`=-3602.91, `position_y`=-711.051, `position_z`=6.48002 WHERE `guid`=9695;

-- Stone Steward (Entry: 4860, Guid: 28365) - DISTANCE 25.3807
UPDATE `creature` SET `position_x`=154.882, `position_y`=284.294, `position_z`=-26.582 WHERE `guid`=28365;

-- Ancient Core Hound (Entry: 11673, Guid: 56863) - DISTANCE 55.3174
UPDATE `creature` SET `position_x`=713.138, `position_y`=-1077.04, `position_z`=-178.463 WHERE `guid`=56863;

-- Ancient Core Hound (Entry: 11673, Guid: 56862) - DISTANCE 31.7353
UPDATE `creature` SET `position_x`=619.315, `position_y`=-1131.17, `position_z`=-201.625 WHERE `guid`=56862;

-- Mountaineer Droken (Entry: 1280, Guid: 8840) - DISTANCE 45.4408
UPDATE `creature` SET `position_x`=-5456.04, `position_y`=-2879.35, `position_z`=348.621 WHERE `guid`=8840;

-- XT:9 (Entry: 4074, Guid: 32296) - DISTANCE 170.804
UPDATE `creature` SET `position_x`=1222.28, `position_y`=199.114, `position_z`=5.52599 WHERE `guid`=32296;

-- Lord Azrethoc (Entry: 5760, Guid: 29062) - DISTANCE 56.837
UPDATE `creature` SET `position_x`=-1868.5, `position_y`=1700.33, `position_z`=61.2578 WHERE `guid`=29062;

-- Magram Pack Runner (Entry: 4643, Guid: 27115) - DISTANCE 93.1899
UPDATE `creature` SET `position_x`=-1743.92, `position_y`=1068.43, `position_z`=91.2688 WHERE `guid`=27115;

-- Magram Pack Runner (Entry: 4643, Guid: 27114) - DISTANCE 98.9052
UPDATE `creature` SET `position_x`=-1866.26, `position_y`=1292.67, `position_z`=90.2674 WHERE `guid`=27114;

-- Kodo Matriarch (Entry: 2974, Guid: 26213) - DISTANCE 28.8265
UPDATE `creature` SET `position_x`=-2549.47, `position_y`=-4.26567, `position_z`=5.67873 WHERE `guid`=26213;

-- Mountain Cougar (Entry: 2961, Guid: 25765) - DISTANCE 33.1085
UPDATE `creature` SET `position_x`=-3403.65, `position_y`=-418.469, `position_z`=81.9619 WHERE `guid`=25765;

-- Mountain Cougar (Entry: 2961, Guid: 25713) - DISTANCE 35.0383
UPDATE `creature` SET `position_x`=-3511.66, `position_y`=-794.472, `position_z`=112.127 WHERE `guid`=25713;

-- Tarren Mill Deathguard (Entry: 2405, Guid: 15545) - DISTANCE 142.724
UPDATE `creature` SET `position_x`=-30.9087, `position_y`=-887.165, `position_z`=56.2581 WHERE `guid`=15545;

-- Ancient Core Hound (Entry: 11673, Guid: 56860) - DISTANCE 29.4961
UPDATE `creature` SET `position_x`=568.275, `position_y`=-805.672, `position_z`=-206.751 WHERE `guid`=56860;

-- Stone Guardian (Entry: 6560, Guid: 24431) - DISTANCE 45.4613
UPDATE `creature` SET `position_x`=-6711.66, `position_y`=-1108.71, `position_z`=-272.097 WHERE `guid`=24431;

-- Stone Guardian (Entry: 6560, Guid: 24429) - DISTANCE 44.7917
UPDATE `creature` SET `position_x`=-7838.25, `position_y`=-2077.8, `position_z`=-272.28 WHERE `guid`=24429;

-- Zulian Panther (Entry: 11365, Guid: 49320) - DISTANCE 22.2923
UPDATE `creature` SET `position_x`=-11626.8, `position_y`=-1701.44, `position_z`=38.8236 WHERE `guid`=49320;

-- Theradrim Guardian (Entry: 11784, Guid: 55465) - DISTANCE 25.0839
UPDATE `creature` SET `position_x`=97.5771, `position_y`=-265.692, `position_z`=-108.677 WHERE `guid`=55465;

-- Thessala Hydra (Entry: 12207, Guid: 55461) - DISTANCE 49.8242
UPDATE `creature` SET `position_x`=292.386, `position_y`=-60.9944, `position_z`=-131.01 WHERE `guid`=55461;

-- Razzashi Skitterer (Entry: 14880, Guid: 49202) - DISTANCE 26.8787
UPDATE `creature` SET `position_x`=-12298.4, `position_y`=-1653.58, `position_z`=130.261 WHERE `guid`=49202;

-- Starving Buzzard (Entry: 2829, Guid: 7561) - DISTANCE 33.0794
UPDATE `creature` SET `position_x`=-6371.3, `position_y`=-3594.98, `position_z`=247.97 WHERE `guid`=7561;

-- Silithid Hive Drone (Entry: 4133, Guid: 21325) - DISTANCE 54.5318
UPDATE `creature` SET `position_x`=-6483.78, `position_y`=-3272.34, `position_z`=-112.437 WHERE `guid`=21325;

-- Dustbelcher Mystic (Entry: 2907, Guid: 7210) - DISTANCE 29.564
UPDATE `creature` SET `position_x`=-7135.3, `position_y`=-2398.71, `position_z`=241.667 WHERE `guid`=7210;

-- Death's Head Geomancer (Entry: 7335, Guid: 20298) - DISTANCE 45.8734
UPDATE `creature` SET `position_x`=-4630.09, `position_y`=-2456.71, `position_z`=89.1339 WHERE `guid`=20298;

-- Bloodscalp Scout (Entry: 588, Guid: 993) - DISTANCE 22.8785
UPDATE `creature` SET `position_x`=-11729.1, `position_y`=652.077, `position_z`=49.8425 WHERE `guid`=993;

-- Spewed Larva (Entry: 13533, Guid: 54127) - DISTANCE 25.0146
UPDATE `creature` SET `position_x`=918.644, `position_y`=-355.717, `position_z`=-50.4764 WHERE `guid`=54127;

-- Hakkari Oracle (Entry: 11346, Guid: 733) - DISTANCE 26.6932
UPDATE `creature` SET `position_x`=-11916.5, `position_y`=-1089.93, `position_z`=77.2794 WHERE `guid`=733;

-- Dustbelcher Mauler (Entry: 2717, Guid: 6989) - DISTANCE 23.9639
UPDATE `creature` SET `position_x`=-7135.3, `position_y`=-2398.71, `position_z`=241.667 WHERE `guid`=6989;

-- Dustbelcher Wyrmhunter (Entry: 2716, Guid: 6975) - DISTANCE 30.2874
UPDATE `creature` SET `position_x`=-7141.25, `position_y`=-2395.48, `position_z`=240.516 WHERE `guid`=6975;

-- Kreenig Snarlsnout (Entry: 3438, Guid: 14386) - DISTANCE 24.9151
UPDATE `creature` SET `position_x`=-218.01, `position_y`=-3332.16, `position_z`=91.6676 WHERE `guid`=14386;

-- Gurubashi Bat Rider (Entry: 14750, Guid: 49130) - DISTANCE 31.4667
UPDATE `creature` SET `position_x`=-12274.9, `position_y`=-1414.91, `position_z`=130.601 WHERE `guid`=49130;

-- Gazelle (Entry: 4166, Guid: 14020) - DISTANCE 28.0714
UPDATE `creature` SET `position_x`=657.78, `position_y`=-1987.34, `position_z`=93.8276 WHERE `guid`=14020;

-- Dark Iron Slaver (Entry: 5844, Guid: 6767) - DISTANCE 118.425
UPDATE `creature` SET `position_x`=-6910.41, `position_y`=-1212.58, `position_z`=213.797 WHERE `guid`=6767;

-- Mogg (Entry: 14908, Guid: 13964) - DISTANCE 21.0943
UPDATE `creature` SET `position_x`=1022.24, `position_y`=-2235.11, `position_z`=93.3114 WHERE `guid`=13964;

-- Mechano-Flamewalker (Entry: 6226, Guid: 30385) - DISTANCE 35.3364
UPDATE `creature` SET `position_x`=-872.044, `position_y`=410.955, `position_z`=-316.445 WHERE `guid`=30385;

-- Akkrilus (Entry: 3773, Guid: 51883) - DISTANCE 80.2709
UPDATE `creature` SET `position_x`=2230.63, `position_y`=222.503, `position_z`=134.671 WHERE `guid`=51883;

-- Mosh'Ogg Spellcrafter (Entry: 710, Guid: 528) - DISTANCE 20.1655
UPDATE `creature` SET `position_x`=-12321.5, `position_y`=-1062.25, `position_z`=6.71975 WHERE `guid`=528;

-- Peacekeeper Security Suit (Entry: 6230, Guid: 30279) - DISTANCE 42.0477
UPDATE `creature` SET `position_x`=-626.307, `position_y`=523.558, `position_z`=-273.063 WHERE `guid`=30279;

-- Antilus the Soarer (Entry: 5347, Guid: 51840) - DISTANCE 34.2598
UPDATE `creature` SET `position_x`=-5788.74, `position_y`=1605.72, `position_z`=81.5917 WHERE `guid`=51840;

-- Spawn of Hakkar (Entry: 5708, Guid: 33621) - DISTANCE 31.1295
UPDATE `creature` SET `position_x`=-551.933, `position_y`=46.9841, `position_z`=-148.802 WHERE `guid`=33621;

-- Caverndeep Ambusher (Entry: 6207, Guid: 30217) - DISTANCE 31.2228
UPDATE `creature` SET `position_x`=-482.355, `position_y`=53.012, `position_z`=-156.967 WHERE `guid`=30217;

-- Dwarven Farmer (Entry: 12998, Guid: 285020) - DISTANCE 39.4874
UPDATE `creature` SET `position_x`=-1851.5, `position_y`=-4161.39, `position_z`=8.0422 WHERE `guid`=285020;

-- Zandalar Headshrinker (Entry: 14876, Guid: 286) - DISTANCE 25.4088
UPDATE `creature` SET `position_x`=-11830.9, `position_y`=1257.7, `position_z`=2.03902 WHERE `guid`=286;

-- Mobile Alert System (Entry: 7849, Guid: 30144) - DISTANCE 40.3667
UPDATE `creature` SET `position_x`=-772.734, `position_y`=555.942, `position_z`=-291.118 WHERE `guid`=30144;

-- Mobile Alert System (Entry: 7849, Guid: 30143) - DISTANCE 76.6678
UPDATE `creature` SET `position_x`=-756.561, `position_y`=583.677, `position_z`=-303.783 WHERE `guid`=30143;

-- Dark Iron Agent (Entry: 6212, Guid: 30132) - DISTANCE 21.6424
UPDATE `creature` SET `position_x`=-698.351, `position_y`=559.918, `position_z`=-282.06 WHERE `guid`=30132;

-- Lord Sakrasis (Entry: 2541, Guid: 32043) - DISTANCE 40.5221
UPDATE `creature` SET `position_x`=-13807.7, `position_y`=379.781, `position_z`=94.488 WHERE `guid`=32043;

-- Defias Evoker (Entry: 1729, Guid: 79171) - DISTANCE 45.7057
UPDATE `creature` SET `position_x`=-153.951, `position_y`=-517.067, `position_z`=52.5085 WHERE `guid`=79171;

-- Defias Squallshaper (Entry: 1732, Guid: 79310) - DISTANCE 21.1551
UPDATE `creature` SET `position_x`=-79.8256, `position_y`=-783.363, `position_z`=26.461 WHERE `guid`=79310;

-- Cookie (Entry: 645, Guid: 79344) - DISTANCE 43.2908
UPDATE `creature` SET `position_x`=-109.963, `position_y`=-844.91, `position_z`=16.9348 WHERE `guid`=79344;

-- Jenn Langston (Entry: 3626, Guid: 79746) - DISTANCE 89.7191
UPDATE `creature` SET `position_x`=-8703.23, `position_y`=406.059, `position_z`=99.8461 WHERE `guid`=79746;

-- Stormwind City Patroller (Entry: 1976, Guid: 79807) - DISTANCE 86.5301
UPDATE `creature` SET `position_x`=-8552.45, `position_y`=767.143, `position_z`=96.6512 WHERE `guid`=79807;

-- Stormwind City Patroller (Entry: 1976, Guid: 79814) - DISTANCE 139.666
UPDATE `creature` SET `position_x`=-8698.59, `position_y`=714.268, `position_z`=97.0168 WHERE `guid`=79814;

-- Stormwind City Guard (Entry: 68, Guid: 79859) - DISTANCE 70.255
UPDATE `creature` SET `position_x`=-8950.16, `position_y`=508.631, `position_z`=96.3585 WHERE `guid`=79859;

-- Northshire Guard (Entry: 1642, Guid: 79932) - DISTANCE 50.7065
UPDATE `creature` SET `position_x`=-9045.58, `position_y`=-42.5667, `position_z`=88.3451 WHERE `guid`=79932;

-- Northshire Peasant (Entry: 11260, Guid: 80145) - DISTANCE 30.9223
UPDATE `creature` SET `position_x`=-8902.59, `position_y`=-231.7, `position_z`=80.4142 WHERE `guid`=80145;

-- Prowler (Entry: 118, Guid: 81135) - DISTANCE 24.4032
UPDATE `creature` SET `position_x`=-8964.89, `position_y`=-731.513, `position_z`=74.6737 WHERE `guid`=81135;

-- Prowler (Entry: 118, Guid: 81155) - DISTANCE 26.2038
UPDATE `creature` SET `position_x`=-8926.76, `position_y`=-893.678, `position_z`=71.8135 WHERE `guid`=81155;

-- Prowler (Entry: 118, Guid: 81182) - DISTANCE 33.2079
UPDATE `creature` SET `position_x`=-9775.46, `position_y`=-1105.2, `position_z`=35.8893 WHERE `guid`=81182;

-- Prowler (Entry: 118, Guid: 81184) - DISTANCE 20.9959
UPDATE `creature` SET `position_x`=-9728.65, `position_y`=-1155.06, `position_z`=40.7077 WHERE `guid`=81184;

-- Prowler (Entry: 118, Guid: 81231) - DISTANCE 23.4124
UPDATE `creature` SET `position_x`=-9769.1, `position_y`=-1238.95, `position_z`=42.9905 WHERE `guid`=81231;

-- Prowler (Entry: 118, Guid: 81260) - DISTANCE 29.9078
UPDATE `creature` SET `position_x`=-9414.74, `position_y`=-1167.24, `position_z`=57.3056 WHERE `guid`=81260;

-- Prowler (Entry: 118, Guid: 81265) - DISTANCE 33.57
UPDATE `creature` SET `position_x`=-9361.51, `position_y`=-1194.59, `position_z`=64.5418 WHERE `guid`=81265;

-- Prowler (Entry: 118, Guid: 81334) - DISTANCE 23.1154
UPDATE `creature` SET `position_x`=-8877.08, `position_y`=-1039.29, `position_z`=74.3784 WHERE `guid`=81334;

-- Prowler (Entry: 118, Guid: 81351) - DISTANCE 22.1651
UPDATE `creature` SET `position_x`=-9735.17, `position_y`=-1270.18, `position_z`=51.1113 WHERE `guid`=81351;

-- Prowler (Entry: 118, Guid: 81353) - DISTANCE 20.4504
UPDATE `creature` SET `position_x`=-9838.14, `position_y`=-1200.88, `position_z`=34.7705 WHERE `guid`=81353;

-- Prowler (Entry: 118, Guid: 81375) - DISTANCE 20.5838
UPDATE `creature` SET `position_x`=-9611.71, `position_y`=-1499.37, `position_z`=58.7902 WHERE `guid`=81375;

-- Prowler (Entry: 118, Guid: 81395) - DISTANCE 25.732
UPDATE `creature` SET `position_x`=-9360.01, `position_y`=-1395.05, `position_z`=62.565 WHERE `guid`=81395;

-- Prowler (Entry: 118, Guid: 81398) - DISTANCE 37.9295
UPDATE `creature` SET `position_x`=-9389.21, `position_y`=-1449.72, `position_z`=61.9269 WHERE `guid`=81398;

-- Prowler (Entry: 118, Guid: 81399) - DISTANCE 21.5796
UPDATE `creature` SET `position_x`=-9395.29, `position_y`=-1468.65, `position_z`=61.9998 WHERE `guid`=81399;

-- Prowler (Entry: 118, Guid: 81402) - DISTANCE 23.2997
UPDATE `creature` SET `position_x`=-9521.88, `position_y`=-1515.28, `position_z`=60.9161 WHERE `guid`=81402;

-- Gilmorian (Entry: 14447, Guid: 48204) - DISTANCE 55.436
UPDATE `creature` SET `position_x`=-10567.2, `position_y`=-4384.11, `position_z`=2.47185 WHERE `guid`=48204;

-- Darkmoon Faire Carnie (Entry: 14849, Guid: 42598) - DISTANCE 25.3466
UPDATE `creature` SET `position_x`=-9554.06, `position_y`=89.1628, `position_z`=59.0065 WHERE `guid`=42598;

-- Freezing Spirit (Entry: 7353, Guid: 87206) - DISTANCE 60
UPDATE `creature` SET `position_x`=2392.46, `position_y`=993.458, `position_z`=53.1636 WHERE `guid`=87206;

-- Guard Fengus (Entry: 14321, Guid: 84379) - DISTANCE 26.5344
UPDATE `creature` SET `position_x`=385.594, `position_y`=316.105, `position_z`=11.2214 WHERE `guid`=84379;

-- Black Slayer (Entry: 5982, Guid: 1449) - DISTANCE 39.2666
UPDATE `creature` SET `position_x`=-11153.5, `position_y`=-3322.54, `position_z`=4.864 WHERE `guid`=1449;

-- Flesh Hunter (Entry: 15335, Guid: 85885) - DISTANCE 20.0681
UPDATE `creature` SET `position_x`=-9291.73, `position_y`=1379.82, `position_z`=21.3851 WHERE `guid`=85885;

-- Obsidian Destroyer (Entry: 15338, Guid: 87013) - DISTANCE 50.5825
UPDATE `creature` SET `position_x`=-9080.63, `position_y`=2195.19, `position_z`=21.3868 WHERE `guid`=87013;

-- Anubisath Guardian (Entry: 15355, Guid: 87491) - DISTANCE 28.3949
UPDATE `creature` SET `position_x`=-9199.99, `position_y`=1873.43, `position_z`=85.5563 WHERE `guid`=87491;

-- Obsidian Eradicator (Entry: 15262, Guid: 88074) - DISTANCE 40.785
UPDATE `creature` SET `position_x`=-8183.4, `position_y`=2109.86, `position_z`=129.099 WHERE `guid`=88074;

-- Anubisath Defender (Entry: 15277, Guid: 88019) - DISTANCE 88.0365
UPDATE `creature` SET `position_x`=-8937.76, `position_y`=1457.64, `position_z`=-91.8863 WHERE `guid`=88019;

-- Anubisath Defender (Entry: 15277, Guid: 88018) - DISTANCE 92.0482
UPDATE `creature` SET `position_x`=-8823.84, `position_y`=1504.05, `position_z`=-94.5167 WHERE `guid`=88018;

-- Anubisath Defender (Entry: 15277, Guid: 88017) - DISTANCE 79.9417
UPDATE `creature` SET `position_x`=-8918.98, `position_y`=1364.06, `position_z`=-104.262 WHERE `guid`=88017;

-- Anubisath Defender (Entry: 15277, Guid: 88015) - DISTANCE 62.1503
UPDATE `creature` SET `position_x`=-8760.56, `position_y`=1575.33, `position_z`=-89.3109 WHERE `guid`=88015;

-- Princess Huhuran (Entry: 15509, Guid: 88014) - DISTANCE 34.3058
UPDATE `creature` SET `position_x`=-8519.64, `position_y`=1728.46, `position_z`=-91.7956 WHERE `guid`=88014;

-- Vekniss Stinger (Entry: 15235, Guid: 88013) - DISTANCE 86.0023
UPDATE `creature` SET `position_x`=-8602.48, `position_y`=1352.63, `position_z`=-69.923 WHERE `guid`=88013;

-- Vekniss Stinger (Entry: 15235, Guid: 88006) - DISTANCE 51.885
UPDATE `creature` SET `position_x`=-8639.86, `position_y`=1471.86, `position_z`=-69.1247 WHERE `guid`=88006;

-- Vekniss Wasp (Entry: 15236, Guid: 88000) - DISTANCE 22.9751
UPDATE `creature` SET `position_x`=-8567.34, `position_y`=1401.48, `position_z`=-62.1936 WHERE `guid`=88000;

-- Vekniss Stinger (Entry: 15235, Guid: 87997) - DISTANCE 86.6248
UPDATE `creature` SET `position_x`=-8596.82, `position_y`=1644.91, `position_z`=-89.6377 WHERE `guid`=87997;

-- Vekniss Stinger (Entry: 15235, Guid: 87992) - DISTANCE 55.1727
UPDATE `creature` SET `position_x`=-8594.6, `position_y`=1345.97, `position_z`=-69.8594 WHERE `guid`=87992;

-- Vekniss Stinger (Entry: 15235, Guid: 87990) - DISTANCE 102.797
UPDATE `creature` SET `position_x`=-8616.23, `position_y`=1302.48, `position_z`=-68.8102 WHERE `guid`=87990;

-- Vekniss Soldier (Entry: 15229, Guid: 87906) - DISTANCE 87.2078
UPDATE `creature` SET `position_x`=-8160.64, `position_y`=1669.32, `position_z`=-36.0642 WHERE `guid`=87906;

-- Vekniss Soldier (Entry: 15229, Guid: 87904) - DISTANCE 22.1819
UPDATE `creature` SET `position_x`=-7977.78, `position_y`=1572.38, `position_z`=-61.796 WHERE `guid`=87904;

-- Vekniss Soldier (Entry: 15229, Guid: 87903) - DISTANCE 22.7108
UPDATE `creature` SET `position_x`=-7940.78, `position_y`=1491.18, `position_z`=-64.0933 WHERE `guid`=87903;

-- Vekniss Soldier (Entry: 15229, Guid: 87901) - DISTANCE 34.4679
UPDATE `creature` SET `position_x`=-7955.62, `position_y`=1322.46, `position_z`=-90.46 WHERE `guid`=87901;

-- Vekniss Warrior (Entry: 15230, Guid: 302242) - DISTANCE 73.65
UPDATE `creature` SET `position_x`=-8362.54, `position_y`=1832.81, `position_z`=0.789512 WHERE `guid`=302242;

-- Sludge Belcher (Entry: 16029, Guid: 88722) - DISTANCE 83.2196
UPDATE `creature` SET `position_x`=3048.88, `position_y`=-3242.07, `position_z`=293.346 WHERE `guid`=88722;

-- Infectious Skitterer (Entry: 15977, Guid: 302442) - DISTANCE 97.2713
UPDATE `creature` SET `position_x`=3383.74, `position_y`=-3689.38, `position_z`=259.081 WHERE `guid`=302442;

-- Spirit of Maraudos (Entry: 12242, Guid: 54684) - DISTANCE 27.2685
UPDATE `creature` SET `position_x`=813.251, `position_y`=-485.585, `position_z`=-54.8048 WHERE `guid`=54684;

-- Cavern Lurker (Entry: 12223, Guid: 54652) - DISTANCE 26.2264
UPDATE `creature` SET `position_x`=756.757, `position_y`=-82.4439, `position_z`=-57.3813 WHERE `guid`=54652;

-- Scarlet Wizard (Entry: 4300, Guid: 39967) - DISTANCE 27.5701
UPDATE `creature` SET `position_x`=931.463, `position_y`=1438.92, `position_z`=18.6778 WHERE `guid`=39967;

-- Scarlet Myrmidon (Entry: 4295, Guid: 39965) - DISTANCE 58.6424
UPDATE `creature` SET `position_x`=891.195, `position_y`=1362.07, `position_z`=18.6779 WHERE `guid`=39965;

-- Stone Steward (Entry: 4860, Guid: 33512) - DISTANCE 27.8862
UPDATE `creature` SET `position_x`=64.324, `position_y`=239, `position_z`=-52.198 WHERE `guid`=33512;

-- Shrike Bat (Entry: 4861, Guid: 33523) - DISTANCE 49.9611
UPDATE `creature` SET `position_x`=-94.7018, `position_y`=350.589, `position_z`=-49.0758 WHERE `guid`=33523;

-- Heartrazor (Entry: 5934, Guid: 51821) - DISTANCE 41.3457
UPDATE `creature` SET `position_x`=-5183.81, `position_y`=-1170.22, `position_z`=45.1108 WHERE `guid`=51821;

-- Rabid Shadowhide Gnoll (Entry: 434, Guid: 10053) - DISTANCE 87.7752
UPDATE `creature` SET `position_x`=-9292.01, `position_y`=-3240.25, `position_z`=100.649 WHERE `guid`=10053;

-- Redridge Mongrel (Entry: 423, Guid: 16349) - DISTANCE 25.8133
UPDATE `creature` SET `position_x`=-9515.88, `position_y`=-1927.06, `position_z`=76.0861 WHERE `guid`=16349;

-- Stonard Grunt (Entry: 866, Guid: 31849) - DISTANCE 43.1806
UPDATE `creature` SET `position_x`=-10452.4, `position_y`=-3172.52, `position_z`=20.1837 WHERE `guid`=31849;

-- Stonard Grunt (Entry: 866, Guid: 31852) - DISTANCE 28.8528
UPDATE `creature` SET `position_x`=-10464.4, `position_y`=-3171.79, `position_z`=20.1788 WHERE `guid`=31852;

-- Stonard Scout (Entry: 861, Guid: 38775) - DISTANCE 205.705
UPDATE `creature` SET `position_x`=-10390.5, `position_y`=-2693.75, `position_z`=21.6787 WHERE `guid`=38775;

-- Stonard Explorer (Entry: 862, Guid: 38818) - DISTANCE 61.531
UPDATE `creature` SET `position_x`=-10000.3, `position_y`=-3495.59, `position_z`=23.9655 WHERE `guid`=38818;

-- Stonard Scout (Entry: 861, Guid: 38885) - DISTANCE 331.071
UPDATE `creature` SET `position_x`=-10519.6, `position_y`=-3003.42, `position_z`=21.6777 WHERE `guid`=38885;

-- Hooktooth Frenzy (Entry: 11374, Guid: 49726) - DISTANCE 26.1901
UPDATE `creature` SET `position_x`=-11673, `position_y`=-1622.38, `position_z`=8.63866 WHERE `guid`=49726;

-- Tormented Spirit (Entry: 1533, Guid: 49222) - DISTANCE 41.7437
UPDATE `creature` SET `position_x`=2894.92, `position_y`=1012.92, `position_z`=108.181 WHERE `guid`=49222;

-- Scarlet Zealot (Entry: 1537, Guid: 28454) - DISTANCE 61.2224
UPDATE `creature` SET `position_x`=2509.13, `position_y`=-864.439, `position_z`=54.8237 WHERE `guid`=28454;

-- Deathguard Oliver (Entry: 1737, Guid: 28706) - DISTANCE 29.7809
UPDATE `creature` SET `position_x`=1799.53, `position_y`=1603.17, `position_z`=103.109 WHERE `guid`=28706;

-- Deathguard Terrence (Entry: 1738, Guid: 29779) - DISTANCE 83.7968
UPDATE `creature` SET `position_x`=2050.22, `position_y`=161.417, `position_z`=33.8209 WHERE `guid`=29779;

-- Apothecary Katrina (Entry: 5732, Guid: 31872) - DISTANCE 44.9962
UPDATE `creature` SET `position_x`=1535.91, `position_y`=275.839, `position_z`=-62.1765 WHERE `guid`=31872;

-- Sahvan Bloodshadow (Entry: 2314, Guid: 31919) - DISTANCE 53.9059
UPDATE `creature` SET `position_x`=2287.42, `position_y`=395.81, `position_z`=34.0751 WHERE `guid`=31919;

-- Rotting Ancestor (Entry: 1530, Guid: 31933) - DISTANCE 23.0986
UPDATE `creature` SET `position_x`=2937.72, `position_y`=603.598, `position_z`=92.0832 WHERE `guid`=31933;

-- Deathguard Lundmark (Entry: 5725, Guid: 32028) - DISTANCE 110.02
UPDATE `creature` SET `position_x`=2257.14, `position_y`=494.395, `position_z`=34.1876 WHERE `guid`=32028;

-- Scarlet Zealot (Entry: 1537, Guid: 33699) - DISTANCE 40.6983
UPDATE `creature` SET `position_x`=2490.5, `position_y`=-897.067, `position_z`=59.7591 WHERE `guid`=33699;

-- Undercity Guardian (Entry: 5624, Guid: 34103) - DISTANCE 29.8849
UPDATE `creature` SET `position_x`=1766.93, `position_y`=187.42, `position_z`=-62.177 WHERE `guid`=34103;

-- Scarlet Missionary (Entry: 1536, Guid: 37880) - DISTANCE 22.9189
UPDATE `creature` SET `position_x`=1901.81, `position_y`=901.916, `position_z`=29.3636 WHERE `guid`=37880;

-- Vile Fin Minor Oracle (Entry: 1544, Guid: 37899) - DISTANCE 34.8538
UPDATE `creature` SET `position_x`=2488.02, `position_y`=1718.95, `position_z`=24.1242 WHERE `guid`=37899;

-- Apothecary Lycanus (Entry: 5733, Guid: 38093) - DISTANCE 33.2439
UPDATE `creature` SET `position_x`=1479.41, `position_y`=372.664, `position_z`=-62.1858 WHERE `guid`=38093;

-- Susan Tillinghast (Entry: 2802, Guid: 38101) - DISTANCE 105.48
UPDATE `creature` SET `position_x`=1378.64, `position_y`=55.965, `position_z`=-62.2767 WHERE `guid`=38101;

-- Vile Fin Muckdweller (Entry: 1545, Guid: 38276) - DISTANCE 25.5782
UPDATE `creature` SET `position_x`=3013.64, `position_y`=-330.231, `position_z`=7.41186 WHERE `guid`=38276;

-- Hamlin Atkins (Entry: 3547, Guid: 38292) - DISTANCE 60.5605
UPDATE `creature` SET `position_x`=2310.18, `position_y`=397.315, `position_z`=33.9347 WHERE `guid`=38292;

-- Wandering Spirit (Entry: 1532, Guid: 38393) - DISTANCE 32.782
UPDATE `creature` SET `position_x`=2064.66, `position_y`=-392.215, `position_z`=37.7685 WHERE `guid`=38393;

-- Morley Bates (Entry: 4571, Guid: 38421) - DISTANCE 70.0297
UPDATE `creature` SET `position_x`=1759.66, `position_y`=131.193, `position_z`=-62.297 WHERE `guid`=38421;

-- Ressan the Needler (Entry: 10357, Guid: 42141) - DISTANCE 28.8223
UPDATE `creature` SET `position_x`=1776.26, `position_y`=1086.54, `position_z`=50.2121 WHERE `guid`=42141;

-- Fellicent's Shade (Entry: 10358, Guid: 42143) - DISTANCE 91.9406
UPDATE `creature` SET `position_x`=1998.46, `position_y`=-444.433, `position_z`=34.65 WHERE `guid`=42143;

-- Tirisfal Farmer (Entry: 1934, Guid: 42152) - DISTANCE 38.3305
UPDATE `creature` SET `position_x`=2320.31, `position_y`=1335.49, `position_z`=33.4583 WHERE `guid`=42152;

-- Vile Fin Minor Oracle (Entry: 1544, Guid: 43614) - DISTANCE 35.3869
UPDATE `creature` SET `position_x`=2579.05, `position_y`=1390.08, `position_z`=1.87354 WHERE `guid`=43614;

-- Muad (Entry: 1910, Guid: 43909) - DISTANCE 31.506
UPDATE `creature` SET `position_x`=2531.54, `position_y`=1394.83, `position_z`=3.20068 WHERE `guid`=43909;

-- Scarlet Warrior (Entry: 1535, Guid: 44259) - DISTANCE 49.1864
UPDATE `creature` SET `position_x`=2353.76, `position_y`=1577.24, `position_z`=33.9528 WHERE `guid`=44259;

-- Rot Hide Graverobber (Entry: 1941, Guid: 44602) - DISTANCE 35.9481
UPDATE `creature` SET `position_x`=2553.74, `position_y`=613.883, `position_z`=25.5977 WHERE `guid`=44602;

-- Rot Hide Mongrel (Entry: 1675, Guid: 44615) - DISTANCE 106.991
UPDATE `creature` SET `position_x`=2707.7, `position_y`=386.022, `position_z`=26.4345 WHERE `guid`=44615;

-- Rot Hide Mongrel (Entry: 1675, Guid: 44682) - DISTANCE 77.4417
UPDATE `creature` SET `position_x`=2778.66, `position_y`=436.464, `position_z`=19.1103 WHERE `guid`=44682;

-- Scarlet Preserver (Entry: 4280, Guid: 44787) - DISTANCE 62.9511
UPDATE `creature` SET `position_x`=2938.72, `position_y`=-700.863, `position_z`=148.848 WHERE `guid`=44787;

-- Scarlet Preserver (Entry: 4280, Guid: 44904) - DISTANCE 47.6004
UPDATE `creature` SET `position_x`=2921.4, `position_y`=-666.92, `position_z`=141.957 WHERE `guid`=44904;

-- Scarlet Warrior (Entry: 1535, Guid: 44909) - DISTANCE 40.9654
UPDATE `creature` SET `position_x`=2385.62, `position_y`=1323.61, `position_z`=33.9811 WHERE `guid`=44909;

-- Thurman Agamand (Entry: 1656, Guid: 44988) - DISTANCE 61.9114
UPDATE `creature` SET `position_x`=2878.92, `position_y`=1073.58, `position_z`=109.379 WHERE `guid`=44988;

-- Hungering Dead (Entry: 1527, Guid: 45120) - DISTANCE 36.4985
UPDATE `creature` SET `position_x`=2562.26, `position_y`=-82.1759, `position_z`=28.055 WHERE `guid`=45120;

-- Rotting Dead (Entry: 1525, Guid: 45147) - DISTANCE 29.4116
UPDATE `creature` SET `position_x`=2251.14, `position_y`=642.057, `position_z`=24.8747 WHERE `guid`=45147;

-- Rotting Dead (Entry: 1525, Guid: 45178) - DISTANCE 72.5023
UPDATE `creature` SET `position_x`=2200.64, `position_y`=558.809, `position_z`=31.0019 WHERE `guid`=45178;

-- Green Sludge (Entry: 2655, Guid: 92995) - DISTANCE 38.1888
UPDATE `creature` SET `position_x`=362.092, `position_y`=-3869.86, `position_z`=106.015 WHERE `guid`=92995;

-- Vilebranch Headhunter (Entry: 2641, Guid: 93634) - DISTANCE 30.2651
UPDATE `creature` SET `position_x`=-295.688, `position_y`=-4087.87, `position_z`=152.484 WHERE `guid`=93634;

-- Vilebranch Headhunter (Entry: 2641, Guid: 93755) - DISTANCE 26.5515
UPDATE `creature` SET `position_x`=-345.444, `position_y`=-4114.75, `position_z`=151.954 WHERE `guid`=93755;

-- Stone Fury (Entry: 2258, Guid: 63913) - DISTANCE 28.8563
UPDATE `creature` SET `position_x`=652.451, `position_y`=-1464.72, `position_z`=77.6166 WHERE `guid`=63913;

-- Sri'skulk (Entry: 10359, Guid: 86604) - DISTANCE 20.1605
UPDATE `creature` SET `position_x`=2267.73, `position_y`=-948.026, `position_z`=77.5319 WHERE `guid`=86604;

-- Winterfall Shaman (Entry: 7439, Guid: 41029) - DISTANCE 28.2685
UPDATE `creature` SET `position_x`=6672.99, `position_y`=-5123.82, `position_z`=776.628 WHERE `guid`=41029;

-- Winterfall Den Watcher (Entry: 7440, Guid: 41044) - DISTANCE 74.5921
UPDATE `creature` SET `position_x`=6896.05, `position_y`=-5145.93, `position_z`=698.456 WHERE `guid`=41044;

-- High Chief Winterfall (Entry: 10738, Guid: 42315) - DISTANCE 21.3497
UPDATE `creature` SET `position_x`=6726.22, `position_y`=-5275.99, `position_z`=778.305 WHERE `guid`=42315;

-- Twilight Prophet (Entry: 15308, Guid: 300750) - DISTANCE 48.8713
UPDATE `creature` SET `position_x`=-6884.11, `position_y`=1685.24, `position_z`=4.14966 WHERE `guid`=300750;

-- Uruson (Entry: 14428, Guid: 46350) - DISTANCE 48.5908
UPDATE `creature` SET `position_x`=9816.84, `position_y`=355.442, `position_z`=1308.46 WHERE `guid`=46350;

-- Fury Shelda (Entry: 14431, Guid: 46352) - DISTANCE 21.6991
UPDATE `creature` SET `position_x`=10630.1, `position_y`=2031.82, `position_z`=1331.57 WHERE `guid`=46352;

-- Threggil (Entry: 14432, Guid: 46354) - DISTANCE 28.8454
UPDATE `creature` SET `position_x`=10115.9, `position_y`=1167.52, `position_z`=1314.17 WHERE `guid`=46354;

-- Alaindia (Entry: 3562, Guid: 49525) - DISTANCE 71.4446
UPDATE `creature` SET `position_x`=9745.69, `position_y`=2622.56, `position_z`=1334.35 WHERE `guid`=49525;

-- Wandering Forest Walker (Entry: 7584, Guid: 50798) - DISTANCE 32.6003
UPDATE `creature` SET `position_x`=-4500.91, `position_y`=-310.469, `position_z`=56.3275 WHERE `guid`=50798;

-- Wandering Forest Walker (Entry: 7584, Guid: 50799) - DISTANCE 32.3368
UPDATE `creature` SET `position_x`=-4593.05, `position_y`=1898.65, `position_z`=109.435 WHERE `guid`=50799;

-- Wandering Forest Walker (Entry: 7584, Guid: 50801) - DISTANCE 31.8991
UPDATE `creature` SET `position_x`=-5149.84, `position_y`=686.696, `position_z`=56.017 WHERE `guid`=50801;

-- Shatterspear Troll (Entry: 10919, Guid: 85556) - DISTANCE 135.25
UPDATE `creature` SET `position_x`=7483.99, `position_y`=-1538.9, `position_z`=160.299 WHERE `guid`=85556;

-- Eye of Naxxramas (Entry: 10411, Guid: 300837) - DISTANCE 30.0243
UPDATE `creature` SET `position_x`=3602.92, `position_y`=-3488.06, `position_z`=135.879 WHERE `guid`=300837;

-- Gordok Mage-Lord (Entry: 11444, Guid: 201698) - DISTANCE 91.6447
UPDATE `creature` SET `position_x`=386.408, `position_y`=340.569, `position_z`=2.865 WHERE `guid`=201698;

-- Spirestone Enforcer (Entry: 9199, Guid: 300743) - DISTANCE 34.838
UPDATE `creature` SET `position_x`=-36.8595, `position_y`=-487.712, `position_z`=29.3984 WHERE `guid`=300743;

-- Bloodaxe Veteran (Entry: 9583, Guid: 46656) - DISTANCE 26.6868
UPDATE `creature` SET `position_x`=-53.7135, `position_y`=-469.51, `position_z`=77.8413 WHERE `guid`=46656;

-- Warpwood Crusher (Entry: 13021, Guid: 300898) - DISTANCE 31.7512
UPDATE `creature` SET `position_x`=189.555, `position_y`=-424.202, `position_z`=-79.6913 WHERE `guid`=300898;

-- Warpwood Stomper (Entry: 11465, Guid: 300939) - DISTANCE 23.1702
UPDATE `creature` SET `position_x`=55.6736, `position_y`=-347.474, `position_z`=-4.05314 WHERE `guid`=300939;

-- Warlord Gorchuk (Entry: 15700, Guid: 111000) - DISTANCE 21.6113
UPDATE `creature` SET `position_x`=1580.67, `position_y`=-4203.17, `position_z`=41.6943 WHERE `guid`=111000;

-- Flesh Hunter (Entry: 15335, Guid: 301210) - DISTANCE 22.1786
UPDATE `creature` SET `position_x`=-8957.75, `position_y`=2062.7, `position_z`=21.3864 WHERE `guid`=301210;

-- Flesh Hunter (Entry: 15335, Guid: 301212) - DISTANCE 23.6245
UPDATE `creature` SET `position_x`=-8945.14, `position_y`=2024.45, `position_z`=21.4883 WHERE `guid`=301212;

-- Obsidian Destroyer (Entry: 15338, Guid: 301173) - DISTANCE 24.7636
UPDATE `creature` SET `position_x`=-9089.98, `position_y`=1758.47, `position_z`=21.4012 WHERE `guid`=301173;

-- Obsidian Destroyer (Entry: 15338, Guid: 301213) - DISTANCE 24.5767
UPDATE `creature` SET `position_x`=-8815.17, `position_y`=2174.1, `position_z`=21.3869 WHERE `guid`=301213;

-- Qiraji Swarmguard (Entry: 15343, Guid: 301050) - DISTANCE 24.0996
UPDATE `creature` SET `position_x`=-8704.12, `position_y`=1501.23, `position_z`=31.9074 WHERE `guid`=301050;

-- Qiraji Swarmguard (Entry: 15343, Guid: 301049) - DISTANCE 28.1327
UPDATE `creature` SET `position_x`=-8674.82, `position_y`=1545.76, `position_z`=31.9072 WHERE `guid`=301049;

-- Anubisath Guardian (Entry: 15355, Guid: 301167) - DISTANCE 42.8678
UPDATE `creature` SET `position_x`=-9306.39, `position_y`=1735.94, `position_z`=85.5565 WHERE `guid`=301167;

-- Anubisath Guardian (Entry: 15355, Guid: 301162) - DISTANCE 59.6829
UPDATE `creature` SET `position_x`=-9316.09, `position_y`=2059.03, `position_z`=85.5797 WHERE `guid`=301162;

-- Anubisath Guardian (Entry: 15355, Guid: 301163) - DISTANCE 55.9603
UPDATE `creature` SET `position_x`=-9252.1, `position_y`=1949.63, `position_z`=85.5559 WHERE `guid`=301163;

-- Anubisath Guardian (Entry: 15355, Guid: 301164) - DISTANCE 180.825
UPDATE `creature` SET `position_x`=-9370.13, `position_y`=1967.31, `position_z`=85.5561 WHERE `guid`=301164;

-- Anubisath Guardian (Entry: 15355, Guid: 301165) - DISTANCE 127.9
UPDATE `creature` SET `position_x`=-9522.85, `position_y`=1855.63, `position_z`=85.5569 WHERE `guid`=301165;

-- Anubisath Guardian (Entry: 15355, Guid: 301166) - DISTANCE 106.848
UPDATE `creature` SET `position_x`=-9367.43, `position_y`=1751.65, `position_z`=85.5567 WHERE `guid`=301166;

-- Anubisath Guardian (Entry: 15355, Guid: 301161) - DISTANCE 62.3427
UPDATE `creature` SET `position_x`=-9318.23, `position_y`=1894.67, `position_z`=85.5561 WHERE `guid`=301161;

-- Frostwolf Legionnaire (Entry: 12051, Guid: 301559) - DISTANCE 30.1124
UPDATE `creature` SET `position_x`=-932.92, `position_y`=-391.729, `position_z`=49.0348 WHERE `guid`=301559;

-- Dark Iron Ambassador (Entry: 6228, Guid: 300376) - DISTANCE 21.6424
UPDATE `creature` SET `position_x`=-698.351, `position_y`=559.918, `position_z`=-282.06 WHERE `guid`=300376;

-- Princess Tempestria (Entry: 14457, Guid: 301305) - DISTANCE 21.0009
UPDATE `creature` SET `position_x`=6497.36, `position_y`=-4051.48, `position_z`=658.47 WHERE `guid`=301305;

-- Meshlok the Harvester (Entry: 12237, Guid: 301710) - DISTANCE 26.2264
UPDATE `creature` SET `position_x`=756.757, `position_y`=-82.4439, `position_z`=-57.3813 WHERE `guid`=301710;

-- Sand Shark (Entry: 5435, Guid: 3514) - DISTANCE 29.2156
UPDATE `creature` SET `position_x`=3195.66, `position_y`=1723.26, `position_z`=-48.0417 WHERE `guid`=3514;

-- Sand Shark (Entry: 5435, Guid: 3515) - DISTANCE 30.4117
UPDATE `creature` SET `position_x`=3219.86, `position_y`=1066.66, `position_z`=-48.8948 WHERE `guid`=3515;

-- Sand Shark (Entry: 5435, Guid: 3518) - DISTANCE 31.8306
UPDATE `creature` SET `position_x`=1254.18, `position_y`=-5419.49, `position_z`=-52.4718 WHERE `guid`=3518;

-- Sand Shark (Entry: 5435, Guid: 3520) - DISTANCE 23.6292
UPDATE `creature` SET `position_x`=478.163, `position_y`=-5354.21, `position_z`=-43.7743 WHERE `guid`=3520;

-- Sand Shark (Entry: 5435, Guid: 3521) - DISTANCE 29.1417
UPDATE `creature` SET `position_x`=-348.067, `position_y`=-5577.97, `position_z`=-32.65 WHERE `guid`=3521;

-- Sand Shark (Entry: 5435, Guid: 3522) - DISTANCE 32.0907
UPDATE `creature` SET `position_x`=-608.189, `position_y`=-5817.86, `position_z`=-33.709 WHERE `guid`=3522;

-- Sand Shark (Entry: 5435, Guid: 3523) - DISTANCE 30.3414
UPDATE `creature` SET `position_x`=-1414.72, `position_y`=-5785.94, `position_z`=-18.2885 WHERE `guid`=3523;

-- Sand Shark (Entry: 5435, Guid: 3525) - DISTANCE 31.5451
UPDATE `creature` SET `position_x`=-1142.71, `position_y`=-4322.34, `position_z`=-7.51439 WHERE `guid`=3525;

-- Qiraji Scarab (Entry: 15316, Guid: 302348) - DISTANCE 20.1274
UPDATE `creature` SET `position_x`=-8942.15, `position_y`=1502.37, `position_z`=-92.8114 WHERE `guid`=302348;

-- Seasoned Legionnaire (Entry: 13329, Guid: 302070) - DISTANCE 30.1124
UPDATE `creature` SET `position_x`=-932.92, `position_y`=-391.729, `position_z`=49.0348 WHERE `guid`=302070;

-- Veteran Legionnaire (Entry: 13334, Guid: 302096) - DISTANCE 30.1124
UPDATE `creature` SET `position_x`=-932.92, `position_y`=-391.729, `position_z`=49.0348 WHERE `guid`=302096;

-- Champion Legionnaire (Entry: 13425, Guid: 302122) - DISTANCE 30.1124
UPDATE `creature` SET `position_x`=-932.92, `position_y`=-391.729, `position_z`=49.0348 WHERE `guid`=302122;

-- Unholy Axe (Entry: 16194, Guid: 127798) - DISTANCE 22.7451
UPDATE `creature` SET `position_x`=2711.64, `position_y`=-3157.39, `position_z`=267.522 WHERE `guid`=127798;

-- Stoneskin Gargoyle (Entry: 16168, Guid: 88094) - DISTANCE 24.5039
UPDATE `creature` SET `position_x`=2872.72, `position_y`=-3489.73, `position_z`=297.62 WHERE `guid`=88094;

-- Ancient Core Hound (Entry: 11673, Guid: 56864) - DISTANCE 32.2084
UPDATE `creature` SET `position_x`=733.284, `position_y`=-1027.08, `position_z`=-177.554 WHERE `guid`=56864;

-- Stone Steward (Entry: 4860, Guid: 28606) - DISTANCE 25.3807
UPDATE `creature` SET `position_x`=154.882, `position_y`=284.294, `position_z`=-26.582 WHERE `guid`=28606;

-- Stone Steward (Entry: 4860, Guid: 28609) - DISTANCE 27.8862
UPDATE `creature` SET `position_x`=64.324, `position_y`=239, `position_z`=-52.198 WHERE `guid`=28609;

-- Caer Darrow Citizen (Entry: 11277, Guid: 120) - DISTANCE 31.8787
UPDATE `creature` SET `position_x`=1174.25, `position_y`=-2610.72, `position_z`=72.8297 WHERE `guid`=120;

-- Caer Darrow Horseman (Entry: 11281, Guid: 130) - DISTANCE 79.4371
UPDATE `creature` SET `position_x`=1120.64, `position_y`=-2594.72, `position_z`=59.5809 WHERE `guid`=130;

-- Silithid Invader (Entry: 4131, Guid: 21301) - DISTANCE 65.9803
DELETE FROM `creature_movement` WHERE `id`=21301;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`, `path_id`) VALUES 
(21301, 1, -6495.35, -3367.55, -89.0774, 100, 0, 0, 0, 0),
(21301, 2, -6493.97, -3348.59, -92.5439, 100, 0, 0, 0, 0),
(21301, 3, -6495.18, -3334.86, -94.153, 100, 0, 0, 0, 0),
(21301, 4, -6496.86, -3323.53, -96.288, 100, 0, 0, 0, 0),
(21301, 5, -6504.16, -3314.49, -96.7209, 100, 0, 0, 0, 0),
(21301, 6, -6496.86, -3323.53, -96.288, 100, 0, 0, 0, 0),
(21301, 7, -6495.18, -3334.86, -94.153, 100, 0, 0, 0, 0),
(21301, 8, -6493.97, -3348.59, -92.5439, 100, 0, 0, 0, 0),
(21301, 9, -6495.35, -3367.55, -89.0774, 100, 0, 0, 0, 0),
(21301, 10, -6493.24, -3390.72, -81.2351, 100, 0, 0, 0, 0),
(21301, 11, -6487.62, -3414.51, -73.0746, 100, 0, 0, 0, 0),
(21301, 12, -6479.16, -3423.18, -70.6095, 100, 0, 0, 0, 0),
(21301, 13, -6470.08, -3433.21, -69.9093, 100, 0, 0, 0, 0),
(21301, 14, -6479.16, -3423.18, -70.6095, 100, 0, 0, 0, 0),
(21301, 15, -6487.62, -3414.51, -73.0746, 100, 0, 0, 0, 0),
(21301, 16, -6493.24, -3390.72, -81.2351, 100, 0, 0, 0, 0);

-- Bael'dun Foreman (Entry: 3375, Guid: 13630) - DISTANCE 22.0757
DELETE FROM `creature_movement` WHERE `id`=13630;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`, `path_id`) VALUES 
(13630, 1, -4127.55, -2205.4, 50.3081, 100, 0, 0, 0, 0),
(13630, 2, -4135.23, -2193.78, 50.5771, 100, 0, 0, 0, 0),
(13630, 3, -4127.55, -2205.4, 50.3081, 100, 0, 0, 0, 0),
(13630, 4, -4123.61, -2212.48, 50.3081, 100, 0, 0, 0, 0),
(13630, 5, -4122.99, -2223.7, 50.3081, 100, 0, 0, 0, 0),
(13630, 6, -4125.27, -2232.49, 50.2779, 100, 0, 0, 0, 0),
(13630, 7, -4133.66, -2234.24, 51.3354, 100, 0, 0, 0, 0),
(13630, 8, -4137.54, -2229.22, 51.3081, 100, 0, 0, 0, 0),
(13630, 9, -4140.75, -2227.05, 51.0874, 100, 0, 0, 0, 0),
(13630, 10, -4155.08, -2233.98, 52.1155, 100, 0, 0, 0, 0),
(13630, 11, -4165.56, -2233.08, 51.9106, 100, 0, 0, 0, 0),
(13630, 12, -4155.08, -2233.98, 52.1155, 100, 0, 0, 0, 0),
(13630, 13, -4140.75, -2227.05, 51.0874, 100, 0, 0, 0, 0),
(13630, 14, -4137.54, -2229.22, 51.3081, 100, 0, 0, 0, 0),
(13630, 15, -4133.66, -2234.24, 51.3354, 100, 0, 0, 0, 0),
(13630, 16, -4125.27, -2232.49, 50.2779, 100, 0, 0, 0, 0),
(13630, 17, -4122.99, -2223.7, 50.3081, 100, 0, 0, 0, 0),
(13630, 18, -4123.61, -2212.48, 50.3081, 100, 0, 0, 0, 0);

-- Prowler (Entry: 118, Guid: 80878) - DISTANCE 34.6983
DELETE FROM `creature_movement` WHERE `id`=80878;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`, `path_id`) VALUES 
(80878, 1, -9663.99, -1091.1, 42.6487, 3.85509, 0, 0, 0, 0),
(80878, 2, -9665.92, -1118.42, 40.462, 4.31454, 0, 0, 0, 0),
(80878, 3, -9688.89, -1137.12, 39.7716, 3.53503, 0, 0, 0, 0),
(80878, 4, -9721.8, -1129.75, 39.0381, 0.487688, 0, 0, 0, 0),
(80878, 5, -9710.44, -1109.61, 40.8079, 0.572118, 0, 0, 0, 0),
(80878, 6, -9689.68, -1084.73, 43.2639, 6.27215, 0, 0, 0, 0);

-- Noboru the Cudgel (Entry: 5477, Guid: 43588) - DISTANCE 54.1184
DELETE FROM `creature_movement_template` WHERE `entry`=5477;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`, `path_id`) VALUES 
(5477, 1, -10174.8, -3505.8, 23.7408, 100, 0, 0, 0, 0),
(5477, 2, -10199.3, -3489.02, 22.8962, 100, 0, 0, 0, 0),
(5477, 3, -10209, -3470.28, 23.3629, 100, 0, 0, 0, 0),
(5477, 4, -10218.2, -3447.07, 22.5072, 100, 0, 0, 0, 0),
(5477, 5, -10217.2, -3422.07, 20.8741, 100, 0, 0, 0, 0),
(5477, 6, -10212, -3382.25, 23.2532, 100, 0, 0, 0, 0),
(5477, 7, -10210.8, -3339.04, 24.305, 100, 0, 0, 0, 0),
(5477, 8, -10208.2, -3308.25, 22.0216, 100, 0, 0, 0, 0),
(5477, 9, -10212.2, -3288.99, 20.0313, 100, 0, 0, 0, 0),
(5477, 10, -10179, -3269.54, 22.2975, 100, 0, 0, 0, 0),
(5477, 11, -10151.5, -3240.29, 20.4441, 100, 0, 0, 0, 0),
(5477, 12, -10135.2, -3221.29, 22.1103, 100, 0, 0, 0, 0),
(5477, 13, -10111.2, -3191.96, 20.9952, 100, 0, 0, 0, 0),
(5477, 14, -10116.9, -3159.72, 23.3619, 100, 0, 0, 0, 0),
(5477, 15, -10152.5, -3146.05, 20.6287, 100, 0, 0, 0, 0),
(5477, 16, -10168.9, -3113.72, 22.3261, 100, 0, 0, 0, 0),
(5477, 17, -10202.7, -3103.91, 24.0405, 100, 0, 0, 0, 0),
(5477, 18, -10240.6, -3097.67, 21.9894, 100, 0, 0, 0, 0),
(5477, 19, -10282.7, -3092.74, 23.1742, 100, 0, 0, 0, 0),
(5477, 20, -10309.5, -3074.63, 23.089, 100, 0, 0, 0, 0),
(5477, 21, -10332, -3065.28, 23.2697, 100, 0, 0, 0, 0),
(5477, 22, -10319.3, -3044.58, 22.3082, 100, 0, 0, 0, 0),
(5477, 23, -10300.3, -3007.03, 21.1229, 100, 0, 0, 0, 0),
(5477, 24, -10294.1, -2991.93, 22.4369, 100, 0, 0, 0, 0),
(5477, 25, -10272.6, -2989.19, 22.0135, 100, 0, 0, 0, 0),
(5477, 26, -10239.6, -2988.48, 22.004, 100, 0, 0, 0, 0),
(5477, 27, -10219.9, -2974.81, 19.835, 100, 0, 0, 0, 0),
(5477, 28, -10189.1, -2962.12, 22.0984, 100, 0, 0, 0, 0),
(5477, 29, -10178.9, -2963.05, 23.438, 100, 0, 0, 0, 0),
(5477, 30, -10189.1, -2962.12, 22.0984, 100, 0, 0, 0, 0),
(5477, 31, -10219.9, -2974.81, 19.835, 100, 0, 0, 0, 0),
(5477, 32, -10239.5, -2988.48, 22.0182, 100, 0, 0, 0, 0),
(5477, 33, -10272.6, -2989.19, 22.0135, 100, 0, 0, 0, 0),
(5477, 34, -10294.1, -2991.93, 22.4369, 100, 0, 0, 0, 0),
(5477, 35, -10300.3, -3007.03, 21.1229, 100, 0, 0, 0, 0),
(5477, 36, -10319.3, -3044.58, 22.3082, 100, 0, 0, 0, 0),
(5477, 37, -10332, -3065.28, 23.2697, 100, 0, 0, 0, 0),
(5477, 38, -10309.5, -3074.63, 23.089, 100, 0, 0, 0, 0),
(5477, 39, -10282.7, -3092.74, 23.1742, 100, 0, 0, 0, 0),
(5477, 40, -10240.6, -3097.67, 21.9894, 100, 0, 0, 0, 0),
(5477, 41, -10202.7, -3103.91, 24.0405, 100, 0, 0, 0, 0),
(5477, 42, -10168.9, -3113.72, 22.3261, 100, 0, 0, 0, 0),
(5477, 43, -10152.5, -3146.05, 20.6287, 100, 0, 0, 0, 0),
(5477, 44, -10116.9, -3159.72, 23.3619, 100, 0, 0, 0, 0),
(5477, 45, -10111.2, -3191.96, 20.9952, 100, 0, 0, 0, 0),
(5477, 46, -10135.2, -3221.29, 22.1103, 100, 0, 0, 0, 0),
(5477, 47, -10151.5, -3240.29, 20.4441, 100, 0, 0, 0, 0),
(5477, 48, -10179, -3269.54, 22.2975, 100, 0, 0, 0, 0),
(5477, 49, -10212.2, -3288.99, 20.0313, 100, 0, 0, 0, 0),
(5477, 50, -10208.2, -3308.25, 22.0216, 100, 0, 0, 0, 0),
(5477, 51, -10210.8, -3339.04, 24.305, 100, 0, 0, 0, 0),
(5477, 52, -10212, -3382.25, 23.2532, 100, 0, 0, 0, 0),
(5477, 53, -10217.2, -3422.07, 20.7496, 100, 0, 0, 0, 0),
(5477, 54, -10218.3, -3447.07, 22.4278, 100, 0, 0, 0, 0),
(5477, 55, -10209, -3470.28, 23.3629, 100, 0, 0, 0, 0),
(5477, 56, -10199.3, -3489.02, 22.8962, 100, 0, 0, 0, 0);

-- Ancient Core Hound (Entry: 11673, Guid: 56854) - DISTANCE 25.5012
DELETE FROM `creature_movement` WHERE `id`=56854;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`, `path_id`) VALUES 
(56854, 1, 816.582, -641.068, -203.889, 100, 0, 0, 0, 0),
(56854, 2, 831.386, -627.893, -203.149, 100, 0, 0, 0, 0),
(56854, 3, 856.456, -617.906, -202.157, 100, 0, 0, 0, 0),
(56854, 4, 899.612, -613.543, -202.238, 100, 0, 0, 0, 0),
(56854, 5, 936.253, -612.5, -203.622, 100, 0, 0, 0, 0),
(56854, 6, 975.182, -641.047, -201.577, 100, 0, 0, 0, 0),
(56854, 7, 1002.31, -661.99, -194.192, 100, 0, 0, 0, 0),
(56854, 8, 1024.07, -684.312, -173.43, 100, 0, 0, 0, 0),
(56854, 9, 1042.02, -695.821, -163.758, 100, 0, 0, 0, 0),
(56854, 10, 1058.16, -706.078, -156.611, 100, 0, 0, 0, 0),
(56854, 11, 1068.57, -742.832, -151.733, 100, 0, 0, 0, 0),
(56854, 12, 1117.1, -744.479, -145.629, 100, 0, 0, 0, 0),
(56854, 13, 1149.46, -726.451, -133.804, 100, 0, 0, 0, 0),
(56854, 14, 1175.51, -702.176, -130.987, 100, 0, 0, 0, 0),
(56854, 15, 1200.5, -670.934, -128.545, 100, 0, 0, 0, 0),
(56854, 16, 1202.95, -639.398, -126.169, 100, 0, 0, 0, 0),
(56854, 17, 1188.3, -614.03, -121.882, 100, 0, 0, 0, 0),
(56854, 18, 1164.2, -595.404, -115.776, 100, 0, 0, 0, 0),
(56854, 19, 1155.21, -574.871, -113.377, 100, 0, 0, 0, 0),
(56854, 20, 1164.2, -595.404, -115.776, 100, 0, 0, 0, 0),
(56854, 21, 1188.3, -614.03, -121.882, 100, 0, 0, 0, 0),
(56854, 22, 1202.95, -639.398, -126.169, 100, 0, 0, 0, 0),
(56854, 23, 1200.5, -670.934, -128.545, 100, 0, 0, 0, 0),
(56854, 24, 1175.59, -702.081, -130.975, 100, 0, 0, 0, 0),
(56854, 25, 1149.46, -726.451, -133.804, 100, 0, 0, 0, 0),
(56854, 26, 1117.1, -744.479, -145.629, 100, 0, 0, 0, 0),
(56854, 27, 1068.57, -742.832, -151.733, 100, 0, 0, 0, 0),
(56854, 28, 1058.16, -706.078, -156.611, 100, 0, 0, 0, 0),
(56854, 29, 1042.02, -695.821, -163.758, 100, 0, 0, 0, 0),
(56854, 30, 1024.23, -684.475, -173.294, 100, 0, 0, 0, 0),
(56854, 31, 1002.31, -661.99, -194.192, 100, 0, 0, 0, 0),
(56854, 32, 975.182, -641.047, -201.577, 100, 0, 0, 0, 0),
(56854, 33, 936.253, -612.5, -203.622, 100, 0, 0, 0, 0),
(56854, 34, 899.612, -613.543, -202.238, 100, 0, 0, 0, 0),
(56854, 35, 856.456, -617.906, -202.157, 100, 0, 0, 0, 0),
(56854, 36, 831.386, -627.893, -203.149, 100, 0, 0, 0, 0);

-- Scarlet Warrior (Entry: 1535, Guid: 44918) - DISTANCE 149.38
DELETE FROM `creature_movement` WHERE `id`=44918;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`, `path_id`) VALUES 
(44918, 1, 2396.71, 1502.94, 33.0567, 100, 0, 0, 0, 0),
(44918, 2, 2402.5, 1551.13, 31.5294, 100, 0, 0, 0, 0),
(44918, 3, 2400.64, 1571.11, 31.5122, 100, 0, 0, 0, 0),
(44918, 4, 2405.7, 1592.94, 33.6022, 100, 0, 0, 0, 0),
(44918, 5, 2414.73, 1606.38, 33.4056, 100, 0, 0, 0, 0),
(44918, 6, 2425.73, 1627.86, 35.9604, 100, 0, 0, 0, 0),
(44918, 7, 2446.01, 1643.89, 33.7287, 100, 13000, 0, 0, 0),
(44918, 8, 2451.16, 1637.62, 33.512, 100, 0, 0, 0, 0),
(44918, 9, 2472.88, 1627.81, 33.4458, 100, 0, 0, 0, 0),
(44918, 10, 2502.6, 1586.71, 34.2942, 100, 0, 0, 0, 0),
(44918, 11, 2499.41, 1584.27, 34.8709, 100, 0, 0, 0, 0),
(44918, 12, 2494.74, 1553.71, 34.6261, 100, 0, 0, 0, 0),
(44918, 13, 2487.4, 1518.04, 33.4613, 100, 0, 0, 0, 0),
(44918, 14, 2491.3, 1505.02, 36.4851, 100, 15000, 0, 0, 0),
(44918, 15, 2484.01, 1507.95, 34.5797, 100, 0, 0, 0, 0),
(44918, 16, 2455.14, 1497.59, 33.7522, 100, 0, 0, 0, 0),
(44918, 17, 2403.67, 1488.76, 34.2789, 100, 0, 0, 0, 0),
(44918, 18, 2392.64, 1464.13, 34.1678, 100, 0, 0, 0, 0),
(44918, 19, 2390.42, 1471.93, 34.4384, 100, 0, 0, 0, 0);

-- Scarlet Convert (Entry: 1506, Guid: 44975) - DISTANCE 29.9439
UPDATE `creature` SET `wander_distance`=5, `movement_type`=1 WHERE `guid`=44975;
DELETE FROM `creature_movement` WHERE `id`=44975;
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `wander_distance`, `movement_type`, `spawntimesecsmin`, `spawntimesecsmax`) VALUES
(44653, 1506, 0, 1789.16, 1369.53, 85.7113, 3.59869, 8, 1, 180, 180);
UPDATE `creature` SET `wander_distance`=0, `movement_type`=2 WHERE `guid`=44515;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(44515, 1, 1944.528687, 1369.310425, 68.676140, 100.000000, 0, 0.000000, 0),
(44515, 2, 1954.217773, 1374.520508, 67.546379, 100.000000, 17000, 0.000000, 0),
(44515, 3, 1939.189209, 1366.704590, 68.061638, 100.000000, 0, 0.000000, 0),
(44515, 4, 1910.004883, 1335.126953, 78.326431, 100.000000, 0, 0.000000, 0),
(44515, 5, 1864.503052, 1335.863892, 74.553139, 100.000000, 0, 0.000000, 0),
(44515, 6, 1826.117188, 1319.148682, 88.945732, 100.000000, 0, 0.000000, 0),
(44515, 7, 1815.914307, 1330.373047, 87.664047, 100.000000, 0, 0.000000, 0),
(44515, 8, 1810.360229, 1352.966064, 85.576935, 100.000000, 0, 0.000000, 0),
(44515, 9, 1788.627930, 1354.599365, 88.504532, 100.000000, 0, 0.000000, 0),
(44515, 10, 1784.721313, 1351.442627, 89.129410, 100.000000, 0, 0.000000, 0),
(44515, 11, 1784.721313, 1351.442627, 89.129410, 1.343904, 15000, 0.000000, 0),
(44515, 12, 1785.008301, 1355.450684, 88.731018, 100.000000, 0, 0.000000, 0),
(44515, 13, 1777.365723, 1374.054443, 88.243141, 100.000000, 0, 0.000000, 0),
(44515, 14, 1778.391357, 1383.808472, 91.336678, 100.000000, 0, 0.000000, 0),
(44515, 15, 1787.051514, 1392.479858, 90.802132, 100.000000, 22000, 0.000000, 0),
(44515, 16, 1797.514771, 1394.219849, 85.094398, 100.000000, 0, 0.000000, 0),
(44515, 17, 1835.979614, 1399.418213, 80.089584, 100.000000, 0, 0.000000, 0),
(44515, 18, 1861.292603, 1405.598511, 81.655617, 100.000000, 300000, 10.000000, 0),
(44515, 19, 1865.988159, 1394.473999, 80.151260, 100.000000, 0, 0.000000, 0),
(44515, 20, 1898.799316, 1373.534668, 70.115738, 100.000000, 0, 0.000000, 0);

-- Thunder Bluff Reveler (Entry: 15719, Guid: 140068) - DISTANCE 89.1325
DELETE FROM `creature_movement` WHERE `id`=140068;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`, `path_id`) VALUES 
(140068, 1, -1248.53, 62.6843, 127.12, 100, 0, 0, 0, 0),
(140068, 2, -1255.16, 57.1051, 126.957, 100, 0, 0, 0, 0),
(140068, 3, -1264.68, 57.7782, 126.971, 100, 0, 0, 0, 0),
(140068, 4, -1269.16, 60.87, 127.151, 100, 0, 0, 0, 0),
(140068, 5, -1276.64, 63.7197, 128.29, 100, 0, 0, 0, 0),
(140068, 6, -1286.8, 62.4132, 128.557, 100, 0, 0, 0, 0),
(140068, 7, -1303.73, 60.0783, 128.573, 100, 0, 0, 0, 0),
(140068, 8, -1319.74, 56.2617, 129.036, 100, 0, 0, 0, 0),
(140068, 9, -1328.44, 50.3823, 129.036, 100, 0, 0, 0, 0),
(140068, 10, -1332.66, 40.1368, 129.076, 100, 0, 0, 0, 0),
(140068, 11, -1327.5, 25.6062, 129.253, 100, 0, 0, 0, 0),
(140068, 12, -1332.66, 40.1368, 129.076, 100, 0, 0, 0, 0),
(140068, 13, -1328.44, 50.3823, 129.036, 100, 0, 0, 0, 0),
(140068, 14, -1319.74, 56.2617, 129.036, 100, 0, 0, 0, 0),
(140068, 15, -1303.73, 60.0783, 128.573, 100, 0, 0, 0, 0),
(140068, 16, -1286.8, 62.4132, 128.557, 100, 0, 0, 0, 0),
(140068, 17, -1276.64, 63.7197, 128.29, 100, 0, 0, 0, 0),
(140068, 18, -1269.17, 60.8769, 127.152, 100, 0, 0, 0, 0),
(140068, 19, -1264.68, 57.7782, 126.971, 100, 0, 0, 0, 0),
(140068, 20, -1255.16, 57.1051, 126.957, 100, 0, 0, 0, 0),
(140068, 21, -1248.53, 62.6843, 127.12, 100, 0, 0, 0, 0),
(140068, 22, -1242.99, 69.609, 128.003, 100, 0, 0, 0, 0),
(140068, 23, -1239.16, 74.9042, 129.171, 100, 0, 0, 0, 0),
(140068, 24, -1230.37, 82.3712, 130.49, 100, 0, 0, 0, 0),
(140068, 25, -1225.93, 87.7314, 131.294, 100, 0, 0, 0, 0),
(140068, 26, -1221.77, 91.7981, 132.092, 100, 0, 0, 0, 0),
(140068, 27, -1213.63, 100.682, 133.778, 100, 0, 0, 0, 0),
(140068, 28, -1205.57, 111.916, 134.431, 100, 0, 0, 0, 0),
(140068, 29, -1202.92, 119.533, 134.884, 100, 0, 0, 0, 0),
(140068, 30, -1192.27, 120.281, 135.206, 100, 0, 0, 0, 0),
(140068, 31, -1184.28, 120.872, 135.206, 100, 0, 0, 0, 0),
(140068, 32, -1172.45, 119.396, 135.106, 100, 0, 0, 0, 0),
(140068, 33, -1184.28, 120.872, 135.207, 100, 0, 0, 0, 0),
(140068, 34, -1192.27, 120.281, 135.206, 100, 0, 0, 0, 0),
(140068, 35, -1202.92, 119.533, 134.884, 100, 0, 0, 0, 0),
(140068, 36, -1205.57, 111.916, 134.43, 100, 0, 0, 0, 0),
(140068, 37, -1213.63, 100.682, 133.778, 100, 0, 0, 0, 0),
(140068, 38, -1221.77, 91.7981, 132.092, 100, 0, 0, 0, 0),
(140068, 39, -1225.93, 87.7314, 131.294, 100, 0, 0, 0, 0),
(140068, 40, -1230.37, 82.3712, 130.489, 100, 0, 0, 0, 0),
(140068, 41, -1239.16, 74.9042, 129.171, 100, 0, 0, 0, 0),
(140068, 42, -1242.99, 69.609, 128.003, 100, 0, 0, 0, 0);

-- Jade Ooze (Entry: 2656, Guid: 93068) - DISTANCE 54.7903
DELETE FROM `creature_movement` WHERE `id`=93068;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`, `path_id`) VALUES 
(93068, 1, 374.681, -3774.97, 106.557, 0, 0, 0, 0, 0),
(93068, 2, 363.041, -3792.43, 111.501, 0, 0, 0, 0, 0),
(93068, 3, 372.016, -3806.47, 111.995, 0, 0, 0, 0, 0),
(93068, 4, 381.269, -3822.9, 114.841, 0, 0, 0, 0, 0),
(93068, 5, 400.852, -3822.61, 118.554, 0, 0, 0, 0, 0),
(93068, 6, 416.804, -3816.89, 120.355, 0, 0, 0, 0, 0),
(93068, 7, 439.561, -3795.41, 120.812, 0, 0, 0, 0, 0),
(93068, 8, 421.674, -3776.19, 122.938, 0, 0, 0, 0, 0),
(93068, 9, 398.629, -3760.76, 126.066, 0, 0, 0, 0, 0),
(93068, 10, 384.108, -3758.34, 126.82, 0, 0, 0, 0, 0),
(93068, 11, 360.804, -3764.61, 126.81, 0, 0, 0, 0, 0),
(93068, 12, 353.279, -3775.15, 126.799, 0, 0, 0, 0, 0),
(93068, 13, 337.878, -3781.48, 127.028, 0, 0, 0, 0, 0),
(93068, 14, 348.228, -3797.66, 127.224, 0, 0, 0, 0, 0),
(93068, 15, 337.878, -3781.48, 127.028, 0, 0, 0, 0, 0),
(93068, 16, 353.279, -3775.15, 126.799, 0, 0, 0, 0, 0),
(93068, 17, 360.804, -3764.61, 126.81, 0, 0, 0, 0, 0),
(93068, 18, 384.108, -3758.34, 126.82, 0, 0, 0, 0, 0),
(93068, 19, 398.629, -3760.76, 126.066, 0, 0, 0, 0, 0),
(93068, 20, 421.674, -3776.19, 122.938, 0, 0, 0, 0, 0),
(93068, 21, 439.561, -3795.41, 120.812, 0, 0, 0, 0, 0),
(93068, 22, 416.804, -3816.89, 120.355, 0, 0, 0, 0, 0),
(93068, 23, 400.852, -3822.61, 118.554, 0, 0, 0, 0, 0),
(93068, 24, 381.269, -3822.9, 114.841, 0, 0, 0, 0, 0),
(93068, 25, 372.016, -3806.47, 111.995, 0, 0, 0, 0, 0),
(93068, 26, 363.041, -3792.43, 111.501, 0, 0, 0, 0, 0);

-- Vilebranch Headhunter (Entry: 2641, Guid: 93747) - DISTANCE 32.7668
DELETE FROM `creature_movement` WHERE `id`=93747;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`, `path_id`) VALUES 
(93747, 1, -358.029, -4117, 154.269, 0, 0, 0, 0, 0),
(93747, 2, -345.444, -4114.75, 151.954, 0, 0, 0, 0, 0),
(93747, 3, -334.77, -4118.18, 152.151, 0, 0, 0, 0, 0),
(93747, 4, -333.224, -4134.23, 152.062, 0, 0, 0, 0, 0),
(93747, 5, -339.837, -4147.75, 152.126, 0, 0, 0, 0, 0),
(93747, 6, -346.671, -4160.33, 152.126, 0, 0, 0, 0, 0),
(93747, 7, -345.942, -4177.11, 152.287, 0, 0, 0, 0, 0),
(93747, 8, -346.245, -4195.28, 152.224, 0, 0, 0, 0, 0),
(93747, 9, -345.794, -4206.44, 152.19, 0, 0, 0, 0, 0),
(93747, 10, -341.177, -4208.54, 152.065, 0, 0, 0, 0, 0),
(93747, 11, -337.748, -4206.13, 152.19, 0, 1000, 0, 0, 0),
(93747, 12, -341.177, -4208.54, 152.065, 0, 0, 0, 0, 0),
(93747, 13, -345.794, -4206.44, 152.19, 0, 0, 0, 0, 0),
(93747, 14, -346.245, -4195.28, 152.224, 0, 0, 0, 0, 0),
(93747, 15, -345.942, -4177.11, 152.287, 0, 0, 0, 0, 0),
(93747, 16, -346.671, -4160.33, 152.126, 0, 0, 0, 0, 0),
(93747, 17, -339.837, -4147.75, 152.126, 0, 0, 0, 0, 0),
(93747, 18, -333.224, -4134.23, 152.062, 0, 0, 0, 0, 0),
(93747, 19, -334.77, -4118.18, 152.151, 0, 0, 0, 0, 0),
(93747, 20, -345.444, -4114.75, 151.954, 0, 0, 0, 0, 0);

-- Plague Beast (Entry: 16034, Guid: 88204) - DISTANCE 41.6828
DELETE FROM `creature_movement` WHERE `id`=88204;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`, `path_id`) VALUES 
(88204, 1, 2846.58, -3686.15, 278.529, 100, 0, 0, 0, 0),
(88204, 2, 2827.88, -3686.89, 275.89, 100, 0, 0, 0, 0),
(88204, 3, 2846.58, -3686.15, 278.529, 100, 0, 0, 0, 0),
(88204, 4, 2858.94, -3691.24, 281.145, 100, 0, 0, 0, 0),
(88204, 5, 2865.73, -3705.73, 284.167, 100, 0, 0, 0, 0),
(88204, 6, 2882, -3708.83, 285.733, 100, 0, 0, 0, 0),
(88204, 7, 2894.65, -3698.18, 285.475, 100, 0, 0, 0, 0),
(88204, 8, 2900.62, -3683.83, 284.001, 100, 0, 0, 0, 0),
(88204, 9, 2897.48, -3671.88, 280.394, 100, 0, 0, 0, 0),
(88204, 10, 2884.27, -3662.16, 277.412, 100, 0, 0, 0, 0),
(88204, 11, 2867.52, -3655.97, 274.442, 100, 0, 0, 0, 0),
(88204, 12, 2884.27, -3662.16, 277.412, 100, 0, 0, 0, 0),
(88204, 13, 2897.48, -3671.88, 280.394, 100, 0, 0, 0, 0),
(88204, 14, 2900.62, -3683.83, 284.001, 100, 0, 0, 0, 0),
(88204, 15, 2894.85, -3698.01, 285.474, 100, 0, 0, 0, 0),
(88204, 16, 2882, -3708.83, 285.733, 100, 0, 0, 0, 0),
(88204, 17, 2865.73, -3705.73, 284.167, 100, 0, 0, 0, 0),
(88204, 18, 2858.94, -3691.24, 281.145, 100, 0, 0, 0, 0);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
