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

-- sec correct run_speed for defias dockworker
UPDATE `creature_template` SET `speed_run` = 0.857143 WHERE `entry` = 6927;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
