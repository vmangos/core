DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260109114512');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260109114512');
-- Add your query below.


-- Fix Frenzied Pterrodax stuck inside rock.
UPDATE `creature` SET `position_x`=-7862.71, `position_y`=-820.246, `position_z`=-272.673, `orientation`=1.54736, `wander_distance`=0, `movement_type`=2 WHERE `guid`=24617;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES 
(24617, 1, -7862.71, -820.246, -272.673, 100, 0, 0.000000, 0),
(24617, 2, -7850.13, -819.456, -271.905, 100, 0, 0.000000, 0),
(24617, 3, -7863.47, -829.136, -271.463, 100, 0, 0.000000, 0),
(24617, 4, -7874.54, -838.432, -271.936, 100, 0, 0.000000, 0),
(24617, 5, -7864.75, -847.143, -269.884, 100, 0, 0.000000, 0),
(24617, 6, -7874.54, -838.432, -271.936, 100, 0, 0.000000, 0),
(24617, 7, -7863.47, -829.136, -271.463, 100, 0, 0.000000, 0),
(24617, 8, -7850.13, -819.456, -271.905, 100, 0, 0.000000, 0);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
