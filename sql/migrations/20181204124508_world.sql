DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181204124508');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181204124508');
-- Add your query below.


-- Blacksmithing Trainers
DELETE FROM `npc_gossip` WHERE `npc_guid` IN (2010, 2029, 2030, 3428, 3429, 3430, 42296, 42297, 42298);
UPDATE `npc_text` SET `BroadcastTextID0`=6498 WHERE `ID`=3959;
UPDATE `npc_text` SET `BroadcastTextID0`=6502 WHERE `ID`=3961;
INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`) VALUES (7244, 9984, 1);
INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`) VALUES (7246, 9987, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
-- Blacksmithing
(1350, 7, 164, 225, 0, 0, 0),
(1351, 7, 164, 250, 0, 0, 0),
-- Weaponsmith
(1352, 17, 9787, 0, 0, 0, 0),
-- Not an Weaponsmith
(1353, 17, 9787, 1, 0, 0, 0),
-- Armorsmith
(1354, 17, 9788, 0, 0, 0, 0),
-- Not an Armorsmith
(1355, 17, 9788, 1, 0, 0, 0),
-- Not specialized
(1356, -1, 1353, 1355, 0, 0, 0),
-- Not specialized and 225 BS
(1357, -1, 1350, 1356, 0, 0, 0),
-- Level > 49 && BS 250
(1358, -1, 435, 1351, 0, 0, 0),
-- Weaponsmith && Level > 59 && BS 250
(1359, -1, 1352, 1358, 0, 0, 0),
-- Not Hammersmith
(1360, 17, 17040, 1, 0, 0, 0),
-- Not Axesmith
(1361, 17, 17041, 1, 0, 0, 0),
-- Not Swordsmith
(1362, 17, 17039, 1, 0, 0, 0),
-- Not Hammersmith && Not Axesmith
(1363, -1, 1360, 1361, 0, 0, 0),
-- Not Hammersmith && Not Axesmith && Not Swordsmith
(1364, -1, 1362, 1363, 0, 0, 0),
-- Weaponsmith && Level > 49 && BS 250 && Not Hammersmith && Not Axesmith && Not Swordsmith
(1365, -1, 1359, 1364, 0, 0, 0);
DELETE FROM `gossip_menu` WHERE `entry` IN (597, 3182, 3201, 3187, 3203, 3202, 6090, 6089, 6091, 9484);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
-- Grumnus Steelshaper
(597, 1135, 0),
(597, 1136, 1357),
(597, 1633, 1354),
-- Shayis Steelfury
(1043, 1640, 0),
(1043, 1641, 1354),
-- Myolor Sunderfury
(3182, 3937, 0),
(3182, 3938, 1357),
-- Krathok Moltenfist
(3187, 3954, 0),
(3187, 3953, 1357),
-- Ironus Coldsteel
(3201, 3959, 0),
-- Borgosh Corebender
(3202, 3960, 0),
-- Okothos Ironrager
(3203, 3961, 0),
-- Kilram
(6089, 7243, 0),
(6089, 7244, 1359),
-- Lilith the Lithe
(6090, 7245, 0),
(6090, 7246, 1359),
-- Seril Scourgebane
(6091, 7247, 0),
(6091, 7248, 1359);
DELETE FROM `gossip_scripts` WHERE `id`=318201;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (318201, 0, 15, 9790, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1357, 'Cast Artisan Armorsmith');
DELETE FROM `gossip_scripts` WHERE `id`=318202;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (318202, 0, 15, 9789, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1357, 'Cast Artisan Weaponsmith');
DELETE FROM `gossip_scripts` WHERE `id`=608901;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (608901, 0, 15, 17043, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1365, 'Cast Spell Master Axesmith');
DELETE FROM `gossip_scripts` WHERE `id`=609001;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (609001, 0, 15, 17044, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1365, 'Cast Spell Master Hammersmith');
DELETE FROM `gossip_scripts` WHERE `id`=609101;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (609101, 0, 15, 17042, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1365, 'Cast Spell Master Swordsmith');
-- Grumnus Steelshaper
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`) VALUES (597, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, '', 0);
-- Myolor Sunderfury
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (3182, 0, 0, 'I wish to become an armorsmith.', 6476, 1, 1, -1, 0, 318201, 0, 0, '', 0, 1357);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (3182, 1, 0, 'I wish to become a weaponsmith.', 6477, 1, 1, -1, 0, 318202, 0, 0, '', 0, 1357);
-- Krathok Moltenfist
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (3187, 0, 0, 'I wish to become an armorsmith.', 6476, 1, 1, -1, 0, 318201, 0, 0, '', 0, 1357);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (3187, 1, 0, 'I wish to become a weaponsmith.', 6477, 1, 1, -1, 0, 318202, 0, 0, '', 0, 1357);
-- Ironus Coldsteel
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`) VALUES (3201, 0, 3, 'I require training.', 6499, 5, 16, 0, 0, 0, 0, '', 0);
-- Borgosh Corebender
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`) VALUES (3202, 0, 3, 'I require training.', 6501, 5, 16, 0, 0, 0, 0, '', 0);
-- Okothos Ironrager
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`) VALUES (3203, 0, 3, 'I require training.', 6503, 5, 16, 0, 0, 0, 0, '', 0);
-- Kilram
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6089, 0, 0, 'Please teach me how to become an axesmith, Kilram.', 9985, 1, 1, -1, 0, 608901, 0, 0, '', 0, 1365);
-- Lilith the Lithe
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6090, 0, 0, 'Please teach me how to become a hammersmith, Lilith.', 9988, 1, 1, -1, 0, 609001, 0, 0, '', 0, 1365);
-- Seril Scourgebane
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6091, 0, 0, 'Please teach me how to become a swordsmith, Seril.', 9991, 1, 1, -1, 0, 609101, 0, 0, '', 0, 1365);
-- Shayis Steelfury
UPDATE `gossip_menu_option` SET `menu_id`=1043 WHERE `menu_id`=9484;
UPDATE `creature_template` SET `ScriptName`='', `gossip_menu_id`=597 WHERE `entry`=5164;
UPDATE `creature_template` SET `ScriptName`='', `gossip_menu_id`=1043 WHERE `entry`=7230;
UPDATE `creature_template` SET `ScriptName`='', `gossip_menu_id`=3182 WHERE `entry`=11145;
UPDATE `creature_template` SET `ScriptName`='', `gossip_menu_id`=3201 WHERE `entry`=11146;
UPDATE `creature_template` SET `ScriptName`='', `gossip_menu_id`=3187 WHERE `entry`=11176;
UPDATE `creature_template` SET `ScriptName`='', `gossip_menu_id`=3203 WHERE `entry`=11177;
UPDATE `creature_template` SET `ScriptName`='', `gossip_menu_id`=3202 WHERE `entry`=11178;
UPDATE `creature_template` SET `ScriptName`='', `gossip_menu_id`=6090 WHERE `entry`=11191;
UPDATE `creature_template` SET `ScriptName`='', `gossip_menu_id`=6089 WHERE `entry`=11192;
UPDATE `creature_template` SET `ScriptName`='', `gossip_menu_id`=6091 WHERE `entry`=11193;

