DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200326160154');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200326160154');
-- Add your query below.


-- Fix scale of Orb of Domination.
UPDATE `creature_template` SET `scale`=1 WHERE `entry`=14453;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
