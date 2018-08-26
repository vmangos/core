DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180814205614');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180814205614');
-- Add your query below.


-- Update equipment ids for all creatures.
UPDATE `creature_template` SET `equipment_id`=3517 WHERE `entry`=3517;
UPDATE `creature_template` SET `equipment_id`=1366 WHERE `entry`=1366;
UPDATE `creature_template` SET `equipment_id`=193 WHERE `entry`=193;
UPDATE `creature_template` SET `equipment_id`=2599 WHERE `entry`=2599;
UPDATE `creature_template` SET `equipment_id`=944 WHERE `entry`=944;
UPDATE `creature_template` SET `equipment_id`=1119 WHERE `entry`=1119;
UPDATE `creature_template` SET `equipment_id`=300 WHERE `entry`=300;
UPDATE `creature_template` SET `equipment_id`=7118 WHERE `entry`=7118;
UPDATE `creature_template` SET `equipment_id`=3384 WHERE `entry`=3384;
UPDATE `creature_template` SET `equipment_id`=171 WHERE `entry`=171;
UPDATE `creature_template` SET `equipment_id`=2010 WHERE `entry`=2010;
UPDATE `creature_template` SET `equipment_id`=429 WHERE `entry`=429;
UPDATE `creature_template` SET `equipment_id`=732 WHERE `entry`=732;
UPDATE `creature_template` SET `equipment_id`=38 WHERE `entry`=38;
UPDATE `creature_template` SET `equipment_id`=1481 WHERE `entry`=1481;
UPDATE `creature_template` SET `equipment_id`=94 WHERE `entry`=94;
UPDATE `creature_template` SET `equipment_id`=1026 WHERE `entry`=1026;
UPDATE `creature_template` SET `equipment_id`=485 WHERE `entry`=485;
UPDATE `creature_template` SET `equipment_id`=891 WHERE `entry`=891;
UPDATE `creature_template` SET `equipment_id`=198 WHERE `entry`=198;
UPDATE `creature_template` SET `equipment_id`=2596 WHERE `entry`=2596;
UPDATE `creature_template` SET `equipment_id`=3090 WHERE `entry`=3090;
UPDATE `creature_template` SET `equipment_id`=397 WHERE `entry`=397;
UPDATE `creature_template` SET `equipment_id`=6 WHERE `entry`=6;
UPDATE `creature_template` SET `equipment_id`=2491 WHERE `entry`=2491;
UPDATE `creature_template` SET `equipment_id`=483 WHERE `entry`=483;
UPDATE `creature_template` SET `equipment_id`=1431 WHERE `entry`=1431;
UPDATE `creature_template` SET `equipment_id`=100 WHERE `entry`=100;
UPDATE `creature_template` SET `equipment_id`=1367 WHERE `entry`=1367;
UPDATE `creature_template` SET `equipment_id`=1411 WHERE `entry`=1411;
UPDATE `creature_template` SET `equipment_id`=3419 WHERE `entry`=3419;
UPDATE `creature_template` SET `equipment_id`=40 WHERE `entry`=40;
UPDATE `creature_template` SET `equipment_id`=437 WHERE `entry`=437;
UPDATE `creature_template` SET `equipment_id`=46 WHERE `entry`=46;
UPDATE `creature_template` SET `equipment_id`=1736 WHERE `entry`=1736;
UPDATE `creature_template` SET `equipment_id`=48 WHERE `entry`=48;
UPDATE `creature_template` SET `equipment_id`=6866 WHERE `entry`=6866;
UPDATE `creature_template` SET `equipment_id`=445 WHERE `entry`=445;
UPDATE `creature_template` SET `equipment_id`=1441 WHERE `entry`=1441;
UPDATE `creature_template` SET `equipment_id`=54 WHERE `entry`=54;
UPDATE `creature_template` SET `equipment_id`=1744 WHERE `entry`=1744;
UPDATE `creature_template` SET `equipment_id`=1120 WHERE `entry`=1120;
UPDATE `creature_template` SET `equipment_id`=3144 WHERE `entry`=3144;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=507;
UPDATE `creature_template` SET `equipment_id`=124 WHERE `entry`=124;
UPDATE `creature_template` SET `equipment_id`=1519 WHERE `entry`=1519;
UPDATE `creature_template` SET `equipment_id`=60 WHERE `entry`=60;
UPDATE `creature_template` SET `equipment_id`=125 WHERE `entry`=125;
UPDATE `creature_template` SET `equipment_id`=940 WHERE `entry`=940;
UPDATE `creature_template` SET `equipment_id`=61 WHERE `entry`=61;
UPDATE `creature_template` SET `equipment_id`=196 WHERE `entry`=196;
UPDATE `creature_template` SET `equipment_id`=853 WHERE `entry`=853;
UPDATE `creature_template` SET `equipment_id`=68 WHERE `entry`=68;
UPDATE `creature_template` SET `equipment_id`=1257 WHERE `entry`=1257;
UPDATE `creature_template` SET `equipment_id`=382 WHERE `entry`=382;
UPDATE `creature_template` SET `equipment_id`=1378 WHERE `entry`=1378;
UPDATE `creature_template` SET `equipment_id`=2205 WHERE `entry`=2205;
UPDATE `creature_template` SET `equipment_id`=197 WHERE `entry`=197;
UPDATE `creature_template` SET `equipment_id`=1012 WHERE `entry`=1012;
UPDATE `creature_template` SET `equipment_id`=202 WHERE `entry`=202;
UPDATE `creature_template` SET `equipment_id`=1883 WHERE `entry`=1883;
UPDATE `creature_template` SET `equipment_id`=2600 WHERE `entry`=2600;
UPDATE `creature_template` SET `equipment_id`=465 WHERE `entry`=465;
UPDATE `creature_template` SET `equipment_id`=2541 WHERE `entry`=2541;
UPDATE `creature_template` SET `equipment_id`=469 WHERE `entry`=469;
UPDATE `creature_template` SET `equipment_id`=78 WHERE `entry`=78;
UPDATE `creature_template` SET `equipment_id`=79 WHERE `entry`=79;
UPDATE `creature_template` SET `equipment_id`=80 WHERE `entry`=80;
UPDATE `creature_template` SET `equipment_id`=338 WHERE `entry`=338;
UPDATE `creature_template` SET `equipment_id`=1326 WHERE `entry`=1326;
UPDATE `creature_template` SET `equipment_id`=1487 WHERE `entry`=1487;
UPDATE `creature_template` SET `equipment_id`=813 WHERE `entry`=813;
UPDATE `creature_template` SET `equipment_id`=475 WHERE `entry`=475;
UPDATE `creature_template` SET `equipment_id`=95 WHERE `entry`=95;
UPDATE `creature_template` SET `equipment_id`=8142 WHERE `entry`=8142;
UPDATE `creature_template` SET `equipment_id`=912 WHERE `entry`=912;
UPDATE `creature_template` SET `equipment_id`=97 WHERE `entry`=97;
UPDATE `creature_template` SET `equipment_id`=489 WHERE `entry`=489;
UPDATE `creature_template` SET `equipment_id`=1477 WHERE `entry`=1477;
UPDATE `creature_template` SET `equipment_id`=3485 WHERE `entry`=3485;
UPDATE `creature_template` SET `equipment_id`=98 WHERE `entry`=98;
UPDATE `creature_template` SET `equipment_id`=99 WHERE `entry`=99;
UPDATE `creature_template` SET `equipment_id`=1938 WHERE `entry`=1938;
UPDATE `creature_template` SET `equipment_id`=4054 WHERE `entry`=4054;
UPDATE `creature_template` SET `equipment_id`=1332 WHERE `entry`=1332;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=167;
UPDATE `creature_template` SET `equipment_id`=103 WHERE `entry`=103;
UPDATE `creature_template` SET `equipment_id`=2058 WHERE `entry`=2058;
UPDATE `creature_template` SET `equipment_id`=1493 WHERE `entry`=1493;
UPDATE `creature_template` SET `equipment_id`=1048 WHERE `entry`=1048;
UPDATE `creature_template` SET `equipment_id`=499 WHERE `entry`=499;
UPDATE `creature_template` SET `equipment_id`=116 WHERE `entry`=116;
UPDATE `creature_template` SET `equipment_id`=117 WHERE `entry`=117;
UPDATE `creature_template` SET `equipment_id`=4070 WHERE `entry`=4070;
UPDATE `creature_template` SET `equipment_id`=1000 WHERE `entry`=1000;
UPDATE `creature_template` SET `equipment_id`=121 WHERE `entry`=121;
UPDATE `creature_template` SET `equipment_id`=2855 WHERE `entry`=2855;
UPDATE `creature_template` SET `equipment_id`=1110 WHERE `entry`=1110;
UPDATE `creature_template` SET `equipment_id`=3891 WHERE `entry`=3891;
UPDATE `creature_template` SET `equipment_id`=2210 WHERE `entry`=2210;
UPDATE `creature_template` SET `equipment_id`=122 WHERE `entry`=122;
UPDATE `creature_template` SET `equipment_id`=7669 WHERE `entry`=7669;
UPDATE `creature_template` SET `equipment_id`=123 WHERE `entry`=123;
UPDATE `creature_template` SET `equipment_id`=2525 WHERE `entry`=2525;
UPDATE `creature_template` SET `equipment_id`=1122 WHERE `entry`=1122;
UPDATE `creature_template` SET `equipment_id`=15434 WHERE `entry`=15434;
UPDATE `creature_template` SET `equipment_id`=453 WHERE `entry`=453;
UPDATE `creature_template` SET `equipment_id`=126 WHERE `entry`=126;
UPDATE `creature_template` SET `equipment_id`=3323 WHERE `entry`=3323;
UPDATE `creature_template` SET `equipment_id`=328 WHERE `entry`=328;
UPDATE `creature_template` SET `equipment_id`=1444 WHERE `entry`=1444;
UPDATE `creature_template` SET `equipment_id`=215 WHERE `entry`=215;
UPDATE `creature_template` SET `equipment_id`=2336 WHERE `entry`=2336;
UPDATE `creature_template` SET `equipment_id`=1251 WHERE `entry`=1251;
UPDATE `creature_template` SET `equipment_id`=264 WHERE `entry`=264;
UPDATE `creature_template` SET `equipment_id`=1380 WHERE `entry`=1380;
UPDATE `creature_template` SET `equipment_id`=151 WHERE `entry`=151;
UPDATE `creature_template` SET `equipment_id`=152 WHERE `entry`=152;
UPDATE `creature_template` SET `equipment_id`=873 WHERE `entry`=873;
UPDATE `creature_template` SET `equipment_id`=7310 WHERE `entry`=7310;
UPDATE `creature_template` SET `equipment_id`=2245 WHERE `entry`=2245;
UPDATE `creature_template` SET `equipment_id`=1338 WHERE `entry`=1338;
UPDATE `creature_template` SET `equipment_id`=376 WHERE `entry`=376;
UPDATE `creature_template` SET `equipment_id`=1364 WHERE `entry`=1364;
UPDATE `creature_template` SET `equipment_id`=1573 WHERE `entry`=1573;
UPDATE `creature_template` SET `equipment_id`=1279 WHERE `entry`=1279;
UPDATE `creature_template` SET `equipment_id`=332 WHERE `entry`=332;
UPDATE `creature_template` SET `equipment_id`=3625 WHERE `entry`=3625;
UPDATE `creature_template` SET `equipment_id`=203 WHERE `entry`=203;
UPDATE `creature_template` SET `equipment_id`=1386 WHERE `entry`=1386;
UPDATE `creature_template` SET `equipment_id`=3410 WHERE `entry`=3410;
UPDATE `creature_template` SET `equipment_id`=2595 WHERE `entry`=2595;
UPDATE `creature_template` SET `equipment_id`=3270 WHERE `entry`=3270;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=210;
UPDATE `creature_template` SET `equipment_id`=933 WHERE `entry`=933;
UPDATE `creature_template` SET `equipment_id`=212 WHERE `entry`=212;
UPDATE `creature_template` SET `equipment_id`=1273 WHERE `entry`=1273;
UPDATE `creature_template` SET `equipment_id`=334 WHERE `entry`=334;
UPDATE `creature_template` SET `equipment_id`=863 WHERE `entry`=863;
UPDATE `creature_template` SET `equipment_id`=218 WHERE `entry`=218;
UPDATE `creature_template` SET `equipment_id`=1963 WHERE `entry`=1963;
UPDATE `creature_template` SET `equipment_id`=2616 WHERE `entry`=2616;
UPDATE `creature_template` SET `equipment_id`=1218 WHERE `entry`=1218;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=222;
UPDATE `creature_template` SET `equipment_id`=545 WHERE `entry`=545;
UPDATE `creature_template` SET `equipment_id`=7363 WHERE `entry`=7363;
UPDATE `creature_template` SET `equipment_id`=1452 WHERE `entry`=1452;
UPDATE `creature_template` SET `equipment_id`=223 WHERE `entry`=223;
UPDATE `creature_template` SET `equipment_id`=1398 WHERE `entry`=1398;
UPDATE `creature_template` SET `equipment_id`=225 WHERE `entry`=225;
UPDATE `creature_template` SET `equipment_id`=1278 WHERE `entry`=1278;
UPDATE `creature_template` SET `equipment_id`=15183 WHERE `entry`=15183;
UPDATE `creature_template` SET `equipment_id`=3222 WHERE `entry`=3222;
UPDATE `creature_template` SET `equipment_id`=871 WHERE `entry`=871;
UPDATE `creature_template` SET `equipment_id`=226 WHERE `entry`=226;
UPDATE `creature_template` SET `equipment_id`=1907 WHERE `entry`=1907;
UPDATE `creature_template` SET `equipment_id`=1175 WHERE `entry`=1175;
UPDATE `creature_template` SET `equipment_id`=228 WHERE `entry`=228;
UPDATE `creature_template` SET `equipment_id`=885 WHERE `entry`=885;
UPDATE `creature_template` SET `equipment_id`=232 WHERE `entry`=232;
UPDATE `creature_template` SET `equipment_id`=889 WHERE `entry`=889;
UPDATE `creature_template` SET `equipment_id`=233 WHERE `entry`=233;
UPDATE `creature_template` SET `equipment_id`=3620 WHERE `entry`=3620;
UPDATE `creature_template` SET `equipment_id`=1222 WHERE `entry`=1222;
UPDATE `creature_template` SET `equipment_id`=879 WHERE `entry`=879;
UPDATE `creature_template` SET `equipment_id`=234 WHERE `entry`=234;
UPDATE `creature_template` SET `equipment_id`=1915 WHERE `entry`=1915;
UPDATE `creature_template` SET `equipment_id`=1296 WHERE `entry`=1296;
UPDATE `creature_template` SET `equipment_id`=3448 WHERE `entry`=3448;
UPDATE `creature_template` SET `equipment_id`=235 WHERE `entry`=235;
UPDATE `creature_template` SET `equipment_id`=1169 WHERE `entry`=1169;
UPDATE `creature_template` SET `equipment_id`=3442 WHERE `entry`=3442;
UPDATE `creature_template` SET `equipment_id`=237 WHERE `entry`=237;
UPDATE `creature_template` SET `equipment_id`=867 WHERE `entry`=867;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=238;
UPDATE `creature_template` SET `equipment_id`=1275 WHERE `entry`=1275;
UPDATE `creature_template` SET `equipment_id`=2376 WHERE `entry`=2376;
UPDATE `creature_template` SET `equipment_id`=1404 WHERE `entry`=1404;
UPDATE `creature_template` SET `equipment_id`=239 WHERE `entry`=239;
UPDATE `creature_template` SET `equipment_id`=240 WHERE `entry`=240;
UPDATE `creature_template` SET `equipment_id`=241 WHERE `entry`=241;
UPDATE `creature_template` SET `equipment_id`=837 WHERE `entry`=837;
UPDATE `creature_template` SET `equipment_id`=1178 WHERE `entry`=1178;
UPDATE `creature_template` SET `equipment_id`=875 WHERE `entry`=875;
UPDATE `creature_template` SET `equipment_id`=1348 WHERE `entry`=1348;
UPDATE `creature_template` SET `equipment_id`=895 WHERE `entry`=895;
UPDATE `creature_template` SET `equipment_id`=7406 WHERE `entry`=7406;
UPDATE `creature_template` SET `equipment_id`=250 WHERE `entry`=250;
UPDATE `creature_template` SET `equipment_id`=1867 WHERE `entry`=1867;
UPDATE `creature_template` SET `equipment_id`=1376 WHERE `entry`=1376;
UPDATE `creature_template` SET `equipment_id`=3400 WHERE `entry`=3400;
UPDATE `creature_template` SET `equipment_id`=1249 WHERE `entry`=1249;
UPDATE `creature_template` SET `equipment_id`=3394 WHERE `entry`=3394;
UPDATE `creature_template` SET `equipment_id`=1356 WHERE `entry`=1356;
UPDATE `creature_template` SET `equipment_id`=257 WHERE `entry`=257;
UPDATE `creature_template` SET `equipment_id`=1253 WHERE `entry`=1253;
UPDATE `creature_template` SET `equipment_id`=3261 WHERE `entry`=3261;
UPDATE `creature_template` SET `equipment_id`=258 WHERE `entry`=258;
UPDATE `creature_template` SET `equipment_id`=696 WHERE `entry`=696;
UPDATE `creature_template` SET `equipment_id`=1261 WHERE `entry`=1261;
UPDATE `creature_template` SET `equipment_id`=2418 WHERE `entry`=2418;
UPDATE `creature_template` SET `equipment_id`=267 WHERE `entry`=267;
UPDATE `creature_template` SET `equipment_id`=1215 WHERE `entry`=1215;
UPDATE `creature_template` SET `equipment_id`=16062 WHERE `entry`=16062;
UPDATE `creature_template` SET `equipment_id`=1259 WHERE `entry`=1259;
UPDATE `creature_template` SET `equipment_id`=272 WHERE `entry`=272;
UPDATE `creature_template` SET `equipment_id`=2346 WHERE `entry`=2346;
UPDATE `creature_template` SET `equipment_id`=1269 WHERE `entry`=1269;
UPDATE `creature_template` SET `equipment_id`=6522 WHERE `entry`=6522;
UPDATE `creature_template` SET `equipment_id`=3213 WHERE `entry`=3213;
UPDATE `creature_template` SET `equipment_id`=274 WHERE `entry`=274;
UPDATE `creature_template` SET `equipment_id`=1287 WHERE `entry`=1287;
UPDATE `creature_template` SET `equipment_id`=2742 WHERE `entry`=2742;
UPDATE `creature_template` SET `equipment_id`=670 WHERE `entry`=670;
UPDATE `creature_template` SET `equipment_id`=1666 WHERE `entry`=1666;
UPDATE `creature_template` SET `equipment_id`=1159 WHERE `entry`=1159;
UPDATE `creature_template` SET `equipment_id`=644 WHERE `entry`=644;
UPDATE `creature_template` SET `equipment_id`=1167 WHERE `entry`=1167;
UPDATE `creature_template` SET `equipment_id`=285 WHERE `entry`=285;
UPDATE `creature_template` SET `equipment_id`=1211 WHERE `entry`=1211;
UPDATE `creature_template` SET `equipment_id`=288 WHERE `entry`=288;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=289;
UPDATE `creature_template` SET `equipment_id`=8131 WHERE `entry`=8131;
UPDATE `creature_template` SET `equipment_id`=4061 WHERE `entry`=4061;
UPDATE `creature_template` SET `equipment_id`=1331 WHERE `entry`=1331;
UPDATE `creature_template` SET `equipment_id`=674 WHERE `entry`=674;
UPDATE `creature_template` SET `equipment_id`=3670 WHERE `entry`=3670;
UPDATE `creature_template` SET `equipment_id`=3009 WHERE `entry`=3009;
UPDATE `creature_template` SET `equipment_id`=4043 WHERE `entry`=4043;
UPDATE `creature_template` SET `equipment_id`=3335 WHERE `entry`=3335;
UPDATE `creature_template` SET `equipment_id`=694 WHERE `entry`=694;
UPDATE `creature_template` SET `equipment_id`=1163 WHERE `entry`=1163;
UPDATE `creature_template` SET `equipment_id`=672 WHERE `entry`=672;
UPDATE `creature_template` SET `equipment_id`=1319 WHERE `entry`=1319;
UPDATE `creature_template` SET `equipment_id`=2646 WHERE `entry`=2646;
UPDATE `creature_template` SET `equipment_id`=702 WHERE `entry`=702;
UPDATE `creature_template` SET `equipment_id`=3037 WHERE `entry`=3037;
UPDATE `creature_template` SET `equipment_id`=1698 WHERE `entry`=1698;
UPDATE `creature_template` SET `equipment_id`=3030 WHERE `entry`=3030;
UPDATE `creature_template` SET `equipment_id`=1283 WHERE `entry`=1283;
UPDATE `creature_template` SET `equipment_id`=3750 WHERE `entry`=3750;
UPDATE `creature_template` SET `equipment_id`=3025 WHERE `entry`=3025;
UPDATE `creature_template` SET `equipment_id`=311 WHERE `entry`=311;
UPDATE `creature_template` SET `equipment_id`=680 WHERE `entry`=680;
UPDATE `creature_template` SET `equipment_id`=1181 WHERE `entry`=1181;
UPDATE `creature_template` SET `equipment_id`=2402 WHERE `entry`=2402;
UPDATE `creature_template` SET `equipment_id`=5503 WHERE `entry`=5503;
UPDATE `creature_template` SET `equipment_id`=2798 WHERE `entry`=2798;
UPDATE `creature_template` SET `equipment_id`=1327 WHERE `entry`=1327;
UPDATE `creature_template` SET `equipment_id`=3351 WHERE `entry`=3351;
UPDATE `creature_template` SET `equipment_id`=646 WHERE `entry`=646;
UPDATE `creature_template` SET `equipment_id`=315 WHERE `entry`=315;
UPDATE `creature_template` SET `equipment_id`=1706 WHERE `entry`=1706;
UPDATE `creature_template` SET `equipment_id`=325 WHERE `entry`=325;
UPDATE `creature_template` SET `equipment_id`=706 WHERE `entry`=706;
UPDATE `creature_template` SET `equipment_id`=327 WHERE `entry`=327;
UPDATE `creature_template` SET `equipment_id`=760 WHERE `entry`=760;
UPDATE `creature_template` SET `equipment_id`=331 WHERE `entry`=331;
UPDATE `creature_template` SET `equipment_id`=1371 WHERE `entry`=1371;
UPDATE `creature_template` SET `equipment_id`=714 WHERE `entry`=714;
UPDATE `creature_template` SET `equipment_id`=16126 WHERE `entry`=16126;
UPDATE `creature_template` SET `equipment_id`=340 WHERE `entry`=340;
UPDATE `creature_template` SET `equipment_id`=1060 WHERE `entry`=1060;
UPDATE `creature_template` SET `equipment_id`=3275 WHERE `entry`=3275;
UPDATE `creature_template` SET `equipment_id`=1070 WHERE `entry`=1070;
UPDATE `creature_template` SET `equipment_id`=712 WHERE `entry`=712;
UPDATE `creature_template` SET `equipment_id`=3112 WHERE `entry`=3112;
UPDATE `creature_template` SET `equipment_id`=347 WHERE `entry`=347;
UPDATE `creature_template` SET `equipment_id`=1738 WHERE `entry`=1738;
UPDATE `creature_template` SET `equipment_id`=1231 WHERE `entry`=1231;
UPDATE `creature_template` SET `equipment_id`=348 WHERE `entry`=348;
UPDATE `creature_template` SET `equipment_id`=349 WHERE `entry`=349;
UPDATE `creature_template` SET `equipment_id`=738 WHERE `entry`=738;
UPDATE `creature_template` SET `equipment_id`=3734 WHERE `entry`=3734;
UPDATE `creature_template` SET `equipment_id`=1255 WHERE `entry`=1255;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=372;
UPDATE `creature_template` SET `equipment_id`=754 WHERE `entry`=754;
UPDATE `creature_template` SET `equipment_id`=375 WHERE `entry`=375;
UPDATE `creature_template` SET `equipment_id`=377 WHERE `entry`=377;
UPDATE `creature_template` SET `equipment_id`=744 WHERE `entry`=744;
UPDATE `creature_template` SET `equipment_id`=710 WHERE `entry`=710;
UPDATE `creature_template` SET `equipment_id`=2084 WHERE `entry`=2084;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=381;
UPDATE `creature_template` SET `equipment_id`=1355 WHERE `entry`=1355;
UPDATE `creature_template` SET `equipment_id`=762 WHERE `entry`=762;
UPDATE `creature_template` SET `equipment_id`=7918 WHERE `entry`=7918;
UPDATE `creature_template` SET `equipment_id`=3607 WHERE `entry`=3607;
UPDATE `creature_template` SET `equipment_id`=391 WHERE `entry`=391;
UPDATE `creature_template` SET `equipment_id`=2547 WHERE `entry`=2547;
UPDATE `creature_template` SET `equipment_id`=1072 WHERE `entry`=1072;
UPDATE `creature_template` SET `equipment_id`=415 WHERE `entry`=415;
UPDATE `creature_template` SET `equipment_id`=1078 WHERE `entry`=1078;
UPDATE `creature_template` SET `equipment_id`=3639 WHERE `entry`=3639;
UPDATE `creature_template` SET `equipment_id`=1076 WHERE `entry`=1076;
UPDATE `creature_template` SET `equipment_id`=423 WHERE `entry`=423;
UPDATE `creature_template` SET `equipment_id`=424 WHERE `entry`=424;
UPDATE `creature_template` SET `equipment_id`=426 WHERE `entry`=426;
UPDATE `creature_template` SET `equipment_id`=1247 WHERE `entry`=1247;
UPDATE `creature_template` SET `equipment_id`=2253 WHERE `entry`=2253;
UPDATE `creature_template` SET `equipment_id`=1241 WHERE `entry`=1241;
UPDATE `creature_template` SET `equipment_id`=430 WHERE `entry`=430;
UPDATE `creature_template` SET `equipment_id`=431 WHERE `entry`=431;
UPDATE `creature_template` SET `equipment_id`=432 WHERE `entry`=432;
UPDATE `creature_template` SET `equipment_id`=513 WHERE `entry`=513;
UPDATE `creature_template` SET `equipment_id`=433 WHERE `entry`=433;
UPDATE `creature_template` SET `equipment_id`=1539 WHERE `entry`=1539;
UPDATE `creature_template` SET `equipment_id`=435 WHERE `entry`=435;
UPDATE `creature_template` SET `equipment_id`=436 WHERE `entry`=436;
UPDATE `creature_template` SET `equipment_id`=517 WHERE `entry`=517;
UPDATE `creature_template` SET `equipment_id`=440 WHERE `entry`=440;
UPDATE `creature_template` SET `equipment_id`=1038 WHERE `entry`=1038;
UPDATE `creature_template` SET `equipment_id`=1430 WHERE `entry`=1430;
UPDATE `creature_template` SET `equipment_id`=2663 WHERE `entry`=2663;
UPDATE `creature_template` SET `equipment_id`=446 WHERE `entry`=446;
UPDATE `creature_template` SET `equipment_id`=448 WHERE `entry`=448;
UPDATE `creature_template` SET `equipment_id`=5518 WHERE `entry`=5518;
UPDATE `creature_template` SET `equipment_id`=2591 WHERE `entry`=2591;
UPDATE `creature_template` SET `equipment_id`=583 WHERE `entry`=583;
UPDATE `creature_template` SET `equipment_id`=450 WHERE `entry`=450;
UPDATE `creature_template` SET `equipment_id`=452 WHERE `entry`=452;
UPDATE `creature_template` SET `equipment_id`=597 WHERE `entry`=597;
UPDATE `creature_template` SET `equipment_id`=3671 WHERE `entry`=3671;
UPDATE `creature_template` SET `equipment_id`=456 WHERE `entry`=456;
UPDATE `creature_template` SET `equipment_id`=1838 WHERE `entry`=1838;
UPDATE `creature_template` SET `equipment_id`=458 WHERE `entry`=458;
UPDATE `creature_template` SET `equipment_id`=3881 WHERE `entry`=3881;
UPDATE `creature_template` SET `equipment_id`=459 WHERE `entry`=459;
UPDATE `creature_template` SET `equipment_id`=460 WHERE `entry`=460;
UPDATE `creature_template` SET `equipment_id`=3154 WHERE `entry`=3154;
UPDATE `creature_template` SET `equipment_id`=461 WHERE `entry`=461;
UPDATE `creature_template` SET `equipment_id`=2851 WHERE `entry`=2851;
UPDATE `creature_template` SET `equipment_id`=579 WHERE `entry`=579;
UPDATE `creature_template` SET `equipment_id`=1522 WHERE `entry`=1522;
UPDATE `creature_template` SET `equipment_id`=7775 WHERE `entry`=7775;
UPDATE `creature_template` SET `equipment_id`=464 WHERE `entry`=464;
UPDATE `creature_template` SET `equipment_id`=1846 WHERE `entry`=1846;
UPDATE `creature_template` SET `equipment_id`=599 WHERE `entry`=599;
UPDATE `creature_template` SET `equipment_id`=1699 WHERE `entry`=1699;
UPDATE `creature_template` SET `equipment_id`=1479 WHERE `entry`=1479;
UPDATE `creature_template` SET `equipment_id`=1144 WHERE `entry`=1144;
UPDATE `creature_template` SET `equipment_id`=468 WHERE `entry`=468;
UPDATE `creature_template` SET `equipment_id`=677 WHERE `entry`=677;
UPDATE `creature_template` SET `equipment_id`=1845 WHERE `entry`=1845;
UPDATE `creature_template` SET `equipment_id`=3532 WHERE `entry`=3532;
UPDATE `creature_template` SET `equipment_id`=472 WHERE `entry`=472;
UPDATE `creature_template` SET `equipment_id`=1854 WHERE `entry`=1854;
UPDATE `creature_template` SET `equipment_id`=1198 WHERE `entry`=1198;
UPDATE `creature_template` SET `equipment_id`=473 WHERE `entry`=473;
UPDATE `creature_template` SET `equipment_id`=474 WHERE `entry`=474;
UPDATE `creature_template` SET `equipment_id`=1707 WHERE `entry`=1707;
UPDATE `creature_template` SET `equipment_id`=1472 WHERE `entry`=1472;
UPDATE `creature_template` SET `equipment_id`=3890 WHERE `entry`=3890;
UPDATE `creature_template` SET `equipment_id`=476 WHERE `entry`=476;
UPDATE `creature_template` SET `equipment_id`=1474 WHERE `entry`=1474;
UPDATE `creature_template` SET `equipment_id`=595 WHERE `entry`=595;
UPDATE `creature_template` SET `equipment_id`=478 WHERE `entry`=478;
UPDATE `creature_template` SET `equipment_id`=625 WHERE `entry`=625;
UPDATE `creature_template` SET `equipment_id`=1142 WHERE `entry`=1142;
UPDATE `creature_template` SET `equipment_id`=481 WHERE `entry`=481;
UPDATE `creature_template` SET `equipment_id`=3478 WHERE `entry`=3478;
UPDATE `creature_template` SET `equipment_id`=615 WHERE `entry`=615;
UPDATE `creature_template` SET `equipment_id`=482 WHERE `entry`=482;
UPDATE `creature_template` SET `equipment_id`=1651 WHERE `entry`=1651;
UPDATE `creature_template` SET `equipment_id`=1418 WHERE `entry`=1418;
UPDATE `creature_template` SET `equipment_id`=3703 WHERE `entry`=3703;
UPDATE `creature_template` SET `equipment_id`=486 WHERE `entry`=486;
UPDATE `creature_template` SET `equipment_id`=487 WHERE `entry`=487;
UPDATE `creature_template` SET `equipment_id`=488 WHERE `entry`=488;
UPDATE `creature_template` SET `equipment_id`=1478 WHERE `entry`=1478;
UPDATE `creature_template` SET `equipment_id`=2647 WHERE `entry`=2647;
UPDATE `creature_template` SET `equipment_id`=623 WHERE `entry`=623;
UPDATE `creature_template` SET `equipment_id`=490 WHERE `entry`=490;
UPDATE `creature_template` SET `equipment_id`=2515 WHERE `entry`=2515;
UPDATE `creature_template` SET `equipment_id`=3192 WHERE `entry`=3192;
UPDATE `creature_template` SET `equipment_id`=491 WHERE `entry`=491;
UPDATE `creature_template` SET `equipment_id`=494 WHERE `entry`=494;
UPDATE `creature_template` SET `equipment_id`=495 WHERE `entry`=495;
UPDATE `creature_template` SET `equipment_id`=500 WHERE `entry`=500;
UPDATE `creature_template` SET `equipment_id`=7290 WHERE `entry`=7290;
UPDATE `creature_template` SET `equipment_id`=1434 WHERE `entry`=1434;
UPDATE `creature_template` SET `equipment_id`=619 WHERE `entry`=619;
UPDATE `creature_template` SET `equipment_id`=3655 WHERE `entry`=3655;
UPDATE `creature_template` SET `equipment_id`=502 WHERE `entry`=502;
UPDATE `creature_template` SET `equipment_id`=504 WHERE `entry`=504;
UPDATE `creature_template` SET `equipment_id`=639 WHERE `entry`=639;
UPDATE `creature_template` SET `equipment_id`=506 WHERE `entry`=506;
UPDATE `creature_template` SET `equipment_id`=1100 WHERE `entry`=1100;
UPDATE `creature_template` SET `equipment_id`=511 WHERE `entry`=511;
UPDATE `creature_template` SET `equipment_id`=514 WHERE `entry`=514;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=1458;
UPDATE `creature_template` SET `equipment_id`=515 WHERE `entry`=515;
UPDATE `creature_template` SET `equipment_id`=518 WHERE `entry`=518;
UPDATE `creature_template` SET `equipment_id`=520 WHERE `entry`=520;
UPDATE `creature_template` SET `equipment_id`=522 WHERE `entry`=522;
UPDATE `creature_template` SET `equipment_id`=531 WHERE `entry`=531;
UPDATE `creature_template` SET `equipment_id`=543 WHERE `entry`=543;
UPDATE `creature_template` SET `equipment_id`=544 WHERE `entry`=544;
UPDATE `creature_template` SET `equipment_id`=2246 WHERE `entry`=2246;
UPDATE `creature_template` SET `equipment_id`=550 WHERE `entry`=550;
UPDATE `creature_template` SET `equipment_id`=568 WHERE `entry`=568;
UPDATE `creature_template` SET `equipment_id`=2266 WHERE `entry`=2266;
UPDATE `creature_template` SET `equipment_id`=8117 WHERE `entry`=8117;
UPDATE `creature_template` SET `equipment_id`=1240 WHERE `entry`=1240;
UPDATE `creature_template` SET `equipment_id`=576 WHERE `entry`=576;
UPDATE `creature_template` SET `equipment_id`=4093 WHERE `entry`=4093;
UPDATE `creature_template` SET `equipment_id`=580 WHERE `entry`=580;
UPDATE `creature_template` SET `equipment_id`=4091 WHERE `entry`=4091;
UPDATE `creature_template` SET `equipment_id`=584 WHERE `entry`=584;
UPDATE `creature_template` SET `equipment_id`=587 WHERE `entry`=587;
UPDATE `creature_template` SET `equipment_id`=588 WHERE `entry`=588;
UPDATE `creature_template` SET `equipment_id`=589 WHERE `entry`=589;
UPDATE `creature_template` SET `equipment_id`=590 WHERE `entry`=590;
UPDATE `creature_template` SET `equipment_id`=594 WHERE `entry`=594;
UPDATE `creature_template` SET `equipment_id`=596 WHERE `entry`=596;
UPDATE `creature_template` SET `equipment_id`=3367 WHERE `entry`=3367;
UPDATE `creature_template` SET `equipment_id`=598 WHERE `entry`=598;
UPDATE `creature_template` SET `equipment_id`=3880 WHERE `entry`=3880;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=1482;
UPDATE `creature_template` SET `equipment_id`=603 WHERE `entry`=603;
UPDATE `creature_template` SET `equipment_id`=3995 WHERE `entry`=3995;
UPDATE `creature_template` SET `equipment_id`=622 WHERE `entry`=622;
UPDATE `creature_template` SET `equipment_id`=4077 WHERE `entry`=4077;
UPDATE `creature_template` SET `equipment_id`=626 WHERE `entry`=626;
UPDATE `creature_template` SET `equipment_id`=634 WHERE `entry`=634;
UPDATE `creature_template` SET `equipment_id`=636 WHERE `entry`=636;
UPDATE `creature_template` SET `equipment_id`=826 WHERE `entry`=826;
UPDATE `creature_template` SET `equipment_id`=641 WHERE `entry`=641;
UPDATE `creature_template` SET `equipment_id`=1719 WHERE `entry`=1719;
UPDATE `creature_template` SET `equipment_id`=643 WHERE `entry`=643;
UPDATE `creature_template` SET `equipment_id`=7952 WHERE `entry`=7952;
UPDATE `creature_template` SET `equipment_id`=1496 WHERE `entry`=1496;
UPDATE `creature_template` SET `equipment_id`=645 WHERE `entry`=645;
UPDATE `creature_template` SET `equipment_id`=824 WHERE `entry`=824;
UPDATE `creature_template` SET `equipment_id`=647 WHERE `entry`=647;
UPDATE `creature_template` SET `equipment_id`=656 WHERE `entry`=656;
UPDATE `creature_template` SET `equipment_id`=657 WHERE `entry`=657;
UPDATE `creature_template` SET `equipment_id`=1894 WHERE `entry`=1894;
UPDATE `creature_template` SET `equipment_id`=660 WHERE `entry`=660;
UPDATE `creature_template` SET `equipment_id`=782 WHERE `entry`=782;
UPDATE `creature_template` SET `equipment_id`=663 WHERE `entry`=663;
UPDATE `creature_template` SET `equipment_id`=1892 WHERE `entry`=1892;
UPDATE `creature_template` SET `equipment_id`=1679 WHERE `entry`=1679;
UPDATE `creature_template` SET `equipment_id`=3944 WHERE `entry`=3944;
UPDATE `creature_template` SET `equipment_id`=667 WHERE `entry`=667;
UPDATE `creature_template` SET `equipment_id`=790 WHERE `entry`=790;
UPDATE `creature_template` SET `equipment_id`=1665 WHERE `entry`=1665;
UPDATE `creature_template` SET `equipment_id`=669 WHERE `entry`=669;
UPDATE `creature_template` SET `equipment_id`=784 WHERE `entry`=784;
UPDATE `creature_template` SET `equipment_id`=671 WHERE `entry`=671;
UPDATE `creature_template` SET `equipment_id`=2502 WHERE `entry`=2502;
UPDATE `creature_template` SET `equipment_id`=1490 WHERE `entry`=1490;
UPDATE `creature_template` SET `equipment_id`=675 WHERE `entry`=675;
UPDATE `creature_template` SET `equipment_id`=676 WHERE `entry`=676;
UPDATE `creature_template` SET `equipment_id`=2007 WHERE `entry`=2007;
UPDATE `creature_template` SET `equipment_id`=3383 WHERE `entry`=3383;
UPDATE `creature_template` SET `equipment_id`=678 WHERE `entry`=678;
UPDATE `creature_template` SET `equipment_id`=3542 WHERE `entry`=3542;
UPDATE `creature_template` SET `equipment_id`=679 WHERE `entry`=679;
UPDATE `creature_template` SET `equipment_id`=1339 WHERE `entry`=1339;
UPDATE `creature_template` SET `equipment_id`=812 WHERE `entry`=812;
UPDATE `creature_template` SET `equipment_id`=1498 WHERE `entry`=1498;
UPDATE `creature_template` SET `equipment_id`=2009 WHERE `entry`=2009;
UPDATE `creature_template` SET `equipment_id`=820 WHERE `entry`=820;
UPDATE `creature_template` SET `equipment_id`=1703 WHERE `entry`=1703;
UPDATE `creature_template` SET `equipment_id`=2518 WHERE `entry`=2518;
UPDATE `creature_template` SET `equipment_id`=3548 WHERE `entry`=3548;
UPDATE `creature_template` SET `equipment_id`=818 WHERE `entry`=818;
UPDATE `creature_template` SET `equipment_id`=697 WHERE `entry`=697;
UPDATE `creature_template` SET `equipment_id`=828 WHERE `entry`=828;
UPDATE `creature_template` SET `equipment_id`=1711 WHERE `entry`=1711;
UPDATE `creature_template` SET `equipment_id`=699 WHERE `entry`=699;
UPDATE `creature_template` SET `equipment_id`=1697 WHERE `entry`=1697;
UPDATE `creature_template` SET `equipment_id`=701 WHERE `entry`=701;
UPDATE `creature_template` SET `equipment_id`=703 WHERE `entry`=703;
UPDATE `creature_template` SET `equipment_id`=1062 WHERE `entry`=1062;
UPDATE `creature_template` SET `equipment_id`=836 WHERE `entry`=836;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=1783;
UPDATE `creature_template` SET `equipment_id`=8016 WHERE `entry`=8016;
UPDATE `creature_template` SET `equipment_id`=709 WHERE `entry`=709;
UPDATE `creature_template` SET `equipment_id`=888 WHERE `entry`=888;
UPDATE `creature_template` SET `equipment_id`=1061 WHERE `entry`=1061;
UPDATE `creature_template` SET `equipment_id`=711 WHERE `entry`=711;
UPDATE `creature_template` SET `equipment_id`=713 WHERE `entry`=713;
UPDATE `creature_template` SET `equipment_id`=844 WHERE `entry`=844;
UPDATE `creature_template` SET `equipment_id`=3113 WHERE `entry`=3113;
UPDATE `creature_template` SET `equipment_id`=715 WHERE `entry`=715;
UPDATE `creature_template` SET `equipment_id`=3922 WHERE `entry`=3922;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=717;
UPDATE `creature_template` SET `equipment_id`=2083 WHERE `entry`=2083;
UPDATE `creature_template` SET `equipment_id`=1399 WHERE `entry`=1399;
UPDATE `creature_template` SET `equipment_id`=2790 WHERE `entry`=2790;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=718;
UPDATE `creature_template` SET `equipment_id`=6188 WHERE `entry`=6188;
UPDATE `creature_template` SET `equipment_id`=842 WHERE `entry`=842;
UPDATE `creature_template` SET `equipment_id`=2103 WHERE `entry`=2103;
UPDATE `creature_template` SET `equipment_id`=723 WHERE `entry`=723;
UPDATE `creature_template` SET `equipment_id`=724 WHERE `entry`=724;
UPDATE `creature_template` SET `equipment_id`=840 WHERE `entry`=840;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=1077;
UPDATE `creature_template` SET `equipment_id`=727 WHERE `entry`=727;
UPDATE `creature_template` SET `equipment_id`=1059 WHERE `entry`=1059;
UPDATE `creature_template` SET `equipment_id`=6207 WHERE `entry`=6207;
UPDATE `creature_template` SET `equipment_id`=1451 WHERE `entry`=1451;
UPDATE `creature_template` SET `equipment_id`=2104 WHERE `entry`=2104;
UPDATE `creature_template` SET `equipment_id`=3129 WHERE `entry`=3129;
UPDATE `creature_template` SET `equipment_id`=3111 WHERE `entry`=3111;
UPDATE `creature_template` SET `equipment_id`=1729 WHERE `entry`=1729;
UPDATE `creature_template` SET `equipment_id`=733 WHERE `entry`=733;
UPDATE `creature_template` SET `equipment_id`=2099 WHERE `entry`=2099;
UPDATE `creature_template` SET `equipment_id`=1351 WHERE `entry`=1351;
UPDATE `creature_template` SET `equipment_id`=2806 WHERE `entry`=2806;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=734;
UPDATE `creature_template` SET `equipment_id`=7875 WHERE `entry`=7875;
UPDATE `creature_template` SET `equipment_id`=735 WHERE `entry`=735;
UPDATE `creature_template` SET `equipment_id`=794 WHERE `entry`=794;
UPDATE `creature_template` SET `equipment_id`=1910 WHERE `entry`=1910;
UPDATE `creature_template` SET `equipment_id`=868 WHERE `entry`=868;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=1687;
UPDATE `creature_template` SET `equipment_id`=739 WHERE `entry`=739;
UPDATE `creature_template` SET `equipment_id`=5471 WHERE `entry`=5471;
UPDATE `creature_template` SET `equipment_id`=2766 WHERE `entry`=2766;
UPDATE `creature_template` SET `equipment_id`=3447 WHERE `entry`=3447;
UPDATE `creature_template` SET `equipment_id`=742 WHERE `entry`=742;
UPDATE `creature_template` SET `equipment_id`=743 WHERE `entry`=743;
UPDATE `creature_template` SET `equipment_id`=866 WHERE `entry`=866;
UPDATE `creature_template` SET `equipment_id`=745 WHERE `entry`=745;
UPDATE `creature_template` SET `equipment_id`=1918 WHERE `entry`=1918;
UPDATE `creature_template` SET `equipment_id`=746 WHERE `entry`=746;
UPDATE `creature_template` SET `equipment_id`=876 WHERE `entry`=876;
UPDATE `creature_template` SET `equipment_id`=1695 WHERE `entry`=1695;
UPDATE `creature_template` SET `equipment_id`=3960 WHERE `entry`=3960;
UPDATE `creature_template` SET `equipment_id`=747 WHERE `entry`=747;
UPDATE `creature_template` SET `equipment_id`=1303 WHERE `entry`=1303;
UPDATE `creature_template` SET `equipment_id`=2694 WHERE `entry`=2694;
UPDATE `creature_template` SET `equipment_id`=864 WHERE `entry`=864;
UPDATE `creature_template` SET `equipment_id`=751 WHERE `entry`=751;
UPDATE `creature_template` SET `equipment_id`=1916 WHERE `entry`=1916;
UPDATE `creature_template` SET `equipment_id`=752 WHERE `entry`=752;
UPDATE `creature_template` SET `equipment_id`=755 WHERE `entry`=755;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=878;
UPDATE `creature_template` SET `equipment_id`=757 WHERE `entry`=757;
UPDATE `creature_template` SET `equipment_id`=759 WHERE `entry`=759;
UPDATE `creature_template` SET `equipment_id`=761 WHERE `entry`=761;
UPDATE `creature_template` SET `equipment_id`=1870 WHERE `entry`=1870;
UPDATE `creature_template` SET `equipment_id`=892 WHERE `entry`=892;
UPDATE `creature_template` SET `equipment_id`=1775 WHERE `entry`=1775;
UPDATE `creature_template` SET `equipment_id`=763 WHERE `entry`=763;
UPDATE `creature_template` SET `equipment_id`=886 WHERE `entry`=886;
UPDATE `creature_template` SET `equipment_id`=880 WHERE `entry`=880;
UPDATE `creature_template` SET `equipment_id`=7907 WHERE `entry`=7907;
UPDATE `creature_template` SET `equipment_id`=16051 WHERE `entry`=16051;
UPDATE `creature_template` SET `equipment_id`=3773 WHERE `entry`=3773;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=770;
UPDATE `creature_template` SET `equipment_id`=1202 WHERE `entry`=1202;
UPDATE `creature_template` SET `equipment_id`=771 WHERE `entry`=771;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=773;
UPDATE `creature_template` SET `equipment_id`=1182 WHERE `entry`=1182;
UPDATE `creature_template` SET `equipment_id`=775 WHERE `entry`=775;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=777;
UPDATE `creature_template` SET `equipment_id`=780 WHERE `entry`=780;
UPDATE `creature_template` SET `equipment_id`=1727 WHERE `entry`=1727;
UPDATE `creature_template` SET `equipment_id`=781 WHERE `entry`=781;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=1254;
UPDATE `creature_template` SET `equipment_id`=783 WHERE `entry`=783;
UPDATE `creature_template` SET `equipment_id`=785 WHERE `entry`=785;
UPDATE `creature_template` SET `equipment_id`=3725 WHERE `entry`=3725;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=786;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=1154;
UPDATE `creature_template` SET `equipment_id`=787 WHERE `entry`=787;
UPDATE `creature_template` SET `equipment_id`=3206 WHERE `entry`=3206;
UPDATE `creature_template` SET `equipment_id`=791 WHERE `entry`=791;
UPDATE `creature_template` SET `equipment_id`=793 WHERE `entry`=793;
UPDATE `creature_template` SET `equipment_id`=1162 WHERE `entry`=1162;
UPDATE `creature_template` SET `equipment_id`=15119 WHERE `entry`=15119;
UPDATE `creature_template` SET `equipment_id`=3158 WHERE `entry`=3158;
UPDATE `creature_template` SET `equipment_id`=2497 WHERE `entry`=2497;
UPDATE `creature_template` SET `equipment_id`=808 WHERE `entry`=808;
UPDATE `creature_template` SET `equipment_id`=2506 WHERE `entry`=2506;
UPDATE `creature_template` SET `equipment_id`=1480 WHERE `entry`=1480;
UPDATE `creature_template` SET `equipment_id`=814 WHERE `entry`=814;
UPDATE `creature_template` SET `equipment_id`=1158 WHERE `entry`=1158;
UPDATE `creature_template` SET `equipment_id`=2839 WHERE `entry`=2839;
UPDATE `creature_template` SET `equipment_id`=815 WHERE `entry`=815;
UPDATE `creature_template` SET `equipment_id`=1495 WHERE `entry`=1495;
UPDATE `creature_template` SET `equipment_id`=821 WHERE `entry`=821;
UPDATE `creature_template` SET `equipment_id`=1166 WHERE `entry`=1166;
UPDATE `creature_template` SET `equipment_id`=823 WHERE `entry`=823;
UPDATE `creature_template` SET `equipment_id`=2513 WHERE `entry`=2513;
UPDATE `creature_template` SET `equipment_id`=827 WHERE `entry`=827;
UPDATE `creature_template` SET `equipment_id`=829 WHERE `entry`=829;
UPDATE `creature_template` SET `equipment_id`=1174 WHERE `entry`=1174;
UPDATE `creature_template` SET `equipment_id`=843 WHERE `entry`=843;
UPDATE `creature_template` SET `equipment_id`=1785 WHERE `entry`=1785;
UPDATE `creature_template` SET `equipment_id`=857 WHERE `entry`=857;
UPDATE `creature_template` SET `equipment_id`=3624 WHERE `entry`=3624;
UPDATE `creature_template` SET `equipment_id`=1226 WHERE `entry`=1226;
UPDATE `creature_template` SET `equipment_id`=859 WHERE `entry`=859;
UPDATE `creature_template` SET `equipment_id`=861 WHERE `entry`=861;
UPDATE `creature_template` SET `equipment_id`=862 WHERE `entry`=862;
UPDATE `creature_template` SET `equipment_id`=1737 WHERE `entry`=1737;
UPDATE `creature_template` SET `equipment_id`=865 WHERE `entry`=865;
UPDATE `creature_template` SET `equipment_id`=869 WHERE `entry`=869;
UPDATE `creature_template` SET `equipment_id`=870 WHERE `entry`=870;
UPDATE `creature_template` SET `equipment_id`=874 WHERE `entry`=874;
UPDATE `creature_template` SET `equipment_id`=877 WHERE `entry`=877;
UPDATE `creature_template` SET `equipment_id`=881 WHERE `entry`=881;
UPDATE `creature_template` SET `equipment_id`=887 WHERE `entry`=887;
UPDATE `creature_template` SET `equipment_id`=893 WHERE `entry`=893;
UPDATE `creature_template` SET `equipment_id`=900 WHERE `entry`=900;
UPDATE `creature_template` SET `equipment_id`=903 WHERE `entry`=903;
UPDATE `creature_template` SET `equipment_id`=1051 WHERE `entry`=1051;
UPDATE `creature_template` SET `equipment_id`=906 WHERE `entry`=906;
UPDATE `creature_template` SET `equipment_id`=3608 WHERE `entry`=3608;
UPDATE `creature_template` SET `equipment_id`=907 WHERE `entry`=907;
UPDATE `creature_template` SET `equipment_id`=908 WHERE `entry`=908;
UPDATE `creature_template` SET `equipment_id`=3602 WHERE `entry`=3602;
UPDATE `creature_template` SET `equipment_id`=909 WHERE `entry`=909;
UPDATE `creature_template` SET `equipment_id`=910 WHERE `entry`=910;
UPDATE `creature_template` SET `equipment_id`=911 WHERE `entry`=911;
UPDATE `creature_template` SET `equipment_id`=1564 WHERE `entry`=1564;
UPDATE `creature_template` SET `equipment_id`=913 WHERE `entry`=913;
UPDATE `creature_template` SET `equipment_id`=1123 WHERE `entry`=1123;
UPDATE `creature_template` SET `equipment_id`=914 WHERE `entry`=914;
UPDATE `creature_template` SET `equipment_id`=915 WHERE `entry`=915;
UPDATE `creature_template` SET `equipment_id`=916 WHERE `entry`=916;
UPDATE `creature_template` SET `equipment_id`=917 WHERE `entry`=917;
UPDATE `creature_template` SET `equipment_id`=3175 WHERE `entry`=3175;
UPDATE `creature_template` SET `equipment_id`=918 WHERE `entry`=918;
UPDATE `creature_template` SET `equipment_id`=921 WHERE `entry`=921;
UPDATE `creature_template` SET `equipment_id`=3688 WHERE `entry`=3688;
UPDATE `creature_template` SET `equipment_id`=3682 WHERE `entry`=3682;
UPDATE `creature_template` SET `equipment_id`=925 WHERE `entry`=925;
UPDATE `creature_template` SET `equipment_id`=2998 WHERE `entry`=2998;
UPDATE `creature_template` SET `equipment_id`=926 WHERE `entry`=926;
UPDATE `creature_template` SET `equipment_id`=927 WHERE `entry`=927;
UPDATE `creature_template` SET `equipment_id`=928 WHERE `entry`=928;
UPDATE `creature_template` SET `equipment_id`=1075 WHERE `entry`=1075;
UPDATE `creature_template` SET `equipment_id`=1234 WHERE `entry`=1234;
UPDATE `creature_template` SET `equipment_id`=932 WHERE `entry`=932;
UPDATE `creature_template` SET `equipment_id`=1751 WHERE `entry`=1751;
UPDATE `creature_template` SET `equipment_id`=934 WHERE `entry`=934;
UPDATE `creature_template` SET `equipment_id`=1745 WHERE `entry`=1745;
UPDATE `creature_template` SET `equipment_id`=3286 WHERE `entry`=3286;
UPDATE `creature_template` SET `equipment_id`=935 WHERE `entry`=935;
UPDATE `creature_template` SET `equipment_id`=3803 WHERE `entry`=3803;
UPDATE `creature_template` SET `equipment_id`=936 WHERE `entry`=936;
UPDATE `creature_template` SET `equipment_id`=937 WHERE `entry`=937;
UPDATE `creature_template` SET `equipment_id`=1083 WHERE `entry`=1083;
UPDATE `creature_template` SET `equipment_id`=938 WHERE `entry`=938;
UPDATE `creature_template` SET `equipment_id`=1242 WHERE `entry`=1242;
UPDATE `creature_template` SET `equipment_id`=939 WHERE `entry`=939;
UPDATE `creature_template` SET `equipment_id`=941 WHERE `entry`=941;
UPDATE `creature_template` SET `equipment_id`=942 WHERE `entry`=942;
UPDATE `creature_template` SET `equipment_id`=1753 WHERE `entry`=1753;
UPDATE `creature_template` SET `equipment_id`=7231 WHERE `entry`=7231;
UPDATE `creature_template` SET `equipment_id`=943 WHERE `entry`=943;
UPDATE `creature_template` SET `equipment_id`=945 WHERE `entry`=945;
UPDATE `creature_template` SET `equipment_id`=1027 WHERE `entry`=1027;
UPDATE `creature_template` SET `equipment_id`=946 WHERE `entry`=946;
UPDATE `creature_template` SET `equipment_id`=947 WHERE `entry`=947;
UPDATE `creature_template` SET `equipment_id`=950 WHERE `entry`=950;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=951;
UPDATE `creature_template` SET `equipment_id`=1540 WHERE `entry`=1540;
UPDATE `creature_template` SET `equipment_id`=1035 WHERE `entry`=1035;
UPDATE `creature_template` SET `equipment_id`=3592 WHERE `entry`=3592;
UPDATE `creature_template` SET `equipment_id`=955 WHERE `entry`=955;
UPDATE `creature_template` SET `equipment_id`=956 WHERE `entry`=956;
UPDATE `creature_template` SET `equipment_id`=3586 WHERE `entry`=3586;
UPDATE `creature_template` SET `equipment_id`=957 WHERE `entry`=957;
UPDATE `creature_template` SET `equipment_id`=958 WHERE `entry`=958;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=1318;
UPDATE `creature_template` SET `equipment_id`=960 WHERE `entry`=960;
UPDATE `creature_template` SET `equipment_id`=963 WHERE `entry`=963;
UPDATE `creature_template` SET `equipment_id`=1334 WHERE `entry`=1334;
UPDATE `creature_template` SET `equipment_id`=1702 WHERE `entry`=1702;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=1187;
UPDATE `creature_template` SET `equipment_id`=978 WHERE `entry`=978;
UPDATE `creature_template` SET `equipment_id`=979 WHERE `entry`=979;
UPDATE `creature_template` SET `equipment_id`=980 WHERE `entry`=980;
UPDATE `creature_template` SET `equipment_id`=981 WHERE `entry`=981;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=3239;
UPDATE `creature_template` SET `equipment_id`=982 WHERE `entry`=982;
UPDATE `creature_template` SET `equipment_id`=983 WHERE `entry`=983;
UPDATE `creature_template` SET `equipment_id`=1700 WHERE `entry`=1700;
UPDATE `creature_template` SET `equipment_id`=1342 WHERE `entry`=1342;
UPDATE `creature_template` SET `equipment_id`=984 WHERE `entry`=984;
UPDATE `creature_template` SET `equipment_id`=985 WHERE `entry`=985;
UPDATE `creature_template` SET `equipment_id`=986 WHERE `entry`=986;
UPDATE `creature_template` SET `equipment_id`=2360 WHERE `entry`=2360;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=3752;
UPDATE `creature_template` SET `equipment_id`=3385 WHERE `entry`=3385;
UPDATE `creature_template` SET `equipment_id`=987 WHERE `entry`=987;
UPDATE `creature_template` SET `equipment_id`=3378 WHERE `entry`=3378;
UPDATE `creature_template` SET `equipment_id`=988 WHERE `entry`=988;
UPDATE `creature_template` SET `equipment_id`=3746 WHERE `entry`=3746;
UPDATE `creature_template` SET `equipment_id`=989 WHERE `entry`=989;
UPDATE `creature_template` SET `equipment_id`=999 WHERE `entry`=999;
UPDATE `creature_template` SET `equipment_id`=1652 WHERE `entry`=1652;
UPDATE `creature_template` SET `equipment_id`=1001 WHERE `entry`=1001;
UPDATE `creature_template` SET `equipment_id`=1662 WHERE `entry`=1662;
UPDATE `creature_template` SET `equipment_id`=1007 WHERE `entry`=1007;
UPDATE `creature_template` SET `equipment_id`=1660 WHERE `entry`=1660;
UPDATE `creature_template` SET `equipment_id`=1008 WHERE `entry`=1008;
UPDATE `creature_template` SET `equipment_id`=1009 WHERE `entry`=1009;
UPDATE `creature_template` SET `equipment_id`=1091 WHERE `entry`=1091;
UPDATE `creature_template` SET `equipment_id`=1010 WHERE `entry`=1010;
UPDATE `creature_template` SET `equipment_id`=15936 WHERE `entry`=15936;
UPDATE `creature_template` SET `equipment_id`=1011 WHERE `entry`=1011;
UPDATE `creature_template` SET `equipment_id`=1013 WHERE `entry`=1013;
UPDATE `creature_template` SET `equipment_id`=7802 WHERE `entry`=7802;
UPDATE `creature_template` SET `equipment_id`=3143 WHERE `entry`=3143;
UPDATE `creature_template` SET `equipment_id`=1014 WHERE `entry`=1014;
UPDATE `creature_template` SET `equipment_id`=1099 WHERE `entry`=1099;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=1019;
UPDATE `creature_template` SET `equipment_id`=2499 WHERE `entry`=2499;
UPDATE `creature_template` SET `equipment_id`=1024 WHERE `entry`=1024;
UPDATE `creature_template` SET `equipment_id`=14771 WHERE `entry`=14771;
UPDATE `creature_template` SET `equipment_id`=1025 WHERE `entry`=1025;
UPDATE `creature_template` SET `equipment_id`=1028 WHERE `entry`=1028;
UPDATE `creature_template` SET `equipment_id`=1029 WHERE `entry`=1029;
UPDATE `creature_template` SET `equipment_id`=1976 WHERE `entry`=1976;
UPDATE `creature_template` SET `equipment_id`=2517 WHERE `entry`=2517;
UPDATE `creature_template` SET `equipment_id`=1034 WHERE `entry`=1034;
UPDATE `creature_template` SET `equipment_id`=1036 WHERE `entry`=1036;
UPDATE `creature_template` SET `equipment_id`=1037 WHERE `entry`=1037;
UPDATE `creature_template` SET `equipment_id`=1920 WHERE `entry`=1920;
UPDATE `creature_template` SET `equipment_id`=1045 WHERE `entry`=1045;
UPDATE `creature_template` SET `equipment_id`=2950 WHERE `entry`=2950;
UPDATE `creature_template` SET `equipment_id`=1047 WHERE `entry`=1047;
UPDATE `creature_template` SET `equipment_id`=1050 WHERE `entry`=1050;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=6549;
UPDATE `creature_template` SET `equipment_id`=1052 WHERE `entry`=1052;
UPDATE `creature_template` SET `equipment_id`=1053 WHERE `entry`=1053;
UPDATE `creature_template` SET `equipment_id`=1054 WHERE `entry`=1054;
UPDATE `creature_template` SET `equipment_id`=1057 WHERE `entry`=1057;
UPDATE `creature_template` SET `equipment_id`=1064 WHERE `entry`=1064;
UPDATE `creature_template` SET `equipment_id`=2395 WHERE `entry`=2395;
UPDATE `creature_template` SET `equipment_id`=1065 WHERE `entry`=1065;
UPDATE `creature_template` SET `equipment_id`=1068 WHERE `entry`=1068;
UPDATE `creature_template` SET `equipment_id`=7886 WHERE `entry`=7886;
UPDATE `creature_template` SET `equipment_id`=1884 WHERE `entry`=1884;
UPDATE `creature_template` SET `equipment_id`=1071 WHERE `entry`=1071;
UPDATE `creature_template` SET `equipment_id`=1073 WHERE `entry`=1073;
UPDATE `creature_template` SET `equipment_id`=1952 WHERE `entry`=1952;
UPDATE `creature_template` SET `equipment_id`=1074 WHERE `entry`=1074;
UPDATE `creature_template` SET `equipment_id`=2477 WHERE `entry`=2477;
UPDATE `creature_template` SET `equipment_id`=2780 WHERE `entry`=2780;
UPDATE `creature_template` SET `equipment_id`=1960 WHERE `entry`=1960;
UPDATE `creature_template` SET `equipment_id`=2779 WHERE `entry`=2779;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=2501;
UPDATE `creature_template` SET `equipment_id`=1089 WHERE `entry`=1089;
UPDATE `creature_template` SET `equipment_id`=1090 WHERE `entry`=1090;
UPDATE `creature_template` SET `equipment_id`=2557 WHERE `entry`=2557;
UPDATE `creature_template` SET `equipment_id`=1094 WHERE `entry`=1094;
UPDATE `creature_template` SET `equipment_id`=3062 WHERE `entry`=3062;
UPDATE `creature_template` SET `equipment_id`=1095 WHERE `entry`=1095;
UPDATE `creature_template` SET `equipment_id`=1096 WHERE `entry`=1096;
UPDATE `creature_template` SET `equipment_id`=2555 WHERE `entry`=2555;
UPDATE `creature_template` SET `equipment_id`=1097 WHERE `entry`=1097;
UPDATE `creature_template` SET `equipment_id`=1098 WHERE `entry`=1098;
UPDATE `creature_template` SET `equipment_id`=1101 WHERE `entry`=1101;
UPDATE `creature_template` SET `equipment_id`=1104 WHERE `entry`=1104;
UPDATE `creature_template` SET `equipment_id`=1106 WHERE `entry`=1106;
UPDATE `creature_template` SET `equipment_id`=2509 WHERE `entry`=2509;
UPDATE `creature_template` SET `equipment_id`=3014 WHERE `entry`=3014;
UPDATE `creature_template` SET `equipment_id`=1833 WHERE `entry`=1833;
UPDATE `creature_template` SET `equipment_id`=2507 WHERE `entry`=2507;
UPDATE `creature_template` SET `equipment_id`=1115 WHERE `entry`=1115;
UPDATE `creature_template` SET `equipment_id`=2344 WHERE `entry`=2344;
UPDATE `creature_template` SET `equipment_id`=1116 WHERE `entry`=1116;
UPDATE `creature_template` SET `equipment_id`=1837 WHERE `entry`=1837;
UPDATE `creature_template` SET `equipment_id`=1117 WHERE `entry`=1117;
UPDATE `creature_template` SET `equipment_id`=2338 WHERE `entry`=2338;
UPDATE `creature_template` SET `equipment_id`=1118 WHERE `entry`=1118;
UPDATE `creature_template` SET `equipment_id`=1121 WHERE `entry`=1121;
UPDATE `creature_template` SET `equipment_id`=1936 WHERE `entry`=1936;
UPDATE `creature_template` SET `equipment_id`=1124 WHERE `entry`=1124;
UPDATE `creature_template` SET `equipment_id`=1940 WHERE `entry`=1940;
UPDATE `creature_template` SET `equipment_id`=2459 WHERE `entry`=2459;
UPDATE `creature_template` SET `equipment_id`=1944 WHERE `entry`=1944;
UPDATE `creature_template` SET `equipment_id`=1948 WHERE `entry`=1948;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=1134;
UPDATE `creature_template` SET `equipment_id`=1141 WHERE `entry`=1141;
UPDATE `creature_template` SET `equipment_id`=1146 WHERE `entry`=1146;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=1149;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=1156;
UPDATE `creature_template` SET `equipment_id`=1157 WHERE `entry`=1157;
UPDATE `creature_template` SET `equipment_id`=1160 WHERE `entry`=1160;
UPDATE `creature_template` SET `equipment_id`=1161 WHERE `entry`=1161;
UPDATE `creature_template` SET `equipment_id`=1164 WHERE `entry`=1164;
UPDATE `creature_template` SET `equipment_id`=1165 WHERE `entry`=1165;
UPDATE `creature_template` SET `equipment_id`=1172 WHERE `entry`=1172;
UPDATE `creature_template` SET `equipment_id`=1893 WHERE `entry`=1893;
UPDATE `creature_template` SET `equipment_id`=1173 WHERE `entry`=1173;
UPDATE `creature_template` SET `equipment_id`=1176 WHERE `entry`=1176;
UPDATE `creature_template` SET `equipment_id`=1177 WHERE `entry`=1177;
UPDATE `creature_template` SET `equipment_id`=1179 WHERE `entry`=1179;
UPDATE `creature_template` SET `equipment_id`=1180 WHERE `entry`=1180;
UPDATE `creature_template` SET `equipment_id`=1901 WHERE `entry`=1901;
UPDATE `creature_template` SET `equipment_id`=1183 WHERE `entry`=1183;
UPDATE `creature_template` SET `equipment_id`=1841 WHERE `entry`=1841;
UPDATE `creature_template` SET `equipment_id`=2004 WHERE `entry`=2004;
UPDATE `creature_template` SET `equipment_id`=2008 WHERE `entry`=2008;
UPDATE `creature_template` SET `equipment_id`=1853 WHERE `entry`=1853;
UPDATE `creature_template` SET `equipment_id`=1197 WHERE `entry`=1197;
UPDATE `creature_template` SET `equipment_id`=2012 WHERE `entry`=2012;
UPDATE `creature_template` SET `equipment_id`=1200 WHERE `entry`=1200;
UPDATE `creature_template` SET `equipment_id`=1203 WHERE `entry`=1203;
UPDATE `creature_template` SET `equipment_id`=1204 WHERE `entry`=1204;
UPDATE `creature_template` SET `equipment_id`=1205 WHERE `entry`=1205;
UPDATE `creature_template` SET `equipment_id`=1206 WHERE `entry`=1206;
UPDATE `creature_template` SET `equipment_id`=1210 WHERE `entry`=1210;
UPDATE `creature_template` SET `equipment_id`=1213 WHERE `entry`=1213;
UPDATE `creature_template` SET `equipment_id`=2306 WHERE `entry`=2306;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=1228;
UPDATE `creature_template` SET `equipment_id`=2594 WHERE `entry`=2594;
UPDATE `creature_template` SET `equipment_id`=1229 WHERE `entry`=1229;
UPDATE `creature_template` SET `equipment_id`=2386 WHERE `entry`=2386;
UPDATE `creature_template` SET `equipment_id`=1232 WHERE `entry`=1232;
UPDATE `creature_template` SET `equipment_id`=1236 WHERE `entry`=1236;
UPDATE `creature_template` SET `equipment_id`=1957 WHERE `entry`=1957;
UPDATE `creature_template` SET `equipment_id`=13445 WHERE `entry`=13445;
UPDATE `creature_template` SET `equipment_id`=1237 WHERE `entry`=1237;
UPDATE `creature_template` SET `equipment_id`=6490 WHERE `entry`=6490;
UPDATE `creature_template` SET `equipment_id`=1243 WHERE `entry`=1243;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=1244;
UPDATE `creature_template` SET `equipment_id`=1965 WHERE `entry`=1965;
UPDATE `creature_template` SET `equipment_id`=2610 WHERE `entry`=2610;
UPDATE `creature_template` SET `equipment_id`=1245 WHERE `entry`=1245;
UPDATE `creature_template` SET `equipment_id`=2466 WHERE `entry`=2466;
UPDATE `creature_template` SET `equipment_id`=2847 WHERE `entry`=2847;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=1246;
UPDATE `creature_template` SET `equipment_id`=1252 WHERE `entry`=1252;
UPDATE `creature_template` SET `equipment_id`=1909 WHERE `entry`=1909;
UPDATE `creature_template` SET `equipment_id`=1256 WHERE `entry`=1256;
UPDATE `creature_template` SET `equipment_id`=1913 WHERE `entry`=1913;
UPDATE `creature_template` SET `equipment_id`=1260 WHERE `entry`=1260;
UPDATE `creature_template` SET `equipment_id`=1917 WHERE `entry`=1917;
UPDATE `creature_template` SET `equipment_id`=1265 WHERE `entry`=1265;
UPDATE `creature_template` SET `equipment_id`=1266 WHERE `entry`=1266;
UPDATE `creature_template` SET `equipment_id`=5283 WHERE `entry`=5283;
UPDATE `creature_template` SET `equipment_id`=2352 WHERE `entry`=2352;
UPDATE `creature_template` SET `equipment_id`=1267 WHERE `entry`=1267;
UPDATE `creature_template` SET `equipment_id`=1268 WHERE `entry`=1268;
UPDATE `creature_template` SET `equipment_id`=1276 WHERE `entry`=1276;
UPDATE `creature_template` SET `equipment_id`=1869 WHERE `entry`=1869;
UPDATE `creature_template` SET `equipment_id`=1277 WHERE `entry`=1277;
UPDATE `creature_template` SET `equipment_id`=2370 WHERE `entry`=2370;
UPDATE `creature_template` SET `equipment_id`=2243 WHERE `entry`=2243;
UPDATE `creature_template` SET `equipment_id`=5665 WHERE `entry`=5665;
UPDATE `creature_template` SET `equipment_id`=1280 WHERE `entry`=1280;
UPDATE `creature_template` SET `equipment_id`=14515 WHERE `entry`=14515;
UPDATE `creature_template` SET `equipment_id`=1281 WHERE `entry`=1281;
UPDATE `creature_template` SET `equipment_id`=1282 WHERE `entry`=1282;
UPDATE `creature_template` SET `equipment_id`=1284 WHERE `entry`=1284;
UPDATE `creature_template` SET `equipment_id`=1285 WHERE `entry`=1285;
UPDATE `creature_template` SET `equipment_id`=1716 WHERE `entry`=1716;
UPDATE `creature_template` SET `equipment_id`=1289 WHERE `entry`=1289;
UPDATE `creature_template` SET `equipment_id`=1292 WHERE `entry`=1292;
UPDATE `creature_template` SET `equipment_id`=1297 WHERE `entry`=1297;
UPDATE `creature_template` SET `equipment_id`=1664 WHERE `entry`=1664;
UPDATE `creature_template` SET `equipment_id`=1298 WHERE `entry`=1298;
UPDATE `creature_template` SET `equipment_id`=2189 WHERE `entry`=2189;
UPDATE `creature_template` SET `equipment_id`=1301 WHERE `entry`=1301;
UPDATE `creature_template` SET `equipment_id`=1668 WHERE `entry`=1668;
UPDATE `creature_template` SET `equipment_id`=1302 WHERE `entry`=1302;
UPDATE `creature_template` SET `equipment_id`=1305 WHERE `entry`=1305;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=1307;
UPDATE `creature_template` SET `equipment_id`=1308 WHERE `entry`=1308;
UPDATE `creature_template` SET `equipment_id`=1676 WHERE `entry`=1676;
UPDATE `creature_template` SET `equipment_id`=2782 WHERE `entry`=2782;
UPDATE `creature_template` SET `equipment_id`=1311 WHERE `entry`=1311;
UPDATE `creature_template` SET `equipment_id`=1312 WHERE `entry`=1312;
UPDATE `creature_template` SET `equipment_id`=1313 WHERE `entry`=1313;
UPDATE `creature_template` SET `equipment_id`=3020 WHERE `entry`=3020;
UPDATE `creature_template` SET `equipment_id`=1316 WHERE `entry`=1316;
UPDATE `creature_template` SET `equipment_id`=3019 WHERE `entry`=3019;
UPDATE `creature_template` SET `equipment_id`=1321 WHERE `entry`=1321;
UPDATE `creature_template` SET `equipment_id`=1322 WHERE `entry`=1322;
UPDATE `creature_template` SET `equipment_id`=1323 WHERE `entry`=1323;
UPDATE `creature_template` SET `equipment_id`=1325 WHERE `entry`=1325;
UPDATE `creature_template` SET `equipment_id`=1328 WHERE `entry`=1328;
UPDATE `creature_template` SET `equipment_id`=1329 WHERE `entry`=1329;
UPDATE `creature_template` SET `equipment_id`=1696 WHERE `entry`=1696;
UPDATE `creature_template` SET `equipment_id`=3036 WHERE `entry`=3036;
UPDATE `creature_template` SET `equipment_id`=1330 WHERE `entry`=1330;
UPDATE `creature_template` SET `equipment_id`=4049 WHERE `entry`=4049;
UPDATE `creature_template` SET `equipment_id`=1335 WHERE `entry`=1335;
UPDATE `creature_template` SET `equipment_id`=1336 WHERE `entry`=1336;
UPDATE `creature_template` SET `equipment_id`=1337 WHERE `entry`=1337;
UPDATE `creature_template` SET `equipment_id`=1340 WHERE `entry`=1340;
UPDATE `creature_template` SET `equipment_id`=1708 WHERE `entry`=1708;
UPDATE `creature_template` SET `equipment_id`=2814 WHERE `entry`=2814;
UPDATE `creature_template` SET `equipment_id`=1343 WHERE `entry`=1343;
UPDATE `creature_template` SET `equipment_id`=8153 WHERE `entry`=8153;
UPDATE `creature_template` SET `equipment_id`=1344 WHERE `entry`=1344;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=1345;
UPDATE `creature_template` SET `equipment_id`=1776 WHERE `entry`=1776;
UPDATE `creature_template` SET `equipment_id`=2299 WHERE `entry`=2299;
UPDATE `creature_template` SET `equipment_id`=1784 WHERE `entry`=1784;
UPDATE `creature_template` SET `equipment_id`=1354 WHERE `entry`=1354;
UPDATE `creature_template` SET `equipment_id`=1358 WHERE `entry`=1358;
UPDATE `creature_template` SET `equipment_id`=1360 WHERE `entry`=1360;
UPDATE `creature_template` SET `equipment_id`=1569 WHERE `entry`=1569;
UPDATE `creature_template` SET `equipment_id`=1732 WHERE `entry`=1732;
UPDATE `creature_template` SET `equipment_id`=1368 WHERE `entry`=1368;
UPDATE `creature_template` SET `equipment_id`=1370 WHERE `entry`=1370;
UPDATE `creature_template` SET `equipment_id`=1373 WHERE `entry`=1373;
UPDATE `creature_template` SET `equipment_id`=1740 WHERE `entry`=1740;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=1374;
UPDATE `creature_template` SET `equipment_id`=1375 WHERE `entry`=1375;
UPDATE `creature_template` SET `equipment_id`=1377 WHERE `entry`=1377;
UPDATE `creature_template` SET `equipment_id`=1680 WHERE `entry`=1680;
UPDATE `creature_template` SET `equipment_id`=1684 WHERE `entry`=1684;
UPDATE `creature_template` SET `equipment_id`=1382 WHERE `entry`=1382;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=1385;
UPDATE `creature_template` SET `equipment_id`=1387 WHERE `entry`=1387;
UPDATE `creature_template` SET `equipment_id`=1393 WHERE `entry`=1393;
UPDATE `creature_template` SET `equipment_id`=1397 WHERE `entry`=1397;
UPDATE `creature_template` SET `equipment_id`=2283 WHERE `entry`=2283;
UPDATE `creature_template` SET `equipment_id`=6389 WHERE `entry`=6389;
UPDATE `creature_template` SET `equipment_id`=1772 WHERE `entry`=1772;
UPDATE `creature_template` SET `equipment_id`=1407 WHERE `entry`=1407;
UPDATE `creature_template` SET `equipment_id`=2583 WHERE `entry`=2583;
UPDATE `creature_template` SET `equipment_id`=1415 WHERE `entry`=1415;
UPDATE `creature_template` SET `equipment_id`=1416 WHERE `entry`=1416;
UPDATE `creature_template` SET `equipment_id`=1561 WHERE `entry`=1561;
UPDATE `creature_template` SET `equipment_id`=1565 WHERE `entry`=1565;
UPDATE `creature_template` SET `equipment_id`=1421 WHERE `entry`=1421;
UPDATE `creature_template` SET `equipment_id`=1422 WHERE `entry`=1422;
UPDATE `creature_template` SET `equipment_id`=1423 WHERE `entry`=1423;
UPDATE `creature_template` SET `equipment_id`=1424 WHERE `entry`=1424;
UPDATE `creature_template` SET `equipment_id`=1425 WHERE `entry`=1425;
UPDATE `creature_template` SET `equipment_id`=1426 WHERE `entry`=1426;
UPDATE `creature_template` SET `equipment_id`=1432 WHERE `entry`=1432;
UPDATE `creature_template` SET `equipment_id`=1435 WHERE `entry`=1435;
UPDATE `creature_template` SET `equipment_id`=1436 WHERE `entry`=1436;
UPDATE `creature_template` SET `equipment_id`=1645 WHERE `entry`=1645;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=1437;
UPDATE `creature_template` SET `equipment_id`=1439 WHERE `entry`=1439;
UPDATE `creature_template` SET `equipment_id`=1442 WHERE `entry`=1442;
UPDATE `creature_template` SET `equipment_id`=2269 WHERE `entry`=2269;
UPDATE `creature_template` SET `equipment_id`=1443 WHERE `entry`=1443;
UPDATE `creature_template` SET `equipment_id`=1445 WHERE `entry`=1445;
UPDATE `creature_template` SET `equipment_id`=1748 WHERE `entry`=1748;
UPDATE `creature_template` SET `equipment_id`=1447 WHERE `entry`=1447;
UPDATE `creature_template` SET `equipment_id`=2774 WHERE `entry`=2774;
UPDATE `creature_template` SET `equipment_id`=1448 WHERE `entry`=1448;
UPDATE `creature_template` SET `equipment_id`=2267 WHERE `entry`=2267;
UPDATE `creature_template` SET `equipment_id`=1449 WHERE `entry`=1449;
UPDATE `creature_template` SET `equipment_id`=1752 WHERE `entry`=1752;
UPDATE `creature_template` SET `equipment_id`=1450 WHERE `entry`=1450;
UPDATE `creature_template` SET `equipment_id`=1453 WHERE `entry`=1453;
UPDATE `creature_template` SET `equipment_id`=1756 WHERE `entry`=1756;
UPDATE `creature_template` SET `equipment_id`=1537 WHERE `entry`=1537;
UPDATE `creature_template` SET `equipment_id`=1459 WHERE `entry`=1459;
UPDATE `creature_template` SET `equipment_id`=1460 WHERE `entry`=1460;
UPDATE `creature_template` SET `equipment_id`=1461 WHERE `entry`=1461;
UPDATE `creature_template` SET `equipment_id`=6202 WHERE `entry`=6202;
UPDATE `creature_template` SET `equipment_id`=2567 WHERE `entry`=2567;
UPDATE `creature_template` SET `equipment_id`=1463 WHERE `entry`=1463;
UPDATE `creature_template` SET `equipment_id`=1464 WHERE `entry`=1464;
UPDATE `creature_template` SET `equipment_id`=1545 WHERE `entry`=1545;
UPDATE `creature_template` SET `equipment_id`=1469 WHERE `entry`=1469;
UPDATE `creature_template` SET `equipment_id`=2050 WHERE `entry`=2050;
UPDATE `creature_template` SET `equipment_id`=1470 WHERE `entry`=1470;
UPDATE `creature_template` SET `equipment_id`=1471 WHERE `entry`=1471;
UPDATE `creature_template` SET `equipment_id`=3879 WHERE `entry`=3879;
UPDATE `creature_template` SET `equipment_id`=1473 WHERE `entry`=1473;
UPDATE `creature_template` SET `equipment_id`=1475 WHERE `entry`=1475;
UPDATE `creature_template` SET `equipment_id`=6224 WHERE `entry`=6224;
UPDATE `creature_template` SET `equipment_id`=1476 WHERE `entry`=1476;
UPDATE `creature_template` SET `equipment_id`=2857 WHERE `entry`=2857;
UPDATE `creature_template` SET `equipment_id`=1483 WHERE `entry`=1483;
UPDATE `creature_template` SET `equipment_id`=2136 WHERE `entry`=2136;
UPDATE `creature_template` SET `equipment_id`=1484 WHERE `entry`=1484;
UPDATE `creature_template` SET `equipment_id`=1489 WHERE `entry`=1489;
UPDATE `creature_template` SET `equipment_id`=1491 WHERE `entry`=1491;
UPDATE `creature_template` SET `equipment_id`=1701 WHERE `entry`=1701;
UPDATE `creature_template` SET `equipment_id`=1497 WHERE `entry`=1497;
UPDATE `creature_template` SET `equipment_id`=7999 WHERE `entry`=7999;
UPDATE `creature_template` SET `equipment_id`=1499 WHERE `entry`=1499;
UPDATE `creature_template` SET `equipment_id`=2216 WHERE `entry`=2216;
UPDATE `creature_template` SET `equipment_id`=1500 WHERE `entry`=1500;
UPDATE `creature_template` SET `equipment_id`=1506 WHERE `entry`=1506;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=2080;
UPDATE `creature_template` SET `equipment_id`=1507 WHERE `entry`=1507;
UPDATE `creature_template` SET `equipment_id`=1653 WHERE `entry`=1653;
UPDATE `creature_template` SET `equipment_id`=1657 WHERE `entry`=1657;
UPDATE `creature_template` SET `equipment_id`=1515 WHERE `entry`=1515;
UPDATE `creature_template` SET `equipment_id`=2168 WHERE `entry`=2168;
UPDATE `creature_template` SET `equipment_id`=1661 WHERE `entry`=1661;
UPDATE `creature_template` SET `equipment_id`=2607 WHERE `entry`=2607;
UPDATE `creature_template` SET `equipment_id`=1518 WHERE `entry`=1518;
UPDATE `creature_template` SET `equipment_id`=1520 WHERE `entry`=1520;
UPDATE `creature_template` SET `equipment_id`=4818 WHERE `entry`=4818;
UPDATE `creature_template` SET `equipment_id`=2096 WHERE `entry`=2096;
UPDATE `creature_template` SET `equipment_id`=1523 WHERE `entry`=1523;
UPDATE `creature_template` SET `equipment_id`=2090 WHERE `entry`=2090;
UPDATE `creature_template` SET `equipment_id`=6266 WHERE `entry`=6266;
UPDATE `creature_template` SET `equipment_id`=2120 WHERE `entry`=2120;
UPDATE `creature_template` SET `equipment_id`=2114 WHERE `entry`=2114;
UPDATE `creature_template` SET `equipment_id`=1535 WHERE `entry`=1535;
UPDATE `creature_template` SET `equipment_id`=1536 WHERE `entry`=1536;
UPDATE `creature_template` SET `equipment_id`=3005 WHERE `entry`=3005;
UPDATE `creature_template` SET `equipment_id`=1538 WHERE `entry`=1538;
UPDATE `creature_template` SET `equipment_id`=1543 WHERE `entry`=1543;
UPDATE `creature_template` SET `equipment_id`=2486 WHERE `entry`=2486;
UPDATE `creature_template` SET `equipment_id`=3003 WHERE `entry`=3003;
UPDATE `creature_template` SET `equipment_id`=1544 WHERE `entry`=1544;
UPDATE `creature_template` SET `equipment_id`=2510 WHERE `entry`=2510;
UPDATE `creature_template` SET `equipment_id`=7043 WHERE `entry`=7043;
UPDATE `creature_template` SET `equipment_id`=2438 WHERE `entry`=2438;
UPDATE `creature_template` SET `equipment_id`=1560 WHERE `entry`=1560;
UPDATE `creature_template` SET `equipment_id`=1562 WHERE `entry`=1562;
UPDATE `creature_template` SET `equipment_id`=1563 WHERE `entry`=1563;
UPDATE `creature_template` SET `equipment_id`=1568 WHERE `entry`=1568;
UPDATE `creature_template` SET `equipment_id`=2909 WHERE `entry`=2909;
UPDATE `creature_template` SET `equipment_id`=1570 WHERE `entry`=1570;
UPDATE `creature_template` SET `equipment_id`=2252 WHERE `entry`=2252;
UPDATE `creature_template` SET `equipment_id`=1642 WHERE `entry`=1642;
UPDATE `creature_template` SET `equipment_id`=3053 WHERE `entry`=3053;
UPDATE `creature_template` SET `equipment_id`=1650 WHERE `entry`=1650;
UPDATE `creature_template` SET `equipment_id`=2534 WHERE `entry`=2534;
UPDATE `creature_template` SET `equipment_id`=3051 WHERE `entry`=3051;
UPDATE `creature_template` SET `equipment_id`=7157 WHERE `entry`=7157;
UPDATE `creature_template` SET `equipment_id`=1663 WHERE `entry`=1663;
UPDATE `creature_template` SET `equipment_id`=1667 WHERE `entry`=1667;
UPDATE `creature_template` SET `equipment_id`=6928 WHERE `entry`=6928;
UPDATE `creature_template` SET `equipment_id`=1669 WHERE `entry`=1669;
UPDATE `creature_template` SET `equipment_id`=1670 WHERE `entry`=1670;
UPDATE `creature_template` SET `equipment_id`=2840 WHERE `entry`=2840;
UPDATE `creature_template` SET `equipment_id`=1678 WHERE `entry`=1678;
UPDATE `creature_template` SET `equipment_id`=1682 WHERE `entry`=1682;
UPDATE `creature_template` SET `equipment_id`=1686 WHERE `entry`=1686;
UPDATE `creature_template` SET `equipment_id`=1690 WHERE `entry`=1690;
UPDATE `creature_template` SET `equipment_id`=2920 WHERE `entry`=2920;
UPDATE `creature_template` SET `equipment_id`=1691 WHERE `entry`=1691;
UPDATE `creature_template` SET `equipment_id`=1694 WHERE `entry`=1694;
UPDATE `creature_template` SET `equipment_id`=1715 WHERE `entry`=1715;
UPDATE `creature_template` SET `equipment_id`=1717 WHERE `entry`=1717;
UPDATE `creature_template` SET `equipment_id`=1718 WHERE `entry`=1718;
UPDATE `creature_template` SET `equipment_id`=1725 WHERE `entry`=1725;
UPDATE `creature_template` SET `equipment_id`=2818 WHERE `entry`=2818;
UPDATE `creature_template` SET `equipment_id`=1726 WHERE `entry`=1726;
UPDATE `creature_template` SET `equipment_id`=2816 WHERE `entry`=2816;
UPDATE `creature_template` SET `equipment_id`=1731 WHERE `entry`=1731;
UPDATE `creature_template` SET `equipment_id`=6177 WHERE `entry`=6177;
UPDATE `creature_template` SET `equipment_id`=1735 WHERE `entry`=1735;
UPDATE `creature_template` SET `equipment_id`=1739 WHERE `entry`=1739;
UPDATE `creature_template` SET `equipment_id`=1741 WHERE `entry`=1741;
UPDATE `creature_template` SET `equipment_id`=2319 WHERE `entry`=2319;
UPDATE `creature_template` SET `equipment_id`=1742 WHERE `entry`=1742;
UPDATE `creature_template` SET `equipment_id`=6495 WHERE `entry`=6495;
UPDATE `creature_template` SET `equipment_id`=1743 WHERE `entry`=1743;
UPDATE `creature_template` SET `equipment_id`=1746 WHERE `entry`=1746;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=2832;
UPDATE `creature_template` SET `equipment_id`=1747 WHERE `entry`=1747;
UPDATE `creature_template` SET `equipment_id`=1749 WHERE `entry`=1749;
UPDATE `creature_template` SET `equipment_id`=1750 WHERE `entry`=1750;
UPDATE `creature_template` SET `equipment_id`=3128 WHERE `entry`=3128;
UPDATE `creature_template` SET `equipment_id`=2984 WHERE `entry`=2984;
UPDATE `creature_template` SET `equipment_id`=1755 WHERE `entry`=1755;
UPDATE `creature_template` SET `equipment_id`=2105 WHERE `entry`=2105;
UPDATE `creature_template` SET `equipment_id`=2848 WHERE `entry`=2848;
UPDATE `creature_template` SET `equipment_id`=1763 WHERE `entry`=1763;
UPDATE `creature_template` SET `equipment_id`=2423 WHERE `entry`=2423;
UPDATE `creature_template` SET `equipment_id`=1767 WHERE `entry`=1767;
UPDATE `creature_template` SET `equipment_id`=1768 WHERE `entry`=1768;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=2930;
UPDATE `creature_template` SET `equipment_id`=1773 WHERE `entry`=1773;
UPDATE `creature_template` SET `equipment_id`=1777 WHERE `entry`=1777;
UPDATE `creature_template` SET `equipment_id`=7034 WHERE `entry`=7034;
UPDATE `creature_template` SET `equipment_id`=2375 WHERE `entry`=2375;
UPDATE `creature_template` SET `equipment_id`=2888 WHERE `entry`=2888;
UPDATE `creature_template` SET `equipment_id`=1787 WHERE `entry`=1787;
UPDATE `creature_template` SET `equipment_id`=1788 WHERE `entry`=1788;
UPDATE `creature_template` SET `equipment_id`=1789 WHERE `entry`=1789;
UPDATE `creature_template` SET `equipment_id`=5978 WHERE `entry`=5978;
UPDATE `creature_template` SET `equipment_id`=14981 WHERE `entry`=14981;
UPDATE `creature_template` SET `equipment_id`=2771 WHERE `entry`=2771;
UPDATE `creature_template` SET `equipment_id`=2182 WHERE `entry`=2182;
UPDATE `creature_template` SET `equipment_id`=2787 WHERE `entry`=2787;
UPDATE `creature_template` SET `equipment_id`=6000 WHERE `entry`=6000;
UPDATE `creature_template` SET `equipment_id`=1826 WHERE `entry`=1826;
UPDATE `creature_template` SET `equipment_id`=2508 WHERE `entry`=2508;
UPDATE `creature_template` SET `equipment_id`=2653 WHERE `entry`=2653;
UPDATE `creature_template` SET `equipment_id`=3533 WHERE `entry`=3533;
UPDATE `creature_template` SET `equipment_id`=1827 WHERE `entry`=1827;
UPDATE `creature_template` SET `equipment_id`=3521 WHERE `entry`=3521;
UPDATE `creature_template` SET `equipment_id`=1831 WHERE `entry`=1831;
UPDATE `creature_template` SET `equipment_id`=2134 WHERE `entry`=2134;
UPDATE `creature_template` SET `equipment_id`=3530 WHERE `entry`=3530;
UPDATE `creature_template` SET `equipment_id`=1832 WHERE `entry`=1832;
UPDATE `creature_template` SET `equipment_id`=2651 WHERE `entry`=2651;
UPDATE `creature_template` SET `equipment_id`=2805 WHERE `entry`=2805;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=6010;
UPDATE `creature_template` SET `equipment_id`=1834 WHERE `entry`=1834;
UPDATE `creature_template` SET `equipment_id`=1835 WHERE `entry`=1835;
UPDATE `creature_template` SET `equipment_id`=1836 WHERE `entry`=1836;
UPDATE `creature_template` SET `equipment_id`=1839 WHERE `entry`=1839;
UPDATE `creature_template` SET `equipment_id`=2803 WHERE `entry`=2803;
UPDATE `creature_template` SET `equipment_id`=1840 WHERE `entry`=1840;
UPDATE `creature_template` SET `equipment_id`=1842 WHERE `entry`=1842;
UPDATE `creature_template` SET `equipment_id`=2524 WHERE `entry`=2524;
UPDATE `creature_template` SET `equipment_id`=2733 WHERE `entry`=2733;
UPDATE `creature_template` SET `equipment_id`=3549 WHERE `entry`=3549;
UPDATE `creature_template` SET `equipment_id`=3537 WHERE `entry`=3537;
UPDATE `creature_template` SET `equipment_id`=2214 WHERE `entry`=2214;
UPDATE `creature_template` SET `equipment_id`=3546 WHERE `entry`=3546;
UPDATE `creature_template` SET `equipment_id`=1848 WHERE `entry`=1848;
UPDATE `creature_template` SET `equipment_id`=2302 WHERE `entry`=2302;
UPDATE `creature_template` SET `equipment_id`=1855 WHERE `entry`=1855;
UPDATE `creature_template` SET `equipment_id`=1865 WHERE `entry`=1865;
UPDATE `creature_template` SET `equipment_id`=15045 WHERE `entry`=15045;
UPDATE `creature_template` SET `equipment_id`=1888 WHERE `entry`=1888;
UPDATE `creature_template` SET `equipment_id`=1889 WHERE `entry`=1889;
UPDATE `creature_template` SET `equipment_id`=1890 WHERE `entry`=1890;
UPDATE `creature_template` SET `equipment_id`=2717 WHERE `entry`=2717;
UPDATE `creature_template` SET `equipment_id`=1891 WHERE `entry`=1891;
UPDATE `creature_template` SET `equipment_id`=1895 WHERE `entry`=1895;
UPDATE `creature_template` SET `equipment_id`=1896 WHERE `entry`=1896;
UPDATE `creature_template` SET `equipment_id`=2715 WHERE `entry`=2715;
UPDATE `creature_template` SET `equipment_id`=1911 WHERE `entry`=1911;
UPDATE `creature_template` SET `equipment_id`=1912 WHERE `entry`=1912;
UPDATE `creature_template` SET `equipment_id`=1914 WHERE `entry`=1914;
UPDATE `creature_template` SET `equipment_id`=1919 WHERE `entry`=1919;
UPDATE `creature_template` SET `equipment_id`=6382 WHERE `entry`=6382;
UPDATE `creature_template` SET `equipment_id`=2584 WHERE `entry`=2584;
UPDATE `creature_template` SET `equipment_id`=1934 WHERE `entry`=1934;
UPDATE `creature_template` SET `equipment_id`=1935 WHERE `entry`=1935;
UPDATE `creature_template` SET `equipment_id`=1937 WHERE `entry`=1937;
UPDATE `creature_template` SET `equipment_id`=1939 WHERE `entry`=1939;
UPDATE `creature_template` SET `equipment_id`=1941 WHERE `entry`=1941;
UPDATE `creature_template` SET `equipment_id`=1942 WHERE `entry`=1942;
UPDATE `creature_template` SET `equipment_id`=2151 WHERE `entry`=2151;
UPDATE `creature_template` SET `equipment_id`=1943 WHERE `entry`=1943;
UPDATE `creature_template` SET `equipment_id`=1947 WHERE `entry`=1947;
UPDATE `creature_template` SET `equipment_id`=2664 WHERE `entry`=2664;
UPDATE `creature_template` SET `equipment_id`=1950 WHERE `entry`=1950;
UPDATE `creature_template` SET `equipment_id`=2781 WHERE `entry`=2781;
UPDATE `creature_template` SET `equipment_id`=1959 WHERE `entry`=1959;
UPDATE `creature_template` SET `equipment_id`=14848 WHERE `entry`=14848;
UPDATE `creature_template` SET `equipment_id`=1973 WHERE `entry`=1973;
UPDATE `creature_template` SET `equipment_id`=2055 WHERE `entry`=2055;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=1975;
UPDATE `creature_template` SET `equipment_id`=1977 WHERE `entry`=1977;
UPDATE `creature_template` SET `equipment_id`=1978 WHERE `entry`=1978;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=1981;
UPDATE `creature_template` SET `equipment_id`=2562 WHERE `entry`=2562;
UPDATE `creature_template` SET `equipment_id`=2618 WHERE `entry`=2618;
UPDATE `creature_template` SET `equipment_id`=6069 WHERE `entry`=6069;
UPDATE `creature_template` SET `equipment_id`=3368 WHERE `entry`=3368;
UPDATE `creature_template` SET `equipment_id`=2345 WHERE `entry`=2345;
UPDATE `creature_template` SET `equipment_id`=2648 WHERE `entry`=2648;
UPDATE `creature_template` SET `equipment_id`=3363 WHERE `entry`=3363;
UPDATE `creature_template` SET `equipment_id`=2642 WHERE `entry`=2642;
UPDATE `creature_template` SET `equipment_id`=988001 WHERE `entry`=988001;
UPDATE `creature_template` SET `equipment_id`=2002 WHERE `entry`=2002;
UPDATE `creature_template` SET `equipment_id`=2003 WHERE `entry`=2003;
UPDATE `creature_template` SET `equipment_id`=2570 WHERE `entry`=2570;
UPDATE `creature_template` SET `equipment_id`=2005 WHERE `entry`=2005;
UPDATE `creature_template` SET `equipment_id`=6746 WHERE `entry`=6746;
UPDATE `creature_template` SET `equipment_id`=3380 WHERE `entry`=3380;
UPDATE `creature_template` SET `equipment_id`=2215 WHERE `entry`=2215;
UPDATE `creature_template` SET `equipment_id`=2011 WHERE `entry`=2011;
UPDATE `creature_template` SET `equipment_id`=2013 WHERE `entry`=2013;
UPDATE `creature_template` SET `equipment_id`=2079 WHERE `entry`=2079;
UPDATE `creature_template` SET `equipment_id`=6030 WHERE `entry`=6030;
UPDATE `creature_template` SET `equipment_id`=2014 WHERE `entry`=2014;
UPDATE `creature_template` SET `equipment_id`=6768 WHERE `entry`=6768;
UPDATE `creature_template` SET `equipment_id`=2167 WHERE `entry`=2167;
UPDATE `creature_template` SET `equipment_id`=2119 WHERE `entry`=2119;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=2046;
UPDATE `creature_template` SET `equipment_id`=2996 WHERE `entry`=2996;
UPDATE `creature_template` SET `equipment_id`=2053 WHERE `entry`=2053;
UPDATE `creature_template` SET `equipment_id`=2054 WHERE `entry`=2054;
UPDATE `creature_template` SET `equipment_id`=3519 WHERE `entry`=3519;
UPDATE `creature_template` SET `equipment_id`=3004 WHERE `entry`=3004;
UPDATE `creature_template` SET `equipment_id`=3970 WHERE `entry`=3970;
UPDATE `creature_template` SET `equipment_id`=2948 WHERE `entry`=2948;
UPDATE `creature_template` SET `equipment_id`=3457 WHERE `entry`=3457;
UPDATE `creature_template` SET `equipment_id`=2077 WHERE `entry`=2077;
UPDATE `creature_template` SET `equipment_id`=2078 WHERE `entry`=2078;
UPDATE `creature_template` SET `equipment_id`=2081 WHERE `entry`=2081;
UPDATE `creature_template` SET `equipment_id`=3409 WHERE `entry`=3409;
UPDATE `creature_template` SET `equipment_id`=2086 WHERE `entry`=2086;
UPDATE `creature_template` SET `equipment_id`=2091 WHERE `entry`=2091;
UPDATE `creature_template` SET `equipment_id`=4814 WHERE `entry`=4814;
UPDATE `creature_template` SET `equipment_id`=2092 WHERE `entry`=2092;
UPDATE `creature_template` SET `equipment_id`=2976 WHERE `entry`=2976;
UPDATE `creature_template` SET `equipment_id`=3489 WHERE `entry`=3489;
UPDATE `creature_template` SET `equipment_id`=2102 WHERE `entry`=2102;
UPDATE `creature_template` SET `equipment_id`=2108 WHERE `entry`=2108;
UPDATE `creature_template` SET `equipment_id`=3497 WHERE `entry`=3497;
UPDATE `creature_template` SET `equipment_id`=2113 WHERE `entry`=2113;
UPDATE `creature_template` SET `equipment_id`=4082 WHERE `entry`=4082;
UPDATE `creature_template` SET `equipment_id`=2115 WHERE `entry`=2115;
UPDATE `creature_template` SET `equipment_id`=2116 WHERE `entry`=2116;
UPDATE `creature_template` SET `equipment_id`=3060 WHERE `entry`=3060;
UPDATE `creature_template` SET `equipment_id`=2117 WHERE `entry`=2117;
UPDATE `creature_template` SET `equipment_id`=2118 WHERE `entry`=2118;
UPDATE `creature_template` SET `equipment_id`=3064 WHERE `entry`=3064;
UPDATE `creature_template` SET `equipment_id`=2121 WHERE `entry`=2121;
UPDATE `creature_template` SET `equipment_id`=2122 WHERE `entry`=2122;
UPDATE `creature_template` SET `equipment_id`=4090 WHERE `entry`=4090;
UPDATE `creature_template` SET `equipment_id`=2123 WHERE `entry`=2123;
UPDATE `creature_template` SET `equipment_id`=2124 WHERE `entry`=2124;
UPDATE `creature_template` SET `equipment_id`=3577 WHERE `entry`=3577;
UPDATE `creature_template` SET `equipment_id`=2126 WHERE `entry`=2126;
UPDATE `creature_template` SET `equipment_id`=2127 WHERE `entry`=2127;
UPDATE `creature_template` SET `equipment_id`=2128 WHERE `entry`=2128;
UPDATE `creature_template` SET `equipment_id`=2849 WHERE `entry`=2849;
UPDATE `creature_template` SET `equipment_id`=3366 WHERE `entry`=3366;
UPDATE `creature_template` SET `equipment_id`=3008 WHERE `entry`=3008;
UPDATE `creature_template` SET `equipment_id`=2129 WHERE `entry`=2129;
UPDATE `creature_template` SET `equipment_id`=3875 WHERE `entry`=3875;
UPDATE `creature_template` SET `equipment_id`=2130 WHERE `entry`=2130;
UPDATE `creature_template` SET `equipment_id`=2131 WHERE `entry`=2131;
UPDATE `creature_template` SET `equipment_id`=2132 WHERE `entry`=2132;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=3364;
UPDATE `creature_template` SET `equipment_id`=2135 WHERE `entry`=2135;
UPDATE `creature_template` SET `equipment_id`=3374 WHERE `entry`=3374;
UPDATE `creature_template` SET `equipment_id`=3016 WHERE `entry`=3016;
UPDATE `creature_template` SET `equipment_id`=2137 WHERE `entry`=2137;
UPDATE `creature_template` SET `equipment_id`=2861 WHERE `entry`=2861;
UPDATE `creature_template` SET `equipment_id`=2140 WHERE `entry`=2140;
UPDATE `creature_template` SET `equipment_id`=3529 WHERE `entry`=3529;
UPDATE `creature_template` SET `equipment_id`=2142 WHERE `entry`=2142;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=2149;
UPDATE `creature_template` SET `equipment_id`=2968 WHERE `entry`=2968;
UPDATE `creature_template` SET `equipment_id`=2153 WHERE `entry`=2153;
UPDATE `creature_template` SET `equipment_id`=3487 WHERE `entry`=3487;
UPDATE `creature_template` SET `equipment_id`=3481 WHERE `entry`=3481;
UPDATE `creature_template` SET `equipment_id`=2158 WHERE `entry`=2158;
UPDATE `creature_template` SET `equipment_id`=2159 WHERE `entry`=2159;
UPDATE `creature_template` SET `equipment_id`=5603 WHERE `entry`=5603;
UPDATE `creature_template` SET `equipment_id`=2160 WHERE `entry`=2160;
UPDATE `creature_template` SET `equipment_id`=3044 WHERE `entry`=3044;
UPDATE `creature_template` SET `equipment_id`=3553 WHERE `entry`=3553;
UPDATE `creature_template` SET `equipment_id`=3048 WHERE `entry`=3048;
UPDATE `creature_template` SET `equipment_id`=2169 WHERE `entry`=2169;
UPDATE `creature_template` SET `equipment_id`=2170 WHERE `entry`=2170;
UPDATE `creature_template` SET `equipment_id`=2171 WHERE `entry`=2171;
UPDATE `creature_template` SET `equipment_id`=3567 WHERE `entry`=3567;
UPDATE `creature_template` SET `equipment_id`=3052 WHERE `entry`=3052;
UPDATE `creature_template` SET `equipment_id`=3561 WHERE `entry`=3561;
UPDATE `creature_template` SET `equipment_id`=6126 WHERE `entry`=6126;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=2176;
UPDATE `creature_template` SET `equipment_id`=3350 WHERE `entry`=3350;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=2177;
UPDATE `creature_template` SET `equipment_id`=5392 WHERE `entry`=5392;
UPDATE `creature_template` SET `equipment_id`=2179 WHERE `entry`=2179;
UPDATE `creature_template` SET `equipment_id`=2180 WHERE `entry`=2180;
UPDATE `creature_template` SET `equipment_id`=2837 WHERE `entry`=2837;
UPDATE `creature_template` SET `equipment_id`=2181 WHERE `entry`=2181;
UPDATE `creature_template` SET `equipment_id`=3348 WHERE `entry`=3348;
UPDATE `creature_template` SET `equipment_id`=2183 WHERE `entry`=2183;
UPDATE `creature_template` SET `equipment_id`=2184 WHERE `entry`=2184;
UPDATE `creature_template` SET `equipment_id`=3358 WHERE `entry`=3358;
UPDATE `creature_template` SET `equipment_id`=2845 WHERE `entry`=2845;
UPDATE `creature_template` SET `equipment_id`=2190 WHERE `entry`=2190;
UPDATE `creature_template` SET `equipment_id`=3356 WHERE `entry`=3356;
UPDATE `creature_template` SET `equipment_id`=2191 WHERE `entry`=2191;
UPDATE `creature_template` SET `equipment_id`=2913 WHERE `entry`=2913;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=2192;
UPDATE `creature_template` SET `equipment_id`=2201 WHERE `entry`=2201;
UPDATE `creature_template` SET `equipment_id`=3947 WHERE `entry`=3947;
UPDATE `creature_template` SET `equipment_id`=2202 WHERE `entry`=2202;
UPDATE `creature_template` SET `equipment_id`=2203 WHERE `entry`=2203;
UPDATE `creature_template` SET `equipment_id`=2204 WHERE `entry`=2204;
UPDATE `creature_template` SET `equipment_id`=2206 WHERE `entry`=2206;
UPDATE `creature_template` SET `equipment_id`=3436 WHERE `entry`=3436;
UPDATE `creature_template` SET `equipment_id`=2207 WHERE `entry`=2207;
UPDATE `creature_template` SET `equipment_id`=2208 WHERE `entry`=2208;
UPDATE `creature_template` SET `equipment_id`=3382 WHERE `entry`=3382;
UPDATE `creature_template` SET `equipment_id`=3024 WHERE `entry`=3024;
UPDATE `creature_template` SET `equipment_id`=2209 WHERE `entry`=2209;
UPDATE `creature_template` SET `equipment_id`=2211 WHERE `entry`=2211;
UPDATE `creature_template` SET `equipment_id`=3543 WHERE `entry`=3543;
UPDATE `creature_template` SET `equipment_id`=2212 WHERE `entry`=2212;
UPDATE `creature_template` SET `equipment_id`=3334 WHERE `entry`=3334;
UPDATE `creature_template` SET `equipment_id`=2225 WHERE `entry`=2225;
UPDATE `creature_template` SET `equipment_id`=2226 WHERE `entry`=2226;
UPDATE `creature_template` SET `equipment_id`=2228 WHERE `entry`=2228;
UPDATE `creature_template` SET `equipment_id`=2821 WHERE `entry`=2821;
UPDATE `creature_template` SET `equipment_id`=2229 WHERE `entry`=2229;
UPDATE `creature_template` SET `equipment_id`=3332 WHERE `entry`=3332;
UPDATE `creature_template` SET `equipment_id`=3342 WHERE `entry`=3342;
UPDATE `creature_template` SET `equipment_id`=3622 WHERE `entry`=3622;
UPDATE `creature_template` SET `equipment_id`=2240 WHERE `entry`=2240;
UPDATE `creature_template` SET `equipment_id`=3414 WHERE `entry`=3414;
UPDATE `creature_template` SET `equipment_id`=2241 WHERE `entry`=2241;
UPDATE `creature_template` SET `equipment_id`=987000 WHERE `entry`=987000;
UPDATE `creature_template` SET `equipment_id`=2242 WHERE `entry`=2242;
UPDATE `creature_template` SET `equipment_id`=2244 WHERE `entry`=2244;
UPDATE `creature_template` SET `equipment_id`=3621 WHERE `entry`=3621;
UPDATE `creature_template` SET `equipment_id`=3412 WHERE `entry`=3412;
UPDATE `creature_template` SET `equipment_id`=2247 WHERE `entry`=2247;
UPDATE `creature_template` SET `equipment_id`=4652 WHERE `entry`=4652;
UPDATE `creature_template` SET `equipment_id`=2254 WHERE `entry`=2254;
UPDATE `creature_template` SET `equipment_id`=3629 WHERE `entry`=3629;
UPDATE `creature_template` SET `equipment_id`=2255 WHERE `entry`=2255;
UPDATE `creature_template` SET `equipment_id`=2977 WHERE `entry`=2977;
UPDATE `creature_template` SET `equipment_id`=2256 WHERE `entry`=2256;
UPDATE `creature_template` SET `equipment_id`=3494 WHERE `entry`=3494;
UPDATE `creature_template` SET `equipment_id`=2257 WHERE `entry`=2257;
UPDATE `creature_template` SET `equipment_id`=4656 WHERE `entry`=4656;
UPDATE `creature_template` SET `equipment_id`=2981 WHERE `entry`=2981;
UPDATE `creature_template` SET `equipment_id`=2260 WHERE `entry`=2260;
UPDATE `creature_template` SET `equipment_id`=5466 WHERE `entry`=5466;
UPDATE `creature_template` SET `equipment_id`=2261 WHERE `entry`=2261;
UPDATE `creature_template` SET `equipment_id`=3492 WHERE `entry`=3492;
UPDATE `creature_template` SET `equipment_id`=2263 WHERE `entry`=2263;
UPDATE `creature_template` SET `equipment_id`=2985 WHERE `entry`=2985;
UPDATE `creature_template` SET `equipment_id`=2264 WHERE `entry`=2264;
UPDATE `creature_template` SET `equipment_id`=2265 WHERE `entry`=2265;
UPDATE `creature_template` SET `equipment_id`=3502 WHERE `entry`=3502;
UPDATE `creature_template` SET `equipment_id`=2989 WHERE `entry`=2989;
UPDATE `creature_template` SET `equipment_id`=2268 WHERE `entry`=2268;
UPDATE `creature_template` SET `equipment_id`=2270 WHERE `entry`=2270;
UPDATE `creature_template` SET `equipment_id`=2271 WHERE `entry`=2271;
UPDATE `creature_template` SET `equipment_id`=2272 WHERE `entry`=2272;
UPDATE `creature_template` SET `equipment_id`=2276 WHERE `entry`=2276;
UPDATE `creature_template` SET `equipment_id`=2277 WHERE `entry`=2277;
UPDATE `creature_template` SET `equipment_id`=2941 WHERE `entry`=2941;
UPDATE `creature_template` SET `equipment_id`=2287 WHERE `entry`=2287;
UPDATE `creature_template` SET `equipment_id`=3404 WHERE `entry`=3404;
UPDATE `creature_template` SET `equipment_id`=2303 WHERE `entry`=2303;
UPDATE `creature_template` SET `equipment_id`=2304 WHERE `entry`=2304;
UPDATE `creature_template` SET `equipment_id`=2305 WHERE `entry`=2305;
UPDATE `creature_template` SET `equipment_id`=2307 WHERE `entry`=2307;
UPDATE `creature_template` SET `equipment_id`=2308 WHERE `entry`=2308;
UPDATE `creature_template` SET `equipment_id`=2309 WHERE `entry`=2309;
UPDATE `creature_template` SET `equipment_id`=2740 WHERE `entry`=2740;
UPDATE `creature_template` SET `equipment_id`=2310 WHERE `entry`=2310;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=3770;
UPDATE `creature_template` SET `equipment_id`=3263 WHERE `entry`=3263;
UPDATE `creature_template` SET `equipment_id`=2748 WHERE `entry`=2748;
UPDATE `creature_template` SET `equipment_id`=2318 WHERE `entry`=2318;
UPDATE `creature_template` SET `equipment_id`=5251 WHERE `entry`=5251;
UPDATE `creature_template` SET `equipment_id`=2320 WHERE `entry`=2320;
UPDATE `creature_template` SET `equipment_id`=3207 WHERE `entry`=3207;
UPDATE `creature_template` SET `equipment_id`=2324 WHERE `entry`=2324;
UPDATE `creature_template` SET `equipment_id`=2326 WHERE `entry`=2326;
UPDATE `creature_template` SET `equipment_id`=2696 WHERE `entry`=2696;
UPDATE `creature_template` SET `equipment_id`=5269 WHERE `entry`=5269;
UPDATE `creature_template` SET `equipment_id`=3215 WHERE `entry`=3215;
UPDATE `creature_template` SET `equipment_id`=2332 WHERE `entry`=2332;
UPDATE `creature_template` SET `equipment_id`=2333 WHERE `entry`=2333;
UPDATE `creature_template` SET `equipment_id`=2700 WHERE `entry`=2700;
UPDATE `creature_template` SET `equipment_id`=3209 WHERE `entry`=3209;
UPDATE `creature_template` SET `equipment_id`=2335 WHERE `entry`=2335;
UPDATE `creature_template` SET `equipment_id`=2337 WHERE `entry`=2337;
UPDATE `creature_template` SET `equipment_id`=2640 WHERE `entry`=2640;
UPDATE `creature_template` SET `equipment_id`=3666 WHERE `entry`=3666;
UPDATE `creature_template` SET `equipment_id`=2339 WHERE `entry`=2339;
UPDATE `creature_template` SET `equipment_id`=3167 WHERE `entry`=3167;
UPDATE `creature_template` SET `equipment_id`=4047 WHERE `entry`=4047;
UPDATE `creature_template` SET `equipment_id`=2652 WHERE `entry`=2652;
UPDATE `creature_template` SET `equipment_id`=3161 WHERE `entry`=3161;
UPDATE `creature_template` SET `equipment_id`=2357 WHERE `entry`=2357;
UPDATE `creature_template` SET `equipment_id`=3233 WHERE `entry`=3233;
UPDATE `creature_template` SET `equipment_id`=2358 WHERE `entry`=2358;
UPDATE `creature_template` SET `equipment_id`=2363 WHERE `entry`=2363;
UPDATE `creature_template` SET `equipment_id`=2364 WHERE `entry`=2364;
UPDATE `creature_template` SET `equipment_id`=4063 WHERE `entry`=4063;
UPDATE `creature_template` SET `equipment_id`=2365 WHERE `entry`=2365;
UPDATE `creature_template` SET `equipment_id`=2366 WHERE `entry`=2366;
UPDATE `creature_template` SET `equipment_id`=2367 WHERE `entry`=2367;
UPDATE `creature_template` SET `equipment_id`=2368 WHERE `entry`=2368;
UPDATE `creature_template` SET `equipment_id`=13555 WHERE `entry`=13555;
UPDATE `creature_template` SET `equipment_id`=2369 WHERE `entry`=2369;
UPDATE `creature_template` SET `equipment_id`=2371 WHERE `entry`=2371;
UPDATE `creature_template` SET `equipment_id`=3319 WHERE `entry`=3319;
UPDATE `creature_template` SET `equipment_id`=2372 WHERE `entry`=2372;
UPDATE `creature_template` SET `equipment_id`=2373 WHERE `entry`=2373;
UPDATE `creature_template` SET `equipment_id`=2804 WHERE `entry`=2804;
UPDATE `creature_template` SET `equipment_id`=3313 WHERE `entry`=3313;
UPDATE `creature_template` SET `equipment_id`=2374 WHERE `entry`=2374;
UPDATE `creature_template` SET `equipment_id`=2377 WHERE `entry`=2377;
UPDATE `creature_template` SET `equipment_id`=2808 WHERE `entry`=2808;
UPDATE `creature_template` SET `equipment_id`=2378 WHERE `entry`=2378;
UPDATE `creature_template` SET `equipment_id`=2379 WHERE `entry`=2379;
UPDATE `creature_template` SET `equipment_id`=3327 WHERE `entry`=3327;
UPDATE `creature_template` SET `equipment_id`=2380 WHERE `entry`=2380;
UPDATE `creature_template` SET `equipment_id`=2381 WHERE `entry`=2381;
UPDATE `creature_template` SET `equipment_id`=2812 WHERE `entry`=2812;
UPDATE `creature_template` SET `equipment_id`=2382 WHERE `entry`=2382;
UPDATE `creature_template` SET `equipment_id`=2383 WHERE `entry`=2383;
UPDATE `creature_template` SET `equipment_id`=2387 WHERE `entry`=2387;
UPDATE `creature_template` SET `equipment_id`=3271 WHERE `entry`=3271;
UPDATE `creature_template` SET `equipment_id`=2388 WHERE `entry`=2388;
UPDATE `creature_template` SET `equipment_id`=2597 WHERE `entry`=2597;
UPDATE `creature_template` SET `equipment_id`=2389 WHERE `entry`=2389;
UPDATE `creature_template` SET `equipment_id`=3265 WHERE `entry`=3265;
UPDATE `creature_template` SET `equipment_id`=2390 WHERE `entry`=2390;
UPDATE `creature_template` SET `equipment_id`=2391 WHERE `entry`=2391;
UPDATE `creature_template` SET `equipment_id`=2392 WHERE `entry`=2392;
UPDATE `creature_template` SET `equipment_id`=2601 WHERE `entry`=2601;
UPDATE `creature_template` SET `equipment_id`=2393 WHERE `entry`=2393;
UPDATE `creature_template` SET `equipment_id`=5333 WHERE `entry`=5333;
UPDATE `creature_template` SET `equipment_id`=2394 WHERE `entry`=2394;
UPDATE `creature_template` SET `equipment_id`=2396 WHERE `entry`=2396;
UPDATE `creature_template` SET `equipment_id`=2605 WHERE `entry`=2605;
UPDATE `creature_template` SET `equipment_id`=2397 WHERE `entry`=2397;
UPDATE `creature_template` SET `equipment_id`=2764 WHERE `entry`=2764;
UPDATE `creature_template` SET `equipment_id`=3273 WHERE `entry`=3273;
UPDATE `creature_template` SET `equipment_id`=2398 WHERE `entry`=2398;
UPDATE `creature_template` SET `equipment_id`=2399 WHERE `entry`=2399;
UPDATE `creature_template` SET `equipment_id`=5838 WHERE `entry`=5838;
UPDATE `creature_template` SET `equipment_id`=2400 WHERE `entry`=2400;
UPDATE `creature_template` SET `equipment_id`=2401 WHERE `entry`=2401;
UPDATE `creature_template` SET `equipment_id`=2704 WHERE `entry`=2704;
UPDATE `creature_template` SET `equipment_id`=3730 WHERE `entry`=3730;
UPDATE `creature_template` SET `equipment_id`=2403 WHERE `entry`=2403;
UPDATE `creature_template` SET `equipment_id`=3223 WHERE `entry`=3223;
UPDATE `creature_template` SET `equipment_id`=2404 WHERE `entry`=2404;
UPDATE `creature_template` SET `equipment_id`=2405 WHERE `entry`=2405;
UPDATE `creature_template` SET `equipment_id`=2708 WHERE `entry`=2708;
UPDATE `creature_template` SET `equipment_id`=3217 WHERE `entry`=3217;
UPDATE `creature_template` SET `equipment_id`=2712 WHERE `entry`=2712;
UPDATE `creature_template` SET `equipment_id`=2410 WHERE `entry`=2410;
UPDATE `creature_template` SET `equipment_id`=2716 WHERE `entry`=2716;
UPDATE `creature_template` SET `equipment_id`=2415 WHERE `entry`=2415;
UPDATE `creature_template` SET `equipment_id`=2416 WHERE `entry`=2416;
UPDATE `creature_template` SET `equipment_id`=2417 WHERE `entry`=2417;
UPDATE `creature_template` SET `equipment_id`=2784 WHERE `entry`=2784;
UPDATE `creature_template` SET `equipment_id`=2419 WHERE `entry`=2419;
UPDATE `creature_template` SET `equipment_id`=2420 WHERE `entry`=2420;
UPDATE `creature_template` SET `equipment_id`=2421 WHERE `entry`=2421;
UPDATE `creature_template` SET `equipment_id`=2788 WHERE `entry`=2788;
UPDATE `creature_template` SET `equipment_id`=3297 WHERE `entry`=3297;
UPDATE `creature_template` SET `equipment_id`=2422 WHERE `entry`=2422;
UPDATE `creature_template` SET `equipment_id`=2792 WHERE `entry`=2792;
UPDATE `creature_template` SET `equipment_id`=2427 WHERE `entry`=2427;
UPDATE `creature_template` SET `equipment_id`=2428 WHERE `entry`=2428;
UPDATE `creature_template` SET `equipment_id`=2429 WHERE `entry`=2429;
UPDATE `creature_template` SET `equipment_id`=2796 WHERE `entry`=2796;
UPDATE `creature_template` SET `equipment_id`=3305 WHERE `entry`=3305;
UPDATE `creature_template` SET `equipment_id`=2430 WHERE `entry`=2430;
UPDATE `creature_template` SET `equipment_id`=2431 WHERE `entry`=2431;
UPDATE `creature_template` SET `equipment_id`=5870 WHERE `entry`=5870;
UPDATE `creature_template` SET `equipment_id`=2432 WHERE `entry`=2432;
UPDATE `creature_template` SET `equipment_id`=2577 WHERE `entry`=2577;
UPDATE `creature_template` SET `equipment_id`=3603 WHERE `entry`=3603;
UPDATE `creature_template` SET `equipment_id`=2434 WHERE `entry`=2434;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=2435;
UPDATE `creature_template` SET `equipment_id`=2436 WHERE `entry`=2436;
UPDATE `creature_template` SET `equipment_id`=2581 WHERE `entry`=2581;
UPDATE `creature_template` SET `equipment_id`=2437 WHERE `entry`=2437;
UPDATE `creature_template` SET `equipment_id`=3092 WHERE `entry`=3092;
UPDATE `creature_template` SET `equipment_id`=2440 WHERE `entry`=2440;
UPDATE `creature_template` SET `equipment_id`=2585 WHERE `entry`=2585;
UPDATE `creature_template` SET `equipment_id`=2448 WHERE `entry`=2448;
UPDATE `creature_template` SET `equipment_id`=3174 WHERE `entry`=3174;
UPDATE `creature_template` SET `equipment_id`=2449 WHERE `entry`=2449;
UPDATE `creature_template` SET `equipment_id`=3683 WHERE `entry`=3683;
UPDATE `creature_template` SET `equipment_id`=2451 WHERE `entry`=2451;
UPDATE `creature_template` SET `equipment_id`=5146 WHERE `entry`=5146;
UPDATE `creature_template` SET `equipment_id`=3172 WHERE `entry`=3172;
UPDATE `creature_template` SET `equipment_id`=3691 WHERE `entry`=3691;
UPDATE `creature_template` SET `equipment_id`=2458 WHERE `entry`=2458;
UPDATE `creature_template` SET `equipment_id`=2464 WHERE `entry`=2464;
UPDATE `creature_template` SET `equipment_id`=2609 WHERE `entry`=2609;
UPDATE `creature_template` SET `equipment_id`=2465 WHERE `entry`=2465;
UPDATE `creature_template` SET `equipment_id`=2768 WHERE `entry`=2768;
UPDATE `creature_template` SET `equipment_id`=3287 WHERE `entry`=3287;
UPDATE `creature_template` SET `equipment_id`=2468 WHERE `entry`=2468;
UPDATE `creature_template` SET `equipment_id`=2469 WHERE `entry`=2469;
UPDATE `creature_template` SET `equipment_id`=2772 WHERE `entry`=2772;
UPDATE `creature_template` SET `equipment_id`=2470 WHERE `entry`=2470;
UPDATE `creature_template` SET `equipment_id`=2621 WHERE `entry`=2621;
UPDATE `creature_template` SET `equipment_id`=2478 WHERE `entry`=2478;
UPDATE `creature_template` SET `equipment_id`=5695 WHERE `entry`=5695;
UPDATE `creature_template` SET `equipment_id`=2480 WHERE `entry`=2480;
UPDATE `creature_template` SET `equipment_id`=3078 WHERE `entry`=3078;
UPDATE `creature_template` SET `equipment_id`=2481 WHERE `entry`=2481;
UPDATE `creature_template` SET `equipment_id`=3587 WHERE `entry`=3587;
UPDATE `creature_template` SET `equipment_id`=2483 WHERE `entry`=2483;
UPDATE `creature_template` SET `equipment_id`=5178 WHERE `entry`=5178;
UPDATE `creature_template` SET `equipment_id`=2485 WHERE `entry`=2485;
UPDATE `creature_template` SET `equipment_id`=3076 WHERE `entry`=3076;
UPDATE `creature_template` SET `equipment_id`=2488 WHERE `entry`=2488;
UPDATE `creature_template` SET `equipment_id`=2569 WHERE `entry`=2569;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=3086;
UPDATE `creature_template` SET `equipment_id`=2489 WHERE `entry`=2489;
UPDATE `creature_template` SET `equipment_id`=3595 WHERE `entry`=3595;
UPDATE `creature_template` SET `equipment_id`=2490 WHERE `entry`=2490;
UPDATE `creature_template` SET `equipment_id`=2492 WHERE `entry`=2492;
UPDATE `creature_template` SET `equipment_id`=2573 WHERE `entry`=2573;
UPDATE `creature_template` SET `equipment_id`=13839 WHERE `entry`=13839;
UPDATE `creature_template` SET `equipment_id`=3084 WHERE `entry`=3084;
UPDATE `creature_template` SET `equipment_id`=2496 WHERE `entry`=2496;
UPDATE `creature_template` SET `equipment_id`=2641 WHERE `entry`=2641;
UPDATE `creature_template` SET `equipment_id`=2645 WHERE `entry`=2645;
UPDATE `creature_template` SET `equipment_id`=3877 WHERE `entry`=3877;
UPDATE `creature_template` SET `equipment_id`=3156 WHERE `entry`=3156;
UPDATE `creature_template` SET `equipment_id`=2503 WHERE `entry`=2503;
UPDATE `creature_template` SET `equipment_id`=2504 WHERE `entry`=2504;
UPDATE `creature_template` SET `equipment_id`=2649 WHERE `entry`=2649;
UPDATE `creature_template` SET `equipment_id`=3164 WHERE `entry`=3164;
UPDATE `creature_template` SET `equipment_id`=2511 WHERE `entry`=2511;
UPDATE `creature_template` SET `equipment_id`=2512 WHERE `entry`=2512;
UPDATE `creature_template` SET `equipment_id`=2721 WHERE `entry`=2721;
UPDATE `creature_template` SET `equipment_id`=2514 WHERE `entry`=2514;
UPDATE `creature_template` SET `equipment_id`=2516 WHERE `entry`=2516;
UPDATE `creature_template` SET `equipment_id`=2519 WHERE `entry`=2519;
UPDATE `creature_template` SET `equipment_id`=2526 WHERE `entry`=2526;
UPDATE `creature_template` SET `equipment_id`=2527 WHERE `entry`=2527;
UPDATE `creature_template` SET `equipment_id`=2528 WHERE `entry`=2528;
UPDATE `creature_template` SET `equipment_id`=3190 WHERE `entry`=3190;
UPDATE `creature_template` SET `equipment_id`=2530 WHERE `entry`=2530;
UPDATE `creature_template` SET `equipment_id`=5232 WHERE `entry`=5232;
UPDATE `creature_template` SET `equipment_id`=3188 WHERE `entry`=3188;
UPDATE `creature_template` SET `equipment_id`=3198 WHERE `entry`=3198;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=2685;
UPDATE `creature_template` SET `equipment_id`=5759 WHERE `entry`=5759;
UPDATE `creature_template` SET `equipment_id`=3196 WHERE `entry`=3196;
UPDATE `creature_template` SET `equipment_id`=2543 WHERE `entry`=2543;
UPDATE `creature_template` SET `equipment_id`=3142 WHERE `entry`=3142;
UPDATE `creature_template` SET `equipment_id`=2545 WHERE `entry`=2545;
UPDATE `creature_template` SET `equipment_id`=2546 WHERE `entry`=2546;
UPDATE `creature_template` SET `equipment_id`=2548 WHERE `entry`=2548;
UPDATE `creature_template` SET `equipment_id`=2549 WHERE `entry`=2549;
UPDATE `creature_template` SET `equipment_id`=2550 WHERE `entry`=2550;
UPDATE `creature_template` SET `equipment_id`=3140 WHERE `entry`=3140;
UPDATE `creature_template` SET `equipment_id`=3150 WHERE `entry`=3150;
UPDATE `creature_template` SET `equipment_id`=2553 WHERE `entry`=2553;
UPDATE `creature_template` SET `equipment_id`=2554 WHERE `entry`=2554;
UPDATE `creature_template` SET `equipment_id`=2556 WHERE `entry`=2556;
UPDATE `creature_template` SET `equipment_id`=2558 WHERE `entry`=2558;
UPDATE `creature_template` SET `equipment_id`=2564 WHERE `entry`=2564;
UPDATE `creature_template` SET `equipment_id`=2566 WHERE `entry`=2566;
UPDATE `creature_template` SET `equipment_id`=2571 WHERE `entry`=2571;
UPDATE `creature_template` SET `equipment_id`=2572 WHERE `entry`=2572;
UPDATE `creature_template` SET `equipment_id`=2574 WHERE `entry`=2574;
UPDATE `creature_template` SET `equipment_id`=2575 WHERE `entry`=2575;
UPDATE `creature_template` SET `equipment_id`=3458 WHERE `entry`=3458;
UPDATE `creature_template` SET `equipment_id`=3975 WHERE `entry`=3975;
UPDATE `creature_template` SET `equipment_id`=3969 WHERE `entry`=3969;
UPDATE `creature_template` SET `equipment_id`=2582 WHERE `entry`=2582;
UPDATE `creature_template` SET `equipment_id`=2586 WHERE `entry`=2586;
UPDATE `creature_template` SET `equipment_id`=2587 WHERE `entry`=2587;
UPDATE `creature_template` SET `equipment_id`=3983 WHERE `entry`=3983;
UPDATE `creature_template` SET `equipment_id`=2588 WHERE `entry`=2588;
UPDATE `creature_template` SET `equipment_id`=2589 WHERE `entry`=2589;
UPDATE `creature_template` SET `equipment_id`=3977 WHERE `entry`=3977;
UPDATE `creature_template` SET `equipment_id`=2590 WHERE `entry`=2590;
UPDATE `creature_template` SET `equipment_id`=3921 WHERE `entry`=3921;
UPDATE `creature_template` SET `equipment_id`=2598 WHERE `entry`=2598;
UPDATE `creature_template` SET `equipment_id`=2602 WHERE `entry`=2602;
UPDATE `creature_template` SET `equipment_id`=4309 WHERE `entry`=4309;
UPDATE `creature_template` SET `equipment_id`=3418 WHERE `entry`=3418;
UPDATE `creature_template` SET `equipment_id`=2603 WHERE `entry`=2603;
UPDATE `creature_template` SET `equipment_id`=4302 WHERE `entry`=4302;
UPDATE `creature_template` SET `equipment_id`=3935 WHERE `entry`=3935;
UPDATE `creature_template` SET `equipment_id`=2604 WHERE `entry`=2604;
UPDATE `creature_template` SET `equipment_id`=3272 WHERE `entry`=3272;
UPDATE `creature_template` SET `equipment_id`=2606 WHERE `entry`=2606;
UPDATE `creature_template` SET `equipment_id`=4306 WHERE `entry`=4306;
UPDATE `creature_template` SET `equipment_id`=2608 WHERE `entry`=2608;
UPDATE `creature_template` SET `equipment_id`=3490 WHERE `entry`=3490;
UPDATE `creature_template` SET `equipment_id`=2612 WHERE `entry`=2612;
UPDATE `creature_template` SET `equipment_id`=3498 WHERE `entry`=3498;
UPDATE `creature_template` SET `equipment_id`=2619 WHERE `entry`=2619;
UPDATE `creature_template` SET `equipment_id`=2622 WHERE `entry`=2622;
UPDATE `creature_template` SET `equipment_id`=2624 WHERE `entry`=2624;
UPDATE `creature_template` SET `equipment_id`=14323 WHERE `entry`=14323;
UPDATE `creature_template` SET `equipment_id`=2626 WHERE `entry`=2626;
UPDATE `creature_template` SET `equipment_id`=4087 WHERE `entry`=4087;
UPDATE `creature_template` SET `equipment_id`=2628 WHERE `entry`=2628;
UPDATE `creature_template` SET `equipment_id`=14277 WHERE `entry`=14277;
UPDATE `creature_template` SET `equipment_id`=3578 WHERE `entry`=3578;
UPDATE `creature_template` SET `equipment_id`=4095 WHERE `entry`=4095;
UPDATE `creature_template` SET `equipment_id`=2636 WHERE `entry`=2636;
UPDATE `creature_template` SET `equipment_id`=4089 WHERE `entry`=4089;
UPDATE `creature_template` SET `equipment_id`=2639 WHERE `entry`=2639;
UPDATE `creature_template` SET `equipment_id`=3522 WHERE `entry`=3522;
UPDATE `creature_template` SET `equipment_id`=2643 WHERE `entry`=2643;
UPDATE `creature_template` SET `equipment_id`=2644 WHERE `entry`=2644;
UPDATE `creature_template` SET `equipment_id`=2650 WHERE `entry`=2650;
UPDATE `creature_template` SET `equipment_id`=2654 WHERE `entry`=2654;
UPDATE `creature_template` SET `equipment_id`=3884 WHERE `entry`=3884;
UPDATE `creature_template` SET `equipment_id`=3482 WHERE `entry`=3482;
UPDATE `creature_template` SET `equipment_id`=3999 WHERE `entry`=3999;
UPDATE `creature_template` SET `equipment_id`=3993 WHERE `entry`=3993;
UPDATE `creature_template` SET `equipment_id`=6115 WHERE `entry`=6115;
UPDATE `creature_template` SET `equipment_id`=3554 WHERE `entry`=3554;
UPDATE `creature_template` SET `equipment_id`=4065 WHERE `entry`=4065;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=2682;
UPDATE `creature_template` SET `equipment_id`=3562 WHERE `entry`=3562;
UPDATE `creature_template` SET `equipment_id`=2683 WHERE `entry`=2683;
UPDATE `creature_template` SET `equipment_id`=4079 WHERE `entry`=4079;
UPDATE `creature_template` SET `equipment_id`=5614 WHERE `entry`=5614;
UPDATE `creature_template` SET `equipment_id`=2687 WHERE `entry`=2687;
UPDATE `creature_template` SET `equipment_id`=2691 WHERE `entry`=2691;
UPDATE `creature_template` SET `equipment_id`=2692 WHERE `entry`=2692;
UPDATE `creature_template` SET `equipment_id`=2693 WHERE `entry`=2693;
UPDATE `creature_template` SET `equipment_id`=2695 WHERE `entry`=2695;
UPDATE `creature_template` SET `equipment_id`=3355 WHERE `entry`=3355;
UPDATE `creature_template` SET `equipment_id`=2698 WHERE `entry`=2698;
UPDATE `creature_template` SET `equipment_id`=2701 WHERE `entry`=2701;
UPDATE `creature_template` SET `equipment_id`=2703 WHERE `entry`=2703;
UPDATE `creature_template` SET `equipment_id`=3942 WHERE `entry`=3942;
UPDATE `creature_template` SET `equipment_id`=2705 WHERE `entry`=2705;
UPDATE `creature_template` SET `equipment_id`=2706 WHERE `entry`=2706;
UPDATE `creature_template` SET `equipment_id`=2711 WHERE `entry`=2711;
UPDATE `creature_template` SET `equipment_id`=2713 WHERE `entry`=2713;
UPDATE `creature_template` SET `equipment_id`=3435 WHERE `entry`=3435;
UPDATE `creature_template` SET `equipment_id`=2714 WHERE `entry`=2714;
UPDATE `creature_template` SET `equipment_id`=2718 WHERE `entry`=2718;
UPDATE `creature_template` SET `equipment_id`=2719 WHERE `entry`=2719;
UPDATE `creature_template` SET `equipment_id`=2720 WHERE `entry`=2720;
UPDATE `creature_template` SET `equipment_id`=3387 WHERE `entry`=3387;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=3846;
UPDATE `creature_template` SET `equipment_id`=2737 WHERE `entry`=2737;
UPDATE `creature_template` SET `equipment_id`=3331 WHERE `entry`=3331;
UPDATE `creature_template` SET `equipment_id`=2738 WHERE `entry`=2738;
UPDATE `creature_template` SET `equipment_id`=2739 WHERE `entry`=2739;
UPDATE `creature_template` SET `equipment_id`=2743 WHERE `entry`=2743;
UPDATE `creature_template` SET `equipment_id`=2744 WHERE `entry`=2744;
UPDATE `creature_template` SET `equipment_id`=3926 WHERE `entry`=3926;
UPDATE `creature_template` SET `equipment_id`=3411 WHERE `entry`=3411;
UPDATE `creature_template` SET `equipment_id`=2754 WHERE `entry`=2754;
UPDATE `creature_template` SET `equipment_id`=3924 WHERE `entry`=3924;
UPDATE `creature_template` SET `equipment_id`=3934 WHERE `entry`=3934;
UPDATE `creature_template` SET `equipment_id`=2765 WHERE `entry`=2765;
UPDATE `creature_template` SET `equipment_id`=3932 WHERE `entry`=3932;
UPDATE `creature_template` SET `equipment_id`=2767 WHERE `entry`=2767;
UPDATE `creature_template` SET `equipment_id`=2769 WHERE `entry`=2769;
UPDATE `creature_template` SET `equipment_id`=3491 WHERE `entry`=3491;
UPDATE `creature_template` SET `equipment_id`=2770 WHERE `entry`=2770;
UPDATE `creature_template` SET `equipment_id`=4004 WHERE `entry`=4004;
UPDATE `creature_template` SET `equipment_id`=2775 WHERE `entry`=2775;
UPDATE `creature_template` SET `equipment_id`=3499 WHERE `entry`=3499;
UPDATE `creature_template` SET `equipment_id`=2778 WHERE `entry`=2778;
UPDATE `creature_template` SET `equipment_id`=3133 WHERE `entry`=3133;
UPDATE `creature_template` SET `equipment_id`=2785 WHERE `entry`=2785;
UPDATE `creature_template` SET `equipment_id`=3443 WHERE `entry`=3443;
UPDATE `creature_template` SET `equipment_id`=2786 WHERE `entry`=2786;
UPDATE `creature_template` SET `equipment_id`=2789 WHERE `entry`=2789;
UPDATE `creature_template` SET `equipment_id`=3964 WHERE `entry`=3964;
UPDATE `creature_template` SET `equipment_id`=2799 WHERE `entry`=2799;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=3395;
UPDATE `creature_template` SET `equipment_id`=2802 WHERE `entry`=2802;
UPDATE `creature_template` SET `equipment_id`=3403 WHERE `entry`=3403;
UPDATE `creature_template` SET `equipment_id`=2810 WHERE `entry`=2810;
UPDATE `creature_template` SET `equipment_id`=2819 WHERE `entry`=2819;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=3767;
UPDATE `creature_template` SET `equipment_id`=2820 WHERE `entry`=2820;
UPDATE `creature_template` SET `equipment_id`=2834 WHERE `entry`=2834;
UPDATE `creature_template` SET `equipment_id`=2835 WHERE `entry`=2835;
UPDATE `creature_template` SET `equipment_id`=2836 WHERE `entry`=2836;
UPDATE `creature_template` SET `equipment_id`=3713 WHERE `entry`=3713;
UPDATE `creature_template` SET `equipment_id`=2838 WHERE `entry`=2838;
UPDATE `creature_template` SET `equipment_id`=2842 WHERE `entry`=2842;
UPDATE `creature_template` SET `equipment_id`=3210 WHERE `entry`=3210;
UPDATE `creature_template` SET `equipment_id`=2843 WHERE `entry`=2843;
UPDATE `creature_template` SET `equipment_id`=3727 WHERE `entry`=3727;
UPDATE `creature_template` SET `equipment_id`=2846 WHERE `entry`=2846;
UPDATE `creature_template` SET `equipment_id`=2858 WHERE `entry`=2858;
UPDATE `creature_template` SET `equipment_id`=4565 WHERE `entry`=4565;
UPDATE `creature_template` SET `equipment_id`=2859 WHERE `entry`=2859;
UPDATE `creature_template` SET `equipment_id`=4558 WHERE `entry`=4558;
UPDATE `creature_template` SET `equipment_id`=2860 WHERE `entry`=2860;
UPDATE `creature_template` SET `equipment_id`=3745 WHERE `entry`=3745;
UPDATE `creature_template` SET `equipment_id`=3536 WHERE `entry`=3536;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=3759;
UPDATE `creature_template` SET `equipment_id`=3544 WHERE `entry`=3544;
UPDATE `creature_template` SET `equipment_id`=2878 WHERE `entry`=2878;
UPDATE `creature_template` SET `equipment_id`=4569 WHERE `entry`=4569;
UPDATE `creature_template` SET `equipment_id`=2880 WHERE `entry`=2880;
UPDATE `creature_template` SET `equipment_id`=2892 WHERE `entry`=2892;
UPDATE `creature_template` SET `equipment_id`=2893 WHERE `entry`=2893;
UPDATE `creature_template` SET `equipment_id`=2894 WHERE `entry`=2894;
UPDATE `creature_template` SET `equipment_id`=3274 WHERE `entry`=3274;
UPDATE `creature_template` SET `equipment_id`=2907 WHERE `entry`=2907;
UPDATE `creature_template` SET `equipment_id`=4217 WHERE `entry`=4217;
UPDATE `creature_template` SET `equipment_id`=16059 WHERE `entry`=16059;
UPDATE `creature_template` SET `equipment_id`=2910 WHERE `entry`=2910;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=3628;
UPDATE `creature_template` SET `equipment_id`=2911 WHERE `entry`=2911;
UPDATE `creature_template` SET `equipment_id`=3218 WHERE `entry`=3218;
UPDATE `creature_template` SET `equipment_id`=3735 WHERE `entry`=3735;
UPDATE `creature_template` SET `equipment_id`=2916 WHERE `entry`=2916;
UPDATE `creature_template` SET `equipment_id`=2917 WHERE `entry`=2917;
UPDATE `creature_template` SET `equipment_id`=2918 WHERE `entry`=2918;
UPDATE `creature_template` SET `equipment_id`=2921 WHERE `entry`=2921;
UPDATE `creature_template` SET `equipment_id`=3743 WHERE `entry`=3743;
UPDATE `creature_template` SET `equipment_id`=3737 WHERE `entry`=3737;
UPDATE `creature_template` SET `equipment_id`=5859 WHERE `entry`=5859;
UPDATE `creature_template` SET `equipment_id`=3298 WHERE `entry`=3298;
UPDATE `creature_template` SET `equipment_id`=2932 WHERE `entry`=2932;
UPDATE `creature_template` SET `equipment_id`=2934 WHERE `entry`=2934;
UPDATE `creature_template` SET `equipment_id`=2937 WHERE `entry`=2937;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=3606;
UPDATE `creature_template` SET `equipment_id`=2947 WHERE `entry`=2947;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=5648;
UPDATE `creature_template` SET `equipment_id`=2949 WHERE `entry`=2949;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=3604;
UPDATE `creature_template` SET `equipment_id`=2951 WHERE `entry`=2951;
UPDATE `creature_template` SET `equipment_id`=2952 WHERE `entry`=2952;
UPDATE `creature_template` SET `equipment_id`=3614 WHERE `entry`=3614;
UPDATE `creature_template` SET `equipment_id`=2953 WHERE `entry`=2953;
UPDATE `creature_template` SET `equipment_id`=5151 WHERE `entry`=5151;
UPDATE `creature_template` SET `equipment_id`=3171 WHERE `entry`=3171;
UPDATE `creature_template` SET `equipment_id`=5658 WHERE `entry`=5658;
UPDATE `creature_template` SET `equipment_id`=3684 WHERE `entry`=3684;
UPDATE `creature_template` SET `equipment_id`=2967 WHERE `entry`=2967;
UPDATE `creature_template` SET `equipment_id`=3694 WHERE `entry`=3694;
UPDATE `creature_template` SET `equipment_id`=3179 WHERE `entry`=3179;
UPDATE `creature_template` SET `equipment_id`=3692 WHERE `entry`=3692;
UPDATE `creature_template` SET `equipment_id`=2975 WHERE `entry`=2975;
UPDATE `creature_template` SET `equipment_id`=2978 WHERE `entry`=2978;
UPDATE `creature_template` SET `equipment_id`=3282 WHERE `entry`=3282;
UPDATE `creature_template` SET `equipment_id`=2979 WHERE `entry`=2979;
UPDATE `creature_template` SET `equipment_id`=5680 WHERE `entry`=5680;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=3799;
UPDATE `creature_template` SET `equipment_id`=2980 WHERE `entry`=2980;
UPDATE `creature_template` SET `equipment_id`=2982 WHERE `entry`=2982;
UPDATE `creature_template` SET `equipment_id`=2986 WHERE `entry`=2986;
UPDATE `creature_template` SET `equipment_id`=3290 WHERE `entry`=3290;
UPDATE `creature_template` SET `equipment_id`=2987 WHERE `entry`=2987;
UPDATE `creature_template` SET `equipment_id`=3807 WHERE `entry`=3807;
UPDATE `creature_template` SET `equipment_id`=2988 WHERE `entry`=2988;
UPDATE `creature_template` SET `equipment_id`=3801 WHERE `entry`=3801;
UPDATE `creature_template` SET `equipment_id`=2990 WHERE `entry`=2990;
UPDATE `creature_template` SET `equipment_id`=3644 WHERE `entry`=3644;
UPDATE `creature_template` SET `equipment_id`=2993 WHERE `entry`=2993;
UPDATE `creature_template` SET `equipment_id`=3075 WHERE `entry`=3075;
UPDATE `creature_template` SET `equipment_id`=2995 WHERE `entry`=2995;
UPDATE `creature_template` SET `equipment_id`=2997 WHERE `entry`=2997;
UPDATE `creature_template` SET `equipment_id`=5690 WHERE `entry`=5690;
UPDATE `creature_template` SET `equipment_id`=3588 WHERE `entry`=3588;
UPDATE `creature_template` SET `equipment_id`=2999 WHERE `entry`=2999;
UPDATE `creature_template` SET `equipment_id`=3598 WHERE `entry`=3598;
UPDATE `creature_template` SET `equipment_id`=3001 WHERE `entry`=3001;
UPDATE `creature_template` SET `equipment_id`=3083 WHERE `entry`=3083;
UPDATE `creature_template` SET `equipment_id`=3002 WHERE `entry`=3002;
UPDATE `creature_template` SET `equipment_id`=3596 WHERE `entry`=3596;
UPDATE `creature_template` SET `equipment_id`=3007 WHERE `entry`=3007;
UPDATE `creature_template` SET `equipment_id`=3155 WHERE `entry`=3155;
UPDATE `creature_template` SET `equipment_id`=3010 WHERE `entry`=3010;
UPDATE `creature_template` SET `equipment_id`=3011 WHERE `entry`=3011;
UPDATE `creature_template` SET `equipment_id`=5712 WHERE `entry`=5712;
UPDATE `creature_template` SET `equipment_id`=3012 WHERE `entry`=3012;
UPDATE `creature_template` SET `equipment_id`=3013 WHERE `entry`=3013;
UPDATE `creature_template` SET `equipment_id`=3365 WHERE `entry`=3365;
UPDATE `creature_template` SET `equipment_id`=3015 WHERE `entry`=3015;
UPDATE `creature_template` SET `equipment_id`=3678 WHERE `entry`=3678;
UPDATE `creature_template` SET `equipment_id`=3017 WHERE `entry`=3017;
UPDATE `creature_template` SET `equipment_id`=3163 WHERE `entry`=3163;
UPDATE `creature_template` SET `equipment_id`=3018 WHERE `entry`=3018;
UPDATE `creature_template` SET `equipment_id`=3021 WHERE `entry`=3021;
UPDATE `creature_template` SET `equipment_id`=3022 WHERE `entry`=3022;
UPDATE `creature_template` SET `equipment_id`=3373 WHERE `entry`=3373;
UPDATE `creature_template` SET `equipment_id`=3023 WHERE `entry`=3023;
UPDATE `creature_template` SET `equipment_id`=3026 WHERE `entry`=3026;
UPDATE `creature_template` SET `equipment_id`=3027 WHERE `entry`=3027;
UPDATE `creature_template` SET `equipment_id`=3028 WHERE `entry`=3028;
UPDATE `creature_template` SET `equipment_id`=3029 WHERE `entry`=3029;
UPDATE `creature_template` SET `equipment_id`=3748 WHERE `entry`=3748;
UPDATE `creature_template` SET `equipment_id`=3381 WHERE `entry`=3381;
UPDATE `creature_template` SET `equipment_id`=3031 WHERE `entry`=3031;
UPDATE `creature_template` SET `equipment_id`=3390 WHERE `entry`=3390;
UPDATE `creature_template` SET `equipment_id`=3032 WHERE `entry`=3032;
UPDATE `creature_template` SET `equipment_id`=3033 WHERE `entry`=3033;
UPDATE `creature_template` SET `equipment_id`=3034 WHERE `entry`=3034;
UPDATE `creature_template` SET `equipment_id`=3038 WHERE `entry`=3038;
UPDATE `creature_template` SET `equipment_id`=3389 WHERE `entry`=3389;
UPDATE `creature_template` SET `equipment_id`=3039 WHERE `entry`=3039;
UPDATE `creature_template` SET `equipment_id`=3040 WHERE `entry`=3040;
UPDATE `creature_template` SET `equipment_id`=3041 WHERE `entry`=3041;
UPDATE `creature_template` SET `equipment_id`=3187 WHERE `entry`=3187;
UPDATE `creature_template` SET `equipment_id`=3042 WHERE `entry`=3042;
UPDATE `creature_template` SET `equipment_id`=3043 WHERE `entry`=3043;
UPDATE `creature_template` SET `equipment_id`=5744 WHERE `entry`=5744;
UPDATE `creature_template` SET `equipment_id`=3045 WHERE `entry`=3045;
UPDATE `creature_template` SET `equipment_id`=3046 WHERE `entry`=3046;
UPDATE `creature_template` SET `equipment_id`=3047 WHERE `entry`=3047;
UPDATE `creature_template` SET `equipment_id`=3049 WHERE `entry`=3049;
UPDATE `creature_template` SET `equipment_id`=3195 WHERE `entry`=3195;
UPDATE `creature_template` SET `equipment_id`=3050 WHERE `entry`=3050;
UPDATE `creature_template` SET `equipment_id`=3054 WHERE `entry`=3054;
UPDATE `creature_template` SET `equipment_id`=3708 WHERE `entry`=3708;
UPDATE `creature_template` SET `equipment_id`=3055 WHERE `entry`=3055;
UPDATE `creature_template` SET `equipment_id`=3057 WHERE `entry`=3057;
UPDATE `creature_template` SET `equipment_id`=3139 WHERE `entry`=3139;
UPDATE `creature_template` SET `equipment_id`=3059 WHERE `entry`=3059;
UPDATE `creature_template` SET `equipment_id`=3061 WHERE `entry`=3061;
UPDATE `creature_template` SET `equipment_id`=5754 WHERE `entry`=5754;
UPDATE `creature_template` SET `equipment_id`=3063 WHERE `entry`=3063;
UPDATE `creature_template` SET `equipment_id`=3662 WHERE `entry`=3662;
UPDATE `creature_template` SET `equipment_id`=3065 WHERE `entry`=3065;
UPDATE `creature_template` SET `equipment_id`=3147 WHERE `entry`=3147;
UPDATE `creature_template` SET `equipment_id`=3066 WHERE `entry`=3066;
UPDATE `creature_template` SET `equipment_id`=3067 WHERE `entry`=3067;
UPDATE `creature_template` SET `equipment_id`=3072 WHERE `entry`=3072;
UPDATE `creature_template` SET `equipment_id`=12723 WHERE `entry`=12723;
UPDATE `creature_template` SET `equipment_id`=3073 WHERE `entry`=3073;
UPDATE `creature_template` SET `equipment_id`=3077 WHERE `entry`=3077;
UPDATE `creature_template` SET `equipment_id`=3081 WHERE `entry`=3081;
UPDATE `creature_template` SET `equipment_id`=3087 WHERE `entry`=3087;
UPDATE `creature_template` SET `equipment_id`=4483 WHERE `entry`=4483;
UPDATE `creature_template` SET `equipment_id`=3088 WHERE `entry`=3088;
UPDATE `creature_template` SET `equipment_id`=3093 WHERE `entry`=3093;
UPDATE `creature_template` SET `equipment_id`=3095 WHERE `entry`=3095;
UPDATE `creature_template` SET `equipment_id`=3976 WHERE `entry`=3976;
UPDATE `creature_template` SET `equipment_id`=3097 WHERE `entry`=3097;
UPDATE `creature_template` SET `equipment_id`=3980 WHERE `entry`=3980;
UPDATE `creature_template` SET `equipment_id`=3101 WHERE `entry`=3101;
UPDATE `creature_template` SET `equipment_id`=3104 WHERE `entry`=3104;
UPDATE `creature_template` SET `equipment_id`=4803 WHERE `entry`=4803;
UPDATE `creature_template` SET `equipment_id`=3114 WHERE `entry`=3114;
UPDATE `creature_template` SET `equipment_id`=3119 WHERE `entry`=3119;
UPDATE `creature_template` SET `equipment_id`=4515 WHERE `entry`=4515;
UPDATE `creature_template` SET `equipment_id`=3120 WHERE `entry`=3120;
UPDATE `creature_template` SET `equipment_id`=3135 WHERE `entry`=3135;
UPDATE `creature_template` SET `equipment_id`=5849 WHERE `entry`=5849;
UPDATE `creature_template` SET `equipment_id`=3136 WHERE `entry`=3136;
UPDATE `creature_template` SET `equipment_id`=12787 WHERE `entry`=12787;
UPDATE `creature_template` SET `equipment_id`=4080 WHERE `entry`=4080;
UPDATE `creature_template` SET `equipment_id`=3137 WHERE `entry`=3137;
UPDATE `creature_template` SET `equipment_id`=4084 WHERE `entry`=4084;
UPDATE `creature_template` SET `equipment_id`=4088 WHERE `entry`=4088;
UPDATE `creature_template` SET `equipment_id`=3145 WHERE `entry`=3145;
UPDATE `creature_template` SET `equipment_id`=4092 WHERE `entry`=4092;
UPDATE `creature_template` SET `equipment_id`=3149 WHERE `entry`=3149;
UPDATE `creature_template` SET `equipment_id`=3153 WHERE `entry`=3153;
UPDATE `creature_template` SET `equipment_id`=3157 WHERE `entry`=3157;
UPDATE `creature_template` SET `equipment_id`=3159 WHERE `entry`=3159;
UPDATE `creature_template` SET `equipment_id`=3165 WHERE `entry`=3165;
UPDATE `creature_template` SET `equipment_id`=3168 WHERE `entry`=3168;
UPDATE `creature_template` SET `equipment_id`=3169 WHERE `entry`=3169;
UPDATE `creature_template` SET `equipment_id`=3170 WHERE `entry`=3170;
UPDATE `creature_template` SET `equipment_id`=3173 WHERE `entry`=3173;
UPDATE `creature_template` SET `equipment_id`=3177 WHERE `entry`=3177;
UPDATE `creature_template` SET `equipment_id`=3178 WHERE `entry`=3178;
UPDATE `creature_template` SET `equipment_id`=3180 WHERE `entry`=3180;
UPDATE `creature_template` SET `equipment_id`=3996 WHERE `entry`=3996;
UPDATE `creature_template` SET `equipment_id`=3181 WHERE `entry`=3181;
UPDATE `creature_template` SET `equipment_id`=3183 WHERE `entry`=3183;
UPDATE `creature_template` SET `equipment_id`=3184 WHERE `entry`=3184;
UPDATE `creature_template` SET `equipment_id`=4064 WHERE `entry`=4064;
UPDATE `creature_template` SET `equipment_id`=3185 WHERE `entry`=3185;
UPDATE `creature_template` SET `equipment_id`=3186 WHERE `entry`=3186;
UPDATE `creature_template` SET `equipment_id`=3189 WHERE `entry`=3189;
UPDATE `creature_template` SET `equipment_id`=3193 WHERE `entry`=3193;
UPDATE `creature_template` SET `equipment_id`=4597 WHERE `entry`=4597;
UPDATE `creature_template` SET `equipment_id`=3194 WHERE `entry`=3194;
UPDATE `creature_template` SET `equipment_id`=3197 WHERE `entry`=3197;
UPDATE `creature_template` SET `equipment_id`=5102 WHERE `entry`=5102;
UPDATE `creature_template` SET `equipment_id`=3199 WHERE `entry`=3199;
UPDATE `creature_template` SET `equipment_id`=4368 WHERE `entry`=4368;
UPDATE `creature_template` SET `equipment_id`=3203 WHERE `entry`=3203;
UPDATE `creature_template` SET `equipment_id`=3204 WHERE `entry`=3204;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=3205;
UPDATE `creature_template` SET `equipment_id`=3208 WHERE `entry`=3208;
UPDATE `creature_template` SET `equipment_id`=3211 WHERE `entry`=3211;
UPDATE `creature_template` SET `equipment_id`=3212 WHERE `entry`=3212;
UPDATE `creature_template` SET `equipment_id`=4895 WHERE `entry`=4895;
UPDATE `creature_template` SET `equipment_id`=3214 WHERE `entry`=3214;
UPDATE `creature_template` SET `equipment_id`=3216 WHERE `entry`=3216;
UPDATE `creature_template` SET `equipment_id`=3219 WHERE `entry`=3219;
UPDATE `creature_template` SET `equipment_id`=3941 WHERE `entry`=3941;
UPDATE `creature_template` SET `equipment_id`=3220 WHERE `entry`=3220;
UPDATE `creature_template` SET `equipment_id`=3221 WHERE `entry`=3221;
UPDATE `creature_template` SET `equipment_id`=3945 WHERE `entry`=3945;
UPDATE `creature_template` SET `equipment_id`=3224 WHERE `entry`=3224;
UPDATE `creature_template` SET `equipment_id`=3230 WHERE `entry`=3230;
UPDATE `creature_template` SET `equipment_id`=3232 WHERE `entry`=3232;
UPDATE `creature_template` SET `equipment_id`=3841 WHERE `entry`=3841;
UPDATE `creature_template` SET `equipment_id`=3845 WHERE `entry`=3845;
UPDATE `creature_template` SET `equipment_id`=3849 WHERE `entry`=3849;
UPDATE `creature_template` SET `equipment_id`=3258 WHERE `entry`=3258;
UPDATE `creature_template` SET `equipment_id`=3260 WHERE `entry`=3260;
UPDATE `creature_template` SET `equipment_id`=3266 WHERE `entry`=3266;
UPDATE `creature_template` SET `equipment_id`=4641 WHERE `entry`=4641;
UPDATE `creature_template` SET `equipment_id`=3267 WHERE `entry`=3267;
UPDATE `creature_template` SET `equipment_id`=3925 WHERE `entry`=3925;
UPDATE `creature_template` SET `equipment_id`=3268 WHERE `entry`=3268;
UPDATE `creature_template` SET `equipment_id`=3269 WHERE `entry`=3269;
UPDATE `creature_template` SET `equipment_id`=3933 WHERE `entry`=3933;
UPDATE `creature_template` SET `equipment_id`=4959 WHERE `entry`=4959;
UPDATE `creature_template` SET `equipment_id`=3283 WHERE `entry`=3283;
UPDATE `creature_template` SET `equipment_id`=3284 WHERE `entry`=3284;
UPDATE `creature_template` SET `equipment_id`=4442 WHERE `entry`=4442;
UPDATE `creature_template` SET `equipment_id`=3285 WHERE `entry`=3285;
UPDATE `creature_template` SET `equipment_id`=5675 WHERE `entry`=5675;
UPDATE `creature_template` SET `equipment_id`=3292 WHERE `entry`=3292;
UPDATE `creature_template` SET `equipment_id`=3293 WHERE `entry`=3293;
UPDATE `creature_template` SET `equipment_id`=3294 WHERE `entry`=3294;
UPDATE `creature_template` SET `equipment_id`=3296 WHERE `entry`=3296;
UPDATE `creature_template` SET `equipment_id`=3301 WHERE `entry`=3301;
UPDATE `creature_template` SET `equipment_id`=3304 WHERE `entry`=3304;
UPDATE `creature_template` SET `equipment_id`=3309 WHERE `entry`=3309;
UPDATE `creature_template` SET `equipment_id`=3310 WHERE `entry`=3310;
UPDATE `creature_template` SET `equipment_id`=3312 WHERE `entry`=3312;
UPDATE `creature_template` SET `equipment_id`=3314 WHERE `entry`=3314;
UPDATE `creature_template` SET `equipment_id`=3315 WHERE `entry`=3315;
UPDATE `creature_template` SET `equipment_id`=3318 WHERE `entry`=3318;
UPDATE `creature_template` SET `equipment_id`=3320 WHERE `entry`=3320;
UPDATE `creature_template` SET `equipment_id`=3322 WHERE `entry`=3322;
UPDATE `creature_template` SET `equipment_id`=3324 WHERE `entry`=3324;
UPDATE `creature_template` SET `equipment_id`=3325 WHERE `entry`=3325;
UPDATE `creature_template` SET `equipment_id`=3326 WHERE `entry`=3326;
UPDATE `creature_template` SET `equipment_id`=3328 WHERE `entry`=3328;
UPDATE `creature_template` SET `equipment_id`=12467 WHERE `entry`=12467;
UPDATE `creature_template` SET `equipment_id`=3329 WHERE `entry`=3329;
UPDATE `creature_template` SET `equipment_id`=3330 WHERE `entry`=3330;
UPDATE `creature_template` SET `equipment_id`=3333 WHERE `entry`=3333;
UPDATE `creature_template` SET `equipment_id`=3336 WHERE `entry`=3336;
UPDATE `creature_template` SET `equipment_id`=3337 WHERE `entry`=3337;
UPDATE `creature_template` SET `equipment_id`=3338 WHERE `entry`=3338;
UPDATE `creature_template` SET `equipment_id`=3339 WHERE `entry`=3339;
UPDATE `creature_template` SET `equipment_id`=3772 WHERE `entry`=3772;
UPDATE `creature_template` SET `equipment_id`=3341 WHERE `entry`=3341;
UPDATE `creature_template` SET `equipment_id`=3343 WHERE `entry`=3343;
UPDATE `creature_template` SET `equipment_id`=3344 WHERE `entry`=3344;
UPDATE `creature_template` SET `equipment_id`=3712 WHERE `entry`=3712;
UPDATE `creature_template` SET `equipment_id`=3345 WHERE `entry`=3345;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=3346;
UPDATE `creature_template` SET `equipment_id`=3347 WHERE `entry`=3347;
UPDATE `creature_template` SET `equipment_id`=3349 WHERE `entry`=3349;
UPDATE `creature_template` SET `equipment_id`=3352 WHERE `entry`=3352;
UPDATE `creature_template` SET `equipment_id`=3353 WHERE `entry`=3353;
UPDATE `creature_template` SET `equipment_id`=3354 WHERE `entry`=3354;
UPDATE `creature_template` SET `equipment_id`=3357 WHERE `entry`=3357;
UPDATE `creature_template` SET `equipment_id`=3359 WHERE `entry`=3359;
UPDATE `creature_template` SET `equipment_id`=3360 WHERE `entry`=3360;
UPDATE `creature_template` SET `equipment_id`=3664 WHERE `entry`=3664;
UPDATE `creature_template` SET `equipment_id`=3361 WHERE `entry`=3361;
UPDATE `creature_template` SET `equipment_id`=3362 WHERE `entry`=3362;
UPDATE `creature_template` SET `equipment_id`=3672 WHERE `entry`=3672;
UPDATE `creature_template` SET `equipment_id`=3369 WHERE `entry`=3369;
UPDATE `creature_template` SET `equipment_id`=3370 WHERE `entry`=3370;
UPDATE `creature_template` SET `equipment_id`=3375 WHERE `entry`=3375;
UPDATE `creature_template` SET `equipment_id`=4259 WHERE `entry`=4259;
UPDATE `creature_template` SET `equipment_id`=3376 WHERE `entry`=3376;
UPDATE `creature_template` SET `equipment_id`=3377 WHERE `entry`=3377;
UPDATE `creature_template` SET `equipment_id`=3386 WHERE `entry`=3386;
UPDATE `creature_template` SET `equipment_id`=3388 WHERE `entry`=3388;
UPDATE `creature_template` SET `equipment_id`=4782 WHERE `entry`=4782;
UPDATE `creature_template` SET `equipment_id`=3391 WHERE `entry`=3391;
UPDATE `creature_template` SET `equipment_id`=3392 WHERE `entry`=3392;
UPDATE `creature_template` SET `equipment_id`=3393 WHERE `entry`=3393;
UPDATE `creature_template` SET `equipment_id`=3396 WHERE `entry`=3396;
UPDATE `creature_template` SET `equipment_id`=3397 WHERE `entry`=3397;
UPDATE `creature_template` SET `equipment_id`=3399 WHERE `entry`=3399;
UPDATE `creature_template` SET `equipment_id`=3401 WHERE `entry`=3401;
UPDATE `creature_template` SET `equipment_id`=3402 WHERE `entry`=3402;
UPDATE `creature_template` SET `equipment_id`=3836 WHERE `entry`=3836;
UPDATE `creature_template` SET `equipment_id`=3405 WHERE `entry`=3405;
UPDATE `creature_template` SET `equipment_id`=3406 WHERE `entry`=3406;
UPDATE `creature_template` SET `equipment_id`=3407 WHERE `entry`=3407;
UPDATE `creature_template` SET `equipment_id`=4291 WHERE `entry`=4291;
UPDATE `creature_template` SET `equipment_id`=3408 WHERE `entry`=3408;
UPDATE `creature_template` SET `equipment_id`=3413 WHERE `entry`=3413;
UPDATE `creature_template` SET `equipment_id`=3421 WHERE `entry`=3421;
UPDATE `creature_template` SET `equipment_id`=3728 WHERE `entry`=3728;
UPDATE `creature_template` SET `equipment_id`=3428 WHERE `entry`=3428;
UPDATE `creature_template` SET `equipment_id`=3732 WHERE `entry`=3732;
UPDATE `creature_template` SET `equipment_id`=3429 WHERE `entry`=3429;
UPDATE `creature_template` SET `equipment_id`=3431 WHERE `entry`=3431;
UPDATE `creature_template` SET `equipment_id`=3432 WHERE `entry`=3432;
UPDATE `creature_template` SET `equipment_id`=3736 WHERE `entry`=3736;
UPDATE `creature_template` SET `equipment_id`=3433 WHERE `entry`=3433;
UPDATE `creature_template` SET `equipment_id`=3434 WHERE `entry`=3434;
UPDATE `creature_template` SET `equipment_id`=3808 WHERE `entry`=3808;
UPDATE `creature_template` SET `equipment_id`=3441 WHERE `entry`=3441;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=3444;
UPDATE `creature_template` SET `equipment_id`=3445 WHERE `entry`=3445;
UPDATE `creature_template` SET `equipment_id`=3446 WHERE `entry`=3446;
UPDATE `creature_template` SET `equipment_id`=3449 WHERE `entry`=3449;
UPDATE `creature_template` SET `equipment_id`=3453 WHERE `entry`=3453;
UPDATE `creature_template` SET `equipment_id`=3454 WHERE `entry`=3454;
UPDATE `creature_template` SET `equipment_id`=4846 WHERE `entry`=4846;
UPDATE `creature_template` SET `equipment_id`=3455 WHERE `entry`=3455;
UPDATE `creature_template` SET `equipment_id`=3601 WHERE `entry`=3601;
UPDATE `creature_template` SET `equipment_id`=3456 WHERE `entry`=3456;
UPDATE `creature_template` SET `equipment_id`=4112 WHERE `entry`=4112;
UPDATE `creature_template` SET `equipment_id`=3459 WHERE `entry`=3459;
UPDATE `creature_template` SET `equipment_id`=3609 WHERE `entry`=3609;
UPDATE `creature_template` SET `equipment_id`=3464 WHERE `entry`=3464;
UPDATE `creature_template` SET `equipment_id`=3467 WHERE `entry`=3467;
UPDATE `creature_template` SET `equipment_id`=3468 WHERE `entry`=3468;
UPDATE `creature_template` SET `equipment_id`=4639 WHERE `entry`=4639;
UPDATE `creature_template` SET `equipment_id`=3470 WHERE `entry`=3470;
UPDATE `creature_template` SET `equipment_id`=3471 WHERE `entry`=3471;
UPDATE `creature_template` SET `equipment_id`=3477 WHERE `entry`=3477;
UPDATE `creature_template` SET `equipment_id`=3479 WHERE `entry`=3479;
UPDATE `creature_template` SET `equipment_id`=3689 WHERE `entry`=3689;
UPDATE `creature_template` SET `equipment_id`=3480 WHERE `entry`=3480;
UPDATE `creature_template` SET `equipment_id`=3483 WHERE `entry`=3483;
UPDATE `creature_template` SET `equipment_id`=3484 WHERE `entry`=3484;
UPDATE `creature_template` SET `equipment_id`=3486 WHERE `entry`=3486;
UPDATE `creature_template` SET `equipment_id`=3488 WHERE `entry`=3488;
UPDATE `creature_template` SET `equipment_id`=3493 WHERE `entry`=3493;
UPDATE `creature_template` SET `equipment_id`=3495 WHERE `entry`=3495;
UPDATE `creature_template` SET `equipment_id`=3496 WHERE `entry`=3496;
UPDATE `creature_template` SET `equipment_id`=3804 WHERE `entry`=3804;
UPDATE `creature_template` SET `equipment_id`=3501 WHERE `entry`=3501;
UPDATE `creature_template` SET `equipment_id`=4624 WHERE `entry`=4624;
UPDATE `creature_template` SET `equipment_id`=3589 WHERE `entry`=3589;
UPDATE `creature_template` SET `equipment_id`=3593 WHERE `entry`=3593;
UPDATE `creature_template` SET `equipment_id`=3597 WHERE `entry`=3597;
UPDATE `creature_template` SET `equipment_id`=3516 WHERE `entry`=3516;
UPDATE `creature_template` SET `equipment_id`=3518 WHERE `entry`=3518;
UPDATE `creature_template` SET `equipment_id`=3665 WHERE `entry`=3665;
UPDATE `creature_template` SET `equipment_id`=4897 WHERE `entry`=4897;
UPDATE `creature_template` SET `equipment_id`=3523 WHERE `entry`=3523;
UPDATE `creature_template` SET `equipment_id`=3673 WHERE `entry`=3673;
UPDATE `creature_template` SET `equipment_id`=3528 WHERE `entry`=3528;
UPDATE `creature_template` SET `equipment_id`=3531 WHERE `entry`=3531;
UPDATE `creature_template` SET `equipment_id`=3534 WHERE `entry`=3534;
UPDATE `creature_template` SET `equipment_id`=5932 WHERE `entry`=5932;
UPDATE `creature_template` SET `equipment_id`=3539 WHERE `entry`=3539;
UPDATE `creature_template` SET `equipment_id`=3749 WHERE `entry`=3749;
UPDATE `creature_template` SET `equipment_id`=3540 WHERE `entry`=3540;
UPDATE `creature_template` SET `equipment_id`=3541 WHERE `entry`=3541;
UPDATE `creature_template` SET `equipment_id`=5931 WHERE `entry`=5931;
UPDATE `creature_template` SET `equipment_id`=3547 WHERE `entry`=3547;
UPDATE `creature_template` SET `equipment_id`=3550 WHERE `entry`=3550;
UPDATE `creature_template` SET `equipment_id`=3551 WHERE `entry`=3551;
UPDATE `creature_template` SET `equipment_id`=3552 WHERE `entry`=3552;
UPDATE `creature_template` SET `equipment_id`=3555 WHERE `entry`=3555;
UPDATE `creature_template` SET `equipment_id`=3556 WHERE `entry`=3556;
UPDATE `creature_template` SET `equipment_id`=3557 WHERE `entry`=3557;
UPDATE `creature_template` SET `equipment_id`=3705 WHERE `entry`=3705;
UPDATE `creature_template` SET `equipment_id`=3649 WHERE `entry`=3649;
UPDATE `creature_template` SET `equipment_id`=3571 WHERE `entry`=3571;
UPDATE `creature_template` SET `equipment_id`=12352 WHERE `entry`=12352;
UPDATE `creature_template` SET `equipment_id`=3572 WHERE `entry`=3572;
UPDATE `creature_template` SET `equipment_id`=4218 WHERE `entry`=4218;
UPDATE `creature_template` SET `equipment_id`=3594 WHERE `entry`=3594;
UPDATE `creature_template` SET `equipment_id`=3599 WHERE `entry`=3599;
UPDATE `creature_template` SET `equipment_id`=4995 WHERE `entry`=4995;
UPDATE `creature_template` SET `equipment_id`=3600 WHERE `entry`=3600;
UPDATE `creature_template` SET `equipment_id`=3610 WHERE `entry`=3610;
UPDATE `creature_template` SET `equipment_id`=4494 WHERE `entry`=4494;
UPDATE `creature_template` SET `equipment_id`=3615 WHERE `entry`=3615;
UPDATE `creature_template` SET `equipment_id`=3657 WHERE `entry`=3657;
UPDATE `creature_template` SET `equipment_id`=3658 WHERE `entry`=3658;
UPDATE `creature_template` SET `equipment_id`=3660 WHERE `entry`=3660;
UPDATE `creature_template` SET `equipment_id`=3661 WHERE `entry`=3661;
UPDATE `creature_template` SET `equipment_id`=3663 WHERE `entry`=3663;
UPDATE `creature_template` SET `equipment_id`=12798 WHERE `entry`=12798;
UPDATE `creature_template` SET `equipment_id`=3669 WHERE `entry`=3669;
UPDATE `creature_template` SET `equipment_id`=5091 WHERE `entry`=5091;
UPDATE `creature_template` SET `equipment_id`=3696 WHERE `entry`=3696;
UPDATE `creature_template` SET `equipment_id`=3704 WHERE `entry`=3704;
UPDATE `creature_template` SET `equipment_id`=5109 WHERE `entry`=5109;
UPDATE `creature_template` SET `equipment_id`=3706 WHERE `entry`=3706;
UPDATE `creature_template` SET `equipment_id`=3707 WHERE `entry`=3707;
UPDATE `creature_template` SET `equipment_id`=4590 WHERE `entry`=4590;
UPDATE `creature_template` SET `equipment_id`=3711 WHERE `entry`=3711;
UPDATE `creature_template` SET `equipment_id`=4880 WHERE `entry`=4880;
UPDATE `creature_template` SET `equipment_id`=3715 WHERE `entry`=3715;
UPDATE `creature_template` SET `equipment_id`=3717 WHERE `entry`=3717;
UPDATE `creature_template` SET `equipment_id`=4890 WHERE `entry`=4890;
UPDATE `creature_template` SET `equipment_id`=3733 WHERE `entry`=3733;
UPDATE `creature_template` SET `equipment_id`=3739 WHERE `entry`=3739;
UPDATE `creature_template` SET `equipment_id`=3740 WHERE `entry`=3740;
UPDATE `creature_template` SET `equipment_id`=3742 WHERE `entry`=3742;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=3763;
UPDATE `creature_template` SET `equipment_id`=4922 WHERE `entry`=4922;
UPDATE `creature_template` SET `equipment_id`=3779 WHERE `entry`=3779;
UPDATE `creature_template` SET `equipment_id`=5163 WHERE `entry`=5163;
UPDATE `creature_template` SET `equipment_id`=4954 WHERE `entry`=4954;
UPDATE `creature_template` SET `equipment_id`=3806 WHERE `entry`=3806;
UPDATE `creature_template` SET `equipment_id`=3840 WHERE `entry`=3840;
UPDATE `creature_template` SET `equipment_id`=3872 WHERE `entry`=3872;
UPDATE `creature_template` SET `equipment_id`=4547 WHERE `entry`=4547;
UPDATE `creature_template` SET `equipment_id`=3873 WHERE `entry`=3873;
UPDATE `creature_template` SET `equipment_id`=3882 WHERE `entry`=3882;
UPDATE `creature_template` SET `equipment_id`=3883 WHERE `entry`=3883;
UPDATE `creature_template` SET `equipment_id`=3887 WHERE `entry`=3887;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=3898;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=3899;
UPDATE `creature_template` SET `equipment_id`=5593 WHERE `entry`=5593;
UPDATE `creature_template` SET `equipment_id`=3936 WHERE `entry`=3936;
UPDATE `creature_template` SET `equipment_id`=3943 WHERE `entry`=3943;
UPDATE `creature_template` SET `equipment_id`=3946 WHERE `entry`=3946;
UPDATE `creature_template` SET `equipment_id`=3951 WHERE `entry`=3951;
UPDATE `creature_template` SET `equipment_id`=3959 WHERE `entry`=3959;
UPDATE `creature_template` SET `equipment_id`=4853 WHERE `entry`=4853;
UPDATE `creature_template` SET `equipment_id`=3963 WHERE `entry`=3963;
UPDATE `creature_template` SET `equipment_id`=3965 WHERE `entry`=3965;
UPDATE `creature_template` SET `equipment_id`=4334 WHERE `entry`=4334;
UPDATE `creature_template` SET `equipment_id`=3974 WHERE `entry`=3974;
UPDATE `creature_template` SET `equipment_id`=3978 WHERE `entry`=3978;
UPDATE `creature_template` SET `equipment_id`=3979 WHERE `entry`=3979;
UPDATE `creature_template` SET `equipment_id`=3982 WHERE `entry`=3982;
UPDATE `creature_template` SET `equipment_id`=3986 WHERE `entry`=3986;
UPDATE `creature_template` SET `equipment_id`=3987 WHERE `entry`=3987;
UPDATE `creature_template` SET `equipment_id`=4634 WHERE `entry`=4634;
UPDATE `creature_template` SET `equipment_id`=3989 WHERE `entry`=3989;
UPDATE `creature_template` SET `equipment_id`=3991 WHERE `entry`=3991;
UPDATE `creature_template` SET `equipment_id`=3998 WHERE `entry`=3998;
UPDATE `creature_template` SET `equipment_id`=4159 WHERE `entry`=4159;
UPDATE `creature_template` SET `equipment_id`=4666 WHERE `entry`=4666;
UPDATE `creature_template` SET `equipment_id`=4046 WHERE `entry`=4046;
UPDATE `creature_template` SET `equipment_id`=4051 WHERE `entry`=4051;
UPDATE `creature_template` SET `equipment_id`=4053 WHERE `entry`=4053;
UPDATE `creature_template` SET `equipment_id`=4062 WHERE `entry`=4062;
UPDATE `creature_template` SET `equipment_id`=4720 WHERE `entry`=4720;
UPDATE `creature_template` SET `equipment_id`=4223 WHERE `entry`=4223;
UPDATE `creature_template` SET `equipment_id`=4078 WHERE `entry`=4078;
UPDATE `creature_template` SET `equipment_id`=4083 WHERE `entry`=4083;
UPDATE `creature_template` SET `equipment_id`=12864 WHERE `entry`=12864;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=4730;
UPDATE `creature_template` SET `equipment_id`=4085 WHERE `entry`=4085;
UPDATE `creature_template` SET `equipment_id`=4086 WHERE `entry`=4086;
UPDATE `creature_template` SET `equipment_id`=4094 WHERE `entry`=4094;
UPDATE `creature_template` SET `equipment_id`=4096 WHERE `entry`=4096;
UPDATE `creature_template` SET `equipment_id`=11699 WHERE `entry`=11699;
UPDATE `creature_template` SET `equipment_id`=4097 WHERE `entry`=4097;
UPDATE `creature_template` SET `equipment_id`=4099 WHERE `entry`=4099;
UPDATE `creature_template` SET `equipment_id`=5044 WHERE `entry`=5044;
UPDATE `creature_template` SET `equipment_id`=5052 WHERE `entry`=5052;
UPDATE `creature_template` SET `equipment_id`=4111 WHERE `entry`=4111;
UPDATE `creature_template` SET `equipment_id`=4113 WHERE `entry`=4113;
UPDATE `creature_template` SET `equipment_id`=4114 WHERE `entry`=4114;
UPDATE `creature_template` SET `equipment_id`=5511 WHERE `entry`=5511;
UPDATE `creature_template` SET `equipment_id`=4116 WHERE `entry`=4116;
UPDATE `creature_template` SET `equipment_id`=5505 WHERE `entry`=5505;
UPDATE `creature_template` SET `equipment_id`=5519 WHERE `entry`=5519;
UPDATE `creature_template` SET `equipment_id`=5513 WHERE `entry`=5513;
UPDATE `creature_template` SET `equipment_id`=7884 WHERE `entry`=7884;
UPDATE `creature_template` SET `equipment_id`=4948 WHERE `entry`=4948;
UPDATE `creature_template` SET `equipment_id`=4138 WHERE `entry`=4138;
UPDATE `creature_template` SET `equipment_id`=4146 WHERE `entry`=4146;
UPDATE `creature_template` SET `equipment_id`=5840 WHERE `entry`=5840;
UPDATE `creature_template` SET `equipment_id`=4156 WHERE `entry`=4156;
UPDATE `creature_template` SET `equipment_id`=5848 WHERE `entry`=5848;
UPDATE `creature_template` SET `equipment_id`=4160 WHERE `entry`=4160;
UPDATE `creature_template` SET `equipment_id`=4161 WHERE `entry`=4161;
UPDATE `creature_template` SET `equipment_id`=4163 WHERE `entry`=4163;
UPDATE `creature_template` SET `equipment_id`=6130 WHERE `entry`=6130;
UPDATE `creature_template` SET `equipment_id`=5623 WHERE `entry`=5623;
UPDATE `creature_template` SET `equipment_id`=4165 WHERE `entry`=4165;
UPDATE `creature_template` SET `equipment_id`=5617 WHERE `entry`=5617;
UPDATE `creature_template` SET `equipment_id`=5112 WHERE `entry`=5112;
UPDATE `creature_template` SET `equipment_id`=4169 WHERE `entry`=4169;
UPDATE `creature_template` SET `equipment_id`=4171 WHERE `entry`=4171;
UPDATE `creature_template` SET `equipment_id`=6138 WHERE `entry`=6138;
UPDATE `creature_template` SET `equipment_id`=5116 WHERE `entry`=5116;
UPDATE `creature_template` SET `equipment_id`=4173 WHERE `entry`=4173;
UPDATE `creature_template` SET `equipment_id`=4175 WHERE `entry`=4175;
UPDATE `creature_template` SET `equipment_id`=5414 WHERE `entry`=5414;
UPDATE `creature_template` SET `equipment_id`=4180 WHERE `entry`=4180;
UPDATE `creature_template` SET `equipment_id`=5569 WHERE `entry`=5569;
UPDATE `creature_template` SET `equipment_id`=7975 WHERE `entry`=7975;
UPDATE `creature_template` SET `equipment_id`=5412 WHERE `entry`=5412;
UPDATE `creature_template` SET `equipment_id`=4183 WHERE `entry`=4183;
UPDATE `creature_template` SET `equipment_id`=6090 WHERE `entry`=6090;
UPDATE `creature_template` SET `equipment_id`=4188 WHERE `entry`=4188;
UPDATE `creature_template` SET `equipment_id`=4190 WHERE `entry`=4190;
UPDATE `creature_template` SET `equipment_id`=4193 WHERE `entry`=4193;
UPDATE `creature_template` SET `equipment_id`=4197 WHERE `entry`=4197;
UPDATE `creature_template` SET `equipment_id`=4198 WHERE `entry`=4198;
UPDATE `creature_template` SET `equipment_id`=4200 WHERE `entry`=4200;
UPDATE `creature_template` SET `equipment_id`=4201 WHERE `entry`=4201;
UPDATE `creature_template` SET `equipment_id`=4202 WHERE `entry`=4202;
UPDATE `creature_template` SET `equipment_id`=4203 WHERE `entry`=4203;
UPDATE `creature_template` SET `equipment_id`=4204 WHERE `entry`=4204;
UPDATE `creature_template` SET `equipment_id`=4205 WHERE `entry`=4205;
UPDATE `creature_template` SET `equipment_id`=5088 WHERE `entry`=5088;
UPDATE `creature_template` SET `equipment_id`=4210 WHERE `entry`=4210;
UPDATE `creature_template` SET `equipment_id`=6114 WHERE `entry`=6114;
UPDATE `creature_template` SET `equipment_id`=5607 WHERE `entry`=5607;
UPDATE `creature_template` SET `equipment_id`=5092 WHERE `entry`=5092;
UPDATE `creature_template` SET `equipment_id`=5601 WHERE `entry`=5601;
UPDATE `creature_template` SET `equipment_id`=4214 WHERE `entry`=4214;
UPDATE `creature_template` SET `equipment_id`=4215 WHERE `entry`=4215;
UPDATE `creature_template` SET `equipment_id`=4216 WHERE `entry`=4216;
UPDATE `creature_template` SET `equipment_id`=4219 WHERE `entry`=4219;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=6122;
UPDATE `creature_template` SET `equipment_id`=5615 WHERE `entry`=5615;
UPDATE `creature_template` SET `equipment_id`=4220 WHERE `entry`=4220;
UPDATE `creature_template` SET `equipment_id`=5100 WHERE `entry`=5100;
UPDATE `creature_template` SET `equipment_id`=4221 WHERE `entry`=4221;
UPDATE `creature_template` SET `equipment_id`=5609 WHERE `entry`=5609;
UPDATE `creature_template` SET `equipment_id`=4222 WHERE `entry`=4222;
UPDATE `creature_template` SET `equipment_id`=4225 WHERE `entry`=4225;
UPDATE `creature_template` SET `equipment_id`=4226 WHERE `entry`=4226;
UPDATE `creature_template` SET `equipment_id`=5907 WHERE `entry`=5907;
UPDATE `creature_template` SET `equipment_id`=4885 WHERE `entry`=4885;
UPDATE `creature_template` SET `equipment_id`=4228 WHERE `entry`=4228;
UPDATE `creature_template` SET `equipment_id`=4229 WHERE `entry`=4229;
UPDATE `creature_template` SET `equipment_id`=4230 WHERE `entry`=4230;
UPDATE `creature_template` SET `equipment_id`=5396 WHERE `entry`=5396;
UPDATE `creature_template` SET `equipment_id`=4231 WHERE `entry`=4231;
UPDATE `creature_template` SET `equipment_id`=4889 WHERE `entry`=4889;
UPDATE `creature_template` SET `equipment_id`=4232 WHERE `entry`=4232;
UPDATE `creature_template` SET `equipment_id`=4233 WHERE `entry`=4233;
UPDATE `creature_template` SET `equipment_id`=4234 WHERE `entry`=4234;
UPDATE `creature_template` SET `equipment_id`=5915 WHERE `entry`=5915;
UPDATE `creature_template` SET `equipment_id`=4235 WHERE `entry`=4235;
UPDATE `creature_template` SET `equipment_id`=4893 WHERE `entry`=4893;
UPDATE `creature_template` SET `equipment_id`=4236 WHERE `entry`=4236;
UPDATE `creature_template` SET `equipment_id`=4240 WHERE `entry`=4240;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=4242;
UPDATE `creature_template` SET `equipment_id`=4965 WHERE `entry`=4965;
UPDATE `creature_template` SET `equipment_id`=4973 WHERE `entry`=4973;
UPDATE `creature_template` SET `equipment_id`=4254 WHERE `entry`=4254;
UPDATE `creature_template` SET `equipment_id`=5484 WHERE `entry`=5484;
UPDATE `creature_template` SET `equipment_id`=4255 WHERE `entry`=4255;
UPDATE `creature_template` SET `equipment_id`=4256 WHERE `entry`=4256;
UPDATE `creature_template` SET `equipment_id`=4257 WHERE `entry`=4257;
UPDATE `creature_template` SET `equipment_id`=4258 WHERE `entry`=4258;
UPDATE `creature_template` SET `equipment_id`=5939 WHERE `entry`=5939;
UPDATE `creature_template` SET `equipment_id`=5591 WHERE `entry`=5591;
UPDATE `creature_template` SET `equipment_id`=4262 WHERE `entry`=4262;
UPDATE `creature_template` SET `equipment_id`=8150 WHERE `entry`=8150;
UPDATE `creature_template` SET `equipment_id`=4921 WHERE `entry`=4921;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=4265;
UPDATE `creature_template` SET `equipment_id`=4266 WHERE `entry`=4266;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=4267;
UPDATE `creature_template` SET `equipment_id`=4275 WHERE `entry`=4275;
UPDATE `creature_template` SET `equipment_id`=11520 WHERE `entry`=11520;
UPDATE `creature_template` SET `equipment_id`=4276 WHERE `entry`=4276;
UPDATE `creature_template` SET `equipment_id`=4278 WHERE `entry`=4278;
UPDATE `creature_template` SET `equipment_id`=7943 WHERE `entry`=7943;
UPDATE `creature_template` SET `equipment_id`=4280 WHERE `entry`=4280;
UPDATE `creature_template` SET `equipment_id`=5390 WHERE `entry`=5390;
UPDATE `creature_template` SET `equipment_id`=4281 WHERE `entry`=4281;
UPDATE `creature_template` SET `equipment_id`=4282 WHERE `entry`=4282;
UPDATE `creature_template` SET `equipment_id`=5899 WHERE `entry`=5899;
UPDATE `creature_template` SET `equipment_id`=4283 WHERE `entry`=4283;
UPDATE `creature_template` SET `equipment_id`=4877 WHERE `entry`=4877;
UPDATE `creature_template` SET `equipment_id`=4284 WHERE `entry`=4284;
UPDATE `creature_template` SET `equipment_id`=4285 WHERE `entry`=4285;
UPDATE `creature_template` SET `equipment_id`=4286 WHERE `entry`=4286;
UPDATE `creature_template` SET `equipment_id`=12047 WHERE `entry`=12047;
UPDATE `creature_template` SET `equipment_id`=5388 WHERE `entry`=5388;
UPDATE `creature_template` SET `equipment_id`=4287 WHERE `entry`=4287;
UPDATE `creature_template` SET `equipment_id`=4288 WHERE `entry`=4288;
UPDATE `creature_template` SET `equipment_id`=5670 WHERE `entry`=5670;
UPDATE `creature_template` SET `equipment_id`=4289 WHERE `entry`=4289;
UPDATE `creature_template` SET `equipment_id`=4290 WHERE `entry`=4290;
UPDATE `creature_template` SET `equipment_id`=4949 WHERE `entry`=4949;
UPDATE `creature_template` SET `equipment_id`=4292 WHERE `entry`=4292;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=4293;
UPDATE `creature_template` SET `equipment_id`=4294 WHERE `entry`=4294;
UPDATE `creature_template` SET `equipment_id`=4295 WHERE `entry`=4295;
UPDATE `creature_template` SET `equipment_id`=5669 WHERE `entry`=5669;
UPDATE `creature_template` SET `equipment_id`=4296 WHERE `entry`=4296;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=5470;
UPDATE `creature_template` SET `equipment_id`=4297 WHERE `entry`=4297;
UPDATE `creature_template` SET `equipment_id`=4298 WHERE `entry`=4298;
UPDATE `creature_template` SET `equipment_id`=5979 WHERE `entry`=5979;
UPDATE `creature_template` SET `equipment_id`=4299 WHERE `entry`=4299;
UPDATE `creature_template` SET `equipment_id`=4300 WHERE `entry`=4300;
UPDATE `creature_template` SET `equipment_id`=7714 WHERE `entry`=7714;
UPDATE `creature_template` SET `equipment_id`=4301 WHERE `entry`=4301;
UPDATE `creature_template` SET `equipment_id`=7506 WHERE `entry`=7506;
UPDATE `creature_template` SET `equipment_id`=4303 WHERE `entry`=4303;
UPDATE `creature_template` SET `equipment_id`=5686 WHERE `entry`=5686;
UPDATE `creature_template` SET `equipment_id`=4305 WHERE `entry`=4305;
UPDATE `creature_template` SET `equipment_id`=4307 WHERE `entry`=4307;
UPDATE `creature_template` SET `equipment_id`=4310 WHERE `entry`=4310;
UPDATE `creature_template` SET `equipment_id`=4311 WHERE `entry`=4311;
UPDATE `creature_template` SET `equipment_id`=4312 WHERE `entry`=4312;
UPDATE `creature_template` SET `equipment_id`=5694 WHERE `entry`=5694;
UPDATE `creature_template` SET `equipment_id`=4314 WHERE `entry`=4314;
UPDATE `creature_template` SET `equipment_id`=7730 WHERE `entry`=7730;
UPDATE `creature_template` SET `equipment_id`=4317 WHERE `entry`=4317;
UPDATE `creature_template` SET `equipment_id`=6707 WHERE `entry`=6707;
UPDATE `creature_template` SET `equipment_id`=4319 WHERE `entry`=4319;
UPDATE `creature_template` SET `equipment_id`=5693 WHERE `entry`=5693;
UPDATE `creature_template` SET `equipment_id`=4320 WHERE `entry`=4320;
UPDATE `creature_template` SET `equipment_id`=5494 WHERE `entry`=5494;
UPDATE `creature_template` SET `equipment_id`=4321 WHERE `entry`=4321;
UPDATE `creature_template` SET `equipment_id`=4981 WHERE `entry`=4981;
UPDATE `creature_template` SET `equipment_id`=4328 WHERE `entry`=4328;
UPDATE `creature_template` SET `equipment_id`=5502 WHERE `entry`=5502;
UPDATE `creature_template` SET `equipment_id`=4329 WHERE `entry`=4329;
UPDATE `creature_template` SET `equipment_id`=4331 WHERE `entry`=4331;
UPDATE `creature_template` SET `equipment_id`=11443 WHERE `entry`=11443;
UPDATE `creature_template` SET `equipment_id`=5810 WHERE `entry`=5810;
UPDATE `creature_template` SET `equipment_id`=4359 WHERE `entry`=4359;
UPDATE `creature_template` SET `equipment_id`=4360 WHERE `entry`=4360;
UPDATE `creature_template` SET `equipment_id`=4792 WHERE `entry`=4792;
UPDATE `creature_template` SET `equipment_id`=4361 WHERE `entry`=4361;
UPDATE `creature_template` SET `equipment_id`=4362 WHERE `entry`=4362;
UPDATE `creature_template` SET `equipment_id`=4363 WHERE `entry`=4363;
UPDATE `creature_template` SET `equipment_id`=4364 WHERE `entry`=4364;
UPDATE `creature_template` SET `equipment_id`=4366 WHERE `entry`=4366;
UPDATE `creature_template` SET `equipment_id`=4370 WHERE `entry`=4370;
UPDATE `creature_template` SET `equipment_id`=4371 WHERE `entry`=4371;
UPDATE `creature_template` SET `equipment_id`=5249 WHERE `entry`=5249;
UPDATE `creature_template` SET `equipment_id`=5770 WHERE `entry`=5770;
UPDATE `creature_template` SET `equipment_id`=8140 WHERE `entry`=8140;
UPDATE `creature_template` SET `equipment_id`=5714 WHERE `entry`=5714;
UPDATE `creature_template` SET `equipment_id`=6087 WHERE `entry`=6087;
UPDATE `creature_template` SET `equipment_id`=7114 WHERE `entry`=7114;
UPDATE `creature_template` SET `equipment_id`=8139 WHERE `entry`=8139;
UPDATE `creature_template` SET `equipment_id`=4772 WHERE `entry`=4772;
UPDATE `creature_template` SET `equipment_id`=4407 WHERE `entry`=4407;
UPDATE `creature_template` SET `equipment_id`=8155 WHERE `entry`=8155;
UPDATE `creature_template` SET `equipment_id`=4416 WHERE `entry`=4416;
UPDATE `creature_template` SET `equipment_id`=4848 WHERE `entry`=4848;
UPDATE `creature_template` SET `equipment_id`=4417 WHERE `entry`=4417;
UPDATE `creature_template` SET `equipment_id`=4418 WHERE `entry`=4418;
UPDATE `creature_template` SET `equipment_id`=4419 WHERE `entry`=4419;
UPDATE `creature_template` SET `equipment_id`=4420 WHERE `entry`=4420;
UPDATE `creature_template` SET `equipment_id`=4852 WHERE `entry`=4852;
UPDATE `creature_template` SET `equipment_id`=4421 WHERE `entry`=4421;
UPDATE `creature_template` SET `equipment_id`=5361 WHERE `entry`=5361;
UPDATE `creature_template` SET `equipment_id`=4424 WHERE `entry`=4424;
UPDATE `creature_template` SET `equipment_id`=4856 WHERE `entry`=4856;
UPDATE `creature_template` SET `equipment_id`=4427 WHERE `entry`=4427;
UPDATE `creature_template` SET `equipment_id`=5882 WHERE `entry`=5882;
UPDATE `creature_template` SET `equipment_id`=4428 WHERE `entry`=4428;
UPDATE `creature_template` SET `equipment_id`=4429 WHERE `entry`=4429;
UPDATE `creature_template` SET `equipment_id`=4430 WHERE `entry`=4430;
UPDATE `creature_template` SET `equipment_id`=4435 WHERE `entry`=4435;
UPDATE `creature_template` SET `equipment_id`=5826 WHERE `entry`=5826;
UPDATE `creature_template` SET `equipment_id`=4645 WHERE `entry`=4645;
UPDATE `creature_template` SET `equipment_id`=4436 WHERE `entry`=4436;
UPDATE `creature_template` SET `equipment_id`=4437 WHERE `entry`=4437;
UPDATE `creature_template` SET `equipment_id`=4438 WHERE `entry`=4438;
UPDATE `creature_template` SET `equipment_id`=4649 WHERE `entry`=4649;
UPDATE `creature_template` SET `equipment_id`=4440 WHERE `entry`=4440;
UPDATE `creature_template` SET `equipment_id`=5327 WHERE `entry`=5327;
UPDATE `creature_template` SET `equipment_id`=4653 WHERE `entry`=4653;
UPDATE `creature_template` SET `equipment_id`=4451 WHERE `entry`=4451;
UPDATE `creature_template` SET `equipment_id`=5271 WHERE `entry`=5271;
UPDATE `creature_template` SET `equipment_id`=4452 WHERE `entry`=4452;
UPDATE `creature_template` SET `equipment_id`=4453 WHERE `entry`=4453;
UPDATE `creature_template` SET `equipment_id`=4454 WHERE `entry`=4454;
UPDATE `creature_template` SET `equipment_id`=4455 WHERE `entry`=4455;
UPDATE `creature_template` SET `equipment_id`=4456 WHERE `entry`=4456;
UPDATE `creature_template` SET `equipment_id`=7323 WHERE `entry`=7323;
UPDATE `creature_template` SET `equipment_id`=4457 WHERE `entry`=4457;
UPDATE `creature_template` SET `equipment_id`=4458 WHERE `entry`=4458;
UPDATE `creature_template` SET `equipment_id`=4459 WHERE `entry`=4459;
UPDATE `creature_template` SET `equipment_id`=5786 WHERE `entry`=5786;
UPDATE `creature_template` SET `equipment_id`=4460 WHERE `entry`=4460;
UPDATE `creature_template` SET `equipment_id`=4461 WHERE `entry`=4461;
UPDATE `creature_template` SET `equipment_id`=5273 WHERE `entry`=5273;
UPDATE `creature_template` SET `equipment_id`=4462 WHERE `entry`=4462;
UPDATE `creature_template` SET `equipment_id`=4463 WHERE `entry`=4463;
UPDATE `creature_template` SET `equipment_id`=4464 WHERE `entry`=4464;
UPDATE `creature_template` SET `equipment_id`=4832 WHERE `entry`=4832;
UPDATE `creature_template` SET `equipment_id`=4465 WHERE `entry`=4465;
UPDATE `creature_template` SET `equipment_id`=4466 WHERE `entry`=4466;
UPDATE `creature_template` SET `equipment_id`=4467 WHERE `entry`=4467;
UPDATE `creature_template` SET `equipment_id`=4479 WHERE `entry`=4479;
UPDATE `creature_template` SET `equipment_id`=4480 WHERE `entry`=4480;
UPDATE `creature_template` SET `equipment_id`=5142 WHERE `entry`=5142;
UPDATE `creature_template` SET `equipment_id`=4481 WHERE `entry`=4481;
UPDATE `creature_template` SET `equipment_id`=4629 WHERE `entry`=4629;
UPDATE `creature_template` SET `equipment_id`=4484 WHERE `entry`=4484;
UPDATE `creature_template` SET `equipment_id`=4485 WHERE `entry`=4485;
UPDATE `creature_template` SET `equipment_id`=4486 WHERE `entry`=4486;
UPDATE `creature_template` SET `equipment_id`=4633 WHERE `entry`=4633;
UPDATE `creature_template` SET `equipment_id`=4488 WHERE `entry`=4488;
UPDATE `creature_template` SET `equipment_id`=5150 WHERE `entry`=5150;
UPDATE `creature_template` SET `equipment_id`=4489 WHERE `entry`=4489;
UPDATE `creature_template` SET `equipment_id`=5659 WHERE `entry`=5659;
UPDATE `creature_template` SET `equipment_id`=4493 WHERE `entry`=4493;
UPDATE `creature_template` SET `equipment_id`=5148 WHERE `entry`=5148;
UPDATE `creature_template` SET `equipment_id`=4495 WHERE `entry`=4495;
UPDATE `creature_template` SET `equipment_id`=4705 WHERE `entry`=4705;
UPDATE `creature_template` SET `equipment_id`=4496 WHERE `entry`=4496;
UPDATE `creature_template` SET `equipment_id`=4498 WHERE `entry`=4498;
UPDATE `creature_template` SET `equipment_id`=5731 WHERE `entry`=5731;
UPDATE `creature_template` SET `equipment_id`=4709 WHERE `entry`=4709;
UPDATE `creature_template` SET `equipment_id`=7783 WHERE `entry`=7783;
UPDATE `creature_template` SET `equipment_id`=4713 WHERE `entry`=4713;
UPDATE `creature_template` SET `equipment_id`=4504 WHERE `entry`=4504;
UPDATE `creature_template` SET `equipment_id`=4505 WHERE `entry`=4505;
UPDATE `creature_template` SET `equipment_id`=4506 WHERE `entry`=4506;
UPDATE `creature_template` SET `equipment_id`=4507 WHERE `entry`=4507;
UPDATE `creature_template` SET `equipment_id`=7272 WHERE `entry`=7272;
UPDATE `creature_template` SET `equipment_id`=4657 WHERE `entry`=4657;
UPDATE `creature_template` SET `equipment_id`=5683 WHERE `entry`=5683;
UPDATE `creature_template` SET `equipment_id`=5335 WHERE `entry`=5335;
UPDATE `creature_template` SET `equipment_id`=4516 WHERE `entry`=4516;
UPDATE `creature_template` SET `equipment_id`=4517 WHERE `entry`=4517;
UPDATE `creature_template` SET `equipment_id`=4518 WHERE `entry`=4518;
UPDATE `creature_template` SET `equipment_id`=7735 WHERE `entry`=7735;
UPDATE `creature_template` SET `equipment_id`=5172 WHERE `entry`=5172;
UPDATE `creature_template` SET `equipment_id`=4519 WHERE `entry`=4519;
UPDATE `creature_template` SET `equipment_id`=4665 WHERE `entry`=4665;
UPDATE `creature_template` SET `equipment_id`=4520 WHERE `entry`=4520;
UPDATE `creature_template` SET `equipment_id`=4522 WHERE `entry`=4522;
UPDATE `creature_template` SET `equipment_id`=4523 WHERE `entry`=4523;
UPDATE `creature_template` SET `equipment_id`=4525 WHERE `entry`=4525;
UPDATE `creature_template` SET `equipment_id`=5337 WHERE `entry`=5337;
UPDATE `creature_template` SET `equipment_id`=4609 WHERE `entry`=4609;
UPDATE `creature_template` SET `equipment_id`=4530 WHERE `entry`=4530;
UPDATE `creature_template` SET `equipment_id`=5635 WHERE `entry`=5635;
UPDATE `creature_template` SET `equipment_id`=4531 WHERE `entry`=4531;
UPDATE `creature_template` SET `equipment_id`=4613 WHERE `entry`=4613;
UPDATE `creature_template` SET `equipment_id`=4532 WHERE `entry`=4532;
UPDATE `creature_template` SET `equipment_id`=5124 WHERE `entry`=5124;
UPDATE `creature_template` SET `equipment_id`=5643 WHERE `entry`=5643;
UPDATE `creature_template` SET `equipment_id`=7170 WHERE `entry`=7170;
UPDATE `creature_template` SET `equipment_id`=4542 WHERE `entry`=4542;
UPDATE `creature_template` SET `equipment_id`=11791 WHERE `entry`=11791;
UPDATE `creature_template` SET `equipment_id`=4543 WHERE `entry`=4543;
UPDATE `creature_template` SET `equipment_id`=4544 WHERE `entry`=4544;
UPDATE `creature_template` SET `equipment_id`=4545 WHERE `entry`=4545;
UPDATE `creature_template` SET `equipment_id`=4546 WHERE `entry`=4546;
UPDATE `creature_template` SET `equipment_id`=5715 WHERE `entry`=5715;
UPDATE `creature_template` SET `equipment_id`=4549 WHERE `entry`=4549;
UPDATE `creature_template` SET `equipment_id`=11338 WHERE `entry`=11338;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=4550;
UPDATE `creature_template` SET `equipment_id`=5204 WHERE `entry`=5204;
UPDATE `creature_template` SET `equipment_id`=4551 WHERE `entry`=4551;
UPDATE `creature_template` SET `equipment_id`=4552 WHERE `entry`=4552;
UPDATE `creature_template` SET `equipment_id`=4553 WHERE `entry`=4553;
UPDATE `creature_template` SET `equipment_id`=4554 WHERE `entry`=4554;
UPDATE `creature_template` SET `equipment_id`=4555 WHERE `entry`=4555;
UPDATE `creature_template` SET `equipment_id`=4556 WHERE `entry`=4556;
UPDATE `creature_template` SET `equipment_id`=4557 WHERE `entry`=4557;
UPDATE `creature_template` SET `equipment_id`=4559 WHERE `entry`=4559;
UPDATE `creature_template` SET `equipment_id`=4560 WHERE `entry`=4560;
UPDATE `creature_template` SET `equipment_id`=5942 WHERE `entry`=5942;
UPDATE `creature_template` SET `equipment_id`=4561 WHERE `entry`=4561;
UPDATE `creature_template` SET `equipment_id`=4562 WHERE `entry`=4562;
UPDATE `creature_template` SET `equipment_id`=4563 WHERE `entry`=4563;
UPDATE `creature_template` SET `equipment_id`=4773 WHERE `entry`=4773;
UPDATE `creature_template` SET `equipment_id`=4564 WHERE `entry`=4564;
UPDATE `creature_template` SET `equipment_id`=4566 WHERE `entry`=4566;
UPDATE `creature_template` SET `equipment_id`=7847 WHERE `entry`=7847;
UPDATE `creature_template` SET `equipment_id`=4567 WHERE `entry`=4567;
UPDATE `creature_template` SET `equipment_id`=5941 WHERE `entry`=5941;
UPDATE `creature_template` SET `equipment_id`=4568 WHERE `entry`=4568;
UPDATE `creature_template` SET `equipment_id`=4570 WHERE `entry`=4570;
UPDATE `creature_template` SET `equipment_id`=4571 WHERE `entry`=4571;
UPDATE `creature_template` SET `equipment_id`=4572 WHERE `entry`=4572;
UPDATE `creature_template` SET `equipment_id`=4573 WHERE `entry`=4573;
UPDATE `creature_template` SET `equipment_id`=4574 WHERE `entry`=4574;
UPDATE `creature_template` SET `equipment_id`=4575 WHERE `entry`=4575;
UPDATE `creature_template` SET `equipment_id`=4721 WHERE `entry`=4721;
UPDATE `creature_template` SET `equipment_id`=4576 WHERE `entry`=4576;
UPDATE `creature_template` SET `equipment_id`=5238 WHERE `entry`=5238;
UPDATE `creature_template` SET `equipment_id`=4577 WHERE `entry`=4577;
UPDATE `creature_template` SET `equipment_id`=4578 WHERE `entry`=4578;
UPDATE `creature_template` SET `equipment_id`=5747 WHERE `entry`=5747;
UPDATE `creature_template` SET `equipment_id`=4580 WHERE `entry`=4580;
UPDATE `creature_template` SET `equipment_id`=4581 WHERE `entry`=4581;
UPDATE `creature_template` SET `equipment_id`=4582 WHERE `entry`=4582;
UPDATE `creature_template` SET `equipment_id`=7799 WHERE `entry`=7799;
UPDATE `creature_template` SET `equipment_id`=5236 WHERE `entry`=5236;
UPDATE `creature_template` SET `equipment_id`=4583 WHERE `entry`=4583;
UPDATE `creature_template` SET `equipment_id`=4584 WHERE `entry`=4584;
UPDATE `creature_template` SET `equipment_id`=4585 WHERE `entry`=4585;
UPDATE `creature_template` SET `equipment_id`=4586 WHERE `entry`=4586;
UPDATE `creature_template` SET `equipment_id`=4587 WHERE `entry`=4587;
UPDATE `creature_template` SET `equipment_id`=7288 WHERE `entry`=7288;
UPDATE `creature_template` SET `equipment_id`=4588 WHERE `entry`=4588;
UPDATE `creature_template` SET `equipment_id`=4589 WHERE `entry`=4589;
UPDATE `creature_template` SET `equipment_id`=4591 WHERE `entry`=4591;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=4673;
UPDATE `creature_template` SET `equipment_id`=4592 WHERE `entry`=4592;
UPDATE `creature_template` SET `equipment_id`=5190 WHERE `entry`=5190;
UPDATE `creature_template` SET `equipment_id`=4593 WHERE `entry`=4593;
UPDATE `creature_template` SET `equipment_id`=4594 WHERE `entry`=4594;
UPDATE `creature_template` SET `equipment_id`=5699 WHERE `entry`=5699;
UPDATE `creature_template` SET `equipment_id`=4595 WHERE `entry`=4595;
UPDATE `creature_template` SET `equipment_id`=11328 WHERE `entry`=11328;
UPDATE `creature_template` SET `equipment_id`=4677 WHERE `entry`=4677;
UPDATE `creature_template` SET `equipment_id`=4596 WHERE `entry`=4596;
UPDATE `creature_template` SET `equipment_id`=4598 WHERE `entry`=4598;
UPDATE `creature_template` SET `equipment_id`=5188 WHERE `entry`=5188;
UPDATE `creature_template` SET `equipment_id`=4599 WHERE `entry`=4599;
UPDATE `creature_template` SET `equipment_id`=4600 WHERE `entry`=4600;
UPDATE `creature_template` SET `equipment_id`=4601 WHERE `entry`=4601;
UPDATE `creature_template` SET `equipment_id`=4602 WHERE `entry`=4602;
UPDATE `creature_template` SET `equipment_id`=5707 WHERE `entry`=5707;
UPDATE `creature_template` SET `equipment_id`=4603 WHERE `entry`=4603;
UPDATE `creature_template` SET `equipment_id`=4604 WHERE `entry`=4604;
UPDATE `creature_template` SET `equipment_id`=4605 WHERE `entry`=4605;
UPDATE `creature_template` SET `equipment_id`=4607 WHERE `entry`=4607;
UPDATE `creature_template` SET `equipment_id`=4608 WHERE `entry`=4608;
UPDATE `creature_template` SET `equipment_id`=4610 WHERE `entry`=4610;
UPDATE `creature_template` SET `equipment_id`=8125 WHERE `entry`=8125;
UPDATE `creature_template` SET `equipment_id`=4611 WHERE `entry`=4611;
UPDATE `creature_template` SET `equipment_id`=4612 WHERE `entry`=4612;
UPDATE `creature_template` SET `equipment_id`=4614 WHERE `entry`=4614;
UPDATE `creature_template` SET `equipment_id`=4615 WHERE `entry`=4615;
UPDATE `creature_template` SET `equipment_id`=7606 WHERE `entry`=7606;
UPDATE `creature_template` SET `equipment_id`=4616 WHERE `entry`=4616;
UPDATE `creature_template` SET `equipment_id`=4617 WHERE `entry`=4617;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=4619;
UPDATE `creature_template` SET `equipment_id`=4623 WHERE `entry`=4623;
UPDATE `creature_template` SET `equipment_id`=5506 WHERE `entry`=5506;
UPDATE `creature_template` SET `equipment_id`=4630 WHERE `entry`=4630;
UPDATE `creature_template` SET `equipment_id`=4631 WHERE `entry`=4631;
UPDATE `creature_template` SET `equipment_id`=4632 WHERE `entry`=4632;
UPDATE `creature_template` SET `equipment_id`=5514 WHERE `entry`=5514;
UPDATE `creature_template` SET `equipment_id`=4636 WHERE `entry`=4636;
UPDATE `creature_template` SET `equipment_id`=6031 WHERE `entry`=6031;
UPDATE `creature_template` SET `equipment_id`=4637 WHERE `entry`=4637;
UPDATE `creature_template` SET `equipment_id`=4638 WHERE `entry`=4638;
UPDATE `creature_template` SET `equipment_id`=4640 WHERE `entry`=4640;
UPDATE `creature_template` SET `equipment_id`=4642 WHERE `entry`=4642;
UPDATE `creature_template` SET `equipment_id`=4643 WHERE `entry`=4643;
UPDATE `creature_template` SET `equipment_id`=4644 WHERE `entry`=4644;
UPDATE `creature_template` SET `equipment_id`=5975 WHERE `entry`=5975;
UPDATE `creature_template` SET `equipment_id`=4646 WHERE `entry`=4646;
UPDATE `creature_template` SET `equipment_id`=4647 WHERE `entry`=4647;
UPDATE `creature_template` SET `equipment_id`=4648 WHERE `entry`=4648;
UPDATE `creature_template` SET `equipment_id`=5320 WHERE `entry`=5320;
UPDATE `creature_template` SET `equipment_id`=4654 WHERE `entry`=4654;
UPDATE `creature_template` SET `equipment_id`=5977 WHERE `entry`=5977;
UPDATE `creature_template` SET `equipment_id`=4655 WHERE `entry`=4655;
UPDATE `creature_template` SET `equipment_id`=4658 WHERE `entry`=4658;
UPDATE `creature_template` SET `equipment_id`=4659 WHERE `entry`=4659;
UPDATE `creature_template` SET `equipment_id`=4663 WHERE `entry`=4663;
UPDATE `creature_template` SET `equipment_id`=4664 WHERE `entry`=4664;
UPDATE `creature_template` SET `equipment_id`=5546 WHERE `entry`=5546;
UPDATE `creature_template` SET `equipment_id`=4667 WHERE `entry`=4667;
UPDATE `creature_template` SET `equipment_id`=4668 WHERE `entry`=4668;
UPDATE `creature_template` SET `equipment_id`=5336 WHERE `entry`=5336;
UPDATE `creature_template` SET `equipment_id`=4674 WHERE `entry`=4674;
UPDATE `creature_template` SET `equipment_id`=5618 WHERE `entry`=5618;
UPDATE `creature_template` SET `equipment_id`=6129 WHERE `entry`=6129;
UPDATE `creature_template` SET `equipment_id`=7670 WHERE `entry`=7670;
UPDATE `creature_template` SET `equipment_id`=4680 WHERE `entry`=4680;
UPDATE `creature_template` SET `equipment_id`=6143 WHERE `entry`=6143;
UPDATE `creature_template` SET `equipment_id`=4686 WHERE `entry`=4686;
UPDATE `creature_template` SET `equipment_id`=4687 WHERE `entry`=4687;
UPDATE `creature_template` SET `equipment_id`=5411 WHERE `entry`=5411;
UPDATE `creature_template` SET `equipment_id`=8141 WHERE `entry`=8141;
UPDATE `creature_template` SET `equipment_id`=7463 WHERE `entry`=7463;
UPDATE `creature_template` SET `equipment_id`=7976 WHERE `entry`=7976;
UPDATE `creature_template` SET `equipment_id`=6089 WHERE `entry`=6089;
UPDATE `creature_template` SET `equipment_id`=4706 WHERE `entry`=4706;
UPDATE `creature_template` SET `equipment_id`=4708 WHERE `entry`=4708;
UPDATE `creature_template` SET `equipment_id`=6033 WHERE `entry`=6033;
UPDATE `creature_template` SET `equipment_id`=4711 WHERE `entry`=4711;
UPDATE `creature_template` SET `equipment_id`=4712 WHERE `entry`=4712;
UPDATE `creature_template` SET `equipment_id`=4714 WHERE `entry`=4714;
UPDATE `creature_template` SET `equipment_id`=4715 WHERE `entry`=4715;
UPDATE `creature_template` SET `equipment_id`=4716 WHERE `entry`=4716;
UPDATE `creature_template` SET `equipment_id`=4718 WHERE `entry`=4718;
UPDATE `creature_template` SET `equipment_id`=4719 WHERE `entry`=4719;
UPDATE `creature_template` SET `equipment_id`=4722 WHERE `entry`=4722;
UPDATE `creature_template` SET `equipment_id`=5602 WHERE `entry`=5602;
UPDATE `creature_template` SET `equipment_id`=4723 WHERE `entry`=4723;
UPDATE `creature_template` SET `equipment_id`=6113 WHERE `entry`=6113;
UPDATE `creature_template` SET `equipment_id`=5610 WHERE `entry`=5610;
UPDATE `creature_template` SET `equipment_id`=4731 WHERE `entry`=4731;
UPDATE `creature_template` SET `equipment_id`=4775 WHERE `entry`=4775;
UPDATE `creature_template` SET `equipment_id`=5940 WHERE `entry`=5940;
UPDATE `creature_template` SET `equipment_id`=5594 WHERE `entry`=5594;
UPDATE `creature_template` SET `equipment_id`=4787 WHERE `entry`=4787;
UPDATE `creature_template` SET `equipment_id`=12032 WHERE `entry`=12032;
UPDATE `creature_template` SET `equipment_id`=4791 WHERE `entry`=4791;
UPDATE `creature_template` SET `equipment_id`=5892 WHERE `entry`=5892;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=5387;
UPDATE `creature_template` SET `equipment_id`=4794 WHERE `entry`=4794;
UPDATE `creature_template` SET `equipment_id`=7944 WHERE `entry`=7944;
UPDATE `creature_template` SET `equipment_id`=5900 WHERE `entry`=5900;
UPDATE `creature_template` SET `equipment_id`=4802 WHERE `entry`=4802;
UPDATE `creature_template` SET `equipment_id`=4805 WHERE `entry`=4805;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=5157;
UPDATE `creature_template` SET `equipment_id`=4807 WHERE `entry`=4807;
UPDATE `creature_template` SET `equipment_id`=4809 WHERE `entry`=4809;
UPDATE `creature_template` SET `equipment_id`=4810 WHERE `entry`=4810;
UPDATE `creature_template` SET `equipment_id`=6184 WHERE `entry`=6184;
UPDATE `creature_template` SET `equipment_id`=4811 WHERE `entry`=4811;
UPDATE `creature_template` SET `equipment_id`=4812 WHERE `entry`=4812;
UPDATE `creature_template` SET `equipment_id`=4813 WHERE `entry`=4813;
UPDATE `creature_template` SET `equipment_id`=6179 WHERE `entry`=6179;
UPDATE `creature_template` SET `equipment_id`=8018 WHERE `entry`=8018;
UPDATE `creature_template` SET `equipment_id`=5165 WHERE `entry`=5165;
UPDATE `creature_template` SET `equipment_id`=6196 WHERE `entry`=6196;
UPDATE `creature_template` SET `equipment_id`=5173 WHERE `entry`=5173;
UPDATE `creature_template` SET `equipment_id`=6195 WHERE `entry`=6195;
UPDATE `creature_template` SET `equipment_id`=4831 WHERE `entry`=4831;
UPDATE `creature_template` SET `equipment_id`=5491 WHERE `entry`=5491;
UPDATE `creature_template` SET `equipment_id`=4834 WHERE `entry`=4834;
UPDATE `creature_template` SET `equipment_id`=6014 WHERE `entry`=6014;
UPDATE `creature_template` SET `equipment_id`=5499 WHERE `entry`=5499;
UPDATE `creature_template` SET `equipment_id`=4842 WHERE `entry`=4842;
UPDATE `creature_template` SET `equipment_id`=4844 WHERE `entry`=4844;
UPDATE `creature_template` SET `equipment_id`=4845 WHERE `entry`=4845;
UPDATE `creature_template` SET `equipment_id`=4847 WHERE `entry`=4847;
UPDATE `creature_template` SET `equipment_id`=4849 WHERE `entry`=4849;
UPDATE `creature_template` SET `equipment_id`=5958 WHERE `entry`=5958;
UPDATE `creature_template` SET `equipment_id`=4850 WHERE `entry`=4850;
UPDATE `creature_template` SET `equipment_id`=4851 WHERE `entry`=4851;
UPDATE `creature_template` SET `equipment_id`=12096 WHERE `entry`=12096;
UPDATE `creature_template` SET `equipment_id`=7867 WHERE `entry`=7867;
UPDATE `creature_template` SET `equipment_id`=4875 WHERE `entry`=4875;
UPDATE `creature_template` SET `equipment_id`=4876 WHERE `entry`=4876;
UPDATE `creature_template` SET `equipment_id`=4878 WHERE `entry`=4878;
UPDATE `creature_template` SET `equipment_id`=5817 WHERE `entry`=5817;
UPDATE `creature_template` SET `equipment_id`=4879 WHERE `entry`=4879;
UPDATE `creature_template` SET `equipment_id`=11454 WHERE `entry`=11454;
UPDATE `creature_template` SET `equipment_id`=4884 WHERE `entry`=4884;
UPDATE `creature_template` SET `equipment_id`=5767 WHERE `entry`=5767;
UPDATE `creature_template` SET `equipment_id`=4886 WHERE `entry`=4886;
UPDATE `creature_template` SET `equipment_id`=4888 WHERE `entry`=4888;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=5258;
UPDATE `creature_template` SET `equipment_id`=4891 WHERE `entry`=4891;
UPDATE `creature_template` SET `equipment_id`=4892 WHERE `entry`=4892;
UPDATE `creature_template` SET `equipment_id`=4894 WHERE `entry`=4894;
UPDATE `creature_template` SET `equipment_id`=5769 WHERE `entry`=5769;
UPDATE `creature_template` SET `equipment_id`=4896 WHERE `entry`=4896;
UPDATE `creature_template` SET `equipment_id`=4898 WHERE `entry`=4898;
UPDATE `creature_template` SET `equipment_id`=7773 WHERE `entry`=7773;
UPDATE `creature_template` SET `equipment_id`=4899 WHERE `entry`=4899;
UPDATE `creature_template` SET `equipment_id`=4900 WHERE `entry`=4900;
UPDATE `creature_template` SET `equipment_id`=5713 WHERE `entry`=5713;
UPDATE `creature_template` SET `equipment_id`=4923 WHERE `entry`=4923;
UPDATE `creature_template` SET `equipment_id`=5592 WHERE `entry`=5592;
UPDATE `creature_template` SET `equipment_id`=4926 WHERE `entry`=4926;
UPDATE `creature_template` SET `equipment_id`=4941 WHERE `entry`=4941;
UPDATE `creature_template` SET `equipment_id`=4943 WHERE `entry`=4943;
UPDATE `creature_template` SET `equipment_id`=11518 WHERE `entry`=11518;
UPDATE `creature_template` SET `equipment_id`=5155 WHERE `entry`=5155;
UPDATE `creature_template` SET `equipment_id`=7885 WHERE `entry`=7885;
UPDATE `creature_template` SET `equipment_id`=4947 WHERE `entry`=4947;
UPDATE `creature_template` SET `equipment_id`=4951 WHERE `entry`=4951;
UPDATE `creature_template` SET `equipment_id`=5668 WHERE `entry`=5668;
UPDATE `creature_template` SET `equipment_id`=7883 WHERE `entry`=7883;
UPDATE `creature_template` SET `equipment_id`=4960 WHERE `entry`=4960;
UPDATE `creature_template` SET `equipment_id`=4962 WHERE `entry`=4962;
UPDATE `creature_template` SET `equipment_id`=4963 WHERE `entry`=4963;
UPDATE `creature_template` SET `equipment_id`=4964 WHERE `entry`=4964;
UPDATE `creature_template` SET `equipment_id`=5783 WHERE `entry`=5783;
UPDATE `creature_template` SET `equipment_id`=4966 WHERE `entry`=4966;
UPDATE `creature_template` SET `equipment_id`=4967 WHERE `entry`=4967;
UPDATE `creature_template` SET `equipment_id`=7318 WHERE `entry`=7318;
UPDATE `creature_template` SET `equipment_id`=4968 WHERE `entry`=4968;
UPDATE `creature_template` SET `equipment_id`=4971 WHERE `entry`=4971;
UPDATE `creature_template` SET `equipment_id`=4972 WHERE `entry`=4972;
UPDATE `creature_template` SET `equipment_id`=4974 WHERE `entry`=4974;
UPDATE `creature_template` SET `equipment_id`=4979 WHERE `entry`=4979;
UPDATE `creature_template` SET `equipment_id`=4980 WHERE `entry`=4980;
UPDATE `creature_template` SET `equipment_id`=4983 WHERE `entry`=4983;
UPDATE `creature_template` SET `equipment_id`=4984 WHERE `entry`=4984;
UPDATE `creature_template` SET `equipment_id`=5123 WHERE `entry`=5123;
UPDATE `creature_template` SET `equipment_id`=5043 WHERE `entry`=5043;
UPDATE `creature_template` SET `equipment_id`=5045 WHERE `entry`=5045;
UPDATE `creature_template` SET `equipment_id`=5046 WHERE `entry`=5046;
UPDATE `creature_template` SET `equipment_id`=7175 WHERE `entry`=7175;
UPDATE `creature_template` SET `equipment_id`=5646 WHERE `entry`=5646;
UPDATE `creature_template` SET `equipment_id`=5054 WHERE `entry`=5054;
UPDATE `creature_template` SET `equipment_id`=11279 WHERE `entry`=11279;
UPDATE `creature_template` SET `equipment_id`=5082 WHERE `entry`=5082;
UPDATE `creature_template` SET `equipment_id`=5083 WHERE `entry`=5083;
UPDATE `creature_template` SET `equipment_id`=5085 WHERE `entry`=5085;
UPDATE `creature_template` SET `equipment_id`=5086 WHERE `entry`=5086;
UPDATE `creature_template` SET `equipment_id`=5087 WHERE `entry`=5087;
UPDATE `creature_template` SET `equipment_id`=5089 WHERE `entry`=5089;
UPDATE `creature_template` SET `equipment_id`=5750 WHERE `entry`=5750;
UPDATE `creature_template` SET `equipment_id`=5093 WHERE `entry`=5093;
UPDATE `creature_template` SET `equipment_id`=5094 WHERE `entry`=5094;
UPDATE `creature_template` SET `equipment_id`=7287 WHERE `entry`=7287;
UPDATE `creature_template` SET `equipment_id`=5748 WHERE `entry`=5748;
UPDATE `creature_template` SET `equipment_id`=5758 WHERE `entry`=5758;
UPDATE `creature_template` SET `equipment_id`=5101 WHERE `entry`=5101;
UPDATE `creature_template` SET `equipment_id`=5103 WHERE `entry`=5103;
UPDATE `creature_template` SET `equipment_id`=5106 WHERE `entry`=5106;
UPDATE `creature_template` SET `equipment_id`=5107 WHERE `entry`=5107;
UPDATE `creature_template` SET `equipment_id`=11840 WHERE `entry`=11840;
UPDATE `creature_template` SET `equipment_id`=5110 WHERE `entry`=5110;
UPDATE `creature_template` SET `equipment_id`=5111 WHERE `entry`=5111;
UPDATE `creature_template` SET `equipment_id`=5700 WHERE `entry`=5700;
UPDATE `creature_template` SET `equipment_id`=5113 WHERE `entry`=5113;
UPDATE `creature_template` SET `equipment_id`=5710 WHERE `entry`=5710;
UPDATE `creature_template` SET `equipment_id`=5114 WHERE `entry`=5114;
UPDATE `creature_template` SET `equipment_id`=5115 WHERE `entry`=5115;
UPDATE `creature_template` SET `equipment_id`=5117 WHERE `entry`=5117;
UPDATE `creature_template` SET `equipment_id`=5118 WHERE `entry`=5118;
UPDATE `creature_template` SET `equipment_id`=5119 WHERE `entry`=5119;
UPDATE `creature_template` SET `equipment_id`=5120 WHERE `entry`=5120;
UPDATE `creature_template` SET `equipment_id`=5121 WHERE `entry`=5121;
UPDATE `creature_template` SET `equipment_id`=5122 WHERE `entry`=5122;
UPDATE `creature_template` SET `equipment_id`=5125 WHERE `entry`=5125;
UPDATE `creature_template` SET `equipment_id`=5126 WHERE `entry`=5126;
UPDATE `creature_template` SET `equipment_id`=5130 WHERE `entry`=5130;
UPDATE `creature_template` SET `equipment_id`=5133 WHERE `entry`=5133;
UPDATE `creature_template` SET `equipment_id`=5134 WHERE `entry`=5134;
UPDATE `creature_template` SET `equipment_id`=5135 WHERE `entry`=5135;
UPDATE `creature_template` SET `equipment_id`=5137 WHERE `entry`=5137;
UPDATE `creature_template` SET `equipment_id`=5138 WHERE `entry`=5138;
UPDATE `creature_template` SET `equipment_id`=5139 WHERE `entry`=5139;
UPDATE `creature_template` SET `equipment_id`=5140 WHERE `entry`=5140;
UPDATE `creature_template` SET `equipment_id`=5141 WHERE `entry`=5141;
UPDATE `creature_template` SET `equipment_id`=5143 WHERE `entry`=5143;
UPDATE `creature_template` SET `equipment_id`=5144 WHERE `entry`=5144;
UPDATE `creature_template` SET `equipment_id`=5145 WHERE `entry`=5145;
UPDATE `creature_template` SET `equipment_id`=5147 WHERE `entry`=5147;
UPDATE `creature_template` SET `equipment_id`=5149 WHERE `entry`=5149;
UPDATE `creature_template` SET `equipment_id`=6028 WHERE `entry`=6028;
UPDATE `creature_template` SET `equipment_id`=5152 WHERE `entry`=5152;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=5154;
UPDATE `creature_template` SET `equipment_id`=5156 WHERE `entry`=5156;
UPDATE `creature_template` SET `equipment_id`=5159 WHERE `entry`=5159;
UPDATE `creature_template` SET `equipment_id`=7873 WHERE `entry`=7873;
UPDATE `creature_template` SET `equipment_id`=5160 WHERE `entry`=5160;
UPDATE `creature_template` SET `equipment_id`=7882 WHERE `entry`=7882;
UPDATE `creature_template` SET `equipment_id`=5161 WHERE `entry`=5161;
UPDATE `creature_template` SET `equipment_id`=5976 WHERE `entry`=5976;
UPDATE `creature_template` SET `equipment_id`=5162 WHERE `entry`=5162;
UPDATE `creature_template` SET `equipment_id`=5166 WHERE `entry`=5166;
UPDATE `creature_template` SET `equipment_id`=5167 WHERE `entry`=5167;
UPDATE `creature_template` SET `equipment_id`=5169 WHERE `entry`=5169;
UPDATE `creature_template` SET `equipment_id`=5170 WHERE `entry`=5170;
UPDATE `creature_template` SET `equipment_id`=5171 WHERE `entry`=5171;
UPDATE `creature_template` SET `equipment_id`=7901 WHERE `entry`=7901;
UPDATE `creature_template` SET `equipment_id`=5174 WHERE `entry`=5174;
UPDATE `creature_template` SET `equipment_id`=5175 WHERE `entry`=5175;
UPDATE `creature_template` SET `equipment_id`=5177 WHERE `entry`=5177;
UPDATE `creature_template` SET `equipment_id`=5184 WHERE `entry`=5184;
UPDATE `creature_template` SET `equipment_id`=10739 WHERE `entry`=10739;
UPDATE `creature_template` SET `equipment_id`=5189 WHERE `entry`=5189;
UPDATE `creature_template` SET `equipment_id`=6132 WHERE `entry`=6132;
UPDATE `creature_template` SET `equipment_id`=7158 WHERE `entry`=7158;
UPDATE `creature_template` SET `equipment_id`=6136 WHERE `entry`=6136;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=5224;
UPDATE `creature_template` SET `equipment_id`=5229 WHERE `entry`=5229;
UPDATE `creature_template` SET `equipment_id`=5234 WHERE `entry`=5234;
UPDATE `creature_template` SET `equipment_id`=5237 WHERE `entry`=5237;
UPDATE `creature_template` SET `equipment_id`=5239 WHERE `entry`=5239;
UPDATE `creature_template` SET `equipment_id`=5240 WHERE `entry`=5240;
UPDATE `creature_template` SET `equipment_id`=5241 WHERE `entry`=5241;
UPDATE `creature_template` SET `equipment_id`=5243 WHERE `entry`=5243;
UPDATE `creature_template` SET `equipment_id`=6124 WHERE `entry`=6124;
UPDATE `creature_template` SET `equipment_id`=5253 WHERE `entry`=5253;
UPDATE `creature_template` SET `equipment_id`=10506 WHERE `entry`=10506;
UPDATE `creature_template` SET `equipment_id`=5254 WHERE `entry`=5254;
UPDATE `creature_template` SET `equipment_id`=5255 WHERE `entry`=5255;
UPDATE `creature_template` SET `equipment_id`=5259 WHERE `entry`=5259;
UPDATE `creature_template` SET `equipment_id`=5261 WHERE `entry`=5261;
UPDATE `creature_template` SET `equipment_id`=5267 WHERE `entry`=5267;
UPDATE `creature_template` SET `equipment_id`=5270 WHERE `entry`=5270;
UPDATE `creature_template` SET `equipment_id`=7015 WHERE `entry`=7015;
UPDATE `creature_template` SET `equipment_id`=5997 WHERE `entry`=5997;
UPDATE `creature_template` SET `equipment_id`=5277 WHERE `entry`=5277;
UPDATE `creature_template` SET `equipment_id`=5280 WHERE `entry`=5280;
UPDATE `creature_template` SET `equipment_id`=6408 WHERE `entry`=6408;
UPDATE `creature_template` SET `equipment_id`=5901 WHERE `entry`=5901;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=5317;
UPDATE `creature_template` SET `equipment_id`=5331 WHERE `entry`=5331;
UPDATE `creature_template` SET `equipment_id`=5332 WHERE `entry`=5332;
UPDATE `creature_template` SET `equipment_id`=5334 WHERE `entry`=5334;
UPDATE `creature_template` SET `equipment_id`=5343 WHERE `entry`=5343;
UPDATE `creature_template` SET `equipment_id`=6009 WHERE `entry`=6009;
UPDATE `creature_template` SET `equipment_id`=5357 WHERE `entry`=5357;
UPDATE `creature_template` SET `equipment_id`=5358 WHERE `entry`=5358;
UPDATE `creature_template` SET `equipment_id`=5359 WHERE `entry`=5359;
UPDATE `creature_template` SET `equipment_id`=5360 WHERE `entry`=5360;
UPDATE `creature_template` SET `equipment_id`=5953 WHERE `entry`=5953;
UPDATE `creature_template` SET `equipment_id`=5957 WHERE `entry`=5957;
UPDATE `creature_template` SET `equipment_id`=5384 WHERE `entry`=5384;
UPDATE `creature_template` SET `equipment_id`=5385 WHERE `entry`=5385;
UPDATE `creature_template` SET `equipment_id`=5816 WHERE `entry`=5816;
UPDATE `creature_template` SET `equipment_id`=5386 WHERE `entry`=5386;
UPDATE `creature_template` SET `equipment_id`=5389 WHERE `entry`=5389;
UPDATE `creature_template` SET `equipment_id`=5820 WHERE `entry`=5820;
UPDATE `creature_template` SET `equipment_id`=5760 WHERE `entry`=5760;
UPDATE `creature_template` SET `equipment_id`=5394 WHERE `entry`=5394;
UPDATE `creature_template` SET `equipment_id`=5395 WHERE `entry`=5395;
UPDATE `creature_template` SET `equipment_id`=5399 WHERE `entry`=5399;
UPDATE `creature_template` SET `equipment_id`=5400 WHERE `entry`=5400;
UPDATE `creature_template` SET `equipment_id`=5401 WHERE `entry`=5401;
UPDATE `creature_template` SET `equipment_id`=5768 WHERE `entry`=5768;
UPDATE `creature_template` SET `equipment_id`=5402 WHERE `entry`=5402;
UPDATE `creature_template` SET `equipment_id`=5772 WHERE `entry`=5772;
UPDATE `creature_template` SET `equipment_id`=5413 WHERE `entry`=5413;
UPDATE `creature_template` SET `equipment_id`=5716 WHERE `entry`=5716;
UPDATE `creature_template` SET `equipment_id`=5418 WHERE `entry`=5418;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=5421;
UPDATE `creature_template` SET `equipment_id`=5724 WHERE `entry`=5724;
UPDATE `creature_template` SET `equipment_id`=5792 WHERE `entry`=5792;
UPDATE `creature_template` SET `equipment_id`=8157 WHERE `entry`=8157;
UPDATE `creature_template` SET `equipment_id`=8154 WHERE `entry`=8154;
UPDATE `creature_template` SET `equipment_id`=5884 WHERE `entry`=5884;
UPDATE `creature_template` SET `equipment_id`=5824 WHERE `entry`=5824;
UPDATE `creature_template` SET `equipment_id`=5469 WHERE `entry`=5469;
UPDATE `creature_template` SET `equipment_id`=5836 WHERE `entry`=5836;
UPDATE `creature_template` SET `equipment_id`=6178 WHERE `entry`=6178;
UPDATE `creature_template` SET `equipment_id`=5472 WHERE `entry`=5472;
UPDATE `creature_template` SET `equipment_id`=5473 WHERE `entry`=5473;
UPDATE `creature_template` SET `equipment_id`=5474 WHERE `entry`=5474;
UPDATE `creature_template` SET `equipment_id`=6301 WHERE `entry`=6301;
UPDATE `creature_template` SET `equipment_id`=5475 WHERE `entry`=5475;
UPDATE `creature_template` SET `equipment_id`=5477 WHERE `entry`=5477;
UPDATE `creature_template` SET `equipment_id`=5479 WHERE `entry`=5479;
UPDATE `creature_template` SET `equipment_id`=6806 WHERE `entry`=6806;
UPDATE `creature_template` SET `equipment_id`=5480 WHERE `entry`=5480;
UPDATE `creature_template` SET `equipment_id`=6299 WHERE `entry`=6299;
UPDATE `creature_template` SET `equipment_id`=5784 WHERE `entry`=5784;
UPDATE `creature_template` SET `equipment_id`=5482 WHERE `entry`=5482;
UPDATE `creature_template` SET `equipment_id`=5483 WHERE `entry`=5483;
UPDATE `creature_template` SET `equipment_id`=5489 WHERE `entry`=5489;
UPDATE `creature_template` SET `equipment_id`=5492 WHERE `entry`=5492;
UPDATE `creature_template` SET `equipment_id`=5493 WHERE `entry`=5493;
UPDATE `creature_template` SET `equipment_id`=5860 WHERE `entry`=5860;
UPDATE `creature_template` SET `equipment_id`=5495 WHERE `entry`=5495;
UPDATE `creature_template` SET `equipment_id`=6886 WHERE `entry`=6886;
UPDATE `creature_template` SET `equipment_id`=5496 WHERE `entry`=5496;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=5497;
UPDATE `creature_template` SET `equipment_id`=5864 WHERE `entry`=5864;
UPDATE `creature_template` SET `equipment_id`=5498 WHERE `entry`=5498;
UPDATE `creature_template` SET `equipment_id`=5500 WHERE `entry`=5500;
UPDATE `creature_template` SET `equipment_id`=5501 WHERE `entry`=5501;
UPDATE `creature_template` SET `equipment_id`=5504 WHERE `entry`=5504;
UPDATE `creature_template` SET `equipment_id`=5649 WHERE `entry`=5649;
UPDATE `creature_template` SET `equipment_id`=5508 WHERE `entry`=5508;
UPDATE `creature_template` SET `equipment_id`=5653 WHERE `entry`=5653;
UPDATE `creature_template` SET `equipment_id`=5509 WHERE `entry`=5509;
UPDATE `creature_template` SET `equipment_id`=5510 WHERE `entry`=5510;
UPDATE `creature_template` SET `equipment_id`=5512 WHERE `entry`=5512;
UPDATE `creature_template` SET `equipment_id`=5657 WHERE `entry`=5657;
UPDATE `creature_template` SET `equipment_id`=5515 WHERE `entry`=5515;
UPDATE `creature_template` SET `equipment_id`=6168 WHERE `entry`=6168;
UPDATE `creature_template` SET `equipment_id`=5516 WHERE `entry`=5516;
UPDATE `creature_template` SET `equipment_id`=5661 WHERE `entry`=5661;
UPDATE `creature_template` SET `equipment_id`=5517 WHERE `entry`=5517;
UPDATE `creature_template` SET `equipment_id`=987001 WHERE `entry`=987001;
UPDATE `creature_template` SET `equipment_id`=5520 WHERE `entry`=5520;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=5523;
UPDATE `creature_template` SET `equipment_id`=5543 WHERE `entry`=5543;
UPDATE `creature_template` SET `equipment_id`=5547 WHERE `entry`=5547;
UPDATE `creature_template` SET `equipment_id`=5645 WHERE `entry`=5645;
UPDATE `creature_template` SET `equipment_id`=5566 WHERE `entry`=5566;
UPDATE `creature_template` SET `equipment_id`=5570 WHERE `entry`=5570;
UPDATE `creature_template` SET `equipment_id`=5595 WHERE `entry`=5595;
UPDATE `creature_template` SET `equipment_id`=5597 WHERE `entry`=5597;
UPDATE `creature_template` SET `equipment_id`=6306 WHERE `entry`=6306;
UPDATE `creature_template` SET `equipment_id`=5598 WHERE `entry`=5598;
UPDATE `creature_template` SET `equipment_id`=5599 WHERE `entry`=5599;
UPDATE `creature_template` SET `equipment_id`=5600 WHERE `entry`=5600;
UPDATE `creature_template` SET `equipment_id`=5605 WHERE `entry`=5605;
UPDATE `creature_template` SET `equipment_id`=5606 WHERE `entry`=5606;
UPDATE `creature_template` SET `equipment_id`=6775 WHERE `entry`=6775;
UPDATE `creature_template` SET `equipment_id`=5608 WHERE `entry`=5608;
UPDATE `creature_template` SET `equipment_id`=5753 WHERE `entry`=5753;
UPDATE `creature_template` SET `equipment_id`=5611 WHERE `entry`=5611;
UPDATE `creature_template` SET `equipment_id`=5612 WHERE `entry`=5612;
UPDATE `creature_template` SET `equipment_id`=5757 WHERE `entry`=5757;
UPDATE `creature_template` SET `equipment_id`=5613 WHERE `entry`=5613;
UPDATE `creature_template` SET `equipment_id`=5616 WHERE `entry`=5616;
UPDATE `creature_template` SET `equipment_id`=5697 WHERE `entry`=5697;
UPDATE `creature_template` SET `equipment_id`=5701 WHERE `entry`=5701;
UPDATE `creature_template` SET `equipment_id`=5622 WHERE `entry`=5622;
UPDATE `creature_template` SET `equipment_id`=5705 WHERE `entry`=5705;
UPDATE `creature_template` SET `equipment_id`=5634 WHERE `entry`=5634;
UPDATE `creature_template` SET `equipment_id`=5636 WHERE `entry`=5636;
UPDATE `creature_template` SET `equipment_id`=5637 WHERE `entry`=5637;
UPDATE `creature_template` SET `equipment_id`=5638 WHERE `entry`=5638;
UPDATE `creature_template` SET `equipment_id`=5639 WHERE `entry`=5639;
UPDATE `creature_template` SET `equipment_id`=5640 WHERE `entry`=5640;
UPDATE `creature_template` SET `equipment_id`=5641 WHERE `entry`=5641;
UPDATE `creature_template` SET `equipment_id`=5642 WHERE `entry`=5642;
UPDATE `creature_template` SET `equipment_id`=11141 WHERE `entry`=11141;
UPDATE `creature_template` SET `equipment_id`=5647 WHERE `entry`=5647;
UPDATE `creature_template` SET `equipment_id`=5650 WHERE `entry`=5650;
UPDATE `creature_template` SET `equipment_id`=7053 WHERE `entry`=7053;
UPDATE `creature_template` SET `equipment_id`=5651 WHERE `entry`=5651;
UPDATE `creature_template` SET `equipment_id`=5654 WHERE `entry`=5654;
UPDATE `creature_template` SET `equipment_id`=5655 WHERE `entry`=5655;
UPDATE `creature_template` SET `equipment_id`=5656 WHERE `entry`=5656;
UPDATE `creature_template` SET `equipment_id`=7051 WHERE `entry`=7051;
UPDATE `creature_template` SET `equipment_id`=5660 WHERE `entry`=5660;
UPDATE `creature_template` SET `equipment_id`=5662 WHERE `entry`=5662;
UPDATE `creature_template` SET `equipment_id`=5663 WHERE `entry`=5663;
UPDATE `creature_template` SET `equipment_id`=5664 WHERE `entry`=5664;
UPDATE `creature_template` SET `equipment_id`=5667 WHERE `entry`=5667;
UPDATE `creature_template` SET `equipment_id`=5674 WHERE `entry`=5674;
UPDATE `creature_template` SET `equipment_id`=5679 WHERE `entry`=5679;
UPDATE `creature_template` SET `equipment_id`=5681 WHERE `entry`=5681;
UPDATE `creature_template` SET `equipment_id`=5682 WHERE `entry`=5682;
UPDATE `creature_template` SET `equipment_id`=6566 WHERE `entry`=6566;
UPDATE `creature_template` SET `equipment_id`=5688 WHERE `entry`=5688;
UPDATE `creature_template` SET `equipment_id`=5696 WHERE `entry`=5696;
UPDATE `creature_template` SET `equipment_id`=5698 WHERE `entry`=5698;
UPDATE `creature_template` SET `equipment_id`=5702 WHERE `entry`=5702;
UPDATE `creature_template` SET `equipment_id`=5703 WHERE `entry`=5703;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=6646;
UPDATE `creature_template` SET `equipment_id`=5704 WHERE `entry`=5704;
UPDATE `creature_template` SET `equipment_id`=5706 WHERE `entry`=5706;
UPDATE `creature_template` SET `equipment_id`=5711 WHERE `entry`=5711;
UPDATE `creature_template` SET `equipment_id`=5717 WHERE `entry`=5717;
UPDATE `creature_template` SET `equipment_id`=5057 WHERE `entry`=5057;
UPDATE `creature_template` SET `equipment_id`=7115 WHERE `entry`=7115;
UPDATE `creature_template` SET `equipment_id`=5725 WHERE `entry`=5725;
UPDATE `creature_template` SET `equipment_id`=6946 WHERE `entry`=6946;
UPDATE `creature_template` SET `equipment_id`=7069 WHERE `entry`=7069;
UPDATE `creature_template` SET `equipment_id`=5732 WHERE `entry`=5732;
UPDATE `creature_template` SET `equipment_id`=5733 WHERE `entry`=5733;
UPDATE `creature_template` SET `equipment_id`=5734 WHERE `entry`=5734;
UPDATE `creature_template` SET `equipment_id`=7067 WHERE `entry`=7067;
UPDATE `creature_template` SET `equipment_id`=5749 WHERE `entry`=5749;
UPDATE `creature_template` SET `equipment_id`=5752 WHERE `entry`=5752;
UPDATE `creature_template` SET `equipment_id`=5765 WHERE `entry`=5765;
UPDATE `creature_template` SET `equipment_id`=11018 WHERE `entry`=11018;
UPDATE `creature_template` SET `equipment_id`=5771 WHERE `entry`=5771;
UPDATE `creature_template` SET `equipment_id`=5782 WHERE `entry`=5782;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=5787;
UPDATE `creature_template` SET `equipment_id`=7016 WHERE `entry`=7016;
UPDATE `creature_template` SET `equipment_id`=5797 WHERE `entry`=5797;
UPDATE `creature_template` SET `equipment_id`=5798 WHERE `entry`=5798;
UPDATE `creature_template` SET `equipment_id`=5800 WHERE `entry`=5800;
UPDATE `creature_template` SET `equipment_id`=5808 WHERE `entry`=5808;
UPDATE `creature_template` SET `equipment_id`=5809 WHERE `entry`=5809;
UPDATE `creature_template` SET `equipment_id`=5811 WHERE `entry`=5811;
UPDATE `creature_template` SET `equipment_id`=5812 WHERE `entry`=5812;
UPDATE `creature_template` SET `equipment_id`=5814 WHERE `entry`=5814;
UPDATE `creature_template` SET `equipment_id`=6407 WHERE `entry`=6407;
UPDATE `creature_template` SET `equipment_id`=5815 WHERE `entry`=5815;
UPDATE `creature_template` SET `equipment_id`=5819 WHERE `entry`=5819;
UPDATE `creature_template` SET `equipment_id`=5821 WHERE `entry`=5821;
UPDATE `creature_template` SET `equipment_id`=5822 WHERE `entry`=5822;
UPDATE `creature_template` SET `equipment_id`=11082 WHERE `entry`=11082;
UPDATE `creature_template` SET `equipment_id`=6487 WHERE `entry`=6487;
UPDATE `creature_template` SET `equipment_id`=5835 WHERE `entry`=5835;
UPDATE `creature_template` SET `equipment_id`=6185 WHERE `entry`=6185;
UPDATE `creature_template` SET `equipment_id`=5839 WHERE `entry`=5839;
UPDATE `creature_template` SET `equipment_id`=5841 WHERE `entry`=5841;
UPDATE `creature_template` SET `equipment_id`=5843 WHERE `entry`=5843;
UPDATE `creature_template` SET `equipment_id`=5844 WHERE `entry`=5844;
UPDATE `creature_template` SET `equipment_id`=5846 WHERE `entry`=5846;
UPDATE `creature_template` SET `equipment_id`=6567 WHERE `entry`=6567;
UPDATE `creature_template` SET `equipment_id`=5847 WHERE `entry`=5847;
UPDATE `creature_template` SET `equipment_id`=5851 WHERE `entry`=5851;
UPDATE `creature_template` SET `equipment_id`=6201 WHERE `entry`=6201;
UPDATE `creature_template` SET `equipment_id`=6194 WHERE `entry`=6194;
UPDATE `creature_template` SET `equipment_id`=7074 WHERE `entry`=7074;
UPDATE `creature_template` SET `equipment_id`=5861 WHERE `entry`=5861;
UPDATE `creature_template` SET `equipment_id`=5862 WHERE `entry`=5862;
UPDATE `creature_template` SET `equipment_id`=5871 WHERE `entry`=5871;
UPDATE `creature_template` SET `equipment_id`=5875 WHERE `entry`=5875;
UPDATE `creature_template` SET `equipment_id`=5878 WHERE `entry`=5878;
UPDATE `creature_template` SET `equipment_id`=5880 WHERE `entry`=5880;
UPDATE `creature_template` SET `equipment_id`=5883 WHERE `entry`=5883;
UPDATE `creature_template` SET `equipment_id`=5885 WHERE `entry`=5885;
UPDATE `creature_template` SET `equipment_id`=5886 WHERE `entry`=5886;
UPDATE `creature_template` SET `equipment_id`=10931 WHERE `entry`=10931;
UPDATE `creature_template` SET `equipment_id`=5888 WHERE `entry`=5888;
UPDATE `creature_template` SET `equipment_id`=5905 WHERE `entry`=5905;
UPDATE `creature_template` SET `equipment_id`=5906 WHERE `entry`=5906;
UPDATE `creature_template` SET `equipment_id`=5908 WHERE `entry`=5908;
UPDATE `creature_template` SET `equipment_id`=5909 WHERE `entry`=5909;
UPDATE `creature_template` SET `equipment_id`=5910 WHERE `entry`=5910;
UPDATE `creature_template` SET `equipment_id`=5911 WHERE `entry`=5911;
UPDATE `creature_template` SET `equipment_id`=5916 WHERE `entry`=5916;
UPDATE `creature_template` SET `equipment_id`=5938 WHERE `entry`=5938;
UPDATE `creature_template` SET `equipment_id`=5944 WHERE `entry`=5944;
UPDATE `creature_template` SET `equipment_id`=5952 WHERE `entry`=5952;
UPDATE `creature_template` SET `equipment_id`=5974 WHERE `entry`=5974;
UPDATE `creature_template` SET `equipment_id`=5981 WHERE `entry`=5981;
UPDATE `creature_template` SET `equipment_id`=5994 WHERE `entry`=5994;
UPDATE `creature_template` SET `equipment_id`=5996 WHERE `entry`=5996;
UPDATE `creature_template` SET `equipment_id`=5998 WHERE `entry`=5998;
UPDATE `creature_template` SET `equipment_id`=5999 WHERE `entry`=5999;
UPDATE `creature_template` SET `equipment_id`=6001 WHERE `entry`=6001;
UPDATE `creature_template` SET `equipment_id`=6002 WHERE `entry`=6002;
UPDATE `creature_template` SET `equipment_id`=6003 WHERE `entry`=6003;
UPDATE `creature_template` SET `equipment_id`=6004 WHERE `entry`=6004;
UPDATE `creature_template` SET `equipment_id`=6006 WHERE `entry`=6006;
UPDATE `creature_template` SET `equipment_id`=6007 WHERE `entry`=6007;
UPDATE `creature_template` SET `equipment_id`=6374 WHERE `entry`=6374;
UPDATE `creature_template` SET `equipment_id`=6008 WHERE `entry`=6008;
UPDATE `creature_template` SET `equipment_id`=6011 WHERE `entry`=6011;
UPDATE `creature_template` SET `equipment_id`=6018 WHERE `entry`=6018;
UPDATE `creature_template` SET `equipment_id`=6019 WHERE `entry`=6019;
UPDATE `creature_template` SET `equipment_id`=10762 WHERE `entry`=10762;
UPDATE `creature_template` SET `equipment_id`=6026 WHERE `entry`=6026;
UPDATE `creature_template` SET `equipment_id`=6027 WHERE `entry`=6027;
UPDATE `creature_template` SET `equipment_id`=6035 WHERE `entry`=6035;
UPDATE `creature_template` SET `equipment_id`=6070 WHERE `entry`=6070;
UPDATE `creature_template` SET `equipment_id`=6086 WHERE `entry`=6086;
UPDATE `creature_template` SET `equipment_id`=6091 WHERE `entry`=6091;
UPDATE `creature_template` SET `equipment_id`=6093 WHERE `entry`=6093;
UPDATE `creature_template` SET `equipment_id`=6738 WHERE `entry`=6738;
UPDATE `creature_template` SET `equipment_id`=6119 WHERE `entry`=6119;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=6123;
UPDATE `creature_template` SET `equipment_id`=6127 WHERE `entry`=6127;
UPDATE `creature_template` SET `equipment_id`=6131 WHERE `entry`=6131;
UPDATE `creature_template` SET `equipment_id`=6142 WHERE `entry`=6142;
UPDATE `creature_template` SET `equipment_id`=10319 WHERE `entry`=10319;
UPDATE `creature_template` SET `equipment_id`=6144 WHERE `entry`=6144;
UPDATE `creature_template` SET `equipment_id`=7088 WHERE `entry`=7088;
UPDATE `creature_template` SET `equipment_id`=7607 WHERE `entry`=7607;
UPDATE `creature_template` SET `equipment_id`=6169 WHERE `entry`=6169;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=7048;
UPDATE `creature_template` SET `equipment_id`=6171 WHERE `entry`=6171;
UPDATE `creature_template` SET `equipment_id`=6172 WHERE `entry`=6172;
UPDATE `creature_template` SET `equipment_id`=7052 WHERE `entry`=7052;
UPDATE `creature_template` SET `equipment_id`=6176 WHERE `entry`=6176;
UPDATE `creature_template` SET `equipment_id`=6180 WHERE `entry`=6180;
UPDATE `creature_template` SET `equipment_id`=6181 WHERE `entry`=6181;
UPDATE `creature_template` SET `equipment_id`=6182 WHERE `entry`=6182;
UPDATE `creature_template` SET `equipment_id`=7505 WHERE `entry`=7505;
UPDATE `creature_template` SET `equipment_id`=7872 WHERE `entry`=7872;
UPDATE `creature_template` SET `equipment_id`=6186 WHERE `entry`=6186;
UPDATE `creature_template` SET `equipment_id`=6187 WHERE `entry`=6187;
UPDATE `creature_template` SET `equipment_id`=8026 WHERE `entry`=8026;
UPDATE `creature_template` SET `equipment_id`=6189 WHERE `entry`=6189;
UPDATE `creature_template` SET `equipment_id`=6190 WHERE `entry`=6190;
UPDATE `creature_template` SET `equipment_id`=7072 WHERE `entry`=7072;
UPDATE `creature_template` SET `equipment_id`=6193 WHERE `entry`=6193;
UPDATE `creature_template` SET `equipment_id`=6198 WHERE `entry`=6198;
UPDATE `creature_template` SET `equipment_id`=6199 WHERE `entry`=6199;
UPDATE `creature_template` SET `equipment_id`=6206 WHERE `entry`=6206;
UPDATE `creature_template` SET `equipment_id`=6208 WHERE `entry`=6208;
UPDATE `creature_template` SET `equipment_id`=6210 WHERE `entry`=6210;
UPDATE `creature_template` SET `equipment_id`=6211 WHERE `entry`=6211;
UPDATE `creature_template` SET `equipment_id`=8178 WHERE `entry`=8178;
UPDATE `creature_template` SET `equipment_id`=6212 WHERE `entry`=6212;
UPDATE `creature_template` SET `equipment_id`=7671 WHERE `entry`=7671;
UPDATE `creature_template` SET `equipment_id`=6213 WHERE `entry`=6213;
UPDATE `creature_template` SET `equipment_id`=7156 WHERE `entry`=7156;
UPDATE `creature_template` SET `equipment_id`=6221 WHERE `entry`=6221;
UPDATE `creature_template` SET `equipment_id`=6222 WHERE `entry`=6222;
UPDATE `creature_template` SET `equipment_id`=6223 WHERE `entry`=6223;
UPDATE `creature_template` SET `equipment_id`=6228 WHERE `entry`=6228;
UPDATE `creature_template` SET `equipment_id`=7623 WHERE `entry`=7623;
UPDATE `creature_template` SET `equipment_id`=7112 WHERE `entry`=7112;
UPDATE `creature_template` SET `equipment_id`=6236 WHERE `entry`=6236;
UPDATE `creature_template` SET `equipment_id`=6237 WHERE `entry`=6237;
UPDATE `creature_template` SET `equipment_id`=6240 WHERE `entry`=6240;
UPDATE `creature_template` SET `equipment_id`=6241 WHERE `entry`=6241;
UPDATE `creature_template` SET `equipment_id`=7056 WHERE `entry`=7056;
UPDATE `creature_template` SET `equipment_id`=6243 WHERE `entry`=6243;
UPDATE `creature_template` SET `equipment_id`=6244 WHERE `entry`=6244;
UPDATE `creature_template` SET `equipment_id`=6245 WHERE `entry`=6245;
UPDATE `creature_template` SET `equipment_id`=6246 WHERE `entry`=6246;
UPDATE `creature_template` SET `equipment_id`=6247 WHERE `entry`=6247;
UPDATE `creature_template` SET `equipment_id`=6251 WHERE `entry`=6251;
UPDATE `creature_template` SET `equipment_id`=6252 WHERE `entry`=6252;
UPDATE `creature_template` SET `equipment_id`=7583 WHERE `entry`=7583;
UPDATE `creature_template` SET `equipment_id`=7068 WHERE `entry`=7068;
UPDATE `creature_template` SET `equipment_id`=6253 WHERE `entry`=6253;
UPDATE `creature_template` SET `equipment_id`=6254 WHERE `entry`=6254;
UPDATE `creature_template` SET `equipment_id`=6267 WHERE `entry`=6267;
UPDATE `creature_template` SET `equipment_id`=6272 WHERE `entry`=6272;
UPDATE `creature_template` SET `equipment_id`=6929 WHERE `entry`=6929;
UPDATE `creature_template` SET `equipment_id`=6286 WHERE `entry`=6286;
UPDATE `creature_template` SET `equipment_id`=6287 WHERE `entry`=6287;
UPDATE `creature_template` SET `equipment_id`=6288 WHERE `entry`=6288;
UPDATE `creature_template` SET `equipment_id`=7009 WHERE `entry`=7009;
UPDATE `creature_template` SET `equipment_id`=6289 WHERE `entry`=6289;
UPDATE `creature_template` SET `equipment_id`=6290 WHERE `entry`=6290;
UPDATE `creature_template` SET `equipment_id`=6291 WHERE `entry`=6291;
UPDATE `creature_template` SET `equipment_id`=6292 WHERE `entry`=6292;
UPDATE `creature_template` SET `equipment_id`=6293 WHERE `entry`=6293;
UPDATE `creature_template` SET `equipment_id`=6295 WHERE `entry`=6295;
UPDATE `creature_template` SET `equipment_id`=6297 WHERE `entry`=6297;
UPDATE `creature_template` SET `equipment_id`=6298 WHERE `entry`=6298;
UPDATE `creature_template` SET `equipment_id`=6300 WHERE `entry`=6300;
UPDATE `creature_template` SET `equipment_id`=6328 WHERE `entry`=6328;
UPDATE `creature_template` SET `equipment_id`=6351 WHERE `entry`=6351;
UPDATE `creature_template` SET `equipment_id`=7725 WHERE `entry`=7725;
UPDATE `creature_template` SET `equipment_id`=7073 WHERE `entry`=7073;
UPDATE `creature_template` SET `equipment_id`=7734 WHERE `entry`=7734;
UPDATE `creature_template` SET `equipment_id`=6367 WHERE `entry`=6367;
UPDATE `creature_template` SET `equipment_id`=7025 WHERE `entry`=7025;
UPDATE `creature_template` SET `equipment_id`=6371 WHERE `entry`=6371;
UPDATE `creature_template` SET `equipment_id`=7029 WHERE `entry`=7029;
UPDATE `creature_template` SET `equipment_id`=6373 WHERE `entry`=6373;
UPDATE `creature_template` SET `equipment_id`=6376 WHERE `entry`=6376;
UPDATE `creature_template` SET `equipment_id`=7033 WHERE `entry`=7033;
UPDATE `creature_template` SET `equipment_id`=7037 WHERE `entry`=7037;
UPDATE `creature_template` SET `equipment_id`=6387 WHERE `entry`=6387;
UPDATE `creature_template` SET `equipment_id`=6390 WHERE `entry`=6390;
UPDATE `creature_template` SET `equipment_id`=6391 WHERE `entry`=6391;
UPDATE `creature_template` SET `equipment_id`=6392 WHERE `entry`=6392;
UPDATE `creature_template` SET `equipment_id`=6393 WHERE `entry`=6393;
UPDATE `creature_template` SET `equipment_id`=6394 WHERE `entry`=6394;
UPDATE `creature_template` SET `equipment_id`=6395 WHERE `entry`=6395;
UPDATE `creature_template` SET `equipment_id`=6410 WHERE `entry`=6410;
UPDATE `creature_template` SET `equipment_id`=6411 WHERE `entry`=6411;
UPDATE `creature_template` SET `equipment_id`=7866 WHERE `entry`=7866;
UPDATE `creature_template` SET `equipment_id`=6446 WHERE `entry`=6446;
UPDATE `creature_template` SET `equipment_id`=8136 WHERE `entry`=8136;
UPDATE `creature_template` SET `equipment_id`=6467 WHERE `entry`=6467;
UPDATE `creature_template` SET `equipment_id`=6488 WHERE `entry`=6488;
UPDATE `creature_template` SET `equipment_id`=6489 WHERE `entry`=6489;
UPDATE `creature_template` SET `equipment_id`=7826 WHERE `entry`=7826;
UPDATE `creature_template` SET `equipment_id`=16452 WHERE `entry`=16452;
UPDATE `creature_template` SET `equipment_id`=7327 WHERE `entry`=7327;
UPDATE `creature_template` SET `equipment_id`=7321 WHERE `entry`=7321;
UPDATE `creature_template` SET `equipment_id`=6523 WHERE `entry`=6523;
UPDATE `creature_template` SET `equipment_id`=6546 WHERE `entry`=6546;
UPDATE `creature_template` SET `equipment_id`=6548 WHERE `entry`=6548;
UPDATE `creature_template` SET `equipment_id`=7787 WHERE `entry`=7787;
UPDATE `creature_template` SET `equipment_id`=7276 WHERE `entry`=7276;
UPDATE `creature_template` SET `equipment_id`=6568 WHERE `entry`=6568;
UPDATE `creature_template` SET `equipment_id`=7230 WHERE `entry`=7230;
UPDATE `creature_template` SET `equipment_id`=6570 WHERE `entry`=6570;
UPDATE `creature_template` SET `equipment_id`=6574 WHERE `entry`=6574;
UPDATE `creature_template` SET `equipment_id`=7228 WHERE `entry`=7228;
UPDATE `creature_template` SET `equipment_id`=6575 WHERE `entry`=6575;
UPDATE `creature_template` SET `equipment_id`=6579 WHERE `entry`=6579;
UPDATE `creature_template` SET `equipment_id`=9216 WHERE `entry`=9216;
UPDATE `creature_template` SET `equipment_id`=6586 WHERE `entry`=6586;
UPDATE `creature_template` SET `equipment_id`=6607 WHERE `entry`=6607;
UPDATE `creature_template` SET `equipment_id`=7795 WHERE `entry`=7795;
UPDATE `creature_template` SET `equipment_id`=6647 WHERE `entry`=6647;
UPDATE `creature_template` SET `equipment_id`=6649 WHERE `entry`=6649;
UPDATE `creature_template` SET `equipment_id`=7246 WHERE `entry`=7246;
UPDATE `creature_template` SET `equipment_id`=6650 WHERE `entry`=6650;
UPDATE `creature_template` SET `equipment_id`=6667 WHERE `entry`=6667;
UPDATE `creature_template` SET `equipment_id`=6668 WHERE `entry`=6668;
UPDATE `creature_template` SET `equipment_id`=8127 WHERE `entry`=8127;
UPDATE `creature_template` SET `equipment_id`=6670 WHERE `entry`=6670;
UPDATE `creature_template` SET `equipment_id`=8121 WHERE `entry`=8121;
UPDATE `creature_template` SET `equipment_id`=6706 WHERE `entry`=6706;
UPDATE `creature_template` SET `equipment_id`=6726 WHERE `entry`=6726;
UPDATE `creature_template` SET `equipment_id`=8177 WHERE `entry`=8177;
UPDATE `creature_template` SET `equipment_id`=6730 WHERE `entry`=6730;
UPDATE `creature_template` SET `equipment_id`=10181 WHERE `entry`=10181;
UPDATE `creature_template` SET `equipment_id`=6731 WHERE `entry`=6731;
UPDATE `creature_template` SET `equipment_id`=6734 WHERE `entry`=6734;
UPDATE `creature_template` SET `equipment_id`=6735 WHERE `entry`=6735;
UPDATE `creature_template` SET `equipment_id`=6736 WHERE `entry`=6736;
UPDATE `creature_template` SET `equipment_id`=6739 WHERE `entry`=6739;
UPDATE `creature_template` SET `equipment_id`=6741 WHERE `entry`=6741;
UPDATE `creature_template` SET `equipment_id`=6747 WHERE `entry`=6747;
UPDATE `creature_template` SET `equipment_id`=6766 WHERE `entry`=6766;
UPDATE `creature_template` SET `equipment_id`=6771 WHERE `entry`=6771;
UPDATE `creature_template` SET `equipment_id`=8161 WHERE `entry`=8161;
UPDATE `creature_template` SET `equipment_id`=6777 WHERE `entry`=6777;
UPDATE `creature_template` SET `equipment_id`=6779 WHERE `entry`=6779;
UPDATE `creature_template` SET `equipment_id`=6782 WHERE `entry`=6782;
UPDATE `creature_template` SET `equipment_id`=6784 WHERE `entry`=6784;
UPDATE `creature_template` SET `equipment_id`=6785 WHERE `entry`=6785;
UPDATE `creature_template` SET `equipment_id`=6786 WHERE `entry`=6786;
UPDATE `creature_template` SET `equipment_id`=6791 WHERE `entry`=6791;
UPDATE `creature_template` SET `equipment_id`=7956 WHERE `entry`=7956;
UPDATE `creature_template` SET `equipment_id`=6807 WHERE `entry`=6807;
UPDATE `creature_template` SET `equipment_id`=6868 WHERE `entry`=6868;
UPDATE `creature_template` SET `equipment_id`=6887 WHERE `entry`=6887;
UPDATE `creature_template` SET `equipment_id`=6927 WHERE `entry`=6927;
UPDATE `creature_template` SET `equipment_id`=5773 WHERE `entry`=5773;
UPDATE `creature_template` SET `equipment_id`=6930 WHERE `entry`=6930;
UPDATE `creature_template` SET `equipment_id`=6966 WHERE `entry`=6966;
UPDATE `creature_template` SET `equipment_id`=6986 WHERE `entry`=6986;
UPDATE `creature_template` SET `equipment_id`=6987 WHERE `entry`=6987;
UPDATE `creature_template` SET `equipment_id`=7007 WHERE `entry`=7007;
UPDATE `creature_template` SET `equipment_id`=7724 WHERE `entry`=7724;
UPDATE `creature_template` SET `equipment_id`=7010 WHERE `entry`=7010;
UPDATE `creature_template` SET `equipment_id`=7011 WHERE `entry`=7011;
UPDATE `creature_template` SET `equipment_id`=7012 WHERE `entry`=7012;
UPDATE `creature_template` SET `equipment_id`=7017 WHERE `entry`=7017;
UPDATE `creature_template` SET `equipment_id`=7026 WHERE `entry`=7026;
UPDATE `creature_template` SET `equipment_id`=7027 WHERE `entry`=7027;
UPDATE `creature_template` SET `equipment_id`=7028 WHERE `entry`=7028;
UPDATE `creature_template` SET `equipment_id`=16451 WHERE `entry`=16451;
UPDATE `creature_template` SET `equipment_id`=7030 WHERE `entry`=7030;
UPDATE `creature_template` SET `equipment_id`=7035 WHERE `entry`=7035;
UPDATE `creature_template` SET `equipment_id`=7036 WHERE `entry`=7036;
UPDATE `creature_template` SET `equipment_id`=7038 WHERE `entry`=7038;
UPDATE `creature_template` SET `equipment_id`=7040 WHERE `entry`=7040;
UPDATE `creature_template` SET `equipment_id`=7041 WHERE `entry`=7041;
UPDATE `creature_template` SET `equipment_id`=7042 WHERE `entry`=7042;
UPDATE `creature_template` SET `equipment_id`=7050 WHERE `entry`=7050;
UPDATE `creature_template` SET `equipment_id`=7057 WHERE `entry`=7057;
UPDATE `creature_template` SET `equipment_id`=7076 WHERE `entry`=7076;
UPDATE `creature_template` SET `equipment_id`=7895 WHERE `entry`=7895;
UPDATE `creature_template` SET `equipment_id`=7087 WHERE `entry`=7087;
UPDATE `creature_template` SET `equipment_id`=7740 WHERE `entry`=7740;
UPDATE `creature_template` SET `equipment_id`=7089 WHERE `entry`=7089;
UPDATE `creature_template` SET `equipment_id`=7764 WHERE `entry`=7764;
UPDATE `creature_template` SET `equipment_id`=7113 WHERE `entry`=7113;
UPDATE `creature_template` SET `equipment_id`=7774 WHERE `entry`=7774;
UPDATE `creature_template` SET `equipment_id`=7120 WHERE `entry`=7120;
UPDATE `creature_template` SET `equipment_id`=7485 WHERE `entry`=7485;
UPDATE `creature_template` SET `equipment_id`=7798 WHERE `entry`=7798;
UPDATE `creature_template` SET `equipment_id`=7750 WHERE `entry`=7750;
UPDATE `creature_template` SET `equipment_id`=7154 WHERE `entry`=7154;
UPDATE `creature_template` SET `equipment_id`=7235 WHERE `entry`=7235;
UPDATE `creature_template` SET `equipment_id`=7155 WHERE `entry`=7155;
UPDATE `creature_template` SET `equipment_id`=7161 WHERE `entry`=7161;
UPDATE `creature_template` SET `equipment_id`=7232 WHERE `entry`=7232;
UPDATE `creature_template` SET `equipment_id`=7233 WHERE `entry`=7233;
UPDATE `creature_template` SET `equipment_id`=8176 WHERE `entry`=8176;
UPDATE `creature_template` SET `equipment_id`=7247 WHERE `entry`=7247;
UPDATE `creature_template` SET `equipment_id`=7267 WHERE `entry`=7267;
UPDATE `creature_template` SET `equipment_id`=7271 WHERE `entry`=7271;
UPDATE `creature_template` SET `equipment_id`=7274 WHERE `entry`=7274;
UPDATE `creature_template` SET `equipment_id`=7275 WHERE `entry`=7275;
UPDATE `creature_template` SET `equipment_id`=7294 WHERE `entry`=7294;
UPDATE `creature_template` SET `equipment_id`=7295 WHERE `entry`=7295;
UPDATE `creature_template` SET `equipment_id`=7296 WHERE `entry`=7296;
UPDATE `creature_template` SET `equipment_id`=7297 WHERE `entry`=7297;
UPDATE `creature_template` SET `equipment_id`=7298 WHERE `entry`=7298;
UPDATE `creature_template` SET `equipment_id`=7311 WHERE `entry`=7311;
UPDATE `creature_template` SET `equipment_id`=7312 WHERE `entry`=7312;
UPDATE `creature_template` SET `equipment_id`=7315 WHERE `entry`=7315;
UPDATE `creature_template` SET `equipment_id`=7317 WHERE `entry`=7317;
UPDATE `creature_template` SET `equipment_id`=7320 WHERE `entry`=7320;
UPDATE `creature_template` SET `equipment_id`=7324 WHERE `entry`=7324;
UPDATE `creature_template` SET `equipment_id`=7328 WHERE `entry`=7328;
UPDATE `creature_template` SET `equipment_id`=7329 WHERE `entry`=7329;
UPDATE `creature_template` SET `equipment_id`=8144 WHERE `entry`=8144;
UPDATE `creature_template` SET `equipment_id`=7332 WHERE `entry`=7332;
UPDATE `creature_template` SET `equipment_id`=7335 WHERE `entry`=7335;
UPDATE `creature_template` SET `equipment_id`=8152 WHERE `entry`=8152;
UPDATE `creature_template` SET `equipment_id`=7344 WHERE `entry`=7344;
UPDATE `creature_template` SET `equipment_id`=7937 WHERE `entry`=7937;
UPDATE `creature_template` SET `equipment_id`=7345 WHERE `entry`=7345;
UPDATE `creature_template` SET `equipment_id`=7346 WHERE `entry`=7346;
UPDATE `creature_template` SET `equipment_id`=7945 WHERE `entry`=7945;
UPDATE `creature_template` SET `equipment_id`=7354 WHERE `entry`=7354;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=7949;
UPDATE `creature_template` SET `equipment_id`=7360 WHERE `entry`=7360;
UPDATE `creature_template` SET `equipment_id`=8017 WHERE `entry`=8017;
UPDATE `creature_template` SET `equipment_id`=7396 WHERE `entry`=7396;
UPDATE `creature_template` SET `equipment_id`=7397 WHERE `entry`=7397;
UPDATE `creature_template` SET `equipment_id`=7404 WHERE `entry`=7404;
UPDATE `creature_template` SET `equipment_id`=7407 WHERE `entry`=7407;
UPDATE `creature_template` SET `equipment_id`=7408 WHERE `entry`=7408;
UPDATE `creature_template` SET `equipment_id`=7410 WHERE `entry`=7410;
UPDATE `creature_template` SET `equipment_id`=7856 WHERE `entry`=7856;
UPDATE `creature_template` SET `equipment_id`=7427 WHERE `entry`=7427;
UPDATE `creature_template` SET `equipment_id`=7435 WHERE `entry`=7435;
UPDATE `creature_template` SET `equipment_id`=7436 WHERE `entry`=7436;
UPDATE `creature_template` SET `equipment_id`=7437 WHERE `entry`=7437;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=7868;
UPDATE `creature_template` SET `equipment_id`=8894 WHERE `entry`=8894;
UPDATE `creature_template` SET `equipment_id`=7442 WHERE `entry`=7442;
UPDATE `creature_template` SET `equipment_id`=7772 WHERE `entry`=7772;
UPDATE `creature_template` SET `equipment_id`=7489 WHERE `entry`=7489;
UPDATE `creature_template` SET `equipment_id`=7564 WHERE `entry`=7564;
UPDATE `creature_template` SET `equipment_id`=7572 WHERE `entry`=7572;
UPDATE `creature_template` SET `equipment_id`=7604 WHERE `entry`=7604;
UPDATE `creature_template` SET `equipment_id`=7605 WHERE `entry`=7605;
UPDATE `creature_template` SET `equipment_id`=7608 WHERE `entry`=7608;
UPDATE `creature_template` SET `equipment_id`=7666 WHERE `entry`=7666;
UPDATE `creature_template` SET `equipment_id`=7667 WHERE `entry`=7667;
UPDATE `creature_template` SET `equipment_id`=7668 WHERE `entry`=7668;
UPDATE `creature_template` SET `equipment_id`=7683 WHERE `entry`=7683;
UPDATE `creature_template` SET `equipment_id`=7726 WHERE `entry`=7726;
UPDATE `creature_template` SET `equipment_id`=7727 WHERE `entry`=7727;
UPDATE `creature_template` SET `equipment_id`=7731 WHERE `entry`=7731;
UPDATE `creature_template` SET `equipment_id`=7733 WHERE `entry`=7733;
UPDATE `creature_template` SET `equipment_id`=7744 WHERE `entry`=7744;
UPDATE `creature_template` SET `equipment_id`=7763 WHERE `entry`=7763;
UPDATE `creature_template` SET `equipment_id`=7771 WHERE `entry`=7771;
UPDATE `creature_template` SET `equipment_id`=7776 WHERE `entry`=7776;
UPDATE `creature_template` SET `equipment_id`=7778 WHERE `entry`=7778;
UPDATE `creature_template` SET `equipment_id`=7071 WHERE `entry`=7071;
UPDATE `creature_template` SET `equipment_id`=7788 WHERE `entry`=7788;
UPDATE `creature_template` SET `equipment_id`=7790 WHERE `entry`=7790;
UPDATE `creature_template` SET `equipment_id`=7792 WHERE `entry`=7792;
UPDATE `creature_template` SET `equipment_id`=7793 WHERE `entry`=7793;
UPDATE `creature_template` SET `equipment_id`=7796 WHERE `entry`=7796;
UPDATE `creature_template` SET `equipment_id`=7797 WHERE `entry`=7797;
UPDATE `creature_template` SET `equipment_id`=7804 WHERE `entry`=7804;
UPDATE `creature_template` SET `equipment_id`=7805 WHERE `entry`=7805;
UPDATE `creature_template` SET `equipment_id`=7809 WHERE `entry`=7809;
UPDATE `creature_template` SET `equipment_id`=7823 WHERE `entry`=7823;
UPDATE `creature_template` SET `equipment_id`=7824 WHERE `entry`=7824;
UPDATE `creature_template` SET `equipment_id`=7825 WHERE `entry`=7825;
UPDATE `creature_template` SET `equipment_id`=7843 WHERE `entry`=7843;
UPDATE `creature_template` SET `equipment_id`=7851 WHERE `entry`=7851;
UPDATE `creature_template` SET `equipment_id`=7853 WHERE `entry`=7853;
UPDATE `creature_template` SET `equipment_id`=7855 WHERE `entry`=7855;
UPDATE `creature_template` SET `equipment_id`=7857 WHERE `entry`=7857;
UPDATE `creature_template` SET `equipment_id`=7858 WHERE `entry`=7858;
UPDATE `creature_template` SET `equipment_id`=7865 WHERE `entry`=7865;
UPDATE `creature_template` SET `equipment_id`=7869 WHERE `entry`=7869;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=7870;
UPDATE `creature_template` SET `equipment_id`=7871 WHERE `entry`=7871;
UPDATE `creature_template` SET `equipment_id`=7874 WHERE `entry`=7874;
UPDATE `creature_template` SET `equipment_id`=7876 WHERE `entry`=7876;
UPDATE `creature_template` SET `equipment_id`=9034 WHERE `entry`=9034;
UPDATE `creature_template` SET `equipment_id`=7899 WHERE `entry`=7899;
UPDATE `creature_template` SET `equipment_id`=7902 WHERE `entry`=7902;
UPDATE `creature_template` SET `equipment_id`=7939 WHERE `entry`=7939;
UPDATE `creature_template` SET `equipment_id`=7946 WHERE `entry`=7946;
UPDATE `creature_template` SET `equipment_id`=7947 WHERE `entry`=7947;
UPDATE `creature_template` SET `equipment_id`=7948 WHERE `entry`=7948;
UPDATE `creature_template` SET `equipment_id`=7950 WHERE `entry`=7950;
UPDATE `creature_template` SET `equipment_id`=7955 WHERE `entry`=7955;
UPDATE `creature_template` SET `equipment_id`=7957 WHERE `entry`=7957;
UPDATE `creature_template` SET `equipment_id`=7978 WHERE `entry`=7978;
UPDATE `creature_template` SET `equipment_id`=7980 WHERE `entry`=7980;
UPDATE `creature_template` SET `equipment_id`=7995 WHERE `entry`=7995;
UPDATE `creature_template` SET `equipment_id`=7996 WHERE `entry`=7996;
UPDATE `creature_template` SET `equipment_id`=8015 WHERE `entry`=8015;
UPDATE `creature_template` SET `equipment_id`=8019 WHERE `entry`=8019;
UPDATE `creature_template` SET `equipment_id`=8020 WHERE `entry`=8020;
UPDATE `creature_template` SET `equipment_id`=8022 WHERE `entry`=8022;
UPDATE `creature_template` SET `equipment_id`=8055 WHERE `entry`=8055;
UPDATE `creature_template` SET `equipment_id`=8096 WHERE `entry`=8096;
UPDATE `creature_template` SET `equipment_id`=8115 WHERE `entry`=8115;
UPDATE `creature_template` SET `equipment_id`=8116 WHERE `entry`=8116;
UPDATE `creature_template` SET `equipment_id`=8118 WHERE `entry`=8118;
UPDATE `creature_template` SET `equipment_id`=8119 WHERE `entry`=8119;
UPDATE `creature_template` SET `equipment_id`=8122 WHERE `entry`=8122;
UPDATE `creature_template` SET `equipment_id`=8124 WHERE `entry`=8124;
UPDATE `creature_template` SET `equipment_id`=8126 WHERE `entry`=8126;
UPDATE `creature_template` SET `equipment_id`=8128 WHERE `entry`=8128;
UPDATE `creature_template` SET `equipment_id`=8129 WHERE `entry`=8129;
UPDATE `creature_template` SET `equipment_id`=8137 WHERE `entry`=8137;
UPDATE `creature_template` SET `equipment_id`=8147 WHERE `entry`=8147;
UPDATE `creature_template` SET `equipment_id`=8151 WHERE `entry`=8151;
UPDATE `creature_template` SET `equipment_id`=8158 WHERE `entry`=8158;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=8196;
UPDATE `creature_template` SET `equipment_id`=8199 WHERE `entry`=8199;
UPDATE `creature_template` SET `equipment_id`=8200 WHERE `entry`=8200;
UPDATE `creature_template` SET `equipment_id`=11707 WHERE `entry`=11707;
UPDATE `creature_template` SET `equipment_id`=8201 WHERE `entry`=8201;
UPDATE `creature_template` SET `equipment_id`=8202 WHERE `entry`=8202;
UPDATE `creature_template` SET `equipment_id`=8203 WHERE `entry`=8203;
UPDATE `creature_template` SET `equipment_id`=11661 WHERE `entry`=11661;
UPDATE `creature_template` SET `equipment_id`=8214 WHERE `entry`=8214;
UPDATE `creature_template` SET `equipment_id`=8216 WHERE `entry`=8216;
UPDATE `creature_template` SET `equipment_id`=9096 WHERE `entry`=9096;
UPDATE `creature_template` SET `equipment_id`=15765 WHERE `entry`=15765;
UPDATE `creature_template` SET `equipment_id`=8219 WHERE `entry`=8219;
UPDATE `creature_template` SET `equipment_id`=9200 WHERE `entry`=9200;
UPDATE `creature_template` SET `equipment_id`=8997 WHERE `entry`=8997;
UPDATE `creature_template` SET `equipment_id`=9156 WHERE `entry`=9156;
UPDATE `creature_template` SET `equipment_id`=8282 WHERE `entry`=8282;
UPDATE `creature_template` SET `equipment_id`=8283 WHERE `entry`=8283;
UPDATE `creature_template` SET `equipment_id`=8296 WHERE `entry`=8296;
UPDATE `creature_template` SET `equipment_id`=8297 WHERE `entry`=8297;
UPDATE `creature_template` SET `equipment_id`=8298 WHERE `entry`=8298;
UPDATE `creature_template` SET `equipment_id`=9116 WHERE `entry`=9116;
UPDATE `creature_template` SET `equipment_id`=8304 WHERE `entry`=8304;
UPDATE `creature_template` SET `equipment_id`=8305 WHERE `entry`=8305;
UPDATE `creature_template` SET `equipment_id`=8306 WHERE `entry`=8306;
UPDATE `creature_template` SET `equipment_id`=11757 WHERE `entry`=11757;
UPDATE `creature_template` SET `equipment_id`=8307 WHERE `entry`=8307;
UPDATE `creature_template` SET `equipment_id`=8308 WHERE `entry`=8308;
UPDATE `creature_template` SET `equipment_id`=8309 WHERE `entry`=8309;
UPDATE `creature_template` SET `equipment_id`=8310 WHERE `entry`=8310;
UPDATE `creature_template` SET `equipment_id`=9196 WHERE `entry`=9196;
UPDATE `creature_template` SET `equipment_id`=8320 WHERE `entry`=8320;
UPDATE `creature_template` SET `equipment_id`=8977 WHERE `entry`=8977;
UPDATE `creature_template` SET `equipment_id`=8337 WHERE `entry`=8337;
UPDATE `creature_template` SET `equipment_id`=8338 WHERE `entry`=8338;
UPDATE `creature_template` SET `equipment_id`=10083 WHERE `entry`=10083;
UPDATE `creature_template` SET `equipment_id`=8356 WHERE `entry`=8356;
UPDATE `creature_template` SET `equipment_id`=8357 WHERE `entry`=8357;
UPDATE `creature_template` SET `equipment_id`=9681 WHERE `entry`=9681;
UPDATE `creature_template` SET `equipment_id`=8359 WHERE `entry`=8359;
UPDATE `creature_template` SET `equipment_id`=9524 WHERE `entry`=9524;
UPDATE `creature_template` SET `equipment_id`=8360 WHERE `entry`=8360;
UPDATE `creature_template` SET `equipment_id`=8361 WHERE `entry`=8361;
UPDATE `creature_template` SET `equipment_id`=8362 WHERE `entry`=8362;
UPDATE `creature_template` SET `equipment_id`=10043 WHERE `entry`=10043;
UPDATE `creature_template` SET `equipment_id`=8363 WHERE `entry`=8363;
UPDATE `creature_template` SET `equipment_id`=8364 WHERE `entry`=8364;
UPDATE `creature_template` SET `equipment_id`=8378 WHERE `entry`=8378;
UPDATE `creature_template` SET `equipment_id`=8380 WHERE `entry`=8380;
UPDATE `creature_template` SET `equipment_id`=8381 WHERE `entry`=8381;
UPDATE `creature_template` SET `equipment_id`=7951 WHERE `entry`=7951;
UPDATE `creature_template` SET `equipment_id`=8382 WHERE `entry`=8382;
UPDATE `creature_template` SET `equipment_id`=8383 WHERE `entry`=8383;
UPDATE `creature_template` SET `equipment_id`=9041 WHERE `entry`=9041;
UPDATE `creature_template` SET `equipment_id`=8385 WHERE `entry`=8385;
UPDATE `creature_template` SET `equipment_id`=9558 WHERE `entry`=9558;
UPDATE `creature_template` SET `equipment_id`=8386 WHERE `entry`=8386;
UPDATE `creature_template` SET `equipment_id`=15905 WHERE `entry`=15905;
UPDATE `creature_template` SET `equipment_id`=8387 WHERE `entry`=8387;
UPDATE `creature_template` SET `equipment_id`=8388 WHERE `entry`=8388;
UPDATE `creature_template` SET `equipment_id`=9045 WHERE `entry`=9045;
UPDATE `creature_template` SET `equipment_id`=8389 WHERE `entry`=8389;
UPDATE `creature_template` SET `equipment_id`=8390 WHERE `entry`=8390;
UPDATE `creature_template` SET `equipment_id`=12119 WHERE `entry`=12119;
UPDATE `creature_template` SET `equipment_id`=8391 WHERE `entry`=8391;
UPDATE `creature_template` SET `equipment_id`=9566 WHERE `entry`=9566;
UPDATE `creature_template` SET `equipment_id`=8395 WHERE `entry`=8395;
UPDATE `creature_template` SET `equipment_id`=11608 WHERE `entry`=11608;
UPDATE `creature_template` SET `equipment_id`=8396 WHERE `entry`=8396;
UPDATE `creature_template` SET `equipment_id`=8397 WHERE `entry`=8397;
UPDATE `creature_template` SET `equipment_id`=11602 WHERE `entry`=11602;
UPDATE `creature_template` SET `equipment_id`=8398 WHERE `entry`=8398;
UPDATE `creature_template` SET `equipment_id`=8399 WHERE `entry`=8399;
UPDATE `creature_template` SET `equipment_id`=9564 WHERE `entry`=9564;
UPDATE `creature_template` SET `equipment_id`=8401 WHERE `entry`=8401;
UPDATE `creature_template` SET `equipment_id`=8403 WHERE `entry`=8403;
UPDATE `creature_template` SET `equipment_id`=8404 WHERE `entry`=8404;
UPDATE `creature_template` SET `equipment_id`=8408 WHERE `entry`=8408;
UPDATE `creature_template` SET `equipment_id`=14911 WHERE `entry`=14911;
UPDATE `creature_template` SET `equipment_id`=8416 WHERE `entry`=8416;
UPDATE `creature_template` SET `equipment_id`=8418 WHERE `entry`=8418;
UPDATE `creature_template` SET `equipment_id`=8419 WHERE `entry`=8419;
UPDATE `creature_template` SET `equipment_id`=9077 WHERE `entry`=9077;
UPDATE `creature_template` SET `equipment_id`=9540 WHERE `entry`=9540;
UPDATE `creature_template` SET `equipment_id`=9033 WHERE `entry`=9033;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=9550;
UPDATE `creature_template` SET `equipment_id`=8442 WHERE `entry`=8442;
UPDATE `creature_template` SET `equipment_id`=10059 WHERE `entry`=10059;
UPDATE `creature_template` SET `equipment_id`=8444 WHERE `entry`=8444;
UPDATE `creature_template` SET `equipment_id`=9037 WHERE `entry`=9037;
UPDATE `creature_template` SET `equipment_id`=9548 WHERE `entry`=9548;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=8478;
UPDATE `creature_template` SET `equipment_id`=16014 WHERE `entry`=16014;
UPDATE `creature_template` SET `equipment_id`=8479 WHERE `entry`=8479;
UPDATE `creature_template` SET `equipment_id`=8496 WHERE `entry`=8496;
UPDATE `creature_template` SET `equipment_id`=8503 WHERE `entry`=8503;
UPDATE `creature_template` SET `equipment_id`=8504 WHERE `entry`=8504;
UPDATE `creature_template` SET `equipment_id`=15541 WHERE `entry`=15541;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=8507;
UPDATE `creature_template` SET `equipment_id`=8508 WHERE `entry`=8508;
UPDATE `creature_template` SET `equipment_id`=8509 WHERE `entry`=8509;
UPDATE `creature_template` SET `equipment_id`=8876 WHERE `entry`=8876;
UPDATE `creature_template` SET `equipment_id`=8518 WHERE `entry`=8518;
UPDATE `creature_template` SET `equipment_id`=9457 WHERE `entry`=9457;
UPDATE `creature_template` SET `equipment_id`=12022 WHERE `entry`=12022;
UPDATE `creature_template` SET `equipment_id`=8523 WHERE `entry`=8523;
UPDATE `creature_template` SET `equipment_id`=9978 WHERE `entry`=9978;
UPDATE `creature_template` SET `equipment_id`=8525 WHERE `entry`=8525;
UPDATE `creature_template` SET `equipment_id`=9465 WHERE `entry`=9465;
UPDATE `creature_template` SET `equipment_id`=8527 WHERE `entry`=8527;
UPDATE `creature_template` SET `equipment_id`=8737 WHERE `entry`=8737;
UPDATE `creature_template` SET `equipment_id`=8529 WHERE `entry`=8529;
UPDATE `creature_template` SET `equipment_id`=8896 WHERE `entry`=8896;
UPDATE `creature_template` SET `equipment_id`=11469 WHERE `entry`=11469;
UPDATE `creature_template` SET `equipment_id`=11815 WHERE `entry`=11815;
UPDATE `creature_template` SET `equipment_id`=9260 WHERE `entry`=9260;
UPDATE `creature_template` SET `equipment_id`=8546 WHERE `entry`=8546;
UPDATE `creature_template` SET `equipment_id`=8547 WHERE `entry`=8547;
UPDATE `creature_template` SET `equipment_id`=8548 WHERE `entry`=8548;
UPDATE `creature_template` SET `equipment_id`=8550 WHERE `entry`=8550;
UPDATE `creature_template` SET `equipment_id`=8551 WHERE `entry`=8551;
UPDATE `creature_template` SET `equipment_id`=8553 WHERE `entry`=8553;
UPDATE `creature_template` SET `equipment_id`=8560 WHERE `entry`=8560;
UPDATE `creature_template` SET `equipment_id`=8561 WHERE `entry`=8561;
UPDATE `creature_template` SET `equipment_id`=8562 WHERE `entry`=8562;
UPDATE `creature_template` SET `equipment_id`=11501 WHERE `entry`=11501;
UPDATE `creature_template` SET `equipment_id`=8563 WHERE `entry`=8563;
UPDATE `creature_template` SET `equipment_id`=8564 WHERE `entry`=8564;
UPDATE `creature_template` SET `equipment_id`=9447 WHERE `entry`=9447;
UPDATE `creature_template` SET `equipment_id`=8565 WHERE `entry`=8565;
UPDATE `creature_template` SET `equipment_id`=8566 WHERE `entry`=8566;
UPDATE `creature_template` SET `equipment_id`=8576 WHERE `entry`=8576;
UPDATE `creature_template` SET `equipment_id`=8578 WHERE `entry`=8578;
UPDATE `creature_template` SET `equipment_id`=8579 WHERE `entry`=8579;
UPDATE `creature_template` SET `equipment_id`=8581 WHERE `entry`=8581;
UPDATE `creature_template` SET `equipment_id`=8582 WHERE `entry`=8582;
UPDATE `creature_template` SET `equipment_id`=11799 WHERE `entry`=11799;
UPDATE `creature_template` SET `equipment_id`=9236 WHERE `entry`=9236;
UPDATE `creature_template` SET `equipment_id`=8586 WHERE `entry`=8586;
UPDATE `creature_template` SET `equipment_id`=8587 WHERE `entry`=8587;
UPDATE `creature_template` SET `equipment_id`=11288 WHERE `entry`=11288;
UPDATE `creature_template` SET `equipment_id`=8588 WHERE `entry`=8588;
UPDATE `creature_template` SET `equipment_id`=8912 WHERE `entry`=8912;
UPDATE `creature_template` SET `equipment_id`=9270 WHERE `entry`=9270;
UPDATE `creature_template` SET `equipment_id`=8610 WHERE `entry`=8610;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=9779;
UPDATE `creature_template` SET `equipment_id`=8920 WHERE `entry`=8920;
UPDATE `creature_template` SET `equipment_id`=8636 WHERE `entry`=8636;
UPDATE `creature_template` SET `equipment_id`=8717 WHERE `entry`=8717;
UPDATE `creature_template` SET `equipment_id`=8637 WHERE `entry`=8637;
UPDATE `creature_template` SET `equipment_id`=10038 WHERE `entry`=10038;
UPDATE `creature_template` SET `equipment_id`=11063 WHERE `entry`=11063;
UPDATE `creature_template` SET `equipment_id`=8659 WHERE `entry`=8659;
UPDATE `creature_template` SET `equipment_id`=15450 WHERE `entry`=15450;
UPDATE `creature_template` SET `equipment_id`=8661 WHERE `entry`=8661;
UPDATE `creature_template` SET `equipment_id`=8664 WHERE `entry`=8664;
UPDATE `creature_template` SET `equipment_id`=10046 WHERE `entry`=10046;
UPDATE `creature_template` SET `equipment_id`=8665 WHERE `entry`=8665;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=8666;
UPDATE `creature_template` SET `equipment_id`=11064 WHERE `entry`=11064;
UPDATE `creature_template` SET `equipment_id`=8877 WHERE `entry`=8877;
UPDATE `creature_template` SET `equipment_id`=8678 WHERE `entry`=8678;
UPDATE `creature_template` SET `equipment_id`=8679 WHERE `entry`=8679;
UPDATE `creature_template` SET `equipment_id`=9602 WHERE `entry`=9602;
UPDATE `creature_template` SET `equipment_id`=8736 WHERE `entry`=8736;
UPDATE `creature_template` SET `equipment_id`=8738 WHERE `entry`=8738;
UPDATE `creature_template` SET `equipment_id`=11686 WHERE `entry`=11686;
UPDATE `creature_template` SET `equipment_id`=8878 WHERE `entry`=8878;
UPDATE `creature_template` SET `equipment_id`=8879 WHERE `entry`=8879;
UPDATE `creature_template` SET `equipment_id`=9990 WHERE `entry`=9990;
UPDATE `creature_template` SET `equipment_id`=8889 WHERE `entry`=8889;
UPDATE `creature_template` SET `equipment_id`=9998 WHERE `entry`=9998;
UPDATE `creature_template` SET `equipment_id`=8890 WHERE `entry`=8890;
UPDATE `creature_template` SET `equipment_id`=8891 WHERE `entry`=8891;
UPDATE `creature_template` SET `equipment_id`=8892 WHERE `entry`=8892;
UPDATE `creature_template` SET `equipment_id`=8893 WHERE `entry`=8893;
UPDATE `creature_template` SET `equipment_id`=8895 WHERE `entry`=8895;
UPDATE `creature_template` SET `equipment_id`=9996 WHERE `entry`=9996;
UPDATE `creature_template` SET `equipment_id`=8897 WHERE `entry`=8897;
UPDATE `creature_template` SET `equipment_id`=8898 WHERE `entry`=8898;
UPDATE `creature_template` SET `equipment_id`=9555 WHERE `entry`=9555;
UPDATE `creature_template` SET `equipment_id`=8899 WHERE `entry`=8899;
UPDATE `creature_template` SET `equipment_id`=8900 WHERE `entry`=8900;
UPDATE `creature_template` SET `equipment_id`=8901 WHERE `entry`=8901;
UPDATE `creature_template` SET `equipment_id`=8902 WHERE `entry`=8902;
UPDATE `creature_template` SET `equipment_id`=10276 WHERE `entry`=10276;
UPDATE `creature_template` SET `equipment_id`=8903 WHERE `entry`=8903;
UPDATE `creature_template` SET `equipment_id`=8904 WHERE `entry`=8904;
UPDATE `creature_template` SET `equipment_id`=9262 WHERE `entry`=9262;
UPDATE `creature_template` SET `equipment_id`=9563 WHERE `entry`=9563;
UPDATE `creature_template` SET `equipment_id`=14380 WHERE `entry`=14380;
UPDATE `creature_template` SET `equipment_id`=9261 WHERE `entry`=9261;
UPDATE `creature_template` SET `equipment_id`=8913 WHERE `entry`=8913;
UPDATE `creature_template` SET `equipment_id`=8914 WHERE `entry`=8914;
UPDATE `creature_template` SET `equipment_id`=8915 WHERE `entry`=8915;
UPDATE `creature_template` SET `equipment_id`=8916 WHERE `entry`=8916;
UPDATE `creature_template` SET `equipment_id`=8917 WHERE `entry`=8917;
UPDATE `creature_template` SET `equipment_id`=14379 WHERE `entry`=14379;
UPDATE `creature_template` SET `equipment_id`=12098 WHERE `entry`=12098;
UPDATE `creature_template` SET `equipment_id`=7503 WHERE `entry`=7503;
UPDATE `creature_template` SET `equipment_id`=10060 WHERE `entry`=10060;
UPDATE `creature_template` SET `equipment_id`=8962 WHERE `entry`=8962;
UPDATE `creature_template` SET `equipment_id`=8965 WHERE `entry`=8965;
UPDATE `creature_template` SET `equipment_id`=16003 WHERE `entry`=16003;
UPDATE `creature_template` SET `equipment_id`=8978 WHERE `entry`=8978;
UPDATE `creature_template` SET `equipment_id`=8979 WHERE `entry`=8979;
UPDATE `creature_template` SET `equipment_id`=8980 WHERE `entry`=8980;
UPDATE `creature_template` SET `equipment_id`=8983 WHERE `entry`=8983;
UPDATE `creature_template` SET `equipment_id`=11947 WHERE `entry`=11947;
UPDATE `creature_template` SET `equipment_id`=16053 WHERE `entry`=16053;
UPDATE `creature_template` SET `equipment_id`=9018 WHERE `entry`=9018;
UPDATE `creature_template` SET `equipment_id`=9019 WHERE `entry`=9019;
UPDATE `creature_template` SET `equipment_id`=15534 WHERE `entry`=15534;
UPDATE `creature_template` SET `equipment_id`=9024 WHERE `entry`=9024;
UPDATE `creature_template` SET `equipment_id`=12029 WHERE `entry`=12029;
UPDATE `creature_template` SET `equipment_id`=9027 WHERE `entry`=9027;
UPDATE `creature_template` SET `equipment_id`=9458 WHERE `entry`=9458;
UPDATE `creature_template` SET `equipment_id`=9030 WHERE `entry`=9030;
UPDATE `creature_template` SET `equipment_id`=9035 WHERE `entry`=9035;
UPDATE `creature_template` SET `equipment_id`=9036 WHERE `entry`=9036;
UPDATE `creature_template` SET `equipment_id`=9983 WHERE `entry`=9983;
UPDATE `creature_template` SET `equipment_id`=9038 WHERE `entry`=9038;
UPDATE `creature_template` SET `equipment_id`=9039 WHERE `entry`=9039;
UPDATE `creature_template` SET `equipment_id`=9040 WHERE `entry`=9040;
UPDATE `creature_template` SET `equipment_id`=9043 WHERE `entry`=9043;
UPDATE `creature_template` SET `equipment_id`=9044 WHERE `entry`=9044;
UPDATE `creature_template` SET `equipment_id`=9046 WHERE `entry`=9046;
UPDATE `creature_template` SET `equipment_id`=9047 WHERE `entry`=9047;
UPDATE `creature_template` SET `equipment_id`=9056 WHERE `entry`=9056;
UPDATE `creature_template` SET `equipment_id`=9076 WHERE `entry`=9076;
UPDATE `creature_template` SET `equipment_id`=9078 WHERE `entry`=9078;
UPDATE `creature_template` SET `equipment_id`=9079 WHERE `entry`=9079;
UPDATE `creature_template` SET `equipment_id`=9080 WHERE `entry`=9080;
UPDATE `creature_template` SET `equipment_id`=9081 WHERE `entry`=9081;
UPDATE `creature_template` SET `equipment_id`=9082 WHERE `entry`=9082;
UPDATE `creature_template` SET `equipment_id`=9083 WHERE `entry`=9083;
UPDATE `creature_template` SET `equipment_id`=9450 WHERE `entry`=9450;
UPDATE `creature_template` SET `equipment_id`=9084 WHERE `entry`=9084;
UPDATE `creature_template` SET `equipment_id`=9085 WHERE `entry`=9085;
UPDATE `creature_template` SET `equipment_id`=9086 WHERE `entry`=9086;
UPDATE `creature_template` SET `equipment_id`=9087 WHERE `entry`=9087;
UPDATE `creature_template` SET `equipment_id`=9097 WHERE `entry`=9097;
UPDATE `creature_template` SET `equipment_id`=9098 WHERE `entry`=9098;
UPDATE `creature_template` SET `equipment_id`=9117 WHERE `entry`=9117;
UPDATE `creature_template` SET `equipment_id`=9118 WHERE `entry`=9118;
UPDATE `creature_template` SET `equipment_id`=9119 WHERE `entry`=9119;
UPDATE `creature_template` SET `equipment_id`=9136 WHERE `entry`=9136;
UPDATE `creature_template` SET `equipment_id`=11351 WHERE `entry`=11351;
UPDATE `creature_template` SET `equipment_id`=11864 WHERE `entry`=11864;
UPDATE `creature_template` SET `equipment_id`=11858 WHERE `entry`=11858;
UPDATE `creature_template` SET `equipment_id`=14636 WHERE `entry`=14636;
UPDATE `creature_template` SET `equipment_id`=15455 WHERE `entry`=15455;
UPDATE `creature_template` SET `equipment_id`=9517 WHERE `entry`=9517;
UPDATE `creature_template` SET `equipment_id`=9177 WHERE `entry`=9177;
UPDATE `creature_template` SET `equipment_id`=9179 WHERE `entry`=9179;
UPDATE `creature_template` SET `equipment_id`=9197 WHERE `entry`=9197;
UPDATE `creature_template` SET `equipment_id`=9198 WHERE `entry`=9198;
UPDATE `creature_template` SET `equipment_id`=9199 WHERE `entry`=9199;
UPDATE `creature_template` SET `equipment_id`=9201 WHERE `entry`=9201;
UPDATE `creature_template` SET `equipment_id`=9217 WHERE `entry`=9217;
UPDATE `creature_template` SET `equipment_id`=9237 WHERE `entry`=9237;
UPDATE `creature_template` SET `equipment_id`=9238 WHERE `entry`=9238;
UPDATE `creature_template` SET `equipment_id`=9239 WHERE `entry`=9239;
UPDATE `creature_template` SET `equipment_id`=11142 WHERE `entry`=11142;
UPDATE `creature_template` SET `equipment_id`=9240 WHERE `entry`=9240;
UPDATE `creature_template` SET `equipment_id`=9241 WHERE `entry`=9241;
UPDATE `creature_template` SET `equipment_id`=9257 WHERE `entry`=9257;
UPDATE `creature_template` SET `equipment_id`=9258 WHERE `entry`=9258;
UPDATE `creature_template` SET `equipment_id`=9259 WHERE `entry`=9259;
UPDATE `creature_template` SET `equipment_id`=9263 WHERE `entry`=9263;
UPDATE `creature_template` SET `equipment_id`=9264 WHERE `entry`=9264;
UPDATE `creature_template` SET `equipment_id`=9265 WHERE `entry`=9265;
UPDATE `creature_template` SET `equipment_id`=9266 WHERE `entry`=9266;
UPDATE `creature_template` SET `equipment_id`=9267 WHERE `entry`=9267;
UPDATE `creature_template` SET `equipment_id`=11997 WHERE `entry`=11997;
UPDATE `creature_template` SET `equipment_id`=9269 WHERE `entry`=9269;
UPDATE `creature_template` SET `equipment_id`=9271 WHERE `entry`=9271;
UPDATE `creature_template` SET `equipment_id`=9272 WHERE `entry`=9272;
UPDATE `creature_template` SET `equipment_id`=10667 WHERE `entry`=10667;
UPDATE `creature_template` SET `equipment_id`=9273 WHERE `entry`=9273;
UPDATE `creature_template` SET `equipment_id`=14773 WHERE `entry`=14773;
UPDATE `creature_template` SET `equipment_id`=9298 WHERE `entry`=9298;
UPDATE `creature_template` SET `equipment_id`=9316 WHERE `entry`=9316;
UPDATE `creature_template` SET `equipment_id`=9317 WHERE `entry`=9317;
UPDATE `creature_template` SET `equipment_id`=9319 WHERE `entry`=9319;
UPDATE `creature_template` SET `equipment_id`=9336 WHERE `entry`=9336;
UPDATE `creature_template` SET `equipment_id`=9356 WHERE `entry`=9356;
UPDATE `creature_template` SET `equipment_id`=9398 WHERE `entry`=9398;
UPDATE `creature_template` SET `equipment_id`=10802 WHERE `entry`=10802;
UPDATE `creature_template` SET `equipment_id`=9445 WHERE `entry`=9445;
UPDATE `creature_template` SET `equipment_id`=9448 WHERE `entry`=9448;
UPDATE `creature_template` SET `equipment_id`=9449 WHERE `entry`=9449;
UPDATE `creature_template` SET `equipment_id`=9451 WHERE `entry`=9451;
UPDATE `creature_template` SET `equipment_id`=9452 WHERE `entry`=9452;
UPDATE `creature_template` SET `equipment_id`=10610 WHERE `entry`=10610;
UPDATE `creature_template` SET `equipment_id`=9456 WHERE `entry`=9456;
UPDATE `creature_template` SET `equipment_id`=10049 WHERE `entry`=10049;
UPDATE `creature_template` SET `equipment_id`=9462 WHERE `entry`=9462;
UPDATE `creature_template` SET `equipment_id`=11079 WHERE `entry`=11079;
UPDATE `creature_template` SET `equipment_id`=9464 WHERE `entry`=9464;
UPDATE `creature_template` SET `equipment_id`=10057 WHERE `entry`=10057;
UPDATE `creature_template` SET `equipment_id`=9476 WHERE `entry`=9476;
UPDATE `creature_template` SET `equipment_id`=10379 WHERE `entry`=10379;
UPDATE `creature_template` SET `equipment_id`=9499 WHERE `entry`=9499;
UPDATE `creature_template` SET `equipment_id`=9501 WHERE `entry`=9501;
UPDATE `creature_template` SET `equipment_id`=9503 WHERE `entry`=9503;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=9522;
UPDATE `creature_template` SET `equipment_id`=9523 WHERE `entry`=9523;
UPDATE `creature_template` SET `equipment_id`=9525 WHERE `entry`=9525;
UPDATE `creature_template` SET `equipment_id`=12241 WHERE `entry`=12241;
UPDATE `creature_template` SET `equipment_id`=9528 WHERE `entry`=9528;
UPDATE `creature_template` SET `equipment_id`=9529 WHERE `entry`=9529;
UPDATE `creature_template` SET `equipment_id`=9537 WHERE `entry`=9537;
UPDATE `creature_template` SET `equipment_id`=9538 WHERE `entry`=9538;
UPDATE `creature_template` SET `equipment_id`=9539 WHERE `entry`=9539;
UPDATE `creature_template` SET `equipment_id`=9541 WHERE `entry`=9541;
UPDATE `creature_template` SET `equipment_id`=9543 WHERE `entry`=9543;
UPDATE `creature_template` SET `equipment_id`=9544 WHERE `entry`=9544;
UPDATE `creature_template` SET `equipment_id`=10491 WHERE `entry`=10491;
UPDATE `creature_template` SET `equipment_id`=9545 WHERE `entry`=9545;
UPDATE `creature_template` SET `equipment_id`=9976 WHERE `entry`=9976;
UPDATE `creature_template` SET `equipment_id`=9547 WHERE `entry`=9547;
UPDATE `creature_template` SET `equipment_id`=9549 WHERE `entry`=9549;
UPDATE `creature_template` SET `equipment_id`=9980 WHERE `entry`=9980;
UPDATE `creature_template` SET `equipment_id`=9551 WHERE `entry`=9551;
UPDATE `creature_template` SET `equipment_id`=9552 WHERE `entry`=9552;
UPDATE `creature_template` SET `equipment_id`=9553 WHERE `entry`=9553;
UPDATE `creature_template` SET `equipment_id`=9554 WHERE `entry`=9554;
UPDATE `creature_template` SET `equipment_id`=9559 WHERE `entry`=9559;
UPDATE `creature_template` SET `equipment_id`=10950 WHERE `entry`=10950;
UPDATE `creature_template` SET `equipment_id`=9560 WHERE `entry`=9560;
UPDATE `creature_template` SET `equipment_id`=9561 WHERE `entry`=9561;
UPDATE `creature_template` SET `equipment_id`=9562 WHERE `entry`=9562;
UPDATE `creature_template` SET `equipment_id`=9565 WHERE `entry`=9565;
UPDATE `creature_template` SET `equipment_id`=9568 WHERE `entry`=9568;
UPDATE `creature_template` SET `equipment_id`=16368 WHERE `entry`=16368;
UPDATE `creature_template` SET `equipment_id`=15500 WHERE `entry`=15500;
UPDATE `creature_template` SET `equipment_id`=16157 WHERE `entry`=16157;
UPDATE `creature_template` SET `equipment_id`=9583 WHERE `entry`=9583;
UPDATE `creature_template` SET `equipment_id`=9596 WHERE `entry`=9596;
UPDATE `creature_template` SET `equipment_id`=9604 WHERE `entry`=9604;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=9605;
UPDATE `creature_template` SET `equipment_id`=9616 WHERE `entry`=9616;
UPDATE `creature_template` SET `equipment_id`=9618 WHERE `entry`=9618;
UPDATE `creature_template` SET `equipment_id`=9619 WHERE `entry`=9619;
UPDATE `creature_template` SET `equipment_id`=9620 WHERE `entry`=9620;
UPDATE `creature_template` SET `equipment_id`=9636 WHERE `entry`=9636;
UPDATE `creature_template` SET `equipment_id`=9676 WHERE `entry`=9676;
UPDATE `creature_template` SET `equipment_id`=11042 WHERE `entry`=11042;
UPDATE `creature_template` SET `equipment_id`=9682 WHERE `entry`=9682;
UPDATE `creature_template` SET `equipment_id`=11065 WHERE `entry`=11065;
UPDATE `creature_template` SET `equipment_id`=9692 WHERE `entry`=9692;
UPDATE `creature_template` SET `equipment_id`=9693 WHERE `entry`=9693;
UPDATE `creature_template` SET `equipment_id`=9706 WHERE `entry`=9706;
UPDATE `creature_template` SET `equipment_id`=10360 WHERE `entry`=10360;
UPDATE `creature_template` SET `equipment_id`=9716 WHERE `entry`=9716;
UPDATE `creature_template` SET `equipment_id`=9717 WHERE `entry`=9717;
UPDATE `creature_template` SET `equipment_id`=9718 WHERE `entry`=9718;
UPDATE `creature_template` SET `equipment_id`=10823 WHERE `entry`=10823;
UPDATE `creature_template` SET `equipment_id`=9736 WHERE `entry`=9736;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=9776;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=9777;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=9778;
UPDATE `creature_template` SET `equipment_id`=10460 WHERE `entry`=10460;
UPDATE `creature_template` SET `equipment_id`=9817 WHERE `entry`=9817;
UPDATE `creature_template` SET `equipment_id`=9818 WHERE `entry`=9818;
UPDATE `creature_template` SET `equipment_id`=9819 WHERE `entry`=9819;
UPDATE `creature_template` SET `equipment_id`=11048 WHERE `entry`=11048;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=9876;
UPDATE `creature_template` SET `equipment_id`=15130 WHERE `entry`=15130;
UPDATE `creature_template` SET `equipment_id`=9916 WHERE `entry`=9916;
UPDATE `creature_template` SET `equipment_id`=9956 WHERE `entry`=9956;
UPDATE `creature_template` SET `equipment_id`=9979 WHERE `entry`=9979;
UPDATE `creature_template` SET `equipment_id`=9981 WHERE `entry`=9981;
UPDATE `creature_template` SET `equipment_id`=11074 WHERE `entry`=11074;
UPDATE `creature_template` SET `equipment_id`=9984 WHERE `entry`=9984;
UPDATE `creature_template` SET `equipment_id`=9985 WHERE `entry`=9985;
UPDATE `creature_template` SET `equipment_id`=10941 WHERE `entry`=10941;
UPDATE `creature_template` SET `equipment_id`=9987 WHERE `entry`=9987;
UPDATE `creature_template` SET `equipment_id`=988003 WHERE `entry`=988003;
UPDATE `creature_template` SET `equipment_id`=9988 WHERE `entry`=9988;
UPDATE `creature_template` SET `equipment_id`=9997 WHERE `entry`=9997;
UPDATE `creature_template` SET `equipment_id`=9999 WHERE `entry`=9999;
UPDATE `creature_template` SET `equipment_id`=10000 WHERE `entry`=10000;
UPDATE `creature_template` SET `equipment_id`=10036 WHERE `entry`=10036;
UPDATE `creature_template` SET `equipment_id`=10037 WHERE `entry`=10037;
UPDATE `creature_template` SET `equipment_id`=10923 WHERE `entry`=10923;
UPDATE `creature_template` SET `equipment_id`=10047 WHERE `entry`=10047;
UPDATE `creature_template` SET `equipment_id`=14510 WHERE `entry`=14510;
UPDATE `creature_template` SET `equipment_id`=10048 WHERE `entry`=10048;
UPDATE `creature_template` SET `equipment_id`=9460 WHERE `entry`=9460;
UPDATE `creature_template` SET `equipment_id`=10053 WHERE `entry`=10053;
UPDATE `creature_template` SET `equipment_id`=10054 WHERE `entry`=10054;
UPDATE `creature_template` SET `equipment_id`=10055 WHERE `entry`=10055;
UPDATE `creature_template` SET `equipment_id`=10486 WHERE `entry`=10486;
UPDATE `creature_template` SET `equipment_id`=10062 WHERE `entry`=10062;
UPDATE `creature_template` SET `equipment_id`=10063 WHERE `entry`=10063;
UPDATE `creature_template` SET `equipment_id`=10079 WHERE `entry`=10079;
UPDATE `creature_template` SET `equipment_id`=10082 WHERE `entry`=10082;
UPDATE `creature_template` SET `equipment_id`=10086 WHERE `entry`=10086;
UPDATE `creature_template` SET `equipment_id`=10088 WHERE `entry`=10088;
UPDATE `creature_template` SET `equipment_id`=10089 WHERE `entry`=10089;
UPDATE `creature_template` SET `equipment_id`=10090 WHERE `entry`=10090;
UPDATE `creature_template` SET `equipment_id`=15075 WHERE `entry`=15075;
UPDATE `creature_template` SET `equipment_id`=10118 WHERE `entry`=10118;
UPDATE `creature_template` SET `equipment_id`=10263 WHERE `entry`=10263;
UPDATE `creature_template` SET `equipment_id`=10136 WHERE `entry`=10136;
UPDATE `creature_template` SET `equipment_id`=10162 WHERE `entry`=10162;
UPDATE `creature_template` SET `equipment_id`=10182 WHERE `entry`=10182;
UPDATE `creature_template` SET `equipment_id`=10196 WHERE `entry`=10196;
UPDATE `creature_template` SET `equipment_id`=10216 WHERE `entry`=10216;
UPDATE `creature_template` SET `equipment_id`=10258 WHERE `entry`=10258;
UPDATE `creature_template` SET `equipment_id`=11140 WHERE `entry`=11140;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=10262;
UPDATE `creature_template` SET `equipment_id`=10264 WHERE `entry`=10264;
UPDATE `creature_template` SET `equipment_id`=10266 WHERE `entry`=10266;
UPDATE `creature_template` SET `equipment_id`=10267 WHERE `entry`=10267;
UPDATE `creature_template` SET `equipment_id`=10277 WHERE `entry`=10277;
UPDATE `creature_template` SET `equipment_id`=10278 WHERE `entry`=10278;
UPDATE `creature_template` SET `equipment_id`=10293 WHERE `entry`=10293;
UPDATE `creature_template` SET `equipment_id`=10300 WHERE `entry`=10300;
UPDATE `creature_template` SET `equipment_id`=10301 WHERE `entry`=10301;
UPDATE `creature_template` SET `equipment_id`=11180 WHERE `entry`=11180;
UPDATE `creature_template` SET `equipment_id`=10302 WHERE `entry`=10302;
UPDATE `creature_template` SET `equipment_id`=10303 WHERE `entry`=10303;
UPDATE `creature_template` SET `equipment_id`=10304 WHERE `entry`=10304;
UPDATE `creature_template` SET `equipment_id`=10305 WHERE `entry`=10305;
UPDATE `creature_template` SET `equipment_id`=10306 WHERE `entry`=10306;
UPDATE `creature_template` SET `equipment_id`=10307 WHERE `entry`=10307;
UPDATE `creature_template` SET `equipment_id`=10316 WHERE `entry`=10316;
UPDATE `creature_template` SET `equipment_id`=10317 WHERE `entry`=10317;
UPDATE `creature_template` SET `equipment_id`=11260 WHERE `entry`=11260;
UPDATE `creature_template` SET `equipment_id`=10318 WHERE `entry`=10318;
UPDATE `creature_template` SET `equipment_id`=10323 WHERE `entry`=10323;
UPDATE `creature_template` SET `equipment_id`=12178 WHERE `entry`=12178;
UPDATE `creature_template` SET `equipment_id`=11751 WHERE `entry`=11751;
UPDATE `creature_template` SET `equipment_id`=10361 WHERE `entry`=10361;
UPDATE `creature_template` SET `equipment_id`=10363 WHERE `entry`=10363;
UPDATE `creature_template` SET `equipment_id`=10364 WHERE `entry`=10364;
UPDATE `creature_template` SET `equipment_id`=10366 WHERE `entry`=10366;
UPDATE `creature_template` SET `equipment_id`=11753 WHERE `entry`=11753;
UPDATE `creature_template` SET `equipment_id`=10367 WHERE `entry`=10367;
UPDATE `creature_template` SET `equipment_id`=10369 WHERE `entry`=10369;
UPDATE `creature_template` SET `equipment_id`=12051 WHERE `entry`=12051;
UPDATE `creature_template` SET `equipment_id`=10371 WHERE `entry`=10371;
UPDATE `creature_template` SET `equipment_id`=10372 WHERE `entry`=10372;
UPDATE `creature_template` SET `equipment_id`=11029 WHERE `entry`=11029;
UPDATE `creature_template` SET `equipment_id`=11033 WHERE `entry`=11033;
UPDATE `creature_template` SET `equipment_id`=10377 WHERE `entry`=10377;
UPDATE `creature_template` SET `equipment_id`=10378 WHERE `entry`=10378;
UPDATE `creature_template` SET `equipment_id`=10380 WHERE `entry`=10380;
UPDATE `creature_template` SET `equipment_id`=11037 WHERE `entry`=11037;
UPDATE `creature_template` SET `equipment_id`=11548 WHERE `entry`=11548;
UPDATE `creature_template` SET `equipment_id`=11105 WHERE `entry`=11105;
UPDATE `creature_template` SET `equipment_id`=10390 WHERE `entry`=10390;
UPDATE `creature_template` SET `equipment_id`=10391 WHERE `entry`=10391;
UPDATE `creature_template` SET `equipment_id`=11620 WHERE `entry`=11620;
UPDATE `creature_template` SET `equipment_id`=10394 WHERE `entry`=10394;
UPDATE `creature_template` SET `equipment_id`=10398 WHERE `entry`=10398;
UPDATE `creature_template` SET `equipment_id`=10399 WHERE `entry`=10399;
UPDATE `creature_template` SET `equipment_id`=10400 WHERE `entry`=10400;
UPDATE `creature_template` SET `equipment_id`=11057 WHERE `entry`=11057;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=11582;
UPDATE `creature_template` SET `equipment_id`=10418 WHERE `entry`=10418;
UPDATE `creature_template` SET `equipment_id`=10419 WHERE `entry`=10419;
UPDATE `creature_template` SET `equipment_id`=10420 WHERE `entry`=10420;
UPDATE `creature_template` SET `equipment_id`=10421 WHERE `entry`=10421;
UPDATE `creature_template` SET `equipment_id`=10422 WHERE `entry`=10422;
UPDATE `creature_template` SET `equipment_id`=10423 WHERE `entry`=10423;
UPDATE `creature_template` SET `equipment_id`=10424 WHERE `entry`=10424;
UPDATE `creature_template` SET `equipment_id`=11017 WHERE `entry`=11017;
UPDATE `creature_template` SET `equipment_id`=10425 WHERE `entry`=10425;
UPDATE `creature_template` SET `equipment_id`=10426 WHERE `entry`=10426;
UPDATE `creature_template` SET `equipment_id`=12043 WHERE `entry`=12043;
UPDATE `creature_template` SET `equipment_id`=10427 WHERE `entry`=10427;
UPDATE `creature_template` SET `equipment_id`=10428 WHERE `entry`=10428;
UPDATE `creature_template` SET `equipment_id`=10429 WHERE `entry`=10429;
UPDATE `creature_template` SET `equipment_id`=10431 WHERE `entry`=10431;
UPDATE `creature_template` SET `equipment_id`=11814 WHERE `entry`=11814;
UPDATE `creature_template` SET `equipment_id`=10433 WHERE `entry`=10433;
UPDATE `creature_template` SET `equipment_id`=10438 WHERE `entry`=10438;
UPDATE `creature_template` SET `equipment_id`=11604 WHERE `entry`=11604;
UPDATE `creature_template` SET `equipment_id`=10440 WHERE `entry`=10440;
UPDATE `creature_template` SET `equipment_id`=11097 WHERE `entry`=11097;
UPDATE `creature_template` SET `equipment_id`=11822 WHERE `entry`=11822;
UPDATE `creature_template` SET `equipment_id`=10447 WHERE `entry`=10447;
UPDATE `creature_template` SET `equipment_id`=11821 WHERE `entry`=11821;
UPDATE `creature_template` SET `equipment_id`=10455 WHERE `entry`=10455;
UPDATE `creature_template` SET `equipment_id`=11829 WHERE `entry`=11829;
UPDATE `creature_template` SET `equipment_id`=10456 WHERE `entry`=10456;
UPDATE `creature_template` SET `equipment_id`=11177 WHERE `entry`=11177;
UPDATE `creature_template` SET `equipment_id`=11838 WHERE `entry`=11838;
UPDATE `creature_template` SET `equipment_id`=11837 WHERE `entry`=11837;
UPDATE `creature_template` SET `equipment_id`=11121 WHERE `entry`=11121;
UPDATE `creature_template` SET `equipment_id`=10468 WHERE `entry`=10468;
UPDATE `creature_template` SET `equipment_id`=10469 WHERE `entry`=10469;
UPDATE `creature_template` SET `equipment_id`=10470 WHERE `entry`=10470;
UPDATE `creature_template` SET `equipment_id`=10471 WHERE `entry`=10471;
UPDATE `creature_template` SET `equipment_id`=10472 WHERE `entry`=10472;
UPDATE `creature_template` SET `equipment_id`=10475 WHERE `entry`=10475;
UPDATE `creature_template` SET `equipment_id`=10476 WHERE `entry`=10476;
UPDATE `creature_template` SET `equipment_id`=10477 WHERE `entry`=10477;
UPDATE `creature_template` SET `equipment_id`=11073 WHERE `entry`=11073;
UPDATE `creature_template` SET `equipment_id`=10487 WHERE `entry`=10487;
UPDATE `creature_template` SET `equipment_id`=10489 WHERE `entry`=10489;
UPDATE `creature_template` SET `equipment_id`=11596 WHERE `entry`=11596;
UPDATE `creature_template` SET `equipment_id`=10502 WHERE `entry`=10502;
UPDATE `creature_template` SET `equipment_id`=11441 WHERE `entry`=11441;
UPDATE `creature_template` SET `equipment_id`=10503 WHERE `entry`=10503;
UPDATE `creature_template` SET `equipment_id`=10504 WHERE `entry`=10504;
UPDATE `creature_template` SET `equipment_id`=10505 WHERE `entry`=10505;
UPDATE `creature_template` SET `equipment_id`=10509 WHERE `entry`=10509;
UPDATE `creature_template` SET `equipment_id`=10537 WHERE `entry`=10537;
UPDATE `creature_template` SET `equipment_id`=10840 WHERE `entry`=10840;
UPDATE `creature_template` SET `equipment_id`=10539 WHERE `entry`=10539;
UPDATE `creature_template` SET `equipment_id`=11866 WHERE `entry`=11866;
UPDATE `creature_template` SET `equipment_id`=10540 WHERE `entry`=10540;
UPDATE `creature_template` SET `equipment_id`=12239 WHERE `entry`=12239;
UPDATE `creature_template` SET `equipment_id`=10556 WHERE `entry`=10556;
UPDATE `creature_template` SET `equipment_id`=11439 WHERE `entry`=11439;
UPDATE `creature_template` SET `equipment_id`=10924 WHERE `entry`=10924;
UPDATE `creature_template` SET `equipment_id`=10558 WHERE `entry`=10558;
UPDATE `creature_template` SET `equipment_id`=12248 WHERE `entry`=12248;
UPDATE `creature_template` SET `equipment_id`=10559 WHERE `entry`=10559;
UPDATE `creature_template` SET `equipment_id`=10944 WHERE `entry`=10944;
UPDATE `creature_template` SET `equipment_id`=10578 WHERE `entry`=10578;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=11811;
UPDATE `creature_template` SET `equipment_id`=10948 WHERE `entry`=10948;
UPDATE `creature_template` SET `equipment_id`=10584 WHERE `entry`=10584;
UPDATE `creature_template` SET `equipment_id`=10600 WHERE `entry`=10600;
UPDATE `creature_template` SET `equipment_id`=10601 WHERE `entry`=10601;
UPDATE `creature_template` SET `equipment_id`=10602 WHERE `entry`=10602;
UPDATE `creature_template` SET `equipment_id`=10604 WHERE `entry`=10604;
UPDATE `creature_template` SET `equipment_id`=10605 WHERE `entry`=10605;
UPDATE `creature_template` SET `equipment_id`=10606 WHERE `entry`=10606;
UPDATE `creature_template` SET `equipment_id`=10608 WHERE `entry`=10608;
UPDATE `creature_template` SET `equipment_id`=13539 WHERE `entry`=13539;
UPDATE `creature_template` SET `equipment_id`=10611 WHERE `entry`=10611;
UPDATE `creature_template` SET `equipment_id`=10612 WHERE `entry`=10612;
UPDATE `creature_template` SET `equipment_id`=10618 WHERE `entry`=10618;
UPDATE `creature_template` SET `equipment_id`=13557 WHERE `entry`=13557;
UPDATE `creature_template` SET `equipment_id`=10781 WHERE `entry`=10781;
UPDATE `creature_template` SET `equipment_id`=10637 WHERE `entry`=10637;
UPDATE `creature_template` SET `equipment_id`=10638 WHERE `entry`=10638;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=10639;
UPDATE `creature_template` SET `equipment_id`=10643 WHERE `entry`=10643;
UPDATE `creature_template` SET `equipment_id`=10645 WHERE `entry`=10645;
UPDATE `creature_template` SET `equipment_id`=10646 WHERE `entry`=10646;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=10647;
UPDATE `creature_template` SET `equipment_id`=10857 WHERE `entry`=10857;
UPDATE `creature_template` SET `equipment_id`=10801 WHERE `entry`=10801;
UPDATE `creature_template` SET `equipment_id`=11318 WHERE `entry`=11318;
UPDATE `creature_template` SET `equipment_id`=10805 WHERE `entry`=10805;
UPDATE `creature_template` SET `equipment_id`=11316 WHERE `entry`=11316;
UPDATE `creature_template` SET `equipment_id`=10665 WHERE `entry`=10665;
UPDATE `creature_template` SET `equipment_id`=11835 WHERE `entry`=11835;
UPDATE `creature_template` SET `equipment_id`=10676 WHERE `entry`=10676;
UPDATE `creature_template` SET `equipment_id`=10680 WHERE `entry`=10680;
UPDATE `creature_template` SET `equipment_id`=10761 WHERE `entry`=10761;
UPDATE `creature_template` SET `equipment_id`=10681 WHERE `entry`=10681;
UPDATE `creature_template` SET `equipment_id`=11278 WHERE `entry`=11278;
UPDATE `creature_template` SET `equipment_id`=10682 WHERE `entry`=10682;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=10683;
UPDATE `creature_template` SET `equipment_id`=10696 WHERE `entry`=10696;
UPDATE `creature_template` SET `equipment_id`=11867 WHERE `entry`=11867;
UPDATE `creature_template` SET `equipment_id`=11382 WHERE `entry`=11382;
UPDATE `creature_template` SET `equipment_id`=10742 WHERE `entry`=10742;
UPDATE `creature_template` SET `equipment_id`=10758 WHERE `entry`=10758;
UPDATE `creature_template` SET `equipment_id`=10759 WHERE `entry`=10759;
UPDATE `creature_template` SET `equipment_id`=10760 WHERE `entry`=10760;
UPDATE `creature_template` SET `equipment_id`=14229 WHERE `entry`=14229;
UPDATE `creature_template` SET `equipment_id`=10782 WHERE `entry`=10782;
UPDATE `creature_template` SET `equipment_id`=10803 WHERE `entry`=10803;
UPDATE `creature_template` SET `equipment_id`=11682 WHERE `entry`=11682;
UPDATE `creature_template` SET `equipment_id`=10804 WHERE `entry`=10804;
UPDATE `creature_template` SET `equipment_id`=10811 WHERE `entry`=10811;
UPDATE `creature_template` SET `equipment_id`=10812 WHERE `entry`=10812;
UPDATE `creature_template` SET `equipment_id`=10814 WHERE `entry`=10814;
UPDATE `creature_template` SET `equipment_id`=10817 WHERE `entry`=10817;
UPDATE `creature_template` SET `equipment_id`=10822 WHERE `entry`=10822;
UPDATE `creature_template` SET `equipment_id`=10824 WHERE `entry`=10824;
UPDATE `creature_template` SET `equipment_id`=10826 WHERE `entry`=10826;
UPDATE `creature_template` SET `equipment_id`=10827 WHERE `entry`=10827;
UPDATE `creature_template` SET `equipment_id`=10828 WHERE `entry`=10828;
UPDATE `creature_template` SET `equipment_id`=10837 WHERE `entry`=10837;
UPDATE `creature_template` SET `equipment_id`=10838 WHERE `entry`=10838;
UPDATE `creature_template` SET `equipment_id`=12225 WHERE `entry`=12225;
UPDATE `creature_template` SET `equipment_id`=10839 WHERE `entry`=10839;
UPDATE `creature_template` SET `equipment_id`=10856 WHERE `entry`=10856;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=10877;
UPDATE `creature_template` SET `equipment_id`=988006 WHERE `entry`=988006;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=10878;
UPDATE `creature_template` SET `equipment_id`=10879 WHERE `entry`=10879;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=10880;
UPDATE `creature_template` SET `equipment_id`=10881 WHERE `entry`=10881;
UPDATE `creature_template` SET `equipment_id`=10896 WHERE `entry`=10896;
UPDATE `creature_template` SET `equipment_id`=10897 WHERE `entry`=10897;
UPDATE `creature_template` SET `equipment_id`=10899 WHERE `entry`=10899;
UPDATE `creature_template` SET `equipment_id`=10901 WHERE `entry`=10901;
UPDATE `creature_template` SET `equipment_id`=10917 WHERE `entry`=10917;
UPDATE `creature_template` SET `equipment_id`=10920 WHERE `entry`=10920;
UPDATE `creature_template` SET `equipment_id`=10921 WHERE `entry`=10921;
UPDATE `creature_template` SET `equipment_id`=10922 WHERE `entry`=10922;
UPDATE `creature_template` SET `equipment_id`=10929 WHERE `entry`=10929;
UPDATE `creature_template` SET `equipment_id`=10930 WHERE `entry`=10930;
UPDATE `creature_template` SET `equipment_id`=10937 WHERE `entry`=10937;
UPDATE `creature_template` SET `equipment_id`=12046 WHERE `entry`=12046;
UPDATE `creature_template` SET `equipment_id`=10938 WHERE `entry`=10938;
UPDATE `creature_template` SET `equipment_id`=10939 WHERE `entry`=10939;
UPDATE `creature_template` SET `equipment_id`=12118 WHERE `entry`=12118;
UPDATE `creature_template` SET `equipment_id`=11603 WHERE `entry`=11603;
UPDATE `creature_template` SET `equipment_id`=10947 WHERE `entry`=10947;
UPDATE `creature_template` SET `equipment_id`=10949 WHERE `entry`=10949;
UPDATE `creature_template` SET `equipment_id`=12116 WHERE `entry`=12116;
UPDATE `creature_template` SET `equipment_id`=10952 WHERE `entry`=10952;
UPDATE `creature_template` SET `equipment_id`=12126 WHERE `entry`=12126;
UPDATE `creature_template` SET `equipment_id`=10954 WHERE `entry`=10954;
UPDATE `creature_template` SET `equipment_id`=11611 WHERE `entry`=11611;
UPDATE `creature_template` SET `equipment_id`=10976 WHERE `entry`=10976;
UPDATE `creature_template` SET `equipment_id`=10977 WHERE `entry`=10977;
UPDATE `creature_template` SET `equipment_id`=10978 WHERE `entry`=10978;
UPDATE `creature_template` SET `equipment_id`=10982 WHERE `entry`=10982;
UPDATE `creature_template` SET `equipment_id`=10983 WHERE `entry`=10983;
UPDATE `creature_template` SET `equipment_id`=10987 WHERE `entry`=10987;
UPDATE `creature_template` SET `equipment_id`=10991 WHERE `entry`=10991;
UPDATE `creature_template` SET `equipment_id`=12156 WHERE `entry`=12156;
UPDATE `creature_template` SET `equipment_id`=10993 WHERE `entry`=10993;
UPDATE `creature_template` SET `equipment_id`=10996 WHERE `entry`=10996;
UPDATE `creature_template` SET `equipment_id`=10997 WHERE `entry`=10997;
UPDATE `creature_template` SET `equipment_id`=11019 WHERE `entry`=11019;
UPDATE `creature_template` SET `equipment_id`=11450 WHERE `entry`=11450;
UPDATE `creature_template` SET `equipment_id`=11022 WHERE `entry`=11022;
UPDATE `creature_template` SET `equipment_id`=11023 WHERE `entry`=11023;
UPDATE `creature_template` SET `equipment_id`=11025 WHERE `entry`=11025;
UPDATE `creature_template` SET `equipment_id`=11026 WHERE `entry`=11026;
UPDATE `creature_template` SET `equipment_id`=11028 WHERE `entry`=11028;
UPDATE `creature_template` SET `equipment_id`=11911 WHERE `entry`=11911;
UPDATE `creature_template` SET `equipment_id`=11031 WHERE `entry`=11031;
UPDATE `creature_template` SET `equipment_id`=11032 WHERE `entry`=11032;
UPDATE `creature_template` SET `equipment_id`=11034 WHERE `entry`=11034;
UPDATE `creature_template` SET `equipment_id`=11035 WHERE `entry`=11035;
UPDATE `creature_template` SET `equipment_id`=11036 WHERE `entry`=11036;
UPDATE `creature_template` SET `equipment_id`=11038 WHERE `entry`=11038;
UPDATE `creature_template` SET `equipment_id`=11913 WHERE `entry`=11913;
UPDATE `creature_template` SET `equipment_id`=11039 WHERE `entry`=11039;
UPDATE `creature_template` SET `equipment_id`=11040 WHERE `entry`=11040;
UPDATE `creature_template` SET `equipment_id`=11041 WHERE `entry`=11041;
UPDATE `creature_template` SET `equipment_id`=11043 WHERE `entry`=11043;
UPDATE `creature_template` SET `equipment_id`=11346 WHERE `entry`=11346;
UPDATE `creature_template` SET `equipment_id`=11044 WHERE `entry`=11044;
UPDATE `creature_template` SET `equipment_id`=11863 WHERE `entry`=11863;
UPDATE `creature_template` SET `equipment_id`=11046 WHERE `entry`=11046;
UPDATE `creature_template` SET `equipment_id`=11712 WHERE `entry`=11712;
UPDATE `creature_template` SET `equipment_id`=11857 WHERE `entry`=11857;
UPDATE `creature_template` SET `equipment_id`=11047 WHERE `entry`=11047;
UPDATE `creature_template` SET `equipment_id`=11049 WHERE `entry`=11049;
UPDATE `creature_template` SET `equipment_id`=11051 WHERE `entry`=11051;
UPDATE `creature_template` SET `equipment_id`=11052 WHERE `entry`=11052;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=11871;
UPDATE `creature_template` SET `equipment_id`=11053 WHERE `entry`=11053;
UPDATE `creature_template` SET `equipment_id`=11054 WHERE `entry`=11054;
UPDATE `creature_template` SET `equipment_id`=11720 WHERE `entry`=11720;
UPDATE `creature_template` SET `equipment_id`=11865 WHERE `entry`=11865;
UPDATE `creature_template` SET `equipment_id`=11055 WHERE `entry`=11055;
UPDATE `creature_template` SET `equipment_id`=11056 WHERE `entry`=11056;
UPDATE `creature_template` SET `equipment_id`=11066 WHERE `entry`=11066;
UPDATE `creature_template` SET `equipment_id`=11067 WHERE `entry`=11067;
UPDATE `creature_template` SET `equipment_id`=11068 WHERE `entry`=11068;
UPDATE `creature_template` SET `equipment_id`=11070 WHERE `entry`=11070;
UPDATE `creature_template` SET `equipment_id`=11071 WHERE `entry`=11071;
UPDATE `creature_template` SET `equipment_id`=11076 WHERE `entry`=11076;
UPDATE `creature_template` SET `equipment_id`=11077 WHERE `entry`=11077;
UPDATE `creature_template` SET `equipment_id`=12017 WHERE `entry`=12017;
UPDATE `creature_template` SET `equipment_id`=11083 WHERE `entry`=11083;
UPDATE `creature_template` SET `equipment_id`=11084 WHERE `entry`=11084;
UPDATE `creature_template` SET `equipment_id`=12031 WHERE `entry`=12031;
UPDATE `creature_template` SET `equipment_id`=11096 WHERE `entry`=11096;
UPDATE `creature_template` SET `equipment_id`=11099 WHERE `entry`=11099;
UPDATE `creature_template` SET `equipment_id`=11466 WHERE `entry`=11466;
UPDATE `creature_template` SET `equipment_id`=11102 WHERE `entry`=11102;
UPDATE `creature_template` SET `equipment_id`=13518 WHERE `entry`=13518;
UPDATE `creature_template` SET `equipment_id`=11820 WHERE `entry`=11820;
UPDATE `creature_template` SET `equipment_id`=11104 WHERE `entry`=11104;
UPDATE `creature_template` SET `equipment_id`=11106 WHERE `entry`=11106;
UPDATE `creature_template` SET `equipment_id`=11116 WHERE `entry`=11116;
UPDATE `creature_template` SET `equipment_id`=11117 WHERE `entry`=11117;
UPDATE `creature_template` SET `equipment_id`=11118 WHERE `entry`=11118;
UPDATE `creature_template` SET `equipment_id`=11119 WHERE `entry`=11119;
UPDATE `creature_template` SET `equipment_id`=11120 WHERE `entry`=11120;
UPDATE `creature_template` SET `equipment_id`=11137 WHERE `entry`=11137;
UPDATE `creature_template` SET `equipment_id`=11138 WHERE `entry`=11138;
UPDATE `creature_template` SET `equipment_id`=11139 WHERE `entry`=11139;
UPDATE `creature_template` SET `equipment_id`=13840 WHERE `entry`=13840;
UPDATE `creature_template` SET `equipment_id`=11143 WHERE `entry`=11143;
UPDATE `creature_template` SET `equipment_id`=11145 WHERE `entry`=11145;
UPDATE `creature_template` SET `equipment_id`=11806 WHERE `entry`=11806;
UPDATE `creature_template` SET `equipment_id`=11146 WHERE `entry`=11146;
UPDATE `creature_template` SET `equipment_id`=11878 WHERE `entry`=11878;
UPDATE `creature_template` SET `equipment_id`=11176 WHERE `entry`=11176;
UPDATE `creature_template` SET `equipment_id`=11178 WHERE `entry`=11178;
UPDATE `creature_template` SET `equipment_id`=11323 WHERE `entry`=11323;
UPDATE `creature_template` SET `equipment_id`=11182 WHERE `entry`=11182;
UPDATE `creature_template` SET `equipment_id`=11183 WHERE `entry`=11183;
UPDATE `creature_template` SET `equipment_id`=11184 WHERE `entry`=11184;
UPDATE `creature_template` SET `equipment_id`=11185 WHERE `entry`=11185;
UPDATE `creature_template` SET `equipment_id`=11186 WHERE `entry`=11186;
UPDATE `creature_template` SET `equipment_id`=11187 WHERE `entry`=11187;
UPDATE `creature_template` SET `equipment_id`=11188 WHERE `entry`=11188;
UPDATE `creature_template` SET `equipment_id`=11189 WHERE `entry`=11189;
UPDATE `creature_template` SET `equipment_id`=11191 WHERE `entry`=11191;
UPDATE `creature_template` SET `equipment_id`=11192 WHERE `entry`=11192;
UPDATE `creature_template` SET `equipment_id`=11193 WHERE `entry`=11193;
UPDATE `creature_template` SET `equipment_id`=11790 WHERE `entry`=11790;
UPDATE `creature_template` SET `equipment_id`=11194 WHERE `entry`=11194;
UPDATE `creature_template` SET `equipment_id`=11196 WHERE `entry`=11196;
UPDATE `creature_template` SET `equipment_id`=11218 WHERE `entry`=11218;
UPDATE `creature_template` SET `equipment_id`=11257 WHERE `entry`=11257;
UPDATE `creature_template` SET `equipment_id`=11339 WHERE `entry`=11339;
UPDATE `creature_template` SET `equipment_id`=11259 WHERE `entry`=11259;
UPDATE `creature_template` SET `equipment_id`=11261 WHERE `entry`=11261;
UPDATE `creature_template` SET `equipment_id`=11276 WHERE `entry`=11276;
UPDATE `creature_template` SET `equipment_id`=11277 WHERE `entry`=11277;
UPDATE `creature_template` SET `equipment_id`=11280 WHERE `entry`=11280;
UPDATE `creature_template` SET `equipment_id`=12160 WHERE `entry`=12160;
UPDATE `creature_template` SET `equipment_id`=11285 WHERE `entry`=11285;
UPDATE `creature_template` SET `equipment_id`=11286 WHERE `entry`=11286;
UPDATE `creature_template` SET `equipment_id`=11287 WHERE `entry`=11287;
UPDATE `creature_template` SET `equipment_id`=11289 WHERE `entry`=11289;
UPDATE `creature_template` SET `equipment_id`=11296 WHERE `entry`=11296;
UPDATE `creature_template` SET `equipment_id`=11317 WHERE `entry`=11317;
UPDATE `creature_template` SET `equipment_id`=12196 WHERE `entry`=12196;
UPDATE `creature_template` SET `equipment_id`=11322 WHERE `entry`=11322;
UPDATE `creature_template` SET `equipment_id`=11324 WHERE `entry`=11324;
UPDATE `creature_template` SET `equipment_id`=12204 WHERE `entry`=12204;
UPDATE `creature_template` SET `equipment_id`=11340 WHERE `entry`=11340;
UPDATE `creature_template` SET `equipment_id`=11347 WHERE `entry`=11347;
UPDATE `creature_template` SET `equipment_id`=11348 WHERE `entry`=11348;
UPDATE `creature_template` SET `equipment_id`=11350 WHERE `entry`=11350;
UPDATE `creature_template` SET `equipment_id`=11353 WHERE `entry`=11353;
UPDATE `creature_template` SET `equipment_id`=11355 WHERE `entry`=11355;
UPDATE `creature_template` SET `equipment_id`=11356 WHERE `entry`=11356;
UPDATE `creature_template` SET `equipment_id`=12236 WHERE `entry`=12236;
UPDATE `creature_template` SET `equipment_id`=11380 WHERE `entry`=11380;
UPDATE `creature_template` SET `equipment_id`=11383 WHERE `entry`=11383;
UPDATE `creature_template` SET `equipment_id`=11387 WHERE `entry`=11387;
UPDATE `creature_template` SET `equipment_id`=11388 WHERE `entry`=11388;
UPDATE `creature_template` SET `equipment_id`=11389 WHERE `entry`=11389;
UPDATE `creature_template` SET `equipment_id`=11390 WHERE `entry`=11390;
UPDATE `creature_template` SET `equipment_id`=11391 WHERE `entry`=11391;
UPDATE `creature_template` SET `equipment_id`=13087 WHERE `entry`=13087;
UPDATE `creature_template` SET `equipment_id`=11438 WHERE `entry`=11438;
UPDATE `creature_template` SET `equipment_id`=11440 WHERE `entry`=11440;
UPDATE `creature_template` SET `equipment_id`=11442 WHERE `entry`=11442;
UPDATE `creature_template` SET `equipment_id`=11445 WHERE `entry`=11445;
UPDATE `creature_template` SET `equipment_id`=11451 WHERE `entry`=11451;
UPDATE `creature_template` SET `equipment_id`=11452 WHERE `entry`=11452;
UPDATE `creature_template` SET `equipment_id`=12045 WHERE `entry`=12045;
UPDATE `creature_template` SET `equipment_id`=11456 WHERE `entry`=11456;
UPDATE `creature_template` SET `equipment_id`=11467 WHERE `entry`=11467;
UPDATE `creature_template` SET `equipment_id`=11470 WHERE `entry`=11470;
UPDATE `creature_template` SET `equipment_id`=13151 WHERE `entry`=13151;
UPDATE `creature_template` SET `equipment_id`=12197 WHERE `entry`=12197;
UPDATE `creature_template` SET `equipment_id`=12205 WHERE `entry`=12205;
UPDATE `creature_template` SET `equipment_id`=11486 WHERE `entry`=11486;
UPDATE `creature_template` SET `equipment_id`=11488 WHERE `entry`=11488;
UPDATE `creature_template` SET `equipment_id`=11498 WHERE `entry`=11498;
UPDATE `creature_template` SET `equipment_id`=11517 WHERE `entry`=11517;
UPDATE `creature_template` SET `equipment_id`=11519 WHERE `entry`=11519;
UPDATE `creature_template` SET `equipment_id`=11536 WHERE `entry`=11536;
UPDATE `creature_template` SET `equipment_id`=11546 WHERE `entry`=11546;
UPDATE `creature_template` SET `equipment_id`=12942 WHERE `entry`=12942;
UPDATE `creature_template` SET `equipment_id`=11856 WHERE `entry`=11856;
UPDATE `creature_template` SET `equipment_id`=11860 WHERE `entry`=11860;
UPDATE `creature_template` SET `equipment_id`=11600 WHERE `entry`=11600;
UPDATE `creature_template` SET `equipment_id`=11605 WHERE `entry`=11605;
UPDATE `creature_template` SET `equipment_id`=11609 WHERE `entry`=11609;
UPDATE `creature_template` SET `equipment_id`=11610 WHERE `entry`=11610;
UPDATE `creature_template` SET `equipment_id`=11613 WHERE `entry`=11613;
UPDATE `creature_template` SET `equipment_id`=11615 WHERE `entry`=11615;
UPDATE `creature_template` SET `equipment_id`=11616 WHERE `entry`=11616;
UPDATE `creature_template` SET `equipment_id`=11621 WHERE `entry`=11621;
UPDATE `creature_template` SET `equipment_id`=11624 WHERE `entry`=11624;
UPDATE `creature_template` SET `equipment_id`=11625 WHERE `entry`=11625;
UPDATE `creature_template` SET `equipment_id`=11629 WHERE `entry`=11629;
UPDATE `creature_template` SET `equipment_id`=11656 WHERE `entry`=11656;
UPDATE `creature_template` SET `equipment_id`=11657 WHERE `entry`=11657;
UPDATE `creature_template` SET `equipment_id`=11662 WHERE `entry`=11662;
UPDATE `creature_template` SET `equipment_id`=11664 WHERE `entry`=11664;
UPDATE `creature_template` SET `equipment_id`=11877 WHERE `entry`=11877;
UPDATE `creature_template` SET `equipment_id`=11881 WHERE `entry`=11881;
UPDATE `creature_template` SET `equipment_id`=11677 WHERE `entry`=11677;
UPDATE `creature_template` SET `equipment_id`=11679 WHERE `entry`=11679;
UPDATE `creature_template` SET `equipment_id`=11680 WHERE `entry`=11680;
UPDATE `creature_template` SET `equipment_id`=11681 WHERE `entry`=11681;
UPDATE `creature_template` SET `equipment_id`=11683 WHERE `entry`=11683;
UPDATE `creature_template` SET `equipment_id`=11687 WHERE `entry`=11687;
UPDATE `creature_template` SET `equipment_id`=11833 WHERE `entry`=11833;
UPDATE `creature_template` SET `equipment_id`=11696 WHERE `entry`=11696;
UPDATE `creature_template` SET `equipment_id`=11697 WHERE `entry`=11697;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=11701;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=11702;
UPDATE `creature_template` SET `equipment_id`=11703 WHERE `entry`=11703;
UPDATE `creature_template` SET `equipment_id`=11706 WHERE `entry`=11706;
UPDATE `creature_template` SET `equipment_id`=11708 WHERE `entry`=11708;
UPDATE `creature_template` SET `equipment_id`=11709 WHERE `entry`=11709;
UPDATE `creature_template` SET `equipment_id`=11711 WHERE `entry`=11711;
UPDATE `creature_template` SET `equipment_id`=11713 WHERE `entry`=11713;
UPDATE `creature_template` SET `equipment_id`=11714 WHERE `entry`=11714;
UPDATE `creature_template` SET `equipment_id`=11715 WHERE `entry`=11715;
UPDATE `creature_template` SET `equipment_id`=13089 WHERE `entry`=13089;
UPDATE `creature_template` SET `equipment_id`=11716 WHERE `entry`=11716;
UPDATE `creature_template` SET `equipment_id`=11861 WHERE `entry`=11861;
UPDATE `creature_template` SET `equipment_id`=11718 WHERE `entry`=11718;
UPDATE `creature_template` SET `equipment_id`=11869 WHERE `entry`=11869;
UPDATE `creature_template` SET `equipment_id`=11937 WHERE `entry`=11937;
UPDATE `creature_template` SET `equipment_id`=11949 WHERE `entry`=11949;
UPDATE `creature_template` SET `equipment_id`=11749 WHERE `entry`=11749;
UPDATE `creature_template` SET `equipment_id`=11752 WHERE `entry`=11752;
UPDATE `creature_template` SET `equipment_id`=11754 WHERE `entry`=11754;
UPDATE `creature_template` SET `equipment_id`=11755 WHERE `entry`=11755;
UPDATE `creature_template` SET `equipment_id`=11901 WHERE `entry`=11901;
UPDATE `creature_template` SET `equipment_id`=11792 WHERE `entry`=11792;
UPDATE `creature_template` SET `equipment_id`=11793 WHERE `entry`=11793;
UPDATE `creature_template` SET `equipment_id`=11794 WHERE `entry`=11794;
UPDATE `creature_template` SET `equipment_id`=11803 WHERE `entry`=11803;
UPDATE `creature_template` SET `equipment_id`=11804 WHERE `entry`=11804;
UPDATE `creature_template` SET `equipment_id`=11805 WHERE `entry`=11805;
UPDATE `creature_template` SET `equipment_id`=11807 WHERE `entry`=11807;
UPDATE `creature_template` SET `equipment_id`=11808 WHERE `entry`=11808;
UPDATE `creature_template` SET `equipment_id`=13525 WHERE `entry`=13525;
UPDATE `creature_template` SET `equipment_id`=11823 WHERE `entry`=11823;
UPDATE `creature_template` SET `equipment_id`=13522 WHERE `entry`=13522;
UPDATE `creature_template` SET `equipment_id`=13219 WHERE `entry`=13219;
UPDATE `creature_template` SET `equipment_id`=11830 WHERE `entry`=11830;
UPDATE `creature_template` SET `equipment_id`=11831 WHERE `entry`=11831;
UPDATE `creature_template` SET `equipment_id`=11839 WHERE `entry`=11839;
UPDATE `creature_template` SET `equipment_id`=13529 WHERE `entry`=13529;
UPDATE `creature_template` SET `equipment_id`=11868 WHERE `entry`=11868;
UPDATE `creature_template` SET `equipment_id`=11870 WHERE `entry`=11870;
UPDATE `creature_template` SET `equipment_id`=11872 WHERE `entry`=11872;
UPDATE `creature_template` SET `equipment_id`=11876 WHERE `entry`=11876;
UPDATE `creature_template` SET `equipment_id`=11880 WHERE `entry`=11880;
UPDATE `creature_template` SET `equipment_id`=11882 WHERE `entry`=11882;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=11883;
UPDATE `creature_template` SET `equipment_id`=11886 WHERE `entry`=11886;
UPDATE `creature_template` SET `equipment_id`=11887 WHERE `entry`=11887;
UPDATE `creature_template` SET `equipment_id`=11898 WHERE `entry`=11898;
UPDATE `creature_template` SET `equipment_id`=11899 WHERE `entry`=11899;
UPDATE `creature_template` SET `equipment_id`=11900 WHERE `entry`=11900;
UPDATE `creature_template` SET `equipment_id`=11910 WHERE `entry`=11910;
UPDATE `creature_template` SET `equipment_id`=11912 WHERE `entry`=11912;
UPDATE `creature_template` SET `equipment_id`=11946 WHERE `entry`=11946;
UPDATE `creature_template` SET `equipment_id`=11948 WHERE `entry`=11948;
UPDATE `creature_template` SET `equipment_id`=13356 WHERE `entry`=13356;
UPDATE `creature_template` SET `equipment_id`=11998 WHERE `entry`=11998;
UPDATE `creature_template` SET `equipment_id`=12018 WHERE `entry`=12018;
UPDATE `creature_template` SET `equipment_id`=12021 WHERE `entry`=12021;
UPDATE `creature_template` SET `equipment_id`=12024 WHERE `entry`=12024;
UPDATE `creature_template` SET `equipment_id`=12025 WHERE `entry`=12025;
UPDATE `creature_template` SET `equipment_id`=12026 WHERE `entry`=12026;
UPDATE `creature_template` SET `equipment_id`=988004 WHERE `entry`=988004;
UPDATE `creature_template` SET `equipment_id`=12030 WHERE `entry`=12030;
UPDATE `creature_template` SET `equipment_id`=12042 WHERE `entry`=12042;
UPDATE `creature_template` SET `equipment_id`=12048 WHERE `entry`=12048;
UPDATE `creature_template` SET `equipment_id`=12050 WHERE `entry`=12050;
UPDATE `creature_template` SET `equipment_id`=12052 WHERE `entry`=12052;
UPDATE `creature_template` SET `equipment_id`=12053 WHERE `entry`=12053;
UPDATE `creature_template` SET `equipment_id`=12097 WHERE `entry`=12097;
UPDATE `creature_template` SET `equipment_id`=12127 WHERE `entry`=12127;
UPDATE `creature_template` SET `equipment_id`=12128 WHERE `entry`=12128;
UPDATE `creature_template` SET `equipment_id`=12129 WHERE `entry`=12129;
UPDATE `creature_template` SET `equipment_id`=12136 WHERE `entry`=12136;
UPDATE `creature_template` SET `equipment_id`=12137 WHERE `entry`=12137;
UPDATE `creature_template` SET `equipment_id`=12157 WHERE `entry`=12157;
UPDATE `creature_template` SET `equipment_id`=12158 WHERE `entry`=12158;
UPDATE `creature_template` SET `equipment_id`=12179 WHERE `entry`=12179;
UPDATE `creature_template` SET `equipment_id`=12198 WHERE `entry`=12198;
UPDATE `creature_template` SET `equipment_id`=12240 WHERE `entry`=12240;
UPDATE `creature_template` SET `equipment_id`=12242 WHERE `entry`=12242;
UPDATE `creature_template` SET `equipment_id`=13616 WHERE `entry`=13616;
UPDATE `creature_template` SET `equipment_id`=12243 WHERE `entry`=12243;
UPDATE `creature_template` SET `equipment_id`=12245 WHERE `entry`=12245;
UPDATE `creature_template` SET `equipment_id`=12259 WHERE `entry`=12259;
UPDATE `creature_template` SET `equipment_id`=12264 WHERE `entry`=12264;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=12319;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=12321;
UPDATE `creature_template` SET `equipment_id`=15709 WHERE `entry`=15709;
UPDATE `creature_template` SET `equipment_id`=16076 WHERE `entry`=16076;
UPDATE `creature_template` SET `equipment_id`=12322 WHERE `entry`=12322;
UPDATE `creature_template` SET `equipment_id`=12337 WHERE `entry`=12337;
UPDATE `creature_template` SET `equipment_id`=13216 WHERE `entry`=13216;
UPDATE `creature_template` SET `equipment_id`=12338 WHERE `entry`=12338;
UPDATE `creature_template` SET `equipment_id`=12340 WHERE `entry`=12340;
UPDATE `creature_template` SET `equipment_id`=15062 WHERE `entry`=15062;
UPDATE `creature_template` SET `equipment_id`=13220 WHERE `entry`=13220;
UPDATE `creature_template` SET `equipment_id`=13737 WHERE `entry`=13737;
UPDATE `creature_template` SET `equipment_id`=13296 WHERE `entry`=13296;
UPDATE `creature_template` SET `equipment_id`=15869 WHERE `entry`=15869;
UPDATE `creature_template` SET `equipment_id`=14322 WHERE `entry`=14322;
UPDATE `creature_template` SET `equipment_id`=13817 WHERE `entry`=13817;
UPDATE `creature_template` SET `equipment_id`=14625 WHERE `entry`=14625;
UPDATE `creature_template` SET `equipment_id`=12369 WHERE `entry`=12369;
UPDATE `creature_template` SET `equipment_id`=13097 WHERE `entry`=13097;
UPDATE `creature_template` SET `equipment_id`=12379 WHERE `entry`=12379;
UPDATE `creature_template` SET `equipment_id`=12380 WHERE `entry`=12380;
UPDATE `creature_template` SET `equipment_id`=12384 WHERE `entry`=12384;
UPDATE `creature_template` SET `equipment_id`=14226 WHERE `entry`=14226;
UPDATE `creature_template` SET `equipment_id`=12397 WHERE `entry`=12397;
UPDATE `creature_template` SET `equipment_id`=12416 WHERE `entry`=12416;
UPDATE `creature_template` SET `equipment_id`=12420 WHERE `entry`=12420;
UPDATE `creature_template` SET `equipment_id`=12422 WHERE `entry`=12422;
UPDATE `creature_template` SET `equipment_id`=12423 WHERE `entry`=12423;
UPDATE `creature_template` SET `equipment_id`=12425 WHERE `entry`=12425;
UPDATE `creature_template` SET `equipment_id`=13598 WHERE `entry`=13598;
UPDATE `creature_template` SET `equipment_id`=12427 WHERE `entry`=12427;
UPDATE `creature_template` SET `equipment_id`=12962 WHERE `entry`=12962;
UPDATE `creature_template` SET `equipment_id`=15634 WHERE `entry`=15634;
UPDATE `creature_template` SET `equipment_id`=12429 WHERE `entry`=12429;
UPDATE `creature_template` SET `equipment_id`=12430 WHERE `entry`=12430;
UPDATE `creature_template` SET `equipment_id`=13153 WHERE `entry`=13153;
UPDATE `creature_template` SET `equipment_id`=12457 WHERE `entry`=12457;
UPDATE `creature_template` SET `equipment_id`=12458 WHERE `entry`=12458;
UPDATE `creature_template` SET `equipment_id`=12459 WHERE `entry`=12459;
UPDATE `creature_template` SET `equipment_id`=12460 WHERE `entry`=12460;
UPDATE `creature_template` SET `equipment_id`=13117 WHERE `entry`=13117;
UPDATE `creature_template` SET `equipment_id`=12461 WHERE `entry`=12461;
UPDATE `creature_template` SET `equipment_id`=12463 WHERE `entry`=12463;
UPDATE `creature_template` SET `equipment_id`=12464 WHERE `entry`=12464;
UPDATE `creature_template` SET `equipment_id`=12465 WHERE `entry`=12465;
UPDATE `creature_template` SET `equipment_id`=12468 WHERE `entry`=12468;
UPDATE `creature_template` SET `equipment_id`=12474 WHERE `entry`=12474;
UPDATE `creature_template` SET `equipment_id`=12477 WHERE `entry`=12477;
UPDATE `creature_template` SET `equipment_id`=12480 WHERE `entry`=12480;
UPDATE `creature_template` SET `equipment_id`=13137 WHERE `entry`=13137;
UPDATE `creature_template` SET `equipment_id`=12481 WHERE `entry`=12481;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=12496;
UPDATE `creature_template` SET `equipment_id`=13217 WHERE `entry`=13217;
UPDATE `creature_template` SET `equipment_id`=14903 WHERE `entry`=14903;
UPDATE `creature_template` SET `equipment_id`=12557 WHERE `entry`=12557;
UPDATE `creature_template` SET `equipment_id`=12576 WHERE `entry`=12576;
UPDATE `creature_template` SET `equipment_id`=12577 WHERE `entry`=12577;
UPDATE `creature_template` SET `equipment_id`=15453 WHERE `entry`=15453;
UPDATE `creature_template` SET `equipment_id`=12578 WHERE `entry`=12578;
UPDATE `creature_template` SET `equipment_id`=12580 WHERE `entry`=12580;
UPDATE `creature_template` SET `equipment_id`=15611 WHERE `entry`=15611;
UPDATE `creature_template` SET `equipment_id`=12616 WHERE `entry`=12616;
UPDATE `creature_template` SET `equipment_id`=12617 WHERE `entry`=12617;
UPDATE `creature_template` SET `equipment_id`=13519 WHERE `entry`=13519;
UPDATE `creature_template` SET `equipment_id`=12636 WHERE `entry`=12636;
UPDATE `creature_template` SET `equipment_id`=12657 WHERE `entry`=12657;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=12658;
UPDATE `creature_template` SET `equipment_id`=12696 WHERE `entry`=12696;
UPDATE `creature_template` SET `equipment_id`=13535 WHERE `entry`=13535;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=15410;
UPDATE `creature_template` SET `equipment_id`=12717 WHERE `entry`=12717;
UPDATE `creature_template` SET `equipment_id`=12719 WHERE `entry`=12719;
UPDATE `creature_template` SET `equipment_id`=12720 WHERE `entry`=12720;
UPDATE `creature_template` SET `equipment_id`=12721 WHERE `entry`=12721;
UPDATE `creature_template` SET `equipment_id`=13318 WHERE `entry`=13318;
UPDATE `creature_template` SET `equipment_id`=12805 WHERE `entry`=12805;
UPDATE `creature_template` SET `equipment_id`=12736 WHERE `entry`=12736;
UPDATE `creature_template` SET `equipment_id`=12737 WHERE `entry`=12737;
UPDATE `creature_template` SET `equipment_id`=12738 WHERE `entry`=12738;
UPDATE `creature_template` SET `equipment_id`=12739 WHERE `entry`=12739;
UPDATE `creature_template` SET `equipment_id`=12740 WHERE `entry`=12740;
UPDATE `creature_template` SET `equipment_id`=12756 WHERE `entry`=12756;
UPDATE `creature_template` SET `equipment_id`=13476 WHERE `entry`=13476;
UPDATE `creature_template` SET `equipment_id`=12776 WHERE `entry`=12776;
UPDATE `creature_template` SET `equipment_id`=12921 WHERE `entry`=12921;
UPDATE `creature_template` SET `equipment_id`=12778 WHERE `entry`=12778;
UPDATE `creature_template` SET `equipment_id`=12779 WHERE `entry`=12779;
UPDATE `creature_template` SET `equipment_id`=12780 WHERE `entry`=12780;
UPDATE `creature_template` SET `equipment_id`=12781 WHERE `entry`=12781;
UPDATE `creature_template` SET `equipment_id`=12783 WHERE `entry`=12783;
UPDATE `creature_template` SET `equipment_id`=12786 WHERE `entry`=12786;
UPDATE `creature_template` SET `equipment_id`=12788 WHERE `entry`=12788;
UPDATE `creature_template` SET `equipment_id`=12789 WHERE `entry`=12789;
UPDATE `creature_template` SET `equipment_id`=12790 WHERE `entry`=12790;
UPDATE `creature_template` SET `equipment_id`=12791 WHERE `entry`=12791;
UPDATE `creature_template` SET `equipment_id`=12796 WHERE `entry`=12796;
UPDATE `creature_template` SET `equipment_id`=12877 WHERE `entry`=12877;
UPDATE `creature_template` SET `equipment_id`=12797 WHERE `entry`=12797;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=12799;
UPDATE `creature_template` SET `equipment_id`=12807 WHERE `entry`=12807;
UPDATE `creature_template` SET `equipment_id`=12816 WHERE `entry`=12816;
UPDATE `creature_template` SET `equipment_id`=12837 WHERE `entry`=12837;
UPDATE `creature_template` SET `equipment_id`=12856 WHERE `entry`=12856;
UPDATE `creature_template` SET `equipment_id`=12858 WHERE `entry`=12858;
UPDATE `creature_template` SET `equipment_id`=12859 WHERE `entry`=12859;
UPDATE `creature_template` SET `equipment_id`=13738 WHERE `entry`=13738;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=12860;
UPDATE `creature_template` SET `equipment_id`=12862 WHERE `entry`=12862;
UPDATE `creature_template` SET `equipment_id`=13528 WHERE `entry`=13528;
UPDATE `creature_template` SET `equipment_id`=12863 WHERE `entry`=12863;
UPDATE `creature_template` SET `equipment_id`=12784 WHERE `entry`=12784;
UPDATE `creature_template` SET `equipment_id`=12865 WHERE `entry`=12865;
UPDATE `creature_template` SET `equipment_id`=12866 WHERE `entry`=12866;
UPDATE `creature_template` SET `equipment_id`=12867 WHERE `entry`=12867;
UPDATE `creature_template` SET `equipment_id`=12896 WHERE `entry`=12896;
UPDATE `creature_template` SET `equipment_id`=12897 WHERE `entry`=12897;
UPDATE `creature_template` SET `equipment_id`=12902 WHERE `entry`=12902;
UPDATE `creature_template` SET `equipment_id`=14225 WHERE `entry`=14225;
UPDATE `creature_template` SET `equipment_id`=12903 WHERE `entry`=12903;
UPDATE `creature_template` SET `equipment_id`=16283 WHERE `entry`=16283;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=12918;
UPDATE `creature_template` SET `equipment_id`=15846 WHERE `entry`=15846;
UPDATE `creature_template` SET `equipment_id`=12919 WHERE `entry`=12919;
UPDATE `creature_template` SET `equipment_id`=12920 WHERE `entry`=12920;
UPDATE `creature_template` SET `equipment_id`=12939 WHERE `entry`=12939;
UPDATE `creature_template` SET `equipment_id`=12941 WHERE `entry`=12941;
UPDATE `creature_template` SET `equipment_id`=16146 WHERE `entry`=16146;
UPDATE `creature_template` SET `equipment_id`=12943 WHERE `entry`=12943;
UPDATE `creature_template` SET `equipment_id`=12944 WHERE `entry`=12944;
UPDATE `creature_template` SET `equipment_id`=16226 WHERE `entry`=16226;
UPDATE `creature_template` SET `equipment_id`=12957 WHERE `entry`=12957;
UPDATE `creature_template` SET `equipment_id`=12958 WHERE `entry`=12958;
UPDATE `creature_template` SET `equipment_id`=12959 WHERE `entry`=12959;
UPDATE `creature_template` SET `equipment_id`=14188 WHERE `entry`=14188;
UPDATE `creature_template` SET `equipment_id`=12960 WHERE `entry`=12960;
UPDATE `creature_template` SET `equipment_id`=12961 WHERE `entry`=12961;
UPDATE `creature_template` SET `equipment_id`=12977 WHERE `entry`=12977;
UPDATE `creature_template` SET `equipment_id`=12996 WHERE `entry`=12996;
UPDATE `creature_template` SET `equipment_id`=15703 WHERE `entry`=15703;
UPDATE `creature_template` SET `equipment_id`=12998 WHERE `entry`=12998;
UPDATE `creature_template` SET `equipment_id`=13000 WHERE `entry`=13000;
UPDATE `creature_template` SET `equipment_id`=13358 WHERE `entry`=13358;
UPDATE `creature_template` SET `equipment_id`=13018 WHERE `entry`=13018;
UPDATE `creature_template` SET `equipment_id`=13739 WHERE `entry`=13739;
UPDATE `creature_template` SET `equipment_id`=14392 WHERE `entry`=14392;
UPDATE `creature_template` SET `equipment_id`=13019 WHERE `entry`=13019;
UPDATE `creature_template` SET `equipment_id`=13076 WHERE `entry`=13076;
UPDATE `creature_template` SET `equipment_id`=13078 WHERE `entry`=13078;
UPDATE `creature_template` SET `equipment_id`=13079 WHERE `entry`=13079;
UPDATE `creature_template` SET `equipment_id`=13080 WHERE `entry`=13080;
UPDATE `creature_template` SET `equipment_id`=13081 WHERE `entry`=13081;
UPDATE `creature_template` SET `equipment_id`=13084 WHERE `entry`=13084;
UPDATE `creature_template` SET `equipment_id`=12428 WHERE `entry`=12428;
UPDATE `creature_template` SET `equipment_id`=13085 WHERE `entry`=13085;
UPDATE `creature_template` SET `equipment_id`=13086 WHERE `entry`=13086;
UPDATE `creature_template` SET `equipment_id`=13088 WHERE `entry`=13088;
UPDATE `creature_template` SET `equipment_id`=13096 WHERE `entry`=13096;
UPDATE `creature_template` SET `equipment_id`=13098 WHERE `entry`=13098;
UPDATE `creature_template` SET `equipment_id`=13099 WHERE `entry`=13099;
UPDATE `creature_template` SET `equipment_id`=13116 WHERE `entry`=13116;
UPDATE `creature_template` SET `equipment_id`=13118 WHERE `entry`=13118;
UPDATE `creature_template` SET `equipment_id`=13138 WHERE `entry`=13138;
UPDATE `creature_template` SET `equipment_id`=13139 WHERE `entry`=13139;
UPDATE `creature_template` SET `equipment_id`=13140 WHERE `entry`=13140;
UPDATE `creature_template` SET `equipment_id`=13143 WHERE `entry`=13143;
UPDATE `creature_template` SET `equipment_id`=13144 WHERE `entry`=13144;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=13145;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=13146;
UPDATE `creature_template` SET `equipment_id`=13147 WHERE `entry`=13147;
UPDATE `creature_template` SET `equipment_id`=15906 WHERE `entry`=15906;
UPDATE `creature_template` SET `equipment_id`=13149 WHERE `entry`=13149;
UPDATE `creature_template` SET `equipment_id`=13150 WHERE `entry`=13150;
UPDATE `creature_template` SET `equipment_id`=13152 WHERE `entry`=13152;
UPDATE `creature_template` SET `equipment_id`=13154 WHERE `entry`=13154;
UPDATE `creature_template` SET `equipment_id`=13155 WHERE `entry`=13155;
UPDATE `creature_template` SET `equipment_id`=13157 WHERE `entry`=13157;
UPDATE `creature_template` SET `equipment_id`=13158 WHERE `entry`=13158;
UPDATE `creature_template` SET `equipment_id`=13159 WHERE `entry`=13159;
UPDATE `creature_template` SET `equipment_id`=13176 WHERE `entry`=13176;
UPDATE `creature_template` SET `equipment_id`=13177 WHERE `entry`=13177;
UPDATE `creature_template` SET `equipment_id`=13179 WHERE `entry`=13179;
UPDATE `creature_template` SET `equipment_id`=13546 WHERE `entry`=13546;
UPDATE `creature_template` SET `equipment_id`=13180 WHERE `entry`=13180;
UPDATE `creature_template` SET `equipment_id`=13181 WHERE `entry`=13181;
UPDATE `creature_template` SET `equipment_id`=16093 WHERE `entry`=16093;
UPDATE `creature_template` SET `equipment_id`=13218 WHERE `entry`=13218;
UPDATE `creature_template` SET `equipment_id`=13236 WHERE `entry`=13236;
UPDATE `creature_template` SET `equipment_id`=13257 WHERE `entry`=13257;
UPDATE `creature_template` SET `equipment_id`=13996 WHERE `entry`=13996;
UPDATE `creature_template` SET `equipment_id`=13427 WHERE `entry`=13427;
UPDATE `creature_template` SET `equipment_id`=13283 WHERE `entry`=13283;
UPDATE `creature_template` SET `equipment_id`=13284 WHERE `entry`=13284;
UPDATE `creature_template` SET `equipment_id`=13297 WHERE `entry`=13297;
UPDATE `creature_template` SET `equipment_id`=13298 WHERE `entry`=13298;
UPDATE `creature_template` SET `equipment_id`=13299 WHERE `entry`=13299;
UPDATE `creature_template` SET `equipment_id`=13300 WHERE `entry`=13300;
UPDATE `creature_template` SET `equipment_id`=13316 WHERE `entry`=13316;
UPDATE `creature_template` SET `equipment_id`=13317 WHERE `entry`=13317;
UPDATE `creature_template` SET `equipment_id`=13319 WHERE `entry`=13319;
UPDATE `creature_template` SET `equipment_id`=13320 WHERE `entry`=13320;
UPDATE `creature_template` SET `equipment_id`=14264 WHERE `entry`=14264;
UPDATE `creature_template` SET `equipment_id`=13324 WHERE `entry`=13324;
UPDATE `creature_template` SET `equipment_id`=13325 WHERE `entry`=13325;
UPDATE `creature_template` SET `equipment_id`=13326 WHERE `entry`=13326;
UPDATE `creature_template` SET `equipment_id`=13327 WHERE `entry`=13327;
UPDATE `creature_template` SET `equipment_id`=13328 WHERE `entry`=13328;
UPDATE `creature_template` SET `equipment_id`=13329 WHERE `entry`=13329;
UPDATE `creature_template` SET `equipment_id`=13330 WHERE `entry`=13330;
UPDATE `creature_template` SET `equipment_id`=14733 WHERE `entry`=14733;
UPDATE `creature_template` SET `equipment_id`=13331 WHERE `entry`=13331;
UPDATE `creature_template` SET `equipment_id`=13332 WHERE `entry`=13332;
UPDATE `creature_template` SET `equipment_id`=13333 WHERE `entry`=13333;
UPDATE `creature_template` SET `equipment_id`=13334 WHERE `entry`=13334;
UPDATE `creature_template` SET `equipment_id`=13335 WHERE `entry`=13335;
UPDATE `creature_template` SET `equipment_id`=13336 WHERE `entry`=13336;
UPDATE `creature_template` SET `equipment_id`=13337 WHERE `entry`=13337;
UPDATE `creature_template` SET `equipment_id`=13357 WHERE `entry`=13357;
UPDATE `creature_template` SET `equipment_id`=13359 WHERE `entry`=13359;
UPDATE `creature_template` SET `equipment_id`=13377 WHERE `entry`=13377;
UPDATE `creature_template` SET `equipment_id`=13396 WHERE `entry`=13396;
UPDATE `creature_template` SET `equipment_id`=13397 WHERE `entry`=13397;
UPDATE `creature_template` SET `equipment_id`=13417 WHERE `entry`=13417;
UPDATE `creature_template` SET `equipment_id`=13421 WHERE `entry`=13421;
UPDATE `creature_template` SET `equipment_id`=13422 WHERE `entry`=13422;
UPDATE `creature_template` SET `equipment_id`=13424 WHERE `entry`=13424;
UPDATE `creature_template` SET `equipment_id`=13425 WHERE `entry`=13425;
UPDATE `creature_template` SET `equipment_id`=14304 WHERE `entry`=14304;
UPDATE `creature_template` SET `equipment_id`=13426 WHERE `entry`=13426;
UPDATE `creature_template` SET `equipment_id`=14829 WHERE `entry`=14829;
UPDATE `creature_template` SET `equipment_id`=13428 WHERE `entry`=13428;
UPDATE `creature_template` SET `equipment_id`=14827 WHERE `entry`=14827;
UPDATE `creature_template` SET `equipment_id`=13437 WHERE `entry`=13437;
UPDATE `creature_template` SET `equipment_id`=12777 WHERE `entry`=12777;
UPDATE `creature_template` SET `equipment_id`=13438 WHERE `entry`=13438;
UPDATE `creature_template` SET `equipment_id`=13439 WHERE `entry`=13439;
UPDATE `creature_template` SET `equipment_id`=13440 WHERE `entry`=13440;
UPDATE `creature_template` SET `equipment_id`=13441 WHERE `entry`=13441;
UPDATE `creature_template` SET `equipment_id`=13442 WHERE `entry`=13442;
UPDATE `creature_template` SET `equipment_id`=13443 WHERE `entry`=13443;
UPDATE `creature_template` SET `equipment_id`=14101 WHERE `entry`=14101;
UPDATE `creature_template` SET `equipment_id`=13444 WHERE `entry`=13444;
UPDATE `creature_template` SET `equipment_id`=13446 WHERE `entry`=13446;
UPDATE `creature_template` SET `equipment_id`=15127 WHERE `entry`=15127;
UPDATE `creature_template` SET `equipment_id`=13447 WHERE `entry`=13447;
UPDATE `creature_template` SET `equipment_id`=13448 WHERE `entry`=13448;
UPDATE `creature_template` SET `equipment_id`=13449 WHERE `entry`=13449;
UPDATE `creature_template` SET `equipment_id`=13524 WHERE `entry`=13524;
UPDATE `creature_template` SET `equipment_id`=13526 WHERE `entry`=13526;
UPDATE `creature_template` SET `equipment_id`=13527 WHERE `entry`=13527;
UPDATE `creature_template` SET `equipment_id`=13530 WHERE `entry`=13530;
UPDATE `creature_template` SET `equipment_id`=13531 WHERE `entry`=13531;
UPDATE `creature_template` SET `equipment_id`=14905 WHERE `entry`=14905;
UPDATE `creature_template` SET `equipment_id`=14754 WHERE `entry`=14754;
UPDATE `creature_template` SET `equipment_id`=13534 WHERE `entry`=13534;
UPDATE `creature_template` SET `equipment_id`=13536 WHERE `entry`=13536;
UPDATE `creature_template` SET `equipment_id`=13537 WHERE `entry`=13537;
UPDATE `creature_template` SET `equipment_id`=13538 WHERE `entry`=13538;
UPDATE `creature_template` SET `equipment_id`=13540 WHERE `entry`=13540;
UPDATE `creature_template` SET `equipment_id`=13541 WHERE `entry`=13541;
UPDATE `creature_template` SET `equipment_id`=13542 WHERE `entry`=13542;
UPDATE `creature_template` SET `equipment_id`=13543 WHERE `entry`=13543;
UPDATE `creature_template` SET `equipment_id`=13544 WHERE `entry`=13544;
UPDATE `creature_template` SET `equipment_id`=13545 WHERE `entry`=13545;
UPDATE `creature_template` SET `equipment_id`=13547 WHERE `entry`=13547;
UPDATE `creature_template` SET `equipment_id`=13548 WHERE `entry`=13548;
UPDATE `creature_template` SET `equipment_id`=13549 WHERE `entry`=13549;
UPDATE `creature_template` SET `equipment_id`=13550 WHERE `entry`=13550;
UPDATE `creature_template` SET `equipment_id`=13551 WHERE `entry`=13551;
UPDATE `creature_template` SET `equipment_id`=13552 WHERE `entry`=13552;
UPDATE `creature_template` SET `equipment_id`=13553 WHERE `entry`=13553;
UPDATE `creature_template` SET `equipment_id`=13554 WHERE `entry`=13554;
UPDATE `creature_template` SET `equipment_id`=13556 WHERE `entry`=13556;
UPDATE `creature_template` SET `equipment_id`=13576 WHERE `entry`=13576;
UPDATE `creature_template` SET `equipment_id`=14523 WHERE `entry`=14523;
UPDATE `creature_template` SET `equipment_id`=13577 WHERE `entry`=13577;
UPDATE `creature_template` SET `equipment_id`=13597 WHERE `entry`=13597;
UPDATE `creature_template` SET `equipment_id`=15308 WHERE `entry`=15308;
UPDATE `creature_template` SET `equipment_id`=13617 WHERE `entry`=13617;
UPDATE `creature_template` SET `equipment_id`=14509 WHERE `entry`=14509;
UPDATE `creature_template` SET `equipment_id`=13656 WHERE `entry`=13656;
UPDATE `creature_template` SET `equipment_id`=13841 WHERE `entry`=13841;
UPDATE `creature_template` SET `equipment_id`=13697 WHERE `entry`=13697;
UPDATE `creature_template` SET `equipment_id`=13740 WHERE `entry`=13740;
UPDATE `creature_template` SET `equipment_id`=13741 WHERE `entry`=13741;
UPDATE `creature_template` SET `equipment_id`=13742 WHERE `entry`=13742;
UPDATE `creature_template` SET `equipment_id`=13776 WHERE `entry`=13776;
UPDATE `creature_template` SET `equipment_id`=13777 WHERE `entry`=13777;
UPDATE `creature_template` SET `equipment_id`=13797 WHERE `entry`=13797;
UPDATE `creature_template` SET `equipment_id`=13798 WHERE `entry`=13798;
UPDATE `creature_template` SET `equipment_id`=13816 WHERE `entry`=13816;
UPDATE `creature_template` SET `equipment_id`=13842 WHERE `entry`=13842;
UPDATE `creature_template` SET `equipment_id`=13843 WHERE `entry`=13843;
UPDATE `creature_template` SET `equipment_id`=13917 WHERE `entry`=13917;
UPDATE `creature_template` SET `equipment_id`=15138 WHERE `entry`=15138;
UPDATE `creature_template` SET `equipment_id`=13956 WHERE `entry`=13956;
UPDATE `creature_template` SET `equipment_id`=13957 WHERE `entry`=13957;
UPDATE `creature_template` SET `equipment_id`=13958 WHERE `entry`=13958;
UPDATE `creature_template` SET `equipment_id`=14021 WHERE `entry`=14021;
UPDATE `creature_template` SET `equipment_id`=14026 WHERE `entry`=14026;
UPDATE `creature_template` SET `equipment_id`=14027 WHERE `entry`=14027;
UPDATE `creature_template` SET `equipment_id`=14377 WHERE `entry`=14377;
UPDATE `creature_template` SET `equipment_id`=14028 WHERE `entry`=14028;
UPDATE `creature_template` SET `equipment_id`=14029 WHERE `entry`=14029;
UPDATE `creature_template` SET `equipment_id`=14030 WHERE `entry`=14030;
UPDATE `creature_template` SET `equipment_id`=14031 WHERE `entry`=14031;
UPDATE `creature_template` SET `equipment_id`=14182 WHERE `entry`=14182;
UPDATE `creature_template` SET `equipment_id`=14183 WHERE `entry`=14183;
UPDATE `creature_template` SET `equipment_id`=14185 WHERE `entry`=14185;
UPDATE `creature_template` SET `equipment_id`=14186 WHERE `entry`=14186;
UPDATE `creature_template` SET `equipment_id`=14187 WHERE `entry`=14187;
UPDATE `creature_template` SET `equipment_id`=14221 WHERE `entry`=14221;
UPDATE `creature_template` SET `equipment_id`=14230 WHERE `entry`=14230;
UPDATE `creature_template` SET `equipment_id`=14439 WHERE `entry`=14439;
UPDATE `creature_template` SET `equipment_id`=13520 WHERE `entry`=13520;
UPDATE `creature_template` SET `equipment_id`=14262 WHERE `entry`=14262;
UPDATE `creature_template` SET `equipment_id`=14263 WHERE `entry`=14263;
UPDATE `creature_template` SET `equipment_id`=14267 WHERE `entry`=14267;
UPDATE `creature_template` SET `equipment_id`=14271 WHERE `entry`=14271;
UPDATE `creature_template` SET `equipment_id`=14275 WHERE `entry`=14275;
UPDATE `creature_template` SET `equipment_id`=14278 WHERE `entry`=14278;
UPDATE `creature_template` SET `equipment_id`=14423 WHERE `entry`=14423;
UPDATE `creature_template` SET `equipment_id`=14281 WHERE `entry`=14281;
UPDATE `creature_template` SET `equipment_id`=14284 WHERE `entry`=14284;
UPDATE `creature_template` SET `equipment_id`=14626 WHERE `entry`=14626;
UPDATE `creature_template` SET `equipment_id`=14285 WHERE `entry`=14285;
UPDATE `creature_template` SET `equipment_id`=14301 WHERE `entry`=14301;
UPDATE `creature_template` SET `equipment_id`=14321 WHERE `entry`=14321;
UPDATE `creature_template` SET `equipment_id`=14324 WHERE `entry`=14324;
UPDATE `creature_template` SET `equipment_id`=14325 WHERE `entry`=14325;
UPDATE `creature_template` SET `equipment_id`=14326 WHERE `entry`=14326;
UPDATE `creature_template` SET `equipment_id`=14327 WHERE `entry`=14327;
UPDATE `creature_template` SET `equipment_id`=15793 WHERE `entry`=15793;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=14342;
UPDATE `creature_template` SET `equipment_id`=14351 WHERE `entry`=14351;
UPDATE `creature_template` SET `equipment_id`=14363 WHERE `entry`=14363;
UPDATE `creature_template` SET `equipment_id`=14364 WHERE `entry`=14364;
UPDATE `creature_template` SET `equipment_id`=14365 WHERE `entry`=14365;
UPDATE `creature_template` SET `equipment_id`=14367 WHERE `entry`=14367;
UPDATE `creature_template` SET `equipment_id`=14368 WHERE `entry`=14368;
UPDATE `creature_template` SET `equipment_id`=15184 WHERE `entry`=15184;
UPDATE `creature_template` SET `equipment_id`=16064 WHERE `entry`=16064;
UPDATE `creature_template` SET `equipment_id`=14375 WHERE `entry`=14375;
UPDATE `creature_template` SET `equipment_id`=14376 WHERE `entry`=14376;
UPDATE `creature_template` SET `equipment_id`=14378 WHERE `entry`=14378;
UPDATE `creature_template` SET `equipment_id`=14381 WHERE `entry`=14381;
UPDATE `creature_template` SET `equipment_id`=16072 WHERE `entry`=16072;
UPDATE `creature_template` SET `equipment_id`=14382 WHERE `entry`=14382;
UPDATE `creature_template` SET `equipment_id`=14383 WHERE `entry`=14383;
UPDATE `creature_template` SET `equipment_id`=15264 WHERE `entry`=15264;
UPDATE `creature_template` SET `equipment_id`=15777 WHERE `entry`=15777;
UPDATE `creature_template` SET `equipment_id`=16080 WHERE `entry`=16080;
UPDATE `creature_template` SET `equipment_id`=14390 WHERE `entry`=14390;
UPDATE `creature_template` SET `equipment_id`=14393 WHERE `entry`=14393;
UPDATE `creature_template` SET `equipment_id`=15276 WHERE `entry`=15276;
UPDATE `creature_template` SET `equipment_id`=14402 WHERE `entry`=14402;
UPDATE `creature_template` SET `equipment_id`=14403 WHERE `entry`=14403;
UPDATE `creature_template` SET `equipment_id`=15863 WHERE `entry`=15863;
UPDATE `creature_template` SET `equipment_id`=14404 WHERE `entry`=14404;
UPDATE `creature_template` SET `equipment_id`=14425 WHERE `entry`=14425;
UPDATE `creature_template` SET `equipment_id`=14426 WHERE `entry`=14426;
UPDATE `creature_template` SET `equipment_id`=14427 WHERE `entry`=14427;
UPDATE `creature_template` SET `equipment_id`=14432 WHERE `entry`=14432;
UPDATE `creature_template` SET `equipment_id`=14437 WHERE `entry`=14437;
UPDATE `creature_template` SET `equipment_id`=14438 WHERE `entry`=14438;
UPDATE `creature_template` SET `equipment_id`=14440 WHERE `entry`=14440;
UPDATE `creature_template` SET `equipment_id`=14441 WHERE `entry`=14441;
UPDATE `creature_template` SET `equipment_id`=14442 WHERE `entry`=14442;
UPDATE `creature_template` SET `equipment_id`=15775 WHERE `entry`=15775;
UPDATE `creature_template` SET `equipment_id`=14445 WHERE `entry`=14445;
UPDATE `creature_template` SET `equipment_id`=15260 WHERE `entry`=15260;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=14447;
UPDATE `creature_template` SET `equipment_id`=15847 WHERE `entry`=15847;
UPDATE `creature_template` SET `equipment_id`=15841 WHERE `entry`=15841;
UPDATE `creature_template` SET `equipment_id`=14456 WHERE `entry`=14456;
UPDATE `creature_template` SET `equipment_id`=15855 WHERE `entry`=15855;
UPDATE `creature_template` SET `equipment_id`=14463 WHERE `entry`=14463;
UPDATE `creature_template` SET `equipment_id`=14469 WHERE `entry`=14469;
UPDATE `creature_template` SET `equipment_id`=14479 WHERE `entry`=14479;
UPDATE `creature_template` SET `equipment_id`=15201 WHERE `entry`=15201;
UPDATE `creature_template` SET `equipment_id`=14483 WHERE `entry`=14483;
UPDATE `creature_template` SET `equipment_id`=14487 WHERE `entry`=14487;
UPDATE `creature_template` SET `equipment_id`=14488 WHERE `entry`=14488;
UPDATE `creature_template` SET `equipment_id`=14489 WHERE `entry`=14489;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=14490;
UPDATE `creature_template` SET `equipment_id`=14492 WHERE `entry`=14492;
UPDATE `creature_template` SET `equipment_id`=15213 WHERE `entry`=15213;
UPDATE `creature_template` SET `equipment_id`=15724 WHERE `entry`=15724;
UPDATE `creature_template` SET `equipment_id`=14497 WHERE `entry`=14497;
UPDATE `creature_template` SET `equipment_id`=14498 WHERE `entry`=14498;
UPDATE `creature_template` SET `equipment_id`=14507 WHERE `entry`=14507;
UPDATE `creature_template` SET `equipment_id`=15839 WHERE `entry`=15839;
UPDATE `creature_template` SET `equipment_id`=14508 WHERE `entry`=14508;
UPDATE `creature_template` SET `equipment_id`=14516 WHERE `entry`=14516;
UPDATE `creature_template` SET `equipment_id`=14517 WHERE `entry`=14517;
UPDATE `creature_template` SET `equipment_id`=16139 WHERE `entry`=16139;
UPDATE `creature_template` SET `equipment_id`=14522 WHERE `entry`=14522;
UPDATE `creature_template` SET `equipment_id`=15702 WHERE `entry`=15702;
UPDATE `creature_template` SET `equipment_id`=15189 WHERE `entry`=15189;
UPDATE `creature_template` SET `equipment_id`=15700 WHERE `entry`=15700;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=15193;
UPDATE `creature_template` SET `equipment_id`=15197 WHERE `entry`=15197;
UPDATE `creature_template` SET `equipment_id`=15708 WHERE `entry`=15708;
UPDATE `creature_template` SET `equipment_id`=14567 WHERE `entry`=14567;
UPDATE `creature_template` SET `equipment_id`=16058 WHERE `entry`=16058;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=14604;
UPDATE `creature_template` SET `equipment_id`=14622 WHERE `entry`=14622;
UPDATE `creature_template` SET `equipment_id`=14624 WHERE `entry`=14624;
UPDATE `creature_template` SET `equipment_id`=14627 WHERE `entry`=14627;
UPDATE `creature_template` SET `equipment_id`=14628 WHERE `entry`=14628;
UPDATE `creature_template` SET `equipment_id`=14634 WHERE `entry`=14634;
UPDATE `creature_template` SET `equipment_id`=14638 WHERE `entry`=14638;
UPDATE `creature_template` SET `equipment_id`=14639 WHERE `entry`=14639;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=14640;
UPDATE `creature_template` SET `equipment_id`=15615 WHERE `entry`=15615;
UPDATE `creature_template` SET `equipment_id`=14715 WHERE `entry`=14715;
UPDATE `creature_template` SET `equipment_id`=14717 WHERE `entry`=14717;
UPDATE `creature_template` SET `equipment_id`=15084 WHERE `entry`=15084;
UPDATE `creature_template` SET `equipment_id`=14718 WHERE `entry`=14718;
UPDATE `creature_template` SET `equipment_id`=14720 WHERE `entry`=14720;
UPDATE `creature_template` SET `equipment_id`=14724 WHERE `entry`=14724;
UPDATE `creature_template` SET `equipment_id`=14873 WHERE `entry`=14873;
UPDATE `creature_template` SET `equipment_id`=14729 WHERE `entry`=14729;
UPDATE `creature_template` SET `equipment_id`=14730 WHERE `entry`=14730;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=14877;
UPDATE `creature_template` SET `equipment_id`=14734 WHERE `entry`=14734;
UPDATE `creature_template` SET `equipment_id`=14736 WHERE `entry`=14736;
UPDATE `creature_template` SET `equipment_id`=14737 WHERE `entry`=14737;
UPDATE `creature_template` SET `equipment_id`=14738 WHERE `entry`=14738;
UPDATE `creature_template` SET `equipment_id`=14739 WHERE `entry`=14739;
UPDATE `creature_template` SET `equipment_id`=14740 WHERE `entry`=14740;
UPDATE `creature_template` SET `equipment_id`=14741 WHERE `entry`=14741;
UPDATE `creature_template` SET `equipment_id`=14742 WHERE `entry`=14742;
UPDATE `creature_template` SET `equipment_id`=15460 WHERE `entry`=15460;
UPDATE `creature_template` SET `equipment_id`=14743 WHERE `entry`=14743;
UPDATE `creature_template` SET `equipment_id`=14748 WHERE `entry`=14748;
UPDATE `creature_template` SET `equipment_id`=14753 WHERE `entry`=14753;
UPDATE `creature_template` SET `equipment_id`=14762 WHERE `entry`=14762;
UPDATE `creature_template` SET `equipment_id`=16090 WHERE `entry`=16090;
UPDATE `creature_template` SET `equipment_id`=14763 WHERE `entry`=14763;
UPDATE `creature_template` SET `equipment_id`=14764 WHERE `entry`=14764;
UPDATE `creature_template` SET `equipment_id`=14909 WHERE `entry`=14909;
UPDATE `creature_template` SET `equipment_id`=14765 WHERE `entry`=14765;
UPDATE `creature_template` SET `equipment_id`=14766 WHERE `entry`=14766;
UPDATE `creature_template` SET `equipment_id`=14767 WHERE `entry`=14767;
UPDATE `creature_template` SET `equipment_id`=14768 WHERE `entry`=14768;
UPDATE `creature_template` SET `equipment_id`=14849 WHERE `entry`=14849;
UPDATE `creature_template` SET `equipment_id`=14769 WHERE `entry`=14769;
UPDATE `creature_template` SET `equipment_id`=14770 WHERE `entry`=14770;
UPDATE `creature_template` SET `equipment_id`=14772 WHERE `entry`=14772;
UPDATE `creature_template` SET `equipment_id`=14774 WHERE `entry`=14774;
UPDATE `creature_template` SET `equipment_id`=14775 WHERE `entry`=14775;
UPDATE `creature_template` SET `equipment_id`=14776 WHERE `entry`=14776;
UPDATE `creature_template` SET `equipment_id`=14857 WHERE `entry`=14857;
UPDATE `creature_template` SET `equipment_id`=14777 WHERE `entry`=14777;
UPDATE `creature_template` SET `equipment_id`=14781 WHERE `entry`=14781;
UPDATE `creature_template` SET `equipment_id`=14822 WHERE `entry`=14822;
UPDATE `creature_template` SET `equipment_id`=14823 WHERE `entry`=14823;
UPDATE `creature_template` SET `equipment_id`=14828 WHERE `entry`=14828;
UPDATE `creature_template` SET `equipment_id`=14844 WHERE `entry`=14844;
UPDATE `creature_template` SET `equipment_id`=14847 WHERE `entry`=14847;
UPDATE `creature_template` SET `equipment_id`=14859 WHERE `entry`=14859;
UPDATE `creature_template` SET `equipment_id`=14875 WHERE `entry`=14875;
UPDATE `creature_template` SET `equipment_id`=13516 WHERE `entry`=13516;
UPDATE `creature_template` SET `equipment_id`=14882 WHERE `entry`=14882;
UPDATE `creature_template` SET `equipment_id`=16215 WHERE `entry`=16215;
UPDATE `creature_template` SET `equipment_id`=14684 WHERE `entry`=14684;
UPDATE `creature_template` SET `equipment_id`=14893 WHERE `entry`=14893;
UPDATE `creature_template` SET `equipment_id`=14901 WHERE `entry`=14901;
UPDATE `creature_template` SET `equipment_id`=14904 WHERE `entry`=14904;
UPDATE `creature_template` SET `equipment_id`=14908 WHERE `entry`=14908;
UPDATE `creature_template` SET `equipment_id`=14910 WHERE `entry`=14910;
UPDATE `creature_template` SET `equipment_id`=14921 WHERE `entry`=14921;
UPDATE `creature_template` SET `equipment_id`=14942 WHERE `entry`=14942;
UPDATE `creature_template` SET `equipment_id`=14961 WHERE `entry`=14961;
UPDATE `creature_template` SET `equipment_id`=14962 WHERE `entry`=14962;
UPDATE `creature_template` SET `equipment_id`=14963 WHERE `entry`=14963;
UPDATE `creature_template` SET `equipment_id`=16359 WHERE `entry`=16359;
UPDATE `creature_template` SET `equipment_id`=14964 WHERE `entry`=14964;
UPDATE `creature_template` SET `equipment_id`=14982 WHERE `entry`=14982;
UPDATE `creature_template` SET `equipment_id`=16148 WHERE `entry`=16148;
UPDATE `creature_template` SET `equipment_id`=14983 WHERE `entry`=14983;
UPDATE `creature_template` SET `equipment_id`=14984 WHERE `entry`=14984;
UPDATE `creature_template` SET `equipment_id`=16156 WHERE `entry`=16156;
UPDATE `creature_template` SET `equipment_id`=15723 WHERE `entry`=15723;
UPDATE `creature_template` SET `equipment_id`=15006 WHERE `entry`=15006;
UPDATE `creature_template` SET `equipment_id`=15007 WHERE `entry`=15007;
UPDATE `creature_template` SET `equipment_id`=15008 WHERE `entry`=15008;
UPDATE `creature_template` SET `equipment_id`=15021 WHERE `entry`=15021;
UPDATE `creature_template` SET `equipment_id`=15022 WHERE `entry`=15022;
UPDATE `creature_template` SET `equipment_id`=15046 WHERE `entry`=15046;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=15061;
UPDATE `creature_template` SET `equipment_id`=15064 WHERE `entry`=15064;
UPDATE `creature_template` SET `equipment_id`=15074 WHERE `entry`=15074;
UPDATE `creature_template` SET `equipment_id`=15076 WHERE `entry`=15076;
UPDATE `creature_template` SET `equipment_id`=15077 WHERE `entry`=15077;
UPDATE `creature_template` SET `equipment_id`=15078 WHERE `entry`=15078;
UPDATE `creature_template` SET `equipment_id`=15083 WHERE `entry`=15083;
UPDATE `creature_template` SET `equipment_id`=15086 WHERE `entry`=15086;
UPDATE `creature_template` SET `equipment_id`=15088 WHERE `entry`=15088;
UPDATE `creature_template` SET `equipment_id`=16055 WHERE `entry`=16055;
UPDATE `creature_template` SET `equipment_id`=15111 WHERE `entry`=15111;
UPDATE `creature_template` SET `equipment_id`=16063 WHERE `entry`=16063;
UPDATE `creature_template` SET `equipment_id`=15116 WHERE `entry`=15116;
UPDATE `creature_template` SET `equipment_id`=15124 WHERE `entry`=15124;
UPDATE `creature_template` SET `equipment_id`=15125 WHERE `entry`=15125;
UPDATE `creature_template` SET `equipment_id`=15126 WHERE `entry`=15126;
UPDATE `creature_template` SET `equipment_id`=15128 WHERE `entry`=15128;
UPDATE `creature_template` SET `equipment_id`=15498 WHERE `entry`=15498;
UPDATE `creature_template` SET `equipment_id`=15131 WHERE `entry`=15131;
UPDATE `creature_template` SET `equipment_id`=15136 WHERE `entry`=15136;
UPDATE `creature_template` SET `equipment_id`=15137 WHERE `entry`=15137;
UPDATE `creature_template` SET `equipment_id`=15162 WHERE `entry`=15162;
UPDATE `creature_template` SET `equipment_id`=15610 WHERE `entry`=15610;
UPDATE `creature_template` SET `equipment_id`=15181 WHERE `entry`=15181;
UPDATE `creature_template` SET `equipment_id`=15182 WHERE `entry`=15182;
UPDATE `creature_template` SET `equipment_id`=16065 WHERE `entry`=16065;
UPDATE `creature_template` SET `equipment_id`=15908 WHERE `entry`=15908;
UPDATE `creature_template` SET `equipment_id`=15191 WHERE `entry`=15191;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=15199;
UPDATE `creature_template` SET `equipment_id`=15200 WHERE `entry`=15200;
UPDATE `creature_template` SET `equipment_id`=15202 WHERE `entry`=15202;
UPDATE `creature_template` SET `equipment_id`=15203 WHERE `entry`=15203;
UPDATE `creature_template` SET `equipment_id`=15206 WHERE `entry`=15206;
UPDATE `creature_template` SET `equipment_id`=16103 WHERE `entry`=16103;
UPDATE `creature_template` SET `equipment_id`=16097 WHERE `entry`=16097;
UPDATE `creature_template` SET `equipment_id`=15270 WHERE `entry`=15270;
UPDATE `creature_template` SET `equipment_id`=15282 WHERE `entry`=15282;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=15293;
UPDATE `creature_template` SET `equipment_id`=15303 WHERE `entry`=15303;
UPDATE `creature_template` SET `equipment_id`=15451 WHERE `entry`=15451;
UPDATE `creature_template` SET `equipment_id`=15306 WHERE `entry`=15306;
UPDATE `creature_template` SET `equipment_id`=15315 WHERE `entry`=15315;
UPDATE `creature_template` SET `equipment_id`=15350 WHERE `entry`=15350;
UPDATE `creature_template` SET `equipment_id`=15353 WHERE `entry`=15353;
UPDATE `creature_template` SET `equipment_id`=15354 WHERE `entry`=15354;
UPDATE `creature_template` SET `equipment_id`=15459 WHERE `entry`=15459;
UPDATE `creature_template` SET `equipment_id`=15275 WHERE `entry`=15275;
UPDATE `creature_template` SET `equipment_id`=15441 WHERE `entry`=15441;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=15139;
UPDATE `creature_template` SET `equipment_id`=15442 WHERE `entry`=15442;
UPDATE `creature_template` SET `equipment_id`=15443 WHERE `entry`=15443;
UPDATE `creature_template` SET `equipment_id`=15444 WHERE `entry`=15444;
UPDATE `creature_template` SET `equipment_id`=16165 WHERE `entry`=16165;
UPDATE `creature_template` SET `equipment_id`=15471 WHERE `entry`=15471;
UPDATE `creature_template` SET `equipment_id`=15473 WHERE `entry`=15473;
UPDATE `creature_template` SET `equipment_id`=15502 WHERE `entry`=15502;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=15503;
UPDATE `creature_template` SET `equipment_id`=15504 WHERE `entry`=15504;
UPDATE `creature_template` SET `equipment_id`=15612 WHERE `entry`=15612;
UPDATE `creature_template` SET `equipment_id`=15613 WHERE `entry`=15613;
UPDATE `creature_template` SET `equipment_id`=15616 WHERE `entry`=15616;
UPDATE `creature_template` SET `equipment_id`=15617 WHERE `entry`=15617;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=15818;
UPDATE `creature_template` SET `equipment_id`=15961 WHERE `entry`=15961;
UPDATE `creature_template` SET `equipment_id`=15852 WHERE `entry`=15852;
UPDATE `creature_template` SET `equipment_id`=15853 WHERE `entry`=15853;
UPDATE `creature_template` SET `equipment_id`=15854 WHERE `entry`=15854;
UPDATE `creature_template` SET `equipment_id`=15857 WHERE `entry`=15857;
UPDATE `creature_template` SET `equipment_id`=15858 WHERE `entry`=15858;
UPDATE `creature_template` SET `equipment_id`=15859 WHERE `entry`=15859;
UPDATE `creature_template` SET `equipment_id`=15862 WHERE `entry`=15862;
UPDATE `creature_template` SET `equipment_id`=15866 WHERE `entry`=15866;
UPDATE `creature_template` SET `equipment_id`=15868 WHERE `entry`=15868;
UPDATE `creature_template` SET `equipment_id`=15870 WHERE `entry`=15870;
UPDATE `creature_template` SET `equipment_id`=15903 WHERE `entry`=15903;
UPDATE `creature_template` SET `equipment_id`=14635 WHERE `entry`=14635;
UPDATE `creature_template` SET `equipment_id`=16154 WHERE `entry`=16154;
UPDATE `creature_template` SET `equipment_id`=16158 WHERE `entry`=16158;
UPDATE `creature_template` SET `equipment_id`=16163 WHERE `entry`=16163;
UPDATE `creature_template` SET `equipment_id`=16193 WHERE `entry`=16193;
UPDATE `creature_template` SET `equipment_id`=16194 WHERE `entry`=16194;
UPDATE `creature_template` SET `equipment_id`=16216 WHERE `entry`=16216;
UPDATE `creature_template` SET `equipment_id`=16803 WHERE `entry`=16803;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=16060;
UPDATE `creature_template` SET `equipment_id`=15953 WHERE `entry`=15953;
UPDATE `creature_template` SET `equipment_id`=15772 WHERE `entry`=15772;
UPDATE `creature_template` SET `equipment_id`=16145 WHERE `entry`=16145;
UPDATE `creature_template` SET `equipment_id`=16112 WHERE `entry`=16112;
UPDATE `creature_template` SET `equipment_id`=15685 WHERE `entry`=15685;
UPDATE `creature_template` SET `equipment_id`=15540 WHERE `entry`=15540;
UPDATE `creature_template` SET `equipment_id`=16061 WHERE `entry`=16061;
UPDATE `creature_template` SET `equipment_id`=16016 WHERE `entry`=16016;
UPDATE `creature_template` SET `equipment_id`=16012 WHERE `entry`=16012;
UPDATE `creature_template` SET `equipment_id`=16032 WHERE `entry`=16032;
UPDATE `creature_template` SET `equipment_id`=16033 WHERE `entry`=16033;
UPDATE `creature_template` SET `equipment_id`=16376 WHERE `entry`=16376;
UPDATE `creature_template` SET `equipment_id`=16101 WHERE `entry`=16101;
UPDATE `creature_template` SET `equipment_id`=16102 WHERE `entry`=16102;
UPDATE `creature_template` SET `equipment_id`=16104 WHERE `entry`=16104;
UPDATE `creature_template` SET `equipment_id`=16118 WHERE `entry`=16118;
UPDATE `creature_template` SET `equipment_id`=15440 WHERE `entry`=15440;
UPDATE `creature_template` SET `equipment_id`=15499 WHERE `entry`=15499;
UPDATE `creature_template` SET `equipment_id`=17766 WHERE `entry`=17766;
UPDATE `creature_template` SET `equipment_id`=16091 WHERE `entry`=16091;
UPDATE `creature_template` SET `equipment_id`=16387 WHERE `entry`=16387;
UPDATE `creature_template` SET `equipment_id`=16361 WHERE `entry`=16361;
UPDATE `creature_template` SET `equipment_id`=16241 WHERE `entry`=16241;
UPDATE `creature_template` SET `equipment_id`=7291 WHERE `entry`=7291;
UPDATE `creature_template` SET `equipment_id`=4854 WHERE `entry`=4854;
UPDATE `creature_template` SET `equipment_id`=6906 WHERE `entry`=6906;
UPDATE `creature_template` SET `equipment_id`=6908 WHERE `entry`=6908;
UPDATE `creature_template` SET `equipment_id`=15419 WHERE `entry`=15419;
UPDATE `creature_template` SET `equipment_id`=15542 WHERE `entry`=15542;
UPDATE `creature_template` SET `equipment_id`=15692 WHERE `entry`=15692;
UPDATE `creature_template` SET `equipment_id`=16042 WHERE `entry`=16042;
UPDATE `creature_template` SET `equipment_id`=16094 WHERE `entry`=16094;
UPDATE `creature_template` SET `equipment_id`=12793 WHERE `entry`=12793;
UPDATE `creature_template` SET `equipment_id`=15526 WHERE `entry`=15526;
UPDATE `creature_template` SET `equipment_id`=16052 WHERE `entry`=16052;
UPDATE `creature_template` SET `equipment_id`=15760 WHERE `entry`=15760;
UPDATE `creature_template` SET `equipment_id`=16096 WHERE `entry`=16096;
UPDATE `creature_template` SET `equipment_id`=16228 WHERE `entry`=16228;
UPDATE `creature_template` SET `equipment_id`=15508 WHERE `entry`=15508;
UPDATE `creature_template` SET `equipment_id`=16392 WHERE `entry`=16392;
UPDATE `creature_template` SET `equipment_id`=16399 WHERE `entry`=16399;
UPDATE `creature_template` SET `equipment_id`=16418 WHERE `entry`=16418;
UPDATE `creature_template` SET `equipment_id`=15085 WHERE `entry`=15085;
UPDATE `creature_template` SET `equipment_id`=12795 WHERE `entry`=12795;
UPDATE `creature_template` SET `equipment_id`=17765 WHERE `entry`=17765;
UPDATE `creature_template` SET `equipment_id`=15545 WHERE `entry`=15545;
UPDATE `creature_template` SET `equipment_id`=15552 WHERE `entry`=15552;
UPDATE `creature_template` SET `equipment_id`=15609 WHERE `entry`=15609;
UPDATE `creature_template` SET `equipment_id`=15693 WHERE `entry`=15693;
UPDATE `creature_template` SET `equipment_id`=15694 WHERE `entry`=15694;
UPDATE `creature_template` SET `equipment_id`=15719 WHERE `entry`=15719;
UPDATE `creature_template` SET `equipment_id`=15864 WHERE `entry`=15864;
UPDATE `creature_template` SET `equipment_id`=13517 WHERE `entry`=13517;
UPDATE `creature_template` SET `equipment_id`=15907 WHERE `entry`=15907;
UPDATE `creature_template` SET `equipment_id`=16125 WHERE `entry`=16125;
UPDATE `creature_template` SET `equipment_id`=16150 WHERE `entry`=16150;
UPDATE `creature_template` SET `equipment_id`=15469 WHERE `entry`=15469;
UPDATE `creature_template` SET `equipment_id`=16378 WHERE `entry`=16378;
UPDATE `creature_template` SET `equipment_id`=16981 WHERE `entry`=16981;
UPDATE `creature_template` SET `equipment_id`=16983 WHERE `entry`=16983;
UPDATE `creature_template` SET `equipment_id`=16984 WHERE `entry`=16984;
UPDATE `creature_template` SET `equipment_id`=12782 WHERE `entry`=12782;
UPDATE `creature_template` SET `equipment_id`=14581 WHERE `entry`=14581;
UPDATE `creature_template` SET `equipment_id`=15458 WHERE `entry`=15458;
UPDATE `creature_template` SET `equipment_id`=15477 WHERE `entry`=15477;
UPDATE `creature_template` SET `equipment_id`=15515 WHERE `entry`=15515;
UPDATE `creature_template` SET `equipment_id`=15528 WHERE `entry`=15528;
UPDATE `creature_template` SET `equipment_id`=15704 WHERE `entry`=15704;
UPDATE `creature_template` SET `equipment_id`=15707 WHERE `entry`=15707;
UPDATE `creature_template` SET `equipment_id`=16254 WHERE `entry`=16254;
UPDATE `creature_template` SET `equipment_id`=15437 WHERE `entry`=15437;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=16384;
UPDATE `creature_template` SET `equipment_id`=16395 WHERE `entry`=16395;
UPDATE `creature_template` SET `equipment_id`=16396 WHERE `entry`=16396;
UPDATE `creature_template` SET `equipment_id`=17041 WHERE `entry`=17041;
UPDATE `creature_template` SET `equipment_id`=17048 WHERE `entry`=17048;
UPDATE `creature_template` SET `equipment_id`=17049 WHERE `entry`=17049;
UPDATE `creature_template` SET `equipment_id`=17050 WHERE `entry`=17050;
UPDATE `creature_template` SET `equipment_id`=17051 WHERE `entry`=17051;
UPDATE `creature_template` SET `equipment_id`=17635 WHERE `entry`=17635;
UPDATE `creature_template` SET `equipment_id`=17647 WHERE `entry`=17647;
UPDATE `creature_template` SET `equipment_id`=17995 WHERE `entry`=17995;
UPDATE `creature_template` SET `equipment_id`=17996 WHERE `entry`=17996;
UPDATE `creature_template` SET `equipment_id`=15383 WHERE `entry`=15383;
UPDATE `creature_template` SET `equipment_id`=15431 WHERE `entry`=15431;
UPDATE `creature_template` SET `equipment_id`=15445 WHERE `entry`=15445;
UPDATE `creature_template` SET `equipment_id`=15446 WHERE `entry`=15446;
UPDATE `creature_template` SET `equipment_id`=15448 WHERE `entry`=15448;
UPDATE `creature_template` SET `equipment_id`=15457 WHERE `entry`=15457;
UPDATE `creature_template` SET `equipment_id`=15539 WHERE `entry`=15539;
UPDATE `creature_template` SET `equipment_id`=15701 WHERE `entry`=15701;
UPDATE `creature_template` SET `equipment_id`=7504 WHERE `entry`=7504;
UPDATE `creature_template` SET `equipment_id`=10080 WHERE `entry`=10080;
UPDATE `creature_template` SET `equipment_id`=10081 WHERE `entry`=10081;
UPDATE `creature_template` SET `equipment_id`=16285 WHERE `entry`=16285;
UPDATE `creature_template` SET `equipment_id`=14261 WHERE `entry`=14261;
UPDATE `creature_template` SET `equipment_id`=14265 WHERE `entry`=14265;
UPDATE `creature_template` SET `equipment_id`=14302 WHERE `entry`=14302;
UPDATE `creature_template` SET `equipment_id`=14695 WHERE `entry`=14695;
UPDATE `creature_template` SET `equipment_id`=15423 WHERE `entry`=15423;
UPDATE `creature_template` SET `equipment_id`=15495 WHERE `entry`=15495;
UPDATE `creature_template` SET `equipment_id`=15512 WHERE `entry`=15512;
UPDATE `creature_template` SET `equipment_id`=15522 WHERE `entry`=15522;
UPDATE `creature_template` SET `equipment_id`=15525 WHERE `entry`=15525;
UPDATE `creature_template` SET `equipment_id`=15532 WHERE `entry`=15532;
UPDATE `creature_template` SET `equipment_id`=15533 WHERE `entry`=15533;
UPDATE `creature_template` SET `equipment_id`=15535 WHERE `entry`=15535;
UPDATE `creature_template` SET `equipment_id`=15633 WHERE `entry`=15633;
UPDATE `creature_template` SET `equipment_id`=15840 WHERE `entry`=15840;
UPDATE `creature_template` SET `equipment_id`=15850 WHERE `entry`=15850;
UPDATE `creature_template` SET `equipment_id`=15851 WHERE `entry`=15851;
UPDATE `creature_template` SET `equipment_id`=15856 WHERE `entry`=15856;
UPDATE `creature_template` SET `equipment_id`=15860 WHERE `entry`=15860;
UPDATE `creature_template` SET `equipment_id`=15861 WHERE `entry`=15861;
UPDATE `creature_template` SET `equipment_id`=15865 WHERE `entry`=15865;
UPDATE `creature_template` SET `equipment_id`=16049 WHERE `entry`=16049;
UPDATE `creature_template` SET `equipment_id`=16050 WHERE `entry`=16050;
UPDATE `creature_template` SET `equipment_id`=16054 WHERE `entry`=16054;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=16120;
UPDATE `creature_template` SET `equipment_id`=16255 WHERE `entry`=16255;
UPDATE `creature_template` SET `equipment_id`=16433 WHERE `entry`=16433;
UPDATE `creature_template` SET `equipment_id`=16434 WHERE `entry`=16434;
UPDATE `creature_template` SET `equipment_id`=16435 WHERE `entry`=16435;
UPDATE `creature_template` SET `equipment_id`=16436 WHERE `entry`=16436;
UPDATE `creature_template` SET `equipment_id`=16861 WHERE `entry`=16861;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=16083;
UPDATE `creature_template` SET `equipment_id`=2454 WHERE `entry`=2454;
UPDATE `creature_template` SET `equipment_id`=10579 WHERE `entry`=10579;
UPDATE `creature_template` SET `equipment_id`=15796 WHERE `entry`=15796;
UPDATE `creature_template` SET `equipment_id`=15720 WHERE `entry`=15720;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=14966;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=14968;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=7791;
UPDATE `creature_template` SET `equipment_id`=10459 WHERE `entry`=10459;
UPDATE `creature_template` SET `equipment_id`=12792 WHERE `entry`=12792;
UPDATE `creature_template` SET `equipment_id`=13521 WHERE `entry`=13521;
UPDATE `creature_template` SET `equipment_id`=13523 WHERE `entry`=13523;
UPDATE `creature_template` SET `equipment_id`=15394 WHERE `entry`=15394;
UPDATE `creature_template` SET `equipment_id`=15773 WHERE `entry`=15773;
UPDATE `creature_template` SET `equipment_id`=15774 WHERE `entry`=15774;
UPDATE `creature_template` SET `equipment_id`=15776 WHERE `entry`=15776;
UPDATE `creature_template` SET `equipment_id`=15794 WHERE `entry`=15794;
UPDATE `creature_template` SET `equipment_id`=16281 WHERE `entry`=16281;
UPDATE `creature_template` SET `equipment_id`=16439 WHERE `entry`=16439;
UPDATE `creature_template` SET `equipment_id`=16440 WHERE `entry`=16440;
UPDATE `creature_template` SET `equipment_id`=16775 WHERE `entry`=16775;
UPDATE `creature_template` SET `equipment_id`=16776 WHERE `entry`=16776;
UPDATE `creature_template` SET `equipment_id`=16777 WHERE `entry`=16777;
UPDATE `creature_template` SET `equipment_id`=16778 WHERE `entry`=16778;
UPDATE `creature_template` SET `equipment_id`=17038 WHERE `entry`=17038;
UPDATE `creature_template` SET `equipment_id`=155520 WHERE `entry`=155520;
UPDATE `creature_template` SET `equipment_id`=160003 WHERE `entry`=160003;
UPDATE `creature_template` SET `equipment_id`=160004 WHERE `entry`=160004;
UPDATE `creature_template` SET `equipment_id`=160005 WHERE `entry`=160005;
UPDATE `creature_template` SET `equipment_id`=988005 WHERE `entry`=988005;
UPDATE `creature_template` SET `equipment_id`=988002 WHERE `entry`=988002;
UPDATE `creature_template` SET `equipment_id`=10163 WHERE `entry`=10163;
UPDATE `creature_template` SET `equipment_id`=56000 WHERE `entry`=56000;
UPDATE `creature_template` SET `equipment_id`=7091 WHERE `entry`=7091;
UPDATE `creature_template` SET `equipment_id`=14599 WHERE `entry`=14599;
UPDATE `creature_template` SET `equipment_id`=10819 WHERE `entry`=10819;
UPDATE `creature_template` SET `equipment_id`=7070 WHERE `entry`=7070;
UPDATE `creature_template` SET `equipment_id`=7075 WHERE `entry`=7075;
UPDATE `creature_template` SET `equipment_id`=12785 WHERE `entry`=12785;
UPDATE `creature_template` SET `equipment_id`=12794 WHERE `entry`=12794;
UPDATE `creature_template` SET `equipment_id`=13601 WHERE `entry`=13601;
UPDATE `creature_template` SET `equipment_id`=4752 WHERE `entry`=4752;
UPDATE `creature_template` SET `equipment_id`=7954 WHERE `entry`=7954;
UPDATE `creature_template` SET `equipment_id`=7789 WHERE `entry`=7789;
UPDATE `creature_template` SET `equipment_id`=11190 WHERE `entry`=11190;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=13017;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=12150;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=16167;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=15312;
UPDATE `creature_template` SET `equipment_id`=7207 WHERE `entry`=7207;
UPDATE `creature_template` SET `equipment_id`=8402 WHERE `entry`=8402;
UPDATE `creature_template` SET `equipment_id`=16505 WHERE `entry`=16505;
UPDATE `creature_template` SET `equipment_id`=10424 WHERE `entry`=160000;
UPDATE `creature_template` SET `equipment_id`=10424 WHERE `entry`=160001;
UPDATE `creature_template` SET `equipment_id`=10424 WHERE `entry`=160002;

-- Add new equipment templates.
TRUNCATE `creature_equip_template`;
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES
(50001, 2715, 143, 0),
(3517, 0, 2081, 0),
(1366, 1117, 0, 0),
(193, 6680, 0, 0),
(2599, 5293, 0, 0),
(944, 1907, 0, 0),
(1119, 3326, 0, 0),
(300, 2023, 0, 0),
(7118, 2559, 0, 0),
(3384, 5278, 0, 2552),
(171, 2023, 0, 0),
(2010, 3350, 0, 0),
(429, 1907, 0, 0),
(732, 2184, 0, 0),
(38, 1896, 0, 0),
(1481, 2184, 0, 0),
(94, 2184, 0, 0),
(1026, 1900, 0, 0),
(485, 1896, 1957, 0),
(891, 1907, 0, 0),
(198, 1907, 0, 0),
(2596, 5304, 0, 0),
(3090, 2200, 3698, 0),
(397, 2177, 0, 0),
(6, 5276, 0, 0),
(2491, 0, 3757, 0),
(483, 2197, 0, 0),
(1431, 2717, 0, 0),
(100, 1904, 0, 0),
(1367, 1117, 0, 0),
(1411, 3364, 0, 0),
(3419, 2199, 3694, 0),
(40, 1910, 0, 0),
(437, 2809, 1957, 0),
(46, 1897, 0, 0),
(1736, 1905, 0, 2551),
(48, 1909, 0, 0),
(6866, 2184, 0, 0),
(445, 1904, 0, 0),
(1441, 2178, 0, 0),
(54, 1903, 0, 0),
(1744, 1905, 0, 2551),
(1120, 1904, 0, 0),
(3144, 10612, 0, 0),
(124, 3326, 0, 0),
(1519, 2715, 0, 0),
(60, 1905, 0, 0),
(125, 1983, 0, 0),
(940, 1908, 0, 0),
(61, 1900, 1900, 0),
(196, 1905, 0, 0),
(853, 2023, 0, 2552),
(68, 1899, 143, 2551),
(1257, 3699, 0, 0),
(382, 1900, 0, 0),
(1378, 2705, 0, 0),
(2205, 1983, 0, 0),
(197, 1899, 143, 0),
(1012, 5301, 0, 0),
(202, 1896, 0, 0),
(1883, 1903, 0, 0),
(2600, 5280, 5280, 0),
(465, 2717, 0, 0),
(2541, 5747, 0, 0),
(469, 2180, 1896, 0),
(78, 1903, 0, 0),
(79, 1903, 0, 0),
(80, 1910, 0, 0),
(338, 12937, 0, 0),
(1326, 2200, 2201, 0),
(1487, 2023, 0, 5856),
(813, 5285, 2179, 0),
(475, 1901, 0, 0),
(95, 5281, 0, 6886),
(8142, 5303, 0, 0),
(912, 1896, 1961, 0),
(97, 1895, 0, 0),
(489, 1897, 1957, 2551),
(1477, 2705, 0, 0),
(3485, 2200, 0, 0),
(98, 1897, 2052, 0),
(99, 5285, 0, 0),
(1938, 1908, 0, 0),
(4054, 1911, 0, 0),
(1332, 2180, 1984, 2552),
(103, 1900, 2081, 0),
(2058, 2711, 0, 0),
(1493, 5491, 0, 0),
(1048, 10825, 1984, 0),
(499, 2180, 2081, 2551),
(116, 1896, 0, 0),
(117, 1895, 0, 0),
(4070, 5292, 0, 2552),
(1000, 2180, 2081, 0),
(121, 2711, 2052, 0),
(2855, 0, 12745, 0),
(1110, 1897, 0, 0),
(3891, 1899, 0, 0),
(2210, 1905, 0, 2551),
(122, 2184, 1895, 0),
(7669, 5301, 0, 0),
(123, 1905, 0, 0),
(2525, 2183, 1984, 2552),
(1122, 1896, 0, 0),
(15434, 1896, 0, 0),
(453, 5277, 0, 0),
(126, 2184, 0, 0),
(3323, 2200, 0, 0),
(328, 1908, 0, 0),
(1444, 1907, 0, 0),
(215, 2711, 0, 0),
(2336, 2184, 0, 0),
(1251, 1906, 0, 0),
(264, 2179, 0, 0),
(1380, 1909, 2053, 0),
(151, 2197, 0, 0),
(152, 2197, 0, 0),
(873, 1908, 0, 0),
(7310, 1905, 0, 0),
(2245, 5286, 0, 5260),
(1338, 2180, 1984, 2552),
(376, 2176, 0, 0),
(1364, 5304, 0, 0),
(1573, 2182, 0, 0),
(1279, 2182, 1984, 2552),
(332, 2711, 0, 0),
(3625, 1906, 0, 0),
(203, 1908, 0, 0),
(1386, 2198, 3698, 0),
(3410, 0, 0, 5259),
(2595, 1897, 0, 0),
(3270, 5303, 0, 0),
(933, 1899, 143, 2551),
(212, 5286, 0, 0),
(1273, 1899, 0, 0),
(334, 2178, 2052, 0),
(863, 2023, 0, 0),
(218, 3346, 0, 0),
(1963, 3351, 0, 0),
(2616, 12856, 0, 0),
(1218, 1907, 0, 0),
(545, 1907, 0, 0),
(7363, 5277, 0, 0),
(1452, 2197, 0, 0),
(223, 1903, 0, 0),
(1398, 2202, 3350, 0),
(225, 1903, 0, 0),
(1278, 2183, 1984, 2552),
(15183, 19053, 0, 0),
(3222, 2023, 0, 14642),
(871, 2023, 0, 0),
(226, 1903, 0, 0),
(1907, 5745, 0, 0),
(1175, 1910, 0, 0),
(228, 0, 0, 5262),
(885, 2180, 2081, 2551),
(232, 2714, 0, 0),
(889, 2695, 0, 0),
(233, 3367, 0, 0),
(3620, 1904, 0, 0),
(1222, 3774, 0, 0),
(879, 2023, 0, 5870),
(234, 2557, 0, 0),
(1915, 2559, 0, 0),
(1296, 17942, 0, 0),
(3448, 12328, 0, 0),
(235, 3351, 0, 0),
(1169, 1900, 0, 0),
(3442, 1911, 0, 0),
(237, 3367, 0, 0),
(867, 1907, 0, 0),
(1275, 0, 3695, 0),
(2376, 1908, 0, 0),
(1404, 0, 0, 2550),
(239, 2705, 0, 0),
(240, 3361, 0, 0),
(241, 1906, 0, 0),
(837, 1907, 0, 0),
(1178, 1901, 0, 0),
(875, 2023, 0, 0),
(1348, 5495, 0, 0),
(895, 0, 0, 2552),
(7406, 1911, 0, 0),
(250, 3367, 0, 0),
(1867, 2184, 0, 0),
(1376, 1901, 0, 0),
(3400, 3351, 4993, 0),
(1249, 1903, 0, 0),
(3394, 1899, 0, 5259),
(1356, 1910, 0, 0),
(257, 1901, 0, 0),
(1253, 13750, 0, 0),
(3261, 5286, 0, 0),
(258, 0, 3757, 0),
(696, 1905, 0, 5856),
(1261, 1907, 0, 0),
(2418, 1896, 2081, 0),
(267, 12751, 0, 0),
(1215, 2198, 3694, 0),
(16062, 22709, 0, 0),
(1259, 3368, 0, 0),
(272, 2827, 0, 0),
(2346, 2809, 0, 0),
(1269, 1911, 0, 0),
(6522, 5281, 0, 0),
(3213, 2023, 0, 14642),
(274, 2717, 0, 0),
(1287, 1896, 0, 0),
(2742, 1908, 0, 0),
(670, 1908, 0, 0),
(1666, 1903, 1985, 0),
(1159, 2184, 0, 0),
(644, 3326, 0, 0),
(1167, 1910, 0, 0),
(285, 1895, 0, 0),
(1211, 2184, 2053, 0),
(288, 0, 2081, 0),
(8131, 0, 0, 11021),
(4061, 0, 0, 5870),
(1331, 2182, 1984, 2552),
(674, 1910, 0, 0),
(3670, 1909, 5286, 0),
(3009, 3699, 3697, 0),
(4043, 1903, 0, 0),
(3335, 2199, 0, 0),
(694, 1904, 0, 5856),
(1163, 1901, 0, 0),
(672, 1908, 0, 0),
(1319, 0, 1984, 0),
(2646, 5287, 0, 0),
(702, 2184, 0, 0),
(3037, 5291, 0, 0),
(1698, 1905, 0, 0),
(3030, 3361, 0, 0),
(1283, 2183, 1984, 2552),
(3750, 5303, 0, 0),
(3025, 2196, 0, 0),
(311, 1906, 1957, 0),
(680, 5287, 0, 0),
(1181, 1908, 0, 0),
(2402, 1906, 0, 0),
(5503, 6233, 0, 0),
(2798, 5278, 0, 0),
(1327, 2703, 0, 0),
(3351, 2717, 0, 0),
(646, 10756, 0, 0),
(315, 2179, 1897, 0),
(1706, 2695, 0, 0),
(325, 1907, 0, 0),
(706, 1901, 0, 0),
(327, 1903, 0, 0),
(760, 1901, 0, 0),
(331, 2177, 0, 0),
(1371, 1117, 0, 0),
(714, 2023, 0, 0),
(16126, 12949, 0, 0),
(340, 2705, 12751, 0),
(1060, 2176, 0, 0),
(3275, 2023, 0, 0),
(1070, 1899, 0, 0),
(712, 3494, 0, 0),
(3112, 5281, 0, 2551),
(347, 1907, 0, 0),
(1738, 1905, 0, 2551),
(1231, 0, 0, 2552),
(348, 1117, 0, 0),
(349, 1897, 2052, 0),
(738, 1899, 2052, 0),
(3734, 2695, 0, 0),
(1255, 1910, 0, 0),
(754, 1906, 1985, 2552),
(375, 1907, 0, 0),
(377, 1908, 0, 0),
(744, 1909, 0, 0),
(710, 1908, 0, 0),
(2084, 12745, 0, 0),
(381, 0, 2714, 0),
(1355, 2196, 0, 0),
(762, 1907, 0, 0),
(7918, 2557, 0, 0),
(3607, 1117, 0, 0),
(391, 3368, 0, 0),
(2547, 2180, 1984, 0),
(1072, 1904, 0, 2552),
(415, 2558, 0, 0),
(1078, 1910, 2081, 0),
(3639, 3432, 0, 0),
(1076, 2715, 0, 0),
(423, 1901, 0, 0),
(424, 1905, 0, 2551),
(426, 5491, 0, 0),
(1247, 2705, 0, 0),
(2253, 5301, 0, 0),
(1241, 1903, 0, 0),
(430, 1908, 0, 0),
(431, 5287, 0, 0),
(432, 2809, 0, 0),
(513, 2023, 0, 0),
(433, 1896, 0, 0),
(1539, 1908, 0, 0),
(435, 1899, 0, 0),
(436, 1908, 0, 0),
(517, 1907, 0, 0),
(440, 1905, 0, 0),
(1038, 1908, 0, 0),
(1430, 2197, 0, 0),
(2663, 1900, 0, 0),
(446, 2809, 2052, 0),
(448, 1905, 0, 0),
(5518, 4994, 0, 0),
(2591, 2177, 0, 0),
(583, 2184, 0, 0),
(450, 1908, 0, 0),
(452, 2711, 0, 0),
(597, 5289, 0, 0),
(3671, 1908, 0, 0),
(456, 1907, 0, 0),
(1838, 5532, 5532, 0),
(458, 1897, 0, 5870),
(3881, 2827, 2202, 0),
(459, 1907, 0, 0),
(460, 1907, 0, 0),
(3154, 5278, 0, 0),
(461, 2559, 0, 0),
(2851, 5303, 0, 0),
(579, 5278, 0, 0),
(1522, 1907, 0, 0),
(7775, 3346, 0, 0),
(464, 1899, 143, 0),
(1846, 12944, 12933, 0),
(599, 1896, 0, 0),
(1699, 2196, 0, 0),
(1479, 1899, 1957, 0),
(1144, 1908, 0, 0),
(468, 1906, 0, 0),
(677, 1911, 0, 0),
(1845, 11264, 12933, 0),
(3532, 5284, 0, 0),
(472, 1909, 0, 0),
(1854, 13220, 0, 0),
(1198, 0, 0, 5260),
(473, 1900, 0, 0),
(474, 1907, 0, 0),
(1707, 2184, 0, 0),
(1472, 1903, 0, 0),
(3890, 18419, 0, 0),
(476, 1907, 0, 0),
(1474, 1908, 0, 0),
(595, 2711, 0, 5870),
(478, 1905, 0, 0),
(625, 3774, 0, 0),
(1142, 5300, 0, 0),
(481, 5278, 0, 0),
(3478, 1903, 0, 0),
(615, 2023, 0, 0),
(482, 2716, 0, 0),
(1651, 1117, 0, 0),
(1418, 1897, 0, 5870),
(3703, 5278, 0, 0),
(486, 1983, 0, 0),
(487, 1899, 2053, 2551),
(488, 1896, 2051, 2551),
(1478, 2705, 0, 0),
(2647, 4993, 0, 0),
(623, 1910, 0, 0),
(490, 1897, 2053, 2551),
(2515, 2183, 1984, 2552),
(3192, 2147, 1984, 0),
(491, 1909, 0, 0),
(494, 2180, 2081, 2551),
(495, 2180, 2081, 2551),
(500, 1906, 0, 2551),
(7290, 1905, 0, 2552),
(1434, 1899, 1957, 2552),
(619, 1907, 0, 0),
(3655, 2717, 0, 0),
(502, 1897, 1897, 0),
(504, 5278, 0, 0),
(639, 2179, 2147, 0),
(506, 2183, 0, 0),
(1100, 2180, 2081, 0),
(511, 6233, 0, 0),
(514, 1911, 0, 0),
(515, 1897, 0, 0),
(518, 2179, 0, 0),
(520, 5745, 0, 0),
(522, 13316, 2081, 0),
(531, 2711, 0, 0),
(543, 1905, 0, 0),
(544, 2711, 0, 0),
(2246, 2711, 2147, 0),
(550, 5281, 0, 0),
(568, 1905, 2052, 0),
(2266, 3367, 0, 0),
(8117, 9700, 0, 0),
(1240, 1902, 0, 0),
(576, 2180, 2081, 0),
(4093, 1909, 0, 5259),
(580, 2558, 2809, 0),
(4091, 5277, 0, 0),
(584, 10685, 0, 0),
(587, 1901, 1985, 0),
(588, 2184, 0, 0),
(589, 1907, 0, 0),
(590, 2184, 0, 0),
(594, 2184, 2052, 0),
(596, 5304, 0, 0),
(3367, 2197, 0, 0),
(598, 1910, 0, 0),
(3880, 0, 0, 5258),
(603, 1909, 0, 0),
(3995, 12322, 0, 0),
(622, 1911, 0, 2552),
(4077, 2714, 3697, 0),
(626, 1910, 0, 0),
(634, 1896, 0, 0),
(636, 5285, 0, 0),
(826, 2180, 2081, 2551),
(641, 1905, 0, 5856),
(1719, 1907, 0, 0),
(643, 3494, 11506, 0),
(7952, 6680, 0, 0),
(1496, 1905, 0, 0),
(645, 2200, 0, 0),
(824, 1910, 0, 0),
(647, 3368, 0, 0),
(656, 1910, 0, 0),
(657, 1897, 0, 0),
(1894, 1899, 1957, 0),
(660, 1908, 0, 0),
(782, 2184, 0, 0),
(663, 1899, 0, 0),
(1892, 1896, 1961, 5258),
(1679, 2182, 0, 0),
(3944, 5291, 0, 0),
(667, 1901, 1985, 0),
(790, 1903, 0, 0),
(1665, 6224, 0, 0),
(669, 2711, 0, 0),
(784, 1909, 0, 5260),
(671, 2183, 0, 5870),
(2502, 3368, 0, 0),
(1490, 2810, 0, 0),
(675, 1906, 0, 0),
(676, 2809, 0, 0),
(2007, 3346, 0, 0),
(3383, 1900, 0, 0),
(678, 5288, 0, 0),
(3542, 2200, 0, 0),
(679, 1908, 0, 0),
(1339, 1902, 0, 0),
(812, 2199, 0, 0),
(1498, 0, 0, 6231),
(2009, 1907, 0, 0),
(820, 1897, 2052, 0),
(1703, 12298, 0, 0),
(2518, 2183, 1984, 2552),
(3548, 6236, 0, 0),
(818, 2177, 0, 0),
(697, 1908, 0, 0),
(828, 2180, 2081, 2551),
(1711, 2184, 2184, 0),
(699, 1909, 0, 5260),
(1697, 2081, 0, 0),
(701, 1908, 0, 5870),
(703, 1983, 0, 0),
(1062, 2176, 0, 0),
(836, 1903, 1984, 0),
(8016, 12285, 0, 0),
(709, 1909, 0, 0),
(888, 2180, 2081, 0),
(1061, 2183, 2183, 0),
(711, 3346, 0, 0),
(713, 2182, 0, 0),
(844, 1906, 0, 0),
(3113, 1904, 0, 0),
(715, 0, 0, 2552),
(3922, 1907, 0, 0),
(2083, 2714, 0, 0),
(1399, 1907, 0, 0),
(2790, 1903, 0, 0),
(6188, 6334, 0, 0),
(842, 1909, 0, 0),
(2103, 2147, 0, 5262),
(723, 2827, 2827, 0),
(724, 3350, 0, 0),
(840, 2180, 2081, 0),
(727, 2557, 0, 2552),
(1059, 5301, 0, 0),
(6207, 5281, 0, 0),
(1451, 2184, 0, 0),
(2104, 1899, 1957, 0),
(3129, 1899, 2053, 0),
(3111, 1901, 0, 0),
(1729, 1907, 0, 0),
(733, 1899, 1984, 0),
(2099, 2184, 0, 0),
(1351, 1908, 0, 0),
(2806, 12745, 0, 0),
(7875, 1909, 1985, 0),
(735, 2695, 0, 0),
(794, 1117, 0, 0),
(1910, 1907, 0, 0),
(868, 12329, 0, 0),
(739, 12742, 0, 0),
(5471, 1983, 0, 0),
(2766, 0, 2081, 0),
(3447, 1907, 0, 0),
(742, 1909, 0, 0),
(743, 1907, 0, 0),
(866, 10612, 12452, 5260),
(745, 1899, 1961, 0),
(1918, 2827, 0, 0),
(746, 1908, 0, 0),
(876, 1896, 143, 2551),
(1695, 2711, 0, 0),
(3960, 2827, 0, 0),
(747, 5285, 0, 0),
(1303, 6233, 0, 0),
(2694, 1899, 1899, 0),
(864, 1904, 2081, 0),
(751, 1899, 0, 0),
(1916, 2827, 0, 0),
(752, 5276, 0, 0),
(755, 2184, 0, 0),
(757, 1117, 0, 0),
(759, 1904, 0, 5260),
(761, 1908, 0, 0),
(1870, 2711, 0, 0),
(892, 1902, 0, 0),
(1775, 12889, 0, 0),
(763, 1983, 0, 0),
(886, 2180, 2081, 2551),
(880, 5289, 0, 0),
(7907, 12863, 0, 0),
(16051, 14618, 0, 0),
(3773, 13504, 0, 0),
(1202, 1905, 0, 0),
(771, 2179, 1984, 0),
(1182, 12591, 0, 0),
(775, 1900, 0, 0),
(780, 1908, 0, 0),
(1727, 1910, 0, 0),
(781, 2183, 0, 5870),
(783, 5289, 0, 0),
(785, 1903, 0, 0),
(3725, 2559, 0, 0),
(787, 2813, 0, 0),
(3206, 1907, 0, 0),
(791, 2197, 0, 0),
(793, 1899, 1961, 0),
(1162, 1905, 0, 5856),
(15119, 12850, 0, 0),
(3158, 2197, 0, 0),
(2497, 3433, 0, 0),
(808, 1983, 0, 0),
(2506, 2183, 1984, 2552),
(1480, 2707, 0, 0),
(814, 2178, 1984, 0),
(1158, 3364, 0, 0),
(2839, 0, 0, 5262),
(815, 5280, 0, 0),
(1495, 1897, 1957, 0),
(821, 1909, 2053, 0),
(1166, 1907, 0, 0),
(823, 1896, 0, 0),
(2513, 2183, 1984, 2552),
(827, 2180, 2081, 2551),
(829, 2197, 0, 0),
(1174, 1907, 0, 0),
(843, 1906, 0, 0),
(1785, 5532, 5532, 0),
(857, 2176, 0, 0),
(3624, 6680, 0, 0),
(1226, 2705, 0, 0),
(859, 1899, 143, 0),
(861, 2023, 0, 0),
(862, 10614, 2081, 0),
(1737, 1905, 0, 2551),
(865, 5278, 2081, 0),
(869, 1897, 2053, 2551),
(870, 1897, 143, 2551),
(874, 1896, 143, 2551),
(877, 2200, 0, 0),
(881, 1907, 0, 0),
(887, 2180, 2081, 2551),
(893, 1895, 0, 0),
(900, 2179, 143, 0),
(903, 1899, 143, 0),
(1051, 2809, 0, 0),
(906, 1908, 0, 0),
(3608, 12855, 0, 0),
(907, 12298, 0, 0),
(908, 6233, 0, 0),
(3602, 1908, 0, 0),
(909, 5285, 0, 0),
(910, 1908, 0, 0),
(911, 1896, 1961, 0),
(1564, 1907, 0, 0),
(913, 1899, 1985, 0),
(1123, 2023, 0, 5870),
(914, 12890, 0, 0),
(915, 2184, 0, 0),
(916, 2184, 0, 0),
(917, 1900, 0, 0),
(3175, 1910, 0, 0),
(918, 2711, 1900, 0),
(921, 1905, 0, 0),
(3688, 1906, 0, 0),
(3682, 1903, 0, 0),
(925, 1903, 0, 0),
(2998, 1903, 0, 0),
(926, 1903, 0, 0),
(927, 2182, 1984, 0),
(928, 2557, 0, 0),
(1075, 1905, 0, 0),
(1234, 2184, 0, 0),
(932, 1899, 143, 2551),
(1751, 2183, 0, 0),
(934, 1899, 143, 0),
(1745, 1905, 0, 2551),
(3286, 2147, 0, 0),
(935, 1899, 143, 2551),
(3803, 1907, 0, 0),
(936, 1899, 143, 0),
(937, 1899, 2052, 0),
(1083, 2023, 0, 0),
(938, 5281, 0, 0),
(1242, 2023, 0, 0),
(939, 1983, 0, 0),
(941, 1908, 0, 0),
(942, 1908, 0, 0),
(1753, 3326, 0, 0),
(7231, 1903, 0, 0),
(943, 2023, 0, 0),
(945, 2178, 2180, 0),
(1027, 2809, 0, 0),
(946, 2184, 0, 0),
(947, 5281, 1900, 0),
(950, 2147, 0, 0),
(1540, 1899, 1984, 0),
(1035, 1896, 2052, 0),
(3592, 1902, 0, 0),
(955, 2705, 0, 0),
(956, 2178, 0, 0),
(3586, 1910, 0, 0),
(957, 1903, 0, 0),
(958, 2177, 0, 0),
(960, 2718, 0, 0),
(963, 1899, 143, 0),
(1334, 2180, 1984, 2552),
(1702, 4994, 0, 0),
(978, 1909, 0, 0),
(979, 2177, 0, 5259),
(980, 1903, 0, 0),
(981, 11019, 0, 0),
(982, 2196, 2704, 0),
(983, 3699, 3695, 0),
(1700, 1117, 0, 0),
(1342, 2183, 1984, 0),
(984, 2184, 0, 0),
(985, 11087, 0, 0),
(986, 2809, 2081, 0),
(2360, 3346, 0, 0),
(3385, 1899, 1984, 0),
(987, 0, 0, 2550),
(3378, 3364, 0, 0),
(988, 2559, 0, 0),
(3746, 2023, 0, 0),
(989, 12850, 0, 0),
(999, 2180, 2081, 2551),
(1652, 1905, 0, 2551),
(1001, 2180, 2081, 2551),
(1662, 1896, 1984, 0),
(1007, 1896, 0, 0),
(1660, 1899, 1984, 0),
(1008, 2184, 0, 0),
(1009, 1908, 0, 0),
(1091, 2183, 1984, 0),
(1010, 1905, 0, 0),
(15936, 13061, 0, 0),
(1011, 1897, 0, 0),
(1013, 1907, 0, 0),
(7802, 2182, 0, 0),
(3143, 1904, 0, 0),
(1014, 1909, 1905, 0),
(1099, 2180, 2081, 0),
(2499, 1911, 0, 0),
(1024, 1895, 0, 0),
(14771, 17463, 0, 0),
(1025, 2023, 0, 0),
(1028, 1905, 1905, 0),
(1029, 1908, 0, 0),
(1976, 1899, 143, 2551),
(2517, 2183, 1984, 2552),
(1034, 2179, 1897, 0),
(1036, 10898, 1985, 0),
(1037, 1909, 1909, 0),
(1920, 11343, 0, 0),
(1045, 2179, 0, 0),
(2950, 1900, 0, 0),
(1047, 12403, 0, 0),
(1050, 5746, 0, 0),
(1052, 1896, 2052, 0),
(1053, 1910, 0, 0),
(1054, 2884, 0, 0),
(1057, 1907, 0, 0),
(1064, 1905, 1984, 2507),
(2395, 6235, 0, 0),
(1065, 1908, 0, 0),
(1068, 1897, 0, 0),
(7886, 5277, 0, 0),
(1884, 1905, 0, 0),
(1071, 0, 1957, 0),
(1073, 2884, 0, 0),
(1952, 2183, 0, 0),
(1074, 1905, 0, 2552),
(2477, 3326, 0, 0),
(2780, 1906, 0, 0),
(1960, 1911, 0, 0),
(2779, 5747, 0, 0),
(1089, 2180, 1984, 0),
(1090, 2180, 1984, 0),
(2557, 1908, 0, 0),
(1094, 1910, 0, 0),
(3062, 2809, 0, 0),
(1095, 1897, 0, 0),
(1096, 2813, 0, 0),
(2555, 1908, 0, 0),
(1097, 1911, 0, 2552),
(1098, 2180, 2081, 0),
(1101, 2180, 2081, 0),
(1104, 0, 1957, 0),
(1106, 2196, 0, 0),
(2509, 2183, 1984, 2552),
(3014, 6233, 0, 0),
(1833, 1899, 1985, 0),
(2507, 2183, 1984, 2552),
(1115, 1901, 0, 0),
(2344, 12934, 1985, 0),
(1116, 2184, 0, 0),
(1837, 11264, 0, 0),
(1117, 3350, 0, 0),
(2338, 5303, 0, 0),
(1118, 3326, 0, 0),
(1121, 1904, 0, 0),
(1936, 3367, 0, 0),
(1124, 1908, 0, 0),
(1940, 2717, 0, 0),
(2459, 12852, 0, 0),
(1944, 2695, 0, 0),
(1948, 1897, 0, 0),
(1141, 2827, 0, 0),
(1146, 1909, 0, 0),
(1157, 2711, 0, 0),
(1160, 1897, 2052, 0),
(1161, 1904, 0, 0),
(1164, 1901, 0, 0),
(1165, 1908, 0, 0),
(1172, 2184, 0, 0),
(1893, 1899, 1957, 0),
(1173, 1904, 0, 2551),
(1176, 2200, 0, 0),
(1177, 1911, 0, 0),
(1179, 1904, 0, 0),
(1180, 3326, 0, 0),
(1901, 5286, 1984, 0),
(1183, 1907, 0, 0),
(1841, 12951, 0, 0),
(2004, 2184, 0, 0),
(2008, 1901, 0, 0),
(1853, 13622, 0, 0),
(1197, 1908, 0, 0),
(2012, 2809, 0, 0),
(1200, 2177, 0, 0),
(1203, 2180, 2081, 2551),
(1204, 2180, 2081, 2551),
(1205, 1905, 0, 0),
(1206, 1896, 0, 0),
(1210, 2809, 0, 0),
(1213, 1903, 0, 0),
(2306, 5304, 0, 0),
(2594, 2202, 0, 0),
(1229, 2704, 0, 0),
(2386, 1899, 1984, 2551),
(1232, 2705, 1984, 0),
(1236, 1910, 0, 0),
(1957, 2184, 0, 0),
(13445, 12856, 0, 0),
(1237, 2197, 0, 0),
(6490, 2184, 0, 0),
(1243, 0, 0, 2552),
(1965, 2558, 0, 0),
(2610, 2184, 0, 0),
(1245, 1903, 0, 0),
(2466, 2182, 1984, 2552),
(2847, 1903, 0, 0),
(1252, 2705, 0, 0),
(1909, 2813, 0, 0),
(1256, 2714, 0, 0),
(1913, 2810, 2052, 0),
(1260, 1983, 0, 0),
(1917, 2827, 0, 0),
(1265, 2715, 0, 0),
(1266, 2714, 0, 0),
(5283, 6680, 0, 0),
(2352, 2197, 0, 0),
(1267, 2705, 0, 0),
(1268, 1911, 0, 0),
(1276, 2180, 1984, 2552),
(1869, 1983, 0, 0),
(1277, 2182, 1984, 2552),
(2370, 1907, 0, 0),
(2243, 1904, 1985, 0),
(5665, 1899, 1957, 0),
(1280, 2183, 1984, 2552),
(14515, 10616, 10616, 0),
(1281, 2182, 1984, 2552),
(1282, 2809, 1984, 2552),
(1284, 14092, 0, 0),
(1285, 2714, 0, 0),
(1716, 2179, 1897, 0),
(1289, 1903, 0, 0),
(1292, 5278, 0, 0),
(1297, 0, 0, 2552),
(1664, 3364, 1984, 0),
(1298, 0, 0, 2550),
(2189, 2200, 0, 0),
(1301, 2717, 0, 0),
(1668, 0, 0, 5260),
(1302, 2710, 0, 0),
(1305, 2704, 0, 0),
(1308, 1908, 0, 0),
(1676, 1911, 0, 0),
(2782, 1906, 0, 0),
(1311, 2705, 0, 0),
(1312, 0, 0, 6231),
(1313, 1908, 3697, 0),
(3020, 9659, 0, 0),
(1316, 12751, 0, 0),
(3019, 10611, 0, 0),
(1321, 12855, 0, 0),
(1322, 1903, 0, 0),
(1323, 0, 1903, 0),
(1325, 5285, 5285, 0),
(1328, 2716, 0, 0),
(1329, 2809, 1984, 2552),
(1696, 5305, 5305, 0),
(3036, 11542, 0, 0),
(1330, 2183, 1984, 2552),
(4049, 12329, 0, 0),
(1335, 2183, 1984, 2552),
(1336, 2180, 1984, 2552),
(1337, 2183, 1984, 2552),
(1340, 2809, 1984, 0),
(1708, 2184, 1961, 0),
(2814, 1906, 13406, 0),
(1343, 2182, 1984, 0),
(8153, 2184, 0, 0),
(1344, 3774, 0, 0),
(1776, 1907, 0, 0),
(2299, 13721, 0, 0),
(1784, 1908, 0, 0),
(1354, 1906, 0, 0),
(1358, 1910, 0, 0),
(1360, 1910, 0, 0),
(1569, 11365, 0, 0),
(1732, 1907, 0, 0),
(1368, 1117, 0, 0),
(1370, 1117, 0, 0),
(1373, 2705, 0, 0),
(1740, 1905, 0, 2551),
(1375, 2703, 0, 0),
(1377, 2202, 0, 0),
(1680, 1117, 0, 0),
(1684, 5277, 0, 0),
(1382, 3351, 0, 0),
(1387, 3433, 0, 0),
(1393, 1909, 0, 0),
(1397, 1908, 0, 0),
(2283, 2810, 0, 0),
(6389, 1905, 0, 0),
(1772, 1904, 0, 0),
(1407, 1900, 5278, 0),
(2583, 1909, 2081, 0),
(1415, 1907, 0, 0),
(1416, 1903, 0, 0),
(1561, 2184, 2184, 0),
(1565, 2184, 0, 0),
(1421, 1899, 1984, 0),
(1422, 3361, 0, 0),
(1423, 1899, 143, 2551),
(1424, 1910, 0, 0),
(1425, 1905, 0, 0),
(1426, 1910, 0, 0),
(1432, 2717, 0, 0),
(1435, 12959, 0, 0),
(1436, 2180, 2081, 2551),
(1645, 2178, 0, 0),
(1439, 12751, 0, 0),
(1442, 5278, 0, 2550),
(2269, 1910, 0, 0),
(1443, 1908, 0, 0),
(1445, 1899, 1957, 0),
(1748, 2178, 143, 0),
(1447, 1911, 0, 0),
(2774, 1911, 0, 0),
(1448, 1911, 0, 0),
(2267, 1905, 0, 0),
(1449, 1908, 0, 0),
(1752, 5285, 0, 5258),
(1450, 1903, 2052, 0),
(1453, 2198, 0, 0),
(1756, 1899, 143, 2551),
(1537, 1983, 0, 0),
(1459, 0, 0, 2550),
(1460, 1899, 1957, 0),
(1461, 0, 0, 2552),
(6202, 5276, 0, 0),
(2567, 2177, 0, 0),
(1463, 2199, 0, 0),
(1464, 2705, 0, 0),
(1545, 2023, 0, 0),
(1469, 0, 0, 2552),
(2050, 2827, 0, 0),
(1470, 1899, 1957, 0),
(1471, 2557, 0, 0),
(3879, 1897, 1897, 0),
(1473, 2717, 0, 0),
(1475, 1899, 1957, 2551),
(6224, 1911, 0, 6886),
(1476, 2704, 0, 0),
(2857, 1906, 0, 0),
(1483, 1899, 1957, 0),
(2136, 1905, 0, 0),
(1484, 2184, 0, 0),
(1489, 2023, 0, 5870),
(1491, 1905, 0, 0),
(1701, 1910, 0, 0),
(1497, 1906, 0, 0),
(7999, 5598, 0, 14105),
(1499, 12863, 0, 0),
(2216, 2198, 13341, 0),
(1500, 1911, 0, 0),
(1506, 2184, 0, 0),
(1507, 2813, 0, 0),
(1653, 1907, 0, 0),
(1657, 3361, 0, 0),
(1515, 1909, 0, 0),
(2168, 2695, 0, 0),
(1661, 1908, 0, 0),
(2607, 2178, 13814, 0),
(1518, 2200, 0, 0),
(1520, 1899, 0, 0),
(4818, 2184, 0, 0),
(2096, 1899, 143, 0),
(1523, 1909, 0, 0),
(2090, 1909, 1984, 0),
(6266, 2559, 0, 0),
(2120, 13050, 0, 0),
(2114, 6237, 0, 0),
(1535, 1899, 0, 0),
(1536, 1907, 0, 0),
(3005, 5281, 0, 0),
(1538, 1907, 0, 0),
(1543, 2711, 0, 0),
(2486, 1897, 0, 0),
(3003, 2197, 0, 0),
(1544, 1907, 0, 0),
(2510, 2183, 1984, 2552),
(7043, 2177, 0, 0),
(2438, 2715, 0, 0),
(1560, 1909, 0, 0),
(1562, 1907, 0, 0),
(1563, 1897, 0, 0),
(1568, 2714, 0, 0),
(2909, 1910, 0, 0),
(1570, 1899, 0, 0),
(2252, 1901, 0, 0),
(1642, 1899, 143, 2551),
(3053, 0, 0, 2552),
(1650, 1905, 0, 0),
(2534, 5303, 0, 0),
(3051, 1910, 0, 0),
(7157, 1899, 0, 0),
(1663, 3432, 0, 0),
(1667, 1899, 1984, 0),
(6928, 2196, 0, 0),
(1669, 1905, 0, 0),
(1670, 1907, 0, 0),
(2840, 2182, 0, 0),
(1678, 1117, 0, 0),
(1682, 1899, 1957, 0),
(1686, 0, 0, 12523),
(1690, 1903, 0, 0),
(2920, 0, 3695, 0),
(1691, 2703, 0, 0),
(1694, 1899, 1957, 0),
(1715, 5292, 0, 0),
(1717, 2827, 0, 0),
(1718, 2695, 0, 0),
(1725, 5281, 0, 5259),
(2818, 2827, 0, 0),
(1726, 1908, 0, 0),
(2816, 0, 12870, 0),
(1731, 1906, 0, 0),
(6177, 5292, 0, 0),
(1735, 1905, 0, 2551),
(1739, 1905, 0, 2551),
(1741, 1905, 0, 2551),
(2319, 5277, 0, 0),
(1742, 1905, 0, 2551),
(6495, 2703, 0, 0),
(1743, 1905, 0, 2551),
(1746, 1905, 0, 2551),
(1747, 12748, 0, 0),
(1749, 2176, 0, 0),
(1750, 2179, 2711, 0),
(3128, 1897, 0, 0),
(2984, 11542, 0, 0),
(1755, 2179, 0, 0),
(2105, 2182, 1984, 2552),
(2848, 2200, 0, 0),
(1763, 3361, 0, 0),
(2423, 2178, 1984, 0),
(1767, 3494, 0, 0),
(1768, 2023, 0, 0),
(1773, 1907, 0, 0),
(1777, 2200, 3695, 0),
(7034, 1907, 0, 0),
(2375, 2023, 0, 5870),
(2888, 11588, 0, 0),
(1787, 12285, 0, 0),
(1788, 4991, 0, 0),
(1789, 5277, 0, 0),
(5978, 2559, 0, 0),
(14981, 5598, 0, 0),
(2771, 13631, 0, 0),
(2182, 3432, 0, 0),
(2787, 11343, 0, 0),
(6000, 2176, 0, 0),
(1826, 11343, 0, 0),
(2508, 2183, 1984, 2552),
(2653, 5278, 0, 0),
(3533, 5284, 0, 0),
(1827, 2179, 0, 0),
(3521, 2177, 0, 0),
(1831, 1897, 0, 5260),
(2134, 12745, 0, 0),
(3530, 5280, 0, 0),
(1832, 12943, 0, 0),
(2651, 5284, 0, 0),
(2805, 2557, 0, 2552),
(1834, 12934, 12932, 0),
(1835, 10619, 0, 12941),
(1836, 4991, 0, 0),
(1839, 3361, 0, 0),
(2803, 12745, 0, 0),
(1840, 0, 0, 2550),
(1842, 12949, 0, 0),
(2524, 2183, 1984, 2552),
(2733, 2200, 3695, 0),
(3549, 2184, 0, 0),
(3537, 4994, 2081, 0),
(2214, 1897, 2081, 0),
(3546, 2716, 0, 0),
(1848, 2559, 0, 0),
(2302, 5598, 0, 0),
(1855, 14082, 0, 0),
(1865, 1897, 0, 0),
(15045, 3367, 0, 0),
(1888, 12937, 0, 0),
(1889, 2177, 0, 0),
(1890, 1899, 0, 0),
(2717, 2809, 3361, 0),
(1891, 1896, 1961, 5258),
(1895, 5303, 0, 0),
(1896, 5303, 0, 0),
(2715, 5288, 0, 0),
(1911, 1907, 0, 0),
(1912, 2810, 0, 0),
(1914, 2177, 0, 0),
(1919, 2827, 0, 0),
(6382, 2559, 0, 0),
(2584, 2178, 6434, 0),
(1934, 3367, 0, 0),
(1935, 3367, 0, 0),
(1937, 2200, 0, 0),
(1939, 1901, 0, 0),
(1941, 3346, 0, 0),
(1942, 1895, 0, 0),
(2151, 0, 0, 14105),
(1943, 2711, 2711, 0),
(1947, 2559, 0, 0),
(2664, 2827, 2827, 0),
(1950, 1897, 1957, 0),
(2781, 0, 13610, 0),
(1959, 0, 0, 2552),
(14848, 0, 0, 5259),
(1973, 1896, 2052, 0),
(2055, 2199, 3695, 0),
(1977, 1908, 0, 0),
(1978, 1895, 0, 0),
(2562, 2695, 0, 0),
(2618, 1905, 0, 0),
(6069, 2178, 2051, 0),
(3368, 2827, 2196, 0),
(2345, 1901, 0, 2552),
(2648, 11019, 13319, 0),
(3363, 1908, 0, 0),
(2642, 2559, 0, 0),
(988001, 2716, 0, 0),
(2002, 1896, 0, 0),
(2003, 1907, 0, 0),
(2570, 1908, 0, 0),
(2005, 2809, 0, 0),
(6746, 3362, 0, 0),
(3380, 2184, 0, 0),
(2215, 2183, 0, 0),
(2011, 2827, 0, 0),
(2013, 1895, 0, 0),
(2079, 1907, 0, 0),
(6030, 1903, 0, 0),
(2014, 4993, 0, 0),
(6768, 5285, 0, 0),
(2167, 3432, 0, 0),
(2119, 1899, 0, 0),
(2996, 12855, 0, 0),
(2053, 1906, 0, 0),
(2054, 2184, 0, 0),
(3519, 1904, 0, 0),
(3004, 12329, 0, 0),
(3970, 5259, 0, 0),
(2948, 11383, 0, 0),
(3457, 5285, 0, 0),
(2077, 5292, 0, 0),
(2078, 2809, 0, 0),
(2081, 2179, 0, 0),
(3409, 1909, 0, 0),
(2086, 2183, 1984, 0),
(2091, 3432, 0, 0),
(4814, 2177, 0, 0),
(2092, 1911, 0, 0),
(2976, 1910, 0, 0),
(3489, 2827, 13406, 0),
(2102, 2813, 2052, 0),
(2108, 5277, 0, 0),
(3497, 6227, 0, 0),
(2113, 1907, 0, 0),
(4082, 0, 12745, 0),
(2115, 2197, 0, 0),
(2116, 1903, 0, 0),
(3060, 12329, 0, 0),
(2117, 1896, 0, 0),
(2118, 2715, 0, 0),
(3064, 12322, 0, 0),
(2121, 2176, 0, 0),
(2122, 1900, 0, 0),
(4090, 2176, 0, 0),
(2123, 2813, 0, 0),
(2124, 11343, 0, 0),
(3577, 2705, 0, 0),
(2126, 5276, 0, 0),
(2127, 11343, 0, 0),
(2128, 5277, 0, 0),
(2849, 2827, 2827, 0),
(3366, 3699, 0, 0),
(3008, 10616, 0, 0),
(2129, 2813, 0, 0),
(3875, 2827, 0, 0),
(2130, 10616, 0, 0),
(2131, 1899, 0, 0),
(2132, 3699, 3697, 0),
(2135, 1903, 0, 0),
(3374, 1910, 0, 0),
(3016, 12745, 12745, 0),
(2137, 1907, 0, 0),
(2861, 3433, 0, 0),
(2140, 1905, 12745, 0),
(3529, 1903, 0, 0),
(2142, 2180, 2081, 0),
(2968, 0, 0, 2550),
(2153, 1906, 0, 0),
(3487, 12745, 12745, 0),
(3481, 11763, 0, 0),
(2158, 1904, 0, 0),
(2159, 1901, 0, 0),
(5603, 5287, 0, 0),
(2160, 2695, 0, 0),
(3044, 12786, 0, 0),
(3553, 1903, 0, 0),
(3048, 2177, 0, 0),
(2169, 1908, 0, 0),
(2170, 1904, 0, 0),
(2171, 5276, 0, 0),
(3567, 12328, 0, 0),
(3052, 6680, 0, 0),
(3561, 5285, 3694, 0),
(6126, 2184, 0, 0),
(3350, 1906, 12745, 0),
(5392, 1910, 0, 0),
(2179, 2695, 0, 0),
(2180, 4993, 0, 0),
(2837, 2198, 0, 0),
(2181, 2023, 0, 0),
(3348, 2198, 0, 0),
(2183, 1897, 2053, 0),
(2184, 5286, 0, 5259),
(3358, 2714, 0, 0),
(2845, 1903, 0, 0),
(2190, 1895, 0, 0),
(3356, 1903, 13611, 0),
(2191, 1907, 0, 0),
(2913, 2714, 0, 0),
(2201, 1897, 0, 0),
(3947, 5292, 0, 0),
(2202, 2184, 0, 0),
(2203, 1907, 0, 0),
(2204, 2809, 0, 0),
(2206, 2023, 0, 5870),
(3436, 5304, 0, 0),
(2207, 1908, 0, 0),
(2208, 3368, 0, 0),
(3382, 1911, 0, 2552),
(3024, 12801, 0, 0),
(2209, 1905, 0, 2551),
(2211, 2184, 0, 0),
(3543, 1903, 0, 0),
(2212, 0, 0, 5262),
(3334, 2199, 0, 0),
(2225, 1910, 0, 0),
(2226, 5303, 0, 0),
(2228, 2704, 0, 0),
(2821, 2717, 13407, 0),
(2229, 1897, 0, 0),
(3332, 1117, 0, 0),
(3342, 12329, 0, 0),
(3622, 3433, 0, 0),
(2240, 2184, 0, 0),
(3414, 1899, 0, 0),
(2241, 2184, 0, 0),
(987000, 21580, 0, 0),
(2242, 2184, 0, 0),
(2244, 2559, 0, 0),
(3621, 2827, 0, 0),
(3412, 4994, 0, 0),
(2247, 1983, 0, 0),
(4652, 2711, 0, 0),
(2254, 1904, 0, 0),
(3629, 3757, 0, 0),
(2255, 1907, 0, 0),
(2977, 1906, 0, 0),
(2256, 3326, 0, 0),
(3494, 4994, 0, 0),
(2257, 5287, 0, 0),
(4656, 6680, 0, 0),
(2981, 5289, 0, 0),
(2260, 2711, 0, 0),
(5466, 5293, 0, 0),
(2261, 1906, 0, 0),
(3492, 2184, 0, 0),
(2263, 2180, 0, 0),
(2985, 1983, 0, 0),
(2264, 2184, 0, 0),
(2265, 1903, 0, 0),
(3502, 3361, 0, 2552),
(2989, 3346, 0, 0),
(2268, 1896, 2052, 0),
(2270, 1983, 0, 0),
(2271, 3364, 11041, 0),
(2272, 2176, 0, 0),
(2276, 12748, 0, 0),
(2277, 12421, 0, 0),
(2941, 5301, 0, 0),
(2287, 1909, 0, 0),
(3404, 6233, 0, 0),
(2303, 5285, 0, 0),
(2304, 6224, 0, 0),
(2305, 1903, 0, 0),
(2307, 2714, 0, 0),
(2308, 2559, 0, 0),
(2309, 3367, 0, 0),
(2740, 2559, 0, 0),
(2310, 6235, 0, 0),
(3263, 5276, 0, 0),
(2748, 2557, 0, 0),
(2318, 2559, 0, 0),
(5251, 1904, 0, 2552),
(2320, 5286, 5286, 0),
(3207, 5303, 0, 0),
(2324, 1897, 0, 0),
(2326, 2705, 0, 0),
(2696, 2705, 2081, 0),
(5269, 3361, 0, 0),
(3215, 2023, 0, 14642),
(2332, 5281, 0, 0),
(2333, 2704, 0, 0),
(2700, 1899, 6434, 0),
(3209, 2023, 0, 0),
(2335, 12748, 0, 0),
(2337, 2559, 0, 0),
(2640, 2176, 0, 0),
(3666, 1911, 0, 0),
(2339, 5301, 0, 0),
(3167, 5532, 0, 0),
(4047, 5304, 0, 0),
(2652, 1905, 0, 0),
(3161, 0, 1961, 0),
(2357, 12329, 0, 0),
(3233, 1906, 0, 0),
(2358, 2177, 0, 0),
(2363, 2199, 0, 0),
(2364, 2703, 0, 0),
(4063, 2177, 0, 0),
(2365, 2827, 13406, 0),
(2366, 2717, 0, 0),
(2367, 3368, 0, 0),
(2368, 1897, 0, 0),
(13555, 14706, 0, 0),
(2369, 2023, 0, 5870),
(2371, 2177, 0, 0),
(3319, 0, 1985, 0),
(2372, 2813, 0, 0),
(2373, 1908, 0, 0),
(2804, 12889, 0, 0),
(3313, 1906, 12745, 0),
(2374, 2184, 0, 0),
(2377, 2023, 0, 0),
(2808, 12745, 0, 0),
(2378, 12863, 0, 0),
(2379, 3346, 13610, 0),
(3327, 2184, 0, 0),
(2380, 2198, 12870, 0),
(2381, 1903, 0, 0),
(2812, 3699, 3697, 0),
(2382, 3367, 0, 0),
(2383, 1117, 0, 0),
(2387, 1907, 0, 0),
(3271, 1907, 0, 0),
(2388, 2703, 2081, 0),
(2597, 2178, 2178, 0),
(2389, 5303, 0, 0),
(3265, 1905, 0, 2551),
(2390, 2707, 0, 0),
(2391, 0, 3698, 0),
(2392, 3362, 0, 0),
(2601, 2183, 0, 0),
(2393, 1910, 0, 0),
(5333, 5746, 0, 0),
(2394, 0, 3698, 0),
(2396, 3367, 0, 0),
(2605, 1905, 1905, 0),
(2397, 12852, 0, 0),
(2764, 2176, 0, 0),
(3273, 5304, 0, 0),
(2398, 2714, 0, 0),
(2399, 2184, 0, 0),
(5838, 2023, 0, 5870),
(2400, 3367, 0, 0),
(2401, 5277, 12745, 0),
(2704, 12294, 0, 0),
(3730, 1906, 0, 0),
(2403, 1909, 0, 0),
(3223, 2023, 0, 14642),
(2404, 1903, 0, 0),
(2405, 2147, 2052, 2551),
(2708, 11343, 0, 0),
(3217, 2023, 0, 14642),
(2712, 1896, 1985, 0),
(2410, 2177, 0, 0),
(2716, 2809, 0, 0),
(2415, 1907, 0, 0),
(2416, 2813, 0, 0),
(2417, 5277, 0, 0),
(2784, 12883, 12883, 0),
(2419, 2147, 2081, 0),
(2420, 5288, 0, 0),
(2421, 6680, 0, 0),
(2788, 5276, 0, 0),
(3297, 1904, 0, 2507),
(2422, 3361, 0, 0),
(2792, 12290, 0, 0),
(2427, 1906, 0, 0),
(2428, 5278, 0, 5259),
(2429, 12937, 0, 0),
(2796, 1896, 0, 0),
(3305, 10611, 10611, 0),
(2430, 2827, 0, 0),
(2431, 5278, 0, 0),
(5870, 2827, 13407, 0),
(2432, 2715, 0, 0),
(2577, 1907, 0, 0),
(3603, 3699, 3697, 0),
(2434, 2711, 0, 0),
(2436, 3367, 0, 0),
(2581, 1896, 2053, 0),
(2437, 12863, 0, 0),
(3092, 12629, 0, 0),
(2440, 2703, 0, 0),
(2585, 2557, 0, 0),
(2448, 12742, 0, 0),
(3174, 1903, 0, 0),
(2449, 2714, 12745, 0),
(3683, 2184, 0, 0),
(2451, 3367, 0, 0),
(5146, 2177, 0, 0),
(3172, 1907, 0, 0),
(3691, 3432, 0, 13147),
(2458, 12856, 0, 0),
(2464, 2183, 1905, 0),
(2609, 2177, 0, 0),
(2465, 5303, 0, 0),
(2768, 1911, 2081, 0),
(3287, 1895, 0, 0),
(2468, 2182, 1984, 2552),
(2469, 2182, 1984, 2552),
(2772, 1908, 0, 0),
(2470, 2180, 2081, 2551),
(2621, 10612, 12453, 5260),
(2478, 1908, 0, 0),
(5695, 1899, 0, 0),
(2480, 2198, 3697, 0),
(3078, 0, 0, 12523),
(2481, 2198, 0, 0),
(3587, 2197, 0, 0),
(2483, 5287, 0, 0),
(5178, 2200, 3695, 0),
(2485, 5304, 0, 0),
(3076, 0, 12745, 0),
(2488, 1897, 0, 0),
(2569, 1903, 1901, 0),
(2489, 2177, 0, 0),
(3595, 2813, 0, 0),
(2490, 5278, 0, 0),
(2492, 2177, 0, 0),
(2573, 1907, 0, 0),
(13839, 18167, 18166, 15460),
(3084, 12754, 0, 14642),
(2496, 3364, 5284, 0),
(2641, 2023, 0, 5870),
(2645, 2183, 0, 5258),
(3877, 3432, 0, 0),
(3156, 11343, 0, 0),
(2503, 5293, 0, 0),
(2504, 12742, 0, 0),
(2649, 1909, 0, 5856),
(3164, 0, 12745, 0),
(2511, 2183, 1984, 2552),
(2512, 2183, 1984, 2552),
(2721, 1899, 1985, 0),
(2514, 2183, 1984, 2552),
(2516, 2183, 1984, 2552),
(2519, 1908, 0, 0),
(2526, 2183, 1984, 2552),
(2527, 2183, 1984, 2552),
(2528, 2183, 1984, 2552),
(3190, 2184, 0, 0),
(2530, 2183, 0, 0),
(5232, 5301, 0, 0),
(3188, 12322, 0, 0),
(3198, 2809, 0, 0),
(5759, 2827, 0, 0),
(3196, 2809, 0, 0),
(2543, 12182, 0, 0),
(3142, 10611, 0, 0),
(2545, 2711, 0, 0),
(2546, 2179, 1897, 0),
(2548, 2179, 0, 2552),
(2549, 5288, 0, 0),
(2550, 1900, 0, 0),
(3140, 2184, 0, 0),
(3150, 2714, 0, 0),
(2553, 1908, 0, 0),
(2554, 1905, 1905, 5856),
(2556, 2827, 0, 0),
(2558, 1909, 1909, 0),
(2564, 1904, 0, 0),
(2566, 2695, 0, 0),
(2571, 5301, 0, 0),
(2572, 2711, 0, 0),
(2574, 1910, 0, 0),
(2575, 2717, 3757, 0),
(3458, 1908, 0, 0),
(3975, 7612, 0, 0),
(3969, 1911, 13341, 0),
(2582, 3367, 0, 0),
(2586, 2184, 0, 0),
(2587, 1897, 0, 5261),
(3983, 5532, 5532, 0),
(2588, 2711, 0, 0),
(2589, 1899, 1896, 0),
(3977, 7826, 0, 0),
(2590, 2711, 0, 0),
(3921, 1899, 0, 0),
(2598, 2559, 0, 0),
(2602, 2177, 0, 0),
(4309, 12461, 0, 0),
(3418, 13337, 0, 0),
(2603, 2813, 0, 0),
(4302, 5491, 0, 0),
(3935, 2827, 0, 0),
(2604, 3326, 0, 0),
(3272, 1895, 0, 5258),
(2606, 13631, 0, 5870),
(4306, 5532, 0, 0),
(2608, 3361, 6434, 0),
(3490, 6233, 0, 0),
(2612, 12934, 6434, 0),
(3498, 12745, 0, 0),
(2619, 10612, 0, 0),
(2622, 2184, 3698, 0),
(2624, 1908, 0, 0),
(14323, 5286, 1985, 0),
(2626, 1117, 0, 0),
(4087, 5599, 0, 0),
(2628, 1903, 0, 0),
(14277, 0, 0, 13147),
(3578, 1910, 0, 0),
(4095, 5301, 0, 0),
(2636, 3364, 0, 0),
(4089, 2179, 2053, 0),
(2639, 1909, 0, 5856),
(3522, 2184, 0, 0),
(2643, 5286, 5286, 0),
(2644, 5281, 2184, 0),
(2650, 1905, 0, 0),
(2654, 2176, 0, 0),
(3884, 2197, 0, 0),
(3482, 1910, 0, 0),
(3999, 1910, 0, 0),
(3993, 1911, 0, 0),
(6115, 2809, 0, 0),
(3554, 5281, 0, 0),
(4065, 1905, 1957, 0),
(3562, 1908, 0, 0),
(2683, 1911, 0, 0),
(4079, 3432, 0, 0),
(5614, 2716, 0, 0),
(2687, 4994, 0, 0),
(2691, 2179, 0, 5262),
(2692, 1900, 0, 0),
(2693, 2180, 0, 5262),
(2695, 2714, 0, 0),
(3355, 1903, 0, 0),
(2698, 10619, 12870, 0),
(2701, 5286, 0, 0),
(2703, 2023, 0, 0),
(3942, 5304, 0, 0),
(2705, 2705, 0, 0),
(2706, 12943, 0, 0),
(2711, 2177, 0, 0),
(2713, 1907, 0, 0),
(3435, 5287, 0, 0),
(2714, 12937, 0, 0),
(2718, 1907, 0, 0),
(2719, 1983, 0, 0),
(2720, 1908, 0, 0),
(3387, 9659, 0, 0),
(2737, 3494, 11506, 0),
(3331, 2178, 0, 0),
(2738, 3432, 0, 0),
(2739, 1910, 0, 0),
(2743, 6680, 0, 0),
(2744, 1905, 1984, 0),
(3926, 3364, 0, 5260),
(3411, 2827, 13406, 5258),
(2754, 5491, 0, 0),
(3924, 5276, 0, 0),
(3934, 3362, 0, 0),
(2765, 1905, 2052, 0),
(3932, 1905, 1985, 0),
(2767, 2184, 0, 2552),
(2769, 3364, 0, 0),
(3491, 1903, 0, 0),
(2770, 1899, 0, 0),
(4004, 5284, 0, 0),
(2775, 6680, 0, 0),
(3499, 2184, 0, 0),
(2778, 1897, 13610, 0),
(3133, 4994, 0, 0),
(2785, 1908, 0, 0),
(3443, 2202, 0, 0),
(2786, 5285, 0, 0),
(2789, 2711, 0, 0),
(3964, 2198, 0, 0),
(2799, 2184, 0, 0),
(2802, 3364, 0, 0),
(3403, 5300, 0, 0),
(2810, 2184, 13609, 0),
(2819, 10619, 2081, 0),
(2820, 2703, 13407, 0),
(2834, 19485, 0, 0),
(2835, 11424, 0, 0),
(2836, 1903, 0, 0),
(3713, 1983, 0, 0),
(2838, 2884, 0, 0),
(2842, 1117, 0, 0),
(3210, 2023, 0, 14642),
(2843, 1899, 0, 0),
(3727, 5289, 0, 0),
(2846, 1903, 0, 0),
(2858, 3433, 0, 0),
(4565, 13050, 0, 0),
(2859, 5491, 0, 0),
(4558, 2184, 0, 0),
(2860, 1903, 0, 0),
(3745, 1905, 0, 5258),
(3536, 12850, 0, 0),
(3544, 12850, 0, 0),
(2878, 2023, 0, 0),
(4569, 2147, 0, 0),
(2880, 5281, 0, 0),
(2892, 1907, 0, 0),
(2893, 1901, 0, 0),
(2894, 1908, 0, 0),
(3274, 1899, 0, 0),
(2907, 6334, 0, 0),
(4217, 5600, 0, 0),
(16059, 22199, 0, 0),
(2910, 1906, 0, 0),
(2911, 2714, 0, 0),
(3218, 2023, 0, 14642),
(3735, 4993, 0, 0),
(2916, 12742, 0, 0),
(2917, 1910, 0, 0),
(2918, 5304, 0, 0),
(2921, 4994, 0, 0),
(3743, 1983, 0, 0),
(3737, 2023, 0, 0),
(5859, 5287, 0, 0),
(3298, 13861, 0, 0),
(2932, 4991, 0, 0),
(2934, 2177, 0, 0),
(2937, 3368, 0, 0),
(2947, 0, 0, 2552),
(2949, 2809, 0, 0),
(2951, 1896, 2052, 2551),
(2952, 5261, 0, 0),
(3614, 2718, 0, 0),
(2953, 1908, 0, 0),
(5151, 2707, 3694, 0),
(3171, 10612, 0, 0),
(5658, 3366, 0, 0),
(3684, 5284, 0, 0),
(2967, 1896, 1957, 0),
(3694, 3432, 0, 0),
(3179, 1117, 0, 0),
(3692, 11322, 0, 0),
(2975, 2184, 0, 0),
(2978, 1910, 0, 0),
(3282, 1896, 0, 5262),
(2979, 1903, 0, 0),
(5680, 2695, 0, 0),
(2980, 2023, 0, 0),
(2982, 1906, 0, 0),
(2986, 5301, 0, 0),
(3290, 1911, 0, 0),
(2987, 2023, 0, 0),
(3807, 2711, 5280, 0),
(2988, 12754, 0, 0),
(3801, 5277, 0, 0),
(2990, 2176, 0, 0),
(3644, 3494, 0, 0),
(2993, 3433, 0, 0),
(3075, 0, 1984, 0),
(2995, 6680, 0, 0),
(2997, 5292, 0, 0),
(5690, 1117, 6227, 0),
(3588, 1896, 0, 0),
(2999, 5532, 0, 0),
(3598, 2180, 0, 0),
(3001, 1910, 0, 0),
(3083, 5288, 0, 0),
(3002, 1910, 0, 0),
(3596, 1905, 0, 0),
(3007, 2711, 0, 0),
(3155, 2711, 0, 0),
(3010, 2200, 3695, 0),
(3011, 13061, 0, 0),
(5712, 2810, 0, 0),
(3012, 1906, 0, 0),
(3013, 1907, 0, 0),
(3365, 5300, 0, 0),
(3015, 0, 0, 5259),
(3678, 1908, 0, 0),
(3017, 2184, 0, 0),
(3163, 1909, 0, 0),
(3018, 0, 0, 2552),
(3021, 10878, 0, 0),
(3022, 5277, 0, 0),
(3373, 1907, 0, 0),
(3023, 1907, 0, 0),
(3026, 2196, 0, 0),
(3027, 5278, 2081, 0),
(3028, 6229, 0, 0),
(3029, 1117, 0, 0),
(3748, 5276, 0, 0),
(3381, 1897, 0, 0),
(3031, 5304, 0, 0),
(3390, 2200, 12870, 0),
(3032, 5291, 0, 0),
(3033, 12322, 0, 0),
(3034, 13337, 0, 0),
(3038, 10612, 0, 0),
(3389, 6680, 0, 0),
(3039, 3433, 0, 0),
(3040, 0, 0, 5261),
(3041, 10611, 12452, 0),
(3187, 1910, 0, 0),
(3042, 5289, 0, 0),
(3043, 12297, 12453, 0),
(5744, 5285, 5285, 0),
(3045, 2810, 13219, 0),
(3046, 12591, 0, 0),
(3047, 2177, 12865, 0),
(3049, 12868, 0, 12941),
(3195, 2695, 0, 0),
(3050, 5301, 0, 0),
(3054, 1908, 0, 0),
(3708, 2197, 0, 0),
(3055, 1907, 0, 0),
(3057, 14084, 0, 0),
(3139, 3361, 0, 0),
(3059, 10611, 1957, 0),
(3061, 0, 0, 14642),
(5754, 0, 0, 6231),
(3063, 10612, 12453, 0),
(3662, 2711, 0, 0),
(3065, 5287, 0, 0),
(3147, 1905, 0, 0),
(3066, 1901, 0, 0),
(3067, 2827, 0, 0),
(3072, 2197, 0, 0),
(12723, 12322, 0, 0),
(3073, 2147, 0, 0),
(3077, 12297, 0, 0),
(3081, 1910, 0, 0),
(3087, 2827, 0, 0),
(4483, 3361, 2053, 0),
(3088, 0, 0, 2552),
(3093, 5291, 0, 0),
(3095, 12297, 0, 0),
(3976, 7706, 0, 0),
(3097, 1903, 0, 0),
(3980, 12883, 12751, 0),
(3101, 2695, 0, 0),
(3104, 12285, 0, 0),
(4803, 5276, 0, 0),
(3114, 1896, 1961, 0),
(3119, 1896, 0, 0),
(4515, 5291, 0, 0),
(3120, 2813, 0, 2550),
(3135, 6237, 0, 0),
(5849, 2884, 0, 0),
(3136, 1903, 0, 0),
(12787, 2178, 143, 0),
(4080, 2023, 0, 0),
(3137, 1910, 0, 0),
(4084, 2184, 12745, 0),
(4088, 5598, 0, 0),
(3145, 1907, 0, 0),
(4092, 1907, 0, 0),
(3149, 2714, 0, 0),
(3153, 10612, 0, 0),
(3157, 2813, 0, 0),
(3159, 1896, 0, 0),
(3165, 0, 0, 5260),
(3168, 2198, 0, 0),
(3169, 1899, 1957, 0),
(3170, 12298, 0, 0),
(3173, 6334, 0, 0),
(3177, 11762, 0, 0),
(3178, 1117, 0, 0),
(3180, 3774, 0, 0),
(3996, 1908, 0, 0),
(3181, 1899, 1957, 0),
(3183, 5303, 0, 0),
(3184, 0, 3697, 0),
(4064, 1896, 1957, 5258),
(3185, 6233, 0, 0),
(3186, 12745, 0, 0),
(3189, 2023, 0, 0),
(3193, 3362, 0, 0),
(4597, 1903, 0, 0),
(3194, 5278, 0, 0),
(3197, 1983, 0, 0),
(5102, 1896, 0, 0),
(3199, 1907, 0, 0),
(4368, 13150, 0, 0),
(3203, 1907, 0, 0),
(3204, 5285, 0, 0),
(3208, 1908, 0, 0),
(3211, 2023, 0, 14642),
(3212, 2023, 0, 14642),
(4895, 2703, 0, 0),
(3214, 2023, 0, 14642),
(3216, 2559, 0, 0),
(3219, 2023, 0, 14642),
(3941, 5287, 0, 0),
(3220, 2023, 0, 14642),
(3221, 2023, 0, 14642),
(3945, 3361, 0, 2552),
(3224, 2023, 0, 14642),
(3230, 14870, 0, 0),
(3232, 1899, 0, 0),
(3841, 0, 0, 5259),
(3845, 5287, 0, 5262),
(3849, 1899, 0, 0),
(3258, 2184, 0, 2551),
(3260, 5303, 0, 0),
(3266, 1904, 0, 0),
(4641, 5303, 0, 0),
(3267, 2827, 0, 0),
(3925, 2183, 0, 0),
(3268, 1905, 0, 0),
(3269, 1906, 0, 0),
(3933, 2202, 0, 0),
(4959, 1117, 0, 0),
(3283, 5288, 0, 0),
(3284, 3346, 0, 0),
(4442, 1899, 1985, 0),
(3285, 3346, 0, 0),
(5675, 11343, 0, 0),
(3292, 2704, 2704, 0),
(3293, 1911, 0, 0),
(3294, 1904, 0, 0),
(3296, 5289, 0, 2507),
(3301, 4991, 0, 0),
(3304, 12329, 0, 0),
(3309, 12852, 12855, 0),
(3310, 3433, 0, 0),
(3312, 2827, 2196, 2551),
(3314, 10611, 0, 0),
(3315, 1896, 0, 0),
(3318, 12856, 12858, 0),
(3320, 12850, 12745, 0),
(3322, 0, 0, 2552),
(3324, 5277, 0, 0),
(3325, 5277, 0, 0),
(3326, 5277, 0, 0),
(3328, 5278, 0, 0),
(12467, 13150, 0, 0),
(3329, 3346, 0, 0),
(3330, 5304, 0, 0),
(3333, 1117, 0, 0),
(3336, 5278, 0, 0),
(3337, 5291, 0, 0),
(3338, 17383, 0, 0),
(3339, 3364, 0, 0),
(3772, 13504, 0, 0),
(3341, 2023, 0, 0),
(3343, 1903, 2081, 0),
(3344, 3361, 0, 0),
(3712, 1899, 0, 0),
(3345, 12746, 0, 6230),
(3347, 3699, 3697, 0),
(3349, 5304, 0, 0),
(3352, 0, 0, 5262),
(3353, 10612, 10611, 0),
(3354, 1983, 0, 0),
(3357, 1910, 0, 0),
(3359, 4994, 0, 0),
(3360, 3361, 0, 0),
(3664, 5303, 0, 0),
(3361, 1897, 0, 0),
(3362, 2147, 0, 0),
(3672, 3326, 0, 0),
(3369, 0, 12745, 0),
(3370, 5303, 0, 0),
(3375, 1906, 0, 6088),
(4259, 5532, 0, 0),
(3376, 1983, 0, 0),
(3377, 2147, 0, 2552),
(3386, 12328, 0, 0),
(3388, 12322, 0, 0),
(4782, 2196, 0, 0),
(3391, 4994, 2705, 12523),
(3392, 1910, 0, 0),
(3393, 1905, 0, 0),
(3396, 1900, 0, 0),
(3397, 1904, 0, 0),
(3399, 2827, 0, 0),
(3401, 1900, 5281, 0),
(3402, 10617, 0, 0),
(3836, 2177, 0, 0),
(3405, 3696, 0, 0),
(3406, 3433, 0, 0),
(3407, 3433, 0, 0),
(4291, 5304, 0, 0),
(3408, 12290, 0, 0),
(3413, 1911, 0, 0),
(3421, 1910, 0, 0),
(3728, 1908, 0, 0),
(3428, 1908, 0, 0),
(3732, 5304, 0, 0),
(3429, 11322, 0, 0),
(3431, 1904, 0, 0),
(3432, 11019, 2052, 0),
(3736, 1906, 1906, 0),
(3433, 1903, 0, 0),
(3434, 1908, 0, 0),
(3808, 2147, 0, 6886),
(3441, 3433, 0, 0),
(3445, 1911, 0, 0),
(3446, 2704, 0, 0),
(3449, 2711, 0, 0),
(3453, 2695, 0, 0),
(3454, 2147, 2081, 0),
(4846, 1910, 0, 0),
(3455, 1906, 0, 0),
(3601, 2183, 0, 0),
(3456, 5281, 0, 2551),
(4112, 2184, 0, 0),
(3459, 2147, 1985, 0),
(3609, 1903, 0, 0),
(3464, 11042, 0, 0),
(3467, 3364, 0, 0),
(3468, 5532, 0, 0),
(4639, 2023, 0, 0),
(3470, 1905, 0, 0),
(3471, 1911, 0, 0),
(3477, 1903, 0, 0),
(3479, 10612, 0, 0),
(3689, 12297, 2197, 0),
(3480, 2197, 0, 0),
(3483, 2711, 0, 0),
(3484, 12991, 0, 0),
(3486, 2184, 0, 0),
(3488, 0, 0, 5262),
(3493, 5532, 0, 0),
(3495, 1911, 0, 0),
(3496, 12850, 12858, 0),
(3804, 5280, 0, 0),
(3501, 12285, 0, 5260),
(4624, 3361, 0, 2552),
(3589, 0, 0, 5258),
(3593, 1899, 0, 0),
(3597, 5292, 0, 0),
(3516, 11424, 0, 0),
(3518, 2197, 0, 0),
(3665, 2717, 0, 0),
(4897, 1903, 0, 0),
(3523, 2714, 0, 0),
(3673, 5287, 0, 0),
(3528, 1903, 0, 0),
(3531, 5280, 0, 0),
(3534, 11424, 0, 0),
(5932, 5532, 5532, 0),
(3539, 10611, 0, 0),
(3749, 1899, 0, 0),
(3540, 1117, 0, 0),
(3541, 12745, 0, 0),
(5931, 1910, 0, 0),
(3547, 12852, 0, 0),
(3550, 6227, 19485, 0),
(3551, 2201, 3694, 0),
(3552, 2184, 0, 0),
(3555, 1910, 0, 0),
(3556, 2184, 0, 0),
(3557, 1903, 0, 0),
(3705, 2196, 0, 0),
(3649, 2813, 0, 6886),
(3571, 5598, 0, 2550),
(12352, 2813, 0, 0),
(3572, 1117, 0, 0),
(4218, 5293, 0, 0),
(3594, 5281, 0, 0),
(3599, 2178, 0, 0),
(4995, 5305, 1984, 0),
(3600, 2176, 0, 0),
(3610, 0, 0, 5259),
(4494, 2177, 0, 0),
(3615, 3433, 0, 0),
(3657, 3432, 0, 0),
(3658, 5280, 0, 0),
(3660, 5277, 0, 0),
(3661, 2711, 0, 0),
(3663, 2557, 0, 0),
(12798, 12403, 0, 0),
(3669, 3494, 1906, 0),
(5091, 1899, 1984, 0),
(3696, 2711, 0, 5258),
(3704, 1907, 0, 0),
(5109, 2197, 0, 0),
(3706, 2176, 0, 0),
(3707, 2558, 0, 0),
(4590, 12745, 12745, 0),
(3711, 3367, 0, 0),
(4880, 12855, 0, 0),
(3715, 2176, 0, 0),
(3717, 5276, 0, 0),
(4890, 6224, 0, 0),
(3733, 5281, 3757, 0),
(3739, 5278, 2052, 0),
(3740, 2023, 0, 5870),
(3742, 5276, 0, 0),
(4922, 1899, 1984, 0),
(3779, 2177, 0, 0),
(5163, 1911, 0, 0),
(4954, 0, 13407, 0),
(3806, 2711, 0, 0),
(3840, 3494, 11314, 0),
(3872, 4991, 0, 0),
(4547, 5278, 0, 0),
(3873, 2147, 2052, 0),
(3882, 2827, 0, 0),
(3883, 2197, 0, 0),
(3887, 11264, 0, 0),
(5593, 3433, 0, 0),
(3936, 5598, 0, 0),
(3943, 5747, 0, 0),
(3946, 3432, 0, 0),
(3951, 0, 0, 5258),
(3959, 2197, 0, 0),
(4853, 1908, 0, 0),
(3963, 0, 0, 5258),
(3965, 6233, 0, 0),
(4334, 5532, 0, 0),
(3974, 5286, 5286, 0),
(3978, 2558, 0, 0),
(3979, 12863, 0, 0),
(3982, 12801, 0, 0),
(3986, 2177, 0, 0),
(3987, 6334, 0, 0),
(4634, 5278, 0, 0),
(3989, 5286, 0, 5856),
(3991, 5276, 0, 0),
(3998, 1906, 0, 0),
(4159, 2703, 0, 0),
(4666, 5285, 5281, 0),
(4046, 13336, 0, 0),
(4051, 13336, 0, 0),
(4053, 2023, 0, 5870),
(4062, 2884, 0, 0),
(4720, 1911, 0, 0),
(4223, 3351, 0, 0),
(4078, 5304, 0, 0),
(4083, 4993, 0, 0),
(12864, 5278, 0, 14118),
(4085, 12856, 2081, 0),
(4086, 12852, 0, 0),
(4094, 1905, 0, 5261),
(4096, 5303, 0, 0),
(11699, 12748, 0, 0),
(4097, 5304, 0, 0),
(4099, 2179, 0, 0),
(5044, 1899, 1984, 0),
(5052, 2184, 0, 0),
(4111, 2813, 0, 0),
(4113, 3346, 0, 0),
(4114, 6227, 0, 0),
(5511, 1903, 0, 0),
(4116, 1908, 0, 0),
(5505, 5293, 0, 0),
(5519, 1911, 0, 0),
(5513, 1910, 0, 0),
(7884, 5277, 0, 0),
(4948, 1896, 0, 0),
(4138, 5278, 0, 5262),
(4146, 0, 0, 5259),
(5840, 1899, 0, 0),
(4156, 1117, 0, 0),
(5848, 3361, 2704, 0),
(4160, 2716, 3695, 0),
(4161, 5598, 0, 0),
(4163, 5281, 0, 0),
(6130, 5747, 0, 0),
(5623, 2179, 1897, 0),
(4165, 2177, 0, 0),
(5617, 1907, 0, 0),
(5112, 2703, 0, 0),
(4169, 2196, 0, 0),
(4171, 1899, 0, 0),
(6138, 1901, 0, 0),
(5116, 0, 0, 2552),
(4173, 0, 0, 5262),
(4175, 12993, 12993, 0),
(5414, 2717, 3757, 0),
(4180, 3366, 0, 0),
(5569, 4994, 0, 0),
(7975, 12754, 0, 14642),
(5412, 5300, 0, 0),
(4183, 1902, 0, 5870),
(6090, 2704, 3757, 0),
(4188, 12855, 0, 0),
(4190, 2197, 0, 0),
(4193, 5278, 0, 0),
(4197, 2023, 0, 0),
(4198, 11343, 0, 0),
(4200, 19485, 0, 0),
(4201, 1911, 13341, 0),
(4202, 1911, 0, 0),
(4203, 1899, 0, 0),
(4204, 1908, 0, 0),
(4205, 0, 0, 5259),
(5088, 1899, 1984, 0),
(4210, 2196, 0, 0),
(6114, 1909, 0, 0),
(5607, 1117, 0, 0),
(5092, 1899, 1984, 0),
(5601, 3361, 2052, 0),
(4214, 2179, 0, 0),
(4215, 2180, 0, 0),
(4216, 6233, 0, 0),
(4219, 3494, 0, 0),
(5615, 5278, 0, 0),
(4220, 3696, 0, 0),
(5100, 1911, 0, 0),
(4221, 1117, 0, 0),
(5609, 2703, 0, 0),
(4222, 1117, 0, 0),
(4225, 5491, 0, 0),
(4226, 2200, 3695, 0),
(5907, 1908, 0, 0),
(4885, 12329, 0, 0),
(4228, 5598, 0, 0),
(4229, 2197, 0, 0),
(4230, 12852, 0, 0),
(5396, 2178, 143, 0),
(4231, 1896, 0, 0),
(4889, 0, 0, 12523),
(4232, 1905, 0, 0),
(4233, 2809, 0, 0),
(4234, 5303, 0, 0),
(5915, 5292, 0, 0),
(4235, 2184, 0, 0),
(4893, 2703, 0, 0),
(4236, 2197, 0, 0),
(4240, 1908, 0, 0),
(4965, 13316, 0, 0),
(4973, 0, 0, 5258),
(4254, 1910, 0, 0),
(5484, 1907, 0, 0),
(4255, 2703, 0, 0),
(4256, 1910, 0, 0),
(4257, 1903, 0, 0),
(4258, 1903, 0, 0),
(5939, 12328, 0, 0),
(5591, 1904, 0, 5262),
(4262, 5598, 0, 2550),
(8150, 2196, 0, 0),
(4921, 1899, 1984, 0),
(4266, 12856, 0, 0),
(4275, 6322, 0, 0),
(11520, 11321, 0, 0),
(4276, 1910, 13610, 0),
(4278, 2179, 1984, 0),
(7943, 6227, 0, 0),
(4280, 6334, 0, 0),
(5390, 5277, 0, 0),
(4281, 1905, 0, 5259),
(4282, 1907, 0, 0),
(5899, 6334, 0, 0),
(4283, 2147, 1957, 0),
(4877, 1910, 0, 0),
(4284, 5304, 0, 0),
(4285, 5303, 0, 0),
(4286, 1899, 1984, 0),
(12047, 2182, 0, 14105),
(5388, 1910, 0, 0),
(4287, 3361, 1961, 0),
(4288, 1909, 0, 5259),
(5670, 5293, 0, 0),
(4289, 5277, 0, 0),
(4290, 3432, 0, 0),
(4949, 12183, 0, 0),
(4292, 2813, 1984, 0),
(4294, 2177, 0, 0),
(4295, 5305, 1895, 0),
(5669, 0, 0, 2552),
(4296, 1908, 0, 0),
(4297, 2177, 0, 0),
(4298, 1896, 1984, 0),
(5979, 5281, 0, 0),
(4299, 5291, 0, 0),
(4300, 1907, 0, 0),
(7714, 12801, 0, 0),
(4301, 1983, 0, 0),
(7506, 2177, 0, 0),
(4303, 5291, 0, 0),
(5686, 1895, 0, 0),
(4305, 1117, 0, 0),
(4307, 1117, 0, 0),
(4310, 12461, 0, 0),
(4311, 5288, 0, 0),
(4312, 6680, 0, 0),
(5694, 2177, 0, 0),
(4314, 1117, 0, 0),
(7730, 5289, 0, 2507),
(4317, 6680, 0, 0),
(6707, 2711, 5284, 0),
(4319, 0, 0, 5259),
(5693, 10619, 0, 0),
(4320, 12329, 0, 0),
(5494, 1117, 0, 0),
(4321, 0, 0, 5260),
(4981, 2716, 0, 0),
(4328, 3361, 2052, 0),
(5502, 1908, 0, 0),
(4329, 1905, 0, 0),
(4331, 1899, 0, 0),
(11443, 12937, 0, 0),
(5810, 12290, 12452, 0),
(4359, 2184, 0, 0),
(4360, 1896, 0, 0),
(4792, 1906, 0, 0),
(4361, 5286, 0, 0),
(4362, 6680, 0, 0),
(4363, 5304, 0, 0),
(4364, 3433, 0, 0),
(4366, 2147, 0, 0),
(4370, 1907, 0, 0),
(4371, 5304, 0, 0),
(5249, 2695, 0, 0),
(5770, 5301, 0, 0),
(8140, 5491, 0, 0),
(5714, 2179, 1984, 0),
(6087, 5598, 0, 2550),
(7114, 5291, 2052, 0),
(8139, 12745, 0, 0),
(4772, 2715, 0, 0),
(4407, 0, 0, 5258),
(8155, 5287, 0, 0),
(4416, 1910, 0, 0),
(4848, 2559, 0, 0),
(4417, 4991, 0, 2552),
(4418, 2177, 0, 0),
(4419, 4994, 0, 0),
(4420, 5286, 5286, 0),
(4852, 2558, 0, 0),
(4421, 2559, 0, 0),
(5361, 3326, 0, 0),
(4424, 5284, 0, 0),
(4856, 1910, 0, 6088),
(4427, 1905, 0, 0),
(5882, 4993, 0, 0),
(4428, 5291, 0, 0),
(4429, 1911, 0, 0),
(4430, 1911, 0, 0),
(4435, 1896, 0, 0),
(5826, 1907, 0, 0),
(4645, 5281, 0, 0),
(4436, 1895, 2052, 0),
(4437, 2809, 0, 0),
(4438, 6680, 0, 5870),
(4649, 1907, 0, 0),
(4440, 1908, 0, 0),
(5327, 2182, 0, 0),
(4653, 5287, 0, 0),
(4451, 1908, 0, 0),
(5271, 5289, 0, 0),
(4452, 1911, 0, 0),
(4453, 4994, 0, 0),
(4454, 1911, 0, 0),
(4455, 2184, 0, 0),
(4456, 13612, 0, 0),
(7323, 12742, 0, 0),
(4457, 2200, 0, 0),
(4458, 2023, 0, 5870),
(4459, 1908, 0, 0),
(5786, 3433, 0, 0),
(4460, 2023, 0, 0),
(4461, 2023, 0, 0),
(5273, 2176, 0, 0),
(4462, 2023, 0, 5870),
(4463, 1908, 0, 0),
(4464, 4991, 0, 0),
(4832, 5303, 0, 0),
(4465, 5293, 0, 0),
(4466, 1909, 0, 0),
(4467, 1907, 0, 0),
(4479, 2180, 5284, 0),
(4480, 1900, 2711, 0),
(5142, 5277, 0, 0),
(4481, 2180, 1984, 0),
(4629, 0, 0, 13924),
(4484, 2557, 0, 0),
(4485, 2183, 2183, 0),
(4486, 10619, 0, 0),
(4633, 1896, 0, 2550),
(4488, 2184, 0, 0),
(5150, 1904, 5262, 0),
(4489, 5303, 0, 0),
(5659, 1899, 1984, 0),
(4493, 12934, 12934, 0),
(5148, 5495, 0, 0),
(4495, 1911, 0, 0),
(4705, 2177, 0, 0),
(4496, 1911, 0, 0),
(4498, 1908, 0, 0),
(5731, 1906, 0, 6230),
(4709, 1903, 0, 0),
(7783, 12482, 12502, 0),
(4713, 1896, 0, 0),
(4504, 3350, 0, 0),
(4505, 2184, 0, 0),
(4506, 2184, 0, 0),
(4507, 1906, 0, 0),
(7272, 2559, 0, 0),
(4657, 5304, 0, 0),
(5683, 5281, 5280, 0),
(5335, 1907, 0, 0),
(4516, 5304, 0, 0),
(4517, 5303, 0, 0),
(4518, 5276, 0, 0),
(7735, 3361, 0, 0),
(5172, 5277, 0, 0),
(4519, 1907, 0, 0),
(4665, 2559, 0, 0),
(4520, 5304, 0, 0),
(4522, 1907, 0, 0),
(4523, 5276, 0, 0),
(4525, 5303, 0, 0),
(5337, 6334, 0, 0),
(4609, 3699, 3695, 0),
(4530, 1904, 0, 2551),
(5635, 2182, 0, 0),
(4531, 1909, 0, 2551),
(4613, 2176, 0, 0),
(4532, 2184, 0, 2551),
(5124, 2196, 0, 0),
(5643, 5281, 0, 0),
(7170, 3326, 0, 0),
(4542, 2182, 0, 0),
(11791, 5281, 0, 0),
(4543, 2177, 0, 0),
(4544, 5287, 0, 0),
(4545, 5304, 0, 0),
(4546, 5301, 0, 0),
(5715, 6231, 0, 0),
(4549, 12850, 0, 0),
(11338, 13705, 0, 0),
(5204, 11343, 0, 0),
(4551, 5303, 0, 0),
(4552, 3351, 0, 0),
(4553, 2197, 0, 0),
(4554, 1908, 0, 0),
(4555, 2715, 12745, 0),
(4556, 1905, 0, 0),
(4557, 1905, 0, 0),
(4559, 0, 1957, 0),
(4560, 0, 2053, 0),
(5942, 6227, 19485, 0),
(4561, 1903, 0, 0),
(4562, 2184, 3695, 0),
(4563, 2559, 0, 0),
(4773, 1908, 0, 0),
(4564, 11019, 0, 0),
(4566, 2177, 0, 0),
(7847, 2711, 0, 0),
(4567, 5277, 0, 0),
(5941, 1117, 0, 0),
(4568, 5277, 0, 0),
(4570, 1907, 0, 0),
(4571, 3346, 0, 0),
(4572, 2559, 0, 0),
(4573, 1117, 0, 0),
(4574, 1117, 0, 0),
(4575, 3699, 0, 0),
(4721, 13337, 0, 0),
(4576, 12298, 0, 0),
(5238, 5286, 1905, 0),
(4577, 2200, 3694, 0),
(4578, 2177, 0, 0),
(5747, 3494, 11506, 0),
(4580, 1907, 0, 0),
(4581, 12868, 0, 0),
(4582, 10619, 10616, 0),
(7799, 12858, 0, 0),
(5236, 1907, 0, 0),
(4583, 5278, 5285, 0),
(4584, 2180, 5285, 0),
(4585, 2200, 3694, 0),
(4586, 4994, 0, 0),
(4587, 1911, 0, 0),
(7288, 2558, 0, 0),
(4588, 12298, 0, 0),
(4589, 1895, 0, 0),
(4591, 1907, 0, 0),
(4592, 2184, 0, 0),
(5190, 2714, 0, 0),
(4593, 5502, 0, 0),
(4594, 2147, 1985, 0),
(5699, 5291, 0, 0),
(4595, 2183, 1961, 0),
(11328, 1905, 0, 0),
(4677, 3361, 0, 0),
(4596, 1903, 5532, 0),
(4598, 1910, 0, 0),
(5188, 5284, 0, 0),
(4599, 1903, 0, 0),
(4600, 1899, 0, 0),
(4601, 1905, 0, 0),
(4602, 2813, 0, 0),
(5707, 1907, 0, 0),
(4603, 0, 0, 2552),
(4604, 0, 0, 5259),
(4605, 1903, 0, 0),
(4607, 12937, 0, 0),
(4608, 2810, 0, 0),
(4610, 2707, 0, 0),
(8125, 2827, 2827, 0),
(4611, 5278, 13341, 0),
(4612, 2704, 3698, 0),
(4614, 6237, 0, 0),
(4615, 3346, 0, 0),
(7606, 2559, 0, 0),
(4616, 3361, 2552, 0),
(4617, 0, 0, 12941),
(4623, 1897, 1957, 0),
(5506, 5301, 0, 0),
(4630, 1911, 13606, 0),
(4631, 2715, 0, 0),
(4632, 1905, 0, 0),
(5514, 1910, 0, 0),
(4636, 5491, 0, 0),
(6031, 1903, 0, 0),
(4637, 5288, 0, 0),
(4638, 1905, 0, 5262),
(4640, 2711, 0, 0),
(4642, 5276, 0, 0),
(4643, 1899, 0, 0),
(4644, 1904, 0, 0),
(5975, 1907, 0, 0),
(4646, 1905, 0, 0),
(4647, 5286, 0, 5259),
(4648, 2809, 0, 0),
(5320, 5747, 0, 0),
(4654, 1909, 0, 5258),
(5977, 3361, 0, 0),
(4655, 5278, 0, 0),
(4658, 5277, 0, 0),
(4659, 5289, 0, 0),
(4663, 5303, 0, 0),
(4664, 4991, 0, 0),
(5546, 10612, 2081, 5260),
(4667, 2177, 0, 0),
(4668, 1908, 0, 0),
(5336, 1908, 0, 0),
(4674, 1897, 0, 0),
(5618, 5280, 0, 0),
(6129, 5304, 0, 0),
(7670, 2179, 1984, 0),
(4680, 1906, 0, 0),
(6143, 2182, 0, 0),
(4686, 5491, 0, 0),
(4687, 5301, 0, 0),
(5411, 2182, 0, 0),
(8141, 1899, 0, 0),
(7463, 2183, 0, 0),
(7976, 0, 0, 2552),
(6089, 5502, 0, 0),
(4706, 5491, 0, 0),
(4708, 1911, 0, 0),
(6033, 1903, 0, 0),
(4711, 2184, 0, 0),
(4712, 1907, 0, 0),
(4714, 1899, 1896, 0),
(4715, 3494, 0, 0),
(4716, 1905, 0, 5870),
(4718, 5276, 0, 0),
(4719, 5303, 0, 0),
(4722, 5291, 0, 0),
(5602, 2179, 0, 0),
(4723, 3361, 0, 0),
(6113, 2023, 0, 0),
(5610, 2703, 0, 0),
(4731, 12329, 0, 0),
(4775, 2184, 0, 0),
(5940, 6228, 0, 0),
(5594, 3699, 0, 0),
(4787, 3433, 0, 0),
(12032, 1117, 0, 0),
(4791, 3433, 0, 0),
(5892, 5291, 0, 0),
(4794, 3351, 0, 0),
(7944, 1903, 0, 0),
(5900, 6334, 0, 0),
(4802, 1908, 0, 0),
(4805, 5303, 0, 0),
(4807, 5746, 0, 0),
(4809, 2176, 0, 0),
(4810, 4991, 0, 0),
(6184, 1904, 0, 0),
(4811, 6231, 0, 0),
(4812, 1907, 0, 0),
(4813, 2559, 0, 0),
(6179, 2557, 0, 0),
(8018, 2182, 0, 0),
(5165, 2179, 5285, 0),
(6196, 5745, 0, 0),
(5173, 2559, 0, 0),
(6195, 5284, 0, 5259),
(4831, 6334, 0, 5259),
(5491, 5495, 0, 0),
(4834, 1900, 0, 0),
(6014, 12787, 0, 0),
(5499, 2716, 3695, 0),
(4842, 2177, 0, 0),
(4844, 1907, 0, 0),
(4845, 5281, 5281, 0),
(4847, 1910, 0, 0),
(4849, 1903, 1984, 0),
(5958, 5277, 0, 0),
(4850, 5285, 0, 0),
(4851, 5293, 0, 0),
(12096, 5291, 0, 14118),
(7867, 5289, 0, 0),
(4875, 2827, 0, 0),
(4876, 0, 12745, 0),
(4878, 11424, 0, 0),
(5817, 1910, 2081, 0),
(4879, 2827, 0, 0),
(11454, 3494, 0, 5258),
(4884, 12937, 0, 0),
(5767, 1908, 0, 0),
(4886, 1903, 0, 0),
(4888, 1903, 13611, 0),
(4891, 2197, 0, 0),
(4892, 0, 0, 5262),
(4894, 2827, 13406, 0),
(5769, 13339, 0, 0),
(4896, 12745, 0, 0),
(4898, 2707, 0, 0),
(7773, 5303, 0, 0),
(4899, 3696, 0, 0),
(4900, 3699, 3697, 0),
(5713, 2183, 5286, 0),
(4923, 1899, 1984, 0),
(5592, 13631, 0, 0),
(4926, 1906, 0, 0),
(4941, 1911, 0, 0),
(4943, 12329, 0, 0),
(11518, 2559, 0, 0),
(5155, 2703, 0, 0),
(7885, 6334, 1905, 0),
(4947, 2179, 0, 2551),
(4951, 1899, 1985, 2551),
(5668, 1899, 0, 0),
(7883, 5305, 1985, 0),
(4960, 2176, 0, 0),
(4962, 1899, 0, 0),
(4963, 0, 3757, 0),
(4964, 12934, 0, 0),
(5783, 3699, 0, 0),
(4966, 1899, 0, 0),
(4967, 2177, 0, 0),
(7318, 1908, 0, 0),
(4968, 2177, 12868, 0),
(4971, 5278, 0, 0),
(4972, 1899, 0, 0),
(4974, 2177, 0, 0),
(4979, 1899, 1984, 2551),
(4980, 1906, 0, 0),
(4983, 2023, 0, 0),
(4984, 0, 0, 5262),
(5123, 1117, 2552, 0),
(5043, 1906, 0, 0),
(5045, 1896, 0, 5258),
(5046, 3364, 0, 0),
(7175, 5281, 0, 0),
(5646, 1909, 0, 5856),
(5054, 5301, 0, 0),
(11279, 1899, 12980, 0),
(5082, 2705, 0, 0),
(5083, 0, 12742, 0),
(5085, 1899, 1984, 0),
(5086, 11317, 0, 0),
(5087, 1901, 0, 0),
(5089, 1897, 0, 0),
(5750, 10619, 0, 0),
(5093, 1899, 1984, 0),
(5094, 1899, 1984, 0),
(7287, 1903, 0, 0),
(5748, 1117, 0, 0),
(5758, 12991, 0, 0),
(5101, 1906, 0, 0),
(5103, 1909, 0, 0),
(5106, 0, 1985, 0),
(5107, 0, 2053, 0),
(11840, 11762, 12629, 0),
(5110, 2707, 3694, 0),
(5111, 2705, 0, 0),
(5700, 12863, 0, 0),
(5113, 5301, 0, 0),
(5710, 2176, 0, 0),
(5114, 1897, 2053, 0),
(5115, 3433, 0, 0),
(5117, 0, 0, 2552),
(5118, 12883, 12980, 0),
(5119, 5286, 0, 0),
(5120, 1899, 0, 0),
(5121, 2809, 0, 0),
(5122, 0, 0, 5262),
(5125, 12298, 1985, 0),
(5126, 0, 11041, 0),
(5130, 5303, 0, 0),
(5133, 0, 0, 6231),
(5134, 2715, 0, 0),
(5135, 1910, 0, 0),
(5137, 1908, 0, 0),
(5138, 2707, 0, 0),
(5139, 19053, 0, 0),
(5140, 2703, 0, 0),
(5141, 2176, 0, 0),
(5143, 1907, 0, 0),
(5144, 1907, 0, 0),
(5145, 5277, 0, 0),
(5147, 2557, 0, 0),
(5149, 5495, 0, 0),
(6028, 6680, 0, 0),
(5152, 5304, 0, 0),
(5156, 1896, 0, 0),
(5159, 2196, 0, 0),
(7873, 2809, 1957, 0),
(5160, 3351, 0, 0),
(7882, 3366, 0, 0),
(5161, 1117, 0, 0),
(5976, 5301, 0, 0),
(5162, 1117, 0, 0),
(5166, 5281, 0, 0),
(5167, 5281, 0, 0),
(5169, 5285, 3694, 0),
(5170, 5278, 0, 0),
(5171, 1907, 0, 0),
(7901, 1897, 0, 0),
(5174, 4994, 0, 0),
(5175, 1911, 0, 0),
(5177, 2716, 3695, 0),
(5184, 1899, 0, 0),
(10739, 13337, 0, 0),
(5189, 10611, 0, 0),
(6132, 1902, 0, 0),
(7158, 5303, 0, 0),
(6136, 5278, 0, 0),
(5229, 2809, 0, 0),
(5234, 1903, 2809, 0),
(5237, 5303, 0, 0),
(5239, 5304, 0, 0),
(5240, 2559, 0, 0),
(5241, 5289, 0, 0),
(5243, 2695, 0, 0),
(6124, 1909, 2052, 0),
(5253, 5301, 0, 0),
(10506, 11365, 0, 0),
(5254, 5303, 0, 0),
(5255, 5287, 0, 0),
(5259, 4993, 0, 0),
(5261, 2711, 0, 0),
(5267, 2809, 0, 0),
(5270, 2183, 0, 0),
(7015, 1903, 0, 0),
(5997, 1911, 0, 2552),
(5277, 1896, 2052, 0),
(5280, 6334, 0, 0),
(6408, 1901, 0, 0),
(5901, 1908, 0, 0),
(5331, 6680, 0, 0),
(5332, 5746, 0, 0),
(5334, 2023, 0, 0),
(5343, 5304, 0, 0),
(6009, 6231, 0, 0),
(5357, 5293, 0, 0),
(5358, 5301, 0, 0),
(5359, 5292, 0, 0),
(5360, 5491, 0, 0),
(5953, 5289, 0, 2507),
(5957, 5277, 0, 0),
(5384, 1907, 0, 0),
(5385, 2177, 0, 0),
(5816, 0, 0, 6231),
(5386, 12742, 0, 0),
(5389, 1910, 0, 0),
(5820, 6334, 0, 0),
(5760, 13504, 0, 0),
(5394, 6680, 0, 0),
(5395, 11042, 0, 0),
(5399, 2827, 2827, 0),
(5400, 3433, 0, 0),
(5401, 5303, 0, 0),
(5768, 1908, 0, 0),
(5402, 5289, 0, 0),
(5772, 13504, 0, 0),
(5413, 1903, 0, 0),
(5716, 5289, 0, 0),
(5418, 10898, 0, 0),
(5724, 5276, 0, 0),
(5792, 11383, 0, 0),
(8157, 2198, 0, 0),
(8154, 6680, 0, 0),
(5884, 5276, 0, 0),
(5824, 5289, 0, 0),
(5469, 2809, 0, 0),
(5836, 4994, 0, 0),
(6178, 1903, 0, 0),
(5472, 1909, 1905, 0),
(5473, 1907, 0, 0),
(5474, 2695, 0, 0),
(6301, 1910, 0, 0),
(5475, 2559, 0, 0),
(5477, 3361, 0, 0),
(5479, 3366, 0, 0),
(6806, 2703, 0, 0),
(5480, 3433, 0, 0),
(6299, 1903, 0, 0),
(5784, 10611, 0, 0),
(5482, 2827, 2196, 0),
(5483, 3351, 0, 0),
(5489, 5277, 0, 0),
(5492, 5495, 0, 0),
(5493, 1117, 0, 0),
(5860, 5277, 0, 0),
(5495, 1907, 0, 0),
(6886, 2184, 0, 0),
(5496, 5277, 0, 0),
(5864, 2023, 0, 0),
(5498, 5277, 0, 0),
(5500, 2200, 3695, 0),
(5501, 3433, 0, 0),
(5504, 12328, 0, 0),
(5649, 4991, 0, 0),
(5508, 2558, 0, 2552),
(5653, 1896, 2053, 0),
(5509, 5286, 0, 0),
(5510, 0, 0, 12523),
(5512, 5532, 0, 0),
(5657, 2147, 1897, 0),
(5515, 3433, 0, 0),
(6168, 2177, 0, 0),
(5516, 0, 0, 2552),
(5661, 2809, 0, 0),
(5517, 1909, 2053, 0),
(987001, 21465, 21465, 0),
(5520, 2559, 0, 0),
(5543, 10619, 0, 0),
(5547, 10612, 2081, 5260),
(5645, 5278, 0, 0),
(5566, 6234, 0, 0),
(5570, 3361, 0, 0),
(5595, 5286, 6254, 2552),
(5597, 5287, 0, 0),
(6306, 5278, 0, 0),
(5598, 3362, 0, 0),
(5599, 10619, 0, 0),
(5600, 2023, 0, 0),
(5605, 2147, 1984, 0),
(5606, 2703, 0, 0),
(6775, 1905, 0, 0),
(5608, 1117, 0, 0),
(5753, 0, 0, 6230),
(5611, 0, 0, 2551),
(5612, 12991, 0, 0),
(5757, 0, 0, 6230),
(5613, 2703, 0, 0),
(5616, 5278, 0, 0),
(5697, 2716, 0, 0),
(5701, 1908, 0, 0),
(5622, 1908, 0, 0),
(5705, 2711, 0, 0),
(5634, 2705, 0, 0),
(5636, 5289, 0, 0),
(5637, 3326, 0, 0),
(5638, 0, 0, 2552),
(5639, 5277, 0, 0),
(5640, 2711, 0, 0),
(5641, 3366, 0, 0),
(5642, 11591, 0, 0),
(11141, 13316, 0, 0),
(5647, 5276, 0, 0),
(5650, 1908, 0, 0),
(7053, 5284, 3698, 0),
(5651, 3362, 0, 0),
(5654, 1896, 0, 0),
(5655, 3361, 1957, 0),
(5656, 5289, 0, 0),
(7051, 5300, 0, 0),
(5660, 3433, 0, 0),
(5662, 1897, 5278, 0),
(5663, 1899, 1957, 0),
(5664, 1899, 1957, 0),
(5667, 2711, 0, 0),
(5674, 1903, 0, 2552),
(5679, 5277, 0, 0),
(5681, 4993, 0, 0),
(5682, 1903, 0, 0),
(6566, 1900, 0, 0),
(5688, 2705, 0, 0),
(5696, 5304, 0, 0),
(5698, 2809, 0, 0),
(5702, 2559, 0, 0),
(5703, 1907, 0, 0),
(5704, 0, 0, 6230),
(5706, 5276, 0, 0),
(5711, 10878, 0, 0),
(5717, 5277, 0, 0),
(5057, 2182, 0, 0),
(7115, 1907, 0, 0),
(5725, 1905, 0, 2551),
(6946, 5285, 0, 0),
(7069, 5303, 0, 0),
(5732, 5284, 0, 0),
(5733, 12863, 0, 0),
(5734, 2199, 0, 0),
(7067, 1905, 0, 0),
(5749, 2184, 0, 0),
(5752, 13312, 143, 0),
(5765, 10619, 0, 0),
(11018, 13316, 0, 0),
(5771, 2559, 0, 0),
(5782, 3494, 11506, 0),
(7016, 3432, 0, 5259),
(5797, 5599, 0, 0),
(5798, 5305, 0, 0),
(5800, 5277, 0, 0),
(5808, 1905, 0, 0),
(5809, 2147, 2053, 0),
(5811, 2184, 0, 0),
(5812, 1903, 0, 0),
(5814, 2703, 0, 0),
(6407, 1911, 0, 2552),
(5815, 5304, 0, 0),
(5819, 1903, 0, 0),
(5821, 11762, 0, 0),
(5822, 5277, 0, 0),
(11082, 2714, 0, 0),
(6487, 2177, 0, 0),
(5835, 5278, 5278, 0),
(6185, 1899, 0, 0),
(5839, 1907, 0, 0),
(5841, 3432, 0, 0),
(5843, 1910, 0, 0),
(5844, 2147, 0, 0),
(5846, 5278, 5278, 0),
(6567, 2200, 0, 0),
(5847, 1911, 0, 2552),
(5851, 3361, 0, 0),
(6201, 5280, 0, 0),
(6194, 1899, 0, 0),
(7074, 2177, 0, 0),
(5861, 3361, 1984, 0),
(5862, 5303, 0, 0),
(5871, 2705, 0, 0),
(5875, 12865, 0, 0),
(5878, 1903, 0, 0),
(5880, 5276, 0, 0),
(5883, 6618, 0, 0),
(5885, 0, 0, 6231),
(5886, 3346, 0, 0),
(10931, 12883, 12751, 0),
(5888, 6233, 0, 0),
(5905, 11424, 0, 0),
(5906, 5291, 0, 0),
(5908, 12285, 0, 0),
(5909, 5291, 0, 0),
(5910, 12329, 0, 0),
(5911, 12285, 0, 0),
(5916, 5598, 0, 0),
(5938, 1117, 0, 0),
(5944, 3696, 0, 0),
(5952, 5289, 0, 2507),
(5974, 2813, 0, 0),
(5981, 1908, 0, 0),
(5994, 5276, 0, 0),
(5996, 1910, 0, 0),
(5998, 2182, 0, 0),
(5999, 2178, 1984, 0),
(6001, 2711, 0, 0),
(6002, 2177, 0, 0),
(6003, 5305, 0, 0),
(6004, 5280, 0, 6886),
(6006, 1907, 0, 0),
(6007, 6224, 0, 0),
(6374, 12937, 0, 0),
(6008, 2559, 0, 0),
(6011, 5491, 0, 0),
(6018, 1908, 0, 0),
(6019, 4994, 0, 0),
(10762, 12788, 0, 0),
(6026, 3433, 0, 0),
(6027, 1908, 0, 0),
(6035, 5281, 0, 0),
(6070, 1908, 0, 0),
(6086, 5598, 0, 5258),
(6091, 2717, 0, 0),
(6093, 1905, 0, 0),
(6738, 5260, 0, 0),
(6119, 12863, 0, 0),
(6127, 2559, 0, 0),
(6131, 1907, 0, 0),
(6142, 2182, 0, 0),
(10319, 12304, 1984, 0),
(6144, 5491, 0, 0),
(7088, 5278, 0, 0),
(7607, 5278, 0, 2552),
(6169, 1903, 0, 0),
(6171, 2557, 0, 0),
(6172, 5292, 0, 0),
(7052, 1895, 2081, 0),
(6176, 13339, 0, 0),
(6180, 1897, 0, 0),
(6181, 1903, 0, 0),
(6182, 0, 0, 2552),
(7505, 2559, 0, 0),
(7872, 5285, 0, 0),
(6186, 1907, 0, 0),
(6187, 4991, 0, 0),
(8026, 5598, 0, 0),
(6189, 5301, 0, 0),
(6190, 2023, 0, 5870),
(7072, 1983, 0, 0),
(6193, 2182, 0, 0),
(6198, 5285, 0, 0),
(6199, 1908, 0, 0),
(6206, 6334, 0, 0),
(6208, 1904, 0, 0),
(6210, 5278, 0, 0),
(6211, 5286, 0, 0),
(8178, 2176, 0, 0),
(6212, 5285, 0, 0),
(7671, 3433, 0, 0),
(6213, 2184, 0, 0),
(7156, 3361, 0, 0),
(6221, 1896, 0, 2552),
(6222, 1911, 0, 6886),
(6223, 1905, 0, 2552),
(6228, 2177, 0, 0),
(7623, 13718, 0, 0),
(7112, 10617, 0, 0),
(6236, 3366, 0, 0),
(6237, 0, 0, 2551),
(6240, 1899, 0, 0),
(6241, 5292, 0, 0),
(7056, 1896, 0, 0),
(6243, 1897, 2179, 0),
(6244, 12937, 0, 0),
(6245, 3433, 0, 0),
(6246, 3494, 0, 0),
(6247, 2559, 0, 0),
(6251, 5277, 0, 0),
(6252, 12943, 0, 0),
(7583, 6236, 0, 0),
(7068, 5281, 0, 0),
(6253, 12937, 0, 0),
(6254, 10619, 0, 0),
(6267, 4993, 0, 0),
(6272, 3362, 0, 0),
(6929, 6334, 0, 0),
(6286, 2197, 0, 0),
(6287, 5278, 0, 0),
(6288, 5278, 0, 0),
(7009, 2711, 0, 0),
(6289, 2184, 0, 0),
(6290, 2184, 0, 0),
(6291, 5278, 0, 0),
(6292, 5278, 0, 0),
(6293, 2714, 12742, 0),
(6295, 2711, 0, 0),
(6297, 1910, 0, 0),
(6298, 1910, 0, 0),
(6300, 5532, 0, 0),
(6328, 1907, 0, 0),
(6351, 5276, 0, 0),
(7725, 5288, 0, 0),
(7073, 5293, 0, 0),
(7734, 2179, 0, 0),
(6367, 2827, 0, 0),
(7025, 1909, 2052, 0),
(6371, 1895, 0, 0),
(7029, 5286, 5286, 0),
(6373, 11343, 0, 0),
(6376, 1907, 0, 0),
(7033, 3361, 0, 0),
(7037, 1906, 0, 0),
(6387, 5278, 0, 0),
(6390, 2827, 0, 0),
(6391, 1899, 11585, 0),
(6392, 5304, 0, 0),
(6393, 4991, 0, 0),
(6394, 5301, 0, 0),
(6395, 12950, 0, 0),
(6410, 1903, 0, 0),
(6411, 3350, 0, 0),
(7866, 3433, 0, 0),
(6446, 2711, 0, 0),
(8136, 5746, 0, 0),
(6467, 12298, 10618, 0),
(6488, 5491, 0, 0),
(6489, 1903, 0, 0),
(7826, 11343, 0, 0),
(16452, 5305, 0, 0),
(7327, 1905, 1985, 0),
(7321, 1908, 0, 0),
(6523, 1909, 0, 2552),
(6546, 2198, 3695, 0),
(6548, 13061, 0, 0),
(7787, 1910, 0, 0),
(7276, 5293, 0, 0),
(6568, 2200, 3695, 0),
(7230, 2182, 0, 0),
(6570, 5291, 1961, 0),
(6574, 5281, 0, 0),
(7228, 1901, 0, 0),
(6575, 2813, 0, 0),
(6579, 1910, 0, 0),
(9216, 5286, 5286, 0),
(6586, 3367, 0, 0),
(6607, 3346, 0, 0),
(7795, 5303, 0, 0),
(6647, 1983, 0, 13147),
(6649, 2147, 0, 2550),
(7246, 2179, 0, 5258),
(6650, 5747, 0, 0),
(6667, 1897, 0, 0),
(6668, 2182, 0, 0),
(8127, 9659, 0, 0),
(6670, 1902, 0, 0),
(8121, 9700, 0, 0),
(6706, 12329, 0, 0),
(6726, 6680, 0, 0),
(8177, 2198, 3698, 0),
(6730, 1911, 0, 0),
(10181, 2179, 0, 14118),
(6731, 5278, 0, 0),
(6734, 2550, 0, 0),
(6735, 2715, 0, 0),
(6736, 2715, 0, 0),
(6739, 5278, 0, 0),
(6741, 5278, 0, 0),
(6747, 3362, 0, 0),
(6766, 3366, 0, 0),
(6771, 2179, 2711, 0),
(8161, 5287, 0, 11021),
(6777, 4994, 0, 0),
(6779, 12332, 3698, 0),
(6782, 2715, 0, 0),
(6784, 2184, 0, 0),
(6785, 2184, 0, 0),
(6786, 2197, 0, 0),
(6791, 3362, 0, 0),
(7956, 5285, 0, 5262),
(6807, 2023, 0, 2552),
(6868, 5303, 0, 0),
(6887, 5303, 0, 0),
(6927, 1896, 0, 0),
(5773, 1908, 0, 0),
(6930, 3362, 0, 0),
(6966, 5281, 0, 0),
(6986, 1911, 0, 0),
(6987, 1903, 0, 0),
(7007, 5291, 0, 0),
(7724, 1910, 13604, 0),
(7010, 5303, 0, 0),
(7011, 3326, 0, 0),
(7012, 1910, 0, 0),
(7017, 2695, 0, 0),
(7026, 2177, 0, 0),
(7027, 5289, 0, 0),
(7028, 2559, 0, 0),
(16451, 2181, 0, 0),
(7030, 5284, 0, 0),
(7035, 2695, 0, 0),
(7036, 2711, 10616, 0),
(7038, 5281, 0, 2552),
(7040, 3432, 0, 0),
(7041, 1907, 0, 0),
(7042, 3433, 0, 0),
(7050, 2809, 0, 0),
(7057, 3346, 1910, 0),
(7076, 5301, 0, 0),
(7895, 11343, 0, 0),
(7087, 5278, 0, 0),
(7740, 2709, 0, 0),
(7089, 5278, 0, 0),
(7764, 12742, 0, 0),
(7113, 3361, 1984, 0),
(7774, 2708, 0, 0),
(7120, 2559, 0, 0),
(7485, 2202, 0, 0),
(7798, 2182, 0, 0),
(7750, 3433, 0, 0),
(7154, 3346, 0, 0),
(7235, 5303, 0, 0),
(7155, 1905, 0, 5262),
(7161, 2716, 0, 0),
(7232, 2182, 0, 0),
(7233, 5300, 0, 0),
(8176, 2198, 0, 0),
(7247, 2559, 0, 0),
(7267, 11542, 0, 0),
(7271, 5303, 0, 0),
(7274, 5288, 0, 0),
(7275, 2559, 0, 0),
(7294, 3433, 0, 0),
(7295, 3433, 0, 0),
(7296, 6680, 0, 0),
(7297, 6680, 0, 0),
(7298, 6680, 0, 0),
(7311, 12328, 0, 0),
(7312, 1907, 0, 0),
(7315, 2179, 0, 0),
(7317, 5289, 0, 0),
(7320, 1904, 0, 0),
(7324, 2708, 0, 0),
(7328, 1909, 0, 0),
(7329, 1897, 2053, 0),
(8144, 2711, 0, 0),
(7332, 6680, 0, 2551),
(7335, 1907, 0, 0),
(8152, 12850, 0, 0),
(7344, 1896, 2053, 0),
(7937, 1911, 11587, 0),
(7345, 4991, 0, 0),
(7346, 1903, 0, 0),
(7945, 1117, 0, 0),
(7354, 11087, 0, 0),
(7360, 2695, 1985, 0),
(8017, 1904, 0, 5262),
(7396, 3326, 0, 0),
(7397, 5276, 0, 0),
(7404, 5301, 0, 0),
(7407, 4994, 0, 0),
(7408, 1911, 0, 0),
(7410, 12951, 0, 0),
(7856, 1897, 0, 2552),
(7427, 5301, 0, 0),
(7435, 1897, 0, 0),
(7436, 2147, 1984, 0),
(7437, 2177, 0, 0),
(8894, 2176, 0, 0),
(7442, 0, 0, 5260),
(7772, 1117, 0, 0),
(7489, 2183, 1984, 2551),
(7564, 1906, 0, 0),
(7572, 5300, 0, 0),
(7604, 2180, 1984, 0),
(7605, 5281, 5281, 0),
(7608, 5291, 0, 0),
(7666, 2177, 0, 0),
(7667, 2559, 0, 0),
(7668, 6224, 0, 0),
(7683, 12856, 0, 0),
(7726, 1908, 0, 0),
(7727, 5276, 0, 0),
(7731, 2196, 0, 0),
(7733, 2704, 0, 0),
(7744, 2705, 0, 0),
(7763, 4994, 0, 0),
(7771, 3346, 13609, 0),
(7776, 3433, 0, 0),
(7778, 2558, 0, 0),
(7071, 3361, 2052, 0),
(7788, 3346, 0, 0),
(7790, 1903, 0, 0),
(7792, 2182, 0, 0),
(7793, 5491, 0, 0),
(7796, 5300, 0, 0),
(7797, 5288, 0, 0),
(7804, 2182, 0, 0),
(7805, 2179, 1897, 0),
(7809, 1909, 0, 0),
(7823, 13312, 0, 0),
(7824, 3433, 0, 0),
(7825, 2810, 0, 0),
(7843, 1896, 0, 2552),
(7851, 4991, 0, 0),
(7853, 1911, 0, 0),
(7855, 1897, 0, 0),
(7857, 1902, 0, 0),
(7858, 1897, 0, 0),
(7865, 10591, 1984, 5260),
(7869, 5291, 0, 0),
(7871, 3433, 0, 0),
(7874, 1907, 0, 0),
(7876, 1903, 12856, 0),
(9034, 11342, 0, 0),
(7899, 1897, 0, 0),
(7902, 3364, 0, 0),
(7939, 5598, 0, 5258),
(7946, 1117, 0, 0),
(7947, 2716, 0, 0),
(7948, 2198, 0, 0),
(7950, 1903, 0, 0),
(7955, 4994, 0, 0),
(7957, 1907, 0, 0),
(7978, 5278, 5278, 0),
(7980, 5286, 0, 2551),
(7995, 2559, 0, 0),
(7996, 2176, 0, 0),
(8015, 5598, 0, 2550),
(8019, 0, 0, 5259),
(8020, 6680, 0, 0),
(8022, 5277, 0, 0),
(8055, 2557, 0, 2552),
(8096, 1896, 2052, 0),
(8115, 5303, 0, 0),
(8116, 9702, 0, 0),
(8118, 9702, 0, 0),
(8119, 12745, 12856, 0),
(8122, 9701, 0, 0),
(8124, 12850, 0, 0),
(8126, 1911, 0, 0),
(8128, 1910, 0, 0),
(8129, 2182, 0, 0),
(8137, 6229, 0, 0),
(8147, 5289, 0, 0),
(8151, 1899, 143, 2551),
(8158, 2198, 0, 0),
(8199, 11042, 0, 0),
(8200, 5303, 0, 0),
(11707, 13750, 0, 0),
(8201, 5288, 0, 0),
(8202, 12421, 0, 0),
(8203, 4991, 0, 0),
(11661, 5746, 0, 0),
(8214, 5285, 0, 13147),
(8216, 11762, 11762, 0),
(9096, 2179, 0, 0),
(15765, 13718, 0, 0),
(8219, 12951, 0, 0),
(9200, 11317, 0, 0),
(8997, 0, 0, 5262),
(9156, 12063, 0, 0),
(8282, 2177, 0, 0),
(8283, 3361, 0, 2552),
(8296, 11343, 0, 0),
(8297, 12951, 0, 0),
(8298, 14707, 0, 0),
(9116, 12328, 0, 0),
(8304, 10568, 0, 0),
(8305, 0, 3698, 0),
(8306, 2827, 0, 0),
(11757, 5289, 0, 0),
(8307, 2197, 0, 0),
(8308, 6680, 0, 0),
(8309, 2711, 5284, 0),
(8310, 2180, 2081, 2551),
(9196, 14586, 0, 0),
(8320, 4994, 0, 0),
(8977, 3361, 0, 0),
(8337, 2182, 0, 0),
(8338, 2183, 0, 2552),
(10083, 1906, 0, 0),
(8356, 12745, 0, 0),
(8357, 12856, 0, 0),
(9681, 10617, 10617, 0),
(8359, 12745, 12745, 0),
(9524, 2023, 0, 0),
(8360, 6233, 0, 0),
(8361, 2716, 0, 0),
(8362, 2197, 0, 0),
(10043, 11019, 0, 0),
(8363, 1903, 0, 0),
(8364, 12745, 12745, 0),
(8378, 2182, 0, 0),
(8380, 1900, 0, 0),
(8381, 2177, 0, 0),
(7951, 20468, 0, 0),
(8382, 4991, 0, 0),
(8383, 5287, 0, 0),
(9041, 2177, 0, 0),
(8385, 6334, 0, 0),
(9558, 2714, 0, 0),
(8386, 2184, 0, 2552),
(15905, 2703, 0, 0),
(8387, 2147, 0, 0),
(8388, 5278, 0, 0),
(9045, 1907, 0, 0),
(8389, 1911, 0, 0),
(8390, 3696, 3695, 0),
(12119, 15910, 0, 0),
(8391, 2559, 0, 0),
(9566, 4994, 0, 0),
(8395, 0, 0, 5262),
(11608, 0, 0, 5262),
(8396, 5598, 0, 0),
(8397, 5598, 0, 0),
(11602, 5301, 0, 0),
(8398, 12889, 0, 0),
(8399, 5304, 0, 0),
(9564, 4994, 0, 0),
(8401, 12329, 0, 0),
(8403, 12332, 0, 0),
(8404, 1906, 0, 0),
(8408, 4991, 0, 0),
(14911, 18002, 0, 0),
(8416, 1910, 0, 0),
(8418, 11383, 0, 0),
(8419, 5277, 0, 0),
(9077, 11042, 0, 0),
(9540, 2705, 0, 0),
(9033, 11342, 0, 0),
(8442, 2183, 0, 0),
(10059, 12329, 0, 0),
(8444, 2177, 0, 0),
(9037, 11591, 0, 0),
(9548, 0, 0, 12523),
(16014, 4994, 11586, 0),
(8479, 2179, 0, 0),
(8496, 1911, 0, 0),
(8503, 2184, 0, 0),
(8504, 1896, 0, 2552),
(15541, 10617, 0, 0),
(8508, 1117, 0, 0),
(8509, 2147, 0, 0),
(8876, 1908, 0, 0),
(8518, 0, 0, 5870),
(9457, 12285, 0, 0),
(12022, 2184, 0, 0),
(8523, 1899, 0, 0),
(9978, 3364, 0, 0),
(8525, 1905, 1984, 0),
(9465, 13337, 0, 0),
(8527, 3361, 1985, 0),
(8737, 0, 1984, 0),
(8529, 4991, 0, 0),
(8896, 0, 0, 2552),
(11469, 1899, 1897, 0),
(11815, 12629, 0, 0),
(9260, 11042, 12452, 0),
(8546, 13061, 0, 0),
(8547, 6224, 0, 0),
(8548, 2711, 12865, 0),
(8550, 2177, 0, 0),
(8551, 13078, 0, 0),
(8553, 2559, 0, 0),
(8560, 6680, 0, 0),
(8561, 12991, 0, 5261),
(8562, 10611, 0, 0),
(11501, 13160, 0, 0),
(8563, 5286, 0, 0),
(8564, 11763, 0, 5259),
(9447, 10825, 12995, 0),
(8565, 12993, 12991, 0),
(8566, 1896, 0, 2552),
(8576, 10611, 10611, 0),
(8578, 2177, 0, 0),
(8579, 2705, 0, 0),
(8581, 1899, 1984, 0),
(8582, 12285, 0, 0),
(11799, 2179, 0, 0),
(9236, 10878, 12332, 0),
(8586, 0, 0, 5259),
(8587, 10619, 10619, 0),
(11288, 1899, 1985, 0),
(8588, 1908, 0, 0),
(8912, 5532, 0, 0),
(9270, 1906, 0, 0),
(8610, 6680, 0, 0),
(8920, 1911, 0, 2552),
(8636, 2176, 0, 0),
(8717, 1899, 0, 0),
(8637, 1896, 0, 0),
(10038, 2180, 2081, 2551),
(11063, 1899, 1985, 0),
(8659, 2711, 10619, 0),
(15450, 5284, 0, 0),
(8661, 0, 12858, 0),
(8664, 2023, 0, 0),
(10046, 1911, 0, 0),
(8665, 5600, 0, 0),
(11064, 12890, 1984, 0),
(8877, 1983, 0, 0),
(8678, 4994, 0, 0),
(8679, 4994, 0, 0),
(9602, 1909, 1905, 0),
(8736, 4994, 0, 0),
(8738, 1911, 0, 0),
(11686, 0, 0, 5258),
(8878, 3361, 0, 0),
(8879, 12742, 0, 0),
(9990, 1903, 0, 0),
(8889, 2184, 0, 0),
(9998, 1911, 0, 0),
(8890, 1895, 1961, 0),
(8891, 2809, 1984, 0),
(8892, 1896, 1896, 0),
(8893, 5289, 0, 0),
(8895, 4991, 0, 2552),
(9996, 1908, 0, 0),
(8897, 1903, 0, 6886),
(8898, 3326, 0, 0),
(9555, 0, 0, 5262),
(8899, 5287, 0, 2552),
(8900, 2177, 0, 0),
(8901, 1896, 2052, 2552),
(8902, 0, 0, 2552),
(10276, 1903, 0, 0),
(8903, 2178, 1984, 0),
(8904, 11383, 0, 15460),
(9262, 1906, 0, 0),
(9563, 5278, 0, 0),
(14380, 5598, 5598, 0),
(9261, 10619, 0, 0),
(8913, 2177, 0, 0),
(8914, 5293, 0, 0),
(8915, 5285, 0, 0),
(8916, 0, 0, 2552),
(8917, 1910, 0, 6886),
(14379, 5598, 5598, 0),
(12098, 3433, 0, 5870),
(7503, 2711, 0, 0),
(10060, 2023, 0, 2552),
(8962, 1117, 0, 0),
(8965, 1117, 0, 0),
(16003, 1897, 1957, 0),
(8978, 5281, 0, 2552),
(8979, 12950, 0, 0),
(8980, 5289, 0, 0),
(8983, 5284, 0, 0),
(11947, 14879, 0, 0),
(16053, 22213, 12456, 0),
(9018, 10617, 0, 0),
(9019, 11369, 0, 0),
(15534, 1117, 0, 0),
(9024, 11343, 0, 0),
(12029, 0, 0, 5262),
(9027, 10611, 10611, 0),
(9458, 6830, 0, 3135),
(9030, 5277, 0, 0),
(9035, 2182, 11589, 0),
(9036, 4993, 0, 0),
(9983, 12329, 0, 0),
(9038, 11588, 0, 0),
(9039, 2559, 0, 0),
(9040, 10616, 5285, 0),
(9043, 12290, 12454, 0),
(9044, 1897, 0, 5259),
(9046, 10611, 0, 0),
(9047, 3346, 0, 0),
(9056, 12901, 0, 0),
(9076, 3346, 0, 0),
(9078, 5277, 0, 0),
(9079, 3361, 2081, 0),
(9080, 11025, 0, 0),
(9081, 5287, 0, 11021),
(9082, 5303, 0, 0),
(9083, 10878, 0, 5856),
(9450, 5291, 12863, 0),
(9084, 1908, 0, 0),
(9085, 10619, 0, 0),
(9086, 10611, 0, 0),
(9087, 12322, 0, 0),
(9097, 10611, 12456, 0),
(9098, 5277, 0, 0),
(9117, 1906, 0, 0),
(9118, 5301, 0, 0),
(9119, 5301, 0, 0),
(9136, 3433, 0, 0),
(11351, 13631, 0, 5870),
(11864, 6233, 0, 0),
(11858, 10614, 0, 0),
(14636, 12858, 12859, 0),
(15455, 6228, 0, 0),
(9517, 2559, 0, 0),
(9177, 2178, 1984, 0),
(9179, 1910, 0, 0),
(9197, 5304, 0, 0),
(9198, 5276, 0, 0),
(9199, 10568, 0, 0),
(9201, 11343, 0, 0),
(9217, 11343, 0, 0),
(9237, 12290, 12290, 0),
(9238, 1907, 0, 0),
(9239, 2177, 0, 0),
(11142, 1906, 12855, 0),
(9240, 6334, 0, 0),
(9241, 3433, 0, 5870),
(9257, 2559, 0, 0),
(9258, 2179, 2179, 0),
(9259, 12461, 0, 0),
(9263, 11343, 0, 0),
(9264, 1906, 1906, 0),
(9265, 2711, 2711, 0),
(9266, 12322, 0, 0),
(9267, 12294, 0, 5856),
(11997, 2714, 0, 5259),
(9269, 12328, 0, 0),
(9271, 5278, 0, 0),
(9272, 1910, 0, 0),
(10667, 12591, 0, 0),
(9273, 5278, 0, 0),
(14773, 17463, 0, 0),
(9298, 1906, 0, 0),
(9316, 1911, 0, 0),
(9317, 1911, 0, 0),
(9319, 11763, 11762, 0),
(9336, 4994, 0, 0),
(9356, 2202, 0, 0),
(9398, 6224, 0, 0),
(10802, 12322, 0, 0),
(9445, 6224, 0, 0),
(9448, 12944, 12932, 0),
(9449, 11365, 0, 0),
(9451, 13069, 0, 0),
(9452, 13050, 0, 0),
(10610, 0, 0, 11021),
(9456, 2023, 0, 0),
(10049, 12329, 0, 0),
(9462, 3361, 0, 0),
(11079, 12322, 0, 0),
(9464, 3361, 0, 0),
(10057, 1908, 0, 0),
(9476, 10568, 0, 0),
(10379, 10612, 0, 0),
(9499, 2705, 0, 0),
(9501, 2717, 0, 0),
(9503, 2703, 0, 6886),
(9523, 5304, 0, 0),
(9525, 12754, 0, 0),
(12241, 3361, 0, 0),
(9528, 12329, 0, 0),
(9529, 12329, 0, 0),
(9537, 2704, 0, 0),
(9538, 11317, 0, 0),
(9539, 11025, 0, 0),
(9541, 10617, 0, 0),
(9543, 5280, 0, 0),
(9544, 2714, 0, 0),
(10491, 13078, 0, 0),
(9545, 0, 2704, 0),
(9976, 10611, 0, 0),
(9547, 2559, 0, 0),
(9549, 0, 0, 5260),
(9980, 2714, 0, 0),
(9551, 0, 0, 12523),
(9552, 0, 0, 5259),
(9553, 0, 0, 5259),
(9554, 5289, 0, 0),
(9559, 2714, 0, 0),
(10950, 1899, 1985, 0),
(9560, 5305, 143, 0),
(9561, 2177, 0, 0),
(9562, 3433, 0, 0),
(9565, 2176, 0, 0),
(9568, 3433, 0, 0),
(16368, 10617, 0, 0),
(15500, 10619, 0, 0),
(16157, 2558, 0, 0),
(9583, 12290, 10611, 0),
(9596, 7612, 0, 0),
(9604, 3361, 0, 0),
(9616, 11424, 0, 0),
(9618, 2715, 0, 0),
(9619, 10612, 0, 0),
(9620, 11342, 0, 0),
(9636, 2199, 13341, 0),
(9676, 4994, 0, 0),
(11042, 3699, 3697, 0),
(9682, 5305, 143, 0),
(11065, 12751, 0, 0),
(9692, 12142, 0, 0),
(9693, 6618, 0, 0),
(9706, 1911, 0, 0),
(10360, 14643, 0, 0),
(9716, 5288, 0, 0),
(9717, 11343, 0, 0),
(9718, 14575, 11589, 0),
(10823, 12322, 0, 0),
(9736, 5291, 0, 2552),
(10460, 1910, 0, 0),
(9817, 2559, 0, 0),
(9818, 5304, 0, 0),
(9819, 3361, 1984, 0),
(11048, 12332, 0, 0),
(15130, 13104, 12995, 0),
(9916, 2147, 0, 0),
(9956, 2179, 1957, 2552),
(9979, 11424, 0, 0),
(9981, 11424, 0, 0),
(11074, 2177, 0, 0),
(9984, 3361, 0, 2552),
(9985, 5303, 0, 0),
(10941, 0, 12856, 0),
(9987, 12629, 0, 0),
(988003, 2716, 0, 0),
(9988, 1908, 0, 0),
(9997, 2714, 0, 0),
(9999, 11383, 0, 0),
(10000, 6322, 0, 0),
(10036, 3326, 0, 0),
(10037, 1899, 143, 2551),
(10923, 3361, 0, 0),
(10047, 0, 13604, 0),
(14510, 19924, 0, 0),
(10048, 5278, 0, 0),
(9460, 5291, 0, 2552),
(10053, 12937, 0, 0),
(10054, 12328, 0, 0),
(10055, 12801, 0, 0),
(10486, 5289, 0, 0),
(10062, 12329, 0, 0),
(10063, 12329, 0, 0),
(10079, 6680, 0, 0),
(10082, 10612, 0, 5262),
(10086, 0, 0, 5261),
(10088, 6680, 0, 0),
(10089, 5278, 0, 0),
(10090, 12332, 0, 2552),
(15075, 1910, 0, 0),
(10118, 1117, 0, 0),
(10263, 10614, 0, 0),
(10136, 11343, 0, 0),
(10162, 19404, 0, 0),
(10182, 17462, 17462, 0),
(10196, 11317, 0, 0),
(10216, 1117, 0, 0),
(10258, 10825, 0, 0),
(11140, 1911, 0, 12523),
(10264, 2023, 0, 0),
(10266, 5532, 0, 0),
(10267, 2717, 0, 0),
(10277, 1903, 0, 0),
(10278, 1903, 0, 0),
(10293, 10616, 0, 0),
(10300, 13751, 0, 0),
(10301, 1910, 12745, 0),
(11180, 6680, 0, 0),
(10302, 1911, 2081, 0),
(10303, 10611, 1957, 2552),
(10304, 12591, 0, 0),
(10305, 1911, 13610, 0),
(10306, 12294, 0, 5262),
(10307, 12322, 0, 0),
(10316, 5277, 0, 0),
(10317, 5300, 0, 0),
(11260, 1905, 0, 0),
(10318, 12297, 12298, 0),
(10323, 1983, 0, 0),
(12178, 12322, 0, 0),
(11751, 1899, 11041, 0),
(10361, 2558, 0, 0),
(10363, 12755, 0, 0),
(10364, 13337, 0, 0),
(10366, 2183, 1984, 0),
(11753, 5289, 0, 0),
(10367, 2704, 13407, 0),
(10369, 0, 0, 5261),
(12051, 10611, 10611, 14118),
(10371, 6680, 0, 0),
(10372, 5304, 0, 0),
(11029, 4994, 0, 0),
(11033, 1906, 2081, 0),
(10377, 12322, 0, 0),
(10378, 5303, 0, 0),
(10380, 5278, 0, 0),
(11037, 1911, 0, 0),
(11548, 13337, 0, 0),
(11105, 5278, 0, 2552),
(10390, 1907, 0, 0),
(10391, 1905, 1905, 0),
(11620, 1899, 1985, 0),
(10394, 12403, 0, 0),
(10398, 10616, 12861, 0),
(10399, 12298, 0, 0),
(10400, 2177, 0, 0),
(11057, 2198, 12867, 0),
(10418, 3361, 12932, 0),
(10419, 6618, 0, 0),
(10420, 12868, 0, 0),
(10421, 12934, 12933, 0),
(10422, 2177, 0, 0),
(10423, 2182, 13219, 0),
(10424, 12403, 0, 0),
(11017, 1903, 0, 0),
(10425, 13222, 13221, 0),
(10426, 5284, 0, 0),
(12043, 1910, 12745, 0),
(10427, 12329, 0, 0),
(10428, 5278, 0, 0),
(10429, 12338, 0, 0),
(10431, 2557, 0, 0),
(11814, 10611, 0, 0),
(10433, 12902, 0, 0),
(10438, 12959, 0, 0),
(11604, 1907, 0, 0),
(10440, 2181, 0, 0),
(11097, 5278, 0, 0),
(11822, 14475, 0, 12523),
(10447, 11323, 0, 0),
(11821, 10612, 0, 0),
(10455, 10616, 5285, 0),
(11829, 4994, 0, 0),
(10456, 12742, 0, 0),
(11177, 5491, 0, 0),
(11838, 5304, 0, 0),
(11837, 1908, 0, 0),
(11121, 12882, 0, 0),
(10468, 1911, 2081, 0),
(10469, 2559, 0, 0),
(10470, 5277, 0, 0),
(10471, 1907, 0, 0),
(10472, 5285, 0, 0),
(10475, 12863, 0, 0),
(10476, 2177, 0, 0),
(10477, 10617, 0, 0),
(11073, 1906, 2081, 0),
(10487, 3361, 1957, 0),
(10489, 12142, 1985, 0),
(11596, 3368, 0, 0),
(10502, 13292, 0, 0),
(11441, 3361, 0, 0),
(10503, 12867, 0, 0),
(10504, 13623, 0, 0),
(10505, 2559, 0, 0),
(10509, 3361, 1984, 0),
(10537, 11542, 0, 0),
(10840, 12883, 1984, 0),
(10539, 11542, 0, 0),
(11866, 5304, 0, 0),
(10540, 14085, 0, 14118),
(12239, 5746, 0, 0),
(10556, 12629, 0, 0),
(11439, 13069, 0, 0),
(10924, 12322, 0, 0),
(10558, 0, 0, 5259),
(12248, 10878, 0, 0),
(10559, 1907, 0, 0),
(10944, 14082, 0, 0),
(10578, 4993, 0, 0),
(10948, 12890, 1984, 0),
(10584, 11087, 0, 0),
(10600, 5491, 0, 0),
(10601, 10568, 0, 0),
(10602, 11343, 0, 0),
(10604, 5598, 0, 0),
(10605, 12937, 0, 0),
(10606, 5598, 0, 0),
(10608, 13220, 0, 0),
(13539, 14873, 0, 13292),
(10611, 0, 0, 2552),
(10612, 6680, 0, 0),
(10618, 1908, 0, 0),
(13557, 14533, 0, 0),
(10781, 12861, 0, 0),
(10637, 13894, 2081, 0),
(10638, 12290, 12456, 0),
(10643, 2147, 0, 0),
(10645, 12329, 0, 0),
(10646, 2184, 0, 0),
(10857, 10616, 0, 0),
(10801, 3367, 0, 0),
(11318, 1904, 0, 0),
(10805, 1905, 0, 0),
(11316, 3362, 13605, 0),
(10665, 3699, 3698, 0),
(11835, 2199, 0, 0),
(10676, 10615, 0, 0),
(10680, 2559, 0, 0),
(10761, 12889, 0, 0),
(10681, 3361, 1984, 0),
(11278, 1903, 0, 0),
(10682, 12593, 0, 0),
(10696, 2178, 6434, 2551),
(11867, 10613, 0, 0),
(11382, 13316, 0, 0),
(10742, 2179, 1984, 0),
(10758, 1900, 0, 0),
(10759, 12786, 12454, 0),
(10760, 11343, 0, 0),
(14229, 1899, 0, 0),
(10782, 12751, 0, 0),
(10803, 0, 0, 12523),
(11682, 11019, 12452, 0),
(10804, 0, 0, 12523),
(10811, 12742, 0, 0),
(10812, 12949, 0, 0),
(10814, 12331, 0, 0),
(10817, 12951, 0, 12523),
(10822, 12403, 0, 0),
(10824, 2178, 2178, 5262),
(10826, 12403, 0, 0),
(10827, 12959, 0, 0),
(10828, 13104, 12933, 0),
(10837, 11342, 0, 0),
(10838, 2557, 0, 0),
(12225, 13336, 0, 0),
(10839, 12882, 0, 0),
(10856, 5287, 0, 0),
(988006, 2716, 0, 0),
(10879, 2714, 0, 0),
(10881, 1906, 0, 0),
(10896, 9659, 0, 0),
(10897, 13721, 0, 5258),
(10899, 12788, 0, 0),
(10901, 11383, 0, 0),
(10917, 12883, 12751, 0),
(10920, 13061, 0, 0),
(10921, 11542, 0, 0),
(10922, 12322, 0, 0),
(10929, 2176, 0, 0),
(10930, 0, 0, 12523),
(10937, 12890, 1984, 0),
(12046, 14870, 0, 0),
(10938, 12892, 12893, 0),
(10939, 12902, 0, 0),
(12118, 10614, 0, 0),
(11603, 1910, 0, 0),
(10947, 1899, 1985, 0),
(10949, 12883, 12980, 0),
(12116, 0, 0, 14105),
(10952, 1909, 2053, 0),
(12126, 14082, 0, 0),
(10954, 10617, 0, 0),
(11611, 2178, 12932, 0),
(10976, 12863, 0, 0),
(10977, 1903, 0, 0),
(10978, 12863, 0, 0),
(10982, 2695, 0, 0),
(10983, 12629, 10617, 0),
(10987, 3350, 0, 0),
(10991, 3494, 0, 0),
(12156, 12290, 0, 0),
(10993, 1911, 2081, 0),
(10996, 12944, 12980, 0),
(10997, 11763, 11763, 12523),
(11019, 0, 0, 13147),
(11450, 17383, 0, 0),
(11022, 5284, 0, 0),
(11023, 2180, 0, 0),
(11025, 1911, 0, 0),
(11026, 1911, 0, 0),
(11028, 1911, 0, 0),
(11911, 1905, 0, 5856),
(11031, 12742, 0, 0),
(11032, 12950, 0, 0),
(11034, 13165, 0, 0),
(11035, 5287, 0, 0),
(11036, 5289, 0, 0),
(11038, 4993, 2081, 0),
(11913, 14706, 0, 0),
(11039, 2557, 0, 0),
(11040, 12949, 0, 0),
(11041, 2716, 3694, 0),
(11043, 3494, 11506, 0),
(11346, 13698, 0, 0),
(11044, 2827, 3698, 0),
(11863, 13751, 0, 0),
(11046, 3699, 3697, 0),
(11712, 6680, 0, 0),
(11857, 2715, 0, 0),
(11047, 2198, 13341, 0),
(11049, 12991, 0, 0),
(11051, 5281, 0, 0),
(11052, 2184, 0, 0),
(11053, 12591, 0, 0),
(11054, 11763, 0, 2552),
(11720, 3433, 0, 0),
(11865, 14534, 14533, 0),
(11055, 2559, 0, 0),
(11056, 12742, 0, 0),
(11066, 0, 12751, 0),
(11067, 0, 12863, 0),
(11068, 2177, 0, 0),
(11070, 13061, 0, 0),
(11071, 12742, 0, 0),
(11076, 2559, 0, 0),
(11077, 6224, 0, 0),
(12017, 12403, 0, 0),
(11083, 5278, 0, 0),
(11084, 12290, 0, 0),
(12031, 6229, 0, 0),
(11096, 12742, 0, 0),
(11099, 5305, 11041, 2551),
(11466, 13061, 0, 0),
(11102, 12403, 0, 2551),
(13518, 10611, 0, 5262),
(11820, 0, 0, 5260),
(11104, 2715, 0, 0),
(11106, 12801, 0, 0),
(11116, 2715, 0, 0),
(11117, 12745, 0, 0),
(11118, 2704, 0, 0),
(11119, 12329, 0, 0),
(11120, 13312, 0, 0),
(11137, 12993, 12993, 0),
(11138, 10616, 0, 5259),
(11139, 3433, 0, 0),
(13840, 13627, 0, 0),
(11143, 12751, 0, 0),
(11145, 2558, 0, 0),
(11806, 5598, 0, 14118),
(11146, 2182, 0, 0),
(11878, 2183, 2183, 5258),
(11176, 5532, 0, 0),
(11178, 1903, 0, 0),
(11323, 3361, 2052, 0),
(11182, 1906, 0, 0),
(11183, 2715, 0, 0),
(11184, 0, 0, 11021),
(11185, 1911, 0, 0),
(11186, 1910, 0, 0),
(11187, 2827, 6228, 0),
(11188, 3699, 3697, 0),
(11189, 2184, 0, 0),
(11191, 2557, 0, 0),
(11192, 5288, 0, 0),
(11193, 12944, 0, 0),
(11790, 10617, 0, 0),
(11194, 5305, 12980, 0),
(11196, 12786, 12786, 0),
(11218, 13337, 0, 0),
(11257, 5304, 0, 0),
(11339, 12889, 0, 5258),
(11259, 10612, 0, 0),
(11261, 2827, 2827, 0),
(11276, 5598, 0, 0),
(11277, 2715, 0, 0),
(11280, 1906, 0, 0),
(12160, 5598, 0, 2550),
(11285, 1117, 0, 0),
(11286, 12748, 12863, 0),
(11287, 3351, 0, 0),
(11289, 12890, 1984, 0),
(11296, 12890, 1984, 0),
(11317, 1117, 13605, 0),
(12196, 2196, 0, 0),
(11322, 10619, 0, 0),
(11324, 12937, 0, 0),
(12204, 1899, 0, 0),
(11340, 13336, 0, 0),
(11347, 5291, 12748, 0),
(11348, 3494, 11506, 0),
(11350, 11762, 0, 5856),
(11353, 11321, 0, 0),
(11355, 12294, 0, 0),
(11356, 13627, 13319, 0),
(12236, 10616, 10616, 14118),
(11380, 13722, 0, 0),
(11383, 13720, 0, 0),
(11387, 5278, 5278, 0),
(11388, 11424, 0, 0),
(11389, 11343, 0, 0),
(11390, 12788, 0, 0),
(11391, 13753, 0, 0),
(13087, 1903, 1984, 0),
(11438, 3346, 0, 0),
(11440, 5287, 0, 0),
(11442, 11763, 11763, 0),
(11445, 6224, 0, 0),
(11451, 2179, 0, 0),
(11452, 10619, 10619, 0),
(12045, 14875, 0, 0),
(11456, 10617, 0, 0),
(11467, 12298, 12298, 0),
(11470, 11424, 0, 0),
(13151, 10619, 10617, 5259),
(12197, 2557, 0, 0),
(12205, 5304, 0, 0),
(11486, 18293, 18293, 0),
(11488, 12993, 0, 14118),
(11498, 5287, 0, 0),
(11517, 3350, 0, 0),
(11519, 2179, 0, 0),
(11536, 2182, 0, 0),
(11546, 1906, 0, 0),
(12942, 2715, 0, 0),
(11856, 5281, 0, 0),
(11860, 5301, 0, 0),
(11600, 5276, 0, 0),
(11605, 1983, 0, 0),
(11609, 0, 0, 11021),
(11610, 10618, 0, 0),
(11613, 1905, 0, 11021),
(11615, 2177, 0, 0),
(11616, 2559, 0, 0),
(11621, 12890, 1984, 0),
(11624, 13337, 0, 0),
(11625, 2714, 0, 0),
(11629, 1907, 0, 0),
(11656, 12629, 0, 0),
(11657, 1907, 0, 0),
(11662, 2176, 0, 0),
(11664, 13632, 0, 0),
(11877, 10612, 12456, 14642),
(11881, 14618, 0, 0),
(11677, 11322, 0, 0),
(11679, 10617, 4993, 0),
(11680, 5278, 0, 14118),
(11681, 14643, 0, 0),
(11683, 5303, 0, 0),
(11687, 12629, 12629, 0),
(11833, 10612, 13319, 0),
(11696, 3494, 11506, 0),
(11697, 2809, 0, 0),
(11703, 2182, 0, 0),
(11706, 3364, 0, 0),
(11708, 12328, 0, 0),
(11709, 11762, 0, 0),
(11711, 0, 0, 14118),
(11713, 2023, 0, 0),
(11714, 12786, 0, 0),
(11715, 13631, 0, 0),
(13089, 12882, 0, 0),
(11716, 0, 0, 14105),
(11861, 1908, 0, 0),
(11718, 3433, 0, 0),
(11869, 14527, 0, 0),
(11937, 14870, 0, 0),
(11949, 14618, 0, 0),
(11749, 2184, 0, 0),
(11752, 12852, 0, 0),
(11754, 5289, 0, 0),
(11755, 5289, 0, 0),
(11901, 3433, 0, 0),
(11792, 1897, 0, 0),
(11793, 6680, 0, 5870),
(11794, 10878, 0, 5870),
(11803, 13222, 12861, 0),
(11804, 12786, 12861, 0),
(11805, 13721, 0, 0),
(11807, 0, 0, 11021),
(11808, 0, 0, 12523),
(13525, 10616, 2147, 5261),
(11823, 3433, 0, 0),
(13522, 2179, 10616, 13147),
(13219, 2184, 5281, 0),
(11830, 13751, 0, 0),
(11831, 12959, 0, 0),
(11839, 14824, 0, 0),
(13529, 17463, 0, 0),
(11868, 10616, 10616, 0),
(11870, 14532, 0, 0),
(11872, 11424, 0, 0),
(11876, 13719, 0, 0),
(11880, 13312, 13312, 0),
(11882, 12421, 0, 0),
(11886, 3346, 13610, 0),
(11887, 3346, 13609, 0),
(11898, 12949, 0, 0),
(11899, 3433, 0, 0),
(11900, 3433, 0, 0),
(11910, 12786, 12786, 0),
(11912, 3326, 0, 0),
(11946, 11019, 13718, 0),
(11948, 12883, 14880, 0),
(13356, 1903, 2081, 0),
(11998, 1906, 0, 2550),
(12018, 12063, 0, 0),
(12021, 5278, 12745, 0),
(12024, 12890, 0, 0),
(12025, 6233, 0, 0),
(12026, 2197, 0, 0),
(988004, 2716, 0, 0),
(12030, 5278, 0, 0),
(12042, 13337, 0, 0),
(12048, 3432, 0, 14105),
(12050, 12890, 12995, 5261),
(12052, 12629, 12454, 2550),
(12053, 13718, 13629, 5261),
(12097, 12856, 0, 5262),
(12127, 5305, 1985, 5261),
(12128, 12403, 0, 0),
(12129, 13631, 0, 0),
(12136, 4994, 0, 0),
(12137, 4994, 0, 0),
(12157, 14535, 0, 0),
(12158, 13632, 0, 5870),
(12179, 2147, 2147, 0),
(12198, 13631, 0, 0),
(12240, 1899, 0, 0),
(12242, 6680, 0, 5870),
(13616, 1906, 0, 0),
(12243, 1905, 0, 5258),
(12245, 2714, 0, 0),
(12259, 13698, 0, 0),
(12264, 2177, 0, 0),
(15709, 13631, 0, 0),
(16076, 20468, 0, 0),
(12322, 14880, 14534, 13147),
(12337, 1903, 0, 0),
(13216, 1903, 0, 0),
(12338, 14875, 0, 5262),
(12340, 5746, 13609, 0),
(15062, 19015, 0, 0),
(13220, 11424, 0, 0),
(13737, 2023, 0, 5870),
(13296, 14533, 12980, 5262),
(15869, 21554, 0, 21554),
(14322, 2704, 0, 0),
(13817, 12322, 0, 0),
(14625, 17383, 0, 0),
(12369, 15910, 0, 0),
(13097, 2711, 0, 0),
(12379, 5281, 13609, 0),
(12380, 3367, 0, 0),
(12384, 12855, 0, 0),
(14226, 11019, 0, 0),
(12397, 13708, 0, 0),
(12416, 17463, 0, 0),
(12420, 14837, 0, 0),
(12422, 12285, 0, 0),
(12423, 1899, 143, 0),
(12425, 10617, 10617, 0),
(13598, 1906, 0, 0),
(12427, 2557, 0, 2552),
(12962, 1117, 0, 0),
(15634, 0, 0, 14105),
(12429, 5598, 0, 2550),
(12430, 5289, 0, 0),
(13153, 12883, 13630, 14105),
(12457, 13705, 0, 0),
(12458, 18123, 0, 0),
(12459, 12959, 0, 0),
(12460, 5597, 0, 0),
(13117, 13337, 0, 0),
(12461, 3432, 0, 0),
(12463, 13631, 0, 0),
(12464, 6224, 0, 0),
(12465, 13050, 0, 0),
(12468, 11383, 0, 0),
(12474, 12403, 0, 0),
(12477, 3433, 0, 0),
(12480, 21573, 21572, 0),
(13137, 12290, 12290, 5262),
(12481, 21553, 0, 0),
(13217, 12855, 0, 0),
(14903, 12868, 0, 0),
(12557, 18122, 0, 0),
(12576, 12754, 0, 0),
(12577, 2715, 0, 0),
(15453, 1907, 0, 0),
(12578, 2714, 0, 0),
(12580, 5305, 143, 0),
(15611, 10619, 0, 0),
(12616, 5303, 0, 0),
(12617, 2182, 0, 0),
(13519, 12290, 0, 5261),
(12636, 5303, 0, 0),
(12657, 2715, 0, 0),
(12696, 13625, 0, 0),
(13535, 11322, 0, 0),
(12717, 13337, 0, 0),
(12719, 17123, 0, 0),
(12720, 12745, 0, 0),
(12721, 12745, 0, 0),
(13318, 13160, 0, 14105),
(12805, 1899, 1984, 0),
(12736, 13336, 0, 0),
(12737, 2809, 2809, 5259),
(12738, 2705, 0, 0),
(12739, 2179, 1984, 0),
(12740, 5303, 0, 0),
(12756, 2176, 0, 0),
(13476, 2200, 0, 0),
(12776, 2184, 0, 0),
(12921, 1983, 0, 0),
(12778, 10613, 143, 0),
(12779, 13750, 0, 0),
(12780, 0, 0, 13147),
(12781, 12744, 0, 0),
(12783, 3364, 10616, 0),
(12786, 2178, 143, 0),
(12788, 13627, 0, 0),
(12789, 13631, 0, 0),
(12790, 13612, 0, 0),
(12791, 0, 0, 16582),
(12796, 10611, 0, 0),
(12877, 10612, 0, 0),
(12797, 12403, 0, 0),
(12807, 10617, 0, 0),
(12816, 10611, 13609, 0),
(12837, 11424, 0, 0),
(12856, 13165, 0, 5258),
(12858, 10878, 0, 0),
(12859, 12290, 12454, 0),
(13738, 1905, 0, 5258),
(12862, 5278, 0, 14118),
(13528, 5287, 0, 5258),
(12863, 5278, 0, 14118),
(12784, 12751, 0, 0),
(12865, 13290, 0, 0),
(12866, 12328, 0, 0),
(12867, 12290, 0, 0),
(12896, 5598, 0, 2550),
(12897, 1899, 0, 0),
(12902, 5491, 0, 0),
(14225, 14880, 0, 0),
(12903, 1905, 1957, 5260),
(16283, 1910, 0, 0),
(15846, 5305, 0, 5260),
(12919, 1117, 0, 0),
(12920, 5278, 0, 0),
(12939, 12856, 0, 0),
(12941, 12850, 0, 0),
(16146, 2179, 11041, 0),
(12943, 5278, 0, 0),
(12944, 13894, 2081, 0),
(16226, 10613, 13406, 0),
(12957, 2715, 0, 0),
(12958, 2199, 0, 0),
(12959, 12745, 0, 0),
(14188, 12298, 12298, 0),
(12960, 2196, 0, 0),
(12961, 1117, 0, 0),
(12977, 5491, 0, 0),
(12996, 2557, 0, 2552),
(15703, 13707, 0, 0),
(12998, 3367, 0, 0),
(13000, 1911, 0, 0),
(13358, 0, 5262, 5262),
(13018, 2196, 0, 0),
(13739, 6680, 0, 5870),
(14392, 18419, 0, 0),
(13019, 2177, 0, 0),
(13076, 2557, 0, 2552),
(13078, 14534, 12980, 0),
(13079, 12889, 0, 5262),
(13080, 5491, 0, 0),
(13081, 12285, 0, 0),
(13084, 5278, 5278, 0),
(12428, 1905, 0, 0),
(13085, 17282, 17283, 0),
(13086, 14533, 12980, 5260),
(13088, 10617, 17283, 0),
(13096, 1908, 0, 0),
(13098, 5303, 0, 0),
(13099, 12329, 0, 0),
(13116, 12591, 0, 0),
(13118, 3361, 12932, 0),
(13138, 13925, 0, 2551),
(13139, 12403, 0, 5258),
(13140, 14586, 0, 5262),
(13143, 11323, 0, 5260),
(13144, 14535, 0, 2551),
(13147, 13627, 0, 14118),
(15906, 2703, 0, 0),
(13149, 2711, 2147, 0),
(13150, 10618, 10618, 0),
(13152, 11317, 0, 5258),
(13154, 13627, 5285, 2551),
(13155, 12593, 10898, 0),
(13157, 1908, 0, 0),
(13158, 2809, 0, 0),
(13159, 1899, 0, 0),
(13176, 1903, 0, 0),
(13177, 3433, 0, 0),
(13179, 10612, 0, 5258),
(13546, 6618, 0, 0),
(13180, 14877, 0, 2551),
(13181, 13625, 0, 11021),
(16093, 2711, 0, 0),
(13218, 2558, 0, 0),
(13236, 3361, 13628, 0),
(13257, 1903, 0, 0),
(13996, 2716, 0, 0),
(13427, 17382, 0, 5258),
(13283, 1900, 5284, 0),
(13284, 12629, 13319, 0),
(13297, 5293, 0, 5259),
(13298, 11762, 11041, 2551),
(13299, 14882, 17482, 5261),
(13300, 12890, 11041, 13147),
(13316, 1910, 0, 0),
(13317, 1910, 0, 0),
(13319, 11317, 0, 11021),
(13320, 13165, 12980, 5259),
(14264, 3432, 0, 0),
(13324, 1899, 6254, 0),
(13325, 2182, 0, 14105),
(13326, 2183, 12981, 0),
(13327, 14881, 0, 5258),
(13328, 11042, 13630, 5261),
(13329, 12593, 10898, 5258),
(13330, 10612, 12456, 0),
(14733, 5598, 0, 13147),
(13331, 14533, 12980, 0),
(13332, 12593, 12452, 5261),
(13333, 2179, 6254, 0),
(13334, 12297, 10611, 5259),
(13335, 2182, 0, 14105),
(13336, 14882, 0, 2550),
(13337, 13625, 13628, 5261),
(13357, 1906, 12290, 0),
(13359, 0, 0, 5261),
(13377, 1911, 0, 0),
(13396, 1910, 0, 0),
(13397, 1910, 0, 0),
(13417, 2558, 0, 0),
(13421, 10614, 11589, 14118),
(13422, 13312, 12980, 13147),
(13424, 12944, 6254, 5262),
(13425, 14893, 12991, 5261),
(14304, 5289, 0, 2507),
(13426, 2182, 0, 14105),
(14829, 1911, 0, 0),
(13428, 14877, 13319, 5259),
(14827, 5287, 0, 0),
(13437, 4991, 0, 2551),
(12777, 5305, 1984, 0),
(13438, 13160, 0, 5262),
(13439, 13150, 0, 5258),
(13440, 17462, 0, 13147),
(13441, 17463, 0, 5262),
(13442, 13721, 0, 0),
(13443, 13339, 0, 5262),
(14101, 12889, 0, 0),
(13444, 12856, 0, 0),
(13446, 5278, 5278, 13147),
(15127, 12890, 0, 0),
(13447, 13312, 12995, 0),
(13448, 13706, 0, 5261),
(13449, 14874, 14874, 0),
(13524, 2711, 2711, 5258),
(13526, 12890, 12298, 2550),
(13527, 10613, 10618, 2551),
(13530, 12294, 0, 0),
(13531, 17383, 0, 14105),
(14905, 10617, 12332, 0),
(14754, 14870, 0, 0),
(13534, 12889, 0, 0),
(13536, 13708, 0, 0),
(13537, 10619, 0, 13293),
(13538, 13750, 0, 13293),
(13540, 12328, 0, 0),
(13541, 13061, 0, 0),
(13542, 13753, 0, 0),
(13543, 12285, 0, 0),
(13544, 12285, 0, 0),
(13545, 12285, 0, 0),
(13547, 2177, 0, 0),
(13548, 11343, 0, 0),
(13549, 14533, 1984, 0),
(13550, 14533, 12980, 0),
(13551, 12883, 12980, 0),
(13552, 12950, 0, 0),
(13553, 13925, 0, 0),
(13554, 12901, 0, 0),
(13556, 14836, 0, 0),
(13576, 3433, 0, 5261),
(14523, 13698, 0, 0),
(13577, 14534, 0, 12523),
(13597, 13627, 0, 2550),
(15308, 12959, 0, 0),
(13617, 2715, 0, 0),
(14509, 12951, 0, 0),
(13656, 13061, 0, 0),
(13841, 13312, 6254, 5258),
(13697, 1906, 0, 0),
(13740, 3361, 0, 0),
(13741, 5746, 0, 0),
(13742, 1899, 0, 0),
(13776, 17383, 0, 0),
(13777, 13312, 12995, 0),
(13797, 2182, 0, 0),
(13798, 13708, 0, 2551),
(13816, 13316, 0, 0),
(13842, 13339, 0, 0),
(13843, 12742, 0, 0),
(13917, 12850, 0, 0),
(15138, 2183, 1984, 2551),
(13956, 12786, 0, 0),
(13957, 11019, 13319, 0),
(13958, 13721, 0, 0),
(14021, 14706, 0, 0),
(14026, 14706, 0, 0),
(14027, 14706, 0, 0),
(14377, 10612, 10612, 2507),
(14028, 14706, 0, 0),
(14029, 14706, 0, 0),
(14030, 14706, 0, 0),
(14031, 14706, 0, 0),
(14182, 12951, 0, 13924),
(14183, 0, 0, 15460),
(14185, 4993, 0, 0),
(14186, 18062, 0, 0),
(14187, 13632, 0, 0),
(14221, 1897, 0, 0),
(14230, 13753, 0, 0),
(14439, 2178, 5284, 0),
(13520, 5305, 2147, 13147),
(14262, 3432, 0, 0),
(14263, 3432, 0, 0),
(14267, 2827, 0, 0),
(14271, 3361, 0, 0),
(14275, 5288, 0, 0),
(14278, 13336, 0, 0),
(14423, 2178, 5284, 0),
(14281, 2180, 2081, 2551),
(14284, 12890, 12981, 5259),
(14626, 1910, 13611, 0),
(14285, 5305, 12980, 5259),
(14301, 12852, 0, 0),
(14321, 2183, 2052, 0),
(14324, 14618, 0, 0),
(14325, 5287, 0, 0),
(14326, 10611, 2052, 0),
(14327, 13698, 0, 0),
(15793, 2703, 0, 0),
(14351, 14527, 0, 0),
(14363, 11763, 11763, 0),
(14364, 13753, 0, 0),
(14365, 11763, 11763, 0),
(14367, 11763, 11763, 0),
(14368, 12742, 0, 0),
(15184, 14882, 20417, 5261),
(16064, 22724, 0, 0),
(14375, 10612, 10612, 2507),
(14376, 10612, 10612, 2507),
(14378, 5598, 5598, 0),
(14381, 12742, 0, 0),
(16072, 12063, 0, 0),
(14382, 12742, 0, 0),
(14383, 12742, 0, 0),
(15264, 2182, 0, 0),
(15777, 12290, 12290, 0),
(16080, 13339, 0, 0),
(14390, 1901, 0, 2552),
(14393, 2809, 0, 0),
(15276, 21796, 0, 0),
(14402, 2179, 2179, 0),
(14403, 2179, 2179, 0),
(15863, 2810, 13628, 0),
(14404, 2179, 2179, 0),
(14425, 5278, 5278, 0),
(14426, 12788, 0, 0),
(14427, 1910, 0, 0),
(14432, 18167, 0, 0),
(14437, 5303, 0, 0),
(14438, 2178, 5284, 0),
(14440, 18596, 18596, 14642),
(14441, 18596, 18596, 14642),
(14442, 18596, 18596, 14642),
(15775, 11369, 0, 0),
(14445, 13632, 0, 0),
(15260, 13336, 0, 0),
(15847, 12294, 0, 0),
(15841, 12944, 143, 0),
(14456, 17463, 0, 0),
(15855, 17383, 0, 13924),
(14463, 12959, 0, 0),
(14469, 18644, 0, 0),
(14479, 13722, 0, 0),
(15201, 3494, 0, 0),
(14483, 12889, 0, 0),
(14487, 12332, 0, 0),
(14488, 14643, 0, 0),
(14489, 1905, 0, 5261),
(14492, 1910, 13609, 0),
(15213, 20718, 0, 0),
(15724, 3361, 0, 2552),
(14497, 3362, 0, 0),
(14498, 5303, 0, 0),
(14507, 19916, 19917, 0),
(15839, 10611, 12787, 0),
(14508, 2179, 0, 0),
(14516, 12304, 0, 0),
(14517, 13720, 0, 0),
(16139, 14882, 20417, 0),
(14522, 5303, 0, 0),
(15702, 5280, 0, 0),
(15189, 3699, 0, 0),
(15700, 18419, 0, 0),
(15197, 13069, 0, 0),
(15708, 14873, 0, 0),
(14567, 13894, 2081, 0),
(16058, 18122, 0, 0),
(14622, 3361, 2081, 12523),
(14624, 13894, 2081, 0),
(14627, 3494, 11506, 0),
(14628, 3351, 13606, 0),
(14634, 2703, 2703, 0),
(14638, 3326, 0, 0),
(14639, 5491, 0, 0),
(15615, 13720, 0, 0),
(14715, 5598, 0, 13147),
(14717, 13707, 13319, 5260),
(15084, 19980, 19980, 0),
(14718, 12629, 0, 0),
(14720, 21580, 0, 0),
(14724, 13721, 0, 0),
(14873, 12801, 0, 0),
(14729, 3361, 2081, 0),
(14730, 3433, 0, 5262),
(14734, 3350, 3350, 0),
(14736, 13337, 0, 0),
(14737, 1903, 13611, 0),
(14738, 2827, 13406, 0),
(14739, 6234, 3694, 0),
(14740, 1117, 6229, 0),
(14741, 0, 0, 5262),
(14742, 4994, 0, 0),
(15460, 12629, 0, 0),
(14743, 4994, 0, 0),
(14748, 1909, 0, 0),
(14753, 12944, 12944, 13147),
(14762, 14533, 1984, 0),
(16090, 6232, 0, 0),
(14763, 14533, 1984, 0),
(14764, 14533, 1984, 0),
(14909, 3362, 0, 0),
(14765, 14533, 1984, 0),
(14766, 14533, 1984, 0),
(14767, 14533, 1984, 0),
(14768, 14533, 1984, 0),
(14849, 3362, 13604, 0),
(14769, 14533, 1984, 0),
(14770, 17463, 0, 0),
(14772, 17463, 0, 0),
(14774, 17463, 0, 0),
(14775, 17463, 0, 0),
(14776, 17463, 0, 0),
(14857, 1117, 0, 0),
(14777, 17463, 0, 0),
(14781, 18419, 0, 0),
(14822, 12746, 12865, 0),
(14823, 19214, 0, 0),
(14828, 0, 12850, 0),
(14844, 13861, 0, 0),
(14847, 0, 12867, 0),
(14859, 12285, 0, 5260),
(14875, 13336, 0, 0),
(13516, 17462, 0, 14105),
(14882, 2176, 0, 0),
(16215, 12959, 0, 0),
(14684, 13698, 0, 0),
(14893, 12285, 0, 2550),
(14901, 12629, 0, 0),
(14904, 14586, 0, 0),
(14908, 3350, 0, 0),
(14910, 12868, 0, 0),
(14921, 11314, 12850, 0),
(14942, 19623, 0, 0),
(14961, 12858, 0, 0),
(14962, 2196, 0, 0),
(14963, 12855, 0, 0),
(16359, 5305, 12980, 0),
(14964, 2196, 0, 0),
(14982, 5598, 0, 0),
(16148, 13504, 23356, 0),
(14983, 12901, 0, 0),
(14984, 12890, 1984, 0),
(16156, 12801, 0, 0),
(15723, 2703, 0, 0),
(15006, 10616, 0, 0),
(15007, 19980, 0, 0),
(15008, 19981, 0, 0),
(15021, 19762, 19763, 0),
(15022, 1895, 2053, 0),
(15046, 3367, 0, 0),
(15064, 1903, 0, 0),
(15074, 1910, 0, 0),
(15076, 13336, 0, 0),
(15077, 1117, 19485, 0),
(15078, 13607, 0, 0),
(15083, 11383, 0, 0),
(15086, 3367, 0, 0),
(15088, 14870, 0, 2552),
(16055, 2176, 0, 0),
(15111, 13336, 0, 0),
(16063, 23583, 0, 0),
(15116, 12850, 0, 0),
(15124, 12856, 0, 0),
(15125, 13861, 0, 0),
(15126, 17282, 0, 0),
(15128, 14874, 12893, 0),
(15498, 13709, 0, 0),
(15131, 0, 0, 5262),
(15136, 10612, 12453, 5260),
(15137, 1899, 1957, 2551),
(15162, 5532, 2827, 0),
(15610, 10619, 0, 0),
(15181, 20412, 0, 0),
(15182, 12993, 12993, 0),
(16065, 23582, 0, 0),
(15908, 2703, 0, 0),
(15191, 13709, 0, 0),
(15200, 10617, 12861, 0),
(15202, 20719, 0, 0),
(15203, 12403, 0, 0),
(15206, 5746, 0, 0),
(16103, 12902, 0, 0),
(16097, 18122, 0, 5259),
(15270, 11542, 0, 0),
(15282, 1903, 0, 0),
(15303, 1906, 0, 0),
(15451, 5598, 0, 0),
(15306, 5300, 0, 0),
(15315, 1909, 0, 0),
(15350, 13706, 0, 0),
(15353, 1906, 12857, 0),
(15354, 1906, 12851, 0),
(15459, 1910, 0, 0),
(15275, 21794, 0, 0),
(15441, 0, 0, 12523),
(15442, 5287, 0, 0),
(15443, 2557, 0, 0),
(15444, 13078, 0, 0),
(16165, 24418, 0, 0),
(15471, 21465, 21465, 0),
(15473, 4991, 0, 0),
(15502, 12746, 0, 0),
(15504, 18122, 0, 0),
(15612, 13706, 0, 0),
(15613, 14823, 0, 0),
(15616, 2183, 10612, 0),
(15617, 12629, 12629, 5856),
(15961, 20417, 20417, 0),
(15852, 10612, 21549, 0),
(15853, 14870, 0, 0),
(15854, 14879, 0, 0),
(15857, 20412, 0, 0),
(15858, 21573, 21572, 0),
(15859, 14873, 0, 0),
(15862, 12950, 0, 0),
(15866, 21551, 21551, 0),
(15868, 21573, 21572, 0),
(15870, 21555, 0, 0),
(15903, 4991, 0, 0),
(14635, 1910, 0, 0),
(16154, 3367, 0, 0),
(16158, 1903, 5532, 0),
(16163, 23328, 0, 0),
(16193, 10756, 0, 0),
(16194, 11342, 0, 0),
(16216, 13222, 13222, 0),
(16803, 2180, 23356, 0),
(15953, 23743, 0, 0),
(15772, 13622, 0, 0),
(16145, 12755, 0, 0),
(16112, 22199, 0, 0),
(15685, 1897, 0, 0),
(15540, 10619, 0, 0),
(16061, 23328, 0, 0),
(16016, 13316, 0, 0),
(16012, 14824, 0, 0),
(16032, 12751, 0, 0),
(16033, 13069, 0, 0),
(16376, 1903, 13611, 0),
(16101, 13222, 0, 0),
(16102, 18983, 12893, 0),
(16104, 18983, 12893, 0),
(16118, 13698, 0, 0),
(15440, 13316, 0, 0),
(15499, 5300, 0, 0),
(17766, 2147, 5278, 5261),
(16091, 12332, 3698, 0),
(16387, 22738, 22738, 0),
(16361, 5305, 12980, 0),
(16241, 5305, 12980, 0),
(7291, 5284, 0, 0),
(4854, 5303, 0, 0),
(6906, 5305, 0, 5260),
(6908, 0, 13922, 0),
(15419, 2716, 0, 0),
(15542, 17942, 0, 0),
(15692, 1896, 0, 0),
(16042, 1907, 0, 0),
(16094, 5491, 0, 0),
(12793, 6680, 0, 0),
(15526, 6233, 0, 0),
(16052, 3433, 0, 5259),
(15760, 2703, 0, 0),
(16096, 3361, 11586, 2552),
(16228, 22596, 0, 0),
(15508, 0, 2081, 0),
(16392, 21553, 0, 0),
(16399, 2184, 0, 0),
(16418, 3699, 0, 0),
(15085, 19988, 0, 0),
(12795, 12786, 0, 0),
(17765, 2183, 1957, 5261),
(15545, 20417, 20417, 0),
(15552, 21129, 12868, 0),
(15609, 10619, 0, 0),
(15693, 21192, 0, 0),
(15694, 2703, 0, 0),
(15719, 2703, 0, 0),
(15864, 12856, 0, 0),
(13517, 10611, 0, 14118),
(15907, 2703, 0, 0),
(16125, 13504, 23356, 0),
(16150, 2181, 0, 0),
(15469, 6680, 0, 0),
(16378, 5305, 11041, 2551),
(16981, 5305, 0, 0),
(16983, 4991, 0, 0),
(16984, 12285, 0, 0),
(12782, 13160, 0, 0),
(14581, 14824, 0, 0),
(15458, 2557, 0, 0),
(15477, 21123, 0, 0),
(15515, 5278, 0, 0),
(15528, 12937, 0, 0),
(15704, 10612, 0, 0),
(15707, 13312, 0, 0),
(16254, 2181, 0, 0),
(15437, 21121, 0, 0),
(16395, 19053, 0, 0),
(16396, 5305, 143, 0),
(17041, 0, 3757, 0),
(17048, 0, 3757, 0),
(17049, 0, 3757, 0),
(17050, 0, 3757, 0),
(17051, 0, 3757, 0),
(17635, 13160, 0, 0),
(17647, 12890, 1984, 0),
(17995, 13160, 0, 0),
(17996, 12890, 1984, 0),
(15383, 17942, 0, 0),
(15431, 1899, 0, 0),
(15445, 1899, 0, 0),
(15446, 2184, 0, 0),
(15448, 12890, 0, 0),
(15457, 0, 0, 5258),
(15539, 17383, 0, 0),
(15701, 21286, 0, 0),
(7504, 2711, 0, 0),
(10080, 10612, 0, 0),
(10081, 10617, 10617, 0),
(16285, 5305, 12980, 0),
(14261, 3432, 0, 0),
(14265, 3432, 0, 0),
(14302, 12403, 0, 0),
(14695, 18985, 12893, 5258),
(15423, 5598, 5598, 0),
(15495, 14475, 0, 14118),
(15512, 2198, 12870, 0),
(15522, 11019, 0, 0),
(15525, 21122, 0, 0),
(15532, 12754, 0, 0),
(15533, 2202, 0, 0),
(15535, 6228, 0, 0),
(15633, 5598, 0, 14105),
(15840, 18596, 11323, 0),
(15850, 17283, 10616, 0),
(15851, 2147, 2178, 0),
(15856, 14873, 0, 0),
(15860, 5284, 0, 21564),
(15861, 10591, 6254, 0),
(15865, 18596, 11323, 0),
(16049, 22210, 22211, 0),
(16050, 22215, 5284, 0),
(16054, 22341, 11587, 0),
(16255, 5305, 12980, 0),
(16433, 14873, 0, 0),
(16434, 18122, 0, 0),
(16435, 14873, 0, 0),
(16436, 18122, 0, 0),
(16861, 22738, 0, 0),
(2454, 2711, 0, 0),
(10579, 943, 0, 0),
(15796, 12788, 0, 0),
(15720, 13339, 0, 0),
(10459, 12338, 0, 0),
(12792, 14836, 0, 0),
(13521, 5305, 5281, 13147),
(13523, 2179, 2179, 13147),
(15394, 5300, 0, 0),
(15773, 11763, 11763, 12523),
(15774, 18293, 18293, 0),
(15776, 12338, 0, 0),
(15794, 2703, 0, 0),
(16281, 12862, 0, 0),
(16439, 2182, 0, 0),
(16440, 22709, 0, 0),
(16775, 22709, 0, 0),
(16776, 23582, 0, 0),
(16777, 23583, 0, 0),
(16778, 22724, 0, 0),
(17038, 0, 3757, 0),
(155520, 21129, 12868, 0),
(160003, 13222, 13221, 0),
(160004, 13222, 13221, 0),
(160005, 13222, 13221, 0),
(988005, 2716, 0, 0),
(988002, 2716, 0, 0),
(10163, 19404, 0, 0),
(56000, 10619, 0, 0),
(7091, 1903, 1984, 0),
(14599, 12951, 0, 0),
(10819, 11019, 0, 0),
(7070, 2182, 0, 0),
(7075, 2177, 0, 0),
(12785, 5288, 0, 0),
(12794, 14874, 0, 0),
(13601, 10825, 11586, 12523),
(4752, 10611, 0, 0),
(7954, 4994, 0, 0),
(7789, 5300, 0, 0),
(11190, 5291, 11586, 2552),
(7207, 6651, 0, 0),
(8402, 2901, 0, 0),
(16505, 5495, 0, 0);

-- Correct equipment for individual spawns.
UPDATE `creature` SET `equipment_id`=0 WHERE `guid` IN (50, 81482, 2354, 90921, 51981, 16433, 16435, 16436, 533000, 52141, 2353, 49109, 1027, 1246599, 1246600, 1246601, 1246602, 1246606, 1246607, 66900, 2470, 2938, 4444, 5086, 12411, 12415, 13990, 14056, 14572, 14607, 14772, 15424, 16274, 16275, 16277, 16296, 16443, 16444, 16448, 17901, 18235, 18241, 18675, 19414, 20566, 20720, 21572, 24767, 26121, 26129, 26313, 26320, 26577, 26625, 27397, 27407, 27567, 28480, 29113, 30122, 30132, 30205, 30213, 30214, 30215, 30217, 30251, 30257, 30341, 30365, 31982, 32043, 32344, 33495, 39965, 39967, 42969, 42983, 42984, 43201, 43202, 43203, 43322, 43503, 43527, 43528, 44148, 44309, 44310, 44318, 44327, 44328, 44329, 44330, 44331, 44332, 44333, 44339, 45154, 45436, 45490, 45491, 45525, 45710, 45749, 45857, 45860, 45875, 45953, 46394, 47631, 47781, 47786, 47799, 47825, 47893, 47894, 47895, 48696, 48784, 49056, 49058, 49131, 49132, 49133, 49134, 49135, 49136, 49752, 51403, 51414, 51416, 51417, 51807, 51808, 51811, 51812, 51817, 51818, 51820, 51822, 51828, 51829, 51884, 51887, 51899, 51918, 51919, 51920, 51921, 51922, 51923, 52009, 52415, 52725, 52726, 53201, 53203, 53204, 53970, 53991, 54129, 54169, 54205, 54227, 54228, 54326, 54327, 54566, 54631, 54636, 54646, 54684, 54721, 54733, 54767, 56538, 56605, 56606, 56607, 79138, 79147, 79188, 79214, 79333, 79334, 79335, 79374, 80119, 81249, 81250, 81252, 81348, 81349, 81555, 81566, 81570, 84381, 84558, 84587, 84625, 84840, 85558, 85559, 85560, 85561, 86154, 86172, 86257, 86605, 86625, 86755, 86756, 87292, 87296, 87301, 88424, 88425, 88454, 88455, 88465, 88466, 88473, 88474, 89532, 0640, 0658, 1084, 1111, 2287, 2288, 2289, 2290, 2291, 110000, 110001, 110002, 110003, 110004, 110005, 110007, 110008, 110009, 110010, 110011, 110012, 110013, 110015, 110016, 110018, 110026, 111002, 111003, 113001, 140127, 140128, 140129, 140130, 140131, 140132, 150083, 150084, 150085, 150086, 150089, 150091, 150092, 150093, 150095, 150098, 150099, 150100, 150135, 150139, 150722, 150741, 150772, 150791, 150822, 150841, 156950, 197229, 400083, 400084, 400103, 400107, 400126, 400127, 400128, 400129, 400130, 400131, 400132, 400133, 400134, 400135, 400136, 400160, 400161, 400163, 400166, 400168, 400169, 400306, 400374, 400457, 400463, 400465, 400467, 400468, 400492, 400576, 400580, 883174, 883176, 883178, 883180, 883186, 883189, 883192, 883194, 883198, 883584, 883586, 884566, 884580, 884582, 884586, 884588, 884669, 884690, 884692, 884696, 884699, 884704, 884706, 884708, 884775, 884777, 884779, 884797, 884800, 884803, 55538, 55546, 55642, 56467, 64869, 66377, 66881, 71923, 71926, 71928, 1004514, 1004516, 1004518, 1004520, 1007855, 1007861, 1007875, 1007877, 1007879, 1007887, 1007889, 1027747, 1027753, 1027756, 1027765, 1027769, 1060700, 1060707, 1068040, 1068041, 1068257, 1068505, 1068610, 1068611, 1068612, 1068613, 1068615, 1068616, 1070113, 1071023, 1074011, 1074013, 1173112, 1176446, 1176450, 1176451, 1176452, 1176490, 1177468, 1177470, 1177471, 1177483, 1177484, 1177485, 1177486, 1177487, 1177489, 1177490, 1177492, 1177493, 1177494, 1177495, 1177496, 1177497, 1177498, 1177499, 1177501, 1177936, 1177978, 1177979, 1177980, 1177981, 1178892, 1178893, 1178894, 1179142, 1181941, 1181943, 1182162, 1182163, 1182164, 1182165, 1182594, 1182601, 1183500, 1184050, 1242569, 1242570, 1242571, 1242572, 1242573, 1243012, 1245471, 1245606, 1245610, 1245611, 1245615, 1245616, 1245617, 1245620, 1245623, 1245624, 1245625, 1245626, 1245627, 1245628, 1245629, 1245630, 1245631, 1245632, 1245633, 1245634, 1245635, 1245636, 1245637, 1245638, 1245639, 1245640, 1245641, 1245642, 1245643, 1245644, 1245645, 1245646, 1245647, 1245648, 1245649, 1245650, 1245651, 1245654, 1245655, 1245656, 1245657, 1245658, 1245659, 1245660, 1245661, 1245662, 1245663, 1245664, 1245665, 1245666, 1245667, 1245668, 1245704, 1245705, 1245706, 1245707, 1245708, 1245709, 1245711, 1245712, 1245713, 1245714, 1245715, 1245716, 1245717, 1245718, 1245720, 1245721, 1245722, 1245723, 1245724, 1245725, 1245726, 1245727, 1245728, 1245729, 1245730, 1245731, 1245732, 1245733, 1245734, 1245735, 1245736, 1245743, 1245744, 1245745, 1245746, 1245748, 1245749, 1245750, 1245751, 1245752, 1245753, 1245754, 1245755, 1245756, 1245757, 1245758, 1245761, 1245762, 1245767, 1245768, 1245769, 1246076, 1246198, 1246199, 1246200, 1246429, 1246430, 1246432, 1246434, 1246435, 1246436, 1246437, 1246438, 1246439, 1246440, 1246441, 1246442, 1246468, 1246469, 1246471, 1246472, 1246473, 1246499, 1246501, 1246502, 1246503, 1246505, 1246508, 1246509, 1246510, 1246512, 1246524, 1246526, 1246527, 1246528, 1246530, 1246533, 1246534, 1246535, 1246537, 1246549, 1246551, 1246552, 1246553, 1246555, 1246558, 1246559, 1246560, 1246562, 1246656, 1246670, 1246671, 1246672, 1246673, 1246674, 1246675, 1246676, 1246677, 1246678, 1246679, 1246680, 1246681, 1246682, 1246683, 1246684, 1246685, 1246686, 1246687, 1246688, 1246689, 1246690, 1246708, 1246709, 1246710, 1246720, 1246721, 1246722, 1246732, 1246733, 1246734, 1246789, 1246790, 1246791, 1246792, 1246793, 1246794, 1246795, 1246796, 1246797, 1246798, 1246799, 1246800, 1246801, 1246802, 1246803, 1246804, 1246805, 1246806, 1246807, 1246808, 1246809, 1247034, 1247035, 1247036, 1247047, 1247048, 1247055, 1247056, 1247064, 2530409, 2530410, 2530411, 2530412, 2530413, 2530414, 2530417);
UPDATE `creature` SET `equipment_id`=1715 WHERE `guid` IN (27660, 38004, 44187, 8969, 8971);
UPDATE `creature` SET `equipment_id`=0 WHERE `equipment_id` IN (12051, 12127, 16194, 16215, 16216, 16255, 16285, 16359, 16384, 16395);
UPDATE `creature` SET `equipment_id`=0 WHERE `id` IN (12779, 8893, 8890, 14281, 9098, 9258, 9201);
UPDATE `game_event_creature_data` SET `equipment_id`=50001 WHERE `equipment_id`=504;
INSERT INTO `game_event_creature_data` (`guid`, `entry_id`, `modelid`, `equipment_id`, `spell_start`, `spell_end`, `event`) VALUES (6177, 0, 0, 381, 0, 0, 27);

-- Assign patch to these creatures to fix startup errors.
UPDATE `creature_equip_template` SET `patch`=9 WHERE `entry`=15953;
UPDATE `creature_equip_template` SET `patch`=9 WHERE `entry`=16165;
UPDATE `creature_template` SET `patch`=9 WHERE `entry`=16165;
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `entry`=16165;

-- These creatures should not have any equipment.
DELETE FROM `creature_equip_template` WHERE `entry` IN (167, 222, 238, 372, 734, 773, 786, 1019, 1077, 1134, 1149, 1244, 1385, 1399, 1445, 1447, 1460, 1470, 1474, 1484, 1560, 1682, 1684, 1892, 1893, 2057, 2096, 2211, 2785, 2805, 2846, 2849, 2952, 2953, 2981, 3104, 3181, 3239, 3359, 3365, 3444, 3468, 3662, 3692, 3693, 3836, 3945, 3969, 3970, 4054, 4159, 4161, 4175, 4193, 4225, 4228, 4229, 4236, 4242, 4455, 4550, 4616, 4962, 5125, 5150, 5155, 5156, 5224, 5317, 5327, 5421, 5523, 5598, 5674, 5909, 6010, 6033, 6731, 6738, 6807, 7048, 7778, 7884, 7978, 8161, 8196, 8308, 8359, 8360, 8416, 9776, 9777, 9778, 9779, 9984, 10046, 10060, 10090, 10262, 10377, 10600, 10739, 10805, 11051, 11753, 11754, 11755, 11757, 11829, 11871, 12496, 14490, 14729, 14882, 14908, 16060);
UPDATE`creature_template` SET `equipment_id`=0 WHERE `entry` IN (167, 222, 238, 372, 734, 773, 786, 1019, 1077, 1134, 1149, 1244, 1385, 1399, 1445, 1447, 1460, 1470, 1474, 1484, 1560, 1682, 1684, 1892, 1893, 2057, 2096, 2211, 2785, 2805, 2846, 2849, 2952, 2953, 2981, 3104, 3181, 3239, 3359, 3365, 3444, 3468, 3662, 3692, 3693, 3836, 3945, 3969, 3970, 4054, 4159, 4161, 4175, 4193, 4225, 4228, 4229, 4236, 4242, 4455, 4550, 4616, 4962, 5125, 5150, 5155, 5156, 5224, 5317, 5327, 5421, 5523, 5598, 5674, 5909, 6010, 6033, 6731, 6738, 6807, 7048, 7778, 7884, 7978, 8161, 8196, 8308, 8359, 8360, 8416, 9776, 9777, 9778, 9779, 9984, 10046, 10060, 10090, 10262, 10377, 10600, 10739, 10805, 11051, 11753, 11754, 11755, 11757, 11829, 11871, 12496, 14490, 14729, 14882, 14908, 16060);

-- Remove depracated table.
DROP TABLE `creature_equip_template_raw`;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
