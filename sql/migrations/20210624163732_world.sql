DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210624163732');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210624163732');
-- Add your query below.


-- Make sure Jammal'an the Prophet selects a player target for Hex of Jammal'an.
DELETE FROM `creature_ai_scripts` WHERE `id`=571003;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (571003, 0, 15, 12479, 35, 0, 0, 771, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jammal an the Prophet - Cast Spell Hex of Jammal an');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (571003, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6538, 0, 0, 0, 0, 0, 0, 0, 0, 'Jammal an the Prophet - Say Text');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
