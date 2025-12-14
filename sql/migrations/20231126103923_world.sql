DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20231126103923');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20231126103923');
-- Add your query below.

-- Concussion; 16106 already set to 5464
UPDATE `spell_affect` SET `build_min`='5464' WHERE `entry` IN (16035, 16105, 16107, 16108) AND `effectId`=0;

-- Convection
UPDATE `spell_affect` SET `build_min`='5464' WHERE `entry` IN (16039, 16109, 16110, 16111, 16112) AND `effectId`=0;

-- Healing Focus/Improved Lesser Healing Wave
UPDATE `spell_affect` SET `build_min`='5464' WHERE `entry` IN (16181, 16230, 16232, 16233, 16234) AND `effectId`=0;

-- Restorative Totems/Improved Mana Spring Totem
UPDATE `spell_affect` SET `build_min`='5464' WHERE `entry` IN (16187, 16205, 16206, 16207, 16208) AND `effectId`=0;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
