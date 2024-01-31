DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240129005620');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20240129005620');
-- Add your query below.


-- Define order of events when Overlord Mok'Morokk reaches 30% HP.
DELETE FROM `creature_ai_scripts` WHERE `id`=450001;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(450001, 0, 0, 44, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Overlord Mok\'Morokk: Set Phase to 2'),
(450001, 0, 1, 62, 1173, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Overlord Mok\'Morokk: Complete Map Event'),
(450001, 0, 2, 4, 46, 256, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Overlord Mok\'Morokk: Add Immune to Player Flag'),
(450001, 0, 3, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Overlord Mok\'Morokk: Enter Evade Mode');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
