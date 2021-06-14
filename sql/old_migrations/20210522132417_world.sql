DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210522132417');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210522132417');
-- Add your query below.


-- Change default reaction of Unit In LoS OOC event to Any.
UPDATE `creature_ai_events` SET `event_param1`=`event_param1`+1 WHERE `event_type`=10;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
