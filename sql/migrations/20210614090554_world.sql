DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210614090554');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210614090554');
-- Add your query below.


-- Fix wrong target for spell Tame Ice Claw Bear before patch 1.12.
INSERT INTO `spell_effect_mod` (`Id`, `EffectIndex`, `EffectImplicitTargetA`, `Comment`) VALUES (19597, 1, 1, 'Tame Ice Claw Bear - Fix wrong target before patch 1.12');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
