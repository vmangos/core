DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200904165642');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200904165642');
-- Add your query below.


-- Kriss Goldenlight
UPDATE `creature` SET `position_x`=3166.53, `position_y`=-4372.88, `position_z`=139.715, `orientation`=1.22173 WHERE `guid`=53732; 

-- Aurora Skycaller
UPDATE `creature` SET `position_x`=3172.21, `position_y`=-4372.37, `position_z`=139.715, `orientation`=1.85005 WHERE `guid`=53733; 



-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
