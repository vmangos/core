DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180723014300');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180723014300');
-- Add your query below.


UPDATE `creature_template` SET `modelid_2`=5036 WHERE `entry`=38;

UPDATE `creature_template` SET `modelid_2`=5446 WHERE `entry`=68;

UPDATE `creature_template` SET `modelid_2`=2362 WHERE `entry`=94;

UPDATE `creature_template` SET `modelid_2`=4419 WHERE `entry`=95;

UPDATE `creature_template` SET `modelid_2`=2358 WHERE `entry`=116;

UPDATE `creature_template` SET `modelid_2`=2337 WHERE `entry`=121;

UPDATE `creature_template` SET `modelid_2`=2343 WHERE `entry`=122;

UPDATE `creature_template` SET `modelid_2`=4278 WHERE `entry`=215;

UPDATE `creature_template` SET `modelid_2`=4277 WHERE `entry`=218;

UPDATE `creature_template` SET `modelid_1`=2299 WHERE `entry`=257;

UPDATE `creature_template` SET `modelid_2`=2345 WHERE `entry`=449;

UPDATE `creature_template` SET `modelid_2`=4421 WHERE `entry`=450;

UPDATE `creature_template` SET `modelid_2`=2360 WHERE `entry`=474;

UPDATE `creature_template` SET `modelid_2`=2335 WHERE `entry`=481;

UPDATE `creature_template` SET `modelid_2`=2332 WHERE `entry`=504;

UPDATE `creature_template` SET `modelid_2`=2339 WHERE `entry`=589;

UPDATE `creature_template` SET `modelid_2`=2341 WHERE `entry`=590;

UPDATE `creature_template` SET `modelid_2`=2324 WHERE `entry`=594;

UPDATE `creature_template` SET `modelid_2`=2444 WHERE `entry`=598;

UPDATE `creature_template` SET `modelid_2`=2330 WHERE `entry`=619;

UPDATE `creature_template` SET `modelid_2`=2317 WHERE `entry`=634;

UPDATE `creature_template` SET `modelid_2`=2315 WHERE `entry`=636;

UPDATE `creature_template` SET `modelid_1`=589 WHERE `entry`=659;

UPDATE `creature_template` SET `modelid_1`=11568 WHERE `entry`=723;

UPDATE `creature_template` SET `modelid_2`=1608 WHERE `entry`=727;

UPDATE `creature_template` SET `modelid_2`=556 WHERE `entry`=824;

UPDATE `creature_template` SET `modelid_2`=1608 WHERE `entry`=853;

UPDATE `creature_template` SET `modelid_2`=4498 WHERE `entry`=861;

UPDATE `creature_template` SET `modelid_2`=4496 WHERE `entry`=862;

UPDATE `creature_template` SET `modelid_2`=4500 WHERE `entry`=863;

UPDATE `creature_template` SET `modelid_2`=4501 WHERE `entry`=864;

UPDATE `creature_template` SET `modelid_2`=4503 WHERE `entry`=866;

UPDATE `creature_template` SET `modelid_2`=4280 WHERE `entry`=909;

UPDATE `creature_template` SET `modelid_2`=4282 WHERE `entry`=910;

UPDATE `creature_template` SET `modelid_2`=4369 WHERE `entry`=1064;

UPDATE `creature_template` SET `modelid_1`=3494 WHERE `entry`=1160;

UPDATE `creature_template` SET `modelid_2`=6922 WHERE `entry`=1211;

UPDATE `creature_template` SET `modelid_3`=6923 WHERE `entry`=1211;

UPDATE `creature_template` SET `modelid_4`=6924 WHERE `entry`=1211;

UPDATE `creature_template` SET `modelid_2`=3258 WHERE `entry`=1423;

UPDATE `creature_template` SET `modelid_3`=2678 WHERE `entry`=1434;

UPDATE `creature_template` SET `modelid_4`=2679 WHERE `entry`=1434;

UPDATE `creature_template` SET `modelid_2`=2407 WHERE `entry`=1506;

UPDATE `creature_template` SET `modelid_2`=2467 WHERE `entry`=1507;

UPDATE `creature_template` SET `modelid_2`=1196 WHERE `entry`=1530;

UPDATE `creature_template` SET `modelid_3`=10256 WHERE `entry`=1530;

UPDATE `creature_template` SET `modelid_4`=10255 WHERE `entry`=1530;

UPDATE `creature_template` SET `modelid_2`=3227 WHERE `entry`=1532;

UPDATE `creature_template` SET `modelid_2`=2482 WHERE `entry`=1535;

UPDATE `creature_template` SET `modelid_2`=2479 WHERE `entry`=1536;

UPDATE `creature_template` SET `modelid_2`=2472 WHERE `entry`=1537;

UPDATE `creature_template` SET `modelid_2`=2477 WHERE `entry`=1538;

UPDATE `creature_template` SET `modelid_2`=2469 WHERE `entry`=1539;

UPDATE `creature_template` SET `modelid_2`=2470 WHERE `entry`=1540;

UPDATE `creature_template` SET `modelid_2`=2562 WHERE `entry`=1562;

UPDATE `creature_template` SET `modelid_2`=794 WHERE `entry`=1563;

UPDATE `creature_template` SET `modelid_2`=4462 WHERE `entry`=1564;

UPDATE `creature_template` SET `modelid_2`=1768 WHERE `entry`=1565;

UPDATE `creature_template` SET `modelid_2`=3257 WHERE `entry`=1642;

UPDATE `creature_template` SET `modelid_2`=2564 WHERE `entry`=1653;

UPDATE `creature_template` SET `modelid_2`=3145 WHERE `entry`=1660;

UPDATE `creature_template` SET `modelid_2`=2322 WHERE `entry`=1726;

UPDATE `creature_template` SET `modelid_2`=2528 WHERE `entry`=1727;

UPDATE `creature_template` SET `modelid_2`=2319 WHERE `entry`=1729;

UPDATE `creature_template` SET `modelid_2`=2350 WHERE `entry`=1732;

UPDATE `creature_template` SET `modelid_3`=10288 WHERE `entry`=1826;

UPDATE `creature_template` SET `modelid_4`=10289 WHERE `entry`=1826;

UPDATE `creature_template` SET `modelid_3`=10351 WHERE `entry`=1827;

UPDATE `creature_template` SET `modelid_4`=10353 WHERE `entry`=1827;

UPDATE `creature_template` SET `modelid_3`=10279 WHERE `entry`=1831;

UPDATE `creature_template` SET `modelid_4`=10281 WHERE `entry`=1831;

UPDATE `creature_template` SET `modelid_3`=10330 WHERE `entry`=1832;

UPDATE `creature_template` SET `modelid_4`=10331 WHERE `entry`=1832;

UPDATE `creature_template` SET `modelid_3`=10292 WHERE `entry`=1833;

UPDATE `creature_template` SET `modelid_4`=10294 WHERE `entry`=1833;

UPDATE `creature_template` SET `modelid_3`=10326 WHERE `entry`=1834;

UPDATE `creature_template` SET `modelid_4`=10327 WHERE `entry`=1834;

UPDATE `creature_template` SET `modelid_3`=10322 WHERE `entry`=1835;

UPDATE `creature_template` SET `modelid_4`=10323 WHERE `entry`=1835;

UPDATE `creature_template` SET `modelid_2`=10337 WHERE `entry`=1836;

UPDATE `creature_template` SET `modelid_2`=3768 WHERE `entry`=1867;

UPDATE `creature_template` SET `modelid_3`=10305 WHERE `entry`=1883;

UPDATE `creature_template` SET `modelid_4`=10306 WHERE `entry`=1883;

UPDATE `creature_template` SET `modelid_3`=10300 WHERE `entry`=1884;

UPDATE `creature_template` SET `modelid_4`=10302 WHERE `entry`=1884;

UPDATE `creature_template` SET `modelid_2`=10346 WHERE `entry`=1885;

UPDATE `creature_template` SET `modelid_3`=10347 WHERE `entry`=1885;

UPDATE `creature_template` SET `modelid_4`=10348 WHERE `entry`=1885;

UPDATE `creature_template` SET `modelid_3`=3567 WHERE `entry`=1888;

UPDATE `creature_template` SET `modelid_4`=3569 WHERE `entry`=1888;

UPDATE `creature_template` SET `modelid_3`=3586 WHERE `entry`=1889;

UPDATE `creature_template` SET `modelid_4`=3588 WHERE `entry`=1889;

UPDATE `creature_template` SET `modelid_2`=3603 WHERE `entry`=1912;

UPDATE `creature_template` SET `modelid_2`=3593 WHERE `entry`=1913;

UPDATE `creature_template` SET `modelid_3`=3560 WHERE `entry`=1914;

UPDATE `creature_template` SET `modelid_4`=3562 WHERE `entry`=1914;

UPDATE `creature_template` SET `modelid_3`=3582 WHERE `entry`=1915;

UPDATE `creature_template` SET `modelid_4`=3584 WHERE `entry`=1915;

UPDATE `creature_template` SET `modelid_2`=5016 WHERE `entry`=1949;

UPDATE `creature_template` SET `modelid_3`=5017 WHERE `entry`=1949;

UPDATE `creature_template` SET `modelid_4`=5018 WHERE `entry`=1949;

UPDATE `creature_template` SET `modelid_3`=10001 WHERE `entry`=2098;

UPDATE `creature_template` SET `modelid_4`=10003 WHERE `entry`=2098;

UPDATE `creature_template` SET `modelid_2`=11424 WHERE `entry`=2211;

UPDATE `creature_template` SET `modelid_3`=11425 WHERE `entry`=2211;

UPDATE `creature_template` SET `modelid_4`=11427 WHERE `entry`=2211;

UPDATE `creature_template` SET `modelid_2`=3707 WHERE `entry`=2240;

UPDATE `creature_template` SET `modelid_2`=3710 WHERE `entry`=2241;

UPDATE `creature_template` SET `modelid_2`=3717 WHERE `entry`=2242;

UPDATE `creature_template` SET `modelid_2`=3722 WHERE `entry`=2243;

UPDATE `creature_template` SET `modelid_2`=3622 WHERE `entry`=2244;

UPDATE `creature_template` SET `modelid_2`=3726 WHERE `entry`=2245;

UPDATE `creature_template` SET `modelid_2`=3728 WHERE `entry`=2246;

UPDATE `creature_template` SET `modelid_2`=3730 WHERE `entry`=2247;

UPDATE `creature_template` SET `modelid_2`=3618 WHERE `entry`=2260;

UPDATE `creature_template` SET `modelid_2`=3624 WHERE `entry`=2261;

UPDATE `creature_template` SET `modelid_2`=3611 WHERE `entry`=2264;

UPDATE `creature_template` SET `modelid_2`=11036 WHERE `entry`=2267;

UPDATE `creature_template` SET `modelid_3`=5784 WHERE `entry`=2270;

UPDATE `creature_template` SET `modelid_4`=5786 WHERE `entry`=2270;

UPDATE `creature_template` SET `modelid_2`=11474 WHERE `entry`=2271;

UPDATE `creature_template` SET `modelid_2`=3715 WHERE `entry`=2272;

UPDATE `creature_template` SET `modelid_2`=3724 WHERE `entry`=2318;

UPDATE `creature_template` SET `modelid_2`=3713 WHERE `entry`=2319;

UPDATE `creature_template` SET `modelid_1`=11686 WHERE `entry`=2334;

UPDATE `creature_template` SET `modelid_2`=4411 WHERE `entry`=2336;

UPDATE `creature_template` SET `modelid_2`=4412 WHERE `entry`=2337;

UPDATE `creature_template` SET `modelid_2`=2874 WHERE `entry`=2338;

UPDATE `creature_template` SET `modelid_3`=2870 WHERE `entry`=2339;

UPDATE `creature_template` SET `modelid_4`=2872 WHERE `entry`=2339;

UPDATE `creature_template` SET `modelid_2`=3764 WHERE `entry`=2344;

UPDATE `creature_template` SET `modelid_2`=3762 WHERE `entry`=2345;

UPDATE `creature_template` SET `modelid_2`=3766 WHERE `entry`=2346;

UPDATE `creature_template` SET `modelid_2`=3719 WHERE `entry`=2358;

UPDATE `creature_template` SET `modelid_2`=3708 WHERE `entry`=2386;

UPDATE `creature_template` SET `modelid_2`=3663 WHERE `entry`=2405;

UPDATE `creature_template` SET `modelid_2`=3627 WHERE `entry`=2434;

UPDATE `creature_template` SET `modelid_2`=3990 WHERE `entry`=2552;

UPDATE `creature_template` SET `modelid_2`=3994 WHERE `entry`=2553;

UPDATE `creature_template` SET `modelid_2`=3992 WHERE `entry`=2554;

UPDATE `creature_template` SET `modelid_2`=3996 WHERE `entry`=2555;

UPDATE `creature_template` SET `modelid_2`=3998 WHERE `entry`=2556;

UPDATE `creature_template` SET `modelid_2`=4002 WHERE `entry`=2558;

UPDATE `creature_template` SET `modelid_2`=3961 WHERE `entry`=2581;

UPDATE `creature_template` SET `modelid_2`=3959 WHERE `entry`=2582;

UPDATE `creature_template` SET `modelid_2`=4140 WHERE `entry`=2583;

UPDATE `creature_template` SET `modelid_2`=4138 WHERE `entry`=2584;

UPDATE `creature_template` SET `modelid_2`=4144 WHERE `entry`=2585;

UPDATE `creature_template` SET `modelid_2`=3983 WHERE `entry`=2587;

UPDATE `creature_template` SET `modelid_2`=4016 WHERE `entry`=2588;

UPDATE `creature_template` SET `modelid_2`=3988 WHERE `entry`=2589;

UPDATE `creature_template` SET `modelid_2`=4015 WHERE `entry`=2590;

UPDATE `creature_template` SET `modelid_2`=4019 WHERE `entry`=2591;

UPDATE `creature_template` SET `modelid_2`=4035 WHERE `entry`=2621;

UPDATE `creature_template` SET `modelid_2`=4023 WHERE `entry`=2636;

UPDATE `creature_template` SET `modelid_2`=6492 WHERE `entry`=2639;

UPDATE `creature_template` SET `modelid_2`=6543 WHERE `entry`=2640;

UPDATE `creature_template` SET `modelid_2`=6498 WHERE `entry`=2641;

UPDATE `creature_template` SET `modelid_2`=6515 WHERE `entry`=2642;

UPDATE `creature_template` SET `modelid_2`=6494 WHERE `entry`=2643;

UPDATE `creature_template` SET `modelid_2`=6511 WHERE `entry`=2644;

UPDATE `creature_template` SET `modelid_2`=6539 WHERE `entry`=2645;

UPDATE `creature_template` SET `modelid_2`=6496 WHERE `entry`=2646;

UPDATE `creature_template` SET `modelid_2`=6541 WHERE `entry`=2647;

UPDATE `creature_template` SET `modelid_3`=6998 WHERE `entry`=2648;

UPDATE `creature_template` SET `modelid_4`=10663 WHERE `entry`=2648;

UPDATE `creature_template` SET `modelid_2`=6481 WHERE `entry`=2649;

UPDATE `creature_template` SET `modelid_2`=6482 WHERE `entry`=2650;

UPDATE `creature_template` SET `modelid_2`=6484 WHERE `entry`=2651;

UPDATE `creature_template` SET `modelid_2`=6486 WHERE `entry`=2652;

UPDATE `creature_template` SET `modelid_2`=6490 WHERE `entry`=2653;

UPDATE `creature_template` SET `modelid_2`=6488 WHERE `entry`=2654;

UPDATE `creature_template` SET `modelid_2`=4038 WHERE `entry`=2721;

UPDATE `creature_template` SET `modelid_3`=2958 WHERE `entry`=2914;

UPDATE `creature_template` SET `modelid_4`=6303 WHERE `entry`=2914;

UPDATE `creature_template` SET `modelid_2`=1454 WHERE `entry`=2972;

UPDATE `creature_template` SET `modelid_3`=3901 WHERE `entry`=2975;

UPDATE `creature_template` SET `modelid_4`=3902 WHERE `entry`=2975;

UPDATE `creature_template` SET `modelid_3`=355 WHERE `entry`=2976;

UPDATE `creature_template` SET `modelid_4`=3903 WHERE `entry`=2976;

UPDATE `creature_template` SET `modelid_3`=355 WHERE `entry`=2977;

UPDATE `creature_template` SET `modelid_4`=3908 WHERE `entry`=2977;

UPDATE `creature_template` SET `modelid_3`=1122 WHERE `entry`=2978;

UPDATE `creature_template` SET `modelid_4`=3909 WHERE `entry`=2978;

UPDATE `creature_template` SET `modelid_3`=3904 WHERE `entry`=2979;

UPDATE `creature_template` SET `modelid_4`=3906 WHERE `entry`=2979;

UPDATE `creature_template` SET `modelid_2`=3786 WHERE `entry`=2989;

UPDATE `creature_template` SET `modelid_2`=3788 WHERE `entry`=2990;

UPDATE `creature_template` SET `modelid_3`=8572 WHERE `entry`=3084;

UPDATE `creature_template` SET `modelid_4`=9392 WHERE `entry`=3084;

UPDATE `creature_template` SET `modelid_2`=3735 WHERE `entry`=3128;

UPDATE `creature_template` SET `modelid_2`=1860 WHERE `entry`=3129;

UPDATE `creature_template` SET `modelid_2`=1533 WHERE `entry`=3131;

UPDATE `creature_template` SET `modelid_3`=1958 WHERE `entry`=3131;

UPDATE `creature_template` SET `modelid_2`=4188 WHERE `entry`=3195;

UPDATE `creature_template` SET `modelid_2`=4186 WHERE `entry`=3196;

UPDATE `creature_template` SET `modelid_2`=4192 WHERE `entry`=3197;

UPDATE `creature_template` SET `modelid_2`=4191 WHERE `entry`=3198;

UPDATE `creature_template` SET `modelid_2`=4195 WHERE `entry`=3199;

UPDATE `creature_template` SET `modelid_2`=4077 WHERE `entry`=3206;

UPDATE `creature_template` SET `modelid_2`=4079 WHERE `entry`=3207;

UPDATE `creature_template` SET `modelid_3`=3912 WHERE `entry`=3282;

UPDATE `creature_template` SET `modelid_3`=3910 WHERE `entry`=3283;

UPDATE `creature_template` SET `modelid_4`=3911 WHERE `entry`=3283;

UPDATE `creature_template` SET `modelid_3`=355 WHERE `entry`=3284;

UPDATE `creature_template` SET `modelid_4`=3919 WHERE `entry`=3284;

UPDATE `creature_template` SET `modelid_3`=1122 WHERE `entry`=3285;

UPDATE `creature_template` SET `modelid_4`=3917 WHERE `entry`=3285;

UPDATE `creature_template` SET `modelid_3`=3913 WHERE `entry`=3286;

UPDATE `creature_template` SET `modelid_3`=4259 WHERE `entry`=3296;

UPDATE `creature_template` SET `modelid_4`=4260 WHERE `entry`=3296;

UPDATE `creature_template` SET `modelid_2`=4083 WHERE `entry`=3297;

UPDATE `creature_template` SET `modelid_3`=1986 WHERE `entry`=3300;

UPDATE `creature_template` SET `modelid_2`=1969 WHERE `entry`=3374;

UPDATE `creature_template` SET `modelid_2`=3840 WHERE `entry`=3376;

UPDATE `creature_template` SET `modelid_2`=3838 WHERE `entry`=3377;

