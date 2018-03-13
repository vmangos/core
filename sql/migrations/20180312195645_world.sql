DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180312195645');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180312195645');
-- Add your query below.

REPLACE INTO `spell_mod` (`Id`, `AttributesEx3`, `Comment`) VALUES (17186, 1048576, 'Ras Becomes a Boy - Death Persistent');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
