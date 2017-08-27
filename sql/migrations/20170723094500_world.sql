INSERT INTO `migrations` VALUES ('20170723094500');

-- Add missing npc Saean(npc_id:1380) spawn for quest 273 and its quest event.
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES
 ('100000', '1380', '0', '0', '0', '-5760.73', '-3437.71', '305.54', '2.41', '300', '0', '0', '550', '0', '0', '0', '0');

-- Quest is triggered by area-trigger script.
INSERT INTO `scripted_areatrigger` VALUES ('171', 'at_huldar_miran');
UPDATE `quest_template` SET `SpecialFlags` = 2 WHERE `entry` = 273;

-- Add equipment and script data for Saean.
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES (105000, 1909, 2053, 0);
UPDATE `creature_template` SET `equipment_id` = 105000, `ScriptName` = 'npc_saean' WHERE `entry` = 1380;

-- Add equipment for Dark Iron Ambusher.
UPDATE `creature_template` SET `equipment_id` = 730 WHERE `entry` = 1981;

-- Add gossip text for Huldar.
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4322, 5494, 0);
UPDATE `creature_template` SET `gossip_menu_id` = 4322 WHERE `entry` = 2057;
