DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20221101120333');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20221101120333');
-- Add your query below.

-- 769 (Kodo Hide Bag) should require a Leatherworking skill of 10 (currently requires 1)
UPDATE `quest_template` SET `RequiredSkillValue` = 10 WHERE `entry` = 769;

-- 866 (Root Samples) should require a Herbalism skill of 40 (currently requires 1)
UPDATE `quest_template` SET `RequiredSkillValue` = 40 WHERE `entry` = 866;

-- 1618 (Gearing Redridge) should require a Blacksmithing skill of 60 (currently requires 70)
UPDATE `quest_template` SET `RequiredSkillValue` = 60 WHERE `entry` = 1618;

-- Condition to return true if 2855 (Wild Leather Shoulders (horde side)) is complete
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (20000, 8, 2855, 0, 0, 0, 0);

-- Condition to return true if 2856 (Wild Leather Vest (horde side)) is complete
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (20001, 8, 2856, 0, 0, 0, 0);

-- Condition to return true if 2857 (Wild Leather Helmet (horde side)) is complete
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (20002, 8, 2857, 0, 0, 0, 0);

-- Condition to return true if the previous 3 conditions are true
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (20003, -1, 20000, 20001, 20002, 0, 0);

-- Set quest requirement for 2858 (Wild Leather Boots (horde side)) to previous condition
UPDATE `quest_template` SET `RequiredSkillValue` = 200, `PrevQuestId` = 0, `NextQuestId` = 0, `RequiredCondition` = 20003 WHERE `entry` = 2858;

-- Set quest requirement for 2859 (Wild Leather Leggings (horde side)) to previous condition
UPDATE `quest_template` SET `RequiredSkillValue` = 200, `PrevQuestId` = 0, `NextQuestId` = 0, `RequiredCondition` = 20003 WHERE `entry` = 2859;

-- INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES 
-- (1964, 2855, 0, 'Hey Jangdor - can you teach me again how to make Wild Leather Shoulders again?', 0, 0, );


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
