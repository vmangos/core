DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260128222534');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260128222534');
-- Add your query below.

-- recipes
INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (728, 166);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2406, 24);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2407, 272);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2408, 123);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2409, 265);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2553, 631);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2555, 1729);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2598, 14);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2601, 346);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2697, 588);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2698, 442);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2699, 1374);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2700, 4250);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2701, 2047);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2881, 193);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2882, 292);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2883, 363);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2889, 2552);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3393, 872);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3394, 1199);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3395, 1328);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3396, 4497);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3608, 366);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3609, 10);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3610, 152);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3611, 534);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3612, 680);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3678, 2020);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3679, 1309);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3680, 1133);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3681, 2142);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3682, 1801);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3683, 1803);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3734, 1613);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3735, 2503);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3736, 4575);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3737, 6841);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3830, 550);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3831, 782);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3832, 916);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3866, 1006);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3867, 982);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3868, 1146);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3869, 1218);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3870, 1114);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3871, 1826);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3872, 993);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3873, 1040);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3874, 1073);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3875, 33567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4292, 201);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4293, 163);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4294, 282);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4296, 7691);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4297, 473);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4298, 1007);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4299, 491);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4300, 695);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4301, 100000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4345, 121);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4346, 111);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4347, 251);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4348, 192);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4349, 174);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4350, 224);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4351, 3895);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4352, 329);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4353, 397);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4354, 3096);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4355, 5608);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4356, 69900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4408, 201);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4409, 173);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4410, 262);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4411, 753333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4412, 560);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4413, 2433333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4414, 497);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4415, 6898);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4416, 854);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4417, 903);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4597, 8913);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4609, 2349);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4624, 23567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5083, 1900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5482, 47967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5483, 3334);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5484, 5060);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5485, 44875);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5486, 2376);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5487, 133300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5488, 3050);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5489, 41800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5528, 10500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5543, 340);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5578, 304);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5640, 1424);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5642, 3292);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5643, 5748);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5771, 126);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5772, 1436);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5773, 30633);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5774, 270);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5775, 1837);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5786, 346);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5787, 301);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5788, 14225);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5789, 2928);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5972, 599);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5973, 1324);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5974, 362);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6039, 13838);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6044, 501);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6045, 726);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6046, 96900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6047, 33575);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6053, 10200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6054, 6807);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6055, 7166);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6056, 7248);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6057, 15575);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6068, 3069);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6211, 579);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20758, 1874);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6270, 19717);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6271, 296);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6272, 5171);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6274, 3650);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6275, 2817);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6325, 5050);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6326, 7414);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6328, 3804);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6329, 20100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6330, 3134);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20755, 22975);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20753, 7374);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6368, 6475);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6369, 43050);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6390, 144);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6391, 156);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6401, 7252);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6454, 2020);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6474, 13000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6475, 14050);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6476, 1363);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6661, 9716);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6663, 36667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6672, 350000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6710, 647);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6716, 254);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6735, 13292);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6892, 6487);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7084, 471);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7085, 365);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7086, 362);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7087, 5061);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7088, 8185);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7089, 10475);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7090, 323);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7091, 305);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7092, 390);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7114, 15200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7288, 236);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7289, 37400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7290, 50900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7360, 643);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7361, 14500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7362, 110833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7363, 383);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7364, 547);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7449, 629);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7450, 874);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7451, 5602);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7452, 7965);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7453, 727);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7560, 15990);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7561, 3815);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7613, 15575);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7742, 23275);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7975, 1500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7976, 2097);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7978, 16000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7979, 466667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7980, 716667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7981, 383333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7982, 383333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7989, 3797);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7990, 2499);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7991, 9991);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7992, 1995);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7993, 2500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7995, 28850);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8028, 2597);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8384, 26500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8385, 1582);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8386, 1244);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8387, 1073);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8389, 1054);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8390, 1246);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8395, 1275);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8397, 981);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8398, 1849);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8399, 1401);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8400, 1314);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8401, 1848);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8402, 2587);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8409, 25383);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9293, 1694);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9294, 2384);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9295, 1996);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9296, 16600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9297, 15300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9298, 2406);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9300, 24800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9301, 14850);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9302, 19250);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9303, 16700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9304, 25275);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9305, 9423);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9367, 1250000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10300, 1393);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10301, 1298);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10302, 805);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10311, 13675);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10312, 1503);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10314, 15525);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10315, 1912);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10316, 247);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10317, 11600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10318, 6996);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10320, 1068);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10321, 12100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10323, 17700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10325, 20900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10326, 23400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10424, 703);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10463, 98333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10601, 1163);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10602, 12625);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10603, 830);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10604, 4069);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10605, 1466);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10606, 1229);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10607, 26950);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10608, 3235);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10609, 91442);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10644, 1875);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10713, 5506);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10728, 5723);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10858, 7573);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16253, 7250000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16251, 7445);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17725, 3416667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16255, 9597);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16254, 3999067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16252, 4269867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16250, 54000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16249, 596667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16248, 89900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16247, 28233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16246, 1399900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16245, 5094);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16244, 37400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16243, 20000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16242, 316667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16224, 21250);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16223, 384567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16222, 121333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16218, 3506);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16216, 79733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16215, 3008);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16214, 398333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11610, 6938);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11611, 3000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11612, 13967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11813, 9965);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12162, 6932);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12163, 46125);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12164, 37375);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12226, 3338);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12227, 477217);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12228, 6250);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12229, 19167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12231, 6086);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12232, 23250);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12233, 20750);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12239, 14688);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12240, 22325);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12261, 25500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12682, 2997);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12683, 2996);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12684, 2871);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12685, 5815);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12689, 8944);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12691, 3911);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12692, 5049);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12693, 5002);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12694, 4999);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12695, 6444);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12697, 6658);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12702, 6249);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12703, 140000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12704, 7295);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12711, 9998);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12713, 9949);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12716, 2999900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12717, 200800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12720, 36667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12728, 39900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12821, 24900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12824, 14900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12825, 44400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12827, 5097);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12828, 99900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12830, 14683);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12833, 21500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12834, 166667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12835, 25333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12836, 90000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12837, 59900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12838, 199900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12839, 25900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12958, 74675);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13287, 477517);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13288, 42200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13308, 46625);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13309, 95625);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13310, 15665);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13311, 20200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13476, 38033);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13477, 19875);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13478, 20725);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13479, 42567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13480, 20650);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13481, 17000000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13486, 7826);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13487, 5361);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13488, 16300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13489, 6356);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13490, 3864);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13491, 7015);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13492, 4432);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13493, 16733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13494, 472933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13495, 9998);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13496, 175833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13497, 9366);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13499, 199533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13518, 12833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13519, 13446067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13520, 6881100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13521, 19496567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13522, 3749900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13939, 20275);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13940, 28025);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13941, 32975);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13942, 18325);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13943, 25825);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13945, 41000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13946, 23300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13947, 22025);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13948, 27500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13949, 35575);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14466, 2997);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14467, 2855);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14468, 15800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14469, 68075);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14470, 3368);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14471, 39400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14473, 4999);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14474, 3000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14476, 22567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14477, 7031);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14478, 3497);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14479, 4751);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14480, 300000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14481, 20650);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14482, 55067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14483, 18125);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14484, 4004);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14485, 240000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14488, 25775);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14489, 4817);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14490, 39900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14491, 4915);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14492, 4995);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14494, 5501);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14495, 49900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14496, 5491);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14497, 7897);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14498, 6247);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14499, 7496);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14500, 193900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14501, 9896);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14504, 9865);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14505, 184400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14506, 14233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14507, 10800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14508, 14667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14509, 213767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14510, 9995000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14511, 709800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14526, 48975);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14627, 27300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14630, 51350);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14634, 45675);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14635, 38175);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14639, 14250);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16221, 37125);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15724, 46975);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15725, 24075);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15726, 16067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15728, 4099);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15729, 47925);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15731, 3329);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15732, 3399);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15733, 7755);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15734, 17232);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15735, 67600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15737, 393);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15738, 15333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15739, 8149);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15740, 13875);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15741, 19015);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15742, 22100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15743, 5085);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15744, 12233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15745, 5014);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15746, 5038);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15747, 4924);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15748, 5097);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15749, 4998);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15751, 42425);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15752, 4997);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15753, 50567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15755, 5164);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15756, 26225);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15757, 5054);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15758, 27700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15759, 54175);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15760, 6866);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15761, 6285);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15762, 366075);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15763, 9525);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15764, 2000000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15765, 15341);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15768, 19633);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15770, 27663);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15771, 148500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15772, 22333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15773, 21400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15774, 13233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15775, 9998);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15776, 12333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15777, 119900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15779, 17833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15781, 29900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16041, 30800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16042, 38550);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16043, 3058);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16044, 5540);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16045, 10000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16046, 88550);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16047, 25325);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16048, 48067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16049, 381633);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16050, 36875);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16051, 5795);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16052, 17400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16053, 31400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16054, 86467);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16055, 6992);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16056, 49700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16072, 13300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16083, 11550);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16084, 15267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16110, 30450);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16111, 27975);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16112, 4039);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16113, 6629);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11224, 12633);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11223, 18800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11207, 358933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11206, 22900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11205, 13133);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11204, 3064);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11203, 27133);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11202, 13883);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11168, 79900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11167, 979);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11166, 2197);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11165, 789);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11164, 734);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11163, 12075);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11152, 1494);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11151, 91767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11150, 6667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16767, 26075);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17062, 6931);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17200, 41279);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17201, 40257);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17413, 7749);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17414, 14100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17682, 16333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17683, 14866);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17706, 997067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17709, 2713233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17720, 250400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17722, 149900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17724, 155400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21723, 762333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18046, 31325);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18239, 8374);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18257, 973400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11101, 6709);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11098, 8705);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18265, 89533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18414, 2833267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18487, 69925);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18517, 365533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18518, 7833267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18519, 1249900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18592, 1449900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18600, 14333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18647, 5250);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18648, 12650);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18649, 12212);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18650, 15962);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18651, 27075);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18652, 28700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18653, 78233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18654, 4708);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18655, 18600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18656, 40150);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18657, 1845767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18658, 183133);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18661, 3497);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18731, 16625);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18949, 15175);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11081, 266);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11039, 396);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11038, 391);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20075, 34625);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20546, 84267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20547, 396267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20548, 119000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20553, 38900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20554, 34833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20555, 37500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20576, 27700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6377, 13800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6375, 294);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6349, 5498);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6348, 135);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6347, 105);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6346, 36175);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6344, 118);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6342, 329);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21025, 6000000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21099, 14800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21214, 397967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21219, 4042);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21279, 142400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21280, 447900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21281, 172400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21282, 131567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21283, 173867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21284, 140967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21285, 149900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21287, 192933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21288, 288900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21289, 201467);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21290, 180500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21291, 137833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21292, 137400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21293, 144900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21294, 125800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21295, 124900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21296, 149900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21297, 153400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21298, 269900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21299, 209100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21300, 138900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21302, 225833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21303, 119900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21304, 197767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21306, 167100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21307, 194733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21358, 14175);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21371, 399500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21547, 6980);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21548, 874000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21722, 761833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21737, 194767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21738, 468000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22220, 40933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22222, 89800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22307, 5820);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22308, 35475);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22309, 2000000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22388, 467433);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22389, 129900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22390, 24433);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22393, 12833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22739, 387000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22890, 11800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22891, 11767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22897, 199900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (23320, 886600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (24101, 322733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (24102, 99567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20754, 16725);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20752, 25675);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14512, 53233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14513, 26100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14514, 30733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16220, 4042);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16219, 39900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11226, 3599);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11225, 2172);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11208, 2674);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12698, 389900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (985, 36900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1567, 61500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4144, 13879800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4158, 33933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5126, 63000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5127, 9766);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5129, 5798);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5130, 3395);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5131, 17500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5132, 5242);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5577, 10900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6273, 9998);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6734, 9683);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6736, 35200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7093, 6196);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7977, 15733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8388, 11433);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8881, 47133);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10303, 1392);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10304, 34900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10313, 843);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10319, 14800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10322, 5069);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10324, 3403);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12816, 25133);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12817, 25333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12826, 49100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12831, 68033);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12832, 2133267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13500, 38133);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15727, 11800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11733, 1770);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11736, 9266);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11737, 145933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18333, 23300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18334, 3845);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18332, 13484);

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;