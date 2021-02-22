DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210222003351');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210222003351');
-- Add your query below.


-- Omusa Thunderhorn <Wind Rider Master> should only be spawned in 1.6+
UPDATE `creature` SET `patch_min`='4' WHERE  `id`=10378;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
