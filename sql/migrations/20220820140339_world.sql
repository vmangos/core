DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220820140339');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220820140339');
-- Add your query below.

DELETE FROM `script_texts` WHERE `entry`= -1129005; 
DELETE FROM `script_texts` WHERE `entry`= -1129006; 
DELETE FROM `script_texts` WHERE `entry`= -1129007; 
DELETE FROM `script_texts` WHERE `entry`= -1129008; 
DELETE FROM `script_texts` WHERE `entry`= -1129009; 
DELETE FROM `script_texts` WHERE `entry`= -1129010; 
DELETE FROM `script_texts` WHERE `entry`= -1129011; 
DELETE FROM `script_texts` WHERE `entry`= -1129012;

UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=4504;
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=4505;
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=4506;
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=4507;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
