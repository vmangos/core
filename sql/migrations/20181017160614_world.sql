DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181017160614');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181017160614');
-- Add your query below.


-- Fix wrong client data.
UPDATE `skill_line_ability` SET `learnOnGetSkill`=0 WHERE `spellId` IN (4073, 12749, 19804, 13258, 13166);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
