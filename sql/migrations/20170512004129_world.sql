INSERT INTO `migrations` VALUES ('20170512004129'); 

-- Send mail with a Shiny Bauble inside after completing quest The Family and the Fishing Pole.
UPDATE `quest_template` SET `RewMailTemplateId`=87, `RewMailDelaySecs`=86400 WHERE `entry`=1141;
INSERT INTO `mail_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (87, 6529, 100, 0, 1, 1, 0);

-- Teach players fishing for free if they have quest The Family and the Fishing Pole.
UPDATE `creature_template` SET `gossip_menu_id`=2562, `npcflag`=7 WHERE `entry`=10216;

INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (10216, 9, 1141, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (10217, 7, 356, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (10218, -3, 10217, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (10219, -1, 10216, 10218);

INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (2562, 0, 1, 'Gubber, I don\'t have a fishing pole.', 3, 4, 0, 0, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (2562, 1, 0, 'Gubber, I don\'t know how to fish.', 1, 1, -1, 0, 10216, 0, 0, NULL, 10219);

INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (10216, 0, 15, 7733, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gubber Blump  - Teach Fishing');
