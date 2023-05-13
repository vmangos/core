DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230412202824');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230412202824');
-- Add your query below.


-- Add script to despawn containment coffers if player doesn't loot them.
UPDATE `gameobject_template` SET `script_name`='go_containment_coffer' WHERE `entry`=122088;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
