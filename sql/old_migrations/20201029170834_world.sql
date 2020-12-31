DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201029170834');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201029170834');
-- Add your query below.


-- Vekniss Warrior should run while patrolling.
UPDATE `creature_template` SET `flags_extra`=`flags_extra` | 33554432 WHERE `entry`=15230;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
