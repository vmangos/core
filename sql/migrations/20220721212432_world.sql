DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220721212432');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220721212432');
-- Add your query below.

-- SFK: Arugal intro script
DELETE FROM `generic_scripts` WHERE `id`=10000;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(10000, 0, 0, 4, 46, 134217728, 1, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'SFK Intro - Arugal Invisible'),
(10000, 0, 0, 37, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'SFK Intro - Set Instance Data'),
(10000, 5, 0, 4, 46, 134217728, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'SFK Intro - Arugal Visible'),
(10000, 5, 0, 15, 10418, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'SFK Intro - Arugal Cast Teleport'),
(10000, 9, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'SFK Intro - Arugal Emote Talk'),
(10000, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1456, 0, 0, 0, 0, 0, 0, 0, 0, 'SFK Intro - Arugal Say Text 0'),
(10000, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5680, 0, 0, 0, 0, 0, 0, 0, 0, 'SFK Intro - Arugal Say Text 1'),
(10000, 12, 0, 1, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'SFK Intro - Arugal Emote Point'),
(10000, 16, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'SFK Intro - Arugal Emote Talk'),
(10000, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5681, 0, 0, 0, 0, 0, 0, 0, 0, 'SFK Intro - Arugal Say Text 2'),
(10000, 18, 0, 28, 7, 0, 0, 0, 4444, 20, 8, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'SFK Intro - Deathstalker Vincent Set Stand State to Dead'),
(10000, 18, 0, 1, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'SFK Intro - Arugal Emote Laugh'),
(10000, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5682, 0, 0, 0, 0, 0, 0, 0, 0, 'SFK Intro - Arugal Say Text 3'),
(10000, 24, 0, 15, 7741, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'SFK Intro - Arugal Cast Teleport'),
(10000, 25, 0, 18, 22, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'SFK Intro - Arugal Despawn');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
