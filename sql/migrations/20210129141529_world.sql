DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210129141529');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210129141529');
-- Add your query below.


-- elwynn
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1291 AND `id` = 5;

-- dun morogh
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1297 AND `id` = 4;

-- teldrassil
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1293 AND `id` = 4;

-- mulgore
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1294 AND `id` = 4;

-- tirisfal
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1296 AND `id` = 5;
INSERT INTO `gossip_menu_option`(`menu_id`, `id`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`) VALUES
(1296, 5, 'What can I do at an inn?', 4308, 1, 1, 1221);

-- durotar
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1290 AND `id` = 5;
INSERT INTO `gossip_menu_option`(`menu_id`, `id`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`) VALUES
(1290, 5, 'What can I do at an inn?', 4308, 1, 1, 1221);

-- fix erelas ambersky broken gossip menu option
UPDATE `gossip_menu_option` SET `action_menu_id` = 1481 WHERE `menu_id` = 1482 AND `id` = 0;

-- fix quest typo for trial of the lake
UPDATE `quest_template` SET `OfferRewardText` = 'Well now. It looks like yet another $r has successfully completed the Trial of the Lake! Well done, my young friend - well done.$B$BAs I\'ve said, my name is Tajarri. It is my duty and my privilege to serve as a warden for Moonglade, and specifically this shrine. Keeper Remulos guides the Cenarion Circle in preservation of nature and balance, and his shrine serves as a lasting tribute to such. By using the bauble here, it serves as a nod to the importance of this place within the Circle.' WHERE `entry` IN (28, 29);

-- Fix Lord Melenas spawn point. (Credit: Trinitycore)
DELETE FROM `creature` WHERE `id` = 2038;
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `health_percent`, `mana_percent`, `patch_max`) VALUES
(1554, 2038, 1, 10107.08, 1206.241, 1311.55, 4.468043, 300, 300, 100, 100, 10),
(1551, 2038, 1, 10127.8, 1202.00, 1323.30, 3.01113, 300, 300, 100, 100, 10),
(1552, 2038, 1, 10127.3, 1125.23, 1338.11, 3.58055, 300, 300, 100, 100, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(108, 1, 'Lord Melenas (2038)', 10);

INSERT INTO `pool_creature` (`guid`, `pool_entry`, `description`) VALUES
(1554, 108, 'Lord Melenas #1'),
(1551, 108, 'Lord Melenas #2'),
(1552, 108, 'Lord Melenas #3');

-- Fix Lady Sathra spawn point. (Credit: Trinitycore)
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `patch_max`) VALUES
(12597, 7319, 1, 10950.3, 1397.79, 1311.63, 2.32941, 300, 300, 5, 100, 100, 1, 10),
(73001, 7319, 1, 10980, 1731.3, 1303.1, 5.14113, 300, 300, 5, 100, 100, 1, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(109, 1, 'Lady Sathra (7319)', 10);

INSERT INTO `pool_creature` (`guid`, `pool_entry`, `description`) VALUES
(12596, 109, 'Lady Sathra #1'),
(12597, 109, 'Lady Sathra #2'),
(73001, 109, 'Lady Sathra #3');

-- remove unused template
DELETE FROM `pool_template` WHERE `entry` = 14223;

-- remove tome of fire blast from kireena
DELETE FROM `npc_vendor` WHERE `entry` = 9636 AND `item` = 8878;

-- q.1191 'Zamek's Distraction'
-- Update End Script
-- Based on TC Script
DELETE FROM `quest_end_scripts` WHERE `id`=1191;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1191, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zamek - Modify Flags');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1191, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zamek - Run');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1191, 1, 60, 2, 0, 0, 0, 0, 0, 0, 0, 0, 4709, 0, 0, 0, 0, 0, 0, 0, 'Zamek - Start Waypoints');

