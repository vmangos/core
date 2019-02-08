DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181222061647');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181222061647');
-- Add your query below.


-- Ironforge
-- (13433) Wulmort Jinglepocket add gossip
DELETE FROM `npc_gossip` WHERE `npc_guid` = 86182;
DELETE FROM `gossip_menu` WHERE `entry` = 6769 AND `text_id` = 6194;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6769, 6194, 0);
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6769;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`) VALUES
(6769, 0, 1, 'Let me browse your seasonal fare.', 8786, 3, 4, 0, 0, 0, 0, NULL, 0);
UPDATE `creature_template` SET `gossip_menu_id` = 6769 WHERE `entry` = 13433;
-- Add quest
-- https://classic.wowhead.com/npc=13433/wulmort-jinglepocket#starts
DELETE FROM `creature_questrelation` WHERE `quest` = 7022 AND `id` = 13433;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES
(13433, 7022);
-- (13434) Macey Jinglepocket add gossip
DELETE FROM `npc_gossip` WHERE `npc_guid` = 86180;
DELETE FROM `gossip_menu` WHERE `entry` = 5181 AND `text_id` = 6194;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(5181, 6194, 0);
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 5181;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`) VALUES
(5181, 0, 1, 'Let me browse your seasonal fare.', 8786, 3, 4, 0, 0, 0, 0, NULL, 0);
UPDATE `creature_template` SET `gossip_menu_id` = 5181 WHERE `entry` = 13434;

-- Orgrimmar
-- (13418) Kaymard Copperpinch add gossip
DELETE FROM `npc_gossip` WHERE `npc_guid` = 53618;
DELETE FROM `gossip_menu` WHERE `entry` = 6768 AND `text_id` = 6194;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6768, 6194, 0);
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6768;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`) VALUES
(6768, 0, 1, 'Let me browse your seasonal fare.', 8786, 3, 4, 0, 0, 0, 0, NULL, 0);
UPDATE `creature_template` SET `gossip_menu_id` = 6768 WHERE `entry` = 13418;
-- (13420) Penney Copperpinch add gossip
DELETE FROM `npc_gossip` WHERE `npc_guid` = 53620;
UPDATE `creature_template` SET `gossip_menu_id` = 5181 WHERE `entry` = 13420;

-- Stormwind
-- (13435) Khole Jinglepocket add gossip
DELETE FROM `npc_gossip` WHERE `npc_guid` = 86166;
UPDATE `creature_template` SET `gossip_menu_id` = 5181 WHERE `entry` = 13435;
-- Add quest
-- https://classic.wowhead.com/npc=13435/khole-jinglepocket#starts
DELETE FROM `creature_questrelation` WHERE `quest` = 7023 AND `id` = 13435;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES
(13435, 7023);
-- (13436) Guchie Jinglepocket delete gossip
UPDATE `creature_template` SET `npcflag` = 4 WHERE `entry` = 13436;

-- Undercity
-- (13429) Nardstrum Copperpinch add gossip
UPDATE `creature_template` SET `npcflag` = 7, `gossip_menu_id` = 5181 WHERE `entry` = 13429;
-- Remove wrong quests
-- https://classic.wowhead.com/npc=13429/nardstrum-copperpinch#starts
DELETE FROM `creature_questrelation` WHERE `quest` IN (7022, 7023) AND `id` = 13429;
-- (13430) Jaycrue Copperpinch delete gossip
DELETE FROM `npc_gossip` WHERE `npc_guid` = 86233;
UPDATE `creature_template` SET `npcflag` = 4 WHERE `entry` = 13430;
-- https://classic.wowhead.com/quest=7024/great-father-winter-is-here
UPDATE `creature_involvedrelation` SET `id` = 13445 WHERE `quest` = 7024;
UPDATE `quest_template` SET `ExclusiveGroup` = 6961 WHERE `entry` IN (6961, 7024);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
