DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210612173759');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210612173759');
-- Add your query below.


-- Delete text from custom table.
DELETE FROM `script_texts` WHERE `entry`=-1509002;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
