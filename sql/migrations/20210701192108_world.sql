DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210701192108');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210701192108');
-- Add your query below.


-- Remove not needed hack of spell Tame Ice Claw Bear.
DELETE FROM `spell_effect_mod` WHERE `Id`=19597;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
