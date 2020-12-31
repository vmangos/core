DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200620232050');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200620232050');
-- Add your query below.


-- Delete non blizzlike graveyards for Deeprun Tram
DELETE FROM `game_graveyard_zone` WHERE  `id`=852 AND `ghost_zone`=2257;
DELETE FROM `game_graveyard_zone` WHERE  `id`=101 AND `ghost_zone`=2257;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
