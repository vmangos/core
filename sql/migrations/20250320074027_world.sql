DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250320074027');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250320074027');
-- Add your query below.

INSERT INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`, `build_min`, `build_max`) VALUES (19527, 409, 847.103, -816.153, -229.775, 4.344, 0, 5875);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
