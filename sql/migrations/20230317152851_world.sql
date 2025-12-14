SET NAMES utf8;
DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230317152851');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230317152851');
-- Add your query below.


-- Add notification text for warned accounts.
SET NAMES utf8;
INSERT INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (283, '|cFFFF5500Your account has received a warning: %s|r', '|cFFFF5500귀하의 계정이 경고를 받았습니다: %s|r', '|cFFFF5500Votre compte a recu un avertissement: %s|r', '|cFFFF5500Ihr Konto hat eine Warnung erhalten: %s|r', '|cFFFF5500您的帐户已收到警告: %s|r', '|cFFFF5500您的帳戶已收到警告: %s|r', '|cFFFF5500Tu cuenta ha recibido una advertencia: %s|r', '|cFFFF5500Tu cuenta ha recibido una advertencia: %s|r', '|cFFFF5500Ваш аккаунт получил предупреждение: %s|r');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
