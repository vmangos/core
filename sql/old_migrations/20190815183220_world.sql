DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190815183220');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190815183220');
-- Add your query below.


-- Waypoints for Sergeant Houser
DELETE FROM `creature_movement` WHERE `id`=38435;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `wander_distance`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES 
(38435, 1, 1682.45, 416.902, -62.298, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(38435, 2, 1705.67, 422.108, -62.361, 8400, 0, 3843502, 0, 0, 0, 0, 0, 0, 0, 1.8, 0, 0),
(38435, 3, 1689.15, 417.493, -62.298, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(38435, 4, 1706.23, 422.453, -62.364, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(38435, 5, 1682.45, 416.902, -62.298, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(38435, 6, 1690.97, 418.036, -62.298, 8400, 0, 3843506, 0, 0, 0, 0, 0, 0, 0, 1.73, 0, 0),
(38435, 7, 1689.85, 417.388, -62.298, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(38435, 8, 1706.23, 422.453, -62.364, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0);

-- Waypoint scripts for Sergeant Houser
DELETE FROM `creature_movement_scripts` WHERE `id`=3843502;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3843502, 0, 39, 3843501, 3843502, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Sergeant Houser - Say Text 1');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3843502, 0, 1, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sergeant Houser - Emote Point');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3843502, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1963, 0, 0, 0, 0, 0, 0, 0, 0, 'Sergeant Houser - Say Text 2');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3843502, 5, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sergeant Houser - Emote Talk');
DELETE FROM `creature_movement_scripts` WHERE `id`=3843506;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3843506, 0, 39, 3843501, 3843502, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Sergeant Houser - Say Text 1');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3843506, 0, 1, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sergeant Houser - Emote Point');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3843506, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1963, 0, 0, 0, 0, 0, 0, 0, 0, 'Sergeant Houser - Say Text 2');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3843506, 5, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sergeant Houser - Emote Talk');
DELETE FROM `event_scripts` WHERE `id`=3843501;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3843501, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1964, 1965, 1966, 1967, 0, 0, 0, 0, 0, 'Sergeant Houser - Say Text');
DELETE FROM `event_scripts` WHERE `id`=3843502;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3843502, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1968, 1969, 1970, 1971, 0, 0, 0, 0, 0, 'Sergeant Houser - Say Text');

-- Events list for Practice Dummy
DELETE FROM `creature_ai_events` WHERE `creature_id`=5652;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (565201, 5652, 0, 11, 0, 100, 0, 0, 0, 0, 0, 565201, 0, 0, 'Practice Dummy - Set Unkillable on Spawn');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (565202, 5652, 0, 7, 0, 100, 0, 0, 0, 0, 0, 565201, 0, 0, 'Practice Dummy - Set Unkillable on Evade');
DELETE FROM `creature_ai_scripts` WHERE `id`=565201;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (565201, 0, 52, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Practice Dummy - Set Unkillable');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (565201, 0, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Practice Dummy - Disable Combat Movement');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (565201, 0, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Practice Dummy - Disable Melee Attack');
UPDATE `creature_template` SET `level_min`=25, `level_max`=25, `ai_name`='EventAI', `flags_extra`=`flags_extra`+131072 WHERE `entry`=5652;

-- Events list for Travist Bosk
DELETE FROM `creature_ai_events` WHERE `creature_id`=5663;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (566301, 5663, 0, 1, 0, 100, 1, 1000, 1000, 10000, 10000, 566301, 0, 0, 'Travist Bosk - Attack Nearby Practice Dummy');
DELETE FROM `creature_ai_scripts` WHERE `id`=566301;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (566301, 0, 26, 0, 0, 0, 0, 5652, 3, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Travist Bosk - Attack Nearby Practice Dummy');
UPDATE `creature_template_addon` SET `emote`=0 WHERE `entry`=5663;
UPDATE `creature_template` SET `gossip_menu_id`=0, `faction`=1154 WHERE `entry`=5663;

-- Events list for Eldin Partridge
DELETE FROM `creature_ai_events` WHERE `creature_id`=5664;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (566401, 5664, 0, 1, 0, 100, 1, 1000, 1000, 10000, 10000, 566401, 0, 0, 'Eldin Partridge - Attack Nearby Practice Dummy');
DELETE FROM `creature_ai_scripts` WHERE `id`=566401;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (566401, 0, 26, 0, 0, 0, 0, 5652, 3, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eldin Partridge - Attack Nearby Practice Dummy');
UPDATE `creature_template_addon` SET `emote`=0 WHERE `entry`=5664;
UPDATE `creature_template` SET `gossip_menu_id`=0, `faction`=1154 WHERE `entry`=5664;

-- Events list for Alyssa Blaye
DELETE FROM `creature_ai_events` WHERE `creature_id`=5665;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (566501, 5665, 0, 1, 0, 100, 1, 1000, 1000, 10000, 10000, 566501, 0, 0, 'Alyssa Blaye - Attack Nearby Practice Dummy');
DELETE FROM `creature_ai_scripts` WHERE `id`=566501;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (566501, 0, 26, 0, 0, 0, 0, 5652, 3, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alyssa Blaye - Attack Nearby Practice Dummy');
UPDATE `creature_template_addon` SET `emote`=0 WHERE `entry`=5665;
UPDATE `creature_template` SET `gossip_menu_id`=0, `faction`=1154 WHERE `entry`=5665;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
