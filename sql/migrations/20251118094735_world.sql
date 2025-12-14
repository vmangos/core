DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20251118094735');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20251118094735');
-- Add your query below.

-- Remove leftover locale for deleted gameobject.
DELETE FROM `locales_gameobject` WHERE `entry`=182509;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