UPDATE `creature_template` SET `modelid_2`=3871 WHERE `entry`=3378;

UPDATE `creature_template` SET `modelid_2`=4199 WHERE `entry`=3379;

UPDATE `creature_template` SET `modelid_2`=4197 WHERE `entry`=3380;

UPDATE `creature_template` SET `modelid_3`=3830 WHERE `entry`=3381;

UPDATE `creature_template` SET `modelid_4`=4639 WHERE `entry`=3381;

UPDATE `creature_template` SET `modelid_3`=3828 WHERE `entry`=3382;

UPDATE `creature_template` SET `modelid_3`=3836 WHERE `entry`=3383;

UPDATE `creature_template` SET `modelid_4`=4640 WHERE `entry`=3383;

UPDATE `creature_template` SET `modelid_2`=3834 WHERE `entry`=3384;

UPDATE `creature_template` SET `modelid_2`=1857 WHERE `entry`=3386;

UPDATE `creature_template` SET `modelid_3`=4262 WHERE `entry`=3501;

UPDATE `creature_template` SET `modelid_4`=4264 WHERE `entry`=3501;

UPDATE `creature_template` SET `modelid_3`=7060 WHERE `entry`=3502;

UPDATE `creature_template` SET `modelid_3`=4850 WHERE `entry`=3571;

UPDATE `creature_template` SET `modelid_4`=4852 WHERE `entry`=3571;

UPDATE `creature_template` SET `modelid_3`=4218 WHERE `entry`=3725;

UPDATE `creature_template` SET `modelid_2`=5577 WHERE `entry`=3727;

UPDATE `creature_template` SET `modelid_3`=4226 WHERE `entry`=3727;

UPDATE `creature_template` SET `modelid_2`=4221 WHERE `entry`=3728;

UPDATE `creature_template` SET `modelid_3`=825 WHERE `entry`=3728;

UPDATE `creature_template` SET `modelid_2`=4223 WHERE `entry`=3730;

UPDATE `creature_template` SET `modelid_3`=4224 WHERE `entry`=3730;

UPDATE `creature_template` SET `modelid_2`=4128 WHERE `entry`=3732;

UPDATE `creature_template` SET `modelid_2`=4130 WHERE `entry`=3733;

UPDATE `creature_template` SET `modelid_2`=4132 WHERE `entry`=3734;

UPDATE `creature_template` SET `modelid_2`=4254 WHERE `entry`=3797;

UPDATE `creature_template` SET `modelid_2`=4134 WHERE `entry`=3804;

UPDATE `creature_template` SET `modelid_2`=4152 WHERE `entry`=3806;

UPDATE `creature_template` SET `modelid_2`=4154 WHERE `entry`=3807;

UPDATE `creature_template` SET `modelid_2`=4136 WHERE `entry`=3808;

UPDATE `creature_template` SET `modelid_2`=4211 WHERE `entry`=3840;

UPDATE `creature_template` SET `modelid_3`=4232 WHERE `entry`=3840;

UPDATE `creature_template` SET `modelid_4`=4234 WHERE `entry`=3840;

UPDATE `creature_template` SET `modelid_2`=3230 WHERE `entry`=3875;

UPDATE `creature_template` SET `modelid_2`=4228 WHERE `entry`=3879;

UPDATE `creature_template` SET `modelid_3`=4229 WHERE `entry`=3879;

UPDATE `creature_template` SET `modelid_2`=4158 WHERE `entry`=3893;

UPDATE `creature_template` SET `modelid_3`=3935 WHERE `entry`=3988;

UPDATE `creature_template` SET `modelid_4`=4100 WHERE `entry`=3988;

UPDATE `creature_template` SET `modelid_3`=3924 WHERE `entry`=3991;

UPDATE `creature_template` SET `modelid_4`=3925 WHERE `entry`=3991;

UPDATE `creature_template` SET `modelid_3`=3930 WHERE `entry`=3992;

UPDATE `creature_template` SET `modelid_4`=3934 WHERE `entry`=3992;

UPDATE `creature_template` SET `modelid_3`=3929 WHERE `entry`=3993;

UPDATE `creature_template` SET `modelid_4`=3933 WHERE `entry`=3993;

UPDATE `creature_template` SET `modelid_2`=4248 WHERE `entry`=4051;

UPDATE `creature_template` SET `modelid_3`=3922 WHERE `entry`=4070;

UPDATE `creature_template` SET `modelid_4`=3923 WHERE `entry`=4070;

UPDATE `creature_template` SET `modelid_3`=14613 WHERE `entry`=4262;

UPDATE `creature_template` SET `modelid_4`=14615 WHERE `entry`=4262;

UPDATE `creature_template` SET `modelid_2`=2464 WHERE `entry`=4280;

UPDATE `creature_template` SET `modelid_2`=2517 WHERE `entry`=4281;

UPDATE `creature_template` SET `modelid_2`=2513 WHERE `entry`=4282;

UPDATE `creature_template` SET `modelid_2`=2521 WHERE `entry`=4283;

UPDATE `creature_template` SET `modelid_2`=2496 WHERE `entry`=4284;

UPDATE `creature_template` SET `modelid_2`=2506 WHERE `entry`=4285;

UPDATE `creature_template` SET `modelid_2`=2523 WHERE `entry`=4286;

UPDATE `creature_template` SET `modelid_2`=2474 WHERE `entry`=4287;

UPDATE `creature_template` SET `modelid_2`=2498 WHERE `entry`=4288;

UPDATE `creature_template` SET `modelid_2`=2510 WHERE `entry`=4289;

UPDATE `creature_template` SET `modelid_2`=2507 WHERE `entry`=4291;

UPDATE `creature_template` SET `modelid_2`=2476 WHERE `entry`=4292;

UPDATE `creature_template` SET `modelid_2`=2518 WHERE `entry`=4293;

UPDATE `creature_template` SET `modelid_2`=2514 WHERE `entry`=4295;

UPDATE `creature_template` SET `modelid_2`=5726 WHERE `entry`=4296;

UPDATE `creature_template` SET `modelid_2`=2503 WHERE `entry`=4297;

UPDATE `creature_template` SET `modelid_2`=2473 WHERE `entry`=4298;

UPDATE `creature_template` SET `modelid_2`=2501 WHERE `entry`=4299;

UPDATE `creature_template` SET `modelid_2`=2525 WHERE `entry`=4300;

UPDATE `creature_template` SET `modelid_2`=2500 WHERE `entry`=4301;

UPDATE `creature_template` SET `modelid_2`=2461 WHERE `entry`=4302;

UPDATE `creature_template` SET `modelid_2`=2608 WHERE `entry`=4306;

UPDATE `creature_template` SET `modelid_2`=2438 WHERE `entry`=4416;

UPDATE `creature_template` SET `modelid_2`=2443 WHERE `entry`=4417;

UPDATE `creature_template` SET `modelid_2`=2448 WHERE `entry`=4418;

UPDATE `creature_template` SET `modelid_3`=7193 WHERE `entry`=4429;

UPDATE `creature_template` SET `modelid_3`=5436 WHERE `entry`=4430;

UPDATE `creature_template` SET `modelid_2`=6509 WHERE `entry`=4465;

UPDATE `creature_template` SET `modelid_2`=6513 WHERE `entry`=4466;

UPDATE `creature_template` SET `modelid_2`=6536 WHERE `entry`=4467;

UPDATE `creature_template` SET `modelid_2`=10971 WHERE `entry`=4475;

UPDATE `creature_template` SET `modelid_2`=10298 WHERE `entry`=4493;

UPDATE `creature_template` SET `modelid_3`=10308 WHERE `entry`=4494;

UPDATE `creature_template` SET `modelid_4`=10310 WHERE `entry`=4494;

UPDATE `creature_template` SET `modelid_2`=2558 WHERE `entry`=4505;

UPDATE `creature_template` SET `modelid_2`=2603 WHERE `entry`=4540;

UPDATE `creature_template` SET `modelid_2`=7103 WHERE `entry`=4624;

UPDATE `creature_template` SET `modelid_3`=7104 WHERE `entry`=4624;

UPDATE `creature_template` SET `modelid_3`=4700 WHERE `entry`=4663;

UPDATE `creature_template` SET `modelid_4`=11300 WHERE `entry`=4663;

UPDATE `creature_template` SET `modelid_3`=4704 WHERE `entry`=4664;

UPDATE `creature_template` SET `modelid_4`=11306 WHERE `entry`=4664;

UPDATE `creature_template` SET `modelid_3`=4702 WHERE `entry`=4666;

UPDATE `creature_template` SET `modelid_4`=11302 WHERE `entry`=4666;

UPDATE `creature_template` SET `modelid_3`=4706 WHERE `entry`=4667;

UPDATE `creature_template` SET `modelid_4`=11308 WHERE `entry`=4667;

UPDATE `creature_template` SET `modelid_3`=4710 WHERE `entry`=4668;

UPDATE `creature_template` SET `modelid_4`=11310 WHERE `entry`=4668;

UPDATE `creature_template` SET `modelid_3`=1232 WHERE `entry`=4700;

UPDATE `creature_template` SET `modelid_3`=1241 WHERE `entry`=4701;

UPDATE `creature_template` SET `modelid_3`=2768 WHERE `entry`=4702;

UPDATE `creature_template` SET `modelid_3`=4708 WHERE `entry`=4705;

UPDATE `creature_template` SET `modelid_4`=11304 WHERE `entry`=4705;

UPDATE `creature_template` SET `modelid_2`=2882 WHERE `entry`=4809;

UPDATE `creature_template` SET `modelid_3`=2883 WHERE `entry`=4809;

UPDATE `creature_template` SET `modelid_4`=2885 WHERE `entry`=4809;

UPDATE `creature_template` SET `modelid_2`=2898 WHERE `entry`=4810;

UPDATE `creature_template` SET `modelid_3`=2899 WHERE `entry`=4810;

UPDATE `creature_template` SET `modelid_4`=2900 WHERE `entry`=4810;

UPDATE `creature_template` SET `modelid_2`=2886 WHERE `entry`=4811;

UPDATE `creature_template` SET `modelid_3`=2887 WHERE `entry`=4811;

UPDATE `creature_template` SET `modelid_4`=2889 WHERE `entry`=4811;

UPDATE `creature_template` SET `modelid_2`=2895 WHERE `entry`=4812;

UPDATE `creature_template` SET `modelid_3`=2896 WHERE `entry`=4812;

UPDATE `creature_template` SET `modelid_4`=2897 WHERE `entry`=4812;

UPDATE `creature_template` SET `modelid_2`=2876 WHERE `entry`=4813;

UPDATE `creature_template` SET `modelid_2`=2890 WHERE `entry`=4814;

UPDATE `creature_template` SET `modelid_3`=2891 WHERE `entry`=4814;

UPDATE `creature_template` SET `modelid_4`=2893 WHERE `entry`=4814;

UPDATE `creature_template` SET `modelid_2`=4675 WHERE `entry`=4834;

UPDATE `creature_template` SET `modelid_2`=4840 WHERE `entry`=4947;

UPDATE `creature_template` SET `modelid_2`=4837 WHERE `entry`=4951;

UPDATE `creature_template` SET `modelid_2`=1986 WHERE `entry`=4953;

UPDATE `creature_template` SET `modelid_3`=1987 WHERE `entry`=4953;

UPDATE `creature_template` SET `modelid_4`=2954 WHERE `entry`=4953;

UPDATE `creature_template` SET `modelid_2`=3510 WHERE `entry`=4971;

UPDATE `creature_template` SET `modelid_2`=2978 WHERE `entry`=4979;

UPDATE `creature_template` SET `modelid_3`=2977 WHERE `entry`=4979;

UPDATE `creature_template` SET `modelid_4`=2979 WHERE `entry`=4979;

UPDATE `creature_template` SET `modelid_2`=2990 WHERE `entry`=4995;

UPDATE `creature_template` SET `modelid_3`=2991 WHERE `entry`=4995;

UPDATE `creature_template` SET `modelid_4`=2992 WHERE `entry`=4995;

UPDATE `creature_template` SET `modelid_2`=2986 WHERE `entry`=4996;

UPDATE `creature_template` SET `modelid_3`=2987 WHERE `entry`=4996;

UPDATE `creature_template` SET `modelid_4`=2988 WHERE `entry`=4996;

UPDATE `creature_template` SET `modelid_2`=2148 WHERE `entry`=5043;

UPDATE `creature_template` SET `modelid_3`=2145 WHERE `entry`=5043;

UPDATE `creature_template` SET `modelid_4`=2146 WHERE `entry`=5043;

UPDATE `creature_template` SET `modelid_2`=4672 WHERE `entry`=5044;

UPDATE `creature_template` SET `modelid_3`=4673 WHERE `entry`=5044;

UPDATE `creature_template` SET `modelid_4`=4674 WHERE `entry`=5044;

UPDATE `creature_template` SET `modelid_2`=2978 WHERE `entry`=5085;

UPDATE `creature_template` SET `modelid_3`=2979 WHERE `entry`=5085;

UPDATE `creature_template` SET `modelid_4`=2980 WHERE `entry`=5085;

UPDATE `creature_template` SET `modelid_2`=4677 WHERE `entry`=5184;

UPDATE `creature_template` SET `modelid_2`=2851 WHERE `entry`=5185;

UPDATE `creature_template` SET `modelid_3`=12197 WHERE `entry`=5185;

UPDATE `creature_template` SET `modelid_2`=12199 WHERE `entry`=5186;

UPDATE `creature_template` SET `modelid_3`=12200 WHERE `entry`=5186;

UPDATE `creature_template` SET `modelid_2`=7671 WHERE `entry`=5226;

UPDATE `creature_template` SET `modelid_3`=7672 WHERE `entry`=5226;

UPDATE `creature_template` SET `modelid_2`=4780 WHERE `entry`=5243;

UPDATE `creature_template` SET `modelid_2`=6671 WHERE `entry`=5259;

UPDATE `creature_template` SET `modelid_2`=6672 WHERE `entry`=5261;

UPDATE `creature_template` SET `modelid_2`=4770 WHERE `entry`=5263;

UPDATE `creature_template` SET `modelid_2`=4772 WHERE `entry`=5267;

UPDATE `creature_template` SET `modelid_2`=4776 WHERE `entry`=5269;

UPDATE `creature_template` SET `modelid_2`=6676 WHERE `entry`=5270;

UPDATE `creature_template` SET `modelid_2`=4774 WHERE `entry`=5271;

UPDATE `creature_template` SET `modelid_2`=6677 WHERE `entry`=5273;

UPDATE `creature_template` SET `modelid_2`=12202 WHERE `entry`=5434;

UPDATE `creature_template` SET `modelid_3`=12201 WHERE `entry`=5434;

UPDATE `creature_template` SET `modelid_2`=6270 WHERE `entry`=5523;

UPDATE `creature_template` SET `modelid_3`=6927 WHERE `entry`=5568;

UPDATE `creature_template` SET `modelid_4`=6929 WHERE `entry`=5568;

UPDATE `creature_template` SET `modelid_3`=3525 WHERE `entry`=5595;

UPDATE `creature_template` SET `modelid_4`=3527 WHERE `entry`=5595;

UPDATE `creature_template` SET `modelid_2`=5572 WHERE `entry`=5615;

UPDATE `creature_template` SET `modelid_2`=5533 WHERE `entry`=5616;

UPDATE `creature_template` SET `modelid_2`=5531 WHERE `entry`=5617;

UPDATE `creature_template` SET `modelid_2`=5569 WHERE `entry`=5618;

UPDATE `creature_template` SET `modelid_2`=5574 WHERE `entry`=5623;

UPDATE `creature_template` SET `modelid_2`=6414 WHERE `entry`=5645;

UPDATE `creature_template` SET `modelid_2`=6412 WHERE `entry`=5646;

UPDATE `creature_template` SET `modelid_2`=6416 WHERE `entry`=5647;

UPDATE `creature_template` SET `modelid_2`=6419 WHERE `entry`=5648;

UPDATE `creature_template` SET `modelid_2`=6424 WHERE `entry`=5649;

UPDATE `creature_template` SET `modelid_2`=6421 WHERE `entry`=5650;

UPDATE `creature_template` SET `modelid_2`=3973 WHERE `entry`=5680;

UPDATE `creature_template` SET `modelid_3`=3974 WHERE `entry`=5680;

UPDATE `creature_template` SET `modelid_4`=3975 WHERE `entry`=5680;

UPDATE `creature_template` SET `modelid_2`=3977 WHERE `entry`=5681;

UPDATE `creature_template` SET `modelid_3`=3978 WHERE `entry`=5681;

UPDATE `creature_template` SET `modelid_4`=3980 WHERE `entry`=5681;

UPDATE `creature_template` SET `modelid_3`=3979 WHERE `entry`=5735;

UPDATE `creature_template` SET `modelid_4`=3977 WHERE `entry`=5735;

UPDATE `creature_template` SET `modelid_3`=3975 WHERE `entry`=5736;

UPDATE `creature_template` SET `modelid_4`=3973 WHERE `entry`=5736;

UPDATE `creature_template` SET `modelid_3`=4117 WHERE `entry`=5738;

UPDATE `creature_template` SET `modelid_4`=4119 WHERE `entry`=5738;

UPDATE `creature_template` SET `modelid_2`=360 WHERE `entry`=5763;

UPDATE `creature_template` SET `modelid_3`=2028 WHERE `entry`=5763;

UPDATE `creature_template` SET `modelid_4`=358 WHERE `entry`=5763;

UPDATE `creature_template` SET `modelid_2`=2176 WHERE `entry`=5764;

UPDATE `creature_template` SET `modelid_3`=1825 WHERE `entry`=5764;

UPDATE `creature_template` SET `modelid_4`=2955 WHERE `entry`=5764;

UPDATE `creature_template` SET `modelid_3`=2320 WHERE `entry`=5774;

UPDATE `creature_template` SET `modelid_4`=2326 WHERE `entry`=5774;

UPDATE `creature_template` SET `modelid_2`=7794 WHERE `entry`=5839;

UPDATE `creature_template` SET `modelid_2`=7797 WHERE `entry`=5840;

UPDATE `creature_template` SET `modelid_3`=7816 WHERE `entry`=5843;

UPDATE `creature_template` SET `modelid_4`=7818 WHERE `entry`=5843;

UPDATE `creature_template` SET `modelid_3`=7790 WHERE `entry`=5844;

UPDATE `creature_template` SET `modelid_4`=7792 WHERE `entry`=5844;

UPDATE `creature_template` SET `modelid_3`=7799 WHERE `entry`=5846;

UPDATE `creature_template` SET `modelid_4`=7801 WHERE `entry`=5846;

UPDATE `creature_template` SET `modelid_3`=7822 WHERE `entry`=5860;

UPDATE `creature_template` SET `modelid_4`=7824 WHERE `entry`=5860;

UPDATE `creature_template` SET `modelid_3`=7826 WHERE `entry`=5861;

UPDATE `creature_template` SET `modelid_4`=7828 WHERE `entry`=5861;

UPDATE `creature_template` SET `modelid_3`=7831 WHERE `entry`=5862;

UPDATE `creature_template` SET `modelid_4`=7833 WHERE `entry`=5862;

UPDATE `creature_template` SET `modelid_2`=1127 WHERE `entry`=5889;

UPDATE `creature_template` SET `modelid_3`=549 WHERE `entry`=5889;

UPDATE `creature_template` SET `modelid_2`=1127 WHERE `entry`=5890;

UPDATE `creature_template` SET `modelid_3`=549 WHERE `entry`=5890;

UPDATE `creature_template` SET `modelid_2`=1405 WHERE `entry`=5896;

