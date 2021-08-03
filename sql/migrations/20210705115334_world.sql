DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210705115334');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210705115334');
-- Add your query below.


-- Make Den Mother and Thistle Cub aggro together.
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (37523, 37523, 0, 0, 6);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (37523, 37566, 0, 0, 6);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (37523, 37567, 0, 0, 6);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (37523, 37568, 0, 0, 6);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (37523, 37569, 0, 0, 6);

-- Fix a startup error.
DELETE FROM `creature_ai_events` WHERE `creature_id`=3271;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (327101, 3271, 0, 1, 0, 100, 1, 1000, 1000, 600000, 600000, 327101, 0, 0, 'Razormane Mystic - Cast Lightning Shield on Spawn');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (327102, 3271, 0, 27, 0, 100, 1, 324, 1, 15000, 30000, 327102, 0, 0, 'Razormane Mystic - Cast Lightning Shield on Missing Buff');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (327103, 3271, 0, 2, 0, 100, 0, 20, 1, 0, 0, 327103, 0, 0, 'Razormane Mystic - Flee at 20% HP');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
