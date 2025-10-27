DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20241203184305');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20241203184305');
-- Add your query below.


-- Fixed an exploit that allowed you to summon infinite Crimson Hammersmiths from the Blacksmithing Plans in Stratholme.
DELETE FROM `gameobject_scripts` WHERE `id`=42888;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
