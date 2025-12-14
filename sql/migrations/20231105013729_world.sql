DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20231105013729');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20231105013729');
-- Add your query below.


-- Remove custom change to icon of Consecration.
DELETE FROM `spell_mod` WHERE `Id` IN (20116, 20922, 20923, 20924, 26573);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
