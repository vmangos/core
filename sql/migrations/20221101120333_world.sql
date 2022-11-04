DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20221101120333');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20221101120333');
-- Add your query below.

-- 90 (Seasoned Wolf Kabobs) should require a Cooking skill of 50 (currently requires 0)
UPDATE `quest_template` SET `RequiredSkill` = 185, `RequiredSkillValue` = 50 WHERE `entry` = 769;

-- 769 (Kodo Hide Bag) should require a Leatherworking skill of 10 (currently requires 1)
UPDATE `quest_template` SET `RequiredSkillValue` = 10 WHERE `entry` = 769;

-- 862 (Dig Rat Stew) should require a Cooking skill of 15 (currently requires 1)
UPDATE `quest_template` SET `RequiredSkillValue` = 15 WHERE `entry` = 862;

-- 866 (Root Samples) should require a Herbalism skill of 40 (currently requires 1)
UPDATE `quest_template` SET `RequiredSkillValue` = 40 WHERE `entry` = 866;

-- 1579 (Gaffer Jacks) should require a Fishing skill of 40 (currently requires 30)
UPDATE `quest_template` SET `RequiredSkillValue` = 40 WHERE `entry` = 1579;

-- 1582 (Moonglow Vest) should require a Leatherworking skill of 70 (currently requires 90)
UPDATE `quest_template` SET `RequiredSkillValue` = 70 WHERE `entry` = 1582;

-- 1618 (Gearing Redridge) should require a Blacksmithing skill of 60 (currently requires 70)
UPDATE `quest_template` SET `RequiredSkillValue` = 60 WHERE `entry` = 1618;

-- 5143 (Tribal Leatherworking (alliance side)) requires completing 2853 (Master of the Wild Leather (alliance side))
UPDATE `quest_template` SET `PrevQuestId` = 2853 WHERE `entry` = 5143;

-- 5148 (Tribal Leatherworking (horde side)) requires completing 2860 (Master of the Wild Leather (horde side))
UPDATE `quest_template` SET `PrevQuestId` = 2860 WHERE `entry` = 5148;

-- All Wild Leather Armor quests should require a Leatherworking skill of 200 (currently requires 225)
UPDATE `quest_template` SET `RequiredSkillValue` = 200 WHERE `entry` = 2847;
UPDATE `quest_template` SET `RequiredSkillValue` = 200 WHERE `entry` = 2848;
UPDATE `quest_template` SET `RequiredSkillValue` = 200 WHERE `entry` = 2849;
UPDATE `quest_template` SET `RequiredSkillValue` = 200 WHERE `entry` = 2850;
UPDATE `quest_template` SET `RequiredSkillValue` = 200 WHERE `entry` = 2851;
UPDATE `quest_template` SET `RequiredSkillValue` = 200 WHERE `entry` = 2852;
UPDATE `quest_template` SET `RequiredSkillValue` = 200 WHERE `entry` = 2853;
UPDATE `quest_template` SET `RequiredSkillValue` = 200 WHERE `entry` = 2854;
UPDATE `quest_template` SET `RequiredSkillValue` = 200 WHERE `entry` = 2855;
UPDATE `quest_template` SET `RequiredSkillValue` = 200 WHERE `entry` = 2856;
UPDATE `quest_template` SET `RequiredSkillValue` = 200 WHERE `entry` = 2857;
UPDATE `quest_template` SET `RequiredSkillValue` = 200 WHERE `entry` = 2858;
UPDATE `quest_template` SET `RequiredSkillValue` = 200 WHERE `entry` = 2859;
UPDATE `quest_template` SET `RequiredSkillValue` = 200 WHERE `entry` = 2860;


-- Condition to return true if 2855 (Wild Leather Shoulders (horde side)) is complete
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (20000, 8, 2855, 0, 0, 0, 0);

-- Condition to return true if 2856 (Wild Leather Vest (horde side)) is complete
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (20001, 8, 2856, 0, 0, 0, 0);

-- Condition to return true if 2857 (Wild Leather Helmet (horde side)) is complete
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (20002, 8, 2857, 0, 0, 0, 0);

-- Condition to return true if the previous 3 conditions are true
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (20003, -1, 20000, 20001, 20002, 0, 0);

-- Set quest requirement for 2858 (Wild Leather Boots (horde side)) to previous condition
UPDATE `quest_template` SET `RequiredSkillValue` = 200, `PrevQuestId` = 0, `RequiredCondition` = 20003 WHERE `entry` = 2858;

