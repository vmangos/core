DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190524144305');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190524144305');
-- Add your query below.


-- Add no target extra flag to Crimson Cannon.
UPDATE `creature_template` SET `flags_extra` = 2048 + 131072 WHERE `entry`=11199;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
