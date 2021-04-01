DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210401204014');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210401204014');
-- Add your query below.


-- change despawn type for mana surge
UPDATE `event_scripts` SET `dataint4` = 2 WHERE `id` = 1653 AND `command` = 10;

-- mana surge should not drop loot 
UPDATE `creature_template` SET `gold_min` = 0, `gold_max` = 0 WHERE `entry` = 6550;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
