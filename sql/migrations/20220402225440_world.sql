DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220402225440');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220402225440');
-- Add your query below.


-- Marshal McBride (Entry: 197) (Distance: 0)
-- Old: .go -8902.59 -162.606 82.0223 0
-- New: .go -8902.59 -162.606 82.0223 0
UPDATE `creature` SET `position_x`=-8902.59, `position_y`=-162.606, `position_z`=82.0223, `orientation`=1.98766 WHERE `id`=197;
-- Remy "Two Times" (Entry: 241) (Distance: 0)
-- Old: .go -9496.32 72.8264 56.598 0
-- New: .go -9496.32 72.8264 56.598 0
UPDATE `creature` SET `position_x`=-9496.32, `position_y`=72.8264, `position_z`=56.598, `orientation`=6.23083 WHERE `id`=241;
-- Mazen Mac'Nadir (Entry: 338) (Distance: 9.91821e-05)
-- Old: .go -8855.71 822.812 98.4 0
-- New: .go -8855.71 822.812 98.4001 0
UPDATE `creature` SET `position_x`=-8855.71, `position_y`=822.812, `position_z`=98.4001, `orientation`=6.21337 WHERE `id`=338;
-- Barkeep Daniels (Entry: 346) (Distance: 0)
-- Old: .go -9211.5 -2145.7 64.4372 0
-- New: .go -9211.5 -2145.7 64.4372 0
UPDATE `creature` SET `position_x`=-9211.5, `position_y`=-2145.7, `position_z`=64.4372, `orientation`=3.45204 WHERE `id`=346;
-- Verner Osgood (Entry: 415) (Distance: 0.0416031)
-- Old: .go -9259.44 -2243.22 64.0584 0
-- New: .go -9259.44 -2243.22 64.0168 0
UPDATE `creature` SET `position_x`=-9259.44, `position_y`=-2243.22, `position_z`=64.0168, `orientation`=3.14159 WHERE `id`=415;
-- Alamar Grimm (Entry: 460) (Distance: 0)
-- Old: .go -6048.79 391.078 398.958 0
-- New: .go -6048.79 391.078 398.958 0
UPDATE `creature` SET `position_x`=-6048.79, `position_y`=391.078, `position_z`=398.958, `orientation`=3.63028 WHERE `id`=460;
-- Demisette Cloyce (Entry: 461) (Distance: 0.0195313)
-- Old: .go -8980 1041.09 101.487 0
-- New: .go -8980.02 1041.09 101.487 0
UPDATE `creature` SET `position_x`=-8980.02, `position_y`=1041.09, `position_z`=101.487, `orientation`=4.4855 WHERE `id`=461;
-- Lieutenant Doren (Entry: 469) (Distance: 0.0970993)
-- Old: .go -11296.9 -206.689 75.8833 0
-- New: .go -11296.9 -206.689 75.9804 0
UPDATE `creature` SET `position_x`=-11296.9, `position_y`=-206.689, `position_z`=75.9804, `orientation`=2.77507 WHERE `id`=469;
-- Benny Blaanco (Entry: 502) (Distance: 0.0690002)
-- Old: .go -9843.2 1285.32 41.9 0
-- New: .go -9843.2 1285.32 41.969 0
UPDATE `creature` SET `position_x`=-9843.2, `position_y`=1285.32, `position_z`=41.969, `orientation`=2.93215 WHERE `id`=502;
-- Nefaru (Entry: 534) (Distance: 297.301)
-- Add second spawn to pool.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (1603, 1, 'Duskwood - Nefaru', 0, 0, 0, 10);
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (4277, 1603, 50, 'Duskwood - Nefaru', 0, 0, 10);
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (4975, 1603, 50, 'Duskwood - Nefaru', 0, 0, 10);
REPLACE INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (4975, 534, 920, 0, 0, 0, -11143.4, -1165.06, 43.1388, 6.2319, 18000, 28800, 2.6, 100, 100, 1, 0, 0, 0, 10);
-- Kazon (Entry: 584) (Distance: 22.194)
-- Old: .go -8694.7 -2328.5 156.375 0
-- New: .go -8690.21 -2350.2 157.61 0
UPDATE `creature` SET `position_x`=-8690.21, `position_y`=-2350.2, `position_z`=157.61, `orientation`=2.49582, `wander_distance`=0, `movement_type`=0 WHERE `id`=584;
-- Rhahk'Zor (Entry: 644) (Distance: 5.12018)
-- Old: .go -192.915 -448.211 54.4339 36
-- New: .go -191.671 -453.176 54.5664 36
UPDATE `creature` SET `position_x`=-191.671, `position_y`=-453.176, `position_z`=54.5664, `orientation`=1.65806 WHERE `id`=644;
-- Hemet Nesingwary (Entry: 715) (Distance: 0)
-- Old: .go -11628.6 -54.5569 11.0223 0
-- New: .go -11628.6 -54.5569 11.0223 0
UPDATE `creature` SET `position_x`=-11628.6, `position_y`=-54.5569, `position_z`=11.0223, `orientation`=0.0698132 WHERE `id`=715;
-- Corporal Bluth (Entry: 734) (Distance: 0)
-- Old: .go -11295.8 -201.343 75.7853 0
-- New: .go -11295.8 -201.343 75.7853 0
UPDATE `creature` SET `position_x`=-11295.8, `position_y`=-201.343, `position_z`=75.7853, `orientation`=3.63028 WHERE `id`=734;
-- Grik'nir the Cold (Entry: 808) (Distance: 0.182983)
-- Old: .go -6508.82 300.758 370.346 0
-- New: .go -6508.82 300.758 370.529 0
UPDATE `creature` SET `position_x`=-6508.82, `position_y`=300.758, `position_z`=370.529, `orientation`=0 WHERE `id`=808;
-- Mai'Zoth (Entry: 818) (Distance: 0.17629)
-- Old: .go -12342.7 -1156.72 2.48357 0
-- New: .go -12342.7 -1156.72 2.65986 0
UPDATE `creature` SET `position_x`=-12342.7, `position_y`=-1156.72, `position_z`=2.65986, `orientation`=2.25147 WHERE `id`=818;
-- Branstock Khalder (Entry: 837) (Distance: 0)
-- Old: .go -6056.74 393.548 392.843 0
-- New: .go -6056.74 393.548 392.843 0
UPDATE `creature` SET `position_x`=-6056.74, `position_y`=393.548, `position_z`=392.843, `orientation`=3.68264 WHERE `id`=837;
-- Stonard Cartographer (Entry: 867) (Distance: 0.0833988)
-- Old: .go -10370.1 -3359.46 22.6802 0
-- New: .go -10370.1 -3359.46 22.7636 0
UPDATE `creature` SET `position_x`=-10370.1, `position_y`=-3359.46, `position_z`=22.7636, `orientation`=4.7473 WHERE `id`=867;
-- Stonard Shaman (Entry: 868) (Distance: 0.100586)
-- Old: .go -10857.2 -4096.36 21.9338 0
-- New: .go -10857.1 -4096.36 21.9338 0
UPDATE `creature` SET `position_x`=-10857.1, `position_y`=-4096.36, `position_z`=21.9338, `orientation`=1.3439 WHERE `id`=868;
-- Protector Leick (Entry: 876) (Distance: 0.101083)
-- Old: .go -10641.7 1093.46 34.043 0
-- New: .go -10641.6 1093.47 34.043 0
UPDATE `creature` SET `position_x`=-10641.6, `position_y`=1093.47, `position_z`=34.043, `orientation`=4.7473 WHERE `id`=876;
-- Keras Wolfheart (Entry: 907) (Distance: 0)
-- Old: .go 9975.14 2324.34 1330.87 1
-- New: .go 9975.14 2324.34 1330.87 1
UPDATE `creature` SET `position_x`=9975.14, `position_y`=2324.34, `position_z`=1330.87, `orientation`=0.0698132 WHERE `id`=907;
-- Rohh the Silent (Entry: 947) (Distance: 5.49294)
-- Old: .go -9011.48 -3214.74 108.153 0
-- New: .go -9009.88 -3209.49 108.372 0
UPDATE `creature` SET `position_x`=-9009.88, `position_y`=-3209.49, `position_z`=108.372, `orientation`=4.01426 WHERE `id`=947;
-- Morley Eberlein (Entry: 959) (Distance: 0)
-- Old: .go -9548.45 -709.983 90.5103 0
-- New: .go -9548.45 -709.983 90.5103 0
UPDATE `creature` SET `position_x`=-9548.45, `position_y`=-709.983, `position_z`=90.5103, `orientation`=3.63028 WHERE `id`=959;
-- Leech Widow (Entry: 1112) (Distance: 64.3377)
-- Add second spawn to pool.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (1608, 1, 'Wetlands - Leech Widow', 0, 0, 0, 10);
INSERT INTO `pool_creature_template` (`id`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (1112, 1608, 0, 'Wetlands - Leech Widow', 0, 0, 10);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (49359, 1112, 0, 0, 0, 0, -3843.37, -2338.62, 44.1079, 1.03681, 14400, 21600, 3, 100, 0, 1, 0, 0, 0, 10);
-- Angus Stern (Entry: 1141) (Distance: 0.0839996)
-- Old: .go -9080.1 823.091 108.419 0
-- New: .go -9080.1 823.091 108.503 0
UPDATE `creature` SET `position_x`=-9080.1, `position_y`=823.091, `position_z`=108.503, `orientation`=0.558505 WHERE `id`=1141;
-- Uthok (Entry: 1149) (Distance: 1.00136e-05)
-- Old: .go -12358 207.355 4.23162 0
-- New: .go -12358 207.355 4.23161 0
UPDATE `creature` SET `position_x`=-12358, `position_y`=207.355, `position_z`=4.23161, `orientation`=3.735 WHERE `id`=1149;
-- Grawmug (Entry: 1205) (Distance: 0.182007)
-- Old: .go -6151.45 -2952.78 411.501 0
-- New: .go -6151.45 -2952.78 411.683 0
UPDATE `creature` SET `position_x`=-6151.45, `position_y`=-2952.78, `position_z`=411.683, `orientation`=2.67035 WHERE `id`=1205;
-- Gnasher (Entry: 1206) (Distance: 0.085022)
-- Old: .go -6158.13 -2951.27 410.714 0
-- New: .go -6158.13 -2951.27 410.799 0
UPDATE `creature` SET `position_x`=-6158.13, `position_y`=-2951.27, `position_z`=410.799, `orientation`=6.24828 WHERE `id`=1206;
-- Brawler (Entry: 1207) (Distance: 0.18399)
-- Old: .go -6153.27 -2949.13 411.771 0
-- New: .go -6153.27 -2949.13 411.955 0
UPDATE `creature` SET `position_x`=-6153.27, `position_y`=-2949.13, `position_z`=411.955, `orientation`=4.36332 WHERE `id`=1207;
-- Chok'sul (Entry: 1210) (Distance: 1.57017)
-- Old: .go -4758 -4189.11 303.079 0
-- New: .go -4756.98 -4190.3 303.174 0
UPDATE `creature` SET `position_x`=-4756.98, `position_y`=-4190.3, `position_z`=303.174, `orientation`=1.19468 WHERE `id`=1210;
-- Alchemist Mallory (Entry: 1215) (Distance: 0.230469)
-- Old: .go -9056 152.629 115.116 0
-- New: .go -9056.23 152.629 115.116 0
UPDATE `creature` SET `position_x`=-9056.23, `position_y`=152.629, `position_z`=115.116, `orientation`=3.15905 WHERE `id`=1215;
-- Herbalist Pomeroy (Entry: 1218) (Distance: 0.330078)
-- Old: .go -9060 148.566 115.222 0
-- New: .go -9059.67 148.566 115.222 0
UPDATE `creature` SET `position_x`=-9059.67, `position_y`=148.566, `position_z`=115.222, `orientation`=1.6057 WHERE `id`=1218;
-- Gamili Frosthide (Entry: 1238) (Distance: 0)
-- Old: .go -5582.02 -423.1 397.409 0
-- New: .go -5582.02 -423.1 397.409 0
UPDATE `creature` SET `position_x`=-5582.02, `position_y`=-423.1, `position_z`=397.409, `orientation`=5.00909 WHERE `id`=1238;
-- Hegnar Rumbleshot (Entry: 1243) (Distance: 0)
-- Old: .go -6015.51 -201.511 407.437 0
-- New: .go -6015.51 -201.511 407.437 0
UPDATE `creature` SET `position_x`=-6015.51, `position_y`=-201.511, `position_z`=407.437, `orientation`=0.0349066 WHERE `id`=1243;
-- Vosur Brakthel (Entry: 1246) (Distance: 0)
-- Old: .go -4863.04 -1238.05 501.807 0
-- New: .go -4863.04 -1238.05 501.807 0
UPDATE `creature` SET `position_x`=-4863.04, `position_y`=-1238.05, `position_z`=501.807, `orientation`=2.19911 WHERE `id`=1246;
-- Quarrymaster Thesten (Entry: 1256) (Distance: 0)
-- Old: .go -5676.31 -1604.09 383.388 0
-- New: .go -5676.31 -1604.09 383.388 0
UPDATE `creature` SET `position_x`=-5676.31, `position_y`=-1604.09, `position_z`=383.388, `orientation`=2.19911 WHERE `id`=1256;
-- Ozzie Togglevolt (Entry: 1268) (Distance: 0.526723)
-- Old: .go -5498.69 -457.6 395.438 0
-- New: .go -5498.29 -457.874 395.644 0
UPDATE `creature` SET `position_x`=-5498.29, `position_y`=-457.874, `position_z`=395.644, `orientation`=0.10472 WHERE `id`=1268;
-- Lara Moore (Entry: 1295) (Distance: 0)
-- Old: .go -8777.41 646.162 97.3065 0
-- New: .go -8777.41 646.162 97.3065 0
UPDATE `creature` SET `position_x`=-8777.41, `position_y`=646.162, `position_z`=97.3065, `orientation`=5.00909 WHERE `id`=1295;
-- Jarel Moor (Entry: 1305) (Distance: 0.0703125)
-- Old: .go -8954 993.725 122.209 0
-- New: .go -8954.07 993.725 122.209 0
UPDATE `creature` SET `position_x`=-8954.07, `position_y`=993.725, `position_z`=122.209, `orientation`=0.698132 WHERE `id`=1305;
-- Charys Yserian (Entry: 1307) (Distance: 0.360352)
-- Old: .go -8995 948.303 117.279 0
-- New: .go -8994.64 948.303 117.279 0
UPDATE `creature` SET `position_x`=-8994.64, `position_y`=948.303, `position_z`=117.279, `orientation`=4.27606 WHERE `id`=1307;
-- Duncan Cullen (Entry: 1314) (Distance: 0)
-- Old: .go -8946.15 798.843 91.0251 0
-- New: .go -8946.15 798.843 91.0251 0
UPDATE `creature` SET `position_x`=-8946.15, `position_y`=798.843, `position_z`=91.0251, `orientation`=5.00909 WHERE `id`=1314;
-- Jessara Cordell (Entry: 1318) (Distance: 0.0996106)
-- Old: .go -8856 805.48 96.517 0
-- New: .go -8855.9 805.48 96.5175 0
UPDATE `creature` SET `position_x`=-8855.9, `position_y`=805.48, `position_z`=96.5175, `orientation`=5.20108 WHERE `id`=1318;
-- Mountaineer Stormpike (Entry: 1343) (Distance: 0)
-- Old: .go -4825.92 -2676.82 341.206 0
-- New: .go -4825.92 -2676.82 341.206 0
UPDATE `creature` SET `position_x`=-4825.92, `position_y`=-2676.82, `position_z`=341.206, `orientation`=3.68264 WHERE `id`=1343;
-- Gregory Ardus (Entry: 1348) (Distance: 0.000999451)
-- Old: .go -8634.22 886.742 103.266 0
-- New: .go -8634.22 886.742 103.265 0
UPDATE `creature` SET `position_x`=-8634.22, `position_y`=886.742, `position_z`=103.265, `orientation`=5.46288 WHERE `id`=1348;
-- Mudduk (Entry: 1382) (Distance: 0)
-- Old: .go -12358.8 220.811 4.14172 0
-- New: .go -12358.8 220.811 4.14172 0
UPDATE `creature` SET `position_x`=-12358.8, `position_y`=220.811, `position_z`=4.14172, `orientation`=5.00909 WHERE `id`=1382;
-- Brawn (Entry: 1385) (Distance: 0)
-- Old: .go -12398.2 195.151 2.43474 0
-- New: .go -12398.2 195.151 2.43474 0
UPDATE `creature` SET `position_x`=-12398.2, `position_y`=195.151, `position_z`=2.43474, `orientation`=0.0174533 WHERE `id`=1385;
-- Suzetta Gallina (Entry: 1431) (Distance: 0)
-- Old: .go -8884.88 675.547 100.263 0
-- New: .go -8884.88 675.547 100.263 0
UPDATE `creature` SET `position_x`=-8884.88, `position_y`=675.547, `position_z`=100.263, `orientation`=1.93732 WHERE `id`=1431;
-- Gunther Arcanus (Entry: 1497) (Distance: 0)
-- Old: .go 2574.63 -48.2606 33.7965 0
-- New: .go 2574.63 -48.2606 33.7965 0
UPDATE `creature` SET `position_x`=2574.63, `position_y`=-48.2606, `position_z`=33.7965, `orientation`=5.98165 WHERE `id`=1497;
-- Executor Zygand (Entry: 1515) (Distance: 0)
-- Old: .go 2278.08 295.587 36.8172 0
-- New: .go 2278.08 295.587 36.8172 0
UPDATE `creature` SET `position_x`=2278.08, `position_y`=295.587, `position_z`=36.8172, `orientation`=1.93732 WHERE `id`=1515;
-- Shellei Brondir (Entry: 1571) (Distance: 0)
-- Old: .go -3793.2 -782.052 9.09773 0
-- New: .go -3793.2 -782.052 9.09773 0
UPDATE `creature` SET `position_x`=-3793.2, `position_y`=-782.052, `position_z`=9.09773, `orientation`=5.27089 WHERE `id`=1571;
-- Bazil Thredd (Entry: 1716) (Distance: 12.1396)
-- Old: .go 89.5518 -136.922 -33.9396 34
-- New: .go 94.4828 -125.829 -33.9396 34
UPDATE `creature` SET `position_x`=94.4828, `position_y`=-125.829, `position_z`=-33.9396, `orientation`=1.16318 WHERE `id`=1716;
-- Warden Thelwater (Entry: 1719) (Distance: 0.0883698)
-- Old: .go -8799.62 828.323 97.6346 0
-- New: .go -8799.57 828.396 97.6346 0
UPDATE `creature` SET `position_x`=-8799.57, `position_y`=828.396, `position_z`=97.6346, `orientation`=0.968697 WHERE `id`=1719;
-- Zggi (Entry: 1733) (Distance: 0.0595703)
-- Old: .go -8984 1024.26 101.587 0
-- New: .go -8983.94 1024.26 101.587 0
UPDATE `creature` SET `position_x`=-8983.94, `position_y`=1024.26, `position_z`=101.587, `orientation`=0.383972 WHERE `id`=1733;
-- Deathguard Lawrence (Entry: 1743) (Distance: 0.027298)
-- Old: .go 2288.33 387.875 34.363 0
-- New: .go 2288.33 387.875 34.3357 0
UPDATE `creature` SET `position_x`=2288.33, `position_y`=387.875, `position_z`=34.3357, `orientation`=2.11185 WHERE `id`=1743;
-- Snarlmane (Entry: 1948) (Distance: 54.5022)
-- Old: .go 963.973 715.973 74.0867 0
-- New: .go 965.817 661.502 74.0867 0
UPDATE `creature` SET `position_x`=965.817, `position_y`=661.502, `position_z`=74.0867, `orientation`=1.64061 WHERE `id`=1948;
-- Garneg Charskull (Entry: 2108) (Distance: 0.551662)
-- Old: .go -3417.5 -1978.6 114.781 0
-- New: .go -3417.88 -1978.2 114.781 0
UPDATE `creature` SET `position_x`=-3417.88, `position_y`=-1978.2, `position_z`=114.781, `orientation`=1.06345 WHERE `id`=2108;
-- Faruza (Entry: 2114) (Distance: 1.5509)
-- Old: .go 2267.3 331.635 35.2078 0
-- New: .go 2267.3 331.635 36.7587 0
UPDATE `creature` SET `position_x`=2267.3, `position_y`=331.635, `position_z`=36.7587, `orientation`=6.24828 WHERE `id`=2114;
-- Abigail Shiel (Entry: 2118) (Distance: 1.2035)
-- Old: .go 2259.73 275.571 34.8637 0
-- New: .go 2259.73 275.571 36.0672 0
UPDATE `creature` SET `position_x`=2259.73, `position_y`=275.571, `position_z`=36.0672, `orientation`=2.68373 WHERE `id`=2118;
-- Archmage Ataeric (Entry: 2120) (Distance: 0)
-- Old: .go -133.014 787.237 67.4658 0
-- New: .go -133.014 787.237 67.4658 0
UPDATE `creature` SET `position_x`=-133.014, `position_y`=787.237, `position_z`=67.4658, `orientation`=0.0349066 WHERE `id`=2120;
-- Marion Call (Entry: 2130) (Distance: 0)
-- Old: .go 2271.04 242.997 41.1981 0
-- New: .go 2271.04 242.997 41.1981 0
UPDATE `creature` SET `position_x`=2271.04, `position_y`=242.997, `position_z`=41.1981, `orientation`=2.19911 WHERE `id`=2130;
-- Lady Moongazer (Entry: 2184) (Distance: 5.23358)
-- Old: .go 5664.94 126.206 32.2468 1
-- New: .go 5664.84 131.391 31.5425 1
UPDATE `creature` SET `position_x`=5664.84, `position_y`=131.391, `position_z`=31.5425, `orientation`=2.13656 WHERE `id`=2184;
-- Ravenclaw Regent (Entry: 2283) (Distance: 25.2709)
-- Old: .go -294.94 1055.08 116.108 0
-- New: .go -283.3 1032.65 115.948 0
UPDATE `creature` SET `position_x`=-283.3, `position_y`=1032.65, `position_z`=115.948, `orientation`=3.01942 WHERE `id`=2283;
-- Thomas Arlento (Entry: 2309) (Distance: 0.00100708)
-- Old: .go 2259.99 325.121 36.7954 0
-- New: .go 2259.99 325.122 36.7954 0
UPDATE `creature` SET `position_x`=2259.99, `position_y`=325.122, `position_z`=36.7954, `orientation`=5.27089 WHERE `id`=2309;
-- Darla Harris (Entry: 2432) (Distance: 0.0515003)
-- Old: .go -715.146 -512.134 26.6793 0
-- New: .go -715.146 -512.134 26.6278 0
UPDATE `creature` SET `position_x`=-715.146, `position_y`=-512.134, `position_z`=26.6278, `orientation`=4.7473 WHERE `id`=2432;
-- Clerk Horrace Whitesteed (Entry: 2448) (Distance: 10.4703)
-- Old: .go -504.812 122.342 59.1425 0
-- New: .go -503.69 111.932 59.1423 0
UPDATE `creature` SET `position_x`=-503.69, `position_y`=111.932, `position_z`=59.1423, `orientation`=2.0944 WHERE `id`=2448;
-- Randolph Montague (Entry: 2458) (Distance: 0)
-- Old: .go 1599.96 240.65 -52.0596 0
-- New: .go 1599.96 240.65 -52.0596 0
UPDATE `creature` SET `position_x`=1599.96, `position_y`=240.65, `position_z`=-52.0596, `orientation`=0.0872665 WHERE `id`=2458;
-- Mountaineer Thar (Entry: 2468) (Distance: 0.04599)
-- Old: .go -4483.21 -2693.89 266.07 0
-- New: .go -4483.21 -2693.89 266.116 0
UPDATE `creature` SET `position_x`=-4483.21, `position_y`=-2693.89, `position_z`=266.116, `orientation`=0.488692 WHERE `id`=2468;
-- Mountaineer Rharen (Entry: 2469) (Distance: 0.072998)
-- Old: .go -4446.8 -2676.68 266.058 0
-- New: .go -4446.8 -2676.68 266.131 0
UPDATE `creature` SET `position_x`=-4446.8, `position_y`=-2676.68, `position_z`=266.131, `orientation`=3.80482 WHERE `id`=2469;
-- Nimboya (Entry: 2497) (Distance: 1.00136e-05)
-- Old: .go -12348.2 168.519 3.16495 0
-- New: .go -12348.2 168.519 3.16496 0
UPDATE `creature` SET `position_x`=-12348.2, `position_y`=168.519, `position_z`=3.16496, `orientation`=0.645772 WHERE `id`=2497;
-- Kin'weelay (Entry: 2519) (Distance: 0)
-- Old: .go -12347.4 161.425 3.23635 0
-- New: .go -12347.4 161.425 3.23635 0
UPDATE `creature` SET `position_x`=-12347.4, `position_y`=161.425, `position_z`=3.23635, `orientation`=2.51327 WHERE `id`=2519;
-- Fleet Master Firallon (Entry: 2546) (Distance: 0.0845499)
-- Old: .go -15024.5 269.352 7.51611 0
-- New: .go -15024.5 269.352 7.60066 0
UPDATE `creature` SET `position_x`=-15024.5, `position_y`=269.352, `position_z`=7.60066, `orientation`=0.593412 WHERE `id`=2546;
-- Lord Falconcrest (Entry: 2597) (Distance: 0)
-- Old: .go -1709.68 -1803.8 101.791 0
-- New: .go -1709.68 -1803.8 101.791 0
UPDATE `creature` SET `position_x`=-1709.68, `position_y`=-1803.8, `position_z`=101.791, `orientation`=0.0698132 WHERE `id`=2597;
-- Shakes O'Breen (Entry: 2610) (Distance: 0.290439)
-- Old: .go -2086.35 -2028.79 3.18854 0
-- New: .go -2086.07 -2028.86 3.22088 0
UPDATE `creature` SET `position_x`=-2086.07, `position_y`=-2028.86, `position_z`=3.22088, `orientation`=2.67035 WHERE `id`=2610;
-- Kelsey Yance (Entry: 2664) (Distance: 1.00136e-05)
-- Old: .go -14331.2 419.298 6.71339 0
-- New: .go -14331.2 419.298 6.71338 0
UPDATE `creature` SET `position_x`=-14331.2, `position_y`=419.298, `position_z`=6.71338, `orientation`=2.60054 WHERE `id`=2664;
-- Namdo Bizzfizzle (Entry: 2683) (Distance: 0.374376)
-- Old: .go -4923.1 725.529 253.1 0
-- New: .go -4923.46 725.469 253.184 0
UPDATE `creature` SET `position_x`=-4923.46, `position_y`=725.469, `position_z`=253.184, `orientation`=0.0349066 WHERE `id`=2683;
-- Theldurin the Lost (Entry: 2785) (Distance: 0)
-- Old: .go -7164.42 -3357.41 244.933 0
-- New: .go -7164.42 -3357.41 244.933 0
UPDATE `creature` SET `position_x`=-7164.42, `position_y`=-3357.41, `position_z`=244.933, `orientation`=1.0472 WHERE `id`=2785;
-- Myizz Luckycatch (Entry: 2834) (Distance: 0)
-- Old: .go -14449.2 468.424 15.3565 0
-- New: .go -14449.2 468.424 15.3565 0
UPDATE `creature` SET `position_x`=-14449.2, `position_y`=468.424, `position_z`=15.3565, `orientation`=0.0872665 WHERE `id`=2834;
-- Haren Kanmae (Entry: 2839) (Distance: 0)
-- Old: .go -14340.6 414.604 6.71338 0
-- New: .go -14340.6 414.604 6.71338 0
UPDATE `creature` SET `position_x`=-14340.6, `position_y`=414.604, `position_z`=6.71338, `orientation`=2.19911 WHERE `id`=2839;
-- Kizz Bluntstrike (Entry: 2840) (Distance: 0)
-- Old: .go -14368.6 416.774 6.71338 0
-- New: .go -14368.6 416.774 6.71338 0
UPDATE `creature` SET `position_x`=-14368.6, `position_y`=416.774, `position_z`=6.71338, `orientation`=5.00909 WHERE `id`=2840;
-- Angrun (Entry: 2856) (Distance: 0.000991821)
-- Old: .go -12335.5 163.184 3.06546 0
-- New: .go -12335.5 163.185 3.06546 0
UPDATE `creature` SET `position_x`=-12335.5, `position_y`=163.185, `position_z`=3.06546, `orientation`=2.70526 WHERE `id`=2856;
-- Chief Archaeologist Greywhisker (Entry: 2912) (Distance: 0)
-- Old: .go 9641.92 2607.69 1337.38 1
-- New: .go 9641.92 2607.69 1337.38 1
UPDATE `creature` SET `position_x`=9641.92, `position_y`=2607.69, `position_z`=1337.38, `orientation`=0.0174533 WHERE `id`=2912;
-- Lanie Reed (Entry: 2941) (Distance: 0.052002)
-- Old: .go -6559.06 -1169.38 309.809 0
-- New: .go -6559.06 -1169.38 309.861 0
UPDATE `creature` SET `position_x`=-6559.06, `position_y`=-1169.38, `position_z`=309.861, `orientation`=0.10472 WHERE `id`=2941;
-- Bena Winterhoof (Entry: 3009) (Distance: 0)
-- Old: .go -1080.81 30.1093 140.91 1
-- New: .go -1080.81 30.1093 140.91 1
UPDATE `creature` SET `position_x`=-1080.81, `position_y`=30.1093, `position_z`=140.91, `orientation`=3.68264 WHERE `id`=3009;
-- Komin Winterhoof (Entry: 3013) (Distance: 0)
-- Old: .go -1131.18 -4.70871 143.644 1
-- New: .go -1131.18 -4.70871 143.644 1
UPDATE `creature` SET `position_x`=-1131.18, `position_y`=-4.70871, `position_z`=143.644, `orientation`=0.0872665 WHERE `id`=3013;
-- Kaga Mistrunner (Entry: 3025) (Distance: 0)
-- Old: .go -1182.53 -29.266 164.561 1
-- New: .go -1182.53 -29.266 164.561 1
UPDATE `creature` SET `position_x`=-1182.53, `position_y`=-29.266, `position_z`=164.561, `orientation`=3.52557 WHERE `id`=3025;
-- Tigor Skychaser (Entry: 3031) (Distance: 0)
-- Old: .go -980.775 269.899 138.084 1
-- New: .go -980.775 269.899 138.084 1
UPDATE `creature` SET `position_x`=-980.775, `position_y`=269.899, `position_z`=138.084, `orientation`=2.19911 WHERE `id`=3031;
-- Skorn Whitecloud (Entry: 3052) (Distance: 0)
-- Old: .go -2335.79 -354.018 -8.70432 1
-- New: .go -2335.79 -354.018 -8.70432 1
UPDATE `creature` SET `position_x`=-2335.79, `position_y`=-354.018, `position_z`=-8.70432, `orientation`=5.00909 WHERE `id`=3052;
-- Krang Stonehoof (Entry: 3063) (Distance: 0)
-- Old: .go -2347.98 -495.92 -8.96404 1
-- New: .go -2347.98 -495.92 -8.96404 1
UPDATE `creature` SET `position_x`=-2347.98, `position_y`=-495.92, `position_z`=-8.96404, `orientation`=5.43348 WHERE `id`=3063;
-- Orgnil Soulscar (Entry: 3142) (Distance: 0)
-- Old: .go 287.265 -4724.88 13.2142 1
-- New: .go 287.265 -4724.88 13.2142 1
UPDATE `creature` SET `position_x`=287.265, `position_y`=-4724.88, `position_z`=13.2142, `orientation`=5.27089 WHERE `id`=3142;
-- Zureetha Fargaze (Entry: 3145) (Distance: 0)
-- Old: .go -629.052 -4228.06 38.2334 1
-- New: .go -629.052 -4228.06 38.2334 1
UPDATE `creature` SET `position_x`=-629.052, `position_y`=-4228.06, `position_z`=38.2334, `orientation`=5.00909 WHERE `id`=3145;
-- Hin Denburg (Entry: 3150) (Distance: 0)
-- Old: .go 2054.57 241.679 99.8521 0
-- New: .go 2054.57 241.679 99.8521 0
UPDATE `creature` SET `position_x`=2054.57, `position_y`=241.679, `position_z`=99.8521, `orientation`=1.13446 WHERE `id`=3150;
-- Rwag (Entry: 3155) (Distance: 0)
-- Old: .go -588.703 -4144.94 41.1033 1
-- New: .go -588.703 -4144.94 41.1033 1
UPDATE `creature` SET `position_x`=-588.703, `position_y`=-4144.94, `position_z`=41.1033, `orientation`=3.63028 WHERE `id`=3155;
-- Flakk (Entry: 3168) (Distance: 0)
-- Old: .go 328.73 -4763.78 12.6269 1
-- New: .go 328.73 -4763.78 12.6269 1
UPDATE `creature` SET `position_x`=328.73, `position_y`=-4763.78, `position_z`=12.6269, `orientation`=2.0944 WHERE `id`=3168;
-- Master Gadrin (Entry: 3188) (Distance: 0)
-- Old: .go -825.636 -4920.76 19.7409 1
-- New: .go -825.636 -4920.76 19.7409 1
UPDATE `creature` SET `position_x`=-825.636, `position_y`=-4920.76, `position_z`=19.7409, `orientation`=2.86906 WHERE `id`=3188;
-- Rhinag (Entry: 3190) (Distance: 0)
-- Old: .go 1152.64 -4159 20.236 1
-- New: .go 1152.64 -4159 20.236 1
UPDATE `creature` SET `position_x`=1152.64, `position_y`=-4159, `position_z`=20.236, `orientation`=3.52557 WHERE `id`=3190;
-- Lorekeeper Raintotem (Entry: 3233) (Distance: 1.00136e-05)
-- Old: .go -1150.41 -1027.37 3.57968 1
-- New: .go -1150.41 -1027.37 3.57969 1
UPDATE `creature` SET `position_x`=-1150.41, `position_y`=-1027.37, `position_z`=3.57969, `orientation`=5.70723 WHERE `id`=3233;
-- Grisha (Entry: 3305) (Distance: 0.0573728)
-- Old: .go -6559.26 -1100.23 310.353 0
-- New: .go -6559.31 -1100.25 310.372 0
UPDATE `creature` SET `position_x`=-6559.31, `position_y`=-1100.25, `position_z`=310.372, `orientation`=0.10472 WHERE `id`=3305;
-- Mirket (Entry: 3325) (Distance: 0)
-- Old: .go 1834.66 -4362.52 -14.7825 1
-- New: .go 1834.66 -4362.52 -14.7825 1
UPDATE `creature` SET `position_x`=1834.66, `position_y`=-4362.52, `position_z`=-14.7825, `orientation`=2.0944 WHERE `id`=3325;
-- Gest (Entry: 3327) (Distance: 0)
-- Old: .go 1792.34 -4279.38 7.33733 1
-- New: .go 1792.34 -4279.38 7.33733 1
UPDATE `creature` SET `position_x`=1792.34, `position_y`=-4279.38, `position_z`=7.33733, `orientation`=4.7473 WHERE `id`=3327;
-- Grelkor (Entry: 3343) (Distance: 0.0488014)
-- Old: .go -1244.02 -323.795 61.0485 30
-- New: .go -1244.02 -323.795 60.9997 30
UPDATE `creature` SET `position_x`=-1244.02, `position_y`=-323.795, `position_z`=60.9997, `orientation`=5.21853 WHERE `id`=3343;
-- Kardris Dreamseeker (Entry: 3344) (Distance: 0)
-- Old: .go 1933.69 -4224.86 42.1782 1
-- New: .go 1933.69 -4224.86 42.1782 1
UPDATE `creature` SET `position_x`=1933.69, `position_y`=-4224.86, `position_z`=42.1782, `orientation`=0.0523599 WHERE `id`=3344;
-- Kiro (Entry: 3359) (Distance: 0.00976563)
-- Old: .go 1878.64 -4708.13 39.351 1
-- New: .go 1878.64 -4708.12 39.351 1
UPDATE `creature` SET `position_x`=1878.64, `position_y`=-4708.12, `position_z`=39.351, `orientation`=0.523599 WHERE `id`=3359;
-- Apothecary Helbrim (Entry: 3390) (Distance: 0)
-- Old: .go -424.542 -2589.88 95.9052 1
-- New: .go -424.542 -2589.88 95.9052 1
UPDATE `creature` SET `position_x`=-424.542, `position_y`=-2589.88, `position_z`=95.9052, `orientation`=6.23083 WHERE `id`=3390;
-- Zeal'aya (Entry: 3405) (Distance: 0)
-- Old: .go 1904.86 -4451.63 53.2776 1
-- New: .go 1904.86 -4451.63 53.2776 1
UPDATE `creature` SET `position_x`=1904.86, `position_y`=-4451.63, `position_z`=53.2776, `orientation`=3.68264 WHERE `id`=3405;
-- Zendo'jian (Entry: 3409) (Distance: 0)
-- Old: .go 2099.23 -4818.85 24.1587 1
-- New: .go 2099.23 -4818.85 24.1587 1
UPDATE `creature` SET `position_x`=2099.23, `position_y`=-4818.85, `position_z`=24.1587, `orientation`=3.68264 WHERE `id`=3409;
-- Sovik (Entry: 3413) (Distance: 0)
-- Old: .go 2036.63 -4739.49 29.2431 1
-- New: .go 2036.63 -4739.49 29.2431 1
UPDATE `creature` SET `position_x`=2036.63, `position_y`=-4739.49, `position_z`=29.2431, `orientation`=4.97965 WHERE `id`=3413;
-- General Twinbraid (Entry: 3414) (Distance: 0.405615)
-- Old: .go -4076.99 -2361.79 108.909 1
-- New: .go -4076.73 -2362.09 108.992 1
UPDATE `creature` SET `position_x`=-4076.73, `position_y`=-2362.09, `position_z`=108.992, `orientation`=5.14872 WHERE `id`=3414;
-- Tonga Runetotem (Entry: 3448) (Distance: 0)
-- Old: .go -544.992 -2672.77 95.8709 1
-- New: .go -544.992 -2672.77 95.8709 1
UPDATE `creature` SET `position_x`=-544.992, `position_y`=-2672.77, `position_z`=95.8709, `orientation`=1.37226 WHERE `id`=3448;
-- Cannoneer Smythe (Entry: 3454) (Distance: 4.52735)
-- Old: .go -2210 -3778 130.862 1
-- New: .go -2213.58 -3780.77 130.945 1
UPDATE `creature` SET `position_x`=-2213.58, `position_y`=-3780.77, `position_z`=130.945, `orientation`=5.25344 WHERE `id`=3454;
-- Cannoneer Whessan (Entry: 3455) (Distance: 1.66438)
-- Old: .go -2088.5 -3500.63 130 1
-- New: .go -2087.5 -3499.31 130.168 1
UPDATE `creature` SET `position_x`=-2087.5, `position_y`=-3499.31, `position_z`=130.168, `orientation`=0.802851 WHERE `id`=3455;
-- Selina Weston (Entry: 3548) (Distance: 0.0269256)
-- Old: .go 2330.42 242.518 28.4739 0
-- New: .go 2330.4 242.5 28.474 0
UPDATE `creature` SET `position_x`=2330.4, `position_y`=242.5, `position_z`=28.474, `orientation`=5.16617 WHERE `id`=3548;
-- Barithras Moonshade (Entry: 3583) (Distance: 0)
-- Old: .go 6427.71 497.148 8.10494 1
-- New: .go 6427.71 497.148 8.10494 1
UPDATE `creature` SET `position_x`=6427.71, `position_y`=497.148, `position_z`=8.10494, `orientation`=4.7473 WHERE `id`=3583;
-- Therysil (Entry: 3585) (Distance: 0.565941)
-- Old: .go 2677.34 394.207 69.8261 1
-- New: .go 2676.99 394.175 69.3826 1
UPDATE `creature` SET `position_x`=2676.99, `position_y`=394.175, `position_z`=69.3826, `orientation`=5.72468 WHERE `id`=3585;
-- Rarck (Entry: 3625) (Distance: 0.0223999)
-- Old: .go -1235.16 -332.302 60.2985 30
-- New: .go -1235.16 -332.302 60.2761 30
UPDATE `creature` SET `position_x`=-1235.16, `position_y`=-332.302, `position_z`=60.2761, `orientation`=2.96706 WHERE `id`=3625;
-- Steven Lohan (Entry: 3628) (Distance: 0.00976563)
-- Old: .go -9084 823.965 108.503 0
-- New: .go -9083.99 823.965 108.503 0
UPDATE `creature` SET `position_x`=-9083.99, `position_y`=823.965, `position_z`=108.503, `orientation`=0.401426 WHERE `id`=3628;
-- Ilkrud Magthrull (Entry: 3664) (Distance: 0.0319977)
-- Old: .go 2340.17 242.212 154.548 1
-- New: .go 2340.17 242.212 154.58 1
UPDATE `creature` SET `position_x`=2340.17, `position_y`=242.212, `position_z`=154.58, `orientation`=0.750492 WHERE `id`=3664;
-- Raene Wolfrunner (Entry: 3691) (Distance: 0.0830002)
-- Old: .go 2767.16 -411.611 111.466 1
-- New: .go 2767.16 -411.611 111.549 1
UPDATE `creature` SET `position_x`=2767.16, `position_y`=-411.611, `position_z`=111.549, `orientation`=2.0944 WHERE `id`=3691;
-- Tharnariun Treetender (Entry: 3701) (Distance: 0)
-- Old: .go 6437.48 397.48 11.7883 1
-- New: .go 6437.48 397.48 11.7883 1
UPDATE `creature` SET `position_x`=6437.48, `position_y`=397.48, `position_z`=11.7883, `orientation`=3.20848 WHERE `id`=3701;
-- Darkslayer Mordenthal (Entry: 3736) (Distance: 139.062)
-- Add second spawn to pool.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (1609, 1, 'Ashenvale - Darkslayer Mordenthal', 0, 0, 0, 10);
INSERT INTO `pool_creature_template` (`id`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (3736, 1609, 0, 'Ashenvale - Darkslayer Mordenthal', 0, 0, 10);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (32918, 3736, 0, 0, 0, 1, 1837.5, -2796.33, 51.7435, 3.63028, 300, 300, 0, 100, 0, 0, 0, 0, 0, 10);
-- Mountaineer Pebblebitty (Entry: 3836) (Distance: 0.314412)
-- Old: .go -6032.95 -2495.33 310.092 0
-- New: .go -6033.25 -2495.42 310.062 0
UPDATE `creature` SET `position_x`=-6033.25, `position_y`=-2495.42, `position_z`=310.062, `orientation`=5.8294 WHERE `id`=3836;
-- Vesprystus (Entry: 3838) (Distance: 0)
-- Old: .go 8640.58 841.118 23.3464 1
-- New: .go 8640.58 841.118 23.3464 1
UPDATE `creature` SET `position_x`=8640.58, `position_y`=841.118, `position_z`=23.3464, `orientation`=0.0523599 WHERE `id`=3838;
-- Caylais Moonfeather (Entry: 3841) (Distance: 0)
-- Old: .go 6343.2 561.651 16.1047 1
-- New: .go 6343.2 561.651 16.1047 1
UPDATE `creature` SET `position_x`=6343.2, `position_y`=561.651, `position_z`=16.1047, `orientation`=5.00909 WHERE `id`=3841;
-- Kayneth Stillwind (Entry: 3848) (Distance: 2.18391)
-- Old: .go 2954.25 -3215.41 169.205 1
-- New: .go 2953.94 -3217.57 169.289 1
UPDATE `creature` SET `position_x`=2953.94, `position_y`=-3217.57, `position_z`=169.289, `orientation`=2.89725 WHERE `id`=3848;
-- Illiyana (Entry: 3901) (Distance: 0.0499039)
-- Old: .go 2622.5 446.768 73.699 1
-- New: .go 2622.5 446.768 73.7489 1
UPDATE `creature` SET `position_x`=2622.5, `position_y`=446.768, `position_z`=73.7489, `orientation`=2.77507 WHERE `id`=3901;
-- Mavoris Cloudsbreak (Entry: 3942) (Distance: 16.3534)
-- Old: .go 1820.95 -2628.07 61.2105 1
-- New: .go 1816.25 -2612.44 62.2314 1
UPDATE `creature` SET `position_x`=1816.25, `position_y`=-2612.44, `position_z`=62.2314, `orientation`=6.16101 WHERE `id`=3942;
-- Dalria (Entry: 3954) (Distance: 0)
-- Old: .go 2669.6 -325.29 109.993 1
-- New: .go 2669.6 -325.29 109.993 1
UPDATE `creature` SET `position_x`=2669.6, `position_y`=-325.29, `position_z`=109.993, `orientation`=0.0174533 WHERE `id`=3954;
-- Grandpa Vishas (Entry: 3985) (Distance: 0)
-- Old: .go 884.315 -121.84 38.4745 0
-- New: .go 884.315 -121.84 38.4745 0
UPDATE `creature` SET `position_x`=884.315, `position_y`=-121.84, `position_z`=38.4745, `orientation`=0.628319 WHERE `id`=3985;
-- Galthuk (Entry: 4043) (Distance: 0)
-- Old: .go 2097.44 -4834.81 24.1196 1
-- New: .go 2097.44 -4834.81 24.1196 1
UPDATE `creature` SET `position_x`=2097.44, `position_y`=-4834.81, `position_z`=24.1196, `orientation`=0.0174533 WHERE `id`=4043;
-- Elissa Dumas (Entry: 4165) (Distance: 0)
-- Old: .go 9658.69 2508.7 1331.7 1
-- New: .go 9658.69 2508.7 1331.7 1
UPDATE `creature` SET `position_x`=9658.69, `position_y`=2508.7, `position_z`=1331.7, `orientation`=2.25147 WHERE `id`=4165;
-- Gerenzo Wrenchwhistle (Entry: 4202) (Distance: 88.5582)
-- Add second spawn to pool.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (1610, 1, 'Stonetalon Mountains - Gerenzo Wrenchwhistle', 0, 0, 0, 10);
INSERT INTO `pool_creature_template` (`id`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (4202, 1610, 0, 'Stonetalon Mountains - Gerenzo Wrenchwhistle', 0, 0, 10);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (29278, 4202, 0, 0, 0, 1, 1608.36, 185.02, 104.705, 3.56047, 300, 300, 0, 100, 0, 0, 0, 0, 0, 10);
-- Cyroen (Entry: 4220) (Distance: 0)
-- Old: .go 10171.2 2580.12 1326.05 1
-- New: .go 10171.2 2580.12 1326.05 1
UPDATE `creature` SET `position_x`=10171.2, `position_y`=2580.12, `position_z`=1326.05, `orientation`=4.79966 WHERE `id`=4220;
-- Voloren (Entry: 4222) (Distance: 0)
-- Old: .go 9836.05 2441.62 1315.85 1
-- New: .go 9836.05 2441.62 1315.85 1
UPDATE `creature` SET `position_x`=9836.05, `position_y`=2441.62, `position_z`=1315.85, `orientation`=2.25147 WHERE `id`=4222;
-- Daelyshia (Entry: 4267) (Distance: 0.0699997)
-- Old: .go 2828.38 -284.25 106.69 1
-- New: .go 2828.38 -284.25 106.76 1
UPDATE `creature` SET `position_x`=2828.38, `position_y`=-284.25, `position_z`=106.76, `orientation`=4.67748 WHERE `id`=4267;
-- Deathstalker Vincent (Entry: 4444) (Distance: 3.36316)
-- Old: .go -219.311 2147.68 80.9921 33
-- New: .go -217.991 2150.77 81.1327 33
UPDATE `creature` SET `position_x`=-217.991, `position_y`=2150.77, `position_z`=81.1327, `orientation`=2.79253 WHERE `id`=4444;
-- Fizzle Brassbolts (Entry: 4454) (Distance: 0)
-- Old: .go -6229.03 -3868.18 -58.6667 1
-- New: .go -6229.03 -3868.18 -58.6667 1
UPDATE `creature` SET `position_x`=-6229.03, `position_y`=-3868.18, `position_z`=-58.6667, `orientation`=6.11853 WHERE `id`=4454;
-- Gnome Pit Boss (Entry: 4495) (Distance: 0)
-- Old: .go -6223.58 -3846.19 -58.6667 1
-- New: .go -6223.58 -3846.19 -58.6667 1
UPDATE `creature` SET `position_x`=-6223.58, `position_y`=-3846.19, `position_z`=-58.6667, `orientation`=5.00909 WHERE `id`=4495;
-- Richard Kerwin (Entry: 4565) (Distance: 0)
-- Old: .go 1776.4 20.2543 -47.305 0
-- New: .go 1776.4 20.2543 -47.305 0
UPDATE `creature` SET `position_x`=1776.4, `position_y`=20.2543, `position_z`=-47.305, `orientation`=1.93732 WHERE `id`=4565;
-- Josef Gregorian (Entry: 4576) (Distance: 0)
-- Old: .go 1681.49 194.356 -62.0865 0
-- New: .go 1681.49 194.356 -62.0865 0
UPDATE `creature` SET `position_x`=1681.49, `position_y`=194.356, `position_z`=-62.0865, `orientation`=0.297927 WHERE `id`=4576;
-- Father Lankester (Entry: 4607) (Distance: 8.45758)
-- Old: .go 1784.45 401.799 -57.1312 0
-- New: .go 1776.28 399.612 -57.1312 0
UPDATE `creature` SET `position_x`=1776.28, `position_y`=399.612, `position_z`=-57.1312, `orientation`=3.40146 WHERE `id`=4607;
-- Wharfmaster Lozgil (Entry: 4631) (Distance: 0)
-- Old: .go -14298.2 539.636 8.9337 0
-- New: .go -14298.2 539.636 8.9337 0
UPDATE `creature` SET `position_x`=-14298.2, `position_y`=539.636, `position_z`=8.9337, `orientation`=4.79966 WHERE `id`=4631;
-- Zachariah Post (Entry: 4731) (Distance: 1.601)
-- Old: .go 2250.38 328.108 35.2725 0
-- New: .go 2250.38 328.108 36.8735 0
UPDATE `creature` SET `position_x`=2250.38, `position_y`=328.108, `position_z`=36.8735, `orientation`=5.67232 WHERE `id`=4731;
-- Kildar (Entry: 4752) (Distance: 0)
-- Old: .go 2151.36 -4654.14 50.1143 1
-- New: .go 2151.36 -4654.14 50.1143 1
UPDATE `creature` SET `position_x`=2151.36, `position_y`=-4654.14, `position_z`=50.1143, `orientation`=1.93732 WHERE `id`=4752;
-- Truk Wildbeard (Entry: 4782) (Distance: 0)
-- Old: .go 380.805 -2128.05 121.09 0
-- New: .go 380.805 -2128.05 121.09 0
UPDATE `creature` SET `position_x`=380.805, `position_y`=-2128.05, `position_z`=121.09, `orientation`=3.52557 WHERE `id`=4782;
-- Earthcaller Halmgar (Entry: 4842) (Distance: 2.17775)
-- Old: .go 2118.58 1695.32 80.3316 47
-- New: .go 2117.18 1693.67 80.5766 47
UPDATE `creature` SET `position_x`=2117.18, `position_y`=1693.67, `position_z`=80.5766, `orientation`=5.96903 WHERE `id`=4842;
-- Piter Verance (Entry: 4890) (Distance: 0)
-- Old: .go -3708.59 -4513.15 11.9936 1
-- New: .go -3708.59 -4513.15 11.9936 1
UPDATE `creature` SET `position_x`=-3708.59, `position_y`=-4513.15, `position_z`=11.9936, `orientation`=3.63028 WHERE `id`=4890;
-- Dwane Wertle (Entry: 4891) (Distance: 0)
-- Old: .go -3690.54 -4554.1 11.9936 1
-- New: .go -3690.54 -4554.1 11.9936 1
UPDATE `creature` SET `position_x`=-3690.54, `position_y`=-4554.1, `position_z`=11.9936, `orientation`=3.63028 WHERE `id`=4891;
-- Guard Byron (Entry: 4921) (Distance: 0.0719004)
-- Old: .go -3645.7 -4448.1 15.3483 1
-- New: .go -3645.7 -4448.1 15.4202 1
UPDATE `creature` SET `position_x`=-3645.7, `position_y`=-4448.1, `position_z`=15.4202, `orientation`=3.21141 WHERE `id`=4921;
-- Argos Nightwhisper (Entry: 4984) (Distance: 0.0195335)
-- Old: .go -8779 1093.35 92.611 0
-- New: .go -8778.98 1093.35 92.6113 0
UPDATE `creature` SET `position_x`=-8778.98, `position_y`=1093.35, `position_z`=92.6113, `orientation`=4.81711 WHERE `id`=4984;
-- Balos Jacken (Entry: 5089) (Distance: 0.0834007)
-- Old: .go -3934.05 -2869.68 51.2515 1
-- New: .go -3934.05 -2869.68 51.3349 1
UPDATE `creature` SET `position_x`=-3934.05, `position_y`=-2869.68, `position_z`=51.3349, `orientation`=5.41052 WHERE `id`=5089;
-- Combat Master Szigeti (Entry: 5090) (Distance: 0)
-- Old: .go -3655.62 -4503.49 9.54586 1
-- New: .go -3655.62 -4503.49 9.54586 1
UPDATE `creature` SET `position_x`=-3655.62, `position_y`=-4503.49, `position_z`=9.54586, `orientation`=5.52104 WHERE `id`=5090;
-- Captain Andrews (Entry: 5095) (Distance: 0)
-- Old: .go -3654.43 -4518.68 9.57484 1
-- New: .go -3654.43 -4518.68 9.57484 1
UPDATE `creature` SET `position_x`=-3654.43, `position_y`=-4518.68, `position_z`=9.57484, `orientation`=0.942478 WHERE `id`=5095;
-- Dolman Steelfury (Entry: 5102) (Distance: 0.387796)
-- Old: .go -4916.06 -996.259 501.997 0
-- New: .go -4916 -996.633 502.08 0
UPDATE `creature` SET `position_x`=-4916, `position_y`=-996.633, `position_z`=502.08, `orientation`=4.03171 WHERE `id`=5102;
-- Grenil Steelfury (Entry: 5103) (Distance: 0.65527)
-- Old: .go -4913.49 -998.036 501.997 0
-- New: .go -4914.14 -998.025 502.08 0
UPDATE `creature` SET `position_x`=-4914.14, `position_y`=-998.025, `position_z`=502.08, `orientation`=4.10152 WHERE `id`=5103;
-- Raena Flinthammer (Entry: 5108) (Distance: 0)
-- Old: .go -4872.03 -971.529 505.157 0
-- New: .go -4872.03 -971.529 505.157 0
UPDATE `creature` SET `position_x`=-4872.03, `position_y`=-971.529, `position_z`=505.157, `orientation`=3.63028 WHERE `id`=5108;
-- Barim Jurgenstaad (Entry: 5110) (Distance: 0)
-- Old: .go -4865.23 -865.331 502.275 0
-- New: .go -4865.23 -865.331 502.275 0
UPDATE `creature` SET `position_x`=-4865.23, `position_y`=-865.331, `position_z`=502.275, `orientation`=5.00909 WHERE `id`=5110;
-- Toldren Deepiron (Entry: 5143) (Distance: 0)
-- Old: .go -4625.99 -912.884 501.152 0
-- New: .go -4625.99 -912.884 501.152 0
UPDATE `creature` SET `position_x`=-4625.99, `position_y`=-912.884, `position_z`=501.152, `orientation`=6.17847 WHERE `id`=5143;
-- Nissa Firestone (Entry: 5150) (Distance: 0.00976563)
-- Old: .go -4876.63 -1149.14 512.52 0
-- New: .go -4876.62 -1149.14 512.52 0
UPDATE `creature` SET `position_x`=-4876.62, `position_y`=-1149.14, `position_z`=512.52, `orientation`=3.57792 WHERE `id`=5150;
-- Grimnur Stonebrand (Entry: 5161) (Distance: 0)
-- Old: .go -4605.72 -1093.62 511.731 0
-- New: .go -4605.72 -1093.62 511.731 0
UPDATE `creature` SET `position_x`=-4605.72, `position_y`=-1093.62, `position_z`=511.731, `orientation`=0.0523599 WHERE `id`=5161;
-- Qirot (Entry: 5350) (Distance: 166.622)
-- Add second spawn to pool.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (1604, 1, 'Feralas - Qirot', 0, 0, 0, 10);
INSERT INTO `pool_creature_template` (`id`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (5350, 1604, 0, 'Feralas - Qirot', 0, 0, 10);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (51692, 5350, 0, 0, 0, 1, -5376.99, 270.138, 25.7017, 5.82528, 18000, 28800, 7, 100, 0, 1, 0, 0, 0, 10);
-- Itharius (Entry: 5353) (Distance: 0)
-- Old: .go -10717.5 -2536.47 28.2923 0
-- New: .go -10717.5 -2536.47 28.2923 0
UPDATE `creature` SET `position_x`=-10717.5, `position_y`=-2536.47, `position_z`=28.2923, `orientation`=0.0349066 WHERE `id`=5353;
-- Galen Goodward (Entry: 5391) (Distance: 0)
-- Old: .go -9898.53 -3724.63 22.4164 0
-- New: .go -9898.53 -3724.63 22.4164 0
UPDATE `creature` SET `position_x`=-9898.53, `position_y`=-3724.63, `position_z`=22.4164, `orientation`=3.63028 WHERE `id`=5391;
-- Veyzhak the Cannibal (Entry: 5399) (Distance: 10.3403)
-- Old: .go -10301 -4028.2 -74.8377 0
-- New: .go -10291.1 -4030.77 -76.3541 0
UPDATE `creature` SET `position_x`=-10291.1, `position_y`=-4030.77, `position_z`=-76.3541, `orientation`=4.99076 WHERE `id`=5399;
-- Zekkis (Entry: 5400) (Distance: 29.8836)
-- Old: .go -10250.9 -4006.4 -99.7118 0
-- New: .go -10223.4 -4000.48 -109.798 0
UPDATE `creature` SET `position_x`=-10223.4, `position_y`=-4000.48, `position_z`=-109.798, `orientation`=1.16937 WHERE `id`=5400;
-- Infiltrator Marksen (Entry: 5416) (Distance: 0)
-- Old: .go -10422.5 -3238.74 20.2615 0
-- New: .go -10422.5 -3238.74 20.2615 0
UPDATE `creature` SET `position_x`=-10422.5, `position_y`=-3238.74, `position_z`=20.2615, `orientation`=4.79966 WHERE `id`=5416;
-- Deathstalker Zraedus (Entry: 5418) (Distance: 0.0830002)
-- Old: .go -10358 -1537.57 92.3121 0
-- New: .go -10358 -1537.57 92.3951 0
UPDATE `creature` SET `position_x`=-10358, `position_y`=-1537.57, `position_z`=92.3951, `orientation`=2.46091 WHERE `id`=5418;
-- Erika Tate (Entry: 5483) (Distance: 0)
-- Old: .go -8608.36 358.496 99.7064 0
-- New: .go -8608.36 358.496 99.7064 0
UPDATE `creature` SET `position_x`=-8608.36, `position_y`=358.496, `position_z`=99.7064, `orientation`=0.0698132 WHERE `id`=5483;
-- Brother Joshua (Entry: 5489) (Distance: 0)
-- Old: .go -8519.56 862.828 109.911 0
-- New: .go -8519.56 862.828 109.911 0
UPDATE `creature` SET `position_x`=-8519.56, `position_y`=862.828, `position_z`=109.911, `orientation`=5.41052 WHERE `id`=5489;
-- Ursula Deline (Entry: 5495) (Distance: 0.0498047)
-- Old: .go -8971 1029.9 101.487 0
-- New: .go -8971.05 1029.9 101.487 0
UPDATE `creature` SET `position_x`=-8971.05, `position_y`=1029.9, `position_z`=101.487, `orientation`=2.96706 WHERE `id`=5495;
-- Shylamiir (Entry: 5502) (Distance: 5.39064)
-- Old: .go -8721 1175.5 98.342 0
-- New: .go -8723.51 1180.27 98.4257 0
UPDATE `creature` SET `position_x`=-8723.51, `position_y`=1180.27, `position_z`=98.4257, `orientation`=4.2586 WHERE `id`=5502;
-- Theridran (Entry: 5505) (Distance: 9.91821e-05)
-- Old: .go -8741.68 1095.5 93.7959 0
-- New: .go -8741.68 1095.5 93.7958 0
UPDATE `creature` SET `position_x`=-8741.68, `position_y`=1095.5, `position_z`=93.7958, `orientation`=5.51524 WHERE `id`=5505;
-- Lilliam Sparkspindle (Entry: 5518) (Distance: 0.0302736)
-- Old: .go -8347 644.134 95.755 0
-- New: .go -8346.97 644.134 95.7549 0
UPDATE `creature` SET `position_x`=-8346.97, `position_y`=644.134, `position_z`=95.7549, `orientation`=3.83972 WHERE `id`=5518;
-- Billibub Cogspinner (Entry: 5519) (Distance: 0.000976563)
-- Old: .go -8342.25 638.323 95.4204 0
-- New: .go -8342.25 638.324 95.4204 0
UPDATE `creature` SET `position_x`=-8342.25, `position_y`=638.324, `position_z`=95.4204, `orientation`=3.7001 WHERE `id`=5519;
-- Grunt Zuul (Entry: 5546) (Distance: 0.0415001)
-- Old: .go -10425.2 -3242.71 20.303 0
-- New: .go -10425.2 -3242.71 20.2615 0
UPDATE `creature` SET `position_x`=-10425.2, `position_y`=-3242.71, `position_z`=20.2615, `orientation`=4.17134 WHERE `id`=5546;
-- Tok'Kar (Entry: 5592) (Distance: 0)
-- Old: .go -10859 -4088.09 22.3127 0
-- New: .go -10859 -4088.09 22.3127 0
UPDATE `creature` SET `position_x`=-10859, `position_y`=-4088.09, `position_z`=22.3127, `orientation`=0.0698132 WHERE `id`=5592;
-- Bartender Wental (Entry: 5620) (Distance: 0)
-- Old: .go -9210.83 -2150.71 64.4372 0
-- New: .go -9210.83 -2150.71 64.4372 0
UPDATE `creature` SET `position_x`=-9210.83, `position_y`=-2150.71, `position_z`=64.4372, `orientation`=2.99543 WHERE `id`=5620;
-- Female Human Captive (Entry: 5681) (Distance: 1.62212)
-- Old: .go 1734.67 379.246 -62.2881 0
-- New: .go 1736.19 379.807 -62.2078 0
UPDATE `creature` SET `position_x`=1736.19, `position_y`=379.807, `position_z`=-62.2078, `orientation`=3.83972 WHERE `id`=5681;
-- Godrick Farsan (Entry: 5693) (Distance: 0)
-- Old: .go 1782.99 59.5277 -61.4065 0
-- New: .go 1782.99 59.5277 -61.4065 0
UPDATE `creature` SET `position_x`=1782.99, `position_y`=59.5277, `position_z`=-61.4065, `orientation`=3.06759 WHERE `id`=5693;
-- Gerard Abernathy (Entry: 5696) (Distance: 0)
-- Old: .go 1653.95 367.087 -60.6816 0
-- New: .go 1653.95 367.087 -60.6816 0
UPDATE `creature` SET `position_x`=1653.95, `position_y`=367.087, `position_z`=-60.6816, `orientation`=4.88692 WHERE `id`=5696;
-- Shade of Eranikus (Entry: 5709) (Distance: 2.36755)
-- Old: .go -658.379 -35.7623 -90.8352 109
-- New: .go -659.994 -34.0331 -90.7518 109
UPDATE `creature` SET `position_x`=-659.994, `position_y`=-34.0331, `position_z`=-90.7518, `orientation`=1.5708 WHERE `id`=5709;
-- Malgin Barleybrew (Entry: 5848) (Distance: 1.71716)
-- Old: .go -4084.18 -2403.32 125.299 1
-- New: .go -4082.72 -2402.42 125.382 1
UPDATE `creature` SET `position_x`=-4082.72, `position_y`=-2402.42, `position_z`=125.382, `orientation`=2.00713 WHERE `id`=5848;
-- Captain Gerogg Hammertoe (Entry: 5851) (Distance: 21.8024)
-- Old: .go -4040.98 -2383.34 125.299 1
-- New: .go -4053.03 -2398.07 135.937 1
UPDATE `creature` SET `position_x`=-4053.03, `position_y`=-2398.07, `position_z`=135.937, `orientation`=2.21657 WHERE `id`=5851;
-- Geopriest Gukk'rok (Entry: 5863) (Distance: 190.325)
-- Add second spawn to pool.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (1611, 1, 'Barrens - Geopriest Gukk\'rok', 0, 0, 0, 10);
INSERT INTO `pool_creature_template` (`id`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (5863, 1611, 0, 'Barrens - Geopriest Gukk\'rok', 0, 0, 10);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (21011, 5863, 0, 0, 0, 1, -1862.42, -1938.14, 94.0575, 3.28122, 7200, 10800, 0, 100, 100, 0, 0, 0, 0, 10);
-- Thun'grim Firegaze (Entry: 5878) (Distance: 0.0219879)
-- Old: .go -437.62 -3176.26 211.385 1
-- New: .go -437.62 -3176.26 211.363 1
UPDATE `creature` SET `position_x`=-437.62, `position_y`=-3176.26, `position_z`=211.363, `orientation`=0.820305 WHERE `id`=5878;
-- Taskmaster Whipfang (Entry: 5932) (Distance: 96.5255)
-- Old: .go 1152.17 93.8365 -7.14718 1
-- New: .go 1117.12 183.364 1.42562 1
UPDATE `creature` SET `position_x`=1117.12, `position_y`=183.364, `position_z`=1.42562, `orientation`=4.20624 WHERE `id`=5932;
-- Remen Marcot (Entry: 6121) (Distance: 0)
-- Old: .go -9473.43 -8.58822 49.8779 0
-- New: .go -9473.43 -8.58822 49.8779 0
UPDATE `creature` SET `position_x`=-9473.43, `position_y`=-8.58822, `position_z`=49.8779, `orientation`=6.23083 WHERE `id`=6121;
-- Yorus Barleybrew (Entry: 6166) (Distance: 0)
-- Old: .go -9222.58 -2147.87 63.814 0
-- New: .go -9222.58 -2147.87 63.814 0
UPDATE `creature` SET `position_x`=-9222.58, `position_y`=-2147.87, `position_z`=63.814, `orientation`=4.53681 WHERE `id`=6166;
-- Crowd Pummeler 9-60 (Entry: 6229) (Distance: 1.75583)
-- Old: .go -890.879 360.872 -272.595 90
-- New: .go -889.137 360.668 -272.513 90
UPDATE `creature` SET `position_x`=-889.137, `position_y`=360.668, `position_z`=-272.513, `orientation`=6.24828 WHERE `id`=6229;
-- Gelihast (Entry: 6243) (Distance: 1.45056)
-- Old: .go -413.593 39.8474 -48.4051 48
-- New: .go -412.653 40.919 -48.1363 48
UPDATE `creature` SET `position_x`=-412.653, `position_y`=40.919, `position_z`=-48.1363, `orientation`=4.31096 WHERE `id`=6243;
-- Twiggy Flathead (Entry: 6248) (Distance: 0)
-- Old: .go -1686.14 -4323.04 4.28091 1
-- New: .go -1686.14 -4323.04 4.28091 1
UPDATE `creature` SET `position_x`=-1686.14, `position_y`=-4323.04, `position_z`=4.28091, `orientation`=5.33767 WHERE `id`=6248;
-- Acolyte Porena (Entry: 6267) (Distance: 3.40599)
-- Old: .go -8962.71 1043.58 53.548 0
-- New: .go -8960.56 1040.94 53.6312 0
UPDATE `creature` SET `position_x`=-8960.56, `position_y`=1040.94, `position_z`=53.6312, `orientation`=3.33358 WHERE `id`=6267;
-- Shoni the Shilent (Entry: 6579) (Distance: 0.000404358)
-- Old: .go -8391 634.764 94.89 0
-- New: .go -8391 634.764 94.8904 0
UPDATE `creature` SET `position_x`=-8391, `position_y`=634.764, `position_z`=94.8904, `orientation`=3.19395 WHERE `id`=6579;
-- Master Feardred (Entry: 6652) (Distance: 40.5062)
-- Old: .go 4521.84 -6398.31 125.474 1
-- New: .go 4483.09 -6405.86 134.54 1
UPDATE `creature` SET `position_x`=4483.09, `position_y`=-6405.86, `position_z`=134.54, `orientation`=4.06662 WHERE `id`=6652;
-- Gelkak Gyromast (Entry: 6667) (Distance: 0)
-- Old: .go 7744.51 -769.238 5.44451 1
-- New: .go 7744.51 -769.238 5.44451 1
UPDATE `creature` SET `position_x`=7744.51, `position_y`=-769.238, `position_z`=5.44451, `orientation`=3.89925 WHERE `id`=6667;
-- Innkeeper Keldamyr (Entry: 6736) (Distance: 0)
-- Old: .go 9802.21 982.608 1313.98 1
-- New: .go 9802.21 982.608 1313.98 1
UPDATE `creature` SET `position_x`=9802.21, `position_y`=982.608, `position_z`=1313.98, `orientation`=4.79966 WHERE `id`=6736;
-- Renzik "The Shiv" (Entry: 6946) (Distance: 0)
-- Old: .go -8819.92 362.534 109.604 0
-- New: .go -8819.92 362.534 109.604 0
UPDATE `creature` SET `position_x`=-8819.92, `position_y`=362.534, `position_z`=109.604, `orientation`=5.27089 WHERE `id`=6946;
-- Lucius (Entry: 6966) (Distance: 0)
-- Old: .go -9328.45 -2180.02 64.0383 0
-- New: .go -9328.45 -2180.02 64.0383 0
UPDATE `creature` SET `position_x`=-9328.45, `position_y`=-2180.02, `position_z`=64.0383, `orientation`=1.93732 WHERE `id`=6966;
-- Lord Sinslayer (Entry: 7017) (Distance: 90.237)
-- Old: .go 6807.76 -765.586 68.9631 1
-- New: .go 6769.52 -686.434 89.3443 1
UPDATE `creature` SET `position_x`=6769.52, `position_y`=-686.434, `position_z`=89.3443, `orientation`=0.59618 WHERE `id`=7017;
-- Digmaster Shovelphlange (Entry: 7057) (Distance: 202.538)
-- Add second spawn to pool.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (1605, 1, 'Uldaman (Outside) - Digmaster Shovelphlange', 0, 0, 0, 10);
INSERT INTO `pool_creature_template` (`id`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (7057, 1605, 0, 'Uldaman (Outside) - Digmaster Shovelphlange', 0, 0, 10);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (7886, 7057, 0, 0, 0, 0, -6156.52, -3105.69, 223.123, 4.45059, 37800, 57600, 0, 100, 0, 0, 0, 0, 0, 10);
-- Dessecus (Entry: 7104) (Distance: 172.713)
-- Old: .go 6277.47 -1679.4 432.518 1
-- New: .go 6445.77 -1715.5 418.31 1
UPDATE `creature` SET `position_x`=6445.77, `position_y`=-1715.5, `position_z`=418.31, `orientation`=2.07694 WHERE `id`=7104;
-- Chief Ukorz Sandscalp (Entry: 7267) (Distance: 1.21984)
-- Old: .go 1727.48 1017.35 54.9102 209
-- New: .go 1726.73 1018.31 54.9723 209
UPDATE `creature` SET `position_x`=1726.73, `position_y`=1018.31, `position_z`=54.9723, `orientation`=4.46804 WHERE `id`=7267;
-- Sandfury Executioner (Entry: 7274) (Distance: 3.59952)
-- Old: .go 1886.79 1286.76 44.185 209
-- New: .go 1886.8 1289.89 45.9625 209
UPDATE `creature` SET `position_x`=1886.8, `position_y`=1289.89, `position_z`=45.9625, `orientation`=3.38594 WHERE `id`=7274;
-- Dinita Stonemantle (Entry: 7292) (Distance: 6.47018)
-- Old: .go -4881.3 -981.426 504.024 0
-- New: .go -4886.97 -978.31 504.024 0
UPDATE `creature` SET `position_x`=-4886.97, `position_y`=-978.31, `position_z`=504.024, `orientation`=5.39307 WHERE `id`=7292;
-- Priestess A'moora (Entry: 7313) (Distance: 0)
-- Old: .go 9631.88 2550.45 1354.89 1
-- New: .go 9631.88 2550.45 1354.89 1
UPDATE `creature` SET `position_x`=9631.88, `position_y`=2550.45, `position_z`=1354.89, `orientation`=4.79966 WHERE `id`=7313;
-- Ragglesnout (Entry: 7354) (Distance: 88.0966)
-- Old: .go 2413.04 1025.87 37.8776 129
-- New: .go 2453.29 947.528 36.0121 129
UPDATE `creature` SET `position_x`=2453.29, `position_y`=947.528, `position_z`=36.0121, `orientation`=3.89208 WHERE `id`=7354;
-- Bengor (Entry: 7643) (Distance: 0)
-- Old: .go -10498.1 -3254.38 21.1127 0
-- New: .go -10498.1 -3254.38 21.1127 0
UPDATE `creature` SET `position_x`=-10498.1, `position_y`=-3254.38, `position_z`=21.1127, `orientation`=6.23083 WHERE `id`=7643;
-- Innkeeper Shyria (Entry: 7736) (Distance: 0)
-- Old: .go -4381.59 3289.45 13.6266 1
-- New: .go -4381.59 3289.45 13.6266 1
UPDATE `creature` SET `position_x`=-4381.59, `position_y`=3289.45, `position_z`=13.6266, `orientation`=0.0349066 WHERE `id`=7736;
-- Rockbiter (Entry: 7765) (Distance: 0)
-- Old: .go -3385.91 2495.84 23.5588 1
-- New: .go -3385.91 2495.84 23.5588 1
UPDATE `creature` SET `position_x`=-3385.91, `position_y`=2495.84, `position_z`=23.5588, `orientation`=0.791442 WHERE `id`=7765;
-- Kalin Windflight (Entry: 7772) (Distance: 17.6954)
-- Old: .go -3285.62 2004.17 245.867 1
-- New: .go -3287.18 2021.06 240.825 1
UPDATE `creature` SET `position_x`=-3287.18, `position_y`=2021.06, `position_z`=240.825, `orientation`=2.02458 WHERE `id`=7772;
-- Loramus Thalipedes (Entry: 7783) (Distance: 0)
-- Old: .go 3098.16 -6361.3 8.19374 1
-- New: .go 3098.16 -6361.3 8.19374 1
UPDATE `creature` SET `position_x`=3098.16, `position_y`=-6361.3, `position_z`=8.19374, `orientation`=0.171132 WHERE `id`=7783;
-- Se'Jib (Entry: 7871) (Distance: 0.0832996)
-- Old: .go -12619 -111.231 18.5 0
-- New: .go -12619 -111.231 18.5833 0
UPDATE `creature` SET `position_x`=-12619, `position_y`=-111.231, `position_z`=18.5833, `orientation`=3.49066 WHERE `id`=7871;
-- Ambassador Bloodrage (Entry: 7895) (Distance: 282.642)
-- Add second spawn to pool.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (1606, 1, 'Barrens - Ambassador Bloodrage', 0, 0, 0, 10);
INSERT INTO `pool_creature_template` (`id`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (7895, 1606, 0, 'Barrens - Ambassador Bloodrage', 0, 0, 10);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (51854, 7895, 0, 0, 0, 1, -4313.69, -2019.48, 89.2245, 4.62512, 37800, 57600, 0, 100, 100, 0, 0, 0, 0, 10);
-- Brannock (Entry: 7946) (Distance: 0.318178)
-- Old: .go -4294.42 3199.97 0.517903 1
-- New: .go -4294.73 3199.96 0.588618 1
UPDATE `creature` SET `position_x`=-4294.73, `position_y`=3199.96, `position_z`=0.588618, `orientation`=6.26573 WHERE `id`=7946;
-- Tyrande Whisperwind (Entry: 7999) (Distance: 0)
-- Old: .go 9662.52 2524.57 1360.08 1
-- New: .go 9662.52 2524.57 1360.08 1
UPDATE `creature` SET `position_x`=9662.52, `position_y`=2524.57, `position_z`=1360.08, `orientation`=0.0698132 WHERE `id`=7999;
-- Guthrum Thunderfist (Entry: 8018) (Distance: 0.695999)
-- Old: .go 282.096 -2001.28 194.127 0
-- New: .go 282.096 -2001.28 194.823 0
UPDATE `creature` SET `position_x`=282.096, `position_y`=-2001.28, `position_z`=194.823, `orientation`=5.60251 WHERE `id`=8018;
-- Orwin Gizzmick (Entry: 8021) (Distance: 0.0643997)
-- Old: .go -4419.57 180.707 29.337 1
-- New: .go -4419.57 180.707 29.2726 1
UPDATE `creature` SET `position_x`=-4419.57, `position_y`=180.707, `position_z`=29.2726, `orientation`=4.38078 WHERE `id`=8021;
-- Sharpbeak (Entry: 8023) (Distance: 0.977113)
-- Old: .go -256.241 -3630.21 238.918 0
-- New: .go -255.549 -3630.32 239.599 0
UPDATE `creature` SET `position_x`=-255.549, `position_y`=-3630.32, `position_z`=239.599, `orientation`=5.77704 WHERE `id`=8023;
-- Wrinkle Goodsteel (Entry: 8129) (Distance: 0)
-- Old: .go -7149.83 -3723.66 8.57805 1
-- New: .go -7149.83 -3723.66 8.57805 1
UPDATE `creature` SET `position_x`=-7149.83, `position_y`=-3723.66, `position_z`=8.57805, `orientation`=0.0174533 WHERE `id`=8129;
-- Haarka the Ravenous (Entry: 8205) (Distance: 211.558)
-- Old: .go -9269.3 -3896.64 10.1017 1
-- New: .go -9273.48 -4098.71 -52.4036 1
UPDATE `creature` SET `position_x`=-9273.48, `position_y`=-4098.71, `position_z`=-52.4036, `orientation`=2.3293 WHERE `id`=8205;
-- The Reak (Entry: 8212) (Distance: 509.763)
-- Add second spawn to pool.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (1607, 1, 'Hinterlands - The Reak', 0, 0, 0, 10);
INSERT INTO `pool_creature_template` (`id`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (8212, 1607, 0, 'Hinterlands - The Reak', 0, 0, 10);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (69120, 8212, 0, 0, 0, 0, 441.875, -3338.92, 119.533, 3.90348, 115200, 172800, 15, 100, 0, 1, 0, 0, 0, 10);
-- Sprok (Entry: 8320) (Distance: 0)
-- Old: .go -5100.64 750.289 260.634 0
-- New: .go -5100.64 750.289 260.634 0
UPDATE `creature` SET `position_x`=-5100.64, `position_y`=750.289, `position_z`=260.634, `orientation`=0.0523599 WHERE `id`=8320;
-- Dying Archaeologist (Entry: 8417) (Distance: 0)
-- Old: .go -6480.21 -1240.93 180.21 0
-- New: .go -6480.21 -1240.93 180.21 0
UPDATE `creature` SET `position_x`=-6480.21, `position_y`=-1240.93, `position_z`=180.21, `orientation`=5.27089 WHERE `id`=8417;
-- Kim'jael (Entry: 8420) (Distance: 0)
-- Old: .go 4603.83 -5987.55 169.724 1
-- New: .go 4603.83 -5987.55 169.724 1
UPDATE `creature` SET `position_x`=4603.83, `position_y`=-5987.55, `position_z`=169.724, `orientation`=0.0349066 WHERE `id`=8420;
-- Auctioneer Beardo (Entry: 8661) (Distance: 0)
-- Old: .go -7239.1 -3803.89 0.813843 1
-- New: .go -7239.1 -3803.89 0.813843 1
UPDATE `creature` SET `position_x`=-7239.1, `position_y`=-3803.89, `position_z`=0.813843, `orientation`=0.0174533 WHERE `id`=8661;
-- Auctioneer Tolon (Entry: 8669) (Distance: 0)
-- Old: .go 9872.6 2341.73 1321.67 1
-- New: .go 9872.6 2341.73 1321.67 1
UPDATE `creature` SET `position_x`=9872.6, `position_y`=2341.73, `position_z`=1321.67, `orientation`=3.52557 WHERE `id`=8669;
-- Raytaf (Entry: 8756) (Distance: 2.85392)
-- Old: .go 3073.97 -6364.02 2.65216 1
-- New: .go 3075 -6366.67 2.90094 1
UPDATE `creature` SET `position_x`=3075, `position_y`=-6366.67, `position_z`=2.90094, `orientation`=4.72706 WHERE `id`=8756;
-- Shahiar (Entry: 8757) (Distance: 0.717498)
-- Old: .go 3112.91 -6323.64 7.09764 1
-- New: .go 3112.27 -6323.95 7.19358 1
UPDATE `creature` SET `position_x`=3112.27, `position_y`=-6323.95, `position_z`=7.19358, `orientation`=4.79048 WHERE `id`=8757;
-- Zaman (Entry: 8758) (Distance: 3.94681)
-- Old: .go 3108.69 -6347.81 1.73517 1
-- New: .go 3109.41 -6351.69 1.80902 1
UPDATE `creature` SET `position_x`=3109.41, `position_y`=-6351.69, `position_z`=1.80902, `orientation`=3.03044 WHERE `id`=8758;
-- Muuran (Entry: 8878) (Distance: 0)
-- Old: .go -1241.63 1734 89.9728 1
-- New: .go -1241.63 1734 89.9728 1
UPDATE `creature` SET `position_x`=-1241.63, `position_y`=1734, `position_z`=89.9728, `orientation`=4.79966 WHERE `id`=8878;
-- Royal Historian Archesonus (Entry: 8879) (Distance: 0)
-- Old: .go -4861.04 -1016.93 505.798 0
-- New: .go -4861.04 -1016.93 505.798 0
UPDATE `creature` SET `position_x`=-4861.04, `position_y`=-1016.93, `position_z`=505.798, `orientation`=5.27089 WHERE `id`=8879;
-- General Angerforge (Entry: 9033) (Distance: 0)
-- Old: .go 652.39 21.3737 -59.976 230
-- New: .go 652.39 21.3737 -59.976 230
UPDATE `creature` SET `position_x`=652.39, `position_y`=21.3737, `position_z`=-59.976, `orientation`=0.0872665 WHERE `id`=9033;
-- Hierophant Theodora Mulvadania (Entry: 9079) (Distance: 0.0319977)
-- Old: .go -6682.35 -2154.34 244.195 0
-- New: .go -6682.35 -2154.34 244.227 0
UPDATE `creature` SET `position_x`=-6682.35, `position_y`=-2154.34, `position_z`=244.227, `orientation`=1.29154 WHERE `id`=9079;
-- J.D. Collie (Entry: 9117) (Distance: 0.0270081)
-- Old: .go -6033.25 -1017.56 -217.055 1
-- New: .go -6033.25 -1017.56 -217.082 1
UPDATE `creature` SET `position_x`=-6033.25, `position_y`=-1017.56, `position_z`=-217.082, `orientation`=0.872665 WHERE `id`=9117;
-- Overlord Ror (Entry: 9464) (Distance: 0)
-- Old: .go 3519.21 -1131.52 223.943 1
-- New: .go 3519.21 -1131.52 223.943 1
UPDATE `creature` SET `position_x`=3519.21, `position_y`=-1131.52, `position_z`=223.943, `orientation`=0.0174533 WHERE `id`=9464;
-- Rakaiah (Entry: 9518) (Distance: 4.48264)
-- Old: .go 5197.1 -560.756 287.182 1
-- New: .go 5199.22 -564.699 287.41 1
UPDATE `creature` SET `position_x`=5199.22, `position_y`=-564.699, `position_z`=287.41, `orientation`=5.32325 WHERE `id`=9518;
-- Ribbly Screwspigot (Entry: 9543) (Distance: 12.996)
-- Old: .go 867.116 -174.047 -49.7566 230
-- New: .go 878.471 -167.726 -49.6751 230
UPDATE `creature` SET `position_x`=878.471, `position_y`=-167.726, `position_z`=-49.6751, `orientation`=2.51327 WHERE `id`=9543;
-- Ribbly's Cronies
UPDATE `creature` SET `position_x`=875.615, `position_y`=-168.167, `position_z`=-49.6746, `orientation`=0.418879 WHERE `guid`=46617;
UPDATE `creature` SET `position_x`=877.042, `position_y`=-166.488, `position_z`=-49.6748, `orientation`=5.77704 WHERE `guid`=46618;
UPDATE `creature` SET `position_x`=880.844, `position_y`=-167.852, `position_z`=-49.673, `orientation`=2.6529 WHERE `guid`=46616;
-- Zapetta (Entry: 9566) (Distance: 0)
-- Old: .go 2064.01 288.57 97.1146 0
-- New: .go 2064.01 288.57 97.1146 0
UPDATE `creature` SET `position_x`=2064.01, `position_y`=288.57, `position_z`=97.1146, `orientation`=4.88692 WHERE `id`=9566;
-- Sylista (Entry: 9977) (Distance: 0.0595704)
-- Old: .go -8738 983.207 97.586 0
-- New: .go -8737.94 983.207 97.5861 0
UPDATE `creature` SET `position_x`=-8737.94, `position_y`=983.207, `position_z`=97.5861, `orientation`=0.610865 WHERE `id`=9977;
-- Shoja'my (Entry: 9987) (Distance: 0.000976563)
-- Old: .go 333.313 -4711.64 14.614 1
-- New: .go 333.312 -4711.64 14.614 1
UPDATE `creature` SET `position_x`=333.312, `position_y`=-4711.64, `position_z`=14.614, `orientation`=2.79253 WHERE `id`=9987;
-- Bethaine Flinthammer (Entry: 10046) (Distance: 0)
-- Old: .go -3794.34 -824.898 9.84759 0
-- New: .go -3794.34 -824.898 9.84759 0
UPDATE `creature` SET `position_x`=-3794.34, `position_y`=-824.898, `position_z`=9.84759, `orientation`=0.0523599 WHERE `id`=10046;
-- Deathmaw (Entry: 10077)
-- Add second spawn to pool.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (1602, 1, 'Burning Steppes - Deathmaw', 0, 0, 0, 10);
INSERT INTO `pool_creature_template` (`id`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (10077, 1602, 0, 'Burning Steppes - Deathmaw', 0, 0, 10);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (300957, 10077, 0, 0, 0, 0, -7669.79, -2470.96, 144.798, 4.71239, 18000, 28800, 10, 100, 0, 1, 8, 0, 0, 10);
-- Lady Sylvanas Windrunner (Entry: 10181) (Distance: 0)
-- Old: .go 1290.41 316.247 -57.2376 0
-- New: .go 1290.41 316.247 -57.2376 0
UPDATE `creature` SET `position_x`=1290.41, `position_y`=316.247, `position_z`=-57.2376, `orientation`=1.44862 WHERE `id`=10181;
-- Bijou (Entry: 10257) (Distance: 5.59476)
-- Old: .go -8.65673 -548.819 16.1875 229
-- New: .go -5.65428 -553.539 16.2767 229
UPDATE `creature` SET `position_x`=-5.65428, `position_y`=-553.539, `position_z`=16.2767, `orientation`=2.87979 WHERE `id`=10257;
-- Scarshield Infiltrator (Entry: 10299) (Distance: 0.284885)
-- Old: .go 56.85 -399.5 64.35 229
-- New: .go 57.0545 -399.681 64.4311 229
UPDATE `creature` SET `position_x`=57.0545, `position_y`=-399.681, `position_z`=64.4311, `orientation`=2.94961 WHERE `id`=10299;
-- Emberstrife (Entry: 10321) (Distance: 0.0673981)
-- Old: .go -5103.36 -3949.53 41.4934 1
-- New: .go -5103.36 -3949.53 41.5608 1
UPDATE `creature` SET `position_x`=-5103.36, `position_y`=-3949.53, `position_z`=41.5608, `orientation`=1.23918 WHERE `id`=10321;
-- General Drakkisath (Entry: 10363) (Distance: 1.82643)
-- Old: .go 34.76 -285.31 111.13 229
-- New: .go 36.4509 -285.994 111.036 229
UPDATE `creature` SET `position_x`=36.4509, `position_y`=-285.994, `position_z`=111.036, `orientation`=3.14159 WHERE `id`=10363;
-- Shrye Ragefist (Entry: 10367) (Distance: 0.261052)
-- Old: .go -1187.86 -275.31 73.0481 30
-- New: .go -1187.89 -275.055 73.001 30
UPDATE `creature` SET `position_x`=-1187.89, `position_y`=-275.055, `position_z`=73.001, `orientation`=3.63028 WHERE `id`=10367;
-- The Beast (Entry: 10430) (Distance: 6.39827)
-- Old: .go 124.974 -570.138 107.011 229
-- New: .go 124.21 -563.799 107.425 229
UPDATE `creature` SET `position_x`=124.21, `position_y`=-563.799, `position_z`=107.425, `orientation`=2.75762 WHERE `id`=10430;
-- Baron Rivendare (Entry: 10440) (Distance: 4.4803)
-- Old: .go 4032.79 -3333.02 115.061 329
-- New: .go 4035.83 -3336.31 115.144 329
UPDATE `creature` SET `position_x`=4035.83, `position_y`=-3336.31, `position_z`=115.144, `orientation`=4.67748 WHERE `id`=10440;
-- Binny Springblade (Entry: 10455) (Distance: 0)
-- Old: .go -4608.38 -1074.32 503.673 0
-- New: .go -4608.38 -1074.32 503.673 0
UPDATE `creature` SET `position_x`=-4608.38, `position_y`=-1074.32, `position_z`=503.673, `orientation`=6.23083 WHERE `id`=10455;
-- Instructor Malicia (Entry: 10505) (Distance: 0)
-- Old: .go 86.6634 -1.96039 85.3117 289
-- New: .go 86.6634 -1.96039 85.3117 289
UPDATE `creature` SET `position_x`=86.6634, `position_y`=-1.96039, `position_z`=85.3117, `orientation`=0.0174533 WHERE `id`=10505;
-- The Ravenian (Entry: 10507) (Distance: 0)
-- Old: .go 103.305 -1.67752 75.2183 289
-- New: .go 103.305 -1.67752 75.2183 289
UPDATE `creature` SET `position_x`=103.305, `position_y`=-1.67752, `position_z`=75.2183, `orientation`=6.17847 WHERE `id`=10507;
-- Grand Crusader Dathrohan (Entry: 10812) (Distance: 3.34864)
-- Old: .go 3413.63 -3042.04 136.534 329
-- New: .go 3415.84 -3044.54 136.814 329
UPDATE `creature` SET `position_x`=3415.84, `position_y`=-3044.54, `position_z`=136.814, `orientation`=5.42797 WHERE `id`=10812;
-- Commander Ashlam Valorfist (Entry: 10838) (Distance: 0)
-- Old: .go 957.713 -1419.47 66.347 0
-- New: .go 957.713 -1419.47 66.347 0
UPDATE `creature` SET `position_x`=957.713, `position_y`=-1419.47, `position_z`=66.347, `orientation`=4.7473 WHERE `id`=10838;
-- Lorax (Entry: 10918) (Distance: 5.39889)
-- Old: .go 5042.13 -4845.89 869.714 1
-- New: .go 5041.85 -4851.21 870.591 1
UPDATE `creature` SET `position_x`=5041.85, `position_y`=-4851.21, `position_z`=870.591, `orientation`=1.24849 WHERE `id`=10918;
-- Remains of Trey Lightforge (Entry: 11020) (Distance: 0.0680316)
-- Old: .go 5200.79 -572.024 289.175 1
-- New: .go 5200.79 -572.025 289.243 1
UPDATE `creature` SET `position_x`=5200.79, `position_y`=-572.025, `position_z`=289.243, `orientation`=0.855211 WHERE `id`=11020;
-- Sprite Jumpsprocket (Entry: 11026) (Distance: 0.000976563)
-- Old: .go -8349.88 647.612 95.8736 0
-- New: .go -8349.88 647.613 95.8736 0
UPDATE `creature` SET `position_x`=-8349.88, `position_y`=647.613, `position_z`=95.8736, `orientation`=4.27606 WHERE `id`=11026;
-- Franklin Lloyd (Entry: 11031) (Distance: 0)
-- Old: .go 1404.08 142.911 -62.2217 0
-- New: .go 1404.08 142.911 -62.2217 0
UPDATE `creature` SET `position_x`=1404.08, `position_y`=142.911, `position_z`=-62.2217, `orientation`=0.0174533 WHERE `id`=11031;
-- Smokey LaRue (Entry: 11033) (Distance: 0)
-- Old: .go 2303.41 -5305.53 82.0796 0
-- New: .go 2303.41 -5305.53 82.0796 0
UPDATE `creature` SET `position_x`=2303.41, `position_y`=-5305.53, `position_z`=82.0796, `orientation`=2.19911 WHERE `id`=11033;
-- Timothy Worthington (Entry: 11052) (Distance: 0)
-- Old: .go -3846.73 -4449.22 17.3314 1
-- New: .go -3846.73 -4449.22 17.3314 1
UPDATE `creature` SET `position_x`=-3846.73, `position_y`=-4449.22, `position_z`=17.3314, `orientation`=0.0174533 WHERE `id`=11052;
-- Jhag (Entry: 11066) (Distance: 0)
-- Old: .go 1913.25 -4430.54 24.6477 1
-- New: .go 1913.25 -4430.54 24.6477 1
UPDATE `creature` SET `position_x`=1913.25, `position_y`=-4430.54, `position_z`=24.6477, `orientation`=3.68264 WHERE `id`=11066;
-- Jenova Stoneshield (Entry: 11069) (Distance: 0.000976563)
-- Old: .go -8432.74 554.682 95.3503 0
-- New: .go -8432.74 554.681 95.3503 0
UPDATE `creature` SET `position_x`=-8432.74, `position_y`=554.681, `position_z`=95.3503, `orientation`=1.27409 WHERE `id`=11069;
-- Maethrya (Entry: 11138) (Distance: 0.0390015)
-- Old: .go 6800.54 -4742.35 701.62 1
-- New: .go 6800.54 -4742.35 701.581 1
UPDATE `creature` SET `position_x`=6800.54, `position_y`=-4742.35, `position_z`=701.581, `orientation`=3.1765 WHERE `id`=11138;
-- Green Skeletal Warhorse (Entry: 11156) (Distance: 1.6155)
-- Old: .go 2250.74 333.748 35.2725 0
-- New: .go 2250.74 333.748 36.888 0
UPDATE `creature` SET `position_x`=2250.74, `position_y`=333.748, `position_z`=36.888, `orientation`=5.58505 WHERE `id`=11156;
-- Eva Sarkhoff (Entry: 11216) (Distance: 0)
-- Old: .go 1253.55 -2602.62 91.5884 0
-- New: .go 1253.55 -2602.62 91.5884 0
UPDATE `creature` SET `position_x`=1253.55, `position_y`=-2602.62, `position_z`=91.5884, `orientation`=3.36849 WHERE `id`=11216;
-- Magnus Frostwake (Entry: 11278) (Distance: 0.0100098)
-- Old: .go 1144.51 -2510.08 62.1604 0
-- New: .go 1144.5 -2510.08 62.1604 0
UPDATE `creature` SET `position_x`=1144.5, `position_y`=-2510.08, `position_z`=62.1604, `orientation`=4.03171 WHERE `id`=11278;
-- Sammy (Entry: 11283) (Distance: 0)
-- Old: .go 1111.49 -2556.4 59.2532 0
-- New: .go 1111.49 -2556.4 59.2532 0
UPDATE `creature` SET `position_x`=1111.49, `position_y`=-2556.4, `position_z`=59.2532, `orientation`=0.365222 WHERE `id`=11283;
-- Rory (Entry: 11285) (Distance: 5.12659)
-- Old: .go 1221.76 -2317.21 57.1717 0
-- New: .go 1216.68 -2316.52 57.1717 0
UPDATE `creature` SET `position_x`=1216.68, `position_y`=-2316.52, `position_z`=57.1717, `orientation`=1.0412 WHERE `id`=11285;
-- Immol'thar (Entry: 11496) (Distance: 2.70409)
-- Old: .go -40.45 811.14 -29.36 429
-- New: .go -38.0807 812.44 -29.4525 429
UPDATE `creature` SET `position_x`=-38.0807, `position_y`=812.44, `position_z`=-29.4525, `orientation`=4.69494 WHERE `id`=11496;
-- Skarr the Unbreakable (Entry: 11498) (Distance: 2.51339)
-- Old: .go -3758.47 1096.15 131.97 1
-- New: .go -3758.51 1093.64 132.094 1
UPDATE `creature` SET `position_x`=-3758.51, `position_y`=1093.64, `position_z`=132.094, `orientation`=0.425866 WHERE `id`=11498;
-- Quartermaster Miranda Breechlock (Entry: 11536) (Distance: 0.00889587)
-- Old: .go 2251.3 -5344.98 87.0119 0
-- New: .go 2251.3 -5344.98 87.0208 0
UPDATE `creature` SET `position_x`=2251.3, `position_y`=-5344.98, `position_z`=87.0208, `orientation`=1.88496 WHERE `id`=11536;
-- Gorn One Eye (Entry: 11555) (Distance: 0.0539551)
-- Old: .go 7030.72 -2106.32 587.465 1
-- New: .go 7030.72 -2106.32 587.519 1
UPDATE `creature` SET `position_x`=7030.72, `position_y`=-2106.32, `position_z`=587.519, `orientation`=4.34587 WHERE `id`=11555;
-- Meilosh (Entry: 11557) (Distance: 0.0839844)
-- Old: .go 7025.63 -2135.69 586.408 1
-- New: .go 7025.63 -2135.69 586.492 1
UPDATE `creature` SET `position_x`=7025.63, `position_y`=-2135.69, `position_z`=586.492, `orientation`=2.32129 WHERE `id`=11557;
-- Adon (Entry: 11706) (Distance: 0.0250015)
-- Old: .go 3362.56 -4446.57 127.746 0
-- New: .go 3362.56 -4446.57 127.721 0
UPDATE `creature` SET `position_x`=3362.56, `position_y`=-4446.57, `position_z`=127.721, `orientation`=3.14159 WHERE `id`=11706;
-- Sar Browneye (Entry: 11718) (Distance: 0.0759888)
-- Old: .go 7928.07 -4455.82 711.498 1
-- New: .go 7928.07 -4455.82 711.574 1
UPDATE `creature` SET `position_x`=7928.07, `position_y`=-4455.82, `position_z`=711.574, `orientation`=3.89208 WHERE `id`=11718;
-- Feran Strongwind (Entry: 11749) (Distance: 0)
-- Old: .go 1916.37 -2329.61 92.437 1
-- New: .go 1916.37 -2329.61 92.437 1
UPDATE `creature` SET `position_x`=1916.37, `position_y`=-2329.61, `position_z`=92.437, `orientation`=0.0523599 WHERE `id`=11749;
-- Gogo (Entry: 11753) (Distance: 0)
-- Old: .go 6705.41 -4662.46 722.028 1
-- New: .go 6705.41 -4662.46 722.028 1
UPDATE `creature` SET `position_x`=6705.41, `position_y`=-4662.46, `position_z`=722.028, `orientation`=6.23083 WHERE `id`=11753;
-- Mylentha Riverbend (Entry: 11795) (Distance: 0)
-- Old: .go 7990.11 -2576.35 502.513 1
-- New: .go 7990.11 -2576.35 502.513 1
UPDATE `creature` SET `position_x`=7990.11, `position_y`=-2576.35, `position_z`=502.513, `orientation`=0.0174533 WHERE `id`=11795;
-- Rabine Saturna (Entry: 11801) (Distance: 0)
-- Old: .go 7797.39 -2574.32 488.562 1
-- New: .go 7797.39 -2574.32 488.562 1
UPDATE `creature` SET `position_x`=7797.39, `position_y`=-2574.32, `position_z`=488.562, `orientation`=0.0174533 WHERE `id`=11801;
-- Krah'ranik (Entry: 11817) (Distance: 1.12099)
-- Old: .go 7475.57 -1582.61 181.342 1
-- New: .go 7474.75 -1581.85 181.425 1
UPDATE `creature` SET `position_x`=7474.75, `position_y`=-1581.85, `position_z`=181.425, `orientation`=2.25147 WHERE `id`=11817;
-- Jory Zaga (Entry: 11819) (Distance: 0.814854)
-- Old: .go 7477.02 -1577.44 181.342 1
-- New: .go 7476.21 -1577.47 181.425 1
UPDATE `creature` SET `position_x`=7476.21, `position_y`=-1577.47, `position_z`=181.425, `orientation`=3.71755 WHERE `id`=11819;
-- Makaba Flathoof (Entry: 11857) (Distance: 2.1386)
-- Old: .go -263 -943 12.439 1
-- New: .go -265.125 -943.147 12.6297 1
UPDATE `creature` SET `position_x`=-265.125, `position_y`=-943.147, `position_z`=12.6297, `orientation`=4.81711 WHERE `id`=11857;
-- Buliwyf Stonehand (Entry: 11865) (Distance: 0)
-- Old: .go -5041.53 -1197.25 508.985 0
-- New: .go -5041.53 -1197.25 508.985 0
UPDATE `creature` SET `position_x`=-5041.53, `position_y`=-1197.25, `position_z`=508.985, `orientation`=5.27089 WHERE `id`=11865;
-- Nathanos Blightcaller (Entry: 11878) (Distance: 0.0156275)
-- Old: .go 1870.97 -3212.71 125.243 0
-- New: .go 1870.97 -3212.72 125.255 0
UPDATE `creature` SET `position_x`=1870.97, `position_y`=-3212.72, `position_z`=125.255, `orientation`=5.00909 WHERE `id`=11878;
-- Shardi (Entry: 11899) (Distance: 0)
-- Old: .go -3149.14 -2842.13 34.6649 1
-- New: .go -3149.14 -2842.13 34.6649 1
UPDATE `creature` SET `position_x`=-3149.14, `position_y`=-2842.13, `position_z`=34.6649, `orientation`=0.0174533 WHERE `id`=11899;
-- Brakkar (Entry: 11900) (Distance: 0)
-- Old: .go 5064.72 -338.845 367.463 1
-- New: .go 5064.72 -338.845 367.463 1
UPDATE `creature` SET `position_x`=5064.72, `position_y`=-338.845, `position_z`=367.463, `orientation`=0.0523599 WHERE `id`=11900;
-- Magga (Entry: 11943) (Distance: 0)
-- Old: .go -638.159 -4237.94 38.2173 1
-- New: .go -638.159 -4237.94 38.2173 1
UPDATE `creature` SET `position_x`=-638.159, `position_y`=-4237.94, `position_z`=38.2173, `orientation`=0.0174533 WHERE `id`=11943;
-- Drek'Thar (Entry: 11946) (Distance: 0.651901)
-- Old: .go -1370.9 -219.793 98.4258 30
-- New: .go -1370.26 -219.702 98.5099 30
UPDATE `creature` SET `position_x`=-1370.26, `position_y`=-219.702, `position_z`=98.5099, `orientation`=5.02655 WHERE `id`=11946;
-- Captain Galvangar (Entry: 11947) (Distance: 2.04332)
-- Old: .go -543.466 -166.029 57.0124 30
-- New: .go -545.23 -165.35 57.7886 30
UPDATE `creature` SET `position_x`=-545.23, `position_y`=-165.35, `position_z`=57.7886, `orientation`=6.00393 WHERE `id`=11947;
-- Magmadar (Entry: 11982) (Distance: 4.10125)
-- Old: .go 1143.14 -1016.66 -185.751 409
-- New: .go 1144.63 -1020.48 -185.663 409
UPDATE `creature` SET `position_x`=1144.63, `position_y`=-1020.48, `position_z`=-185.663, `orientation`=2.93215 WHERE `id`=11982;
-- Ashley Bridenbecker (Entry: 11996) (Distance: 1.99141)
-- Old: .go -9318.44 270.625 68.1097 0
-- New: .go -9319.26 272.428 68.3184 0
UPDATE `creature` SET `position_x`=-9319.26, `position_y`=272.428, `position_z`=68.3184, `orientation`=1.36136 WHERE `id`=11996;
-- Frostwolf Herald (Entry: 11998) (Distance: 162.798)
-- Old: .go -856.522 -571.15 57.724 30
-- New: .go -735.1 -679.371 50.7939 30
UPDATE `creature` SET `position_x`=-735.1, `position_y`=-679.371, `position_z`=50.7939, `orientation`=4.13643 WHERE `id`=11998;
-- Meliri (Entry: 12024) (Distance: 0)
-- Old: .go 7840.32 -2562.68 489.369 1
-- New: .go 7840.32 -2562.68 489.369 1
UPDATE `creature` SET `position_x`=7840.32, `position_y`=-2562.68, `position_z`=489.369, `orientation`=4.7473 WHERE `id`=12024;
-- Narianna (Entry: 12029) (Distance: 0.00976563)
-- Old: .go 7834.28 -2612.63 489.384 1
-- New: .go 7834.28 -2612.62 489.384 1
UPDATE `creature` SET `position_x`=7834.28, `position_y`=-2612.62, `position_z`=489.384, `orientation`=1.74533 WHERE `id`=12029;
-- Koiter (Entry: 12034) (Distance: 0)
-- Old: .go -390.928 -2182.54 158.68 1
-- New: .go -390.928 -2182.54 158.68 1
UPDATE `creature` SET `position_x`=-390.928, `position_y`=-2182.54, `position_z`=158.68, `orientation`=3.36849 WHERE `id`=12034;
-- Draka (Entry: 12121) (Distance: 16.8778)
-- Old: .go -1366.04 -206.929 99.3713 30
-- New: .go -1373.29 -222.146 98.5099 30
UPDATE `creature` SET `position_x`=-1373.29, `position_y`=-222.146, `position_z`=98.5099, `orientation`=4.50295 WHERE `id`=12121;
-- Duros (Entry: 12122) (Distance: 16.7322)
-- Old: .go -1380.94 -211.844 99.3701 30
-- New: .go -1366.28 -219.863 98.5045 30
UPDATE `creature` SET `position_x`=-1366.28, `position_y`=-219.863, `position_z`=98.5045, `orientation`=5.5676 WHERE `id`=12122;
-- Snurk Bucksquick (Entry: 12136) (Distance: 0.0780227)
-- Old: .go 1354.03 -4642.61 53.6269 1
-- New: .go 1353.97 -4642.56 53.6269 1
UPDATE `creature` SET `position_x`=1353.97, `position_y`=-4642.56, `position_z`=53.6269, `orientation`=3.82227 WHERE `id`=12136;
-- Shade of Ambermoon (Entry: 12199) (Distance: 27.7669)
-- Add second spawn to pool.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (1612, 1, 'Silithus - Shade of Ambermoon', 0, 0, 0, 10);
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (43132, 1612, 50, 'Silithus - Shade of Ambermoon', 0, 0, 10);
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (43176, 1612, 50, 'Silithus - Shade of Ambermoon', 0, 0, 10);
UPDATE `creature` SET `position_x`=-7141.85, `position_y`=350.847, `position_z`=26.3781, `orientation`=0.0523599, `id`=12178, `id2`=12179, `id3`=12199, `mana_percent`=100 WHERE guid=43132;
UPDATE `creature` SET `id`=12178, `id2`=12179, `id3`=12199, `mana_percent`=100 WHERE `guid`=43176;
-- Spirit of Kolk (Entry: 12240) (Distance: 2.10849)
-- Old: .go -1362.74 2900.8 73.4381 1
-- New: .go -1360.96 2899.67 73.4338 1
UPDATE `creature` SET `position_x`=-1360.96, `position_y`=2899.67, `position_z`=73.4338, `orientation`=5.77704 WHERE `id`=12240;
-- Vendor-Tron 1000 (Entry: 12245) (Distance: 79.7365)
-- Old: .go -711.45 1444.69 90.7485 1
-- New: .go -692.743 1522.2 90.3611 1
UPDATE `creature` SET `position_x`=-692.743, `position_y`=1522.2, `position_z`=90.3611, `orientation`=0.558505 WHERE `id`=12245;
-- Mark of Detonation (CLS) (Entry: 12251) (Distance: 0)
-- Old: .go 3180.14 -3320.52 165.243 0
-- New: .go 3180.14 -3320.52 165.243 0
UPDATE `creature` SET `position_x`=3180.14, `position_y`=-3320.52, `position_z`=165.243, `orientation`=0.0523599 WHERE `id`=12251;
-- Dire Riding Wolf (Entry: 12351) (Distance: 0)
-- Old: .go 2162.76 -4659.62 49.7548 1
-- New: .go 2162.76 -4659.62 49.7548 1
UPDATE `creature` SET `position_x`=2162.76, `position_y`=-4659.62, `position_z`=49.7548, `orientation`=2.25147 WHERE `id`=12351;
-- Riding Striped Frostsaber (Entry: 12358) (Distance: 0)
-- Old: .go 10132.7 2526.33 1325.56 1
-- New: .go 10132.7 2526.33 1325.56 1
UPDATE `creature` SET `position_x`=10132.7, `position_y`=2526.33, `position_z`=1325.56, `orientation`=3.63028 WHERE `id`=12358;
-- Dreamtracker (Entry: 12496) (Distance: 0.0830002)
-- Old: .go 803.387 -3996.83 122.005 0
-- New: .go 803.387 -3996.83 122.088 0
UPDATE `creature` SET `position_x`=803.387, `position_y`=-3996.83, `position_z`=122.088, `orientation`=3.47321 WHERE `id`=12496;
-- Dreamstalker (Entry: 12498) (Distance: 0.0829926)
-- Old: .go 3247.17 -3723.5 149.634 1
-- New: .go 3247.17 -3723.5 149.717 1
UPDATE `creature` SET `position_x`=3247.17, `position_y`=-3723.5, `position_z`=149.717, `orientation`=2.87979 WHERE `id`=12498;
-- Grethok the Controller (Entry: 12557) (Distance: 1.12195)
-- Old: .go -7617 -1023.08 413.382 469
-- New: .go -7616.54 -1024.1 413.465 469
UPDATE `creature` SET `position_x`=-7616.54, `position_y`=-1024.1, `position_z`=413.465, `orientation`=5.27089 WHERE `id`=12557;
-- Vhulgra (Entry: 12616) (Distance: 0)
-- Old: .go 2305.64 -2520.15 103.893 1
-- New: .go 2305.64 -2520.15 103.893 1
UPDATE `creature` SET `position_x`=2305.64, `position_y`=-2520.15, `position_z`=103.893, `orientation`=5.27089 WHERE `id`=12616;
-- Captain Dirgehammer (Entry: 12777) (Distance: 1.54874)
-- Old: .go -6.9852 -6.68433 5.67096 449
-- New: .go -7.02304 -5.13929 5.57096 449
UPDATE `creature` SET `position_x`=-7.02304, `position_y`=-5.13929, `position_z`=5.57096, `orientation`=2.25147 WHERE `id`=12777;
-- Archmage Gaiman (Entry: 12779) (Distance: 0.0833413)
-- Old: .go -0.992282 31.6972 1.09809 449
-- New: .go -0.993629 31.6975 1.18142 449
UPDATE `creature` SET `position_x`=-0.993629, `position_y`=31.6975, `position_z`=1.18142, `orientation`=5.044 WHERE `id`=12779;
-- Captain O'Neal (Entry: 12782) (Distance: 0.479218)
-- Old: .go 7.67861 33.5746 1.23917 449
-- New: .go 7.21626 33.6513 1.13917 449
UPDATE `creature` SET `position_x`=7.21626, `position_y`=33.6513, `position_z`=1.13917, `orientation`=2.70526 WHERE `id`=12782;
-- Lieutenant Jackspring (Entry: 12784) (Distance: 0)
-- Old: .go 7.16394 4.2682 -0.172551 449
-- New: .go 7.16394 4.2682 -0.172551 449
UPDATE `creature` SET `position_x`=7.16394, `position_y`=4.2682, `position_z`=-0.172551, `orientation`=0.0872665 WHERE `id`=12784;
-- Guard Quine (Entry: 12786) (Distance: 0)
-- Old: .go -2.74466 3.60577 -0.172551 449
-- New: .go -2.74466 3.60577 -0.172551 449
UPDATE `creature` SET `position_x`=-2.74466, `position_y`=3.60577, `position_z`=-0.172551, `orientation`=0.0523599 WHERE `id`=12786;
-- Advisor Willington (Entry: 12790) (Distance: 0.000101089)
-- Old: .go 239.886 84.128 24.8549 450
-- New: .go 239.886 84.128 24.8548 450
UPDATE `creature` SET `position_x`=239.886, `position_y`=84.128, `position_z`=24.8548, `orientation`=1.11701 WHERE `id`=12790;
-- Lady Palanseer (Entry: 12792) (Distance: 0.271698)
-- Old: .go 261.966 86.1144 25.9042 450
-- New: .go 261.771 86.275 25.8042 450
UPDATE `creature` SET `position_x`=261.771, `position_y`=86.275, `position_z`=25.8042, `orientation`=3.19395 WHERE `id`=12792;
-- Grunt Korf (Entry: 12797) (Distance: 9.91821e-05)
-- Old: .go 230.81 86.728 25.8015 450
-- New: .go 230.81 86.728 25.8016 450
UPDATE `creature` SET `position_x`=230.81, `position_y`=86.728, `position_z`=25.8016, `orientation`=6.12611 WHERE `id`=12797;
-- Sergeant Ba'sha (Entry: 12799) (Distance: 0)
-- Old: .go 1632.21 -4262.19 49.027 1
-- New: .go 1632.21 -4262.19 49.027 1
UPDATE `creature` SET `position_x`=1632.21, `position_y`=-4262.19, `position_z`=49.027, `orientation`=3.63028 WHERE `id`=12799;
-- Officer Areyn (Entry: 12805) (Distance: 0.0860802)
-- Old: .go -8759.18 389.112 101.056 0
-- New: .go -8759.2 389.122 101.139 0
UPDATE `creature` SET `position_x`=-8759.2, `position_y`=389.122, `position_z`=101.139, `orientation`=0.715585 WHERE `id`=12805;
-- Umi Thorson (Entry: 13078) (Distance: 16.7868)
-- Old: .go 863.904 -445.046 50.836 30
-- New: .go 880.236 -444.587 54.6897 30
UPDATE `creature` SET `position_x`=880.236, `position_y`=-444.587, `position_z`=54.6897, `orientation`=2.46091 WHERE `id`=13078;
-- Keetar (Entry: 13079) (Distance: 15.9054)
-- Old: .go 863.904 -445.046 50.836 30
-- New: .go 879.221 -443.257 54.7311 30
UPDATE `creature` SET `position_x`=879.221, `position_y`=-443.257, `position_z`=54.7311, `orientation`=1.8326 WHERE `id`=13079;
-- Aggi Rumblestomp (Entry: 13086) (Distance: 0.841078)
-- Old: .go -848.902 -92.931 68.6325 30
-- New: .go -849.49 -93.5311 68.5933 30
UPDATE `creature` SET `position_x`=-849.49, `position_y`=-93.5311, `position_z`=68.5933, `orientation`=3.7001 WHERE `id`=13086;
-- Lieutenant Rugba (Entry: 13137) (Distance: 5.43295)
-- Old: .go -642.566 -376.006 61.0832 30
-- New: .go -637.599 -373.806 61.1606 30
UPDATE `creature` SET `position_x`=-637.599, `position_y`=-373.806, `position_z`=61.1606, `orientation`=5.8294 WHERE `id`=13137;
-- Commander Randolph (Entry: 13139) (Distance: 0.21106)
-- Old: .go -159.572 -458.463 40.3955 30
-- New: .go -159.406 -458.363 40.4791 30
UPDATE `creature` SET `position_x`=-159.406, `position_y`=-458.363, `position_z`=40.4791, `orientation`=1.25664 WHERE `id`=13139;
-- Lieutenant Stronghoof (Entry: 13143) (Distance: 1.98555)
-- Old: .go -608.541 -405.399 60.2959 30
-- New: .go -610.156 -404.244 60.2827 30
UPDATE `creature` SET `position_x`=-610.156, `position_y`=-404.244, `position_z`=60.2827, `orientation`=2.98451 WHERE `id`=13143;
-- Lieutenant Vol'talar (Entry: 13144) (Distance: 3.65608)
-- Old: .go -499.253 -198.679 57.4824 30
-- New: .go -498.928 -195.038 57.5484 30
UPDATE `creature` SET `position_x`=-498.928, `position_y`=-195.038, `position_z`=57.5484, `orientation`=6.14356 WHERE `id`=13144;
-- Commander Malgor (Entry: 13152) (Distance: 4.61945)
-- Old: .go -1094.3 -351.944 54.3116 30
-- New: .go -1090.32 -349.623 54.6447 30
UPDATE `creature` SET `position_x`=-1090.32, `position_y`=-349.623, `position_z`=54.6447, `orientation`=0.0349066 WHERE `id`=13152;
-- Commander Mulfort (Entry: 13153) (Distance: 2.14695)
-- Old: .go -1408.13 -313.977 89.1283 30
-- New: .go -1406.13 -313.233 89.3647 30
UPDATE `creature` SET `position_x`=-1406.13, `position_y`=-313.233, `position_z`=89.3647, `orientation`=0.139626 WHERE `id`=13153;
-- Commander Louis Philips (Entry: 13154) (Distance: 6.83662)
-- Old: .go -767.356 -361.365 90.8949 30
-- New: .go -764.654 -355.085 90.8848 30
UPDATE `creature` SET `position_x`=-764.654, `position_y`=-355.085, `position_z`=90.8848, `orientation`=1.13446 WHERE `id`=13154;
-- Makasgar (Entry: 13157) (Distance: 0.0776005)
-- Old: .go -528.634 -5215.8 12.1806 1
-- New: .go -528.634 -5215.8 12.103 1
UPDATE `creature` SET `position_x`=-528.634, `position_y`=-5215.8, `position_z`=12.103, `orientation`=0.593412 WHERE `id`=13157;
-- Thanthaldis Snowgleam (Entry: 13217) (Distance: 0.0160065)
-- Old: .go -24.1885 -321.177 131.224 0
-- New: .go -24.1885 -321.177 131.24 0
UPDATE `creature` SET `position_x`=-24.1885, `position_y`=-321.177, `position_z`=131.24, `orientation`=4.81711 WHERE `id`=13217;
-- Duke Hydraxis (Entry: 13278) (Distance: 2.55402)
-- Old: .go 2849.59 -7297.15 20.3987 1
-- New: .go 2851.58 -7295.66 19.8125 1
UPDATE `creature` SET `position_x`=2851.58, `position_y`=-7295.66, `position_z`=19.8125, `orientation`=0.473265 WHERE `id`=13278;
-- Lieutenant Largent (Entry: 13296) (Distance: 3.1807)
-- Old: .go 10.0014 -315.484 16.8976 30
-- New: .go 9.62153 -318.631 17.1601 30
UPDATE `creature` SET `position_x`=9.62153, `position_y`=-318.631, `position_z`=17.1601, `orientation`=6.14356 WHERE `id`=13296;
-- Lieutenant Greywand (Entry: 13298) (Distance: 3.39485)
-- Old: .go 17.7725 -280.391 16.4999 30
-- New: .go 14.7054 -278.976 16.1597 30
UPDATE `creature` SET `position_x`=14.7054, `position_y`=-278.976, `position_z`=16.1597, `orientation`=6.10865 WHERE `id`=13298;
-- Commander Duffy (Entry: 13319) (Distance: 3.51897)
-- Old: .go 668.927 -286.384 29.4494 30
-- New: .go 672.408 -286.799 29.7551 30
UPDATE `creature` SET `position_x`=672.408, `position_y`=-286.799, `position_z`=29.7551, `orientation`=3.61283 WHERE `id`=13319;
-- Whulwert Copperpinch (Entry: 13431) (Distance: 28.5616)
-- Old: .go -1234.51 73.4529 129.591 1
-- New: .go -1259.4 59.6207 127.373 1
UPDATE `creature` SET `position_x`=-1259.4, `position_y`=59.6207, `position_z`=127.373, `orientation`=4.66003 WHERE `id`=13431;
-- Seersa Copperpinch (Entry: 13432) (Distance: 50.2345)
-- Old: .go -1274.94 109.166 129.298 1
-- New: .go -1261.82 60.7138 127.36 1
UPDATE `creature` SET `position_x`=-1261.82, `position_y`=60.7138, `position_z`=127.36, `orientation`=3.71755 WHERE `id`=13432;
-- Khole Jinglepocket (Entry: 13435) (Distance: 2.06092)
-- Old: .go -8810 641.539 94.229 0
-- New: .go -8807.95 641.736 94.312 0
UPDATE `creature` SET `position_x`=-8807.95, `position_y`=641.736, `position_z`=94.312, `orientation`=3.31613 WHERE `id`=13435;
-- Guchie Jinglepocket (Entry: 13436) (Distance: 3.7803)
-- Old: .go -8807 635.279 94.229 0
-- New: .go -8807.53 639.021 94.312 0
UPDATE `creature` SET `position_x`=-8807.53, `position_y`=639.021, `position_z`=94.312, `orientation`=3.54302 WHERE `id`=13436;
-- Frostwolf Wolf Rider Commander (Entry: 13441) (Distance: 3.2966)
-- Old: .go -1250.35 -633.115 52.5533 30
-- New: .go -1248.79 -636.018 52.6348 30
UPDATE `creature` SET `position_x`=-1248.79, `position_y`=-636.018, `position_z`=52.6348, `orientation`=0.959931 WHERE `id`=13441;
-- Sergeant Yazra Bloodsnarl (Entry: 13448) (Distance: 49.5378)
-- Old: .go -1260.3 -251.165 77.833 30
-- New: .go -1212.11 -261.774 73.4561 30
UPDATE `creature` SET `position_x`=-1212.11, `position_y`=-261.774, `position_z`=73.4561, `orientation`=5.79449 WHERE `id`=13448;
-- Frostwolf Stable Master (Entry: 13616) (Distance: 3.20206)
-- Old: .go -1243.74 -640.959 52.5777 30
-- New: .go -1244.96 -637.999 52.6366 30
UPDATE `creature` SET `position_x`=-1244.96, `position_y`=-637.999, `position_z`=52.6366, `orientation`=1.91986 WHERE `id`=13616;
-- Jotek (Entry: 13798) (Distance: 0.0354004)
-- Old: .go -1213.91 -370.619 56.4455 30
-- New: .go -1213.91 -370.619 56.4101 30
UPDATE `creature` SET `position_x`=-1213.91, `position_y`=-370.619, `position_z`=56.4101, `orientation`=0.837758 WHERE `id`=13798;
-- Warmaster Laggrond (Entry: 13840) (Distance: 0.00700378)
-- Old: .go 400.813 -960.106 110.501 0
-- New: .go 400.813 -960.106 110.508 0
UPDATE `creature` SET `position_x`=400.813, `position_y`=-960.106, `position_z`=110.508, `orientation`=3.10669 WHERE `id`=13840;
-- Ravenholdt (Entry: 13936) (Distance: 99.1869)
-- Old: .go 19.3358 -1449.73 176.424 0
-- New: .go 107.047 -1492.32 194.614 0
UPDATE `creature` SET `position_x`=107.047, `position_y`=-1492.32, `position_z`=194.614, `orientation`=4.32842 WHERE `id`=13936;
-- Chromaggus (Entry: 14020) (Distance: 2.42534)
-- Old: .go -7515.34 -1029.62 476.73 469
-- New: .go -7517.41 -1028.36 476.638 469
UPDATE `creature` SET `position_x`=-7517.41, `position_y`=-1028.36, `position_z`=476.638, `orientation`=6.12611 WHERE `id`=14020;
-- Trigger Guse (Entry: 14026) (Distance: 23.6068)
-- Old: .go 210.113 -356.12 56.3901 30
-- New: .go 216.615 -377.946 62.6055 30
UPDATE `creature` SET `position_x`=216.615, `position_y`=-377.946, `position_z`=62.6055, `orientation`=5.00909 WHERE `id`=14026;
-- Trigger Mulverick (Entry: 14027) (Distance: 30.7469)
-- Old: .go 691.614 -143.899 56.5425 30
-- New: .go 666.467 -132.471 70.048 30
UPDATE `creature` SET `position_x`=666.467, `position_y`=-132.471, `position_z`=70.048, `orientation`=0.0872665 WHERE `id`=14027;
-- Trigger Jeztor (Entry: 14028) (Distance: 12.5169)
-- Old: .go 324.43 -497.17 71.1594 30
-- New: .go 321.367 -501.11 82.6384 30
UPDATE `creature` SET `position_x`=321.367, `position_y`=-501.11, `position_z`=82.6384, `orientation`=1.85005 WHERE `id`=14028;
-- Trigger Ichman (Entry: 14029) (Distance: 26.0215)
-- Old: .go -1291.28 -266.665 91.6572 30
-- New: .go -1303.99 -266.818 114.363 30
UPDATE `creature` SET `position_x`=-1303.99, `position_y`=-266.818, `position_z`=114.363, `orientation`=6.0912 WHERE `id`=14029;
-- Trigger Slidore (Entry: 14030) (Distance: 31.6915)
-- Old: .go -771.787 -367.044 68.4151 30
-- New: .go -762.55 -346.892 91.063 30
UPDATE `creature` SET `position_x`=-762.55, `position_y`=-346.892, `position_z`=91.063, `orientation`=4.79966 WHERE `id`=14030;
-- Trigger Vipore (Entry: 14031) (Distance: 5.56481)
-- Old: .go -1221.27 -354.514 57.7049 30
-- New: .go -1225.05 -350.431 57.7918 30
UPDATE `creature` SET `position_x`=-1225.05, `position_y`=-350.431, `position_z`=57.7918, `orientation`=3.59538 WHERE `id`=14031;
-- Najak Hexxen (Entry: 14185) (Distance: 0.21968)
-- Old: .go -1271.24 -335.766 62.3971 30
-- New: .go -1271.21 -335.554 62.4462 30
UPDATE `creature` SET `position_x`=-1271.21, `position_y`=-335.554, `position_z`=62.4462, `orientation`=5.75959 WHERE `id`=14185;
-- Ravak Grimtotem (Entry: 14186) (Distance: 0.1217)
-- Old: .go -1268.64 -332.688 62.6171 30
-- New: .go -1268.64 -332.688 62.7388 30
UPDATE `creature` SET `position_x`=-1268.64, `position_y`=-332.688, `position_z`=62.7388, `orientation`=5.28835 WHERE `id`=14186;
-- Stomper Kreeg (Entry: 14322) (Distance: 3.77006)
-- Old: .go 494.194 99.7175 -2.58342 429
-- New: .go 491.231 97.3879 -2.5004 429
UPDATE `creature` SET `position_x`=491.231, `position_y`=97.3879, `position_z`=-2.5004, `orientation`=4.03171 WHERE `id`=14322;
-- Cho'Rush the Observer (Entry: 14324) (Distance: 2.16967)
-- Old: .go 835.363 487.861 37.3182 429
-- New: .go 833.995 489.543 37.4015 429
UPDATE `creature` SET `position_x`=833.995, `position_y`=489.543, `position_z`=37.4015, `orientation`=3.21141 WHERE `id`=14324;
-- Knot Thimblejack (Entry: 14338) (Distance: 7.29995)
-- Old: .go 573.797 523.753 -25.4027 429
-- New: .go 581.082 523.293 -25.3194 429
UPDATE `creature` SET `position_x`=581.082, `position_y`=523.293, `position_z`=-25.3194, `orientation`=2.72271 WHERE `id`=14338;
-- Shen'dralar Provisioner (Entry: 14371) (Distance: 13.5891)
-- Old: .go 114.74 446.98 -48.29 429
-- New: .go 120.661 459.211 -48.3785 429
UPDATE `creature` SET `position_x`=120.661, `position_y`=459.211, `position_z`=-48.3785, `orientation`=6.21337 WHERE `id`=14371;
-- Lorekeeper Javon (Entry: 14381) (Distance: 15.9925)
-- Old: .go 194.97 530.78 -48.29 429
-- New: .go 193.607 514.846 -48.3836 429
UPDATE `creature` SET `position_x`=193.607, `position_y`=514.846, `position_z`=-48.3836, `orientation`=0.122173 WHERE `id`=14381;
-- Griniblix the Spectator (Entry: 14395) (Distance: 0)
-- Old: .go -3762.79 1135.47 159.675 1
-- New: .go -3762.79 1135.47 159.675 1
UPDATE `creature` SET `position_x`=-3762.79, `position_y`=1135.47, `position_z`=159.675, `orientation`=4.79966 WHERE `id`=14395;
-- Alowicious Czervik (Entry: 14480) (Distance: 0.0098877)
-- Old: .go 1627.81 -4413.17 15.7001 1
-- New: .go 1627.82 -4413.17 15.7001 1
UPDATE `creature` SET `position_x`=1627.82, `position_y`=-4413.17, `position_z`=15.7001, `orientation`=4.13643 WHERE `id`=14480;
-- Emmithue Smails (Entry: 14481) (Distance: 0.760164)
-- Old: .go -8864.46 658.466 96.5078 0
-- New: .go -8864.83 657.803 96.5433 0
UPDATE `creature` SET `position_x`=-8864.83, `position_y`=657.803, `position_z`=96.5433, `orientation`=5.3058 WHERE `id`=14481;
-- Eris Havenfire (Entry: 14494) (Distance: 2.05005)
-- Old: .go 3324.38 -2994.73 164.791 0
-- New: .go 3325.62 -2996.32 164.422 0
UPDATE `creature` SET `position_x`=3325.62, `position_y`=-2996.32, `position_z`=164.422, `orientation`=6.10865 WHERE `id`=14494;
-- Short John Mithril (Entry: 14508) (Distance: 0.000598907)
-- Old: .go -13184.5 332.671 40.3307 0
-- New: .go -13184.5 332.671 40.3313 0
UPDATE `creature` SET `position_x`=-13184.5, `position_y`=332.671, `position_z`=40.3313, `orientation`=4.41568 WHERE `id`=14508;
-- High Priestess Jeklik (Entry: 14517) (Distance: 3.0526)
-- Old: .go -12289.7 -1382.18 144.643 309
-- New: .go -12291.9 -1380.08 144.902 309
UPDATE `creature` SET `position_x`=-12291.9, `position_y`=-1380.08, `position_z`=144.902, `orientation`=2.28638 WHERE `id`=14517;
-- Swift Green Mechanostrider (Entry: 14553) (Distance: 0)
-- Old: .go -5449.28 -614.756 394.539 0
-- New: .go -5449.28 -614.756 394.539 0
UPDATE `creature` SET `position_x`=-5449.28, `position_y`=-614.756, `position_z`=394.539, `orientation`=3.68264 WHERE `id`=14553;
-- Purple Skeletal Warhorse (Entry: 14558) (Distance: 1.6155)
-- Old: .go 2248.66 331.206 35.2725 0
-- New: .go 2248.66 331.207 36.888 0
UPDATE `creature` SET `position_x`=2248.66, `position_y`=331.207, `position_z`=36.888, `orientation`=5.58505 WHERE `id`=14558;
-- Derotain Mudsipper (Entry: 14567) (Distance: 0)
-- Old: .go -7193.62 -3763.79 8.89769 1
-- New: .go -7193.62 -3763.79 8.89769 1
UPDATE `creature` SET `position_x`=-7193.62, `position_y`=-3763.79, `position_z`=8.89769, `orientation`=3.68264 WHERE `id`=14567;
-- Sergeant Thunderhorn (Entry: 14581) (Distance: 0.332791)
-- Old: .go 243.861 103.839 25.9038 450
-- New: .go 244.059 103.591 25.8036 450
UPDATE `creature` SET `position_x`=244.059, `position_y`=103.591, `position_z`=25.8036, `orientation`=4.66003 WHERE `id`=14581;
-- Stratholme Trigger (Entry: 14646) (Distance: 13.3285)
-- Old: .go 3479.8 -3060.93 135.002 329
-- New: .go 3492.34 -3065.4 135.646 329
UPDATE `creature` SET `position_x`=3492.34, `position_y`=-3065.4, `position_z`=135.646, `orientation`=4.72984 WHERE `id`=14646;
-- Sentinel Farsong (Entry: 14733) (Distance: 0)
-- Old: .go 1447.91 -1866.85 127.464 1
-- New: .go 1447.91 -1866.85 127.464 1
UPDATE `creature` SET `position_x`=1447.91, `position_y`=-1866.85, `position_z`=127.464, `orientation`=6.23083 WHERE `id`=14733;
-- Stonehearth Marshal (Entry: 14765) (Distance: 1.42617)
-- Old: .go 732.6 -14.7968 50.6213 30
-- New: .go 731.819 -13.6064 50.7046 30
UPDATE `creature` SET `position_x`=731.819, `position_y`=-13.6064, `position_z`=50.7046, `orientation`=3.1765 WHERE `id`=14765;
-- East Frostwolf Marshal (Entry: 14768) (Distance: 4.61336)
-- Old: .go 731.721 -11.7778 50.6225 30
-- New: .go 732.837 -16.2534 50.7046 30
UPDATE `creature` SET `position_x`=732.837, `position_y`=-16.2534, `position_z`=50.7046, `orientation`=3.29867 WHERE `id`=14768;
-- West Frostwolf Marshal (Entry: 14769) (Distance: 28.7498)
-- Old: .go 706.025 -18.7279 50.1354 30
-- New: .go 727.888 -0.066786 50.7046 30
UPDATE `creature` SET `position_x`=727.888, `position_y`=-0.066786, `position_z`=50.7046, `orientation`=3.76991 WHERE `id`=14769;
-- Dun Baldar North Warmaster (Entry: 14770) (Distance: 3.55296)
-- Old: .go -1359.1 -227.445 98.3994 30
-- New: .go -1360.07 -224.028 98.4815 30
UPDATE `creature` SET `position_x`=-1360.07, `position_y`=-224.028, `position_z`=98.4815, `orientation`=3.61283 WHERE `id`=14770;
-- Dun Baldar South Warmaster (Entry: 14771) (Distance: 1.73261)
-- Old: .go -1363.81 -220.288 98.4004 30
-- New: .go -1362.87 -221.741 98.4841 30
UPDATE `creature` SET `position_x`=-1362.87, `position_y`=-221.741, `position_z`=98.4841, `orientation`=4.2586 WHERE `id`=14771;
-- East Frostwolf Warmaster (Entry: 14772) (Distance: 0.588129)
-- Old: .go -1363.42 -235.558 98.398 30
-- New: .go -1363.92 -235.26 98.4822 30
UPDATE `creature` SET `position_x`=-1363.92, `position_y`=-235.26, `position_z`=98.4822, `orientation`=2.04204 WHERE `id`=14772;
-- Iceblood Warmaster (Entry: 14773) (Distance: 9.18667)
-- Old: .go -1359.93 -223.851 98.3984 30
-- New: .go -1368.01 -219.481 98.5099 30
UPDATE `creature` SET `position_x`=-1368.01, `position_y`=-219.481, `position_z`=98.5099, `orientation`=4.7473 WHERE `id`=14773;
-- Icewing Warmaster (Entry: 14774) (Distance: 0.193271)
-- Old: .go -1375.55 -226.07 98.4258 30
-- New: .go -1375.55 -225.896 98.5099 30
UPDATE `creature` SET `position_x`=-1375.55, `position_y`=-225.896, `position_z`=98.5099, `orientation`=0.663225 WHERE `id`=14774;
-- Stonehearth Warmaster (Entry: 14775) (Distance: 0.696787)
-- Old: .go -1359.29 -230.887 98.3979 30
-- New: .go -1359.98 -230.839 98.4827 30
UPDATE `creature` SET `position_x`=-1359.98, `position_y`=-230.839, `position_z`=98.4827, `orientation`=1.76278 WHERE `id`=14775;
-- Tower Point Warmaster (Entry: 14776) (Distance: 0.397054)
-- Old: .go -1370.51 -235.705 98.4256 30
-- New: .go -1370.85 -235.518 98.5099 30
UPDATE `creature` SET `position_x`=-1370.85, `position_y`=-235.518, `position_z`=98.5099, `orientation`=1.20428 WHERE `id`=14776;
-- West Frostwolf Warmaster (Entry: 14777) (Distance: 0.802004)
-- Old: .go -1374.38 -233.017 98.4258 30
-- New: .go -1374.56 -232.24 98.5099 30
UPDATE `creature` SET `position_x`=-1374.56, `position_y`=-232.24, `position_z`=98.5099, `orientation`=0.872665 WHERE `id`=14777;
-- Ysondre (Entry: 14887) (Distance: 17.2594)
-- Old: .go 869.667 -3974.87 145.827 0
-- New: .go 852.873 -3978.85 145.916 0
UPDATE `creature` SET `position_x`=852.873, `position_y`=-3978.85, `position_z`=145.916, `orientation`=3.40339 WHERE `id`=14887;
-- Zandalarian Event Generator (Entry: 14994) (Distance: 0)
-- Old: .go -11847 1280.86 3.16509 0
-- New: .go -11847 1280.86 3.16509 0
UPDATE `creature` SET `position_x`=-11847, `position_y`=1280.86, `position_z`=3.16509, `orientation`=6.17847 WHERE `id`=14994;
-- Fishbot 5000 (Entry: 15079) (Distance: 0.100591)
-- Old: .go -14438.7 476.31 15.3591 0
-- New: .go -14438.6 476.311 15.3591 0
UPDATE `creature` SET `position_x`=-14438.6, `position_y`=476.311, `position_z`=15.3591, `orientation`=4.04916 WHERE `id`=15079;
-- Barrus (Entry: 15119) (Distance: 1.42005)
-- Old: .go -4965.1 -934.93 501.66 0
-- New: .go -4964.69 -936.287 501.743 0
UPDATE `creature` SET `position_x`=-4964.69, `position_y`=-936.287, `position_z`=501.743, `orientation`=5.44543 WHERE `id`=15119;
-- Rutherford Twing (Entry: 15126) (Distance: 0.0462036)
-- Old: .go -845.512 -3507.93 73.6511 0
-- New: .go -845.512 -3507.93 73.6973 0
UPDATE `creature` SET `position_x`=-845.512, `position_y`=-3507.93, `position_z`=73.6973, `orientation`=3.47321 WHERE `id`=15126;
-- Samuel Hawke (Entry: 15127) (Distance: 0.104399)
-- Old: .go -1218.48 -2521.56 21.9227 0
-- New: .go -1218.48 -2521.56 22.0271 0
UPDATE `creature` SET `position_x`=-1218.48, `position_y`=-2521.56, `position_z`=22.0271, `orientation`=3.66519 WHERE `id`=15127;
-- Ralo'shan the Eternal Watcher (Entry: 15169) (Distance: 2.0131)
-- Old: .go -6547.1 92.2979 170.318 1
-- New: .go -6546.67 90.3313 170.318 1
UPDATE `creature` SET `position_x`=-6546.67, `position_y`=90.3313, `position_z`=170.318, `orientation`=0.343433 WHERE `id`=15169;
-- Anachronos (Entry: 15192) (Distance: 4.71423)
-- Old: .go -8176.58 -4722.57 28.0784 1
-- New: .go -8175.67 -4718.28 26.3489 1
UPDATE `creature` SET `position_x`=-8175.67, `position_y`=-4718.28, `position_z`=26.3489, `orientation`=1.88496 WHERE `id`=15192;
-- Sergeant Hartman (Entry: 15199) (Distance: 3.12139)
-- Old: .go -826.324 -532.834 14.45 0
-- New: .go -823.265 -533.254 14.9076 0
UPDATE `creature` SET `position_x`=-823.265, `position_y`=-533.254, `position_z`=14.9076, `orientation`=0.890118 WHERE `id`=15199;
-- The Prophet Skeram (Entry: 15263) (Distance: 3.53489)
-- Old: .go -8343.2 2083.07 125.65 531
-- New: .go -8346.05 2080.98 125.732 531
UPDATE `creature` SET `position_x`=-8346.05, `position_y`=2080.98, `position_z`=125.732, `orientation`=0.401426 WHERE `id`=15263;
-- Emperor Vek'lor (Entry: 15276) (Distance: 5.8804)
-- Old: .go -8874.06 1204.74 -104.17 531
-- New: .go -8868.31 1205.97 -104.231 531
UPDATE `creature` SET `position_x`=-8868.31, `position_y`=1205.97, `position_z`=-104.231, `orientation`=2.70526 WHERE `id`=15276;
-- Viscidus (Entry: 15299) (Distance: 6.67761)
-- Old: .go -7993.96 926.309 -52.699 531
-- New: .go -8000.18 928.603 -51.9009 531
UPDATE `creature` SET `position_x`=-8000.18, `position_y`=928.603, `position_z`=-51.9009, `orientation`=1.53589 WHERE `id`=15299;
-- Ossirian the Unscarred (Entry: 15339) (Distance: 15.4252)
-- Old: .go -9493.6 2030.27 105.48 509
-- New: .go -9502.8 2042.65 105.31 509
UPDATE `creature` SET `position_x`=-9502.8, `position_y`=2042.65, `position_z`=105.31, `orientation`=5.65487 WHERE `id`=15339;
-- Katrina Shimmerstar (Entry: 15353) (Distance: 0)
-- Old: .go -4918.64 -983.141 501.538 0
-- New: .go -4918.64 -983.141 501.538 0
UPDATE `creature` SET `position_x`=-4918.64, `position_y`=-983.141, `position_z`=501.538, `orientation`=2.26893 WHERE `id`=15353;
-- Sergeant Stonebrow (Entry: 15383) (Distance: 1.86837)
-- Old: .go -4925.28 -1224.36 501.638 0
-- New: .go -4924.37 -1222.73 501.718 0
UPDATE `creature` SET `position_x`=-4924.37, `position_y`=-1222.73, `position_z`=501.718, `orientation`=3.92699 WHERE `id`=15383;
-- Kania (Entry: 15419) (Distance: 0)
-- Old: .go -6880.52 727.228 55.1345 1
-- New: .go -6880.52 727.228 55.1345 1
UPDATE `creature` SET `position_x`=-6880.52, `position_y`=727.228, `position_z`=55.1345, `orientation`=5.00909 WHERE `id`=15419;
-- Corporal Carnes (Entry: 15431) (Distance: 1.25469)
-- Old: .go -4915.03 -1228.4 501.651 0
-- New: .go -4914.17 -1227.49 501.733 0
UPDATE `creature` SET `position_x`=-4914.17, `position_y`=-1227.49, `position_z`=501.733, `orientation`=3.59538 WHERE `id`=15431;
-- Dame Twinbraid (Entry: 15432) (Distance: 0.575322)
-- Old: .go -4930.47 -1219.29 501.636 0
-- New: .go -4930.29 -1218.75 501.719 0
UPDATE `creature` SET `position_x`=-4930.29, `position_y`=-1218.75, `position_z`=501.719, `orientation`=3.75246 WHERE `id`=15432;
-- Private Draxlegauge (Entry: 15434) (Distance: 0.790897)
-- Old: .go -4952.35 -1275.23 501.673 0
-- New: .go -4952.25 -1274.45 501.757 0
UPDATE `creature` SET `position_x`=-4952.25, `position_y`=-1274.45, `position_z`=501.757, `orientation`=1.79769 WHERE `id`=15434;
-- Master Nightsong (Entry: 15437) (Distance: 6.27134)
-- Old: .go -4939.25 -1283.14 501.672 0
-- New: .go -4945.42 -1282.02 501.758 0
UPDATE `creature` SET `position_x`=-4945.42, `position_y`=-1282.02, `position_z`=501.758, `orientation`=1.02974 WHERE `id`=15437;
-- Janela Stouthammer (Entry: 15443) (Distance: 0.0942812)
-- Old: .go -7178.58 1392.09 2.8017 1
-- New: .go -7178.56 1392.07 2.89163 1
UPDATE `creature` SET `position_x`=-7178.56, `position_y`=1392.07, `position_z`=2.89163, `orientation`=2.25147 WHERE `id`=15443;
-- Sergeant Major Germaine (Entry: 15445) (Distance: 2.24468)
-- Old: .go -4946.11 -1274.12 501.672 0
-- New: .go -4948.33 -1273.8 501.755 0
UPDATE `creature` SET `position_x`=-4948.33, `position_y`=-1273.8, `position_z`=501.755, `orientation`=1.06465 WHERE `id`=15445;
-- Bonnie Stoneflayer (Entry: 15446) (Distance: 1.60537)
-- Old: .go -4972.1 -1167.46 501.637 0
-- New: .go -4972.2 -1169.06 501.72 0
UPDATE `creature` SET `position_x`=-4972.2, `position_y`=-1169.06, `position_z`=501.72, `orientation`=3.28122 WHERE `id`=15446;
-- Private Porter (Entry: 15448) (Distance: 0.550378)
-- Old: .go -4966.38 -1176.52 501.658 0
-- New: .go -4966.09 -1176.06 501.743 0
UPDATE `creature` SET `position_x`=-4966.09, `position_y`=-1176.06, `position_z`=501.743, `orientation`=3.29867 WHERE `id`=15448;
-- Marta Finespindle (Entry: 15450) (Distance: 2.71405)
-- Old: .go -4968.14 -1182.61 501.658 0
-- New: .go -4969.46 -1180.24 501.743 0
UPDATE `creature` SET `position_x`=-4969.46, `position_y`=-1180.24, `position_z`=501.743, `orientation`=3.24631 WHERE `id`=15450;
-- Sentinel Silversky (Entry: 15451) (Distance: 0.419708)
-- Old: .go -4971.16 -1151.52 501.657 0
-- New: .go -4971.57 -1151.56 501.739 0
UPDATE `creature` SET `position_x`=-4971.57, `position_y`=-1151.56, `position_z`=501.739, `orientation`=3.56047 WHERE `id`=15451;
-- Nurse Stonefield (Entry: 15452) (Distance: 2.01972)
-- Old: .go -4979.71 -1147.58 501.654 0
-- New: .go -4979.12 -1149.51 501.733 0
UPDATE `creature` SET `position_x`=-4979.12, `position_y`=-1149.51, `position_z`=501.733, `orientation`=3.36849 WHERE `id`=15452;
-- Keeper Moonshade (Entry: 15453) (Distance: 2.80009)
-- Old: .go -4977.83 -1140.32 501.658 0
-- New: .go -4979.93 -1142.17 501.743 0
UPDATE `creature` SET `position_x`=-4979.93, `position_y`=-1142.17, `position_z`=501.743, `orientation`=3.68264 WHERE `id`=15453;
-- Slicky Gastronome (Entry: 15455) (Distance: 0.350365)
-- Old: .go -4938.26 -1275.34 501.669 0
-- New: .go -4938 -1275.12 501.752 0
UPDATE `creature` SET `position_x`=-4938, `position_y`=-1275.12, `position_z`=501.752, `orientation`=2.46091 WHERE `id`=15455;
-- Sarah Sadwhistle (Entry: 15456) (Distance: 5.85668)
-- Old: .go -4937.05 -1272.89 501.668 0
-- New: .go -4940.39 -1277.7 501.754 0
UPDATE `creature` SET `position_x`=-4940.39, `position_y`=-1277.7, `position_z`=501.754, `orientation`=1.98968 WHERE `id`=15456;
-- Huntress Swiftriver (Entry: 15457) (Distance: 1.05869)
-- Old: .go -4934.59 -1279.86 501.667 0
-- New: .go -4933.8 -1279.16 501.749 0
UPDATE `creature` SET `position_x`=-4933.8, `position_y`=-1279.16, `position_z`=501.749, `orientation`=2.42601 WHERE `id`=15457;
-- Commander Stronghammer (Entry: 15458) (Distance: 4.30734)
-- Old: .go 1634.69 -4120.05 31.1058 1
-- New: .go 1630.69 -4118.46 31.2658 1
UPDATE `creature` SET `position_x`=1630.69, `position_y`=-4118.46, `position_z`=31.2658, `orientation`=1.97222 WHERE `id`=15458;
-- Miner Cromwell (Entry: 15459) (Distance: 8.40312)
-- Old: .go 1655.1 -4117.49 32.7259 1
-- New: .go 1650.33 -4124.29 31.4523 1
UPDATE `creature` SET `position_x`=1650.33, `position_y`=-4124.29, `position_z`=31.4523, `orientation`=2.6529 WHERE `id`=15459;
-- Grunt Maug (Entry: 15460) (Distance: 2.21421)
-- Old: .go 1664.42 -4115.77 34.0364 1
-- New: .go 1665.76 -4117.5 34.3746 1
UPDATE `creature` SET `position_x`=1665.76, `position_y`=-4117.5, `position_z`=34.3746, `orientation`=2.44346 WHERE `id`=15460;
-- Senior Sergeant T'kelah (Entry: 15469) (Distance: 4.15354)
-- Old: .go 1659.75 -4120.32 32.9536 1
-- New: .go 1655.77 -4119.16 32.6951 1
UPDATE `creature` SET `position_x`=1655.77, `position_y`=-4119.16, `position_z`=32.6951, `orientation`=1.32645 WHERE `id`=15469;
-- Herbalist Proudfeather (Entry: 15477) (Distance: 6.40166)
-- Old: .go 1620.6 -4142.49 34.4287 1
-- New: .go 1615.01 -4145.53 35.132 1
UPDATE `creature` SET `position_x`=1615.01, `position_y`=-4145.53, `position_z`=35.132, `orientation`=1.37881 WHERE `id`=15477;
-- Keyl Swiftclaw (Entry: 15500) (Distance: 0)
-- Old: .go -6876.72 734.648 45.7454 1
-- New: .go -6876.72 734.648 45.7454 1
UPDATE `creature` SET `position_x`=-6876.72, `position_y`=734.648, `position_z`=45.7454, `orientation`=0.0698132 WHERE `id`=15500;
-- Andorgos (Entry: 15502) (Distance: 0.323733)
-- Old: .go -8495.99 1932.35 135.659 531
-- New: .go -8496.15 1932.62 135.738 531
UPDATE `creature` SET `position_x`=-8496.15, `position_y`=1932.62, `position_z`=135.738, `orientation`=1.309 WHERE `id`=15502;
-- Kandrostrasz (Entry: 15503) (Distance: 0.461506)
-- Old: .go -8500.4 1937.76 135.677 531
-- New: .go -8500.15 1937.38 135.755 531
UPDATE `creature` SET `position_x`=-8500.15, `position_y`=1937.38, `position_z`=135.755, `orientation`=0.471239 WHERE `id`=15503;
-- Vethsera (Entry: 15504) (Distance: 0.612621)
-- Old: .go -8499.72 1933.05 135.621 531
-- New: .go -8499.58 1933.64 135.709 531
UPDATE `creature` SET `position_x`=-8499.58, `position_y`=1933.64, `position_z`=135.709, `orientation`=0.977384 WHERE `id`=15504;
-- Batrider Pele'keiki (Entry: 15508) (Distance: 9.71209)
-- Old: .go 1625.6 -4140.03 33.9407 1
-- New: .go 1625.95 -4149.42 36.3958 1
UPDATE `creature` SET `position_x`=1625.95, `position_y`=-4149.42, `position_z`=36.3958, `orientation`=1.90241 WHERE `id`=15508;
-- Lord Kri (Entry: 15511) (Distance: 2.48446)
-- Old: .go -8566.02 2174.84 -4.04391 531
-- New: .go -8566.88 2177.17 -3.97898 531
UPDATE `creature` SET `position_x`=-8566.88, `position_y`=2177.17, `position_z`=-3.97898, `orientation`=4.2237 WHERE `id`=15511;
-- Apothecary Jezel (Entry: 15512) (Distance: 5.89354)
-- Old: .go 1630.73 -4137.01 33.2209 1
-- New: .go 1633.26 -4142.12 34.7099 1
UPDATE `creature` SET `position_x`=1633.26, `position_y`=-4142.12, `position_z`=34.7099, `orientation`=2.11185 WHERE `id`=15512;
-- Skinner Jamani (Entry: 15515) (Distance: 9.55037)
-- Old: .go 1589.92 -4189.21 41.1973 1
-- New: .go 1588.17 -4179.9 39.9849 1
UPDATE `creature` SET `position_x`=1588.17, `position_y`=-4179.9, `position_z`=39.9849, `orientation`=2.89725 WHERE `id`=15515;
-- Sergeant Umala (Entry: 15522) (Distance: 15.8944)
-- Old: .go 1593.29 -4175.12 39.5034 1
-- New: .go 1593.27 -4159.44 36.9024 1
UPDATE `creature` SET `position_x`=1593.27, `position_y`=-4159.44, `position_z`=36.9024, `orientation`=2.94961 WHERE `id`=15522;
-- Doctor Serratus (Entry: 15525) (Distance: 7.97263)
-- Old: .go 1594.95 -4182.28 40.669 1
-- New: .go 1595.76 -4174.4 39.7667 1
UPDATE `creature` SET `position_x`=1595.76, `position_y`=-4174.4, `position_z`=39.7667, `orientation`=2.72271 WHERE `id`=15525;
-- Healer Longrunner (Entry: 15528) (Distance: 10.4057)
-- Old: .go 1582.36 -4126.28 34.1803 1
-- New: .go 1580.17 -4116.11 34.4158 1
UPDATE `creature` SET `position_x`=1580.17, `position_y`=-4116.11, `position_z`=34.4158, `orientation`=5.60251 WHERE `id`=15528;
-- Stoneguard Clayhoof (Entry: 15532) (Distance: 15.3196)
-- Old: .go 1574.25 -4136.17 36.0009 1
-- New: .go 1565.07 -4123.99 37.4408 1
UPDATE `creature` SET `position_x`=1565.07, `position_y`=-4123.99, `position_z`=37.4408, `orientation`=0 WHERE `id`=15532;
-- Bloodguard Rawtar (Entry: 15533) (Distance: 4.34305)
-- Old: .go 1639.54 -4086.81 36.4588 1
-- New: .go 1643.43 -4085.09 37.3372 1
UPDATE `creature` SET `position_x`=1643.43, `position_y`=-4085.09, `position_z`=37.3372, `orientation`=4.67748 WHERE `id`=15533;
-- Fisherman Lin'do (Entry: 15534) (Distance: 2.9981)
-- Old: .go 1628.1 -4091.53 34.9493 1
-- New: .go 1629.79 -4089.15 35.6329 1
UPDATE `creature` SET `position_x`=1629.79, `position_y`=-4089.15, `position_z`=35.6329, `orientation`=5.25344 WHERE `id`=15534;
-- Chief Sharpclaw (Entry: 15535) (Distance: 3.02694)
-- Old: .go 1633.13 -4087.79 35.9409 1
-- New: .go 1634.12 -4084.99 36.5257 1
UPDATE `creature` SET `position_x`=1634.12, `position_y`=-4084.99, `position_z`=36.5257, `orientation`=5.21853 WHERE `id`=15535;
-- General Zog (Entry: 15539) (Distance: 7.57796)
-- Old: .go -4985.49 -1212.1 501.672 0
-- New: .go -4981.25 -1218.38 501.756 0
UPDATE `creature` SET `position_x`=-4981.25, `position_y`=-1218.38, `position_z`=501.756, `orientation`=3.80482 WHERE `id`=15539;
-- Princess Yauj (Entry: 15543) (Distance: 1.24814)
-- Old: .go -8587.09 2175.1 -4.23954 531
-- New: .go -8587.96 2174.21 -4.14782 531
UPDATE `creature` SET `position_x`=-8587.96, `position_y`=2174.21, `position_z`=-4.14782, `orientation`=4.93928 WHERE `id`=15543;
-- Doctor Weavil (Entry: 15552) (Distance: 0.301981)
-- Old: .go -2632.77 -5062.27 34.5216 1
-- New: .go -2632.94 -5062.04 34.6187 1
UPDATE `creature` SET `position_x`=-2632.94, `position_y`=-5062.04, `position_z`=34.6187, `orientation`=2.60054 WHERE `id`=15552;
-- Elder Rumblerock (Entry: 15557) (Distance: 37.0968)
-- Old: .go -7955.99 -2701.6 190.629 0
-- New: .go -7938.57 -2674.64 209.226 0
UPDATE `creature` SET `position_x`=-7938.57, `position_y`=-2674.64, `position_z`=209.226, `orientation`=3.75246 WHERE `id`=15557;
-- Elder Silvervein (Entry: 15558) (Distance: 13.3305)
-- Old: .go -5339.71 -2900.36 343.356 0
-- New: .go -5343.72 -2912.94 345.191 0
UPDATE `creature` SET `position_x`=-5343.72, `position_y`=-2912.94, `position_z`=345.191, `orientation`=4.43314 WHERE `id`=15558;
-- Elder Bellowrage (Entry: 15563) (Distance: 85.7711)
-- Old: .go -11793.4 -3181.84 -30.2682 0
-- New: .go -11721.4 -3209.99 6.88361 0
UPDATE `creature` SET `position_x`=-11721.4, `position_y`=-3209.99, `position_z`=6.88361, `orientation`=6.26573 WHERE `id`=15563;
-- Elder Ironband (Entry: 15567) (Distance: 4.38717)
-- Old: .go -7274.65 -801.765 296.871 0
-- New: .go -7276.75 -797.924 296.582 0
UPDATE `creature` SET `position_x`=-7276.75, `position_y`=-797.924, `position_z`=296.582, `orientation`=5.8294 WHERE `id`=15567;
-- Elder Primestone (Entry: 15570) (Distance: 75.981)
-- Old: .go -6202.55 1801.27 19.3972 1
-- New: .go -6233.34 1733.29 5.12093 1
UPDATE `creature` SET `position_x`=-6233.34, `position_y`=1733.29, `position_z`=5.12093, `orientation`=3.7001 WHERE `id`=15570;
-- Elder Runetotem (Entry: 15572) (Distance: 1.81188)
-- Old: .go 268.438 -4775.68 11.8795 1
-- New: .go 269.454 -4777.18 11.9039 1
UPDATE `creature` SET `position_x`=269.454, `position_y`=-4777.18, `position_z`=11.9039, `orientation`=1.6057 WHERE `id`=15572;
-- Elder Ragetotem (Entry: 15573) (Distance: 30.3473)
-- Old: .go -9560.5 -2700.24 12.281 1
-- New: .go -9579.68 -2723.7 13.9323 1
UPDATE `creature` SET `position_x`=-9579.68, `position_y`=-2723.7, `position_z`=13.9323, `orientation`=5.53269 WHERE `id`=15573;
-- Elder Skychaser (Entry: 15577) (Distance: 0.651268)
-- Old: .go -10499.3 1033.81 95.6127 0
-- New: .go -10498.7 1034.05 95.6965 0
UPDATE `creature` SET `position_x`=-10498.7, `position_y`=1034.05, `position_z`=95.6965, `orientation`=1.43117 WHERE `id`=15577;
-- Elder Wildmane (Entry: 15578) (Distance: 0.348489)
-- Old: .go 1689.15 1147.89 8.87702 209
-- New: .go 1689.04 1147.57 8.96011 209
UPDATE `creature` SET `position_x`=1689.04, `position_y`=1147.57, `position_z`=8.96011, `orientation`=2.37365 WHERE `id`=15578;
-- Elder Grimtotem (Entry: 15581) (Distance: 0.599858)
-- Old: .go -4122.88 109.93 75.8011 1
-- New: .go -4122.6 110.454 75.8846 1
UPDATE `creature` SET `position_x`=-4122.6, `position_y`=110.454, `position_z`=75.8846, `orientation`=5.77704 WHERE `id`=15581;
-- Elder Thunderhorn (Entry: 15583) (Distance: 2.55269)
-- Old: .go -7842.99 -1329.69 -265.086 1
-- New: .go -7845.33 -1330.45 -264.405 1
UPDATE `creature` SET `position_x`=-7845.33, `position_y`=-1330.45, `position_z`=-264.405, `orientation`=3.15905 WHERE `id`=15583;
-- Elder Dawnstrider (Entry: 15585) (Distance: 2.18647)
-- Old: .go -7498.78 -2154.67 146.658 0
-- New: .go -7500.86 -2154.59 145.989 0
UPDATE `creature` SET `position_x`=-7500.86, `position_y`=-2154.59, `position_z`=145.989, `orientation`=2.72271 WHERE `id`=15585;
-- Elder Dreamseer (Entry: 15586) (Distance: 40.5954)
-- Old: .go -7116.61 -3780.11 8.67008 1
-- New: .go -7155.9 -3769.91 9.1562 1
UPDATE `creature` SET `position_x`=-7155.9, `position_y`=-3769.91, `position_z`=9.1562, `orientation`=2.37365 WHERE `id`=15586;
-- Elder Mistwalker (Entry: 15587) (Distance: 5.3122)
-- Old: .go -3801.35 1092.59 131.969 1
-- New: .go -3806.54 1093.72 132.053 1
UPDATE `creature` SET `position_x`=-3806.54, `position_y`=1093.72, `position_z`=132.053, `orientation`=6.26573 WHERE `id`=15587;
-- Elder High Mountain (Entry: 15588) (Distance: 3.57133)
-- Old: .go -2300.68 -1946.13 96.2758 1
-- New: .go -2297.67 -1948.05 96.3634 1
UPDATE `creature` SET `position_x`=-2297.67, `position_y`=-1948.05, `position_z`=96.3634, `orientation`=3.61283 WHERE `id`=15588;
-- Elder Starsong (Entry: 15593) (Distance: 1.79405)
-- Old: .go -415.042 7.16811 -90.854 109
-- New: .go -414.836 5.38781 -90.772 109
UPDATE `creature` SET `position_x`=-414.836, `position_y`=5.38781, `position_z`=-90.772, `orientation`=2.11185 WHERE `id`=15593;
-- Elder Bladeleaf (Entry: 15595) (Distance: 1.8681)
-- Old: .go 9768.83 897.046 1296.84 1
-- New: .go 9768.04 895.38 1297.14 1
UPDATE `creature` SET `position_x`=9768.04, `position_y`=895.38, `position_z`=1297.14, `orientation`=1.25664 WHERE `id`=15595;
-- Elder Starglade (Entry: 15596) (Distance: 2.34932)
-- Old: .go -11953.6 -1166.55 77.6702 0
-- New: .go -11954.2 -1168.82 77.7486 0
UPDATE `creature` SET `position_x`=-11954.2, `position_y`=-1168.82, `position_z`=77.7486, `orientation`=0.506145 WHERE `id`=15596;
-- Elder Bladesing (Entry: 15599) (Distance: 0.406625)
-- Old: .go -6833.13 831.946 49.4559 1
-- New: .go -6832.99 831.573 49.5379 1
UPDATE `creature` SET `position_x`=-6832.99, `position_y`=831.573, `position_z`=49.5379, `orientation`=2.61799 WHERE `id`=15599;
-- Elder Skygleam (Entry: 15600) (Distance: 5.73063)
-- Old: .go 2459.51 -6956.14 111.238 1
-- New: .go 2465.04 -6955.1 112.323 1
UPDATE `creature` SET `position_x`=2465.04, `position_y`=-6955.1, `position_z`=112.323, `orientation`=1.76278 WHERE `id`=15600;
-- Elder Starweave (Entry: 15601) (Distance: 1.15319)
-- Old: .go 6290.95 530.87 16.2558 1
-- New: .go 6292.08 530.671 16.3725 1
UPDATE `creature` SET `position_x`=6292.08, `position_y`=530.671, `position_z`=16.3725, `orientation`=5.61996 WHERE `id`=15601;
-- Elder Nightwind (Entry: 15603) (Distance: 4.7478)
-- Old: .go 5101.63 -522.688 335.06 1
-- New: .go 5101.41 -527.394 334.471 1
UPDATE `creature` SET `position_x`=5101.41, `position_y`=-527.394, `position_z`=334.471, `orientation`=4.53786 WHERE `id`=15603;
-- Elder Morningdew (Entry: 15604) (Distance: 25.3561)
-- Old: .go -6234.48 -3941.96 -58.751 1
-- New: .go -6226.63 -3917.87 -59.7434 1
UPDATE `creature` SET `position_x`=-6226.63, `position_y`=-3917.87, `position_z`=-59.7434, `orientation`=1.18682 WHERE `id`=15604;
-- Elder Riversong (Entry: 15605) (Distance: 53.8538)
-- Old: .go 2809.42 -298.311 109.197 1
-- New: .go 2793.03 -349.605 108.471 1
UPDATE `creature` SET `position_x`=2793.03, `position_y`=-349.605, `position_z`=108.471, `orientation`=2.21657 WHERE `id`=15605;
-- Elder Farwhisper (Entry: 15607) (Distance: 0.591112)
-- Old: .go 3705.5 -3466.29 130.77 329
-- New: .go 3705.22 -3466.81 130.794 329
UPDATE `creature` SET `position_x`=3705.22, `position_y`=-3466.81, `position_z`=130.794, `orientation`=0 WHERE `id`=15607;
-- Krug Skullsplit (Entry: 15612) (Distance: 0.0596008)
-- Old: .go -7547.94 718.819 -16.2931 1
-- New: .go -7547.94 718.819 -16.2335 1
UPDATE `creature` SET `position_x`=-7547.94, `position_y`=718.819, `position_z`=-16.2335, `orientation`=4.66003 WHERE `id`=15612;
-- Shadow Priestess Shai (Entry: 15615) (Distance: 0.0312004)
-- Old: .go -7556.6 749.007 -17.5788 1
-- New: .go -7556.6 749.007 -17.5476 1
UPDATE `creature` SET `position_x`=-7556.6, `position_y`=749.007, `position_z`=-17.5476, `orientation`=5.61996 WHERE `id`=15615;
-- Auctioneer Yarly (Entry: 15676) (Distance: 0)
-- Old: .go 1609.71 187.175 -56.7907 0
-- New: .go 1609.71 187.175 -56.7907 0
UPDATE `creature` SET `position_x`=1609.71, `position_y`=187.175, `position_z`=-56.7907, `orientation`=0.0523599 WHERE `id`=15676;
-- Senior Sergeant Taiga (Entry: 15702) (Distance: 0.522488)
-- Old: .go -1209.07 100.11 134.689 1
-- New: .go -1209.58 100.22 134.661 1
UPDATE `creature` SET `position_x`=-1209.58, `position_y`=100.22, `position_z`=134.661, `orientation`=3.15905 WHERE `id`=15702;
-- Senior Sergeant Grimsford (Entry: 15703) (Distance: 77.9139)
-- Old: .go 1628.4 218.35 -43.1026 0
-- New: .go 1572.58 272.707 -43.0193 0
UPDATE `creature` SET `position_x`=1572.58, `position_y`=272.707, `position_z`=-43.0193, `orientation`=5.02655 WHERE `id`=15703;
-- Senior Sergeant Kai'jin (Entry: 15704) (Distance: 6.46993)
-- Old: .go 1658.18 -4400.19 20.2072 1
-- New: .go 1653.07 -4403.81 18.5819 1
UPDATE `creature` SET `position_x`=1653.07, `position_y`=-4403.81, `position_z`=18.5819, `orientation`=4.45059 WHERE `id`=15704;
-- Master Sergeant Fizzlebolt (Entry: 15707) (Distance: 0.421064)
-- Old: .go -4956.43 -930.902 503.257 0
-- New: .go -4956.09 -931.133 503.347 0
UPDATE `creature` SET `position_x`=-4956.09, `position_y`=-931.133, `position_z`=503.347, `orientation`=5.37561 WHERE `id`=15707;
-- Master Sergeant Maclure (Entry: 15708) (Distance: 0.38105)
-- Old: .go -8813.4 654.195 96.0776 0
-- New: .go -8813.75 654.068 96.1603 0
UPDATE `creature` SET `position_x`=-8813.75, `position_y`=654.068, `position_z`=96.1603, `orientation`=4.83456 WHERE `id`=15708;
-- Master Sergeant Moonshadow (Entry: 15709) (Distance: 1.7326)
-- Old: .go 9944.57 2495.87 1317.61 1
-- New: .go 9945.15 2494.24 1317.52 1
UPDATE `creature` SET `position_x`=9945.15, `position_y`=2494.24, `position_z`=1317.52, `orientation`=4.20624 WHERE `id`=15709;
-- C'Thun (Entry: 15727) (Distance: 1.76182)
-- Old: .go -8577.27 1986.94 100.4 531
-- New: .go -8578.65 1985.85 100.304 531
UPDATE `creature` SET `position_x`=-8578.65, `position_y`=1985.85, `position_z`=100.304, `orientation`=3.49066 WHERE `id`=15727;
-- Darnassus Commendation Officer (Entry: 15731) (Distance: 1.88338)
-- Old: .go -4935.28 -1195.82 501.597 0
-- New: .go -4935.17 -1197.7 501.622 0
UPDATE `creature` SET `position_x`=-4935.17, `position_y`=-1197.7, `position_z`=501.622, `orientation`=2.46091 WHERE `id`=15731;
-- Gnomeregan Commendation Officer (Entry: 15733) (Distance: 1.38221)
-- Old: .go -4952.24 -1178.32 501.574 0
-- New: .go -4952.53 -1176.97 501.639 0
UPDATE `creature` SET `position_x`=-4952.53, `position_y`=-1176.97, `position_z`=501.639, `orientation`=5.39307 WHERE `id`=15733;
-- Ironforge Commendation Officer (Entry: 15734) (Distance: 3.67811)
-- Old: .go -4972.21 -1194.83 501.661 0
-- New: .go -4975.34 -1196.76 501.746 0
UPDATE `creature` SET `position_x`=-4975.34, `position_y`=-1196.76, `position_z`=501.746, `orientation`=1.88496 WHERE `id`=15734;
-- Stormwind Commendation Officer (Entry: 15735) (Distance: 1.46672)
-- Old: .go -4935.77 -1213.07 501.645 0
-- New: .go -4934.99 -1214.31 501.718 0
UPDATE `creature` SET `position_x`=-4934.99, `position_y`=-1214.31, `position_z`=501.718, `orientation`=3.33358 WHERE `id`=15735;
-- Orgrimmar Commendation Officer (Entry: 15736) (Distance: 22.4555)
-- Old: .go 1580.21 -4134.87 34.9655 1
-- New: .go 1584.77 -4112.94 33.3777 1
UPDATE `creature` SET `position_x`=1584.77, `position_y`=-4112.94, `position_z`=33.3777, `orientation`=5.41052 WHERE `id`=15736;
-- Darkspear Commendation Officer (Entry: 15737) (Distance: 3.0823)
-- Old: .go 1615.41 -4101.21 33.0863 1
-- New: .go 1618.44 -4101.76 32.9524 1
UPDATE `creature` SET `position_x`=1618.44, `position_y`=-4101.76, `position_z`=32.9524, `orientation`=5.23599 WHERE `id`=15737;
-- Undercity Commendation Officer (Entry: 15738) (Distance: 1.24926)
-- Old: .go 1661.55 -4107.83 34.6299 1
-- New: .go 1660.36 -4107.45 34.6203 1
UPDATE `creature` SET `position_x`=1660.36, `position_y`=-4107.45, `position_z`=34.6203, `orientation`=2.05949 WHERE `id`=15738;
-- Thunder Bluff Commendation Officer (Entry: 15739) (Distance: 2.24738)
-- Old: .go 1601.75 -4143.55 34.0024 1
-- New: .go 1603.89 -4142.9 33.7818 1
UPDATE `creature` SET `position_x`=1603.89, `position_y`=-4142.9, `position_z`=33.7818, `orientation`=2.44346 WHERE `id`=15739;
-- Great-father Winter's Helper (Entry: 15746) (Distance: 0.474166)
-- Old: .go 1628.58 -4414.49 16.036 1
-- New: .go 1629.04 -4414.38 16.0047 1
UPDATE `creature` SET `position_x`=1629.04, `position_y`=-4414.38, `position_z`=16.0047, `orientation`=0.436332 WHERE `id`=15746;
-- Colossus Researcher Sophia (Entry: 15797) (Distance: 2.22164)
-- Old: .go -6827.12 815.505 51.2265 1
-- New: .go -6826.11 813.571 51.6444 1
UPDATE `creature` SET `position_x`=-6826.11, `position_y`=813.571, `position_z`=51.6444, `orientation`=5.49779 WHERE `id`=15797;
-- Colossus Researcher Nestor (Entry: 15798) (Distance: 1.08743)
-- Old: .go -6823.38 813.952 51.0564 1
-- New: .go -6824.03 813.17 51.4418 1
UPDATE `creature` SET `position_x`=-6824.03, `position_y`=813.17, `position_z`=51.4418, `orientation`=3.52557 WHERE `id`=15798;
-- Colossus Researcher Eazel (Entry: 15799) (Distance: 0.639185)
-- Old: .go -6824.57 810.947 51.7063 1
-- New: .go -6825.01 811.389 51.8466 1
UPDATE `creature` SET `position_x`=-6825.01, `position_y`=811.389, `position_z`=51.8466, `orientation`=1.67552 WHERE `id`=15799;
-- C'Thun Portal (Entry: 15896) (Distance: 9.0089)
-- Old: .go -8570.25 1991.36 100.22 531
-- New: .go -8578.1 1986.94 100.304 531
UPDATE `creature` SET `position_x`=-8578.1, `position_y`=1986.94, `position_z`=100.304, `orientation`=2.30383 WHERE `id`=15896;
-- Maexxna (Entry: 15952) (Distance: 8.87596)
-- Old: .go 3503.04 -3919.22 297.6 533
-- New: .go 3511.38 -3921.58 299.513 533
UPDATE `creature` SET `position_x`=3511.38, `position_y`=-3921.58, `position_z`=299.513, `orientation`=1.91986 WHERE `id`=15952;
-- Grand Widow Faerlina (Entry: 15953) (Distance: 0.546616)
-- Old: .go 3353.16 -3620.63 261.18 533
-- New: .go 3353.25 -3620.1 261.08 533
UPDATE `creature` SET `position_x`=3353.25, `position_y`=-3620.1, `position_z`=261.08, `orientation`=4.72984 WHERE `id`=15953;
-- Sapphiron (Entry: 15989) (Distance: 1.34041)
-- Old: .go 3521.3 -5237.56 137.72 533
-- New: .go 3522.39 -5236.78 137.709 533
UPDATE `creature` SET `position_x`=3522.39, `position_y`=-5236.78, `position_z`=137.709, `orientation`=4.50295 WHERE `id`=15989;
-- Aldris Fourclouds (Entry: 16001) (Distance: 0.0100098)
-- Old: .go 9939.5 2494.36 1317.69 1
-- New: .go 9939.5 2494.36 1317.7 1
UPDATE `creature` SET `position_x`=9939.5, `position_y`=2494.36, `position_z`=1317.7, `orientation`=0.785398 WHERE `id`=16001;
-- Loatheb (Entry: 16011) (Distance: 2.09667)
-- Old: .go 2909.43 -3999.46 274.28 533
-- New: .go 2909 -3997.41 274.188 533
UPDATE `creature` SET `position_x`=2909, `position_y`=-3997.41, `position_z`=274.188, `orientation`=1.5708 WHERE `id`=16011;
-- Anthion Harmon (Entry: 16016) (Distance: 10.1606)
-- Old: .go 3367.63 -3379.76 144.98 0
-- New: .go 3357.47 -3379.74 144.865 0
UPDATE `creature` SET `position_x`=3357.47, `position_y`=-3379.74, `position_z`=144.865, `orientation`=6.23083 WHERE `id`=16016;
-- Falrin Treeshaper (Entry: 16032) (Distance: 14.5845)
-- Old: .go 117.23 458.11 -48.28 429
-- New: .go 122.669 444.578 -48.3768 429
UPDATE `creature` SET `position_x`=122.669, `position_y`=444.578, `position_z`=-48.3768, `orientation`=5.42797 WHERE `id`=16032;
-- Isalien Trigger (Entry: 16045) (Distance: 3.31129)
-- Old: .go 262.974 -442.555 -119.962 429
-- New: .go 262.09 -445.745 -119.878 429
UPDATE `creature` SET `position_x`=262.09, `position_y`=-445.745, `position_z`=-119.878, `orientation`=4.32842 WHERE `id`=16045;
-- Lord Valthalak Trigger (Entry: 16048) (Distance: 2.53601)
-- Old: .go 52.5684 -535.175 110.936 229
-- New: .go 50.1154 -534.537 111.02 229
UPDATE `creature` SET `position_x`=50.1154, `position_y`=-534.537, `position_z`=111.02, `orientation`=6.16101 WHERE `id`=16048;
-- Gothik the Harvester (Entry: 16060) (Distance: 1.43526)
-- Old: .go 2642.2 -3388.39 285.6 533
-- New: .go 2642.14 -3386.96 285.492 533
UPDATE `creature` SET `position_x`=2642.14, `position_y`=-3386.96, `position_z`=285.492, `orientation`=6.26573 WHERE `id`=16060;
-- Tidelord Rrurgaz (Entry: 16072) (Distance: 0)
-- Old: .go -2714.61 -4990.07 7.16219 1
-- New: .go -2714.61 -4990.07 7.16219 1
UPDATE `creature` SET `position_x`=-2714.61, `position_y`=-4990.07, `position_z`=7.16219, `orientation`=4.7473 WHERE `id`=16072;
-- Naxxramas Trigger (Entry: 16082) (Distance: 0)
-- Old: .go 3122.96 -3152.1 342.371 533
-- New: .go 3122.96 -3152.1 342.371 533
UPDATE `creature` SET `position_x`=3122.96, `position_y`=-3152.1, `position_z`=342.371, `orientation`=6.10865 WHERE `id`=16082;
-- Father Inigo Montoy (Entry: 16113) (Distance: 0)
-- Old: .go 2298.9 -5339.02 90.8799 0
-- New: .go 2298.9 -5339.02 90.8799 0
UPDATE `creature` SET `position_x`=2298.9, `position_y`=-5339.02, `position_z`=90.8799, `orientation`=3.78737 WHERE `id`=16113;
-- Scarlet Commander Marjhan (Entry: 16114) (Distance: 0)
-- Old: .go 2296.2 -5337.89 90.8799 0
-- New: .go 2296.2 -5337.89 90.8799 0
UPDATE `creature` SET `position_x`=2296.2, `position_y`=-5337.89, `position_z`=90.8799, `orientation`=5.3058 WHERE `id`=16114;
-- Dispatch Commander Metz (Entry: 16212) (Distance: 0.0317993)
-- Old: .go 2314.55 -5322.86 82.0478 0
-- New: .go 2314.55 -5322.86 82.0796 0
UPDATE `creature` SET `position_x`=2314.55, `position_y`=-5322.86, `position_z`=82.0796, `orientation`=2.18166 WHERE `id`=16212;
-- Keeper of the Rolls (Entry: 16281) (Distance: 0.00976563)
-- Old: .go 2242.44 -5317.31 82.2506 0
-- New: .go 2242.44 -5317.32 82.2506 0
UPDATE `creature` SET `position_x`=2242.44, `position_y`=-5317.32, `position_z`=82.2506, `orientation`=1.41372 WHERE `id`=16281;
-- Master Craftsman Omarion (Entry: 16365) (Distance: 0.463137)
-- Old: .go 2853.57 -3251.69 298.21 533
-- New: .go 2853.7 -3251.76 298.649 533
UPDATE `creature` SET `position_x`=2853.7, `position_y`=-3251.76, `position_z`=298.649, `orientation`=5.5676 WHERE `id`=16365;
-- Archmage Tarsis Kir-Moldir (Entry: 16381) (Distance: 0.706675)
-- Old: .go 3005.77 -3486.86 299.73 533
-- New: .go 3006.03 -3487.51 299.633 533
UPDATE `creature` SET `position_x`=3006.03, `position_y`=-3487.51, `position_z`=299.633, `orientation`=1.62316 WHERE `id`=16381;
-- Mupsi Shacklefridd (Entry: 16418) (Distance: 0)
-- Old: .go -944.93 -3580.12 27.5845 1
-- New: .go -944.93 -3580.12 27.5845 1
UPDATE `creature` SET `position_x`=-944.93, `position_y`=-3580.12, `position_z`=27.5845, `orientation`=3.68264 WHERE `id`=16418;
-- Lieutenant Lisande (Entry: 16490) (Distance: 9.91821e-05)
-- Old: .go -1346.69 192.28 61.5736 1
-- New: .go -1346.69 192.28 61.5735 1
UPDATE `creature` SET `position_x`=-1346.69, `position_y`=192.28, `position_z`=61.5735, `orientation`=4.38078 WHERE `id`=16490;
-- Chief Expeditionary Requisitioner Enkles (Entry: 17068) (Distance: 0.1814)
-- Old: .go -7144.84 1376.44 3.34157 1
-- New: .go -7144.84 1376.44 3.52297 1
UPDATE `creature` SET `position_x`=-7144.84, `position_y`=1376.44, `position_z`=3.52297, `orientation`=6.02139 WHERE `id`=17068;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
