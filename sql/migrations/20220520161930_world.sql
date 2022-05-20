DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220520161930');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220520161930');
-- Add your query below.


-- Fix Moonfury talent not affecting Wrath.
DELETE FROM `spell_effect_mod` WHERE `id` IN (16896, 16897, 16899, 16900, 16901);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
