DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20251227013205');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20251227013205');
-- Add your query below.


-- Remove obsolete hacks to Furious Howl.
DELETE FROM `spell_mod` WHERE `Id` IN (24597, 24603, 24604, 24605);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
