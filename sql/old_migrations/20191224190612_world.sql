DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20191224190612');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20191224190612');
-- Add your query below.


INSERT INTO `spell_mod` (`Id`, `AttributesEx2`, `rangeIndex`, `Comment`) VALUES (26275, 4, 12, 'PX-238 Winter Wondervolt TRAP - Ignore LOS');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
