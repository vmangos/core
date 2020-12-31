DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20191206235135');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20191206235135');
-- Add your query below.


-- Fix portal in Maexxna room. It's partly inside the wall, and thus not in LOS of users.
INSERT INTO `spell_mod` (`Id`, `AttributesEx2`, `Comment`) VALUES (28444, 4, 'Portal Effect: Deathknight Wing - Ignore LOS');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
