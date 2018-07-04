DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180703185904');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180703185904');
-- Add your query below.

UPDATE `item_template` SET `patch`='1' WHERE  `entry`=10021 AND `patch`=0;
UPDATE `item_template` SET `patch`='1' WHERE  `entry`=10019 AND `patch`=0;

REPLACE INTO `item_template` (`entry`, `class`, `subclass`, `name`, `displayid`, `Quality`, `BuyPrice`, `SellPrice`, `InventoryType`, `ItemLevel`, `RequiredLevel`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `armor`, `delay`, `spellid_1`, `spelltrigger_1`, `spellcooldown_5`, `spellcategorycooldown_5`, `bonding`, `Material`, `MaxDurability`, `DisenchantID`) VALUES 
('10019', '4', '1', 'Dreamweave Gloves', '18999', '3', '19721', '3944', '10', '45', '40', '6', '7', '5', '4', '41', '0', '9415', '1', '0', '0', '2', '7', '30', '45'),
('10021', '4', '1', 'Dreamweave Vest', '18949', '3', '39731', '7946', '5', '45', '40', '6', '14', '5', '9', '65', '0', '9415', '1', '0', '0', '2', '7', '80', '45');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
