DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171124181306');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171124181306');
-- Add your query below.


-- Remove static Vaelan spawn. Scarshield Infiltrator turns into Vaelan.
DELETE FROM `creature` WHERE `guid`=42797;
-- Remove npc flags from Vaelan. They are added via his script.
UPDATE `creature_template` SET `npcflag`=0 WHERE `entry`=10296;

-- Move infiltrator from y=-413.32 to y=-399.5 and kneel
UPDATE `creature` SET `position_x`=56.85, `position_y`=-399.5, `position_z`=64.35, `orientation`=3.14, `MovementType`=0 WHERE `guid`=42798;
REPLACE INTO `creature_addon` (`guid`,`patch`,`bytes1`) VALUES (42798, 0, 8);

-- Clean up old stuff
DELETE from `creature_ai_scripts` WHERE `creature_id`=10299;
DELETE FROM `creature_ai_texts` WHERE `entry` IN (-9, -10);
DELETE FROM `event_scripts` WHERE `id`=16037;

-- Trigger event script on LOS
REPLACE INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,
  `event_param1`,`event_param2`,`action1_type`,`action1_param1`,`action2_type`,`action2_param1`,`action2_param2`,`action3_type`,`action3_param1`,`comment`) VALUES
(1029901, 10299, 10, 0, 100, 1, 15, 50, 16037, 11, 16037, 6, 22, 1, 'Scarshield Infiltrator - Trigger Vaelan event on LOS'),
(1029902, 10299, 1, 1, 100, 2000, 2000, 36, 10296, 0, 0, 0, 0, 0, 'Scarshield Infiltrator - Morph into Vaelan (Phase 1)');

-- Event script
REPLACE INTO `event_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`comments`) VALUES
(16037, 0, 28, 0, 0, 0, 'Scarshield Infiltrator - Stand'),
(16037, 0, 15, 16037, 0, 0, 'Scarshield Infiltrator - Cast Mind Probe'),
(16037, 2, 35, 0, 0, 0, 'Scarshield Infiltrator - Face player'),
(16037, 4, 0, 0, 0, 5555, 'Scarshield Infiltrator - Say text 1'),
(16037, 4, 1, 1, 0, 0, 'Scarshield Infiltrator - Say emote 1'),
(16037, 10, 0, 0, 0, 5556, 'Scarshield Infiltrator - Say text 2'),
(16037, 10, 1, 1, 0, 0, 'Scarshield Infiltrator - Say emote 2'),
(16037, 10, 29, 1, 1, 0, 'Scarshield Infiltrator - Set gossip flags');

-- Add gossip menu and script for Vaelan.
-- He should only offer quests if the player has a Unadorned Seal of Ascension.
-- http://db.vanillagaming.org/?quest=4742
-- http://db.vanillagaming.org/?quest=4743
-- https://web.archive.org/web/20071113030159/http://wow.allakhazam.com:80/db/mob.html?wmob=10296
-- https://www.youtube.com/watch?v=75ZluW4Ae-g
UPDATE `creature_template` SET `gossip_menu_id`=12039 WHERE `entry`=10296;
INSERT INTO `conditions` VALUES (63, 2, 12219, 1);
INSERT INTO `conditions` VALUES (64, -3, 63, 0);
INSERT INTO `gossip_menu` VALUES (12039, 3301, 0);
INSERT INTO `gossip_menu` VALUES (12039, 3311, 63);
INSERT INTO `gossip_menu` VALUES (12040, 3302, 0);
INSERT INTO `gossip_menu` VALUES (12041, 3303, 0);
INSERT INTO `gossip_menu` VALUES (12042, 3304, 0);
INSERT INTO `gossip_menu` VALUES (12043, 3305, 0);
INSERT INTO `gossip_menu` VALUES (12044, 3306, 0);
INSERT INTO `gossip_menu` VALUES (12045, 3307, 0);
INSERT INTO `gossip_menu` VALUES (12046, 3308, 0);
INSERT INTO `gossip_menu` VALUES (12047, 3309, 0);
INSERT INTO `gossip_menu` VALUES (12048, 3310, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (12039, 0, 0, 'Your kind?', 1, 1, 12040, 0, 0, 0, 0, NULL, 64);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (12039, 1, 0, 'As you wish, Vaelan.', 1, 1, -1, 0, 10296, 0, 0, '', 63);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (12040, 0, 0, 'Please.', 1, 1, 12041, 0, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (12041, 0, 0, 'No, Vaelan, I do not.', 1, 1, 12042, 0, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (12042, 0, 0, 'Demon Soul?', 1, 1, 12043, 0, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (12043, 0, 0, 'Where he left off?', 1, 1, 12044, 0, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (12044, 0, 0, 'Why not destroy them with the combined might of the Aspects?', 1, 1, 12045, 0, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (12045, 0, 0, 'Unless?', 1, 1, 12046, 0, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (12046, 0, 0, 'I am willing to try but I will require instruction.', 1, 1, 12047, 0, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (12047, 0, 0, 'I will do my best, Vaelan.', 1, 1, 12048, 0, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (12048, 0, 0, 'It will be done.', 1, 1, -1, 0, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (10296, 0, 29, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vaelan - Remove Gossip Flag');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (10296, 2, 15, 16051, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vaelan - Cast Barrier of Light');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (10296, 2, 0, 0, 0, 0, 0, 0, 5590, 0, 0, 0, 0, 0, 0, 0, 'Vaelan - Say Text 1 (emoted)');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (10296, 6, 0, 0, 0, 0, 0, 0, 5591, 0, 0, 0, 0, 0, 0, 0, 'Vaelan - Say Text 2');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (10296, 6, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vaelan - Emote Talk');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (10296, 10, 29, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vaelan - Add Questgiver Flag');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
