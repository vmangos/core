INSERT INTO `migrations` VALUES ('20170630160000');

-- Fix spell on Plans: Dawnbringer Shoulders
UPDATE `item_template` SET `spellid_1` = 16686, `spellid_2` = 0 WHERE `entry` = 12698;

-- Fix item 11825(Pet Bombling). NPC has wrong script attached. It is a non-combat pet despite its appearance. 
UPDATE `creature_template` SET `spell1` = 0, `MovementType` = 0, `ScriptName` = '' WHERE `entry` = 9656;


-- Fix Yeh'kinya gossips. Players can now get a scroll(id:10818) from Yeh'kiyna to summon Avatar of Hakkar, if they have completed a quest 3528(The God Hakkar)
-- 1. Add condition: if player has quest quest 3528(The God Hakkar) completed.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('50408', '8', '3528', '0');
-- 2. Show gossip only if condition returns true
DELETE FROM `npc_gossip` WHERE `npc_guid` = 23270;
INSERT INTO `gossip_menu` VALUES ('50408', '2139', '50408');
INSERT INTO `gossip_menu` VALUES ('50408', '2140', '0');
-- 3. Add gossip menu
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES
(50408, 0, 0, 'I\'d like to have another Yeh\'kinya\'s Scroll', 1, 1, -1, 0, 50408, 0, 0, NULL, 50408);
-- 4. 'gossip_scripts' table can have duplicates with the same id
DELETE FROM `gossip_scripts` WHERE `id` = 50408;
-- 5. On gossip option select: add Yeh'kinya's Scroll(using spell-cast 12998) to player's inventory
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(50408, 0, 15, 12998, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Yeh\'kinya\'s Scroll');
-- 6. Add gossip to NPC
UPDATE `creature_template` SET `gossip_menu_id` = 50408 WHERE `entry` = 8579;
