DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20221210165326');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20221210165326');
-- Add your query below.

DELETE FROM `spell_mod` WHERE Id IN (25914,25913,25903);
INSERT INTO `spell_mod` (`Id`, `manaCost`, `Comment`) VALUES (25914, 225, 'Holy shock dummyspell - inherit manacost from holy shock for illumination proc');
INSERT INTO `spell_mod` (`Id`, `manaCost`, `Comment`) VALUES (25913, 275, 'Holy shock dummyspell - inherit manacost from holy shock for illumination proc');
INSERT INTO `spell_mod` (`Id`, `manaCost`, `Comment`) VALUES (25903, 325, 'Holy shock dummyspell - inherit manacost from holy shock for illumination proc');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
