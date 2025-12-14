DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20251017151606');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20251017151606');
-- Add your query below.


-- Add missing spawn for Grimtooth.
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `wander_distance`, `movement_type`, `spawntimesecsmin`, `spawntimesecsmax`, `patch_min`) VALUES (28548, 603, 30, -1594.39, -409.991, 81.5093, 1.3439, 0, 0, 300, 300, 3);
UPDATE `creature` SET `position_x`=-1590.66, `position_y`=-403.476, `position_z`=81.3403, `orientation`=5.69098 WHERE `guid`=51622;

-- Add missing spawn for Bookie Herod.
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `movement_type`) VALUES (28549, 815, 0, -11528.3, -650.711, 31.0616, 3.57275, 900, 900, 1.5, 1);
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `movement_type`) VALUES (28550, 815, 0, -11504.1, -604.229, 36.3149, 4.06803, 900, 900, 1.5, 1);
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `movement_type`) VALUES (28551, 815, 0, -11660.8, -637.492, 30.0412, 2.13333, 900, 900, 1.5, 1);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (9917, 1, 'Stranglethorn Vale - Bookie Herod', 0, 0, 0, 10);
INSERT INTO `pool_creature_template` (`id`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (815, 9917, 0, 'Bookie Herod', 0, 0, 10);

-- Add missing spawn for The Lich King.
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `movement_type`, `patch_min`) VALUES (139980, 16980, 533, 3762.38, -5115.86, 143.938, 0.191986, 300, 300, 0, 0, 9);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
