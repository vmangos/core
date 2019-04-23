DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190118224538');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190118224538');
-- Add your query below.


UPDATE `creature` SET `spawndist` = 0, `MovementType` = 2 WHERE `guid` = 13180 AND `id` = 14874;
DELETE FROM `creature_movement_template` WHERE `entry` = 14874;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `script_id`, `textid1`) VALUES 
(14874, 1, 242.249, -2902.21, 97.9634, 100, 0, 0, 10251),
(14874, 2, 241.339, -2907.13, 98.0129, 100, 0, 0, 0),
(14874, 3, 234.215, -2901.64, 98.1816, 100, 0, 0, 0),
(14874, 4, 231.002, -2901.18, 98.2032, 100, 15000, 1487401, 0),
(14874, 5, 224.344, -2899.96, 97.2719, 100, 0, 0, 0),
(14874, 6, 221.426, -2894.66, 96.1361, 100, 0, 0, 0),
(14874, 7, 217.204, -2889.08, 94.318, 100, 0, 0, 0),
(14874, 8, 212.104, -2882.55, 92.0763, 100, 0, 0, 0),
(14874, 9, 212.402, -2876.92, 92.128, 100, 0, 0, 10255),
(14874, 10, 215.615, -2870.7, 91.6697, 100, 0, 0, 0),
(14874, 11, 221.156, -2861.38, 91.6227, 100, 0, 0, 0),
(14874, 12, 226.571, -2854.09, 91.5259, 100, 0, 0, 0),
(14874, 13, 226.086, -2850.93, 91.4352, 100, 15000, 1487402, 0),
(14874, 14, 224.387, -2853.99, 91.4173, 100, 0, 0, 0),
(14874, 15, 216.445, -2869.58, 91.6667, 100, 0, 0, 0),
(14874, 16, 212.921, -2878.2, 91.9524, 100, 0, 0, 0),
(14874, 17, 213.96, -2887.12, 93.1517, 100, 0, 0, 0),
(14874, 18, 219.002, -2891.98, 95.3228, 100, 0, 0, 0),
(14874, 19, 224.263, -2898.76, 97.0892, 100, 0, 0, 0),
(14874, 20, 231.168, -2900.84, 98.2114, 100, 0, 0, 0),
(14874, 21, 241.121, -2900.6, 97.9936, 100, 60000, 0, 0);

DELETE FROM `conditions` WHERE `condition_entry` IN (14874, 14875);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
(14874, 20, 10685, 30, 0, 0, 2),
(14875, 20, 10685, 30, 0, 0, 1);

DELETE FROM `creature_movement_scripts` WHERE `id` IN (1487401, 1487402);
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1487401, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10252, 0, 0, 0, 0, 0, 0, 0, 0, 'Karu - Say Text'),
(1487401, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10253, 0, 0, 0, 0, 0, 0, 0, 0, 'Karu - Say Text'),
(1487401, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10292, 0, 0, 0, 0, 0, 0, 0, 0, 'Karu - Say Text'),

(1487402, 1, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.068783, 14874, 'Karu - Set Orientation'),
(1487402, 5, 3, 0, 0, 2, 0, 20186, 0, 9, 2, 0, 0, 0, 0, 224.7307, -2850.544, 91.3375, 6.0917, 14874, 'Karu - Move To Position (GUID: 20186)'),
(1487402, 5, 3, 0, 0, 4, 0, 20181, 0, 9, 2, 0, 0, 0, 0, 224.228, -2852.198, 91.3376, 0.6097, 14874, 'Karu - Move To Position (GUID: 20181)'),
(1487402, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10256, 0, 0, 0, 0, 0, 0, 0, 14874, 'Karu - Say Text'),
(1487402, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10305, 0, 0, 0, 0, 0, 0, 0, 14875, 'Karu - Say Text'),
(1487402, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10257, 0, 0, 0, 0, 0, 0, 0, 14874, 'Karu - Say Text');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
