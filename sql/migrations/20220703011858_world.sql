DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220703011858');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220703011858');
-- Add your query below.


-- Add missing spawn locations for Sewer Beast.
DELETE FROM `creature` WHERE `id`=3581;
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES 
(86301, 3581, 0, 0, 0, 0, -8904.92, 710.952, 85.9748, 0.575959, 7286, 7286, 0, 100, 0, 0, 0, 0, 0, 10),
(86302, 3581, 0, 0, 0, 0, -8839.4, 945.48, 85.9748, 5.39307, 7286, 7286, 0, 100, 0, 0, 0, 0, 0, 10),
(86303, 3581, 0, 0, 0, 0, -8792.81, 481.942, 85.9748, 0.767945, 7286, 7286, 0, 100, 0, 0, 0, 0, 0, 10),
(86304, 3581, 0, 0, 0, 0, -8685.74, 903.135, 85.9749, 3.75246, 7286, 7286, 0, 100, 0, 0, 0, 0, 0, 10),
(86305, 3581, 0, 0, 0, 0, -8564.33, 488.517, 85.9748, 2.25147, 7286, 7286, 0, 100, 0, 0, 0, 0, 0, 10),
(86306, 3581, 0, 0, 0, 0, -8478.04, 710.521, 85.9749, 3.82227, 7286, 7286, 0, 100, 0, 0, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (279, 1, 'Stormwind City - Sewer Beast', 0, 0, 0, 10);
INSERT INTO `pool_creature_template` (`id`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (3581, 279, 0, 'Stormwind City - Sewer Beast', 0, 0, 10);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
