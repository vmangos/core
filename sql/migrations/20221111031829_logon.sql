DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20221111031829');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20221111031829');
-- Add your query below.


ALTER TABLE `account`
	ADD COLUMN `platform` VARCHAR(4) NOT NULL DEFAULT '' AFTER `os`;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
