DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200521071837');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200521071837');
-- Add your query below.


-- add path for grand mason marblesten
UPDATE `creature` SET `movement_type`= 2 WHERE `id`= 2790;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(2790, 1, -5033.81, -1022.23, 508.876, 3.76026, 28000, 0, 279001),
(2790, 2, -5033.81, -1022.23, 508.876, 3.76026, 0, 0, 279002),
(2790, 3, -5028.37, -1019.84, 508.875, 5.32325, 24000, 0, 279001),
(2790, 4, -5028.37, -1019.84, 508.875, 5.32325, 0, 0, 279002),
(2790, 5, -5028.9, -1022.52, 508.876, 4.294884, 26000, 0, 279001),
(2790, 6, -5028.9, -1022.52, 508.876, 4.294884, 0, 0, 279002);
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (279001, 1, 1, 233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'grand mason marblesten - start work');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (279002, 0, 1, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'grand mason marblesten - stop work');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
