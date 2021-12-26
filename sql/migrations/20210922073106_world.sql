DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210922073106');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210922073106');
-- Add your query below.


-- Delete texts from custom table.
DELETE FROM `script_texts` WHERE `entry` IN (-1047000, -1047001, -1047002, -1047003, -1047004, -1047005, -1047006, -1047007, -1047008, -1047009, -1047010, -1047011, -1047012);

-- Assign emote.
UPDATE `broadcast_text` SET `emote_id1`=25 WHERE `entry`=1483;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
