DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200623153117');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200623153117');
-- Add your query below.


-- Highlord Mograine Transform should not use any weapon
-- https://www.youtube.com/watch?v=QViNP4cnPyM
-- https://www.youtube.com/watch?v=m3E6W6-rRGA
UPDATE `creature_template` SET `equipment_id` = 0 WHERE `entry` = 16440;
DELETE FROM `creature_equip_template` WHERE `entry` = 16440;

-- Fix for Ashbringer texts
UPDATE `broadcast_text` SET `chat_type` = 6 WHERE `entry` = 12389;
UPDATE `broadcast_text` SET `emote_id1` = 25 WHERE `entry` = 12469;
UPDATE `broadcast_text` SET `emote_id1` = 1 WHERE `entry` = 12470;
UPDATE `broadcast_text` SET `emote_id1` = 6 WHERE `entry` = 12471;
UPDATE `broadcast_text` SET `emote_id1` = 20 WHERE `entry` = 12472;

-- Delete old script text
DELETE FROM `script_texts` WHERE `entry` IN (-1999928, -1999916, -1999917, -1999918, -1999920, -1999921, -1999922, -1999923, -1999924, -1999925, -1999926);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
