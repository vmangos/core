DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201222170619');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201222170619');
-- Add your query below.


-- correct flags to mining trainers
UPDATE `creature_template` SET `npc_flags` = 18 WHERE `entry` IN (8128, 3175, 3555);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
