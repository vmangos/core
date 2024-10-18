SET NAMES utf8;
DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20241013111609');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20241013111609');

-- add locales for hunter quest items.
SET NAMES utf8;
DELETE FROM `locales_item` WHERE `entry` IN (15911, 15913, 15914, 15915, 15916, 15917, 15919, 15920, 15921, 15922, 15923);
INSERT INTO `locales_item`
(entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, description_loc1, description_loc2, description_loc3, description_loc4, description_loc5, description_loc6, description_loc7, description_loc8)
VALUES(15911, '조련용 막대', 'Bâtonnet de domptage', 'Zähmerrute', '驯兽棒', '馴獸棒', 'Fusta de domador', 'Fusta de doma', 'Хлыст приручения', '', '', '', '', '', '', '', '');
INSERT INTO `locales_item`
(entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, description_loc1, description_loc2, description_loc3, description_loc4, description_loc5, description_loc6, description_loc7, description_loc8)
VALUES(15913, '조련용 막대', 'Bâtonnet de domptage', 'Zähmerrute', '驯兽棒', '馴獸棒', 'Fusta de domador', 'Fusta de doma', 'Хлыст приручения', '', '', '', '', '', '', '', '');
INSERT INTO `locales_item`
(entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, description_loc1, description_loc2, description_loc3, description_loc4, description_loc5, description_loc6, description_loc7, description_loc8)
VALUES(15914, '조련용 막대', 'Bâtonnet de domptage', 'Zähmerrute', '驯兽棒', '馴獸棒', 'Fusta de domador', 'Fusta de doma', 'Хлыст приручения', '', '', '', '', '', '', '', '');
INSERT INTO `locales_item`
(entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, description_loc1, description_loc2, description_loc3, description_loc4, description_loc5, description_loc6, description_loc7, description_loc8)
VALUES(15915, '조련용 막대', 'Bâtonnet de domptage', 'Zähmerrute', '驯兽棒', '馴獸棒', 'Fusta de domador', 'Fusta de doma', 'Хлыст приручения', '', '', '', '', '', '', '', '');
INSERT INTO `locales_item`
(entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, description_loc1, description_loc2, description_loc3, description_loc4, description_loc5, description_loc6, description_loc7, description_loc8)
VALUES(15916, '조련용 막대', 'Bâtonnet de domptage', 'Zähmerrute', '驯兽棒', '馴獸棒', 'Fusta de domador', 'Fusta de doma', 'Хлыст приручения', '', '', '', '', '', '', '', '');
INSERT INTO `locales_item`
(entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, description_loc1, description_loc2, description_loc3, description_loc4, description_loc5, description_loc6, description_loc7, description_loc8)
VALUES(15917, '조련용 막대', 'Bâtonnet de domptage', 'Zähmerrute', '驯兽棒', '馴獸棒', 'Fusta de domador', 'Fusta de doma', 'Хлыст приручения', '', '', '', '', '', '', '', '');
INSERT INTO `locales_item`
(entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, description_loc1, description_loc2, description_loc3, description_loc4, description_loc5, description_loc6, description_loc7, description_loc8)
VALUES(15919, '조련용 막대', 'Bâtonnet de domptage', 'Zähmerrute', '驯兽棒', '馴獸棒', 'Fusta de domador', 'Fusta de doma', 'Хлыст приручения', '', '', '', '', '', '', '', '');
INSERT INTO `locales_item`
(entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, description_loc1, description_loc2, description_loc3, description_loc4, description_loc5, description_loc6, description_loc7, description_loc8)
VALUES(15920, '조련용 막대', 'Bâtonnet de domptage', 'Zähmerrute', '驯兽棒', '馴獸棒', 'Fusta de domador', 'Fusta de doma', 'Хлыст приручения', '', '', '', '', '', '', '', '');
INSERT INTO `locales_item`
(entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, description_loc1, description_loc2, description_loc3, description_loc4, description_loc5, description_loc6, description_loc7, description_loc8)
VALUES(15921, '조련용 막대', 'Bâtonnet de domptage', 'Zähmerrute', '驯兽棒', '馴獸棒', 'Fusta de domador', 'Fusta de doma', 'Хлыст приручения', '', '', '', '', '', '', '', '');
INSERT INTO `locales_item`
(entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, description_loc1, description_loc2, description_loc3, description_loc4, description_loc5, description_loc6, description_loc7, description_loc8)
VALUES(15922, '조련용 막대', 'Bâtonnet de domptage', 'Zähmerrute', '驯兽棒', '馴獸棒', 'Fusta de domador', 'Fusta de doma', 'Хлыст приручения', '', '', '', '', '', '', '', '');
INSERT INTO `locales_item`
(entry, name_loc1, name_loc2, name_loc3, name_loc4, name_loc5, name_loc6, name_loc7, name_loc8, description_loc1, description_loc2, description_loc3, description_loc4, description_loc5, description_loc6, description_loc7, description_loc8)
VALUES(15923, '조련용 막대', 'Bâtonnet de domptage', 'Zähmerrute', '驯兽棒', '馴獸棒', 'Fusta de domador', 'Fusta de doma', 'Хлыст приручения', '', '', '', '', '', '', '', '');

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
