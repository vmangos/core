DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211103064059');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211103064059');
-- Add your query below.


-- Add gossip menu for Mathredis Firestar.
INSERT INTO `npc_text` (`ID`, `Probability0`, `BroadcastTextID0`) VALUES (2994, 1, 5292);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (2301, 2994, 11739);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (11738, -2, 11732, 11733, 11734, 11736, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (11739, -2, 11737, 11738, 0, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES 
(2301, 0, 0, 'I present to you the Libram of Rumination.', 5291, 1, 1, -1, 0, 230100, 0, 0, NULL, 0, 11732),
(2301, 1, 0, 'I present to you the Libram of Constitution.', 5416, 1, 1, -1, 0, 230101, 0, 0, NULL, 0, 11733),
(2301, 2, 0, 'I present to you the Libram of Tenacity.', 5417, 1, 1, -1, 0, 230102, 0, 0, NULL, 0, 11734),
(2301, 3, 0, 'I present to you the Libram of Resilience.', 5418, 1, 1, -1, 0, 230103, 0, 0, NULL, 0, 11736),
(2301, 4, 0, 'I present to you the Libram of Voracity.', 5419, 1, 1, -1, 0, 230104, 0, 0, NULL, 0, 11737);
UPDATE `creature_template` SET `npc_flags`=1 WHERE `entry`=9836;

-- Libram of Rumination
DELETE FROM `gossip_scripts` WHERE `id`=230100;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(230100, 0, 2, 147, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mathredis Firestar - Set NPC Flags to Quest Giver'),
(230100, 0, 61, 4463, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mathredis Firestar - Start Scripted Map Event'),
(230100, 120, 2, 147, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mathredis Firestar - Set NPC Flags to Gossip');
-- 11732: Target Has 1 Stacks Of Item 11732 In Inventory
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (11732, 2, 11732, 1, 0, 0, 0);
-- 4463: Scripted Map Event 4463 Is Active
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4463, 36, 4463, 0, 0, 0, 0);
UPDATE `quest_template` SET `RequiredCondition`=4463 WHERE `entry`=4463;

-- Libram of Constitution
DELETE FROM `gossip_scripts` WHERE `id`=230101;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(230101, 0, 2, 147, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mathredis Firestar - Set NPC Flags to Quest Giver'),
(230101, 0, 61, 4481, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mathredis Firestar - Start Scripted Map Event'),
(230101, 120, 2, 147, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mathredis Firestar - Set NPC Flags to Gossip');
-- 11733: Target Has 1 Stacks Of Item 11733 In Inventory
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (11733, 2, 11733, 1, 0, 0, 0);
-- 4481: Scripted Map Event 4481 Is Active
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4481, 36, 4481, 0, 0, 0, 0);
UPDATE `quest_template` SET `RequiredCondition`=4481 WHERE `entry`=4481;

-- Libram of Tenacity
DELETE FROM `gossip_scripts` WHERE `id`=230102;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(230102, 0, 2, 147, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mathredis Firestar - Set NPC Flags to Quest Giver'),
(230102, 0, 61, 4482, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mathredis Firestar - Start Scripted Map Event'),
(230102, 120, 2, 147, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mathredis Firestar - Set NPC Flags to Gossip');
-- 11734: Target Has 1 Stacks Of Item 11734 In Inventory
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (11734, 2, 11734, 1, 0, 0, 0);
-- 4482: Scripted Map Event 4482 Is Active
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4482, 36, 4482, 0, 0, 0, 0);
UPDATE `quest_template` SET `RequiredCondition`=4482 WHERE `entry`=4482;

-- Libram of Resilience
DELETE FROM `gossip_scripts` WHERE `id`=230103;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(230103, 0, 2, 147, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mathredis Firestar - Set NPC Flags to Quest Giver'),
(230103, 0, 61, 4483, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mathredis Firestar - Start Scripted Map Event'),
(230103, 120, 2, 147, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mathredis Firestar - Set NPC Flags to Gossip');
-- 11736: Target Has 1 Stacks Of Item 11736 In Inventory
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (11736, 2, 11736, 1, 0, 0, 0);
-- 4483: Scripted Map Event 4483 Is Active
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4483, 36, 4483, 0, 0, 0, 0);
UPDATE `quest_template` SET `RequiredCondition`=4483 WHERE `entry`=4483;

-- Libram of Voracity
DELETE FROM `gossip_scripts` WHERE `id`=230104;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(230104, 0, 2, 147, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mathredis Firestar - Set NPC Flags to Quest Giver'),
(230104, 0, 61, 4484, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mathredis Firestar - Start Scripted Map Event'),
(230104, 120, 2, 147, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mathredis Firestar - Set NPC Flags to Gossip');
-- 11737: Target Has 1 Stacks Of Item 11737 In Inventory
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (11737, 2, 11737, 1, 0, 0, 0);
-- 4484: Scripted Map Event 4484 Is Active
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4484, 36, 4484, 0, 0, 0, 0);
UPDATE `quest_template` SET `RequiredCondition`=4484 WHERE `entry`=4484;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
