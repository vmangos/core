DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210717172913');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210717172913');
-- Add your query below.


-- Defias Night Blade
DELETE FROM `creature_ai_scripts` WHERE `id` IN (90901);
DELETE FROM `creature_ai_events` WHERE `id`=90901;
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (9090, 'Duskwood - Defias Night Blade', 2589, 100, 1, 0, 0, 0, 3, 12, 3, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `auras` = '8601' WHERE `entry` = 909;

-- Dragonmaw Shadowwarder
DELETE FROM `creature_ai_scripts` WHERE `id` IN (103802);
DELETE FROM `creature_ai_events` WHERE `id`=103802;
UPDATE `creature_template` SET `auras` = '643' WHERE `entry` = 1038;

-- Negolash
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (149401, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 731, 0, 0, 0, 0, 0, 0, 0, 0, 'Negolash - Talk');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (149401, 1494, 0, 1, 0, 100, 1, 3000, 10000, 420000, 900000, 149401, 0, 0, 'Negolash - Talk - OOC');
UPDATE `creature_template` SET `auras` = '7095', `ai_name`='EventAI' WHERE `entry` = 1494;

-- Webwood Spider
UPDATE `creature_template` SET `auras` = '6752' WHERE `entry` = 1986;

-- Gazban
UPDATE `creature_template` SET `auras` = '6523' WHERE `entry` = 2624;

-- Shadra
UPDATE `creature_template` SET `auras` = '8601 13299' WHERE `entry` = 2707;

-- Mangy Silvermane
UPDATE `creature_template` SET `auras` = '18847' WHERE `entry` = 2923;

-- Fardel Dabyrie
DELETE FROM `creature_ai_scripts` WHERE `id` IN (447901);
DELETE FROM `creature_ai_events` WHERE `id`=447901;
UPDATE `creature_template` SET `auras` = '8876 10022', `ai_name`='' WHERE `entry` = 4479;

-- Old Serra'kis
UPDATE `creature_template` SET `auras` = '8434' WHERE `entry` = 4830;

-- Nightmare Scalebane
UPDATE `creature_template` SET `auras` = '12099' WHERE `entry` = 5277;

-- Warugs Target Dummy
UPDATE `creature_template` SET `auras` = '4048' WHERE `entry` = 5723;

-- Lord Azrethoc
UPDATE `creature_template` SET `auras` = '7974 15097' WHERE `entry` = 5760;

-- Ashmane Boar
DELETE FROM `creature_ai_scripts` WHERE `id` IN (599201);
DELETE FROM `creature_ai_events` WHERE `id`=599201;
UPDATE `creature_template` SET `auras` = '11966 12898' WHERE `entry` = 5992;

-- Bloodpetal Thresher
DELETE FROM `creature_ai_scripts` WHERE `id` IN (651101);
DELETE FROM `creature_ai_events` WHERE `id`=651101;
UPDATE `creature_template` SET `auras` = '8876 14111', `ai_name`='' WHERE `entry` = 6511;

-- Sandfury Guardian
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (72680, 'Zul\'Farrak - Sandfury Guardian', 3391, 100, 0, 0, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `auras` = '7276' WHERE `entry` = 7268;

-- Withered Spearhide
UPDATE `creature_template` SET `auras` = '12246' WHERE `entry` = 7332;

-- Plaguemaw the Rotting
UPDATE `creature_template` SET `auras` = '12947' WHERE `entry` = 7356;

-- Diseased Flayer
DELETE FROM `creature_ai_scripts` WHERE `id` IN (853202);
DELETE FROM `creature_ai_events` WHERE `id`=853202;
UPDATE `creature_template` SET `auras` = '8876 12539' WHERE `entry` = 8532;

-- Stitched Horror
UPDATE `creature_template` SET `auras` = '14775' WHERE `entry` = 8543;

-- Dark Adept
UPDATE `creature_template` SET `auras` = '3417' WHERE `entry` = 8546;

-- Dreadlord
UPDATE `creature_template` SET `auras` = '20809' WHERE `entry` = 8716;

-- Molten War Golem
UPDATE `creature_template` SET `auras` = '13377 15506' WHERE `entry` = 8908;

-- Hedrum the Creeper
UPDATE `creature_template` SET `auras` = '13767' WHERE `entry` = 9032;

-- Plague Ghoul
UPDATE `creature_template` SET `auras` = '15088 15097 18950' WHERE `entry` = 10405;

-- Crypt Beast
UPDATE `creature_template` SET `auras` = '16428' WHERE `entry` = 10413;

-- Syndicate Rogue
UPDATE `creature_template` SET `auras` = '7276' WHERE `entry` = 2260;

-- Syndicate Watchman
UPDATE `creature_template` SET `auras` = '3582' WHERE `entry` = 2261;

-- Jailor Eston
UPDATE `creature_template` SET `auras` = '3582' WHERE `entry` = 2427;

-- Dark Strand Excavator
UPDATE `creature_template` SET `auras` = '3582' WHERE `entry` = 3730;

-- Sloth
DELETE FROM `creature_spells` WHERE `entry`=24750;
UPDATE `creature_template` SET `auras` = '3509', `spell_list_id`=0 WHERE `entry` = 2475;

-- Sludge
DELETE FROM `creature_spells` WHERE `entry`=24790;
UPDATE `creature_template` SET `auras` = '3512', `spell_list_id`=0 WHERE `entry` = 2479;

-- Stone Behemoth / Cracked Golem
UPDATE `creature_template` SET `auras` = '5811' WHERE `entry` IN (2156, 2157);

-- Giant Ashenvale Bear / Elder Ashenvale Bear
DELETE FROM `creature_ai_scripts` WHERE `id` IN (381001, 381101);
DELETE FROM `creature_ai_events` WHERE `creature_id` IN (3810, 3811);
UPDATE `creature_template` SET `auras` = '6923', `ai_name`='' WHERE `entry` IN (3810, 3811);

-- Legashi Rogue
UPDATE `creature_template` SET `auras` = '7276' WHERE `entry` = 6201;

-- Blackened Ancient
UPDATE `creature_template` SET `auras` = '7999' WHERE `entry` = 4029;

-- Pesterhide Hyena
UPDATE `creature_template` SET `auras` = '8247' WHERE `entry` = 4248;

-- Irradiated Pillager / Irradiated Invader
DELETE FROM `creature_ai_scripts` WHERE `id` IN (621301, 632901);
DELETE FROM `creature_ai_events` WHERE `id` IN (621301, 632901);
DELETE FROM `creature_spells` WHERE `entry` IN (62130, 63290);
UPDATE `creature_template` SET `auras` = '9769 21862', `spell_list_id`=0 WHERE `entry` IN (6213, 6329);

-- Ramstein the Gorger
UPDATE `creature_template` SET `auras` = '15088' WHERE `entry` = 10439;

-- Wildspawn Shadowstalker
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1145601, 1145602, 1145603, 1145604);
DELETE FROM `creature_ai_events` WHERE `creature_id`=11456;
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (114560, 'Dire Maul - Wildspawn Shadowstalker', 22416, 100, 1, 0, 0, 0, 0, 0, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `auras` = '8601 18950 22766', `spell_list_id`=0, `ai_name`='' WHERE `entry` = 11456;

-- Magrami Spectre
UPDATE `creature_template` SET `auras` = '17327' WHERE `entry` = 11560;

-- Whirlwind Stormwalker
UPDATE `creature_template` SET `auras` = '18148' WHERE `entry` = 11577;

-- Putridus Satyr
UPDATE `creature_template` SET `auras` = '21061' WHERE `entry` = 11790;

-- Lava Elemental
UPDATE `creature_template` SET `auras` = '19640' WHERE `entry` = 12076;

-- Lava Elemental
UPDATE `creature_template` SET `auras` = '8876 15733' WHERE `entry` = 12099;

-- Eris Havenfire
UPDATE `creature_template` SET `auras` = '23196 23199' WHERE `entry` = 14494;

-- Hakkar
UPDATE `creature_template` SET `auras` = '19818' WHERE `entry` = 14834;

-- Voodoo Spirit
UPDATE `creature_template` SET `auras` = '24051' WHERE `entry` = 15009;

-- Spawn of Mar'li
DELETE FROM `creature_ai_events` WHERE `creature_id`=15041;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1504101, 15041, 0, 0, 0, 100, 0, 4000, 12000, 0, 0, 1504101, 0, 0, 'Spawn of Mar\'li - Cast Poison in Combat');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1504102, 15041, 0, 23, 0, 100, 0, 24086, 10, 0, 0, 1504102, 0, 0, 'Spawn of Mar\'li - Cast Full Grown on 10 stacks of Growth');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1504103, 15041, 0, 27, 0, 100, 1, 24087, 1, 20000, 20000, 1504103, 0, 0, 'Spawn of Mar\'li - Cast Growth on Aura Missing');
DELETE FROM `creature_ai_scripts` WHERE `id`=1504101;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1504101, 0, 15, 19448, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spawn of Mar\'li - Cast Spell Poison');
DELETE FROM `creature_ai_scripts` WHERE `id`=1504102;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1504102, 0, 15, 24088, 34, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spawn of Mar\'li - Cast Spell Full Grown');
DELETE FROM `creature_ai_scripts` WHERE `id`=1504103;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1504103, 0, 15, 24087, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spawn of Mar\'li - Cast Spell Growth');
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name`='' WHERE `entry` = 15041;

-- Vekniss Soldier
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1522904);
DELETE FROM `creature_ai_events` WHERE `id`=1522904;
UPDATE `creature_template` SET `auras` = '25801' WHERE `entry` = 15229;

-- Spirit Shade
UPDATE `creature_template` SET `auras` = '24313' WHERE `entry` = 15261;

-- Hive'Zara Sandstalker
UPDATE `creature_template` SET `auras` = '25592' WHERE `entry` = 15323;

-- Ossirian the Unscarred
UPDATE `creature_template` SET `auras` = '19818 25176' WHERE `entry` = 15339;

-- The Master's Eye
UPDATE `creature` SET `position_x`=-8953.3, `position_y`=1233.64, `position_z`=-99.718, `orientation`=5.3058 WHERE `guid`=88072;
UPDATE `creature_template` SET `auras`='18430', `ai_name`='NullAI', `script_name`='', `flags_extra`= `flags_extra` | 64 WHERE `entry` = 15963;

-- Patchwork Golem
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1601703);
DELETE FROM `creature_ai_events` WHERE `id`=1601703;
UPDATE `creature_template` SET `auras` = '27793' WHERE `entry` = 16017;

-- Sludge Belcher
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1602903);
DELETE FROM `creature_ai_events` WHERE `creature_id`=16029;
UPDATE `creature_template` SET `auras` = '28362', `ai_name`='' WHERE `entry` = 16029;

-- Annalise Lerent
UPDATE `creature_template` SET `auras` = '10848' WHERE `entry` = 16110;

-- Unrelenting Rider
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1612601);
DELETE FROM `creature_ai_events` WHERE `creature_id`=16126;
UPDATE `creature_template` SET `auras` = '27987', `ai_name`='' WHERE `entry` = 16126;

-- Soldier of the Frozen Wastes
UPDATE `creature_template` SET `auras` = '28458' WHERE `entry` = 16427;

-- Soul Weaver
UPDATE `creature_template` SET `auras` = '28460' WHERE `entry` = 16429;

-- Blizzard
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1647401);
DELETE FROM `creature_ai_events` WHERE `creature_id`=16474;
UPDATE `creature_template` SET `auras` = '28534', `ai_name`='' WHERE `entry` = 16474;

-- Void Zone
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1669701);
DELETE FROM `creature_ai_events` WHERE `creature_id`=16697;
UPDATE `creature_template` SET `auras` = '28874', `ai_name`='' WHERE `entry` = 16697;

-- Sapphiron's Wing Buffet
UPDATE `creature_template` SET `auras` = '29327', `ai_name`='NullAI', `script_name`='' WHERE `entry` = 17025;

-- Mosh'Ogg Mauler
UPDATE `creature_template` SET `auras` = '7095' WHERE `entry` = 678;

-- Takk the Leaper
UPDATE `creature_template` SET `auras` = '7165 21156' WHERE `entry` = 5842;

-- Captain Gerogg Hammertoe
UPDATE `creature_template` SET `auras` = '3418' WHERE `entry` = 5851;

-- Swinegart Spearhide
UPDATE `creature_template` SET `auras` = '7165' WHERE `entry` = 5864;

-- Anvilrage Overseer
UPDATE `creature_template` SET `auras` = '13589' WHERE `entry` = 8889;

-- Entropic Horror
UPDATE `creature_template` SET `auras` = '11966' WHERE `entry` = 9879;

-- Hive'Regal Ambusher
UPDATE `creature_template` SET `auras` = '7939 22766' WHERE `entry` = 11730;

-- Son of Flame
DELETE FROM `creature_ai_events` WHERE `creature_id`=12143;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1214301, 12143, 0, 9, 0, 100, 1, 15, 100, 5000, 5000, 1214301, 0, 0, 'Son of Flame - Cast Summon Player on Target Unreachable');
DELETE FROM `creature_ai_scripts` WHERE `id`=1214301;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1214301, 0, 15, 21727, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 84, 'Son of Flame - Cast Spell Summon Player');

-- Shanda the Spinner
UPDATE `creature_template` SET `auras` = '11919' WHERE `entry` = 14266;

-- Gretheer
UPDATE `creature_template` SET `auras` = '21788' WHERE `entry` = 14472;

-- Venomhide Ravasaur
DELETE FROM `creature_ai_scripts` WHERE `id` IN (650801);
DELETE FROM `creature_ai_events` WHERE `creature_id`=6508;
UPDATE `creature_template` SET `auras`='14108', `ai_name`='' WHERE `entry` = 6508;

-- Bloodpetal Lasher
DELETE FROM `creature_ai_scripts` WHERE `id` IN (650901);
DELETE FROM `creature_ai_events` WHERE `creature_id`=6509;
UPDATE `creature_template` SET `auras`='14111', `ai_name`='' WHERE `entry`= 6509;

-- Bloodpetal Flayer
DELETE FROM `creature_ai_scripts` WHERE `id` IN (651001);
DELETE FROM `creature_ai_events` WHERE `creature_id`=6510;
UPDATE `creature_template` SET `auras`='14111', `ai_name`='' WHERE `entry`=6510;

-- Bloodpetal Trapper
DELETE FROM `creature_ai_scripts` WHERE `id` IN (651201);
DELETE FROM `creature_ai_events` WHERE `creature_id`=6512;
UPDATE `creature_template` SET `auras`='14111', `ai_name`='' WHERE `entry` = 6512;

-- Tar Beast
DELETE FROM `creature_ai_scripts` WHERE `id` IN (651701);
DELETE FROM `creature_ai_events` WHERE `creature_id`=6517;
UPDATE `creature_template` SET `auras`='14178 14796', `ai_name`='' WHERE `entry` = 6517;

-- Tar Lurker
DELETE FROM `creature_ai_scripts` WHERE `id` IN (651801);
DELETE FROM `creature_ai_events` WHERE `creature_id`=6518;
UPDATE `creature_template` SET `auras`='14178 14796', `ai_name`='' WHERE `entry` = 6518;

-- Tar Creeper
DELETE FROM `creature_ai_scripts` WHERE `id` IN (652701);
DELETE FROM `creature_ai_events` WHERE `creature_id`=6527;
UPDATE `creature_template` SET `auras`='14178 14796', `ai_name`='' WHERE `entry` = 6527;

-- Tar Lord
DELETE FROM `creature_ai_scripts` WHERE `id` IN (651901, 651903);
DELETE FROM `creature_ai_events` WHERE `creature_id`=6519;
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (65190, 'Ungoro Crater - Tar Lord', 12747, 100, 1, 0, 0, 0, 5, 5, 12, 17, 0, 11640, 100, 15, 0, 0, 0, 5, 10, 15, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `auras`='14178 14796', `ai_name`='' WHERE `entry` = 6519;

-- Muculent Ooze
UPDATE `creature_template` SET `auras`='14133' WHERE `entry`=6556;

-- Fleshflayer Ghoul
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1040703);
DELETE FROM `creature_ai_events` WHERE `creature_id`=10407;
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (104070, 'Stratholme - Fleshflayer Ghoul', 13738, 100, 1, 0, 0, 0, 0, 10, 18, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `auras`='8876 18950', `ai_name`='' WHERE `entry`=10407;

-- Delete unused script text.
DELETE FROM `script_texts` WHERE `entry`=-1000004;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