UPDATE `creature_template` SET `modelid_3`=2172 WHERE `entry`=5896;

UPDATE `creature_template` SET `modelid_3`=5493 WHERE `entry`=5897;

UPDATE `creature_template` SET `modelid_2`=1747 WHERE `entry`=5914;

UPDATE `creature_template` SET `modelid_3`=4317 WHERE `entry`=5914;

UPDATE `creature_template` SET `modelid_4`=3005 WHERE `entry`=5914;

UPDATE `creature_template` SET `modelid_2`=9794 WHERE `entry`=5952;

UPDATE `creature_template` SET `modelid_3`=9795 WHERE `entry`=5952;

UPDATE `creature_template` SET `modelid_4`=9796 WHERE `entry`=5952;

UPDATE `creature_template` SET `modelid_2`=9798 WHERE `entry`=5953;

UPDATE `creature_template` SET `modelid_3`=9800 WHERE `entry`=5953;

UPDATE `creature_template` SET `modelid_4`=9799 WHERE `entry`=5953;

UPDATE `creature_template` SET `modelid_2`=6719 WHERE `entry`=5996;

UPDATE `creature_template` SET `modelid_3`=6720 WHERE `entry`=5996;

UPDATE `creature_template` SET `modelid_4`=6721 WHERE `entry`=5996;

UPDATE `creature_template` SET `modelid_2`=6711 WHERE `entry`=5997;

UPDATE `creature_template` SET `modelid_2`=6723 WHERE `entry`=5998;

UPDATE `creature_template` SET `modelid_3`=6724 WHERE `entry`=5998;

UPDATE `creature_template` SET `modelid_4`=6726 WHERE `entry`=5998;

UPDATE `creature_template` SET `modelid_2`=6727 WHERE `entry`=5999;

UPDATE `creature_template` SET `modelid_3`=6729 WHERE `entry`=5999;

UPDATE `creature_template` SET `modelid_4`=6730 WHERE `entry`=5999;

UPDATE `creature_template` SET `modelid_2`=6731 WHERE `entry`=6000;

UPDATE `creature_template` SET `modelid_3`=6732 WHERE `entry`=6000;

UPDATE `creature_template` SET `modelid_4`=6733 WHERE `entry`=6000;

UPDATE `creature_template` SET `modelid_2`=6714 WHERE `entry`=6001;

UPDATE `creature_template` SET `modelid_2`=6738 WHERE `entry`=6002;

UPDATE `creature_template` SET `modelid_3`=6739 WHERE `entry`=6002;

UPDATE `creature_template` SET `modelid_4`=6740 WHERE `entry`=6002;

UPDATE `creature_template` SET `modelid_2`=6753 WHERE `entry`=6003;

UPDATE `creature_template` SET `modelid_3`=6754 WHERE `entry`=6003;

UPDATE `creature_template` SET `modelid_4`=6755 WHERE `entry`=6003;

UPDATE `creature_template` SET `modelid_2`=7838 WHERE `entry`=6004;

UPDATE `creature_template` SET `modelid_3`=6779 WHERE `entry`=6004;

UPDATE `creature_template` SET `modelid_4`=6780 WHERE `entry`=6004;

UPDATE `creature_template` SET `modelid_2`=6793 WHERE `entry`=6005;

UPDATE `creature_template` SET `modelid_3`=6794 WHERE `entry`=6005;

UPDATE `creature_template` SET `modelid_4`=6796 WHERE `entry`=6005;

UPDATE `creature_template` SET `modelid_2`=6770 WHERE `entry`=6006;

UPDATE `creature_template` SET `modelid_3`=6772 WHERE `entry`=6006;

UPDATE `creature_template` SET `modelid_4`=6773 WHERE `entry`=6006;

UPDATE `creature_template` SET `modelid_2`=6787 WHERE `entry`=6007;

UPDATE `creature_template` SET `modelid_3`=6788 WHERE `entry`=6007;

UPDATE `creature_template` SET `modelid_4`=6782 WHERE `entry`=6007;

UPDATE `creature_template` SET `modelid_2`=6790 WHERE `entry`=6008;

UPDATE `creature_template` SET `modelid_3`=6791 WHERE `entry`=6008;

UPDATE `creature_template` SET `modelid_4`=6792 WHERE `entry`=6008;

UPDATE `creature_template` SET `modelid_2`=6784 WHERE `entry`=6009;

UPDATE `creature_template` SET `modelid_3`=6785 WHERE `entry`=6009;

UPDATE `creature_template` SET `modelid_4`=6786 WHERE `entry`=6009;

UPDATE `creature_template` SET `modelid_3`=4846 WHERE `entry`=6086;

UPDATE `creature_template` SET `modelid_4`=4848 WHERE `entry`=6086;

UPDATE `creature_template` SET `modelid_3`=4842 WHERE `entry`=6087;

UPDATE `creature_template` SET `modelid_4`=4844 WHERE `entry`=6087;

UPDATE `creature_template` SET `modelid_2`=4909 WHERE `entry`=6180;

UPDATE `creature_template` SET `modelid_2`=6925 WHERE `entry`=6221;

UPDATE `creature_template` SET `modelid_3`=6933 WHERE `entry`=6222;

UPDATE `creature_template` SET `modelid_4`=6935 WHERE `entry`=6222;

UPDATE `creature_template` SET `modelid_2`=6981 WHERE `entry`=6223;

UPDATE `creature_template` SET `modelid_2`=6937 WHERE `entry`=6224;

UPDATE `creature_template` SET `modelid_2`=2990 WHERE `entry`=6237;

UPDATE `creature_template` SET `modelid_3`=2991 WHERE `entry`=6237;

UPDATE `creature_template` SET `modelid_4`=2992 WHERE `entry`=6237;

UPDATE `creature_template` SET `modelid_3`=4971 WHERE `entry`=6240;

UPDATE `creature_template` SET `modelid_4`=4970 WHERE `entry`=6240;

UPDATE `creature_template` SET `modelid_3`=4963 WHERE `entry`=6249;

UPDATE `creature_template` SET `modelid_4`=4967 WHERE `entry`=6249;

UPDATE `creature_template` SET `modelid_2`=4960 WHERE `entry`=6271;

UPDATE `creature_template` SET `modelid_2`=5556 WHERE `entry`=6368;

UPDATE `creature_template` SET `modelid_3`=5585 WHERE `entry`=6368;

UPDATE `creature_template` SET `modelid_4`=5586 WHERE `entry`=6368;

UPDATE `creature_template` SET `modelid_2`=6611 WHERE `entry`=6391;

UPDATE `creature_template` SET `modelid_2`=6609 WHERE `entry`=6392;

UPDATE `creature_template` SET `modelid_2`=6629 WHERE `entry`=6407;

UPDATE `creature_template` SET `modelid_2`=10255 WHERE `entry`=6426;

UPDATE `creature_template` SET `modelid_3`=1196 WHERE `entry`=6426;

UPDATE `creature_template` SET `modelid_4`=4631 WHERE `entry`=6426;

UPDATE `creature_template` SET `modelid_2`=2478 WHERE `entry`=6575;

UPDATE `creature_template` SET `modelid_2`=525 WHERE `entry`=6748;

UPDATE `creature_template` SET `modelid_3`=5561 WHERE `entry`=6748;

UPDATE `creature_template` SET `modelid_2`=6574 WHERE `entry`=6766;

UPDATE `creature_template` SET `modelid_3`=5908 WHERE `entry`=6771;

UPDATE `creature_template` SET `modelid_4`=5910 WHERE `entry`=6771;

UPDATE `creature_template` SET `modelid_2`=2341 WHERE `entry`=6866;

UPDATE `creature_template` SET `modelid_2`=2358 WHERE `entry`=6927;

UPDATE `creature_template` SET `modelid_2`=5809 WHERE `entry`=7052;

UPDATE `creature_template` SET `modelid_2`=5807 WHERE `entry`=7056;

UPDATE `creature_template` SET `modelid_2`=5829 WHERE `entry`=7068;

UPDATE `creature_template` SET `modelid_2`=5823 WHERE `entry`=7069;

UPDATE `creature_template` SET `modelid_3`=5825 WHERE `entry`=7070;

UPDATE `creature_template` SET `modelid_4`=5827 WHERE `entry`=7070;

UPDATE `creature_template` SET `modelid_3`=5817 WHERE `entry`=7071;

UPDATE `creature_template` SET `modelid_4`=5819 WHERE `entry`=7071;

UPDATE `creature_template` SET `modelid_2`=5821 WHERE `entry`=7072;

UPDATE `creature_template` SET `modelid_2`=5815 WHERE `entry`=7075;

UPDATE `creature_template` SET `modelid_3`=6392 WHERE `entry`=7112;

UPDATE `creature_template` SET `modelid_4`=11283 WHERE `entry`=7112;

UPDATE `creature_template` SET `modelid_3`=6400 WHERE `entry`=7113;

UPDATE `creature_template` SET `modelid_4`=11273 WHERE `entry`=7113;

UPDATE `creature_template` SET `modelid_3`=6398 WHERE `entry`=7114;

UPDATE `creature_template` SET `modelid_4`=11275 WHERE `entry`=7114;

UPDATE `creature_template` SET `modelid_3`=6391 WHERE `entry`=7115;

UPDATE `creature_template` SET `modelid_4`=11277 WHERE `entry`=7115;

UPDATE `creature_template` SET `modelid_3`=6394 WHERE `entry`=7118;

UPDATE `creature_template` SET `modelid_4`=11282 WHERE `entry`=7118;

UPDATE `creature_template` SET `modelid_3`=6406 WHERE `entry`=7120;

UPDATE `creature_template` SET `modelid_4`=11292 WHERE `entry`=7120;

UPDATE `creature_template` SET `modelid_2`=6426 WHERE `entry`=7246;

UPDATE `creature_template` SET `modelid_2`=6427 WHERE `entry`=7247;

UPDATE `creature_template` SET `modelid_2`=6437 WHERE `entry`=7276;

UPDATE `creature_template` SET `modelid_2`=6418 WHERE `entry`=7286;

UPDATE `creature_template` SET `modelid_2`=7236 WHERE `entry`=7307;

UPDATE `creature_template` SET `modelid_2`=7240 WHERE `entry`=7308;

UPDATE `creature_template` SET `modelid_2`=6128 WHERE `entry`=7360;

UPDATE `creature_template` SET `modelid_2`=11652 WHERE `entry`=7401;

UPDATE `creature_template` SET `modelid_3`=11651 WHERE `entry`=7401;

UPDATE `creature_template` SET `modelid_2`=6968 WHERE `entry`=7603;

UPDATE `creature_template` SET `modelid_2`=6848 WHERE `entry`=7668;

UPDATE `creature_template` SET `modelid_3`=6849 WHERE `entry`=7668;

UPDATE `creature_template` SET `modelid_4`=6850 WHERE `entry`=7668;

UPDATE `creature_template` SET `modelid_2`=6874 WHERE `entry`=7669;

UPDATE `creature_template` SET `modelid_3`=6875 WHERE `entry`=7669;

UPDATE `creature_template` SET `modelid_4`=6876 WHERE `entry`=7669;

UPDATE `creature_template` SET `modelid_2`=6855 WHERE `entry`=7670;

UPDATE `creature_template` SET `modelid_3`=6856 WHERE `entry`=7670;

UPDATE `creature_template` SET `modelid_4`=6857 WHERE `entry`=7670;

UPDATE `creature_template` SET `modelid_2`=6869 WHERE `entry`=7671;

UPDATE `creature_template` SET `modelid_3`=6871 WHERE `entry`=7671;

UPDATE `creature_template` SET `modelid_4`=6872 WHERE `entry`=7671;

UPDATE `creature_template` SET `modelid_1`=4805 WHERE `entry`=7684;

UPDATE `creature_template` SET `modelid_2`=6836 WHERE `entry`=7725;

UPDATE `creature_template` SET `modelid_2`=6832 WHERE `entry`=7726;

UPDATE `creature_template` SET `modelid_2`=6834 WHERE `entry`=7727;

UPDATE `creature_template` SET `modelid_3`=9804 WHERE `entry`=7730;

UPDATE `creature_template` SET `modelid_4`=9805 WHERE `entry`=7730;

UPDATE `creature_template` SET `modelid_2`=6679 WHERE `entry`=7787;

UPDATE `creature_template` SET `modelid_2`=6681 WHERE `entry`=7788;

UPDATE `creature_template` SET `modelid_2`=5573 WHERE `entry`=7805;

UPDATE `creature_template` SET `modelid_2`=6513 WHERE `entry`=7809;

UPDATE `creature_template` SET `modelid_3`=6974 WHERE `entry`=7843;

UPDATE `creature_template` SET `modelid_4`=6976 WHERE `entry`=7843;

UPDATE `creature_template` SET `modelid_2`=7911 WHERE `entry`=7851;

UPDATE `creature_template` SET `modelid_3`=7912 WHERE `entry`=7851;

UPDATE `creature_template` SET `modelid_4`=7913 WHERE `entry`=7851;

UPDATE `creature_template` SET `modelid_3`=6945 WHERE `entry`=7855;

UPDATE `creature_template` SET `modelid_4`=6947 WHERE `entry`=7855;

UPDATE `creature_template` SET `modelid_3`=6949 WHERE `entry`=7856;

UPDATE `creature_template` SET `modelid_4`=374 WHERE `entry`=7856;

UPDATE `creature_template` SET `modelid_3`=6939 WHERE `entry`=7857;

UPDATE `creature_template` SET `modelid_4`=6941 WHERE `entry`=7857;

UPDATE `creature_template` SET `modelid_3`=6951 WHERE `entry`=7858;

UPDATE `creature_template` SET `modelid_4`=6954 WHERE `entry`=7858;

UPDATE `creature_template` SET `modelid_3`=7860 WHERE `entry`=7865;

UPDATE `creature_template` SET `modelid_4`=7862 WHERE `entry`=7865;

UPDATE `creature_template` SET `modelid_2`=6960 WHERE `entry`=7899;

UPDATE `creature_template` SET `modelid_3`=6961 WHERE `entry`=7899;

UPDATE `creature_template` SET `modelid_4`=6962 WHERE `entry`=7899;

UPDATE `creature_template` SET `modelid_2`=6964 WHERE `entry`=7901;

UPDATE `creature_template` SET `modelid_3`=6965 WHERE `entry`=7901;

UPDATE `creature_template` SET `modelid_4`=6966 WHERE `entry`=7901;

UPDATE `creature_template` SET `modelid_1`=6957 WHERE `entry`=7902;

UPDATE `creature_template` SET `modelid_2`=6958 WHERE `entry`=7902;

UPDATE `creature_template` SET `modelid_3`=7013 WHERE `entry`=7939;

UPDATE `creature_template` SET `modelid_4`=7015 WHERE `entry`=7939;

UPDATE `creature_template` SET `modelid_3`=7116 WHERE `entry`=7975;

UPDATE `creature_template` SET `modelid_4`=10153 WHERE `entry`=7975;

UPDATE `creature_template` SET `modelid_2`=7118 WHERE `entry`=7980;

UPDATE `creature_template` SET `modelid_3`=14369 WHERE `entry`=7980;

UPDATE `creature_template` SET `modelid_4`=14370 WHERE `entry`=7980;

UPDATE `creature_template` SET `modelid_3`=4842 WHERE `entry`=8015;

UPDATE `creature_template` SET `modelid_4`=4844 WHERE `entry`=8015;

UPDATE `creature_template` SET `modelid_3`=4262 WHERE `entry`=8016;

UPDATE `creature_template` SET `modelid_4`=4264 WHERE `entry`=8016;

UPDATE `creature_template` SET `modelid_2`=4084 WHERE `entry`=8017;

UPDATE `creature_template` SET `modelid_2`=1608 WHERE `entry`=8055;

UPDATE `creature_template` SET `modelid_3`=7309 WHERE `entry`=8096;

UPDATE `creature_template` SET `modelid_4`=7311 WHERE `entry`=8096;

UPDATE `creature_template` SET `modelid_3`=7364 WHERE `entry`=8147;

UPDATE `creature_template` SET `modelid_4`=7366 WHERE `entry`=8147;

UPDATE `creature_template` SET `modelid_2`=7369 WHERE `entry`=8151;

UPDATE `creature_template` SET `modelid_3`=7376 WHERE `entry`=8154;

UPDATE `creature_template` SET `modelid_4`=7378 WHERE `entry`=8154;

UPDATE `creature_template` SET `modelid_2`=7375 WHERE `entry`=8155;

UPDATE `creature_template` SET `modelid_2`=7761 WHERE `entry`=8337;

UPDATE `creature_template` SET `modelid_2`=7766 WHERE `entry`=8338;

UPDATE `creature_template` SET `modelid_3`=7596 WHERE `entry`=8386;

UPDATE `creature_template` SET `modelid_4`=7608 WHERE `entry`=8386;

UPDATE `creature_template` SET `modelid_2`=7610 WHERE `entry`=8389;

UPDATE `creature_template` SET `modelid_3`=7611 WHERE `entry`=8389;

UPDATE `creature_template` SET `modelid_4`=7612 WHERE `entry`=8389;

UPDATE `creature_template` SET `modelid_3`=7753 WHERE `entry`=8402;

UPDATE `creature_template` SET `modelid_4`=7756 WHERE `entry`=8402;

UPDATE `creature_template` SET `modelid_2`=7730 WHERE `entry`=8419;

UPDATE `creature_template` SET `modelid_3`=7811 WHERE `entry`=8442;

UPDATE `creature_template` SET `modelid_4`=7813 WHERE `entry`=8442;

UPDATE `creature_template` SET `modelid_2`=7815 WHERE `entry`=8504;

UPDATE `creature_template` SET `modelid_1`=7804 WHERE `entry`=8506;

UPDATE `creature_template` SET `modelid_3`=10409 WHERE `entry`=8546;

UPDATE `creature_template` SET `modelid_4`=10411 WHERE `entry`=8546;

UPDATE `creature_template` SET `modelid_3`=10393 WHERE `entry`=8547;

UPDATE `creature_template` SET `modelid_4`=10394 WHERE `entry`=8547;

UPDATE `creature_template` SET `modelid_3`=10955 WHERE `entry`=8548;

UPDATE `creature_template` SET `modelid_4`=10956 WHERE `entry`=8548;

UPDATE `creature_template` SET `modelid_3`=10423 WHERE `entry`=8550;

UPDATE `creature_template` SET `modelid_4`=10424 WHERE `entry`=8550;

UPDATE `creature_template` SET `modelid_3`=10418 WHERE `entry`=8551;

UPDATE `creature_template` SET `modelid_4`=10420 WHERE `entry`=8551;

UPDATE `creature_template` SET `modelid_3`=10428 WHERE `entry`=8553;

UPDATE `creature_template` SET `modelid_4`=10430 WHERE `entry`=8553;

UPDATE `creature_template` SET `modelid_3`=10444 WHERE `entry`=8560;

UPDATE `creature_template` SET `modelid_4`=10447 WHERE `entry`=8560;

UPDATE `creature_template` SET `modelid_3`=10439 WHERE `entry`=8561;

UPDATE `creature_template` SET `modelid_4`=10440 WHERE `entry`=8561;

UPDATE `creature_template` SET `modelid_3`=10435 WHERE `entry`=8562;

UPDATE `creature_template` SET `modelid_4`=10437 WHERE `entry`=8562;

UPDATE `creature_template` SET `modelid_3`=7866 WHERE `entry`=8566;

UPDATE `creature_template` SET `modelid_4`=7868 WHERE `entry`=8566;

