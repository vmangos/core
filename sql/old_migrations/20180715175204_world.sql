DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180715175204');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180715175204');
-- Add your query below.

-- Warsong Peon
UPDATE `creature_ai_events` SET `event_type`='0' WHERE `id`=1165601;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
