DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250407022846');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250407022846');
-- Add your query below.


-- Add scripts for more spells.
UPDATE `spell_template` SET `script_name`='spell_gnomeregan_collecting_fallout' WHERE `entry`=12709;
DELETE FROM `spell_effect_mod` WHERE `Id`=12709;
UPDATE `spell_template` SET `script_name`='spell_linkens_boomerang' WHERE `entry`=15712;
UPDATE `spell_template` SET `script_name`='spell_scorpid_surprise' WHERE `entry`=6410;
UPDATE `spell_template` SET `script_name`='spell_rogue_vanish' WHERE `entry` IN (1856, 1857, 27617);
UPDATE `spell_template` SET `script_name`='spell_brittle_armor_dummy' WHERE `entry`=29284;
UPDATE `spell_template` SET `script_name`='spell_mercurial_shield_dummy' WHERE `entry`=29286;
UPDATE `spell_template` SET `script_name`='spell_everlook_transporter' WHERE `entry`=23442;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
