DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171120021353');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171120021353');
-- Add your query below.

-- fix Maraudon scepter activate object
DELETE FROM `spell_script_target` WHERE `entry`=21127;
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES (21127,0,178386);

-- remove party flag from 7046: The Scepter of Celebras
UPDATE `quest_template` SET `QuestFlags`=0 WHERE `entry`=7046;

-- add missing npc text
DELETE FROM `npc_text` WHERE `ID`=6374;
INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`) VALUES (6374, 8927, 1);

-- Add gossip and spawn for 13716: Celebras the Redeemed
UPDATE `creature_template` SET `gossip_menu_id`=5349, `npcflag`=3 WHERE `entry`=13716;
DELETE FROM `creature` WHERE `guid`=55105;
INSERT INTO `creature` (`guid`,`id`,`map`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`,`spawnFlags`) VALUES
(55105,13716,349,0,0,726.106,77.9764,-86.5913,6.0,60,0,0,6602,0,0,0,1);

-- set instance script for Maraudon
UPDATE `map_template` SET `ScriptName`='instance_maraudon' WHERE `entry`=349;

-- Gossip for Celebras the Redeemed
DELETE FROM `gossip_menu` WHERE `entry` BETWEEN 5349 AND 5358;
DELETE FROM `gossip_menu_option` WHERE `menu_id` BETWEEN 5349 AND 5358;
DELETE FROM `conditions` WHERE `condition_entry` BETWEEN 53490 AND 53509;
DELETE FROM `gossip_scripts` WHERE id=53500;

-- Default
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (5349, 6354, 0);

-- 7046 is available
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (53490, 19, 7046, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (5349, 6375, 53490);

-- 7046 is completed or rewarded
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (53491, 9, 7046, 2);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (53492, 8, 7046, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (53493, -2, 53491, 53492);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (5349, 6373, 53493);

-- Lost scepter
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (53500, 24, 17191, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (53501, -1, 53492, 53500);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_script_id`, `condition_id`) VALUES (5349, 0, 0, 'Celebras, I lost my Scepter...', 1, 1, 5350, 53500, 53501);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (5350, 6374, 0);
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `comments`) VALUES (53500, 3, 15, 21939, 0, 'Celebras the Redeemed: Create Scepter of Celebras');

-- 7044 is incomplete
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (53502, 9, 7044, 1);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `condition_id`) VALUES (5349, 1, 0, 'How can I find the two parts of your scepter?', 1, 1, 5351, 53502);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (5351, 6384, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`) VALUES (5351, 0, 0, 'Why didn\'t Lord Vyletongue unite both parts of the scepter into one?', 1, 1, 5358);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (5358, 6385, 0);

-- 7046 is rewarded
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `condition_id`) VALUES (5349, 2, 0, 'Please explain how the scepter works.', 1, 1, 5352, 53492);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (5352, 6377, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`) VALUES (5352, 0, 0, 'I don\'t quite understand...', 1, 1, 5353);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (5353, 6378, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`) VALUES (5353, 0, 0, 'No, really, I still don\'t understand...', 1, 1, 5354);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (5354, 6379, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `condition_id`) VALUES (5349, 3, 0, 'Please tell me more about Maraudon.', 1, 1, 5355, 53492);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (5355, 6380, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`) VALUES (5355, 3, 0, 'Please tell me more about Zaetar.', 1, 1, 5356);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (5356, 6381, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`) VALUES (5356, 3, 0, 'Tell me more about the history of Remulos and Zaetar.', 1, 1, 5357);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (5357, 6393, 0);

-- Move waypoint wait times from script to DB for celebras_spirit script
UPDATE `script_waypoint` SET `waittime`=8000 WHERE `entry`=13716 AND `pointid`=1;
UPDATE `script_waypoint` SET `waittime`=4000 WHERE `entry`=13716 AND `pointid`=5;
UPDATE `script_waypoint` SET `waittime`=3000 WHERE `entry`=13716 AND `pointid`=9;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
