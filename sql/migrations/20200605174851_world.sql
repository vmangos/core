DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200605174851');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200605174851');
-- Add your query below.

UPDATE `creature_template` SET `scale` = 0.75, `movement_type` = 0 WHERE `entry` = 17066;
UPDATE `creature` SET `movement_type` = 0 WHERE `id` = 17066;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
