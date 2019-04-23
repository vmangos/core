DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181230145121');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181230145121');
-- Add your query below.


-- Innkeeper Trelayne
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = 6790;
DELETE FROM `creature_ai_events` WHERE `id` = 679001 AND `creature_id` = 6790;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(679001, 6790, 85, 10, 0, 100, 1, 1, 20, 40000, 40000, 679001, 0, 0, 'Innkeeper Trelayne - Greet Players On Entering Tavern');
DELETE FROM `creature_ai_scripts` WHERE `id` = 679001;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(679001, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 83, 0, 0, 0, 0, 0, 0, 0, 0, 'Innkeeper Trelayne - Say Text');
UPDATE `broadcast_text` SET `EmoteId0` = 3 WHERE `ID` = 83;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
