DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220907231615');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220907231615');
-- Add your query below.


-- Add stockades teleport location.
INSERT INTO `game_tele` (`id`, `position_x`, `position_y`, `position_z`, `orientation`, `map`, `name`) VALUES (489, 48.9849, 0.483882, -16.4032, 6.28, 34, 'StormwindStockade');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
