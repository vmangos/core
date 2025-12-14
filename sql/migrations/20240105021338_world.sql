DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240105021338');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20240105021338');
-- Add your query below.


-- The Lobotomizer should not drop from Grunnda Wolfheart.
DELETE FROM `creature_loot_template` WHERE `item`=19324;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
