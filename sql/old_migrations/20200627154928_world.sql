DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200627154928');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200627154928');
-- Add your query below.


-- Ironforge Reveler
DELETE FROM `gossip_menu` WHERE `entry`=6811;
INSERT INTO `gossip_menu` VALUES
(6811, 8081, 0),
(6811, 8137, 113);
DELETE FROM `gossip_menu` WHERE `entry`=6929;
INSERT INTO `gossip_menu` VALUES
(6929, 8219, 0);
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1590608, 15906, 69, 11, 0, 100, 1, 0, 0, 0, 0, 1590608, 0, 0, 'Ironforge Reveler - Set Gossip Menu Id (Moonglade Only)');
DELETE FROM `creature_ai_scripts` WHERE `id`=1590608;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1590608, 0, 84, 6929, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironforge Reveler - Set Gossip Menu Id');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1590608, 0, 22, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironforge Reveler - Set Faction');
UPDATE `creature_template` SET `gossip_menu_id`=6811 WHERE `entry`=15906;

-- Darnassus Reveler
DELETE FROM `gossip_menu` WHERE `entry`=6930;
INSERT INTO `gossip_menu` VALUES
(6930, 8220, 0);
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1590508, 15905, 69, 11, 0, 100, 1, 0, 0, 0, 0, 1590508, 0, 0, 'Darnassus Reveler - Set Gossip Menu Id (Moonglade Only)');
DELETE FROM `creature_ai_scripts` WHERE `id`=1590508;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1590508, 0, 84, 6930, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Darnassus Reveler - Set Gossip Menu Id');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1590508, 0, 22, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Darnassus Reveler - Set Faction');
UPDATE `creature_template` SET `gossip_menu_id`=6811 WHERE `entry`=15905;

-- Stormwind Reveler
DELETE FROM `gossip_menu` WHERE `entry`=6931;
INSERT INTO `gossip_menu` VALUES
(6931, 8218, 0);
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1569408, 15694, 69, 11, 0, 100, 1, 0, 0, 0, 0, 1569408, 0, 0, 'Stormwind Reveler - Set Gossip Menu Id (Moonglade Only)');
DELETE FROM `creature_ai_scripts` WHERE `id`=1569408;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1569408, 0, 84, 6931, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Stormwind Reveler - Set Gossip Menu Id');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1569408, 0, 22, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Stormwind Reveler - Set Faction');
UPDATE `creature_template` SET `gossip_menu_id`=6811 WHERE `entry`=15694;

-- Orgrimmar Reveler
DELETE FROM `gossip_menu` WHERE `entry`=6812;
INSERT INTO `gossip_menu` VALUES
(6812, 8134, 0),
(6812, 8137, 113);
DELETE FROM `gossip_menu` WHERE `entry`=6932;
INSERT INTO `gossip_menu` VALUES
(6932, 8221, 0);
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1590808, 15908, 69, 11, 0, 100, 1, 0, 0, 0, 0, 1590808, 0, 0, 'Orgrimmar Reveler - Set Gossip Menu Id (Moonglade Only)');
DELETE FROM `creature_ai_scripts` WHERE `id`=1590808;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1590808, 0, 84, 6932, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Orgrimmar Reveler - Set Gossip Menu Id');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1590808, 0, 22, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Orgrimmar Reveler - Set Faction');
UPDATE `creature_template` SET `gossip_menu_id`=6812 WHERE `entry`=15908;

-- Thunder Bluff Reveler
DELETE FROM `gossip_menu` WHERE `entry`=6933;
INSERT INTO `gossip_menu` VALUES
(6933, 8222, 0);
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1571908, 15719, 69, 11, 0, 100, 1, 0, 0, 0, 0, 1571908, 0, 0, 'Thunder Bluff Reveler - Set Gossip Menu Id (Moonglade Only)');
DELETE FROM `creature_ai_scripts` WHERE `id`=1571908;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1571908, 0, 84, 6933, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Thunder Bluff Reveler - Set Gossip Menu Id');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1571908, 0, 22, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Thunder Bluff Reveler - Set Faction');
UPDATE `creature_template` SET `gossip_menu_id`=6812 WHERE `entry`=15719;

-- Undercity Reveler
DELETE FROM `gossip_menu` WHERE `entry`=6934;
INSERT INTO `gossip_menu` VALUES
(6934, 8223, 0);
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1590708, 15907, 69, 11, 0, 100, 1, 0, 0, 0, 0, 1590708, 0, 0, 'Undercity Reveler - Set Gossip Menu Id (Moonglade Only)');
DELETE FROM `creature_ai_scripts` WHERE `id`=1590708;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1590708, 0, 84, 6934, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Undercity Reveler - Set Gossip Menu Id');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1590708, 0, 22, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Undercity Reveler - Set Faction');
UPDATE `creature_template` SET `gossip_menu_id`=6812 WHERE `entry`=15907;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
