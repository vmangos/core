DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250322162020');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250322162020');
-- Add your query below.

UPDATE `broadcast_text` SET `sound_id`=8037, `emote_id1`=0 WHERE `entry`=9425;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
