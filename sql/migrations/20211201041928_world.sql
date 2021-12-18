DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211201041928');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211201041928');
-- Add your query below.


-- Add gameobjects spawned after completeing quest A Grave Situation.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`) VALUES (17269, 164826, 1, -7211.86, -3932.19, 8.93922, 4.53786, 0, 0, -0.766044, 0.642789, -9, -9, 1, 100);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`) VALUES (17352, 164827, 1, -7211.92, -3932.16, 8.94006, 4.90438, 0, 0, -0.636078, 0.771625, -9, -9, 1, 100);

-- Add completion script for quest A Grave Situation.
DELETE FROM `quest_end_scripts` WHERE `id`=3913;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3913, 0, 9, 17269, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A Grave Situation: Respawn GameObject Aura 1 Linken');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3913, 0, 9, 17352, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A Grave Situation: Respawn GameObject Aura 2 Linken');
UPDATE `quest_template` SET `CompleteScript`=3913 WHERE `entry`=3913;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
