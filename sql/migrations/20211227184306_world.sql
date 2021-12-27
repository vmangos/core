DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211227184306');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211227184306');
-- Add your query below.


UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry` IN (4419, 4252, 4251);
UPDATE `creature_template` SET `flags_extra`=33554434 WHERE `entry` IN (4507); 
UPDATE `creature` SET `spawn_flags`=1 WHERE `guid` IN (21680, 21682, 21681, 21549, 21145); -- Make them active or the script fails like on Classic ERA.
UPDATE `creature_template` SET `auras`=NULL WHERE `entry` IN (4252, 4251); -- Auras are applied every 5 seconds anyway.
UPDATE `creature_template` SET `speed_run`=2.79286 WHERE `entry` IN (4252, 4251); -- This is the original speed of the racer, maybe the sniffed creature_template shows a different speed but that depends on the aura they have.
REPLACE INTO `creature_addon` (`guid`, `patch`, `display_id`, `mount_display_id`, `equipment_id`, `stand_state`, `sheath_state`, `emote_state`, `auras`) VALUES (21681, 0, 0, -1, -1, 0, 0, 0, NULL);

-- Events list for Gnome Racer
DELETE FROM `creature_ai_events` WHERE `creature_id`=4252;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (425201, 4252, 0, 1, 0, 100, 3, 5000, 5000, 5000, 5000, 425201, 425202, 425203, 'Mirage Race - Gnome Racer random speed aura');

-- Events list for Goblin Racer
DELETE FROM `creature_ai_events` WHERE `creature_id`=4251;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (425101, 4251, 0, 1, 0, 100, 3, 5000, 5000, 5000, 5000, 425201, 425202, 425203, 'Mirage Race - Goblin Racer random speed aura');

DELETE FROM `creature_ai_scripts` WHERE `id`=425201;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (425201, 0, 15, 6601, 34, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mirage Race - Random aura: Salt Flats Racer Slow');
DELETE FROM `creature_ai_scripts` WHERE `id`=425202;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (425202, 0, 15, 6602, 34, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mirage Race - Random aura: Salt Flats Racer Normal');
DELETE FROM `creature_ai_scripts` WHERE `id`=425203;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (425203, 0, 15, 6600, 34, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mirage Race - Random aura: Salt Flats Racer Speed');

-- Events list for Race Master Kronkrider
DELETE FROM `creature_ai_events` WHERE `creature_id`=4419;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (441901, 4419, 0, 1, 0, 100, 1, 1080000, 1080000, 1080000, 1080000, 441901, 0, 0, 'Mirage Race - Race Master Kronkrider Yelling 2 minutes');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (441902, 4419, 0, 1, 0, 100, 1, 1200000, 1200000, 1080000, 1080000, 441902, 0, 0, 'Mirage Race - Race Master Kronkrider Yelling 1 minute');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (441903, 4419, 0, 1, 0, 100, 1, 1260000, 1260000, 1080000, 1080000, 441903, 0, 0, 'Mirage Race - Fobeed starting race');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (441904, 4419, 0, 1, 0, 100, 1, 1258000, 1258000, 1080000, 1080000, 441904, 0, 0, 'Mirage Race - Daisy starting emotes');

DELETE FROM `creature_ai_scripts` WHERE `id`=441901;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (441901, 0, 0, 0, 0, 0, 0, 21585, 0, 9, 2, 1655, 0, 0, 0, 0, 0, 0, 0, 0, 'Mirage Race - Gnome Pit Boss say');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (441901, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 8240, 0, 0, 0, 0, 0, 0, 0, 0, 'Mirage Race - Race Master Kronkrider Yelling 2 minutes');

DELETE FROM `creature_ai_scripts` WHERE `id`=441902;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (441902, 0, 60, 3, 0, 0, 0, 21680, 0, 9, 2, 0, 2168001, 0, 0, 0, 0, 0, 0, 0, 'Mirage Race - Goblin Racer moves to start position');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (441902, 0, 60, 3, 0, 0, 0, 21682, 0, 9, 2, 0, 2168201, 0, 0, 0, 0, 0, 0, 0, 'Mirage Race - Gnome Racer moves to start position');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (441902, 0, 60, 3, 0, 0, 0, 21681, 0, 9, 2, 0, 2168101, 0, 0, 0, 0, 0, 0, 0, 'Mirage Race - Daisy moves to start position');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (441902, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1452, 0, 0, 0, 0, 0, 0, 0, 0, 'Mirage Race - Race Master Kronkrider Yelling 1 minute');

DELETE FROM `creature_ai_scripts` WHERE `id`=441903;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (441903, 0, 60, 3, 0, 0, 0, 21682, 0, 9, 2, 0, 2168202, 0, 0, 0, 0, 0, 0, 0, 'Mirage Race - Start Gnome Racer');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (441903, 0, 0, 1, 0, 0, 0, 21145, 0, 9, 2, 2124, 0, 0, 0, 0, 0, 0, 0, 0, 'Mirage Race - Fobeed Yelling start');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (441903, 0, 1, 36, 0, 0, 0, 21681, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mirage Race - Daisy OneShotAttack1H');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (441903, 0, 60, 3, 0, 0, 0, 21680, 0, 9, 2, 0, 2168002, 0, 0, 0, 0, 0, 0, 0, 'Mirage Race - Start Goblin Racer');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (441903, 0, 61, 2168001, 900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mirage Race -  Start Goblin Racer event');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (441903, 0, 61, 2168201, 900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mirage Race -  Start Gnome Racer event');

DELETE FROM `creature_ai_scripts` WHERE `id`=441904;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (441904, 0, 39, 2168101, 0, 0, 0, 21681, 0, 9, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Mirage Race - Daisy emotes');

-- Daisy emotes
DELETE FROM `generic_scripts` WHERE `id`=2168101;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2168101, 0, 1, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mirage Race - Daisy: OneShotWaveNoSheathe (70)');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2168101, 5, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6.24828, 0, 'Mirage Race - Daisy: Change Orientation');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2168101, 7, 1, 71, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mirage Race - Daisy: OneShotCheerNoSheathe (71)');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2168101, 7, 51, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mirage Race - Daisy: Change sheath unarmed');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2168101, 9, 60, 3, 0, 0, 0, 0, 0, 0, 0, 0, 2168102, 0, 0, 0, 0, 0, 0, 0, 'Mirage Race - Daisy: run back to camp');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2168101, 10, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mirage Race - Daisy: OneShotCheer (4)');

-- Daisy Change sheath
DELETE FROM `creature_movement_scripts` WHERE `id`=2168102;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2168102, 0, 51, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mirage Race - Daisy: Change sheath melee');

-- Daisy orientation after waypoints
DELETE FROM `creature_movement_scripts` WHERE `id`=2168101;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2168101, 1, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.14159, 0, 'Mirage Race - Daisy: Change Orientation');

-- Cast Salt Flats Racer Speed
DELETE FROM `creature_movement_scripts` WHERE `id`=425201;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (425201, 0, 15, 6602, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mirage Race - cast Salt Flats Racer Normal');

-- Fobeed yells after 1 round
DELETE FROM `creature_movement_scripts` WHERE `id`=425202;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (425202, 0, 0, 1, 0, 0, 0, 21145, 0, 9, 3, 1517, 0, 0, 0, 0, 0, 0, 0, 0, 'Mirage Race - Fobeed to Gnome Racer yell after 1 turn');

-- Turn on running
DELETE FROM `creature_movement_scripts` WHERE `id`=425203;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (425203, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mirage Race - turn on running');

-- Turn on walking
DELETE FROM `creature_movement_scripts` WHERE `id`=425204;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (425204, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mirage Race - turn on walking');

-- Goblin event active
DELETE FROM `conditions` WHERE `condition_entry`=441901;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (441901, 36, 2168201, 0, 0, 0, 0);
-- Gnome event active
DELETE FROM `conditions` WHERE `condition_entry`=441902;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (441902, 36, 2168001, 0, 0, 0, 0);
-- Gnome OR Goblin event active
DELETE FROM `conditions` WHERE `condition_entry`=441903;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (441903, -1, 441901, 441902, 0, 0, 0);

-- Race Master Kronkrider Goblin win!
DELETE FROM `creature_movement_scripts` WHERE `id`=425205;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (425205, 0, 39, 425205, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 441903, 'Mirage Race -  Ending Goblin Racer event');

-- Race Master Kronkrider Goblin win!
DELETE FROM `creature_movement_scripts` WHERE `id`=425206;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (425206, 0, 39, 425206, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 441903, 'Mirage Race -  Ending Gnome Racer event');

-- Race Master Kronkrider Goblin win!
DELETE FROM `generic_scripts` WHERE `id`=425205;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (425205, 0, 62, 2168001, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mirage Race -  Ending Goblin Racer event');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (425205, 0, 62, 2168201, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mirage Race -  Ending Gnome Racer event');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (425205, 0, 0, 1, 0, 0, 0, 21549, 0, 9, 2, 1522, 0, 0, 0, 0, 0, 0, 0, 0, 'Mirage Race -  Race Master Kronkrider Yelling goblins win');

-- Race Master Kronkrider Gnome win!
DELETE FROM `generic_scripts` WHERE `id`=425206;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (425206, 0, 62, 2168001, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mirage Race -  Ending Goblin Racer event');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (425206, 0, 62, 2168201, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mirage Race -  Ending Gnome Racer event');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (425206, 0, 0, 1, 0, 0, 0, 21549, 0, 9, 2, 1518, 0, 0, 0, 0, 0, 0, 0, 0, 'Mirage Race -  Race Master Kronkrider Yelling gnome win');

-- Daisy runs to the start Position
DELETE FROM `creature_movement_special` WHERE `id`=2168101;
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
    (2168101, 1, -6199.950195, -3927.719971, -58.657001, 100.000000, 0, 0.000000, 0),
    (2168101, 2, -6185.709961, -3926.020020, -58.657001, 100.000000, 0, 0.000000, 0),
    (2168101, 3, -6183.350098, -3917.530029, -58.782001, 100.000000, 0, 0.000000, 0),
    (2168101, 4, -6179.439941, -3902.909912, -60.032001, 100.000000, 0, 0.000000, 2168102),
    (2168101, 5, -6178.939941, -3901.570068, -60.067101, 100.000000, 0, 0.000000, 2168101);

-- Daisy runs back to the camp
DELETE FROM `creature_movement_special` WHERE `id`=2168102;
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
    (2168102, 1, -6210.669922, -3909.889893, -60.344799, 100.000000, 0, 0.000000, 0),
    (2168102, 2, -6221.080078, -3930.320068, -58.719799, 100.000000, 0, 0.000000, 0);

-- Goblin Racer to the start Position
DELETE FROM `creature_movement_special` WHERE `id`=2168001;
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
    (2168001, 1, -6237.240234, -3917.989990, -59.258099, 100.000000, 0, 0.000000, 425204), -- walking
    (2168001, 2, -6257.910156, -3921.560059, -58.729599, 100.000000, 0, 0.000000, 0),
    (2168001, 3, -6277.290039, -3923.429932, -58.739300, 100.000000, 0, 0.000000, 0),
    (2168001, 4, -6285.640137, -3908.280029, -62.364300, 100.000000, 0, 0.000000, 0),
    (2168001, 5, -6265.839844, -3904.729980, -61.938499, 100.000000, 0, 0.000000, 0),
    (2168001, 6, -6236.060059, -3906.439941, -60.604599, 100.000000, 0, 0.000000, 0),
    (2168001, 7, -6202.140137, -3906.530029, -60.219799, 100.000000, 0, 0.000000, 425203); -- running

-- Gnome Racer to the start Position
DELETE FROM `creature_movement_special` WHERE `id`=2168201;
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
    (2168201, 1, -6209.330078, -3869.939941, -58.493801, 100.000000, 0, 0.000000, 425204), -- walking
    (2168201, 2, -6225.089844, -3885.040039, -58.862598, 100.000000, 0, 0.000000, 0),
    (2168201, 3, -6250.220215, -3883.010010, -59.253201, 100.000000, 0, 0.000000, 0),
    (2168201, 4, -6269.910156, -3876.899902, -58.739300, 100.000000, 0, 0.000000, 0),
    (2168201, 5, -6289.490234, -3876.360107, -58.739300, 100.000000, 0, 0.000000, 0),
    (2168201, 6, -6294.500000, -3887.939941, -61.835701, 100.000000, 0, 0.000000, 0),
    (2168201, 7, -6274.609863, -3902.090088, -62.129700, 100.000000, 0, 0.000000, 0),
    (2168201, 8, -6260.160156, -3899.000000, -61.511501, 100.000000, 0, 0.000000, 0),
    (2168201, 9, -6249.899902, -3897.959961, -61.104599, 100.000000, 0, 0.000000, 0),
    (2168201, 10, -6233.859863, -3898.100098, -60.479599, 100.000000, 0, 0.000000, 0),
    (2168201, 11, -6223.339844, -3897.280029, -60.469799, 100.000000, 0, 0.000000, 0),
    (2168201, 12, -6200.759766, -3897.639893, -60.219799, 100.000000, 0, 0.000000, 425203); -- running

-- Goblin Racer race waypoints
DELETE FROM `creature_movement_special` WHERE `id`=2168002;
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
    (2168002, 1, -6133.25, -3905.81, -59.842, 100, 0, 0.000000, 425201), -- Casting speed normal
    (2168002, 2, -6100.07, -3903.81, -59.717, 100, 0, 0.000000, 0),
    (2168002, 3, -6066.56, -3890.28, -59.795, 100, 0, 0.000000, 0),
    (2168002, 4, -6033.41, -3874.38, -59.9739, 100, 0, 0.000000, 0),
    (2168002, 5, -6000.01, -3857.21, -60.4537, 100, 0, 0.000000, 0),
    (2168002, 6, -5966.54, -3844.55, -60.6732, 100, 0, 0.000000, 0),
    (2168002, 7, -5933.4, -3824.23, -60.2982, 100, 0, 0.000000, 0),
    (2168002, 8, -5900.04, -3804.14, -59.6029, 100, 0, 0.000000, 0),
    (2168002, 9, -5866.87, -3793.61, -59.9385, 100, 0, 0.000000, 0),
    (2168002, 10, -5833.32, -3785.51, -61.0959, 100, 0, 0.000000, 0),
    (2168002, 11, -5799.98, -3787.21, -61.3648, 100, 0, 0.000000, 0),
    (2168002, 12, -5766.63, -3789.59, -61.7069, 100, 0, 0.000000, 0),
    (2168002, 13, -5733.34, -3797.22, -60.1085, 100, 0, 0.000000, 0),
    (2168002, 14, -5700.21, -3818.07, -61.6014, 100, 0, 0.000000, 0),
    (2168002, 15, -5685.05, -3833.11, -62.2498, 100, 0, 0.000000, 0),
    (2168002, 16, -5667.55, -3866.56, -62.115, 100, 0, 0.000000, 0),
    (2168002, 17, -5657.73, -3900, -61.5334, 100, 0, 0.000000, 0),
    (2168002, 18, -5653.18, -3933.22, -61.2834, 100, 0, 0.000000, 0),
    (2168002, 19, -5652.29, -3966.78, -61.0573, 100, 0, 0.000000, 0),
    (2168002, 20, -5650.53, -3999.94, -61.0573, 100, 0, 0.000000, 0),
    (2168002, 21, -5649.08, -4033.48, -61.0075, 100, 0, 0.000000, 0),
    (2168002, 22, -5648.3, -4066.6, -61.1325, 100, 0, 0.000000, 0),
    (2168002, 23, -5652.44, -4099.81, -61.3576, 100, 0, 0.000000, 0),
    (2168002, 24, -5671.46, -4133.38, -61.5347, 100, 0, 0.000000, 0),
    (2168002, 25, -5700.07, -4163.42, -60.3869, 100, 0, 0.000000, 0),
    (2168002, 26, -5733.37, -4176.76, -61.1795, 100, 0, 0.000000, 0),
    (2168002, 27, -5766.62, -4185.85, -61.4295, 100, 0, 0.000000, 0),
    (2168002, 28, -5800.16, -4191.41, -61.2359, 100, 0, 0.000000, 0),
    (2168002, 29, -5833.34, -4195.89, -62.0493, 100, 0, 0.000000, 0),
    (2168002, 30, -5866.64, -4196.89, -62.5493, 100, 0, 0.000000, 0),
    (2168002, 31, -5900.04, -4198.67, -62.8084, 100, 0, 0.000000, 0),
    (2168002, 32, -5933.33, -4199.23, -62.4698, 100, 0, 0.000000, 0),
    (2168002, 33, -5966.7, -4198.22, -62.1368, 100, 0, 0.000000, 0),
    (2168002, 34, -6000.16, -4197.21, -62.3337, 100, 0, 0.000000, 0),
    (2168002, 35, -6033.43, -4192.26, -62.5678, 100, 0, 0.000000, 0),
    (2168002, 36, -6066.48, -4187.53, -62.4428, 100, 0, 0.000000, 0),
    (2168002, 37, -6099.93, -4185.41, -62.1514, 100, 0, 0.000000, 0),
    (2168002, 38, -6133.35, -4185.92, -62.2596, 100, 0, 0.000000, 0),
    (2168002, 39, -6166.59, -4185.99, -61.6346, 100, 0, 0.000000, 0),
    (2168002, 40, -6199.97, -4193.5, -61.6038, 100, 0, 0.000000, 0),
    (2168002, 41, -6233.26, -4199.52, -61.5478, 100, 0, 0.000000, 0),
    (2168002, 42, -6266.7, -4207.48, -61.4769, 100, 0, 0.000000, 0),
    (2168002, 43, -6299.9, -4213.6, -61.1764, 100, 0, 0.000000, 0),
    (2168002, 44, -6333.38, -4215.57, -62.9005, 100, 0, 0.000000, 0),
    (2168002, 45, -6366.73, -4201.02, -61.1156, 100, 0, 0.000000, 0),
    (2168002, 46, -6384.84, -4186.21, -62.0015, 100, 0, 0.000000, 0),
    (2168002, 47, -6399.94, -4166.67, -62.8765, 100, 0, 0.000000, 0),
    (2168002, 48, -6414.76, -4133.3, -63.8719, 100, 0, 0.000000, 0),
    (2168002, 49, -6423.5, -4099.96, -63.7193, 100, 0, 0.000000, 0),
    (2168002, 50, -6429.27, -4066.76, -63.3443, 100, 0, 0.000000, 0),
    (2168002, 51, -6431.57, -4033.34, -63.0729, 100, 0, 0.000000, 0),
    (2168002, 52, -6430.09, -3999.91, -62.7196, 100, 0, 0.000000, 0),
    (2168002, 53, -6424.76, -3966.61, -62.7063, 100, 0, 0.000000, 0),
    (2168002, 54, -6414.58, -3943.41, -62.4563, 100, 0, 0.000000, 0),
    (2168002, 55, -6399.93, -3921.42, -61.8507, 100, 0, 0.000000, 0),
    (2168002, 56, -6366.61, -3906.05, -62.0885, 100, 0, 0.000000, 0),
    (2168002, 57, -6333.58, -3904.51, -62.4635, 100, 0, 0.000000, 0),
    (2168002, 58, -6300.12, -3902.57, -62.9893, 100, 0, 0.000000, 0),
    (2168002, 59, -6266.81, -3903.56, -61.7393, 100, 0, 0.000000, 0),
    (2168002, 60, -6233.3, -3899.03, -60.4698, 100, 0, 0.000000, 0),
    (2168002, 61, -6199.96, -3902.02, -60.157, 100, 0, 0.000000, 425202), -- Second turn begins
    (2168002, 62, -6166.72, -3901.35, -59.907, 100, 0, 0.000000, 0),
    (2168002, 63, -6133.35, -3901.26, -59.805, 100, 0, 0.000000, 0),
    (2168002, 64, -6100, -3899.35, -59.9679, 100, 0, 0.000000, 0),
    (2168002, 65, -6066.71, -3885.39, -60.0929, 100, 0, 0.000000, 0),
    (2168002, 66, -6033.36, -3869.34, -60.2654, 100, 0, 0.000000, 0),
    (2168002, 67, -6000.08, -3852.77, -60.4537, 100, 0, 0.000000, 0),
    (2168002, 68, -5966.72, -3840.43, -60.6262, 100, 0, 0.000000, 0),
    (2168002, 69, -5933.36, -3819.05, -60.1732, 100, 0, 0.000000, 0),
    (2168002, 70, -5900.03, -3799.97, -59.5531, 100, 0, 0.000000, 0),
    (2168002, 71, -5866.73, -3788.14, -60.109, 100, 0, 0.000000, 0),
    (2168002, 72, -5833.23, -3780.58, -61.1572, 100, 0, 0.000000, 0),
    (2168002, 73, -5800.01, -3781.26, -61.4072, 100, 0, 0.000000, 0),
    (2168002, 74, -5766.64, -3784.14, -61.5871, 100, 0, 0.000000, 0),
    (2168002, 75, -5733.32, -3792.87, -60.6395, 100, 0, 0.000000, 0),
    (2168002, 76, -5699.85, -3809.45, -61.1524, 100, 0, 0.000000, 0),
    (2168002, 77, -5677.42, -3833.19, -62.2948, 100, 0, 0.000000, 0),
    (2168002, 78, -5661.52, -3866.65, -61.8848, 100, 0, 0.000000, 0),
    (2168002, 79, -5652.25, -3900.14, -61.5334, 100, 0, 0.000000, 0),
    (2168002, 80, -5648.28, -3933.37, -61.1612, 100, 0, 0.000000, 0),
    (2168002, 81, -5648.34, -3966.84, -61.0573, 100, 0, 0.000000, 0),
    (2168002, 82, -5646.43, -3999.94, -61.0573, 100, 0, 0.000000, 0),
    (2168002, 83, -5644.9, -4033.34, -61.0075, 100, 0, 0.000000, 0),
    (2168002, 84, -5644.26, -4066.68, -61.2326, 100, 0, 0.000000, 0),
    (2168002, 85, -5648.3, -4099.86, -61.3576, 100, 0, 0.000000, 0),
    (2168002, 86, -5666.31, -4133.83, -61.4967, 100, 0, 0.000000, 0),
    (2168002, 87, -5696.92, -4166.7, -60.3329, 100, 0, 0.000000, 0),
    (2168002, 88, -5733.32, -4183.08, -61.4814, 100, 0, 0.000000, 0),
    (2168002, 89, -5766.7, -4191.44, -61.4497, 100, 0, 0.000000, 0),
    (2168002, 90, -5800.08, -4196.07, -61.2359, 100, 0, 0.000000, 0),
    (2168002, 91, -5833.32, -4200.6, -61.9859, 100, 0, 0.000000, 0),
    (2168002, 92, -5866.61, -4201.61, -62.5493, 100, 0, 0.000000, 0),
    (2168002, 93, -5899.97, -4203.64, -62.7825, 100, 0, 0.000000, 0),
    (2168002, 94, -5933.19, -4203.1, -62.5584, 100, 0, 0.000000, 0),
    (2168002, 95, -5966.68, -4203.19, -62.1368, 100, 0, 0.000000, 0),
    (2168002, 96, -6000.1, -4202.21, -62.3337, 100, 0, 0.000000, 0),
    (2168002, 97, -6033.48, -4197.92, -62.5678, 100, 0, 0.000000, 0),
    (2168002, 98, -6066.75, -4192.29, -62.2764, 100, 0, 0.000000, 0),
    (2168002, 99, -6099.97, -4190.12, -62.1514, 100, 0, 0.000000, 0),
    (2168002, 100,-6133.44, -4189.88, -62.2596, 100, 0, 0.000000, 0),
    (2168002, 101,-6166.76, -4189.73, -61.6038, 100, 0, 0.000000, 0),
    (2168002, 102,-6200.1, -4197.17, -61.5478, 100, 0, 0.000000, 0),
    (2168002, 103,-6233.42, -4204.05, -61.6202, 100, 0, 0.000000, 0),
    (2168002, 104,-6266.59, -4212.86, -61.4417, 100, 0, 0.000000, 0),
    (2168002, 105,-6300, -4219.36, -61.2755, 100, 0, 0.000000, 0),
    (2168002, 106,-6333.35, -4220.82, -62.9005, 100, 0, 0.000000, 0),
    (2168002, 107,-6377.85, -4199.63, -60.1673, 100, 0, 0.000000, 0),
    (2168002, 108,-6405.17, -4166.73, -63.0259, 100, 0, 0.000000, 0),
    (2168002, 109,-6421.51, -4133.32, -63.8106, 100, 0, 0.000000, 0),
    (2168002, 110,-6430.2, -4099.91, -63.7193, 100, 0, 0.000000, 0),
    (2168002, 111, -6435.36, -4066.73, -63.3589, 100, 0, 0.000000, 0),
    (2168002, 112, -6436.64, -4033.47, -63.0729, 100, 0, 0.000000, 0),
    (2168002, 113, -6435.22, -3999.96, -62.7196, 100, 0, 0.000000, 0),
    (2168002, 114, -6429.99, -3966.67, -62.7196, 100, 0, 0.000000, 0),
    (2168002, 115, -6414.23, -3933.37, -62.3313, 100, 0, 0.000000, 0),
    (2168002, 116, -6400.06, -3915.15, -61.7405, 100, 0, 0.000000, 0),
    (2168002, 117, -6366.74, -3901.17, -62.0463, 100, 0, 0.000000, 0),
    (2168002, 118, -6333.31, -3900.23, -62.429, 100, 0, 0.000000, 0),
    (2168002, 119, -6300.08, -3898.47, -62.9893, 100, 0, 0.000000, 0),
    (2168002, 120, -6266.67, -3898.97, -61.7393, 100, 0, 0.000000, 0),
    (2168002, 121, -6233.27, -3904.18, -60.4698, 100, 0, 0.000000, 425204), -- Turn on walking
    (2168002, 122, -6195.02, -3906.6, -60.157, 100, 0, 0.000000, 425205), -- Goblin win
    (2168002, 123, -6166.91, -3905.76, -59.907, 100, 31000, 0.000000, 0), -- Waiting position
    (2168002, 124, -6135.35, -3905.65, -59.805, 100, 0, 0.000000, 0), -- Return to camp
    (2168002, 125, -6123.58, -3901.43, -59.842, 100, 0, 0.000000, 0),
    (2168002, 126, -6116.44, -3888.03, -59.7954, 100, 0, 0.000000, 0),
    (2168002, 127, -6118.94, -3869.72, -58.6704, 100, 0, 0.000000, 0),
    (2168002, 128, -6144.71, -3851.75, -58.6251, 100, 0, 0.000000, 0),
    (2168002, 129, -6161.11, -3846.33, -58.6251, 100, 0, 0.000000, 0),
    (2168002, 130, -6184, -3850.08, -58.6251, 100, 0, 0.000000, 0),
    (2168002, 131, -6206.26, -3868.64, -58.7198, 100, 0, 0.000000, 0),
    (2168002, 132, -6225.77, -3882.67, -58.7198, 100, 0, 0.000000, 0),
    (2168002, 133, -6249.51, -3884.4, -59.5523, 100, 0, 0.000000, 0),
    (2168002, 134, -6269.09, -3883.56, -59.6353, 100, 0, 0.000000, 0),
    (2168002, 135, -6285.3, -3889.27, -62.0386, 100, 0, 0.000000, 0),
    (2168002, 136, -6293.79, -3902.07, -62.6817, 100, 0, 0.000000, 0),
    (2168002, 137, -6286.1, -3919.24, -59.1211, 100, 0, 0.000000, 0),
    (2168002, 138, -6267.81, -3937.63, -58.6251, 100, 0, 0.000000, 0),
    (2168002, 139, -6245.65, -3944.6, -58.6251, 100, 0, 0.000000, 0),
    (2168002, 140, -6225.51, -3941.11, -58.6251, 100, 0, 0.000000, 0); -- Parking position
    
-- Gnome Racer race waypoints
DELETE FROM `creature_movement_special` WHERE `id`=2168202;
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
    (2168202, 1, -6133.35, -3901.42, -59.805, 100, 0, 0.000000, 425201), -- Casting speed normal
    (2168202, 2, -6099.91, -3898.46, -59.9679, 100, 0, 0.000000, 0),
    (2168202, 3, -6066.67, -3884.78, -60.0929, 100, 0, 0.000000, 0),
    (2168202, 4, -6033.31, -3869.67, -60.2968, 100, 0, 0.000000, 0),
    (2168202, 5, -5999.87, -3851.73, -60.5012, 100, 0, 0.000000, 0),
    (2168202, 6, -5966.71, -3839.65, -60.6262, 100, 0, 0.000000, 0),
    (2168202, 7, -5933.39, -3820.98, -60.2982, 100, 0, 0.000000, 0),
    (2168202, 8, -5900.05, -3802.45, -59.6029, 100, 0, 0.000000, 0),
    (2168202, 9, -5866.5, -3788.73, -60.0765, 100, 0, 0.000000, 0),
    (2168202, 10, -5833.29, -3780.37, -61.1572, 100, 0, 0.000000, 0),
    (2168202, 11, -5800.03, -3781.42, -61.4072, 100, 0, 0.000000, 0),
    (2168202, 12, -5766.65, -3784.51, -61.5871, 100, 0, 0.000000, 0),
    (2168202, 13, -5733.2, -3793.67, -60.5443, 100, 0, 0.000000, 0),
    (2168202, 14, -5704.73, -3808.7, -61.2264, 100, 0, 0.000000, 0),
    (2168202, 15, -5677.43, -3833.24, -62.3016, 100, 0, 0.000000, 0),
    (2168202, 16, -5659.16, -3866.41, -61.9129, 100, 0, 0.000000, 0),
    (2168202, 17, -5651.55, -3900.01, -61.5334, 100, 0, 0.000000, 0),
    (2168202, 18, -5648.71, -3933.15, -61.2834, 100, 0, 0.000000, 0),
    (2168202, 19, -5647.5, -3966.49, -61.1612, 100, 0, 0.000000, 0),
    (2168202, 20, -5646.72, -4000.02, -61.0257, 100, 0, 0.000000, 0),
    (2168202, 21, -5645.38, -4033.45, -61.0075, 100, 0, 0.000000, 0),
    (2168202, 22, -5644.54, -4066.71, -61.2326, 100, 0, 0.000000, 0),
    (2168202, 23, -5649.04, -4100.04, -61.3591, 100, 0, 0.000000, 0),
    (2168202, 24, -5666.61, -4133.28, -61.4841, 100, 0, 0.000000, 0),
    (2168202, 25, -5680.22, -4152.24, -61.0347, 100, 0, 0.000000, 0),
    (2168202, 26, -5697.58, -4166.75, -60.4064, 100, 0, 0.000000, 0),
    (2168202, 27, -5716.81, -4178.95, -60.9487, 100, 0, 0.000000, 0),
    (2168202, 28, -5733.38, -4183.49, -61.3045, 100, 0, 0.000000, 0),
    (2168202, 29, -5766.69, -4191.3, -61.4497, 100, 0, 0.000000, 0),
    (2168202, 30, -5799.91, -4196, -61.1997, 100, 0, 0.000000, 0),
    (2168202, 31, -5833.25, -4199.12, -61.9859, 100, 0, 0.000000, 0),
    (2168202, 32, -5866.74, -4200.56, -62.6575, 100, 0, 0.000000, 0),
    (2168202, 33, -5900.13, -4202.18, -62.8084, 100, 0, 0.000000, 0),
    (2168202, 34, -5933.39, -4203.65, -62.4698, 100, 0, 0.000000, 0),
    (2168202, 35, -5966.55, -4204.89, -62.2198, 100, 0, 0.000000, 0),
    (2168202, 36, -5999.96, -4202.42, -62.2618, 100, 0, 0.000000, 0),
    (2168202, 37, -6033.31, -4196.95, -62.4587, 100, 0, 0.000000, 0),
    (2168202, 38, -6066.54, -4192.04, -62.27, 100, 0, 0.000000, 0),
    (2168202, 39, -6099.97, -4189.74, -62.1514, 100, 0, 0.000000, 0),
    (2168202, 40, -6133.38, -4188.98, -62.2596, 100, 0, 0.000000, 0),
    (2168202, 41, -6166.59, -4190.83, -61.6346, 100, 0, 0.000000, 0),
    (2168202, 42, -6200.08, -4196.06, -61.5478, 100, 0, 0.000000, 0),
    (2168202, 43, -6233.44, -4204.91, -61.6202, 100, 0, 0.000000, 0),
    (2168202, 44, -6266.61, -4214.26, -61.4398, 100, 0, 0.000000, 0),
    (2168202, 45, -6299.99, -4218.57, -61.1661, 100, 0, 0.000000, 0),
    (2168202, 46, -6366.58, -4207.5, -60.4598, 100, 0, 0.000000, 0),
    (2168202, 47, -6388.47, -4189.56, -61.2745, 100, 0, 0.000000, 0),
    (2168202, 48, -6421.38, -4133.46, -63.8622, 100, 0, 0.000000, 0),
    (2168202, 49, -6430.24, -4099.87, -63.7193, 100, 0, 0.000000, 0),
    (2168202, 50, -6435.72, -4066.49, -63.3229, 100, 0, 0.000000, 0),
    (2168202, 51, -6437.34, -4033.31, -63.0019, 100, 0, 0.000000, 0),
    (2168202, 52, -6434.35, -3999.77, -62.7196, 100, 0, 0.000000, 0),
    (2168202, 53, -6428.75, -3966.57, -62.7063, 100, 0, 0.000000, 0),
    (2168202, 54, -6413.36, -3933.6, -62.3313, 100, 0, 0.000000, 0),
    (2168202, 55, -6395.58, -3912.14, -61.5463, 100, 0, 0.000000, 0),
    (2168202, 56, -6366.69, -3902.2, -62.0463, 100, 0, 0.000000, 0),
    (2168202, 57, -6333.17, -3901.06, -62.4463, 100, 0, 0.000000, 0),
    (2168202, 58, -6299.98, -3898.26, -62.9893, 100, 0, 0.000000, 0),
    (2168202, 59, -6266.57, -3898.37, -61.7296, 100, 0, 0.000000, 0),
    (2168202, 60, -6233.34, -3905.97, -60.4796, 100, 0, 0.000000, 0),
    (2168202, 61, -6200.01, -3906.2, -60.2198, 100, 0, 0.000000, 425202), -- Second turn begins
    (2168202, 62, -6166.75, -3906.33, -59.907, 100, 0, 0.000000, 0),
    (2168202, 63, -6133.25, -3905.49, -59.842, 100, 0, 0.000000, 0),
    (2168202, 64, -6100.07, -3901.82, -59.717, 100, 0, 0.000000, 0),
    (2168202, 65, -6066.59, -3888.51, -60.0101, 100, 0, 0.000000, 0),
    (2168202, 66, -6033.25, -3873.88, -60.1191, 100, 0, 0.000000, 0),
    (2168202, 67, -5999.97, -3856.45, -60.5012, 100, 0, 0.000000, 0),
    (2168202, 68, -5966.69, -3843.97, -60.6262, 100, 0, 0.000000, 0),
    (2168202, 69, -5933.33, -3823.99, -60.2279, 100, 0, 0.000000, 0),
    (2168202, 70, -5900, -3806.01, -59.4796, 100, 0, 0.000000, 0),
    (2168202, 71, -5866.72, -3794.04, -59.8861, 100, 0, 0.000000, 0),
    (2168202, 72, -5833.33, -3785.03, -61.0765, 100, 0, 0.000000, 0),
    (2168202, 73, -5800.06, -3786.57, -61.2822, 100, 0, 0.000000, 0),
    (2168202, 74, -5766.56, -3790.04, -61.6447, 100, 0, 0.000000, 0),
    (2168202, 75, -5733.28, -3798.53, -59.9039, 100, 0, 0.000000, 0),
    (2168202, 76, -5707.86, -3812.45, -61.1522, 100, 0, 0.000000, 0),
    (2168202, 77, -5684.59, -3833.43, -62.24, 100, 0, 0.000000, 0),
    (2168202, 78, -5666.18, -3866.69, -62.0178, 100, 0, 0.000000, 0),
    (2168202, 79, -5658.49, -3900.12, -61.5334, 100, 0, 0.000000, 0),
    (2168202, 80, -5654.3, -3933.39, -61.1612, 100, 0, 0.000000, 0),
    (2168202, 81, -5653.73, -3966.71, -61.0573, 100, 0, 0.000000, 0),
    (2168202, 82, -5651.99, -4000.03, -61.0257, 100, 0, 0.000000, 0),
    (2168202, 83, -5649.12, -4033.43, -61.0075, 100, 0, 0.000000, 0),
    (2168202, 84, -5649.73, -4066.72, -61.2326, 100, 0, 0.000000, 0),
    (2168202, 85, -5653.35, -4099.68, -61.3576, 100, 0, 0.000000, 0),
    (2168202, 86, -5670.12, -4130.07, -61.5094, 100, 0, 0.000000, 0),
    (2168202, 87, -5681.78, -4147.25, -61.4097, 100, 0, 0.000000, 0),
    (2168202, 88, -5699.9, -4162.49, -60.3479, 100, 0, 0.000000, 0),
    (2168202, 89, -5715.94, -4172.07, -60.6601, 100, 0, 0.000000, 0),
    (2168202, 90, -5733.38, -4176.66, -61.1795, 100, 0, 0.000000, 0),
    (2168202, 91, -5766.69, -4185.95, -61.4497, 100, 0, 0.000000, 0),
    (2168202, 92, -5799.98, -4191.15, -61.1997, 100, 0, 0.000000, 0),
    (2168202, 93, -5833.27, -4195.06, -61.9859, 100, 0, 0.000000, 0),
    (2168202, 94, -5866.67, -4196.83, -62.6575, 100, 0, 0.000000, 0),
    (2168202, 95, -5900.02, -4198.79, -62.8084, 100, 0, 0.000000, 0),
    (2168202, 96, -5933.07, -4199.55, -62.5584, 100, 0, 0.000000, 0),
    (2168202, 97, -5966.77, -4199.54, -62.1368, 100, 0, 0.000000, 0),
    (2168202, 98, -5999.79, -4197.45, -62.2618, 100, 0, 0.000000, 0),
    (2168202, 99, -6033.2, -4191.87, -62.4587, 100, 0, 0.000000, 0),
    (2168202, 100, -6066.62, -4186.7, -62.2612, 100, 0, 0.000000, 0),
    (2168202, 101, -6100.1, -4185.15, -62.1614, 100, 0, 0.000000, 0),
    (2168202, 102, -6133.3, -4184.84, -62.228, 100, 0, 0.000000, 0),
    (2168202, 103, -6166.84, -4186.29, -61.6038, 100, 0, 0.000000, 0),
    (2168202, 104, -6199.87, -4192.75, -61.6038, 100, 0, 0.000000, 0),
    (2168202, 105, -6233.3, -4200.09, -61.5623, 100, 0, 0.000000, 0),
    (2168202, 106, -6266.83, -4209.08, -61.4769, 100, 0, 0.000000, 0),
    (2168202, 107, -6333.61, -4215.17, -62.9005, 100, 0, 0.000000, 0),
    (2168202, 108, -6366.72, -4200.08, -61.1156, 100, 0, 0.000000, 0),
    (2168202, 109, -6397.83, -4166.61, -62.8611, 100, 0, 0.000000, 0),
    (2168202, 110, -6415.05, -4133.32, -63.8719, 100, 0, 0.000000, 0),
    (2168202, 111, -6423.85, -4100, -63.7469, 100, 0, 0.000000, 0),
    (2168202, 112, -6430.66, -4066.52, -63.3229, 100, 0, 0.000000, 0),
    (2168202, 113, -6432.58, -4033.32, -63.0019, 100, 0, 0.000000, 0),
    (2168202, 114, -6430.55, -4000.06, -62.7519, 100, 0, 0.000000, 0),
    (2168202, 115, -6424.67, -3966.6, -62.7063, 100, 0, 0.000000, 0),
    (2168202, 116, -6409.12, -3933.43, -62.3313, 100, 0, 0.000000, 0),
    (2168202, 117, -6392.96, -3915.75, -61.5463, 100, 0, 0.000000, 0),
    (2168202, 118, -6366.69, -3906.5, -62.0463, 100, 0, 0.000000, 0),
    (2168202, 119, -6333.17, -3904.83, -62.6143, 100, 0, 0.000000, 0),
    (2168202, 120, -6300.04, -3902.83, -62.9893, 100, 0, 0.000000, 0),
    (2168202, 121, -6266.62, -3902.6, -61.7296, 100, 0, 0.000000, 0),
    (2168202, 122, -6233.63, -3898.84, -60.4796, 100, 0, 0.000000, 425204), -- Turn on walking
    (2168202, 123, -6193.93, -3899.92, -60.157, 100, 0, 0.000000, 425206), -- Gnome wins
    (2168202, 124, -6166.57, -3896.82, -59.805, 100, 30000, 0.000000, 0), -- Waiting position
    (2168202, 125, -6133.96, -3895.67, -59.805, 100, 0, 0.000000, 0), -- Return to camp
    (2168202, 126, -6124.58, -3890.32, -59.4468, 100, 0, 0.000000, 0),
    (2168202, 127, -6120.73, -3863.32, -58.6251, 100, 0, 0.000000, 0),
    (2168202, 128, -6130.06, -3844.84, -58.6251, 100, 0, 0.000000, 0),
    (2168202, 129, -6149.06, -3828.92, -58.6251, 100, 0, 0.000000, 0),
    (2168202, 130, -6168.33, -3815.06, -58.6251, 100, 0, 0.000000, 0),
    (2168202, 131, -6190.14, -3811.94, -58.6251, 100, 0, 0.000000, 0),
    (2168202, 132, -6204.73, -3819.14, -58.6251, 100, 0, 0.000000, 0),
    (2168202, 133, -6212.5, -3830.33, -58.6251, 100, 0, 0.000000, 0),
    (2168202, 134, -6213.92, -3839.95, -58.6251, 100, 0, 0.000000, 0),
    (2168202, 135, -6213.07, -3849.85, -58.6251, 100, 0, 0.000000, 0); -- Parking position


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
