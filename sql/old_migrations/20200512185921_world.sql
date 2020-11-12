DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200512185921');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200512185921');
-- Add your query below.


-- correct positions for stockade guards
UPDATE `creature` SET `position_x` = -8782.927734, `position_y` = 826.459595, `position_z` = 97.426674 WHERE `guid`= 90455;
UPDATE `creature` SET `position_x` = -8787.88281, `position_y` = 832.964172, `position_z` = 97.373196, `orientation` = 0.255604 WHERE `guid`= 90456;
UPDATE `creature` SET `position_x` = -8787.343750, `position_y` = 830.022705, `position_z` = 97.651077, `orientation` = 0.725481 WHERE `guid`= 90454;
UPDATE `creature` SET `position_x` = -8784.890625, `position_y` = 826.708313, `position_z` = 97.650780, `orientation` = 0.763170 WHERE `guid`= 90453;
UPDATE `creature` SET `position_x` = -8792.311523, `position_y` = 831.371094, `position_z` = 97.644211, `orientation` = 0.149050 WHERE `guid`= 90472;
UPDATE `creature` SET `position_x` = -8791.253906, `position_y` = 835.584045, `position_z` = 97.634636, `orientation` = 6.165888 WHERE `guid`= 90473;
UPDATE `creature` SET `position_x` = -8779.591797, `position_y` = 823.153198, `position_z` = 97.635078, `orientation` = 1.459418 WHERE `guid`= 90474;
UPDATE `creature` SET `position_x` = -8786.200195, `position_y` = 822.289551, `position_z` = 97.641891, `orientation` = 1.031716 WHERE `guid`= 90475;

-- correct positions for injured stockade guards
UPDATE `creature` SET `orientation` = 3.776711 WHERE `guid`= 79522;
UPDATE `creature` SET `orientation` = 3.776711 WHERE `guid`= 79580;
UPDATE `creature` SET `orientation` = 3.776711 WHERE `guid`= 79550;

-- add missing injured stockade guard
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `display_id`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(79581, 4996, 0, 0, 0, 0, 0, 0, -8766.31, 819.304, 97.6345, 5.357542, 540, 540, 0, 100, 0, 0, 0, 0, 0, 10);

-- increase respawn time for injured stockade guard
UPDATE `creature` SET `spawntimesecsmin`=540, `spawntimesecsmax`=540 WHERE `id`=4996;

-- pathing and scripts for nurse lilian
UPDATE `creature` SET `movement_type`= 2 WHERE `id`= 5042;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(5042, 1, -8765.8, 820.428, 97.6347, 100, 12000, 0, 5042),
(5042, 2, -8760, 813.384, 97.6347, 100, 0, 0, 0),
(5042, 3, -8759.9, 811.505, 97.6347, 100, 0, 0, 0),
(5042, 4, -8761.04, 810.324, 97.6347, 100, 0, 0, 0),
(5042, 5, -8763.52, 810.557, 97.6347, 100, 0, 0, 0),
(5042, 6, -8763.11, 811.441, 97.6347, 100, 12000, 0, 5042),
(5042, 7, -8764.8, 811.061, 97.6347, 100, 0, 0, 0),
(5042, 8, -8768.2, 815.167, 97.6347, 100, 0, 0, 0),
(5042, 9, -8766.9, 817.295, 97.6347, 100, 0, 0, 0),
(5042, 10, -8765.98, 816.148, 97.6347, 100, 12000, 0, 5042),
(5042, 11, -8762.86, 818.696, 97.6347, 100, 0, 0, 0),
(5042, 12, -8755.42, 816.691, 97.6347, 100, 0, 0, 0),
(5042, 13, -8755.73, 815.36, 97.6347, 100, 12000, 0, 5042),
(5042, 14, -8764.63, 820.844, 97.6347, 100, 0, 0, 0);
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5042, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1680, 1681, 1685, 1682, 0, 0, 0, 0, 0, 'Nurse Lilian Pathing - Speech');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5042, 3, 28, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nurse Lilian Pathing - Crouch');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
