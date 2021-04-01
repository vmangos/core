DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210401204014');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210401204014');
-- Add your query below.


-- mana surge should not drop loot 
UPDATE `creature_template` SET `gold_min` = 0, `gold_max` = 0 WHERE `entry` = 6550;

-- musty tome must despawn after used (has that flag set up.. but with restock timer it will never happen)
UPDATE gameobject_template SET data2=0 WHERE entry IN (176150,176151);
UPDATE gameobject SET spawntimesecsmin = 60, spawntimesecsmax = 60 WHERE id = 176151;
UPDATE gameobject SET spawntimesecsmin = 60, spawntimesecsmax = 60 WHERE id = 176150;

-- onu play sound OOC
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 3616;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (361601, 3616, 0, 1, 0, 100, 1, 100, 5000, 40000, 90000, 361601, 0, 0, 'Onu - Play Sound on OOC Timer');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (361601, 0, 16, 6528, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Onu - Play Sound');

-- update darnassus sentinel waypoints (credit cmangos)
UPDATE `creature` SET `position_x` = 8644.208, `position_y` = 853.2105, `position_z` = 22.355267, `orientation` = 1.50239 WHERE `guid` = 46825;
DELETE FROM `creature_movement` WHERE `id` = 46825;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime` , `script_id`) VALUES
(46825, 1, 8647.808, 868.63934, 23.212633, 100, 0, 0),
(46825, 2, 8657.981, 873.3514, 22.37611, 100, 0, 0),
(46825, 3, 8670.864, 876.9106, 22.123152, 100, 0, 0),
(46825, 4, 8680.514, 881.326, 23.230516, 100, 0, 0),
(46825, 5, 8685.484, 889.3323, 22.422583, 100, 0, 0),
(46825, 6, 8686.014, 904.0842, 21.40408, 100, 0, 0),
(46825, 7, 8687.324, 922.13214, 16.083908, 100, 0, 0),
(46825, 8, 8689.776, 930.66925, 15.553102, 100, 0, 0),
(46825, 9, 8696.605, 941.5968, 13.781057, 100, 0, 0),
(46825, 10, 8696.757, 949.54407, 13.006399, 100, 0, 0),
(46825, 11, 8695.549, 956.4781, 12.202627, 100, 0, 0),
(46825, 12, 8691.133, 966.0688, 11.514212, 100, 0, 0),
(46825, 13, 8684.711, 974.0922, 10.755286, 100, 0, 0),
(46825, 14, 8676.798, 984.3464, 8.006629, 100, 0, 0),
(46825, 15, 8682.726, 987.4831, 9.514258, 100, 0, 0),
(46825, 16, 8689.632, 988.9705, 11.368621, 100, 0, 0),
(46825, 17, 8682.726, 987.4831, 9.514258, 100, 0, 0),
(46825, 18, 8676.798, 984.3464, 8.006629, 100, 0, 0),
(46825, 19, 8684.711, 974.0922, 10.755286, 100, 0, 0),
(46825, 20, 8691.133, 966.0688, 11.514212, 100, 0, 0),
(46825, 21, 8695.549, 956.4781, 12.202627, 100, 0, 0),
(46825, 22, 8696.757, 949.54407, 13.006399, 100, 0, 0),
(46825, 23, 8696.605, 941.5968, 13.781057, 100, 0, 0),
(46825, 24, 8689.776, 930.66925, 15.553102, 100, 0, 0),
(46825, 25, 8687.324, 922.13214, 16.083908, 100, 0, 0),
(46825, 26, 8686.014, 904.0842, 21.40408, 100, 0, 0),
(46825, 27, 8685.484, 889.3323, 22.422583, 100, 0, 0),
(46825, 28, 8680.514, 881.326, 23.230516, 100, 0, 0),
(46825, 29, 8670.864, 876.9106, 22.123152, 100, 0, 0),
(46825, 30, 8657.981, 873.3514, 22.37611, 100, 0, 0),
(46825, 31, 8647.808, 868.63934, 23.212633, 100, 0, 0),
(46825, 32, 8644.208, 853.2105, 22.355267, 100, 0, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
