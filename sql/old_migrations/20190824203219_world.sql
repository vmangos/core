DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190824203219');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190824203219');
-- Add your query below.


-- The Severed Head of Onyxia is added in patch 1.3.
UPDATE `gameobject_template` SET `patch`=1 WHERE `entry` IN (179556, 179558);

-- The Severed Head of Nefarian is added in patch 1.6.
UPDATE `gameobject_template` SET `patch`=4 WHERE `entry` IN (179881, 179882);

-- Correct factions for The Severed Head of Onyxia and The Severed Head of Nefarian.
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry` IN(179556, 179558, 179881, 179882);

-- Correct spawn positions for The Severed Head of Onyxia and The Severed Head of Nefarian.
DELETE FROM `gameobject` WHERE `id` IN (179556, 179558, 179881, 179882);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES 
(40134, 179556, 1, 1536.94, -4409.44, 8.05935, 1.64061, 0, 0, 0.731353, 0.681999, -21600, -21600, 100, 1, 0, 0, 1, 10),
(40135, 179558, 0, -8971.19, 554.141, 105.972, -2.25147, 0, 0, -0.902585, 0.430512, -21600, -21600, 0, 2, 0, 0, 1, 10),
(40150, 179881, 1, 1537.89, -4421.62, 7.55304, -1.15192, 0, 0, -0.544639, 0.838671, -21600, -21600, 255, 1, 0, 0, 4, 10),
(40151, 179882, 0, -8926.29, 495.856, 103.465, 2.37364, 0, 0, 0.927183, 0.374608, -21600, -21600, 255, 1, 0, 0, 4, 10);

-- Correct size of The Severed Head of Nefarian.
UPDATE `gameobject_template` SET `size`=1.25 WHERE `entry` IN(179881);
UPDATE `gameobject_template` SET `size`=1.15 WHERE `entry` IN(179882);

-- Events list for High Overlord Saurfang
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1472005);
DELETE FROM `creature_ai_events` WHERE `creature_id`=14720;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1472001, 14720, 0, 12, 0, 100, 1, 20, 0, 2500, 3500, 1472001, 0, 0, 'Saurfang - Execute 20% Target HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1472002, 14720, 0, 5, 0, 100, 0, 0, 0, 1, 0, 1472002, 0, 0, 'Saurfang - Say Text on Kill');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1472003, 14720, 0, 9, 0, 100, 1, 8, 25, 25000, 25000, 1472003, 0, 0, 'Saurfang - Cast Shield Charge');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1472004, 14720, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1472004, 0, 0, 'Saurfang - Cast Saurfang Rage On Aggro');
DELETE FROM `creature_ai_scripts` WHERE `id`=1472002;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1472002, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11564, 0, 0, 0, 0, 0, 0, 0, 0, 'High Overlord Saurfang - Say Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=1472003;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1472003, 0, 15, 15749, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Overlord Saurfang - Cast Spell Shield Charge');
DELETE FROM `creature_ai_scripts` WHERE `id`=1472004;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1472004, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11563, 0, 0, 0, 0, 0, 0, 0, 0, 'High Overlord Saurfang - Say Text');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1472004, 0, 15, 9347, 34, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Overlord Saurfang - Cast Spell Mortal Strike');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1472004, 0, 15, 26341, 34, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Overlord Saurfang - Cast Spell Saurfang s Rage');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (147200, 'Orgrimmar - High Overlord Saurfang', 16044, 100, 1, 0, 0, 0, 5, 8, 7, 7, 0, 14100, 100, 0, 0, 0, 0, 3, 9, 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name`='', `spell_list_id`=147200 WHERE `entry`=14720;

-- Remove unused scripts.
DELETE FROM `creature_ai_scripts` WHERE `id` IN (3001531, 3001532, 3001533);

/*
  --------------------------------------------------
  Data for Onyxia's Head quest event - Horde Version
  --------------------------------------------------
*/

-- Remove no longer used texts.
DELETE FROM `script_texts` WHERE `entry` IN (-1900113, -1900112);

-- Remove hardcoded script for Overlord Runthak.
UPDATE `creature_template` SET `script_name`='' WHERE `entry`=14392;

