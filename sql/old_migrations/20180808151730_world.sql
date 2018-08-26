DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180808151730');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180808151730');
-- Add your query below.


-- Dusksteel Throwing Knife should not be unique.
UPDATE `item_template` SET `maxcount`=0 WHERE `entry`=20086;

-- The Argent Dawn Commission quests should not be repeatable.
UPDATE `quest_template` SET `SpecialFlags`=0, `ExclusiveGroup`=5503 WHERE `entry` IN (5401, 5405, 5503);

-- Argent Officer Garush
DELETE FROM `npc_gossip` WHERE `npc_guid`=28420;
INSERT INTO `gossip_menu` VALUES (3382, 4134, 0);
UPDATE `creature_template` SET `gossip_menu_id`=3382 WHERE `entry`=10839;

-- Argent Officer Pureheart
DELETE FROM `npc_gossip` WHERE `npc_guid`=45241;
UPDATE `creature_template` SET `gossip_menu_id`=3383 WHERE `entry`=10840;

-- Argent Quartermaster Lightspark
DELETE FROM `npc_gossip` WHERE `npc_guid`=45237;
INSERT INTO `gossip_menu` VALUES (3441, 4193, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (3441, 0, 0, 'I need another Argent Dawn Commission.', 6878, 1, 1, -1, 0, 3421, 0, 0, '', 0, 478);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (3441, 1, 1, 'I would like to buy from you.', 6399, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
DELETE FROM `gossip_scripts` WHERE `id`=3421;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3421, 0, 15, 17777, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Argent Quartermaster Lightspark - Cast Spell Create Commission');
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `flags`) VALUES (472, 8, 5401, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `flags`) VALUES (473, 8, 5405, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `flags`) VALUES (474, 8, 5503, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `flags`) VALUES (475, -2, 472, 473, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `flags`) VALUES (476, -2, 474, 475, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `flags`) VALUES (477, 2, 12846, 1, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `flags`) VALUES (478, -1, 476, 477, 0);
UPDATE `creature_template` SET `gossip_menu_id`=3441 WHERE `entry`=10857;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
