DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230212171042');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230212171042');
-- Add your query below.


-- Correct gossip menu for Branstock Khalder.
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (4679, 4435, 0, 95);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (4679, 4436, 0, 94);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (4679, 0, 3, 'I seek more training in the priestly ways.', 7157, 5, 16, 0, 0, 0, 0, 0, NULL, 0, 94);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (4679, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, NULL, 0, 163);
UPDATE `creature_template` SET `gossip_menu_id`=4679 WHERE `entry`=837;

-- Correct gossip menu for Marryk Nurribit.
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (4686, 560, 0, 90);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (4686, 561, 0, 91);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (4686, 0, 3, 'I am interested in mage training.', 2522, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (4686, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 138);
UPDATE `creature_template` SET `gossip_menu_id`=4686 WHERE `entry`=944;

-- Correct gossip menu for Volcor.
UPDATE `creature_template` SET `gossip_menu_id`=2521 WHERE `gossip_menu_id`=3692;
UPDATE `gossip_menu` SET `entry`=2521 WHERE `entry`=3692;
UPDATE `gossip_menu_option` SET `menu_id`=2521 WHERE `menu_id`=3692;

-- Correct gossip menu for Greatfather Winter.
DELETE FROM `gossip_menu` WHERE `entry`=9581;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9581;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9581;
UPDATE `creature_template` SET `gossip_menu_id`=5232 WHERE `entry`=13444;

-- Correct gossip menu for Zorbin Fandazzle.
UPDATE `creature_template` SET `gossip_menu_id`=5961 WHERE `gossip_menu_id`=11361;
UPDATE `gossip_menu` SET `entry`=5961 WHERE `entry`=11361;
UPDATE `gossip_menu_option` SET `menu_id`=5961 WHERE `menu_id`=11361;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5961 && `id`=0;
UPDATE `gossip_menu_option` SET `id`=0 WHERE `menu_id`=5961 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=11361;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
