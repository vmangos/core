DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250726134620');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250726134620');
-- Add your query below.


-- Fix Westfall Woodworker script.
UPDATE `creature_movement_scripts` SET `data_flags`=2 WHERE `delay`=5 && `command`=41 && `id` IN (4552103, 4552104, 4552105, 4552106);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
