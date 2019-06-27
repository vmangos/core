DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190627184757');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190627184757');
-- Add your query below.


-- Based on these videos:
-- https://www.youtube.com/watch?v=XenYBxrB_EM
-- https://www.youtube.com/watch?v=XohhDItp7Xs

-- Script for item NG-5 Explosives (Blue).
DELETE FROM `event_scripts` WHERE `id`=694;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (694, 0, 76, 19601, 60000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1168.44, 51.1277, 0.0603573, 5.48173, 0, 'Set NG-5 Charge (Blue) - Respawn NG-5 Explosives (Blue)');

-- Script for item NG-5 Explosives (Red).
DELETE FROM `event_scripts` WHERE `id`=693;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (693, 0, 76, 19592, 60000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1048.82, -442.209, 4.7429, 2.17129, 0, 'Set NG-5 Charge (Red) - Respawn NG-5 Explosives (Red)');

-- Condition to check the npc entry.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (3316, 16, 3988, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (3317, 16, 3989, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (3318, 16, 3991, 0, 0, 0, 0);

-- Script for item Remote Detonator (Red).
DELETE FROM `event_scripts` WHERE `id`=691;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (691, 0, 13, 0, 0, 0, 0, 20899, 50, 11, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Remote Detonate Red - Activate Venture Co. Explosives Wagon');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (691, 0, 41, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Remote Detonate Red - Despawn NG-5 Explosives (Red)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (691, 3, 68, 20899, 2, 3988, 100, 20899, 50, 11, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Remote Detonate Red - Start Script on All Venture Co. Operators');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (691, 3, 68, 20899, 2, 3991, 100, 20899, 50, 11, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Remote Detonate Red - Start Script on All Venture Co. Deforesters');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (691, 3, 68, 20899, 2, 3989, 100, 20899, 50, 11, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Remote Detonate Red - Start Script on All Venture Co. Loggers');

-- Script for item Remote Detonator (Blue).
DELETE FROM `event_scripts` WHERE `id`=692;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (692, 0, 13, 0, 0, 0, 0, 19547, 50, 11, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Remote Detonate Blue - Activate Venture Co. Explosives Wagon');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (692, 0, 41, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Remote Detonate Blue - Despawn NG-5 Explosives (Blue)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (692, 3, 68, 20899, 2, 3988, 100, 19547, 50, 11, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Remote Detonate Blue - Start Script on All Venture Co. Operators');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (692, 3, 68, 20899, 2, 3991, 100, 19547, 50, 11, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Remote Detonate Blue - Start Script on All Venture Co. Deforesters');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (692, 3, 68, 20899, 2, 3989, 100, 19547, 50, 11, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Remote Detonate Blue - Start Script on All Venture Co. Loggers');

-- Script to run on nearby npcs after using Remote Detonator.
DELETE FROM `event_scripts` WHERE `id`=20899;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (20899, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Remote Detonate: Venture Co. Npc - Set Run');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (20899, 1, 3, 2, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 'Remote Detonate: Venture Co. Npc - Move to Exploded Wagon');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (20899, 5, 39, 20900, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 'Remote Detonate: Venture Co. Npc - Chance to Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (20899, 25, 20, 6, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 117, 'Remote Detonate: Venture Co. Npc - Move Home');

-- Script to say npc texts after using Remote Detonator.
DELETE FROM `event_scripts` WHERE `id`=20900;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (20900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1568, 1571, 1572, 0, 0, 0, 0, 0, 3316, 'Remote Detonate: Venture Co. Operator - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (20900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1570, 0, 0, 0, 0, 0, 0, 0, 3317, 'Remote Detonate: Venture Co. Logger - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (20900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1569, 1573, 0, 0, 0, 0, 0, 0, 3318, 'Remote Detonate: Venture Co. Deforester - Say Text');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
