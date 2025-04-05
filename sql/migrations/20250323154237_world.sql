DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250323154237');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250323154237');
-- Add your query below.


UPDATE `spell_template` SET `script_name`='spell_mage_cold_snap' WHERE `entry`=12472;
UPDATE `spell_template` SET `script_name`='spell_warlock_life_tap' WHERE `entry` IN (1454, 1455, 1456, 11687, 11688, 11689) && `effect1`=3;
UPDATE `spell_template` SET `script_name`='spell_warlock_curse_of_agony_dummy' WHERE `entry`=18280 AND `build`=4222;
UPDATE `spell_template` SET `script_name`='spell_priest_touch_of_weakness' WHERE `entry`=28598;
UPDATE `spell_template` SET `script_name`='spell_druid_enrage' WHERE `entry`=5229 AND `build`>=5086;
UPDATE `spell_template` SET `script_name`='spell_loatheb_corrupted_mind_aoe' WHERE `entry`=29201;
UPDATE `spell_template` SET `script_name`='spell_shaman_flametongue_proc_dummy' WHERE `entry` IN (8026, 8028, 8029, 8248, 8253, 10445, 10523, 16343, 16344, 16389);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
