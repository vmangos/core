DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250717023851');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250717023851');
-- Add your query below.


-- Remove not needed custom ragnaros npcs.
DELETE FROM `creature_template` WHERE `entry`=21000;

-- Son of Flame can enter lava.
UPDATE `creature_template` SET `inhabit_type`=3 WHERE `entry`=12143;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
