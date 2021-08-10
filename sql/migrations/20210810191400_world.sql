DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210810191400');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210810191400');
-- Add your query below.


UPDATE `gameobject_template` SET `Data8` = 6142, `data9` = 0, `flags` = 4 WHERE `entry` = 177784;

UPDATE `gameobject` SET `spawntimesecsmin`= 120, `spawntimesecsmax`= 120 WHERE id = 177784;

UPDATE `creature` SET `movement_type` = 1, `wander_distance`= 40 WHERE `id` = 12347;

INSERT INTO `creature` (`guid`, `id`,`map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(1345, 12347, 1, -709.65, 3079.03, -30.12, 3.16598, 300, 300, 40, 100, 0, 1, 0, 0, 0, 10),
(1361, 12347, 1, -732.872, 3116.84, -25.9876, 3.16598, 300, 300, 40, 100, 0, 1, 0, 0, 0, 10),
(1369, 12347, 1, -819.322, 3151.19, -29.0014, 3.16598, 300, 300, 40, 100, 0, 1, 0, 0, 0, 10),
(1374, 12347, 1, -927.963, 3116.89, -25.2395, 3.16598, 300, 300, 40, 100, 0, 1, 0, 0, 0, 10),
(1377, 12347, 1, -779.266, 3044.03, -22.1945, 3.16598, 300, 300, 40, 100, 0, 1, 0, 0, 0, 10),
(1382, 12347, 1, -672.3, 2973.36, -21.8494, 3.16598, 300, 300, 40, 100, 0, 1, 0, 0, 0, 10);

INSERT INTO `gameobject` (guid, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(2555, 177784, 1, -979.745, 3089.43, -23.5718, 4.31097, 0, 0, -0.833885, 0.551938, 120, 120, 1, 100, 0, 10),
(2892, 177784, 1, -867.013, 3126.95, -27.1865, 4.04917, 0, 0, -0.898793, 0.438373, 120, 120, 1, 100, 0, 10),
(4727, 177784, 1, -778.617, 3046.94, -22.5933, 3.97936, 0, 0, -0.913545, 0.406738, 120, 120, 1, 100, 0, 10),
(8929, 177784, 1, -760.882, 3161.17, -25.7622, 5.5676, 0, 0, -0.350207, 0.936672, 120, 120, 1, 100, 0, 10),
(8974, 177784, 1, -712.414, 3080.17, -30.5822, 4.50295, 0, 0, -0.777145, 0.629321, 120, 120, 1, 100, 0, 10),
(8981, 177784, 1, -673.472, 2976.08, -22.2912, 2.3911, 0, 0, 0.930417, 0.366502, 120, 120, 1, 100, 0, 10),
(8983, 177784, 1, -645.7, 2896.28, -26.6011, 4.59022, 0, 0, -0.748956, 0.66262, 120, 120, 1, 100, 0, 10),
(8985, 177784, 1, -644.002, 3055.52, -24.7697, 4.88692, 0, 0, -0.642787, 0.766045, 120, 120, 1, 100, 0, 10),
(8988, 177784, 1, -569.263, 2965.02, -61.9416, 2.40855, 0, 0, 0.93358, 0.358368, 120, 120, 1, 100, 0, 10);

INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1234702, 12347, 187, 1, 0, 100, 1, 30000, 120000, 30000, 120000, 1234702, 0, 0, 'Enraged Reef Crawler - Despawn Gameobject OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1234702, 0, 3, 2, 0, 5, 2, 177784, 20, 11, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 'Enraged Reef Crawler - Move');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1234702, 4, 81, 0, 0, 0, 0, 177784, 20, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Enraged Reef Crawler - Despawn Gameobject');
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (187, 21, 177784, 19, 0, 0, 2);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
