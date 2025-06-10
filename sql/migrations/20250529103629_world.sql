DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250529103629');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250529103629');
-- Add your query below.


-- Fix ignite for old client versions.
UPDATE `spell_template` SET `script_name`='spell_mage_ignite' WHERE `entry` IN (11119, 11120, 12846, 12847, 12848);
UPDATE `spell_proc_event` SET `procFlags`=65536 WHERE `entry`=11119;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
