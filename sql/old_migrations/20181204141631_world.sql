DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181204141631');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181204141631');
-- Add your query below.


-- Remove wrong spell mod type override.
DELETE FROM `spell_effect_mod` WHERE `Id`=11175 && `EffectIndex`=1;
DELETE FROM `spell_effect_mod` WHERE `Id`=12569 && `EffectIndex`=1;
DELETE FROM `spell_effect_mod` WHERE `Id`=12571 && `EffectIndex`=1;
DELETE FROM `spell_effect_mod` WHERE `Id`=18288 && `EffectIndex`=1;
DELETE FROM `spell_effect_mod` WHERE `Id`=18310 && `EffectIndex`=0;
DELETE FROM `spell_effect_mod` WHERE `Id`=18311 && `EffectIndex`=0;
DELETE FROM `spell_effect_mod` WHERE `Id`=18312 && `EffectIndex`=0;
DELETE FROM `spell_effect_mod` WHERE `Id`=18313 && `EffectIndex`=0;
DELETE FROM `spell_effect_mod` WHERE `Id`=19559 && `EffectIndex`=0;
DELETE FROM `spell_effect_mod` WHERE `Id`=19560 && `EffectIndex`=0;
DELETE FROM `spell_effect_mod` WHERE `Id`=22801 && `EffectIndex`=0;
DELETE FROM `spell_effect_mod` WHERE `Id`=24348 && `EffectIndex`=0;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
