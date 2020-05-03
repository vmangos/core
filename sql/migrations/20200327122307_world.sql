DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200327122307');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200327122307');
-- Add your query below.


-- Add missing rank of Shackle Undead to trainers.
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`, `build_min`, `build_max`) VALUES
(3046, 10956, 46000, 0, 0, 60, 0, 5875),
(3044, 10956, 46000, 0, 0, 60, 0, 5875),
(6018, 10956, 46000, 0, 0, 60, 0, 5875),
(6014, 10956, 46000, 0, 0, 60, 0, 5875),
(3706, 10956, 46000, 0, 0, 60, 0, 5875),
(2129, 10956, 46000, 0, 0, 60, 0, 5875),
(3045, 10956, 46000, 0, 0, 60, 0, 5875);

-- Gossip menu for Aelthalyste.
INSERT INTO `gossip_menu` VALUES (4544, 4439, 0);
INSERT INTO `gossip_menu` VALUES (4544, 4442, 94);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4544, 0, 3, 'I seek more training in the priestly ways.', 7157, 5, 16, 0, 0, 0, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4544, 1, 0, 'I wish to unlearn my talents.', 8261, 1, 1, 4461, 0, 0, 0, 0, NULL, 0, 163);
UPDATE `creature_template` SET `gossip_menu_id`=4544, `npc_flags` = `npc_flags` | 1 WHERE `entry`=4606;

-- Gossip menu for Father Lankester.
INSERT INTO `gossip_menu` VALUES (4545, 4439, 0);
INSERT INTO `gossip_menu` VALUES (4545, 4442, 94);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4545, 1, 3, 'I seek more training in the priestly ways.', 7157, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4545, 2, 0, 'I wish to unlearn my talents.', 8261, 1, 1, 4461, 0, 0, 0, 0, '', 0, 163);
UPDATE `creature_template` SET `gossip_menu_id`=4545, `npc_flags` = `npc_flags` | 1 WHERE `entry`=4607;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
