DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190702153714');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190702153714');
-- Add your query below.


-- Correct Stats for Large Solid Chest 153464 & Large Mithril Bound Chest 153469
UPDATE `gameobject_template` SET `faction`=94, `mingold`=2100, `maxgold`=2300 WHERE `entry` IN (153464,153469);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
