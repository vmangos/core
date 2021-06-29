DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210404181907');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210404181907');
-- Add your query below.

-- This hackfix was making Ouro's quake hit 2 times more than it should.
DELETE FROM `spell_effect_mod` WHERE `Id` = 26093;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
