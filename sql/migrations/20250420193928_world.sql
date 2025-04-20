DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250420193928');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250420193928');
-- Add your query below.

-- Delete TBC items
DELETE FROM `item_template` WHERE `entry` IN (20470, 20472, 20474, 20482, 20483);

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
