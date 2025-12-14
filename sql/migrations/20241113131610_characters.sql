DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20241113131610');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20241113131610');
-- Add your query below.


ALTER TABLE `characters`   
  ADD  INDEX `idx_instance` (`instance_id`);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
