DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171123200757');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171123200757');
-- Add your query below.

DELETE FROM `spell_disabled` WHERE  `entry`=21879;
REPLACE INTO `spell_effect_mod` (`Id`, `EffectIndex`, `EffectBasePoints`, `Comment`) VALUES (21879, 0, -100, 'Mage T2 threat reduction');
REPLACE INTO `spell_effect_mod` (`Id`, `EffectIndex`, `EffectBasePoints`, `Comment`) VALUES (21879, 1, -20, 'Mage T2 threat reduction');
REPLACE INTO `spell_effect_mod` (`Id`, `EffectIndex`, `EffectBasePoints`, `Comment`) VALUES (21879, 2, -20, 'Mage T2 threat reduction');
REPLACE INTO `spell_effect_mod` (`Id`, `EffectIndex`, `EffectBasePoints`, `Comment`) VALUES (21856, 0, 15, 'Threatening Strikes threat increase');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
