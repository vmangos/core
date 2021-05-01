DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210501105521');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210501105521');
-- Add your query below.

DELETE FROM `script_texts` WHERE `entry`= -1900100; 
DELETE FROM `script_texts` WHERE `entry`= -1900101; 
DELETE FROM `script_texts` WHERE `entry`= -1900102;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
