DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181013164300');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181013164300');
-- Add your query below.


-- Replace Mudsprocket teleport location with Programmer Isle.
REPLACE INTO `game_tele` (`id`, `position_x`, `position_y`, `position_z`, `orientation`, `map`, `name`) VALUES (140, 15708.1, 16574.5, 48.6117, 2.283, 451, 'ProgrammerIsle');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
