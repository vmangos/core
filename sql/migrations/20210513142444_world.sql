DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210513142444');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210513142444');
-- Add your query below.

-- Add new event for Lighthouse sound
REPLACE INTO `game_event` (`entry`, `start_time`, `end_time`, `occurence`, `length`, `holiday`, `description`, `hardcoded`, `disabled`, `patch_min`, `patch_max`) VALUES('79','2010-01-01 01:00:00','2025-01-01 01:00:00','2','1','0','Lighthouse Horn','0','0','0','10');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
