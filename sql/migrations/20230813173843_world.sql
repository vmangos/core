DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230813173843');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230813173843');
-- Add your query below.

INSERT INTO `warden_scans` (`id`, `type`, `str`, `data`, `address`, `length`, `result`, `flags`, `penalty`, `build_min`, `build_max`, `comment`) VALUES (97, 4, 'World\\KhazModan\\Blackrock\\PassiveDoodads\\Doors\\BlackRockDoorSingle.m2', NULL, 0, 0, '2A43947CA91F92B6698A5286A7B883EFF967D6B4', 0, -1, 4297, 6141, 'UBRS door');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
