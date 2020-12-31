DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200221213339');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200221213339');
-- Add your query below.


-- Fix wrong next rank for Cower in pre 1.7 builds. This appears to be a mistake by blizzard.
UPDATE `skill_line_ability` SET `superseded_by_spell`=1754 WHERE `spell_id`=1753 && `superseded_by_spell`=16829;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
