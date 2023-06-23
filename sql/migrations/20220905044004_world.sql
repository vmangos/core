DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220905044004');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220905044004');
-- Add your query below.


-- Remove wrong mod of Aura of Nature.
DELETE FROM `spell_mod` WHERE `Id`=25044;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
