DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260818233007');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260818233007');
-- Add your query below.


UPDATE `spell_template` SET `script_name`='spell_bwl_suppression_aura' WHERE `entry`=22247;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
