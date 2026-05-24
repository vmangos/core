DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20251231024007');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20251231024007');
-- Add your query below.


-- Text assigned to Protector Gariel belongs to Scout Riell.
DELETE FROM `creature_ai_events` WHERE `creature_id`=820;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(82001, 820, 0, 1, 0, 100, 1, 30000, 45000, 150000, 180000, 82001, 0, 0, 'Scout Riell - Random OOC Say');
DELETE FROM `creature_ai_scripts` WHERE `id`=82001;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(82001, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 0, 0, 'Scout Riell - Say Text');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=820;
-- Remove it from Protector Gariel.
DELETE FROM `creature_ai_scripts` WHERE `id` IN (49001);
DELETE FROM `creature_ai_events` WHERE `creature_id`=490;
UPDATE `creature_template` SET `ai_name`='' WHERE `entry`=490;

-- Text assigned to Protector Bialon belongs to Scout Galiaan.
DELETE FROM `creature_ai_events` WHERE `creature_id`=878;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(87801, 878, 0, 1, 0, 100, 1, 75000, 90000, 150000, 180000, 87801, 0, 0, 'Scout Galiaan - Random OOC Say');
DELETE FROM `creature_ai_scripts` WHERE `id`=87801;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(87801, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0, 0, 'Scout Galiaan - Say Text');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=878;
-- Removing unused script actions.
DELETE FROM `creature_ai_scripts` WHERE `id` IN (48701);
DELETE FROM `creature_ai_events` WHERE `creature_id`=487;
UPDATE `creature_template` SET `ai_name`='' WHERE `entry`=487;

-- Fix some unrelated startup errors.
UPDATE `creature` SET `mana_percent`=100 WHERE `guid` IN (17021, 17018, 17017, 17013, 17010, 17004);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
