SET NAMES utf8;
DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240215110536');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240215110536');
-- Add your query below.


-- Move some existing texts.
UPDATE `mangos_string` SET `entry`=600 WHERE `entry`=616;
UPDATE `mangos_string` SET `entry`=601 WHERE `entry`=617;
UPDATE `mangos_string` SET `entry`=602 WHERE `entry`=618;

-- Correct some locales.
SET NAMES utf8;
UPDATE `mangos_string` SET `content_loc3`='KEIN STROMKOSTEN-Cheat ist AN' WHERE `entry`=621;
UPDATE `mangos_string` SET `content_loc8`='Чит ДЕБАФФ ИММУНИТЕТ включен' WHERE `entry`=625;
UPDATE `mangos_string` SET `content_loc8`='Чит ДЕБАФФ ИММУНИТЕТ выключен' WHERE `entry`=626;
UPDATE `mangos_string` SET `content_loc8`='Чит ВСЕГДА КРИТ включен' WHERE `entry`=629;
UPDATE `mangos_string` SET `content_loc8`='Чит ВСЕГДА КРИТ выключен' WHERE `entry`=630;
UPDATE `mangos_string` SET `content_loc8`='Чит БЕЗ ПРОВЕРКИ КАСТА включен' WHERE `entry`=633;
UPDATE `mangos_string` SET `content_loc8`='Чит БЕЗ ПРОВЕРКИ КАСТА выключен' WHERE `entry`=634;
UPDATE `mangos_string` SET `content_loc8`='Чит ВСЕГДА ПРОК включен' WHERE `entry`=637;
UPDATE `mangos_string` SET `content_loc8`='Чит ВСЕГДА ПРОК выключен' WHERE `entry`=638;
UPDATE `mangos_string` SET `content_loc3`='TRIGGER PASS-Cheat ist AN' WHERE `entry`=641;
UPDATE `mangos_string` SET `content_loc8`='Чит TRIGGER PASS выключен' WHERE `entry`=642;
UPDATE `mangos_string` SET `content_loc3`='IGNORE TRIGGERS-Cheat ist AN' WHERE `entry`=645;
UPDATE `mangos_string` SET `content_loc3`='IGNORE TRIGGERS-Cheat ist AUS' WHERE `entry`=646;
UPDATE `mangos_string` SET `content_loc8`='Чит IGNORE TRIGGERS выключен' WHERE `entry`=646;
UPDATE `mangos_string` SET `content_loc8`='Чит DEBUG TARGET INFO включен' WHERE `entry`=694;
UPDATE `mangos_string` SET `content_loc8`='Чит DEBUG TARGET INFO выключен' WHERE `entry`=695;

-- Add texts for fly mode cheat.
INSERT INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (615, 'You set fly mode to %s for %s.', '%s에 대해 비행 모드를 %s로 설정했습니다.', 'Vous avez défini le mode de vol sur %s pour %s.', 'Sie haben den Flugmodus für %s auf %s eingestellt.', '您将 %s 的飞行模式设置为 %s。', '您將 %s 的飛行模式設定為 %s。', 'Configuraste el modo de vuelo en %s para %s.', NULL, 'Вы устанавливаете режим полета на %s для %s.');
INSERT INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (616, 'Your fly mode has been turned %s by %s.', '비행 모드가 %s에 의해 %s로 전환되었습니다.', 'Votre mode de vol a été activé %s par %s.', 'Ihr Flugmodus wurde von %s umgestellt.', '您的飞行模式已被 %s 更改为 %s。', '您的飛行模式已被 %s 更改為 %s。', '%s ha cambiado tu modo de vuelo.', NULL, 'Ваш режим полета был изменен на %s на %s.');
INSERT INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (617, 'FLY MODE cheat is ON', '비행 모드 치트가 켜져 있습니다.', 'La triche FLY MODE est activée', 'FLUGMODUS-Cheat is AN', '飞行模式作弊已开启', '飛航模式作弊已開啟', 'El truco del MODO VUELO está ACTIVADO', NULL, 'Чит РЕЖИМ ПОЛЕТА включен');
INSERT INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (618, 'FLY MODE cheat is OFF', '비행 모드 치트가 OFF입니다', 'La triche FLY MODE est désactivée', 'FLUGMODUS-Cheat is AUS', '飞行模式作弊已关闭', '飛航模式作弊已關閉', 'El truco del MODO VUELO está APAGADO', NULL, 'Чит РЕЖИМ ПОЛЕТА выключен');

-- Remove old gm fly text.
DELETE FROM `mangos_string` WHERE `entry`=477;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
