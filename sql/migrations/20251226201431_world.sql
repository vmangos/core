DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20251226201431');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20251226201431');
-- Add your query below.


-- Fix Void Bolt used by Kazzak.
DELETE FROM `spell_effect_mod` WHERE `Id`=22709;
UPDATE `creature_spells` SET `spellId_4`=21066 WHERE `entry`=123970;
UPDATE `creature_spells` SET `spellId_4`=21066 WHERE `entry`=123971;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
