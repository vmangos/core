DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171107204604');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171107204604');
-- Add your query below.

REPLACE INTO `spell_mod` (`Id`, `Custom`, `Comment`) VALUES (9658, 1, 'Flame Buffet: Stack between casters');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
