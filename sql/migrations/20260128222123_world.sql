DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260128222123');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260128222123');
-- Add your query below.

-- projectiles
INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2512, 18);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2515, 8);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2516, 4);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2519, 10);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3464, 1570);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3465, 4000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4960, 30);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5568, 2);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8067, 714);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8068, 1102);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8069, 930);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9399, 17);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10512, 2339);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10513, 3881);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11284, 7);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11285, 2);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11630, 12);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12654, 159);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13377, 26);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15997, 3016);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18042, 20);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3034, 2509);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10579, 34798);

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;