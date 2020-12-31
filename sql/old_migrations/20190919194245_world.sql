DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190919194245');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190919194245');
-- Add your query below.


UPDATE `creature_template` SET `ai_name` = "EventAI" WHERE `entry` IN (16115, 16113, 16114);
UPDATE `creature_template` SET `spell_list_id` = 161160, `ai_name` = "EventAI", `script_name` = "" WHERE `entry` = 16116;

REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES
(161160, "Eastern Plaguelands - Archmage Angela Dosantos", 10149, 50, 1, 0, 0, 0, 0, 0, 2, 2, 0, 10179, 100, 1, 0, 0, 8, 0, 0, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

DELETE FROM `creature_ai_events` WHERE `creature_id` IN (16115, 16113, 16114, 16116);
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(1611501, 16115, 0, 1, 0, 100, 1, 0, 0, 360000, 360000, 1611501, 0, 0, "Commander Eligor Dawnbringer - OOC - Start Script"),
(1611502, 16115, 0, 1, 1, 100, 1, 1000, 3000, 3000, 5000, 1611502, 0, 0, "Commander Eligor Dawnbringer - OOC (Phase 1) - Start Script"),

(1611301, 16113, 0, 1, 1, 100, 1, 1000, 3000, 3000, 5000, 1611301, 0, 0, "Father Inigo Montoy - OOC (Phase 1) - Start Script"),

(1611401, 16114, 0, 1, 1, 100, 1, 1000, 3000, 3000, 5000, 1611401, 0, 0, "Scarlet Commander Marjhan - OOC (Phase 1) - Start Script"),

(1611601, 16116, 0, 1, 1, 100, 1, 1000, 3000, 3000, 5000, 1611601, 0, 0, "Archmage Angela Dosantos - OOC (Phase 1) - Start Script");
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1611501, 1611502, 1611301, 1611401, 1611601);
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1611501, 0, 39, 1611501, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, "Commander Eligor Dawnbringer - OOC - Start Script"),
(1611502, 0, 1, 7, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Commander Eligor Dawnbringer - OOC - Play Emote (7)"),

(1611301, 0, 1, 7, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Father Inigo Montoy - OOC - Play Emote (7)"),

(1611401, 0, 1, 7, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Scarlet Commander Marjhan - OOC - Play Emote (7)"),

(1611601, 0, 1, 7, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Archmage Angela Dosantos - OOC - Play Emote (7)");
DELETE FROM `event_scripts` WHERE `id` = 1611501;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1611501, 1, 0, 0, 0, 0, 0, 54193, 0, 9, 2, 12047, 0, 0, 0, 0, 0, 0, 0, 0, "Commander Eligor Dawnbringer - On Script - Say Text (Creature 16114)"),
(1611501, 7, 0, 0, 0, 0, 0, 0, 0, 0, 4, 12048, 0, 0, 0, 0, 0, 0, 0, 0, "Commander Eligor Dawnbringer - On Script - Say Text"),
(1611501, 12, 0, 2, 0, 0, 0, 0, 0, 0, 4, 12049, 0, 0, 0, 0, 0, 0, 0, 0, "Commander Eligor Dawnbringer - On Script - Say Text"),
(1611501, 17, 0, 0, 0, 0, 0, 0, 0, 0, 4, 12050, 0, 0, 0, 0, 0, 0, 0, 0, "Commander Eligor Dawnbringer - On Script - Say Text"),
(1611501, 22, 0, 0, 0, 0, 0, 0, 0, 0, 4, 12051, 0, 0, 0, 0, 0, 0, 0, 0, "Commander Eligor Dawnbringer - On Script - Say Text"),
(1611501, 31, 0, 0, 0, 0, 0, 54193, 0, 9, 2, 12052, 0, 0, 0, 0, 0, 0, 0, 0, "Commander Eligor Dawnbringer - On Script - Say Text (Creature 16114)"),
(1611501, 36, 0, 0, 0, 0, 0, 0, 0, 0, 4, 12053, 0, 0, 0, 0, 0, 0, 0, 0, "Commander Eligor Dawnbringer - On Script - Say Text"),
(1611501, 42, 0, 0, 0, 0, 0, 54193, 0, 9, 2, 12054, 0, 0, 0, 0, 0, 0, 0, 0, "Commander Eligor Dawnbringer - On Script - Say Text (Creature 16114)"),
(1611501, 47, 0, 0, 0, 0, 0, 0, 0, 0, 4, 12055, 0, 0, 0, 0, 0, 0, 0, 0, "Commander Eligor Dawnbringer - On Script - Say Text"),
(1611501, 56, 0, 0, 0, 0, 0, 54193, 0, 9, 2, 12056, 0, 0, 0, 0, 0, 0, 0, 0, "Commander Eligor Dawnbringer - On Script - Say Text (Creature 16114)"),
(1611501, 61, 0, 0, 0, 0, 0, 0, 0, 0, 4, 12057, 0, 0, 0, 0, 0, 0, 0, 0, "Commander Eligor Dawnbringer - On Script - Say Text"),
(1611501, 66, 0, 0, 0, 0, 0, 54193, 0, 9, 2, 12058, 0, 0, 0, 0, 0, 0, 0, 0, "Commander Eligor Dawnbringer - On Script - Say Text (Creature 16114)"),
(1611501, 69, 2, 138, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Commander Eligor Dawnbringer - On Script - Set Unit Field Bytes 1 (0)"),
(1611501, 74, 0, 0, 0, 0, 0, 0, 0, 0, 4, 12062, 0, 0, 0, 0, 0, 0, 0, 0, "Commander Eligor Dawnbringer - On Script - Say Text"),
(1611501, 83, 0, 0, 0, 0, 0, 0, 0, 0, 4, 12063, 0, 0, 0, 0, 0, 0, 0, 0, "Commander Eligor Dawnbringer - On Script - Say Text"),
(1611501, 91, 0, 0, 0, 0, 0, 0, 0, 0, 4, 12065, 0, 0, 0, 0, 0, 0, 0, 0, "Commander Eligor Dawnbringer - On Script - Say Text"),
(1611501, 100, 0, 0, 0, 0, 0, 0, 0, 0, 4, 12066, 0, 0, 0, 0, 0, 0, 0, 0, "Commander Eligor Dawnbringer - On Script - Say Text"),
(1611501, 105, 0, 0, 0, 0, 0, 0, 0, 0, 4, 12067, 0, 0, 0, 0, 0, 0, 0, 0, "Commander Eligor Dawnbringer - On Script - Say Text"),
(1611501, 108, 2, 138, 5, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Commander Eligor Dawnbringer - On Script - Set Unit Field Bytes 1 (5)"),
(1611501, 139, 60, 3, 1, 0, 0, 54188, 0, 9, 2, 16256, 0, 0, 0, 0, 0, 0, 0, 0, "Commander Eligor Dawnbringer - On Script - Start Waypoints (Creature 16256)");

DELETE FROM `creature_movement_special` WHERE `id` = 16256;
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `script_id`) VALUES 
(16256, 1, 2302.24, -5340.86, 90.8808, 1.35917, 1000, 0),
(16256, 2, 2302.24, -5340.86, 90.8808, 1.35917, 8000, 1625601),

(16256, 3, 2300.21, -5337.23, 90.8808, 2.11316, 1000, 0),
(16256, 4, 2300.21, -5337.23, 90.8808, 2.11316, 8000, 1625602),

(16256, 5, 2294.4, -5335.95, 90.8808, 2.91426, 1000, 0),
(16256, 6, 2294.4, -5335.95, 90.8808, 2.91426, 28000, 1625603),

(16256, 7, 2293.5, -5343.34, 90.8808, 4.63054, 0, 0),
(16256, 8, 2300.9, -5345.09, 90.8808, 6.06782, 1000, 0),
(16256, 9, 2300.9, -5345.09, 90.8808, 6.06782, 4000, 1625604);

DELETE FROM `creature_movement_scripts` WHERE `id` IN (1625601, 1625602, 1625603, 1625604);
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1625601, 2, 35, 1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 3.21271, 0, "Jessica Chambers - Set Orientation (3.21271)"),
(1625601, 4, 0, 0, 0, 0, 0, 0, 0, 0, 4, 12132, 0, 0, 0, 0, 0, 0, 0, 0, "Jessica Chambers - Say Text"),
(1625601, 5, 76, 181143, 64, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 2298.4, -5341.18, 91.8703, 5.28751, 0, "Jessica Chambers - Summon GOB (Fish of the day)"),
(1625601, 6, 44, 1, 0, 0, 0, 54766, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Jessica Chambers - Set Phase 1 (Creature 16115)"),

(1625602, 2, 35, 1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 3.8803, 0, "Jessica Chambers - Set Orientation (3.8803)"),
(1625602, 4, 0, 0, 0, 0, 0, 0, 0, 0, 4, 12133, 0, 0, 0, 0, 0, 0, 0, 0, "Jessica Chambers - Say Text"),
(1625602, 5, 76, 181144, 64, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 2298.24, -5339.52, 91.8803, 0.683735, 0, "Jessica Chambers - Summon GOB (Bowl of Fruit)"),
(1625602, 6, 44, 1, 0, 0, 0, 54807, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Jessica Chambers - Set Phase 1 (Creature 16113)"),

(1625603, 2, 35, 1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 5.36095, 0, "Jessica Chambers - Set Orientation (5.36095)"),
(1625603, 4, 0, 0, 0, 0, 0, 0, 0, 0, 4, 12134, 0, 0, 0, 0, 0, 0, 0, 0, "Jessica Chambers - Say Text"),
(1625603, 5, 76, 181145, 64, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 2296.58, -5338.5, 91.8859, 2.16942, 0, "Jessica Chambers - Summon GOB (Roast Boar Platter)"),
(1625603, 6, 44, 1, 0, 0, 0, 54193, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Jessica Chambers - Set Phase 1 (Creature 16114)"),
(1625603, 6, 76, 181145, 64, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 2296.69, -5340.52, 91.8701, 3.80698, 0, "Jessica Chambers - Summon GOB (Roast Boar Platter)"),
(1625603, 7, 44, 1, 0, 0, 0, 54192, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Jessica Chambers - Set Phase 1 (Creature 16116)"),
(1625603, 8, 0, 0, 0, 0, 0, 54766, 0, 9, 2, 12139, 12137, 12138, 0, 0, 0, 0, 0, 0, "Jessica Chambers - Say Text (Creature 16115)"),
(1625603, 10, 0, 0, 0, 0, 0, 54807, 0, 9, 2, 12140, 12141, 12142, 0, 0, 0, 0, 0, 0, "Jessica Chambers - Say Text (Creature 16113)"),
(1625603, 13, 0, 0, 0, 0, 0, 0, 0, 0, 4, 12135, 0, 0, 0, 0, 0, 0, 0, 0, "Jessica Chambers - Say Text"),
(1625603, 16, 0, 0, 0, 0, 0, 54193, 0, 9, 2, 12143, 0, 0, 0, 0, 0, 0, 0, 0, "Jessica Chambers - Say Text (Creature 16114)"),
(1625603, 19, 0, 0, 0, 0, 0, 54193, 0, 9, 2, 12144, 0, 0, 0, 0, 0, 0, 0, 0, "Jessica Chambers - Say Text (Creature 16114)"),
(1625603, 22, 0, 0, 0, 0, 0, 54192, 0, 9, 2, 12145, 0, 0, 0, 0, 0, 0, 0, 0, "Jessica Chambers - Say Text (Creature 16116)"),
(1625603, 25, 0, 0, 0, 0, 0, 54192, 0, 9, 2, 12146, 12147, 0, 0, 0, 0, 0, 0, 0, "Jessica Chambers - Say Text (Creature 16116)"),

(1625604, 2, 35, 1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 2.16421, 0, "Jessica Chambers - Set Orientation (2.16421)"),
(1625604, 14, 44, 0, 0, 0, 0, 54766, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Jessica Chambers - Set Phase 0 (Creature 16115)"),
(1625604, 24, 44, 0, 0, 0, 0, 54807, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Jessica Chambers - Set Phase 0 (Creature 16113)"),
(1625604, 34, 44, 0, 0, 0, 0, 54193, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Jessica Chambers - Set Phase 0 (Creature 16114)"),
(1625604, 35, 44, 0, 0, 0, 0, 54192, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Jessica Chambers - Set Phase 0 (Creature 16116)");

UPDATE `broadcast_text` SET `EmoteId0` = 1 WHERE `ID` IN (12047, 12050, 12051, 12052, 12053, 12055, 12058, 12066, 12132, 12134, 12135, 12137, 12138, 12139, 12140, 12142, 12144);
UPDATE `broadcast_text` SET `EmoteId0` = 2 WHERE `ID` IN (12143, 12147);
UPDATE `broadcast_text` SET `EmoteId0` = 4 WHERE `ID` IN (12141, 12146);
UPDATE `broadcast_text` SET `EmoteId0` = 5 WHERE `ID` IN (12054, 12063, 12067);
UPDATE `broadcast_text` SET `EmoteId0` = 6 WHERE `ID` IN (12048, 12057, 12062, 12133);
UPDATE `broadcast_text` SET `EmoteId0` = 25 WHERE `ID` = 12065;
UPDATE `broadcast_text` SET `EmoteId0` = 273 WHERE `ID` = 12145;
UPDATE `broadcast_text` SET `EmoteId0` = 274 WHERE `ID` = 12056;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
