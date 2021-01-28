DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210128145653');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210128145653');
-- Add your query below.

-- Plundering the Plunderers
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry` = 3170;
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry` = 3164;

-- Free From the Hold
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry` = 1072;
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry` = 1073;
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry` = 1074;
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry` = 1075;

DELETE FROM `script_texts` WHERE `entry`= -1000370; 
DELETE FROM `script_texts` WHERE `entry`= -1000371; 
DELETE FROM `script_texts` WHERE `entry`= -1000372; 
DELETE FROM `script_texts` WHERE `entry`= -1000373; 
DELETE FROM `script_texts` WHERE `entry`= -1000374; 
DELETE FROM `script_texts` WHERE `entry`= -1000375; 
DELETE FROM `script_texts` WHERE `entry`= -1000376; 
DELETE FROM `script_texts` WHERE `entry`= -1000377; 
DELETE FROM `script_texts` WHERE `entry`= -1000378;
DELETE FROM `script_texts` WHERE `entry`= -1000379;
DELETE FROM `script_texts` WHERE `entry`= -1000380;

-- The Affray
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry` = 2354;

DELETE FROM `script_texts` WHERE `entry`= -1000123;
DELETE FROM `script_texts` WHERE `entry`= -1000124;
DELETE FROM `script_texts` WHERE `entry`= -1000125;
DELETE FROM `script_texts` WHERE `entry`= -1000126;
DELETE FROM `script_texts` WHERE `entry`= -1000127;

-- Wizzlecranks Shredder
DELETE FROM `script_texts` WHERE `entry`= -1000298;
DELETE FROM `script_texts` WHERE `entry`= -1000299;
DELETE FROM `script_texts` WHERE `entry`= -1000300;
DELETE FROM `script_texts` WHERE `entry`= -1000301;
DELETE FROM `script_texts` WHERE `entry`= -1000302;
DELETE FROM `script_texts` WHERE `entry`= -1000303;
DELETE FROM `script_texts` WHERE `entry`= -1000304;
DELETE FROM `script_texts` WHERE `entry`= -1000305;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
