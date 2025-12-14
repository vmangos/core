DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20231205020742');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20231205020742');
-- Add your query below.


-- Will of Shahram and Holy Strength should have separate aura slot per caster.
UPDATE `spell_template` SET `customFlags` = (`customFlags` | 4096) WHERE `entry` IN (16598, 20007);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
