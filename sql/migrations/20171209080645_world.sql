DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171209080645');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171209080645');
-- Add your query below.


-- Add gossip menu for Estelle Gendry.
UPDATE `creature_template` SET `gossip_menu_id`=161, `ScriptName`='' WHERE `entry`=6566;

INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (2560, 9, 1999, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (2561, 16, 5060, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (2562, -1, 2560, 2561);

INSERT INTO `gossip_menu` VALUES (161, 581, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (161, 0, 0, 'Mennet said I should ask you for a set of thieves\' tools.', 2621, 1, 1, -1, 0, 161, 0, 0, NULL, 0, 2562);

DELETE FROM `gossip_scripts` WHERE `id`=161;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(161, 0, 29, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Estelle Gendry - Remove Gossip Flag'),
(161, 1, 0, 0, 0, 0, 0, 0, 2622, 0, 0, 0, 0, 0, 0, 0, 'Estelle Gendry - Say Text 1'),
(161, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1381.952, 124.56, -62.363, 2.6, 'Estelle Gendry - Move to Crates'),
(161, 6, 1, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Estelle Gendry - Emote Crafting'),
(161, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Estelle Gendry - Stop Emoting'),
(161, 9, 0, 0, 0, 0, 0, 0, 2623, 0, 0, 0, 0, 0, 0, 0, 'Estelle Gendry - Say Text 2'),
(161, 11, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1389.83, 122.755, -62.3697, 6.24828, 'Estelle Gendry - Move to Home Position'),
(161, 13, 15, 9949, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Estelle Gendry - Cast Thieves Tool Rack Conjure'),
(161, 14, 29, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Estelle Gendry - Add Gossip Flag');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
