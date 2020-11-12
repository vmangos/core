DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200513143813');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200513143813');
-- Add your query below.


-- Add missing texts for Opus.
DELETE FROM `creature_ai_scripts` WHERE `id`=1026201;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1026201, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5539, 5540, 5541, 5542, 0, 0, 0, 0, 0, 'Opus - Say Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=1026202;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1026202, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5543, 5544, 5545, 5546, 0, 0, 0, 0, 0, 'Opus - Say Text');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
