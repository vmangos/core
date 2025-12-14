DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240619170801');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240619170801');
-- Add your query below.


-- Correct spawn positions for Andorov and his squad.
UPDATE `creature` SET `position_x`=-8538.177, `position_y`=1486.0956, `position_z`=32.39054, `orientation`=4.052182197570800781 WHERE `guid`=301311;
UPDATE `creature` SET `position_x`=-8540.537, `position_y`=1488.1968, `position_z`=32.43361, `orientation`=4.310963153839111328 WHERE `guid`=301312;
UPDATE `creature` SET `position_x`=-8538.09, `position_y`=1488.2867, `position_z`=32.484314, `orientation`=4.118977069854736328 WHERE `guid`=301313;
UPDATE `creature` SET `position_x`=-8536.235, `position_y`=1486.573, `position_z`=32.432724, `orientation`=3.926990747451782226 WHERE `guid`=301314;
UPDATE `creature` SET `position_x`=-8535.949, `position_y`=1484.2108, `position_z`=32.336636, `orientation`=4.066617012023925781 WHERE `guid`=301315;

-- Correct Andorov's waypoints.
DELETE FROM `creature_movement_template` WHERE `entry`=15471;
REPLACE INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`, `path_id`) VALUES 
(15471, 1, -8583.434, 1453.6205, 31.924183, 100, 0, 0, 0, 0),
(15471, 2, -8623.171, 1470.4077, 31.90701, 100, 0, 0, 0, 0),
(15471, 3, -8638.66, 1486.67, 32.8086, 100, 0, 0, 0, 0),
(15471, 4, -8652.15, 1500.83, 32.6656, 100, 0, 0, 0, 0),
(15471, 5, -8668.32, 1520.76, 32.0071, 100, 0, 0, 0, 0),
(15471, 6, -8694.01, 1552.81, 32.0866, 100, 0, 0, 0, 0),
(15471, 7, -8710.79, 1571.02, 26.5108, 100, 0, 0, 0, 0),
(15471, 8, -8737.69, 1596.18, 21.5802, 100, 0, 0, 0, 0),
(15471, 9, -8771.53, 1614.14, 21.5793, 100, 0, 0, 0, 0),
(15471, 10, -8809.16, 1622.42, 20.1552, 100, 0, 0, 0, 0),
(15471, 11, -8845.42, 1633.81, 19.7999, 100, 1000, 0, 0, 0),
(15471, 12, -8870.72, 1648.4, 21.5113, 5.63741, 1000, 0, 1547101, 0),
(15471, 13, -8870.72, 1648.4, 21.5113, 5.63741, 0, 0, 0, 0);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
