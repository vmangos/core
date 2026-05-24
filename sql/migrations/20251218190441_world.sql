DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20251218190441');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20251218190441');
-- Add your query below.

UPDATE `spell_template` SET `script_name`='spell_cannibalize' WHERE `entry` = 20577;
UPDATE `spell_template` SET `script_name`='spell_wolfshead_helm' WHERE `entry` = 17770;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
