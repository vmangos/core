DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190102095511');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190102095511');
-- Add your query below.


-- These items have their buyout and bid price reversed.
UPDATE `auctionhousebot` SET `buyout`=200000, `bid`=30000 WHERE `item` IN (2318, 2319);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
