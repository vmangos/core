DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20251218222700');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20251218222700');
-- Add your query below.


-- Add more spell scripts.
UPDATE `spell_template` SET `script_name`='spell_kodo_kombobulator' WHERE `entry`=18153;
UPDATE `spell_template` SET `script_name`='spell_melodius_rapture' WHERE `entry`=21050;
UPDATE `spell_template` SET `script_name`='spell_purify_and_place_food' WHERE `entry`=16072;
UPDATE `spell_template` SET `script_name`='spell_warlock_ritual_of_summoning' WHERE `entry`=698;
UPDATE `spell_template` SET `script_name`='spell_summon_black_qiraji_battle_tank' WHERE `entry`=26656;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
