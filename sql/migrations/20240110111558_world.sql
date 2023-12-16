DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240110111558');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20240110111558');
-- Add your query below.


-- Remove custom change to Summon Various DND.
DELETE FROM `spell_effect_mod` WHERE `Id`=27203;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
