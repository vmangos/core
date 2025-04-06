DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250217072022');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250217072022');
-- Add your query below.

UPDATE `spell_template` SET `script_name`='spell_golemaggs_trust' WHERE `entry`= 20556;
UPDATE `spell_template` SET `script_name`='spell_haunting_phantoms' WHERE `entry`= 16336;
UPDATE `spell_template` SET `script_name`='spell_haunting_spirits' WHERE `entry`= 7057;
UPDATE `spell_template` SET `script_name`='spell_gargoyle_stoneform' WHERE `entry`= 29153;
UPDATE `spell_template` SET `script_name`='spell_grobbulus_mutating_injection' WHERE `entry`= 28169;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
