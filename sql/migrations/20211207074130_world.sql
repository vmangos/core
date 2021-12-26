DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211207074130');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211207074130');
-- Add your query below.


-- Improve completion script for quest Well of Corruption.
DELETE FROM `quest_end_scripts` WHERE `id`=4505;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(4505, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Well of Corruption: Winna Hazzard - Remove NPC Flags'),
(4505, 0, 20, 0, 0, 0, 0, 39704, 0, 9, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Well of Corruption: Winna\'s Kitten - Move Idle'),
(4505, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5945, 0, 0, 0, 0, 0, 0, 0, 0, 'Well of Corruption: Winna Hazzard - Say Text'),
(4505, 2, 3, 2, 1800, 256, 2, 39704, 0, 9, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 'Well of Corruption: Winna Hazzard - Move to Winna\'s Kitten'),
(4505, 4, 35, 0, 0, 0, 0, 39704, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Well of Corruption: Winna Hazzard - Turn to Winna\'s Kitten'),
(4505, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5946, 0, 0, 0, 0, 0, 0, 0, 0, 'Well of Corruption: Winna Hazzard - Say Emoted Text'),
(4505, 7, 15, 16510, 0, 0, 0, 39704, 0, 9, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Well of Corruption: Winna\'s Kitten - Cast Spell Corrupted Saber Visual'),
(4505, 8, 27, 10657, 0, 0, 0, 39704, 0, 9, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Well of Corruption: Winna\'s Kitten - Update Entry'),
(4505, 8, 18, 30000, 0, 0, 0, 39704, 0, 9, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Well of Corruption: Winna\'s Kitten - Despawn in 30 seconds'),
(4505, 9, 0, 0, 0, 0, 0, 39704, 0, 9, 6, 5941, 0, 0, 0, 0, 0, 0, 0, 0, 'Well of Corruption: Winna\'s Kitten - Say Emoted Text'),
(4505, 9, 1, 34, 0, 0, 0, 39704, 0, 9, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Well of Corruption: Winna\'s Kitten - Emote OneShotWoundCritical'),
(4505, 9, 20, 1, 0, 0, 0, 39704, 0, 9, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Well of Corruption: Winna\'s Kitten - Move Random'),
(4505, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5947, 0, 0, 0, 0, 0, 0, 0, 0, 'Well of Corruption: Winna Hazzard - Say Text'),
(4505, 9, 1, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Well of Corruption: Winna Hazzard - Emote OneShotLaugh'),
(4505, 10, 3, 0, 0, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5126.82, -325.127, 358.926, 4.99164, 0, 'Well of Corruption: Winna Hazzard - Move'),
(4505, 14, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Well of Corruption: Winna Hazzard - Add NPC Flags');

-- Winna's Kitten has a 30 second respawn time.
UPDATE `creature` SET `spawntimesecsmin`=30, `spawntimesecsmax`=30 WHERE `guid`=39704;

-- Correct spawn position for Winna's Kitten.
UPDATE `creature` SET `position_x`=5126.26, `position_y`=-325.202, `position_z`=359.06, `orientation`=3.65588, `wander_distance`=12 WHERE `guid`=39704;

-- Correct scale for Winna's Kitten.
UPDATE `creature_template` SET `display_scale1`=0 WHERE `entry`=10658;

-- 9996: Target's Entry Is 9996
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (9996, 16, 9996, 0, 0, 0, 2);

-- Events list for Common Kitten.
DELETE FROM `creature_ai_events` WHERE `creature_id`=9937;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (993701, 9937, 0, 11, 0, 100, 0, 0, 0, 0, 0, 993701, 0, 0, 'Common Kitten - Start Script on Spawn');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (993702, 9937, 9996, 10, 0, 100, 0, 0, 20, 0, 0, 993702, 0, 0, 'Common Kitten - Stop Following on Reaching Winna Hazzard');
DELETE FROM `creature_ai_scripts` WHERE `id`=993701;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (993701, 0, 59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Common Kitten - Set React State to Passive');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (993701, 0, 88, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Common Kitten - Set Command State to Stay');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (993701, 0, 39, 993701, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Common Kitten - Start Script');
DELETE FROM `generic_scripts` WHERE `id`=993701;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (993701, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5939, 0, 0, 0, 0, 0, 0, 0, 0, 'Common Kitten - Say Emoted Text');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (993701, 0, 3, 0, 1762, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 4582.28, -216.298, 300.374, 0, 0, 'Common Kitten - Move');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (993701, 4, 15, 16510, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Common Kitten - Cast Spell Corrupted Saber Visual');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (993701, 4, 27, 10042, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Common Kitten - Update Entry');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (993701, 5, 0, 0, 0, 0, 0, 0, 0, 7, 0, 5940, 0, 0, 0, 0, 0, 0, 0, 0, 'Common Kitten - Say Emoted Text');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (993701, 5, 88, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Common Kitten - Set Command State to Follow');
DELETE FROM `creature_ai_scripts` WHERE `id`=993702;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (993702, 0, 88, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Common Kitten - Set Command State to Stay');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (993702, 0, 4, 147, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Common Kitten - Add Gossip Flag');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (993702, 0, 18, 60000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Common Kitten - Despawn in 60 seconds');
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name`='', `unit_flags`=768, `level_min`=5, `level_max`=5, `health_min`=102, `health_max`=102 WHERE `entry` IN (9937, 10042);

-- Remove texts from custom table.
DELETE FROM `script_texts` WHERE `entry` IN (-1000541, -1000542);

-- 4506: Target Has Quest 4506 In Log
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4506, 9, 4506, 0, 0, 0, 0);

-- Add gossip menu for Common Kitten.
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (2853, 3550);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2853, 0, 0, 'I want to release the corrupted saber to Winna.', 5936, 1, 1, -1, 0, 2853, 0, 0, NULL, 0, 4506);
DELETE FROM `gossip_scripts` WHERE `id`=2853;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2853, 0, 7, 4506, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Common Kitten - Complete Quest Corrupted Sabers');
UPDATE `creature_template` SET `gossip_menu_id`=2853 WHERE `entry` IN (9937, 10042);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
