DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171110002120');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171110002120');
-- Add your query below.

UPDATE `conditions` SET `type`=12 WHERE `condition_entry`=74;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
