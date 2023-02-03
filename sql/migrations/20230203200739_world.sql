DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230203200739');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230203200739');
-- Add your query below.

DELETE FROM `script_texts` WHERE `entry`= -1109005;
DELETE FROM `script_texts` WHERE `entry`= -1109011;
DELETE FROM `script_texts` WHERE `entry`= -1109012;
DELETE FROM `script_texts` WHERE `entry`= -1109013;
DELETE FROM `script_texts` WHERE `entry`= -1109014;

UPDATE `broadcast_text` SET `chat_type`=6, `sound_id`=5861 WHERE `entry`=4490; -- The shield be down! Rise up Atal'ai! Rise up!
UPDATE `broadcast_text` SET `chat_type`=6, `sound_id`=5866 WHERE `entry`=6220; -- Turn back! Do not wake the dreamer!
UPDATE `broadcast_text` SET `chat_type`=1, `sound_id`=5860 WHERE `entry`=6216; -- I'll feast on your bones!

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
