DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210312231945');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210312231945');
-- Add your query below.


DELETE FROM `gameobject` WHERE `guid` IN (332887, 332888, 332889) AND `id` = 2904;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `state`, `spawntimesecsmin`, `spawntimesecsmax`) VALUES 
(332887, 2904, 1, -2544.54, -712.088, -9.232, 0.767944, 1, -60, -60),
(332888, 2904, 1, -1823.85, -237.555, -9.42485, 0.069812, 1, -60, -60),
(332889, 2904, 1, -753.256, -149.158, -29.0568, 3.08918, 1, -60, -60);

DELETE FROM `event_scripts` WHERE `id` IN (466, 467, 468);
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(466, 0, 9, 332887, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Winterhoof Cleansing - Respawn Water Well Cleansing Aura (GUID: 332887)"),
(467, 0, 9, 332888, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Thunderhorn Cleansing - Respawn Water Well Cleansing Aura (GUID: 332888)"),
(468, 0, 9, 332889, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Wildmane Cleansing - Respawn Water Well Cleansing Aura (GUID: 332889)");

-- Fixed Okla position
UPDATE `creature` SET `position_x` = 270.076, `position_y` = -3036.6, `position_z` = 97.6192 WHERE `id` = 14873;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
