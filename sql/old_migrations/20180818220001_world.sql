DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180818220001');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180818220001');
-- Add your query below.


-- Spectral Stalkers should be unattackable on spawn.
UPDATE `creature_template` SET `unit_flags`=770, `faction_A`=14, `faction_H`=14 WHERE `entry`=16093;

-- Fix gossip menu id for Deliana.
UPDATE `creature_template` SET `gossip_menu_id`=7071 WHERE `entry`=16013;
UPDATE `gossip_menu` SET `entry`=7071 WHERE `entry`=9600;
UPDATE `gossip_menu_option` SET `menu_id`=7071 WHERE `menu_id`=9600;

-- Assign completion scripts for Alliance version of quest An Earnest Proposition.
UPDATE `quest_template` SET `CompleteScript`=8905 WHERE `entry` IN (8905, 8906, 8907, 8908, 8909, 8910, 8911, 8912);

-- Deliana
DELETE FROM `creature_ai_scripts` WHERE `id` IN (3001754);
DELETE FROM `creature_ai_events` WHERE `creature_id`=16013;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1601301, 16013, 458, 10, 2, 100, 1, 1, 50, 3000, 3000, 1601301, 0, 0, 'Deliana - Cast Love Aura on Player Enter LoS (Love is in the Air Event) (Phase 0)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1601302, 16013, 0, 21, 1, 100, 0, 0, 0, 0, 0, 1601302, 0, 0, 'Deliana - Start Script on Returning Home (Phase 1)');
DELETE FROM `creature_ai_scripts` WHERE `id`=1601301;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1601301, 0, 15, 27741, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deliana - Cast Spell Love is in the Air');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1601301, 0, 4, 147, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deliana - Add Gossip Flag');
DELETE FROM `creature_ai_scripts` WHERE `id`=1601302;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1601302, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deliana - Set Phase to 0');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1601302, 0, 62, 8905, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deliana - End Scripted Map Event');

-- Spawn script for the first Spectral Stalker.
DELETE FROM `event_scripts` WHERE `id`=1609301;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1609301, 5, 4, 46, 770, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'An Earnest Proposition: Spectral Stalker - Remove Unattackable Flag');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1609301, 6, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'An Earnest Proposition: Spectral Stalker - Attack Player');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1609301, 7, 75, 0, 0, 0, 0, 16013, 30, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'An Earnest Proposition: Spectral Stalker - Add Threat to Deliana');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1609301, 7, 75, 0, 0, 0, 0, 16013, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'An Earnest Proposition: Deliana - Add Threat to Spectral Stalker');

-- Spawn script for the middle Spectral Stalker.
DELETE FROM `event_scripts` WHERE `id`=1609302;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1609302, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11879, 0, 0, 0, 0, 0, 0, 0, 0, 'An Earnest Proposition: Spectral Stalker - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1609302, 5, 4, 46, 770, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'An Earnest Proposition: Spectral Stalker - Remove Unattackable Flag');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1609302, 6, 26, 0, 0, 0, 0, 16013, 30, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'An Earnest Proposition: Spectral Stalker - Attack Deliana');

-- Spawn script for the third Spectral Stalker.
DELETE FROM `event_scripts` WHERE `id`=1609303;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1609303, 5, 4, 46, 770, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'An Earnest Proposition: Spectral Stalker - Remove Unattackable Flag');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1609303, 6, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'An Earnest Proposition: Spectral Stalker - Attack Player');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1609303, 7, 75, 0, 0, 0, 0, 16013, 30, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'An Earnest Proposition: Spectral Stalker - Add Threat to Deliana');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1609303, 7, 75, 0, 0, 0, 0, 16013, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'An Earnest Proposition: Deliana - Add Threat to Spectral Stalker');

