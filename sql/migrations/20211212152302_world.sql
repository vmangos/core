DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211212152302');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211212152302');
-- Add your query below.


-- Remove Old Event Data
DELETE FROM `creature` WHERE `guid` IN (SELECT `guid` FROM `game_event_creature` WHERE `event` = 153);
DELETE FROM `game_event` WHERE `entry` = 153;
DELETE FROM `game_event_creature` WHERE `event` = 153;

-- Misc
UPDATE `creature` SET `position_x` = -668.636, `position_y` = -562.703, `position_z` = 25.3622 WHERE `id` = 2435;
UPDATE `broadcast_text` SET `chat_type` = 2 WHERE `entry` = 623;

-- Events list for Southshore Crier
DELETE FROM `creature_ai_events` WHERE `creature_id`=2435;
DELETE FROM `creature_ai_scripts` WHERE `id` IN (243502, 243503, 243504);
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(243501, 2435, 0, 1, 0, 100, 0, 2000, 2000, 0, 0, 243501, 0, 0, 'Southshore Crier - Yell on Spawn');

DELETE FROM `creature_movement` WHERE `id` = 301755;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(2435, 1, -668.636, -562.703, 25.3622, 100, 0, 0, 11),
(2435, 2, -680.996, -566.52, 25.2009, 100, 0, 0, 0),
(2435, 3, -693.22, -569.418, 24.4536, 100, 0, 0, 0),
(2435, 4, -723.958, -551.954, 20.5542, 100, 0, 0, 0),
(2435, 5, -764.897, -546.37, 17.9831, 100, 0, 0, 0),
(2435, 6, -809.579, -528.999, 15.3876, 100, 0, 0, 0),
(2435, 7, -821.22, -524.994, 13.8281, 100, 0, 0, 0),
(2435, 8, -856.326, -532.717, 9.74993, 100, 30000, 5, 243501);

INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(243501, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 620, 0, 0, 0, 0, 0, 0, 0, 0, 'Southshore Crier - Say Text'),
(243501, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 621, 0, 0, 0, 0, 0, 0, 0, 0, 'Southshore Crier - Say Text'),
(243501, 21, 15, 2596, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Southshore Crier - Cast Spell Touch of the Black Claw'),
(243501, 21, 15, 2596, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Southshore Crier - Cast Spell Touch of the Black Claw'),
(243501, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 626, 0, 0, 0, 0, 0, 0, 0, 0, 'Southshore Crier - Say Text'),
(243501, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 623, 0, 0, 0, 0, 0, 0, 0, 0, 'Southshore Crier - Say Text'),
(243501, 27, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Southshore Crier - Despawn Creature');











INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
-- group1 
(1, 0, 10, 2386, 60000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -850.748, -561.89, 11.6908, 3.14159, 0, 'Summon Creature Southshore Guard'),
(1, 0, 10, 2386, 60000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -852.268, -560.181, 11.6908, 3.82227, 0, 'Summon Creature Southshore Guard'),

-- group2
(1, 0, 10, 2386, 60000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -863.394, -494.436, 13.4375, 5.53269, 0, 'Summon Creature Southshore Guard'),
(1, 0, 10, 2386, 60000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -863.81, -496.398, 13.4382, 5.34071, 0, 'Summon Creature Southshore Guard'),


--  group3
(1, 0, 10, 2386, 60000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -874.746, -573.897, 11.6758, 2.28638, 0, 'Summon Creature Southshore Guard'),
(1, 0, 10, 2386, 60000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -877.416, -574.223, 11.5033, 1.0821, 0, 'Summon Creature Southshore Guard'),

-- group4
(1, 0, 10, 2386, 60000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -818.436, -503.501, 15.3768, 3.71755, 0, 'Summon Creature Southshore Guard'),
(1, 0, 10, 2386, 60000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -817.583, -505.381, 15.2609, 3.03687, 0, 'Summon Creature Southshore Guard');







-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