-- Engineering Trainers
DELETE FROM `npc_gossip` WHERE `npc_guid` IN (23281, 42209);
UPDATE `creature_template` SET `ScriptName`='', `gossip_menu_id`=6092 WHERE `entry`=14742;
UPDATE `creature_template` SET `ScriptName`='', `gossip_menu_id`=6094 WHERE `entry`=14743;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
-- Engineering
(1366, 7, 202, 260, 0, 0, 0),
-- Goblin Engineering
(1367, 17, 20222, 0, 0, 0, 0),
-- Gnomish Engineering
(1368, 17, 20219, 0, 0, 0, 0),
-- Not Have Teleport to Everlook
(1369, 17, 23486, 1, 0, 0, 0),
-- Not Have Teleport to Gadgetzan
(1370, 17, 23489, 1, 0, 0, 0),
-- Has Item Goblin Engineer Membership Card
(1371, 2, 10791, 1, 0, 0, 0),
-- Has Item Gnome Engineer Membership Card
(1374, 2, 10790, 1, 0, 0, 0),
-- 260 Goblin Engineer
(1375, -1, 1366, 1367, 0, 0, 0),
-- Not Have Teleport to Everlook && Has Item Goblin Engineer Membership Card
(1376, -1, 1369, 1371, 0, 0, 0),
-- 260 Goblin Engineer && Not Have Teleport to Everlook && Has Item Goblin Engineer Membership Card
(1377, -1, 1375, 1376, 0, 0, 0),
-- Not Have Teleport to Gadgetzan && Has Item Gnome Engineer Membership Card
(1378, -1, 1370, 1374, 0, 0, 0),
-- 260 Gnomish Engineer
(1379, -1, 1366, 1368, 0, 0, 0),
-- 260 Gnomish Engineer && Not Have Teleport to Gadgetzan && Has Item Gnome Engineer Membership Card
(1380, -1, 1379, 1378, 0, 0, 0),
-- Have Teleport to Everlook
(1381, 17, 23486, 0, 0, 0, 0),
-- Have Teleport to Gadgetzan
(1382, 17, 23489, 0, 0, 0, 0);
INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`) VALUES (7254, 10000, 1);
DELETE FROM `gossip_scripts` WHERE `id`=6092;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (6092, 0, 15, 23490, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1377, 'Cast Spell Dimension Ripper - Everlook');
DELETE FROM `gossip_scripts` WHERE `id`=6094;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (6094, 0, 15, 23491, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1380, 'Cast Spell Ultrasafe Transporter: Gadgetzan');
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6093, 7250, 0),
(6095, 7252, 0),
(6092, 7254, 1381),
(6094, 7253, 1382);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6092, 0, 0, 'This Dimensional Imploder sounds dangerous! How can I make one?', 9994, 1, 1, 6093, 0, 6092, 0, 0, '', 0, 1377);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6094, 0, 0, 'I must build a beacon for this marvelous device!', 9997, 1, 1, 6095, 0, 6094, 0, 0, '', 0, 1380);

-- Leatherworking Trainers
DELETE FROM `npc_gossip` WHERE `npc_guid` IN (5567, 35885, 51231);
UPDATE `creature_template` SET `ScriptName`='', `gossip_menu_id`=3067 WHERE `entry`=7866;
UPDATE `creature_template` SET `ScriptName`='', `gossip_menu_id`=3070 WHERE `entry`=7868;
UPDATE `creature_template` SET `ScriptName`='', `gossip_menu_id`=3072 WHERE `entry`=7870;
UPDATE `creature_template` SET `ScriptName`='' WHERE `entry` IN (7867, 7869, 7871);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(3067, 3801, 0),
(3070, 3804, 0),
(3072, 3805, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
