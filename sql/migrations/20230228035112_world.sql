DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230228035112');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230228035112');
-- Add your query below.


-- Spawn scripts for ogres.
DELETE FROM `generic_scripts` WHERE `id`=2715;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(2715, 2, 3, 0, 3223, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -1756.7, -1566.68, 54.1133, 0, 0, 'Runed Pedestal: Boulderfist Mauler - Move');
DELETE FROM `generic_scripts` WHERE `id`=2716;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(2716, 2, 3, 0, 3225, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -1753.09, -1574.25, 52.1216, 0, 0, 'Runed Pedestal: Boulderfist Mauler - Move');
DELETE FROM `generic_scripts` WHERE `id`=2717;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(2717, 2, 3, 0, 3005, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -1749.42, -1583.67, 52.3262, 0, 0, 'Runed Pedestal: Boulderfist Mauler - Move');
DELETE FROM `generic_scripts` WHERE `id`=2718;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(2718, 2, 3, 0, 5062, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -1776.38, -1513.58, 64.9209, 0, 0, 'Runed Pedestal: Boulderfist Shaman - Move');

-- Script on player using Runed Pedestal.
DELETE FROM `event_scripts` WHERE `id`=413;
INSERT INTO `event_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(413, 0, 0, 31, 2794, 100, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Runed Pedestal: Terminate Script if Summoned Guardian is found'),
(413, 1, 0, 10, 2570, 300000, 0, 0, 0, 0, 0, 0, 0, 2718, -1, 1, -1777.91, -1501.28, 65.0042, 4.66003, 0, 'Runed Pedestal: Summon Creature Boulderfist Shaman'),
(413, 1, 1, 10, 2569, 300000, 0, 0, 0, 0, 0, 0, 0, 2717, -1, 1, -1729.03, -1574.77, 53.9953, 3.59538, 0, 'Runed Pedestal: Summon Creature Boulderfist Mauler'),
(413, 1, 2, 10, 2569, 300000, 0, 0, 0, 0, 0, 0, 0, 2716, -1, 1, -1742.55, -1594.43, 52.7884, 1.97222, 0, 'Runed Pedestal: Summon Creature Boulderfist Mauler'),
(413, 1, 3, 10, 2569, 300000, 0, 0, 0, 0, 0, 0, 0, 2715, -1, 1, -1764.01, -1591, 53.1026, 1.309, 0, 'Runed Pedestal: Summon Creature Boulderfist Mauler'),
(413, 1, 4, 10, 2794, 300000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -1776.35, -1523.46, 65.0042, 1.5708, 0, 'Runed Pedestal: Summon Creature Summoned Guardian'),
(413, 1, 5, 10, 2794, 300000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -1782.63, -1508.94, 99.3345, 3.08923, 0, 'Runed Pedestal: Summon Creature Summoned Guardian'),
(413, 1, 6, 10, 2794, 300000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -1777.76, -1516.91, 99.3345, 4.29351, 0, 'Runed Pedestal: Summon Creature Summoned Guardian'),
(413, 1, 7, 10, 2794, 300000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -1770.32, -1510.47, 90.5951, 0.890118, 0, 'Runed Pedestal: Summon Creature Summoned Guardian'),
(413, 1, 8, 10, 2794, 300000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -1772.38, -1522.57, 75.3211, 2.1293, 0, 'Runed Pedestal: Summon Creature Summoned Guardian'),
(413, 1, 9, 10, 2794, 300000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -1758.89, -1555.83, 58.6428, 5.11381, 0, 'Runed Pedestal: Summon Creature Summoned Guardian'),
(413, 1, 10, 10, 2794, 300000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -1748.81, -1555.65, 58.5205, 4.38078, 0, 'Runed Pedestal: Summon Creature Summoned Guardian');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
