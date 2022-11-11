DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220719120157');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220719120157');
-- Add your query below.


-- Zevrim Thornhoof's Sacrifice should be reflectable.
-- https://youtu.be/7UD7X3A_8tU?t=245
DELETE FROM `spell_mod` WHERE `id`=22651;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
