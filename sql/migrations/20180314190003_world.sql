DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180314190003');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180314190003');
-- Add your query below.


-- Fix Tannin Basket event where it spawns a Gordok Bushwacker.
INSERT INTO `conditions` VALUES (14351, 34, 13, 1, 0);
DELETE FROM `event_scripts` WHERE `id`=8176;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8176, 1, 0, 1, 0, 0, 0, 14351, 50, 8, 3, 9304, 0, 0, 0, 0, 0, 0, 0, 0, 'Gordok Bushwacker yell');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8176, 2, 3, 0, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 579.912, 535.036, 7.19701, 6.27315, 0, 'Gordok Bushwacker move');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8176, 4, 3, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 587.388, 540.713, 6.7703, 1.38797, 0, 'Gordok Bushwacker move');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8176, 5, 3, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 586.825, 561.178, -4.74829, 1.59218, 0, 'Gordok Bushwacker move');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8176, 6, 3, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 589.013, 586.198, -4.75469, 1.49007, 0, 'Gordok Bushwacker move');
DELETE FROM `creature_ai_scripts` WHERE `id`=1435109;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1435109, 0, 39, 8176, 0, 0, 0, 0, 0, 0, 4, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Gordok Bushwacker - Start Event Script 8176');
DELETE FROM `event_scripts` WHERE `id`=8175;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8175, 0, 37, 13, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ogre Tannin Looted - Set Instance Data');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8175, 1, 10, 14351, 900000, 0, 0, 0, 0, 0, 0, 0, 0, 6, 1, 539.868, 535.142, 27.9186, 0.0017457, 0, 'Ogre Tannin Looted - Spawn Gordok Bushwacker');
DELETE FROM `creature_ai_events` WHERE `creature_id`=14351;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1435102, 14351, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1435102, 0, 0, 'Gordok Bushwacker - Set Phase 1 on Aggro');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1435103, 14351, 0, 9, 5, 100, 1, 0, 5, 8200, 10600, 1435103, 0, 0, 'Gordok Bushwacker - Cast Sunder Armor (Phase 1)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1435104, 14351, 0, 24, 5, 100, 1, 21081, 5, 5000, 5000, 1435104, 0, 0, 'Gordok Bushwacker - Set Phase 2 on Target Max Sunder Armor Aura Stack (Phase 1)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1435105, 14351, 0, 28, 3, 100, 1, 21081, 1, 5000, 5000, 1435105, 0, 0, 'Gordok Bushwacker - Set Phase 1 on Target Missing Sunder Armor Aura Stack (Phase 2)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1435106, 14351, 0, 0, 0, 100, 1, 14300, 14300, 14000, 18200, 1435106, 0, 0, 'Gordok Bushwacker - Cast Cleave');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1435107, 14351, 0, 0, 0, 100, 1, 15700, 15700, 14300, 18900, 1435107, 0, 0, 'Gordok Bushwacker - Cast Mortal Strike');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1435108, 14351, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1435108, 0, 0, 'Gordok Bushwacker - Set Phase to 0 on Evade');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1435109, 14351, 14351, 11, 0, 100, 0, 0, 0, 0, 0, 1435109, 0, 0, 'Gordok Bushwacker - Do Tannin Basket Event');
DELETE FROM `spell_mod` WHERE `Id`=33027;
DELETE FROM `spell_effect_mod` WHERE `Id`=33027;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
