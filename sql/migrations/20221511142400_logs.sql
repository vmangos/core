DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20221511142400');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20221511142400');
-- Add your query below.

ALTER TABLE `logs_player` CHANGE `text` `text` VARCHAR(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
