DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201231164608');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201231164608');
-- Add your query below.


-- add gnomeregan evacuation event
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES
(2442, 2443, 6, 3, 11);

UPDATE `creature` SET `movement_type` = 2 WHERE `guid` = 2442;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(2442, 1, -5165.01, 635.986, 348.279, 100, 2000, 0, 784301),
(2442, 2, -5176.52, 637.508, 348.279, 100, 0, 0, 0),
(2442, 3, -5180.35, 647.348, 348.279, 100, 0, 0, 0),
(2442, 4, -5176.56, 656.204, 348.279, 100, 0, 0, 0),
(2442, 5, -5163.17, 665.239, 348.932, 100, 0, 0, 0),
(2442, 6, -5159.09, 708.355, 369.766, 100, 0, 0, 0),
(2442, 7, -5165.51, 714.313, 369.766, 100, 0, 0, 0),
(2442, 8, -5171.31, 714.859, 369.766, 100, 0, 0, 0),
(2442, 9, -5175.11, 706.777, 369.766, 100, 0, 0, 0),
(2442, 10, -5182.93, 606.75, 408.966, 100, 0, 0, 0),
(2442, 11, -5180.14, 597.714, 408.496, 100, 0, 0, 0),
(2442, 12, -5174.19, 584.702, 404.797, 100, 0, 0, 0),
(2442, 13, -5148.45, 587.567, 416.345, 100, 3000, 0, 784302);

INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (784301, 1, 25, 1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gnomeregan Evacuee - Run');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (784302, 0, 18, 2, 0, 0, 0, 2443, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gnomeregan Evacuee - Despawn');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (784302, 2, 18, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gnomeregan Evacuee - Despawn');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
