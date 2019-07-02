DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190702162306');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190702162306');
-- Add your query below.


INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (39934, 1, 'Western Plaguelands - Large Mithril Bound Chest', 0, 0, 0, 10);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(45486, 39934, 0, 'Western Plaguelands - Large Mithril Bound Chest (153468)'),
(45520, 39934, 0, 'Western Plaguelands - Large Mithril Bound Chest (153468)');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (45486, 153468, 0, 2989.21, -1601.67, 184.449, 2.49582, 0, 0, 0.948324, 0.317305, 7200, 7200, 100, 1, 0, 0, 0, 10);
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (45520, 153468, 0, 2939.02, -1376.05, 167.237, -1.18682, 0, 0, 0, 0, 7200, 7200, 100, 1, 0, 0, 0, 10);
UPDATE `gameobject` SET `spawntimesecsmin`=7200, `spawntimesecsmax`=7200 WHERE `id`=153468;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
