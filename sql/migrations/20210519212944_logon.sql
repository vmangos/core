DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210519212944');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210519212944');
-- Add your query below.


ALTER TABLE `account`
	DROP COLUMN `sha_pass_hash`;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
