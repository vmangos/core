DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200717023249');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200717023249');
-- Add your query below.


-- Make Essence of the Red ignore invulnerability effects.
INSERT INTO `spell_mod` (`ID`, `Attributes`, `Comment`) VALUES (23513, 536870912, 'Essence of the Red - Ignore Invulnerability');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
