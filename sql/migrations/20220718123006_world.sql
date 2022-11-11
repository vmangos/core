DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220718123006');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220718123006');
-- Add your query below.


-- Add missing Large Mithril Bound Chest spawns in Dire Maul.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES 
(429030, 153469, 429, 122.562, 392.1, 28.601, 3.07177, 0, 0, 0.999391, 0.0349061, 36000, 36000, 1, 100, 0, 10),
(429031, 153469, 429, 476.613, 570.668, 27.9231, 4.88692, 0, 0, -0.642787, 0.766045, 36000, 36000, 1, 100, 0, 10),
(429032, 153469, 429, 43.2012, -383.143, -58.6196, 4.55531, 0, 0, -0.760406, 0.649449, 36000, 36000, 1, 100, 0, 10),
(429033, 153469, 429, 122.574, 366.941, -3.48382, 2.89725, 0, 0, 0.992546, 0.12187, 36000, 36000, 1, 100, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(4302, 1, 'Dire Maul - Large Mithril Bound Chest', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`) VALUES
(429030, 4302, 0, 'Dire Maul - Large Mithril Bound Chest', 0),
(429031, 4302, 0, 'Dire Maul - Large Mithril Bound Chest', 0),
(429032, 4302, 0, 'Dire Maul - Large Mithril Bound Chest', 0),
(429033, 4302, 0, 'Dire Maul - Large Mithril Bound Chest', 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
