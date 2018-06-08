DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180513050522');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180513050522');
-- Add your query below.


-- Assign gossip menu for Fallen Hero of the Horde.
-- https://www.youtube.com/watch?v=nTOL6lzTLMs&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=53
-- https://www.youtube.com/watch?v=nTOL6lzTLMs&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=1387
UPDATE `creature_template` SET `gossip_menu_id`=840, `ScriptName`='' WHERE `entry`=7572;

-- Conditions for Fallen Hero of the Horde's gossip menu.
INSERT INTO `conditions` VALUES
(3300, 9, 2784, 0, 0), -- Quest Taken Fall From Grace
(3301, 9, 2801, 0, 0), -- Quest Taken A Tale of Sorrow
(3302, 9, 2702, 0, 0), -- Quest Taken Heroes of Old 1
(3303, 9, 2701, 0, 0), -- Quest Taken Heroes of Old 2
(3304, 19, 2701, 0, 0), -- Quest Available Heroes of Old 2
(3305, 20, 7750, 50, 1), -- Not Creature Nearby Corporal Thund Splithoof
(3306, -2, 3302, 3303, 0), -- Quest Taken Heroes of Old 1 OR Quest Taken Heroes of Old 2
(3307, -2, 3304, 3306, 0), -- Quest Available Heroes of Old 2 OR (Quest Taken Heroes of Old 1 OR Quest Taken Heroes of Old 2)
(3308, -1, 3305, 3307, 0); -- (Quest Available Heroes of Old 2 OR (Quest Taken Heroes of Old 1 OR Quest Taken Heroes of Old 2)) AND Not Creature Nearby Corporal Thund Splithoof

-- Gossip menus for Fallen Hero of the Horde.
INSERT INTO `gossip_menu` VALUES
(840, 1391, 0),
(840, 1451, 3301),
(841, 1392, 0),
(842, 1411, 0),
(880, 1452, 0),
(884, 1453, 0),
(883, 1454, 0),
(882, 1455, 0),
(881, 1456, 0);

-- Gossip options for Fallen Hero of the Horde.
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES
(840, 0, 0, 'Why are you here?', 3582, 1, 1, 841, 0, 0, 0, 0, NULL, 0, 3300),
(841, 0, 0, 'Continue with your story.', 3601, 1, 1, 842, 0, 0, 0, 0, NULL, 0, 0),
(842, 0, 0, 'Tragic...', 3830, 1, 1, -1, 0, 842, 0, 0, NULL, 0, 0),
(840, 1, 0, 'Please continue, Hero...', 3702, 1, 1, 880, 0, 0, 0, 0, NULL, 0, 3301),
(880, 0, 0, 'What could be worse than death?', 3704, 1, 1, 884, 0, 0, 0, 0, NULL, 0, 0),
(884, 0, 0, 'Subordinates?', 3706, 1, 1, 883, 0, 0, 0, 0, NULL, 0, 0),
(883, 0, 0, 'What are the stones of binding?', 3708, 1, 1, 882, 0, 0, 0, 0, NULL, 0, 0),
(882, 0, 0, 'You can count on me, Hero.', 3710, 1, 1, 881, 0, 0, 0, 0, NULL, 0, 0),
(881, 0, 0, 'I shall.', 3841, 1, 1, -1, 0, 881, 0, 0, NULL, 0, 0),
(840, 2, 0, 'Hero, I have urgent business with Corporal Splithoof.', 3763, 1, 1, -1, 0, 840, 0, 0, NULL, 0, 3308);

-- Gossip scripts for Fallen Hero of the Horde.
DELETE FROM `gossip_scripts` WHERE `id`=842;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (842, 0, 7, 2784, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fallen Hero of the Horde - Complete Quest Fall From Grace');
DELETE FROM `gossip_scripts` WHERE `id`=881;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (881, 0, 7, 2801, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fallen Hero of the Horde - Complete Quest A Tale of Sorrow');
DELETE FROM `gossip_scripts` WHERE `id`=840;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (840, 1, 10, 7750, 900000, 1, 50, 0, 0, 0, 0, 4, 0, 6, 1, -10630.3, -2987.05, 28.96, 4.54, 0, 'Fallen Hero of the Horde - Spawn Corporal Thund Splithoof');
DELETE FROM `quest_start_scripts` WHERE `id`=2702;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2702, 1, 10, 7750, 900000, 1, 50, 0, 0, 0, 0, 4, 0, 6, 1, -10630.3, -2987.05, 28.96, 4.54, 0, 'Heroes of Old - Spawn Corporal Thund Splithoof');

-- Heroes of Old 2 should be turned at the chest.
INSERT INTO `gameobject_involvedrelation` VALUES (141980, 2701, 0);
DELETE FROM `creature_involvedrelation` WHERE `quest`=2701;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
