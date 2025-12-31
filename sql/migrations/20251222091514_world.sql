DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20251222091514');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20251222091514');
-- Add your query below.

UPDATE `spell_template` SET `script_name`='spell_nefarian_shadow_flame_passive' WHERE `entry` = 22992;

-- Add missing coordinates for triggered spells (CMangos)
INSERT INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`, `build_min`, `build_max`) VALUES
(22972, 469, -7538.63, -1277.56, 476.799, 0, 4375, 5875),
(22975, 469, -7557.95, -1249.87, 476.799, 0, 4375, 5875),
(22976, 469, -7579.59, -1218.76, 476.799, 0, 4375, 5875),
(22978, 469, -7497.51, -1249.17, 476.798, 0, 4375, 5875),
(22979, 469, -7519.9, -1218.85, 476.799, 0, 4375, 5875),
(22980, 469, -7540.82, -1190.7, 476.355, 0, 4375, 5875),
(22981, 469, -7461.41, -1226.29, 476.781, 0, 4375, 5875),
(22982, 469, -7483.16, -1195.39, 476.799, 0, 4375, 5875),
(22983, 469, -7504.77, -1164.43, 476.797, 0, 4375, 5875),
(22984, 469, -7524.15, -1138.16, 473.348, 0, 4375, 5875),
(22977, 469, -7599.83, -1190.94, 475.472, 0, 4375, 5875);

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
