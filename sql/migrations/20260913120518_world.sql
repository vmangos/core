DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260913120518');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260913120518');
-- Add your query below.


-- =============================================================
-- Kurinnaxx (entry 15348)
-- =============================================================

-- Bind the sand trap spell script.
UPDATE `spell_template` SET `script_name`='spell_kurinnaxx_sand_trap' WHERE `entry`=26524;

-- =============================================================
-- Moam (entry 15340)
-- =============================================================

-- Bind the Mana Fiend summon spell script.
UPDATE `spell_template` SET `script_name`='spell_moam_summon_mana_fiends' WHERE `entry`=25684;

-- Aggro radius: closest raider stood 62.5 yds from spawn point at aggro tick;
-- minus the +3 yds level-difference bonus (lvl63 vs lvl60) -> detection_range 60.
UPDATE `creature_template` SET `detection_range`=60 WHERE `entry`=15340;

-- =============================================================
-- Mana Fiend (entry 15527, summoned by Moam)
-- =============================================================

-- Mana Fiends are guardian pets and default to PetAI, which never processes
-- their spell list - assign EventAI (routed to PetEventAI for pets) so
-- spell_list_id 155270 is actually cast.
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=15527;

-- Mana Fiend spells: counterspell after 6-9 sec, repeat 10-15 sec.
-- Arcane explosion 6 sec after summon (all fiends sync), then every 6 sec.
DELETE FROM `creature_spells` WHERE `entry`=155270;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`)
VALUES(
    155270, 'Ruins of Ahn''Qiraj - Mana Fiend',
    15122, 100, 1, 0, 0, 256, 6, 9, 10, 15, 0,
    25679, 100, 0, 0, 0, 0, 6, 6, 6, 6, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
);

-- =============================================================
-- Obsidian Destroyer (entry 15338) - convert from c++ script to EventAI
-- Drain Mana corrected: Moam uses 25754, Obsidian Destroyer uses 25676 (sniffed).
-- =============================================================
DELETE FROM `creature_ai_scripts` WHERE `id` BETWEEN 1533800 AND 1533805;
DELETE FROM `creature_ai_events` WHERE `id` BETWEEN 1533800 AND 1533805;

-- Spawn: cast SPELL_RESET_MANA (23777)
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1533800, 0, 0, 15, 23777, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Obsidian Destroyer - Cast Zero Mana/Full Health DND (Spawn)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1533800, 15338, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1533800, 0, 0, 'Obsidian Destroyer - Cast Zero Mana/Full Health DND (Spawn)');

-- Reached home: cast SPELL_RESET_MANA (23777)
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1533801, 0, 0, 15, 23777, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Obsidian Destroyer - Cast Zero Mana/Full Health DND (Reached Home)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1533801, 15338, 0, 21, 0, 100, 0, 0, 0, 0, 0, 1533801, 0, 0, 'Obsidian Destroyer - Cast Zero Mana/Full Health DND (Reached Home)');

-- Death: cast spell 27627 (spawns obsidian object)
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1533802, 0, 0, 15, 27627, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Obsidian Destroyer - Cast Drop Obsidian (Death)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1533802, 15338, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1533802, 0, 0, 'Obsidian Destroyer - Cast Drop Obsidian (Death)');

-- On aggro: cast SPELL_RESET_MANA (23777)
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES (1533803, 0, 0, 15, 23777, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Obsidian Destroyer - Cast Zero Mana/Full Health DND (On Aggro)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES (1533803, 15338, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1533803, 0, 0, 'Obsidian Destroyer - Cast Zero Mana/Full Health DND (On Aggro)');

-- In combat timer: every ~6.5 sec cast SPELL_DRAINMANA (25676)
DELETE FROM `creature_spells` WHERE `entry`=153380;
INSERT
    INTO
    `creature_spells` (entry,
    name,
    spellId_1,
    probability_1,
    castTarget_1,
    targetParam1_1,
    targetParam2_1,
    castFlags_1,
    delayInitialMin_1,
    delayInitialMax_1,
    delayRepeatMin_1,
    delayRepeatMax_1,
    scriptId_1,
    spellId_2,
    probability_2,
    castTarget_2,
    targetParam1_2,
    targetParam2_2,
    castFlags_2,
    delayInitialMin_2,
    delayInitialMax_2,
    delayRepeatMin_2,
    delayRepeatMax_2,
    scriptId_2,
    spellId_3,
    probability_3,
    castTarget_3,
    targetParam1_3,
    targetParam2_3,
    castFlags_3,
    delayInitialMin_3,
    delayInitialMax_3,
    delayRepeatMin_3,
    delayRepeatMax_3,
    scriptId_3,
    spellId_4,
    probability_4,
    castTarget_4,
    targetParam1_4,
    targetParam2_4,
    castFlags_4,
    delayInitialMin_4,
    delayInitialMax_4,
    delayRepeatMin_4,
    delayRepeatMax_4,
    scriptId_4,
    spellId_5,
    probability_5,
    castTarget_5,
    targetParam1_5,
    targetParam2_5,
    castFlags_5,
    delayInitialMin_5,
    delayInitialMax_5,
    delayRepeatMin_5,
    delayRepeatMax_5,
    scriptId_5,
    spellId_6,
    probability_6,
    castTarget_6,
    targetParam1_6,
    targetParam2_6,
    castFlags_6,
    delayInitialMin_6,
    delayInitialMax_6,
    delayRepeatMin_6,
    delayRepeatMax_6,
    scriptId_6,
    spellId_7,
    probability_7,
    castTarget_7,
    targetParam1_7,
    targetParam2_7,
    castFlags_7,
    delayInitialMin_7,
    delayInitialMax_7,
    delayRepeatMin_7,
    delayRepeatMax_7,
    scriptId_7,
    spellId_8,
    probability_8,
    castTarget_8,
    targetParam1_8,
    targetParam2_8,
    castFlags_8,
    delayInitialMin_8,
    delayInitialMax_8,
    delayRepeatMin_8,
    delayRepeatMax_8,
    scriptId_8)
VALUES(153380, 'Ahn''Qiraj Temple - Obsidian Destroyer', 25676, 100, 0, 0, 0, 0, 6, 7, 6, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- At full mana: cast SPELL_PURGE (25756)
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1533804, 0, 0, 15, 25756, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Obsidian Destroyer - Cast Purge at Full Mana');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1533804, 15338, 0, 3, 0, 100, 0, 100, 100, 1000, 1000, 1533804, 0, 0, 'Obsidian Destroyer - Cast Purge at Full Mana');

UPDATE `creature_template` SET `ai_name`='EventAI', `script_name`='' WHERE `entry`=15338;

-- =============================================================
-- Obsidian Eradicator (entry 15262) - convert hacks to proper spell casts
-- =============================================================

DELETE FROM `creature_ai_events` WHERE `id` IN (1526200, 1526201, 1526202, 1526203, 1526204, 1526205, 1526206);
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1526200, 1526201, 1526202, 1526203, 1526204, 1526205, 1526206);

-- Delete old broken aud custom scripts
-- Spawn: cast SPELL_RESET_MANA (23777)
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES (1526200, 0, 0, 15, 23777, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Obsidian Eradicator - Cast Zero Mana/Full Health DND (Spawn)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES (1526200, 15262, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1526200, 0, 0, 'Obsidian Eradicator - Cast Zero Mana/Full Health DND (Spawn)');

-- Reached home: cast SPELL_RESET_MANA (23777)
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES (1526201, 0, 0, 15, 23777, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Obsidian Eradicator - Cast Zero Mana/Full Health DND (Reached Home)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES (1526201, 15262, 0, 21, 0, 100, 0, 0, 0, 0, 0, 1526201, 0, 0, 'Obsidian Eradicator - Cast Zero Mana/Full Health DND (Reached Home)');

-- Death: cast 27628 (Drop Obsidian)
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES (1526202, 0, 0, 15, 27628, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Obsidian Eradicator - Cast Drop Obsidian (Death)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES (1526202, 15262, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1526202, 0, 0, 'Obsidian Eradicator - Cast Drop Obsidian (Death)');

-- On aggro: cast SPELL_RESET_MANA (23777)
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES (1526203, 0, 0, 15, 23777, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Obsidian Eradicator - Cast Zero Mana/Full Health DND (On Aggro)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES (1526203, 15262, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1526203, 0, 0, 'Obsidian Eradicator - Cast Zero Mana/Full Health DND (On Aggro)');

-- At full mana: cast SPELL_SHOCK_BLAST (26458)
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1526204, 0, 0, 15, 26458, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0.0, 0.0, 0.0, 0.0, 0, 'Obsidian Eradicator - Cast Shock Blast at Full Mana');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(1526204, 15262, 0, 3, 0, 100, 0, 100, 100, 1000, 1000, 1526204, 0, 0, 'Obsidian Eradicator - Cast Shock Blast at Full Mana');

-- In combat timer: every ~6.5 sec cast SPELL_DRAINMANA (26457)
DELETE FROM `creature_spells` WHERE `entry`=152620;
INSERT
    INTO
    `creature_spells` (entry,
    name,
    spellId_1,
    probability_1,
    castTarget_1,
    targetParam1_1,
    targetParam2_1,
    castFlags_1,
    delayInitialMin_1,
    delayInitialMax_1,
    delayRepeatMin_1,
    delayRepeatMax_1,
    scriptId_1,
    spellId_2,
    probability_2,
    castTarget_2,
    targetParam1_2,
    targetParam2_2,
    castFlags_2,
    delayInitialMin_2,
    delayInitialMax_2,
    delayRepeatMin_2,
    delayRepeatMax_2,
    scriptId_2,
    spellId_3,
    probability_3,
    castTarget_3,
    targetParam1_3,
    targetParam2_3,
    castFlags_3,
    delayInitialMin_3,
    delayInitialMax_3,
    delayRepeatMin_3,
    delayRepeatMax_3,
    scriptId_3,
    spellId_4,
    probability_4,
    castTarget_4,
    targetParam1_4,
    targetParam2_4,
    castFlags_4,
    delayInitialMin_4,
    delayInitialMax_4,
    delayRepeatMin_4,
    delayRepeatMax_4,
    scriptId_4,
    spellId_5,
    probability_5,
    castTarget_5,
    targetParam1_5,
    targetParam2_5,
    castFlags_5,
    delayInitialMin_5,
    delayInitialMax_5,
    delayRepeatMin_5,
    delayRepeatMax_5,
    scriptId_5,
    spellId_6,
    probability_6,
    castTarget_6,
    targetParam1_6,
    targetParam2_6,
    castFlags_6,
    delayInitialMin_6,
    delayInitialMax_6,
    delayRepeatMin_6,
    delayRepeatMax_6,
    scriptId_6,
    spellId_7,
    probability_7,
    castTarget_7,
    targetParam1_7,
    targetParam2_7,
    castFlags_7,
    delayInitialMin_7,
    delayInitialMax_7,
    delayRepeatMin_7,
    delayRepeatMax_7,
    scriptId_7,
    spellId_8,
    probability_8,
    castTarget_8,
    targetParam1_8,
    targetParam2_8,
    castFlags_8,
    delayInitialMin_8,
    delayInitialMax_8,
    delayRepeatMin_8,
    delayRepeatMax_8,
    scriptId_8)
VALUES(152620, 'Ahn''Qiraj Temple - Obsidian Eradicator', 26457, 100, 0, 0, 0, 0, 6, 7, 6, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