UPDATE `creature_template` SET `modelid_3`=7930 WHERE `entry`=8637;

UPDATE `creature_template` SET `modelid_4`=7932 WHERE `entry`=8637;

UPDATE `creature_template` SET `modelid_2`=6412 WHERE `entry`=8876;

UPDATE `creature_template` SET `modelid_2`=6424 WHERE `entry`=8877;

UPDATE `creature_template` SET `modelid_3`=2784 WHERE `entry`=8881;

UPDATE `creature_template` SET `modelid_4`=2786 WHERE `entry`=8881;

UPDATE `creature_template` SET `modelid_3`=6079 WHERE `entry`=8882;

UPDATE `creature_template` SET `modelid_4`=6080 WHERE `entry`=8882;

UPDATE `creature_template` SET `modelid_3`=2405 WHERE `entry`=8883;

UPDATE `creature_template` SET `modelid_4`=2410 WHERE `entry`=8883;

UPDATE `creature_template` SET `modelid_3`=4806 WHERE `entry`=8885;

UPDATE `creature_template` SET `modelid_4`=6468 WHERE `entry`=8885;

UPDATE `creature_template` SET `modelid_3`=8173 WHERE `entry`=8886;

UPDATE `creature_template` SET `modelid_3`=8794 WHERE `entry`=8896;

UPDATE `creature_template` SET `modelid_4`=8796 WHERE `entry`=8896;

UPDATE `creature_template` SET `modelid_3`=8804 WHERE `entry`=8897;

UPDATE `creature_template` SET `modelid_4`=8806 WHERE `entry`=8897;

UPDATE `creature_template` SET `modelid_3`=8821 WHERE `entry`=8899;

UPDATE `creature_template` SET `modelid_4`=8823 WHERE `entry`=8899;

UPDATE `creature_template` SET `modelid_3`=8813 WHERE `entry`=8900;

UPDATE `creature_template` SET `modelid_4`=8815 WHERE `entry`=8900;

UPDATE `creature_template` SET `modelid_3`=9288 WHERE `entry`=8901;

UPDATE `creature_template` SET `modelid_4`=9290 WHERE `entry`=8901;

UPDATE `creature_template` SET `modelid_3`=8799 WHERE `entry`=8902;

UPDATE `creature_template` SET `modelid_4`=8801 WHERE `entry`=8902;

UPDATE `creature_template` SET `modelid_3`=8826 WHERE `entry`=8904;

UPDATE `creature_template` SET `modelid_4`=8828 WHERE `entry`=8904;

UPDATE `creature_template` SET `modelid_3`=9350 WHERE `entry`=8912;

UPDATE `creature_template` SET `modelid_4`=8792 WHERE `entry`=8912;

UPDATE `creature_template` SET `modelid_3`=8774 WHERE `entry`=8913;

UPDATE `creature_template` SET `modelid_4`=8777 WHERE `entry`=8913;

UPDATE `creature_template` SET `modelid_3`=9347 WHERE `entry`=8914;

UPDATE `creature_template` SET `modelid_4`=9349 WHERE `entry`=8914;

UPDATE `creature_template` SET `modelid_3`=8779 WHERE `entry`=8915;

UPDATE `creature_template` SET `modelid_4`=9025 WHERE `entry`=8915;

UPDATE `creature_template` SET `modelid_3`=9070 WHERE `entry`=8916;

UPDATE `creature_template` SET `modelid_4`=9072 WHERE `entry`=8916;

UPDATE `creature_template` SET `modelid_3`=8892 WHERE `entry`=8917;

UPDATE `creature_template` SET `modelid_4`=487 WHERE `entry`=8917;

UPDATE `creature_template` SET `modelid_3`=8895 WHERE `entry`=8920;

UPDATE `creature_template` SET `modelid_4`=8897 WHERE `entry`=8920;

UPDATE `creature_template` SET `modelid_2`=9030 WHERE `entry`=8925;

UPDATE `creature_template` SET `modelid_3`=9031 WHERE `entry`=8925;

UPDATE `creature_template` SET `modelid_4`=9032 WHERE `entry`=8925;

UPDATE `creature_template` SET `modelid_1`=7347 WHERE `entry`=8926;

UPDATE `creature_template` SET `modelid_2`=9033 WHERE `entry`=8928;

UPDATE `creature_template` SET `modelid_3`=3005 WHERE `entry`=8928;

UPDATE `creature_template` SET `modelid_4`=2194 WHERE `entry`=8928;

UPDATE `creature_template` SET `modelid_2`=9354 WHERE `entry`=8932;

UPDATE `creature_template` SET `modelid_3`=9028 WHERE `entry`=8932;

UPDATE `creature_template` SET `modelid_4`=9029 WHERE `entry`=8932;

UPDATE `creature_template` SET `modelid_2`=909 WHERE `entry`=8933;

UPDATE `creature_template` SET `modelid_3`=821 WHERE `entry`=8933;

UPDATE `creature_template` SET `modelid_4`=520 WHERE `entry`=8933;

UPDATE `creature_template` SET `modelid_3`=9599 WHERE `entry`=9043;

UPDATE `creature_template` SET `modelid_4`=9856 WHERE `entry`=9043;

UPDATE `creature_template` SET `modelid_3`=9606 WHERE `entry`=9044;

UPDATE `creature_template` SET `modelid_4`=9862 WHERE `entry`=9044;

UPDATE `creature_template` SET `modelid_2`=9711 WHERE `entry`=9239;

UPDATE `creature_template` SET `modelid_3`=9712 WHERE `entry`=9239;

UPDATE `creature_template` SET `modelid_2`=9730 WHERE `entry`=9240;

UPDATE `creature_template` SET `modelid_3`=9731 WHERE `entry`=9240;

UPDATE `creature_template` SET `modelid_2`=9684 WHERE `entry`=9241;

UPDATE `creature_template` SET `modelid_3`=9685 WHERE `entry`=9241;

UPDATE `creature_template` SET `modelid_2`=9726 WHERE `entry`=9265;

UPDATE `creature_template` SET `modelid_3`=9727 WHERE `entry`=9265;

UPDATE `creature_template` SET `modelid_2`=9721 WHERE `entry`=9266;

UPDATE `creature_template` SET `modelid_3`=9722 WHERE `entry`=9266;

UPDATE `creature_template` SET `modelid_2`=9676 WHERE `entry`=9267;

UPDATE `creature_template` SET `modelid_3`=9677 WHERE `entry`=9267;

UPDATE `creature_template` SET `modelid_2`=9717 WHERE `entry`=9269;

UPDATE `creature_template` SET `modelid_3`=9718 WHERE `entry`=9269;

UPDATE `creature_template` SET `modelid_3`=10378 WHERE `entry`=9447;

UPDATE `creature_template` SET `modelid_4`=10380 WHERE `entry`=9447;

UPDATE `creature_template` SET `modelid_3`=10396 WHERE `entry`=9448;

UPDATE `creature_template` SET `modelid_3`=10389 WHERE `entry`=9449;

UPDATE `creature_template` SET `modelid_4`=10390 WHERE `entry`=9449;

UPDATE `creature_template` SET `modelid_3`=10399 WHERE `entry`=9450;

UPDATE `creature_template` SET `modelid_4`=10401 WHERE `entry`=9450;

UPDATE `creature_template` SET `modelid_3`=10415 WHERE `entry`=9451;

UPDATE `creature_template` SET `modelid_4`=10416 WHERE `entry`=9451;

UPDATE `creature_template` SET `modelid_3`=10405 WHERE `entry`=9452;

UPDATE `creature_template` SET `modelid_4`=10406 WHERE `entry`=9452;

UPDATE `creature_template` SET `modelid_2`=8649 WHERE `entry`=9457;

UPDATE `creature_template` SET `modelid_3`=9575 WHERE `entry`=9457;

UPDATE `creature_template` SET `modelid_4`=9577 WHERE `entry`=9457;

UPDATE `creature_template` SET `modelid_2`=9578 WHERE `entry`=9458;

UPDATE `creature_template` SET `modelid_3`=9579 WHERE `entry`=9458;

UPDATE `creature_template` SET `modelid_4`=9580 WHERE `entry`=9458;

UPDATE `creature_template` SET `modelid_3`=11376 WHERE `entry`=9460;

UPDATE `creature_template` SET `modelid_2`=8700 WHERE `entry`=9522;

UPDATE `creature_template` SET `modelid_3`=8701 WHERE `entry`=9522;

UPDATE `creature_template` SET `modelid_4`=8702 WHERE `entry`=9522;

UPDATE `creature_template` SET `modelid_3`=7116 WHERE `entry`=9525;

UPDATE `creature_template` SET `modelid_4`=10153 WHERE `entry`=9525;

UPDATE `creature_template` SET `modelid_2`=8662 WHERE `entry`=9541;

UPDATE `creature_template` SET `modelid_3`=8663 WHERE `entry`=9541;

UPDATE `creature_template` SET `modelid_3`=8674 WHERE `entry`=9545;

UPDATE `creature_template` SET `modelid_4`=8676 WHERE `entry`=9545;

UPDATE `creature_template` SET `modelid_3`=8679 WHERE `entry`=9547;

UPDATE `creature_template` SET `modelid_3`=8682 WHERE `entry`=9554;

UPDATE `creature_template` SET `modelid_4`=8684 WHERE `entry`=9554;

UPDATE `creature_template` SET `modelid_3`=8817 WHERE `entry`=9600;

UPDATE `creature_template` SET `modelid_4`=8819 WHERE `entry`=9600;

UPDATE `creature_template` SET `modelid_2`=9562 WHERE `entry`=9696;

UPDATE `creature_template` SET `modelid_3`=9619 WHERE `entry`=9716;

UPDATE `creature_template` SET `modelid_4`=9883 WHERE `entry`=9716;

UPDATE `creature_template` SET `modelid_3`=9672 WHERE `entry`=9817;

UPDATE `creature_template` SET `modelid_4`=9673 WHERE `entry`=9817;

UPDATE `creature_template` SET `modelid_4`=9852 WHERE `entry`=9818;

UPDATE `creature_template` SET `modelid_3`=9234 WHERE `entry`=10043;

UPDATE `creature_template` SET `modelid_4`=9236 WHERE `entry`=10043;

UPDATE `creature_template` SET `modelid_3`=9331 WHERE `entry`=10116;

UPDATE `creature_template` SET `modelid_4`=9333 WHERE `entry`=10116;

UPDATE `creature_template` SET `modelid_3`=9334 WHERE `entry`=10117;

UPDATE `creature_template` SET `modelid_2`=9572 WHERE `entry`=10259;

UPDATE `creature_template` SET `modelid_3`=9554 WHERE `entry`=10262;

UPDATE `creature_template` SET `modelid_4`=9557 WHERE `entry`=10262;

UPDATE `creature_template` SET `modelid_2`=9692 WHERE `entry`=10316;

UPDATE `creature_template` SET `modelid_3`=9892 WHERE `entry`=10316;

UPDATE `creature_template` SET `modelid_4`=9893 WHERE `entry`=10316;

UPDATE `creature_template` SET `modelid_1`=9806 WHERE `entry`=10339;

UPDATE `creature_template` SET `modelid_2`=10255 WHERE `entry`=10381;

UPDATE `creature_template` SET `modelid_3`=5432 WHERE `entry`=10381;

UPDATE `creature_template` SET `modelid_2`=5431 WHERE `entry`=10382;

UPDATE `creature_template` SET `modelid_3`=4631 WHERE `entry`=10382;

UPDATE `creature_template` SET `modelid_2`=10484 WHERE `entry`=10384;

UPDATE `creature_template` SET `modelid_3`=10485 WHERE `entry`=10384;

UPDATE `creature_template` SET `modelid_4`=10486 WHERE `entry`=10384;

UPDATE `creature_template` SET `modelid_2`=10480 WHERE `entry`=10385;

UPDATE `creature_template` SET `modelid_3`=10479 WHERE `entry`=10385;

UPDATE `creature_template` SET `modelid_4`=10481 WHERE `entry`=10385;

UPDATE `creature_template` SET `modelid_2`=9785 WHERE `entry`=10390;

UPDATE `creature_template` SET `modelid_3`=7555 WHERE `entry`=10390;

UPDATE `creature_template` SET `modelid_4`=9790 WHERE `entry`=10390;

UPDATE `creature_template` SET `modelid_2`=9787 WHERE `entry`=10391;

UPDATE `creature_template` SET `modelid_3`=9786 WHERE `entry`=10391;

UPDATE `creature_template` SET `modelid_4`=9788 WHERE `entry`=10391;

UPDATE `creature_template` SET `modelid_2`=10633 WHERE `entry`=10398;

UPDATE `creature_template` SET `modelid_3`=10632 WHERE `entry`=10398;

UPDATE `creature_template` SET `modelid_4`=10634 WHERE `entry`=10398;

UPDATE `creature_template` SET `modelid_2`=10536 WHERE `entry`=10399;

UPDATE `creature_template` SET `modelid_3`=10537 WHERE `entry`=10399;

UPDATE `creature_template` SET `modelid_4`=10538 WHERE `entry`=10399;

UPDATE `creature_template` SET `modelid_2`=10541 WHERE `entry`=10400;

UPDATE `creature_template` SET `modelid_3`=10540 WHERE `entry`=10400;

UPDATE `creature_template` SET `modelid_4`=10542 WHERE `entry`=10400;

UPDATE `creature_template` SET `modelid_2`=10494 WHERE `entry`=10418;

UPDATE `creature_template` SET `modelid_3`=10493 WHERE `entry`=10418;

UPDATE `creature_template` SET `modelid_4`=10495 WHERE `entry`=10418;

UPDATE `creature_template` SET `modelid_2`=10489 WHERE `entry`=10419;

UPDATE `creature_template` SET `modelid_3`=10490 WHERE `entry`=10419;

UPDATE `creature_template` SET `modelid_4`=10491 WHERE `entry`=10419;

UPDATE `creature_template` SET `modelid_2`=10497 WHERE `entry`=10420;

UPDATE `creature_template` SET `modelid_3`=10498 WHERE `entry`=10420;

UPDATE `creature_template` SET `modelid_4`=10499 WHERE `entry`=10420;

UPDATE `creature_template` SET `modelid_2`=10502 WHERE `entry`=10421;

UPDATE `creature_template` SET `modelid_3`=10501 WHERE `entry`=10421;

UPDATE `creature_template` SET `modelid_4`=10503 WHERE `entry`=10421;

UPDATE `creature_template` SET `modelid_2`=10505 WHERE `entry`=10422;

UPDATE `creature_template` SET `modelid_3`=10506 WHERE `entry`=10422;

UPDATE `creature_template` SET `modelid_4`=10507 WHERE `entry`=10422;

UPDATE `creature_template` SET `modelid_2`=10510 WHERE `entry`=10423;

UPDATE `creature_template` SET `modelid_3`=10509 WHERE `entry`=10423;

UPDATE `creature_template` SET `modelid_4`=10511 WHERE `entry`=10423;

UPDATE `creature_template` SET `modelid_2`=10513 WHERE `entry`=10424;

UPDATE `creature_template` SET `modelid_3`=10514 WHERE `entry`=10424;

UPDATE `creature_template` SET `modelid_4`=10515 WHERE `entry`=10424;

UPDATE `creature_template` SET `modelid_2`=10531 WHERE `entry`=10425;

UPDATE `creature_template` SET `modelid_3`=10530 WHERE `entry`=10425;

UPDATE `creature_template` SET `modelid_4`=10532 WHERE `entry`=10425;

UPDATE `creature_template` SET `modelid_2`=10517 WHERE `entry`=10426;

UPDATE `creature_template` SET `modelid_3`=10518 WHERE `entry`=10426;

UPDATE `creature_template` SET `modelid_4`=10519 WHERE `entry`=10426;

UPDATE `creature_template` SET `modelid_2`=1418 WHERE `entry`=10441;

UPDATE `creature_template` SET `modelid_3`=2176 WHERE `entry`=10441;

UPDATE `creature_template` SET `modelid_2`=2177 WHERE `entry`=10461;

UPDATE `creature_template` SET `modelid_3`=9829 WHERE `entry`=10461;

UPDATE `creature_template` SET `modelid_2`=11148 WHERE `entry`=10469;

UPDATE `creature_template` SET `modelid_3`=11149 WHERE `entry`=10469;

UPDATE `creature_template` SET `modelid_4`=11150 WHERE `entry`=10469;

UPDATE `creature_template` SET `modelid_2`=11131 WHERE `entry`=10470;

UPDATE `creature_template` SET `modelid_3`=11132 WHERE `entry`=10470;

UPDATE `creature_template` SET `modelid_4`=11133 WHERE `entry`=10470;

UPDATE `creature_template` SET `modelid_2`=11145 WHERE `entry`=10471;

UPDATE `creature_template` SET `modelid_3`=11146 WHERE `entry`=10471;

UPDATE `creature_template` SET `modelid_4`=11173 WHERE `entry`=10471;

UPDATE `creature_template` SET `modelid_3`=11125 WHERE `entry`=10472;

UPDATE `creature_template` SET `modelid_4`=11176 WHERE `entry`=10472;

UPDATE `creature_template` SET `modelid_2`=11134 WHERE `entry`=10475;

UPDATE `creature_template` SET `modelid_3`=11135 WHERE `entry`=10475;

UPDATE `creature_template` SET `modelid_4`=11136 WHERE `entry`=10475;

UPDATE `creature_template` SET `modelid_2`=11151 WHERE `entry`=10476;

UPDATE `creature_template` SET `modelid_3`=11152 WHERE `entry`=10476;

UPDATE `creature_template` SET `modelid_4`=11175 WHERE `entry`=10476;

UPDATE `creature_template` SET `modelid_2`=11154 WHERE `entry`=10477;

UPDATE `creature_template` SET `modelid_3`=11155 WHERE `entry`=10477;

UPDATE `creature_template` SET `modelid_4`=11156 WHERE `entry`=10477;

UPDATE `creature_template` SET `modelid_3`=9788 WHERE `entry`=10478;

UPDATE `creature_template` SET `modelid_4`=9790 WHERE `entry`=10478;

UPDATE `creature_template` SET `modelid_2`=5265 WHERE `entry`=10479;

UPDATE `creature_template` SET `modelid_2`=10972 WHERE `entry`=10480;

UPDATE `creature_template` SET `modelid_2`=10976 WHERE `entry`=10481;

UPDATE `creature_template` SET `modelid_2`=7550 WHERE `entry`=10482;

UPDATE `creature_template` SET `modelid_2`=7550 WHERE `entry`=10485;

UPDATE `creature_template` SET `modelid_2`=9904 WHERE `entry`=10536;

UPDATE `creature_template` SET `modelid_3`=9905 WHERE `entry`=10536;

UPDATE `creature_template` SET `modelid_4`=9906 WHERE `entry`=10536;

UPDATE `creature_template` SET `modelid_1`=7804 WHERE `entry`=10541;

UPDATE `creature_template` SET `modelid_2`=10256 WHERE `entry`=10580;

UPDATE `creature_template` SET `modelid_2`=9939 WHERE `entry`=10603;

UPDATE `creature_template` SET `modelid_3`=9940 WHERE `entry`=10603;

UPDATE `creature_template` SET `modelid_4`=9942 WHERE `entry`=10603;

UPDATE `creature_template` SET `modelid_3`=10313 WHERE `entry`=10605;

UPDATE `creature_template` SET `modelid_4`=10314 WHERE `entry`=10605;

UPDATE `creature_template` SET `modelid_3`=10333 WHERE `entry`=10608;

UPDATE `creature_template` SET `modelid_4`=10335 WHERE `entry`=10608;

