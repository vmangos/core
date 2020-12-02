DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201129175935');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201129175935');
-- Add your query below.

-- Flightmasters in Revantusk Village and Thorium point was not available before patch 1.5
-- 2941 Lanie Reed
-- 3305 Grisha
-- 4314 Gorkas
UPDATE `creature_template` SET `patch`=3 WHERE `entry` IN (2941, 3305, 4314);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
