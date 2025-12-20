DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20251220112353');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20251220112353');
-- Add your query below.

DELETE FROM `creature` WHERE `id` = 15989; --  Spawn is trigegred from go_sapphiron_birth
UPDATE `gameobject_template` SET `flags` = 32, `script_name` = 'go_sapphiron_birth' WHERE `entry` = 181356;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
