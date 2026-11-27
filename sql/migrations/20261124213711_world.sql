DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20261124213711');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20261124213711');
-- Add your query below.

-- --------------------------------------------------------------------------------------------------
-- Lady Anacondra
-- --------------------------------------------------------------------------------------------------

-- One of the four channelling Druid of the Fang points is Lady Anacondra, the other three hold a druid.
DELETE FROM `creature` WHERE `guid` IN (27366, 300999, 301000, 301001);
DELETE FROM `pool_creature_template` WHERE `id`=3671;
DELETE FROM `pool_template` WHERE `entry`=10004;
UPDATE `creature` SET `id2`=3671, `spawntimesecsmin`=36000, `spawntimesecsmax`=36000 WHERE `guid` IN (18687, 26252, 27350, 301002);
-- Standing. The channel is cast by EventAI (an addon aura shows no channel animation).
DELETE FROM `creature_addon` WHERE `guid` IN (18687, 26252, 27350, 301002);

-- The group only picks the entries. A guid can be in one group only, so the guards of two points aggro with
-- whoever stands there through creature_linking.
DELETE FROM `creature_groups` WHERE `leader_guid` IN (27350, 301002);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES
(26252, 18687, 0, 0, 0),
(26252, 27350, 0, 0, 0),
(26252, 301002, 0, 0, 0);
INSERT INTO `creature_groups_entry_limit` (`leader_guid`, `creature_id`, `min_count`, `max_count`) VALUES
(26252, 3671, 1, 1);
INSERT INTO `creature_linking` (`guid`, `master_guid`, `flag`) VALUES
(27356, 27350, 3),   -- Deviate Ravager
(27359, 301002, 3),  -- Deviate Guardian
(27360, 301002, 3);  -- Deviate Guardian

DELETE FROM `creature_spells` WHERE `entry`=36710;
DELETE FROM `creature_ai_events` WHERE `creature_id`=3671;
DELETE FROM `creature_ai_scripts` WHERE `id` BETWEEN 367101 AND 367199;

INSERT INTO `creature_spells` (`entry`, `name`,
    `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`,
    `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`,
    `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`,
    `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`) VALUES
(36710, 'Wailing Caverns - Lady Anacondra',
    8148, 100,  0, 0, 0,  0, 1,  1, 50, 50, 0,  -- Thorns Aura
    5187, 100, 17, 0, 0,  0, 0,  0, 15, 26, 0,  -- Healing Touch: friendly below 50% hp within spell range
     700, 100,  5, 0, 0, 32, 8, 12, 12, 25, 0,  -- Sleep
    9532,  90,  1, 0, 0,  8, 0,  0,  2,  2, 0); -- Lightning Bolt

INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(367101, 0, 0,  0,     0, 0, 0, 0, 0, 0, 0, 0, 6097, 0, 0, 0, 0, 0, 0, 0, 0, 'Lady Anacondra - Say Text'),
(367102, 0, 0, 15, 13236, 0, 0, 0, 0, 0, 0, 4,    0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lady Anacondra - Cast Spell Nature Channeling'),
(367103, 0, 0, 37,     0, 0, 0, 0, 0, 0, 0, 0,    0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lady Anacondra - Set Instance Data NOT_STARTED'),
(367105, 0, 0, 37,     0, 3, 0, 0, 0, 0, 0, 0,    0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lady Anacondra - Set Instance Data DONE');

INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(367101, 3671, 0, 4, 0, 100, 0,    0,    0, 0, 0, 367101, 0, 0, 'Lady Anacondra - Say on Aggro'),
(367102, 3671, 0, 1, 0, 100, 0, 1000, 1000, 0, 0, 367102, 0, 0, 'Lady Anacondra - Cast Nature Channeling OOC'),
(367103, 3671, 0, 7, 0, 100, 0,    0,    0, 0, 0, 367103, 0, 0, 'Lady Anacondra - Set Instance Data on Evade'),
(367105, 3671, 0, 6, 0, 100, 0,    0,    0, 0, 0, 367105, 0, 0, 'Lady Anacondra - Set Instance Data on Death');

-- --------------------------------------------------------------------------------------------------
-- Kresh
-- --------------------------------------------------------------------------------------------------

-- Swims the whole river loop: north to the waterfall pool and west past the bridge.
DELETE FROM `creature_movement` WHERE `id`=27368;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(27368, 1, -44.8007, 305.259, -106.417, 100, 0, 0, 0),
(27368, 2, -32.5041, 290.754, -106.417, 100, 0, 0, 0),
(27368, 3, -20.8746, 273.006, -106.417, 100, 0, 0, 0),
(27368, 4, -11.3159, 247.89, -106.344, 100, 0, 0, 0),
(27368, 5, -8.17325, 223.437, -106.163, 100, 0, 0, 0),
(27368, 6, -7.57741, 202.096, -106.163, 100, 0, 0, 0),
(27368, 7, -8.89105, 181.096, -106.163, 100, 0, 0, 0),
(27368, 8, -11.3937, 163.913, -106.163, 100, 0, 0, 0),
(27368, 9, -16.1442, 149.352, -106.163, 100, 0, 0, 0),
(27368, 10, -28.404, 128.264, -106.163, 100, 0, 0, 0),
(27368, 11, -46.7483, 102.631, -106.163, 100, 0, 0, 0),
(27368, 12, -52.9205, 90.712, -106.163, 100, 0, 0, 0),
(27368, 13, -55.1093, 83.4505, -106.163, 100, 0, 0, 0),
(27368, 14, -58.6901, 76.3781, -106.163, 100, 0, 0, 0),
(27368, 15, -62.9525, 72.3359, -106.163, 100, 0, 0, 0),
(27368, 16, -75.996, 71.5946, -106.163, 100, 0, 0, 0),
(27368, 17, -84.1777, 69.2621, -106.163, 100, 0, 0, 0),
(27368, 18, -92.3134, 65.9368, -106.163, 100, 0, 0, 0),
(27368, 19, -100.357, 66.2251, -106.259, 100, 0, 0, 0),
(27368, 20, -120.69, 71.8824, -106.442, 100, 0, 0, 0),
(27368, 21, -139.212, 71.107, -106.166, 100, 0, 0, 0),
(27368, 22, -150.104, 65.7444, -106.311, 100, 0, 0, 0),
(27368, 23, -155.877, 58.1956, -106.361, 100, 0, 0, 0),
(27368, 24, -154.651, 32.4415, -106.648, 100, 0, 0, 0),
(27368, 25, -154.773, 12.4538, -105.7, 100, 0, 0, 0),
(27368, 26, -158.958, 2.82365, -106.208, 100, 0, 0, 0),
(27368, 27, -173.109, -6.59597, -106.397, 100, 0, 0, 0),
(27368, 28, -190.102, -9.4344, -106.243, 100, 0, 0, 0),
(27368, 29, -169.26, -5.08474, -106.375, 100, 0, 0, 0),
(27368, 30, -156.951, 6.08111, -106.009, 100, 0, 0, 0),
(27368, 31, -153.483, 21.6673, -105.47, 100, 0, 0, 0),
(27368, 32, -154.685, 51.2861, -106.352, 100, 0, 0, 0),
(27368, 33, -149.849, 64.9798, -106.338, 100, 0, 0, 0),
(27368, 34, -139.068, 71.1707, -106.154, 100, 0, 0, 0),
(27368, 35, -120.406, 72.0676, -106.439, 100, 0, 0, 0),
(27368, 36, -109.081, 70.1327, -106.401, 100, 0, 0, 0),
(27368, 37, -97.633, 66.0886, -106.184, 100, 0, 0, 0),
(27368, 38, -88.6407, 66.2216, -106.161, 100, 0, 0, 0),
(27368, 39, -80.4933, 71.5953, -106.161, 100, 0, 0, 0),
(27368, 40, -63.3656, 72.3782, -106.161, 100, 0, 0, 0),
(27368, 41, -56.8746, 77.2352, -106.161, 100, 0, 0, 0),
(27368, 42, -52.9606, 90.3188, -106.161, 100, 0, 0, 0),
(27368, 43, -45.6264, 103.709, -106.161, 100, 0, 0, 0),
(27368, 44, -28.8159, 127.738, -106.161, 100, 0, 0, 0),
(27368, 45, -19.063, 141.466, -106.161, 100, 0, 0, 0),
(27368, 46, -12.2858, 158.042, -106.161, 100, 0, 0, 0),
(27368, 47, -9.01831, 171.966, -106.161, 100, 0, 0, 0),
(27368, 48, -7.55996, 201.698, -106.161, 100, 0, 0, 0),
(27368, 49, -7.859, 222.945, -106.161, 100, 0, 0, 0),
(27368, 50, -11.2468, 247.599, -106.339, 100, 0, 0, 0),
(27368, 51, -16.3697, 265.351, -106.417, 100, 0, 0, 0),
(27368, 52, -26.2989, 282.527, -106.417, 100, 0, 0, 0),
(27368, 53, -39.9706, 301.609, -106.417, 100, 0, 0, 0),
(27368, 54, -50.4176, 309.288, -106.417, 100, 0, 0, 0),
(27368, 55, -72.4502, 323.797, -106.162, 100, 0, 0, 0),
(27368, 56, -76.8971, 329.161, -106.162, 100, 0, 0, 0),
(27368, 57, -77.1239, 335.797, -106.162, 100, 0, 0, 0),
(27368, 58, -72.0056, 353.657, -106.173, 100, 0, 0, 0),
(27368, 59, -70.9167, 374.263, -105.182, 100, 0, 0, 0),
(27368, 60, -75.7733, 401.265, -107.862, 100, 0, 0, 0),
(27368, 61, -72.2112, 417.555, -107.009, 100, 0, 0, 0),
(27368, 62, -57.6043, 427.606, -105.979, 100, 0, 0, 0),
(27368, 63, -71.9469, 416.472, -107.104, 100, 0, 0, 0),
(27368, 64, -76.9202, 400.773, -107.867, 100, 0, 0, 0),
(27368, 65, -75.4612, 388.477, -106.392, 100, 0, 0, 0),
(27368, 66, -69.6617, 368.65, -105.263, 100, 0, 0, 0),
(27368, 67, -72.0043, 352.597, -106.162, 100, 0, 0, 0),
(27368, 68, -77.3223, 330.255, -106.162, 100, 0, 0, 0),
(27368, 69, -73.4961, 323.783, -106.162, 100, 0, 0, 0),
(27368, 70, -66.2326, 318.345, -106.592, 100, 0, 0, 0);

-- --------------------------------------------------------------------------------------------------
-- Lord Cobrahn
-- --------------------------------------------------------------------------------------------------

-- Serpent Form at 30% ends the caster spells, he only melees.
DELETE FROM `creature_spells` WHERE `entry` IN (36690, 36691);
DELETE FROM `creature_ai_events` WHERE `creature_id`=3669;
DELETE FROM `creature_ai_scripts` WHERE `id` BETWEEN 366901 AND 366999;

INSERT INTO `creature_spells` (`entry`, `name`,
    `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`,
    `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`) VALUES
(36690, 'Wailing Caverns - Lord Cobrahn (Druid Form)',
    8040, 100, 4, 0, 0, 0, 10, 10, 13, 20, 0,  -- Druid's Slumber
    9532, 100, 1, 0, 0, 8,  0,  0,  2,  2, 0); -- Lightning Bolt

INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(366901, 0, 0, 55, 36690, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Cobrahn - Set Spells Template'),
(366902, 0, 0,  0,     0, 0, 0, 0, 0, 0, 0, 0, 6094, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Cobrahn - Say Text'),
(366903, 0, 0, 15,  7965, 1, 0, 0, 0, 0, 0, 4,   0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Cobrahn - Cast Spell Cobrahn Serpent Form'),
(366903, 0, 1, 39,     1, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Cobrahn - Enable Attack and Combat Movement'),
(366903, 0, 2, 55,     0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Cobrahn - Clear Spells Template'),
(366903, 0, 3, 44,     1, 0, 0, 0, 0, 0, 0, 0,   0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Cobrahn - Set Phase to 1'),
(366904, 0, 0, 44,     0, 0, 0, 0, 0, 0, 0, 0,   0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Cobrahn - Set Phase to 0'),
(366905, 0, 0, 37,     1, 0, 0, 0, 0, 0, 0, 0,   0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Cobrahn - Set Instance Data NOT_STARTED'),
(366906, 0, 0, 37,     1, 1, 0, 0, 0, 0, 0, 0,   0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Cobrahn - Set Instance Data IN_PROGRESS'),
(366907, 0, 0, 37,     1, 3, 0, 0, 0, 0, 0, 0,   0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Cobrahn - Set Instance Data DONE'),
-- Only Cobrahn's death alerts Serpentis (DB guid 38148), while he is alive.
(366907, 0, 1,  0,     0, 0, 0, 0, 38148, 0, 11, 18, 2102, 0, 0, 0, 0, 0, 0, 0, 1000, 'Lord Cobrahn - Lord Serpentis Yell'),
(366908, 0, 0, 44,     2, 0, 0, 0, 0, 0, 0, 0,   0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Cobrahn - Set Phase to 2');

INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(366901, 3669, 0, 27, 3, 100, 0, 7965,    1, 0, 0, 366901, 0, 0, 'Lord Cobrahn - Set Spells Template on Serpent Form Expired'),
(366902, 3669, 0,  4, 0, 100, 0,    0,    0, 0, 0, 366902, 0, 0, 'Lord Cobrahn - Say on Aggro'),
(366903, 3669, 0,  2, 6, 100, 0,   30,    0, 0, 0, 366903, 0, 0, 'Lord Cobrahn - Enter Serpent Form at 30% HP'),
(366904, 3669, 0,  7, 0, 100, 0,    0,    0, 0, 0, 366904, 0, 0, 'Lord Cobrahn - Set Phase to 0 on Evade'),
(366905, 3669, 0,  7, 0, 100, 0,    0,    0, 0, 0, 366905, 0, 0, 'Lord Cobrahn - Set Instance Data on Evade'),
(366906, 3669, 0,  4, 0, 100, 0,    0,    0, 0, 0, 366906, 0, 0, 'Lord Cobrahn - Set Instance Data on Aggro'),
(366907, 3669, 0,  6, 0, 100, 0,    0,    0, 0, 0, 366907, 0, 0, 'Lord Cobrahn - Set Instance Data on Death'),
(366908, 3669, 0,  0, 5, 100, 0, 1000, 1000, 0, 0, 366908, 0, 0, 'Lord Cobrahn - Set Phase to 2 a second after entering Serpent Form');

-- --------------------------------------------------------------------------------------------------
-- Lord Pythas
-- --------------------------------------------------------------------------------------------------

DELETE FROM `creature_spells` WHERE `entry`=36700;
INSERT INTO `creature_spells` (`entry`, `name`,
    `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`,
    `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`,
    `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`,
    `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`) VALUES
(36700, 'Wailing Caverns - Lord Pythas',
    5187, 100, 17, 0, 0,  0, 0,  0, 20, 25, 0,  -- Healing Touch: friendly below 50% hp within spell range
     700, 100,  5, 0, 0,  0, 8, 12, 12, 20, 0,  -- Sleep
    8147, 100,  1, 0, 0, 64, 6, 13, 12, 15, 0,  -- Thunderclap
    9532, 100,  1, 0, 0,  8, 0,  0,  2,  2, 0); -- Lightning Bolt

-- --------------------------------------------------------------------------------------------------
-- Lord Serpentis
-- --------------------------------------------------------------------------------------------------

DELETE FROM `creature_spells` WHERE `entry`=36730;
INSERT INTO `creature_spells` (`entry`, `name`,
    `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`,
    `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`,
    `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`) VALUES
(36730, 'Wailing Caverns - Lord Serpentis',
    6778, 100, 17, 0, 0,  0, 0, 0, 17, 21, 0,  -- Healing Touch: friendly below 50% hp within spell range
     700, 100,  5, 0, 0, 32, 3, 6, 10, 20, 0,  -- Sleep
    9532, 100,  1, 0, 0,  8, 0, 0,  2,  2, 0); -- Lightning Bolt

-- --------------------------------------------------------------------------------------------------
-- Skum
-- --------------------------------------------------------------------------------------------------

DELETE FROM `creature_ai_events` WHERE `creature_id`=3674;
DELETE FROM `creature_ai_scripts` WHERE `id` BETWEEN 367401 AND 367499;

INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(367401, 0, 0, 15, 6254, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Skum - Cast Spell Chained Bolt'),
(367402, 0, 0, 47,    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Skum - Flee');

INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(367401, 3674, 0, 9, 0, 100, 13,  0, 30, 2000, 5000, 367401, 0, 0, 'Skum - Cast Chained Bolt'),
(367402, 3674, 0, 2, 0, 100,  4, 15,  0,    0,    0, 367402, 0, 0, 'Skum - Flee at 15% HP');

-- --------------------------------------------------------------------------------------------------
-- Verdan the Everliving
-- --------------------------------------------------------------------------------------------------

DELETE FROM `creature_ai_events` WHERE `creature_id`=5775;
DELETE FROM `creature_ai_scripts` WHERE `id` BETWEEN 577501 AND 577599;

INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(577501, 0, 0, 15, 8142, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Verdan the Everliving - Cast Spell Grasping Vines');

INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(577501, 5775, 0, 0, 0, 100, 13, 10000, 30000, 15000, 30000, 577501, 0, 0, 'Verdan the Everliving - Cast Grasping Vines');

-- --------------------------------------------------------------------------------------------------
-- Disciple of Naralex / Naralex: escort and awakening
-- --------------------------------------------------------------------------------------------------

-- The escort runs as map event 3678 (source and target = the Disciple). Every summon joins it as an extra target,
-- so a stop waits for "all summons dead" with a second map event. Delayed steps check the escort is still active
-- and the Disciple still stands at the stop, so a failed run never leaks into the next one.
DELETE FROM `script_waypoint` WHERE `entry`=3678;
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name`='', `spell_list_id`=36780 WHERE `entry`=3678;
UPDATE `creature_template` SET `auras`='8149' WHERE `entry`=5914;
-- Naralex's Awakening survives an evade of the Disciple, he is attacked during the ritual
-- (customFlags 1024 = SPELL_CUSTOM_NOT_REMOVED_ON_EVADE).
UPDATE `spell_template` SET `customFlags` = `customFlags` | 1024 WHERE `entry`=6271;

INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
(179, 36, 3678, 0, 0, 0, 1),   -- escort not active
(226, 47, 3678, 121, 0, 0, 0), -- every summon of the escort is dead or gone
(227, 36, 3678, 0, 0, 0, 0),   -- escort active
(240, -2, 121, 238, 0, 0, 0),  -- escort failed: Disciple dead or no living player within 60 yd
-- Waypoint ids in CONDITION_LAST_WAYPOINT and START_WAYPOINTS are 0-based: DB point - 1.
(241, 32, 0, 0, 0, 0, 0),      -- last reached waypoint: start
(242, 32, 11, 0, 0, 0, 0),     -- last reached waypoint: raptor corner
(255, 32, 29, 0, 0, 0, 0),     -- last reached waypoint: circle
(262, 32, 69, 0, 0, 0, 0),     -- last reached waypoint: ritual
(263, -1, 227, 241, 0, 0, 0),
(276, -1, 227, 242, 0, 0, 0),
(282, -1, 227, 255, 0, 0, 0),
(284, -1, 227, 262, 0, 0, 0);

-- Gossip: the option and its text show while the escort can start (TYPE_DISCIPLE = SPECIAL, condition 3678).
DELETE FROM `gossip_menu` WHERE `entry`=202;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(201, 699, 201, 3678);
UPDATE `gossip_menu_option` SET `menu_id`=201 WHERE `menu_id`=202 AND `id`=0;

DELETE FROM `gossip_scripts` WHERE `id`=202;
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(202, 0, 0, 37,    4,    1, 0, 0, 0, 0, 0, 0,       0,       0,       0,      0, 0, 0, 0, 0, 0, 'Disciple of Naralex - Set Instance Data TYPE_DISCIPLE IN_PROGRESS'),
(202, 0, 1, 22,  250,    1, 0, 0, 0, 0, 0, 0,       0,       0,       0,      0, 0, 0, 0, 0, 0, 'Disciple of Naralex - Set Faction Escortee'),
(202, 0, 2,  4,  147,    1, 2, 0, 0, 0, 0, 0,       0,       0,       0,      0, 0, 0, 0, 0, 0, 'Disciple of Naralex - Remove Gossip Npc Flag'),
(202, 0, 3, 61, 3678, 3600, 0, 0, 0, 0, 0, 4,       0,       0,     240, 367810, 0, 0, 0, 0, 0, 'Disciple of Naralex - Start Map Event Escort'),
(202, 0, 4, 60,    3,    0, 0, 0, 0, 0, 0, 0,       0,  367801,       0,      0, 0, 0, 0, 0, 0, 'Disciple of Naralex - Start Waypoints Escort');

INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`, `path_id`) VALUES
(367801, 1, -134.96526, 125.40187, -78.09446, 2.98006, 13000, 0, 367801, 0),
(367801, 2, -124.4064, 131.07953, -78.71027, 100, 0, 0, 0, 0),
(367801, 3, -113.91917, 142.769, -80.91416, 100, 0, 0, 0, 0),
(367801, 4, -111.16669, 153.64728, -80.55562, 100, 0, 0, 0, 0),
(367801, 5, -110.97073, 165.60736, -79.444725, 100, 0, 0, 0, 0),
(367801, 6, -109.30049, 181.25143, -79.76007, 100, 0, 0, 0, 0),
(367801, 7, -110.1942, 190.9626, -80.42992, 100, 0, 0, 0, 0),
(367801, 8, -109.58964, 199.15425, -81.23881, 100, 0, 0, 0, 0),
(367801, 9, -110.56909, 206.86935, -82.88934, 100, 0, 0, 0, 0),
(367801, 10, -110.30787, 216.23227, -85.9362, 100, 0, 0, 0, 0),
(367801, 11, -108.06385, 227.87166, -89.92641, 100, 0, 0, 0, 0),
(367801, 12, -104.28827, 234.40804, -91.64163, 5.742133, 3600000, 0, 367812, 0),
(367801, 13, -104.28827, 234.40804, -91.64163, 100, 0, 0, 0, 0),
(367801, 14, -98.08711, 229.5188, -91.07548, 100, 0, 0, 0, 0),
(367801, 15, -93.777916, 228.44995, -90.61347, 100, 0, 0, 0, 0),
(367801, 16, -85.272385, 227.1592, -93.12241, 100, 0, 0, 0, 0),
(367801, 17, -81.619774, 223.63588, -93.59701, 100, 0, 0, 0, 0),
(367801, 18, -78.13694, 219.21017, -94.11092, 100, 0, 0, 0, 0),
(367801, 19, -71.02429, 212.48766, -93.52012, 100, 0, 0, 0, 0),
(367801, 20, -66.8499, 209.88943, -93.305, 100, 0, 0, 0, 0),
(367801, 21, -61.41215, 207.00401, -93.55031, 100, 0, 0, 0, 0),
(367801, 22, -49.681805, 204.15556, -95.96281, 100, 0, 0, 0, 0),
(367801, 23, -41.188667, 204.99422, -96.51605, 100, 0, 0, 0, 0),
(367801, 24, -35.381386, 212.98494, -96.097084, 100, 0, 0, 0, 0),
(367801, 25, -33.46709, 223.27979, -95.67591, 100, 0, 0, 0, 0),
(367801, 26, -31.895458, 231.73523, -94.46018, 100, 0, 0, 0, 0),
(367801, 27, -33.1077, 240.3214, -93.595955, 100, 0, 0, 0, 0),
(367801, 28, -38.079693, 250.99289, -93.11742, 100, 0, 0, 0, 0),
(367801, 29, -43.072884, 259.32315, -92.84187, 100, 0, 0, 0, 0),
(367801, 30, -54.713943, 273.85025, -92.84426, 100, 3600000, 0, 367830, 0),
(367801, 31, -50.375507, 279.56708, -92.84426, 100, 0, 0, 0, 0),
(367801, 32, -48.92133, 284.29807, -92.84426, 100, 0, 0, 0, 0),
(367801, 33, -49.880116, 287.8062, -92.245026, 100, 0, 0, 0, 0),
(367801, 34, -50.754616, 291.34595, -91.38129, 100, 0, 0, 0, 0),
(367801, 35, -47.99677, 295.32455, -90.81825, 100, 0, 0, 0, 0),
(367801, 36, -44.49994, 299.743, -90.212395, 100, 0, 0, 0, 0),
(367801, 37, -38.468487, 306.85004, -89.96176, 100, 0, 0, 0, 0),
(367801, 38, -34.199474, 309.35944, -89.575645, 100, 0, 0, 0, 0),
(367801, 39, -27.884659, 311.9566, -89.1139, 100, 0, 0, 0, 0),
(367801, 40, -23.459465, 310.78976, -88.51482, 100, 0, 0, 0, 0),
(367801, 41, -17.556763, 308.8638, -88.62951, 100, 0, 0, 0, 0),
(367801, 42, -9.611309, 305.38797, -88.19709, 100, 0, 0, 0, 0),
(367801, 43, -3.915017, 301.293, -86.81481, 100, 0, 0, 0, 0),
(367801, 44, -0.235204, 294.51816, -85.46128, 100, 0, 0, 0, 0),
(367801, 45, 3.204272, 288.31448, -85.4905, 100, 0, 0, 0, 0),
(367801, 46, 6.725203, 282.79242, -85.65187, 100, 0, 0, 0, 0),
(367801, 47, 10.753059, 278.38467, -85.8368, 100, 0, 0, 0, 0),
(367801, 48, 16.977774, 273.39676, -86.238335, 100, 0, 0, 0, 0),
(367801, 49, 25.977861, 264.6067, -86.788, 100, 0, 0, 0, 0),
(367801, 50, 29.228964, 257.175, -87.57598, 100, 0, 0, 0, 0),
(367801, 51, 30.13821, 248.86757, -87.37655, 100, 0, 0, 0, 0),
(367801, 52, 34.11451, 244.73685, -87.19066, 100, 0, 0, 0, 0),
(367801, 53, 38.86757, 240.09755, -87.61623, 100, 0, 0, 0, 0),
(367801, 54, 43.998184, 234.17651, -88.02119, 100, 0, 0, 0, 0),
(367801, 55, 48.403416, 229.11066, -88.38168, 100, 0, 0, 0, 0),
(367801, 56, 49.750046, 222.36626, -88.75966, 100, 0, 0, 0, 0),
(367801, 57, 54.5601, 210.85043, -89.80927, 5.898, 5000, 0, 367857, 0),
(367801, 58, 67.69076, 205.52835, -92.56347, 100, 0, 0, 0, 0),
(367801, 59, 71.46944, 206.84753, -93.10892, 100, 0, 0, 0, 0),
(367801, 60, 77.15617, 209.72255, -93.07799, 100, 0, 0, 0, 0),
(367801, 61, 80.431854, 214.86958, -93.177925, 100, 0, 0, 0, 0),
(367801, 62, 83.29396, 220.0915, -93.72824, 100, 0, 0, 0, 0),
(367801, 63, 86.2444, 225.64459, -94.54216, 100, 0, 0, 0, 0),
(367801, 64, 89.99905, 229.58038, -95.01256, 100, 0, 0, 0, 0),
(367801, 65, 94.13328, 232.7041, -95.36724, 100, 0, 0, 0, 0),
(367801, 66, 99.00888, 233.9866, -95.57549, 100, 0, 0, 0, 0),
(367801, 67, 104.59536, 233.409, -95.845955, 100, 0, 0, 0, 0),
(367801, 68, 109.07845, 232.6175, -96.046, 100, 0, 0, 0, 0),
(367801, 69, 112.8708, 233.57512, -96.32111, 100, 0, 0, 0, 0),
(367801, 70, 114.51453, 235.30222, -96.1607, 100, 3600000, 0, 367870, 0);

-- Flight paths after the awakening.
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`, `path_id`) VALUES
(367802, 1, 119.04, 234.33, -94.03, 100, 0, 0, 0, 0),
(367802, 2, 123.39, 232.15, -93.81, 100, 0, 0, 0, 0),
(367802, 3, 129.24, 232.9, -94.39, 100, 0, 0, 0, 0),
(367802, 4, 133.77, 236.93, -95.39, 100, 0, 0, 0, 0),
(367802, 5, 136.03, 244.82, -95.81, 100, 0, 0, 0, 0),
(367802, 6, 134.07, 253.93, -95.11, 100, 0, 0, 0, 0),
(367802, 7, 123.16, 266.28, -93.59, 100, 0, 0, 0, 0),
(367802, 8, 113.31, 265.78, -91.45, 100, 0, 0, 0, 0),
(367802, 9, 95.87, 250.91, -87.56, 100, 0, 0, 0, 0),
(367802, 10, 87.43, 232.43, -85.76, 100, 0, 0, 0, 0),
(367802, 11, 83.19, 218.44, -84.08, 100, 0, 0, 0, 0),
(367802, 12, 70.25, 206.56, -85.14, 100, 0, 0, 0, 0),
(367802, 13, 47.18, 206.67, -83.49, 100, 0, 0, 0, 0),
(367802, 14, 34.55, 204.78, -82.05, 100, 0, 0, 0, 0),
(367802, 15, 7.09, 202.26, -77.79, 100, 0, 0, 0, 0),
(367802, 16, -42.05, 203.45, -83.77, 100, 0, 0, 0, 0),
(367802, 17, -65.46, 208.19, -83.77, 100, 0, 0, 0, 0),
(367802, 18, -84.22, 225.57, -83.77, 100, 0, 0, 367899, 0),
(367901, 1, 117.58, 245.26, -92.94, 100, 0, 0, 0, 0),
(367901, 2, 122.07, 244.78, -91.96, 100, 0, 0, 0, 0),
(367901, 3, 126.51, 244.81, -91.52, 100, 0, 0, 0, 0),
(367901, 4, 130.29, 244.11, -91.49, 100, 0, 0, 0, 0),
(367901, 5, 131.34, 246.8, -90.96, 100, 0, 0, 0, 0),
(367901, 6, 131.54, 250.71, -90.85, 100, 0, 0, 0, 0),
(367901, 7, 131.17, 254.24, -90.91, 100, 0, 0, 0, 0),
(367901, 8, 129.56, 256.88, -90.77, 100, 0, 0, 0, 0),
(367901, 9, 125.74, 260.44, -90.35, 100, 0, 0, 0, 0),
(367901, 10, 120.88, 261.46, -91.16, 100, 0, 0, 0, 0),
(367901, 11, 116.54, 261.01, -91.46, 100, 0, 0, 0, 0),
(367901, 12, 107.44, 258.65, -91.27, 100, 0, 0, 0, 0),
(367901, 13, 98.74, 250.1, -90.19, 100, 0, 0, 0, 0),
(367901, 14, 91.53, 238.34, -89.33, 100, 0, 0, 0, 0),
(367901, 15, 88.46, 228.32, -88.6, 100, 0, 0, 0, 0),
(367901, 16, 83.85, 220.02, -86.31, 100, 0, 0, 0, 0),
(367901, 17, 77.08, 211.77, -84.73, 100, 0, 0, 0, 0),
(367901, 18, 67.5, 205.84, -84.93, 100, 0, 0, 0, 0),
(367901, 19, 53.19, 205.94, -84.08, 100, 0, 0, 0, 0),
(367901, 20, 33.34, 203.23, -79.14, 100, 0, 0, 0, 0),
(367901, 21, 5.09, 198.66, -71.71, 100, 0, 0, 0, 0),
(367901, 22, -32.92, 204.27, -83.13, 100, 0, 0, 0, 0),
(367901, 23, -62.04, 206.23, -83.13, 100, 0, 0, 367999, 0);

INSERT INTO `creature_movement_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
-- Start
(367801, 10, 0,  0,      0, 0, 0,  0,  0, 0,  0,  0, 1255, 0, 0, 0, 0, 0, 0, 0, 263, 'Disciple of Naralex - Say Text'),
(367801, 10, 1,  1,      1, 0, 0,  0,  0, 0,  0,  0,    0, 0, 0, 0, 0, 0, 0, 0, 263, 'Disciple of Naralex - Emote Talk'),
-- Raptor corner: once both raptors are dead, 20 s after the arrival at the earliest, he calls to move on and walks.
(367812,  0, 0,  0,      0, 0, 0,  0,  0, 0,  0,  0, 1256, 0, 0, 0, 0, 0, 0, 0, 0, 'Disciple of Naralex - Say Text'),
(367812,  0, 1,  1,      1, 0, 0,  0,  0, 0,  0,  0,    0, 0, 0, 0, 0, 0, 0, 0, 0, 'Disciple of Naralex - Emote Talk'),
(367812,  9, 0, 10,   3636, 60000, 0,  0,  0, 0,  0,  0,    1, 367813, -1, 1, -67.44779, 214.5349, -93.42037, 3.543018, 276, 'Disciple of Naralex - Summon Deviate Ravager'),
(367812,  9, 1, 10,   3636, 60000, 0,  0,  0, 0,  0,  0,    1, 367813, -1, 1, -67.85276, 203.7873, -93.57328, 1.134464, 276, 'Disciple of Naralex - Summon Deviate Ravager'),
(367812, 20, 0, 61, 367812, 3600, 0, 0, 0, 0, 0, 4, 226, 367814, 179, 0, 0, 0, 0, 0, 276, 'Disciple of Naralex - Start Map Event Wait for Raptors'),
-- Circle: cast the cleansing, a viper or an adder comes at each of three points during it. After the cast he joins
-- the fight (EventAI 367803), the walk resumes once they are dead.
(367830,  0, 0, 59,      0, 0, 0,  0,  0, 0,  0,  0,    0, 0, 0, 0, 0, 0, 0, 0, 0, 'Disciple of Naralex - Set React State Passive'),
(367830,  0, 1, 15,   6270, 0, 0,  0,  0, 0,  0,  4,    0, 0, 0, 0, 0, 0, 0, 0, 0, 'Disciple of Naralex - Cast Spell Serpentine Cleansing'),
(367830,  0, 2,  0,      0, 0, 0,  0,  0, 0,  0,  0, 1258, 0, 0, 0, 0, 0, 0, 0, 0, 'Disciple of Naralex - Say Text'),
(367830,  0, 3, 37,      9, 0, 0,  0,  0, 0,  0,  0,    0, 0, 0, 0, 0, 0, 0, 0, 0, 'Disciple of Naralex - Set Instance Data DATA_DISCIPLE_REGEN Off'),
(367830, 21, 0, 39, 367831, 367832, 0,  0,  0, 0,  0,  0,   50, 50, 0, 0, 0, 0, 0, 0, 282, 'Disciple of Naralex - Start Script Summon Deviate Viper or Adder'),
(367830, 21, 1, 39, 367833, 367834, 0,  0,  0, 0,  0,  0,   50, 50, 0, 0, 0, 0, 0, 0, 282, 'Disciple of Naralex - Start Script Summon Deviate Viper or Adder'),
(367830, 21, 2, 39, 367835, 367836, 0,  0,  0, 0,  0,  0,   50, 50, 0, 0, 0, 0, 0, 0, 282, 'Disciple of Naralex - Start Script Summon Deviate Viper or Adder'),
(367830, 30, 0, 61, 367830, 3600, 0, 0, 0, 0, 0, 4, 226, 367830, 179, 0, 0, 0, 0, 0, 282, 'Disciple of Naralex - Start Map Event Wait for Circle Summons'),
(367830, 31, 0, 59,      2, 0, 0,  0,  0, 0,  0,  0,    0, 0, 0, 0, 0, 0, 0, 0, 282, 'Disciple of Naralex - Set React State Aggressive'),
-- Before the chamber
(367857,  0, 0,  1,     25, 0, 0,  0,  0, 0,  0,  0,    0, 0, 0, 0, 0, 0, 0, 0, 0, 'Disciple of Naralex - Emote Point'),
(367857,  0, 1,  0,      0, 0, 0,  0,  0, 0,  0,  0, 1263, 0, 0, 0, 0, 0, 0, 0, 0, 'Disciple of Naralex - Say Text'),
-- Ritual: each wave comes once the previous one is dead, not before its sniffed time.
(367870,  0, 0, 44,      2, 0, 0,  0,  0, 0,  0,  0,    0, 0, 0, 0, 0, 0, 0, 0, 0, 'Disciple of Naralex - Set Phase 2'),
(367870,  0, 1, 35,      0, 0, 0,  0, 33973, 0, 11, 16,   0, 0, 0, 0, 0, 0, 0, 0, 0, 'Disciple of Naralex - Turn to Naralex'),
(367870,  0, 2,  1,     20, 0, 0,  0,  0, 0,  0,  0,    0, 0, 0, 0, 0, 0, 0, 0, 0, 'Disciple of Naralex - Emote Beg'),
(367870,  0, 3,  0,      0, 0, 0,  0,  0, 0,  0,  0, 1264, 0, 0, 0, 0, 0, 0, 0, 0, 'Disciple of Naralex - Say Text'),
(367870,  0, 4, 37,      9, 0, 0,  0,  0, 0,  0,  0,    0, 0, 0, 0, 0, 0, 0, 0, 0, 'Disciple of Naralex - Set Instance Data DATA_DISCIPLE_REGEN Off'),
(367870,  5, 0, 15,   6271, 0, 0,  0,  0, 0,  0,  4,    0, 0, 0, 0, 0, 0, 0, 0, 284, 'Disciple of Naralex - Cast Spell Naralex''s Awakening'),
(367870,  5, 1,  0,      0, 0, 0,  0,  0, 0,  0,  0, 1265, 0, 0, 0, 0, 0, 0, 0, 284, 'Disciple of Naralex - Emote Text'),
(367870,  9, 0, 10,   5762, 60000, 0,  0,  0, 0,  0,  0,    0, 367871, -1, 1, 135.4156, 283.1097, -104.5254, 3.159046, 284, 'Disciple of Naralex - Summon Deviate Moccasin'),
(367870,  9, 1, 39, 367872, 367873, 367874, 367875, 0, 0, 0, 0, 25, 25, 25, 25, 0, 0, 0, 0, 284, 'Disciple of Naralex - Start Script Summon 2 Deviate Moccasins'),
(367870, 25, 0,  0,      0, 0, 0,  0, 33973, 0, 11, 18,  1268, 0, 0, 0, 0, 0, 0, 0, 284, 'Naralex - Emote Text'),
(367870, 47, 0, 61, 367876, 3600, 0, 0, 0, 0, 0, 4, 226, 367876, 179, 0, 0, 0, 0, 0, 284, 'Disciple of Naralex - Start Map Event Wait for Moccasins'),
-- Flight end
(367899,  7, 0, 18,      0, 43200, 0, 0, 0, 0, 0, 0,   0, 0, 0, 0, 0, 0, 0, 0, 0, 'Disciple of Naralex - Despawn'),
(367999,  5, 0, 18,      0, 43200, 0, 0, 0, 0, 0, 0,   0, 0, 0, 0, 0, 0, 0, 0, 0, 'Naralex - Despawn');

INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
-- Escort failed: the Disciple returns to his spawn. TYPE_DISCIPLE stays IN_PROGRESS, so the escort stays locked.
(367810, 0, 0, 59,      2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Disciple of Naralex - Set React State Aggressive'),
(367810, 0, 1, 44,      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Disciple of Naralex - Set Phase 0'),
(367810, 0, 2, 71,      1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Disciple of Naralex - Respawn'),
(367810, 0, 3, 37,      9, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Disciple of Naralex - Set Instance Data DATA_DISCIPLE_REGEN On'),
-- Raptors join the escort event and attack at once.
(367813, 0, 0, 63,   3678, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Escort Summon - Add Map Event Target'),
(367813, 0, 1, 26,      0, 0, 0, 0, 60, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Escort Summon - Attack Nearest Player'),
-- The circle summons too, but defensive: a busy aggressive mob pulls the passive, casting Disciple into combat by
-- proximity without giving him threat, so he evades every second and the evade interrupts the cleansing.
(367837, 0, 0, 63,   3678, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Circle Summon - Add Map Event Target'),
(367837, 0, 1, 59,      1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Circle Summon - Set React State Defensive'),
(367837, 0, 2, 26,      0, 0, 0, 0, 60, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Circle Summon - Attack Nearest Player'),
-- Raptor corner: both raptors dead, walk on. The delay lets him return to his point after the fight first, the
-- return after an evade keeps the facing of the run back.
(367814, 2, 0, 35,      1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.742133, 276, 'Disciple of Naralex - Turn to the Raptor Passage'),
(367814, 2, 1,  1,     25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 276, 'Disciple of Naralex - Emote Point'),
(367814, 2, 2,  0,      0, 0, 0, 0, 0, 0, 0, 0, 1257, 0, 0, 0, 0, 0, 0, 0, 276, 'Disciple of Naralex - Say Text'),
(367814, 5, 0, 60,      3, 12, 0, 0, 0, 0, 0, 0, 0, 367801, 0, 0, 0, 0, 0, 0, 276, 'Disciple of Naralex - Start Waypoints'),
-- Circle: purified, walk on
(367830, 0, 0, 37,      9, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Disciple of Naralex - Set Instance Data DATA_DISCIPLE_REGEN On'),
(367830, 3, 0,  1,      1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 282, 'Disciple of Naralex - Emote Talk'),
(367830, 3, 1,  0,      0, 0, 0, 0, 0, 0, 0, 0, 1259, 0, 0, 0, 0, 0, 0, 0, 282, 'Disciple of Naralex - Say Text'),
(367830, 7, 0, 60,      3, 30, 0, 0, 0, 0, 0, 0, 0, 367801, 0, 0, 0, 0, 0, 0, 282, 'Disciple of Naralex - Start Waypoints'),
-- Circle summons, one script per point and entry.
(367831, 0, 0, 10,   5755, 60000, 0, 0, 0, 0, 0, 0, 0, 367837, -1, 1, -60.25389, 273.0981, -92.76082, 0.4014257, 0, 'Disciple of Naralex - Summon Deviate Viper'),
(367832, 0, 0, 10,   5048, 60000, 0, 0, 0, 0, 0, 0, 0, 367837, -1, 1, -60.25389, 273.0981, -92.76082, 0.4014257, 0, 'Disciple of Naralex - Summon Deviate Adder'),
(367833, 0, 0, 10,   5755, 60000, 0, 0, 0, 0, 0, 0, 0, 367837, -1, 1, -50.12378, 274.7166, -92.76082, 3.036873, 0, 'Disciple of Naralex - Summon Deviate Viper'),
(367834, 0, 0, 10,   5048, 60000, 0, 0, 0, 0, 0, 0, 0, 367837, -1, 1, -50.12378, 274.7166, -92.76082, 3.036873, 0, 'Disciple of Naralex - Summon Deviate Adder'),
(367835, 0, 0, 10,   5755, 60000, 0, 0, 0, 0, 0, 0, 0, 367837, -1, 1, -57.5453, 280.2069, -92.76082, 5.078908, 0, 'Disciple of Naralex - Summon Deviate Viper'),
(367836, 0, 0, 10,   5048, 60000, 0, 0, 0, 0, 0, 0, 0, 367837, -1, 1, -57.5453, 280.2069, -92.76082, 5.078908, 0, 'Disciple of Naralex - Summon Deviate Adder'),
-- Ritual summons join the escort event and walk to Naralex.
(367871, 0, 0, 63,   3678, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ritual Summon - Add Map Event Target'),
(367871, 0, 1,  3,      3, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 114.0, 245.0, -96.04, 5, 0, 'Ritual Summon - Move to Naralex'),
(367872, 0, 0, 10,   5762, 60000, 0, 0, 0, 0, 0, 0, 0, 367871, -1, 1, 171.3954, 213.7661, -105.5075, 5.044002, 0, 'Disciple of Naralex - Summon Deviate Moccasin'),
(367872, 0, 1, 10,   5762, 60000, 0, 0, 0, 0, 0, 0, 0, 367871, -1, 1, 171.6904, 213.2338, -105.4198, 1.623156, 0, 'Disciple of Naralex - Summon Deviate Moccasin'),
(367873, 0, 0, 10,   5762, 60000, 0, 0, 0, 0, 0, 0, 0, 367871, -1, 1, 178.669, 262.253, -106.153, 1.32645, 0, 'Disciple of Naralex - Summon Deviate Moccasin'),
(367873, 0, 1, 10,   5762, 60000, 0, 0, 0, 0, 0, 0, 0, 367871, -1, 1, 121.4, 166.317, -105.541, 1.97222, 0, 'Disciple of Naralex - Summon Deviate Moccasin'),
(367874, 0, 0, 10,   5762, 60000, 0, 0, 0, 0, 0, 0, 0, 367871, -1, 1, 171.3954, 213.7661, -105.5075, 5.044002, 0, 'Disciple of Naralex - Summon Deviate Moccasin'),
(367874, 0, 1, 10,   5762, 60000, 0, 0, 0, 0, 0, 0, 0, 367871, -1, 1, 178.669, 262.253, -106.153, 1.32645, 0, 'Disciple of Naralex - Summon Deviate Moccasin'),
(367875, 0, 0, 10,   5762, 60000, 0, 0, 0, 0, 0, 0, 0, 367871, -1, 1, 171.6904, 213.2338, -105.4198, 1.623156, 0, 'Disciple of Naralex - Summon Deviate Moccasin'),
(367875, 0, 1, 10,   5762, 60000, 0, 0, 0, 0, 0, 0, 0, 367871, -1, 1, 121.4, 166.317, -105.541, 1.97222, 0, 'Disciple of Naralex - Summon Deviate Moccasin'),
-- Moccasins dead: ectoplasms, then Mutanus once they are dead
(367876,  0, 0, 10,  5763, 60000, 0, 0, 0, 0, 0, 0, 0, 367871, -1, 1, 82.06503, 280.3772, -103.2967, 5.061455, 284, 'Disciple of Naralex - Summon Nightmare Ectoplasm'),
(367876,  0, 1, 10,  5763, 60000, 0, 0, 0, 0, 0, 0, 0, 367871, -1, 1, 96.77884, 283.7623, -104.7861, 3.822271, 284, 'Disciple of Naralex - Summon Nightmare Ectoplasm'),
(367876,  0, 2, 10,  5763, 60000, 0, 0, 0, 0, 0, 0, 0, 367871, -1, 1, 162.067, 218.7149, -105.3624, 1.989675, 284, 'Disciple of Naralex - Summon Nightmare Ectoplasm'),
(367876,  0, 3, 10,  5763, 60000, 0, 0, 0, 0, 0, 0, 0, 367871, -1, 1, 164.6273, 274.1234, -107.2978, 4.660029, 284, 'Disciple of Naralex - Summon Nightmare Ectoplasm'),
(367876,  0, 4, 10,  5763, 60000, 0, 0, 0, 0, 0, 0, 0, 367871, -1, 1, 145.3536, 219.346, -102.9857, 5.742133, 284, 'Disciple of Naralex - Summon Nightmare Ectoplasm'),
(367876,  0, 5, 39, 367878, 367879, 367880, 367881, 0, 0, 0, 0, 25, 25, 25, 25, 0, 0, 0, 0, 284, 'Disciple of Naralex - Start Script Summon 2 Nightmare Ectoplasms'),
(367876, 18, 0,  0,     0, 0, 0, 0, 33973, 0, 11, 18, 1269, 0, 0, 0, 0, 0, 0, 0, 284, 'Naralex - Emote Text'),
(367876, 46, 0, 61, 367882, 3600, 0, 0, 0, 0, 0, 4, 226, 367882, 179, 0, 0, 0, 0, 0, 284, 'Disciple of Naralex - Start Map Event Wait for Ectoplasms'),
(367878, 0, 0, 10,   5763, 60000, 0, 0, 0, 0, 0, 0, 0, 367871, -1, 1, 126.322, 282.2483, -103.7972, 0.9424778, 0, 'Disciple of Naralex - Summon Nightmare Ectoplasm'),
(367878, 0, 1, 10,   5763, 60000, 0, 0, 0, 0, 0, 0, 0, 367871, -1, 1, 155.8446, 186.6882, -107.0841, 0.05235988, 0, 'Disciple of Naralex - Summon Nightmare Ectoplasm'),
(367879, 0, 0, 10,   5763, 60000, 0, 0, 0, 0, 0, 0, 0, 367871, -1, 1, 144.843, 278.079, -104.574, 4.43314, 0, 'Disciple of Naralex - Summon Nightmare Ectoplasm'),
(367879, 0, 1, 10,   5763, 60000, 0, 0, 0, 0, 0, 0, 0, 367871, -1, 1, 115.555, 168.228, -105.687, 2.30383, 0, 'Disciple of Naralex - Summon Nightmare Ectoplasm'),
(367880, 0, 0, 10,   5763, 60000, 0, 0, 0, 0, 0, 0, 0, 367871, -1, 1, 126.322, 282.2483, -103.7972, 0.9424778, 0, 'Disciple of Naralex - Summon Nightmare Ectoplasm'),
(367880, 0, 1, 10,   5763, 60000, 0, 0, 0, 0, 0, 0, 0, 367871, -1, 1, 144.843, 278.079, -104.574, 4.43314, 0, 'Disciple of Naralex - Summon Nightmare Ectoplasm'),
(367881, 0, 0, 10,   5763, 60000, 0, 0, 0, 0, 0, 0, 0, 367871, -1, 1, 155.8446, 186.6882, -107.0841, 0.05235988, 0, 'Disciple of Naralex - Summon Nightmare Ectoplasm'),
(367881, 0, 1, 10,   5763, 60000, 0, 0, 0, 0, 0, 0, 0, 367871, -1, 1, 115.555, 168.228, -105.687, 2.30383, 0, 'Disciple of Naralex - Summon Nightmare Ectoplasm'),
-- Ectoplasms dead: Mutanus. The Deviate Nightmares are only visible to the victim of Naralex's Nightmare.
(367882, 0, 0, 10,   3654, 120000, 0, 0, 0, 0, 0, 0, 0, 367883, -1, 1, 150.9428, 262.7971, -103.9035, 3.700098, 284, 'Disciple of Naralex - Summon Mutanus the Devourer'),
(367882, 1, 0,  0,      0, 0, 0, 0, 33973, 0, 11, 18, 1270, 0, 0, 0, 0, 0, 0, 0, 284, 'Naralex - Emote Text'),
-- The Disciple announces Mutanus
(367882, 2, 0,  0,      0, 0, 0, 0, 3654, 100, 10, 16, 1276, 0, 0, 0, 0, 0, 0, 0, 284, 'Disciple of Naralex - Say Text'),
(367882, 4, 0, 10, 5914, 300000, 0, 0, 0, 0, 0, 0, 16, 0, -1, 3, 120.491, 236.7059, -96.04674, 2.146755, 284, 'Disciple of Naralex - Summon Deviate Nightmare'),
(367882, 4, 1, 10, 5914, 300000, 0, 0, 0, 0, 0, 0, 16, 0, -1, 3, 120.0298, 240.3299, -96.01394, 0, 284, 'Disciple of Naralex - Summon Deviate Nightmare'),
(367882, 4, 2, 10, 5914, 300000, 0, 0, 0, 0, 0, 0, 16, 0, -1, 3, 121.5133, 243.0381, -96.26256, 0, 284, 'Disciple of Naralex - Summon Deviate Nightmare'),
(367882, 4, 3, 10, 5914, 300000, 0, 0, 0, 0, 0, 0, 16, 0, -1, 3, 111.2849, 242.5205, -95.99054, 0.6632251, 284, 'Disciple of Naralex - Summon Deviate Nightmare'),
(367882, 4, 4, 10, 5914, 300000, 0, 0, 0, 0, 0, 0, 16, 0, -1, 3, 113.6594, 243.3889, -95.95571, 0, 284, 'Disciple of Naralex - Summon Deviate Nightmare'),
(367882, 4, 5, 10, 5914, 300000, 0, 0, 0, 0, 0, 0, 16, 0, -1, 3, 116.6927, 245.7185, -95.94956, 0, 284, 'Disciple of Naralex - Summon Deviate Nightmare'),
(367882, 4, 6, 10, 5914, 300000, 0, 0, 0, 0, 0, 0, 16, 0, -1, 3, 113.2634, 236.2792, -96.05521, 0.6457718, 284, 'Disciple of Naralex - Summon Deviate Nightmare'),
(367882, 4, 7, 10, 5914, 300000, 0, 0, 0, 0, 0, 0, 16, 0, -1, 3, 115.6905, 237.4476, -95.93106, 0, 284, 'Disciple of Naralex - Summon Deviate Nightmare'),
(367882, 4, 8, 10, 5914, 300000, 0, 0, 0, 0, 0, 0, 16, 0, -1, 3, 117.5112, 234.9248, -95.89722, 0, 284, 'Disciple of Naralex - Summon Deviate Nightmare'),
(367882, 4, 9, 10, 5914, 300000, 0, 0, 0, 0, 0, 0, 16, 0, -1, 3, 111.2958, 238.5014, -96.06232, 5.585053, 284, 'Disciple of Naralex - Summon Deviate Nightmare'),
(367882, 4, 10, 10, 5914, 300000, 0, 0, 0, 0, 0, 0, 16, 0, -1, 3, 112.2958, 239.5014, -96.06232, 0, 284, 'Disciple of Naralex - Summon Deviate Nightmare'),
(367882, 4, 11, 10, 5914, 300000, 0, 0, 0, 0, 0, 0, 16, 0, -1, 3, 111.4521, 241.2982, -95.99904, 0, 284, 'Disciple of Naralex - Summon Deviate Nightmare'),
(367882, 4, 12, 10, 5914, 300000, 0, 0, 0, 0, 0, 0, 16, 0, -1, 3, 115.6937, 242.1711, -95.93398, 4.904375, 284, 'Disciple of Naralex - Summon Deviate Nightmare'),
(367882, 4, 13, 10, 5914, 300000, 0, 0, 0, 0, 0, 0, 16, 0, -1, 3, 117.1837, 244.0796, -95.90878, 4.014257, 284, 'Disciple of Naralex - Summon Deviate Nightmare'),
(367882, 4, 14, 10, 5914, 300000, 0, 0, 0, 0, 0, 0, 16, 0, -1, 3, 112.0937, 245.3247, -95.98057, 0.5759587, 284, 'Disciple of Naralex - Summon Deviate Nightmare'),
(367883, 0, 0, 63,   3678, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mutanus the Devourer - Add Map Event Target'),
(367883, 0, 1,  3,      0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 115.75, 247.92, -96.20, 0, 0, 'Mutanus the Devourer - Move to Naralex'),
(367884, 0, 0, 18,      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deviate Nightmare - Despawn'),
-- Mutanus dead (source = Disciple): Naralex awakes, both leave as owls.
(367890,  0, 0, 62,   3678, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Disciple of Naralex - End Map Event Escort'),
(367890,  0, 1, 37,      4, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Disciple of Naralex - Set Instance Data TYPE_DISCIPLE DONE'),
(367890,  0, 3, 37,      9, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Disciple of Naralex - Set Instance Data DATA_DISCIPLE_REGEN On'),
(367890,  0, 2, 68, 367884, 2, 5914, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Disciple of Naralex - Start Script Despawn for Deviate Nightmares'),
(367890,  3, 0,  1,     15, 0, 0, 0, 33973, 0, 11, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Naralex - Emote Roar'),
(367890,  3, 1, 28,      0, 0, 0, 0, 33973, 0, 11, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Naralex - Stand Up'),
(367890,  3, 2,  0,      0, 0, 0, 0, 33973, 0, 11, 18, 1271, 0, 0, 0, 0, 0, 0, 0, 0, 'Naralex - Yell Text'),
(367890,  5, 0, 14,   6271, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Disciple of Naralex - Remove Aura Naralex''s Awakening'),
(367890,  5, 1,  1,     25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Disciple of Naralex - Emote Point'),
(367890,  5, 2,  0,      0, 0, 0, 0, 0, 0, 0, 0, 1267, 0, 0, 0, 0, 0, 0, 0, 0, 'Disciple of Naralex - Say Text'),
(367890,  9, 0,  1,      2, 0, 0, 0, 33973, 0, 11, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Naralex - Emote Bow'),
(367890,  9, 1,  0,      0, 0, 0, 0, 33973, 0, 11, 18, 1272, 0, 0, 0, 0, 0, 0, 0, 0, 'Naralex - Say Text'),
(367890, 15, 0,  1,      1, 0, 0, 0, 33973, 0, 11, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Naralex - Emote Talk'),
(367890, 15, 1,  0,      0, 0, 0, 0, 33973, 0, 11, 18, 2103, 0, 0, 0, 0, 0, 0, 0, 0, 'Naralex - Say Text'),
(367890, 19, 0, 15,   8153, 0, 0, 0, 33973, 0, 11, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Naralex - Cast Spell Owl Form'),
(367890, 19, 1, 15,   8153, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Disciple of Naralex - Cast Spell Owl Form'),
(367890, 19, 2, 22,      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Disciple of Naralex - Restore Faction'),
(367890, 27, 0, 77,      1, 0, 0, 0, 33973, 0, 11, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Naralex - Set Fly'),
(367890, 27, 1, 25,      1, 0, 0, 0, 33973, 0, 11, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Naralex - Set Run'),
(367890, 27, 2, 60,      3, 0, 0, 0, 33973, 0, 11, 18, 0, 367901, 0, 0, 0, 0, 0, 0, 0, 'Naralex - Start Waypoints Flight'),
(367890, 27, 3, 77,      1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Disciple of Naralex - Set Fly'),
(367890, 27, 4, 25,      1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Disciple of Naralex - Set Run'),
(367890, 27, 5, 60,      3, 0, 0, 0, 0, 0, 0, 0, 0, 367802, 0, 0, 0, 0, 0, 0, 0, 'Disciple of Naralex - Start Waypoints Flight');

-- Disciple in combat
DELETE FROM `creature_ai_events` WHERE `creature_id`=3678;
DELETE FROM `creature_ai_scripts` WHERE `id` BETWEEN 367801 AND 367899;
INSERT INTO `creature_spells` (`entry`, `name`,
    `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`) VALUES
(36780, 'Wailing Caverns - Disciple of Naralex',
    1090, 100, 5, 0, 0, 0, 5, 5, 30, 30, 0); -- Sleep

INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(367801, 0, 0,  0,    0, 0, 0, 0, 0, 0, 0, 0, 1273, 0, 0, 0, 0, 0, 0, 0, 0, 'Disciple of Naralex - Say Text'),
(367802, 0, 0, 15, 8141, 0, 0, 0, 0, 0, 0, 4,    0, 0, 0, 0, 0, 0, 0, 0, 0, 'Disciple of Naralex - Cast Spell Druid''s Potion'),
(367803, 0, 0, 44,    1, 0, 0, 0,  0, 0,  0, 0,  0, 0, 0, 0, 0, 0, 0, 0, 0, 'Disciple of Naralex - Set Phase 1'),
(367803, 0, 1, 72,    0, 0, 0, 0, 30, 0, 25, 0,  0, 0, 0, 0, 0, 0, 0, 0, 0, 'Disciple of Naralex - Assist Nearest Player'),
(367803, 0, 2, 44,    0, 0, 0, 0,  0, 0,  0, 0,  0, 0, 0, 0, 0, 0, 0, 0, 0, 'Disciple of Naralex - Set Phase 0'),
(367804, 0, 0, 35,    0, 0, 0, 0, 33973, 0, 11, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Disciple of Naralex - Turn to Naralex'),
(367805, 0, 0,  0,    0, 0, 0, 0,  0, 0,  0, 0, 1274, 0, 0, 0, 0, 0, 0, 0, 0, 'Disciple of Naralex - Say Text');

-- The circle summons are defensive and never pull him, so after the cleansing he joins the fight himself. The aggro
-- text is a call for help when he is attacked: phase 1 suppresses it while he joins, phase 2 (ritual) has its own.
-- At the ritual he is attackable and stunned by Naralex's Awakening, so he does not fight back. After an evade he
-- faces Naralex again.
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(367801, 3678,   0, 4, 6, 100, 0,    0,    0,     0,     0, 367801, 0, 0, 'Disciple of Naralex - Say on Aggro'),
(367802, 3678,   0, 2, 0, 100, 9,   80,    0, 45000, 45000, 367802, 0, 0, 'Disciple of Naralex - Cast Druid''s Potion at 80% HP'),
(367803, 3678, 282, 1, 0, 100, 5, 1000, 1000,  2000,  2000, 367803, 0, 0, 'Disciple of Naralex - Assist Nearest Player at the Circle'),
(367804, 3678, 284, 7, 0, 100, 0,    0,    0,     0,     0, 367804, 0, 0, 'Disciple of Naralex - Turn to Naralex on Evade during the Ritual'),
(367805, 3678,   0, 4, 3, 100, 0,    0,    0,     0,     0, 367805, 0, 0, 'Disciple of Naralex - Say on Aggro during the Ritual');

-- Mutanus the Devourer
DELETE FROM `creature_spells` WHERE `entry`=36540;
DELETE FROM `creature_ai_events` WHERE `creature_id`=3654;
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1720974, 1720975, 1720976);

INSERT INTO `creature_spells` (`entry`, `name`,
    `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`,
    `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`,
    `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`) VALUES
(36540, 'Wailing Caverns - Mutanus the Devourer',
    7967, 100, 1, 0, 0, 32,  8, 12, 18, 25, 0,  -- Naralex's Nightmare
    7399, 100, 5, 0, 0,  0, 10, 15, 12, 18, 0,  -- Terrify
    8150, 100, 0, 0, 0,  0,  0, 10, 10, 16, 0); -- Thundercrack
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(365401, 0, 0, 37,      5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mutanus the Devourer - Set Instance Data IN_PROGRESS'),
(365402, 0, 0, 37,      5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mutanus the Devourer - Set Instance Data NOT_STARTED'),
(365403, 0, 0, 37,      5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mutanus the Devourer - Set Instance Data DONE'),
(365403, 0, 1, 39, 367890, 0, 0, 0, 18675, 0, 11, 18, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Mutanus the Devourer - Start Script Awakening for Disciple of Naralex');

INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(365401, 3654, 0, 4, 0, 100, 0, 0, 0, 0, 0, 365401, 0, 0, 'Mutanus the Devourer - Set Instance Data on Aggro'),
(365402, 3654, 0, 7, 0, 100, 0, 0, 0, 0, 0, 365402, 0, 0, 'Mutanus the Devourer - Set Instance Data on Evade'),
(365403, 3654, 0, 6, 0, 100, 0, 0, 0, 0, 0, 365403, 0, 0, 'Mutanus the Devourer - Awakening on Death');

-- --------------------------------------------------------------------------------------------------
-- Trash: Druid of the Fang (3840)
-- --------------------------------------------------------------------------------------------------

-- Channellers stand and channel Nature Channeling (13236) from an OOC timer (a creature_addon aura shows no channel
-- animation). Includes the three druids on the Lady Anacondra points.
UPDATE `creature_addon` SET `stand_state`=0, `auras`=NULL WHERE `guid` IN (27376, 33933, 33966, 38113, 38115, 38119, 38124, 38136, 38139, 38146, 85948, 86112);
UPDATE `creature` SET `movement_type`=0, `wander_distance`=0 WHERE `guid`=85948;

UPDATE `creature` SET `movement_type`=1, `wander_distance`=6 WHERE `guid` IN (27385, 49414, 86137, 87100);
UPDATE `creature` SET `movement_type`=1, `wander_distance`=7 WHERE `guid` IN (33957, 87121);
UPDATE `creature` SET `movement_type`=1, `wander_distance`=8 WHERE `guid` IN (33956, 45722, 87150);
UPDATE `creature` SET `movement_type`=1, `wander_distance`=9 WHERE `guid` IN (18682, 27388, 87153);
UPDATE `creature` SET `movement_type`=1, `wander_distance`=10 WHERE `guid` IN (27384, 33946, 86004, 87116, 87122);
UPDATE `creature` SET `movement_type`=1, `wander_distance`=11 WHERE `guid` IN (33932, 33987, 85919, 86104);
UPDATE `creature` SET `movement_type`=1, `wander_distance`=12 WHERE `guid`=85965;

-- Patrols. A path walked there and back lists the way back too.
UPDATE `creature` SET `position_x`=-62.03616, `position_y`=123.5702, `position_z`=-89.45967 WHERE `guid`=26225;
UPDATE `creature` SET `position_x`=-181.4129, `position_y`=-208.0663, `position_z`=-58.34121, `movement_type`=2, `wander_distance`=0 WHERE `guid`=86013;
UPDATE `creature` SET `movement_type`=2 WHERE `guid`=33936;
-- Patrols do not join the units at their spawn or along their path (the group assist has no range limit).
-- The ravager and guardian at 26225's spawn still pull together.
DELETE FROM `creature_groups` WHERE `leader_guid` IN (26225, 33936, 33964);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES
(26218, 26221, 0, 0, 2);

DELETE FROM `creature_movement` WHERE `id`=26225;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(26225, 1, -62.03616, 123.5702, -89.45967, 100, 0, 0, 0),
(26225, 2, -51.3609, 136.0088, -90.91251, 100, 0, 0, 0),
(26225, 3, -39.46706, 151.3278, -94.15775, 100, 0, 0, 0),
(26225, 4, -35.44977, 166.3203, -96.08216, 100, 0, 0, 0),
(26225, 5, -38.35035, 191.7972, -96.48946, 100, 0, 0, 0),
(26225, 6, -35.27338, 216.1235, -96.0966, 100, 0, 0, 0),
(26225, 7, -30.54108, 237.4879, -93.67865, 100, 0, 0, 0),
(26225, 8, -35.92926, 257.9203, -93.14893, 100, 0, 0, 0),
(26225, 9, -30.54108, 237.4879, -93.67865, 100, 0, 0, 0),
(26225, 10, -35.27338, 216.1235, -96.0966, 100, 0, 0, 0),
(26225, 11, -38.35035, 191.7972, -96.48946, 100, 0, 0, 0),
(26225, 12, -35.44977, 166.3203, -96.08216, 100, 0, 0, 0),
(26225, 13, -39.46706, 151.3278, -94.15775, 100, 0, 0, 0),
(26225, 14, -51.3609, 136.0088, -90.91251, 100, 0, 0, 0);

DELETE FROM `creature_movement` WHERE `id`=26239;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(26239, 1, -56.3975, 265.139, -92.8434, 100, 0, 0, 0),
(26239, 2, -62.6119, 267.854, -92.8434, 100, 0, 0, 0),
(26239, 3, -66.2731, 274.048, -92.8434, 100, 0, 0, 0),
(26239, 4, -65.887, 278.532, -92.5521, 100, 0, 0, 0),
(26239, 5, -62.0234, 283.8, -91.974, 100, 0, 0, 0),
(26239, 6, -56.3948, 286.851, -91.9572, 100, 0, 0, 0),
(26239, 7, -48.7796, 283.578, -92.8443, 100, 0, 0, 0),
(26239, 8, -44.9437, 278.699, -92.6976, 100, 0, 0, 0),
(26239, 9, -42.87, 272.868, -92.6368, 100, 0, 0, 0),
(26239, 10, -44.9356, 268.481, -92.8257, 100, 0, 0, 0),
(26239, 11, -50.2492, 264.342, -92.8442, 100, 0, 0, 0);

DELETE FROM `creature_movement` WHERE `id`=27357;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(27357, 1, 49.4473, 218.755, -88.6672, 100, 0, 0, 0),
(27357, 2, 48.178, 232.093, -88.5543, 100, 0, 0, 0),
(27357, 3, 49.4085, 218.762, -88.6588, 100, 0, 0, 0),
(27357, 4, 43.1834, 206.45, -88.2157, 100, 0, 0, 0),
(27357, 5, 25.8099, 200.155, -86.0444, 100, 0, 0, 0),
(27357, 6, 13.8656, 193.124, -84.9796, 100, 0, 0, 0),
(27357, 7, 9.89033, 184.731, -85.4648, 100, 0, 0, 0),
(27357, 8, 10.3683, 175.054, -86.6094, 100, 0, 0, 0),
(27357, 9, 7.91235, 167.02, -86.6623, 100, 0, 0, 0),
(27357, 10, 1.81814, 153.567, -88.56, 100, 0, 0, 0),
(27357, 11, -15.7426, 119.127, -89.8857, 100, 0, 0, 0),
(27357, 12, -25.4447, 101.016, -89.8553, 100, 0, 0, 0),
(27357, 13, -28.177, 82.8804, -91.1606, 100, 0, 0, 0),
(27357, 14, -37.892, 68.0999, -88.5432, 100, 0, 0, 0),
(27357, 15, -27.7804, 83.4066, -91.2526, 100, 0, 0, 0),
(27357, 16, -25.3866, 101.015, -89.871, 100, 0, 0, 0),
(27357, 17, -6.3389, 137.829, -88.4654, 100, 0, 0, 0),
(27357, 18, 7.90365, 167.725, -86.6462, 100, 0, 0, 0),
(27357, 19, 10.7275, 177.886, -86.4483, 100, 0, 0, 0),
(27357, 20, 9.73913, 186.363, -85.4123, 100, 0, 0, 0),
(27357, 21, 12.2051, 191.933, -84.7278, 100, 0, 0, 0),
(27357, 22, 26.7711, 200.425, -86.1275, 100, 0, 0, 0),
(27357, 23, 40.3936, 204.973, -87.9399, 100, 0, 0, 0),
(27357, 24, 46.2976, 209.539, -88.3763, 100, 0, 0, 0);

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(33936, 1, -114.59, 444.97, -72.7, 100, 0, 0, 0),
(33936, 2, -117.61, 430.26, -72.73, 100, 0, 0, 0),
(33936, 3, -117.66, 417.01, -72.93, 100, 0, 0, 0),
(33936, 4, -130.24, 411.72, -72.7, 100, 0, 0, 0),
(33936, 5, -153.88, 415.06, -72.7, 100, 0, 0, 0),
(33936, 6, -130.24, 411.72, -72.7, 100, 0, 0, 0),
(33936, 7, -117.66, 417.01, -72.93, 100, 0, 0, 0),
(33936, 8, -117.61, 430.26, -72.73, 100, 0, 0, 0),
(33936, 9, -114.59, 444.97, -72.7, 100, 0, 0, 0),
(33936, 10, -102.84, 452.38, -72.33, 100, 0, 0, 0),
(33936, 11, -95.82, 458.72, -71.46, 100, 0, 0, 0),
(33936, 12, -86.69, 462.63, -69.58, 100, 0, 0, 0),
(33936, 13, -84.82, 470.87, -68.19, 100, 0, 0, 0),
(33936, 14, -66.88, 481.2, -60.94, 100, 0, 0, 0),
(33936, 15, -52.91, 484.09, -57.24, 100, 0, 0, 0),
(33936, 16, -25.16, 491.45, -53.95, 100, 0, 0, 0),
(33936, 17, -52.91, 484.09, -57.24, 100, 0, 0, 0),
(33936, 18, -66.88, 481.2, -60.94, 100, 0, 0, 0),
(33936, 19, -84.82, 470.87, -68.19, 100, 0, 0, 0),
(33936, 20, -86.69, 462.63, -69.58, 100, 0, 0, 0),
(33936, 21, -95.82, 458.72, -71.46, 100, 0, 0, 0),
(33936, 22, -102.84, 452.38, -72.33, 100, 0, 0, 0);

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(86013, 1, -181.4129, -208.0663, -58.34121, 100, 0, 0, 0),
(86013, 2, -195.4395, -191.4938, -63.45575, 100, 0, 0, 0),
(86013, 3, -213.39, -196.81, -61.83, 100, 0, 0, 0),
(86013, 4, -231.31, -187.85, -62.54, 100, 0, 0, 0),
(86013, 5, -236.29, -169.43, -63.17, 100, 0, 0, 0),
(86013, 6, -249.61, -159.76, -63.2, 100, 0, 0, 0),
(86013, 7, -262.5262, -178.5473, -61.00742, 100, 0, 0, 0),
(86013, 8, -278.31, -175.1, -61.39, 100, 0, 0, 0),
(86013, 9, -292.48, -163.79, -62.15, 100, 0, 0, 0),
(86013, 10, -328.5808, -133.2269, -62.32197, 100, 0, 0, 0),
(86013, 11, -337.6964, -109.5679, -64.27342, 100, 0, 0, 0),
(86013, 12, -324.3173, -81.9511, -65.43892, 100, 0, 0, 0),
(86013, 13, -318.6068, -42.06964, -64.0047, 100, 0, 0, 0),
(86013, 14, -295.8259, -16.15895, -59.92006, 100, 0, 0, 0),
(86013, 15, -318.6068, -42.06964, -64.0047, 100, 0, 0, 0),
(86013, 16, -324.3173, -81.9511, -65.43892, 100, 0, 0, 0),
(86013, 17, -337.6964, -109.5679, -64.27342, 100, 0, 0, 0),
(86013, 18, -328.5808, -133.2269, -62.32197, 100, 0, 0, 0),
(86013, 19, -292.48, -163.79, -62.15, 100, 0, 0, 0),
(86013, 20, -278.31, -175.1, -61.39, 100, 0, 0, 0),
(86013, 21, -262.5262, -178.5473, -61.00742, 100, 0, 0, 0),
(86013, 22, -249.61, -159.76, -63.2, 100, 0, 0, 0),
(86013, 23, -236.29, -169.43, -63.17, 100, 0, 0, 0),
(86013, 24, -231.31, -187.85, -62.54, 100, 0, 0, 0),
(86013, 25, -213.39, -196.81, -61.83, 100, 0, 0, 0),
(86013, 26, -195.4395, -191.4938, -63.45575, 100, 0, 0, 0);

INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
(288, 52, 18687, 26252, 27350, 301002, 0), -- DB guid: Lady Anacondra points
(303, 52, 27376, 33933, 33966, 38113, 0),  -- DB guid: Druid of the Fang channellers
(304, 52, 38115, 38119, 38124, 38136, 0),  -- DB guid: Druid of the Fang channellers
(305, 52, 38139, 38146, 85948, 86112, 0),  -- DB guid: Druid of the Fang channellers
(310, -2, 288, 303, 304, 305, 0),          -- Nature Channeling spawns
(314, 52, 27369, 27371, 33976, 45718, 0),  -- DB guid: Druid of the Fang facing pairs
(317, 52, 38143, 38144, 85958, 85959, 0),  -- DB guid: Druid of the Fang facing pairs
(318, 52, 86107, 86108, 86109, 86136, 0),  -- DB guid: Druid of the Fang facing pairs
(322, 52, 87126, 87142, 87139, 87141, 0),  -- DB guid: Druid of the Fang facing pairs
(323, -2, 314, 317, 318, 322, 0);          -- Talking spawns

DELETE FROM `creature_spells` WHERE `entry`=38400;
DELETE FROM `creature_ai_events` WHERE `creature_id`=3840;
DELETE FROM `creature_ai_scripts` WHERE `id` BETWEEN 384001 AND 384099;

INSERT INTO `creature_spells` (`entry`, `name`,
    `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`,
    `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`,
    `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`,
    `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`) VALUES
(38400, 'Wailing Caverns - Druid of the Fang',
    8041, 100,  0, 0, 0,  0, 10, 20, 30, 35, 0,  -- Serpent Form
    5187, 100, 17, 0, 0,  0,  0,  0, 12, 18, 0,  -- Healing Touch: friendly below 50% hp within spell range
    8040, 100,  4, 0, 0, 32,  6, 17, 10, 20, 0,  -- Druid's Slumber
    9532,  90,  1, 0, 0,  8,  0,  0,  2,  2, 0); -- Lightning Bolt

INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(384001, 0, 0, 47,     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Druid of the Fang - Flee'),
(384002, 0, 0, 15, 13236, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Druid of the Fang - Cast Spell Nature Channeling'),
(384003, 0, 0,  1,     1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Druid of the Fang - Emote Talk');

INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(384001, 3840,   0, 2, 0,  80, 4,    15,     0,     0,     0, 384001, 0, 0, 'Druid of the Fang - Flee at 15% HP'),
(384002, 3840, 310, 1, 0, 100, 0,  1000,  1000,     0,     0, 384002, 0, 0, 'Druid of the Fang - Cast Nature Channeling OOC (Channellers)'),
(384003, 3840, 323, 1, 0, 100, 1, 12000, 39000, 12000, 39000, 384003, 0, 0, 'Druid of the Fang - Emote Talk OOC (Facing Pairs)');

-- --------------------------------------------------------------------------------------------------
-- Trash: Deviate Ravager (3636), Deviate Guardian (3637)
-- --------------------------------------------------------------------------------------------------

-- Ravagers and Guardians share their spawn points, except two fixed of each.
UPDATE `creature` SET `id`=3636, `id2`=3637 WHERE `guid` IN (18688, 18689, 26198, 26199, 26202, 26204, 26216, 26220, 26223, 26224, 26227, 26230, 26256, 26259, 27346, 27353, 27354, 27355, 27356, 27359, 27360, 27361, 27362, 27364, 27367, 33969);

UPDATE `creature` SET `wander_distance`=3 WHERE `guid`=33971;
UPDATE `creature` SET `wander_distance`=4 WHERE `guid`=27361;
UPDATE `creature` SET `wander_distance`=5 WHERE `guid`=26218;
UPDATE `creature` SET `wander_distance`=7 WHERE `guid` IN (26221, 26223);
UPDATE `creature` SET `wander_distance`=8 WHERE `guid` IN (26204, 26220, 27364);
UPDATE `creature` SET `wander_distance`=9 WHERE `guid` IN (26202, 26259);
UPDATE `creature` SET `wander_distance`=11 WHERE `guid`=27362;

-- Thrash is the passive proc aura, not a timed cast.
UPDATE `creature_template` SET `auras`='3417', `spell_list_id`=0 WHERE `entry`=3636;
DELETE FROM `creature_spells` WHERE `entry`=36360;

DELETE FROM `creature_ai_events` WHERE `creature_id`=3637;
DELETE FROM `creature_ai_scripts` WHERE `id` BETWEEN 363701 AND 363799;

INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(363701, 0, 0,  0, 0, 0, 0, 0, 0, 0, 0, 0, 2081, 0, 0, 0,  0, 0, 0, 0, 0, 'Deviate Guardian - Say Emoted Text'),
(363701, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0,    0, 0, 0, 0, 40, 0, 0, 0, 0, 'Deviate Guardian - Call for Help');

INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(363701, 3637, 0, 2, 0, 100, 0, 15, 1, 0, 0, 363701, 0, 0, 'Deviate Guardian - Call for Help at 15% HP');

-- --------------------------------------------------------------------------------------------------
-- Trash: Evolving Ectoplasm (3640)
-- --------------------------------------------------------------------------------------------------

-- Spawns in the frost form. In combat it changes to one of the other three forms (immunity + display) on a timer,
-- not on the school of a hit. The form auras are passive and survive an evade, so the evade restores the frost form.
UPDATE `creature_template` SET `auras`='7940 7944', `ai_name`='EventAI', `script_name`='' WHERE `entry`=3640;
-- The unspawned colour variants (Red, Green, Black) named the same script.
UPDATE `creature_template` SET `script_name`='' WHERE `entry` IN (5776, 5777, 5778);
UPDATE `creature` SET `spawntimesecsmin`=1800, `spawntimesecsmax`=1800 WHERE `id`=3640;

INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
(325, 1, 7940, 0, 0, 0, 0), -- has Immunity: Frost
(327, 1, 7942, 0, 0, 0, 0), -- has Immunity: Fire
(328, 1, 7941, 0, 0, 0, 0), -- has Immunity: Nature
(329, 1, 7743, 0, 0, 0, 0); -- has Immunity: Shadow

INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(364011, 0, 0, 14, 7942, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - Remove Aura Immunity: Fire'),
(364011, 0, 1, 14, 7943, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - Remove Aura Evolving Ectoplasm (Red)'),
(364011, 0, 2, 14, 7941, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - Remove Aura Immunity: Nature'),
(364011, 0, 3, 14, 7945, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - Remove Aura Evolving Ectoplasm (Green)'),
(364011, 0, 4, 14, 7743, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - Remove Aura Immunity: Shadow'),
(364011, 0, 5, 14, 7946, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - Remove Aura Evolving Ectoplasm (Black)'),
(364011, 0, 6, 15, 7940, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - Cast Spell Immunity: Frost'),
(364011, 0, 7, 15, 7944, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - Cast Spell Evolving Ectoplasm (Blue)'),
(364012, 0, 0, 14, 7940, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - Remove Aura Immunity: Frost'),
(364012, 0, 1, 14, 7944, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - Remove Aura Evolving Ectoplasm (Blue)'),
(364012, 0, 2, 14, 7941, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - Remove Aura Immunity: Nature'),
(364012, 0, 3, 14, 7945, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - Remove Aura Evolving Ectoplasm (Green)'),
(364012, 0, 4, 14, 7743, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - Remove Aura Immunity: Shadow'),
(364012, 0, 5, 14, 7946, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - Remove Aura Evolving Ectoplasm (Black)'),
(364012, 0, 6, 15, 7942, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - Cast Spell Immunity: Fire'),
(364012, 0, 7, 15, 7943, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - Cast Spell Evolving Ectoplasm (Red)'),
(364013, 0, 0, 14, 7940, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - Remove Aura Immunity: Frost'),
(364013, 0, 1, 14, 7944, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - Remove Aura Evolving Ectoplasm (Blue)'),
(364013, 0, 2, 14, 7942, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - Remove Aura Immunity: Fire'),
(364013, 0, 3, 14, 7943, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - Remove Aura Evolving Ectoplasm (Red)'),
(364013, 0, 4, 14, 7743, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - Remove Aura Immunity: Shadow'),
(364013, 0, 5, 14, 7946, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - Remove Aura Evolving Ectoplasm (Black)'),
(364013, 0, 6, 15, 7941, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - Cast Spell Immunity: Nature'),
(364013, 0, 7, 15, 7945, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - Cast Spell Evolving Ectoplasm (Green)'),
(364014, 0, 0, 14, 7940, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - Remove Aura Immunity: Frost'),
(364014, 0, 1, 14, 7944, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - Remove Aura Evolving Ectoplasm (Blue)'),
(364014, 0, 2, 14, 7942, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - Remove Aura Immunity: Fire'),
(364014, 0, 3, 14, 7943, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - Remove Aura Evolving Ectoplasm (Red)'),
(364014, 0, 4, 14, 7941, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - Remove Aura Immunity: Nature'),
(364014, 0, 5, 14, 7945, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - Remove Aura Evolving Ectoplasm (Green)'),
(364014, 0, 6, 15, 7743, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - Cast Spell Immunity: Shadow'),
(364014, 0, 7, 15, 7946, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - Cast Spell Evolving Ectoplasm (Black)');

-- One of the three other forms: the row of the current form starts.
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(364001, 0, 0, 39, 364012, 364013, 364014, 0, 0, 0, 0, 4, 33, 33, 34, 0, 0, 0, 0, 0, 325, 'Evolving Ectoplasm - Start Script Other Form (Frost)'),
(364001, 0, 1, 39, 364011, 364013, 364014, 0, 0, 0, 0, 4, 33, 33, 34, 0, 0, 0, 0, 0, 327, 'Evolving Ectoplasm - Start Script Other Form (Fire)'),
(364001, 0, 2, 39, 364011, 364012, 364014, 0, 0, 0, 0, 4, 33, 33, 34, 0, 0, 0, 0, 0, 328, 'Evolving Ectoplasm - Start Script Other Form (Nature)'),
(364001, 0, 3, 39, 364011, 364012, 364013, 0, 0, 0, 0, 4, 33, 33, 34, 0, 0, 0, 0, 0, 329, 'Evolving Ectoplasm - Start Script Other Form (Shadow)'),
(364002, 0, 0, 39, 364011, 0, 0, 0, 0, 0, 0, 4, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - Start Script Frost Form');

INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(364001, 3640, 0, 0, 0, 100, 1, 11000, 19000, 11000, 19000, 364001, 0, 0, 'Evolving Ectoplasm - Change Form in Combat'),
(364002, 3640, 0, 7, 0, 100, 0,     0,     0,     0,     0, 364002, 0, 0, 'Evolving Ectoplasm - Restore Frost Form on Evade');

DELETE FROM `creature_movement` WHERE `id` IN (26200, 26229);
UPDATE `creature` SET `position_x`=-40.73835, `position_y`=64.85439, `position_z`=-87.41126, `movement_type`=2, `wander_distance`=0 WHERE `guid`=27349;
-- A path walked there and back lists the way back too.
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(26200, 1, -68.1524, 203.433, -93.674, 100, 0, 0, 0),
(26200, 2, -69.961, 212.707, -93.5038, 100, 0, 0, 0),
(26200, 3, -78.7136, 218.987, -94.0952, 100, 0, 0, 0),
(26200, 4, -85.6643, 225.037, -93.2043, 100, 0, 0, 0),
(26200, 5, -100.668, 231.587, -91.4226, 100, 0, 0, 0),
(26200, 6, -110.268, 230.005, -90.4413, 100, 0, 0, 0),
(26200, 7, -111.443, 214.012, -85.3093, 100, 0, 0, 0),
(26200, 8, -108.986, 203.938, -81.9642, 100, 0, 0, 0),
(26200, 9, -111.286, 213.68, -85.2575, 100, 0, 0, 0),
(26200, 10, -110.096, 229.464, -90.3296, 100, 0, 0, 0),
(26200, 11, -101.01, 231.305, -91.2858, 100, 0, 0, 0),
(26200, 12, -86.0461, 225.309, -93.0858, 100, 0, 0, 0),
(26200, 13, -78.9576, 219.426, -94.0533, 100, 0, 0, 0),
(26200, 14, -70.0722, 212.752, -93.5082, 100, 0, 0, 0),
(26200, 15, -68.2919, 203.988, -93.6674, 100, 0, 0, 0),
(26200, 16, -79.1239, 186.051, -93.1735, 100, 0, 0, 0),
(26229, 1, -36.9481, 192.669, -96.5478, 100, 0, 0, 0),
(26229, 2, -33.0708, 177.147, -96.3141, 100, 0, 0, 0),
(26229, 3, -37.9909, 156.333, -94.9096, 100, 0, 0, 0),
(26229, 4, -48.0045, 140.481, -91.8653, 100, 0, 0, 0),
(26229, 5, -55.4778, 122.223, -89.6402, 100, 0, 0, 0),
(26229, 6, -47.8948, 140.425, -91.8465, 100, 0, 0, 0),
(26229, 7, -38.109, 156.232, -94.8953, 100, 0, 0, 0),
(26229, 8, -33.0733, 177.137, -96.3138, 100, 0, 0, 0),
(26229, 9, -37.0588, 192.811, -96.5582, 100, 0, 0, 0),
(26229, 10, -35.1795, 210.319, -96.2248, 100, 0, 0, 0),
(26229, 11, -32.656, 228.21, -94.9624, 100, 0, 0, 0),
(26229, 12, -33.2975, 242.874, -93.6593, 100, 0, 0, 0),
(26229, 13, -39.2168, 256.586, -92.8235, 100, 0, 0, 0),
(26229, 14, -40.962, 275.043, -92.4866, 100, 0, 0, 0),
(26229, 15, -46.6966, 286.608, -92.4283, 100, 0, 0, 0),
(26229, 16, -57.9612, 295.736, -90.1559, 100, 0, 0, 0),
(26229, 17, -46.9098, 286.265, -92.4936, 100, 0, 0, 0),
(26229, 18, -41.2171, 274.316, -92.5108, 100, 0, 0, 0),
(26229, 19, -39.8032, 256.102, -92.8306, 100, 0, 0, 0),
(26229, 20, -33.2436, 242.648, -93.6555, 100, 0, 0, 0),
(26229, 21, -33.0231, 228.434, -94.9126, 100, 0, 0, 0),
(26229, 22, -34.8833, 210.837, -96.1466, 100, 0, 0, 0),
(27349, 1, -40.73835, 64.85439, -87.41126, 100, 0, 0, 0),
(27349, 2, -33.10277, 73.4081, -89.88976, 100, 0, 0, 0),
(27349, 3, -24.63402, 87.24139, -91.8159, 100, 0, 0, 0),
(27349, 4, -24.56066, 106.8549, -89.50321, 100, 0, 0, 0),
(27349, 5, -11.77541, 126.2469, -90.04465, 100, 0, 0, 0),
(27349, 6, 1.667334, 148.8547, -88.74242, 100, 0, 0, 0),
(27349, 7, 9.785298, 165.1272, -86.89578, 100, 0, 0, 0),
(27349, 8, 9.761209, 188.2513, -85.17083, 100, 0, 0, 0),
(27349, 9, 11.1377, 208.7739, -84.3674, 100, 0, 0, 0),
(27349, 10, 14.03705, 237.6273, -85.56519, 100, 0, 0, 0),
(27349, 11, 28.80075, 252.0706, -87.41208, 100, 0, 0, 0),
(27349, 12, 29.04836, 264.885, -87.3118, 100, 0, 0, 0),
(27349, 13, 12.43196, 268.9188, -85.9326, 100, 0, 0, 0),
(27349, 14, 0.341876, 284.1094, -85.6383, 100, 0, 0, 0),
(27349, 15, -6.640804, 299.4833, -86.73329, 100, 0, 0, 0),
(27349, 16, -20.87763, 308.1943, -88.3105, 100, 0, 0, 0),
(27349, 17, -27.7499, 311.6328, -89.10725, 100, 0, 0, 0),
(27349, 18, -20.87763, 308.1943, -88.3105, 100, 0, 0, 0),
(27349, 19, -6.640804, 299.4833, -86.73329, 100, 0, 0, 0),
(27349, 20, 0.341876, 284.1094, -85.6383, 100, 0, 0, 0),
(27349, 21, 12.43196, 268.9188, -85.9326, 100, 0, 0, 0),
(27349, 22, 29.04836, 264.885, -87.3118, 100, 0, 0, 0),
(27349, 23, 28.80075, 252.0706, -87.41208, 100, 0, 0, 0),
(27349, 24, 14.03705, 237.6273, -85.56519, 100, 0, 0, 0),
(27349, 25, 11.1377, 208.7739, -84.3674, 100, 0, 0, 0),
(27349, 26, 9.761209, 188.2513, -85.17083, 100, 0, 0, 0),
(27349, 27, 9.785298, 165.1272, -86.89578, 100, 0, 0, 0),
(27349, 28, 1.667334, 148.8547, -88.74242, 100, 0, 0, 0),
(27349, 29, -11.77541, 126.2469, -90.04465, 100, 0, 0, 0),
(27349, 30, -24.56066, 106.8549, -89.50321, 100, 0, 0, 0),
(27349, 31, -24.63402, 87.24139, -91.8159, 100, 0, 0, 0),
(27349, 32, -33.10277, 73.4081, -89.88976, 100, 0, 0, 0);

-- --------------------------------------------------------------------------------------------------
-- Trash: Deviate Lasher (5055)
-- --------------------------------------------------------------------------------------------------

-- Wide Slash is a next-swing spell: out of melee range the cast fails and the spells list retries it.
DELETE FROM `creature_ai_events` WHERE `creature_id`=5055;
DELETE FROM `creature_ai_scripts` WHERE `id`=505501;

INSERT INTO `creature_spells` (`entry`, `name`,
    `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`) VALUES
(50550, 'Wailing Caverns - Deviate Lasher',
    7342, 100, 1, 0, 0, 0, 0, 10, 2, 14, 0); -- Wide Slash

UPDATE `creature_template` SET `ai_name`='', `spell_list_id`=50550 WHERE `entry`=5055;

UPDATE `creature` SET `wander_distance`=2 WHERE `guid` IN (18683, 18684, 18685, 85912, 87097, 87098, 87102, 87106, 87110, 87111);
UPDATE `creature` SET `wander_distance`=3 WHERE `guid` IN (18686, 33982, 38120, 38132, 85918, 87101, 87103, 87136, 87148);
UPDATE `creature` SET `wander_distance`=4 WHERE `guid` IN (18679, 18680, 18681, 33981, 38126, 38127, 85916, 85917, 85988, 86105, 86325, 87104, 87109, 87112, 87120, 87137, 87138, 87149, 87152);
UPDATE `creature` SET `wander_distance`=5 WHERE `guid` IN (85995, 87118);
UPDATE `creature` SET `wander_distance`=6 WHERE `guid` IN (33980, 85994, 86000, 86415, 87119);
UPDATE `creature` SET `wander_distance`=7 WHERE `guid` IN (85989, 87151);
UPDATE `creature` SET `wander_distance`=8 WHERE `guid`=87135;

-- --------------------------------------------------------------------------------------------------
-- Trash: Deviate Crocolisk (5053)
-- --------------------------------------------------------------------------------------------------

-- Tendon Rip has a 20 s category cooldown, the repeat follows it.
DELETE FROM `creature_ai_events` WHERE `creature_id`=5053;
DELETE FROM `creature_ai_scripts` WHERE `id`=505301;

INSERT INTO `creature_spells` (`entry`, `name`,
    `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`) VALUES
(50530, 'Wailing Caverns - Deviate Crocolisk',
    3604, 100, 1, 0, 0, 0, 7, 20, 20, 20, 0); -- Tendon Rip

UPDATE `creature_template` SET `ai_name`='', `spell_list_id`=50530 WHERE `entry`=5053;

INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(2714, 5053, 0, 0, 0, 0, 43, -74.6743, 413.063, -107.109, 4.32351, 7200, 7200, 5, 100, 0, 1, 0, 0, 0, 10);

UPDATE `creature` SET `position_x`=-44.26, `position_y`=308.4, `position_z`=-106.42 WHERE `guid`=27365;
UPDATE `creature` SET `wander_distance`=9 WHERE `guid`=38123;
UPDATE `creature` SET `wander_distance`=10 WHERE `guid` IN (38118, 38134);

-- Three crocolisks swim along the river there and back.
UPDATE `creature` SET `position_x`=-42.8757, `position_y`=108.687, `position_z`=-106.162, `movement_type`=2, `wander_distance`=0 WHERE `guid`=26257;
UPDATE `creature` SET `movement_type`=2, `wander_distance`=0 WHERE `guid`=27374;
DELETE FROM `creature_movement` WHERE `id`=26197;

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(26197, 1, -143.996, 68.7025, -106.276, 100, 0, 0, 0),
(26197, 2, -115.42, 69.97, -106.55, 100, 0, 0, 0),
(26197, 3, -90.63, 61.87, -106.14, 100, 0, 0, 0),
(26197, 4, -82.21, 71.23, -106.16, 100, 0, 0, 0),
(26197, 5, -60.34, 62.89, -106.16, 100, 0, 0, 0),
(26197, 6, -60.26, 73.96, -106.16, 100, 0, 0, 0),
(26197, 7, -46.72, 83.92, -106.16, 100, 0, 0, 0),
(26197, 8, -37.28, 91.72, -106.16, 100, 0, 0, 0),
(26197, 9, -46.72, 83.92, -106.16, 100, 0, 0, 0),
(26197, 10, -60.26, 73.96, -106.16, 100, 0, 0, 0),
(26197, 11, -60.34, 62.89, -106.16, 100, 0, 0, 0),
(26197, 12, -82.21, 71.23, -106.16, 100, 0, 0, 0),
(26197, 13, -90.63, 61.87, -106.14, 100, 0, 0, 0),
(26197, 14, -115.42, 69.97, -106.55, 100, 0, 0, 0),
(26257, 1, -42.8757, 108.687, -106.162, 100, 0, 0, 0),
(26257, 2, -13.57, 145.43, -106.16, 100, 0, 0, 0),
(26257, 3, -4.98, 166.44, -106.16, 100, 0, 0, 0),
(26257, 4, -3.78, 181.17, -106.16, 100, 0, 0, 0),
(26257, 5, -4.98, 210.33, -106.16, 100, 0, 0, 0),
(26257, 6, 0.287006, 225.334, -106.157, 100, 0, 0, 0),
(26257, 7, 1.61, 241.89, -106.27, 100, 0, 0, 0),
(26257, 8, 2.31, 257.56, -106.42, 100, 0, 0, 0),
(26257, 9, 1.61, 241.89, -106.27, 100, 0, 0, 0),
(26257, 10, 0.287006, 225.334, -106.157, 100, 0, 0, 0),
(26257, 11, -4.98, 210.33, -106.16, 100, 0, 0, 0),
(26257, 12, -3.78, 181.17, -106.16, 100, 0, 0, 0),
(26257, 13, -4.98, 166.44, -106.16, 100, 0, 0, 0),
(26257, 14, -13.57, 145.43, -106.16, 100, 0, 0, 0),
(27374, 1, -71.5549, 348.3, -106.162, 100, 0, 0, 0),
(27374, 2, -73.1891, 339.794, -106.162, 100, 0, 0, 0),
(27374, 3, -77.5053, 331.764, -106.162, 100, 0, 0, 0),
(27374, 4, -74.83, 324.03, -106.16, 100, 0, 0, 0),
(27374, 5, -69.09, 317.91, -106.43, 100, 0, 0, 0),
(27374, 6, -57.44, 312.5, -106.58, 100, 0, 0, 0),
(27374, 7, -49.63, 307.92, -106.42, 100, 0, 0, 0),
(27374, 8, -57.44, 312.5, -106.58, 100, 0, 0, 0),
(27374, 9, -69.09, 317.91, -106.43, 100, 0, 0, 0),
(27374, 10, -74.83, 324.03, -106.16, 100, 0, 0, 0),
(27374, 11, -77.5053, 331.764, -106.162, 100, 0, 0, 0),
(27374, 12, -73.1891, 339.794, -106.162, 100, 0, 0, 0);

-- --------------------------------------------------------------------------------------------------
-- Trash: Deviate Viper (5755)
-- --------------------------------------------------------------------------------------------------

-- Also used by the vipers summoned during the escort.
DELETE FROM `creature_spells` WHERE `entry`=57550;
INSERT INTO `creature_spells` (`entry`, `name`,
    `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`) VALUES
(57550, 'Wailing Caverns - Deviate Viper',
    7947, 100, 4, 0, 0, 0, 2, 12, 10, 16, 0); -- Localized Toxin

UPDATE `creature` SET `wander_distance`=4 WHERE `guid`=33931;
UPDATE `creature` SET `wander_distance`=6 WHERE `guid` IN (27378, 33948, 33949);
UPDATE `creature` SET `wander_distance`=7 WHERE `guid`=33951;

-- Two long routes there and back, each walked by a viper or an adder.
UPDATE `creature` SET `id`=5755, `id2`=5048, `position_x`=-47.66, `position_y`=464.62, `position_z`=-56.26, `orientation`=1.6583, `movement_type`=2, `wander_distance`=0 WHERE `guid`=33935;
UPDATE `creature` SET `id`=5755, `id2`=5048, `position_x`=69.82, `position_y`=425.52, `position_z`=-63.96, `orientation`=4.3958, `movement_type`=2, `wander_distance`=0 WHERE `guid`=33950;

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(33950, 1, 69.82, 425.52, -63.96, 100, 0, 0, 0),
(33950, 2, 66.76, 416.18, -63.74, 100, 0, 0, 0),
(33950, 3, 61.74, 402.69, -63.65, 100, 0, 0, 0),
(33950, 4, 44.85, 399.1, -61.35, 100, 0, 0, 0),
(33950, 5, 33.27, 400.44, -59.96, 100, 0, 0, 0),
(33950, 6, 20.78, 397.39, -59.41, 100, 0, 0, 0),
(33950, 7, 9.78, 396.22, -59.54, 100, 0, 0, 0),
(33950, 8, -1.33, 399.67, -59.96, 100, 0, 0, 0),
(33950, 9, -10.95, 396.9, -60.04, 100, 0, 0, 0),
(33950, 10, -16.81, 384.82, -60.21, 100, 0, 0, 0),
(33950, 11, -31.6, 383.83, -59.88, 100, 0, 0, 0),
(33950, 12, -38.6429, 418.28, -60.0603, 100, 0, 0, 0),
(33950, 13, -31.6, 383.83, -59.88, 100, 0, 0, 0),
(33950, 14, -16.81, 384.82, -60.21, 100, 0, 0, 0),
(33950, 15, -10.95, 396.9, -60.04, 100, 0, 0, 0),
(33950, 16, -1.33, 399.67, -59.96, 100, 0, 0, 0),
(33950, 17, 9.78, 396.22, -59.54, 100, 0, 0, 0),
(33950, 18, 20.78, 397.39, -59.41, 100, 0, 0, 0),
(33950, 19, 33.27, 400.44, -59.96, 100, 0, 0, 0),
(33950, 20, 44.85, 399.1, -61.35, 100, 0, 0, 0),
(33950, 21, 61.74, 402.69, -63.65, 100, 0, 0, 0),
(33950, 22, 66.76, 416.18, -63.74, 100, 0, 0, 0),
(33935, 1, -47.66, 464.62, -56.26, 100, 0, 0, 0),
(33935, 2, -48.58, 475.11, -56.19, 100, 0, 0, 0),
(33935, 3, -55.86, 475.51, -57.68, 100, 0, 0, 0),
(33935, 4, -61.74, 482.55, -59.32, 100, 0, 0, 0),
(33935, 5, -70.45, 487.93, -61.74, 100, 0, 0, 0),
(33935, 6, -78.68, 488.8, -63.9, 100, 0, 0, 0),
(33935, 7, -83.75, 483.91, -65.77, 100, 0, 0, 0),
(33935, 8, -85.96, 478.2, -67.16, 100, 0, 0, 0),
(33935, 9, -85.32, 470.4, -68.31, 100, 0, 0, 0),
(33935, 10, -89.91, 464.27, -69.86, 100, 0, 0, 0),
(33935, 11, -99.73, 463.31, -70.81, 100, 0, 0, 0),
(33935, 12, -111.3, 460.36, -71.78, 100, 0, 0, 0),
(33935, 13, -115.56, 453.16, -72.56, 100, 0, 0, 0),
(33935, 14, -115.2, 442.68, -72.72, 100, 0, 0, 0),
(33935, 15, -109.73, 433.35, -73.07, 100, 0, 0, 0),
(33935, 16, -108.95, 424.32, -73.66, 100, 0, 0, 0),
(33935, 17, -111.29, 414.88, -73.82, 100, 0, 0, 0),
(33935, 18, -108.95, 424.32, -73.66, 100, 0, 0, 0),
(33935, 19, -109.73, 433.35, -73.07, 100, 0, 0, 0),
(33935, 20, -115.2, 442.68, -72.72, 100, 0, 0, 0),
(33935, 21, -115.56, 453.16, -72.56, 100, 0, 0, 0),
(33935, 22, -111.3, 460.36, -71.78, 100, 0, 0, 0),
(33935, 23, -99.73, 463.31, -70.81, 100, 0, 0, 0),
(33935, 24, -89.91, 464.27, -69.86, 100, 0, 0, 0),
(33935, 25, -85.32, 470.4, -68.31, 100, 0, 0, 0),
(33935, 26, -85.96, 478.2, -67.16, 100, 0, 0, 0),
(33935, 27, -83.75, 483.91, -65.77, 100, 0, 0, 0),
(33935, 28, -78.68, 488.8, -63.9, 100, 0, 0, 0),
(33935, 29, -70.45, 487.93, -61.74, 100, 0, 0, 0),
(33935, 30, -61.74, 482.55, -59.32, 100, 0, 0, 0),
(33935, 31, -55.86, 475.51, -57.68, 100, 0, 0, 0),
(33935, 32, -48.58, 475.11, -56.19, 100, 0, 0, 0);

-- --------------------------------------------------------------------------------------------------
-- Trash: Deviate Adder (5048)
-- --------------------------------------------------------------------------------------------------

-- Poison is a normal cast, not a proc aura. Also used by the adders summoned during the escort.
DELETE FROM `creature_ai_events` WHERE `creature_id`=5048;
DELETE FROM `creature_ai_scripts` WHERE `id`=504801;

INSERT INTO `creature_spells` (`entry`, `name`,
    `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`) VALUES
(50480, 'Wailing Caverns - Deviate Adder',
    744, 100, 1, 0, 0, 0, 7, 31, 30, 30, 0); -- Poison

UPDATE `creature_template` SET `ai_name`='', `spell_list_id`=50480 WHERE `entry`=5048;

DELETE FROM `creature` WHERE `guid`=301704;

UPDATE `creature` SET `position_x`=-79.3177, `position_y`=471.603, `position_z`=-67.0018, `orientation`=4.64989, `movement_type`=1, `wander_distance`=5 WHERE `guid`=33934;
DELETE FROM `creature_movement` WHERE `id`=33934;

UPDATE `creature` SET `wander_distance`=5 WHERE `guid`=33967;
UPDATE `creature` SET `wander_distance`=6 WHERE `guid`=33965;
UPDATE `creature` SET `wander_distance`=7 WHERE `guid`=27375;

-- Walks from the west end past its old spot (point 7) to the east and back.
UPDATE `creature` SET `position_x`=-31.93, `position_y`=468.22, `position_z`=-54.1, `orientation`=0.677, `movement_type`=2, `wander_distance`=0 WHERE `guid`=33961;

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(33961, 1, -31.93, 468.22, -54.1, 100, 0, 0, 0),
(33961, 2, -26.48, 472.6, -54.22, 100, 0, 0, 0),
(33961, 3, -19.87, 484.4, -55.66, 100, 0, 0, 0),
(33961, 4, -19.13, 493.16, -54.83, 100, 0, 0, 0),
(33961, 5, -13.07, 500.77, -55.46, 100, 0, 0, 0),
(33961, 6, -8.19, 507.71, -55.99, 100, 0, 0, 0),
(33961, 7, 14.5078, 522.024, -57.2001, 100, 0, 0, 0),
(33961, 8, 36.29, 502.42, -60.72, 100, 0, 0, 0),
(33961, 9, 40.9, 491.72, -63.58, 100, 0, 0, 0),
(33961, 10, 40.28, 478.01, -65.97, 100, 0, 0, 0),
(33961, 11, 40.9, 491.72, -63.58, 100, 0, 0, 0),
(33961, 12, 36.29, 502.42, -60.72, 100, 0, 0, 0),
(33961, 13, 14.5078, 522.024, -57.2001, 100, 0, 0, 0),
(33961, 14, -8.19, 507.71, -55.99, 100, 0, 0, 0),
(33961, 15, -13.07, 500.77, -55.46, 100, 0, 0, 0),
(33961, 16, -19.13, 493.16, -54.83, 100, 0, 0, 0),
(33961, 17, -19.87, 484.4, -55.66, 100, 0, 0, 0),
(33961, 18, -26.48, 472.6, -54.22, 100, 0, 0, 0);

-- --------------------------------------------------------------------------------------------------
-- Trash: Deviate Shambler (5761)
-- --------------------------------------------------------------------------------------------------

UPDATE `creature` SET `wander_distance`=4 WHERE `guid`=49413;
UPDATE `creature` SET `wander_distance`=5 WHERE `guid` IN (38114, 85974);
UPDATE `creature` SET `wander_distance`=6 WHERE `guid`=85953;
UPDATE `creature` SET `position_x`=-174.16, `position_y`=-81.31, `position_z`=-67.74 WHERE `guid`=45723;

-- Six walkers, 38168 and 38116 share the west corridor, 85901 and 85902 another route on different lines.
-- Patrols do not join the units at their spawn. A path walked there and back lists the way back too.
DELETE FROM `creature_groups` WHERE `member_guid` IN (38168, 85902, 85947);
UPDATE `creature` SET `position_x`=-97.88, `position_y`=-113.31, `position_z`=-78.03, `orientation`=5.534, `movement_type`=2, `wander_distance`=0 WHERE `guid`=85901;
UPDATE `creature` SET `movement_type`=2, `wander_distance`=0 WHERE `guid`=85902;
UPDATE `creature` SET `position_x`=-29.17, `position_y`=-248.05, `position_z`=-68.41, `orientation`=5.627, `movement_type`=2, `wander_distance`=0 WHERE `guid`=85947;

DELETE FROM `creature_movement` WHERE `id` IN (38116, 38168, 85963);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(38116, 1, -241.193, 42.2694, -83.8524, 100, 0, 0, 0),
(38116, 2, -257.169, 41.459, -86.9647, 100, 0, 0, 0),
(38116, 3, -268.754, 32.5239, -87.9437, 100, 0, 0, 0),
(38116, 4, -279.79, 33.354, -88.8636, 100, 0, 0, 0),
(38116, 5, -302.306, 48.9864, -93.0104, 100, 0, 0, 0),
(38116, 6, -321.468, 52.3916, -96.2298, 100, 0, 0, 0),
(38116, 7, -335.7, 45.4104, -98.3198, 100, 0, 0, 0),
(38116, 8, -340.7, 36.0533, -99.0784, 100, 0, 0, 0),
(38116, 9, -339.409, 28.5987, -100.247, 100, 0, 0, 0),
(38116, 10, -332.995, 21.5768, -103.176, 100, 0, 0, 0),
(38116, 11, -338.99, 28.3312, -100.283, 100, 0, 0, 0),
(38116, 12, -340.614, 36.4627, -99.0447, 100, 0, 0, 0),
(38116, 13, -335.639, 46.0422, -98.2416, 100, 0, 0, 0),
(38116, 14, -322.301, 52.3214, -96.3296, 100, 0, 0, 0),
(38116, 15, -302.867, 49.2066, -93.0867, 100, 0, 0, 0),
(38116, 16, -280.559, 33.8918, -88.9843, 100, 0, 0, 0),
(38116, 17, -269.405, 32.6903, -87.9801, 100, 0, 0, 0),
(38116, 18, -256.297, 40.9856, -86.9004, 100, 0, 0, 0),
(38116, 19, -241.16, 42.102, -83.8425, 100, 0, 0, 0),
(38116, 20, -217.971, 49.149, -82.2794, 100, 0, 0, 0),
(38116, 21, -207.092, 59.329, -82.3576, 100, 0, 0, 0),
(38116, 22, -196.834, 74.8148, -81.7144, 100, 0, 0, 0),
(38116, 23, -186.296, 84.9382, -79.5481, 100, 0, 0, 0),
(38116, 24, -174.414, 87.8771, -77.7629, 100, 0, 0, 0),
(38116, 25, -164.768, 80.992, -76.0056, 100, 0, 0, 0),
(38116, 26, -147.974, 53.8704, -75.8208, 100, 0, 0, 0),
(38116, 27, -141.957, 42.629, -75.4675, 100, 0, 0, 0),
(38116, 28, -141.45, 22.0252, -74.8123, 100, 0, 0, 0),
(38116, 29, -145.667, 8.31579, -74.5782, 100, 0, 0, 0),
(38116, 30, -155.675, -14.5223, -78.0544, 100, 0, 0, 0),
(38116, 31, -153.295, -27.8904, -80.1074, 100, 0, 0, 0),
(38116, 32, -142.287, -38.5889, -78.8823, 100, 0, 0, 0),
(38116, 33, -152.379, -27.9155, -79.9458, 100, 0, 0, 0),
(38116, 34, -155.651, -14.4576, -78.042, 100, 0, 0, 0),
(38116, 35, -145.77, 7.76751, -74.5628, 100, 0, 0, 0),
(38116, 36, -145.77, 7.76751, -74.5628, 100, 0, 0, 0),
(38116, 37, -142.01, 35.0579, -75.3986, 100, 0, 0, 0),
(38116, 38, -143.771, 45.6428, -75.3807, 100, 0, 0, 0),
(38116, 39, -153.842, 59.4346, -75.6966, 100, 0, 0, 0),
(38116, 40, -164.62, 80.9623, -76.0071, 100, 0, 0, 0),
(38116, 41, -175.641, 87.215, -78.0969, 100, 0, 0, 0),
(38116, 42, -184.698, 85.9708, -79.4345, 100, 0, 0, 0),
(38116, 43, -197.63, 74.554, -81.7961, 100, 0, 0, 0),
(38116, 44, -217.403, 50.4437, -82.285, 100, 0, 0, 0),
(38168, 1, -163.207, -96.9781, -66.663, 100, 0, 0, 0),
(38168, 2, -147.497, -101.802, -68.5947, 100, 0, 0, 0),
(38168, 3, -128.496, -102.5, -71.5074, 100, 0, 0, 0),
(38168, 4, -120.008, -95.097, -72.086, 100, 0, 0, 0),
(38168, 5, -115.215, -75.2305, -69.3508, 100, 0, 0, 0),
(38168, 6, -98.7366, -61.618, -67.1226, 100, 0, 0, 0),
(38168, 7, -72.1005, -51.2044, -61.7233, 100, 0, 0, 0),
(38168, 8, -99.5672, -62.2831, -67.2459, 100, 0, 0, 0),
(38168, 9, -114.608, -75.3549, -69.5214, 100, 0, 0, 0),
(38168, 10, -120.449, -94.6039, -71.8979, 100, 0, 0, 0),
(38168, 11, -128.759, -102.215, -71.4281, 100, 0, 0, 0),
(38168, 12, -147.378, -101.769, -68.6083, 100, 0, 0, 0),
(38168, 13, -162.921, -96.9254, -66.6689, 100, 0, 0, 0),
(38168, 14, -172.51, -86.2992, -67.6991, 100, 0, 0, 0),
(38168, 15, -173.37, -70.72, -69.08, 100, 0, 0, 0),
(38168, 16, -161.73, -42.86, -79.04, 100, 0, 0, 0),
(38168, 17, -151.8, -13.65, -77.41, 100, 0, 0, 0),
(38168, 18, -142.71, 18.3, -74.7, 100, 0, 0, 0),
(38168, 19, -145.22, 51.97, -75.73, 100, 0, 0, 0),
(38168, 20, -164.8, 78.86, -75.98, 100, 0, 0, 0),
(38168, 21, -183.12, 86.39, -79.33, 100, 0, 0, 0),
(38168, 22, -230.86, 43.54, -82.72, 100, 0, 0, 0),
(38168, 23, -260.54, 41.79, -87.17, 100, 0, 0, 0),
(38168, 24, -272.04, 31.61, -88.12, 100, 0, 0, 0),
(38168, 25, -284.75, 34.6, -89.55, 100, 0, 0, 0),
(38168, 26, -272.04, 31.61, -88.12, 100, 0, 0, 0),
(38168, 27, -260.54, 41.79, -87.17, 100, 0, 0, 0),
(38168, 28, -230.86, 43.54, -82.72, 100, 0, 0, 0),
(38168, 29, -183.12, 86.39, -79.33, 100, 0, 0, 0),
(38168, 30, -164.8, 78.86, -75.98, 100, 0, 0, 0),
(38168, 31, -145.22, 51.97, -75.73, 100, 0, 0, 0),
(38168, 32, -142.71, 18.3, -74.7, 100, 0, 0, 0),
(38168, 33, -151.8, -13.65, -77.41, 100, 0, 0, 0),
(38168, 34, -161.73, -42.86, -79.04, 100, 0, 0, 0),
(38168, 35, -173.37, -70.72, -69.08, 100, 0, 0, 0),
(38168, 36, -172.706, -85.6673, -67.6947, 100, 0, 0, 0),
(85901, 1, -89.92, -129.1, -79.16, 100, 0, 0, 0),
(85901, 2, -79.9, -135.88, -79.07, 100, 0, 0, 0),
(85901, 3, -49.95, -156.12, -77.87, 100, 0, 0, 0),
(85901, 4, -45.62, -174.19, -75.93, 100, 0, 0, 0),
(85901, 5, -35.47, -193.55, -73.23, 100, 0, 0, 0),
(85901, 6, -45.62, -174.19, -75.93, 100, 0, 0, 0),
(85901, 7, -49.95, -156.12, -77.87, 100, 0, 0, 0),
(85901, 8, -79.9, -135.88, -79.07, 100, 0, 0, 0),
(85901, 9, -89.92, -129.1, -79.16, 100, 0, 0, 0),
(85901, 10, -97.88, -113.31, -78.03, 100, 0, 0, 0),
(85901, 11, -111.02, -101.08, -75.4, 100, 0, 0, 0),
(85901, 12, -109.74, -71.87, -69.31, 100, 0, 0, 0),
(85901, 13, -111.02, -101.08, -75.4, 100, 0, 0, 0),
(85901, 14, -97.88, -113.31, -78.03, 100, 0, 0, 0),
(85902, 1, -58.6, -150.77, -78.8, 100, 0, 0, 0),
(85902, 2, -94.17, -134.03, -79.21, 100, 0, 0, 0),
(85902, 3, -111.27, -108.95, -76.31, 100, 0, 0, 0),
(85902, 4, -115.13, -86.77, -72.12, 100, 0, 0, 0),
(85902, 5, -108.26, -66.61, -67.84, 100, 0, 0, 0),
(85902, 6, -85.53, -56.57, -63.88, 100, 0, 0, 0),
(85902, 7, -108.26, -66.61, -67.84, 100, 0, 0, 0),
(85902, 8, -115.13, -86.77, -72.12, 100, 0, 0, 0),
(85902, 9, -111.27, -108.95, -76.31, 100, 0, 0, 0),
(85902, 10, -94.17, -134.03, -79.21, 100, 0, 0, 0),
(85902, 11, -58.6, -150.77, -78.8, 100, 0, 0, 0),
(85902, 12, -40.89, -169.13, -75.73, 100, 0, 0, 0),
(85902, 13, -37.37, -190.44, -73.97, 100, 0, 0, 0),
(85902, 14, -40.89, -169.13, -75.73, 100, 0, 0, 0),
(85947, 1, 11.99, -243.56, -74.52, 100, 0, 0, 0),
(85947, 2, 24.27, -245.27, -77.01, 100, 0, 0, 0),
(85947, 3, 33.58, -240.7, -79.49, 100, 0, 0, 0),
(85947, 4, 18.27, -225.45, -79.53, 100, 0, 0, 0),
(85947, 5, 33.58, -240.7, -79.49, 100, 0, 0, 0),
(85947, 6, 24.27, -245.27, -77.01, 100, 0, 0, 0),
(85947, 7, 11.99, -243.56, -74.52, 100, 0, 0, 0),
(85947, 8, -29.17, -248.05, -68.41, 100, 0, 0, 0),
(85963, 1, 22.7648, -150.782, -75.5469, 100, 0, 0, 0),
(85963, 2, -1.6489, -136.536, -76.2255, 100, 0, 0, 0),
(85963, 3, -32.186, -123.083, -72.0126, 100, 0, 0, 0),
(85963, 4, -28.58, -93.28, -70.07, 100, 0, 0, 0),
(85963, 5, -23.06, -72.46, -67.39, 100, 0, 0, 0),
(85963, 6, -36.65, -55.65, -65.97, 100, 0, 0, 0),
(85963, 7, -54.41, -48.66, -63.67, 100, 0, 0, 0),
(85963, 8, -36.65, -55.65, -65.97, 100, 0, 0, 0),
(85963, 9, -23.06, -72.46, -67.39, 100, 0, 0, 0),
(85963, 10, -28.58, -93.28, -70.07, 100, 0, 0, 0),
(85963, 11, -32.186, -123.083, -72.0126, 100, 0, 0, 0),
(85963, 12, -1.6489, -136.536, -76.2255, 100, 0, 0, 0);

-- --------------------------------------------------------------------------------------------------
-- Trash: Deviate Dreadfang (5056), Deviate Venomwing (5756)
-- --------------------------------------------------------------------------------------------------

-- Dreadfangs and Venomwings share their spawn points, except three fixed Dreadfangs and one fixed Venomwing.
UPDATE `creature` SET `id`=5056, `id2`=5756 WHERE `guid` IN (26203, 38121, 38122, 38147, 49416, 85993, 86011, 86045, 86111, 87094, 87123, 87127, 87130, 87132, 87134, 87144, 87146, 87147, 87156);

UPDATE `creature` SET `wander_distance`=4 WHERE `guid`=49416;
UPDATE `creature` SET `wander_distance`=6 WHERE `guid` IN (38147, 86012, 87127, 87144, 87156);
UPDATE `creature` SET `wander_distance`=7 WHERE `guid` IN (86011, 87114, 87147);

DELETE FROM `creature_ai_events` WHERE `creature_id`=5056;
DELETE FROM `creature_ai_scripts` WHERE `id`=505601;

INSERT INTO `creature_spells` (`entry`, `name`,
    `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`) VALUES
(50560, 'Wailing Caverns - Deviate Dreadfang',
    7399, 100, 1, 0, 0, 0, 5, 20, 9, 15, 0); -- Terrify

UPDATE `creature_template` SET `ai_name`='', `spell_list_id`=50560 WHERE `entry`=5056;

-- Toxic Spit at any range, also in melee.
DELETE FROM `creature_spells` WHERE `entry`=57560;
INSERT INTO `creature_spells` (`entry`, `name`,
    `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`) VALUES
(57560, 'Wailing Caverns - Deviate Venomwing',
    7951, 100, 1, 0, 0, 8, 0, 1, 3, 5, 0); -- Toxic Spit

-- Five routes there and back, 38122 keeps its path. Patrols do not join the units at their spawn.
DELETE FROM `creature_groups` WHERE `member_guid` IN (49416, 87130, 87132);
UPDATE `creature` SET `movement_type`=2, `wander_distance`=0 WHERE `guid` IN (85993, 87134);
UPDATE `creature` SET `position_x`=-218.42, `position_y`=-197.48, `position_z`=-61.44, `orientation`=5.40758, `movement_type`=2, `wander_distance`=0 WHERE `guid`=87130;
UPDATE `creature` SET `position_x`=-313.0988, `position_y`=-133.1061, `position_z`=-62.05272, `movement_type`=2, `wander_distance`=0 WHERE `guid`=87146;
UPDATE `creature_movement` SET `position_x`=-281.81, `position_y`=11.18, `position_z`=-62.61 WHERE `id`=38122 AND `point`=40;

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(85993, 1, -159.02, -189.08, -69.26, 100, 0, 0, 0),
(85993, 2, -147.44, -196.84, -68.07, 100, 0, 0, 0),
(85993, 3, -151.81, -216.58, -70.8, 100, 0, 0, 0),
(85993, 4, -138.4, -230.03, -68.74, 100, 0, 0, 0),
(85993, 5, -126, -240.54, -63.61, 100, 0, 0, 0),
(85993, 6, -116.59, -254.21, -59.48, 100, 0, 0, 0),
(85993, 7, -106.06, -264.53, -57.19, 100, 0, 0, 0),
(85993, 8, -111.28, -285.11, -61.35, 100, 0, 0, 0),
(85993, 9, -119.93, -302.06, -63.31, 100, 0, 0, 0),
(85993, 10, -136.82, -305.65, -63.96, 100, 0, 0, 0),
(85993, 11, -154.58, -298.99, -64.12, 100, 0, 0, 0),
(85993, 12, -159.64, -315.86, -66.73, 100, 0, 0, 0),
(85993, 13, -154.58, -298.99, -64.12, 100, 0, 0, 0),
(85993, 14, -136.82, -305.65, -63.96, 100, 0, 0, 0),
(85993, 15, -119.93, -302.06, -63.31, 100, 0, 0, 0),
(85993, 16, -111.28, -285.11, -61.35, 100, 0, 0, 0),
(85993, 17, -106.06, -264.53, -57.19, 100, 0, 0, 0),
(85993, 18, -116.59, -254.21, -59.48, 100, 0, 0, 0),
(85993, 19, -126, -240.54, -63.61, 100, 0, 0, 0),
(85993, 20, -138.4, -230.03, -68.74, 100, 0, 0, 0),
(85993, 21, -151.81, -216.58, -70.8, 100, 0, 0, 0),
(85993, 22, -147.44, -196.84, -68.07, 100, 0, 0, 0),
(87130, 1, -229.99, -183.62, -61.98, 100, 0, 0, 0),
(87130, 2, -242.46, -161.57, -63.14, 100, 0, 0, 0),
(87130, 3, -254.87, -165.05, -63.18, 100, 0, 0, 0),
(87130, 4, -264.23, -182.83, -60.38, 100, 0, 0, 0),
(87130, 5, -265.17, -213.55, -64.2, 100, 0, 0, 0),
(87130, 6, -286.11, -221.79, -63.99, 100, 0, 0, 0),
(87130, 7, -296.57, -233.51, -64.17, 100, 0, 0, 0),
(87130, 8, -291.8, -247.23, -64.28, 100, 0, 0, 0),
(87130, 9, -276.48, -256.02, -64.28, 100, 0, 0, 0),
(87130, 10, -263.38, -272.2, -65.72, 100, 0, 0, 0),
(87130, 11, -262.08, -294.42, -67.95, 100, 0, 0, 0),
(87130, 12, -263.38, -272.2, -65.72, 100, 0, 0, 0),
(87130, 13, -276.48, -256.02, -64.28, 100, 0, 0, 0),
(87130, 14, -291.8, -247.23, -64.28, 100, 0, 0, 0),
(87130, 15, -296.57, -233.51, -64.17, 100, 0, 0, 0),
(87130, 16, -286.11, -221.79, -63.99, 100, 0, 0, 0),
(87130, 17, -265.17, -213.55, -64.2, 100, 0, 0, 0),
(87130, 18, -264.23, -182.83, -60.38, 100, 0, 0, 0),
(87130, 19, -254.87, -165.05, -63.18, 100, 0, 0, 0),
(87130, 20, -242.46, -161.57, -63.14, 100, 0, 0, 0),
(87130, 21, -229.99, -183.62, -61.98, 100, 0, 0, 0),
(87130, 22, -218.42, -197.48, -61.44, 100, 0, 0, 0),
(87130, 23, -198.55, -189.07, -63.08, 100, 0, 0, 0),
(87130, 24, -181.8, -207.24, -58.62, 100, 0, 0, 0),
(87130, 25, -198.55, -189.07, -63.08, 100, 0, 0, 0),
(87130, 26, -218.42, -197.48, -61.44, 100, 0, 0, 0),
(87134, 1, -169.03, -342.9, -69.8, 100, 0, 0, 0),
(87134, 2, -185.89, -351.14, -71.04, 100, 0, 0, 0),
(87134, 3, -202.15, -342.29, -71.02, 100, 0, 0, 0),
(87134, 4, -213.84, -329.22, -71.08, 100, 0, 0, 0),
(87134, 5, -211.86, -309.32, -71.06, 100, 0, 0, 0),
(87134, 6, -225.87, -302.5, -70.96, 100, 0, 0, 0),
(87134, 7, -238.87, -301.44, -69.63, 100, 0, 0, 0),
(87134, 8, -245.46, -297.32, -68.91, 100, 0, 0, 0),
(87134, 9, -238.87, -301.44, -69.63, 100, 0, 0, 0),
(87134, 10, -225.87, -302.5, -70.96, 100, 0, 0, 0),
(87134, 11, -211.86, -309.32, -71.06, 100, 0, 0, 0),
(87134, 12, -213.84, -329.22, -71.08, 100, 0, 0, 0),
(87134, 13, -202.15, -342.29, -71.02, 100, 0, 0, 0),
(87134, 14, -185.89, -351.14, -71.04, 100, 0, 0, 0),
(87146, 1, -307.6822, -119.195, -62.616, 100, 0, 0, 0),
(87146, 2, -299.3377, -110.5675, -63.58162, 100, 0, 0, 0),
(87146, 3, -305.7387, -97.06437, -64.27655, 100, 0, 0, 0),
(87146, 4, -316.8224, -84.328, -65.11186, 100, 0, 0, 0),
(87146, 5, -329, -76.99, -65.53, 100, 0, 0, 0),
(87146, 6, -350.54, -76.2, -65.57, 100, 0, 0, 0),
(87146, 7, -357.6035, -71.56627, -65.31252, 100, 0, 0, 0),
(87146, 8, -343.2266, -52.34737, -64.17178, 100, 0, 0, 0),
(87146, 9, -323.5713, -36.60895, -63.64532, 100, 0, 0, 0),
(87146, 10, -302.5198, -29.76302, -61.26539, 100, 0, 0, 0),
(87146, 11, -294.3909, -8.422378, -58.93382, 100, 0, 0, 0),
(87146, 12, -302.5198, -29.76302, -61.26539, 100, 0, 0, 0),
(87146, 13, -323.5713, -36.60895, -63.64532, 100, 0, 0, 0),
(87146, 14, -343.2266, -52.34737, -64.17178, 100, 0, 0, 0),
(87146, 15, -357.6035, -71.56627, -65.31252, 100, 0, 0, 0),
(87146, 16, -350.54, -76.2, -65.57, 100, 0, 0, 0),
(87146, 17, -329, -76.99, -65.53, 100, 0, 0, 0),
(87146, 18, -316.8224, -84.328, -65.11186, 100, 0, 0, 0),
(87146, 19, -305.7387, -97.06437, -64.27655, 100, 0, 0, 0),
(87146, 20, -299.3377, -110.5675, -63.58162, 100, 0, 0, 0),
(87146, 21, -307.6822, -119.195, -62.616, 100, 0, 0, 0),
(87146, 22, -313.0988, -133.1061, -62.05272, 100, 0, 0, 0);

-- --------------------------------------------------------------------------------------------------
-- Trash: Deviate Python (8886)
-- --------------------------------------------------------------------------------------------------

UPDATE `creature` SET `position_x`=-110.444, `position_y`=441.911, `position_z`=-72.9267, `orientation`=6.06107, `wander_distance`=5 WHERE `guid`=33945;
UPDATE `creature` SET `wander_distance`=3 WHERE `guid`=27387;
UPDATE `creature` SET `wander_distance`=4 WHERE `guid`=33954;
UPDATE `creature` SET `wander_distance`=5 WHERE `guid` IN (33962, 33963);
UPDATE `creature` SET `wander_distance`=6 WHERE `guid` IN (33955, 301702);
UPDATE `creature` SET `wander_distance`=7 WHERE `guid` IN (33941, 33942);

-- --------------------------------------------------------------------------------------------------
-- Trash: Biletoad (3835)
-- --------------------------------------------------------------------------------------------------

UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE `id`=3835 AND `map`=43;

-- --------------------------------------------------------------------------------------------------
-- Trash: Serpentbloom Snake (3680)
-- --------------------------------------------------------------------------------------------------

-- Flees from its spawn on, summoned by the Serpentbloom trap. A creature_template aura is applied before the creature
-- is in world and the flee movement never starts, so the spawn event casts it.
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3680;

INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(368001, 0, 0, 15, 6243, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Serpentbloom Snake - Cast Spell Serpentbloom Snake Passive');

INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(368001, 3680, 0, 11, 0, 100, 0, 0, 0, 0, 0, 368001, 0, 0, 'Serpentbloom Snake - Cast Serpentbloom Snake Passive on Spawn');

-- --------------------------------------------------------------------------------------------------
-- Trash: Snake (2914)
-- --------------------------------------------------------------------------------------------------

UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=420 WHERE `id`=2914 AND `map`=43;

-- --------------------------------------------------------------------------------------------------
-- Gameobjects: Serpentbloom (13891, 19535)
-- --------------------------------------------------------------------------------------------------

-- Every point holds a Serpentbloom (chest + linked trap). Two points were spawned twice.
DELETE FROM `pool_gameobject` WHERE `pool_entry` BETWEEN 7124 AND 7148;
DELETE FROM `pool_pool` WHERE `mother_pool`=7149;
DELETE FROM `pool_template` WHERE `entry` BETWEEN 7124 AND 7149;
DELETE FROM `gameobject` WHERE `guid` IN (243, 342, 93892, 93917);
UPDATE `gameobject` SET `spawntimesecsmin`=780, `spawntimesecsmax`=990 WHERE `id` IN (13891, 19535) AND `map`=43;

-- --------------------------------------------------------------------------------------------------
-- Gameobjects: Large Battered Chest (75293)
-- --------------------------------------------------------------------------------------------------

-- One chest in the north, three in the south.
UPDATE `pool_template` SET `max_limit`=3, `description`='Wailing Caverns - Large Battered Chest (South)' WHERE `entry`=254;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(419, 1, 'Wailing Caverns - Large Battered Chest (North)', 0, 0, 0, 10);
UPDATE `pool_gameobject` SET `pool_entry`=419 WHERE `guid` IN (288, 31999);

-- --------------------------------------------------------------------------------------------------
-- Gameobjects: Herbs (1619, 1622, 1624, 2041)
-- --------------------------------------------------------------------------------------------------

-- A fixed number per herb.
UPDATE `pool_template` SET `max_limit`=6, `description`='Wailing Caverns - Earthroot' WHERE `entry`=1053;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(422, 1, 'Wailing Caverns - Bruiseweed', 0, 0, 0, 10),
(424, 2, 'Wailing Caverns - Kingsblood', 0, 0, 0, 10),
(985, 1, 'Wailing Caverns - Liferoot', 0, 0, 0, 10);
UPDATE `pool_gameobject` SET `pool_entry`=422 WHERE `guid` IN (35633, 68489, 68950);
UPDATE `pool_gameobject` SET `pool_entry`=424 WHERE `guid` IN (154, 35592, 35642, 58403, 58404, 58405, 58406, 58824);
UPDATE `pool_gameobject` SET `pool_entry`=985 WHERE `guid` IN (31992, 58673, 58674);

-- --------------------------------------------------------------------------------------------------
-- Gameobjects: Tin Vein (1732), Silver Vein (1733)
-- --------------------------------------------------------------------------------------------------

-- Three of five points. The other four points never hold a vein.
UPDATE `pool_template` SET `max_limit`=3 WHERE `entry`=4791;
DELETE FROM `pool_gameobject` WHERE `pool_entry` IN (407, 2274, 2275, 2276);
DELETE FROM `pool_pool` WHERE `pool_id` IN (407, 2274, 2275, 2276);
DELETE FROM `pool_template` WHERE `entry` IN (407, 2274, 2275, 2276);
DELETE FROM `gameobject` WHERE `guid` IN (206, 207, 3036, 3037, 3038, 3039, 3040, 3041);

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
