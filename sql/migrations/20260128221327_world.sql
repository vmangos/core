DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260128221327');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260128221327');
-- Add your query below.

-- containers
INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (804, 4242);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (805, 236);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (828, 244);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (856, 843);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (857, 4172);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (932, 8749);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (933, 4514);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1470, 7498);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1652, 7867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1685, 20433);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1725, 8998);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2657, 1004);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3233, 1036);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3914, 16733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4238, 178);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4240, 688);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4241, 846);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4245, 2179);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4496, 264);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4497, 18600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4498, 1624);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4499, 110000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4500, 46233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5081, 542);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5571, 248);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5572, 225);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5573, 985);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5574, 972);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5575, 3975);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5576, 2763);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5762, 620);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5763, 973);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5764, 2348);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5765, 3020);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6446, 4997);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10050, 13743);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10051, 12634);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14046, 22280);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14155, 184261);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14156, 1754482);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19291, 31900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21340, 31272);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21341, 744940);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21342, 1777191);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22246, 14125);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22248, 73367);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22249, 227430);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22250, 2869);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22251, 76531);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22252, 505430);

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;