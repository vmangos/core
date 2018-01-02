DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180102212045');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180102212045');
-- Add your query below.


-- Delete custom NPCs.
DELETE FROM `creature_template` WHERE `entry` IN (964, 4621, 4622, 10001);
DELETE FROM `creature` WHERE `id` IN (4621);

-- Arugal (the intro npc) doesn't need a core script.
UPDATE `creature_template` SET `AIName`='EventAI', `ScriptName`='' WHERE `entry`=10000;

-- Arugal (the intro npc) should be invisible by default.
UPDATE `creature` SET `id`=10000, `spawnFlags`=64 WHERE `id`=10001;

-- EventAI script for Arugal (Intro NPC).
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (10000, 10001);
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (1000000, 10000, 11, 0, 100, 0, 0, 0, 0, 0, 50, 10000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Arugal - Start SFK Intro Event');

-- Event script for Arugal (Intro NPC).
DELETE FROM `event_scripts` WHERE `id`=10000;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (10000, 3, 0, 0, 0, 0, 0, 0, 1456, 0, 0, 0, 0, 0, 0, 0, 'SFK Intro - Arugal Say Text 1');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (10000, 4, 15, 10418, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'SFK Intro - Arugal Cast Spawn Spell');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (10000, 8, 0, 0, 0, 0, 0, 0, 5680, 0, 0, 0, 0, 0, 0, 0, 'SFK Intro - Arugal Say Text 2');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (10000, 8, 1, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'SFK Intro - Arugal Emote Point');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (10000, 13, 0, 0, 0, 0, 0, 0, 5681, 0, 0, 0, 0, 0, 0, 0, 'SFK Intro - Arugal Say Text 3');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (10000, 17, 1, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'SFK Intro - Arugal Emote Laugh');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (10000, 20, 28, 7, 4444, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'SFK Intro - Deathstalker Vincent Set Stand State to Dead');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (10000, 20, 0, 0, 0, 0, 0, 0, 5682, 0, 0, 0, 0, 0, 0, 0, 'SFK Intro - Arugal Say Text 4');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (10000, 25, 15, 6700, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'SFK Intro - Arugal Cast Dimensional Portal');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (10000, 13, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'SFK Intro - Arugal Emote Talk');

-- Change implicit target for spell 10418 to self.
-- Arugal (the intro npc) casts this on himself to become visible.
INSERT INTO `spell_effect_mod` (`Id`, `EffectIndex`, `EffectImplicitTargetA`, `Comment`) VALUES (10418, 0, 1, 'Arugal spawn-in spell - Cast on Self');

-- Add missing sound, type and emotes for broadcast texts.
UPDATE `broadcast_text` SET `Sound`=5797, `Type`=1 WHERE `ID`=6535;
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=1435;
UPDATE `broadcast_text` SET `Sound`=5793, `Type`=1 WHERE `ID`=6115;
UPDATE `broadcast_text` SET `Sound`=5795, `Type`=1 WHERE `ID`=6116;
UPDATE `broadcast_text` SET `EmoteId0`=1 WHERE `ID` IN (1328, 1329);
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=2086;

-- Assign spells template to Archmage Arugal (boss).
UPDATE `creature_template` SET `spells_template`=42750, `InhabitType`=3, `speed_walk`=1 WHERE `entry`=4275;

-- Remove old texts replaced with broadcast texts.
DELETE FROM `creature_ai_texts` WHERE `entry` IN (-541, -542, -543, -1100);
DELETE FROM `script_texts` WHERE `entry` IN (-1033000, -1033001, -1033002, -1033003, -1033004, -1033005, -1033006, -1033007, -1033008, -1033009, -1033010, -1033011, -1033012, -1033013, -1033014, -1033016, -1033017, -1033018, -1033019);

-- Delay for event that spawns the void walkers after Fenrus should be longer.
-- One of the void walkers had wrong spawn coordinates.
DELETE FROM `event_scripts` WHERE `id`=9536;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (9536, 11, 10, 4627, 9000000, 0, 0, 0, 0, 0, 0, 0, -140.203, 2175.26, 128.448, 0.373, 'Arugals Voidwalker spawn 4');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (9536, 11, 10, 4627, 9000000, 0, 0, 0, 0, 0, 0, 0, -148.869, 2180.86, 128.448, 1.814, 'Arugals Voidwalker spawn 3');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (9536, 11, 10, 4627, 9000000, 0, 0, 0, 0, 0, 0, 0, -155.352, 2172.780, 128.448, 4.679, 'Arugals Voidwalker spawn 2');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (9536, 11, 10, 4627, 9000000, 0, 0, 0, 0, 0, 0, 0, -147.059, 2163.19, 128.696, 0.128, 'Arugals Voidwalker spawn 1');

-- EventAI script for Archmage Arugal (Boss).
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=4275;
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (427501, 4275, 4, 0, 100, 2, 0, 0, 0, 0, 1, 6115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Archmage Arugal - Yell on Aggro (Ustaag)');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (427502, 4275, 5, 0, 100, 2, 0, 0, 0, 0, 1, 6116, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Archmage Arugal - Yell on Player Kill (Ustaag)');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (427503, 4275, 9, 0, 100, 3, 0, 5, 5000, 7000, 11, 7588, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Archmage Arugal - Cast Void Bolt (Melee) (Ustaag)');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (427504, 4275, 9, 0, 100, 3, 5, 60, 0, 0, 11, 7588, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Archmage Arugal - Cast Void Bolt (Range) (Ustaag)');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (427505, 4275, 9, 0, 100, 3, 0, 5, 1000, 1000, 21, 1, 0, 0, 20, 1, 0, 0, 0, 0, 0, 0, 'Archmage Arugal - Enable Movement when target in melee range (Ustaag)');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (427506, 4275, 9, 0, 100, 3, 5, 60, 1000, 1000, 21, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 'Archmage Arugal - Disable Movement when target is far (Ustaag)');

-- Spells template for Archmage Arugal (Boss).
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (42750, 'Shadowfang Keep - Archmage Arugal', 7136, 80, 0, 1, 48, 48, 40, 40, 0, 7586, 80, 0, 1, 22, 22, 40, 40, 0, 7587, 80, 0, 1, 34, 34, 40, 40, 7587, 7621, 100, 4, 1, 10, 15, 15, 20, 7621, 7803, 80, 1, 1, 15, 15, 15, 15, 7803, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Scripts for Archmage Arugal's spells.
INSERT INTO `creature_spells_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (7621, 0, 0, 0, 0, 0, 0, 0, 6535, 0, 0, 0, 0, 0, 0, 0, 'Archmage Arugal - Arugal\'s Curse - Arugal Say Text');
INSERT INTO `creature_spells_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (7803, 1, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 'Archmage Arugal - Thundershock - Move Away from Target');
INSERT INTO `creature_spells_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (7587, 8, 15, 7136, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Archmage Arugal - Shadow Port - Teleport back to Start Location');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
