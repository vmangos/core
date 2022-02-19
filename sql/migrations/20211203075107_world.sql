DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211203075107');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211203075107');
-- Add your query below.


-- Start script for quest Breaking the Ward.
DELETE FROM `quest_start_scripts` WHERE `id`=3508;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(3508, 0, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Breaking the Ward: Loramus Thalipedes - Turn to Player'),
(3508, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Breaking the Ward: Loramus Thalipedes - Remove Npc Flags'),
(3508, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4489, 0, 0, 0, 0, 0, 0, 0, 0, 'Breaking the Ward: Loramus Thalipedes - Say Text'),
(3508, 1, 15, 12655, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Breaking the Ward: Loramus Thalipedes - Cast Spell Enlightenment'),
(3508, 4, 28, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Breaking the Ward: Loramus Thalipedes - Kneel Down'),
(3508, 9, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Breaking the Ward: Loramus Thalipedes - Stand Up'),
(3508, 9, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Breaking the Ward: Loramus Thalipedes - Add Npc Flags');
UPDATE `quest_template` SET `StartScript`=3508 WHERE `entry`=3508;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
