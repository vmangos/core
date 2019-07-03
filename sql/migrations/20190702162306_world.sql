DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190702162306');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190702162306');
-- Add your query below.


-- BRD pool for Large Mithril Bound Chest and Large Solid Chest.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (42910, 1, 'BRD: Large Chest', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (349151, 42910, 0, 'BRD: Large Mithril Bound Chest', 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (349152, 42910, 0, 'BRD: Large Solid Chest', 0, 0, 10);
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (349151, 153469, 229, 86.8551, -587.501, 30.6085, 3.05779, 0, 0, 0.999122, 0.0418896, 36000, 36000, 100, 1, 0, 0, 0, 10);
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (349152, 153464, 229, 86.8551, -587.501, 30.6085, 3.05779, 0, 0, 0.999122, 0.0418896, 36000, 36000, 100, 1, 0, 0, 0, 10);

-- Add Pooling for Large Solid Chest 153463 & Large Mithril Bound Chest 153468 - Hearthglen
DELETE FROM `gameobject` WHERE `id` IN (153463,153468);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES
(45486, 153463, 0, 2939.019, -1376.045, 167.2374, -1.186824, 0, 0, 0, 0, 7200, 7200, 100, 1), -- Large Solid Chest
(45493, 153468, 0, 2939.019, -1376.045, 167.2374, -1.186824, 0, 0, 0, 0, 7200, 7200, 100, 1), -- Large Mithril Bound Chest
(45516, 153463, 0, 2989.212, -1601.668, 184.4491, 2.495821, 0, 0, 0, 0, 7200, 7200, 100, 1), -- Large Solid Chest
(45520, 153468, 0, 2989.212, -1601.668, 184.4491, 2.495821, 0, 0, 0, 0, 7200, 7200, 100, 1), -- Large Mithril Bound Chest
(45537, 153463, 0, 2851.745, -1403.158, 148.9066, 0.523598, 0, 0, 0, 0, 7200, 7200, 100, 1), -- Large Solid Chest
(45553, 153468, 0, 2851.745, -1403.158, 148.9066, 0.523598, 0, 0, 0, 0, 7200, 7200, 100, 1); -- Large Mithril Bound Chest

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES
(39801, 1, 'Western Plaguelands (Hearthglen) - Large Solid Chest (153463) / Large Mithril Bound Chest (153468) - #1'),
(39802, 1, 'Western Plaguelands (Hearthglen) - Large Solid Chest (153463) / Large Mithril Bound Chest (153468) - #2'),
(39803, 1, 'Western Plaguelands (Hearthglen) - Large Solid Chest (153463) / Large Mithril Bound Chest (153468) - #3'),
(39934, 1, 'Western Plaguelands (51-58) - Master Chest Pool');

-- Add to Western Plaguelands (51-58) - Master Chest Pool 39934
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`) VALUES
(39801, 39934, 0, 'Western Plaguelands - Large Solid Chest (153463) / Large Mithril Bound Chest (153468) - #1'),
(39802, 39934, 0, 'Western Plaguelands - Large Solid Chest (153463) / Large Mithril Bound Chest (153468) - #2'),
(39803, 39934, 0, 'Western Plaguelands - Large Solid Chest (153463) / Large Mithril Bound Chest (153468) - #3');

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`) VALUES
(45486, 39801, 0, 'Western Plaguelands - Large Solid Chest (153463)'),
(45493, 39801, 0, 'Western Plaguelands - Large Mithril Bound Chest (153468)'),
(45516, 39802, 0, 'Western Plaguelands - Large Solid Chest (153463)'),
(45520, 39802, 0, 'Western Plaguelands - Large Mithril Bound Chest (153468)'),
(45537, 39803, 0, 'Western Plaguelands - Large Solid Chest (153463)'),
(45553, 39803, 0, 'Western Plaguelands - Large Mithril Bound Chest (153468)');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
