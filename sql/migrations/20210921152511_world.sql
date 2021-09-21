DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210921152511');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210921152511');
-- Add your query below.

-- Arcane Dust shouldn't be available on vendors.
DELETE FROM `npc_vendor` WHERE `item` = 17019;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
