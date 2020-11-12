DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200603175249');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200603175249');
-- Add your query below.


-- Add missing coordinates for Coarse Dynamite.
INSERT INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`) VALUES (9002, 0, -2625, -2423, 79);
INSERT INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`) VALUES (9003, 0, -2607, -2434, 80);
INSERT INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`) VALUES (9004, 0, -2634, -2411, 81);

-- Remove Eranikus texts from custom table.
DELETE FROM `script_texts` WHERE `entry` IN (-1001012, -1001013, -1001014, -1001015, -1001016, -1001017, -1001018, 1001019);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
