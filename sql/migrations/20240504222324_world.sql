DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240504222324');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240504222324');
-- Add your query below.


-- Fix Detect Magic to have one debuff per caster
UPDATE `spell_template` SET `customFlags`=4096 WHERE `entry`=2855;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
