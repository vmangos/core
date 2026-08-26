DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260826140915');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260826140915');
-- Add your query below.


DROP TABLE IF EXISTS ip2nation;
DROP TABLE IF EXISTS ip2nationcountries;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
