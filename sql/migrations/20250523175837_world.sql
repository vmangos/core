DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250523175837');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250523175837');
-- Add your query below.


UPDATE `spell_template` SET `script_name`='spell_opening_battleground_banner' WHERE `entry`=21651;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
