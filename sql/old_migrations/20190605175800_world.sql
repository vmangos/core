DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190605175800');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190605175800');
-- Add your query below.


-- ID 3836: gossip menu
UPDATE `creature_template` SET `gossip_menu_id` = 1201, `script_name` = "" WHERE `entry` = 3836;

DELETE FROM `conditions` WHERE `condition_entry` IN (1201, 1202, 1203);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
(1201, 9, 3181, 0, 0, 0, 1), -- quest taken
(1202, 8, 3181, 0, 0, 0, 1), -- quest rewarded
(1203, -1, 1201, 1202, 0, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (1201, 1202, 1203, 1204, 1205, 1206) AND `id` = 0;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`OptionBroadcastTextID`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`,`BoxBroadcastTextID`,`condition_id`) VALUES
(1201, 0, 0, "What's the worst that could happen?", 4266, 1, 1, 1202, 0, 0, 0, "", 0, 1203),
(1202, 0, 0, "Another way? Do tell...", 4268, 1, 1, 1203, 0, 0, 0, "", 0, 0),
(1203, 0, 0, "Orcs? Badlands? I'm invulnerable!", 4270, 1, 1, 1204, 0, 0, 0, "", 0, 0),
(1204, 0, 0, "Absolutely!", 4272, 1, 1, 1205, 0, 0, 0, "", 0, 0),
(1205, 0, 0, "My apologies, Pebblebitty.", 4274, 1, 1, 1206, 0, 0, 0, "", 0, 0),
(1206, 0, 0, "Done, done, and done.", 4276, 1, 1, -1, 0, 0, 0, "", 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` IN (1201, 1202, 1203, 1204, 1205, 1206);
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES
(1201, 1833),
(1202, 1834),
(1203, 1835),
(1204, 1836),
(1205, 1837),
(1206, 1838);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
