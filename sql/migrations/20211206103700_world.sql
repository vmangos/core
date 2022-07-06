DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211206103700');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211206103700');
-- Add your query below.


-- GameObjects spawned during script.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`) VALUES
(34007, 1607, 0, -3444.01, -2352.07, 54.0603, 0.925024, 0, 0, 0.446198, 0.894935, -1, -1, 1, 100),
(34008, 1607, 0, -3443.27, -2351.39, 51.9271, 4.71239, 0, 0, -0.707107, 0.707107, -1, -1, 1, 100),
(34009, 1607, 0, -3444.09, -2353.4, 51.9224, 0.488691, 0, 0, 0.241921, 0.970296, -1, -1, 1, 100),
(34010, 1607, 0, -3441.88, -2352.9, 52.9477, 5.37562, 0, 0, -0.438371, 0.898794, -1, -1, 1, 100),
(34011, 1604, 0, -3444.03, -2352.13, 54.0601, 5.77704, 0, 0, -0.25038, 0.968148, -1, -1, 1, 100),
(34012, 1607, 0, -3451.37, -2358.24, 52.8972, 5.77704, 0, 0, -0.25038, 0.968148, -1, -1, 1, 100),
(34013, 1607, 0, -3453.76, -2358.25, 53.9704, 4.60767, 0, 0, -0.743144, 0.669131, -1, -1, 1, 100),
(34014, 1607, 0, -3453.48, -2356.71, 53.742, 3.4034, 0, 0, -0.991445, 0.130528, -1, -1, 1, 100),
(34015, 1607, 0, -3453.4, -2359.79, 51.8986, 2.86234, 0, 0, 0.990268, 0.139175, -1, -1, 1, 100),
(34016, 1604, 0, -3453.85, -2358.36, 54.1786, 6.17847, 0, 0, -0.0523357, 0.99863, -1, -1, 1, 100),
(34017, 1605, 0, -3445.06, -2351.94, 54.1847, 4.97419, 0, 0, -0.608761, 0.793354, -1, -1, 1, 100),
(34018, 1605, 0, -3443.92, -2353.34, 53.5624, 2.86234, 0, 0, 0.990268, 0.139175, -1, -1, 1, 100),
(34019, 1605, 0, -3443.19, -2351.28, 53.5596, 5.63741, 0, 0, -0.317305, 0.948324, -1, -1, 1, 100),
(34020, 1605, 0, -3453.66, -2358.2, 54.0353, 0, 0, 0, 0, 1, -1, -1, 1, 100),
(34021, 1605, 0, -3452.61, -2359.31, 53.5008, 0.488691, 0, 0, 0.241921, 0.970296, -1, -1, 1, 100),
(34022, 1605, 0, -3452.63, -2357.11, 54.0741, 5.37562, 0, 0, -0.438371, 0.898794, -1, -1, 1, 100);

-- Completion script for quest Nek'rosh's Gambit.
DELETE FROM `quest_end_scripts` WHERE `id`=465;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(465, 0, 9, 34007, 39, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nek\'rosh\'s Gambit: Respawn GameObject Big Flame Emitter'),
(465, 0, 9, 34008, 39, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nek\'rosh\'s Gambit: Respawn GameObject Big Flame Emitter'),
(465, 0, 9, 34009, 39, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nek\'rosh\'s Gambit: Respawn GameObject Big Flame Emitter'),
(465, 0, 9, 34010, 39, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nek\'rosh\'s Gambit: Respawn GameObject Big Flame Emitter'),
(465, 0, 9, 34011, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nek\'rosh\'s Gambit: Respawn GameObject Black Smoke Emitter'),
(465, 4, 9, 34012, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nek\'rosh\'s Gambit: Respawn GameObject Big Flame Emitter'),
(465, 4, 9, 34013, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nek\'rosh\'s Gambit: Respawn GameObject Big Flame Emitter'),
(465, 4, 9, 34014, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nek\'rosh\'s Gambit: Respawn GameObject Big Flame Emitter'),
(465, 4, 9, 34015, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nek\'rosh\'s Gambit: Respawn GameObject Big Flame Emitter'),
(465, 4, 9, 34016, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nek\'rosh\'s Gambit: Respawn GameObject Black Smoke Emitter'),
(465, 34, 9, 34017, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nek\'rosh\'s Gambit: Respawn GameObject White Smoke Emitter'),
(465, 34, 9, 34018, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nek\'rosh\'s Gambit: Respawn GameObject White Smoke Emitter'),
(465, 34, 9, 34019, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nek\'rosh\'s Gambit: Respawn GameObject White Smoke Emitter'),
(465, 34, 9, 34020, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nek\'rosh\'s Gambit: Respawn GameObject White Smoke Emitter'),
(465, 34, 9, 34021, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nek\'rosh\'s Gambit: Respawn GameObject White Smoke Emitter'),
(465, 34, 9, 34022, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nek\'rosh\'s Gambit: Respawn GameObject White Smoke Emitter');
UPDATE `quest_template` SET `CompleteScript`=465 WHERE `entry`=465;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
