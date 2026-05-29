DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260528232744');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260528232744');
-- Add your query below.


-- Sniffed Magister Kalendris, previous was hand spawned
UPDATE `creature` SET `position_x` = -106.239, `position_y` = 575.648, `position_z` = -4.3122, `orientation` = 5.68977 WHERE `guid` = 56802;

-- Sniffed Storm Shadowhoof from wowemu, previous was hand spawned
UPDATE `creature` SET `position_x` = 5107.82, `position_y` = -361.647, `position_z` = 357.204, `orientation` = 0.733038 WHERE `guid` = 41759;

-- Sniffed Grazzle from wowemu, previous was hand spawned
UPDATE `creature` SET `position_x` = 6821.94, `position_y` = -2082.56, `position_z` = 623.264, `orientation` = 3.31613 WHERE `guid` = 39107;

-- Twilight Avenger was missing min patch in area that was changed in 1.8
UPDATE `creature` SET `patch_min` = 6 WHERE `guid` = 42985;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