-- Set quest requirement for 2859 (Wild Leather Leggings (horde side)) to previous condition
UPDATE `quest_template` SET `RequiredSkillValue` = 200, `PrevQuestId` = 0, `RequiredCondition` = 20003 WHERE `entry` = 2859;


-- Condition to return true if 2848 (Wild Leather Shoulders (alliance side)) is complete
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (20004, 8, 2848, 0, 0, 0, 0);

-- Condition to return true if 2849 (Wild Leather Vest (alliance side)) is complete
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (20005, 8, 2849, 0, 0, 0, 0);

-- Condition to return true if 2850 (Wild Leather Helmet (alliance side)) is complete
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (20006, 8, 2850, 0, 0, 0, 0);

-- Condition to return true if the previous 3 conditions are true
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (20007, -1, 20004, 20005, 20006, 0, 0);

-- Set quest requirement for 2851 (Wild Leather Boots (horde side)) to previous condition
UPDATE `quest_template` SET `RequiredSkillValue` = 200, `PrevQuestId` = 0, `RequiredCondition` = 20007 WHERE `entry` = 2851;

-- Set quest requirement for 2852 (Wild Leather Leggings (horde side)) to previous condition
UPDATE `quest_template` SET `RequiredSkillValue` = 200, `PrevQuestId` = 0, `RequiredCondition` = 20007 WHERE `entry` = 2852;



-- Condition to return true if Pattern: Wild Leather Shoulders is NOT learnt
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (20008, 17, 10529, 1, 0, 0, 0);

-- Condition to return true if Pattern: Wild Leather Vest is NOT learnt
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (20009, 17, 10544, 1, 0, 0, 0);

-- Condition to return true if Pattern: Wild Leather Helmet is NOT learnt
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (20010, 17, 10546, 1, 0, 0, 0);

-- Condition to return true if Pattern: Wild Leather Boots is NOT learnt
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (20011, 17, 10566, 1, 0, 0, 0);

-- Condition to return true if Pattern: Wild Leather Leggings is NOT learnt
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (20012, 17, 10572, 1, 0, 0, 0);

-- Condition to return true if Pattern: Wild Leather Cloak is NOT learnt
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (20027, 17, 10574, 1, 0, 0, 0);


-- Condition to return true if 2858 (Wild Leather Boots (horde side)) is complete
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (20013, 8, 2858, 0, 0, 0, 0);

-- Condition to return true if 2859 (Wild Leather Leggings (horde side)) is complete
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (20014, 8, 2859, 0, 0, 0, 0);

-- Condition to return true if 2851 (Wild Leather Boots (alliance side)) is complete
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (20015, 8, 2851, 0, 0, 0, 0);

-- Condition to return true if 2852 (Wild Leather Leggings (alliance side)) is complete
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (20016, 8, 2852, 0, 0, 0, 0);

-- Condition to return true if 2860 (Master of the Wild Leather (horde side)) is complete
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (20028, 8, 2860, 0, 0, 0, 0);

-- Condition to return true if 2853 (Master of the Wild Leather (alliance side)) is complete
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (20029, 8, 2853, 0, 0, 0, 0);


-- Note: Condition 379 is a condition requiring 200 Leatherworking Skill

-- Condition for gossip option Wild Leather Shoulders (horde)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (20017, -1, 379, 20000, 20008, 0, 0);

-- Condition for gossip option Wild Leather Vest (horde)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (20018, -1, 379, 20001, 20009, 0, 0);

-- Condition for gossip option Wild Leather Helmet (horde)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (20019, -1, 379, 20002, 20010, 0, 0);

-- Condition for gossip option Wild Leather Boots (horde)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (20020, -1, 379, 20013, 20011, 0, 0);

-- Condition for gossip option Wild Leather Leggings (horde)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (20021, -1, 379, 20014, 20012, 0, 0);

-- Condition for gossip option Wild Leather Cloak (horde)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (20030, -1, 379, 20028, 20027, 0, 0);


-- Condition for gossip option Wild Leather Shoulders (alliance)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (20022, -1, 379, 20004, 20008, 0, 0);

-- Condition for gossip option Wild Leather Vest (alliance)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (20023, -1, 379, 20005, 20009, 0, 0);

-- Condition for gossip option Wild Leather Helmet (alliance)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (20024, -1, 379, 20006, 20010, 0, 0);

-- Condition for gossip option Wild Leather Boots (alliance)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (20025, -1, 379, 20015, 20011, 0, 0);

-- Condition for gossip option Wild Leather Leggings (alliance)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (20026, -1, 379, 20016, 20012, 0, 0);

