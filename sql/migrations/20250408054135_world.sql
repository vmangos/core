DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250408054135');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250408054135');
-- Add your query below.


UPDATE `spell_template` SET `script_name`='spell_druid_swiftmend' WHERE `entry`=18562 AND `build`>=5464;
UPDATE `spell_template` SET `script_name`='spell_paladin_judgement_of_light_heal' WHERE `entry` IN (20267, 20341, 20342, 20343);
UPDATE `spell_template` SET `script_name`='spell_warrior_bloodrage' WHERE `entry`=2687;
UPDATE `spell_template` SET `script_name`='spell_ubrs_freeze_rookery_egg' WHERE `entry` IN (15748, 16028);
UPDATE `spell_template` SET `script_name`='spell_warlock_devour_magic' WHERE `entry` IN (19505, 19731, 19734, 19736);
UPDATE `spell_template` SET `script_name`='spell_av_create_shredder' WHERE `entry` IN (21544, 21565);
UPDATE `spell_template` SET `script_name`='spell_target_dummy' WHERE `entry` IN (4071, 4072, 19805);
UPDATE `spell_template` SET `script_name`='spell_eye_of_naxxramas_summon_rockwing_gargoyles' WHERE `entry`=16381;
UPDATE `spell_template` SET `script_name`='spell_chained_essence_of_eranikus' WHERE `entry`=12766;
UPDATE `spell_template` SET `script_name`='spell_release_umis_yeti' WHERE `entry`=17166;
UPDATE `spell_template` SET `script_name`='spell_vanquished_tentacle_of_cthun' WHERE `entry`=26391;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
