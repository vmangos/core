DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201024171604');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201024171604');
-- Add your query below.


-- Set chat type and emotes for texts.
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry` IN (10856, 10859, 10860, 10861, 10662, 10663, 10664, 10665, 10666, 10667);
UPDATE `broadcast_text` SET `emote_id1`=15 WHERE `entry`=10662;
UPDATE `broadcast_text` SET `emote_id1`=1 WHERE `entry`=10663;
UPDATE `broadcast_text` SET `emote_id1`=1 WHERE `entry`=10664;
UPDATE `broadcast_text` SET `emote_id1`=1 WHERE `entry`=10666;
UPDATE `broadcast_text` SET `emote_id1`=5 WHERE `entry`=10665;
UPDATE `broadcast_text` SET `emote_id1`=15 WHERE `entry`=10667;

-- Conditions to check the time.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
(3711, 53, 19, 30, 19, 30, 0), -- Time is 19:30
(3712, -1, 108, 3711, 0, 0, 0), -- Hallow's End Is Active and Time Is 19:30
(3713, 53, 19, 45, 19, 45, 0), -- Time is 19:45
(3714, -1, 108, 3713, 0, 0, 0), -- Hallow's End Is Active and Time Is 19:45
(3715, 53, 19, 55, 19, 55, 0), -- Time is 19:55
(3716, -1, 108, 3715, 0, 0, 0), -- Hallow's End Is Active and Time Is 19:55
(3717, 53, 20, 00, 20, 00, 0), -- Time is 20:00
(3718, -1, 108, 3717, 0, 0, 0); -- Hallow's End Is Active and Time Is 20:00

-- Remove Interact Condition flag from Wickerman Ember.
UPDATE `gameobject_template` SET `flags`=0 WHERE `entry`=180437;

-- Correct unit flags for The Banshee Queen.
UPDATE `creature_template` SET `unit_flags`=33600 WHERE `entry`=15193;

-- Make Darkcaller Yanka an active spawn.
UPDATE `creature` SET `spawn_flags`=1 WHERE `id`=15197;

-- Assign EventAI and correct unit flags for Darkcaller Yanka.
UPDATE `creature_template` SET `unit_flags`=33536, `ai_name`='EventAI' WHERE `entry`=15197;

-- Events list for Darkcaller Yanka.
DELETE FROM `creature_ai_events` WHERE `creature_id`=15197;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1519701, 15197, 3712, 1, 2, 100, 1, 0, 0, 60000, 60000, 1519701, 0, 0, 'Darkcaller Yanka - Yell at 7:30 for Wickerman Event (Phase 0)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1519702, 15197, 3714, 1, 2, 100, 1, 0, 0, 60000, 60000, 1519702, 0, 0, 'Darkcaller Yanka - Yell at 7:45 for Wickerman Event (Phase 0)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1519703, 15197, 3716, 1, 2, 100, 1, 0, 0, 60000, 60000, 1519703, 0, 0, 'Darkcaller Yanka - Yell at 7:55 for Wickerman Event (Phase 0)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1519704, 15197, 3718, 1, 2, 100, 1, 0, 0, 60000, 60000, 1519704, 0, 0, 'Darkcaller Yanka - Start Wickerman Event at 8:00 (Phase 0)');
DELETE FROM `creature_ai_scripts` WHERE `id`=1519701;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1519701, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10856, 0, 0, 0, 0, 0, 0, 0, 0, 'Darkcaller Yanka - Say Text');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1519701, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Darkcaller Yanka - Set Phase to 1');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1519701, 0, 39, 15196, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Darkcaller Yanka - Start Script');
DELETE FROM `creature_ai_scripts` WHERE `id`=1519702;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1519702, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10859, 0, 0, 0, 0, 0, 0, 0, 0, 'Darkcaller Yanka - Say Text');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1519702, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Darkcaller Yanka - Set Phase to 1');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1519702, 0, 39, 15196, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Darkcaller Yanka - Start Script');
DELETE FROM `creature_ai_scripts` WHERE `id`=1519703;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1519703, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10860, 0, 0, 0, 0, 0, 0, 0, 0, 'Darkcaller Yanka - Say Text');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1519703, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Darkcaller Yanka - Set Phase to 1');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1519703, 0, 39, 15196, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Darkcaller Yanka - Start Script');
DELETE FROM `generic_scripts` WHERE `id`=15196;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (15196, 61, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Darkcaller Yanka - Set Phase to 0');
DELETE FROM `creature_ai_scripts` WHERE `id`=1519704;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1519704, 0, 39, 15197, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Darkcaller Yanka - Start Script');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1519704, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Darkcaller Yanka - Set Phase to 1');
DELETE FROM `generic_scripts` WHERE `id`=15197;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (15197, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10861, 0, 0, 0, 0, 0, 0, 0, 0, 'Darkcaller Yanka - Say Text');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (15197, 1, 10, 15193, 58000, 0, 0, 0, 0, 0, 0, 0, 15193, 6, 1, 1731.45, 512.753, 40.2189, 1.55334, 0, 'The Banshee Queen - Summon Creature The Banshee Queen');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (15197, 56, 1, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Darkcaller Yanka - Emote State');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (15197, 56, 76, 180437, 36000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1738.43, 512.016, 39.8172, 4.60767, 0, 'Wickerman Ember - Summon GameObject Wickerman Ember');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (15197, 56, 76, 180437, 36000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1741.12, 505.333, 41.3979, 4.64258, 0, 'Wickerman Ember - Summon GameObject Wickerman Ember');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (15197, 56, 76, 180437, 36000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1731.58, 500.123, 42.5049, 4.50295, 0, 'Wickerman Ember - Summon GameObject Wickerman Ember');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (15197, 56, 76, 180437, 36000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1721.45, 505.141, 40.8856, 4.95674, 0, 'Wickerman Ember - Summon GameObject Wickerman Ember');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (15197, 56, 76, 180437, 36000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1722.22, 512.332, 39.1567, 0.209439, 0, 'Wickerman Ember - Summon GameObject Wickerman Ember');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (15197, 56, 76, 180437, 36000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1731.56, 514.596, 39.3475, 5.70723, 0, 'Wickerman Ember - Summon GameObject Wickerman Ember');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (15197, 56, 80, 0, 0, 0, 0, 180433, 30, 11, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Wickerman - Set Go State to GO\_STATE\_ACTIVE');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (15197, 36000, 80, 1, 0, 0, 0, 180433, 30, 11, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Wickerman - Set Go State to GO\_STATE\_READY');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (15197, 36000, 1, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Darkcaller Yanka - Stop Dancing');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (15197, 36000, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Darkcaller Yanka - Set Phase to 0');
DELETE FROM `generic_scripts` WHERE `id`=15193;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (15193, 0, 15, 17327, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Banshee Queen - Cast Spell Spirit Particles');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (15193, 0, 15, 12980, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Banshee Queen - Cast Spell Simple Teleport');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (15193, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10662, 0, 0, 0, 0, 0, 0, 0, 0, 'The Banshee Queen - Say Text');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (15193, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10663, 0, 0, 0, 0, 0, 0, 0, 0, 'The Banshee Queen - Say Text');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (15193, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10664, 0, 0, 0, 0, 0, 0, 0, 0, 'The Banshee Queen - Say Text');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (15193, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10666, 0, 0, 0, 0, 0, 0, 0, 0, 'The Banshee Queen - Say Text');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (15193, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10665, 0, 0, 0, 0, 0, 0, 0, 0, 'The Banshee Queen - Say Text');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (15193, 45, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10667, 0, 0, 0, 0, 0, 0, 0, 0, 'The Banshee Queen - Say Text');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (15193, 54, 1, 51, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Banshee Queen - Emote OneShotSpellCast');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
