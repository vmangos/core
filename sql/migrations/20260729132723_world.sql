DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260729132723');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260729132723');
-- Add your query below.

-- Fix Door Not Closing
DELETE FROM `creature_movement_scripts` WHERE `id`=1491102;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1491102, 1, 0, 35, 0, 0, 0, 0, 2368, 0, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zandalar Enforcer - Orientation'),
(1491102, 2, 0, 1, 69, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zandalar Enforcer - Emote Work'),
(1491102, 6, 0, 1, 30, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zandalar Enforcer - Emote None'),
(1491102, 7, 0, 13, 0, 0, 0, 0, 180104, 20, 13, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zandalar Enforcer - Activate Gameobject'),
(1491102, 25, 0, 87, 0, 0, 0, 0, 180104, 20, 13, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zandalar Enforcer - Reset Gameobject');

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
