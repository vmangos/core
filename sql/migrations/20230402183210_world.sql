DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230402183210');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230402183210');
-- Add your query below.


-- Fix issues with gossip script for Skeletal Remains of Kariel Winthalus.
-- 1. Do not start RP multiple times if already running.
-- 2. Do not complete or fail quest for group members.
DELETE FROM `gossip_scripts` WHERE `id`=574301;
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(574301, 0, 0, 7, 7482, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Skeletal Remains of Kariel Winthalus: Complete Quest'),
(574301, 1, 0, 61, 7482, 20, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Skeletal Remains of Kariel Winthalus: Start Scripted Map Event'),
(574301, 2, 0, 35, 1, 0, 0, 0, 14368, 20, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0.7, 0, 'Skeletal Remains of Kariel Winthalus: Lorekeeper Lydros - Set Orientation'),
(574301, 4, 0, 0, 0, 0, 0, 0, 14368, 20, 8, 2, 9446, 0, 0, 0, 0, 0, 0, 0, 0, 'Skeletal Remains of Kariel Winthalus: Lorekeeper Lydros - Say Text 1'),
(574301, 7, 0, 0, 0, 0, 0, 0, 14368, 20, 8, 2, 9447, 0, 0, 0, 0, 0, 0, 0, 0, 'Skeletal Remains of Kariel Winthalus: Lorekeeper Lydros - Say Text 2'),
(574301, 13, 0, 0, 0, 0, 0, 0, 14368, 20, 8, 2, 9448, 0, 0, 0, 0, 0, 0, 0, 0, 'Skeletal Remains of Kariel Winthalus: Lorekeeper Lydros - Say Text 3'),
(574301, 20, 0, 35, 1, 0, 0, 0, 14368, 20, 8, 2, 0, 0, 0, 0, 0, 0, 0, 3.07178, 0, 'Skeletal Remains of Kariel Winthalus: Lorekeeper Lydros - Set Orientation');
DELETE FROM `gossip_scripts` WHERE `id`=574302;
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(574302, 0, 0, 7, 7481, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Skeletal Remains of Kariel Winthalus: Complete Quest'),
(574302, 1, 0, 61, 7481, 20, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Skeletal Remains of Kariel Winthalus: Start Scripted Map Event'),
(574302, 2, 0, 35, 1, 0, 0, 0, 14368, 20, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0.7, 0, 'Skeletal Remains of Kariel Winthalus: Lorekeeper Lydros - Set Orientation'),
(574302, 4, 0, 0, 0, 0, 0, 0, 14368, 20, 8, 2, 9446, 0, 0, 0, 0, 0, 0, 0, 0, 'Skeletal Remains of Kariel Winthalus: Lorekeeper Lydros - Say Text 1'),
(574302, 7, 0, 0, 0, 0, 0, 0, 14368, 20, 8, 2, 9447, 0, 0, 0, 0, 0, 0, 0, 0, 'Skeletal Remains of Kariel Winthalus: Lorekeeper Lydros - Say Text 2'),
(574302, 13, 0, 0, 0, 0, 0, 0, 14368, 20, 8, 2, 9448, 0, 0, 0, 0, 0, 0, 0, 0, 'Skeletal Remains of Kariel Winthalus: Lorekeeper Lydros - Say Text 3'),
(574302, 20, 0, 35, 1, 0, 0, 0, 14368, 20, 8, 2, 0, 0, 0, 0, 0, 0, 0, 3.07178, 0, 'Skeletal Remains of Kariel Winthalus: Lorekeeper Lydros - Set Orientation');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
