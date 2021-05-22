DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210520124750');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210520124750');
-- Add your query below.

-- Crimson Conjuror should receive Retribution Aura from nearby Crimson Gallants.
DELETE FROM `creature_addon` WHERE `guid` IN (54079, 54081, 54082, 54083, 54084, 54085, 54086, 54087, 54088);

-- Remove effect type hack from Haste Aura.
DELETE FROM `spell_effect_mod` WHERE `Id`=13589;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