UPDATE `creature_template` SET `modelid_2`=9671 WHERE `entry`=10680;

UPDATE `creature_template` SET `modelid_3`=9672 WHERE `entry`=10680;

UPDATE `creature_template` SET `modelid_4`=9673 WHERE `entry`=10680;

UPDATE `creature_template` SET `modelid_2`=9687 WHERE `entry`=10681;

UPDATE `creature_template` SET `modelid_3`=9896 WHERE `entry`=10681;

UPDATE `creature_template` SET `modelid_4`=9897 WHERE `entry`=10681;

UPDATE `creature_template` SET `modelid_2`=4138 WHERE `entry`=10696;

UPDATE `creature_template` SET `modelid_3`=10050 WHERE `entry`=10721;

UPDATE `creature_template` SET `modelid_4`=10052 WHERE `entry`=10721;

UPDATE `creature_template` SET `modelid_2`=10177 WHERE `entry`=10742;

UPDATE `creature_template` SET `modelid_3`=10178 WHERE `entry`=10742;

UPDATE `creature_template` SET `modelid_4`=10179 WHERE `entry`=10742;

UPDATE `creature_template` SET `modelid_3`=10225 WHERE `entry`=10758;

UPDATE `creature_template` SET `modelid_4`=10226 WHERE `entry`=10758;

UPDATE `creature_template` SET `modelid_3`=10240 WHERE `entry`=10759;

UPDATE `creature_template` SET `modelid_4`=10241 WHERE `entry`=10759;

UPDATE `creature_template` SET `modelid_3`=10230 WHERE `entry`=10760;

UPDATE `creature_template` SET `modelid_4`=10231 WHERE `entry`=10760;

UPDATE `creature_template` SET `modelid_3`=10235 WHERE `entry`=10761;

UPDATE `creature_template` SET `modelid_4`=10236 WHERE `entry`=10761;

UPDATE `creature_template` SET `modelid_2`=10173 WHERE `entry`=10762;

UPDATE `creature_template` SET `modelid_3`=10174 WHERE `entry`=10762;

UPDATE `creature_template` SET `modelid_4`=10175 WHERE `entry`=10762;

UPDATE `creature_template` SET `modelid_2`=10250 WHERE `entry`=10919;

UPDATE `creature_template` SET `modelid_3`=10251 WHERE `entry`=10919;

UPDATE `creature_template` SET `modelid_4`=10252 WHERE `entry`=10919;

UPDATE `creature_template` SET `modelid_2`=10364 WHERE `entry`=10947;

UPDATE `creature_template` SET `modelid_3`=10363 WHERE `entry`=10947;

UPDATE `creature_template` SET `modelid_4`=10365 WHERE `entry`=10947;

UPDATE `creature_template` SET `modelid_2`=10367 WHERE `entry`=10948;

UPDATE `creature_template` SET `modelid_3`=10368 WHERE `entry`=10948;

UPDATE `creature_template` SET `modelid_4`=10369 WHERE `entry`=10948;

UPDATE `creature_template` SET `modelid_2`=10372 WHERE `entry`=10949;

UPDATE `creature_template` SET `modelid_3`=10371 WHERE `entry`=10949;

UPDATE `creature_template` SET `modelid_4`=10373 WHERE `entry`=10949;

UPDATE `creature_template` SET `modelid_2`=10360 WHERE `entry`=10950;

UPDATE `creature_template` SET `modelid_3`=10359 WHERE `entry`=10950;

UPDATE `creature_template` SET `modelid_4`=10361 WHERE `entry`=10950;

UPDATE `creature_template` SET `modelid_2`=11472 WHERE `entry`=10951;

UPDATE `creature_template` SET `modelid_2`=10450 WHERE `entry`=10954;

UPDATE `creature_template` SET `modelid_3`=10449 WHERE `entry`=10954;

UPDATE `creature_template` SET `modelid_4`=10451 WHERE `entry`=10954;

UPDATE `creature_template` SET `modelid_2`=14015 WHERE `entry`=10983;

UPDATE `creature_template` SET `modelid_3`=14014 WHERE `entry`=10983;

UPDATE `creature_template` SET `modelid_4`=14016 WHERE `entry`=10983;

UPDATE `creature_template` SET `modelid_2`=10284 WHERE `entry`=10988;

UPDATE `creature_template` SET `modelid_3`=10919 WHERE `entry`=10988;

UPDATE `creature_template` SET `modelid_2`=10459 WHERE `entry`=10996;

UPDATE `creature_template` SET `modelid_3`=10461 WHERE `entry`=10996;

UPDATE `creature_template` SET `modelid_4`=10462 WHERE `entry`=10996;

UPDATE `creature_template` SET `modelid_3`=1200 WHERE `entry`=11030;

UPDATE `creature_template` SET `modelid_4`=646 WHERE `entry`=11030;

UPDATE `creature_template` SET `modelid_2`=10464 WHERE `entry`=11043;

UPDATE `creature_template` SET `modelid_3`=10533 WHERE `entry`=11043;

UPDATE `creature_template` SET `modelid_4`=10534 WHERE `entry`=11043;

UPDATE `creature_template` SET `modelid_2`=10822 WHERE `entry`=11054;

UPDATE `creature_template` SET `modelid_3`=10821 WHERE `entry`=11054;

UPDATE `creature_template` SET `modelid_4`=10823 WHERE `entry`=11054;

UPDATE `creature_template` SET `modelid_2`=10907 WHERE `entry`=11064;

UPDATE `creature_template` SET `modelid_3`=10908 WHERE `entry`=11064;

UPDATE `creature_template` SET `modelid_4`=10909 WHERE `entry`=11064;

UPDATE `creature_template` SET `modelid_2`=10558 WHERE `entry`=11099;

UPDATE `creature_template` SET `modelid_3`=10559 WHERE `entry`=11099;

UPDATE `creature_template` SET `modelid_4`=10557 WHERE `entry`=11099;

UPDATE `creature_template` SET `modelid_2`=10562 WHERE `entry`=11102;

UPDATE `creature_template` SET `modelid_2`=10638 WHERE `entry`=11120;

UPDATE `creature_template` SET `modelid_3`=10639 WHERE `entry`=11120;

UPDATE `creature_template` SET `modelid_4`=10640 WHERE `entry`=11120;

UPDATE `creature_template` SET `modelid_3`=10735 WHERE `entry`=11180;

UPDATE `creature_template` SET `modelid_4`=10736 WHERE `entry`=11180;

UPDATE `creature_template` SET `modelid_2`=10748 WHERE `entry`=11190;

UPDATE `creature_template` SET `modelid_3`=11407 WHERE `entry`=11194;

UPDATE `creature_template` SET `modelid_4`=11409 WHERE `entry`=11194;

UPDATE `creature_template` SET `modelid_2`=11443 WHERE `entry`=11196;

UPDATE `creature_template` SET `modelid_2`=7550 WHERE `entry`=11197;

UPDATE `creature_template` SET `modelid_3`=7555 WHERE `entry`=11197;

UPDATE `creature_template` SET `modelid_2`=11122 WHERE `entry`=11257;

UPDATE `creature_template` SET `modelid_3`=11123 WHERE `entry`=11257;

UPDATE `creature_template` SET `modelid_4`=11124 WHERE `entry`=11257;

UPDATE `creature_template` SET `modelid_2`=11015 WHERE `entry`=11277;

UPDATE `creature_template` SET `modelid_3`=11014 WHERE `entry`=11277;

UPDATE `creature_template` SET `modelid_4`=11016 WHERE `entry`=11277;

UPDATE `creature_template` SET `modelid_2`=11023 WHERE `entry`=11279;

UPDATE `creature_template` SET `modelid_3`=11022 WHERE `entry`=11279;

UPDATE `creature_template` SET `modelid_4`=11024 WHERE `entry`=11279;

UPDATE `creature_template` SET `modelid_2`=11018 WHERE `entry`=11280;

UPDATE `creature_template` SET `modelid_3`=11019 WHERE `entry`=11280;

UPDATE `creature_template` SET `modelid_4`=11020 WHERE `entry`=11280;

UPDATE `creature_template` SET `modelid_2`=11026 WHERE `entry`=11281;

UPDATE `creature_template` SET `modelid_3`=10936 WHERE `entry`=11288;

UPDATE `creature_template` SET `modelid_4`=10938 WHERE `entry`=11288;

UPDATE `creature_template` SET `modelid_3`=10940 WHERE `entry`=11289;

UPDATE `creature_template` SET `modelid_4`=10942 WHERE `entry`=11289;

UPDATE `creature_template` SET `modelid_2`=11118 WHERE `entry`=11296;

UPDATE `creature_template` SET `modelid_3`=11119 WHERE `entry`=11296;

UPDATE `creature_template` SET `modelid_4`=11120 WHERE `entry`=11296;

UPDATE `creature_template` SET `modelid_2`=11436 WHERE `entry`=11322;

UPDATE `creature_template` SET `modelid_3`=11435 WHERE `entry`=11322;

UPDATE `creature_template` SET `modelid_4`=11437 WHERE `entry`=11322;

UPDATE `creature_template` SET `modelid_2`=11430 WHERE `entry`=11323;

UPDATE `creature_template` SET `modelid_3`=11431 WHERE `entry`=11323;

UPDATE `creature_template` SET `modelid_4`=11433 WHERE `entry`=11323;

UPDATE `creature_template` SET `modelid_2`=11440 WHERE `entry`=11324;

UPDATE `creature_template` SET `modelid_3`=11439 WHERE `entry`=11324;

UPDATE `creature_template` SET `modelid_4`=11441 WHERE `entry`=11324;

UPDATE `creature_template` SET `modelid_3`=11231 WHERE `entry`=11338;

UPDATE `creature_template` SET `modelid_4`=11232 WHERE `entry`=11338;

UPDATE `creature_template` SET `modelid_3`=11227 WHERE `entry`=11339;

UPDATE `creature_template` SET `modelid_3`=11223 WHERE `entry`=11340;

UPDATE `creature_template` SET `modelid_4`=11224 WHERE `entry`=11340;

UPDATE `creature_template` SET `modelid_3`=11160 WHERE `entry`=11346;

UPDATE `creature_template` SET `modelid_4`=11162 WHERE `entry`=11346;

UPDATE `creature_template` SET `modelid_3`=11076 WHERE `entry`=11350;

UPDATE `creature_template` SET `modelid_4`=11077 WHERE `entry`=11350;

UPDATE `creature_template` SET `modelid_3`=11111 WHERE `entry`=11351;

UPDATE `creature_template` SET `modelid_4`=11112 WHERE `entry`=11351;

UPDATE `creature_template` SET `modelid_3`=11082 WHERE `entry`=11353;

UPDATE `creature_template` SET `modelid_4`=11083 WHERE `entry`=11353;

UPDATE `creature_template` SET `modelid_3`=11169 WHERE `entry`=11355;

UPDATE `creature_template` SET `modelid_4`=11170 WHERE `entry`=11355;

UPDATE `creature_template` SET `modelid_3`=11102 WHERE `entry`=11356;

UPDATE `creature_template` SET `modelid_4`=11103 WHERE `entry`=11356;

UPDATE `creature_template` SET `modelid_2`=13130 WHERE `entry`=11446;

UPDATE `creature_template` SET `modelid_3`=13132 WHERE `entry`=11446;

UPDATE `creature_template` SET `modelid_2`=11208 WHERE `entry`=11466;

UPDATE `creature_template` SET `modelid_3`=11209 WHERE `entry`=11466;

UPDATE `creature_template` SET `modelid_4`=11210 WHERE `entry`=11466;

UPDATE `creature_template` SET `modelid_2`=11214 WHERE `entry`=11469;

UPDATE `creature_template` SET `modelid_3`=11215 WHERE `entry`=11469;

UPDATE `creature_template` SET `modelid_4`=11216 WHERE `entry`=11469;

UPDATE `creature_template` SET `modelid_2`=11206 WHERE `entry`=11470;

UPDATE `creature_template` SET `modelid_3`=11211 WHERE `entry`=11470;

UPDATE `creature_template` SET `modelid_4`=11212 WHERE `entry`=11470;

UPDATE `creature_template` SET `modelid_2`=10284 WHERE `entry`=11521;

UPDATE `creature_template` SET `modelid_3`=10919 WHERE `entry`=11521;

UPDATE `creature_template` SET `modelid_2`=11128 WHERE `entry`=11582;

UPDATE `creature_template` SET `modelid_3`=11129 WHERE `entry`=11582;

UPDATE `creature_template` SET `modelid_4`=11177 WHERE `entry`=11582;

UPDATE `creature_template` SET `modelid_2`=5432 WHERE `entry`=11598;

UPDATE `creature_template` SET `modelid_3`=533 WHERE `entry`=11598;

UPDATE `creature_template` SET `modelid_4`=10975 WHERE `entry`=11598;

UPDATE `creature_template` SET `modelid_3`=12330 WHERE `entry`=11620;

UPDATE `creature_template` SET `modelid_4`=12332 WHERE `entry`=11620;

UPDATE `creature_template` SET `modelid_3`=11476 WHERE `entry`=11621;

UPDATE `creature_template` SET `modelid_4`=11478 WHERE `entry`=11621;

UPDATE `creature_template` SET `modelid_2`=11592 WHERE `entry`=11636;

UPDATE `creature_template` SET `modelid_3`=11594 WHERE `entry`=11636;

UPDATE `creature_template` SET `modelid_4`=11596 WHERE `entry`=11636;

UPDATE `creature_template` SET `modelid_2`=11589 WHERE `entry`=11637;

UPDATE `creature_template` SET `modelid_3`=11590 WHERE `entry`=11637;

UPDATE `creature_template` SET `modelid_4`=11593 WHERE `entry`=11637;

UPDATE `creature_template` SET `modelid_3`=11859 WHERE `entry`=11656;

UPDATE `creature_template` SET `modelid_4`=11860 WHERE `entry`=11656;

UPDATE `creature_template` SET `modelid_2`=14036 WHERE `entry`=11679;

UPDATE `creature_template` SET `modelid_3`=14035 WHERE `entry`=11679;

UPDATE `creature_template` SET `modelid_4`=14037 WHERE `entry`=11679;

UPDATE `creature_template` SET `modelid_3`=11870 WHERE `entry`=11680;

UPDATE `creature_template` SET `modelid_4`=11872 WHERE `entry`=11680;

UPDATE `creature_template` SET `modelid_3`=11855 WHERE `entry`=11681;

UPDATE `creature_template` SET `modelid_4`=11856 WHERE `entry`=11681;

UPDATE `creature_template` SET `modelid_3`=11863 WHERE `entry`=11682;

UPDATE `creature_template` SET `modelid_4`=11864 WHERE `entry`=11682;

UPDATE `creature_template` SET `modelid_3`=11866 WHERE `entry`=11683;

UPDATE `creature_template` SET `modelid_4`=11868 WHERE `entry`=11683;

UPDATE `creature_template` SET `modelid_2`=13211 WHERE `entry`=11789;

UPDATE `creature_template` SET `modelid_3`=9032 WHERE `entry`=11789;

UPDATE `creature_template` SET `modelid_4`=13212 WHERE `entry`=11789;

UPDATE `creature_template` SET `modelid_3`=11775 WHERE `entry`=11822;

UPDATE `creature_template` SET `modelid_4`=11777 WHERE `entry`=11822;

UPDATE `creature_template` SET `modelid_3`=11760 WHERE `entry`=11830;

UPDATE `creature_template` SET `modelid_4`=11761 WHERE `entry`=11830;

UPDATE `creature_template` SET `modelid_3`=11764 WHERE `entry`=11831;

UPDATE `creature_template` SET `modelid_4`=11765 WHERE `entry`=11831;

UPDATE `creature_template` SET `modelid_3`=11823 WHERE `entry`=11880;

UPDATE `creature_template` SET `modelid_4`=11813 WHERE `entry`=11880;

UPDATE `creature_template` SET `modelid_3`=11820 WHERE `entry`=11881;

UPDATE `creature_template` SET `modelid_4`=11822 WHERE `entry`=11881;

UPDATE `creature_template` SET `modelid_3`=11816 WHERE `entry`=11882;

UPDATE `creature_template` SET `modelid_4`=11818 WHERE `entry`=11882;

UPDATE `creature_template` SET `modelid_3`=11825 WHERE `entry`=11883;

UPDATE `creature_template` SET `modelid_4`=11827 WHERE `entry`=11883;

UPDATE `creature_template` SET `modelid_2`=11832 WHERE `entry`=11887;

UPDATE `creature_template` SET `modelid_3`=11833 WHERE `entry`=11887;

UPDATE `creature_template` SET `modelid_4`=11834 WHERE `entry`=11887;

UPDATE `creature_template` SET `modelid_3`=11879 WHERE `entry`=11910;

UPDATE `creature_template` SET `modelid_4`=11881 WHERE `entry`=11910;

UPDATE `creature_template` SET `modelid_3`=11883 WHERE `entry`=11911;

UPDATE `creature_template` SET `modelid_4`=11885 WHERE `entry`=11911;

UPDATE `creature_template` SET `modelid_3`=11875 WHERE `entry`=11912;

UPDATE `creature_template` SET `modelid_4`=11877 WHERE `entry`=11912;

UPDATE `creature_template` SET `modelid_3`=11888 WHERE `entry`=11913;

UPDATE `creature_template` SET `modelid_4`=11889 WHERE `entry`=11913;

UPDATE `creature_template` SET `modelid_3`=12066 WHERE `entry`=12047;

UPDATE `creature_template` SET `modelid_4`=12068 WHERE `entry`=12047;

UPDATE `creature_template` SET `modelid_2`=12070 WHERE `entry`=12048;

UPDATE `creature_template` SET `modelid_3`=12071 WHERE `entry`=12048;

UPDATE `creature_template` SET `modelid_4`=12072 WHERE `entry`=12048;

UPDATE `creature_template` SET `modelid_2`=13275 WHERE `entry`=12050;

UPDATE `creature_template` SET `modelid_3`=13276 WHERE `entry`=12050;

UPDATE `creature_template` SET `modelid_4`=13277 WHERE `entry`=12050;

UPDATE `creature_template` SET `modelid_2`=12950 WHERE `entry`=12051;

UPDATE `creature_template` SET `modelid_3`=12951 WHERE `entry`=12051;

UPDATE `creature_template` SET `modelid_4`=12952 WHERE `entry`=12051;

UPDATE `creature_template` SET `modelid_2`=12082 WHERE `entry`=12052;

UPDATE `creature_template` SET `modelid_3`=12083 WHERE `entry`=12052;

UPDATE `creature_template` SET `modelid_4`=12084 WHERE `entry`=12052;

UPDATE `creature_template` SET `modelid_2`=12166 WHERE `entry`=12053;

UPDATE `creature_template` SET `modelid_3`=12167 WHERE `entry`=12053;

UPDATE `creature_template` SET `modelid_4`=12170 WHERE `entry`=12053;

UPDATE `creature_template` SET `modelid_2`=12193 WHERE `entry`=12123;

UPDATE `creature_template` SET `modelid_3`=12194 WHERE `entry`=12123;

UPDATE `creature_template` SET `modelid_4`=12196 WHERE `entry`=12123;

UPDATE `creature_template` SET `modelid_2`=12204 WHERE `entry`=12124;

UPDATE `creature_template` SET `modelid_3`=12205 WHERE `entry`=12124;

UPDATE `creature_template` SET `modelid_4`=12206 WHERE `entry`=12124;

UPDATE `creature_template` SET `modelid_2`=12208 WHERE `entry`=12125;

