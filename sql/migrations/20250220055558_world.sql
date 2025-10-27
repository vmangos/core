DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250220055558');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250220055558');
-- Add your query below.


UPDATE `spell_template` SET `script_name`='spell_warrior_bloodthirst' WHERE `entry` IN (23881, 23892, 23893, 23894);
UPDATE `spell_template` SET `script_name`='spell_warrior_shield_slam' WHERE `entry` IN (23922, 23923, 23924, 23925);
UPDATE `spell_template` SET `script_name`='spell_warrior_execute_damage' WHERE `entry` IN (20647);
UPDATE `spell_template` SET `script_name`='spell_warrior_execute_dummy' WHERE `entry` IN (5308, 20658, 20660, 20661, 20662);
UPDATE `spell_template` SET `script_name`='spell_warrior_wrath' WHERE `entry` IN (21977);
UPDATE `spell_template` SET `script_name`='spell_nefarian_corrupted_totems' WHERE `entry` IN (23424);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
