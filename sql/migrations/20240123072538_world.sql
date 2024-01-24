DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240123072538');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20240123072538');
-- Add your query below.


-- Fix unit flags of battleground spirit guides.
UPDATE `creature_template` SET `unit_flags`=832 WHERE `entry` IN (13116, 13117);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
