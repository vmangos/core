DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240413183703');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240413183703');
-- Add your query below.


-- Add patch to primary key of table.
ALTER TABLE `pool_template`
	DROP PRIMARY KEY,
	ADD PRIMARY KEY (`entry`, `patch_min`, `patch_max`);

/*
 World of Warcraft Client Patch 1.7.0 (2005-09-13)
 - Significantly more Stranglekelp has started washing ashore to the
   beaches of the world.
*/
DELETE FROM `pool_template` WHERE `entry` IN (984, 1000, 1064, 1065, 1076, 1122, 1123, 1145, 1149, 1171, 1190, 1322);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
-- Pre 1.7
(984, 7, 'Stranglekelp in Swamp of Sorrows', 0, 0, 0, 4),
(1000, 6, 'Stranglekelp in Hinterlands', 0, 0, 0, 4),
(1064, 10, 'Stranglekelp in Barrens', 0, 0, 0, 4),
(1065, 5, 'Stranglekelp in Silverpine Forest', 0, 0, 0, 4),
(1076, 11, 'Stranglekelp in Ashenvale', 0, 0, 0, 4),
(1122, 9, 'Stranglekelp in Westfall', 0, 0, 0, 4),
(1123, 11, 'Stranglekelp in Hillsbrad Foothills', 0, 0, 0, 4),
(1145, 8, 'Stranglekelp in Desolace', 0, 0, 0, 4),
(1149, 19, 'Stranglekelp in Wetlands', 0, 0, 0, 4),
(1171, 23, 'Stranglekelp in Stranglethorn', 0, 0, 0, 4),
(1190, 4, 'Stranglekelp in Feralas', 0, 0, 0, 4),
(1322, 13, 'Stranglekelp in Darkshore', 0, 0, 0, 4),
-- Post 1.7
(984, 14, 'Stranglekelp in Swamp of Sorrows', 0, 0, 5, 10),
(1000, 12, 'Stranglekelp in Hinterlands', 0, 0, 5, 10),
(1064, 19, 'Stranglekelp in Barrens', 0, 0, 5, 10),
(1065, 9, 'Stranglekelp in Silverpine Forest', 0, 0, 5, 10),
(1076, 22, 'Stranglekelp in Ashenvale', 0, 0, 5, 10),
(1122, 17, 'Stranglekelp in Westfall', 0, 0, 5, 10),
(1123, 21, 'Stranglekelp in Hillsbrad Foothills', 0, 0, 5, 10),
(1145, 15, 'Stranglekelp in Desolace', 0, 0, 5, 10),
(1149, 38, 'Stranglekelp in Wetlands', 0, 0, 5, 10),
(1171, 45, 'Stranglekelp in Stranglethorn', 0, 0, 5, 10),
(1190, 8, 'Stranglekelp in Feralas', 0, 0, 5, 10),
(1322, 26, 'Stranglekelp in Darkshore', 0, 0, 5, 10);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