-- Add waypoints and scripts
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `script_id`) VALUES
-- Zamek 4709
(4709, 1, -6237.13, -3911.58, -60.5103, 100, 0, 0),
(4709, 2, -6257.43, -3879.56, -58.8595, 100, 0, 0),
(4709, 3, -6267.61, -3850.91, -58.7503, 100, 0, 0),
(4709, 4, -6266.24, -3846.35, -58.7503, 100, 5000, 470901),
(4709, 5, -6267.61, -3850.91, -58.7503, 100, 0, 0),
(4709, 6, -6257.43, -3879.56, -58.8595, 100, 0, 0),
(4709, 7, -6237.13, -3911.58, -60.5103, 100, 0, 0),
(4709, 8, -6226.13, -3944.94, -58.6251, 100, 1000, 470902),
-- Rizzle Brassbolts 4720
(4720, 1, -6243.39, -3845.91, -58.7498, 100, 2000, 472001),
(4720, 2, -6250.63, -3847.35, -58.7491, 100, 0, 0),
(4720, 3, -6255.06, -3853.64, -58.7491, 100, 0, 0),
(4720, 4, -6262.2,  -3851.84, -58.7491, 100, 0, 0),
(4720, 5, -6266.24, -3846.35, -58.7503, 100, 30000, 472002),
(4720, 6, -6262.2,  -3851.84, -58.7491, 100, 0, 0),
(4720, 7, -6255.06, -3853.64, -58.7491, 100, 0, 0),
(4720, 8, -6250.63, -3847.35, -58.7491, 100, 0, 0),
(4720, 9, -6243.39, -3845.91, -58.7498, 100, 0, 0),
(4720, 10, -6236.99, -3831.23, -58.1364, 100, 1000, 472003);
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (470901, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1540, 0, 0, 0, 0, 0, 0, 0, 0, 'Zamek - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (470901, 3, 9, 20, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zamek - Respawn Gobject');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (470901, 4, 25, 1, 0, 0, 0, 21577, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rizzle Brassbolts - Run');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (470901, 10, 0, 0, 0, 0, 0, 21577, 0, 9, 2, 1541, 0, 0, 0, 0, 0, 0, 0, 0, 'Rizzle Brassbolts - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (470901, 10, 60, 2, 0, 0, 0, 21577, 0, 9, 2, 0, 4720, 0, 0, 0, 0, 0, 0, 0, 'Rizzle Brassbolts - Start Waypoints');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (470902, 1, 4, 147, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zamek - Modify Flags');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (472001, 1, 9, 13621, 42, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rizzle Brassbolts - Respawn Gobject');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (472001, 2, 81, 17087, 41, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rizzle Brassbolts - Despawn Gobject');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (472002, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1542, 0, 0, 0, 0, 0, 0, 0, 0, 'Rizzle Brassbolts - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (472002, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1543, 0, 0, 0, 0, 0, 0, 0, 0, 'Rizzle Brassbolts - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (472003, 0, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.38594, 0, 'Rizzle Brassbolts - Orientation');

-- in case if object despawns before player accept next one
UPDATE `quest_template` SET `RequiredCondition` = 20227 WHERE `entry` = 1191;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES 
(20225, 9, 1190, 0),
(20226, 19, 1194, 0),
(20227, -2, 20226, 20225);

-- Objects
-- Rizzle's Guarded Plans 179888
UPDATE `gameobject_template` SET `flags` = 0 WHERE entry = 179888;
UPDATE `gameobject` SET `spawntimesecsmin` = 45, `spawntimesecsmax` = 45 WHERE `id` = 179888;
DELETE FROM `gossip_menu` WHERE `entry` = 6029;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(6029, 7182);
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6029;
-- Rizzle's Unguarded Plans 20805
UPDATE `gameobject` SET `position_x` = -6236.64, `position_y` = -3830.48, `position_z` = -58.1364, `orientation` = -0.907571, `rotation0` = 0, `rotation1` = 0, `rotation2` = 0.438371, `rotation3` = -0.898794 WHERE `id` = 20805;
-- Explosive Charge 144065 - added
DELETE FROM `gameobject` WHERE `guid` = 20;
INSERT INTO `gameobject` VALUES (20, 144065,1, -6266.46, -3845.4, -58.7498, 0.550892, 0, 0, 0.271976, 0.962304, -5, -5, 255, 1, 0, 0, 0, 10);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
