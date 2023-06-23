DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230616201152');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230616201152');
-- Add your query below.


-- Update horde script for Head of Onyxia.
DELETE FROM `generic_scripts` WHERE `id`=7491;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(7491, 0, 0, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'For All To See: Overlord Runthak - Remove Gossip Flag'),
(7491, 0, 0, 61, 7491, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'For All To See: Start Map Event'),
(7491, 2, 0, 20, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'For All To See: Overlord Runthak - Start Waypoints');
DELETE FROM `creature_movement_scripts` WHERE `id`=1439202;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1439202, 1, 0, 1, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Overlord Runthak - Emote Shout'),
(1439202, 1, 0, 0, 6, 0, 0, 0, 7491, 0, 21, 0, 9491, 0, 0, 0, 0, 0, 0, 0, 0, 'Overlord Runthak - Say Text'),
(1439202, 1, 0, 9, 40134, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Overlord Runthak - Respawn The Severed Head of Onyxia'),
(1439202, 9, 0, 1, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Overlord Runthak - Emote Shout'),
(1439202, 9, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 9492, 0, 0, 0, 0, 0, 0, 0, 0, 'Overlord Runthak - Say Text'),
(1439202, 9, 0, 80, 0, 0, 0, 0, 40134, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Overlord Runthak - Set GO State of The Severed Head of Onyxia'),
(1439202, 16, 0, 15, 22888, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Overlord Runthak - Cast Rallying Cry of the Dragonslayer'),
(1439202, 16, 1, 13, 0, 0, 0, 0, 251489, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Overlord Runthak - Activate Rallying Call 1'),
(1439202, 16, 2, 13, 0, 0, 0, 0, 251490, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Overlord Runthak - Activate Rallying Call 2'),
(1439202, 16, 3, 13, 0, 0, 0, 0, 251491, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Overlord Runthak - Activate Rallying Call 3'),
(1439202, 16, 4, 13, 0, 0, 0, 0, 251492, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Overlord Runthak - Activate Rallying Call 4'),
(1439202, 16, 5, 13, 0, 0, 0, 0, 251493, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Overlord Runthak - Activate Rallying Call 5'),
(1439202, 16, 6, 13, 0, 0, 0, 0, 251494, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Overlord Runthak - Activate Rallying Call 6'),
(1439202, 16, 7, 92, 21002, 1637, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Overlord Runthak - Add Aura Rallying Cry of the Dragonslayer to Players in Orgrimmar'),
(1439202, 16, 2, 10, 14392, 1000, 0, 0, 0, 0, 0, 0, 18, 21001, -1, 3, -462.147, -2650.28, 90.637, 0, 0, 'Overlord Runthak - Summon Overlord Runthak Copy in Crossroads');
DELETE FROM `creature_movement_scripts` WHERE `id`=1439203;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1439203, 0, 0, 20, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Overlord Runthak - Move Idle'),
(1439203, 2, 0, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Overlord Runthak - Add Gossip Flag');

-- Update horde script for Head of Nefarian.
DELETE FROM `generic_scripts` WHERE `id`=7784;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(7784, 0, 0, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Lord of Blackrock: High Overlord Saurfang - Remove Gossip Flag'),
(7784, 0, 0, 61, 7784, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Lord of Blackrock: Start Map Event'),
(7784, 2, 0, 20, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Lord of Blackrock: High Overlord Saurfang - Start Waypoints');
DELETE FROM `creature_movement_scripts` WHERE `id`=1472002;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1472002, 1, 0, 1, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Overlord Saurfang - Emote Shout'),
(1472002, 1, 0, 0, 6, 0, 0, 0, 7784, 0, 21, 0, 9867, 0, 0, 0, 0, 0, 0, 0, 0, 'High Overlord Saurfang - Say Text'),
(1472002, 1, 0, 9, 40150, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Overlord Saurfang - Respawn The Severed Head of Nefarian'),
(1472002, 11, 0, 1, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Overlord Saurfang - Emote Shout'),
(1472002, 11, 0, 0, 6, 0, 0, 0, 7784, 0, 21, 0, 9868, 0, 0, 0, 0, 0, 0, 0, 0, 'High Overlord Saurfang - Say Text'),
(1472002, 11, 0, 80, 0, 0, 0, 0, 40150, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Overlord Saurfang - Set Go State of Severed Head of Nefarian'),
(1472002, 16, 0, 15, 22888, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Overlord Saurfang - Cast Rallying Cry of the Dragonslayer'),
(1472002, 16, 1, 13, 0, 0, 0, 0, 251489, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Overlord Saurfang - Activate Rallying Call 1'),
(1472002, 16, 2, 13, 0, 0, 0, 0, 251490, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Overlord Saurfang - Activate Rallying Call 2'),
(1472002, 16, 3, 13, 0, 0, 0, 0, 251491, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Overlord Saurfang - Activate Rallying Call 3'),
(1472002, 16, 4, 13, 0, 0, 0, 0, 251492, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Overlord Saurfang - Activate Rallying Call 4'),
(1472002, 16, 5, 13, 0, 0, 0, 0, 251493, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Overlord Saurfang - Activate Rallying Call 5'),
(1472002, 16, 6, 13, 0, 0, 0, 0, 251494, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Overlord Saurfang - Activate Rallying Call 6'),
(1472002, 16, 7, 92, 21002, 1637, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Overlord Saurfang - Add Aura Rallying Cry of the Dragonslayer to Players in Orgrimmar'),
(1472002, 16, 2, 10, 14720, 1000, 0, 0, 0, 0, 0, 0, 18, 21001, -1, 3, -462.147, -2650.28, 90.637, 0, 0, 'High Overlord Saurfang - Summon High Overlord Saurfang Copy in Crossroads');
DELETE FROM `creature_movement_scripts` WHERE `id`=1472004;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1472004, 0, 0, 20, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Overlord Saurfang - Move Idle'),
(1472004, 2, 0, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Overlord Saurfang - Add Gossip Flag');

-- Rallying Call spawns. Positions are guessed.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`) VALUES 
(251489, 179557, 1, 1881, -4518.5, 27.74, 0.268148, 0, 0, 0.133673, 0.991026, 30, 30, 1, 100),
(251490, 179557, 1, 1678.6, -4355.3, 61.7229, 0.268148, 0, 0, 0.133673, 0.991026, 30, 30, 1, 100),
(251491, 179557, 1, 1550.3, -4186.2, 40.9315, 0.268148, 0, 0, 0.133673, 0.991026, 30, 30, 1, 100),
(251492, 179557, 1, 1931.2, -4279.3, 29.8974, 0.268148, 0, 0, 0.133673, 0.991026, 30, 30, 1, 100),
(251493, 179557, 1, 1919, -4117.2, 43.448, 0.268148, 0, 0, 0.133673, 0.991026, 30, 30, 1, 100),
(251494, 179557, 1, 1804.3, -4344.9, -10.9985, 0.268148, 0, 0, 0.133673, 0.991026, 30, 30, 1, 100);

-- Remove custom creature Horde Rallying Cry Generator.
DELETE FROM `creature_template` WHERE `entry`=21001;

-- Assign Orgrimmar faction to Rallying Call.
UPDATE `gameobject_template` SET `faction`=85 WHERE `entry`=179557;

-- Update alliance script for Head of Onyxia.
DELETE FROM `generic_scripts` WHERE `id`=7496;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(7496, 0, 0, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Celebrating Good Times: Major Mattingly - Remove Gossip Flag'),
(7496, 3, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 9495, 0, 0, 0, 0, 0, 0, 0, 0, 'Celebrating Good Times: Major Mattingly - Say Text'),
(7496, 3, 0, 1, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Celebrating Good Times: Major Mattingly - Emote Shout'),
(7496, 12, 0, 9, 40135, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Celebrating Good Times: The Severed Head of Onyxia - Respawn'),
(7496, 12, 0, 1, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Celebrating Good Times: Major Mattingly - Emote Shout'),
(7496, 12, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 9496, 0, 0, 0, 0, 0, 0, 0, 0, 'Celebrating Good Times: Major Mattingly - Say Text'),
(7496, 20, 0, 15, 22888, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Celebrating Good Times: Major Mattingly - Cast Rallying Cry of the Dragonslayer'),
(7496, 20, 1, 13, 0, 0, 0, 0, 251482, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Celebrating Good Times: Major Mattingly - Activate Rallying Call 1'),
(7496, 20, 2, 13, 0, 0, 0, 0, 251483, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Celebrating Good Times: Major Mattingly - Activate Rallying Call 2'),
(7496, 20, 3, 13, 0, 0, 0, 0, 251484, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Celebrating Good Times: Major Mattingly - Activate Rallying Call 3'),
(7496, 20, 4, 13, 0, 0, 0, 0, 251485, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Celebrating Good Times: Major Mattingly - Activate Rallying Call 4'),
(7496, 20, 5, 13, 0, 0, 0, 0, 251486, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Celebrating Good Times: Major Mattingly - Activate Rallying Call 5'),
(7496, 20, 6, 13, 0, 0, 0, 0, 251487, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Celebrating Good Times: Major Mattingly - Activate Rallying Call 6'),
(7496, 20, 7, 13, 0, 0, 0, 0, 251488, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Celebrating Good Times: Major Mattingly - Activate Rallying Call 7'),
(7496, 20, 8, 92, 21002, 1519, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Celebrating Good Times: Major Mattingly - Add Aura Rallying Cry of the Dragonslayer to Players in Stormwind City'),
(7496, 25, 0, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Celebrating Good Times: Major Mattingly - Add Gossip Flag');

-- Update alliance script for Head of Nefarian.
DELETE FROM `generic_scripts` WHERE `id`=7782;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(7782, 0, 0, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Lord of Blackrock: Field Marshal Afrasiabi - Remove Gossip Flag'),
(7782, 3, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 9870, 0, 0, 0, 0, 0, 0, 0, 0, 'The Lord of Blackrock: Field Marshal Afrasiabi - Say Text'),
(7782, 3, 0, 1, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Lord of Blackrock: Field Marshal Afrasiabi - Emote Shout'),
(7782, 14, 0, 9, 40151, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Lord of Blackrock: The Severed Head of Nefarian - Respawn'),
(7782, 14, 0, 1, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Lord of Blackrock: Field Marshal Afrasiabi - Emote Shout'),
(7782, 14, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 9872, 0, 0, 0, 0, 0, 0, 0, 0, 'The Lord of Blackrock: Field Marshal Afrasiabi - Say Text'),
(7782, 20, 0, 15, 22888, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Lord of Blackrock: Field Marshal Afrasiabi - Cast Rallying Cry of the Dragonslayer'),
(7782, 20, 1, 13, 0, 0, 0, 0, 251482, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Lord of Blackrock: Field Marshal Afrasiabi - Activate Rallying Call 1'),
(7782, 20, 2, 13, 0, 0, 0, 0, 251483, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Lord of Blackrock: Field Marshal Afrasiabi - Activate Rallying Call 2'),
(7782, 20, 3, 13, 0, 0, 0, 0, 251484, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Lord of Blackrock: Field Marshal Afrasiabi - Activate Rallying Call 3'),
(7782, 20, 4, 13, 0, 0, 0, 0, 251485, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Lord of Blackrock: Field Marshal Afrasiabi - Activate Rallying Call 4'),
(7782, 20, 5, 13, 0, 0, 0, 0, 251486, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Lord of Blackrock: Field Marshal Afrasiabi - Activate Rallying Call 5'),
(7782, 20, 6, 13, 0, 0, 0, 0, 251487, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Lord of Blackrock: Field Marshal Afrasiabi - Activate Rallying Call 6'),
(7782, 20, 7, 13, 0, 0, 0, 0, 251488, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Lord of Blackrock: Field Marshal Afrasiabi - Activate Rallying Call 7'),
(7782, 20, 8, 92, 21002, 1519, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Lord of Blackrock: Field Marshal Afrasiabi - Add Aura Rallying Cry of the Dragonslayer to Players in Stormwind City'),
(7782, 25, 0, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Lord of Blackrock: Field Marshal Afrasiabi - Add Gossip Flag');

-- Rallying Call spawns. Positions are guessed.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`) VALUES 
(251482, 179560, 0, -8951.7, 865.88, 104.826, 0.268148, 0, 0, 0.133673, 0.991026, 30, 30, 1, 100),
(251483, 179560, 0, -8800.6, 643.17, 94.2744, 0.268148, 0, 0, 0.133673, 0.991026, 30, 30, 1, 100),
(251484, 179560, 0, -8734.6, 1043.2, 92.1468, 0.268148, 0, 0, 0.133673, 0.991026, 30, 30, 1, 100),
(251485, 179560, 0, -8705.6, 418.51, 99.3394, 0.268148, 0, 0, 0.133673, 0.991026, 30, 30, 1, 100),
(251486, 179560, 0, -8643.5, 758.1, 97.28, 0.268148, 0, 0, 0.133673, 0.991026, 30, 30, 1, 100),
(251487, 179560, 0, -8523, 848.78, 106.519, 0.268148, 0, 0, 0.133673, 0.991026, 30, 30, 1, 100),
(251488, 179560, 0, -8424, 619.94, 95.5044, 0.268148, 0, 0, 0.133673, 0.991026, 30, 30, 1, 100);

-- Script to add Rallying Cry of the Dragonslayer to alive players.
DELETE FROM `generic_scripts` WHERE `id`=21002;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(21002, 0, 0, 74, 22888, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 'Player - Add Aura Rallying Cry of the Dragonslayer');

-- Remove custom creature Alliance Rallying Cry Generator.
DELETE FROM `creature_template` WHERE `entry`=21002;

-- Assign Stormwind faction to Rallying Call.
UPDATE `gameobject_template` SET `faction`=11 WHERE `entry`=179560;

-- Update script for Head of Rend Blackhand.
DELETE FROM `generic_scripts` WHERE `id`=4974;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(4974, 0, 0, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'For The Horde: Thrall - Remove Gossip Flag'),
(4974, 0, 0, 10, 10719, 30000, 0, 0, 0, 0, 0, 0, 2, 10719, -1, 10, -484.722, -2604.82, 127.948, 3.16814, 0, 'For The Horde: Thrall - Summon Creature Herald of Thrall'),
(4974, 0, 0, 13, 0, 0, 0, 0, 12345, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'For The Horde: Thrall - Activate Unadorned Stake'),
(4974, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6013, 0, 0, 0, 0, 0, 0, 0, 0, 'For The Horde: Thrall - Say Text 1'),
(4974, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6014, 0, 0, 0, 0, 0, 0, 0, 0, 'For The Horde: Thrall - Say Text 2'),
(4974, 15, 0, 15, 16609, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'For The Horde: Thrall - Cast Spell Warchief\'s Blessing'),
(4974, 15, 1, 13, 0, 0, 0, 0, 251495, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'For The Horde: Thrall - Activate Font of Power 1'),
(4974, 15, 2, 13, 0, 0, 0, 0, 251496, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'For The Horde: Thrall - Activate Font of Power 2'),
(4974, 15, 3, 13, 0, 0, 0, 0, 251497, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'For The Horde: Thrall - Activate Font of Power 3'),
(4974, 15, 4, 13, 0, 0, 0, 0, 251498, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'For The Horde: Thrall - Activate Font of Power 4'),
(4974, 15, 5, 13, 0, 0, 0, 0, 251499, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'For The Horde: Thrall - Activate Font of Power 5'),
(4974, 15, 6, 13, 0, 0, 0, 0, 251500, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'For The Horde: Thrall - Activate Font of Power 6'),
(4974, 15, 7, 92, 21003, 1637, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'For The Horde: Thrall - Add Aura Warchief\'s Blessing to Players in Orgrimmar'),
(4974, 30, 0, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'For The Horde: Thrall - Add Gossip Flag');

-- Font of Power spawns. Positions are sniffed.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`) VALUES 
(251495, 175791, 1, 1582.23, -4404.07, 5.36945, 1.78023, 0, 0, 0.777145, 0.629321, 30, 30, 1, 100),
(251496, 175791, 1, 1624.45, -4373.86, 11.8031, 1.67551, 0, 0, 0.743144, 0.669131, 30, 30, 1, 100),
(251497, 175791, 1, 1674.92, -4445.76, 19.0135, 1.13446, 0, 0, 0.537299, 0.843392, 30, 30, 1, 100),
(251498, 175791, 1, 1675.98, -4324.04, 61.2462, 1.95477, 0, 0, 0.829038, 0.559193, 30, 30, 1, 100),
(251499, 175791, 1, 1727.38, -4400.56, 34.3441, 5.14872, 0, 0, -0.537299, 0.843392, 30, 30, 1, 100),
(251500, 175791, 1, 1920.97, -4148.45, 40.4101, 3.45576, 0, 0, -0.987688, 0.156436, 30, 30, 1, 100);

-- Spawn script for Herald of Thrall.
DELETE FROM `generic_scripts` WHERE `id`=10719;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(10719, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6013, 0, 0, 0, 0, 0, 0, 0, 0, 'For The Horde: Herald of Thrall - Say Text 1'),
(10719, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6015, 0, 0, 0, 0, 0, 0, 0, 0, 'For The Horde: Herald of Thrall - Say Text 2'),
(10719, 15, 0, 15, 16609, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'For The Horde: Herald of Thrall - Cast Spell Warchief\'s Blessing');

-- Add immune to players and npcs flags to Herald of Thrall.
UPDATE `creature_template` SET `unit_flags`=768, `movement_type`=1 WHERE `entry`=10719;

-- Script to add Warchief's Blessing to alive players.
DELETE FROM `generic_scripts` WHERE `id`=21003;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(21003, 0, 0, 74, 16609, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 'Player - Add Aura Warchief\'s Blessing');

-- Remove custom creature Warchief Blessing Generator.
DELETE FROM `creature_template` WHERE `entry`=21003;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
