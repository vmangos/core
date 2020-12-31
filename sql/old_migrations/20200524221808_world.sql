DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200524221808');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200524221808');
-- Add your query below.

UPDATE `creature_template` SET `skinning_loot_id` = 0 WHERE `skinning_loot_id` = 100001;
DELETE FROM `skinning_loot_template` where `entry` = 100001;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
