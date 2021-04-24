DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210115202724');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210115202724');
-- Add your query below.

-- Delete texts from custom table.
DELETE FROM `script_texts` WHERE `entry` IN (-1289000, -1289001);

-- Text yelled on spawn.
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=7145;

-- Source health above 3 percent.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (17950, 41, 3, 1, 0, 0, 2);

-- Delete custom creatures.
DELETE FROM `creature_ai_scripts` WHERE `id` IN (3000001, 3000101, 3000201, 3000301, 3000401, 3000501);
DELETE FROM `creature_ai_events` WHERE `creature_id` IN (30000, 30001, 30002, 30003, 30004, 30005);
DELETE FROM `creature_template` WHERE `entry` IN (30000, 30001, 30002, 30003, 30004, 30005);

-- Events list for Darkmaster Gandling
DELETE FROM `creature_ai_events` WHERE `creature_id`=1853;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (185301, 1853, 0, 11, 0, 100, 0, 0, 0, 0, 0, 185301, 0, 0, 'Darkmaster Gandling - Yell on Spawn');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (185302, 1853, 0, 21, 0, 100, 0, 0, 0, 0, 0, 185302, 0, 0, 'Darkmaster Gandling - Set Data on Reached Home');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (185303, 1853, 0, 6, 0, 100, 0, 0, 0, 0, 0, 185303, 0, 0, 'Darkmaster Gandling - Set Data on Death');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (185304, 1853, 17950, 0, 0, 100, 1, 16000, 16000, 20000, 35000, 185304, 0, 0, 'Darkmaster Gandling - Cast Shadow Portal in Combat');
DELETE FROM `creature_ai_scripts` WHERE `id`=185301;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (185301, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7145, 0, 0, 0, 0, 0, 0, 0, 0, 'Darkmaster Gandling - Say Text');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (185301, 0, 15, 26200, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 110, 'Darkmaster Gandling - Cast Spell Christmas Darkmaster Gandling');
DELETE FROM `creature_ai_scripts` WHERE `id`=185302;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (185302, 0, 37, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Darkmaster Gandling - Set Data Gandling to Fail');
DELETE FROM `creature_ai_scripts` WHERE `id`=185303;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (185303, 0, 37, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Darkmaster Gandling - Set Data Gandling to Done');
DELETE FROM `creature_ai_scripts` WHERE `id`=185304;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (185304, 0, 15, 17950, 2, 0, 0, 0, 259, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Darkmaster Gandling - Cast Shadow Portal');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (18530, 'Scholomance - Darkmaster Gandling', 15790, 100, 1, 0, 0, 0, 4, 5, 6, 20, 0, 12040, 100, 0, 0, 0, 0, 12, 20, 14, 28, 0, 18702, 100, 1, 0, 0, 0, 15, 27, 15, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `spell_list_id`=18530, `ai_name`='EventAI', `script_name`='' WHERE `entry`=1853;

-- Positions for Shadow Portal spells.
INSERT INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES (17863, 289, 274.877, 1.33366, 85.3117, 3.22886);
INSERT INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES (17939, 289, 182.246, -95.4371, 85.3117, 1.5694);
INSERT INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES (17943, 289, 86.6634, -1.96039, 85.3117, 0.017453);
INSERT INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES (17944, 289, 265.956, 0.903429, 75.3334, 3.07178);
INSERT INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES (17946, 289, 178.724, -91.0232, 70.8568, 1.64061);
INSERT INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES (17948, 289, 103.305, -1.67752, 75.2183, 6.17846);

-- Shadow Portal 17863
-- Lorekeeper Polkelt
-- event 5618
-- door guid 43196

INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (5608, 47, 5618, 121, 0, 0, 0);
DELETE FROM `event_scripts` WHERE `id`=5618;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5618, 0, 61, 5618, 300, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadow Portal Polkelt: Start Scripted Map Event');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5618, 1, 80, 1, 0, 0, 0, 43196, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadow Portal Polkelt: Door - Close');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5618, 2, 10, 11598, 300000, 0, 0, 0, 0, 0, 0, 0, 5618, -1, 1, 256.289, 0.652, 84.924, 4.765, 0, 'Shadow Portal Polkelt: Summon Risen Guardian');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5618, 2, 10, 11598, 300000, 0, 0, 0, 0, 0, 0, 0, 5618, -1, 1, 241.345, 4.231, 84.924, 5.062, 0, 'Shadow Portal Polkelt: Summon Risen Guardian');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5618, 2, 10, 11598, 300000, 0, 0, 0, 0, 0, 0, 0, 5618, -1, 1, 249.715, -5.978, 85.106, 3.177, 0, 'Shadow Portal Polkelt: Summon Risen Guardian');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5618, 2, 10, 11598, 300000, 0, 0, 0, 0, 0, 0, 0, 5618, -1, 1, 230.05, -9.946, 85.317, 5.847, 0, 'Shadow Portal Polkelt: Summon Risen Guardian');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5618, 3, 69, 5618, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5608, 5608, 0, 0, 0, 0, 0, 'Shadow Portal Polkelt: Edit Map Event');
DELETE FROM `generic_scripts` WHERE `id`=5608;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5608, 0, 80, 0, 0, 0, 0, 43196, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadow Portal Polkelt: Door - Open');
DELETE FROM `generic_scripts` WHERE `id`=5618;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5618, 0, 63, 5618, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadow Portal Polkelt: Risen Guardian - Add to Map Event');

