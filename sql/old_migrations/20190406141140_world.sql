DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190406141140');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190406141140');
-- Add your query below.


-- Fix ghost spells before 1.9.
INSERT INTO `spell_mod` (`Id`, `AttributesEx3`, `Comment`) VALUES
(8326, 1048576, 'Ghost Aura - Add death persistent attribute'),
(9036, 1048576, 'Ghost Aura - Add death persistent attribute'),
(10454, 1048576, 'Into the Rift - Add death persistent attribute');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