-- Completion script for Alliance version of quest An Earnest Proposition.
DELETE FROM `quest_end_scripts` WHERE `id`=8905;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8905, 0, 61, 8905, 60, 0, 0, 0, 0, 0, 8, 0, 8905, 0, 8906, 0, 0, 0, 0, 0, 'An Earnest Proposition: Start Scripted Map Event');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8905, 0, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'An Earnest Proposition: Deliana - Remove Quest Giver Flag');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8905, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'An Earnest Proposition: Deliana - Set Phase to 1');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8905, 1, 10, 16093, 30000, 0, 0, 0, 0, 0, 0, 0, 1609301, 6, 1, -4841.356, -1058.111, 502.188, 3, 0, 'An Earnest Proposition: Spawn Spectral Stalker 1');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8905, 1, 10, 16093, 30000, 0, 0, 0, 0, 0, 0, 0, 1609302, 6, 1, -4842.944, -1050.334, 502.187, 4, 0, 'An Earnest Proposition: Spawn Spectral Stalker 2');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8905, 1, 10, 16093, 30000, 0, 0, 0, 0, 0, 0, 0, 1609303, 6, 1, -4849.588, -1050.987, 502.19, 5, 0, 'An Earnest Proposition: Spawn Spectral Stalker 3');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8905, 2, 1, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'An Earnest Proposition: Deliana - Emote Unarmed Combat');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8905, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11881, 0, 0, 0, 0, 0, 0, 0, 0, 'An Earnest Proposition: Deliana - Say Text');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8905, 7, 1, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'An Earnest Proposition: Deliana - Stop Emoting');

-- Completion script for event after turning in Alliance version of An Earnest Proposition.
DELETE FROM `event_scripts` WHERE `id`=8905;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8905, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11883, 0, 0, 0, 0, 0, 0, 0, 0, 'An Earnest Proposition Success: Deliana - Say Text 1');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8905, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11885, 0, 0, 0, 0, 0, 0, 0, 0, 'An Earnest Proposition Success: Deliana - Say Text 2');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8905, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11888, 0, 0, 0, 0, 0, 0, 0, 0, 'An Earnest Proposition Success: Deliana - Say Text 3');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8905, 15, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'An Earnest Proposition Success: Deliana - Add Quest Giver Flag');

-- Failure script for event after turning in An Earnest Proposition.
DELETE FROM `event_scripts` WHERE `id`=8906;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8906, 0, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'An Earnest Proposition Failure: Deliana - Add Quest Giver Flag');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8906, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'An Earnest Proposition Failure: Deliana - Set Phase to 0');

-- Assign completion scripts for Horde version of quest An Earnest Proposition.
UPDATE `quest_template` SET `CompleteScript`=8913 WHERE `entry` IN (8913, 8914, 8915, 8916, 8917, 8918, 8919, 8920);

-- Fix gossip menu id for Deliana.
UPDATE `creature_template` SET `gossip_menu_id`=7070 WHERE `entry`=16012;
INSERT INTO `gossip_menu` VALUES (7070, 8332, 0);
UPDATE `gossip_menu` SET `entry`=7070 WHERE `entry`=9599;
UPDATE `gossip_menu_option` SET `menu_id`=7070 WHERE `menu_id`=9599;

-- Mokvar
DELETE FROM `creature_ai_scripts` WHERE `id` IN (3001753);
DELETE FROM `creature_ai_events` WHERE `creature_id`=16012;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1601201, 16012, 458, 10, 2, 100, 1, 1, 50, 3000, 3000, 1601201, 0, 0, 'Mokvar - Cast Love Aura on Player Enter LoS (Love is in the Air Event) (Phase 0)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1601202, 16012, 0, 21, 1, 100, 0, 0, 0, 0, 0, 1601202, 0, 0, 'Mokvar - Start Script on Returning Home (Phase 1)');
DELETE FROM `creature_ai_scripts` WHERE `id`=1601201;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1601201, 0, 15, 27741, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mokvar - Cast Spell Love is in the Air');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1601201, 0, 4, 147, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mokvar - Add Gossip Flag');
DELETE FROM `creature_ai_scripts` WHERE `id`=1601202;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1601202, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mokvar - Set Phase to 0');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1601202, 0, 62, 8913, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mokvar - End Scripted Map Event');

