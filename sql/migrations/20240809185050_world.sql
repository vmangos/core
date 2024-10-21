DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240809185050');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240809185050');
-- Add your query below.


-- Remove custom changes to Limited Invulnerability Potion.
DELETE FROM `spell_mod` WHERE `Id`=3169;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
