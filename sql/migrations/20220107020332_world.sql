DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220107020332');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220107020332');
-- Add your query below.


-- Assign "Skip Missing Targets" flag to Shadowy Assassin's waypoints command.
UPDATE `generic_scripts` SET `data_flags` = `data_flags` | 16 WHERE `command`=60 && `id` BETWEEN 243517 AND 243526;

-- Remove Move Random commands from Shadowy Assassin spawn script, and assign it as default movement.
UPDATE `creature_template` SET `movement_type`=1 WHERE `entry`=2434;
DELETE FROM `generic_scripts` WHERE `command`=20 && `id` BETWEEN 243513 AND 243526;
UPDATE `creature_movement_scripts` SET `dataint2`=0 WHERE `command`=10 && `id`=243501 && `dataint2` BETWEEN 243513 AND 243516;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
