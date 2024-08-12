DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20231218215828');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20231218215828');
-- Add your query below.


-- Fix Anubisath Warder ability timers.
DELETE FROM `creature_ai_events` WHERE `creature_id`=15311;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES 
(1531101, 15311, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1531101, 0, 0, 'Anubisath Warder - Set Random Phase'),
(1531102, 15311, 0, 0, 0, 100, 1, 15000, 20000, 15000, 20000, 1531102, 0, 0, 'Anubisath Warder - Periodic Cast Fire Nova (All Phases)'),
(1531103, 15311, 0, 0, 29, 100, 1, 15000, 20000, 15000, 20000, 1531103, 0, 0, 'Anubisath Warder - Entangling Roots (Phase 1)'),
(1531104, 15311, 0, 0, 29, 100, 1, 10000, 30000, 10000, 30000, 1531104, 0, 0, 'Anubisath Warder - Dust Cloud (Phase 1)'),
(1531105, 15311, 0, 0, 27, 100, 1, 15000, 20000, 15000, 20000, 1531105, 0, 0, 'Anubisath Warder - Entangling Roots (Phase 2)'),
(1531106, 15311, 0, 0, 27, 100, 1, 10000, 30000, 10000, 30000, 1531106, 0, 0, 'Anubisath Warder - Silence (Phase 2)'),
(1531107, 15311, 0, 0, 23, 100, 1, 15000, 20000, 15000, 20000, 1531107, 0, 0, 'Anubisath Warder - Fear (Phase 3)'),
(1531108, 15311, 0, 0, 23, 100, 1, 10000, 30000, 10000, 30000, 1531108, 0, 0, 'Anubisath Warder - Dust Cloud (Phase 3)'),
(1531109, 15311, 0, 0, 15, 100, 1, 15000, 20000, 15000, 20000, 1531109, 0, 0, 'Anubisath Warder - Fear (Phase 4)'),
(1531110, 15311, 0, 0, 15, 100, 1, 10000, 30000, 10000, 30000, 1531110, 0, 0, 'Anubisath Warder - Silence (Phase 4)');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
