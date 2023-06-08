DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230604191452');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230604191452');
-- Add your query below.

-- 237: No player alive within 100 yards.
INSERT `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `flags`) VALUES
(              239,     56,        0,      100,       1);

-- Sniffs reveal an extra DarkIronDwarfRune outside the room, hidden beneath the floor and not visible to players. It is also activated during the fight.
INSERT `gameobject`
(`guid`,   `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(397204, 175187,   229,       144.37,     -299.198,      91.4701,             0,           0,           0,           0,           1,                 25,                 25,            100,       1,             0,                0,           0,          10);

-- Event Start Script
DELETE FROM `scripted_event_id` WHERE `id` = 4884;
DELETE FROM `event_scripts` WHERE `id` = 4884;
INSERT `event_scripts`
(`id`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_type`, `target_param1`, `target_param2`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `comments`) VALUES
(4884,        61,       4884,        1200,           0,           0,             0,               0,               0,            0,         0,      48841,        239,      48842, 'Emberseer Start - Start Map Event'),
(4884,        80,          1,           0,           0,           0,            12,          260283,               0,            0,         0,          0,          0,          0, 'Emberseer Start - Close Emberseer In'),
(4884,        80,          1,           0,           0,           0,            12,          260284,               0,            0,         0,          0,          0,          0, 'Emberseer Start - Close Doors'),
(4884,        68,     103162,           2,       10316,          50,             0,               0,               0,            0,         0,          0,          0,          0, 'Emberseer Start - Start Script on Incarcerators'),
(4884,        44,          2,           0,           0,           0,             8,            9816,              30,         0x02,       100,          0,          0,          0, 'Emberseer Start - Start Phase 2 on Pyroguard Emberseer');

-- Success Script for Scripted Map Event
INSERT `generic_scripts`
( `id`, `command`, `datalong`, `datalong2`, `dataint`, `comments`) VALUES
(48841,        39,     175270,           0,       100, 'Emberseer Event - Ready Runes'),
(48841,        39,     175705,           0,       100, 'Emberseer Event - Open Doors'),
(48841,        11,     261637,           0,         0, 'Emberseer Event - Open Emberseer Out'),
(48841,        37,          1,           3,         0, 'Emberseer Event - Set Instance Data (Encounter Done)');

-- Fail Script for Scripted Map Event
INSERT `generic_scripts`
( `id`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_type`, `target_param1`, `target_param2`, `data_flags`, `dataint`, `comments`) VALUES
(48842,        71,          1,           0,           0,           0,             8,            9816,              30,         0x02,         0, 'Emberseer Event - Respawn Pyroguard Emberseer'),
(48842,        68,     103163,           2,       10316,         100,             0,               0,               0,            0,         0, 'Emberseer Event - Respawn Dead Blackhand Incarcerators'),
(48842,        39,     175270,           0,           0,           0,             0,               0,               0,            0,       100, 'Emberseer Event - Ready Runes'),
(48842,        39,     175705,           0,           0,           0,             0,               0,               0,            0,       100, 'Emberseer Event - Open Doors');

