DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220830203455');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220830203455');
-- Add your query below.

DELETE FROM `script_texts` WHERE `entry`= -1209002; 
DELETE FROM `script_texts` WHERE `entry`= -1209003; 
DELETE FROM `script_texts` WHERE `entry`= -1209004; 
DELETE FROM `script_texts` WHERE `entry`= -1209000; 
DELETE FROM `script_texts` WHERE `entry`= -1209001; 

UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=6067;
 

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
