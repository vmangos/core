DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181214002230');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181214002230');
-- Add your query below.


-- Apothecary Keever
DELETE FROM `creature` WHERE `guid` = 45216 AND `id` = 5739;
DELETE FROM `creature` WHERE `guid` = 45218 AND `id` = 5736;
DELETE FROM `creature_addon` WHERE `guid` IN (45216, 45218);

DELETE FROM `creature_ai_events` WHERE `creature_id` = 5734;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(573401, 5734, 0, 4, 0, 100, 0, 0, 0, 0, 0, 573401, 0, 0, 'Apothecary Keever - Summon Deathguard Elite on Aggro'),
(573402, 5734, 0, 1, 0, 100, 1, 5000, 5000, 240000, 240000, 573402, 0, 0, 'Apothecary Keever - Start OOC Event'),
(3001553, 5734, 458, 10, 0, 100, 1, 1, 50, 3000, 3000, 3001553, 0, 0, 'Love is in the Air Event - Cast Love aura and turn on gossip NPC\_FLAG');

DELETE FROM `creature_ai_scripts` WHERE `id` = 573402;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(573402, 0, 39, 573402, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Start OOC Event');

DELETE FROM `event_scripts` WHERE `id` = 573402;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(573402, 0, 2, 138, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Stand'),
(573402, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2061, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Say Text'),
(573402, 3, 15, 7794, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Cast Spell \'Teleport\''),
(573402, 6, 2, 138, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Kneel'),
(573402, 6, 10, 5736, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5, 1400.85, 363.242, -84.868, 1.11701, 0, 'Apothecary Keever - Spawn Creature \'Caged Human Male\''),
(573402, 9, 2, 138, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Stand'),
(573402, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2062, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Say Text'),
(573402, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2075, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Say Text'),
(573402, 21, 2, 138, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Kneel'),
(573402, 23, 27, 5742, 1, 0, 0, 5736, 2, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Update Entry (Creature Entry: 5736)'),
(573402, 32, 0, 2, 0, 0, 0, 0, 0, 0, 0, 2064, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Say Text'),
(573402, 45, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2063, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Say Text'),
(573402, 46, 2, 138, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Stand'),
(573402, 54, 2, 138, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Kneel'),
(573402, 54, 0, 2, 0, 0, 0, 0, 0, 0, 0, 2065, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Say Text'),
(573402, 56, 27, 5739, 1, 0, 0, 5742, 2, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Update Entry (Creature Entry: 5742)'),
(573402, 60, 0, 2, 0, 0, 0, 0, 0, 0, 0, 2066, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Say Text'),
(573402, 73, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2067, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Say Text'),
(573402, 74, 2, 138, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Stand'),
(573402, 82, 2, 138, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Kneel'),
(573402, 82, 0, 2, 0, 0, 0, 0, 0, 0, 0, 2068, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Say Text'),
(573402, 86, 27, 5741, 1, 0, 0, 5739, 2, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Update Entry (Creature Entry: 5739)'),
(573402, 95, 0, 2, 0, 0, 0, 0, 0, 0, 0, 2069, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Say Text'),
(573402, 108, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2070, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Say Text'),
(573402, 109, 2, 138, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Stand'),
(573402, 117, 2, 138, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Kneel'),
(573402, 117, 0, 2, 0, 0, 0, 0, 0, 0, 0, 2071, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Say Text'),
(573402, 121, 27, 5743, 1, 0, 0, 5741, 2, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Update Entry (Creature Entry: 5741)'),
(573402, 130, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2072, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Say Text'),
(573402, 131, 2, 138, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Stand'),
(573402, 143, 2, 138, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Kneel'),
(573402, 143, 0, 2, 0, 0, 0, 0, 0, 0, 0, 2073, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Say Text'),
(573402, 147, 15, 7670, 6, 0, 0, 5743, 2, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Cast Spell \'Explode\' (Creature Entry: 5743)'),
(573402, 148, 18, 0, 0, 0, 0, 5743, 2, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Despawn (Creature Entry: 5743)'),
(573402, 151, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2074, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Say Text'),
(573402, 152, 2, 138, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Stand');

UPDATE broadcast_text SET EmoteId0 = 1 WHERE ID IN (2061, 2062, 2063, 2067, 2070, 2072);
UPDATE broadcast_text SET EmoteId0 = 11 WHERE ID = 2074;

-- Caged Human Female
DELETE FROM `creature_ai_scripts` WHERE `id` = 573501;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(573501, 0, 1, 18, 0, 0, 0, 0, 0, 0, 0, 20, 1, 0, 0, 0, 0, 0, 0, 0, 'Caged Human Female - Random Emote');

-- Caged Dwarf Male
UPDATE `creature_template` SET `AIName` = "EventAI" WHERE `entry` = 5738;
DELETE FROM `creature_ai_events` WHERE `creature_id` = 5738;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(573801, 5738, 0, 1, 0, 100, 1, 6000, 13000, 29000, 45000, 573801, 0, 0, 'Caged Dwarf Male - Random Emotes');
DELETE FROM `creature_ai_scripts` WHERE `id` = 573801;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(573801, 0, 1, 18, 0, 0, 0, 0, 0, 0, 0, 20, 1, 0, 0, 0, 0, 0, 0, 0, 'Caged Dwarf Male - Random Emote');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
