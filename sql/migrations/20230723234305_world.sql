DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230723234305');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230723234305');
-- Add your query below.


-- Gremnik Rizzlesprang
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (222222, 16123, 0, 0, 0, 0, 0, -14456.8, 448.044, 20.4907, 0.0174533, 120, 120, 0, 100, 100, 0, 0, 0, 8, 10);
UPDATE `creature_template` SET `level_min`=60, `level_max`=60, `gossip_menu_id`=7092, `npc_flags`=1, `auras`='27978 27614', `flags_extra`=(64 | 524288) WHERE `entry`=16123;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (7092, 8345);
INSERT INTO `npc_text` (`ID`, `Probability0`, `BroadcastTextID0`) VALUES (8345, 1, 11932);

-- Bodley
UPDATE `creature` SET `position_x`=-7535.76, `position_y`=-1211.09, `position_z`=285.555, `orientation`=5.27089 WHERE `id`=16033;
UPDATE `creature_template` SET `gossip_menu_id`=7044, `base_attack_time`=2000, `auras`='27978 27614', `flags_extra`=(64 | 524288) WHERE `entry`=16033;
UPDATE `npc_text` SET `ID`=8271 WHERE `ID`=50002;
UPDATE `gossip_menu` SET `text_id`=8271 WHERE `text_id`=50002;
UPDATE `gossip_menu` SET `entry`=7044 WHERE `entry`=57006;
UPDATE `gossip_menu_option` SET `menu_id`=7044 WHERE `menu_id`=57006;
UPDATE `gossip_menu_option` SET `action_menu_id`=7044 WHERE `action_menu_id`=57006;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`) VALUES (7044, 3, 0, 'Bodley, tell me what\'s going on.', 11915, 1, 1, 7087, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (7087, 8338);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`) VALUES (7087, 0, 0, 'You were telling me about The Veiled Blade and how you took the wrong mission.', 11917, 1, 1, 7086, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (7086, 8339);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`) VALUES (7086, 0, 0, 'No, no, please continue... it\'s just that the air up here is so, um, smoky.', 11919, 1, 1, 7085, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (7085, 8340);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`) VALUES (7085, 0, 0, 'Please continue, Bodley.', 11921, 1, 1, 7090, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (7090, 8341);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`) VALUES (7090, 0, 0, 'I thought you were almost done?', 11923, 1, 1, 7089, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (7089, 8342);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`) VALUES (7089, 0, 0, 'What happened to your mercenary company, The Veiled Blade?', 11925, 1, 1, 7088, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (7088, 8343);
INSERT INTO `npc_text` (`ID`, `Probability0`, `BroadcastTextID0`) VALUES (8338, 1, 11916);
INSERT INTO `npc_text` (`ID`, `Probability0`, `BroadcastTextID0`) VALUES (8339, 1, 11918);
INSERT INTO `npc_text` (`ID`, `Probability0`, `BroadcastTextID0`) VALUES (8340, 1, 11920);
INSERT INTO `npc_text` (`ID`, `Probability0`, `BroadcastTextID0`) VALUES (8341, 1, 11922);
INSERT INTO `npc_text` (`ID`, `Probability0`, `BroadcastTextID0`) VALUES (8342, 1, 11924);
INSERT INTO `npc_text` (`ID`, `Probability0`, `BroadcastTextID0`) VALUES (8343, 1, 11926);

-- Mux Manascrambler
UPDATE `gossip_menu_option` SET `id`=2 WHERE `menu_id`=7083 && `id`=0 && `option_broadcast_text`=11909;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
