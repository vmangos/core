DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250225150702');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250225150702');
-- Add your query below.


-- Assign more spell scripts.
UPDATE `spell_template` SET `script_name`='spell_meteor' WHERE `entry` IN (24340, 26558, 26789, 28884) && `build` >= 5086;
UPDATE `spell_template` SET `script_name`='spell_rajaxx_thundercrash' WHERE `entry`=25599;
UPDATE `spell_template` SET `script_name`='spell_simone_seductress_chain_lightning' WHERE `entry`=23206;
UPDATE `spell_template` SET `script_name`='spell_thaddius_positive_charge' WHERE `entry`=28062;
UPDATE `spell_template` SET `script_name`='spell_thaddius_negative_charge' WHERE `entry`=28085;
UPDATE `spell_template` SET `script_name`='spell_gluth_decimate' WHERE `entry`=28375;
UPDATE `spell_template` SET `script_name`='spell_grobbulus_mutagen_explosion' WHERE `entry`=28206;
UPDATE `spell_template` SET `script_name`='spell_kelthuzad_void_blast' WHERE `entry`=27812;
UPDATE `spell_template` SET `script_name`='spell_darkmoon_steam_tonk_cannon' WHERE `entry`=24933;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
