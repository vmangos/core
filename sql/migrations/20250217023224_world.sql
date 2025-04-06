DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250217023224');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250217023224');
-- Add your query below.


-- Script for spell Curse of the Bleakheart.
UPDATE `spell_template` SET `script_name`='spell_curse_of_bleakheart' WHERE `entry`=6946;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
