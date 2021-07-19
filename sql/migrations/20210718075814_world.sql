DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210718075814');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210718075814');
-- Add your query below.


-- Events list for Bloodscalp Headhunter
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name` = '' WHERE `entry` = 671;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(67101, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bloodscalp Headhunter - Flee');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (67101, 671, 0, 2, 0, 100, 0, 15, 0, 0, 0, 67101, 0, 0, 'Bloodscalp Headhunter - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(67102, 0, 15, 8599, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bloodscalp Headhunter - Cast Spell Enrage'),
(67102, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7798, 0, 0, 0, 0, 0, 0, 0, 0, 'Bloodscalp Headhunter - Say Text');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (67102, 671, 0, 2, 0, 100, 0, 30, 0, 0, 0, 67102, 0, 0, 'Bloodscalp Headhunter - Cast Enrage at 30% HP');

-- Events list for Bloodscalp Scout
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name` = '' WHERE `entry` = 588;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(58801, 0, 15, 8599, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bloodscalp Scout - Cast Spell Enrage');
(58802, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7798, 0, 0, 0, 0, 0, 0, 0, 0, 'Bloodscalp Scout - Say Text');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (58801, 588, 0, 2, 0, 100, 0, 30, 0, 0, 0, 58801, 0, 0, 'Bloodscalp Scout - Cast Enrage at 30% HP');

-- Events list for Bloodscalp Witch Doctor
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name` = '' WHERE `entry` = 660;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(66001, 0, 15, 5605, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bloodscalp Witch Doctor - Cast Spell Healing Ward'),
(66002, 0, 15, 8376, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bloodscalp Witch Doctor - Cast Spell Earthgrab Totem');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (66001, 660, 0, 0, 0, 100, 3, 6500, 15300, 13300, 21700, 66001, 66002, 0, 'Bloodscalp Witch Doctor - Cast Healing Ward or Cast Earthgrab Totem');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(66003, 0, 15, 8599, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bloodscalp Witch Doctor - Cast Spell Enrage'),
(66003, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7798, 0, 0, 0, 0, 0, 0, 0, 0, 'Bloodscalp Witch Doctor - Say Text');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (66002, 660, 0, 2, 0, 100, 0, 30, 0, 0, 0, 66003, 0, 0, 'Bloodscalp Witch Doctor - Cast Enrage at 30% HP');

-- Events list for Rot Hide Gladerunner
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name` = '' WHERE `entry` = 1772;
DELETE FROM `creature_ai_events` WHERE `creature_id`=1772;
DELETE FROM `creature_ai_scripts` WHERE `id`=177202;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (177202, 0, 31, 1983, 100, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rot Hide Gladerunner - Check Nightlash Spawn');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (177202, 2, 10, 1983, 150000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, 1078.49, 1541.23, 28.9379, 0.113425, 0, 'Rot Hide Gladerunner - Summon Creature Nightlash');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (177202, 1772, 0, 6, 0, 20, 0, 0, 0, 0, 0, 177202, 0, 0, 'Rot Hide Gladerunner - Spawn Nightlash on Death');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(177201, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1871, 1870, 0, 0, 0, 0, 0, 0, 0, 'Rot Hide Gladerunner - Say Text');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (177201, 1772, 0, 4, 0, 15, 0, 0, 0, 0, 0, 177201, 0, 0, 'Rot Hide Gladerunner - Random Say on Aggro');

-- Events list for Rot Hide Mystic
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name` = '' WHERE `entry` = 1773;
DELETE FROM `creature_ai_scripts` WHERE `id` IN (177301, 177302, 177303);
DELETE FROM `creature_ai_events` WHERE `creature_id`=1773;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (177301, 0, 31, 1983, 100, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rot Hide Mystic - Check Nightlash Spawn');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (177301, 0, 10, 1983, 150000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, 1078.49, 1541.23, 28.9379, 0.113425, 0, 'Rot Hide Mystic - Summon Creature Nightlash');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (177301, 1773, 0, 6, 0, 20, 0, 0, 0, 0, 0, 177301, 0, 0, 'Rot Hide Mystic - Spawn Nightlash on Death');

-- Events list for Rot Hide Gnoll
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name` = '' WHERE `entry` = 1674;
DELETE FROM `creature_ai_scripts` WHERE `id` IN (167401, 167402, 167403);
DELETE FROM `creature_ai_events` WHERE `creature_id`=1674;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(167401, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1871, 1870, 0, 0, 0, 0, 0, 0, 0, 'Rot Hide Gnoll - Say Text');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (167401, 1674, 0, 4, 0, 15, 0, 0, 0, 0, 0, 167401, 0, 0, 'Rot Hide Gnoll - Random Say on Aggro');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(167402, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rot Hide Gnoll - Flee');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (167402, 1674, 0, 2, 0, 100, 0, 15, 0, 0, 0, 167402, 0, 0, 'Rot Hide Gnoll - Flee at 15% HP');

-- Events list for Venture Co. Strip Miner
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name` = '' WHERE `entry` = 674;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(67401, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Venture Co. Strip Miner - Flee');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (67401, 674, 0, 2, 0, 100, 0, 15, 0, 0, 0, 67401, 0, 0, 'Venture Co. Strip Miner - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(67402, 0, 15, 7978, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Venture Co. Strip Miner - Cast Spell Throw Dynamite');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (67402, 674, 0, 9, 0, 100, 1, 5, 30, 12000, 15000, 67402, 0, 0, 'Venture Co. Strip Miner - Cast Throw Dynamite');

-- Events list for Venture Co. Foreman
UPDATE `creature_template` SET`ai_name`='EventAI', `script_name` = '' WHERE `entry` = 675;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (67501, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 306, 0, 0, 0, 0, 0, 0, 0, 0, 'Venture Co. Foreman - Talk - OOC');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (67501, 675, 0, 1, 0, 100, 1, 10000, 30000, 30000, 45000, 67501, 0, 0, 'Venture Co. Foreman - Talk - OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(67502, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Venture Co. Foreman - Flee');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (67502, 675, 0, 2, 0, 100, 0, 15, 0, 0, 0, 67502, 0, 0, 'Venture Co. Foreman - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(67503, 0, 15, 8258, 32, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Venture Co. Foreman - Cast Spell Devotion Aura');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (67503, 675, 0, 1, 0, 100, 1, 1000, 1000, 240000, 240000, 67503, 0, 0, 'Venture Co. Foreman - Cast Devotion Aura OOC');

-- Events list for Venture Co. Tinkerer
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name` = '' WHERE `entry` = 677;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(67701, 0, 15, 20823, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Venture Co. Tinkerer - Cast Spell Fireball');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (67701, 677, 0, 9, 0, 100, 1, 8, 40, 5000, 10000, 67701, 0, 0, 'Venture Co. Tinkerer - Cast Fireball');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(67702, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Venture Co. Tinkerer - Flee');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (67702, 677, 0, 2, 0, 100, 0, 15, 0, 0, 0, 67702, 0, 0, 'Venture Co. Tinkerer - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(67703, 0, 15, 12544, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Venture Co. Tinkerer - Cast Spell Frost Armor');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (67703, 677, 0, 27, 0, 100, 1, 12544, 1, 15000, 30000, 67703, 0, 0, 'Venture Co. Tinkerer - Cast Frost Armor on Missing Buff');

-- Events list for Mosh'Ogg Mauler
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name` = '' WHERE `entry` = 678;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(67801, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1925, 1926, 1927, 0, 0, 0, 0, 0, 0, 'Mosh\'Ogg Mauler - Say Text');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (67801, 678, 0, 4, 0, 15, 0, 0, 0, 0, 0, 67801, 0, 0, 'Mosh\'Ogg Mauler - Say on Aggro');

-- Events list for Mosh'Ogg Shaman
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name` = '' WHERE `entry` = 679;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(67901, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1925, 1926, 1927, 0, 0, 0, 0, 0, 0, 'Mosh\'Ogg Shaman - Say Text');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (67901, 679, 0, 4, 0, 15, 0, 0, 0, 0, 0, 67901, 0, 0, 'Mosh\'Ogg Shaman - Say on Aggro');

-- Events list for Mosh'Ogg Lord
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name` = '' WHERE `entry` = 680;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(68001, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1925, 1926, 1927, 0, 0, 0, 0, 0, 0, 'Mosh\'Ogg Lord - Say Text');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (68001, 680, 0, 4, 0, 15, 0, 0, 0, 0, 0, 68001, 0, 0, 'Mosh\'Ogg Lord - Say on Aggro');

-- Events list for Bloodscalp Tiger
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name` = '' WHERE `entry` = 698;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(69801, 0, 15, 8599, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bloodscalp Tiger - Cast Spell Enrage'),
(69801, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7798, 0, 0, 0, 0, 0, 0, 0, 0, 'Bloodscalp Tiger - Say Text');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (69801, 698, 0, 2, 0, 100, 0, 30, 0, 0, 0, 69801, 0, 0, 'Bloodscalp Tiger - Cast Enrage at 30% HP');

-- Events list for Bloodscalp Scavenger
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry` = 702;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(70201, 0, 15, 8599, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bloodscalp Scavenger - Cast Spell Enrage');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (70201, 702, 0, 2, 0, 100, 0, 30, 0, 0, 0, 70201, 0, 0, 'Bloodscalp Scavenger - Cast Enrage at 30% HP');

-- Events list for Mosh'Ogg Warmonger
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry` = 709;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(70901, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1925, 1926, 1927, 0, 0, 0, 0, 0, 0, 'Mosh\'Ogg Warmonger - Say Text');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (70901, 709, 0, 4, 0, 15, 0, 0, 0, 0, 0, 70901, 0, 0, 'Mosh\'Ogg Warmonger - Say on Aggro');

-- Events list for Mosh'Ogg Spellcrafter
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry` = 710;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(71001, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1925, 1926, 1927, 0, 0, 0, 0, 0, 0, 'Mosh\'Ogg Spellcrafter - Say Text');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (71001, 710, 0, 4, 0, 15, 0, 0, 0, 0, 0, 71001, 0, 0, 'Mosh\'Ogg Spellcrafter - Say on Aggro');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(71002, 0, 15, 12544, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mosh\'Ogg Spellcrafter - Cast Spell Frost Armor');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (71002, 710, 0, 27, 0, 100, 1, 12544, 1, 15000, 30000, 71002, 0, 0, 'Mosh\'Ogg Spellcrafter - Cast Frost Armor on Missing Buff');

-- Events list for Mosh'Ogg Butcher
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry` = 723;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(72301, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1925, 1926, 1927, 0, 0, 0, 0, 0, 0, 'Mosh\'Ogg Butcher - Say Text');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (72301, 723, 0, 4, 0, 15, 0, 0, 0, 0, 0, 72301, 0, 0, 'Mosh\'Ogg Butcher - Say on Aggro');

-- Events list for Colonel Kurzen
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name` = '' WHERE `entry` = 813;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(81301, 0, 44, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Colonel Kurzen - Increment Phase');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (81301, 813, 0, 4, 0, 100, 0, 0, 0, 0, 0, 81301, 0, 0, 'Colonel Kurzen - Set Phase 1 on Aggro');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(81302, 0, 15, 8817, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Colonel Kurzen - Cast Spell Smoke Bomb'),
(81302, 0, 44, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Colonel Kurzen - Increment Phase');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (81302, 813, 0, 0, 5, 100, 1, 8000, 12000, 18000, 25000, 81302, 0, 0, 'Colonel Kurzen - Cast Smoke Bomb (Phase 1)');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(81303, 0, 15, 8818, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Colonel Kurzen - Cast Spell Garrote'),
(81303, 0, 44, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Colonel Kurzen - Increment Phase');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (81303, 813, 0, 27, 3, 100, 1, 8822, 1, 100, 100, 81303, 0, 0, 'Colonel Kurzen - Cast Garrote (Rank 4) on Missing Stealth Buff (Phase 2)');

-- Events list for Mai'Zoth
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name` = '' WHERE `entry` = 818;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(81801, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1925, 1926, 1927, 0, 0, 0, 0, 0, 0, 'Mai\'Zoth - Say Text');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (81801, 818, 0, 4, 0, 15, 0, 0, 0, 0, 0, 81801, 0, 0, 'Mai\'Zoth - Say on Aggro');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(81802, 0, 15, 8398, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mai\'Zoth - Cast Spell Frostbolt Volley');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (81802, 818, 0, 9, 0, 100, 1, 0, 30, 6000, 12000, 81802, 0, 0, 'Mai\'Zoth - Cast Frostbolt Volley');

-- Events list for Veyzhak the Cannibal
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name` = '' WHERE `entry` = 5399;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(539901, 0, 15, 8599, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Veyzhak the Cannibal - Cast Spell Enrage'),
(539901, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7798, 0, 0, 0, 0, 0, 0, 0, 0, 'Veyzhak the Cannibal - Say Text');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (539901, 5399, 0, 2, 0, 100, 0, 30, 0, 0, 0, 539901, 0, 0, 'Veyzhak the Cannibal - Cast Enrage at 30% HP');

-- Events list for Saltscale Tide Lord
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name` = '' WHERE `entry` = 875;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(87501, 0, 15, 12544, 32, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Saltscale Tide Lord - Cast Spell Frost Armor');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (87501, 875, 0, 1, 0, 100, 1, 1000, 1000, 1800000, 1800000, 87501, 0, 0, 'Saltscale Tide Lord - Cast Frost Armor OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(87502, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Saltscale Tide Lord - Flee');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (87502, 875, 0, 2, 0, 100, 0, 15, 0, 0, 0, 87502, 0, 0, 'Saltscale Tide Lord - Flee at 15% HP');

-- Events list for Saltscale Forager
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name` = '' WHERE `entry` = 875;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(87701, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Saltscale Forager - Flee');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (87701, 877, 0, 2, 0, 100, 0, 15, 0, 0, 0, 87701, 0, 0, 'Saltscale Forager - Flee at 15% HP');

-- Events list for Saltscale Hunter
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name` = '' WHERE `entry` = 879;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(87901, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Saltscale Hunter - Flee');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (87901, 879, 0, 2, 0, 100, 0, 15, 0, 0, 0, 87901, 0, 0, 'Saltscale Hunter - Flee at 15% HP');

-- Events list for Mogh the Undying
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name` = '' WHERE `entry` = 1060;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(106001, 0, 15, 20798, 34, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mogh the Undying - Cast Spell Demon Skin');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (106001, 1060, 0, 1, 0, 100, 1, 1000, 1000, 1800000, 1800000, 106001, 0, 0, 'Mogh the Undying - Cast Demon Skin OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(106002, 0, 15, 8813, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mogh the Undying - Cast Spell Summon Kurzen Mindslave');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (106002, 1060, 0, 1, 0, 100, 0, 2000, 2000, 0, 0, 106002, 0, 0, 'Mogh the Undying - Cast Summon Kurzen Mindslave OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(106003, 0, 56, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mogh the Undying - Despawn Guardians');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (106003, 1060, 0, 7, 0, 100, 0, 0, 0, 0, 0, 106003, 0, 0, 'Mogh the Undying - Despawn Guardians on Evade');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(106004, 0, 15, 8809, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mogh the Undying - Cast Spell Slave Drain');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (106004, 1060, 0, 2, 0, 100, 1, 50, 0, 12000, 16000, 106004, 0, 0, 'Mogh the Undying - Cast Slave Drain at 50% HP');

-- Events list for Zanzil the Outcast
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name` = '' WHERE `entry` = 2534;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(253401, 0, 15, 8832, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zanzil the Outcast - Cast Spell Ward of Zanzil');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (253401, 2534, 0, 0, 0, 100, 0, 5000, 10000, 0, 0, 253401, 0, 0, 'Zanzil the Outcast - Cast Ward of Zanzil');

-- Events list for Lord Sakrasis
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name` = '' WHERE `entry` = 2541;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(254101, 0, 15, 7160, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Sakrasis - Cast Spell Execute');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (254101, 2541, 0, 12, 0, 100, 1, 20, 0, 30000, 30000, 254101, 0, 0, 'Lord Sakrasis - Cast Execute when Target HP below 20%');

-- Events list for Witchwing Ambusher
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name` = '' WHERE `entry` = 3279;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(327901, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -200, -201, -202, 0, 0, 0, 0, 0, 0, 'Witchwing Ambusher - Say Text');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (327901, 3279, 0, 4, 0, 20, 0, 0, 0, 0, 0, 327901, 0, 0, 'Witchwing Ambusher - Say on Aggro');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(327902, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Witchwing Ambusher - Flee');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (327902, 3279, 0, 2, 0, 100, 0, 15, 0, 0, 0, 327902, 0, 0, 'Witchwing Ambusher - Flee at 15% HP');

-- Events list for Witchwing Windcaller
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name` = '' WHERE `entry` = 3280;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(328001, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2229, 2230, 2231, 0, 0, 0, 0, 0, 0, 'Witchwing Windcaller - Say Text');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (328001, 3280, 0, 4, 0, 20, 0, 0, 0, 0, 0, 328001, 0, 0, 'Witchwing Windcaller - Say on Aggro');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(328002, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Witchwing Windcaller - Flee');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (328002, 3280, 0, 2, 0, 100, 0, 15, 0, 0, 0, 328002, 0, 0, 'Witchwing Windcaller - Flee at 15% HP');

-- Events list for War Golem
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name` = '' WHERE `entry` = 2751;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(275101, 0, 15, 9576, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'War Golem - Cast Spell Lock Down');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (275101, 2751, 0, 9, 0, 100, 1, 0, 5, 25000, 28000, 275101, 0, 0, 'War Golem - Cast Lock Down');

-- Events list for Southsea Cannoneer
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name` = '' WHERE `entry` = 3382;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(338201, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Southsea Cannoneer - Flee');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (338201, 3382, 0, 2, 0, 100, 0, 15, 0, 0, 0, 338201, 0, 0, 'Southsea Cannoneer - Flee at 15% HP');

-- Events list for Southsea Privateer
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name` = '' WHERE `entry` = 3384;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(338401, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Southsea Privateer - Flee');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (338401, 3384, 0, 2, 0, 100, 0, 15, 0, 0, 0, 338401, 0, 0, 'Southsea Privateer - Flee at 15% HP');

-- Events list for Salt Flats Scavenger
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name` = '' WHERE `entry` = 4154;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(415401, 0, 15, 7160, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Salt Flats Scavenger - Cast Spell Execute');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (415401, 4154, 0, 12, 0, 100, 1, 20, 0, 30000, 30000, 415401, 0, 0, 'Salt Flats Scavenger - Cast Execute when Target HP below 20%');

-- Events list for Foreman Cozzle
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name` = '' WHERE `entry` = 4723;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(472301, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Foreman Cozzle - Flee');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (472301, 4723, 0, 2, 0, 100, 0, 15, 0, 0, 0, 472301, 0, 0, 'Foreman Cozzle - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(472302, 0, 15, 4979, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Foreman Cozzle - Cast Spell Quick Flame Ward');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (472302, 4723, 0, 2, 0, 100, 1, 50, 0, 10100, 19800, 472302, 0, 0, 'Foreman Cozzle - Cast Quick Flame Ward at 50% HP');

-- Events list for Blackfathom Oracle
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name` = '' WHERE `entry` = 4803;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(480301, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackfathom Oracle - Flee');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (480301, 4803, 0, 2, 0, 100, 0, 15, 0, 0, 0, 480301, 0, 0, 'Blackfathom Oracle - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(480302, 0, 15, 11986, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackfathom Oracle - Cast Spell Healing Wave');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (480302, 4803, 0, 14, 0, 100, 1, 280, 40, 18000, 24000, 480302, 0, 0, 'Blackfathom Oracle - Cast Healing Wave on Friendly Missing HP');

-- Events list for Takk the Leaper
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name` = '' WHERE `entry` = 5842;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(584201, 0, 15, 6268, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Takk the Leaper - Cast Spell Rushing Charge');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (584201, 5842, 0, 4, 0, 100, 0, 0, 0, 0, 0, 584201, 0, 0, 'Takk the Leaper - Cast Rushing Charge');

-- Events list for Captain Gerogg Hammertoe
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name` = '' WHERE `entry` = 5851;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(585101, 0, 15, 871, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Gerogg Hammertoe - Cast Spell Shield Wall');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (585101, 5851, 0, 2, 0, 100, 1, 30, 0, 30000, 40000, 585101, 0, 0, 'Captain Gerogg Hammertoe - Cast Shield Wall at 30% HP');

-- Events list for Achellios the Banished
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name` = '' WHERE `entry` = 5933;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(593301, 0, 15, 9128, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Achellios the Banished - Cast Spell Battle Shout');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (593301, 5933, 0, 4, 0, 100, 0, 0, 0, 0, 0, 593301, 0, 0, 'Achellios the Banished - Cast Battle Shout on Aggro');

-- Events list for Vile Sting
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name` = '' WHERE `entry` = 5937;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(593701, 0, 15, 8257, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vile Sting - Cast Spell Venom Sting');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (593701, 5937, 0, 28, 0, 100, 1, 8257, 3, 25000, 35000, 593701, 0, 0, 'Vile Sting - Cast Venom Sting on Target Missing Aura Stack');

-- Events list for Kurzen Mindslave
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name` = '' WHERE `entry` = 6366;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(636601, 0, 15, 11642, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurzen Mindslave - Cast Spell Heal');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (636601, 6366, 0, 14, 0, 100, 1, 825, 40, 15300, 22900, 636601, 0, 0, 'Kurzen Mindslave - Cast Heal on Friendly Missing HP');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(636602, 0, 15, 7964, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurzen Mindslave - Cast Spell Smoke Bomb'),
(636602, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurzen Mindslave - Flee');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (636602, 6366, 0, 2, 0, 100, 0, 15, 0, 0, 0, 636602, 0, 0, 'Kurzen Mindslave - Cast Smoke Bomb and Flee at 15% HP');

-- Events list for Digmaster Shovelphlange
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name` = '' WHERE `entry` = 7057;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(705701, 0, 15, 7164, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Digmaster Shovelphlange - Cast Spell Defensive Stance');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (705701, 7057, 0, 4, 0, 100, 0, 0, 0, 0, 0, 705701, 0, 0, 'Digmaster Shovelphlange - Cast Defensive Stance on Aggro');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(705702, 0, 15, 8380, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Digmaster Shovelphlange - Cast Spell Sunder Armor');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (705702, 7057, 0, 28, 0, 100, 1, 8380, 5, 10000, 10000, 705702, 0, 0, 'Digmaster Shovelphlange - Cast Sunder Armor on Target Missing Aura Stack');










-- Add Spell Lists
UPDATE `creature_template` SET `script_name` = '' WHERE `entry` IN (667, 1772, 1773, 1940, 1942, 1674, 677, 679, 680, 702, 709, 710, 723, 730, 781, 782, 818, 5399, 875, 877, 879, 978, 1060, 1094, 2534, 2541, 2635, 2749, 3101, 3280, 3382, 3384, 4249, 4723, 4803, 4807, 5256, 5345, 5401, 5851, 5934, 6231, 6494);

-- Spell list for Bloodscalp Headhunter
UPDATE `creature_template` SET `spell_list_id`=6710 WHERE `entry`=671;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`) VALUES (6710, 'Stranglethorn Vale - Bloodscalp Headhunter', 10277, 100, 1, 0, 0, 136, 0, 0, 2, 3);

-- Spell list for Skullsplitter Warrior
UPDATE `creature_template` SET `spell_list_id`=6670 WHERE `entry`=667;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`) VALUES (6670, 'ZonePlaceholder - Skullsplitter Warrior', 11972, 100, 1, 0, 0, 257, 0, 0, 15, 20, 3148, 100, 1, 0, 0, 32, 5, 7, 23, 26);

-- Spell list for Rot Hide Gladerunner
UPDATE `creature_template` SET `spell_list_id`=17720 WHERE `entry`=1772;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`) VALUES (17720, 'Silverpine Forest - Rot Hide Gladerunner', 3237, 100, 1, 0, 0, 32, 21, 34, 10, 45);

-- Spell list for Rot Hide Gnoll
UPDATE `creature_template` SET `spell_list_id`=16740 WHERE `entry`=1674;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`) VALUES (16740, ' Tirisfal Glades - Rot Hide Gnoll', 3237, 100, 1, 0, 0, 32, 7, 21, 30, 45);

-- Spell list for Venture Co. Tinkerer
UPDATE `creature_template` SET `spell_list_id`=6770 WHERE `entry`=677;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`) VALUES (6770, 'Stranglethorn Vale - Venture Co. Tinkerer', 7979, 100, 0, 0, 0, 0, 5, 9, 70, 85);

-- Spell list for Mosh'Ogg Shaman
UPDATE `creature_template` SET `spell_list_id`=6790 WHERE `entry`=679;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (6790, 'Stranglethorn Vale - Mosh\'Ogg Shaman', 11899, 100, 0, 0, 0, 0, 7, 13, 30, 35, 0, 12058, 100, 1, 0, 0, 8, 2, 6, 5, 11, 0, 6742, 100, 17, 0, 0, 0, 3, 15, 20, 68, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 0);

-- Spell list for Mosh'Ogg Lord
UPDATE `creature_template` SET `spell_list_id`=6800 WHERE `entry`=680;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`) VALUES (6800, 'Stranglethorn Vale - Mosh\'Ogg Lord', 9128, 100, 0, 0, 0, 0, 1, 4, 30, 40, 7093, 100, 1, 0, 0, 32, 3, 6, 20, 25);

-- Spell list for Bloodscalp Scavenger
UPDATE `creature_template` SET `spell_list_id`=7020 WHERE `entry`=702;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`) VALUES (7020, 'Stranglethorn Vale - Bloodscalp Scavenger', 744, 100, 1, 0, 0, 0, 7, 14, 120, 125);

-- Spell list for Mosh'Ogg Warmonger
UPDATE `creature_template` SET `spell_list_id`=7090 WHERE `entry`=709;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`) VALUES (7090, 'Stranglethorn Vale - Mosh\'Ogg Warmonger', 8147, 100, 0, 0, 0, 0, 2, 3, 10, 11);

-- Spell list for Mosh'Ogg Spellcrafter
UPDATE `creature_template` SET `spell_list_id`=7100 WHERE `entry`=710;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`) VALUES (7100, 'Stranglethorn Vale - Mosh\'Ogg Spellcrafter', 11829, 100, 1, 0, 0, 0, 5, 9, 12, 15, 9053, 100, 1, 0, 0, 8, 0, 0, 3, 4);

-- Spell list for Mosh'Ogg Butcher
UPDATE `creature_template` SET `spell_list_id`=7230 WHERE `entry`=723;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`) VALUES (7230, 'Stranglethorn Vale - Mosh\'Ogg Butcher', 15496, 100, 1, 0, 0, 0, 5, 7, 7, 11);

-- Spell list for Tethis
UPDATE `creature_template` SET `spell_list_id`=7300 WHERE `entry`=730;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`) VALUES (7300, 'Stranglethorn Vale - Tethis', 3604, 100, 1, 0, 0, 0, 0, 5, 11, 14);

-- Spell list for Skullsplitter Headhunter
UPDATE `creature_template` SET `spell_list_id`=7810 WHERE `entry`=781;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`) VALUES (7810, 'Stranglethorn Vale - Skullsplitter Headhunter', 3148, 100, 1, 0, 0, 32, 5, 7, 23, 26, 6533, 100, 4, 0, 0, 0, 1, 10, 18, 29, 6660, 100, 1, 0, 0, 136, 0, 0, 2, 3);

-- Spell list for Skullsplitter Scout
UPDATE `creature_template` SET `spell_list_id`=7820 WHERE `entry`=782;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`) VALUES (7820, 'Stranglethorn Vale - Skullsplitter Scout', 3148, 100, 1, 0, 0, 32, 5, 7, 23, 26);

-- Spell list for Mai'Zoth
UPDATE `creature_template` SET `spell_list_id`=8180 WHERE `entry`=818;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`) VALUES (8180, 'Stranglethorn Vale - Mai\'Zoth', 8814, 100, 1, 0, 0, 0, 5, 9, 12, 15);

-- Spell list for Veyzhak the Cannibal
UPDATE `creature_template` SET `spell_list_id`=53990 WHERE `entry`=5399;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`) VALUES (53990, 'Sunken Temple - Veyzhak the Cannibal', 11977, 100, 1, 0, 0, 96, 0, 0, 7, 14);

-- Spell list for Saltscale Tide Lord
UPDATE `creature_template` SET `spell_list_id`=8750 WHERE `entry`=875;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`) VALUES (8750, ' Stranglethorn Vale - Saltscale Tide Lord', 11831, 100, 4, 0, 0, 0, 6, 9, 15, 18, 9672, 100, 1, 0, 0, 8, 0, 0, 3, 4);

-- Correct zone name in spell list for Zekkis.
UPDATE `creature_spells` SET `name`='Sunken Temple - Zekkis' WHERE `entry`=54000;

-- Spell list for Saltscale Forager
UPDATE `creature_template` SET `spell_list_id`=8770 WHERE `entry`=877;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`) VALUES (8770, ' Stranglethorn Vale - Saltscale Forager', 13443, 100, 1, 0, 0, 64, 0, 0, 20, 30);

-- Spell list for Saltscale Hunter
UPDATE `creature_template` SET `spell_list_id`=8790 WHERE `entry`=879;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`) VALUES (8790, ' Stranglethorn Vale - Saltscale Hunter', 10277, 100, 1, 0, 0, 136, 0, 0, 2, 4);

-- Spell list for Kurzen Subchief
UPDATE `creature_template` SET `spell_list_id`=9780 WHERE `entry`=978;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`) VALUES (9780, 'Stranglethorn Vale - Kurzen Subchief', 8053, 100, 1, 0, 0, 0, 6, 11, 20, 30);

-- Spell list for Mogh the Undying
UPDATE `creature_template` SET `spell_list_id`=10600 WHERE `entry`=1060;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`) VALUES (10600, 'Stranglethorn Vale - Mogh the Undying', 12471, 100, 1, 0, 0, 8, 0, 0, 2, 4);

-- Spell list for Venture Co. Miner
UPDATE `creature_template` SET `spell_list_id`=10940 WHERE `entry`=1094;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`) VALUES (10940, 'Stranglethorn Vale - Venture Co. Miner', 6016, 100, 1, 0, 0, 96, 0, 0, 45, 45);

-- Spell list for Zanzil the Outcast
UPDATE `creature_template` SET `spell_list_id`=25340 WHERE `entry`=2534;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`) VALUES (25340, 'Stranglethorn Vale - Zanzil the Outcast', 9532, 100, 1, 0, 0, 0, 3, 4, 5, 6);

-- Spell list for Lord Sakrasis
UPDATE `creature_template` SET `spell_list_id`=25410 WHERE `entry`=2541;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`) VALUES (25410, 'Stranglethorn Vale - Lord Sakrasis', 15496, 100, 1, 0, 0, 0, 5, 7, 7, 11);

-- Spell list for Elder Saltwater Crocolisk
UPDATE `creature_template` SET `spell_list_id`=26350 WHERE `entry`=2635;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`) VALUES (26350, 'Stranglethorn Vale - Elder Saltwater Crocolisk', 3604, 100, 1, 0, 0, 0, 3, 8, 13, 24);

-- Spell list for Siege Golem
UPDATE `creature_template` SET `spell_list_id`=27490 WHERE `entry`=2749;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`) VALUES (27490, 'Badlands - Siege Golem', 10578, 100, 1, 0, 0, 0, 2, 5, 8, 12);

-- Spell list for Vile Familiar
UPDATE `creature_template` SET `spell_list_id`=31010 WHERE `entry`=3101;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`) VALUES (31010, 'Durotar - Vile Familiar', 11921, 50, 1, 0, 0, 0, 5, 15, 5, 15);

-- Spell list for Witchwing Windcaller
UPDATE `creature_template` SET `spell_list_id`=32800 WHERE `entry`=3280;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`) VALUES (32800, 'The Barrens - Witchwing Windcaller', 6728, 100, 5, 0, 0, 32, 4, 7, 12, 15);

-- Spell list for Southsea Cannoneer
UPDATE `creature_template` SET `spell_list_id`=33820 WHERE `entry`=3382;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`) VALUES (33820, 'The Barrens - Southsea Cannoneer', 6660, 100, 1, 0, 0, 136, 0, 0, 2, 3);

-- Spell list for Southsea Privateer
UPDATE `creature_template` SET `spell_list_id`=33840 WHERE `entry`=3384;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`) VALUES (33840, 'The Barrens - Southsea Privateer', 3011, 100, 1, 0, 0, 0, 4, 6, 9, 13, 6660, 100, 1, 0, 0, 136, 0, 0, 2, 3);

