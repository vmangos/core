DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200516170206');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200516170206');
-- Add your query below.


-- allow wren darkspring to summon an imp
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 6376;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `action1_script`, `comment`) VALUES
(637601, 6376, 11, 100, 637601, 'Wren Darkspring - Summon Imp on Spawn');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `datalong`, `data_flags`, `comments`) VALUES
(637601, 15, 11939, 4, 'Wren Darkspring - Summon Imp on Spawn');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
