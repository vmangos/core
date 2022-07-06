DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210926210111');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210926210111');
-- Add your query below.


-- Add Missing Creatures
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(3526, 16005, 0, 0, 0, 0, -8813.1, 613.857, 95.2532, 3.15905, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
(3527, 16007, 0, 0, 0, 1, 1617.32, -4399.98, 11.5139, 2.94961, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
(3528, 16008, 0, 0, 0, 1, -1268.37, 49.4112, 128.258, 5.51524, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
(3529, 16009, 0, 0, 0, 0, -4918.69, -971.674, 501.555, 2.11185, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10);

INSERT INTO `game_event_creature` (`guid`, `event`) VALUES
(3526, 8),
(3527, 8),
(3528, 8),
(3529, 8);

-- Quests 9024 and 9025 Should be Chained
UPDATE `quest_template` SET `NextQuestInChain` = 9025 WHERE `entry` = 9024;

-- Add Missing Gossips
UPDATE `creature_template` SET `gossip_menu_id` = 7081 WHERE `entry` = 1328;
UPDATE `creature_template` SET `gossip_menu_id` = 6959 WHERE `entry` = 1402;
UPDATE `creature_template` SET `gossip_menu_id` = 6976 WHERE `entry` = 1405;
UPDATE `creature_template` SET `gossip_menu_id` = 6976 WHERE `entry` = 1719;
UPDATE `creature_template` SET `gossip_menu_id` = 6981 WHERE `entry` = 1750;
UPDATE `creature_template` SET `gossip_menu_id` = 6976 WHERE `entry` = 3628;
UPDATE `creature_template` SET `gossip_menu_id` = 6976 WHERE `entry` = 7917;
UPDATE `creature_template` SET `gossip_menu_id` =  7017 WHERE `entry` = 11750;
UPDATE `creature_template` SET `gossip_menu_id` =  7081 WHERE `entry` = 12805;
UPDATE `creature_template` SET `gossip_menu_id` =  6981 WHERE `entry` = 16002;

-- NOTE: MOST OF THESE TEXT_ID's ARE PLACEHOLDERS
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(7081, 8245, 0, 461),
(7081, 8282, 0, 459),
(7081, 8285, 0, 454),
(7081, 8286, 0, 458),
(7081, 8296, 0, 460),
(7081, 8298, 0, 455);

INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(6959, 8235, 0, 461),
(6959, 8293, 0, 459),
(6959, 8285, 0, 454),
(6959, 8295, 0, 458),
(6959, 8296, 0, 460),
(6959, 8294, 0, 455);

INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(6976, 8235, 0, 461),
(6976, 8284, 0, 459),
(6976, 8285, 0, 454),
(6976, 8291, 0, 458),
(6976, 8242, 0, 460),
(6976, 8290, 0, 455);

INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(6981, 8245, 0, 461),
(6981, 8282, 0, 459),
(6981, 8285, 0, 454),
(6981, 8286, 0, 458),
(6981, 8243, 0, 460),
(6981, 8298, 0, 455);

INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES
(7081, 1, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 402, 0, 0, NULL, 0, 462),
(7081, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 403, 0, 0, NULL, 0, 461);

INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES
(6959, 1, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 402, 0, 0, NULL, 0, 462),
(6959, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 403, 0, 0, NULL, 0, 461);

INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES
(6976, 1, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 402, 0, 0, NULL, 0, 462),
(6976, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 403, 0, 0, NULL, 0, 461);

INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES
(6981, 1, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 402, 0, 0, NULL, 0, 462),
(6981, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 403, 0, 0, NULL, 0, 461);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
