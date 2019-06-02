DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190602102456');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190602102456');
-- Add your query below.


-- https://www.youtube.com/watch?v=dn3sVUahDAQ
DELETE FROM `event_scripts` WHERE `id`=175944;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (175944, 5, 10, 10882, 30000, 1, 30, 0, 0, 0, 0, 8, 0, 6, 1, -5002.889, -2103.455, 83.81, 1.365, 0, 'Sacred Fire of Life - Summon Arikara');
UPDATE `gameobject_template` SET `data2`=175944, `script_name`='' WHERE `entry`=175944;
UPDATE `creature_template` SET `faction`=14 WHERE `entry`=10882;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
