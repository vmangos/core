DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220105221507');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220105221507');
-- Add your query below.


-- Remove orphaned game event creature data rows.
DELETE FROM `game_event_creature_data` WHERE `guid` IN (94926, 94927, 94928, 91688, 91637, 91622, 91633, 91629, 91624, 91634, 91628, 91623, 94920, 91689, 91625, 91636, 94919, 91632, 91626, 60007, 79676);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
