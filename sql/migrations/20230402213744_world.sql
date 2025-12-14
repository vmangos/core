DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230402213744');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230402213744');
-- Add your query below.

DELETE FROM `script_texts` WHERE `entry`= -1780190;
DELETE FROM `script_texts` WHERE `entry`= -1780191;
DELETE FROM `script_texts` WHERE `entry`= -1780192;
DELETE FROM `script_texts` WHERE `entry`= -1780193;
DELETE FROM `script_texts` WHERE `entry`= -1780194;
DELETE FROM `script_texts` WHERE `entry`= -1780195;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
