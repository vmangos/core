DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230727181417');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230727181417');
-- Add your query below.

UPDATE `warden_scans` SET `comment`='noclip hack or multiboxbot' WHERE  `id`=31;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
