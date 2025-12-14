DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220826104820');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220826104820');
-- Add your query below.

DELETE FROM `script_texts` WHERE `entry`= -1000217; 
DELETE FROM `script_texts` WHERE `entry`= -1000218; 
DELETE FROM `script_texts` WHERE `entry`= -1000219; 
DELETE FROM `script_texts` WHERE `entry`= -1000220; 
DELETE FROM `script_texts` WHERE `entry`= -1000221; 
DELETE FROM `script_texts` WHERE `entry`= -1000222; 
DELETE FROM `script_texts` WHERE `entry`= -1000223; 
DELETE FROM `script_texts` WHERE `entry`= -1000224;
DELETE FROM `script_texts` WHERE `entry`= -1000225; 
DELETE FROM `script_texts` WHERE `entry`= -1000226; 
DELETE FROM `script_texts` WHERE `entry`= -1000227; 
DELETE FROM `script_texts` WHERE `entry`= -1000228; 
DELETE FROM `script_texts` WHERE `entry`= -1000229; 
DELETE FROM `script_texts` WHERE `entry`= -1000230; 

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
