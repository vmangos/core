DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200527145604');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200527145604');
-- Add your query below.


-- Remove custom stratholme rat trap triggers.
DELETE FROM `creature` WHERE `id` IN (160012, 160013);
DELETE FROM `creature_template` WHERE `entry` IN (160012, 160013);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
