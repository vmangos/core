DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20191205230923');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20191205230923');
-- Add your query below.


-- Remove character db tables wrongly added to world db.
DROP TABLE `gm_subsurveys`;
DROP TABLE `gm_surveys`;
DROP TABLE `gm_tickets`;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
