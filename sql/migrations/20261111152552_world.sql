DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20261111152552');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20261111152552');
-- Add your query below.

-- Replace conditions: Add patch condition, use quest_template fields instead of extra unnecessary conditions
DELETE FROM `conditions` WHERE `condition_entry` BETWEEN 20000 AND 20031;
DELETE FROM `gossip_menu_option` WHERE `condition_id` BETWEEN 20000 AND 20031;

INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES 
(10529, 17, 10529, 1, 0, 0, 0),           -- Player hasn't learnt Pattern: Wild Leather Shoulders
(10544, 17, 10544, 1, 0, 0, 0),           -- Player hasn't learnt Pattern: Wild Leather Vest
(10546, 17, 10546, 1, 0, 0, 0),           -- Player hasn't learnt Pattern: Wild Leather Helmet
(10566, 17, 10566, 1, 0, 0, 0),           -- Player hasn't learnt Pattern: Wild Leather Boots
(10572, 17, 10572, 1, 0, 0, 0),           -- Player hasn't learnt Pattern: Wild Leather Leggings
(10574, 17, 10574, 1, 0, 0, 0),           -- Player hasn't learnt Pattern: Wild Leather Cloak
-- Condition 379: Player has a Leatherworking skill of 200 or more (Should only check for quest requirement, not pattern requirement)
-- Condition 4013: Patch is 1.5 or greater
-- Alliance
-- Quest rewarded
(2848, 8, 2848, 0, 0, 0, 0),              -- Wild Leather Shoulders
(2849, 8, 2849, 0, 0, 0, 0),              -- Wild Leather Vest
(2850, 8, 2850, 0, 0, 0, 0),              -- Wild Leather Helmet
(2851, 8, 2851, 0, 0, 0, 0),              -- Wild Leather Boots
(12852, 8, 2852, 0, 0, 0, 0),             -- Wild Leather Leggings
(2853, 8, 2853, 0, 0, 0, 0),              -- Master of the Wild Leather
-- Relearn gossip option
(12848, -1, 379, 2848, 4013, 10529, 0),   -- Wild Leather Shoulders
(12849, -1, 379, 2849, 4013, 10544, 0),   -- Wild Leather Vest
(12850, -1, 379, 2850, 4013, 10546, 0),   -- Wild Leather Helmet
(12851, -1, 379, 2851, 4013, 10566, 0),   -- Wild Leather Boots
(22852, -1, 379, 4013, 10572, 12852, 0),  -- Wild Leather Leggings
(12853, -1, 379, 2853, 4013, 10574, 0),   -- Wild Leather Cloak
-- Horde
-- Quest rewarded
(2855, 8, 2855, 0, 0, 0, 0),              -- Wild Leather Shoulders
(2856, 8, 2856, 0, 0, 0, 0),              -- Wild Leather Vest
(2857, 8, 2857, 0, 0, 0, 0),              -- Wild Leather Helmet
(2858, 8, 2858, 0, 0, 0, 0),              -- Wild Leather Boots
(2859, 8, 2859, 0, 0, 0, 0),              -- Wild Leather Leggings
(2860, 8, 2860, 0, 0, 0, 0),              -- Master of the Wild Leather
-- Relearn gossip option
(12855, -1, 379, 2855, 4013, 10529, 0),   -- Wild Leather Shoulders
(12856, -1, 379, 2856, 4013, 10544, 0),   -- Wild Leather Vest
(12857, -1, 379, 2857, 4013, 10546, 0),   -- Wild Leather Helmet
(12858, -1, 379, 2858, 4013, 10566, 0),   -- Wild Leather Boots
(12859, -1, 379, 2859, 4013, 10572, 0),   -- Wild Leather Leggings
(12860, -1, 379, 2860, 4013, 10574, 0);   -- Wild Leather Cloak

-- Wild Leather Boots and Wild Leather Leggings require previous 3 quests (use `quest_template` fields instead of conditions)
-- Reset all relevant fields
UPDATE `quest_template` SET `PrevQuestId` = 0,  `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestInChain` = 0, `RequiredCondition` = 0 WHERE `entry` BETWEEN 2848 AND 2860;
-- Alliance
UPDATE `quest_template` SET `PrevQuestId` = 2847, `ExclusiveGroup` = -2848 WHERE `entry` BETWEEN 2848 AND 2850;
UPDATE `quest_template` SET `PrevQuestId` = 2848, `ExclusiveGroup` = -2851 WHERE `entry` IN (2851, 2852);
UPDATE `quest_template` SET `PrevQuestId` = 2851 WHERE `entry` = 2853;
-- Horde
UPDATE `quest_template` SET `PrevQuestId` = 2854, `ExclusiveGroup` = -2855 WHERE `entry` BETWEEN 2855 AND 2857;
UPDATE `quest_template` SET `PrevQuestId` = 2855, `ExclusiveGroup` = -2858 WHERE `entry` IN (2858, 2859);
UPDATE `quest_template` SET `PrevQuestId` = 2858 WHERE `entry` = 2860;

-- Reinsert gossip options with new conditions
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES 
(1965, 5, 0, 'Hey Pratt - can you teach me again how to make Wild Leather Shoulders again?', 9832, 1, 7, -1, 0, 2847, 0, 0, '', 0, 12848),
(1965, 4, 0, 'Hey Pratt - can you teach me again how to make a Wild Leather Vest again?', 9831, 1, 7, -1, 0, 2848, 0, 0, '', 0, 12849),
(1965, 7, 0, 'Hey Pratt - can you teach me how to make a Wild Leather Helmet again?', 9834, 1, 7, -1, 0, 2849, 0, 0, '', 0, 12850),
(1965, 2, 0, 'Hey Pratt - can you teach me how to make Wild Leather Boots again?', 9829, 1, 7, -1, 0, 2850, 0, 0, '', 0, 12851),
(1965, 6, 0, 'Hey Pratt - can you teach me how to make Wild Leather Leggings again?', 9833, 1, 7, -1, 0, 2851, 0, 0, '', 0, 22852),
(1965, 3, 0, 'Hey Pratt - can you teach me how to make a Wild Leather Cloak again?', 9830, 1, 7, -1, 0, 2852, 0, 0, '', 0, 12853),
(1964, 6, 0, 'Hey Jangdor - can you teach me again how to make Wild Leather Shoulders again?', 9839, 1, 7, -1, 0, 2855, 0, 0, '', 0, 12855),
(1964, 7, 0, 'Hey Jangdor - can you teach me again how to make a Wild Leather Vest again?', 9840, 1, 7, -1, 0, 2856, 0, 0, '', 0, 12856),
(1964, 4, 0, 'Hey Jangdor - can you teach me again how to make a Wild Leather Helmet again?', 9837, 1, 7, -1, 0, 2857, 0, 0, '', 0, 12857),
(1964, 2, 0, 'Hey Jangdor - can you teach me again how to make Wild Leather Boots again?', 9835, 1, 7, -1, 0, 2858, 0, 0, '', 0, 12858),
(1964, 5, 0, 'Hey Jangdor - can you teach me again how to make Wild Leather Leggings again?', 9838, 1, 7, -1, 0, 2859, 0, 0, '', 0, 12859),
(1964, 3, 0, 'Hey Jangdor - can you teach me again how to make a Wild Leather Cloak again?', 9836, 1, 7, -1, 0, 2860, 0, 0, '', 0, 12860);

    
-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
