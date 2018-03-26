DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180326161129');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180326161129');
-- Add your query below.


-- Video sources:
-- https://www.youtube.com/watch?v=RGTzOkW7-O4
-- https://www.youtube.com/watch?v=r9sxMENMRk4
-- https://www.youtube.com/watch?v=nMbtkZWwkzs

-- Add Human Skull spawns (they are invisible).
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES (53170, 12202, 0, 0, 0, 1842.79, -3220.87, 121.129, 3.59538, 345, 345, 0, 0, 64, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES (53172, 12202, 0, 0, 0, 1849.51, -3204.82, 126.432, 3.03687, 345, 345, 0, 0, 64, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES (53173, 12202, 0, 0, 0, 1853.68, -3226.13, 121.928, 5.53269, 345, 345, 0, 0, 64, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES (54273, 12202, 0, 0, 0, 1889.25, -3203.56, 125.663, 4.79965, 345, 345, 0, 0, 64, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES (54274, 12202, 0, 0, 0, 1885.75, -3228.78, 120.675, 5.46288, 345, 345, 0, 0, 64, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES (54275, 12202, 0, 0, 0, 1894.42, -3217.24, 123.061, 0.20944, 345, 345, 0, 0, 64, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES (92775, 12202, 0, 0, 0, 1853.38, -3213.82, 124.85, 2.33874, 345, 345, 0, 0, 64, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES (92846, 12202, 0, 0, 0, 1868.19, -3228.62, 124.546, 3.36848, 345, 345, 0, 0, 64, 0, 0, 0);

-- Script for Human Skull.
DELETE FROM `creature_ai_events` WHERE `creature_id`=12202;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1220201, 12202, 0, 8, 0, 100, 0, 19032, -1, 0, 0, 1220201, 0, 0, 'Human Skull - Start Event on Spell Hit');
DELETE FROM `creature_ai_scripts` WHERE `id`=1220201;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1220201, 0, 15, 19031, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Human Skull - Cast Summon Human Skull');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1220201, 0, 39, 11885, 0, 0, 0, 11885, 40, 8, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Human Skull - Start Event Script');
DELETE FROM `event_scripts` WHERE `id`=11885;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (11885, 0, 25, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blighthound - Set Run');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (11885, 2, 3, 2, 2500, 5, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 'Blighthound - Run to Human Skull');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (11885, 5, 25, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blighthound - Set Run');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (11885, 5, 3, 2, 1900, 5, 0, 11878, 40, 8, 1, 0, 0, 0, 0, 3, 0, 0, 0, 0, 'Blighthound - Run to Nathanos');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (11885, 5, 18, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Human Skull - Despawn (Creature)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (11885, 5, 41, 0, 0, 0, 0, 177564, 10, 11, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Human Skull - Remove Object (GameObject)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (11885, 7, 0, 0, 0, 0, 0, 11878, 40, 8, 2, 7473, 0, 0, 0, 0, 0, 0, 0, 0, 'Nathanos - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (11885, 10, 35, 1, 0, 0, 0, 11878, 40, 8, 2, 0, 0, 0, 0, 0, 0, 0, 5.0091, 0, 'Nathanos - Reset Orientation');
UPDATE `creature_template` SET `AIName`='EventAI' WHERE `entry`=12202;

-- Add target for Blighthound Call.
INSERT INTO `spell_script_target` VALUES (19033, 1, 11885);

-- Events list for Blighthound.
DELETE FROM `creature_ai_events` WHERE `creature_id`=11885;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1188501, 11885, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1188501, 0, 0, 'Blighthound - Cast Disease Cloud on Spawn');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1188502, 11885, 0, 9, 0, 100, 1, 0, 5, 12000, 17000, 1188502, 0, 0, 'Blighthound - Cast Rend');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1188503, 11885, 0, 8, 0, 100, 1, 19033, -1, 5000, 5000, 1188503, 0, 0, 'Blighthound - Go to Nathanos on Spell Hit');
DELETE FROM `creature_ai_scripts` WHERE `id`=1188503;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1188503, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blighthound - Set Run');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1188503, 0, 3, 2, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 'Blighthound - Go to Nathanos');

-- This text should be yelled.
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=7462;

-- Text on Summon Conquered Souls cast.
DELETE FROM `creature_spells_scripts` WHERE `id`=19096;
INSERT INTO `creature_spells_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (19096, 0, 39, 19096, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 'Nathanos Blightcaller - 50% Chance to Yell Text');
DELETE FROM `event_scripts` WHERE `id`=19096;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (19096, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7462, 0, 0, 0, 0, 0, 0, 0, 0, 'Nathanos Blightcaller - Yell Text');

-- This spell mod is wrong! 
-- Skeletons should spawn on the nearest Pile of Bones gameobject, and they SHOULD be guardians.
-- This is why he doesn't spawn skeletons when you kite him away, cause there aren't any Piles of Bones nearby.
-- And they need to be Guardians so that they run to him after spawning, this can bee seen in the videos.
DELETE FROM `spell_effect_mod` WHERE `id`=19096;

-- Target for spell Summon Conquered Soul.
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES (19096, 0, 177604);

-- EventAI script for Nathanos Blightcaller.
INSERT INTO `conditions` VALUES (265, 20, 12202, 40, 0); -- There is a Human Skull nearby.
INSERT INTO `conditions` VALUES (266, 20, 11885, 10, 0); -- There is a Blighthound nearby.
INSERT INTO `conditions` VALUES (267, -1, 265, 266, 2);
INSERT INTO `conditions` VALUES (268, 39, 0, 0, 3);		 -- Not moving.
INSERT INTO `conditions` VALUES (269, -1, 267, 268, 0);
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1187805, 1187806, 1187807, 1187808, 1187809, 1187810, 1187811);
DELETE FROM `creature_ai_events` WHERE `creature_id`=11878;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1187801, 11878, 269, 1, 0, 100, 1, 60000, 60000, 120000, 240000, 1187801, 0, 0, 'Nathanos Blightcaller - Start Dog Fetch Event');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1187802, 11878, 0, 0, 0, 100, 1, 30000, 30000, 30000, 30000, 1187802, 0, 0, 'Nathanos Blightcaller - Cast Spell Blighthound Call');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1187803, 11878, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1187803, 0, 0, 'Nathanos Blightcaller - Say Text on Aggro');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1187804, 11878, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1187804, 0, 0, 'Nathanos Blightcaller - Say Text on Evade');
DELETE FROM `creature_ai_scripts` WHERE `id`=1187801;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1187801, 0, 15, 19033, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nathanos Blightcaller - Cast Spell Blighthound Call');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1187801, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7468, 0, 0, 0, 0, 0, 0, 0, 0, 'Nathanos Blightcaller - Say Text');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1187801, 0, 39, 19033, 0, 0, 0, 12202, 40, 8, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Nathanos Blightcaller - Start Event Script');
DELETE FROM `event_scripts` WHERE `id`=19033;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (19033, 2, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nathanos Blightcaller - Face Human Skull');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (19033, 2, 1, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nathanos Blightcaller - Point at Human Skull');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (19033, 4, 0, 0, 0, 0, 0, 11885, 10, 8, 2, 7469, 0, 0, 0, 0, 0, 0, 0, 0, 'Blighthound - Say Emote Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (19033, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7470, 0, 0, 0, 0, 0, 0, 0, 0, 'Nathanos Blightcaller - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (19033, 9, 15, 19032, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nathanos Blightcaller - Cast Spell Throw Human Skull');
DELETE FROM `creature_ai_scripts` WHERE `id`=1187802;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1187802, 0, 15, 19033, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nathanos Blightcaller - Cast Spell Blighthound Call');
DELETE FROM `creature_ai_scripts` WHERE `id`=1187803;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1187803, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7229, 7233, 7231, 7232, 0, 0, 0, 0, 0, 'Nathanos Blightcaller - Say Random Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=1187804;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1187804, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7234, 7237, 7238, 7239, 0, 0, 0, 0, 0, 'Nathanos Blightcaller - Say Random Text');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1187804, 0, 56, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nathanos Blightcaller - Despawn Guardians');

-- Creature spells template for Nathanos Blightcaller.
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (118780, 'Eastern Plaguelands - Nathanos Blightcaller', 18649, 90, 4, 0, 6, 7, 8, 15, 0, 18651, 90, 4, 0, 10, 10, 8, 15, 0, 6253, 100, 1, 0, 7, 9, 8, 12, 0, 13704, 100, 0, 0, 12, 15, 10, 20, 0, 19096, 50, 1, 0, 5, 10, 5, 10, 19096, 16100, 100, 1, 8, 0, 0, 2, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `faction_A`=1174, `faction_H`=1174, `spells_template`=118780, `AIName`='EventAI', `ScriptName`='' WHERE `entry`=11878;

-- Start script for quest The Scarlet Oracle, Demetria.
DELETE FROM `quest_start_scripts` WHERE `id`=6148;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (6148, 0, 10, 12339, 0, 0, 0, 0, 0, 0, 0, 2, 0, 6, 7, 1629.34, -5492.59, 100.728, 1.08793, 0, 'The Scarlet Oracle, Demetria - Summon Demetria');
UPDATE `quest_template` SET `StartScript`=6148 WHERE `entry`=6148;

-- Quest "The Ranger Lord's Behest" is horde only.
UPDATE `quest_template` SET `RequiredRaces`=178 WHERE `entry`=6133;
-- Quest "To Kill With Purpose" is horde only.
UPDATE `quest_template` SET `RequiredRaces`=178 WHERE `entry`=6022;
-- Quest "The Call to Command" is horde only.
UPDATE `quest_template` SET `RequiredRaces`=178 WHERE `entry`=6144;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
