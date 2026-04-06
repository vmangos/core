DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260406103411');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260406103411');
-- Add your query below.

-- Gordo
-- Gloom Weed spawns are pooled and thus sometimes can't be found and despawned
-- SF_GENERAL_ABORT_ON_FAILURE + SF_GENERAL_SKIP_MISSING_TARGETS for CMD 81 = despawn go
UPDATE `creature_movement_scripts` SET `data_flags` = 24 WHERE `command` = 81 AND `id` IN
(
1066602,
1066603,
1066604,
1066605,
1066606,
1066607,
1066608,
1066609,
1066610,
1066611,
1066612,
1066613,
1066614
);

-- Rot Hide Mongrel
-- SF_GENERAL_SKIP_MISSING_TARGETS: TARGET_T_HOSTILE_RANDOM returns null when threat list is empty
UPDATE `creature_ai_scripts` SET `data_flags` = 16 WHERE `id` = 167502;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
