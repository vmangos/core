DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210922073106');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210922073106');
-- Add your query below.

-- Razorfren Kraul - Willix the Importer
DELETE FROM `script_texts` WHERE `entry`= -1047000; 
DELETE FROM `script_texts` WHERE `entry`= -1047001; 
DELETE FROM `script_texts` WHERE `entry`= -1047002; 
DELETE FROM `script_texts` WHERE `entry`= -1047003; 
DELETE FROM `script_texts` WHERE `entry`= -1047004; 
DELETE FROM `script_texts` WHERE `entry`= -1047005; 
DELETE FROM `script_texts` WHERE `entry`= -1047006; 
DELETE FROM `script_texts` WHERE `entry`= -1047007; 
DELETE FROM `script_texts` WHERE `entry`= -1047008; 

UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=1545;
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=1547;

-- Razorfren Kraul - Snufflenose Gopher
DELETE FROM `script_texts` WHERE `entry`= -1780223; 
DELETE FROM `script_texts` WHERE `entry`= -1780224; 
DELETE FROM `script_texts` WHERE `entry`= -1780225;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
