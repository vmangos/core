DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190101174926');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190101174926');
-- Add your query below.


-- We shall never know which idiot added these spawns to the default database...
DELETE FROM `creature` WHERE `guid` IN (156133, 156134);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
