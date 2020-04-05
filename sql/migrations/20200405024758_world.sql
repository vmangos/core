DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200405024758');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200405024758');
-- Add your query below.


-- Default friendly faction for Ribbly Screwspigot and Ribbly's Crony is 735.
UPDATE `creature_template` SET `faction`=735 WHERE `entry` IN (9543, 10043);

-- Scarshield Infiltrator should be faction 40 and immune to pc and npc.
UPDATE `creature_template` SET `faction`=40, `unit_flags`=832 WHERE `entry`=10299;

-- Events list for Scarshield Infiltrator
DELETE FROM `creature_ai_events` WHERE `creature_id`=10299;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1029901, 10299, 85, 10, 2, 100, 0, 0, 15, 0, 0, 1029901, 0, 0, 'Scarshield Infiltrator - Trigger Vaelan event on LOS');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1029902, 10299, 0, 1, 1, 100, 0, 2000, 2000, 0, 0, 1029902, 0, 0, 'Scarshield Infiltrator - Morph into Vaelan (Phase 1)');

-- Vaelastrasz the Red should be faction Escortee.
UPDATE `creature_template` SET `faction`=250 WHERE `entry`=10340;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
