DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260128221951');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260128221951');
-- Add your query below.

-- miscellanous
INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (537, 125);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (555, 38);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (556, 1169);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (755, 2005);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (770, 316);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (771, 185);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (777, 126);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (779, 42);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (887, 113);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (893, 216);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1074, 493);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1175, 124);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1212, 103);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1464, 40);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1476, 36);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1520, 39);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1630, 49);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1686, 732);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1687, 308);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1688, 817);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1696, 695);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1697, 341);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1701, 416);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1702, 464);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1706, 127);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2085, 3325);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2295, 196);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2590, 199);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2591, 11);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2608, 124);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2725, 1083);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2728, 778);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2730, 509);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2732, 428);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2734, 1261);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2735, 479);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2738, 2599);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2740, 652);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2742, 1299);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2744, 482);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2745, 492);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2748, 2983);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2749, 148900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2750, 542);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2751, 631);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2940, 44);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3010, 102);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3167, 130);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3169, 108);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3170, 141);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3171, 6);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3175, 491);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3176, 369);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3177, 297);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3179, 4196);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3180, 235);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3181, 109);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3299, 31);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3300, 1030);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3301, 102);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3399, 468);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3401, 4165);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3402, 534);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3403, 628);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3669, 195);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3670, 153);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3671, 260);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3673, 35);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3674, 140);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3676, 114);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3702, 697);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3722, 133);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3724, 134);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3725, 416);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3766, 149);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3769, 2667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3882, 200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3899, 28767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3931, 276);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4092, 1279);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4093, 715);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4096, 604);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4097, 307);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4099, 1192);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4100, 683);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4101, 1467);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4102, 19900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4428, 266);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4459, 250000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4460, 770);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4552, 530);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4553, 576);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4554, 993);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4555, 155);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4556, 928);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4557, 395);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4558, 2970);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4580, 1157);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4581, 2915);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4582, 650);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4583, 811);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4584, 942);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4585, 489);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4586, 877);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4587, 1033);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4588, 1599);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4589, 1594);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4590, 990);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4757, 10033);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4775, 14);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4776, 115);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4780, 100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4784, 360);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4787, 592);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4813, 352);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4814, 10);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4860, 1259);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4865, 12);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4867, 11);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4872, 47);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4873, 36);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4874, 2067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4875, 500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4876, 221);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4877, 152);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4878, 233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4879, 10);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4880, 8233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5052, 2583);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5113, 459);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5114, 48);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5115, 262);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5117, 835);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5118, 199);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5119, 200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5120, 1499);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5121, 1996);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5122, 1800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5123, 132);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5124, 194);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5125, 120);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5128, 272);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5133, 365);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5134, 46);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5135, 226);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5136, 288);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5137, 325);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5263, 5094);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5268, 336);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5269, 221);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5329, 5999);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5362, 5000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5363, 112);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5364, 167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5367, 103);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5368, 138);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5369, 167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5371, 7);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5373, 1876);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5374, 860);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5375, 467);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5376, 400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5427, 673);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5428, 836);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5429, 1009900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5430, 1317);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5431, 2400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5432, 5000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5433, 50500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5435, 1295);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5506, 122);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5566, 150);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5567, 893400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5569, 291);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5601, 16);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5602, 235);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5741, 111);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5829, 1134);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5839, 110633);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5871, 6274);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6150, 142);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6292, 24);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6293, 123);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6294, 1106);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6295, 4895);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6296, 100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6297, 50);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6298, 1732);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6300, 1288);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6301, 99500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6302, 899);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6309, 175);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6310, 164);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6311, 861);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6363, 10000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6438, 648);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6439, 452);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6444, 228);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6445, 192);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6457, 2200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6712, 1615);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6826, 643);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7073, 11);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7074, 20);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7096, 4894);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7098, 24);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7100, 15);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7101, 7);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7286, 22);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7287, 225);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7296, 799);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7392, 2195);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8154, 1908);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8165, 3050);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8383, 367);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8429, 27);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8430, 227);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8483, 1089);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9242, 7810);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9259, 1133);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9261, 3992);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9327, 615);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9332, 142);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9334, 175);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9335, 194);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9336, 4808);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9355, 7498);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9356, 733233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9357, 1088);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9358, 9616);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10457, 2404);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10839, 1733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10840, 1766);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11018, 622);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11184, 4655);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11185, 1171);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11186, 836);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11188, 1970);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11384, 117);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11385, 494);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11386, 990);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11387, 1145);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11388, 1550);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11389, 15733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11390, 173);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11391, 313);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11392, 1201);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11393, 1857);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11394, 2320);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11395, 5000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11402, 13867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11403, 2535);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11404, 6123);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11406, 221);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11407, 1921);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11408, 1198);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11409, 641);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11410, 1444);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11414, 6693);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11416, 497);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11417, 4718);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11418, 1195);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11419, 3218);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11420, 7500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11754, 885);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11939, 2505);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11940, 1452);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11941, 21933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11942, 20833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11943, 99967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5448, 10);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12607, 7859);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12731, 1901533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13364, 33333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13366, 44767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13545, 839);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13876, 3040);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13877, 501233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13878, 1874);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13882, 50000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13883, 167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13885, 1488);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13886, 1997);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13901, 2495);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13902, 9997);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13903, 1500000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13914, 999900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15408, 1113);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15410, 21067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15412, 788);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15414, 21267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15415, 916);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15416, 3098);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15793, 138817);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16645, 401);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16646, 439);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16647, 429);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16648, 112);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16649, 103);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16650, 113);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16651, 138);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16652, 299);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16653, 37);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16654, 46);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16655, 117);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16656, 352);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16747, 124);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16748, 112);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17056, 528);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17057, 3);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17058, 146);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17195, 857);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5446, 10033);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18222, 1279);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18223, 4805);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18224, 892);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18227, 1000000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18229, 66500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18231, 4999900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18233, 90033);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18234, 10000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18236, 8093);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18237, 23900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18285, 4558);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18286, 2952);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18335, 15300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18356, 299800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18357, 68467);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18358, 3987);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18359, 1499900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18360, 26900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18361, 28133);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18362, 37533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18363, 699900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18364, 34900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18365, 1924);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18401, 2256667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18664, 9997450);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18675, 675);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18945, 132);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19227, 2159567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19228, 994214);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19230, 12500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19231, 12600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19232, 13900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19233, 12467);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19234, 12800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19235, 12533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19236, 12533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19257, 235643);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19258, 38833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19259, 66667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19260, 124167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19261, 12033);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19262, 19400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19263, 27133);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19264, 13600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19265, 19467);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19267, 299907);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19268, 119167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19269, 56400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19270, 13600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19271, 13867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19272, 99900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19273, 17567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19274, 12533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19275, 14100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19276, 2515067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19277, 996350);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19278, 20600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19279, 13300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19280, 25733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19281, 18800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19282, 12267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19283, 19433);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19284, 19000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19483, 19000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19484, 9792);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19813, 5499);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19814, 1522);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19815, 116967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19816, 1186);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19817, 93700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19818, 68800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19819, 1100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19820, 1677);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19821, 990);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19933, 2121);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19934, 1497);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19935, 9692);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19936, 870);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19937, 924);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19938, 584);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19978, 925);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20015, 2129);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20016, 10200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20030, 750000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20381, 31033);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20416, 86987);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20418, 106497);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20419, 40044);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20420, 398525);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20422, 104400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20432, 612990);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20433, 70945);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20435, 226200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20436, 263476);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20447, 213411);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20448, 4270948);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20449, 338500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20450, 656382);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20451, 700333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20498, 1347);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20499, 636);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20500, 2171);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20501, 48700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20513, 17067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20514, 156467);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20515, 554633);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20518, 8797);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20526, 8994);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20527, 25500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20528, 36000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20531, 749900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20532, 18567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20533, 53400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20535, 79900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20540, 404300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20541, 3995);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20542, 2500000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20543, 400000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20544, 118900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20545, 1423);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20552, 7493);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20763, 875);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20770, 684);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21222, 5165);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21223, 11233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21224, 12700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21225, 12900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21226, 33200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21816, 833233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21817, 299900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21818, 199900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21819, 756667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21820, 1193);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21821, 966);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21822, 799900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21823, 888800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21830, 8888596);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21939, 504925);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22373, 507);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22374, 743);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22375, 125333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22376, 6620);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22525, 944);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22526, 529);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22527, 7);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22528, 18);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22529, 1534);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22600, 8166);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22601, 5300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22602, 6683);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22603, 7499);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22604, 6999);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22605, 19900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22606, 22733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22607, 6234);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22608, 9697);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22609, 250);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22610, 13367);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22611, 10000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22612, 6066);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22613, 44766);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22614, 23933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22615, 37667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22616, 23233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22617, 10000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22618, 18333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22620, 4046);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22621, 26600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22622, 10000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22623, 90267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22624, 28333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (23055, 59967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (24231, 257);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (24232, 1078);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (24282, 7133);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (24283, 185700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5447, 10033);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5451, 5012);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2798, 1882);

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;