DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200417073640');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200417073640');
-- Add your query below.


-- Add condition field to vendor tables.
ALTER TABLE `npc_vendor`
	ADD COLUMN `condition_id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `itemflags`;
ALTER TABLE `npc_vendor_template`
	ADD COLUMN `condition_id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `itemflags`;

-- Dreadsteed of Xoroth is taken on rewarded.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (7630, 8, 7631, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (7629, 9, 7631, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (7631, -2, 7629, 7630, 0, 0, 0);

-- Assign vendor condition to Xorothian Glyphs, Black Lodestone and J'eevee's Jar.
UPDATE `npc_vendor` SET `condition_id`=7631 WHERE `item` IN (18670, 18629, 18663);

-- Add gossip menu to Gorzeeki Wildeyes.
INSERT INTO `gossip_menu` VALUES (5818, 6991, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5818, 0, 1, 'Gorzeeki, I wish to make a purchase.', 9586, 3, 4, 0, 0, 0, 0, 0, '', 0, 67);
UPDATE `creature_template` SET `gossip_menu_id`=5818 WHERE `entry`=14437;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
