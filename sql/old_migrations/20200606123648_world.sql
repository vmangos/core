DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200606123648');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200606123648');
-- Add your query below.


-- Regina Halloran
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 1446;

-- ai event
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (144601, 1446, 0, 1, 0, 100, 1, 600000, 600000, 600000, 600000, 144601, 0, 0, 'Regina Halloran - start hide and seek');

-- ai script
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (144601, 0, 60, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1446, 0, 0, 0, 0, 0, 0, 0, 'Regina Halloran - start waypoints');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (144601, 0, 39, 144501, 0, 0, 0, 9566, 0, 9, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Regina Halloran - start Jesse Halloran script');

-- waypoints
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(1446, 1, -3673.07, -731.084, 10.9426, 5.70723, 0, 0, 0),
(1446, 2, -3677.81, -741.992, 9.93171, 100, 0, 0, 0),
(1446, 3, -3673.7, -753.852, 10.3072, 100, 10000, 0, 144603),
(1446, 4, -3684.16, -739.188, 10.1452, 100, 0, 0, 0),
(1446, 5, -3678.29, -725.189, 10.8708, 100, 0, 0, 0),
(1446, 6, -3671.28, -721.259, 9.90776, 100, 25000, 3, 0),
(1446, 7, -3665.25, -690.832, 3.98186, 100, 0, 0, 0),
(1446, 8, -3655.88, -685.149, 1.61397, 100, 0, 0, 0),
(1446, 9, -3636.51, -697.908, 6.46869, 100, 25000, 3, 144609),
(1446, 10, -3626.26, -710.824, 9.65285, 100, 0, 0, 0),
(1446, 11, -3626.43, -714.727, 9.9378, 100, 0, 0, 144611),
(1446, 12, -3628.43, -719.022, 10.8226, 100, 0, 0, 0),
(1446, 13, -3628.16, -734.197, 10.2458, 100, 0, 0, 0),
(1446, 14, -3640.52, -763.083, 9.96267, 100, 0, 0, 0),
(1446, 15, -3643.38, -764.968, 10.0407, 100, 0, 0, 0),
(1446, 16, -3664.3, -756.579, 10.088, 100, 0, 0, 0),
(1446, 17, -3668.99, -748.248, 10.2308, 100, 0, 0, 0),
(1446, 18, -3662.39, -730.712, 10.8035, 100, 0, 0, 0),
(1446, 19, -3664.34, -722.104, 10.4313, 1.16018, 15000, 0, 144619),
(1446, 20, -3662.6, -732.778, 10.9156, 100, 0, 0, 0),
(1446, 21, -3667.54, -744.401, 10.2102, 100, 0, 0, 0),
(1446, 22, -3671.15, -745.97, 10.3083, 100, 0, 0, 0),
(1446, 23, -3676.48, -744.587, 10.0538, 100, 0, 0, 0),
(1446, 24, -3676.66, -739.143, 10.9422, 100, 0, 0, 0),
(1446, 25, -3675.74, -737.048, 10.9422, 100, 10000, 0, 144625),
(1446, 26, -3673.07, -731.084, 10.9426, 5.70723, 10000, 0, 0),
(1446, 27, -3673.07, -731.084, 10.9426, 5.70723, 0, 0, 0);

-- creature_movement_scripts 
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (144603, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Regina Halloran - run');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (144603, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 279, 0, 0, 0, 0, 0, 0, 0, 0, 'Regina Halloran - speak');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (144609, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 280, 0, 0, 0, 0, 0, 0, 0, 0, 'Regina Halloran - speak');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (144619, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 281, 0, 0, 0, 0, 0, 0, 0, 0, 'Regina Halloran - speak');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (144625, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Regina Halloran - walk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (144625, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 302, 0, 0, 0, 0, 0, 0, 0, 0, 'Regina Halloran - speak');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (144625, 2, 39, 148201, 0, 0, 0, 9583, 0, 9, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Regina Halloran - start Andrea Halloran script');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (144611, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -3628.43, -719.022, 10.8226, 0, 0, 'Regina Halloran - teleport');

-- Jesse Halloran
-- event script
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (144501, 0, 60, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1445, 0, 0, 0, 0, 0, 0, 0, 'Jesse Halloran - start waypoints');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (144502, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 304, 0, 0, 0, 0, 0, 0, 0, 0, 'Jesse Halloran - speak');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (144502, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 305, 0, 0, 0, 0, 0, 0, 0, 0, 'Jesse Halloran - speak');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (144502, 7, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -3666.06, -718.628, 9.95469, 0, 0, 'Jesse Halloran - teleport down');

-- waypoints
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(1445, 1, -3667.39, -733.498, 10.9584, 100, 10000, 0, 144501),
(1445, 2, -3673.4, -732.86, 10.9419, 100, 0, 0, 0),
(1445, 3, -3677.45, -742.278, 9.93885, 100, 0, 0, 0),
(1445, 4, -3682.36, -742.205, 10.0029, 100, 0, 0, 0),
(1445, 5, -3684.33, -735.882, 10.1774, 100, 0, 0, 0),
(1445, 6, -3677.45, -722.508, 10.6216, 100, 0, 0, 0),
(1445, 7, -3666.06, -718.628, 9.95469, 100, 3000, 0, 144507),
(1445, 8, -3660.6, -717.77, 28.156, 100, 213000, 0, 0),
(1445, 9, -3665.68, -719.574, 10.0648, 100, 0, 0, 0),
(1445, 10, -3661.9, -730.737, 10.7564, 100, 0, 0, 0),
(1445, 11, -3667.94, -745.693, 10.1702, 100, 0, 0, 0),
(1445, 12, -3672.19, -746.152, 10.3089, 100, 0, 0, 0),
(1445, 13, -3676.01, -744.941, 10.1241, 100, 0, 0, 0),
(1445, 14, -3676.75, -740.048, 10.9372, 100, 0, 0, 0),
(1445, 15, -3674.21, -733.571, 10.9429, 100, 0, 0, 0),
(1445, 16, -3667.39, -733.498, 10.9584, 2.74017, 10000, 0, 0);

-- creature_movement_scripts
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (144507, 0, 25, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jesse Halloran - walk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (144507, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -3660.6, -717.77, 28.156, 3.05292, 0, 'Jesse Halloran - teleport up');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (144507, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3329, 0, 0, 0, 0, 0, 0, 0, 0, 'Jesse Halloran - speak');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (144501, 0, 25, 1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jesse Halloran - run');

-- Andrea Halloran
-- event script
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (148201, 0, 60, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1482, 0, 0, 0, 0, 0, 0, 0, 'Andrea Halloran - start waypoints');

-- waypoints
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(1482, 1, -3674.24, -734.459, 10.9442, 100, 0, 1, 0),
(1482, 2, -3677.58, -742.043, 9.93783, 100, 0, 0, 0),
(1482, 3, -3675.82, -746.042, 10.2159, 100, 0, 0, 0),
(1482, 4, -3669.3, -746.881, 10.2402, 100, 0, 0, 0),
(1482, 5, -3666.03, -743.029, 10.3092, 100, 0, 0, 0),
(1482, 6, -3662.64, -731.478, 10.8311, 100, 0, 0, 0),
(1482, 7, -3662.37, -722.495, 10.8194, 100, 6000, 0, 148201),
(1482, 8, -3662.63, -730.397, 10.7677, 100, 0, 0, 0),
(1482, 9, -3667.14, -744.671, 10.1933, 100, 0, 0, 0),
(1482, 10, -3671.93, -746.638, 10.3216, 100, 0, 0, 0),
(1482, 11, -3676.46, -745.102, 10.0935, 100, 0, 0, 0),
(1482, 12, -3677, -740.283, 10.9255, 100, 0, 0, 0),
(1482, 13, -3674.24, -734.459, 10.9442, 100, 0, 0, 0);

-- creature_movement_scripts
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (148201, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 307, 0, 0, 0, 0, 0, 0, 0, 0, 'Andrea Halloran - speak');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (148201, 0, 39, 144502, 0, 0, 0, 9566, 0, 9, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Andrea Halloran - start Jesse Halloran script');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (148201, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 308, 0, 0, 0, 0, 0, 0, 0, 0, 'Andrea Halloran - speak');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
