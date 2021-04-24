DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200518160736');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200518160736');
-- Add your query below.


-- add cleaver to cook ghilm
UPDATE `creature_equip_template` SET `equipentry1` = 2827 WHERE `entry` = 1355;

-- pathing and scripts for cook ghilm
UPDATE `creature` SET `movement_type`= 2 WHERE `id`= 1355;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(1355, 1, -5666.22, -1565.62, 383.257, 2.32129, 10000, 0, 0),
(1355, 2, -5666.22, -1565.62, 383.257, 2.32129, 500, 0, 135502),
(1355, 3, -5664.75, -1566.57, 383.329, 100, 7000, 0, 135501);
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (135501, 3, 1, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'cook ghilm - point');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (135501, 4, 19, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'cook ghilm - set default equip');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (135502, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0, 2196, 0, 0, 0, 0, 0, 0, 0, 0, 'cook ghilm - equip meat leg');

-- pathing for frast dokner
UPDATE `creature` SET `movement_type`= 2 WHERE `id`= 1698;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(1698, 1, -5714.37, -1589.52, 383.226, 1.55334, 40000, 0, 0),
(1698, 2, -5711.45, -1590.56, 383.204, 100, 0, 0, 0),
(1698, 3, -5712.23, -1596.21, 383.227, 0.593412, 60000, 0, 0);

-- pathing and scripts for kazan mogosh
UPDATE `creature` SET `movement_type`= 2 WHERE `id`= 1237;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(1237, 1, -5671.19, -1577.15, 383.329, 3.4383, 40000, 0, 123702),
(1237, 2, -5671.19, -1577.15, 383.329, 3.4383, 0, 0, 123702),
(1237, 3, -5668.92, -1574.36, 383.204, 100, 0, 0, 0),
(1237, 4, -5668.75, -1572.12, 383.329, 100, 0, 0, 0),
(1237, 5, -5665.08, -1567.92, 383.204, 0.753848, 50000, 0, 123701),
(1237, 6, -5665.08, -1567.92, 383.204, 0.753848, 0, 0, 123701);
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (123701, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'kazan mogosh - run');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (123702, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'kazan mogosh - walk');

-- pathing and scripts for miner grumnal
UPDATE `creature` SET `movement_type`= 2 WHERE `id`= 1360;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(1360, 1, -5685.68, -1596.67, 383.204, 4.08407, 420000, 0, 0),
(1360, 2, -5683.20, -1593.97, 383.204, 100, 0, 0, 0),
(1360, 3, -5676.94, -1580.58, 383.204, 100, 0, 0, 0),
(1360, 4, -5674.35, -1576.85, 383.204, 0.64881, 6000, 0, 136001),
(1360, 5, -5676.28, -1574.44, 383.204, 1.47946, 30000, 0, 0),
(1360, 6, -5674.35, -1576.85, 383.204, 100, 0, 0, 0),
(1360, 7, -5685.48, -1592.99, 383.204, 100, 0, 0, 0);
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (136001, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 124, 0, 0, 0, 0, 0, 0, 0, 0, 'miner grumnal - speak');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
