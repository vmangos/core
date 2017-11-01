DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171014002504');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171014002504');
-- Add your query below.

ALTER TABLE `spell_mod` ADD COLUMN `EquippedItemClass` INT(2) NULL DEFAULT '-1' AFTER `Mechanic`;
UPDATE `spell_mod` SET `EquippedItemClass`=2, `Comment`='Execute trigger' WHERE `Id`=20647;
REPLACE INTO `spell_mod` (`Id`, `EquippedItemClass`, `Comment`) VALUES (13494, 2, 'Manual Crowd Pummeler item buff');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
