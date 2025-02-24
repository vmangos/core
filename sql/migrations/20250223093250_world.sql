DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250223093250');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250223093250');
-- Add your query below.

-- Add temporary battlebot messages
INSERT INTO `mangos_string` (`entry`, `content_default`) VALUES 
(185, 'A temporary level %u alliance battlebot has been added to queue %u'),
(186, 'A temporary level %u horde battlebot has been added to queue %u');

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
