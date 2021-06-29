DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210314002642');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210314002642');
-- Add your query below.

UPDATE `quest_template` SET `RequestItemsText` = '<Nipsy puts his index finger through one of the air holes in the carton.>$b$bAlive and kicking... and just in time!' WHERE `entry` = 6662;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
