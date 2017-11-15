DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171114011711');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171114011711');
-- Add your query below.

REPLACE INTO `spell_mod` (`Id`, `MaxTargetLevel`, `Comment`) VALUES (9159, 50, 'Green Whelp Armor max target level');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
