DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210928112546');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210928112546');
-- Add your query below.


-- Prevent abuse of valves for quest Samophlange (900).
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (900, 9, 900, 0, 0, 0, 0);
DELETE FROM `gameobject_scripts` WHERE `id`=15722;
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (15722, 0, 10, 3285, 180000, 1, 15, 0, 0, 0, 1, 8, 407201, -1, 2, 824.479, -2678.73, 91.6667, 6.04909, 900, 'Main Control Valve - Summon Creature');
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (15722, 0, 10, 3284, 180000, 1, 15, 0, 0, 0, 1, 8, 407201, -1, 2, 826.776, -2674.53, 91.6667, 5.53466, 900, 'Main Control Valve - Summon Creature');
DELETE FROM `gameobject_scripts` WHERE `id`=15730;
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (15730, 0, 10, 3285, 180000, 1, 15, 0, 0, 0, 1, 8, 407201, -1, 2, 843.523, -2669.85, 91.6668, 4.39584, 900, 'Regulator Valve - Summon Creature');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
