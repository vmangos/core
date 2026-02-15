DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260128221016');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260128221016');
-- Add your query below.

-- consumables inserts

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (117, 1);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (118, 5);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (159, 120);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (414, 6);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (422, 375);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (724, 113);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (733, 150);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (787, 2);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (858, 227);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (929, 250);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (954, 385);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (955, 732);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (961, 49);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1017, 260);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1082, 1461);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1177, 240);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1178, 318);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1179, 6);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1180, 140);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1181, 611);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1205, 113);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1326, 5);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1399, 8332);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1477, 3529);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1478, 3042);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1645, 236);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1703, 126);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1707, 229);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1708, 193);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1710, 435);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1711, 2070);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1712, 703);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3386, 14256);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2070, 1);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2091, 16519);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2287, 9);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2289, 2210);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2290, 2301);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2304, 8);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2313, 452);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2454, 123);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2455, 118);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2456, 121);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2457, 536);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2458, 123);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2459, 3796);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2593, 905);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2594, 1159);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2595, 2091);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2596, 1078);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2633, 498);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2679, 28);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2680, 122);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2681, 12);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2682, 14);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2683, 899);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2684, 1319);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2685, 204);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2686, 11);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2687, 121);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2723, 11);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2888, 25);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8926, 4422);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2894, 13);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3012, 746);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3013, 4798);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3087, 1000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3220, 121);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3382, 120);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3383, 377);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3384, 3448);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3385, 143);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3387, 14251);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3388, 626);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3389, 3769);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3390, 4194);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3391, 756);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3448, 15);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3662, 1030);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3663, 221);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3664, 195);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3665, 129);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3666, 123);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3703, 136);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3726, 137);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3727, 519);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3728, 973);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3729, 486);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3770, 123);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3771, 222);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6951, 339);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3823, 13044);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3824, 25020);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3825, 5568);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3826, 3243);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3827, 287);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3828, 2513);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3829, 2160);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3927, 212);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3928, 712);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4265, 2088);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4419, 2066);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4421, 857);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4422, 1954);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4424, 1049);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4425, 13373);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4426, 13379);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4457, 792);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4479, 274);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4480, 6922);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4481, 2054);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4536, 156);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4537, 116);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4538, 111);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4539, 174);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4540, 1);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4541, 6);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4542, 113);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4544, 241);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4592, 3);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4593, 127);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4594, 232);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4595, 7193);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4596, 131);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4599, 442);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4600, 246);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4601, 442);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4602, 298);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4603, 32);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4604, 2);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4605, 6);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4606, 112);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4607, 221);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4608, 435);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4623, 846);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4656, 9);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4791, 469);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5042, 1510);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5048, 1343);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5057, 2);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5095, 126);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5205, 114);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5206, 3330);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6950, 1906);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5342, 44);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5472, 17);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5473, 17);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5474, 5889);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5476, 2);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5477, 125);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5478, 743);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5479, 238);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5480, 500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5525, 11);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5526, 125);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5527, 135);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5631, 1410);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5633, 1811);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5634, 12427);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5740, 4074);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5996, 12249);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5997, 299);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6038, 851);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6048, 13602);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6049, 12950);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6050, 1552);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6051, 346);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6052, 1020);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6149, 468);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6289, 2);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6290, 15);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6291, 19);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6299, 8);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6303, 3);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6308, 136);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6316, 128);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6317, 12);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6361, 15);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6362, 4);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6372, 5491);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6373, 1998);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6458, 250932);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6529, 468);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6530, 109);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6532, 657);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6657, 1514);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6662, 1969);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6807, 42);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6811, 999);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6887, 20);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6888, 14);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6890, 29);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6949, 228);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6947, 16);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7097, 48);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7228, 634);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7307, 142);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7676, 577);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7806, 199);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7807, 50);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7808, 199);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8173, 2362);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8364, 326);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8365, 334);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8766, 424);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5237, 120);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8932, 884);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8948, 418);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8949, 549);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8950, 454);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8951, 3527);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8952, 543);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8953, 423);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8956, 1696);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8957, 2808);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8959, 364);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3776, 3062);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9030, 21841);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9036, 2666);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9088, 4828);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9144, 1400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9154, 654);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9155, 3524);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9172, 4973);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9179, 3464);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3775, 21);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9187, 1311);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9197, 5491);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9206, 11297);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9224, 14900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9233, 18632);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9260, 13750);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9264, 13543);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9312, 730);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9313, 658);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9314, 3303);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9315, 1708);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9317, 7524);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9318, 718);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9360, 846);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9361, 3800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9451, 10);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9681, 213);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10305, 1099);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10306, 825);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10307, 56898);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10308, 50342);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10309, 50295);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10310, 52538);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10592, 1998);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10841, 261);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2893, 262);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2892, 343);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11109, 99912);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11197, 139800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11325, 687);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11415, 50000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11444, 1582);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11584, 41);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11846, 146);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12003, 11333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12190, 1900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12209, 163);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12210, 296);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12212, 541);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12213, 494);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12214, 611);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12215, 19627);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12216, 1766);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12217, 15559);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12218, 562);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12224, 10);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12238, 5);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12820, 18505);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13442, 31905);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13443, 2719);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13444, 20302);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13445, 20865);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13446, 3414);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13447, 13774);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13452, 14234);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13453, 27516);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13454, 32078);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13455, 29632);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13456, 12973);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13457, 13041);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13458, 30999);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13459, 44529);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13461, 13618);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13462, 2244);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13506, 307843);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13510, 370757);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13511, 367335);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13512, 330016);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13513, 210084);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13546, 1823);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13724, 3193);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13754, 25);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13755, 18700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13756, 167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13758, 6);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13759, 12839);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13760, 1569);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13851, 323);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13888, 1680);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13889, 1987);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13893, 8850);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13927, 221);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13928, 18024);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13929, 231);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13930, 4);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13931, 10388);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13932, 925);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13933, 1634);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13934, 4988);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13935, 1350);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15564, 4297);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16166, 2);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16167, 6629);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16168, 1458);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16170, 118);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16766, 145);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16971, 445);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1401, 12);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17119, 9);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17196, 13189);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17197, 15974);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17198, 108352);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17202, 470);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17222, 688);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17303, 10005);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17304, 36672);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17307, 106772);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17344, 423);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17402, 2212);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17404, 2740);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17406, 238);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17407, 997625);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17708, 2322);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17747, 30000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19026, 173574);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18045, 398);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18251, 51788);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18253, 39388);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18254, 5499);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18255, 5877);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18258, 98437);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18287, 220);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18288, 2611);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18294, 2947);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18640, 827);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18662, 1974);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19183, 14799);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19221, 18);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19222, 1949);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19223, 2004);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19224, 11300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19299, 450);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19304, 2008);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19305, 374);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19306, 1600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20002, 19083);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20004, 14801);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20007, 15019);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20008, 14976);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20074, 3125);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20405, 70000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20452, 4366);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20676, 1700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20677, 2898);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20678, 2047);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20679, 1667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20709, 368);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21023, 34449);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21031, 923);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21071, 146);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21072, 131);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21114, 4885);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21151, 2040);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21153, 1412);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21213, 17900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21217, 1557);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21536, 1828);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21546, 14775);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21552, 440);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21557, 407);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21558, 11696);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21559, 741);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21561, 1772);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21562, 1066);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21569, 70163);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21570, 150260);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21571, 85463);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21574, 1378);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21576, 1149);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21589, 3237);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21590, 4290);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21592, 4296);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21593, 4997);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21595, 880);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21714, 3006);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21716, 3006);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21718, 3006);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21721, 220);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21747, 3543);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21829, 43267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21833, 9497);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (23578, 18567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (23579, 4380);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8827, 5971);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18300, 83333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13460, 5321);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8927, 2172);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8928, 1910);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8984, 674);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8985, 18511);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9186, 2722);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10918, 56542);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10920, 290);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10921, 933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10922, 1067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20844, 3062);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1400, 99900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1450, 28);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2460, 158);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2895, 25);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2896, 213);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5265, 100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5632, 25986);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5654, 5050);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5823, 7169);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5859, 1814);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8546, 60580);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1251, 6);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2581, 35912);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3530, 141);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3531, 342);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6450, 144);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6451, 329);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8544, 389);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8545, 849);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14529, 741);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14530, 2021);

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;