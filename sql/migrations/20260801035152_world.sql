DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260801035152');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260801035152');
-- Add your query below.


-- Fix Obsidian Destroyer's Drain Mana targeting.
DELETE FROM `spell_effect_mod` WHERE `Id`=25755 AND `EffectIndex` IN (0, 1);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
