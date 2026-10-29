DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260725080208');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260725080208');
-- Add your query below.

UPDATE `locales_quest` SET `Title_loc1` = '크로스로드로 돌아가기' WHERE `entry` = 6386;
UPDATE `locales_item` SET `name_loc1` = '언더시티 수호병의 곰팡이 슨 카드' WHERE `entry` = 22145;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
