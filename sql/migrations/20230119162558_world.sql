DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230119162558');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230119162558');
-- Add your query below.


-- Remove empty creature group.
DELETE FROM `creature_groups` WHERE `leader_guid`=33676;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