-- Completion script for Horde version of quest An Earnest Proposition.
DELETE FROM `quest_end_scripts` WHERE `id`=8913;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8913, 0, 61, 8913, 60, 0, 0, 0, 0, 0, 8, 0, 8913, 0, 8906, 0, 0, 0, 0, 0, 'An Earnest Proposition: Start Scripted Map Event');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8913, 0, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'An Earnest Proposition: Mokvar - Remove Quest Giver Flag');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8913, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'An Earnest Proposition: Mokvar - Set Phase to 1');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8913, 1, 10, 16093, 30000, 0, 0, 0, 0, 0, 0, 0, 1609304, 6, 1, 1922.11, -4171.18, 40.906, 3, 0, 'An Earnest Proposition: Spawn Spectral Stalker 1');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8913, 1, 10, 16093, 30000, 0, 0, 0, 0, 0, 0, 0, 1609305, 6, 1, 1920.51, -4166.52, 40.908, 4, 0, 'An Earnest Proposition: Spawn Spectral Stalker 2');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8913, 1, 10, 16093, 30000, 0, 0, 0, 0, 0, 0, 0, 1609306, 6, 1, 1914.23, -4165.22, 40.929, 5, 0, 'An Earnest Proposition: Spawn Spectral Stalker 3');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8913, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11895, 0, 0, 0, 0, 0, 0, 0, 0, 'An Earnest Proposition: Mokvar - Say Text');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8913, 5, 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'An Earnest Proposition: Mokvar - Emote Yell');

-- Completion script for event after turning in Horde version of An Earnest Proposition.
DELETE FROM `event_scripts` WHERE `id`=8913;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8913, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11896, 0, 0, 0, 0, 0, 0, 0, 0, 'An Earnest Proposition Success: Mokvar - Say Text 1');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8913, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11897, 0, 0, 0, 0, 0, 0, 0, 0, 'An Earnest Proposition Success: Mokvar - Say Text 2');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8913, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11898, 0, 0, 0, 0, 0, 0, 0, 0, 'An Earnest Proposition Success: Mokvar - Say Text 3');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8913, 15, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'An Earnest Proposition Success: Mokvar - Add Quest Giver Flag');

-- Spawn script for the first Spectral Stalker.
DELETE FROM `event_scripts` WHERE `id`=1609304;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1609304, 5, 4, 46, 770, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'An Earnest Proposition: Spectral Stalker - Remove Unattackable Flag');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1609304, 6, 26, 0, 0, 0, 0, 16012, 30, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'An Earnest Proposition: Spectral Stalker - Attack Mokvar');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1609304, 7, 75, 0, 0, 0, 0, 16012, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'An Earnest Proposition: Mokvar - Add Threat to Spectral Stalker');

-- Spawn script for the middle Spectral Stalker.
DELETE FROM `event_scripts` WHERE `id`=1609305;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1609305, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11893, 0, 0, 0, 0, 0, 0, 0, 0, 'An Earnest Proposition: Spectral Stalker - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1609305, 5, 4, 46, 770, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'An Earnest Proposition: Spectral Stalker - Remove Unattackable Flag');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1609305, 6, 26, 0, 0, 0, 0, 16012, 30, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'An Earnest Proposition: Spectral Stalker - Attack Mokvar');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1609305, 7, 75, 0, 0, 0, 0, 16012, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'An Earnest Proposition: Mokvar - Add Threat to Spectral Stalker');

-- Spawn script for the third Spectral Stalker.
DELETE FROM `event_scripts` WHERE `id`=1609306;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1609306, 5, 4, 46, 770, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'An Earnest Proposition: Spectral Stalker - Remove Unattackable Flag');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1609306, 6, 26, 0, 0, 0, 0, 16012, 30, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'An Earnest Proposition: Spectral Stalker - Attack Mokvar');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1609306, 7, 75, 0, 0, 0, 0, 16012, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'An Earnest Proposition: Mokvar - Add Threat to Spectral Stalker');

-- Kor'kron Elite should say text on Aggro.
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1430405, 14304, 0, 4, 0, 10, 0, 0, 0, 0, 0, 1430405, 0, 0, 'Kor\'kron Elite - Say Text on Aggro');
DELETE FROM `creature_ai_scripts` WHERE `id`=1430405;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1430405, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8891, 0, 0, 0, 0, 0, 0, 0, 0, 'Kor\'kron Elite - Say Text');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
