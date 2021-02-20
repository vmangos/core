DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201212230737');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201212230737');
-- Add your query below.


-- Fix position of Scarlet Warrior spawned underground.
UPDATE `creature` SET `position_z`=38.171 WHERE `guid`=38336;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
