DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190720134503');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190720134503');
-- Add your query below.


-- Barrel of Milk should contain 2-5 Ice Cold Milk.
-- https://www.wowhead.com/object=3705/barrel-of-milk#contains
UPDATE `gameobject_loot_template` SET `mincountOrRef`=2, `maxcount`=5 WHERE `entry`=2579 AND `item`=1179;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
