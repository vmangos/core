DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20221013041810');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20221013041810');
-- Add your query below.


-- Revert changes made to Druid's Enrage.
UPDATE `spell_template` SET `effect2`=3, `effectImplicitTargetA2`=0, `effectApplyAuraName2`=0, `effectMiscValue2`=0, `effectBonusCoefficient2`=1 WHERE `entry`=5229 && `build` >= 5086;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
