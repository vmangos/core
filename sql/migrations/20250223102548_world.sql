DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250223102548');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250223102548');
-- Add your query below.


-- Cat Figurine
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(331, 13359, 1, 7562.97, -1075.73, 40.8529, 0.977384, 0, 0, 0.469472, 0.882948, 180, 180, 100, 1, 0, 10), -- Darkshore
(332, 13873, 1, 7562.97, -1075.73, 40.8529, 0.977384, 0, 0, 0.469472, 0.882948, 180, 180, 100, 1, 0, 10); -- Darkshore
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(519, 1, 'Cat Figurine - Darkshore', 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(331, 519, 'Cat Figurine - Darkshore', 0, 10),
(332, 519, 'Cat Figurine - Darkshore', 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(519, 16993, 0, 'Cat Figurine - Darkshore', 0);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Cat Figurine - Darkshore" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 13359);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Cat Figurine - Darkshore" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 13873);

-- Shellfish Trap
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(333, 176635, 1, -2136.81, 3421.63, -49.4686, -0.994838, 0, 0, 0.477159, -0.878817, 180, 180, 100, 1, 0, 10), -- Desolace
(343, 176582, 1, -2136.81, 3421.63, -49.4686, -0.994838, 0, 0, 0.477159, -0.878817, 180, 180, 100, 1, 0, 10), -- Desolace
(345, 176592, 1, -2136.81, 3421.63, -49.4686, -0.994838, 0, 0, 0.477159, -0.878817, 180, 180, 100, 1, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(520, 1, 'Shellfish Trap - Desolace', 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(333, 520, 'Shellfish Trap - Desolace', 0, 10),
(343, 520, 'Shellfish Trap - Desolace', 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(665, 11, 'Desolace - Shellfish Trap (Master Pool)', 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(520, 665, 0, 'Desolace - Shellfish Trap', 0),
(20058, 665, 0, 'Desolace - Shellfish Trap', 0),
(20059, 665, 0, 'Desolace - Shellfish Trap', 0),
(20060, 665, 0, 'Desolace - Shellfish Trap', 0),
(20061, 665, 0, 'Desolace - Shellfish Trap', 0),
(20062, 665, 0, 'Desolace - Shellfish Trap', 0),
(20063, 665, 0, 'Desolace - Shellfish Trap', 0),
(20064, 665, 0, 'Desolace - Shellfish Trap', 0),
(20065, 665, 0, 'Desolace - Shellfish Trap', 0),
(20066, 665, 0, 'Desolace - Shellfish Trap', 0),
(20067, 665, 0, 'Desolace - Shellfish Trap', 0),
(20068, 665, 0, 'Desolace - Shellfish Trap', 0),
(20069, 665, 0, 'Desolace - Shellfish Trap', 0),
(20070, 665, 0, 'Desolace - Shellfish Trap', 0),
(20071, 665, 0, 'Desolace - Shellfish Trap', 0),
(20072, 665, 0, 'Desolace - Shellfish Trap', 0),
(20073, 665, 0, 'Desolace - Shellfish Trap', 0),
(20074, 665, 0, 'Desolace - Shellfish Trap', 0),
(20075, 665, 0, 'Desolace - Shellfish Trap', 0),
(20076, 665, 0, 'Desolace - Shellfish Trap', 0);

-- Giant Clam
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(850, 19017, 0, -9969.92, 1991.11, -16.9362, 2.42601, 0, 0, 0.936672, 0.350207, 300, 300, 100, 1, 0, 10), -- Westfall
(851, 19017, 1, 7759.61, -292.101, -7.31628, -0.366519, 0, 0, 0.182236, -0.983255, 300, 300, 100, 1, 0, 10); -- Darkshore
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(851, 1344, 'Giant Clam', 10);

-- Giant Clam
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(852, 19018, 0, -2892.33, -775.354, -13.9639, 0.994838, 0, 0, 0.477159, 0.878817, 300, 300, 100, 1, 0, 10), -- Wetlands
(854, 19018, 48, -346.634, 291.605, -70.7872, 3.10669, 0, 0, 0.999848, 0.0174524, 604800, 604800, 100, 1, 0, 10), -- Blackfathom Deeps
(855, 19018, 48, -450.111, 130.313, -71.376, -2.67035, 0, 0, 0.97237, -0.233445, 604800, 604800, 100, 1, 0, 10), -- Blackfathom Deeps
(857, 19018, 48, -790.217, -176.527, -45.1692, 2.19911, 0, 0, 0.891007, 0.453991, 604800, 604800, 100, 1, 0, 10); -- Blackfathom Deeps
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(852, 1340, 'Giant Clam', 10),
(854, 1341, 'Giant Clam', 10),
(855, 1341, 'Giant Clam', 10),
(857, 1341, 'Giant Clam', 10);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
