DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210510125413');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210510125413');
-- Add your query below.


-- Stone Watcher of Norgannon, should be only spawned by script.
DELETE FROM `creature` WHERE `guid` = 301766;
DELETE FROM `quest_end_scripts` WHERE `id`=2966;
DELETE FROM `quest_end_scripts` WHERE `id`=2946;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2966, 5, 10, 7918, 900000, 1, 10, 0, 0, 0, 0, 8, 0, -1, 1, -9619.05, -2814.95, 11.2104, 0.20944, 0, 'Seeing What Happens: Summon Stone Watcher of Norgannon');
UPDATE `quest_template` SET `CompleteScript` = 2966 WHERE `entry` = 2946;

-- Lore Keeper of Norgannon, should only be spawned by script.
UPDATE `creature_template` SET `ai_name` = 'EventAI', script_name = '', gossip_menu_id = 562 WHERE `entry` = 7172;
DELETE FROM `creature` WHERE `guid` = 301706;
DELETE FROM `quest_start_scripts` WHERE `id`=2278;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2278, 0, 10, 7172, 900000, 1, 30, 0, 0, 0, 0, 8, 0, -1, 1, 148.657, 309.864, -52.1173, 5.23599, 0, 'The Platinum Discs: Summon Lore Keeper of Norgannon');
DELETE FROM `quest_end_scripts` WHERE `id`=2278;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2278, 0, 0, 0, 0, 0, 0, 7172, 20, 8, 2, 3743, 0, 0, 0, 0, 0, 0, 0, 0, 'The Platimum Discs: Lore Keeper of Norgannon - Yell Text');
UPDATE `quest_template` SET `StartScript` = 2278, `CompleteScript` = 2278 WHERE `entry` = 2278;

-- Events list for Lore Keeper of Norgannon
DELETE FROM `creature_ai_events` WHERE `creature_id`=7172;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (717201, 7172, 0, 11, 0, 100, 0, 0, 0, 0, 0, 717201, 0, 0, 'Lore Keeper of Norgannon - Yell Text on Spawn');

DELETE FROM `creature_ai_scripts` WHERE `id`=717201;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (717201, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3308, 0, 0, 0, 0, 0, 0, 0, 0, 'Lore Keeper of Norgannon - Say Text');

UPDATE `broadcast_text` SET `chat_type` = 1 WHERE `entry` IN (3308, 3743);

INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (561, 1080);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (562, 1079);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (563, 1081);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (564, 1082);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (565, 1083);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (566, 1084);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (567, 1085);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (568, 1086);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (569, 1087);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (570, 1088);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (571, 1089);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (572, 1090);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (573, 1091);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (574, 1092);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (575, 1093);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (576, 1094);
INSERT INTO `gossip_menu_option` VALUES
(561,0,0,'What is a \"subterranean being matrix\"?',3189,1,1,563,0,0,0,0,NULL,0,0),
(562,0,0,'Who are the Earthen?',3188,1,1,561,0,0,0,0,NULL,0,0),
(563,0,0,'What are the anomalies you speak of?',3190,1,1,564,0,0,0,0,NULL,0,0),
(564,0,0,'What is a \"resilient foundation of construction\"?',3191,1,1,565,0,0,0,0,NULL,0,0),
(565,0,0,'So... the Earthen were made out of stone?',3192,1,1,566,0,0,0,0,NULL,0,0),
(566,0,0,'Anything else I should know about the Earthen?',3193,1,1,567,0,0,0,0,NULL,0,0),
(567,0,0,'I think I understand the Creators\' design intent for the Earthen now.  What are the Earthen\'s anomalies that you spoke of earlier?',3194,1,1,568,0,0,0,0,NULL,0,0),
(568,0,0,'What high-stress environments would cause the Earthen to destabilize?',3195,1,1,569,0,0,0,0,NULL,0,0),
(569,0,0,'What happens when the Earthen destabilize?',3196,1,1,570,0,569,0,0,NULL,0,0),
(570,0,0,'Troggs?!  Are the troggs you mention the same as the ones in the world today?',3197,1,1,571,0,0,0,0,NULL,0,0),
(571,0,0,'You mentioned two results when the Earthen destabilize.  What is the second?',3198,1,1,572,0,571,0,0,NULL,0,0),
(572,0,0,'Dwarves!!!  Now you\'re telling me that dwarves originally came from the Earthen?!',3199,1,1,573,0,0,0,0,NULL,0,0),
(573,0,0,'These dwarves are the same ones today, yes?  Do dwarves maintain any other links to the Earthen?',3200,1,1,574,0,0,0,0,NULL,0,0),
(574,0,0,'Who are the Creators?',3201,1,1,575,0,0,0,0,NULL,0,0),
(575,0,0,'This is a lot to think about.',3202,1,1,576,0,575,0,0,NULL,0,0),
(576,0,0,'I will access the discs now.',3221,1,1,-1,0,576,0,0,NULL,0,0);

DELETE FROM `gossip_scripts` WHERE `id`=569;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (569, 0, 87, 0, 0, 0, 0, 170353, 10, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lore Keeper of Norgannon - Deactivate Dwarf Hologram');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (569, 0, 13, 0, 0, 0, 0, 142488, 10, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lore Keeper of Norgannon - Activate Trogg Hologram');
DELETE FROM `gossip_scripts` WHERE `id`=571;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (571, 0, 87, 0, 0, 0, 0, 142488, 10, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lore Keeper of Norgannon - Deactivate Trogg Hologram');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (571, 0, 13, 0, 0, 0, 0, 170353, 10, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lore Keeper of Norgannon - Activate Dwarf Hologram');
DELETE FROM `gossip_scripts` WHERE `id`=576;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (576, 0, 7, 2278, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lore Keeper of Norgannon - Complete Quest 2278');
DELETE FROM `gossip_scripts` WHERE `id`=575;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (575, 0, 87, 0, 0, 0, 0, 170353, 10, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lore Keeper of Norgannon - Deactivate Dwarf Hologram');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
