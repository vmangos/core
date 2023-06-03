DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230603085543');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230603085543');
-- Add your query below.

-- Add condition for player on quest 851 (Verog the Dervish)
-- SELECT MAX(`condition_entry`) FROM `conditions` returned 1678802 -> using 1678803 as new id
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) values
(1678803, 9, 851, 0, 0, 0, 0);

-- Verog the Dervish no longer spawns when player does not have the required quest
-- Optional: increased spawn chance from 2% to 10% (no proof whats correct, but 2% seems way to low)
SET @SPAWN_CHANCE := 10;

-- Kolkar Marauder
DELETE FROM `creature_ai_events` WHERE `creature_id`=3275;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(327501, 3275, 0, 4, 0, 100, 0, 0, 0, 0, 0, 327501, 0, 0, 'Kolkar Marauder - Cast Charge on Aggro'),
(327504, 3275, 1678803, 6, 0, @SPAWN_CHANCE, 0, 0, 0, 0, 0, 327504, 0, 0, 'Kolkar Marauder - Chance Say and Summon Verog the Dervish on Death');

-- Kolkar Pack Runner
DELETE FROM `creature_ai_events` WHERE `creature_id`=3274;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(327401, 3274, 0, 4, 0, 100, 0, 0, 0, 0, 0, 327401, 0, 0, 'Kolkar Pack Runner - Cast Battle Shout on Aggro'),
(327402, 3274, 1678803, 6, 0, @SPAWN_CHANCE, 0, 0, 0, 0, 0, 327402, 0, 0, 'Kolkar Pack Runner - Chance Say and Summon Verog the Dervish on Death');

-- Kolkar Bloodcharger
DELETE FROM `creature_ai_events` WHERE `creature_id`=3397;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(339703, 3397, 1678803, 6, 0, @SPAWN_CHANCE, 0, 0, 0, 0, 0, 339703, 0, 0, 'Kolkar Bloodcharger - Chance Say and Summon Verog the Dervish on Death');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
