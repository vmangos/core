DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260725081831');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260725081831');
-- Add your query below.

UPDATE `locales_gameobject` SET `name_loc1` = '사우스쇼어 증서' WHERE `entry` = 176486;
UPDATE `locales_gameobject` SET `name_loc1` = '어둠의 해안 불꽃' WHERE `entry` = 181563;
UPDATE `locales_gameobject` SET `name_loc1` = '크로스로드 보급품 상자' WHERE `entry` = 175708;
UPDATE `locales_gameobject` SET `name_loc1` = '타렌 밀농장 증서' WHERE `entry` = 176487;
UPDATE `locales_gameobject` SET `name_loc1` = '힐스브래드 마을의 기록부' WHERE `entry` = 1759;
UPDATE `locales_gameobject` SET `name_loc1` = '힐스브래드 불꽃' WHERE `entry` = 181566;
UPDATE `locales_gameobject` SET `name_loc1` = '힐스브래드 선언문' WHERE `entry` = 1761;
UPDATE `locales_quest` SET `Title_loc1` = '골드샤이어로의 전갈' WHERE `entry` = 54;
UPDATE `locales_quest` SET `Title_loc1` = '밀농장 습격' WHERE `entry` = 426;
UPDATE `locales_quest` SET `Title_loc1` = '사우스쇼어에 구린내 폭탄 투하' WHERE `entry` = 1657;
UPDATE `locales_quest` SET `Title_loc1` = '어둠의 해안에 생긴 문제' WHERE `entry` = 730;
UPDATE `locales_quest` SET `Title_loc1` = '크로스로드의 보급품' WHERE `entry` = 5041;
UPDATE `locales_quest` SET `Title_loc1` = '힐스브래드 전투' WHERE `entry` = 527;
UPDATE `locales_quest` SET `Title_loc1` = '힐스브래드 전투' WHERE `entry` = 528;
UPDATE `locales_quest` SET `Title_loc1` = '힐스브래드 전투' WHERE `entry` = 532;
UPDATE `locales_quest` SET `Title_loc1` = '힐스브래드 전투' WHERE `entry` = 541;
UPDATE `locales_quest` SET `Title_loc1` = '힐스브래드 전투' WHERE `entry` = 550;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
