DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200528192148');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200528192148');
-- Add your query below.

-- Fix Reginald's horse faction
UPDATE `creature_template` SET `faction` = 12 WHERE `entry` = 12581;

-- Fix equip template of spawned Onyxia guards
UPDATE `creature_equip_template` SET `equipentry1` = 1899, `equipentry2` = 143 WHERE `entry` = 12739;

-- Fixing broadcast texts
UPDATE `broadcast_text` SET `emote_id1` = 1 WHERE `entry` IN (8090, 8107, 8121, 8123, 8125, 8132, 8126, 8126, 8130, 8210, 8212, 8215, 8216, 8218, 8219, 8227, 8235);
UPDATE `broadcast_text` SET `emote_id1` = 22 WHERE `entry` IN (8109, 8127, 8128, 8129);
UPDATE `broadcast_text` SET `emote_id1` = 35 WHERE `entry` = 8091;
UPDATE `broadcast_text` SET `emote_id1` = 11 WHERE `entry` = 8214;
UPDATE `broadcast_text` SET `emote_id1` = 25 WHERE `entry` IN (8206, 8207, 8211);

UPDATE `broadcast_text` SET `chat_type` = 6 WHERE `entry` = 8119;
UPDATE `broadcast_text` SET `chat_type` = 1 WHERE `entry` IN (8109, 8129, 8248);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