UPDATE `creature_template` SET `modelid_3`=12209 WHERE `entry`=12125;

UPDATE `creature_template` SET `modelid_4`=12210 WHERE `entry`=12125;

UPDATE `creature_template` SET `modelid_3`=10513 WHERE `entry`=12128;

UPDATE `creature_template` SET `modelid_4`=10515 WHERE `entry`=12128;

UPDATE `creature_template` SET `modelid_1`=14017 WHERE `entry`=12156;

UPDATE `creature_template` SET `modelid_2`=14019 WHERE `entry`=12156;

UPDATE `creature_template` SET `modelid_3`=14018 WHERE `entry`=12156;

UPDATE `creature_template` SET `modelid_4`=14020 WHERE `entry`=12156;

UPDATE `creature_template` SET `modelid_2`=14061 WHERE `entry`=12157;

UPDATE `creature_template` SET `modelid_3`=14062 WHERE `entry`=12157;

UPDATE `creature_template` SET `modelid_4`=14063 WHERE `entry`=12157;

UPDATE `creature_template` SET `modelid_1`=14021 WHERE `entry`=12158;

UPDATE `creature_template` SET `modelid_2`=14023 WHERE `entry`=12158;

UPDATE `creature_template` SET `modelid_3`=14022 WHERE `entry`=12158;

UPDATE `creature_template` SET `modelid_4`=14024 WHERE `entry`=12158;

UPDATE `creature_template` SET `modelid_3`=4842 WHERE `entry`=12160;

UPDATE `creature_template` SET `modelid_4`=4844 WHERE `entry`=12160;

UPDATE `creature_template` SET `modelid_2`=4197 WHERE `entry`=12319;

UPDATE `creature_template` SET `modelid_2`=4199 WHERE `entry`=12320;

UPDATE `creature_template` SET `modelid_3`=12830 WHERE `entry`=12338;

UPDATE `creature_template` SET `modelid_4`=12831 WHERE `entry`=12338;

UPDATE `creature_template` SET `modelid_2`=10503 WHERE `entry`=12352;

UPDATE `creature_template` SET `modelid_2`=13951 WHERE `entry`=12379;

UPDATE `creature_template` SET `modelid_3`=13953 WHERE `entry`=12379;

UPDATE `creature_template` SET `modelid_4`=13954 WHERE `entry`=12379;

UPDATE `creature_template` SET `modelid_2`=12430 WHERE `entry`=12380;

UPDATE `creature_template` SET `modelid_3`=12431 WHERE `entry`=12380;

UPDATE `creature_template` SET `modelid_4`=13950 WHERE `entry`=12380;

UPDATE `creature_template` SET `modelid_3`=12025 WHERE `entry`=12416;

UPDATE `creature_template` SET `modelid_4`=12021 WHERE `entry`=12416;

UPDATE `creature_template` SET `modelid_3`=11981 WHERE `entry`=12420;

UPDATE `creature_template` SET `modelid_4`=11980 WHERE `entry`=12420;

UPDATE `creature_template` SET `modelid_2`=11969 WHERE `entry`=12458;

UPDATE `creature_template` SET `modelid_3`=14300 WHERE `entry`=12458;

UPDATE `creature_template` SET `modelid_4`=14301 WHERE `entry`=12458;

UPDATE `creature_template` SET `modelid_3`=12913 WHERE `entry`=12856;

UPDATE `creature_template` SET `modelid_3`=12811 WHERE `entry`=12859;

UPDATE `creature_template` SET `modelid_4`=12972 WHERE `entry`=12859;

UPDATE `creature_template` SET `modelid_3`=4842 WHERE `entry`=12896;

UPDATE `creature_template` SET `modelid_4`=4844 WHERE `entry`=12896;

UPDATE `creature_template` SET `modelid_3`=4842 WHERE `entry`=12897;

UPDATE `creature_template` SET `modelid_4`=4844 WHERE `entry`=12897;

UPDATE `creature_template` SET `modelid_2`=4261 WHERE `entry`=12903;

UPDATE `creature_template` SET `modelid_2`=1608 WHERE `entry`=12996;

UPDATE `creature_template` SET `modelid_2`=12933 WHERE `entry`=12998;

UPDATE `creature_template` SET `modelid_3`=12942 WHERE `entry`=13000;

UPDATE `creature_template` SET `modelid_4`=12944 WHERE `entry`=13000;

UPDATE `creature_template` SET `modelid_3`=4708 WHERE `entry`=13019;

UPDATE `creature_template` SET `modelid_4`=11304 WHERE `entry`=13019;

UPDATE `creature_template` SET `modelid_2`=1608 WHERE `entry`=13076;

UPDATE `creature_template` SET `modelid_2`=13313 WHERE `entry`=13080;

UPDATE `creature_template` SET `modelid_3`=13312 WHERE `entry`=13080;

UPDATE `creature_template` SET `modelid_4`=13314 WHERE `entry`=13080;

UPDATE `creature_template` SET `modelid_2`=13435 WHERE `entry`=13081;

UPDATE `creature_template` SET `modelid_3`=13436 WHERE `entry`=13081;

UPDATE `creature_template` SET `modelid_4`=13437 WHERE `entry`=13081;

UPDATE `creature_template` SET `modelid_2`=13328 WHERE `entry`=13087;

UPDATE `creature_template` SET `modelid_3`=13630 WHERE `entry`=13087;

UPDATE `creature_template` SET `modelid_4`=13631 WHERE `entry`=13087;

UPDATE `creature_template` SET `modelid_4`=13562 WHERE `entry`=13089;

UPDATE `creature_template` SET `modelid_2`=13895 WHERE `entry`=13096;

UPDATE `creature_template` SET `modelid_3`=13896 WHERE `entry`=13096;

UPDATE `creature_template` SET `modelid_4`=13552 WHERE `entry`=13096;

UPDATE `creature_template` SET `modelid_2`=13331 WHERE `entry`=13097;

UPDATE `creature_template` SET `modelid_3`=13540 WHERE `entry`=13097;

UPDATE `creature_template` SET `modelid_4`=13537 WHERE `entry`=13097;

UPDATE `creature_template` SET `modelid_2`=13317 WHERE `entry`=13098;

UPDATE `creature_template` SET `modelid_3`=13316 WHERE `entry`=13098;

UPDATE `creature_template` SET `modelid_4`=13318 WHERE `entry`=13098;

UPDATE `creature_template` SET `modelid_2`=13431 WHERE `entry`=13099;

UPDATE `creature_template` SET `modelid_3`=13432 WHERE `entry`=13099;

UPDATE `creature_template` SET `modelid_4`=13433 WHERE `entry`=13099;

UPDATE `creature_template` SET `modelid_2`=13337 WHERE `entry`=13116;

UPDATE `creature_template` SET `modelid_2`=13339 WHERE `entry`=13117;

UPDATE `creature_template` SET `modelid_3`=10494 WHERE `entry`=13118;

UPDATE `creature_template` SET `modelid_4`=10495 WHERE `entry`=13118;

UPDATE `creature_template` SET `modelid_2`=13441 WHERE `entry`=13149;

UPDATE `creature_template` SET `modelid_3`=13442 WHERE `entry`=13149;

UPDATE `creature_template` SET `modelid_4`=13443 WHERE `entry`=13149;

UPDATE `creature_template` SET `modelid_2`=13451 WHERE `entry`=13150;

UPDATE `creature_template` SET `modelid_3`=13453 WHERE `entry`=13150;

UPDATE `creature_template` SET `modelid_4`=13452 WHERE `entry`=13150;

UPDATE `creature_template` SET `modelid_4`=13111 WHERE `entry`=13160;

UPDATE `creature_template` SET `modelid_2`=308 WHERE `entry`=13317;

UPDATE `creature_template` SET `modelid_3`=901 WHERE `entry`=13321;

UPDATE `creature_template` SET `modelid_4`=1924 WHERE `entry`=13321;

UPDATE `creature_template` SET `modelid_2`=13210 WHERE `entry`=13323;

UPDATE `creature_template` SET `modelid_2`=13267 WHERE `entry`=13325;

UPDATE `creature_template` SET `modelid_3`=13268 WHERE `entry`=13325;

UPDATE `creature_template` SET `modelid_4`=13269 WHERE `entry`=13325;

UPDATE `creature_template` SET `modelid_2`=13263 WHERE `entry`=13326;

UPDATE `creature_template` SET `modelid_3`=13264 WHERE `entry`=13326;

UPDATE `creature_template` SET `modelid_4`=13265 WHERE `entry`=13326;

UPDATE `creature_template` SET `modelid_2`=13230 WHERE `entry`=13327;

UPDATE `creature_template` SET `modelid_3`=13231 WHERE `entry`=13327;

UPDATE `creature_template` SET `modelid_4`=13232 WHERE `entry`=13327;

UPDATE `creature_template` SET `modelid_2`=13279 WHERE `entry`=13328;

UPDATE `creature_template` SET `modelid_3`=13280 WHERE `entry`=13328;

UPDATE `creature_template` SET `modelid_4`=13281 WHERE `entry`=13328;

UPDATE `creature_template` SET `modelid_2`=13287 WHERE `entry`=13329;

UPDATE `creature_template` SET `modelid_3`=13288 WHERE `entry`=13329;

UPDATE `creature_template` SET `modelid_4`=13289 WHERE `entry`=13329;

UPDATE `creature_template` SET `modelid_2`=13302 WHERE `entry`=13330;

UPDATE `creature_template` SET `modelid_3`=13303 WHERE `entry`=13330;

UPDATE `creature_template` SET `modelid_4`=13304 WHERE `entry`=13330;

UPDATE `creature_template` SET `modelid_2`=13259 WHERE `entry`=13331;

UPDATE `creature_template` SET `modelid_3`=13260 WHERE `entry`=13331;

UPDATE `creature_template` SET `modelid_4`=13261 WHERE `entry`=13331;

UPDATE `creature_template` SET `modelid_2`=13283 WHERE `entry`=13332;

UPDATE `creature_template` SET `modelid_3`=13284 WHERE `entry`=13332;

UPDATE `creature_template` SET `modelid_4`=13285 WHERE `entry`=13332;

UPDATE `creature_template` SET `modelid_2`=13295 WHERE `entry`=13334;

UPDATE `creature_template` SET `modelid_3`=13296 WHERE `entry`=13334;

UPDATE `creature_template` SET `modelid_4`=13297 WHERE `entry`=13334;

UPDATE `creature_template` SET `modelid_2`=13271 WHERE `entry`=13335;

UPDATE `creature_template` SET `modelid_3`=13272 WHERE `entry`=13335;

UPDATE `creature_template` SET `modelid_4`=13273 WHERE `entry`=13335;

UPDATE `creature_template` SET `modelid_2`=13291 WHERE `entry`=13336;

UPDATE `creature_template` SET `modelid_3`=13292 WHERE `entry`=13336;

UPDATE `creature_template` SET `modelid_4`=13293 WHERE `entry`=13336;

UPDATE `creature_template` SET `modelid_2`=13307 WHERE `entry`=13337;

UPDATE `creature_template` SET `modelid_3`=13308 WHERE `entry`=13337;

UPDATE `creature_template` SET `modelid_4`=13309 WHERE `entry`=13337;

UPDATE `creature_template` SET `modelid_2`=13399 WHERE `entry`=13359;

UPDATE `creature_template` SET `modelid_3`=13400 WHERE `entry`=13359;

UPDATE `creature_template` SET `modelid_4`=13401 WHERE `entry`=13359;

UPDATE `creature_template` SET `modelid_2`=308 WHERE `entry`=13396;

UPDATE `creature_template` SET `modelid_2`=13362 WHERE `entry`=13421;

UPDATE `creature_template` SET `modelid_3`=13363 WHERE `entry`=13421;

UPDATE `creature_template` SET `modelid_4`=13364 WHERE `entry`=13421;

UPDATE `creature_template` SET `modelid_2`=13352 WHERE `entry`=13422;

UPDATE `creature_template` SET `modelid_3`=13353 WHERE `entry`=13422;

UPDATE `creature_template` SET `modelid_4`=13354 WHERE `entry`=13422;

UPDATE `creature_template` SET `modelid_2`=13376 WHERE `entry`=13425;

UPDATE `creature_template` SET `modelid_3`=13377 WHERE `entry`=13425;

UPDATE `creature_template` SET `modelid_4`=13378 WHERE `entry`=13425;

UPDATE `creature_template` SET `modelid_2`=13380 WHERE `entry`=13426;

UPDATE `creature_template` SET `modelid_3`=13381 WHERE `entry`=13426;

UPDATE `creature_template` SET `modelid_4`=13382 WHERE `entry`=13426;

UPDATE `creature_template` SET `modelid_2`=13358 WHERE `entry`=13427;

UPDATE `creature_template` SET `modelid_3`=13359 WHERE `entry`=13427;

UPDATE `creature_template` SET `modelid_4`=13360 WHERE `entry`=13427;

UPDATE `creature_template` SET `modelid_2`=13366 WHERE `entry`=13428;

UPDATE `creature_template` SET `modelid_3`=13367 WHERE `entry`=13428;

UPDATE `creature_template` SET `modelid_4`=13368 WHERE `entry`=13428;

UPDATE `creature_template` SET `modelid_2`=13412 WHERE `entry`=13440;

UPDATE `creature_template` SET `modelid_3`=13414 WHERE `entry`=13440;

UPDATE `creature_template` SET `modelid_4`=13413 WHERE `entry`=13440;

UPDATE `creature_template` SET `modelid_3`=13819 WHERE `entry`=13516;

UPDATE `creature_template` SET `modelid_4`=13820 WHERE `entry`=13516;

UPDATE `creature_template` SET `modelid_3`=13823 WHERE `entry`=13517;

UPDATE `creature_template` SET `modelid_4`=13824 WHERE `entry`=13517;

UPDATE `creature_template` SET `modelid_3`=13830 WHERE `entry`=13518;

UPDATE `creature_template` SET `modelid_4`=13832 WHERE `entry`=13518;

UPDATE `creature_template` SET `modelid_3`=13834 WHERE `entry`=13519;

UPDATE `creature_template` SET `modelid_4`=13836 WHERE `entry`=13519;

UPDATE `creature_template` SET `modelid_3`=13676 WHERE `entry`=13520;

UPDATE `creature_template` SET `modelid_4`=13677 WHERE `entry`=13520;

UPDATE `creature_template` SET `modelid_3`=13680 WHERE `entry`=13521;

UPDATE `creature_template` SET `modelid_4`=13681 WHERE `entry`=13521;

UPDATE `creature_template` SET `modelid_3`=13684 WHERE `entry`=13522;

UPDATE `creature_template` SET `modelid_4`=13685 WHERE `entry`=13522;

UPDATE `creature_template` SET `modelid_3`=13688 WHERE `entry`=13523;

UPDATE `creature_template` SET `modelid_4`=13689 WHERE `entry`=13523;

UPDATE `creature_template` SET `modelid_2`=13646 WHERE `entry`=13524;

UPDATE `creature_template` SET `modelid_3`=13647 WHERE `entry`=13524;

UPDATE `creature_template` SET `modelid_4`=13648 WHERE `entry`=13524;

UPDATE `creature_template` SET `modelid_2`=13655 WHERE `entry`=13525;

UPDATE `creature_template` SET `modelid_3`=13656 WHERE `entry`=13525;

UPDATE `creature_template` SET `modelid_4`=13657 WHERE `entry`=13525;

UPDATE `creature_template` SET `modelid_2`=13659 WHERE `entry`=13526;

UPDATE `creature_template` SET `modelid_3`=13660 WHERE `entry`=13526;

UPDATE `creature_template` SET `modelid_4`=13661 WHERE `entry`=13526;

UPDATE `creature_template` SET `modelid_2`=13651 WHERE `entry`=13527;

UPDATE `creature_template` SET `modelid_3`=13652 WHERE `entry`=13527;

UPDATE `creature_template` SET `modelid_4`=13653 WHERE `entry`=13527;

UPDATE `creature_template` SET `modelid_2`=13810 WHERE `entry`=13528;

UPDATE `creature_template` SET `modelid_3`=13811 WHERE `entry`=13528;

UPDATE `creature_template` SET `modelid_4`=13812 WHERE `entry`=13528;

UPDATE `creature_template` SET `modelid_2`=13814 WHERE `entry`=13529;

UPDATE `creature_template` SET `modelid_3`=13815 WHERE `entry`=13529;

UPDATE `creature_template` SET `modelid_4`=13816 WHERE `entry`=13529;

UPDATE `creature_template` SET `modelid_2`=13826 WHERE `entry`=13530;

UPDATE `creature_template` SET `modelid_3`=13827 WHERE `entry`=13530;

UPDATE `creature_template` SET `modelid_4`=13829 WHERE `entry`=13530;

UPDATE `creature_template` SET `modelid_2`=13838 WHERE `entry`=13531;

UPDATE `creature_template` SET `modelid_3`=13839 WHERE `entry`=13531;

UPDATE `creature_template` SET `modelid_4`=13840 WHERE `entry`=13531;

UPDATE `creature_template` SET `modelid_2`=13568 WHERE `entry`=13534;

UPDATE `creature_template` SET `modelid_3`=13569 WHERE `entry`=13534;

UPDATE `creature_template` SET `modelid_4`=13570 WHERE `entry`=13534;

UPDATE `creature_template` SET `modelid_2`=13572 WHERE `entry`=13535;

UPDATE `creature_template` SET `modelid_3`=13573 WHERE `entry`=13535;

UPDATE `creature_template` SET `modelid_4`=13574 WHERE `entry`=13535;

UPDATE `creature_template` SET `modelid_2`=13564 WHERE `entry`=13536;

UPDATE `creature_template` SET `modelid_3`=13565 WHERE `entry`=13536;

UPDATE `creature_template` SET `modelid_4`=13566 WHERE `entry`=13536;

UPDATE `creature_template` SET `modelid_2`=13546 WHERE `entry`=13537;

UPDATE `creature_template` SET `modelid_3`=13548 WHERE `entry`=13537;

UPDATE `creature_template` SET `modelid_4`=13550 WHERE `entry`=13537;

UPDATE `creature_template` SET `modelid_2`=13555 WHERE `entry`=13538;

UPDATE `creature_template` SET `modelid_3`=13556 WHERE `entry`=13538;

UPDATE `creature_template` SET `modelid_4`=13557 WHERE `entry`=13538;

UPDATE `creature_template` SET `modelid_2`=13559 WHERE `entry`=13539;

UPDATE `creature_template` SET `modelid_3`=13560 WHERE `entry`=13539;

UPDATE `creature_template` SET `modelid_4`=13561 WHERE `entry`=13539;

UPDATE `creature_template` SET `modelid_2`=13770 WHERE `entry`=13540;

UPDATE `creature_template` SET `modelid_3`=13771 WHERE `entry`=13540;

UPDATE `creature_template` SET `modelid_4`=13772 WHERE `entry`=13540;

UPDATE `creature_template` SET `modelid_2`=13774 WHERE `entry`=13541;

UPDATE `creature_template` SET `modelid_3`=13775 WHERE `entry`=13541;

UPDATE `creature_template` SET `modelid_4`=13776 WHERE `entry`=13541;

UPDATE `creature_template` SET `modelid_2`=13778 WHERE `entry`=13542;

UPDATE `creature_template` SET `modelid_3`=13779 WHERE `entry`=13542;

UPDATE `creature_template` SET `modelid_4`=13780 WHERE `entry`=13542;

UPDATE `creature_template` SET `modelid_2`=13591 WHERE `entry`=13543;

