DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171025211211');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171025211211');
-- Add your query below.

REPLACE INTO `spell_mod` (`Id`, `Attributes`, `Comment`) VALUES (25023, 65536, 'Hallow\'s End Fright attributes');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
