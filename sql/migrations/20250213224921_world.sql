DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250213224921');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250213224921');
-- Add your query below.


-- Fix some Lunar Festival Elder gossips.
REPLACE INTO `gossip_menu` (`entry`, `text_id`) VALUES (6842, 8148);
REPLACE INTO `gossip_menu` (`entry`, `text_id`) VALUES (6844, 8150);
REPLACE INTO `gossip_menu` (`entry`, `text_id`) VALUES (6845, 8152);
REPLACE INTO `gossip_menu` (`entry`, `text_id`) VALUES (6846, 8153);
REPLACE INTO `gossip_menu` (`entry`, `text_id`) VALUES (6847, 8154);
REPLACE INTO `gossip_menu` (`entry`, `text_id`) VALUES (6850, 8155);
REPLACE INTO `gossip_menu` (`entry`, `text_id`) VALUES (6920, 8210);
DELETE FROM `gossip_menu` WHERE `entry` IN (45019, 45023, 45020, 45021, 45022, 45024);
UPDATE `gossip_menu_option` SET `action_menu_id`=6844 WHERE `option_broadcast_text`=11493;
UPDATE `gossip_menu_option` SET `action_menu_id`=6842 WHERE `option_broadcast_text`=11488;
UPDATE `gossip_menu_option` SET `action_menu_id`=6847 WHERE `option_broadcast_text`=11501;
UPDATE `gossip_menu_option` SET `action_menu_id`=6920 WHERE `option_broadcast_text`=11653;
UPDATE `gossip_menu_option` SET `action_menu_id`=6845 WHERE `option_broadcast_text`=11497;
UPDATE `gossip_menu_option` SET `action_menu_id`=6846 WHERE `option_broadcast_text`=11499;
UPDATE `gossip_menu_option` SET `action_menu_id`=6850 WHERE `option_broadcast_text`=11503;
UPDATE `gossip_menu_option` SET `condition_id`=6844 WHERE `condition_id`=45019;
UPDATE `gossip_menu_option` SET `condition_id`=6847 WHERE `condition_id`=45023;
UPDATE `gossip_menu_option` SET `condition_id`=6920 WHERE `condition_id`=45020;
UPDATE `gossip_menu_option` SET `condition_id`=6845 WHERE `condition_id`=45021;
UPDATE `gossip_menu_option` SET `condition_id`=6846 WHERE `condition_id`=45022;
UPDATE `gossip_menu_option` SET `condition_id`=6850 WHERE `condition_id`=45024;
UPDATE `conditions` SET `condition_entry`=6844 WHERE `condition_entry`=45019;
UPDATE `conditions` SET `condition_entry`=6847 WHERE `condition_entry`=45023;
UPDATE `conditions` SET `condition_entry`=6920 WHERE `condition_entry`=45020;
UPDATE `conditions` SET `condition_entry`=6845 WHERE `condition_entry`=45021;
UPDATE `conditions` SET `condition_entry`=6846 WHERE `condition_entry`=45022;
UPDATE `conditions` SET `condition_entry`=6850 WHERE `condition_entry`=45024;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