UPDATE `creature_template` SET `modelid_3`=13592 WHERE `entry`=13543;

UPDATE `creature_template` SET `modelid_4`=13593 WHERE `entry`=13543;

UPDATE `creature_template` SET `modelid_2`=13595 WHERE `entry`=13544;

UPDATE `creature_template` SET `modelid_3`=13596 WHERE `entry`=13544;

UPDATE `creature_template` SET `modelid_4`=13597 WHERE `entry`=13544;

UPDATE `creature_template` SET `modelid_2`=13599 WHERE `entry`=13545;

UPDATE `creature_template` SET `modelid_3`=13600 WHERE `entry`=13545;

UPDATE `creature_template` SET `modelid_4`=13601 WHERE `entry`=13545;

UPDATE `creature_template` SET `modelid_2`=13891 WHERE `entry`=13546;

UPDATE `creature_template` SET `modelid_3`=13538 WHERE `entry`=13546;

UPDATE `creature_template` SET `modelid_4`=13539 WHERE `entry`=13546;

UPDATE `creature_template` SET `modelid_2`=13894 WHERE `entry`=13547;

UPDATE `creature_template` SET `modelid_3`=13547 WHERE `entry`=13547;

UPDATE `creature_template` SET `modelid_4`=13549 WHERE `entry`=13547;

UPDATE `creature_template` SET `modelid_2`=13890 WHERE `entry`=13548;

UPDATE `creature_template` SET `modelid_3`=13533 WHERE `entry`=13548;

UPDATE `creature_template` SET `modelid_4`=13534 WHERE `entry`=13548;

UPDATE `creature_template` SET `modelid_2`=13637 WHERE `entry`=13549;

UPDATE `creature_template` SET `modelid_3`=13638 WHERE `entry`=13549;

UPDATE `creature_template` SET `modelid_4`=13639 WHERE `entry`=13549;

UPDATE `creature_template` SET `modelid_2`=13641 WHERE `entry`=13550;

UPDATE `creature_template` SET `modelid_3`=13642 WHERE `entry`=13550;

UPDATE `creature_template` SET `modelid_4`=13643 WHERE `entry`=13550;

UPDATE `creature_template` SET `modelid_2`=13633 WHERE `entry`=13551;

UPDATE `creature_template` SET `modelid_3`=13634 WHERE `entry`=13551;

UPDATE `creature_template` SET `modelid_4`=13635 WHERE `entry`=13551;

UPDATE `creature_template` SET `modelid_2`=13782 WHERE `entry`=13552;

UPDATE `creature_template` SET `modelid_3`=13783 WHERE `entry`=13552;

UPDATE `creature_template` SET `modelid_4`=13784 WHERE `entry`=13552;

UPDATE `creature_template` SET `modelid_2`=13787 WHERE `entry`=13553;

UPDATE `creature_template` SET `modelid_3`=13786 WHERE `entry`=13553;

UPDATE `creature_template` SET `modelid_4`=13788 WHERE `entry`=13553;

UPDATE `creature_template` SET `modelid_2`=13791 WHERE `entry`=13554;

UPDATE `creature_template` SET `modelid_3`=13790 WHERE `entry`=13554;

UPDATE `creature_template` SET `modelid_4`=13792 WHERE `entry`=13554;

UPDATE `creature_template` SET `modelid_2`=13796 WHERE `entry`=13555;

UPDATE `creature_template` SET `modelid_3`=13797 WHERE `entry`=13555;

UPDATE `creature_template` SET `modelid_4`=13798 WHERE `entry`=13555;

UPDATE `creature_template` SET `modelid_2`=13800 WHERE `entry`=13556;

UPDATE `creature_template` SET `modelid_3`=13801 WHERE `entry`=13556;

UPDATE `creature_template` SET `modelid_4`=13802 WHERE `entry`=13556;

UPDATE `creature_template` SET `modelid_2`=13804 WHERE `entry`=13557;

UPDATE `creature_template` SET `modelid_3`=13805 WHERE `entry`=13557;

UPDATE `creature_template` SET `modelid_4`=13806 WHERE `entry`=13557;

UPDATE `creature_template` SET `modelid_2`=13710 WHERE `entry`=13576;

UPDATE `creature_template` SET `modelid_3`=13711 WHERE `entry`=13576;

UPDATE `creature_template` SET `modelid_4`=13712 WHERE `entry`=13576;

UPDATE `creature_template` SET `modelid_3`=13855 WHERE `entry`=13839;

UPDATE `creature_template` SET `modelid_4`=13856 WHERE `entry`=13839;

UPDATE `creature_template` SET `modelid_2`=14028 WHERE `entry`=13956;

UPDATE `creature_template` SET `modelid_3`=14027 WHERE `entry`=13956;

UPDATE `creature_template` SET `modelid_4`=14029 WHERE `entry`=13956;

UPDATE `creature_template` SET `modelid_2`=14054 WHERE `entry`=13957;

UPDATE `creature_template` SET `modelid_3`=14053 WHERE `entry`=13957;

UPDATE `creature_template` SET `modelid_4`=14055 WHERE `entry`=13957;

UPDATE `creature_template` SET `modelid_2`=14032 WHERE `entry`=13958;

UPDATE `creature_template` SET `modelid_3`=14031 WHERE `entry`=13958;

UPDATE `creature_template` SET `modelid_4`=14033 WHERE `entry`=13958;

UPDATE `creature_template` SET `modelid_2`=6373 WHERE `entry`=13976;

UPDATE `creature_template` SET `modelid_3`=9584 WHERE `entry`=13976;

UPDATE `creature_template` SET `modelid_4`=6370 WHERE `entry`=13976;

UPDATE `creature_template` SET `modelid_2`=14302 WHERE `entry`=13996;

UPDATE `creature_template` SET `modelid_3`=14304 WHERE `entry`=13996;

UPDATE `creature_template` SET `modelid_4`=14303 WHERE `entry`=13996;

UPDATE `creature_template` SET `modelid_2`=3764 WHERE `entry`=14275;

UPDATE `creature_template` SET `modelid_3`=14321 WHERE `entry`=14285;

UPDATE `creature_template` SET `modelid_4`=14325 WHERE `entry`=14285;

UPDATE `creature_template` SET `modelid_2`=14361 WHERE `entry`=14304;

UPDATE `creature_template` SET `modelid_3`=14362 WHERE `entry`=14304;

UPDATE `creature_template` SET `modelid_4`=14363 WHERE `entry`=14304;

UPDATE `creature_template` SET `modelid_2`=14393 WHERE `entry`=14364;

UPDATE `creature_template` SET `modelid_3`=14398 WHERE `entry`=14364;

UPDATE `creature_template` SET `modelid_4`=14400 WHERE `entry`=14364;

UPDATE `creature_template` SET `modelid_2`=14410 WHERE `entry`=14369;

UPDATE `creature_template` SET `modelid_3`=14409 WHERE `entry`=14369;

UPDATE `creature_template` SET `modelid_4`=14411 WHERE `entry`=14369;

UPDATE `creature_template` SET `modelid_2`=3762 WHERE `entry`=14390;

UPDATE `creature_template` SET `modelid_2`=3766 WHERE `entry`=14393;

UPDATE `creature_template` SET `modelid_2`=12025 WHERE `entry`=14456;

UPDATE `creature_template` SET `modelid_3`=12021 WHERE `entry`=14456;

UPDATE `creature_template` SET `modelid_4`=12022 WHERE `entry`=14456;

UPDATE `creature_template` SET `modelid_2`=14535 WHERE `entry`=14484;

UPDATE `creature_template` SET `modelid_3`=14534 WHERE `entry`=14484;

UPDATE `creature_template` SET `modelid_4`=14536 WHERE `entry`=14484;

UPDATE `creature_template` SET `modelid_2`=14539 WHERE `entry`=14485;

UPDATE `creature_template` SET `modelid_3`=14538 WHERE `entry`=14485;

UPDATE `creature_template` SET `modelid_4`=14540 WHERE `entry`=14485;

UPDATE `creature_template` SET `modelid_2`=11403 WHERE `entry`=14486;

UPDATE `creature_template` SET `modelid_3`=11401 WHERE `entry`=14486;

UPDATE `creature_template` SET `modelid_4`=7550 WHERE `entry`=14486;

UPDATE `creature_template` SET `modelid_3`=14538 WHERE `entry`=14493;

UPDATE `creature_template` SET `modelid_4`=14540 WHERE `entry`=14493;

UPDATE `creature_template` SET `modelid_2`=169 WHERE `entry`=14495;

UPDATE `creature_template` SET `modelid_2`=252 WHERE `entry`=14496;

UPDATE `creature_template` SET `modelid_3`=257 WHERE `entry`=14496;

UPDATE `creature_template` SET `modelid_4`=251 WHERE `entry`=14496;

UPDATE `creature_template` SET `modelid_2`=14616 WHERE `entry`=14499;

UPDATE `creature_template` SET `modelid_3`=14670 WHERE `entry`=14622;

UPDATE `creature_template` SET `modelid_4`=14672 WHERE `entry`=14622;

UPDATE `creature_template` SET `modelid_3`=7931 WHERE `entry`=14635;

UPDATE `creature_template` SET `modelid_4`=7932 WHERE `entry`=14635;

UPDATE `creature_template` SET `modelid_1`=11686 WHERE `entry`=14646;

UPDATE `creature_template` SET `modelid_3`=160 WHERE `entry`=14681;

UPDATE `creature_template` SET `modelid_4`=441 WHERE `entry`=14681;

UPDATE `creature_template` SET `modelid_3`=14713 WHERE `entry`=14715;

UPDATE `creature_template` SET `modelid_4`=14715 WHERE `entry`=14715;

UPDATE `creature_template` SET `modelid_3`=14718 WHERE `entry`=14717;

UPDATE `creature_template` SET `modelid_4`=14719 WHERE `entry`=14717;

UPDATE `creature_template` SET `modelid_3`=11859 WHERE `entry`=14718;

UPDATE `creature_template` SET `modelid_4`=11860 WHERE `entry`=14718;

UPDATE `creature_template` SET `modelid_3`=14762 WHERE `entry`=14730;

UPDATE `creature_template` SET `modelid_4`=14763 WHERE `entry`=14730;

UPDATE `creature_template` SET `modelid_3`=14767 WHERE `entry`=14734;

UPDATE `creature_template` SET `modelid_2`=6513 WHERE `entry`=14748;

UPDATE `creature_template` SET `modelid_1`=11686 WHERE `entry`=14758;

UPDATE `creature_template` SET `modelid_2`=14793 WHERE `entry`=14762;

UPDATE `creature_template` SET `modelid_3`=14794 WHERE `entry`=14762;

UPDATE `creature_template` SET `modelid_4`=14796 WHERE `entry`=14762;

UPDATE `creature_template` SET `modelid_2`=14795 WHERE `entry`=14763;

UPDATE `creature_template` SET `modelid_3`=14794 WHERE `entry`=14763;

UPDATE `creature_template` SET `modelid_4`=14796 WHERE `entry`=14763;

UPDATE `creature_template` SET `modelid_2`=14793 WHERE `entry`=14764;

UPDATE `creature_template` SET `modelid_3`=14795 WHERE `entry`=14764;

UPDATE `creature_template` SET `modelid_4`=14796 WHERE `entry`=14764;

UPDATE `creature_template` SET `modelid_2`=14795 WHERE `entry`=14765;

UPDATE `creature_template` SET `modelid_3`=14794 WHERE `entry`=14765;

UPDATE `creature_template` SET `modelid_4`=14796 WHERE `entry`=14765;

UPDATE `creature_template` SET `modelid_2`=14793 WHERE `entry`=14766;

UPDATE `creature_template` SET `modelid_3`=14795 WHERE `entry`=14766;

UPDATE `creature_template` SET `modelid_4`=14794 WHERE `entry`=14766;

UPDATE `creature_template` SET `modelid_2`=14795 WHERE `entry`=14767;

UPDATE `creature_template` SET `modelid_3`=14794 WHERE `entry`=14767;

UPDATE `creature_template` SET `modelid_4`=14796 WHERE `entry`=14767;

UPDATE `creature_template` SET `modelid_2`=14793 WHERE `entry`=14768;

UPDATE `creature_template` SET `modelid_3`=14795 WHERE `entry`=14768;

UPDATE `creature_template` SET `modelid_4`=14794 WHERE `entry`=14768;

UPDATE `creature_template` SET `modelid_2`=14793 WHERE `entry`=14769;

UPDATE `creature_template` SET `modelid_3`=14795 WHERE `entry`=14769;

UPDATE `creature_template` SET `modelid_4`=14796 WHERE `entry`=14769;

UPDATE `creature_template` SET `modelid_2`=14797 WHERE `entry`=14770;

UPDATE `creature_template` SET `modelid_3`=14798 WHERE `entry`=14770;

UPDATE `creature_template` SET `modelid_4`=14800 WHERE `entry`=14770;

UPDATE `creature_template` SET `modelid_2`=14797 WHERE `entry`=14771;

UPDATE `creature_template` SET `modelid_3`=14799 WHERE `entry`=14771;

UPDATE `creature_template` SET `modelid_4`=14798 WHERE `entry`=14771;

UPDATE `creature_template` SET `modelid_2`=14797 WHERE `entry`=14772;

UPDATE `creature_template` SET `modelid_3`=14799 WHERE `entry`=14772;

UPDATE `creature_template` SET `modelid_4`=14800 WHERE `entry`=14772;

UPDATE `creature_template` SET `modelid_2`=14797 WHERE `entry`=14773;

UPDATE `creature_template` SET `modelid_3`=14798 WHERE `entry`=14773;

UPDATE `creature_template` SET `modelid_4`=14800 WHERE `entry`=14773;

UPDATE `creature_template` SET `modelid_2`=14797 WHERE `entry`=14774;

UPDATE `creature_template` SET `modelid_3`=14799 WHERE `entry`=14774;

UPDATE `creature_template` SET `modelid_4`=14800 WHERE `entry`=14774;

UPDATE `creature_template` SET `modelid_2`=14797 WHERE `entry`=14775;

UPDATE `creature_template` SET `modelid_3`=14799 WHERE `entry`=14775;

UPDATE `creature_template` SET `modelid_4`=14798 WHERE `entry`=14775;

UPDATE `creature_template` SET `modelid_2`=14799 WHERE `entry`=14776;

UPDATE `creature_template` SET `modelid_3`=14798 WHERE `entry`=14776;

UPDATE `creature_template` SET `modelid_4`=14800 WHERE `entry`=14776;

UPDATE `creature_template` SET `modelid_2`=14799 WHERE `entry`=14777;

UPDATE `creature_template` SET `modelid_3`=14798 WHERE `entry`=14777;

UPDATE `creature_template` SET `modelid_4`=14800 WHERE `entry`=14777;

UPDATE `creature_template` SET `modelid_3`=14982 WHERE `entry`=14825;

UPDATE `creature_template` SET `modelid_4`=14984 WHERE `entry`=14825;

UPDATE `creature_template` SET `modelid_2`=14941 WHERE `entry`=14869;

UPDATE `creature_template` SET `modelid_3`=14942 WHERE `entry`=14869;

UPDATE `creature_template` SET `modelid_2`=14999 WHERE `entry`=14876;

UPDATE `creature_template` SET `modelid_3`=15000 WHERE `entry`=14876;

UPDATE `creature_template` SET `modelid_4`=15001 WHERE `entry`=14876;

UPDATE `creature_template` SET `modelid_3`=9829 WHERE `entry`=14881;

UPDATE `creature_template` SET `modelid_4`=14952 WHERE `entry`=14881;

UPDATE `creature_template` SET `modelid_3`=14978 WHERE `entry`=14882;

UPDATE `creature_template` SET `modelid_4`=14980 WHERE `entry`=14882;

UPDATE `creature_template` SET `modelid_3`=14974 WHERE `entry`=14883;

UPDATE `creature_template` SET `modelid_4`=14976 WHERE `entry`=14883;

UPDATE `creature_template` SET `modelid_2`=15240 WHERE `entry`=14990;

UPDATE `creature_template` SET `modelid_3`=15242 WHERE `entry`=14990;

UPDATE `creature_template` SET `modelid_2`=15252 WHERE `entry`=14991;

UPDATE `creature_template` SET `modelid_3`=15253 WHERE `entry`=14991;

UPDATE `creature_template` SET `modelid_4`=15254 WHERE `entry`=14991;

UPDATE `creature_template` SET `modelid_2`=15147 WHERE `entry`=15045;

UPDATE `creature_template` SET `modelid_3`=15149 WHERE `entry`=15045;

UPDATE `creature_template` SET `modelid_4`=15148 WHERE `entry`=15045;

UPDATE `creature_template` SET `modelid_2`=15154 WHERE `entry`=15046;

UPDATE `creature_template` SET `modelid_3`=15153 WHERE `entry`=15046;

UPDATE `creature_template` SET `modelid_4`=15155 WHERE `entry`=15046;

UPDATE `creature_template` SET `modelid_2`=15173 WHERE `entry`=15063;

UPDATE `creature_template` SET `modelid_3`=15174 WHERE `entry`=15063;

UPDATE `creature_template` SET `modelid_4`=15175 WHERE `entry`=15063;

UPDATE `creature_template` SET `modelid_2`=15177 WHERE `entry`=15064;

UPDATE `creature_template` SET `modelid_3`=15178 WHERE `entry`=15064;

UPDATE `creature_template` SET `modelid_4`=15179 WHERE `entry`=15064;

UPDATE `creature_template` SET `modelid_2`=15184 WHERE `entry`=15074;

UPDATE `creature_template` SET `modelid_3`=15185 WHERE `entry`=15074;

UPDATE `creature_template` SET `modelid_4`=15186 WHERE `entry`=15074;

UPDATE `creature_template` SET `modelid_2`=15188 WHERE `entry`=15075;

UPDATE `creature_template` SET `modelid_3`=15189 WHERE `entry`=15075;

UPDATE `creature_template` SET `modelid_4`=15190 WHERE `entry`=15075;

UPDATE `creature_template` SET `modelid_2`=15212 WHERE `entry`=15080;

UPDATE `creature_template` SET `modelid_3`=15211 WHERE `entry`=15080;

UPDATE `creature_template` SET `modelid_4`=15213 WHERE `entry`=15080;

UPDATE `creature_template` SET `modelid_2`=15193 WHERE `entry`=15086;

UPDATE `creature_template` SET `modelid_3`=15194 WHERE `entry`=15086;

UPDATE `creature_template` SET `modelid_4`=15195 WHERE `entry`=15086;

UPDATE `creature_template` SET `modelid_2`=15197 WHERE `entry`=15087;

UPDATE `creature_template` SET `modelid_3`=15198 WHERE `entry`=15087;

UPDATE `creature_template` SET `modelid_4`=15199 WHERE `entry`=15087;

UPDATE `creature_template` SET `modelid_2`=15202 WHERE `entry`=15088;

UPDATE `creature_template` SET `modelid_3`=15203 WHERE `entry`=15088;

UPDATE `creature_template` SET `modelid_2`=15208 WHERE `entry`=15089;

UPDATE `creature_template` SET `modelid_3`=15207 WHERE `entry`=15089;

UPDATE `creature_template` SET `modelid_4`=15209 WHERE `entry`=15089;

UPDATE `creature_template` SET `modelid_1`=11686 WHERE `entry`=15091;

UPDATE `creature_template` SET `modelid_2`=15256 WHERE `entry`=15102;

UPDATE `creature_template` SET `modelid_3`=15257 WHERE `entry`=15102;

UPDATE `creature_template` SET `modelid_4`=15258 WHERE `entry`=15102;

