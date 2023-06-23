SET NAMES utf8;
DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230104112356');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230104112356');
-- Add your query below.

UPDATE `gameobject_template` SET `faction`=114 WHERE `entry` IN (181853, 181852);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (32061, 1, 17690, 0, 0, 5086, 5875);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (32061, 1, 17689, 0, 0, 5086, 5875);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (32061, 1, 17696, 0, 0, 5086, 5875);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (32061, 1, 17698, 0, 0, 5086, 5875);

DELETE FROM `creature_movement_scripts` WHERE `id`=1803913;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1803913, 0, 0, 15, 24221, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spirit of Victory - Cast Spell Teleport Spawn-out'),
(1803913, 0, 0, 18, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spirit of Victory - Despawn');

UPDATE `creature_template` SET `spawn_spell_id`=17321, `flags_extra`=33554496 WHERE `entry`=18039;
UPDATE `creature_template` SET `auras`='16577' WHERE `entry`=10821;
UPDATE `creature_template` SET `speed_walk`=3.2, `speed_run`=4.28571, `unit_flags`=256, `type`=6, `flags_extra`=66, `mechanic_immune_mask`=8388624 WHERE `entry`=17660;

-- 17635: Source or Target Is In Zone or Area 2271
UPDATE `conditions` SET `value1`=2271, `flags`=0 WHERE `condition_entry`=17635;

-- Events list for Lordaeron Commander
DELETE FROM `creature_ai_events` WHERE `creature_id`=17635;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1763501, 17635, 17635, 11, 6, 100, 0, 0, 0, 0, 0, 1763501, 0, 0, 'Lordaeron Commander - Just Spawned');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1763503, 17635, 0, 29, 0, 100, 1, 2, 37, 0, 0, 1763503, 0, 0, 'Lordaeron Commander - Last Waypoint');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1763505, 17635, 0, 30, 5, 100, 1, 0, 0, 0, 0, 1763502, 0, 0, 'Lordaeron Commander - Leave Combat & On Waypoints');

DELETE FROM `generic_scripts` WHERE `id`=1763501;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1763501, 0, 0, 44, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lordaeron Commander - Increment Phase'),
(1763501, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14746, 0, 0, 0, 0, 0, 0, 0, 0, 'Lordaeron Commander - Say'),
(1763501, 8, 0, 60, 3, 0, 0, 0, 0, 0, 0, 0, 0, 176350, 0, 0, 0, 0, 0, 0, 0, 'Lordaeron Commander - Start Waypoints'),
(1763501, 5, 0, 24, 2410, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lordaeron Commander - Mount up'),
(1763501, 5, 0, 68, 1764701, 2, 17647, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lordaeron Commander - Mount up all Lordaeron Soldier'),
(1763501, 5, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lordaeron Commander - Toggle run');

DELETE FROM `generic_scripts` WHERE `id`=1763502;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1763502, 5, 0, 24, 2410, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lordaeron Commander - Mount up'),
(1763502, 5, 0, 68, 1764701, 2, 17647, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lordaeron Commander - Mount up all Lordaeron Soldier'),
(1763502, 5, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lordaeron Commander - Toggle run');

DELETE FROM `creature_ai_scripts` WHERE `id`=1763501;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1763501, 0, 1, 20, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lordaeron Commander - Set Movement Type'),
(1763501, 0, 2, 39, 1763501, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Lordaeron Commander - Start Script');

DELETE FROM `creature_ai_scripts` WHERE `id`=1763502;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1763502, 0, 0, 39, 1763502, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Lordaeron Commander - Start Script');

DELETE FROM `creature_ai_scripts` WHERE `id`=1763503;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1763503, 0, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lordaeron Commander - Set Walk'),
(1763503, 0, 0, 67, 1, 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lordaeron Commander - Set Random Movement'),
(1763503, 0, 0, 79, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lordaeron Commander - Leave Creature Group'),
(1763503, 0, 0, 68, 1764702, 2, 17647, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lordaeron Commander - Execute this Script for all Lordaeron Soldier'),
(1763503, 0, 0, 24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lordaeron Commander - Dismount'),
(1763503, 0, 0, 34, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lordaeron Commander - Save Home Position'),
(1763503, 0, 0, 44, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lordaeron Commander - Increment Phase');

-- Events list for Lordaeron Veteran
DELETE FROM `creature_ai_events` WHERE `creature_id`=17995;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1799501, 17995, 17635, 11, 6, 100, 0, 0, 0, 0, 0, 1799501, 0, 0, 'Lordaeron Veteran - Just Spawned');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1799503, 17995, 0, 29, 0, 100, 1, 2, 37, 0, 0, 1799503, 0, 0, 'Lordaeron Veteran - Last Waypoint');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1799505, 17995, 0, 30, 5, 100, 1, 0, 0, 0, 0, 1799502, 0, 0, 'Lordaeron Veteran - Leave Combat & On Waypoints');

DELETE FROM `generic_scripts` WHERE `id`=1799501;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1799501, 0, 0, 44, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lordaeron Veteran - Increment Phase'),
(1799501, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14746, 0, 0, 0, 0, 0, 0, 0, 0, 'Lordaeron Veteran - Say'),
(1799501, 8, 0, 60, 3, 0, 0, 0, 0, 0, 0, 0, 0, 176350, 0, 0, 0, 0, 0, 0, 0, 'Lordaeron Veteran - Start Waypoints'),
(1799501, 5, 0, 24, 2410, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lordaeron Veteran - Mount up'),
(1799501, 5, 0, 68, 1799601, 2, 17996, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lordaeron Veteran - Mount up all Lordaeron Fighter'),
(1799501, 5, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lordaeron Veteran - Toggle run');

DELETE FROM `generic_scripts` WHERE `id`=1799502;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1799502, 5, 0, 24, 2410, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lordaeron Veteran - Mount up'),
(1799502, 5, 0, 68, 1799601, 2, 17996, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lordaeron Veteran - Mount up all Lordaeron Fighter'),
(1799502, 5, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lordaeron Veteran - Toggle run');

DELETE FROM `creature_ai_scripts` WHERE `id`=1799501;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1799501, 0, 1, 20, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lordaeron Veteran - Set Movement Type'),
(1799501, 0, 2, 39, 1799501, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Lordaeron Veteran - Start Script');

DELETE FROM `creature_ai_scripts` WHERE `id`=1799502;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1799502, 0, 0, 39, 1799502, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Lordaeron Veteran - Start Script');

DELETE FROM `creature_ai_scripts` WHERE `id`=1799503;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1799503, 0, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lordaeron Veteran - Set Walk'),
(1799503, 0, 0, 67, 1, 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lordaeron Veteran - Set Random Movement'),
(1799503, 0, 0, 79, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lordaeron Veteran - Leave Creature Group'),
(1799503, 0, 0, 68, 1799602, 2, 17996, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lordaeron Veteran - Execute this Script for all Lordaeron Fighter'),
(1799503, 0, 0, 24, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lordaeron Veteran - Dismount'),
(1799503, 0, 0, 34, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lordaeron Veteran - Save Home Position'),
(1799503, 0, 0, 44, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lordaeron Veteran - Increment Phase');


-- End of migration.
END IF;
END??
delimiter ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
