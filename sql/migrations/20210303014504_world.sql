DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210303014504');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210303014504');
-- Add your query below.


-- Add missing spawns for Booty Bay Elite during the Stranglethorn Fishing Tournament.
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `wander_distance`, `movement_type`, `spawntimesecsmin`, `spawntimesecsmax`, `patch_min`, `patch_max`) VALUES 
(54700, 15088, 0, -14449.2, 482.691, 15.1322, 5.53269, 0, 0, 300, 300, 5, 10),
(54701, 15088, 0, -14434, 467.192, 15.4505, 3.1765, 0, 0, 300, 300, 5, 10);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES
(54700, 40),
(54701, 40);

-- Correct spawn position of Jang.
UPDATE `creature` SET `position_x`=-14436.3, `position_y`=472.755, `position_z`=15.4215, `orientation`=3.29867 WHERE `id`=15078;

-- Correct spawn position of Riggle Bassbait.
UPDATE `creature` SET `position_x`=-14438, `position_y`=474.425, `position_z`=16.005, `orientation`=3.71755 WHERE `id`=15077;

-- Correct spawn position of Fishbot 5000.
UPDATE `creature` SET `position_x`=-14438.7, `position_y`=476.31, `position_z`=15.3591, `orientation`=4.04916 WHERE `id`=15079;

-- Correct scale of Fishbot 5000.
UPDATE `creature_template` SET `display_scale1`=0 WHERE `entry`=15079;

-- Add missing Soapbox spawn.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `state`, `animprogress`) VALUES
(20463, 180403, 0, -14438, 474.412, 15.3034, 3.64774, 0, 0, -0.968147, 0.250381, 1, 100);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES
(20463, 40);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
