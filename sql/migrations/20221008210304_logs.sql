DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20221008210304');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20221008210304');
-- Add your query below.

ALTER TABLE `logs_player` CHANGE `text` `text` VARCHAR(512) CHARSET utf8 COLLATE utf8_general_ci NOT NULL, CHARSET=utf8mb3; 

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