-- Waypoints for Overlord Runthak.
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `wander_distance`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES 
(14392, 1, 1540.2, -4405.02, 11.18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(14392, 2, 1541.95, -4405.1, 10.244, 18000, 0, 1439202, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14392, 3, 1568, -4405.87, 8.13371, 2000, 0, 1439203, 0, 0, 0, 0, 0, 0, 0, 3.31613, 0, 0),
(14392, 4, 1568, -4405.87, 8.13371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.31613, 0, 0);

-- Condition: The Severed Head of Onyxia is not spawned.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (61, 48, 0, 0, 0, 0, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (7491, 50, 40134, 61, 0, 0, 0);

-- Completion script for quest For All To See.
UPDATE `quest_template` SET `CompleteScript`=7491 WHERE `entry`=7491;
DELETE FROM `quest_end_scripts` WHERE `id`=7491;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7491, 0, 39, 7491, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 7491, 'For All To See: Start Script');
DELETE FROM `event_scripts` WHERE `id`=7491;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7491, 0, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'For All To See: Overlord Runthak - Remove Gossip Flag');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7491, 0, 4, 46, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'For All To See: Overlord Runthak - Add Unattackable Flag');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7491, 0, 61, 7491, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'For All To See: Start Map Event');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7491, 2, 20, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'For All To See: Overlord Runthak - Start Waypoints');
DELETE FROM `creature_movement_scripts` WHERE `id`=1439202;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1439202, 1, 1, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Overlord Runthak - Emote Shout');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1439202, 1, 0, 6, 0, 0, 0, 7491, 0, 21, 0, 9491, 0, 0, 0, 0, 0, 0, 0, 0, 'Overlord Runthak - Say Text');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1439202, 1, 9, 40134, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Overlord Runthak - Respawn The Severed Head of Onyxia');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1439202, 9, 1, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Overlord Runthak - Emote Shout');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1439202, 9, 0, 6, 0, 0, 0, 0, 0, 0, 0, 9492, 0, 0, 0, 0, 0, 0, 0, 0, 'Overlord Runthak - Say Text');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1439202, 9, 80, 0, 0, 0, 0, 40134, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Overlord Runthak - Set GO State of The Severed Head of Onyxia');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1439202, 16, 15, 22888, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Overlord Runthak - Cast Rallying Cry of the Dragonslayer');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1439202, 16, 10, 21001, 3000, 0, 0, 0, 0, 0, 0, 2, 21001, 6, 3, 1678.6, -4355.3, 61.73, 0, 0, 'Overlord Runthak - Summon Horde Rallying Cry Generator 1');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1439202, 16, 10, 21001, 3000, 0, 0, 0, 0, 0, 0, 2, 21001, 6, 3, 1550.3, -4186.2, 40.95, 0, 0, 'Overlord Runthak - Summon Horde Rallying Cry Generator 2');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1439202, 16, 10, 21001, 3000, 0, 0, 0, 0, 0, 0, 2, 21001, 6, 3, 1931.2, -4279.3, 29.9, 0, 0, 'Overlord Runthak - Summon Horde Rallying Cry Generator 3');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1439202, 16, 10, 21001, 3000, 0, 0, 0, 0, 0, 0, 2, 21001, 6, 3, 1919, -4117.2, 43.45, 0, 0, 'Overlord Runthak - Summon Horde Rallying Cry Generator 4');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1439202, 16, 10, 21001, 3000, 0, 0, 0, 0, 0, 0, 2, 21001, 6, 3, 1804.3, -4344.9, -2.9, 0, 0, 'Overlord Runthak - Summon Horde Rallying Cry Generator 5');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1439202, 16, 10, 21001, 3000, 0, 0, 0, 0, 0, 0, 2, 21001, 6, 3, 1881, -4518.5, 27.74, 0, 0, 'Overlord Runthak - Summon Horde Rallying Cry Generator 6');
DELETE FROM `event_scripts` WHERE `id`=21001;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (21001, 0, 15, 22888, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Rallying Cry Generator - Cast Rallying Cry of the Dragonslayer');
DELETE FROM `creature_movement_scripts` WHERE `id`=1439203;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1439203, 0, 20, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Overlord Runthak - Move Idle');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1439203, 2, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Overlord Runthak - Add Gossip Flag');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1439203, 2, 4, 46, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Overlord Runthak - Remove Unattackable Flag');

/*
  --------------------------------------------------
  Data for Nefarian's Head quest event - Horde Version
  --------------------------------------------------
*/

