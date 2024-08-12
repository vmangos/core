SET NAMES utf8;
DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240107103630');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20240107103630');
-- Add your query below.


SET NAMES utf8;
INSERT INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (50, 'This command is not available to you.', '이 명령은 사용할 수 없습니다.', 'Cette commande n\'est pas disponible pour vous.', 'Dieser Befehl steht Ihnen nicht zur Verfügung.', '您无法使用此命令。', '您無法使用此命令。', 'Este comando no está disponible para usted.', 'Este comando no está disponible para usted.', 'Эта команда вам недоступна.');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
