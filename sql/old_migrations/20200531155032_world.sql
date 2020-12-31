DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200531155032');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200531155032');
-- Add your query below.


-- Alyissia <Warrior Trainer>
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES 
(4696, 1217, 98),
(4696, 5725, 99);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES 
(4696, 0, 3, 'I require warrior training.', 3147, 5, 16, 0, 0, 0, 0, 0, '', 0, 0),
(4696, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 133);
UPDATE `creature_template` SET `gossip_menu_id`=4696 WHERE `entry`=3593;

-- Cyndra Kindwhisper <Journeyman Alchemist>
INSERT INTO `gossip_menu` VALUES
(4113, 5022, 0),
(4113, 5023, 25),
(4113, 5024, 361);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES
(4113, 3, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, NULL, 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4113 WHERE `entry`=3603;

-- Malorne Bladeleaf <Herbalist>
UPDATE `creature_template` SET `npc_flags`=16 WHERE `entry`=3604;

-- Zarrin <Cook>
INSERT INTO `gossip_menu` VALUES (2021, 2676, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES
(2021, 0, 3, 'I\'d like to train in cooking.', 4988, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=2021 WHERE `entry`=6286;

-- Innkeeper Shay <Innkeeper>
INSERT INTO `gossip_menu` VALUES (348, 821, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES 
(348, 0, 0, 'Trick or Treat!', 10693, 1, 1, -1, 0, 342, 0, 0, NULL, 0, 164),
(348, 1, 5, 'Make this inn your home.', 2822, 8, 128, 0, 0, 0, 0, 0, '', 0, 0),
(348, 2, 0, 'Does that heart mean you\'re looking for love?', 11823, 1, 1, 5110, 0, 0, 0, 0, '', 0, 440),
(348, 3, 1, 'Let me browse your seasonal fare.', 8786, 3, 4, 2, 0, 0, 0, 0, '', 0, 440),
(348, 4, 1, 'Let me browse your goods.', 8097, 3, 4, 1, 0, 0, 0, 0, '', 0, 0),
(348, 5, 0, 'Tell me about dungeons I could explore.', 9882, 1, 1, 6029, 0, 0, 0, 0, NULL, 0, 4500);
UPDATE `creature_template` SET `gossip_menu_id`=348 WHERE `entry`=2388;

-- Innkeeper Thulbek <Innkeeper>
INSERT INTO `gossip_menu` VALUES (1582, 938, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES 
(1582, 0, 0, 'Trick or Treat!', 10693, 1, 1, -1, 0, 342, 0, 0, NULL, 0, 164),
(1582, 1, 5, 'Make this inn your home.', 2822, 8, 128, 0, 0, 0, 0, 0, '', 0, 0),
(1582, 2, 0, 'Does that heart mean you\'re looking for love?', 11823, 1, 1, 5110, 0, 0, 0, 0, '', 0, 440),
(1582, 3, 1, 'Let me browse your seasonal fare.', 8786, 3, 4, 2, 0, 0, 0, 0, '', 0, 440),
(1582, 4, 1, 'I want to browse your goods.', 3370, 3, 4, 1, 0, 0, 0, 0, '', 0, 0),
(1582, 5, 0, 'Tell me about dungeons I could explore.', 9882, 1, 1, 6029, 0, 0, 0, 0, NULL, 0, 4500);
UPDATE `creature_template` SET `gossip_menu_id`=1582 WHERE `entry`=5814;

-- Uthan Stillwater <Fisherman>
UPDATE `creature_template` SET `gossip_menu_id`=5665 WHERE `entry`=5938;

-- Lara Moore <Leather Armor Merchant>
UPDATE `creature_template` SET `gossip_menu_id`=686 WHERE `entry`=1295;

-- Frederick Stover <Bow & Arrow Merchant>
UPDATE `creature_template` SET `gossip_menu_id`=687 WHERE `entry`=1298;

-- Owen Vaughn <Reagent Vendor>
UPDATE `creature_template` SET `gossip_menu_id`=681 WHERE `entry`=1308;

-- Duncan Cullen <Light Armor Merchant>
UPDATE `creature_template` SET `gossip_menu_id`=681 WHERE `entry`=1314;

-- Bryan Cross <Shield Merchant>
UPDATE `creature_template` SET `gossip_menu_id`=688 WHERE `entry`=1319;

-- Gregory Ardus <Staff & Mace Merchant>
UPDATE `creature_template` SET `gossip_menu_id`=691 WHERE `entry`=1348;

-- Agustus Moulaine <Mail Armor Merchant>
UPDATE `creature_template` SET `gossip_menu_id`=691 WHERE `entry`=1349;

-- Varimathras
INSERT INTO `gossip_menu` VALUES (3663, 4476, 0);
UPDATE `creature_template` SET `gossip_menu_id`=3663 WHERE `entry`=2425;

-- Myizz Luckycatch <Superior Fisherman>
UPDATE `creature_template` SET `gossip_menu_id`=5665 WHERE `entry`=2834;

-- Cairne Bloodhoof <High Chieftain>
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (285, 9, 925, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (286, 23, 18643, 1, 0, 0, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (287, -1, 285, 286, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (5852, 7014, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5851, 0, 0, 'Chief Bloodhoof, this may sound like an odd request... but I have a young ward who is quite shy.  You are a hero to him, and he asked me to get your hoofprint.', 9670, 1, 1, 5852, 0, 5851, 0, 0, '', 0, 287);
DELETE FROM `gossip_scripts` WHERE `id`=5851;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5851, 0, 15, 23123, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cairne Bloodhoof - Cast Spell Cairne\'s Hoofprint');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (30570, 'Thunder Bluff - Cairne Bloodhoof', 16727, 100, 1, 0, 0, 64, 0, 30, 120, 120, 0, 22911, 100, 4, 0, 0, 128, 20, 20, 15, 25, 0, 22916, 100, 1, 0, 0, 0, 5, 5, 20, 20, 0, 16856, 100, 1, 0, 0, 0, 15, 15, 15, 15, 0, 15284, 100, 1, 0, 0, 0, 10, 10, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5851, `leash_range`=50, `spell_list_id`=30570, `script_name`='' WHERE `entry`=3057;

-- Eitrigg
INSERT INTO `gossip_menu` VALUES 
(2901, 3573, 0),
(2902, 3580, 0),
(2903, 3579, 0),
(2904, 3578, 0),
(2905, 3577, 0),
(2906, 3576, 0),
(2907, 3575, 0),
(2908, 3574, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4941, 9, 4941, 1, 0, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `action_script_id`, `condition_id`) VALUES 
(2901, 0, 0, 'Hello, Eitrigg. I bring news from Blackrock Spire.', 5990, 1, 1, 2908, 0, 0, 0, NULL, 0, 0, 4941),
(2902, 0, 0, 'As you wish, Eitrigg.', 6004, 1, 1, -1, 0, 0, 0, NULL, 0, 2902, 0),
(2903, 0, 0, 'Perhaps there exists a way?', 6002, 1, 1, 2902, 0, 0, 0, NULL, 0, 0, 0),
(2904, 0, 0, 'Ah, so that is how they pushed the Dark Iron to the lower parts of the Spire.', 6000, 1, 1, 2903, 0, 0, 0, NULL, 0, 0, 0),
(2905, 0, 0, 'I will take you up on that offer, Eitrigg.', 5998, 1, 1, 2904, 0, 0, 0, NULL, 0, 0, 0),
(2906, 0, 0, 'Hearthglen?? But...\n', 5996, 1, 1, 2905, 0, 0, 0, NULL, 0, 0, 0),
(2907, 0, 0, 'What do you mean?', 5994, 1, 1, 2906, 0, 0, 0, NULL, 0, 0, 0),
(2908, 0, 0, 'There is only one Warchief, Eitrigg!', 5992, 1, 1, 2907, 0, 0, 0, NULL, 0, 0, 0);
DELETE FROM `gossip_scripts` WHERE `id`=2902;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2902, 0, 7, 4941, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eitrigg - Complete Quest Eitrigg\'s Wisdom');
UPDATE `creature_template` SET `gossip_menu_id`=2901, `script_name`='' WHERE `entry`=3144;

-- Gann Stonespire
UPDATE `gossip_menu` SET `entry`=462 WHERE `entry`=445;
UPDATE `gossip_menu_option` SET `menu_id`=462 WHERE `menu_id`=445;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1530, 9, 1530, 0, 0, 0, 0);
UPDATE `gossip_menu_option` SET `condition_id`=1530 WHERE `menu_id`=462  && `id`=0;
UPDATE `creature_template` SET `gossip_menu_id`=462 WHERE `entry`=3341;

-- Shenthul <Rogue Trainer>
UPDATE `gossip_menu` SET `entry`=521 WHERE `entry`=50199;
UPDATE `gossip_menu_option` SET `menu_id`=521 WHERE `menu_id`=50199;
UPDATE `creature_template` SET `gossip_menu_id`=521 WHERE `entry`=3401;

-- Goblin Pit Crewman
UPDATE `gossip_menu` SET `entry`=282 WHERE `entry`=50142;
UPDATE `gossip_menu_option` SET `menu_id`=282 WHERE `menu_id`=50142;
UPDATE `creature_template` SET `gossip_menu_id`=282 WHERE `entry`=4429;

-- Tawny Grisette <Mushroom Vendor>
UPDATE `gossip_menu` SET `text_id`=8243 WHERE `text_id`=8296 && `entry`=9259;
UPDATE `gossip_menu` SET `entry`=7063 WHERE `entry`=9259;
UPDATE `gossip_menu_option` SET `menu_id`=7063 WHERE `menu_id`=9259;
UPDATE `creature_template` SET `gossip_menu_id`=7063 WHERE `entry`=4554;

-- Spackle Thornberry <Demon Trainer> (and 14 others)
UPDATE `gossip_menu` SET `entry`=4782 WHERE `entry`=4671;
UPDATE `gossip_menu_option` SET `menu_id`=4782 WHERE `menu_id`=4671;
UPDATE `creature_template` SET `gossip_menu_id`=4782 WHERE `gossip_menu_id`=4671;

-- Patrick Garrett
UPDATE `gossip_menu` SET `text_id`=8290 WHERE `text_id`=8298 && `entry`=9409;
UPDATE `gossip_menu` SET `entry`=7017 WHERE `entry`=9409;
UPDATE `gossip_menu_option` SET `menu_id`=7017 WHERE `menu_id`=9409;
UPDATE `creature_template` SET `gossip_menu_id`=7017 WHERE `entry`=5651;

-- Chemist Fuely
UPDATE `gossip_menu` SET `entry`=2501 WHERE `entry`=9539;
UPDATE `gossip_menu_option` SET `menu_id`=2501 WHERE `menu_id`=9539;
UPDATE `creature_template` SET `gossip_menu_id`=2501 WHERE `entry`=10136;

-- Georgia <Bat Handler>
DELETE FROM `gossip_menu` WHERE `entry`=12237;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=12237;
UPDATE `creature_template` SET `gossip_menu_id`=6944 WHERE `entry`=12636;

-- Falthir the Sightless
UPDATE `gossip_menu` SET `entry`=6363 WHERE `entry`=14905;
UPDATE `gossip_menu_option` SET `menu_id`=6363 WHERE `menu_id`=14905;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`) VALUES (6363, 14, 0, 'What are the Paragons of Power?', 10482, 1, 1, 6441, 0, 0, 0, NULL, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6363 WHERE `entry`=14905;

-- Servant of the Hand <Hand of Rastakhan>
UPDATE `gossip_menu` SET `entry`=6518 WHERE `entry`=50157;
UPDATE `gossip_menu_option` SET `menu_id`=6518 WHERE `menu_id`=50157;
UPDATE `creature_template` SET `gossip_menu_id`=6518 WHERE `entry`=15080;

-- Spirit of Azuregos
UPDATE `gossip_menu` SET `entry`=6627 WHERE `entry`=15001;
UPDATE `gossip_menu_option` SET `menu_id`=6627 WHERE `menu_id`=15001;
UPDATE `creature_template` SET `gossip_menu_id`=6627 WHERE `entry`=15481;

-- High Overlord Saurfang
INSERT INTO `gossip_menu` VALUES
(6024, 7174, 7784),
(6024, 7176, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6024 WHERE `entry`=14720;

-- Overlord Runthak
DELETE FROM `gossip_menu` WHERE `entry`=5752;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5752;
DELETE FROM `gossip_menu` WHERE `entry`=5751;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5751;
INSERT INTO `gossip_menu` VALUES
(5751, 6935, 7491),
(5751, 6934, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5751 WHERE `entry`=14392;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
