DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250608152632');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250608152632');
-- Add your query below.


-- Add missing talisman restoration options for Mages.
DELETE FROM `gossip_menu_option` WHERE `menu_id`=6322;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES 
(6322, 0, 0, 'I have lost the talisman and require a new one, Al\'tabim.', 10384, 1, 1, -1, 0, 40113, 0, 0, NULL, 0, 40103),
(6322, 1, 0, 'I have lost the talisman and require a new one, Al\'tabim.', 10384, 1, 1, -1, 0, 40114, 0, 0, NULL, 0, 40108),
(6322, 2, 0, 'I have lost the talisman and require a new one, Al\'tabim.', 10384, 1, 1, -1, 0, 40115, 0, 0, NULL, 0, 40113),
(6322, 3, 0, 'I have lost the talisman and require a new one, Al\'tabim.', 10384, 1, 1, -1, 0, 40116, 0, 0, NULL, 0, 40116),
(6322, 4, 0, 'I have lost the talisman and require a new one, Al\'tabim.', 10384, 1, 1, -1, 0, 40020, 0, 0, NULL, 0, 40067),
(6322, 5, 0, 'I have lost the talisman and require a new one, Al\'tabim.', 10384, 1, 1, -1, 0, 40021, 0, 0, NULL, 0, 40072),
(6322, 6, 0, 'I have lost the talisman and require a new one, Al\'tabim.', 10384, 1, 1, -1, 0, 40022, 0, 0, NULL, 0, 40077),
(6322, 7, 0, 'I have lost the talisman and require a new one, Al\'tabim.', 10384, 1, 1, -1, 0, 40023, 0, 0, NULL, 0, 40080),
(6322, 8, 0, 'I have lost the talisman and require a new one, Al\'tabim.', 10384, 1, 1, -1, 0, 40024, 0, 0, NULL, 0, 40085),
(6322, 9, 0, 'I have lost the talisman and require a new one, Al\'tabim.', 10384, 1, 1, -1, 0, 40025, 0, 0, NULL, 0, 40090),
(6322, 10, 0, 'I have lost the talisman and require a new one, Al\'tabim.', 10384, 1, 1, -1, 0, 40026, 0, 0, NULL, 0, 40095),
(6322, 11, 0, 'I have lost the talisman and require a new one, Al\'tabim.', 10384, 1, 1, -1, 0, 40027, 0, 0, NULL, 0, 40098),
(6322, 12, 0, 'I have lost my Confessor\'s Mantle and require a replacement, Al\'tabim.', 12674, 1, 1, -1, 0, 40062, 0, 0, NULL, 0, 40281),
(6322, 13, 0, 'I no longer possess my Zandalar Confessor\'s Bindings. Can you provide a replacement?', 12675, 1, 1, -1, 0, 40063, 0, 0, NULL, 0, 40284),
(6322, 14, 0, 'Al\'tabim, my Zandalar Confessor\'s Wraps have gone missing. Can you replace them?', 12676, 1, 1, -1, 0, 40064, 0, 0, NULL, 0, 40287),
(6322, 15, 0, 'I have lost my Zandalar Illusionist\'s Robe and need a new one, Al\'tabim.', 12677, 1, 1, -1, 0, 40070, 0, 0, NULL, 0, 40305),
(6322, 16, 0, 'Al\'tabim, I seem to have misplaced my Zandalar Illusionist\'s Mantle. Can you supply me with a replacement?', 12678, 1, 1, -1, 0, 40065, 0, 0, NULL, 0, 40290),
(6322, 17, 0, 'I no longer have my Zandalar Illusionist\'s Wraps and require a new pair.', 12679, 1, 1, -1, 0, 40066, 0, 0, NULL, 0, 40293),
(6322, 18, 0, 'I no longer have my Zandalar Demoniac\'s Robe. Can you provide a replacement?', 12680, 1, 1, -1, 0, 40069, 0, 0, NULL, 0, 40302),
(6322, 19, 0, 'Al\'tabim, I have lost my Zandalar Demoniac\'s Mantle. Can you help?', 12681, 1, 1, -1, 0, 40068, 0, 0, NULL, 0, 40299),
(6322, 20, 0, 'My Zandalar Demoniac\'s Wraps have gone missing. Can you provide me with another set?', 12682, 1, 1, -1, 0, 40067, 0, 0, NULL, 0, 40296);

-- R1
DELETE FROM `gossip_scripts` WHERE `id`=40113;
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(40113, 0, 0, 15, 24038, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover ZG Mage Neck R1');

-- R2
DELETE FROM `gossip_scripts` WHERE `id`=40114;
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(40114, 0, 0, 15, 24039, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover ZG Mage Neck R2');

-- R3
DELETE FROM `gossip_scripts` WHERE `id`=40115;
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(40115, 0, 0, 15, 24040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover ZG Mage Neck R3');

-- R4
DELETE FROM `gossip_scripts` WHERE `id`=40116;
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(40116, 0, 0, 15, 24041, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover ZG Mage Neck R4');


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
