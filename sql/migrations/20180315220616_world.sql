DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180315220616');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180315220616');
-- Add your query below.

REPLACE INTO `spell_effect_mod` (`Id`, `EffectMechanic`, `Comment`) VALUES (8379, 3, 'Disarm mechanic');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
