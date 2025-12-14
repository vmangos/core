DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250712023524');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250712023524');
-- Add your query below.


ALTER TABLE `character_deleted_items`   
  ADD  INDEX `idx_playerGuid` (`player_guid`);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
