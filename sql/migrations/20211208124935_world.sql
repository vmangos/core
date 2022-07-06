DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211208124935');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211208124935');
-- Add your query below.


-- Completion script for quest Plagued Lands.
DELETE FROM `quest_end_scripts` WHERE `id`=2118;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(2118, 0, 31, 11836, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plagued Lands: Terminate Script if Captured Rabid Thistle Bear is not found'),
(2118, 1, 35, 0, 0, 0, 0, 11836, 30, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plagued Lands: Tharnariun Treetender - Turn to Captured Rabid Thistle Bear'),
(2118, 2, 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plagued Lands: Tharnariun Treetender - Emote OneShotExclamation'),
(2118, 2, 13, 0, 0, 0, 0, 177187, 30, 11, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plagued Lands: Tharnarun\'s Cure - Activate GameObject'),
(2118, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5937, 0, 0, 0, 0, 0, 0, 0, 0, 'Plagued Lands: Tharnariun Treetender - Say Text'),
(2118, 2, 1, 33, 0, 0, 0, 11836, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plagued Lands: Captured Rabid Thistle Bear - Emote OneShotWound'),
(2118, 6, 28, 7, 0, 0, 0, 11836, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plagued Lands: Captured Rabid Thistle Bear - Set Stand State to Dead'),
(2118, 7, 18, 0, 0, 0, 0, 11836, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plagued Lands: Captured Rabid Thistle Bear - Despawn Creature');
UPDATE `quest_template` SET `CompleteScript`=2118 WHERE `entry`=2118;

-- Assign correct spawn orientation and respawn time for Tharnariun Treetender.
UPDATE `creature` SET `orientation`=1.91986, `spawntimesecsmin`=480, `spawntimesecsmax`=480 WHERE `id`=3701;

-- Remove hardcoded script from Tharnariun Treetender.
UPDATE `creature_template` SET `script_name`='' WHERE `entry`=3701;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
