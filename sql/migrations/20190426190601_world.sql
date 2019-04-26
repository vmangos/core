DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190426190601');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190426190601');
-- Add your query below.


-- Frost Warding change effect 2 from Dummy to Apply Aura Dummy.
UPDATE `spell_template` SET `effect2`=6, `effectApplyAuraName2`=4 WHERE `entry` IN (11189, 28332) && `build` > 5302;

-- Improve Fire Ward change effect 1 from Dummy to Apply Aura Dummy.
UPDATE `spell_template` SET `effect1`=6, `effectApplyAuraName1`=4 WHERE `entry` IN (11094, 13043) && `build` > 5302;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
