DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180717210735');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180717210735');
-- Add your query below.

-- Remove UNIT_FLAG_IMMUNE_TO_PLAYER from Kormok
UPDATE `creature_template` SET `unit_flags`=`unit_flags` & ~0x100 WHERE `entry`=16118;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
