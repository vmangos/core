DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210516190702');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210516190702');
-- Add your query below.

-- Theramore Deserters that were added in TBC.
DELETE FROM `creature` WHERE `guid` IN (30741, 30769, 30770, 30742, 30772, 30773, 30771, 30774, 30776);
DELETE FROM `creature_addon` WHERE `guid` IN (30741, 30769, 30770, 30742, 30772, 30773, 30771, 30774, 30776);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
