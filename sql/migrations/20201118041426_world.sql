DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201118041426');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201118041426');
-- Add your query below.


-- Remove hack for Buru Egg's Egg Explosion.
DELETE FROM `spell_effect_mod` WHERE `Id`=19593;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
