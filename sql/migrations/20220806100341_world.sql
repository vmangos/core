DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220806100341');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220806100341');
-- Add your query below.


UPDATE `creature_template` SET `regeneration`=0 WHERE `entry`=16136;
UPDATE `creature_template` SET `regeneration`=0 WHERE `entry`=16172;
UPDATE `creature_template` SET `auras`=NULL, `flags_extra`=0 WHERE `entry`=16230;

UPDATE `creature_template` SET `spawn_spell_id`=10389 WHERE `entry`=16143;
UPDATE `creature_template` SET `spawn_spell_id`=28234 WHERE  `entry` IN (16230,16299,16141,16298,14697,16380,16379,16438,16437,16422,16423,16394,16382,16383);
UPDATE `creature_template` SET `auras`='28346 27887' WHERE  `entry` IN (16136,16172);
UPDATE `creature_template` SET `auras`='28395' WHERE `entry`=16401;

UPDATE `spell_script_target` SET `type`=0, `targetEntry`=181142 WHERE `entry`=31315 AND `type`=1 AND `targetEntry`=16230;

-- Move GameObject Necropolis to DB.
UPDATE `gameobject` SET `spawn_flags`=1, `visibility_mod`=5000 WHERE `id` IN (181154,181373,181374,181215,181223,181172);
UPDATE `gameobject_template` SET `script_name`='' WHERE `entry` IN (181154,181373,181374,181215,181223,181172);

UPDATE `creature_template` SET `ai_name`='EventAI', `script_name`='' WHERE `entry` IN (16401,16386,16398,16172,16230);
UPDATE `creature` SET `spawn_flags`=1, `visibility_mod`=5000 WHERE `id` IN (16401,16386,16398,16172);

INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES
    (28078, 1, 16172, 0, 0, 5464, 5875),
    (28054, 0, 181112, 0, 0, 5464, 5875),
    (27885, 0, 181111, 0, 0, 5464, 5875),
    (27885, 0, 181155, 0, 0, 5464, 5875),
    (27885, 0, 181156, 0, 0, 5464, 5875),
    (27885, 0, 181163, 0, 0, 5464, 5875),
    (27886, 0, 181112, 0, 0, 5464, 5875);
    
