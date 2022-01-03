DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220103005758');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220103005758');
-- Add your query below.


-- Allow players to die at the end of In Dreams.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (6305, 25, 0, 80, 0, 0, 0);
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (6609, 33, 69, 5944, 0, 0, 0, 0, 0, 0, 0, 0, 6611, 6305, 5944, 0, 0, 0, 0, 0, 'In Dreams: Update Map Event Condition');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
