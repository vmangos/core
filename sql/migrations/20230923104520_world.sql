DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230923104520');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230923104520');
-- Add your query below.


-- Correct coordinates for Gnomeregan Explosion spells.
UPDATE `spell_target_position` SET `target_position_x`=-478.448, `target_position_y`=-89.3074, `target_position_z`=-146.602 WHERE `id`=12158;
UPDATE `spell_target_position` SET `target_position_x`=-562.7, `target_position_y`=-121.674, `target_position_z`=-150.862 WHERE `id`=12159;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
