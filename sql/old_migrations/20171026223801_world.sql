DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171026223801');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171026223801');
-- Add your query below.

-- -------------------------------
-- 
-- Crimson Rifleman no XP
-- 
-- -------------------------------

-- CREATURE_FLAG_EXTRA_NO_XP_AT_KILL
UPDATE `creature_template` SET `flags_extra`= 64 WHERE `entry`=11054; 

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
