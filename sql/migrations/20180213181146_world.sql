DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180213181146');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180213181146');
-- Add your query below.

DELETE FROM `gameobject` WHERE `guid` = 3998629;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES
(3998629, 181254, 0, 1583.16, 240.44, -62.0772, 3.12447, 0, 0, 0.999963, 0.00855956, 25, 25, 100, 1, 0, 0, 0, 10);

DELETE FROM `game_event_gameobject` WHERE `guid` = 3998629;
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (3998629, 17);

UPDATE `creature` SET `position_x`=1578.87, `position_y`=238.628, `position_z`=-62.0773, `orientation`=3.16373 WHERE `guid`=1242983;
UPDATE `creature` SET `position_x`=1579.28, `position_y`=245.156, `position_z`=-62.0773, `orientation`=3.0577 WHERE `guid`=1242984;
UPDATE `creature` SET `position_x`=1579.16, `position_y`=242.194, `position_z`=-62.0773, `orientation`=3.0577 WHERE `guid`=1243007;
UPDATE `creature` SET `position_x`=1579.64, `position_y`=234.629, `position_z`=-62.0772, `orientation`=2.97366 WHERE `guid`=1242982;

UPDATE `gameobject` SET `position_x`=1580.47, `position_y`=243.832, `position_z`=-62.0771, `orientation`=2.1702 WHERE `guid`=3996902;
UPDATE `gameobject` SET `position_x`=1580.31, `position_y`=236.793, `position_z`=-62.0773, `orientation`=3.94913 WHERE `guid`=3996903;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
