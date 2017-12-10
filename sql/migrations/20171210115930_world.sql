DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171210115930');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171210115930');
-- Add your query below.


-- Test of Faith (1149)
-- https://youtu.be/_QI3SbSWQ3M?t=17s
-- https://youtu.be/_QI3SbSWQ3M?t=54s
UPDATE `quest_template` SET `SrcSpell`=0, `DetailsEmote1`=1, `DetailsEmote2`=1, `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmote3`=1 WHERE `entry`=1149;
DELETE FROM `quest_start_scripts` WHERE `id`=1149;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (1149, 1, 0, 0, 0, 0, 0, 0, 1589, 0, 0, 0, 0, 0, 0, 0, 'Dorn Plainstalker - Say Text 1');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (1149, 1, 15, 6716, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dorn Plainstalker - Cast Test of Faith');

-- Test of Endurance (1150)
-- https://youtu.be/_QI3SbSWQ3M?t=1m4s
-- https://youtu.be/_QI3SbSWQ3M?t=1m49s
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1, `CompleteEmote`=0, `OfferRewardEmote1`=1, `OfferRewardEmote2`=1 WHERE `entry`=1150;

-- Test of Strength (1151)
-- https://youtu.be/_QI3SbSWQ3M?t=2m5s
-- https://youtu.be/_QI3SbSWQ3M?t=2m48s
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1, `CompleteEmote`=0, `OfferRewardEmote1`=1, `OfferRewardEmote2`=1 WHERE `entry`=1151;
UPDATE `creature` SET `position_x`=-5058.492, `position_y`=-1175.391, `position_z`=-56.581, `orientation`=5, `spawndist`=10, `MovementType`=1 WHERE `guid`=21591;

-- Test of Lore (1152)
-- https://youtu.be/_QI3SbSWQ3M?t=3m
-- https://youtu.be/_QI3SbSWQ3M?t=3m31s
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1, `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmote3`=1 WHERE `entry`=1152;

-- Test of Lore (1154)
-- https://youtu.be/_QI3SbSWQ3M?t=3m47s
-- https://youtu.be/_QI3SbSWQ3M?t=4m39s
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1, `OfferRewardEmote1`=1, `OfferRewardEmote2`=1 WHERE `entry`=1154;

-- Test of Lore (6627)
-- https://youtu.be/_QI3SbSWQ3M?t=4m49s
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `OfferRewardEmote1`=4, `OfferRewardEmote2`=1 WHERE `entry`=6627;
UPDATE `creature_template` SET `gossip_menu_id`=4763, `ScriptName`='' WHERE `entry`=4489;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (6627, 9, 6627, 0);
INSERT INTO `gossip_menu` VALUES (4763, 5819, 0);
INSERT INTO `gossip_menu` VALUES (4763, 5820, 6627);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4763, 0, 0, 'Ysera is my answer.', 8381, 1, 1, -1, 0, 71, 0, 0, '', 0, 6627);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4763, 1, 0, 'Neltharion is  my answer.', 8383, 1, 1, -1, 0, 72, 0, 0, '', 0, 6627);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4763, 2, 0, 'Alexstrasza is  my answer.', 8384, 1, 1, -1, 0, 71, 0, 0, '', 0, 6627);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4763, 3, 0, 'Malygos is my answer.', 8385, 1, 1, -1, 0, 71, 0, 0, '', 0, 6627);

-- Wrong Answer
DELETE FROM `gossip_scripts` WHERE `id`=71;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(71, 0, 29, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Wrong Answer - Braug Dimspirit Remove Gossip Flag'),
(71, 1, 0, 0, 0, 0, 0, 0, 8393, 0, 0, 0, 0, 0, 0, 0, 'Wrong Answer - Braug Dimspirit Say Text 2'),
(71, 1, 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Wrong Answer - Braug Dimspirit Emote Yell'),
(71, 3, 15, 6766, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Wrong Answer - Braug Dimspirit Cast Test of Lore'),
(71, 6, 29, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Wrong Answer - Braug Dimspirit Add Gossip Flag');

-- Correct Answer
DELETE FROM `gossip_scripts` WHERE `id`=72;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(72, 0, 7, 6627, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Correct Answer - Complete quest Test of Lore');

-- Test of Lore (1159)
-- https://youtu.be/_QI3SbSWQ3M?t=5m32s
-- https://youtu.be/_QI3SbSWQ3M?t=6m2s
UPDATE `quest_template` SET `DetailsEmote1`=21, `DetailsEmote2`=1, `DetailsEmote3`=1, `OfferRewardEmote1`=6, `OfferRewardEmote2`=1, `OfferRewardEmote3`=1 WHERE `entry`=1159;

-- Test of Lore (1160)
-- https://youtu.be/_QI3SbSWQ3M?t=6m24s
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1 WHERE `entry`=1160;

-- Test of Lore (6628)
-- https://youtu.be/_QI3SbSWQ3M?t=7m3s
-- https://youtu.be/_QI3SbSWQ3M?t=8m5s
UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=6628;
UPDATE `creature_template` SET `gossip_menu_id`=4764, `ScriptName`='' WHERE `entry`=4488;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (6628, 9, 6628, 0);
INSERT INTO `gossip_menu` VALUES (4764, 5821, 0);
INSERT INTO `gossip_menu` VALUES (4764, 5822, 6628);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4764, 0, 0, 'Kel\'Thuzad is my answer.', 8377, 1, 1, -1, 0, 73, 0, 0, '', 0, 6628);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4764, 1, 0, 'Gul\'dan is my answer.', 8378, 1, 1, -1, 0, 73, 0, 0, '', 0, 6628);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4764, 2, 0, 'Ner\'zhul is my answer.', 8380, 1, 1, -1, 0, 74, 0, 0, '', 0, 6628);

-- Wrong Answer
DELETE FROM `gossip_scripts` WHERE `id`=73;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(73, 0, 0, 0, 0, 0, 0, 0, 8394, 0, 0, 0, 0, 0, 0, 0, 'Wrong Answer - Parqual Fintallas Say Text 1'),
(73, 0, 15, 6767, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Wrong Answer - Parqual Fintallas Cast Mark of Shame');

-- Correct Answer
DELETE FROM `gossip_scripts` WHERE `id`=74;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(74, 0, 0, 0, 0, 0, 0, 0, 1608, 0, 0, 0, 0, 0, 0, 0, 'Correct Answer - Parqual Fintallas Say Text 1'),
(74, 0, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Correct Answer - Parqual Fintallas Emote Bow'),
(74, 0, 7, 6628, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Correct Answer - Complete quest Test of Lore');

-- Final Passage (1394)
-- https://youtu.be/_QI3SbSWQ3M?t=8m9s
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1, `OfferRewardEmote1`=1, `OfferRewardEmote2`=1 WHERE `entry`=1394;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