-- Spell list for Pesterhide Snarler
UPDATE `creature_template` SET `spell_list_id`=42490 WHERE `entry`=4249;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`) VALUES (42490, 'Thousand Needles - Pesterhide Snarler', 6576, 100, 5, 0, 0, 0, 5, 10, 12, 16);

-- Spell list for Foreman Cozzle
UPDATE `creature_template` SET `spell_list_id`=47230 WHERE `entry`=4723;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`) VALUES (47230, 'Stranglethorn Vale - Foreman Cozzle', 184, 100, 0, 0, 0, 32, 5, 9, 24, 37, 9532, 100, 1, 0, 0, 8, 0, 0, 3, 4);

-- Spell list for Blackfathom Oracle
UPDATE `creature_template` SET `spell_list_id`=48030 WHERE `entry`=4803;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`) VALUES (48030, 'Blackfathom Deeps - Blackfathom Oracle', 8363, 100, 1, 0, 0, 0, 3, 6, 25, 30);

-- Spell list for Blackfathom Myrmidon
DELETE FROM `creature_ai_scripts` WHERE `id` IN (480701);
DELETE FROM `creature_ai_events` WHERE `creature_id`=4807;
UPDATE `creature_template` SET `spell_list_id`=48070, `ai_name`='' WHERE `entry`=4807;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`) VALUES (48070, 'Blackfathom Deeps - Blackfathom Myrmidon', 8379, 100, 1, 0, 0, 0, 5, 9, 16, 20);

