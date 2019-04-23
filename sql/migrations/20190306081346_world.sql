DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190306081346');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190306081346');
-- Add your query below.


-- Fix wrong damage of The End of Dreams for 1.12.
-- https://web.archive.org/web/20061005090345/http://wow.allakhazam.com/db/item.html?witem=22988
UPDATE `item_template` SET `dmg_min1`=44, `dmg_max1`=120 WHERE `entry`=22988 && `patch`=10;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
