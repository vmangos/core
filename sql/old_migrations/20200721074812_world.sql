DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200721074812');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200721074812');
-- Add your query below.


-- rogues should have 100 thrown items at start
UPDATE `playercreateinfo_item` SET `amount` = 100 WHERE `class` = 4 AND `itemid` IN (2947, 3111);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
