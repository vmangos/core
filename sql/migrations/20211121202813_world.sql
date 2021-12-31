DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211121202813');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211121202813');
-- Add your query below.


-- Cyrus Therepentous
-- Add Gossips
DELETE FROM `npc_gossip` WHERE `npc_guid` = 9;
UPDATE `creature_template` SET `gossip_menu_id` = 1841 WHERE `entry` = 9459;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(1842,2494);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES
(1841, 0, 0, 'I present you with proof of my deeds, Cyrus.', 4754, 1, 1, -1, 0, 4022, 0, 0, '', 0, 214),
(1841, 1, 0, 'I do not possess any proof, Cyrus.', 4755, 1, 1, 1842, 0, 0, 0, 0, '', 0, 216),
(1842, 0, 0, 'I am ready!', 4759, 1, 1, -1, 0, 4023, 0, 0, '', 0, 217);

-- Unlock Quest 4022 if Quest 3481 is Complete and you have Item 10575
UPDATE `quest_template` SET `RequiredCondition` = 210, `PrevQuestId` = 0, `NextQuestId` = 0, `SpecialFlags` = 2 WHERE `entry`=4022;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (208, 8, 3481, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (209, 23, 10575, 1, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (210, -1, 208, 209, 0, 0, 0);

-- Unlock Quest 4023 if Quest 3481 is not Complete or you dont have Item 10575
UPDATE `quest_template` SET `RequiredCondition` = 213 WHERE `entry` = 4023;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (211, 8, 3481, 0, 0, 0, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (212, 23, 10575, 1, 0, 0, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (213, -2, 211, 212, 0, 0, 0);

-- Only Unlock Gossip Option 1841 id 0 if Quest 4022 is Taken
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (214, 9, 4022, 1, 0, 0, 0);

-- Only Unlock Gossip Option 1841 id 1 if Quest 4023 is Taken
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (216, 9, 4023, 1, 0, 0, 0);

-- Only Unlock Gossip Option 1843 if Frenzied Black Drake is not already summoned
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (217, 20, 9461, 500, 0, 0, 1);

-- Move Script to Summon Drake to Gossip Option
DELETE FROM `quest_start_scripts` WHERE `id`=4023;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4023, 5, 10, 9461, 60000, 0, 0, 0, 0, 0, 0, 4, 0, -1, 1, -7672.74, -2973.34, 132.52, 1.86749, 0, 'Summon Frenzied Black Drake');

-- Add Script to Complete Quest
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4022, 0, 7, 4022, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cyrus Therepentous - Complete Quest');

-- Quest 2024 Should only unlock if Either 4022 or 4023 has been completed
UPDATE `quest_template` SET `PrevQuestId` = 0, `RequiredCondition` = 220 WHERE `entry` = 4024;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (218, 8, 4022, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (219, 8, 4023, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (220, -2, 218, 219, 0, 0, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