-- Spell list for Atal'ai Warrior
DELETE FROM `creature_ai_scripts` WHERE `id` IN (525601, 525602);
DELETE FROM `creature_ai_events` WHERE `creature_id`=5256;
UPDATE `creature_template` SET `spell_list_id`=52560, `ai_name`='' WHERE `entry`=5256;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`) VALUES (52560, 'Sunken Temple - Atal\'ai Warrior', 13446, 100, 1, 0, 0, 0, 7, 15, 12, 17, 13445, 100, 1, 0, 0, 0, 7, 16, 19, 20);

-- Spell list for Diamond Head
UPDATE `creature_template` SET `spell_list_id`=53450 WHERE `entry`=5345;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`) VALUES (53450, 'Feralas - Diamond Head', 5164, 100, 1, 0, 0, 64, 0, 0, 15, 20);

-- Spell list for Kazkaz the Unholy
UPDATE `creature_template` SET `spell_list_id`=54010 WHERE `entry`=5401;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`) VALUES (54010, 'Sunken Temple - Kazkaz the Unholy', 7645, 100, 2, 0, 0, 0, 14, 28, 24, 30, 9081, 100, 1, 0, 0, 0, 5, 9, 15, 32, 11639, 100, 4, 0, 0, 32, 2, 5, 10, 10);

-- Spell list for Captain Gerogg Hammertoe
UPDATE `creature_template` SET `spell_list_id`=58510 WHERE `entry`=5851;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`) VALUES (58510, 'The Barrens - Captain Gerogg Hammertoe', 7164, 100, 0, 0, 0, 0, 1, 5, 180, 180, 11972, 100, 1, 0, 0, 256, 0, 0, 11, 13);

-- Spell list for Heartrazor
UPDATE `creature_template` SET `spell_list_id`=59340 WHERE `entry`=5934;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`) VALUES (59340, 'Thousand Needles - Heartrazor', 8256, 100, 4, 0, 0, 32, 10, 16, 12, 24);

-- Spell list for Techbot
UPDATE `creature_template` SET `spell_list_id`=62310 WHERE `entry`=6231;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`) VALUES (62310, 'Gnomeregan - Techbot', 10852, 100, 0, 0, 0, 0, 5, 5, 19, 19, 10855, 100, 1, 0, 0, 0, 4, 8, 15, 25, 10858, 100, 1, 0, 0, 0, 10, 10, 22, 22);

-- Spell list for Tazan
UPDATE `creature_template` SET `spell_list_id`=64940 WHERE `entry`=6494;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`) VALUES (64940, 'The Barrens - Tazan', 6253, 80, 1, 0, 0, 64, 0, 0, 6, 10);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
