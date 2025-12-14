DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240402091545');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240402091545');
-- Add your query below.


-- Remove hacks to Zinfizzlex's Portable Shredder Unit.
UPDATE `item_template` SET `spellid_2`=0, `spellcooldown_2`=-1 WHERE `entry`=17384;
DELETE FROM `spell_effect_mod` WHERE `Id`=21544;
DELETE FROM `spell_effect_mod` WHERE `Id`=21565;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
