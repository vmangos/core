DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250222092422');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250222092422');
-- Add your query below.

UPDATE `spell_template` SET `script_name`='spell_deviate_fish' WHERE `entry`= 8063;
UPDATE `spell_template` SET `script_name`='spell_cooked_deviate_fish' WHERE `entry`= 8213;
UPDATE `spell_template` SET `script_name`='spell_noggenfogger_elixir' WHERE `entry`= 16589;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
