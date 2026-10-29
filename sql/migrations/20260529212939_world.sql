DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260529212939');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260529212939');
-- Add your query below.

-- Error shown by honor commands when the honor system is unavailable (before patch 1.4.0).
DELETE FROM `mangos_string` WHERE `entry` = 269;
INSERT INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (269, 'The honor system is not available before patch 1.4.0.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
