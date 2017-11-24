DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171121235247');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171121235247');
-- Add your query below.

REPLACE INTO spell_mod (`Id`, `SpellFamilyName`, `Comment`) VALUES (23697, 0, 'Alterac Spring Water allow stacking');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
