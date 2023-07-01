DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230126003946');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230126003946');
-- Add your query below.


-- Define coordinates for Jin'do's Banish.
INSERT INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`, `build_min`, `build_max`) VALUES (24466, 309, -11582.9, -1251.15, 90, 4.745, 4695, 5875);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
