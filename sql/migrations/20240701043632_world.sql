SET NAMES utf8;
DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240701043632');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240701043632');
-- Add your query below.


-- Add texts for trial account restrictions.
SET NAMES utf8;
INSERT INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (182, 'You may only whisper to players who have you on their friend list.', '당신을 친구 목록에 추가한 플레이어에게만 귓속말을 할 수 있습니다.', 'Vous ne pouvez chuchoter qu\'aux joueurs qui vous ont sur leur liste d\'amis.', 'Sie dürfen nur mit Spielern flüstern, die Sie auf ihrer Freundesliste haben.', '您只能与将您添加到好友列表中的玩家私聊。', '您只能對好友清單中有您的玩家耳語。', 'Sólo puedes susurrarle a los jugadores que te tengan en su lista de amigos.', 'Sólo puedes susurrarle a los jugadores que te tengan en su lista de amigos.', 'Вы можете шептаться только с игроками, у которых вы есть в списке друзей.');
INSERT INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (183, 'You may only send messages in private chat channels.', '비공개 채팅 채널에서만 메시지를 보낼 수 있습니다.', 'Vous ne pouvez envoyer des messages que sur des canaux de discussion privés.', 'Sie können nur in privaten Chat-Kanälen Nachrichten senden.', '您只能在私人聊天频道中发送消息。', '您只能在私人聊天頻道中發送訊息。', 'Sólo puedes enviar mensajes en canales de chat privados.', 'Sólo puedes enviar mensajes en canales de chat privados.', 'Вы можете отправлять сообщения только в приватные каналы чата.');
INSERT INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (184, 'Trial accounts cannot perform that action.', '무료 체험 계정으로는 해당 기능을 사용할 수 없습니다.', 'Les comptes d\'essai ne peuvent pas accomplir cette action.', 'Diese Aktion ist mit Gästeaccounts nicht durchführbar.', '试玩帐号无法进行该动作', '試玩帳號無法進行此動作', 'Las cuentas de prueba no pueden realizar esta acción.', 'Las cuentas de prueba no pueden realizar esta acción.', 'Пользователи пробной версии не могут выполнить это действие.');


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
