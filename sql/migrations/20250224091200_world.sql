DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250224091200');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250224091200');
-- Add your query below.

-- Add temporary battlebot messages with faction colors
INSERT INTO `mangos_string` (`entry`, `content_default`) VALUES 
(185, '[PlayerBotMgr] Adding temporary level %u |cFF0070DDalliance|r battlebot to bg queue %u'),
(186, '[PlayerBotMgr] Adding temporary level %u |cFFFF0000horde|r battlebot to bg queue %u');

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
