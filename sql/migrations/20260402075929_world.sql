DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260402075929');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260402075929');
-- Add your query below.


-- 8982: Stored Value In Index 5 From Instance Script Is Equal Or Greater Than 1
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (8982, 34, 5, 1, 1, 0, 0);

-- Events list for Ironhand Guardian
DELETE FROM `creature_ai_events` WHERE `creature_id`=8982;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(898201, 8982, 8982, 1, 0, 25, 1, 4000, 8000, 11000, 18000, 898201, 0, 0, 'Ironhand Guardian - Cast Gout of Flame OOC'),
(898202, 8982, 0, 11, 0, 100, 0, 0, 0, 0, 0, 898202, 0, 0, 'Ironhand Guardian - Cast Stoned Visual on Spawn');


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
