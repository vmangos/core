DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190629102637');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190629102637');
-- Add your query below.


-- ID: 9077 - gossip menu
UPDATE `creature_template` SET `gossip_menu_id` = 2884 WHERE `entry` = 9077;
DELETE FROM `npc_gossip` WHERE `npc_guid` = 6878 AND `textid` = 3560;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(2884, 3560),
(2885, 3561),
(2886, 3562),
(2887, 3563),
(2888, 3564),
(2889, 3565);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_script_id`, `condition_id`) VALUES
(2884, 0, 0, "What roles?", 5971, 1, 1, 2885, 0, 61002),
(2885, 0, 0, "Dreams?", 5973, 1, 1, 2886, 0, 0),
(2886, 0, 0, "I pray for such things.", 5975, 1, 1, 2887, 0, 0),
(2887, 0, 0, "I do not deserve such praise, Warlord Goretooth.", 5977, 1, 1, 2888, 0, 0),
(2888, 0, 0, "Sir! Until my body ceases to function!", 5979, 1, 1, 2889, 0, 0),
(2889, 0, 0, "Yes, sir. Thank you, sir!", 5981, 1, 1, -1, 2889, 0);
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(2889, 0, 15, 16548, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Cast Goretooth's Orders");
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
(61000, 9, 4903, 0, 0, 0, 1),
(61001, 2, 12563, 1, 0, 0, 1),
(61002, -1, 61000, 61001, 0, 0, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
