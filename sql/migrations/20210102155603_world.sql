DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210102155603');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210102155603');
-- Add your query below.


-- Correct location of existing objects.
UPDATE `gameobject` SET `position_x`=-10323.3, `position_y`=-4046.11, `position_z`=19.3957, `orientation`=3.73501, `rotation0`=0, `rotation1`=0, `rotation2`=-0.956305, `rotation3`=0.292372 WHERE `guid`=16292;
UPDATE `gameobject` SET `position_x`=-10152.7, `position_y`=-3412.05, `position_z`=20.9586, `orientation`=2.82743, `rotation0`=0, `rotation1`=0, `rotation2`=0.987688, `rotation3`=0.156436 WHERE `guid`=16352;
UPDATE `gameobject` SET `position_x`=-10282.2, `position_y`=-4127.25, `position_z`=20.4355, `orientation`=1.01229, `rotation0`=0, `rotation1`=0, `rotation2`=0.484809, `rotation3`=0.87462 WHERE `guid`=16305;
UPDATE `gameobject` SET `position_x`=-10432, `position_y`=-4027.46, `position_z`=20.0639, `orientation`=5.68977, `rotation0`=0, `rotation1`=0, `rotation2`=-0.292372, `rotation3`=0.956305 WHERE `guid`=16334;
UPDATE `gameobject` SET `position_x`=-10423.7, `position_y`=-4184.89, `position_z`=20.2066, `orientation`=1.91986, `rotation0`=0, `rotation1`=0, `rotation2`=0.819152, `rotation3`=0.573577 WHERE `guid`=16338;
UPDATE `gameobject` SET `position_x`=-10522.3, `position_y`=-4139.03, `position_z`=21.5456, `orientation`=5.18363, `rotation0`=0, `rotation1`=0, `rotation2`=-0.522498, `rotation3`=0.852641 WHERE `guid`=16317;


-- Missing spawns in Swamp of Sorrows.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (13969, 142143, 0, -10404.5, -3001.07, 19.5577, 5.86431, 0, 0, -0.207912, 0.978148, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (13969, 1312, 'Blindweed');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (14003, 142143, 0, -10214.5, -3286.44, 19.6038, 5.65487, 0, 0, -0.309016, 0.951057, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (14003, 1312, 'Blindweed');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (14008, 142143, 0, -10712.2, -4157.51, 19.7038, 0.383971, 0, 0, 0.190808, 0.981627, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (14008, 1312, 'Blindweed');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (14016, 142143, 0, -10136.7, -3063.92, 21.7756, 0.802851, 0, 0, 0.390731, 0.920505, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (14016, 1312, 'Blindweed');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (14018, 142143, 0, -10232.5, -2951.34, 19.3253, 1.6057, 0, 0, 0.719339, 0.694659, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (14018, 1312, 'Blindweed');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (14019, 142143, 0, -10208.6, -3183.85, 18.7951, 2.70526, 0, 0, 0.976295, 0.216442, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (14019, 1312, 'Blindweed');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
