SET NAMES utf8;
DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240103104231');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20240103104231');
-- Add your query below.


SET NAMES utf8;
INSERT INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (180, '[PlayerBotMgr] |cff1b24d8Adding level %u alliance battlebot to bg queue %u.|r', '[PlayerBotMgr] |cff1b24d8레벨 %u 얼라이언스 배틀봇을 bg 대기열 %u에 추가합니다. |r', '[PlayerBotMgr] |cff1b24d8Ajout de la Alliance Battlebot de niveau %u à la file d\'attente BG %u.|r', '[PlayerBotMgr] |cff1b24d8Füge einen Level %u Allianz-Battlebot zur Warteschlange %u hinzu.|r', '[PlayerBotMgr] |cff1b24d8将 %u 级联盟Battlebot添加到BG队列 %u。|r', '[PlayerBotMgr] |cff1b24d8將 %u 級聯盟Battlebot添加到BG隊列 %u。|r', '[PlayerBotMgr] |cff1b24d8Agregar nivel %u Alliance Battlebot a BG Queue %u.|r', NULL, '[PlayerBotMgr] |cff1b24d8Добавление уровня %u Alliance Battlebot в очередь BG %u.|r');
INSERT INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (181, '[PlayerBotMgr] |cffe1101cAdding level %u horde battlebot to bg queue %u.|r', '[PlayerBotMgr] |cffe1101c레벨 %u 호드 배틀봇을 bg 대기열 %u에 추가합니다.|r', '[PlayerBotMgr] |cffe1101cAjout de la Horde Battlebot de niveau %u à la file d\'attente BG %u.|r', '[PlayerBotMgr] |cffe1101cFüge einen Level %u Horde-Battlebot zur Warteschlange %u hinzu.|r', '[PlayerBotMgr] |cffe1101c将 %u 级部落Battlebot添加到BG队列 %u。|r', '[PlayerBotMgr] |cffe1101c將 %u 級部落Battlebot添加到BG隊列 %u。|r', '[PlayerBotMgr] |cffe1101cAgregar nivel %u Horde Battlebot a BG Queue %u.|r', NULL, '[PlayerBotMgr] |cffe1101cДобавление уровня %u Horde Battlebot в очередь BG %u.|r');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
