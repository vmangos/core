DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20251227092730');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20251227092730');
-- Add your query below.

UPDATE `spell_template` SET `script_name` = 'spell_nefarian_class_call_warlock' WHERE `entry` = 23427;
UPDATE `spell_template` SET `script_name` = 'spell_nefarian_class_call_rogue' WHERE `entry` = 23414;
UPDATE `spell_template` SET `script_name` = 'spell_nefarian_class_call_mage' WHERE `entry` = 23410;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
