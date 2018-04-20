DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180420134157');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180420134157');
-- Add your query below.

-- Bloodseeker bats can actually fly
UPDATE `creature_template` set `InhabitType` = 4 WHERE `entry` = 11368;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
