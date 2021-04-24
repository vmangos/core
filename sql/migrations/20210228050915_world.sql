DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210228050915');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210228050915');
-- Add your query below.


-- Remove cooldown from Kodo Kombobulator events.
UPDATE `creature_ai_events` SET `event_param3`=1, `event_param4`=1 WHERE `id` IN (470002, 470004, 470005, 470102, 470104, 470105, 470202, 470204, 470205);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
