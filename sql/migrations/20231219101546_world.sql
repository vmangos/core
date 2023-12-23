DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20231219101546');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20231219101546');
-- Add your query below.


-- Events list for Crushridge Ogre
DELETE FROM `creature_ai_events` WHERE `creature_id`=2252;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (225201, 2252, 0, 4, 0, 10, 0, 0, 0, 0, 0, 225201, 0, 0, 'Crushridge Ogre - Random Say on Aggro');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (225202, 2252, 0, 6, 0, 100, 0, 0, 0, 0, 0, 225202, 0, 0, 'Crushridge Ogre - Cast Spell Crushridge Death on Death');
DELETE FROM `creature_ai_scripts` WHERE `id`=225202;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(225202, 0, 0, 15, 9144, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crushridge Ogre - Cast Spell Crushridge Death');

-- Events list for Crushridge Brute
DELETE FROM `creature_ai_events` WHERE `creature_id`=2253;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (225301, 2253, 0, 4, 0, 10, 0, 0, 0, 0, 0, 225301, 0, 0, 'Crushridge Brute - Random Say on Aggro');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (225302, 2253, 0, 6, 0, 100, 0, 0, 0, 0, 0, 225302, 0, 0, 'Crushridge Brute - Cast Spell Crushridge Death on Death');
DELETE FROM `creature_ai_scripts` WHERE `id`=225302;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(225302, 0, 0, 15, 9144, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crushridge Brute - Cast Spell Crushridge Death');

-- Events list for Crushridge Mage
DELETE FROM `creature_ai_events` WHERE `creature_id`=2255;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (225501, 2255, 0, 4, 0, 10, 0, 0, 0, 0, 0, 225501, 0, 0, 'Crushridge Mage - Random Say on Aggro');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (225502, 2255, 0, 6, 0, 100, 0, 0, 0, 0, 0, 225502, 0, 0, 'Crushridge Mage - Cast Spell Crushridge Death on Death');
DELETE FROM `creature_ai_scripts` WHERE `id`=225502;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(225502, 0, 0, 15, 9144, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crushridge Mage - Cast Spell Crushridge Death');

-- Events list for Crushridge Enforcer
DELETE FROM `creature_ai_events` WHERE `creature_id`=2256;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (225601, 2256, 0, 4, 0, 10, 0, 0, 0, 0, 0, 225601, 0, 0, 'Crushridge Enforcer - Random Say on Aggro');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (225602, 2256, 0, 6, 0, 100, 0, 0, 0, 0, 0, 225602, 0, 0, 'Crushridge Enforcer - Cast Spell Crushridge Death on Death');
DELETE FROM `creature_ai_scripts` WHERE `id`=225601;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(225601, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1925, 1926, 1927, 0, 0, 0, 0, 0, 0, 'Crushridge Enforcer - Say Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=225602;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(225602, 0, 0, 15, 9144, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crushridge Enforcer - Cast Spell Crushridge Death');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2256;

-- Events list for Crushridge Plunderer
DELETE FROM `creature_ai_events` WHERE `creature_id`=2416;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (241601, 2416, 0, 4, 0, 10, 0, 0, 0, 0, 0, 241601, 0, 0, 'Crushridge Plunderer - Random Say on Aggro');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (241602, 2416, 0, 6, 0, 100, 0, 0, 0, 0, 0, 241602, 0, 0, 'Crushridge Plunderer - Cast Spell Crushridge Death on Death');
DELETE FROM `creature_ai_scripts` WHERE `id`=241602;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(241602, 0, 0, 15, 9144, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crushridge Plunderer - Cast Spell Crushridge Death');

-- Events list for Crushridge Warmonger
DELETE FROM `creature_ai_events` WHERE `creature_id`=2287;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (228701, 2287, 0, 4, 0, 10, 0, 0, 0, 0, 0, 228701, 0, 0, 'Crushridge Warmonger - Random Say on Aggro');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (228702, 2287, 0, 2, 0, 100, 0, 50, 0, 0, 0, 228702, 0, 0, 'Crushridge Warmonger - Call for Help at 50% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (228703, 2287, 0, 6, 0, 100, 0, 0, 0, 0, 0, 228703, 0, 0, 'Crushridge Warmonger - Cast Spell Crushridge Death on Death');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (228704, 2287, 0, 8, 0, 100, 0, 9144, -1, 0, 0, 228704, 0, 0, 'Crushridge Warmonger - Enrage on Hit By Spell Crushridge Death');
DELETE FROM `creature_ai_scripts` WHERE `id`=228702;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(228702, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 0, 0, 0, 0, 'Crushridge Warmonger - Call for Help'),
(228702, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1064, 0, 0, 0, 0, 0, 0, 0, 0, 'Crushridge Warmonger - Say Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=228703;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(228703, 0, 0, 15, 9144, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crushridge Warmonger - Cast Spell Crushridge Death');
DELETE FROM `creature_ai_scripts` WHERE `id`=228704;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(228704, 0, 0, 15, 8269, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crushridge Warmonger - Cast Spell Enrage'),
(228704, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1151, 0, 0, 0, 0, 0, 0, 0, 0, 'Crushridge Warmonger - Say Text');

-- Define spell targets.
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (9144, 1, 2287, 0, 0, 0, 5875);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
