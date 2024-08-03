DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240623222319');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240623222319');
-- Add your query below.


-- Events list for Spirit Of Redemption
DELETE FROM `creature_ai_events` WHERE `creature_id`=12904;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(1290401, 12904, 0, 1, 0, 100, 0, 0, 0, 0, 0, 1290401, 0, 0, 'Spirit of Redemption - Cast Dummy Visuals after Spawn'),
(1290402, 12904, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1290402, 0, 0, 'Spirit of Redemption - Despawn on Death');
DELETE FROM `creature_ai_scripts` WHERE `id`=1290401;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1290401, 0, 0, 15, 20723, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spirit of Redemption - Cast Dummy Visual Spell'),
(1290401, 0, 1, 15, 20721, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spirit of Redemption - Cast Dummy Animation Spell');
DELETE FROM `creature_ai_scripts` WHERE `id`=1290402;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1290402, 0, 0, 18, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spirit of Redemption - Despawn');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=12904;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
