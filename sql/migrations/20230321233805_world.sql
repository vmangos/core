DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230321233805');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230321233805');
-- Add your query below.

INSERT INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (306, '|cFFFF5500Your account has %u warnings from the Everlook team. Your last warning was: %s|r', '|cFFFF5500귀하의 계정에는 Everlook 팀의 %u 경고가 있습니다. 마지막 경고: %s|r', '|cFFFF5500Votre compte contient %u avertissements de l\'équipe Everlook. Votre dernier avertissement était : %s|r', '|cFFFF5500Ihr Konto hat %u Warnungen vom Everlook-Team. Ihre letzte Warnung war: %s|r', '|cFFFF5500您的帐户有 %u 个来自 Everlook 团队的警告。您的最后一次警告是：%s|r', '|cFFFF5500您的帳戶已收到警告: %s|r', '|cFFFF5500Tu cuenta tiene %u advertencias del equipo de Everlook. Tu última advertencia fue: %s|r', '|cFFFF5500Tu cuenta ha recibido una advertencia: %s|r', '|cFFFF5500В вашем аккаунте есть %u предупреждений от команды Everlook. Ваше последнее предупреждение было: %s|r');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
