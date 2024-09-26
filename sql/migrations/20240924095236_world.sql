DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240924095236');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240924095236');
-- Add your query below.

-- Correct condition for Chapter V gossip menu
UPDATE `gossip_menu_option` SET `condition_id` = 150 WHERE `menu_id` = 6669;

-- Correct condition for Chapter VII gossip menu
UPDATE `gossip_menu_option` SET `condition_id` = 151 WHERE `menu_id` = 6668;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
