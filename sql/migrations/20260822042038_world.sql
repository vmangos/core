DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260822042038');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260822042038');
-- Add your query below.


-- Cleanup messed up creature groups.
DELETE FROM `creature_groups` WHERE `leader_guid`=1 || `member_guid`=56942;
DELETE FROM `creature_groups` WHERE `leader_guid`=9 || `member_guid`=79289;
DELETE FROM `creature_groups` WHERE `leader_guid`=11 || `member_guid`=79315;
DELETE FROM `creature_groups` WHERE `leader_guid`=25 || `member_guid`=30;
DELETE FROM `creature_groups` WHERE `leader_guid`=43702 || `member_guid`=43710;
UPDATE `creature_groups` SET `leader_guid`=90600 WHERE `leader_guid`=44415;
DELETE FROM `creature_groups` WHERE `leader_guid`=300740 || `member_guid`=300741;
UPDATE `creature_groups` SET `leader_guid`=1885 WHERE `leader_guid`=248;
UPDATE `creature_groups` SET `member_guid`=1885 WHERE `member_guid`=248;
UPDATE `creature` SET `position_x`=-11699.98, `position_y`=-3176.35, `position_z`=9.308, `orientation`=1.82 WHERE `guid`=2719;
REPLACE INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (4481, 727, 0, 0, 0, 0, 0, -5602.48, -1540.37, 399.297, 1.96379, 300, 300, 0, 100, 0, 2, 0, 0, 0, 10);
REPLACE INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (4479, 727, 0, 0, 0, 0, 0, -5599.92, -1541.88, 399.148, 2.307, 300, 300, 0, 100, 0, 0, 0, 0, 0, 10);
DELETE FROM `creature_movement` WHERE `id`=4481;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`, `path_id`) VALUES 
(4481, 1, -5612.3, -1519.06, 399.055, 0, 0, 0, 0, 0),
(4481, 2, -5600.81, -1544.38, 399.313, 0, 0, 0, 0, 0),
(4481, 3, -5568.58, -1553.51, 399.144, 0, 0, 0, 0, 0),
(4481, 4, -5554.9, -1584.19, 396.246, 0, 0, 0, 0, 0),
(4481, 5, -5560.19, -1613.15, 391.819, 0, 0, 0, 0, 0),
(4481, 6, -5551.39, -1632.83, 391.819, 0, 0, 0, 0, 0),
(4481, 7, -5544.93, -1666.15, 391.866, 0, 0, 0, 0, 0),
(4481, 8, -5542.76, -1683.47, 392.9, 0, 0, 0, 0, 0),
(4481, 9, -5533.73, -1690.23, 394.275, 0, 0, 0, 0, 0),
(4481, 10, -5521.07, -1699.96, 396.058, 0, 0, 0, 0, 0),
(4481, 11, -5511.72, -1733.24, 397.207, 0, 0, 0, 0, 0),
(4481, 12, -5509.97, -1767.26, 397.227, 0, 0, 0, 0, 0),
(4481, 13, -5513.12, -1800.14, 397.227, 0, 0, 0, 0, 0),
(4481, 14, -5514.83, -1833.99, 397.227, 0, 0, 0, 0, 0),
(4481, 15, -5512.36, -1866.3, 397.227, 0, 0, 0, 0, 0),
(4481, 16, -5493.69, -1899.95, 397.227, 0, 0, 0, 0, 0),
(4481, 17, -5492.4, -1932.95, 398.477, 0, 0, 0, 0, 0),
(4481, 18, -5508.87, -1966.94, 399.491, 0, 0, 0, 0, 0),
(4481, 19, -5510.57, -2000.05, 399.5, 0, 0, 0, 0, 0),
(4481, 20, -5506.96, -2033.72, 399.5, 0, 3000, 0, 0, 0),
(4481, 21, -5508.04, -2027.81, 399.376, 0, 0, 0, 0, 0),
(4481, 22, -5510.57, -2000.05, 399.5, 0, 0, 0, 0, 0),
(4481, 23, -5508.87, -1966.94, 399.491, 0, 0, 0, 0, 0),
(4481, 24, -5492.39, -1933, 398.477, 0, 0, 0, 0, 0),
(4481, 25, -5493.69, -1899.95, 397.227, 0, 0, 0, 0, 0),
(4481, 26, -5512.36, -1866.3, 397.227, 0, 0, 0, 0, 0),
(4481, 27, -5514.83, -1833.99, 397.227, 0, 0, 0, 0, 0),
(4481, 28, -5513.12, -1800.14, 397.227, 0, 0, 0, 0, 0),
(4481, 29, -5509.97, -1767.26, 397.227, 0, 0, 0, 0, 0),
(4481, 30, -5511.72, -1733.24, 397.207, 0, 0, 0, 0, 0),
(4481, 31, -5521.07, -1699.96, 396.058, 0, 0, 0, 0, 0),
(4481, 32, -5533.73, -1690.23, 394.275, 0, 0, 0, 0, 0),
(4481, 33, -5542.76, -1683.47, 392.9, 0, 0, 0, 0, 0),
(4481, 34, -5544.93, -1666.15, 391.866, 0, 0, 0, 0, 0),
(4481, 35, -5551.39, -1632.83, 391.819, 0, 0, 0, 0, 0),
(4481, 36, -5560.19, -1613.15, 391.819, 0, 0, 0, 0, 0),
(4481, 37, -5554.9, -1584.19, 396.246, 0, 0, 0, 0, 0),
(4481, 38, -5568.58, -1553.51, 399.144, 0, 0, 0, 0, 0),
(4481, 39, -5600.81, -1544.38, 399.313, 0, 0, 0, 0, 0),
(4481, 40, -5613.15, -1514.62, 399.191, 0, 3000, 0, 0, 0);
UPDATE `creature` SET `position_x`=-793.447, `position_y`=-3186.98, `position_z`=82.0687, `orientation`=4.5209 WHERE `id`=2764;
UPDATE `creature` SET `position_x`=-792.447, `position_y`=-3185.98, `position_z`=82.0687, `orientation`=4.76853 WHERE `id`=2765;
UPDATE `creature` SET `position_x`=-794.447, `position_y`=-3187.98, `position_z`=82.0687, `orientation`=3.65418 WHERE `id`=2611;
UPDATE `creature` SET `position_x`=-791.447, `position_y`=-3184.98, `position_z`=82.0687, `orientation`=3.22483 WHERE `id`=4063;
DELETE FROM `creature_groups` WHERE `leader_guid`=52065;
UPDATE `creature` SET `position_x` = -8594.089844, `position_y` = 1400.844116, `position_z` = -67.280495, `orientation` = 6.144146 WHERE `guid` = 87990;
UPDATE `creature` SET `position_x`=3041.776, `position_y`=473.213, `position_z`=5.47, `orientation`=0 WHERE `guid`=156139;
DELETE FROM `creature_groups` WHERE `leader_guid`=301321;
UPDATE `creature` SET `position_x`=-31.738, `position_y`=-888.847, `position_z`=56.058, `orientation`=2.17 WHERE `guid`=15544;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