-- Dark Iron Dwarf Rune (West) Script (Entry: 175266 Guid: 397215)
INSERT `generic_scripts`
(  `id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `comments`) VALUES
(175266,       0,        13,          0,           0,           0, 'DarkIronDwarfRune (West) - Activate'),
(175266,       1,         4,          9,  0x00000001,           2, 'DarkIronDwarfRune (West) - Remove In Use Flag');

-- Dark Iron Dwarf Rune (Rest) Script
INSERT `generic_scripts`
(  `id`, `command`, `comments`) VALUES
(175267,        80, 'DarkIronDwarfRune (Rest) - Set State Active');

-- Dark Iron Dwarf Rune (All) Scripts
INSERT `generic_scripts`
(  `id`, `command`, `datalong`, `target_type`, `target_param1`, `dataint`, `comments`) VALUES
(175268,        80,          1,             0,               0,         0, 'DarkIronDwarfRune - Set State Ready'),
(175270,        87,     175268,            12,          397215,       100, 'Ready DarkIronDwarfRune (West)'),
(175270,        39,     175268,            12,          397218,       100, 'Ready DarkIronDwarfRune (South-West)'),
(175270,        39,     175268,            12,          397210,       100, 'Ready DarkIronDwarfRune (North-West)'),
(175270,        39,     175268,            12,          397219,       100, 'Ready DarkIronDwarfRune (South)'),
(175270,        39,     175268,            12,          397208,       100, 'Ready DarkIronDwarfRune (North)'),
(175270,        39,     175268,            12,          397220,       100, 'Ready DarkIronDwarfRune (South-East)'),
(175270,        39,     175268,            12,          397203,       100, 'Ready DarkIronDwarfRune (North-East)'),
(175270,        39,     175268,            12,          397204,       100, 'Ready DarkIronDwarfRune (Hidden)');

-- Emberseer In (Entry: 175244 Guid: 260283) and Doors (Entry: 175705 Guid: 260284) Open Script
INSERT `generic_scripts`
(  `id`, `command`, `target_type`, `target_param1`, `comments`) VALUES
(175705,        80,            12,          260283, 'Emberseer In - Open'),
(175705,        80,            12,          260284, 'Doors - Open');

-- Correct single incorrect Blackhand Incarcerator position.
UPDATE `creature` SET `position_x` = 162.327, `position_y` = -276.759, `position_z` = 91.6961, `orientation` = 2.32129 WHERE `guid` = 40452;

-- Events list for Pyroguard Emberseer
INSERT `creature_ai_events`
(  `id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_param1`, `event_param2`, `action1_script`, `comment`) VALUES
(981601,          9816,            1,                          0,              0,              0,           981601, 'Pyroguard Emberseer - Out of Combat'),
(981602,          9816,            1,                        0x2,           5000,           5000,           981602, 'Pyroguard Emberseer - Out of Combat (Phase 2 Growth 1)'),
(981603,          9816,            1,                        0x2,          35000,          35000,           981603, 'Pyroguard Emberseer - Out of Combat (Phase 2 Growth 2)'),
(981604,          9816,            1,                        0x2,          65000,          65000,           981604, 'Pyroguard Emberseer - Out of Combat (Phase 2 Growth 3)'),
(981605,          9816,            1,                        0x6,           1000,           1000,           981605, 'Pyroguard Emberseer - Out of Combat (Phase 3 Yell)'),
(981606,          9816,            1,                        0x6,           3000,           3000,           981606, 'Pyroguard Emberseer - Out of Combat (Phase 3 Attack Start)'),
(981607,          9816,            6,                          0,              0,              0,           981607, 'Pyroguard Emberseer - Death');
INSERT `creature_ai_scripts`
(  `id`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `target_type`, `target_param1`, `dataint`, `comments`) VALUES
(981601,          0,        44,          1,           0,           0,             0,               0,         0, 'Pyroguard Emberseer - Start Phase 1'),
(981601,          0,         4,         46,  0x02000140,           1,             0,               0,         0, 'Pyroguard Emberseer - Set Immune Flags'),
(981602,          0,        14,      15282,           0,           0,             0,               0,         0, 'Pyroguard Emberseer - Remove Encaged Emberseer'),
(981602,          0,        15,      16048,       0x002,           0,             6,               0,         0, 'Pyroguard Emberseer - Cast Emberseer Growing'),
(981602,          0,        15,      16245,       0x002,           0,             6,               0,         0, 'Pyroguard Emberseer - Cast Freeze Anim'),
(981602,          0,         0,          2,           0,           0,             0,               0,      5565, 'Pyroguard Emberseer - Growth Text 1'),
(981603,          0,         0,          2,           0,           0,             0,               0,      5566, 'Pyroguard Emberseer - Growth Text 2'),
(981604,          0,         0,          2,           0,           0,             0,               0,      5567, 'Pyroguard Emberseer - Growth Text 3'),
(981604,          0,        14,      16245,           0,           0,             0,               0,         0, 'Pyroguard Emberseer - Remove Freeze Anim'),
(981604,          0,        15,      16047,       0x002,           0,             6,               0,         0, 'Pyroguard Emberseer - Cast Emberseer Full Strength'),
(981604,          0,        39,     175266,           0,           0,            12,          397215,       100, 'Pyroguard Emberseer - Activate DarkIronDwarfRune (West)'),
(981604,          0,        39,     175267,           0,           0,            12,          397218,       100, 'Pyroguard Emberseer - Activate DarkIronDwarfRune (South-West)'),
(981604,          0,        39,     175267,           0,           0,            12,          397210,       100, 'Pyroguard Emberseer - Activate DarkIronDwarfRune (North-West)'),
(981604,          0,        39,     175267,           0,           0,            12,          397219,       100, 'Pyroguard Emberseer - Activate DarkIronDwarfRune (South)'),
(981604,          0,        39,     175267,           0,           0,            12,          397208,       100, 'Pyroguard Emberseer - Activate DarkIronDwarfRune (North)'),
(981604,          0,        39,     175267,           0,           0,            12,          397220,       100, 'Pyroguard Emberseer - Activate DarkIronDwarfRune (South-East)'),
(981604,          0,        39,     175267,           0,           0,            12,          397203,       100, 'Pyroguard Emberseer - Activate DarkIronDwarfRune (North-East)'),
(981604,          0,        39,     175267,           0,           0,            12,          397204,       100, 'Pyroguard Emberseer - Activate DarkIronDwarfRune (Hidden)'),
(981604,          0,        44,          3,           0,           0,             0,               0,         0, 'Pyroguard Emberseer - Start Phase 3'),
(981605,          0,         0,          1,           0,           0,             0,               0,      5268, 'Pyroguard Emberseer - Yell'),
(981606,          0,         4,         46,  0x02000100,           2,             0,               0,         0, 'Pyroguard Emberseer - Remove Immune Flags'),
(981606,          0,        22,        754,           2,           0,             0,               0,         0, 'Pyroguard Emberseer - Change Faction'),
(981606,          1,        49,          1,           0,           0,             0,               0,         0, 'Pyroguard Emberseer - Combat Pulse'),
(981607,          0,        62,       4884,           1,           0,             0,               0,         0, 'Pyroguard Emberseer - End Map Event (Success)');
INSERT `creature_spells`
(`entry`, `name`,                `spellId_1`, `probability_1`, `castTarget_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `spellId_2`, `probability_2`, `castTarget_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`) VALUES
(  98160, 'Pyroguard Emberseer',       16079,             100,              0,                  15,                  16,                 11,                 11,       16536,             100,              1,                   3,                  11,                  4,                 10);
UPDATE `creature_template` SET `ai_name` = 'EventAI', `auras` = '13377 15282', `script_name` = '', `spell_list_id` = 98160 WHERE `entry` = 9816;

