DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201010150923');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201010150923');
-- Add your query below.


-- set correct spellcost for shield slam and mortal strike rank 2
UPDATE `npc_trainer` SET `spellcost` = 2000 WHERE `spell` IN (21555, 23926);

-- set correct run_speed for defias dockworker
UPDATE `creature_template` SET `speed_run` = 0.857143 WHERE `entry` = 6927;

-- set correct values for Argent Quartermaster Hasana gossip menu option
UPDATE `gossip_menu_option` SET `action_menu_id` = -1, `action_script_id` = 3421, `condition_id` = 478 WHERE `menu_id` = 3421;

-- remove duplicate Cenarion Hold Infantry
DELETE FROM `creature` WHERE `guid` IN (42898, 42896);
DELETE FROM `creature_movement` WHERE `id` IN (42898, 42896);

-- assign correct event to objects
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES 
(3996169, 9),
(3996165, 9),
(3996166, 9),
(3996168, 9);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
