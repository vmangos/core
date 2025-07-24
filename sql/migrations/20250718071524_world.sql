DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250718071524');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250718071524');
-- Add your query below.


UPDATE `spell_template` SET `script_name`='spell_priest_power_word_shield' WHERE `entry` IN (17, 592, 600, 3747, 6065, 6066, 10898, 10899, 10900, 10901, 27607);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
