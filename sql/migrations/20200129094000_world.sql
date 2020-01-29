DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200129094000');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200129094000');
-- Add your query below.

-- Added gossip for npc 2239 (Drull) with english & german locales
update `creature_template` set gossip_menu_id=262 where entry=2239;

-- Greeting
insert into `gossip_menu` (`entry`, `text_id`, `condition_id`) values('262','759','0');

-- Gossip Option
insert into `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) values('262','0','0','How can I free you?','2746','1','3','261','0','0','0','0',NULL,'0','0');

-- Gossip Option Page
insert into `gossip_menu` (`entry`, `text_id`, `condition_id`) values('261','760','0');


END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;