DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210501105521');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210501105521');
-- Add your query below.


-- Remove custom version of STV fishing tournament texts.
DELETE FROM `script_texts` WHERE `entry`= -1900100; 
DELETE FROM `script_texts` WHERE `entry`= -1900101; 
DELETE FROM `script_texts` WHERE `entry`= -1900102;
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry` IN (10608, 10609, 10610);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
