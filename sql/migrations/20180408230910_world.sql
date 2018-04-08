DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180408230910');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180408230910');
-- Add your query below.


-- Item Bloated Mightfish is missing data.
-- Seems to have been added in patch 1.9.
UPDATE `item_template` SET `patch`=7 WHERE `entry`=21243;

-- According to Allakhazam, it can be fished from:
-- Bloodsail Compound, Booty Bay, Lost Rigger Cove, Ruins of Aboraz, Southbreak Shore, Southern Savage Coast, Steamwheedle Port, The Crystal Shore, The Forgotten Coast, The Savage Coast, Wavestrider Beach, Wild Shore, Zalashjis Den
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (1739, 21243, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (35, 21243, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (1336, 21243, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (311, 21243, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (1940, 21243, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (1578, 21243, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (977, 21243, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (302, 21243, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (1108, 21243, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (301, 21243, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (988, 21243, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (43, 21243, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (986, 21243, 1, 0, 1, 1, 0, 7, 10);

-- Based on Allakhazam comments it has similar loot as Bloated Redgill.
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21243, 7909, 30, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21243, 7910, 20, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21243, 3864, 10, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21243, 12361, 20, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21243, 7549, 0, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21243, 7551, 0, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21243, 7552, 0, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21243, 7553, 0, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21243, 11973, 0, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21243, 11974, 0, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21243, 11975, 0, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21243, 11987, 0, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21243, 11988, 0, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21243, 11998, 0, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21243, 11999, 0, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21243, 12001, 0, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21243, 12011, 0, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21243, 12012, 0, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21243, 12013, 0, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21243, 12022, 0, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21243, 12023, 0, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21243, 12024, 0, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21243, 12031, 0, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21243, 12032, 0, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21243, 12042, 0, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21243, 12043, 0, 1, 1, 1, 0, 7, 10);

-- Some alliance warlock trainers had wrong orcish gossip text.

-- Fix gossip for Drusilla La Salle
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (1503, 2175, 67);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (1503, 5722, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1503, 0, 3, 'I am interested in warlock training.', 2544, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1503, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 139);
UPDATE `creature_template` SET `gossip_menu_id`=1503 WHERE `entry`=459;

-- Fix gossip for Alamar Grimm
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4681, 2193, 67);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4681, 5723, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4681, 0, 3, 'I am interested in warlock training.', 2544, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4681, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 139);
UPDATE `creature_template` SET `gossip_menu_id`=4681 WHERE `entry`=460;

-- Fix gossip for Demisette Cloyce
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4503, 5693, 67);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4503, 5722, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4503, 0, 3, 'I am interested in warlock training.', 2544, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4503, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 139);
UPDATE `creature_template` SET `gossip_menu_id`=4503 WHERE `entry`=461;

-- Fix gossip for Maximillian Crowe
DELETE FROM `gossip_menu` WHERE `entry`=4667;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4667, 2193, 67);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4667, 5722, 0);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4667;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4667, 0, 3, 'I am interested in warlock training.', 2544, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4667, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 139);
UPDATE `creature_template` SET `gossip_menu_id`=4667 WHERE `entry`=906;

-- Fix gossip for Thistleheart
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4567, 2193, 67);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4567, 5723, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4567, 0, 3, 'I am interested in warlock training.', 2544, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4567, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 139);
UPDATE `creature_template` SET `gossip_menu_id`=4567 WHERE `entry`=5171;

-- Fix gossip for Briarthorn
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (2381, 2193, 67);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (2381, 5723, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (2381, 0, 3, 'I am interested in warlock training.', 2544, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (2381, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 139);
UPDATE `creature_template` SET `gossip_menu_id`=2381 WHERE `entry`=5172;

-- Fix gossip for Alexander Calder
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4566, 2193, 67);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4566, 5722, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4566, 0, 3, 'I am interested in warlock training.', 2544, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4566, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 139);
UPDATE `creature_template` SET `gossip_menu_id`=4566 WHERE `entry`=5173;

-- Fix gossip for Ursula Deline
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4505, 5693, 67);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4505, 5722, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4505, 0, 3, 'I am interested in warlock training.', 2544, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4505, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 139);
UPDATE `creature_template` SET `gossip_menu_id`=4505 WHERE `entry`=5495;

-- Fix gossip for Sandahl
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4504, 5693, 67);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4504, 5722, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4504, 0, 3, 'I am interested in warlock training.', 2544, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4504, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 139);
UPDATE `creature_template` SET `gossip_menu_id`=4504 WHERE `entry`=5496;

-- Fix gossip for Gimrizz Shadowcog
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4682, 2193, 67);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4682, 5722, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4682, 0, 3, 'I am interested in warlock training.', 2544, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4682, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 139);
UPDATE `creature_template` SET `gossip_menu_id`=4682 WHERE `entry`=5612;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
