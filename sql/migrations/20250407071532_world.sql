DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250407071532');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250407071532');
-- Add your query below.


UPDATE `spell_template` SET `script_name`='spell_gdr_channel' WHERE `entry`=13278;
UPDATE `spell_template` SET `script_name`='spell_gdr_periodic' WHERE `entry`=13493;
DELETE FROM `spell_effect_mod` WHERE `Id` IN (13278, 13493);
UPDATE `spell_template` SET `script_name`='spell_paladin_judgement_of_light_proc_aura' WHERE `entry` IN (20185, 20344, 20345, 20346, 25751);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
