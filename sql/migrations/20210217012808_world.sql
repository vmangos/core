DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210217012808');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210217012808');
-- Add your query below.


-- Define proc chance for copy of Seal of Command used for seal twisting.
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`, `build_min`, `build_max`) VALUES (33006, 0, 0, 0, 0, 0, 0, 0, 7, 0, 1000, 0, 5875);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
