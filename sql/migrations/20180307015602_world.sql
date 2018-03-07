DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180307015602');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180307015602');
-- Add your query below.

DELETE FROM `spell_group_stack_rules` WHERE `group_id`=1069;
DELETE FROM `spell_group` WHERE `group_id`=1069;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
