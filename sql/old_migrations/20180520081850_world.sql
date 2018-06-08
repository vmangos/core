DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180520081850');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180520081850');
-- Add your query below.

-- Remove broken Periodic Mana Burn effect mod
DELETE FROM `spell_effect_mod` WHERE `Id` = 812;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
