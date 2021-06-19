DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210619173040');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210619173040');
-- Add your query below.


-- Despawn Creatures In Faire Area
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES
(80369, -4),
(80367, -4),
(80360, -4),
(80363, -4),
(80362, -4),
(80365, -4),
(80366, -4),
(80695, -4),
(80699, -4),
(80369, -23),
(80367, -23),
(80360, -23),
(80363, -23),
(80362, -23),
(80365, -23),
(80366, -23),
(80695, -23),
(80699, -23);

-- Correct Gossip For Kruban Darkblade
-- Assign Kruban Darkblade to Darkmoon Events
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES
(54395, 4),
(54395, 23),
(54395, 24);

-- Add Missing Gossip Menus
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6214, 7374, 946),
(6221, 7378, 953),
(6222, 7377, 945);

-- Add Missing Gossip Menu Options
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES
(6214, 1, 0, 'The Darkmoon Faire has already arrived, you say?  Where is it located?', 0, 1, 1, 6222, 0, 0, 0, 0, \N, 0, 946);

-- Add Conditions
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (953, 12, 23, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (954, 12, 24, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (955, -2, 953, 954, 0, 0, 0);

-- Update Existing Gossip Menus
UPDATE `gossip_menu` SET `condition_id` = 955 WHERE `entry` = 6214 AND `text_id` = 7366;
UPDATE `gossip_menu_option` SET `condition_id` = 955 WHERE `menu_id` = 6214 AND `id` = 0;
UPDATE `gossip_menu` SET `condition_id` = 954 WHERE `entry` = 6221 AND `text_id` = 7376;

-- Add OOC Text to Kruban Darkblade For Event Building Darkmoon Faire
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 14843;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1484301, 14843, 955, 1, 0, 100, 1, 45000, 120000, 45000, 120000, 1484301, 0, 0, 'Kruban Darkblade - Talk - OOC - Event 23 and 24');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1484301, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10093, 10094, 10095, 10096, 0, 0, 0, 0, 0, 'Kruban Darkblade - Talk');

-- Add OOC Text to Kruban Darkblade For Event Darkmoon Faire
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1484302, 14843, 946, 1, 0, 100, 1, 45000, 120000, 45000, 0, 1484302, 0, 0, 'Kruban Darkblade - Talk - OOC - Event 4 and 5');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1484302, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10106, 10107, 10108, 10105, 0, 0, 0, 0, 0, 'Kruban Darkblade - Talk');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
