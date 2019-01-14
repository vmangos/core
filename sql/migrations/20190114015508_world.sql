DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190114015508');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190114015508');
-- Add your query below.


-- Correct texts used by Bazil Thredd.
DELETE FROM `creature_ai_scripts` WHERE `id`=171622;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (171622, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1386, 1387, 1388, 1390, 0, 0, 0, 0, 0, 'Bazil Thredd - Say Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=171623;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (171623, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1391, 1392, 1393, 1394, 0, 0, 0, 0, 0, 'Bazil Thredd - Say Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=171624;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (171624, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1386, 1387, 1394, 1395, 0, 0, 0, 0, 0, 'Bazil Thredd - Say Text');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
