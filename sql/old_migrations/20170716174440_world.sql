DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20170716174440');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20170716174440');
-- Add your query below.

 
INSERT INTO `game_graveyard_zone` (`id`, `ghost_zone`, `faction`) VALUES ('909', '3456', '0');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
