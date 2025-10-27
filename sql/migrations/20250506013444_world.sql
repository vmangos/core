DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250506013444');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250506013444');
-- Add your query below.


REPLACE INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (700, 'You set beastmaster mode to %s for %s.', '비스트 마스터 모드를 %s에 대해 %s로 설정합니다.', 'Vous définissez le mode Beastmaster sur %s pour %s.', 'Sie setzen den Beastmaster -Modus für %s auf %s.', '您将野兽主模式设置为%s的%s。', NULL, 'Establece el modo maestro de bestia en %s para %s.', NULL, 'Вы устанавливаете режим Beastmaster на %s для %s.');
REPLACE INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (701, 'Your Beastmaster mode has been turned %s by %s.', '짐승 마스터 모드는 %s 만 %s로 바뀌 었습니다.', 'Votre mode Beastmaster a été tourné %s par %s.', 'Ihr Beastmaster -Modus wurde um %s um %s gedreht.', '您的野兽主模式已被%s划分为%s。', NULL, 'Su modo Beastmaster ha sido girado %s por %s.', NULL, 'Ваш режим Beastmaster был повернут %s на %s.');
REPLACE INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (702, 'BEASTMASTER mode is ON', '비스트 마스터 모드가 켜져 있습니다', 'Le mode BEASTMASTER est allumé', 'Der BEASTMASTER-Modus ist eingeschaltet', '野兽大师模式开启', NULL, 'El modo BEASTMASTER está encendido', NULL, 'Режим BEASTMASTER включен');
REPLACE INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (703, 'BEASTMASTER mode is OFF', '비스트 마스터 모드가 꺼져 있습니다', 'Le mode BEASTMASTER est désactivé', 'Der BEASTMASTER-Modus ist ausgeschaltet', '野兽大师模式关闭', NULL, 'El modo BEASTMASTER está apagado', NULL, 'Режим BEASTMASTER выключен');


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
