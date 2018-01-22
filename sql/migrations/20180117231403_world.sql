DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180117231403');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180117231403');
-- Add your query below.

INSERT INTO `spell_mod` (`Id`, `Attributes`, `Comment`) VALUES (26656, 286327056, 'Black Qiraji Battle Tank not usable in combat');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
