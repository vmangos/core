DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240123071946');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20240123071946');
-- Add your query below.


-- Fix wrong Z coordinate of Vilebranch mob.
UPDATE `creature` SET `position_z`=230.717 WHERE `guid`=92963;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
