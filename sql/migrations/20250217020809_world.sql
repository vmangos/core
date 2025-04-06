DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250217020809');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250217020809');
-- Add your query below.


-- Script for spell Five Fat Finger Exploding Heart Technique.
-- https://github.com/cmangos/mangos-classic/commit/031475ac81bfd2f8085b6f4ceb7acbabbf8837f4
UPDATE `spell_template` SET `script_name`='spell_five_fat_finger_exploding_heart_technique' WHERE `entry`=27673;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