-- Events list for Blackhand Incarcerator
INSERT `creature_ai_events`
(   `id`, `creature_id`, `event_type`, `event_param1`, `action1_script`, `comment`) VALUES
(1031601,         10316,           11,              0,          1031601, 'Blackhand Incarcerator - Spawn'),
(1031602,         10316,            1,              0,          1031602, 'Blackhand Incarcerator - Out of Combat'),
(1031603,         10316,            2,             15,          1031603, 'Blackhand Incarcerator - 15% Health');
INSERT `creature_ai_scripts`
(   `id`, `command`, `datalong`, `target_type`, `target_param1`, `target_param2`, `dataint`, `comments`) VALUES
(1031601,        39,     103161,             0,               0,               0,       100, 'Blackhand Incarcerator - Set Immune Flags'),
(1031602,        15,      15281,             8,            9816,              30,         0, 'Blackhand Incarcerator - Cast Encage Emberseer'),
(1031603,        47,          0,             0,               0,               0,         0, 'Blackhand Incarcerator - Flee');
INSERT `creature_spells`
(`entry`, `name`,                   `spellId_1`, `castTarget_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `spellId_2`, `castTarget_2`, `targetParam1_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`) VALUES
( 103160, 'Blackhand Incarcerator',       15580,              1,                   6,                  12,                  7,                 18,       16045,              4,            0x001,         0x002,                   6,                  25,                 16,                 30);
UPDATE `creature_template` SET `ai_name` = 'EventAI', `script_name` = '', `spell_list_id` = 103160 WHERE `entry` = 10316;
INSERT `generic_scripts`
(  `id`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `dataint`, `comments`) VALUES
(103161,          0,         4,         46,  0x00000300,           1,         0, 'Blackhand Incarcerator - Set Immune Flags'),
(103162,          0,         4,         46,  0x00000300,           2,         0, 'Blackhand Incarcerator - Remove Immune Flags'),
(103162,          1,        49,          1,           0,           0,         0, 'Blackhand Incarcerator - Combat Pulse'),
(103163,          0,        39,     103161,           0,           0,       100, 'Blackhand Incarcerator - Set Immune Flags'),
(103163,          0,        71,          0,           0,           0,         0, 'Blackhand Incarcerator - Respawn');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
