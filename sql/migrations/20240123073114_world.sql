DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240123073114');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20240123073114');
-- Add your query below.


-- Remove help for non existent commands.
DELETE FROM `command` WHERE `name`='wareffortget';
DELETE FROM `command` WHERE `name`='wareffortset';


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
