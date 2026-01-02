DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260102184203');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260102184203');
-- Add your query below.

UPDATE `spell_template` SET `script_name`='spell_shadowmeld' WHERE `entry` = 20580;
UPDATE `spell_template` SET `script_name`='spell_stoneform' WHERE `entry` = 20594;
UPDATE `spell_template` SET `script_name`='spell_discombobulate' WHERE `entry` = 4060;
UPDATE `spell_template` SET `script_name`='spell_warrior_sweeping_strikes' WHERE `entry` = 12292;
UPDATE `spell_template` SET `script_name`='spell_warrior_blood_fury' WHERE `entry` = 23234;
UPDATE `spell_template` SET `script_name`='spell_nefarian_polymorph' WHERE `entry` = 23603;
UPDATE `spell_template` SET `script_name`='spell_ashbringer' WHERE `entry` = 28282;
UPDATE `spell_template` SET `script_name`='spell_silithyst' WHERE `entry` = 29519;
UPDATE `spell_template` SET `script_name`='spell_controlling_steam_tonk' WHERE `entry` = 24937;
UPDATE `spell_template` SET `script_name`='spell_chains_of_kelthuzad' WHERE `entry` = 28410;
UPDATE `spell_template` SET `script_name`='spell_shaman_mana_tide' WHERE `entry` = 16191;
UPDATE `spell_template` SET `script_name`='spell_hunter_frost_trap_aura' WHERE `entry` = 13810;
UPDATE `spell_template` SET `script_name`='spell_warlock_curse_of_idiocy' WHERE `entry` = 1010;
UPDATE `spell_template` SET `script_name`='spell_activate_mg_turret' WHERE `entry` = 25026;
UPDATE `spell_template` SET `script_name`='spell_flamethrower' WHERE `entry` = 25027;
UPDATE `spell_template` SET `script_name`='spell_thaddius_positive_charge_aura' WHERE `entry` = 28059;
UPDATE `spell_template` SET `script_name`='spell_thaddius_negative_charge_aura' WHERE `entry` = 28084;
UPDATE `spell_template` SET `script_name`='spell_cannibalize_aura' WHERE `entry` = 20578;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
