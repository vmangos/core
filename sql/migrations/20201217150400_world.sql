DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201217150400');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201217150400');
-- Add your query below.

DELETE FROM `script_texts` WHERE `entry`= -1614998;
DELETE FROM `script_texts` WHERE `entry`= -1614997;
DELETE FROM `script_texts` WHERE `entry`= -1614996;
DELETE FROM `script_texts` WHERE `entry`= -1614995;
DELETE FROM `script_texts` WHERE `entry`= -1614994;
DELETE FROM `script_texts` WHERE `entry`= -1614993;
DELETE FROM `script_texts` WHERE `entry`= -1614992;
DELETE FROM `script_texts` WHERE `entry`= -1614991;
DELETE FROM `script_texts` WHERE `entry`= -1614990;
DELETE FROM `script_texts` WHERE `entry`= -1614989;
DELETE FROM `script_texts` WHERE `entry`= -1614987;
DELETE FROM `script_texts` WHERE `entry`= -1614986;
DELETE FROM `script_texts` WHERE `entry`= -1614985;
DELETE FROM `script_texts` WHERE `entry`= -1614984;
DELETE FROM `script_texts` WHERE `entry`= -1614983;
DELETE FROM `script_texts` WHERE `entry`= -1614982;

UPDATE `broadcast_text` SET `chat_type`=1, `sound_id`=5789 WHERE `entry`=1271;
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=1273;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
