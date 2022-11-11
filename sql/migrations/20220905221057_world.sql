DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220905221057');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220905221057');
-- Add your query below.


-- Remove more no longer needed spell mods.
DELETE FROM `spell_mod` WHERE `Id` IN (28441, 5171, 6774, 21927, 7267, 7266, 21925, 3600, 453, 8192, 10953, 2096, 10909, 18153, 2908, 8955, 9901, 27517);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