-- Remove no longer used texts.
DELETE FROM `script_texts` WHERE `entry` IN (-1900106, -1900105);

-- Waypoints for High Overlord Saurfang.
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `wander_distance`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES 
(14720, 1, 1540.54, -4427.2, 11.29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(14720, 2, 1542.73, -4425.55, 10.87, 35000, 0, 1472002, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14720, 3, 1567.39, -4394.9, 6.89, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(14720, 4, 1565.79, -4395.27, 6.9866, 2000, 0, 1472004, 0, 0, 0, 0, 0, 0, 0, 3.35103, 0, 0),
(14720, 5, 1565.79, -4395.27, 6.9866, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.35103, 0, 0);

-- Condition: The Severed Head of Nefarian is not spawned.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (7784, 50, 40150, 61, 0, 0, 0);

-- Completion script for quest The Lord of Blackrock.
UPDATE `quest_template` SET `CompleteScript`=7784 WHERE `entry`=7784;
DELETE FROM `quest_end_scripts` WHERE `id`=7784;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7784, 0, 39, 7784, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 7784, 'The Lord of Blackrock: Start Script');
DELETE FROM `event_scripts` WHERE `id`=7784;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7784, 0, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Lord of Blackrock: High Overlord Saurfang - Remove Gossip Flag');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7784, 0, 4, 46, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Lord of Blackrock: High Overlord Saurfang - Add Unattackable Flag');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7784, 0, 61, 7784, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Lord of Blackrock: Start Map Event');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7784, 2, 20, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Lord of Blackrock: High Overlord Saurfang - Start Waypoints');
DELETE FROM `creature_movement_scripts` WHERE `id`=1472002;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1472002, 1, 1, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Overlord Saurfang - Emote Shout');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1472002, 1, 0, 6, 0, 0, 0, 7784, 0, 21, 0, 9867, 0, 0, 0, 0, 0, 0, 0, 0, 'High Overlord Saurfang - Say Text');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1472002, 1, 9, 40150, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Overlord Saurfang - Respawn The Severed Head of Nefarian');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1472002, 11, 1, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Overlord Saurfang - Emote Shout');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1472002, 11, 0, 6, 0, 0, 0, 7784, 0, 21, 0, 9868, 0, 0, 0, 0, 0, 0, 0, 0, 'High Overlord Saurfang - Say Text');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1472002, 11, 80, 0, 0, 0, 0, 40150, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Overlord Saurfang - Set Go State of Severed Head of Nefarian');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1472002, 16, 15, 22888, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Overlord Saurfang - Cast Rallying Cry of the Dragonslayer');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1472002, 16, 10, 21001, 3000, 0, 0, 0, 0, 0, 0, 2, 21001, 6, 3, 1678.6, -4355.3, 61.73, 0, 0, 'Overlord Runthak - Summon Horde Rallying Cry Generator 1');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1472002, 16, 10, 21001, 3000, 0, 0, 0, 0, 0, 0, 2, 21001, 6, 3, 1550.3, -4186.2, 40.95, 0, 0, 'Overlord Runthak - Summon Horde Rallying Cry Generator 2');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1472002, 16, 10, 21001, 3000, 0, 0, 0, 0, 0, 0, 2, 21001, 6, 3, 1931.2, -4279.3, 29.9, 0, 0, 'Overlord Runthak - Summon Horde Rallying Cry Generator 3');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1472002, 16, 10, 21001, 3000, 0, 0, 0, 0, 0, 0, 2, 21001, 6, 3, 1919, -4117.2, 43.45, 0, 0, 'Overlord Runthak - Summon Horde Rallying Cry Generator 4');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1472002, 16, 10, 21001, 3000, 0, 0, 0, 0, 0, 0, 2, 21001, 6, 3, 1804.3, -4344.9, -2.9, 0, 0, 'Overlord Runthak - Summon Horde Rallying Cry Generator 5');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1472002, 16, 10, 21001, 3000, 0, 0, 0, 0, 0, 0, 2, 21001, 6, 3, 1881, -4518.5, 27.74, 0, 0, 'Overlord Runthak - Summon Horde Rallying Cry Generator 6');
DELETE FROM `creature_movement_scripts` WHERE `id`=1472004;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1472004, 0, 20, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Overlord Saurfang - Move Idle');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1472004, 0, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Overlord Saurfang - Add Gossip Flag');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1472004, 0, 4, 46, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Overlord Saurfang - Remove Unattackable Flag');

