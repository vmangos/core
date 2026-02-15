DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260128222639');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260128222639');
-- Add your query below.

-- trade goods
INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (723, 1067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (729, 37);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (730, 4);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (731, 117);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (732, 2);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (769, 11);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (774, 123);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (783, 24);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (814, 10);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (818, 116);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (878, 28);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1015, 33);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1080, 2369);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1081, 19);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1206, 3500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1210, 781);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1274, 2);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1288, 3422);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1468, 34);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1475, 108);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1529, 679);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1705, 1298);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2251, 24);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2296, 32);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12810, 20139);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2320, 5);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2321, 268);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2324, 125);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2325, 1749);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2589, 55);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2592, 400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2604, 169);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2605, 771);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2672, 20);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2673, 1937);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2674, 754);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2675, 120);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2677, 108);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2678, 4);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2692, 772);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2770, 634);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2771, 26);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2772, 606);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2775, 1146);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2776, 2626);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2835, 6);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2836, 210);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2838, 571);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2840, 632);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2841, 478);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2842, 1060);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2862, 14);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2863, 224);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2871, 528);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2880, 1900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2886, 23);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2924, 712);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2928, 125);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2934, 2);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2996, 124);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2997, 451);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3164, 27);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3172, 9);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3173, 36);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3174, 4);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3182, 382);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3239, 28);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3240, 434);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3241, 732);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3340, 15);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13467, 484);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13466, 725);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13465, 5292);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13464, 210);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13463, 6422);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3371, 220);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3372, 435);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3404, 246);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3466, 1924);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3470, 10);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3478, 1890);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3486, 3713);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3575, 835);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3576, 20);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3577, 2048);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3667, 244);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3685, 34);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3712, 251);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3713, 466);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3730, 28);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3731, 856);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3777, 3328);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11040, 2287);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8846, 10308);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3857, 266);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3858, 1944);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3859, 751);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3860, 2542);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3864, 2766);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4231, 197);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4232, 236);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4233, 286);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8170, 2454);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4235, 213);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4236, 919);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4289, 2839);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4291, 1248);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4305, 771);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4306, 325);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4337, 399);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4338, 387);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4339, 1697);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4340, 1537);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4341, 2299);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4342, 6250);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4357, 11);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4358, 514);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4359, 985);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4360, 1788);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4361, 879);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4363, 2582);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4364, 221);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4365, 777);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4366, 1700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4367, 6589);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4370, 2412);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4371, 557);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4374, 936);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4375, 1986);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4376, 29961);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4377, 792);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4378, 2049);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4380, 1662);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4381, 156990);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4382, 627);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4384, 3262);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4386, 71677);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4387, 551);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4388, 24540);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4389, 1125);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4390, 755);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4391, 4107);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4392, 29867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4394, 3691);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4395, 3775);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4396, 71067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4397, 52910);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4398, 14319);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4399, 949);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4400, 5250);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4401, 1229);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4402, 13000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4403, 4073);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4404, 1326);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4405, 808);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4406, 908);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4407, 19186);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4461, 163);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8845, 8821);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4655, 628);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4852, 3984);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8838, 175);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5082, 12);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8836, 192);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2930, 12);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5465, 2);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5466, 4);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5467, 5452);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5468, 1433);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5469, 6);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5470, 190);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5471, 368);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5498, 162);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5500, 1071);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5503, 12);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5504, 1887);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5507, 13806);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5635, 36);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5637, 565);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5784, 30);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5785, 833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5833, 25);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6037, 893);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6041, 21255);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6042, 16128);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6043, 5302);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6217, 1453);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6260, 469);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6261, 2125);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6338, 2493);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6533, 1545);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6714, 3322);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6889, 12);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6986, 8265);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6987, 11);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7148, 62435);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7191, 25067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7428, 2239);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7506, 18985);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7909, 1812);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7910, 6915);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7911, 1047);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7912, 1799);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7964, 1042);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7965, 729);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7966, 3376);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7967, 14645);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7969, 13808);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7971, 1304);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7974, 327);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8146, 350);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8150, 365);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8151, 241);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8152, 587);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8831, 516);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8167, 1035);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8169, 492);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4304, 693);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8171, 4166);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8172, 496);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8343, 4222);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8153, 742);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4625, 493);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3821, 406);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8924, 1953);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8925, 2099);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9149, 13064);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9210, 14440);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9262, 5222);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10576, 103627);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9719, 6473);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10285, 734);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10290, 10625);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10498, 2393);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10505, 1784);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10507, 2940);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10514, 36359);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10546, 23589);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10548, 19977);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10558, 1687);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10559, 1325);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10560, 3277);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10561, 1378);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10562, 14019);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10577, 38797);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10586, 18258);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10587, 55494);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10620, 524);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10645, 23668);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10646, 14257);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10647, 14250);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10648, 3274);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10716, 34420);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10720, 66966);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10725, 28900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10727, 60541);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11139, 6854);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20725, 43067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3820, 105);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3819, 124);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11083, 465);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11128, 12111);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11138, 10);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11144, 4072);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10940, 196);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11084, 340);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16207, 641250);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16204, 234);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16203, 33329);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16202, 16667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14344, 44602);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14343, 632);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11370, 3195);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11371, 33476);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11382, 447900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3818, 4415);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11590, 1752);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11825, 40890);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11826, 59476);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13468, 218600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12037, 213);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12184, 172);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12202, 297);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12203, 47);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12204, 4394);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12205, 179);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12206, 855);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12207, 400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12208, 218);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12223, 14);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12359, 731);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12360, 143531);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12361, 8499);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12363, 134933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12364, 13533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12365, 1336);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12404, 2020);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12643, 2340);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12644, 17121);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12645, 88221);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12655, 13334);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12799, 12333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12800, 67267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12804, 2309);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12809, 66333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12811, 60900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3369, 5473);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3358, 243);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3357, 244);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3356, 256);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3355, 4074);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13926, 85733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14047, 625);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14048, 2691);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14227, 6486);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14256, 67500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14341, 6986);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14342, 180729);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10978, 8);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15407, 135116);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15409, 121679);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4234, 301);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15419, 2464);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2319, 111);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15846, 22932);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15869, 921);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15870, 13189);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15871, 13558);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15872, 131212);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15992, 3567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15993, 19018);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15994, 2464);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15996, 14067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16000, 4506);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16005, 42772);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16006, 187820);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16022, 1199714);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16023, 25682);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16040, 127918);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2453, 16);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16206, 448088);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2452, 2026);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11178, 41033);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11177, 29406);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11176, 3235);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11175, 20109);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11174, 6846);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11145, 15462);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11137, 1469);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11135, 2506);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11134, 1673);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2450, 627);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2449, 6);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2447, 1);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17194, 145);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17203, 309900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17716, 1177659);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11130, 20377);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (785, 13);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17771, 1574840);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18232, 89752);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18256, 5250);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18262, 42601);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18283, 1485375);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (765, 8);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18562, 308000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18567, 156175);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18587, 149298);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18588, 2096);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18594, 37862);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18631, 44905);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18634, 291836);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18637, 135272);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18638, 772664);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18639, 797807);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18641, 16698);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18645, 138517);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18660, 63675);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19441, 8851);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11082, 2389);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5173, 246);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2318, 8);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19774, 4662);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19943, 3998);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20424, 3771);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20520, 28033);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10998, 1678);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10939, 875);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10938, 499);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20744, 683);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20745, 32402);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20746, 3909);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20747, 12921);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20748, 75039);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20749, 79523);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20750, 3278);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6339, 11867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6218, 659);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21024, 75167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21277, 190765);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22202, 4586);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22203, 42133);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22682, 22267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (23122, 29033);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (23123, 29100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17968, 106470);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15410, 21100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8839, 1824);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19726, 12217);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22728, 6447);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17967, 20900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15417, 39900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15422, 692);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15423, 675);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17012, 17067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19767, 6368);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19768, 1966);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2931, 1633);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8923, 219);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8368, 835);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10580, 5061);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10585, 13064);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10719, 12312);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10723, 13064);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13503, 985277);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6522, 1512);

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;