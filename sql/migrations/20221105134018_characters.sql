DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20221105134018');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20221105134018');
-- Add your query below.

DELETE FROM `character_queststatus` WHERE `quest` IN(8388, 8367, 8371, 8385);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
