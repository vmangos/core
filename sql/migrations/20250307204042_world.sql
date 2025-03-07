DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250307204042');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250307204042');
-- Add your query below.

-- Update spawnpoints (credit cmangos)
UPDATE `creature` SET `position_x` = -4181.31005859375, `position_y` = -2184.330078125, `position_z` = 50.26649856567383, `orientation` = 0.2923249900341034 WHERE `guid` = 13984 AND `id` = 3392;
UPDATE `creature` SET `position_x` = -4134.08984375, `position_y` = -2190.56005859375, `position_z` = 50.93259811401367, `orientation` = 5.971350193023682 WHERE `guid` = 14326 AND `id` = 3392;
UPDATE `creature` SET `position_x` = -4208.52001953125, `position_y` = -2274.22998046875, `position_z` = 50.26689910888672, `orientation` = 3.9258201122283936 WHERE `guid` = 14325 AND `id` = 3392;
UPDATE `creature` SET `position_x` = -4176.35009765625, `position_y` = -2235.199951171875, `position_z` = 51.03120040893555, `orientation` = 5.194900035858154 WHERE `guid` = 14324 AND `id` = 3392;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;