-- Missing GameObjects.
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES
    (181111, 9, 6, 5811, 'Minion Spawner, ghost/ghoul', 0, 0, 1, 0, 0, 0, 27883, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
    (181112, 9, 6, 5811, 'Buttress Spawner', 0, 0, 1, 0, 0, 0, 28024, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
    (181155, 9, 6, 5811, 'Minion Spawner, ghost/skeleton', 0, 0, 1, 0, 0, 0, 28186, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
    (181156, 9, 6, 5811, 'Minion Spawner, ghoul/skeleton', 0, 0, 1, 0, 0, 0, 28187, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
    (181163, 9, 6, 327, 'Minion Spawner, finder', 0, 0, 1, 0, 0, 0, 28227, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
    (181214, 9, 6, 327, 'Necropolis critter spawner', 0, 0, 1, 0, 0, 0, 27866, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- Events list for Necropolis Relay
DELETE FROM `creature_ai_events` WHERE `creature_id`=16386;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1638604, 16386, 0, 8, 0, 100, 0, 28366, 1, 0, 0, 1638604, 0, 0, 'Necropolis Relay - Hit by Communique, Proxy-to-Relay Once to activate Circle');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1638601, 16386, 0, 8, 0, 100, 1, 28366, 1, 0, 0, 1638601, 0, 0, 'Necropolis Relay - Hit by Communique, Proxy-to-Relay');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1638603, 16386, 0, 8, 0, 100, 1, 28351, 1, 0, 0, 1638603, 0, 0, 'Necropolis Relay - Hit by Communique, Camp-to-Relay, Death');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1638602, 16386, 0, 8, 0, 100, 1, 28281, 1, 0, 0, 1638602, 0, 0, 'Necropolis Relay - Hit by Communique, Camp-to-Relay');

DELETE FROM `creature_ai_scripts` WHERE `id`=1638601;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1638601, 0, 0, 15, 28326, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Necropolis Relay - Cast Communique, Relay-to-Camp');

DELETE FROM `creature_ai_scripts` WHERE `id`=1638602;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1638602, 0, 0, 15, 28365, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Necropolis Relay - Cast Communique, Relay-to-Proxy');

DELETE FROM `creature_ai_scripts` WHERE `id`=1638603;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1638603, 0, 0, 15, 28351, 2, 0, 0, 16398, 200, 8, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Necropolis Relay - Cast Communique, Camp-to-Relay, Death On Necropolis Proxy');

DELETE FROM `creature_ai_scripts` WHERE `id`=1638604;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1638604, 0, 0, 13, 0, 0, 0, 0, 181136, 200, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Necropolis Relay - Activate Circle');

-- Events list for Necropolis Proxy
DELETE FROM `creature_ai_events` WHERE `creature_id`=16398;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
    (1639801, 16398, 0, 8, 0, 100, 1, 28373, 1, 0, 0, 1639801, 0, 0, 'Necropolis Proxy - Hit by Communique, Necropolis-to-Proxies'),
    (1639802, 16398, 0, 8, 0, 100, 1, 28365, 1, 0, 0, 1639802, 0, 0, 'Necropolis Proxy - Hit by Communique, Relay-to-Proxy'),
    (1639803, 16398, 0, 8, 0, 100, 1, 28351, 1, 0, 0, 1639803, 0, 0, 'Necropolis Proxy - Hit by Communique, Camp-to-Relay, Death');

DELETE FROM `creature_ai_scripts` WHERE `id`=1639801;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1639801, 0, 0, 15, 28366, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Necropolis Proxy - Cast Communique, Proxy-to-Relay');

DELETE FROM `creature_ai_scripts` WHERE `id`=1639802;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1639802, 0, 0, 15, 28367, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Necropolis Proxy - Cast Communique, Proxy-to-Necropolis');

DELETE FROM `creature_ai_scripts` WHERE `id`=1639803;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1639803, 0, 0, 15, 28351, 2, 0, 0, 16421, 200, 8, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Necropolis Proxy - Cast Communique, Camp-to-Relay, Death On Necropolis health');

-- Events list for Damaged Necrotic Shard
DELETE FROM `creature_ai_events` WHERE `creature_id`=16172;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
    (1617201, 16172, 0, 8, 0, 100, 1, 28326, 1, 0, 0, 1617201, 0, 0, 'Damaged Necrotic Shard - Hit by Communique, Relay-to-Camp'),
    (1617202, 16172, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1617202, 0, 0, 'Damaged Necrotic Shard - Just spawned'),
    (1617203, 16172, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1617203, 0, 0, 'Damaged Necrotic Shard - Death');

DELETE FROM `creature_ai_scripts` WHERE `id`=1617201;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1617201, 0, 0, 15, 28449, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Damaged Necrotic Shard - Cast Camp Receives Communique');

DELETE FROM `creature_ai_scripts` WHERE `id`=1617202;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1617202, 0, 0, 15, 27888, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Damaged Necrotic Shard -  Cast Minion Spawner, Buttress'),
(1617202, 0, 0, 15, 27887, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Damaged Necrotic Shard -  Cast Minion Spawner, small'),
(1617202, 0, 0, 15, 28201, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Damaged Necrotic Shard -  Cast Choose Camp Type'),
(1617202, 0, 0, 18, 4000, 0, 0, 0, 16136, 5, 8, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Damaged Necrotic Shard -  Despawn Necrotic Shard');

DELETE FROM `creature_ai_scripts` WHERE `id`=1617203;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1617203, 0, 0, 15, 28351, 2, 0, 0, 16386, 200, 8, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Damaged Necrotic Shard - Cast Communique, Camp-to-Relay, Death'),
(1617203, 0, 0, 15, 28681, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Damaged Necrotic Shard - Cast Soul Revival'),
(1617203, 0, 0, 18, 4000, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Damaged Necrotic Shard - Despawn self');

-- Events list for Cultist Engineer
DELETE FROM `creature_ai_events` WHERE `creature_id`=16230;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
    (1623001, 16230, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1623001, 0, 0, 'Cultist Engineer - Just spawned'),
    (1623002, 16230, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1623002, 0, 0, 'Cultist Engineer - Death');

DELETE FROM `creature_ai_scripts` WHERE `id`=1623001;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1623001, 0, 0, 39, 1623001, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Cultist Engineer - Start Script');

DELETE FROM `creature_ai_scripts` WHERE `id`=1623002;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1623002, 0, 0, 15, 28041, 2, 0, 0, 16172, 15, 8, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cultist Engineer - Cast Damage Crystal');

DELETE FROM `generic_scripts` WHERE `id`=1623001;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1623001, 0, 1, 35, 0, 0, 0, 0, 16172, 15, 8, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cultist Engineer - Face Damaged Necrotic Shard'),
(1623001, 0, 2, 15, 28132, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cultist Engineer - Cast Create Summoner Shield'),
(1623001, 1, 3, 15, 29826, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cultist Engineer - Cast Self Stun (DND)'),
(1623001, 2, 4, 15, 28078, 2, 0, 0, 16172, 15, 8, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cultist Engineer - Cast Buttress Channel');

DELETE FROM `gossip_scripts` WHERE `id`=7166;
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(7166, 0, 0, 15, 27852, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cultist Engineer - Summon Shadow of Doom');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
