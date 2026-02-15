DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260128222347');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260128222347');
-- Add your query below.

-- reagents
INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1251, 16);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17038, 2749);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17037, 1474);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17035, 699);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17034, 500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2581, 35093);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2665, 23);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17036, 725);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3530, 142);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3531, 343);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4470, 117);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4471, 612);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4611, 1354);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5116, 282);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5140, 195);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5529, 141);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5530, 3539);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5565, 2708);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5636, 26140);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6358, 1766);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6359, 385);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6370, 5038);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6371, 1199);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6450, 142);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6451, 329);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6452, 213);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6453, 2653);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6470, 12);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6471, 2331);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6522, 1512);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7067, 19133);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7068, 23871);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7069, 643);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7070, 4425);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7071, 900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7072, 132);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7075, 46367);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7076, 31799);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7077, 21867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7078, 35000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7079, 10500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7080, 40046);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7081, 301);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7082, 40570);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7972, 321);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8168, 257);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8544, 404);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8545, 887);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9060, 4903);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9061, 12984);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10286, 379);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11291, 4425);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12803, 41265);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12808, 41531);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13422, 7862);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13423, 15867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13757, 2178);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13890, 328);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14529, 737);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14530, 2021);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15420, 50);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16583, 12625);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17010, 41233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17011, 48167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17020, 1209);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17021, 1675);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17026, 1212);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17028, 461);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17029, 3374);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17030, 2682);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17031, 2247);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17032, 1999);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17033, 3175);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18512, 19600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19440, 15263);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21177, 488);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5105, 1270);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5517, 290);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5518, 407);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17019, 816);

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;