DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210610120553');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210610120553');
-- Add your query below.


-- Remove custom changes to Mind Flay.
DELETE FROM `spell_mod` WHERE `id` IN (15407, 17311, 17312, 17313, 17314, 18807);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
