DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260319153643');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260319153643');
-- Add your query below.


-- Remove custom changes from Ward of Laze.
DELETE FROM `spell_effect_mod` WHERE `id`=3827;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
