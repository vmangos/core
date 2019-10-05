DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190430155450');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190430155450');
-- Add your query below.


-- We do not do spell progression without client progression!
DELETE FROM `spell_mod` WHERE `ID` IN (24382, 24383, 24417);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
