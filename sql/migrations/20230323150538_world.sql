DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230323150538');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230323150538');
-- Add your query below.


-- Add check for anything that hooks into NetClient::ProcessMessage.
INSERT INTO `warden_scans` (`id`, `type`, `str`, `data`, `address`, `length`, `result`, `flags`, `penalty`, `comment`) VALUES (93, 0, NULL, NULL, 5470880, 8, '558BEC8B156CD4C0', 6, -1, 'Packet Reading Hook');
INSERT INTO `warden_scans` (`id`, `type`, `str`, `data`, `address`, `length`, `result`, `flags`, `penalty`, `comment`) VALUES (94, 0, NULL, NULL, 5474448, 8, '558BEC8B15141BC1', 8, -1, 'Packet Reading Hook');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
