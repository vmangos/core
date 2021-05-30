DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210517090715');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210517090715');
-- Add your query below.


-- Remove no longer needed charges hack for Drain Soul.
DELETE FROM `spell_mod` WHERE `Id` IN (1120, 8288, 8289, 11675);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
