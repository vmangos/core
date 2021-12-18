DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210826101019');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210826101019');
-- Add your query below.


-- Correct Pre 1.3 areatrigger text for Dire Maul entrance.
-- https://worldofwarcraft.judgehype.com/image/12213/#jump
INSERT INTO `areatrigger_teleport` (`id`, `patch`, `name`, `message`, `required_level`, `required_condition`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES 
(3183, 0, 'Dire Maul - Entrance 1', 'You Shall Not Pass !', 61, 0, 429, 47.4501, -153.665, -2.71439, 5.49779),
(3184, 0, 'Dire Maul - Entrance 2', 'You Shall Not Pass !', 61, 0, 429, -203.166, -322.997, -2.72467, 4.71239),
(3185, 0, 'Dire Maul - Entrance 3', 'You Shall Not Pass !', 61, 0, 429, 10.5786, -836.991, -32.3988, 6.28319),
(3186, 0, 'Dire Maul - Entrance 4', 'You Shall Not Pass !', 61, 0, 429, -65.6559, 159.561, -3.4647, 2.35619),
(3187, 0, 'Dire Maul - Entrance 5', 'You Shall Not Pass !', 61, 0, 429, 33.1083, 158.977, -3.47126, 0.785398),
(3189, 0, 'Dire Maul - Entrance 6', 'You Shall Not Pass !', 61, 0, 429, 254.92, -19.463, -2.5596, 5.49779);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