-- Condition for gossip option Wild Leather Cloak (alliance)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (20031, -1, 379, 20029, 20027, 0, 0);


-- Broadcast text for all gossip options already exists, but wasn't implemented

-- Gossip options for Jangdor Swiftrider
-- Wild Leather Shoulders
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(2855, 0, 0, 15, 23626, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jangdor Swiftrider - Teach Wild Leather Shoulders');
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES 
(1964, 6, 0, 'Hey Jangdor - can you teach me again how to make Wild Leather Shoulders again?', 9839, 1, 7, -1, 0, 2855, 0, 0, '', 0, 20017);
-- Wild Leather Vest
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(2856, 0, 0, 15, 23627, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jangdor Swiftrider - Teach Wild Leather Vest');
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES 
(1964, 7, 0, 'Hey Jangdor - can you teach me again how to make a Wild Leather Vest again?', 9840, 1, 7, -1, 0, 2856, 0, 0, '', 0, 20018);
-- Wild Leather Helmet
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(2857, 0, 0, 15, 23623, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jangdor Swiftrider - Teach Wild Leather Helmet');
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES 
(1964, 4, 0, 'Hey Jangdor - can you teach me again how to make a Wild Leather Helmet again?', 9837, 1, 7, -1, 0, 2857, 0, 0, '', 0, 20019);
-- Wild Leather Boots
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(2858, 0, 0, 15, 23621, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jangdor Swiftrider - Teach Wild Leather Boots');
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES 
(1964, 2, 0, 'Hey Jangdor - can you teach me again how to make Wild Leather Boots again?', 9835, 1, 7, -1, 0, 2858, 0, 0, '', 0, 20020);
-- Wild Leather Leggings
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(2859, 0, 0, 15, 23625, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jangdor Swiftrider - Teach Wild Leather Leggings');
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES 
(1964, 5, 0, 'Hey Jangdor - can you teach me again how to make Wild Leather Leggings again?', 9838, 1, 7, -1, 0, 2859, 0, 0, '', 0, 20021);
-- Wild Leather Cloak
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(2860, 0, 0, 15, 23622, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jangdor Swiftrider - Teach Wild Leather Cloak');
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES 
(1964, 3, 0, 'Hey Jangdor - can you teach me again how to make a Wild Leather Cloak again?', 9836, 1, 7, -1, 0, 2860, 0, 0, '', 0, 20030);

-- Gossip options for Pratt McGrubben
-- Wild Leather Shoulders
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(2847, 0, 0, 15, 23626, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pratt McGrubben - Teach Wild Leather Shoulders');
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES 
(1965, 5, 0, 'Hey Pratt - can you teach me again how to make Wild Leather Shoulders again?', 9832, 1, 7, -1, 0, 2847, 0, 0, '', 0, 20022);
-- Wild Leather Vest
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(2848, 0, 0, 15, 23627, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pratt McGrubben - Teach Wild Leather Vest');
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES 
(1965, 4, 0, 'Hey Pratt - can you teach me again how to make a Wild Leather Vest again?', 9831, 1, 7, -1, 0, 2848, 0, 0, '', 0, 20023);
-- Wild Leather Helmet
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(2849, 0, 0, 15, 23623, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pratt McGrubben - Teach Wild Leather Helmet');
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES 
(1965, 7, 0, 'Hey Pratt - can you teach me how to make a Wild Leather Helmet again?', 9834, 1, 7, -1, 0, 2849, 0, 0, '', 0, 20024);
-- Wild Leather Boots
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(2850, 0, 0, 15, 23621, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pratt McGrubben - Teach Wild Leather Boots');
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES 
(1965, 2, 0, 'Hey Pratt - can you teach me how to make Wild Leather Boots again?', 9829, 1, 7, -1, 0, 2850, 0, 0, '', 0, 20025);
-- Wild Leather Leggings
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(2851, 0, 0, 15, 23625, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pratt McGrubben - Teach Wild Leather Leggings');
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES 
(1965, 6, 0, 'Hey Pratt - can you teach me how to make Wild Leather Leggings again?', 9833, 1, 7, -1, 0, 2851, 0, 0, '', 0, 20026);
-- Wild Leather Cloak
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(2852, 0, 0, 15, 23622, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pratt McGrubben - Teach Wild Leather Cloak');
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES 
(1965, 3, 0, 'Hey Pratt - can you teach me how to make a Wild Leather Cloak again?', 9830, 1, 7, -1, 0, 2852, 0, 0, '', 0, 20031);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
