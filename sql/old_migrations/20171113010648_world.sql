DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171113010648');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171113010648');
-- Add your query below.


REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`) VALUES (8534, 9, 8534);
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`) VALUES (8738, 9, 8738);
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`) VALUES (8739, 9, 8739);

-- Scout Jalia
DELETE FROM `npc_gossip` WHERE `npc_guid`=46166;
DELETE FROM `gossip_menu` WHERE `entry`=15611;
DELETE FROM `gossip_scripts` WHERE `id`=15611;
REPLACE INTO `gossip_menu` (`entry`, `text_id`) VALUES (15611, 8064);
REPLACE INTO `gossip_scripts` (`id`, `command`, `datalong`, `comments`) VALUES (15611, 15, 25845, 'Hive\'Ashi Scout Report completion spell');
REPLACE INTO `gossip_menu_option` (`menu_id`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_script_id`, `condition_id`) 
VALUES (15611, 'May I have your report?', 1, 1, -1, 15611, 8739);
UPDATE `creature_template` SET `gossip_menu_id`=15611 WHERE `entry`=15611;

-- Scout Landion
DELETE FROM `gossip_menu` WHERE `entry`=15609;
DELETE FROM `gossip_scripts` WHERE `id`=15609;
REPLACE INTO `gossip_menu` (`entry`, `text_id`) VALUES (15609, 8063);
REPLACE INTO `gossip_scripts` (`id`, `command`, `datalong`, `comments`) VALUES (15609, 15, 25847, 'Hive\'Regal Scout Report completion spell');
REPLACE INTO `gossip_menu_option` (`menu_id`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_script_id`, `condition_id`) 
VALUES (15609, 'May I have your report?', 1, 1, -1, 15609, 8738);
UPDATE `creature_template` SET `gossip_menu_id`=15609 WHERE `entry`=15609;

-- Scout Azenel
DELETE FROM `gossip_menu` WHERE `entry`=15610;
DELETE FROM `gossip_scripts` WHERE `id`=15610;
REPLACE INTO `gossip_menu` (`entry`, `text_id`) VALUES (15610, 8064);
REPLACE INTO `gossip_scripts` (`id`, `command`, `datalong`, `comments`) VALUES (15610, 15, 25843, 'Hive\'Zora Scout Report completion spell');
REPLACE INTO `gossip_menu_option` (`menu_id`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_script_id`, `condition_id`) 
VALUES (15610, 'May I have your report?', 1, 1, -1, 15610, 8534);
UPDATE `creature_template` SET `gossip_menu_id`=15610, `ScriptName`='' WHERE `entry`=15610;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
