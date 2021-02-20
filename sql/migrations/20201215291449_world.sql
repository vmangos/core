DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201215291449');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201215291449');
-- Add your query below.
	
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=8439;
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=4919;
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=8897;
UPDATE `broadcast_text` SET `chat_type`=2 WHERE `entry`=1254;

DELETE FROM `script_texts` WHERE `entry`= -1780211; 
DELETE FROM `script_texts` WHERE `entry`= -1780212; 
DELETE FROM `script_texts` WHERE `entry`= -1780213; 
DELETE FROM `script_texts` WHERE `entry`= -1780214; 
DELETE FROM `script_texts` WHERE `entry`= -1780215; 
DELETE FROM `script_texts` WHERE `entry`= -1780216; 
DELETE FROM `script_texts` WHERE `entry`= -1780217; 
DELETE FROM `script_texts` WHERE `entry`= -1780218; 
DELETE FROM `script_texts` WHERE `entry`= -1780219;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
