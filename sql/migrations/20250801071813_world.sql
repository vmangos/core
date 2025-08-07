DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250801071813');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250801071813');
-- Add your query below.


-- Digging Claws should not summon mobs every time they're used.
UPDATE `spell_template` SET `script_name`='spell_digging_claw' WHERE `entry`=5166;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
