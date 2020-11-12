DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200303121200');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200303121200');
-- Add your query below.

UPDATE `creature_template` SET `ai_name`='' WHERE `entry`=1502;
DELETE FROM `creature_ai_scripts` WHERE `id` IN (150201);
DELETE FROM `creature_ai_events` WHERE `creature_id`=1502;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
