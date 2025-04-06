DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250227161438');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250227161438');
-- Add your query below.


-- Fix the Tonk Control Console.
INSERT INTO `spell_effect_mod` (`Id`, `EffectIndex`, `Effect`, `Comment`) VALUES (24934, 1, 0, 'Summon RC Tank - Disable Second Effect');


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
