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
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(177302, 0, 15, 332, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rot Hide Mystic - Cast Spell Healing Wave');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (177302, 1773, 0, 14, 0, 100, 1, 150, 40, 24400, 32900, 177302, 0, 0, 'Rot Hide Mystic - Cast Healing Wave on Friendlies');

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
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(67902, 0, 15, 6742, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mosh\'Ogg Shaman - Cast Spell Bloodlust');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (67902, 679, 0, 16, 0, 100, 1, 6742, 30, 15000, 20000, 67902, 0, 0, 'Mosh\'Ogg Shaman - Cast Bloodlust on Friendly Missing Buff');

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









-- Add Spell Lists
UPDATE `creature_template` SET `script_name` = '' WHERE `entry` IN (667, 1772, 1773, 1940, 1942, 1674, 677, 679, 680, 702, 709, 710, 723, 730, 781, 782, 818, 5399);

-- Spell list for Bloodscalp Headhunter
UPDATE `creature_template` SET `spell_list_id`=6670 WHERE `entry`=671;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`) VALUES (6710, 'Stranglethorn Vale - Bloodscalp Headhunter', 10277, 100, 1, 0, 0, 136, 0, 0, 2, 3);

-- Spell list for Skullsplitter Warrior
UPDATE `creature_template` SET `spell_list_id`=6670 WHERE `entry`=667;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`) VALUES (6670, 'ZonePlaceholder - Skullsplitter Warrior', 11972, 100, 1, 0, 0, 257, 0, 0, 15, 20, 3148, 100, 1, 0, 0, 32, 5, 7, 23, 26);

-- Spell list for Rot Hide Gladerunner
UPDATE `creature_template` SET `spell_list_id`=17720 WHERE `entry`=1772;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`) VALUES (17720, 'Silverpine Forest - Rot Hide Gladerunner', 3237, 100, 1, 0, 0, 32, 21, 34, 10, 45);

-- Spell list for Rot Hide Mystic
UPDATE `creature_template` SET `spell_list_id`=17730 WHERE `entry`=1773;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`) VALUES (17730, 'Silverpine Forest - Rot Hide Mystic', 3237, 100, 1, 0, 0, 32, 7, 20, 35, 44);

-- Spell list for Rot Hide Plague Weaver
UPDATE `creature_template` SET `spell_list_id`=19400 WHERE `entry`=1940;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`) VALUES (19400, 'Silverpine Forest - Rot Hide Plague Weaver', 3256, 100, 4, 0, 0, 1, 24, 34, 106, 244, 3237, 100, 1, 0, 0, 32, 7, 20, 32, 59);

-- Spell list for Rot Hide Savage
UPDATE `creature_template` SET `spell_list_id`=19420 WHERE `entry`=1942;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`) VALUES (19420, ' Silverpine Forest - Rot Hide Savage', 3258, 100, 0, 0, 0, 1, 11, 16, 31, 37, 3237, 100, 1, 0, 0, 32, 7, 20, 32, 54);

-- Spell list for Rot Hide Gnoll
UPDATE `creature_template` SET `spell_list_id`=16740 WHERE `entry`=1674;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`) VALUES (16740, ' Tirisfal Glades - Rot Hide Gnoll', 3237, 100, 1, 0, 0, 32, 7, 21, 30, 45);

-- Spell list for Venture Co. Tinkerer
UPDATE `creature_template` SET `spell_list_id`=6770 WHERE `entry`=677;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`) VALUES (6770, 'Stranglethorn Vale - Venture Co. Tinkerer', 7979, 100, 0, 0, 0, 0, 5, 9, 70, 85);

-- Spell list for Mosh'Ogg Shaman
UPDATE `creature_template` SET `spell_list_id`=6790 WHERE `entry`=679;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`) VALUES (6790, 'Stranglethorn Vale - Mosh\'Ogg Shaman', 11899, 100, 0, 0, 0, 0, 7, 13, 30, 35, 12058, 100, 1, 0, 0, 8, 2, 6, 5, 11);

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
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`) VALUES (53990, 'ZonePlaceholder - Veyzhak the Cannibal', 11977, 100, 1, 0, 0, 96, 0, 0, 7, 14);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
