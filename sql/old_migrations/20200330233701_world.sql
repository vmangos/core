DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200330233701');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200330233701');
-- Add your query below.


-- Not captured AB banners should be friendly faction according to TDB.
UPDATE `gameobject_template` SET `faction`=35 WHERE `entry` IN (180087, 180088, 180089, 180090, 180091);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