/*
  --------------------------------------------------
  Data for Nefarian's Head quest event - Alliance Version
  --------------------------------------------------
*/

-- Remove no longer used texts.
DELETE FROM `script_texts` WHERE `entry` IN (-1900104, -1900103);

-- Remove hardcoded script for Field Marshal Afrasiabi.
UPDATE `creature_template` SET `script_name`='' WHERE `entry`=14721;

-- Condition: The Severed Head of Nefarian is not spawned.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (7782, 50, 40151, 61, 0, 0, 0);

-- Completion script for quest The Lord of Blackrock.
UPDATE `quest_template` SET `CompleteScript`=7782 WHERE `entry`=7782;
DELETE FROM `quest_end_scripts` WHERE `id`=7782;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7782, 0, 39, 7782, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 7782, 'The Lord of Blackrock: Start Script');
DELETE FROM `event_scripts` WHERE `id`=7782;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7782, 0, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Lord of Blackrock: Field Marshal Afrasiabi - Remove Gossip Flag');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7782, 0, 4, 46, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Lord of Blackrock: Field Marshal Afrasiabi - Add Unattackable Flag');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7782, 3, 0, 6, 0, 0, 0, 0, 0, 0, 0, 9870, 0, 0, 0, 0, 0, 0, 0, 0, 'The Lord of Blackrock: Field Marshal Afrasiabi - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7782, 3, 1, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Lord of Blackrock: Field Marshal Afrasiabi - Emote Shout');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7782, 14, 0, 6, 0, 0, 0, 0, 0, 0, 0, 9872, 0, 0, 0, 0, 0, 0, 0, 0, 'The Lord of Blackrock: Field Marshal Afrasiabi - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7782, 14, 1, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Lord of Blackrock: Field Marshal Afrasiabi - Emote Shout');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7782, 14, 9, 40151, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Lord of Blackrock: The Severed Head of Nefarian - Respawn');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7782, 20, 15, 22888, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Lord of Blackrock: Field Marshal Afrasiabi - Cast Rallying Cry of the Dragonslayer');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7782, 20, 10, 21002, 3000, 0, 0, 0, 0, 0, 4, 2, 21002, 6, 3, -8800.6, 643.17, 94.29, 0, 0, 'The Lord of Blackrock: Field Marshal Afrasiabi - Summon Alliance Rallying Cry Generator 1');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7782, 20, 10, 21002, 3000, 0, 0, 0, 0, 0, 4, 2, 21002, 6, 3, -8643.5, 758.1, 97.28, 0, 0, 'The Lord of Blackrock: Field Marshal Afrasiabi - Summon Alliance Rallying Cry Generator 2');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7782, 20, 10, 21002, 3000, 0, 0, 0, 0, 0, 4, 2, 21002, 6, 3, -8523, 848.78, 106.8, 0, 0, 'The Lord of Blackrock: Field Marshal Afrasiabi - Summon Alliance Rallying Cry Generator 3');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7782, 20, 10, 21002, 3000, 0, 0, 0, 0, 0, 4, 2, 21002, 6, 3, -8951.7, 865.88, 104.9, 0, 0, 'The Lord of Blackrock: Field Marshal Afrasiabi - Summon Alliance Rallying Cry Generator 4');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7782, 20, 10, 21002, 3000, 0, 0, 0, 0, 0, 4, 2, 21002, 6, 3, -8424, 619.94, 95.55, 0, 0, 'The Lord of Blackrock: Field Marshal Afrasiabi - Summon Alliance Rallying Cry Generator 5');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7782, 20, 10, 21002, 3000, 0, 0, 0, 0, 0, 4, 2, 21002, 6, 3, -8705.6, 418.51, 99.35, 0, 0, 'The Lord of Blackrock: Field Marshal Afrasiabi - Summon Alliance Rallying Cry Generator 6');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7782, 20, 10, 21002, 3000, 0, 0, 0, 0, 0, 4, 2, 21002, 6, 3, -8734.6, 1043.2, 92.15, 0, 0, 'The Lord of Blackrock: Field Marshal Afrasiabi - Summon Alliance Rallying Cry Generator 7');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7782, 25, 4, 46, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Lord of Blackrock: Field Marshal Afrasiabi - Remove Unattackable Flag');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7782, 25, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Lord of Blackrock: Field Marshal Afrasiabi - Add Gossip Flag');
DELETE FROM `event_scripts` WHERE `id`=21002;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (21002, 0, 15, 22888, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alliance Rallying Cry Generator - Cast Rallying Cry of the Dragonslayer');

/*
  --------------------------------------------------
  Data for Onyxia's Head quest event - Alliance Version
  --------------------------------------------------
*/

-- Remove no longer used texts.
DELETE FROM `script_texts` WHERE `entry` IN (-1900111, -1900110);

-- Remove hardcoded script for Major Mattingly.
UPDATE `creature_template` SET `script_name`='' WHERE `entry`=14394;

-- Condition: The Severed Head of Onyxia is not spawned.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (7496, 50, 40135, 61, 0, 0, 0);

-- Completion script for quest Celebrating Good Times.
UPDATE `quest_template` SET `CompleteScript`=7496 WHERE `entry`=7496;
DELETE FROM `quest_end_scripts` WHERE `id`=7496;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7496, 0, 39, 7496, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 7496, 'Celebrating Good Times: Start Script');
DELETE FROM `event_scripts` WHERE `id`=7496;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7496, 0, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Celebrating Good Times: Major Mattingly - Remove Gossip Flag');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7496, 0, 4, 46, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Celebrating Good Times: Major Mattingly - Add Unattackable Flag');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7496, 3, 0, 6, 0, 0, 0, 0, 0, 0, 0, 9495, 0, 0, 0, 0, 0, 0, 0, 0, 'Celebrating Good Times: Major Mattingly - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7496, 3, 1, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Celebrating Good Times: Major Mattingly - Emote Shout');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7496, 12, 0, 6, 0, 0, 0, 0, 0, 0, 0, 9496, 0, 0, 0, 0, 0, 0, 0, 0, 'Celebrating Good Times: Major Mattingly - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7496, 12, 1, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Celebrating Good Times: Major Mattingly - Emote Shout');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7496, 12, 9, 40135, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Celebrating Good Times: The Severed Head of Onyxia - Respawn');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7496, 20, 15, 22888, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Celebrating Good Times: Major Mattingly - Cast Rallying Cry of the Dragonslayer');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7496, 20, 10, 21002, 3000, 0, 0, 0, 0, 0, 4, 2, 21002, 6, 3, -8800.6, 643.17, 94.29, 0, 0, 'Celebrating Good Times: Major Mattingly - Summon Alliance Rallying Cry Generator 1');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7496, 20, 10, 21002, 3000, 0, 0, 0, 0, 0, 4, 2, 21002, 6, 3, -8643.5, 758.1, 97.28, 0, 0, 'Celebrating Good Times: Major Mattingly - Summon Alliance Rallying Cry Generator 2');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7496, 20, 10, 21002, 3000, 0, 0, 0, 0, 0, 4, 2, 21002, 6, 3, -8523, 848.78, 106.8, 0, 0, 'Celebrating Good Times: Major Mattingly - Summon Alliance Rallying Cry Generator 3');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7496, 20, 10, 21002, 3000, 0, 0, 0, 0, 0, 4, 2, 21002, 6, 3, -8951.7, 865.88, 104.9, 0, 0, 'Celebrating Good Times: Major Mattingly - Summon Alliance Rallying Cry Generator 4');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7496, 20, 10, 21002, 3000, 0, 0, 0, 0, 0, 4, 2, 21002, 6, 3, -8424, 619.94, 95.55, 0, 0, 'Celebrating Good Times: Major Mattingly - Summon Alliance Rallying Cry Generator 5');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7496, 20, 10, 21002, 3000, 0, 0, 0, 0, 0, 4, 2, 21002, 6, 3, -8705.6, 418.51, 99.35, 0, 0, 'Celebrating Good Times: Major Mattingly - Summon Alliance Rallying Cry Generator 6');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7496, 20, 10, 21002, 3000, 0, 0, 0, 0, 0, 4, 2, 21002, 6, 3, -8734.6, 1043.2, 92.15, 0, 0, 'Celebrating Good Times: Major Mattingly - Summon Alliance Rallying Cry Generator 7');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7496, 25, 4, 46, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Celebrating Good Times: Major Mattingly - Remove Unattackable Flag');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7496, 25, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Celebrating Good Times: Major Mattingly - Add Gossip Flag');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