-- Shadow Portal 17939
-- Doctor Theolen Krastinov
-- event 5619
-- door guid 43203

INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (5609, 47, 5619, 121, 0, 0, 0);
DELETE FROM `event_scripts` WHERE `id`=5619;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5619, 0, 61, 5619, 300, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadow Portal Krastinov: Start Scripted Map Event');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5619, 1, 80, 1, 0, 0, 0, 43203, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadow Portal Krastinov: Door - Close');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5619, 2, 10, 11598, 300000, 0, 0, 0, 0, 0, 0, 0, 5619, -1, 1, 180.707, -75.818, 84.925, 1.396, 0, 'Shadow Portal Krastinov: Summon Risen Guardian');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5619, 2, 10, 11598, 300000, 0, 0, 0, 0, 0, 0, 0, 5619, -1, 1, 185.689, -64.627, 84.925, 5.55, 0, 'Shadow Portal Krastinov: Summon Risen Guardian');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5619, 2, 10, 11598, 300000, 0, 0, 0, 0, 0, 0, 0, 5619, -1, 1, 175.7, -55.238, 85.229, 4.772, 0, 'Shadow Portal Krastinov: Summon Risen Guardian');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5619, 3, 69, 5619, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5609, 5609, 0, 0, 0, 0, 0, 'Shadow Portal Krastinov: Edit Map Event');
DELETE FROM `generic_scripts` WHERE `id`=5609;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5609, 0, 80, 0, 0, 0, 0, 43203, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadow Portal Krastinov: Door - Open');
DELETE FROM `generic_scripts` WHERE `id`=5619;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5619, 0, 63, 5619, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadow Portal Krastinov: Risen Guardian - Add to Map Event');

-- Shadow Portal 17943
-- Instructor Malicia
-- event 5620
-- door guid 43184

INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (5610, 47, 5620, 121, 0, 0, 0);
DELETE FROM `event_scripts` WHERE `id`=5620;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5620, 0, 61, 5620, 300, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadow Portal Malicia: Start Scripted Map Event');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5620, 1, 80, 1, 0, 0, 0, 43184, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadow Portal Malicia: Door - Close');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5620, 2, 10, 11598, 300000, 0, 0, 0, 0, 0, 0, 0, 5620, -1, 1, 123.306, 3.933, 85.312, 6.056, 0, 'Shadow Portal Malicia: Summon Risen Guardian');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5620, 2, 10, 11598, 300000, 0, 0, 0, 0, 0, 0, 0, 5620, -1, 1, 110.892, -6.463, 85.312, 0.436, 0, 'Shadow Portal Malicia: Summon Risen Guardian');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5620, 2, 10, 11598, 300000, 0, 0, 0, 0, 0, 0, 0, 5620, -1, 1, 102.454, 4.374, 85.312, 2.182, 0, 'Shadow Portal Malicia: Summon Risen Guardian');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5620, 3, 69, 5620, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5610, 5610, 0, 0, 0, 0, 0, 'Shadow Portal Malicia: Edit Map Event');
DELETE FROM `generic_scripts` WHERE `id`=5610;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5610, 0, 80, 0, 0, 0, 0, 43184, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadow Portal Malicia: Door - Open');
DELETE FROM `generic_scripts` WHERE `id`=5620;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5620, 0, 63, 5620, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadow Portal Malicia: Risen Guardian - Add to Map Event');

-- Shadow Portal 17944
-- Lady Illucia Barov
-- event 5621
-- door guid 35798

INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (5611, 47, 5621, 121, 0, 0, 0);
DELETE FROM `event_scripts` WHERE `id`=5621;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5621, 0, 61, 5621, 300, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadow Portal Illucia: Start Scripted Map Event');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5621, 1, 80, 1, 0, 0, 0, 35798, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadow Portal Illucia: Door - Close');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5621, 2, 10, 11598, 300000, 0, 0, 0, 0, 0, 0, 0, 5621, -1, 1, 239.556, -4.945, 72.674, 1.4525, 0, 'Shadow Portal Illucia: Summon Risen Guardian');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5621, 2, 10, 11598, 300000, 0, 0, 0, 0, 0, 0, 0, 5621, -1, 1, 226.854, 0.262, 72.673, 3.161, 0, 'Shadow Portal Illucia: Summon Risen Guardian');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5621, 2, 10, 11598, 300000, 0, 0, 0, 0, 0, 0, 0, 5621, -1, 1, 248.115, 2.809, 72.669, 4.668, 0, 'Shadow Portal Illucia: Summon Risen Guardian');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5621, 3, 69, 5621, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5611, 5611, 0, 0, 0, 0, 0, 'Shadow Portal Illucia: Edit Map Event');
DELETE FROM `generic_scripts` WHERE `id`=5611;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5611, 0, 80, 0, 0, 0, 0, 35798, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadow Portal Illucia: Door - Open');
DELETE FROM `generic_scripts` WHERE `id`=5621;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5621, 0, 63, 5621, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadow Portal Illucia: Risen Guardian - Add to Map Event');

-- Shadow Portal 17946
-- Lord Alexei Barov
-- event 5622
-- door guid 43188

INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (5612, 47, 5622, 121, 0, 0, 0);
DELETE FROM `event_scripts` WHERE `id`=5622;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5622, 0, 61, 5622, 300, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadow Portal Alexei: Start Scripted Map Event');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5622, 1, 80, 1, 0, 0, 0, 43188, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadow Portal Alexei: Door - Close');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5622, 2, 10, 11598, 300000, 0, 0, 0, 0, 0, 0, 0, 5622, -1, 1, 185.616, -42.912, 75.4812, 4.45059, 0, 'Shadow Portal Alexei: Summon Risen Guardian');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5622, 2, 10, 11598, 300000, 0, 0, 0, 0, 0, 0, 0, 5622, -1, 1, 177.746, -42.7475, 75.4812, 4.88692, 0, 'Shadow Portal Alexei: Summon Risen Guardian');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5622, 2, 10, 11598, 300000, 0, 0, 0, 0, 0, 0, 0, 5622, -1, 1, 181.825, -42.5812, 75.4812, 4.66003, 0, 'Shadow Portal Alexei: Summon Risen Guardian');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5622, 3, 69, 5622, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5612, 5612, 0, 0, 0, 0, 0, 'Shadow Portal Alexei: Edit Map Event');
DELETE FROM `generic_scripts` WHERE `id`=5612;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5612, 0, 80, 0, 0, 0, 0, 43188, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadow Portal Alexei: Door - Open');
DELETE FROM `generic_scripts` WHERE `id`=5622;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5622, 0, 63, 5622, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadow Portal Alexei: Risen Guardian - Add to Map Event');

-- Shadow Portal 17948
-- The Ravenian
-- event 5623
-- door guid 43187

INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (5613, 47, 5623, 121, 0, 0, 0);
DELETE FROM `event_scripts` WHERE `id`=5623;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5623, 0, 61, 5623, 300, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadow Portal Ravenian: Start Scripted Map Event');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5623, 1, 80, 1, 0, 0, 0, 43187, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadow Portal Ravenian: Door - Close');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5623, 2, 10, 11598, 300000, 0, 0, 0, 0, 0, 0, 0, 5623, -1, 1, 128.806, -7.874, 75.482, 5.62, 0, 'Shadow Portal Ravenian: Summon Risen Guardian');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5623, 2, 10, 11598, 300000, 0, 0, 0, 0, 0, 0, 0, 5623, -1, 1, 130.415, -1.113, 75.482, 2.688, 0, 'Shadow Portal Ravenian: Summon Risen Guardian');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5623, 2, 10, 11598, 300000, 0, 0, 0, 0, 0, 0, 0, 5623, -1, 1, 124.162, 5.816, 75.482, 5.061, 0, 'Shadow Portal Ravenian: Summon Risen Guardian');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5623, 3, 69, 5623, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5613, 5613, 0, 0, 0, 0, 0, 'Shadow Portal Ravenian: Edit Map Event');
DELETE FROM `generic_scripts` WHERE `id`=5613;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5613, 0, 80, 0, 0, 0, 0, 43187, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadow Portal Ravenian: Door - Open');
DELETE FROM `generic_scripts` WHERE `id`=5623;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5623, 0, 63, 5623, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadow Portal Ravenian: Risen Guardian - Add to Map Event');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