UPDATE `creature_template` SET `modelid_2`=15388 WHERE `entry`=15103;

UPDATE `creature_template` SET `modelid_3`=15260 WHERE `entry`=15103;

UPDATE `creature_template` SET `modelid_4`=15262 WHERE `entry`=15103;

UPDATE `creature_template` SET `modelid_2`=15248 WHERE `entry`=15105;

UPDATE `creature_template` SET `modelid_3`=15249 WHERE `entry`=15105;

UPDATE `creature_template` SET `modelid_4`=15250 WHERE `entry`=15105;

UPDATE `creature_template` SET `modelid_2`=15244 WHERE `entry`=15106;

UPDATE `creature_template` SET `modelid_3`=15245 WHERE `entry`=15106;

UPDATE `creature_template` SET `modelid_4`=15246 WHERE `entry`=15106;

UPDATE `creature_template` SET `modelid_3`=229 WHERE `entry`=15107;

UPDATE `creature_template` SET `modelid_4`=2325 WHERE `entry`=15107;

UPDATE `creature_template` SET `modelid_3`=15265 WHERE `entry`=15110;

UPDATE `creature_template` SET `modelid_4`=15266 WHERE `entry`=15110;

UPDATE `creature_template` SET `modelid_3`=568 WHERE `entry`=15111;

UPDATE `creature_template` SET `modelid_4`=1015 WHERE `entry`=15111;

UPDATE `creature_template` SET `modelid_2`=15223 WHERE `entry`=15113;

UPDATE `creature_template` SET `modelid_3`=15224 WHERE `entry`=15113;

UPDATE `creature_template` SET `modelid_4`=15225 WHERE `entry`=15113;

UPDATE `creature_template` SET `modelid_2`=15229 WHERE `entry`=15115;

UPDATE `creature_template` SET `modelid_3`=15230 WHERE `entry`=15115;

UPDATE `creature_template` SET `modelid_4`=15232 WHERE `entry`=15115;

UPDATE `creature_template` SET `modelid_3`=15286 WHERE `entry`=15128;

UPDATE `creature_template` SET `modelid_4`=15287 WHERE `entry`=15128;

UPDATE `creature_template` SET `modelid_3`=15282 WHERE `entry`=15130;

UPDATE `creature_template` SET `modelid_4`=15283 WHERE `entry`=15130;

UPDATE `creature_template` SET `modelid_2`=4035 WHERE `entry`=15136;

UPDATE `creature_template` SET `modelid_1`=5240 WHERE `entry`=15163;

UPDATE `creature_template` SET `modelid_2`=15301 WHERE `entry`=15163;

UPDATE `creature_template` SET `modelid_3`=15296 WHERE `entry`=15163;

UPDATE `creature_template` SET `modelid_4`=15297 WHERE `entry`=15163;

UPDATE `creature_template` SET `modelid_1`=11686 WHERE `entry`=15164;

UPDATE `creature_template` SET `modelid_3`=15305 WHERE `entry`=15184;

UPDATE `creature_template` SET `modelid_4`=15307 WHERE `entry`=15184;

UPDATE `creature_template` SET `modelid_3`=2897 WHERE `entry`=15201;

UPDATE `creature_template` SET `modelid_3`=15408 WHERE `entry`=15213;

UPDATE `creature_template` SET `modelid_4`=15410 WHERE `entry`=15213;

UPDATE `creature_template` SET `modelid_1`=11686 WHERE `entry`=15214;

UPDATE `creature_template` SET `modelid_1`=13069 WHERE `entry`=15221;

UPDATE `creature_template` SET `modelid_2`=13069 WHERE `entry`=15222;

UPDATE `creature_template` SET `modelid_2`=15403 WHERE `entry`=15260;

UPDATE `creature_template` SET `modelid_3`=15341 WHERE `entry`=15260;

UPDATE `creature_template` SET `modelid_4`=15342 WHERE `entry`=15260;

UPDATE `creature_template` SET `modelid_1`=15948 WHERE `entry`=15334;

UPDATE `creature_template` SET `modelid_1`=15465 WHERE `entry`=15343;

UPDATE `creature_template` SET `modelid_3`=4873 WHERE `entry`=15373;

UPDATE `creature_template` SET `modelid_3`=6945 WHERE `entry`=15375;

UPDATE `creature_template` SET `modelid_4`=6951 WHERE `entry`=15375;

UPDATE `creature_template` SET `modelid_2`=15496 WHERE `entry`=15414;

UPDATE `creature_template` SET `modelid_3`=15497 WHERE `entry`=15414;

UPDATE `creature_template` SET `modelid_4`=15498 WHERE `entry`=15414;

UPDATE `creature_template` SET `modelid_1`=7804 WHERE `entry`=15415;

UPDATE `creature_template` SET `modelid_2`=15488 WHERE `entry`=15421;

UPDATE `creature_template` SET `modelid_3`=15489 WHERE `entry`=15421;

UPDATE `creature_template` SET `modelid_4`=15490 WHERE `entry`=15421;

UPDATE `creature_template` SET `modelid_2`=15492 WHERE `entry`=15422;

UPDATE `creature_template` SET `modelid_3`=15493 WHERE `entry`=15422;

UPDATE `creature_template` SET `modelid_4`=15494 WHERE `entry`=15422;

UPDATE `creature_template` SET `modelid_2`=15428 WHERE `entry`=15423;

UPDATE `creature_template` SET `modelid_3`=15429 WHERE `entry`=15423;

UPDATE `creature_template` SET `modelid_4`=15430 WHERE `entry`=15423;

UPDATE `creature_template` SET `modelid_2`=13069 WHERE `entry`=15454;

UPDATE `creature_template` SET `modelid_2`=15690 WHERE `entry`=15473;

UPDATE `creature_template` SET `modelid_3`=15691 WHERE `entry`=15473;

UPDATE `creature_template` SET `modelid_4`=15692 WHERE `entry`=15473;

UPDATE `creature_template` SET `modelid_2`=8971 WHERE `entry`=15475;

UPDATE `creature_template` SET `modelid_3`=15467 WHERE `entry`=15475;

UPDATE `creature_template` SET `modelid_4`=15468 WHERE `entry`=15475;

UPDATE `creature_template` SET `modelid_2`=5905 WHERE `entry`=15476;

UPDATE `creature_template` SET `modelid_3`=15469 WHERE `entry`=15476;

UPDATE `creature_template` SET `modelid_4`=15470 WHERE `entry`=15476;

UPDATE `creature_template` SET `modelid_2`=11775 WHERE `entry`=15495;

UPDATE `creature_template` SET `modelid_3`=11776 WHERE `entry`=15495;

UPDATE `creature_template` SET `modelid_4`=11777 WHERE `entry`=15495;

UPDATE `creature_template` SET `modelid_2`=15306 WHERE `entry`=15545;

UPDATE `creature_template` SET `modelid_2`=15560 WHERE `entry`=15591;

UPDATE `creature_template` SET `modelid_3`=15558 WHERE `entry`=15591;

UPDATE `creature_template` SET `modelid_3`=15572 WHERE `entry`=15616;

UPDATE `creature_template` SET `modelid_3`=15579 WHERE `entry`=15617;

UPDATE `creature_template` SET `modelid_4`=15578 WHERE `entry`=15617;

UPDATE `creature_template` SET `modelid_2`=15596 WHERE `entry`=15663;

UPDATE `creature_template` SET `modelid_3`=15597 WHERE `entry`=15663;

UPDATE `creature_template` SET `modelid_4`=15599 WHERE `entry`=15663;

UPDATE `creature_template` SET `modelid_3`=6951 WHERE `entry`=15685;

UPDATE `creature_template` SET `modelid_4`=6954 WHERE `entry`=15685;

UPDATE `creature_template` SET `modelid_3`=7790 WHERE `entry`=15692;

UPDATE `creature_template` SET `modelid_4`=7792 WHERE `entry`=15692;

UPDATE `creature_template` SET `modelid_2`=15652 WHERE `entry`=15696;

UPDATE `creature_template` SET `modelid_3`=15651 WHERE `entry`=15696;

UPDATE `creature_template` SET `modelid_4`=15653 WHERE `entry`=15696;

UPDATE `creature_template` SET `modelid_2`=7103 WHERE `entry`=15724;

UPDATE `creature_template` SET `modelid_3`=7104 WHERE `entry`=15724;

UPDATE `creature_template` SET `modelid_3`=15804 WHERE `entry`=15729;

UPDATE `creature_template` SET `modelid_4`=15805 WHERE `entry`=15729;

UPDATE `creature_template` SET `modelid_2`=15708 WHERE `entry`=15731;

UPDATE `creature_template` SET `modelid_2`=15711 WHERE `entry`=15733;

UPDATE `creature_template` SET `modelid_2`=15714 WHERE `entry`=15734;

UPDATE `creature_template` SET `modelid_2`=15718 WHERE `entry`=15735;

UPDATE `creature_template` SET `modelid_2`=15717 WHERE `entry`=15736;

UPDATE `creature_template` SET `modelid_2`=15702 WHERE `entry`=15737;

UPDATE `creature_template` SET `modelid_2`=15723 WHERE `entry`=15738;

UPDATE `creature_template` SET `modelid_2`=15721 WHERE `entry`=15739;

UPDATE `creature_template` SET `modelid_3`=6633 WHERE `entry`=15749;

UPDATE `creature_template` SET `modelid_4`=7350 WHERE `entry`=15749;

UPDATE `creature_template` SET `modelid_3`=6633 WHERE `entry`=15752;

UPDATE `creature_template` SET `modelid_4`=7350 WHERE `entry`=15752;

UPDATE `creature_template` SET `modelid_3`=6633 WHERE `entry`=15756;

UPDATE `creature_template` SET `modelid_4`=7350 WHERE `entry`=15756;

UPDATE `creature_template` SET `modelid_3`=6633 WHERE `entry`=15759;

UPDATE `creature_template` SET `modelid_4`=7350 WHERE `entry`=15759;

UPDATE `creature_template` SET `modelid_2`=1520 WHERE `entry`=15760;

UPDATE `creature_template` SET `modelid_3`=6633 WHERE `entry`=15808;

UPDATE `creature_template` SET `modelid_4`=7350 WHERE `entry`=15808;

UPDATE `creature_template` SET `modelid_3`=6633 WHERE `entry`=15811;

UPDATE `creature_template` SET `modelid_4`=7350 WHERE `entry`=15811;

UPDATE `creature_template` SET `modelid_3`=15808 WHERE `entry`=15832;

UPDATE `creature_template` SET `modelid_4`=15809 WHERE `entry`=15832;

UPDATE `creature_template` SET `modelid_2`=15800 WHERE `entry`=15835;

UPDATE `creature_template` SET `modelid_3`=15801 WHERE `entry`=15835;

UPDATE `creature_template` SET `modelid_4`=15802 WHERE `entry`=15835;

UPDATE `creature_template` SET `modelid_3`=15797 WHERE `entry`=15838;

UPDATE `creature_template` SET `modelid_4`=15798 WHERE `entry`=15838;

UPDATE `creature_template` SET `modelid_2`=15810 WHERE `entry`=15839;

UPDATE `creature_template` SET `modelid_3`=15851 WHERE `entry`=15853;

UPDATE `creature_template` SET `modelid_4`=15852 WHERE `entry`=15853;

UPDATE `creature_template` SET `modelid_3`=15853 WHERE `entry`=15854;

UPDATE `creature_template` SET `modelid_4`=15854 WHERE `entry`=15854;

UPDATE `creature_template` SET `modelid_3`=15856 WHERE `entry`=15855;

UPDATE `creature_template` SET `modelid_4`=15857 WHERE `entry`=15855;

UPDATE `creature_template` SET `modelid_2`=15830 WHERE `entry`=15856;

UPDATE `creature_template` SET `modelid_3`=15858 WHERE `entry`=15858;

UPDATE `creature_template` SET `modelid_4`=15859 WHERE `entry`=15858;

UPDATE `creature_template` SET `modelid_2`=15834 WHERE `entry`=15859;

UPDATE `creature_template` SET `modelid_3`=15690 WHERE `entry`=15860;

UPDATE `creature_template` SET `modelid_4`=15692 WHERE `entry`=15860;

UPDATE `creature_template` SET `modelid_3`=15849 WHERE `entry`=15861;

UPDATE `creature_template` SET `modelid_4`=15850 WHERE `entry`=15861;

UPDATE `creature_template` SET `modelid_3`=15837 WHERE `entry`=15862;

UPDATE `creature_template` SET `modelid_4`=15839 WHERE `entry`=15862;

UPDATE `creature_template` SET `modelid_2`=15876 WHERE `entry`=15891;

UPDATE `creature_template` SET `modelid_3`=15875 WHERE `entry`=15891;

UPDATE `creature_template` SET `modelid_4`=15877 WHERE `entry`=15891;

UPDATE `creature_template` SET `modelid_2`=15873 WHERE `entry`=15892;

UPDATE `creature_template` SET `modelid_3`=15872 WHERE `entry`=15892;

UPDATE `creature_template` SET `modelid_4`=15874 WHERE `entry`=15892;

UPDATE `creature_template` SET `modelid_1`=15880 WHERE `entry`=15902;

UPDATE `creature_template` SET `modelid_3`=15863 WHERE `entry`=15917;

UPDATE `creature_template` SET `modelid_4`=15876 WHERE `entry`=15917;

UPDATE `creature_template` SET `modelid_1`=358 WHERE `entry`=15925;

UPDATE `creature_template` SET `modelid_1`=15294 WHERE `entry`=15957;

UPDATE `creature_template` SET `modelid_2`=15305 WHERE `entry`=15961;

UPDATE `creature_template` SET `modelid_3`=15306 WHERE `entry`=15961;

UPDATE `creature_template` SET `modelid_4`=15307 WHERE `entry`=15961;

UPDATE `creature_template` SET `modelid_2`=16595 WHERE `entry`=15980;

UPDATE `creature_template` SET `modelid_3`=16596 WHERE `entry`=15980;

UPDATE `creature_template` SET `modelid_4`=16597 WHERE `entry`=15980;

UPDATE `creature_template` SET `modelid_2`=16599 WHERE `entry`=15981;

UPDATE `creature_template` SET `modelid_3`=16600 WHERE `entry`=15981;

UPDATE `creature_template` SET `modelid_4`=16601 WHERE `entry`=15981;

UPDATE `creature_template` SET `modelid_2`=15999 WHERE `entry`=16066;

UPDATE `creature_template` SET `modelid_3`=9905 WHERE `entry`=16068;

UPDATE `creature_template` SET `modelid_4`=15983 WHERE `entry`=16068;

UPDATE `creature_template` SET `modelid_1`=11686 WHERE `entry`=16079;

UPDATE `creature_template` SET `modelid_2`=15999 WHERE `entry`=16093;

UPDATE `creature_template` SET `modelid_2`=7102 WHERE `entry`=16096;

UPDATE `creature_template` SET `modelid_3`=11375 WHERE `entry`=16096;

UPDATE `creature_template` SET `modelid_1`=11686 WHERE `entry`=16100;

UPDATE `creature_template` SET `modelid_1`=158 WHERE `entry`=16119;

UPDATE `creature_template` SET `modelid_2`=15305 WHERE `entry`=16139;

UPDATE `creature_template` SET `modelid_3`=15306 WHERE `entry`=16139;

UPDATE `creature_template` SET `modelid_4`=15307 WHERE `entry`=16139;

UPDATE `creature_template` SET `modelid_1`=10553 WHERE `entry`=16164;

UPDATE `creature_template` SET `modelid_3`=14547 WHERE `entry`=16225;

UPDATE `creature_template` SET `modelid_4`=14549 WHERE `entry`=16225;

UPDATE `creature_template` SET `modelid_3`=16094 WHERE `entry`=16228;

UPDATE `creature_template` SET `modelid_4`=16096 WHERE `entry`=16228;

UPDATE `creature_template` SET `modelid_2`=16078 WHERE `entry`=16229;

UPDATE `creature_template` SET `modelid_2`=14547 WHERE `entry`=16232;

UPDATE `creature_template` SET `modelid_3`=14551 WHERE `entry`=16232;

UPDATE `creature_template` SET `modelid_4`=14549 WHERE `entry`=16232;

UPDATE `creature_template` SET `modelid_2`=16107 WHERE `entry`=16284;

UPDATE `creature_template` SET `modelid_2`=10975 WHERE `entry`=16360;

UPDATE `creature_template` SET `modelid_3`=5432 WHERE `entry`=16360;

UPDATE `creature_template` SET `modelid_4`=5265 WHERE `entry`=16360;

UPDATE `creature_template` SET `modelid_2`=16161 WHERE `entry`=16368;

UPDATE `creature_template` SET `modelid_2`=857 WHERE `entry`=16372;

UPDATE `creature_template` SET `modelid_3`=16148 WHERE `entry`=16378;

UPDATE `creature_template` SET `modelid_4`=16150 WHERE `entry`=16378;

UPDATE `creature_template` SET `modelid_2`=5446 WHERE `entry`=16396;

UPDATE `creature_template` SET `modelid_2`=2558 WHERE `entry`=16399;

UPDATE `creature_template` SET `modelid_1`=14710 WHERE `entry`=16446;

UPDATE `creature_template` SET `modelid_2`=16606 WHERE `entry`=16505;

UPDATE `creature_template` SET `modelid_2`=16604 WHERE `entry`=16506;

UPDATE `creature_template` SET `modelid_1`=11686 WHERE `entry`=16592;

UPDATE `creature_template` SET `modelid_3`=16431 WHERE `entry`=16781;

UPDATE `creature_template` SET `modelid_4`=16432 WHERE `entry`=16781;

UPDATE `creature_template` SET `modelid_1`=681 WHERE `entry`=16784;

UPDATE `creature_template` SET `modelid_3`=16338 WHERE `entry`=16788;

UPDATE `creature_template` SET `modelid_4`=16339 WHERE `entry`=16788;

UPDATE `creature_template` SET `modelid_2`=16438 WHERE `entry`=17041;

UPDATE `creature_template` SET `modelid_3`=16445 WHERE `entry`=17041;

UPDATE `creature_template` SET `modelid_4`=16446 WHERE `entry`=17041;

UPDATE `creature_template` SET `modelid_2`=16413 WHERE `entry`=17048;

UPDATE `creature_template` SET `modelid_3`=16447 WHERE `entry`=17048;

UPDATE `creature_template` SET `modelid_4`=16448 WHERE `entry`=17048;

UPDATE `creature_template` SET `modelid_2`=16435 WHERE `entry`=17049;

UPDATE `creature_template` SET `modelid_2`=16446 WHERE `entry`=17050;

UPDATE `creature_template` SET `modelid_2`=16444 WHERE `entry`=17051;

UPDATE `creature_template` SET `modelid_1`=11686 WHERE `entry`=17231;

UPDATE `creature_template` SET `modelid_1`=11686 WHERE `entry`=17689;

UPDATE `creature_template` SET `modelid_1`=11686 WHERE `entry`=17690;

UPDATE `creature_template` SET `modelid_1`=11686 WHERE `entry`=17696;

UPDATE `creature_template` SET `modelid_1`=11686 WHERE `entry`=17698;

UPDATE `creature_template` SET `modelid_2`=1608 WHERE `entry`=17765;

UPDATE `creature_template` SET `modelid_2`=7118 WHERE `entry`=17766;

UPDATE `creature_template` SET `modelid_2`=16925 WHERE `entry`=17794;

UPDATE `creature_template` SET `modelid_2`=16925 WHERE `entry`=17795;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
