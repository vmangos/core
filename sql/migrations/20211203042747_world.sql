DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211203042747');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211203042747');
-- Add your query below.


-- Completion script for quest The Stave of Equinex.
DELETE FROM `quest_end_scripts` WHERE `id`=2879;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(2879, 0, 9, 50195, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Stave of Equinex: Equinex Monolith Lights 1 - Respawn GameObject'),
(2879, 0, 9, 50224, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Stave of Equinex: Equinex Monolith Lights 2 - Respawn GameObject');
UPDATE `quest_template` SET `CompleteScript`=2879 WHERE `entry`=2879;

-- Add spawn for Equinex Monolith Lights 1.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`) VALUES (50195, 146082, 1, -2976.61, 2743.18, 52.4701, 0.680677, 0, 0, 0.333806, 0.942642, -22, -22, 1, 100);

-- Add spawn for Equinex Monolith Lights 2.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`) VALUES (50224, 146083, 1, -2977.17, 2743.14, 52.4016, 6.21337, 0, 0, -0.0348988, 0.999391, -22, -22, 1, 100);

-- Correct name, data and entry for Equinex Monolith Spell Focus.
UPDATE `gameobject_template` SET `displayId`=327, `name`='Equinex Monolith Spell Focus (DND)', `entry`=144013, `data3`=1 WHERE `entry`=300138;
UPDATE `gameobject` SET `id`=144013 WHERE `id`=300138;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
