DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230718054709');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230718054709');
-- Add your query below.


-- Remove Redundant Pool_Pool
DELETE FROM `pool_pool` WHERE `pool_id` IN (21551, 21552, 21553);
UPDATE `pool_template` SET `max_limit` = 3 WHERE `entry` = 21553;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
