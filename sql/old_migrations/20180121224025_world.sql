DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180121224025');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180121224025');
-- Add your query below.

REPLACE INTO `spell_mod` (`Id`, `Custom`, `Comment`) VALUES (14186, 4, 'Seal Fate: Positive spell');
REPLACE INTO `spell_mod` (`Id`, `Custom`, `Comment`) VALUES (14190, 4, 'Seal Fate: Positive spell');
REPLACE INTO `spell_mod` (`Id`, `Custom`, `Comment`) VALUES (14193, 4, 'Seal Fate: Positive spell');
REPLACE INTO `spell_mod` (`Id`, `Custom`, `Comment`) VALUES (14194, 4, 'Seal Fate: Positive spell');
REPLACE INTO `spell_mod` (`Id`, `Custom`, `Comment`) VALUES (14195, 4, 'Seal Fate: Positive spell');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
