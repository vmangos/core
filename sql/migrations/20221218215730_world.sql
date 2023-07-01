DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20221218215730');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20221218215730');
-- Add your query below.


-- Fix Defias Looters having Frost Armor.
DELETE FROM `creature_addon` WHERE `guid` IN (45549, 53862, 53962, 54439, 89667, 90286, 90291, 90334, 90356);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
