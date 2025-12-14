DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20231124111109');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20231124111109');
-- Add your query below.

DELETE FROM `spell_effect_mod` WHERE `Id`=19983; -- "Cleave 19983 : bonus degats fix a 300"
DELETE FROM `spell_effect_mod` WHERE `Id`=22540; -- "Cleave Vael (chaintarget 50 radius fix a 10yd)" NOT vael's spell
DELETE FROM `spell_mod` WHERE `Id`=22540; -- "Cleave Vael (modification dmgclass : magic)" NOT vael's spell, makes it unable to dodge/parry/block

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
