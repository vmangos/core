DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200416183102');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200416183102');
-- Add your query below.


-- Remove entries from custom table.
DELETE FROM `script_texts` WHERE `entry` IN (-1000306, -1000307, -1000308, -1000309, -1000310, -1000311, -1000312, -1000314, -1000315, -1000316, -1000317, -1000318, -1000313, -1000553, -1000554);

-- Add talk emote.
UPDATE `broadcast_text` SET `emote_id1`=1 WHERE `entry` IN (534, 535, 536, 537, 538, 539);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
