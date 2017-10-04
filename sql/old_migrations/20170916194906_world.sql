INSERT INTO `migrations` VALUES ('20170916194906'); 

-- Add gossip to Sten Stoutarm.
INSERT INTO `gossip_menu` VALUES (4047, 4937, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4047, `npcflag`=3 WHERE `entry`=658;

-- Add gossip to Sloan McCoy.
INSERT INTO `gossip_menu` VALUES (705, 1257, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (705, 0, 1, 'I want to browse your goods.', 3, 4, 0, 0, 0, 0, 0, NULL, 0);
UPDATE `creature_template` SET `gossip_menu_id`=705, `npcflag`=5 WHERE `entry`=1326;

-- Add gossip to Tog Rustsprocket.
INSERT INTO `gossip_menu` VALUES (268, 766, 0);
UPDATE `creature_template` SET `gossip_menu_id`=268 WHERE `entry`=6119;

-- Add gossip to Kalin Windflight.
INSERT INTO `gossip_menu` VALUES (1422, 2054, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (1422, 0, 1, 'Can you help me get down?', 3, 4, 0, 0, 0, 0, 0, '', 0);
UPDATE `creature_template` SET `gossip_menu_id`=1422, `npcflag`=7 WHERE `entry`=7772;

-- Add gossip to Vethsera.
INSERT INTO `gossip_menu` VALUES (6655, 7911, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6655, `npcflag`=3 WHERE `entry`=15504;

-- Assign gossip to Gerik Koen.
UPDATE `creature_template` SET `gossip_menu_id`=688, `npcflag`=16389 WHERE `entry`=1333;

-- Assign gossip to Baritanas Skyriver.
UPDATE `creature_template` SET `gossip_menu_id`=6944 WHERE `entry`=6706;

-- Assign gossip to Thalon.
UPDATE `creature_template` SET `gossip_menu_id`=6944 WHERE `entry`=6726;

-- Add gossip flag to Kandrostrasz.
UPDATE `creature_template` SET `npcflag`=3 WHERE `entry`=15503;

-- Add gossip flag to Farmer Saldean.
UPDATE `creature_template` SET `npcflag`=7 WHERE `entry`=233;

-- Fix startup error.
-- ERROR:Table `creature` have creature (GUID: 100170 Entry: 2683) with `MovementType`=0 (idle) have `spawndist`<>0, set to 0.
UPDATE `creature` SET `spawndist`=0 WHERE `guid`=100170;
