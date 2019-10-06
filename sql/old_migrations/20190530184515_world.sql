DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190530184515');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190530184515');
-- Add your query below.


-- Fix missing target type for quest complete spells before 1.12.
UPDATE `spell_template` SET `effectImplicitTargetA1`=1 WHERE `effect1`=16 && `effectImplicitTargetA1`=0 && `build`<5875;
UPDATE `spell_template` SET `effectImplicitTargetA2`=1 WHERE `effect2`=16 && `effectImplicitTargetA2`=0 && `build`<5875;
UPDATE `spell_template` SET `effectImplicitTargetA3`=1 WHERE `effect3`=16 && `effectImplicitTargetA3`=0 && `build`<5875;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
