DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180408015542');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180408015542');
-- Add your query below.

UPDATE `map_template` SET `ScriptName`='instance_onyxia_lair' WHERE `Entry`=249;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
