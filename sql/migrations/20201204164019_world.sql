DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201204164019');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201204164019');
-- Add your query below.

UPDATE `game_event` SET `description` = 'Dwarven Mortar Team (Dun Morogh)' WHERE `entry` = 67;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
