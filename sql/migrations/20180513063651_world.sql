DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180513063651');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180513063651');
-- Add your query below.


-- Gossip menu for Deathly Usher.
-- https://www.youtube.com/watch?v=c2abeXv-BiA
INSERT INTO `conditions` VALUES
(3309, 8, 3628, 0, 1), -- Not Quest Complete You Are Rakh'likh, Demon
(3310, 2, 10757, 1, 0), -- Has Item Ward of the Defiler
(3311, -1, 3309, 3310, 0), -- (Has Item Ward of the Defiler) AND (Not Quest Complete You Are Rakh'likh, Demon)
(3312, 45, 0, 0, 0), -- Is In Group
(3313, -1, 3311, 3312, 0), -- (Is In Group) AND (Has Item Ward of the Defiler) AND (Not Quest Complete You Are Rakh'likh, Demon)
(3314, 45, 0, 0, 1), -- Is Not In Group
(3315, -1, 3311, 3314, 0); -- (Is Not In Group) AND (Has Item Ward of the Defiler) AND (Not Quest Complete You Are Rakh'likh, Demon)
INSERT INTO `npc_text`(`ID`, `BroadcastTextID0`, `Probability0`) VALUES (6598, 11868, 1);
INSERT INTO `gossip_menu` VALUES
(1541, 2213, 0),
(1541, 6598, 3313);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES
(1541, 0, 0, 'I wish to face the Defiler.', 4592, 1, 1, -1, 0, 15410, 0, 0, NULL, 0, 3315),
(1541, 1, 0, 'We wish to face the Defiler.', 11869, 1, 1, -1, 0, 15411, 0, 0, NULL, 0, 3313);
DELETE FROM `gossip_scripts` WHERE `id`=15410;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (15410, 0, 15, 12885, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deathly Usher - Cast Teleport to Razelikh');
DELETE FROM `gossip_scripts` WHERE `id`=15411;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (15411, 0, 15, 27686, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deathly Usher - Cast Teleport to Razelikh (GROUP)');
UPDATE `creature_template` SET `gossip_menu_id`=1541, `ScriptName`='' WHERE `entry`=8816;

-- Fix size of Altar of the Defiler.
UPDATE `gameobject_template` SET `size`=0.25 WHERE `entry`=153205;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
