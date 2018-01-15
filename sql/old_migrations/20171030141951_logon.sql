DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171030141951');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171030141951');
-- Add your query below.

ALTER TABLE `account`
ADD COLUMN `geolock_pin` INT NULL DEFAULT 0 AFTER `nostalrius_reason`;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
