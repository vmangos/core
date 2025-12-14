DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250219185425');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250219185425');
-- Add your query below.


-- Convert some spell hacks to spell scripts.
UPDATE `spell_template` SET `script_name`='spell_huhuran_wyvern_sting' WHERE `entry`=26180;
UPDATE `spell_template` SET `script_name`='spell_noth_curse_of_the_plaguebringer' WHERE `entry`=29213;
UPDATE `spell_template` SET `script_name`='spell_huhuran_poison_bolt_volley' WHERE `entry`=26052;
UPDATE `spell_template` SET `script_name`='spell_heigan_mana_burn' WHERE `entry`=29310;
UPDATE `spell_template` SET `script_name`='spell_grobbulus_cloud_poison' WHERE `entry`=28241;
UPDATE `spell_template` SET `script_name`='spell_faerlina_poison_bolt_volley' WHERE `entry`=28796;
UPDATE `spell_template` SET `script_name`='spell_sapphiron_life_drain' WHERE `entry`=28542;
UPDATE `spell_template` SET `script_name`='spell_uldaman_awaken_vault_warder' WHERE `entry`=10258;
UPDATE `spell_template` SET `script_name`='spell_aq40_drain_mana' WHERE `entry` IN (26457, 26559);
UPDATE `spell_template` SET `script_name`='spell_aq20_drain_mana' WHERE `entry` IN (25676, 25754);
UPDATE `spell_template` SET `script_name`='spell_emerald_dragons_dream_fog' WHERE `entry`=24781;
UPDATE `spell_template` SET `script_name`='spell_shazzrah_gate' WHERE `entry`=23138;
UPDATE `spell_template` SET `script_name`='spell_emperor_mutate_bug' WHERE `entry`=802;
UPDATE `spell_template` SET `script_name`='spell_emperor_explode_bug' WHERE `entry`=804;
UPDATE `spell_template` SET `script_name`='spell_maexxna_web_spray' WHERE `entry`=29484;
UPDATE `spell_template` SET `script_name`='spell_unrelenting_rider_shadow_bolt_volley' WHERE `entry`=27831;
UPDATE `spell_template` SET `script_name`='spell_warrior_intimidating_shout' WHERE `entry`=5246;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
