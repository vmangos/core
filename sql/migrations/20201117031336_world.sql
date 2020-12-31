DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201117031336');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201117031336');
-- Add your query below.


-- Remove not longer needed text from custom table.
DELETE FROM `script_texts` WHERE `entry`=-1531100;

-- Correct chat type for 4 horseman texts.
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry` IN (13058, 13059);

-- Correct gender for Lady Blaumeux.
UPDATE `creature_display_info_addon` SET `gender`=1 WHERE `display_id`=16153;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
