DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200802000254');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200802000254');
-- Add your query below.


DELETE FROM `script_text` WHERE `entry` IN (-1999906, -1999907, -1999908, -1999909, -1999910, -1000293, -1000294, -1000295, -1000296, -1000297, -1000101, -1000102, -1000103, -1000104, -1000105, -1000582, -1000583, -1000584, -1000585, -1000586, -1000587, -1000588, -1000847, -1000848, -1000849);

UPDATE `broadcast_text` SET `chat_type` = 1 WHERE `entry` = 10474;
UPDATE `broadcast_text` SET `chat_type` = 6, `emote_id1` = 22 WHERE `entry` = 10537;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
