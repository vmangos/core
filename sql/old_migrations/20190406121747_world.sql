DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190406121747');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190406121747');
-- Add your query below.


-- Fix Judgement of Wisdom before 1.9.
INSERT INTO `spell_mod` (`ID`, `SpellFamilyName`, `SpellFamilyFlags`, `Comment`) VALUES (20186, 10, 524288, 'Judgement of Wisdom Rank 1');
INSERT INTO `spell_mod` (`ID`, `SpellFamilyName`, `SpellFamilyFlags`, `Comment`) VALUES (20354, 10, 524288, 'Judgement of Wisdom Rank 2');
INSERT INTO `spell_mod` (`ID`, `SpellFamilyName`, `SpellFamilyFlags`, `Comment`) VALUES (20355, 10, 524288, 'Judgement of Wisdom Rank 3');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
