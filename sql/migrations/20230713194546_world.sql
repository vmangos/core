DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230713194546');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230713194546');
-- Add your query below.


-- The Deadmines / 75293
DELETE FROM `pool_gameobject` WHERE `guid` IN (26198, 26210, 30538, 30540, 25445);
DELETE FROM `pool_template` WHERE `entry` = 1500;

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(253, 2, 'Deadmines - Large Battered Chest', 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(26198, 253, 'Deadmines - Large Battered Chest'),
(26210, 253, 'Deadmines - Large Battered Chest'),
(30538, 253, 'Deadmines - Large Battered Chest'),
(30540, 253, 'Deadmines - Large Battered Chest'),
(25445, 253, 'Deadmines - Large Battered Chest');

-- Wailing Caverns / 75293
DELETE FROM `pool_template` WHERE `entry` IN (SELECT `pool_entry` FROM `pool_gameobject` WHERE `guid` IN (31999, 35621, 35647, 35652, 25446));
DELETE FROM `pool_gameobject` WHERE `guid` IN (31999, 35621, 35647, 35652, 25446);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(286, 75293, 43, -313.264, -235.066, -62.8271, 1.02974, 0, 0, 0.492423, 0.870356, 604800, 604800, 100, 1, 0, 0, 0, 10),
(287, 75293, 43, 1.16489, -44.9435, -65.5114, 1.18682, 0, 0, 0.559193, 0.829038, 604800, 604800, 100, 1, 0, 0, 0, 10),
(288, 75293, 43, 29.6232, 531.781, -56.9991, 5.58505, 0, 0, -0.34202, 0.939693, 604800, 604800, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(254, 2, 'Wailing Caverns - Large Battered Chest', 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(286, 254, 'Wailing Caverns - Large Battered Chest'),
(287, 254, 'Wailing Caverns - Large Battered Chest'),
(288, 254, 'Wailing Caverns - Large Battered Chest'),
(31999, 254, 'Wailing Caverns - Large Battered Chest'),
(35621, 254, 'Wailing Caverns - Large Battered Chest'),
(35647, 254, 'Wailing Caverns - Large Battered Chest'),
(35652, 254, 'Wailing Caverns - Large Battered Chest'),
(25446, 254, 'Wailing Caverns - Large Battered Chest');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
