DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250307204042');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250307204042');
-- Add your query below.

-- Prospector Khazgorm (credit cmangos)
UPDATE `creature` SET `position_x` = -4181.31005859375, `position_y` = -2184.330078125, `position_z` = 50.26649856567383, `orientation` = 0.2923249900341034 WHERE `guid` = 13984 AND `id` = 3392;
UPDATE `creature` SET `position_x` = -4134.08984375, `position_y` = -2190.56005859375, `position_z` = 50.93259811401367, `orientation` = 5.971350193023682 WHERE `guid` = 14326 AND `id` = 3392;
UPDATE `creature` SET `position_x` = -4208.52001953125, `position_y` = -2274.22998046875, `position_z` = 50.26689910888672, `orientation` = 3.9258201122283936 WHERE `guid` = 14325 AND `id` = 3392;
UPDATE `creature` SET `position_x` = -4176.35009765625, `position_y` = -2235.199951171875, `position_z` = 51.03120040893555, `orientation` = 5.194900035858154 WHERE `guid` = 14324 AND `id` = 3392;

INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES 
(4130,-1,4105,4018,0,0,0); -- Player is Tauren and Patch is 1.10 or later

UPDATE `gossip_menu` SET `condition_id` = 4130, `text_id` = 8370 WHERE `entry` = 4015 AND `text_id` = 8368; -- Velma Warnam
UPDATE `gossip_menu` SET `condition_id` = 4130 WHERE `entry` = 4022 AND `text_id` = 8407; -- Xar'Ti

-- Correct lockId for Jinxed Hoodoo Pile according to both 1.8 and Classic sniffs
UPDATE `gameobject_template` SET `data0` = 43 WHERE `entry` IN (180228, 180229);

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
