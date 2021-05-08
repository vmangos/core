DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210508035133');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210508035133');
-- Add your query below.

DELETE FROM `script_texts` WHERE `entry` IN (-1000391, -1000392, -1000393, -1000394, -1000395, -1000396, -1000397, -1000398);
UPDATE `creature_template` SET `movement_type` = 1 WHERE `entry` = 6015;
UPDATE `creature` SET `movement_type` = 1, `wander_distance` = 6 WHERE `id` = 6015;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
