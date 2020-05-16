DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200507205634');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200507205634');
-- Add your query below.


-- add training menu back to vosur brakthell
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES
(4116, 3, 3, "Train me.", 3266, 5, 16, 0, 0, 0, 0, 0, "(NULL)", 0, 0);

-- add training menu back to alchemist mallory
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES
(4110, 3, 3, "Train me.", 3266, 5, 16, 0, 0, 0, 0, 0, "(NULL)", 0, 0);

-- add training menu back to cyndra kindwhisper
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES
(4112, 3, 3, "Train me.", 3266, 5, 16, 0, 0, 0, 0, 0, "(NULL)", 0, 0);

-- add training menu back to whuut
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES
(4118, 3, 3, "Train me.", 3266, 5, 16, 0, 0, 0, 0, 0, "(NULL)", 0, 0);

-- add training menu back to miao'zan
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES
(4129, 3, 3, "Train me.", 3266, 5, 16, 0, 0, 0, 0, 0, "(NULL)", 0, 0);


-- require alchemy skill of 50 to unlock expert alchemist training gossip
-- tally berryfizz
UPDATE `gossip_menu_option` SET `condition_id` = 361 WHERE `menu_id` = 4123 AND `option_id` = 5;

-- lilyssia nightbreeze
UPDATE `gossip_menu_option` SET `condition_id` = 361 WHERE `menu_id` = 4121 AND `option_id` = 5;

-- sylvanna forestmoon
UPDATE `gossip_menu_option` SET `condition_id` = 361 WHERE `menu_id` = 4114 AND `option_id` = 5;

-- yelmak
UPDATE `gossip_menu_option` SET `condition_id` = 361 WHERE `menu_id` = 4126 AND `option_id` = 5;

-- doctor marsh
UPDATE `gossip_menu_option` SET `condition_id` = 361 WHERE `menu_id` = 4133 AND `option_id` = 5;

-- bena winterhoof
UPDATE `gossip_menu_option` SET `condition_id` = 361 WHERE `menu_id` = 4131 AND `option_id` = 5;

-- alchemist narett
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES
(4119, 3, 3, "Train me.", 3266, 5, 16, 0, 0, 0, 0, 0, "(NULL)", 0, 361);

-- kylanna
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES
(4117, 3, 3, "Train me.", 3266, 5, 16, 0, 0, 0, 0, 0, "(NULL)", 0, 361);

-- serge hinott
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES
(4130, 3, 3, "Train me.", 3266, 5, 16, 0, 0, 0, 0, 0, "(NULL)", 0, 361);


-- require alchemy skill of 125 to unlock artisan alchemist training gossip
-- ainethil
UPDATE `gossip_menu_option` SET `condition_id` = 362 WHERE `menu_id` = 4124 AND `option_id` = 5;

-- doctor herbert halsey
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES
(4132, 3, 3, "Train me.", 3266, 5, 16, 0, 0, 0, 0, 0, "(NULL)", 0, 362);


-- require alchemy skill of 225 to unlock master alchemist training gossip
-- kylanna windwhisper
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES
(4125, 3, 3, "Train me.", 3266, 5, 16, 0, 0, 0, 0, 0, "(NULL)", 0, 363);

-- rogvar
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES
(4134, 3, 3, "Train me.", 3266, 5, 16, 0, 0, 0, 0, 0, "(NULL)", 0, 363);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
