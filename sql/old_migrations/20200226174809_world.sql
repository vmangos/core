DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200226174809');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200226174809');
-- Add your query below.


-- Fix spirit healer resurrection before 1.7.
INSERT INTO `spell_mod` (`ID`, `AttributesEx3`, `Comment`) VALUES (22012, 4096, 'Mass Spirit Heal - Target Dead');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
