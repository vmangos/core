DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20231126204249');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20231126204249');
-- Add your query below.


-- Add strings for .cheat debugtargetinfo command.
INSERT INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (694, 'DEBUG TARGET INFO cheat is ON', '디버그 대상 정보 치트가 활성화되었습니다.', 'La triche DEBUG TARGET INFO est activée', 'Der DEBUG TARGET INFO-Cheat ist aktiviert', '调试目标信息作弊已开启', '調試目標資訊作弊已開啟', 'DEBUG INFO OBJETIVO está activada', NULL, 'Чит DEBUG TARGET INFO ВКЛЮЧЕН');
INSERT INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (695, 'DEBUG TARGET INFO cheat is OFF', '디버그 대상 정보 치트가 비활성화되었습니다.', 'La triche DEBUG TARGET INFO est désactivée\r\n', 'Der DEBUG-TARGET-INFO-Cheat ist AUS', '调试目标信息作弊已关闭', '調試目標資訊作弊已關閉', 'DEBUG INFO OBJETIVO está desactivada', NULL, 'Чит DEBUG TARGET INFO ОТКЛЮЧЕН.');
INSERT INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (696, 'You set debug target info mode to %s for %s.', '디버그 대상 정보 모드를 %s에 대해 %s(으)로 설정했습니다.', 'Vous avez défini le mode d\'informations sur la cible de débogage sur %s pour %s.', 'Sie haben den Debugziel-Infomodus für %s auf %s festgelegt.', '您将 %s 的调试目标信息模式设置为 %s。', '您將 %s 的偵錯目標資訊模式設定為 %s。', 'Configura el modo de información de destino de depuración en %s para %s.', NULL, 'Вы устанавливаете режим целевой информации отладки %s для %s.');
INSERT INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (697, 'Your debug target info mode has been turned %s by %s.', '디버그 대상 정보 모드가 %s에 의해 %s로 전환되었습니다.', 'Votre mode d\'informations sur la cible de débogage a été activé %s par %s.', 'Ihr Debugziel-Infomodus wurde %s von %s aktiviert.', '您的调试目标信息模式已由 %s 更改为 %s。', '您的偵錯目標資訊模式已由 %s 變更為 %s。', 'Su modo de información de destino de depuración ha sido activado %s por %s.', NULL, 'Ваш режим целевой информации отладки был включен %s пользователем %s.');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
