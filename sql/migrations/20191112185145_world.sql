DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20191112185145');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20191112185145');
-- Add your query below.


-- Feathermoon Sentinel
UPDATE `creature_movement` SET `position_x` = -4374.089355, `position_y` = 3288.326416, `position_z` = 13.564932 WHERE `id` = 49969 AND `point` = 4;

-- Argent Sentry
DELETE FROM `creature_movement` WHERE `id` = 60003;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `wander_distance`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES
(60003, 1, 2264.13, -5312.18, 81.88, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(60003, 2, 2258.24, -5319.82, 81.66, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(60003, 3, 2254.18, -5324.55, 82.08, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(60003, 4, 2238.68, -5311.63, 82.17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(60003, 5, 2250.41, -5291.89, 82.16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
