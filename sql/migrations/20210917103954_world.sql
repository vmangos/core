DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210917103954');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210917103954');
-- Add your query below.

-- Scarlet Monastery: Arcanist Doan
DELETE FROM `script_texts` WHERE `entry`= -1189019; 
DELETE FROM `script_texts` WHERE `entry`= -1189020; 

UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=6199;
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=6200;

UPDATE `broadcast_text` SET `sound_id`=5842 WHERE `entry`=6199;
UPDATE `broadcast_text` SET `sound_id`=5843 WHERE `entry`=6200;

-- Scarlet Monastery: Herod
DELETE FROM `script_texts` WHERE `entry`= -1189000; 
DELETE FROM `script_texts` WHERE `entry`= -1189001;
DELETE FROM `script_texts` WHERE `entry`= -1189002; 
DELETE FROM `script_texts` WHERE `entry`= -1189003;
DELETE FROM `script_texts` WHERE `entry`= -1189004; 
DELETE FROM `script_texts` WHERE `entry`= -1189022;

UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=6194;
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=6196;
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=6534;
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=6195;
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=2842;

UPDATE `broadcast_text` SET `sound_id`=5830 WHERE `entry`=6194;
UPDATE `broadcast_text` SET `sound_id`=5831 WHERE `entry`=6196;
UPDATE `broadcast_text` SET `sound_id`=5832 WHERE `entry`=6534;
UPDATE `broadcast_text` SET `sound_id`=5833 WHERE `entry`=6195;
UPDATE `broadcast_text` SET `sound_id`=5834 WHERE `entry`=2842;

-- Scarlet Monastery: Houndmaster Loksey
DELETE FROM `script_texts` WHERE `entry`= -1189021;

UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=2655;

UPDATE `broadcast_text` SET `sound_id`=5841 WHERE `entry`=2655;

-- Scarlet Monastery: Interrogator Vishas
DELETE FROM `script_texts` WHERE `entry`= -1189011;
DELETE FROM `script_texts` WHERE `entry`= -1189012; 
DELETE FROM `script_texts` WHERE `entry`= -1189013;
DELETE FROM `script_texts` WHERE `entry`= -1189003;
DELETE FROM `script_texts` WHERE `entry`= -1189014; 
DELETE FROM `script_texts` WHERE `entry`= -1189015;

UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=6204;
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=6206;
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=6207;
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=6205;

UPDATE `broadcast_text` SET `sound_id`=5847 WHERE `entry`=6204;
UPDATE `broadcast_text` SET `sound_id`=5849 WHERE `entry`=6206;
UPDATE `broadcast_text` SET `sound_id`=5850 WHERE `entry`=6207;
UPDATE `broadcast_text` SET `sound_id`=5848 WHERE `entry`=6205;

-- Scarlet Monastery: Mograine & Whitemane
DELETE FROM `script_texts` WHERE `entry`= -1189005;
DELETE FROM `script_texts` WHERE `entry`= -1189006; 
DELETE FROM `script_texts` WHERE `entry`= -1189007;
DELETE FROM `script_texts` WHERE `entry`= -1189008;
DELETE FROM `script_texts` WHERE `entry`= -1189009; 
DELETE FROM `script_texts` WHERE `entry`= -1189010;

UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=2847;
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=6197;
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=6533;
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=2973;
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=6198;
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=6532;

UPDATE `broadcast_text` SET `sound_id`=5835 WHERE `entry`=2847;
UPDATE `broadcast_text` SET `sound_id`=5836 WHERE `entry`=6197;
UPDATE `broadcast_text` SET `sound_id`=5837 WHERE `entry`=6533;
UPDATE `broadcast_text` SET `sound_id`=5838 WHERE `entry`=2973;
UPDATE `broadcast_text` SET `sound_id`=5839 WHERE `entry`=6198;
UPDATE `broadcast_text` SET `sound_id`=5840 WHERE `entry`=6532;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
