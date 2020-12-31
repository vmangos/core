DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201009001929');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201009001929');
-- Add your query below.

-- Patch 1.3.0 (07-Mar-2005): The effect of the Spirit of Aquementas has changed to a +damage and +healing of all spell schools effect.
UPDATE `item_template` SET `patch` = 1 WHERE `entry` = 11904 AND `patch` = 3;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
